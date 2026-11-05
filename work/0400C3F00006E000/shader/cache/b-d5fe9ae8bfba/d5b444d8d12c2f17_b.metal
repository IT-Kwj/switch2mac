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
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_83 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_91 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_99 [[user(locn6)]];
    float4 m_95 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_97 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 m_93 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_69 [[user(locn13)]];
    float4 m_89 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_87 [[attribute(0)]];
    float4 m_71 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_77 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_79 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4408 = false;
    bool _3405 = false;
    bool _402 = false;
    bool _222 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_51.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4713 = as_type<float>(_134);
        out.gl_Position.z = _4713;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_53.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = _152;
    if (_148)
    {
        float _156 = float(_118);
        _128 = _156;
    }
    float _158 = _128;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    float _166 = _158;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_51.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4783 = as_type<float>(_172);
        out.gl_Position.z = _4783;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = _176 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _184 = _176 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _186 = _176 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _188 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].x, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].x, _186);
    float _194 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[4].z, _188);
    float _196 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[5].z, _190);
    float _198 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[6].z, _192);
    bool _200 = !_180;
    float _202 = _198;
    float _220;
    if (!_200)
    {
        float _204 = in.m_57.x;
        float _206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _210 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _212 = _210 * _206;
        float _214 = floor(_212);
        float _216 = -_214;
        float _218 = _212 + _216;
        _220 = _218;
        _222 = true;
    }
    else
    {
        float _224 = float(_118);
        float _226 = 1.0 / _224;
        float _228 = _152 * _226;
        _220 = _228;
    }
    _222 = false;
    float _230 = _220;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = _230 + _232;
    bool _236 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _238 = isnan(_230);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _230 + _248;
    bool _252 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _254 = isnan(_230);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _268 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _272 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _274 = isnan(_230);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -_246;
    float _286 = _284 + 1.0;
    float _288 = 1.0 / _270;
    float _290 = _282 * _286;
    float _292 = -_282;
    float _294 = _292 + 1.0;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _296;
    float _300 = in.m_59.x;
    float _302 = in.m_59.y;
    float _304 = in.m_59.z;
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _308 = 1.0 / _266;
    float _310 = _262 * _294;
    float _312 = -_262;
    float _314 = _312 + 1.0;
    float _316 = _250 * _288;
    float _318 = _234 * _308;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _324;
    float _328 = fma(_298, _318, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _330 = fma(_322, _318, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _332 = fma(_326, _318, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _334 = _328 * _310;
    float _336 = _330 * _310;
    float _338 = _332 * _310;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _352 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].x, _334);
    float _354 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].y, _336);
    float _356 = fma(_342, _316, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _358 = fma(_346, _316, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _360 = fma(_350, _316, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _362 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].z, _338);
    float _364 = fma(_356, _290, _352);
    float _366 = fma(_358, _290, _354);
    float _368 = fma(_360, _290, _362);
    float _370 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[145].x, _364);
    float _372 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[145].y, _366);
    float _374 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[145].z, _368);
    float _376 = _370 * _300;
    float _378 = _372 * _302;
    float _380 = _374 * _304;
    bool _382 = !_306;
    float _400;
    if (!_382)
    {
        float _384 = in.m_57.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_118);
        float _406 = 1.0 / _404;
        float _408 = _152 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _414 = int(_412);
    float _416 = in.m_57.x;
    float _418 = in.m_57.y;
    float _420 = float(_118);
    float _422 = in.m_61.x;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _426 = _424 != 0;
    float _428 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _430 = int(_428);
    float _432 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _434 = int(_432);
    float _436 = float(_414);
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _444 = float(_430);
    float _446 = 1.0 / _436;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _450 = float(uint(_434));
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _454 = int(_452);
    int _456 = ~_434;
    int _458 = _456 + 1;
    bool _460 = _434 == 0;
    int _462 = ~_434;
    int _464 = _462 + 1;
    float _466 = 1.0 / _444;
    float _468 = _152 * _446;
    float _470 = float(uint(_454));
    float _472 = 1.0 / _450;
    int _474 = ~_454;
    int _476 = _474 + 1;
    int _478 = ~_454;
    int _480 = _478 + 1;
    float _482 = _152 * _466;
    float _484 = trunc(_468);
    int _486 = int(_484);
    float _488 = _466;
    float _490 = _422;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_426)
    {
        float _494 = in.m_57.x;
        _488 = _494;
    }
    float _496 = _488;
    float _498 = _496;
    if (!_426)
    {
        float _500 = in.m_57.y;
        _498 = _500;
    }
    float _502 = _498;
    float _504 = 1.0 / _470;
    int _506 = as_type<int>(_472) + (-2);
    float _508 = trunc(_482);
    int _510 = int(_508);
    float _512 = float(uint(_486));
    float _514 = as_type<float>(_506) * _512;
    int _516 = as_type<int>(_504) + (-2);
    float _518 = 1.0 / _420;
    int _520 = ~_454;
    int _522 = _520 + 1;
    float _524 = float(uint(_510));
    float _526 = trunc(_514);
    float _528 = precise::max(_526, 0.0);
    uint _531 = uint(_528);
    float _533 = as_type<float>(_516) * _524;
    int _535 = ~_434;
    int _537 = _535 + 1;
    float _539 = trunc(_533);
    float _541 = precise::max(_539, 0.0);
    uint _543 = uint(_541);
    int _545 = _537 * int(_531);
    int _547 = _545 + _486;
    float _549 = 1.0 / _442;
    float _551 = float(uint(_547));
    int _553 = _522 * int(_543);
    int _555 = _553 + _510;
    float _557 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _559 = int(_557);
    float _561 = as_type<float>(_506) * _551;
    float _563 = _551;
    if (_426)
    {
        _563 = 1.0;
    }
    float _565 = _563;
    float _567 = float(uint(_555));
    float _569 = _565;
    if (!_426)
    {
        _569 = 7.345489978790283203125;
    }
    float _571 = _569;
    float _573 = trunc(_561);
    float _575 = precise::max(_573, 0.0);
    uint _577 = uint(_575);
    float _579 = as_type<float>(_516) * _567;
    float _581 = _571 * _416;
    float _583 = trunc(_579);
    float _585 = precise::max(_583, 0.0);
    uint _587 = uint(_585);
    int _589 = int(_531) + int(_577);
    float _591 = floor(_581);
    float _593 = float(_434);
    float _595 = as_type<float>(_577);
    if (_426)
    {
        _595 = 1.0;
    }
    float _597 = _595;
    int _599 = _458 * _589;
    int _601 = _599 + _486;
    float _603 = _597;
    if (!_426)
    {
        _603 = 1.2345600128173828125;
    }
    float _605 = _603;
    int _607 = int(_543) + int(_587);
    float _609 = float(_486);
    float _611 = _502 * _605;
    bool _613 = uint(_601) >= uint(_434);
    int _615 = _476 * _607;
    int _617 = _615 + _510;
    bool _619 = _609 >= _593;
    bool _621 = isnan(_609);
    bool _623 = _619 || _621;
    bool _625 = isnan(_593);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    bool _631 = !_613;
    int _633 = _631 ? 0 : (-1);
    float _635 = -_591;
    float _637 = _581 + _635;
    float _639 = trunc(_629);
    int _641 = int(_639);
    int _643 = ~_589;
    int _645 = _643 + _633;
    int _647 = _645 + 1;
    float _649 = _637 * _593;
    float _651 = _152 * _593;
    bool _653 = uint(_617) >= uint(_454);
    int _655 = _434 * _647;
    int _657 = _655 + _486;
    float _659 = _651 * _518;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _663 = _661 != 0;
    float _665 = trunc(_649);
    int _667 = int(_665);
    bool _669 = !_653;
    int _671 = _669 ? 0 : (-1);
    bool _673 = !_460;
    int _675 = _673 ? _657 : (-1);
    int _677 = ~_641;
    int _679 = _677 + 1;
    int _681 = _679 + 1;
    int _683 = _434 + (-1);
    bool _685 = !_663;
    int _687 = _685 ? 0 : 1;
    int _689 = _675 * _681;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _697 = _695 != 0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _701 = _699 != 0;
    int _703 = abs(_687);
    int _705 = _641 * _683;
    int _707 = _705 + _689;
    float _709 = float(_454);
    float _711 = trunc(_659);
    int _713 = int(_711);
    bool _715 = !_697;
    int _717 = _715 ? 0 : 1;
    int _719 = _667 * _703;
    int _721 = _719 + _486;
    float _723 = float(_510);
    int _725 = ~_607;
    int _727 = _725 + _671;
    int _729 = _727 + 1;
    int _731 = abs(_717);
    float _733 = floor(_611);
    bool _735 = !_693;
    int _737 = _735 ? 0 : 1;
    bool _739 = _723 >= _709;
    bool _741 = isnan(_723);
    bool _743 = _739 || _741;
    bool _745 = isnan(_709);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    int _751 = abs(_737);
    bool _753 = !_701;
    int _755 = _753 ? 0 : 1;
    float _757 = trunc(_749);
    int _759 = int(_757);
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _763 = _761 != 0;
    float _765 = _152 * _709;
    int _767 = abs(_755);
    int _769 = _707 * _731;
    bool _771 = !_763;
    int _773 = _771 ? 0 : 1;
    float _775 = _765 * _518;
    int _777 = _713 * _751;
    int _779 = _777 + _769;
    int _781 = abs(_773);
    int _783 = _454 * _729;
    int _785 = _783 + _510;
    bool _787 = _454 == 0;
    int _789 = _721 * _767;
    int _791 = _789 + _779;
    float _793 = -_733;
    float _795 = _611 + _793;
    bool _797 = !_787;
    int _799 = _797 ? _785 : (-1);
    float _801 = trunc(_775);
    int _803 = int(_801);
    int _805 = ~_759;
    int _807 = _805 + 1;
    int _809 = _807 + 1;
    int _811 = _667 * _781;
    int _813 = _811 + _791;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _817 = _815 != 0;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _821 = _819 != 0;
    float _823 = _709 * _795;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _827 = _825 != 0;
    int _829 = _809 * _799;
    float _831 = float(uint(_813));
    float _833 = trunc(_823);
    int _835 = int(_833);
    bool _837 = !_821;
    int _839 = _837 ? 0 : 1;
    float _841 = in.m_61.y;
    int _843 = _454 + (-1);
    float _845 = as_type<float>(_506) * _831;
    int _847 = abs(_839);
    bool _849 = !_827;
    int _851 = _849 ? 0 : 1;
    int _853 = _759 * _843;
    int _855 = _853 + _829;
    bool _857 = !_817;
    int _859 = _857 ? 0 : 1;
    float _861 = trunc(_845);
    float _863 = precise::max(_861, 0.0);
    uint _865 = uint(_863);
    int _867 = abs(_851);
    int _869 = abs(_859);
    int _871 = _855 * _847;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _879 = _877 != 0;
    int _881 = _835 * _867;
    int _883 = _881 + _510;
    int _885 = ~_434;
    int _887 = _885 + 1;
    bool _889 = !_875;
    int _891 = _889 ? 0 : 1;
    int _893 = _803 * _869;
    int _895 = _893 + _871;
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _899 = _897 != 0;
    int _901 = abs(_891);
    int _903 = _887 * int(_865);
    int _905 = _903 + _813;
    bool _907 = !_879;
    int _909 = _907 ? 0 : 1;
    float _911 = float(uint(_905));
    int _913 = abs(_909);
    int _915 = _883 * _901;
    int _917 = _915 + _895;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _921 = _919 != 0;
    float _923 = as_type<float>(_506) * _911;
    int _925 = ~_434;
    int _927 = _925 + 1;
    int _929 = _835 * _913;
    int _931 = _929 + _917;
    int _933 = ~_454;
    int _935 = _933 + 1;
    float _937 = trunc(_923);
    float _939 = precise::max(_937, 0.0);
    uint _941 = uint(_939);
    int _943 = _835;
    float _945 = _923;
    bool _947 = _821;
    float _949 = _841;
    bool _951 = _787;
    if (_899)
    {
        float _953 = in.m_57.x;
        _943 = as_type<int>(_953);
    }
    int _955 = _943;
    float _957 = 0.0;
    if (!_899)
    {
        _957 = _422;
    }
    float _959 = _957;
    float _961 = float(uint(_931));
    bool _963 = _434 == 0;
    int _965 = ~_454;
    int _967 = _965 + 1;
    float _969 = as_type<float>(_516) * _961;
    float _971 = _959;
    if (_921)
    {
        float _973 = in.m_57.z;
        _945 = _973;
    }
    float _975 = _945;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _979 = _977 != 0;
    float _981 = trunc(_969);
    float _983 = precise::max(_981, 0.0);
    uint _985 = uint(_983);
    bool _987 = !_979;
    int _989 = _987 ? 0 : 1;
    int _991 = int(_865) + int(_941);
    float _993 = in.m_57.w;
    int _995 = _927 * _991;
    int _997 = _995 + _813;
    int _999 = _955;
    if (_899)
    {
        bool _1001 = as_type<float>(_955) > 0.5;
        _947 = _1001;
    }
    bool _1003 = _947;
    if (_899)
    {
        float _1005 = -_422;
        float _1007 = _1005 + 1.0;
        _999 = as_type<int>(_1007);
    }
    int _1009 = _999;
    bool _1011 = uint(_997) >= uint(_434);
    int _1013 = _935 * int(_985);
    int _1015 = _1013 + _931;
    if (_899)
    {
        float _1017 = _1003 ? as_type<float>(_1009) : _422;
        _971 = _1017;
    }
    float _1019 = _971;
    bool _1021 = !_1011;
    int _1023 = _1021 ? 0 : (-1);
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1027 = _1025 != 0;
    int _1029 = ~_991;
    int _1031 = _1029 + _1023;
    int _1033 = _1031 + 1;
    float _1035 = -_841;
    float _1037 = _1035 + 1.0;
    float _1039 = float(uint(_1015));
    bool _1041 = _418 > 0.5;
    int _1043 = _434 * _1033;
    int _1045 = _1043 + _813;
    int _1047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1049 = _1047 != 0;
    float _1051 = as_type<float>(_516) * _1039;
    int _1053 = _1041 ? as_type<int>(_1037) : as_type<int>(_841);
    bool _1055 = _993 > 0.5;
    float _1057 = trunc(_1051);
    float _1059 = precise::max(_1057, 0.0);
    uint _1061 = uint(_1059);
    float _1063 = _1049 ? as_type<float>(_1053) : _841;
    int _1065 = as_type<int>(_1037);
    bool _1067 = _1049;
    if (_1027)
    {
        float _1069 = _1055 ? _1037 : _841;
        _949 = _1069;
    }
    float _1071 = _949;
    if (_921)
    {
        float _1073 = -_422;
        float _1075 = _1073 + 1.0;
        _1065 = as_type<int>(_1075);
    }
    int _1077 = _1065;
    if (_921)
    {
        bool _1079 = _975 > 0.5;
        _1067 = _1079;
    }
    bool _1081 = _1067;
    bool _1083 = !_963;
    int _1085 = _1083 ? _1045 : (-1);
    if (_921)
    {
        float _1087 = _1081 ? as_type<float>(_1077) : _422;
        _490 = _1087;
    }
    float _1089 = _490;
    float _1091 = in.m_63.x;
    float _1093 = in.m_63.y;
    int _1095 = _1085 & 3;
    bool _1097 = _1095 != 0;
    int _1099 = _1085 & 3;
    bool _1101 = _1099 != 0;
    int _1103 = _1097 ? 0 : 1;
    bool _1105 = _1099 != 3;
    int _1107 = int(_985) + int(_1061);
    bool _1109 = uint(_1099) >= 2u;
    float _1111 = in.m_48.x;
    float _1113 = in.m_48.y;
    float _1115 = in.m_48.z;
    bool _1117 = uint(_1099) > 1u;
    int _1119 = _967 * _1107;
    int _1121 = _1119 + _931;
    int _1123 = _1109 ? 0 : 1;
    int _1125 = ~_1103;
    int _1127 = _1125 + 1;
    int _1129 = _1127 + 1;
    int _1131 = ~_1123;
    int _1133 = _1131 + 1;
    int _1135 = _1133 + 1;
    int _1137 = _1135;
    int _1139 = _1129;
    if (_1105)
    {
        int _1141 = ~_1123;
        int _1143 = _1141 + 1;
        _1137 = _1143;
    }
    int _1145 = _1137;
    bool _1147 = uint(_1121) >= uint(_454);
    float _1149 = _418 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1153 = _1151 != 0;
    bool _1155 = !_1147;
    int _1157 = _1155 ? 0 : (-1);
    float _1159 = fma(_1149, -2.0, _438);
    if (!_1117)
    {
        int _1161 = ~_1103;
        int _1163 = _1161 + 1;
        _1139 = _1163;
    }
    int _1165 = _1139;
    int _1167 = ~_1107;
    int _1169 = _1167 + _1157;
    int _1171 = _1169 + 1;
    float _1173 = float(uint(_721));
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1177 = _1175 != 0;
    int _1179 = _454 * _1171;
    int _1181 = _1179 + _931;
    float _1183 = float(uint(_883));
    float _1185 = as_type<float>(_506) * _1173;
    bool _1187 = !_1177;
    int _1189 = _1187 ? 0 : 1;
    float _1191 = _416 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1193 = !_787;
    int _1195 = _1193 ? _1181 : (-1);
    float _1197 = trunc(_1185);
    float _1199 = precise::max(_1197, 0.0);
    uint _1201 = uint(_1199);
    float _1203 = as_type<float>(_516) * _1183;
    float _1205 = abs(_1091);
    float _1207 = abs(_1093);
    float _1209 = precise::max(_1205, _1207);
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1213 = _1195 & 3;
    bool _1215 = _1213 != 0;
    float _1217 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1219 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1221 = trunc(_1203);
    float _1223 = precise::max(_1221, 0.0);
    uint _1225 = uint(_1223);
    int _1227 = _1215 ? 0 : 1;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1231 = uint(_1213) >= 2u;
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1235 = _1233 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1237 = _1209 >= 16.0;
    float _1239 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1241 = _1231 ? 0 : 1;
    int _1243 = _464 * int(_1201);
    int _1245 = _1243 + _721;
    bool _1247 = _1213 != 3;
    float _1249 = -_448;
    float _1251 = fma(_1191, 2.0, _1249);
    float _1253 = fma(_1111, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1239);
    float _1255 = fma(_1111, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1217);
    float _1257 = float(uint(_1245));
    float _1259 = fma(_1111, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1219);
    int _1261 = _480 * int(_1225);
    int _1263 = _1261 + _883;
    float _1265 = as_type<float>(_506) * _1257;
    float _1267 = in.m_57.z;
    float _1269 = 1.0 / _1235;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1275;
    float _1279 = float(uint(_1263));
    float _1281 = _1271 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1283 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1287 = ~_1241;
    int _1289 = _1287 + 1;
    int _1291 = _1289 + 1;
    float _1293 = trunc(_1265);
    float _1295 = precise::max(_1293, 0.0);
    uint _1297 = uint(_1295);
    float _1299 = _1277 * _549;
    int _1301 = _1291;
    float _1303 = _1115;
    if (_1247)
    {
        int _1305 = ~_1241;
        int _1307 = _1305 + 1;
        _1301 = _1307;
    }
    int _1309 = _1301;
    float _1311 = _416 * 2.0;
    bool _1313 = uint(_1213) > 1u;
    float _1315 = as_type<float>(_516) * _1279;
    float _1317 = _416 + _418;
    out.m_65.x = _1281;
    out.m_65.y = _1283;
    out.m_65.z = _1285;
    out.m_65.w = _1229;
    int _1319 = ~_1227;
    int _1321 = _1319 + 1;
    int _1323 = _1321 + 1;
    float _1325 = floor(_1311);
    float _1327 = _1317 + (-1.0);
    float _1329 = fma(_1115, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1253);
    int _1331 = _1323;
    if (_1153)
    {
        _492 = 0;
    }
    int _1333 = _492;
    float _1335 = fma(_1115, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1259);
    int _1337 = _1333;
    if (!_1153)
    {
        _1337 = 1;
    }
    int _1339 = _1337;
    float _1341 = trunc(_1315);
    float _1343 = precise::max(_1341, 0.0);
    uint _1345 = uint(_1343);
    if (!_1313)
    {
        int _1347 = ~_1227;
        int _1349 = _1347 + 1;
        _1331 = _1349;
    }
    int _1351 = _1331;
    float _1353 = _1335 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1355 = abs(_1145);
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1361 = _418 + _1267;
    int _1363 = ~_434;
    int _1365 = _1363 + 1;
    float _1367 = _1359 * _1269;
    int _1369 = int(_1201) + int(_1297);
    float _1371 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1375 = _410 + _1373;
    float _1377 = _1361 + (-1.0);
    bool _1379 = _1325 > 0.0;
    float _1381 = _1091 * 0.0625;
    float _1383 = fma(_1299, _1375, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1385 = _1267 * 2.0;
    float _1387 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1389 = _1365 * _1369;
    int _1391 = _1389 + _721;
    bool _1393 = _1325 >= 0.0;
    bool _1395 = isnan(_1325);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan(0.0);
    bool _1401 = _1397 || _1399;
    float _1403 = _1093 * 0.0625;
    int _1405 = int(_1225) + int(_1345);
    float _1407 = floor(_1385);
    int _1409 = ~_454;
    int _1411 = _1409 + 1;
    float _1413 = _418 * 2.0;
    bool _1415 = uint(_1391) >= uint(_434);
    bool _1417 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1419 = isnan(_410);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1425 = _1421 || _1423;
    float _1427 = float(_1425);
    int _1429 = _1411 * _1405;
    int _1431 = _1429 + _883;
    bool _1433 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1435 = isnan(_410);
    bool _1437 = _1433 || _1435;
    bool _1439 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1441 = _1437 || _1439;
    float _1443 = float(_1441);
    float _1445 = _1237 ? _1403 : _1093;
    float _1447 = -_1427;
    float _1449 = _1447 + 1.0;
    bool _1451 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1453 = isnan(_410);
    bool _1455 = _1451 || _1453;
    bool _1457 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1459 = _1455 || _1457;
    float _1461 = float(_1459);
    float _1463 = -_1443;
    float _1465 = _1463 + 1.0;
    float _1467 = _1237 ? _1381 : _1091;
    bool _1469 = uint(_1431) >= uint(_454);
    float _1471 = _1427 * _1465;
    float _1473 = _1461 * _1449;
    bool _1475 = !_1415;
    int _1477 = _1475 ? 0 : (-1);
    float _1479 = -_1461;
    float _1481 = _1479 + 1.0;
    int _1483 = _1401 ? 0 : 1;
    float _1485 = floor(_1413);
    bool _1487 = _1339 != 1;
    bool _1489 = !_1469;
    int _1491 = _1489 ? 0 : (-1);
    bool _1493 = _1407 > 0.0;
    bool _1495 = _1407 >= 0.0;
    bool _1497 = isnan(_1407);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan(0.0);
    bool _1503 = _1499 || _1501;
    float _1505 = _1383 * _1473;
    float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1509 = _410 + _1507;
    int _1511 = ~_1369;
    int _1513 = _1511 + _1477;
    int _1515 = _1513 + 1;
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1519 = _1353 + _1517;
    float _1521 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1505);
    float _1523 = fma(_1367, _1509, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1525 = fma(_1115, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1255);
    float _1527 = _1509;
    float _1529 = _1471;
    if (!_1487)
    {
        float _1531 = in.m_57.z;
        _1527 = _1531;
    }
    float _1533 = _1527;
    int _1535 = _1503 ? 0 : 1;
    float _1537 = fma(_1523, _1471, _1521);
    int _1539 = _1085 >> 31;
    int _1541 = _434 * _1515;
    int _1543 = _1541 + _721;
    int _1545 = _1539 & 3;
    if (!_1487)
    {
        _1303 = _418;
    }
    float _1547 = _1303;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1551 = _1547;
    if (_1487)
    {
        _1551 = _416;
    }
    float _1553 = _1551;
    int _1555 = ~_1535;
    int _1557 = _1555 + 1;
    int _1559 = _1557 + 1;
    int _1561 = _1559;
    if (!_1487)
    {
        _1529 = _418;
    }
    float _1563 = _1529;
    float _1565 = fma(_1553, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1549);
    int _1567 = _1085 + _1545;
    float _1569 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1537);
    float _1571 = _1563;
    if (!_1493)
    {
        int _1573 = ~_1535;
        int _1575 = _1573 + 1;
        _1561 = _1575;
    }
    int _1577 = _1561;
    if (_1487)
    {
        _1571 = _416;
    }
    float _1579 = _1571;
    float _1581 = _1569 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1583 = _1567 >> 2;
    float _1585 = _1579 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1589 = _1583 << 4;
    int _1591 = _1589 + 368;
    float _1593 = 0.0;
    float _1595 = _1533;
    if (!_1487)
    {
        _1593 = _1533;
    }
    float _1597 = _1593;
    float _1599 = -_1587;
    float _1601 = fma(_1585, 2.0, _1599);
    float _1603 = _1597;
    if (_1487)
    {
        _1595 = _418;
    }
    float _1605 = _1595;
    uint _1607 = uint(int(uint(_1591) >> uint(2)));
    uint _1609 = uint(int(uint(int(_1607)) >> uint(2)));
    int _1611 = int(_1607) & 3;
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[int(_1609)][_1611];
    int _1615 = int(_1607) + 1;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    int _1619 = _1615 & 3;
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[int(_1617)][_1619];
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1625 = ~_1483;
    int _1627 = _1625 + 1;
    int _1629 = _1627 + 1;
    int _1631 = _1629;
    if (!_1379)
    {
        int _1633 = ~_1483;
        int _1635 = _1633 + 1;
        _1631 = _1635;
    }
    int _1637 = _1631;
    bool _1639 = _1485 > 0.0;
    int _1641 = _1591 + 8;
    uint _1643 = uint(int(uint(_1641) >> uint(2)));
    uint _1645 = uint(int(uint(int(_1643)) >> uint(2)));
    int _1647 = int(_1643) & 3;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[int(_1645)][_1647];
    int _1651 = int(_1643) + 1;
    uint _1653 = uint(int(uint(_1651) >> uint(2)));
    int _1655 = _1651 & 3;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[int(_1653)][_1655];
    bool _1659 = _1485 >= 0.0;
    bool _1661 = isnan(_1485);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan(0.0);
    bool _1667 = _1663 || _1665;
    float _1669 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1623);
    float _1671 = _1329 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1675 = _1195 >> 31;
    float _1677 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1679 = _1525 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1683 = _1671 + _1681;
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1687 = _1675 & 3;
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1691 = _1679 + _1689;
    float _1693 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1695 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1697 = _1195 + _1687;
    float _1699 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1693);
    int _1701 = ~_1405;
    int _1703 = _1701 + _1491;
    int _1705 = _1703 + 1;
    int _1707 = _1697 >> 2;
    float _1709 = _1673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1711 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1699);
    float _1713 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1715 = _1707 << 4;
    int _1717 = _1715 + 512;
    bool _1719 = !_963;
    int _1721 = _1719 ? _1543 : (-1);
    bool _1723 = _1711 >= 0.0;
    out.m_67.x = _1695;
    out.m_67.y = _1709;
    out.m_67.z = _1713;
    out.m_67.w = _1581;
    bool _1725 = !_1101;
    int _1727 = _1725 ? 0 : 1;
    uint _1729 = uint(int(uint(_1717) >> uint(2)));
    uint _1731 = uint(int(uint(int(_1729)) >> uint(2)));
    int _1733 = int(_1729) & 3;
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[int(_1731)][_1733];
    int _1737 = int(_1729) + 1;
    uint _1739 = uint(int(uint(_1737) >> uint(2)));
    int _1741 = _1737 & 3;
    float _1743 = (*spvDescriptorSet0.vp_c9)._m0[int(_1739)][_1741];
    bool _1745 = _1099 != 3;
    int _1747 = abs(_1727);
    bool _1749 = !_1745;
    int _1751 = _1749 ? 0 : (-1);
    int _1753 = _1195 & 3;
    bool _1755 = _1753 != 0;
    int _1757 = abs(_1309);
    float _1759 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1761 = log2(_1759);
    int _1763 = abs(_1165);
    int _1765 = ~_1747;
    int _1767 = _1765 + 1;
    int _1769 = _1767 + 1;
    int _1771 = abs(_1751);
    float _1773 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1775 = int(_1773);
    int _1777 = ~_1763;
    int _1779 = _1777 + 1;
    int _1781 = _1779 + 1;
    float _1783 = float(uint(_559));
    if (_1487)
    {
        _1603 = _418;
    }
    float _1785 = _1603;
    int _1787 = _1781 * as_type<int>(_1621);
    int _1789 = ~_1355;
    int _1791 = _1789 + 1;
    int _1793 = _1791 + 1;
    float _1795 = _1761 * _152;
    float _1797 = 1.0 / _1783;
    int _1799 = _1769 * as_type<int>(_1613);
    int _1801 = _1799 + _1787;
    int _1803 = ~_1771;
    int _1805 = _1803 + 1;
    int _1807 = _1805 + 1;
    int _1809 = _1717 + 8;
    uint _1811 = uint(int(uint(_1809) >> uint(2)));
    uint _1813 = uint(int(uint(int(_1811)) >> uint(2)));
    int _1815 = int(_1811) & 3;
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[int(_1813)][_1815];
    int _1819 = int(_1811) + 1;
    uint _1821 = uint(int(uint(_1819) >> uint(2)));
    int _1823 = _1819 & 3;
    float _1825 = (*spvDescriptorSet0.vp_c9)._m0[int(_1821)][_1823];
    bool _1827 = !_1755;
    int _1829 = _1827 ? 0 : 1;
    int _1831 = _1793 * as_type<int>(_1649);
    int _1833 = _1831 + _1801;
    bool _1835 = _1213 != 3;
    float _1837 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1839 = abs(_1189);
    int _1841 = _1807 * as_type<int>(_1657);
    int _1843 = _1841 + _1833;
    int _1845 = abs(_1351);
    int _1847 = abs(_559);
    int _1849 = abs(_1829);
    int _1851 = ~_1845;
    int _1853 = _1851 + 1;
    int _1855 = _1853 + 1;
    float _1857 = exp2(_1795);
    int _1859 = ~_1839;
    int _1861 = _1859 + 1;
    int _1863 = _1861 + 1;
    int _1865 = _1855 * as_type<int>(_1743);
    int _1867 = ~_1849;
    int _1869 = _1867 + 1;
    int _1871 = _1869 + 1;
    float _1873 = float(uint(_1847));
    int _1875 = _1843 * _1863;
    int _1877 = as_type<int>(_1797) + (-2);
    int _1879 = _1871 * as_type<int>(_1735);
    int _1881 = _1879 + _1865;
    bool _1883 = !_1835;
    int _1885 = _1883 ? 0 : (-1);
    int _1887 = _1721 * _1839;
    int _1889 = _1887 + _1875;
    float _1891 = 1.0 / _1873;
    float _1893 = abs(_1445);
    bool _1895 = _1893 != 0.0;
    bool _1897 = isnan(_1893);
    bool _1899 = _1895 || _1897;
    bool _1901 = isnan(0.0);
    bool _1903 = _1899 || _1901;
    float _1905 = _1683 * _1683;
    int _1907 = abs(_1775);
    float _1909 = float(uint(_1889));
    float _1911 = abs(_1467);
    bool _1913 = _1911 == 0.0;
    bool _1915 = !_1903;
    bool _1917 = _1913 && _1915;
    int _1919 = abs(_1885);
    float _1921 = as_type<float>(_1877) * _1909;
    float _1923 = fma(_1691, _1691, _1905);
    int _1925 = ~_1919;
    int _1927 = _1925 + 1;
    int _1929 = _1927 + 1;
    int _1931 = ~_1757;
    int _1933 = _1931 + 1;
    int _1935 = _1933 + 1;
    int _1937 = abs(_989);
    float _1939 = trunc(_1921);
    float _1941 = precise::max(_1939, 0.0);
    uint _1943 = uint(_1941);
    int _1945 = _1935 * as_type<int>(_1817);
    int _1947 = _1945 + _1881;
    float _1949 = float(uint(_1775));
    int _1951 = _454 * _1705;
    int _1953 = _1951 + _883;
    float _1955 = float(uint(_1907));
    int _1957 = _1929 * as_type<int>(_1825);
    int _1959 = _1957 + _1947;
    int _1961 = ~_1937;
    int _1963 = _1961 + 1;
    int _1965 = _1963 + 1;
    bool _1967 = !_787;
    int _1969 = _1967 ? _1953 : (-1);
    float _1971 = 1.0 / _1949;
    int _1973 = _1965;
    int _1975 = _1917 ? (-1) : 0;
    float _1977 = _1857;
    if (_1917)
    {
        bool _1979 = as_type<int>(_1467) >= 0;
        _951 = _1979;
    }
    bool _1981 = _951;
    int _1983 = _1965 * _1959;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_1917)
    {
        int _1987 = _1981 ? 0 : 1078530011;
        _1973 = _1987;
    }
    int _1989 = _1973;
    int _1991 = _1969 * _1937;
    int _1993 = _1991 + _1983;
    float _1995 = abs(_1467);
    bool _1997 = _1995 == 0.0;
    float _1999 = 1.0 / _1955;
    float _2001 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2003 = _1989;
    if (_1917)
    {
        int _2005 = int(0x80000000) & as_type<int>(_1445);
        int _2007 = _1989 | _2005;
        _1985 = as_type<float>(_2007);
    }
    float _2009 = _1985;
    float _2011 = fma(_1837, -2.0, _2001);
    float _2013 = float(uint(_1993));
    int _2015 = as_type<int>(_1971) + (-2);
    float _2017 = fma(_1519, _1519, _1923);
    int _2019 = ~_559;
    int _2021 = _2019 + 1;
    int _2023 = abs(_1889);
    float _2025 = rsqrt(_2017);
    int _2027 = _2021 * int(_1943);
    int _2029 = _2027 + _1889;
    float _2031 = float(uint(_2029));
    float _2033 = sqrt(_2017);
    bool _2035 = !_1903;
    bool _2037 = _2035 && _1997;
    float _2039 = _2009;
    float _2041 = _2009;
    if (!_2037)
    {
        float _2043 = abs(_1445);
        bool _2045 = _2043 != as_type<float>(0x7f800000u /* inf */);
        bool _2047 = isnan(_2043);
        bool _2049 = _2045 || _2047;
        bool _2051 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2053 = _2049 || _2051;
        float _2055 = abs(_1467);
        bool _2057 = _2055 == as_type<float>(0x7f800000u /* inf */);
        float _2059 = abs(_1467);
        bool _2061 = _2059 == as_type<float>(0x7f800000u /* inf */);
        bool _2063 = !_2053;
        bool _2065 = _2061 && _2063;
        if (_2065)
        {
            bool _2067 = as_type<int>(_1467) >= 0;
            _1975 = _2067 ? (-1) : 0;
        }
        int _2069 = _1975;
        if (_2065)
        {
            _2003 = 1075235812;
        }
        int _2071 = _2003;
        int _2073 = _2071;
        if (_2065)
        {
            int _2075 = ~_2069;
            int _2077 = (_2075 != 0) ? _2071 : 1061752795;
            _2073 = _2077;
        }
        int _2079 = _2073;
        if (_2065)
        {
            int _2081 = int(0x80000000) & as_type<int>(_1445);
            int _2083 = _2079 | _2081;
            _2039 = as_type<float>(_2083);
        }
        float _2085 = _2039;
        bool _2087 = !_2053;
        bool _2089 = _2087 && _2057;
        _2041 = _2085;
        if (!_2089)
        {
            float _2091 = abs(_1445);
            float _2093 = abs(_1467);
            float _2095 = precise::max(_2091, _2093);
            float _2097 = abs(_1445);
            float _2099 = abs(_1467);
            float _2101 = precise::min(_2097, _2099);
            float _2103 = 1.0 / _2095;
            float _2105 = abs(_1445);
            float _2107 = abs(_1467);
            bool _2109 = _2105 > _2107;
            bool _2111 = as_type<int>(_1467) >= 0;
            float _2113 = _2101 * _2103;
            float _2115 = abs(_1445);
            float _2117 = abs(_1467);
            float _2119 = _2115 + _2117;
            int _2121 = as_type<int>(_1445) & int(0x80000000);
            float _2123 = _2113 * _2113;
            bool _2125 = _2119 > as_type<float>(0x7f800000u /* inf */);
            bool _2127 = isnan(_2119);
            bool _2129 = _2125 || _2127;
            bool _2131 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2133 = _2129 || _2131;
            float _2135 = _2123 + 11.33538818359375;
            float _2137 = fma(_2123, _2135, 28.84246826171875);
            float _2139 = fma(_2123, _2137, 19.6966705322265625);
            float _2141 = fma(_2123, -0.82336294651031494140625, -5.674867153167724609375);
            float _2143 = fma(_2123, _2141, -6.565555095672607421875);
            float _2145 = 1.0 / _2139;
            float _2147 = _2123 * _2143;
            float _2149 = _2113 * _2147;
            float _2151 = fma(_2149, _2145, _2113);
            float _2153 = _2151;
            _2041 = _2119;
            if (_2109)
            {
                float _2155 = -_2151;
                float _2157 = _2155 + 1.57079637050628662109375;
                _2153 = _2157;
            }
            float _2159 = _2153;
            int _2161 = as_type<int>(_2159);
            if (!_2111)
            {
                float _2163 = -_2159;
                float _2165 = _2163 + 3.1415927410125732421875;
                _2161 = as_type<int>(_2165);
            }
            int _2167 = _2161;
            if (!_2133)
            {
                int _2169 = _2121 | _2167;
                _2041 = as_type<float>(_2169);
            }
        }
    }
    float _2171 = _2041;
    float _2173 = as_type<float>(_2015) * _2013;
    int _2175 = as_type<int>(_1891) + (-2);
    float _2177 = as_type<float>(_1877) * _2031;
    float _2179 = float(uint(_2023));
    float _2181 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2183 = abs(_1993);
    float _2185 = trunc(_2173);
    float _2187 = precise::max(_2185, 0.0);
    uint _2189 = uint(_2187);
    int _2191 = as_type<int>(_1999) + (-2);
    float _2193 = as_type<float>(_2175) * _2179;
    float _2195 = float(uint(_2183));
    float _2197 = _2181 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _2199 = ~_1775;
    int _2201 = _2199 + 1;
    float _2203 = _2033 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2205 = ~_1847;
    int _2207 = _2205 + 1;
    float _2209 = trunc(_2193);
    float _2211 = precise::max(_2209, 0.0);
    uint _2213 = uint(_2211);
    float _2215 = as_type<float>(_2191) * _2195;
    bool _2217 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2219 = isnan(0.0);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2225 = _2221 || _2223;
    float _2227 = -_1857;
    float _2229 = _2227 + 1.0;
    float _2231 = precise::min(_2197, _2203);
    if (_1723)
    {
        _1977 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2233 = _1977;
    float _2235 = -_152;
    float _2237 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1251);
    float _2239 = trunc(_2177);
    float _2241 = precise::max(_2239, 0.0);
    uint _2243 = uint(_2241);
    int _2245 = _2201 * int(_2189);
    int _2247 = _2245 + _1993;
    int _2249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2251 = _2249 != 0;
    int _2253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2255 = _2253 != 0;
    int _2257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2259 = _2257 != 0;
    int _2261 = as_type<int>(_2233);
    if (_1723)
    {
        float _2263 = _2233 * 5.0;
        _2261 = as_type<int>(_2263);
    }
    int _2265 = _2261;
    int _2267 = ~_1907;
    int _2269 = _2267 + 1;
    float _2271 = -_152;
    float _2273 = fma(_2271, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1601);
    float _2275 = float(uint(_2247));
    float _2277 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2011);
    float _2279 = trunc(_2215);
    float _2281 = precise::max(_2279, 0.0);
    uint _2283 = uint(_2281);
    int _2285 = _2207 * int(_2213);
    int _2287 = _2285 + _2023;
    if (_1723)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7852 = as_type<float>(_2265);
        out.gl_Position.z = _7852;
    }
    float _2289 = as_type<float>(_2015) * _2275;
    float _2291 = _2225 ? _2229 : 0.0;
    float _2293 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1565);
    float _2295 = float(uint(_2287));
    float _2297 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1669);
    int _2299 = int(_1943) + int(_2243);
    float _2301 = _1683 * _2025;
    float _2303 = trunc(_2289);
    float _2305 = precise::max(_2303, 0.0);
    uint _2307 = uint(_2305);
    float _2309 = as_type<float>(_2175) * _2295;
    float _2311 = _1691 * _2025;
    float _2313 = _2301 * _2231;
    float _2315 = _1519 * _2025;
    int _2317 = ~_559;
    int _2319 = _2317 + 1;
    int _2321 = _2269 * int(_2283);
    int _2323 = _2321 + _2183;
    float _2325 = _2311 * _2231;
    float _2327 = -_2313;
    float _2329 = _1683 + _2327;
    float _2331 = _2315 * _2231;
    float _2333 = trunc(_2309);
    float _2335 = precise::max(_2333, 0.0);
    uint _2337 = uint(_2335);
    float _2339 = float(uint(_2323));
    float _2341 = -_2325;
    float _2343 = _1691 + _2341;
    float _2345 = _2329 * _2329;
    int _2347 = _2319 * _2299;
    int _2349 = _2347 + _1889;
    float _2351 = precise::max(_2171, -3.1415927410125732421875);
    float _2353 = as_type<float>(_2191) * _2339;
    float _2355 = fma(_2343, _2343, _2345);
    float _2357 = -_2331;
    float _2359 = _1519 + _2357;
    int _2361 = ~_1775;
    int _2363 = _2361 + 1;
    out.m_69.w = _2231;
    int _2365 = int(_2189) + int(_2307);
    float _2367 = trunc(_2353);
    float _2369 = precise::max(_2367, 0.0);
    uint _2371 = uint(_2369);
    float _2373 = fma(_2359, _2359, _2355);
    if (_1723)
    {
        out.m_51.x = 0.0;
    }
    bool _2375 = uint(_2349) >= uint(_559);
    int _2377 = int(_2213) + int(_2337);
    int _2379 = _2363 * _2365;
    int _2381 = _2379 + _1993;
    float _2383 = sqrt(_2373);
    int _2385 = ~_1847;
    int _2387 = _2385 + 1;
    bool _2389 = !_2375;
    int _2391 = _2389 ? 0 : (-1);
    int _2393 = ~_1907;
    int _2395 = _2393 + 1;
    int _2397 = _2387 * _2377;
    int _2399 = _2397 + _2023;
    bool _2401 = uint(_2381) >= uint(_1775);
    int _2403 = int(_2283) + int(_2371);
    float _2405 = precise::min(_2351, 3.1415927410125732421875);
    int _2407 = _2395 * _2403;
    int _2409 = _2407 + _2183;
    bool _2411 = !_2401;
    int _2413 = _2411 ? 0 : (-1);
    bool _2415 = uint(_2399) >= uint(_1847);
    float _2417 = fma(_2405, 0.15915493667125701904296875, 0.5);
    float _2419 = _2025 * _2383;
    int _2421 = ~_2299;
    int _2423 = _2421 + _2391;
    int _2425 = _2423 + 1;
    bool _2427 = !_2415;
    int _2429 = _2427 ? 0 : (-1);
    float _2431 = _2181 * _2419;
    bool _2433 = uint(_2409) >= uint(_1907);
    int _2435 = _559 * _2425;
    int _2437 = _2435 + _1889;
    int _2439 = ~_2365;
    int _2441 = _2439 + _2413;
    int _2443 = _2441 + 1;
    float _2445 = _2431 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2447 = !_2433;
    int _2449 = _2447 ? 0 : (-1);
    float _2451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2453 = _559 == 0;
    int _2455 = _1775 * _2443;
    int _2457 = _2455 + _1993;
    int _2459 = _1889 ^ _559;
    float _2461 = _2301 * _2445;
    bool _2463 = !_2453;
    int _2465 = _2463 ? _2437 : (-1);
    float _2467 = _2311 * _2445;
    bool _2469 = _1775 == 0;
    float _2471 = _2315 * _2445;
    uint _2473 = uint(int(uint(_2459) >> uint(31)));
    float _2475 = -_2461;
    float _2477 = _1683 + _2475;
    bool _2479 = !_2469;
    int _2481 = _2479 ? _2457 : (-1);
    float _2483 = -_2467;
    float _2485 = _1691 + _2483;
    bool _2487 = _559 == 0;
    float _2489 = fma(_152, 0.033333338797092437744140625, _2417);
    int _2491 = ~_2429;
    int _2493 = _2377 + _2491;
    int _2495 = _2493 + 1;
    float _2497 = _2477 * _2477;
    int _2499 = ~int(_2473);
    int _2501 = _2499 + 1;
    bool _2503 = !_2251;
    int _2505 = _2503 ? 0 : 1;
    int _2507 = _2495 ^ _2501;
    float _2509 = fma(_2485, _2485, _2497);
    float _2511 = _2451 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2513 = float(_2465);
    float _2515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2517 = _1993 ^ _1775;
    float _2519 = fma(_2511, _1019, -0.5);
    int _2521 = abs(_2505);
    float _2523 = fma(_2511, _2513, _2237);
    uint _2525 = uint(int(uint(_2517) >> uint(31)));
    int _2527 = ~_2449;
    int _2529 = _2403 + _2527;
    int _2531 = _2529 + 1;
    float _2533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2535 = ~int(_2525);
    int _2537 = _2535 + 1;
    float _2539 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1159);
    int _2541 = ~_2501;
    int _2543 = _2541 + _2507;
    int _2545 = _2543 + 1;
    int _2547 = _2531 ^ _2537;
    bool _2549 = !_2487;
    int _2551 = _2549 ? _2545 : (-1);
    float _2553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2555 = _1775 == 0;
    float _2557 = _2515 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2559 = float(_2521);
    float _2561 = -_2471;
    float _2563 = _1519 + _2561;
    int _2565 = ~_2537;
    int _2567 = _2565 + _2547;
    int _2569 = _2567 + 1;
    float _2571 = fma(_2557, _1089, -0.5);
    float _2573 = _2533 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2575 = float(_2481);
    float _2577 = fma(_2563, _2563, _2509);
    bool _2579 = !_2555;
    int _2581 = _2579 ? _2569 : (-1);
    float _2583 = fma(_2573, _1063, -0.5);
    bool _2585 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2587 = isnan(1.0);
    bool _2589 = _2585 || _2587;
    bool _2591 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2593 = _2589 || _2591;
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2597 = 1.0 + _2595;
    float _2599 = float(_2551);
    float _2601 = fma(_2557, _2575, _2273);
    float _2603 = _2553 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2605 = 1.0 / _2597;
    float _2607 = float(_1577);
    float _2609 = -_2539;
    float _2611 = fma(_2573, _2599, _2609);
    float _2613 = float(_2581);
    float _2615 = in.m_71.x;
    float _2617 = in.m_71.y;
    float _2619 = in.m_71.z;
    float _2621 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2623 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2625 = fma(_2603, _1071, -0.5);
    float _2627 = sqrt(_2577);
    float _2629 = -_2277;
    float _2631 = fma(_2603, _2613, _2629);
    float _2633 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2621);
    float _2635 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2623);
    float _2637 = _2559 * _2607;
    float _2639 = fma(_2293, _2571, _2601);
    float _2641 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2633);
    float _2643 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2635);
    float _2645 = _2471;
    if (_2593)
    {
        float _2647 = _2291 * _2605;
        _154 = _2647;
    }
    float _2649 = _154;
    float _2651 = _2637 * (-2.0);
    float _2653 = fma(_2641, _2519, _2523);
    float _2655 = fma(_2643, _2583, _2611);
    float _2657 = fma(_2297, _2625, _2631);
    float _2659 = _2653 + 0.5;
    float _2661 = _2639 + 0.5;
    float _2663 = _2025 * _2627;
    float _2665 = _2655 + 0.5;
    float _2667 = _2657 + 0.5;
    float _2669 = fma(_1371, _2651, _1371);
    float _2671 = _2431 * _2663;
    int _2673 = _1667 ? 0 : 1;
    float _2675 = fma(_2651, _2615, _2615);
    bool _2677 = !_2255;
    int _2679 = _2677 ? 0 : 1;
    out.m_73.x = _2659;
    out.m_73.y = _2665;
    out.m_73.z = _2661;
    out.m_73.w = _2667;
    float _2681 = _416 + (-0.5);
    int _2683 = ~_2673;
    int _2685 = _2683 + 1;
    int _2687 = _2685 + 1;
    out.m_75.x = _2671;
    bool _2689 = !_2259;
    int _2691 = _2689 ? 0 : 1;
    int _2693 = abs(_2679);
    int _2695 = _2687;
    float _2697 = _2619;
    float _2699 = _2627;
    float _2701 = _2663;
    if (_1723)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2703 = -_2461;
    float _2705 = _1671 + _2703;
    float _2707 = -_2467;
    float _2709 = _1679 + _2707;
    float _2711 = float(_1637);
    float _2713 = fma(_2681, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2675);
    float _2715 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2717 = _2705 + _2715;
    float _2719 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2721 = _2709 + _2719;
    float _2723 = float(_2693);
    float _2725 = fma(_2669, _2649, _2713);
    float _2727 = _2717 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (!_1639)
    {
        int _2729 = ~_2673;
        int _2731 = _2729 + 1;
        _2695 = _2731;
    }
    int _2733 = _2695;
    float _2735 = _416 + _1267;
    int _2737 = abs(_2691);
    float _2739 = fma(_2721, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2727);
    float _2741 = -_2471;
    float _2743 = _1353 + _2741;
    float _2745 = _2723 * _2711;
    float _2747 = float(_2733);
    float _2749 = _2735 + (-1.0);
    float _2751 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2753 = _2743 + _2751;
    float _2755 = float(_2737);
    float _2757 = _2745 * (-2.0);
    float _2759 = _418 + (-0.5);
    float _2761 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2739);
    float _2763 = _1267 + (-0.5);
    float _2765 = _2755 * _2747;
    float _2767 = fma(_2757, _2617, _2617);
    float _2769 = fma(_1387, _2757, _1387);
    bool _2771 = _2761 >= 0.0;
    float _2773 = _2765 * (-2.0);
    float _2775 = fma(_2759, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2767);
    float _2777 = _2489 * 6.283185482025146484375;
    float _2779 = _2725 * 0.15915493667125701904296875;
    float _2781 = fma(_2749, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2783 = fma(_2773, _2619, _2619);
    float _2785 = fma(_2769, _2649, _2775);
    float _2787 = _2777 * 0.15915493667125701904296875;
    float _2789 = fma(_2781, _2773, _2781);
    float _2791 = fma(_2763, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2783);
    float _2793 = _2785 * 0.15915493667125701904296875;
    if (_2771)
    {
        _2697 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2795 = _2697;
    float _2797 = _2779 * 6.283185482025146484375;
    float _2799 = sin(_2797);
    float _2801 = fma(_2789, _2649, _2791);
    int _2803 = as_type<int>(_2795);
    if (_2771)
    {
        out.m_51.x = 0.0;
    }
    if (_2771)
    {
        float _2805 = _2795 * 5.0;
        _2803 = as_type<int>(_2805);
    }
    int _2807 = _2803;
    float _2809 = _2801 * 0.15915493667125701904296875;
    float _2811 = in.m_63.z;
    float _2813 = _2787 * 6.283185482025146484375;
    float _2815 = sin(_2813);
    if (_2771)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8643 = as_type<float>(_2807);
        out.gl_Position.z = _8643;
    }
    float _2817 = _2779 * 6.283185482025146484375;
    float _2819 = cos(_2817);
    float _2821 = _2793 * 6.283185482025146484375;
    float _2823 = sin(_2821);
    float _2825 = _2793 * 6.283185482025146484375;
    float _2827 = cos(_2825);
    float _2829 = _2809 * 6.283185482025146484375;
    float _2831 = sin(_2829);
    if (_2771)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2833 = -_1671;
    float _2835 = _2833 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2837 = -_1679;
    float _2839 = _2837 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2841 = -_1353;
    float _2843 = _2841 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2845 = _2809 * 6.283185482025146484375;
    float _2847 = cos(_2845);
    float _2849 = _2835 * _2835;
    float _2851 = fma(_2815, 0.25, 1.25);
    float _2853 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2855 = _2419 * _2663;
    float _2857 = fma(_2839, _2839, _2849);
    float _2859 = _380 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2861 = _2851 * _1093;
    float _2863 = _2853 * _2855;
    float _2865 = fma(_2843, _2843, _2857);
    float _2867 = _2859 * _2855;
    float _2869 = _2851 * _1091;
    float _2871 = _2851 * _2811;
    float _2873 = _2799 * _2823;
    float _2875 = _2819 * _2827;
    float _2877 = rsqrt(_2865);
    float _2879 = _2819 * _2823;
    float _2881 = _2799 * _2827;
    float _2883 = _2819 * _2847;
    float _2885 = _2827 * _2847;
    float _2887 = _2799 * _2847;
    float _2889 = _2823 * _2847;
    float _2891 = fma(_2831, _2875, _2873);
    float _2893 = -_2879;
    float _2895 = fma(_2831, _2881, _2893);
    float _2897 = fma(_2831, _2873, _2875);
    float _2899 = -_2881;
    float _2901 = fma(_2831, _2879, _2899);
    float _2903 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2861);
    bool _2905 = _2861 != 0.0;
    bool _2907 = isnan(_2861);
    bool _2909 = _2905 || _2907;
    bool _2911 = isnan(0.0);
    bool _2913 = _2909 || _2911;
    float _2915 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2871);
    float _2917 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2869);
    float _2919 = _2839 * _2877;
    float _2921 = _2843 * _2877;
    float _2923 = _2835 * _2877;
    bool _2925 = _2869 == 0.0;
    bool _2927 = !_2913;
    bool _2929 = _2925 && _2927;
    float _2931 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2933 = _2919 * _2931;
    float _2935 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2937 = _2921 * _2935;
    float _2939 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2941 = _2923 * _2939;
    float _2943 = in.m_77.x;
    float _2945 = in.m_77.y;
    float _2947 = in.m_77.z;
    float _2949 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2951 = -_2933;
    float _2953 = fma(_2921, _2949, _2951);
    float _2955 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2957 = -_2937;
    float _2959 = fma(_2923, _2955, _2957);
    float _2961 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2963 = -_2941;
    float _2965 = fma(_2919, _2961, _2963);
    bool _2967 = _2871 == 0.0;
    bool _2969 = _2967 && _2929;
    float _2971 = _2953 * _2953;
    float _2973 = _2671 * _2917;
    float _2975 = fma(_2959, _2959, _2971);
    float _2977 = _2863 * _2903;
    float _2979 = _2867 * _2915;
    float _2981 = fma(_2965, _2965, _2975);
    float _2983 = -_2977;
    float _2985 = _2831 * _2983;
    float _2987 = _2883 * _2977;
    float _2989 = _2887 * _2977;
    float _2991 = rsqrt(_2981);
    float _2993 = in.m_79.x;
    float _2995 = in.m_79.y;
    float _2997 = in.m_79.z;
    float _2999 = in.m_79.w;
    float _3001 = fma(_2885, _2973, _2985);
    float _3003 = fma(_2891, _2973, _2987);
    float _3005 = fma(_2895, _2973, _2989);
    float _3007 = fma(_2889, _2979, _3001);
    float _3009 = _2987;
    float _3011 = _2979;
    float _3013 = _2943;
    float _3015 = _2981;
    float _3017 = _2921;
    if (_2969)
    {
        _3009 = _2943;
    }
    float _3019 = _3009;
    float _3021 = fma(_2901, _2979, _3003);
    float _3023 = fma(_2897, _2979, _3005);
    float _3025 = _3019;
    if (_2969)
    {
        _2699 = _2947;
    }
    float _3027 = _2699;
    float _3029 = _3027;
    if (_2969)
    {
        _3011 = _3019;
    }
    float _3031 = _3011;
    float _3033 = _3031;
    if (!_2969)
    {
        _3025 = _2943;
    }
    float _3035 = _3025;
    float _3037 = _2959 * _2991;
    float _3039 = _2953 * _2991;
    float _3041 = _2965 * _2991;
    if (_2969)
    {
        _3013 = _2945;
    }
    float _3043 = _3013;
    float _3045 = _2923 * _3037;
    float _3047 = _2921 * _3039;
    float _3049 = _3043;
    if (!_2969)
    {
        float _3051 = fma(_2861, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2945);
        _3049 = _3051;
    }
    float _3053 = _3049;
    if (_2969)
    {
        _3015 = _3027;
    }
    float _3055 = _3015;
    float _3057 = -_3045;
    float _3059 = fma(_2919, _3039, _3057);
    float _3061 = -_3047;
    float _3063 = fma(_2923, _3041, _3061);
    float _3065 = _3055;
    if (!_2969)
    {
        _3029 = _2947;
    }
    float _3067 = _3029;
    if (!_2969)
    {
        float _3069 = fma(_2869, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3035);
        _3033 = _3069;
    }
    float _3071 = _3033;
    float _3073 = _3059 * _3021;
    float _3075 = _2997 * _3035;
    float _3077 = _3063 * _3021;
    if (!_2969)
    {
        float _3079 = fma(_2871, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3067);
        _3065 = _3079;
    }
    float _3081 = _3065;
    float _3083 = fma(_3041, _3007, _3073);
    float _3085 = -_3075;
    float _3087 = fma(_2993, _3067, _3085);
    float _3089 = _2995 * _3067;
    float _3091 = fma(_3037, _3007, _3077);
    float _3093 = fma(_2921, _3023, _3083);
    float _3095 = _2993 * _2945;
    float _3097 = -_3089;
    float _3099 = fma(_2997, _2945, _3097);
    float _3101 = fma(_2919, _3023, _3091);
    float _3103 = _1353 + _3093;
    float _3105 = -_3095;
    float _3107 = fma(_2995, _3035, _3105);
    float _3109 = _3087 * _2999;
    float _3111 = _1679 + _3101;
    float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3115 = _3103 + _3113;
    float _3117 = _2919 * _3041;
    float _3119 = _3099 * _2999;
    float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3123 = _3111 + _3121;
    float _3125 = _3115 * _3115;
    float _3127 = -_3117;
    float _3129 = fma(_2921, _3037, _3127);
    float _3131 = _3107 * _2999;
    float _3133 = _2891 * _3063;
    float _3135 = fma(_3123, _3123, _3125);
    float _3137 = _2891 * _3129;
    float _3139 = _2891 * _3059;
    float _3141 = _2883 * _3063;
    float _3143 = sqrt(_3135);
    float _3145 = _2901 * _3063;
    float _3147 = _2901 * _3059;
    float _3149 = _2883 * _3129;
    float _3151 = _2901 * _3129;
    float _3153 = _3129 * _3021;
    float _3155 = fma(_2885, _3037, _3133);
    float _3157 = -_2831;
    float _3159 = fma(_3157, _3037, _3141);
    float _3161 = fma(_2889, _3037, _3145);
    float _3163 = fma(_2885, _3039, _3137);
    float _3165 = -_2831;
    float _3167 = fma(_3165, _3039, _3149);
    float _3169 = fma(_2889, _3039, _3151);
    float _3171 = fma(_3039, _3007, _3153);
    float _3173 = _2883 * _3059;
    float _3175 = fma(_2885, _3041, _3139);
    float _3177 = fma(_2887, _2919, _3159);
    bool _3179 = _3143 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3181 = fma(_2923, _3023, _3171);
    float _3183 = -_2831;
    float _3185 = fma(_3183, _3041, _3173);
    float _3187 = fma(_2897, _2919, _3161);
    float _3189 = fma(_2889, _3041, _3147);
    float _3191 = _1671 + _3181;
    float _3193 = fma(_2895, _2919, _3155);
    float _3195 = fma(_2895, _2923, _3163);
    float _3197 = fma(_2895, _2921, _3175);
    float _3199 = fma(_2887, _2923, _3167);
    float _3201 = fma(_2887, _2921, _3185);
    float _3203 = fma(_2897, _2921, _3189);
    float _3205 = fma(_2897, _2923, _3169);
    float _3207 = _3111;
    float _3209 = _3103;
    float _3211 = _3081;
    if (!_3179)
    {
        _3017 = _3191;
    }
    float _3213 = _3017;
    bool _3215 = !_3179;
    float _3217 = _3213;
    if (!_3215)
    {
        float _3219 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3223 = _3143 + _3221;
        float _3225 = _3191 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3227 = rsqrt(_3135);
        float _3229 = _3223 * _3219;
        float _3231 = _3229 * 0.15915493667125701904296875;
        float _3233 = _3231 * 6.283185482025146484375;
        float _3235 = cos(_3233);
        float _3237 = _3231 * 6.283185482025146484375;
        float _3239 = sin(_3237);
        float _3241 = _3235 + (-1.0);
        float _3243 = fma(_3239, _3225, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3245 = _3241 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3247 = _3227 * _3243;
        float _3249 = fma(_3191, _3235, _3245);
        float _3251 = fma(_3123, _3247, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3253 = fma(_3115, _3247, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3217 = _3249;
        _3207 = _3251;
        _3209 = _3253;
    }
    float _3255 = _3217;
    float _3257 = _3207;
    float _3259 = _3209;
    float _3261 = _3177 * _2995;
    float _3263 = _3199 * _2995;
    float _3265 = _3201 * _2995;
    float _3267 = -_2313;
    float _3269 = _3267 + _3255;
    float _3271 = _3177 * _3053;
    float _3273 = _3109 * _3177;
    float _3275 = _3199 * _3053;
    float _3277 = _3201 * _3053;
    float _3279 = _3109 * _3201;
    float _3281 = _3109 * _3199;
    float _3283 = fma(_3193, _2993, _3261);
    float _3285 = -_2325;
    float _3287 = _3285 + _3257;
    float _3289 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3291 = _3269 + _3289;
    float _3293 = fma(_3195, _2993, _3263);
    float _3295 = -_2331;
    float _3297 = _3295 + _3259;
    float _3299 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3301 = _3287 + _3299;
    float _3303 = _3291 * _3291;
    float _3305 = fma(_3193, _3071, _3271);
    float _3307 = fma(_3195, _3071, _3275);
    float _3309 = fma(_3197, _3071, _3277);
    float _3311 = fma(_3301, _3301, _3303);
    float _3313 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3315 = _3297 + _3313;
    float _3317 = fma(_3197, _2993, _3265);
    float _3319 = fma(_3119, _3193, _3273);
    float _3321 = fma(_3119, _3195, _3281);
    float _3323 = fma(_3315, _3315, _3311);
    float _3325 = fma(_3119, _3197, _3279);
    float _3327 = fma(_3187, _2997, _3283);
    float _3329 = fma(_3205, _2997, _3293);
    float _3331 = fma(_3203, _2997, _3317);
    float _3333 = fma(_3187, _3081, _3305);
    float _3335 = sqrt(_3323);
    float _3337 = fma(_3131, _3187, _3319);
    float _3339 = fma(_3205, _3081, _3307);
    float _3341 = fma(_3131, _3205, _3321);
    float _3343 = fma(_3131, _3203, _3325);
    float _3345 = fma(_3203, _3081, _3309);
    out.m_81.x = _3327;
    out.m_81.y = _3329;
    out.m_81.z = _3331;
    float _3347 = -_2325;
    float _3349 = _1679 + _3347;
    float _3351 = -_2313;
    float _3353 = _1671 + _3351;
    out.m_83.x = _3337;
    out.m_83.y = _3341;
    out.m_83.z = _3343;
    float _3355 = -_2331;
    float _3357 = _1353 + _3355;
    out.m_85.x = _3333;
    out.m_85.y = _3339;
    out.m_85.z = _3345;
    bool _3359 = _3335 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3361 = isnan(_3335);
    bool _3363 = _3359 || _3361;
    bool _3365 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3367 = _3363 || _3365;
    float _3369 = _3349;
    if (!_3367)
    {
        _3211 = 1.0;
    }
    float _3371 = _3211;
    bool _3373 = !_3367;
    float _3375 = _3371;
    if (!_3373)
    {
        bool _3377 = _3335 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3379 = isnan(_3335);
        bool _3381 = _3377 || _3379;
        bool _3383 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3385 = _3381 || _3383;
        if (!_3385)
        {
            float _3387 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3389 = _3335 + _3387;
            float _3391 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3393 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3391;
            float _3395 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3397 = _3395 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3399 = 1.0 / _3393;
            float _3401 = _3389 * _3399;
            float _3403 = fma(_3401, _3397, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3375 = _3403;
            _3405 = true;
        }
        else
        {
            bool _3407 = _3335 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3409 = isnan(_3335);
            bool _3411 = _3407 || _3409;
            bool _3413 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3415 = _3411 || _3413;
            if (!_3415)
            {
                float _3417 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3419 = _3335 + _3417;
                float _3421 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3423 = _3421 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3425 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3427 = _3425 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3429 = 1.0 / _3423;
                float _3431 = _3419 * _3429;
                float _3433 = fma(_3431, _3427, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3375 = _3433;
                _3405 = true;
            }
            else
            {
                _3375 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3405 = false;
    float _3435 = _3375;
    float _3437 = -_2461;
    float _3439 = _3437 + _3353;
    float _3441 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3443 = _3269 + _3441;
    float _3445 = -_2467;
    float _3447 = _3445 + _3349;
    float _3449 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3451 = _3287 + _3449;
    float _3453 = _3439 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3455 = fma(_3443, _3435, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3457 = -_2471;
    float _3459 = _3457 + _3357;
    float _3461 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3463 = _3297 + _3461;
    float _3465 = fma(_3447, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3453);
    float _3467 = fma(_3451, _3435, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3469 = -_3353;
    float _3471 = _3469 + _3455;
    float _3473 = fma(_3463, _3435, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3475 = fma(_3459, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3465);
    float _3477 = -_3349;
    float _3479 = _3477 + _3467;
    float _3481 = _3471 * _3471;
    float _3483 = _3439 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3485 = _3475 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3487 = -_3357;
    float _3489 = _3487 + _3473;
    float _3491 = fma(_3479, _3479, _3481);
    float _3493 = fma(_3447, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3483);
    float _3495 = 1.0 / _3485;
    float _3497 = fma(_3489, _3489, _3491);
    float _3499 = fma(_3459, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3493);
    float _3501 = _3499 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3503 = sqrt(_3497);
    float _3505 = _3501 + _3485;
    float _3507 = _3505 * _3495;
    float _3509 = _3507 * 0.5;
    bool _3511 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3513 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3515 = _3511 || _3513;
    bool _3517 = isnan(0.5);
    bool _3519 = _3515 || _3517;
    float _3521 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3523 = fma(_3509, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3521);
    bool _3525 = _3503 > 0.0;
    float _3527 = 1.0 / _3523;
    bool _3529 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3531 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3533 = _3529 || _3531;
    bool _3535 = isnan(0.5);
    bool _3537 = _3533 || _3535;
    float _3539 = _3495;
    float _3541 = _3475;
    float _3543 = _3455;
    float _3545 = _3497;
    float _3547 = _3459;
    float _3549 = _3439;
    if (!_3525)
    {
        _3539 = _3467;
    }
    float _3551 = _3539;
    float _3553 = _3551;
    float _3555 = _3551;
    if (!_3525)
    {
        _3541 = _3473;
    }
    float _3557 = _3541;
    bool _3559 = !_3525;
    float _3561 = _3557;
    if (!_3559)
    {
        float _3563 = _196 * _196;
        float _3565 = rsqrt(_3497);
        float _3567 = fma(_194, _194, _3563);
        float _3569 = fma(_198, _198, _3567);
        float _3571 = sqrt(_3569);
        float _3573 = _3479 * _3565;
        float _3575 = _3471 * _3565;
        float _3577 = _3489 * _3565;
        bool _3579 = _3571 > 0.0;
        float _3581 = _3571;
        if (!_3579)
        {
            _3553 = _3467;
        }
        float _3583 = _3553;
        _3555 = _3583;
        if (!_3579)
        {
            _3581 = _3473;
        }
        float _3585 = _3581;
        bool _3587 = !_3579;
        _3561 = _3585;
        if (!_3587)
        {
            float _3589 = rsqrt(_3569);
            float _3591 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3593 = _196 * _3589;
            float _3595 = _194 * _3589;
            float _3597 = _3575 * _3593;
            float _3599 = _198 * _3589;
            float _3601 = fma(_3573, _3595, _3597);
            float _3603 = _3591 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3605 = fma(_3577, _3599, _3601);
            float _3607 = _3605 * _3603;
            float _3609 = fma(_194, _3607, _3467);
            float _3611 = fma(_196, _3607, _3455);
            float _3613 = fma(_198, _3607, _3473);
            _3561 = _3613;
            _3555 = _3609;
            _3543 = _3611;
            _3545 = _3591;
        }
    }
    float _3615 = _3561;
    float _3617 = _3555;
    float _3619 = _3543;
    float _3621 = _3545;
    float _3623 = -_2471;
    float _3625 = _3623 + _3615;
    float _3627 = -_2467;
    float _3629 = _3627 + _3617;
    float _3631 = -_2461;
    float _3633 = _3631 + _3619;
    float _3635 = _3633;
    float _3637 = _3629;
    float _3639 = _3625;
    float _3641 = _3621;
    if (_3519)
    {
        _2645 = 1.0;
    }
    float _3643 = _2645;
    float _3645 = _3643;
    if (!_3537)
    {
        float _3647 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3649 = _3439 + _3647;
        float _3651 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3653 = _3447 + _3651;
        float _3655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3657 = -_3357;
        float _3659 = _3657 + _3615;
        float _3661 = _3649 * _3649;
        float _3663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3665 = _3459 + _3663;
        float _3667 = -_3353;
        float _3669 = _3667 + _3619;
        float _3671 = fma(_3653, _3653, _3661);
        float _3673 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3675 = fma(_3665, _3665, _3671);
        float _3677 = sqrt(_3675);
        float _3679 = 1.0 / _2663;
        float _3681 = _3673 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3683 = precise::min(_3677, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3685 = _3683 * _3655;
        float _3687 = _3685 * _3679;
        float _3689 = -_3349;
        float _3691 = _3689 + _3617;
        float _3693 = _3681 * _3687;
        float _3695 = _3659 * _3687;
        float _3697 = fma(_3691, _3693, _3447);
        float _3699 = fma(_3669, _3693, _3439);
        float _3701 = fma(_3681, _3695, _3459);
        _2701 = _3679;
        _3635 = _3699;
        _3637 = _3697;
        _3639 = _3701;
    }
    float _3703 = _2701;
    float _3705 = _3635;
    float _3707 = _3637;
    float _3709 = _3639;
    float _3711 = _3703;
    if (_3519)
    {
        _3711 = 1.0;
    }
    float _3713 = _3711;
    float _3715 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3717 = _3527 * _3715;
    float _3719 = _3713;
    if (!_3519)
    {
        float _3721 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3723 = _3721 * 0.15915493667125701904296875;
        float _3725 = _3723 * 6.283185482025146484375;
        float _3727 = cos(_3725);
        float _3729 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3731 = _3729 * 0.15915493667125701904296875;
        float _3733 = _3723 * 6.283185482025146484375;
        float _3735 = sin(_3733);
        float _3737 = 1.0 / _3727;
        float _3739 = _3731 * 6.283185482025146484375;
        float _3741 = cos(_3739);
        float _3743 = _3735 * _3737;
        float _3745 = _3731 * 6.283185482025146484375;
        float _3747 = sin(_3745);
        float _3749 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3751 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3749;
        float _3753 = _3741 * _3743;
        float _3755 = 1.0 / _3753;
        float _3757 = 1.0 / _3751;
        float _3759 = _3747 * _3755;
        float _3761 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3763 = fma(_3717, _3759, _3761);
        float _3765 = _3763 * _3757;
        float _3767 = precise::clamp(_3765, 0.0, 1.0);
        _202 = _3731;
        _3645 = _3767;
    }
    float _3769 = _202;
    float _3771 = _3645;
    float _3773 = _3769;
    if (!_3519)
    {
        float _3775 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3777 = _3775 * 0.15915493667125701904296875;
        float _3779 = _3777 * 6.283185482025146484375;
        float _3781 = cos(_3779);
        float _3783 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3785 = _3783 * 0.15915493667125701904296875;
        float _3787 = _3777 * 6.283185482025146484375;
        float _3789 = sin(_3787);
        float _3791 = 1.0 / _3781;
        float _3793 = _3785 * 6.283185482025146484375;
        float _3795 = cos(_3793);
        float _3797 = _3789 * _3791;
        float _3799 = _3785 * 6.283185482025146484375;
        float _3801 = sin(_3799);
        float _3803 = _3795 * _3797;
        float _3805 = 1.0 / _3803;
        float _3807 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3809 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3807;
        float _3811 = 1.0 / _3809;
        float _3813 = _3801 * _3805;
        float _3815 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3817 = fma(_3717, _3813, _3815);
        float _3819 = _3817 * _3811;
        float _3821 = precise::clamp(_3819, 0.0, 1.0);
        float _3823 = -_3821;
        float _3825 = _3823 + 1.0;
        _3773 = _3781;
        _3719 = _3825;
    }
    float _3827 = _3773;
    float _3829 = _3719;
    float _3831 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3833 = _3705 + _3831;
    float _3835 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3837 = _3707 + _3835;
    float _3839 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3841 = _3709 + _3839;
    float _3843 = _3833 * _3833;
    float _3845 = fma(_3837, _3837, _3843);
    float _3847 = fma(_3841, _3841, _3845);
    float _3849 = rsqrt(_3847);
    float _3851 = _3849 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3853 = _3837 * _3851;
    float _3855 = _3841 * _3851;
    float _3857 = _3853 * _3853;
    float _3859 = _3855 * _3855;
    float _3861 = _3857 + _3859;
    float _3863 = sqrt(_3861);
    bool _3865 = _3863 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3869 = _3863 + _3867;
    float _3871 = _3849;
    float _3873 = _3861;
    float _3875 = _3869;
    float _3877 = _3833;
    if (_3865)
    {
        float _3879 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3871 = _3879;
    }
    float _3881 = _3871;
    if (_3865)
    {
        float _3883 = rsqrt(_3861);
        _3873 = _3883;
    }
    float _3885 = _3873;
    float _3887 = _3885;
    if (_3865)
    {
        float _3889 = _3869 * _3881;
        _3875 = _3889;
    }
    float _3891 = _3875;
    if (_3865)
    {
        float _3893 = _3891 * 0.15915493667125701904296875;
        _3641 = _3893;
    }
    float _3895 = _3641;
    float _3897 = _3827;
    float _3899 = _3895;
    if (_3865)
    {
        float _3901 = _3895 * 6.283185482025146484375;
        float _3903 = sin(_3901);
        _3897 = _3903;
    }
    float _3905 = _3897;
    float _3907 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3909 = precise::max(0.0, _3907);
    float _3911 = _3841;
    float _3913 = _3909;
    float _3915 = _3907;
    if (_3865)
    {
        float _3917 = _3895 * 6.283185482025146484375;
        float _3919 = cos(_3917);
        _3911 = _3919;
    }
    float _3921 = _3911;
    float _3923 = -_3851;
    float _3925 = -_3909;
    float _3927 = fma(_3833, _3923, _3925);
    float _3929 = _3927;
    if (!_3865)
    {
        _3877 = _3857;
    }
    float _3931 = _3877;
    float _3933 = _3931;
    if (_3865)
    {
        float _3935 = _3927 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3913 = _3935;
    }
    float _3937 = _3913;
    float _3939 = _3937;
    if (!_3865)
    {
        _3899 = _3853;
    }
    float _3941 = _3899;
    float _3943 = _3905;
    float _3945 = _3941;
    if (_3865)
    {
        float _3947 = fma(_3905, _3937, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3943 = _3947;
    }
    float _3949 = _3943;
    float _3951 = _3921;
    if (_3865)
    {
        float _3953 = _3921 + (-1.0);
        _3915 = _3953;
    }
    float _3955 = _3915;
    if (_3865)
    {
        float _3957 = _3885 * _3949;
        _3369 = _3957;
    }
    float _3959 = _3369;
    if (!_3865)
    {
        _3887 = _3855;
    }
    float _3961 = _3887;
    float _3963 = _3961;
    if (_3865)
    {
        float _3965 = _3955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3939 = _3965;
    }
    float _3967 = _3939;
    if (_3865)
    {
        float _3969 = _3853 * _3959;
        _3945 = _3969;
    }
    float _3971 = _3945;
    float _3973 = sqrt(_3847);
    if (_3865)
    {
        float _3975 = _3855 * _3959;
        _3963 = _3975;
    }
    float _3977 = _3963;
    if (_3865)
    {
        float _3979 = fma(_3927, _3921, _3967);
        _3929 = _3979;
    }
    float _3981 = _3929;
    if (_3865)
    {
        float _3983 = _3971 * _3971;
        _3933 = _3983;
    }
    float _3985 = _3933;
    if (!_3865)
    {
        _3951 = _3859;
    }
    float _3987 = _3951;
    float _3989 = _3987;
    if (_3865)
    {
        float _3991 = _3977 * _3977;
        _3989 = _3991;
    }
    float _3993 = _3989;
    float _3995 = fma(_3981, _3981, _3985);
    float _3997 = _3705 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3999 = _3705 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4001 = _3995 + _3993;
    float _4003 = fma(_3707, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3997);
    float _4005 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4007 = rsqrt(_4001);
    float _4009 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4011 = fma(_3973, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4009);
    float _4013 = precise::clamp(_4011, 0.0, 1.0);
    float _4015 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4003);
    float _4017 = fma(_3459, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4019 = _3705 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4021 = -_4013;
    float _4023 = _4021 + 1.0;
    float _4025 = _4015 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4027 = fma(_3707, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4019);
    float _4029 = abs(_4023);
    float _4031 = log2(_4029);
    float _4033 = _4025 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4035 = fma(_3707, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3999);
    float _4037 = fma(_3447, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4039 = -_4033;
    float _4041 = fma(_4039, _4005, 1.0);
    float _4043 = _3705 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4045 = _4007 * _3971;
    float _4047 = _4007 * _3981;
    float _4049 = _4007 * _3977;
    float _4051 = fma(_3707, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4043);
    float _4053 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4027);
    float _4055 = _4045 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4057 = floor(_4037);
    float _4059 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4051);
    float _4061 = _4053 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4063 = -_4055;
    float _4065 = fma(_4047, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4063);
    float _4067 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4035);
    float _4069 = _4059 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4071 = _4061 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4073 = -_4049;
    float _4075 = fma(_4073, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4065);
    float _4077 = floor(_4017);
    float _4079 = _4031 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4081 = fma(_4069, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4071);
    float _4083 = _4067 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4085 = fma(_4075, -0.5, 0.5);
    float _4087 = fma(_4075, 0.5, 0.5);
    float _4089 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4081);
    float _4091 = exp2(_4079);
    float _4093 = -_4057;
    float _4095 = _4037 + _4093;
    float _4097 = fma(_4083, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4089);
    float _4099 = _4061 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4101 = sqrt(_4085);
    float _4103 = _4061 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4105 = -_4077;
    float _4107 = _4017 + _4105;
    float _4109 = fma(_4087, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4111 = fma(_4069, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4099);
    float _4113 = fma(_4069, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4103);
    float _4115 = _4047 + 1.0;
    float _4117 = fma(_4087, _4109, -0.212114393711090087890625);
    float _4119 = log2(_4041);
    float _4121 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4111);
    float _4123 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4113);
    float _4125 = -_4047;
    float _4127 = fma(_4091, _4115, _4125);
    float _4129 = 1.0 / _4097;
    float _4131 = fma(_4083, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4121);
    float _4133 = fma(_4083, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4123);
    float _4135 = _4101 * 0.636619746685028076171875;
    float2 _10732 = float2(_4095, _4107);
    float _4137 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10732, float2(0.0), isnan(_10732)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10732, float2(0.0), isnan(_10732)), level(0.0)).x;
    float _4139 = fma(_4087, _4117, 1.570728778839111328125);
    float _4141 = _4119 * 0.693147182464599609375;
    float _4143 = -_4139;
    float _4145 = fma(_4135, _4143, 1.0);
    float _4147 = _4141 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4149 = fma(_4127, 0.5, 0.5);
    float _4151 = _4131 * _4129;
    float _4153 = _4133 * _4129;
    float _4155 = fma(_4151, 0.5, 0.5);
    float _4157 = fma(_4153, -0.5, 0.5);
    float3 _10771 = float3(_4155, _4157, _4147);
    float _4159 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10771, float3(0.0), isnan(_10771)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10771, float3(0.0), isnan(_10771)), level(0.0)).x;
    float3 _10782 = float3(_4155, _4157, _4147);
    float4 _4162 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10782, float3(0.0), isnan(_10782)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10782, float3(0.0), isnan(_10782)), level(0.0)).xyzw;
    float _4164 = _4162.x;
    float _4166 = _4162.y;
    float _4168 = _4162.z;
    float _4170 = _4162.w;
    float2 _10798 = float2(_4145, _4149);
    float3 _4174 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10798, float2(0.0), isnan(_10798)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10798, float2(0.0), isnan(_10798)), level(0.0)).xyz;
    float _4176 = _4174.x;
    float _4178 = _4174.y;
    float _4180 = _4174.z;
    float _4182 = abs(_3717);
    float _4184 = log2(_4182);
    float _4186 = _4031 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4188 = in.m_87.x;
    bool _4190 = _3973 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4192 = isnan(_3973);
    bool _4194 = _4190 || _4192;
    bool _4196 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4198 = _4194 || _4196;
    float _4200 = exp2(_4186);
    bool _4202 = _3717 <= 8000.0;
    bool _4204 = isnan(_3717);
    bool _4206 = _4202 || _4204;
    bool _4208 = isnan(8000.0);
    bool _4210 = _4206 || _4208;
    float _4212 = float(_4210);
    out.m_89.x = _3447;
    out.m_89.y = _3439;
    out.m_89.z = _3459;
    out.m_91.x = _3707;
    out.m_91.y = _3705;
    out.m_91.z = _3709;
    float _4214 = _4184 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4216 = exp2(_4214);
    float _4218 = _4131;
    if (!_4198)
    {
        _3547 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4220 = _3547;
    float _4222 = -_4200;
    float _4224 = _4222 + 1.0;
    float _4226 = _4224;
    float _4228 = _4220;
    float _4230 = _4220;
    if (!_4198)
    {
        _3549 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4232 = _3549;
    float _4234 = fma(_4216, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4236 = precise::clamp(_4234, 0.0, 1.0);
    float _4238 = fma(_4236, -2.0, 3.0);
    float _4240 = _4236 * _4236;
    float _4242 = _4061 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4244 = _4240 * _4238;
    float _4246 = fma(_4069, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4242);
    float _4248 = -_4244;
    float _4250 = _4248 + 1.0;
    float _4252 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4246);
    float _4254 = _4131 + _4097;
    float _4256 = fma(_4250, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4244);
    float _4258 = _4097 * 0.5;
    float _4260 = fma(_4083, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4252);
    float _4262 = _4254 * 0.5;
    float _4264 = _4212 * _4256;
    float _4266 = fma(_4133, -0.5, _4258);
    float _4268 = _4224 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4270 = _4264 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4272 = _4260 + _4097;
    out.gl_Position.x = _4131;
    out.gl_Position.y = _4133;
    out.gl_Position.z = _4260;
    out.gl_Position.w = _4097;
    float _4274 = _4232;
    float _4276 = _4232;
    if (!_4198)
    {
        _4226 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4278 = _4226;
    float _4280 = _4272 * 0.5;
    out.m_93.x = _4262;
    out.m_93.y = _4266;
    out.m_93.z = _4280;
    out.m_93.w = _4097;
    float _4282 = _4278;
    float _4284 = _4278;
    if (!_4198)
    {
        _4218 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4286 = _4218;
    float _4288 = -_4137;
    float _4290 = _4288 + 1.0;
    float _4292 = _4290 * _4270;
    float _4294 = precise::clamp(_4292, 0.0, 1.0);
    float _4296 = -_4294;
    float _4298 = fma(_4296, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4300 = _4298 * _4188;
    float _4302 = _4300 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4304 = _4300;
    float _4306 = _4286;
    float _4308 = _4286;
    if (!_4198)
    {
        _4304 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4310 = _4304;
    float _4312 = _4268 * _4159;
    float _4314 = -_4268;
    float _4316 = _4314 + 1.0;
    out.m_95.x = _4302;
    float _4318 = _4170 * _4312;
    float _4320 = _4180 * _4312;
    float _4322 = _4170 * _4316;
    float _4324 = fma(_4176, _4318, _4164);
    float _4326 = fma(_4178, _4318, _4166);
    float _4328 = fma(_4170, _4320, _4168);
    float _4330 = _3771 * _3829;
    out.m_97.x = _4324;
    out.m_97.y = _4326;
    out.m_97.z = _4328;
    out.m_97.w = _4322;
    float _4332 = _4330 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4334 = _4330;
    float _4336 = _4310;
    float _4338 = _4310;
    if (!_4198)
    {
        _4334 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4340 = _4334;
    bool _4342 = !_4198;
    float _4344 = _4340;
    float _4346 = _4340;
    if (!_4342)
    {
        bool _4348 = _3973 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4350 = isnan(_3973);
        bool _4352 = _4348 || _4350;
        bool _4354 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4356 = _4352 || _4354;
        if (!_4356)
        {
            float _4358 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4360 = _3973 + _4358;
            float _4362 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4364 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4362;
            float _4366 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4368 = _4366 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4370 = 1.0 / _4364;
            float _4372 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4374 = _4372 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4376 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4378 = _4376 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4380 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4382 = _4380 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4384 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4386 = _4384 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4388 = _4360 * _4370;
            float _4390 = precise::clamp(_4388, 0.0, 1.0);
            float _4392 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4394 = _4392 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4396 = fma(_4390, _4368, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4398 = fma(_4390, _4394, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4400 = fma(_4390, _4374, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4402 = fma(_4390, _4378, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4404 = fma(_4390, _4382, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4406 = fma(_4390, _4386, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4308 = _4400;
            _4276 = _4404;
            _4284 = _4396;
            _4230 = _4402;
            _4338 = _4398;
            _4346 = _4406;
            _4408 = true;
        }
        else
        {
            bool _4410 = _3973 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4412 = isnan(_3973);
            bool _4414 = _4410 || _4412;
            bool _4416 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4418 = _4414 || _4416;
            if (!_4418)
            {
                _4282 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4420 = _4282;
            _4284 = _4420;
            if (!_4418)
            {
                _4306 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4422 = _4306;
            _4308 = _4422;
            if (!_4418)
            {
                _4336 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4424 = _4336;
            _4338 = _4424;
            if (!_4418)
            {
                _4228 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4426 = _4228;
            _4230 = _4426;
            if (!_4418)
            {
                _4274 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4428 = _4274;
            _4276 = _4428;
            if (!_4418)
            {
                _4344 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4430 = _4344;
            bool _4432 = !_4418;
            _4346 = _4430;
            if (!_4432)
            {
                bool _4434 = _3973 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4436 = isnan(_3973);
                bool _4438 = _4434 || _4436;
                bool _4440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4442 = _4438 || _4440;
                if (!_4442)
                {
                    float _4444 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4446 = _3973 + _4444;
                    float _4448 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4450 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4448;
                    float _4452 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4454 = _4452 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4456 = 1.0 / _4450;
                    float _4458 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4460 = _4458 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4462 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4464 = _4462 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4466 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4468 = _4466 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4470 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4472 = _4470 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4474 = _4446 * _4456;
                    float _4476 = precise::clamp(_4474, 0.0, 1.0);
                    float _4478 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4480 = _4478 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4482 = fma(_4476, _4454, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4484 = fma(_4476, _4480, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4486 = fma(_4476, _4460, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4488 = fma(_4476, _4464, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4490 = fma(_4476, _4468, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4492 = fma(_4476, _4472, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4308 = _4486;
                    _4276 = _4490;
                    _4284 = _4482;
                    _4230 = _4488;
                    _4338 = _4484;
                    _4346 = _4492;
                    _4408 = true;
                }
                else
                {
                    _4308 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4276 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4284 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4230 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4338 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4346 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4408 = false;
    float _4494 = _4308;
    float _4496 = _4276;
    float _4498 = _4284;
    float _4500 = _4230;
    float _4502 = _4338;
    float _4504 = _4346;
    float _4506 = fma(_3339, -0.5, 0.5);
    float _4508 = precise::clamp(_4506, 0.0, 1.0);
    float _4510 = -_4494;
    float _4512 = _4510 + _4496;
    float _4514 = _4332 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4516 = -_4498;
    float _4518 = _4516 + _4500;
    out.m_99.x = 0.0;
    float _4520 = fma(_4508, _4512, _4494);
    float _4522 = fma(_4508, _4518, _4498);
    out.m_51.x = _4514;
    float _4524 = -_4502;
    float _4526 = _4524 + _4504;
    float _4528 = _4520 * 0.586610972881317138671875;
    bool _4530 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4532 = fma(_4508, _4526, _4502);
    float _4534 = fma(_4522, 0.298911988735198974609375, _4528);
    bool _4536 = _3771 > 0.0;
    bool _4538 = isnan(_3771);
    bool _4540 = _4536 || _4538;
    bool _4542 = isnan(0.0);
    bool _4544 = _4540 || _4542;
    float _4546 = fma(_4532, 0.114477999508380889892578125, _4534);
    bool _4548 = _3829 <= 0.0;
    bool _4550 = !_4544;
    bool _4552 = _4548 || _4550;
    float _4554 = -_4546;
    float _4556 = _4522 + _4554;
    float _4558 = -_4546;
    float _4560 = _4520 + _4558;
    float _4562 = -_4546;
    float _4564 = _4532 + _4562;
    float _4566 = fma(_4556, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4546);
    float _4568 = fma(_4560, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4546);
    float _4570 = fma(_4564, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4546);
    bool _4572 = !_4530;
    if (!_4572)
    {
        float _4574 = -_3705;
        float _4576 = _4574 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4578 = -_3707;
        float _4580 = _4578 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4582 = -_3709;
        float _4584 = _4582 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4586 = _4576 * _4576;
        float _4588 = fma(_4580, _4580, _4586);
        float _4590 = fma(_4584, _4584, _4588);
        float _4592 = sqrt(_4590);
        float _4594 = rsqrt(_4590);
        float _4596 = -_4592;
        float _4598 = _4596 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4600 = _4598 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4602 = precise::clamp(_4600, 0.0, 1.0);
        float _4604 = _4580 * _4594;
        float _4606 = _4576 * _4594;
        float _4608 = abs(_4602);
        float _4610 = log2(_4608);
        float _4612 = _4584 * _4594;
        float _4614 = _4604 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4616 = _3339 * _4606;
        float _4618 = -_4606;
        float _4620 = -_4614;
        float _4622 = fma(_4618, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4620);
        float _4624 = fma(_3333, _4604, _4616);
        float _4626 = -_4612;
        float _4628 = fma(_4626, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4622);
        float _4630 = fma(_3345, _4612, _4624);
        float _4632 = precise::clamp(_4630, 0.0, 1.0);
        float _4634 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4636 = _4628 + _4634;
        float _4638 = _4610 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4640 = _4636 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4642 = precise::clamp(_4640, 0.0, 1.0);
        float _4644 = exp2(_4638);
        float _4646 = _4644 * _4642;
        float _4648 = _4632 * _4646;
        float _4650 = _4648 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4652 = _4648 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4654 = _4648 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _4650;
        out.m_99.y = _4652;
        out.m_99.z = _4654;
    }
    out.m_69.x = _4566;
    out.m_69.y = _4568;
    out.m_69.z = _4570;
    if (!_4552)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _4656 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4656;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4408 = false;
    bool _3405 = false;
    bool _402 = false;
    bool _222 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_51.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4713 = as_type<float>(_134);
        out.gl_Position.z = _4713;
    }
    if (!_122)
    {
        return out;
    }
    float _138 = in.m_53.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = _152;
    if (_148)
    {
        float _156 = float(_118);
        _128 = _156;
    }
    float _158 = _128;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    float _166 = _158;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_51.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4783 = as_type<float>(_172);
        out.gl_Position.z = _4783;
    }
    if (_164)
    {
        return out;
    }
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = _176 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _184 = _176 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _186 = _176 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _188 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].x, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].x, _186);
    float _194 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[4].z, _188);
    float _196 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[5].z, _190);
    float _198 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[6].z, _192);
    bool _200 = !_180;
    float _202 = _198;
    float _220;
    if (!_200)
    {
        float _204 = in.m_57.x;
        float _206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _210 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _212 = _210 * _206;
        float _214 = floor(_212);
        float _216 = -_214;
        float _218 = _212 + _216;
        _220 = _218;
        _222 = true;
    }
    else
    {
        float _224 = float(_118);
        float _226 = 1.0 / _224;
        float _228 = _152 * _226;
        _220 = _228;
    }
    _222 = false;
    float _230 = _220;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = _230 + _232;
    bool _236 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _238 = isnan(_230);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _230 + _248;
    bool _252 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _254 = isnan(_230);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _268 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _272 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _274 = isnan(_230);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -_246;
    float _286 = _284 + 1.0;
    float _288 = 1.0 / _270;
    float _290 = _282 * _286;
    float _292 = -_282;
    float _294 = _292 + 1.0;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _296;
    float _300 = in.m_59.x;
    float _302 = in.m_59.y;
    float _304 = in.m_59.z;
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _308 = 1.0 / _266;
    float _310 = _262 * _294;
    float _312 = -_262;
    float _314 = _312 + 1.0;
    float _316 = _250 * _288;
    float _318 = _234 * _308;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _324;
    float _328 = fma(_298, _318, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _330 = fma(_322, _318, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _332 = fma(_326, _318, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _334 = _328 * _310;
    float _336 = _330 * _310;
    float _338 = _332 * _310;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _352 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].x, _334);
    float _354 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].y, _336);
    float _356 = fma(_342, _316, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _358 = fma(_346, _316, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _360 = fma(_350, _316, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _362 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].z, _338);
    float _364 = fma(_356, _290, _352);
    float _366 = fma(_358, _290, _354);
    float _368 = fma(_360, _290, _362);
    float _370 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[145].x, _364);
    float _372 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[145].y, _366);
    float _374 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[145].z, _368);
    float _376 = _370 * _300;
    float _378 = _372 * _302;
    float _380 = _374 * _304;
    bool _382 = !_306;
    float _400;
    if (!_382)
    {
        float _384 = in.m_57.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_118);
        float _406 = 1.0 / _404;
        float _408 = _152 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _414 = int(_412);
    float _416 = in.m_57.x;
    float _418 = in.m_57.y;
    float _420 = float(_118);
    float _422 = in.m_61.x;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _426 = _424 != 0;
    float _428 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _430 = int(_428);
    float _432 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _434 = int(_432);
    float _436 = float(_414);
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _444 = float(_430);
    float _446 = 1.0 / _436;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _450 = float(uint(_434));
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _454 = int(_452);
    int _456 = ~_434;
    int _458 = _456 + 1;
    bool _460 = _434 == 0;
    int _462 = ~_434;
    int _464 = _462 + 1;
    float _466 = 1.0 / _444;
    float _468 = _152 * _446;
    float _470 = float(uint(_454));
    float _472 = 1.0 / _450;
    int _474 = ~_454;
    int _476 = _474 + 1;
    int _478 = ~_454;
    int _480 = _478 + 1;
    float _482 = _152 * _466;
    float _484 = trunc(_468);
    int _486 = int(_484);
    float _488 = _466;
    float _490 = _422;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_426)
    {
        float _494 = in.m_57.x;
        _488 = _494;
    }
    float _496 = _488;
    float _498 = _496;
    if (!_426)
    {
        float _500 = in.m_57.y;
        _498 = _500;
    }
    float _502 = _498;
    float _504 = 1.0 / _470;
    int _506 = as_type<int>(_472) + (-2);
    float _508 = trunc(_482);
    int _510 = int(_508);
    float _512 = float(uint(_486));
    float _514 = as_type<float>(_506) * _512;
    int _516 = as_type<int>(_504) + (-2);
    float _518 = 1.0 / _420;
    int _520 = ~_454;
    int _522 = _520 + 1;
    float _524 = float(uint(_510));
    float _526 = trunc(_514);
    float _528 = precise::max(_526, 0.0);
    uint _531 = uint(_528);
    float _533 = as_type<float>(_516) * _524;
    int _535 = ~_434;
    int _537 = _535 + 1;
    float _539 = trunc(_533);
    float _541 = precise::max(_539, 0.0);
    uint _543 = uint(_541);
    int _545 = _537 * int(_531);
    int _547 = _545 + _486;
    float _549 = 1.0 / _442;
    float _551 = float(uint(_547));
    int _553 = _522 * int(_543);
    int _555 = _553 + _510;
    float _557 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _559 = int(_557);
    float _561 = as_type<float>(_506) * _551;
    float _563 = _551;
    if (_426)
    {
        _563 = 1.0;
    }
    float _565 = _563;
    float _567 = float(uint(_555));
    float _569 = _565;
    if (!_426)
    {
        _569 = 7.345489978790283203125;
    }
    float _571 = _569;
    float _573 = trunc(_561);
    float _575 = precise::max(_573, 0.0);
    uint _577 = uint(_575);
    float _579 = as_type<float>(_516) * _567;
    float _581 = _571 * _416;
    float _583 = trunc(_579);
    float _585 = precise::max(_583, 0.0);
    uint _587 = uint(_585);
    int _589 = int(_531) + int(_577);
    float _591 = floor(_581);
    float _593 = float(_434);
    float _595 = as_type<float>(_577);
    if (_426)
    {
        _595 = 1.0;
    }
    float _597 = _595;
    int _599 = _458 * _589;
    int _601 = _599 + _486;
    float _603 = _597;
    if (!_426)
    {
        _603 = 1.2345600128173828125;
    }
    float _605 = _603;
    int _607 = int(_543) + int(_587);
    float _609 = float(_486);
    float _611 = _502 * _605;
    bool _613 = uint(_601) >= uint(_434);
    int _615 = _476 * _607;
    int _617 = _615 + _510;
    bool _619 = _609 >= _593;
    bool _621 = isnan(_609);
    bool _623 = _619 || _621;
    bool _625 = isnan(_593);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    bool _631 = !_613;
    int _633 = _631 ? 0 : (-1);
    float _635 = -_591;
    float _637 = _581 + _635;
    float _639 = trunc(_629);
    int _641 = int(_639);
    int _643 = ~_589;
    int _645 = _643 + _633;
    int _647 = _645 + 1;
    float _649 = _637 * _593;
    float _651 = _152 * _593;
    bool _653 = uint(_617) >= uint(_454);
    int _655 = _434 * _647;
    int _657 = _655 + _486;
    float _659 = _651 * _518;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _663 = _661 != 0;
    float _665 = trunc(_649);
    int _667 = int(_665);
    bool _669 = !_653;
    int _671 = _669 ? 0 : (-1);
    bool _673 = !_460;
    int _675 = _673 ? _657 : (-1);
    int _677 = ~_641;
    int _679 = _677 + 1;
    int _681 = _679 + 1;
    int _683 = _434 + (-1);
    bool _685 = !_663;
    int _687 = _685 ? 0 : 1;
    int _689 = _675 * _681;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _697 = _695 != 0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _701 = _699 != 0;
    int _703 = abs(_687);
    int _705 = _641 * _683;
    int _707 = _705 + _689;
    float _709 = float(_454);
    float _711 = trunc(_659);
    int _713 = int(_711);
    bool _715 = !_697;
    int _717 = _715 ? 0 : 1;
    int _719 = _667 * _703;
    int _721 = _719 + _486;
    float _723 = float(_510);
    int _725 = ~_607;
    int _727 = _725 + _671;
    int _729 = _727 + 1;
    int _731 = abs(_717);
    float _733 = floor(_611);
    bool _735 = !_693;
    int _737 = _735 ? 0 : 1;
    bool _739 = _723 >= _709;
    bool _741 = isnan(_723);
    bool _743 = _739 || _741;
    bool _745 = isnan(_709);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    int _751 = abs(_737);
    bool _753 = !_701;
    int _755 = _753 ? 0 : 1;
    float _757 = trunc(_749);
    int _759 = int(_757);
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _763 = _761 != 0;
    float _765 = _152 * _709;
    int _767 = abs(_755);
    int _769 = _707 * _731;
    bool _771 = !_763;
    int _773 = _771 ? 0 : 1;
    float _775 = _765 * _518;
    int _777 = _713 * _751;
    int _779 = _777 + _769;
    int _781 = abs(_773);
    int _783 = _454 * _729;
    int _785 = _783 + _510;
    bool _787 = _454 == 0;
    int _789 = _721 * _767;
    int _791 = _789 + _779;
    float _793 = -_733;
    float _795 = _611 + _793;
    bool _797 = !_787;
    int _799 = _797 ? _785 : (-1);
    float _801 = trunc(_775);
    int _803 = int(_801);
    int _805 = ~_759;
    int _807 = _805 + 1;
    int _809 = _807 + 1;
    int _811 = _667 * _781;
    int _813 = _811 + _791;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _817 = _815 != 0;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _821 = _819 != 0;
    float _823 = _709 * _795;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _827 = _825 != 0;
    int _829 = _809 * _799;
    float _831 = float(uint(_813));
    float _833 = trunc(_823);
    int _835 = int(_833);
    bool _837 = !_821;
    int _839 = _837 ? 0 : 1;
    float _841 = in.m_61.y;
    int _843 = _454 + (-1);
    float _845 = as_type<float>(_506) * _831;
    int _847 = abs(_839);
    bool _849 = !_827;
    int _851 = _849 ? 0 : 1;
    int _853 = _759 * _843;
    int _855 = _853 + _829;
    bool _857 = !_817;
    int _859 = _857 ? 0 : 1;
    float _861 = trunc(_845);
    float _863 = precise::max(_861, 0.0);
    uint _865 = uint(_863);
    int _867 = abs(_851);
    int _869 = abs(_859);
    int _871 = _855 * _847;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _879 = _877 != 0;
    int _881 = _835 * _867;
    int _883 = _881 + _510;
    int _885 = ~_434;
    int _887 = _885 + 1;
    bool _889 = !_875;
    int _891 = _889 ? 0 : 1;
    int _893 = _803 * _869;
    int _895 = _893 + _871;
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _899 = _897 != 0;
    int _901 = abs(_891);
    int _903 = _887 * int(_865);
    int _905 = _903 + _813;
    bool _907 = !_879;
    int _909 = _907 ? 0 : 1;
    float _911 = float(uint(_905));
    int _913 = abs(_909);
    int _915 = _883 * _901;
    int _917 = _915 + _895;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _921 = _919 != 0;
    float _923 = as_type<float>(_506) * _911;
    int _925 = ~_434;
    int _927 = _925 + 1;
    int _929 = _835 * _913;
    int _931 = _929 + _917;
    int _933 = ~_454;
    int _935 = _933 + 1;
    float _937 = trunc(_923);
    float _939 = precise::max(_937, 0.0);
    uint _941 = uint(_939);
    int _943 = _835;
    float _945 = _923;
    bool _947 = _821;
    float _949 = _841;
    bool _951 = _787;
    if (_899)
    {
        float _953 = in.m_57.x;
        _943 = as_type<int>(_953);
    }
    int _955 = _943;
    float _957 = 0.0;
    if (!_899)
    {
        _957 = _422;
    }
    float _959 = _957;
    float _961 = float(uint(_931));
    bool _963 = _434 == 0;
    int _965 = ~_454;
    int _967 = _965 + 1;
    float _969 = as_type<float>(_516) * _961;
    float _971 = _959;
    if (_921)
    {
        float _973 = in.m_57.z;
        _945 = _973;
    }
    float _975 = _945;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _979 = _977 != 0;
    float _981 = trunc(_969);
    float _983 = precise::max(_981, 0.0);
    uint _985 = uint(_983);
    bool _987 = !_979;
    int _989 = _987 ? 0 : 1;
    int _991 = int(_865) + int(_941);
    float _993 = in.m_57.w;
    int _995 = _927 * _991;
    int _997 = _995 + _813;
    int _999 = _955;
    if (_899)
    {
        bool _1001 = as_type<float>(_955) > 0.5;
        _947 = _1001;
    }
    bool _1003 = _947;
    if (_899)
    {
        float _1005 = -_422;
        float _1007 = _1005 + 1.0;
        _999 = as_type<int>(_1007);
    }
    int _1009 = _999;
    bool _1011 = uint(_997) >= uint(_434);
    int _1013 = _935 * int(_985);
    int _1015 = _1013 + _931;
    if (_899)
    {
        float _1017 = _1003 ? as_type<float>(_1009) : _422;
        _971 = _1017;
    }
    float _1019 = _971;
    bool _1021 = !_1011;
    int _1023 = _1021 ? 0 : (-1);
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1027 = _1025 != 0;
    int _1029 = ~_991;
    int _1031 = _1029 + _1023;
    int _1033 = _1031 + 1;
    float _1035 = -_841;
    float _1037 = _1035 + 1.0;
    float _1039 = float(uint(_1015));
    bool _1041 = _418 > 0.5;
    int _1043 = _434 * _1033;
    int _1045 = _1043 + _813;
    int _1047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1049 = _1047 != 0;
    float _1051 = as_type<float>(_516) * _1039;
    int _1053 = _1041 ? as_type<int>(_1037) : as_type<int>(_841);
    bool _1055 = _993 > 0.5;
    float _1057 = trunc(_1051);
    float _1059 = precise::max(_1057, 0.0);
    uint _1061 = uint(_1059);
    float _1063 = _1049 ? as_type<float>(_1053) : _841;
    int _1065 = as_type<int>(_1037);
    bool _1067 = _1049;
    if (_1027)
    {
        float _1069 = _1055 ? _1037 : _841;
        _949 = _1069;
    }
    float _1071 = _949;
    if (_921)
    {
        float _1073 = -_422;
        float _1075 = _1073 + 1.0;
        _1065 = as_type<int>(_1075);
    }
    int _1077 = _1065;
    if (_921)
    {
        bool _1079 = _975 > 0.5;
        _1067 = _1079;
    }
    bool _1081 = _1067;
    bool _1083 = !_963;
    int _1085 = _1083 ? _1045 : (-1);
    if (_921)
    {
        float _1087 = _1081 ? as_type<float>(_1077) : _422;
        _490 = _1087;
    }
    float _1089 = _490;
    float _1091 = in.m_63.x;
    float _1093 = in.m_63.y;
    int _1095 = _1085 & 3;
    bool _1097 = _1095 != 0;
    int _1099 = _1085 & 3;
    bool _1101 = _1099 != 0;
    int _1103 = _1097 ? 0 : 1;
    bool _1105 = _1099 != 3;
    int _1107 = int(_985) + int(_1061);
    bool _1109 = uint(_1099) >= 2u;
    float _1111 = in.m_48.x;
    float _1113 = in.m_48.y;
    float _1115 = in.m_48.z;
    bool _1117 = uint(_1099) > 1u;
    int _1119 = _967 * _1107;
    int _1121 = _1119 + _931;
    int _1123 = _1109 ? 0 : 1;
    int _1125 = ~_1103;
    int _1127 = _1125 + 1;
    int _1129 = _1127 + 1;
    int _1131 = ~_1123;
    int _1133 = _1131 + 1;
    int _1135 = _1133 + 1;
    int _1137 = _1135;
    int _1139 = _1129;
    if (_1105)
    {
        int _1141 = ~_1123;
        int _1143 = _1141 + 1;
        _1137 = _1143;
    }
    int _1145 = _1137;
    bool _1147 = uint(_1121) >= uint(_454);
    float _1149 = _418 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1153 = _1151 != 0;
    bool _1155 = !_1147;
    int _1157 = _1155 ? 0 : (-1);
    float _1159 = fma(_1149, -2.0, _438);
    if (!_1117)
    {
        int _1161 = ~_1103;
        int _1163 = _1161 + 1;
        _1139 = _1163;
    }
    int _1165 = _1139;
    int _1167 = ~_1107;
    int _1169 = _1167 + _1157;
    int _1171 = _1169 + 1;
    float _1173 = float(uint(_721));
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1177 = _1175 != 0;
    int _1179 = _454 * _1171;
    int _1181 = _1179 + _931;
    float _1183 = float(uint(_883));
    float _1185 = as_type<float>(_506) * _1173;
    bool _1187 = !_1177;
    int _1189 = _1187 ? 0 : 1;
    float _1191 = _416 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1193 = !_787;
    int _1195 = _1193 ? _1181 : (-1);
    float _1197 = trunc(_1185);
    float _1199 = precise::max(_1197, 0.0);
    uint _1201 = uint(_1199);
    float _1203 = as_type<float>(_516) * _1183;
    float _1205 = abs(_1091);
    float _1207 = abs(_1093);
    float _1209 = precise::max(_1205, _1207);
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1213 = _1195 & 3;
    bool _1215 = _1213 != 0;
    float _1217 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1219 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1221 = trunc(_1203);
    float _1223 = precise::max(_1221, 0.0);
    uint _1225 = uint(_1223);
    int _1227 = _1215 ? 0 : 1;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1231 = uint(_1213) >= 2u;
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1235 = _1233 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1237 = _1209 >= 16.0;
    float _1239 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1241 = _1231 ? 0 : 1;
    int _1243 = _464 * int(_1201);
    int _1245 = _1243 + _721;
    bool _1247 = _1213 != 3;
    float _1249 = -_448;
    float _1251 = fma(_1191, 2.0, _1249);
    float _1253 = fma(_1111, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1239);
    float _1255 = fma(_1111, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1217);
    float _1257 = float(uint(_1245));
    float _1259 = fma(_1111, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1219);
    int _1261 = _480 * int(_1225);
    int _1263 = _1261 + _883;
    float _1265 = as_type<float>(_506) * _1257;
    float _1267 = in.m_57.z;
    float _1269 = 1.0 / _1235;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1275;
    float _1279 = float(uint(_1263));
    float _1281 = _1271 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1283 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1287 = ~_1241;
    int _1289 = _1287 + 1;
    int _1291 = _1289 + 1;
    float _1293 = trunc(_1265);
    float _1295 = precise::max(_1293, 0.0);
    uint _1297 = uint(_1295);
    float _1299 = _1277 * _549;
    int _1301 = _1291;
    float _1303 = _1115;
    if (_1247)
    {
        int _1305 = ~_1241;
        int _1307 = _1305 + 1;
        _1301 = _1307;
    }
    int _1309 = _1301;
    float _1311 = _416 * 2.0;
    bool _1313 = uint(_1213) > 1u;
    float _1315 = as_type<float>(_516) * _1279;
    float _1317 = _416 + _418;
    out.m_65.x = _1281;
    out.m_65.y = _1283;
    out.m_65.z = _1285;
    out.m_65.w = _1229;
    int _1319 = ~_1227;
    int _1321 = _1319 + 1;
    int _1323 = _1321 + 1;
    float _1325 = floor(_1311);
    float _1327 = _1317 + (-1.0);
    float _1329 = fma(_1115, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1253);
    int _1331 = _1323;
    if (_1153)
    {
        _492 = 0;
    }
    int _1333 = _492;
    float _1335 = fma(_1115, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1259);
    int _1337 = _1333;
    if (!_1153)
    {
        _1337 = 1;
    }
    int _1339 = _1337;
    float _1341 = trunc(_1315);
    float _1343 = precise::max(_1341, 0.0);
    uint _1345 = uint(_1343);
    if (!_1313)
    {
        int _1347 = ~_1227;
        int _1349 = _1347 + 1;
        _1331 = _1349;
    }
    int _1351 = _1331;
    float _1353 = _1335 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1355 = abs(_1145);
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1361 = _418 + _1267;
    int _1363 = ~_434;
    int _1365 = _1363 + 1;
    float _1367 = _1359 * _1269;
    int _1369 = int(_1201) + int(_1297);
    float _1371 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1375 = _410 + _1373;
    float _1377 = _1361 + (-1.0);
    bool _1379 = _1325 > 0.0;
    float _1381 = _1091 * 0.0625;
    float _1383 = fma(_1299, _1375, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1385 = _1267 * 2.0;
    float _1387 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1389 = _1365 * _1369;
    int _1391 = _1389 + _721;
    bool _1393 = _1325 >= 0.0;
    bool _1395 = isnan(_1325);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan(0.0);
    bool _1401 = _1397 || _1399;
    float _1403 = _1093 * 0.0625;
    int _1405 = int(_1225) + int(_1345);
    float _1407 = floor(_1385);
    int _1409 = ~_454;
    int _1411 = _1409 + 1;
    float _1413 = _418 * 2.0;
    bool _1415 = uint(_1391) >= uint(_434);
    bool _1417 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1419 = isnan(_410);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1425 = _1421 || _1423;
    float _1427 = float(_1425);
    int _1429 = _1411 * _1405;
    int _1431 = _1429 + _883;
    bool _1433 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1435 = isnan(_410);
    bool _1437 = _1433 || _1435;
    bool _1439 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1441 = _1437 || _1439;
    float _1443 = float(_1441);
    float _1445 = _1237 ? _1403 : _1093;
    float _1447 = -_1427;
    float _1449 = _1447 + 1.0;
    bool _1451 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1453 = isnan(_410);
    bool _1455 = _1451 || _1453;
    bool _1457 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1459 = _1455 || _1457;
    float _1461 = float(_1459);
    float _1463 = -_1443;
    float _1465 = _1463 + 1.0;
    float _1467 = _1237 ? _1381 : _1091;
    bool _1469 = uint(_1431) >= uint(_454);
    float _1471 = _1427 * _1465;
    float _1473 = _1461 * _1449;
    bool _1475 = !_1415;
    int _1477 = _1475 ? 0 : (-1);
    float _1479 = -_1461;
    float _1481 = _1479 + 1.0;
    int _1483 = _1401 ? 0 : 1;
    float _1485 = floor(_1413);
    bool _1487 = _1339 != 1;
    bool _1489 = !_1469;
    int _1491 = _1489 ? 0 : (-1);
    bool _1493 = _1407 > 0.0;
    bool _1495 = _1407 >= 0.0;
    bool _1497 = isnan(_1407);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan(0.0);
    bool _1503 = _1499 || _1501;
    float _1505 = _1383 * _1473;
    float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1509 = _410 + _1507;
    int _1511 = ~_1369;
    int _1513 = _1511 + _1477;
    int _1515 = _1513 + 1;
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1519 = _1353 + _1517;
    float _1521 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1505);
    float _1523 = fma(_1367, _1509, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1525 = fma(_1115, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1255);
    float _1527 = _1509;
    float _1529 = _1471;
    if (!_1487)
    {
        float _1531 = in.m_57.z;
        _1527 = _1531;
    }
    float _1533 = _1527;
    int _1535 = _1503 ? 0 : 1;
    float _1537 = fma(_1523, _1471, _1521);
    int _1539 = _1085 >> 31;
    int _1541 = _434 * _1515;
    int _1543 = _1541 + _721;
    int _1545 = _1539 & 3;
    if (!_1487)
    {
        _1303 = _418;
    }
    float _1547 = _1303;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1551 = _1547;
    if (_1487)
    {
        _1551 = _416;
    }
    float _1553 = _1551;
    int _1555 = ~_1535;
    int _1557 = _1555 + 1;
    int _1559 = _1557 + 1;
    int _1561 = _1559;
    if (!_1487)
    {
        _1529 = _418;
    }
    float _1563 = _1529;
    float _1565 = fma(_1553, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1549);
    int _1567 = _1085 + _1545;
    float _1569 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1537);
    float _1571 = _1563;
    if (!_1493)
    {
        int _1573 = ~_1535;
        int _1575 = _1573 + 1;
        _1561 = _1575;
    }
    int _1577 = _1561;
    if (_1487)
    {
        _1571 = _416;
    }
    float _1579 = _1571;
    float _1581 = _1569 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1583 = _1567 >> 2;
    float _1585 = _1579 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1589 = _1583 << 4;
    int _1591 = _1589 + 368;
    float _1593 = 0.0;
    float _1595 = _1533;
    if (!_1487)
    {
        _1593 = _1533;
    }
    float _1597 = _1593;
    float _1599 = -_1587;
    float _1601 = fma(_1585, 2.0, _1599);
    float _1603 = _1597;
    if (_1487)
    {
        _1595 = _418;
    }
    float _1605 = _1595;
    uint _1607 = uint(int(uint(_1591) >> uint(2)));
    uint _1609 = uint(int(uint(int(_1607)) >> uint(2)));
    int _1611 = int(_1607) & 3;
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[int(_1609)][_1611];
    int _1615 = int(_1607) + 1;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    int _1619 = _1615 & 3;
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[int(_1617)][_1619];
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1625 = ~_1483;
    int _1627 = _1625 + 1;
    int _1629 = _1627 + 1;
    int _1631 = _1629;
    if (!_1379)
    {
        int _1633 = ~_1483;
        int _1635 = _1633 + 1;
        _1631 = _1635;
    }
    int _1637 = _1631;
    bool _1639 = _1485 > 0.0;
    int _1641 = _1591 + 8;
    uint _1643 = uint(int(uint(_1641) >> uint(2)));
    uint _1645 = uint(int(uint(int(_1643)) >> uint(2)));
    int _1647 = int(_1643) & 3;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[int(_1645)][_1647];
    int _1651 = int(_1643) + 1;
    uint _1653 = uint(int(uint(_1651) >> uint(2)));
    int _1655 = _1651 & 3;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[int(_1653)][_1655];
    bool _1659 = _1485 >= 0.0;
    bool _1661 = isnan(_1485);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan(0.0);
    bool _1667 = _1663 || _1665;
    float _1669 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1623);
    float _1671 = _1329 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1675 = _1195 >> 31;
    float _1677 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1679 = _1525 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1683 = _1671 + _1681;
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1687 = _1675 & 3;
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1691 = _1679 + _1689;
    float _1693 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1695 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1697 = _1195 + _1687;
    float _1699 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1693);
    int _1701 = ~_1405;
    int _1703 = _1701 + _1491;
    int _1705 = _1703 + 1;
    int _1707 = _1697 >> 2;
    float _1709 = _1673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1711 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1699);
    float _1713 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1715 = _1707 << 4;
    int _1717 = _1715 + 512;
    bool _1719 = !_963;
    int _1721 = _1719 ? _1543 : (-1);
    bool _1723 = _1711 >= 0.0;
    out.m_67.x = _1695;
    out.m_67.y = _1709;
    out.m_67.z = _1713;
    out.m_67.w = _1581;
    bool _1725 = !_1101;
    int _1727 = _1725 ? 0 : 1;
    uint _1729 = uint(int(uint(_1717) >> uint(2)));
    uint _1731 = uint(int(uint(int(_1729)) >> uint(2)));
    int _1733 = int(_1729) & 3;
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[int(_1731)][_1733];
    int _1737 = int(_1729) + 1;
    uint _1739 = uint(int(uint(_1737) >> uint(2)));
    int _1741 = _1737 & 3;
    float _1743 = (*spvDescriptorSet0.vp_c9)._m0[int(_1739)][_1741];
    bool _1745 = _1099 != 3;
    int _1747 = abs(_1727);
    bool _1749 = !_1745;
    int _1751 = _1749 ? 0 : (-1);
    int _1753 = _1195 & 3;
    bool _1755 = _1753 != 0;
    int _1757 = abs(_1309);
    float _1759 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1761 = log2(_1759);
    int _1763 = abs(_1165);
    int _1765 = ~_1747;
    int _1767 = _1765 + 1;
    int _1769 = _1767 + 1;
    int _1771 = abs(_1751);
    float _1773 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1775 = int(_1773);
    int _1777 = ~_1763;
    int _1779 = _1777 + 1;
    int _1781 = _1779 + 1;
    float _1783 = float(uint(_559));
    if (_1487)
    {
        _1603 = _418;
    }
    float _1785 = _1603;
    int _1787 = _1781 * as_type<int>(_1621);
    int _1789 = ~_1355;
    int _1791 = _1789 + 1;
    int _1793 = _1791 + 1;
    float _1795 = _1761 * _152;
    float _1797 = 1.0 / _1783;
    int _1799 = _1769 * as_type<int>(_1613);
    int _1801 = _1799 + _1787;
    int _1803 = ~_1771;
    int _1805 = _1803 + 1;
    int _1807 = _1805 + 1;
    int _1809 = _1717 + 8;
    uint _1811 = uint(int(uint(_1809) >> uint(2)));
    uint _1813 = uint(int(uint(int(_1811)) >> uint(2)));
    int _1815 = int(_1811) & 3;
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[int(_1813)][_1815];
    int _1819 = int(_1811) + 1;
    uint _1821 = uint(int(uint(_1819) >> uint(2)));
    int _1823 = _1819 & 3;
    float _1825 = (*spvDescriptorSet0.vp_c9)._m0[int(_1821)][_1823];
    bool _1827 = !_1755;
    int _1829 = _1827 ? 0 : 1;
    int _1831 = _1793 * as_type<int>(_1649);
    int _1833 = _1831 + _1801;
    bool _1835 = _1213 != 3;
    float _1837 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1839 = abs(_1189);
    int _1841 = _1807 * as_type<int>(_1657);
    int _1843 = _1841 + _1833;
    int _1845 = abs(_1351);
    int _1847 = abs(_559);
    int _1849 = abs(_1829);
    int _1851 = ~_1845;
    int _1853 = _1851 + 1;
    int _1855 = _1853 + 1;
    float _1857 = exp2(_1795);
    int _1859 = ~_1839;
    int _1861 = _1859 + 1;
    int _1863 = _1861 + 1;
    int _1865 = _1855 * as_type<int>(_1743);
    int _1867 = ~_1849;
    int _1869 = _1867 + 1;
    int _1871 = _1869 + 1;
    float _1873 = float(uint(_1847));
    int _1875 = _1843 * _1863;
    int _1877 = as_type<int>(_1797) + (-2);
    int _1879 = _1871 * as_type<int>(_1735);
    int _1881 = _1879 + _1865;
    bool _1883 = !_1835;
    int _1885 = _1883 ? 0 : (-1);
    int _1887 = _1721 * _1839;
    int _1889 = _1887 + _1875;
    float _1891 = 1.0 / _1873;
    float _1893 = abs(_1445);
    bool _1895 = _1893 != 0.0;
    bool _1897 = isnan(_1893);
    bool _1899 = _1895 || _1897;
    bool _1901 = isnan(0.0);
    bool _1903 = _1899 || _1901;
    float _1905 = _1683 * _1683;
    int _1907 = abs(_1775);
    float _1909 = float(uint(_1889));
    float _1911 = abs(_1467);
    bool _1913 = _1911 == 0.0;
    bool _1915 = !_1903;
    bool _1917 = _1913 && _1915;
    int _1919 = abs(_1885);
    float _1921 = as_type<float>(_1877) * _1909;
    float _1923 = fma(_1691, _1691, _1905);
    int _1925 = ~_1919;
    int _1927 = _1925 + 1;
    int _1929 = _1927 + 1;
    int _1931 = ~_1757;
    int _1933 = _1931 + 1;
    int _1935 = _1933 + 1;
    int _1937 = abs(_989);
    float _1939 = trunc(_1921);
    float _1941 = precise::max(_1939, 0.0);
    uint _1943 = uint(_1941);
    int _1945 = _1935 * as_type<int>(_1817);
    int _1947 = _1945 + _1881;
    float _1949 = float(uint(_1775));
    int _1951 = _454 * _1705;
    int _1953 = _1951 + _883;
    float _1955 = float(uint(_1907));
    int _1957 = _1929 * as_type<int>(_1825);
    int _1959 = _1957 + _1947;
    int _1961 = ~_1937;
    int _1963 = _1961 + 1;
    int _1965 = _1963 + 1;
    bool _1967 = !_787;
    int _1969 = _1967 ? _1953 : (-1);
    float _1971 = 1.0 / _1949;
    int _1973 = _1965;
    int _1975 = _1917 ? (-1) : 0;
    float _1977 = _1857;
    if (_1917)
    {
        bool _1979 = as_type<int>(_1467) >= 0;
        _951 = _1979;
    }
    bool _1981 = _951;
    int _1983 = _1965 * _1959;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_1917)
    {
        int _1987 = _1981 ? 0 : 1078530011;
        _1973 = _1987;
    }
    int _1989 = _1973;
    int _1991 = _1969 * _1937;
    int _1993 = _1991 + _1983;
    float _1995 = abs(_1467);
    bool _1997 = _1995 == 0.0;
    float _1999 = 1.0 / _1955;
    float _2001 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2003 = _1989;
    if (_1917)
    {
        int _2005 = int(0x80000000) & as_type<int>(_1445);
        int _2007 = _1989 | _2005;
        _1985 = as_type<float>(_2007);
    }
    float _2009 = _1985;
    float _2011 = fma(_1837, -2.0, _2001);
    float _2013 = float(uint(_1993));
    int _2015 = as_type<int>(_1971) + (-2);
    float _2017 = fma(_1519, _1519, _1923);
    int _2019 = ~_559;
    int _2021 = _2019 + 1;
    int _2023 = abs(_1889);
    float _2025 = rsqrt(_2017);
    int _2027 = _2021 * int(_1943);
    int _2029 = _2027 + _1889;
    float _2031 = float(uint(_2029));
    float _2033 = sqrt(_2017);
    bool _2035 = !_1903;
    bool _2037 = _2035 && _1997;
    float _2039 = _2009;
    float _2041 = _2009;
    if (!_2037)
    {
        float _2043 = abs(_1445);
        bool _2045 = _2043 != as_type<float>(0x7f800000u /* inf */);
        bool _2047 = isnan(_2043);
        bool _2049 = _2045 || _2047;
        bool _2051 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2053 = _2049 || _2051;
        float _2055 = abs(_1467);
        bool _2057 = _2055 == as_type<float>(0x7f800000u /* inf */);
        float _2059 = abs(_1467);
        bool _2061 = _2059 == as_type<float>(0x7f800000u /* inf */);
        bool _2063 = !_2053;
        bool _2065 = _2061 && _2063;
        if (_2065)
        {
            bool _2067 = as_type<int>(_1467) >= 0;
            _1975 = _2067 ? (-1) : 0;
        }
        int _2069 = _1975;
        if (_2065)
        {
            _2003 = 1075235812;
        }
        int _2071 = _2003;
        int _2073 = _2071;
        if (_2065)
        {
            int _2075 = ~_2069;
            int _2077 = (_2075 != 0) ? _2071 : 1061752795;
            _2073 = _2077;
        }
        int _2079 = _2073;
        if (_2065)
        {
            int _2081 = int(0x80000000) & as_type<int>(_1445);
            int _2083 = _2079 | _2081;
            _2039 = as_type<float>(_2083);
        }
        float _2085 = _2039;
        bool _2087 = !_2053;
        bool _2089 = _2087 && _2057;
        _2041 = _2085;
        if (!_2089)
        {
            float _2091 = abs(_1445);
            float _2093 = abs(_1467);
            float _2095 = precise::max(_2091, _2093);
            float _2097 = abs(_1445);
            float _2099 = abs(_1467);
            float _2101 = precise::min(_2097, _2099);
            float _2103 = 1.0 / _2095;
            float _2105 = abs(_1445);
            float _2107 = abs(_1467);
            bool _2109 = _2105 > _2107;
            bool _2111 = as_type<int>(_1467) >= 0;
            float _2113 = _2101 * _2103;
            float _2115 = abs(_1445);
            float _2117 = abs(_1467);
            float _2119 = _2115 + _2117;
            int _2121 = as_type<int>(_1445) & int(0x80000000);
            float _2123 = _2113 * _2113;
            bool _2125 = _2119 > as_type<float>(0x7f800000u /* inf */);
            bool _2127 = isnan(_2119);
            bool _2129 = _2125 || _2127;
            bool _2131 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2133 = _2129 || _2131;
            float _2135 = _2123 + 11.33538818359375;
            float _2137 = fma(_2123, _2135, 28.84246826171875);
            float _2139 = fma(_2123, _2137, 19.6966705322265625);
            float _2141 = fma(_2123, -0.82336294651031494140625, -5.674867153167724609375);
            float _2143 = fma(_2123, _2141, -6.565555095672607421875);
            float _2145 = 1.0 / _2139;
            float _2147 = _2123 * _2143;
            float _2149 = _2113 * _2147;
            float _2151 = fma(_2149, _2145, _2113);
            float _2153 = _2151;
            _2041 = _2119;
            if (_2109)
            {
                float _2155 = -_2151;
                float _2157 = _2155 + 1.57079637050628662109375;
                _2153 = _2157;
            }
            float _2159 = _2153;
            int _2161 = as_type<int>(_2159);
            if (!_2111)
            {
                float _2163 = -_2159;
                float _2165 = _2163 + 3.1415927410125732421875;
                _2161 = as_type<int>(_2165);
            }
            int _2167 = _2161;
            if (!_2133)
            {
                int _2169 = _2121 | _2167;
                _2041 = as_type<float>(_2169);
            }
        }
    }
    float _2171 = _2041;
    float _2173 = as_type<float>(_2015) * _2013;
    int _2175 = as_type<int>(_1891) + (-2);
    float _2177 = as_type<float>(_1877) * _2031;
    float _2179 = float(uint(_2023));
    float _2181 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2183 = abs(_1993);
    float _2185 = trunc(_2173);
    float _2187 = precise::max(_2185, 0.0);
    uint _2189 = uint(_2187);
    int _2191 = as_type<int>(_1999) + (-2);
    float _2193 = as_type<float>(_2175) * _2179;
    float _2195 = float(uint(_2183));
    float _2197 = _2181 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _2199 = ~_1775;
    int _2201 = _2199 + 1;
    float _2203 = _2033 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2205 = ~_1847;
    int _2207 = _2205 + 1;
    float _2209 = trunc(_2193);
    float _2211 = precise::max(_2209, 0.0);
    uint _2213 = uint(_2211);
    float _2215 = as_type<float>(_2191) * _2195;
    bool _2217 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2219 = isnan(0.0);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2225 = _2221 || _2223;
    float _2227 = -_1857;
    float _2229 = _2227 + 1.0;
    float _2231 = precise::min(_2197, _2203);
    if (_1723)
    {
        _1977 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2233 = _1977;
    float _2235 = -_152;
    float _2237 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1251);
    float _2239 = trunc(_2177);
    float _2241 = precise::max(_2239, 0.0);
    uint _2243 = uint(_2241);
    int _2245 = _2201 * int(_2189);
    int _2247 = _2245 + _1993;
    int _2249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2251 = _2249 != 0;
    int _2253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2255 = _2253 != 0;
    int _2257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2259 = _2257 != 0;
    int _2261 = as_type<int>(_2233);
    if (_1723)
    {
        float _2263 = _2233 * 5.0;
        _2261 = as_type<int>(_2263);
    }
    int _2265 = _2261;
    int _2267 = ~_1907;
    int _2269 = _2267 + 1;
    float _2271 = -_152;
    float _2273 = fma(_2271, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1601);
    float _2275 = float(uint(_2247));
    float _2277 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2011);
    float _2279 = trunc(_2215);
    float _2281 = precise::max(_2279, 0.0);
    uint _2283 = uint(_2281);
    int _2285 = _2207 * int(_2213);
    int _2287 = _2285 + _2023;
    if (_1723)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7852 = as_type<float>(_2265);
        out.gl_Position.z = _7852;
    }
    float _2289 = as_type<float>(_2015) * _2275;
    float _2291 = _2225 ? _2229 : 0.0;
    float _2293 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1565);
    float _2295 = float(uint(_2287));
    float _2297 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1669);
    int _2299 = int(_1943) + int(_2243);
    float _2301 = _1683 * _2025;
    float _2303 = trunc(_2289);
    float _2305 = precise::max(_2303, 0.0);
    uint _2307 = uint(_2305);
    float _2309 = as_type<float>(_2175) * _2295;
    float _2311 = _1691 * _2025;
    float _2313 = _2301 * _2231;
    float _2315 = _1519 * _2025;
    int _2317 = ~_559;
    int _2319 = _2317 + 1;
    int _2321 = _2269 * int(_2283);
    int _2323 = _2321 + _2183;
    float _2325 = _2311 * _2231;
    float _2327 = -_2313;
    float _2329 = _1683 + _2327;
    float _2331 = _2315 * _2231;
    float _2333 = trunc(_2309);
    float _2335 = precise::max(_2333, 0.0);
    uint _2337 = uint(_2335);
    float _2339 = float(uint(_2323));
    float _2341 = -_2325;
    float _2343 = _1691 + _2341;
    float _2345 = _2329 * _2329;
    int _2347 = _2319 * _2299;
    int _2349 = _2347 + _1889;
    float _2351 = precise::max(_2171, -3.1415927410125732421875);
    float _2353 = as_type<float>(_2191) * _2339;
    float _2355 = fma(_2343, _2343, _2345);
    float _2357 = -_2331;
    float _2359 = _1519 + _2357;
    int _2361 = ~_1775;
    int _2363 = _2361 + 1;
    out.m_69.w = _2231;
    int _2365 = int(_2189) + int(_2307);
    float _2367 = trunc(_2353);
    float _2369 = precise::max(_2367, 0.0);
    uint _2371 = uint(_2369);
    float _2373 = fma(_2359, _2359, _2355);
    if (_1723)
    {
        out.m_51.x = 0.0;
    }
    bool _2375 = uint(_2349) >= uint(_559);
    int _2377 = int(_2213) + int(_2337);
    int _2379 = _2363 * _2365;
    int _2381 = _2379 + _1993;
    float _2383 = sqrt(_2373);
    int _2385 = ~_1847;
    int _2387 = _2385 + 1;
    bool _2389 = !_2375;
    int _2391 = _2389 ? 0 : (-1);
    int _2393 = ~_1907;
    int _2395 = _2393 + 1;
    int _2397 = _2387 * _2377;
    int _2399 = _2397 + _2023;
    bool _2401 = uint(_2381) >= uint(_1775);
    int _2403 = int(_2283) + int(_2371);
    float _2405 = precise::min(_2351, 3.1415927410125732421875);
    int _2407 = _2395 * _2403;
    int _2409 = _2407 + _2183;
    bool _2411 = !_2401;
    int _2413 = _2411 ? 0 : (-1);
    bool _2415 = uint(_2399) >= uint(_1847);
    float _2417 = fma(_2405, 0.15915493667125701904296875, 0.5);
    float _2419 = _2025 * _2383;
    int _2421 = ~_2299;
    int _2423 = _2421 + _2391;
    int _2425 = _2423 + 1;
    bool _2427 = !_2415;
    int _2429 = _2427 ? 0 : (-1);
    float _2431 = _2181 * _2419;
    bool _2433 = uint(_2409) >= uint(_1907);
    int _2435 = _559 * _2425;
    int _2437 = _2435 + _1889;
    int _2439 = ~_2365;
    int _2441 = _2439 + _2413;
    int _2443 = _2441 + 1;
    float _2445 = _2431 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2447 = !_2433;
    int _2449 = _2447 ? 0 : (-1);
    float _2451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2453 = _559 == 0;
    int _2455 = _1775 * _2443;
    int _2457 = _2455 + _1993;
    int _2459 = _1889 ^ _559;
    float _2461 = _2301 * _2445;
    bool _2463 = !_2453;
    int _2465 = _2463 ? _2437 : (-1);
    float _2467 = _2311 * _2445;
    bool _2469 = _1775 == 0;
    float _2471 = _2315 * _2445;
    uint _2473 = uint(int(uint(_2459) >> uint(31)));
    float _2475 = -_2461;
    float _2477 = _1683 + _2475;
    bool _2479 = !_2469;
    int _2481 = _2479 ? _2457 : (-1);
    float _2483 = -_2467;
    float _2485 = _1691 + _2483;
    bool _2487 = _559 == 0;
    float _2489 = fma(_152, 0.033333338797092437744140625, _2417);
    int _2491 = ~_2429;
    int _2493 = _2377 + _2491;
    int _2495 = _2493 + 1;
    float _2497 = _2477 * _2477;
    int _2499 = ~int(_2473);
    int _2501 = _2499 + 1;
    bool _2503 = !_2251;
    int _2505 = _2503 ? 0 : 1;
    int _2507 = _2495 ^ _2501;
    float _2509 = fma(_2485, _2485, _2497);
    float _2511 = _2451 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2513 = float(_2465);
    float _2515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2517 = _1993 ^ _1775;
    float _2519 = fma(_2511, _1019, -0.5);
    int _2521 = abs(_2505);
    float _2523 = fma(_2511, _2513, _2237);
    uint _2525 = uint(int(uint(_2517) >> uint(31)));
    int _2527 = ~_2449;
    int _2529 = _2403 + _2527;
    int _2531 = _2529 + 1;
    float _2533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2535 = ~int(_2525);
    int _2537 = _2535 + 1;
    float _2539 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1159);
    int _2541 = ~_2501;
    int _2543 = _2541 + _2507;
    int _2545 = _2543 + 1;
    int _2547 = _2531 ^ _2537;
    bool _2549 = !_2487;
    int _2551 = _2549 ? _2545 : (-1);
    float _2553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2555 = _1775 == 0;
    float _2557 = _2515 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2559 = float(_2521);
    float _2561 = -_2471;
    float _2563 = _1519 + _2561;
    int _2565 = ~_2537;
    int _2567 = _2565 + _2547;
    int _2569 = _2567 + 1;
    float _2571 = fma(_2557, _1089, -0.5);
    float _2573 = _2533 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2575 = float(_2481);
    float _2577 = fma(_2563, _2563, _2509);
    bool _2579 = !_2555;
    int _2581 = _2579 ? _2569 : (-1);
    float _2583 = fma(_2573, _1063, -0.5);
    bool _2585 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2587 = isnan(1.0);
    bool _2589 = _2585 || _2587;
    bool _2591 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2593 = _2589 || _2591;
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2597 = 1.0 + _2595;
    float _2599 = float(_2551);
    float _2601 = fma(_2557, _2575, _2273);
    float _2603 = _2553 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2605 = 1.0 / _2597;
    float _2607 = float(_1577);
    float _2609 = -_2539;
    float _2611 = fma(_2573, _2599, _2609);
    float _2613 = float(_2581);
    float _2615 = in.m_71.x;
    float _2617 = in.m_71.y;
    float _2619 = in.m_71.z;
    float _2621 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2623 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2625 = fma(_2603, _1071, -0.5);
    float _2627 = sqrt(_2577);
    float _2629 = -_2277;
    float _2631 = fma(_2603, _2613, _2629);
    float _2633 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2621);
    float _2635 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2623);
    float _2637 = _2559 * _2607;
    float _2639 = fma(_2293, _2571, _2601);
    float _2641 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2633);
    float _2643 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2635);
    float _2645 = _2471;
    if (_2593)
    {
        float _2647 = _2291 * _2605;
        _154 = _2647;
    }
    float _2649 = _154;
    float _2651 = _2637 * (-2.0);
    float _2653 = fma(_2641, _2519, _2523);
    float _2655 = fma(_2643, _2583, _2611);
    float _2657 = fma(_2297, _2625, _2631);
    float _2659 = _2653 + 0.5;
    float _2661 = _2639 + 0.5;
    float _2663 = _2025 * _2627;
    float _2665 = _2655 + 0.5;
    float _2667 = _2657 + 0.5;
    float _2669 = fma(_1371, _2651, _1371);
    float _2671 = _2431 * _2663;
    int _2673 = _1667 ? 0 : 1;
    float _2675 = fma(_2651, _2615, _2615);
    bool _2677 = !_2255;
    int _2679 = _2677 ? 0 : 1;
    out.m_73.x = _2659;
    out.m_73.y = _2665;
    out.m_73.z = _2661;
    out.m_73.w = _2667;
    float _2681 = _416 + (-0.5);
    int _2683 = ~_2673;
    int _2685 = _2683 + 1;
    int _2687 = _2685 + 1;
    out.m_75.x = _2671;
    bool _2689 = !_2259;
    int _2691 = _2689 ? 0 : 1;
    int _2693 = abs(_2679);
    int _2695 = _2687;
    float _2697 = _2619;
    float _2699 = _2627;
    float _2701 = _2663;
    if (_1723)
    {
        return out;
    }
    float _2703 = -_2461;
    float _2705 = _1671 + _2703;
    float _2707 = -_2467;
    float _2709 = _1679 + _2707;
    float _2711 = float(_1637);
    float _2713 = fma(_2681, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2675);
    float _2715 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2717 = _2705 + _2715;
    float _2719 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2721 = _2709 + _2719;
    float _2723 = float(_2693);
    float _2725 = fma(_2669, _2649, _2713);
    float _2727 = _2717 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (!_1639)
    {
        int _2729 = ~_2673;
        int _2731 = _2729 + 1;
        _2695 = _2731;
    }
    int _2733 = _2695;
    float _2735 = _416 + _1267;
    int _2737 = abs(_2691);
    float _2739 = fma(_2721, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2727);
    float _2741 = -_2471;
    float _2743 = _1353 + _2741;
    float _2745 = _2723 * _2711;
    float _2747 = float(_2733);
    float _2749 = _2735 + (-1.0);
    float _2751 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2753 = _2743 + _2751;
    float _2755 = float(_2737);
    float _2757 = _2745 * (-2.0);
    float _2759 = _418 + (-0.5);
    float _2761 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2739);
    float _2763 = _1267 + (-0.5);
    float _2765 = _2755 * _2747;
    float _2767 = fma(_2757, _2617, _2617);
    float _2769 = fma(_1387, _2757, _1387);
    bool _2771 = _2761 >= 0.0;
    float _2773 = _2765 * (-2.0);
    float _2775 = fma(_2759, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2767);
    float _2777 = _2489 * 6.283185482025146484375;
    float _2779 = _2725 * 0.15915493667125701904296875;
    float _2781 = fma(_2749, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2783 = fma(_2773, _2619, _2619);
    float _2785 = fma(_2769, _2649, _2775);
    float _2787 = _2777 * 0.15915493667125701904296875;
    float _2789 = fma(_2781, _2773, _2781);
    float _2791 = fma(_2763, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2783);
    float _2793 = _2785 * 0.15915493667125701904296875;
    if (_2771)
    {
        _2697 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2795 = _2697;
    float _2797 = _2779 * 6.283185482025146484375;
    float _2799 = sin(_2797);
    float _2801 = fma(_2789, _2649, _2791);
    int _2803 = as_type<int>(_2795);
    if (_2771)
    {
        out.m_51.x = 0.0;
    }
    if (_2771)
    {
        float _2805 = _2795 * 5.0;
        _2803 = as_type<int>(_2805);
    }
    int _2807 = _2803;
    float _2809 = _2801 * 0.15915493667125701904296875;
    float _2811 = in.m_63.z;
    float _2813 = _2787 * 6.283185482025146484375;
    float _2815 = sin(_2813);
    if (_2771)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8643 = as_type<float>(_2807);
        out.gl_Position.z = _8643;
    }
    float _2817 = _2779 * 6.283185482025146484375;
    float _2819 = cos(_2817);
    float _2821 = _2793 * 6.283185482025146484375;
    float _2823 = sin(_2821);
    float _2825 = _2793 * 6.283185482025146484375;
    float _2827 = cos(_2825);
    float _2829 = _2809 * 6.283185482025146484375;
    float _2831 = sin(_2829);
    if (_2771)
    {
        return out;
    }
    float _2833 = -_1671;
    float _2835 = _2833 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2837 = -_1679;
    float _2839 = _2837 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2841 = -_1353;
    float _2843 = _2841 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2845 = _2809 * 6.283185482025146484375;
    float _2847 = cos(_2845);
    float _2849 = _2835 * _2835;
    float _2851 = fma(_2815, 0.25, 1.25);
    float _2853 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2855 = _2419 * _2663;
    float _2857 = fma(_2839, _2839, _2849);
    float _2859 = _380 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2861 = _2851 * _1093;
    float _2863 = _2853 * _2855;
    float _2865 = fma(_2843, _2843, _2857);
    float _2867 = _2859 * _2855;
    float _2869 = _2851 * _1091;
    float _2871 = _2851 * _2811;
    float _2873 = _2799 * _2823;
    float _2875 = _2819 * _2827;
    float _2877 = rsqrt(_2865);
    float _2879 = _2819 * _2823;
    float _2881 = _2799 * _2827;
    float _2883 = _2819 * _2847;
    float _2885 = _2827 * _2847;
    float _2887 = _2799 * _2847;
    float _2889 = _2823 * _2847;
    float _2891 = fma(_2831, _2875, _2873);
    float _2893 = -_2879;
    float _2895 = fma(_2831, _2881, _2893);
    float _2897 = fma(_2831, _2873, _2875);
    float _2899 = -_2881;
    float _2901 = fma(_2831, _2879, _2899);
    float _2903 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2861);
    bool _2905 = _2861 != 0.0;
    bool _2907 = isnan(_2861);
    bool _2909 = _2905 || _2907;
    bool _2911 = isnan(0.0);
    bool _2913 = _2909 || _2911;
    float _2915 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2871);
    float _2917 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2869);
    float _2919 = _2839 * _2877;
    float _2921 = _2843 * _2877;
    float _2923 = _2835 * _2877;
    bool _2925 = _2869 == 0.0;
    bool _2927 = !_2913;
    bool _2929 = _2925 && _2927;
    float _2931 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2933 = _2919 * _2931;
    float _2935 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2937 = _2921 * _2935;
    float _2939 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2941 = _2923 * _2939;
    float _2943 = in.m_77.x;
    float _2945 = in.m_77.y;
    float _2947 = in.m_77.z;
    float _2949 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2951 = -_2933;
    float _2953 = fma(_2921, _2949, _2951);
    float _2955 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2957 = -_2937;
    float _2959 = fma(_2923, _2955, _2957);
    float _2961 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2963 = -_2941;
    float _2965 = fma(_2919, _2961, _2963);
    bool _2967 = _2871 == 0.0;
    bool _2969 = _2967 && _2929;
    float _2971 = _2953 * _2953;
    float _2973 = _2671 * _2917;
    float _2975 = fma(_2959, _2959, _2971);
    float _2977 = _2863 * _2903;
    float _2979 = _2867 * _2915;
    float _2981 = fma(_2965, _2965, _2975);
    float _2983 = -_2977;
    float _2985 = _2831 * _2983;
    float _2987 = _2883 * _2977;
    float _2989 = _2887 * _2977;
    float _2991 = rsqrt(_2981);
    float _2993 = in.m_79.x;
    float _2995 = in.m_79.y;
    float _2997 = in.m_79.z;
    float _2999 = in.m_79.w;
    float _3001 = fma(_2885, _2973, _2985);
    float _3003 = fma(_2891, _2973, _2987);
    float _3005 = fma(_2895, _2973, _2989);
    float _3007 = fma(_2889, _2979, _3001);
    float _3009 = _2987;
    float _3011 = _2979;
    float _3013 = _2943;
    float _3015 = _2981;
    float _3017 = _2921;
    if (_2969)
    {
        _3009 = _2943;
    }
    float _3019 = _3009;
    float _3021 = fma(_2901, _2979, _3003);
    float _3023 = fma(_2897, _2979, _3005);
    float _3025 = _3019;
    if (_2969)
    {
        _2699 = _2947;
    }
    float _3027 = _2699;
    float _3029 = _3027;
    if (_2969)
    {
        _3011 = _3019;
    }
    float _3031 = _3011;
    float _3033 = _3031;
    if (!_2969)
    {
        _3025 = _2943;
    }
    float _3035 = _3025;
    float _3037 = _2959 * _2991;
    float _3039 = _2953 * _2991;
    float _3041 = _2965 * _2991;
    if (_2969)
    {
        _3013 = _2945;
    }
    float _3043 = _3013;
    float _3045 = _2923 * _3037;
    float _3047 = _2921 * _3039;
    float _3049 = _3043;
    if (!_2969)
    {
        float _3051 = fma(_2861, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2945);
        _3049 = _3051;
    }
    float _3053 = _3049;
    if (_2969)
    {
        _3015 = _3027;
    }
    float _3055 = _3015;
    float _3057 = -_3045;
    float _3059 = fma(_2919, _3039, _3057);
    float _3061 = -_3047;
    float _3063 = fma(_2923, _3041, _3061);
    float _3065 = _3055;
    if (!_2969)
    {
        _3029 = _2947;
    }
    float _3067 = _3029;
    if (!_2969)
    {
        float _3069 = fma(_2869, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3035);
        _3033 = _3069;
    }
    float _3071 = _3033;
    float _3073 = _3059 * _3021;
    float _3075 = _2997 * _3035;
    float _3077 = _3063 * _3021;
    if (!_2969)
    {
        float _3079 = fma(_2871, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3067);
        _3065 = _3079;
    }
    float _3081 = _3065;
    float _3083 = fma(_3041, _3007, _3073);
    float _3085 = -_3075;
    float _3087 = fma(_2993, _3067, _3085);
    float _3089 = _2995 * _3067;
    float _3091 = fma(_3037, _3007, _3077);
    float _3093 = fma(_2921, _3023, _3083);
    float _3095 = _2993 * _2945;
    float _3097 = -_3089;
    float _3099 = fma(_2997, _2945, _3097);
    float _3101 = fma(_2919, _3023, _3091);
    float _3103 = _1353 + _3093;
    float _3105 = -_3095;
    float _3107 = fma(_2995, _3035, _3105);
    float _3109 = _3087 * _2999;
    float _3111 = _1679 + _3101;
    float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3115 = _3103 + _3113;
    float _3117 = _2919 * _3041;
    float _3119 = _3099 * _2999;
    float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3123 = _3111 + _3121;
    float _3125 = _3115 * _3115;
    float _3127 = -_3117;
    float _3129 = fma(_2921, _3037, _3127);
    float _3131 = _3107 * _2999;
    float _3133 = _2891 * _3063;
    float _3135 = fma(_3123, _3123, _3125);
    float _3137 = _2891 * _3129;
    float _3139 = _2891 * _3059;
    float _3141 = _2883 * _3063;
    float _3143 = sqrt(_3135);
    float _3145 = _2901 * _3063;
    float _3147 = _2901 * _3059;
    float _3149 = _2883 * _3129;
    float _3151 = _2901 * _3129;
    float _3153 = _3129 * _3021;
    float _3155 = fma(_2885, _3037, _3133);
    float _3157 = -_2831;
    float _3159 = fma(_3157, _3037, _3141);
    float _3161 = fma(_2889, _3037, _3145);
    float _3163 = fma(_2885, _3039, _3137);
    float _3165 = -_2831;
    float _3167 = fma(_3165, _3039, _3149);
    float _3169 = fma(_2889, _3039, _3151);
    float _3171 = fma(_3039, _3007, _3153);
    float _3173 = _2883 * _3059;
    float _3175 = fma(_2885, _3041, _3139);
    float _3177 = fma(_2887, _2919, _3159);
    bool _3179 = _3143 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3181 = fma(_2923, _3023, _3171);
    float _3183 = -_2831;
    float _3185 = fma(_3183, _3041, _3173);
    float _3187 = fma(_2897, _2919, _3161);
    float _3189 = fma(_2889, _3041, _3147);
    float _3191 = _1671 + _3181;
    float _3193 = fma(_2895, _2919, _3155);
    float _3195 = fma(_2895, _2923, _3163);
    float _3197 = fma(_2895, _2921, _3175);
    float _3199 = fma(_2887, _2923, _3167);
    float _3201 = fma(_2887, _2921, _3185);
    float _3203 = fma(_2897, _2921, _3189);
    float _3205 = fma(_2897, _2923, _3169);
    float _3207 = _3111;
    float _3209 = _3103;
    float _3211 = _3081;
    if (!_3179)
    {
        _3017 = _3191;
    }
    float _3213 = _3017;
    bool _3215 = !_3179;
    float _3217 = _3213;
    if (!_3215)
    {
        float _3219 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3223 = _3143 + _3221;
        float _3225 = _3191 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3227 = rsqrt(_3135);
        float _3229 = _3223 * _3219;
        float _3231 = _3229 * 0.15915493667125701904296875;
        float _3233 = _3231 * 6.283185482025146484375;
        float _3235 = cos(_3233);
        float _3237 = _3231 * 6.283185482025146484375;
        float _3239 = sin(_3237);
        float _3241 = _3235 + (-1.0);
        float _3243 = fma(_3239, _3225, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3245 = _3241 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3247 = _3227 * _3243;
        float _3249 = fma(_3191, _3235, _3245);
        float _3251 = fma(_3123, _3247, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3253 = fma(_3115, _3247, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3217 = _3249;
        _3207 = _3251;
        _3209 = _3253;
    }
    float _3255 = _3217;
    float _3257 = _3207;
    float _3259 = _3209;
    float _3261 = _3177 * _2995;
    float _3263 = _3199 * _2995;
    float _3265 = _3201 * _2995;
    float _3267 = -_2313;
    float _3269 = _3267 + _3255;
    float _3271 = _3177 * _3053;
    float _3273 = _3109 * _3177;
    float _3275 = _3199 * _3053;
    float _3277 = _3201 * _3053;
    float _3279 = _3109 * _3201;
    float _3281 = _3109 * _3199;
    float _3283 = fma(_3193, _2993, _3261);
    float _3285 = -_2325;
    float _3287 = _3285 + _3257;
    float _3289 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3291 = _3269 + _3289;
    float _3293 = fma(_3195, _2993, _3263);
    float _3295 = -_2331;
    float _3297 = _3295 + _3259;
    float _3299 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3301 = _3287 + _3299;
    float _3303 = _3291 * _3291;
    float _3305 = fma(_3193, _3071, _3271);
    float _3307 = fma(_3195, _3071, _3275);
    float _3309 = fma(_3197, _3071, _3277);
    float _3311 = fma(_3301, _3301, _3303);
    float _3313 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3315 = _3297 + _3313;
    float _3317 = fma(_3197, _2993, _3265);
    float _3319 = fma(_3119, _3193, _3273);
    float _3321 = fma(_3119, _3195, _3281);
    float _3323 = fma(_3315, _3315, _3311);
    float _3325 = fma(_3119, _3197, _3279);
    float _3327 = fma(_3187, _2997, _3283);
    float _3329 = fma(_3205, _2997, _3293);
    float _3331 = fma(_3203, _2997, _3317);
    float _3333 = fma(_3187, _3081, _3305);
    float _3335 = sqrt(_3323);
    float _3337 = fma(_3131, _3187, _3319);
    float _3339 = fma(_3205, _3081, _3307);
    float _3341 = fma(_3131, _3205, _3321);
    float _3343 = fma(_3131, _3203, _3325);
    float _3345 = fma(_3203, _3081, _3309);
    out.m_81.x = _3327;
    out.m_81.y = _3329;
    out.m_81.z = _3331;
    float _3347 = -_2325;
    float _3349 = _1679 + _3347;
    float _3351 = -_2313;
    float _3353 = _1671 + _3351;
    out.m_83.x = _3337;
    out.m_83.y = _3341;
    out.m_83.z = _3343;
    float _3355 = -_2331;
    float _3357 = _1353 + _3355;
    out.m_85.x = _3333;
    out.m_85.y = _3339;
    out.m_85.z = _3345;
    bool _3359 = _3335 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3361 = isnan(_3335);
    bool _3363 = _3359 || _3361;
    bool _3365 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3367 = _3363 || _3365;
    float _3369 = _3349;
    if (!_3367)
    {
        _3211 = 1.0;
    }
    float _3371 = _3211;
    bool _3373 = !_3367;
    float _3375 = _3371;
    if (!_3373)
    {
        bool _3377 = _3335 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3379 = isnan(_3335);
        bool _3381 = _3377 || _3379;
        bool _3383 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3385 = _3381 || _3383;
        if (!_3385)
        {
            float _3387 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3389 = _3335 + _3387;
            float _3391 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3393 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3391;
            float _3395 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3397 = _3395 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3399 = 1.0 / _3393;
            float _3401 = _3389 * _3399;
            float _3403 = fma(_3401, _3397, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3375 = _3403;
            _3405 = true;
        }
        else
        {
            bool _3407 = _3335 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3409 = isnan(_3335);
            bool _3411 = _3407 || _3409;
            bool _3413 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3415 = _3411 || _3413;
            if (!_3415)
            {
                float _3417 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3419 = _3335 + _3417;
                float _3421 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3423 = _3421 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3425 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3427 = _3425 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3429 = 1.0 / _3423;
                float _3431 = _3419 * _3429;
                float _3433 = fma(_3431, _3427, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3375 = _3433;
                _3405 = true;
            }
            else
            {
                _3375 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3405 = false;
    float _3435 = _3375;
    float _3437 = -_2461;
    float _3439 = _3437 + _3353;
    float _3441 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3443 = _3269 + _3441;
    float _3445 = -_2467;
    float _3447 = _3445 + _3349;
    float _3449 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3451 = _3287 + _3449;
    float _3453 = _3439 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3455 = fma(_3443, _3435, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3457 = -_2471;
    float _3459 = _3457 + _3357;
    float _3461 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3463 = _3297 + _3461;
    float _3465 = fma(_3447, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3453);
    float _3467 = fma(_3451, _3435, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3469 = -_3353;
    float _3471 = _3469 + _3455;
    float _3473 = fma(_3463, _3435, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3475 = fma(_3459, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3465);
    float _3477 = -_3349;
    float _3479 = _3477 + _3467;
    float _3481 = _3471 * _3471;
    float _3483 = _3439 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3485 = _3475 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3487 = -_3357;
    float _3489 = _3487 + _3473;
    float _3491 = fma(_3479, _3479, _3481);
    float _3493 = fma(_3447, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3483);
    float _3495 = 1.0 / _3485;
    float _3497 = fma(_3489, _3489, _3491);
    float _3499 = fma(_3459, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3493);
    float _3501 = _3499 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3503 = sqrt(_3497);
    float _3505 = _3501 + _3485;
    float _3507 = _3505 * _3495;
    float _3509 = _3507 * 0.5;
    bool _3511 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3513 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3515 = _3511 || _3513;
    bool _3517 = isnan(0.5);
    bool _3519 = _3515 || _3517;
    float _3521 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3523 = fma(_3509, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3521);
    bool _3525 = _3503 > 0.0;
    float _3527 = 1.0 / _3523;
    bool _3529 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3531 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3533 = _3529 || _3531;
    bool _3535 = isnan(0.5);
    bool _3537 = _3533 || _3535;
    float _3539 = _3495;
    float _3541 = _3475;
    float _3543 = _3455;
    float _3545 = _3497;
    float _3547 = _3459;
    float _3549 = _3439;
    if (!_3525)
    {
        _3539 = _3467;
    }
    float _3551 = _3539;
    float _3553 = _3551;
    float _3555 = _3551;
    if (!_3525)
    {
        _3541 = _3473;
    }
    float _3557 = _3541;
    bool _3559 = !_3525;
    float _3561 = _3557;
    if (!_3559)
    {
        float _3563 = _196 * _196;
        float _3565 = rsqrt(_3497);
        float _3567 = fma(_194, _194, _3563);
        float _3569 = fma(_198, _198, _3567);
        float _3571 = sqrt(_3569);
        float _3573 = _3479 * _3565;
        float _3575 = _3471 * _3565;
        float _3577 = _3489 * _3565;
        bool _3579 = _3571 > 0.0;
        float _3581 = _3571;
        if (!_3579)
        {
            _3553 = _3467;
        }
        float _3583 = _3553;
        _3555 = _3583;
        if (!_3579)
        {
            _3581 = _3473;
        }
        float _3585 = _3581;
        bool _3587 = !_3579;
        _3561 = _3585;
        if (!_3587)
        {
            float _3589 = rsqrt(_3569);
            float _3591 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3593 = _196 * _3589;
            float _3595 = _194 * _3589;
            float _3597 = _3575 * _3593;
            float _3599 = _198 * _3589;
            float _3601 = fma(_3573, _3595, _3597);
            float _3603 = _3591 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3605 = fma(_3577, _3599, _3601);
            float _3607 = _3605 * _3603;
            float _3609 = fma(_194, _3607, _3467);
            float _3611 = fma(_196, _3607, _3455);
            float _3613 = fma(_198, _3607, _3473);
            _3561 = _3613;
            _3555 = _3609;
            _3543 = _3611;
            _3545 = _3591;
        }
    }
    float _3615 = _3561;
    float _3617 = _3555;
    float _3619 = _3543;
    float _3621 = _3545;
    float _3623 = -_2471;
    float _3625 = _3623 + _3615;
    float _3627 = -_2467;
    float _3629 = _3627 + _3617;
    float _3631 = -_2461;
    float _3633 = _3631 + _3619;
    float _3635 = _3633;
    float _3637 = _3629;
    float _3639 = _3625;
    float _3641 = _3621;
    if (_3519)
    {
        _2645 = 1.0;
    }
    float _3643 = _2645;
    float _3645 = _3643;
    if (!_3537)
    {
        float _3647 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3649 = _3439 + _3647;
        float _3651 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3653 = _3447 + _3651;
        float _3655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3657 = -_3357;
        float _3659 = _3657 + _3615;
        float _3661 = _3649 * _3649;
        float _3663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3665 = _3459 + _3663;
        float _3667 = -_3353;
        float _3669 = _3667 + _3619;
        float _3671 = fma(_3653, _3653, _3661);
        float _3673 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3675 = fma(_3665, _3665, _3671);
        float _3677 = sqrt(_3675);
        float _3679 = 1.0 / _2663;
        float _3681 = _3673 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3683 = precise::min(_3677, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3685 = _3683 * _3655;
        float _3687 = _3685 * _3679;
        float _3689 = -_3349;
        float _3691 = _3689 + _3617;
        float _3693 = _3681 * _3687;
        float _3695 = _3659 * _3687;
        float _3697 = fma(_3691, _3693, _3447);
        float _3699 = fma(_3669, _3693, _3439);
        float _3701 = fma(_3681, _3695, _3459);
        _2701 = _3679;
        _3635 = _3699;
        _3637 = _3697;
        _3639 = _3701;
    }
    float _3703 = _2701;
    float _3705 = _3635;
    float _3707 = _3637;
    float _3709 = _3639;
    float _3711 = _3703;
    if (_3519)
    {
        _3711 = 1.0;
    }
    float _3713 = _3711;
    float _3715 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3717 = _3527 * _3715;
    float _3719 = _3713;
    if (!_3519)
    {
        float _3721 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3723 = _3721 * 0.15915493667125701904296875;
        float _3725 = _3723 * 6.283185482025146484375;
        float _3727 = cos(_3725);
        float _3729 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3731 = _3729 * 0.15915493667125701904296875;
        float _3733 = _3723 * 6.283185482025146484375;
        float _3735 = sin(_3733);
        float _3737 = 1.0 / _3727;
        float _3739 = _3731 * 6.283185482025146484375;
        float _3741 = cos(_3739);
        float _3743 = _3735 * _3737;
        float _3745 = _3731 * 6.283185482025146484375;
        float _3747 = sin(_3745);
        float _3749 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3751 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3749;
        float _3753 = _3741 * _3743;
        float _3755 = 1.0 / _3753;
        float _3757 = 1.0 / _3751;
        float _3759 = _3747 * _3755;
        float _3761 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3763 = fma(_3717, _3759, _3761);
        float _3765 = _3763 * _3757;
        float _3767 = precise::clamp(_3765, 0.0, 1.0);
        _202 = _3731;
        _3645 = _3767;
    }
    float _3769 = _202;
    float _3771 = _3645;
    float _3773 = _3769;
    if (!_3519)
    {
        float _3775 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3777 = _3775 * 0.15915493667125701904296875;
        float _3779 = _3777 * 6.283185482025146484375;
        float _3781 = cos(_3779);
        float _3783 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3785 = _3783 * 0.15915493667125701904296875;
        float _3787 = _3777 * 6.283185482025146484375;
        float _3789 = sin(_3787);
        float _3791 = 1.0 / _3781;
        float _3793 = _3785 * 6.283185482025146484375;
        float _3795 = cos(_3793);
        float _3797 = _3789 * _3791;
        float _3799 = _3785 * 6.283185482025146484375;
        float _3801 = sin(_3799);
        float _3803 = _3795 * _3797;
        float _3805 = 1.0 / _3803;
        float _3807 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3809 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3807;
        float _3811 = 1.0 / _3809;
        float _3813 = _3801 * _3805;
        float _3815 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3817 = fma(_3717, _3813, _3815);
        float _3819 = _3817 * _3811;
        float _3821 = precise::clamp(_3819, 0.0, 1.0);
        float _3823 = -_3821;
        float _3825 = _3823 + 1.0;
        _3773 = _3781;
        _3719 = _3825;
    }
    float _3827 = _3773;
    float _3829 = _3719;
    float _3831 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3833 = _3705 + _3831;
    float _3835 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3837 = _3707 + _3835;
    float _3839 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3841 = _3709 + _3839;
    float _3843 = _3833 * _3833;
    float _3845 = fma(_3837, _3837, _3843);
    float _3847 = fma(_3841, _3841, _3845);
    float _3849 = rsqrt(_3847);
    float _3851 = _3849 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3853 = _3837 * _3851;
    float _3855 = _3841 * _3851;
    float _3857 = _3853 * _3853;
    float _3859 = _3855 * _3855;
    float _3861 = _3857 + _3859;
    float _3863 = sqrt(_3861);
    bool _3865 = _3863 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3869 = _3863 + _3867;
    float _3871 = _3849;
    float _3873 = _3861;
    float _3875 = _3869;
    float _3877 = _3833;
    if (_3865)
    {
        float _3879 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3871 = _3879;
    }
    float _3881 = _3871;
    if (_3865)
    {
        float _3883 = rsqrt(_3861);
        _3873 = _3883;
    }
    float _3885 = _3873;
    float _3887 = _3885;
    if (_3865)
    {
        float _3889 = _3869 * _3881;
        _3875 = _3889;
    }
    float _3891 = _3875;
    if (_3865)
    {
        float _3893 = _3891 * 0.15915493667125701904296875;
        _3641 = _3893;
    }
    float _3895 = _3641;
    float _3897 = _3827;
    float _3899 = _3895;
    if (_3865)
    {
        float _3901 = _3895 * 6.283185482025146484375;
        float _3903 = sin(_3901);
        _3897 = _3903;
    }
    float _3905 = _3897;
    float _3907 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3909 = precise::max(0.0, _3907);
    float _3911 = _3841;
    float _3913 = _3909;
    float _3915 = _3907;
    if (_3865)
    {
        float _3917 = _3895 * 6.283185482025146484375;
        float _3919 = cos(_3917);
        _3911 = _3919;
    }
    float _3921 = _3911;
    float _3923 = -_3851;
    float _3925 = -_3909;
    float _3927 = fma(_3833, _3923, _3925);
    float _3929 = _3927;
    if (!_3865)
    {
        _3877 = _3857;
    }
    float _3931 = _3877;
    float _3933 = _3931;
    if (_3865)
    {
        float _3935 = _3927 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3913 = _3935;
    }
    float _3937 = _3913;
    float _3939 = _3937;
    if (!_3865)
    {
        _3899 = _3853;
    }
    float _3941 = _3899;
    float _3943 = _3905;
    float _3945 = _3941;
    if (_3865)
    {
        float _3947 = fma(_3905, _3937, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3943 = _3947;
    }
    float _3949 = _3943;
    float _3951 = _3921;
    if (_3865)
    {
        float _3953 = _3921 + (-1.0);
        _3915 = _3953;
    }
    float _3955 = _3915;
    if (_3865)
    {
        float _3957 = _3885 * _3949;
        _3369 = _3957;
    }
    float _3959 = _3369;
    if (!_3865)
    {
        _3887 = _3855;
    }
    float _3961 = _3887;
    float _3963 = _3961;
    if (_3865)
    {
        float _3965 = _3955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3939 = _3965;
    }
    float _3967 = _3939;
    if (_3865)
    {
        float _3969 = _3853 * _3959;
        _3945 = _3969;
    }
    float _3971 = _3945;
    float _3973 = sqrt(_3847);
    if (_3865)
    {
        float _3975 = _3855 * _3959;
        _3963 = _3975;
    }
    float _3977 = _3963;
    if (_3865)
    {
        float _3979 = fma(_3927, _3921, _3967);
        _3929 = _3979;
    }
    float _3981 = _3929;
    if (_3865)
    {
        float _3983 = _3971 * _3971;
        _3933 = _3983;
    }
    float _3985 = _3933;
    if (!_3865)
    {
        _3951 = _3859;
    }
    float _3987 = _3951;
    float _3989 = _3987;
    if (_3865)
    {
        float _3991 = _3977 * _3977;
        _3989 = _3991;
    }
    float _3993 = _3989;
    float _3995 = fma(_3981, _3981, _3985);
    float _3997 = _3705 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3999 = _3705 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4001 = _3995 + _3993;
    float _4003 = fma(_3707, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3997);
    float _4005 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4007 = rsqrt(_4001);
    float _4009 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4011 = fma(_3973, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4009);
    float _4013 = precise::clamp(_4011, 0.0, 1.0);
    float _4015 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4003);
    float _4017 = fma(_3459, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4019 = _3705 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4021 = -_4013;
    float _4023 = _4021 + 1.0;
    float _4025 = _4015 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4027 = fma(_3707, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4019);
    float _4029 = abs(_4023);
    float _4031 = log2(_4029);
    float _4033 = _4025 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4035 = fma(_3707, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3999);
    float _4037 = fma(_3447, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4039 = -_4033;
    float _4041 = fma(_4039, _4005, 1.0);
    float _4043 = _3705 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4045 = _4007 * _3971;
    float _4047 = _4007 * _3981;
    float _4049 = _4007 * _3977;
    float _4051 = fma(_3707, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4043);
    float _4053 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4027);
    float _4055 = _4045 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4057 = floor(_4037);
    float _4059 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4051);
    float _4061 = _4053 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4063 = -_4055;
    float _4065 = fma(_4047, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4063);
    float _4067 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4035);
    float _4069 = _4059 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4071 = _4061 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4073 = -_4049;
    float _4075 = fma(_4073, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4065);
    float _4077 = floor(_4017);
    float _4079 = _4031 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4081 = fma(_4069, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4071);
    float _4083 = _4067 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4085 = fma(_4075, -0.5, 0.5);
    float _4087 = fma(_4075, 0.5, 0.5);
    float _4089 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4081);
    float _4091 = exp2(_4079);
    float _4093 = -_4057;
    float _4095 = _4037 + _4093;
    float _4097 = fma(_4083, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4089);
    float _4099 = _4061 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4101 = sqrt(_4085);
    float _4103 = _4061 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4105 = -_4077;
    float _4107 = _4017 + _4105;
    float _4109 = fma(_4087, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4111 = fma(_4069, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4099);
    float _4113 = fma(_4069, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4103);
    float _4115 = _4047 + 1.0;
    float _4117 = fma(_4087, _4109, -0.212114393711090087890625);
    float _4119 = log2(_4041);
    float _4121 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4111);
    float _4123 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4113);
    float _4125 = -_4047;
    float _4127 = fma(_4091, _4115, _4125);
    float _4129 = 1.0 / _4097;
    float _4131 = fma(_4083, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4121);
    float _4133 = fma(_4083, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4123);
    float _4135 = _4101 * 0.636619746685028076171875;
    float2 _10732 = float2(_4095, _4107);
    float _4137 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10732, float2(0.0), isnan(_10732)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10732, float2(0.0), isnan(_10732)), level(0.0)).x;
    float _4139 = fma(_4087, _4117, 1.570728778839111328125);
    float _4141 = _4119 * 0.693147182464599609375;
    float _4143 = -_4139;
    float _4145 = fma(_4135, _4143, 1.0);
    float _4147 = _4141 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4149 = fma(_4127, 0.5, 0.5);
    float _4151 = _4131 * _4129;
    float _4153 = _4133 * _4129;
    float _4155 = fma(_4151, 0.5, 0.5);
    float _4157 = fma(_4153, -0.5, 0.5);
    float3 _10771 = float3(_4155, _4157, _4147);
    float _4159 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10771, float3(0.0), isnan(_10771)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10771, float3(0.0), isnan(_10771)), level(0.0)).x;
    float3 _10782 = float3(_4155, _4157, _4147);
    float4 _4162 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10782, float3(0.0), isnan(_10782)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10782, float3(0.0), isnan(_10782)), level(0.0)).xyzw;
    float _4164 = _4162.x;
    float _4166 = _4162.y;
    float _4168 = _4162.z;
    float _4170 = _4162.w;
    float2 _10798 = float2(_4145, _4149);
    float3 _4174 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10798, float2(0.0), isnan(_10798)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10798, float2(0.0), isnan(_10798)), level(0.0)).xyz;
    float _4176 = _4174.x;
    float _4178 = _4174.y;
    float _4180 = _4174.z;
    float _4182 = abs(_3717);
    float _4184 = log2(_4182);
    float _4186 = _4031 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4188 = in.m_87.x;
    bool _4190 = _3973 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4192 = isnan(_3973);
    bool _4194 = _4190 || _4192;
    bool _4196 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4198 = _4194 || _4196;
    float _4200 = exp2(_4186);
    bool _4202 = _3717 <= 8000.0;
    bool _4204 = isnan(_3717);
    bool _4206 = _4202 || _4204;
    bool _4208 = isnan(8000.0);
    bool _4210 = _4206 || _4208;
    float _4212 = float(_4210);
    out.m_89.x = _3447;
    out.m_89.y = _3439;
    out.m_89.z = _3459;
    out.m_91.x = _3707;
    out.m_91.y = _3705;
    out.m_91.z = _3709;
    float _4214 = _4184 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4216 = exp2(_4214);
    float _4218 = _4131;
    if (!_4198)
    {
        _3547 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4220 = _3547;
    float _4222 = -_4200;
    float _4224 = _4222 + 1.0;
    float _4226 = _4224;
    float _4228 = _4220;
    float _4230 = _4220;
    if (!_4198)
    {
        _3549 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4232 = _3549;
    float _4234 = fma(_4216, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4236 = precise::clamp(_4234, 0.0, 1.0);
    float _4238 = fma(_4236, -2.0, 3.0);
    float _4240 = _4236 * _4236;
    float _4242 = _4061 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4244 = _4240 * _4238;
    float _4246 = fma(_4069, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4242);
    float _4248 = -_4244;
    float _4250 = _4248 + 1.0;
    float _4252 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4246);
    float _4254 = _4131 + _4097;
    float _4256 = fma(_4250, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4244);
    float _4258 = _4097 * 0.5;
    float _4260 = fma(_4083, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4252);
    float _4262 = _4254 * 0.5;
    float _4264 = _4212 * _4256;
    float _4266 = fma(_4133, -0.5, _4258);
    float _4268 = _4224 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4270 = _4264 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4272 = _4260 + _4097;
    out.gl_Position.x = _4131;
    out.gl_Position.y = _4133;
    out.gl_Position.z = _4260;
    out.gl_Position.w = _4097;
    float _4274 = _4232;
    float _4276 = _4232;
    if (!_4198)
    {
        _4226 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4278 = _4226;
    float _4280 = _4272 * 0.5;
    out.m_93.x = _4262;
    out.m_93.y = _4266;
    out.m_93.z = _4280;
    out.m_93.w = _4097;
    float _4282 = _4278;
    float _4284 = _4278;
    if (!_4198)
    {
        _4218 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4286 = _4218;
    float _4288 = -_4137;
    float _4290 = _4288 + 1.0;
    float _4292 = _4290 * _4270;
    float _4294 = precise::clamp(_4292, 0.0, 1.0);
    float _4296 = -_4294;
    float _4298 = fma(_4296, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4300 = _4298 * _4188;
    float _4302 = _4300 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4304 = _4300;
    float _4306 = _4286;
    float _4308 = _4286;
    if (!_4198)
    {
        _4304 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4310 = _4304;
    float _4312 = _4268 * _4159;
    float _4314 = -_4268;
    float _4316 = _4314 + 1.0;
    out.m_95.x = _4302;
    float _4318 = _4170 * _4312;
    float _4320 = _4180 * _4312;
    float _4322 = _4170 * _4316;
    float _4324 = fma(_4176, _4318, _4164);
    float _4326 = fma(_4178, _4318, _4166);
    float _4328 = fma(_4170, _4320, _4168);
    float _4330 = _3771 * _3829;
    out.m_97.x = _4324;
    out.m_97.y = _4326;
    out.m_97.z = _4328;
    out.m_97.w = _4322;
    float _4332 = _4330 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4334 = _4330;
    float _4336 = _4310;
    float _4338 = _4310;
    if (!_4198)
    {
        _4334 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4340 = _4334;
    bool _4342 = !_4198;
    float _4344 = _4340;
    float _4346 = _4340;
    if (!_4342)
    {
        bool _4348 = _3973 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4350 = isnan(_3973);
        bool _4352 = _4348 || _4350;
        bool _4354 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4356 = _4352 || _4354;
        if (!_4356)
        {
            float _4358 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4360 = _3973 + _4358;
            float _4362 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4364 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4362;
            float _4366 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4368 = _4366 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4370 = 1.0 / _4364;
            float _4372 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4374 = _4372 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4376 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4378 = _4376 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4380 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4382 = _4380 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4384 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4386 = _4384 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4388 = _4360 * _4370;
            float _4390 = precise::clamp(_4388, 0.0, 1.0);
            float _4392 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4394 = _4392 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4396 = fma(_4390, _4368, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4398 = fma(_4390, _4394, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4400 = fma(_4390, _4374, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4402 = fma(_4390, _4378, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4404 = fma(_4390, _4382, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4406 = fma(_4390, _4386, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4308 = _4400;
            _4276 = _4404;
            _4284 = _4396;
            _4230 = _4402;
            _4338 = _4398;
            _4346 = _4406;
            _4408 = true;
        }
        else
        {
            bool _4410 = _3973 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4412 = isnan(_3973);
            bool _4414 = _4410 || _4412;
            bool _4416 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4418 = _4414 || _4416;
            if (!_4418)
            {
                _4282 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4420 = _4282;
            _4284 = _4420;
            if (!_4418)
            {
                _4306 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4422 = _4306;
            _4308 = _4422;
            if (!_4418)
            {
                _4336 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4424 = _4336;
            _4338 = _4424;
            if (!_4418)
            {
                _4228 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4426 = _4228;
            _4230 = _4426;
            if (!_4418)
            {
                _4274 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4428 = _4274;
            _4276 = _4428;
            if (!_4418)
            {
                _4344 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4430 = _4344;
            bool _4432 = !_4418;
            _4346 = _4430;
            if (!_4432)
            {
                bool _4434 = _3973 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4436 = isnan(_3973);
                bool _4438 = _4434 || _4436;
                bool _4440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4442 = _4438 || _4440;
                if (!_4442)
                {
                    float _4444 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4446 = _3973 + _4444;
                    float _4448 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4450 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4448;
                    float _4452 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4454 = _4452 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4456 = 1.0 / _4450;
                    float _4458 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4460 = _4458 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4462 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4464 = _4462 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4466 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4468 = _4466 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4470 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4472 = _4470 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4474 = _4446 * _4456;
                    float _4476 = precise::clamp(_4474, 0.0, 1.0);
                    float _4478 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4480 = _4478 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4482 = fma(_4476, _4454, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4484 = fma(_4476, _4480, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4486 = fma(_4476, _4460, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4488 = fma(_4476, _4464, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4490 = fma(_4476, _4468, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4492 = fma(_4476, _4472, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4308 = _4486;
                    _4276 = _4490;
                    _4284 = _4482;
                    _4230 = _4488;
                    _4338 = _4484;
                    _4346 = _4492;
                    _4408 = true;
                }
                else
                {
                    _4308 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4276 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4284 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4230 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4338 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4346 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4408 = false;
    float _4494 = _4308;
    float _4496 = _4276;
    float _4498 = _4284;
    float _4500 = _4230;
    float _4502 = _4338;
    float _4504 = _4346;
    float _4506 = fma(_3339, -0.5, 0.5);
    float _4508 = precise::clamp(_4506, 0.0, 1.0);
    float _4510 = -_4494;
    float _4512 = _4510 + _4496;
    float _4514 = _4332 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4516 = -_4498;
    float _4518 = _4516 + _4500;
    out.m_99.x = 0.0;
    float _4520 = fma(_4508, _4512, _4494);
    float _4522 = fma(_4508, _4518, _4498);
    out.m_51.x = _4514;
    float _4524 = -_4502;
    float _4526 = _4524 + _4504;
    float _4528 = _4520 * 0.586610972881317138671875;
    bool _4530 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4532 = fma(_4508, _4526, _4502);
    float _4534 = fma(_4522, 0.298911988735198974609375, _4528);
    bool _4536 = _3771 > 0.0;
    bool _4538 = isnan(_3771);
    bool _4540 = _4536 || _4538;
    bool _4542 = isnan(0.0);
    bool _4544 = _4540 || _4542;
    float _4546 = fma(_4532, 0.114477999508380889892578125, _4534);
    bool _4548 = _3829 <= 0.0;
    bool _4550 = !_4544;
    bool _4552 = _4548 || _4550;
    float _4554 = -_4546;
    float _4556 = _4522 + _4554;
    float _4558 = -_4546;
    float _4560 = _4520 + _4558;
    float _4562 = -_4546;
    float _4564 = _4532 + _4562;
    float _4566 = fma(_4556, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4546);
    float _4568 = fma(_4560, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4546);
    float _4570 = fma(_4564, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4546);
    bool _4572 = !_4530;
    if (!_4572)
    {
        float _4574 = -_3705;
        float _4576 = _4574 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4578 = -_3707;
        float _4580 = _4578 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4582 = -_3709;
        float _4584 = _4582 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4586 = _4576 * _4576;
        float _4588 = fma(_4580, _4580, _4586);
        float _4590 = fma(_4584, _4584, _4588);
        float _4592 = sqrt(_4590);
        float _4594 = rsqrt(_4590);
        float _4596 = -_4592;
        float _4598 = _4596 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4600 = _4598 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4602 = precise::clamp(_4600, 0.0, 1.0);
        float _4604 = _4580 * _4594;
        float _4606 = _4576 * _4594;
        float _4608 = abs(_4602);
        float _4610 = log2(_4608);
        float _4612 = _4584 * _4594;
        float _4614 = _4604 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4616 = _3339 * _4606;
        float _4618 = -_4606;
        float _4620 = -_4614;
        float _4622 = fma(_4618, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4620);
        float _4624 = fma(_3333, _4604, _4616);
        float _4626 = -_4612;
        float _4628 = fma(_4626, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4622);
        float _4630 = fma(_3345, _4612, _4624);
        float _4632 = precise::clamp(_4630, 0.0, 1.0);
        float _4634 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4636 = _4628 + _4634;
        float _4638 = _4610 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4640 = _4636 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4642 = precise::clamp(_4640, 0.0, 1.0);
        float _4644 = exp2(_4638);
        float _4646 = _4644 * _4642;
        float _4648 = _4632 * _4646;
        float _4650 = _4648 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4652 = _4648 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4654 = _4648 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _4650;
        out.m_99.y = _4652;
        out.m_99.z = _4654;
    }
    out.m_69.x = _4566;
    out.m_69.y = _4568;
    out.m_69.z = _4570;
    if (!_4552)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _4656 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4656;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4408 = false;
    bool _3405 = false;
    bool _402 = false;
    bool _222 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_51.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4713 = as_type<float>(_134);
        out.gl_Position.z = _4713;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_53.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = _152;
    if (_148)
    {
        float _156 = float(_118);
        _128 = _156;
    }
    float _158 = _128;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    float _166 = _158;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_51.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4783 = as_type<float>(_172);
        out.gl_Position.z = _4783;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = _176 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _184 = _176 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _186 = _176 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _188 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].x, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].x, _186);
    float _194 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[4].z, _188);
    float _196 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[5].z, _190);
    float _198 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[6].z, _192);
    bool _200 = !_180;
    float _202 = _198;
    float _220;
    if (!_200)
    {
        float _204 = in.m_57.x;
        float _206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _210 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _212 = _210 * _206;
        float _214 = floor(_212);
        float _216 = -_214;
        float _218 = _212 + _216;
        _220 = _218;
        _222 = true;
    }
    else
    {
        float _224 = float(_118);
        float _226 = 1.0 / _224;
        float _228 = _152 * _226;
        _220 = _228;
    }
    _222 = false;
    float _230 = _220;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = _230 + _232;
    bool _236 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _238 = isnan(_230);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _230 + _248;
    bool _252 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _254 = isnan(_230);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _268 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _272 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _274 = isnan(_230);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -_246;
    float _286 = _284 + 1.0;
    float _288 = 1.0 / _270;
    float _290 = _282 * _286;
    float _292 = -_282;
    float _294 = _292 + 1.0;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _296;
    float _300 = in.m_59.x;
    float _302 = in.m_59.y;
    float _304 = in.m_59.z;
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _308 = 1.0 / _266;
    float _310 = _262 * _294;
    float _312 = -_262;
    float _314 = _312 + 1.0;
    float _316 = _250 * _288;
    float _318 = _234 * _308;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _324;
    float _328 = fma(_298, _318, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _330 = fma(_322, _318, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _332 = fma(_326, _318, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _334 = _328 * _310;
    float _336 = _330 * _310;
    float _338 = _332 * _310;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _352 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].x, _334);
    float _354 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].y, _336);
    float _356 = fma(_342, _316, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _358 = fma(_346, _316, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _360 = fma(_350, _316, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _362 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].z, _338);
    float _364 = fma(_356, _290, _352);
    float _366 = fma(_358, _290, _354);
    float _368 = fma(_360, _290, _362);
    float _370 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[145].x, _364);
    float _372 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[145].y, _366);
    float _374 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[145].z, _368);
    float _376 = _370 * _300;
    float _378 = _372 * _302;
    float _380 = _374 * _304;
    bool _382 = !_306;
    float _400;
    if (!_382)
    {
        float _384 = in.m_57.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_118);
        float _406 = 1.0 / _404;
        float _408 = _152 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _414 = int(_412);
    float _416 = in.m_57.x;
    float _418 = in.m_57.y;
    float _420 = float(_118);
    float _422 = in.m_61.x;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _426 = _424 != 0;
    float _428 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _430 = int(_428);
    float _432 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _434 = int(_432);
    float _436 = float(_414);
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _444 = float(_430);
    float _446 = 1.0 / _436;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _450 = float(uint(_434));
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _454 = int(_452);
    int _456 = ~_434;
    int _458 = _456 + 1;
    bool _460 = _434 == 0;
    int _462 = ~_434;
    int _464 = _462 + 1;
    float _466 = 1.0 / _444;
    float _468 = _152 * _446;
    float _470 = float(uint(_454));
    float _472 = 1.0 / _450;
    int _474 = ~_454;
    int _476 = _474 + 1;
    int _478 = ~_454;
    int _480 = _478 + 1;
    float _482 = _152 * _466;
    float _484 = trunc(_468);
    int _486 = int(_484);
    float _488 = _466;
    float _490 = _422;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_426)
    {
        float _494 = in.m_57.x;
        _488 = _494;
    }
    float _496 = _488;
    float _498 = _496;
    if (!_426)
    {
        float _500 = in.m_57.y;
        _498 = _500;
    }
    float _502 = _498;
    float _504 = 1.0 / _470;
    int _506 = as_type<int>(_472) + (-2);
    float _508 = trunc(_482);
    int _510 = int(_508);
    float _512 = float(uint(_486));
    float _514 = as_type<float>(_506) * _512;
    int _516 = as_type<int>(_504) + (-2);
    float _518 = 1.0 / _420;
    int _520 = ~_454;
    int _522 = _520 + 1;
    float _524 = float(uint(_510));
    float _526 = trunc(_514);
    float _528 = precise::max(_526, 0.0);
    uint _531 = uint(_528);
    float _533 = as_type<float>(_516) * _524;
    int _535 = ~_434;
    int _537 = _535 + 1;
    float _539 = trunc(_533);
    float _541 = precise::max(_539, 0.0);
    uint _543 = uint(_541);
    int _545 = _537 * int(_531);
    int _547 = _545 + _486;
    float _549 = 1.0 / _442;
    float _551 = float(uint(_547));
    int _553 = _522 * int(_543);
    int _555 = _553 + _510;
    float _557 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _559 = int(_557);
    float _561 = as_type<float>(_506) * _551;
    float _563 = _551;
    if (_426)
    {
        _563 = 1.0;
    }
    float _565 = _563;
    float _567 = float(uint(_555));
    float _569 = _565;
    if (!_426)
    {
        _569 = 7.345489978790283203125;
    }
    float _571 = _569;
    float _573 = trunc(_561);
    float _575 = precise::max(_573, 0.0);
    uint _577 = uint(_575);
    float _579 = as_type<float>(_516) * _567;
    float _581 = _571 * _416;
    float _583 = trunc(_579);
    float _585 = precise::max(_583, 0.0);
    uint _587 = uint(_585);
    int _589 = int(_531) + int(_577);
    float _591 = floor(_581);
    float _593 = float(_434);
    float _595 = as_type<float>(_577);
    if (_426)
    {
        _595 = 1.0;
    }
    float _597 = _595;
    int _599 = _458 * _589;
    int _601 = _599 + _486;
    float _603 = _597;
    if (!_426)
    {
        _603 = 1.2345600128173828125;
    }
    float _605 = _603;
    int _607 = int(_543) + int(_587);
    float _609 = float(_486);
    float _611 = _502 * _605;
    bool _613 = uint(_601) >= uint(_434);
    int _615 = _476 * _607;
    int _617 = _615 + _510;
    bool _619 = _609 >= _593;
    bool _621 = isnan(_609);
    bool _623 = _619 || _621;
    bool _625 = isnan(_593);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    bool _631 = !_613;
    int _633 = _631 ? 0 : (-1);
    float _635 = -_591;
    float _637 = _581 + _635;
    float _639 = trunc(_629);
    int _641 = int(_639);
    int _643 = ~_589;
    int _645 = _643 + _633;
    int _647 = _645 + 1;
    float _649 = _637 * _593;
    float _651 = _152 * _593;
    bool _653 = uint(_617) >= uint(_454);
    int _655 = _434 * _647;
    int _657 = _655 + _486;
    float _659 = _651 * _518;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _663 = _661 != 0;
    float _665 = trunc(_649);
    int _667 = int(_665);
    bool _669 = !_653;
    int _671 = _669 ? 0 : (-1);
    bool _673 = !_460;
    int _675 = _673 ? _657 : (-1);
    int _677 = ~_641;
    int _679 = _677 + 1;
    int _681 = _679 + 1;
    int _683 = _434 + (-1);
    bool _685 = !_663;
    int _687 = _685 ? 0 : 1;
    int _689 = _675 * _681;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _697 = _695 != 0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _701 = _699 != 0;
    int _703 = abs(_687);
    int _705 = _641 * _683;
    int _707 = _705 + _689;
    float _709 = float(_454);
    float _711 = trunc(_659);
    int _713 = int(_711);
    bool _715 = !_697;
    int _717 = _715 ? 0 : 1;
    int _719 = _667 * _703;
    int _721 = _719 + _486;
    float _723 = float(_510);
    int _725 = ~_607;
    int _727 = _725 + _671;
    int _729 = _727 + 1;
    int _731 = abs(_717);
    float _733 = floor(_611);
    bool _735 = !_693;
    int _737 = _735 ? 0 : 1;
    bool _739 = _723 >= _709;
    bool _741 = isnan(_723);
    bool _743 = _739 || _741;
    bool _745 = isnan(_709);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    int _751 = abs(_737);
    bool _753 = !_701;
    int _755 = _753 ? 0 : 1;
    float _757 = trunc(_749);
    int _759 = int(_757);
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _763 = _761 != 0;
    float _765 = _152 * _709;
    int _767 = abs(_755);
    int _769 = _707 * _731;
    bool _771 = !_763;
    int _773 = _771 ? 0 : 1;
    float _775 = _765 * _518;
    int _777 = _713 * _751;
    int _779 = _777 + _769;
    int _781 = abs(_773);
    int _783 = _454 * _729;
    int _785 = _783 + _510;
    bool _787 = _454 == 0;
    int _789 = _721 * _767;
    int _791 = _789 + _779;
    float _793 = -_733;
    float _795 = _611 + _793;
    bool _797 = !_787;
    int _799 = _797 ? _785 : (-1);
    float _801 = trunc(_775);
    int _803 = int(_801);
    int _805 = ~_759;
    int _807 = _805 + 1;
    int _809 = _807 + 1;
    int _811 = _667 * _781;
    int _813 = _811 + _791;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _817 = _815 != 0;
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _821 = _819 != 0;
    float _823 = _709 * _795;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _827 = _825 != 0;
    int _829 = _809 * _799;
    float _831 = float(uint(_813));
    float _833 = trunc(_823);
    int _835 = int(_833);
    bool _837 = !_821;
    int _839 = _837 ? 0 : 1;
    float _841 = in.m_61.y;
    int _843 = _454 + (-1);
    float _845 = as_type<float>(_506) * _831;
    int _847 = abs(_839);
    bool _849 = !_827;
    int _851 = _849 ? 0 : 1;
    int _853 = _759 * _843;
    int _855 = _853 + _829;
    bool _857 = !_817;
    int _859 = _857 ? 0 : 1;
    float _861 = trunc(_845);
    float _863 = precise::max(_861, 0.0);
    uint _865 = uint(_863);
    int _867 = abs(_851);
    int _869 = abs(_859);
    int _871 = _855 * _847;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _879 = _877 != 0;
    int _881 = _835 * _867;
    int _883 = _881 + _510;
    int _885 = ~_434;
    int _887 = _885 + 1;
    bool _889 = !_875;
    int _891 = _889 ? 0 : 1;
    int _893 = _803 * _869;
    int _895 = _893 + _871;
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _899 = _897 != 0;
    int _901 = abs(_891);
    int _903 = _887 * int(_865);
    int _905 = _903 + _813;
    bool _907 = !_879;
    int _909 = _907 ? 0 : 1;
    float _911 = float(uint(_905));
    int _913 = abs(_909);
    int _915 = _883 * _901;
    int _917 = _915 + _895;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _921 = _919 != 0;
    float _923 = as_type<float>(_506) * _911;
    int _925 = ~_434;
    int _927 = _925 + 1;
    int _929 = _835 * _913;
    int _931 = _929 + _917;
    int _933 = ~_454;
    int _935 = _933 + 1;
    float _937 = trunc(_923);
    float _939 = precise::max(_937, 0.0);
    uint _941 = uint(_939);
    int _943 = _835;
    float _945 = _923;
    bool _947 = _821;
    float _949 = _841;
    bool _951 = _787;
    if (_899)
    {
        float _953 = in.m_57.x;
        _943 = as_type<int>(_953);
    }
    int _955 = _943;
    float _957 = 0.0;
    if (!_899)
    {
        _957 = _422;
    }
    float _959 = _957;
    float _961 = float(uint(_931));
    bool _963 = _434 == 0;
    int _965 = ~_454;
    int _967 = _965 + 1;
    float _969 = as_type<float>(_516) * _961;
    float _971 = _959;
    if (_921)
    {
        float _973 = in.m_57.z;
        _945 = _973;
    }
    float _975 = _945;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _979 = _977 != 0;
    float _981 = trunc(_969);
    float _983 = precise::max(_981, 0.0);
    uint _985 = uint(_983);
    bool _987 = !_979;
    int _989 = _987 ? 0 : 1;
    int _991 = int(_865) + int(_941);
    float _993 = in.m_57.w;
    int _995 = _927 * _991;
    int _997 = _995 + _813;
    int _999 = _955;
    if (_899)
    {
        bool _1001 = as_type<float>(_955) > 0.5;
        _947 = _1001;
    }
    bool _1003 = _947;
    if (_899)
    {
        float _1005 = -_422;
        float _1007 = _1005 + 1.0;
        _999 = as_type<int>(_1007);
    }
    int _1009 = _999;
    bool _1011 = uint(_997) >= uint(_434);
    int _1013 = _935 * int(_985);
    int _1015 = _1013 + _931;
    if (_899)
    {
        float _1017 = _1003 ? as_type<float>(_1009) : _422;
        _971 = _1017;
    }
    float _1019 = _971;
    bool _1021 = !_1011;
    int _1023 = _1021 ? 0 : (-1);
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1027 = _1025 != 0;
    int _1029 = ~_991;
    int _1031 = _1029 + _1023;
    int _1033 = _1031 + 1;
    float _1035 = -_841;
    float _1037 = _1035 + 1.0;
    float _1039 = float(uint(_1015));
    bool _1041 = _418 > 0.5;
    int _1043 = _434 * _1033;
    int _1045 = _1043 + _813;
    int _1047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1049 = _1047 != 0;
    float _1051 = as_type<float>(_516) * _1039;
    int _1053 = _1041 ? as_type<int>(_1037) : as_type<int>(_841);
    bool _1055 = _993 > 0.5;
    float _1057 = trunc(_1051);
    float _1059 = precise::max(_1057, 0.0);
    uint _1061 = uint(_1059);
    float _1063 = _1049 ? as_type<float>(_1053) : _841;
    int _1065 = as_type<int>(_1037);
    bool _1067 = _1049;
    if (_1027)
    {
        float _1069 = _1055 ? _1037 : _841;
        _949 = _1069;
    }
    float _1071 = _949;
    if (_921)
    {
        float _1073 = -_422;
        float _1075 = _1073 + 1.0;
        _1065 = as_type<int>(_1075);
    }
    int _1077 = _1065;
    if (_921)
    {
        bool _1079 = _975 > 0.5;
        _1067 = _1079;
    }
    bool _1081 = _1067;
    bool _1083 = !_963;
    int _1085 = _1083 ? _1045 : (-1);
    if (_921)
    {
        float _1087 = _1081 ? as_type<float>(_1077) : _422;
        _490 = _1087;
    }
    float _1089 = _490;
    float _1091 = in.m_63.x;
    float _1093 = in.m_63.y;
    int _1095 = _1085 & 3;
    bool _1097 = _1095 != 0;
    int _1099 = _1085 & 3;
    bool _1101 = _1099 != 0;
    int _1103 = _1097 ? 0 : 1;
    bool _1105 = _1099 != 3;
    int _1107 = int(_985) + int(_1061);
    bool _1109 = uint(_1099) >= 2u;
    float _1111 = in.m_48.x;
    float _1113 = in.m_48.y;
    float _1115 = in.m_48.z;
    bool _1117 = uint(_1099) > 1u;
    int _1119 = _967 * _1107;
    int _1121 = _1119 + _931;
    int _1123 = _1109 ? 0 : 1;
    int _1125 = ~_1103;
    int _1127 = _1125 + 1;
    int _1129 = _1127 + 1;
    int _1131 = ~_1123;
    int _1133 = _1131 + 1;
    int _1135 = _1133 + 1;
    int _1137 = _1135;
    int _1139 = _1129;
    if (_1105)
    {
        int _1141 = ~_1123;
        int _1143 = _1141 + 1;
        _1137 = _1143;
    }
    int _1145 = _1137;
    bool _1147 = uint(_1121) >= uint(_454);
    float _1149 = _418 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1153 = _1151 != 0;
    bool _1155 = !_1147;
    int _1157 = _1155 ? 0 : (-1);
    float _1159 = fma(_1149, -2.0, _438);
    if (!_1117)
    {
        int _1161 = ~_1103;
        int _1163 = _1161 + 1;
        _1139 = _1163;
    }
    int _1165 = _1139;
    int _1167 = ~_1107;
    int _1169 = _1167 + _1157;
    int _1171 = _1169 + 1;
    float _1173 = float(uint(_721));
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1177 = _1175 != 0;
    int _1179 = _454 * _1171;
    int _1181 = _1179 + _931;
    float _1183 = float(uint(_883));
    float _1185 = as_type<float>(_506) * _1173;
    bool _1187 = !_1177;
    int _1189 = _1187 ? 0 : 1;
    float _1191 = _416 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1193 = !_787;
    int _1195 = _1193 ? _1181 : (-1);
    float _1197 = trunc(_1185);
    float _1199 = precise::max(_1197, 0.0);
    uint _1201 = uint(_1199);
    float _1203 = as_type<float>(_516) * _1183;
    float _1205 = abs(_1091);
    float _1207 = abs(_1093);
    float _1209 = precise::max(_1205, _1207);
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1213 = _1195 & 3;
    bool _1215 = _1213 != 0;
    float _1217 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1219 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1221 = trunc(_1203);
    float _1223 = precise::max(_1221, 0.0);
    uint _1225 = uint(_1223);
    int _1227 = _1215 ? 0 : 1;
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1231 = uint(_1213) >= 2u;
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1235 = _1233 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1237 = _1209 >= 16.0;
    float _1239 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1241 = _1231 ? 0 : 1;
    int _1243 = _464 * int(_1201);
    int _1245 = _1243 + _721;
    bool _1247 = _1213 != 3;
    float _1249 = -_448;
    float _1251 = fma(_1191, 2.0, _1249);
    float _1253 = fma(_1111, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1239);
    float _1255 = fma(_1111, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1217);
    float _1257 = float(uint(_1245));
    float _1259 = fma(_1111, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1219);
    int _1261 = _480 * int(_1225);
    int _1263 = _1261 + _883;
    float _1265 = as_type<float>(_506) * _1257;
    float _1267 = in.m_57.z;
    float _1269 = 1.0 / _1235;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1275;
    float _1279 = float(uint(_1263));
    float _1281 = _1271 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1283 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1287 = ~_1241;
    int _1289 = _1287 + 1;
    int _1291 = _1289 + 1;
    float _1293 = trunc(_1265);
    float _1295 = precise::max(_1293, 0.0);
    uint _1297 = uint(_1295);
    float _1299 = _1277 * _549;
    int _1301 = _1291;
    float _1303 = _1115;
    if (_1247)
    {
        int _1305 = ~_1241;
        int _1307 = _1305 + 1;
        _1301 = _1307;
    }
    int _1309 = _1301;
    float _1311 = _416 * 2.0;
    bool _1313 = uint(_1213) > 1u;
    float _1315 = as_type<float>(_516) * _1279;
    float _1317 = _416 + _418;
    out.m_65.x = _1281;
    out.m_65.y = _1283;
    out.m_65.z = _1285;
    out.m_65.w = _1229;
    int _1319 = ~_1227;
    int _1321 = _1319 + 1;
    int _1323 = _1321 + 1;
    float _1325 = floor(_1311);
    float _1327 = _1317 + (-1.0);
    float _1329 = fma(_1115, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1253);
    int _1331 = _1323;
    if (_1153)
    {
        _492 = 0;
    }
    int _1333 = _492;
    float _1335 = fma(_1115, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1259);
    int _1337 = _1333;
    if (!_1153)
    {
        _1337 = 1;
    }
    int _1339 = _1337;
    float _1341 = trunc(_1315);
    float _1343 = precise::max(_1341, 0.0);
    uint _1345 = uint(_1343);
    if (!_1313)
    {
        int _1347 = ~_1227;
        int _1349 = _1347 + 1;
        _1331 = _1349;
    }
    int _1351 = _1331;
    float _1353 = _1335 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1355 = abs(_1145);
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1361 = _418 + _1267;
    int _1363 = ~_434;
    int _1365 = _1363 + 1;
    float _1367 = _1359 * _1269;
    int _1369 = int(_1201) + int(_1297);
    float _1371 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1375 = _410 + _1373;
    float _1377 = _1361 + (-1.0);
    bool _1379 = _1325 > 0.0;
    float _1381 = _1091 * 0.0625;
    float _1383 = fma(_1299, _1375, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1385 = _1267 * 2.0;
    float _1387 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1389 = _1365 * _1369;
    int _1391 = _1389 + _721;
    bool _1393 = _1325 >= 0.0;
    bool _1395 = isnan(_1325);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan(0.0);
    bool _1401 = _1397 || _1399;
    float _1403 = _1093 * 0.0625;
    int _1405 = int(_1225) + int(_1345);
    float _1407 = floor(_1385);
    int _1409 = ~_454;
    int _1411 = _1409 + 1;
    float _1413 = _418 * 2.0;
    bool _1415 = uint(_1391) >= uint(_434);
    bool _1417 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1419 = isnan(_410);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1425 = _1421 || _1423;
    float _1427 = float(_1425);
    int _1429 = _1411 * _1405;
    int _1431 = _1429 + _883;
    bool _1433 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1435 = isnan(_410);
    bool _1437 = _1433 || _1435;
    bool _1439 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1441 = _1437 || _1439;
    float _1443 = float(_1441);
    float _1445 = _1237 ? _1403 : _1093;
    float _1447 = -_1427;
    float _1449 = _1447 + 1.0;
    bool _1451 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1453 = isnan(_410);
    bool _1455 = _1451 || _1453;
    bool _1457 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1459 = _1455 || _1457;
    float _1461 = float(_1459);
    float _1463 = -_1443;
    float _1465 = _1463 + 1.0;
    float _1467 = _1237 ? _1381 : _1091;
    bool _1469 = uint(_1431) >= uint(_454);
    float _1471 = _1427 * _1465;
    float _1473 = _1461 * _1449;
    bool _1475 = !_1415;
    int _1477 = _1475 ? 0 : (-1);
    float _1479 = -_1461;
    float _1481 = _1479 + 1.0;
    int _1483 = _1401 ? 0 : 1;
    float _1485 = floor(_1413);
    bool _1487 = _1339 != 1;
    bool _1489 = !_1469;
    int _1491 = _1489 ? 0 : (-1);
    bool _1493 = _1407 > 0.0;
    bool _1495 = _1407 >= 0.0;
    bool _1497 = isnan(_1407);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan(0.0);
    bool _1503 = _1499 || _1501;
    float _1505 = _1383 * _1473;
    float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1509 = _410 + _1507;
    int _1511 = ~_1369;
    int _1513 = _1511 + _1477;
    int _1515 = _1513 + 1;
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1519 = _1353 + _1517;
    float _1521 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1505);
    float _1523 = fma(_1367, _1509, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1525 = fma(_1115, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1255);
    float _1527 = _1509;
    float _1529 = _1471;
    if (!_1487)
    {
        float _1531 = in.m_57.z;
        _1527 = _1531;
    }
    float _1533 = _1527;
    int _1535 = _1503 ? 0 : 1;
    float _1537 = fma(_1523, _1471, _1521);
    int _1539 = _1085 >> 31;
    int _1541 = _434 * _1515;
    int _1543 = _1541 + _721;
    int _1545 = _1539 & 3;
    if (!_1487)
    {
        _1303 = _418;
    }
    float _1547 = _1303;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1551 = _1547;
    if (_1487)
    {
        _1551 = _416;
    }
    float _1553 = _1551;
    int _1555 = ~_1535;
    int _1557 = _1555 + 1;
    int _1559 = _1557 + 1;
    int _1561 = _1559;
    if (!_1487)
    {
        _1529 = _418;
    }
    float _1563 = _1529;
    float _1565 = fma(_1553, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1549);
    int _1567 = _1085 + _1545;
    float _1569 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1537);
    float _1571 = _1563;
    if (!_1493)
    {
        int _1573 = ~_1535;
        int _1575 = _1573 + 1;
        _1561 = _1575;
    }
    int _1577 = _1561;
    if (_1487)
    {
        _1571 = _416;
    }
    float _1579 = _1571;
    float _1581 = _1569 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1583 = _1567 >> 2;
    float _1585 = _1579 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1589 = _1583 << 4;
    int _1591 = _1589 + 368;
    float _1593 = 0.0;
    float _1595 = _1533;
    if (!_1487)
    {
        _1593 = _1533;
    }
    float _1597 = _1593;
    float _1599 = -_1587;
    float _1601 = fma(_1585, 2.0, _1599);
    float _1603 = _1597;
    if (_1487)
    {
        _1595 = _418;
    }
    float _1605 = _1595;
    uint _1607 = uint(int(uint(_1591) >> uint(2)));
    uint _1609 = uint(int(uint(int(_1607)) >> uint(2)));
    int _1611 = int(_1607) & 3;
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[int(_1609)][_1611];
    int _1615 = int(_1607) + 1;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    int _1619 = _1615 & 3;
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[int(_1617)][_1619];
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1625 = ~_1483;
    int _1627 = _1625 + 1;
    int _1629 = _1627 + 1;
    int _1631 = _1629;
    if (!_1379)
    {
        int _1633 = ~_1483;
        int _1635 = _1633 + 1;
        _1631 = _1635;
    }
    int _1637 = _1631;
    bool _1639 = _1485 > 0.0;
    int _1641 = _1591 + 8;
    uint _1643 = uint(int(uint(_1641) >> uint(2)));
    uint _1645 = uint(int(uint(int(_1643)) >> uint(2)));
    int _1647 = int(_1643) & 3;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[int(_1645)][_1647];
    int _1651 = int(_1643) + 1;
    uint _1653 = uint(int(uint(_1651) >> uint(2)));
    int _1655 = _1651 & 3;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[int(_1653)][_1655];
    bool _1659 = _1485 >= 0.0;
    bool _1661 = isnan(_1485);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan(0.0);
    bool _1667 = _1663 || _1665;
    float _1669 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1623);
    float _1671 = _1329 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1675 = _1195 >> 31;
    float _1677 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1679 = _1525 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1683 = _1671 + _1681;
    float _1685 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1687 = _1675 & 3;
    float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1691 = _1679 + _1689;
    float _1693 = _1683 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1695 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1697 = _1195 + _1687;
    float _1699 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1693);
    int _1701 = ~_1405;
    int _1703 = _1701 + _1491;
    int _1705 = _1703 + 1;
    int _1707 = _1697 >> 2;
    float _1709 = _1673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1711 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1699);
    float _1713 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1715 = _1707 << 4;
    int _1717 = _1715 + 512;
    bool _1719 = !_963;
    int _1721 = _1719 ? _1543 : (-1);
    bool _1723 = _1711 >= 0.0;
    out.m_67.x = _1695;
    out.m_67.y = _1709;
    out.m_67.z = _1713;
    out.m_67.w = _1581;
    bool _1725 = !_1101;
    int _1727 = _1725 ? 0 : 1;
    uint _1729 = uint(int(uint(_1717) >> uint(2)));
    uint _1731 = uint(int(uint(int(_1729)) >> uint(2)));
    int _1733 = int(_1729) & 3;
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[int(_1731)][_1733];
    int _1737 = int(_1729) + 1;
    uint _1739 = uint(int(uint(_1737) >> uint(2)));
    int _1741 = _1737 & 3;
    float _1743 = (*spvDescriptorSet0.vp_c9)._m0[int(_1739)][_1741];
    bool _1745 = _1099 != 3;
    int _1747 = abs(_1727);
    bool _1749 = !_1745;
    int _1751 = _1749 ? 0 : (-1);
    int _1753 = _1195 & 3;
    bool _1755 = _1753 != 0;
    int _1757 = abs(_1309);
    float _1759 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1761 = log2(_1759);
    int _1763 = abs(_1165);
    int _1765 = ~_1747;
    int _1767 = _1765 + 1;
    int _1769 = _1767 + 1;
    int _1771 = abs(_1751);
    float _1773 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1775 = int(_1773);
    int _1777 = ~_1763;
    int _1779 = _1777 + 1;
    int _1781 = _1779 + 1;
    float _1783 = float(uint(_559));
    if (_1487)
    {
        _1603 = _418;
    }
    float _1785 = _1603;
    int _1787 = _1781 * as_type<int>(_1621);
    int _1789 = ~_1355;
    int _1791 = _1789 + 1;
    int _1793 = _1791 + 1;
    float _1795 = _1761 * _152;
    float _1797 = 1.0 / _1783;
    int _1799 = _1769 * as_type<int>(_1613);
    int _1801 = _1799 + _1787;
    int _1803 = ~_1771;
    int _1805 = _1803 + 1;
    int _1807 = _1805 + 1;
    int _1809 = _1717 + 8;
    uint _1811 = uint(int(uint(_1809) >> uint(2)));
    uint _1813 = uint(int(uint(int(_1811)) >> uint(2)));
    int _1815 = int(_1811) & 3;
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[int(_1813)][_1815];
    int _1819 = int(_1811) + 1;
    uint _1821 = uint(int(uint(_1819) >> uint(2)));
    int _1823 = _1819 & 3;
    float _1825 = (*spvDescriptorSet0.vp_c9)._m0[int(_1821)][_1823];
    bool _1827 = !_1755;
    int _1829 = _1827 ? 0 : 1;
    int _1831 = _1793 * as_type<int>(_1649);
    int _1833 = _1831 + _1801;
    bool _1835 = _1213 != 3;
    float _1837 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1839 = abs(_1189);
    int _1841 = _1807 * as_type<int>(_1657);
    int _1843 = _1841 + _1833;
    int _1845 = abs(_1351);
    int _1847 = abs(_559);
    int _1849 = abs(_1829);
    int _1851 = ~_1845;
    int _1853 = _1851 + 1;
    int _1855 = _1853 + 1;
    float _1857 = exp2(_1795);
    int _1859 = ~_1839;
    int _1861 = _1859 + 1;
    int _1863 = _1861 + 1;
    int _1865 = _1855 * as_type<int>(_1743);
    int _1867 = ~_1849;
    int _1869 = _1867 + 1;
    int _1871 = _1869 + 1;
    float _1873 = float(uint(_1847));
    int _1875 = _1843 * _1863;
    int _1877 = as_type<int>(_1797) + (-2);
    int _1879 = _1871 * as_type<int>(_1735);
    int _1881 = _1879 + _1865;
    bool _1883 = !_1835;
    int _1885 = _1883 ? 0 : (-1);
    int _1887 = _1721 * _1839;
    int _1889 = _1887 + _1875;
    float _1891 = 1.0 / _1873;
    float _1893 = abs(_1445);
    bool _1895 = _1893 != 0.0;
    bool _1897 = isnan(_1893);
    bool _1899 = _1895 || _1897;
    bool _1901 = isnan(0.0);
    bool _1903 = _1899 || _1901;
    float _1905 = _1683 * _1683;
    int _1907 = abs(_1775);
    float _1909 = float(uint(_1889));
    float _1911 = abs(_1467);
    bool _1913 = _1911 == 0.0;
    bool _1915 = !_1903;
    bool _1917 = _1913 && _1915;
    int _1919 = abs(_1885);
    float _1921 = as_type<float>(_1877) * _1909;
    float _1923 = fma(_1691, _1691, _1905);
    int _1925 = ~_1919;
    int _1927 = _1925 + 1;
    int _1929 = _1927 + 1;
    int _1931 = ~_1757;
    int _1933 = _1931 + 1;
    int _1935 = _1933 + 1;
    int _1937 = abs(_989);
    float _1939 = trunc(_1921);
    float _1941 = precise::max(_1939, 0.0);
    uint _1943 = uint(_1941);
    int _1945 = _1935 * as_type<int>(_1817);
    int _1947 = _1945 + _1881;
    float _1949 = float(uint(_1775));
    int _1951 = _454 * _1705;
    int _1953 = _1951 + _883;
    float _1955 = float(uint(_1907));
    int _1957 = _1929 * as_type<int>(_1825);
    int _1959 = _1957 + _1947;
    int _1961 = ~_1937;
    int _1963 = _1961 + 1;
    int _1965 = _1963 + 1;
    bool _1967 = !_787;
    int _1969 = _1967 ? _1953 : (-1);
    float _1971 = 1.0 / _1949;
    int _1973 = _1965;
    int _1975 = _1917 ? (-1) : 0;
    float _1977 = _1857;
    if (_1917)
    {
        bool _1979 = as_type<int>(_1467) >= 0;
        _951 = _1979;
    }
    bool _1981 = _951;
    int _1983 = _1965 * _1959;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_1917)
    {
        int _1987 = _1981 ? 0 : 1078530011;
        _1973 = _1987;
    }
    int _1989 = _1973;
    int _1991 = _1969 * _1937;
    int _1993 = _1991 + _1983;
    float _1995 = abs(_1467);
    bool _1997 = _1995 == 0.0;
    float _1999 = 1.0 / _1955;
    float _2001 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2003 = _1989;
    if (_1917)
    {
        int _2005 = int(0x80000000) & as_type<int>(_1445);
        int _2007 = _1989 | _2005;
        _1985 = as_type<float>(_2007);
    }
    float _2009 = _1985;
    float _2011 = fma(_1837, -2.0, _2001);
    float _2013 = float(uint(_1993));
    int _2015 = as_type<int>(_1971) + (-2);
    float _2017 = fma(_1519, _1519, _1923);
    int _2019 = ~_559;
    int _2021 = _2019 + 1;
    int _2023 = abs(_1889);
    float _2025 = rsqrt(_2017);
    int _2027 = _2021 * int(_1943);
    int _2029 = _2027 + _1889;
    float _2031 = float(uint(_2029));
    float _2033 = sqrt(_2017);
    bool _2035 = !_1903;
    bool _2037 = _2035 && _1997;
    float _2039 = _2009;
    float _2041 = _2009;
    if (!_2037)
    {
        float _2043 = abs(_1445);
        bool _2045 = _2043 != as_type<float>(0x7f800000u /* inf */);
        bool _2047 = isnan(_2043);
        bool _2049 = _2045 || _2047;
        bool _2051 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2053 = _2049 || _2051;
        float _2055 = abs(_1467);
        bool _2057 = _2055 == as_type<float>(0x7f800000u /* inf */);
        float _2059 = abs(_1467);
        bool _2061 = _2059 == as_type<float>(0x7f800000u /* inf */);
        bool _2063 = !_2053;
        bool _2065 = _2061 && _2063;
        if (_2065)
        {
            bool _2067 = as_type<int>(_1467) >= 0;
            _1975 = _2067 ? (-1) : 0;
        }
        int _2069 = _1975;
        if (_2065)
        {
            _2003 = 1075235812;
        }
        int _2071 = _2003;
        int _2073 = _2071;
        if (_2065)
        {
            int _2075 = ~_2069;
            int _2077 = (_2075 != 0) ? _2071 : 1061752795;
            _2073 = _2077;
        }
        int _2079 = _2073;
        if (_2065)
        {
            int _2081 = int(0x80000000) & as_type<int>(_1445);
            int _2083 = _2079 | _2081;
            _2039 = as_type<float>(_2083);
        }
        float _2085 = _2039;
        bool _2087 = !_2053;
        bool _2089 = _2087 && _2057;
        _2041 = _2085;
        if (!_2089)
        {
            float _2091 = abs(_1445);
            float _2093 = abs(_1467);
            float _2095 = precise::max(_2091, _2093);
            float _2097 = abs(_1445);
            float _2099 = abs(_1467);
            float _2101 = precise::min(_2097, _2099);
            float _2103 = 1.0 / _2095;
            float _2105 = abs(_1445);
            float _2107 = abs(_1467);
            bool _2109 = _2105 > _2107;
            bool _2111 = as_type<int>(_1467) >= 0;
            float _2113 = _2101 * _2103;
            float _2115 = abs(_1445);
            float _2117 = abs(_1467);
            float _2119 = _2115 + _2117;
            int _2121 = as_type<int>(_1445) & int(0x80000000);
            float _2123 = _2113 * _2113;
            bool _2125 = _2119 > as_type<float>(0x7f800000u /* inf */);
            bool _2127 = isnan(_2119);
            bool _2129 = _2125 || _2127;
            bool _2131 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2133 = _2129 || _2131;
            float _2135 = _2123 + 11.33538818359375;
            float _2137 = fma(_2123, _2135, 28.84246826171875);
            float _2139 = fma(_2123, _2137, 19.6966705322265625);
            float _2141 = fma(_2123, -0.82336294651031494140625, -5.674867153167724609375);
            float _2143 = fma(_2123, _2141, -6.565555095672607421875);
            float _2145 = 1.0 / _2139;
            float _2147 = _2123 * _2143;
            float _2149 = _2113 * _2147;
            float _2151 = fma(_2149, _2145, _2113);
            float _2153 = _2151;
            _2041 = _2119;
            if (_2109)
            {
                float _2155 = -_2151;
                float _2157 = _2155 + 1.57079637050628662109375;
                _2153 = _2157;
            }
            float _2159 = _2153;
            int _2161 = as_type<int>(_2159);
            if (!_2111)
            {
                float _2163 = -_2159;
                float _2165 = _2163 + 3.1415927410125732421875;
                _2161 = as_type<int>(_2165);
            }
            int _2167 = _2161;
            if (!_2133)
            {
                int _2169 = _2121 | _2167;
                _2041 = as_type<float>(_2169);
            }
        }
    }
    float _2171 = _2041;
    float _2173 = as_type<float>(_2015) * _2013;
    int _2175 = as_type<int>(_1891) + (-2);
    float _2177 = as_type<float>(_1877) * _2031;
    float _2179 = float(uint(_2023));
    float _2181 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2183 = abs(_1993);
    float _2185 = trunc(_2173);
    float _2187 = precise::max(_2185, 0.0);
    uint _2189 = uint(_2187);
    int _2191 = as_type<int>(_1999) + (-2);
    float _2193 = as_type<float>(_2175) * _2179;
    float _2195 = float(uint(_2183));
    float _2197 = _2181 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _2199 = ~_1775;
    int _2201 = _2199 + 1;
    float _2203 = _2033 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2205 = ~_1847;
    int _2207 = _2205 + 1;
    float _2209 = trunc(_2193);
    float _2211 = precise::max(_2209, 0.0);
    uint _2213 = uint(_2211);
    float _2215 = as_type<float>(_2191) * _2195;
    bool _2217 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2219 = isnan(0.0);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2225 = _2221 || _2223;
    float _2227 = -_1857;
    float _2229 = _2227 + 1.0;
    float _2231 = precise::min(_2197, _2203);
    if (_1723)
    {
        _1977 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2233 = _1977;
    float _2235 = -_152;
    float _2237 = fma(_2235, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1251);
    float _2239 = trunc(_2177);
    float _2241 = precise::max(_2239, 0.0);
    uint _2243 = uint(_2241);
    int _2245 = _2201 * int(_2189);
    int _2247 = _2245 + _1993;
    int _2249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2251 = _2249 != 0;
    int _2253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2255 = _2253 != 0;
    int _2257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2259 = _2257 != 0;
    int _2261 = as_type<int>(_2233);
    if (_1723)
    {
        float _2263 = _2233 * 5.0;
        _2261 = as_type<int>(_2263);
    }
    int _2265 = _2261;
    int _2267 = ~_1907;
    int _2269 = _2267 + 1;
    float _2271 = -_152;
    float _2273 = fma(_2271, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1601);
    float _2275 = float(uint(_2247));
    float _2277 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2011);
    float _2279 = trunc(_2215);
    float _2281 = precise::max(_2279, 0.0);
    uint _2283 = uint(_2281);
    int _2285 = _2207 * int(_2213);
    int _2287 = _2285 + _2023;
    if (_1723)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7852 = as_type<float>(_2265);
        out.gl_Position.z = _7852;
    }
    float _2289 = as_type<float>(_2015) * _2275;
    float _2291 = _2225 ? _2229 : 0.0;
    float _2293 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1565);
    float _2295 = float(uint(_2287));
    float _2297 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1669);
    int _2299 = int(_1943) + int(_2243);
    float _2301 = _1683 * _2025;
    float _2303 = trunc(_2289);
    float _2305 = precise::max(_2303, 0.0);
    uint _2307 = uint(_2305);
    float _2309 = as_type<float>(_2175) * _2295;
    float _2311 = _1691 * _2025;
    float _2313 = _2301 * _2231;
    float _2315 = _1519 * _2025;
    int _2317 = ~_559;
    int _2319 = _2317 + 1;
    int _2321 = _2269 * int(_2283);
    int _2323 = _2321 + _2183;
    float _2325 = _2311 * _2231;
    float _2327 = -_2313;
    float _2329 = _1683 + _2327;
    float _2331 = _2315 * _2231;
    float _2333 = trunc(_2309);
    float _2335 = precise::max(_2333, 0.0);
    uint _2337 = uint(_2335);
    float _2339 = float(uint(_2323));
    float _2341 = -_2325;
    float _2343 = _1691 + _2341;
    float _2345 = _2329 * _2329;
    int _2347 = _2319 * _2299;
    int _2349 = _2347 + _1889;
    float _2351 = precise::max(_2171, -3.1415927410125732421875);
    float _2353 = as_type<float>(_2191) * _2339;
    float _2355 = fma(_2343, _2343, _2345);
    float _2357 = -_2331;
    float _2359 = _1519 + _2357;
    int _2361 = ~_1775;
    int _2363 = _2361 + 1;
    out.m_69.w = _2231;
    int _2365 = int(_2189) + int(_2307);
    float _2367 = trunc(_2353);
    float _2369 = precise::max(_2367, 0.0);
    uint _2371 = uint(_2369);
    float _2373 = fma(_2359, _2359, _2355);
    if (_1723)
    {
        out.m_51.x = 0.0;
    }
    bool _2375 = uint(_2349) >= uint(_559);
    int _2377 = int(_2213) + int(_2337);
    int _2379 = _2363 * _2365;
    int _2381 = _2379 + _1993;
    float _2383 = sqrt(_2373);
    int _2385 = ~_1847;
    int _2387 = _2385 + 1;
    bool _2389 = !_2375;
    int _2391 = _2389 ? 0 : (-1);
    int _2393 = ~_1907;
    int _2395 = _2393 + 1;
    int _2397 = _2387 * _2377;
    int _2399 = _2397 + _2023;
    bool _2401 = uint(_2381) >= uint(_1775);
    int _2403 = int(_2283) + int(_2371);
    float _2405 = precise::min(_2351, 3.1415927410125732421875);
    int _2407 = _2395 * _2403;
    int _2409 = _2407 + _2183;
    bool _2411 = !_2401;
    int _2413 = _2411 ? 0 : (-1);
    bool _2415 = uint(_2399) >= uint(_1847);
    float _2417 = fma(_2405, 0.15915493667125701904296875, 0.5);
    float _2419 = _2025 * _2383;
    int _2421 = ~_2299;
    int _2423 = _2421 + _2391;
    int _2425 = _2423 + 1;
    bool _2427 = !_2415;
    int _2429 = _2427 ? 0 : (-1);
    float _2431 = _2181 * _2419;
    bool _2433 = uint(_2409) >= uint(_1907);
    int _2435 = _559 * _2425;
    int _2437 = _2435 + _1889;
    int _2439 = ~_2365;
    int _2441 = _2439 + _2413;
    int _2443 = _2441 + 1;
    float _2445 = _2431 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2447 = !_2433;
    int _2449 = _2447 ? 0 : (-1);
    float _2451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2453 = _559 == 0;
    int _2455 = _1775 * _2443;
    int _2457 = _2455 + _1993;
    int _2459 = _1889 ^ _559;
    float _2461 = _2301 * _2445;
    bool _2463 = !_2453;
    int _2465 = _2463 ? _2437 : (-1);
    float _2467 = _2311 * _2445;
    bool _2469 = _1775 == 0;
    float _2471 = _2315 * _2445;
    uint _2473 = uint(int(uint(_2459) >> uint(31)));
    float _2475 = -_2461;
    float _2477 = _1683 + _2475;
    bool _2479 = !_2469;
    int _2481 = _2479 ? _2457 : (-1);
    float _2483 = -_2467;
    float _2485 = _1691 + _2483;
    bool _2487 = _559 == 0;
    float _2489 = fma(_152, 0.033333338797092437744140625, _2417);
    int _2491 = ~_2429;
    int _2493 = _2377 + _2491;
    int _2495 = _2493 + 1;
    float _2497 = _2477 * _2477;
    int _2499 = ~int(_2473);
    int _2501 = _2499 + 1;
    bool _2503 = !_2251;
    int _2505 = _2503 ? 0 : 1;
    int _2507 = _2495 ^ _2501;
    float _2509 = fma(_2485, _2485, _2497);
    float _2511 = _2451 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2513 = float(_2465);
    float _2515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2517 = _1993 ^ _1775;
    float _2519 = fma(_2511, _1019, -0.5);
    int _2521 = abs(_2505);
    float _2523 = fma(_2511, _2513, _2237);
    uint _2525 = uint(int(uint(_2517) >> uint(31)));
    int _2527 = ~_2449;
    int _2529 = _2403 + _2527;
    int _2531 = _2529 + 1;
    float _2533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2535 = ~int(_2525);
    int _2537 = _2535 + 1;
    float _2539 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1159);
    int _2541 = ~_2501;
    int _2543 = _2541 + _2507;
    int _2545 = _2543 + 1;
    int _2547 = _2531 ^ _2537;
    bool _2549 = !_2487;
    int _2551 = _2549 ? _2545 : (-1);
    float _2553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2555 = _1775 == 0;
    float _2557 = _2515 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2559 = float(_2521);
    float _2561 = -_2471;
    float _2563 = _1519 + _2561;
    int _2565 = ~_2537;
    int _2567 = _2565 + _2547;
    int _2569 = _2567 + 1;
    float _2571 = fma(_2557, _1089, -0.5);
    float _2573 = _2533 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2575 = float(_2481);
    float _2577 = fma(_2563, _2563, _2509);
    bool _2579 = !_2555;
    int _2581 = _2579 ? _2569 : (-1);
    float _2583 = fma(_2573, _1063, -0.5);
    bool _2585 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2587 = isnan(1.0);
    bool _2589 = _2585 || _2587;
    bool _2591 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2593 = _2589 || _2591;
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2597 = 1.0 + _2595;
    float _2599 = float(_2551);
    float _2601 = fma(_2557, _2575, _2273);
    float _2603 = _2553 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2605 = 1.0 / _2597;
    float _2607 = float(_1577);
    float _2609 = -_2539;
    float _2611 = fma(_2573, _2599, _2609);
    float _2613 = float(_2581);
    float _2615 = in.m_71.x;
    float _2617 = in.m_71.y;
    float _2619 = in.m_71.z;
    float _2621 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2623 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2625 = fma(_2603, _1071, -0.5);
    float _2627 = sqrt(_2577);
    float _2629 = -_2277;
    float _2631 = fma(_2603, _2613, _2629);
    float _2633 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2621);
    float _2635 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2623);
    float _2637 = _2559 * _2607;
    float _2639 = fma(_2293, _2571, _2601);
    float _2641 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2633);
    float _2643 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2635);
    float _2645 = _2471;
    if (_2593)
    {
        float _2647 = _2291 * _2605;
        _154 = _2647;
    }
    float _2649 = _154;
    float _2651 = _2637 * (-2.0);
    float _2653 = fma(_2641, _2519, _2523);
    float _2655 = fma(_2643, _2583, _2611);
    float _2657 = fma(_2297, _2625, _2631);
    float _2659 = _2653 + 0.5;
    float _2661 = _2639 + 0.5;
    float _2663 = _2025 * _2627;
    float _2665 = _2655 + 0.5;
    float _2667 = _2657 + 0.5;
    float _2669 = fma(_1371, _2651, _1371);
    float _2671 = _2431 * _2663;
    int _2673 = _1667 ? 0 : 1;
    float _2675 = fma(_2651, _2615, _2615);
    bool _2677 = !_2255;
    int _2679 = _2677 ? 0 : 1;
    out.m_73.x = _2659;
    out.m_73.y = _2665;
    out.m_73.z = _2661;
    out.m_73.w = _2667;
    float _2681 = _416 + (-0.5);
    int _2683 = ~_2673;
    int _2685 = _2683 + 1;
    int _2687 = _2685 + 1;
    out.m_75.x = _2671;
    bool _2689 = !_2259;
    int _2691 = _2689 ? 0 : 1;
    int _2693 = abs(_2679);
    int _2695 = _2687;
    float _2697 = _2619;
    float _2699 = _2627;
    float _2701 = _2663;
    if (_1723)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2703 = -_2461;
    float _2705 = _1671 + _2703;
    float _2707 = -_2467;
    float _2709 = _1679 + _2707;
    float _2711 = float(_1637);
    float _2713 = fma(_2681, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2675);
    float _2715 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2717 = _2705 + _2715;
    float _2719 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2721 = _2709 + _2719;
    float _2723 = float(_2693);
    float _2725 = fma(_2669, _2649, _2713);
    float _2727 = _2717 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (!_1639)
    {
        int _2729 = ~_2673;
        int _2731 = _2729 + 1;
        _2695 = _2731;
    }
    int _2733 = _2695;
    float _2735 = _416 + _1267;
    int _2737 = abs(_2691);
    float _2739 = fma(_2721, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2727);
    float _2741 = -_2471;
    float _2743 = _1353 + _2741;
    float _2745 = _2723 * _2711;
    float _2747 = float(_2733);
    float _2749 = _2735 + (-1.0);
    float _2751 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2753 = _2743 + _2751;
    float _2755 = float(_2737);
    float _2757 = _2745 * (-2.0);
    float _2759 = _418 + (-0.5);
    float _2761 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2739);
    float _2763 = _1267 + (-0.5);
    float _2765 = _2755 * _2747;
    float _2767 = fma(_2757, _2617, _2617);
    float _2769 = fma(_1387, _2757, _1387);
    bool _2771 = _2761 >= 0.0;
    float _2773 = _2765 * (-2.0);
    float _2775 = fma(_2759, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2767);
    float _2777 = _2489 * 6.283185482025146484375;
    float _2779 = _2725 * 0.15915493667125701904296875;
    float _2781 = fma(_2749, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2783 = fma(_2773, _2619, _2619);
    float _2785 = fma(_2769, _2649, _2775);
    float _2787 = _2777 * 0.15915493667125701904296875;
    float _2789 = fma(_2781, _2773, _2781);
    float _2791 = fma(_2763, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2783);
    float _2793 = _2785 * 0.15915493667125701904296875;
    if (_2771)
    {
        _2697 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2795 = _2697;
    float _2797 = _2779 * 6.283185482025146484375;
    float _2799 = sin(_2797);
    float _2801 = fma(_2789, _2649, _2791);
    int _2803 = as_type<int>(_2795);
    if (_2771)
    {
        out.m_51.x = 0.0;
    }
    if (_2771)
    {
        float _2805 = _2795 * 5.0;
        _2803 = as_type<int>(_2805);
    }
    int _2807 = _2803;
    float _2809 = _2801 * 0.15915493667125701904296875;
    float _2811 = in.m_63.z;
    float _2813 = _2787 * 6.283185482025146484375;
    float _2815 = sin(_2813);
    if (_2771)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8643 = as_type<float>(_2807);
        out.gl_Position.z = _8643;
    }
    float _2817 = _2779 * 6.283185482025146484375;
    float _2819 = cos(_2817);
    float _2821 = _2793 * 6.283185482025146484375;
    float _2823 = sin(_2821);
    float _2825 = _2793 * 6.283185482025146484375;
    float _2827 = cos(_2825);
    float _2829 = _2809 * 6.283185482025146484375;
    float _2831 = sin(_2829);
    if (_2771)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2833 = -_1671;
    float _2835 = _2833 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2837 = -_1679;
    float _2839 = _2837 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2841 = -_1353;
    float _2843 = _2841 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2845 = _2809 * 6.283185482025146484375;
    float _2847 = cos(_2845);
    float _2849 = _2835 * _2835;
    float _2851 = fma(_2815, 0.25, 1.25);
    float _2853 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2855 = _2419 * _2663;
    float _2857 = fma(_2839, _2839, _2849);
    float _2859 = _380 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2861 = _2851 * _1093;
    float _2863 = _2853 * _2855;
    float _2865 = fma(_2843, _2843, _2857);
    float _2867 = _2859 * _2855;
    float _2869 = _2851 * _1091;
    float _2871 = _2851 * _2811;
    float _2873 = _2799 * _2823;
    float _2875 = _2819 * _2827;
    float _2877 = rsqrt(_2865);
    float _2879 = _2819 * _2823;
    float _2881 = _2799 * _2827;
    float _2883 = _2819 * _2847;
    float _2885 = _2827 * _2847;
    float _2887 = _2799 * _2847;
    float _2889 = _2823 * _2847;
    float _2891 = fma(_2831, _2875, _2873);
    float _2893 = -_2879;
    float _2895 = fma(_2831, _2881, _2893);
    float _2897 = fma(_2831, _2873, _2875);
    float _2899 = -_2881;
    float _2901 = fma(_2831, _2879, _2899);
    float _2903 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2861);
    bool _2905 = _2861 != 0.0;
    bool _2907 = isnan(_2861);
    bool _2909 = _2905 || _2907;
    bool _2911 = isnan(0.0);
    bool _2913 = _2909 || _2911;
    float _2915 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2871);
    float _2917 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2869);
    float _2919 = _2839 * _2877;
    float _2921 = _2843 * _2877;
    float _2923 = _2835 * _2877;
    bool _2925 = _2869 == 0.0;
    bool _2927 = !_2913;
    bool _2929 = _2925 && _2927;
    float _2931 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2933 = _2919 * _2931;
    float _2935 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2937 = _2921 * _2935;
    float _2939 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2941 = _2923 * _2939;
    float _2943 = in.m_77.x;
    float _2945 = in.m_77.y;
    float _2947 = in.m_77.z;
    float _2949 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2951 = -_2933;
    float _2953 = fma(_2921, _2949, _2951);
    float _2955 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2957 = -_2937;
    float _2959 = fma(_2923, _2955, _2957);
    float _2961 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2963 = -_2941;
    float _2965 = fma(_2919, _2961, _2963);
    bool _2967 = _2871 == 0.0;
    bool _2969 = _2967 && _2929;
    float _2971 = _2953 * _2953;
    float _2973 = _2671 * _2917;
    float _2975 = fma(_2959, _2959, _2971);
    float _2977 = _2863 * _2903;
    float _2979 = _2867 * _2915;
    float _2981 = fma(_2965, _2965, _2975);
    float _2983 = -_2977;
    float _2985 = _2831 * _2983;
    float _2987 = _2883 * _2977;
    float _2989 = _2887 * _2977;
    float _2991 = rsqrt(_2981);
    float _2993 = in.m_79.x;
    float _2995 = in.m_79.y;
    float _2997 = in.m_79.z;
    float _2999 = in.m_79.w;
    float _3001 = fma(_2885, _2973, _2985);
    float _3003 = fma(_2891, _2973, _2987);
    float _3005 = fma(_2895, _2973, _2989);
    float _3007 = fma(_2889, _2979, _3001);
    float _3009 = _2987;
    float _3011 = _2979;
    float _3013 = _2943;
    float _3015 = _2981;
    float _3017 = _2921;
    if (_2969)
    {
        _3009 = _2943;
    }
    float _3019 = _3009;
    float _3021 = fma(_2901, _2979, _3003);
    float _3023 = fma(_2897, _2979, _3005);
    float _3025 = _3019;
    if (_2969)
    {
        _2699 = _2947;
    }
    float _3027 = _2699;
    float _3029 = _3027;
    if (_2969)
    {
        _3011 = _3019;
    }
    float _3031 = _3011;
    float _3033 = _3031;
    if (!_2969)
    {
        _3025 = _2943;
    }
    float _3035 = _3025;
    float _3037 = _2959 * _2991;
    float _3039 = _2953 * _2991;
    float _3041 = _2965 * _2991;
    if (_2969)
    {
        _3013 = _2945;
    }
    float _3043 = _3013;
    float _3045 = _2923 * _3037;
    float _3047 = _2921 * _3039;
    float _3049 = _3043;
    if (!_2969)
    {
        float _3051 = fma(_2861, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2945);
        _3049 = _3051;
    }
    float _3053 = _3049;
    if (_2969)
    {
        _3015 = _3027;
    }
    float _3055 = _3015;
    float _3057 = -_3045;
    float _3059 = fma(_2919, _3039, _3057);
    float _3061 = -_3047;
    float _3063 = fma(_2923, _3041, _3061);
    float _3065 = _3055;
    if (!_2969)
    {
        _3029 = _2947;
    }
    float _3067 = _3029;
    if (!_2969)
    {
        float _3069 = fma(_2869, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3035);
        _3033 = _3069;
    }
    float _3071 = _3033;
    float _3073 = _3059 * _3021;
    float _3075 = _2997 * _3035;
    float _3077 = _3063 * _3021;
    if (!_2969)
    {
        float _3079 = fma(_2871, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3067);
        _3065 = _3079;
    }
    float _3081 = _3065;
    float _3083 = fma(_3041, _3007, _3073);
    float _3085 = -_3075;
    float _3087 = fma(_2993, _3067, _3085);
    float _3089 = _2995 * _3067;
    float _3091 = fma(_3037, _3007, _3077);
    float _3093 = fma(_2921, _3023, _3083);
    float _3095 = _2993 * _2945;
    float _3097 = -_3089;
    float _3099 = fma(_2997, _2945, _3097);
    float _3101 = fma(_2919, _3023, _3091);
    float _3103 = _1353 + _3093;
    float _3105 = -_3095;
    float _3107 = fma(_2995, _3035, _3105);
    float _3109 = _3087 * _2999;
    float _3111 = _1679 + _3101;
    float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3115 = _3103 + _3113;
    float _3117 = _2919 * _3041;
    float _3119 = _3099 * _2999;
    float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3123 = _3111 + _3121;
    float _3125 = _3115 * _3115;
    float _3127 = -_3117;
    float _3129 = fma(_2921, _3037, _3127);
    float _3131 = _3107 * _2999;
    float _3133 = _2891 * _3063;
    float _3135 = fma(_3123, _3123, _3125);
    float _3137 = _2891 * _3129;
    float _3139 = _2891 * _3059;
    float _3141 = _2883 * _3063;
    float _3143 = sqrt(_3135);
    float _3145 = _2901 * _3063;
    float _3147 = _2901 * _3059;
    float _3149 = _2883 * _3129;
    float _3151 = _2901 * _3129;
    float _3153 = _3129 * _3021;
    float _3155 = fma(_2885, _3037, _3133);
    float _3157 = -_2831;
    float _3159 = fma(_3157, _3037, _3141);
    float _3161 = fma(_2889, _3037, _3145);
    float _3163 = fma(_2885, _3039, _3137);
    float _3165 = -_2831;
    float _3167 = fma(_3165, _3039, _3149);
    float _3169 = fma(_2889, _3039, _3151);
    float _3171 = fma(_3039, _3007, _3153);
    float _3173 = _2883 * _3059;
    float _3175 = fma(_2885, _3041, _3139);
    float _3177 = fma(_2887, _2919, _3159);
    bool _3179 = _3143 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3181 = fma(_2923, _3023, _3171);
    float _3183 = -_2831;
    float _3185 = fma(_3183, _3041, _3173);
    float _3187 = fma(_2897, _2919, _3161);
    float _3189 = fma(_2889, _3041, _3147);
    float _3191 = _1671 + _3181;
    float _3193 = fma(_2895, _2919, _3155);
    float _3195 = fma(_2895, _2923, _3163);
    float _3197 = fma(_2895, _2921, _3175);
    float _3199 = fma(_2887, _2923, _3167);
    float _3201 = fma(_2887, _2921, _3185);
    float _3203 = fma(_2897, _2921, _3189);
    float _3205 = fma(_2897, _2923, _3169);
    float _3207 = _3111;
    float _3209 = _3103;
    float _3211 = _3081;
    if (!_3179)
    {
        _3017 = _3191;
    }
    float _3213 = _3017;
    bool _3215 = !_3179;
    float _3217 = _3213;
    if (!_3215)
    {
        float _3219 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3223 = _3143 + _3221;
        float _3225 = _3191 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3227 = rsqrt(_3135);
        float _3229 = _3223 * _3219;
        float _3231 = _3229 * 0.15915493667125701904296875;
        float _3233 = _3231 * 6.283185482025146484375;
        float _3235 = cos(_3233);
        float _3237 = _3231 * 6.283185482025146484375;
        float _3239 = sin(_3237);
        float _3241 = _3235 + (-1.0);
        float _3243 = fma(_3239, _3225, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3245 = _3241 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3247 = _3227 * _3243;
        float _3249 = fma(_3191, _3235, _3245);
        float _3251 = fma(_3123, _3247, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3253 = fma(_3115, _3247, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3217 = _3249;
        _3207 = _3251;
        _3209 = _3253;
    }
    float _3255 = _3217;
    float _3257 = _3207;
    float _3259 = _3209;
    float _3261 = _3177 * _2995;
    float _3263 = _3199 * _2995;
    float _3265 = _3201 * _2995;
    float _3267 = -_2313;
    float _3269 = _3267 + _3255;
    float _3271 = _3177 * _3053;
    float _3273 = _3109 * _3177;
    float _3275 = _3199 * _3053;
    float _3277 = _3201 * _3053;
    float _3279 = _3109 * _3201;
    float _3281 = _3109 * _3199;
    float _3283 = fma(_3193, _2993, _3261);
    float _3285 = -_2325;
    float _3287 = _3285 + _3257;
    float _3289 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3291 = _3269 + _3289;
    float _3293 = fma(_3195, _2993, _3263);
    float _3295 = -_2331;
    float _3297 = _3295 + _3259;
    float _3299 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3301 = _3287 + _3299;
    float _3303 = _3291 * _3291;
    float _3305 = fma(_3193, _3071, _3271);
    float _3307 = fma(_3195, _3071, _3275);
    float _3309 = fma(_3197, _3071, _3277);
    float _3311 = fma(_3301, _3301, _3303);
    float _3313 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3315 = _3297 + _3313;
    float _3317 = fma(_3197, _2993, _3265);
    float _3319 = fma(_3119, _3193, _3273);
    float _3321 = fma(_3119, _3195, _3281);
    float _3323 = fma(_3315, _3315, _3311);
    float _3325 = fma(_3119, _3197, _3279);
    float _3327 = fma(_3187, _2997, _3283);
    float _3329 = fma(_3205, _2997, _3293);
    float _3331 = fma(_3203, _2997, _3317);
    float _3333 = fma(_3187, _3081, _3305);
    float _3335 = sqrt(_3323);
    float _3337 = fma(_3131, _3187, _3319);
    float _3339 = fma(_3205, _3081, _3307);
    float _3341 = fma(_3131, _3205, _3321);
    float _3343 = fma(_3131, _3203, _3325);
    float _3345 = fma(_3203, _3081, _3309);
    out.m_81.x = _3327;
    out.m_81.y = _3329;
    out.m_81.z = _3331;
    float _3347 = -_2325;
    float _3349 = _1679 + _3347;
    float _3351 = -_2313;
    float _3353 = _1671 + _3351;
    out.m_83.x = _3337;
    out.m_83.y = _3341;
    out.m_83.z = _3343;
    float _3355 = -_2331;
    float _3357 = _1353 + _3355;
    out.m_85.x = _3333;
    out.m_85.y = _3339;
    out.m_85.z = _3345;
    bool _3359 = _3335 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3361 = isnan(_3335);
    bool _3363 = _3359 || _3361;
    bool _3365 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3367 = _3363 || _3365;
    float _3369 = _3349;
    if (!_3367)
    {
        _3211 = 1.0;
    }
    float _3371 = _3211;
    bool _3373 = !_3367;
    float _3375 = _3371;
    if (!_3373)
    {
        bool _3377 = _3335 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3379 = isnan(_3335);
        bool _3381 = _3377 || _3379;
        bool _3383 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3385 = _3381 || _3383;
        if (!_3385)
        {
            float _3387 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3389 = _3335 + _3387;
            float _3391 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3393 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3391;
            float _3395 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3397 = _3395 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3399 = 1.0 / _3393;
            float _3401 = _3389 * _3399;
            float _3403 = fma(_3401, _3397, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3375 = _3403;
            _3405 = true;
        }
        else
        {
            bool _3407 = _3335 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3409 = isnan(_3335);
            bool _3411 = _3407 || _3409;
            bool _3413 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3415 = _3411 || _3413;
            if (!_3415)
            {
                float _3417 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3419 = _3335 + _3417;
                float _3421 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3423 = _3421 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3425 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3427 = _3425 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3429 = 1.0 / _3423;
                float _3431 = _3419 * _3429;
                float _3433 = fma(_3431, _3427, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3375 = _3433;
                _3405 = true;
            }
            else
            {
                _3375 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3405 = false;
    float _3435 = _3375;
    float _3437 = -_2461;
    float _3439 = _3437 + _3353;
    float _3441 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3443 = _3269 + _3441;
    float _3445 = -_2467;
    float _3447 = _3445 + _3349;
    float _3449 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3451 = _3287 + _3449;
    float _3453 = _3439 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3455 = fma(_3443, _3435, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3457 = -_2471;
    float _3459 = _3457 + _3357;
    float _3461 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3463 = _3297 + _3461;
    float _3465 = fma(_3447, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3453);
    float _3467 = fma(_3451, _3435, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3469 = -_3353;
    float _3471 = _3469 + _3455;
    float _3473 = fma(_3463, _3435, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3475 = fma(_3459, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3465);
    float _3477 = -_3349;
    float _3479 = _3477 + _3467;
    float _3481 = _3471 * _3471;
    float _3483 = _3439 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3485 = _3475 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3487 = -_3357;
    float _3489 = _3487 + _3473;
    float _3491 = fma(_3479, _3479, _3481);
    float _3493 = fma(_3447, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3483);
    float _3495 = 1.0 / _3485;
    float _3497 = fma(_3489, _3489, _3491);
    float _3499 = fma(_3459, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3493);
    float _3501 = _3499 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3503 = sqrt(_3497);
    float _3505 = _3501 + _3485;
    float _3507 = _3505 * _3495;
    float _3509 = _3507 * 0.5;
    bool _3511 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3513 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3515 = _3511 || _3513;
    bool _3517 = isnan(0.5);
    bool _3519 = _3515 || _3517;
    float _3521 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3523 = fma(_3509, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3521);
    bool _3525 = _3503 > 0.0;
    float _3527 = 1.0 / _3523;
    bool _3529 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3531 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3533 = _3529 || _3531;
    bool _3535 = isnan(0.5);
    bool _3537 = _3533 || _3535;
    float _3539 = _3495;
    float _3541 = _3475;
    float _3543 = _3455;
    float _3545 = _3497;
    float _3547 = _3459;
    float _3549 = _3439;
    if (!_3525)
    {
        _3539 = _3467;
    }
    float _3551 = _3539;
    float _3553 = _3551;
    float _3555 = _3551;
    if (!_3525)
    {
        _3541 = _3473;
    }
    float _3557 = _3541;
    bool _3559 = !_3525;
    float _3561 = _3557;
    if (!_3559)
    {
        float _3563 = _196 * _196;
        float _3565 = rsqrt(_3497);
        float _3567 = fma(_194, _194, _3563);
        float _3569 = fma(_198, _198, _3567);
        float _3571 = sqrt(_3569);
        float _3573 = _3479 * _3565;
        float _3575 = _3471 * _3565;
        float _3577 = _3489 * _3565;
        bool _3579 = _3571 > 0.0;
        float _3581 = _3571;
        if (!_3579)
        {
            _3553 = _3467;
        }
        float _3583 = _3553;
        _3555 = _3583;
        if (!_3579)
        {
            _3581 = _3473;
        }
        float _3585 = _3581;
        bool _3587 = !_3579;
        _3561 = _3585;
        if (!_3587)
        {
            float _3589 = rsqrt(_3569);
            float _3591 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3593 = _196 * _3589;
            float _3595 = _194 * _3589;
            float _3597 = _3575 * _3593;
            float _3599 = _198 * _3589;
            float _3601 = fma(_3573, _3595, _3597);
            float _3603 = _3591 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3605 = fma(_3577, _3599, _3601);
            float _3607 = _3605 * _3603;
            float _3609 = fma(_194, _3607, _3467);
            float _3611 = fma(_196, _3607, _3455);
            float _3613 = fma(_198, _3607, _3473);
            _3561 = _3613;
            _3555 = _3609;
            _3543 = _3611;
            _3545 = _3591;
        }
    }
    float _3615 = _3561;
    float _3617 = _3555;
    float _3619 = _3543;
    float _3621 = _3545;
    float _3623 = -_2471;
    float _3625 = _3623 + _3615;
    float _3627 = -_2467;
    float _3629 = _3627 + _3617;
    float _3631 = -_2461;
    float _3633 = _3631 + _3619;
    float _3635 = _3633;
    float _3637 = _3629;
    float _3639 = _3625;
    float _3641 = _3621;
    if (_3519)
    {
        _2645 = 1.0;
    }
    float _3643 = _2645;
    float _3645 = _3643;
    if (!_3537)
    {
        float _3647 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3649 = _3439 + _3647;
        float _3651 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3653 = _3447 + _3651;
        float _3655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3657 = -_3357;
        float _3659 = _3657 + _3615;
        float _3661 = _3649 * _3649;
        float _3663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3665 = _3459 + _3663;
        float _3667 = -_3353;
        float _3669 = _3667 + _3619;
        float _3671 = fma(_3653, _3653, _3661);
        float _3673 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3675 = fma(_3665, _3665, _3671);
        float _3677 = sqrt(_3675);
        float _3679 = 1.0 / _2663;
        float _3681 = _3673 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3683 = precise::min(_3677, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3685 = _3683 * _3655;
        float _3687 = _3685 * _3679;
        float _3689 = -_3349;
        float _3691 = _3689 + _3617;
        float _3693 = _3681 * _3687;
        float _3695 = _3659 * _3687;
        float _3697 = fma(_3691, _3693, _3447);
        float _3699 = fma(_3669, _3693, _3439);
        float _3701 = fma(_3681, _3695, _3459);
        _2701 = _3679;
        _3635 = _3699;
        _3637 = _3697;
        _3639 = _3701;
    }
    float _3703 = _2701;
    float _3705 = _3635;
    float _3707 = _3637;
    float _3709 = _3639;
    float _3711 = _3703;
    if (_3519)
    {
        _3711 = 1.0;
    }
    float _3713 = _3711;
    float _3715 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3717 = _3527 * _3715;
    float _3719 = _3713;
    if (!_3519)
    {
        float _3721 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3723 = _3721 * 0.15915493667125701904296875;
        float _3725 = _3723 * 6.283185482025146484375;
        float _3727 = cos(_3725);
        float _3729 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3731 = _3729 * 0.15915493667125701904296875;
        float _3733 = _3723 * 6.283185482025146484375;
        float _3735 = sin(_3733);
        float _3737 = 1.0 / _3727;
        float _3739 = _3731 * 6.283185482025146484375;
        float _3741 = cos(_3739);
        float _3743 = _3735 * _3737;
        float _3745 = _3731 * 6.283185482025146484375;
        float _3747 = sin(_3745);
        float _3749 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3751 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3749;
        float _3753 = _3741 * _3743;
        float _3755 = 1.0 / _3753;
        float _3757 = 1.0 / _3751;
        float _3759 = _3747 * _3755;
        float _3761 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3763 = fma(_3717, _3759, _3761);
        float _3765 = _3763 * _3757;
        float _3767 = precise::clamp(_3765, 0.0, 1.0);
        _202 = _3731;
        _3645 = _3767;
    }
    float _3769 = _202;
    float _3771 = _3645;
    float _3773 = _3769;
    if (!_3519)
    {
        float _3775 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3777 = _3775 * 0.15915493667125701904296875;
        float _3779 = _3777 * 6.283185482025146484375;
        float _3781 = cos(_3779);
        float _3783 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3785 = _3783 * 0.15915493667125701904296875;
        float _3787 = _3777 * 6.283185482025146484375;
        float _3789 = sin(_3787);
        float _3791 = 1.0 / _3781;
        float _3793 = _3785 * 6.283185482025146484375;
        float _3795 = cos(_3793);
        float _3797 = _3789 * _3791;
        float _3799 = _3785 * 6.283185482025146484375;
        float _3801 = sin(_3799);
        float _3803 = _3795 * _3797;
        float _3805 = 1.0 / _3803;
        float _3807 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3809 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3807;
        float _3811 = 1.0 / _3809;
        float _3813 = _3801 * _3805;
        float _3815 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3817 = fma(_3717, _3813, _3815);
        float _3819 = _3817 * _3811;
        float _3821 = precise::clamp(_3819, 0.0, 1.0);
        float _3823 = -_3821;
        float _3825 = _3823 + 1.0;
        _3773 = _3781;
        _3719 = _3825;
    }
    float _3827 = _3773;
    float _3829 = _3719;
    float _3831 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3833 = _3705 + _3831;
    float _3835 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3837 = _3707 + _3835;
    float _3839 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3841 = _3709 + _3839;
    float _3843 = _3833 * _3833;
    float _3845 = fma(_3837, _3837, _3843);
    float _3847 = fma(_3841, _3841, _3845);
    float _3849 = rsqrt(_3847);
    float _3851 = _3849 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3853 = _3837 * _3851;
    float _3855 = _3841 * _3851;
    float _3857 = _3853 * _3853;
    float _3859 = _3855 * _3855;
    float _3861 = _3857 + _3859;
    float _3863 = sqrt(_3861);
    bool _3865 = _3863 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3869 = _3863 + _3867;
    float _3871 = _3849;
    float _3873 = _3861;
    float _3875 = _3869;
    float _3877 = _3833;
    if (_3865)
    {
        float _3879 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3871 = _3879;
    }
    float _3881 = _3871;
    if (_3865)
    {
        float _3883 = rsqrt(_3861);
        _3873 = _3883;
    }
    float _3885 = _3873;
    float _3887 = _3885;
    if (_3865)
    {
        float _3889 = _3869 * _3881;
        _3875 = _3889;
    }
    float _3891 = _3875;
    if (_3865)
    {
        float _3893 = _3891 * 0.15915493667125701904296875;
        _3641 = _3893;
    }
    float _3895 = _3641;
    float _3897 = _3827;
    float _3899 = _3895;
    if (_3865)
    {
        float _3901 = _3895 * 6.283185482025146484375;
        float _3903 = sin(_3901);
        _3897 = _3903;
    }
    float _3905 = _3897;
    float _3907 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3909 = precise::max(0.0, _3907);
    float _3911 = _3841;
    float _3913 = _3909;
    float _3915 = _3907;
    if (_3865)
    {
        float _3917 = _3895 * 6.283185482025146484375;
        float _3919 = cos(_3917);
        _3911 = _3919;
    }
    float _3921 = _3911;
    float _3923 = -_3851;
    float _3925 = -_3909;
    float _3927 = fma(_3833, _3923, _3925);
    float _3929 = _3927;
    if (!_3865)
    {
        _3877 = _3857;
    }
    float _3931 = _3877;
    float _3933 = _3931;
    if (_3865)
    {
        float _3935 = _3927 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3913 = _3935;
    }
    float _3937 = _3913;
    float _3939 = _3937;
    if (!_3865)
    {
        _3899 = _3853;
    }
    float _3941 = _3899;
    float _3943 = _3905;
    float _3945 = _3941;
    if (_3865)
    {
        float _3947 = fma(_3905, _3937, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3943 = _3947;
    }
    float _3949 = _3943;
    float _3951 = _3921;
    if (_3865)
    {
        float _3953 = _3921 + (-1.0);
        _3915 = _3953;
    }
    float _3955 = _3915;
    if (_3865)
    {
        float _3957 = _3885 * _3949;
        _3369 = _3957;
    }
    float _3959 = _3369;
    if (!_3865)
    {
        _3887 = _3855;
    }
    float _3961 = _3887;
    float _3963 = _3961;
    if (_3865)
    {
        float _3965 = _3955 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3939 = _3965;
    }
    float _3967 = _3939;
    if (_3865)
    {
        float _3969 = _3853 * _3959;
        _3945 = _3969;
    }
    float _3971 = _3945;
    float _3973 = sqrt(_3847);
    if (_3865)
    {
        float _3975 = _3855 * _3959;
        _3963 = _3975;
    }
    float _3977 = _3963;
    if (_3865)
    {
        float _3979 = fma(_3927, _3921, _3967);
        _3929 = _3979;
    }
    float _3981 = _3929;
    if (_3865)
    {
        float _3983 = _3971 * _3971;
        _3933 = _3983;
    }
    float _3985 = _3933;
    if (!_3865)
    {
        _3951 = _3859;
    }
    float _3987 = _3951;
    float _3989 = _3987;
    if (_3865)
    {
        float _3991 = _3977 * _3977;
        _3989 = _3991;
    }
    float _3993 = _3989;
    float _3995 = fma(_3981, _3981, _3985);
    float _3997 = _3705 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3999 = _3705 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4001 = _3995 + _3993;
    float _4003 = fma(_3707, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3997);
    float _4005 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4007 = rsqrt(_4001);
    float _4009 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4011 = fma(_3973, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4009);
    float _4013 = precise::clamp(_4011, 0.0, 1.0);
    float _4015 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4003);
    float _4017 = fma(_3459, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4019 = _3705 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4021 = -_4013;
    float _4023 = _4021 + 1.0;
    float _4025 = _4015 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4027 = fma(_3707, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4019);
    float _4029 = abs(_4023);
    float _4031 = log2(_4029);
    float _4033 = _4025 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4035 = fma(_3707, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3999);
    float _4037 = fma(_3447, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4039 = -_4033;
    float _4041 = fma(_4039, _4005, 1.0);
    float _4043 = _3705 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4045 = _4007 * _3971;
    float _4047 = _4007 * _3981;
    float _4049 = _4007 * _3977;
    float _4051 = fma(_3707, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4043);
    float _4053 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4027);
    float _4055 = _4045 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4057 = floor(_4037);
    float _4059 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4051);
    float _4061 = _4053 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4063 = -_4055;
    float _4065 = fma(_4047, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4063);
    float _4067 = fma(_3709, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4035);
    float _4069 = _4059 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4071 = _4061 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4073 = -_4049;
    float _4075 = fma(_4073, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4065);
    float _4077 = floor(_4017);
    float _4079 = _4031 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4081 = fma(_4069, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4071);
    float _4083 = _4067 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4085 = fma(_4075, -0.5, 0.5);
    float _4087 = fma(_4075, 0.5, 0.5);
    float _4089 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4081);
    float _4091 = exp2(_4079);
    float _4093 = -_4057;
    float _4095 = _4037 + _4093;
    float _4097 = fma(_4083, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4089);
    float _4099 = _4061 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4101 = sqrt(_4085);
    float _4103 = _4061 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4105 = -_4077;
    float _4107 = _4017 + _4105;
    float _4109 = fma(_4087, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4111 = fma(_4069, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4099);
    float _4113 = fma(_4069, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4103);
    float _4115 = _4047 + 1.0;
    float _4117 = fma(_4087, _4109, -0.212114393711090087890625);
    float _4119 = log2(_4041);
    float _4121 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4111);
    float _4123 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4113);
    float _4125 = -_4047;
    float _4127 = fma(_4091, _4115, _4125);
    float _4129 = 1.0 / _4097;
    float _4131 = fma(_4083, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4121);
    float _4133 = fma(_4083, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4123);
    float _4135 = _4101 * 0.636619746685028076171875;
    float2 _10732 = float2(_4095, _4107);
    float _4137 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10732, float2(0.0), isnan(_10732)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10732, float2(0.0), isnan(_10732)), level(0.0)).x;
    float _4139 = fma(_4087, _4117, 1.570728778839111328125);
    float _4141 = _4119 * 0.693147182464599609375;
    float _4143 = -_4139;
    float _4145 = fma(_4135, _4143, 1.0);
    float _4147 = _4141 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4149 = fma(_4127, 0.5, 0.5);
    float _4151 = _4131 * _4129;
    float _4153 = _4133 * _4129;
    float _4155 = fma(_4151, 0.5, 0.5);
    float _4157 = fma(_4153, -0.5, 0.5);
    float3 _10771 = float3(_4155, _4157, _4147);
    float _4159 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10771, float3(0.0), isnan(_10771)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10771, float3(0.0), isnan(_10771)), level(0.0)).x;
    float3 _10782 = float3(_4155, _4157, _4147);
    float4 _4162 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10782, float3(0.0), isnan(_10782)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10782, float3(0.0), isnan(_10782)), level(0.0)).xyzw;
    float _4164 = _4162.x;
    float _4166 = _4162.y;
    float _4168 = _4162.z;
    float _4170 = _4162.w;
    float2 _10798 = float2(_4145, _4149);
    float3 _4174 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10798, float2(0.0), isnan(_10798)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10798, float2(0.0), isnan(_10798)), level(0.0)).xyz;
    float _4176 = _4174.x;
    float _4178 = _4174.y;
    float _4180 = _4174.z;
    float _4182 = abs(_3717);
    float _4184 = log2(_4182);
    float _4186 = _4031 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4188 = in.m_87.x;
    bool _4190 = _3973 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4192 = isnan(_3973);
    bool _4194 = _4190 || _4192;
    bool _4196 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4198 = _4194 || _4196;
    float _4200 = exp2(_4186);
    bool _4202 = _3717 <= 8000.0;
    bool _4204 = isnan(_3717);
    bool _4206 = _4202 || _4204;
    bool _4208 = isnan(8000.0);
    bool _4210 = _4206 || _4208;
    float _4212 = float(_4210);
    out.m_89.x = _3447;
    out.m_89.y = _3439;
    out.m_89.z = _3459;
    out.m_91.x = _3707;
    out.m_91.y = _3705;
    out.m_91.z = _3709;
    float _4214 = _4184 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4216 = exp2(_4214);
    float _4218 = _4131;
    if (!_4198)
    {
        _3547 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4220 = _3547;
    float _4222 = -_4200;
    float _4224 = _4222 + 1.0;
    float _4226 = _4224;
    float _4228 = _4220;
    float _4230 = _4220;
    if (!_4198)
    {
        _3549 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4232 = _3549;
    float _4234 = fma(_4216, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4236 = precise::clamp(_4234, 0.0, 1.0);
    float _4238 = fma(_4236, -2.0, 3.0);
    float _4240 = _4236 * _4236;
    float _4242 = _4061 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4244 = _4240 * _4238;
    float _4246 = fma(_4069, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4242);
    float _4248 = -_4244;
    float _4250 = _4248 + 1.0;
    float _4252 = fma(_4025, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4246);
    float _4254 = _4131 + _4097;
    float _4256 = fma(_4250, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4244);
    float _4258 = _4097 * 0.5;
    float _4260 = fma(_4083, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4252);
    float _4262 = _4254 * 0.5;
    float _4264 = _4212 * _4256;
    float _4266 = fma(_4133, -0.5, _4258);
    float _4268 = _4224 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4270 = _4264 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4272 = _4260 + _4097;
    out.gl_Position.x = _4131;
    out.gl_Position.y = _4133;
    out.gl_Position.z = _4260;
    out.gl_Position.w = _4097;
    float _4274 = _4232;
    float _4276 = _4232;
    if (!_4198)
    {
        _4226 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4278 = _4226;
    float _4280 = _4272 * 0.5;
    out.m_93.x = _4262;
    out.m_93.y = _4266;
    out.m_93.z = _4280;
    out.m_93.w = _4097;
    float _4282 = _4278;
    float _4284 = _4278;
    if (!_4198)
    {
        _4218 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4286 = _4218;
    float _4288 = -_4137;
    float _4290 = _4288 + 1.0;
    float _4292 = _4290 * _4270;
    float _4294 = precise::clamp(_4292, 0.0, 1.0);
    float _4296 = -_4294;
    float _4298 = fma(_4296, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4300 = _4298 * _4188;
    float _4302 = _4300 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4304 = _4300;
    float _4306 = _4286;
    float _4308 = _4286;
    if (!_4198)
    {
        _4304 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4310 = _4304;
    float _4312 = _4268 * _4159;
    float _4314 = -_4268;
    float _4316 = _4314 + 1.0;
    out.m_95.x = _4302;
    float _4318 = _4170 * _4312;
    float _4320 = _4180 * _4312;
    float _4322 = _4170 * _4316;
    float _4324 = fma(_4176, _4318, _4164);
    float _4326 = fma(_4178, _4318, _4166);
    float _4328 = fma(_4170, _4320, _4168);
    float _4330 = _3771 * _3829;
    out.m_97.x = _4324;
    out.m_97.y = _4326;
    out.m_97.z = _4328;
    out.m_97.w = _4322;
    float _4332 = _4330 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4334 = _4330;
    float _4336 = _4310;
    float _4338 = _4310;
    if (!_4198)
    {
        _4334 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4340 = _4334;
    bool _4342 = !_4198;
    float _4344 = _4340;
    float _4346 = _4340;
    if (!_4342)
    {
        bool _4348 = _3973 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4350 = isnan(_3973);
        bool _4352 = _4348 || _4350;
        bool _4354 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4356 = _4352 || _4354;
        if (!_4356)
        {
            float _4358 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4360 = _3973 + _4358;
            float _4362 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4364 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4362;
            float _4366 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4368 = _4366 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4370 = 1.0 / _4364;
            float _4372 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4374 = _4372 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4376 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4378 = _4376 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4380 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4382 = _4380 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4384 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4386 = _4384 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4388 = _4360 * _4370;
            float _4390 = precise::clamp(_4388, 0.0, 1.0);
            float _4392 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4394 = _4392 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4396 = fma(_4390, _4368, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4398 = fma(_4390, _4394, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4400 = fma(_4390, _4374, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4402 = fma(_4390, _4378, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4404 = fma(_4390, _4382, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4406 = fma(_4390, _4386, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4308 = _4400;
            _4276 = _4404;
            _4284 = _4396;
            _4230 = _4402;
            _4338 = _4398;
            _4346 = _4406;
            _4408 = true;
        }
        else
        {
            bool _4410 = _3973 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4412 = isnan(_3973);
            bool _4414 = _4410 || _4412;
            bool _4416 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4418 = _4414 || _4416;
            if (!_4418)
            {
                _4282 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4420 = _4282;
            _4284 = _4420;
            if (!_4418)
            {
                _4306 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4422 = _4306;
            _4308 = _4422;
            if (!_4418)
            {
                _4336 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4424 = _4336;
            _4338 = _4424;
            if (!_4418)
            {
                _4228 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4426 = _4228;
            _4230 = _4426;
            if (!_4418)
            {
                _4274 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4428 = _4274;
            _4276 = _4428;
            if (!_4418)
            {
                _4344 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4430 = _4344;
            bool _4432 = !_4418;
            _4346 = _4430;
            if (!_4432)
            {
                bool _4434 = _3973 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4436 = isnan(_3973);
                bool _4438 = _4434 || _4436;
                bool _4440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4442 = _4438 || _4440;
                if (!_4442)
                {
                    float _4444 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4446 = _3973 + _4444;
                    float _4448 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4450 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4448;
                    float _4452 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4454 = _4452 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4456 = 1.0 / _4450;
                    float _4458 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4460 = _4458 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4462 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4464 = _4462 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4466 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4468 = _4466 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4470 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4472 = _4470 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4474 = _4446 * _4456;
                    float _4476 = precise::clamp(_4474, 0.0, 1.0);
                    float _4478 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4480 = _4478 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4482 = fma(_4476, _4454, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4484 = fma(_4476, _4480, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4486 = fma(_4476, _4460, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4488 = fma(_4476, _4464, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4490 = fma(_4476, _4468, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4492 = fma(_4476, _4472, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4308 = _4486;
                    _4276 = _4490;
                    _4284 = _4482;
                    _4230 = _4488;
                    _4338 = _4484;
                    _4346 = _4492;
                    _4408 = true;
                }
                else
                {
                    _4308 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4276 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4284 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4230 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4338 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4346 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4408 = false;
    float _4494 = _4308;
    float _4496 = _4276;
    float _4498 = _4284;
    float _4500 = _4230;
    float _4502 = _4338;
    float _4504 = _4346;
    float _4506 = fma(_3339, -0.5, 0.5);
    float _4508 = precise::clamp(_4506, 0.0, 1.0);
    float _4510 = -_4494;
    float _4512 = _4510 + _4496;
    float _4514 = _4332 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4516 = -_4498;
    float _4518 = _4516 + _4500;
    out.m_99.x = 0.0;
    float _4520 = fma(_4508, _4512, _4494);
    float _4522 = fma(_4508, _4518, _4498);
    out.m_51.x = _4514;
    float _4524 = -_4502;
    float _4526 = _4524 + _4504;
    float _4528 = _4520 * 0.586610972881317138671875;
    bool _4530 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4532 = fma(_4508, _4526, _4502);
    float _4534 = fma(_4522, 0.298911988735198974609375, _4528);
    bool _4536 = _3771 > 0.0;
    bool _4538 = isnan(_3771);
    bool _4540 = _4536 || _4538;
    bool _4542 = isnan(0.0);
    bool _4544 = _4540 || _4542;
    float _4546 = fma(_4532, 0.114477999508380889892578125, _4534);
    bool _4548 = _3829 <= 0.0;
    bool _4550 = !_4544;
    bool _4552 = _4548 || _4550;
    float _4554 = -_4546;
    float _4556 = _4522 + _4554;
    float _4558 = -_4546;
    float _4560 = _4520 + _4558;
    float _4562 = -_4546;
    float _4564 = _4532 + _4562;
    float _4566 = fma(_4556, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4546);
    float _4568 = fma(_4560, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4546);
    float _4570 = fma(_4564, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4546);
    bool _4572 = !_4530;
    if (!_4572)
    {
        float _4574 = -_3705;
        float _4576 = _4574 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4578 = -_3707;
        float _4580 = _4578 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4582 = -_3709;
        float _4584 = _4582 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4586 = _4576 * _4576;
        float _4588 = fma(_4580, _4580, _4586);
        float _4590 = fma(_4584, _4584, _4588);
        float _4592 = sqrt(_4590);
        float _4594 = rsqrt(_4590);
        float _4596 = -_4592;
        float _4598 = _4596 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4600 = _4598 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4602 = precise::clamp(_4600, 0.0, 1.0);
        float _4604 = _4580 * _4594;
        float _4606 = _4576 * _4594;
        float _4608 = abs(_4602);
        float _4610 = log2(_4608);
        float _4612 = _4584 * _4594;
        float _4614 = _4604 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4616 = _3339 * _4606;
        float _4618 = -_4606;
        float _4620 = -_4614;
        float _4622 = fma(_4618, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4620);
        float _4624 = fma(_3333, _4604, _4616);
        float _4626 = -_4612;
        float _4628 = fma(_4626, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4622);
        float _4630 = fma(_3345, _4612, _4624);
        float _4632 = precise::clamp(_4630, 0.0, 1.0);
        float _4634 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4636 = _4628 + _4634;
        float _4638 = _4610 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4640 = _4636 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4642 = precise::clamp(_4640, 0.0, 1.0);
        float _4644 = exp2(_4638);
        float _4646 = _4644 * _4642;
        float _4648 = _4632 * _4646;
        float _4650 = _4648 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4652 = _4648 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4654 = _4648 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _4650;
        out.m_99.y = _4652;
        out.m_99.z = _4654;
    }
    out.m_69.x = _4566;
    out.m_69.y = _4568;
    out.m_69.z = _4570;
    if (!_4552)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _4656 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4656;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

