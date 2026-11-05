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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_71 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_75 [[attribute(5)]];
    float4 m_73 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_63 [[attribute(10)]];
    float4 m_59 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3564 = false;
    bool _440 = false;
    bool _320 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3870 = as_type<float>(_124);
        out.gl_Position.z = _3870;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_51.w;
    float _130 = float(_108);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = _134;
    if (_150)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_150)
    {
        out.m_49.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _126 = as_type<int>(_156);
    }
    int _158 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3934 = as_type<float>(_158);
        out.gl_Position.z = _3934;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = 1.0 / _130;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _134 * _166;
    float _172 = _162 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _174 = _162 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _162 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _178 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[4].x, _172);
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[6].x, _176);
    float _184 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].z, _178);
    float _186 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    bool _190 = !_168;
    float _192 = _188;
    float _210;
    if (!_190)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        _210 = _170;
    }
    _212 = false;
    float _214 = _210;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = _214 + _216;
    bool _220 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _222 = isnan(_214);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _232;
    bool _236 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _238 = isnan(_214);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -_230;
    float _250 = _248 + 1.0;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _252;
    float _256 = 1.0 / _234;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _260 = _246 * _250;
    float _262 = -_246;
    float _264 = _262 + 1.0;
    float _266 = _218 * _256;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _268;
    float _272 = fma(_254, _266, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = fma(_270, _266, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _280 = fma(_276, _266, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _282 = _272 * _260;
    float _284 = _278 * _260;
    float _286 = _280 * _260;
    float _288 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].x, _282);
    float _290 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _292 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].z, _284);
    float _294 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[144].x, _288);
    float _296 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[144].y, _290);
    float _298 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[144].z, _292);
    bool _300 = !_258;
    float _318;
    if (!_300)
    {
        float _302 = in.m_55.x;
        float _304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _306 = _302 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _310 = _308 * _304;
        float _312 = floor(_310);
        float _314 = -_312;
        float _316 = _310 + _314;
        _318 = _316;
        _320 = true;
    }
    else
    {
        _318 = _170;
    }
    _320 = false;
    float _322 = _318;
    float _324 = in.m_57.x;
    float _326 = in.m_57.y;
    float _328 = in.m_57.z;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _332 = _322 + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _334;
    bool _338 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _340 = isnan(_322);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    bool _350 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _352 = 1.0 / _336;
    float _354 = _298 * _328;
    bool _356 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _358 = isnan(_322);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _332 * _352;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _370;
    float _374 = _296 * _326;
    float _376 = -_366;
    float _378 = _376 + 1.0;
    float _380 = _294 * _324;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _386;
    float _390 = _348 * _378;
    float _392 = fma(_372, _368, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _394 = fma(_384, _368, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _396 = fma(_388, _368, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _398 = -_348;
    float _400 = _398 + 1.0;
    float _402 = _392 * _390;
    float _404 = _394 * _390;
    float _406 = _396 * _390;
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _402);
    float _410 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _404);
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _406);
    float _414 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[108].y, _408);
    float _416 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[108].x, _410);
    float _418 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[108].z, _412);
    bool _420 = !_350;
    float _438;
    if (!_420)
    {
        float _422 = in.m_55.x;
        float _424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _426 = _422 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _428 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _430 = _428 * _424;
        float _432 = floor(_430);
        float _434 = -_432;
        float _436 = _430 + _434;
        _438 = _436;
        _440 = true;
    }
    else
    {
        _438 = _170;
    }
    _440 = false;
    float _442 = _438;
    float _444 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _446 = int(_444);
    float _448 = in.m_55.x;
    float _450 = in.m_55.y;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _454 = int(_452);
    float _456 = float(_446);
    float _458 = 1.0 / _456;
    float _460 = float(uint(_454));
    float _462 = _450 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _464 = ~_454;
    int _466 = _464 + 1;
    int _468 = ~_454;
    int _470 = _468 + 1;
    float _472 = 1.0 / _460;
    int _474 = ~_454;
    int _476 = _474 + 1;
    float _478 = _458 * _134;
    float _480 = trunc(_478);
    int _482 = int(_480);
    int _484 = as_type<int>(_472) + (-2);
    float _486 = float(uint(_482));
    float _488 = float(_482);
    float _490 = as_type<float>(_484) * _486;
    float _492 = trunc(_490);
    float _494 = precise::max(_492, 0.0);
    uint _497 = uint(_494);
    int _499 = _466 * int(_497);
    int _501 = _499 + _482;
    float _503 = float(uint(_501));
    float _505 = as_type<float>(_484) * _503;
    float _507 = trunc(_505);
    float _509 = precise::max(_507, 0.0);
    uint _511 = uint(_509);
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _515 = _513 != 0;
    bool _517 = !_515;
    float _519 = _517 ? 7.345489978790283203125 : 1.0;
    float _521 = _519 * _448;
    float _523 = floor(_521);
    int _525 = int(_497) + int(_511);
    float _527 = float(_454);
    int _529 = _470 * _525;
    int _531 = _529 + _482;
    bool _533 = _488 >= _527;
    bool _535 = isnan(_488);
    bool _537 = _533 || _535;
    bool _539 = isnan(_527);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    bool _545 = uint(_531) >= uint(_454);
    float _547 = trunc(_543);
    int _549 = int(_547);
    bool _551 = !_545;
    int _553 = _551 ? 0 : (-1);
    float _555 = -_523;
    float _557 = _521 + _555;
    bool _559 = _454 == 0;
    int _561 = ~_525;
    int _563 = _561 + _553;
    int _565 = _563 + 1;
    int _567 = _454 * _565;
    int _569 = _567 + _482;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _573 = _571 != 0;
    int _575 = ~_549;
    int _577 = _575 + 1;
    int _579 = _577 + 1;
    bool _581 = !_559;
    int _583 = _581 ? _569 : (-1);
    float _585 = _557 * _527;
    float _587 = _527 * _134;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _591 = _589 != 0;
    int _593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _595 = _593 != 0;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _599 = _597 != 0;
    int _601 = _583 * _579;
    float _603 = _587 * _166;
    int _605 = _454 + (-1);
    float _607 = trunc(_585);
    int _609 = int(_607);
    bool _611 = !_595;
    int _613 = _611 ? 0 : 1;
    bool _615 = !_591;
    int _617 = _615 ? 0 : 1;
    int _619 = _549 * _605;
    int _621 = _619 + _601;
    bool _623 = !_573;
    int _625 = _623 ? 0 : 1;
    int _627 = abs(_613);
    float _629 = trunc(_603);
    int _631 = int(_629);
    int _633 = abs(_625);
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _637 = _635 != 0;
    int _639 = _621 * _627;
    bool _641 = !_599;
    int _643 = _641 ? 0 : 1;
    int _645 = abs(_617);
    bool _647 = !_637;
    int _649 = _647 ? 0 : 1;
    int _651 = abs(_643);
    int _653 = _609 * _633;
    int _655 = _653 + _482;
    int _657 = abs(_649);
    int _659 = _631 * _645;
    int _661 = _659 + _639;
    int _663 = ~_454;
    int _665 = _663 + 1;
    int _667 = _655 * _651;
    int _669 = _667 + _661;
    int _671 = ~_454;
    int _673 = _671 + 1;
    float _675 = float(uint(_655));
    int _677 = _609 * _657;
    int _679 = _677 + _669;
    float _681 = as_type<float>(_484) * _675;
    float _683 = float(uint(_679));
    float _685 = as_type<float>(_484) * _683;
    float _687 = trunc(_681);
    float _689 = precise::max(_687, 0.0);
    uint _691 = uint(_689);
    float _693 = trunc(_685);
    float _695 = precise::max(_693, 0.0);
    uint _697 = uint(_695);
    int _699 = _673 * int(_697);
    int _701 = _699 + _679;
    float _703 = float(uint(_701));
    float _705 = as_type<float>(_484) * _703;
    float _707 = trunc(_705);
    float _709 = precise::max(_707, 0.0);
    uint _711 = uint(_709);
    int _713 = int(_697) + int(_711);
    int _715 = ~_454;
    int _717 = _715 + 1;
    int _719 = _665 * _713;
    int _721 = _719 + _679;
    bool _723 = uint(_721) >= uint(_454);
    bool _725 = !_723;
    int _727 = _725 ? 0 : (-1);
    int _729 = ~_713;
    int _731 = _729 + _727;
    int _733 = _731 + 1;
    int _735 = _454 * _733;
    int _737 = _735 + _679;
    bool _739 = !_559;
    int _741 = _739 ? _737 : (-1);
    int _743 = _717 * int(_691);
    int _745 = _743 + _655;
    int _747 = _741 >> 31;
    float _749 = float(uint(_745));
    int _751 = _747 & 3;
    int _753 = _741 & 3;
    bool _755 = _753 != 0;
    float _757 = as_type<float>(_484) * _749;
    int _759 = _741 + _751;
    int _761 = _759 >> 2;
    float _763 = trunc(_757);
    float _765 = precise::max(_763, 0.0);
    uint _767 = uint(_765);
    int _769 = _761 << 4;
    int _771 = _769 + 368;
    int _773 = _741 & 3;
    bool _775 = _773 != 0;
    uint _777 = uint(int(uint(_771) >> uint(2)));
    uint _779 = uint(int(uint(int(_777)) >> uint(2)));
    int _781 = int(_777) & 3;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[int(_779)][_781];
    int _785 = int(_777) + 1;
    uint _787 = uint(int(uint(_785) >> uint(2)));
    int _789 = _785 & 3;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[int(_787)][_789];
    int _793 = _755 ? 0 : 1;
    bool _795 = uint(_773) > 1u;
    bool _797 = _773 != 3;
    bool _799 = uint(_773) >= 2u;
    int _801 = _771 + 8;
    uint _803 = uint(int(uint(_801) >> uint(2)));
    uint _805 = uint(int(uint(int(_803)) >> uint(2)));
    int _807 = int(_803) & 3;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[int(_805)][_807];
    int _811 = int(_803) + 1;
    uint _813 = uint(int(uint(_811) >> uint(2)));
    int _815 = _811 & 3;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[int(_813)][_815];
    int _819 = int(_691) + int(_767);
    int _821 = _799 ? 0 : 1;
    int _823 = ~_793;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    int _829 = _476 * _819;
    int _831 = _829 + _655;
    int _833 = _827;
    if (!_795)
    {
        int _835 = ~_793;
        int _837 = _835 + 1;
        _833 = _837;
    }
    int _839 = _833;
    bool _841 = _773 != 3;
    bool _843 = uint(_831) >= uint(_454);
    float _845 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _847 = int(_845);
    bool _849 = !_775;
    int _851 = _849 ? 0 : 1;
    bool _853 = !_843;
    int _855 = _853 ? 0 : (-1);
    int _857 = abs(_839);
    int _859 = ~_819;
    int _861 = _859 + _855;
    int _863 = _861 + 1;
    int _865 = ~_821;
    int _867 = _865 + 1;
    int _869 = _867 + 1;
    int _871 = _869;
    if (_797)
    {
        int _873 = ~_821;
        int _875 = _873 + 1;
        _871 = _875;
    }
    int _877 = _871;
    int _879 = _454 * _863;
    int _881 = _879 + _655;
    bool _883 = !_841;
    int _885 = _883 ? 0 : (-1);
    int _887 = abs(_851);
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _891 = _889 != 0;
    int _893 = abs(_877);
    int _895 = ~_857;
    int _897 = _895 + 1;
    int _899 = _897 + 1;
    int _901 = abs(_885);
    bool _903 = !_891;
    int _905 = _903 ? 0 : 1;
    int _907 = ~_887;
    int _909 = _907 + 1;
    int _911 = _909 + 1;
    int _913 = _899 * as_type<int>(_791);
    int _915 = abs(_905);
    int _917 = _911 * as_type<int>(_783);
    int _919 = _917 + _913;
    int _921 = ~_893;
    int _923 = _921 + 1;
    int _925 = _923 + 1;
    float _927 = in.m_59.z;
    int _929 = abs(_847);
    int _931 = ~_901;
    int _933 = _931 + 1;
    int _935 = _933 + 1;
    int _937 = _925 * as_type<int>(_809);
    int _939 = _937 + _919;
    float _941 = in.m_59.x;
    int _943 = _935 * as_type<int>(_817);
    int _945 = _943 + _939;
    float _947 = float(uint(_929));
    float _949 = float(uint(_847));
    int _951 = ~_915;
    int _953 = _951 + 1;
    int _955 = _953 + 1;
    float _957 = 1.0 / _947;
    bool _959 = !_559;
    int _961 = _959 ? _881 : (-1);
    int _963 = _945 * _955;
    float _965 = in.m_59.y;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _969 = _967 != 0;
    int _971 = _961 * _915;
    int _973 = _971 + _963;
    float _975 = 1.0 / _949;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _979 = _977 != 0;
    out.m_61.z = _927;
    int _981 = ~_929;
    int _983 = _981 + 1;
    int _985 = abs(_973);
    float _987 = float(uint(_973));
    out.m_61.x = _941;
    int _989 = as_type<int>(_957) + (-2);
    float _991 = _448 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _993 = float(uint(_985));
    float _995 = 0.0;
    if (_969)
    {
        float _997 = in.m_55.x;
        _995 = _997;
    }
    float _999 = _995;
    float _1001 = as_type<float>(_989) * _993;
    int _1003 = as_type<int>(_975) + (-2);
    float _1005 = in.m_63.y;
    int _1007 = ~_847;
    int _1009 = _1007 + 1;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1013 = _1011 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1019 = as_type<float>(_1003) * _987;
    float _1021 = trunc(_1001);
    float _1023 = precise::max(_1021, 0.0);
    uint _1025 = uint(_1023);
    out.m_61.y = _965;
    bool _1027 = _450 > 0.5;
    float _1029 = in.m_46.x;
    float _1031 = in.m_46.y;
    float _1033 = in.m_46.z;
    float _1035 = trunc(_1019);
    float _1037 = precise::max(_1035, 0.0);
    uint _1039 = uint(_1037);
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1045 = -_1041;
    float _1047 = fma(_991, 2.0, _1045);
    bool _1049 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1051 = isnan(_442);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1057 = _1053 || _1055;
    float _1059 = float(_1057);
    int _1061 = _983 * int(_1025);
    int _1063 = _1061 + _985;
    float _1065 = 1.0 / _1017;
    float _1067 = -_1005;
    float _1069 = _1067 + 1.0;
    float _1071 = float(uint(_1063));
    int _1073 = _1009 * int(_1039);
    int _1075 = _1073 + _973;
    float _1077 = 1.0 / _1013;
    float _1079 = as_type<float>(_989) * _1071;
    float _1081 = _1005;
    if (_979)
    {
        float _1083 = _1027 ? _1069 : _1005;
        _1081 = _1083;
    }
    float _1085 = _1081;
    float _1087 = fma(_462, -2.0, _1043);
    float _1089 = float(uint(_1075));
    float _1091 = in.m_63.x;
    float _1093 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1095 = trunc(_1079);
    float _1097 = precise::max(_1095, 0.0);
    uint _1099 = uint(_1097);
    float _1101 = as_type<float>(_1003) * _1089;
    float _1103 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1105 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1107;
    float _1111 = fma(_1029, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1093);
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1117 = fma(_1029, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1103);
    float _1119 = trunc(_1101);
    float _1121 = precise::max(_1119, 0.0);
    uint _1123 = uint(_1121);
    float _1125 = fma(_1029, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1105);
    float _1127 = _1109 * _1065;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1131 = _442 + _1129;
    float _1133 = fma(_1033, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1111);
    float _1135 = _1115 * _1077;
    int _1137 = ~_929;
    int _1139 = _1137 + 1;
    float _1141 = fma(_1033, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1117);
    int _1143 = int(_1025) + int(_1099);
    float _1145 = fma(_1127, _1131, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1147 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1149 = isnan(_442);
    bool _1151 = _1147 || _1149;
    bool _1153 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1155 = _1151 || _1153;
    float _1157 = float(_1155);
    float _1159 = fma(_1033, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1125);
    int _1161 = ~_847;
    int _1163 = _1161 + 1;
    int _1165 = _1139 * _1143;
    int _1167 = _1165 + _985;
    bool _1169 = _999 > 0.5;
    bool _1171 = _1169 && _969;
    float _1173 = -_1157;
    float _1175 = _1173 + 1.0;
    int _1177 = int(_1039) + int(_1123);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1181 = _442 + _1179;
    bool _1183 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1185 = isnan(_442);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1191 = _1187 || _1189;
    float _1193 = float(_1191);
    float _1195 = as_type<float>(_1099);
    float _1197 = _1193;
    if (_969)
    {
        _1195 = _1091;
    }
    float _1199 = _1195;
    int _1201 = _1163 * _1177;
    int _1203 = _1201 + _973;
    bool _1205 = uint(_1167) >= uint(_929);
    float _1207 = _1193 * _1175;
    float _1209 = -_1193;
    float _1211 = _1209 + 1.0;
    float _1213 = fma(_1135, _1181, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1215 = uint(_1203) >= uint(_847);
    float _1217 = _1199;
    if (_1171)
    {
        float _1219 = -_1199;
        float _1221 = _1219 + 1.0;
        _1217 = _1221;
    }
    float _1223 = _1217;
    float _1225 = _1059 * _1211;
    float _1227 = _1141 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1229 = !_1215;
    int _1231 = _1229 ? 0 : (-1);
    float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1235 = _1145 * _1225;
    bool _1237 = !_1205;
    int _1239 = _1237 ? 0 : (-1);
    float _1241 = -_1059;
    float _1243 = _1241 + 1.0;
    if (!_969)
    {
        _1197 = _1091;
    }
    float _1245 = _1197;
    float _1247 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1249 = _1227 + _1247;
    float _1251 = _1245;
    if (_969)
    {
        _1251 = _1223;
    }
    float _1253 = _1251;
    float _1255 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1235);
    int _1257 = ~_1177;
    int _1259 = _1257 + _1231;
    int _1261 = _1259 + 1;
    float _1263 = _1133 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1265 = ~_1239;
    int _1267 = _1143 + _1265;
    int _1269 = _1267 + 1;
    float _1271 = _1159 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1273 = _973 ^ _847;
    float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1277 = _1263 + _1275;
    float _1279 = _1249 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1283 = _1271 + _1281;
    uint _1285 = uint(int(uint(_1273) >> uint(31)));
    float _1287 = fma(_1213, _1207, _1255);
    float _1289 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1279);
    bool _1291 = _847 == 0;
    int _1293 = ~int(_1285);
    int _1295 = _1293 + 1;
    float _1297 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1289);
    bool _1299 = _847 == 0;
    int _1301 = _847 * _1261;
    int _1303 = _1301 + _973;
    int _1305 = _1269 ^ _1295;
    float _1307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1309 = _1297 >= 0.0;
    int _1311 = ~_1295;
    int _1313 = _1311 + _1305;
    int _1315 = _1313 + 1;
    bool _1317 = !_1291;
    int _1319 = _1317 ? _1303 : (-1);
    float _1321 = in.m_59.w;
    float _1323 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1325 = float(_1319);
    float _1327 = -_134;
    float _1329 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1047);
    float _1331 = fma(_1323, _1253, -0.5);
    bool _1333 = !_1299;
    int _1335 = _1333 ? _1315 : (-1);
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1339 = fma(_1323, _1325, _1329);
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1343 = float(_1335);
    float _1345 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1347 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1087);
    float _1349 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1337);
    float _1351 = _1249 * _1249;
    float _1353 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1341);
    float _1355 = fma(_1345, _1085, -0.5);
    float _1357 = -_1347;
    float _1359 = fma(_1345, _1343, _1357);
    float _1361 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1349);
    float _1363 = _1345;
    int _1365 = as_type<int>(_1361);
    if (_1309)
    {
        _1363 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1367 = _1363;
    float _1369 = fma(_1277, _1277, _1351);
    float _1371 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1353);
    float _1373 = fma(_1361, _1331, _1339);
    out.m_61.w = _1321;
    if (_1309)
    {
        float _1375 = _1367 * 5.0;
        _1365 = as_type<int>(_1375);
    }
    int _1377 = _1365;
    float _1379 = fma(_1283, _1283, _1369);
    float _1381 = fma(_1371, _1355, _1359);
    float _1383 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1287);
    float _1385 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1387 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1389 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1391 = rsqrt(_1379);
    if (_1309)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5779 = as_type<float>(_1377);
        out.gl_Position.z = _5779;
    }
    float _1393 = _1373 + 0.5;
    float _1395 = _1381 + 0.5;
    float _1397 = _1383 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1401 = _1399 != 0;
    int _1403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1405 = _1403 != 0;
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1409 = _1407 != 0;
    if (_1309)
    {
        out.m_49.x = 0.0;
    }
    out.m_65.x = _1393;
    out.m_65.y = _1395;
    float _1411 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1417 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1421 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1423 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1425 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1427 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1429 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1431 = !_1405;
    int _1433 = _1431 ? 0 : 1;
    float _1435 = _1249 * _1391;
    out.m_67.x = _1421;
    out.m_67.y = _1423;
    out.m_67.z = _1425;
    out.m_67.w = _1419;
    bool _1437 = !_1409;
    int _1439 = _1437 ? 0 : 1;
    float _1441 = _1277 * _1391;
    bool _1443 = !_1401;
    int _1445 = _1443 ? 0 : 1;
    out.m_69.x = _1417;
    out.m_69.y = _1427;
    out.m_69.z = _1429;
    out.m_69.w = _1397;
    if (_1309)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1447 = -_1435;
    float _1449 = fma(_1447, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1227);
    float _1451 = -_1441;
    float _1453 = fma(_1451, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1263);
    float _1455 = _1283 * _1391;
    float _1457 = in.m_55.z;
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1461 = _1449 + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1465 = _1453 + _1463;
    float _1467 = -_1455;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1271);
    float _1471 = _448 * 2.0;
    float _1473 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1475 = _450 * 2.0;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1479 = _1469 + _1477;
    float _1481 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1473);
    float _1483 = floor(_1471);
    bool _1485 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1487 = isnan(0.0);
    bool _1489 = _1485 || _1487;
    bool _1491 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1493 = _1489 || _1491;
    float _1495 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1481);
    float _1497 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1499 = log2(_1497);
    bool _1501 = _1495 >= 0.0;
    float _1503 = _450 + _448;
    float _1505 = _1503 + (-1.0);
    float _1507 = _450 + _1457;
    float _1509 = floor(_1475);
    bool _1511 = _1483 > 0.0;
    float _1513 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1515 = _1507 + (-1.0);
    bool _1517 = _1483 >= 0.0;
    bool _1519 = isnan(_1483);
    bool _1521 = _1517 || _1519;
    bool _1523 = isnan(0.0);
    bool _1525 = _1521 || _1523;
    float _1527 = _1457 * 2.0;
    float _1529 = 0.0;
    int _1531 = as_type<int>(_1475);
    float _1533 = _1455;
    float _1535 = _1479;
    if (_1501)
    {
        _1529 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1537 = _1529;
    float _1539 = _1499 * _134;
    float _1541 = fma(_1515, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_1501)
    {
        out.m_49.x = 0.0;
    }
    if (_1501)
    {
        float _1543 = _1537 * 5.0;
        _1531 = as_type<int>(_1543);
    }
    int _1545 = _1531;
    float _1547 = floor(_1527);
    bool _1549 = _1509 > 0.0;
    if (_1501)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6064 = as_type<float>(_1545);
        out.gl_Position.z = _6064;
    }
    bool _1551 = _1509 >= 0.0;
    bool _1553 = isnan(_1509);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan(0.0);
    bool _1559 = _1555 || _1557;
    float _1561 = exp2(_1539);
    bool _1563 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1565 = isnan(1.0);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1571 = _1567 || _1569;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1575 = 1.0 + _1573;
    if (_1501)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1577 = -_1227;
    float _1579 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1581 = -_1263;
    float _1583 = _1581 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1585 = -_1271;
    float _1587 = _1585 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1589 = 1.0 / _1575;
    float _1591 = _1579 * _1579;
    float _1593 = -_1561;
    float _1595 = _1593 + 1.0;
    int _1597 = _1525 ? 0 : 1;
    float _1599 = _450 + (-0.5);
    float _1601 = fma(_1583, _1583, _1591);
    bool _1603 = _1547 > 0.0;
    float _1605 = -_1435;
    float _1607 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1249);
    float _1609 = _1493 ? _1595 : 0.0;
    float _1611 = fma(_1587, _1587, _1601);
    bool _1613 = _1547 >= 0.0;
    bool _1615 = isnan(_1547);
    bool _1617 = _1613 || _1615;
    bool _1619 = isnan(0.0);
    bool _1621 = _1617 || _1619;
    float _1623 = -_1441;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1277);
    int _1627 = ~_1597;
    int _1629 = _1627 + 1;
    int _1631 = _1629 + 1;
    float _1633 = rsqrt(_1611);
    int _1635 = _1631;
    if (!_1511)
    {
        int _1637 = ~_1597;
        int _1639 = _1637 + 1;
        _1635 = _1639;
    }
    int _1641 = _1635;
    float _1643 = _1607 * _1607;
    int _1645 = abs(_1433);
    if (_1571)
    {
        float _1647 = _1609 * _1589;
        _152 = _1647;
    }
    float _1649 = _152;
    int _1651 = abs(_1445);
    float _1653 = fma(_1625, _1625, _1643);
    int _1655 = _1621 ? 0 : 1;
    float _1657 = sqrt(_1611);
    int _1659 = abs(_1439);
    float _1661 = float(_1641);
    int _1663 = ~_1655;
    int _1665 = _1663 + 1;
    int _1667 = _1665 + 1;
    int _1669 = _1667;
    if (!_1603)
    {
        int _1671 = ~_1655;
        int _1673 = _1671 + 1;
        _1669 = _1673;
    }
    int _1675 = _1669;
    float _1677 = _1583 * _1633;
    float _1679 = _1587 * _1633;
    int _1681 = _1559 ? 0 : 1;
    float _1683 = _1677 * _1677;
    float _1685 = float(_1645);
    float _1687 = float(_1651);
    float _1689 = fma(_1679, _1679, _1683);
    float _1691 = float(_1675);
    float _1693 = _1685 * _1661;
    float _1695 = rsqrt(_1689);
    int _1697 = ~_1681;
    int _1699 = _1697 + 1;
    int _1701 = _1699 + 1;
    float _1703 = _1687 * _1691;
    int _1705 = _1701;
    if (!_1549)
    {
        int _1707 = ~_1681;
        int _1709 = _1707 + 1;
        _1705 = _1709;
    }
    int _1711 = _1705;
    float _1713 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1715 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1717 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1719 = float(_1711);
    float _1721 = float(_1659);
    float _1723 = -_1717;
    float _1725 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1723);
    float _1727 = -_1713;
    float _1729 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1727);
    float _1731 = _1721 * _1719;
    float _1733 = -_1715;
    float _1735 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1733);
    float _1737 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1739 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1741 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1743 = _1679 * _1695;
    float _1745 = _1579 * _1633;
    float _1747 = in.m_71.x;
    float _1749 = in.m_71.y;
    float _1751 = in.m_71.z;
    float _1753 = -_1739;
    float _1755 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1753);
    float _1757 = _1735 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1759 = -_1741;
    float _1761 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1759);
    float _1763 = _1677 * _1695;
    float _1765 = -_1743;
    float _1767 = _1679 * _1765;
    float _1769 = -_1757;
    float _1771 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1769);
    float _1773 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1761);
    float _1775 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1777 = -_1767;
    float _1779 = fma(_1677, _1763, _1777);
    float _1781 = -_1737;
    float _1783 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1781);
    float _1785 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1787 = _1745 * _1763;
    float _1789 = _1779 * _1779;
    float _1791 = -_1775;
    float _1793 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1791);
    float _1795 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1797 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1771);
    float _1799 = fma(_1787, _1787, _1789);
    float _1801 = -_1743;
    float _1803 = _1745 * _1801;
    float _1805 = -_1795;
    float _1807 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1805);
    float _1809 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1811 = -_1785;
    float _1813 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1811);
    float _1815 = _1703 * (-2.0);
    float _1817 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1807);
    float _1819 = -_1809;
    float _1821 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1819);
    float _1823 = fma(_1803, _1803, _1799);
    float _1825 = fma(_1513, _1815, _1513);
    float _1827 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1813);
    float _1829 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1821);
    float _1831 = fma(_1815, _1747, _1747);
    float _1833 = _1693 * (-2.0);
    float _1835 = _448 + (-0.5);
    float _1837 = rsqrt(_1823);
    float _1839 = -_1829;
    float _1841 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1827);
    float _1843 = fma(_1833, _1749, _1749);
    float _1845 = fma(_1835, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1831);
    float _1847 = fma(_1541, _1833, _1541);
    float _1849 = _1731 * (-2.0);
    float _1851 = fma(_1599, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1843);
    float _1853 = fma(_1825, _1649, _1845);
    float _1855 = 1.0 / _1841;
    float _1857 = _1735 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1859 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1861 = fma(_1847, _1649, _1851);
    float _1863 = fma(_1849, _1751, _1751);
    float _1865 = -_1857;
    float _1867 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1865);
    float _1869 = -_1859;
    float _1871 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1869);
    float _1873 = _1853 * 0.15915493667125701904296875;
    float _1875 = _1779 * _1837;
    float _1877 = precise::clamp(_1875, 0.0, 1.0);
    float _1879 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1881 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1871);
    float _1883 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1867);
    float _1885 = -_1877;
    float _1887 = _1885 + 1.0;
    float _1889 = -_1879;
    float _1891 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1889);
    float _1893 = _1861 * 0.15915493667125701904296875;
    float _1895 = _1457 + _448;
    float _1897 = fma(_1881, _1855, -1.0);
    float _1899 = _1887 * _1855;
    float _1901 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1891);
    float _1903 = fma(_1887, _1897, 1.0);
    float _1905 = _1883 * _1899;
    float _1907 = _1901 * _1899;
    float _1909 = _1895 + (-1.0);
    float _1911 = _1903 * _1903;
    float _1913 = _1457 + (-0.5);
    float _1915 = _1893 * 6.283185482025146484375;
    float _1917 = sin(_1915);
    float _1919 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1921 = fma(_1905, _1905, _1911);
    float _1923 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1863);
    float _1925 = fma(_1919, _1849, _1919);
    float _1927 = fma(_1907, _1907, _1921);
    float _1929 = _1893 * 6.283185482025146484375;
    float _1931 = cos(_1929);
    float _1933 = fma(_1925, _1649, _1923);
    float _1935 = abs(_1657);
    float _1937 = precise::max(0.0, _1935);
    float _1939 = _1933 * 0.15915493667125701904296875;
    float _1941 = rsqrt(_1927);
    float _1943 = precise::min(_1937, 40.0);
    float _1945 = _1873 * 6.283185482025146484375;
    float _1947 = sin(_1945);
    float _1949 = _1907 * _1941;
    float _1951 = _1905 * _1941;
    float _1953 = _1903 * _1941;
    float _1955 = -_1455;
    float _1957 = fma(_1955, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
    float _1959 = -_1949;
    float _1961 = _1677 * _1959;
    float _1963 = _1873 * 6.283185482025146484375;
    float _1965 = cos(_1963);
    float _1967 = _1679 * _1953;
    float _1969 = fma(_1957, _1957, _1653);
    float _1971 = -_1951;
    float _1973 = -_1961;
    float _1975 = fma(_1679, _1971, _1973);
    float _1977 = -_1951;
    float _1979 = _1745 * _1977;
    float _1981 = -_1949;
    float _1983 = -_1967;
    float _1985 = fma(_1745, _1981, _1983);
    float _1987 = _1947 * _1917;
    float _1989 = _1975 * _1975;
    float _1991 = -_1979;
    float _1993 = fma(_1677, _1953, _1991);
    float _1995 = _1939 * 6.283185482025146484375;
    float _1997 = cos(_1995);
    float _1999 = _1947 * _1931;
    float _2001 = fma(_1985, _1985, _1989);
    float _2003 = fma(_1993, _1993, _2001);
    float _2005 = _1965 * _1931;
    float _2007 = sqrt(_1969);
    float _2009 = _1965 * _1917;
    float _2011 = rsqrt(_2003);
    float _2013 = _1947 * _1997;
    float _2015 = _1931 * _1997;
    float _2017 = _1965 * _1997;
    float _2019 = _1917 * _1997;
    float _2021 = _380 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2023 = _1939 * 6.283185482025146484375;
    float _2025 = sin(_2023);
    float _2027 = _1391 * _2007;
    float _2029 = _1985 * _2011;
    float _2031 = _1993 * _2011;
    float _2033 = in.m_73.x;
    float _2035 = in.m_73.y;
    float _2037 = in.m_73.z;
    float _2039 = _1679 * _2029;
    float _2041 = fma(_2025, _2005, _1987);
    float _2043 = fma(_2025, _1987, _2005);
    float _2045 = _1975 * _2011;
    float _2047 = _1745 * _2031;
    float _2049 = -_2039;
    float _2051 = fma(_1677, _2031, _2049);
    float _2053 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2055 = _1677 * _2045;
    float _2057 = -_2047;
    float _2059 = fma(_1679, _2045, _2057);
    float _2061 = _2051 * _2051;
    float _2063 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _2053);
    float _2065 = -_2055;
    float _2067 = fma(_1745, _2029, _2065);
    float _2069 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2071 = fma(_2059, _2059, _2061);
    float _2073 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2075 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _2063);
    float _2077 = -_2009;
    float _2079 = fma(_2025, _1999, _2077);
    float _2081 = fma(_2067, _2067, _2071);
    float _2083 = -_1999;
    float _2085 = fma(_2025, _2009, _2083);
    float _2087 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2073);
    float _2089 = _2021 * _2027;
    float _2091 = rsqrt(_2081);
    float _2093 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2033);
    float _2095 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2087);
    float _2097 = _2069 * _2027;
    float _2099 = _2075 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2101 = _2093 * _2089;
    float _2103 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2035);
    float _2105 = _2095 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2107 = _2103 * _2097;
    float _2109 = -_2105;
    float _2111 = _2099 + _2109;
    bool _2113 = _2105 >= _2099;
    bool _2115 = isnan(_2105);
    bool _2117 = _2113 || _2115;
    bool _2119 = isnan(_2099);
    bool _2121 = _2117 || _2119;
    float _2123 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2125 = _354 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2127 = _2067 * _2091;
    float _2129 = abs(_2111);
    float _2131 = precise::max(_2129, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _2133 = _2059 * _2091;
    float _2135 = _2051 * _2091;
    float _2137 = _1677 * _2127;
    float _2139 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _2139;
    float _2143 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2123);
    float _2145 = precise::min(_2131, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _2147 = _1679 * _2135;
    float _2149 = -_2137;
    float _2151 = fma(_1679, _2133, _2149);
    float _2153 = 1.0 / _2141;
    float _2155 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2143);
    float _2157 = -_2147;
    float _2159 = fma(_1745, _2127, _2157);
    float _2161 = _2151 * _2151;
    float _2163 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2165 = _2145 + _2163;
    bool _2167 = !_2121;
    float _2169 = _2167 ? 1.0 : (-1.0);
    float _2171 = rsqrt(_2155);
    float _2173 = _1745 * _2133;
    float _2175 = -_2173;
    float _2177 = fma(_1677, _2135, _2175);
    float _2179 = fma(_2159, _2159, _2161);
    float _2181 = _2017 * _2107;
    float _2183 = _2165 * _2153;
    float _2185 = _2125 * _2027;
    float _2187 = fma(_2177, _2177, _2179);
    float _2189 = -_2107;
    float _2191 = _2025 * _2189;
    float _2193 = _2013 * _2107;
    float _2195 = fma(_2041, _2101, _2181);
    float _2197 = _2169 * _2183;
    float _2199 = rsqrt(_2187);
    float _2201 = fma(_2079, _2101, _2193);
    float _2203 = _2185 * _2037;
    float _2205 = fma(_2015, _2101, _2191);
    float _2207 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2209 = fma(_1943, -0.02500000037252902984619140625, 1.0);
    float _2211 = fma(_2085, _2203, _2195);
    float _2213 = fma(_2019, _2203, _2205);
    float _2215 = fma(_2043, _2203, _2201);
    float _2217 = _2207 * _2197;
    float _2219 = _2171 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2221 = _2127 * _2211;
    float _2223 = _2219 * _2219;
    float _2225 = _2159 * _2199;
    float _2227 = _2151 * _2199;
    float _2229 = _2177 * _2199;
    float _2231 = _2135 * _2211;
    float _2233 = _2171 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2235 = _2171 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2237 = _2133 * _2211;
    float _2239 = fma(_2227, _2213, _2231);
    float _2241 = fma(_2233, _2233, _2223);
    float _2243 = fma(_2229, _2213, _2221);
    float _2245 = fma(_2225, _2213, _2237);
    float _2247 = fma(_1745, _2215, _2239);
    float _2249 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2251 = fma(_1679, _2215, _2243);
    float _2253 = fma(_1677, _2215, _2245);
    float _2255 = _1227 + _2247;
    float _2257 = _2217 * 0.15915493667125701904296875;
    float _2259 = fma(_2235, _2235, _2241);
    float _2261 = _1263 + _2253;
    float _2263 = _2255 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2265 = _2255 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2267 = _2255 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2269 = _1271 + _2251;
    float _2271 = fma(_2261, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2263);
    float _2273 = fma(_2261, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2265);
    float _2275 = fma(_2261, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2267);
    float _2277 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2249);
    float _2279 = rsqrt(_2259);
    float _2281 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2273);
    float _2283 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2275);
    float _2285 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2271);
    float _2287 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2277);
    float _2289 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2291 = _2283 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2293 = _2285 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2295 = _2257 * 6.283185482025146484375;
    float _2297 = cos(_2295);
    float _2299 = _2287 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2301 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2303 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2305 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2307 = -_2289;
    float _2309 = _2307 + _2299;
    float _2311 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2301);
    float _2313 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2303);
    float _2315 = _2257 * 6.283185482025146484375;
    float _2317 = sin(_2315);
    float _2319 = fma(_2209, _2309, _2289);
    float _2321 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2305);
    float _2323 = _2233 * _2279;
    float _2325 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2311);
    float _2327 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2313);
    float _2329 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2321);
    float _2331 = -_2297;
    float _2333 = _2331 + 1.0;
    float _2335 = _2219 * _2279;
    float _2337 = _2235 * _2279;
    float _2339 = _2325 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2341 = _2323 * _2333;
    float _2343 = _2335 * _2333;
    float _2345 = _2337 * _2337;
    float _2347 = _2327 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2349 = _2323 * _2317;
    float _2351 = _2335 * _2317;
    float _2353 = fma(_2333, _2345, _2297);
    float _2355 = _2337 * _2317;
    float _2357 = fma(_2337, _2343, _2349);
    float _2359 = -_1227;
    float _2361 = _2359 + _2339;
    float _2363 = -_2351;
    float _2365 = fma(_2337, _2341, _2363);
    float _2367 = -_2355;
    float _2369 = fma(_2335, _2341, _2367);
    float _2371 = -_1263;
    float _2373 = _2371 + _2347;
    float _2375 = _2357 * _2361;
    float _2377 = _2329 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2379 = fma(_2323, _2341, _2297);
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2383 = _2381 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2385 = _2369 * _2361;
    float _2387 = fma(_2365, _2373, _2375);
    float _2389 = -_1271;
    float _2391 = _2389 + _2377;
    float _2393 = fma(_170, _2383, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2395 = fma(_2379, _2373, _2385);
    float _2397 = fma(_2337, _2341, _2351);
    float _2399 = fma(_2353, _2391, _2387);
    float _2401 = fma(_2335, _2343, _2297);
    float _2403 = fma(_2335, _2341, _2355);
    float _2405 = fma(_2397, _2391, _2395);
    float _2407 = fma(_2399, _2393, _1271);
    float _2409 = _2401 * _2361;
    float _2411 = -_2349;
    float _2413 = fma(_2337, _2343, _2411);
    float _2415 = fma(_2405, _2393, _1263);
    float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2419 = _2407 + _2417;
    float _2421 = fma(_2403, _2373, _2409);
    float _2423 = _1449 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2427 = _2415 + _2425;
    float _2429 = _2419 * _2419;
    float _2431 = fma(_2413, _2391, _2421);
    float _2433 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2423);
    float _2435 = fma(_2427, _2427, _2429);
    float _2437 = _1227 + _2431;
    float _2439 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2433);
    float _2441 = sqrt(_2435);
    bool _2443 = _2441 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2445 = _2423;
    float _2447 = _2433;
    float _2449 = _2407;
    if (!_2443)
    {
        _2445 = _2415;
    }
    float _2451 = _2445;
    float _2453 = _2451;
    if (!_2443)
    {
        _2447 = _2437;
    }
    float _2455 = _2447;
    bool _2457 = !_2443;
    float _2459 = _2455;
    if (!_2457)
    {
        float _2461 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2465 = _2441 + _2463;
        float _2467 = _2437 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2469 = rsqrt(_2435);
        float _2471 = _2465 * _2461;
        float _2473 = _2471 * 0.15915493667125701904296875;
        float _2475 = _2473 * 6.283185482025146484375;
        float _2477 = cos(_2475);
        float _2479 = _2473 * 6.283185482025146484375;
        float _2481 = sin(_2479);
        float _2483 = _2477 + (-1.0);
        float _2485 = fma(_2481, _2467, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2487 = _2483 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2489 = _2469 * _2485;
        float _2491 = fma(_2437, _2477, _2487);
        float _2493 = fma(_2427, _2489, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2495 = fma(_2419, _2489, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2459 = _2491;
        _2453 = _2493;
        _2449 = _2495;
    }
    float _2497 = _2459;
    float _2499 = _2453;
    float _2501 = _2449;
    float _2503 = -_1227;
    float _2505 = _2503 + _2497;
    float _2507 = _2439 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2509 = -_1263;
    float _2511 = _2509 + _2499;
    float _2513 = _1449 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2515 = _2505 * _2505;
    float _2517 = -_1271;
    float _2519 = _2517 + _2501;
    float _2521 = 1.0 / _2507;
    float _2523 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2513);
    float _2525 = fma(_2511, _2511, _2515);
    float _2527 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2523);
    float _2529 = fma(_2519, _2519, _2525);
    float _2531 = _2527 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2533 = sqrt(_2529);
    float _2535 = _2531 + _2507;
    float _2537 = _2535 * _2521;
    float _2539 = _2537 * 0.5;
    float _2541 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2543 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2541);
    float _2545 = 1.0 / _2543;
    bool _2547 = _2533 > 0.0;
    bool _2549 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2551 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2553 = _2549 || _2551;
    bool _2555 = isnan(0.5);
    bool _2557 = _2553 || _2555;
    bool _2559 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2561 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2563 = _2559 || _2561;
    bool _2565 = isnan(0.5);
    bool _2567 = _2563 || _2565;
    float _2569 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2571 = _2499;
    float _2573 = _2501;
    float _2575 = _2505;
    if (!_2547)
    {
        _2569 = _2497;
    }
    float _2577 = _2569;
    bool _2579 = !_2547;
    float _2581 = _2577;
    if (!_2579)
    {
        float _2583 = _186 * _186;
        float _2585 = rsqrt(_2529);
        float _2587 = fma(_184, _184, _2583);
        float _2589 = fma(_188, _188, _2587);
        float _2591 = sqrt(_2589);
        float _2593 = _2511 * _2585;
        float _2595 = _2505 * _2585;
        float _2597 = _2519 * _2585;
        bool _2599 = _2591 > 0.0;
        float _2601 = _2591;
        if (!_2599)
        {
            _2601 = _2497;
        }
        float _2603 = _2601;
        bool _2605 = !_2599;
        _2581 = _2603;
        if (!_2605)
        {
            float _2607 = rsqrt(_2589);
            float _2609 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2611 = _186 * _2607;
            float _2613 = _184 * _2607;
            float _2615 = _2595 * _2611;
            float _2617 = _188 * _2607;
            float _2619 = fma(_2593, _2613, _2615);
            float _2621 = _2609 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2623 = fma(_2597, _2617, _2619);
            float _2625 = _2623 * _2621;
            float _2627 = fma(_184, _2625, _2499);
            float _2629 = fma(_186, _2625, _2497);
            float _2631 = fma(_188, _2625, _2501);
            _2581 = _2629;
            _2571 = _2627;
            _2573 = _2631;
            _2575 = _2625;
        }
    }
    float _2633 = _2581;
    float _2635 = _2571;
    float _2637 = _2573;
    float _2639 = _2575;
    float _2641 = -_1435;
    float _2643 = fma(_2641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2633);
    float _2645 = -_1441;
    float _2647 = fma(_2645, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2635);
    float _2649 = -_1455;
    float _2651 = fma(_2649, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2637);
    float _2653 = _2639;
    float _2655 = _2647;
    float _2657 = _2651;
    float _2659 = _2643;
    if (_2557)
    {
        _2653 = 1.0;
    }
    float _2661 = _2653;
    float _2663 = _2661;
    if (_2567)
    {
        _1533 = _2643;
    }
    float _2665 = _1533;
    float _2667 = _2665;
    if (!_2567)
    {
        float _2669 = _1461 * _1461;
        float _2671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2673 = -_1271;
        float _2675 = _2673 + _2637;
        float _2677 = -_1227;
        float _2679 = _2677 + _2633;
        float _2681 = fma(_1465, _1465, _2669);
        float _2683 = -_1263;
        float _2685 = _2683 + _2635;
        float _2687 = fma(_1479, _1479, _2681);
        float _2689 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2691 = sqrt(_2687);
        float _2693 = 1.0 / _2027;
        float _2695 = _2689 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2697 = precise::min(_2691, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2699 = _2697 * _2671;
        float _2701 = _2699 * _2693;
        float _2703 = _2695 * _2701;
        float _2705 = _2675 * _2701;
        float _2707 = fma(_2679, _2703, _1449);
        float _2709 = fma(_2685, _2703, _1453);
        float _2711 = fma(_2695, _2705, _1469);
        _192 = _2701;
        _2667 = _2707;
        _2655 = _2709;
        _2657 = _2711;
        _2659 = _2671;
    }
    float _2713 = _192;
    float _2715 = _2667;
    float _2717 = _2655;
    float _2719 = _2657;
    float _2721 = _2659;
    float _2723 = _2713;
    float _2725 = _2721;
    if (_2557)
    {
        _1535 = 1.0;
    }
    float _2727 = _1535;
    float _2729 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2731 = _2545 * _2729;
    float _2733 = _2727;
    if (!_2557)
    {
        float _2735 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2739 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2737;
        float _2741 = _2735 * 0.15915493667125701904296875;
        float _2743 = _2741 * 6.283185482025146484375;
        float _2745 = cos(_2743);
        float _2747 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2749 = _2747 * 0.15915493667125701904296875;
        float _2751 = _2741 * 6.283185482025146484375;
        float _2753 = sin(_2751);
        float _2755 = 1.0 / _2745;
        float _2757 = _2749 * 6.283185482025146484375;
        float _2759 = cos(_2757);
        float _2761 = _2753 * _2755;
        float _2763 = _2749 * 6.283185482025146484375;
        float _2765 = sin(_2763);
        float _2767 = _2759 * _2761;
        float _2769 = 1.0 / _2739;
        float _2771 = 1.0 / _2767;
        float _2773 = _2765 * _2771;
        float _2775 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2777 = fma(_2731, _2773, _2775);
        float _2779 = _2777 * _2769;
        float _2781 = precise::clamp(_2779, 0.0, 1.0);
        _2723 = _2749;
        _2663 = _2781;
    }
    float _2783 = _2723;
    float _2785 = _2663;
    float _2787 = _2783;
    if (!_2557)
    {
        float _2789 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2791 = _2789 * 0.15915493667125701904296875;
        float _2793 = _2791 * 6.283185482025146484375;
        float _2795 = cos(_2793);
        float _2797 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2799 = _2797 * 0.15915493667125701904296875;
        float _2801 = _2791 * 6.283185482025146484375;
        float _2803 = sin(_2801);
        float _2805 = 1.0 / _2795;
        float _2807 = _2799 * 6.283185482025146484375;
        float _2809 = cos(_2807);
        float _2811 = _2803 * _2805;
        float _2813 = _2799 * 6.283185482025146484375;
        float _2815 = sin(_2813);
        float _2817 = _2809 * _2811;
        float _2819 = 1.0 / _2817;
        float _2821 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2823 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2821;
        float _2825 = 1.0 / _2823;
        float _2827 = _2815 * _2819;
        float _2829 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2831 = fma(_2731, _2827, _2829);
        float _2833 = _2831 * _2825;
        float _2835 = precise::clamp(_2833, 0.0, 1.0);
        float _2837 = -_2835;
        float _2839 = _2837 + 1.0;
        _2787 = _2795;
        _2733 = _2839;
    }
    float _2841 = _2787;
    float _2843 = _2733;
    float _2845 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2847 = _2715 + _2845;
    float _2849 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2851 = _2717 + _2849;
    float _2853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2855 = _2719 + _2853;
    float _2857 = _2847 * _2847;
    float _2859 = fma(_2851, _2851, _2857);
    float _2861 = fma(_2855, _2855, _2859);
    float _2863 = rsqrt(_2861);
    float _2865 = sqrt(_2861);
    float _2867 = _2863 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2869 = _2851 * _2867;
    float _2871 = _2855 * _2867;
    float _2873 = _2869 * _2869;
    float _2875 = _2871 * _2871;
    float _2877 = _2873 + _2875;
    float _2879 = sqrt(_2877);
    bool _2881 = _2879 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2885 = _2879 + _2883;
    float _2887 = _2855;
    float _2889 = _2885;
    float _2891 = _2857;
    if (_2881)
    {
        float _2893 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2887 = _2893;
    }
    float _2895 = _2887;
    if (_2881)
    {
        float _2897 = _2885 * _2895;
        _2889 = _2897;
    }
    float _2899 = _2889;
    if (_2881)
    {
        float _2901 = _2899 * 0.15915493667125701904296875;
        _2891 = _2901;
    }
    float _2903 = _2891;
    float _2905 = _2863;
    float _2907 = _2903;
    if (_2881)
    {
        float _2909 = _2903 * 6.283185482025146484375;
        float _2911 = sin(_2909);
        _2905 = _2911;
    }
    float _2913 = _2905;
    float _2915 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2917 = precise::max(0.0, _2915);
    float _2919 = _2841;
    float _2921 = _2917;
    if (_2881)
    {
        float _2923 = _2903 * 6.283185482025146484375;
        float _2925 = cos(_2923);
        _2919 = _2925;
    }
    float _2927 = _2919;
    float _2929 = -_2867;
    float _2931 = -_2917;
    float _2933 = fma(_2847, _2929, _2931);
    float _2935 = _2915;
    float _2937 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2881)
    {
        float _2939 = rsqrt(_2877);
        _2935 = _2939;
    }
    float _2941 = _2935;
    if (_2881)
    {
        float _2943 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2921 = _2943;
    }
    float _2945 = _2921;
    float _2947 = fma(_1453, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2949 = _2945;
    if (!_2881)
    {
        _2907 = _2869;
    }
    float _2951 = _2907;
    float _2953 = _2913;
    float _2955 = _2951;
    if (_2881)
    {
        float _2957 = fma(_2913, _2945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2949 = _2957;
    }
    float _2959 = _2949;
    float _2961 = _2959;
    if (!_2881)
    {
        _2953 = _2871;
    }
    float _2963 = _2953;
    float _2965 = _2963;
    float _2967 = _2927;
    if (_2881)
    {
        float _2969 = _2927 + (-1.0);
        _2937 = _2969;
    }
    float _2971 = _2937;
    float _2973 = _2971;
    if (_2881)
    {
        float _2975 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2973 = _2975;
    }
    float _2977 = _2973;
    float _2979 = _2941;
    if (_2881)
    {
        float _2981 = _2941 * _2959;
        _2725 = _2981;
    }
    float _2983 = _2725;
    if (!_2881)
    {
        _2979 = _2933;
    }
    float _2985 = _2979;
    float _2987 = _2985;
    if (_2881)
    {
        float _2989 = fma(_2933, _2927, _2977);
        _2987 = _2989;
    }
    float _2991 = _2987;
    if (!_2881)
    {
        _2961 = _2873;
    }
    float _2993 = _2961;
    float _2995 = _2993;
    if (_2881)
    {
        float _2997 = _2869 * _2983;
        _2955 = _2997;
    }
    float _2999 = _2955;
    if (_2881)
    {
        float _3001 = _2871 * _2983;
        _2965 = _3001;
    }
    float _3003 = _2965;
    float _3005 = _2715 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2881)
    {
        _2967 = _2875;
    }
    float _3007 = _2967;
    float _3009 = _3007;
    if (_2881)
    {
        float _3011 = _2999 * _2999;
        _2995 = _3011;
    }
    float _3013 = _2995;
    if (_2881)
    {
        float _3015 = _3003 * _3003;
        _3009 = _3015;
    }
    float _3017 = _3009;
    float _3019 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3005);
    float _3021 = fma(_2991, _2991, _3013);
    float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3025 = fma(_2865, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3023);
    float _3027 = precise::clamp(_3025, 0.0, 1.0);
    float _3029 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3019);
    float _3031 = floor(_2947);
    float _3033 = _3021 + _3017;
    float _3035 = _3029 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3037 = -_3027;
    float _3039 = _3037 + 1.0;
    float _3041 = fma(_1469, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3043 = _2715 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3045 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3047 = rsqrt(_3033);
    float _3049 = _3035 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3051 = _2715 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3053 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3043);
    float _3055 = -_3049;
    float _3057 = fma(_3055, _3045, 1.0);
    float _3059 = _2715 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3061 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3051);
    float _3063 = abs(_3039);
    float _3065 = log2(_3063);
    float _3067 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3053);
    float _3069 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3059);
    float _3071 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3061);
    float _3073 = -_3031;
    float _3075 = _2947 + _3073;
    float _3077 = _3067 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3079 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3069);
    float _3081 = _3071 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3083 = _3047 * _2999;
    float _3085 = _3047 * _2991;
    float _3087 = _3047 * _3003;
    float _3089 = _3079 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3091 = _3083 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3093 = _3081 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3095 = floor(_3041);
    float _3097 = _3081 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3099 = -_3091;
    float _3101 = fma(_3085, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3099);
    float _3103 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3093);
    float _3105 = _3065 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3107 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3097);
    float _3109 = -_3087;
    float _3111 = fma(_3109, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3101);
    float _3113 = fma(_3035, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3103);
    float _3115 = log2(_3057);
    float _3117 = fma(_3111, -0.5, 0.5);
    float _3119 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3113);
    float _3121 = fma(_3111, 0.5, 0.5);
    float _3123 = exp2(_3105);
    float _3125 = _3081 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3127 = fma(_3121, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3129 = -_3095;
    float _3131 = _3041 + _3129;
    float _3133 = _3085 + 1.0;
    float _3135 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3125);
    float _3137 = fma(_3121, _3127, -0.212114393711090087890625);
    float _3139 = fma(_3035, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3107);
    float _3141 = 1.0 / _3119;
    float _3143 = fma(_3035, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3135);
    float _3145 = fma(_3121, _3137, 1.570728778839111328125);
    float _3147 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3143);
    float _3149 = sqrt(_3117);
    float _3151 = -_3085;
    float _3153 = fma(_3123, _3133, _3151);
    float _3155 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3139);
    float _3157 = _3115 * 0.693147182464599609375;
    float2 _8621 = float2(_3075, _3131);
    float _3159 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8621, float2(0.0), isnan(_8621)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8621, float2(0.0), isnan(_8621)), level(0.0)).x;
    float _3161 = fma(_3153, 0.5, 0.5);
    float _3163 = _3157 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3165 = _3147 * _3141;
    float _3167 = _3155 * _3141;
    float _3169 = fma(_3165, 0.5, 0.5);
    float _3171 = fma(_3167, -0.5, 0.5);
    float _3173 = _3149 * 0.636619746685028076171875;
    float3 _8651 = float3(_3169, _3171, _3163);
    float _3175 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8651, float3(0.0), isnan(_8651)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8651, float3(0.0), isnan(_8651)), level(0.0)).x;
    float _3177 = -_3145;
    float _3179 = fma(_3173, _3177, 1.0);
    float3 _8667 = float3(_3169, _3171, _3163);
    float4 _3182 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8667, float3(0.0), isnan(_8667)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8667, float3(0.0), isnan(_8667)), level(0.0)).xyzw;
    float _3184 = _3182.x;
    float _3186 = _3182.y;
    float _3188 = _3182.z;
    float _3190 = _3182.w;
    float2 _8683 = float2(_3179, _3161);
    float3 _3194 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8683, float2(0.0), isnan(_8683)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8683, float2(0.0), isnan(_8683)), level(0.0)).xyz;
    float _3196 = _3194.x;
    float _3198 = _3194.y;
    float _3200 = _3194.z;
    float _3202 = abs(_2731);
    float _3204 = log2(_3202);
    bool _3206 = _2035 != 0.0;
    bool _3208 = isnan(_2035);
    bool _3210 = _3206 || _3208;
    bool _3212 = isnan(0.0);
    bool _3214 = _3210 || _3212;
    out.m_67.x = _1421;
    out.m_67.y = _1423;
    out.m_67.z = _1425;
    out.m_67.w = _1419;
    float _3216 = _3065 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3218 = _2033 == 0.0;
    bool _3220 = !_3214;
    bool _3222 = _3218 && _3220;
    out.m_69.x = _1417;
    out.m_69.y = _1427;
    out.m_69.z = _1429;
    out.m_69.w = _1397;
    float _3224 = _3081 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3226 = _2037 == 0.0;
    bool _3228 = _3226 && _3222;
    float _3230 = exp2(_3216);
    float _3232 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3224);
    float _3234 = _3204 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3236 = _2017 * _2133;
    float _3238 = in.m_75.x;
    float _3240 = in.m_75.y;
    float _3242 = in.m_75.z;
    float _3244 = _2041 * _2135;
    float _3246 = _2017 * _2135;
    float _3248 = -_2025;
    float _3250 = fma(_3248, _2225, _3236);
    float _3252 = exp2(_3234);
    float _3254 = _2041 * _2133;
    float _3256 = _2085 * _2135;
    float _3258 = _2079 * _1745;
    float _3260 = -_2025;
    float _3262 = fma(_3260, _2227, _3246);
    float _3264 = fma(_2015, _2227, _3244);
    float _3266 = fma(_2015, _2225, _3254);
    float _3268 = fma(_2019, _2227, _3256);
    bool _3270 = _2731 <= 8000.0;
    bool _3272 = isnan(_2731);
    bool _3274 = _3270 || _3272;
    bool _3276 = isnan(8000.0);
    bool _3278 = _3274 || _3276;
    float _3280 = float(_3278);
    float _3282 = fma(_3035, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3232);
    float _3284 = _2041 * _2127;
    float _3286 = -_3230;
    float _3288 = _3286 + 1.0;
    float _3290 = _3258 + _3264;
    float _3292 = fma(_2015, _2229, _3284);
    float _3294 = fma(_3252, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3296 = precise::clamp(_3294, 0.0, 1.0);
    float _3298 = fma(_3296, -2.0, 3.0);
    float _3300 = _3296 * _3296;
    float _3302 = _3242;
    float _3304 = _3240;
    float _3306 = _3238;
    if (!_3228)
    {
        float _3308 = fma(_2037, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3242);
        _3302 = _3308;
    }
    float _3310 = _3302;
    float _3312 = _2013 * _1677;
    if (!_3228)
    {
        float _3314 = fma(_2035, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3240);
        _3304 = _3314;
    }
    float _3316 = _3304;
    float _3318 = _3300 * _3298;
    if (!_3228)
    {
        float _3320 = fma(_2033, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3238);
        _3306 = _3320;
    }
    float _3322 = _3306;
    float _3324 = _3312 + _3250;
    float _3326 = _2013 * _1745;
    float _3328 = -_3318;
    float _3330 = _3328 + 1.0;
    float _3332 = in.m_77.x;
    float _3334 = _2079 * _1677;
    float _3336 = _2043 * _1745;
    float _3338 = fma(_3330, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3318);
    float _3340 = _3324 * _3316;
    float _3342 = _3334 + _3266;
    float _3344 = _3336 + _3268;
    float _3346 = _2017 * _2127;
    float _3348 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3282);
    float _3350 = _3280 * _3338;
    float _3352 = _3326 + _3262;
    float _3354 = fma(_3342, _3322, _3340);
    float _3356 = _2013 * _1679;
    float _3358 = -_2025;
    float _3360 = fma(_3358, _2229, _3346);
    float _3362 = _3348 + _3119;
    float _3364 = _3350 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3366 = _3352 * _3316;
    float _3368 = _2085 * _2133;
    float _3370 = _2079 * _1679;
    float _3372 = _2085 * _2127;
    float _3374 = _3356 + _3360;
    float _3376 = _3362 * 0.5;
    float _3378 = _3288 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3380 = fma(_3290, _3322, _3366);
    float _3382 = _2043 * _1677;
    float _3384 = fma(_2019, _2225, _3368);
    float _3386 = _2043 * _1679;
    float _3388 = fma(_2019, _2229, _3372);
    float _3390 = _3370 + _3292;
    float _3392 = _3374 * _3316;
    float _3394 = _3382 + _3384;
    float _3396 = _3386 + _3388;
    out.m_79.z = _3376;
    out.m_79.w = _3119;
    float _3398 = fma(_3390, _3322, _3392);
    float _3400 = fma(_3394, _3310, _3354);
    float _3402 = fma(_3344, _3310, _3380);
    float _3404 = fma(_3396, _3310, _3398);
    bool _3406 = _2865 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3408 = isnan(_2865);
    bool _3410 = _3406 || _3408;
    bool _3412 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3414 = _3410 || _3412;
    out.gl_Position.x = _3147;
    out.gl_Position.y = _3155;
    out.gl_Position.z = _3348;
    out.gl_Position.w = _3119;
    float _3416 = -_3378;
    float _3418 = _3416 + 1.0;
    out.m_81.x = _3400;
    out.m_81.y = _3402;
    out.m_81.z = _3404;
    float _3420 = _3119;
    float _3422 = _3418;
    float _3424 = _3378;
    if (!_3414)
    {
        _3420 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3426 = _3420;
    float _3428 = -_3159;
    float _3430 = _3428 + 1.0;
    float _3432 = _3430 * _3364;
    float _3434 = precise::clamp(_3432, 0.0, 1.0);
    float _3436 = -_3434;
    float _3438 = fma(_3436, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3440 = _3438 * _3332;
    float _3442 = _3378 * _3175;
    float _3444 = _3332;
    float _3446 = _3426;
    float _3448 = _3426;
    if (!_3414)
    {
        _3444 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3450 = _3444;
    float _3452 = _3440 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3454 = _2785 * _2843;
    float _3456 = _3190 * _3442;
    float _3458 = _3190 * _3418;
    float _3460 = _3456;
    float _3462 = _3454;
    float _3464 = _3450;
    float _3466 = _3450;
    if (!_3414)
    {
        _3422 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3468 = _3422;
    out.m_83.x = _3452;
    float _3470 = _3200 * _3442;
    float _3472 = fma(_3196, _3456, _3184);
    float _3474 = fma(_3198, _3456, _3186);
    float _3476 = _3454 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3478 = fma(_3190, _3470, _3188);
    float _3480 = _3468;
    float _3482 = _3468;
    if (!_3414)
    {
        _3460 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3484 = _3460;
    float _3486 = _3484;
    float _3488 = _3484;
    if (!_3414)
    {
        _3424 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3490 = _3424;
    out.m_85.x = _3472;
    out.m_85.y = _3474;
    out.m_85.z = _3478;
    out.m_85.w = _3458;
    float _3492 = _3490;
    float _3494 = _3490;
    if (!_3414)
    {
        _3462 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3496 = _3462;
    bool _3498 = !_3414;
    float _3500 = _3496;
    float _3502 = _3496;
    if (!_3498)
    {
        bool _3504 = _2865 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3506 = isnan(_2865);
        bool _3508 = _3504 || _3506;
        bool _3510 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3512 = _3508 || _3510;
        if (!_3512)
        {
            float _3514 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3516 = _2865 + _3514;
            float _3518 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3520 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3518;
            float _3522 = 1.0 / _3520;
            float _3524 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3526 = _3524 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3528 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3530 = _3528 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3532 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3534 = _3532 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3536 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3538 = _3536 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3540 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3542 = _3540 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3544 = _3516 * _3522;
            float _3546 = precise::clamp(_3544, 0.0, 1.0);
            float _3548 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3550 = _3548 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3552 = fma(_3546, _3526, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3554 = fma(_3546, _3550, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3556 = fma(_3546, _3530, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3558 = fma(_3546, _3534, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3560 = fma(_3546, _3538, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3562 = fma(_3546, _3542, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3488 = _3554;
            _3494 = _3560;
            _3466 = _3552;
            _3482 = _3558;
            _3448 = _3556;
            _3502 = _3562;
            _3564 = true;
        }
        else
        {
            bool _3566 = _2865 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3568 = isnan(_2865);
            bool _3570 = _3566 || _3568;
            bool _3572 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3574 = _3570 || _3572;
            if (!_3574)
            {
                _3464 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3576 = _3464;
            _3466 = _3576;
            if (!_3574)
            {
                _3486 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3578 = _3486;
            _3488 = _3578;
            if (!_3574)
            {
                _3446 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3580 = _3446;
            _3448 = _3580;
            if (!_3574)
            {
                _3480 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3582 = _3480;
            _3482 = _3582;
            if (!_3574)
            {
                _3492 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3584 = _3492;
            _3494 = _3584;
            if (!_3574)
            {
                _3500 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3586 = _3500;
            bool _3588 = !_3574;
            _3502 = _3586;
            if (!_3588)
            {
                bool _3590 = _2865 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3592 = isnan(_2865);
                bool _3594 = _3590 || _3592;
                bool _3596 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3598 = _3594 || _3596;
                if (!_3598)
                {
                    float _3600 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3602 = _2865 + _3600;
                    float _3604 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3606 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3604;
                    float _3608 = 1.0 / _3606;
                    float _3610 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3612 = _3610 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3614 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3616 = _3614 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3618 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3620 = _3618 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3622 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3624 = _3622 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3626 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3628 = _3626 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3630 = _3602 * _3608;
                    float _3632 = precise::clamp(_3630, 0.0, 1.0);
                    float _3634 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3636 = _3634 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3638 = fma(_3632, _3612, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3640 = fma(_3632, _3636, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3642 = fma(_3632, _3616, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3644 = fma(_3632, _3620, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3646 = fma(_3632, _3624, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3648 = fma(_3632, _3628, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3488 = _3640;
                    _3494 = _3646;
                    _3466 = _3638;
                    _3482 = _3644;
                    _3448 = _3642;
                    _3502 = _3648;
                    _3564 = true;
                }
                else
                {
                    _3488 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3494 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3466 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3482 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3448 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3502 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3564 = false;
    float _3650 = _3488;
    float _3652 = _3494;
    float _3654 = _3466;
    float _3656 = _3482;
    float _3658 = _3448;
    float _3660 = _3502;
    float _3662 = fma(_3402, -0.5, 0.5);
    float _3664 = precise::clamp(_3662, 0.0, 1.0);
    float _3666 = -_3650;
    float _3668 = _3666 + _3652;
    float _3670 = -_3654;
    float _3672 = _3670 + _3656;
    out.m_87.x = 0.0;
    float _3674 = fma(_3664, _3668, _3650);
    float _3676 = -_3658;
    float _3678 = _3676 + _3660;
    float _3680 = fma(_3664, _3672, _3654);
    float _3682 = _3674 * 0.586610972881317138671875;
    bool _3684 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3686 = fma(_3664, _3678, _3658);
    float _3688 = _3476 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3690 = fma(_3680, 0.298911988735198974609375, _3682);
    bool _3692 = _2785 > 0.0;
    bool _3694 = isnan(_2785);
    bool _3696 = _3692 || _3694;
    bool _3698 = isnan(0.0);
    bool _3700 = _3696 || _3698;
    float _3702 = fma(_3686, 0.114477999508380889892578125, _3690);
    out.m_49.x = _3688;
    bool _3704 = _2843 <= 0.0;
    bool _3706 = !_3700;
    bool _3708 = _3704 || _3706;
    float _3710 = -_3702;
    float _3712 = _3680 + _3710;
    float _3714 = -_3702;
    float _3716 = _3674 + _3714;
    float _3718 = -_3702;
    float _3720 = _3686 + _3718;
    float _3722 = fma(_3712, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3702);
    float _3724 = fma(_3716, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3702);
    float _3726 = fma(_3720, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3702);
    bool _3728 = !_3684;
    if (!_3728)
    {
        float _3730 = -_2715;
        float _3732 = _3730 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3734 = -_2717;
        float _3736 = _3734 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3738 = -_2719;
        float _3740 = _3738 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3742 = _3732 * _3732;
        float _3744 = fma(_3736, _3736, _3742);
        float _3746 = fma(_3740, _3740, _3744);
        float _3748 = sqrt(_3746);
        float _3750 = rsqrt(_3746);
        float _3752 = -_3748;
        float _3754 = _3752 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3756 = _3754 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3758 = precise::clamp(_3756, 0.0, 1.0);
        float _3760 = _3736 * _3750;
        float _3762 = _3732 * _3750;
        float _3764 = abs(_3758);
        float _3766 = log2(_3764);
        float _3768 = _3740 * _3750;
        float _3770 = _3760 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3772 = _3402 * _3762;
        float _3774 = -_3762;
        float _3776 = -_3770;
        float _3778 = fma(_3774, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3776);
        float _3780 = fma(_3400, _3760, _3772);
        float _3782 = -_3768;
        float _3784 = fma(_3782, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3778);
        float _3786 = fma(_3404, _3768, _3780);
        float _3788 = precise::clamp(_3786, 0.0, 1.0);
        float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3792 = _3784 + _3790;
        float _3794 = _3766 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3796 = _3792 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3798 = precise::clamp(_3796, 0.0, 1.0);
        float _3800 = exp2(_3794);
        float _3802 = _3800 * _3798;
        float _3804 = _3788 * _3802;
        float _3806 = _3804 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3808 = _3804 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3810 = _3804 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3806;
        out.m_87.y = _3808;
        out.m_87.z = _3810;
    }
    out.m_89.x = _3722;
    out.m_89.y = _3724;
    out.m_89.z = _3726;
    if (!_3708)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3812 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3812;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3564 = false;
    bool _440 = false;
    bool _320 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3870 = as_type<float>(_124);
        out.gl_Position.z = _3870;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_51.w;
    float _130 = float(_108);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = _134;
    if (_150)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_150)
    {
        out.m_49.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _126 = as_type<int>(_156);
    }
    int _158 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3934 = as_type<float>(_158);
        out.gl_Position.z = _3934;
    }
    if (_150)
    {
        return out;
    }
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = 1.0 / _130;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _134 * _166;
    float _172 = _162 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _174 = _162 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _162 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _178 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[4].x, _172);
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[6].x, _176);
    float _184 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].z, _178);
    float _186 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    bool _190 = !_168;
    float _192 = _188;
    float _210;
    if (!_190)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        _210 = _170;
    }
    _212 = false;
    float _214 = _210;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = _214 + _216;
    bool _220 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _222 = isnan(_214);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _232;
    bool _236 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _238 = isnan(_214);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -_230;
    float _250 = _248 + 1.0;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _252;
    float _256 = 1.0 / _234;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _260 = _246 * _250;
    float _262 = -_246;
    float _264 = _262 + 1.0;
    float _266 = _218 * _256;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _268;
    float _272 = fma(_254, _266, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = fma(_270, _266, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _280 = fma(_276, _266, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _282 = _272 * _260;
    float _284 = _278 * _260;
    float _286 = _280 * _260;
    float _288 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].x, _282);
    float _290 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _292 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].z, _284);
    float _294 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[144].x, _288);
    float _296 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[144].y, _290);
    float _298 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[144].z, _292);
    bool _300 = !_258;
    float _318;
    if (!_300)
    {
        float _302 = in.m_55.x;
        float _304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _306 = _302 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _310 = _308 * _304;
        float _312 = floor(_310);
        float _314 = -_312;
        float _316 = _310 + _314;
        _318 = _316;
        _320 = true;
    }
    else
    {
        _318 = _170;
    }
    _320 = false;
    float _322 = _318;
    float _324 = in.m_57.x;
    float _326 = in.m_57.y;
    float _328 = in.m_57.z;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _332 = _322 + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _334;
    bool _338 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _340 = isnan(_322);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    bool _350 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _352 = 1.0 / _336;
    float _354 = _298 * _328;
    bool _356 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _358 = isnan(_322);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _332 * _352;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _370;
    float _374 = _296 * _326;
    float _376 = -_366;
    float _378 = _376 + 1.0;
    float _380 = _294 * _324;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _386;
    float _390 = _348 * _378;
    float _392 = fma(_372, _368, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _394 = fma(_384, _368, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _396 = fma(_388, _368, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _398 = -_348;
    float _400 = _398 + 1.0;
    float _402 = _392 * _390;
    float _404 = _394 * _390;
    float _406 = _396 * _390;
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _402);
    float _410 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _404);
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _406);
    float _414 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[108].y, _408);
    float _416 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[108].x, _410);
    float _418 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[108].z, _412);
    bool _420 = !_350;
    float _438;
    if (!_420)
    {
        float _422 = in.m_55.x;
        float _424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _426 = _422 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _428 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _430 = _428 * _424;
        float _432 = floor(_430);
        float _434 = -_432;
        float _436 = _430 + _434;
        _438 = _436;
        _440 = true;
    }
    else
    {
        _438 = _170;
    }
    _440 = false;
    float _442 = _438;
    float _444 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _446 = int(_444);
    float _448 = in.m_55.x;
    float _450 = in.m_55.y;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _454 = int(_452);
    float _456 = float(_446);
    float _458 = 1.0 / _456;
    float _460 = float(uint(_454));
    float _462 = _450 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _464 = ~_454;
    int _466 = _464 + 1;
    int _468 = ~_454;
    int _470 = _468 + 1;
    float _472 = 1.0 / _460;
    int _474 = ~_454;
    int _476 = _474 + 1;
    float _478 = _458 * _134;
    float _480 = trunc(_478);
    int _482 = int(_480);
    int _484 = as_type<int>(_472) + (-2);
    float _486 = float(uint(_482));
    float _488 = float(_482);
    float _490 = as_type<float>(_484) * _486;
    float _492 = trunc(_490);
    float _494 = precise::max(_492, 0.0);
    uint _497 = uint(_494);
    int _499 = _466 * int(_497);
    int _501 = _499 + _482;
    float _503 = float(uint(_501));
    float _505 = as_type<float>(_484) * _503;
    float _507 = trunc(_505);
    float _509 = precise::max(_507, 0.0);
    uint _511 = uint(_509);
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _515 = _513 != 0;
    bool _517 = !_515;
    float _519 = _517 ? 7.345489978790283203125 : 1.0;
    float _521 = _519 * _448;
    float _523 = floor(_521);
    int _525 = int(_497) + int(_511);
    float _527 = float(_454);
    int _529 = _470 * _525;
    int _531 = _529 + _482;
    bool _533 = _488 >= _527;
    bool _535 = isnan(_488);
    bool _537 = _533 || _535;
    bool _539 = isnan(_527);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    bool _545 = uint(_531) >= uint(_454);
    float _547 = trunc(_543);
    int _549 = int(_547);
    bool _551 = !_545;
    int _553 = _551 ? 0 : (-1);
    float _555 = -_523;
    float _557 = _521 + _555;
    bool _559 = _454 == 0;
    int _561 = ~_525;
    int _563 = _561 + _553;
    int _565 = _563 + 1;
    int _567 = _454 * _565;
    int _569 = _567 + _482;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _573 = _571 != 0;
    int _575 = ~_549;
    int _577 = _575 + 1;
    int _579 = _577 + 1;
    bool _581 = !_559;
    int _583 = _581 ? _569 : (-1);
    float _585 = _557 * _527;
    float _587 = _527 * _134;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _591 = _589 != 0;
    int _593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _595 = _593 != 0;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _599 = _597 != 0;
    int _601 = _583 * _579;
    float _603 = _587 * _166;
    int _605 = _454 + (-1);
    float _607 = trunc(_585);
    int _609 = int(_607);
    bool _611 = !_595;
    int _613 = _611 ? 0 : 1;
    bool _615 = !_591;
    int _617 = _615 ? 0 : 1;
    int _619 = _549 * _605;
    int _621 = _619 + _601;
    bool _623 = !_573;
    int _625 = _623 ? 0 : 1;
    int _627 = abs(_613);
    float _629 = trunc(_603);
    int _631 = int(_629);
    int _633 = abs(_625);
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _637 = _635 != 0;
    int _639 = _621 * _627;
    bool _641 = !_599;
    int _643 = _641 ? 0 : 1;
    int _645 = abs(_617);
    bool _647 = !_637;
    int _649 = _647 ? 0 : 1;
    int _651 = abs(_643);
    int _653 = _609 * _633;
    int _655 = _653 + _482;
    int _657 = abs(_649);
    int _659 = _631 * _645;
    int _661 = _659 + _639;
    int _663 = ~_454;
    int _665 = _663 + 1;
    int _667 = _655 * _651;
    int _669 = _667 + _661;
    int _671 = ~_454;
    int _673 = _671 + 1;
    float _675 = float(uint(_655));
    int _677 = _609 * _657;
    int _679 = _677 + _669;
    float _681 = as_type<float>(_484) * _675;
    float _683 = float(uint(_679));
    float _685 = as_type<float>(_484) * _683;
    float _687 = trunc(_681);
    float _689 = precise::max(_687, 0.0);
    uint _691 = uint(_689);
    float _693 = trunc(_685);
    float _695 = precise::max(_693, 0.0);
    uint _697 = uint(_695);
    int _699 = _673 * int(_697);
    int _701 = _699 + _679;
    float _703 = float(uint(_701));
    float _705 = as_type<float>(_484) * _703;
    float _707 = trunc(_705);
    float _709 = precise::max(_707, 0.0);
    uint _711 = uint(_709);
    int _713 = int(_697) + int(_711);
    int _715 = ~_454;
    int _717 = _715 + 1;
    int _719 = _665 * _713;
    int _721 = _719 + _679;
    bool _723 = uint(_721) >= uint(_454);
    bool _725 = !_723;
    int _727 = _725 ? 0 : (-1);
    int _729 = ~_713;
    int _731 = _729 + _727;
    int _733 = _731 + 1;
    int _735 = _454 * _733;
    int _737 = _735 + _679;
    bool _739 = !_559;
    int _741 = _739 ? _737 : (-1);
    int _743 = _717 * int(_691);
    int _745 = _743 + _655;
    int _747 = _741 >> 31;
    float _749 = float(uint(_745));
    int _751 = _747 & 3;
    int _753 = _741 & 3;
    bool _755 = _753 != 0;
    float _757 = as_type<float>(_484) * _749;
    int _759 = _741 + _751;
    int _761 = _759 >> 2;
    float _763 = trunc(_757);
    float _765 = precise::max(_763, 0.0);
    uint _767 = uint(_765);
    int _769 = _761 << 4;
    int _771 = _769 + 368;
    int _773 = _741 & 3;
    bool _775 = _773 != 0;
    uint _777 = uint(int(uint(_771) >> uint(2)));
    uint _779 = uint(int(uint(int(_777)) >> uint(2)));
    int _781 = int(_777) & 3;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[int(_779)][_781];
    int _785 = int(_777) + 1;
    uint _787 = uint(int(uint(_785) >> uint(2)));
    int _789 = _785 & 3;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[int(_787)][_789];
    int _793 = _755 ? 0 : 1;
    bool _795 = uint(_773) > 1u;
    bool _797 = _773 != 3;
    bool _799 = uint(_773) >= 2u;
    int _801 = _771 + 8;
    uint _803 = uint(int(uint(_801) >> uint(2)));
    uint _805 = uint(int(uint(int(_803)) >> uint(2)));
    int _807 = int(_803) & 3;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[int(_805)][_807];
    int _811 = int(_803) + 1;
    uint _813 = uint(int(uint(_811) >> uint(2)));
    int _815 = _811 & 3;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[int(_813)][_815];
    int _819 = int(_691) + int(_767);
    int _821 = _799 ? 0 : 1;
    int _823 = ~_793;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    int _829 = _476 * _819;
    int _831 = _829 + _655;
    int _833 = _827;
    if (!_795)
    {
        int _835 = ~_793;
        int _837 = _835 + 1;
        _833 = _837;
    }
    int _839 = _833;
    bool _841 = _773 != 3;
    bool _843 = uint(_831) >= uint(_454);
    float _845 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _847 = int(_845);
    bool _849 = !_775;
    int _851 = _849 ? 0 : 1;
    bool _853 = !_843;
    int _855 = _853 ? 0 : (-1);
    int _857 = abs(_839);
    int _859 = ~_819;
    int _861 = _859 + _855;
    int _863 = _861 + 1;
    int _865 = ~_821;
    int _867 = _865 + 1;
    int _869 = _867 + 1;
    int _871 = _869;
    if (_797)
    {
        int _873 = ~_821;
        int _875 = _873 + 1;
        _871 = _875;
    }
    int _877 = _871;
    int _879 = _454 * _863;
    int _881 = _879 + _655;
    bool _883 = !_841;
    int _885 = _883 ? 0 : (-1);
    int _887 = abs(_851);
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _891 = _889 != 0;
    int _893 = abs(_877);
    int _895 = ~_857;
    int _897 = _895 + 1;
    int _899 = _897 + 1;
    int _901 = abs(_885);
    bool _903 = !_891;
    int _905 = _903 ? 0 : 1;
    int _907 = ~_887;
    int _909 = _907 + 1;
    int _911 = _909 + 1;
    int _913 = _899 * as_type<int>(_791);
    int _915 = abs(_905);
    int _917 = _911 * as_type<int>(_783);
    int _919 = _917 + _913;
    int _921 = ~_893;
    int _923 = _921 + 1;
    int _925 = _923 + 1;
    float _927 = in.m_59.z;
    int _929 = abs(_847);
    int _931 = ~_901;
    int _933 = _931 + 1;
    int _935 = _933 + 1;
    int _937 = _925 * as_type<int>(_809);
    int _939 = _937 + _919;
    float _941 = in.m_59.x;
    int _943 = _935 * as_type<int>(_817);
    int _945 = _943 + _939;
    float _947 = float(uint(_929));
    float _949 = float(uint(_847));
    int _951 = ~_915;
    int _953 = _951 + 1;
    int _955 = _953 + 1;
    float _957 = 1.0 / _947;
    bool _959 = !_559;
    int _961 = _959 ? _881 : (-1);
    int _963 = _945 * _955;
    float _965 = in.m_59.y;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _969 = _967 != 0;
    int _971 = _961 * _915;
    int _973 = _971 + _963;
    float _975 = 1.0 / _949;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _979 = _977 != 0;
    out.m_61.z = _927;
    int _981 = ~_929;
    int _983 = _981 + 1;
    int _985 = abs(_973);
    float _987 = float(uint(_973));
    out.m_61.x = _941;
    int _989 = as_type<int>(_957) + (-2);
    float _991 = _448 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _993 = float(uint(_985));
    float _995 = 0.0;
    if (_969)
    {
        float _997 = in.m_55.x;
        _995 = _997;
    }
    float _999 = _995;
    float _1001 = as_type<float>(_989) * _993;
    int _1003 = as_type<int>(_975) + (-2);
    float _1005 = in.m_63.y;
    int _1007 = ~_847;
    int _1009 = _1007 + 1;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1013 = _1011 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1019 = as_type<float>(_1003) * _987;
    float _1021 = trunc(_1001);
    float _1023 = precise::max(_1021, 0.0);
    uint _1025 = uint(_1023);
    out.m_61.y = _965;
    bool _1027 = _450 > 0.5;
    float _1029 = in.m_46.x;
    float _1031 = in.m_46.y;
    float _1033 = in.m_46.z;
    float _1035 = trunc(_1019);
    float _1037 = precise::max(_1035, 0.0);
    uint _1039 = uint(_1037);
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1045 = -_1041;
    float _1047 = fma(_991, 2.0, _1045);
    bool _1049 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1051 = isnan(_442);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1057 = _1053 || _1055;
    float _1059 = float(_1057);
    int _1061 = _983 * int(_1025);
    int _1063 = _1061 + _985;
    float _1065 = 1.0 / _1017;
    float _1067 = -_1005;
    float _1069 = _1067 + 1.0;
    float _1071 = float(uint(_1063));
    int _1073 = _1009 * int(_1039);
    int _1075 = _1073 + _973;
    float _1077 = 1.0 / _1013;
    float _1079 = as_type<float>(_989) * _1071;
    float _1081 = _1005;
    if (_979)
    {
        float _1083 = _1027 ? _1069 : _1005;
        _1081 = _1083;
    }
    float _1085 = _1081;
    float _1087 = fma(_462, -2.0, _1043);
    float _1089 = float(uint(_1075));
    float _1091 = in.m_63.x;
    float _1093 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1095 = trunc(_1079);
    float _1097 = precise::max(_1095, 0.0);
    uint _1099 = uint(_1097);
    float _1101 = as_type<float>(_1003) * _1089;
    float _1103 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1105 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1107;
    float _1111 = fma(_1029, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1093);
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1117 = fma(_1029, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1103);
    float _1119 = trunc(_1101);
    float _1121 = precise::max(_1119, 0.0);
    uint _1123 = uint(_1121);
    float _1125 = fma(_1029, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1105);
    float _1127 = _1109 * _1065;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1131 = _442 + _1129;
    float _1133 = fma(_1033, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1111);
    float _1135 = _1115 * _1077;
    int _1137 = ~_929;
    int _1139 = _1137 + 1;
    float _1141 = fma(_1033, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1117);
    int _1143 = int(_1025) + int(_1099);
    float _1145 = fma(_1127, _1131, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1147 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1149 = isnan(_442);
    bool _1151 = _1147 || _1149;
    bool _1153 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1155 = _1151 || _1153;
    float _1157 = float(_1155);
    float _1159 = fma(_1033, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1125);
    int _1161 = ~_847;
    int _1163 = _1161 + 1;
    int _1165 = _1139 * _1143;
    int _1167 = _1165 + _985;
    bool _1169 = _999 > 0.5;
    bool _1171 = _1169 && _969;
    float _1173 = -_1157;
    float _1175 = _1173 + 1.0;
    int _1177 = int(_1039) + int(_1123);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1181 = _442 + _1179;
    bool _1183 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1185 = isnan(_442);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1191 = _1187 || _1189;
    float _1193 = float(_1191);
    float _1195 = as_type<float>(_1099);
    float _1197 = _1193;
    if (_969)
    {
        _1195 = _1091;
    }
    float _1199 = _1195;
    int _1201 = _1163 * _1177;
    int _1203 = _1201 + _973;
    bool _1205 = uint(_1167) >= uint(_929);
    float _1207 = _1193 * _1175;
    float _1209 = -_1193;
    float _1211 = _1209 + 1.0;
    float _1213 = fma(_1135, _1181, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1215 = uint(_1203) >= uint(_847);
    float _1217 = _1199;
    if (_1171)
    {
        float _1219 = -_1199;
        float _1221 = _1219 + 1.0;
        _1217 = _1221;
    }
    float _1223 = _1217;
    float _1225 = _1059 * _1211;
    float _1227 = _1141 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1229 = !_1215;
    int _1231 = _1229 ? 0 : (-1);
    float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1235 = _1145 * _1225;
    bool _1237 = !_1205;
    int _1239 = _1237 ? 0 : (-1);
    float _1241 = -_1059;
    float _1243 = _1241 + 1.0;
    if (!_969)
    {
        _1197 = _1091;
    }
    float _1245 = _1197;
    float _1247 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1249 = _1227 + _1247;
    float _1251 = _1245;
    if (_969)
    {
        _1251 = _1223;
    }
    float _1253 = _1251;
    float _1255 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1235);
    int _1257 = ~_1177;
    int _1259 = _1257 + _1231;
    int _1261 = _1259 + 1;
    float _1263 = _1133 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1265 = ~_1239;
    int _1267 = _1143 + _1265;
    int _1269 = _1267 + 1;
    float _1271 = _1159 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1273 = _973 ^ _847;
    float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1277 = _1263 + _1275;
    float _1279 = _1249 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1283 = _1271 + _1281;
    uint _1285 = uint(int(uint(_1273) >> uint(31)));
    float _1287 = fma(_1213, _1207, _1255);
    float _1289 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1279);
    bool _1291 = _847 == 0;
    int _1293 = ~int(_1285);
    int _1295 = _1293 + 1;
    float _1297 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1289);
    bool _1299 = _847 == 0;
    int _1301 = _847 * _1261;
    int _1303 = _1301 + _973;
    int _1305 = _1269 ^ _1295;
    float _1307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1309 = _1297 >= 0.0;
    int _1311 = ~_1295;
    int _1313 = _1311 + _1305;
    int _1315 = _1313 + 1;
    bool _1317 = !_1291;
    int _1319 = _1317 ? _1303 : (-1);
    float _1321 = in.m_59.w;
    float _1323 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1325 = float(_1319);
    float _1327 = -_134;
    float _1329 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1047);
    float _1331 = fma(_1323, _1253, -0.5);
    bool _1333 = !_1299;
    int _1335 = _1333 ? _1315 : (-1);
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1339 = fma(_1323, _1325, _1329);
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1343 = float(_1335);
    float _1345 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1347 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1087);
    float _1349 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1337);
    float _1351 = _1249 * _1249;
    float _1353 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1341);
    float _1355 = fma(_1345, _1085, -0.5);
    float _1357 = -_1347;
    float _1359 = fma(_1345, _1343, _1357);
    float _1361 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1349);
    float _1363 = _1345;
    int _1365 = as_type<int>(_1361);
    if (_1309)
    {
        _1363 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1367 = _1363;
    float _1369 = fma(_1277, _1277, _1351);
    float _1371 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1353);
    float _1373 = fma(_1361, _1331, _1339);
    out.m_61.w = _1321;
    if (_1309)
    {
        float _1375 = _1367 * 5.0;
        _1365 = as_type<int>(_1375);
    }
    int _1377 = _1365;
    float _1379 = fma(_1283, _1283, _1369);
    float _1381 = fma(_1371, _1355, _1359);
    float _1383 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1287);
    float _1385 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1387 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1389 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1391 = rsqrt(_1379);
    if (_1309)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5779 = as_type<float>(_1377);
        out.gl_Position.z = _5779;
    }
    float _1393 = _1373 + 0.5;
    float _1395 = _1381 + 0.5;
    float _1397 = _1383 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1401 = _1399 != 0;
    int _1403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1405 = _1403 != 0;
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1409 = _1407 != 0;
    if (_1309)
    {
        out.m_49.x = 0.0;
    }
    out.m_65.x = _1393;
    out.m_65.y = _1395;
    float _1411 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1417 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1421 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1423 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1425 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1427 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1429 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1431 = !_1405;
    int _1433 = _1431 ? 0 : 1;
    float _1435 = _1249 * _1391;
    out.m_67.x = _1421;
    out.m_67.y = _1423;
    out.m_67.z = _1425;
    out.m_67.w = _1419;
    bool _1437 = !_1409;
    int _1439 = _1437 ? 0 : 1;
    float _1441 = _1277 * _1391;
    bool _1443 = !_1401;
    int _1445 = _1443 ? 0 : 1;
    out.m_69.x = _1417;
    out.m_69.y = _1427;
    out.m_69.z = _1429;
    out.m_69.w = _1397;
    if (_1309)
    {
        return out;
    }
    float _1447 = -_1435;
    float _1449 = fma(_1447, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1227);
    float _1451 = -_1441;
    float _1453 = fma(_1451, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1263);
    float _1455 = _1283 * _1391;
    float _1457 = in.m_55.z;
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1461 = _1449 + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1465 = _1453 + _1463;
    float _1467 = -_1455;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1271);
    float _1471 = _448 * 2.0;
    float _1473 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1475 = _450 * 2.0;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1479 = _1469 + _1477;
    float _1481 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1473);
    float _1483 = floor(_1471);
    bool _1485 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1487 = isnan(0.0);
    bool _1489 = _1485 || _1487;
    bool _1491 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1493 = _1489 || _1491;
    float _1495 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1481);
    float _1497 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1499 = log2(_1497);
    bool _1501 = _1495 >= 0.0;
    float _1503 = _450 + _448;
    float _1505 = _1503 + (-1.0);
    float _1507 = _450 + _1457;
    float _1509 = floor(_1475);
    bool _1511 = _1483 > 0.0;
    float _1513 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1515 = _1507 + (-1.0);
    bool _1517 = _1483 >= 0.0;
    bool _1519 = isnan(_1483);
    bool _1521 = _1517 || _1519;
    bool _1523 = isnan(0.0);
    bool _1525 = _1521 || _1523;
    float _1527 = _1457 * 2.0;
    float _1529 = 0.0;
    int _1531 = as_type<int>(_1475);
    float _1533 = _1455;
    float _1535 = _1479;
    if (_1501)
    {
        _1529 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1537 = _1529;
    float _1539 = _1499 * _134;
    float _1541 = fma(_1515, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_1501)
    {
        out.m_49.x = 0.0;
    }
    if (_1501)
    {
        float _1543 = _1537 * 5.0;
        _1531 = as_type<int>(_1543);
    }
    int _1545 = _1531;
    float _1547 = floor(_1527);
    bool _1549 = _1509 > 0.0;
    if (_1501)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6064 = as_type<float>(_1545);
        out.gl_Position.z = _6064;
    }
    bool _1551 = _1509 >= 0.0;
    bool _1553 = isnan(_1509);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan(0.0);
    bool _1559 = _1555 || _1557;
    float _1561 = exp2(_1539);
    bool _1563 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1565 = isnan(1.0);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1571 = _1567 || _1569;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1575 = 1.0 + _1573;
    if (_1501)
    {
        return out;
    }
    float _1577 = -_1227;
    float _1579 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1581 = -_1263;
    float _1583 = _1581 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1585 = -_1271;
    float _1587 = _1585 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1589 = 1.0 / _1575;
    float _1591 = _1579 * _1579;
    float _1593 = -_1561;
    float _1595 = _1593 + 1.0;
    int _1597 = _1525 ? 0 : 1;
    float _1599 = _450 + (-0.5);
    float _1601 = fma(_1583, _1583, _1591);
    bool _1603 = _1547 > 0.0;
    float _1605 = -_1435;
    float _1607 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1249);
    float _1609 = _1493 ? _1595 : 0.0;
    float _1611 = fma(_1587, _1587, _1601);
    bool _1613 = _1547 >= 0.0;
    bool _1615 = isnan(_1547);
    bool _1617 = _1613 || _1615;
    bool _1619 = isnan(0.0);
    bool _1621 = _1617 || _1619;
    float _1623 = -_1441;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1277);
    int _1627 = ~_1597;
    int _1629 = _1627 + 1;
    int _1631 = _1629 + 1;
    float _1633 = rsqrt(_1611);
    int _1635 = _1631;
    if (!_1511)
    {
        int _1637 = ~_1597;
        int _1639 = _1637 + 1;
        _1635 = _1639;
    }
    int _1641 = _1635;
    float _1643 = _1607 * _1607;
    int _1645 = abs(_1433);
    if (_1571)
    {
        float _1647 = _1609 * _1589;
        _152 = _1647;
    }
    float _1649 = _152;
    int _1651 = abs(_1445);
    float _1653 = fma(_1625, _1625, _1643);
    int _1655 = _1621 ? 0 : 1;
    float _1657 = sqrt(_1611);
    int _1659 = abs(_1439);
    float _1661 = float(_1641);
    int _1663 = ~_1655;
    int _1665 = _1663 + 1;
    int _1667 = _1665 + 1;
    int _1669 = _1667;
    if (!_1603)
    {
        int _1671 = ~_1655;
        int _1673 = _1671 + 1;
        _1669 = _1673;
    }
    int _1675 = _1669;
    float _1677 = _1583 * _1633;
    float _1679 = _1587 * _1633;
    int _1681 = _1559 ? 0 : 1;
    float _1683 = _1677 * _1677;
    float _1685 = float(_1645);
    float _1687 = float(_1651);
    float _1689 = fma(_1679, _1679, _1683);
    float _1691 = float(_1675);
    float _1693 = _1685 * _1661;
    float _1695 = rsqrt(_1689);
    int _1697 = ~_1681;
    int _1699 = _1697 + 1;
    int _1701 = _1699 + 1;
    float _1703 = _1687 * _1691;
    int _1705 = _1701;
    if (!_1549)
    {
        int _1707 = ~_1681;
        int _1709 = _1707 + 1;
        _1705 = _1709;
    }
    int _1711 = _1705;
    float _1713 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1715 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1717 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1719 = float(_1711);
    float _1721 = float(_1659);
    float _1723 = -_1717;
    float _1725 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1723);
    float _1727 = -_1713;
    float _1729 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1727);
    float _1731 = _1721 * _1719;
    float _1733 = -_1715;
    float _1735 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1733);
    float _1737 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1739 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1741 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1743 = _1679 * _1695;
    float _1745 = _1579 * _1633;
    float _1747 = in.m_71.x;
    float _1749 = in.m_71.y;
    float _1751 = in.m_71.z;
    float _1753 = -_1739;
    float _1755 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1753);
    float _1757 = _1735 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1759 = -_1741;
    float _1761 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1759);
    float _1763 = _1677 * _1695;
    float _1765 = -_1743;
    float _1767 = _1679 * _1765;
    float _1769 = -_1757;
    float _1771 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1769);
    float _1773 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1761);
    float _1775 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1777 = -_1767;
    float _1779 = fma(_1677, _1763, _1777);
    float _1781 = -_1737;
    float _1783 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1781);
    float _1785 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1787 = _1745 * _1763;
    float _1789 = _1779 * _1779;
    float _1791 = -_1775;
    float _1793 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1791);
    float _1795 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1797 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1771);
    float _1799 = fma(_1787, _1787, _1789);
    float _1801 = -_1743;
    float _1803 = _1745 * _1801;
    float _1805 = -_1795;
    float _1807 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1805);
    float _1809 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1811 = -_1785;
    float _1813 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1811);
    float _1815 = _1703 * (-2.0);
    float _1817 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1807);
    float _1819 = -_1809;
    float _1821 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1819);
    float _1823 = fma(_1803, _1803, _1799);
    float _1825 = fma(_1513, _1815, _1513);
    float _1827 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1813);
    float _1829 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1821);
    float _1831 = fma(_1815, _1747, _1747);
    float _1833 = _1693 * (-2.0);
    float _1835 = _448 + (-0.5);
    float _1837 = rsqrt(_1823);
    float _1839 = -_1829;
    float _1841 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1827);
    float _1843 = fma(_1833, _1749, _1749);
    float _1845 = fma(_1835, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1831);
    float _1847 = fma(_1541, _1833, _1541);
    float _1849 = _1731 * (-2.0);
    float _1851 = fma(_1599, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1843);
    float _1853 = fma(_1825, _1649, _1845);
    float _1855 = 1.0 / _1841;
    float _1857 = _1735 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1859 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1861 = fma(_1847, _1649, _1851);
    float _1863 = fma(_1849, _1751, _1751);
    float _1865 = -_1857;
    float _1867 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1865);
    float _1869 = -_1859;
    float _1871 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1869);
    float _1873 = _1853 * 0.15915493667125701904296875;
    float _1875 = _1779 * _1837;
    float _1877 = precise::clamp(_1875, 0.0, 1.0);
    float _1879 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1881 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1871);
    float _1883 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1867);
    float _1885 = -_1877;
    float _1887 = _1885 + 1.0;
    float _1889 = -_1879;
    float _1891 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1889);
    float _1893 = _1861 * 0.15915493667125701904296875;
    float _1895 = _1457 + _448;
    float _1897 = fma(_1881, _1855, -1.0);
    float _1899 = _1887 * _1855;
    float _1901 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1891);
    float _1903 = fma(_1887, _1897, 1.0);
    float _1905 = _1883 * _1899;
    float _1907 = _1901 * _1899;
    float _1909 = _1895 + (-1.0);
    float _1911 = _1903 * _1903;
    float _1913 = _1457 + (-0.5);
    float _1915 = _1893 * 6.283185482025146484375;
    float _1917 = sin(_1915);
    float _1919 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1921 = fma(_1905, _1905, _1911);
    float _1923 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1863);
    float _1925 = fma(_1919, _1849, _1919);
    float _1927 = fma(_1907, _1907, _1921);
    float _1929 = _1893 * 6.283185482025146484375;
    float _1931 = cos(_1929);
    float _1933 = fma(_1925, _1649, _1923);
    float _1935 = abs(_1657);
    float _1937 = precise::max(0.0, _1935);
    float _1939 = _1933 * 0.15915493667125701904296875;
    float _1941 = rsqrt(_1927);
    float _1943 = precise::min(_1937, 40.0);
    float _1945 = _1873 * 6.283185482025146484375;
    float _1947 = sin(_1945);
    float _1949 = _1907 * _1941;
    float _1951 = _1905 * _1941;
    float _1953 = _1903 * _1941;
    float _1955 = -_1455;
    float _1957 = fma(_1955, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
    float _1959 = -_1949;
    float _1961 = _1677 * _1959;
    float _1963 = _1873 * 6.283185482025146484375;
    float _1965 = cos(_1963);
    float _1967 = _1679 * _1953;
    float _1969 = fma(_1957, _1957, _1653);
    float _1971 = -_1951;
    float _1973 = -_1961;
    float _1975 = fma(_1679, _1971, _1973);
    float _1977 = -_1951;
    float _1979 = _1745 * _1977;
    float _1981 = -_1949;
    float _1983 = -_1967;
    float _1985 = fma(_1745, _1981, _1983);
    float _1987 = _1947 * _1917;
    float _1989 = _1975 * _1975;
    float _1991 = -_1979;
    float _1993 = fma(_1677, _1953, _1991);
    float _1995 = _1939 * 6.283185482025146484375;
    float _1997 = cos(_1995);
    float _1999 = _1947 * _1931;
    float _2001 = fma(_1985, _1985, _1989);
    float _2003 = fma(_1993, _1993, _2001);
    float _2005 = _1965 * _1931;
    float _2007 = sqrt(_1969);
    float _2009 = _1965 * _1917;
    float _2011 = rsqrt(_2003);
    float _2013 = _1947 * _1997;
    float _2015 = _1931 * _1997;
    float _2017 = _1965 * _1997;
    float _2019 = _1917 * _1997;
    float _2021 = _380 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2023 = _1939 * 6.283185482025146484375;
    float _2025 = sin(_2023);
    float _2027 = _1391 * _2007;
    float _2029 = _1985 * _2011;
    float _2031 = _1993 * _2011;
    float _2033 = in.m_73.x;
    float _2035 = in.m_73.y;
    float _2037 = in.m_73.z;
    float _2039 = _1679 * _2029;
    float _2041 = fma(_2025, _2005, _1987);
    float _2043 = fma(_2025, _1987, _2005);
    float _2045 = _1975 * _2011;
    float _2047 = _1745 * _2031;
    float _2049 = -_2039;
    float _2051 = fma(_1677, _2031, _2049);
    float _2053 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2055 = _1677 * _2045;
    float _2057 = -_2047;
    float _2059 = fma(_1679, _2045, _2057);
    float _2061 = _2051 * _2051;
    float _2063 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _2053);
    float _2065 = -_2055;
    float _2067 = fma(_1745, _2029, _2065);
    float _2069 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2071 = fma(_2059, _2059, _2061);
    float _2073 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2075 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _2063);
    float _2077 = -_2009;
    float _2079 = fma(_2025, _1999, _2077);
    float _2081 = fma(_2067, _2067, _2071);
    float _2083 = -_1999;
    float _2085 = fma(_2025, _2009, _2083);
    float _2087 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2073);
    float _2089 = _2021 * _2027;
    float _2091 = rsqrt(_2081);
    float _2093 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2033);
    float _2095 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2087);
    float _2097 = _2069 * _2027;
    float _2099 = _2075 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2101 = _2093 * _2089;
    float _2103 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2035);
    float _2105 = _2095 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2107 = _2103 * _2097;
    float _2109 = -_2105;
    float _2111 = _2099 + _2109;
    bool _2113 = _2105 >= _2099;
    bool _2115 = isnan(_2105);
    bool _2117 = _2113 || _2115;
    bool _2119 = isnan(_2099);
    bool _2121 = _2117 || _2119;
    float _2123 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2125 = _354 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2127 = _2067 * _2091;
    float _2129 = abs(_2111);
    float _2131 = precise::max(_2129, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _2133 = _2059 * _2091;
    float _2135 = _2051 * _2091;
    float _2137 = _1677 * _2127;
    float _2139 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _2139;
    float _2143 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2123);
    float _2145 = precise::min(_2131, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _2147 = _1679 * _2135;
    float _2149 = -_2137;
    float _2151 = fma(_1679, _2133, _2149);
    float _2153 = 1.0 / _2141;
    float _2155 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2143);
    float _2157 = -_2147;
    float _2159 = fma(_1745, _2127, _2157);
    float _2161 = _2151 * _2151;
    float _2163 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2165 = _2145 + _2163;
    bool _2167 = !_2121;
    float _2169 = _2167 ? 1.0 : (-1.0);
    float _2171 = rsqrt(_2155);
    float _2173 = _1745 * _2133;
    float _2175 = -_2173;
    float _2177 = fma(_1677, _2135, _2175);
    float _2179 = fma(_2159, _2159, _2161);
    float _2181 = _2017 * _2107;
    float _2183 = _2165 * _2153;
    float _2185 = _2125 * _2027;
    float _2187 = fma(_2177, _2177, _2179);
    float _2189 = -_2107;
    float _2191 = _2025 * _2189;
    float _2193 = _2013 * _2107;
    float _2195 = fma(_2041, _2101, _2181);
    float _2197 = _2169 * _2183;
    float _2199 = rsqrt(_2187);
    float _2201 = fma(_2079, _2101, _2193);
    float _2203 = _2185 * _2037;
    float _2205 = fma(_2015, _2101, _2191);
    float _2207 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2209 = fma(_1943, -0.02500000037252902984619140625, 1.0);
    float _2211 = fma(_2085, _2203, _2195);
    float _2213 = fma(_2019, _2203, _2205);
    float _2215 = fma(_2043, _2203, _2201);
    float _2217 = _2207 * _2197;
    float _2219 = _2171 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2221 = _2127 * _2211;
    float _2223 = _2219 * _2219;
    float _2225 = _2159 * _2199;
    float _2227 = _2151 * _2199;
    float _2229 = _2177 * _2199;
    float _2231 = _2135 * _2211;
    float _2233 = _2171 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2235 = _2171 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2237 = _2133 * _2211;
    float _2239 = fma(_2227, _2213, _2231);
    float _2241 = fma(_2233, _2233, _2223);
    float _2243 = fma(_2229, _2213, _2221);
    float _2245 = fma(_2225, _2213, _2237);
    float _2247 = fma(_1745, _2215, _2239);
    float _2249 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2251 = fma(_1679, _2215, _2243);
    float _2253 = fma(_1677, _2215, _2245);
    float _2255 = _1227 + _2247;
    float _2257 = _2217 * 0.15915493667125701904296875;
    float _2259 = fma(_2235, _2235, _2241);
    float _2261 = _1263 + _2253;
    float _2263 = _2255 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2265 = _2255 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2267 = _2255 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2269 = _1271 + _2251;
    float _2271 = fma(_2261, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2263);
    float _2273 = fma(_2261, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2265);
    float _2275 = fma(_2261, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2267);
    float _2277 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2249);
    float _2279 = rsqrt(_2259);
    float _2281 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2273);
    float _2283 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2275);
    float _2285 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2271);
    float _2287 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2277);
    float _2289 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2291 = _2283 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2293 = _2285 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2295 = _2257 * 6.283185482025146484375;
    float _2297 = cos(_2295);
    float _2299 = _2287 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2301 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2303 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2305 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2307 = -_2289;
    float _2309 = _2307 + _2299;
    float _2311 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2301);
    float _2313 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2303);
    float _2315 = _2257 * 6.283185482025146484375;
    float _2317 = sin(_2315);
    float _2319 = fma(_2209, _2309, _2289);
    float _2321 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2305);
    float _2323 = _2233 * _2279;
    float _2325 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2311);
    float _2327 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2313);
    float _2329 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2321);
    float _2331 = -_2297;
    float _2333 = _2331 + 1.0;
    float _2335 = _2219 * _2279;
    float _2337 = _2235 * _2279;
    float _2339 = _2325 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2341 = _2323 * _2333;
    float _2343 = _2335 * _2333;
    float _2345 = _2337 * _2337;
    float _2347 = _2327 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2349 = _2323 * _2317;
    float _2351 = _2335 * _2317;
    float _2353 = fma(_2333, _2345, _2297);
    float _2355 = _2337 * _2317;
    float _2357 = fma(_2337, _2343, _2349);
    float _2359 = -_1227;
    float _2361 = _2359 + _2339;
    float _2363 = -_2351;
    float _2365 = fma(_2337, _2341, _2363);
    float _2367 = -_2355;
    float _2369 = fma(_2335, _2341, _2367);
    float _2371 = -_1263;
    float _2373 = _2371 + _2347;
    float _2375 = _2357 * _2361;
    float _2377 = _2329 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2379 = fma(_2323, _2341, _2297);
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2383 = _2381 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2385 = _2369 * _2361;
    float _2387 = fma(_2365, _2373, _2375);
    float _2389 = -_1271;
    float _2391 = _2389 + _2377;
    float _2393 = fma(_170, _2383, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2395 = fma(_2379, _2373, _2385);
    float _2397 = fma(_2337, _2341, _2351);
    float _2399 = fma(_2353, _2391, _2387);
    float _2401 = fma(_2335, _2343, _2297);
    float _2403 = fma(_2335, _2341, _2355);
    float _2405 = fma(_2397, _2391, _2395);
    float _2407 = fma(_2399, _2393, _1271);
    float _2409 = _2401 * _2361;
    float _2411 = -_2349;
    float _2413 = fma(_2337, _2343, _2411);
    float _2415 = fma(_2405, _2393, _1263);
    float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2419 = _2407 + _2417;
    float _2421 = fma(_2403, _2373, _2409);
    float _2423 = _1449 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2427 = _2415 + _2425;
    float _2429 = _2419 * _2419;
    float _2431 = fma(_2413, _2391, _2421);
    float _2433 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2423);
    float _2435 = fma(_2427, _2427, _2429);
    float _2437 = _1227 + _2431;
    float _2439 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2433);
    float _2441 = sqrt(_2435);
    bool _2443 = _2441 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2445 = _2423;
    float _2447 = _2433;
    float _2449 = _2407;
    if (!_2443)
    {
        _2445 = _2415;
    }
    float _2451 = _2445;
    float _2453 = _2451;
    if (!_2443)
    {
        _2447 = _2437;
    }
    float _2455 = _2447;
    bool _2457 = !_2443;
    float _2459 = _2455;
    if (!_2457)
    {
        float _2461 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2465 = _2441 + _2463;
        float _2467 = _2437 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2469 = rsqrt(_2435);
        float _2471 = _2465 * _2461;
        float _2473 = _2471 * 0.15915493667125701904296875;
        float _2475 = _2473 * 6.283185482025146484375;
        float _2477 = cos(_2475);
        float _2479 = _2473 * 6.283185482025146484375;
        float _2481 = sin(_2479);
        float _2483 = _2477 + (-1.0);
        float _2485 = fma(_2481, _2467, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2487 = _2483 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2489 = _2469 * _2485;
        float _2491 = fma(_2437, _2477, _2487);
        float _2493 = fma(_2427, _2489, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2495 = fma(_2419, _2489, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2459 = _2491;
        _2453 = _2493;
        _2449 = _2495;
    }
    float _2497 = _2459;
    float _2499 = _2453;
    float _2501 = _2449;
    float _2503 = -_1227;
    float _2505 = _2503 + _2497;
    float _2507 = _2439 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2509 = -_1263;
    float _2511 = _2509 + _2499;
    float _2513 = _1449 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2515 = _2505 * _2505;
    float _2517 = -_1271;
    float _2519 = _2517 + _2501;
    float _2521 = 1.0 / _2507;
    float _2523 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2513);
    float _2525 = fma(_2511, _2511, _2515);
    float _2527 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2523);
    float _2529 = fma(_2519, _2519, _2525);
    float _2531 = _2527 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2533 = sqrt(_2529);
    float _2535 = _2531 + _2507;
    float _2537 = _2535 * _2521;
    float _2539 = _2537 * 0.5;
    float _2541 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2543 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2541);
    float _2545 = 1.0 / _2543;
    bool _2547 = _2533 > 0.0;
    bool _2549 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2551 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2553 = _2549 || _2551;
    bool _2555 = isnan(0.5);
    bool _2557 = _2553 || _2555;
    bool _2559 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2561 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2563 = _2559 || _2561;
    bool _2565 = isnan(0.5);
    bool _2567 = _2563 || _2565;
    float _2569 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2571 = _2499;
    float _2573 = _2501;
    float _2575 = _2505;
    if (!_2547)
    {
        _2569 = _2497;
    }
    float _2577 = _2569;
    bool _2579 = !_2547;
    float _2581 = _2577;
    if (!_2579)
    {
        float _2583 = _186 * _186;
        float _2585 = rsqrt(_2529);
        float _2587 = fma(_184, _184, _2583);
        float _2589 = fma(_188, _188, _2587);
        float _2591 = sqrt(_2589);
        float _2593 = _2511 * _2585;
        float _2595 = _2505 * _2585;
        float _2597 = _2519 * _2585;
        bool _2599 = _2591 > 0.0;
        float _2601 = _2591;
        if (!_2599)
        {
            _2601 = _2497;
        }
        float _2603 = _2601;
        bool _2605 = !_2599;
        _2581 = _2603;
        if (!_2605)
        {
            float _2607 = rsqrt(_2589);
            float _2609 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2611 = _186 * _2607;
            float _2613 = _184 * _2607;
            float _2615 = _2595 * _2611;
            float _2617 = _188 * _2607;
            float _2619 = fma(_2593, _2613, _2615);
            float _2621 = _2609 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2623 = fma(_2597, _2617, _2619);
            float _2625 = _2623 * _2621;
            float _2627 = fma(_184, _2625, _2499);
            float _2629 = fma(_186, _2625, _2497);
            float _2631 = fma(_188, _2625, _2501);
            _2581 = _2629;
            _2571 = _2627;
            _2573 = _2631;
            _2575 = _2625;
        }
    }
    float _2633 = _2581;
    float _2635 = _2571;
    float _2637 = _2573;
    float _2639 = _2575;
    float _2641 = -_1435;
    float _2643 = fma(_2641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2633);
    float _2645 = -_1441;
    float _2647 = fma(_2645, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2635);
    float _2649 = -_1455;
    float _2651 = fma(_2649, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2637);
    float _2653 = _2639;
    float _2655 = _2647;
    float _2657 = _2651;
    float _2659 = _2643;
    if (_2557)
    {
        _2653 = 1.0;
    }
    float _2661 = _2653;
    float _2663 = _2661;
    if (_2567)
    {
        _1533 = _2643;
    }
    float _2665 = _1533;
    float _2667 = _2665;
    if (!_2567)
    {
        float _2669 = _1461 * _1461;
        float _2671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2673 = -_1271;
        float _2675 = _2673 + _2637;
        float _2677 = -_1227;
        float _2679 = _2677 + _2633;
        float _2681 = fma(_1465, _1465, _2669);
        float _2683 = -_1263;
        float _2685 = _2683 + _2635;
        float _2687 = fma(_1479, _1479, _2681);
        float _2689 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2691 = sqrt(_2687);
        float _2693 = 1.0 / _2027;
        float _2695 = _2689 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2697 = precise::min(_2691, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2699 = _2697 * _2671;
        float _2701 = _2699 * _2693;
        float _2703 = _2695 * _2701;
        float _2705 = _2675 * _2701;
        float _2707 = fma(_2679, _2703, _1449);
        float _2709 = fma(_2685, _2703, _1453);
        float _2711 = fma(_2695, _2705, _1469);
        _192 = _2701;
        _2667 = _2707;
        _2655 = _2709;
        _2657 = _2711;
        _2659 = _2671;
    }
    float _2713 = _192;
    float _2715 = _2667;
    float _2717 = _2655;
    float _2719 = _2657;
    float _2721 = _2659;
    float _2723 = _2713;
    float _2725 = _2721;
    if (_2557)
    {
        _1535 = 1.0;
    }
    float _2727 = _1535;
    float _2729 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2731 = _2545 * _2729;
    float _2733 = _2727;
    if (!_2557)
    {
        float _2735 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2739 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2737;
        float _2741 = _2735 * 0.15915493667125701904296875;
        float _2743 = _2741 * 6.283185482025146484375;
        float _2745 = cos(_2743);
        float _2747 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2749 = _2747 * 0.15915493667125701904296875;
        float _2751 = _2741 * 6.283185482025146484375;
        float _2753 = sin(_2751);
        float _2755 = 1.0 / _2745;
        float _2757 = _2749 * 6.283185482025146484375;
        float _2759 = cos(_2757);
        float _2761 = _2753 * _2755;
        float _2763 = _2749 * 6.283185482025146484375;
        float _2765 = sin(_2763);
        float _2767 = _2759 * _2761;
        float _2769 = 1.0 / _2739;
        float _2771 = 1.0 / _2767;
        float _2773 = _2765 * _2771;
        float _2775 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2777 = fma(_2731, _2773, _2775);
        float _2779 = _2777 * _2769;
        float _2781 = precise::clamp(_2779, 0.0, 1.0);
        _2723 = _2749;
        _2663 = _2781;
    }
    float _2783 = _2723;
    float _2785 = _2663;
    float _2787 = _2783;
    if (!_2557)
    {
        float _2789 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2791 = _2789 * 0.15915493667125701904296875;
        float _2793 = _2791 * 6.283185482025146484375;
        float _2795 = cos(_2793);
        float _2797 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2799 = _2797 * 0.15915493667125701904296875;
        float _2801 = _2791 * 6.283185482025146484375;
        float _2803 = sin(_2801);
        float _2805 = 1.0 / _2795;
        float _2807 = _2799 * 6.283185482025146484375;
        float _2809 = cos(_2807);
        float _2811 = _2803 * _2805;
        float _2813 = _2799 * 6.283185482025146484375;
        float _2815 = sin(_2813);
        float _2817 = _2809 * _2811;
        float _2819 = 1.0 / _2817;
        float _2821 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2823 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2821;
        float _2825 = 1.0 / _2823;
        float _2827 = _2815 * _2819;
        float _2829 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2831 = fma(_2731, _2827, _2829);
        float _2833 = _2831 * _2825;
        float _2835 = precise::clamp(_2833, 0.0, 1.0);
        float _2837 = -_2835;
        float _2839 = _2837 + 1.0;
        _2787 = _2795;
        _2733 = _2839;
    }
    float _2841 = _2787;
    float _2843 = _2733;
    float _2845 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2847 = _2715 + _2845;
    float _2849 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2851 = _2717 + _2849;
    float _2853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2855 = _2719 + _2853;
    float _2857 = _2847 * _2847;
    float _2859 = fma(_2851, _2851, _2857);
    float _2861 = fma(_2855, _2855, _2859);
    float _2863 = rsqrt(_2861);
    float _2865 = sqrt(_2861);
    float _2867 = _2863 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2869 = _2851 * _2867;
    float _2871 = _2855 * _2867;
    float _2873 = _2869 * _2869;
    float _2875 = _2871 * _2871;
    float _2877 = _2873 + _2875;
    float _2879 = sqrt(_2877);
    bool _2881 = _2879 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2885 = _2879 + _2883;
    float _2887 = _2855;
    float _2889 = _2885;
    float _2891 = _2857;
    if (_2881)
    {
        float _2893 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2887 = _2893;
    }
    float _2895 = _2887;
    if (_2881)
    {
        float _2897 = _2885 * _2895;
        _2889 = _2897;
    }
    float _2899 = _2889;
    if (_2881)
    {
        float _2901 = _2899 * 0.15915493667125701904296875;
        _2891 = _2901;
    }
    float _2903 = _2891;
    float _2905 = _2863;
    float _2907 = _2903;
    if (_2881)
    {
        float _2909 = _2903 * 6.283185482025146484375;
        float _2911 = sin(_2909);
        _2905 = _2911;
    }
    float _2913 = _2905;
    float _2915 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2917 = precise::max(0.0, _2915);
    float _2919 = _2841;
    float _2921 = _2917;
    if (_2881)
    {
        float _2923 = _2903 * 6.283185482025146484375;
        float _2925 = cos(_2923);
        _2919 = _2925;
    }
    float _2927 = _2919;
    float _2929 = -_2867;
    float _2931 = -_2917;
    float _2933 = fma(_2847, _2929, _2931);
    float _2935 = _2915;
    float _2937 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2881)
    {
        float _2939 = rsqrt(_2877);
        _2935 = _2939;
    }
    float _2941 = _2935;
    if (_2881)
    {
        float _2943 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2921 = _2943;
    }
    float _2945 = _2921;
    float _2947 = fma(_1453, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2949 = _2945;
    if (!_2881)
    {
        _2907 = _2869;
    }
    float _2951 = _2907;
    float _2953 = _2913;
    float _2955 = _2951;
    if (_2881)
    {
        float _2957 = fma(_2913, _2945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2949 = _2957;
    }
    float _2959 = _2949;
    float _2961 = _2959;
    if (!_2881)
    {
        _2953 = _2871;
    }
    float _2963 = _2953;
    float _2965 = _2963;
    float _2967 = _2927;
    if (_2881)
    {
        float _2969 = _2927 + (-1.0);
        _2937 = _2969;
    }
    float _2971 = _2937;
    float _2973 = _2971;
    if (_2881)
    {
        float _2975 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2973 = _2975;
    }
    float _2977 = _2973;
    float _2979 = _2941;
    if (_2881)
    {
        float _2981 = _2941 * _2959;
        _2725 = _2981;
    }
    float _2983 = _2725;
    if (!_2881)
    {
        _2979 = _2933;
    }
    float _2985 = _2979;
    float _2987 = _2985;
    if (_2881)
    {
        float _2989 = fma(_2933, _2927, _2977);
        _2987 = _2989;
    }
    float _2991 = _2987;
    if (!_2881)
    {
        _2961 = _2873;
    }
    float _2993 = _2961;
    float _2995 = _2993;
    if (_2881)
    {
        float _2997 = _2869 * _2983;
        _2955 = _2997;
    }
    float _2999 = _2955;
    if (_2881)
    {
        float _3001 = _2871 * _2983;
        _2965 = _3001;
    }
    float _3003 = _2965;
    float _3005 = _2715 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2881)
    {
        _2967 = _2875;
    }
    float _3007 = _2967;
    float _3009 = _3007;
    if (_2881)
    {
        float _3011 = _2999 * _2999;
        _2995 = _3011;
    }
    float _3013 = _2995;
    if (_2881)
    {
        float _3015 = _3003 * _3003;
        _3009 = _3015;
    }
    float _3017 = _3009;
    float _3019 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3005);
    float _3021 = fma(_2991, _2991, _3013);
    float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3025 = fma(_2865, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3023);
    float _3027 = precise::clamp(_3025, 0.0, 1.0);
    float _3029 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3019);
    float _3031 = floor(_2947);
    float _3033 = _3021 + _3017;
    float _3035 = _3029 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3037 = -_3027;
    float _3039 = _3037 + 1.0;
    float _3041 = fma(_1469, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3043 = _2715 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3045 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3047 = rsqrt(_3033);
    float _3049 = _3035 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3051 = _2715 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3053 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3043);
    float _3055 = -_3049;
    float _3057 = fma(_3055, _3045, 1.0);
    float _3059 = _2715 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3061 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3051);
    float _3063 = abs(_3039);
    float _3065 = log2(_3063);
    float _3067 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3053);
    float _3069 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3059);
    float _3071 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3061);
    float _3073 = -_3031;
    float _3075 = _2947 + _3073;
    float _3077 = _3067 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3079 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3069);
    float _3081 = _3071 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3083 = _3047 * _2999;
    float _3085 = _3047 * _2991;
    float _3087 = _3047 * _3003;
    float _3089 = _3079 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3091 = _3083 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3093 = _3081 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3095 = floor(_3041);
    float _3097 = _3081 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3099 = -_3091;
    float _3101 = fma(_3085, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3099);
    float _3103 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3093);
    float _3105 = _3065 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3107 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3097);
    float _3109 = -_3087;
    float _3111 = fma(_3109, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3101);
    float _3113 = fma(_3035, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3103);
    float _3115 = log2(_3057);
    float _3117 = fma(_3111, -0.5, 0.5);
    float _3119 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3113);
    float _3121 = fma(_3111, 0.5, 0.5);
    float _3123 = exp2(_3105);
    float _3125 = _3081 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3127 = fma(_3121, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3129 = -_3095;
    float _3131 = _3041 + _3129;
    float _3133 = _3085 + 1.0;
    float _3135 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3125);
    float _3137 = fma(_3121, _3127, -0.212114393711090087890625);
    float _3139 = fma(_3035, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3107);
    float _3141 = 1.0 / _3119;
    float _3143 = fma(_3035, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3135);
    float _3145 = fma(_3121, _3137, 1.570728778839111328125);
    float _3147 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3143);
    float _3149 = sqrt(_3117);
    float _3151 = -_3085;
    float _3153 = fma(_3123, _3133, _3151);
    float _3155 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3139);
    float _3157 = _3115 * 0.693147182464599609375;
    float2 _8621 = float2(_3075, _3131);
    float _3159 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8621, float2(0.0), isnan(_8621)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8621, float2(0.0), isnan(_8621)), level(0.0)).x;
    float _3161 = fma(_3153, 0.5, 0.5);
    float _3163 = _3157 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3165 = _3147 * _3141;
    float _3167 = _3155 * _3141;
    float _3169 = fma(_3165, 0.5, 0.5);
    float _3171 = fma(_3167, -0.5, 0.5);
    float _3173 = _3149 * 0.636619746685028076171875;
    float3 _8651 = float3(_3169, _3171, _3163);
    float _3175 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8651, float3(0.0), isnan(_8651)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8651, float3(0.0), isnan(_8651)), level(0.0)).x;
    float _3177 = -_3145;
    float _3179 = fma(_3173, _3177, 1.0);
    float3 _8667 = float3(_3169, _3171, _3163);
    float4 _3182 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8667, float3(0.0), isnan(_8667)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8667, float3(0.0), isnan(_8667)), level(0.0)).xyzw;
    float _3184 = _3182.x;
    float _3186 = _3182.y;
    float _3188 = _3182.z;
    float _3190 = _3182.w;
    float2 _8683 = float2(_3179, _3161);
    float3 _3194 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8683, float2(0.0), isnan(_8683)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8683, float2(0.0), isnan(_8683)), level(0.0)).xyz;
    float _3196 = _3194.x;
    float _3198 = _3194.y;
    float _3200 = _3194.z;
    float _3202 = abs(_2731);
    float _3204 = log2(_3202);
    bool _3206 = _2035 != 0.0;
    bool _3208 = isnan(_2035);
    bool _3210 = _3206 || _3208;
    bool _3212 = isnan(0.0);
    bool _3214 = _3210 || _3212;
    out.m_67.x = _1421;
    out.m_67.y = _1423;
    out.m_67.z = _1425;
    out.m_67.w = _1419;
    float _3216 = _3065 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3218 = _2033 == 0.0;
    bool _3220 = !_3214;
    bool _3222 = _3218 && _3220;
    out.m_69.x = _1417;
    out.m_69.y = _1427;
    out.m_69.z = _1429;
    out.m_69.w = _1397;
    float _3224 = _3081 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3226 = _2037 == 0.0;
    bool _3228 = _3226 && _3222;
    float _3230 = exp2(_3216);
    float _3232 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3224);
    float _3234 = _3204 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3236 = _2017 * _2133;
    float _3238 = in.m_75.x;
    float _3240 = in.m_75.y;
    float _3242 = in.m_75.z;
    float _3244 = _2041 * _2135;
    float _3246 = _2017 * _2135;
    float _3248 = -_2025;
    float _3250 = fma(_3248, _2225, _3236);
    float _3252 = exp2(_3234);
    float _3254 = _2041 * _2133;
    float _3256 = _2085 * _2135;
    float _3258 = _2079 * _1745;
    float _3260 = -_2025;
    float _3262 = fma(_3260, _2227, _3246);
    float _3264 = fma(_2015, _2227, _3244);
    float _3266 = fma(_2015, _2225, _3254);
    float _3268 = fma(_2019, _2227, _3256);
    bool _3270 = _2731 <= 8000.0;
    bool _3272 = isnan(_2731);
    bool _3274 = _3270 || _3272;
    bool _3276 = isnan(8000.0);
    bool _3278 = _3274 || _3276;
    float _3280 = float(_3278);
    float _3282 = fma(_3035, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3232);
    float _3284 = _2041 * _2127;
    float _3286 = -_3230;
    float _3288 = _3286 + 1.0;
    float _3290 = _3258 + _3264;
    float _3292 = fma(_2015, _2229, _3284);
    float _3294 = fma(_3252, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3296 = precise::clamp(_3294, 0.0, 1.0);
    float _3298 = fma(_3296, -2.0, 3.0);
    float _3300 = _3296 * _3296;
    float _3302 = _3242;
    float _3304 = _3240;
    float _3306 = _3238;
    if (!_3228)
    {
        float _3308 = fma(_2037, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3242);
        _3302 = _3308;
    }
    float _3310 = _3302;
    float _3312 = _2013 * _1677;
    if (!_3228)
    {
        float _3314 = fma(_2035, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3240);
        _3304 = _3314;
    }
    float _3316 = _3304;
    float _3318 = _3300 * _3298;
    if (!_3228)
    {
        float _3320 = fma(_2033, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3238);
        _3306 = _3320;
    }
    float _3322 = _3306;
    float _3324 = _3312 + _3250;
    float _3326 = _2013 * _1745;
    float _3328 = -_3318;
    float _3330 = _3328 + 1.0;
    float _3332 = in.m_77.x;
    float _3334 = _2079 * _1677;
    float _3336 = _2043 * _1745;
    float _3338 = fma(_3330, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3318);
    float _3340 = _3324 * _3316;
    float _3342 = _3334 + _3266;
    float _3344 = _3336 + _3268;
    float _3346 = _2017 * _2127;
    float _3348 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3282);
    float _3350 = _3280 * _3338;
    float _3352 = _3326 + _3262;
    float _3354 = fma(_3342, _3322, _3340);
    float _3356 = _2013 * _1679;
    float _3358 = -_2025;
    float _3360 = fma(_3358, _2229, _3346);
    float _3362 = _3348 + _3119;
    float _3364 = _3350 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3366 = _3352 * _3316;
    float _3368 = _2085 * _2133;
    float _3370 = _2079 * _1679;
    float _3372 = _2085 * _2127;
    float _3374 = _3356 + _3360;
    float _3376 = _3362 * 0.5;
    float _3378 = _3288 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3380 = fma(_3290, _3322, _3366);
    float _3382 = _2043 * _1677;
    float _3384 = fma(_2019, _2225, _3368);
    float _3386 = _2043 * _1679;
    float _3388 = fma(_2019, _2229, _3372);
    float _3390 = _3370 + _3292;
    float _3392 = _3374 * _3316;
    float _3394 = _3382 + _3384;
    float _3396 = _3386 + _3388;
    out.m_79.z = _3376;
    out.m_79.w = _3119;
    float _3398 = fma(_3390, _3322, _3392);
    float _3400 = fma(_3394, _3310, _3354);
    float _3402 = fma(_3344, _3310, _3380);
    float _3404 = fma(_3396, _3310, _3398);
    bool _3406 = _2865 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3408 = isnan(_2865);
    bool _3410 = _3406 || _3408;
    bool _3412 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3414 = _3410 || _3412;
    out.gl_Position.x = _3147;
    out.gl_Position.y = _3155;
    out.gl_Position.z = _3348;
    out.gl_Position.w = _3119;
    float _3416 = -_3378;
    float _3418 = _3416 + 1.0;
    out.m_81.x = _3400;
    out.m_81.y = _3402;
    out.m_81.z = _3404;
    float _3420 = _3119;
    float _3422 = _3418;
    float _3424 = _3378;
    if (!_3414)
    {
        _3420 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3426 = _3420;
    float _3428 = -_3159;
    float _3430 = _3428 + 1.0;
    float _3432 = _3430 * _3364;
    float _3434 = precise::clamp(_3432, 0.0, 1.0);
    float _3436 = -_3434;
    float _3438 = fma(_3436, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3440 = _3438 * _3332;
    float _3442 = _3378 * _3175;
    float _3444 = _3332;
    float _3446 = _3426;
    float _3448 = _3426;
    if (!_3414)
    {
        _3444 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3450 = _3444;
    float _3452 = _3440 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3454 = _2785 * _2843;
    float _3456 = _3190 * _3442;
    float _3458 = _3190 * _3418;
    float _3460 = _3456;
    float _3462 = _3454;
    float _3464 = _3450;
    float _3466 = _3450;
    if (!_3414)
    {
        _3422 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3468 = _3422;
    out.m_83.x = _3452;
    float _3470 = _3200 * _3442;
    float _3472 = fma(_3196, _3456, _3184);
    float _3474 = fma(_3198, _3456, _3186);
    float _3476 = _3454 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3478 = fma(_3190, _3470, _3188);
    float _3480 = _3468;
    float _3482 = _3468;
    if (!_3414)
    {
        _3460 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3484 = _3460;
    float _3486 = _3484;
    float _3488 = _3484;
    if (!_3414)
    {
        _3424 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3490 = _3424;
    out.m_85.x = _3472;
    out.m_85.y = _3474;
    out.m_85.z = _3478;
    out.m_85.w = _3458;
    float _3492 = _3490;
    float _3494 = _3490;
    if (!_3414)
    {
        _3462 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3496 = _3462;
    bool _3498 = !_3414;
    float _3500 = _3496;
    float _3502 = _3496;
    if (!_3498)
    {
        bool _3504 = _2865 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3506 = isnan(_2865);
        bool _3508 = _3504 || _3506;
        bool _3510 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3512 = _3508 || _3510;
        if (!_3512)
        {
            float _3514 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3516 = _2865 + _3514;
            float _3518 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3520 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3518;
            float _3522 = 1.0 / _3520;
            float _3524 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3526 = _3524 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3528 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3530 = _3528 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3532 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3534 = _3532 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3536 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3538 = _3536 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3540 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3542 = _3540 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3544 = _3516 * _3522;
            float _3546 = precise::clamp(_3544, 0.0, 1.0);
            float _3548 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3550 = _3548 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3552 = fma(_3546, _3526, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3554 = fma(_3546, _3550, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3556 = fma(_3546, _3530, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3558 = fma(_3546, _3534, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3560 = fma(_3546, _3538, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3562 = fma(_3546, _3542, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3488 = _3554;
            _3494 = _3560;
            _3466 = _3552;
            _3482 = _3558;
            _3448 = _3556;
            _3502 = _3562;
            _3564 = true;
        }
        else
        {
            bool _3566 = _2865 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3568 = isnan(_2865);
            bool _3570 = _3566 || _3568;
            bool _3572 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3574 = _3570 || _3572;
            if (!_3574)
            {
                _3464 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3576 = _3464;
            _3466 = _3576;
            if (!_3574)
            {
                _3486 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3578 = _3486;
            _3488 = _3578;
            if (!_3574)
            {
                _3446 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3580 = _3446;
            _3448 = _3580;
            if (!_3574)
            {
                _3480 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3582 = _3480;
            _3482 = _3582;
            if (!_3574)
            {
                _3492 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3584 = _3492;
            _3494 = _3584;
            if (!_3574)
            {
                _3500 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3586 = _3500;
            bool _3588 = !_3574;
            _3502 = _3586;
            if (!_3588)
            {
                bool _3590 = _2865 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3592 = isnan(_2865);
                bool _3594 = _3590 || _3592;
                bool _3596 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3598 = _3594 || _3596;
                if (!_3598)
                {
                    float _3600 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3602 = _2865 + _3600;
                    float _3604 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3606 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3604;
                    float _3608 = 1.0 / _3606;
                    float _3610 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3612 = _3610 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3614 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3616 = _3614 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3618 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3620 = _3618 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3622 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3624 = _3622 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3626 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3628 = _3626 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3630 = _3602 * _3608;
                    float _3632 = precise::clamp(_3630, 0.0, 1.0);
                    float _3634 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3636 = _3634 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3638 = fma(_3632, _3612, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3640 = fma(_3632, _3636, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3642 = fma(_3632, _3616, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3644 = fma(_3632, _3620, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3646 = fma(_3632, _3624, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3648 = fma(_3632, _3628, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3488 = _3640;
                    _3494 = _3646;
                    _3466 = _3638;
                    _3482 = _3644;
                    _3448 = _3642;
                    _3502 = _3648;
                    _3564 = true;
                }
                else
                {
                    _3488 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3494 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3466 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3482 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3448 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3502 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3564 = false;
    float _3650 = _3488;
    float _3652 = _3494;
    float _3654 = _3466;
    float _3656 = _3482;
    float _3658 = _3448;
    float _3660 = _3502;
    float _3662 = fma(_3402, -0.5, 0.5);
    float _3664 = precise::clamp(_3662, 0.0, 1.0);
    float _3666 = -_3650;
    float _3668 = _3666 + _3652;
    float _3670 = -_3654;
    float _3672 = _3670 + _3656;
    out.m_87.x = 0.0;
    float _3674 = fma(_3664, _3668, _3650);
    float _3676 = -_3658;
    float _3678 = _3676 + _3660;
    float _3680 = fma(_3664, _3672, _3654);
    float _3682 = _3674 * 0.586610972881317138671875;
    bool _3684 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3686 = fma(_3664, _3678, _3658);
    float _3688 = _3476 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3690 = fma(_3680, 0.298911988735198974609375, _3682);
    bool _3692 = _2785 > 0.0;
    bool _3694 = isnan(_2785);
    bool _3696 = _3692 || _3694;
    bool _3698 = isnan(0.0);
    bool _3700 = _3696 || _3698;
    float _3702 = fma(_3686, 0.114477999508380889892578125, _3690);
    out.m_49.x = _3688;
    bool _3704 = _2843 <= 0.0;
    bool _3706 = !_3700;
    bool _3708 = _3704 || _3706;
    float _3710 = -_3702;
    float _3712 = _3680 + _3710;
    float _3714 = -_3702;
    float _3716 = _3674 + _3714;
    float _3718 = -_3702;
    float _3720 = _3686 + _3718;
    float _3722 = fma(_3712, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3702);
    float _3724 = fma(_3716, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3702);
    float _3726 = fma(_3720, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3702);
    bool _3728 = !_3684;
    if (!_3728)
    {
        float _3730 = -_2715;
        float _3732 = _3730 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3734 = -_2717;
        float _3736 = _3734 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3738 = -_2719;
        float _3740 = _3738 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3742 = _3732 * _3732;
        float _3744 = fma(_3736, _3736, _3742);
        float _3746 = fma(_3740, _3740, _3744);
        float _3748 = sqrt(_3746);
        float _3750 = rsqrt(_3746);
        float _3752 = -_3748;
        float _3754 = _3752 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3756 = _3754 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3758 = precise::clamp(_3756, 0.0, 1.0);
        float _3760 = _3736 * _3750;
        float _3762 = _3732 * _3750;
        float _3764 = abs(_3758);
        float _3766 = log2(_3764);
        float _3768 = _3740 * _3750;
        float _3770 = _3760 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3772 = _3402 * _3762;
        float _3774 = -_3762;
        float _3776 = -_3770;
        float _3778 = fma(_3774, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3776);
        float _3780 = fma(_3400, _3760, _3772);
        float _3782 = -_3768;
        float _3784 = fma(_3782, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3778);
        float _3786 = fma(_3404, _3768, _3780);
        float _3788 = precise::clamp(_3786, 0.0, 1.0);
        float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3792 = _3784 + _3790;
        float _3794 = _3766 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3796 = _3792 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3798 = precise::clamp(_3796, 0.0, 1.0);
        float _3800 = exp2(_3794);
        float _3802 = _3800 * _3798;
        float _3804 = _3788 * _3802;
        float _3806 = _3804 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3808 = _3804 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3810 = _3804 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3806;
        out.m_87.y = _3808;
        out.m_87.z = _3810;
    }
    out.m_89.x = _3722;
    out.m_89.y = _3724;
    out.m_89.z = _3726;
    if (!_3708)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3812 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3812;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3564 = false;
    bool _440 = false;
    bool _320 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3870 = as_type<float>(_124);
        out.gl_Position.z = _3870;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_51.w;
    float _130 = float(_108);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = _134;
    if (_150)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_150)
    {
        out.m_49.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _126 = as_type<int>(_156);
    }
    int _158 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3934 = as_type<float>(_158);
        out.gl_Position.z = _3934;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = 1.0 / _130;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _134 * _166;
    float _172 = _162 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _174 = _162 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _162 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _178 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[4].x, _172);
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_160, (*spvDescriptorSet0.vp_c10)._m0[6].x, _176);
    float _184 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].z, _178);
    float _186 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    bool _190 = !_168;
    float _192 = _188;
    float _210;
    if (!_190)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        _210 = _170;
    }
    _212 = false;
    float _214 = _210;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = _214 + _216;
    bool _220 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _222 = isnan(_214);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _232;
    bool _236 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _238 = isnan(_214);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -_230;
    float _250 = _248 + 1.0;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _252;
    float _256 = 1.0 / _234;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _260 = _246 * _250;
    float _262 = -_246;
    float _264 = _262 + 1.0;
    float _266 = _218 * _256;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _268;
    float _272 = fma(_254, _266, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = fma(_270, _266, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _280 = fma(_276, _266, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _282 = _272 * _260;
    float _284 = _278 * _260;
    float _286 = _280 * _260;
    float _288 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].x, _282);
    float _290 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _292 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].z, _284);
    float _294 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[144].x, _288);
    float _296 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[144].y, _290);
    float _298 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[144].z, _292);
    bool _300 = !_258;
    float _318;
    if (!_300)
    {
        float _302 = in.m_55.x;
        float _304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _306 = _302 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _310 = _308 * _304;
        float _312 = floor(_310);
        float _314 = -_312;
        float _316 = _310 + _314;
        _318 = _316;
        _320 = true;
    }
    else
    {
        _318 = _170;
    }
    _320 = false;
    float _322 = _318;
    float _324 = in.m_57.x;
    float _326 = in.m_57.y;
    float _328 = in.m_57.z;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _332 = _322 + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _334;
    bool _338 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _340 = isnan(_322);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    bool _350 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _352 = 1.0 / _336;
    float _354 = _298 * _328;
    bool _356 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _358 = isnan(_322);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _332 * _352;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _370;
    float _374 = _296 * _326;
    float _376 = -_366;
    float _378 = _376 + 1.0;
    float _380 = _294 * _324;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _386;
    float _390 = _348 * _378;
    float _392 = fma(_372, _368, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _394 = fma(_384, _368, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _396 = fma(_388, _368, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _398 = -_348;
    float _400 = _398 + 1.0;
    float _402 = _392 * _390;
    float _404 = _394 * _390;
    float _406 = _396 * _390;
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _402);
    float _410 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _404);
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _406);
    float _414 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[108].y, _408);
    float _416 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[108].x, _410);
    float _418 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[108].z, _412);
    bool _420 = !_350;
    float _438;
    if (!_420)
    {
        float _422 = in.m_55.x;
        float _424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _426 = _422 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _428 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _430 = _428 * _424;
        float _432 = floor(_430);
        float _434 = -_432;
        float _436 = _430 + _434;
        _438 = _436;
        _440 = true;
    }
    else
    {
        _438 = _170;
    }
    _440 = false;
    float _442 = _438;
    float _444 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _446 = int(_444);
    float _448 = in.m_55.x;
    float _450 = in.m_55.y;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _454 = int(_452);
    float _456 = float(_446);
    float _458 = 1.0 / _456;
    float _460 = float(uint(_454));
    float _462 = _450 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _464 = ~_454;
    int _466 = _464 + 1;
    int _468 = ~_454;
    int _470 = _468 + 1;
    float _472 = 1.0 / _460;
    int _474 = ~_454;
    int _476 = _474 + 1;
    float _478 = _458 * _134;
    float _480 = trunc(_478);
    int _482 = int(_480);
    int _484 = as_type<int>(_472) + (-2);
    float _486 = float(uint(_482));
    float _488 = float(_482);
    float _490 = as_type<float>(_484) * _486;
    float _492 = trunc(_490);
    float _494 = precise::max(_492, 0.0);
    uint _497 = uint(_494);
    int _499 = _466 * int(_497);
    int _501 = _499 + _482;
    float _503 = float(uint(_501));
    float _505 = as_type<float>(_484) * _503;
    float _507 = trunc(_505);
    float _509 = precise::max(_507, 0.0);
    uint _511 = uint(_509);
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _515 = _513 != 0;
    bool _517 = !_515;
    float _519 = _517 ? 7.345489978790283203125 : 1.0;
    float _521 = _519 * _448;
    float _523 = floor(_521);
    int _525 = int(_497) + int(_511);
    float _527 = float(_454);
    int _529 = _470 * _525;
    int _531 = _529 + _482;
    bool _533 = _488 >= _527;
    bool _535 = isnan(_488);
    bool _537 = _533 || _535;
    bool _539 = isnan(_527);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    bool _545 = uint(_531) >= uint(_454);
    float _547 = trunc(_543);
    int _549 = int(_547);
    bool _551 = !_545;
    int _553 = _551 ? 0 : (-1);
    float _555 = -_523;
    float _557 = _521 + _555;
    bool _559 = _454 == 0;
    int _561 = ~_525;
    int _563 = _561 + _553;
    int _565 = _563 + 1;
    int _567 = _454 * _565;
    int _569 = _567 + _482;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _573 = _571 != 0;
    int _575 = ~_549;
    int _577 = _575 + 1;
    int _579 = _577 + 1;
    bool _581 = !_559;
    int _583 = _581 ? _569 : (-1);
    float _585 = _557 * _527;
    float _587 = _527 * _134;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _591 = _589 != 0;
    int _593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _595 = _593 != 0;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _599 = _597 != 0;
    int _601 = _583 * _579;
    float _603 = _587 * _166;
    int _605 = _454 + (-1);
    float _607 = trunc(_585);
    int _609 = int(_607);
    bool _611 = !_595;
    int _613 = _611 ? 0 : 1;
    bool _615 = !_591;
    int _617 = _615 ? 0 : 1;
    int _619 = _549 * _605;
    int _621 = _619 + _601;
    bool _623 = !_573;
    int _625 = _623 ? 0 : 1;
    int _627 = abs(_613);
    float _629 = trunc(_603);
    int _631 = int(_629);
    int _633 = abs(_625);
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _637 = _635 != 0;
    int _639 = _621 * _627;
    bool _641 = !_599;
    int _643 = _641 ? 0 : 1;
    int _645 = abs(_617);
    bool _647 = !_637;
    int _649 = _647 ? 0 : 1;
    int _651 = abs(_643);
    int _653 = _609 * _633;
    int _655 = _653 + _482;
    int _657 = abs(_649);
    int _659 = _631 * _645;
    int _661 = _659 + _639;
    int _663 = ~_454;
    int _665 = _663 + 1;
    int _667 = _655 * _651;
    int _669 = _667 + _661;
    int _671 = ~_454;
    int _673 = _671 + 1;
    float _675 = float(uint(_655));
    int _677 = _609 * _657;
    int _679 = _677 + _669;
    float _681 = as_type<float>(_484) * _675;
    float _683 = float(uint(_679));
    float _685 = as_type<float>(_484) * _683;
    float _687 = trunc(_681);
    float _689 = precise::max(_687, 0.0);
    uint _691 = uint(_689);
    float _693 = trunc(_685);
    float _695 = precise::max(_693, 0.0);
    uint _697 = uint(_695);
    int _699 = _673 * int(_697);
    int _701 = _699 + _679;
    float _703 = float(uint(_701));
    float _705 = as_type<float>(_484) * _703;
    float _707 = trunc(_705);
    float _709 = precise::max(_707, 0.0);
    uint _711 = uint(_709);
    int _713 = int(_697) + int(_711);
    int _715 = ~_454;
    int _717 = _715 + 1;
    int _719 = _665 * _713;
    int _721 = _719 + _679;
    bool _723 = uint(_721) >= uint(_454);
    bool _725 = !_723;
    int _727 = _725 ? 0 : (-1);
    int _729 = ~_713;
    int _731 = _729 + _727;
    int _733 = _731 + 1;
    int _735 = _454 * _733;
    int _737 = _735 + _679;
    bool _739 = !_559;
    int _741 = _739 ? _737 : (-1);
    int _743 = _717 * int(_691);
    int _745 = _743 + _655;
    int _747 = _741 >> 31;
    float _749 = float(uint(_745));
    int _751 = _747 & 3;
    int _753 = _741 & 3;
    bool _755 = _753 != 0;
    float _757 = as_type<float>(_484) * _749;
    int _759 = _741 + _751;
    int _761 = _759 >> 2;
    float _763 = trunc(_757);
    float _765 = precise::max(_763, 0.0);
    uint _767 = uint(_765);
    int _769 = _761 << 4;
    int _771 = _769 + 368;
    int _773 = _741 & 3;
    bool _775 = _773 != 0;
    uint _777 = uint(int(uint(_771) >> uint(2)));
    uint _779 = uint(int(uint(int(_777)) >> uint(2)));
    int _781 = int(_777) & 3;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[int(_779)][_781];
    int _785 = int(_777) + 1;
    uint _787 = uint(int(uint(_785) >> uint(2)));
    int _789 = _785 & 3;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[int(_787)][_789];
    int _793 = _755 ? 0 : 1;
    bool _795 = uint(_773) > 1u;
    bool _797 = _773 != 3;
    bool _799 = uint(_773) >= 2u;
    int _801 = _771 + 8;
    uint _803 = uint(int(uint(_801) >> uint(2)));
    uint _805 = uint(int(uint(int(_803)) >> uint(2)));
    int _807 = int(_803) & 3;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[int(_805)][_807];
    int _811 = int(_803) + 1;
    uint _813 = uint(int(uint(_811) >> uint(2)));
    int _815 = _811 & 3;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[int(_813)][_815];
    int _819 = int(_691) + int(_767);
    int _821 = _799 ? 0 : 1;
    int _823 = ~_793;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    int _829 = _476 * _819;
    int _831 = _829 + _655;
    int _833 = _827;
    if (!_795)
    {
        int _835 = ~_793;
        int _837 = _835 + 1;
        _833 = _837;
    }
    int _839 = _833;
    bool _841 = _773 != 3;
    bool _843 = uint(_831) >= uint(_454);
    float _845 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _847 = int(_845);
    bool _849 = !_775;
    int _851 = _849 ? 0 : 1;
    bool _853 = !_843;
    int _855 = _853 ? 0 : (-1);
    int _857 = abs(_839);
    int _859 = ~_819;
    int _861 = _859 + _855;
    int _863 = _861 + 1;
    int _865 = ~_821;
    int _867 = _865 + 1;
    int _869 = _867 + 1;
    int _871 = _869;
    if (_797)
    {
        int _873 = ~_821;
        int _875 = _873 + 1;
        _871 = _875;
    }
    int _877 = _871;
    int _879 = _454 * _863;
    int _881 = _879 + _655;
    bool _883 = !_841;
    int _885 = _883 ? 0 : (-1);
    int _887 = abs(_851);
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _891 = _889 != 0;
    int _893 = abs(_877);
    int _895 = ~_857;
    int _897 = _895 + 1;
    int _899 = _897 + 1;
    int _901 = abs(_885);
    bool _903 = !_891;
    int _905 = _903 ? 0 : 1;
    int _907 = ~_887;
    int _909 = _907 + 1;
    int _911 = _909 + 1;
    int _913 = _899 * as_type<int>(_791);
    int _915 = abs(_905);
    int _917 = _911 * as_type<int>(_783);
    int _919 = _917 + _913;
    int _921 = ~_893;
    int _923 = _921 + 1;
    int _925 = _923 + 1;
    float _927 = in.m_59.z;
    int _929 = abs(_847);
    int _931 = ~_901;
    int _933 = _931 + 1;
    int _935 = _933 + 1;
    int _937 = _925 * as_type<int>(_809);
    int _939 = _937 + _919;
    float _941 = in.m_59.x;
    int _943 = _935 * as_type<int>(_817);
    int _945 = _943 + _939;
    float _947 = float(uint(_929));
    float _949 = float(uint(_847));
    int _951 = ~_915;
    int _953 = _951 + 1;
    int _955 = _953 + 1;
    float _957 = 1.0 / _947;
    bool _959 = !_559;
    int _961 = _959 ? _881 : (-1);
    int _963 = _945 * _955;
    float _965 = in.m_59.y;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _969 = _967 != 0;
    int _971 = _961 * _915;
    int _973 = _971 + _963;
    float _975 = 1.0 / _949;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _979 = _977 != 0;
    out.m_61.z = _927;
    int _981 = ~_929;
    int _983 = _981 + 1;
    int _985 = abs(_973);
    float _987 = float(uint(_973));
    out.m_61.x = _941;
    int _989 = as_type<int>(_957) + (-2);
    float _991 = _448 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _993 = float(uint(_985));
    float _995 = 0.0;
    if (_969)
    {
        float _997 = in.m_55.x;
        _995 = _997;
    }
    float _999 = _995;
    float _1001 = as_type<float>(_989) * _993;
    int _1003 = as_type<int>(_975) + (-2);
    float _1005 = in.m_63.y;
    int _1007 = ~_847;
    int _1009 = _1007 + 1;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1013 = _1011 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1019 = as_type<float>(_1003) * _987;
    float _1021 = trunc(_1001);
    float _1023 = precise::max(_1021, 0.0);
    uint _1025 = uint(_1023);
    out.m_61.y = _965;
    bool _1027 = _450 > 0.5;
    float _1029 = in.m_46.x;
    float _1031 = in.m_46.y;
    float _1033 = in.m_46.z;
    float _1035 = trunc(_1019);
    float _1037 = precise::max(_1035, 0.0);
    uint _1039 = uint(_1037);
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1045 = -_1041;
    float _1047 = fma(_991, 2.0, _1045);
    bool _1049 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1051 = isnan(_442);
    bool _1053 = _1049 || _1051;
    bool _1055 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1057 = _1053 || _1055;
    float _1059 = float(_1057);
    int _1061 = _983 * int(_1025);
    int _1063 = _1061 + _985;
    float _1065 = 1.0 / _1017;
    float _1067 = -_1005;
    float _1069 = _1067 + 1.0;
    float _1071 = float(uint(_1063));
    int _1073 = _1009 * int(_1039);
    int _1075 = _1073 + _973;
    float _1077 = 1.0 / _1013;
    float _1079 = as_type<float>(_989) * _1071;
    float _1081 = _1005;
    if (_979)
    {
        float _1083 = _1027 ? _1069 : _1005;
        _1081 = _1083;
    }
    float _1085 = _1081;
    float _1087 = fma(_462, -2.0, _1043);
    float _1089 = float(uint(_1075));
    float _1091 = in.m_63.x;
    float _1093 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1095 = trunc(_1079);
    float _1097 = precise::max(_1095, 0.0);
    uint _1099 = uint(_1097);
    float _1101 = as_type<float>(_1003) * _1089;
    float _1103 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1105 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1107;
    float _1111 = fma(_1029, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1093);
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1117 = fma(_1029, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1103);
    float _1119 = trunc(_1101);
    float _1121 = precise::max(_1119, 0.0);
    uint _1123 = uint(_1121);
    float _1125 = fma(_1029, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1105);
    float _1127 = _1109 * _1065;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1131 = _442 + _1129;
    float _1133 = fma(_1033, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1111);
    float _1135 = _1115 * _1077;
    int _1137 = ~_929;
    int _1139 = _1137 + 1;
    float _1141 = fma(_1033, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1117);
    int _1143 = int(_1025) + int(_1099);
    float _1145 = fma(_1127, _1131, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1147 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1149 = isnan(_442);
    bool _1151 = _1147 || _1149;
    bool _1153 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1155 = _1151 || _1153;
    float _1157 = float(_1155);
    float _1159 = fma(_1033, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1125);
    int _1161 = ~_847;
    int _1163 = _1161 + 1;
    int _1165 = _1139 * _1143;
    int _1167 = _1165 + _985;
    bool _1169 = _999 > 0.5;
    bool _1171 = _1169 && _969;
    float _1173 = -_1157;
    float _1175 = _1173 + 1.0;
    int _1177 = int(_1039) + int(_1123);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1181 = _442 + _1179;
    bool _1183 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1185 = isnan(_442);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1191 = _1187 || _1189;
    float _1193 = float(_1191);
    float _1195 = as_type<float>(_1099);
    float _1197 = _1193;
    if (_969)
    {
        _1195 = _1091;
    }
    float _1199 = _1195;
    int _1201 = _1163 * _1177;
    int _1203 = _1201 + _973;
    bool _1205 = uint(_1167) >= uint(_929);
    float _1207 = _1193 * _1175;
    float _1209 = -_1193;
    float _1211 = _1209 + 1.0;
    float _1213 = fma(_1135, _1181, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1215 = uint(_1203) >= uint(_847);
    float _1217 = _1199;
    if (_1171)
    {
        float _1219 = -_1199;
        float _1221 = _1219 + 1.0;
        _1217 = _1221;
    }
    float _1223 = _1217;
    float _1225 = _1059 * _1211;
    float _1227 = _1141 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1229 = !_1215;
    int _1231 = _1229 ? 0 : (-1);
    float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1235 = _1145 * _1225;
    bool _1237 = !_1205;
    int _1239 = _1237 ? 0 : (-1);
    float _1241 = -_1059;
    float _1243 = _1241 + 1.0;
    if (!_969)
    {
        _1197 = _1091;
    }
    float _1245 = _1197;
    float _1247 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1249 = _1227 + _1247;
    float _1251 = _1245;
    if (_969)
    {
        _1251 = _1223;
    }
    float _1253 = _1251;
    float _1255 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1235);
    int _1257 = ~_1177;
    int _1259 = _1257 + _1231;
    int _1261 = _1259 + 1;
    float _1263 = _1133 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1265 = ~_1239;
    int _1267 = _1143 + _1265;
    int _1269 = _1267 + 1;
    float _1271 = _1159 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1273 = _973 ^ _847;
    float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1277 = _1263 + _1275;
    float _1279 = _1249 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1283 = _1271 + _1281;
    uint _1285 = uint(int(uint(_1273) >> uint(31)));
    float _1287 = fma(_1213, _1207, _1255);
    float _1289 = fma(_1277, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1279);
    bool _1291 = _847 == 0;
    int _1293 = ~int(_1285);
    int _1295 = _1293 + 1;
    float _1297 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1289);
    bool _1299 = _847 == 0;
    int _1301 = _847 * _1261;
    int _1303 = _1301 + _973;
    int _1305 = _1269 ^ _1295;
    float _1307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1309 = _1297 >= 0.0;
    int _1311 = ~_1295;
    int _1313 = _1311 + _1305;
    int _1315 = _1313 + 1;
    bool _1317 = !_1291;
    int _1319 = _1317 ? _1303 : (-1);
    float _1321 = in.m_59.w;
    float _1323 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1325 = float(_1319);
    float _1327 = -_134;
    float _1329 = fma(_1327, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1047);
    float _1331 = fma(_1323, _1253, -0.5);
    bool _1333 = !_1299;
    int _1335 = _1333 ? _1315 : (-1);
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1339 = fma(_1323, _1325, _1329);
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1343 = float(_1335);
    float _1345 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1347 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1087);
    float _1349 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1337);
    float _1351 = _1249 * _1249;
    float _1353 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1341);
    float _1355 = fma(_1345, _1085, -0.5);
    float _1357 = -_1347;
    float _1359 = fma(_1345, _1343, _1357);
    float _1361 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1349);
    float _1363 = _1345;
    int _1365 = as_type<int>(_1361);
    if (_1309)
    {
        _1363 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1367 = _1363;
    float _1369 = fma(_1277, _1277, _1351);
    float _1371 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1353);
    float _1373 = fma(_1361, _1331, _1339);
    out.m_61.w = _1321;
    if (_1309)
    {
        float _1375 = _1367 * 5.0;
        _1365 = as_type<int>(_1375);
    }
    int _1377 = _1365;
    float _1379 = fma(_1283, _1283, _1369);
    float _1381 = fma(_1371, _1355, _1359);
    float _1383 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1287);
    float _1385 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1387 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1389 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1391 = rsqrt(_1379);
    if (_1309)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5779 = as_type<float>(_1377);
        out.gl_Position.z = _5779;
    }
    float _1393 = _1373 + 0.5;
    float _1395 = _1381 + 0.5;
    float _1397 = _1383 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1401 = _1399 != 0;
    int _1403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1405 = _1403 != 0;
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1409 = _1407 != 0;
    if (_1309)
    {
        out.m_49.x = 0.0;
    }
    out.m_65.x = _1393;
    out.m_65.y = _1395;
    float _1411 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1417 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1421 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1423 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1425 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1427 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1429 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1431 = !_1405;
    int _1433 = _1431 ? 0 : 1;
    float _1435 = _1249 * _1391;
    out.m_67.x = _1421;
    out.m_67.y = _1423;
    out.m_67.z = _1425;
    out.m_67.w = _1419;
    bool _1437 = !_1409;
    int _1439 = _1437 ? 0 : 1;
    float _1441 = _1277 * _1391;
    bool _1443 = !_1401;
    int _1445 = _1443 ? 0 : 1;
    out.m_69.x = _1417;
    out.m_69.y = _1427;
    out.m_69.z = _1429;
    out.m_69.w = _1397;
    if (_1309)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1447 = -_1435;
    float _1449 = fma(_1447, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1227);
    float _1451 = -_1441;
    float _1453 = fma(_1451, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1263);
    float _1455 = _1283 * _1391;
    float _1457 = in.m_55.z;
    float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1461 = _1449 + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1465 = _1453 + _1463;
    float _1467 = -_1455;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1271);
    float _1471 = _448 * 2.0;
    float _1473 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1475 = _450 * 2.0;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1479 = _1469 + _1477;
    float _1481 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1473);
    float _1483 = floor(_1471);
    bool _1485 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1487 = isnan(0.0);
    bool _1489 = _1485 || _1487;
    bool _1491 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1493 = _1489 || _1491;
    float _1495 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1481);
    float _1497 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1499 = log2(_1497);
    bool _1501 = _1495 >= 0.0;
    float _1503 = _450 + _448;
    float _1505 = _1503 + (-1.0);
    float _1507 = _450 + _1457;
    float _1509 = floor(_1475);
    bool _1511 = _1483 > 0.0;
    float _1513 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1515 = _1507 + (-1.0);
    bool _1517 = _1483 >= 0.0;
    bool _1519 = isnan(_1483);
    bool _1521 = _1517 || _1519;
    bool _1523 = isnan(0.0);
    bool _1525 = _1521 || _1523;
    float _1527 = _1457 * 2.0;
    float _1529 = 0.0;
    int _1531 = as_type<int>(_1475);
    float _1533 = _1455;
    float _1535 = _1479;
    if (_1501)
    {
        _1529 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1537 = _1529;
    float _1539 = _1499 * _134;
    float _1541 = fma(_1515, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_1501)
    {
        out.m_49.x = 0.0;
    }
    if (_1501)
    {
        float _1543 = _1537 * 5.0;
        _1531 = as_type<int>(_1543);
    }
    int _1545 = _1531;
    float _1547 = floor(_1527);
    bool _1549 = _1509 > 0.0;
    if (_1501)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6064 = as_type<float>(_1545);
        out.gl_Position.z = _6064;
    }
    bool _1551 = _1509 >= 0.0;
    bool _1553 = isnan(_1509);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan(0.0);
    bool _1559 = _1555 || _1557;
    float _1561 = exp2(_1539);
    bool _1563 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1565 = isnan(1.0);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1571 = _1567 || _1569;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1575 = 1.0 + _1573;
    if (_1501)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1577 = -_1227;
    float _1579 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1581 = -_1263;
    float _1583 = _1581 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1585 = -_1271;
    float _1587 = _1585 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1589 = 1.0 / _1575;
    float _1591 = _1579 * _1579;
    float _1593 = -_1561;
    float _1595 = _1593 + 1.0;
    int _1597 = _1525 ? 0 : 1;
    float _1599 = _450 + (-0.5);
    float _1601 = fma(_1583, _1583, _1591);
    bool _1603 = _1547 > 0.0;
    float _1605 = -_1435;
    float _1607 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1249);
    float _1609 = _1493 ? _1595 : 0.0;
    float _1611 = fma(_1587, _1587, _1601);
    bool _1613 = _1547 >= 0.0;
    bool _1615 = isnan(_1547);
    bool _1617 = _1613 || _1615;
    bool _1619 = isnan(0.0);
    bool _1621 = _1617 || _1619;
    float _1623 = -_1441;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1277);
    int _1627 = ~_1597;
    int _1629 = _1627 + 1;
    int _1631 = _1629 + 1;
    float _1633 = rsqrt(_1611);
    int _1635 = _1631;
    if (!_1511)
    {
        int _1637 = ~_1597;
        int _1639 = _1637 + 1;
        _1635 = _1639;
    }
    int _1641 = _1635;
    float _1643 = _1607 * _1607;
    int _1645 = abs(_1433);
    if (_1571)
    {
        float _1647 = _1609 * _1589;
        _152 = _1647;
    }
    float _1649 = _152;
    int _1651 = abs(_1445);
    float _1653 = fma(_1625, _1625, _1643);
    int _1655 = _1621 ? 0 : 1;
    float _1657 = sqrt(_1611);
    int _1659 = abs(_1439);
    float _1661 = float(_1641);
    int _1663 = ~_1655;
    int _1665 = _1663 + 1;
    int _1667 = _1665 + 1;
    int _1669 = _1667;
    if (!_1603)
    {
        int _1671 = ~_1655;
        int _1673 = _1671 + 1;
        _1669 = _1673;
    }
    int _1675 = _1669;
    float _1677 = _1583 * _1633;
    float _1679 = _1587 * _1633;
    int _1681 = _1559 ? 0 : 1;
    float _1683 = _1677 * _1677;
    float _1685 = float(_1645);
    float _1687 = float(_1651);
    float _1689 = fma(_1679, _1679, _1683);
    float _1691 = float(_1675);
    float _1693 = _1685 * _1661;
    float _1695 = rsqrt(_1689);
    int _1697 = ~_1681;
    int _1699 = _1697 + 1;
    int _1701 = _1699 + 1;
    float _1703 = _1687 * _1691;
    int _1705 = _1701;
    if (!_1549)
    {
        int _1707 = ~_1681;
        int _1709 = _1707 + 1;
        _1705 = _1709;
    }
    int _1711 = _1705;
    float _1713 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1715 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1717 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1719 = float(_1711);
    float _1721 = float(_1659);
    float _1723 = -_1717;
    float _1725 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1723);
    float _1727 = -_1713;
    float _1729 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1727);
    float _1731 = _1721 * _1719;
    float _1733 = -_1715;
    float _1735 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1733);
    float _1737 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1739 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1741 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1743 = _1679 * _1695;
    float _1745 = _1579 * _1633;
    float _1747 = in.m_71.x;
    float _1749 = in.m_71.y;
    float _1751 = in.m_71.z;
    float _1753 = -_1739;
    float _1755 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1753);
    float _1757 = _1735 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1759 = -_1741;
    float _1761 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1759);
    float _1763 = _1677 * _1695;
    float _1765 = -_1743;
    float _1767 = _1679 * _1765;
    float _1769 = -_1757;
    float _1771 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1769);
    float _1773 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1761);
    float _1775 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1777 = -_1767;
    float _1779 = fma(_1677, _1763, _1777);
    float _1781 = -_1737;
    float _1783 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1781);
    float _1785 = _1773 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1787 = _1745 * _1763;
    float _1789 = _1779 * _1779;
    float _1791 = -_1775;
    float _1793 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1791);
    float _1795 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1797 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1771);
    float _1799 = fma(_1787, _1787, _1789);
    float _1801 = -_1743;
    float _1803 = _1745 * _1801;
    float _1805 = -_1795;
    float _1807 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1805);
    float _1809 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1811 = -_1785;
    float _1813 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1811);
    float _1815 = _1703 * (-2.0);
    float _1817 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1807);
    float _1819 = -_1809;
    float _1821 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1819);
    float _1823 = fma(_1803, _1803, _1799);
    float _1825 = fma(_1513, _1815, _1513);
    float _1827 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1813);
    float _1829 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1821);
    float _1831 = fma(_1815, _1747, _1747);
    float _1833 = _1693 * (-2.0);
    float _1835 = _448 + (-0.5);
    float _1837 = rsqrt(_1823);
    float _1839 = -_1829;
    float _1841 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1827);
    float _1843 = fma(_1833, _1749, _1749);
    float _1845 = fma(_1835, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1831);
    float _1847 = fma(_1541, _1833, _1541);
    float _1849 = _1731 * (-2.0);
    float _1851 = fma(_1599, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1843);
    float _1853 = fma(_1825, _1649, _1845);
    float _1855 = 1.0 / _1841;
    float _1857 = _1735 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1859 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1861 = fma(_1847, _1649, _1851);
    float _1863 = fma(_1849, _1751, _1751);
    float _1865 = -_1857;
    float _1867 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1865);
    float _1869 = -_1859;
    float _1871 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1869);
    float _1873 = _1853 * 0.15915493667125701904296875;
    float _1875 = _1779 * _1837;
    float _1877 = precise::clamp(_1875, 0.0, 1.0);
    float _1879 = _1725 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1881 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1871);
    float _1883 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1867);
    float _1885 = -_1877;
    float _1887 = _1885 + 1.0;
    float _1889 = -_1879;
    float _1891 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1889);
    float _1893 = _1861 * 0.15915493667125701904296875;
    float _1895 = _1457 + _448;
    float _1897 = fma(_1881, _1855, -1.0);
    float _1899 = _1887 * _1855;
    float _1901 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1891);
    float _1903 = fma(_1887, _1897, 1.0);
    float _1905 = _1883 * _1899;
    float _1907 = _1901 * _1899;
    float _1909 = _1895 + (-1.0);
    float _1911 = _1903 * _1903;
    float _1913 = _1457 + (-0.5);
    float _1915 = _1893 * 6.283185482025146484375;
    float _1917 = sin(_1915);
    float _1919 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1921 = fma(_1905, _1905, _1911);
    float _1923 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1863);
    float _1925 = fma(_1919, _1849, _1919);
    float _1927 = fma(_1907, _1907, _1921);
    float _1929 = _1893 * 6.283185482025146484375;
    float _1931 = cos(_1929);
    float _1933 = fma(_1925, _1649, _1923);
    float _1935 = abs(_1657);
    float _1937 = precise::max(0.0, _1935);
    float _1939 = _1933 * 0.15915493667125701904296875;
    float _1941 = rsqrt(_1927);
    float _1943 = precise::min(_1937, 40.0);
    float _1945 = _1873 * 6.283185482025146484375;
    float _1947 = sin(_1945);
    float _1949 = _1907 * _1941;
    float _1951 = _1905 * _1941;
    float _1953 = _1903 * _1941;
    float _1955 = -_1455;
    float _1957 = fma(_1955, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
    float _1959 = -_1949;
    float _1961 = _1677 * _1959;
    float _1963 = _1873 * 6.283185482025146484375;
    float _1965 = cos(_1963);
    float _1967 = _1679 * _1953;
    float _1969 = fma(_1957, _1957, _1653);
    float _1971 = -_1951;
    float _1973 = -_1961;
    float _1975 = fma(_1679, _1971, _1973);
    float _1977 = -_1951;
    float _1979 = _1745 * _1977;
    float _1981 = -_1949;
    float _1983 = -_1967;
    float _1985 = fma(_1745, _1981, _1983);
    float _1987 = _1947 * _1917;
    float _1989 = _1975 * _1975;
    float _1991 = -_1979;
    float _1993 = fma(_1677, _1953, _1991);
    float _1995 = _1939 * 6.283185482025146484375;
    float _1997 = cos(_1995);
    float _1999 = _1947 * _1931;
    float _2001 = fma(_1985, _1985, _1989);
    float _2003 = fma(_1993, _1993, _2001);
    float _2005 = _1965 * _1931;
    float _2007 = sqrt(_1969);
    float _2009 = _1965 * _1917;
    float _2011 = rsqrt(_2003);
    float _2013 = _1947 * _1997;
    float _2015 = _1931 * _1997;
    float _2017 = _1965 * _1997;
    float _2019 = _1917 * _1997;
    float _2021 = _380 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2023 = _1939 * 6.283185482025146484375;
    float _2025 = sin(_2023);
    float _2027 = _1391 * _2007;
    float _2029 = _1985 * _2011;
    float _2031 = _1993 * _2011;
    float _2033 = in.m_73.x;
    float _2035 = in.m_73.y;
    float _2037 = in.m_73.z;
    float _2039 = _1679 * _2029;
    float _2041 = fma(_2025, _2005, _1987);
    float _2043 = fma(_2025, _1987, _2005);
    float _2045 = _1975 * _2011;
    float _2047 = _1745 * _2031;
    float _2049 = -_2039;
    float _2051 = fma(_1677, _2031, _2049);
    float _2053 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2055 = _1677 * _2045;
    float _2057 = -_2047;
    float _2059 = fma(_1679, _2045, _2057);
    float _2061 = _2051 * _2051;
    float _2063 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _2053);
    float _2065 = -_2055;
    float _2067 = fma(_1745, _2029, _2065);
    float _2069 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2071 = fma(_2059, _2059, _2061);
    float _2073 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2075 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _2063);
    float _2077 = -_2009;
    float _2079 = fma(_2025, _1999, _2077);
    float _2081 = fma(_2067, _2067, _2071);
    float _2083 = -_1999;
    float _2085 = fma(_2025, _2009, _2083);
    float _2087 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2073);
    float _2089 = _2021 * _2027;
    float _2091 = rsqrt(_2081);
    float _2093 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2033);
    float _2095 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2087);
    float _2097 = _2069 * _2027;
    float _2099 = _2075 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2101 = _2093 * _2089;
    float _2103 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2035);
    float _2105 = _2095 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2107 = _2103 * _2097;
    float _2109 = -_2105;
    float _2111 = _2099 + _2109;
    bool _2113 = _2105 >= _2099;
    bool _2115 = isnan(_2105);
    bool _2117 = _2113 || _2115;
    bool _2119 = isnan(_2099);
    bool _2121 = _2117 || _2119;
    float _2123 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2125 = _354 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2127 = _2067 * _2091;
    float _2129 = abs(_2111);
    float _2131 = precise::max(_2129, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _2133 = _2059 * _2091;
    float _2135 = _2051 * _2091;
    float _2137 = _1677 * _2127;
    float _2139 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _2139;
    float _2143 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2123);
    float _2145 = precise::min(_2131, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _2147 = _1679 * _2135;
    float _2149 = -_2137;
    float _2151 = fma(_1679, _2133, _2149);
    float _2153 = 1.0 / _2141;
    float _2155 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2143);
    float _2157 = -_2147;
    float _2159 = fma(_1745, _2127, _2157);
    float _2161 = _2151 * _2151;
    float _2163 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2165 = _2145 + _2163;
    bool _2167 = !_2121;
    float _2169 = _2167 ? 1.0 : (-1.0);
    float _2171 = rsqrt(_2155);
    float _2173 = _1745 * _2133;
    float _2175 = -_2173;
    float _2177 = fma(_1677, _2135, _2175);
    float _2179 = fma(_2159, _2159, _2161);
    float _2181 = _2017 * _2107;
    float _2183 = _2165 * _2153;
    float _2185 = _2125 * _2027;
    float _2187 = fma(_2177, _2177, _2179);
    float _2189 = -_2107;
    float _2191 = _2025 * _2189;
    float _2193 = _2013 * _2107;
    float _2195 = fma(_2041, _2101, _2181);
    float _2197 = _2169 * _2183;
    float _2199 = rsqrt(_2187);
    float _2201 = fma(_2079, _2101, _2193);
    float _2203 = _2185 * _2037;
    float _2205 = fma(_2015, _2101, _2191);
    float _2207 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2209 = fma(_1943, -0.02500000037252902984619140625, 1.0);
    float _2211 = fma(_2085, _2203, _2195);
    float _2213 = fma(_2019, _2203, _2205);
    float _2215 = fma(_2043, _2203, _2201);
    float _2217 = _2207 * _2197;
    float _2219 = _2171 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2221 = _2127 * _2211;
    float _2223 = _2219 * _2219;
    float _2225 = _2159 * _2199;
    float _2227 = _2151 * _2199;
    float _2229 = _2177 * _2199;
    float _2231 = _2135 * _2211;
    float _2233 = _2171 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2235 = _2171 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2237 = _2133 * _2211;
    float _2239 = fma(_2227, _2213, _2231);
    float _2241 = fma(_2233, _2233, _2223);
    float _2243 = fma(_2229, _2213, _2221);
    float _2245 = fma(_2225, _2213, _2237);
    float _2247 = fma(_1745, _2215, _2239);
    float _2249 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2251 = fma(_1679, _2215, _2243);
    float _2253 = fma(_1677, _2215, _2245);
    float _2255 = _1227 + _2247;
    float _2257 = _2217 * 0.15915493667125701904296875;
    float _2259 = fma(_2235, _2235, _2241);
    float _2261 = _1263 + _2253;
    float _2263 = _2255 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2265 = _2255 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2267 = _2255 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2269 = _1271 + _2251;
    float _2271 = fma(_2261, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2263);
    float _2273 = fma(_2261, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2265);
    float _2275 = fma(_2261, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2267);
    float _2277 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2249);
    float _2279 = rsqrt(_2259);
    float _2281 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2273);
    float _2283 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2275);
    float _2285 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2271);
    float _2287 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2277);
    float _2289 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2291 = _2283 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2293 = _2285 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2295 = _2257 * 6.283185482025146484375;
    float _2297 = cos(_2295);
    float _2299 = _2287 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2301 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2303 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2305 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2307 = -_2289;
    float _2309 = _2307 + _2299;
    float _2311 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2301);
    float _2313 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2303);
    float _2315 = _2257 * 6.283185482025146484375;
    float _2317 = sin(_2315);
    float _2319 = fma(_2209, _2309, _2289);
    float _2321 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2305);
    float _2323 = _2233 * _2279;
    float _2325 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2311);
    float _2327 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2313);
    float _2329 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2321);
    float _2331 = -_2297;
    float _2333 = _2331 + 1.0;
    float _2335 = _2219 * _2279;
    float _2337 = _2235 * _2279;
    float _2339 = _2325 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2341 = _2323 * _2333;
    float _2343 = _2335 * _2333;
    float _2345 = _2337 * _2337;
    float _2347 = _2327 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2349 = _2323 * _2317;
    float _2351 = _2335 * _2317;
    float _2353 = fma(_2333, _2345, _2297);
    float _2355 = _2337 * _2317;
    float _2357 = fma(_2337, _2343, _2349);
    float _2359 = -_1227;
    float _2361 = _2359 + _2339;
    float _2363 = -_2351;
    float _2365 = fma(_2337, _2341, _2363);
    float _2367 = -_2355;
    float _2369 = fma(_2335, _2341, _2367);
    float _2371 = -_1263;
    float _2373 = _2371 + _2347;
    float _2375 = _2357 * _2361;
    float _2377 = _2329 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2379 = fma(_2323, _2341, _2297);
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2383 = _2381 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2385 = _2369 * _2361;
    float _2387 = fma(_2365, _2373, _2375);
    float _2389 = -_1271;
    float _2391 = _2389 + _2377;
    float _2393 = fma(_170, _2383, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2395 = fma(_2379, _2373, _2385);
    float _2397 = fma(_2337, _2341, _2351);
    float _2399 = fma(_2353, _2391, _2387);
    float _2401 = fma(_2335, _2343, _2297);
    float _2403 = fma(_2335, _2341, _2355);
    float _2405 = fma(_2397, _2391, _2395);
    float _2407 = fma(_2399, _2393, _1271);
    float _2409 = _2401 * _2361;
    float _2411 = -_2349;
    float _2413 = fma(_2337, _2343, _2411);
    float _2415 = fma(_2405, _2393, _1263);
    float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2419 = _2407 + _2417;
    float _2421 = fma(_2403, _2373, _2409);
    float _2423 = _1449 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2427 = _2415 + _2425;
    float _2429 = _2419 * _2419;
    float _2431 = fma(_2413, _2391, _2421);
    float _2433 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2423);
    float _2435 = fma(_2427, _2427, _2429);
    float _2437 = _1227 + _2431;
    float _2439 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2433);
    float _2441 = sqrt(_2435);
    bool _2443 = _2441 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2445 = _2423;
    float _2447 = _2433;
    float _2449 = _2407;
    if (!_2443)
    {
        _2445 = _2415;
    }
    float _2451 = _2445;
    float _2453 = _2451;
    if (!_2443)
    {
        _2447 = _2437;
    }
    float _2455 = _2447;
    bool _2457 = !_2443;
    float _2459 = _2455;
    if (!_2457)
    {
        float _2461 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2465 = _2441 + _2463;
        float _2467 = _2437 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2469 = rsqrt(_2435);
        float _2471 = _2465 * _2461;
        float _2473 = _2471 * 0.15915493667125701904296875;
        float _2475 = _2473 * 6.283185482025146484375;
        float _2477 = cos(_2475);
        float _2479 = _2473 * 6.283185482025146484375;
        float _2481 = sin(_2479);
        float _2483 = _2477 + (-1.0);
        float _2485 = fma(_2481, _2467, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2487 = _2483 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2489 = _2469 * _2485;
        float _2491 = fma(_2437, _2477, _2487);
        float _2493 = fma(_2427, _2489, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2495 = fma(_2419, _2489, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2459 = _2491;
        _2453 = _2493;
        _2449 = _2495;
    }
    float _2497 = _2459;
    float _2499 = _2453;
    float _2501 = _2449;
    float _2503 = -_1227;
    float _2505 = _2503 + _2497;
    float _2507 = _2439 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2509 = -_1263;
    float _2511 = _2509 + _2499;
    float _2513 = _1449 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2515 = _2505 * _2505;
    float _2517 = -_1271;
    float _2519 = _2517 + _2501;
    float _2521 = 1.0 / _2507;
    float _2523 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2513);
    float _2525 = fma(_2511, _2511, _2515);
    float _2527 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2523);
    float _2529 = fma(_2519, _2519, _2525);
    float _2531 = _2527 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2533 = sqrt(_2529);
    float _2535 = _2531 + _2507;
    float _2537 = _2535 * _2521;
    float _2539 = _2537 * 0.5;
    float _2541 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2543 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2541);
    float _2545 = 1.0 / _2543;
    bool _2547 = _2533 > 0.0;
    bool _2549 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2551 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2553 = _2549 || _2551;
    bool _2555 = isnan(0.5);
    bool _2557 = _2553 || _2555;
    bool _2559 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2561 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2563 = _2559 || _2561;
    bool _2565 = isnan(0.5);
    bool _2567 = _2563 || _2565;
    float _2569 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2571 = _2499;
    float _2573 = _2501;
    float _2575 = _2505;
    if (!_2547)
    {
        _2569 = _2497;
    }
    float _2577 = _2569;
    bool _2579 = !_2547;
    float _2581 = _2577;
    if (!_2579)
    {
        float _2583 = _186 * _186;
        float _2585 = rsqrt(_2529);
        float _2587 = fma(_184, _184, _2583);
        float _2589 = fma(_188, _188, _2587);
        float _2591 = sqrt(_2589);
        float _2593 = _2511 * _2585;
        float _2595 = _2505 * _2585;
        float _2597 = _2519 * _2585;
        bool _2599 = _2591 > 0.0;
        float _2601 = _2591;
        if (!_2599)
        {
            _2601 = _2497;
        }
        float _2603 = _2601;
        bool _2605 = !_2599;
        _2581 = _2603;
        if (!_2605)
        {
            float _2607 = rsqrt(_2589);
            float _2609 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2611 = _186 * _2607;
            float _2613 = _184 * _2607;
            float _2615 = _2595 * _2611;
            float _2617 = _188 * _2607;
            float _2619 = fma(_2593, _2613, _2615);
            float _2621 = _2609 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2623 = fma(_2597, _2617, _2619);
            float _2625 = _2623 * _2621;
            float _2627 = fma(_184, _2625, _2499);
            float _2629 = fma(_186, _2625, _2497);
            float _2631 = fma(_188, _2625, _2501);
            _2581 = _2629;
            _2571 = _2627;
            _2573 = _2631;
            _2575 = _2625;
        }
    }
    float _2633 = _2581;
    float _2635 = _2571;
    float _2637 = _2573;
    float _2639 = _2575;
    float _2641 = -_1435;
    float _2643 = fma(_2641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2633);
    float _2645 = -_1441;
    float _2647 = fma(_2645, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2635);
    float _2649 = -_1455;
    float _2651 = fma(_2649, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2637);
    float _2653 = _2639;
    float _2655 = _2647;
    float _2657 = _2651;
    float _2659 = _2643;
    if (_2557)
    {
        _2653 = 1.0;
    }
    float _2661 = _2653;
    float _2663 = _2661;
    if (_2567)
    {
        _1533 = _2643;
    }
    float _2665 = _1533;
    float _2667 = _2665;
    if (!_2567)
    {
        float _2669 = _1461 * _1461;
        float _2671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2673 = -_1271;
        float _2675 = _2673 + _2637;
        float _2677 = -_1227;
        float _2679 = _2677 + _2633;
        float _2681 = fma(_1465, _1465, _2669);
        float _2683 = -_1263;
        float _2685 = _2683 + _2635;
        float _2687 = fma(_1479, _1479, _2681);
        float _2689 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2691 = sqrt(_2687);
        float _2693 = 1.0 / _2027;
        float _2695 = _2689 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2697 = precise::min(_2691, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2699 = _2697 * _2671;
        float _2701 = _2699 * _2693;
        float _2703 = _2695 * _2701;
        float _2705 = _2675 * _2701;
        float _2707 = fma(_2679, _2703, _1449);
        float _2709 = fma(_2685, _2703, _1453);
        float _2711 = fma(_2695, _2705, _1469);
        _192 = _2701;
        _2667 = _2707;
        _2655 = _2709;
        _2657 = _2711;
        _2659 = _2671;
    }
    float _2713 = _192;
    float _2715 = _2667;
    float _2717 = _2655;
    float _2719 = _2657;
    float _2721 = _2659;
    float _2723 = _2713;
    float _2725 = _2721;
    if (_2557)
    {
        _1535 = 1.0;
    }
    float _2727 = _1535;
    float _2729 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2731 = _2545 * _2729;
    float _2733 = _2727;
    if (!_2557)
    {
        float _2735 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2739 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2737;
        float _2741 = _2735 * 0.15915493667125701904296875;
        float _2743 = _2741 * 6.283185482025146484375;
        float _2745 = cos(_2743);
        float _2747 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2749 = _2747 * 0.15915493667125701904296875;
        float _2751 = _2741 * 6.283185482025146484375;
        float _2753 = sin(_2751);
        float _2755 = 1.0 / _2745;
        float _2757 = _2749 * 6.283185482025146484375;
        float _2759 = cos(_2757);
        float _2761 = _2753 * _2755;
        float _2763 = _2749 * 6.283185482025146484375;
        float _2765 = sin(_2763);
        float _2767 = _2759 * _2761;
        float _2769 = 1.0 / _2739;
        float _2771 = 1.0 / _2767;
        float _2773 = _2765 * _2771;
        float _2775 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2777 = fma(_2731, _2773, _2775);
        float _2779 = _2777 * _2769;
        float _2781 = precise::clamp(_2779, 0.0, 1.0);
        _2723 = _2749;
        _2663 = _2781;
    }
    float _2783 = _2723;
    float _2785 = _2663;
    float _2787 = _2783;
    if (!_2557)
    {
        float _2789 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2791 = _2789 * 0.15915493667125701904296875;
        float _2793 = _2791 * 6.283185482025146484375;
        float _2795 = cos(_2793);
        float _2797 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2799 = _2797 * 0.15915493667125701904296875;
        float _2801 = _2791 * 6.283185482025146484375;
        float _2803 = sin(_2801);
        float _2805 = 1.0 / _2795;
        float _2807 = _2799 * 6.283185482025146484375;
        float _2809 = cos(_2807);
        float _2811 = _2803 * _2805;
        float _2813 = _2799 * 6.283185482025146484375;
        float _2815 = sin(_2813);
        float _2817 = _2809 * _2811;
        float _2819 = 1.0 / _2817;
        float _2821 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2823 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2821;
        float _2825 = 1.0 / _2823;
        float _2827 = _2815 * _2819;
        float _2829 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2831 = fma(_2731, _2827, _2829);
        float _2833 = _2831 * _2825;
        float _2835 = precise::clamp(_2833, 0.0, 1.0);
        float _2837 = -_2835;
        float _2839 = _2837 + 1.0;
        _2787 = _2795;
        _2733 = _2839;
    }
    float _2841 = _2787;
    float _2843 = _2733;
    float _2845 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2847 = _2715 + _2845;
    float _2849 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2851 = _2717 + _2849;
    float _2853 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2855 = _2719 + _2853;
    float _2857 = _2847 * _2847;
    float _2859 = fma(_2851, _2851, _2857);
    float _2861 = fma(_2855, _2855, _2859);
    float _2863 = rsqrt(_2861);
    float _2865 = sqrt(_2861);
    float _2867 = _2863 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2869 = _2851 * _2867;
    float _2871 = _2855 * _2867;
    float _2873 = _2869 * _2869;
    float _2875 = _2871 * _2871;
    float _2877 = _2873 + _2875;
    float _2879 = sqrt(_2877);
    bool _2881 = _2879 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2885 = _2879 + _2883;
    float _2887 = _2855;
    float _2889 = _2885;
    float _2891 = _2857;
    if (_2881)
    {
        float _2893 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2887 = _2893;
    }
    float _2895 = _2887;
    if (_2881)
    {
        float _2897 = _2885 * _2895;
        _2889 = _2897;
    }
    float _2899 = _2889;
    if (_2881)
    {
        float _2901 = _2899 * 0.15915493667125701904296875;
        _2891 = _2901;
    }
    float _2903 = _2891;
    float _2905 = _2863;
    float _2907 = _2903;
    if (_2881)
    {
        float _2909 = _2903 * 6.283185482025146484375;
        float _2911 = sin(_2909);
        _2905 = _2911;
    }
    float _2913 = _2905;
    float _2915 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2917 = precise::max(0.0, _2915);
    float _2919 = _2841;
    float _2921 = _2917;
    if (_2881)
    {
        float _2923 = _2903 * 6.283185482025146484375;
        float _2925 = cos(_2923);
        _2919 = _2925;
    }
    float _2927 = _2919;
    float _2929 = -_2867;
    float _2931 = -_2917;
    float _2933 = fma(_2847, _2929, _2931);
    float _2935 = _2915;
    float _2937 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2881)
    {
        float _2939 = rsqrt(_2877);
        _2935 = _2939;
    }
    float _2941 = _2935;
    if (_2881)
    {
        float _2943 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2921 = _2943;
    }
    float _2945 = _2921;
    float _2947 = fma(_1453, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2949 = _2945;
    if (!_2881)
    {
        _2907 = _2869;
    }
    float _2951 = _2907;
    float _2953 = _2913;
    float _2955 = _2951;
    if (_2881)
    {
        float _2957 = fma(_2913, _2945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2949 = _2957;
    }
    float _2959 = _2949;
    float _2961 = _2959;
    if (!_2881)
    {
        _2953 = _2871;
    }
    float _2963 = _2953;
    float _2965 = _2963;
    float _2967 = _2927;
    if (_2881)
    {
        float _2969 = _2927 + (-1.0);
        _2937 = _2969;
    }
    float _2971 = _2937;
    float _2973 = _2971;
    if (_2881)
    {
        float _2975 = _2971 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2973 = _2975;
    }
    float _2977 = _2973;
    float _2979 = _2941;
    if (_2881)
    {
        float _2981 = _2941 * _2959;
        _2725 = _2981;
    }
    float _2983 = _2725;
    if (!_2881)
    {
        _2979 = _2933;
    }
    float _2985 = _2979;
    float _2987 = _2985;
    if (_2881)
    {
        float _2989 = fma(_2933, _2927, _2977);
        _2987 = _2989;
    }
    float _2991 = _2987;
    if (!_2881)
    {
        _2961 = _2873;
    }
    float _2993 = _2961;
    float _2995 = _2993;
    if (_2881)
    {
        float _2997 = _2869 * _2983;
        _2955 = _2997;
    }
    float _2999 = _2955;
    if (_2881)
    {
        float _3001 = _2871 * _2983;
        _2965 = _3001;
    }
    float _3003 = _2965;
    float _3005 = _2715 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2881)
    {
        _2967 = _2875;
    }
    float _3007 = _2967;
    float _3009 = _3007;
    if (_2881)
    {
        float _3011 = _2999 * _2999;
        _2995 = _3011;
    }
    float _3013 = _2995;
    if (_2881)
    {
        float _3015 = _3003 * _3003;
        _3009 = _3015;
    }
    float _3017 = _3009;
    float _3019 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3005);
    float _3021 = fma(_2991, _2991, _3013);
    float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3025 = fma(_2865, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3023);
    float _3027 = precise::clamp(_3025, 0.0, 1.0);
    float _3029 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3019);
    float _3031 = floor(_2947);
    float _3033 = _3021 + _3017;
    float _3035 = _3029 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3037 = -_3027;
    float _3039 = _3037 + 1.0;
    float _3041 = fma(_1469, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3043 = _2715 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3045 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3047 = rsqrt(_3033);
    float _3049 = _3035 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3051 = _2715 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3053 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3043);
    float _3055 = -_3049;
    float _3057 = fma(_3055, _3045, 1.0);
    float _3059 = _2715 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3061 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3051);
    float _3063 = abs(_3039);
    float _3065 = log2(_3063);
    float _3067 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3053);
    float _3069 = fma(_2717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3059);
    float _3071 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3061);
    float _3073 = -_3031;
    float _3075 = _2947 + _3073;
    float _3077 = _3067 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3079 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3069);
    float _3081 = _3071 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3083 = _3047 * _2999;
    float _3085 = _3047 * _2991;
    float _3087 = _3047 * _3003;
    float _3089 = _3079 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3091 = _3083 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3093 = _3081 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3095 = floor(_3041);
    float _3097 = _3081 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3099 = -_3091;
    float _3101 = fma(_3085, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3099);
    float _3103 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3093);
    float _3105 = _3065 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3107 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3097);
    float _3109 = -_3087;
    float _3111 = fma(_3109, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3101);
    float _3113 = fma(_3035, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3103);
    float _3115 = log2(_3057);
    float _3117 = fma(_3111, -0.5, 0.5);
    float _3119 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3113);
    float _3121 = fma(_3111, 0.5, 0.5);
    float _3123 = exp2(_3105);
    float _3125 = _3081 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3127 = fma(_3121, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3129 = -_3095;
    float _3131 = _3041 + _3129;
    float _3133 = _3085 + 1.0;
    float _3135 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3125);
    float _3137 = fma(_3121, _3127, -0.212114393711090087890625);
    float _3139 = fma(_3035, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3107);
    float _3141 = 1.0 / _3119;
    float _3143 = fma(_3035, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3135);
    float _3145 = fma(_3121, _3137, 1.570728778839111328125);
    float _3147 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3143);
    float _3149 = sqrt(_3117);
    float _3151 = -_3085;
    float _3153 = fma(_3123, _3133, _3151);
    float _3155 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3139);
    float _3157 = _3115 * 0.693147182464599609375;
    float2 _8621 = float2(_3075, _3131);
    float _3159 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8621, float2(0.0), isnan(_8621)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8621, float2(0.0), isnan(_8621)), level(0.0)).x;
    float _3161 = fma(_3153, 0.5, 0.5);
    float _3163 = _3157 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3165 = _3147 * _3141;
    float _3167 = _3155 * _3141;
    float _3169 = fma(_3165, 0.5, 0.5);
    float _3171 = fma(_3167, -0.5, 0.5);
    float _3173 = _3149 * 0.636619746685028076171875;
    float3 _8651 = float3(_3169, _3171, _3163);
    float _3175 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8651, float3(0.0), isnan(_8651)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8651, float3(0.0), isnan(_8651)), level(0.0)).x;
    float _3177 = -_3145;
    float _3179 = fma(_3173, _3177, 1.0);
    float3 _8667 = float3(_3169, _3171, _3163);
    float4 _3182 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8667, float3(0.0), isnan(_8667)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8667, float3(0.0), isnan(_8667)), level(0.0)).xyzw;
    float _3184 = _3182.x;
    float _3186 = _3182.y;
    float _3188 = _3182.z;
    float _3190 = _3182.w;
    float2 _8683 = float2(_3179, _3161);
    float3 _3194 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8683, float2(0.0), isnan(_8683)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8683, float2(0.0), isnan(_8683)), level(0.0)).xyz;
    float _3196 = _3194.x;
    float _3198 = _3194.y;
    float _3200 = _3194.z;
    float _3202 = abs(_2731);
    float _3204 = log2(_3202);
    bool _3206 = _2035 != 0.0;
    bool _3208 = isnan(_2035);
    bool _3210 = _3206 || _3208;
    bool _3212 = isnan(0.0);
    bool _3214 = _3210 || _3212;
    out.m_67.x = _1421;
    out.m_67.y = _1423;
    out.m_67.z = _1425;
    out.m_67.w = _1419;
    float _3216 = _3065 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3218 = _2033 == 0.0;
    bool _3220 = !_3214;
    bool _3222 = _3218 && _3220;
    out.m_69.x = _1417;
    out.m_69.y = _1427;
    out.m_69.z = _1429;
    out.m_69.w = _1397;
    float _3224 = _3081 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3226 = _2037 == 0.0;
    bool _3228 = _3226 && _3222;
    float _3230 = exp2(_3216);
    float _3232 = fma(_3089, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3224);
    float _3234 = _3204 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3236 = _2017 * _2133;
    float _3238 = in.m_75.x;
    float _3240 = in.m_75.y;
    float _3242 = in.m_75.z;
    float _3244 = _2041 * _2135;
    float _3246 = _2017 * _2135;
    float _3248 = -_2025;
    float _3250 = fma(_3248, _2225, _3236);
    float _3252 = exp2(_3234);
    float _3254 = _2041 * _2133;
    float _3256 = _2085 * _2135;
    float _3258 = _2079 * _1745;
    float _3260 = -_2025;
    float _3262 = fma(_3260, _2227, _3246);
    float _3264 = fma(_2015, _2227, _3244);
    float _3266 = fma(_2015, _2225, _3254);
    float _3268 = fma(_2019, _2227, _3256);
    bool _3270 = _2731 <= 8000.0;
    bool _3272 = isnan(_2731);
    bool _3274 = _3270 || _3272;
    bool _3276 = isnan(8000.0);
    bool _3278 = _3274 || _3276;
    float _3280 = float(_3278);
    float _3282 = fma(_3035, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3232);
    float _3284 = _2041 * _2127;
    float _3286 = -_3230;
    float _3288 = _3286 + 1.0;
    float _3290 = _3258 + _3264;
    float _3292 = fma(_2015, _2229, _3284);
    float _3294 = fma(_3252, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3296 = precise::clamp(_3294, 0.0, 1.0);
    float _3298 = fma(_3296, -2.0, 3.0);
    float _3300 = _3296 * _3296;
    float _3302 = _3242;
    float _3304 = _3240;
    float _3306 = _3238;
    if (!_3228)
    {
        float _3308 = fma(_2037, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3242);
        _3302 = _3308;
    }
    float _3310 = _3302;
    float _3312 = _2013 * _1677;
    if (!_3228)
    {
        float _3314 = fma(_2035, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3240);
        _3304 = _3314;
    }
    float _3316 = _3304;
    float _3318 = _3300 * _3298;
    if (!_3228)
    {
        float _3320 = fma(_2033, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3238);
        _3306 = _3320;
    }
    float _3322 = _3306;
    float _3324 = _3312 + _3250;
    float _3326 = _2013 * _1745;
    float _3328 = -_3318;
    float _3330 = _3328 + 1.0;
    float _3332 = in.m_77.x;
    float _3334 = _2079 * _1677;
    float _3336 = _2043 * _1745;
    float _3338 = fma(_3330, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3318);
    float _3340 = _3324 * _3316;
    float _3342 = _3334 + _3266;
    float _3344 = _3336 + _3268;
    float _3346 = _2017 * _2127;
    float _3348 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3282);
    float _3350 = _3280 * _3338;
    float _3352 = _3326 + _3262;
    float _3354 = fma(_3342, _3322, _3340);
    float _3356 = _2013 * _1679;
    float _3358 = -_2025;
    float _3360 = fma(_3358, _2229, _3346);
    float _3362 = _3348 + _3119;
    float _3364 = _3350 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3366 = _3352 * _3316;
    float _3368 = _2085 * _2133;
    float _3370 = _2079 * _1679;
    float _3372 = _2085 * _2127;
    float _3374 = _3356 + _3360;
    float _3376 = _3362 * 0.5;
    float _3378 = _3288 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3380 = fma(_3290, _3322, _3366);
    float _3382 = _2043 * _1677;
    float _3384 = fma(_2019, _2225, _3368);
    float _3386 = _2043 * _1679;
    float _3388 = fma(_2019, _2229, _3372);
    float _3390 = _3370 + _3292;
    float _3392 = _3374 * _3316;
    float _3394 = _3382 + _3384;
    float _3396 = _3386 + _3388;
    out.m_79.z = _3376;
    out.m_79.w = _3119;
    float _3398 = fma(_3390, _3322, _3392);
    float _3400 = fma(_3394, _3310, _3354);
    float _3402 = fma(_3344, _3310, _3380);
    float _3404 = fma(_3396, _3310, _3398);
    bool _3406 = _2865 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3408 = isnan(_2865);
    bool _3410 = _3406 || _3408;
    bool _3412 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3414 = _3410 || _3412;
    out.gl_Position.x = _3147;
    out.gl_Position.y = _3155;
    out.gl_Position.z = _3348;
    out.gl_Position.w = _3119;
    float _3416 = -_3378;
    float _3418 = _3416 + 1.0;
    out.m_81.x = _3400;
    out.m_81.y = _3402;
    out.m_81.z = _3404;
    float _3420 = _3119;
    float _3422 = _3418;
    float _3424 = _3378;
    if (!_3414)
    {
        _3420 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3426 = _3420;
    float _3428 = -_3159;
    float _3430 = _3428 + 1.0;
    float _3432 = _3430 * _3364;
    float _3434 = precise::clamp(_3432, 0.0, 1.0);
    float _3436 = -_3434;
    float _3438 = fma(_3436, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3440 = _3438 * _3332;
    float _3442 = _3378 * _3175;
    float _3444 = _3332;
    float _3446 = _3426;
    float _3448 = _3426;
    if (!_3414)
    {
        _3444 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3450 = _3444;
    float _3452 = _3440 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3454 = _2785 * _2843;
    float _3456 = _3190 * _3442;
    float _3458 = _3190 * _3418;
    float _3460 = _3456;
    float _3462 = _3454;
    float _3464 = _3450;
    float _3466 = _3450;
    if (!_3414)
    {
        _3422 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3468 = _3422;
    out.m_83.x = _3452;
    float _3470 = _3200 * _3442;
    float _3472 = fma(_3196, _3456, _3184);
    float _3474 = fma(_3198, _3456, _3186);
    float _3476 = _3454 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3478 = fma(_3190, _3470, _3188);
    float _3480 = _3468;
    float _3482 = _3468;
    if (!_3414)
    {
        _3460 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3484 = _3460;
    float _3486 = _3484;
    float _3488 = _3484;
    if (!_3414)
    {
        _3424 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3490 = _3424;
    out.m_85.x = _3472;
    out.m_85.y = _3474;
    out.m_85.z = _3478;
    out.m_85.w = _3458;
    float _3492 = _3490;
    float _3494 = _3490;
    if (!_3414)
    {
        _3462 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3496 = _3462;
    bool _3498 = !_3414;
    float _3500 = _3496;
    float _3502 = _3496;
    if (!_3498)
    {
        bool _3504 = _2865 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3506 = isnan(_2865);
        bool _3508 = _3504 || _3506;
        bool _3510 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3512 = _3508 || _3510;
        if (!_3512)
        {
            float _3514 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3516 = _2865 + _3514;
            float _3518 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3520 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3518;
            float _3522 = 1.0 / _3520;
            float _3524 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3526 = _3524 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3528 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3530 = _3528 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3532 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3534 = _3532 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3536 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3538 = _3536 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3540 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3542 = _3540 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3544 = _3516 * _3522;
            float _3546 = precise::clamp(_3544, 0.0, 1.0);
            float _3548 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3550 = _3548 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3552 = fma(_3546, _3526, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3554 = fma(_3546, _3550, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3556 = fma(_3546, _3530, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3558 = fma(_3546, _3534, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3560 = fma(_3546, _3538, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3562 = fma(_3546, _3542, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3488 = _3554;
            _3494 = _3560;
            _3466 = _3552;
            _3482 = _3558;
            _3448 = _3556;
            _3502 = _3562;
            _3564 = true;
        }
        else
        {
            bool _3566 = _2865 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3568 = isnan(_2865);
            bool _3570 = _3566 || _3568;
            bool _3572 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3574 = _3570 || _3572;
            if (!_3574)
            {
                _3464 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3576 = _3464;
            _3466 = _3576;
            if (!_3574)
            {
                _3486 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3578 = _3486;
            _3488 = _3578;
            if (!_3574)
            {
                _3446 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3580 = _3446;
            _3448 = _3580;
            if (!_3574)
            {
                _3480 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3582 = _3480;
            _3482 = _3582;
            if (!_3574)
            {
                _3492 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3584 = _3492;
            _3494 = _3584;
            if (!_3574)
            {
                _3500 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3586 = _3500;
            bool _3588 = !_3574;
            _3502 = _3586;
            if (!_3588)
            {
                bool _3590 = _2865 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3592 = isnan(_2865);
                bool _3594 = _3590 || _3592;
                bool _3596 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3598 = _3594 || _3596;
                if (!_3598)
                {
                    float _3600 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3602 = _2865 + _3600;
                    float _3604 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3606 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3604;
                    float _3608 = 1.0 / _3606;
                    float _3610 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3612 = _3610 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3614 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3616 = _3614 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3618 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3620 = _3618 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3622 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3624 = _3622 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3626 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3628 = _3626 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3630 = _3602 * _3608;
                    float _3632 = precise::clamp(_3630, 0.0, 1.0);
                    float _3634 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3636 = _3634 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3638 = fma(_3632, _3612, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3640 = fma(_3632, _3636, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3642 = fma(_3632, _3616, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3644 = fma(_3632, _3620, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3646 = fma(_3632, _3624, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3648 = fma(_3632, _3628, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3488 = _3640;
                    _3494 = _3646;
                    _3466 = _3638;
                    _3482 = _3644;
                    _3448 = _3642;
                    _3502 = _3648;
                    _3564 = true;
                }
                else
                {
                    _3488 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3494 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3466 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3482 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3448 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3502 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3564 = false;
    float _3650 = _3488;
    float _3652 = _3494;
    float _3654 = _3466;
    float _3656 = _3482;
    float _3658 = _3448;
    float _3660 = _3502;
    float _3662 = fma(_3402, -0.5, 0.5);
    float _3664 = precise::clamp(_3662, 0.0, 1.0);
    float _3666 = -_3650;
    float _3668 = _3666 + _3652;
    float _3670 = -_3654;
    float _3672 = _3670 + _3656;
    out.m_87.x = 0.0;
    float _3674 = fma(_3664, _3668, _3650);
    float _3676 = -_3658;
    float _3678 = _3676 + _3660;
    float _3680 = fma(_3664, _3672, _3654);
    float _3682 = _3674 * 0.586610972881317138671875;
    bool _3684 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3686 = fma(_3664, _3678, _3658);
    float _3688 = _3476 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3690 = fma(_3680, 0.298911988735198974609375, _3682);
    bool _3692 = _2785 > 0.0;
    bool _3694 = isnan(_2785);
    bool _3696 = _3692 || _3694;
    bool _3698 = isnan(0.0);
    bool _3700 = _3696 || _3698;
    float _3702 = fma(_3686, 0.114477999508380889892578125, _3690);
    out.m_49.x = _3688;
    bool _3704 = _2843 <= 0.0;
    bool _3706 = !_3700;
    bool _3708 = _3704 || _3706;
    float _3710 = -_3702;
    float _3712 = _3680 + _3710;
    float _3714 = -_3702;
    float _3716 = _3674 + _3714;
    float _3718 = -_3702;
    float _3720 = _3686 + _3718;
    float _3722 = fma(_3712, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3702);
    float _3724 = fma(_3716, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3702);
    float _3726 = fma(_3720, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3702);
    bool _3728 = !_3684;
    if (!_3728)
    {
        float _3730 = -_2715;
        float _3732 = _3730 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3734 = -_2717;
        float _3736 = _3734 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3738 = -_2719;
        float _3740 = _3738 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3742 = _3732 * _3732;
        float _3744 = fma(_3736, _3736, _3742);
        float _3746 = fma(_3740, _3740, _3744);
        float _3748 = sqrt(_3746);
        float _3750 = rsqrt(_3746);
        float _3752 = -_3748;
        float _3754 = _3752 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3756 = _3754 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3758 = precise::clamp(_3756, 0.0, 1.0);
        float _3760 = _3736 * _3750;
        float _3762 = _3732 * _3750;
        float _3764 = abs(_3758);
        float _3766 = log2(_3764);
        float _3768 = _3740 * _3750;
        float _3770 = _3760 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3772 = _3402 * _3762;
        float _3774 = -_3762;
        float _3776 = -_3770;
        float _3778 = fma(_3774, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3776);
        float _3780 = fma(_3400, _3760, _3772);
        float _3782 = -_3768;
        float _3784 = fma(_3782, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3778);
        float _3786 = fma(_3404, _3768, _3780);
        float _3788 = precise::clamp(_3786, 0.0, 1.0);
        float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3792 = _3784 + _3790;
        float _3794 = _3766 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3796 = _3792 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3798 = precise::clamp(_3796, 0.0, 1.0);
        float _3800 = exp2(_3794);
        float _3802 = _3800 * _3798;
        float _3804 = _3788 * _3802;
        float _3806 = _3804 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3808 = _3804 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3810 = _3804 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3806;
        out.m_87.y = _3808;
        out.m_87.z = _3810;
    }
    out.m_89.x = _3722;
    out.m_89.y = _3724;
    out.m_89.z = _3726;
    if (!_3708)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3812 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3812;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

