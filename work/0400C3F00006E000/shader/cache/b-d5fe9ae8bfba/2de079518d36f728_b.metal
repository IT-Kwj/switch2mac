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
    float4 m_63 [[user(locn4)]];
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
    float4 m_59 [[attribute(10)]];
    float4 m_61 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3598 = false;
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
        float _3904 = as_type<float>(_124);
        out.gl_Position.z = _3904;
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
        float _3968 = as_type<float>(_158);
        out.gl_Position.z = _3968;
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
    float _452 = in.m_59.x;
    float _454 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _456 = int(_454);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _462 = float(_446);
    float _464 = 1.0 / _460;
    float _466 = float(uint(_456));
    float _468 = 1.0 / _462;
    int _470 = ~_456;
    int _472 = _470 + 1;
    int _474 = ~_456;
    int _476 = _474 + 1;
    float _478 = 1.0 / _466;
    float _480 = _468 * _134;
    float _482 = trunc(_480);
    int _484 = int(_482);
    int _486 = as_type<int>(_478) + (-2);
    float _488 = float(uint(_484));
    float _490 = as_type<float>(_486) * _488;
    float _492 = trunc(_490);
    float _494 = precise::max(_492, 0.0);
    uint _497 = uint(_494);
    int _499 = ~_456;
    int _501 = _499 + 1;
    int _503 = _472 * int(_497);
    int _505 = _503 + _484;
    float _507 = float(uint(_505));
    float _509 = as_type<float>(_486) * _507;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _513 = _511 != 0;
    float _515 = trunc(_509);
    float _517 = precise::max(_515, 0.0);
    uint _519 = uint(_517);
    bool _521 = !_513;
    float _523 = _521 ? 7.345489978790283203125 : 1.0;
    float _525 = _523 * _448;
    float _527 = floor(_525);
    int _529 = int(_497) + int(_519);
    float _531 = float(_456);
    float _533 = float(_484);
    int _535 = _501 * _529;
    int _537 = _535 + _484;
    bool _539 = _533 >= _531;
    bool _541 = isnan(_533);
    bool _543 = _539 || _541;
    bool _545 = isnan(_531);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    bool _551 = uint(_537) >= uint(_456);
    float _553 = trunc(_549);
    int _555 = int(_553);
    bool _557 = !_551;
    int _559 = _557 ? 0 : (-1);
    bool _561 = _456 == 0;
    int _563 = ~_529;
    int _565 = _563 + _559;
    int _567 = _565 + 1;
    int _569 = _456 * _567;
    int _571 = _569 + _484;
    float _573 = -_527;
    float _575 = _525 + _573;
    bool _577 = !_561;
    int _579 = _577 ? _571 : (-1);
    float _581 = _575 * _531;
    int _583 = ~_555;
    int _585 = _583 + 1;
    int _587 = _585 + 1;
    float _589 = _531 * _134;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _593 = _591 != 0;
    float _595 = trunc(_581);
    int _597 = int(_595);
    int _599 = _579 * _587;
    int _601 = _456 + (-1);
    float _603 = _589 * _166;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _607 = _605 != 0;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _611 = _609 != 0;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _615 = _613 != 0;
    bool _617 = !_593;
    int _619 = _617 ? 0 : 1;
    int _621 = _555 * _601;
    int _623 = _621 + _599;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _627 = _625 != 0;
    float _629 = trunc(_603);
    int _631 = int(_629);
    bool _633 = !_611;
    int _635 = _633 ? 0 : 1;
    bool _637 = !_607;
    int _639 = _637 ? 0 : 1;
    int _641 = abs(_635);
    int _643 = abs(_619);
    bool _645 = !_615;
    int _647 = _645 ? 0 : 1;
    int _649 = abs(_639);
    bool _651 = !_627;
    int _653 = _651 ? 0 : 1;
    int _655 = _623 * _641;
    int _657 = abs(_647);
    int _659 = _597 * _643;
    int _661 = _659 + _484;
    int _663 = abs(_653);
    int _665 = _631 * _649;
    int _667 = _665 + _655;
    float _669 = in.m_61.x;
    int _671 = ~_456;
    int _673 = _671 + 1;
    int _675 = _661 * _657;
    int _677 = _675 + _667;
    int _679 = ~_456;
    int _681 = _679 + 1;
    float _683 = float(uint(_661));
    int _685 = _597 * _663;
    int _687 = _685 + _677;
    int _689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _691 = _689 != 0;
    float _693 = in.m_61.y;
    float _695 = as_type<float>(_486) * _683;
    float _697 = float(uint(_687));
    float _699 = as_type<float>(_486) * _697;
    float _701 = trunc(_699);
    float _703 = precise::max(_701, 0.0);
    uint _705 = uint(_703);
    out.m_63.x = _669;
    out.m_63.y = _693;
    int _707 = _673 * int(_705);
    int _709 = _707 + _687;
    float _711 = float(uint(_709));
    float _713 = as_type<float>(_486) * _711;
    float _715 = trunc(_713);
    float _717 = precise::max(_715, 0.0);
    uint _719 = uint(_717);
    int _721 = int(_705) + int(_719);
    int _723 = _681 * _721;
    int _725 = _723 + _687;
    float _727 = trunc(_695);
    float _729 = precise::max(_727, 0.0);
    uint _731 = uint(_729);
    bool _733 = uint(_725) >= uint(_456);
    bool _735 = !_733;
    int _737 = _735 ? 0 : (-1);
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _741 = _739 != 0;
    int _743 = ~_721;
    int _745 = _743 + _737;
    int _747 = _745 + 1;
    int _749 = ~_456;
    int _751 = _749 + 1;
    int _753 = _456 * _747;
    int _755 = _753 + _687;
    int _757 = _751 * int(_731);
    int _759 = _757 + _661;
    bool _761 = !_561;
    int _763 = _761 ? _755 : (-1);
    float _765 = 0.0;
    float _767 = _452;
    if (_741)
    {
        float _769 = in.m_55.x;
        _765 = _769;
    }
    float _771 = _765;
    float _773 = float(uint(_759));
    int _775 = _763 >> 31;
    int _777 = _763 & 3;
    bool _779 = _777 != 0;
    float _781 = as_type<float>(_486) * _773;
    int _783 = _775 & 3;
    float _785 = trunc(_781);
    float _787 = precise::max(_785, 0.0);
    uint _789 = uint(_787);
    int _791 = _763 + _783;
    int _793 = _791 >> 2;
    int _795 = _793 << 4;
    int _797 = _795 + 368;
    uint _799 = uint(int(uint(_797) >> uint(2)));
    uint _801 = uint(int(uint(int(_799)) >> uint(2)));
    int _803 = int(_799) & 3;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[int(_801)][_803];
    int _807 = int(_799) + 1;
    uint _809 = uint(int(uint(_807) >> uint(2)));
    int _811 = _807 & 3;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[int(_809)][_811];
    int _815 = int(_731) + int(_789);
    int _817 = _763 & 3;
    bool _819 = _817 != 0;
    int _821 = _779 ? 0 : 1;
    int _823 = _797 + 8;
    uint _825 = uint(int(uint(_823) >> uint(2)));
    uint _827 = uint(int(uint(int(_825)) >> uint(2)));
    int _829 = int(_825) & 3;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[int(_827)][_829];
    int _833 = int(_825) + 1;
    uint _835 = uint(int(uint(_833) >> uint(2)));
    int _837 = _833 & 3;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[int(_835)][_837];
    bool _841 = uint(_817) > 1u;
    int _843 = _476 * _815;
    int _845 = _843 + _661;
    int _847 = ~_821;
    int _849 = _847 + 1;
    int _851 = _849 + 1;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _855 = _853 != 0;
    bool _857 = uint(_845) >= uint(_456);
    float _859 = in.m_61.z;
    bool _861 = !_819;
    int _863 = _861 ? 0 : 1;
    bool _865 = !_857;
    int _867 = _865 ? 0 : (-1);
    bool _869 = uint(_817) >= 2u;
    int _871 = _851;
    if (!_841)
    {
        int _873 = ~_821;
        int _875 = _873 + 1;
        _871 = _875;
    }
    int _877 = _871;
    bool _879 = _817 != 3;
    int _881 = ~_815;
    int _883 = _881 + _867;
    int _885 = _883 + 1;
    int _887 = abs(_877);
    int _889 = abs(_863);
    int _891 = _456 * _885;
    int _893 = _891 + _661;
    float _895 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _897 = int(_895);
    int _899 = _869 ? 0 : 1;
    float _901 = in.m_61.w;
    bool _903 = _817 != 3;
    int _905 = ~_887;
    int _907 = _905 + 1;
    int _909 = _907 + 1;
    out.m_63.z = _859;
    int _911 = ~_899;
    int _913 = _911 + 1;
    int _915 = _913 + 1;
    int _917 = _915;
    if (_879)
    {
        int _919 = ~_899;
        int _921 = _919 + 1;
        _917 = _921;
    }
    int _923 = _917;
    int _925 = ~_889;
    int _927 = _925 + 1;
    int _929 = _927 + 1;
    int _931 = abs(_923);
    int _933 = _909 * as_type<int>(_813);
    bool _935 = !_903;
    int _937 = _935 ? 0 : (-1);
    int _939 = ~_897;
    int _941 = _939 + 1;
    int _943 = _929 * as_type<int>(_805);
    int _945 = _943 + _933;
    int _947 = abs(_937);
    int _949 = ~_931;
    int _951 = _949 + 1;
    int _953 = _951 + 1;
    float _955 = in.m_59.y;
    bool _957 = !_691;
    int _959 = _957 ? 0 : 1;
    int _961 = abs(_897);
    int _963 = _953 * as_type<int>(_831);
    int _965 = _963 + _945;
    int _967 = abs(_959);
    out.m_63.w = _901;
    float _969 = float(uint(_897));
    int _971 = ~_947;
    int _973 = _971 + 1;
    int _975 = _973 + 1;
    float _977 = float(uint(_961));
    float _979 = 1.0 / _969;
    int _981 = ~_967;
    int _983 = _981 + 1;
    int _985 = _983 + 1;
    int _987 = _975 * as_type<int>(_839);
    int _989 = _987 + _965;
    bool _991 = !_561;
    int _993 = _991 ? _893 : (-1);
    int _995 = _989 * _985;
    bool _997 = _450 > 0.5;
    float _999 = 1.0 / _977;
    float _1001 = in.m_46.x;
    float _1003 = in.m_46.y;
    float _1005 = in.m_46.z;
    int _1007 = _993 * _967;
    int _1009 = _1007 + _995;
    float _1011 = -_955;
    float _1013 = _1011 + 1.0;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1019 = float(uint(_1009));
    float _1021 = 1.0 / _1017;
    int _1023 = as_type<int>(_979) + (-2);
    int _1025 = abs(_1009);
    float _1027 = _955;
    if (_855)
    {
        float _1029 = _997 ? _1013 : _955;
        _1027 = _1029;
    }
    float _1031 = _1027;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1035 = float(uint(_1025));
    float _1037 = as_type<float>(_1023) * _1019;
    int _1039 = as_type<int>(_999) + (-2);
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1043 = _450 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1045 = _448 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1047 = ~_961;
    int _1049 = _1047 + 1;
    float _1051 = as_type<float>(_1039) * _1035;
    float _1053 = trunc(_1037);
    float _1055 = precise::max(_1053, 0.0);
    uint _1057 = uint(_1055);
    float _1059 = fma(_1043, -2.0, _1041);
    float _1061 = _1003 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1063 = _1003 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1065 = -_1033;
    float _1067 = fma(_1045, 2.0, _1065);
    float _1069 = _1003 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1071;
    float _1075 = fma(_1001, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1061);
    float _1077 = trunc(_1051);
    float _1079 = precise::max(_1077, 0.0);
    uint _1081 = uint(_1079);
    float _1083 = fma(_1001, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1063);
    float _1085 = fma(_1001, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1069);
    float _1087 = _1073 * _1021;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1091 = _1089 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1093 = _771 > 0.5;
    bool _1095 = _1093 && _741;
    float _1097 = fma(_1005, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1075);
    int _1099 = _941 * int(_1057);
    int _1101 = _1099 + _1009;
    float _1103 = _1091 * _464;
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1107 = _1105 != 0;
    int _1109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1111 = _1109 != 0;
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1115 = _1113 != 0;
    float _1117 = float(uint(_1101));
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1121 = _1119 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1123 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1125 = isnan(_442);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1131 = _1127 || _1129;
    float _1133 = float(_1131);
    int _1135 = _1049 * int(_1081);
    int _1137 = _1135 + _1025;
    float _1139 = 1.0 / _1121;
    float _1141 = as_type<float>(_1023) * _1117;
    bool _1143 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1145 = isnan(_442);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1151 = _1147 || _1149;
    float _1153 = float(_1151);
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1157 = _442 + _1155;
    float _1159 = float(uint(_1137));
    float _1161 = fma(_1087, _1157, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1163 = trunc(_1141);
    float _1165 = precise::max(_1163, 0.0);
    uint _1167 = uint(_1165);
    float _1169 = as_type<float>(_1039) * _1159;
    bool _1171 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1173 = isnan(_442);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = -_1133;
    float _1185 = _1183 + 1.0;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1187;
    int _1191 = ~_897;
    int _1193 = _1191 + 1;
    float _1195 = -_1181;
    float _1197 = _1195 + 1.0;
    float _1199 = trunc(_1169);
    float _1201 = precise::max(_1199, 0.0);
    uint _1203 = uint(_1201);
    float _1205 = _1181 * _1185;
    bool _1207 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1209 = isnan(_442);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = _1153 * _1197;
    float _1221 = -_1153;
    float _1223 = _1221 + 1.0;
    float _1225 = _1189 * _1139;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1229 = _442 + _1227;
    float _1231 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1233 = _442 + _1231;
    float _1235 = _1217 * _1223;
    int _1237 = int(_1057) + int(_1167);
    float _1239 = fma(_1103, _1229, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1241 = ~_961;
    int _1243 = _1241 + 1;
    float _1245 = _1161 * _1235;
    float _1247 = -_1217;
    float _1249 = _1247 + 1.0;
    float _1251 = fma(_1225, _1233, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1253 = _1233;
    float _1255 = _1251;
    if (!_741)
    {
        _1253 = _452;
    }
    float _1257 = _1253;
    float _1259 = _1257;
    if (_1095)
    {
        float _1261 = -_452;
        float _1263 = _1261 + 1.0;
        _767 = _1263;
    }
    float _1265 = _767;
    int _1267 = int(_1081) + int(_1203);
    int _1269 = _1193 * _1237;
    int _1271 = _1269 + _1009;
    float _1273 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1245);
    if (_741)
    {
        _1259 = _1265;
    }
    float _1275 = _1259;
    bool _1277 = uint(_1271) >= uint(_897);
    int _1279 = _1243 * _1267;
    int _1281 = _1279 + _1025;
    float _1283 = fma(_1005, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1083);
    float _1285 = fma(_1005, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1085);
    bool _1287 = !_1277;
    int _1289 = _1287 ? 0 : (-1);
    float _1291 = fma(_1239, _1219, _1273);
    float _1293 = _1283 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1295 = uint(_1281) >= uint(_961);
    float _1297 = _1285 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1299 = ~_1237;
    int _1301 = _1299 + _1289;
    int _1303 = _1301 + 1;
    float _1305 = _1097 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1309 = _1293 + _1307;
    bool _1311 = !_1295;
    int _1313 = _1311 ? 0 : (-1);
    float _1315 = fma(_1251, _1205, _1291);
    int _1317 = _1009 ^ _897;
    float _1319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1323 = _1305 + _1321;
    float _1325 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1327 = ~_1313;
    int _1329 = _1267 + _1327;
    int _1331 = _1329 + 1;
    float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1335 = _1297 + _1333;
    bool _1337 = _897 == 0;
    bool _1339 = _897 == 0;
    int _1341 = _897 * _1303;
    int _1343 = _1341 + _1009;
    uint _1345 = uint(int(uint(_1317) >> uint(31)));
    float _1347 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1325);
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1351 = ~int(_1345);
    int _1353 = _1351 + 1;
    float _1355 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1347);
    bool _1357 = !_1337;
    int _1359 = _1357 ? _1343 : (-1);
    float _1361 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1363 = _1331 ^ _1353;
    bool _1365 = _1355 >= 0.0;
    float _1367 = fma(_1361, _1275, -0.5);
    int _1369 = ~_1353;
    int _1371 = _1369 + _1363;
    int _1373 = _1371 + 1;
    float _1375 = float(_1359);
    float _1377 = -_134;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1067);
    bool _1381 = !_1339;
    int _1383 = _1381 ? _1373 : (-1);
    float _1385 = fma(_1361, _1375, _1379);
    float _1387 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1389 = float(_1383);
    float _1391 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1059);
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1395 = fma(_1387, _1031, -0.5);
    float _1397 = -_1391;
    float _1399 = fma(_1387, _1389, _1397);
    float _1401 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1315);
    float _1403 = _1309 * _1309;
    float _1405 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1393);
    float _1407 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1409 = _1383;
    if (_1365)
    {
        _1255 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1411 = _1255;
    float _1413 = fma(_1323, _1323, _1403);
    float _1415 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1405);
    float _1417 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1407);
    float _1419 = fma(_1335, _1335, _1413);
    float _1421 = fma(_1415, _1395, _1399);
    if (_1365)
    {
        float _1423 = _1411 * 5.0;
        _1409 = as_type<int>(_1423);
    }
    int _1425 = _1409;
    float _1427 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1417);
    float _1429 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1431 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1433 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1435 = rsqrt(_1419);
    float _1437 = fma(_1427, _1367, _1385);
    if (_1365)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5885 = as_type<float>(_1425);
        out.gl_Position.z = _5885;
    }
    float _1439 = _1437 + 0.5;
    float _1441 = _1421 + 0.5;
    float _1443 = _1401 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_1365)
    {
        out.m_49.x = 0.0;
    }
    bool _1445 = !_1115;
    int _1447 = _1445 ? 0 : 1;
    bool _1449 = !_1107;
    int _1451 = _1449 ? 0 : 1;
    out.m_65.x = _1439;
    out.m_65.y = _1441;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1459 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1463 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1465 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1467 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1469 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1471 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1473 = !_1111;
    int _1475 = _1473 ? 0 : 1;
    float _1477 = _1309 * _1435;
    out.m_67.x = _1463;
    out.m_67.y = _1465;
    out.m_67.z = _1467;
    out.m_67.w = _1461;
    float _1479 = _1323 * _1435;
    out.m_69.x = _1459;
    out.m_69.y = _1469;
    out.m_69.z = _1471;
    out.m_69.w = _1443;
    if (_1365)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1481 = -_1477;
    float _1483 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1293);
    float _1485 = -_1479;
    float _1487 = fma(_1485, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1305);
    float _1489 = _1335 * _1435;
    float _1491 = in.m_55.z;
    float _1493 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1495 = _1483 + _1493;
    float _1497 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1499 = _1487 + _1497;
    float _1501 = -_1489;
    float _1503 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1297);
    float _1505 = _448 * 2.0;
    float _1507 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1509 = _450 * 2.0;
    float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1513 = _1503 + _1511;
    float _1515 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1507);
    float _1517 = floor(_1505);
    bool _1519 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1521 = isnan(0.0);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1527 = _1523 || _1525;
    float _1529 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1515);
    float _1531 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1533 = log2(_1531);
    bool _1535 = _1529 >= 0.0;
    float _1537 = _450 + _448;
    float _1539 = _1537 + (-1.0);
    float _1541 = _450 + _1491;
    float _1543 = floor(_1509);
    bool _1545 = _1517 > 0.0;
    float _1547 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1549 = _1541 + (-1.0);
    bool _1551 = _1517 >= 0.0;
    bool _1553 = isnan(_1517);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan(0.0);
    bool _1559 = _1555 || _1557;
    float _1561 = _1491 * 2.0;
    float _1563 = 0.0;
    int _1565 = as_type<int>(_1509);
    float _1567 = _1489;
    float _1569 = _1513;
    if (_1535)
    {
        _1563 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1571 = _1563;
    float _1573 = _1533 * _134;
    float _1575 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_1535)
    {
        out.m_49.x = 0.0;
    }
    if (_1535)
    {
        float _1577 = _1571 * 5.0;
        _1565 = as_type<int>(_1577);
    }
    int _1579 = _1565;
    float _1581 = floor(_1561);
    bool _1583 = _1543 > 0.0;
    if (_1535)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6149 = as_type<float>(_1579);
        out.gl_Position.z = _6149;
    }
    bool _1585 = _1543 >= 0.0;
    bool _1587 = isnan(_1543);
    bool _1589 = _1585 || _1587;
    bool _1591 = isnan(0.0);
    bool _1593 = _1589 || _1591;
    float _1595 = exp2(_1573);
    bool _1597 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1599 = isnan(1.0);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1605 = _1601 || _1603;
    float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1609 = 1.0 + _1607;
    if (_1535)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1611 = -_1293;
    float _1613 = _1611 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1615 = -_1305;
    float _1617 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1619 = -_1297;
    float _1621 = _1619 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1623 = 1.0 / _1609;
    float _1625 = _1613 * _1613;
    float _1627 = -_1595;
    float _1629 = _1627 + 1.0;
    int _1631 = _1559 ? 0 : 1;
    float _1633 = _450 + (-0.5);
    float _1635 = fma(_1617, _1617, _1625);
    bool _1637 = _1581 > 0.0;
    float _1639 = -_1477;
    float _1641 = fma(_1639, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _1643 = _1527 ? _1629 : 0.0;
    float _1645 = fma(_1621, _1621, _1635);
    bool _1647 = _1581 >= 0.0;
    bool _1649 = isnan(_1581);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan(0.0);
    bool _1655 = _1651 || _1653;
    float _1657 = -_1479;
    float _1659 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1323);
    int _1661 = ~_1631;
    int _1663 = _1661 + 1;
    int _1665 = _1663 + 1;
    float _1667 = rsqrt(_1645);
    int _1669 = _1665;
    if (!_1545)
    {
        int _1671 = ~_1631;
        int _1673 = _1671 + 1;
        _1669 = _1673;
    }
    int _1675 = _1669;
    float _1677 = _1641 * _1641;
    int _1679 = abs(_1475);
    if (_1605)
    {
        float _1681 = _1643 * _1623;
        _152 = _1681;
    }
    float _1683 = _152;
    int _1685 = abs(_1451);
    float _1687 = fma(_1659, _1659, _1677);
    int _1689 = _1655 ? 0 : 1;
    float _1691 = -_1489;
    float _1693 = fma(_1691, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1335);
    int _1695 = abs(_1447);
    float _1697 = sqrt(_1645);
    float _1699 = float(_1675);
    float _1701 = fma(_1693, _1693, _1687);
    int _1703 = ~_1689;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    int _1709 = _1707;
    if (!_1637)
    {
        int _1711 = ~_1689;
        int _1713 = _1711 + 1;
        _1709 = _1713;
    }
    int _1715 = _1709;
    float _1717 = _1617 * _1667;
    float _1719 = _1621 * _1667;
    int _1721 = _1593 ? 0 : 1;
    float _1723 = _1717 * _1717;
    float _1725 = float(_1679);
    float _1727 = float(_1685);
    float _1729 = fma(_1719, _1719, _1723);
    float _1731 = float(_1715);
    float _1733 = _1725 * _1699;
    float _1735 = rsqrt(_1729);
    int _1737 = ~_1721;
    int _1739 = _1737 + 1;
    int _1741 = _1739 + 1;
    float _1743 = _1727 * _1731;
    int _1745 = _1741;
    if (!_1583)
    {
        int _1747 = ~_1721;
        int _1749 = _1747 + 1;
        _1745 = _1749;
    }
    int _1751 = _1745;
    float _1753 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1755 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1757 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1759 = float(_1751);
    float _1761 = float(_1695);
    float _1763 = -_1757;
    float _1765 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1763);
    float _1767 = -_1753;
    float _1769 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1767);
    float _1771 = _1761 * _1759;
    float _1773 = -_1755;
    float _1775 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1773);
    float _1777 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1779 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1781 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1783 = _1719 * _1735;
    float _1785 = _1613 * _1667;
    float _1787 = in.m_71.x;
    float _1789 = in.m_71.y;
    float _1791 = in.m_71.z;
    float _1793 = -_1779;
    float _1795 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1793);
    float _1797 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1799 = -_1781;
    float _1801 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1799);
    float _1803 = _1717 * _1735;
    float _1805 = -_1783;
    float _1807 = _1719 * _1805;
    float _1809 = -_1797;
    float _1811 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1809);
    float _1813 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1801);
    float _1815 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1817 = -_1807;
    float _1819 = fma(_1717, _1803, _1817);
    float _1821 = -_1777;
    float _1823 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1821);
    float _1825 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1827 = _1785 * _1803;
    float _1829 = _1819 * _1819;
    float _1831 = -_1815;
    float _1833 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1831);
    float _1835 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1837 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1811);
    float _1839 = fma(_1827, _1827, _1829);
    float _1841 = -_1783;
    float _1843 = _1785 * _1841;
    float _1845 = -_1835;
    float _1847 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1845);
    float _1849 = _1795 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1851 = -_1825;
    float _1853 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1851);
    float _1855 = _1743 * (-2.0);
    float _1857 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1847);
    float _1859 = -_1849;
    float _1861 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1859);
    float _1863 = fma(_1843, _1843, _1839);
    float _1865 = fma(_1547, _1855, _1547);
    float _1867 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1853);
    float _1869 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1861);
    float _1871 = fma(_1855, _1787, _1787);
    float _1873 = _1733 * (-2.0);
    float _1875 = _448 + (-0.5);
    float _1877 = rsqrt(_1863);
    float _1879 = -_1869;
    float _1881 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1867);
    float _1883 = fma(_1873, _1789, _1789);
    float _1885 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1871);
    float _1887 = fma(_1575, _1873, _1575);
    float _1889 = _1771 * (-2.0);
    float _1891 = fma(_1633, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1883);
    float _1893 = fma(_1865, _1683, _1885);
    float _1895 = 1.0 / _1881;
    float _1897 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1899 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1901 = fma(_1887, _1683, _1891);
    float _1903 = fma(_1889, _1791, _1791);
    float _1905 = -_1897;
    float _1907 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1905);
    float _1909 = -_1899;
    float _1911 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1909);
    float _1913 = _1893 * 0.15915493667125701904296875;
    float _1915 = _1819 * _1877;
    float _1917 = precise::clamp(_1915, 0.0, 1.0);
    float _1919 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1921 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1911);
    float _1923 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1907);
    float _1925 = -_1917;
    float _1927 = _1925 + 1.0;
    float _1929 = -_1919;
    float _1931 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1929);
    float _1933 = _1901 * 0.15915493667125701904296875;
    float _1935 = _1491 + _448;
    float _1937 = fma(_1921, _1895, -1.0);
    float _1939 = _1927 * _1895;
    float _1941 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1931);
    float _1943 = fma(_1927, _1937, 1.0);
    float _1945 = _1923 * _1939;
    float _1947 = _1941 * _1939;
    float _1949 = _1935 + (-1.0);
    float _1951 = _1943 * _1943;
    float _1953 = _1491 + (-0.5);
    float _1955 = _1933 * 6.283185482025146484375;
    float _1957 = sin(_1955);
    float _1959 = fma(_1949, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1961 = fma(_1945, _1945, _1951);
    float _1963 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1903);
    float _1965 = fma(_1959, _1889, _1959);
    float _1967 = fma(_1947, _1947, _1961);
    float _1969 = _1933 * 6.283185482025146484375;
    float _1971 = cos(_1969);
    float _1973 = fma(_1965, _1683, _1963);
    float _1975 = abs(_1697);
    float _1977 = precise::max(0.0, _1975);
    float _1979 = _1973 * 0.15915493667125701904296875;
    float _1981 = rsqrt(_1967);
    float _1983 = precise::min(_1977, 40.0);
    float _1985 = _1913 * 6.283185482025146484375;
    float _1987 = sin(_1985);
    float _1989 = _1947 * _1981;
    float _1991 = _1943 * _1981;
    float _1993 = _1945 * _1981;
    float _1995 = _1913 * 6.283185482025146484375;
    float _1997 = cos(_1995);
    float _1999 = -_1989;
    float _2001 = _1717 * _1999;
    float _2003 = _1719 * _1991;
    float _2005 = -_1993;
    float _2007 = _1785 * _2005;
    float _2009 = -_1993;
    float _2011 = -_2001;
    float _2013 = fma(_1719, _2009, _2011);
    float _2015 = -_1989;
    float _2017 = -_2003;
    float _2019 = fma(_1785, _2015, _2017);
    float _2021 = -_2007;
    float _2023 = fma(_1717, _1991, _2021);
    float _2025 = _1979 * 6.283185482025146484375;
    float _2027 = cos(_2025);
    float _2029 = _2013 * _2013;
    float _2031 = _1987 * _1957;
    float _2033 = _1987 * _1971;
    float _2035 = fma(_2019, _2019, _2029);
    float _2037 = sqrt(_1701);
    float _2039 = fma(_2023, _2023, _2035);
    float _2041 = _1997 * _1971;
    float _2043 = rsqrt(_2039);
    float _2045 = _1987 * _2027;
    float _2047 = _1971 * _2027;
    float _2049 = _1997 * _2027;
    float _2051 = _1957 * _2027;
    float _2053 = in.m_73.x;
    float _2055 = in.m_73.y;
    float _2057 = in.m_73.z;
    float _2059 = _1979 * 6.283185482025146484375;
    float _2061 = sin(_2059);
    float _2063 = _2019 * _2043;
    float _2065 = _1997 * _1957;
    float _2067 = _1435 * _2037;
    float _2069 = _2023 * _2043;
    float _2071 = _1719 * _2063;
    float _2073 = _380 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2075 = fma(_2061, _2041, _2031);
    float _2077 = fma(_2061, _2031, _2041);
    float _2079 = _2013 * _2043;
    float _2081 = _1785 * _2069;
    float _2083 = -_2071;
    float _2085 = fma(_1717, _2069, _2083);
    float _2087 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2089 = _1717 * _2079;
    float _2091 = -_2081;
    float _2093 = fma(_1719, _2079, _2091);
    float _2095 = _2085 * _2085;
    float _2097 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _2087);
    float _2099 = -_2089;
    float _2101 = fma(_1785, _2063, _2099);
    float _2103 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2105 = fma(_2093, _2093, _2095);
    float _2107 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2109 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _2097);
    float _2111 = -_2065;
    float _2113 = fma(_2061, _2033, _2111);
    float _2115 = fma(_2101, _2101, _2105);
    float _2117 = -_2033;
    float _2119 = fma(_2061, _2065, _2117);
    float _2121 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2107);
    float _2123 = _2073 * _2067;
    float _2125 = rsqrt(_2115);
    float _2127 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2053);
    float _2129 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2121);
    float _2131 = _2103 * _2067;
    float _2133 = _2109 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2135 = _2127 * _2123;
    float _2137 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2055);
    float _2139 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2141 = _2137 * _2131;
    float _2143 = -_2139;
    float _2145 = _2133 + _2143;
    bool _2147 = _2139 >= _2133;
    bool _2149 = isnan(_2139);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan(_2133);
    bool _2155 = _2151 || _2153;
    float _2157 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2159 = _354 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2161 = _2101 * _2125;
    float _2163 = abs(_2145);
    float _2165 = precise::max(_2163, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _2167 = _2093 * _2125;
    float _2169 = _2085 * _2125;
    float _2171 = _1717 * _2161;
    float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2175 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _2173;
    float _2177 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2157);
    float _2179 = precise::min(_2165, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _2181 = _1719 * _2169;
    float _2183 = -_2171;
    float _2185 = fma(_1719, _2167, _2183);
    float _2187 = 1.0 / _2175;
    float _2189 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2177);
    float _2191 = -_2181;
    float _2193 = fma(_1785, _2161, _2191);
    float _2195 = _2185 * _2185;
    float _2197 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2199 = _2179 + _2197;
    bool _2201 = !_2155;
    float _2203 = _2201 ? 1.0 : (-1.0);
    float _2205 = rsqrt(_2189);
    float _2207 = _1785 * _2167;
    float _2209 = -_2207;
    float _2211 = fma(_1717, _2169, _2209);
    float _2213 = fma(_2193, _2193, _2195);
    float _2215 = _2049 * _2141;
    float _2217 = _2199 * _2187;
    float _2219 = _2159 * _2067;
    float _2221 = fma(_2211, _2211, _2213);
    float _2223 = -_2141;
    float _2225 = _2061 * _2223;
    float _2227 = _2045 * _2141;
    float _2229 = fma(_2075, _2135, _2215);
    float _2231 = _2203 * _2217;
    float _2233 = rsqrt(_2221);
    float _2235 = fma(_2113, _2135, _2227);
    float _2237 = _2219 * _2057;
    float _2239 = fma(_2047, _2135, _2225);
    float _2241 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2243 = fma(_1983, -0.02500000037252902984619140625, 1.0);
    float _2245 = fma(_2119, _2237, _2229);
    float _2247 = fma(_2051, _2237, _2239);
    float _2249 = fma(_2077, _2237, _2235);
    float _2251 = _2241 * _2231;
    float _2253 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2255 = _2161 * _2245;
    float _2257 = _2253 * _2253;
    float _2259 = _2193 * _2233;
    float _2261 = _2185 * _2233;
    float _2263 = _2211 * _2233;
    float _2265 = _2169 * _2245;
    float _2267 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2269 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2271 = _2167 * _2245;
    float _2273 = fma(_2261, _2247, _2265);
    float _2275 = fma(_2267, _2267, _2257);
    float _2277 = fma(_2263, _2247, _2255);
    float _2279 = fma(_2259, _2247, _2271);
    float _2281 = fma(_1785, _2249, _2273);
    float _2283 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2285 = fma(_1719, _2249, _2277);
    float _2287 = fma(_1717, _2249, _2279);
    float _2289 = _1293 + _2281;
    float _2291 = _2251 * 0.15915493667125701904296875;
    float _2293 = fma(_2269, _2269, _2275);
    float _2295 = _1305 + _2287;
    float _2297 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2299 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2301 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2303 = _1297 + _2285;
    float _2305 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2297);
    float _2307 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2299);
    float _2309 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2301);
    float _2311 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2283);
    float _2313 = rsqrt(_2293);
    float _2315 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2307);
    float _2317 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2309);
    float _2319 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2305);
    float _2321 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2311);
    float _2323 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2325 = _2317 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2327 = _2319 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2329 = _2291 * 6.283185482025146484375;
    float _2331 = cos(_2329);
    float _2333 = _2321 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2335 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2337 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2339 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2341 = -_2323;
    float _2343 = _2341 + _2333;
    float _2345 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2335);
    float _2347 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2337);
    float _2349 = _2291 * 6.283185482025146484375;
    float _2351 = sin(_2349);
    float _2353 = fma(_2243, _2343, _2323);
    float _2355 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2339);
    float _2357 = _2267 * _2313;
    float _2359 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2345);
    float _2361 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2347);
    float _2363 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2355);
    float _2365 = -_2331;
    float _2367 = _2365 + 1.0;
    float _2369 = _2253 * _2313;
    float _2371 = _2269 * _2313;
    float _2373 = _2359 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2375 = _2357 * _2367;
    float _2377 = _2369 * _2367;
    float _2379 = _2371 * _2371;
    float _2381 = _2361 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2383 = _2357 * _2351;
    float _2385 = _2369 * _2351;
    float _2387 = fma(_2367, _2379, _2331);
    float _2389 = _2371 * _2351;
    float _2391 = fma(_2371, _2377, _2383);
    float _2393 = -_1293;
    float _2395 = _2393 + _2373;
    float _2397 = -_2385;
    float _2399 = fma(_2371, _2375, _2397);
    float _2401 = -_2389;
    float _2403 = fma(_2369, _2375, _2401);
    float _2405 = -_1305;
    float _2407 = _2405 + _2381;
    float _2409 = _2391 * _2395;
    float _2411 = _2363 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2413 = fma(_2357, _2375, _2331);
    float _2415 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2417 = _2415 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2419 = _2403 * _2395;
    float _2421 = fma(_2399, _2407, _2409);
    float _2423 = -_1297;
    float _2425 = _2423 + _2411;
    float _2427 = fma(_170, _2417, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2429 = fma(_2413, _2407, _2419);
    float _2431 = fma(_2371, _2375, _2385);
    float _2433 = fma(_2387, _2425, _2421);
    float _2435 = fma(_2369, _2377, _2331);
    float _2437 = fma(_2369, _2375, _2389);
    float _2439 = fma(_2431, _2425, _2429);
    float _2441 = fma(_2433, _2427, _1297);
    float _2443 = _2435 * _2395;
    float _2445 = -_2383;
    float _2447 = fma(_2371, _2377, _2445);
    float _2449 = fma(_2439, _2427, _1305);
    float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2453 = _2441 + _2451;
    float _2455 = fma(_2437, _2407, _2443);
    float _2457 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2461 = _2449 + _2459;
    float _2463 = _2453 * _2453;
    float _2465 = fma(_2447, _2425, _2455);
    float _2467 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2457);
    float _2469 = fma(_2461, _2461, _2463);
    float _2471 = _1293 + _2465;
    float _2473 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2467);
    float _2475 = sqrt(_2469);
    bool _2477 = _2475 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2479 = _2457;
    float _2481 = _2467;
    float _2483 = _2441;
    if (!_2477)
    {
        _2479 = _2449;
    }
    float _2485 = _2479;
    float _2487 = _2485;
    if (!_2477)
    {
        _2481 = _2471;
    }
    float _2489 = _2481;
    bool _2491 = !_2477;
    float _2493 = _2489;
    if (!_2491)
    {
        float _2495 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2499 = _2475 + _2497;
        float _2501 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2503 = rsqrt(_2469);
        float _2505 = _2499 * _2495;
        float _2507 = _2505 * 0.15915493667125701904296875;
        float _2509 = _2507 * 6.283185482025146484375;
        float _2511 = cos(_2509);
        float _2513 = _2507 * 6.283185482025146484375;
        float _2515 = sin(_2513);
        float _2517 = _2511 + (-1.0);
        float _2519 = fma(_2515, _2501, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2521 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2523 = _2503 * _2519;
        float _2525 = fma(_2471, _2511, _2521);
        float _2527 = fma(_2461, _2523, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2529 = fma(_2453, _2523, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2493 = _2525;
        _2487 = _2527;
        _2483 = _2529;
    }
    float _2531 = _2493;
    float _2533 = _2487;
    float _2535 = _2483;
    float _2537 = -_1293;
    float _2539 = _2537 + _2531;
    float _2541 = _2473 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2543 = -_1305;
    float _2545 = _2543 + _2533;
    float _2547 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2549 = _2539 * _2539;
    float _2551 = -_1297;
    float _2553 = _2551 + _2535;
    float _2555 = 1.0 / _2541;
    float _2557 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2547);
    float _2559 = fma(_2545, _2545, _2549);
    float _2561 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2557);
    float _2563 = fma(_2553, _2553, _2559);
    float _2565 = _2561 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2567 = sqrt(_2563);
    float _2569 = _2565 + _2541;
    float _2571 = _2569 * _2555;
    float _2573 = _2571 * 0.5;
    float _2575 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2577 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2575);
    float _2579 = 1.0 / _2577;
    bool _2581 = _2567 > 0.0;
    bool _2583 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2585 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2587 = _2583 || _2585;
    bool _2589 = isnan(0.5);
    bool _2591 = _2587 || _2589;
    bool _2593 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2595 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2597 = _2593 || _2595;
    bool _2599 = isnan(0.5);
    bool _2601 = _2597 || _2599;
    float _2603 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2605 = _2533;
    float _2607 = _2535;
    float _2609 = _2539;
    if (!_2581)
    {
        _2603 = _2531;
    }
    float _2611 = _2603;
    bool _2613 = !_2581;
    float _2615 = _2611;
    if (!_2613)
    {
        float _2617 = _186 * _186;
        float _2619 = rsqrt(_2563);
        float _2621 = fma(_184, _184, _2617);
        float _2623 = fma(_188, _188, _2621);
        float _2625 = sqrt(_2623);
        float _2627 = _2545 * _2619;
        float _2629 = _2539 * _2619;
        float _2631 = _2553 * _2619;
        bool _2633 = _2625 > 0.0;
        float _2635 = _2625;
        if (!_2633)
        {
            _2635 = _2531;
        }
        float _2637 = _2635;
        bool _2639 = !_2633;
        _2615 = _2637;
        if (!_2639)
        {
            float _2641 = rsqrt(_2623);
            float _2643 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2645 = _186 * _2641;
            float _2647 = _184 * _2641;
            float _2649 = _2629 * _2645;
            float _2651 = _188 * _2641;
            float _2653 = fma(_2627, _2647, _2649);
            float _2655 = _2643 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2657 = fma(_2631, _2651, _2653);
            float _2659 = _2657 * _2655;
            float _2661 = fma(_184, _2659, _2533);
            float _2663 = fma(_186, _2659, _2531);
            float _2665 = fma(_188, _2659, _2535);
            _2615 = _2663;
            _2605 = _2661;
            _2607 = _2665;
            _2609 = _2659;
        }
    }
    float _2667 = _2615;
    float _2669 = _2605;
    float _2671 = _2607;
    float _2673 = _2609;
    float _2675 = -_1477;
    float _2677 = fma(_2675, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2667);
    float _2679 = -_1479;
    float _2681 = fma(_2679, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2669);
    float _2683 = -_1489;
    float _2685 = fma(_2683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2671);
    float _2687 = _2673;
    float _2689 = _2681;
    float _2691 = _2685;
    float _2693 = _2677;
    if (_2591)
    {
        _2687 = 1.0;
    }
    float _2695 = _2687;
    float _2697 = _2695;
    if (_2601)
    {
        _1567 = _2677;
    }
    float _2699 = _1567;
    float _2701 = _2699;
    if (!_2601)
    {
        float _2703 = _1495 * _1495;
        float _2705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2707 = -_1297;
        float _2709 = _2707 + _2671;
        float _2711 = -_1293;
        float _2713 = _2711 + _2667;
        float _2715 = fma(_1499, _1499, _2703);
        float _2717 = -_1305;
        float _2719 = _2717 + _2669;
        float _2721 = fma(_1513, _1513, _2715);
        float _2723 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2725 = sqrt(_2721);
        float _2727 = 1.0 / _2067;
        float _2729 = _2723 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2731 = precise::min(_2725, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2733 = _2731 * _2705;
        float _2735 = _2733 * _2727;
        float _2737 = _2729 * _2735;
        float _2739 = _2709 * _2735;
        float _2741 = fma(_2713, _2737, _1483);
        float _2743 = fma(_2719, _2737, _1487);
        float _2745 = fma(_2729, _2739, _1503);
        _192 = _2735;
        _2701 = _2741;
        _2689 = _2743;
        _2691 = _2745;
        _2693 = _2705;
    }
    float _2747 = _192;
    float _2749 = _2701;
    float _2751 = _2689;
    float _2753 = _2691;
    float _2755 = _2693;
    float _2757 = _2747;
    float _2759 = _2755;
    if (_2591)
    {
        _1569 = 1.0;
    }
    float _2761 = _1569;
    float _2763 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2765 = _2579 * _2763;
    float _2767 = _2761;
    if (!_2591)
    {
        float _2769 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2771 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2773 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2771;
        float _2775 = _2769 * 0.15915493667125701904296875;
        float _2777 = _2775 * 6.283185482025146484375;
        float _2779 = cos(_2777);
        float _2781 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2783 = _2781 * 0.15915493667125701904296875;
        float _2785 = _2775 * 6.283185482025146484375;
        float _2787 = sin(_2785);
        float _2789 = 1.0 / _2779;
        float _2791 = _2783 * 6.283185482025146484375;
        float _2793 = cos(_2791);
        float _2795 = _2787 * _2789;
        float _2797 = _2783 * 6.283185482025146484375;
        float _2799 = sin(_2797);
        float _2801 = _2793 * _2795;
        float _2803 = 1.0 / _2773;
        float _2805 = 1.0 / _2801;
        float _2807 = _2799 * _2805;
        float _2809 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2811 = fma(_2765, _2807, _2809);
        float _2813 = _2811 * _2803;
        float _2815 = precise::clamp(_2813, 0.0, 1.0);
        _2757 = _2783;
        _2697 = _2815;
    }
    float _2817 = _2757;
    float _2819 = _2697;
    float _2821 = _2817;
    if (!_2591)
    {
        float _2823 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2825 = _2823 * 0.15915493667125701904296875;
        float _2827 = _2825 * 6.283185482025146484375;
        float _2829 = cos(_2827);
        float _2831 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2833 = _2831 * 0.15915493667125701904296875;
        float _2835 = _2825 * 6.283185482025146484375;
        float _2837 = sin(_2835);
        float _2839 = 1.0 / _2829;
        float _2841 = _2833 * 6.283185482025146484375;
        float _2843 = cos(_2841);
        float _2845 = _2837 * _2839;
        float _2847 = _2833 * 6.283185482025146484375;
        float _2849 = sin(_2847);
        float _2851 = _2843 * _2845;
        float _2853 = 1.0 / _2851;
        float _2855 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2857 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2855;
        float _2859 = 1.0 / _2857;
        float _2861 = _2849 * _2853;
        float _2863 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2865 = fma(_2765, _2861, _2863);
        float _2867 = _2865 * _2859;
        float _2869 = precise::clamp(_2867, 0.0, 1.0);
        float _2871 = -_2869;
        float _2873 = _2871 + 1.0;
        _2821 = _2829;
        _2767 = _2873;
    }
    float _2875 = _2821;
    float _2877 = _2767;
    float _2879 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2881 = _2749 + _2879;
    float _2883 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2885 = _2751 + _2883;
    float _2887 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2889 = _2753 + _2887;
    float _2891 = _2881 * _2881;
    float _2893 = fma(_2885, _2885, _2891);
    float _2895 = fma(_2889, _2889, _2893);
    float _2897 = rsqrt(_2895);
    float _2899 = sqrt(_2895);
    float _2901 = _2897 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2903 = _2885 * _2901;
    float _2905 = _2889 * _2901;
    float _2907 = _2903 * _2903;
    float _2909 = _2905 * _2905;
    float _2911 = _2907 + _2909;
    float _2913 = sqrt(_2911);
    bool _2915 = _2913 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2919 = _2913 + _2917;
    float _2921 = _2889;
    float _2923 = _2919;
    float _2925 = _2891;
    if (_2915)
    {
        float _2927 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2921 = _2927;
    }
    float _2929 = _2921;
    if (_2915)
    {
        float _2931 = _2919 * _2929;
        _2923 = _2931;
    }
    float _2933 = _2923;
    if (_2915)
    {
        float _2935 = _2933 * 0.15915493667125701904296875;
        _2925 = _2935;
    }
    float _2937 = _2925;
    float _2939 = _2897;
    float _2941 = _2937;
    if (_2915)
    {
        float _2943 = _2937 * 6.283185482025146484375;
        float _2945 = sin(_2943);
        _2939 = _2945;
    }
    float _2947 = _2939;
    float _2949 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2951 = precise::max(0.0, _2949);
    float _2953 = _2875;
    float _2955 = _2951;
    if (_2915)
    {
        float _2957 = _2937 * 6.283185482025146484375;
        float _2959 = cos(_2957);
        _2953 = _2959;
    }
    float _2961 = _2953;
    float _2963 = -_2901;
    float _2965 = -_2951;
    float _2967 = fma(_2881, _2963, _2965);
    float _2969 = _2949;
    float _2971 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2915)
    {
        float _2973 = rsqrt(_2911);
        _2969 = _2973;
    }
    float _2975 = _2969;
    if (_2915)
    {
        float _2977 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2955 = _2977;
    }
    float _2979 = _2955;
    float _2981 = fma(_1487, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2983 = _2979;
    if (!_2915)
    {
        _2941 = _2903;
    }
    float _2985 = _2941;
    float _2987 = _2947;
    float _2989 = _2985;
    if (_2915)
    {
        float _2991 = fma(_2947, _2979, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2983 = _2991;
    }
    float _2993 = _2983;
    float _2995 = _2993;
    if (!_2915)
    {
        _2987 = _2905;
    }
    float _2997 = _2987;
    float _2999 = _2997;
    float _3001 = _2961;
    if (_2915)
    {
        float _3003 = _2961 + (-1.0);
        _2971 = _3003;
    }
    float _3005 = _2971;
    float _3007 = _3005;
    if (_2915)
    {
        float _3009 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3007 = _3009;
    }
    float _3011 = _3007;
    float _3013 = _2975;
    if (_2915)
    {
        float _3015 = _2975 * _2993;
        _2759 = _3015;
    }
    float _3017 = _2759;
    if (!_2915)
    {
        _3013 = _2967;
    }
    float _3019 = _3013;
    float _3021 = _3019;
    if (_2915)
    {
        float _3023 = fma(_2967, _2961, _3011);
        _3021 = _3023;
    }
    float _3025 = _3021;
    if (!_2915)
    {
        _2995 = _2907;
    }
    float _3027 = _2995;
    float _3029 = _3027;
    if (_2915)
    {
        float _3031 = _2903 * _3017;
        _2989 = _3031;
    }
    float _3033 = _2989;
    if (_2915)
    {
        float _3035 = _2905 * _3017;
        _2999 = _3035;
    }
    float _3037 = _2999;
    float _3039 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2915)
    {
        _3001 = _2909;
    }
    float _3041 = _3001;
    float _3043 = _3041;
    if (_2915)
    {
        float _3045 = _3033 * _3033;
        _3029 = _3045;
    }
    float _3047 = _3029;
    if (_2915)
    {
        float _3049 = _3037 * _3037;
        _3043 = _3049;
    }
    float _3051 = _3043;
    float _3053 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3039);
    float _3055 = fma(_3025, _3025, _3047);
    float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3059 = fma(_2899, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3057);
    float _3061 = precise::clamp(_3059, 0.0, 1.0);
    float _3063 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3053);
    float _3065 = floor(_2981);
    float _3067 = _3055 + _3051;
    float _3069 = _3063 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3071 = -_3061;
    float _3073 = _3071 + 1.0;
    float _3075 = fma(_1503, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3077 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3079 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3081 = rsqrt(_3067);
    float _3083 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3085 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3087 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3077);
    float _3089 = -_3083;
    float _3091 = fma(_3089, _3079, 1.0);
    float _3093 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3095 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3085);
    float _3097 = abs(_3073);
    float _3099 = log2(_3097);
    float _3101 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3087);
    float _3103 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3093);
    float _3105 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3095);
    float _3107 = -_3065;
    float _3109 = _2981 + _3107;
    float _3111 = _3101 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3113 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3103);
    float _3115 = _3105 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3117 = _3081 * _3033;
    float _3119 = _3081 * _3025;
    float _3121 = _3081 * _3037;
    float _3123 = _3113 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3125 = _3117 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3127 = _3115 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3129 = floor(_3075);
    float _3131 = _3115 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3133 = -_3125;
    float _3135 = fma(_3119, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3133);
    float _3137 = fma(_3123, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3127);
    float _3139 = _3099 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3141 = fma(_3123, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3131);
    float _3143 = -_3121;
    float _3145 = fma(_3143, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3135);
    float _3147 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3137);
    float _3149 = log2(_3091);
    float _3151 = fma(_3145, -0.5, 0.5);
    float _3153 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3147);
    float _3155 = fma(_3145, 0.5, 0.5);
    float _3157 = exp2(_3139);
    float _3159 = _3115 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3161 = fma(_3155, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3163 = -_3129;
    float _3165 = _3075 + _3163;
    float _3167 = _3119 + 1.0;
    float _3169 = fma(_3123, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3159);
    float _3171 = fma(_3155, _3161, -0.212114393711090087890625);
    float _3173 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3141);
    float _3175 = 1.0 / _3153;
    float _3177 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3169);
    float _3179 = fma(_3155, _3171, 1.570728778839111328125);
    float _3181 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3177);
    float _3183 = sqrt(_3151);
    float _3185 = -_3119;
    float _3187 = fma(_3157, _3167, _3185);
    float _3189 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3173);
    float _3191 = _3149 * 0.693147182464599609375;
    float2 _8706 = float2(_3109, _3165);
    float _3193 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8706, float2(0.0), isnan(_8706)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8706, float2(0.0), isnan(_8706)), level(0.0)).x;
    float _3195 = fma(_3187, 0.5, 0.5);
    float _3197 = _3191 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3199 = _3181 * _3175;
    float _3201 = _3189 * _3175;
    float _3203 = fma(_3199, 0.5, 0.5);
    float _3205 = fma(_3201, -0.5, 0.5);
    float _3207 = _3183 * 0.636619746685028076171875;
    float3 _8736 = float3(_3203, _3205, _3197);
    float _3209 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8736, float3(0.0), isnan(_8736)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8736, float3(0.0), isnan(_8736)), level(0.0)).x;
    float _3211 = -_3179;
    float _3213 = fma(_3207, _3211, 1.0);
    float3 _8752 = float3(_3203, _3205, _3197);
    float4 _3216 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8752, float3(0.0), isnan(_8752)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8752, float3(0.0), isnan(_8752)), level(0.0)).xyzw;
    float _3218 = _3216.x;
    float _3220 = _3216.y;
    float _3222 = _3216.z;
    float _3224 = _3216.w;
    float2 _8768 = float2(_3213, _3195);
    float3 _3228 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8768, float2(0.0), isnan(_8768)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8768, float2(0.0), isnan(_8768)), level(0.0)).xyz;
    float _3230 = _3228.x;
    float _3232 = _3228.y;
    float _3234 = _3228.z;
    float _3236 = abs(_2765);
    float _3238 = log2(_3236);
    bool _3240 = _2055 != 0.0;
    bool _3242 = isnan(_2055);
    bool _3244 = _3240 || _3242;
    bool _3246 = isnan(0.0);
    bool _3248 = _3244 || _3246;
    out.m_67.x = _1463;
    out.m_67.y = _1465;
    out.m_67.z = _1467;
    out.m_67.w = _1461;
    float _3250 = _3099 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3252 = _2053 == 0.0;
    bool _3254 = !_3248;
    bool _3256 = _3252 && _3254;
    out.m_69.x = _1459;
    out.m_69.y = _1469;
    out.m_69.z = _1471;
    out.m_69.w = _1443;
    float _3258 = _3115 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3260 = _2057 == 0.0;
    bool _3262 = _3260 && _3256;
    float _3264 = exp2(_3250);
    float _3266 = fma(_3123, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3258);
    float _3268 = _3238 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3270 = _2049 * _2167;
    float _3272 = in.m_75.x;
    float _3274 = in.m_75.y;
    float _3276 = in.m_75.z;
    float _3278 = _2075 * _2169;
    float _3280 = _2049 * _2169;
    float _3282 = -_2061;
    float _3284 = fma(_3282, _2259, _3270);
    float _3286 = exp2(_3268);
    float _3288 = _2075 * _2167;
    float _3290 = _2119 * _2169;
    float _3292 = _2113 * _1785;
    float _3294 = -_2061;
    float _3296 = fma(_3294, _2261, _3280);
    float _3298 = fma(_2047, _2261, _3278);
    float _3300 = fma(_2047, _2259, _3288);
    float _3302 = fma(_2051, _2261, _3290);
    bool _3304 = _2765 <= 8000.0;
    bool _3306 = isnan(_2765);
    bool _3308 = _3304 || _3306;
    bool _3310 = isnan(8000.0);
    bool _3312 = _3308 || _3310;
    float _3314 = float(_3312);
    float _3316 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3266);
    float _3318 = _2075 * _2161;
    float _3320 = -_3264;
    float _3322 = _3320 + 1.0;
    float _3324 = _3292 + _3298;
    float _3326 = fma(_2047, _2263, _3318);
    float _3328 = fma(_3286, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3330 = precise::clamp(_3328, 0.0, 1.0);
    float _3332 = fma(_3330, -2.0, 3.0);
    float _3334 = _3330 * _3330;
    float _3336 = _3276;
    float _3338 = _3274;
    float _3340 = _3272;
    if (!_3262)
    {
        float _3342 = fma(_2057, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3276);
        _3336 = _3342;
    }
    float _3344 = _3336;
    float _3346 = _2045 * _1717;
    if (!_3262)
    {
        float _3348 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3274);
        _3338 = _3348;
    }
    float _3350 = _3338;
    float _3352 = _3334 * _3332;
    if (!_3262)
    {
        float _3354 = fma(_2053, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3272);
        _3340 = _3354;
    }
    float _3356 = _3340;
    float _3358 = _3346 + _3284;
    float _3360 = _2045 * _1785;
    float _3362 = -_3352;
    float _3364 = _3362 + 1.0;
    float _3366 = in.m_77.x;
    float _3368 = _2113 * _1717;
    float _3370 = _2077 * _1785;
    float _3372 = fma(_3364, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3352);
    float _3374 = _3358 * _3350;
    float _3376 = _3368 + _3300;
    float _3378 = _3370 + _3302;
    float _3380 = _2049 * _2161;
    float _3382 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3316);
    float _3384 = _3314 * _3372;
    float _3386 = _3360 + _3296;
    float _3388 = fma(_3376, _3356, _3374);
    float _3390 = _2045 * _1719;
    float _3392 = -_2061;
    float _3394 = fma(_3392, _2263, _3380);
    float _3396 = _3382 + _3153;
    float _3398 = _3384 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3400 = _3386 * _3350;
    float _3402 = _2119 * _2167;
    float _3404 = _2113 * _1719;
    float _3406 = _2119 * _2161;
    float _3408 = _3390 + _3394;
    float _3410 = _3396 * 0.5;
    float _3412 = _3322 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3414 = fma(_3324, _3356, _3400);
    float _3416 = _2077 * _1717;
    float _3418 = fma(_2051, _2259, _3402);
    float _3420 = _2077 * _1719;
    float _3422 = fma(_2051, _2263, _3406);
    float _3424 = _3404 + _3326;
    float _3426 = _3408 * _3350;
    float _3428 = _3416 + _3418;
    float _3430 = _3420 + _3422;
    out.m_79.z = _3410;
    out.m_79.w = _3153;
    float _3432 = fma(_3424, _3356, _3426);
    float _3434 = fma(_3428, _3344, _3388);
    float _3436 = fma(_3378, _3344, _3414);
    float _3438 = fma(_3430, _3344, _3432);
    bool _3440 = _2899 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3442 = isnan(_2899);
    bool _3444 = _3440 || _3442;
    bool _3446 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3448 = _3444 || _3446;
    out.gl_Position.x = _3181;
    out.gl_Position.y = _3189;
    out.gl_Position.z = _3382;
    out.gl_Position.w = _3153;
    float _3450 = -_3412;
    float _3452 = _3450 + 1.0;
    out.m_81.x = _3434;
    out.m_81.y = _3436;
    out.m_81.z = _3438;
    float _3454 = _3153;
    float _3456 = _3452;
    float _3458 = _3412;
    if (!_3448)
    {
        _3454 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3460 = _3454;
    float _3462 = -_3193;
    float _3464 = _3462 + 1.0;
    float _3466 = _3464 * _3398;
    float _3468 = precise::clamp(_3466, 0.0, 1.0);
    float _3470 = -_3468;
    float _3472 = fma(_3470, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3474 = _3472 * _3366;
    float _3476 = _3412 * _3209;
    float _3478 = _3366;
    float _3480 = _3460;
    float _3482 = _3460;
    if (!_3448)
    {
        _3478 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3484 = _3478;
    float _3486 = _3474 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3488 = _2819 * _2877;
    float _3490 = _3224 * _3476;
    float _3492 = _3224 * _3452;
    float _3494 = _3490;
    float _3496 = _3488;
    float _3498 = _3484;
    float _3500 = _3484;
    if (!_3448)
    {
        _3456 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3502 = _3456;
    out.m_83.x = _3486;
    float _3504 = _3234 * _3476;
    float _3506 = fma(_3230, _3490, _3218);
    float _3508 = fma(_3232, _3490, _3220);
    float _3510 = _3488 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3512 = fma(_3224, _3504, _3222);
    float _3514 = _3502;
    float _3516 = _3502;
    if (!_3448)
    {
        _3494 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3518 = _3494;
    float _3520 = _3518;
    float _3522 = _3518;
    if (!_3448)
    {
        _3458 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3524 = _3458;
    out.m_85.x = _3506;
    out.m_85.y = _3508;
    out.m_85.z = _3512;
    out.m_85.w = _3492;
    float _3526 = _3524;
    float _3528 = _3524;
    if (!_3448)
    {
        _3496 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3530 = _3496;
    bool _3532 = !_3448;
    float _3534 = _3530;
    float _3536 = _3530;
    if (!_3532)
    {
        bool _3538 = _2899 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3540 = isnan(_2899);
        bool _3542 = _3538 || _3540;
        bool _3544 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3546 = _3542 || _3544;
        if (!_3546)
        {
            float _3548 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3550 = _2899 + _3548;
            float _3552 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3554 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3552;
            float _3556 = 1.0 / _3554;
            float _3558 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3560 = _3558 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3562 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3564 = _3562 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3566 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3568 = _3566 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3570 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3572 = _3570 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3574 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3576 = _3574 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3578 = _3550 * _3556;
            float _3580 = precise::clamp(_3578, 0.0, 1.0);
            float _3582 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3584 = _3582 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3586 = fma(_3580, _3560, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3588 = fma(_3580, _3584, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3590 = fma(_3580, _3564, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3592 = fma(_3580, _3568, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3594 = fma(_3580, _3572, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3596 = fma(_3580, _3576, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3522 = _3588;
            _3528 = _3594;
            _3500 = _3586;
            _3516 = _3592;
            _3482 = _3590;
            _3536 = _3596;
            _3598 = true;
        }
        else
        {
            bool _3600 = _2899 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3602 = isnan(_2899);
            bool _3604 = _3600 || _3602;
            bool _3606 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3608 = _3604 || _3606;
            if (!_3608)
            {
                _3498 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3610 = _3498;
            _3500 = _3610;
            if (!_3608)
            {
                _3520 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3612 = _3520;
            _3522 = _3612;
            if (!_3608)
            {
                _3480 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3614 = _3480;
            _3482 = _3614;
            if (!_3608)
            {
                _3514 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3616 = _3514;
            _3516 = _3616;
            if (!_3608)
            {
                _3526 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3618 = _3526;
            _3528 = _3618;
            if (!_3608)
            {
                _3534 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3620 = _3534;
            bool _3622 = !_3608;
            _3536 = _3620;
            if (!_3622)
            {
                bool _3624 = _2899 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3626 = isnan(_2899);
                bool _3628 = _3624 || _3626;
                bool _3630 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3632 = _3628 || _3630;
                if (!_3632)
                {
                    float _3634 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3636 = _2899 + _3634;
                    float _3638 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3640 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3638;
                    float _3642 = 1.0 / _3640;
                    float _3644 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3646 = _3644 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3648 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3650 = _3648 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3652 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3654 = _3652 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3656 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3658 = _3656 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3660 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3662 = _3660 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3664 = _3636 * _3642;
                    float _3666 = precise::clamp(_3664, 0.0, 1.0);
                    float _3668 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3670 = _3668 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3672 = fma(_3666, _3646, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3674 = fma(_3666, _3670, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3676 = fma(_3666, _3650, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3678 = fma(_3666, _3654, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3680 = fma(_3666, _3658, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3682 = fma(_3666, _3662, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3522 = _3674;
                    _3528 = _3680;
                    _3500 = _3672;
                    _3516 = _3678;
                    _3482 = _3676;
                    _3536 = _3682;
                    _3598 = true;
                }
                else
                {
                    _3522 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3528 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3500 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3516 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3482 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3536 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3598 = false;
    float _3684 = _3522;
    float _3686 = _3528;
    float _3688 = _3500;
    float _3690 = _3516;
    float _3692 = _3482;
    float _3694 = _3536;
    float _3696 = fma(_3436, -0.5, 0.5);
    float _3698 = precise::clamp(_3696, 0.0, 1.0);
    float _3700 = -_3684;
    float _3702 = _3700 + _3686;
    float _3704 = -_3688;
    float _3706 = _3704 + _3690;
    out.m_87.x = 0.0;
    float _3708 = fma(_3698, _3702, _3684);
    float _3710 = -_3692;
    float _3712 = _3710 + _3694;
    float _3714 = fma(_3698, _3706, _3688);
    float _3716 = _3708 * 0.586610972881317138671875;
    bool _3718 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3720 = fma(_3698, _3712, _3692);
    float _3722 = _3510 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3724 = fma(_3714, 0.298911988735198974609375, _3716);
    bool _3726 = _2819 > 0.0;
    bool _3728 = isnan(_2819);
    bool _3730 = _3726 || _3728;
    bool _3732 = isnan(0.0);
    bool _3734 = _3730 || _3732;
    float _3736 = fma(_3720, 0.114477999508380889892578125, _3724);
    out.m_49.x = _3722;
    bool _3738 = _2877 <= 0.0;
    bool _3740 = !_3734;
    bool _3742 = _3738 || _3740;
    float _3744 = -_3736;
    float _3746 = _3714 + _3744;
    float _3748 = -_3736;
    float _3750 = _3708 + _3748;
    float _3752 = -_3736;
    float _3754 = _3720 + _3752;
    float _3756 = fma(_3746, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3736);
    float _3758 = fma(_3750, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3736);
    float _3760 = fma(_3754, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3736);
    bool _3762 = !_3718;
    if (!_3762)
    {
        float _3764 = -_2749;
        float _3766 = _3764 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3768 = -_2751;
        float _3770 = _3768 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3772 = -_2753;
        float _3774 = _3772 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3776 = _3766 * _3766;
        float _3778 = fma(_3770, _3770, _3776);
        float _3780 = fma(_3774, _3774, _3778);
        float _3782 = sqrt(_3780);
        float _3784 = rsqrt(_3780);
        float _3786 = -_3782;
        float _3788 = _3786 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3790 = _3788 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3792 = precise::clamp(_3790, 0.0, 1.0);
        float _3794 = _3770 * _3784;
        float _3796 = _3766 * _3784;
        float _3798 = abs(_3792);
        float _3800 = log2(_3798);
        float _3802 = _3774 * _3784;
        float _3804 = _3794 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3806 = _3436 * _3796;
        float _3808 = -_3796;
        float _3810 = -_3804;
        float _3812 = fma(_3808, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3810);
        float _3814 = fma(_3434, _3794, _3806);
        float _3816 = -_3802;
        float _3818 = fma(_3816, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3812);
        float _3820 = fma(_3438, _3802, _3814);
        float _3822 = precise::clamp(_3820, 0.0, 1.0);
        float _3824 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3826 = _3818 + _3824;
        float _3828 = _3800 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3830 = _3826 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3832 = precise::clamp(_3830, 0.0, 1.0);
        float _3834 = exp2(_3828);
        float _3836 = _3834 * _3832;
        float _3838 = _3822 * _3836;
        float _3840 = _3838 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3842 = _3838 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3844 = _3838 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3840;
        out.m_87.y = _3842;
        out.m_87.z = _3844;
    }
    out.m_89.x = _3756;
    out.m_89.y = _3758;
    out.m_89.z = _3760;
    if (!_3742)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3846 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3846;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3598 = false;
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
        float _3904 = as_type<float>(_124);
        out.gl_Position.z = _3904;
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
        float _3968 = as_type<float>(_158);
        out.gl_Position.z = _3968;
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
    float _452 = in.m_59.x;
    float _454 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _456 = int(_454);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _462 = float(_446);
    float _464 = 1.0 / _460;
    float _466 = float(uint(_456));
    float _468 = 1.0 / _462;
    int _470 = ~_456;
    int _472 = _470 + 1;
    int _474 = ~_456;
    int _476 = _474 + 1;
    float _478 = 1.0 / _466;
    float _480 = _468 * _134;
    float _482 = trunc(_480);
    int _484 = int(_482);
    int _486 = as_type<int>(_478) + (-2);
    float _488 = float(uint(_484));
    float _490 = as_type<float>(_486) * _488;
    float _492 = trunc(_490);
    float _494 = precise::max(_492, 0.0);
    uint _497 = uint(_494);
    int _499 = ~_456;
    int _501 = _499 + 1;
    int _503 = _472 * int(_497);
    int _505 = _503 + _484;
    float _507 = float(uint(_505));
    float _509 = as_type<float>(_486) * _507;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _513 = _511 != 0;
    float _515 = trunc(_509);
    float _517 = precise::max(_515, 0.0);
    uint _519 = uint(_517);
    bool _521 = !_513;
    float _523 = _521 ? 7.345489978790283203125 : 1.0;
    float _525 = _523 * _448;
    float _527 = floor(_525);
    int _529 = int(_497) + int(_519);
    float _531 = float(_456);
    float _533 = float(_484);
    int _535 = _501 * _529;
    int _537 = _535 + _484;
    bool _539 = _533 >= _531;
    bool _541 = isnan(_533);
    bool _543 = _539 || _541;
    bool _545 = isnan(_531);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    bool _551 = uint(_537) >= uint(_456);
    float _553 = trunc(_549);
    int _555 = int(_553);
    bool _557 = !_551;
    int _559 = _557 ? 0 : (-1);
    bool _561 = _456 == 0;
    int _563 = ~_529;
    int _565 = _563 + _559;
    int _567 = _565 + 1;
    int _569 = _456 * _567;
    int _571 = _569 + _484;
    float _573 = -_527;
    float _575 = _525 + _573;
    bool _577 = !_561;
    int _579 = _577 ? _571 : (-1);
    float _581 = _575 * _531;
    int _583 = ~_555;
    int _585 = _583 + 1;
    int _587 = _585 + 1;
    float _589 = _531 * _134;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _593 = _591 != 0;
    float _595 = trunc(_581);
    int _597 = int(_595);
    int _599 = _579 * _587;
    int _601 = _456 + (-1);
    float _603 = _589 * _166;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _607 = _605 != 0;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _611 = _609 != 0;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _615 = _613 != 0;
    bool _617 = !_593;
    int _619 = _617 ? 0 : 1;
    int _621 = _555 * _601;
    int _623 = _621 + _599;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _627 = _625 != 0;
    float _629 = trunc(_603);
    int _631 = int(_629);
    bool _633 = !_611;
    int _635 = _633 ? 0 : 1;
    bool _637 = !_607;
    int _639 = _637 ? 0 : 1;
    int _641 = abs(_635);
    int _643 = abs(_619);
    bool _645 = !_615;
    int _647 = _645 ? 0 : 1;
    int _649 = abs(_639);
    bool _651 = !_627;
    int _653 = _651 ? 0 : 1;
    int _655 = _623 * _641;
    int _657 = abs(_647);
    int _659 = _597 * _643;
    int _661 = _659 + _484;
    int _663 = abs(_653);
    int _665 = _631 * _649;
    int _667 = _665 + _655;
    float _669 = in.m_61.x;
    int _671 = ~_456;
    int _673 = _671 + 1;
    int _675 = _661 * _657;
    int _677 = _675 + _667;
    int _679 = ~_456;
    int _681 = _679 + 1;
    float _683 = float(uint(_661));
    int _685 = _597 * _663;
    int _687 = _685 + _677;
    int _689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _691 = _689 != 0;
    float _693 = in.m_61.y;
    float _695 = as_type<float>(_486) * _683;
    float _697 = float(uint(_687));
    float _699 = as_type<float>(_486) * _697;
    float _701 = trunc(_699);
    float _703 = precise::max(_701, 0.0);
    uint _705 = uint(_703);
    out.m_63.x = _669;
    out.m_63.y = _693;
    int _707 = _673 * int(_705);
    int _709 = _707 + _687;
    float _711 = float(uint(_709));
    float _713 = as_type<float>(_486) * _711;
    float _715 = trunc(_713);
    float _717 = precise::max(_715, 0.0);
    uint _719 = uint(_717);
    int _721 = int(_705) + int(_719);
    int _723 = _681 * _721;
    int _725 = _723 + _687;
    float _727 = trunc(_695);
    float _729 = precise::max(_727, 0.0);
    uint _731 = uint(_729);
    bool _733 = uint(_725) >= uint(_456);
    bool _735 = !_733;
    int _737 = _735 ? 0 : (-1);
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _741 = _739 != 0;
    int _743 = ~_721;
    int _745 = _743 + _737;
    int _747 = _745 + 1;
    int _749 = ~_456;
    int _751 = _749 + 1;
    int _753 = _456 * _747;
    int _755 = _753 + _687;
    int _757 = _751 * int(_731);
    int _759 = _757 + _661;
    bool _761 = !_561;
    int _763 = _761 ? _755 : (-1);
    float _765 = 0.0;
    float _767 = _452;
    if (_741)
    {
        float _769 = in.m_55.x;
        _765 = _769;
    }
    float _771 = _765;
    float _773 = float(uint(_759));
    int _775 = _763 >> 31;
    int _777 = _763 & 3;
    bool _779 = _777 != 0;
    float _781 = as_type<float>(_486) * _773;
    int _783 = _775 & 3;
    float _785 = trunc(_781);
    float _787 = precise::max(_785, 0.0);
    uint _789 = uint(_787);
    int _791 = _763 + _783;
    int _793 = _791 >> 2;
    int _795 = _793 << 4;
    int _797 = _795 + 368;
    uint _799 = uint(int(uint(_797) >> uint(2)));
    uint _801 = uint(int(uint(int(_799)) >> uint(2)));
    int _803 = int(_799) & 3;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[int(_801)][_803];
    int _807 = int(_799) + 1;
    uint _809 = uint(int(uint(_807) >> uint(2)));
    int _811 = _807 & 3;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[int(_809)][_811];
    int _815 = int(_731) + int(_789);
    int _817 = _763 & 3;
    bool _819 = _817 != 0;
    int _821 = _779 ? 0 : 1;
    int _823 = _797 + 8;
    uint _825 = uint(int(uint(_823) >> uint(2)));
    uint _827 = uint(int(uint(int(_825)) >> uint(2)));
    int _829 = int(_825) & 3;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[int(_827)][_829];
    int _833 = int(_825) + 1;
    uint _835 = uint(int(uint(_833) >> uint(2)));
    int _837 = _833 & 3;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[int(_835)][_837];
    bool _841 = uint(_817) > 1u;
    int _843 = _476 * _815;
    int _845 = _843 + _661;
    int _847 = ~_821;
    int _849 = _847 + 1;
    int _851 = _849 + 1;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _855 = _853 != 0;
    bool _857 = uint(_845) >= uint(_456);
    float _859 = in.m_61.z;
    bool _861 = !_819;
    int _863 = _861 ? 0 : 1;
    bool _865 = !_857;
    int _867 = _865 ? 0 : (-1);
    bool _869 = uint(_817) >= 2u;
    int _871 = _851;
    if (!_841)
    {
        int _873 = ~_821;
        int _875 = _873 + 1;
        _871 = _875;
    }
    int _877 = _871;
    bool _879 = _817 != 3;
    int _881 = ~_815;
    int _883 = _881 + _867;
    int _885 = _883 + 1;
    int _887 = abs(_877);
    int _889 = abs(_863);
    int _891 = _456 * _885;
    int _893 = _891 + _661;
    float _895 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _897 = int(_895);
    int _899 = _869 ? 0 : 1;
    float _901 = in.m_61.w;
    bool _903 = _817 != 3;
    int _905 = ~_887;
    int _907 = _905 + 1;
    int _909 = _907 + 1;
    out.m_63.z = _859;
    int _911 = ~_899;
    int _913 = _911 + 1;
    int _915 = _913 + 1;
    int _917 = _915;
    if (_879)
    {
        int _919 = ~_899;
        int _921 = _919 + 1;
        _917 = _921;
    }
    int _923 = _917;
    int _925 = ~_889;
    int _927 = _925 + 1;
    int _929 = _927 + 1;
    int _931 = abs(_923);
    int _933 = _909 * as_type<int>(_813);
    bool _935 = !_903;
    int _937 = _935 ? 0 : (-1);
    int _939 = ~_897;
    int _941 = _939 + 1;
    int _943 = _929 * as_type<int>(_805);
    int _945 = _943 + _933;
    int _947 = abs(_937);
    int _949 = ~_931;
    int _951 = _949 + 1;
    int _953 = _951 + 1;
    float _955 = in.m_59.y;
    bool _957 = !_691;
    int _959 = _957 ? 0 : 1;
    int _961 = abs(_897);
    int _963 = _953 * as_type<int>(_831);
    int _965 = _963 + _945;
    int _967 = abs(_959);
    out.m_63.w = _901;
    float _969 = float(uint(_897));
    int _971 = ~_947;
    int _973 = _971 + 1;
    int _975 = _973 + 1;
    float _977 = float(uint(_961));
    float _979 = 1.0 / _969;
    int _981 = ~_967;
    int _983 = _981 + 1;
    int _985 = _983 + 1;
    int _987 = _975 * as_type<int>(_839);
    int _989 = _987 + _965;
    bool _991 = !_561;
    int _993 = _991 ? _893 : (-1);
    int _995 = _989 * _985;
    bool _997 = _450 > 0.5;
    float _999 = 1.0 / _977;
    float _1001 = in.m_46.x;
    float _1003 = in.m_46.y;
    float _1005 = in.m_46.z;
    int _1007 = _993 * _967;
    int _1009 = _1007 + _995;
    float _1011 = -_955;
    float _1013 = _1011 + 1.0;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1019 = float(uint(_1009));
    float _1021 = 1.0 / _1017;
    int _1023 = as_type<int>(_979) + (-2);
    int _1025 = abs(_1009);
    float _1027 = _955;
    if (_855)
    {
        float _1029 = _997 ? _1013 : _955;
        _1027 = _1029;
    }
    float _1031 = _1027;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1035 = float(uint(_1025));
    float _1037 = as_type<float>(_1023) * _1019;
    int _1039 = as_type<int>(_999) + (-2);
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1043 = _450 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1045 = _448 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1047 = ~_961;
    int _1049 = _1047 + 1;
    float _1051 = as_type<float>(_1039) * _1035;
    float _1053 = trunc(_1037);
    float _1055 = precise::max(_1053, 0.0);
    uint _1057 = uint(_1055);
    float _1059 = fma(_1043, -2.0, _1041);
    float _1061 = _1003 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1063 = _1003 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1065 = -_1033;
    float _1067 = fma(_1045, 2.0, _1065);
    float _1069 = _1003 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1071;
    float _1075 = fma(_1001, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1061);
    float _1077 = trunc(_1051);
    float _1079 = precise::max(_1077, 0.0);
    uint _1081 = uint(_1079);
    float _1083 = fma(_1001, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1063);
    float _1085 = fma(_1001, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1069);
    float _1087 = _1073 * _1021;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1091 = _1089 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1093 = _771 > 0.5;
    bool _1095 = _1093 && _741;
    float _1097 = fma(_1005, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1075);
    int _1099 = _941 * int(_1057);
    int _1101 = _1099 + _1009;
    float _1103 = _1091 * _464;
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1107 = _1105 != 0;
    int _1109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1111 = _1109 != 0;
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1115 = _1113 != 0;
    float _1117 = float(uint(_1101));
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1121 = _1119 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1123 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1125 = isnan(_442);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1131 = _1127 || _1129;
    float _1133 = float(_1131);
    int _1135 = _1049 * int(_1081);
    int _1137 = _1135 + _1025;
    float _1139 = 1.0 / _1121;
    float _1141 = as_type<float>(_1023) * _1117;
    bool _1143 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1145 = isnan(_442);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1151 = _1147 || _1149;
    float _1153 = float(_1151);
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1157 = _442 + _1155;
    float _1159 = float(uint(_1137));
    float _1161 = fma(_1087, _1157, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1163 = trunc(_1141);
    float _1165 = precise::max(_1163, 0.0);
    uint _1167 = uint(_1165);
    float _1169 = as_type<float>(_1039) * _1159;
    bool _1171 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1173 = isnan(_442);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = -_1133;
    float _1185 = _1183 + 1.0;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1187;
    int _1191 = ~_897;
    int _1193 = _1191 + 1;
    float _1195 = -_1181;
    float _1197 = _1195 + 1.0;
    float _1199 = trunc(_1169);
    float _1201 = precise::max(_1199, 0.0);
    uint _1203 = uint(_1201);
    float _1205 = _1181 * _1185;
    bool _1207 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1209 = isnan(_442);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = _1153 * _1197;
    float _1221 = -_1153;
    float _1223 = _1221 + 1.0;
    float _1225 = _1189 * _1139;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1229 = _442 + _1227;
    float _1231 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1233 = _442 + _1231;
    float _1235 = _1217 * _1223;
    int _1237 = int(_1057) + int(_1167);
    float _1239 = fma(_1103, _1229, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1241 = ~_961;
    int _1243 = _1241 + 1;
    float _1245 = _1161 * _1235;
    float _1247 = -_1217;
    float _1249 = _1247 + 1.0;
    float _1251 = fma(_1225, _1233, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1253 = _1233;
    float _1255 = _1251;
    if (!_741)
    {
        _1253 = _452;
    }
    float _1257 = _1253;
    float _1259 = _1257;
    if (_1095)
    {
        float _1261 = -_452;
        float _1263 = _1261 + 1.0;
        _767 = _1263;
    }
    float _1265 = _767;
    int _1267 = int(_1081) + int(_1203);
    int _1269 = _1193 * _1237;
    int _1271 = _1269 + _1009;
    float _1273 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1245);
    if (_741)
    {
        _1259 = _1265;
    }
    float _1275 = _1259;
    bool _1277 = uint(_1271) >= uint(_897);
    int _1279 = _1243 * _1267;
    int _1281 = _1279 + _1025;
    float _1283 = fma(_1005, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1083);
    float _1285 = fma(_1005, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1085);
    bool _1287 = !_1277;
    int _1289 = _1287 ? 0 : (-1);
    float _1291 = fma(_1239, _1219, _1273);
    float _1293 = _1283 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1295 = uint(_1281) >= uint(_961);
    float _1297 = _1285 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1299 = ~_1237;
    int _1301 = _1299 + _1289;
    int _1303 = _1301 + 1;
    float _1305 = _1097 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1309 = _1293 + _1307;
    bool _1311 = !_1295;
    int _1313 = _1311 ? 0 : (-1);
    float _1315 = fma(_1251, _1205, _1291);
    int _1317 = _1009 ^ _897;
    float _1319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1323 = _1305 + _1321;
    float _1325 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1327 = ~_1313;
    int _1329 = _1267 + _1327;
    int _1331 = _1329 + 1;
    float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1335 = _1297 + _1333;
    bool _1337 = _897 == 0;
    bool _1339 = _897 == 0;
    int _1341 = _897 * _1303;
    int _1343 = _1341 + _1009;
    uint _1345 = uint(int(uint(_1317) >> uint(31)));
    float _1347 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1325);
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1351 = ~int(_1345);
    int _1353 = _1351 + 1;
    float _1355 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1347);
    bool _1357 = !_1337;
    int _1359 = _1357 ? _1343 : (-1);
    float _1361 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1363 = _1331 ^ _1353;
    bool _1365 = _1355 >= 0.0;
    float _1367 = fma(_1361, _1275, -0.5);
    int _1369 = ~_1353;
    int _1371 = _1369 + _1363;
    int _1373 = _1371 + 1;
    float _1375 = float(_1359);
    float _1377 = -_134;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1067);
    bool _1381 = !_1339;
    int _1383 = _1381 ? _1373 : (-1);
    float _1385 = fma(_1361, _1375, _1379);
    float _1387 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1389 = float(_1383);
    float _1391 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1059);
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1395 = fma(_1387, _1031, -0.5);
    float _1397 = -_1391;
    float _1399 = fma(_1387, _1389, _1397);
    float _1401 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1315);
    float _1403 = _1309 * _1309;
    float _1405 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1393);
    float _1407 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1409 = _1383;
    if (_1365)
    {
        _1255 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1411 = _1255;
    float _1413 = fma(_1323, _1323, _1403);
    float _1415 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1405);
    float _1417 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1407);
    float _1419 = fma(_1335, _1335, _1413);
    float _1421 = fma(_1415, _1395, _1399);
    if (_1365)
    {
        float _1423 = _1411 * 5.0;
        _1409 = as_type<int>(_1423);
    }
    int _1425 = _1409;
    float _1427 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1417);
    float _1429 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1431 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1433 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1435 = rsqrt(_1419);
    float _1437 = fma(_1427, _1367, _1385);
    if (_1365)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5885 = as_type<float>(_1425);
        out.gl_Position.z = _5885;
    }
    float _1439 = _1437 + 0.5;
    float _1441 = _1421 + 0.5;
    float _1443 = _1401 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_1365)
    {
        out.m_49.x = 0.0;
    }
    bool _1445 = !_1115;
    int _1447 = _1445 ? 0 : 1;
    bool _1449 = !_1107;
    int _1451 = _1449 ? 0 : 1;
    out.m_65.x = _1439;
    out.m_65.y = _1441;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1459 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1463 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1465 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1467 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1469 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1471 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1473 = !_1111;
    int _1475 = _1473 ? 0 : 1;
    float _1477 = _1309 * _1435;
    out.m_67.x = _1463;
    out.m_67.y = _1465;
    out.m_67.z = _1467;
    out.m_67.w = _1461;
    float _1479 = _1323 * _1435;
    out.m_69.x = _1459;
    out.m_69.y = _1469;
    out.m_69.z = _1471;
    out.m_69.w = _1443;
    if (_1365)
    {
        return out;
    }
    float _1481 = -_1477;
    float _1483 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1293);
    float _1485 = -_1479;
    float _1487 = fma(_1485, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1305);
    float _1489 = _1335 * _1435;
    float _1491 = in.m_55.z;
    float _1493 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1495 = _1483 + _1493;
    float _1497 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1499 = _1487 + _1497;
    float _1501 = -_1489;
    float _1503 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1297);
    float _1505 = _448 * 2.0;
    float _1507 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1509 = _450 * 2.0;
    float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1513 = _1503 + _1511;
    float _1515 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1507);
    float _1517 = floor(_1505);
    bool _1519 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1521 = isnan(0.0);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1527 = _1523 || _1525;
    float _1529 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1515);
    float _1531 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1533 = log2(_1531);
    bool _1535 = _1529 >= 0.0;
    float _1537 = _450 + _448;
    float _1539 = _1537 + (-1.0);
    float _1541 = _450 + _1491;
    float _1543 = floor(_1509);
    bool _1545 = _1517 > 0.0;
    float _1547 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1549 = _1541 + (-1.0);
    bool _1551 = _1517 >= 0.0;
    bool _1553 = isnan(_1517);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan(0.0);
    bool _1559 = _1555 || _1557;
    float _1561 = _1491 * 2.0;
    float _1563 = 0.0;
    int _1565 = as_type<int>(_1509);
    float _1567 = _1489;
    float _1569 = _1513;
    if (_1535)
    {
        _1563 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1571 = _1563;
    float _1573 = _1533 * _134;
    float _1575 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_1535)
    {
        out.m_49.x = 0.0;
    }
    if (_1535)
    {
        float _1577 = _1571 * 5.0;
        _1565 = as_type<int>(_1577);
    }
    int _1579 = _1565;
    float _1581 = floor(_1561);
    bool _1583 = _1543 > 0.0;
    if (_1535)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6149 = as_type<float>(_1579);
        out.gl_Position.z = _6149;
    }
    bool _1585 = _1543 >= 0.0;
    bool _1587 = isnan(_1543);
    bool _1589 = _1585 || _1587;
    bool _1591 = isnan(0.0);
    bool _1593 = _1589 || _1591;
    float _1595 = exp2(_1573);
    bool _1597 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1599 = isnan(1.0);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1605 = _1601 || _1603;
    float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1609 = 1.0 + _1607;
    if (_1535)
    {
        return out;
    }
    float _1611 = -_1293;
    float _1613 = _1611 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1615 = -_1305;
    float _1617 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1619 = -_1297;
    float _1621 = _1619 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1623 = 1.0 / _1609;
    float _1625 = _1613 * _1613;
    float _1627 = -_1595;
    float _1629 = _1627 + 1.0;
    int _1631 = _1559 ? 0 : 1;
    float _1633 = _450 + (-0.5);
    float _1635 = fma(_1617, _1617, _1625);
    bool _1637 = _1581 > 0.0;
    float _1639 = -_1477;
    float _1641 = fma(_1639, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _1643 = _1527 ? _1629 : 0.0;
    float _1645 = fma(_1621, _1621, _1635);
    bool _1647 = _1581 >= 0.0;
    bool _1649 = isnan(_1581);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan(0.0);
    bool _1655 = _1651 || _1653;
    float _1657 = -_1479;
    float _1659 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1323);
    int _1661 = ~_1631;
    int _1663 = _1661 + 1;
    int _1665 = _1663 + 1;
    float _1667 = rsqrt(_1645);
    int _1669 = _1665;
    if (!_1545)
    {
        int _1671 = ~_1631;
        int _1673 = _1671 + 1;
        _1669 = _1673;
    }
    int _1675 = _1669;
    float _1677 = _1641 * _1641;
    int _1679 = abs(_1475);
    if (_1605)
    {
        float _1681 = _1643 * _1623;
        _152 = _1681;
    }
    float _1683 = _152;
    int _1685 = abs(_1451);
    float _1687 = fma(_1659, _1659, _1677);
    int _1689 = _1655 ? 0 : 1;
    float _1691 = -_1489;
    float _1693 = fma(_1691, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1335);
    int _1695 = abs(_1447);
    float _1697 = sqrt(_1645);
    float _1699 = float(_1675);
    float _1701 = fma(_1693, _1693, _1687);
    int _1703 = ~_1689;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    int _1709 = _1707;
    if (!_1637)
    {
        int _1711 = ~_1689;
        int _1713 = _1711 + 1;
        _1709 = _1713;
    }
    int _1715 = _1709;
    float _1717 = _1617 * _1667;
    float _1719 = _1621 * _1667;
    int _1721 = _1593 ? 0 : 1;
    float _1723 = _1717 * _1717;
    float _1725 = float(_1679);
    float _1727 = float(_1685);
    float _1729 = fma(_1719, _1719, _1723);
    float _1731 = float(_1715);
    float _1733 = _1725 * _1699;
    float _1735 = rsqrt(_1729);
    int _1737 = ~_1721;
    int _1739 = _1737 + 1;
    int _1741 = _1739 + 1;
    float _1743 = _1727 * _1731;
    int _1745 = _1741;
    if (!_1583)
    {
        int _1747 = ~_1721;
        int _1749 = _1747 + 1;
        _1745 = _1749;
    }
    int _1751 = _1745;
    float _1753 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1755 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1757 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1759 = float(_1751);
    float _1761 = float(_1695);
    float _1763 = -_1757;
    float _1765 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1763);
    float _1767 = -_1753;
    float _1769 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1767);
    float _1771 = _1761 * _1759;
    float _1773 = -_1755;
    float _1775 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1773);
    float _1777 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1779 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1781 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1783 = _1719 * _1735;
    float _1785 = _1613 * _1667;
    float _1787 = in.m_71.x;
    float _1789 = in.m_71.y;
    float _1791 = in.m_71.z;
    float _1793 = -_1779;
    float _1795 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1793);
    float _1797 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1799 = -_1781;
    float _1801 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1799);
    float _1803 = _1717 * _1735;
    float _1805 = -_1783;
    float _1807 = _1719 * _1805;
    float _1809 = -_1797;
    float _1811 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1809);
    float _1813 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1801);
    float _1815 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1817 = -_1807;
    float _1819 = fma(_1717, _1803, _1817);
    float _1821 = -_1777;
    float _1823 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1821);
    float _1825 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1827 = _1785 * _1803;
    float _1829 = _1819 * _1819;
    float _1831 = -_1815;
    float _1833 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1831);
    float _1835 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1837 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1811);
    float _1839 = fma(_1827, _1827, _1829);
    float _1841 = -_1783;
    float _1843 = _1785 * _1841;
    float _1845 = -_1835;
    float _1847 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1845);
    float _1849 = _1795 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1851 = -_1825;
    float _1853 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1851);
    float _1855 = _1743 * (-2.0);
    float _1857 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1847);
    float _1859 = -_1849;
    float _1861 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1859);
    float _1863 = fma(_1843, _1843, _1839);
    float _1865 = fma(_1547, _1855, _1547);
    float _1867 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1853);
    float _1869 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1861);
    float _1871 = fma(_1855, _1787, _1787);
    float _1873 = _1733 * (-2.0);
    float _1875 = _448 + (-0.5);
    float _1877 = rsqrt(_1863);
    float _1879 = -_1869;
    float _1881 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1867);
    float _1883 = fma(_1873, _1789, _1789);
    float _1885 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1871);
    float _1887 = fma(_1575, _1873, _1575);
    float _1889 = _1771 * (-2.0);
    float _1891 = fma(_1633, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1883);
    float _1893 = fma(_1865, _1683, _1885);
    float _1895 = 1.0 / _1881;
    float _1897 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1899 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1901 = fma(_1887, _1683, _1891);
    float _1903 = fma(_1889, _1791, _1791);
    float _1905 = -_1897;
    float _1907 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1905);
    float _1909 = -_1899;
    float _1911 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1909);
    float _1913 = _1893 * 0.15915493667125701904296875;
    float _1915 = _1819 * _1877;
    float _1917 = precise::clamp(_1915, 0.0, 1.0);
    float _1919 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1921 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1911);
    float _1923 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1907);
    float _1925 = -_1917;
    float _1927 = _1925 + 1.0;
    float _1929 = -_1919;
    float _1931 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1929);
    float _1933 = _1901 * 0.15915493667125701904296875;
    float _1935 = _1491 + _448;
    float _1937 = fma(_1921, _1895, -1.0);
    float _1939 = _1927 * _1895;
    float _1941 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1931);
    float _1943 = fma(_1927, _1937, 1.0);
    float _1945 = _1923 * _1939;
    float _1947 = _1941 * _1939;
    float _1949 = _1935 + (-1.0);
    float _1951 = _1943 * _1943;
    float _1953 = _1491 + (-0.5);
    float _1955 = _1933 * 6.283185482025146484375;
    float _1957 = sin(_1955);
    float _1959 = fma(_1949, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1961 = fma(_1945, _1945, _1951);
    float _1963 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1903);
    float _1965 = fma(_1959, _1889, _1959);
    float _1967 = fma(_1947, _1947, _1961);
    float _1969 = _1933 * 6.283185482025146484375;
    float _1971 = cos(_1969);
    float _1973 = fma(_1965, _1683, _1963);
    float _1975 = abs(_1697);
    float _1977 = precise::max(0.0, _1975);
    float _1979 = _1973 * 0.15915493667125701904296875;
    float _1981 = rsqrt(_1967);
    float _1983 = precise::min(_1977, 40.0);
    float _1985 = _1913 * 6.283185482025146484375;
    float _1987 = sin(_1985);
    float _1989 = _1947 * _1981;
    float _1991 = _1943 * _1981;
    float _1993 = _1945 * _1981;
    float _1995 = _1913 * 6.283185482025146484375;
    float _1997 = cos(_1995);
    float _1999 = -_1989;
    float _2001 = _1717 * _1999;
    float _2003 = _1719 * _1991;
    float _2005 = -_1993;
    float _2007 = _1785 * _2005;
    float _2009 = -_1993;
    float _2011 = -_2001;
    float _2013 = fma(_1719, _2009, _2011);
    float _2015 = -_1989;
    float _2017 = -_2003;
    float _2019 = fma(_1785, _2015, _2017);
    float _2021 = -_2007;
    float _2023 = fma(_1717, _1991, _2021);
    float _2025 = _1979 * 6.283185482025146484375;
    float _2027 = cos(_2025);
    float _2029 = _2013 * _2013;
    float _2031 = _1987 * _1957;
    float _2033 = _1987 * _1971;
    float _2035 = fma(_2019, _2019, _2029);
    float _2037 = sqrt(_1701);
    float _2039 = fma(_2023, _2023, _2035);
    float _2041 = _1997 * _1971;
    float _2043 = rsqrt(_2039);
    float _2045 = _1987 * _2027;
    float _2047 = _1971 * _2027;
    float _2049 = _1997 * _2027;
    float _2051 = _1957 * _2027;
    float _2053 = in.m_73.x;
    float _2055 = in.m_73.y;
    float _2057 = in.m_73.z;
    float _2059 = _1979 * 6.283185482025146484375;
    float _2061 = sin(_2059);
    float _2063 = _2019 * _2043;
    float _2065 = _1997 * _1957;
    float _2067 = _1435 * _2037;
    float _2069 = _2023 * _2043;
    float _2071 = _1719 * _2063;
    float _2073 = _380 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2075 = fma(_2061, _2041, _2031);
    float _2077 = fma(_2061, _2031, _2041);
    float _2079 = _2013 * _2043;
    float _2081 = _1785 * _2069;
    float _2083 = -_2071;
    float _2085 = fma(_1717, _2069, _2083);
    float _2087 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2089 = _1717 * _2079;
    float _2091 = -_2081;
    float _2093 = fma(_1719, _2079, _2091);
    float _2095 = _2085 * _2085;
    float _2097 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _2087);
    float _2099 = -_2089;
    float _2101 = fma(_1785, _2063, _2099);
    float _2103 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2105 = fma(_2093, _2093, _2095);
    float _2107 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2109 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _2097);
    float _2111 = -_2065;
    float _2113 = fma(_2061, _2033, _2111);
    float _2115 = fma(_2101, _2101, _2105);
    float _2117 = -_2033;
    float _2119 = fma(_2061, _2065, _2117);
    float _2121 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2107);
    float _2123 = _2073 * _2067;
    float _2125 = rsqrt(_2115);
    float _2127 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2053);
    float _2129 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2121);
    float _2131 = _2103 * _2067;
    float _2133 = _2109 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2135 = _2127 * _2123;
    float _2137 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2055);
    float _2139 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2141 = _2137 * _2131;
    float _2143 = -_2139;
    float _2145 = _2133 + _2143;
    bool _2147 = _2139 >= _2133;
    bool _2149 = isnan(_2139);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan(_2133);
    bool _2155 = _2151 || _2153;
    float _2157 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2159 = _354 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2161 = _2101 * _2125;
    float _2163 = abs(_2145);
    float _2165 = precise::max(_2163, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _2167 = _2093 * _2125;
    float _2169 = _2085 * _2125;
    float _2171 = _1717 * _2161;
    float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2175 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _2173;
    float _2177 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2157);
    float _2179 = precise::min(_2165, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _2181 = _1719 * _2169;
    float _2183 = -_2171;
    float _2185 = fma(_1719, _2167, _2183);
    float _2187 = 1.0 / _2175;
    float _2189 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2177);
    float _2191 = -_2181;
    float _2193 = fma(_1785, _2161, _2191);
    float _2195 = _2185 * _2185;
    float _2197 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2199 = _2179 + _2197;
    bool _2201 = !_2155;
    float _2203 = _2201 ? 1.0 : (-1.0);
    float _2205 = rsqrt(_2189);
    float _2207 = _1785 * _2167;
    float _2209 = -_2207;
    float _2211 = fma(_1717, _2169, _2209);
    float _2213 = fma(_2193, _2193, _2195);
    float _2215 = _2049 * _2141;
    float _2217 = _2199 * _2187;
    float _2219 = _2159 * _2067;
    float _2221 = fma(_2211, _2211, _2213);
    float _2223 = -_2141;
    float _2225 = _2061 * _2223;
    float _2227 = _2045 * _2141;
    float _2229 = fma(_2075, _2135, _2215);
    float _2231 = _2203 * _2217;
    float _2233 = rsqrt(_2221);
    float _2235 = fma(_2113, _2135, _2227);
    float _2237 = _2219 * _2057;
    float _2239 = fma(_2047, _2135, _2225);
    float _2241 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2243 = fma(_1983, -0.02500000037252902984619140625, 1.0);
    float _2245 = fma(_2119, _2237, _2229);
    float _2247 = fma(_2051, _2237, _2239);
    float _2249 = fma(_2077, _2237, _2235);
    float _2251 = _2241 * _2231;
    float _2253 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2255 = _2161 * _2245;
    float _2257 = _2253 * _2253;
    float _2259 = _2193 * _2233;
    float _2261 = _2185 * _2233;
    float _2263 = _2211 * _2233;
    float _2265 = _2169 * _2245;
    float _2267 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2269 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2271 = _2167 * _2245;
    float _2273 = fma(_2261, _2247, _2265);
    float _2275 = fma(_2267, _2267, _2257);
    float _2277 = fma(_2263, _2247, _2255);
    float _2279 = fma(_2259, _2247, _2271);
    float _2281 = fma(_1785, _2249, _2273);
    float _2283 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2285 = fma(_1719, _2249, _2277);
    float _2287 = fma(_1717, _2249, _2279);
    float _2289 = _1293 + _2281;
    float _2291 = _2251 * 0.15915493667125701904296875;
    float _2293 = fma(_2269, _2269, _2275);
    float _2295 = _1305 + _2287;
    float _2297 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2299 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2301 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2303 = _1297 + _2285;
    float _2305 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2297);
    float _2307 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2299);
    float _2309 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2301);
    float _2311 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2283);
    float _2313 = rsqrt(_2293);
    float _2315 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2307);
    float _2317 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2309);
    float _2319 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2305);
    float _2321 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2311);
    float _2323 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2325 = _2317 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2327 = _2319 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2329 = _2291 * 6.283185482025146484375;
    float _2331 = cos(_2329);
    float _2333 = _2321 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2335 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2337 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2339 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2341 = -_2323;
    float _2343 = _2341 + _2333;
    float _2345 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2335);
    float _2347 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2337);
    float _2349 = _2291 * 6.283185482025146484375;
    float _2351 = sin(_2349);
    float _2353 = fma(_2243, _2343, _2323);
    float _2355 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2339);
    float _2357 = _2267 * _2313;
    float _2359 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2345);
    float _2361 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2347);
    float _2363 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2355);
    float _2365 = -_2331;
    float _2367 = _2365 + 1.0;
    float _2369 = _2253 * _2313;
    float _2371 = _2269 * _2313;
    float _2373 = _2359 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2375 = _2357 * _2367;
    float _2377 = _2369 * _2367;
    float _2379 = _2371 * _2371;
    float _2381 = _2361 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2383 = _2357 * _2351;
    float _2385 = _2369 * _2351;
    float _2387 = fma(_2367, _2379, _2331);
    float _2389 = _2371 * _2351;
    float _2391 = fma(_2371, _2377, _2383);
    float _2393 = -_1293;
    float _2395 = _2393 + _2373;
    float _2397 = -_2385;
    float _2399 = fma(_2371, _2375, _2397);
    float _2401 = -_2389;
    float _2403 = fma(_2369, _2375, _2401);
    float _2405 = -_1305;
    float _2407 = _2405 + _2381;
    float _2409 = _2391 * _2395;
    float _2411 = _2363 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2413 = fma(_2357, _2375, _2331);
    float _2415 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2417 = _2415 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2419 = _2403 * _2395;
    float _2421 = fma(_2399, _2407, _2409);
    float _2423 = -_1297;
    float _2425 = _2423 + _2411;
    float _2427 = fma(_170, _2417, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2429 = fma(_2413, _2407, _2419);
    float _2431 = fma(_2371, _2375, _2385);
    float _2433 = fma(_2387, _2425, _2421);
    float _2435 = fma(_2369, _2377, _2331);
    float _2437 = fma(_2369, _2375, _2389);
    float _2439 = fma(_2431, _2425, _2429);
    float _2441 = fma(_2433, _2427, _1297);
    float _2443 = _2435 * _2395;
    float _2445 = -_2383;
    float _2447 = fma(_2371, _2377, _2445);
    float _2449 = fma(_2439, _2427, _1305);
    float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2453 = _2441 + _2451;
    float _2455 = fma(_2437, _2407, _2443);
    float _2457 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2461 = _2449 + _2459;
    float _2463 = _2453 * _2453;
    float _2465 = fma(_2447, _2425, _2455);
    float _2467 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2457);
    float _2469 = fma(_2461, _2461, _2463);
    float _2471 = _1293 + _2465;
    float _2473 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2467);
    float _2475 = sqrt(_2469);
    bool _2477 = _2475 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2479 = _2457;
    float _2481 = _2467;
    float _2483 = _2441;
    if (!_2477)
    {
        _2479 = _2449;
    }
    float _2485 = _2479;
    float _2487 = _2485;
    if (!_2477)
    {
        _2481 = _2471;
    }
    float _2489 = _2481;
    bool _2491 = !_2477;
    float _2493 = _2489;
    if (!_2491)
    {
        float _2495 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2499 = _2475 + _2497;
        float _2501 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2503 = rsqrt(_2469);
        float _2505 = _2499 * _2495;
        float _2507 = _2505 * 0.15915493667125701904296875;
        float _2509 = _2507 * 6.283185482025146484375;
        float _2511 = cos(_2509);
        float _2513 = _2507 * 6.283185482025146484375;
        float _2515 = sin(_2513);
        float _2517 = _2511 + (-1.0);
        float _2519 = fma(_2515, _2501, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2521 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2523 = _2503 * _2519;
        float _2525 = fma(_2471, _2511, _2521);
        float _2527 = fma(_2461, _2523, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2529 = fma(_2453, _2523, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2493 = _2525;
        _2487 = _2527;
        _2483 = _2529;
    }
    float _2531 = _2493;
    float _2533 = _2487;
    float _2535 = _2483;
    float _2537 = -_1293;
    float _2539 = _2537 + _2531;
    float _2541 = _2473 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2543 = -_1305;
    float _2545 = _2543 + _2533;
    float _2547 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2549 = _2539 * _2539;
    float _2551 = -_1297;
    float _2553 = _2551 + _2535;
    float _2555 = 1.0 / _2541;
    float _2557 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2547);
    float _2559 = fma(_2545, _2545, _2549);
    float _2561 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2557);
    float _2563 = fma(_2553, _2553, _2559);
    float _2565 = _2561 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2567 = sqrt(_2563);
    float _2569 = _2565 + _2541;
    float _2571 = _2569 * _2555;
    float _2573 = _2571 * 0.5;
    float _2575 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2577 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2575);
    float _2579 = 1.0 / _2577;
    bool _2581 = _2567 > 0.0;
    bool _2583 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2585 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2587 = _2583 || _2585;
    bool _2589 = isnan(0.5);
    bool _2591 = _2587 || _2589;
    bool _2593 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2595 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2597 = _2593 || _2595;
    bool _2599 = isnan(0.5);
    bool _2601 = _2597 || _2599;
    float _2603 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2605 = _2533;
    float _2607 = _2535;
    float _2609 = _2539;
    if (!_2581)
    {
        _2603 = _2531;
    }
    float _2611 = _2603;
    bool _2613 = !_2581;
    float _2615 = _2611;
    if (!_2613)
    {
        float _2617 = _186 * _186;
        float _2619 = rsqrt(_2563);
        float _2621 = fma(_184, _184, _2617);
        float _2623 = fma(_188, _188, _2621);
        float _2625 = sqrt(_2623);
        float _2627 = _2545 * _2619;
        float _2629 = _2539 * _2619;
        float _2631 = _2553 * _2619;
        bool _2633 = _2625 > 0.0;
        float _2635 = _2625;
        if (!_2633)
        {
            _2635 = _2531;
        }
        float _2637 = _2635;
        bool _2639 = !_2633;
        _2615 = _2637;
        if (!_2639)
        {
            float _2641 = rsqrt(_2623);
            float _2643 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2645 = _186 * _2641;
            float _2647 = _184 * _2641;
            float _2649 = _2629 * _2645;
            float _2651 = _188 * _2641;
            float _2653 = fma(_2627, _2647, _2649);
            float _2655 = _2643 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2657 = fma(_2631, _2651, _2653);
            float _2659 = _2657 * _2655;
            float _2661 = fma(_184, _2659, _2533);
            float _2663 = fma(_186, _2659, _2531);
            float _2665 = fma(_188, _2659, _2535);
            _2615 = _2663;
            _2605 = _2661;
            _2607 = _2665;
            _2609 = _2659;
        }
    }
    float _2667 = _2615;
    float _2669 = _2605;
    float _2671 = _2607;
    float _2673 = _2609;
    float _2675 = -_1477;
    float _2677 = fma(_2675, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2667);
    float _2679 = -_1479;
    float _2681 = fma(_2679, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2669);
    float _2683 = -_1489;
    float _2685 = fma(_2683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2671);
    float _2687 = _2673;
    float _2689 = _2681;
    float _2691 = _2685;
    float _2693 = _2677;
    if (_2591)
    {
        _2687 = 1.0;
    }
    float _2695 = _2687;
    float _2697 = _2695;
    if (_2601)
    {
        _1567 = _2677;
    }
    float _2699 = _1567;
    float _2701 = _2699;
    if (!_2601)
    {
        float _2703 = _1495 * _1495;
        float _2705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2707 = -_1297;
        float _2709 = _2707 + _2671;
        float _2711 = -_1293;
        float _2713 = _2711 + _2667;
        float _2715 = fma(_1499, _1499, _2703);
        float _2717 = -_1305;
        float _2719 = _2717 + _2669;
        float _2721 = fma(_1513, _1513, _2715);
        float _2723 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2725 = sqrt(_2721);
        float _2727 = 1.0 / _2067;
        float _2729 = _2723 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2731 = precise::min(_2725, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2733 = _2731 * _2705;
        float _2735 = _2733 * _2727;
        float _2737 = _2729 * _2735;
        float _2739 = _2709 * _2735;
        float _2741 = fma(_2713, _2737, _1483);
        float _2743 = fma(_2719, _2737, _1487);
        float _2745 = fma(_2729, _2739, _1503);
        _192 = _2735;
        _2701 = _2741;
        _2689 = _2743;
        _2691 = _2745;
        _2693 = _2705;
    }
    float _2747 = _192;
    float _2749 = _2701;
    float _2751 = _2689;
    float _2753 = _2691;
    float _2755 = _2693;
    float _2757 = _2747;
    float _2759 = _2755;
    if (_2591)
    {
        _1569 = 1.0;
    }
    float _2761 = _1569;
    float _2763 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2765 = _2579 * _2763;
    float _2767 = _2761;
    if (!_2591)
    {
        float _2769 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2771 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2773 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2771;
        float _2775 = _2769 * 0.15915493667125701904296875;
        float _2777 = _2775 * 6.283185482025146484375;
        float _2779 = cos(_2777);
        float _2781 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2783 = _2781 * 0.15915493667125701904296875;
        float _2785 = _2775 * 6.283185482025146484375;
        float _2787 = sin(_2785);
        float _2789 = 1.0 / _2779;
        float _2791 = _2783 * 6.283185482025146484375;
        float _2793 = cos(_2791);
        float _2795 = _2787 * _2789;
        float _2797 = _2783 * 6.283185482025146484375;
        float _2799 = sin(_2797);
        float _2801 = _2793 * _2795;
        float _2803 = 1.0 / _2773;
        float _2805 = 1.0 / _2801;
        float _2807 = _2799 * _2805;
        float _2809 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2811 = fma(_2765, _2807, _2809);
        float _2813 = _2811 * _2803;
        float _2815 = precise::clamp(_2813, 0.0, 1.0);
        _2757 = _2783;
        _2697 = _2815;
    }
    float _2817 = _2757;
    float _2819 = _2697;
    float _2821 = _2817;
    if (!_2591)
    {
        float _2823 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2825 = _2823 * 0.15915493667125701904296875;
        float _2827 = _2825 * 6.283185482025146484375;
        float _2829 = cos(_2827);
        float _2831 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2833 = _2831 * 0.15915493667125701904296875;
        float _2835 = _2825 * 6.283185482025146484375;
        float _2837 = sin(_2835);
        float _2839 = 1.0 / _2829;
        float _2841 = _2833 * 6.283185482025146484375;
        float _2843 = cos(_2841);
        float _2845 = _2837 * _2839;
        float _2847 = _2833 * 6.283185482025146484375;
        float _2849 = sin(_2847);
        float _2851 = _2843 * _2845;
        float _2853 = 1.0 / _2851;
        float _2855 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2857 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2855;
        float _2859 = 1.0 / _2857;
        float _2861 = _2849 * _2853;
        float _2863 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2865 = fma(_2765, _2861, _2863);
        float _2867 = _2865 * _2859;
        float _2869 = precise::clamp(_2867, 0.0, 1.0);
        float _2871 = -_2869;
        float _2873 = _2871 + 1.0;
        _2821 = _2829;
        _2767 = _2873;
    }
    float _2875 = _2821;
    float _2877 = _2767;
    float _2879 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2881 = _2749 + _2879;
    float _2883 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2885 = _2751 + _2883;
    float _2887 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2889 = _2753 + _2887;
    float _2891 = _2881 * _2881;
    float _2893 = fma(_2885, _2885, _2891);
    float _2895 = fma(_2889, _2889, _2893);
    float _2897 = rsqrt(_2895);
    float _2899 = sqrt(_2895);
    float _2901 = _2897 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2903 = _2885 * _2901;
    float _2905 = _2889 * _2901;
    float _2907 = _2903 * _2903;
    float _2909 = _2905 * _2905;
    float _2911 = _2907 + _2909;
    float _2913 = sqrt(_2911);
    bool _2915 = _2913 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2919 = _2913 + _2917;
    float _2921 = _2889;
    float _2923 = _2919;
    float _2925 = _2891;
    if (_2915)
    {
        float _2927 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2921 = _2927;
    }
    float _2929 = _2921;
    if (_2915)
    {
        float _2931 = _2919 * _2929;
        _2923 = _2931;
    }
    float _2933 = _2923;
    if (_2915)
    {
        float _2935 = _2933 * 0.15915493667125701904296875;
        _2925 = _2935;
    }
    float _2937 = _2925;
    float _2939 = _2897;
    float _2941 = _2937;
    if (_2915)
    {
        float _2943 = _2937 * 6.283185482025146484375;
        float _2945 = sin(_2943);
        _2939 = _2945;
    }
    float _2947 = _2939;
    float _2949 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2951 = precise::max(0.0, _2949);
    float _2953 = _2875;
    float _2955 = _2951;
    if (_2915)
    {
        float _2957 = _2937 * 6.283185482025146484375;
        float _2959 = cos(_2957);
        _2953 = _2959;
    }
    float _2961 = _2953;
    float _2963 = -_2901;
    float _2965 = -_2951;
    float _2967 = fma(_2881, _2963, _2965);
    float _2969 = _2949;
    float _2971 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2915)
    {
        float _2973 = rsqrt(_2911);
        _2969 = _2973;
    }
    float _2975 = _2969;
    if (_2915)
    {
        float _2977 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2955 = _2977;
    }
    float _2979 = _2955;
    float _2981 = fma(_1487, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2983 = _2979;
    if (!_2915)
    {
        _2941 = _2903;
    }
    float _2985 = _2941;
    float _2987 = _2947;
    float _2989 = _2985;
    if (_2915)
    {
        float _2991 = fma(_2947, _2979, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2983 = _2991;
    }
    float _2993 = _2983;
    float _2995 = _2993;
    if (!_2915)
    {
        _2987 = _2905;
    }
    float _2997 = _2987;
    float _2999 = _2997;
    float _3001 = _2961;
    if (_2915)
    {
        float _3003 = _2961 + (-1.0);
        _2971 = _3003;
    }
    float _3005 = _2971;
    float _3007 = _3005;
    if (_2915)
    {
        float _3009 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3007 = _3009;
    }
    float _3011 = _3007;
    float _3013 = _2975;
    if (_2915)
    {
        float _3015 = _2975 * _2993;
        _2759 = _3015;
    }
    float _3017 = _2759;
    if (!_2915)
    {
        _3013 = _2967;
    }
    float _3019 = _3013;
    float _3021 = _3019;
    if (_2915)
    {
        float _3023 = fma(_2967, _2961, _3011);
        _3021 = _3023;
    }
    float _3025 = _3021;
    if (!_2915)
    {
        _2995 = _2907;
    }
    float _3027 = _2995;
    float _3029 = _3027;
    if (_2915)
    {
        float _3031 = _2903 * _3017;
        _2989 = _3031;
    }
    float _3033 = _2989;
    if (_2915)
    {
        float _3035 = _2905 * _3017;
        _2999 = _3035;
    }
    float _3037 = _2999;
    float _3039 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2915)
    {
        _3001 = _2909;
    }
    float _3041 = _3001;
    float _3043 = _3041;
    if (_2915)
    {
        float _3045 = _3033 * _3033;
        _3029 = _3045;
    }
    float _3047 = _3029;
    if (_2915)
    {
        float _3049 = _3037 * _3037;
        _3043 = _3049;
    }
    float _3051 = _3043;
    float _3053 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3039);
    float _3055 = fma(_3025, _3025, _3047);
    float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3059 = fma(_2899, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3057);
    float _3061 = precise::clamp(_3059, 0.0, 1.0);
    float _3063 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3053);
    float _3065 = floor(_2981);
    float _3067 = _3055 + _3051;
    float _3069 = _3063 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3071 = -_3061;
    float _3073 = _3071 + 1.0;
    float _3075 = fma(_1503, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3077 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3079 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3081 = rsqrt(_3067);
    float _3083 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3085 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3087 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3077);
    float _3089 = -_3083;
    float _3091 = fma(_3089, _3079, 1.0);
    float _3093 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3095 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3085);
    float _3097 = abs(_3073);
    float _3099 = log2(_3097);
    float _3101 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3087);
    float _3103 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3093);
    float _3105 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3095);
    float _3107 = -_3065;
    float _3109 = _2981 + _3107;
    float _3111 = _3101 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3113 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3103);
    float _3115 = _3105 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3117 = _3081 * _3033;
    float _3119 = _3081 * _3025;
    float _3121 = _3081 * _3037;
    float _3123 = _3113 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3125 = _3117 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3127 = _3115 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3129 = floor(_3075);
    float _3131 = _3115 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3133 = -_3125;
    float _3135 = fma(_3119, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3133);
    float _3137 = fma(_3123, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3127);
    float _3139 = _3099 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3141 = fma(_3123, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3131);
    float _3143 = -_3121;
    float _3145 = fma(_3143, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3135);
    float _3147 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3137);
    float _3149 = log2(_3091);
    float _3151 = fma(_3145, -0.5, 0.5);
    float _3153 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3147);
    float _3155 = fma(_3145, 0.5, 0.5);
    float _3157 = exp2(_3139);
    float _3159 = _3115 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3161 = fma(_3155, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3163 = -_3129;
    float _3165 = _3075 + _3163;
    float _3167 = _3119 + 1.0;
    float _3169 = fma(_3123, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3159);
    float _3171 = fma(_3155, _3161, -0.212114393711090087890625);
    float _3173 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3141);
    float _3175 = 1.0 / _3153;
    float _3177 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3169);
    float _3179 = fma(_3155, _3171, 1.570728778839111328125);
    float _3181 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3177);
    float _3183 = sqrt(_3151);
    float _3185 = -_3119;
    float _3187 = fma(_3157, _3167, _3185);
    float _3189 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3173);
    float _3191 = _3149 * 0.693147182464599609375;
    float2 _8706 = float2(_3109, _3165);
    float _3193 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8706, float2(0.0), isnan(_8706)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8706, float2(0.0), isnan(_8706)), level(0.0)).x;
    float _3195 = fma(_3187, 0.5, 0.5);
    float _3197 = _3191 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3199 = _3181 * _3175;
    float _3201 = _3189 * _3175;
    float _3203 = fma(_3199, 0.5, 0.5);
    float _3205 = fma(_3201, -0.5, 0.5);
    float _3207 = _3183 * 0.636619746685028076171875;
    float3 _8736 = float3(_3203, _3205, _3197);
    float _3209 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8736, float3(0.0), isnan(_8736)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8736, float3(0.0), isnan(_8736)), level(0.0)).x;
    float _3211 = -_3179;
    float _3213 = fma(_3207, _3211, 1.0);
    float3 _8752 = float3(_3203, _3205, _3197);
    float4 _3216 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8752, float3(0.0), isnan(_8752)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8752, float3(0.0), isnan(_8752)), level(0.0)).xyzw;
    float _3218 = _3216.x;
    float _3220 = _3216.y;
    float _3222 = _3216.z;
    float _3224 = _3216.w;
    float2 _8768 = float2(_3213, _3195);
    float3 _3228 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8768, float2(0.0), isnan(_8768)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8768, float2(0.0), isnan(_8768)), level(0.0)).xyz;
    float _3230 = _3228.x;
    float _3232 = _3228.y;
    float _3234 = _3228.z;
    float _3236 = abs(_2765);
    float _3238 = log2(_3236);
    bool _3240 = _2055 != 0.0;
    bool _3242 = isnan(_2055);
    bool _3244 = _3240 || _3242;
    bool _3246 = isnan(0.0);
    bool _3248 = _3244 || _3246;
    out.m_67.x = _1463;
    out.m_67.y = _1465;
    out.m_67.z = _1467;
    out.m_67.w = _1461;
    float _3250 = _3099 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3252 = _2053 == 0.0;
    bool _3254 = !_3248;
    bool _3256 = _3252 && _3254;
    out.m_69.x = _1459;
    out.m_69.y = _1469;
    out.m_69.z = _1471;
    out.m_69.w = _1443;
    float _3258 = _3115 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3260 = _2057 == 0.0;
    bool _3262 = _3260 && _3256;
    float _3264 = exp2(_3250);
    float _3266 = fma(_3123, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3258);
    float _3268 = _3238 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3270 = _2049 * _2167;
    float _3272 = in.m_75.x;
    float _3274 = in.m_75.y;
    float _3276 = in.m_75.z;
    float _3278 = _2075 * _2169;
    float _3280 = _2049 * _2169;
    float _3282 = -_2061;
    float _3284 = fma(_3282, _2259, _3270);
    float _3286 = exp2(_3268);
    float _3288 = _2075 * _2167;
    float _3290 = _2119 * _2169;
    float _3292 = _2113 * _1785;
    float _3294 = -_2061;
    float _3296 = fma(_3294, _2261, _3280);
    float _3298 = fma(_2047, _2261, _3278);
    float _3300 = fma(_2047, _2259, _3288);
    float _3302 = fma(_2051, _2261, _3290);
    bool _3304 = _2765 <= 8000.0;
    bool _3306 = isnan(_2765);
    bool _3308 = _3304 || _3306;
    bool _3310 = isnan(8000.0);
    bool _3312 = _3308 || _3310;
    float _3314 = float(_3312);
    float _3316 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3266);
    float _3318 = _2075 * _2161;
    float _3320 = -_3264;
    float _3322 = _3320 + 1.0;
    float _3324 = _3292 + _3298;
    float _3326 = fma(_2047, _2263, _3318);
    float _3328 = fma(_3286, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3330 = precise::clamp(_3328, 0.0, 1.0);
    float _3332 = fma(_3330, -2.0, 3.0);
    float _3334 = _3330 * _3330;
    float _3336 = _3276;
    float _3338 = _3274;
    float _3340 = _3272;
    if (!_3262)
    {
        float _3342 = fma(_2057, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3276);
        _3336 = _3342;
    }
    float _3344 = _3336;
    float _3346 = _2045 * _1717;
    if (!_3262)
    {
        float _3348 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3274);
        _3338 = _3348;
    }
    float _3350 = _3338;
    float _3352 = _3334 * _3332;
    if (!_3262)
    {
        float _3354 = fma(_2053, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3272);
        _3340 = _3354;
    }
    float _3356 = _3340;
    float _3358 = _3346 + _3284;
    float _3360 = _2045 * _1785;
    float _3362 = -_3352;
    float _3364 = _3362 + 1.0;
    float _3366 = in.m_77.x;
    float _3368 = _2113 * _1717;
    float _3370 = _2077 * _1785;
    float _3372 = fma(_3364, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3352);
    float _3374 = _3358 * _3350;
    float _3376 = _3368 + _3300;
    float _3378 = _3370 + _3302;
    float _3380 = _2049 * _2161;
    float _3382 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3316);
    float _3384 = _3314 * _3372;
    float _3386 = _3360 + _3296;
    float _3388 = fma(_3376, _3356, _3374);
    float _3390 = _2045 * _1719;
    float _3392 = -_2061;
    float _3394 = fma(_3392, _2263, _3380);
    float _3396 = _3382 + _3153;
    float _3398 = _3384 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3400 = _3386 * _3350;
    float _3402 = _2119 * _2167;
    float _3404 = _2113 * _1719;
    float _3406 = _2119 * _2161;
    float _3408 = _3390 + _3394;
    float _3410 = _3396 * 0.5;
    float _3412 = _3322 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3414 = fma(_3324, _3356, _3400);
    float _3416 = _2077 * _1717;
    float _3418 = fma(_2051, _2259, _3402);
    float _3420 = _2077 * _1719;
    float _3422 = fma(_2051, _2263, _3406);
    float _3424 = _3404 + _3326;
    float _3426 = _3408 * _3350;
    float _3428 = _3416 + _3418;
    float _3430 = _3420 + _3422;
    out.m_79.z = _3410;
    out.m_79.w = _3153;
    float _3432 = fma(_3424, _3356, _3426);
    float _3434 = fma(_3428, _3344, _3388);
    float _3436 = fma(_3378, _3344, _3414);
    float _3438 = fma(_3430, _3344, _3432);
    bool _3440 = _2899 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3442 = isnan(_2899);
    bool _3444 = _3440 || _3442;
    bool _3446 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3448 = _3444 || _3446;
    out.gl_Position.x = _3181;
    out.gl_Position.y = _3189;
    out.gl_Position.z = _3382;
    out.gl_Position.w = _3153;
    float _3450 = -_3412;
    float _3452 = _3450 + 1.0;
    out.m_81.x = _3434;
    out.m_81.y = _3436;
    out.m_81.z = _3438;
    float _3454 = _3153;
    float _3456 = _3452;
    float _3458 = _3412;
    if (!_3448)
    {
        _3454 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3460 = _3454;
    float _3462 = -_3193;
    float _3464 = _3462 + 1.0;
    float _3466 = _3464 * _3398;
    float _3468 = precise::clamp(_3466, 0.0, 1.0);
    float _3470 = -_3468;
    float _3472 = fma(_3470, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3474 = _3472 * _3366;
    float _3476 = _3412 * _3209;
    float _3478 = _3366;
    float _3480 = _3460;
    float _3482 = _3460;
    if (!_3448)
    {
        _3478 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3484 = _3478;
    float _3486 = _3474 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3488 = _2819 * _2877;
    float _3490 = _3224 * _3476;
    float _3492 = _3224 * _3452;
    float _3494 = _3490;
    float _3496 = _3488;
    float _3498 = _3484;
    float _3500 = _3484;
    if (!_3448)
    {
        _3456 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3502 = _3456;
    out.m_83.x = _3486;
    float _3504 = _3234 * _3476;
    float _3506 = fma(_3230, _3490, _3218);
    float _3508 = fma(_3232, _3490, _3220);
    float _3510 = _3488 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3512 = fma(_3224, _3504, _3222);
    float _3514 = _3502;
    float _3516 = _3502;
    if (!_3448)
    {
        _3494 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3518 = _3494;
    float _3520 = _3518;
    float _3522 = _3518;
    if (!_3448)
    {
        _3458 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3524 = _3458;
    out.m_85.x = _3506;
    out.m_85.y = _3508;
    out.m_85.z = _3512;
    out.m_85.w = _3492;
    float _3526 = _3524;
    float _3528 = _3524;
    if (!_3448)
    {
        _3496 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3530 = _3496;
    bool _3532 = !_3448;
    float _3534 = _3530;
    float _3536 = _3530;
    if (!_3532)
    {
        bool _3538 = _2899 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3540 = isnan(_2899);
        bool _3542 = _3538 || _3540;
        bool _3544 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3546 = _3542 || _3544;
        if (!_3546)
        {
            float _3548 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3550 = _2899 + _3548;
            float _3552 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3554 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3552;
            float _3556 = 1.0 / _3554;
            float _3558 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3560 = _3558 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3562 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3564 = _3562 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3566 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3568 = _3566 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3570 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3572 = _3570 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3574 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3576 = _3574 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3578 = _3550 * _3556;
            float _3580 = precise::clamp(_3578, 0.0, 1.0);
            float _3582 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3584 = _3582 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3586 = fma(_3580, _3560, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3588 = fma(_3580, _3584, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3590 = fma(_3580, _3564, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3592 = fma(_3580, _3568, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3594 = fma(_3580, _3572, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3596 = fma(_3580, _3576, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3522 = _3588;
            _3528 = _3594;
            _3500 = _3586;
            _3516 = _3592;
            _3482 = _3590;
            _3536 = _3596;
            _3598 = true;
        }
        else
        {
            bool _3600 = _2899 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3602 = isnan(_2899);
            bool _3604 = _3600 || _3602;
            bool _3606 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3608 = _3604 || _3606;
            if (!_3608)
            {
                _3498 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3610 = _3498;
            _3500 = _3610;
            if (!_3608)
            {
                _3520 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3612 = _3520;
            _3522 = _3612;
            if (!_3608)
            {
                _3480 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3614 = _3480;
            _3482 = _3614;
            if (!_3608)
            {
                _3514 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3616 = _3514;
            _3516 = _3616;
            if (!_3608)
            {
                _3526 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3618 = _3526;
            _3528 = _3618;
            if (!_3608)
            {
                _3534 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3620 = _3534;
            bool _3622 = !_3608;
            _3536 = _3620;
            if (!_3622)
            {
                bool _3624 = _2899 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3626 = isnan(_2899);
                bool _3628 = _3624 || _3626;
                bool _3630 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3632 = _3628 || _3630;
                if (!_3632)
                {
                    float _3634 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3636 = _2899 + _3634;
                    float _3638 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3640 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3638;
                    float _3642 = 1.0 / _3640;
                    float _3644 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3646 = _3644 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3648 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3650 = _3648 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3652 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3654 = _3652 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3656 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3658 = _3656 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3660 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3662 = _3660 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3664 = _3636 * _3642;
                    float _3666 = precise::clamp(_3664, 0.0, 1.0);
                    float _3668 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3670 = _3668 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3672 = fma(_3666, _3646, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3674 = fma(_3666, _3670, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3676 = fma(_3666, _3650, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3678 = fma(_3666, _3654, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3680 = fma(_3666, _3658, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3682 = fma(_3666, _3662, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3522 = _3674;
                    _3528 = _3680;
                    _3500 = _3672;
                    _3516 = _3678;
                    _3482 = _3676;
                    _3536 = _3682;
                    _3598 = true;
                }
                else
                {
                    _3522 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3528 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3500 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3516 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3482 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3536 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3598 = false;
    float _3684 = _3522;
    float _3686 = _3528;
    float _3688 = _3500;
    float _3690 = _3516;
    float _3692 = _3482;
    float _3694 = _3536;
    float _3696 = fma(_3436, -0.5, 0.5);
    float _3698 = precise::clamp(_3696, 0.0, 1.0);
    float _3700 = -_3684;
    float _3702 = _3700 + _3686;
    float _3704 = -_3688;
    float _3706 = _3704 + _3690;
    out.m_87.x = 0.0;
    float _3708 = fma(_3698, _3702, _3684);
    float _3710 = -_3692;
    float _3712 = _3710 + _3694;
    float _3714 = fma(_3698, _3706, _3688);
    float _3716 = _3708 * 0.586610972881317138671875;
    bool _3718 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3720 = fma(_3698, _3712, _3692);
    float _3722 = _3510 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3724 = fma(_3714, 0.298911988735198974609375, _3716);
    bool _3726 = _2819 > 0.0;
    bool _3728 = isnan(_2819);
    bool _3730 = _3726 || _3728;
    bool _3732 = isnan(0.0);
    bool _3734 = _3730 || _3732;
    float _3736 = fma(_3720, 0.114477999508380889892578125, _3724);
    out.m_49.x = _3722;
    bool _3738 = _2877 <= 0.0;
    bool _3740 = !_3734;
    bool _3742 = _3738 || _3740;
    float _3744 = -_3736;
    float _3746 = _3714 + _3744;
    float _3748 = -_3736;
    float _3750 = _3708 + _3748;
    float _3752 = -_3736;
    float _3754 = _3720 + _3752;
    float _3756 = fma(_3746, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3736);
    float _3758 = fma(_3750, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3736);
    float _3760 = fma(_3754, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3736);
    bool _3762 = !_3718;
    if (!_3762)
    {
        float _3764 = -_2749;
        float _3766 = _3764 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3768 = -_2751;
        float _3770 = _3768 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3772 = -_2753;
        float _3774 = _3772 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3776 = _3766 * _3766;
        float _3778 = fma(_3770, _3770, _3776);
        float _3780 = fma(_3774, _3774, _3778);
        float _3782 = sqrt(_3780);
        float _3784 = rsqrt(_3780);
        float _3786 = -_3782;
        float _3788 = _3786 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3790 = _3788 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3792 = precise::clamp(_3790, 0.0, 1.0);
        float _3794 = _3770 * _3784;
        float _3796 = _3766 * _3784;
        float _3798 = abs(_3792);
        float _3800 = log2(_3798);
        float _3802 = _3774 * _3784;
        float _3804 = _3794 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3806 = _3436 * _3796;
        float _3808 = -_3796;
        float _3810 = -_3804;
        float _3812 = fma(_3808, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3810);
        float _3814 = fma(_3434, _3794, _3806);
        float _3816 = -_3802;
        float _3818 = fma(_3816, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3812);
        float _3820 = fma(_3438, _3802, _3814);
        float _3822 = precise::clamp(_3820, 0.0, 1.0);
        float _3824 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3826 = _3818 + _3824;
        float _3828 = _3800 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3830 = _3826 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3832 = precise::clamp(_3830, 0.0, 1.0);
        float _3834 = exp2(_3828);
        float _3836 = _3834 * _3832;
        float _3838 = _3822 * _3836;
        float _3840 = _3838 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3842 = _3838 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3844 = _3838 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3840;
        out.m_87.y = _3842;
        out.m_87.z = _3844;
    }
    out.m_89.x = _3756;
    out.m_89.y = _3758;
    out.m_89.z = _3760;
    if (!_3742)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3846 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3846;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3598 = false;
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
        float _3904 = as_type<float>(_124);
        out.gl_Position.z = _3904;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3968 = as_type<float>(_158);
        out.gl_Position.z = _3968;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _452 = in.m_59.x;
    float _454 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _456 = int(_454);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _462 = float(_446);
    float _464 = 1.0 / _460;
    float _466 = float(uint(_456));
    float _468 = 1.0 / _462;
    int _470 = ~_456;
    int _472 = _470 + 1;
    int _474 = ~_456;
    int _476 = _474 + 1;
    float _478 = 1.0 / _466;
    float _480 = _468 * _134;
    float _482 = trunc(_480);
    int _484 = int(_482);
    int _486 = as_type<int>(_478) + (-2);
    float _488 = float(uint(_484));
    float _490 = as_type<float>(_486) * _488;
    float _492 = trunc(_490);
    float _494 = precise::max(_492, 0.0);
    uint _497 = uint(_494);
    int _499 = ~_456;
    int _501 = _499 + 1;
    int _503 = _472 * int(_497);
    int _505 = _503 + _484;
    float _507 = float(uint(_505));
    float _509 = as_type<float>(_486) * _507;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _513 = _511 != 0;
    float _515 = trunc(_509);
    float _517 = precise::max(_515, 0.0);
    uint _519 = uint(_517);
    bool _521 = !_513;
    float _523 = _521 ? 7.345489978790283203125 : 1.0;
    float _525 = _523 * _448;
    float _527 = floor(_525);
    int _529 = int(_497) + int(_519);
    float _531 = float(_456);
    float _533 = float(_484);
    int _535 = _501 * _529;
    int _537 = _535 + _484;
    bool _539 = _533 >= _531;
    bool _541 = isnan(_533);
    bool _543 = _539 || _541;
    bool _545 = isnan(_531);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    bool _551 = uint(_537) >= uint(_456);
    float _553 = trunc(_549);
    int _555 = int(_553);
    bool _557 = !_551;
    int _559 = _557 ? 0 : (-1);
    bool _561 = _456 == 0;
    int _563 = ~_529;
    int _565 = _563 + _559;
    int _567 = _565 + 1;
    int _569 = _456 * _567;
    int _571 = _569 + _484;
    float _573 = -_527;
    float _575 = _525 + _573;
    bool _577 = !_561;
    int _579 = _577 ? _571 : (-1);
    float _581 = _575 * _531;
    int _583 = ~_555;
    int _585 = _583 + 1;
    int _587 = _585 + 1;
    float _589 = _531 * _134;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _593 = _591 != 0;
    float _595 = trunc(_581);
    int _597 = int(_595);
    int _599 = _579 * _587;
    int _601 = _456 + (-1);
    float _603 = _589 * _166;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _607 = _605 != 0;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _611 = _609 != 0;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _615 = _613 != 0;
    bool _617 = !_593;
    int _619 = _617 ? 0 : 1;
    int _621 = _555 * _601;
    int _623 = _621 + _599;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _627 = _625 != 0;
    float _629 = trunc(_603);
    int _631 = int(_629);
    bool _633 = !_611;
    int _635 = _633 ? 0 : 1;
    bool _637 = !_607;
    int _639 = _637 ? 0 : 1;
    int _641 = abs(_635);
    int _643 = abs(_619);
    bool _645 = !_615;
    int _647 = _645 ? 0 : 1;
    int _649 = abs(_639);
    bool _651 = !_627;
    int _653 = _651 ? 0 : 1;
    int _655 = _623 * _641;
    int _657 = abs(_647);
    int _659 = _597 * _643;
    int _661 = _659 + _484;
    int _663 = abs(_653);
    int _665 = _631 * _649;
    int _667 = _665 + _655;
    float _669 = in.m_61.x;
    int _671 = ~_456;
    int _673 = _671 + 1;
    int _675 = _661 * _657;
    int _677 = _675 + _667;
    int _679 = ~_456;
    int _681 = _679 + 1;
    float _683 = float(uint(_661));
    int _685 = _597 * _663;
    int _687 = _685 + _677;
    int _689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _691 = _689 != 0;
    float _693 = in.m_61.y;
    float _695 = as_type<float>(_486) * _683;
    float _697 = float(uint(_687));
    float _699 = as_type<float>(_486) * _697;
    float _701 = trunc(_699);
    float _703 = precise::max(_701, 0.0);
    uint _705 = uint(_703);
    out.m_63.x = _669;
    out.m_63.y = _693;
    int _707 = _673 * int(_705);
    int _709 = _707 + _687;
    float _711 = float(uint(_709));
    float _713 = as_type<float>(_486) * _711;
    float _715 = trunc(_713);
    float _717 = precise::max(_715, 0.0);
    uint _719 = uint(_717);
    int _721 = int(_705) + int(_719);
    int _723 = _681 * _721;
    int _725 = _723 + _687;
    float _727 = trunc(_695);
    float _729 = precise::max(_727, 0.0);
    uint _731 = uint(_729);
    bool _733 = uint(_725) >= uint(_456);
    bool _735 = !_733;
    int _737 = _735 ? 0 : (-1);
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _741 = _739 != 0;
    int _743 = ~_721;
    int _745 = _743 + _737;
    int _747 = _745 + 1;
    int _749 = ~_456;
    int _751 = _749 + 1;
    int _753 = _456 * _747;
    int _755 = _753 + _687;
    int _757 = _751 * int(_731);
    int _759 = _757 + _661;
    bool _761 = !_561;
    int _763 = _761 ? _755 : (-1);
    float _765 = 0.0;
    float _767 = _452;
    if (_741)
    {
        float _769 = in.m_55.x;
        _765 = _769;
    }
    float _771 = _765;
    float _773 = float(uint(_759));
    int _775 = _763 >> 31;
    int _777 = _763 & 3;
    bool _779 = _777 != 0;
    float _781 = as_type<float>(_486) * _773;
    int _783 = _775 & 3;
    float _785 = trunc(_781);
    float _787 = precise::max(_785, 0.0);
    uint _789 = uint(_787);
    int _791 = _763 + _783;
    int _793 = _791 >> 2;
    int _795 = _793 << 4;
    int _797 = _795 + 368;
    uint _799 = uint(int(uint(_797) >> uint(2)));
    uint _801 = uint(int(uint(int(_799)) >> uint(2)));
    int _803 = int(_799) & 3;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[int(_801)][_803];
    int _807 = int(_799) + 1;
    uint _809 = uint(int(uint(_807) >> uint(2)));
    int _811 = _807 & 3;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[int(_809)][_811];
    int _815 = int(_731) + int(_789);
    int _817 = _763 & 3;
    bool _819 = _817 != 0;
    int _821 = _779 ? 0 : 1;
    int _823 = _797 + 8;
    uint _825 = uint(int(uint(_823) >> uint(2)));
    uint _827 = uint(int(uint(int(_825)) >> uint(2)));
    int _829 = int(_825) & 3;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[int(_827)][_829];
    int _833 = int(_825) + 1;
    uint _835 = uint(int(uint(_833) >> uint(2)));
    int _837 = _833 & 3;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[int(_835)][_837];
    bool _841 = uint(_817) > 1u;
    int _843 = _476 * _815;
    int _845 = _843 + _661;
    int _847 = ~_821;
    int _849 = _847 + 1;
    int _851 = _849 + 1;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _855 = _853 != 0;
    bool _857 = uint(_845) >= uint(_456);
    float _859 = in.m_61.z;
    bool _861 = !_819;
    int _863 = _861 ? 0 : 1;
    bool _865 = !_857;
    int _867 = _865 ? 0 : (-1);
    bool _869 = uint(_817) >= 2u;
    int _871 = _851;
    if (!_841)
    {
        int _873 = ~_821;
        int _875 = _873 + 1;
        _871 = _875;
    }
    int _877 = _871;
    bool _879 = _817 != 3;
    int _881 = ~_815;
    int _883 = _881 + _867;
    int _885 = _883 + 1;
    int _887 = abs(_877);
    int _889 = abs(_863);
    int _891 = _456 * _885;
    int _893 = _891 + _661;
    float _895 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _897 = int(_895);
    int _899 = _869 ? 0 : 1;
    float _901 = in.m_61.w;
    bool _903 = _817 != 3;
    int _905 = ~_887;
    int _907 = _905 + 1;
    int _909 = _907 + 1;
    out.m_63.z = _859;
    int _911 = ~_899;
    int _913 = _911 + 1;
    int _915 = _913 + 1;
    int _917 = _915;
    if (_879)
    {
        int _919 = ~_899;
        int _921 = _919 + 1;
        _917 = _921;
    }
    int _923 = _917;
    int _925 = ~_889;
    int _927 = _925 + 1;
    int _929 = _927 + 1;
    int _931 = abs(_923);
    int _933 = _909 * as_type<int>(_813);
    bool _935 = !_903;
    int _937 = _935 ? 0 : (-1);
    int _939 = ~_897;
    int _941 = _939 + 1;
    int _943 = _929 * as_type<int>(_805);
    int _945 = _943 + _933;
    int _947 = abs(_937);
    int _949 = ~_931;
    int _951 = _949 + 1;
    int _953 = _951 + 1;
    float _955 = in.m_59.y;
    bool _957 = !_691;
    int _959 = _957 ? 0 : 1;
    int _961 = abs(_897);
    int _963 = _953 * as_type<int>(_831);
    int _965 = _963 + _945;
    int _967 = abs(_959);
    out.m_63.w = _901;
    float _969 = float(uint(_897));
    int _971 = ~_947;
    int _973 = _971 + 1;
    int _975 = _973 + 1;
    float _977 = float(uint(_961));
    float _979 = 1.0 / _969;
    int _981 = ~_967;
    int _983 = _981 + 1;
    int _985 = _983 + 1;
    int _987 = _975 * as_type<int>(_839);
    int _989 = _987 + _965;
    bool _991 = !_561;
    int _993 = _991 ? _893 : (-1);
    int _995 = _989 * _985;
    bool _997 = _450 > 0.5;
    float _999 = 1.0 / _977;
    float _1001 = in.m_46.x;
    float _1003 = in.m_46.y;
    float _1005 = in.m_46.z;
    int _1007 = _993 * _967;
    int _1009 = _1007 + _995;
    float _1011 = -_955;
    float _1013 = _1011 + 1.0;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1019 = float(uint(_1009));
    float _1021 = 1.0 / _1017;
    int _1023 = as_type<int>(_979) + (-2);
    int _1025 = abs(_1009);
    float _1027 = _955;
    if (_855)
    {
        float _1029 = _997 ? _1013 : _955;
        _1027 = _1029;
    }
    float _1031 = _1027;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1035 = float(uint(_1025));
    float _1037 = as_type<float>(_1023) * _1019;
    int _1039 = as_type<int>(_999) + (-2);
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1043 = _450 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1045 = _448 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1047 = ~_961;
    int _1049 = _1047 + 1;
    float _1051 = as_type<float>(_1039) * _1035;
    float _1053 = trunc(_1037);
    float _1055 = precise::max(_1053, 0.0);
    uint _1057 = uint(_1055);
    float _1059 = fma(_1043, -2.0, _1041);
    float _1061 = _1003 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1063 = _1003 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1065 = -_1033;
    float _1067 = fma(_1045, 2.0, _1065);
    float _1069 = _1003 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1071;
    float _1075 = fma(_1001, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1061);
    float _1077 = trunc(_1051);
    float _1079 = precise::max(_1077, 0.0);
    uint _1081 = uint(_1079);
    float _1083 = fma(_1001, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1063);
    float _1085 = fma(_1001, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1069);
    float _1087 = _1073 * _1021;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1091 = _1089 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1093 = _771 > 0.5;
    bool _1095 = _1093 && _741;
    float _1097 = fma(_1005, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1075);
    int _1099 = _941 * int(_1057);
    int _1101 = _1099 + _1009;
    float _1103 = _1091 * _464;
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1107 = _1105 != 0;
    int _1109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1111 = _1109 != 0;
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1115 = _1113 != 0;
    float _1117 = float(uint(_1101));
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1121 = _1119 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1123 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1125 = isnan(_442);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1131 = _1127 || _1129;
    float _1133 = float(_1131);
    int _1135 = _1049 * int(_1081);
    int _1137 = _1135 + _1025;
    float _1139 = 1.0 / _1121;
    float _1141 = as_type<float>(_1023) * _1117;
    bool _1143 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1145 = isnan(_442);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1151 = _1147 || _1149;
    float _1153 = float(_1151);
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1157 = _442 + _1155;
    float _1159 = float(uint(_1137));
    float _1161 = fma(_1087, _1157, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1163 = trunc(_1141);
    float _1165 = precise::max(_1163, 0.0);
    uint _1167 = uint(_1165);
    float _1169 = as_type<float>(_1039) * _1159;
    bool _1171 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1173 = isnan(_442);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = -_1133;
    float _1185 = _1183 + 1.0;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1187;
    int _1191 = ~_897;
    int _1193 = _1191 + 1;
    float _1195 = -_1181;
    float _1197 = _1195 + 1.0;
    float _1199 = trunc(_1169);
    float _1201 = precise::max(_1199, 0.0);
    uint _1203 = uint(_1201);
    float _1205 = _1181 * _1185;
    bool _1207 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1209 = isnan(_442);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = _1153 * _1197;
    float _1221 = -_1153;
    float _1223 = _1221 + 1.0;
    float _1225 = _1189 * _1139;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1229 = _442 + _1227;
    float _1231 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1233 = _442 + _1231;
    float _1235 = _1217 * _1223;
    int _1237 = int(_1057) + int(_1167);
    float _1239 = fma(_1103, _1229, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1241 = ~_961;
    int _1243 = _1241 + 1;
    float _1245 = _1161 * _1235;
    float _1247 = -_1217;
    float _1249 = _1247 + 1.0;
    float _1251 = fma(_1225, _1233, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1253 = _1233;
    float _1255 = _1251;
    if (!_741)
    {
        _1253 = _452;
    }
    float _1257 = _1253;
    float _1259 = _1257;
    if (_1095)
    {
        float _1261 = -_452;
        float _1263 = _1261 + 1.0;
        _767 = _1263;
    }
    float _1265 = _767;
    int _1267 = int(_1081) + int(_1203);
    int _1269 = _1193 * _1237;
    int _1271 = _1269 + _1009;
    float _1273 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1245);
    if (_741)
    {
        _1259 = _1265;
    }
    float _1275 = _1259;
    bool _1277 = uint(_1271) >= uint(_897);
    int _1279 = _1243 * _1267;
    int _1281 = _1279 + _1025;
    float _1283 = fma(_1005, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1083);
    float _1285 = fma(_1005, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1085);
    bool _1287 = !_1277;
    int _1289 = _1287 ? 0 : (-1);
    float _1291 = fma(_1239, _1219, _1273);
    float _1293 = _1283 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1295 = uint(_1281) >= uint(_961);
    float _1297 = _1285 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1299 = ~_1237;
    int _1301 = _1299 + _1289;
    int _1303 = _1301 + 1;
    float _1305 = _1097 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1309 = _1293 + _1307;
    bool _1311 = !_1295;
    int _1313 = _1311 ? 0 : (-1);
    float _1315 = fma(_1251, _1205, _1291);
    int _1317 = _1009 ^ _897;
    float _1319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1321 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1323 = _1305 + _1321;
    float _1325 = _1309 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1327 = ~_1313;
    int _1329 = _1267 + _1327;
    int _1331 = _1329 + 1;
    float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1335 = _1297 + _1333;
    bool _1337 = _897 == 0;
    bool _1339 = _897 == 0;
    int _1341 = _897 * _1303;
    int _1343 = _1341 + _1009;
    uint _1345 = uint(int(uint(_1317) >> uint(31)));
    float _1347 = fma(_1323, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1325);
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1351 = ~int(_1345);
    int _1353 = _1351 + 1;
    float _1355 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1347);
    bool _1357 = !_1337;
    int _1359 = _1357 ? _1343 : (-1);
    float _1361 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1363 = _1331 ^ _1353;
    bool _1365 = _1355 >= 0.0;
    float _1367 = fma(_1361, _1275, -0.5);
    int _1369 = ~_1353;
    int _1371 = _1369 + _1363;
    int _1373 = _1371 + 1;
    float _1375 = float(_1359);
    float _1377 = -_134;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1067);
    bool _1381 = !_1339;
    int _1383 = _1381 ? _1373 : (-1);
    float _1385 = fma(_1361, _1375, _1379);
    float _1387 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1389 = float(_1383);
    float _1391 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1059);
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1395 = fma(_1387, _1031, -0.5);
    float _1397 = -_1391;
    float _1399 = fma(_1387, _1389, _1397);
    float _1401 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1315);
    float _1403 = _1309 * _1309;
    float _1405 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1393);
    float _1407 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1409 = _1383;
    if (_1365)
    {
        _1255 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1411 = _1255;
    float _1413 = fma(_1323, _1323, _1403);
    float _1415 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1405);
    float _1417 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1407);
    float _1419 = fma(_1335, _1335, _1413);
    float _1421 = fma(_1415, _1395, _1399);
    if (_1365)
    {
        float _1423 = _1411 * 5.0;
        _1409 = as_type<int>(_1423);
    }
    int _1425 = _1409;
    float _1427 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1417);
    float _1429 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1431 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1433 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1435 = rsqrt(_1419);
    float _1437 = fma(_1427, _1367, _1385);
    if (_1365)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5885 = as_type<float>(_1425);
        out.gl_Position.z = _5885;
    }
    float _1439 = _1437 + 0.5;
    float _1441 = _1421 + 0.5;
    float _1443 = _1401 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_1365)
    {
        out.m_49.x = 0.0;
    }
    bool _1445 = !_1115;
    int _1447 = _1445 ? 0 : 1;
    bool _1449 = !_1107;
    int _1451 = _1449 ? 0 : 1;
    out.m_65.x = _1439;
    out.m_65.y = _1441;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1459 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1463 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1465 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1467 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1469 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1471 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1473 = !_1111;
    int _1475 = _1473 ? 0 : 1;
    float _1477 = _1309 * _1435;
    out.m_67.x = _1463;
    out.m_67.y = _1465;
    out.m_67.z = _1467;
    out.m_67.w = _1461;
    float _1479 = _1323 * _1435;
    out.m_69.x = _1459;
    out.m_69.y = _1469;
    out.m_69.z = _1471;
    out.m_69.w = _1443;
    if (_1365)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1481 = -_1477;
    float _1483 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1293);
    float _1485 = -_1479;
    float _1487 = fma(_1485, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1305);
    float _1489 = _1335 * _1435;
    float _1491 = in.m_55.z;
    float _1493 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1495 = _1483 + _1493;
    float _1497 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1499 = _1487 + _1497;
    float _1501 = -_1489;
    float _1503 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1297);
    float _1505 = _448 * 2.0;
    float _1507 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1509 = _450 * 2.0;
    float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1513 = _1503 + _1511;
    float _1515 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1507);
    float _1517 = floor(_1505);
    bool _1519 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1521 = isnan(0.0);
    bool _1523 = _1519 || _1521;
    bool _1525 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1527 = _1523 || _1525;
    float _1529 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1515);
    float _1531 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1533 = log2(_1531);
    bool _1535 = _1529 >= 0.0;
    float _1537 = _450 + _448;
    float _1539 = _1537 + (-1.0);
    float _1541 = _450 + _1491;
    float _1543 = floor(_1509);
    bool _1545 = _1517 > 0.0;
    float _1547 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1549 = _1541 + (-1.0);
    bool _1551 = _1517 >= 0.0;
    bool _1553 = isnan(_1517);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan(0.0);
    bool _1559 = _1555 || _1557;
    float _1561 = _1491 * 2.0;
    float _1563 = 0.0;
    int _1565 = as_type<int>(_1509);
    float _1567 = _1489;
    float _1569 = _1513;
    if (_1535)
    {
        _1563 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1571 = _1563;
    float _1573 = _1533 * _134;
    float _1575 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_1535)
    {
        out.m_49.x = 0.0;
    }
    if (_1535)
    {
        float _1577 = _1571 * 5.0;
        _1565 = as_type<int>(_1577);
    }
    int _1579 = _1565;
    float _1581 = floor(_1561);
    bool _1583 = _1543 > 0.0;
    if (_1535)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6149 = as_type<float>(_1579);
        out.gl_Position.z = _6149;
    }
    bool _1585 = _1543 >= 0.0;
    bool _1587 = isnan(_1543);
    bool _1589 = _1585 || _1587;
    bool _1591 = isnan(0.0);
    bool _1593 = _1589 || _1591;
    float _1595 = exp2(_1573);
    bool _1597 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1599 = isnan(1.0);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1605 = _1601 || _1603;
    float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1609 = 1.0 + _1607;
    if (_1535)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1611 = -_1293;
    float _1613 = _1611 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1615 = -_1305;
    float _1617 = _1615 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1619 = -_1297;
    float _1621 = _1619 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1623 = 1.0 / _1609;
    float _1625 = _1613 * _1613;
    float _1627 = -_1595;
    float _1629 = _1627 + 1.0;
    int _1631 = _1559 ? 0 : 1;
    float _1633 = _450 + (-0.5);
    float _1635 = fma(_1617, _1617, _1625);
    bool _1637 = _1581 > 0.0;
    float _1639 = -_1477;
    float _1641 = fma(_1639, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _1643 = _1527 ? _1629 : 0.0;
    float _1645 = fma(_1621, _1621, _1635);
    bool _1647 = _1581 >= 0.0;
    bool _1649 = isnan(_1581);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan(0.0);
    bool _1655 = _1651 || _1653;
    float _1657 = -_1479;
    float _1659 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1323);
    int _1661 = ~_1631;
    int _1663 = _1661 + 1;
    int _1665 = _1663 + 1;
    float _1667 = rsqrt(_1645);
    int _1669 = _1665;
    if (!_1545)
    {
        int _1671 = ~_1631;
        int _1673 = _1671 + 1;
        _1669 = _1673;
    }
    int _1675 = _1669;
    float _1677 = _1641 * _1641;
    int _1679 = abs(_1475);
    if (_1605)
    {
        float _1681 = _1643 * _1623;
        _152 = _1681;
    }
    float _1683 = _152;
    int _1685 = abs(_1451);
    float _1687 = fma(_1659, _1659, _1677);
    int _1689 = _1655 ? 0 : 1;
    float _1691 = -_1489;
    float _1693 = fma(_1691, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1335);
    int _1695 = abs(_1447);
    float _1697 = sqrt(_1645);
    float _1699 = float(_1675);
    float _1701 = fma(_1693, _1693, _1687);
    int _1703 = ~_1689;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    int _1709 = _1707;
    if (!_1637)
    {
        int _1711 = ~_1689;
        int _1713 = _1711 + 1;
        _1709 = _1713;
    }
    int _1715 = _1709;
    float _1717 = _1617 * _1667;
    float _1719 = _1621 * _1667;
    int _1721 = _1593 ? 0 : 1;
    float _1723 = _1717 * _1717;
    float _1725 = float(_1679);
    float _1727 = float(_1685);
    float _1729 = fma(_1719, _1719, _1723);
    float _1731 = float(_1715);
    float _1733 = _1725 * _1699;
    float _1735 = rsqrt(_1729);
    int _1737 = ~_1721;
    int _1739 = _1737 + 1;
    int _1741 = _1739 + 1;
    float _1743 = _1727 * _1731;
    int _1745 = _1741;
    if (!_1583)
    {
        int _1747 = ~_1721;
        int _1749 = _1747 + 1;
        _1745 = _1749;
    }
    int _1751 = _1745;
    float _1753 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1755 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1757 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1759 = float(_1751);
    float _1761 = float(_1695);
    float _1763 = -_1757;
    float _1765 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1763);
    float _1767 = -_1753;
    float _1769 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1767);
    float _1771 = _1761 * _1759;
    float _1773 = -_1755;
    float _1775 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1773);
    float _1777 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1779 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1781 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1783 = _1719 * _1735;
    float _1785 = _1613 * _1667;
    float _1787 = in.m_71.x;
    float _1789 = in.m_71.y;
    float _1791 = in.m_71.z;
    float _1793 = -_1779;
    float _1795 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1793);
    float _1797 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1799 = -_1781;
    float _1801 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1799);
    float _1803 = _1717 * _1735;
    float _1805 = -_1783;
    float _1807 = _1719 * _1805;
    float _1809 = -_1797;
    float _1811 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1809);
    float _1813 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1801);
    float _1815 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1817 = -_1807;
    float _1819 = fma(_1717, _1803, _1817);
    float _1821 = -_1777;
    float _1823 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1821);
    float _1825 = _1813 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1827 = _1785 * _1803;
    float _1829 = _1819 * _1819;
    float _1831 = -_1815;
    float _1833 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1831);
    float _1835 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1837 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1811);
    float _1839 = fma(_1827, _1827, _1829);
    float _1841 = -_1783;
    float _1843 = _1785 * _1841;
    float _1845 = -_1835;
    float _1847 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1845);
    float _1849 = _1795 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1851 = -_1825;
    float _1853 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1851);
    float _1855 = _1743 * (-2.0);
    float _1857 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1847);
    float _1859 = -_1849;
    float _1861 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1859);
    float _1863 = fma(_1843, _1843, _1839);
    float _1865 = fma(_1547, _1855, _1547);
    float _1867 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1853);
    float _1869 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1861);
    float _1871 = fma(_1855, _1787, _1787);
    float _1873 = _1733 * (-2.0);
    float _1875 = _448 + (-0.5);
    float _1877 = rsqrt(_1863);
    float _1879 = -_1869;
    float _1881 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1867);
    float _1883 = fma(_1873, _1789, _1789);
    float _1885 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1871);
    float _1887 = fma(_1575, _1873, _1575);
    float _1889 = _1771 * (-2.0);
    float _1891 = fma(_1633, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1883);
    float _1893 = fma(_1865, _1683, _1885);
    float _1895 = 1.0 / _1881;
    float _1897 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1899 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1901 = fma(_1887, _1683, _1891);
    float _1903 = fma(_1889, _1791, _1791);
    float _1905 = -_1897;
    float _1907 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1905);
    float _1909 = -_1899;
    float _1911 = fma(_1769, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1909);
    float _1913 = _1893 * 0.15915493667125701904296875;
    float _1915 = _1819 * _1877;
    float _1917 = precise::clamp(_1915, 0.0, 1.0);
    float _1919 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1921 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1911);
    float _1923 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1907);
    float _1925 = -_1917;
    float _1927 = _1925 + 1.0;
    float _1929 = -_1919;
    float _1931 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1929);
    float _1933 = _1901 * 0.15915493667125701904296875;
    float _1935 = _1491 + _448;
    float _1937 = fma(_1921, _1895, -1.0);
    float _1939 = _1927 * _1895;
    float _1941 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1931);
    float _1943 = fma(_1927, _1937, 1.0);
    float _1945 = _1923 * _1939;
    float _1947 = _1941 * _1939;
    float _1949 = _1935 + (-1.0);
    float _1951 = _1943 * _1943;
    float _1953 = _1491 + (-0.5);
    float _1955 = _1933 * 6.283185482025146484375;
    float _1957 = sin(_1955);
    float _1959 = fma(_1949, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1961 = fma(_1945, _1945, _1951);
    float _1963 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1903);
    float _1965 = fma(_1959, _1889, _1959);
    float _1967 = fma(_1947, _1947, _1961);
    float _1969 = _1933 * 6.283185482025146484375;
    float _1971 = cos(_1969);
    float _1973 = fma(_1965, _1683, _1963);
    float _1975 = abs(_1697);
    float _1977 = precise::max(0.0, _1975);
    float _1979 = _1973 * 0.15915493667125701904296875;
    float _1981 = rsqrt(_1967);
    float _1983 = precise::min(_1977, 40.0);
    float _1985 = _1913 * 6.283185482025146484375;
    float _1987 = sin(_1985);
    float _1989 = _1947 * _1981;
    float _1991 = _1943 * _1981;
    float _1993 = _1945 * _1981;
    float _1995 = _1913 * 6.283185482025146484375;
    float _1997 = cos(_1995);
    float _1999 = -_1989;
    float _2001 = _1717 * _1999;
    float _2003 = _1719 * _1991;
    float _2005 = -_1993;
    float _2007 = _1785 * _2005;
    float _2009 = -_1993;
    float _2011 = -_2001;
    float _2013 = fma(_1719, _2009, _2011);
    float _2015 = -_1989;
    float _2017 = -_2003;
    float _2019 = fma(_1785, _2015, _2017);
    float _2021 = -_2007;
    float _2023 = fma(_1717, _1991, _2021);
    float _2025 = _1979 * 6.283185482025146484375;
    float _2027 = cos(_2025);
    float _2029 = _2013 * _2013;
    float _2031 = _1987 * _1957;
    float _2033 = _1987 * _1971;
    float _2035 = fma(_2019, _2019, _2029);
    float _2037 = sqrt(_1701);
    float _2039 = fma(_2023, _2023, _2035);
    float _2041 = _1997 * _1971;
    float _2043 = rsqrt(_2039);
    float _2045 = _1987 * _2027;
    float _2047 = _1971 * _2027;
    float _2049 = _1997 * _2027;
    float _2051 = _1957 * _2027;
    float _2053 = in.m_73.x;
    float _2055 = in.m_73.y;
    float _2057 = in.m_73.z;
    float _2059 = _1979 * 6.283185482025146484375;
    float _2061 = sin(_2059);
    float _2063 = _2019 * _2043;
    float _2065 = _1997 * _1957;
    float _2067 = _1435 * _2037;
    float _2069 = _2023 * _2043;
    float _2071 = _1719 * _2063;
    float _2073 = _380 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2075 = fma(_2061, _2041, _2031);
    float _2077 = fma(_2061, _2031, _2041);
    float _2079 = _2013 * _2043;
    float _2081 = _1785 * _2069;
    float _2083 = -_2071;
    float _2085 = fma(_1717, _2069, _2083);
    float _2087 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2089 = _1717 * _2079;
    float _2091 = -_2081;
    float _2093 = fma(_1719, _2079, _2091);
    float _2095 = _2085 * _2085;
    float _2097 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _2087);
    float _2099 = -_2089;
    float _2101 = fma(_1785, _2063, _2099);
    float _2103 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2105 = fma(_2093, _2093, _2095);
    float _2107 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2109 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _2097);
    float _2111 = -_2065;
    float _2113 = fma(_2061, _2033, _2111);
    float _2115 = fma(_2101, _2101, _2105);
    float _2117 = -_2033;
    float _2119 = fma(_2061, _2065, _2117);
    float _2121 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2107);
    float _2123 = _2073 * _2067;
    float _2125 = rsqrt(_2115);
    float _2127 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2053);
    float _2129 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2121);
    float _2131 = _2103 * _2067;
    float _2133 = _2109 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2135 = _2127 * _2123;
    float _2137 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2055);
    float _2139 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2141 = _2137 * _2131;
    float _2143 = -_2139;
    float _2145 = _2133 + _2143;
    bool _2147 = _2139 >= _2133;
    bool _2149 = isnan(_2139);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan(_2133);
    bool _2155 = _2151 || _2153;
    float _2157 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2159 = _354 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2161 = _2101 * _2125;
    float _2163 = abs(_2145);
    float _2165 = precise::max(_2163, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _2167 = _2093 * _2125;
    float _2169 = _2085 * _2125;
    float _2171 = _1717 * _2161;
    float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2175 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _2173;
    float _2177 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2157);
    float _2179 = precise::min(_2165, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _2181 = _1719 * _2169;
    float _2183 = -_2171;
    float _2185 = fma(_1719, _2167, _2183);
    float _2187 = 1.0 / _2175;
    float _2189 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2177);
    float _2191 = -_2181;
    float _2193 = fma(_1785, _2161, _2191);
    float _2195 = _2185 * _2185;
    float _2197 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _2199 = _2179 + _2197;
    bool _2201 = !_2155;
    float _2203 = _2201 ? 1.0 : (-1.0);
    float _2205 = rsqrt(_2189);
    float _2207 = _1785 * _2167;
    float _2209 = -_2207;
    float _2211 = fma(_1717, _2169, _2209);
    float _2213 = fma(_2193, _2193, _2195);
    float _2215 = _2049 * _2141;
    float _2217 = _2199 * _2187;
    float _2219 = _2159 * _2067;
    float _2221 = fma(_2211, _2211, _2213);
    float _2223 = -_2141;
    float _2225 = _2061 * _2223;
    float _2227 = _2045 * _2141;
    float _2229 = fma(_2075, _2135, _2215);
    float _2231 = _2203 * _2217;
    float _2233 = rsqrt(_2221);
    float _2235 = fma(_2113, _2135, _2227);
    float _2237 = _2219 * _2057;
    float _2239 = fma(_2047, _2135, _2225);
    float _2241 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2243 = fma(_1983, -0.02500000037252902984619140625, 1.0);
    float _2245 = fma(_2119, _2237, _2229);
    float _2247 = fma(_2051, _2237, _2239);
    float _2249 = fma(_2077, _2237, _2235);
    float _2251 = _2241 * _2231;
    float _2253 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2255 = _2161 * _2245;
    float _2257 = _2253 * _2253;
    float _2259 = _2193 * _2233;
    float _2261 = _2185 * _2233;
    float _2263 = _2211 * _2233;
    float _2265 = _2169 * _2245;
    float _2267 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2269 = _2205 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2271 = _2167 * _2245;
    float _2273 = fma(_2261, _2247, _2265);
    float _2275 = fma(_2267, _2267, _2257);
    float _2277 = fma(_2263, _2247, _2255);
    float _2279 = fma(_2259, _2247, _2271);
    float _2281 = fma(_1785, _2249, _2273);
    float _2283 = _1293 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2285 = fma(_1719, _2249, _2277);
    float _2287 = fma(_1717, _2249, _2279);
    float _2289 = _1293 + _2281;
    float _2291 = _2251 * 0.15915493667125701904296875;
    float _2293 = fma(_2269, _2269, _2275);
    float _2295 = _1305 + _2287;
    float _2297 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2299 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2301 = _2289 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2303 = _1297 + _2285;
    float _2305 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2297);
    float _2307 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2299);
    float _2309 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2301);
    float _2311 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2283);
    float _2313 = rsqrt(_2293);
    float _2315 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2307);
    float _2317 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2309);
    float _2319 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2305);
    float _2321 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2311);
    float _2323 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2325 = _2317 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2327 = _2319 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2329 = _2291 * 6.283185482025146484375;
    float _2331 = cos(_2329);
    float _2333 = _2321 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2335 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2337 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2339 = _2325 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2341 = -_2323;
    float _2343 = _2341 + _2333;
    float _2345 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2335);
    float _2347 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2337);
    float _2349 = _2291 * 6.283185482025146484375;
    float _2351 = sin(_2349);
    float _2353 = fma(_2243, _2343, _2323);
    float _2355 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2339);
    float _2357 = _2267 * _2313;
    float _2359 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2345);
    float _2361 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2347);
    float _2363 = fma(_2353, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2355);
    float _2365 = -_2331;
    float _2367 = _2365 + 1.0;
    float _2369 = _2253 * _2313;
    float _2371 = _2269 * _2313;
    float _2373 = _2359 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2375 = _2357 * _2367;
    float _2377 = _2369 * _2367;
    float _2379 = _2371 * _2371;
    float _2381 = _2361 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2383 = _2357 * _2351;
    float _2385 = _2369 * _2351;
    float _2387 = fma(_2367, _2379, _2331);
    float _2389 = _2371 * _2351;
    float _2391 = fma(_2371, _2377, _2383);
    float _2393 = -_1293;
    float _2395 = _2393 + _2373;
    float _2397 = -_2385;
    float _2399 = fma(_2371, _2375, _2397);
    float _2401 = -_2389;
    float _2403 = fma(_2369, _2375, _2401);
    float _2405 = -_1305;
    float _2407 = _2405 + _2381;
    float _2409 = _2391 * _2395;
    float _2411 = _2363 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2413 = fma(_2357, _2375, _2331);
    float _2415 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2417 = _2415 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2419 = _2403 * _2395;
    float _2421 = fma(_2399, _2407, _2409);
    float _2423 = -_1297;
    float _2425 = _2423 + _2411;
    float _2427 = fma(_170, _2417, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2429 = fma(_2413, _2407, _2419);
    float _2431 = fma(_2371, _2375, _2385);
    float _2433 = fma(_2387, _2425, _2421);
    float _2435 = fma(_2369, _2377, _2331);
    float _2437 = fma(_2369, _2375, _2389);
    float _2439 = fma(_2431, _2425, _2429);
    float _2441 = fma(_2433, _2427, _1297);
    float _2443 = _2435 * _2395;
    float _2445 = -_2383;
    float _2447 = fma(_2371, _2377, _2445);
    float _2449 = fma(_2439, _2427, _1305);
    float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2453 = _2441 + _2451;
    float _2455 = fma(_2437, _2407, _2443);
    float _2457 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2461 = _2449 + _2459;
    float _2463 = _2453 * _2453;
    float _2465 = fma(_2447, _2425, _2455);
    float _2467 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2457);
    float _2469 = fma(_2461, _2461, _2463);
    float _2471 = _1293 + _2465;
    float _2473 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2467);
    float _2475 = sqrt(_2469);
    bool _2477 = _2475 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2479 = _2457;
    float _2481 = _2467;
    float _2483 = _2441;
    if (!_2477)
    {
        _2479 = _2449;
    }
    float _2485 = _2479;
    float _2487 = _2485;
    if (!_2477)
    {
        _2481 = _2471;
    }
    float _2489 = _2481;
    bool _2491 = !_2477;
    float _2493 = _2489;
    if (!_2491)
    {
        float _2495 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2499 = _2475 + _2497;
        float _2501 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2503 = rsqrt(_2469);
        float _2505 = _2499 * _2495;
        float _2507 = _2505 * 0.15915493667125701904296875;
        float _2509 = _2507 * 6.283185482025146484375;
        float _2511 = cos(_2509);
        float _2513 = _2507 * 6.283185482025146484375;
        float _2515 = sin(_2513);
        float _2517 = _2511 + (-1.0);
        float _2519 = fma(_2515, _2501, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2521 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2523 = _2503 * _2519;
        float _2525 = fma(_2471, _2511, _2521);
        float _2527 = fma(_2461, _2523, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2529 = fma(_2453, _2523, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2493 = _2525;
        _2487 = _2527;
        _2483 = _2529;
    }
    float _2531 = _2493;
    float _2533 = _2487;
    float _2535 = _2483;
    float _2537 = -_1293;
    float _2539 = _2537 + _2531;
    float _2541 = _2473 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2543 = -_1305;
    float _2545 = _2543 + _2533;
    float _2547 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2549 = _2539 * _2539;
    float _2551 = -_1297;
    float _2553 = _2551 + _2535;
    float _2555 = 1.0 / _2541;
    float _2557 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2547);
    float _2559 = fma(_2545, _2545, _2549);
    float _2561 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2557);
    float _2563 = fma(_2553, _2553, _2559);
    float _2565 = _2561 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2567 = sqrt(_2563);
    float _2569 = _2565 + _2541;
    float _2571 = _2569 * _2555;
    float _2573 = _2571 * 0.5;
    float _2575 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2577 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2575);
    float _2579 = 1.0 / _2577;
    bool _2581 = _2567 > 0.0;
    bool _2583 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2585 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2587 = _2583 || _2585;
    bool _2589 = isnan(0.5);
    bool _2591 = _2587 || _2589;
    bool _2593 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2595 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2597 = _2593 || _2595;
    bool _2599 = isnan(0.5);
    bool _2601 = _2597 || _2599;
    float _2603 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2605 = _2533;
    float _2607 = _2535;
    float _2609 = _2539;
    if (!_2581)
    {
        _2603 = _2531;
    }
    float _2611 = _2603;
    bool _2613 = !_2581;
    float _2615 = _2611;
    if (!_2613)
    {
        float _2617 = _186 * _186;
        float _2619 = rsqrt(_2563);
        float _2621 = fma(_184, _184, _2617);
        float _2623 = fma(_188, _188, _2621);
        float _2625 = sqrt(_2623);
        float _2627 = _2545 * _2619;
        float _2629 = _2539 * _2619;
        float _2631 = _2553 * _2619;
        bool _2633 = _2625 > 0.0;
        float _2635 = _2625;
        if (!_2633)
        {
            _2635 = _2531;
        }
        float _2637 = _2635;
        bool _2639 = !_2633;
        _2615 = _2637;
        if (!_2639)
        {
            float _2641 = rsqrt(_2623);
            float _2643 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2645 = _186 * _2641;
            float _2647 = _184 * _2641;
            float _2649 = _2629 * _2645;
            float _2651 = _188 * _2641;
            float _2653 = fma(_2627, _2647, _2649);
            float _2655 = _2643 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2657 = fma(_2631, _2651, _2653);
            float _2659 = _2657 * _2655;
            float _2661 = fma(_184, _2659, _2533);
            float _2663 = fma(_186, _2659, _2531);
            float _2665 = fma(_188, _2659, _2535);
            _2615 = _2663;
            _2605 = _2661;
            _2607 = _2665;
            _2609 = _2659;
        }
    }
    float _2667 = _2615;
    float _2669 = _2605;
    float _2671 = _2607;
    float _2673 = _2609;
    float _2675 = -_1477;
    float _2677 = fma(_2675, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2667);
    float _2679 = -_1479;
    float _2681 = fma(_2679, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2669);
    float _2683 = -_1489;
    float _2685 = fma(_2683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2671);
    float _2687 = _2673;
    float _2689 = _2681;
    float _2691 = _2685;
    float _2693 = _2677;
    if (_2591)
    {
        _2687 = 1.0;
    }
    float _2695 = _2687;
    float _2697 = _2695;
    if (_2601)
    {
        _1567 = _2677;
    }
    float _2699 = _1567;
    float _2701 = _2699;
    if (!_2601)
    {
        float _2703 = _1495 * _1495;
        float _2705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2707 = -_1297;
        float _2709 = _2707 + _2671;
        float _2711 = -_1293;
        float _2713 = _2711 + _2667;
        float _2715 = fma(_1499, _1499, _2703);
        float _2717 = -_1305;
        float _2719 = _2717 + _2669;
        float _2721 = fma(_1513, _1513, _2715);
        float _2723 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2725 = sqrt(_2721);
        float _2727 = 1.0 / _2067;
        float _2729 = _2723 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2731 = precise::min(_2725, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2733 = _2731 * _2705;
        float _2735 = _2733 * _2727;
        float _2737 = _2729 * _2735;
        float _2739 = _2709 * _2735;
        float _2741 = fma(_2713, _2737, _1483);
        float _2743 = fma(_2719, _2737, _1487);
        float _2745 = fma(_2729, _2739, _1503);
        _192 = _2735;
        _2701 = _2741;
        _2689 = _2743;
        _2691 = _2745;
        _2693 = _2705;
    }
    float _2747 = _192;
    float _2749 = _2701;
    float _2751 = _2689;
    float _2753 = _2691;
    float _2755 = _2693;
    float _2757 = _2747;
    float _2759 = _2755;
    if (_2591)
    {
        _1569 = 1.0;
    }
    float _2761 = _1569;
    float _2763 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2765 = _2579 * _2763;
    float _2767 = _2761;
    if (!_2591)
    {
        float _2769 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2771 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2773 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2771;
        float _2775 = _2769 * 0.15915493667125701904296875;
        float _2777 = _2775 * 6.283185482025146484375;
        float _2779 = cos(_2777);
        float _2781 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2783 = _2781 * 0.15915493667125701904296875;
        float _2785 = _2775 * 6.283185482025146484375;
        float _2787 = sin(_2785);
        float _2789 = 1.0 / _2779;
        float _2791 = _2783 * 6.283185482025146484375;
        float _2793 = cos(_2791);
        float _2795 = _2787 * _2789;
        float _2797 = _2783 * 6.283185482025146484375;
        float _2799 = sin(_2797);
        float _2801 = _2793 * _2795;
        float _2803 = 1.0 / _2773;
        float _2805 = 1.0 / _2801;
        float _2807 = _2799 * _2805;
        float _2809 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2811 = fma(_2765, _2807, _2809);
        float _2813 = _2811 * _2803;
        float _2815 = precise::clamp(_2813, 0.0, 1.0);
        _2757 = _2783;
        _2697 = _2815;
    }
    float _2817 = _2757;
    float _2819 = _2697;
    float _2821 = _2817;
    if (!_2591)
    {
        float _2823 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2825 = _2823 * 0.15915493667125701904296875;
        float _2827 = _2825 * 6.283185482025146484375;
        float _2829 = cos(_2827);
        float _2831 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2833 = _2831 * 0.15915493667125701904296875;
        float _2835 = _2825 * 6.283185482025146484375;
        float _2837 = sin(_2835);
        float _2839 = 1.0 / _2829;
        float _2841 = _2833 * 6.283185482025146484375;
        float _2843 = cos(_2841);
        float _2845 = _2837 * _2839;
        float _2847 = _2833 * 6.283185482025146484375;
        float _2849 = sin(_2847);
        float _2851 = _2843 * _2845;
        float _2853 = 1.0 / _2851;
        float _2855 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2857 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2855;
        float _2859 = 1.0 / _2857;
        float _2861 = _2849 * _2853;
        float _2863 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2865 = fma(_2765, _2861, _2863);
        float _2867 = _2865 * _2859;
        float _2869 = precise::clamp(_2867, 0.0, 1.0);
        float _2871 = -_2869;
        float _2873 = _2871 + 1.0;
        _2821 = _2829;
        _2767 = _2873;
    }
    float _2875 = _2821;
    float _2877 = _2767;
    float _2879 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2881 = _2749 + _2879;
    float _2883 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2885 = _2751 + _2883;
    float _2887 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2889 = _2753 + _2887;
    float _2891 = _2881 * _2881;
    float _2893 = fma(_2885, _2885, _2891);
    float _2895 = fma(_2889, _2889, _2893);
    float _2897 = rsqrt(_2895);
    float _2899 = sqrt(_2895);
    float _2901 = _2897 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2903 = _2885 * _2901;
    float _2905 = _2889 * _2901;
    float _2907 = _2903 * _2903;
    float _2909 = _2905 * _2905;
    float _2911 = _2907 + _2909;
    float _2913 = sqrt(_2911);
    bool _2915 = _2913 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2917 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2919 = _2913 + _2917;
    float _2921 = _2889;
    float _2923 = _2919;
    float _2925 = _2891;
    if (_2915)
    {
        float _2927 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2921 = _2927;
    }
    float _2929 = _2921;
    if (_2915)
    {
        float _2931 = _2919 * _2929;
        _2923 = _2931;
    }
    float _2933 = _2923;
    if (_2915)
    {
        float _2935 = _2933 * 0.15915493667125701904296875;
        _2925 = _2935;
    }
    float _2937 = _2925;
    float _2939 = _2897;
    float _2941 = _2937;
    if (_2915)
    {
        float _2943 = _2937 * 6.283185482025146484375;
        float _2945 = sin(_2943);
        _2939 = _2945;
    }
    float _2947 = _2939;
    float _2949 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2951 = precise::max(0.0, _2949);
    float _2953 = _2875;
    float _2955 = _2951;
    if (_2915)
    {
        float _2957 = _2937 * 6.283185482025146484375;
        float _2959 = cos(_2957);
        _2953 = _2959;
    }
    float _2961 = _2953;
    float _2963 = -_2901;
    float _2965 = -_2951;
    float _2967 = fma(_2881, _2963, _2965);
    float _2969 = _2949;
    float _2971 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2915)
    {
        float _2973 = rsqrt(_2911);
        _2969 = _2973;
    }
    float _2975 = _2969;
    if (_2915)
    {
        float _2977 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2955 = _2977;
    }
    float _2979 = _2955;
    float _2981 = fma(_1487, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2983 = _2979;
    if (!_2915)
    {
        _2941 = _2903;
    }
    float _2985 = _2941;
    float _2987 = _2947;
    float _2989 = _2985;
    if (_2915)
    {
        float _2991 = fma(_2947, _2979, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2983 = _2991;
    }
    float _2993 = _2983;
    float _2995 = _2993;
    if (!_2915)
    {
        _2987 = _2905;
    }
    float _2997 = _2987;
    float _2999 = _2997;
    float _3001 = _2961;
    if (_2915)
    {
        float _3003 = _2961 + (-1.0);
        _2971 = _3003;
    }
    float _3005 = _2971;
    float _3007 = _3005;
    if (_2915)
    {
        float _3009 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3007 = _3009;
    }
    float _3011 = _3007;
    float _3013 = _2975;
    if (_2915)
    {
        float _3015 = _2975 * _2993;
        _2759 = _3015;
    }
    float _3017 = _2759;
    if (!_2915)
    {
        _3013 = _2967;
    }
    float _3019 = _3013;
    float _3021 = _3019;
    if (_2915)
    {
        float _3023 = fma(_2967, _2961, _3011);
        _3021 = _3023;
    }
    float _3025 = _3021;
    if (!_2915)
    {
        _2995 = _2907;
    }
    float _3027 = _2995;
    float _3029 = _3027;
    if (_2915)
    {
        float _3031 = _2903 * _3017;
        _2989 = _3031;
    }
    float _3033 = _2989;
    if (_2915)
    {
        float _3035 = _2905 * _3017;
        _2999 = _3035;
    }
    float _3037 = _2999;
    float _3039 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_2915)
    {
        _3001 = _2909;
    }
    float _3041 = _3001;
    float _3043 = _3041;
    if (_2915)
    {
        float _3045 = _3033 * _3033;
        _3029 = _3045;
    }
    float _3047 = _3029;
    if (_2915)
    {
        float _3049 = _3037 * _3037;
        _3043 = _3049;
    }
    float _3051 = _3043;
    float _3053 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3039);
    float _3055 = fma(_3025, _3025, _3047);
    float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3059 = fma(_2899, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3057);
    float _3061 = precise::clamp(_3059, 0.0, 1.0);
    float _3063 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3053);
    float _3065 = floor(_2981);
    float _3067 = _3055 + _3051;
    float _3069 = _3063 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3071 = -_3061;
    float _3073 = _3071 + 1.0;
    float _3075 = fma(_1503, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3077 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3079 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3081 = rsqrt(_3067);
    float _3083 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3085 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3087 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3077);
    float _3089 = -_3083;
    float _3091 = fma(_3089, _3079, 1.0);
    float _3093 = _2749 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3095 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3085);
    float _3097 = abs(_3073);
    float _3099 = log2(_3097);
    float _3101 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3087);
    float _3103 = fma(_2751, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3093);
    float _3105 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3095);
    float _3107 = -_3065;
    float _3109 = _2981 + _3107;
    float _3111 = _3101 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3113 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3103);
    float _3115 = _3105 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3117 = _3081 * _3033;
    float _3119 = _3081 * _3025;
    float _3121 = _3081 * _3037;
    float _3123 = _3113 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3125 = _3117 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3127 = _3115 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3129 = floor(_3075);
    float _3131 = _3115 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3133 = -_3125;
    float _3135 = fma(_3119, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3133);
    float _3137 = fma(_3123, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3127);
    float _3139 = _3099 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3141 = fma(_3123, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3131);
    float _3143 = -_3121;
    float _3145 = fma(_3143, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3135);
    float _3147 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3137);
    float _3149 = log2(_3091);
    float _3151 = fma(_3145, -0.5, 0.5);
    float _3153 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3147);
    float _3155 = fma(_3145, 0.5, 0.5);
    float _3157 = exp2(_3139);
    float _3159 = _3115 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3161 = fma(_3155, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3163 = -_3129;
    float _3165 = _3075 + _3163;
    float _3167 = _3119 + 1.0;
    float _3169 = fma(_3123, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3159);
    float _3171 = fma(_3155, _3161, -0.212114393711090087890625);
    float _3173 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3141);
    float _3175 = 1.0 / _3153;
    float _3177 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3169);
    float _3179 = fma(_3155, _3171, 1.570728778839111328125);
    float _3181 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3177);
    float _3183 = sqrt(_3151);
    float _3185 = -_3119;
    float _3187 = fma(_3157, _3167, _3185);
    float _3189 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3173);
    float _3191 = _3149 * 0.693147182464599609375;
    float2 _8706 = float2(_3109, _3165);
    float _3193 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8706, float2(0.0), isnan(_8706)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8706, float2(0.0), isnan(_8706)), level(0.0)).x;
    float _3195 = fma(_3187, 0.5, 0.5);
    float _3197 = _3191 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3199 = _3181 * _3175;
    float _3201 = _3189 * _3175;
    float _3203 = fma(_3199, 0.5, 0.5);
    float _3205 = fma(_3201, -0.5, 0.5);
    float _3207 = _3183 * 0.636619746685028076171875;
    float3 _8736 = float3(_3203, _3205, _3197);
    float _3209 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8736, float3(0.0), isnan(_8736)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8736, float3(0.0), isnan(_8736)), level(0.0)).x;
    float _3211 = -_3179;
    float _3213 = fma(_3207, _3211, 1.0);
    float3 _8752 = float3(_3203, _3205, _3197);
    float4 _3216 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8752, float3(0.0), isnan(_8752)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8752, float3(0.0), isnan(_8752)), level(0.0)).xyzw;
    float _3218 = _3216.x;
    float _3220 = _3216.y;
    float _3222 = _3216.z;
    float _3224 = _3216.w;
    float2 _8768 = float2(_3213, _3195);
    float3 _3228 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8768, float2(0.0), isnan(_8768)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8768, float2(0.0), isnan(_8768)), level(0.0)).xyz;
    float _3230 = _3228.x;
    float _3232 = _3228.y;
    float _3234 = _3228.z;
    float _3236 = abs(_2765);
    float _3238 = log2(_3236);
    bool _3240 = _2055 != 0.0;
    bool _3242 = isnan(_2055);
    bool _3244 = _3240 || _3242;
    bool _3246 = isnan(0.0);
    bool _3248 = _3244 || _3246;
    out.m_67.x = _1463;
    out.m_67.y = _1465;
    out.m_67.z = _1467;
    out.m_67.w = _1461;
    float _3250 = _3099 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3252 = _2053 == 0.0;
    bool _3254 = !_3248;
    bool _3256 = _3252 && _3254;
    out.m_69.x = _1459;
    out.m_69.y = _1469;
    out.m_69.z = _1471;
    out.m_69.w = _1443;
    float _3258 = _3115 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3260 = _2057 == 0.0;
    bool _3262 = _3260 && _3256;
    float _3264 = exp2(_3250);
    float _3266 = fma(_3123, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3258);
    float _3268 = _3238 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3270 = _2049 * _2167;
    float _3272 = in.m_75.x;
    float _3274 = in.m_75.y;
    float _3276 = in.m_75.z;
    float _3278 = _2075 * _2169;
    float _3280 = _2049 * _2169;
    float _3282 = -_2061;
    float _3284 = fma(_3282, _2259, _3270);
    float _3286 = exp2(_3268);
    float _3288 = _2075 * _2167;
    float _3290 = _2119 * _2169;
    float _3292 = _2113 * _1785;
    float _3294 = -_2061;
    float _3296 = fma(_3294, _2261, _3280);
    float _3298 = fma(_2047, _2261, _3278);
    float _3300 = fma(_2047, _2259, _3288);
    float _3302 = fma(_2051, _2261, _3290);
    bool _3304 = _2765 <= 8000.0;
    bool _3306 = isnan(_2765);
    bool _3308 = _3304 || _3306;
    bool _3310 = isnan(8000.0);
    bool _3312 = _3308 || _3310;
    float _3314 = float(_3312);
    float _3316 = fma(_3069, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3266);
    float _3318 = _2075 * _2161;
    float _3320 = -_3264;
    float _3322 = _3320 + 1.0;
    float _3324 = _3292 + _3298;
    float _3326 = fma(_2047, _2263, _3318);
    float _3328 = fma(_3286, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3330 = precise::clamp(_3328, 0.0, 1.0);
    float _3332 = fma(_3330, -2.0, 3.0);
    float _3334 = _3330 * _3330;
    float _3336 = _3276;
    float _3338 = _3274;
    float _3340 = _3272;
    if (!_3262)
    {
        float _3342 = fma(_2057, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3276);
        _3336 = _3342;
    }
    float _3344 = _3336;
    float _3346 = _2045 * _1717;
    if (!_3262)
    {
        float _3348 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3274);
        _3338 = _3348;
    }
    float _3350 = _3338;
    float _3352 = _3334 * _3332;
    if (!_3262)
    {
        float _3354 = fma(_2053, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3272);
        _3340 = _3354;
    }
    float _3356 = _3340;
    float _3358 = _3346 + _3284;
    float _3360 = _2045 * _1785;
    float _3362 = -_3352;
    float _3364 = _3362 + 1.0;
    float _3366 = in.m_77.x;
    float _3368 = _2113 * _1717;
    float _3370 = _2077 * _1785;
    float _3372 = fma(_3364, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3352);
    float _3374 = _3358 * _3350;
    float _3376 = _3368 + _3300;
    float _3378 = _3370 + _3302;
    float _3380 = _2049 * _2161;
    float _3382 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3316);
    float _3384 = _3314 * _3372;
    float _3386 = _3360 + _3296;
    float _3388 = fma(_3376, _3356, _3374);
    float _3390 = _2045 * _1719;
    float _3392 = -_2061;
    float _3394 = fma(_3392, _2263, _3380);
    float _3396 = _3382 + _3153;
    float _3398 = _3384 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3400 = _3386 * _3350;
    float _3402 = _2119 * _2167;
    float _3404 = _2113 * _1719;
    float _3406 = _2119 * _2161;
    float _3408 = _3390 + _3394;
    float _3410 = _3396 * 0.5;
    float _3412 = _3322 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3414 = fma(_3324, _3356, _3400);
    float _3416 = _2077 * _1717;
    float _3418 = fma(_2051, _2259, _3402);
    float _3420 = _2077 * _1719;
    float _3422 = fma(_2051, _2263, _3406);
    float _3424 = _3404 + _3326;
    float _3426 = _3408 * _3350;
    float _3428 = _3416 + _3418;
    float _3430 = _3420 + _3422;
    out.m_79.z = _3410;
    out.m_79.w = _3153;
    float _3432 = fma(_3424, _3356, _3426);
    float _3434 = fma(_3428, _3344, _3388);
    float _3436 = fma(_3378, _3344, _3414);
    float _3438 = fma(_3430, _3344, _3432);
    bool _3440 = _2899 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3442 = isnan(_2899);
    bool _3444 = _3440 || _3442;
    bool _3446 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3448 = _3444 || _3446;
    out.gl_Position.x = _3181;
    out.gl_Position.y = _3189;
    out.gl_Position.z = _3382;
    out.gl_Position.w = _3153;
    float _3450 = -_3412;
    float _3452 = _3450 + 1.0;
    out.m_81.x = _3434;
    out.m_81.y = _3436;
    out.m_81.z = _3438;
    float _3454 = _3153;
    float _3456 = _3452;
    float _3458 = _3412;
    if (!_3448)
    {
        _3454 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3460 = _3454;
    float _3462 = -_3193;
    float _3464 = _3462 + 1.0;
    float _3466 = _3464 * _3398;
    float _3468 = precise::clamp(_3466, 0.0, 1.0);
    float _3470 = -_3468;
    float _3472 = fma(_3470, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3474 = _3472 * _3366;
    float _3476 = _3412 * _3209;
    float _3478 = _3366;
    float _3480 = _3460;
    float _3482 = _3460;
    if (!_3448)
    {
        _3478 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3484 = _3478;
    float _3486 = _3474 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3488 = _2819 * _2877;
    float _3490 = _3224 * _3476;
    float _3492 = _3224 * _3452;
    float _3494 = _3490;
    float _3496 = _3488;
    float _3498 = _3484;
    float _3500 = _3484;
    if (!_3448)
    {
        _3456 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3502 = _3456;
    out.m_83.x = _3486;
    float _3504 = _3234 * _3476;
    float _3506 = fma(_3230, _3490, _3218);
    float _3508 = fma(_3232, _3490, _3220);
    float _3510 = _3488 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3512 = fma(_3224, _3504, _3222);
    float _3514 = _3502;
    float _3516 = _3502;
    if (!_3448)
    {
        _3494 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3518 = _3494;
    float _3520 = _3518;
    float _3522 = _3518;
    if (!_3448)
    {
        _3458 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3524 = _3458;
    out.m_85.x = _3506;
    out.m_85.y = _3508;
    out.m_85.z = _3512;
    out.m_85.w = _3492;
    float _3526 = _3524;
    float _3528 = _3524;
    if (!_3448)
    {
        _3496 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3530 = _3496;
    bool _3532 = !_3448;
    float _3534 = _3530;
    float _3536 = _3530;
    if (!_3532)
    {
        bool _3538 = _2899 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3540 = isnan(_2899);
        bool _3542 = _3538 || _3540;
        bool _3544 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3546 = _3542 || _3544;
        if (!_3546)
        {
            float _3548 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3550 = _2899 + _3548;
            float _3552 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3554 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3552;
            float _3556 = 1.0 / _3554;
            float _3558 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3560 = _3558 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3562 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3564 = _3562 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3566 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3568 = _3566 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3570 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3572 = _3570 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3574 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3576 = _3574 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3578 = _3550 * _3556;
            float _3580 = precise::clamp(_3578, 0.0, 1.0);
            float _3582 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3584 = _3582 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3586 = fma(_3580, _3560, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3588 = fma(_3580, _3584, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3590 = fma(_3580, _3564, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3592 = fma(_3580, _3568, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3594 = fma(_3580, _3572, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3596 = fma(_3580, _3576, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3522 = _3588;
            _3528 = _3594;
            _3500 = _3586;
            _3516 = _3592;
            _3482 = _3590;
            _3536 = _3596;
            _3598 = true;
        }
        else
        {
            bool _3600 = _2899 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3602 = isnan(_2899);
            bool _3604 = _3600 || _3602;
            bool _3606 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3608 = _3604 || _3606;
            if (!_3608)
            {
                _3498 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3610 = _3498;
            _3500 = _3610;
            if (!_3608)
            {
                _3520 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3612 = _3520;
            _3522 = _3612;
            if (!_3608)
            {
                _3480 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3614 = _3480;
            _3482 = _3614;
            if (!_3608)
            {
                _3514 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3616 = _3514;
            _3516 = _3616;
            if (!_3608)
            {
                _3526 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3618 = _3526;
            _3528 = _3618;
            if (!_3608)
            {
                _3534 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3620 = _3534;
            bool _3622 = !_3608;
            _3536 = _3620;
            if (!_3622)
            {
                bool _3624 = _2899 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3626 = isnan(_2899);
                bool _3628 = _3624 || _3626;
                bool _3630 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3632 = _3628 || _3630;
                if (!_3632)
                {
                    float _3634 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3636 = _2899 + _3634;
                    float _3638 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3640 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3638;
                    float _3642 = 1.0 / _3640;
                    float _3644 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3646 = _3644 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3648 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3650 = _3648 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3652 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3654 = _3652 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3656 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3658 = _3656 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3660 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3662 = _3660 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3664 = _3636 * _3642;
                    float _3666 = precise::clamp(_3664, 0.0, 1.0);
                    float _3668 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3670 = _3668 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3672 = fma(_3666, _3646, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3674 = fma(_3666, _3670, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3676 = fma(_3666, _3650, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3678 = fma(_3666, _3654, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3680 = fma(_3666, _3658, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3682 = fma(_3666, _3662, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3522 = _3674;
                    _3528 = _3680;
                    _3500 = _3672;
                    _3516 = _3678;
                    _3482 = _3676;
                    _3536 = _3682;
                    _3598 = true;
                }
                else
                {
                    _3522 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3528 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3500 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3516 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3482 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3536 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3598 = false;
    float _3684 = _3522;
    float _3686 = _3528;
    float _3688 = _3500;
    float _3690 = _3516;
    float _3692 = _3482;
    float _3694 = _3536;
    float _3696 = fma(_3436, -0.5, 0.5);
    float _3698 = precise::clamp(_3696, 0.0, 1.0);
    float _3700 = -_3684;
    float _3702 = _3700 + _3686;
    float _3704 = -_3688;
    float _3706 = _3704 + _3690;
    out.m_87.x = 0.0;
    float _3708 = fma(_3698, _3702, _3684);
    float _3710 = -_3692;
    float _3712 = _3710 + _3694;
    float _3714 = fma(_3698, _3706, _3688);
    float _3716 = _3708 * 0.586610972881317138671875;
    bool _3718 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3720 = fma(_3698, _3712, _3692);
    float _3722 = _3510 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3724 = fma(_3714, 0.298911988735198974609375, _3716);
    bool _3726 = _2819 > 0.0;
    bool _3728 = isnan(_2819);
    bool _3730 = _3726 || _3728;
    bool _3732 = isnan(0.0);
    bool _3734 = _3730 || _3732;
    float _3736 = fma(_3720, 0.114477999508380889892578125, _3724);
    out.m_49.x = _3722;
    bool _3738 = _2877 <= 0.0;
    bool _3740 = !_3734;
    bool _3742 = _3738 || _3740;
    float _3744 = -_3736;
    float _3746 = _3714 + _3744;
    float _3748 = -_3736;
    float _3750 = _3708 + _3748;
    float _3752 = -_3736;
    float _3754 = _3720 + _3752;
    float _3756 = fma(_3746, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3736);
    float _3758 = fma(_3750, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3736);
    float _3760 = fma(_3754, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3736);
    bool _3762 = !_3718;
    if (!_3762)
    {
        float _3764 = -_2749;
        float _3766 = _3764 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3768 = -_2751;
        float _3770 = _3768 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3772 = -_2753;
        float _3774 = _3772 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3776 = _3766 * _3766;
        float _3778 = fma(_3770, _3770, _3776);
        float _3780 = fma(_3774, _3774, _3778);
        float _3782 = sqrt(_3780);
        float _3784 = rsqrt(_3780);
        float _3786 = -_3782;
        float _3788 = _3786 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3790 = _3788 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3792 = precise::clamp(_3790, 0.0, 1.0);
        float _3794 = _3770 * _3784;
        float _3796 = _3766 * _3784;
        float _3798 = abs(_3792);
        float _3800 = log2(_3798);
        float _3802 = _3774 * _3784;
        float _3804 = _3794 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3806 = _3436 * _3796;
        float _3808 = -_3796;
        float _3810 = -_3804;
        float _3812 = fma(_3808, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3810);
        float _3814 = fma(_3434, _3794, _3806);
        float _3816 = -_3802;
        float _3818 = fma(_3816, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3812);
        float _3820 = fma(_3438, _3802, _3814);
        float _3822 = precise::clamp(_3820, 0.0, 1.0);
        float _3824 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3826 = _3818 + _3824;
        float _3828 = _3800 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3830 = _3826 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3832 = precise::clamp(_3830, 0.0, 1.0);
        float _3834 = exp2(_3828);
        float _3836 = _3834 * _3832;
        float _3838 = _3822 * _3836;
        float _3840 = _3838 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3842 = _3838 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3844 = _3838 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3840;
        out.m_87.y = _3842;
        out.m_87.z = _3844;
    }
    out.m_89.x = _3756;
    out.m_89.y = _3758;
    out.m_89.z = _3760;
    if (!_3742)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3846 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3846;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

