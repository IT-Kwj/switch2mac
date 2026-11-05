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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
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
    float4 m_67 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_89 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_69 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_75 [[attribute(4)]];
    float4 m_73 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2624 = false;
    bool _468 = false;
    bool _348 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = in.m_48.w;
    float _107 = trunc(_103);
    int _110 = int(_107);
    float _112 = -_105;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _114;
    bool _118 = _110 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_110);
    float _124 = _114;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _120;
    if (!_118)
    {
        out.m_53.x = 0.0;
    }
    int _128 = 0;
    if (!_118)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2935 = as_type<float>(_132);
        out.gl_Position.z = _2935;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _136 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_105);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = float(_110);
    bool _148 = _114 >= _146;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    if (_152)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _122;
    if (_152)
    {
        out.m_53.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _134 = as_type<int>(_156);
    }
    int _158 = _134;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2990 = as_type<float>(_158);
        out.gl_Position.z = _2990;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = 1.0 / _146;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _164 = _114 * _160;
    bool _166 = !_162;
    float _184;
    if (!_166)
    {
        float _168 = in.m_55.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        _184 = _164;
    }
    _186 = false;
    float _188 = _184;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _192 = _188 + _190;
    bool _194 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _196 = isnan(_188);
    bool _198 = _194 || _196;
    bool _200 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _202 = _198 || _200;
    float _204 = float(_202);
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _188 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = 1.0 / _212;
    bool _220 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _222 = 1.0 / _216;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _224;
    float _228 = _192 * _218;
    bool _230 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _232 = isnan(_188);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -_204;
    float _244 = _242 + 1.0;
    bool _246 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _248 = isnan(_188);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = fma(_226, _228, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _260 = _256 * _244;
    float _262 = -_256;
    float _264 = _262 + 1.0;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    float _274 = _208 * _222;
    float _276 = _240 * _264;
    float _278 = fma(_268, _228, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _280 = fma(_272, _228, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _282 = -_240;
    float _284 = _282 + 1.0;
    float _286 = _258 * _276;
    float _288 = _278 * _276;
    float _290 = _280 * _276;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _304 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[143].x, _288);
    float _306 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _308 = fma(_294, _274, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _310 = fma(_298, _274, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _312 = fma(_302, _274, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _314 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[143].z, _290);
    float _316 = fma(_308, _260, _304);
    float _318 = fma(_310, _260, _306);
    float _320 = fma(_312, _260, _314);
    float _322 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[145].x, _316);
    float _324 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[145].y, _318);
    float _326 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[145].z, _320);
    bool _328 = !_220;
    float _346;
    if (!_328)
    {
        float _330 = in.m_55.x;
        float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _334 = _330 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[11].x, _114);
        float _338 = _336 * _332;
        float _340 = floor(_338);
        float _342 = -_340;
        float _344 = _338 + _342;
        _346 = _344;
        _348 = true;
    }
    else
    {
        _346 = _164;
    }
    _348 = false;
    float _350 = _346;
    float _352 = in.m_57.x;
    float _354 = in.m_57.y;
    float _356 = in.m_57.z;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _360 = _350 + _358;
    bool _362 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _364 = isnan(_350);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _376;
    float _380 = -_372;
    float _382 = _380 + 1.0;
    float _384 = 1.0 / _378;
    float _386 = _326 * _356;
    float _388 = _324 * _354;
    float _390 = _360 * _384;
    bool _392 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _394 = isnan(_350);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _412;
    float _416 = _402 * _382;
    float _418 = fma(_406, _390, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _420 = fma(_410, _390, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _422 = fma(_414, _390, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _424 = -_402;
    float _426 = _424 + 1.0;
    float _428 = _418 * _416;
    float _430 = _420 * _416;
    float _432 = _422 * _416;
    float _434 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[107].x, _428);
    float _436 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[107].y, _430);
    float _438 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[107].z, _432);
    float _440 = _322 * _352;
    float _442 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[108].x, _434);
    float _444 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[108].y, _436);
    float _446 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[108].z, _438);
    bool _448 = !_374;
    float _466;
    if (!_448)
    {
        float _450 = in.m_55.x;
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _454 = _450 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _456 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _458 = _456 * _452;
        float _460 = floor(_458);
        float _462 = -_460;
        float _464 = _458 + _462;
        _466 = _464;
        _468 = true;
    }
    else
    {
        _466 = _164;
    }
    _468 = false;
    float _470 = _466;
    float _472 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _474 = int(_472);
    float _476 = in.m_59.y;
    int _478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _480 = _478 != 0;
    float _482 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _484 = int(_482);
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _492 = _490 != 0;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _496 = _494 != 0;
    float _498 = float(_474);
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _502 = 1.0 / _498;
    float _504 = 0.0;
    float _506 = _476;
    if (_488)
    {
        float _508 = in.m_55.x;
        _504 = _508;
    }
    float _510 = _504;
    float _512 = float(uint(_484));
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _516 = ~_484;
    int _518 = _516 + 1;
    int _520 = ~_484;
    int _522 = _520 + 1;
    float _524 = 1.0 / _512;
    float _526 = float(_484);
    float _528 = _502 * _114;
    float _530 = trunc(_528);
    int _532 = int(_530);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _534;
    int _538 = as_type<int>(_524) + (-2);
    float _540 = float(uint(_532));
    float _542 = float(_532);
    float _544 = as_type<float>(_538) * _540;
    bool _546 = _542 >= _526;
    bool _548 = isnan(_542);
    bool _550 = _546 || _548;
    bool _552 = isnan(_526);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = trunc(_544);
    float _560 = precise::max(_558, 0.0);
    uint _563 = uint(_560);
    float _565 = trunc(_556);
    int _567 = int(_565);
    int _569 = _518 * int(_563);
    int _571 = _569 + _532;
    float _573 = in.m_55.x;
    float _575 = in.m_55.y;
    float _577 = float(uint(_571));
    float _579 = as_type<float>(_538) * _577;
    float _581 = trunc(_579);
    float _583 = precise::max(_581, 0.0);
    uint _585 = uint(_583);
    int _587 = int(_563) + int(_585);
    bool _589 = !_480;
    float _591 = _589 ? 7.345489978790283203125 : 1.0;
    float _593 = _591 * _573;
    int _595 = _522 * _587;
    int _597 = _595 + _532;
    float _599 = floor(_593);
    bool _601 = uint(_597) >= uint(_484);
    bool _603 = !_601;
    int _605 = _603 ? 0 : (-1);
    bool _607 = _484 == 0;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    int _609 = ~_587;
    int _611 = _609 + _605;
    int _613 = _611 + 1;
    float _615 = -_599;
    float _617 = _593 + _615;
    int _619 = _484 * _613;
    int _621 = _619 + _532;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _625 = _623 != 0;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _629 = _627 != 0;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _633 = _631 != 0;
    float _635 = _617 * _526;
    float _637 = _526 * _114;
    int _639 = ~_567;
    int _641 = _639 + 1;
    int _643 = _641 + 1;
    bool _645 = !_607;
    int _647 = _645 ? _621 : (-1);
    float _649 = _637 * _160;
    int _651 = _484 + (-1);
    float _653 = trunc(_635);
    int _655 = int(_653);
    bool _657 = !_496;
    int _659 = _657 ? 0 : 1;
    int _661 = _647 * _643;
    bool _663 = !_629;
    int _665 = _663 ? 0 : 1;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _669 = 1.0 + _667;
    bool _671 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _673 = isnan(1.0);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _679 = _675 || _677;
    int _681 = _567 * _651;
    int _683 = _681 + _661;
    bool _685 = !_625;
    int _687 = _685 ? 0 : 1;
    float _689 = trunc(_649);
    int _691 = int(_689);
    int _693 = abs(_665);
    float _695 = -_476;
    float _697 = _695 + 1.0;
    bool _699 = _575 > 0.5;
    int _701 = abs(_687);
    if (_492)
    {
        float _703 = _699 ? _697 : _476;
        _506 = _703;
    }
    float _705 = _506;
    int _707 = abs(_659);
    int _709 = _683 * _693;
    bool _711 = !_633;
    int _713 = _711 ? 0 : 1;
    int _715 = _655 * _707;
    int _717 = _715 + _532;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _721 = _719 != 0;
    float _723 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _725 = log2(_723);
    int _727 = abs(_713);
    int _729 = _691 * _701;
    int _731 = _729 + _709;
    bool _733 = !_721;
    int _735 = _733 ? 0 : 1;
    float _737 = in.m_46.x;
    float _739 = in.m_46.y;
    float _741 = in.m_46.z;
    int _743 = _717 * _727;
    int _745 = _743 + _731;
    int _747 = abs(_735);
    float _749 = _575 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _751 = _573 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _753 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _755 = isnan(0.0);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _761 = _757 || _759;
    int _763 = _655 * _747;
    int _765 = _763 + _745;
    float _767 = fma(_749, -2.0, _500);
    float _769 = -_514;
    float _771 = fma(_751, 2.0, _769);
    float _773 = in.m_55.z;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _779 = float(uint(_765));
    float _781 = _725 * _114;
    float _783 = 1.0 / _777;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _787 = as_type<float>(_538) * _779;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _791 = _573 * 2.0;
    float _793 = _785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _795 = _510 > 0.5;
    bool _797 = _795 && _488;
    float _799 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _801 = trunc(_787);
    float _803 = precise::max(_801, 0.0);
    uint _805 = uint(_803);
    float _807 = _739 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _809 = _739 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _811 = _739 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _813 = ~_484;
    int _815 = _813 + 1;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _819 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[4].x, _807);
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _823 = exp2(_781);
    float _825 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[5].x, _809);
    float _827 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[6].x, _811);
    float _829 = _575 + _573;
    float _831 = _817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _833 = _536 * _783;
    float _835 = in.m_59.x;
    int _837 = _815 * int(_805);
    int _839 = _837 + _765;
    float _841 = floor(_791);
    float _843 = _829 + (-1.0);
    out.m_63.x = _831;
    out.m_63.y = _793;
    out.m_63.z = _799;
    out.m_63.w = _821;
    int _845 = ~_484;
    int _847 = _845 + 1;
    float _849 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _767);
    float _851 = float(uint(_839));
    float _853 = 1.0 / _669;
    float _855 = -_823;
    float _857 = _855 + 1.0;
    float _859 = as_type<float>(_538) * _851;
    float _861 = _761 ? _857 : 0.0;
    float _863 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _865 = trunc(_859);
    float _867 = precise::max(_865, 0.0);
    uint _869 = uint(_867);
    float _871 = _575 + _773;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _875 = _871 + (-1.0);
    bool _877 = _841 > 0.0;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _881 = _841 >= 0.0;
    bool _883 = isnan(_841);
    bool _885 = _881 || _883;
    bool _887 = isnan(0.0);
    bool _889 = _885 || _887;
    float _891 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[78].z, _873);
    float _893 = _575 * 2.0;
    float _895 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[78].w, _879);
    float _897 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _899 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _891);
    float _901 = -_114;
    float _903 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[76].x, _771);
    float _905 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _895);
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _909 = _835;
    float _911 = _863;
    if (_679)
    {
        float _913 = _861 * _853;
        _124 = _913;
    }
    float _915 = _124;
    int _917 = int(_805) + int(_869);
    float _919 = floor(_893);
    float _921 = _773 * 2.0;
    int _923 = _889 ? 0 : 1;
    if (_488)
    {
        _907 = _835;
    }
    float _925 = _907;
    int _927 = _847 * _917;
    int _929 = _927 + _765;
    float _931 = floor(_921);
    float _933 = _925;
    if (_797)
    {
        float _935 = -_925;
        float _937 = _935 + 1.0;
        _933 = _937;
    }
    float _939 = _933;
    bool _941 = uint(_929) >= uint(_484);
    int _943 = ~_923;
    int _945 = _943 + 1;
    int _947 = _945 + 1;
    bool _949 = !_941;
    int _951 = _949 ? 0 : (-1);
    bool _953 = _919 >= 0.0;
    bool _955 = isnan(_919);
    bool _957 = _953 || _955;
    bool _959 = isnan(0.0);
    bool _961 = _957 || _959;
    bool _963 = _919 > 0.0;
    int _965 = ~_917;
    int _967 = _965 + _951;
    int _969 = _967 + 1;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _973 = _470 + _971;
    int _975 = _947;
    if (!_877)
    {
        int _977 = ~_923;
        int _979 = _977 + 1;
        _975 = _979;
    }
    int _981 = _975;
    int _983 = _961 ? 0 : 1;
    int _985 = _484 * _969;
    int _987 = _985 + _765;
    bool _989 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _991 = isnan(_470);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _997 = _993 || _995;
    float _999 = float(_997);
    float _1001 = fma(_833, _973, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    if (_488)
    {
        _909 = _939;
    }
    float _1003 = _909;
    int _1005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1007 = _1005 != 0;
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1011 = _1009 != 0;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1015 = _1013 != 0;
    float _1017 = -_999;
    float _1019 = _1017 + 1.0;
    bool _1021 = _931 > 0.0;
    bool _1023 = _931 >= 0.0;
    bool _1025 = isnan(_931);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan(0.0);
    bool _1031 = _1027 || _1029;
    bool _1033 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1035 = isnan(_470);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    float _1045 = float(uint(_717));
    float _1047 = _1043 * _1019;
    bool _1049 = !_607;
    int _1051 = _1049 ? _987 : (-1);
    float _1053 = as_type<float>(_538) * _1045;
    int _1055 = ~_983;
    int _1057 = _1055 + 1;
    int _1059 = _1057 + 1;
    float _1061 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1063 = fma(_741, (*spvDescriptorSet0.vp_c10)._m0[4].z, _819);
    int _1065 = _1051 >> 31;
    float _1067 = _1001 * _1047;
    int _1069 = _1059;
    if (!_963)
    {
        int _1071 = ~_983;
        int _1073 = _1071 + 1;
        _1069 = _1073;
    }
    int _1075 = _1069;
    float _1077 = -_1043;
    float _1079 = _1077 + 1.0;
    float _1081 = fma(_741, (*spvDescriptorSet0.vp_c10)._m0[5].z, _825);
    float _1083 = trunc(_1053);
    float _1085 = precise::max(_1083, 0.0);
    uint _1087 = uint(_1085);
    float _1089 = fma(_741, (*spvDescriptorSet0.vp_c10)._m0[6].z, _827);
    int _1091 = _1065 & 3;
    float _1093 = -_849;
    float _1095 = fma(_905, _1061, _1093);
    int _1097 = ~_484;
    int _1099 = _1097 + 1;
    float _1101 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1067);
    int _1103 = _1051 + _1091;
    float _1105 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1107 = !_1011;
    int _1109 = _1107 ? 0 : 1;
    float _1111 = _1095 + 0.5;
    int _1113 = _1103 >> 2;
    float _1115 = fma(_899, _1105, _903);
    int _1117 = abs(_1109);
    float _1119 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1101);
    int _1121 = _1113 << 4;
    int _1123 = _1121 + 368;
    float _1125 = _442 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1127 = _1099 * int(_1087);
    int _1129 = _1127 + _717;
    float _1131 = float(_981);
    float _1133 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _1135 = uint(int(uint(_1123) >> uint(2)));
    uint _1137 = uint(int(uint(int(_1135)) >> uint(2)));
    int _1139 = int(_1135) & 3;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[int(_1137)][_1139];
    int _1143 = int(_1135) + 1;
    uint _1145 = uint(int(uint(_1143) >> uint(2)));
    int _1147 = _1143 & 3;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[int(_1145)][_1147];
    int _1151 = _1031 ? 0 : 1;
    float _1153 = _1119 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1155 = float(uint(_1129));
    float _1157 = _1115 + 0.5;
    float _1159 = float(_1117);
    float _1161 = _1063 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1163 = ~_1151;
    int _1165 = _1163 + 1;
    int _1167 = _1165 + 1;
    float _1169 = as_type<float>(_538) * _1155;
    int _1171 = _1167;
    if (!_1021)
    {
        int _1173 = ~_1151;
        int _1175 = _1173 + 1;
        _1171 = _1175;
    }
    int _1177 = _1171;
    float _1179 = _1159 * _1131;
    int _1181 = _1051 & 3;
    bool _1183 = _1181 != 0;
    float _1185 = trunc(_1169);
    float _1187 = precise::max(_1185, 0.0);
    uint _1189 = uint(_1187);
    bool _1191 = !_1007;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1197 = uint(_1181) > 1u;
    int _1199 = _1123 + 8;
    uint _1201 = uint(int(uint(_1199) >> uint(2)));
    uint _1203 = uint(int(uint(int(_1201)) >> uint(2)));
    int _1205 = int(_1201) & 3;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[int(_1203)][_1205];
    int _1209 = int(_1201) + 1;
    uint _1211 = uint(int(uint(_1209) >> uint(2)));
    int _1213 = _1209 & 3;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[int(_1211)][_1213];
    int _1217 = abs(_1193);
    float _1219 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1221 = _1051 & 3;
    bool _1223 = _1221 != 0;
    out.m_65.x = _1157;
    out.m_65.y = _1111;
    float _1225 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1227 = _1223 ? 0 : 1;
    float _1229 = _1089 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1231 = float(_1217);
    float _1233 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1235 = float(_1177);
    float _1237 = _1179 * (-2.0);
    int _1239 = ~_484;
    int _1241 = _1239 + 1;
    int _1243 = ~_1227;
    int _1245 = _1243 + 1;
    int _1247 = _1245 + 1;
    float _1249 = _1231 * _1235;
    int _1251 = _1247;
    if (!_1197)
    {
        int _1253 = ~_1227;
        int _1255 = _1253 + 1;
        _1251 = _1255;
    }
    int _1257 = _1251;
    out.m_67.x = _1133;
    out.m_67.y = _1219;
    out.m_67.z = _1233;
    out.m_67.w = _1153;
    int _1259 = int(_1087) + int(_1189);
    float _1261 = _1249 * (-2.0);
    bool _1263 = !_1183;
    int _1265 = _1263 ? 0 : 1;
    int _1267 = abs(_1257);
    int _1269 = abs(_1265);
    bool _1271 = _1181 != 3;
    int _1273 = _1241 * _1259;
    int _1275 = _1273 + _717;
    int _1277 = ~_1267;
    int _1279 = _1277 + 1;
    int _1281 = _1279 + 1;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1285 = _1161 + _1283;
    bool _1287 = uint(_1181) >= 2u;
    int _1289 = _1281 * as_type<int>(_1149);
    int _1291 = _1287 ? 0 : 1;
    int _1293 = ~_1269;
    int _1295 = _1293 + 1;
    int _1297 = _1295 + 1;
    int _1299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1301 = _1299 != 0;
    float _1303 = _1081 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1305 = ~_1291;
    int _1307 = _1305 + 1;
    int _1309 = _1307 + 1;
    int _1311 = _1297 * as_type<int>(_1141);
    int _1313 = _1311 + _1289;
    bool _1315 = _1181 != 3;
    float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1319 = _1303 + _1317;
    int _1321 = _1309;
    float _1323 = _1303;
    if (_1271)
    {
        int _1325 = ~_1291;
        int _1327 = _1325 + 1;
        _1321 = _1327;
    }
    int _1329 = _1321;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1333 = _1229 + _1331;
    float _1335 = in.m_69.x;
    float _1337 = in.m_69.y;
    float _1339 = in.m_69.z;
    bool _1341 = uint(_1275) >= uint(_484);
    float _1343 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1345 = !_1315;
    int _1347 = _1345 ? 0 : (-1);
    int _1349 = abs(_1329);
    bool _1351 = !_1341;
    int _1353 = _1351 ? 0 : (-1);
    int _1355 = abs(_1347);
    float _1357 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1343);
    bool _1359 = !_1301;
    int _1361 = _1359 ? 0 : 1;
    int _1363 = ~_1259;
    int _1365 = _1363 + _1353;
    int _1367 = _1365 + 1;
    float _1369 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1357);
    int _1371 = ~_1349;
    int _1373 = _1371 + 1;
    int _1375 = _1373 + 1;
    int _1377 = abs(_1361);
    int _1379 = _484 * _1367;
    int _1381 = _1379 + _717;
    float _1383 = _1319 * _1319;
    int _1385 = _1375 * as_type<int>(_1207);
    int _1387 = _1385 + _1313;
    int _1389 = ~_1355;
    int _1391 = _1389 + 1;
    int _1393 = _1391 + 1;
    float _1395 = fma(_1261, _1335, _1335);
    bool _1397 = _1369 >= 0.0;
    float _1399 = fma(_1285, _1285, _1383);
    int _1401 = _1393 * as_type<int>(_1215);
    int _1403 = _1401 + _1387;
    bool _1405 = !_607;
    int _1407 = _1405 ? _1381 : (-1);
    float _1409 = fma(_1333, _1333, _1399);
    int _1411 = ~_1377;
    int _1413 = _1411 + 1;
    int _1415 = _1413 + 1;
    float _1417 = fma(_863, _1261, _863);
    float _1419 = _573 + (-0.5);
    float _1421 = rsqrt(_1409);
    float _1423 = fma(_897, _1237, _897);
    int _1425 = _1403 * _1415;
    float _1427 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1395);
    if (_1397)
    {
        _911 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1429 = _911;
    int _1431 = _1407 * _1377;
    int _1433 = _1431 + _1425;
    bool _1435 = !_1015;
    int _1437 = _1435 ? 0 : 1;
    int _1439 = as_type<int>(_1429);
    if (_1397)
    {
        out.m_53.x = 0.0;
    }
    if (_1397)
    {
        float _1441 = _1429 * 5.0;
        _1439 = as_type<int>(_1441);
    }
    int _1443 = _1439;
    float _1445 = fma(_1237, _1337, _1337);
    float _1447 = float(_1433);
    float _1449 = fma(_1417, _915, _1427);
    int _1451 = abs(_1437);
    if (_1397)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4938 = as_type<float>(_1443);
        out.gl_Position.z = _4938;
    }
    float _1453 = _575 + (-0.5);
    float _1455 = float(_1075);
    float _1457 = _1319 * _1421;
    out.m_71.x = _1447;
    float _1459 = _1285 * _1421;
    float _1461 = _1457;
    if (_1397)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1463 = -_1457;
    float _1465 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1303);
    float _1467 = _1333 * _1421;
    float _1469 = -_1459;
    float _1471 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1161);
    float _1473 = float(_1451);
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1477 = _1465 + _1475;
    float _1479 = _1449 * 0.15915493667125701904296875;
    float _1481 = -_1467;
    float _1483 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1229);
    float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1487 = _1471 + _1485;
    float _1489 = _1477 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1491 = _773 + _573;
    float _1493 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1495 = _1483 + _1493;
    float _1497 = _1473 * _1455;
    float _1499 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1489);
    float _1501 = _1491 + (-1.0);
    float _1503 = -_1457;
    float _1505 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1319);
    float _1507 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1499);
    float _1509 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1445);
    float _1511 = _1497 * (-2.0);
    float _1513 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1515 = -_1459;
    float _1517 = fma(_1515, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1285);
    bool _1519 = _1507 >= 0.0;
    float _1521 = _1505 * _1505;
    float _1523 = fma(_1511, _1339, _1339);
    float _1525 = _773 + (-0.5);
    float _1527 = fma(_1423, _915, _1509);
    float _1529 = fma(_1517, _1517, _1521);
    float _1531 = -_1467;
    float _1533 = fma(_1531, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1333);
    float _1535 = fma(_1513, _1511, _1513);
    float _1537 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1523);
    float _1539 = _1527 * 0.15915493667125701904296875;
    float _1541 = fma(_1533, _1533, _1529);
    float _1543 = _1479 * 6.283185482025146484375;
    float _1545 = sin(_1543);
    float _1547 = fma(_1535, _915, _1537);
    float _1549 = _1523;
    if (_1519)
    {
        _1549 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1551 = _1549;
    int _1553 = as_type<int>(_1551);
    if (_1519)
    {
        out.m_53.x = 0.0;
    }
    float _1555 = _1547 * 0.15915493667125701904296875;
    if (_1519)
    {
        float _1557 = _1551 * 5.0;
        _1553 = as_type<int>(_1557);
    }
    int _1559 = _1553;
    float _1561 = _1479 * 6.283185482025146484375;
    float _1563 = cos(_1561);
    if (_1519)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5136 = as_type<float>(_1559);
        out.gl_Position.z = _5136;
    }
    float _1565 = _1539 * 6.283185482025146484375;
    float _1567 = sin(_1565);
    float _1569 = _1539 * 6.283185482025146484375;
    float _1571 = cos(_1569);
    float _1573 = sqrt(_1541);
    if (_1519)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1575 = in.m_73.x;
    float _1577 = in.m_73.y;
    float _1579 = in.m_73.z;
    float _1581 = _1555 * 6.283185482025146484375;
    float _1583 = cos(_1581);
    float _1585 = _1421 * _1573;
    float _1587 = _388 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1589 = _1545 * _1567;
    float _1591 = _1545 * _1571;
    float _1593 = _1563 * _1571;
    float _1595 = _1563 * _1567;
    float _1597 = _1555 * 6.283185482025146484375;
    float _1599 = sin(_1597);
    bool _1601 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1603 = isnan(0.5);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1609 = _1605 || _1607;
    float _1611 = _1563 * _1583;
    float _1613 = _1571 * _1583;
    float _1615 = _1545 * _1583;
    float _1617 = _1567 * _1583;
    float _1619 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1621 = _1585 * _1587;
    float _1623 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1625 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1577);
    float _1627 = _1585 * _1619;
    float _1629 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1575);
    float _1631 = _1585 * _1623;
    float _1633 = _1625 * _1621;
    float _1635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1579);
    float _1637 = _1629 * _1627;
    float _1639 = fma(_1599, _1593, _1589);
    float _1641 = _1611 * _1633;
    float _1643 = _1635 * _1631;
    float _1645 = -_1591;
    float _1647 = fma(_1599, _1595, _1645);
    float _1649 = -_1633;
    float _1651 = _1599 * _1649;
    float _1653 = fma(_1639, _1637, _1641);
    float _1655 = -_1595;
    float _1657 = fma(_1599, _1591, _1655);
    float _1659 = _1615 * _1633;
    float _1661 = fma(_1613, _1637, _1651);
    float _1663 = fma(_1647, _1643, _1653);
    float _1665 = fma(_1599, _1589, _1593);
    float _1667 = fma(_1657, _1637, _1659);
    float _1669 = fma(_1617, _1643, _1661);
    float _1671 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1673 = fma(_1665, _1643, _1667);
    float _1675 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1677 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1671);
    float _1679 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1675);
    float _1681 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1677);
    float _1683 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1679);
    float _1685 = _1681 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1687 = _1683 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1689 = _1229 + _1685;
    float _1691 = _1161 + _1687;
    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1695 = _1689 + _1693;
    float _1697 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1701 = _1691 + _1699;
    float _1703 = _1695 * _1695;
    float _1705 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1697);
    float _1707 = fma(_1701, _1701, _1703);
    float _1709 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1705);
    float _1711 = sqrt(_1707);
    float _1713 = _1709 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1715 = _1303 + _1713;
    bool _1717 = _1711 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1719 = _1633;
    float _1721 = _1691;
    float _1723 = _1689;
    float _1725 = _1673;
    float _1727 = _1575;
    if (!_1717)
    {
        _1719 = _1715;
    }
    float _1729 = _1719;
    bool _1731 = !_1717;
    float _1733 = _1729;
    if (!_1731)
    {
        float _1735 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1737 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1739 = _1711 + _1737;
        float _1741 = rsqrt(_1707);
        float _1743 = _1739 * _1735;
        float _1745 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1747 = _1743 * 0.15915493667125701904296875;
        float _1749 = _1747 * 6.283185482025146484375;
        float _1751 = cos(_1749);
        float _1753 = _1747 * 6.283185482025146484375;
        float _1755 = sin(_1753);
        float _1757 = _1751 + (-1.0);
        float _1759 = _1757 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1761 = fma(_1755, _1745, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1763 = fma(_1715, _1751, _1759);
        float _1765 = _1741 * _1761;
        float _1767 = fma(_1701, _1765, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1769 = fma(_1695, _1765, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1721 = _1767;
        _1733 = _1763;
        _1723 = _1769;
    }
    float _1771 = _1721;
    float _1773 = _1733;
    float _1775 = _1723;
    float _1777 = -_1459;
    float _1779 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1771);
    float _1781 = -_1457;
    float _1783 = fma(_1781, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1773);
    float _1785 = -_1467;
    float _1787 = fma(_1785, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1775);
    float _1789 = _1783;
    float _1791 = _1787;
    float _1793 = _1779;
    if (_1609)
    {
        _1461 = _1779;
    }
    float _1795 = _1461;
    float _1797 = _1795;
    if (!_1609)
    {
        float _1799 = _1477 * _1477;
        float _1801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1803 = -_1229;
        float _1805 = _1803 + _1775;
        float _1807 = -_1161;
        float _1809 = _1807 + _1771;
        float _1811 = fma(_1487, _1487, _1799);
        float _1813 = -_1303;
        float _1815 = _1813 + _1773;
        float _1817 = fma(_1495, _1495, _1811);
        float _1819 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1821 = sqrt(_1817);
        float _1823 = 1.0 / _1585;
        float _1825 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1827 = precise::min(_1821, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1829 = _1827 * _1801;
        float _1831 = _1829 * _1823;
        float _1833 = _1825 * _1831;
        float _1835 = _1805 * _1831;
        float _1837 = fma(_1809, _1833, _1471);
        float _1839 = fma(_1815, _1833, _1465);
        float _1841 = fma(_1825, _1835, _1483);
        _1789 = _1839;
        _1797 = _1837;
        _1791 = _1841;
    }
    float _1843 = _1789;
    float _1845 = _1797;
    float _1847 = _1791;
    float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1851 = _1843 + _1849;
    float _1853 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1855 = _1845 + _1853;
    float _1857 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1859 = _1847 + _1857;
    float _1861 = _1851 * _1851;
    float _1863 = fma(_1855, _1855, _1861);
    float _1865 = fma(_1859, _1859, _1863);
    float _1867 = rsqrt(_1865);
    float _1869 = sqrt(_1865);
    float _1871 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1873 = _1855 * _1871;
    float _1875 = _1859 * _1871;
    float _1877 = _1873 * _1873;
    float _1879 = _1875 * _1875;
    float _1881 = _1877 + _1879;
    float _1883 = sqrt(_1881);
    bool _1885 = _1883 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1889 = _1883 + _1887;
    float _1891 = _1859;
    float _1893 = _1889;
    float _1895 = _1851;
    if (_1885)
    {
        float _1897 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1891 = _1897;
    }
    float _1899 = _1891;
    if (_1885)
    {
        float _1901 = rsqrt(_1881);
        _1793 = _1901;
    }
    float _1903 = _1793;
    float _1905 = _1903;
    if (_1885)
    {
        float _1907 = _1889 * _1899;
        _1893 = _1907;
    }
    float _1909 = _1893;
    if (_1885)
    {
        float _1911 = _1909 * 0.15915493667125701904296875;
        _1323 = _1911;
    }
    float _1913 = _1323;
    float _1915 = _1867;
    float _1917 = _1913;
    if (_1885)
    {
        float _1919 = _1913 * 6.283185482025146484375;
        float _1921 = sin(_1919);
        _1915 = _1921;
    }
    float _1923 = _1915;
    float _1925 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1927 = precise::max(0.0, _1925);
    float _1929 = _1861;
    float _1931 = _1927;
    float _1933 = _1925;
    if (_1885)
    {
        float _1935 = _1913 * 6.283185482025146484375;
        float _1937 = cos(_1935);
        _1929 = _1937;
    }
    float _1939 = _1929;
    float _1941 = -_1871;
    float _1943 = -_1927;
    float _1945 = fma(_1851, _1941, _1943);
    if (!_1885)
    {
        _1895 = _1875;
    }
    float _1947 = _1895;
    float _1949 = _1947;
    if (_1885)
    {
        float _1951 = _1945 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1931 = _1951;
    }
    float _1953 = _1931;
    float _1955 = _1953;
    if (!_1885)
    {
        _1917 = _1879;
    }
    float _1957 = _1917;
    float _1959 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1961 = _1923;
    float _1963 = _1957;
    if (_1885)
    {
        float _1965 = fma(_1923, _1953, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1955 = _1965;
    }
    float _1967 = _1955;
    if (!_1885)
    {
        _1961 = _1945;
    }
    float _1969 = _1961;
    float _1971 = _1969;
    float _1973 = _1939;
    if (_1885)
    {
        float _1975 = _1939 + (-1.0);
        _1933 = _1975;
    }
    float _1977 = _1933;
    float _1979 = _1977;
    if (_1885)
    {
        float _1981 = _1903 * _1967;
        _1725 = _1981;
    }
    float _1983 = _1725;
    if (!_1885)
    {
        _1905 = _1873;
    }
    float _1985 = _1905;
    float _1987 = _1985;
    if (_1885)
    {
        float _1989 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1979 = _1989;
    }
    float _1991 = _1979;
    if (_1885)
    {
        float _1993 = _1873 * _1983;
        _1987 = _1993;
    }
    float _1995 = _1987;
    if (_1885)
    {
        float _1997 = _1875 * _1983;
        _1949 = _1997;
    }
    float _1999 = _1949;
    if (_1885)
    {
        float _2001 = fma(_1945, _1939, _1991);
        _1971 = _2001;
    }
    float _2003 = _1971;
    if (!_1885)
    {
        _1973 = _1877;
    }
    float _2005 = _1973;
    float _2007 = _2005;
    if (_1885)
    {
        float _2009 = _1995 * _1995;
        _2007 = _2009;
    }
    float _2011 = _2007;
    if (_1885)
    {
        float _2013 = _1999 * _1999;
        _1963 = _2013;
    }
    float _2015 = _1963;
    float _2017 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1959);
    float _2019 = fma(_2003, _2003, _2011);
    float _2021 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2023 = fma(_1471, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2025 = _2019 + _2015;
    float _2027 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2021);
    float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2031 = fma(_1869, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2029);
    float _2033 = precise::clamp(_2031, 0.0, 1.0);
    float _2035 = rsqrt(_2025);
    float _2037 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2027);
    float _2039 = -_2033;
    float _2041 = _2039 + 1.0;
    float _2043 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2047 = floor(_2023);
    float _2049 = _2043 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2051 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2053 = fma(_1483, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2055 = -_2049;
    float _2057 = fma(_2055, _2045, 1.0);
    float _2059 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2061 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2051);
    float _2063 = _2035 * _1995;
    float _2065 = _2035 * _1999;
    float _2067 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2059);
    float _2069 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2061);
    float _2071 = abs(_2041);
    float _2073 = log2(_2071);
    float _2075 = _2035 * _2003;
    float _2077 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2079 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2067);
    float _2081 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2083 = -_2047;
    float _2085 = _2023 + _2083;
    float _2087 = -_2077;
    float _2089 = fma(_2075, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2087);
    float _2091 = _2079 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2093 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2095 = floor(_2053);
    float _2097 = -_2065;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2089);
    float _2101 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2017);
    float _2103 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2093);
    float _2105 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2107 = fma(_2099, 0.5, 0.5);
    float _2109 = _2101 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2111 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2103);
    float _2113 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2115 = log2(_2057);
    float _2117 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2119 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2111);
    float _2121 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2105);
    float _2123 = fma(_2107, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2125 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2117);
    float _2127 = exp2(_2113);
    float _2129 = fma(_2099, -0.5, 0.5);
    float _2131 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2125);
    float _2133 = -_2095;
    float _2135 = _2053 + _2133;
    float _2137 = _2075 + 1.0;
    float _2139 = fma(_2107, _2123, -0.212114393711090087890625);
    float _2141 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2131);
    float _2143 = sqrt(_2129);
    float _2145 = fma(_2107, _2139, 1.570728778839111328125);
    float _2147 = _2115 * 0.693147182464599609375;
    float _2149 = 1.0 / _2119;
    float _2151 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2121);
    float _2153 = -_2075;
    float _2155 = fma(_2127, _2137, _2153);
    float _2157 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2151);
    float2 _6110 = float2(_2085, _2135);
    float _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6110, float2(0.0), isnan(_6110)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6110, float2(0.0), isnan(_6110)), level(0.0)).x;
    float _2161 = fma(_2155, 0.5, 0.5);
    float _2163 = _2143 * 0.636619746685028076171875;
    float _2165 = -_2145;
    float _2167 = fma(_2163, _2165, 1.0);
    float _2169 = _2157 * _2149;
    float _2171 = _2141 * _2149;
    float _2173 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2175 = fma(_2169, 0.5, 0.5);
    float _2177 = fma(_2171, -0.5, 0.5);
    float3 _6145 = float3(_2175, _2177, _2173);
    float _2179 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6145, float3(0.0), isnan(_6145)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6145, float3(0.0), isnan(_6145)), level(0.0)).x;
    float3 _6156 = float3(_2175, _2177, _2173);
    float4 _2182 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6156, float3(0.0), isnan(_6156)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6156, float3(0.0), isnan(_6156)), level(0.0)).xyzw;
    float _2184 = _2182.x;
    float _2186 = _2182.y;
    float _2188 = _2182.z;
    float _2190 = _2182.w;
    float2 _6172 = float2(_2167, _2161);
    float3 _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6172, float2(0.0), isnan(_6172)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6172, float2(0.0), isnan(_6172)), level(0.0)).xyz;
    float _2196 = _2194.x;
    float _2198 = _2194.y;
    float _2200 = _2194.z;
    float _2202 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2204 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2206 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2208 = _1577 != 0.0;
    bool _2210 = isnan(_1577);
    bool _2212 = _2208 || _2210;
    bool _2214 = isnan(0.0);
    bool _2216 = _2212 || _2214;
    float _2218 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2202);
    float _2220 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2204);
    float _2222 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2224 = _1575 == 0.0;
    bool _2226 = !_2216;
    bool _2228 = _2224 && _2226;
    float _2230 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2218);
    float _2232 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2220);
    float _2234 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2236 = _2230 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2238 = _2232 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2240 = _1579 == 0.0;
    bool _2242 = _2240 && _2228;
    float _2244 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2246 = 1.0 / _2236;
    float _2248 = _2238 + _2236;
    float _2250 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2252 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2234);
    float _2254 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2206);
    float _2256 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2258 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2260 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2262 = isnan(0.5);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2268 = _2264 || _2266;
    float _2270 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2272 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2274 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2256);
    float _2276 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2258);
    float _2278 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2252);
    float _2280 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2272);
    float _2282 = -_1599;
    float _2284 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2222);
    float _2286 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2288 = _2248 * _2246;
    float _2290 = _2288 * 0.5;
    float _2292 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2276);
    float _2294 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2284);
    float _2296 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2286);
    float _2298 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2300 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2298);
    float _2302 = exp2(_2270);
    float _2304 = in.m_75.x;
    float _2306 = in.m_75.y;
    float _2308 = in.m_75.z;
    float _2310 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2296);
    float _2312 = 1.0 / _2300;
    float _2314 = -_2302;
    float _2316 = _2314 + 1.0;
    float _2318 = -_1599;
    float _2320 = fma(_2318, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2244);
    float _2322 = -_1599;
    float _2324 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2250);
    float _2326 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2328 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2280);
    float _2330 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2320);
    float _2332 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2324);
    float _2334 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2336 = _2312 * _2334;
    float _2338 = _2306;
    float _2340 = _2304;
    float _2342 = _2308;
    float _2344 = _2119;
    float _2346 = _2141;
    if (!_2242)
    {
        float _2348 = fma(_1577, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2306);
        _2338 = _2348;
    }
    float _2350 = _2338;
    float _2352 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2326);
    float _2354 = abs(_2336);
    float _2356 = log2(_2354);
    if (!_2242)
    {
        float _2358 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2304);
        _2340 = _2358;
    }
    float _2360 = _2340;
    float _2362 = _2294 * _2350;
    float _2364 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2352);
    float _2366 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2254);
    float _2368 = _2330 * _2350;
    float _2370 = _2332 * _2350;
    if (!_2242)
    {
        float _2372 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2308);
        _2342 = _2372;
    }
    float _2374 = _2342;
    float _2376 = fma(_2278, _2360, _2362);
    float _2378 = fma(_2328, _2360, _2368);
    float _2380 = fma(_2366, _2360, _2370);
    float _2382 = _2316 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2384 = fma(_2310, _2374, _2376);
    float _2386 = _2376;
    if (!_2268)
    {
        float _2388 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2390 = _2336 + _2388;
        _2386 = _2390;
    }
    float _2392 = _2386;
    bool _2394 = _2336 <= 8000.0;
    bool _2396 = isnan(_2336);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan(8000.0);
    bool _2402 = _2398 || _2400;
    float _2404 = float(_2402);
    float _2406 = fma(_2364, _2374, _2378);
    float _2408 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (!_2268)
    {
        _1727 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2410 = _1727;
    float _2412 = exp2(_2408);
    float _2414 = _2410;
    float _2416 = _2157;
    if (!_2268)
    {
        float _2418 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2420 = _2410 + _2418;
        _2414 = _2420;
    }
    float _2422 = _2414;
    bool _2424 = _1869 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2426 = isnan(_1869);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2432 = _2428 || _2430;
    float _2434 = _2328;
    float _2436 = _2422;
    if (!_2268)
    {
        float _2438 = 1.0 / _2422;
        _2434 = _2438;
    }
    float _2440 = _2434;
    float _2442 = fma(_2412, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2444 = precise::clamp(_2442, 0.0, 1.0);
    float _2446 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2274);
    if (_2268)
    {
        _2436 = 1.0;
    }
    float _2448 = _2436;
    float _2450 = fma(_2444, -2.0, 3.0);
    float _2452 = _2444 * _2444;
    float _2454 = fma(_2446, _2374, _2380);
    float _2456 = _2448;
    if (!_2268)
    {
        float _2458 = _2392 * _2440;
        float _2460 = precise::clamp(_2458, 0.0, 1.0);
        _2456 = _2460;
    }
    float _2462 = _2456;
    float _2464 = _2452 * _2450;
    out.m_77.x = _2384;
    out.m_77.y = _2406;
    out.m_77.z = _2454;
    float _2466 = -_2464;
    float _2468 = _2466 + 1.0;
    float _2470 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2464);
    float _2472 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2292);
    float _2474 = in.m_79.x;
    float _2476 = _2404 * _2470;
    float _2478 = _2472 + _2119;
    out.gl_Position.x = _2157;
    out.gl_Position.y = _2141;
    out.gl_Position.z = _2472;
    out.gl_Position.w = _2119;
    float _2480 = _2476 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2482 = _2478 * 0.5;
    out.m_81.z = _2482;
    out.m_81.w = _2119;
    float _2484 = _2472;
    if (!_2432)
    {
        _2344 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2486 = _2344;
    float _2488 = _2486;
    float _2490 = _2486;
    if (!_2432)
    {
        _2346 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2492 = _2346;
    float _2494 = _2492;
    float _2496 = _2492;
    if (!_2432)
    {
        _2484 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2498 = _2484;
    float _2500 = _2498;
    float _2502 = _2498;
    if (!_2432)
    {
        _2416 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2504 = _2416;
    float _2506 = -_2159;
    float _2508 = _2506 + 1.0;
    float _2510 = _2508 * _2480;
    float _2512 = precise::clamp(_2510, 0.0, 1.0);
    float _2514 = -_2512;
    float _2516 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2518 = _2516 * _2474;
    float _2520 = _2382 * _2179;
    float _2522 = -_2382;
    float _2524 = _2522 + 1.0;
    float _2526 = _2190 * _2520;
    float _2528 = _2200 * _2520;
    float _2530 = _2190 * _2524;
    float _2532 = fma(_2196, _2526, _2184);
    float _2534 = fma(_2198, _2526, _2186);
    float _2536 = _2518 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2538 = fma(_2190, _2528, _2188);
    float _2540 = _2462 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2542 = _2526;
    float _2544 = _2518;
    float _2546 = _2504;
    float _2548 = _2504;
    if (!_2432)
    {
        _2542 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2550 = _2542;
    out.m_83.x = _2536;
    float _2552 = _2550;
    float _2554 = _2550;
    if (!_2432)
    {
        _2544 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2556 = _2544;
    out.m_85.x = _2532;
    out.m_85.y = _2534;
    out.m_85.z = _2538;
    out.m_85.w = _2530;
    bool _2558 = !_2432;
    float _2560 = _2556;
    float _2562 = _2556;
    if (!_2558)
    {
        bool _2564 = _1869 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2566 = isnan(_1869);
        bool _2568 = _2564 || _2566;
        bool _2570 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2572 = _2568 || _2570;
        if (!_2572)
        {
            float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2576 = _1869 + _2574;
            float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2580 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2578;
            float _2582 = 1.0 / _2580;
            float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2586 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2590 = _2588 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2594 = _2592 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2598 = _2596 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2600 = _2576 * _2582;
            float _2602 = precise::clamp(_2600, 0.0, 1.0);
            float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2612 = fma(_2602, _2586, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2614 = fma(_2602, _2606, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2616 = fma(_2602, _2610, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2618 = fma(_2602, _2590, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2620 = fma(_2602, _2594, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2622 = fma(_2602, _2598, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2496 = _2616;
            _2554 = _2620;
            _2490 = _2614;
            _2548 = _2618;
            _2502 = _2612;
            _2562 = _2622;
            _2624 = true;
        }
        else
        {
            bool _2626 = _1869 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2628 = isnan(_1869);
            bool _2630 = _2626 || _2628;
            bool _2632 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2634 = _2630 || _2632;
            if (!_2634)
            {
                _2488 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2636 = _2488;
            _2490 = _2636;
            if (!_2634)
            {
                _2494 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2638 = _2494;
            _2496 = _2638;
            if (!_2634)
            {
                _2500 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2640 = _2500;
            _2502 = _2640;
            if (!_2634)
            {
                _2546 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2642 = _2546;
            _2548 = _2642;
            if (!_2634)
            {
                _2552 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2644 = _2552;
            _2554 = _2644;
            if (!_2634)
            {
                _2560 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2646 = _2560;
            bool _2648 = !_2634;
            _2562 = _2646;
            if (!_2648)
            {
                bool _2650 = _1869 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2652 = isnan(_1869);
                bool _2654 = _2650 || _2652;
                bool _2656 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2658 = _2654 || _2656;
                if (!_2658)
                {
                    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2662 = _1869 + _2660;
                    float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2666 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2664;
                    float _2668 = 1.0 / _2666;
                    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2682 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2684 = _2682 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2686 = _2662 * _2668;
                    float _2688 = precise::clamp(_2686, 0.0, 1.0);
                    float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2692 = _2690 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2698 = fma(_2688, _2672, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2700 = fma(_2688, _2692, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2702 = fma(_2688, _2696, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2704 = fma(_2688, _2676, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2706 = fma(_2688, _2680, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2708 = fma(_2688, _2684, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2496 = _2702;
                    _2554 = _2706;
                    _2490 = _2700;
                    _2548 = _2704;
                    _2502 = _2698;
                    _2562 = _2708;
                    _2624 = true;
                }
                else
                {
                    _2496 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2554 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2490 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2548 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2502 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2562 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2624 = false;
    float _2710 = _2496;
    float _2712 = _2554;
    float _2714 = _2490;
    float _2716 = _2548;
    float _2718 = _2502;
    float _2720 = _2562;
    float _2722 = _2540 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2724 = fma(_2406, -0.5, 0.5);
    float _2726 = precise::clamp(_2724, 0.0, 1.0);
    float _2728 = -_2710;
    float _2730 = _2728 + _2712;
    float _2732 = -_2714;
    float _2734 = _2732 + _2716;
    out.m_53.x = _2722;
    float _2736 = fma(_2726, _2730, _2710);
    float _2738 = -_2718;
    float _2740 = _2738 + _2720;
    float _2742 = fma(_2726, _2734, _2714);
    float _2744 = _2736 * 0.586610972881317138671875;
    bool _2746 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2748 = fma(_2726, _2740, _2718);
    out.m_87.x = 0.0;
    float _2750 = fma(_2742, 0.298911988735198974609375, _2744);
    bool _2752 = _2462 > 0.0;
    bool _2754 = isnan(_2462);
    bool _2756 = _2752 || _2754;
    bool _2758 = isnan(0.0);
    bool _2760 = _2756 || _2758;
    float _2762 = fma(_2748, 0.114477999508380889892578125, _2750);
    float _2764 = -_2762;
    float _2766 = _2742 + _2764;
    float _2768 = -_2762;
    float _2770 = _2736 + _2768;
    float _2772 = -_2762;
    float _2774 = _2748 + _2772;
    float _2776 = fma(_2766, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2762);
    float _2778 = fma(_2770, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2762);
    float _2780 = fma(_2774, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2762);
    bool _2782 = !_2746;
    if (!_2782)
    {
        float _2784 = -_1843;
        float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2788 = -_1845;
        float _2790 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2792 = -_1847;
        float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2796 = _2786 * _2786;
        float _2798 = fma(_2790, _2790, _2796);
        float _2800 = fma(_2794, _2794, _2798);
        float _2802 = sqrt(_2800);
        float _2804 = rsqrt(_2800);
        float _2806 = -_2802;
        float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2810 = _2808 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2812 = precise::clamp(_2810, 0.0, 1.0);
        float _2814 = _2790 * _2804;
        float _2816 = _2786 * _2804;
        float _2818 = abs(_2812);
        float _2820 = log2(_2818);
        float _2822 = _2794 * _2804;
        float _2824 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2826 = _2406 * _2816;
        float _2828 = -_2816;
        float _2830 = -_2824;
        float _2832 = fma(_2828, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2830);
        float _2834 = fma(_2384, _2814, _2826);
        float _2836 = -_2822;
        float _2838 = fma(_2836, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2832);
        float _2840 = fma(_2454, _2822, _2834);
        float _2842 = precise::clamp(_2840, 0.0, 1.0);
        float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2846 = _2838 + _2844;
        float _2848 = _2820 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2850 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2852 = precise::clamp(_2850, 0.0, 1.0);
        float _2854 = exp2(_2848);
        float _2856 = _2854 * _2852;
        float _2858 = _2842 * _2856;
        float _2860 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2862 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2864 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2860;
        out.m_87.y = _2862;
        out.m_87.z = _2864;
    }
    out.m_89.x = _2776;
    out.m_89.y = _2778;
    out.m_89.z = _2780;
    if (_2760)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2866 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2866;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2624 = false;
    bool _468 = false;
    bool _348 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = in.m_48.w;
    float _107 = trunc(_103);
    int _110 = int(_107);
    float _112 = -_105;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _114;
    bool _118 = _110 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_110);
    float _124 = _114;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _120;
    if (!_118)
    {
        out.m_53.x = 0.0;
    }
    int _128 = 0;
    if (!_118)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2935 = as_type<float>(_132);
        out.gl_Position.z = _2935;
    }
    if (!_118)
    {
        return out;
    }
    bool _136 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_105);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = float(_110);
    bool _148 = _114 >= _146;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    if (_152)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _122;
    if (_152)
    {
        out.m_53.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _134 = as_type<int>(_156);
    }
    int _158 = _134;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2990 = as_type<float>(_158);
        out.gl_Position.z = _2990;
    }
    if (_152)
    {
        return out;
    }
    float _160 = 1.0 / _146;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _164 = _114 * _160;
    bool _166 = !_162;
    float _184;
    if (!_166)
    {
        float _168 = in.m_55.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        _184 = _164;
    }
    _186 = false;
    float _188 = _184;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _192 = _188 + _190;
    bool _194 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _196 = isnan(_188);
    bool _198 = _194 || _196;
    bool _200 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _202 = _198 || _200;
    float _204 = float(_202);
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _188 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = 1.0 / _212;
    bool _220 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _222 = 1.0 / _216;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _224;
    float _228 = _192 * _218;
    bool _230 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _232 = isnan(_188);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -_204;
    float _244 = _242 + 1.0;
    bool _246 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _248 = isnan(_188);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = fma(_226, _228, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _260 = _256 * _244;
    float _262 = -_256;
    float _264 = _262 + 1.0;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    float _274 = _208 * _222;
    float _276 = _240 * _264;
    float _278 = fma(_268, _228, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _280 = fma(_272, _228, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _282 = -_240;
    float _284 = _282 + 1.0;
    float _286 = _258 * _276;
    float _288 = _278 * _276;
    float _290 = _280 * _276;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _304 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[143].x, _288);
    float _306 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _308 = fma(_294, _274, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _310 = fma(_298, _274, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _312 = fma(_302, _274, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _314 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[143].z, _290);
    float _316 = fma(_308, _260, _304);
    float _318 = fma(_310, _260, _306);
    float _320 = fma(_312, _260, _314);
    float _322 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[145].x, _316);
    float _324 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[145].y, _318);
    float _326 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[145].z, _320);
    bool _328 = !_220;
    float _346;
    if (!_328)
    {
        float _330 = in.m_55.x;
        float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _334 = _330 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[11].x, _114);
        float _338 = _336 * _332;
        float _340 = floor(_338);
        float _342 = -_340;
        float _344 = _338 + _342;
        _346 = _344;
        _348 = true;
    }
    else
    {
        _346 = _164;
    }
    _348 = false;
    float _350 = _346;
    float _352 = in.m_57.x;
    float _354 = in.m_57.y;
    float _356 = in.m_57.z;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _360 = _350 + _358;
    bool _362 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _364 = isnan(_350);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _376;
    float _380 = -_372;
    float _382 = _380 + 1.0;
    float _384 = 1.0 / _378;
    float _386 = _326 * _356;
    float _388 = _324 * _354;
    float _390 = _360 * _384;
    bool _392 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _394 = isnan(_350);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _412;
    float _416 = _402 * _382;
    float _418 = fma(_406, _390, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _420 = fma(_410, _390, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _422 = fma(_414, _390, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _424 = -_402;
    float _426 = _424 + 1.0;
    float _428 = _418 * _416;
    float _430 = _420 * _416;
    float _432 = _422 * _416;
    float _434 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[107].x, _428);
    float _436 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[107].y, _430);
    float _438 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[107].z, _432);
    float _440 = _322 * _352;
    float _442 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[108].x, _434);
    float _444 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[108].y, _436);
    float _446 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[108].z, _438);
    bool _448 = !_374;
    float _466;
    if (!_448)
    {
        float _450 = in.m_55.x;
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _454 = _450 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _456 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _458 = _456 * _452;
        float _460 = floor(_458);
        float _462 = -_460;
        float _464 = _458 + _462;
        _466 = _464;
        _468 = true;
    }
    else
    {
        _466 = _164;
    }
    _468 = false;
    float _470 = _466;
    float _472 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _474 = int(_472);
    float _476 = in.m_59.y;
    int _478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _480 = _478 != 0;
    float _482 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _484 = int(_482);
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _492 = _490 != 0;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _496 = _494 != 0;
    float _498 = float(_474);
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _502 = 1.0 / _498;
    float _504 = 0.0;
    float _506 = _476;
    if (_488)
    {
        float _508 = in.m_55.x;
        _504 = _508;
    }
    float _510 = _504;
    float _512 = float(uint(_484));
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _516 = ~_484;
    int _518 = _516 + 1;
    int _520 = ~_484;
    int _522 = _520 + 1;
    float _524 = 1.0 / _512;
    float _526 = float(_484);
    float _528 = _502 * _114;
    float _530 = trunc(_528);
    int _532 = int(_530);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _534;
    int _538 = as_type<int>(_524) + (-2);
    float _540 = float(uint(_532));
    float _542 = float(_532);
    float _544 = as_type<float>(_538) * _540;
    bool _546 = _542 >= _526;
    bool _548 = isnan(_542);
    bool _550 = _546 || _548;
    bool _552 = isnan(_526);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = trunc(_544);
    float _560 = precise::max(_558, 0.0);
    uint _563 = uint(_560);
    float _565 = trunc(_556);
    int _567 = int(_565);
    int _569 = _518 * int(_563);
    int _571 = _569 + _532;
    float _573 = in.m_55.x;
    float _575 = in.m_55.y;
    float _577 = float(uint(_571));
    float _579 = as_type<float>(_538) * _577;
    float _581 = trunc(_579);
    float _583 = precise::max(_581, 0.0);
    uint _585 = uint(_583);
    int _587 = int(_563) + int(_585);
    bool _589 = !_480;
    float _591 = _589 ? 7.345489978790283203125 : 1.0;
    float _593 = _591 * _573;
    int _595 = _522 * _587;
    int _597 = _595 + _532;
    float _599 = floor(_593);
    bool _601 = uint(_597) >= uint(_484);
    bool _603 = !_601;
    int _605 = _603 ? 0 : (-1);
    bool _607 = _484 == 0;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    int _609 = ~_587;
    int _611 = _609 + _605;
    int _613 = _611 + 1;
    float _615 = -_599;
    float _617 = _593 + _615;
    int _619 = _484 * _613;
    int _621 = _619 + _532;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _625 = _623 != 0;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _629 = _627 != 0;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _633 = _631 != 0;
    float _635 = _617 * _526;
    float _637 = _526 * _114;
    int _639 = ~_567;
    int _641 = _639 + 1;
    int _643 = _641 + 1;
    bool _645 = !_607;
    int _647 = _645 ? _621 : (-1);
    float _649 = _637 * _160;
    int _651 = _484 + (-1);
    float _653 = trunc(_635);
    int _655 = int(_653);
    bool _657 = !_496;
    int _659 = _657 ? 0 : 1;
    int _661 = _647 * _643;
    bool _663 = !_629;
    int _665 = _663 ? 0 : 1;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _669 = 1.0 + _667;
    bool _671 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _673 = isnan(1.0);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _679 = _675 || _677;
    int _681 = _567 * _651;
    int _683 = _681 + _661;
    bool _685 = !_625;
    int _687 = _685 ? 0 : 1;
    float _689 = trunc(_649);
    int _691 = int(_689);
    int _693 = abs(_665);
    float _695 = -_476;
    float _697 = _695 + 1.0;
    bool _699 = _575 > 0.5;
    int _701 = abs(_687);
    if (_492)
    {
        float _703 = _699 ? _697 : _476;
        _506 = _703;
    }
    float _705 = _506;
    int _707 = abs(_659);
    int _709 = _683 * _693;
    bool _711 = !_633;
    int _713 = _711 ? 0 : 1;
    int _715 = _655 * _707;
    int _717 = _715 + _532;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _721 = _719 != 0;
    float _723 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _725 = log2(_723);
    int _727 = abs(_713);
    int _729 = _691 * _701;
    int _731 = _729 + _709;
    bool _733 = !_721;
    int _735 = _733 ? 0 : 1;
    float _737 = in.m_46.x;
    float _739 = in.m_46.y;
    float _741 = in.m_46.z;
    int _743 = _717 * _727;
    int _745 = _743 + _731;
    int _747 = abs(_735);
    float _749 = _575 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _751 = _573 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _753 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _755 = isnan(0.0);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _761 = _757 || _759;
    int _763 = _655 * _747;
    int _765 = _763 + _745;
    float _767 = fma(_749, -2.0, _500);
    float _769 = -_514;
    float _771 = fma(_751, 2.0, _769);
    float _773 = in.m_55.z;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _779 = float(uint(_765));
    float _781 = _725 * _114;
    float _783 = 1.0 / _777;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _787 = as_type<float>(_538) * _779;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _791 = _573 * 2.0;
    float _793 = _785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _795 = _510 > 0.5;
    bool _797 = _795 && _488;
    float _799 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _801 = trunc(_787);
    float _803 = precise::max(_801, 0.0);
    uint _805 = uint(_803);
    float _807 = _739 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _809 = _739 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _811 = _739 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _813 = ~_484;
    int _815 = _813 + 1;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _819 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[4].x, _807);
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _823 = exp2(_781);
    float _825 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[5].x, _809);
    float _827 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[6].x, _811);
    float _829 = _575 + _573;
    float _831 = _817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _833 = _536 * _783;
    float _835 = in.m_59.x;
    int _837 = _815 * int(_805);
    int _839 = _837 + _765;
    float _841 = floor(_791);
    float _843 = _829 + (-1.0);
    out.m_63.x = _831;
    out.m_63.y = _793;
    out.m_63.z = _799;
    out.m_63.w = _821;
    int _845 = ~_484;
    int _847 = _845 + 1;
    float _849 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _767);
    float _851 = float(uint(_839));
    float _853 = 1.0 / _669;
    float _855 = -_823;
    float _857 = _855 + 1.0;
    float _859 = as_type<float>(_538) * _851;
    float _861 = _761 ? _857 : 0.0;
    float _863 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _865 = trunc(_859);
    float _867 = precise::max(_865, 0.0);
    uint _869 = uint(_867);
    float _871 = _575 + _773;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _875 = _871 + (-1.0);
    bool _877 = _841 > 0.0;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _881 = _841 >= 0.0;
    bool _883 = isnan(_841);
    bool _885 = _881 || _883;
    bool _887 = isnan(0.0);
    bool _889 = _885 || _887;
    float _891 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[78].z, _873);
    float _893 = _575 * 2.0;
    float _895 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[78].w, _879);
    float _897 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _899 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _891);
    float _901 = -_114;
    float _903 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[76].x, _771);
    float _905 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _895);
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _909 = _835;
    float _911 = _863;
    if (_679)
    {
        float _913 = _861 * _853;
        _124 = _913;
    }
    float _915 = _124;
    int _917 = int(_805) + int(_869);
    float _919 = floor(_893);
    float _921 = _773 * 2.0;
    int _923 = _889 ? 0 : 1;
    if (_488)
    {
        _907 = _835;
    }
    float _925 = _907;
    int _927 = _847 * _917;
    int _929 = _927 + _765;
    float _931 = floor(_921);
    float _933 = _925;
    if (_797)
    {
        float _935 = -_925;
        float _937 = _935 + 1.0;
        _933 = _937;
    }
    float _939 = _933;
    bool _941 = uint(_929) >= uint(_484);
    int _943 = ~_923;
    int _945 = _943 + 1;
    int _947 = _945 + 1;
    bool _949 = !_941;
    int _951 = _949 ? 0 : (-1);
    bool _953 = _919 >= 0.0;
    bool _955 = isnan(_919);
    bool _957 = _953 || _955;
    bool _959 = isnan(0.0);
    bool _961 = _957 || _959;
    bool _963 = _919 > 0.0;
    int _965 = ~_917;
    int _967 = _965 + _951;
    int _969 = _967 + 1;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _973 = _470 + _971;
    int _975 = _947;
    if (!_877)
    {
        int _977 = ~_923;
        int _979 = _977 + 1;
        _975 = _979;
    }
    int _981 = _975;
    int _983 = _961 ? 0 : 1;
    int _985 = _484 * _969;
    int _987 = _985 + _765;
    bool _989 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _991 = isnan(_470);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _997 = _993 || _995;
    float _999 = float(_997);
    float _1001 = fma(_833, _973, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    if (_488)
    {
        _909 = _939;
    }
    float _1003 = _909;
    int _1005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1007 = _1005 != 0;
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1011 = _1009 != 0;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1015 = _1013 != 0;
    float _1017 = -_999;
    float _1019 = _1017 + 1.0;
    bool _1021 = _931 > 0.0;
    bool _1023 = _931 >= 0.0;
    bool _1025 = isnan(_931);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan(0.0);
    bool _1031 = _1027 || _1029;
    bool _1033 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1035 = isnan(_470);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    float _1045 = float(uint(_717));
    float _1047 = _1043 * _1019;
    bool _1049 = !_607;
    int _1051 = _1049 ? _987 : (-1);
    float _1053 = as_type<float>(_538) * _1045;
    int _1055 = ~_983;
    int _1057 = _1055 + 1;
    int _1059 = _1057 + 1;
    float _1061 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1063 = fma(_741, (*spvDescriptorSet0.vp_c10)._m0[4].z, _819);
    int _1065 = _1051 >> 31;
    float _1067 = _1001 * _1047;
    int _1069 = _1059;
    if (!_963)
    {
        int _1071 = ~_983;
        int _1073 = _1071 + 1;
        _1069 = _1073;
    }
    int _1075 = _1069;
    float _1077 = -_1043;
    float _1079 = _1077 + 1.0;
    float _1081 = fma(_741, (*spvDescriptorSet0.vp_c10)._m0[5].z, _825);
    float _1083 = trunc(_1053);
    float _1085 = precise::max(_1083, 0.0);
    uint _1087 = uint(_1085);
    float _1089 = fma(_741, (*spvDescriptorSet0.vp_c10)._m0[6].z, _827);
    int _1091 = _1065 & 3;
    float _1093 = -_849;
    float _1095 = fma(_905, _1061, _1093);
    int _1097 = ~_484;
    int _1099 = _1097 + 1;
    float _1101 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1067);
    int _1103 = _1051 + _1091;
    float _1105 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1107 = !_1011;
    int _1109 = _1107 ? 0 : 1;
    float _1111 = _1095 + 0.5;
    int _1113 = _1103 >> 2;
    float _1115 = fma(_899, _1105, _903);
    int _1117 = abs(_1109);
    float _1119 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1101);
    int _1121 = _1113 << 4;
    int _1123 = _1121 + 368;
    float _1125 = _442 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1127 = _1099 * int(_1087);
    int _1129 = _1127 + _717;
    float _1131 = float(_981);
    float _1133 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _1135 = uint(int(uint(_1123) >> uint(2)));
    uint _1137 = uint(int(uint(int(_1135)) >> uint(2)));
    int _1139 = int(_1135) & 3;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[int(_1137)][_1139];
    int _1143 = int(_1135) + 1;
    uint _1145 = uint(int(uint(_1143) >> uint(2)));
    int _1147 = _1143 & 3;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[int(_1145)][_1147];
    int _1151 = _1031 ? 0 : 1;
    float _1153 = _1119 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1155 = float(uint(_1129));
    float _1157 = _1115 + 0.5;
    float _1159 = float(_1117);
    float _1161 = _1063 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1163 = ~_1151;
    int _1165 = _1163 + 1;
    int _1167 = _1165 + 1;
    float _1169 = as_type<float>(_538) * _1155;
    int _1171 = _1167;
    if (!_1021)
    {
        int _1173 = ~_1151;
        int _1175 = _1173 + 1;
        _1171 = _1175;
    }
    int _1177 = _1171;
    float _1179 = _1159 * _1131;
    int _1181 = _1051 & 3;
    bool _1183 = _1181 != 0;
    float _1185 = trunc(_1169);
    float _1187 = precise::max(_1185, 0.0);
    uint _1189 = uint(_1187);
    bool _1191 = !_1007;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1197 = uint(_1181) > 1u;
    int _1199 = _1123 + 8;
    uint _1201 = uint(int(uint(_1199) >> uint(2)));
    uint _1203 = uint(int(uint(int(_1201)) >> uint(2)));
    int _1205 = int(_1201) & 3;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[int(_1203)][_1205];
    int _1209 = int(_1201) + 1;
    uint _1211 = uint(int(uint(_1209) >> uint(2)));
    int _1213 = _1209 & 3;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[int(_1211)][_1213];
    int _1217 = abs(_1193);
    float _1219 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1221 = _1051 & 3;
    bool _1223 = _1221 != 0;
    out.m_65.x = _1157;
    out.m_65.y = _1111;
    float _1225 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1227 = _1223 ? 0 : 1;
    float _1229 = _1089 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1231 = float(_1217);
    float _1233 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1235 = float(_1177);
    float _1237 = _1179 * (-2.0);
    int _1239 = ~_484;
    int _1241 = _1239 + 1;
    int _1243 = ~_1227;
    int _1245 = _1243 + 1;
    int _1247 = _1245 + 1;
    float _1249 = _1231 * _1235;
    int _1251 = _1247;
    if (!_1197)
    {
        int _1253 = ~_1227;
        int _1255 = _1253 + 1;
        _1251 = _1255;
    }
    int _1257 = _1251;
    out.m_67.x = _1133;
    out.m_67.y = _1219;
    out.m_67.z = _1233;
    out.m_67.w = _1153;
    int _1259 = int(_1087) + int(_1189);
    float _1261 = _1249 * (-2.0);
    bool _1263 = !_1183;
    int _1265 = _1263 ? 0 : 1;
    int _1267 = abs(_1257);
    int _1269 = abs(_1265);
    bool _1271 = _1181 != 3;
    int _1273 = _1241 * _1259;
    int _1275 = _1273 + _717;
    int _1277 = ~_1267;
    int _1279 = _1277 + 1;
    int _1281 = _1279 + 1;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1285 = _1161 + _1283;
    bool _1287 = uint(_1181) >= 2u;
    int _1289 = _1281 * as_type<int>(_1149);
    int _1291 = _1287 ? 0 : 1;
    int _1293 = ~_1269;
    int _1295 = _1293 + 1;
    int _1297 = _1295 + 1;
    int _1299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1301 = _1299 != 0;
    float _1303 = _1081 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1305 = ~_1291;
    int _1307 = _1305 + 1;
    int _1309 = _1307 + 1;
    int _1311 = _1297 * as_type<int>(_1141);
    int _1313 = _1311 + _1289;
    bool _1315 = _1181 != 3;
    float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1319 = _1303 + _1317;
    int _1321 = _1309;
    float _1323 = _1303;
    if (_1271)
    {
        int _1325 = ~_1291;
        int _1327 = _1325 + 1;
        _1321 = _1327;
    }
    int _1329 = _1321;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1333 = _1229 + _1331;
    float _1335 = in.m_69.x;
    float _1337 = in.m_69.y;
    float _1339 = in.m_69.z;
    bool _1341 = uint(_1275) >= uint(_484);
    float _1343 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1345 = !_1315;
    int _1347 = _1345 ? 0 : (-1);
    int _1349 = abs(_1329);
    bool _1351 = !_1341;
    int _1353 = _1351 ? 0 : (-1);
    int _1355 = abs(_1347);
    float _1357 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1343);
    bool _1359 = !_1301;
    int _1361 = _1359 ? 0 : 1;
    int _1363 = ~_1259;
    int _1365 = _1363 + _1353;
    int _1367 = _1365 + 1;
    float _1369 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1357);
    int _1371 = ~_1349;
    int _1373 = _1371 + 1;
    int _1375 = _1373 + 1;
    int _1377 = abs(_1361);
    int _1379 = _484 * _1367;
    int _1381 = _1379 + _717;
    float _1383 = _1319 * _1319;
    int _1385 = _1375 * as_type<int>(_1207);
    int _1387 = _1385 + _1313;
    int _1389 = ~_1355;
    int _1391 = _1389 + 1;
    int _1393 = _1391 + 1;
    float _1395 = fma(_1261, _1335, _1335);
    bool _1397 = _1369 >= 0.0;
    float _1399 = fma(_1285, _1285, _1383);
    int _1401 = _1393 * as_type<int>(_1215);
    int _1403 = _1401 + _1387;
    bool _1405 = !_607;
    int _1407 = _1405 ? _1381 : (-1);
    float _1409 = fma(_1333, _1333, _1399);
    int _1411 = ~_1377;
    int _1413 = _1411 + 1;
    int _1415 = _1413 + 1;
    float _1417 = fma(_863, _1261, _863);
    float _1419 = _573 + (-0.5);
    float _1421 = rsqrt(_1409);
    float _1423 = fma(_897, _1237, _897);
    int _1425 = _1403 * _1415;
    float _1427 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1395);
    if (_1397)
    {
        _911 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1429 = _911;
    int _1431 = _1407 * _1377;
    int _1433 = _1431 + _1425;
    bool _1435 = !_1015;
    int _1437 = _1435 ? 0 : 1;
    int _1439 = as_type<int>(_1429);
    if (_1397)
    {
        out.m_53.x = 0.0;
    }
    if (_1397)
    {
        float _1441 = _1429 * 5.0;
        _1439 = as_type<int>(_1441);
    }
    int _1443 = _1439;
    float _1445 = fma(_1237, _1337, _1337);
    float _1447 = float(_1433);
    float _1449 = fma(_1417, _915, _1427);
    int _1451 = abs(_1437);
    if (_1397)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4938 = as_type<float>(_1443);
        out.gl_Position.z = _4938;
    }
    float _1453 = _575 + (-0.5);
    float _1455 = float(_1075);
    float _1457 = _1319 * _1421;
    out.m_71.x = _1447;
    float _1459 = _1285 * _1421;
    float _1461 = _1457;
    if (_1397)
    {
        return out;
    }
    float _1463 = -_1457;
    float _1465 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1303);
    float _1467 = _1333 * _1421;
    float _1469 = -_1459;
    float _1471 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1161);
    float _1473 = float(_1451);
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1477 = _1465 + _1475;
    float _1479 = _1449 * 0.15915493667125701904296875;
    float _1481 = -_1467;
    float _1483 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1229);
    float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1487 = _1471 + _1485;
    float _1489 = _1477 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1491 = _773 + _573;
    float _1493 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1495 = _1483 + _1493;
    float _1497 = _1473 * _1455;
    float _1499 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1489);
    float _1501 = _1491 + (-1.0);
    float _1503 = -_1457;
    float _1505 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1319);
    float _1507 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1499);
    float _1509 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1445);
    float _1511 = _1497 * (-2.0);
    float _1513 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1515 = -_1459;
    float _1517 = fma(_1515, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1285);
    bool _1519 = _1507 >= 0.0;
    float _1521 = _1505 * _1505;
    float _1523 = fma(_1511, _1339, _1339);
    float _1525 = _773 + (-0.5);
    float _1527 = fma(_1423, _915, _1509);
    float _1529 = fma(_1517, _1517, _1521);
    float _1531 = -_1467;
    float _1533 = fma(_1531, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1333);
    float _1535 = fma(_1513, _1511, _1513);
    float _1537 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1523);
    float _1539 = _1527 * 0.15915493667125701904296875;
    float _1541 = fma(_1533, _1533, _1529);
    float _1543 = _1479 * 6.283185482025146484375;
    float _1545 = sin(_1543);
    float _1547 = fma(_1535, _915, _1537);
    float _1549 = _1523;
    if (_1519)
    {
        _1549 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1551 = _1549;
    int _1553 = as_type<int>(_1551);
    if (_1519)
    {
        out.m_53.x = 0.0;
    }
    float _1555 = _1547 * 0.15915493667125701904296875;
    if (_1519)
    {
        float _1557 = _1551 * 5.0;
        _1553 = as_type<int>(_1557);
    }
    int _1559 = _1553;
    float _1561 = _1479 * 6.283185482025146484375;
    float _1563 = cos(_1561);
    if (_1519)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5136 = as_type<float>(_1559);
        out.gl_Position.z = _5136;
    }
    float _1565 = _1539 * 6.283185482025146484375;
    float _1567 = sin(_1565);
    float _1569 = _1539 * 6.283185482025146484375;
    float _1571 = cos(_1569);
    float _1573 = sqrt(_1541);
    if (_1519)
    {
        return out;
    }
    float _1575 = in.m_73.x;
    float _1577 = in.m_73.y;
    float _1579 = in.m_73.z;
    float _1581 = _1555 * 6.283185482025146484375;
    float _1583 = cos(_1581);
    float _1585 = _1421 * _1573;
    float _1587 = _388 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1589 = _1545 * _1567;
    float _1591 = _1545 * _1571;
    float _1593 = _1563 * _1571;
    float _1595 = _1563 * _1567;
    float _1597 = _1555 * 6.283185482025146484375;
    float _1599 = sin(_1597);
    bool _1601 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1603 = isnan(0.5);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1609 = _1605 || _1607;
    float _1611 = _1563 * _1583;
    float _1613 = _1571 * _1583;
    float _1615 = _1545 * _1583;
    float _1617 = _1567 * _1583;
    float _1619 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1621 = _1585 * _1587;
    float _1623 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1625 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1577);
    float _1627 = _1585 * _1619;
    float _1629 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1575);
    float _1631 = _1585 * _1623;
    float _1633 = _1625 * _1621;
    float _1635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1579);
    float _1637 = _1629 * _1627;
    float _1639 = fma(_1599, _1593, _1589);
    float _1641 = _1611 * _1633;
    float _1643 = _1635 * _1631;
    float _1645 = -_1591;
    float _1647 = fma(_1599, _1595, _1645);
    float _1649 = -_1633;
    float _1651 = _1599 * _1649;
    float _1653 = fma(_1639, _1637, _1641);
    float _1655 = -_1595;
    float _1657 = fma(_1599, _1591, _1655);
    float _1659 = _1615 * _1633;
    float _1661 = fma(_1613, _1637, _1651);
    float _1663 = fma(_1647, _1643, _1653);
    float _1665 = fma(_1599, _1589, _1593);
    float _1667 = fma(_1657, _1637, _1659);
    float _1669 = fma(_1617, _1643, _1661);
    float _1671 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1673 = fma(_1665, _1643, _1667);
    float _1675 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1677 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1671);
    float _1679 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1675);
    float _1681 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1677);
    float _1683 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1679);
    float _1685 = _1681 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1687 = _1683 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1689 = _1229 + _1685;
    float _1691 = _1161 + _1687;
    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1695 = _1689 + _1693;
    float _1697 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1701 = _1691 + _1699;
    float _1703 = _1695 * _1695;
    float _1705 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1697);
    float _1707 = fma(_1701, _1701, _1703);
    float _1709 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1705);
    float _1711 = sqrt(_1707);
    float _1713 = _1709 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1715 = _1303 + _1713;
    bool _1717 = _1711 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1719 = _1633;
    float _1721 = _1691;
    float _1723 = _1689;
    float _1725 = _1673;
    float _1727 = _1575;
    if (!_1717)
    {
        _1719 = _1715;
    }
    float _1729 = _1719;
    bool _1731 = !_1717;
    float _1733 = _1729;
    if (!_1731)
    {
        float _1735 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1737 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1739 = _1711 + _1737;
        float _1741 = rsqrt(_1707);
        float _1743 = _1739 * _1735;
        float _1745 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1747 = _1743 * 0.15915493667125701904296875;
        float _1749 = _1747 * 6.283185482025146484375;
        float _1751 = cos(_1749);
        float _1753 = _1747 * 6.283185482025146484375;
        float _1755 = sin(_1753);
        float _1757 = _1751 + (-1.0);
        float _1759 = _1757 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1761 = fma(_1755, _1745, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1763 = fma(_1715, _1751, _1759);
        float _1765 = _1741 * _1761;
        float _1767 = fma(_1701, _1765, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1769 = fma(_1695, _1765, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1721 = _1767;
        _1733 = _1763;
        _1723 = _1769;
    }
    float _1771 = _1721;
    float _1773 = _1733;
    float _1775 = _1723;
    float _1777 = -_1459;
    float _1779 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1771);
    float _1781 = -_1457;
    float _1783 = fma(_1781, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1773);
    float _1785 = -_1467;
    float _1787 = fma(_1785, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1775);
    float _1789 = _1783;
    float _1791 = _1787;
    float _1793 = _1779;
    if (_1609)
    {
        _1461 = _1779;
    }
    float _1795 = _1461;
    float _1797 = _1795;
    if (!_1609)
    {
        float _1799 = _1477 * _1477;
        float _1801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1803 = -_1229;
        float _1805 = _1803 + _1775;
        float _1807 = -_1161;
        float _1809 = _1807 + _1771;
        float _1811 = fma(_1487, _1487, _1799);
        float _1813 = -_1303;
        float _1815 = _1813 + _1773;
        float _1817 = fma(_1495, _1495, _1811);
        float _1819 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1821 = sqrt(_1817);
        float _1823 = 1.0 / _1585;
        float _1825 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1827 = precise::min(_1821, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1829 = _1827 * _1801;
        float _1831 = _1829 * _1823;
        float _1833 = _1825 * _1831;
        float _1835 = _1805 * _1831;
        float _1837 = fma(_1809, _1833, _1471);
        float _1839 = fma(_1815, _1833, _1465);
        float _1841 = fma(_1825, _1835, _1483);
        _1789 = _1839;
        _1797 = _1837;
        _1791 = _1841;
    }
    float _1843 = _1789;
    float _1845 = _1797;
    float _1847 = _1791;
    float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1851 = _1843 + _1849;
    float _1853 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1855 = _1845 + _1853;
    float _1857 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1859 = _1847 + _1857;
    float _1861 = _1851 * _1851;
    float _1863 = fma(_1855, _1855, _1861);
    float _1865 = fma(_1859, _1859, _1863);
    float _1867 = rsqrt(_1865);
    float _1869 = sqrt(_1865);
    float _1871 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1873 = _1855 * _1871;
    float _1875 = _1859 * _1871;
    float _1877 = _1873 * _1873;
    float _1879 = _1875 * _1875;
    float _1881 = _1877 + _1879;
    float _1883 = sqrt(_1881);
    bool _1885 = _1883 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1889 = _1883 + _1887;
    float _1891 = _1859;
    float _1893 = _1889;
    float _1895 = _1851;
    if (_1885)
    {
        float _1897 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1891 = _1897;
    }
    float _1899 = _1891;
    if (_1885)
    {
        float _1901 = rsqrt(_1881);
        _1793 = _1901;
    }
    float _1903 = _1793;
    float _1905 = _1903;
    if (_1885)
    {
        float _1907 = _1889 * _1899;
        _1893 = _1907;
    }
    float _1909 = _1893;
    if (_1885)
    {
        float _1911 = _1909 * 0.15915493667125701904296875;
        _1323 = _1911;
    }
    float _1913 = _1323;
    float _1915 = _1867;
    float _1917 = _1913;
    if (_1885)
    {
        float _1919 = _1913 * 6.283185482025146484375;
        float _1921 = sin(_1919);
        _1915 = _1921;
    }
    float _1923 = _1915;
    float _1925 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1927 = precise::max(0.0, _1925);
    float _1929 = _1861;
    float _1931 = _1927;
    float _1933 = _1925;
    if (_1885)
    {
        float _1935 = _1913 * 6.283185482025146484375;
        float _1937 = cos(_1935);
        _1929 = _1937;
    }
    float _1939 = _1929;
    float _1941 = -_1871;
    float _1943 = -_1927;
    float _1945 = fma(_1851, _1941, _1943);
    if (!_1885)
    {
        _1895 = _1875;
    }
    float _1947 = _1895;
    float _1949 = _1947;
    if (_1885)
    {
        float _1951 = _1945 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1931 = _1951;
    }
    float _1953 = _1931;
    float _1955 = _1953;
    if (!_1885)
    {
        _1917 = _1879;
    }
    float _1957 = _1917;
    float _1959 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1961 = _1923;
    float _1963 = _1957;
    if (_1885)
    {
        float _1965 = fma(_1923, _1953, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1955 = _1965;
    }
    float _1967 = _1955;
    if (!_1885)
    {
        _1961 = _1945;
    }
    float _1969 = _1961;
    float _1971 = _1969;
    float _1973 = _1939;
    if (_1885)
    {
        float _1975 = _1939 + (-1.0);
        _1933 = _1975;
    }
    float _1977 = _1933;
    float _1979 = _1977;
    if (_1885)
    {
        float _1981 = _1903 * _1967;
        _1725 = _1981;
    }
    float _1983 = _1725;
    if (!_1885)
    {
        _1905 = _1873;
    }
    float _1985 = _1905;
    float _1987 = _1985;
    if (_1885)
    {
        float _1989 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1979 = _1989;
    }
    float _1991 = _1979;
    if (_1885)
    {
        float _1993 = _1873 * _1983;
        _1987 = _1993;
    }
    float _1995 = _1987;
    if (_1885)
    {
        float _1997 = _1875 * _1983;
        _1949 = _1997;
    }
    float _1999 = _1949;
    if (_1885)
    {
        float _2001 = fma(_1945, _1939, _1991);
        _1971 = _2001;
    }
    float _2003 = _1971;
    if (!_1885)
    {
        _1973 = _1877;
    }
    float _2005 = _1973;
    float _2007 = _2005;
    if (_1885)
    {
        float _2009 = _1995 * _1995;
        _2007 = _2009;
    }
    float _2011 = _2007;
    if (_1885)
    {
        float _2013 = _1999 * _1999;
        _1963 = _2013;
    }
    float _2015 = _1963;
    float _2017 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1959);
    float _2019 = fma(_2003, _2003, _2011);
    float _2021 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2023 = fma(_1471, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2025 = _2019 + _2015;
    float _2027 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2021);
    float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2031 = fma(_1869, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2029);
    float _2033 = precise::clamp(_2031, 0.0, 1.0);
    float _2035 = rsqrt(_2025);
    float _2037 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2027);
    float _2039 = -_2033;
    float _2041 = _2039 + 1.0;
    float _2043 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2047 = floor(_2023);
    float _2049 = _2043 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2051 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2053 = fma(_1483, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2055 = -_2049;
    float _2057 = fma(_2055, _2045, 1.0);
    float _2059 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2061 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2051);
    float _2063 = _2035 * _1995;
    float _2065 = _2035 * _1999;
    float _2067 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2059);
    float _2069 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2061);
    float _2071 = abs(_2041);
    float _2073 = log2(_2071);
    float _2075 = _2035 * _2003;
    float _2077 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2079 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2067);
    float _2081 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2083 = -_2047;
    float _2085 = _2023 + _2083;
    float _2087 = -_2077;
    float _2089 = fma(_2075, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2087);
    float _2091 = _2079 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2093 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2095 = floor(_2053);
    float _2097 = -_2065;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2089);
    float _2101 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2017);
    float _2103 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2093);
    float _2105 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2107 = fma(_2099, 0.5, 0.5);
    float _2109 = _2101 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2111 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2103);
    float _2113 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2115 = log2(_2057);
    float _2117 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2119 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2111);
    float _2121 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2105);
    float _2123 = fma(_2107, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2125 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2117);
    float _2127 = exp2(_2113);
    float _2129 = fma(_2099, -0.5, 0.5);
    float _2131 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2125);
    float _2133 = -_2095;
    float _2135 = _2053 + _2133;
    float _2137 = _2075 + 1.0;
    float _2139 = fma(_2107, _2123, -0.212114393711090087890625);
    float _2141 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2131);
    float _2143 = sqrt(_2129);
    float _2145 = fma(_2107, _2139, 1.570728778839111328125);
    float _2147 = _2115 * 0.693147182464599609375;
    float _2149 = 1.0 / _2119;
    float _2151 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2121);
    float _2153 = -_2075;
    float _2155 = fma(_2127, _2137, _2153);
    float _2157 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2151);
    float2 _6110 = float2(_2085, _2135);
    float _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6110, float2(0.0), isnan(_6110)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6110, float2(0.0), isnan(_6110)), level(0.0)).x;
    float _2161 = fma(_2155, 0.5, 0.5);
    float _2163 = _2143 * 0.636619746685028076171875;
    float _2165 = -_2145;
    float _2167 = fma(_2163, _2165, 1.0);
    float _2169 = _2157 * _2149;
    float _2171 = _2141 * _2149;
    float _2173 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2175 = fma(_2169, 0.5, 0.5);
    float _2177 = fma(_2171, -0.5, 0.5);
    float3 _6145 = float3(_2175, _2177, _2173);
    float _2179 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6145, float3(0.0), isnan(_6145)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6145, float3(0.0), isnan(_6145)), level(0.0)).x;
    float3 _6156 = float3(_2175, _2177, _2173);
    float4 _2182 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6156, float3(0.0), isnan(_6156)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6156, float3(0.0), isnan(_6156)), level(0.0)).xyzw;
    float _2184 = _2182.x;
    float _2186 = _2182.y;
    float _2188 = _2182.z;
    float _2190 = _2182.w;
    float2 _6172 = float2(_2167, _2161);
    float3 _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6172, float2(0.0), isnan(_6172)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6172, float2(0.0), isnan(_6172)), level(0.0)).xyz;
    float _2196 = _2194.x;
    float _2198 = _2194.y;
    float _2200 = _2194.z;
    float _2202 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2204 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2206 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2208 = _1577 != 0.0;
    bool _2210 = isnan(_1577);
    bool _2212 = _2208 || _2210;
    bool _2214 = isnan(0.0);
    bool _2216 = _2212 || _2214;
    float _2218 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2202);
    float _2220 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2204);
    float _2222 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2224 = _1575 == 0.0;
    bool _2226 = !_2216;
    bool _2228 = _2224 && _2226;
    float _2230 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2218);
    float _2232 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2220);
    float _2234 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2236 = _2230 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2238 = _2232 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2240 = _1579 == 0.0;
    bool _2242 = _2240 && _2228;
    float _2244 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2246 = 1.0 / _2236;
    float _2248 = _2238 + _2236;
    float _2250 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2252 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2234);
    float _2254 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2206);
    float _2256 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2258 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2260 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2262 = isnan(0.5);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2268 = _2264 || _2266;
    float _2270 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2272 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2274 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2256);
    float _2276 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2258);
    float _2278 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2252);
    float _2280 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2272);
    float _2282 = -_1599;
    float _2284 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2222);
    float _2286 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2288 = _2248 * _2246;
    float _2290 = _2288 * 0.5;
    float _2292 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2276);
    float _2294 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2284);
    float _2296 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2286);
    float _2298 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2300 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2298);
    float _2302 = exp2(_2270);
    float _2304 = in.m_75.x;
    float _2306 = in.m_75.y;
    float _2308 = in.m_75.z;
    float _2310 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2296);
    float _2312 = 1.0 / _2300;
    float _2314 = -_2302;
    float _2316 = _2314 + 1.0;
    float _2318 = -_1599;
    float _2320 = fma(_2318, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2244);
    float _2322 = -_1599;
    float _2324 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2250);
    float _2326 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2328 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2280);
    float _2330 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2320);
    float _2332 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2324);
    float _2334 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2336 = _2312 * _2334;
    float _2338 = _2306;
    float _2340 = _2304;
    float _2342 = _2308;
    float _2344 = _2119;
    float _2346 = _2141;
    if (!_2242)
    {
        float _2348 = fma(_1577, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2306);
        _2338 = _2348;
    }
    float _2350 = _2338;
    float _2352 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2326);
    float _2354 = abs(_2336);
    float _2356 = log2(_2354);
    if (!_2242)
    {
        float _2358 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2304);
        _2340 = _2358;
    }
    float _2360 = _2340;
    float _2362 = _2294 * _2350;
    float _2364 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2352);
    float _2366 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2254);
    float _2368 = _2330 * _2350;
    float _2370 = _2332 * _2350;
    if (!_2242)
    {
        float _2372 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2308);
        _2342 = _2372;
    }
    float _2374 = _2342;
    float _2376 = fma(_2278, _2360, _2362);
    float _2378 = fma(_2328, _2360, _2368);
    float _2380 = fma(_2366, _2360, _2370);
    float _2382 = _2316 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2384 = fma(_2310, _2374, _2376);
    float _2386 = _2376;
    if (!_2268)
    {
        float _2388 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2390 = _2336 + _2388;
        _2386 = _2390;
    }
    float _2392 = _2386;
    bool _2394 = _2336 <= 8000.0;
    bool _2396 = isnan(_2336);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan(8000.0);
    bool _2402 = _2398 || _2400;
    float _2404 = float(_2402);
    float _2406 = fma(_2364, _2374, _2378);
    float _2408 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (!_2268)
    {
        _1727 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2410 = _1727;
    float _2412 = exp2(_2408);
    float _2414 = _2410;
    float _2416 = _2157;
    if (!_2268)
    {
        float _2418 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2420 = _2410 + _2418;
        _2414 = _2420;
    }
    float _2422 = _2414;
    bool _2424 = _1869 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2426 = isnan(_1869);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2432 = _2428 || _2430;
    float _2434 = _2328;
    float _2436 = _2422;
    if (!_2268)
    {
        float _2438 = 1.0 / _2422;
        _2434 = _2438;
    }
    float _2440 = _2434;
    float _2442 = fma(_2412, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2444 = precise::clamp(_2442, 0.0, 1.0);
    float _2446 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2274);
    if (_2268)
    {
        _2436 = 1.0;
    }
    float _2448 = _2436;
    float _2450 = fma(_2444, -2.0, 3.0);
    float _2452 = _2444 * _2444;
    float _2454 = fma(_2446, _2374, _2380);
    float _2456 = _2448;
    if (!_2268)
    {
        float _2458 = _2392 * _2440;
        float _2460 = precise::clamp(_2458, 0.0, 1.0);
        _2456 = _2460;
    }
    float _2462 = _2456;
    float _2464 = _2452 * _2450;
    out.m_77.x = _2384;
    out.m_77.y = _2406;
    out.m_77.z = _2454;
    float _2466 = -_2464;
    float _2468 = _2466 + 1.0;
    float _2470 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2464);
    float _2472 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2292);
    float _2474 = in.m_79.x;
    float _2476 = _2404 * _2470;
    float _2478 = _2472 + _2119;
    out.gl_Position.x = _2157;
    out.gl_Position.y = _2141;
    out.gl_Position.z = _2472;
    out.gl_Position.w = _2119;
    float _2480 = _2476 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2482 = _2478 * 0.5;
    out.m_81.z = _2482;
    out.m_81.w = _2119;
    float _2484 = _2472;
    if (!_2432)
    {
        _2344 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2486 = _2344;
    float _2488 = _2486;
    float _2490 = _2486;
    if (!_2432)
    {
        _2346 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2492 = _2346;
    float _2494 = _2492;
    float _2496 = _2492;
    if (!_2432)
    {
        _2484 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2498 = _2484;
    float _2500 = _2498;
    float _2502 = _2498;
    if (!_2432)
    {
        _2416 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2504 = _2416;
    float _2506 = -_2159;
    float _2508 = _2506 + 1.0;
    float _2510 = _2508 * _2480;
    float _2512 = precise::clamp(_2510, 0.0, 1.0);
    float _2514 = -_2512;
    float _2516 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2518 = _2516 * _2474;
    float _2520 = _2382 * _2179;
    float _2522 = -_2382;
    float _2524 = _2522 + 1.0;
    float _2526 = _2190 * _2520;
    float _2528 = _2200 * _2520;
    float _2530 = _2190 * _2524;
    float _2532 = fma(_2196, _2526, _2184);
    float _2534 = fma(_2198, _2526, _2186);
    float _2536 = _2518 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2538 = fma(_2190, _2528, _2188);
    float _2540 = _2462 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2542 = _2526;
    float _2544 = _2518;
    float _2546 = _2504;
    float _2548 = _2504;
    if (!_2432)
    {
        _2542 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2550 = _2542;
    out.m_83.x = _2536;
    float _2552 = _2550;
    float _2554 = _2550;
    if (!_2432)
    {
        _2544 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2556 = _2544;
    out.m_85.x = _2532;
    out.m_85.y = _2534;
    out.m_85.z = _2538;
    out.m_85.w = _2530;
    bool _2558 = !_2432;
    float _2560 = _2556;
    float _2562 = _2556;
    if (!_2558)
    {
        bool _2564 = _1869 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2566 = isnan(_1869);
        bool _2568 = _2564 || _2566;
        bool _2570 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2572 = _2568 || _2570;
        if (!_2572)
        {
            float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2576 = _1869 + _2574;
            float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2580 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2578;
            float _2582 = 1.0 / _2580;
            float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2586 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2590 = _2588 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2594 = _2592 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2598 = _2596 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2600 = _2576 * _2582;
            float _2602 = precise::clamp(_2600, 0.0, 1.0);
            float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2612 = fma(_2602, _2586, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2614 = fma(_2602, _2606, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2616 = fma(_2602, _2610, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2618 = fma(_2602, _2590, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2620 = fma(_2602, _2594, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2622 = fma(_2602, _2598, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2496 = _2616;
            _2554 = _2620;
            _2490 = _2614;
            _2548 = _2618;
            _2502 = _2612;
            _2562 = _2622;
            _2624 = true;
        }
        else
        {
            bool _2626 = _1869 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2628 = isnan(_1869);
            bool _2630 = _2626 || _2628;
            bool _2632 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2634 = _2630 || _2632;
            if (!_2634)
            {
                _2488 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2636 = _2488;
            _2490 = _2636;
            if (!_2634)
            {
                _2494 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2638 = _2494;
            _2496 = _2638;
            if (!_2634)
            {
                _2500 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2640 = _2500;
            _2502 = _2640;
            if (!_2634)
            {
                _2546 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2642 = _2546;
            _2548 = _2642;
            if (!_2634)
            {
                _2552 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2644 = _2552;
            _2554 = _2644;
            if (!_2634)
            {
                _2560 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2646 = _2560;
            bool _2648 = !_2634;
            _2562 = _2646;
            if (!_2648)
            {
                bool _2650 = _1869 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2652 = isnan(_1869);
                bool _2654 = _2650 || _2652;
                bool _2656 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2658 = _2654 || _2656;
                if (!_2658)
                {
                    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2662 = _1869 + _2660;
                    float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2666 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2664;
                    float _2668 = 1.0 / _2666;
                    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2682 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2684 = _2682 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2686 = _2662 * _2668;
                    float _2688 = precise::clamp(_2686, 0.0, 1.0);
                    float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2692 = _2690 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2698 = fma(_2688, _2672, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2700 = fma(_2688, _2692, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2702 = fma(_2688, _2696, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2704 = fma(_2688, _2676, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2706 = fma(_2688, _2680, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2708 = fma(_2688, _2684, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2496 = _2702;
                    _2554 = _2706;
                    _2490 = _2700;
                    _2548 = _2704;
                    _2502 = _2698;
                    _2562 = _2708;
                    _2624 = true;
                }
                else
                {
                    _2496 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2554 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2490 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2548 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2502 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2562 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2624 = false;
    float _2710 = _2496;
    float _2712 = _2554;
    float _2714 = _2490;
    float _2716 = _2548;
    float _2718 = _2502;
    float _2720 = _2562;
    float _2722 = _2540 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2724 = fma(_2406, -0.5, 0.5);
    float _2726 = precise::clamp(_2724, 0.0, 1.0);
    float _2728 = -_2710;
    float _2730 = _2728 + _2712;
    float _2732 = -_2714;
    float _2734 = _2732 + _2716;
    out.m_53.x = _2722;
    float _2736 = fma(_2726, _2730, _2710);
    float _2738 = -_2718;
    float _2740 = _2738 + _2720;
    float _2742 = fma(_2726, _2734, _2714);
    float _2744 = _2736 * 0.586610972881317138671875;
    bool _2746 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2748 = fma(_2726, _2740, _2718);
    out.m_87.x = 0.0;
    float _2750 = fma(_2742, 0.298911988735198974609375, _2744);
    bool _2752 = _2462 > 0.0;
    bool _2754 = isnan(_2462);
    bool _2756 = _2752 || _2754;
    bool _2758 = isnan(0.0);
    bool _2760 = _2756 || _2758;
    float _2762 = fma(_2748, 0.114477999508380889892578125, _2750);
    float _2764 = -_2762;
    float _2766 = _2742 + _2764;
    float _2768 = -_2762;
    float _2770 = _2736 + _2768;
    float _2772 = -_2762;
    float _2774 = _2748 + _2772;
    float _2776 = fma(_2766, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2762);
    float _2778 = fma(_2770, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2762);
    float _2780 = fma(_2774, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2762);
    bool _2782 = !_2746;
    if (!_2782)
    {
        float _2784 = -_1843;
        float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2788 = -_1845;
        float _2790 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2792 = -_1847;
        float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2796 = _2786 * _2786;
        float _2798 = fma(_2790, _2790, _2796);
        float _2800 = fma(_2794, _2794, _2798);
        float _2802 = sqrt(_2800);
        float _2804 = rsqrt(_2800);
        float _2806 = -_2802;
        float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2810 = _2808 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2812 = precise::clamp(_2810, 0.0, 1.0);
        float _2814 = _2790 * _2804;
        float _2816 = _2786 * _2804;
        float _2818 = abs(_2812);
        float _2820 = log2(_2818);
        float _2822 = _2794 * _2804;
        float _2824 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2826 = _2406 * _2816;
        float _2828 = -_2816;
        float _2830 = -_2824;
        float _2832 = fma(_2828, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2830);
        float _2834 = fma(_2384, _2814, _2826);
        float _2836 = -_2822;
        float _2838 = fma(_2836, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2832);
        float _2840 = fma(_2454, _2822, _2834);
        float _2842 = precise::clamp(_2840, 0.0, 1.0);
        float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2846 = _2838 + _2844;
        float _2848 = _2820 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2850 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2852 = precise::clamp(_2850, 0.0, 1.0);
        float _2854 = exp2(_2848);
        float _2856 = _2854 * _2852;
        float _2858 = _2842 * _2856;
        float _2860 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2862 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2864 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2860;
        out.m_87.y = _2862;
        out.m_87.z = _2864;
    }
    out.m_89.x = _2776;
    out.m_89.y = _2778;
    out.m_89.z = _2780;
    if (_2760)
    {
        return out;
    }
    float _2866 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2866;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2624 = false;
    bool _468 = false;
    bool _348 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = in.m_48.w;
    float _107 = trunc(_103);
    int _110 = int(_107);
    float _112 = -_105;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _114;
    bool _118 = _110 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_110);
    float _124 = _114;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _120;
    if (!_118)
    {
        out.m_53.x = 0.0;
    }
    int _128 = 0;
    if (!_118)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2935 = as_type<float>(_132);
        out.gl_Position.z = _2935;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _136 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_105);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = float(_110);
    bool _148 = _114 >= _146;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    if (_152)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _122;
    if (_152)
    {
        out.m_53.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _134 = as_type<int>(_156);
    }
    int _158 = _134;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2990 = as_type<float>(_158);
        out.gl_Position.z = _2990;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = 1.0 / _146;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _164 = _114 * _160;
    bool _166 = !_162;
    float _184;
    if (!_166)
    {
        float _168 = in.m_55.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        _184 = _164;
    }
    _186 = false;
    float _188 = _184;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _192 = _188 + _190;
    bool _194 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _196 = isnan(_188);
    bool _198 = _194 || _196;
    bool _200 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _202 = _198 || _200;
    float _204 = float(_202);
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _188 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = 1.0 / _212;
    bool _220 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _222 = 1.0 / _216;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _224;
    float _228 = _192 * _218;
    bool _230 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _232 = isnan(_188);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -_204;
    float _244 = _242 + 1.0;
    bool _246 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _248 = isnan(_188);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = fma(_226, _228, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _260 = _256 * _244;
    float _262 = -_256;
    float _264 = _262 + 1.0;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    float _274 = _208 * _222;
    float _276 = _240 * _264;
    float _278 = fma(_268, _228, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _280 = fma(_272, _228, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _282 = -_240;
    float _284 = _282 + 1.0;
    float _286 = _258 * _276;
    float _288 = _278 * _276;
    float _290 = _280 * _276;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _304 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[143].x, _288);
    float _306 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _308 = fma(_294, _274, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _310 = fma(_298, _274, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _312 = fma(_302, _274, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _314 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[143].z, _290);
    float _316 = fma(_308, _260, _304);
    float _318 = fma(_310, _260, _306);
    float _320 = fma(_312, _260, _314);
    float _322 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[145].x, _316);
    float _324 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[145].y, _318);
    float _326 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[145].z, _320);
    bool _328 = !_220;
    float _346;
    if (!_328)
    {
        float _330 = in.m_55.x;
        float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _334 = _330 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[11].x, _114);
        float _338 = _336 * _332;
        float _340 = floor(_338);
        float _342 = -_340;
        float _344 = _338 + _342;
        _346 = _344;
        _348 = true;
    }
    else
    {
        _346 = _164;
    }
    _348 = false;
    float _350 = _346;
    float _352 = in.m_57.x;
    float _354 = in.m_57.y;
    float _356 = in.m_57.z;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _360 = _350 + _358;
    bool _362 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _364 = isnan(_350);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _376;
    float _380 = -_372;
    float _382 = _380 + 1.0;
    float _384 = 1.0 / _378;
    float _386 = _326 * _356;
    float _388 = _324 * _354;
    float _390 = _360 * _384;
    bool _392 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _394 = isnan(_350);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _412;
    float _416 = _402 * _382;
    float _418 = fma(_406, _390, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _420 = fma(_410, _390, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _422 = fma(_414, _390, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _424 = -_402;
    float _426 = _424 + 1.0;
    float _428 = _418 * _416;
    float _430 = _420 * _416;
    float _432 = _422 * _416;
    float _434 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[107].x, _428);
    float _436 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[107].y, _430);
    float _438 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[107].z, _432);
    float _440 = _322 * _352;
    float _442 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[108].x, _434);
    float _444 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[108].y, _436);
    float _446 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[108].z, _438);
    bool _448 = !_374;
    float _466;
    if (!_448)
    {
        float _450 = in.m_55.x;
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _454 = _450 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _456 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _458 = _456 * _452;
        float _460 = floor(_458);
        float _462 = -_460;
        float _464 = _458 + _462;
        _466 = _464;
        _468 = true;
    }
    else
    {
        _466 = _164;
    }
    _468 = false;
    float _470 = _466;
    float _472 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _474 = int(_472);
    float _476 = in.m_59.y;
    int _478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _480 = _478 != 0;
    float _482 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _484 = int(_482);
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _492 = _490 != 0;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _496 = _494 != 0;
    float _498 = float(_474);
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _502 = 1.0 / _498;
    float _504 = 0.0;
    float _506 = _476;
    if (_488)
    {
        float _508 = in.m_55.x;
        _504 = _508;
    }
    float _510 = _504;
    float _512 = float(uint(_484));
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _516 = ~_484;
    int _518 = _516 + 1;
    int _520 = ~_484;
    int _522 = _520 + 1;
    float _524 = 1.0 / _512;
    float _526 = float(_484);
    float _528 = _502 * _114;
    float _530 = trunc(_528);
    int _532 = int(_530);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _534;
    int _538 = as_type<int>(_524) + (-2);
    float _540 = float(uint(_532));
    float _542 = float(_532);
    float _544 = as_type<float>(_538) * _540;
    bool _546 = _542 >= _526;
    bool _548 = isnan(_542);
    bool _550 = _546 || _548;
    bool _552 = isnan(_526);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = trunc(_544);
    float _560 = precise::max(_558, 0.0);
    uint _563 = uint(_560);
    float _565 = trunc(_556);
    int _567 = int(_565);
    int _569 = _518 * int(_563);
    int _571 = _569 + _532;
    float _573 = in.m_55.x;
    float _575 = in.m_55.y;
    float _577 = float(uint(_571));
    float _579 = as_type<float>(_538) * _577;
    float _581 = trunc(_579);
    float _583 = precise::max(_581, 0.0);
    uint _585 = uint(_583);
    int _587 = int(_563) + int(_585);
    bool _589 = !_480;
    float _591 = _589 ? 7.345489978790283203125 : 1.0;
    float _593 = _591 * _573;
    int _595 = _522 * _587;
    int _597 = _595 + _532;
    float _599 = floor(_593);
    bool _601 = uint(_597) >= uint(_484);
    bool _603 = !_601;
    int _605 = _603 ? 0 : (-1);
    bool _607 = _484 == 0;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    int _609 = ~_587;
    int _611 = _609 + _605;
    int _613 = _611 + 1;
    float _615 = -_599;
    float _617 = _593 + _615;
    int _619 = _484 * _613;
    int _621 = _619 + _532;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _625 = _623 != 0;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _629 = _627 != 0;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _633 = _631 != 0;
    float _635 = _617 * _526;
    float _637 = _526 * _114;
    int _639 = ~_567;
    int _641 = _639 + 1;
    int _643 = _641 + 1;
    bool _645 = !_607;
    int _647 = _645 ? _621 : (-1);
    float _649 = _637 * _160;
    int _651 = _484 + (-1);
    float _653 = trunc(_635);
    int _655 = int(_653);
    bool _657 = !_496;
    int _659 = _657 ? 0 : 1;
    int _661 = _647 * _643;
    bool _663 = !_629;
    int _665 = _663 ? 0 : 1;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _669 = 1.0 + _667;
    bool _671 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _673 = isnan(1.0);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _679 = _675 || _677;
    int _681 = _567 * _651;
    int _683 = _681 + _661;
    bool _685 = !_625;
    int _687 = _685 ? 0 : 1;
    float _689 = trunc(_649);
    int _691 = int(_689);
    int _693 = abs(_665);
    float _695 = -_476;
    float _697 = _695 + 1.0;
    bool _699 = _575 > 0.5;
    int _701 = abs(_687);
    if (_492)
    {
        float _703 = _699 ? _697 : _476;
        _506 = _703;
    }
    float _705 = _506;
    int _707 = abs(_659);
    int _709 = _683 * _693;
    bool _711 = !_633;
    int _713 = _711 ? 0 : 1;
    int _715 = _655 * _707;
    int _717 = _715 + _532;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _721 = _719 != 0;
    float _723 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _725 = log2(_723);
    int _727 = abs(_713);
    int _729 = _691 * _701;
    int _731 = _729 + _709;
    bool _733 = !_721;
    int _735 = _733 ? 0 : 1;
    float _737 = in.m_46.x;
    float _739 = in.m_46.y;
    float _741 = in.m_46.z;
    int _743 = _717 * _727;
    int _745 = _743 + _731;
    int _747 = abs(_735);
    float _749 = _575 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _751 = _573 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _753 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _755 = isnan(0.0);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _761 = _757 || _759;
    int _763 = _655 * _747;
    int _765 = _763 + _745;
    float _767 = fma(_749, -2.0, _500);
    float _769 = -_514;
    float _771 = fma(_751, 2.0, _769);
    float _773 = in.m_55.z;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _777 = _775 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _779 = float(uint(_765));
    float _781 = _725 * _114;
    float _783 = 1.0 / _777;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _787 = as_type<float>(_538) * _779;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _791 = _573 * 2.0;
    float _793 = _785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _795 = _510 > 0.5;
    bool _797 = _795 && _488;
    float _799 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _801 = trunc(_787);
    float _803 = precise::max(_801, 0.0);
    uint _805 = uint(_803);
    float _807 = _739 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _809 = _739 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _811 = _739 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _813 = ~_484;
    int _815 = _813 + 1;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _819 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[4].x, _807);
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _823 = exp2(_781);
    float _825 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[5].x, _809);
    float _827 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[6].x, _811);
    float _829 = _575 + _573;
    float _831 = _817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _833 = _536 * _783;
    float _835 = in.m_59.x;
    int _837 = _815 * int(_805);
    int _839 = _837 + _765;
    float _841 = floor(_791);
    float _843 = _829 + (-1.0);
    out.m_63.x = _831;
    out.m_63.y = _793;
    out.m_63.z = _799;
    out.m_63.w = _821;
    int _845 = ~_484;
    int _847 = _845 + 1;
    float _849 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _767);
    float _851 = float(uint(_839));
    float _853 = 1.0 / _669;
    float _855 = -_823;
    float _857 = _855 + 1.0;
    float _859 = as_type<float>(_538) * _851;
    float _861 = _761 ? _857 : 0.0;
    float _863 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _865 = trunc(_859);
    float _867 = precise::max(_865, 0.0);
    uint _869 = uint(_867);
    float _871 = _575 + _773;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _875 = _871 + (-1.0);
    bool _877 = _841 > 0.0;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _881 = _841 >= 0.0;
    bool _883 = isnan(_841);
    bool _885 = _881 || _883;
    bool _887 = isnan(0.0);
    bool _889 = _885 || _887;
    float _891 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[78].z, _873);
    float _893 = _575 * 2.0;
    float _895 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[78].w, _879);
    float _897 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _899 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _891);
    float _901 = -_114;
    float _903 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[76].x, _771);
    float _905 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _895);
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _909 = _835;
    float _911 = _863;
    if (_679)
    {
        float _913 = _861 * _853;
        _124 = _913;
    }
    float _915 = _124;
    int _917 = int(_805) + int(_869);
    float _919 = floor(_893);
    float _921 = _773 * 2.0;
    int _923 = _889 ? 0 : 1;
    if (_488)
    {
        _907 = _835;
    }
    float _925 = _907;
    int _927 = _847 * _917;
    int _929 = _927 + _765;
    float _931 = floor(_921);
    float _933 = _925;
    if (_797)
    {
        float _935 = -_925;
        float _937 = _935 + 1.0;
        _933 = _937;
    }
    float _939 = _933;
    bool _941 = uint(_929) >= uint(_484);
    int _943 = ~_923;
    int _945 = _943 + 1;
    int _947 = _945 + 1;
    bool _949 = !_941;
    int _951 = _949 ? 0 : (-1);
    bool _953 = _919 >= 0.0;
    bool _955 = isnan(_919);
    bool _957 = _953 || _955;
    bool _959 = isnan(0.0);
    bool _961 = _957 || _959;
    bool _963 = _919 > 0.0;
    int _965 = ~_917;
    int _967 = _965 + _951;
    int _969 = _967 + 1;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _973 = _470 + _971;
    int _975 = _947;
    if (!_877)
    {
        int _977 = ~_923;
        int _979 = _977 + 1;
        _975 = _979;
    }
    int _981 = _975;
    int _983 = _961 ? 0 : 1;
    int _985 = _484 * _969;
    int _987 = _985 + _765;
    bool _989 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _991 = isnan(_470);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _997 = _993 || _995;
    float _999 = float(_997);
    float _1001 = fma(_833, _973, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    if (_488)
    {
        _909 = _939;
    }
    float _1003 = _909;
    int _1005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1007 = _1005 != 0;
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1011 = _1009 != 0;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1015 = _1013 != 0;
    float _1017 = -_999;
    float _1019 = _1017 + 1.0;
    bool _1021 = _931 > 0.0;
    bool _1023 = _931 >= 0.0;
    bool _1025 = isnan(_931);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan(0.0);
    bool _1031 = _1027 || _1029;
    bool _1033 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1035 = isnan(_470);
    bool _1037 = _1033 || _1035;
    bool _1039 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1041 = _1037 || _1039;
    float _1043 = float(_1041);
    float _1045 = float(uint(_717));
    float _1047 = _1043 * _1019;
    bool _1049 = !_607;
    int _1051 = _1049 ? _987 : (-1);
    float _1053 = as_type<float>(_538) * _1045;
    int _1055 = ~_983;
    int _1057 = _1055 + 1;
    int _1059 = _1057 + 1;
    float _1061 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1063 = fma(_741, (*spvDescriptorSet0.vp_c10)._m0[4].z, _819);
    int _1065 = _1051 >> 31;
    float _1067 = _1001 * _1047;
    int _1069 = _1059;
    if (!_963)
    {
        int _1071 = ~_983;
        int _1073 = _1071 + 1;
        _1069 = _1073;
    }
    int _1075 = _1069;
    float _1077 = -_1043;
    float _1079 = _1077 + 1.0;
    float _1081 = fma(_741, (*spvDescriptorSet0.vp_c10)._m0[5].z, _825);
    float _1083 = trunc(_1053);
    float _1085 = precise::max(_1083, 0.0);
    uint _1087 = uint(_1085);
    float _1089 = fma(_741, (*spvDescriptorSet0.vp_c10)._m0[6].z, _827);
    int _1091 = _1065 & 3;
    float _1093 = -_849;
    float _1095 = fma(_905, _1061, _1093);
    int _1097 = ~_484;
    int _1099 = _1097 + 1;
    float _1101 = fma(_1079, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1067);
    int _1103 = _1051 + _1091;
    float _1105 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1107 = !_1011;
    int _1109 = _1107 ? 0 : 1;
    float _1111 = _1095 + 0.5;
    int _1113 = _1103 >> 2;
    float _1115 = fma(_899, _1105, _903);
    int _1117 = abs(_1109);
    float _1119 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1101);
    int _1121 = _1113 << 4;
    int _1123 = _1121 + 368;
    float _1125 = _442 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1127 = _1099 * int(_1087);
    int _1129 = _1127 + _717;
    float _1131 = float(_981);
    float _1133 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _1135 = uint(int(uint(_1123) >> uint(2)));
    uint _1137 = uint(int(uint(int(_1135)) >> uint(2)));
    int _1139 = int(_1135) & 3;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[int(_1137)][_1139];
    int _1143 = int(_1135) + 1;
    uint _1145 = uint(int(uint(_1143) >> uint(2)));
    int _1147 = _1143 & 3;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[int(_1145)][_1147];
    int _1151 = _1031 ? 0 : 1;
    float _1153 = _1119 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1155 = float(uint(_1129));
    float _1157 = _1115 + 0.5;
    float _1159 = float(_1117);
    float _1161 = _1063 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1163 = ~_1151;
    int _1165 = _1163 + 1;
    int _1167 = _1165 + 1;
    float _1169 = as_type<float>(_538) * _1155;
    int _1171 = _1167;
    if (!_1021)
    {
        int _1173 = ~_1151;
        int _1175 = _1173 + 1;
        _1171 = _1175;
    }
    int _1177 = _1171;
    float _1179 = _1159 * _1131;
    int _1181 = _1051 & 3;
    bool _1183 = _1181 != 0;
    float _1185 = trunc(_1169);
    float _1187 = precise::max(_1185, 0.0);
    uint _1189 = uint(_1187);
    bool _1191 = !_1007;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1197 = uint(_1181) > 1u;
    int _1199 = _1123 + 8;
    uint _1201 = uint(int(uint(_1199) >> uint(2)));
    uint _1203 = uint(int(uint(int(_1201)) >> uint(2)));
    int _1205 = int(_1201) & 3;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[int(_1203)][_1205];
    int _1209 = int(_1201) + 1;
    uint _1211 = uint(int(uint(_1209) >> uint(2)));
    int _1213 = _1209 & 3;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[int(_1211)][_1213];
    int _1217 = abs(_1193);
    float _1219 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1221 = _1051 & 3;
    bool _1223 = _1221 != 0;
    out.m_65.x = _1157;
    out.m_65.y = _1111;
    float _1225 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1227 = _1223 ? 0 : 1;
    float _1229 = _1089 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1231 = float(_1217);
    float _1233 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1235 = float(_1177);
    float _1237 = _1179 * (-2.0);
    int _1239 = ~_484;
    int _1241 = _1239 + 1;
    int _1243 = ~_1227;
    int _1245 = _1243 + 1;
    int _1247 = _1245 + 1;
    float _1249 = _1231 * _1235;
    int _1251 = _1247;
    if (!_1197)
    {
        int _1253 = ~_1227;
        int _1255 = _1253 + 1;
        _1251 = _1255;
    }
    int _1257 = _1251;
    out.m_67.x = _1133;
    out.m_67.y = _1219;
    out.m_67.z = _1233;
    out.m_67.w = _1153;
    int _1259 = int(_1087) + int(_1189);
    float _1261 = _1249 * (-2.0);
    bool _1263 = !_1183;
    int _1265 = _1263 ? 0 : 1;
    int _1267 = abs(_1257);
    int _1269 = abs(_1265);
    bool _1271 = _1181 != 3;
    int _1273 = _1241 * _1259;
    int _1275 = _1273 + _717;
    int _1277 = ~_1267;
    int _1279 = _1277 + 1;
    int _1281 = _1279 + 1;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1285 = _1161 + _1283;
    bool _1287 = uint(_1181) >= 2u;
    int _1289 = _1281 * as_type<int>(_1149);
    int _1291 = _1287 ? 0 : 1;
    int _1293 = ~_1269;
    int _1295 = _1293 + 1;
    int _1297 = _1295 + 1;
    int _1299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1301 = _1299 != 0;
    float _1303 = _1081 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1305 = ~_1291;
    int _1307 = _1305 + 1;
    int _1309 = _1307 + 1;
    int _1311 = _1297 * as_type<int>(_1141);
    int _1313 = _1311 + _1289;
    bool _1315 = _1181 != 3;
    float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1319 = _1303 + _1317;
    int _1321 = _1309;
    float _1323 = _1303;
    if (_1271)
    {
        int _1325 = ~_1291;
        int _1327 = _1325 + 1;
        _1321 = _1327;
    }
    int _1329 = _1321;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1333 = _1229 + _1331;
    float _1335 = in.m_69.x;
    float _1337 = in.m_69.y;
    float _1339 = in.m_69.z;
    bool _1341 = uint(_1275) >= uint(_484);
    float _1343 = _1319 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1345 = !_1315;
    int _1347 = _1345 ? 0 : (-1);
    int _1349 = abs(_1329);
    bool _1351 = !_1341;
    int _1353 = _1351 ? 0 : (-1);
    int _1355 = abs(_1347);
    float _1357 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1343);
    bool _1359 = !_1301;
    int _1361 = _1359 ? 0 : 1;
    int _1363 = ~_1259;
    int _1365 = _1363 + _1353;
    int _1367 = _1365 + 1;
    float _1369 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1357);
    int _1371 = ~_1349;
    int _1373 = _1371 + 1;
    int _1375 = _1373 + 1;
    int _1377 = abs(_1361);
    int _1379 = _484 * _1367;
    int _1381 = _1379 + _717;
    float _1383 = _1319 * _1319;
    int _1385 = _1375 * as_type<int>(_1207);
    int _1387 = _1385 + _1313;
    int _1389 = ~_1355;
    int _1391 = _1389 + 1;
    int _1393 = _1391 + 1;
    float _1395 = fma(_1261, _1335, _1335);
    bool _1397 = _1369 >= 0.0;
    float _1399 = fma(_1285, _1285, _1383);
    int _1401 = _1393 * as_type<int>(_1215);
    int _1403 = _1401 + _1387;
    bool _1405 = !_607;
    int _1407 = _1405 ? _1381 : (-1);
    float _1409 = fma(_1333, _1333, _1399);
    int _1411 = ~_1377;
    int _1413 = _1411 + 1;
    int _1415 = _1413 + 1;
    float _1417 = fma(_863, _1261, _863);
    float _1419 = _573 + (-0.5);
    float _1421 = rsqrt(_1409);
    float _1423 = fma(_897, _1237, _897);
    int _1425 = _1403 * _1415;
    float _1427 = fma(_1419, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1395);
    if (_1397)
    {
        _911 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1429 = _911;
    int _1431 = _1407 * _1377;
    int _1433 = _1431 + _1425;
    bool _1435 = !_1015;
    int _1437 = _1435 ? 0 : 1;
    int _1439 = as_type<int>(_1429);
    if (_1397)
    {
        out.m_53.x = 0.0;
    }
    if (_1397)
    {
        float _1441 = _1429 * 5.0;
        _1439 = as_type<int>(_1441);
    }
    int _1443 = _1439;
    float _1445 = fma(_1237, _1337, _1337);
    float _1447 = float(_1433);
    float _1449 = fma(_1417, _915, _1427);
    int _1451 = abs(_1437);
    if (_1397)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4938 = as_type<float>(_1443);
        out.gl_Position.z = _4938;
    }
    float _1453 = _575 + (-0.5);
    float _1455 = float(_1075);
    float _1457 = _1319 * _1421;
    out.m_71.x = _1447;
    float _1459 = _1285 * _1421;
    float _1461 = _1457;
    if (_1397)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1463 = -_1457;
    float _1465 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1303);
    float _1467 = _1333 * _1421;
    float _1469 = -_1459;
    float _1471 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1161);
    float _1473 = float(_1451);
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1477 = _1465 + _1475;
    float _1479 = _1449 * 0.15915493667125701904296875;
    float _1481 = -_1467;
    float _1483 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1229);
    float _1485 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1487 = _1471 + _1485;
    float _1489 = _1477 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1491 = _773 + _573;
    float _1493 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1495 = _1483 + _1493;
    float _1497 = _1473 * _1455;
    float _1499 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1489);
    float _1501 = _1491 + (-1.0);
    float _1503 = -_1457;
    float _1505 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1319);
    float _1507 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1499);
    float _1509 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1445);
    float _1511 = _1497 * (-2.0);
    float _1513 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1515 = -_1459;
    float _1517 = fma(_1515, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1285);
    bool _1519 = _1507 >= 0.0;
    float _1521 = _1505 * _1505;
    float _1523 = fma(_1511, _1339, _1339);
    float _1525 = _773 + (-0.5);
    float _1527 = fma(_1423, _915, _1509);
    float _1529 = fma(_1517, _1517, _1521);
    float _1531 = -_1467;
    float _1533 = fma(_1531, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1333);
    float _1535 = fma(_1513, _1511, _1513);
    float _1537 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1523);
    float _1539 = _1527 * 0.15915493667125701904296875;
    float _1541 = fma(_1533, _1533, _1529);
    float _1543 = _1479 * 6.283185482025146484375;
    float _1545 = sin(_1543);
    float _1547 = fma(_1535, _915, _1537);
    float _1549 = _1523;
    if (_1519)
    {
        _1549 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1551 = _1549;
    int _1553 = as_type<int>(_1551);
    if (_1519)
    {
        out.m_53.x = 0.0;
    }
    float _1555 = _1547 * 0.15915493667125701904296875;
    if (_1519)
    {
        float _1557 = _1551 * 5.0;
        _1553 = as_type<int>(_1557);
    }
    int _1559 = _1553;
    float _1561 = _1479 * 6.283185482025146484375;
    float _1563 = cos(_1561);
    if (_1519)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5136 = as_type<float>(_1559);
        out.gl_Position.z = _5136;
    }
    float _1565 = _1539 * 6.283185482025146484375;
    float _1567 = sin(_1565);
    float _1569 = _1539 * 6.283185482025146484375;
    float _1571 = cos(_1569);
    float _1573 = sqrt(_1541);
    if (_1519)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1575 = in.m_73.x;
    float _1577 = in.m_73.y;
    float _1579 = in.m_73.z;
    float _1581 = _1555 * 6.283185482025146484375;
    float _1583 = cos(_1581);
    float _1585 = _1421 * _1573;
    float _1587 = _388 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1589 = _1545 * _1567;
    float _1591 = _1545 * _1571;
    float _1593 = _1563 * _1571;
    float _1595 = _1563 * _1567;
    float _1597 = _1555 * 6.283185482025146484375;
    float _1599 = sin(_1597);
    bool _1601 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1603 = isnan(0.5);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1609 = _1605 || _1607;
    float _1611 = _1563 * _1583;
    float _1613 = _1571 * _1583;
    float _1615 = _1545 * _1583;
    float _1617 = _1567 * _1583;
    float _1619 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1621 = _1585 * _1587;
    float _1623 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1625 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1577);
    float _1627 = _1585 * _1619;
    float _1629 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1575);
    float _1631 = _1585 * _1623;
    float _1633 = _1625 * _1621;
    float _1635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1579);
    float _1637 = _1629 * _1627;
    float _1639 = fma(_1599, _1593, _1589);
    float _1641 = _1611 * _1633;
    float _1643 = _1635 * _1631;
    float _1645 = -_1591;
    float _1647 = fma(_1599, _1595, _1645);
    float _1649 = -_1633;
    float _1651 = _1599 * _1649;
    float _1653 = fma(_1639, _1637, _1641);
    float _1655 = -_1595;
    float _1657 = fma(_1599, _1591, _1655);
    float _1659 = _1615 * _1633;
    float _1661 = fma(_1613, _1637, _1651);
    float _1663 = fma(_1647, _1643, _1653);
    float _1665 = fma(_1599, _1589, _1593);
    float _1667 = fma(_1657, _1637, _1659);
    float _1669 = fma(_1617, _1643, _1661);
    float _1671 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1673 = fma(_1665, _1643, _1667);
    float _1675 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1677 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1671);
    float _1679 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1675);
    float _1681 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1677);
    float _1683 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1679);
    float _1685 = _1681 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1687 = _1683 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1689 = _1229 + _1685;
    float _1691 = _1161 + _1687;
    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1695 = _1689 + _1693;
    float _1697 = _1663 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1701 = _1691 + _1699;
    float _1703 = _1695 * _1695;
    float _1705 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1697);
    float _1707 = fma(_1701, _1701, _1703);
    float _1709 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1705);
    float _1711 = sqrt(_1707);
    float _1713 = _1709 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1715 = _1303 + _1713;
    bool _1717 = _1711 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1719 = _1633;
    float _1721 = _1691;
    float _1723 = _1689;
    float _1725 = _1673;
    float _1727 = _1575;
    if (!_1717)
    {
        _1719 = _1715;
    }
    float _1729 = _1719;
    bool _1731 = !_1717;
    float _1733 = _1729;
    if (!_1731)
    {
        float _1735 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1737 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1739 = _1711 + _1737;
        float _1741 = rsqrt(_1707);
        float _1743 = _1739 * _1735;
        float _1745 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1747 = _1743 * 0.15915493667125701904296875;
        float _1749 = _1747 * 6.283185482025146484375;
        float _1751 = cos(_1749);
        float _1753 = _1747 * 6.283185482025146484375;
        float _1755 = sin(_1753);
        float _1757 = _1751 + (-1.0);
        float _1759 = _1757 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1761 = fma(_1755, _1745, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1763 = fma(_1715, _1751, _1759);
        float _1765 = _1741 * _1761;
        float _1767 = fma(_1701, _1765, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1769 = fma(_1695, _1765, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1721 = _1767;
        _1733 = _1763;
        _1723 = _1769;
    }
    float _1771 = _1721;
    float _1773 = _1733;
    float _1775 = _1723;
    float _1777 = -_1459;
    float _1779 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1771);
    float _1781 = -_1457;
    float _1783 = fma(_1781, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1773);
    float _1785 = -_1467;
    float _1787 = fma(_1785, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1775);
    float _1789 = _1783;
    float _1791 = _1787;
    float _1793 = _1779;
    if (_1609)
    {
        _1461 = _1779;
    }
    float _1795 = _1461;
    float _1797 = _1795;
    if (!_1609)
    {
        float _1799 = _1477 * _1477;
        float _1801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1803 = -_1229;
        float _1805 = _1803 + _1775;
        float _1807 = -_1161;
        float _1809 = _1807 + _1771;
        float _1811 = fma(_1487, _1487, _1799);
        float _1813 = -_1303;
        float _1815 = _1813 + _1773;
        float _1817 = fma(_1495, _1495, _1811);
        float _1819 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1821 = sqrt(_1817);
        float _1823 = 1.0 / _1585;
        float _1825 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1827 = precise::min(_1821, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1829 = _1827 * _1801;
        float _1831 = _1829 * _1823;
        float _1833 = _1825 * _1831;
        float _1835 = _1805 * _1831;
        float _1837 = fma(_1809, _1833, _1471);
        float _1839 = fma(_1815, _1833, _1465);
        float _1841 = fma(_1825, _1835, _1483);
        _1789 = _1839;
        _1797 = _1837;
        _1791 = _1841;
    }
    float _1843 = _1789;
    float _1845 = _1797;
    float _1847 = _1791;
    float _1849 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1851 = _1843 + _1849;
    float _1853 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1855 = _1845 + _1853;
    float _1857 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1859 = _1847 + _1857;
    float _1861 = _1851 * _1851;
    float _1863 = fma(_1855, _1855, _1861);
    float _1865 = fma(_1859, _1859, _1863);
    float _1867 = rsqrt(_1865);
    float _1869 = sqrt(_1865);
    float _1871 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1873 = _1855 * _1871;
    float _1875 = _1859 * _1871;
    float _1877 = _1873 * _1873;
    float _1879 = _1875 * _1875;
    float _1881 = _1877 + _1879;
    float _1883 = sqrt(_1881);
    bool _1885 = _1883 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1887 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1889 = _1883 + _1887;
    float _1891 = _1859;
    float _1893 = _1889;
    float _1895 = _1851;
    if (_1885)
    {
        float _1897 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1891 = _1897;
    }
    float _1899 = _1891;
    if (_1885)
    {
        float _1901 = rsqrt(_1881);
        _1793 = _1901;
    }
    float _1903 = _1793;
    float _1905 = _1903;
    if (_1885)
    {
        float _1907 = _1889 * _1899;
        _1893 = _1907;
    }
    float _1909 = _1893;
    if (_1885)
    {
        float _1911 = _1909 * 0.15915493667125701904296875;
        _1323 = _1911;
    }
    float _1913 = _1323;
    float _1915 = _1867;
    float _1917 = _1913;
    if (_1885)
    {
        float _1919 = _1913 * 6.283185482025146484375;
        float _1921 = sin(_1919);
        _1915 = _1921;
    }
    float _1923 = _1915;
    float _1925 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1927 = precise::max(0.0, _1925);
    float _1929 = _1861;
    float _1931 = _1927;
    float _1933 = _1925;
    if (_1885)
    {
        float _1935 = _1913 * 6.283185482025146484375;
        float _1937 = cos(_1935);
        _1929 = _1937;
    }
    float _1939 = _1929;
    float _1941 = -_1871;
    float _1943 = -_1927;
    float _1945 = fma(_1851, _1941, _1943);
    if (!_1885)
    {
        _1895 = _1875;
    }
    float _1947 = _1895;
    float _1949 = _1947;
    if (_1885)
    {
        float _1951 = _1945 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1931 = _1951;
    }
    float _1953 = _1931;
    float _1955 = _1953;
    if (!_1885)
    {
        _1917 = _1879;
    }
    float _1957 = _1917;
    float _1959 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1961 = _1923;
    float _1963 = _1957;
    if (_1885)
    {
        float _1965 = fma(_1923, _1953, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1955 = _1965;
    }
    float _1967 = _1955;
    if (!_1885)
    {
        _1961 = _1945;
    }
    float _1969 = _1961;
    float _1971 = _1969;
    float _1973 = _1939;
    if (_1885)
    {
        float _1975 = _1939 + (-1.0);
        _1933 = _1975;
    }
    float _1977 = _1933;
    float _1979 = _1977;
    if (_1885)
    {
        float _1981 = _1903 * _1967;
        _1725 = _1981;
    }
    float _1983 = _1725;
    if (!_1885)
    {
        _1905 = _1873;
    }
    float _1985 = _1905;
    float _1987 = _1985;
    if (_1885)
    {
        float _1989 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1979 = _1989;
    }
    float _1991 = _1979;
    if (_1885)
    {
        float _1993 = _1873 * _1983;
        _1987 = _1993;
    }
    float _1995 = _1987;
    if (_1885)
    {
        float _1997 = _1875 * _1983;
        _1949 = _1997;
    }
    float _1999 = _1949;
    if (_1885)
    {
        float _2001 = fma(_1945, _1939, _1991);
        _1971 = _2001;
    }
    float _2003 = _1971;
    if (!_1885)
    {
        _1973 = _1877;
    }
    float _2005 = _1973;
    float _2007 = _2005;
    if (_1885)
    {
        float _2009 = _1995 * _1995;
        _2007 = _2009;
    }
    float _2011 = _2007;
    if (_1885)
    {
        float _2013 = _1999 * _1999;
        _1963 = _2013;
    }
    float _2015 = _1963;
    float _2017 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1959);
    float _2019 = fma(_2003, _2003, _2011);
    float _2021 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2023 = fma(_1471, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2025 = _2019 + _2015;
    float _2027 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2021);
    float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2031 = fma(_1869, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2029);
    float _2033 = precise::clamp(_2031, 0.0, 1.0);
    float _2035 = rsqrt(_2025);
    float _2037 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2027);
    float _2039 = -_2033;
    float _2041 = _2039 + 1.0;
    float _2043 = _2037 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2047 = floor(_2023);
    float _2049 = _2043 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2051 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2053 = fma(_1483, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2055 = -_2049;
    float _2057 = fma(_2055, _2045, 1.0);
    float _2059 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2061 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2051);
    float _2063 = _2035 * _1995;
    float _2065 = _2035 * _1999;
    float _2067 = fma(_1845, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2059);
    float _2069 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2061);
    float _2071 = abs(_2041);
    float _2073 = log2(_2071);
    float _2075 = _2035 * _2003;
    float _2077 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2079 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2067);
    float _2081 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2083 = -_2047;
    float _2085 = _2023 + _2083;
    float _2087 = -_2077;
    float _2089 = fma(_2075, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2087);
    float _2091 = _2079 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2093 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2095 = floor(_2053);
    float _2097 = -_2065;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2089);
    float _2101 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2017);
    float _2103 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2093);
    float _2105 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2107 = fma(_2099, 0.5, 0.5);
    float _2109 = _2101 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2111 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2103);
    float _2113 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2115 = log2(_2057);
    float _2117 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2119 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2111);
    float _2121 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2105);
    float _2123 = fma(_2107, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2125 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2117);
    float _2127 = exp2(_2113);
    float _2129 = fma(_2099, -0.5, 0.5);
    float _2131 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2125);
    float _2133 = -_2095;
    float _2135 = _2053 + _2133;
    float _2137 = _2075 + 1.0;
    float _2139 = fma(_2107, _2123, -0.212114393711090087890625);
    float _2141 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2131);
    float _2143 = sqrt(_2129);
    float _2145 = fma(_2107, _2139, 1.570728778839111328125);
    float _2147 = _2115 * 0.693147182464599609375;
    float _2149 = 1.0 / _2119;
    float _2151 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2121);
    float _2153 = -_2075;
    float _2155 = fma(_2127, _2137, _2153);
    float _2157 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2151);
    float2 _6110 = float2(_2085, _2135);
    float _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6110, float2(0.0), isnan(_6110)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6110, float2(0.0), isnan(_6110)), level(0.0)).x;
    float _2161 = fma(_2155, 0.5, 0.5);
    float _2163 = _2143 * 0.636619746685028076171875;
    float _2165 = -_2145;
    float _2167 = fma(_2163, _2165, 1.0);
    float _2169 = _2157 * _2149;
    float _2171 = _2141 * _2149;
    float _2173 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2175 = fma(_2169, 0.5, 0.5);
    float _2177 = fma(_2171, -0.5, 0.5);
    float3 _6145 = float3(_2175, _2177, _2173);
    float _2179 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6145, float3(0.0), isnan(_6145)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6145, float3(0.0), isnan(_6145)), level(0.0)).x;
    float3 _6156 = float3(_2175, _2177, _2173);
    float4 _2182 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6156, float3(0.0), isnan(_6156)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6156, float3(0.0), isnan(_6156)), level(0.0)).xyzw;
    float _2184 = _2182.x;
    float _2186 = _2182.y;
    float _2188 = _2182.z;
    float _2190 = _2182.w;
    float2 _6172 = float2(_2167, _2161);
    float3 _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6172, float2(0.0), isnan(_6172)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6172, float2(0.0), isnan(_6172)), level(0.0)).xyz;
    float _2196 = _2194.x;
    float _2198 = _2194.y;
    float _2200 = _2194.z;
    float _2202 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2204 = _1465 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2206 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2208 = _1577 != 0.0;
    bool _2210 = isnan(_1577);
    bool _2212 = _2208 || _2210;
    bool _2214 = isnan(0.0);
    bool _2216 = _2212 || _2214;
    float _2218 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2202);
    float _2220 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2204);
    float _2222 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2224 = _1575 == 0.0;
    bool _2226 = !_2216;
    bool _2228 = _2224 && _2226;
    float _2230 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2218);
    float _2232 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2220);
    float _2234 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2236 = _2230 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2238 = _2232 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2240 = _1579 == 0.0;
    bool _2242 = _2240 && _2228;
    float _2244 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2246 = 1.0 / _2236;
    float _2248 = _2238 + _2236;
    float _2250 = _1611 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2252 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2234);
    float _2254 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2206);
    float _2256 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2258 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2260 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2262 = isnan(0.5);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2268 = _2264 || _2266;
    float _2270 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2272 = _1639 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2274 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2256);
    float _2276 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2258);
    float _2278 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2252);
    float _2280 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2272);
    float _2282 = -_1599;
    float _2284 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2222);
    float _2286 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2288 = _2248 * _2246;
    float _2290 = _2288 * 0.5;
    float _2292 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2276);
    float _2294 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2284);
    float _2296 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2286);
    float _2298 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2300 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2298);
    float _2302 = exp2(_2270);
    float _2304 = in.m_75.x;
    float _2306 = in.m_75.y;
    float _2308 = in.m_75.z;
    float _2310 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2296);
    float _2312 = 1.0 / _2300;
    float _2314 = -_2302;
    float _2316 = _2314 + 1.0;
    float _2318 = -_1599;
    float _2320 = fma(_2318, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2244);
    float _2322 = -_1599;
    float _2324 = fma(_2322, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2250);
    float _2326 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2328 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2280);
    float _2330 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2320);
    float _2332 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2324);
    float _2334 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2336 = _2312 * _2334;
    float _2338 = _2306;
    float _2340 = _2304;
    float _2342 = _2308;
    float _2344 = _2119;
    float _2346 = _2141;
    if (!_2242)
    {
        float _2348 = fma(_1577, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2306);
        _2338 = _2348;
    }
    float _2350 = _2338;
    float _2352 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2326);
    float _2354 = abs(_2336);
    float _2356 = log2(_2354);
    if (!_2242)
    {
        float _2358 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2304);
        _2340 = _2358;
    }
    float _2360 = _2340;
    float _2362 = _2294 * _2350;
    float _2364 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2352);
    float _2366 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2254);
    float _2368 = _2330 * _2350;
    float _2370 = _2332 * _2350;
    if (!_2242)
    {
        float _2372 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2308);
        _2342 = _2372;
    }
    float _2374 = _2342;
    float _2376 = fma(_2278, _2360, _2362);
    float _2378 = fma(_2328, _2360, _2368);
    float _2380 = fma(_2366, _2360, _2370);
    float _2382 = _2316 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2384 = fma(_2310, _2374, _2376);
    float _2386 = _2376;
    if (!_2268)
    {
        float _2388 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2390 = _2336 + _2388;
        _2386 = _2390;
    }
    float _2392 = _2386;
    bool _2394 = _2336 <= 8000.0;
    bool _2396 = isnan(_2336);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan(8000.0);
    bool _2402 = _2398 || _2400;
    float _2404 = float(_2402);
    float _2406 = fma(_2364, _2374, _2378);
    float _2408 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (!_2268)
    {
        _1727 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2410 = _1727;
    float _2412 = exp2(_2408);
    float _2414 = _2410;
    float _2416 = _2157;
    if (!_2268)
    {
        float _2418 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2420 = _2410 + _2418;
        _2414 = _2420;
    }
    float _2422 = _2414;
    bool _2424 = _1869 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2426 = isnan(_1869);
    bool _2428 = _2424 || _2426;
    bool _2430 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2432 = _2428 || _2430;
    float _2434 = _2328;
    float _2436 = _2422;
    if (!_2268)
    {
        float _2438 = 1.0 / _2422;
        _2434 = _2438;
    }
    float _2440 = _2434;
    float _2442 = fma(_2412, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2444 = precise::clamp(_2442, 0.0, 1.0);
    float _2446 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2274);
    if (_2268)
    {
        _2436 = 1.0;
    }
    float _2448 = _2436;
    float _2450 = fma(_2444, -2.0, 3.0);
    float _2452 = _2444 * _2444;
    float _2454 = fma(_2446, _2374, _2380);
    float _2456 = _2448;
    if (!_2268)
    {
        float _2458 = _2392 * _2440;
        float _2460 = precise::clamp(_2458, 0.0, 1.0);
        _2456 = _2460;
    }
    float _2462 = _2456;
    float _2464 = _2452 * _2450;
    out.m_77.x = _2384;
    out.m_77.y = _2406;
    out.m_77.z = _2454;
    float _2466 = -_2464;
    float _2468 = _2466 + 1.0;
    float _2470 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2464);
    float _2472 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2292);
    float _2474 = in.m_79.x;
    float _2476 = _2404 * _2470;
    float _2478 = _2472 + _2119;
    out.gl_Position.x = _2157;
    out.gl_Position.y = _2141;
    out.gl_Position.z = _2472;
    out.gl_Position.w = _2119;
    float _2480 = _2476 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2482 = _2478 * 0.5;
    out.m_81.z = _2482;
    out.m_81.w = _2119;
    float _2484 = _2472;
    if (!_2432)
    {
        _2344 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2486 = _2344;
    float _2488 = _2486;
    float _2490 = _2486;
    if (!_2432)
    {
        _2346 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2492 = _2346;
    float _2494 = _2492;
    float _2496 = _2492;
    if (!_2432)
    {
        _2484 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2498 = _2484;
    float _2500 = _2498;
    float _2502 = _2498;
    if (!_2432)
    {
        _2416 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2504 = _2416;
    float _2506 = -_2159;
    float _2508 = _2506 + 1.0;
    float _2510 = _2508 * _2480;
    float _2512 = precise::clamp(_2510, 0.0, 1.0);
    float _2514 = -_2512;
    float _2516 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2518 = _2516 * _2474;
    float _2520 = _2382 * _2179;
    float _2522 = -_2382;
    float _2524 = _2522 + 1.0;
    float _2526 = _2190 * _2520;
    float _2528 = _2200 * _2520;
    float _2530 = _2190 * _2524;
    float _2532 = fma(_2196, _2526, _2184);
    float _2534 = fma(_2198, _2526, _2186);
    float _2536 = _2518 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2538 = fma(_2190, _2528, _2188);
    float _2540 = _2462 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2542 = _2526;
    float _2544 = _2518;
    float _2546 = _2504;
    float _2548 = _2504;
    if (!_2432)
    {
        _2542 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2550 = _2542;
    out.m_83.x = _2536;
    float _2552 = _2550;
    float _2554 = _2550;
    if (!_2432)
    {
        _2544 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2556 = _2544;
    out.m_85.x = _2532;
    out.m_85.y = _2534;
    out.m_85.z = _2538;
    out.m_85.w = _2530;
    bool _2558 = !_2432;
    float _2560 = _2556;
    float _2562 = _2556;
    if (!_2558)
    {
        bool _2564 = _1869 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2566 = isnan(_1869);
        bool _2568 = _2564 || _2566;
        bool _2570 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2572 = _2568 || _2570;
        if (!_2572)
        {
            float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2576 = _1869 + _2574;
            float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2580 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2578;
            float _2582 = 1.0 / _2580;
            float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2586 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2590 = _2588 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2594 = _2592 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2598 = _2596 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2600 = _2576 * _2582;
            float _2602 = precise::clamp(_2600, 0.0, 1.0);
            float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2612 = fma(_2602, _2586, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2614 = fma(_2602, _2606, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2616 = fma(_2602, _2610, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2618 = fma(_2602, _2590, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2620 = fma(_2602, _2594, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2622 = fma(_2602, _2598, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2496 = _2616;
            _2554 = _2620;
            _2490 = _2614;
            _2548 = _2618;
            _2502 = _2612;
            _2562 = _2622;
            _2624 = true;
        }
        else
        {
            bool _2626 = _1869 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2628 = isnan(_1869);
            bool _2630 = _2626 || _2628;
            bool _2632 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2634 = _2630 || _2632;
            if (!_2634)
            {
                _2488 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2636 = _2488;
            _2490 = _2636;
            if (!_2634)
            {
                _2494 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2638 = _2494;
            _2496 = _2638;
            if (!_2634)
            {
                _2500 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2640 = _2500;
            _2502 = _2640;
            if (!_2634)
            {
                _2546 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2642 = _2546;
            _2548 = _2642;
            if (!_2634)
            {
                _2552 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2644 = _2552;
            _2554 = _2644;
            if (!_2634)
            {
                _2560 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2646 = _2560;
            bool _2648 = !_2634;
            _2562 = _2646;
            if (!_2648)
            {
                bool _2650 = _1869 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2652 = isnan(_1869);
                bool _2654 = _2650 || _2652;
                bool _2656 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2658 = _2654 || _2656;
                if (!_2658)
                {
                    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2662 = _1869 + _2660;
                    float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2666 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2664;
                    float _2668 = 1.0 / _2666;
                    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2682 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2684 = _2682 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2686 = _2662 * _2668;
                    float _2688 = precise::clamp(_2686, 0.0, 1.0);
                    float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2692 = _2690 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2698 = fma(_2688, _2672, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2700 = fma(_2688, _2692, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2702 = fma(_2688, _2696, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2704 = fma(_2688, _2676, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2706 = fma(_2688, _2680, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2708 = fma(_2688, _2684, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2496 = _2702;
                    _2554 = _2706;
                    _2490 = _2700;
                    _2548 = _2704;
                    _2502 = _2698;
                    _2562 = _2708;
                    _2624 = true;
                }
                else
                {
                    _2496 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2554 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2490 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2548 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2502 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2562 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2624 = false;
    float _2710 = _2496;
    float _2712 = _2554;
    float _2714 = _2490;
    float _2716 = _2548;
    float _2718 = _2502;
    float _2720 = _2562;
    float _2722 = _2540 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2724 = fma(_2406, -0.5, 0.5);
    float _2726 = precise::clamp(_2724, 0.0, 1.0);
    float _2728 = -_2710;
    float _2730 = _2728 + _2712;
    float _2732 = -_2714;
    float _2734 = _2732 + _2716;
    out.m_53.x = _2722;
    float _2736 = fma(_2726, _2730, _2710);
    float _2738 = -_2718;
    float _2740 = _2738 + _2720;
    float _2742 = fma(_2726, _2734, _2714);
    float _2744 = _2736 * 0.586610972881317138671875;
    bool _2746 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2748 = fma(_2726, _2740, _2718);
    out.m_87.x = 0.0;
    float _2750 = fma(_2742, 0.298911988735198974609375, _2744);
    bool _2752 = _2462 > 0.0;
    bool _2754 = isnan(_2462);
    bool _2756 = _2752 || _2754;
    bool _2758 = isnan(0.0);
    bool _2760 = _2756 || _2758;
    float _2762 = fma(_2748, 0.114477999508380889892578125, _2750);
    float _2764 = -_2762;
    float _2766 = _2742 + _2764;
    float _2768 = -_2762;
    float _2770 = _2736 + _2768;
    float _2772 = -_2762;
    float _2774 = _2748 + _2772;
    float _2776 = fma(_2766, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2762);
    float _2778 = fma(_2770, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2762);
    float _2780 = fma(_2774, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2762);
    bool _2782 = !_2746;
    if (!_2782)
    {
        float _2784 = -_1843;
        float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2788 = -_1845;
        float _2790 = _2788 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2792 = -_1847;
        float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2796 = _2786 * _2786;
        float _2798 = fma(_2790, _2790, _2796);
        float _2800 = fma(_2794, _2794, _2798);
        float _2802 = sqrt(_2800);
        float _2804 = rsqrt(_2800);
        float _2806 = -_2802;
        float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2810 = _2808 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2812 = precise::clamp(_2810, 0.0, 1.0);
        float _2814 = _2790 * _2804;
        float _2816 = _2786 * _2804;
        float _2818 = abs(_2812);
        float _2820 = log2(_2818);
        float _2822 = _2794 * _2804;
        float _2824 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2826 = _2406 * _2816;
        float _2828 = -_2816;
        float _2830 = -_2824;
        float _2832 = fma(_2828, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2830);
        float _2834 = fma(_2384, _2814, _2826);
        float _2836 = -_2822;
        float _2838 = fma(_2836, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2832);
        float _2840 = fma(_2454, _2822, _2834);
        float _2842 = precise::clamp(_2840, 0.0, 1.0);
        float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2846 = _2838 + _2844;
        float _2848 = _2820 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2850 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2852 = precise::clamp(_2850, 0.0, 1.0);
        float _2854 = exp2(_2848);
        float _2856 = _2854 * _2852;
        float _2858 = _2842 * _2856;
        float _2860 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2862 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2864 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2860;
        out.m_87.y = _2862;
        out.m_87.z = _2864;
    }
    out.m_89.x = _2776;
    out.m_89.y = _2778;
    out.m_89.z = _2780;
    if (_2760)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2866 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2866;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

