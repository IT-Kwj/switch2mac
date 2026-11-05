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
    float4 m_71 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3368 = false;
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
        float _3672 = as_type<float>(_122);
        out.gl_Position.z = _3672;
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
        float _3737 = as_type<float>(_158);
        out.gl_Position.z = _3737;
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
    float _192 = _186;
    float _210;
    if (!_190)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
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
    float _280 = _272 * _260;
    float _282 = fma(_276, _266, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = _278 * _260;
    float _286 = _282 * _260;
    float _288 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].x, _280);
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
        float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
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
    bool _334 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _336 = isnan(_322);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _346;
    bool _350 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _352 = isnan(_322);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _364 = 1.0 / _348;
    float _366 = _296 * _326;
    float _368 = _332 * _364;
    float _370 = _298 * _328;
    float _372 = -_344;
    float _374 = _372 + 1.0;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _376;
    float _380 = _294 * _324;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _386;
    float _390 = _360 * _374;
    float _392 = fma(_378, _368, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _394 = fma(_384, _368, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _396 = fma(_388, _368, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _398 = -_360;
    float _400 = _398 + 1.0;
    float _402 = _392 * _390;
    float _404 = _394 * _390;
    float _406 = _396 * _390;
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _402);
    float _410 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _404);
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _406);
    float _414 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[108].y, _408);
    float _416 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[108].x, _410);
    float _418 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[108].z, _412);
    bool _420 = !_362;
    float _438;
    if (!_420)
    {
        float _422 = in.m_55.x;
        float _424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _426 = _422 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _428 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
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
    float _448 = in.m_59.y;
    float _450 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _454 = int(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _464 = float(_446);
    float _466 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _468 = log2(_466);
    float _470 = float(uint(_454));
    float _472 = 1.0 / _464;
    int _474 = ~_454;
    int _476 = _474 + 1;
    bool _478 = _454 == 0;
    float _480 = 1.0 / _470;
    float _482 = _468 * _132;
    float _484 = _472 * _132;
    float _486 = exp2(_482);
    int _488 = as_type<int>(_480) + (-2);
    float _490 = trunc(_484);
    int _492 = int(_490);
    float _494 = float(_454);
    float _496 = -_486;
    float _498 = _496 + 1.0;
    float _500 = float(uint(_492));
    float _502 = as_type<float>(_488) * _500;
    float _504 = trunc(_502);
    float _506 = precise::max(_504, 0.0);
    uint _509 = uint(_506);
    int _511 = ~_454;
    int _513 = _511 + 1;
    int _515 = _476 * int(_509);
    int _517 = _515 + _492;
    float _519 = in.m_55.x;
    float _521 = in.m_55.y;
    float _523 = float(uint(_517));
    float _525 = as_type<float>(_488) * _523;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _529 = _527 != 0;
    float _531 = trunc(_525);
    float _533 = precise::max(_531, 0.0);
    uint _535 = uint(_533);
    bool _537 = !_529;
    float _539 = _537 ? 7.345489978790283203125 : 1.0;
    float _541 = _539 * _519;
    float _543 = _519 * 2.0;
    float _545 = floor(_541);
    int _547 = int(_509) + int(_535);
    float _549 = float(_492);
    int _551 = _513 * _547;
    int _553 = _551 + _492;
    bool _555 = _549 >= _494;
    bool _557 = isnan(_549);
    bool _559 = _555 || _557;
    bool _561 = isnan(_494);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = floor(_543);
    bool _569 = uint(_553) >= uint(_454);
    bool _571 = !_569;
    int _573 = _571 ? 0 : (-1);
    float _575 = trunc(_565);
    int _577 = int(_575);
    float _579 = -_545;
    float _581 = _541 + _579;
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _585 = _583 != 0;
    int _587 = ~_547;
    int _589 = _587 + _573;
    int _591 = _589 + 1;
    float _593 = _581 * _494;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _597 = _595 != 0;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _601 = _599 != 0;
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _609 = _607 != 0;
    int _611 = _454 * _591;
    int _613 = _611 + _492;
    float _615 = trunc(_593);
    int _617 = int(_615);
    bool _619 = !_478;
    int _621 = _619 ? _613 : (-1);
    int _623 = ~_577;
    int _625 = _623 + 1;
    int _627 = _625 + 1;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _631 = _629 != 0;
    int _633 = _621 * _627;
    float _635 = _494 * _132;
    int _637 = _454 + (-1);
    bool _639 = !_585;
    int _641 = _639 ? 0 : 1;
    float _643 = _635 * _166;
    bool _645 = !_601;
    int _647 = _645 ? 0 : 1;
    int _649 = _577 * _637;
    int _651 = _649 + _633;
    bool _653 = !_597;
    int _655 = _653 ? 0 : 1;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _659 = _657 != 0;
    float _661 = trunc(_643);
    int _663 = int(_661);
    int _665 = abs(_647);
    bool _667 = !_605;
    int _669 = _667 ? 0 : 1;
    int _671 = abs(_641);
    int _673 = abs(_655);
    bool _675 = !_659;
    int _677 = _675 ? 0 : 1;
    int _679 = _617 * _671;
    int _681 = _679 + _492;
    int _683 = abs(_669);
    int _685 = _651 * _665;
    int _687 = abs(_677);
    int _689 = _663 * _673;
    int _691 = _689 + _685;
    float _693 = in.m_61.y;
    int _695 = ~_454;
    int _697 = _695 + 1;
    int _699 = _681 * _683;
    int _701 = _699 + _691;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _705 = _703 != 0;
    float _707 = in.m_61.x;
    int _709 = _617 * _687;
    int _711 = _709 + _701;
    int _713 = ~_454;
    int _715 = _713 + 1;
    float _717 = in.m_61.w;
    bool _719 = _521 > 0.5;
    float _721 = float(uint(_711));
    bool _723 = _454 == 0;
    float _725 = as_type<float>(_488) * _721;
    float _727 = 0.0;
    float _729 = _448;
    if (_705)
    {
        float _731 = in.m_55.x;
        _727 = _731;
    }
    float _733 = _727;
    float _735 = trunc(_725);
    float _737 = precise::max(_735, 0.0);
    uint _739 = uint(_737);
    out.m_63.y = _693;
    out.m_63.x = _707;
    out.m_63.w = _717;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _743 = -_448;
    float _745 = _743 + 1.0;
    int _747 = _715 * int(_739);
    int _749 = _747 + _711;
    float _751 = _521 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_631)
    {
        float _753 = _719 ? _745 : _448;
        _729 = _753;
    }
    float _755 = _729;
    float _757 = float(uint(_749));
    float _759 = fma(_751, -2.0, _741);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _765 = float(uint(_681));
    float _767 = as_type<float>(_488) * _757;
    float _769 = in.m_61.z;
    bool _771 = _733 > 0.5;
    bool _773 = _771 && _705;
    float _775 = _521 * 2.0;
    float _777 = trunc(_767);
    float _779 = precise::max(_777, 0.0);
    uint _781 = uint(_779);
    float _783 = floor(_775);
    int _785 = int(_739) + int(_781);
    float _787 = in.m_46.x;
    float _789 = in.m_46.y;
    float _791 = in.m_46.z;
    int _793 = _697 * _785;
    int _795 = _793 + _711;
    out.m_63.z = _769;
    bool _797 = uint(_795) >= uint(_454);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _801 = !_797;
    int _803 = _801 ? 0 : (-1);
    float _805 = _519 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _807 = ~_785;
    int _809 = _807 + _803;
    int _811 = _809 + 1;
    float _813 = -_799;
    float _815 = fma(_805, 2.0, _813);
    float _817 = as_type<float>(_488) * _765;
    float _819 = 1.0 / _763;
    int _821 = _454 * _811;
    int _823 = _821 + _711;
    float _825 = _789 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _827 = _789 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _829 = !_723;
    int _831 = _829 ? _823 : (-1);
    float _833 = trunc(_817);
    float _835 = precise::max(_833, 0.0);
    uint _837 = uint(_835);
    float _839 = _789 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _845 = _831 >> 31;
    float _847 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[4].x, _825);
    float _849 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[5].x, _827);
    float _851 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[6].x, _839);
    int _853 = _845 & 3;
    float _855 = _458 * _819;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _861 = ~_454;
    int _863 = _861 + 1;
    float _865 = 1.0 / _843;
    int _867 = _831 + _853;
    float _869 = in.m_55.z;
    int _871 = _831 & 3;
    bool _873 = _871 != 0;
    int _875 = _867 >> 2;
    float _877 = 1.0 / _859;
    int _879 = _875 << 4;
    int _881 = _879 + 368;
    int _883 = _863 * int(_837);
    int _885 = _883 + _681;
    int _887 = _831 & 3;
    bool _889 = _887 != 0;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _891;
    uint _895 = uint(int(uint(_881) >> uint(2)));
    uint _897 = uint(int(uint(int(_895)) >> uint(2)));
    int _899 = int(_895) & 3;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[int(_897)][_899];
    int _903 = int(_895) + 1;
    uint _905 = uint(int(uint(_903) >> uint(2)));
    int _907 = _903 & 3;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[int(_905)][_907];
    float _911 = float(uint(_885));
    float _913 = _462 * _865;
    bool _915 = uint(_887) > 1u;
    int _917 = _873 ? 0 : 1;
    float _919 = as_type<float>(_488) * _911;
    int _921 = _881 + 8;
    uint _923 = uint(int(uint(_921) >> uint(2)));
    uint _925 = uint(int(uint(int(_923)) >> uint(2)));
    int _927 = int(_923) & 3;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[int(_925)][_927];
    int _931 = int(_923) + 1;
    uint _933 = uint(int(uint(_931) >> uint(2)));
    int _935 = _931 & 3;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[int(_933)][_935];
    float _939 = _521 + _519;
    bool _941 = _887 != 3;
    float _943 = trunc(_919);
    float _945 = precise::max(_943, 0.0);
    uint _947 = uint(_945);
    float _949 = _893 * _877;
    int _951 = ~_917;
    int _953 = _951 + 1;
    int _955 = _953 + 1;
    int _957 = ~_454;
    int _959 = _957 + 1;
    int _961 = _955;
    float _963 = _755;
    if (!_915)
    {
        int _965 = ~_917;
        int _967 = _965 + 1;
        _961 = _967;
    }
    int _969 = _961;
    float _971 = _939 + (-1.0);
    bool _973 = uint(_887) >= 2u;
    float _975 = _521 + _869;
    bool _977 = !_889;
    int _979 = _977 ? 0 : 1;
    float _981 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _983 = abs(_969);
    float _985 = _975 + (-1.0);
    int _987 = _973 ? 0 : 1;
    int _989 = int(_837) + int(_947);
    float _991 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _993 = abs(_979);
    int _995 = _959 * _989;
    int _997 = _995 + _681;
    bool _999 = _567 > 0.0;
    float _1001 = in.m_59.x;
    bool _1003 = _567 >= 0.0;
    bool _1005 = isnan(_567);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan(0.0);
    bool _1011 = _1007 || _1009;
    int _1013 = ~_987;
    int _1015 = _1013 + 1;
    int _1017 = _1015 + 1;
    int _1019 = _1017;
    if (_941)
    {
        int _1021 = ~_987;
        int _1023 = _1021 + 1;
        _1019 = _1023;
    }
    int _1025 = _1019;
    bool _1027 = _887 != 3;
    int _1029 = ~_983;
    int _1031 = _1029 + 1;
    int _1033 = _1031 + 1;
    float _1035 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1037 = int(_1035);
    int _1039 = ~_993;
    int _1041 = _1039 + 1;
    int _1043 = _1041 + 1;
    int _1045 = abs(_1025);
    int _1047 = _1033 * as_type<int>(_909);
    bool _1049 = !_609;
    int _1051 = _1049 ? 0 : 1;
    bool _1053 = uint(_997) >= uint(_454);
    int _1055 = _1043 * as_type<int>(_901);
    int _1057 = _1055 + _1047;
    bool _1059 = !_1027;
    int _1061 = _1059 ? 0 : (-1);
    bool _1063 = !_1053;
    int _1065 = _1063 ? 0 : (-1);
    int _1067 = ~_1045;
    int _1069 = _1067 + 1;
    int _1071 = _1069 + 1;
    int _1073 = abs(_1061);
    int _1075 = ~_989;
    int _1077 = _1075 + _1065;
    int _1079 = _1077 + 1;
    int _1081 = _1071 * as_type<int>(_929);
    int _1083 = _1081 + _1057;
    float _1085 = _869 * 2.0;
    int _1087 = abs(_1037);
    int _1089 = abs(_1051);
    int _1091 = _454 * _1079;
    int _1093 = _1091 + _681;
    int _1095 = ~_1073;
    int _1097 = _1095 + 1;
    int _1099 = _1097 + 1;
    float _1101 = floor(_1085);
    float _1103 = float(uint(_1087));
    int _1105 = ~_1089;
    int _1107 = _1105 + 1;
    int _1109 = _1107 + 1;
    int _1111 = _1099 * as_type<int>(_937);
    int _1113 = _1111 + _1083;
    float _1115 = as_type<float>(_1025);
    float _1117 = _937;
    if (_705)
    {
        _1115 = _1001;
    }
    float _1119 = _1115;
    float _1121 = fma(_791, (*spvDescriptorSet0.vp_c10)._m0[6].z, _851);
    float _1123 = _1119;
    if (!_705)
    {
        _1117 = _1001;
    }
    float _1125 = _1117;
    int _1127 = _1113 * _1109;
    float _1129 = 1.0 / _1103;
    bool _1131 = !_723;
    int _1133 = _1131 ? _1093 : (-1);
    float _1135 = _1125;
    if (_773)
    {
        float _1137 = -_1119;
        float _1139 = _1137 + 1.0;
        _1123 = _1139;
    }
    float _1141 = _1123;
    bool _1143 = _783 > 0.0;
    float _1145 = fma(_791, (*spvDescriptorSet0.vp_c10)._m0[5].z, _849);
    bool _1147 = _783 >= 0.0;
    bool _1149 = isnan(_783);
    bool _1151 = _1147 || _1149;
    bool _1153 = isnan(0.0);
    bool _1155 = _1151 || _1153;
    int _1157 = _1133 * _1089;
    int _1159 = _1157 + _1127;
    float _1161 = float(uint(_1037));
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1165 = _442 + _1163;
    if (_705)
    {
        _1135 = _1141;
    }
    float _1167 = _1135;
    float _1169 = _1145 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1173 = _1171 != 0;
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1177 = _1175 != 0;
    int _1179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1181 = _1179 != 0;
    float _1183 = fma(_855, _1165, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1185 = _1011 ? 0 : 1;
    float _1187 = 1.0 / _1161;
    int _1189 = _1155 ? 0 : 1;
    float _1191 = _1121 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1193 = _1101 > 0.0;
    bool _1195 = _1101 >= 0.0;
    bool _1197 = isnan(_1101);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan(0.0);
    bool _1203 = _1199 || _1201;
    float _1205 = fma(_791, (*spvDescriptorSet0.vp_c10)._m0[4].z, _847);
    bool _1207 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1209 = isnan(_442);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    int _1219 = abs(_1159);
    float _1221 = _1205 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1223 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1225 = isnan(_442);
    bool _1227 = _1223 || _1225;
    bool _1229 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1231 = _1227 || _1229;
    float _1233 = float(_1231);
    int _1235 = as_type<int>(_1129) + (-2);
    float _1237 = -_1217;
    float _1239 = _1237 + 1.0;
    float _1241 = float(uint(_1219));
    float _1243 = -_1233;
    float _1245 = _1243 + 1.0;
    bool _1247 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1249 = isnan(_442);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1255 = _1251 || _1253;
    float _1257 = float(_1255);
    float _1259 = _1233 * _1239;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1263 = _442 + _1261;
    float _1265 = as_type<float>(_1235) * _1241;
    bool _1267 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1269 = isnan(_442);
    bool _1271 = _1267 || _1269;
    bool _1273 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1275 = _1271 || _1273;
    float _1277 = float(_1275);
    float _1279 = -_1257;
    float _1281 = _1279 + 1.0;
    float _1283 = fma(_913, _1263, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1287 = _442 + _1285;
    int _1289 = as_type<int>(_1187) + (-2);
    float _1291 = trunc(_1265);
    float _1293 = precise::max(_1291, 0.0);
    uint _1295 = uint(_1293);
    float _1297 = _1277 * _1281;
    float _1299 = float(uint(_1159));
    float _1301 = fma(_949, _1287, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _1303 = ~_1087;
    int _1305 = _1303 + 1;
    float _1307 = _1257 * _1245;
    float _1309 = as_type<float>(_1289) * _1299;
    int _1311 = ~_1037;
    int _1313 = _1311 + 1;
    float _1315 = _1183 * _1297;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1319 = !_1177;
    int _1321 = _1319 ? 0 : 1;
    float _1323 = trunc(_1309);
    float _1325 = precise::max(_1323, 0.0);
    uint _1327 = uint(_1325);
    bool _1329 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1331 = isnan(0.0);
    bool _1333 = _1329 || _1331;
    bool _1335 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1337 = _1333 || _1335;
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1341 = 1.0 + _1339;
    int _1343 = _1305 * int(_1295);
    int _1345 = _1343 + _1219;
    int _1347 = ~_1087;
    int _1349 = _1347 + 1;
    float _1351 = _1337 ? _498 : 0.0;
    float _1353 = float(uint(_1345));
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1357 = -_1277;
    float _1359 = _1357 + 1.0;
    float _1361 = 1.0 / _1341;
    bool _1363 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1365 = isnan(1.0);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1371 = _1367 || _1369;
    float _1373 = as_type<float>(_1235) * _1353;
    float _1375 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1317);
    float _1377 = -_132;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[76].x, _815);
    int _1381 = _1313 * int(_1327);
    int _1383 = _1381 + _1159;
    float _1385 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1315);
    float _1387 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1355);
    float _1389 = trunc(_1373);
    float _1391 = precise::max(_1389, 0.0);
    uint _1393 = uint(_1391);
    float _1395 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _759);
    float _1397 = float(uint(_1383));
    float _1399 = fma(_1283, _1307, _1385);
    int _1401 = _1203 ? 0 : 1;
    float _1403 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1375);
    int _1405 = ~_1189;
    int _1407 = _1405 + 1;
    int _1409 = _1407 + 1;
    float _1411 = as_type<float>(_1289) * _1397;
    int _1413 = ~_1185;
    int _1415 = _1413 + 1;
    int _1417 = _1415 + 1;
    float _1419 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1387);
    int _1421 = _1417;
    int _1423 = _1409;
    if (!_999)
    {
        int _1425 = ~_1185;
        int _1427 = _1425 + 1;
        _1421 = _1427;
    }
    int _1429 = _1421;
    float _1431 = trunc(_1411);
    float _1433 = precise::max(_1431, 0.0);
    uint _1435 = uint(_1433);
    int _1437 = abs(_1321);
    if (_1371)
    {
        float _1439 = _1351 * _1361;
        _152 = _1439;
    }
    float _1441 = _152;
    int _1443 = ~_1401;
    int _1445 = _1443 + 1;
    int _1447 = _1445 + 1;
    float _1449 = fma(_1301, _1259, _1399);
    float _1451 = float(_1429);
    float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1455 = _1191 + _1453;
    float _1457 = float(_1437);
    float _1459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1461 = int(_1295) + int(_1393);
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1465 = _1221 + _1463;
    int _1467 = _1447;
    if (!_1193)
    {
        int _1469 = ~_1401;
        int _1471 = _1469 + 1;
        _1467 = _1471;
    }
    int _1473 = _1467;
    float _1475 = _1457 * _1451;
    bool _1477 = !_1173;
    int _1479 = _1477 ? 0 : 1;
    int _1481 = _1349 * _1461;
    int _1483 = _1481 + _1219;
    int _1485 = ~_1037;
    int _1487 = _1485 + 1;
    float _1489 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1491 = _1169 + _1489;
    int _1493 = int(_1327) + int(_1435);
    float _1495 = _1475 * (-2.0);
    int _1497 = abs(_1479);
    float _1499 = _521 + (-0.5);
    float _1501 = float(_1473);
    int _1503 = _1487 * _1493;
    int _1505 = _1503 + _1159;
    if (!_1143)
    {
        int _1507 = ~_1189;
        int _1509 = _1507 + 1;
        _1423 = _1509;
    }
    int _1511 = _1423;
    float _1513 = in.m_65.x;
    float _1515 = in.m_65.y;
    float _1517 = in.m_65.z;
    float _1519 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1521 = float(_1497);
    float _1523 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1449);
    bool _1525 = uint(_1505) >= uint(_1037);
    float _1527 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1519);
    bool _1529 = uint(_1483) >= uint(_1087);
    float _1531 = _1521 * _1501;
    bool _1533 = !_1525;
    int _1535 = _1533 ? 0 : (-1);
    float _1537 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1527);
    int _1539 = _1159 ^ _1037;
    float _1541 = _1491 * _1491;
    bool _1543 = !_1529;
    int _1545 = _1543 ? 0 : (-1);
    int _1547 = ~_1493;
    int _1549 = _1547 + _1535;
    int _1551 = _1549 + 1;
    bool _1553 = _1537 >= 0.0;
    float _1555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _1557 = uint(int(uint(_1539) >> uint(31)));
    int _1559 = _1037 * _1551;
    int _1561 = _1559 + _1159;
    int _1563 = ~_1545;
    int _1565 = _1461 + _1563;
    int _1567 = _1565 + 1;
    float _1569 = _1531 * (-2.0);
    bool _1571 = _1037 == 0;
    float _1573 = _1459 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1575 = ~int(_1557);
    int _1577 = _1575 + 1;
    float _1579 = fma(_981, _1569, _981);
    bool _1581 = !_1571;
    int _1583 = _1581 ? _1561 : (-1);
    float _1585 = fma(_1573, _1167, -0.5);
    bool _1587 = _1037 == 0;
    float _1589 = fma(_1569, _1513, _1513);
    int _1591 = _1567 ^ _1577;
    float _1593 = _1517;
    if (_1553)
    {
        out.m_49.x = 0.0;
    }
    float _1595 = float(_1583);
    float _1597 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1599 = ~_1577;
    int _1601 = _1599 + _1591;
    int _1603 = _1601 + 1;
    float _1605 = fma(_991, _1495, _991);
    float _1607 = fma(_1495, _1515, _1515);
    float _1609 = fma(_1573, _1595, _1379);
    float _1611 = _519 + (-0.5);
    bool _1613 = !_1587;
    int _1615 = _1613 ? _1603 : (-1);
    float _1617 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1607);
    float _1619 = fma(_1403, _1585, _1609);
    float _1621 = fma(_1611, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1589);
    float _1623 = float(_1615);
    float _1625 = fma(_1597, _755, -0.5);
    float _1627 = _1619 + 0.5;
    float _1629 = fma(_1605, _1441, _1617);
    float _1631 = fma(_1465, _1465, _1541);
    float _1633 = -_1395;
    float _1635 = fma(_1597, _1623, _1633);
    int _1637 = as_type<int>(_1625);
    if (_1553)
    {
        _963 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1639 = _963;
    float _1641 = fma(_1579, _1441, _1621);
    float _1643 = fma(_1455, _1455, _1631);
    float _1645 = _869 + _519;
    float _1647 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1649 = fma(_1419, _1625, _1635);
    float _1651 = rsqrt(_1643);
    if (_1553)
    {
        float _1653 = _1639 * 5.0;
        _1637 = as_type<int>(_1653);
    }
    int _1655 = _1637;
    float _1657 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1659 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1553)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5958 = as_type<float>(_1655);
        out.gl_Position.z = _5958;
    }
    float _1665 = _1649 + 0.5;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1669 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1671 = _1661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1673 = _1663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1627;
    out.m_67.y = _1665;
    float _1675 = _1491 * _1651;
    float _1677 = _1465 * _1651;
    out.m_69.x = _1669;
    out.m_69.y = _1671;
    out.m_69.z = _1673;
    out.m_69.w = _1667;
    float _1679 = _450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1681 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1683 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1685 = _1523 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1687 = !_1181;
    int _1689 = _1687 ? 0 : 1;
    out.m_71.x = _1679;
    out.m_71.y = _1681;
    out.m_71.z = _1683;
    out.m_71.w = _1685;
    int _1691 = abs(_1689);
    float _1693 = _1675;
    if (_1553)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1695 = -_1675;
    float _1697 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1169);
    float _1699 = _1455 * _1651;
    float _1701 = -_1677;
    float _1703 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1221);
    float _1705 = float(_1511);
    float _1707 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1709 = _1697 + _1707;
    float _1711 = float(_1691);
    float _1713 = -_1699;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1191);
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1719 = _1703 + _1717;
    float _1721 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1723 = _1645 + (-1.0);
    float _1725 = _1711 * _1705;
    float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1729 = _1715 + _1727;
    float _1731 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1721);
    float _1733 = fma(_1723, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1735 = _1725 * (-2.0);
    float _1737 = -_1675;
    float _1739 = fma(_1737, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1491);
    float _1741 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1731);
    float _1743 = _869 + (-0.5);
    float _1745 = fma(_1733, _1735, _1733);
    float _1747 = fma(_1735, _1517, _1517);
    float _1749 = _1629 * 0.15915493667125701904296875;
    bool _1751 = _1741 >= 0.0;
    float _1753 = -_1677;
    float _1755 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1465);
    float _1757 = _1739 * _1739;
    float _1759 = fma(_1743, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1747);
    float _1761 = -_1699;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1455);
    float _1765 = _1641 * 0.15915493667125701904296875;
    float _1767 = fma(_1755, _1755, _1757);
    float _1769 = fma(_1745, _1441, _1759);
    float _1771 = _1749 * 6.283185482025146484375;
    float _1773 = sin(_1771);
    float _1775 = fma(_1763, _1763, _1767);
    float _1777 = _1769 * 0.15915493667125701904296875;
    float _1779 = _1699;
    float _1781 = _1719;
    if (_1751)
    {
        _1593 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1783 = _1593;
    int _1785 = as_type<int>(_1783);
    if (_1751)
    {
        out.m_49.x = 0.0;
    }
    float _1787 = _1765 * 6.283185482025146484375;
    float _1789 = sin(_1787);
    if (_1751)
    {
        float _1791 = _1783 * 5.0;
        _1785 = as_type<int>(_1791);
    }
    int _1793 = _1785;
    if (_1751)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6204 = as_type<float>(_1793);
        out.gl_Position.z = _6204;
    }
    float _1795 = _1765 * 6.283185482025146484375;
    float _1797 = cos(_1795);
    float _1799 = _1749 * 6.283185482025146484375;
    float _1801 = cos(_1799);
    float _1803 = sqrt(_1775);
    float _1805 = _1777 * 6.283185482025146484375;
    float _1807 = sin(_1805);
    if (_1751)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1809 = _1789 * _1773;
    float _1811 = _1797 * _1801;
    float _1813 = _1777 * 6.283185482025146484375;
    float _1815 = cos(_1813);
    float _1817 = -_1169;
    float _1819 = _1817 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1821 = -_1221;
    float _1823 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1825 = fma(_1807, _1811, _1809);
    float _1827 = fma(_1807, _1809, _1811);
    float _1829 = _1819 * _1819;
    float _1831 = in.m_73.x;
    float _1833 = in.m_73.y;
    float _1835 = in.m_73.z;
    float _1837 = _1651 * _1803;
    float _1839 = -_1191;
    float _1841 = _1839 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1843 = fma(_1823, _1823, _1829);
    float _1845 = _1789 * _1801;
    float _1847 = _1797 * _1773;
    float _1849 = fma(_1841, _1841, _1843);
    float _1851 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1853 = -_1847;
    float _1855 = fma(_1807, _1845, _1853);
    float _1857 = _1801 * _1815;
    float _1859 = _1797 * _1815;
    float _1861 = rsqrt(_1849);
    float _1863 = _1789 * _1815;
    float _1865 = _1773 * _1815;
    float _1867 = -_1845;
    float _1869 = fma(_1807, _1847, _1867);
    float _1871 = _380 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1873 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1875 = _1837 * _1871;
    float _1877 = _1837 * _1851;
    float _1879 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1831);
    float _1881 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1873);
    float _1883 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1833);
    float _1885 = sqrt(_1849);
    float _1887 = _1879 * _1875;
    float _1889 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1891 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1881);
    float _1893 = _1823 * _1861;
    float _1895 = _1883 * _1877;
    float _1897 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1889);
    float _1899 = _1819 * _1861;
    float _1901 = _1841 * _1861;
    float _1903 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1905 = _1893 * _1903;
    float _1907 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1909 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1909;
    float _1913 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1897);
    float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1917 = _1901 * _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1921 = -_1905;
    float _1923 = fma(_1901, _1919, _1921);
    float _1925 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1927 = _1913 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1931 = _1899 * _1929;
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1935 = -_1917;
    float _1937 = fma(_1899, _1933, _1935);
    float _1939 = _1923 * _1923;
    float _1941 = -_1927;
    float _1943 = _1925 + _1941;
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1947 = -_1931;
    float _1949 = fma(_1893, _1945, _1947);
    float _1951 = 1.0 / _1911;
    float _1953 = fma(_1937, _1937, _1939);
    float _1955 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1957 = abs(_1943);
    float _1959 = precise::max(_1957, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1961 = fma(_1949, _1949, _1953);
    float _1963 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1955);
    float _1965 = precise::min(_1959, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1967 = rsqrt(_1961);
    float _1969 = _1837 * _1907;
    float _1971 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1963);
    bool _1973 = _1927 >= _1925;
    bool _1975 = isnan(_1927);
    bool _1977 = _1973 || _1975;
    bool _1979 = isnan(_1925);
    bool _1981 = _1977 || _1979;
    float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1985 = _1965 + _1983;
    float _1987 = -_1895;
    float _1989 = _1807 * _1987;
    float _1991 = _1863 * _1895;
    float _1993 = abs(_1885);
    float _1995 = precise::max(0.0, _1993);
    float _1997 = _1985 * _1951;
    float _1999 = _1859 * _1895;
    float _2001 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1835);
    float _2003 = rsqrt(_1971);
    float _2005 = precise::min(_1995, 40.0);
    float _2007 = fma(_1825, _1887, _1999);
    float _2009 = _2001 * _1969;
    bool _2011 = !_1981;
    float _2013 = _2011 ? 1.0 : (-1.0);
    float _2015 = _1949 * _1967;
    float _2017 = _1937 * _1967;
    float _2019 = _1923 * _1967;
    float _2021 = fma(_1855, _1887, _1991);
    float _2023 = _1893 * _2015;
    float _2025 = fma(_2005, -0.02500000037252902984619140625, 1.0);
    float _2027 = fma(_1857, _1887, _1989);
    float _2029 = fma(_1869, _2009, _2007);
    float _2031 = _1901 * _2019;
    float _2033 = -_2023;
    float _2035 = fma(_1901, _2017, _2033);
    float _2037 = _2013 * _1997;
    float _2039 = fma(_1827, _2009, _2021);
    float _2041 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2043 = fma(_1865, _2009, _2027);
    float _2045 = _1899 * _2017;
    float _2047 = -_2031;
    float _2049 = fma(_1899, _2015, _2047);
    float _2051 = _2035 * _2029;
    float _2053 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2055 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2057 = _2041 * _2041;
    float _2059 = -_2045;
    float _2061 = fma(_1893, _2019, _2059);
    float _2063 = _2049 * _2029;
    float _2065 = fma(_2019, _2043, _2051);
    float _2067 = _2053 * _2037;
    float _2069 = fma(_2055, _2055, _2057);
    float _2071 = _2061 * _2029;
    float _2073 = fma(_2017, _2043, _2063);
    float _2075 = fma(_1899, _2039, _2065);
    float _2077 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2079 = fma(_2015, _2043, _2071);
    float _2081 = fma(_1893, _2039, _2073);
    float _2083 = _1169 + _2075;
    float _2085 = fma(_2077, _2077, _2069);
    float _2087 = fma(_1901, _2039, _2079);
    float _2089 = _1221 + _2081;
    float _2091 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2093 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2095 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2097 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2099 = _2067 * 0.15915493667125701904296875;
    float _2101 = _1191 + _2087;
    float _2103 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2091);
    float _2105 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2093);
    float _2107 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2095);
    float _2109 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2097);
    float _2111 = rsqrt(_2085);
    float _2113 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2105);
    float _2115 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2107);
    float _2117 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2103);
    float _2119 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2109);
    float _2121 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2123 = _2115 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2125 = _2117 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2127 = _2099 * 6.283185482025146484375;
    float _2129 = cos(_2127);
    float _2131 = _2119 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2133 = _2123 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2135 = _2123 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2137 = _2123 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2139 = -_2121;
    float _2141 = _2139 + _2131;
    float _2143 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2133);
    float _2145 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2135);
    float _2147 = _2099 * 6.283185482025146484375;
    float _2149 = sin(_2147);
    float _2151 = fma(_2025, _2141, _2121);
    float _2153 = _2055 * _2111;
    float _2155 = _2041 * _2111;
    float _2157 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2137);
    float _2159 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2143);
    float _2161 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2145);
    float _2163 = -_2129;
    float _2165 = _2163 + 1.0;
    float _2167 = _2077 * _2111;
    float _2169 = _2159 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2171 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2157);
    float _2173 = _2155 * _2165;
    float _2175 = _2167 * _2167;
    float _2177 = _2153 * _2165;
    float _2179 = _2161 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2181 = _2153 * _2149;
    float _2183 = _2155 * _2149;
    float _2185 = _2167 * _2149;
    float _2187 = -_1169;
    float _2189 = _2187 + _2169;
    float _2191 = fma(_2167, _2173, _2181);
    float _2193 = fma(_2165, _2175, _2129);
    float _2195 = -_2185;
    float _2197 = fma(_2155, _2177, _2195);
    float _2199 = -_2183;
    float _2201 = fma(_2167, _2177, _2199);
    float _2203 = -_1221;
    float _2205 = _2203 + _2179;
    float _2207 = _2191 * _2189;
    float _2209 = _2171 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2213 = _2211 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2215 = _2197 * _2189;
    float _2217 = fma(_2153, _2177, _2129);
    float _2219 = fma(_2201, _2205, _2207);
    float _2221 = -_1191;
    float _2223 = _2221 + _2209;
    float _2225 = fma(_170, _2213, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2227 = fma(_2217, _2205, _2215);
    float _2229 = fma(_2167, _2177, _2183);
    float _2231 = fma(_2193, _2223, _2219);
    float _2233 = fma(_2155, _2173, _2129);
    float _2235 = fma(_2155, _2177, _2185);
    float _2237 = fma(_2229, _2223, _2227);
    float _2239 = fma(_2231, _2225, _1191);
    float _2241 = _2233 * _2189;
    float _2243 = -_2181;
    float _2245 = fma(_2167, _2173, _2243);
    float _2247 = fma(_2237, _2225, _1221);
    float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2251 = _2239 + _2249;
    float _2253 = fma(_2235, _2205, _2241);
    float _2255 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2259 = _2247 + _2257;
    float _2261 = _2251 * _2251;
    float _2263 = fma(_2245, _2223, _2253);
    float _2265 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2255);
    float _2267 = fma(_2259, _2259, _2261);
    float _2269 = _1169 + _2263;
    float _2271 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2265);
    float _2273 = sqrt(_2267);
    bool _2275 = _2273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2277 = _2263;
    float _2279 = _2255;
    float _2281 = _2239;
    if (!_2275)
    {
        _2277 = _2247;
    }
    float _2283 = _2277;
    float _2285 = _2283;
    if (!_2275)
    {
        _2279 = _2269;
    }
    float _2287 = _2279;
    bool _2289 = !_2275;
    float _2291 = _2287;
    if (!_2289)
    {
        float _2293 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2297 = _2273 + _2295;
        float _2299 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2301 = rsqrt(_2267);
        float _2303 = _2297 * _2293;
        float _2305 = _2303 * 0.15915493667125701904296875;
        float _2307 = _2305 * 6.283185482025146484375;
        float _2309 = cos(_2307);
        float _2311 = _2305 * 6.283185482025146484375;
        float _2313 = sin(_2311);
        float _2315 = _2309 + (-1.0);
        float _2317 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2319 = fma(_2313, _2299, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2321 = fma(_2269, _2309, _2317);
        float _2323 = _2301 * _2319;
        float _2325 = fma(_2259, _2323, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2327 = fma(_2251, _2323, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2291 = _2321;
        _2285 = _2325;
        _2281 = _2327;
    }
    float _2329 = _2291;
    float _2331 = _2285;
    float _2333 = _2281;
    float _2335 = -_1169;
    float _2337 = _2335 + _2329;
    float _2339 = -_1221;
    float _2341 = _2339 + _2331;
    float _2343 = _2271 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2345 = -_1191;
    float _2347 = _2345 + _2333;
    float _2349 = _2337 * _2337;
    float _2351 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2353 = 1.0 / _2343;
    float _2355 = fma(_2341, _2341, _2349);
    float _2357 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2351);
    float _2359 = fma(_2347, _2347, _2355);
    float _2361 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2357);
    float _2363 = sqrt(_2359);
    float _2365 = _2361 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2367 = _2365 + _2343;
    float _2369 = _2367 * _2353;
    float _2371 = _2369 * 0.5;
    bool _2373 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2375 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan(0.5);
    bool _2381 = _2377 || _2379;
    bool _2383 = _2363 > 0.0;
    float _2385 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2387 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2385);
    bool _2389 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2391 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2393 = _2389 || _2391;
    bool _2395 = isnan(0.5);
    bool _2397 = _2393 || _2395;
    float _2399 = 1.0 / _2387;
    bool _2401 = !_2383;
    float _2403 = _2331;
    float _2405 = _2329;
    float _2407 = _2333;
    float _2409 = _2347;
    if (!_2401)
    {
        float _2411 = _186 * _186;
        float _2413 = rsqrt(_2359);
        float _2415 = fma(_184, _184, _2411);
        float _2417 = fma(_188, _188, _2415);
        float _2419 = sqrt(_2417);
        float _2421 = _2337 * _2413;
        float _2423 = _2347 * _2413;
        bool _2425 = _2419 > 0.0;
        float _2427 = _2341 * _2413;
        bool _2429 = !_2425;
        if (!_2429)
        {
            float _2431 = rsqrt(_2417);
            float _2433 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2435 = _186 * _2431;
            float _2437 = _184 * _2431;
            float _2439 = _2421 * _2435;
            float _2441 = _188 * _2431;
            float _2443 = fma(_2427, _2437, _2439);
            float _2445 = _2433 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2447 = fma(_2423, _2441, _2443);
            float _2449 = _2447 * _2445;
            float _2451 = fma(_184, _2449, _2331);
            float _2453 = fma(_186, _2449, _2329);
            float _2455 = fma(_188, _2449, _2333);
            _2403 = _2451;
            _2405 = _2453;
            _2407 = _2455;
            _2409 = _2445;
        }
    }
    float _2457 = _2403;
    float _2459 = _2405;
    float _2461 = _2407;
    float _2463 = _2409;
    float _2465 = -_1677;
    float _2467 = fma(_2465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2457);
    float _2469 = -_1675;
    float _2471 = fma(_2469, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2459);
    float _2473 = -_1699;
    float _2475 = fma(_2473, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2461);
    float _2477 = _2467;
    float _2479 = _2475;
    float _2481 = _2463;
    if (_2397)
    {
        _1693 = 1.0;
    }
    float _2483 = _1693;
    float _2485 = _2483;
    if (_2381)
    {
        _1779 = _2467;
    }
    float _2487 = _1779;
    float _2489 = _2487;
    if (_2381)
    {
        _2477 = _2471;
    }
    float _2491 = _2477;
    float _2493 = _2491;
    if (!_2381)
    {
        float _2495 = _1709 * _1709;
        float _2497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2499 = -_1191;
        float _2501 = _2499 + _2461;
        float _2503 = -_1169;
        float _2505 = _2503 + _2459;
        float _2507 = fma(_1719, _1719, _2495);
        float _2509 = -_1221;
        float _2511 = _2509 + _2457;
        float _2513 = fma(_1729, _1729, _2507);
        float _2515 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2517 = sqrt(_2513);
        float _2519 = 1.0 / _1837;
        float _2521 = precise::min(_2517, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2523 = _2521 * _2497;
        float _2525 = _2515 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2527 = _2523 * _2519;
        float _2529 = _2525 * _2527;
        float _2531 = _2501 * _2527;
        float _2533 = fma(_2505, _2529, _1697);
        float _2535 = fma(_2511, _2529, _1703);
        float _2537 = fma(_2525, _2531, _1715);
        _192 = _2525;
        _2493 = _2533;
        _2489 = _2535;
        _2479 = _2537;
    }
    float _2539 = _192;
    float _2541 = _2493;
    float _2543 = _2489;
    float _2545 = _2479;
    float _2547 = _2539;
    if (_2397)
    {
        _1781 = 1.0;
    }
    float _2549 = _1781;
    float _2551 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2553 = _2399 * _2551;
    float _2555 = _2549;
    if (!_2397)
    {
        float _2557 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2559 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2561 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2559;
        float _2563 = _2557 * 0.15915493667125701904296875;
        float _2565 = _2563 * 6.283185482025146484375;
        float _2567 = cos(_2565);
        float _2569 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2571 = _2569 * 0.15915493667125701904296875;
        float _2573 = _2563 * 6.283185482025146484375;
        float _2575 = sin(_2573);
        float _2577 = 1.0 / _2567;
        float _2579 = _2571 * 6.283185482025146484375;
        float _2581 = cos(_2579);
        float _2583 = _2575 * _2577;
        float _2585 = _2571 * 6.283185482025146484375;
        float _2587 = sin(_2585);
        float _2589 = _2581 * _2583;
        float _2591 = 1.0 / _2561;
        float _2593 = 1.0 / _2589;
        float _2595 = _2587 * _2593;
        float _2597 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2599 = fma(_2553, _2595, _2597);
        float _2601 = _2599 * _2591;
        float _2603 = precise::clamp(_2601, 0.0, 1.0);
        _2547 = _2571;
        _2485 = _2603;
    }
    float _2605 = _2547;
    float _2607 = _2485;
    float _2609 = _2605;
    if (!_2397)
    {
        float _2611 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2613 = _2611 * 0.15915493667125701904296875;
        float _2615 = _2613 * 6.283185482025146484375;
        float _2617 = cos(_2615);
        float _2619 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2621 = _2619 * 0.15915493667125701904296875;
        float _2623 = _2613 * 6.283185482025146484375;
        float _2625 = sin(_2623);
        float _2627 = 1.0 / _2617;
        float _2629 = _2621 * 6.283185482025146484375;
        float _2631 = cos(_2629);
        float _2633 = _2625 * _2627;
        float _2635 = _2621 * 6.283185482025146484375;
        float _2637 = sin(_2635);
        float _2639 = _2631 * _2633;
        float _2641 = 1.0 / _2639;
        float _2643 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2645 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2643;
        float _2647 = 1.0 / _2645;
        float _2649 = _2637 * _2641;
        float _2651 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2653 = fma(_2553, _2649, _2651);
        float _2655 = _2653 * _2647;
        float _2657 = precise::clamp(_2655, 0.0, 1.0);
        float _2659 = -_2657;
        float _2661 = _2659 + 1.0;
        _2609 = _2617;
        _2555 = _2661;
    }
    float _2663 = _2609;
    float _2665 = _2555;
    float _2667 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2669 = _2541 + _2667;
    float _2671 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2673 = _2543 + _2671;
    float _2675 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2677 = _2545 + _2675;
    float _2679 = _2669 * _2669;
    float _2681 = fma(_2673, _2673, _2679);
    float _2683 = fma(_2677, _2677, _2681);
    float _2685 = rsqrt(_2683);
    float _2687 = sqrt(_2683);
    float _2689 = _2685 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2691 = _2673 * _2689;
    float _2693 = _2677 * _2689;
    float _2695 = _2691 * _2691;
    float _2697 = _2693 * _2693;
    float _2699 = _2695 + _2697;
    float _2701 = sqrt(_2699);
    bool _2703 = _2701 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2707 = _2701 + _2705;
    float _2709 = _2677;
    float _2711 = _2707;
    float _2713 = _2679;
    if (_2703)
    {
        float _2715 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2709 = _2715;
    }
    float _2717 = _2709;
    if (_2703)
    {
        float _2719 = _2707 * _2717;
        _2711 = _2719;
    }
    float _2721 = _2711;
    if (_2703)
    {
        float _2723 = _2721 * 0.15915493667125701904296875;
        _2713 = _2723;
    }
    float _2725 = _2713;
    float _2727 = _2685;
    float _2729 = _2725;
    if (_2703)
    {
        float _2731 = _2725 * 6.283185482025146484375;
        float _2733 = sin(_2731);
        _2727 = _2733;
    }
    float _2735 = _2727;
    float _2737 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2739 = precise::max(0.0, _2737);
    float _2741 = _2663;
    float _2743 = _2739;
    if (_2703)
    {
        float _2745 = _2725 * 6.283185482025146484375;
        float _2747 = cos(_2745);
        _2741 = _2747;
    }
    float _2749 = _2741;
    float _2751 = -_2689;
    float _2753 = -_2739;
    float _2755 = fma(_2669, _2751, _2753);
    float _2757 = _2737;
    float _2759 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2703)
    {
        float _2761 = rsqrt(_2699);
        _2757 = _2761;
    }
    float _2763 = _2757;
    if (_2703)
    {
        float _2765 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2743 = _2765;
    }
    float _2767 = _2743;
    float _2769 = fma(_1703, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2771 = _2767;
    if (!_2703)
    {
        _2729 = _2691;
    }
    float _2773 = _2729;
    float _2775 = _2735;
    float _2777 = _2773;
    if (_2703)
    {
        float _2779 = fma(_2735, _2767, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2771 = _2779;
    }
    float _2781 = _2771;
    float _2783 = _2781;
    if (!_2703)
    {
        _2775 = _2693;
    }
    float _2785 = _2775;
    float _2787 = _2785;
    float _2789 = _2749;
    if (_2703)
    {
        float _2791 = _2749 + (-1.0);
        _2759 = _2791;
    }
    float _2793 = _2759;
    float _2795 = _2793;
    if (_2703)
    {
        float _2797 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2795 = _2797;
    }
    float _2799 = _2795;
    float _2801 = _2763;
    if (_2703)
    {
        float _2803 = _2763 * _2781;
        _2481 = _2803;
    }
    float _2805 = _2481;
    if (!_2703)
    {
        _2801 = _2755;
    }
    float _2807 = _2801;
    float _2809 = _2807;
    if (_2703)
    {
        float _2811 = fma(_2755, _2749, _2799);
        _2809 = _2811;
    }
    float _2813 = _2809;
    if (!_2703)
    {
        _2783 = _2695;
    }
    float _2815 = _2783;
    float _2817 = _2815;
    if (_2703)
    {
        float _2819 = _2691 * _2805;
        _2777 = _2819;
    }
    float _2821 = _2777;
    if (_2703)
    {
        float _2823 = _2693 * _2805;
        _2787 = _2823;
    }
    float _2825 = _2787;
    if (!_2703)
    {
        _2789 = _2697;
    }
    float _2827 = _2789;
    float _2829 = floor(_2769);
    float _2831 = _2827;
    if (_2703)
    {
        float _2833 = _2821 * _2821;
        _2817 = _2833;
    }
    float _2835 = _2817;
    if (_2703)
    {
        float _2837 = _2825 * _2825;
        _2831 = _2837;
    }
    float _2839 = _2831;
    float _2841 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2843 = fma(_2813, _2813, _2835);
    float _2845 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2847 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2841);
    float _2849 = _2843 + _2839;
    float _2851 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2853 = fma(_2687, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2851);
    float _2855 = precise::clamp(_2853, 0.0, 1.0);
    float _2857 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2845);
    float _2859 = rsqrt(_2849);
    float _2861 = -_2855;
    float _2863 = _2861 + 1.0;
    float _2865 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2867 = fma(_1715, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2869 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2871 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2857);
    float _2873 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2847);
    float _2875 = -_2829;
    float _2877 = _2769 + _2875;
    float _2879 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2869);
    float _2881 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2883 = _2871 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2885 = abs(_2863);
    float _2887 = log2(_2885);
    float _2889 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2879);
    float _2891 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2881);
    float _2893 = _2883 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2895 = _2873 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2897 = _2859 * _2821;
    float _2899 = _2859 * _2813;
    float _2901 = _2859 * _2825;
    float _2903 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2891);
    float _2905 = _2889 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2907 = -_2893;
    float _2909 = fma(_2907, _2865, 1.0);
    float _2911 = _2897 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2913 = _2903 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2915 = _2905 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2917 = floor(_2867);
    float _2919 = -_2911;
    float _2921 = fma(_2899, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2919);
    float _2923 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2925 = fma(_2913, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2915);
    float _2927 = _2899 + 1.0;
    float _2929 = -_2901;
    float _2931 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2921);
    float _2933 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2925);
    float _2935 = exp2(_2923);
    float _2937 = fma(_2931, -0.5, 0.5);
    float _2939 = _2905 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2941 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2933);
    float _2943 = fma(_2931, 0.5, 0.5);
    float _2945 = fma(_2913, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2939);
    float _2947 = log2(_2909);
    float _2949 = -_2917;
    float _2951 = _2867 + _2949;
    float _2953 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2945);
    float _2955 = fma(_2943, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2957 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2953);
    float _2959 = fma(_2943, _2955, -0.212114393711090087890625);
    float _2961 = 1.0 / _2941;
    float _2963 = _2905 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2965 = -_2899;
    float _2967 = fma(_2935, _2927, _2965);
    float _2969 = sqrt(_2937);
    float _2971 = fma(_2913, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2963);
    float _2973 = _2947 * 0.693147182464599609375;
    float2 _8094 = float2(_2877, _2951);
    float _2975 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8094, float2(0.0), isnan(_8094)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8094, float2(0.0), isnan(_8094)), level(0.0)).x;
    float _2977 = fma(_2943, _2959, 1.570728778839111328125);
    float _2979 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2971);
    float _2981 = _2973 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2983 = fma(_2967, 0.5, 0.5);
    float _2985 = _2957 * _2961;
    float _2987 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2979);
    float _2989 = fma(_2985, 0.5, 0.5);
    float _2991 = _2987 * _2961;
    float _2993 = _2969 * 0.636619746685028076171875;
    float _2995 = fma(_2991, -0.5, 0.5);
    float _2997 = -_2977;
    float _2999 = fma(_2993, _2997, 1.0);
    float3 _8143 = float3(_2989, _2995, _2981);
    float _3001 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8143, float3(0.0), isnan(_8143)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8143, float3(0.0), isnan(_8143)), level(0.0)).x;
    float3 _8154 = float3(_2989, _2995, _2981);
    float4 _3004 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8154, float3(0.0), isnan(_8154)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8154, float3(0.0), isnan(_8154)), level(0.0)).xyzw;
    float _3006 = _3004.x;
    float _3008 = _3004.y;
    float _3010 = _3004.z;
    float _3012 = _3004.w;
    float2 _8170 = float2(_2999, _2983);
    float3 _3016 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8170, float2(0.0), isnan(_8170)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8170, float2(0.0), isnan(_8170)), level(0.0)).xyz;
    float _3018 = _3016.x;
    float _3020 = _3016.y;
    float _3022 = _3016.z;
    float _3024 = abs(_2553);
    float _3026 = log2(_3024);
    bool _3028 = _1833 != 0.0;
    bool _3030 = isnan(_1833);
    bool _3032 = _3028 || _3030;
    bool _3034 = isnan(0.0);
    bool _3036 = _3032 || _3034;
    out.m_71.x = _1679;
    out.m_71.y = _1681;
    out.m_71.z = _1683;
    out.m_71.w = _1685;
    float _3038 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3040 = _1831 == 0.0;
    bool _3042 = !_3036;
    bool _3044 = _3040 && _3042;
    out.m_69.x = _1669;
    out.m_69.y = _1671;
    out.m_69.z = _1673;
    out.m_69.w = _1667;
    bool _3046 = _1835 == 0.0;
    bool _3048 = _3046 && _3044;
    float _3050 = exp2(_3038);
    bool _3052 = _2553 <= 8000.0;
    bool _3054 = isnan(_2553);
    bool _3056 = _3052 || _3054;
    bool _3058 = isnan(8000.0);
    bool _3060 = _3056 || _3058;
    float _3062 = float(_3060);
    float _3064 = _3026 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3066 = _1825 * _2035;
    float _3068 = in.m_75.x;
    float _3070 = in.m_75.y;
    float _3072 = in.m_75.z;
    float _3074 = _1825 * _2049;
    float _3076 = _1825 * _2061;
    float _3078 = fma(_1857, _2019, _3066);
    float _3080 = exp2(_3064);
    float _3082 = _1869 * _2049;
    float _3084 = fma(_1857, _2017, _3074);
    float _3086 = fma(_1855, _1899, _3078);
    float _3088 = fma(_1857, _2015, _3076);
    float _3090 = fma(_1865, _2017, _3082);
    float _3092 = fma(_1855, _1893, _3084);
    float _3094 = -_3050;
    float _3096 = _3094 + 1.0;
    float _3098 = fma(_1855, _1901, _3088);
    float _3100 = fma(_1827, _1893, _3090);
    float _3102 = _3096 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3104 = fma(_3080, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3106 = precise::clamp(_3104, 0.0, 1.0);
    float _3108 = _1869 * _2061;
    float _3110 = fma(_3106, -2.0, 3.0);
    float _3112 = _3106 * _3106;
    float _3114 = _3070;
    float _3116 = _3068;
    float _3118 = _3072;
    if (!_3048)
    {
        float _3120 = fma(_1833, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3070);
        _3114 = _3120;
    }
    float _3122 = _3114;
    float _3124 = _1859 * _2035;
    if (!_3048)
    {
        float _3126 = fma(_1831, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3068);
        _3116 = _3126;
    }
    float _3128 = _3116;
    float _3130 = _3112 * _3110;
    float _3132 = _1859 * _2049;
    float _3134 = -_1807;
    float _3136 = fma(_3134, _2019, _3124);
    float _3138 = _1859 * _2061;
    float _3140 = -_3130;
    float _3142 = _3140 + 1.0;
    float _3144 = -_1807;
    float _3146 = fma(_3144, _2017, _3132);
    float _3148 = fma(_1863, _1899, _3136);
    float _3150 = _1869 * _2035;
    float _3152 = fma(_3142, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3130);
    float _3154 = _2905 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3156 = _3148 * _3122;
    float _3158 = fma(_1863, _1893, _3146);
    float _3160 = _3062 * _3152;
    float _3162 = fma(_2913, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3154);
    float _3164 = fma(_3086, _3128, _3156);
    float _3166 = _3158 * _3122;
    float _3168 = in.m_77.x;
    float _3170 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3162);
    float _3172 = -_1807;
    float _3174 = fma(_3172, _2015, _3138);
    float _3176 = fma(_3092, _3128, _3166);
    float _3178 = _3160 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3180 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3170);
    float _3182 = fma(_1865, _2019, _3150);
    float _3184 = fma(_1863, _1901, _3174);
    if (!_3048)
    {
        float _3186 = fma(_1835, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3072);
        _3118 = _3186;
    }
    float _3188 = _3118;
    float _3190 = _3180 + _2941;
    float _3192 = fma(_1827, _1899, _3182);
    float _3194 = fma(_1865, _2015, _3108);
    float _3196 = _3184 * _3122;
    float _3198 = _3190 * 0.5;
    float _3200 = fma(_3192, _3188, _3164);
    float _3202 = fma(_1827, _1901, _3194);
    float _3204 = fma(_3098, _3128, _3196);
    float _3206 = -_3102;
    float _3208 = _3206 + 1.0;
    float _3210 = fma(_3100, _3188, _3176);
    float _3212 = fma(_3202, _3188, _3204);
    bool _3214 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3216 = isnan(_2687);
    bool _3218 = _3214 || _3216;
    bool _3220 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3222 = _3218 || _3220;
    out.gl_Position.x = _2957;
    out.gl_Position.y = _2987;
    out.gl_Position.z = _3180;
    out.gl_Position.w = _2941;
    out.m_79.x = _3210;
    out.m_79.y = _3200;
    out.m_79.z = _3212;
    out.m_81.z = _3198;
    out.m_81.w = _2941;
    float _3224 = _3204;
    float _3226 = _2941;
    float _3228 = _3198;
    if (!_3222)
    {
        _3224 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3230 = _3224;
    float _3232 = _3230;
    float _3234 = _3230;
    if (!_3222)
    {
        _3226 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3236 = _3226;
    float _3238 = _3236;
    float _3240 = _3236;
    if (!_3222)
    {
        _3228 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3242 = _3228;
    float _3244 = -_2975;
    float _3246 = _3244 + 1.0;
    float _3248 = _3246 * _3178;
    float _3250 = precise::clamp(_3248, 0.0, 1.0);
    float _3252 = -_3250;
    float _3254 = fma(_3252, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3256 = _3254 * _3168;
    float _3258 = _3168;
    float _3260 = _3242;
    float _3262 = _3242;
    if (!_3222)
    {
        _3258 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3264 = _3258;
    float _3266 = _3256 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3268 = _3102 * _3001;
    float _3270 = _3012 * _3208;
    float _3272 = _2607 * _2665;
    out.m_83.x = _3266;
    float _3274 = _3012 * _3268;
    float _3276 = _3022 * _3268;
    float _3278 = _3272 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3280 = _3272;
    float _3282 = _3274;
    float _3284 = _3264;
    float _3286 = _3264;
    if (!_3222)
    {
        _3280 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3288 = _3280;
    float _3290 = fma(_3018, _3274, _3006);
    float _3292 = fma(_3020, _3274, _3008);
    float _3294 = fma(_3012, _3276, _3010);
    float _3296 = _3288;
    float _3298 = _3288;
    if (!_3222)
    {
        _3282 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3300 = _3282;
    out.m_85.x = _3290;
    out.m_85.y = _3292;
    out.m_85.z = _3294;
    out.m_85.w = _3270;
    bool _3302 = !_3222;
    float _3304 = _3300;
    float _3306 = _3300;
    if (!_3302)
    {
        bool _3308 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3310 = isnan(_2687);
        bool _3312 = _3308 || _3310;
        bool _3314 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3316 = _3312 || _3314;
        if (!_3316)
        {
            float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3320 = _2687 + _3318;
            float _3322 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3324 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3322;
            float _3326 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3328 = _3326 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3330 = 1.0 / _3324;
            float _3332 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3334 = _3332 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3336 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3338 = _3336 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3340 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3342 = _3340 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3344 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3346 = _3344 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3348 = _3320 * _3330;
            float _3350 = precise::clamp(_3348, 0.0, 1.0);
            float _3352 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3354 = _3352 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3356 = fma(_3350, _3328, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3358 = fma(_3350, _3354, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3360 = fma(_3350, _3334, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3362 = fma(_3350, _3338, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3364 = fma(_3350, _3342, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3366 = fma(_3350, _3346, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3262 = _3360;
            _3306 = _3364;
            _3240 = _3356;
            _3234 = _3362;
            _3286 = _3358;
            _3298 = _3366;
            _3368 = true;
        }
        else
        {
            bool _3370 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3372 = isnan(_2687);
            bool _3374 = _3370 || _3372;
            bool _3376 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3378 = _3374 || _3376;
            if (!_3378)
            {
                _3238 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3380 = _3238;
            _3240 = _3380;
            if (!_3378)
            {
                _3260 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3382 = _3260;
            _3262 = _3382;
            if (!_3378)
            {
                _3284 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3384 = _3284;
            _3286 = _3384;
            if (!_3378)
            {
                _3232 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3386 = _3232;
            _3234 = _3386;
            if (!_3378)
            {
                _3304 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3388 = _3304;
            _3306 = _3388;
            if (!_3378)
            {
                _3296 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3390 = _3296;
            bool _3392 = !_3378;
            _3298 = _3390;
            if (!_3392)
            {
                bool _3394 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3396 = isnan(_2687);
                bool _3398 = _3394 || _3396;
                bool _3400 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3402 = _3398 || _3400;
                if (!_3402)
                {
                    float _3404 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3406 = _2687 + _3404;
                    float _3408 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3410 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3408;
                    float _3412 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3414 = _3412 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3416 = 1.0 / _3410;
                    float _3418 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3420 = _3418 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3422 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3424 = _3422 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3426 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3428 = _3426 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3430 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3432 = _3430 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3434 = _3406 * _3416;
                    float _3436 = precise::clamp(_3434, 0.0, 1.0);
                    float _3438 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3440 = _3438 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3442 = fma(_3436, _3414, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3444 = fma(_3436, _3440, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3446 = fma(_3436, _3420, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3448 = fma(_3436, _3424, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3450 = fma(_3436, _3428, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3452 = fma(_3436, _3432, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3262 = _3446;
                    _3306 = _3450;
                    _3240 = _3442;
                    _3234 = _3448;
                    _3286 = _3444;
                    _3298 = _3452;
                    _3368 = true;
                }
                else
                {
                    _3262 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3306 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3240 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3234 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3286 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3298 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3368 = false;
    float _3454 = _3262;
    float _3456 = _3306;
    float _3458 = _3240;
    float _3460 = _3234;
    float _3462 = _3286;
    float _3464 = _3298;
    float _3466 = fma(_3200, -0.5, 0.5);
    float _3468 = precise::clamp(_3466, 0.0, 1.0);
    float _3470 = -_3454;
    float _3472 = _3470 + _3456;
    float _3474 = _3278 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3476 = -_3458;
    float _3478 = _3476 + _3460;
    float _3480 = fma(_3468, _3472, _3454);
    out.m_87.x = 0.0;
    float _3482 = -_3462;
    float _3484 = _3482 + _3464;
    float _3486 = fma(_3468, _3478, _3458);
    float _3488 = _3480 * 0.586610972881317138671875;
    out.m_49.x = _3474;
    bool _3490 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3492 = fma(_3468, _3484, _3462);
    float _3494 = fma(_3486, 0.298911988735198974609375, _3488);
    bool _3496 = _2607 > 0.0;
    bool _3498 = isnan(_2607);
    bool _3500 = _3496 || _3498;
    bool _3502 = isnan(0.0);
    bool _3504 = _3500 || _3502;
    float _3506 = fma(_3492, 0.114477999508380889892578125, _3494);
    bool _3508 = _2665 <= 0.0;
    bool _3510 = !_3504;
    bool _3512 = _3508 || _3510;
    float _3514 = -_3506;
    float _3516 = _3486 + _3514;
    float _3518 = -_3506;
    float _3520 = _3480 + _3518;
    float _3522 = -_3506;
    float _3524 = _3492 + _3522;
    float _3526 = fma(_3516, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3506);
    float _3528 = fma(_3520, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3506);
    float _3530 = fma(_3524, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3506);
    bool _3532 = !_3490;
    if (!_3532)
    {
        float _3534 = -_2541;
        float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3538 = -_2543;
        float _3540 = _3538 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3542 = -_2545;
        float _3544 = _3542 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3546 = _3536 * _3536;
        float _3548 = fma(_3540, _3540, _3546);
        float _3550 = fma(_3544, _3544, _3548);
        float _3552 = sqrt(_3550);
        float _3554 = rsqrt(_3550);
        float _3556 = -_3552;
        float _3558 = _3556 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3560 = _3558 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3562 = precise::clamp(_3560, 0.0, 1.0);
        float _3564 = _3540 * _3554;
        float _3566 = _3536 * _3554;
        float _3568 = abs(_3562);
        float _3570 = log2(_3568);
        float _3572 = _3544 * _3554;
        float _3574 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3576 = _3200 * _3566;
        float _3578 = -_3566;
        float _3580 = -_3574;
        float _3582 = fma(_3578, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3580);
        float _3584 = fma(_3210, _3564, _3576);
        float _3586 = -_3572;
        float _3588 = fma(_3586, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3582);
        float _3590 = fma(_3212, _3572, _3584);
        float _3592 = precise::clamp(_3590, 0.0, 1.0);
        float _3594 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3596 = _3588 + _3594;
        float _3598 = _3570 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3600 = _3596 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3602 = precise::clamp(_3600, 0.0, 1.0);
        float _3604 = exp2(_3598);
        float _3606 = _3604 * _3602;
        float _3608 = _3592 * _3606;
        float _3610 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3612 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3614 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3610;
        out.m_87.y = _3612;
        out.m_87.z = _3614;
    }
    out.m_89.x = _3526;
    out.m_89.y = _3528;
    out.m_89.z = _3530;
    if (!_3512)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3616 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3616;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3368 = false;
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
        float _3672 = as_type<float>(_122);
        out.gl_Position.z = _3672;
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
        float _3737 = as_type<float>(_158);
        out.gl_Position.z = _3737;
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
    float _192 = _186;
    float _210;
    if (!_190)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
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
    float _280 = _272 * _260;
    float _282 = fma(_276, _266, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = _278 * _260;
    float _286 = _282 * _260;
    float _288 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].x, _280);
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
        float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
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
    bool _334 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _336 = isnan(_322);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _346;
    bool _350 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _352 = isnan(_322);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _364 = 1.0 / _348;
    float _366 = _296 * _326;
    float _368 = _332 * _364;
    float _370 = _298 * _328;
    float _372 = -_344;
    float _374 = _372 + 1.0;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _376;
    float _380 = _294 * _324;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _386;
    float _390 = _360 * _374;
    float _392 = fma(_378, _368, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _394 = fma(_384, _368, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _396 = fma(_388, _368, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _398 = -_360;
    float _400 = _398 + 1.0;
    float _402 = _392 * _390;
    float _404 = _394 * _390;
    float _406 = _396 * _390;
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _402);
    float _410 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _404);
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _406);
    float _414 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[108].y, _408);
    float _416 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[108].x, _410);
    float _418 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[108].z, _412);
    bool _420 = !_362;
    float _438;
    if (!_420)
    {
        float _422 = in.m_55.x;
        float _424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _426 = _422 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _428 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
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
    float _448 = in.m_59.y;
    float _450 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _454 = int(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _464 = float(_446);
    float _466 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _468 = log2(_466);
    float _470 = float(uint(_454));
    float _472 = 1.0 / _464;
    int _474 = ~_454;
    int _476 = _474 + 1;
    bool _478 = _454 == 0;
    float _480 = 1.0 / _470;
    float _482 = _468 * _132;
    float _484 = _472 * _132;
    float _486 = exp2(_482);
    int _488 = as_type<int>(_480) + (-2);
    float _490 = trunc(_484);
    int _492 = int(_490);
    float _494 = float(_454);
    float _496 = -_486;
    float _498 = _496 + 1.0;
    float _500 = float(uint(_492));
    float _502 = as_type<float>(_488) * _500;
    float _504 = trunc(_502);
    float _506 = precise::max(_504, 0.0);
    uint _509 = uint(_506);
    int _511 = ~_454;
    int _513 = _511 + 1;
    int _515 = _476 * int(_509);
    int _517 = _515 + _492;
    float _519 = in.m_55.x;
    float _521 = in.m_55.y;
    float _523 = float(uint(_517));
    float _525 = as_type<float>(_488) * _523;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _529 = _527 != 0;
    float _531 = trunc(_525);
    float _533 = precise::max(_531, 0.0);
    uint _535 = uint(_533);
    bool _537 = !_529;
    float _539 = _537 ? 7.345489978790283203125 : 1.0;
    float _541 = _539 * _519;
    float _543 = _519 * 2.0;
    float _545 = floor(_541);
    int _547 = int(_509) + int(_535);
    float _549 = float(_492);
    int _551 = _513 * _547;
    int _553 = _551 + _492;
    bool _555 = _549 >= _494;
    bool _557 = isnan(_549);
    bool _559 = _555 || _557;
    bool _561 = isnan(_494);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = floor(_543);
    bool _569 = uint(_553) >= uint(_454);
    bool _571 = !_569;
    int _573 = _571 ? 0 : (-1);
    float _575 = trunc(_565);
    int _577 = int(_575);
    float _579 = -_545;
    float _581 = _541 + _579;
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _585 = _583 != 0;
    int _587 = ~_547;
    int _589 = _587 + _573;
    int _591 = _589 + 1;
    float _593 = _581 * _494;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _597 = _595 != 0;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _601 = _599 != 0;
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _609 = _607 != 0;
    int _611 = _454 * _591;
    int _613 = _611 + _492;
    float _615 = trunc(_593);
    int _617 = int(_615);
    bool _619 = !_478;
    int _621 = _619 ? _613 : (-1);
    int _623 = ~_577;
    int _625 = _623 + 1;
    int _627 = _625 + 1;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _631 = _629 != 0;
    int _633 = _621 * _627;
    float _635 = _494 * _132;
    int _637 = _454 + (-1);
    bool _639 = !_585;
    int _641 = _639 ? 0 : 1;
    float _643 = _635 * _166;
    bool _645 = !_601;
    int _647 = _645 ? 0 : 1;
    int _649 = _577 * _637;
    int _651 = _649 + _633;
    bool _653 = !_597;
    int _655 = _653 ? 0 : 1;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _659 = _657 != 0;
    float _661 = trunc(_643);
    int _663 = int(_661);
    int _665 = abs(_647);
    bool _667 = !_605;
    int _669 = _667 ? 0 : 1;
    int _671 = abs(_641);
    int _673 = abs(_655);
    bool _675 = !_659;
    int _677 = _675 ? 0 : 1;
    int _679 = _617 * _671;
    int _681 = _679 + _492;
    int _683 = abs(_669);
    int _685 = _651 * _665;
    int _687 = abs(_677);
    int _689 = _663 * _673;
    int _691 = _689 + _685;
    float _693 = in.m_61.y;
    int _695 = ~_454;
    int _697 = _695 + 1;
    int _699 = _681 * _683;
    int _701 = _699 + _691;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _705 = _703 != 0;
    float _707 = in.m_61.x;
    int _709 = _617 * _687;
    int _711 = _709 + _701;
    int _713 = ~_454;
    int _715 = _713 + 1;
    float _717 = in.m_61.w;
    bool _719 = _521 > 0.5;
    float _721 = float(uint(_711));
    bool _723 = _454 == 0;
    float _725 = as_type<float>(_488) * _721;
    float _727 = 0.0;
    float _729 = _448;
    if (_705)
    {
        float _731 = in.m_55.x;
        _727 = _731;
    }
    float _733 = _727;
    float _735 = trunc(_725);
    float _737 = precise::max(_735, 0.0);
    uint _739 = uint(_737);
    out.m_63.y = _693;
    out.m_63.x = _707;
    out.m_63.w = _717;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _743 = -_448;
    float _745 = _743 + 1.0;
    int _747 = _715 * int(_739);
    int _749 = _747 + _711;
    float _751 = _521 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_631)
    {
        float _753 = _719 ? _745 : _448;
        _729 = _753;
    }
    float _755 = _729;
    float _757 = float(uint(_749));
    float _759 = fma(_751, -2.0, _741);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _765 = float(uint(_681));
    float _767 = as_type<float>(_488) * _757;
    float _769 = in.m_61.z;
    bool _771 = _733 > 0.5;
    bool _773 = _771 && _705;
    float _775 = _521 * 2.0;
    float _777 = trunc(_767);
    float _779 = precise::max(_777, 0.0);
    uint _781 = uint(_779);
    float _783 = floor(_775);
    int _785 = int(_739) + int(_781);
    float _787 = in.m_46.x;
    float _789 = in.m_46.y;
    float _791 = in.m_46.z;
    int _793 = _697 * _785;
    int _795 = _793 + _711;
    out.m_63.z = _769;
    bool _797 = uint(_795) >= uint(_454);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _801 = !_797;
    int _803 = _801 ? 0 : (-1);
    float _805 = _519 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _807 = ~_785;
    int _809 = _807 + _803;
    int _811 = _809 + 1;
    float _813 = -_799;
    float _815 = fma(_805, 2.0, _813);
    float _817 = as_type<float>(_488) * _765;
    float _819 = 1.0 / _763;
    int _821 = _454 * _811;
    int _823 = _821 + _711;
    float _825 = _789 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _827 = _789 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _829 = !_723;
    int _831 = _829 ? _823 : (-1);
    float _833 = trunc(_817);
    float _835 = precise::max(_833, 0.0);
    uint _837 = uint(_835);
    float _839 = _789 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _845 = _831 >> 31;
    float _847 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[4].x, _825);
    float _849 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[5].x, _827);
    float _851 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[6].x, _839);
    int _853 = _845 & 3;
    float _855 = _458 * _819;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _861 = ~_454;
    int _863 = _861 + 1;
    float _865 = 1.0 / _843;
    int _867 = _831 + _853;
    float _869 = in.m_55.z;
    int _871 = _831 & 3;
    bool _873 = _871 != 0;
    int _875 = _867 >> 2;
    float _877 = 1.0 / _859;
    int _879 = _875 << 4;
    int _881 = _879 + 368;
    int _883 = _863 * int(_837);
    int _885 = _883 + _681;
    int _887 = _831 & 3;
    bool _889 = _887 != 0;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _891;
    uint _895 = uint(int(uint(_881) >> uint(2)));
    uint _897 = uint(int(uint(int(_895)) >> uint(2)));
    int _899 = int(_895) & 3;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[int(_897)][_899];
    int _903 = int(_895) + 1;
    uint _905 = uint(int(uint(_903) >> uint(2)));
    int _907 = _903 & 3;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[int(_905)][_907];
    float _911 = float(uint(_885));
    float _913 = _462 * _865;
    bool _915 = uint(_887) > 1u;
    int _917 = _873 ? 0 : 1;
    float _919 = as_type<float>(_488) * _911;
    int _921 = _881 + 8;
    uint _923 = uint(int(uint(_921) >> uint(2)));
    uint _925 = uint(int(uint(int(_923)) >> uint(2)));
    int _927 = int(_923) & 3;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[int(_925)][_927];
    int _931 = int(_923) + 1;
    uint _933 = uint(int(uint(_931) >> uint(2)));
    int _935 = _931 & 3;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[int(_933)][_935];
    float _939 = _521 + _519;
    bool _941 = _887 != 3;
    float _943 = trunc(_919);
    float _945 = precise::max(_943, 0.0);
    uint _947 = uint(_945);
    float _949 = _893 * _877;
    int _951 = ~_917;
    int _953 = _951 + 1;
    int _955 = _953 + 1;
    int _957 = ~_454;
    int _959 = _957 + 1;
    int _961 = _955;
    float _963 = _755;
    if (!_915)
    {
        int _965 = ~_917;
        int _967 = _965 + 1;
        _961 = _967;
    }
    int _969 = _961;
    float _971 = _939 + (-1.0);
    bool _973 = uint(_887) >= 2u;
    float _975 = _521 + _869;
    bool _977 = !_889;
    int _979 = _977 ? 0 : 1;
    float _981 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _983 = abs(_969);
    float _985 = _975 + (-1.0);
    int _987 = _973 ? 0 : 1;
    int _989 = int(_837) + int(_947);
    float _991 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _993 = abs(_979);
    int _995 = _959 * _989;
    int _997 = _995 + _681;
    bool _999 = _567 > 0.0;
    float _1001 = in.m_59.x;
    bool _1003 = _567 >= 0.0;
    bool _1005 = isnan(_567);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan(0.0);
    bool _1011 = _1007 || _1009;
    int _1013 = ~_987;
    int _1015 = _1013 + 1;
    int _1017 = _1015 + 1;
    int _1019 = _1017;
    if (_941)
    {
        int _1021 = ~_987;
        int _1023 = _1021 + 1;
        _1019 = _1023;
    }
    int _1025 = _1019;
    bool _1027 = _887 != 3;
    int _1029 = ~_983;
    int _1031 = _1029 + 1;
    int _1033 = _1031 + 1;
    float _1035 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1037 = int(_1035);
    int _1039 = ~_993;
    int _1041 = _1039 + 1;
    int _1043 = _1041 + 1;
    int _1045 = abs(_1025);
    int _1047 = _1033 * as_type<int>(_909);
    bool _1049 = !_609;
    int _1051 = _1049 ? 0 : 1;
    bool _1053 = uint(_997) >= uint(_454);
    int _1055 = _1043 * as_type<int>(_901);
    int _1057 = _1055 + _1047;
    bool _1059 = !_1027;
    int _1061 = _1059 ? 0 : (-1);
    bool _1063 = !_1053;
    int _1065 = _1063 ? 0 : (-1);
    int _1067 = ~_1045;
    int _1069 = _1067 + 1;
    int _1071 = _1069 + 1;
    int _1073 = abs(_1061);
    int _1075 = ~_989;
    int _1077 = _1075 + _1065;
    int _1079 = _1077 + 1;
    int _1081 = _1071 * as_type<int>(_929);
    int _1083 = _1081 + _1057;
    float _1085 = _869 * 2.0;
    int _1087 = abs(_1037);
    int _1089 = abs(_1051);
    int _1091 = _454 * _1079;
    int _1093 = _1091 + _681;
    int _1095 = ~_1073;
    int _1097 = _1095 + 1;
    int _1099 = _1097 + 1;
    float _1101 = floor(_1085);
    float _1103 = float(uint(_1087));
    int _1105 = ~_1089;
    int _1107 = _1105 + 1;
    int _1109 = _1107 + 1;
    int _1111 = _1099 * as_type<int>(_937);
    int _1113 = _1111 + _1083;
    float _1115 = as_type<float>(_1025);
    float _1117 = _937;
    if (_705)
    {
        _1115 = _1001;
    }
    float _1119 = _1115;
    float _1121 = fma(_791, (*spvDescriptorSet0.vp_c10)._m0[6].z, _851);
    float _1123 = _1119;
    if (!_705)
    {
        _1117 = _1001;
    }
    float _1125 = _1117;
    int _1127 = _1113 * _1109;
    float _1129 = 1.0 / _1103;
    bool _1131 = !_723;
    int _1133 = _1131 ? _1093 : (-1);
    float _1135 = _1125;
    if (_773)
    {
        float _1137 = -_1119;
        float _1139 = _1137 + 1.0;
        _1123 = _1139;
    }
    float _1141 = _1123;
    bool _1143 = _783 > 0.0;
    float _1145 = fma(_791, (*spvDescriptorSet0.vp_c10)._m0[5].z, _849);
    bool _1147 = _783 >= 0.0;
    bool _1149 = isnan(_783);
    bool _1151 = _1147 || _1149;
    bool _1153 = isnan(0.0);
    bool _1155 = _1151 || _1153;
    int _1157 = _1133 * _1089;
    int _1159 = _1157 + _1127;
    float _1161 = float(uint(_1037));
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1165 = _442 + _1163;
    if (_705)
    {
        _1135 = _1141;
    }
    float _1167 = _1135;
    float _1169 = _1145 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1173 = _1171 != 0;
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1177 = _1175 != 0;
    int _1179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1181 = _1179 != 0;
    float _1183 = fma(_855, _1165, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1185 = _1011 ? 0 : 1;
    float _1187 = 1.0 / _1161;
    int _1189 = _1155 ? 0 : 1;
    float _1191 = _1121 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1193 = _1101 > 0.0;
    bool _1195 = _1101 >= 0.0;
    bool _1197 = isnan(_1101);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan(0.0);
    bool _1203 = _1199 || _1201;
    float _1205 = fma(_791, (*spvDescriptorSet0.vp_c10)._m0[4].z, _847);
    bool _1207 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1209 = isnan(_442);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    int _1219 = abs(_1159);
    float _1221 = _1205 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1223 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1225 = isnan(_442);
    bool _1227 = _1223 || _1225;
    bool _1229 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1231 = _1227 || _1229;
    float _1233 = float(_1231);
    int _1235 = as_type<int>(_1129) + (-2);
    float _1237 = -_1217;
    float _1239 = _1237 + 1.0;
    float _1241 = float(uint(_1219));
    float _1243 = -_1233;
    float _1245 = _1243 + 1.0;
    bool _1247 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1249 = isnan(_442);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1255 = _1251 || _1253;
    float _1257 = float(_1255);
    float _1259 = _1233 * _1239;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1263 = _442 + _1261;
    float _1265 = as_type<float>(_1235) * _1241;
    bool _1267 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1269 = isnan(_442);
    bool _1271 = _1267 || _1269;
    bool _1273 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1275 = _1271 || _1273;
    float _1277 = float(_1275);
    float _1279 = -_1257;
    float _1281 = _1279 + 1.0;
    float _1283 = fma(_913, _1263, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1287 = _442 + _1285;
    int _1289 = as_type<int>(_1187) + (-2);
    float _1291 = trunc(_1265);
    float _1293 = precise::max(_1291, 0.0);
    uint _1295 = uint(_1293);
    float _1297 = _1277 * _1281;
    float _1299 = float(uint(_1159));
    float _1301 = fma(_949, _1287, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _1303 = ~_1087;
    int _1305 = _1303 + 1;
    float _1307 = _1257 * _1245;
    float _1309 = as_type<float>(_1289) * _1299;
    int _1311 = ~_1037;
    int _1313 = _1311 + 1;
    float _1315 = _1183 * _1297;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1319 = !_1177;
    int _1321 = _1319 ? 0 : 1;
    float _1323 = trunc(_1309);
    float _1325 = precise::max(_1323, 0.0);
    uint _1327 = uint(_1325);
    bool _1329 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1331 = isnan(0.0);
    bool _1333 = _1329 || _1331;
    bool _1335 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1337 = _1333 || _1335;
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1341 = 1.0 + _1339;
    int _1343 = _1305 * int(_1295);
    int _1345 = _1343 + _1219;
    int _1347 = ~_1087;
    int _1349 = _1347 + 1;
    float _1351 = _1337 ? _498 : 0.0;
    float _1353 = float(uint(_1345));
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1357 = -_1277;
    float _1359 = _1357 + 1.0;
    float _1361 = 1.0 / _1341;
    bool _1363 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1365 = isnan(1.0);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1371 = _1367 || _1369;
    float _1373 = as_type<float>(_1235) * _1353;
    float _1375 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1317);
    float _1377 = -_132;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[76].x, _815);
    int _1381 = _1313 * int(_1327);
    int _1383 = _1381 + _1159;
    float _1385 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1315);
    float _1387 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1355);
    float _1389 = trunc(_1373);
    float _1391 = precise::max(_1389, 0.0);
    uint _1393 = uint(_1391);
    float _1395 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _759);
    float _1397 = float(uint(_1383));
    float _1399 = fma(_1283, _1307, _1385);
    int _1401 = _1203 ? 0 : 1;
    float _1403 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1375);
    int _1405 = ~_1189;
    int _1407 = _1405 + 1;
    int _1409 = _1407 + 1;
    float _1411 = as_type<float>(_1289) * _1397;
    int _1413 = ~_1185;
    int _1415 = _1413 + 1;
    int _1417 = _1415 + 1;
    float _1419 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1387);
    int _1421 = _1417;
    int _1423 = _1409;
    if (!_999)
    {
        int _1425 = ~_1185;
        int _1427 = _1425 + 1;
        _1421 = _1427;
    }
    int _1429 = _1421;
    float _1431 = trunc(_1411);
    float _1433 = precise::max(_1431, 0.0);
    uint _1435 = uint(_1433);
    int _1437 = abs(_1321);
    if (_1371)
    {
        float _1439 = _1351 * _1361;
        _152 = _1439;
    }
    float _1441 = _152;
    int _1443 = ~_1401;
    int _1445 = _1443 + 1;
    int _1447 = _1445 + 1;
    float _1449 = fma(_1301, _1259, _1399);
    float _1451 = float(_1429);
    float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1455 = _1191 + _1453;
    float _1457 = float(_1437);
    float _1459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1461 = int(_1295) + int(_1393);
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1465 = _1221 + _1463;
    int _1467 = _1447;
    if (!_1193)
    {
        int _1469 = ~_1401;
        int _1471 = _1469 + 1;
        _1467 = _1471;
    }
    int _1473 = _1467;
    float _1475 = _1457 * _1451;
    bool _1477 = !_1173;
    int _1479 = _1477 ? 0 : 1;
    int _1481 = _1349 * _1461;
    int _1483 = _1481 + _1219;
    int _1485 = ~_1037;
    int _1487 = _1485 + 1;
    float _1489 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1491 = _1169 + _1489;
    int _1493 = int(_1327) + int(_1435);
    float _1495 = _1475 * (-2.0);
    int _1497 = abs(_1479);
    float _1499 = _521 + (-0.5);
    float _1501 = float(_1473);
    int _1503 = _1487 * _1493;
    int _1505 = _1503 + _1159;
    if (!_1143)
    {
        int _1507 = ~_1189;
        int _1509 = _1507 + 1;
        _1423 = _1509;
    }
    int _1511 = _1423;
    float _1513 = in.m_65.x;
    float _1515 = in.m_65.y;
    float _1517 = in.m_65.z;
    float _1519 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1521 = float(_1497);
    float _1523 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1449);
    bool _1525 = uint(_1505) >= uint(_1037);
    float _1527 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1519);
    bool _1529 = uint(_1483) >= uint(_1087);
    float _1531 = _1521 * _1501;
    bool _1533 = !_1525;
    int _1535 = _1533 ? 0 : (-1);
    float _1537 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1527);
    int _1539 = _1159 ^ _1037;
    float _1541 = _1491 * _1491;
    bool _1543 = !_1529;
    int _1545 = _1543 ? 0 : (-1);
    int _1547 = ~_1493;
    int _1549 = _1547 + _1535;
    int _1551 = _1549 + 1;
    bool _1553 = _1537 >= 0.0;
    float _1555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _1557 = uint(int(uint(_1539) >> uint(31)));
    int _1559 = _1037 * _1551;
    int _1561 = _1559 + _1159;
    int _1563 = ~_1545;
    int _1565 = _1461 + _1563;
    int _1567 = _1565 + 1;
    float _1569 = _1531 * (-2.0);
    bool _1571 = _1037 == 0;
    float _1573 = _1459 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1575 = ~int(_1557);
    int _1577 = _1575 + 1;
    float _1579 = fma(_981, _1569, _981);
    bool _1581 = !_1571;
    int _1583 = _1581 ? _1561 : (-1);
    float _1585 = fma(_1573, _1167, -0.5);
    bool _1587 = _1037 == 0;
    float _1589 = fma(_1569, _1513, _1513);
    int _1591 = _1567 ^ _1577;
    float _1593 = _1517;
    if (_1553)
    {
        out.m_49.x = 0.0;
    }
    float _1595 = float(_1583);
    float _1597 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1599 = ~_1577;
    int _1601 = _1599 + _1591;
    int _1603 = _1601 + 1;
    float _1605 = fma(_991, _1495, _991);
    float _1607 = fma(_1495, _1515, _1515);
    float _1609 = fma(_1573, _1595, _1379);
    float _1611 = _519 + (-0.5);
    bool _1613 = !_1587;
    int _1615 = _1613 ? _1603 : (-1);
    float _1617 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1607);
    float _1619 = fma(_1403, _1585, _1609);
    float _1621 = fma(_1611, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1589);
    float _1623 = float(_1615);
    float _1625 = fma(_1597, _755, -0.5);
    float _1627 = _1619 + 0.5;
    float _1629 = fma(_1605, _1441, _1617);
    float _1631 = fma(_1465, _1465, _1541);
    float _1633 = -_1395;
    float _1635 = fma(_1597, _1623, _1633);
    int _1637 = as_type<int>(_1625);
    if (_1553)
    {
        _963 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1639 = _963;
    float _1641 = fma(_1579, _1441, _1621);
    float _1643 = fma(_1455, _1455, _1631);
    float _1645 = _869 + _519;
    float _1647 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1649 = fma(_1419, _1625, _1635);
    float _1651 = rsqrt(_1643);
    if (_1553)
    {
        float _1653 = _1639 * 5.0;
        _1637 = as_type<int>(_1653);
    }
    int _1655 = _1637;
    float _1657 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1659 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1553)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5958 = as_type<float>(_1655);
        out.gl_Position.z = _5958;
    }
    float _1665 = _1649 + 0.5;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1669 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1671 = _1661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1673 = _1663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1627;
    out.m_67.y = _1665;
    float _1675 = _1491 * _1651;
    float _1677 = _1465 * _1651;
    out.m_69.x = _1669;
    out.m_69.y = _1671;
    out.m_69.z = _1673;
    out.m_69.w = _1667;
    float _1679 = _450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1681 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1683 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1685 = _1523 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1687 = !_1181;
    int _1689 = _1687 ? 0 : 1;
    out.m_71.x = _1679;
    out.m_71.y = _1681;
    out.m_71.z = _1683;
    out.m_71.w = _1685;
    int _1691 = abs(_1689);
    float _1693 = _1675;
    if (_1553)
    {
        return out;
    }
    float _1695 = -_1675;
    float _1697 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1169);
    float _1699 = _1455 * _1651;
    float _1701 = -_1677;
    float _1703 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1221);
    float _1705 = float(_1511);
    float _1707 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1709 = _1697 + _1707;
    float _1711 = float(_1691);
    float _1713 = -_1699;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1191);
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1719 = _1703 + _1717;
    float _1721 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1723 = _1645 + (-1.0);
    float _1725 = _1711 * _1705;
    float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1729 = _1715 + _1727;
    float _1731 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1721);
    float _1733 = fma(_1723, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1735 = _1725 * (-2.0);
    float _1737 = -_1675;
    float _1739 = fma(_1737, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1491);
    float _1741 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1731);
    float _1743 = _869 + (-0.5);
    float _1745 = fma(_1733, _1735, _1733);
    float _1747 = fma(_1735, _1517, _1517);
    float _1749 = _1629 * 0.15915493667125701904296875;
    bool _1751 = _1741 >= 0.0;
    float _1753 = -_1677;
    float _1755 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1465);
    float _1757 = _1739 * _1739;
    float _1759 = fma(_1743, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1747);
    float _1761 = -_1699;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1455);
    float _1765 = _1641 * 0.15915493667125701904296875;
    float _1767 = fma(_1755, _1755, _1757);
    float _1769 = fma(_1745, _1441, _1759);
    float _1771 = _1749 * 6.283185482025146484375;
    float _1773 = sin(_1771);
    float _1775 = fma(_1763, _1763, _1767);
    float _1777 = _1769 * 0.15915493667125701904296875;
    float _1779 = _1699;
    float _1781 = _1719;
    if (_1751)
    {
        _1593 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1783 = _1593;
    int _1785 = as_type<int>(_1783);
    if (_1751)
    {
        out.m_49.x = 0.0;
    }
    float _1787 = _1765 * 6.283185482025146484375;
    float _1789 = sin(_1787);
    if (_1751)
    {
        float _1791 = _1783 * 5.0;
        _1785 = as_type<int>(_1791);
    }
    int _1793 = _1785;
    if (_1751)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6204 = as_type<float>(_1793);
        out.gl_Position.z = _6204;
    }
    float _1795 = _1765 * 6.283185482025146484375;
    float _1797 = cos(_1795);
    float _1799 = _1749 * 6.283185482025146484375;
    float _1801 = cos(_1799);
    float _1803 = sqrt(_1775);
    float _1805 = _1777 * 6.283185482025146484375;
    float _1807 = sin(_1805);
    if (_1751)
    {
        return out;
    }
    float _1809 = _1789 * _1773;
    float _1811 = _1797 * _1801;
    float _1813 = _1777 * 6.283185482025146484375;
    float _1815 = cos(_1813);
    float _1817 = -_1169;
    float _1819 = _1817 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1821 = -_1221;
    float _1823 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1825 = fma(_1807, _1811, _1809);
    float _1827 = fma(_1807, _1809, _1811);
    float _1829 = _1819 * _1819;
    float _1831 = in.m_73.x;
    float _1833 = in.m_73.y;
    float _1835 = in.m_73.z;
    float _1837 = _1651 * _1803;
    float _1839 = -_1191;
    float _1841 = _1839 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1843 = fma(_1823, _1823, _1829);
    float _1845 = _1789 * _1801;
    float _1847 = _1797 * _1773;
    float _1849 = fma(_1841, _1841, _1843);
    float _1851 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1853 = -_1847;
    float _1855 = fma(_1807, _1845, _1853);
    float _1857 = _1801 * _1815;
    float _1859 = _1797 * _1815;
    float _1861 = rsqrt(_1849);
    float _1863 = _1789 * _1815;
    float _1865 = _1773 * _1815;
    float _1867 = -_1845;
    float _1869 = fma(_1807, _1847, _1867);
    float _1871 = _380 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1873 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1875 = _1837 * _1871;
    float _1877 = _1837 * _1851;
    float _1879 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1831);
    float _1881 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1873);
    float _1883 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1833);
    float _1885 = sqrt(_1849);
    float _1887 = _1879 * _1875;
    float _1889 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1891 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1881);
    float _1893 = _1823 * _1861;
    float _1895 = _1883 * _1877;
    float _1897 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1889);
    float _1899 = _1819 * _1861;
    float _1901 = _1841 * _1861;
    float _1903 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1905 = _1893 * _1903;
    float _1907 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1909 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1909;
    float _1913 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1897);
    float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1917 = _1901 * _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1921 = -_1905;
    float _1923 = fma(_1901, _1919, _1921);
    float _1925 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1927 = _1913 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1931 = _1899 * _1929;
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1935 = -_1917;
    float _1937 = fma(_1899, _1933, _1935);
    float _1939 = _1923 * _1923;
    float _1941 = -_1927;
    float _1943 = _1925 + _1941;
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1947 = -_1931;
    float _1949 = fma(_1893, _1945, _1947);
    float _1951 = 1.0 / _1911;
    float _1953 = fma(_1937, _1937, _1939);
    float _1955 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1957 = abs(_1943);
    float _1959 = precise::max(_1957, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1961 = fma(_1949, _1949, _1953);
    float _1963 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1955);
    float _1965 = precise::min(_1959, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1967 = rsqrt(_1961);
    float _1969 = _1837 * _1907;
    float _1971 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1963);
    bool _1973 = _1927 >= _1925;
    bool _1975 = isnan(_1927);
    bool _1977 = _1973 || _1975;
    bool _1979 = isnan(_1925);
    bool _1981 = _1977 || _1979;
    float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1985 = _1965 + _1983;
    float _1987 = -_1895;
    float _1989 = _1807 * _1987;
    float _1991 = _1863 * _1895;
    float _1993 = abs(_1885);
    float _1995 = precise::max(0.0, _1993);
    float _1997 = _1985 * _1951;
    float _1999 = _1859 * _1895;
    float _2001 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1835);
    float _2003 = rsqrt(_1971);
    float _2005 = precise::min(_1995, 40.0);
    float _2007 = fma(_1825, _1887, _1999);
    float _2009 = _2001 * _1969;
    bool _2011 = !_1981;
    float _2013 = _2011 ? 1.0 : (-1.0);
    float _2015 = _1949 * _1967;
    float _2017 = _1937 * _1967;
    float _2019 = _1923 * _1967;
    float _2021 = fma(_1855, _1887, _1991);
    float _2023 = _1893 * _2015;
    float _2025 = fma(_2005, -0.02500000037252902984619140625, 1.0);
    float _2027 = fma(_1857, _1887, _1989);
    float _2029 = fma(_1869, _2009, _2007);
    float _2031 = _1901 * _2019;
    float _2033 = -_2023;
    float _2035 = fma(_1901, _2017, _2033);
    float _2037 = _2013 * _1997;
    float _2039 = fma(_1827, _2009, _2021);
    float _2041 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2043 = fma(_1865, _2009, _2027);
    float _2045 = _1899 * _2017;
    float _2047 = -_2031;
    float _2049 = fma(_1899, _2015, _2047);
    float _2051 = _2035 * _2029;
    float _2053 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2055 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2057 = _2041 * _2041;
    float _2059 = -_2045;
    float _2061 = fma(_1893, _2019, _2059);
    float _2063 = _2049 * _2029;
    float _2065 = fma(_2019, _2043, _2051);
    float _2067 = _2053 * _2037;
    float _2069 = fma(_2055, _2055, _2057);
    float _2071 = _2061 * _2029;
    float _2073 = fma(_2017, _2043, _2063);
    float _2075 = fma(_1899, _2039, _2065);
    float _2077 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2079 = fma(_2015, _2043, _2071);
    float _2081 = fma(_1893, _2039, _2073);
    float _2083 = _1169 + _2075;
    float _2085 = fma(_2077, _2077, _2069);
    float _2087 = fma(_1901, _2039, _2079);
    float _2089 = _1221 + _2081;
    float _2091 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2093 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2095 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2097 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2099 = _2067 * 0.15915493667125701904296875;
    float _2101 = _1191 + _2087;
    float _2103 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2091);
    float _2105 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2093);
    float _2107 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2095);
    float _2109 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2097);
    float _2111 = rsqrt(_2085);
    float _2113 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2105);
    float _2115 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2107);
    float _2117 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2103);
    float _2119 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2109);
    float _2121 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2123 = _2115 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2125 = _2117 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2127 = _2099 * 6.283185482025146484375;
    float _2129 = cos(_2127);
    float _2131 = _2119 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2133 = _2123 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2135 = _2123 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2137 = _2123 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2139 = -_2121;
    float _2141 = _2139 + _2131;
    float _2143 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2133);
    float _2145 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2135);
    float _2147 = _2099 * 6.283185482025146484375;
    float _2149 = sin(_2147);
    float _2151 = fma(_2025, _2141, _2121);
    float _2153 = _2055 * _2111;
    float _2155 = _2041 * _2111;
    float _2157 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2137);
    float _2159 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2143);
    float _2161 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2145);
    float _2163 = -_2129;
    float _2165 = _2163 + 1.0;
    float _2167 = _2077 * _2111;
    float _2169 = _2159 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2171 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2157);
    float _2173 = _2155 * _2165;
    float _2175 = _2167 * _2167;
    float _2177 = _2153 * _2165;
    float _2179 = _2161 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2181 = _2153 * _2149;
    float _2183 = _2155 * _2149;
    float _2185 = _2167 * _2149;
    float _2187 = -_1169;
    float _2189 = _2187 + _2169;
    float _2191 = fma(_2167, _2173, _2181);
    float _2193 = fma(_2165, _2175, _2129);
    float _2195 = -_2185;
    float _2197 = fma(_2155, _2177, _2195);
    float _2199 = -_2183;
    float _2201 = fma(_2167, _2177, _2199);
    float _2203 = -_1221;
    float _2205 = _2203 + _2179;
    float _2207 = _2191 * _2189;
    float _2209 = _2171 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2213 = _2211 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2215 = _2197 * _2189;
    float _2217 = fma(_2153, _2177, _2129);
    float _2219 = fma(_2201, _2205, _2207);
    float _2221 = -_1191;
    float _2223 = _2221 + _2209;
    float _2225 = fma(_170, _2213, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2227 = fma(_2217, _2205, _2215);
    float _2229 = fma(_2167, _2177, _2183);
    float _2231 = fma(_2193, _2223, _2219);
    float _2233 = fma(_2155, _2173, _2129);
    float _2235 = fma(_2155, _2177, _2185);
    float _2237 = fma(_2229, _2223, _2227);
    float _2239 = fma(_2231, _2225, _1191);
    float _2241 = _2233 * _2189;
    float _2243 = -_2181;
    float _2245 = fma(_2167, _2173, _2243);
    float _2247 = fma(_2237, _2225, _1221);
    float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2251 = _2239 + _2249;
    float _2253 = fma(_2235, _2205, _2241);
    float _2255 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2259 = _2247 + _2257;
    float _2261 = _2251 * _2251;
    float _2263 = fma(_2245, _2223, _2253);
    float _2265 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2255);
    float _2267 = fma(_2259, _2259, _2261);
    float _2269 = _1169 + _2263;
    float _2271 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2265);
    float _2273 = sqrt(_2267);
    bool _2275 = _2273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2277 = _2263;
    float _2279 = _2255;
    float _2281 = _2239;
    if (!_2275)
    {
        _2277 = _2247;
    }
    float _2283 = _2277;
    float _2285 = _2283;
    if (!_2275)
    {
        _2279 = _2269;
    }
    float _2287 = _2279;
    bool _2289 = !_2275;
    float _2291 = _2287;
    if (!_2289)
    {
        float _2293 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2297 = _2273 + _2295;
        float _2299 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2301 = rsqrt(_2267);
        float _2303 = _2297 * _2293;
        float _2305 = _2303 * 0.15915493667125701904296875;
        float _2307 = _2305 * 6.283185482025146484375;
        float _2309 = cos(_2307);
        float _2311 = _2305 * 6.283185482025146484375;
        float _2313 = sin(_2311);
        float _2315 = _2309 + (-1.0);
        float _2317 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2319 = fma(_2313, _2299, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2321 = fma(_2269, _2309, _2317);
        float _2323 = _2301 * _2319;
        float _2325 = fma(_2259, _2323, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2327 = fma(_2251, _2323, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2291 = _2321;
        _2285 = _2325;
        _2281 = _2327;
    }
    float _2329 = _2291;
    float _2331 = _2285;
    float _2333 = _2281;
    float _2335 = -_1169;
    float _2337 = _2335 + _2329;
    float _2339 = -_1221;
    float _2341 = _2339 + _2331;
    float _2343 = _2271 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2345 = -_1191;
    float _2347 = _2345 + _2333;
    float _2349 = _2337 * _2337;
    float _2351 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2353 = 1.0 / _2343;
    float _2355 = fma(_2341, _2341, _2349);
    float _2357 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2351);
    float _2359 = fma(_2347, _2347, _2355);
    float _2361 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2357);
    float _2363 = sqrt(_2359);
    float _2365 = _2361 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2367 = _2365 + _2343;
    float _2369 = _2367 * _2353;
    float _2371 = _2369 * 0.5;
    bool _2373 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2375 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan(0.5);
    bool _2381 = _2377 || _2379;
    bool _2383 = _2363 > 0.0;
    float _2385 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2387 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2385);
    bool _2389 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2391 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2393 = _2389 || _2391;
    bool _2395 = isnan(0.5);
    bool _2397 = _2393 || _2395;
    float _2399 = 1.0 / _2387;
    bool _2401 = !_2383;
    float _2403 = _2331;
    float _2405 = _2329;
    float _2407 = _2333;
    float _2409 = _2347;
    if (!_2401)
    {
        float _2411 = _186 * _186;
        float _2413 = rsqrt(_2359);
        float _2415 = fma(_184, _184, _2411);
        float _2417 = fma(_188, _188, _2415);
        float _2419 = sqrt(_2417);
        float _2421 = _2337 * _2413;
        float _2423 = _2347 * _2413;
        bool _2425 = _2419 > 0.0;
        float _2427 = _2341 * _2413;
        bool _2429 = !_2425;
        if (!_2429)
        {
            float _2431 = rsqrt(_2417);
            float _2433 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2435 = _186 * _2431;
            float _2437 = _184 * _2431;
            float _2439 = _2421 * _2435;
            float _2441 = _188 * _2431;
            float _2443 = fma(_2427, _2437, _2439);
            float _2445 = _2433 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2447 = fma(_2423, _2441, _2443);
            float _2449 = _2447 * _2445;
            float _2451 = fma(_184, _2449, _2331);
            float _2453 = fma(_186, _2449, _2329);
            float _2455 = fma(_188, _2449, _2333);
            _2403 = _2451;
            _2405 = _2453;
            _2407 = _2455;
            _2409 = _2445;
        }
    }
    float _2457 = _2403;
    float _2459 = _2405;
    float _2461 = _2407;
    float _2463 = _2409;
    float _2465 = -_1677;
    float _2467 = fma(_2465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2457);
    float _2469 = -_1675;
    float _2471 = fma(_2469, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2459);
    float _2473 = -_1699;
    float _2475 = fma(_2473, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2461);
    float _2477 = _2467;
    float _2479 = _2475;
    float _2481 = _2463;
    if (_2397)
    {
        _1693 = 1.0;
    }
    float _2483 = _1693;
    float _2485 = _2483;
    if (_2381)
    {
        _1779 = _2467;
    }
    float _2487 = _1779;
    float _2489 = _2487;
    if (_2381)
    {
        _2477 = _2471;
    }
    float _2491 = _2477;
    float _2493 = _2491;
    if (!_2381)
    {
        float _2495 = _1709 * _1709;
        float _2497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2499 = -_1191;
        float _2501 = _2499 + _2461;
        float _2503 = -_1169;
        float _2505 = _2503 + _2459;
        float _2507 = fma(_1719, _1719, _2495);
        float _2509 = -_1221;
        float _2511 = _2509 + _2457;
        float _2513 = fma(_1729, _1729, _2507);
        float _2515 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2517 = sqrt(_2513);
        float _2519 = 1.0 / _1837;
        float _2521 = precise::min(_2517, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2523 = _2521 * _2497;
        float _2525 = _2515 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2527 = _2523 * _2519;
        float _2529 = _2525 * _2527;
        float _2531 = _2501 * _2527;
        float _2533 = fma(_2505, _2529, _1697);
        float _2535 = fma(_2511, _2529, _1703);
        float _2537 = fma(_2525, _2531, _1715);
        _192 = _2525;
        _2493 = _2533;
        _2489 = _2535;
        _2479 = _2537;
    }
    float _2539 = _192;
    float _2541 = _2493;
    float _2543 = _2489;
    float _2545 = _2479;
    float _2547 = _2539;
    if (_2397)
    {
        _1781 = 1.0;
    }
    float _2549 = _1781;
    float _2551 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2553 = _2399 * _2551;
    float _2555 = _2549;
    if (!_2397)
    {
        float _2557 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2559 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2561 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2559;
        float _2563 = _2557 * 0.15915493667125701904296875;
        float _2565 = _2563 * 6.283185482025146484375;
        float _2567 = cos(_2565);
        float _2569 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2571 = _2569 * 0.15915493667125701904296875;
        float _2573 = _2563 * 6.283185482025146484375;
        float _2575 = sin(_2573);
        float _2577 = 1.0 / _2567;
        float _2579 = _2571 * 6.283185482025146484375;
        float _2581 = cos(_2579);
        float _2583 = _2575 * _2577;
        float _2585 = _2571 * 6.283185482025146484375;
        float _2587 = sin(_2585);
        float _2589 = _2581 * _2583;
        float _2591 = 1.0 / _2561;
        float _2593 = 1.0 / _2589;
        float _2595 = _2587 * _2593;
        float _2597 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2599 = fma(_2553, _2595, _2597);
        float _2601 = _2599 * _2591;
        float _2603 = precise::clamp(_2601, 0.0, 1.0);
        _2547 = _2571;
        _2485 = _2603;
    }
    float _2605 = _2547;
    float _2607 = _2485;
    float _2609 = _2605;
    if (!_2397)
    {
        float _2611 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2613 = _2611 * 0.15915493667125701904296875;
        float _2615 = _2613 * 6.283185482025146484375;
        float _2617 = cos(_2615);
        float _2619 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2621 = _2619 * 0.15915493667125701904296875;
        float _2623 = _2613 * 6.283185482025146484375;
        float _2625 = sin(_2623);
        float _2627 = 1.0 / _2617;
        float _2629 = _2621 * 6.283185482025146484375;
        float _2631 = cos(_2629);
        float _2633 = _2625 * _2627;
        float _2635 = _2621 * 6.283185482025146484375;
        float _2637 = sin(_2635);
        float _2639 = _2631 * _2633;
        float _2641 = 1.0 / _2639;
        float _2643 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2645 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2643;
        float _2647 = 1.0 / _2645;
        float _2649 = _2637 * _2641;
        float _2651 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2653 = fma(_2553, _2649, _2651);
        float _2655 = _2653 * _2647;
        float _2657 = precise::clamp(_2655, 0.0, 1.0);
        float _2659 = -_2657;
        float _2661 = _2659 + 1.0;
        _2609 = _2617;
        _2555 = _2661;
    }
    float _2663 = _2609;
    float _2665 = _2555;
    float _2667 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2669 = _2541 + _2667;
    float _2671 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2673 = _2543 + _2671;
    float _2675 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2677 = _2545 + _2675;
    float _2679 = _2669 * _2669;
    float _2681 = fma(_2673, _2673, _2679);
    float _2683 = fma(_2677, _2677, _2681);
    float _2685 = rsqrt(_2683);
    float _2687 = sqrt(_2683);
    float _2689 = _2685 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2691 = _2673 * _2689;
    float _2693 = _2677 * _2689;
    float _2695 = _2691 * _2691;
    float _2697 = _2693 * _2693;
    float _2699 = _2695 + _2697;
    float _2701 = sqrt(_2699);
    bool _2703 = _2701 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2707 = _2701 + _2705;
    float _2709 = _2677;
    float _2711 = _2707;
    float _2713 = _2679;
    if (_2703)
    {
        float _2715 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2709 = _2715;
    }
    float _2717 = _2709;
    if (_2703)
    {
        float _2719 = _2707 * _2717;
        _2711 = _2719;
    }
    float _2721 = _2711;
    if (_2703)
    {
        float _2723 = _2721 * 0.15915493667125701904296875;
        _2713 = _2723;
    }
    float _2725 = _2713;
    float _2727 = _2685;
    float _2729 = _2725;
    if (_2703)
    {
        float _2731 = _2725 * 6.283185482025146484375;
        float _2733 = sin(_2731);
        _2727 = _2733;
    }
    float _2735 = _2727;
    float _2737 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2739 = precise::max(0.0, _2737);
    float _2741 = _2663;
    float _2743 = _2739;
    if (_2703)
    {
        float _2745 = _2725 * 6.283185482025146484375;
        float _2747 = cos(_2745);
        _2741 = _2747;
    }
    float _2749 = _2741;
    float _2751 = -_2689;
    float _2753 = -_2739;
    float _2755 = fma(_2669, _2751, _2753);
    float _2757 = _2737;
    float _2759 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2703)
    {
        float _2761 = rsqrt(_2699);
        _2757 = _2761;
    }
    float _2763 = _2757;
    if (_2703)
    {
        float _2765 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2743 = _2765;
    }
    float _2767 = _2743;
    float _2769 = fma(_1703, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2771 = _2767;
    if (!_2703)
    {
        _2729 = _2691;
    }
    float _2773 = _2729;
    float _2775 = _2735;
    float _2777 = _2773;
    if (_2703)
    {
        float _2779 = fma(_2735, _2767, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2771 = _2779;
    }
    float _2781 = _2771;
    float _2783 = _2781;
    if (!_2703)
    {
        _2775 = _2693;
    }
    float _2785 = _2775;
    float _2787 = _2785;
    float _2789 = _2749;
    if (_2703)
    {
        float _2791 = _2749 + (-1.0);
        _2759 = _2791;
    }
    float _2793 = _2759;
    float _2795 = _2793;
    if (_2703)
    {
        float _2797 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2795 = _2797;
    }
    float _2799 = _2795;
    float _2801 = _2763;
    if (_2703)
    {
        float _2803 = _2763 * _2781;
        _2481 = _2803;
    }
    float _2805 = _2481;
    if (!_2703)
    {
        _2801 = _2755;
    }
    float _2807 = _2801;
    float _2809 = _2807;
    if (_2703)
    {
        float _2811 = fma(_2755, _2749, _2799);
        _2809 = _2811;
    }
    float _2813 = _2809;
    if (!_2703)
    {
        _2783 = _2695;
    }
    float _2815 = _2783;
    float _2817 = _2815;
    if (_2703)
    {
        float _2819 = _2691 * _2805;
        _2777 = _2819;
    }
    float _2821 = _2777;
    if (_2703)
    {
        float _2823 = _2693 * _2805;
        _2787 = _2823;
    }
    float _2825 = _2787;
    if (!_2703)
    {
        _2789 = _2697;
    }
    float _2827 = _2789;
    float _2829 = floor(_2769);
    float _2831 = _2827;
    if (_2703)
    {
        float _2833 = _2821 * _2821;
        _2817 = _2833;
    }
    float _2835 = _2817;
    if (_2703)
    {
        float _2837 = _2825 * _2825;
        _2831 = _2837;
    }
    float _2839 = _2831;
    float _2841 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2843 = fma(_2813, _2813, _2835);
    float _2845 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2847 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2841);
    float _2849 = _2843 + _2839;
    float _2851 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2853 = fma(_2687, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2851);
    float _2855 = precise::clamp(_2853, 0.0, 1.0);
    float _2857 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2845);
    float _2859 = rsqrt(_2849);
    float _2861 = -_2855;
    float _2863 = _2861 + 1.0;
    float _2865 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2867 = fma(_1715, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2869 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2871 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2857);
    float _2873 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2847);
    float _2875 = -_2829;
    float _2877 = _2769 + _2875;
    float _2879 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2869);
    float _2881 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2883 = _2871 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2885 = abs(_2863);
    float _2887 = log2(_2885);
    float _2889 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2879);
    float _2891 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2881);
    float _2893 = _2883 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2895 = _2873 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2897 = _2859 * _2821;
    float _2899 = _2859 * _2813;
    float _2901 = _2859 * _2825;
    float _2903 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2891);
    float _2905 = _2889 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2907 = -_2893;
    float _2909 = fma(_2907, _2865, 1.0);
    float _2911 = _2897 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2913 = _2903 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2915 = _2905 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2917 = floor(_2867);
    float _2919 = -_2911;
    float _2921 = fma(_2899, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2919);
    float _2923 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2925 = fma(_2913, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2915);
    float _2927 = _2899 + 1.0;
    float _2929 = -_2901;
    float _2931 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2921);
    float _2933 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2925);
    float _2935 = exp2(_2923);
    float _2937 = fma(_2931, -0.5, 0.5);
    float _2939 = _2905 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2941 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2933);
    float _2943 = fma(_2931, 0.5, 0.5);
    float _2945 = fma(_2913, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2939);
    float _2947 = log2(_2909);
    float _2949 = -_2917;
    float _2951 = _2867 + _2949;
    float _2953 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2945);
    float _2955 = fma(_2943, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2957 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2953);
    float _2959 = fma(_2943, _2955, -0.212114393711090087890625);
    float _2961 = 1.0 / _2941;
    float _2963 = _2905 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2965 = -_2899;
    float _2967 = fma(_2935, _2927, _2965);
    float _2969 = sqrt(_2937);
    float _2971 = fma(_2913, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2963);
    float _2973 = _2947 * 0.693147182464599609375;
    float2 _8094 = float2(_2877, _2951);
    float _2975 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8094, float2(0.0), isnan(_8094)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8094, float2(0.0), isnan(_8094)), level(0.0)).x;
    float _2977 = fma(_2943, _2959, 1.570728778839111328125);
    float _2979 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2971);
    float _2981 = _2973 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2983 = fma(_2967, 0.5, 0.5);
    float _2985 = _2957 * _2961;
    float _2987 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2979);
    float _2989 = fma(_2985, 0.5, 0.5);
    float _2991 = _2987 * _2961;
    float _2993 = _2969 * 0.636619746685028076171875;
    float _2995 = fma(_2991, -0.5, 0.5);
    float _2997 = -_2977;
    float _2999 = fma(_2993, _2997, 1.0);
    float3 _8143 = float3(_2989, _2995, _2981);
    float _3001 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8143, float3(0.0), isnan(_8143)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8143, float3(0.0), isnan(_8143)), level(0.0)).x;
    float3 _8154 = float3(_2989, _2995, _2981);
    float4 _3004 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8154, float3(0.0), isnan(_8154)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8154, float3(0.0), isnan(_8154)), level(0.0)).xyzw;
    float _3006 = _3004.x;
    float _3008 = _3004.y;
    float _3010 = _3004.z;
    float _3012 = _3004.w;
    float2 _8170 = float2(_2999, _2983);
    float3 _3016 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8170, float2(0.0), isnan(_8170)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8170, float2(0.0), isnan(_8170)), level(0.0)).xyz;
    float _3018 = _3016.x;
    float _3020 = _3016.y;
    float _3022 = _3016.z;
    float _3024 = abs(_2553);
    float _3026 = log2(_3024);
    bool _3028 = _1833 != 0.0;
    bool _3030 = isnan(_1833);
    bool _3032 = _3028 || _3030;
    bool _3034 = isnan(0.0);
    bool _3036 = _3032 || _3034;
    out.m_71.x = _1679;
    out.m_71.y = _1681;
    out.m_71.z = _1683;
    out.m_71.w = _1685;
    float _3038 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3040 = _1831 == 0.0;
    bool _3042 = !_3036;
    bool _3044 = _3040 && _3042;
    out.m_69.x = _1669;
    out.m_69.y = _1671;
    out.m_69.z = _1673;
    out.m_69.w = _1667;
    bool _3046 = _1835 == 0.0;
    bool _3048 = _3046 && _3044;
    float _3050 = exp2(_3038);
    bool _3052 = _2553 <= 8000.0;
    bool _3054 = isnan(_2553);
    bool _3056 = _3052 || _3054;
    bool _3058 = isnan(8000.0);
    bool _3060 = _3056 || _3058;
    float _3062 = float(_3060);
    float _3064 = _3026 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3066 = _1825 * _2035;
    float _3068 = in.m_75.x;
    float _3070 = in.m_75.y;
    float _3072 = in.m_75.z;
    float _3074 = _1825 * _2049;
    float _3076 = _1825 * _2061;
    float _3078 = fma(_1857, _2019, _3066);
    float _3080 = exp2(_3064);
    float _3082 = _1869 * _2049;
    float _3084 = fma(_1857, _2017, _3074);
    float _3086 = fma(_1855, _1899, _3078);
    float _3088 = fma(_1857, _2015, _3076);
    float _3090 = fma(_1865, _2017, _3082);
    float _3092 = fma(_1855, _1893, _3084);
    float _3094 = -_3050;
    float _3096 = _3094 + 1.0;
    float _3098 = fma(_1855, _1901, _3088);
    float _3100 = fma(_1827, _1893, _3090);
    float _3102 = _3096 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3104 = fma(_3080, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3106 = precise::clamp(_3104, 0.0, 1.0);
    float _3108 = _1869 * _2061;
    float _3110 = fma(_3106, -2.0, 3.0);
    float _3112 = _3106 * _3106;
    float _3114 = _3070;
    float _3116 = _3068;
    float _3118 = _3072;
    if (!_3048)
    {
        float _3120 = fma(_1833, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3070);
        _3114 = _3120;
    }
    float _3122 = _3114;
    float _3124 = _1859 * _2035;
    if (!_3048)
    {
        float _3126 = fma(_1831, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3068);
        _3116 = _3126;
    }
    float _3128 = _3116;
    float _3130 = _3112 * _3110;
    float _3132 = _1859 * _2049;
    float _3134 = -_1807;
    float _3136 = fma(_3134, _2019, _3124);
    float _3138 = _1859 * _2061;
    float _3140 = -_3130;
    float _3142 = _3140 + 1.0;
    float _3144 = -_1807;
    float _3146 = fma(_3144, _2017, _3132);
    float _3148 = fma(_1863, _1899, _3136);
    float _3150 = _1869 * _2035;
    float _3152 = fma(_3142, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3130);
    float _3154 = _2905 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3156 = _3148 * _3122;
    float _3158 = fma(_1863, _1893, _3146);
    float _3160 = _3062 * _3152;
    float _3162 = fma(_2913, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3154);
    float _3164 = fma(_3086, _3128, _3156);
    float _3166 = _3158 * _3122;
    float _3168 = in.m_77.x;
    float _3170 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3162);
    float _3172 = -_1807;
    float _3174 = fma(_3172, _2015, _3138);
    float _3176 = fma(_3092, _3128, _3166);
    float _3178 = _3160 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3180 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3170);
    float _3182 = fma(_1865, _2019, _3150);
    float _3184 = fma(_1863, _1901, _3174);
    if (!_3048)
    {
        float _3186 = fma(_1835, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3072);
        _3118 = _3186;
    }
    float _3188 = _3118;
    float _3190 = _3180 + _2941;
    float _3192 = fma(_1827, _1899, _3182);
    float _3194 = fma(_1865, _2015, _3108);
    float _3196 = _3184 * _3122;
    float _3198 = _3190 * 0.5;
    float _3200 = fma(_3192, _3188, _3164);
    float _3202 = fma(_1827, _1901, _3194);
    float _3204 = fma(_3098, _3128, _3196);
    float _3206 = -_3102;
    float _3208 = _3206 + 1.0;
    float _3210 = fma(_3100, _3188, _3176);
    float _3212 = fma(_3202, _3188, _3204);
    bool _3214 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3216 = isnan(_2687);
    bool _3218 = _3214 || _3216;
    bool _3220 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3222 = _3218 || _3220;
    out.gl_Position.x = _2957;
    out.gl_Position.y = _2987;
    out.gl_Position.z = _3180;
    out.gl_Position.w = _2941;
    out.m_79.x = _3210;
    out.m_79.y = _3200;
    out.m_79.z = _3212;
    out.m_81.z = _3198;
    out.m_81.w = _2941;
    float _3224 = _3204;
    float _3226 = _2941;
    float _3228 = _3198;
    if (!_3222)
    {
        _3224 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3230 = _3224;
    float _3232 = _3230;
    float _3234 = _3230;
    if (!_3222)
    {
        _3226 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3236 = _3226;
    float _3238 = _3236;
    float _3240 = _3236;
    if (!_3222)
    {
        _3228 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3242 = _3228;
    float _3244 = -_2975;
    float _3246 = _3244 + 1.0;
    float _3248 = _3246 * _3178;
    float _3250 = precise::clamp(_3248, 0.0, 1.0);
    float _3252 = -_3250;
    float _3254 = fma(_3252, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3256 = _3254 * _3168;
    float _3258 = _3168;
    float _3260 = _3242;
    float _3262 = _3242;
    if (!_3222)
    {
        _3258 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3264 = _3258;
    float _3266 = _3256 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3268 = _3102 * _3001;
    float _3270 = _3012 * _3208;
    float _3272 = _2607 * _2665;
    out.m_83.x = _3266;
    float _3274 = _3012 * _3268;
    float _3276 = _3022 * _3268;
    float _3278 = _3272 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3280 = _3272;
    float _3282 = _3274;
    float _3284 = _3264;
    float _3286 = _3264;
    if (!_3222)
    {
        _3280 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3288 = _3280;
    float _3290 = fma(_3018, _3274, _3006);
    float _3292 = fma(_3020, _3274, _3008);
    float _3294 = fma(_3012, _3276, _3010);
    float _3296 = _3288;
    float _3298 = _3288;
    if (!_3222)
    {
        _3282 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3300 = _3282;
    out.m_85.x = _3290;
    out.m_85.y = _3292;
    out.m_85.z = _3294;
    out.m_85.w = _3270;
    bool _3302 = !_3222;
    float _3304 = _3300;
    float _3306 = _3300;
    if (!_3302)
    {
        bool _3308 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3310 = isnan(_2687);
        bool _3312 = _3308 || _3310;
        bool _3314 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3316 = _3312 || _3314;
        if (!_3316)
        {
            float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3320 = _2687 + _3318;
            float _3322 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3324 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3322;
            float _3326 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3328 = _3326 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3330 = 1.0 / _3324;
            float _3332 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3334 = _3332 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3336 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3338 = _3336 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3340 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3342 = _3340 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3344 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3346 = _3344 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3348 = _3320 * _3330;
            float _3350 = precise::clamp(_3348, 0.0, 1.0);
            float _3352 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3354 = _3352 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3356 = fma(_3350, _3328, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3358 = fma(_3350, _3354, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3360 = fma(_3350, _3334, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3362 = fma(_3350, _3338, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3364 = fma(_3350, _3342, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3366 = fma(_3350, _3346, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3262 = _3360;
            _3306 = _3364;
            _3240 = _3356;
            _3234 = _3362;
            _3286 = _3358;
            _3298 = _3366;
            _3368 = true;
        }
        else
        {
            bool _3370 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3372 = isnan(_2687);
            bool _3374 = _3370 || _3372;
            bool _3376 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3378 = _3374 || _3376;
            if (!_3378)
            {
                _3238 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3380 = _3238;
            _3240 = _3380;
            if (!_3378)
            {
                _3260 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3382 = _3260;
            _3262 = _3382;
            if (!_3378)
            {
                _3284 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3384 = _3284;
            _3286 = _3384;
            if (!_3378)
            {
                _3232 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3386 = _3232;
            _3234 = _3386;
            if (!_3378)
            {
                _3304 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3388 = _3304;
            _3306 = _3388;
            if (!_3378)
            {
                _3296 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3390 = _3296;
            bool _3392 = !_3378;
            _3298 = _3390;
            if (!_3392)
            {
                bool _3394 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3396 = isnan(_2687);
                bool _3398 = _3394 || _3396;
                bool _3400 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3402 = _3398 || _3400;
                if (!_3402)
                {
                    float _3404 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3406 = _2687 + _3404;
                    float _3408 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3410 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3408;
                    float _3412 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3414 = _3412 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3416 = 1.0 / _3410;
                    float _3418 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3420 = _3418 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3422 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3424 = _3422 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3426 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3428 = _3426 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3430 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3432 = _3430 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3434 = _3406 * _3416;
                    float _3436 = precise::clamp(_3434, 0.0, 1.0);
                    float _3438 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3440 = _3438 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3442 = fma(_3436, _3414, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3444 = fma(_3436, _3440, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3446 = fma(_3436, _3420, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3448 = fma(_3436, _3424, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3450 = fma(_3436, _3428, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3452 = fma(_3436, _3432, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3262 = _3446;
                    _3306 = _3450;
                    _3240 = _3442;
                    _3234 = _3448;
                    _3286 = _3444;
                    _3298 = _3452;
                    _3368 = true;
                }
                else
                {
                    _3262 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3306 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3240 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3234 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3286 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3298 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3368 = false;
    float _3454 = _3262;
    float _3456 = _3306;
    float _3458 = _3240;
    float _3460 = _3234;
    float _3462 = _3286;
    float _3464 = _3298;
    float _3466 = fma(_3200, -0.5, 0.5);
    float _3468 = precise::clamp(_3466, 0.0, 1.0);
    float _3470 = -_3454;
    float _3472 = _3470 + _3456;
    float _3474 = _3278 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3476 = -_3458;
    float _3478 = _3476 + _3460;
    float _3480 = fma(_3468, _3472, _3454);
    out.m_87.x = 0.0;
    float _3482 = -_3462;
    float _3484 = _3482 + _3464;
    float _3486 = fma(_3468, _3478, _3458);
    float _3488 = _3480 * 0.586610972881317138671875;
    out.m_49.x = _3474;
    bool _3490 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3492 = fma(_3468, _3484, _3462);
    float _3494 = fma(_3486, 0.298911988735198974609375, _3488);
    bool _3496 = _2607 > 0.0;
    bool _3498 = isnan(_2607);
    bool _3500 = _3496 || _3498;
    bool _3502 = isnan(0.0);
    bool _3504 = _3500 || _3502;
    float _3506 = fma(_3492, 0.114477999508380889892578125, _3494);
    bool _3508 = _2665 <= 0.0;
    bool _3510 = !_3504;
    bool _3512 = _3508 || _3510;
    float _3514 = -_3506;
    float _3516 = _3486 + _3514;
    float _3518 = -_3506;
    float _3520 = _3480 + _3518;
    float _3522 = -_3506;
    float _3524 = _3492 + _3522;
    float _3526 = fma(_3516, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3506);
    float _3528 = fma(_3520, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3506);
    float _3530 = fma(_3524, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3506);
    bool _3532 = !_3490;
    if (!_3532)
    {
        float _3534 = -_2541;
        float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3538 = -_2543;
        float _3540 = _3538 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3542 = -_2545;
        float _3544 = _3542 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3546 = _3536 * _3536;
        float _3548 = fma(_3540, _3540, _3546);
        float _3550 = fma(_3544, _3544, _3548);
        float _3552 = sqrt(_3550);
        float _3554 = rsqrt(_3550);
        float _3556 = -_3552;
        float _3558 = _3556 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3560 = _3558 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3562 = precise::clamp(_3560, 0.0, 1.0);
        float _3564 = _3540 * _3554;
        float _3566 = _3536 * _3554;
        float _3568 = abs(_3562);
        float _3570 = log2(_3568);
        float _3572 = _3544 * _3554;
        float _3574 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3576 = _3200 * _3566;
        float _3578 = -_3566;
        float _3580 = -_3574;
        float _3582 = fma(_3578, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3580);
        float _3584 = fma(_3210, _3564, _3576);
        float _3586 = -_3572;
        float _3588 = fma(_3586, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3582);
        float _3590 = fma(_3212, _3572, _3584);
        float _3592 = precise::clamp(_3590, 0.0, 1.0);
        float _3594 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3596 = _3588 + _3594;
        float _3598 = _3570 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3600 = _3596 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3602 = precise::clamp(_3600, 0.0, 1.0);
        float _3604 = exp2(_3598);
        float _3606 = _3604 * _3602;
        float _3608 = _3592 * _3606;
        float _3610 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3612 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3614 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3610;
        out.m_87.y = _3612;
        out.m_87.z = _3614;
    }
    out.m_89.x = _3526;
    out.m_89.y = _3528;
    out.m_89.z = _3530;
    if (!_3512)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3616 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3616;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3368 = false;
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
        float _3672 = as_type<float>(_122);
        out.gl_Position.z = _3672;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3737 = as_type<float>(_158);
        out.gl_Position.z = _3737;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _192 = _186;
    float _210;
    if (!_190)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
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
    float _280 = _272 * _260;
    float _282 = fma(_276, _266, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = _278 * _260;
    float _286 = _282 * _260;
    float _288 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[143].x, _280);
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
        float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
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
    bool _334 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _336 = isnan(_322);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _346;
    bool _350 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _352 = isnan(_322);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _364 = 1.0 / _348;
    float _366 = _296 * _326;
    float _368 = _332 * _364;
    float _370 = _298 * _328;
    float _372 = -_344;
    float _374 = _372 + 1.0;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _376;
    float _380 = _294 * _324;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _386;
    float _390 = _360 * _374;
    float _392 = fma(_378, _368, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _394 = fma(_384, _368, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _396 = fma(_388, _368, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _398 = -_360;
    float _400 = _398 + 1.0;
    float _402 = _392 * _390;
    float _404 = _394 * _390;
    float _406 = _396 * _390;
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _402);
    float _410 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _404);
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _406);
    float _414 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[108].y, _408);
    float _416 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[108].x, _410);
    float _418 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[108].z, _412);
    bool _420 = !_362;
    float _438;
    if (!_420)
    {
        float _422 = in.m_55.x;
        float _424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _426 = _422 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _428 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
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
    float _448 = in.m_59.y;
    float _450 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _454 = int(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _464 = float(_446);
    float _466 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _468 = log2(_466);
    float _470 = float(uint(_454));
    float _472 = 1.0 / _464;
    int _474 = ~_454;
    int _476 = _474 + 1;
    bool _478 = _454 == 0;
    float _480 = 1.0 / _470;
    float _482 = _468 * _132;
    float _484 = _472 * _132;
    float _486 = exp2(_482);
    int _488 = as_type<int>(_480) + (-2);
    float _490 = trunc(_484);
    int _492 = int(_490);
    float _494 = float(_454);
    float _496 = -_486;
    float _498 = _496 + 1.0;
    float _500 = float(uint(_492));
    float _502 = as_type<float>(_488) * _500;
    float _504 = trunc(_502);
    float _506 = precise::max(_504, 0.0);
    uint _509 = uint(_506);
    int _511 = ~_454;
    int _513 = _511 + 1;
    int _515 = _476 * int(_509);
    int _517 = _515 + _492;
    float _519 = in.m_55.x;
    float _521 = in.m_55.y;
    float _523 = float(uint(_517));
    float _525 = as_type<float>(_488) * _523;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _529 = _527 != 0;
    float _531 = trunc(_525);
    float _533 = precise::max(_531, 0.0);
    uint _535 = uint(_533);
    bool _537 = !_529;
    float _539 = _537 ? 7.345489978790283203125 : 1.0;
    float _541 = _539 * _519;
    float _543 = _519 * 2.0;
    float _545 = floor(_541);
    int _547 = int(_509) + int(_535);
    float _549 = float(_492);
    int _551 = _513 * _547;
    int _553 = _551 + _492;
    bool _555 = _549 >= _494;
    bool _557 = isnan(_549);
    bool _559 = _555 || _557;
    bool _561 = isnan(_494);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = floor(_543);
    bool _569 = uint(_553) >= uint(_454);
    bool _571 = !_569;
    int _573 = _571 ? 0 : (-1);
    float _575 = trunc(_565);
    int _577 = int(_575);
    float _579 = -_545;
    float _581 = _541 + _579;
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _585 = _583 != 0;
    int _587 = ~_547;
    int _589 = _587 + _573;
    int _591 = _589 + 1;
    float _593 = _581 * _494;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _597 = _595 != 0;
    int _599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _601 = _599 != 0;
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _605 = _603 != 0;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _609 = _607 != 0;
    int _611 = _454 * _591;
    int _613 = _611 + _492;
    float _615 = trunc(_593);
    int _617 = int(_615);
    bool _619 = !_478;
    int _621 = _619 ? _613 : (-1);
    int _623 = ~_577;
    int _625 = _623 + 1;
    int _627 = _625 + 1;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _631 = _629 != 0;
    int _633 = _621 * _627;
    float _635 = _494 * _132;
    int _637 = _454 + (-1);
    bool _639 = !_585;
    int _641 = _639 ? 0 : 1;
    float _643 = _635 * _166;
    bool _645 = !_601;
    int _647 = _645 ? 0 : 1;
    int _649 = _577 * _637;
    int _651 = _649 + _633;
    bool _653 = !_597;
    int _655 = _653 ? 0 : 1;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _659 = _657 != 0;
    float _661 = trunc(_643);
    int _663 = int(_661);
    int _665 = abs(_647);
    bool _667 = !_605;
    int _669 = _667 ? 0 : 1;
    int _671 = abs(_641);
    int _673 = abs(_655);
    bool _675 = !_659;
    int _677 = _675 ? 0 : 1;
    int _679 = _617 * _671;
    int _681 = _679 + _492;
    int _683 = abs(_669);
    int _685 = _651 * _665;
    int _687 = abs(_677);
    int _689 = _663 * _673;
    int _691 = _689 + _685;
    float _693 = in.m_61.y;
    int _695 = ~_454;
    int _697 = _695 + 1;
    int _699 = _681 * _683;
    int _701 = _699 + _691;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _705 = _703 != 0;
    float _707 = in.m_61.x;
    int _709 = _617 * _687;
    int _711 = _709 + _701;
    int _713 = ~_454;
    int _715 = _713 + 1;
    float _717 = in.m_61.w;
    bool _719 = _521 > 0.5;
    float _721 = float(uint(_711));
    bool _723 = _454 == 0;
    float _725 = as_type<float>(_488) * _721;
    float _727 = 0.0;
    float _729 = _448;
    if (_705)
    {
        float _731 = in.m_55.x;
        _727 = _731;
    }
    float _733 = _727;
    float _735 = trunc(_725);
    float _737 = precise::max(_735, 0.0);
    uint _739 = uint(_737);
    out.m_63.y = _693;
    out.m_63.x = _707;
    out.m_63.w = _717;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _743 = -_448;
    float _745 = _743 + 1.0;
    int _747 = _715 * int(_739);
    int _749 = _747 + _711;
    float _751 = _521 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_631)
    {
        float _753 = _719 ? _745 : _448;
        _729 = _753;
    }
    float _755 = _729;
    float _757 = float(uint(_749));
    float _759 = fma(_751, -2.0, _741);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _765 = float(uint(_681));
    float _767 = as_type<float>(_488) * _757;
    float _769 = in.m_61.z;
    bool _771 = _733 > 0.5;
    bool _773 = _771 && _705;
    float _775 = _521 * 2.0;
    float _777 = trunc(_767);
    float _779 = precise::max(_777, 0.0);
    uint _781 = uint(_779);
    float _783 = floor(_775);
    int _785 = int(_739) + int(_781);
    float _787 = in.m_46.x;
    float _789 = in.m_46.y;
    float _791 = in.m_46.z;
    int _793 = _697 * _785;
    int _795 = _793 + _711;
    out.m_63.z = _769;
    bool _797 = uint(_795) >= uint(_454);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _801 = !_797;
    int _803 = _801 ? 0 : (-1);
    float _805 = _519 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _807 = ~_785;
    int _809 = _807 + _803;
    int _811 = _809 + 1;
    float _813 = -_799;
    float _815 = fma(_805, 2.0, _813);
    float _817 = as_type<float>(_488) * _765;
    float _819 = 1.0 / _763;
    int _821 = _454 * _811;
    int _823 = _821 + _711;
    float _825 = _789 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _827 = _789 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _829 = !_723;
    int _831 = _829 ? _823 : (-1);
    float _833 = trunc(_817);
    float _835 = precise::max(_833, 0.0);
    uint _837 = uint(_835);
    float _839 = _789 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _845 = _831 >> 31;
    float _847 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[4].x, _825);
    float _849 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[5].x, _827);
    float _851 = fma(_787, (*spvDescriptorSet0.vp_c10)._m0[6].x, _839);
    int _853 = _845 & 3;
    float _855 = _458 * _819;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _861 = ~_454;
    int _863 = _861 + 1;
    float _865 = 1.0 / _843;
    int _867 = _831 + _853;
    float _869 = in.m_55.z;
    int _871 = _831 & 3;
    bool _873 = _871 != 0;
    int _875 = _867 >> 2;
    float _877 = 1.0 / _859;
    int _879 = _875 << 4;
    int _881 = _879 + 368;
    int _883 = _863 * int(_837);
    int _885 = _883 + _681;
    int _887 = _831 & 3;
    bool _889 = _887 != 0;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _891;
    uint _895 = uint(int(uint(_881) >> uint(2)));
    uint _897 = uint(int(uint(int(_895)) >> uint(2)));
    int _899 = int(_895) & 3;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[int(_897)][_899];
    int _903 = int(_895) + 1;
    uint _905 = uint(int(uint(_903) >> uint(2)));
    int _907 = _903 & 3;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[int(_905)][_907];
    float _911 = float(uint(_885));
    float _913 = _462 * _865;
    bool _915 = uint(_887) > 1u;
    int _917 = _873 ? 0 : 1;
    float _919 = as_type<float>(_488) * _911;
    int _921 = _881 + 8;
    uint _923 = uint(int(uint(_921) >> uint(2)));
    uint _925 = uint(int(uint(int(_923)) >> uint(2)));
    int _927 = int(_923) & 3;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[int(_925)][_927];
    int _931 = int(_923) + 1;
    uint _933 = uint(int(uint(_931) >> uint(2)));
    int _935 = _931 & 3;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[int(_933)][_935];
    float _939 = _521 + _519;
    bool _941 = _887 != 3;
    float _943 = trunc(_919);
    float _945 = precise::max(_943, 0.0);
    uint _947 = uint(_945);
    float _949 = _893 * _877;
    int _951 = ~_917;
    int _953 = _951 + 1;
    int _955 = _953 + 1;
    int _957 = ~_454;
    int _959 = _957 + 1;
    int _961 = _955;
    float _963 = _755;
    if (!_915)
    {
        int _965 = ~_917;
        int _967 = _965 + 1;
        _961 = _967;
    }
    int _969 = _961;
    float _971 = _939 + (-1.0);
    bool _973 = uint(_887) >= 2u;
    float _975 = _521 + _869;
    bool _977 = !_889;
    int _979 = _977 ? 0 : 1;
    float _981 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _983 = abs(_969);
    float _985 = _975 + (-1.0);
    int _987 = _973 ? 0 : 1;
    int _989 = int(_837) + int(_947);
    float _991 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _993 = abs(_979);
    int _995 = _959 * _989;
    int _997 = _995 + _681;
    bool _999 = _567 > 0.0;
    float _1001 = in.m_59.x;
    bool _1003 = _567 >= 0.0;
    bool _1005 = isnan(_567);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan(0.0);
    bool _1011 = _1007 || _1009;
    int _1013 = ~_987;
    int _1015 = _1013 + 1;
    int _1017 = _1015 + 1;
    int _1019 = _1017;
    if (_941)
    {
        int _1021 = ~_987;
        int _1023 = _1021 + 1;
        _1019 = _1023;
    }
    int _1025 = _1019;
    bool _1027 = _887 != 3;
    int _1029 = ~_983;
    int _1031 = _1029 + 1;
    int _1033 = _1031 + 1;
    float _1035 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1037 = int(_1035);
    int _1039 = ~_993;
    int _1041 = _1039 + 1;
    int _1043 = _1041 + 1;
    int _1045 = abs(_1025);
    int _1047 = _1033 * as_type<int>(_909);
    bool _1049 = !_609;
    int _1051 = _1049 ? 0 : 1;
    bool _1053 = uint(_997) >= uint(_454);
    int _1055 = _1043 * as_type<int>(_901);
    int _1057 = _1055 + _1047;
    bool _1059 = !_1027;
    int _1061 = _1059 ? 0 : (-1);
    bool _1063 = !_1053;
    int _1065 = _1063 ? 0 : (-1);
    int _1067 = ~_1045;
    int _1069 = _1067 + 1;
    int _1071 = _1069 + 1;
    int _1073 = abs(_1061);
    int _1075 = ~_989;
    int _1077 = _1075 + _1065;
    int _1079 = _1077 + 1;
    int _1081 = _1071 * as_type<int>(_929);
    int _1083 = _1081 + _1057;
    float _1085 = _869 * 2.0;
    int _1087 = abs(_1037);
    int _1089 = abs(_1051);
    int _1091 = _454 * _1079;
    int _1093 = _1091 + _681;
    int _1095 = ~_1073;
    int _1097 = _1095 + 1;
    int _1099 = _1097 + 1;
    float _1101 = floor(_1085);
    float _1103 = float(uint(_1087));
    int _1105 = ~_1089;
    int _1107 = _1105 + 1;
    int _1109 = _1107 + 1;
    int _1111 = _1099 * as_type<int>(_937);
    int _1113 = _1111 + _1083;
    float _1115 = as_type<float>(_1025);
    float _1117 = _937;
    if (_705)
    {
        _1115 = _1001;
    }
    float _1119 = _1115;
    float _1121 = fma(_791, (*spvDescriptorSet0.vp_c10)._m0[6].z, _851);
    float _1123 = _1119;
    if (!_705)
    {
        _1117 = _1001;
    }
    float _1125 = _1117;
    int _1127 = _1113 * _1109;
    float _1129 = 1.0 / _1103;
    bool _1131 = !_723;
    int _1133 = _1131 ? _1093 : (-1);
    float _1135 = _1125;
    if (_773)
    {
        float _1137 = -_1119;
        float _1139 = _1137 + 1.0;
        _1123 = _1139;
    }
    float _1141 = _1123;
    bool _1143 = _783 > 0.0;
    float _1145 = fma(_791, (*spvDescriptorSet0.vp_c10)._m0[5].z, _849);
    bool _1147 = _783 >= 0.0;
    bool _1149 = isnan(_783);
    bool _1151 = _1147 || _1149;
    bool _1153 = isnan(0.0);
    bool _1155 = _1151 || _1153;
    int _1157 = _1133 * _1089;
    int _1159 = _1157 + _1127;
    float _1161 = float(uint(_1037));
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1165 = _442 + _1163;
    if (_705)
    {
        _1135 = _1141;
    }
    float _1167 = _1135;
    float _1169 = _1145 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1173 = _1171 != 0;
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1177 = _1175 != 0;
    int _1179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1181 = _1179 != 0;
    float _1183 = fma(_855, _1165, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1185 = _1011 ? 0 : 1;
    float _1187 = 1.0 / _1161;
    int _1189 = _1155 ? 0 : 1;
    float _1191 = _1121 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1193 = _1101 > 0.0;
    bool _1195 = _1101 >= 0.0;
    bool _1197 = isnan(_1101);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan(0.0);
    bool _1203 = _1199 || _1201;
    float _1205 = fma(_791, (*spvDescriptorSet0.vp_c10)._m0[4].z, _847);
    bool _1207 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1209 = isnan(_442);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    int _1219 = abs(_1159);
    float _1221 = _1205 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1223 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1225 = isnan(_442);
    bool _1227 = _1223 || _1225;
    bool _1229 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1231 = _1227 || _1229;
    float _1233 = float(_1231);
    int _1235 = as_type<int>(_1129) + (-2);
    float _1237 = -_1217;
    float _1239 = _1237 + 1.0;
    float _1241 = float(uint(_1219));
    float _1243 = -_1233;
    float _1245 = _1243 + 1.0;
    bool _1247 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1249 = isnan(_442);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1255 = _1251 || _1253;
    float _1257 = float(_1255);
    float _1259 = _1233 * _1239;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1263 = _442 + _1261;
    float _1265 = as_type<float>(_1235) * _1241;
    bool _1267 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1269 = isnan(_442);
    bool _1271 = _1267 || _1269;
    bool _1273 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1275 = _1271 || _1273;
    float _1277 = float(_1275);
    float _1279 = -_1257;
    float _1281 = _1279 + 1.0;
    float _1283 = fma(_913, _1263, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1287 = _442 + _1285;
    int _1289 = as_type<int>(_1187) + (-2);
    float _1291 = trunc(_1265);
    float _1293 = precise::max(_1291, 0.0);
    uint _1295 = uint(_1293);
    float _1297 = _1277 * _1281;
    float _1299 = float(uint(_1159));
    float _1301 = fma(_949, _1287, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    int _1303 = ~_1087;
    int _1305 = _1303 + 1;
    float _1307 = _1257 * _1245;
    float _1309 = as_type<float>(_1289) * _1299;
    int _1311 = ~_1037;
    int _1313 = _1311 + 1;
    float _1315 = _1183 * _1297;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1319 = !_1177;
    int _1321 = _1319 ? 0 : 1;
    float _1323 = trunc(_1309);
    float _1325 = precise::max(_1323, 0.0);
    uint _1327 = uint(_1325);
    bool _1329 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1331 = isnan(0.0);
    bool _1333 = _1329 || _1331;
    bool _1335 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1337 = _1333 || _1335;
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1341 = 1.0 + _1339;
    int _1343 = _1305 * int(_1295);
    int _1345 = _1343 + _1219;
    int _1347 = ~_1087;
    int _1349 = _1347 + 1;
    float _1351 = _1337 ? _498 : 0.0;
    float _1353 = float(uint(_1345));
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1357 = -_1277;
    float _1359 = _1357 + 1.0;
    float _1361 = 1.0 / _1341;
    bool _1363 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1365 = isnan(1.0);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1371 = _1367 || _1369;
    float _1373 = as_type<float>(_1235) * _1353;
    float _1375 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1317);
    float _1377 = -_132;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[76].x, _815);
    int _1381 = _1313 * int(_1327);
    int _1383 = _1381 + _1159;
    float _1385 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1315);
    float _1387 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1355);
    float _1389 = trunc(_1373);
    float _1391 = precise::max(_1389, 0.0);
    uint _1393 = uint(_1391);
    float _1395 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _759);
    float _1397 = float(uint(_1383));
    float _1399 = fma(_1283, _1307, _1385);
    int _1401 = _1203 ? 0 : 1;
    float _1403 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1375);
    int _1405 = ~_1189;
    int _1407 = _1405 + 1;
    int _1409 = _1407 + 1;
    float _1411 = as_type<float>(_1289) * _1397;
    int _1413 = ~_1185;
    int _1415 = _1413 + 1;
    int _1417 = _1415 + 1;
    float _1419 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1387);
    int _1421 = _1417;
    int _1423 = _1409;
    if (!_999)
    {
        int _1425 = ~_1185;
        int _1427 = _1425 + 1;
        _1421 = _1427;
    }
    int _1429 = _1421;
    float _1431 = trunc(_1411);
    float _1433 = precise::max(_1431, 0.0);
    uint _1435 = uint(_1433);
    int _1437 = abs(_1321);
    if (_1371)
    {
        float _1439 = _1351 * _1361;
        _152 = _1439;
    }
    float _1441 = _152;
    int _1443 = ~_1401;
    int _1445 = _1443 + 1;
    int _1447 = _1445 + 1;
    float _1449 = fma(_1301, _1259, _1399);
    float _1451 = float(_1429);
    float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1455 = _1191 + _1453;
    float _1457 = float(_1437);
    float _1459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1461 = int(_1295) + int(_1393);
    float _1463 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1465 = _1221 + _1463;
    int _1467 = _1447;
    if (!_1193)
    {
        int _1469 = ~_1401;
        int _1471 = _1469 + 1;
        _1467 = _1471;
    }
    int _1473 = _1467;
    float _1475 = _1457 * _1451;
    bool _1477 = !_1173;
    int _1479 = _1477 ? 0 : 1;
    int _1481 = _1349 * _1461;
    int _1483 = _1481 + _1219;
    int _1485 = ~_1037;
    int _1487 = _1485 + 1;
    float _1489 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1491 = _1169 + _1489;
    int _1493 = int(_1327) + int(_1435);
    float _1495 = _1475 * (-2.0);
    int _1497 = abs(_1479);
    float _1499 = _521 + (-0.5);
    float _1501 = float(_1473);
    int _1503 = _1487 * _1493;
    int _1505 = _1503 + _1159;
    if (!_1143)
    {
        int _1507 = ~_1189;
        int _1509 = _1507 + 1;
        _1423 = _1509;
    }
    int _1511 = _1423;
    float _1513 = in.m_65.x;
    float _1515 = in.m_65.y;
    float _1517 = in.m_65.z;
    float _1519 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1521 = float(_1497);
    float _1523 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1449);
    bool _1525 = uint(_1505) >= uint(_1037);
    float _1527 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1519);
    bool _1529 = uint(_1483) >= uint(_1087);
    float _1531 = _1521 * _1501;
    bool _1533 = !_1525;
    int _1535 = _1533 ? 0 : (-1);
    float _1537 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1527);
    int _1539 = _1159 ^ _1037;
    float _1541 = _1491 * _1491;
    bool _1543 = !_1529;
    int _1545 = _1543 ? 0 : (-1);
    int _1547 = ~_1493;
    int _1549 = _1547 + _1535;
    int _1551 = _1549 + 1;
    bool _1553 = _1537 >= 0.0;
    float _1555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _1557 = uint(int(uint(_1539) >> uint(31)));
    int _1559 = _1037 * _1551;
    int _1561 = _1559 + _1159;
    int _1563 = ~_1545;
    int _1565 = _1461 + _1563;
    int _1567 = _1565 + 1;
    float _1569 = _1531 * (-2.0);
    bool _1571 = _1037 == 0;
    float _1573 = _1459 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1575 = ~int(_1557);
    int _1577 = _1575 + 1;
    float _1579 = fma(_981, _1569, _981);
    bool _1581 = !_1571;
    int _1583 = _1581 ? _1561 : (-1);
    float _1585 = fma(_1573, _1167, -0.5);
    bool _1587 = _1037 == 0;
    float _1589 = fma(_1569, _1513, _1513);
    int _1591 = _1567 ^ _1577;
    float _1593 = _1517;
    if (_1553)
    {
        out.m_49.x = 0.0;
    }
    float _1595 = float(_1583);
    float _1597 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1599 = ~_1577;
    int _1601 = _1599 + _1591;
    int _1603 = _1601 + 1;
    float _1605 = fma(_991, _1495, _991);
    float _1607 = fma(_1495, _1515, _1515);
    float _1609 = fma(_1573, _1595, _1379);
    float _1611 = _519 + (-0.5);
    bool _1613 = !_1587;
    int _1615 = _1613 ? _1603 : (-1);
    float _1617 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1607);
    float _1619 = fma(_1403, _1585, _1609);
    float _1621 = fma(_1611, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1589);
    float _1623 = float(_1615);
    float _1625 = fma(_1597, _755, -0.5);
    float _1627 = _1619 + 0.5;
    float _1629 = fma(_1605, _1441, _1617);
    float _1631 = fma(_1465, _1465, _1541);
    float _1633 = -_1395;
    float _1635 = fma(_1597, _1623, _1633);
    int _1637 = as_type<int>(_1625);
    if (_1553)
    {
        _963 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1639 = _963;
    float _1641 = fma(_1579, _1441, _1621);
    float _1643 = fma(_1455, _1455, _1631);
    float _1645 = _869 + _519;
    float _1647 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1649 = fma(_1419, _1625, _1635);
    float _1651 = rsqrt(_1643);
    if (_1553)
    {
        float _1653 = _1639 * 5.0;
        _1637 = as_type<int>(_1653);
    }
    int _1655 = _1637;
    float _1657 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1659 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1553)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5958 = as_type<float>(_1655);
        out.gl_Position.z = _5958;
    }
    float _1665 = _1649 + 0.5;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1669 = _1659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1671 = _1661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1673 = _1663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1627;
    out.m_67.y = _1665;
    float _1675 = _1491 * _1651;
    float _1677 = _1465 * _1651;
    out.m_69.x = _1669;
    out.m_69.y = _1671;
    out.m_69.z = _1673;
    out.m_69.w = _1667;
    float _1679 = _450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1681 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1683 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1685 = _1523 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1687 = !_1181;
    int _1689 = _1687 ? 0 : 1;
    out.m_71.x = _1679;
    out.m_71.y = _1681;
    out.m_71.z = _1683;
    out.m_71.w = _1685;
    int _1691 = abs(_1689);
    float _1693 = _1675;
    if (_1553)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1695 = -_1675;
    float _1697 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1169);
    float _1699 = _1455 * _1651;
    float _1701 = -_1677;
    float _1703 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1221);
    float _1705 = float(_1511);
    float _1707 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1709 = _1697 + _1707;
    float _1711 = float(_1691);
    float _1713 = -_1699;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1191);
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1719 = _1703 + _1717;
    float _1721 = _1709 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1723 = _1645 + (-1.0);
    float _1725 = _1711 * _1705;
    float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1729 = _1715 + _1727;
    float _1731 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1721);
    float _1733 = fma(_1723, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1735 = _1725 * (-2.0);
    float _1737 = -_1675;
    float _1739 = fma(_1737, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1491);
    float _1741 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1731);
    float _1743 = _869 + (-0.5);
    float _1745 = fma(_1733, _1735, _1733);
    float _1747 = fma(_1735, _1517, _1517);
    float _1749 = _1629 * 0.15915493667125701904296875;
    bool _1751 = _1741 >= 0.0;
    float _1753 = -_1677;
    float _1755 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1465);
    float _1757 = _1739 * _1739;
    float _1759 = fma(_1743, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1747);
    float _1761 = -_1699;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1455);
    float _1765 = _1641 * 0.15915493667125701904296875;
    float _1767 = fma(_1755, _1755, _1757);
    float _1769 = fma(_1745, _1441, _1759);
    float _1771 = _1749 * 6.283185482025146484375;
    float _1773 = sin(_1771);
    float _1775 = fma(_1763, _1763, _1767);
    float _1777 = _1769 * 0.15915493667125701904296875;
    float _1779 = _1699;
    float _1781 = _1719;
    if (_1751)
    {
        _1593 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1783 = _1593;
    int _1785 = as_type<int>(_1783);
    if (_1751)
    {
        out.m_49.x = 0.0;
    }
    float _1787 = _1765 * 6.283185482025146484375;
    float _1789 = sin(_1787);
    if (_1751)
    {
        float _1791 = _1783 * 5.0;
        _1785 = as_type<int>(_1791);
    }
    int _1793 = _1785;
    if (_1751)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6204 = as_type<float>(_1793);
        out.gl_Position.z = _6204;
    }
    float _1795 = _1765 * 6.283185482025146484375;
    float _1797 = cos(_1795);
    float _1799 = _1749 * 6.283185482025146484375;
    float _1801 = cos(_1799);
    float _1803 = sqrt(_1775);
    float _1805 = _1777 * 6.283185482025146484375;
    float _1807 = sin(_1805);
    if (_1751)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1809 = _1789 * _1773;
    float _1811 = _1797 * _1801;
    float _1813 = _1777 * 6.283185482025146484375;
    float _1815 = cos(_1813);
    float _1817 = -_1169;
    float _1819 = _1817 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1821 = -_1221;
    float _1823 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1825 = fma(_1807, _1811, _1809);
    float _1827 = fma(_1807, _1809, _1811);
    float _1829 = _1819 * _1819;
    float _1831 = in.m_73.x;
    float _1833 = in.m_73.y;
    float _1835 = in.m_73.z;
    float _1837 = _1651 * _1803;
    float _1839 = -_1191;
    float _1841 = _1839 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1843 = fma(_1823, _1823, _1829);
    float _1845 = _1789 * _1801;
    float _1847 = _1797 * _1773;
    float _1849 = fma(_1841, _1841, _1843);
    float _1851 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1853 = -_1847;
    float _1855 = fma(_1807, _1845, _1853);
    float _1857 = _1801 * _1815;
    float _1859 = _1797 * _1815;
    float _1861 = rsqrt(_1849);
    float _1863 = _1789 * _1815;
    float _1865 = _1773 * _1815;
    float _1867 = -_1845;
    float _1869 = fma(_1807, _1847, _1867);
    float _1871 = _380 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1873 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1875 = _1837 * _1871;
    float _1877 = _1837 * _1851;
    float _1879 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1831);
    float _1881 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1873);
    float _1883 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1833);
    float _1885 = sqrt(_1849);
    float _1887 = _1879 * _1875;
    float _1889 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1891 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1881);
    float _1893 = _1823 * _1861;
    float _1895 = _1883 * _1877;
    float _1897 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1889);
    float _1899 = _1819 * _1861;
    float _1901 = _1841 * _1861;
    float _1903 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1905 = _1893 * _1903;
    float _1907 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1909 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1909;
    float _1913 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1897);
    float _1915 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1917 = _1901 * _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1921 = -_1905;
    float _1923 = fma(_1901, _1919, _1921);
    float _1925 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1927 = _1913 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1931 = _1899 * _1929;
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1935 = -_1917;
    float _1937 = fma(_1899, _1933, _1935);
    float _1939 = _1923 * _1923;
    float _1941 = -_1927;
    float _1943 = _1925 + _1941;
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1947 = -_1931;
    float _1949 = fma(_1893, _1945, _1947);
    float _1951 = 1.0 / _1911;
    float _1953 = fma(_1937, _1937, _1939);
    float _1955 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1957 = abs(_1943);
    float _1959 = precise::max(_1957, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1961 = fma(_1949, _1949, _1953);
    float _1963 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1955);
    float _1965 = precise::min(_1959, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1967 = rsqrt(_1961);
    float _1969 = _1837 * _1907;
    float _1971 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1963);
    bool _1973 = _1927 >= _1925;
    bool _1975 = isnan(_1927);
    bool _1977 = _1973 || _1975;
    bool _1979 = isnan(_1925);
    bool _1981 = _1977 || _1979;
    float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1985 = _1965 + _1983;
    float _1987 = -_1895;
    float _1989 = _1807 * _1987;
    float _1991 = _1863 * _1895;
    float _1993 = abs(_1885);
    float _1995 = precise::max(0.0, _1993);
    float _1997 = _1985 * _1951;
    float _1999 = _1859 * _1895;
    float _2001 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1835);
    float _2003 = rsqrt(_1971);
    float _2005 = precise::min(_1995, 40.0);
    float _2007 = fma(_1825, _1887, _1999);
    float _2009 = _2001 * _1969;
    bool _2011 = !_1981;
    float _2013 = _2011 ? 1.0 : (-1.0);
    float _2015 = _1949 * _1967;
    float _2017 = _1937 * _1967;
    float _2019 = _1923 * _1967;
    float _2021 = fma(_1855, _1887, _1991);
    float _2023 = _1893 * _2015;
    float _2025 = fma(_2005, -0.02500000037252902984619140625, 1.0);
    float _2027 = fma(_1857, _1887, _1989);
    float _2029 = fma(_1869, _2009, _2007);
    float _2031 = _1901 * _2019;
    float _2033 = -_2023;
    float _2035 = fma(_1901, _2017, _2033);
    float _2037 = _2013 * _1997;
    float _2039 = fma(_1827, _2009, _2021);
    float _2041 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2043 = fma(_1865, _2009, _2027);
    float _2045 = _1899 * _2017;
    float _2047 = -_2031;
    float _2049 = fma(_1899, _2015, _2047);
    float _2051 = _2035 * _2029;
    float _2053 = _170 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _2055 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2057 = _2041 * _2041;
    float _2059 = -_2045;
    float _2061 = fma(_1893, _2019, _2059);
    float _2063 = _2049 * _2029;
    float _2065 = fma(_2019, _2043, _2051);
    float _2067 = _2053 * _2037;
    float _2069 = fma(_2055, _2055, _2057);
    float _2071 = _2061 * _2029;
    float _2073 = fma(_2017, _2043, _2063);
    float _2075 = fma(_1899, _2039, _2065);
    float _2077 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2079 = fma(_2015, _2043, _2071);
    float _2081 = fma(_1893, _2039, _2073);
    float _2083 = _1169 + _2075;
    float _2085 = fma(_2077, _2077, _2069);
    float _2087 = fma(_1901, _2039, _2079);
    float _2089 = _1221 + _2081;
    float _2091 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2093 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2095 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2097 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2099 = _2067 * 0.15915493667125701904296875;
    float _2101 = _1191 + _2087;
    float _2103 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2091);
    float _2105 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2093);
    float _2107 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2095);
    float _2109 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2097);
    float _2111 = rsqrt(_2085);
    float _2113 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2105);
    float _2115 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2107);
    float _2117 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2103);
    float _2119 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2109);
    float _2121 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2123 = _2115 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2125 = _2117 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2127 = _2099 * 6.283185482025146484375;
    float _2129 = cos(_2127);
    float _2131 = _2119 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2133 = _2123 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2135 = _2123 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2137 = _2123 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2139 = -_2121;
    float _2141 = _2139 + _2131;
    float _2143 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2133);
    float _2145 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2135);
    float _2147 = _2099 * 6.283185482025146484375;
    float _2149 = sin(_2147);
    float _2151 = fma(_2025, _2141, _2121);
    float _2153 = _2055 * _2111;
    float _2155 = _2041 * _2111;
    float _2157 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2137);
    float _2159 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2143);
    float _2161 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2145);
    float _2163 = -_2129;
    float _2165 = _2163 + 1.0;
    float _2167 = _2077 * _2111;
    float _2169 = _2159 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2171 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2157);
    float _2173 = _2155 * _2165;
    float _2175 = _2167 * _2167;
    float _2177 = _2153 * _2165;
    float _2179 = _2161 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2181 = _2153 * _2149;
    float _2183 = _2155 * _2149;
    float _2185 = _2167 * _2149;
    float _2187 = -_1169;
    float _2189 = _2187 + _2169;
    float _2191 = fma(_2167, _2173, _2181);
    float _2193 = fma(_2165, _2175, _2129);
    float _2195 = -_2185;
    float _2197 = fma(_2155, _2177, _2195);
    float _2199 = -_2183;
    float _2201 = fma(_2167, _2177, _2199);
    float _2203 = -_1221;
    float _2205 = _2203 + _2179;
    float _2207 = _2191 * _2189;
    float _2209 = _2171 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2213 = _2211 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2215 = _2197 * _2189;
    float _2217 = fma(_2153, _2177, _2129);
    float _2219 = fma(_2201, _2205, _2207);
    float _2221 = -_1191;
    float _2223 = _2221 + _2209;
    float _2225 = fma(_170, _2213, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2227 = fma(_2217, _2205, _2215);
    float _2229 = fma(_2167, _2177, _2183);
    float _2231 = fma(_2193, _2223, _2219);
    float _2233 = fma(_2155, _2173, _2129);
    float _2235 = fma(_2155, _2177, _2185);
    float _2237 = fma(_2229, _2223, _2227);
    float _2239 = fma(_2231, _2225, _1191);
    float _2241 = _2233 * _2189;
    float _2243 = -_2181;
    float _2245 = fma(_2167, _2173, _2243);
    float _2247 = fma(_2237, _2225, _1221);
    float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2251 = _2239 + _2249;
    float _2253 = fma(_2235, _2205, _2241);
    float _2255 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2259 = _2247 + _2257;
    float _2261 = _2251 * _2251;
    float _2263 = fma(_2245, _2223, _2253);
    float _2265 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2255);
    float _2267 = fma(_2259, _2259, _2261);
    float _2269 = _1169 + _2263;
    float _2271 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2265);
    float _2273 = sqrt(_2267);
    bool _2275 = _2273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2277 = _2263;
    float _2279 = _2255;
    float _2281 = _2239;
    if (!_2275)
    {
        _2277 = _2247;
    }
    float _2283 = _2277;
    float _2285 = _2283;
    if (!_2275)
    {
        _2279 = _2269;
    }
    float _2287 = _2279;
    bool _2289 = !_2275;
    float _2291 = _2287;
    if (!_2289)
    {
        float _2293 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2297 = _2273 + _2295;
        float _2299 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2301 = rsqrt(_2267);
        float _2303 = _2297 * _2293;
        float _2305 = _2303 * 0.15915493667125701904296875;
        float _2307 = _2305 * 6.283185482025146484375;
        float _2309 = cos(_2307);
        float _2311 = _2305 * 6.283185482025146484375;
        float _2313 = sin(_2311);
        float _2315 = _2309 + (-1.0);
        float _2317 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2319 = fma(_2313, _2299, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2321 = fma(_2269, _2309, _2317);
        float _2323 = _2301 * _2319;
        float _2325 = fma(_2259, _2323, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2327 = fma(_2251, _2323, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2291 = _2321;
        _2285 = _2325;
        _2281 = _2327;
    }
    float _2329 = _2291;
    float _2331 = _2285;
    float _2333 = _2281;
    float _2335 = -_1169;
    float _2337 = _2335 + _2329;
    float _2339 = -_1221;
    float _2341 = _2339 + _2331;
    float _2343 = _2271 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2345 = -_1191;
    float _2347 = _2345 + _2333;
    float _2349 = _2337 * _2337;
    float _2351 = _1697 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2353 = 1.0 / _2343;
    float _2355 = fma(_2341, _2341, _2349);
    float _2357 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2351);
    float _2359 = fma(_2347, _2347, _2355);
    float _2361 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2357);
    float _2363 = sqrt(_2359);
    float _2365 = _2361 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2367 = _2365 + _2343;
    float _2369 = _2367 * _2353;
    float _2371 = _2369 * 0.5;
    bool _2373 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2375 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan(0.5);
    bool _2381 = _2377 || _2379;
    bool _2383 = _2363 > 0.0;
    float _2385 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2387 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2385);
    bool _2389 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2391 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2393 = _2389 || _2391;
    bool _2395 = isnan(0.5);
    bool _2397 = _2393 || _2395;
    float _2399 = 1.0 / _2387;
    bool _2401 = !_2383;
    float _2403 = _2331;
    float _2405 = _2329;
    float _2407 = _2333;
    float _2409 = _2347;
    if (!_2401)
    {
        float _2411 = _186 * _186;
        float _2413 = rsqrt(_2359);
        float _2415 = fma(_184, _184, _2411);
        float _2417 = fma(_188, _188, _2415);
        float _2419 = sqrt(_2417);
        float _2421 = _2337 * _2413;
        float _2423 = _2347 * _2413;
        bool _2425 = _2419 > 0.0;
        float _2427 = _2341 * _2413;
        bool _2429 = !_2425;
        if (!_2429)
        {
            float _2431 = rsqrt(_2417);
            float _2433 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2435 = _186 * _2431;
            float _2437 = _184 * _2431;
            float _2439 = _2421 * _2435;
            float _2441 = _188 * _2431;
            float _2443 = fma(_2427, _2437, _2439);
            float _2445 = _2433 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2447 = fma(_2423, _2441, _2443);
            float _2449 = _2447 * _2445;
            float _2451 = fma(_184, _2449, _2331);
            float _2453 = fma(_186, _2449, _2329);
            float _2455 = fma(_188, _2449, _2333);
            _2403 = _2451;
            _2405 = _2453;
            _2407 = _2455;
            _2409 = _2445;
        }
    }
    float _2457 = _2403;
    float _2459 = _2405;
    float _2461 = _2407;
    float _2463 = _2409;
    float _2465 = -_1677;
    float _2467 = fma(_2465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2457);
    float _2469 = -_1675;
    float _2471 = fma(_2469, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2459);
    float _2473 = -_1699;
    float _2475 = fma(_2473, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2461);
    float _2477 = _2467;
    float _2479 = _2475;
    float _2481 = _2463;
    if (_2397)
    {
        _1693 = 1.0;
    }
    float _2483 = _1693;
    float _2485 = _2483;
    if (_2381)
    {
        _1779 = _2467;
    }
    float _2487 = _1779;
    float _2489 = _2487;
    if (_2381)
    {
        _2477 = _2471;
    }
    float _2491 = _2477;
    float _2493 = _2491;
    if (!_2381)
    {
        float _2495 = _1709 * _1709;
        float _2497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2499 = -_1191;
        float _2501 = _2499 + _2461;
        float _2503 = -_1169;
        float _2505 = _2503 + _2459;
        float _2507 = fma(_1719, _1719, _2495);
        float _2509 = -_1221;
        float _2511 = _2509 + _2457;
        float _2513 = fma(_1729, _1729, _2507);
        float _2515 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2517 = sqrt(_2513);
        float _2519 = 1.0 / _1837;
        float _2521 = precise::min(_2517, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2523 = _2521 * _2497;
        float _2525 = _2515 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2527 = _2523 * _2519;
        float _2529 = _2525 * _2527;
        float _2531 = _2501 * _2527;
        float _2533 = fma(_2505, _2529, _1697);
        float _2535 = fma(_2511, _2529, _1703);
        float _2537 = fma(_2525, _2531, _1715);
        _192 = _2525;
        _2493 = _2533;
        _2489 = _2535;
        _2479 = _2537;
    }
    float _2539 = _192;
    float _2541 = _2493;
    float _2543 = _2489;
    float _2545 = _2479;
    float _2547 = _2539;
    if (_2397)
    {
        _1781 = 1.0;
    }
    float _2549 = _1781;
    float _2551 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2553 = _2399 * _2551;
    float _2555 = _2549;
    if (!_2397)
    {
        float _2557 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2559 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2561 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2559;
        float _2563 = _2557 * 0.15915493667125701904296875;
        float _2565 = _2563 * 6.283185482025146484375;
        float _2567 = cos(_2565);
        float _2569 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2571 = _2569 * 0.15915493667125701904296875;
        float _2573 = _2563 * 6.283185482025146484375;
        float _2575 = sin(_2573);
        float _2577 = 1.0 / _2567;
        float _2579 = _2571 * 6.283185482025146484375;
        float _2581 = cos(_2579);
        float _2583 = _2575 * _2577;
        float _2585 = _2571 * 6.283185482025146484375;
        float _2587 = sin(_2585);
        float _2589 = _2581 * _2583;
        float _2591 = 1.0 / _2561;
        float _2593 = 1.0 / _2589;
        float _2595 = _2587 * _2593;
        float _2597 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2599 = fma(_2553, _2595, _2597);
        float _2601 = _2599 * _2591;
        float _2603 = precise::clamp(_2601, 0.0, 1.0);
        _2547 = _2571;
        _2485 = _2603;
    }
    float _2605 = _2547;
    float _2607 = _2485;
    float _2609 = _2605;
    if (!_2397)
    {
        float _2611 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2613 = _2611 * 0.15915493667125701904296875;
        float _2615 = _2613 * 6.283185482025146484375;
        float _2617 = cos(_2615);
        float _2619 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2621 = _2619 * 0.15915493667125701904296875;
        float _2623 = _2613 * 6.283185482025146484375;
        float _2625 = sin(_2623);
        float _2627 = 1.0 / _2617;
        float _2629 = _2621 * 6.283185482025146484375;
        float _2631 = cos(_2629);
        float _2633 = _2625 * _2627;
        float _2635 = _2621 * 6.283185482025146484375;
        float _2637 = sin(_2635);
        float _2639 = _2631 * _2633;
        float _2641 = 1.0 / _2639;
        float _2643 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2645 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2643;
        float _2647 = 1.0 / _2645;
        float _2649 = _2637 * _2641;
        float _2651 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2653 = fma(_2553, _2649, _2651);
        float _2655 = _2653 * _2647;
        float _2657 = precise::clamp(_2655, 0.0, 1.0);
        float _2659 = -_2657;
        float _2661 = _2659 + 1.0;
        _2609 = _2617;
        _2555 = _2661;
    }
    float _2663 = _2609;
    float _2665 = _2555;
    float _2667 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2669 = _2541 + _2667;
    float _2671 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2673 = _2543 + _2671;
    float _2675 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2677 = _2545 + _2675;
    float _2679 = _2669 * _2669;
    float _2681 = fma(_2673, _2673, _2679);
    float _2683 = fma(_2677, _2677, _2681);
    float _2685 = rsqrt(_2683);
    float _2687 = sqrt(_2683);
    float _2689 = _2685 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2691 = _2673 * _2689;
    float _2693 = _2677 * _2689;
    float _2695 = _2691 * _2691;
    float _2697 = _2693 * _2693;
    float _2699 = _2695 + _2697;
    float _2701 = sqrt(_2699);
    bool _2703 = _2701 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2707 = _2701 + _2705;
    float _2709 = _2677;
    float _2711 = _2707;
    float _2713 = _2679;
    if (_2703)
    {
        float _2715 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2709 = _2715;
    }
    float _2717 = _2709;
    if (_2703)
    {
        float _2719 = _2707 * _2717;
        _2711 = _2719;
    }
    float _2721 = _2711;
    if (_2703)
    {
        float _2723 = _2721 * 0.15915493667125701904296875;
        _2713 = _2723;
    }
    float _2725 = _2713;
    float _2727 = _2685;
    float _2729 = _2725;
    if (_2703)
    {
        float _2731 = _2725 * 6.283185482025146484375;
        float _2733 = sin(_2731);
        _2727 = _2733;
    }
    float _2735 = _2727;
    float _2737 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2739 = precise::max(0.0, _2737);
    float _2741 = _2663;
    float _2743 = _2739;
    if (_2703)
    {
        float _2745 = _2725 * 6.283185482025146484375;
        float _2747 = cos(_2745);
        _2741 = _2747;
    }
    float _2749 = _2741;
    float _2751 = -_2689;
    float _2753 = -_2739;
    float _2755 = fma(_2669, _2751, _2753);
    float _2757 = _2737;
    float _2759 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2703)
    {
        float _2761 = rsqrt(_2699);
        _2757 = _2761;
    }
    float _2763 = _2757;
    if (_2703)
    {
        float _2765 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2743 = _2765;
    }
    float _2767 = _2743;
    float _2769 = fma(_1703, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2771 = _2767;
    if (!_2703)
    {
        _2729 = _2691;
    }
    float _2773 = _2729;
    float _2775 = _2735;
    float _2777 = _2773;
    if (_2703)
    {
        float _2779 = fma(_2735, _2767, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2771 = _2779;
    }
    float _2781 = _2771;
    float _2783 = _2781;
    if (!_2703)
    {
        _2775 = _2693;
    }
    float _2785 = _2775;
    float _2787 = _2785;
    float _2789 = _2749;
    if (_2703)
    {
        float _2791 = _2749 + (-1.0);
        _2759 = _2791;
    }
    float _2793 = _2759;
    float _2795 = _2793;
    if (_2703)
    {
        float _2797 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2795 = _2797;
    }
    float _2799 = _2795;
    float _2801 = _2763;
    if (_2703)
    {
        float _2803 = _2763 * _2781;
        _2481 = _2803;
    }
    float _2805 = _2481;
    if (!_2703)
    {
        _2801 = _2755;
    }
    float _2807 = _2801;
    float _2809 = _2807;
    if (_2703)
    {
        float _2811 = fma(_2755, _2749, _2799);
        _2809 = _2811;
    }
    float _2813 = _2809;
    if (!_2703)
    {
        _2783 = _2695;
    }
    float _2815 = _2783;
    float _2817 = _2815;
    if (_2703)
    {
        float _2819 = _2691 * _2805;
        _2777 = _2819;
    }
    float _2821 = _2777;
    if (_2703)
    {
        float _2823 = _2693 * _2805;
        _2787 = _2823;
    }
    float _2825 = _2787;
    if (!_2703)
    {
        _2789 = _2697;
    }
    float _2827 = _2789;
    float _2829 = floor(_2769);
    float _2831 = _2827;
    if (_2703)
    {
        float _2833 = _2821 * _2821;
        _2817 = _2833;
    }
    float _2835 = _2817;
    if (_2703)
    {
        float _2837 = _2825 * _2825;
        _2831 = _2837;
    }
    float _2839 = _2831;
    float _2841 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2843 = fma(_2813, _2813, _2835);
    float _2845 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2847 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2841);
    float _2849 = _2843 + _2839;
    float _2851 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2853 = fma(_2687, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2851);
    float _2855 = precise::clamp(_2853, 0.0, 1.0);
    float _2857 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2845);
    float _2859 = rsqrt(_2849);
    float _2861 = -_2855;
    float _2863 = _2861 + 1.0;
    float _2865 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2867 = fma(_1715, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2869 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2871 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2857);
    float _2873 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2847);
    float _2875 = -_2829;
    float _2877 = _2769 + _2875;
    float _2879 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2869);
    float _2881 = _2541 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2883 = _2871 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2885 = abs(_2863);
    float _2887 = log2(_2885);
    float _2889 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2879);
    float _2891 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2881);
    float _2893 = _2883 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2895 = _2873 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2897 = _2859 * _2821;
    float _2899 = _2859 * _2813;
    float _2901 = _2859 * _2825;
    float _2903 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2891);
    float _2905 = _2889 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2907 = -_2893;
    float _2909 = fma(_2907, _2865, 1.0);
    float _2911 = _2897 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2913 = _2903 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2915 = _2905 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2917 = floor(_2867);
    float _2919 = -_2911;
    float _2921 = fma(_2899, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2919);
    float _2923 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2925 = fma(_2913, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2915);
    float _2927 = _2899 + 1.0;
    float _2929 = -_2901;
    float _2931 = fma(_2929, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2921);
    float _2933 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2925);
    float _2935 = exp2(_2923);
    float _2937 = fma(_2931, -0.5, 0.5);
    float _2939 = _2905 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2941 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2933);
    float _2943 = fma(_2931, 0.5, 0.5);
    float _2945 = fma(_2913, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2939);
    float _2947 = log2(_2909);
    float _2949 = -_2917;
    float _2951 = _2867 + _2949;
    float _2953 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2945);
    float _2955 = fma(_2943, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2957 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2953);
    float _2959 = fma(_2943, _2955, -0.212114393711090087890625);
    float _2961 = 1.0 / _2941;
    float _2963 = _2905 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2965 = -_2899;
    float _2967 = fma(_2935, _2927, _2965);
    float _2969 = sqrt(_2937);
    float _2971 = fma(_2913, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2963);
    float _2973 = _2947 * 0.693147182464599609375;
    float2 _8094 = float2(_2877, _2951);
    float _2975 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8094, float2(0.0), isnan(_8094)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8094, float2(0.0), isnan(_8094)), level(0.0)).x;
    float _2977 = fma(_2943, _2959, 1.570728778839111328125);
    float _2979 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2971);
    float _2981 = _2973 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2983 = fma(_2967, 0.5, 0.5);
    float _2985 = _2957 * _2961;
    float _2987 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2979);
    float _2989 = fma(_2985, 0.5, 0.5);
    float _2991 = _2987 * _2961;
    float _2993 = _2969 * 0.636619746685028076171875;
    float _2995 = fma(_2991, -0.5, 0.5);
    float _2997 = -_2977;
    float _2999 = fma(_2993, _2997, 1.0);
    float3 _8143 = float3(_2989, _2995, _2981);
    float _3001 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8143, float3(0.0), isnan(_8143)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8143, float3(0.0), isnan(_8143)), level(0.0)).x;
    float3 _8154 = float3(_2989, _2995, _2981);
    float4 _3004 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8154, float3(0.0), isnan(_8154)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8154, float3(0.0), isnan(_8154)), level(0.0)).xyzw;
    float _3006 = _3004.x;
    float _3008 = _3004.y;
    float _3010 = _3004.z;
    float _3012 = _3004.w;
    float2 _8170 = float2(_2999, _2983);
    float3 _3016 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8170, float2(0.0), isnan(_8170)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8170, float2(0.0), isnan(_8170)), level(0.0)).xyz;
    float _3018 = _3016.x;
    float _3020 = _3016.y;
    float _3022 = _3016.z;
    float _3024 = abs(_2553);
    float _3026 = log2(_3024);
    bool _3028 = _1833 != 0.0;
    bool _3030 = isnan(_1833);
    bool _3032 = _3028 || _3030;
    bool _3034 = isnan(0.0);
    bool _3036 = _3032 || _3034;
    out.m_71.x = _1679;
    out.m_71.y = _1681;
    out.m_71.z = _1683;
    out.m_71.w = _1685;
    float _3038 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3040 = _1831 == 0.0;
    bool _3042 = !_3036;
    bool _3044 = _3040 && _3042;
    out.m_69.x = _1669;
    out.m_69.y = _1671;
    out.m_69.z = _1673;
    out.m_69.w = _1667;
    bool _3046 = _1835 == 0.0;
    bool _3048 = _3046 && _3044;
    float _3050 = exp2(_3038);
    bool _3052 = _2553 <= 8000.0;
    bool _3054 = isnan(_2553);
    bool _3056 = _3052 || _3054;
    bool _3058 = isnan(8000.0);
    bool _3060 = _3056 || _3058;
    float _3062 = float(_3060);
    float _3064 = _3026 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3066 = _1825 * _2035;
    float _3068 = in.m_75.x;
    float _3070 = in.m_75.y;
    float _3072 = in.m_75.z;
    float _3074 = _1825 * _2049;
    float _3076 = _1825 * _2061;
    float _3078 = fma(_1857, _2019, _3066);
    float _3080 = exp2(_3064);
    float _3082 = _1869 * _2049;
    float _3084 = fma(_1857, _2017, _3074);
    float _3086 = fma(_1855, _1899, _3078);
    float _3088 = fma(_1857, _2015, _3076);
    float _3090 = fma(_1865, _2017, _3082);
    float _3092 = fma(_1855, _1893, _3084);
    float _3094 = -_3050;
    float _3096 = _3094 + 1.0;
    float _3098 = fma(_1855, _1901, _3088);
    float _3100 = fma(_1827, _1893, _3090);
    float _3102 = _3096 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3104 = fma(_3080, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3106 = precise::clamp(_3104, 0.0, 1.0);
    float _3108 = _1869 * _2061;
    float _3110 = fma(_3106, -2.0, 3.0);
    float _3112 = _3106 * _3106;
    float _3114 = _3070;
    float _3116 = _3068;
    float _3118 = _3072;
    if (!_3048)
    {
        float _3120 = fma(_1833, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3070);
        _3114 = _3120;
    }
    float _3122 = _3114;
    float _3124 = _1859 * _2035;
    if (!_3048)
    {
        float _3126 = fma(_1831, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3068);
        _3116 = _3126;
    }
    float _3128 = _3116;
    float _3130 = _3112 * _3110;
    float _3132 = _1859 * _2049;
    float _3134 = -_1807;
    float _3136 = fma(_3134, _2019, _3124);
    float _3138 = _1859 * _2061;
    float _3140 = -_3130;
    float _3142 = _3140 + 1.0;
    float _3144 = -_1807;
    float _3146 = fma(_3144, _2017, _3132);
    float _3148 = fma(_1863, _1899, _3136);
    float _3150 = _1869 * _2035;
    float _3152 = fma(_3142, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3130);
    float _3154 = _2905 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3156 = _3148 * _3122;
    float _3158 = fma(_1863, _1893, _3146);
    float _3160 = _3062 * _3152;
    float _3162 = fma(_2913, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3154);
    float _3164 = fma(_3086, _3128, _3156);
    float _3166 = _3158 * _3122;
    float _3168 = in.m_77.x;
    float _3170 = fma(_2883, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3162);
    float _3172 = -_1807;
    float _3174 = fma(_3172, _2015, _3138);
    float _3176 = fma(_3092, _3128, _3166);
    float _3178 = _3160 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3180 = fma(_2895, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3170);
    float _3182 = fma(_1865, _2019, _3150);
    float _3184 = fma(_1863, _1901, _3174);
    if (!_3048)
    {
        float _3186 = fma(_1835, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3072);
        _3118 = _3186;
    }
    float _3188 = _3118;
    float _3190 = _3180 + _2941;
    float _3192 = fma(_1827, _1899, _3182);
    float _3194 = fma(_1865, _2015, _3108);
    float _3196 = _3184 * _3122;
    float _3198 = _3190 * 0.5;
    float _3200 = fma(_3192, _3188, _3164);
    float _3202 = fma(_1827, _1901, _3194);
    float _3204 = fma(_3098, _3128, _3196);
    float _3206 = -_3102;
    float _3208 = _3206 + 1.0;
    float _3210 = fma(_3100, _3188, _3176);
    float _3212 = fma(_3202, _3188, _3204);
    bool _3214 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3216 = isnan(_2687);
    bool _3218 = _3214 || _3216;
    bool _3220 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3222 = _3218 || _3220;
    out.gl_Position.x = _2957;
    out.gl_Position.y = _2987;
    out.gl_Position.z = _3180;
    out.gl_Position.w = _2941;
    out.m_79.x = _3210;
    out.m_79.y = _3200;
    out.m_79.z = _3212;
    out.m_81.z = _3198;
    out.m_81.w = _2941;
    float _3224 = _3204;
    float _3226 = _2941;
    float _3228 = _3198;
    if (!_3222)
    {
        _3224 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3230 = _3224;
    float _3232 = _3230;
    float _3234 = _3230;
    if (!_3222)
    {
        _3226 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3236 = _3226;
    float _3238 = _3236;
    float _3240 = _3236;
    if (!_3222)
    {
        _3228 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3242 = _3228;
    float _3244 = -_2975;
    float _3246 = _3244 + 1.0;
    float _3248 = _3246 * _3178;
    float _3250 = precise::clamp(_3248, 0.0, 1.0);
    float _3252 = -_3250;
    float _3254 = fma(_3252, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3256 = _3254 * _3168;
    float _3258 = _3168;
    float _3260 = _3242;
    float _3262 = _3242;
    if (!_3222)
    {
        _3258 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3264 = _3258;
    float _3266 = _3256 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3268 = _3102 * _3001;
    float _3270 = _3012 * _3208;
    float _3272 = _2607 * _2665;
    out.m_83.x = _3266;
    float _3274 = _3012 * _3268;
    float _3276 = _3022 * _3268;
    float _3278 = _3272 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3280 = _3272;
    float _3282 = _3274;
    float _3284 = _3264;
    float _3286 = _3264;
    if (!_3222)
    {
        _3280 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3288 = _3280;
    float _3290 = fma(_3018, _3274, _3006);
    float _3292 = fma(_3020, _3274, _3008);
    float _3294 = fma(_3012, _3276, _3010);
    float _3296 = _3288;
    float _3298 = _3288;
    if (!_3222)
    {
        _3282 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3300 = _3282;
    out.m_85.x = _3290;
    out.m_85.y = _3292;
    out.m_85.z = _3294;
    out.m_85.w = _3270;
    bool _3302 = !_3222;
    float _3304 = _3300;
    float _3306 = _3300;
    if (!_3302)
    {
        bool _3308 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3310 = isnan(_2687);
        bool _3312 = _3308 || _3310;
        bool _3314 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3316 = _3312 || _3314;
        if (!_3316)
        {
            float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3320 = _2687 + _3318;
            float _3322 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3324 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3322;
            float _3326 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3328 = _3326 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3330 = 1.0 / _3324;
            float _3332 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3334 = _3332 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3336 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3338 = _3336 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3340 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3342 = _3340 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3344 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3346 = _3344 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3348 = _3320 * _3330;
            float _3350 = precise::clamp(_3348, 0.0, 1.0);
            float _3352 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3354 = _3352 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3356 = fma(_3350, _3328, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3358 = fma(_3350, _3354, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3360 = fma(_3350, _3334, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3362 = fma(_3350, _3338, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3364 = fma(_3350, _3342, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3366 = fma(_3350, _3346, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3262 = _3360;
            _3306 = _3364;
            _3240 = _3356;
            _3234 = _3362;
            _3286 = _3358;
            _3298 = _3366;
            _3368 = true;
        }
        else
        {
            bool _3370 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3372 = isnan(_2687);
            bool _3374 = _3370 || _3372;
            bool _3376 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3378 = _3374 || _3376;
            if (!_3378)
            {
                _3238 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3380 = _3238;
            _3240 = _3380;
            if (!_3378)
            {
                _3260 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3382 = _3260;
            _3262 = _3382;
            if (!_3378)
            {
                _3284 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3384 = _3284;
            _3286 = _3384;
            if (!_3378)
            {
                _3232 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3386 = _3232;
            _3234 = _3386;
            if (!_3378)
            {
                _3304 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3388 = _3304;
            _3306 = _3388;
            if (!_3378)
            {
                _3296 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3390 = _3296;
            bool _3392 = !_3378;
            _3298 = _3390;
            if (!_3392)
            {
                bool _3394 = _2687 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3396 = isnan(_2687);
                bool _3398 = _3394 || _3396;
                bool _3400 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3402 = _3398 || _3400;
                if (!_3402)
                {
                    float _3404 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3406 = _2687 + _3404;
                    float _3408 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3410 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3408;
                    float _3412 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3414 = _3412 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3416 = 1.0 / _3410;
                    float _3418 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3420 = _3418 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3422 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3424 = _3422 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3426 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3428 = _3426 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3430 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3432 = _3430 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3434 = _3406 * _3416;
                    float _3436 = precise::clamp(_3434, 0.0, 1.0);
                    float _3438 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3440 = _3438 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3442 = fma(_3436, _3414, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3444 = fma(_3436, _3440, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3446 = fma(_3436, _3420, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3448 = fma(_3436, _3424, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3450 = fma(_3436, _3428, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3452 = fma(_3436, _3432, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3262 = _3446;
                    _3306 = _3450;
                    _3240 = _3442;
                    _3234 = _3448;
                    _3286 = _3444;
                    _3298 = _3452;
                    _3368 = true;
                }
                else
                {
                    _3262 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3306 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3240 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3234 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3286 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3298 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3368 = false;
    float _3454 = _3262;
    float _3456 = _3306;
    float _3458 = _3240;
    float _3460 = _3234;
    float _3462 = _3286;
    float _3464 = _3298;
    float _3466 = fma(_3200, -0.5, 0.5);
    float _3468 = precise::clamp(_3466, 0.0, 1.0);
    float _3470 = -_3454;
    float _3472 = _3470 + _3456;
    float _3474 = _3278 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3476 = -_3458;
    float _3478 = _3476 + _3460;
    float _3480 = fma(_3468, _3472, _3454);
    out.m_87.x = 0.0;
    float _3482 = -_3462;
    float _3484 = _3482 + _3464;
    float _3486 = fma(_3468, _3478, _3458);
    float _3488 = _3480 * 0.586610972881317138671875;
    out.m_49.x = _3474;
    bool _3490 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3492 = fma(_3468, _3484, _3462);
    float _3494 = fma(_3486, 0.298911988735198974609375, _3488);
    bool _3496 = _2607 > 0.0;
    bool _3498 = isnan(_2607);
    bool _3500 = _3496 || _3498;
    bool _3502 = isnan(0.0);
    bool _3504 = _3500 || _3502;
    float _3506 = fma(_3492, 0.114477999508380889892578125, _3494);
    bool _3508 = _2665 <= 0.0;
    bool _3510 = !_3504;
    bool _3512 = _3508 || _3510;
    float _3514 = -_3506;
    float _3516 = _3486 + _3514;
    float _3518 = -_3506;
    float _3520 = _3480 + _3518;
    float _3522 = -_3506;
    float _3524 = _3492 + _3522;
    float _3526 = fma(_3516, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3506);
    float _3528 = fma(_3520, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3506);
    float _3530 = fma(_3524, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3506);
    bool _3532 = !_3490;
    if (!_3532)
    {
        float _3534 = -_2541;
        float _3536 = _3534 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3538 = -_2543;
        float _3540 = _3538 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3542 = -_2545;
        float _3544 = _3542 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3546 = _3536 * _3536;
        float _3548 = fma(_3540, _3540, _3546);
        float _3550 = fma(_3544, _3544, _3548);
        float _3552 = sqrt(_3550);
        float _3554 = rsqrt(_3550);
        float _3556 = -_3552;
        float _3558 = _3556 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3560 = _3558 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3562 = precise::clamp(_3560, 0.0, 1.0);
        float _3564 = _3540 * _3554;
        float _3566 = _3536 * _3554;
        float _3568 = abs(_3562);
        float _3570 = log2(_3568);
        float _3572 = _3544 * _3554;
        float _3574 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3576 = _3200 * _3566;
        float _3578 = -_3566;
        float _3580 = -_3574;
        float _3582 = fma(_3578, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3580);
        float _3584 = fma(_3210, _3564, _3576);
        float _3586 = -_3572;
        float _3588 = fma(_3586, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3582);
        float _3590 = fma(_3212, _3572, _3584);
        float _3592 = precise::clamp(_3590, 0.0, 1.0);
        float _3594 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3596 = _3588 + _3594;
        float _3598 = _3570 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3600 = _3596 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3602 = precise::clamp(_3600, 0.0, 1.0);
        float _3604 = exp2(_3598);
        float _3606 = _3604 * _3602;
        float _3608 = _3592 * _3606;
        float _3610 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3612 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3614 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3610;
        out.m_87.y = _3612;
        out.m_87.z = _3614;
    }
    out.m_89.x = _3526;
    out.m_89.y = _3528;
    out.m_89.z = _3530;
    if (!_3512)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3616 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3616;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

