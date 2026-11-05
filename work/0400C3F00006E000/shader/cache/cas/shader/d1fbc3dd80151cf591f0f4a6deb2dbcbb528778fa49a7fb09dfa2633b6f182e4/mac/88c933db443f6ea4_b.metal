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
    float4 m_71 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_75 [[attribute(5)]];
    float4 m_73 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_59 [[attribute(10)]];
    float4 m_61 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3338 = false;
    bool _442 = false;
    bool _322 = false;
    bool _214 = false;
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
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3642 = as_type<float>(_122);
        out.gl_Position.z = _3642;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_51.w;
    float _128 = float(_108);
    float _130 = -_126;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_126);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    bool _144 = _132 >= _128;
    bool _146 = !_142;
    bool _148 = _144 || _146;
    float _150 = _126;
    float _152 = _132;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _150;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    if (_148)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3707 = as_type<float>(_158);
        out.gl_Position.z = _3707;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = 1.0 / _128;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _132 * _166;
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
    float _192 = _184;
    float _194 = _186;
    float _212;
    if (!_190)
    {
        float _196 = in.m_55.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _170;
    }
    _214 = false;
    float _216 = _212;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    bool _222 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _224 = isnan(_216);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    bool _238 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_216);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -_232;
    float _252 = _250 + 1.0;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _254;
    float _258 = 1.0 / _236;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = _248 * _252;
    float _264 = -_248;
    float _266 = _264 + 1.0;
    float _268 = _220 * _258;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    float _274 = fma(_256, _268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = fma(_272, _268, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _282 = _274 * _262;
    float _284 = fma(_278, _268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _286 = _280 * _262;
    float _288 = _284 * _262;
    float _290 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].x, _282);
    float _292 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].y, _288);
    float _294 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].z, _286);
    float _296 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].x, _290);
    float _298 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].y, _292);
    float _300 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].z, _294);
    bool _302 = !_260;
    float _320;
    if (!_302)
    {
        float _304 = in.m_55.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        _320 = _170;
    }
    _322 = false;
    float _324 = _320;
    float _326 = in.m_57.x;
    float _328 = in.m_57.y;
    float _330 = in.m_57.z;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _334 = _324 + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _336;
    bool _340 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _342 = isnan(_324);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    bool _352 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _354 = 1.0 / _338;
    float _356 = _298 * _328;
    bool _358 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _360 = isnan(_324);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = _334 * _354;
    float _372 = _300 * _330;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _374;
    float _378 = -_368;
    float _380 = _378 + 1.0;
    float _382 = _296 * _326;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _388;
    float _392 = _350 * _380;
    float _394 = fma(_376, _370, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _396 = fma(_386, _370, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _398 = fma(_390, _370, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _400 = -_350;
    float _402 = _400 + 1.0;
    float _404 = _394 * _392;
    float _406 = _396 * _392;
    float _408 = _398 * _392;
    float _410 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[107].y, _404);
    float _412 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[107].x, _406);
    float _414 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[107].z, _408);
    float _416 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[108].y, _410);
    float _418 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[108].x, _412);
    float _420 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[108].z, _414);
    bool _422 = !_352;
    float _440;
    if (!_422)
    {
        float _424 = in.m_55.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        _440 = _170;
    }
    _442 = false;
    float _444 = _440;
    float _446 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _448 = int(_446);
    float _450 = in.m_55.x;
    float _452 = in.m_55.y;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = _444 + _454;
    float _458 = in.m_59.x;
    float _460 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _462 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _464 = int(_462);
    float _466 = _420 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _468 = float(_448);
    float _470 = 1.0 / _468;
    float _472 = float(uint(_464));
    int _474 = ~_464;
    int _476 = _474 + 1;
    bool _478 = _464 == 0;
    float _480 = 1.0 / _472;
    int _482 = ~_464;
    int _484 = _482 + 1;
    int _486 = ~_464;
    int _488 = _486 + 1;
    int _490 = ~_464;
    int _492 = _490 + 1;
    float _494 = _470 * _132;
    float _496 = trunc(_494);
    int _498 = int(_496);
    int _500 = as_type<int>(_480) + (-2);
    float _502 = float(uint(_498));
    float _504 = as_type<float>(_500) * _502;
    float _506 = trunc(_504);
    float _508 = precise::max(_506, 0.0);
    uint _511 = uint(_508);
    int _513 = ~_464;
    int _515 = _513 + 1;
    int _517 = _476 * int(_511);
    int _519 = _517 + _498;
    float _521 = float(uint(_519));
    float _523 = as_type<float>(_500) * _521;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _527 = _525 != 0;
    float _529 = float(_464);
    float _531 = trunc(_523);
    float _533 = precise::max(_531, 0.0);
    uint _535 = uint(_533);
    bool _537 = !_527;
    float _539 = _537 ? 7.345489978790283203125 : 1.0;
    float _541 = _539 * _450;
    float _543 = floor(_541);
    int _545 = int(_511) + int(_535);
    float _547 = float(_498);
    int _549 = _515 * _545;
    int _551 = _549 + _498;
    bool _553 = _547 >= _529;
    bool _555 = isnan(_547);
    bool _557 = _553 || _555;
    bool _559 = isnan(_529);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    bool _565 = uint(_551) >= uint(_464);
    float _567 = -_543;
    float _569 = _541 + _567;
    float _571 = trunc(_563);
    int _573 = int(_571);
    bool _575 = !_565;
    int _577 = _575 ? 0 : (-1);
    float _579 = _569 * _529;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _583 = _581 != 0;
    int _585 = ~_545;
    int _587 = _585 + _577;
    int _589 = _587 + 1;
    float _591 = trunc(_579);
    int _593 = int(_591);
    float _595 = _529 * _132;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _599 = _597 != 0;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _607 = _605 != 0;
    int _609 = _464 * _589;
    int _611 = _609 + _498;
    float _613 = _595 * _166;
    bool _615 = !_583;
    int _617 = _615 ? 0 : 1;
    int _619 = ~_573;
    int _621 = _619 + 1;
    int _623 = _621 + 1;
    bool _625 = !_478;
    int _627 = _625 ? _611 : (-1);
    float _629 = trunc(_613);
    int _631 = int(_629);
    bool _633 = !_603;
    int _635 = _633 ? 0 : 1;
    bool _637 = !_599;
    int _639 = _637 ? 0 : 1;
    int _641 = _627 * _623;
    int _643 = _464 + (-1);
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _647 = _645 != 0;
    int _649 = abs(_617);
    int _651 = _573 * _643;
    int _653 = _651 + _641;
    int _655 = abs(_635);
    bool _657 = !_607;
    int _659 = _657 ? 0 : 1;
    int _661 = _593 * _649;
    int _663 = _661 + _498;
    int _665 = abs(_639);
    int _667 = _653 * _655;
    bool _669 = !_647;
    int _671 = _669 ? 0 : 1;
    int _673 = abs(_659);
    int _675 = abs(_671);
    float _677 = in.m_61.y;
    int _679 = _631 * _665;
    int _681 = _679 + _667;
    float _683 = in.m_61.z;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _687 = _685 != 0;
    int _689 = _663 * _673;
    int _691 = _689 + _681;
    int _693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _695 = _693 != 0;
    float _697 = in.m_59.y;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _701 = _699 != 0;
    int _703 = _593 * _675;
    int _705 = _703 + _691;
    bool _707 = _464 == 0;
    float _709 = float(uint(_705));
    float _711 = 0.0;
    if (_687)
    {
        float _713 = in.m_55.x;
        _711 = _713;
    }
    float _715 = _711;
    float _717 = 0.0;
    if (_687)
    {
        _717 = _458;
    }
    float _719 = _717;
    float _721 = as_type<float>(_500) * _709;
    int _723 = ~_464;
    int _725 = _723 + 1;
    out.m_63.y = _677;
    float _727 = trunc(_721);
    float _729 = precise::max(_727, 0.0);
    uint _731 = uint(_729);
    out.m_63.z = _683;
    float _733 = -_697;
    float _735 = _733 + 1.0;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _743 = _725 * int(_731);
    int _745 = _743 + _705;
    float _747 = float(uint(_745));
    float _749 = as_type<float>(_500) * _747;
    float _751 = in.m_61.x;
    float _753 = trunc(_749);
    float _755 = precise::max(_753, 0.0);
    uint _757 = uint(_755);
    int _759 = int(_731) + int(_757);
    float _761 = in.m_61.w;
    int _763 = _484 * _759;
    int _765 = _763 + _705;
    out.m_63.x = _751;
    bool _767 = uint(_765) >= uint(_464);
    float _769 = float(uint(_663));
    bool _771 = !_767;
    int _773 = _771 ? 0 : (-1);
    bool _775 = _452 > 0.5;
    float _777 = as_type<float>(_500) * _769;
    int _779 = ~_759;
    int _781 = _779 + _773;
    int _783 = _781 + 1;
    float _785 = trunc(_777);
    float _787 = precise::max(_785, 0.0);
    uint _789 = uint(_787);
    float _791 = _697;
    float _793 = _719;
    if (_695)
    {
        float _795 = _775 ? _735 : _697;
        _791 = _795;
    }
    float _797 = _791;
    int _799 = _464 * _783;
    int _801 = _799 + _705;
    bool _803 = _715 > 0.5;
    bool _805 = _803 && _687;
    float _807 = in.m_46.x;
    float _809 = in.m_46.y;
    float _811 = in.m_46.z;
    out.m_63.w = _761;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _815 = _452 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _817 = fma(_815, -2.0, _741);
    float _819 = _450 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _821 = _488 * int(_789);
    int _823 = _821 + _663;
    if (_805)
    {
        float _825 = -_719;
        float _827 = _825 + 1.0;
        _793 = _827;
    }
    float _829 = _793;
    float _831 = 1.0 / _739;
    float _833 = -_813;
    float _835 = fma(_819, 2.0, _833);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _841 = !_707;
    int _843 = _841 ? _801 : (-1);
    float _845 = float(uint(_823));
    int _847 = _843 >> 31;
    float _849 = 1.0 / _839;
    float _851 = _809 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _853 = _809 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _855 = _847 & 3;
    float _857 = as_type<float>(_500) * _845;
    float _859 = in.m_55.z;
    float _861 = _450 * 2.0;
    int _863 = _843 + _855;
    float _865 = fma(_807, (*spvDescriptorSet0.vp_c10)._m0[4].x, _851);
    float _867 = _809 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _869 = trunc(_857);
    float _871 = precise::max(_869, 0.0);
    uint _873 = uint(_871);
    int _875 = _863 >> 2;
    float _877 = fma(_807, (*spvDescriptorSet0.vp_c10)._m0[5].x, _853);
    float _879 = fma(_807, (*spvDescriptorSet0.vp_c10)._m0[6].x, _867);
    int _881 = _875 << 4;
    int _883 = _881 + 368;
    float _885 = _452 + _450;
    float _887 = as_type<float>(_875);
    if (!_687)
    {
        _887 = _458;
    }
    float _889 = _887;
    float _891 = floor(_861);
    uint _893 = uint(int(uint(_883) >> uint(2)));
    uint _895 = uint(int(uint(int(_893)) >> uint(2)));
    int _897 = int(_893) & 3;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[int(_895)][_897];
    int _901 = int(_893) + 1;
    uint _903 = uint(int(uint(_901) >> uint(2)));
    int _905 = _901 & 3;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[int(_903)][_905];
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _909;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _917 = _889;
    if (_687)
    {
        _917 = _829;
    }
    float _919 = _917;
    float _921 = _885 + (-1.0);
    float _923 = _911 * _831;
    float _925 = _915 * _849;
    int _927 = int(_789) + int(_873);
    int _929 = _883 + 8;
    uint _931 = uint(int(uint(_929) >> uint(2)));
    uint _933 = uint(int(uint(int(_931)) >> uint(2)));
    int _935 = int(_931) & 3;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[int(_933)][_935];
    int _939 = int(_931) + 1;
    uint _941 = uint(int(uint(_939) >> uint(2)));
    int _943 = _939 & 3;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[int(_941)][_943];
    int _947 = _843 & 3;
    bool _949 = _947 != 0;
    float _951 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _953 = _843 & 3;
    bool _955 = _953 != 0;
    int _957 = _492 * _927;
    int _959 = _957 + _663;
    bool _961 = uint(_947) > 1u;
    float _963 = _452 * 2.0;
    bool _965 = _891 > 0.0;
    float _967 = fma(_925, _456, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _969 = _891 >= 0.0;
    bool _971 = isnan(_891);
    bool _973 = _969 || _971;
    bool _975 = isnan(0.0);
    bool _977 = _973 || _975;
    float _979 = _452 + _859;
    float _981 = floor(_963);
    int _983 = _955 ? 0 : 1;
    float _985 = _979 + (-1.0);
    bool _987 = uint(_947) >= 2u;
    float _989 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[4].z, _865);
    bool _991 = !_949;
    int _993 = _991 ? 0 : 1;
    float _995 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _997 = ~_983;
    int _999 = _997 + 1;
    int _1001 = _999 + 1;
    int _1003 = _1001;
    if (!_961)
    {
        int _1005 = ~_983;
        int _1007 = _1005 + 1;
        _1003 = _1007;
    }
    int _1009 = _1003;
    bool _1011 = _947 != 3;
    float _1013 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1015 = int(_1013);
    bool _1017 = uint(_959) >= uint(_464);
    int _1019 = abs(_1009);
    int _1021 = _987 ? 0 : 1;
    bool _1023 = _947 != 3;
    bool _1025 = !_1017;
    int _1027 = _1025 ? 0 : (-1);
    int _1029 = abs(_993);
    int _1031 = ~_1019;
    int _1033 = _1031 + 1;
    int _1035 = _1033 + 1;
    int _1037 = ~_927;
    int _1039 = _1037 + _1027;
    int _1041 = _1039 + 1;
    int _1043 = ~_1029;
    int _1045 = _1043 + 1;
    int _1047 = _1045 + 1;
    int _1049 = _1035 * as_type<int>(_907);
    int _1051 = ~_1021;
    int _1053 = _1051 + 1;
    int _1055 = _1053 + 1;
    int _1057 = _464 * _1041;
    int _1059 = _1057 + _663;
    int _1061 = _1055;
    if (_1011)
    {
        int _1063 = ~_1021;
        int _1065 = _1063 + 1;
        _1061 = _1065;
    }
    int _1067 = _1061;
    int _1069 = _1047 * as_type<int>(_899);
    int _1071 = _1069 + _1049;
    bool _1073 = !_1023;
    int _1075 = _1073 ? 0 : (-1);
    float _1077 = _859 * 2.0;
    bool _1079 = !_701;
    int _1081 = _1079 ? 0 : 1;
    float _1083 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1085 = log2(_1083);
    int _1087 = abs(_1067);
    int _1089 = abs(_1075);
    int _1091 = abs(_1081);
    int _1093 = ~_1087;
    int _1095 = _1093 + 1;
    int _1097 = _1095 + 1;
    float _1099 = floor(_1077);
    int _1101 = abs(_1015);
    int _1103 = ~_1089;
    int _1105 = _1103 + 1;
    int _1107 = _1105 + 1;
    int _1109 = _1097 * as_type<int>(_937);
    int _1111 = _1109 + _1071;
    float _1113 = float(uint(_1015));
    int _1115 = _1107 * as_type<int>(_945);
    int _1117 = _1115 + _1111;
    bool _1119 = _981 > 0.0;
    bool _1121 = _981 >= 0.0;
    bool _1123 = isnan(_981);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan(0.0);
    bool _1129 = _1125 || _1127;
    float _1131 = 1.0 / _1113;
    float _1133 = float(uint(_1101));
    int _1135 = ~_1091;
    int _1137 = _1135 + 1;
    int _1139 = _1137 + 1;
    bool _1141 = !_707;
    int _1143 = _1141 ? _1059 : (-1);
    float _1145 = _1085 * _132;
    int _1147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1149 = _1147 != 0;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1153 = _1151 != 0;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1157 = _1155 != 0;
    int _1159 = _1117 * _1139;
    float _1161 = 1.0 / _1133;
    int _1163 = _977 ? 0 : 1;
    int _1165 = _1143 * _1091;
    int _1167 = _1165 + _1159;
    int _1169 = _1129 ? 0 : 1;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1173 = _444 + _1171;
    bool _1175 = _1099 > 0.0;
    bool _1177 = _1099 >= 0.0;
    bool _1179 = isnan(_1099);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan(0.0);
    bool _1185 = _1181 || _1183;
    float _1187 = exp2(_1145);
    bool _1189 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1191 = isnan(_444);
    bool _1193 = _1189 || _1191;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1197 = _1193 || _1195;
    float _1199 = float(_1197);
    float _1201 = fma(_923, _1173, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1203 = abs(_1167);
    float _1205 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[5].z, _877);
    int _1207 = as_type<int>(_1131) + (-2);
    float _1209 = -_1199;
    float _1211 = _1209 + 1.0;
    float _1213 = float(uint(_1167));
    bool _1215 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1217 = isnan(_444);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1223 = _1219 || _1221;
    float _1225 = float(_1223);
    int _1227 = as_type<int>(_1161) + (-2);
    float _1229 = as_type<float>(_1207) * _1213;
    float _1231 = float(uint(_1203));
    float _1233 = -_1225;
    float _1235 = _1233 + 1.0;
    bool _1237 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1239 = isnan(_444);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1245 = _1241 || _1243;
    float _1247 = float(_1245);
    float _1249 = _1225 * _1211;
    float _1251 = as_type<float>(_1227) * _1231;
    float _1253 = trunc(_1229);
    float _1255 = precise::max(_1253, 0.0);
    uint _1257 = uint(_1255);
    float _1259 = _1247 * _1235;
    float _1261 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[6].z, _879);
    float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1265 = 1.0 + _1263;
    int _1267 = ~_1015;
    int _1269 = _1267 + 1;
    float _1271 = -_1187;
    float _1273 = _1271 + 1.0;
    int _1275 = ~_1101;
    int _1277 = _1275 + 1;
    float _1279 = _1201 * _1259;
    float _1281 = trunc(_1251);
    float _1283 = precise::max(_1281, 0.0);
    uint _1285 = uint(_1283);
    bool _1287 = !_1153;
    int _1289 = _1287 ? 0 : 1;
    float _1291 = -_1247;
    float _1293 = _1291 + 1.0;
    bool _1295 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1297 = isnan(0.0);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1303 = _1299 || _1301;
    float _1305 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1279);
    float _1307 = _1303 ? _1273 : 0.0;
    int _1309 = _1269 * int(_1257);
    int _1311 = _1309 + _1167;
    float _1313 = 1.0 / _1265;
    bool _1315 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1317 = isnan(1.0);
    bool _1319 = _1315 || _1317;
    bool _1321 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1323 = _1319 || _1321;
    int _1325 = abs(_1289);
    float _1327 = float(uint(_1311));
    int _1329 = _1277 * int(_1285);
    int _1331 = _1329 + _1203;
    int _1333 = ~_1169;
    int _1335 = _1333 + 1;
    int _1337 = _1335 + 1;
    float _1339 = as_type<float>(_1207) * _1327;
    float _1341 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _817);
    float _1343 = float(uint(_1331));
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1349 = _1337;
    if (!_1119)
    {
        int _1351 = ~_1169;
        int _1353 = _1351 + 1;
        _1349 = _1353;
    }
    int _1355 = _1349;
    float _1357 = as_type<float>(_1227) * _1343;
    float _1359 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1345);
    float _1361 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1347);
    float _1363 = -_132;
    float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[76].x, _835);
    float _1367 = trunc(_1357);
    float _1369 = precise::max(_1367, 0.0);
    uint _1371 = uint(_1369);
    float _1373 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1359);
    float _1375 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1361);
    float _1377 = _1373;
    if (_1323)
    {
        float _1379 = _1307 * _1313;
        _152 = _1379;
    }
    float _1381 = _152;
    int _1383 = ~_1163;
    int _1385 = _1383 + 1;
    int _1387 = _1385 + 1;
    float _1389 = fma(_967, _1249, _1305);
    int _1391 = _1387;
    if (!_965)
    {
        int _1393 = ~_1163;
        int _1395 = _1393 + 1;
        _1391 = _1395;
    }
    int _1397 = _1391;
    float _1399 = _989 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1401 = trunc(_1339);
    float _1403 = precise::max(_1401, 0.0);
    uint _1405 = uint(_1403);
    float _1407 = _452 + (-0.5);
    float _1409 = float(_1397);
    float _1411 = _1205 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1413 = float(_1325);
    float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1417 = _1399 + _1415;
    int _1419 = ~_1101;
    int _1421 = _1419 + 1;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1425 = _1411 + _1423;
    int _1427 = int(_1285) + int(_1371);
    float _1429 = _1413 * _1409;
    int _1431 = ~_1015;
    int _1433 = _1431 + 1;
    float _1435 = _1261 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1437 = _1185 ? 0 : 1;
    int _1439 = _1421 * _1427;
    int _1441 = _1439 + _1203;
    bool _1443 = !_1149;
    int _1445 = _1443 ? 0 : 1;
    float _1447 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1449 = _1435 + _1447;
    int _1451 = int(_1257) + int(_1405);
    float _1453 = _1425 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1455 = ~_1437;
    int _1457 = _1455 + 1;
    int _1459 = _1457 + 1;
    int _1461 = _1459;
    if (!_1175)
    {
        int _1463 = ~_1437;
        int _1465 = _1463 + 1;
        _1461 = _1465;
    }
    int _1467 = _1461;
    int _1469 = _1433 * _1451;
    int _1471 = _1469 + _1167;
    float _1473 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1453);
    int _1475 = abs(_1445);
    float _1477 = in.m_65.x;
    float _1479 = in.m_65.y;
    float _1481 = in.m_65.z;
    bool _1483 = uint(_1441) >= uint(_1101);
    float _1485 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1473);
    bool _1487 = uint(_1471) >= uint(_1015);
    int _1489 = _1167 ^ _1015;
    float _1491 = float(_1475);
    float _1493 = float(_1467);
    bool _1495 = !_1483;
    int _1497 = _1495 ? 0 : (-1);
    bool _1499 = !_1487;
    int _1501 = _1499 ? 0 : (-1);
    float _1503 = _1491 * _1493;
    uint _1505 = uint(int(uint(_1489) >> uint(31)));
    float _1507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1509 = _1485 >= 0.0;
    int _1511 = ~_1497;
    int _1513 = _1427 + _1511;
    int _1515 = _1513 + 1;
    float _1517 = _1503 * (-2.0);
    int _1519 = ~_1451;
    int _1521 = _1519 + _1501;
    int _1523 = _1521 + 1;
    int _1525 = ~int(_1505);
    int _1527 = _1525 + 1;
    float _1529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1531 = _1015 == 0;
    int _1533 = _1015 * _1523;
    int _1535 = _1533 + _1167;
    int _1537 = _1515 ^ _1527;
    float _1539 = fma(_951, _1517, _951);
    bool _1541 = _1015 == 0;
    float _1543 = _1429 * (-2.0);
    int _1545 = ~_1527;
    int _1547 = _1545 + _1537;
    int _1549 = _1547 + 1;
    float _1551 = fma(_1517, _1477, _1477);
    bool _1553 = !_1531;
    int _1555 = _1553 ? _1535 : (-1);
    float _1557 = fma(_995, _1543, _995);
    bool _1559 = !_1541;
    int _1561 = _1559 ? _1549 : (-1);
    float _1563 = fma(_1543, _1479, _1479);
    float _1565 = float(_1555);
    float _1567 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1569 = float(_1561);
    float _1571 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1573 = _450 + (-0.5);
    float _1575 = fma(_1567, _919, -0.5);
    float _1577 = fma(_1567, _1565, _1365);
    float _1579 = fma(_1571, _797, -0.5);
    float _1581 = -_1341;
    float _1583 = fma(_1571, _1569, _1581);
    float _1585 = fma(_1573, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1551);
    float _1587 = fma(_1373, _1575, _1577);
    float _1589 = _1481;
    if (_1509)
    {
        _1377 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1591 = _1377;
    float _1593 = fma(_1375, _1579, _1583);
    float _1595 = _1425 * _1425;
    float _1597 = _1587 + 0.5;
    int _1599 = as_type<int>(_1591);
    if (_1509)
    {
        float _1601 = _1591 * 5.0;
        _1599 = as_type<int>(_1601);
    }
    int _1603 = _1599;
    float _1605 = fma(_1417, _1417, _1595);
    float _1607 = fma(_1407, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1563);
    float _1609 = _1593 + 0.5;
    float _1611 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1613 = fma(_1449, _1449, _1605);
    if (_1509)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5833 = as_type<float>(_1603);
        out.gl_Position.z = _5833;
    }
    float _1615 = fma(_1557, _1381, _1607);
    float _1617 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1389);
    float _1619 = rsqrt(_1613);
    float _1621 = _1617 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _1597;
    out.m_67.y = _1609;
    float _1623 = fma(_1539, _1381, _1585);
    float _1625 = _859 + _450;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1631 = _460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1633 = _1611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1635 = _466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1641 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1643 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1645 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1647 = !_1157;
    int _1649 = _1647 ? 0 : 1;
    out.m_69.x = _1631;
    out.m_69.y = _1633;
    out.m_69.z = _1635;
    out.m_69.w = _1621;
    float _1651 = _1425 * _1619;
    float _1653 = _1417 * _1619;
    int _1655 = abs(_1649);
    out.m_71.x = _1641;
    out.m_71.y = _1643;
    out.m_71.z = _1645;
    out.m_71.w = _1639;
    float _1657 = _1651;
    if (_1509)
    {
        out.m_49.x = 0.0;
    }
    if (_1509)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1659 = -_1651;
    float _1661 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1411);
    float _1663 = _1449 * _1619;
    float _1665 = -_1653;
    float _1667 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1399);
    float _1669 = float(_1355);
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1673 = _1661 + _1671;
    float _1675 = float(_1655);
    float _1677 = -_1663;
    float _1679 = fma(_1677, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1435);
    float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1683 = _1667 + _1681;
    float _1685 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1687 = _1625 + (-1.0);
    float _1689 = _1675 * _1669;
    float _1691 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1693 = _1679 + _1691;
    float _1695 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1685);
    float _1697 = _1615 * 0.15915493667125701904296875;
    float _1699 = -_1651;
    float _1701 = fma(_1699, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1425);
    float _1703 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1705 = _1689 * (-2.0);
    float _1707 = fma(_1693, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1695);
    float _1709 = _1701 * _1701;
    float _1711 = _859 + (-0.5);
    float _1713 = fma(_1703, _1705, _1703);
    float _1715 = fma(_1705, _1481, _1481);
    bool _1717 = _1707 >= 0.0;
    float _1719 = -_1653;
    float _1721 = fma(_1719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1417);
    float _1723 = -_1663;
    float _1725 = fma(_1723, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1449);
    float _1727 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1715);
    float _1729 = _1623 * 0.15915493667125701904296875;
    float _1731 = fma(_1721, _1721, _1709);
    float _1733 = _1697 * 6.283185482025146484375;
    float _1735 = sin(_1733);
    float _1737 = fma(_1713, _1381, _1727);
    float _1739 = fma(_1725, _1725, _1731);
    float _1741 = _1737 * 0.15915493667125701904296875;
    float _1743 = _1663;
    if (_1717)
    {
        _1589 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1745 = _1589;
    float _1747 = _1729 * 6.283185482025146484375;
    float _1749 = sin(_1747);
    int _1751 = as_type<int>(_1745);
    if (_1717)
    {
        out.m_49.x = 0.0;
    }
    if (_1717)
    {
        float _1753 = _1745 * 5.0;
        _1751 = as_type<int>(_1753);
    }
    int _1755 = _1751;
    float _1757 = _1729 * 6.283185482025146484375;
    float _1759 = cos(_1757);
    if (_1717)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6118 = as_type<float>(_1755);
        out.gl_Position.z = _6118;
    }
    float _1761 = _1697 * 6.283185482025146484375;
    float _1763 = cos(_1761);
    float _1765 = sqrt(_1739);
    float _1767 = _1741 * 6.283185482025146484375;
    float _1769 = sin(_1767);
    if (_1717)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1771 = _1749 * _1735;
    float _1773 = _1759 * _1763;
    float _1775 = -_1411;
    float _1777 = _1775 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1779 = _1619 * _1765;
    float _1781 = -_1399;
    float _1783 = _1781 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1785 = fma(_1769, _1773, _1771);
    float _1787 = fma(_1769, _1771, _1773);
    float _1789 = _1777 * _1777;
    float _1791 = in.m_73.x;
    float _1793 = in.m_73.y;
    float _1795 = in.m_73.z;
    float _1797 = _1741 * 6.283185482025146484375;
    float _1799 = cos(_1797);
    float _1801 = -_1435;
    float _1803 = _1801 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1805 = fma(_1783, _1783, _1789);
    float _1807 = _356 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1809 = _1759 * _1735;
    float _1811 = _1749 * _1763;
    float _1813 = fma(_1803, _1803, _1805);
    float _1815 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1817 = rsqrt(_1813);
    float _1819 = _1779 * _1807;
    float _1821 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1823 = _1759 * _1799;
    float _1825 = _1763 * _1799;
    float _1827 = _1749 * _1799;
    float _1829 = _1735 * _1799;
    float _1831 = -_1809;
    float _1833 = fma(_1769, _1811, _1831);
    float _1835 = -_1811;
    float _1837 = fma(_1769, _1809, _1835);
    float _1839 = _1779 * _1815;
    float _1841 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1791);
    float _1843 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1793);
    float _1845 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1821);
    float _1847 = _1783 * _1817;
    float _1849 = _1841 * _1839;
    float _1851 = _1411 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1853 = _1843 * _1819;
    float _1855 = _1803 * _1817;
    float _1857 = _1777 * _1817;
    float _1859 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1851);
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1863 = _1847 * _1861;
    float _1865 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1845);
    float _1867 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1869 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1859);
    float _1871 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1873 = _1855 * _1871;
    float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1877 = -_1863;
    float _1879 = fma(_1855, _1875, _1877);
    float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1883 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1881;
    float _1885 = _1869 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1887 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1891 = _1857 * _1889;
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1895 = -_1873;
    float _1897 = fma(_1857, _1893, _1895);
    float _1899 = _1879 * _1879;
    float _1901 = -_1885;
    float _1903 = _1887 + _1901;
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1907 = -_1891;
    float _1909 = fma(_1847, _1905, _1907);
    float _1911 = 1.0 / _1883;
    float _1913 = fma(_1897, _1897, _1899);
    float _1915 = _1779 * _1867;
    float _1917 = abs(_1903);
    float _1919 = precise::max(_1917, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1921 = fma(_1909, _1909, _1913);
    float _1923 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1925 = sqrt(_1813);
    float _1927 = precise::min(_1919, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1795);
    float _1931 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1923);
    bool _1933 = _1885 >= _1887;
    bool _1935 = isnan(_1885);
    bool _1937 = _1933 || _1935;
    bool _1939 = isnan(_1887);
    bool _1941 = _1937 || _1939;
    float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1945 = _1927 + _1943;
    float _1947 = -_1853;
    float _1949 = _1769 * _1947;
    float _1951 = rsqrt(_1921);
    float _1953 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1931);
    float _1955 = _1945 * _1911;
    float _1957 = _1823 * _1853;
    float _1959 = _1827 * _1853;
    bool _1961 = !_1941;
    float _1963 = _1961 ? 1.0 : (-1.0);
    float _1965 = _1929 * _1915;
    float _1967 = fma(_1825, _1849, _1949);
    float _1969 = abs(_1925);
    float _1971 = precise::max(0.0, _1969);
    float _1973 = rsqrt(_1953);
    float _1975 = _1963 * _1955;
    float _1977 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1979 = fma(_1785, _1849, _1957);
    float _1981 = fma(_1833, _1849, _1959);
    float _1983 = precise::min(_1971, 40.0);
    float _1985 = fma(_1829, _1965, _1967);
    float _1987 = _1909 * _1951;
    float _1989 = _1977 * _1975;
    float _1991 = _1897 * _1951;
    float _1993 = _1879 * _1951;
    float _1995 = _1847 * _1987;
    float _1997 = fma(_1983, -0.02500000037252902984619140625, 1.0);
    float _1999 = fma(_1837, _1965, _1979);
    float _2001 = _1855 * _1993;
    float _2003 = -_1995;
    float _2005 = fma(_1855, _1991, _2003);
    float _2007 = fma(_1787, _1965, _1981);
    float _2009 = _1857 * _1991;
    float _2011 = -_2001;
    float _2013 = fma(_1857, _1987, _2011);
    float _2015 = _2005 * _1999;
    float _2017 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2019 = -_2009;
    float _2021 = fma(_1847, _1993, _2019);
    float _2023 = _2013 * _1999;
    float _2025 = fma(_1993, _1985, _2015);
    float _2027 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2029 = _2017 * _2017;
    float _2031 = fma(_1991, _1985, _2023);
    float _2033 = fma(_1857, _2007, _2025);
    float _2035 = _2021 * _1999;
    float _2037 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2039 = fma(_2027, _2027, _2029);
    float _2041 = fma(_1847, _2007, _2031);
    float _2043 = _1411 + _2033;
    float _2045 = fma(_1987, _1985, _2035);
    float _2047 = fma(_2037, _2037, _2039);
    float _2049 = _1399 + _2041;
    float _2051 = _2043 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2053 = _2043 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2055 = fma(_1855, _2007, _2045);
    float _2057 = _2043 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2059 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2051);
    float _2061 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2053);
    float _2063 = _1435 + _2055;
    float _2065 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2057);
    float _2067 = _1411 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2069 = _1989 * 0.15915493667125701904296875;
    float _2071 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2061);
    float _2073 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2065);
    float _2075 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2067);
    float _2077 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2059);
    float _2079 = rsqrt(_2047);
    float _2081 = _2073 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2083 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2075);
    float _2085 = _2071 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2087 = _2077 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2089 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2091 = _2083 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2093 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2095 = _2069 * 6.283185482025146484375;
    float _2097 = cos(_2095);
    float _2099 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2089);
    float _2101 = -_2085;
    float _2103 = _2101 + _2091;
    float _2105 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2107 = fma(_1997, _2103, _2085);
    float _2109 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2093);
    float _2111 = _2069 * 6.283185482025146484375;
    float _2113 = sin(_2111);
    float _2115 = _2017 * _2079;
    float _2117 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2105);
    float _2119 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2109);
    float _2121 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2117);
    float _2123 = -_2097;
    float _2125 = _2123 + 1.0;
    float _2127 = _2027 * _2079;
    float _2129 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2099);
    float _2131 = _2037 * _2079;
    float _2133 = _2115 * _2125;
    float _2135 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2137 = _2135 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2139 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2141 = _2131 * _2131;
    float _2143 = _2127 * _2113;
    float _2145 = _2115 * _2113;
    float _2147 = _2131 * _2113;
    float _2149 = _2127 * _2125;
    float _2151 = _2119 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2153 = fma(_2131, _2133, _2143);
    float _2155 = -_1411;
    float _2157 = _2155 + _2139;
    float _2159 = fma(_2125, _2141, _2097);
    float _2161 = -_2147;
    float _2163 = fma(_2115, _2149, _2161);
    float _2165 = -_2145;
    float _2167 = fma(_2131, _2149, _2165);
    float _2169 = -_1399;
    float _2171 = _2169 + _2151;
    float _2173 = _2153 * _2157;
    float _2175 = _2121 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2177 = _2163 * _2157;
    float _2179 = fma(_2127, _2149, _2097);
    float _2181 = fma(_2167, _2171, _2173);
    float _2183 = -_1435;
    float _2185 = _2183 + _2175;
    float _2187 = fma(_170, _2137, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2189 = fma(_2179, _2171, _2177);
    float _2191 = fma(_2131, _2149, _2145);
    float _2193 = fma(_2159, _2185, _2181);
    float _2195 = fma(_2115, _2133, _2097);
    float _2197 = fma(_2115, _2149, _2147);
    float _2199 = fma(_2191, _2185, _2189);
    float _2201 = fma(_2193, _2187, _1435);
    float _2203 = _2195 * _2157;
    float _2205 = -_2143;
    float _2207 = fma(_2131, _2133, _2205);
    float _2209 = fma(_2199, _2187, _1399);
    float _2211 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2213 = _2201 + _2211;
    float _2215 = fma(_2197, _2171, _2203);
    float _2217 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2221 = _2209 + _2219;
    float _2223 = _2213 * _2213;
    float _2225 = fma(_2207, _2185, _2215);
    float _2227 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2217);
    float _2229 = fma(_2221, _2221, _2223);
    float _2231 = _1411 + _2225;
    float _2233 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2227);
    float _2235 = sqrt(_2229);
    bool _2237 = _2235 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2239 = _2225;
    float _2241 = _2227;
    float _2243 = _2201;
    if (!_2237)
    {
        _2239 = _2209;
    }
    float _2245 = _2239;
    float _2247 = _2245;
    if (!_2237)
    {
        _2241 = _2231;
    }
    float _2249 = _2241;
    bool _2251 = !_2237;
    float _2253 = _2249;
    if (!_2251)
    {
        float _2255 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2259 = _2235 + _2257;
        float _2261 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2263 = rsqrt(_2229);
        float _2265 = _2259 * _2255;
        float _2267 = _2265 * 0.15915493667125701904296875;
        float _2269 = _2267 * 6.283185482025146484375;
        float _2271 = cos(_2269);
        float _2273 = _2267 * 6.283185482025146484375;
        float _2275 = sin(_2273);
        float _2277 = _2271 + (-1.0);
        float _2279 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2281 = fma(_2275, _2261, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2283 = fma(_2231, _2271, _2279);
        float _2285 = _2263 * _2281;
        float _2287 = fma(_2221, _2285, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2289 = fma(_2213, _2285, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2253 = _2283;
        _2247 = _2287;
        _2243 = _2289;
    }
    float _2291 = _2253;
    float _2293 = _2247;
    float _2295 = _2243;
    float _2297 = -_1411;
    float _2299 = _2297 + _2291;
    float _2301 = -_1399;
    float _2303 = _2301 + _2293;
    float _2305 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2307 = -_1435;
    float _2309 = _2307 + _2295;
    float _2311 = _2299 * _2299;
    float _2313 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2315 = 1.0 / _2305;
    float _2317 = fma(_2303, _2303, _2311);
    float _2319 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2313);
    float _2321 = fma(_2309, _2309, _2317);
    float _2323 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2319);
    float _2325 = sqrt(_2321);
    float _2327 = _2323 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2329 = _2327 + _2305;
    float _2331 = _2329 * _2315;
    float _2333 = _2331 * 0.5;
    bool _2335 = _2325 > 0.0;
    float _2337 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2339 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2337);
    bool _2341 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2343 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan(0.5);
    bool _2349 = _2345 || _2347;
    float _2351 = 1.0 / _2339;
    bool _2353 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2355 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2357 = _2353 || _2355;
    bool _2359 = isnan(0.5);
    bool _2361 = _2357 || _2359;
    bool _2363 = !_2335;
    float _2365 = _2293;
    float _2367 = _2295;
    float _2369 = _2291;
    float _2371 = _2321;
    float _2373 = _2303;
    if (!_2363)
    {
        float _2375 = _186 * _186;
        float _2377 = rsqrt(_2321);
        float _2379 = fma(_184, _184, _2375);
        float _2381 = fma(_188, _188, _2379);
        float _2383 = sqrt(_2381);
        float _2385 = _2303 * _2377;
        float _2387 = _2299 * _2377;
        bool _2389 = _2383 > 0.0;
        float _2391 = _2309 * _2377;
        bool _2393 = !_2389;
        _2371 = _2377;
        if (!_2393)
        {
            float _2395 = rsqrt(_2381);
            float _2397 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2399 = _186 * _2395;
            float _2401 = _184 * _2395;
            float _2403 = _2387 * _2399;
            float _2405 = _188 * _2395;
            float _2407 = fma(_2385, _2401, _2403);
            float _2409 = _2397 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2411 = fma(_2391, _2405, _2407);
            float _2413 = _2411 * _2409;
            float _2415 = fma(_184, _2413, _2293);
            float _2417 = fma(_186, _2413, _2291);
            float _2419 = fma(_188, _2413, _2295);
            _2365 = _2415;
            _2367 = _2419;
            _2369 = _2417;
            _2371 = _2409;
            _2373 = _2405;
        }
    }
    float _2421 = _2365;
    float _2423 = _2367;
    float _2425 = _2369;
    float _2427 = _2371;
    float _2429 = _2373;
    float _2431 = -_1653;
    float _2433 = fma(_2431, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2421);
    float _2435 = -_1663;
    float _2437 = fma(_2435, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2423);
    float _2439 = -_1651;
    float _2441 = fma(_2439, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2425);
    float _2443 = _2433;
    float _2445 = _2441;
    float _2447 = _2429;
    float _2449 = _2427;
    if (_2361)
    {
        _1743 = 1.0;
    }
    float _2451 = _1743;
    float _2453 = _2451;
    if (_2349)
    {
        _1657 = _2433;
    }
    float _2455 = _1657;
    float _2457 = _2455;
    if (_2349)
    {
        _2443 = _2437;
    }
    float _2459 = _2443;
    float _2461 = _2459;
    if (!_2349)
    {
        float _2463 = _1673 * _1673;
        float _2465 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2467 = -_1435;
        float _2469 = _2467 + _2423;
        float _2471 = -_1411;
        float _2473 = _2471 + _2425;
        float _2475 = fma(_1683, _1683, _2463);
        float _2477 = -_1399;
        float _2479 = _2477 + _2421;
        float _2481 = fma(_1693, _1693, _2475);
        float _2483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2485 = sqrt(_2481);
        float _2487 = _2465 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2489 = 1.0 / _1779;
        float _2491 = precise::min(_2485, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2493 = _2491 * _2483;
        float _2495 = _2493 * _2489;
        float _2497 = _2487 * _2495;
        float _2499 = _2469 * _2495;
        float _2501 = fma(_2473, _2497, _1661);
        float _2503 = fma(_2479, _2497, _1667);
        float _2505 = fma(_2487, _2499, _1679);
        _192 = _2487;
        _2445 = _2501;
        _2457 = _2503;
        _2461 = _2505;
    }
    float _2507 = _192;
    float _2509 = _2445;
    float _2511 = _2457;
    float _2513 = _2461;
    float _2515 = _2507;
    if (_2361)
    {
        _2447 = 1.0;
    }
    float _2517 = _2447;
    float _2519 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2521 = _2351 * _2519;
    float _2523 = _2517;
    if (!_2361)
    {
        float _2525 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2527 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2529 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2527;
        float _2531 = _2525 * 0.15915493667125701904296875;
        float _2533 = 1.0 / _2529;
        float _2535 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2537 = _2531 * 6.283185482025146484375;
        float _2539 = cos(_2537);
        float _2541 = _2535 * 0.15915493667125701904296875;
        float _2543 = _2531 * 6.283185482025146484375;
        float _2545 = sin(_2543);
        float _2547 = 1.0 / _2539;
        float _2549 = _2541 * 6.283185482025146484375;
        float _2551 = cos(_2549);
        float _2553 = _2545 * _2547;
        float _2555 = _2541 * 6.283185482025146484375;
        float _2557 = sin(_2555);
        float _2559 = _2551 * _2553;
        float _2561 = 1.0 / _2559;
        float _2563 = _2557 * _2561;
        float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2567 = fma(_2521, _2563, _2565);
        float _2569 = _2567 * _2533;
        float _2571 = precise::clamp(_2569, 0.0, 1.0);
        _194 = _2541;
        _2515 = _2531;
        _2453 = _2571;
    }
    float _2573 = _194;
    float _2575 = _2515;
    float _2577 = _2453;
    float _2579 = _2575;
    float _2581 = _2573;
    if (!_2361)
    {
        float _2583 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2585 = _2583 * 0.15915493667125701904296875;
        float _2587 = _2585 * 6.283185482025146484375;
        float _2589 = cos(_2587);
        float _2591 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2593 = _2591 * 0.15915493667125701904296875;
        float _2595 = _2585 * 6.283185482025146484375;
        float _2597 = sin(_2595);
        float _2599 = 1.0 / _2589;
        float _2601 = _2593 * 6.283185482025146484375;
        float _2603 = cos(_2601);
        float _2605 = _2597 * _2599;
        float _2607 = _2593 * 6.283185482025146484375;
        float _2609 = sin(_2607);
        float _2611 = _2603 * _2605;
        float _2613 = 1.0 / _2611;
        float _2615 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2617 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2615;
        float _2619 = 1.0 / _2617;
        float _2621 = _2609 * _2613;
        float _2623 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2625 = fma(_2521, _2621, _2623);
        float _2627 = _2625 * _2619;
        float _2629 = precise::clamp(_2627, 0.0, 1.0);
        float _2631 = -_2629;
        float _2633 = _2631 + 1.0;
        _2579 = _2599;
        _2581 = _2589;
        _2523 = _2633;
    }
    float _2635 = _2579;
    float _2637 = _2581;
    float _2639 = _2523;
    float _2641 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2643 = _2509 + _2641;
    float _2645 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2647 = _2511 + _2645;
    float _2649 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2651 = _2513 + _2649;
    float _2653 = _2643 * _2643;
    float _2655 = fma(_2647, _2647, _2653);
    float _2657 = fma(_2651, _2651, _2655);
    float _2659 = rsqrt(_2657);
    float _2661 = sqrt(_2657);
    float _2663 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2665 = _2647 * _2663;
    float _2667 = _2651 * _2663;
    float _2669 = _2665 * _2665;
    float _2671 = _2667 * _2667;
    float _2673 = _2669 + _2671;
    float _2675 = sqrt(_2673);
    bool _2677 = _2675 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2679 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2681 = _2675 + _2679;
    float _2683 = _2651;
    float _2685 = _2637;
    float _2687 = _2681;
    float _2689 = _2635;
    float _2691 = _2643;
    float _2693 = _2673;
    float _2695 = _2669;
    if (_2677)
    {
        float _2697 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2683 = _2697;
    }
    float _2699 = _2683;
    if (_2677)
    {
        float _2701 = rsqrt(_2673);
        _2685 = _2701;
    }
    float _2703 = _2685;
    float _2705 = _2703;
    if (_2677)
    {
        float _2707 = _2681 * _2699;
        _2687 = _2707;
    }
    float _2709 = _2687;
    if (_2677)
    {
        float _2711 = _2709 * 0.15915493667125701904296875;
        _2689 = _2711;
    }
    float _2713 = _2689;
    float _2715 = _2653;
    if (_2677)
    {
        float _2717 = _2713 * 6.283185482025146484375;
        float _2719 = sin(_2717);
        _2715 = _2719;
    }
    float _2721 = _2715;
    float _2723 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2725 = precise::max(0.0, _2723);
    float _2727 = _2659;
    float _2729 = _2723;
    if (_2677)
    {
        float _2731 = _2713 * 6.283185482025146484375;
        float _2733 = cos(_2731);
        _2727 = _2733;
    }
    float _2735 = _2727;
    float _2737 = -_2663;
    float _2739 = -_2725;
    float _2741 = fma(_2643, _2737, _2739);
    if (_2677)
    {
        float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2729 = _2743;
    }
    float _2745 = _2729;
    float _2747 = _2509 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2749 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2751 = _2509 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2753 = _2745;
    float _2755 = _2721;
    if (_2677)
    {
        float _2757 = fma(_2721, _2745, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2753 = _2757;
    }
    float _2759 = _2753;
    float _2761 = _2759;
    if (!_2677)
    {
        _2755 = _2667;
    }
    float _2763 = _2755;
    float _2765 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2747);
    float _2767 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2751);
    float _2769 = _2763;
    float _2771 = _2735;
    if (_2677)
    {
        float _2773 = _2735 + (-1.0);
        _2691 = _2773;
    }
    float _2775 = _2691;
    if (_2677)
    {
        float _2777 = _2703 * _2759;
        _2449 = _2777;
    }
    float _2779 = _2449;
    if (!_2677)
    {
        _2705 = _2665;
    }
    float _2781 = _2705;
    float _2783 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2765);
    float _2785 = _2781;
    if (_2677)
    {
        float _2787 = _2775 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2693 = _2787;
    }
    float _2789 = _2693;
    if (_2677)
    {
        float _2791 = _2665 * _2779;
        _2785 = _2791;
    }
    float _2793 = _2785;
    if (!_2677)
    {
        _2761 = _2741;
    }
    float _2795 = _2761;
    float _2797 = _2795;
    if (_2677)
    {
        float _2799 = _2667 * _2779;
        _2769 = _2799;
    }
    float _2801 = _2769;
    if (_2677)
    {
        float _2803 = fma(_2741, _2735, _2789);
        _2797 = _2803;
    }
    float _2805 = _2797;
    if (_2677)
    {
        float _2807 = _2793 * _2793;
        _2695 = _2807;
    }
    float _2809 = _2695;
    if (!_2677)
    {
        _2771 = _2671;
    }
    float _2811 = _2771;
    float _2813 = _2811;
    if (_2677)
    {
        float _2815 = _2801 * _2801;
        _2813 = _2815;
    }
    float _2817 = _2813;
    float _2819 = fma(_2805, _2805, _2809);
    float _2821 = _2783 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2823 = floor(_2749);
    float _2825 = _2819 + _2817;
    float _2827 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2829 = fma(_2661, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2827);
    float _2831 = precise::clamp(_2829, 0.0, 1.0);
    float _2833 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2835 = _2509 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2837 = -_2831;
    float _2839 = _2837 + 1.0;
    float _2841 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2843 = rsqrt(_2825);
    float _2845 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2835);
    float _2847 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2849 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2767);
    float _2851 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2845);
    float _2853 = -_2841;
    float _2855 = fma(_2853, _2847, 1.0);
    float _2857 = _2849 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2859 = abs(_2839);
    float _2861 = log2(_2859);
    float _2863 = _2509 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2865 = _2851 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2867 = -_2823;
    float _2869 = _2749 + _2867;
    float _2871 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2863);
    float _2873 = _2843 * _2793;
    float _2875 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2871);
    float _2877 = _2843 * _2805;
    float _2879 = _2843 * _2801;
    float _2881 = _2873 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2883 = _2875 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2885 = floor(_2833);
    float _2887 = -_2881;
    float _2889 = fma(_2877, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2887);
    float _2891 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2893 = _2861 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2895 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2897 = -_2879;
    float _2899 = fma(_2897, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2889);
    float _2901 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2891);
    float _2903 = exp2(_2893);
    float _2905 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2907 = fma(_2899, -0.5, 0.5);
    float _2909 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2901);
    float _2911 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2895);
    float _2913 = fma(_2899, 0.5, 0.5);
    float _2915 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2909);
    float _2917 = log2(_2855);
    float _2919 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2905);
    float _2921 = -_2885;
    float _2923 = _2833 + _2921;
    float _2925 = _2877 + 1.0;
    float _2927 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2911);
    float _2929 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2919);
    float _2931 = fma(_2913, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2933 = 1.0 / _2915;
    float _2935 = -_2877;
    float _2937 = fma(_2903, _2925, _2935);
    float _2939 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2927);
    float _2941 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2929);
    float _2943 = fma(_2913, _2931, -0.212114393711090087890625);
    float _2945 = sqrt(_2907);
    float _2947 = _2917 * 0.693147182464599609375;
    float2 _8016 = float2(_2869, _2923);
    float _2949 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8016, float2(0.0), isnan(_8016)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8016, float2(0.0), isnan(_8016)), level(0.0)).x;
    float _2951 = fma(_2913, _2943, 1.570728778839111328125);
    float _2953 = fma(_2937, 0.5, 0.5);
    float _2955 = _2947 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2957 = _2939 * _2933;
    float _2959 = _2941 * _2933;
    float _2961 = fma(_2957, 0.5, 0.5);
    float _2963 = fma(_2959, -0.5, 0.5);
    float _2965 = _2945 * 0.636619746685028076171875;
    float _2967 = -_2951;
    float _2969 = fma(_2965, _2967, 1.0);
    float3 _8055 = float3(_2961, _2963, _2955);
    float _2971 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8055, float3(0.0), isnan(_8055)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8055, float3(0.0), isnan(_8055)), level(0.0)).x;
    float3 _8066 = float3(_2961, _2963, _2955);
    float4 _2974 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8066, float3(0.0), isnan(_8066)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8066, float3(0.0), isnan(_8066)), level(0.0)).xyzw;
    float _2976 = _2974.x;
    float _2978 = _2974.y;
    float _2980 = _2974.z;
    float _2982 = _2974.w;
    float2 _8082 = float2(_2969, _2953);
    float3 _2986 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8082, float2(0.0), isnan(_8082)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8082, float2(0.0), isnan(_8082)), level(0.0)).xyz;
    float _2988 = _2986.x;
    float _2990 = _2986.y;
    float _2992 = _2986.z;
    float _2994 = abs(_2521);
    float _2996 = log2(_2994);
    bool _2998 = _1793 != 0.0;
    bool _3000 = isnan(_1793);
    bool _3002 = _2998 || _3000;
    bool _3004 = isnan(0.0);
    bool _3006 = _3002 || _3004;
    out.m_71.x = _1641;
    out.m_71.y = _1643;
    out.m_71.z = _1645;
    out.m_71.w = _1639;
    float _3008 = _2861 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3010 = _1791 == 0.0;
    bool _3012 = !_3006;
    bool _3014 = _3010 && _3012;
    out.m_69.x = _1631;
    out.m_69.y = _1633;
    out.m_69.z = _1635;
    out.m_69.w = _1621;
    bool _3016 = _1795 == 0.0;
    bool _3018 = _3016 && _3014;
    float _3020 = exp2(_3008);
    bool _3022 = _2521 <= 8000.0;
    bool _3024 = isnan(_2521);
    bool _3026 = _3022 || _3024;
    bool _3028 = isnan(8000.0);
    bool _3030 = _3026 || _3028;
    float _3032 = float(_3030);
    float _3034 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3036 = _1785 * _2005;
    float _3038 = in.m_75.x;
    float _3040 = in.m_75.y;
    float _3042 = in.m_75.z;
    float _3044 = _1837 * _2013;
    float _3046 = _1785 * _2013;
    float _3048 = _1785 * _2021;
    float _3050 = exp2(_3034);
    float _3052 = fma(_1825, _1993, _3036);
    float _3054 = fma(_1825, _1991, _3046);
    float _3056 = fma(_1825, _1987, _3048);
    float _3058 = fma(_1829, _1991, _3044);
    float _3060 = fma(_1833, _1857, _3052);
    float _3062 = fma(_1833, _1847, _3054);
    float _3064 = fma(_1833, _1855, _3056);
    float _3066 = -_3020;
    float _3068 = _3066 + 1.0;
    float _3070 = fma(_1787, _1847, _3058);
    float _3072 = _3068 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3074 = fma(_3050, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3076 = precise::clamp(_3074, 0.0, 1.0);
    float _3078 = _1837 * _2021;
    float _3080 = fma(_3076, -2.0, 3.0);
    float _3082 = _3076 * _3076;
    float _3084 = _3040;
    float _3086 = _3038;
    float _3088 = _3042;
    float _3090 = _3064;
    if (!_3018)
    {
        float _3092 = fma(_1793, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3040);
        _3084 = _3092;
    }
    float _3094 = _3084;
    float _3096 = _1823 * _2005;
    if (!_3018)
    {
        float _3098 = fma(_1791, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3038);
        _3086 = _3098;
    }
    float _3100 = _3086;
    float _3102 = _3082 * _3080;
    float _3104 = _1823 * _2013;
    float _3106 = -_1769;
    float _3108 = fma(_3106, _1993, _3096);
    float _3110 = _1823 * _2021;
    float _3112 = -_3102;
    float _3114 = _3112 + 1.0;
    float _3116 = _1837 * _2005;
    float _3118 = fma(_1827, _1857, _3108);
    float _3120 = -_1769;
    float _3122 = fma(_3120, _1991, _3104);
    float _3124 = fma(_3114, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3102);
    float _3126 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3128 = _3118 * _3094;
    float _3130 = -_1769;
    float _3132 = fma(_3130, _1987, _3110);
    float _3134 = _3032 * _3124;
    float _3136 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3126);
    float _3138 = fma(_3060, _3100, _3128);
    float _3140 = in.m_77.x;
    float _3142 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3144 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3136);
    float _3146 = fma(_1829, _1993, _3116);
    float _3148 = fma(_1827, _1847, _3122);
    float _3150 = fma(_1827, _1855, _3132);
    float _3152 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3144);
    if (!_3018)
    {
        float _3154 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3042);
        _3088 = _3154;
    }
    float _3156 = _3088;
    float _3158 = fma(_1787, _1857, _3146);
    float _3160 = _3148 * _3094;
    float _3162 = _3152 + _2915;
    float _3164 = fma(_1829, _1987, _3078);
    float _3166 = _3150 * _3094;
    float _3168 = fma(_3062, _3100, _3160);
    float _3170 = _3162 * 0.5;
    float _3172 = fma(_3158, _3156, _3138);
    float _3174 = fma(_1787, _1855, _3164);
    float _3176 = fma(_3064, _3100, _3166);
    float _3178 = -_3072;
    float _3180 = _3178 + 1.0;
    float _3182 = fma(_3070, _3156, _3168);
    float _3184 = fma(_3174, _3156, _3176);
    bool _3186 = _2661 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3188 = isnan(_2661);
    bool _3190 = _3186 || _3188;
    bool _3192 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3194 = _3190 || _3192;
    out.gl_Position.x = _2939;
    out.gl_Position.y = _2941;
    out.gl_Position.z = _3152;
    out.gl_Position.w = _2915;
    out.m_79.x = _3182;
    out.m_79.y = _3172;
    out.m_79.z = _3184;
    out.m_81.z = _3170;
    out.m_81.w = _2915;
    float _3196 = _3176;
    float _3198 = _2915;
    float _3200 = _3170;
    if (!_3194)
    {
        _3090 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3202 = _3090;
    float _3204 = _3202;
    float _3206 = _3202;
    if (!_3194)
    {
        _3196 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3208 = _3196;
    float _3210 = _3208;
    float _3212 = _3208;
    if (!_3194)
    {
        _3198 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3214 = _3198;
    float _3216 = _3214;
    float _3218 = _3214;
    if (!_3194)
    {
        _3200 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3220 = _3200;
    float _3222 = -_2949;
    float _3224 = _3222 + 1.0;
    float _3226 = _3224 * _3142;
    float _3228 = precise::clamp(_3226, 0.0, 1.0);
    float _3230 = -_3228;
    float _3232 = fma(_3230, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3234 = _3232 * _3140;
    float _3236 = _3234 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3238 = _3072 * _2971;
    float _3240 = _2982 * _3180;
    out.m_83.x = _3236;
    float _3242 = _2577 * _2639;
    float _3244 = _2982 * _3238;
    float _3246 = _2992 * _3238;
    float _3248 = _3242 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3250 = fma(_2988, _3244, _2976);
    float _3252 = fma(_2990, _3244, _2978);
    float _3254 = fma(_2982, _3246, _2980);
    float _3256 = _3244;
    float _3258 = _3242;
    float _3260 = _3220;
    float _3262 = _3220;
    if (!_3194)
    {
        _3256 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3264 = _3256;
    float _3266 = _3264;
    float _3268 = _3264;
    if (!_3194)
    {
        _3258 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3270 = _3258;
    out.m_85.x = _3250;
    out.m_85.y = _3252;
    out.m_85.z = _3254;
    out.m_85.w = _3240;
    bool _3272 = !_3194;
    float _3274 = _3270;
    float _3276 = _3270;
    if (!_3272)
    {
        bool _3278 = _2661 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3280 = isnan(_2661);
        bool _3282 = _3278 || _3280;
        bool _3284 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3286 = _3282 || _3284;
        if (!_3286)
        {
            float _3288 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3290 = _2661 + _3288;
            float _3292 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3294 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3292;
            float _3296 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3298 = _3296 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3300 = 1.0 / _3294;
            float _3302 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3304 = _3302 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3306 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3308 = _3306 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3312 = _3310 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3316 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3318 = _3290 * _3300;
            float _3320 = precise::clamp(_3318, 0.0, 1.0);
            float _3322 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3324 = _3322 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3326 = fma(_3320, _3298, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3328 = fma(_3320, _3324, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3330 = fma(_3320, _3304, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3332 = fma(_3320, _3308, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3334 = fma(_3320, _3312, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3336 = fma(_3320, _3316, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3262 = _3330;
            _3268 = _3334;
            _3218 = _3326;
            _3212 = _3332;
            _3206 = _3328;
            _3276 = _3336;
            _3338 = true;
        }
        else
        {
            bool _3340 = _2661 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3342 = isnan(_2661);
            bool _3344 = _3340 || _3342;
            bool _3346 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3348 = _3344 || _3346;
            if (!_3348)
            {
                _3216 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3350 = _3216;
            _3218 = _3350;
            if (!_3348)
            {
                _3260 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3352 = _3260;
            _3262 = _3352;
            if (!_3348)
            {
                _3204 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3354 = _3204;
            _3206 = _3354;
            if (!_3348)
            {
                _3210 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3356 = _3210;
            _3212 = _3356;
            if (!_3348)
            {
                _3266 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3358 = _3266;
            _3268 = _3358;
            if (!_3348)
            {
                _3274 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3360 = _3274;
            bool _3362 = !_3348;
            _3276 = _3360;
            if (!_3362)
            {
                bool _3364 = _2661 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3366 = isnan(_2661);
                bool _3368 = _3364 || _3366;
                bool _3370 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3372 = _3368 || _3370;
                if (!_3372)
                {
                    float _3374 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3376 = _2661 + _3374;
                    float _3378 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3380 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3378;
                    float _3382 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3384 = _3382 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3386 = 1.0 / _3380;
                    float _3388 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3390 = _3388 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3392 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3394 = _3392 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3396 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3398 = _3396 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3402 = _3400 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3404 = _3376 * _3386;
                    float _3406 = precise::clamp(_3404, 0.0, 1.0);
                    float _3408 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3410 = _3408 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3412 = fma(_3406, _3384, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3414 = fma(_3406, _3410, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3416 = fma(_3406, _3390, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3418 = fma(_3406, _3394, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3420 = fma(_3406, _3398, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3422 = fma(_3406, _3402, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3262 = _3416;
                    _3268 = _3420;
                    _3218 = _3412;
                    _3212 = _3418;
                    _3206 = _3414;
                    _3276 = _3422;
                    _3338 = true;
                }
                else
                {
                    _3262 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3268 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3218 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3212 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3206 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3276 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3338 = false;
    float _3424 = _3262;
    float _3426 = _3268;
    float _3428 = _3218;
    float _3430 = _3212;
    float _3432 = _3206;
    float _3434 = _3276;
    float _3436 = fma(_3172, -0.5, 0.5);
    float _3438 = precise::clamp(_3436, 0.0, 1.0);
    float _3440 = -_3424;
    float _3442 = _3440 + _3426;
    float _3444 = _3248 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3446 = -_3428;
    float _3448 = _3446 + _3430;
    float _3450 = fma(_3438, _3442, _3424);
    out.m_87.x = 0.0;
    float _3452 = -_3432;
    float _3454 = _3452 + _3434;
    float _3456 = fma(_3438, _3448, _3428);
    float _3458 = _3450 * 0.586610972881317138671875;
    out.m_49.x = _3444;
    bool _3460 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3462 = fma(_3438, _3454, _3432);
    float _3464 = fma(_3456, 0.298911988735198974609375, _3458);
    bool _3466 = _2577 > 0.0;
    bool _3468 = isnan(_2577);
    bool _3470 = _3466 || _3468;
    bool _3472 = isnan(0.0);
    bool _3474 = _3470 || _3472;
    float _3476 = fma(_3462, 0.114477999508380889892578125, _3464);
    bool _3478 = _2639 <= 0.0;
    bool _3480 = !_3474;
    bool _3482 = _3478 || _3480;
    float _3484 = -_3476;
    float _3486 = _3456 + _3484;
    float _3488 = -_3476;
    float _3490 = _3450 + _3488;
    float _3492 = -_3476;
    float _3494 = _3462 + _3492;
    float _3496 = fma(_3486, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3476);
    float _3498 = fma(_3490, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3476);
    float _3500 = fma(_3494, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3476);
    bool _3502 = !_3460;
    if (!_3502)
    {
        float _3504 = -_2509;
        float _3506 = _3504 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3508 = -_2511;
        float _3510 = _3508 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3512 = -_2513;
        float _3514 = _3512 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3516 = _3506 * _3506;
        float _3518 = fma(_3510, _3510, _3516);
        float _3520 = fma(_3514, _3514, _3518);
        float _3522 = sqrt(_3520);
        float _3524 = rsqrt(_3520);
        float _3526 = -_3522;
        float _3528 = _3526 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3530 = _3528 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3532 = precise::clamp(_3530, 0.0, 1.0);
        float _3534 = _3510 * _3524;
        float _3536 = _3506 * _3524;
        float _3538 = abs(_3532);
        float _3540 = log2(_3538);
        float _3542 = _3514 * _3524;
        float _3544 = _3534 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3546 = _3172 * _3536;
        float _3548 = -_3536;
        float _3550 = -_3544;
        float _3552 = fma(_3548, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3550);
        float _3554 = fma(_3182, _3534, _3546);
        float _3556 = -_3542;
        float _3558 = fma(_3556, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3552);
        float _3560 = fma(_3184, _3542, _3554);
        float _3562 = precise::clamp(_3560, 0.0, 1.0);
        float _3564 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3566 = _3558 + _3564;
        float _3568 = _3540 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3570 = _3566 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3572 = precise::clamp(_3570, 0.0, 1.0);
        float _3574 = exp2(_3568);
        float _3576 = _3574 * _3572;
        float _3578 = _3562 * _3576;
        float _3580 = _3578 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3582 = _3578 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3584 = _3578 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3580;
        out.m_87.y = _3582;
        out.m_87.z = _3584;
    }
    out.m_89.x = _3496;
    out.m_89.y = _3498;
    out.m_89.z = _3500;
    if (!_3482)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3586 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3586;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3338 = false;
    bool _442 = false;
    bool _322 = false;
    bool _214 = false;
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
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3642 = as_type<float>(_122);
        out.gl_Position.z = _3642;
    }
    if (!_112)
    {
        return out;
    }
    float _126 = in.m_51.w;
    float _128 = float(_108);
    float _130 = -_126;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_126);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    bool _144 = _132 >= _128;
    bool _146 = !_142;
    bool _148 = _144 || _146;
    float _150 = _126;
    float _152 = _132;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _150;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    if (_148)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3707 = as_type<float>(_158);
        out.gl_Position.z = _3707;
    }
    if (_148)
    {
        return out;
    }
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = 1.0 / _128;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _132 * _166;
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
    float _192 = _184;
    float _194 = _186;
    float _212;
    if (!_190)
    {
        float _196 = in.m_55.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _170;
    }
    _214 = false;
    float _216 = _212;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    bool _222 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _224 = isnan(_216);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    bool _238 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_216);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -_232;
    float _252 = _250 + 1.0;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _254;
    float _258 = 1.0 / _236;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = _248 * _252;
    float _264 = -_248;
    float _266 = _264 + 1.0;
    float _268 = _220 * _258;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    float _274 = fma(_256, _268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = fma(_272, _268, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _282 = _274 * _262;
    float _284 = fma(_278, _268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _286 = _280 * _262;
    float _288 = _284 * _262;
    float _290 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].x, _282);
    float _292 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].y, _288);
    float _294 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].z, _286);
    float _296 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].x, _290);
    float _298 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].y, _292);
    float _300 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].z, _294);
    bool _302 = !_260;
    float _320;
    if (!_302)
    {
        float _304 = in.m_55.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        _320 = _170;
    }
    _322 = false;
    float _324 = _320;
    float _326 = in.m_57.x;
    float _328 = in.m_57.y;
    float _330 = in.m_57.z;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _334 = _324 + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _336;
    bool _340 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _342 = isnan(_324);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    bool _352 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _354 = 1.0 / _338;
    float _356 = _298 * _328;
    bool _358 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _360 = isnan(_324);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = _334 * _354;
    float _372 = _300 * _330;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _374;
    float _378 = -_368;
    float _380 = _378 + 1.0;
    float _382 = _296 * _326;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _388;
    float _392 = _350 * _380;
    float _394 = fma(_376, _370, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _396 = fma(_386, _370, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _398 = fma(_390, _370, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _400 = -_350;
    float _402 = _400 + 1.0;
    float _404 = _394 * _392;
    float _406 = _396 * _392;
    float _408 = _398 * _392;
    float _410 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[107].y, _404);
    float _412 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[107].x, _406);
    float _414 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[107].z, _408);
    float _416 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[108].y, _410);
    float _418 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[108].x, _412);
    float _420 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[108].z, _414);
    bool _422 = !_352;
    float _440;
    if (!_422)
    {
        float _424 = in.m_55.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        _440 = _170;
    }
    _442 = false;
    float _444 = _440;
    float _446 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _448 = int(_446);
    float _450 = in.m_55.x;
    float _452 = in.m_55.y;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = _444 + _454;
    float _458 = in.m_59.x;
    float _460 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _462 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _464 = int(_462);
    float _466 = _420 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _468 = float(_448);
    float _470 = 1.0 / _468;
    float _472 = float(uint(_464));
    int _474 = ~_464;
    int _476 = _474 + 1;
    bool _478 = _464 == 0;
    float _480 = 1.0 / _472;
    int _482 = ~_464;
    int _484 = _482 + 1;
    int _486 = ~_464;
    int _488 = _486 + 1;
    int _490 = ~_464;
    int _492 = _490 + 1;
    float _494 = _470 * _132;
    float _496 = trunc(_494);
    int _498 = int(_496);
    int _500 = as_type<int>(_480) + (-2);
    float _502 = float(uint(_498));
    float _504 = as_type<float>(_500) * _502;
    float _506 = trunc(_504);
    float _508 = precise::max(_506, 0.0);
    uint _511 = uint(_508);
    int _513 = ~_464;
    int _515 = _513 + 1;
    int _517 = _476 * int(_511);
    int _519 = _517 + _498;
    float _521 = float(uint(_519));
    float _523 = as_type<float>(_500) * _521;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _527 = _525 != 0;
    float _529 = float(_464);
    float _531 = trunc(_523);
    float _533 = precise::max(_531, 0.0);
    uint _535 = uint(_533);
    bool _537 = !_527;
    float _539 = _537 ? 7.345489978790283203125 : 1.0;
    float _541 = _539 * _450;
    float _543 = floor(_541);
    int _545 = int(_511) + int(_535);
    float _547 = float(_498);
    int _549 = _515 * _545;
    int _551 = _549 + _498;
    bool _553 = _547 >= _529;
    bool _555 = isnan(_547);
    bool _557 = _553 || _555;
    bool _559 = isnan(_529);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    bool _565 = uint(_551) >= uint(_464);
    float _567 = -_543;
    float _569 = _541 + _567;
    float _571 = trunc(_563);
    int _573 = int(_571);
    bool _575 = !_565;
    int _577 = _575 ? 0 : (-1);
    float _579 = _569 * _529;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _583 = _581 != 0;
    int _585 = ~_545;
    int _587 = _585 + _577;
    int _589 = _587 + 1;
    float _591 = trunc(_579);
    int _593 = int(_591);
    float _595 = _529 * _132;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _599 = _597 != 0;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _607 = _605 != 0;
    int _609 = _464 * _589;
    int _611 = _609 + _498;
    float _613 = _595 * _166;
    bool _615 = !_583;
    int _617 = _615 ? 0 : 1;
    int _619 = ~_573;
    int _621 = _619 + 1;
    int _623 = _621 + 1;
    bool _625 = !_478;
    int _627 = _625 ? _611 : (-1);
    float _629 = trunc(_613);
    int _631 = int(_629);
    bool _633 = !_603;
    int _635 = _633 ? 0 : 1;
    bool _637 = !_599;
    int _639 = _637 ? 0 : 1;
    int _641 = _627 * _623;
    int _643 = _464 + (-1);
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _647 = _645 != 0;
    int _649 = abs(_617);
    int _651 = _573 * _643;
    int _653 = _651 + _641;
    int _655 = abs(_635);
    bool _657 = !_607;
    int _659 = _657 ? 0 : 1;
    int _661 = _593 * _649;
    int _663 = _661 + _498;
    int _665 = abs(_639);
    int _667 = _653 * _655;
    bool _669 = !_647;
    int _671 = _669 ? 0 : 1;
    int _673 = abs(_659);
    int _675 = abs(_671);
    float _677 = in.m_61.y;
    int _679 = _631 * _665;
    int _681 = _679 + _667;
    float _683 = in.m_61.z;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _687 = _685 != 0;
    int _689 = _663 * _673;
    int _691 = _689 + _681;
    int _693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _695 = _693 != 0;
    float _697 = in.m_59.y;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _701 = _699 != 0;
    int _703 = _593 * _675;
    int _705 = _703 + _691;
    bool _707 = _464 == 0;
    float _709 = float(uint(_705));
    float _711 = 0.0;
    if (_687)
    {
        float _713 = in.m_55.x;
        _711 = _713;
    }
    float _715 = _711;
    float _717 = 0.0;
    if (_687)
    {
        _717 = _458;
    }
    float _719 = _717;
    float _721 = as_type<float>(_500) * _709;
    int _723 = ~_464;
    int _725 = _723 + 1;
    out.m_63.y = _677;
    float _727 = trunc(_721);
    float _729 = precise::max(_727, 0.0);
    uint _731 = uint(_729);
    out.m_63.z = _683;
    float _733 = -_697;
    float _735 = _733 + 1.0;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _743 = _725 * int(_731);
    int _745 = _743 + _705;
    float _747 = float(uint(_745));
    float _749 = as_type<float>(_500) * _747;
    float _751 = in.m_61.x;
    float _753 = trunc(_749);
    float _755 = precise::max(_753, 0.0);
    uint _757 = uint(_755);
    int _759 = int(_731) + int(_757);
    float _761 = in.m_61.w;
    int _763 = _484 * _759;
    int _765 = _763 + _705;
    out.m_63.x = _751;
    bool _767 = uint(_765) >= uint(_464);
    float _769 = float(uint(_663));
    bool _771 = !_767;
    int _773 = _771 ? 0 : (-1);
    bool _775 = _452 > 0.5;
    float _777 = as_type<float>(_500) * _769;
    int _779 = ~_759;
    int _781 = _779 + _773;
    int _783 = _781 + 1;
    float _785 = trunc(_777);
    float _787 = precise::max(_785, 0.0);
    uint _789 = uint(_787);
    float _791 = _697;
    float _793 = _719;
    if (_695)
    {
        float _795 = _775 ? _735 : _697;
        _791 = _795;
    }
    float _797 = _791;
    int _799 = _464 * _783;
    int _801 = _799 + _705;
    bool _803 = _715 > 0.5;
    bool _805 = _803 && _687;
    float _807 = in.m_46.x;
    float _809 = in.m_46.y;
    float _811 = in.m_46.z;
    out.m_63.w = _761;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _815 = _452 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _817 = fma(_815, -2.0, _741);
    float _819 = _450 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _821 = _488 * int(_789);
    int _823 = _821 + _663;
    if (_805)
    {
        float _825 = -_719;
        float _827 = _825 + 1.0;
        _793 = _827;
    }
    float _829 = _793;
    float _831 = 1.0 / _739;
    float _833 = -_813;
    float _835 = fma(_819, 2.0, _833);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _841 = !_707;
    int _843 = _841 ? _801 : (-1);
    float _845 = float(uint(_823));
    int _847 = _843 >> 31;
    float _849 = 1.0 / _839;
    float _851 = _809 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _853 = _809 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _855 = _847 & 3;
    float _857 = as_type<float>(_500) * _845;
    float _859 = in.m_55.z;
    float _861 = _450 * 2.0;
    int _863 = _843 + _855;
    float _865 = fma(_807, (*spvDescriptorSet0.vp_c10)._m0[4].x, _851);
    float _867 = _809 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _869 = trunc(_857);
    float _871 = precise::max(_869, 0.0);
    uint _873 = uint(_871);
    int _875 = _863 >> 2;
    float _877 = fma(_807, (*spvDescriptorSet0.vp_c10)._m0[5].x, _853);
    float _879 = fma(_807, (*spvDescriptorSet0.vp_c10)._m0[6].x, _867);
    int _881 = _875 << 4;
    int _883 = _881 + 368;
    float _885 = _452 + _450;
    float _887 = as_type<float>(_875);
    if (!_687)
    {
        _887 = _458;
    }
    float _889 = _887;
    float _891 = floor(_861);
    uint _893 = uint(int(uint(_883) >> uint(2)));
    uint _895 = uint(int(uint(int(_893)) >> uint(2)));
    int _897 = int(_893) & 3;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[int(_895)][_897];
    int _901 = int(_893) + 1;
    uint _903 = uint(int(uint(_901) >> uint(2)));
    int _905 = _901 & 3;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[int(_903)][_905];
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _909;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _917 = _889;
    if (_687)
    {
        _917 = _829;
    }
    float _919 = _917;
    float _921 = _885 + (-1.0);
    float _923 = _911 * _831;
    float _925 = _915 * _849;
    int _927 = int(_789) + int(_873);
    int _929 = _883 + 8;
    uint _931 = uint(int(uint(_929) >> uint(2)));
    uint _933 = uint(int(uint(int(_931)) >> uint(2)));
    int _935 = int(_931) & 3;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[int(_933)][_935];
    int _939 = int(_931) + 1;
    uint _941 = uint(int(uint(_939) >> uint(2)));
    int _943 = _939 & 3;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[int(_941)][_943];
    int _947 = _843 & 3;
    bool _949 = _947 != 0;
    float _951 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _953 = _843 & 3;
    bool _955 = _953 != 0;
    int _957 = _492 * _927;
    int _959 = _957 + _663;
    bool _961 = uint(_947) > 1u;
    float _963 = _452 * 2.0;
    bool _965 = _891 > 0.0;
    float _967 = fma(_925, _456, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _969 = _891 >= 0.0;
    bool _971 = isnan(_891);
    bool _973 = _969 || _971;
    bool _975 = isnan(0.0);
    bool _977 = _973 || _975;
    float _979 = _452 + _859;
    float _981 = floor(_963);
    int _983 = _955 ? 0 : 1;
    float _985 = _979 + (-1.0);
    bool _987 = uint(_947) >= 2u;
    float _989 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[4].z, _865);
    bool _991 = !_949;
    int _993 = _991 ? 0 : 1;
    float _995 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _997 = ~_983;
    int _999 = _997 + 1;
    int _1001 = _999 + 1;
    int _1003 = _1001;
    if (!_961)
    {
        int _1005 = ~_983;
        int _1007 = _1005 + 1;
        _1003 = _1007;
    }
    int _1009 = _1003;
    bool _1011 = _947 != 3;
    float _1013 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1015 = int(_1013);
    bool _1017 = uint(_959) >= uint(_464);
    int _1019 = abs(_1009);
    int _1021 = _987 ? 0 : 1;
    bool _1023 = _947 != 3;
    bool _1025 = !_1017;
    int _1027 = _1025 ? 0 : (-1);
    int _1029 = abs(_993);
    int _1031 = ~_1019;
    int _1033 = _1031 + 1;
    int _1035 = _1033 + 1;
    int _1037 = ~_927;
    int _1039 = _1037 + _1027;
    int _1041 = _1039 + 1;
    int _1043 = ~_1029;
    int _1045 = _1043 + 1;
    int _1047 = _1045 + 1;
    int _1049 = _1035 * as_type<int>(_907);
    int _1051 = ~_1021;
    int _1053 = _1051 + 1;
    int _1055 = _1053 + 1;
    int _1057 = _464 * _1041;
    int _1059 = _1057 + _663;
    int _1061 = _1055;
    if (_1011)
    {
        int _1063 = ~_1021;
        int _1065 = _1063 + 1;
        _1061 = _1065;
    }
    int _1067 = _1061;
    int _1069 = _1047 * as_type<int>(_899);
    int _1071 = _1069 + _1049;
    bool _1073 = !_1023;
    int _1075 = _1073 ? 0 : (-1);
    float _1077 = _859 * 2.0;
    bool _1079 = !_701;
    int _1081 = _1079 ? 0 : 1;
    float _1083 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1085 = log2(_1083);
    int _1087 = abs(_1067);
    int _1089 = abs(_1075);
    int _1091 = abs(_1081);
    int _1093 = ~_1087;
    int _1095 = _1093 + 1;
    int _1097 = _1095 + 1;
    float _1099 = floor(_1077);
    int _1101 = abs(_1015);
    int _1103 = ~_1089;
    int _1105 = _1103 + 1;
    int _1107 = _1105 + 1;
    int _1109 = _1097 * as_type<int>(_937);
    int _1111 = _1109 + _1071;
    float _1113 = float(uint(_1015));
    int _1115 = _1107 * as_type<int>(_945);
    int _1117 = _1115 + _1111;
    bool _1119 = _981 > 0.0;
    bool _1121 = _981 >= 0.0;
    bool _1123 = isnan(_981);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan(0.0);
    bool _1129 = _1125 || _1127;
    float _1131 = 1.0 / _1113;
    float _1133 = float(uint(_1101));
    int _1135 = ~_1091;
    int _1137 = _1135 + 1;
    int _1139 = _1137 + 1;
    bool _1141 = !_707;
    int _1143 = _1141 ? _1059 : (-1);
    float _1145 = _1085 * _132;
    int _1147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1149 = _1147 != 0;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1153 = _1151 != 0;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1157 = _1155 != 0;
    int _1159 = _1117 * _1139;
    float _1161 = 1.0 / _1133;
    int _1163 = _977 ? 0 : 1;
    int _1165 = _1143 * _1091;
    int _1167 = _1165 + _1159;
    int _1169 = _1129 ? 0 : 1;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1173 = _444 + _1171;
    bool _1175 = _1099 > 0.0;
    bool _1177 = _1099 >= 0.0;
    bool _1179 = isnan(_1099);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan(0.0);
    bool _1185 = _1181 || _1183;
    float _1187 = exp2(_1145);
    bool _1189 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1191 = isnan(_444);
    bool _1193 = _1189 || _1191;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1197 = _1193 || _1195;
    float _1199 = float(_1197);
    float _1201 = fma(_923, _1173, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1203 = abs(_1167);
    float _1205 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[5].z, _877);
    int _1207 = as_type<int>(_1131) + (-2);
    float _1209 = -_1199;
    float _1211 = _1209 + 1.0;
    float _1213 = float(uint(_1167));
    bool _1215 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1217 = isnan(_444);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1223 = _1219 || _1221;
    float _1225 = float(_1223);
    int _1227 = as_type<int>(_1161) + (-2);
    float _1229 = as_type<float>(_1207) * _1213;
    float _1231 = float(uint(_1203));
    float _1233 = -_1225;
    float _1235 = _1233 + 1.0;
    bool _1237 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1239 = isnan(_444);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1245 = _1241 || _1243;
    float _1247 = float(_1245);
    float _1249 = _1225 * _1211;
    float _1251 = as_type<float>(_1227) * _1231;
    float _1253 = trunc(_1229);
    float _1255 = precise::max(_1253, 0.0);
    uint _1257 = uint(_1255);
    float _1259 = _1247 * _1235;
    float _1261 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[6].z, _879);
    float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1265 = 1.0 + _1263;
    int _1267 = ~_1015;
    int _1269 = _1267 + 1;
    float _1271 = -_1187;
    float _1273 = _1271 + 1.0;
    int _1275 = ~_1101;
    int _1277 = _1275 + 1;
    float _1279 = _1201 * _1259;
    float _1281 = trunc(_1251);
    float _1283 = precise::max(_1281, 0.0);
    uint _1285 = uint(_1283);
    bool _1287 = !_1153;
    int _1289 = _1287 ? 0 : 1;
    float _1291 = -_1247;
    float _1293 = _1291 + 1.0;
    bool _1295 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1297 = isnan(0.0);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1303 = _1299 || _1301;
    float _1305 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1279);
    float _1307 = _1303 ? _1273 : 0.0;
    int _1309 = _1269 * int(_1257);
    int _1311 = _1309 + _1167;
    float _1313 = 1.0 / _1265;
    bool _1315 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1317 = isnan(1.0);
    bool _1319 = _1315 || _1317;
    bool _1321 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1323 = _1319 || _1321;
    int _1325 = abs(_1289);
    float _1327 = float(uint(_1311));
    int _1329 = _1277 * int(_1285);
    int _1331 = _1329 + _1203;
    int _1333 = ~_1169;
    int _1335 = _1333 + 1;
    int _1337 = _1335 + 1;
    float _1339 = as_type<float>(_1207) * _1327;
    float _1341 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _817);
    float _1343 = float(uint(_1331));
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1349 = _1337;
    if (!_1119)
    {
        int _1351 = ~_1169;
        int _1353 = _1351 + 1;
        _1349 = _1353;
    }
    int _1355 = _1349;
    float _1357 = as_type<float>(_1227) * _1343;
    float _1359 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1345);
    float _1361 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1347);
    float _1363 = -_132;
    float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[76].x, _835);
    float _1367 = trunc(_1357);
    float _1369 = precise::max(_1367, 0.0);
    uint _1371 = uint(_1369);
    float _1373 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1359);
    float _1375 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1361);
    float _1377 = _1373;
    if (_1323)
    {
        float _1379 = _1307 * _1313;
        _152 = _1379;
    }
    float _1381 = _152;
    int _1383 = ~_1163;
    int _1385 = _1383 + 1;
    int _1387 = _1385 + 1;
    float _1389 = fma(_967, _1249, _1305);
    int _1391 = _1387;
    if (!_965)
    {
        int _1393 = ~_1163;
        int _1395 = _1393 + 1;
        _1391 = _1395;
    }
    int _1397 = _1391;
    float _1399 = _989 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1401 = trunc(_1339);
    float _1403 = precise::max(_1401, 0.0);
    uint _1405 = uint(_1403);
    float _1407 = _452 + (-0.5);
    float _1409 = float(_1397);
    float _1411 = _1205 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1413 = float(_1325);
    float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1417 = _1399 + _1415;
    int _1419 = ~_1101;
    int _1421 = _1419 + 1;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1425 = _1411 + _1423;
    int _1427 = int(_1285) + int(_1371);
    float _1429 = _1413 * _1409;
    int _1431 = ~_1015;
    int _1433 = _1431 + 1;
    float _1435 = _1261 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1437 = _1185 ? 0 : 1;
    int _1439 = _1421 * _1427;
    int _1441 = _1439 + _1203;
    bool _1443 = !_1149;
    int _1445 = _1443 ? 0 : 1;
    float _1447 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1449 = _1435 + _1447;
    int _1451 = int(_1257) + int(_1405);
    float _1453 = _1425 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1455 = ~_1437;
    int _1457 = _1455 + 1;
    int _1459 = _1457 + 1;
    int _1461 = _1459;
    if (!_1175)
    {
        int _1463 = ~_1437;
        int _1465 = _1463 + 1;
        _1461 = _1465;
    }
    int _1467 = _1461;
    int _1469 = _1433 * _1451;
    int _1471 = _1469 + _1167;
    float _1473 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1453);
    int _1475 = abs(_1445);
    float _1477 = in.m_65.x;
    float _1479 = in.m_65.y;
    float _1481 = in.m_65.z;
    bool _1483 = uint(_1441) >= uint(_1101);
    float _1485 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1473);
    bool _1487 = uint(_1471) >= uint(_1015);
    int _1489 = _1167 ^ _1015;
    float _1491 = float(_1475);
    float _1493 = float(_1467);
    bool _1495 = !_1483;
    int _1497 = _1495 ? 0 : (-1);
    bool _1499 = !_1487;
    int _1501 = _1499 ? 0 : (-1);
    float _1503 = _1491 * _1493;
    uint _1505 = uint(int(uint(_1489) >> uint(31)));
    float _1507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1509 = _1485 >= 0.0;
    int _1511 = ~_1497;
    int _1513 = _1427 + _1511;
    int _1515 = _1513 + 1;
    float _1517 = _1503 * (-2.0);
    int _1519 = ~_1451;
    int _1521 = _1519 + _1501;
    int _1523 = _1521 + 1;
    int _1525 = ~int(_1505);
    int _1527 = _1525 + 1;
    float _1529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1531 = _1015 == 0;
    int _1533 = _1015 * _1523;
    int _1535 = _1533 + _1167;
    int _1537 = _1515 ^ _1527;
    float _1539 = fma(_951, _1517, _951);
    bool _1541 = _1015 == 0;
    float _1543 = _1429 * (-2.0);
    int _1545 = ~_1527;
    int _1547 = _1545 + _1537;
    int _1549 = _1547 + 1;
    float _1551 = fma(_1517, _1477, _1477);
    bool _1553 = !_1531;
    int _1555 = _1553 ? _1535 : (-1);
    float _1557 = fma(_995, _1543, _995);
    bool _1559 = !_1541;
    int _1561 = _1559 ? _1549 : (-1);
    float _1563 = fma(_1543, _1479, _1479);
    float _1565 = float(_1555);
    float _1567 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1569 = float(_1561);
    float _1571 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1573 = _450 + (-0.5);
    float _1575 = fma(_1567, _919, -0.5);
    float _1577 = fma(_1567, _1565, _1365);
    float _1579 = fma(_1571, _797, -0.5);
    float _1581 = -_1341;
    float _1583 = fma(_1571, _1569, _1581);
    float _1585 = fma(_1573, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1551);
    float _1587 = fma(_1373, _1575, _1577);
    float _1589 = _1481;
    if (_1509)
    {
        _1377 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1591 = _1377;
    float _1593 = fma(_1375, _1579, _1583);
    float _1595 = _1425 * _1425;
    float _1597 = _1587 + 0.5;
    int _1599 = as_type<int>(_1591);
    if (_1509)
    {
        float _1601 = _1591 * 5.0;
        _1599 = as_type<int>(_1601);
    }
    int _1603 = _1599;
    float _1605 = fma(_1417, _1417, _1595);
    float _1607 = fma(_1407, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1563);
    float _1609 = _1593 + 0.5;
    float _1611 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1613 = fma(_1449, _1449, _1605);
    if (_1509)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5833 = as_type<float>(_1603);
        out.gl_Position.z = _5833;
    }
    float _1615 = fma(_1557, _1381, _1607);
    float _1617 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1389);
    float _1619 = rsqrt(_1613);
    float _1621 = _1617 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _1597;
    out.m_67.y = _1609;
    float _1623 = fma(_1539, _1381, _1585);
    float _1625 = _859 + _450;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1631 = _460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1633 = _1611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1635 = _466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1641 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1643 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1645 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1647 = !_1157;
    int _1649 = _1647 ? 0 : 1;
    out.m_69.x = _1631;
    out.m_69.y = _1633;
    out.m_69.z = _1635;
    out.m_69.w = _1621;
    float _1651 = _1425 * _1619;
    float _1653 = _1417 * _1619;
    int _1655 = abs(_1649);
    out.m_71.x = _1641;
    out.m_71.y = _1643;
    out.m_71.z = _1645;
    out.m_71.w = _1639;
    float _1657 = _1651;
    if (_1509)
    {
        out.m_49.x = 0.0;
    }
    if (_1509)
    {
        return out;
    }
    float _1659 = -_1651;
    float _1661 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1411);
    float _1663 = _1449 * _1619;
    float _1665 = -_1653;
    float _1667 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1399);
    float _1669 = float(_1355);
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1673 = _1661 + _1671;
    float _1675 = float(_1655);
    float _1677 = -_1663;
    float _1679 = fma(_1677, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1435);
    float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1683 = _1667 + _1681;
    float _1685 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1687 = _1625 + (-1.0);
    float _1689 = _1675 * _1669;
    float _1691 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1693 = _1679 + _1691;
    float _1695 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1685);
    float _1697 = _1615 * 0.15915493667125701904296875;
    float _1699 = -_1651;
    float _1701 = fma(_1699, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1425);
    float _1703 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1705 = _1689 * (-2.0);
    float _1707 = fma(_1693, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1695);
    float _1709 = _1701 * _1701;
    float _1711 = _859 + (-0.5);
    float _1713 = fma(_1703, _1705, _1703);
    float _1715 = fma(_1705, _1481, _1481);
    bool _1717 = _1707 >= 0.0;
    float _1719 = -_1653;
    float _1721 = fma(_1719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1417);
    float _1723 = -_1663;
    float _1725 = fma(_1723, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1449);
    float _1727 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1715);
    float _1729 = _1623 * 0.15915493667125701904296875;
    float _1731 = fma(_1721, _1721, _1709);
    float _1733 = _1697 * 6.283185482025146484375;
    float _1735 = sin(_1733);
    float _1737 = fma(_1713, _1381, _1727);
    float _1739 = fma(_1725, _1725, _1731);
    float _1741 = _1737 * 0.15915493667125701904296875;
    float _1743 = _1663;
    if (_1717)
    {
        _1589 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1745 = _1589;
    float _1747 = _1729 * 6.283185482025146484375;
    float _1749 = sin(_1747);
    int _1751 = as_type<int>(_1745);
    if (_1717)
    {
        out.m_49.x = 0.0;
    }
    if (_1717)
    {
        float _1753 = _1745 * 5.0;
        _1751 = as_type<int>(_1753);
    }
    int _1755 = _1751;
    float _1757 = _1729 * 6.283185482025146484375;
    float _1759 = cos(_1757);
    if (_1717)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6118 = as_type<float>(_1755);
        out.gl_Position.z = _6118;
    }
    float _1761 = _1697 * 6.283185482025146484375;
    float _1763 = cos(_1761);
    float _1765 = sqrt(_1739);
    float _1767 = _1741 * 6.283185482025146484375;
    float _1769 = sin(_1767);
    if (_1717)
    {
        return out;
    }
    float _1771 = _1749 * _1735;
    float _1773 = _1759 * _1763;
    float _1775 = -_1411;
    float _1777 = _1775 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1779 = _1619 * _1765;
    float _1781 = -_1399;
    float _1783 = _1781 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1785 = fma(_1769, _1773, _1771);
    float _1787 = fma(_1769, _1771, _1773);
    float _1789 = _1777 * _1777;
    float _1791 = in.m_73.x;
    float _1793 = in.m_73.y;
    float _1795 = in.m_73.z;
    float _1797 = _1741 * 6.283185482025146484375;
    float _1799 = cos(_1797);
    float _1801 = -_1435;
    float _1803 = _1801 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1805 = fma(_1783, _1783, _1789);
    float _1807 = _356 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1809 = _1759 * _1735;
    float _1811 = _1749 * _1763;
    float _1813 = fma(_1803, _1803, _1805);
    float _1815 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1817 = rsqrt(_1813);
    float _1819 = _1779 * _1807;
    float _1821 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1823 = _1759 * _1799;
    float _1825 = _1763 * _1799;
    float _1827 = _1749 * _1799;
    float _1829 = _1735 * _1799;
    float _1831 = -_1809;
    float _1833 = fma(_1769, _1811, _1831);
    float _1835 = -_1811;
    float _1837 = fma(_1769, _1809, _1835);
    float _1839 = _1779 * _1815;
    float _1841 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1791);
    float _1843 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1793);
    float _1845 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1821);
    float _1847 = _1783 * _1817;
    float _1849 = _1841 * _1839;
    float _1851 = _1411 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1853 = _1843 * _1819;
    float _1855 = _1803 * _1817;
    float _1857 = _1777 * _1817;
    float _1859 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1851);
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1863 = _1847 * _1861;
    float _1865 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1845);
    float _1867 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1869 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1859);
    float _1871 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1873 = _1855 * _1871;
    float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1877 = -_1863;
    float _1879 = fma(_1855, _1875, _1877);
    float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1883 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1881;
    float _1885 = _1869 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1887 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1891 = _1857 * _1889;
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1895 = -_1873;
    float _1897 = fma(_1857, _1893, _1895);
    float _1899 = _1879 * _1879;
    float _1901 = -_1885;
    float _1903 = _1887 + _1901;
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1907 = -_1891;
    float _1909 = fma(_1847, _1905, _1907);
    float _1911 = 1.0 / _1883;
    float _1913 = fma(_1897, _1897, _1899);
    float _1915 = _1779 * _1867;
    float _1917 = abs(_1903);
    float _1919 = precise::max(_1917, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1921 = fma(_1909, _1909, _1913);
    float _1923 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1925 = sqrt(_1813);
    float _1927 = precise::min(_1919, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1795);
    float _1931 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1923);
    bool _1933 = _1885 >= _1887;
    bool _1935 = isnan(_1885);
    bool _1937 = _1933 || _1935;
    bool _1939 = isnan(_1887);
    bool _1941 = _1937 || _1939;
    float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1945 = _1927 + _1943;
    float _1947 = -_1853;
    float _1949 = _1769 * _1947;
    float _1951 = rsqrt(_1921);
    float _1953 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1931);
    float _1955 = _1945 * _1911;
    float _1957 = _1823 * _1853;
    float _1959 = _1827 * _1853;
    bool _1961 = !_1941;
    float _1963 = _1961 ? 1.0 : (-1.0);
    float _1965 = _1929 * _1915;
    float _1967 = fma(_1825, _1849, _1949);
    float _1969 = abs(_1925);
    float _1971 = precise::max(0.0, _1969);
    float _1973 = rsqrt(_1953);
    float _1975 = _1963 * _1955;
    float _1977 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1979 = fma(_1785, _1849, _1957);
    float _1981 = fma(_1833, _1849, _1959);
    float _1983 = precise::min(_1971, 40.0);
    float _1985 = fma(_1829, _1965, _1967);
    float _1987 = _1909 * _1951;
    float _1989 = _1977 * _1975;
    float _1991 = _1897 * _1951;
    float _1993 = _1879 * _1951;
    float _1995 = _1847 * _1987;
    float _1997 = fma(_1983, -0.02500000037252902984619140625, 1.0);
    float _1999 = fma(_1837, _1965, _1979);
    float _2001 = _1855 * _1993;
    float _2003 = -_1995;
    float _2005 = fma(_1855, _1991, _2003);
    float _2007 = fma(_1787, _1965, _1981);
    float _2009 = _1857 * _1991;
    float _2011 = -_2001;
    float _2013 = fma(_1857, _1987, _2011);
    float _2015 = _2005 * _1999;
    float _2017 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2019 = -_2009;
    float _2021 = fma(_1847, _1993, _2019);
    float _2023 = _2013 * _1999;
    float _2025 = fma(_1993, _1985, _2015);
    float _2027 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2029 = _2017 * _2017;
    float _2031 = fma(_1991, _1985, _2023);
    float _2033 = fma(_1857, _2007, _2025);
    float _2035 = _2021 * _1999;
    float _2037 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2039 = fma(_2027, _2027, _2029);
    float _2041 = fma(_1847, _2007, _2031);
    float _2043 = _1411 + _2033;
    float _2045 = fma(_1987, _1985, _2035);
    float _2047 = fma(_2037, _2037, _2039);
    float _2049 = _1399 + _2041;
    float _2051 = _2043 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2053 = _2043 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2055 = fma(_1855, _2007, _2045);
    float _2057 = _2043 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2059 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2051);
    float _2061 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2053);
    float _2063 = _1435 + _2055;
    float _2065 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2057);
    float _2067 = _1411 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2069 = _1989 * 0.15915493667125701904296875;
    float _2071 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2061);
    float _2073 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2065);
    float _2075 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2067);
    float _2077 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2059);
    float _2079 = rsqrt(_2047);
    float _2081 = _2073 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2083 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2075);
    float _2085 = _2071 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2087 = _2077 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2089 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2091 = _2083 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2093 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2095 = _2069 * 6.283185482025146484375;
    float _2097 = cos(_2095);
    float _2099 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2089);
    float _2101 = -_2085;
    float _2103 = _2101 + _2091;
    float _2105 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2107 = fma(_1997, _2103, _2085);
    float _2109 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2093);
    float _2111 = _2069 * 6.283185482025146484375;
    float _2113 = sin(_2111);
    float _2115 = _2017 * _2079;
    float _2117 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2105);
    float _2119 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2109);
    float _2121 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2117);
    float _2123 = -_2097;
    float _2125 = _2123 + 1.0;
    float _2127 = _2027 * _2079;
    float _2129 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2099);
    float _2131 = _2037 * _2079;
    float _2133 = _2115 * _2125;
    float _2135 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2137 = _2135 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2139 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2141 = _2131 * _2131;
    float _2143 = _2127 * _2113;
    float _2145 = _2115 * _2113;
    float _2147 = _2131 * _2113;
    float _2149 = _2127 * _2125;
    float _2151 = _2119 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2153 = fma(_2131, _2133, _2143);
    float _2155 = -_1411;
    float _2157 = _2155 + _2139;
    float _2159 = fma(_2125, _2141, _2097);
    float _2161 = -_2147;
    float _2163 = fma(_2115, _2149, _2161);
    float _2165 = -_2145;
    float _2167 = fma(_2131, _2149, _2165);
    float _2169 = -_1399;
    float _2171 = _2169 + _2151;
    float _2173 = _2153 * _2157;
    float _2175 = _2121 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2177 = _2163 * _2157;
    float _2179 = fma(_2127, _2149, _2097);
    float _2181 = fma(_2167, _2171, _2173);
    float _2183 = -_1435;
    float _2185 = _2183 + _2175;
    float _2187 = fma(_170, _2137, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2189 = fma(_2179, _2171, _2177);
    float _2191 = fma(_2131, _2149, _2145);
    float _2193 = fma(_2159, _2185, _2181);
    float _2195 = fma(_2115, _2133, _2097);
    float _2197 = fma(_2115, _2149, _2147);
    float _2199 = fma(_2191, _2185, _2189);
    float _2201 = fma(_2193, _2187, _1435);
    float _2203 = _2195 * _2157;
    float _2205 = -_2143;
    float _2207 = fma(_2131, _2133, _2205);
    float _2209 = fma(_2199, _2187, _1399);
    float _2211 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2213 = _2201 + _2211;
    float _2215 = fma(_2197, _2171, _2203);
    float _2217 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2221 = _2209 + _2219;
    float _2223 = _2213 * _2213;
    float _2225 = fma(_2207, _2185, _2215);
    float _2227 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2217);
    float _2229 = fma(_2221, _2221, _2223);
    float _2231 = _1411 + _2225;
    float _2233 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2227);
    float _2235 = sqrt(_2229);
    bool _2237 = _2235 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2239 = _2225;
    float _2241 = _2227;
    float _2243 = _2201;
    if (!_2237)
    {
        _2239 = _2209;
    }
    float _2245 = _2239;
    float _2247 = _2245;
    if (!_2237)
    {
        _2241 = _2231;
    }
    float _2249 = _2241;
    bool _2251 = !_2237;
    float _2253 = _2249;
    if (!_2251)
    {
        float _2255 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2259 = _2235 + _2257;
        float _2261 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2263 = rsqrt(_2229);
        float _2265 = _2259 * _2255;
        float _2267 = _2265 * 0.15915493667125701904296875;
        float _2269 = _2267 * 6.283185482025146484375;
        float _2271 = cos(_2269);
        float _2273 = _2267 * 6.283185482025146484375;
        float _2275 = sin(_2273);
        float _2277 = _2271 + (-1.0);
        float _2279 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2281 = fma(_2275, _2261, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2283 = fma(_2231, _2271, _2279);
        float _2285 = _2263 * _2281;
        float _2287 = fma(_2221, _2285, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2289 = fma(_2213, _2285, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2253 = _2283;
        _2247 = _2287;
        _2243 = _2289;
    }
    float _2291 = _2253;
    float _2293 = _2247;
    float _2295 = _2243;
    float _2297 = -_1411;
    float _2299 = _2297 + _2291;
    float _2301 = -_1399;
    float _2303 = _2301 + _2293;
    float _2305 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2307 = -_1435;
    float _2309 = _2307 + _2295;
    float _2311 = _2299 * _2299;
    float _2313 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2315 = 1.0 / _2305;
    float _2317 = fma(_2303, _2303, _2311);
    float _2319 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2313);
    float _2321 = fma(_2309, _2309, _2317);
    float _2323 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2319);
    float _2325 = sqrt(_2321);
    float _2327 = _2323 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2329 = _2327 + _2305;
    float _2331 = _2329 * _2315;
    float _2333 = _2331 * 0.5;
    bool _2335 = _2325 > 0.0;
    float _2337 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2339 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2337);
    bool _2341 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2343 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan(0.5);
    bool _2349 = _2345 || _2347;
    float _2351 = 1.0 / _2339;
    bool _2353 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2355 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2357 = _2353 || _2355;
    bool _2359 = isnan(0.5);
    bool _2361 = _2357 || _2359;
    bool _2363 = !_2335;
    float _2365 = _2293;
    float _2367 = _2295;
    float _2369 = _2291;
    float _2371 = _2321;
    float _2373 = _2303;
    if (!_2363)
    {
        float _2375 = _186 * _186;
        float _2377 = rsqrt(_2321);
        float _2379 = fma(_184, _184, _2375);
        float _2381 = fma(_188, _188, _2379);
        float _2383 = sqrt(_2381);
        float _2385 = _2303 * _2377;
        float _2387 = _2299 * _2377;
        bool _2389 = _2383 > 0.0;
        float _2391 = _2309 * _2377;
        bool _2393 = !_2389;
        _2371 = _2377;
        if (!_2393)
        {
            float _2395 = rsqrt(_2381);
            float _2397 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2399 = _186 * _2395;
            float _2401 = _184 * _2395;
            float _2403 = _2387 * _2399;
            float _2405 = _188 * _2395;
            float _2407 = fma(_2385, _2401, _2403);
            float _2409 = _2397 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2411 = fma(_2391, _2405, _2407);
            float _2413 = _2411 * _2409;
            float _2415 = fma(_184, _2413, _2293);
            float _2417 = fma(_186, _2413, _2291);
            float _2419 = fma(_188, _2413, _2295);
            _2365 = _2415;
            _2367 = _2419;
            _2369 = _2417;
            _2371 = _2409;
            _2373 = _2405;
        }
    }
    float _2421 = _2365;
    float _2423 = _2367;
    float _2425 = _2369;
    float _2427 = _2371;
    float _2429 = _2373;
    float _2431 = -_1653;
    float _2433 = fma(_2431, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2421);
    float _2435 = -_1663;
    float _2437 = fma(_2435, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2423);
    float _2439 = -_1651;
    float _2441 = fma(_2439, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2425);
    float _2443 = _2433;
    float _2445 = _2441;
    float _2447 = _2429;
    float _2449 = _2427;
    if (_2361)
    {
        _1743 = 1.0;
    }
    float _2451 = _1743;
    float _2453 = _2451;
    if (_2349)
    {
        _1657 = _2433;
    }
    float _2455 = _1657;
    float _2457 = _2455;
    if (_2349)
    {
        _2443 = _2437;
    }
    float _2459 = _2443;
    float _2461 = _2459;
    if (!_2349)
    {
        float _2463 = _1673 * _1673;
        float _2465 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2467 = -_1435;
        float _2469 = _2467 + _2423;
        float _2471 = -_1411;
        float _2473 = _2471 + _2425;
        float _2475 = fma(_1683, _1683, _2463);
        float _2477 = -_1399;
        float _2479 = _2477 + _2421;
        float _2481 = fma(_1693, _1693, _2475);
        float _2483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2485 = sqrt(_2481);
        float _2487 = _2465 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2489 = 1.0 / _1779;
        float _2491 = precise::min(_2485, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2493 = _2491 * _2483;
        float _2495 = _2493 * _2489;
        float _2497 = _2487 * _2495;
        float _2499 = _2469 * _2495;
        float _2501 = fma(_2473, _2497, _1661);
        float _2503 = fma(_2479, _2497, _1667);
        float _2505 = fma(_2487, _2499, _1679);
        _192 = _2487;
        _2445 = _2501;
        _2457 = _2503;
        _2461 = _2505;
    }
    float _2507 = _192;
    float _2509 = _2445;
    float _2511 = _2457;
    float _2513 = _2461;
    float _2515 = _2507;
    if (_2361)
    {
        _2447 = 1.0;
    }
    float _2517 = _2447;
    float _2519 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2521 = _2351 * _2519;
    float _2523 = _2517;
    if (!_2361)
    {
        float _2525 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2527 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2529 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2527;
        float _2531 = _2525 * 0.15915493667125701904296875;
        float _2533 = 1.0 / _2529;
        float _2535 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2537 = _2531 * 6.283185482025146484375;
        float _2539 = cos(_2537);
        float _2541 = _2535 * 0.15915493667125701904296875;
        float _2543 = _2531 * 6.283185482025146484375;
        float _2545 = sin(_2543);
        float _2547 = 1.0 / _2539;
        float _2549 = _2541 * 6.283185482025146484375;
        float _2551 = cos(_2549);
        float _2553 = _2545 * _2547;
        float _2555 = _2541 * 6.283185482025146484375;
        float _2557 = sin(_2555);
        float _2559 = _2551 * _2553;
        float _2561 = 1.0 / _2559;
        float _2563 = _2557 * _2561;
        float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2567 = fma(_2521, _2563, _2565);
        float _2569 = _2567 * _2533;
        float _2571 = precise::clamp(_2569, 0.0, 1.0);
        _194 = _2541;
        _2515 = _2531;
        _2453 = _2571;
    }
    float _2573 = _194;
    float _2575 = _2515;
    float _2577 = _2453;
    float _2579 = _2575;
    float _2581 = _2573;
    if (!_2361)
    {
        float _2583 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2585 = _2583 * 0.15915493667125701904296875;
        float _2587 = _2585 * 6.283185482025146484375;
        float _2589 = cos(_2587);
        float _2591 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2593 = _2591 * 0.15915493667125701904296875;
        float _2595 = _2585 * 6.283185482025146484375;
        float _2597 = sin(_2595);
        float _2599 = 1.0 / _2589;
        float _2601 = _2593 * 6.283185482025146484375;
        float _2603 = cos(_2601);
        float _2605 = _2597 * _2599;
        float _2607 = _2593 * 6.283185482025146484375;
        float _2609 = sin(_2607);
        float _2611 = _2603 * _2605;
        float _2613 = 1.0 / _2611;
        float _2615 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2617 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2615;
        float _2619 = 1.0 / _2617;
        float _2621 = _2609 * _2613;
        float _2623 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2625 = fma(_2521, _2621, _2623);
        float _2627 = _2625 * _2619;
        float _2629 = precise::clamp(_2627, 0.0, 1.0);
        float _2631 = -_2629;
        float _2633 = _2631 + 1.0;
        _2579 = _2599;
        _2581 = _2589;
        _2523 = _2633;
    }
    float _2635 = _2579;
    float _2637 = _2581;
    float _2639 = _2523;
    float _2641 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2643 = _2509 + _2641;
    float _2645 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2647 = _2511 + _2645;
    float _2649 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2651 = _2513 + _2649;
    float _2653 = _2643 * _2643;
    float _2655 = fma(_2647, _2647, _2653);
    float _2657 = fma(_2651, _2651, _2655);
    float _2659 = rsqrt(_2657);
    float _2661 = sqrt(_2657);
    float _2663 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2665 = _2647 * _2663;
    float _2667 = _2651 * _2663;
    float _2669 = _2665 * _2665;
    float _2671 = _2667 * _2667;
    float _2673 = _2669 + _2671;
    float _2675 = sqrt(_2673);
    bool _2677 = _2675 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2679 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2681 = _2675 + _2679;
    float _2683 = _2651;
    float _2685 = _2637;
    float _2687 = _2681;
    float _2689 = _2635;
    float _2691 = _2643;
    float _2693 = _2673;
    float _2695 = _2669;
    if (_2677)
    {
        float _2697 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2683 = _2697;
    }
    float _2699 = _2683;
    if (_2677)
    {
        float _2701 = rsqrt(_2673);
        _2685 = _2701;
    }
    float _2703 = _2685;
    float _2705 = _2703;
    if (_2677)
    {
        float _2707 = _2681 * _2699;
        _2687 = _2707;
    }
    float _2709 = _2687;
    if (_2677)
    {
        float _2711 = _2709 * 0.15915493667125701904296875;
        _2689 = _2711;
    }
    float _2713 = _2689;
    float _2715 = _2653;
    if (_2677)
    {
        float _2717 = _2713 * 6.283185482025146484375;
        float _2719 = sin(_2717);
        _2715 = _2719;
    }
    float _2721 = _2715;
    float _2723 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2725 = precise::max(0.0, _2723);
    float _2727 = _2659;
    float _2729 = _2723;
    if (_2677)
    {
        float _2731 = _2713 * 6.283185482025146484375;
        float _2733 = cos(_2731);
        _2727 = _2733;
    }
    float _2735 = _2727;
    float _2737 = -_2663;
    float _2739 = -_2725;
    float _2741 = fma(_2643, _2737, _2739);
    if (_2677)
    {
        float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2729 = _2743;
    }
    float _2745 = _2729;
    float _2747 = _2509 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2749 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2751 = _2509 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2753 = _2745;
    float _2755 = _2721;
    if (_2677)
    {
        float _2757 = fma(_2721, _2745, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2753 = _2757;
    }
    float _2759 = _2753;
    float _2761 = _2759;
    if (!_2677)
    {
        _2755 = _2667;
    }
    float _2763 = _2755;
    float _2765 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2747);
    float _2767 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2751);
    float _2769 = _2763;
    float _2771 = _2735;
    if (_2677)
    {
        float _2773 = _2735 + (-1.0);
        _2691 = _2773;
    }
    float _2775 = _2691;
    if (_2677)
    {
        float _2777 = _2703 * _2759;
        _2449 = _2777;
    }
    float _2779 = _2449;
    if (!_2677)
    {
        _2705 = _2665;
    }
    float _2781 = _2705;
    float _2783 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2765);
    float _2785 = _2781;
    if (_2677)
    {
        float _2787 = _2775 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2693 = _2787;
    }
    float _2789 = _2693;
    if (_2677)
    {
        float _2791 = _2665 * _2779;
        _2785 = _2791;
    }
    float _2793 = _2785;
    if (!_2677)
    {
        _2761 = _2741;
    }
    float _2795 = _2761;
    float _2797 = _2795;
    if (_2677)
    {
        float _2799 = _2667 * _2779;
        _2769 = _2799;
    }
    float _2801 = _2769;
    if (_2677)
    {
        float _2803 = fma(_2741, _2735, _2789);
        _2797 = _2803;
    }
    float _2805 = _2797;
    if (_2677)
    {
        float _2807 = _2793 * _2793;
        _2695 = _2807;
    }
    float _2809 = _2695;
    if (!_2677)
    {
        _2771 = _2671;
    }
    float _2811 = _2771;
    float _2813 = _2811;
    if (_2677)
    {
        float _2815 = _2801 * _2801;
        _2813 = _2815;
    }
    float _2817 = _2813;
    float _2819 = fma(_2805, _2805, _2809);
    float _2821 = _2783 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2823 = floor(_2749);
    float _2825 = _2819 + _2817;
    float _2827 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2829 = fma(_2661, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2827);
    float _2831 = precise::clamp(_2829, 0.0, 1.0);
    float _2833 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2835 = _2509 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2837 = -_2831;
    float _2839 = _2837 + 1.0;
    float _2841 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2843 = rsqrt(_2825);
    float _2845 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2835);
    float _2847 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2849 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2767);
    float _2851 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2845);
    float _2853 = -_2841;
    float _2855 = fma(_2853, _2847, 1.0);
    float _2857 = _2849 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2859 = abs(_2839);
    float _2861 = log2(_2859);
    float _2863 = _2509 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2865 = _2851 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2867 = -_2823;
    float _2869 = _2749 + _2867;
    float _2871 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2863);
    float _2873 = _2843 * _2793;
    float _2875 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2871);
    float _2877 = _2843 * _2805;
    float _2879 = _2843 * _2801;
    float _2881 = _2873 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2883 = _2875 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2885 = floor(_2833);
    float _2887 = -_2881;
    float _2889 = fma(_2877, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2887);
    float _2891 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2893 = _2861 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2895 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2897 = -_2879;
    float _2899 = fma(_2897, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2889);
    float _2901 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2891);
    float _2903 = exp2(_2893);
    float _2905 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2907 = fma(_2899, -0.5, 0.5);
    float _2909 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2901);
    float _2911 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2895);
    float _2913 = fma(_2899, 0.5, 0.5);
    float _2915 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2909);
    float _2917 = log2(_2855);
    float _2919 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2905);
    float _2921 = -_2885;
    float _2923 = _2833 + _2921;
    float _2925 = _2877 + 1.0;
    float _2927 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2911);
    float _2929 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2919);
    float _2931 = fma(_2913, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2933 = 1.0 / _2915;
    float _2935 = -_2877;
    float _2937 = fma(_2903, _2925, _2935);
    float _2939 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2927);
    float _2941 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2929);
    float _2943 = fma(_2913, _2931, -0.212114393711090087890625);
    float _2945 = sqrt(_2907);
    float _2947 = _2917 * 0.693147182464599609375;
    float2 _8016 = float2(_2869, _2923);
    float _2949 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8016, float2(0.0), isnan(_8016)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8016, float2(0.0), isnan(_8016)), level(0.0)).x;
    float _2951 = fma(_2913, _2943, 1.570728778839111328125);
    float _2953 = fma(_2937, 0.5, 0.5);
    float _2955 = _2947 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2957 = _2939 * _2933;
    float _2959 = _2941 * _2933;
    float _2961 = fma(_2957, 0.5, 0.5);
    float _2963 = fma(_2959, -0.5, 0.5);
    float _2965 = _2945 * 0.636619746685028076171875;
    float _2967 = -_2951;
    float _2969 = fma(_2965, _2967, 1.0);
    float3 _8055 = float3(_2961, _2963, _2955);
    float _2971 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8055, float3(0.0), isnan(_8055)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8055, float3(0.0), isnan(_8055)), level(0.0)).x;
    float3 _8066 = float3(_2961, _2963, _2955);
    float4 _2974 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8066, float3(0.0), isnan(_8066)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8066, float3(0.0), isnan(_8066)), level(0.0)).xyzw;
    float _2976 = _2974.x;
    float _2978 = _2974.y;
    float _2980 = _2974.z;
    float _2982 = _2974.w;
    float2 _8082 = float2(_2969, _2953);
    float3 _2986 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8082, float2(0.0), isnan(_8082)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8082, float2(0.0), isnan(_8082)), level(0.0)).xyz;
    float _2988 = _2986.x;
    float _2990 = _2986.y;
    float _2992 = _2986.z;
    float _2994 = abs(_2521);
    float _2996 = log2(_2994);
    bool _2998 = _1793 != 0.0;
    bool _3000 = isnan(_1793);
    bool _3002 = _2998 || _3000;
    bool _3004 = isnan(0.0);
    bool _3006 = _3002 || _3004;
    out.m_71.x = _1641;
    out.m_71.y = _1643;
    out.m_71.z = _1645;
    out.m_71.w = _1639;
    float _3008 = _2861 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3010 = _1791 == 0.0;
    bool _3012 = !_3006;
    bool _3014 = _3010 && _3012;
    out.m_69.x = _1631;
    out.m_69.y = _1633;
    out.m_69.z = _1635;
    out.m_69.w = _1621;
    bool _3016 = _1795 == 0.0;
    bool _3018 = _3016 && _3014;
    float _3020 = exp2(_3008);
    bool _3022 = _2521 <= 8000.0;
    bool _3024 = isnan(_2521);
    bool _3026 = _3022 || _3024;
    bool _3028 = isnan(8000.0);
    bool _3030 = _3026 || _3028;
    float _3032 = float(_3030);
    float _3034 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3036 = _1785 * _2005;
    float _3038 = in.m_75.x;
    float _3040 = in.m_75.y;
    float _3042 = in.m_75.z;
    float _3044 = _1837 * _2013;
    float _3046 = _1785 * _2013;
    float _3048 = _1785 * _2021;
    float _3050 = exp2(_3034);
    float _3052 = fma(_1825, _1993, _3036);
    float _3054 = fma(_1825, _1991, _3046);
    float _3056 = fma(_1825, _1987, _3048);
    float _3058 = fma(_1829, _1991, _3044);
    float _3060 = fma(_1833, _1857, _3052);
    float _3062 = fma(_1833, _1847, _3054);
    float _3064 = fma(_1833, _1855, _3056);
    float _3066 = -_3020;
    float _3068 = _3066 + 1.0;
    float _3070 = fma(_1787, _1847, _3058);
    float _3072 = _3068 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3074 = fma(_3050, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3076 = precise::clamp(_3074, 0.0, 1.0);
    float _3078 = _1837 * _2021;
    float _3080 = fma(_3076, -2.0, 3.0);
    float _3082 = _3076 * _3076;
    float _3084 = _3040;
    float _3086 = _3038;
    float _3088 = _3042;
    float _3090 = _3064;
    if (!_3018)
    {
        float _3092 = fma(_1793, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3040);
        _3084 = _3092;
    }
    float _3094 = _3084;
    float _3096 = _1823 * _2005;
    if (!_3018)
    {
        float _3098 = fma(_1791, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3038);
        _3086 = _3098;
    }
    float _3100 = _3086;
    float _3102 = _3082 * _3080;
    float _3104 = _1823 * _2013;
    float _3106 = -_1769;
    float _3108 = fma(_3106, _1993, _3096);
    float _3110 = _1823 * _2021;
    float _3112 = -_3102;
    float _3114 = _3112 + 1.0;
    float _3116 = _1837 * _2005;
    float _3118 = fma(_1827, _1857, _3108);
    float _3120 = -_1769;
    float _3122 = fma(_3120, _1991, _3104);
    float _3124 = fma(_3114, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3102);
    float _3126 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3128 = _3118 * _3094;
    float _3130 = -_1769;
    float _3132 = fma(_3130, _1987, _3110);
    float _3134 = _3032 * _3124;
    float _3136 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3126);
    float _3138 = fma(_3060, _3100, _3128);
    float _3140 = in.m_77.x;
    float _3142 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3144 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3136);
    float _3146 = fma(_1829, _1993, _3116);
    float _3148 = fma(_1827, _1847, _3122);
    float _3150 = fma(_1827, _1855, _3132);
    float _3152 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3144);
    if (!_3018)
    {
        float _3154 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3042);
        _3088 = _3154;
    }
    float _3156 = _3088;
    float _3158 = fma(_1787, _1857, _3146);
    float _3160 = _3148 * _3094;
    float _3162 = _3152 + _2915;
    float _3164 = fma(_1829, _1987, _3078);
    float _3166 = _3150 * _3094;
    float _3168 = fma(_3062, _3100, _3160);
    float _3170 = _3162 * 0.5;
    float _3172 = fma(_3158, _3156, _3138);
    float _3174 = fma(_1787, _1855, _3164);
    float _3176 = fma(_3064, _3100, _3166);
    float _3178 = -_3072;
    float _3180 = _3178 + 1.0;
    float _3182 = fma(_3070, _3156, _3168);
    float _3184 = fma(_3174, _3156, _3176);
    bool _3186 = _2661 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3188 = isnan(_2661);
    bool _3190 = _3186 || _3188;
    bool _3192 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3194 = _3190 || _3192;
    out.gl_Position.x = _2939;
    out.gl_Position.y = _2941;
    out.gl_Position.z = _3152;
    out.gl_Position.w = _2915;
    out.m_79.x = _3182;
    out.m_79.y = _3172;
    out.m_79.z = _3184;
    out.m_81.z = _3170;
    out.m_81.w = _2915;
    float _3196 = _3176;
    float _3198 = _2915;
    float _3200 = _3170;
    if (!_3194)
    {
        _3090 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3202 = _3090;
    float _3204 = _3202;
    float _3206 = _3202;
    if (!_3194)
    {
        _3196 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3208 = _3196;
    float _3210 = _3208;
    float _3212 = _3208;
    if (!_3194)
    {
        _3198 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3214 = _3198;
    float _3216 = _3214;
    float _3218 = _3214;
    if (!_3194)
    {
        _3200 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3220 = _3200;
    float _3222 = -_2949;
    float _3224 = _3222 + 1.0;
    float _3226 = _3224 * _3142;
    float _3228 = precise::clamp(_3226, 0.0, 1.0);
    float _3230 = -_3228;
    float _3232 = fma(_3230, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3234 = _3232 * _3140;
    float _3236 = _3234 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3238 = _3072 * _2971;
    float _3240 = _2982 * _3180;
    out.m_83.x = _3236;
    float _3242 = _2577 * _2639;
    float _3244 = _2982 * _3238;
    float _3246 = _2992 * _3238;
    float _3248 = _3242 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3250 = fma(_2988, _3244, _2976);
    float _3252 = fma(_2990, _3244, _2978);
    float _3254 = fma(_2982, _3246, _2980);
    float _3256 = _3244;
    float _3258 = _3242;
    float _3260 = _3220;
    float _3262 = _3220;
    if (!_3194)
    {
        _3256 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3264 = _3256;
    float _3266 = _3264;
    float _3268 = _3264;
    if (!_3194)
    {
        _3258 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3270 = _3258;
    out.m_85.x = _3250;
    out.m_85.y = _3252;
    out.m_85.z = _3254;
    out.m_85.w = _3240;
    bool _3272 = !_3194;
    float _3274 = _3270;
    float _3276 = _3270;
    if (!_3272)
    {
        bool _3278 = _2661 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3280 = isnan(_2661);
        bool _3282 = _3278 || _3280;
        bool _3284 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3286 = _3282 || _3284;
        if (!_3286)
        {
            float _3288 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3290 = _2661 + _3288;
            float _3292 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3294 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3292;
            float _3296 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3298 = _3296 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3300 = 1.0 / _3294;
            float _3302 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3304 = _3302 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3306 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3308 = _3306 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3312 = _3310 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3316 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3318 = _3290 * _3300;
            float _3320 = precise::clamp(_3318, 0.0, 1.0);
            float _3322 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3324 = _3322 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3326 = fma(_3320, _3298, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3328 = fma(_3320, _3324, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3330 = fma(_3320, _3304, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3332 = fma(_3320, _3308, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3334 = fma(_3320, _3312, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3336 = fma(_3320, _3316, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3262 = _3330;
            _3268 = _3334;
            _3218 = _3326;
            _3212 = _3332;
            _3206 = _3328;
            _3276 = _3336;
            _3338 = true;
        }
        else
        {
            bool _3340 = _2661 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3342 = isnan(_2661);
            bool _3344 = _3340 || _3342;
            bool _3346 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3348 = _3344 || _3346;
            if (!_3348)
            {
                _3216 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3350 = _3216;
            _3218 = _3350;
            if (!_3348)
            {
                _3260 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3352 = _3260;
            _3262 = _3352;
            if (!_3348)
            {
                _3204 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3354 = _3204;
            _3206 = _3354;
            if (!_3348)
            {
                _3210 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3356 = _3210;
            _3212 = _3356;
            if (!_3348)
            {
                _3266 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3358 = _3266;
            _3268 = _3358;
            if (!_3348)
            {
                _3274 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3360 = _3274;
            bool _3362 = !_3348;
            _3276 = _3360;
            if (!_3362)
            {
                bool _3364 = _2661 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3366 = isnan(_2661);
                bool _3368 = _3364 || _3366;
                bool _3370 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3372 = _3368 || _3370;
                if (!_3372)
                {
                    float _3374 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3376 = _2661 + _3374;
                    float _3378 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3380 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3378;
                    float _3382 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3384 = _3382 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3386 = 1.0 / _3380;
                    float _3388 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3390 = _3388 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3392 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3394 = _3392 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3396 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3398 = _3396 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3402 = _3400 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3404 = _3376 * _3386;
                    float _3406 = precise::clamp(_3404, 0.0, 1.0);
                    float _3408 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3410 = _3408 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3412 = fma(_3406, _3384, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3414 = fma(_3406, _3410, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3416 = fma(_3406, _3390, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3418 = fma(_3406, _3394, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3420 = fma(_3406, _3398, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3422 = fma(_3406, _3402, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3262 = _3416;
                    _3268 = _3420;
                    _3218 = _3412;
                    _3212 = _3418;
                    _3206 = _3414;
                    _3276 = _3422;
                    _3338 = true;
                }
                else
                {
                    _3262 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3268 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3218 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3212 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3206 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3276 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3338 = false;
    float _3424 = _3262;
    float _3426 = _3268;
    float _3428 = _3218;
    float _3430 = _3212;
    float _3432 = _3206;
    float _3434 = _3276;
    float _3436 = fma(_3172, -0.5, 0.5);
    float _3438 = precise::clamp(_3436, 0.0, 1.0);
    float _3440 = -_3424;
    float _3442 = _3440 + _3426;
    float _3444 = _3248 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3446 = -_3428;
    float _3448 = _3446 + _3430;
    float _3450 = fma(_3438, _3442, _3424);
    out.m_87.x = 0.0;
    float _3452 = -_3432;
    float _3454 = _3452 + _3434;
    float _3456 = fma(_3438, _3448, _3428);
    float _3458 = _3450 * 0.586610972881317138671875;
    out.m_49.x = _3444;
    bool _3460 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3462 = fma(_3438, _3454, _3432);
    float _3464 = fma(_3456, 0.298911988735198974609375, _3458);
    bool _3466 = _2577 > 0.0;
    bool _3468 = isnan(_2577);
    bool _3470 = _3466 || _3468;
    bool _3472 = isnan(0.0);
    bool _3474 = _3470 || _3472;
    float _3476 = fma(_3462, 0.114477999508380889892578125, _3464);
    bool _3478 = _2639 <= 0.0;
    bool _3480 = !_3474;
    bool _3482 = _3478 || _3480;
    float _3484 = -_3476;
    float _3486 = _3456 + _3484;
    float _3488 = -_3476;
    float _3490 = _3450 + _3488;
    float _3492 = -_3476;
    float _3494 = _3462 + _3492;
    float _3496 = fma(_3486, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3476);
    float _3498 = fma(_3490, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3476);
    float _3500 = fma(_3494, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3476);
    bool _3502 = !_3460;
    if (!_3502)
    {
        float _3504 = -_2509;
        float _3506 = _3504 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3508 = -_2511;
        float _3510 = _3508 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3512 = -_2513;
        float _3514 = _3512 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3516 = _3506 * _3506;
        float _3518 = fma(_3510, _3510, _3516);
        float _3520 = fma(_3514, _3514, _3518);
        float _3522 = sqrt(_3520);
        float _3524 = rsqrt(_3520);
        float _3526 = -_3522;
        float _3528 = _3526 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3530 = _3528 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3532 = precise::clamp(_3530, 0.0, 1.0);
        float _3534 = _3510 * _3524;
        float _3536 = _3506 * _3524;
        float _3538 = abs(_3532);
        float _3540 = log2(_3538);
        float _3542 = _3514 * _3524;
        float _3544 = _3534 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3546 = _3172 * _3536;
        float _3548 = -_3536;
        float _3550 = -_3544;
        float _3552 = fma(_3548, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3550);
        float _3554 = fma(_3182, _3534, _3546);
        float _3556 = -_3542;
        float _3558 = fma(_3556, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3552);
        float _3560 = fma(_3184, _3542, _3554);
        float _3562 = precise::clamp(_3560, 0.0, 1.0);
        float _3564 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3566 = _3558 + _3564;
        float _3568 = _3540 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3570 = _3566 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3572 = precise::clamp(_3570, 0.0, 1.0);
        float _3574 = exp2(_3568);
        float _3576 = _3574 * _3572;
        float _3578 = _3562 * _3576;
        float _3580 = _3578 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3582 = _3578 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3584 = _3578 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3580;
        out.m_87.y = _3582;
        out.m_87.z = _3584;
    }
    out.m_89.x = _3496;
    out.m_89.y = _3498;
    out.m_89.z = _3500;
    if (!_3482)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3586 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3586;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3338 = false;
    bool _442 = false;
    bool _322 = false;
    bool _214 = false;
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
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3642 = as_type<float>(_122);
        out.gl_Position.z = _3642;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_51.w;
    float _128 = float(_108);
    float _130 = -_126;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_126);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    bool _144 = _132 >= _128;
    bool _146 = !_142;
    bool _148 = _144 || _146;
    float _150 = _126;
    float _152 = _132;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _150;
    if (_148)
    {
        out.m_49.x = 0.0;
    }
    if (_148)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3707 = as_type<float>(_158);
        out.gl_Position.z = _3707;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = 1.0 / _128;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _132 * _166;
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
    float _192 = _184;
    float _194 = _186;
    float _212;
    if (!_190)
    {
        float _196 = in.m_55.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _170;
    }
    _214 = false;
    float _216 = _212;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    bool _222 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _224 = isnan(_216);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    bool _238 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_216);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -_232;
    float _252 = _250 + 1.0;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _254;
    float _258 = 1.0 / _236;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = _248 * _252;
    float _264 = -_248;
    float _266 = _264 + 1.0;
    float _268 = _220 * _258;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    float _274 = fma(_256, _268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = fma(_272, _268, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _282 = _274 * _262;
    float _284 = fma(_278, _268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _286 = _280 * _262;
    float _288 = _284 * _262;
    float _290 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].x, _282);
    float _292 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].y, _288);
    float _294 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].z, _286);
    float _296 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].x, _290);
    float _298 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].y, _292);
    float _300 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].z, _294);
    bool _302 = !_260;
    float _320;
    if (!_302)
    {
        float _304 = in.m_55.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        _320 = _170;
    }
    _322 = false;
    float _324 = _320;
    float _326 = in.m_57.x;
    float _328 = in.m_57.y;
    float _330 = in.m_57.z;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _334 = _324 + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _336;
    bool _340 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _342 = isnan(_324);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    bool _352 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _354 = 1.0 / _338;
    float _356 = _298 * _328;
    bool _358 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _360 = isnan(_324);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = _334 * _354;
    float _372 = _300 * _330;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _374;
    float _378 = -_368;
    float _380 = _378 + 1.0;
    float _382 = _296 * _326;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _388;
    float _392 = _350 * _380;
    float _394 = fma(_376, _370, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _396 = fma(_386, _370, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _398 = fma(_390, _370, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _400 = -_350;
    float _402 = _400 + 1.0;
    float _404 = _394 * _392;
    float _406 = _396 * _392;
    float _408 = _398 * _392;
    float _410 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[107].y, _404);
    float _412 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[107].x, _406);
    float _414 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[107].z, _408);
    float _416 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[108].y, _410);
    float _418 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[108].x, _412);
    float _420 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[108].z, _414);
    bool _422 = !_352;
    float _440;
    if (!_422)
    {
        float _424 = in.m_55.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        _440 = _170;
    }
    _442 = false;
    float _444 = _440;
    float _446 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _448 = int(_446);
    float _450 = in.m_55.x;
    float _452 = in.m_55.y;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = _444 + _454;
    float _458 = in.m_59.x;
    float _460 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _462 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _464 = int(_462);
    float _466 = _420 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _468 = float(_448);
    float _470 = 1.0 / _468;
    float _472 = float(uint(_464));
    int _474 = ~_464;
    int _476 = _474 + 1;
    bool _478 = _464 == 0;
    float _480 = 1.0 / _472;
    int _482 = ~_464;
    int _484 = _482 + 1;
    int _486 = ~_464;
    int _488 = _486 + 1;
    int _490 = ~_464;
    int _492 = _490 + 1;
    float _494 = _470 * _132;
    float _496 = trunc(_494);
    int _498 = int(_496);
    int _500 = as_type<int>(_480) + (-2);
    float _502 = float(uint(_498));
    float _504 = as_type<float>(_500) * _502;
    float _506 = trunc(_504);
    float _508 = precise::max(_506, 0.0);
    uint _511 = uint(_508);
    int _513 = ~_464;
    int _515 = _513 + 1;
    int _517 = _476 * int(_511);
    int _519 = _517 + _498;
    float _521 = float(uint(_519));
    float _523 = as_type<float>(_500) * _521;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _527 = _525 != 0;
    float _529 = float(_464);
    float _531 = trunc(_523);
    float _533 = precise::max(_531, 0.0);
    uint _535 = uint(_533);
    bool _537 = !_527;
    float _539 = _537 ? 7.345489978790283203125 : 1.0;
    float _541 = _539 * _450;
    float _543 = floor(_541);
    int _545 = int(_511) + int(_535);
    float _547 = float(_498);
    int _549 = _515 * _545;
    int _551 = _549 + _498;
    bool _553 = _547 >= _529;
    bool _555 = isnan(_547);
    bool _557 = _553 || _555;
    bool _559 = isnan(_529);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    bool _565 = uint(_551) >= uint(_464);
    float _567 = -_543;
    float _569 = _541 + _567;
    float _571 = trunc(_563);
    int _573 = int(_571);
    bool _575 = !_565;
    int _577 = _575 ? 0 : (-1);
    float _579 = _569 * _529;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _583 = _581 != 0;
    int _585 = ~_545;
    int _587 = _585 + _577;
    int _589 = _587 + 1;
    float _591 = trunc(_579);
    int _593 = int(_591);
    float _595 = _529 * _132;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _599 = _597 != 0;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _607 = _605 != 0;
    int _609 = _464 * _589;
    int _611 = _609 + _498;
    float _613 = _595 * _166;
    bool _615 = !_583;
    int _617 = _615 ? 0 : 1;
    int _619 = ~_573;
    int _621 = _619 + 1;
    int _623 = _621 + 1;
    bool _625 = !_478;
    int _627 = _625 ? _611 : (-1);
    float _629 = trunc(_613);
    int _631 = int(_629);
    bool _633 = !_603;
    int _635 = _633 ? 0 : 1;
    bool _637 = !_599;
    int _639 = _637 ? 0 : 1;
    int _641 = _627 * _623;
    int _643 = _464 + (-1);
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _647 = _645 != 0;
    int _649 = abs(_617);
    int _651 = _573 * _643;
    int _653 = _651 + _641;
    int _655 = abs(_635);
    bool _657 = !_607;
    int _659 = _657 ? 0 : 1;
    int _661 = _593 * _649;
    int _663 = _661 + _498;
    int _665 = abs(_639);
    int _667 = _653 * _655;
    bool _669 = !_647;
    int _671 = _669 ? 0 : 1;
    int _673 = abs(_659);
    int _675 = abs(_671);
    float _677 = in.m_61.y;
    int _679 = _631 * _665;
    int _681 = _679 + _667;
    float _683 = in.m_61.z;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _687 = _685 != 0;
    int _689 = _663 * _673;
    int _691 = _689 + _681;
    int _693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _695 = _693 != 0;
    float _697 = in.m_59.y;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _701 = _699 != 0;
    int _703 = _593 * _675;
    int _705 = _703 + _691;
    bool _707 = _464 == 0;
    float _709 = float(uint(_705));
    float _711 = 0.0;
    if (_687)
    {
        float _713 = in.m_55.x;
        _711 = _713;
    }
    float _715 = _711;
    float _717 = 0.0;
    if (_687)
    {
        _717 = _458;
    }
    float _719 = _717;
    float _721 = as_type<float>(_500) * _709;
    int _723 = ~_464;
    int _725 = _723 + 1;
    out.m_63.y = _677;
    float _727 = trunc(_721);
    float _729 = precise::max(_727, 0.0);
    uint _731 = uint(_729);
    out.m_63.z = _683;
    float _733 = -_697;
    float _735 = _733 + 1.0;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _743 = _725 * int(_731);
    int _745 = _743 + _705;
    float _747 = float(uint(_745));
    float _749 = as_type<float>(_500) * _747;
    float _751 = in.m_61.x;
    float _753 = trunc(_749);
    float _755 = precise::max(_753, 0.0);
    uint _757 = uint(_755);
    int _759 = int(_731) + int(_757);
    float _761 = in.m_61.w;
    int _763 = _484 * _759;
    int _765 = _763 + _705;
    out.m_63.x = _751;
    bool _767 = uint(_765) >= uint(_464);
    float _769 = float(uint(_663));
    bool _771 = !_767;
    int _773 = _771 ? 0 : (-1);
    bool _775 = _452 > 0.5;
    float _777 = as_type<float>(_500) * _769;
    int _779 = ~_759;
    int _781 = _779 + _773;
    int _783 = _781 + 1;
    float _785 = trunc(_777);
    float _787 = precise::max(_785, 0.0);
    uint _789 = uint(_787);
    float _791 = _697;
    float _793 = _719;
    if (_695)
    {
        float _795 = _775 ? _735 : _697;
        _791 = _795;
    }
    float _797 = _791;
    int _799 = _464 * _783;
    int _801 = _799 + _705;
    bool _803 = _715 > 0.5;
    bool _805 = _803 && _687;
    float _807 = in.m_46.x;
    float _809 = in.m_46.y;
    float _811 = in.m_46.z;
    out.m_63.w = _761;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _815 = _452 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _817 = fma(_815, -2.0, _741);
    float _819 = _450 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _821 = _488 * int(_789);
    int _823 = _821 + _663;
    if (_805)
    {
        float _825 = -_719;
        float _827 = _825 + 1.0;
        _793 = _827;
    }
    float _829 = _793;
    float _831 = 1.0 / _739;
    float _833 = -_813;
    float _835 = fma(_819, 2.0, _833);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _841 = !_707;
    int _843 = _841 ? _801 : (-1);
    float _845 = float(uint(_823));
    int _847 = _843 >> 31;
    float _849 = 1.0 / _839;
    float _851 = _809 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _853 = _809 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _855 = _847 & 3;
    float _857 = as_type<float>(_500) * _845;
    float _859 = in.m_55.z;
    float _861 = _450 * 2.0;
    int _863 = _843 + _855;
    float _865 = fma(_807, (*spvDescriptorSet0.vp_c10)._m0[4].x, _851);
    float _867 = _809 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _869 = trunc(_857);
    float _871 = precise::max(_869, 0.0);
    uint _873 = uint(_871);
    int _875 = _863 >> 2;
    float _877 = fma(_807, (*spvDescriptorSet0.vp_c10)._m0[5].x, _853);
    float _879 = fma(_807, (*spvDescriptorSet0.vp_c10)._m0[6].x, _867);
    int _881 = _875 << 4;
    int _883 = _881 + 368;
    float _885 = _452 + _450;
    float _887 = as_type<float>(_875);
    if (!_687)
    {
        _887 = _458;
    }
    float _889 = _887;
    float _891 = floor(_861);
    uint _893 = uint(int(uint(_883) >> uint(2)));
    uint _895 = uint(int(uint(int(_893)) >> uint(2)));
    int _897 = int(_893) & 3;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[int(_895)][_897];
    int _901 = int(_893) + 1;
    uint _903 = uint(int(uint(_901) >> uint(2)));
    int _905 = _901 & 3;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[int(_903)][_905];
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _909;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _917 = _889;
    if (_687)
    {
        _917 = _829;
    }
    float _919 = _917;
    float _921 = _885 + (-1.0);
    float _923 = _911 * _831;
    float _925 = _915 * _849;
    int _927 = int(_789) + int(_873);
    int _929 = _883 + 8;
    uint _931 = uint(int(uint(_929) >> uint(2)));
    uint _933 = uint(int(uint(int(_931)) >> uint(2)));
    int _935 = int(_931) & 3;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[int(_933)][_935];
    int _939 = int(_931) + 1;
    uint _941 = uint(int(uint(_939) >> uint(2)));
    int _943 = _939 & 3;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[int(_941)][_943];
    int _947 = _843 & 3;
    bool _949 = _947 != 0;
    float _951 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _953 = _843 & 3;
    bool _955 = _953 != 0;
    int _957 = _492 * _927;
    int _959 = _957 + _663;
    bool _961 = uint(_947) > 1u;
    float _963 = _452 * 2.0;
    bool _965 = _891 > 0.0;
    float _967 = fma(_925, _456, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _969 = _891 >= 0.0;
    bool _971 = isnan(_891);
    bool _973 = _969 || _971;
    bool _975 = isnan(0.0);
    bool _977 = _973 || _975;
    float _979 = _452 + _859;
    float _981 = floor(_963);
    int _983 = _955 ? 0 : 1;
    float _985 = _979 + (-1.0);
    bool _987 = uint(_947) >= 2u;
    float _989 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[4].z, _865);
    bool _991 = !_949;
    int _993 = _991 ? 0 : 1;
    float _995 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _997 = ~_983;
    int _999 = _997 + 1;
    int _1001 = _999 + 1;
    int _1003 = _1001;
    if (!_961)
    {
        int _1005 = ~_983;
        int _1007 = _1005 + 1;
        _1003 = _1007;
    }
    int _1009 = _1003;
    bool _1011 = _947 != 3;
    float _1013 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1015 = int(_1013);
    bool _1017 = uint(_959) >= uint(_464);
    int _1019 = abs(_1009);
    int _1021 = _987 ? 0 : 1;
    bool _1023 = _947 != 3;
    bool _1025 = !_1017;
    int _1027 = _1025 ? 0 : (-1);
    int _1029 = abs(_993);
    int _1031 = ~_1019;
    int _1033 = _1031 + 1;
    int _1035 = _1033 + 1;
    int _1037 = ~_927;
    int _1039 = _1037 + _1027;
    int _1041 = _1039 + 1;
    int _1043 = ~_1029;
    int _1045 = _1043 + 1;
    int _1047 = _1045 + 1;
    int _1049 = _1035 * as_type<int>(_907);
    int _1051 = ~_1021;
    int _1053 = _1051 + 1;
    int _1055 = _1053 + 1;
    int _1057 = _464 * _1041;
    int _1059 = _1057 + _663;
    int _1061 = _1055;
    if (_1011)
    {
        int _1063 = ~_1021;
        int _1065 = _1063 + 1;
        _1061 = _1065;
    }
    int _1067 = _1061;
    int _1069 = _1047 * as_type<int>(_899);
    int _1071 = _1069 + _1049;
    bool _1073 = !_1023;
    int _1075 = _1073 ? 0 : (-1);
    float _1077 = _859 * 2.0;
    bool _1079 = !_701;
    int _1081 = _1079 ? 0 : 1;
    float _1083 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1085 = log2(_1083);
    int _1087 = abs(_1067);
    int _1089 = abs(_1075);
    int _1091 = abs(_1081);
    int _1093 = ~_1087;
    int _1095 = _1093 + 1;
    int _1097 = _1095 + 1;
    float _1099 = floor(_1077);
    int _1101 = abs(_1015);
    int _1103 = ~_1089;
    int _1105 = _1103 + 1;
    int _1107 = _1105 + 1;
    int _1109 = _1097 * as_type<int>(_937);
    int _1111 = _1109 + _1071;
    float _1113 = float(uint(_1015));
    int _1115 = _1107 * as_type<int>(_945);
    int _1117 = _1115 + _1111;
    bool _1119 = _981 > 0.0;
    bool _1121 = _981 >= 0.0;
    bool _1123 = isnan(_981);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan(0.0);
    bool _1129 = _1125 || _1127;
    float _1131 = 1.0 / _1113;
    float _1133 = float(uint(_1101));
    int _1135 = ~_1091;
    int _1137 = _1135 + 1;
    int _1139 = _1137 + 1;
    bool _1141 = !_707;
    int _1143 = _1141 ? _1059 : (-1);
    float _1145 = _1085 * _132;
    int _1147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1149 = _1147 != 0;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1153 = _1151 != 0;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1157 = _1155 != 0;
    int _1159 = _1117 * _1139;
    float _1161 = 1.0 / _1133;
    int _1163 = _977 ? 0 : 1;
    int _1165 = _1143 * _1091;
    int _1167 = _1165 + _1159;
    int _1169 = _1129 ? 0 : 1;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1173 = _444 + _1171;
    bool _1175 = _1099 > 0.0;
    bool _1177 = _1099 >= 0.0;
    bool _1179 = isnan(_1099);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan(0.0);
    bool _1185 = _1181 || _1183;
    float _1187 = exp2(_1145);
    bool _1189 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1191 = isnan(_444);
    bool _1193 = _1189 || _1191;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1197 = _1193 || _1195;
    float _1199 = float(_1197);
    float _1201 = fma(_923, _1173, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1203 = abs(_1167);
    float _1205 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[5].z, _877);
    int _1207 = as_type<int>(_1131) + (-2);
    float _1209 = -_1199;
    float _1211 = _1209 + 1.0;
    float _1213 = float(uint(_1167));
    bool _1215 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1217 = isnan(_444);
    bool _1219 = _1215 || _1217;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1223 = _1219 || _1221;
    float _1225 = float(_1223);
    int _1227 = as_type<int>(_1161) + (-2);
    float _1229 = as_type<float>(_1207) * _1213;
    float _1231 = float(uint(_1203));
    float _1233 = -_1225;
    float _1235 = _1233 + 1.0;
    bool _1237 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1239 = isnan(_444);
    bool _1241 = _1237 || _1239;
    bool _1243 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1245 = _1241 || _1243;
    float _1247 = float(_1245);
    float _1249 = _1225 * _1211;
    float _1251 = as_type<float>(_1227) * _1231;
    float _1253 = trunc(_1229);
    float _1255 = precise::max(_1253, 0.0);
    uint _1257 = uint(_1255);
    float _1259 = _1247 * _1235;
    float _1261 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[6].z, _879);
    float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1265 = 1.0 + _1263;
    int _1267 = ~_1015;
    int _1269 = _1267 + 1;
    float _1271 = -_1187;
    float _1273 = _1271 + 1.0;
    int _1275 = ~_1101;
    int _1277 = _1275 + 1;
    float _1279 = _1201 * _1259;
    float _1281 = trunc(_1251);
    float _1283 = precise::max(_1281, 0.0);
    uint _1285 = uint(_1283);
    bool _1287 = !_1153;
    int _1289 = _1287 ? 0 : 1;
    float _1291 = -_1247;
    float _1293 = _1291 + 1.0;
    bool _1295 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1297 = isnan(0.0);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1303 = _1299 || _1301;
    float _1305 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1279);
    float _1307 = _1303 ? _1273 : 0.0;
    int _1309 = _1269 * int(_1257);
    int _1311 = _1309 + _1167;
    float _1313 = 1.0 / _1265;
    bool _1315 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1317 = isnan(1.0);
    bool _1319 = _1315 || _1317;
    bool _1321 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1323 = _1319 || _1321;
    int _1325 = abs(_1289);
    float _1327 = float(uint(_1311));
    int _1329 = _1277 * int(_1285);
    int _1331 = _1329 + _1203;
    int _1333 = ~_1169;
    int _1335 = _1333 + 1;
    int _1337 = _1335 + 1;
    float _1339 = as_type<float>(_1207) * _1327;
    float _1341 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _817);
    float _1343 = float(uint(_1331));
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1349 = _1337;
    if (!_1119)
    {
        int _1351 = ~_1169;
        int _1353 = _1351 + 1;
        _1349 = _1353;
    }
    int _1355 = _1349;
    float _1357 = as_type<float>(_1227) * _1343;
    float _1359 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1345);
    float _1361 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1347);
    float _1363 = -_132;
    float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[76].x, _835);
    float _1367 = trunc(_1357);
    float _1369 = precise::max(_1367, 0.0);
    uint _1371 = uint(_1369);
    float _1373 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1359);
    float _1375 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1361);
    float _1377 = _1373;
    if (_1323)
    {
        float _1379 = _1307 * _1313;
        _152 = _1379;
    }
    float _1381 = _152;
    int _1383 = ~_1163;
    int _1385 = _1383 + 1;
    int _1387 = _1385 + 1;
    float _1389 = fma(_967, _1249, _1305);
    int _1391 = _1387;
    if (!_965)
    {
        int _1393 = ~_1163;
        int _1395 = _1393 + 1;
        _1391 = _1395;
    }
    int _1397 = _1391;
    float _1399 = _989 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1401 = trunc(_1339);
    float _1403 = precise::max(_1401, 0.0);
    uint _1405 = uint(_1403);
    float _1407 = _452 + (-0.5);
    float _1409 = float(_1397);
    float _1411 = _1205 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1413 = float(_1325);
    float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1417 = _1399 + _1415;
    int _1419 = ~_1101;
    int _1421 = _1419 + 1;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1425 = _1411 + _1423;
    int _1427 = int(_1285) + int(_1371);
    float _1429 = _1413 * _1409;
    int _1431 = ~_1015;
    int _1433 = _1431 + 1;
    float _1435 = _1261 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1437 = _1185 ? 0 : 1;
    int _1439 = _1421 * _1427;
    int _1441 = _1439 + _1203;
    bool _1443 = !_1149;
    int _1445 = _1443 ? 0 : 1;
    float _1447 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1449 = _1435 + _1447;
    int _1451 = int(_1257) + int(_1405);
    float _1453 = _1425 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1455 = ~_1437;
    int _1457 = _1455 + 1;
    int _1459 = _1457 + 1;
    int _1461 = _1459;
    if (!_1175)
    {
        int _1463 = ~_1437;
        int _1465 = _1463 + 1;
        _1461 = _1465;
    }
    int _1467 = _1461;
    int _1469 = _1433 * _1451;
    int _1471 = _1469 + _1167;
    float _1473 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1453);
    int _1475 = abs(_1445);
    float _1477 = in.m_65.x;
    float _1479 = in.m_65.y;
    float _1481 = in.m_65.z;
    bool _1483 = uint(_1441) >= uint(_1101);
    float _1485 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1473);
    bool _1487 = uint(_1471) >= uint(_1015);
    int _1489 = _1167 ^ _1015;
    float _1491 = float(_1475);
    float _1493 = float(_1467);
    bool _1495 = !_1483;
    int _1497 = _1495 ? 0 : (-1);
    bool _1499 = !_1487;
    int _1501 = _1499 ? 0 : (-1);
    float _1503 = _1491 * _1493;
    uint _1505 = uint(int(uint(_1489) >> uint(31)));
    float _1507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1509 = _1485 >= 0.0;
    int _1511 = ~_1497;
    int _1513 = _1427 + _1511;
    int _1515 = _1513 + 1;
    float _1517 = _1503 * (-2.0);
    int _1519 = ~_1451;
    int _1521 = _1519 + _1501;
    int _1523 = _1521 + 1;
    int _1525 = ~int(_1505);
    int _1527 = _1525 + 1;
    float _1529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1531 = _1015 == 0;
    int _1533 = _1015 * _1523;
    int _1535 = _1533 + _1167;
    int _1537 = _1515 ^ _1527;
    float _1539 = fma(_951, _1517, _951);
    bool _1541 = _1015 == 0;
    float _1543 = _1429 * (-2.0);
    int _1545 = ~_1527;
    int _1547 = _1545 + _1537;
    int _1549 = _1547 + 1;
    float _1551 = fma(_1517, _1477, _1477);
    bool _1553 = !_1531;
    int _1555 = _1553 ? _1535 : (-1);
    float _1557 = fma(_995, _1543, _995);
    bool _1559 = !_1541;
    int _1561 = _1559 ? _1549 : (-1);
    float _1563 = fma(_1543, _1479, _1479);
    float _1565 = float(_1555);
    float _1567 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1569 = float(_1561);
    float _1571 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1573 = _450 + (-0.5);
    float _1575 = fma(_1567, _919, -0.5);
    float _1577 = fma(_1567, _1565, _1365);
    float _1579 = fma(_1571, _797, -0.5);
    float _1581 = -_1341;
    float _1583 = fma(_1571, _1569, _1581);
    float _1585 = fma(_1573, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1551);
    float _1587 = fma(_1373, _1575, _1577);
    float _1589 = _1481;
    if (_1509)
    {
        _1377 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1591 = _1377;
    float _1593 = fma(_1375, _1579, _1583);
    float _1595 = _1425 * _1425;
    float _1597 = _1587 + 0.5;
    int _1599 = as_type<int>(_1591);
    if (_1509)
    {
        float _1601 = _1591 * 5.0;
        _1599 = as_type<int>(_1601);
    }
    int _1603 = _1599;
    float _1605 = fma(_1417, _1417, _1595);
    float _1607 = fma(_1407, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1563);
    float _1609 = _1593 + 0.5;
    float _1611 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1613 = fma(_1449, _1449, _1605);
    if (_1509)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5833 = as_type<float>(_1603);
        out.gl_Position.z = _5833;
    }
    float _1615 = fma(_1557, _1381, _1607);
    float _1617 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1389);
    float _1619 = rsqrt(_1613);
    float _1621 = _1617 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _1597;
    out.m_67.y = _1609;
    float _1623 = fma(_1539, _1381, _1585);
    float _1625 = _859 + _450;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1631 = _460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1633 = _1611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1635 = _466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1639 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1641 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1643 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1645 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1647 = !_1157;
    int _1649 = _1647 ? 0 : 1;
    out.m_69.x = _1631;
    out.m_69.y = _1633;
    out.m_69.z = _1635;
    out.m_69.w = _1621;
    float _1651 = _1425 * _1619;
    float _1653 = _1417 * _1619;
    int _1655 = abs(_1649);
    out.m_71.x = _1641;
    out.m_71.y = _1643;
    out.m_71.z = _1645;
    out.m_71.w = _1639;
    float _1657 = _1651;
    if (_1509)
    {
        out.m_49.x = 0.0;
    }
    if (_1509)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1659 = -_1651;
    float _1661 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1411);
    float _1663 = _1449 * _1619;
    float _1665 = -_1653;
    float _1667 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1399);
    float _1669 = float(_1355);
    float _1671 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1673 = _1661 + _1671;
    float _1675 = float(_1655);
    float _1677 = -_1663;
    float _1679 = fma(_1677, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1435);
    float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1683 = _1667 + _1681;
    float _1685 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1687 = _1625 + (-1.0);
    float _1689 = _1675 * _1669;
    float _1691 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1693 = _1679 + _1691;
    float _1695 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1685);
    float _1697 = _1615 * 0.15915493667125701904296875;
    float _1699 = -_1651;
    float _1701 = fma(_1699, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1425);
    float _1703 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1705 = _1689 * (-2.0);
    float _1707 = fma(_1693, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1695);
    float _1709 = _1701 * _1701;
    float _1711 = _859 + (-0.5);
    float _1713 = fma(_1703, _1705, _1703);
    float _1715 = fma(_1705, _1481, _1481);
    bool _1717 = _1707 >= 0.0;
    float _1719 = -_1653;
    float _1721 = fma(_1719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1417);
    float _1723 = -_1663;
    float _1725 = fma(_1723, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1449);
    float _1727 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1715);
    float _1729 = _1623 * 0.15915493667125701904296875;
    float _1731 = fma(_1721, _1721, _1709);
    float _1733 = _1697 * 6.283185482025146484375;
    float _1735 = sin(_1733);
    float _1737 = fma(_1713, _1381, _1727);
    float _1739 = fma(_1725, _1725, _1731);
    float _1741 = _1737 * 0.15915493667125701904296875;
    float _1743 = _1663;
    if (_1717)
    {
        _1589 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1745 = _1589;
    float _1747 = _1729 * 6.283185482025146484375;
    float _1749 = sin(_1747);
    int _1751 = as_type<int>(_1745);
    if (_1717)
    {
        out.m_49.x = 0.0;
    }
    if (_1717)
    {
        float _1753 = _1745 * 5.0;
        _1751 = as_type<int>(_1753);
    }
    int _1755 = _1751;
    float _1757 = _1729 * 6.283185482025146484375;
    float _1759 = cos(_1757);
    if (_1717)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6118 = as_type<float>(_1755);
        out.gl_Position.z = _6118;
    }
    float _1761 = _1697 * 6.283185482025146484375;
    float _1763 = cos(_1761);
    float _1765 = sqrt(_1739);
    float _1767 = _1741 * 6.283185482025146484375;
    float _1769 = sin(_1767);
    if (_1717)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1771 = _1749 * _1735;
    float _1773 = _1759 * _1763;
    float _1775 = -_1411;
    float _1777 = _1775 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1779 = _1619 * _1765;
    float _1781 = -_1399;
    float _1783 = _1781 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1785 = fma(_1769, _1773, _1771);
    float _1787 = fma(_1769, _1771, _1773);
    float _1789 = _1777 * _1777;
    float _1791 = in.m_73.x;
    float _1793 = in.m_73.y;
    float _1795 = in.m_73.z;
    float _1797 = _1741 * 6.283185482025146484375;
    float _1799 = cos(_1797);
    float _1801 = -_1435;
    float _1803 = _1801 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1805 = fma(_1783, _1783, _1789);
    float _1807 = _356 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1809 = _1759 * _1735;
    float _1811 = _1749 * _1763;
    float _1813 = fma(_1803, _1803, _1805);
    float _1815 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1817 = rsqrt(_1813);
    float _1819 = _1779 * _1807;
    float _1821 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1823 = _1759 * _1799;
    float _1825 = _1763 * _1799;
    float _1827 = _1749 * _1799;
    float _1829 = _1735 * _1799;
    float _1831 = -_1809;
    float _1833 = fma(_1769, _1811, _1831);
    float _1835 = -_1811;
    float _1837 = fma(_1769, _1809, _1835);
    float _1839 = _1779 * _1815;
    float _1841 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1791);
    float _1843 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1793);
    float _1845 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1821);
    float _1847 = _1783 * _1817;
    float _1849 = _1841 * _1839;
    float _1851 = _1411 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1853 = _1843 * _1819;
    float _1855 = _1803 * _1817;
    float _1857 = _1777 * _1817;
    float _1859 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1851);
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1863 = _1847 * _1861;
    float _1865 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1845);
    float _1867 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1869 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1859);
    float _1871 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1873 = _1855 * _1871;
    float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1877 = -_1863;
    float _1879 = fma(_1855, _1875, _1877);
    float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1883 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1881;
    float _1885 = _1869 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1887 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1889 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1891 = _1857 * _1889;
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1895 = -_1873;
    float _1897 = fma(_1857, _1893, _1895);
    float _1899 = _1879 * _1879;
    float _1901 = -_1885;
    float _1903 = _1887 + _1901;
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1907 = -_1891;
    float _1909 = fma(_1847, _1905, _1907);
    float _1911 = 1.0 / _1883;
    float _1913 = fma(_1897, _1897, _1899);
    float _1915 = _1779 * _1867;
    float _1917 = abs(_1903);
    float _1919 = precise::max(_1917, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1921 = fma(_1909, _1909, _1913);
    float _1923 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1925 = sqrt(_1813);
    float _1927 = precise::min(_1919, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1795);
    float _1931 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1923);
    bool _1933 = _1885 >= _1887;
    bool _1935 = isnan(_1885);
    bool _1937 = _1933 || _1935;
    bool _1939 = isnan(_1887);
    bool _1941 = _1937 || _1939;
    float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1945 = _1927 + _1943;
    float _1947 = -_1853;
    float _1949 = _1769 * _1947;
    float _1951 = rsqrt(_1921);
    float _1953 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1931);
    float _1955 = _1945 * _1911;
    float _1957 = _1823 * _1853;
    float _1959 = _1827 * _1853;
    bool _1961 = !_1941;
    float _1963 = _1961 ? 1.0 : (-1.0);
    float _1965 = _1929 * _1915;
    float _1967 = fma(_1825, _1849, _1949);
    float _1969 = abs(_1925);
    float _1971 = precise::max(0.0, _1969);
    float _1973 = rsqrt(_1953);
    float _1975 = _1963 * _1955;
    float _1977 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1979 = fma(_1785, _1849, _1957);
    float _1981 = fma(_1833, _1849, _1959);
    float _1983 = precise::min(_1971, 40.0);
    float _1985 = fma(_1829, _1965, _1967);
    float _1987 = _1909 * _1951;
    float _1989 = _1977 * _1975;
    float _1991 = _1897 * _1951;
    float _1993 = _1879 * _1951;
    float _1995 = _1847 * _1987;
    float _1997 = fma(_1983, -0.02500000037252902984619140625, 1.0);
    float _1999 = fma(_1837, _1965, _1979);
    float _2001 = _1855 * _1993;
    float _2003 = -_1995;
    float _2005 = fma(_1855, _1991, _2003);
    float _2007 = fma(_1787, _1965, _1981);
    float _2009 = _1857 * _1991;
    float _2011 = -_2001;
    float _2013 = fma(_1857, _1987, _2011);
    float _2015 = _2005 * _1999;
    float _2017 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2019 = -_2009;
    float _2021 = fma(_1847, _1993, _2019);
    float _2023 = _2013 * _1999;
    float _2025 = fma(_1993, _1985, _2015);
    float _2027 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2029 = _2017 * _2017;
    float _2031 = fma(_1991, _1985, _2023);
    float _2033 = fma(_1857, _2007, _2025);
    float _2035 = _2021 * _1999;
    float _2037 = _1973 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2039 = fma(_2027, _2027, _2029);
    float _2041 = fma(_1847, _2007, _2031);
    float _2043 = _1411 + _2033;
    float _2045 = fma(_1987, _1985, _2035);
    float _2047 = fma(_2037, _2037, _2039);
    float _2049 = _1399 + _2041;
    float _2051 = _2043 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2053 = _2043 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2055 = fma(_1855, _2007, _2045);
    float _2057 = _2043 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2059 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2051);
    float _2061 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2053);
    float _2063 = _1435 + _2055;
    float _2065 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2057);
    float _2067 = _1411 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2069 = _1989 * 0.15915493667125701904296875;
    float _2071 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2061);
    float _2073 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2065);
    float _2075 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2067);
    float _2077 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2059);
    float _2079 = rsqrt(_2047);
    float _2081 = _2073 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2083 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2075);
    float _2085 = _2071 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2087 = _2077 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2089 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2091 = _2083 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2093 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2095 = _2069 * 6.283185482025146484375;
    float _2097 = cos(_2095);
    float _2099 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2089);
    float _2101 = -_2085;
    float _2103 = _2101 + _2091;
    float _2105 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2107 = fma(_1997, _2103, _2085);
    float _2109 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2093);
    float _2111 = _2069 * 6.283185482025146484375;
    float _2113 = sin(_2111);
    float _2115 = _2017 * _2079;
    float _2117 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2105);
    float _2119 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2109);
    float _2121 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2117);
    float _2123 = -_2097;
    float _2125 = _2123 + 1.0;
    float _2127 = _2027 * _2079;
    float _2129 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2099);
    float _2131 = _2037 * _2079;
    float _2133 = _2115 * _2125;
    float _2135 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2137 = _2135 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2139 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2141 = _2131 * _2131;
    float _2143 = _2127 * _2113;
    float _2145 = _2115 * _2113;
    float _2147 = _2131 * _2113;
    float _2149 = _2127 * _2125;
    float _2151 = _2119 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2153 = fma(_2131, _2133, _2143);
    float _2155 = -_1411;
    float _2157 = _2155 + _2139;
    float _2159 = fma(_2125, _2141, _2097);
    float _2161 = -_2147;
    float _2163 = fma(_2115, _2149, _2161);
    float _2165 = -_2145;
    float _2167 = fma(_2131, _2149, _2165);
    float _2169 = -_1399;
    float _2171 = _2169 + _2151;
    float _2173 = _2153 * _2157;
    float _2175 = _2121 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2177 = _2163 * _2157;
    float _2179 = fma(_2127, _2149, _2097);
    float _2181 = fma(_2167, _2171, _2173);
    float _2183 = -_1435;
    float _2185 = _2183 + _2175;
    float _2187 = fma(_170, _2137, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2189 = fma(_2179, _2171, _2177);
    float _2191 = fma(_2131, _2149, _2145);
    float _2193 = fma(_2159, _2185, _2181);
    float _2195 = fma(_2115, _2133, _2097);
    float _2197 = fma(_2115, _2149, _2147);
    float _2199 = fma(_2191, _2185, _2189);
    float _2201 = fma(_2193, _2187, _1435);
    float _2203 = _2195 * _2157;
    float _2205 = -_2143;
    float _2207 = fma(_2131, _2133, _2205);
    float _2209 = fma(_2199, _2187, _1399);
    float _2211 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2213 = _2201 + _2211;
    float _2215 = fma(_2197, _2171, _2203);
    float _2217 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2221 = _2209 + _2219;
    float _2223 = _2213 * _2213;
    float _2225 = fma(_2207, _2185, _2215);
    float _2227 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2217);
    float _2229 = fma(_2221, _2221, _2223);
    float _2231 = _1411 + _2225;
    float _2233 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2227);
    float _2235 = sqrt(_2229);
    bool _2237 = _2235 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2239 = _2225;
    float _2241 = _2227;
    float _2243 = _2201;
    if (!_2237)
    {
        _2239 = _2209;
    }
    float _2245 = _2239;
    float _2247 = _2245;
    if (!_2237)
    {
        _2241 = _2231;
    }
    float _2249 = _2241;
    bool _2251 = !_2237;
    float _2253 = _2249;
    if (!_2251)
    {
        float _2255 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2259 = _2235 + _2257;
        float _2261 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2263 = rsqrt(_2229);
        float _2265 = _2259 * _2255;
        float _2267 = _2265 * 0.15915493667125701904296875;
        float _2269 = _2267 * 6.283185482025146484375;
        float _2271 = cos(_2269);
        float _2273 = _2267 * 6.283185482025146484375;
        float _2275 = sin(_2273);
        float _2277 = _2271 + (-1.0);
        float _2279 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2281 = fma(_2275, _2261, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2283 = fma(_2231, _2271, _2279);
        float _2285 = _2263 * _2281;
        float _2287 = fma(_2221, _2285, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2289 = fma(_2213, _2285, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2253 = _2283;
        _2247 = _2287;
        _2243 = _2289;
    }
    float _2291 = _2253;
    float _2293 = _2247;
    float _2295 = _2243;
    float _2297 = -_1411;
    float _2299 = _2297 + _2291;
    float _2301 = -_1399;
    float _2303 = _2301 + _2293;
    float _2305 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2307 = -_1435;
    float _2309 = _2307 + _2295;
    float _2311 = _2299 * _2299;
    float _2313 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2315 = 1.0 / _2305;
    float _2317 = fma(_2303, _2303, _2311);
    float _2319 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2313);
    float _2321 = fma(_2309, _2309, _2317);
    float _2323 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2319);
    float _2325 = sqrt(_2321);
    float _2327 = _2323 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2329 = _2327 + _2305;
    float _2331 = _2329 * _2315;
    float _2333 = _2331 * 0.5;
    bool _2335 = _2325 > 0.0;
    float _2337 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2339 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2337);
    bool _2341 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2343 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2345 = _2341 || _2343;
    bool _2347 = isnan(0.5);
    bool _2349 = _2345 || _2347;
    float _2351 = 1.0 / _2339;
    bool _2353 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2355 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2357 = _2353 || _2355;
    bool _2359 = isnan(0.5);
    bool _2361 = _2357 || _2359;
    bool _2363 = !_2335;
    float _2365 = _2293;
    float _2367 = _2295;
    float _2369 = _2291;
    float _2371 = _2321;
    float _2373 = _2303;
    if (!_2363)
    {
        float _2375 = _186 * _186;
        float _2377 = rsqrt(_2321);
        float _2379 = fma(_184, _184, _2375);
        float _2381 = fma(_188, _188, _2379);
        float _2383 = sqrt(_2381);
        float _2385 = _2303 * _2377;
        float _2387 = _2299 * _2377;
        bool _2389 = _2383 > 0.0;
        float _2391 = _2309 * _2377;
        bool _2393 = !_2389;
        _2371 = _2377;
        if (!_2393)
        {
            float _2395 = rsqrt(_2381);
            float _2397 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2399 = _186 * _2395;
            float _2401 = _184 * _2395;
            float _2403 = _2387 * _2399;
            float _2405 = _188 * _2395;
            float _2407 = fma(_2385, _2401, _2403);
            float _2409 = _2397 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2411 = fma(_2391, _2405, _2407);
            float _2413 = _2411 * _2409;
            float _2415 = fma(_184, _2413, _2293);
            float _2417 = fma(_186, _2413, _2291);
            float _2419 = fma(_188, _2413, _2295);
            _2365 = _2415;
            _2367 = _2419;
            _2369 = _2417;
            _2371 = _2409;
            _2373 = _2405;
        }
    }
    float _2421 = _2365;
    float _2423 = _2367;
    float _2425 = _2369;
    float _2427 = _2371;
    float _2429 = _2373;
    float _2431 = -_1653;
    float _2433 = fma(_2431, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2421);
    float _2435 = -_1663;
    float _2437 = fma(_2435, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2423);
    float _2439 = -_1651;
    float _2441 = fma(_2439, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2425);
    float _2443 = _2433;
    float _2445 = _2441;
    float _2447 = _2429;
    float _2449 = _2427;
    if (_2361)
    {
        _1743 = 1.0;
    }
    float _2451 = _1743;
    float _2453 = _2451;
    if (_2349)
    {
        _1657 = _2433;
    }
    float _2455 = _1657;
    float _2457 = _2455;
    if (_2349)
    {
        _2443 = _2437;
    }
    float _2459 = _2443;
    float _2461 = _2459;
    if (!_2349)
    {
        float _2463 = _1673 * _1673;
        float _2465 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2467 = -_1435;
        float _2469 = _2467 + _2423;
        float _2471 = -_1411;
        float _2473 = _2471 + _2425;
        float _2475 = fma(_1683, _1683, _2463);
        float _2477 = -_1399;
        float _2479 = _2477 + _2421;
        float _2481 = fma(_1693, _1693, _2475);
        float _2483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2485 = sqrt(_2481);
        float _2487 = _2465 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2489 = 1.0 / _1779;
        float _2491 = precise::min(_2485, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2493 = _2491 * _2483;
        float _2495 = _2493 * _2489;
        float _2497 = _2487 * _2495;
        float _2499 = _2469 * _2495;
        float _2501 = fma(_2473, _2497, _1661);
        float _2503 = fma(_2479, _2497, _1667);
        float _2505 = fma(_2487, _2499, _1679);
        _192 = _2487;
        _2445 = _2501;
        _2457 = _2503;
        _2461 = _2505;
    }
    float _2507 = _192;
    float _2509 = _2445;
    float _2511 = _2457;
    float _2513 = _2461;
    float _2515 = _2507;
    if (_2361)
    {
        _2447 = 1.0;
    }
    float _2517 = _2447;
    float _2519 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2521 = _2351 * _2519;
    float _2523 = _2517;
    if (!_2361)
    {
        float _2525 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2527 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2529 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2527;
        float _2531 = _2525 * 0.15915493667125701904296875;
        float _2533 = 1.0 / _2529;
        float _2535 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2537 = _2531 * 6.283185482025146484375;
        float _2539 = cos(_2537);
        float _2541 = _2535 * 0.15915493667125701904296875;
        float _2543 = _2531 * 6.283185482025146484375;
        float _2545 = sin(_2543);
        float _2547 = 1.0 / _2539;
        float _2549 = _2541 * 6.283185482025146484375;
        float _2551 = cos(_2549);
        float _2553 = _2545 * _2547;
        float _2555 = _2541 * 6.283185482025146484375;
        float _2557 = sin(_2555);
        float _2559 = _2551 * _2553;
        float _2561 = 1.0 / _2559;
        float _2563 = _2557 * _2561;
        float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2567 = fma(_2521, _2563, _2565);
        float _2569 = _2567 * _2533;
        float _2571 = precise::clamp(_2569, 0.0, 1.0);
        _194 = _2541;
        _2515 = _2531;
        _2453 = _2571;
    }
    float _2573 = _194;
    float _2575 = _2515;
    float _2577 = _2453;
    float _2579 = _2575;
    float _2581 = _2573;
    if (!_2361)
    {
        float _2583 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2585 = _2583 * 0.15915493667125701904296875;
        float _2587 = _2585 * 6.283185482025146484375;
        float _2589 = cos(_2587);
        float _2591 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2593 = _2591 * 0.15915493667125701904296875;
        float _2595 = _2585 * 6.283185482025146484375;
        float _2597 = sin(_2595);
        float _2599 = 1.0 / _2589;
        float _2601 = _2593 * 6.283185482025146484375;
        float _2603 = cos(_2601);
        float _2605 = _2597 * _2599;
        float _2607 = _2593 * 6.283185482025146484375;
        float _2609 = sin(_2607);
        float _2611 = _2603 * _2605;
        float _2613 = 1.0 / _2611;
        float _2615 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2617 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2615;
        float _2619 = 1.0 / _2617;
        float _2621 = _2609 * _2613;
        float _2623 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2625 = fma(_2521, _2621, _2623);
        float _2627 = _2625 * _2619;
        float _2629 = precise::clamp(_2627, 0.0, 1.0);
        float _2631 = -_2629;
        float _2633 = _2631 + 1.0;
        _2579 = _2599;
        _2581 = _2589;
        _2523 = _2633;
    }
    float _2635 = _2579;
    float _2637 = _2581;
    float _2639 = _2523;
    float _2641 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2643 = _2509 + _2641;
    float _2645 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2647 = _2511 + _2645;
    float _2649 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2651 = _2513 + _2649;
    float _2653 = _2643 * _2643;
    float _2655 = fma(_2647, _2647, _2653);
    float _2657 = fma(_2651, _2651, _2655);
    float _2659 = rsqrt(_2657);
    float _2661 = sqrt(_2657);
    float _2663 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2665 = _2647 * _2663;
    float _2667 = _2651 * _2663;
    float _2669 = _2665 * _2665;
    float _2671 = _2667 * _2667;
    float _2673 = _2669 + _2671;
    float _2675 = sqrt(_2673);
    bool _2677 = _2675 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2679 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2681 = _2675 + _2679;
    float _2683 = _2651;
    float _2685 = _2637;
    float _2687 = _2681;
    float _2689 = _2635;
    float _2691 = _2643;
    float _2693 = _2673;
    float _2695 = _2669;
    if (_2677)
    {
        float _2697 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2683 = _2697;
    }
    float _2699 = _2683;
    if (_2677)
    {
        float _2701 = rsqrt(_2673);
        _2685 = _2701;
    }
    float _2703 = _2685;
    float _2705 = _2703;
    if (_2677)
    {
        float _2707 = _2681 * _2699;
        _2687 = _2707;
    }
    float _2709 = _2687;
    if (_2677)
    {
        float _2711 = _2709 * 0.15915493667125701904296875;
        _2689 = _2711;
    }
    float _2713 = _2689;
    float _2715 = _2653;
    if (_2677)
    {
        float _2717 = _2713 * 6.283185482025146484375;
        float _2719 = sin(_2717);
        _2715 = _2719;
    }
    float _2721 = _2715;
    float _2723 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2725 = precise::max(0.0, _2723);
    float _2727 = _2659;
    float _2729 = _2723;
    if (_2677)
    {
        float _2731 = _2713 * 6.283185482025146484375;
        float _2733 = cos(_2731);
        _2727 = _2733;
    }
    float _2735 = _2727;
    float _2737 = -_2663;
    float _2739 = -_2725;
    float _2741 = fma(_2643, _2737, _2739);
    if (_2677)
    {
        float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2729 = _2743;
    }
    float _2745 = _2729;
    float _2747 = _2509 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2749 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2751 = _2509 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2753 = _2745;
    float _2755 = _2721;
    if (_2677)
    {
        float _2757 = fma(_2721, _2745, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2753 = _2757;
    }
    float _2759 = _2753;
    float _2761 = _2759;
    if (!_2677)
    {
        _2755 = _2667;
    }
    float _2763 = _2755;
    float _2765 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2747);
    float _2767 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2751);
    float _2769 = _2763;
    float _2771 = _2735;
    if (_2677)
    {
        float _2773 = _2735 + (-1.0);
        _2691 = _2773;
    }
    float _2775 = _2691;
    if (_2677)
    {
        float _2777 = _2703 * _2759;
        _2449 = _2777;
    }
    float _2779 = _2449;
    if (!_2677)
    {
        _2705 = _2665;
    }
    float _2781 = _2705;
    float _2783 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2765);
    float _2785 = _2781;
    if (_2677)
    {
        float _2787 = _2775 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2693 = _2787;
    }
    float _2789 = _2693;
    if (_2677)
    {
        float _2791 = _2665 * _2779;
        _2785 = _2791;
    }
    float _2793 = _2785;
    if (!_2677)
    {
        _2761 = _2741;
    }
    float _2795 = _2761;
    float _2797 = _2795;
    if (_2677)
    {
        float _2799 = _2667 * _2779;
        _2769 = _2799;
    }
    float _2801 = _2769;
    if (_2677)
    {
        float _2803 = fma(_2741, _2735, _2789);
        _2797 = _2803;
    }
    float _2805 = _2797;
    if (_2677)
    {
        float _2807 = _2793 * _2793;
        _2695 = _2807;
    }
    float _2809 = _2695;
    if (!_2677)
    {
        _2771 = _2671;
    }
    float _2811 = _2771;
    float _2813 = _2811;
    if (_2677)
    {
        float _2815 = _2801 * _2801;
        _2813 = _2815;
    }
    float _2817 = _2813;
    float _2819 = fma(_2805, _2805, _2809);
    float _2821 = _2783 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2823 = floor(_2749);
    float _2825 = _2819 + _2817;
    float _2827 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2829 = fma(_2661, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2827);
    float _2831 = precise::clamp(_2829, 0.0, 1.0);
    float _2833 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2835 = _2509 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2837 = -_2831;
    float _2839 = _2837 + 1.0;
    float _2841 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2843 = rsqrt(_2825);
    float _2845 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2835);
    float _2847 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2849 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2767);
    float _2851 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2845);
    float _2853 = -_2841;
    float _2855 = fma(_2853, _2847, 1.0);
    float _2857 = _2849 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2859 = abs(_2839);
    float _2861 = log2(_2859);
    float _2863 = _2509 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2865 = _2851 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2867 = -_2823;
    float _2869 = _2749 + _2867;
    float _2871 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2863);
    float _2873 = _2843 * _2793;
    float _2875 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2871);
    float _2877 = _2843 * _2805;
    float _2879 = _2843 * _2801;
    float _2881 = _2873 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2883 = _2875 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2885 = floor(_2833);
    float _2887 = -_2881;
    float _2889 = fma(_2877, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2887);
    float _2891 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2893 = _2861 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2895 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2897 = -_2879;
    float _2899 = fma(_2897, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2889);
    float _2901 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2891);
    float _2903 = exp2(_2893);
    float _2905 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2907 = fma(_2899, -0.5, 0.5);
    float _2909 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2901);
    float _2911 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2895);
    float _2913 = fma(_2899, 0.5, 0.5);
    float _2915 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2909);
    float _2917 = log2(_2855);
    float _2919 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2905);
    float _2921 = -_2885;
    float _2923 = _2833 + _2921;
    float _2925 = _2877 + 1.0;
    float _2927 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2911);
    float _2929 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2919);
    float _2931 = fma(_2913, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2933 = 1.0 / _2915;
    float _2935 = -_2877;
    float _2937 = fma(_2903, _2925, _2935);
    float _2939 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2927);
    float _2941 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2929);
    float _2943 = fma(_2913, _2931, -0.212114393711090087890625);
    float _2945 = sqrt(_2907);
    float _2947 = _2917 * 0.693147182464599609375;
    float2 _8016 = float2(_2869, _2923);
    float _2949 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8016, float2(0.0), isnan(_8016)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8016, float2(0.0), isnan(_8016)), level(0.0)).x;
    float _2951 = fma(_2913, _2943, 1.570728778839111328125);
    float _2953 = fma(_2937, 0.5, 0.5);
    float _2955 = _2947 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2957 = _2939 * _2933;
    float _2959 = _2941 * _2933;
    float _2961 = fma(_2957, 0.5, 0.5);
    float _2963 = fma(_2959, -0.5, 0.5);
    float _2965 = _2945 * 0.636619746685028076171875;
    float _2967 = -_2951;
    float _2969 = fma(_2965, _2967, 1.0);
    float3 _8055 = float3(_2961, _2963, _2955);
    float _2971 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8055, float3(0.0), isnan(_8055)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8055, float3(0.0), isnan(_8055)), level(0.0)).x;
    float3 _8066 = float3(_2961, _2963, _2955);
    float4 _2974 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8066, float3(0.0), isnan(_8066)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8066, float3(0.0), isnan(_8066)), level(0.0)).xyzw;
    float _2976 = _2974.x;
    float _2978 = _2974.y;
    float _2980 = _2974.z;
    float _2982 = _2974.w;
    float2 _8082 = float2(_2969, _2953);
    float3 _2986 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8082, float2(0.0), isnan(_8082)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8082, float2(0.0), isnan(_8082)), level(0.0)).xyz;
    float _2988 = _2986.x;
    float _2990 = _2986.y;
    float _2992 = _2986.z;
    float _2994 = abs(_2521);
    float _2996 = log2(_2994);
    bool _2998 = _1793 != 0.0;
    bool _3000 = isnan(_1793);
    bool _3002 = _2998 || _3000;
    bool _3004 = isnan(0.0);
    bool _3006 = _3002 || _3004;
    out.m_71.x = _1641;
    out.m_71.y = _1643;
    out.m_71.z = _1645;
    out.m_71.w = _1639;
    float _3008 = _2861 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3010 = _1791 == 0.0;
    bool _3012 = !_3006;
    bool _3014 = _3010 && _3012;
    out.m_69.x = _1631;
    out.m_69.y = _1633;
    out.m_69.z = _1635;
    out.m_69.w = _1621;
    bool _3016 = _1795 == 0.0;
    bool _3018 = _3016 && _3014;
    float _3020 = exp2(_3008);
    bool _3022 = _2521 <= 8000.0;
    bool _3024 = isnan(_2521);
    bool _3026 = _3022 || _3024;
    bool _3028 = isnan(8000.0);
    bool _3030 = _3026 || _3028;
    float _3032 = float(_3030);
    float _3034 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3036 = _1785 * _2005;
    float _3038 = in.m_75.x;
    float _3040 = in.m_75.y;
    float _3042 = in.m_75.z;
    float _3044 = _1837 * _2013;
    float _3046 = _1785 * _2013;
    float _3048 = _1785 * _2021;
    float _3050 = exp2(_3034);
    float _3052 = fma(_1825, _1993, _3036);
    float _3054 = fma(_1825, _1991, _3046);
    float _3056 = fma(_1825, _1987, _3048);
    float _3058 = fma(_1829, _1991, _3044);
    float _3060 = fma(_1833, _1857, _3052);
    float _3062 = fma(_1833, _1847, _3054);
    float _3064 = fma(_1833, _1855, _3056);
    float _3066 = -_3020;
    float _3068 = _3066 + 1.0;
    float _3070 = fma(_1787, _1847, _3058);
    float _3072 = _3068 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3074 = fma(_3050, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3076 = precise::clamp(_3074, 0.0, 1.0);
    float _3078 = _1837 * _2021;
    float _3080 = fma(_3076, -2.0, 3.0);
    float _3082 = _3076 * _3076;
    float _3084 = _3040;
    float _3086 = _3038;
    float _3088 = _3042;
    float _3090 = _3064;
    if (!_3018)
    {
        float _3092 = fma(_1793, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3040);
        _3084 = _3092;
    }
    float _3094 = _3084;
    float _3096 = _1823 * _2005;
    if (!_3018)
    {
        float _3098 = fma(_1791, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3038);
        _3086 = _3098;
    }
    float _3100 = _3086;
    float _3102 = _3082 * _3080;
    float _3104 = _1823 * _2013;
    float _3106 = -_1769;
    float _3108 = fma(_3106, _1993, _3096);
    float _3110 = _1823 * _2021;
    float _3112 = -_3102;
    float _3114 = _3112 + 1.0;
    float _3116 = _1837 * _2005;
    float _3118 = fma(_1827, _1857, _3108);
    float _3120 = -_1769;
    float _3122 = fma(_3120, _1991, _3104);
    float _3124 = fma(_3114, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3102);
    float _3126 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3128 = _3118 * _3094;
    float _3130 = -_1769;
    float _3132 = fma(_3130, _1987, _3110);
    float _3134 = _3032 * _3124;
    float _3136 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3126);
    float _3138 = fma(_3060, _3100, _3128);
    float _3140 = in.m_77.x;
    float _3142 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3144 = fma(_2821, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3136);
    float _3146 = fma(_1829, _1993, _3116);
    float _3148 = fma(_1827, _1847, _3122);
    float _3150 = fma(_1827, _1855, _3132);
    float _3152 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3144);
    if (!_3018)
    {
        float _3154 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3042);
        _3088 = _3154;
    }
    float _3156 = _3088;
    float _3158 = fma(_1787, _1857, _3146);
    float _3160 = _3148 * _3094;
    float _3162 = _3152 + _2915;
    float _3164 = fma(_1829, _1987, _3078);
    float _3166 = _3150 * _3094;
    float _3168 = fma(_3062, _3100, _3160);
    float _3170 = _3162 * 0.5;
    float _3172 = fma(_3158, _3156, _3138);
    float _3174 = fma(_1787, _1855, _3164);
    float _3176 = fma(_3064, _3100, _3166);
    float _3178 = -_3072;
    float _3180 = _3178 + 1.0;
    float _3182 = fma(_3070, _3156, _3168);
    float _3184 = fma(_3174, _3156, _3176);
    bool _3186 = _2661 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3188 = isnan(_2661);
    bool _3190 = _3186 || _3188;
    bool _3192 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3194 = _3190 || _3192;
    out.gl_Position.x = _2939;
    out.gl_Position.y = _2941;
    out.gl_Position.z = _3152;
    out.gl_Position.w = _2915;
    out.m_79.x = _3182;
    out.m_79.y = _3172;
    out.m_79.z = _3184;
    out.m_81.z = _3170;
    out.m_81.w = _2915;
    float _3196 = _3176;
    float _3198 = _2915;
    float _3200 = _3170;
    if (!_3194)
    {
        _3090 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3202 = _3090;
    float _3204 = _3202;
    float _3206 = _3202;
    if (!_3194)
    {
        _3196 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3208 = _3196;
    float _3210 = _3208;
    float _3212 = _3208;
    if (!_3194)
    {
        _3198 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3214 = _3198;
    float _3216 = _3214;
    float _3218 = _3214;
    if (!_3194)
    {
        _3200 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3220 = _3200;
    float _3222 = -_2949;
    float _3224 = _3222 + 1.0;
    float _3226 = _3224 * _3142;
    float _3228 = precise::clamp(_3226, 0.0, 1.0);
    float _3230 = -_3228;
    float _3232 = fma(_3230, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3234 = _3232 * _3140;
    float _3236 = _3234 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3238 = _3072 * _2971;
    float _3240 = _2982 * _3180;
    out.m_83.x = _3236;
    float _3242 = _2577 * _2639;
    float _3244 = _2982 * _3238;
    float _3246 = _2992 * _3238;
    float _3248 = _3242 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3250 = fma(_2988, _3244, _2976);
    float _3252 = fma(_2990, _3244, _2978);
    float _3254 = fma(_2982, _3246, _2980);
    float _3256 = _3244;
    float _3258 = _3242;
    float _3260 = _3220;
    float _3262 = _3220;
    if (!_3194)
    {
        _3256 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3264 = _3256;
    float _3266 = _3264;
    float _3268 = _3264;
    if (!_3194)
    {
        _3258 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3270 = _3258;
    out.m_85.x = _3250;
    out.m_85.y = _3252;
    out.m_85.z = _3254;
    out.m_85.w = _3240;
    bool _3272 = !_3194;
    float _3274 = _3270;
    float _3276 = _3270;
    if (!_3272)
    {
        bool _3278 = _2661 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3280 = isnan(_2661);
        bool _3282 = _3278 || _3280;
        bool _3284 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3286 = _3282 || _3284;
        if (!_3286)
        {
            float _3288 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3290 = _2661 + _3288;
            float _3292 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3294 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3292;
            float _3296 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3298 = _3296 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3300 = 1.0 / _3294;
            float _3302 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3304 = _3302 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3306 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3308 = _3306 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3312 = _3310 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3316 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3318 = _3290 * _3300;
            float _3320 = precise::clamp(_3318, 0.0, 1.0);
            float _3322 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3324 = _3322 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3326 = fma(_3320, _3298, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3328 = fma(_3320, _3324, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3330 = fma(_3320, _3304, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3332 = fma(_3320, _3308, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3334 = fma(_3320, _3312, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3336 = fma(_3320, _3316, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3262 = _3330;
            _3268 = _3334;
            _3218 = _3326;
            _3212 = _3332;
            _3206 = _3328;
            _3276 = _3336;
            _3338 = true;
        }
        else
        {
            bool _3340 = _2661 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3342 = isnan(_2661);
            bool _3344 = _3340 || _3342;
            bool _3346 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3348 = _3344 || _3346;
            if (!_3348)
            {
                _3216 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3350 = _3216;
            _3218 = _3350;
            if (!_3348)
            {
                _3260 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3352 = _3260;
            _3262 = _3352;
            if (!_3348)
            {
                _3204 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3354 = _3204;
            _3206 = _3354;
            if (!_3348)
            {
                _3210 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3356 = _3210;
            _3212 = _3356;
            if (!_3348)
            {
                _3266 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3358 = _3266;
            _3268 = _3358;
            if (!_3348)
            {
                _3274 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3360 = _3274;
            bool _3362 = !_3348;
            _3276 = _3360;
            if (!_3362)
            {
                bool _3364 = _2661 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3366 = isnan(_2661);
                bool _3368 = _3364 || _3366;
                bool _3370 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3372 = _3368 || _3370;
                if (!_3372)
                {
                    float _3374 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3376 = _2661 + _3374;
                    float _3378 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3380 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3378;
                    float _3382 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3384 = _3382 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3386 = 1.0 / _3380;
                    float _3388 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3390 = _3388 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3392 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3394 = _3392 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3396 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3398 = _3396 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3402 = _3400 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3404 = _3376 * _3386;
                    float _3406 = precise::clamp(_3404, 0.0, 1.0);
                    float _3408 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3410 = _3408 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3412 = fma(_3406, _3384, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3414 = fma(_3406, _3410, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3416 = fma(_3406, _3390, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3418 = fma(_3406, _3394, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3420 = fma(_3406, _3398, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3422 = fma(_3406, _3402, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3262 = _3416;
                    _3268 = _3420;
                    _3218 = _3412;
                    _3212 = _3418;
                    _3206 = _3414;
                    _3276 = _3422;
                    _3338 = true;
                }
                else
                {
                    _3262 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3268 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3218 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3212 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3206 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3276 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3338 = false;
    float _3424 = _3262;
    float _3426 = _3268;
    float _3428 = _3218;
    float _3430 = _3212;
    float _3432 = _3206;
    float _3434 = _3276;
    float _3436 = fma(_3172, -0.5, 0.5);
    float _3438 = precise::clamp(_3436, 0.0, 1.0);
    float _3440 = -_3424;
    float _3442 = _3440 + _3426;
    float _3444 = _3248 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3446 = -_3428;
    float _3448 = _3446 + _3430;
    float _3450 = fma(_3438, _3442, _3424);
    out.m_87.x = 0.0;
    float _3452 = -_3432;
    float _3454 = _3452 + _3434;
    float _3456 = fma(_3438, _3448, _3428);
    float _3458 = _3450 * 0.586610972881317138671875;
    out.m_49.x = _3444;
    bool _3460 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3462 = fma(_3438, _3454, _3432);
    float _3464 = fma(_3456, 0.298911988735198974609375, _3458);
    bool _3466 = _2577 > 0.0;
    bool _3468 = isnan(_2577);
    bool _3470 = _3466 || _3468;
    bool _3472 = isnan(0.0);
    bool _3474 = _3470 || _3472;
    float _3476 = fma(_3462, 0.114477999508380889892578125, _3464);
    bool _3478 = _2639 <= 0.0;
    bool _3480 = !_3474;
    bool _3482 = _3478 || _3480;
    float _3484 = -_3476;
    float _3486 = _3456 + _3484;
    float _3488 = -_3476;
    float _3490 = _3450 + _3488;
    float _3492 = -_3476;
    float _3494 = _3462 + _3492;
    float _3496 = fma(_3486, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3476);
    float _3498 = fma(_3490, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3476);
    float _3500 = fma(_3494, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3476);
    bool _3502 = !_3460;
    if (!_3502)
    {
        float _3504 = -_2509;
        float _3506 = _3504 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3508 = -_2511;
        float _3510 = _3508 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3512 = -_2513;
        float _3514 = _3512 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3516 = _3506 * _3506;
        float _3518 = fma(_3510, _3510, _3516);
        float _3520 = fma(_3514, _3514, _3518);
        float _3522 = sqrt(_3520);
        float _3524 = rsqrt(_3520);
        float _3526 = -_3522;
        float _3528 = _3526 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3530 = _3528 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3532 = precise::clamp(_3530, 0.0, 1.0);
        float _3534 = _3510 * _3524;
        float _3536 = _3506 * _3524;
        float _3538 = abs(_3532);
        float _3540 = log2(_3538);
        float _3542 = _3514 * _3524;
        float _3544 = _3534 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3546 = _3172 * _3536;
        float _3548 = -_3536;
        float _3550 = -_3544;
        float _3552 = fma(_3548, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3550);
        float _3554 = fma(_3182, _3534, _3546);
        float _3556 = -_3542;
        float _3558 = fma(_3556, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3552);
        float _3560 = fma(_3184, _3542, _3554);
        float _3562 = precise::clamp(_3560, 0.0, 1.0);
        float _3564 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3566 = _3558 + _3564;
        float _3568 = _3540 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3570 = _3566 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3572 = precise::clamp(_3570, 0.0, 1.0);
        float _3574 = exp2(_3568);
        float _3576 = _3574 * _3572;
        float _3578 = _3562 * _3576;
        float _3580 = _3578 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3582 = _3578 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3584 = _3578 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3580;
        out.m_87.y = _3582;
        out.m_87.z = _3584;
    }
    out.m_89.x = _3496;
    out.m_89.y = _3498;
    out.m_89.z = _3500;
    if (!_3482)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3586 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3586;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

