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
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_28Smplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(0)]];
    float4 m_71 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_79 [[attribute(5)]];
    float4 m_77 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_65 [[attribute(10)]];
    float4 m_63 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3350 = false;
    bool _434 = false;
    bool _336 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_114)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3654 = as_type<float>(_124);
        out.gl_Position.z = _3654;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_53.w;
    float _130 = float(_110);
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
    float _152 = _128;
    float _154 = _134;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _152;
    if (_150)
    {
        out.m_51.x = 0.0;
    }
    if (_150)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3719 = as_type<float>(_160);
        out.gl_Position.z = _3719;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _130;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _134 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _186;
    float _212;
    if (!_192)
    {
        float _196 = in.m_57.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _172;
    }
    _214 = false;
    float _216 = _212;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    float _222 = in.m_59.x;
    float _224 = in.m_59.y;
    float _226 = in.m_59.z;
    bool _228 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _230 = isnan(_216);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    bool _244 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_216);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -_238;
    float _258 = _256 + 1.0;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _260;
    float _264 = 1.0 / _242;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _268 = _254 * _258;
    float _270 = -_254;
    float _272 = _270 + 1.0;
    float _274 = _220 * _264;
    float _276 = fma(_262, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = _276 * _268;
    float _288 = fma(_280, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _290 = fma(_284, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _292 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].x, _286);
    float _294 = _288 * _268;
    float _296 = _290 * _268;
    float _298 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].x, _292);
    float _300 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].y, _294);
    float _302 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].z, _296);
    float _304 = _298 * _222;
    float _306 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].y, _300);
    float _308 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].z, _302);
    float _310 = _306 * _224;
    float _312 = _308 * _226;
    bool _314 = !_266;
    float _316 = _222;
    float _334;
    if (!_314)
    {
        float _318 = in.m_57.x;
        float _320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _322 = _318 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _326 = _324 * _320;
        float _328 = floor(_326);
        float _330 = -_328;
        float _332 = _326 + _330;
        _334 = _332;
        _336 = true;
    }
    else
    {
        _334 = _172;
    }
    _336 = false;
    float _338 = _334;
    bool _340 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _342 = isnan(_338);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _356 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _358 = isnan(_338);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _374 = _338 + _372;
    float _376 = -_350;
    float _378 = _376 + 1.0;
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _382 = 1.0 / _354;
    float _384 = _366 * _378;
    float _386 = -_366;
    float _388 = _386 + 1.0;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _392 = _370 * _382;
    float _394 = fma(_392, _374, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _398 = _394 * _384;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _402 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[115].x, _398);
    float _404 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[116].x, _402);
    float _406 = _400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _408 = _396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _410 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _412 = _404 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _406;
    out.m_61.y = _408;
    out.m_61.z = _410;
    out.m_61.w = _412;
    bool _414 = !_380;
    float _432;
    if (!_414)
    {
        float _416 = in.m_57.x;
        float _418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _420 = _416 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _422 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _424 = _422 * _418;
        float _426 = floor(_424);
        float _428 = -_426;
        float _430 = _424 + _428;
        _432 = _430;
        _434 = true;
    }
    else
    {
        _432 = _172;
    }
    _434 = false;
    float _436 = _432;
    float _438 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _440 = int(_438);
    float _442 = in.m_57.x;
    float _444 = in.m_57.y;
    float _446 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _448 = int(_446);
    bool _450 = _436 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _452 = isnan(_436);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    bool _462 = _436 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _464 = isnan(_436);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = float(_440);
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _478 = 1.0 / _474;
    float _480 = float(uint(_448));
    float _482 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[78].w, _476);
    int _484 = ~_448;
    int _486 = _484 + 1;
    int _488 = ~_448;
    int _490 = _488 + 1;
    float _492 = 1.0 / _480;
    bool _494 = _448 == 0;
    int _496 = ~_448;
    int _498 = _496 + 1;
    float _500 = _478 * _134;
    float _502 = trunc(_500);
    int _504 = int(_502);
    int _506 = as_type<int>(_492) + (-2);
    float _508 = float(uint(_504));
    float _510 = as_type<float>(_506) * _508;
    float _512 = trunc(_510);
    float _514 = precise::max(_512, 0.0);
    uint _517 = uint(_514);
    int _519 = _486 * int(_517);
    int _521 = _519 + _504;
    float _523 = float(_448);
    float _525 = float(uint(_521));
    float _527 = as_type<float>(_506) * _525;
    float _529 = trunc(_527);
    float _531 = precise::max(_529, 0.0);
    uint _533 = uint(_531);
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _537 = _535 != 0;
    bool _539 = !_537;
    float _541 = _539 ? 7.345489978790283203125 : 1.0;
    float _543 = _541 * _442;
    int _545 = int(_517) + int(_533);
    float _547 = float(_504);
    float _549 = floor(_543);
    int _551 = _490 * _545;
    int _553 = _551 + _504;
    bool _555 = _547 >= _523;
    bool _557 = isnan(_547);
    bool _559 = _555 || _557;
    bool _561 = isnan(_523);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    bool _567 = uint(_553) >= uint(_448);
    float _569 = trunc(_565);
    int _571 = int(_569);
    bool _573 = !_567;
    int _575 = _573 ? 0 : (-1);
    int _577 = ~_545;
    int _579 = _577 + _575;
    int _581 = _579 + 1;
    float _583 = -_549;
    float _585 = _543 + _583;
    int _587 = _448 * _581;
    int _589 = _587 + _504;
    float _591 = _585 * _523;
    int _593 = ~_571;
    int _595 = _593 + 1;
    int _597 = _595 + 1;
    float _599 = trunc(_591);
    int _601 = int(_599);
    bool _603 = !_494;
    int _605 = _603 ? _589 : (-1);
    int _607 = _605 * _597;
    float _609 = _523 * _134;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _613 = _611 != 0;
    int _615 = _448 + (-1);
    float _617 = _609 * _168;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _621 = _619 != 0;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _625 = _623 != 0;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _629 = _627 != 0;
    bool _631 = !_613;
    int _633 = _631 ? 0 : 1;
    int _635 = _571 * _615;
    int _637 = _635 + _607;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _641 = _639 != 0;
    float _643 = trunc(_617);
    int _645 = int(_643);
    bool _647 = !_625;
    int _649 = _647 ? 0 : 1;
    bool _651 = !_621;
    int _653 = _651 ? 0 : 1;
    int _655 = abs(_649);
    bool _657 = !_629;
    int _659 = _657 ? 0 : 1;
    int _661 = abs(_653);
    bool _663 = !_641;
    int _665 = _663 ? 0 : 1;
    int _667 = abs(_633);
    int _669 = abs(_659);
    int _671 = _637 * _655;
    int _673 = abs(_665);
    int _675 = _601 * _667;
    int _677 = _675 + _504;
    int _679 = _645 * _661;
    int _681 = _679 + _671;
    float _683 = in.m_63.z;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _687 = _685 != 0;
    int _689 = _677 * _669;
    int _691 = _689 + _681;
    int _693 = ~_448;
    int _695 = _693 + 1;
    float _697 = in.m_63.y;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _701 = _699 != 0;
    int _703 = _601 * _673;
    int _705 = _703 + _691;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _709 = _707 != 0;
    float _711 = in.m_65.x;
    float _713 = float(uint(_705));
    float _715 = 0.0;
    if (_687)
    {
        float _717 = in.m_57.x;
        _715 = _717;
    }
    float _719 = _715;
    float _721 = as_type<float>(_506) * _713;
    float _723 = trunc(_721);
    float _725 = precise::max(_723, 0.0);
    uint _727 = uint(_725);
    out.m_67.z = _683;
    out.m_67.y = _697;
    int _729 = ~_448;
    int _731 = _729 + 1;
    float _733 = in.m_65.y;
    float _735 = _733;
    if (_687)
    {
        _316 = _711;
    }
    float _737 = _316;
    int _739 = _695 * int(_727);
    int _741 = _739 + _705;
    bool _743 = _719 > 0.5;
    bool _745 = _743 && _687;
    float _747 = float(uint(_741));
    float _749 = in.m_63.x;
    float _751 = as_type<float>(_506) * _747;
    float _753 = trunc(_751);
    float _755 = precise::max(_753, 0.0);
    uint _757 = uint(_755);
    float _759 = _737;
    if (_745)
    {
        float _761 = -_737;
        float _763 = _761 + 1.0;
        _759 = _763;
    }
    float _765 = _759;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _769 = int(_727) + int(_757);
    out.m_67.x = _749;
    int _771 = _498 * _769;
    int _773 = _771 + _705;
    float _775 = in.m_63.w;
    bool _777 = uint(_773) >= uint(_448);
    float _779 = float(uint(_677));
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _783 = !_777;
    int _785 = _783 ? 0 : (-1);
    bool _787 = _444 > 0.5;
    float _789 = as_type<float>(_506) * _779;
    int _791 = ~_769;
    int _793 = _791 + _785;
    int _795 = _793 + 1;
    float _797 = -_733;
    float _799 = _797 + 1.0;
    float _801 = trunc(_789);
    float _803 = precise::max(_801, 0.0);
    uint _805 = uint(_803);
    int _807 = _448 * _795;
    int _809 = _807 + _705;
    if (_701)
    {
        float _811 = _787 ? _799 : _733;
        _735 = _811;
    }
    float _813 = _735;
    float _815 = _444 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _817 = !_494;
    int _819 = _817 ? _809 : (-1);
    float _821 = fma(_815, -2.0, _781);
    out.m_67.w = _775;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _827 = _819 >> 31;
    int _829 = _819 & 3;
    bool _831 = _829 != 0;
    float _833 = 1.0 / _825;
    int _835 = _819 & 3;
    bool _837 = _835 != 0;
    int _839 = _731 * int(_805);
    int _841 = _839 + _677;
    float _843 = _442 * 2.0;
    bool _845 = uint(_829) > 1u;
    float _847 = float(uint(_841));
    float _849 = -_767;
    float _851 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[77].x, _849);
    int _853 = _827 & 3;
    float _855 = floor(_843);
    float _857 = as_type<float>(_506) * _847;
    int _859 = _819 + _853;
    float _861 = in.m_57.z;
    int _863 = _859 >> 2;
    float _865 = trunc(_857);
    float _867 = precise::max(_865, 0.0);
    uint _869 = uint(_867);
    float _871 = _843;
    if (!_687)
    {
        _871 = _711;
    }
    float _873 = _871;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _875;
    int _879 = _863 << 4;
    int _881 = _879 + 368;
    int _883 = _837 ? 0 : 1;
    float _885 = _877 * _833;
    uint _887 = uint(int(uint(_881) >> uint(2)));
    uint _889 = uint(int(uint(int(_887)) >> uint(2)));
    int _891 = int(_887) & 3;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[int(_889)][_891];
    int _895 = int(_887) + 1;
    uint _897 = uint(int(uint(_895) >> uint(2)));
    int _899 = _895 & 3;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[int(_897)][_899];
    bool _903 = _855 > 0.0;
    float _905 = _444 * 2.0;
    bool _907 = _855 >= 0.0;
    bool _909 = isnan(_855);
    bool _911 = _907 || _909;
    bool _913 = isnan(0.0);
    bool _915 = _911 || _913;
    float _917 = _873;
    if (_687)
    {
        _917 = _765;
    }
    float _919 = _917;
    float _921 = floor(_905);
    bool _923 = _829 != 3;
    int _925 = int(_805) + int(_869);
    int _927 = _881 + 8;
    uint _929 = uint(int(uint(_927) >> uint(2)));
    uint _931 = uint(int(uint(int(_929)) >> uint(2)));
    int _933 = int(_929) & 3;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[int(_931)][_933];
    int _937 = int(_929) + 1;
    uint _939 = uint(int(uint(_937) >> uint(2)));
    int _941 = _937 & 3;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[int(_939)][_941];
    int _945 = ~_883;
    int _947 = _945 + 1;
    int _949 = _947 + 1;
    float _951 = _444 + _861;
    int _953 = _949;
    if (!_845)
    {
        int _955 = ~_883;
        int _957 = _955 + 1;
        _953 = _957;
    }
    int _959 = _953;
    float _961 = _444 + _442;
    bool _963 = uint(_829) >= 2u;
    float _965 = _951 + (-1.0);
    int _967 = ~_448;
    int _969 = _967 + 1;
    float _971 = _961 + (-1.0);
    int _973 = _963 ? 0 : 1;
    float _975 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _977 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _979 = int(_977);
    float _981 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _983 = ~_973;
    int _985 = _983 + 1;
    int _987 = _985 + 1;
    int _989 = _969 * _925;
    int _991 = _989 + _677;
    int _993 = _987;
    if (_923)
    {
        int _995 = ~_973;
        int _997 = _995 + 1;
        _993 = _997;
    }
    int _999 = _993;
    int _1001 = abs(_959);
    bool _1003 = _829 != 3;
    bool _1005 = !_831;
    int _1007 = _1005 ? 0 : 1;
    int _1009 = abs(_1007);
    int _1011 = ~_1001;
    int _1013 = _1011 + 1;
    int _1015 = _1013 + 1;
    int _1017 = ~_1009;
    int _1019 = _1017 + 1;
    int _1021 = _1019 + 1;
    int _1023 = abs(_999);
    bool _1025 = uint(_991) >= uint(_448);
    bool _1027 = !_1003;
    int _1029 = _1027 ? 0 : (-1);
    int _1031 = _1015 * as_type<int>(_901);
    bool _1033 = !_709;
    int _1035 = _1033 ? 0 : 1;
    float _1037 = _861 * 2.0;
    bool _1039 = _921 > 0.0;
    int _1041 = _1021 * as_type<int>(_893);
    int _1043 = _1041 + _1031;
    bool _1045 = _921 >= 0.0;
    bool _1047 = isnan(_921);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan(0.0);
    bool _1053 = _1049 || _1051;
    float _1055 = floor(_1037);
    bool _1057 = !_1025;
    int _1059 = _1057 ? 0 : (-1);
    int _1061 = abs(_1029);
    int _1063 = ~_1023;
    int _1065 = _1063 + 1;
    int _1067 = _1065 + 1;
    int _1069 = ~_925;
    int _1071 = _1069 + _1059;
    int _1073 = _1071 + 1;
    int _1075 = abs(_1035);
    int _1077 = _1067 * as_type<int>(_935);
    int _1079 = _1077 + _1043;
    int _1081 = ~_1061;
    int _1083 = _1081 + 1;
    int _1085 = _1083 + 1;
    int _1087 = _448 * _1073;
    int _1089 = _1087 + _677;
    int _1091 = _915 ? 0 : 1;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1095 = _1093 != 0;
    int _1097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1099 = _1097 != 0;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1103 = _1101 != 0;
    int _1105 = _1085 * as_type<int>(_943);
    int _1107 = _1105 + _1079;
    float _1109 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1111 = log2(_1109);
    int _1113 = ~_1075;
    int _1115 = _1113 + 1;
    int _1117 = _1115 + 1;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1121 = _436 + _1119;
    float _1123 = float(uint(_979));
    int _1125 = abs(_979);
    int _1127 = _1107 * _1117;
    bool _1129 = !_494;
    int _1131 = _1129 ? _1089 : (-1);
    float _1133 = 1.0 / _1123;
    float _1135 = float(uint(_1125));
    int _1137 = _1131 * _1075;
    int _1139 = _1137 + _1127;
    int _1141 = ~_1091;
    int _1143 = _1141 + 1;
    int _1145 = _1143 + 1;
    int _1147 = _1145;
    if (!_903)
    {
        int _1149 = ~_1091;
        int _1151 = _1149 + 1;
        _1147 = _1151;
    }
    int _1153 = _1147;
    float _1155 = _1111 * _134;
    float _1157 = 1.0 / _1135;
    bool _1159 = _1055 > 0.0;
    bool _1161 = _1055 >= 0.0;
    bool _1163 = isnan(_1055);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan(0.0);
    bool _1169 = _1165 || _1167;
    float _1171 = fma(_885, _1121, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1173 = float(uint(_1139));
    int _1175 = abs(_1139);
    float _1177 = exp2(_1155);
    int _1179 = as_type<int>(_1133) + (-2);
    float _1181 = in.m_48.x;
    float _1183 = in.m_48.y;
    float _1185 = in.m_48.z;
    float _1187 = float(uint(_1175));
    float _1189 = as_type<float>(_1179) * _1173;
    float _1191 = in.m_69.y;
    int _1193 = as_type<int>(_1157) + (-2);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1197 = 1.0 + _1195;
    int _1199 = _1169 ? 0 : 1;
    float _1201 = trunc(_1189);
    float _1203 = precise::max(_1201, 0.0);
    uint _1205 = uint(_1203);
    bool _1207 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1209 = isnan(0.0);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1215 = _1211 || _1213;
    float _1217 = as_type<float>(_1193) * _1187;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1221 = -_1177;
    float _1223 = _1221 + 1.0;
    int _1225 = ~_979;
    int _1227 = _1225 + 1;
    float _1229 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _482);
    int _1231 = _1053 ? 0 : 1;
    float _1233 = trunc(_1217);
    float _1235 = precise::max(_1233, 0.0);
    uint _1237 = uint(_1235);
    float _1239 = _1215 ? _1223 : 0.0;
    float _1241 = -_472;
    float _1243 = _1241 + 1.0;
    bool _1245 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1247 = isnan(1.0);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1253 = _1249 || _1251;
    float _1255 = _460 * _1243;
    float _1257 = -_134;
    float _1259 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[76].x, _851);
    float _1261 = 1.0 / _1197;
    int _1263 = ~_1125;
    int _1265 = _1263 + 1;
    float _1267 = _1171 * _1255;
    int _1269 = ~_1199;
    int _1271 = _1269 + 1;
    int _1273 = _1271 + 1;
    float _1275 = _1183 + _1191;
    int _1277 = _1273;
    float _1279 = as_type<float>(_1205);
    if (!_1159)
    {
        int _1281 = ~_1199;
        int _1283 = _1281 + 1;
        _1277 = _1283;
    }
    int _1285 = _1277;
    float _1287 = _1183 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1289 = _1265 * int(_1237);
    int _1291 = _1289 + _1175;
    float _1293 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1219);
    float _1295 = fma(_1181, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1287);
    float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1299 = _1275 + _1297;
    float _1301 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1293);
    float _1303 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _821);
    int _1305 = _1227 * int(_1205);
    int _1307 = _1305 + _1139;
    if (_1253)
    {
        float _1309 = _1239 * _1261;
        _154 = _1309;
    }
    float _1311 = _154;
    float _1313 = -_460;
    float _1315 = _1313 + 1.0;
    float _1317 = float(uint(_1291));
    float _1319 = fma(_1185, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1295);
    float _1321 = float(uint(_1307));
    float _1323 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1267);
    bool _1325 = !_1099;
    int _1327 = _1325 ? 0 : 1;
    float _1329 = as_type<float>(_1193) * _1317;
    float _1331 = _1319 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1333 = as_type<float>(_1179) * _1321;
    float _1335 = _1183 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1337 = !_1095;
    int _1339 = _1337 ? 0 : 1;
    float _1341 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1343 = abs(_1327);
    float _1345 = fma(_1181, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1335);
    float _1347 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1349 = _1331 + _1347;
    float _1351 = in.m_71.x;
    float _1353 = in.m_71.y;
    float _1355 = in.m_71.z;
    int _1357 = abs(_1339);
    float _1359 = fma(_1185, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1345);
    float _1361 = trunc(_1329);
    float _1363 = precise::max(_1361, 0.0);
    uint _1365 = uint(_1363);
    float _1367 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1341);
    float _1369 = float(_1357);
    float _1371 = _1359 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1373 = float(_1285);
    float _1375 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1323);
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1379 = _1371 + _1377;
    float _1381 = trunc(_1333);
    float _1383 = precise::max(_1381, 0.0);
    uint _1385 = uint(_1383);
    float _1387 = _1369 * _1373;
    int _1389 = ~_1125;
    int _1391 = _1389 + 1;
    float _1393 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1367);
    float _1395 = float(_1153);
    float _1397 = _1387 * (-2.0);
    float _1399 = float(_1343);
    bool _1401 = _1393 >= 0.0;
    int _1403 = int(_1237) + int(_1365);
    float _1405 = _1399 * _1395;
    float _1407 = fma(_1397, _1351, _1351);
    int _1409 = ~_979;
    int _1411 = _1409 + 1;
    float _1413 = _1405 * (-2.0);
    int _1415 = int(_1205) + int(_1385);
    int _1417 = _1391 * _1403;
    int _1419 = _1417 + _1175;
    float _1421 = _1299 * _1299;
    int _1423 = ~_1231;
    int _1425 = _1423 + 1;
    int _1427 = _1425 + 1;
    float _1429 = fma(_981, _1397, _981);
    int _1431 = _1427;
    if (_1401)
    {
        _1279 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1433 = _1279;
    int _1435 = _1411 * _1415;
    int _1437 = _1435 + _1139;
    int _1439 = as_type<int>(_1433);
    if (!_1039)
    {
        int _1441 = ~_1231;
        int _1443 = _1441 + 1;
        _1431 = _1443;
    }
    int _1445 = _1431;
    float _1447 = fma(_1349, _1349, _1421);
    bool _1449 = uint(_1419) >= uint(_1125);
    int _1451 = _1139 ^ _979;
    if (_1401)
    {
        float _1453 = _1433 * 5.0;
        _1439 = as_type<int>(_1453);
    }
    int _1455 = _1439;
    bool _1457 = uint(_1437) >= uint(_979);
    float _1459 = fma(_1379, _1379, _1447);
    bool _1461 = !_1449;
    int _1463 = _1461 ? 0 : (-1);
    float _1465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _1467 = uint(int(uint(_1451) >> uint(31)));
    if (_1401)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5632 = as_type<float>(_1455);
        out.gl_Position.z = _5632;
    }
    bool _1469 = !_1457;
    int _1471 = _1469 ? 0 : (-1);
    float _1473 = fma(_975, _1413, _975);
    int _1475 = ~_1463;
    int _1477 = _1403 + _1475;
    int _1479 = _1477 + 1;
    float _1481 = _442 + (-0.5);
    int _1483 = ~_1415;
    int _1485 = _1483 + _1471;
    int _1487 = _1485 + 1;
    float _1489 = rsqrt(_1459);
    bool _1491 = _979 == 0;
    float _1493 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1407);
    bool _1495 = _979 == 0;
    if (_1401)
    {
        out.m_51.x = 0.0;
    }
    float _1497 = fma(_1413, _1353, _1353);
    int _1499 = ~int(_1467);
    int _1501 = _1499 + 1;
    int _1503 = _979 * _1487;
    int _1505 = _1503 + _1139;
    float _1507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1509 = _1465 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1511 = _1479 ^ _1501;
    float _1513 = fma(_1429, _1311, _1493);
    bool _1515 = !_1491;
    int _1517 = _1515 ? _1505 : (-1);
    float _1519 = fma(_1509, _919, -0.5);
    int _1521 = ~_1501;
    int _1523 = _1521 + _1511;
    int _1525 = _1523 + 1;
    float _1527 = float(_1517);
    float _1529 = _1299 * _1489;
    bool _1531 = !_1495;
    int _1533 = _1531 ? _1525 : (-1);
    float _1535 = _1349 * _1489;
    float _1537 = fma(_1509, _1527, _1259);
    float _1539 = float(_1533);
    float _1541 = -_1529;
    float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1299);
    float _1545 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1547 = fma(_1301, _1519, _1537);
    float _1549 = -_1535;
    float _1551 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1349);
    float _1553 = _1543 * _1543;
    float _1555 = fma(_1545, _813, -0.5);
    float _1557 = -_1303;
    float _1559 = fma(_1545, _1539, _1557);
    float _1561 = fma(_1551, _1551, _1553);
    float _1563 = fma(_1229, _1555, _1559);
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1567 = _1379 * _1489;
    float _1569 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1571 = _1547 + 0.5;
    float _1573 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1575 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1577 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1579 = _1563 + 0.5;
    float _1581 = _1573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1583 = _1375 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1585 = -_1567;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1379);
    bool _1589 = !_1103;
    int _1591 = _1589 ? 0 : 1;
    out.m_73.x = _1571;
    out.m_73.y = _1579;
    float _1593 = fma(_1587, _1587, _1561);
    int _1595 = abs(_1591);
    out.m_75.x = _1575;
    out.m_75.y = _1577;
    out.m_75.z = _1581;
    out.m_75.w = _1583;
    float _1597 = _1535;
    float _1599 = _1529;
    if (_1401)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1601 = -_1529;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1275);
    float _1605 = _444 + (-0.5);
    float _1607 = -_1535;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1331);
    float _1611 = float(_1445);
    float _1613 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1615 = _1603 + _1613;
    float _1617 = float(_1595);
    float _1619 = -_1567;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1371);
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1625 = _1609 + _1623;
    float _1627 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1629 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1497);
    float _1631 = _1617 * _1611;
    float _1633 = _861 + _442;
    float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1637 = _1621 + _1635;
    float _1639 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1627);
    float _1641 = fma(_1473, _1311, _1629);
    float _1643 = _1633 + (-1.0);
    float _1645 = _1631 * (-2.0);
    float _1647 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1639);
    float _1649 = _861 + (-0.5);
    float _1651 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1653 = fma(_1645, _1355, _1355);
    float _1655 = _1513 * 0.15915493667125701904296875;
    bool _1657 = _1647 >= 0.0;
    float _1659 = fma(_1651, _1645, _1651);
    float _1661 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1653);
    float _1663 = _1641 * 0.15915493667125701904296875;
    float _1665 = _1655 * 6.283185482025146484375;
    float _1667 = sin(_1665);
    float _1669 = fma(_1659, _1311, _1661);
    float _1671 = _1669 * 0.15915493667125701904296875;
    float _1673 = _1655 * 6.283185482025146484375;
    float _1675 = cos(_1673);
    float _1677 = _1653;
    float _1679 = _1637;
    if (_1657)
    {
        _1677 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1681 = _1677;
    int _1683 = as_type<int>(_1681);
    if (_1657)
    {
        out.m_51.x = 0.0;
    }
    if (_1657)
    {
        float _1685 = _1681 * 5.0;
        _1683 = as_type<int>(_1685);
    }
    int _1687 = _1683;
    float _1689 = sqrt(_1593);
    if (_1657)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6005 = as_type<float>(_1687);
        out.gl_Position.z = _6005;
    }
    float _1691 = _1663 * 6.283185482025146484375;
    float _1693 = sin(_1691);
    float _1695 = _1663 * 6.283185482025146484375;
    float _1697 = cos(_1695);
    float _1699 = _1671 * 6.283185482025146484375;
    float _1701 = sin(_1699);
    if (_1657)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1703 = _1671 * 6.283185482025146484375;
    float _1705 = cos(_1703);
    float _1707 = _1667 * _1693;
    float _1709 = _1675 * _1697;
    float _1711 = _1489 * _1689;
    float _1713 = _1667 * _1697;
    float _1715 = _1183 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1717 = fma(_1701, _1709, _1707);
    float _1719 = fma(_1701, _1707, _1709);
    float _1721 = _1675 * _1693;
    float _1723 = in.m_77.x;
    float _1725 = in.m_77.y;
    float _1727 = in.m_77.z;
    float _1729 = _310 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1731 = _1711 * _1729;
    float _1733 = _1675 * _1705;
    float _1735 = _1697 * _1705;
    float _1737 = _1667 * _1705;
    float _1739 = _1693 * _1705;
    float _1741 = -_1331;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1745 = -_1275;
    float _1747 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1749 = fma(_1181, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1715);
    float _1751 = -_1721;
    float _1753 = fma(_1701, _1713, _1751);
    float _1755 = _1743 * _1743;
    float _1757 = -_1713;
    float _1759 = fma(_1701, _1721, _1757);
    float _1761 = -_1371;
    float _1763 = _1761 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1765 = fma(_1185, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1749);
    float _1767 = fma(_1747, _1747, _1755);
    float _1769 = _304 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1771 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1773 = fma(_1763, _1763, _1767);
    float _1775 = _1765 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1777 = _1711 * _1769;
    float _1779 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1725);
    float _1781 = rsqrt(_1773);
    float _1783 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1771);
    float _1785 = -_1775;
    float _1787 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1789 = _1779 * _1731;
    float _1791 = _312 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1793 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1723);
    float _1795 = fma(_1787, _1787, _1755);
    float _1797 = _1711 * _1791;
    float _1799 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1801 = _1793 * _1777;
    float _1803 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1783);
    float _1805 = fma(_1763, _1763, _1795);
    float _1807 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1799);
    float _1809 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1727);
    float _1811 = _1743 * _1781;
    float _1813 = _1763 * _1781;
    float _1815 = _1747 * _1781;
    float _1817 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1807);
    float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1821 = _1811 * _1819;
    float _1823 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1825 = _1813 * _1823;
    float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1829 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1827;
    float _1831 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1835 = -_1821;
    float _1837 = fma(_1813, _1833, _1835);
    float _1839 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1841 = _1815 * _1839;
    float _1843 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1845 = -_1825;
    float _1847 = fma(_1815, _1843, _1845);
    float _1849 = _1817 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1851 = _1837 * _1837;
    float _1853 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1855 = -_1841;
    float _1857 = fma(_1811, _1853, _1855);
    float _1859 = -_1849;
    float _1861 = _1831 + _1859;
    float _1863 = fma(_1847, _1847, _1851);
    float _1865 = sqrt(_1805);
    float _1867 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1869 = _1809 * _1797;
    float _1871 = fma(_1857, _1857, _1863);
    float _1873 = abs(_1861);
    float _1875 = precise::max(_1873, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1877 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1867);
    float _1879 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1881 = 1.0 / _1829;
    float _1883 = precise::min(_1875, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    bool _1885 = _1849 >= _1831;
    bool _1887 = isnan(_1849);
    bool _1889 = _1885 || _1887;
    bool _1891 = isnan(_1831);
    bool _1893 = _1889 || _1891;
    float _1895 = -_1789;
    float _1897 = _1701 * _1895;
    float _1899 = _1733 * _1789;
    float _1901 = _1737 * _1789;
    float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1905 = _1883 + _1903;
    float _1907 = rsqrt(_1871);
    float _1909 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1877);
    float _1911 = fma(_1735, _1801, _1897);
    float _1913 = fma(_1717, _1801, _1899);
    float _1915 = fma(_1753, _1801, _1901);
    float _1917 = abs(_1865);
    float _1919 = precise::max(0.0, _1917);
    bool _1921 = !_1893;
    float _1923 = _1921 ? 1.0 : (-1.0);
    float _1925 = _1905 * _1881;
    float _1927 = precise::min(_1919, 40.0);
    float _1929 = _172 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1931 = rsqrt(_1909);
    float _1933 = _1923 * _1925;
    float _1935 = fma(_1739, _1869, _1911);
    float _1937 = fma(_1927, -0.02500000037252902984619140625, 1.0);
    float _1939 = fma(_1759, _1869, _1913);
    float _1941 = _1857 * _1907;
    float _1943 = _1929 * _1933;
    float _1945 = _1847 * _1907;
    float _1947 = _1837 * _1907;
    float _1949 = _1811 * _1941;
    float _1951 = fma(_1719, _1869, _1915);
    float _1953 = _1815 * _1945;
    float _1955 = _1813 * _1947;
    float _1957 = -_1949;
    float _1959 = fma(_1813, _1945, _1957);
    float _1961 = -_1953;
    float _1963 = fma(_1811, _1947, _1961);
    float _1965 = -_1955;
    float _1967 = fma(_1815, _1941, _1965);
    float _1969 = _1959 * _1939;
    float _1971 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1973 = _1963 * _1939;
    float _1975 = _1967 * _1939;
    float _1977 = fma(_1947, _1935, _1969);
    float _1979 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1981 = _1971 * _1971;
    float _1983 = fma(_1945, _1935, _1975);
    float _1985 = fma(_1815, _1951, _1977);
    float _1987 = fma(_1941, _1935, _1973);
    float _1989 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1991 = fma(_1811, _1951, _1983);
    float _1993 = _1275 + _1985;
    float _1995 = _1943 * 0.15915493667125701904296875;
    float _1997 = fma(_1979, _1979, _1981);
    float _1999 = _1331 + _1991;
    float _2001 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2003 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2005 = fma(_1813, _1951, _1987);
    float _2007 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2009 = fma(_1989, _1989, _1997);
    float _2011 = fma(_1999, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2001);
    float _2013 = fma(_1999, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2003);
    float _2015 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1879);
    float _2017 = _1371 + _2005;
    float _2019 = fma(_1999, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2007);
    float _2021 = rsqrt(_2009);
    float _2023 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2015);
    float _2025 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2013);
    float _2027 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2019);
    float _2029 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2011);
    float _2031 = _2023 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2033 = _2025 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2035 = _2027 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2037 = _1995 * 6.283185482025146484375;
    float _2039 = cos(_2037);
    float _2041 = _2029 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2043 = -_2033;
    float _2045 = _2043 + _2031;
    float _2047 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2049 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2051 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2053 = fma(_1937, _2045, _2033);
    float _2055 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2047);
    float _2057 = _1995 * 6.283185482025146484375;
    float _2059 = sin(_2057);
    float _2061 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2049);
    float _2063 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2051);
    float _2065 = _1989 * _2021;
    float _2067 = _1979 * _2021;
    float _2069 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2061);
    float _2071 = _1971 * _2021;
    float _2073 = _2065 * _2065;
    float _2075 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2055);
    float _2077 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2063);
    float _2079 = -_2039;
    float _2081 = _2079 + 1.0;
    float _2083 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2085 = _2075 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2087 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2089 = _2087 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2091 = _2071 * _2081;
    float _2093 = _2067 * _2059;
    float _2095 = _2071 * _2059;
    float _2097 = _2065 * _2059;
    float _2099 = fma(_2081, _2073, _2039);
    float _2101 = _2067 * _2081;
    float _2103 = fma(_2065, _2091, _2093);
    float _2105 = -_1775;
    float _2107 = _2105 + _2083;
    float _2109 = -_1331;
    float _2111 = _2109 + _2085;
    float _2113 = -_2097;
    float _2115 = fma(_2071, _2101, _2113);
    float _2117 = -_2095;
    float _2119 = fma(_2065, _2101, _2117);
    float _2121 = _2103 * _2107;
    float _2123 = _2077 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2125 = fma(_2067, _2101, _2039);
    float _2127 = _2115 * _2107;
    float _2129 = fma(_2119, _2111, _2121);
    float _2131 = -_1371;
    float _2133 = _2131 + _2123;
    float _2135 = fma(_172, _2089, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2137 = fma(_2125, _2111, _2127);
    float _2139 = fma(_2065, _2101, _2095);
    float _2141 = fma(_2099, _2133, _2129);
    float _2143 = -_2093;
    float _2145 = fma(_2065, _2091, _2143);
    float _2147 = fma(_2139, _2133, _2137);
    float _2149 = fma(_2141, _2135, _1371);
    float _2151 = fma(_2147, _2135, _1331);
    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2155 = _2149 + _2153;
    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2159 = _2151 + _2157;
    float _2161 = _2155 * _2155;
    float _2163 = fma(_2159, _2159, _2161);
    float _2165 = sqrt(_2163);
    bool _2167 = _2165 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2171 = _2165 + _2169;
    float _2173 = _2121;
    float _2175 = _2163;
    float _2177 = _2039;
    float _2179 = _1775;
    float _2181 = _2151;
    float _2183 = _2149;
    if (_2167)
    {
        float _2185 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2173 = _2185;
    }
    float _2187 = _2173;
    if (_2167)
    {
        float _2189 = rsqrt(_2163);
        _2175 = _2189;
    }
    float _2191 = _2175;
    float _2193 = _2187;
    if (_2167)
    {
        float _2195 = _2171 * _2187;
        _2193 = _2195;
    }
    float _2197 = _2193;
    float _2199 = fma(_2071, _2091, _2039);
    float _2201 = fma(_2071, _2101, _2097);
    if (_2167)
    {
        float _2203 = _2197 * 0.15915493667125701904296875;
        _2177 = _2203;
    }
    float _2205 = _2177;
    float _2207 = _2199 * _2107;
    float _2209 = _2097;
    if (_2167)
    {
        float _2211 = _2205 * 6.283185482025146484375;
        float _2213 = sin(_2211);
        _2209 = _2213;
    }
    float _2215 = _2209;
    float _2217 = fma(_2201, _2111, _2207);
    float _2219 = fma(_2145, _2133, _2217);
    float _2221 = _1775 + _2219;
    float _2223 = _2221;
    if (_2167)
    {
        float _2225 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2179 = _2225;
    }
    float _2227 = _2179;
    float _2229 = _2227;
    if (_2167)
    {
        float _2231 = fma(_2215, _2227, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2229 = _2231;
    }
    float _2233 = _2229;
    float _2235 = _2233;
    if (_2167)
    {
        float _2237 = _2191 * _2233;
        _2235 = _2237;
    }
    float _2239 = _2235;
    if (_2167)
    {
        float _2241 = fma(_2159, _2239, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _2181 = _2241;
    }
    float _2243 = _2181;
    float _2245 = _2243;
    if (_2167)
    {
        float _2247 = fma(_2155, _2239, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2183 = _2247;
    }
    float _2249 = _2183;
    float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2253 = _2243 + _2251;
    float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2257 = _2249 + _2255;
    float _2259 = fma(_2253, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2261 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6967 = float2(_2259, _2261);
    float _2263 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6967, float2(0.0), isnan(_6967)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6967, float2(0.0), isnan(_6967)), level(0.0)).x;
    float _2265 = _2205;
    float _2267 = _2253;
    float _2269 = _2249;
    if (_2167)
    {
        float _2271 = _2205 * 6.283185482025146484375;
        float _2273 = cos(_2271);
        _2265 = _2273;
    }
    float _2275 = _2265;
    float _2277 = -_1371;
    float _2279 = _2277 + _2249;
    if (_2167)
    {
        float _2281 = _2275 + (-1.0);
        _2267 = _2281;
    }
    float _2283 = _2267;
    float _2285 = _2283;
    if (_2167)
    {
        float _2287 = _2283 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2285 = _2287;
    }
    float _2289 = _2285;
    if (_2167)
    {
        float _2291 = fma(_2221, _2275, _2289);
        _2223 = _2291;
    }
    float _2293 = _2223;
    float _2295 = -_1331;
    float _2297 = _2295 + _2243;
    float _2299 = fma(_2263, 100.0, _1275);
    float _2301 = -_1275;
    float _2303 = _2301 + _2293;
    float _2305 = fma(_2263, 100.0, _2293);
    float _2307 = -_1529;
    float _2309 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2299);
    float _2311 = _2303 * _2303;
    float _2313 = _2309 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2315 = fma(_2297, _2297, _2311);
    float _2317 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2313);
    float _2319 = fma(_2279, _2279, _2315);
    float _2321 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2317);
    float _2323 = sqrt(_2319);
    float _2325 = _2321 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2327 = _2309 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2329 = 1.0 / _2325;
    float _2331 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2327);
    float _2333 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2331);
    bool _2335 = _2323 > 0.0;
    float _2337 = _2333 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2339 = _2337 + _2325;
    float _2341 = _2339 * _2329;
    float _2343 = _2341 * 0.5;
    bool _2345 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2347 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2349 = _2345 || _2347;
    bool _2351 = isnan(0.5);
    bool _2353 = _2349 || _2351;
    float _2355 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2357 = fma(_2343, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2355);
    bool _2359 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2361 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan(0.5);
    bool _2367 = _2363 || _2365;
    float _2369 = 1.0 / _2357;
    bool _2371 = !_2335;
    float _2373 = _2305;
    float _2375 = _2303;
    if (!_2371)
    {
        float _2377 = _188 * _188;
        float _2379 = rsqrt(_2319);
        float _2381 = fma(_186, _186, _2377);
        float _2383 = fma(_190, _190, _2381);
        float _2385 = sqrt(_2383);
        float _2387 = _2303 * _2379;
        float _2389 = _2279 * _2379;
        bool _2391 = _2385 > 0.0;
        float _2393 = _2297 * _2379;
        bool _2395 = !_2391;
        if (!_2395)
        {
            float _2397 = rsqrt(_2383);
            float _2399 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2401 = _188 * _2397;
            float _2403 = _186 * _2397;
            float _2405 = _2387 * _2401;
            float _2407 = _190 * _2397;
            float _2409 = fma(_2393, _2403, _2405);
            float _2411 = _2399 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2413 = fma(_2389, _2407, _2409);
            float _2415 = _2413 * _2411;
            float _2417 = fma(_186, _2415, _2243);
            float _2419 = fma(_188, _2415, _2305);
            float _2421 = fma(_190, _2415, _2249);
            _2245 = _2417;
            _2373 = _2419;
            _2269 = _2421;
            _2375 = _2407;
        }
    }
    float _2423 = _2245;
    float _2425 = _2373;
    float _2427 = _2269;
    float _2429 = _2375;
    float _2431 = -_1535;
    float _2433 = fma(_2431, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2423);
    float _2435 = -_1529;
    float _2437 = fma(_2435, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2425);
    float _2439 = -_1567;
    float _2441 = fma(_2439, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2427);
    float _2443 = _2437;
    float _2445 = _2441;
    float _2447 = _2429;
    if (_2367)
    {
        _1597 = 1.0;
    }
    float _2449 = _1597;
    float _2451 = _2449;
    if (_2353)
    {
        _1599 = _2433;
    }
    float _2453 = _1599;
    float _2455 = _2453;
    if (!_2353)
    {
        float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2459 = _2309 + _2457;
        float _2461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2463 = -_1371;
        float _2465 = _2463 + _2427;
        float _2467 = -_2299;
        float _2469 = _2467 + _2425;
        float _2471 = _2459 * _2459;
        float _2473 = -_1331;
        float _2475 = _2473 + _2423;
        float _2477 = fma(_1625, _1625, _2471);
        float _2479 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2481 = fma(_1637, _1637, _2477);
        float _2483 = 1.0 / _1711;
        float _2485 = sqrt(_2481);
        float _2487 = _2479 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2489 = precise::min(_2485, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2491 = _2489 * _2461;
        float _2493 = _2491 * _2483;
        float _2495 = _2487 * _2493;
        float _2497 = _2465 * _2493;
        float _2499 = fma(_2469, _2495, _2309);
        float _2501 = fma(_2475, _2495, _1609);
        float _2503 = fma(_2487, _2497, _1621);
        _194 = _2461;
        _2443 = _2499;
        _2455 = _2501;
        _2445 = _2503;
        _2447 = _2471;
    }
    float _2505 = _194;
    float _2507 = _2443;
    float _2509 = _2455;
    float _2511 = _2445;
    float _2513 = _2447;
    float _2515 = _2505;
    float _2517 = _2513;
    if (_2367)
    {
        _1679 = 1.0;
    }
    float _2519 = _1679;
    float _2521 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2523 = _2369 * _2521;
    float _2525 = _2519;
    if (!_2367)
    {
        float _2527 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2529 = _2527 * 0.15915493667125701904296875;
        float _2531 = _2529 * 6.283185482025146484375;
        float _2533 = cos(_2531);
        float _2535 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2537 = _2535 * 0.15915493667125701904296875;
        float _2539 = _2529 * 6.283185482025146484375;
        float _2541 = sin(_2539);
        float _2543 = 1.0 / _2533;
        float _2545 = _2537 * 6.283185482025146484375;
        float _2547 = cos(_2545);
        float _2549 = _2541 * _2543;
        float _2551 = _2537 * 6.283185482025146484375;
        float _2553 = sin(_2551);
        float _2555 = _2547 * _2549;
        float _2557 = 1.0 / _2555;
        float _2559 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2561 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2559;
        float _2563 = 1.0 / _2561;
        float _2565 = _2553 * _2557;
        float _2567 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2569 = fma(_2523, _2565, _2567);
        float _2571 = _2569 * _2563;
        float _2573 = precise::clamp(_2571, 0.0, 1.0);
        _2515 = _2537;
        _2517 = _2563;
        _2451 = _2573;
    }
    float _2575 = _2515;
    float _2577 = _2517;
    float _2579 = _2451;
    float _2581 = _2577;
    float _2583 = _2575;
    if (!_2367)
    {
        float _2585 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2587 = _2585 * 0.15915493667125701904296875;
        float _2589 = _2587 * 6.283185482025146484375;
        float _2591 = cos(_2589);
        float _2593 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2595 = _2593 * 0.15915493667125701904296875;
        float _2597 = _2587 * 6.283185482025146484375;
        float _2599 = sin(_2597);
        float _2601 = 1.0 / _2591;
        float _2603 = _2595 * 6.283185482025146484375;
        float _2605 = cos(_2603);
        float _2607 = _2599 * _2601;
        float _2609 = _2595 * 6.283185482025146484375;
        float _2611 = sin(_2609);
        float _2613 = _2605 * _2607;
        float _2615 = 1.0 / _2613;
        float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2619 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2617;
        float _2621 = 1.0 / _2619;
        float _2623 = _2611 * _2615;
        float _2625 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2627 = fma(_2523, _2623, _2625);
        float _2629 = _2627 * _2621;
        float _2631 = precise::clamp(_2629, 0.0, 1.0);
        float _2633 = -_2631;
        float _2635 = _2633 + 1.0;
        _2581 = _2613;
        _2583 = _2591;
        _2525 = _2635;
    }
    float _2637 = _2581;
    float _2639 = _2583;
    float _2641 = _2525;
    float _2643 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2645 = _2507 + _2643;
    float _2647 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2649 = _2509 + _2647;
    float _2651 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2653 = _2511 + _2651;
    float _2655 = _2645 * _2645;
    float _2657 = fma(_2649, _2649, _2655);
    float _2659 = fma(_1609, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2661 = fma(_2653, _2653, _2657);
    float _2663 = rsqrt(_2661);
    float _2665 = sqrt(_2661);
    float _2667 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2669 = _2649 * _2667;
    float _2671 = _2653 * _2667;
    float _2673 = _2669 * _2669;
    float _2675 = _2671 * _2671;
    float _2677 = _2673 + _2675;
    float _2679 = sqrt(_2677);
    bool _2681 = _2679 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2683 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2685 = _2679 + _2683;
    float _2687 = _2653;
    float _2689 = _2677;
    float _2691 = _2685;
    float _2693 = _2637;
    float _2695 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2697 = _2667;
    if (_2681)
    {
        float _2699 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2687 = _2699;
    }
    float _2701 = _2687;
    if (_2681)
    {
        float _2703 = rsqrt(_2677);
        _2689 = _2703;
    }
    float _2705 = _2689;
    float _2707 = _2705;
    if (_2681)
    {
        float _2709 = _2685 * _2701;
        _2691 = _2709;
    }
    float _2711 = _2691;
    if (_2681)
    {
        float _2713 = _2711 * 0.15915493667125701904296875;
        _2693 = _2713;
    }
    float _2715 = _2693;
    float _2717 = _2701;
    float _2719 = _2715;
    if (_2681)
    {
        float _2721 = _2715 * 6.283185482025146484375;
        float _2723 = sin(_2721);
        _2717 = _2723;
    }
    float _2725 = _2717;
    float _2727 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2729 = precise::max(0.0, _2727);
    float _2731 = _2639;
    float _2733 = _2729;
    if (_2681)
    {
        float _2735 = _2715 * 6.283185482025146484375;
        float _2737 = cos(_2735);
        _2731 = _2737;
    }
    float _2739 = _2731;
    float _2741 = -_2667;
    float _2743 = -_2729;
    float _2745 = fma(_2645, _2741, _2743);
    float _2747 = _2745;
    if (_2681)
    {
        float _2749 = _2745 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2733 = _2749;
    }
    float _2751 = _2733;
    float _2753 = _2751;
    if (!_2681)
    {
        _2719 = _2669;
    }
    float _2755 = _2719;
    float _2757 = _2725;
    float _2759 = _2755;
    if (_2681)
    {
        float _2761 = fma(_2725, _2751, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2757 = _2761;
    }
    float _2763 = _2757;
    float _2765 = _2763;
    float _2767 = _2739;
    if (_2681)
    {
        float _2769 = _2739 + (-1.0);
        _2753 = _2769;
    }
    float _2771 = _2753;
    if (_2681)
    {
        float _2773 = _2705 * _2763;
        _2695 = _2773;
    }
    float _2775 = _2695;
    if (!_2681)
    {
        _2765 = _2671;
    }
    float _2777 = _2765;
    float _2779 = _2777;
    if (_2681)
    {
        float _2781 = _2771 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2697 = _2781;
    }
    float _2783 = _2697;
    if (_2681)
    {
        float _2785 = _2669 * _2775;
        _2759 = _2785;
    }
    float _2787 = _2759;
    if (!_2681)
    {
        _2707 = _2673;
    }
    float _2789 = _2707;
    float _2791 = _2789;
    if (_2681)
    {
        float _2793 = _2671 * _2775;
        _2779 = _2793;
    }
    float _2795 = _2779;
    if (_2681)
    {
        float _2797 = fma(_2745, _2739, _2783);
        _2747 = _2797;
    }
    float _2799 = _2747;
    if (_2681)
    {
        float _2801 = _2787 * _2787;
        _2791 = _2801;
    }
    float _2803 = _2791;
    if (!_2681)
    {
        _2767 = _2675;
    }
    float _2805 = _2767;
    float _2807 = _2805;
    if (_2681)
    {
        float _2809 = _2795 * _2795;
        _2807 = _2809;
    }
    float _2811 = _2807;
    float _2813 = fma(_2799, _2799, _2803);
    float _2815 = _2507 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2817 = _2507 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2819 = _2813 + _2811;
    float _2821 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2815);
    float _2823 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2825 = fma(_2665, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2823);
    float _2827 = precise::clamp(_2825, 0.0, 1.0);
    float _2829 = rsqrt(_2819);
    float _2831 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2821);
    float _2833 = -_2827;
    float _2835 = _2833 + 1.0;
    float _2837 = fma(_1621, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2839 = _2831 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2841 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2843 = _2507 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2845 = abs(_2835);
    float _2847 = log2(_2845);
    float _2849 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2851 = _2507 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2853 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2817);
    float _2855 = -_2849;
    float _2857 = fma(_2855, _2841, 1.0);
    float _2859 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2843);
    float _2861 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2853);
    float _2863 = _2829 * _2795;
    float _2865 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2851);
    float _2867 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2859);
    float _2869 = _2829 * _2787;
    float _2871 = _2829 * _2799;
    float _2873 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2865);
    float _2875 = _2867 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2877 = floor(_2659);
    float _2879 = _2869 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2881 = _2873 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2883 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2885 = _2847 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2887 = -_2879;
    float _2889 = fma(_2871, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2887);
    float _2891 = _2861 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2893 = fma(_2881, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2883);
    float _2895 = floor(_2837);
    float _2897 = -_2863;
    float _2899 = fma(_2897, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2889);
    float _2901 = fma(_2839, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2893);
    float _2903 = fma(_2899, -0.5, 0.5);
    float _2905 = fma(_2899, 0.5, 0.5);
    float _2907 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2901);
    float _2909 = exp2(_2885);
    float _2911 = -_2877;
    float _2913 = _2659 + _2911;
    float _2915 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2917 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2919 = fma(_2881, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2917);
    float _2921 = log2(_2857);
    float _2923 = -_2895;
    float _2925 = _2837 + _2923;
    float _2927 = fma(_2881, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2915);
    float _2929 = _2871 + 1.0;
    float _2931 = fma(_2839, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2919);
    float _2933 = fma(_2905, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2935 = fma(_2839, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2927);
    float _2937 = 1.0 / _2907;
    float _2939 = -_2871;
    float _2941 = fma(_2909, _2929, _2939);
    float _2943 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2935);
    float _2945 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2931);
    float _2947 = fma(_2905, _2933, -0.212114393711090087890625);
    float _2949 = sqrt(_2903);
    float _2951 = _2921 * 0.693147182464599609375;
    float2 _8037 = float2(_2913, _2925);
    float _2953 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8037, float2(0.0), isnan(_8037)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8037, float2(0.0), isnan(_8037)), level(0.0)).x;
    float _2955 = fma(_2905, _2947, 1.570728778839111328125);
    float _2957 = _2951 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2959 = _2943 * _2937;
    float _2961 = _2945 * _2937;
    float _2963 = fma(_2959, 0.5, 0.5);
    float _2965 = fma(_2961, -0.5, 0.5);
    float _2967 = _2949 * 0.636619746685028076171875;
    float3 _8067 = float3(_2963, _2965, _2957);
    float _2969 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8067, float3(0.0), isnan(_8067)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8067, float3(0.0), isnan(_8067)), level(0.0)).x;
    float _2971 = -_2955;
    float _2973 = fma(_2967, _2971, 1.0);
    float _2975 = fma(_2941, 0.5, 0.5);
    float3 _8085 = float3(_2963, _2965, _2957);
    float4 _2978 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8085, float3(0.0), isnan(_8085)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8085, float3(0.0), isnan(_8085)), level(0.0)).xyzw;
    float _2980 = _2978.x;
    float _2982 = _2978.y;
    float _2984 = _2978.z;
    float _2986 = _2978.w;
    float2 _8101 = float2(_2973, _2975);
    float3 _2990 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8101, float2(0.0), isnan(_8101)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8101, float2(0.0), isnan(_8101)), level(0.0)).xyz;
    float _2992 = _2990.x;
    float _2994 = _2990.y;
    float _2996 = _2990.z;
    float _2998 = in.m_79.x;
    float _3000 = in.m_79.y;
    float _3002 = in.m_79.z;
    bool _3004 = _1725 != 0.0;
    bool _3006 = isnan(_1725);
    bool _3008 = _3004 || _3006;
    bool _3010 = isnan(0.0);
    bool _3012 = _3008 || _3010;
    float _3014 = _2847 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3016 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_61.x = _406;
    out.m_61.y = _408;
    out.m_61.z = _410;
    out.m_61.w = _412;
    bool _3018 = _1723 == 0.0;
    bool _3020 = !_3012;
    bool _3022 = _3018 && _3020;
    float _3024 = _1733 * _1967;
    float _3026 = fma(_2881, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3016);
    float _3028 = _1733 * _1963;
    bool _3030 = _1727 == 0.0;
    bool _3032 = _3030 && _3022;
    float _3034 = exp2(_3014);
    out.m_75.x = _1575;
    out.m_75.y = _1577;
    out.m_75.z = _1581;
    out.m_75.w = _1583;
    float _3036 = in.m_69.x;
    float _3038 = -_1701;
    float _3040 = fma(_3038, _1945, _3024);
    float _3042 = -_1701;
    float _3044 = fma(_3042, _1941, _3028);
    float _3046 = fma(_1737, _1811, _3040);
    float _3048 = _3000;
    float _3050 = _3002;
    float _3052 = _2998;
    if (!_3032)
    {
        float _3054 = fma(_1725, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3000);
        _3048 = _3054;
    }
    float _3056 = _3048;
    if (!_3032)
    {
        float _3058 = fma(_1727, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3002);
        _3050 = _3058;
    }
    float _3060 = _3050;
    float _3062 = _1733 * _1959;
    float _3064 = _1717 * _1967;
    if (!_3032)
    {
        float _3066 = fma(_1723, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2998);
        _3052 = _3066;
    }
    float _3068 = _3052;
    float _3070 = _1717 * _1959;
    float _3072 = -_1701;
    float _3074 = fma(_3072, _1947, _3062);
    float _3076 = fma(_1735, _1945, _3064);
    float _3078 = _1717 * _1963;
    float _3080 = _1759 * _1967;
    float _3082 = fma(_1737, _1815, _3074);
    float _3084 = fma(_1753, _1811, _3076);
    float _3086 = fma(_1735, _1947, _3070);
    float _3088 = abs(_2523);
    float _3090 = log2(_3088);
    float _3092 = fma(_1735, _1941, _3078);
    float _3094 = fma(_1737, _1813, _3044);
    float _3096 = fma(_1739, _1945, _3080);
    float _3098 = _3046 * _3056;
    float _3100 = fma(_1753, _1815, _3086);
    float _3102 = fma(_1753, _1813, _3092);
    float _3104 = _3082 * _3056;
    float _3106 = _3094 * _3056;
    float _3108 = fma(_1719, _1811, _3096);
    float _3110 = fma(_3084, _3068, _3098);
    float _3112 = fma(_3100, _3068, _3104);
    float _3114 = fma(_3102, _3068, _3106);
    float _3116 = fma(_3108, _3060, _3110);
    float _3118 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _3120 = _2523 <= 8000.0;
    bool _3122 = isnan(_2523);
    bool _3124 = _3120 || _3122;
    bool _3126 = isnan(8000.0);
    bool _3128 = _3124 || _3126;
    float _3130 = float(_3128);
    float _3132 = _2907 * 0.5;
    float _3134 = -_3034;
    float _3136 = _3134 + 1.0;
    float _3138 = _1759 * _1959;
    float _3140 = _1759 * _1963;
    float _3142 = exp2(_3118);
    float _3144 = fma(_1739, _1947, _3138);
    float _3146 = fma(_1739, _1941, _3140);
    bool _3148 = _2665 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3150 = isnan(_2665);
    bool _3152 = _3148 || _3150;
    bool _3154 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3156 = _3152 || _3154;
    float _3158 = fma(_1719, _1815, _3144);
    float _3160 = fma(_1719, _1813, _3146);
    float _3162 = fma(_2839, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3026);
    float _3164 = fma(_3158, _3060, _3112);
    float _3166 = fma(_3160, _3060, _3114);
    float _3168 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3162);
    float _3170 = fma(_3142, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3172 = precise::clamp(_3170, 0.0, 1.0);
    out.gl_Position.x = _2943;
    out.gl_Position.y = _2945;
    out.gl_Position.z = _3168;
    out.gl_Position.w = _2907;
    float _3174 = _2943 + _2907;
    float _3176 = fma(_3172, -2.0, 3.0);
    float _3178 = _3172 * _3172;
    out.m_81.x = _3116;
    out.m_81.y = _3164;
    out.m_81.z = _3166;
    float _3180 = _3174 * 0.5;
    float _3182 = _3178 * _3176;
    float _3184 = -_3182;
    float _3186 = _3184 + 1.0;
    float _3188 = fma(_3186, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3182);
    float _3190 = fma(_2945, -0.5, _3132);
    float _3192 = _3136 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3194 = _3168 + _2907;
    float _3196 = _3130 * _3188;
    float _3198 = _3194 * 0.5;
    float _3200 = _3196 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = _3180;
    out.m_83.y = _3190;
    out.m_83.z = _3198;
    out.m_83.w = _2907;
    float _3202 = _2579 * _2641;
    float _3204 = _2907;
    float _3206 = _3198;
    float _3208 = _3190;
    float _3210 = _3202;
    if (!_3156)
    {
        _3204 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3212 = _3204;
    float _3214 = _3212;
    float _3216 = _3212;
    if (!_3156)
    {
        _3206 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3218 = _3206;
    float _3220 = _3218;
    float _3222 = _3218;
    if (!_3156)
    {
        _3208 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3224 = _3208;
    float _3226 = -_2953;
    float _3228 = _3226 + 1.0;
    float _3230 = _3228 * _3200;
    float _3232 = precise::clamp(_3230, 0.0, 1.0);
    float _3234 = -_3232;
    float _3236 = fma(_3234, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3238 = _3236 * _3036;
    float _3240 = _3192 * _2969;
    float _3242 = -_3192;
    float _3244 = _3242 + 1.0;
    float _3246 = _3238 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3248 = _3238;
    float _3250 = _3244;
    float _3252 = _3224;
    float _3254 = _3224;
    if (!_3156)
    {
        _3248 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3256 = _3248;
    float _3258 = _2986 * _3240;
    float _3260 = _2986 * _3244;
    out.m_85.x = _3246;
    float _3262 = _3256;
    float _3264 = _3256;
    if (!_3156)
    {
        _3250 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3266 = _3250;
    float _3268 = _2996 * _3240;
    float _3270 = fma(_2992, _3258, _2980);
    float _3272 = fma(_2994, _3258, _2982);
    float _3274 = _3202 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3276 = fma(_2986, _3268, _2984);
    float _3278 = _3266;
    float _3280 = _3266;
    if (!_3156)
    {
        _3210 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3282 = _3210;
    out.m_87.x = _3270;
    out.m_87.y = _3272;
    out.m_87.z = _3276;
    out.m_87.w = _3260;
    bool _3284 = !_3156;
    float _3286 = _3282;
    float _3288 = _3282;
    if (!_3284)
    {
        bool _3290 = _2665 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3292 = isnan(_2665);
        bool _3294 = _3290 || _3292;
        bool _3296 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3298 = _3294 || _3296;
        if (!_3298)
        {
            float _3300 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3302 = _2665 + _3300;
            float _3304 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3306 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3304;
            float _3308 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3310 = _3308 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3312 = 1.0 / _3306;
            float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3316 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3320 = _3318 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3322 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3324 = _3322 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3326 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3328 = _3326 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3330 = _3302 * _3312;
            float _3332 = precise::clamp(_3330, 0.0, 1.0);
            float _3334 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3336 = _3334 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3338 = fma(_3332, _3310, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3340 = fma(_3332, _3336, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3342 = fma(_3332, _3316, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3344 = fma(_3332, _3320, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3346 = fma(_3332, _3324, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3348 = fma(_3332, _3328, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3280 = _3342;
            _3254 = _3346;
            _3264 = _3338;
            _3222 = _3344;
            _3216 = _3340;
            _3288 = _3348;
            _3350 = true;
        }
        else
        {
            bool _3352 = _2665 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3354 = isnan(_2665);
            bool _3356 = _3352 || _3354;
            bool _3358 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3360 = _3356 || _3358;
            if (!_3360)
            {
                _3262 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3362 = _3262;
            _3264 = _3362;
            if (!_3360)
            {
                _3278 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3364 = _3278;
            _3280 = _3364;
            if (!_3360)
            {
                _3214 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3366 = _3214;
            _3216 = _3366;
            if (!_3360)
            {
                _3220 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3368 = _3220;
            _3222 = _3368;
            if (!_3360)
            {
                _3252 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3370 = _3252;
            _3254 = _3370;
            if (!_3360)
            {
                _3286 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3372 = _3286;
            bool _3374 = !_3360;
            _3288 = _3372;
            if (!_3374)
            {
                bool _3376 = _2665 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3378 = isnan(_2665);
                bool _3380 = _3376 || _3378;
                bool _3382 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3384 = _3380 || _3382;
                if (!_3384)
                {
                    float _3386 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3388 = _2665 + _3386;
                    float _3390 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3392 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3390;
                    float _3394 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3396 = _3394 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3398 = 1.0 / _3392;
                    float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3402 = _3400 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3404 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3406 = _3404 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3408 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3410 = _3408 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3412 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3414 = _3412 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3416 = _3388 * _3398;
                    float _3418 = precise::clamp(_3416, 0.0, 1.0);
                    float _3420 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3422 = _3420 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3424 = fma(_3418, _3396, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3426 = fma(_3418, _3422, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3428 = fma(_3418, _3402, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3430 = fma(_3418, _3406, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3432 = fma(_3418, _3410, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3434 = fma(_3418, _3414, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3280 = _3428;
                    _3254 = _3432;
                    _3264 = _3424;
                    _3222 = _3430;
                    _3216 = _3426;
                    _3288 = _3434;
                    _3350 = true;
                }
                else
                {
                    _3280 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3254 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3264 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3222 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3216 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3288 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3350 = false;
    float _3436 = _3280;
    float _3438 = _3254;
    float _3440 = _3264;
    float _3442 = _3222;
    float _3444 = _3216;
    float _3446 = _3288;
    float _3448 = fma(_3164, -0.5, 0.5);
    float _3450 = precise::clamp(_3448, 0.0, 1.0);
    float _3452 = -_3436;
    float _3454 = _3452 + _3438;
    float _3456 = _3274 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3458 = -_3440;
    float _3460 = _3458 + _3442;
    float _3462 = fma(_3450, _3454, _3436);
    out.m_89.x = 0.0;
    float _3464 = -_3444;
    float _3466 = _3464 + _3446;
    float _3468 = fma(_3450, _3460, _3440);
    float _3470 = _3462 * 0.586610972881317138671875;
    out.m_51.x = _3456;
    bool _3472 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3474 = fma(_3450, _3466, _3444);
    float _3476 = fma(_3468, 0.298911988735198974609375, _3470);
    bool _3478 = _2579 > 0.0;
    bool _3480 = isnan(_2579);
    bool _3482 = _3478 || _3480;
    bool _3484 = isnan(0.0);
    bool _3486 = _3482 || _3484;
    float _3488 = fma(_3474, 0.114477999508380889892578125, _3476);
    bool _3490 = _2641 <= 0.0;
    bool _3492 = !_3486;
    bool _3494 = _3490 || _3492;
    float _3496 = -_3488;
    float _3498 = _3468 + _3496;
    float _3500 = -_3488;
    float _3502 = _3462 + _3500;
    float _3504 = -_3488;
    float _3506 = _3474 + _3504;
    float _3508 = fma(_3498, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3488);
    float _3510 = fma(_3502, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3488);
    float _3512 = fma(_3506, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3488);
    bool _3514 = !_3472;
    if (!_3514)
    {
        float _3516 = -_2507;
        float _3518 = _3516 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3520 = -_2509;
        float _3522 = _3520 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3524 = -_2511;
        float _3526 = _3524 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3528 = _3518 * _3518;
        float _3530 = fma(_3522, _3522, _3528);
        float _3532 = fma(_3526, _3526, _3530);
        float _3534 = sqrt(_3532);
        float _3536 = rsqrt(_3532);
        float _3538 = -_3534;
        float _3540 = _3538 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3542 = _3540 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3544 = precise::clamp(_3542, 0.0, 1.0);
        float _3546 = _3522 * _3536;
        float _3548 = _3518 * _3536;
        float _3550 = abs(_3544);
        float _3552 = log2(_3550);
        float _3554 = _3526 * _3536;
        float _3556 = _3546 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3558 = _3164 * _3548;
        float _3560 = -_3548;
        float _3562 = -_3556;
        float _3564 = fma(_3560, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3562);
        float _3566 = fma(_3116, _3546, _3558);
        float _3568 = -_3554;
        float _3570 = fma(_3568, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3564);
        float _3572 = fma(_3166, _3554, _3566);
        float _3574 = precise::clamp(_3572, 0.0, 1.0);
        float _3576 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3578 = _3570 + _3576;
        float _3580 = _3552 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3582 = _3578 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3584 = precise::clamp(_3582, 0.0, 1.0);
        float _3586 = exp2(_3580);
        float _3588 = _3586 * _3584;
        float _3590 = _3574 * _3588;
        float _3592 = _3590 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3594 = _3590 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3596 = _3590 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3592;
        out.m_89.y = _3594;
        out.m_89.z = _3596;
    }
    out.m_91.x = _3508;
    out.m_91.y = _3510;
    out.m_91.z = _3512;
    if (!_3494)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3598 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3598;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3350 = false;
    bool _434 = false;
    bool _336 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_114)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3654 = as_type<float>(_124);
        out.gl_Position.z = _3654;
    }
    if (!_114)
    {
        return out;
    }
    float _128 = in.m_53.w;
    float _130 = float(_110);
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
    float _152 = _128;
    float _154 = _134;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _152;
    if (_150)
    {
        out.m_51.x = 0.0;
    }
    if (_150)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3719 = as_type<float>(_160);
        out.gl_Position.z = _3719;
    }
    if (_150)
    {
        return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _130;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _134 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _186;
    float _212;
    if (!_192)
    {
        float _196 = in.m_57.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _172;
    }
    _214 = false;
    float _216 = _212;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    float _222 = in.m_59.x;
    float _224 = in.m_59.y;
    float _226 = in.m_59.z;
    bool _228 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _230 = isnan(_216);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    bool _244 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_216);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -_238;
    float _258 = _256 + 1.0;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _260;
    float _264 = 1.0 / _242;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _268 = _254 * _258;
    float _270 = -_254;
    float _272 = _270 + 1.0;
    float _274 = _220 * _264;
    float _276 = fma(_262, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = _276 * _268;
    float _288 = fma(_280, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _290 = fma(_284, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _292 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].x, _286);
    float _294 = _288 * _268;
    float _296 = _290 * _268;
    float _298 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].x, _292);
    float _300 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].y, _294);
    float _302 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].z, _296);
    float _304 = _298 * _222;
    float _306 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].y, _300);
    float _308 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].z, _302);
    float _310 = _306 * _224;
    float _312 = _308 * _226;
    bool _314 = !_266;
    float _316 = _222;
    float _334;
    if (!_314)
    {
        float _318 = in.m_57.x;
        float _320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _322 = _318 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _326 = _324 * _320;
        float _328 = floor(_326);
        float _330 = -_328;
        float _332 = _326 + _330;
        _334 = _332;
        _336 = true;
    }
    else
    {
        _334 = _172;
    }
    _336 = false;
    float _338 = _334;
    bool _340 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _342 = isnan(_338);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _356 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _358 = isnan(_338);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _374 = _338 + _372;
    float _376 = -_350;
    float _378 = _376 + 1.0;
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _382 = 1.0 / _354;
    float _384 = _366 * _378;
    float _386 = -_366;
    float _388 = _386 + 1.0;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _392 = _370 * _382;
    float _394 = fma(_392, _374, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _398 = _394 * _384;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _402 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[115].x, _398);
    float _404 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[116].x, _402);
    float _406 = _400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _408 = _396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _410 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _412 = _404 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _406;
    out.m_61.y = _408;
    out.m_61.z = _410;
    out.m_61.w = _412;
    bool _414 = !_380;
    float _432;
    if (!_414)
    {
        float _416 = in.m_57.x;
        float _418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _420 = _416 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _422 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _424 = _422 * _418;
        float _426 = floor(_424);
        float _428 = -_426;
        float _430 = _424 + _428;
        _432 = _430;
        _434 = true;
    }
    else
    {
        _432 = _172;
    }
    _434 = false;
    float _436 = _432;
    float _438 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _440 = int(_438);
    float _442 = in.m_57.x;
    float _444 = in.m_57.y;
    float _446 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _448 = int(_446);
    bool _450 = _436 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _452 = isnan(_436);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    bool _462 = _436 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _464 = isnan(_436);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = float(_440);
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _478 = 1.0 / _474;
    float _480 = float(uint(_448));
    float _482 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[78].w, _476);
    int _484 = ~_448;
    int _486 = _484 + 1;
    int _488 = ~_448;
    int _490 = _488 + 1;
    float _492 = 1.0 / _480;
    bool _494 = _448 == 0;
    int _496 = ~_448;
    int _498 = _496 + 1;
    float _500 = _478 * _134;
    float _502 = trunc(_500);
    int _504 = int(_502);
    int _506 = as_type<int>(_492) + (-2);
    float _508 = float(uint(_504));
    float _510 = as_type<float>(_506) * _508;
    float _512 = trunc(_510);
    float _514 = precise::max(_512, 0.0);
    uint _517 = uint(_514);
    int _519 = _486 * int(_517);
    int _521 = _519 + _504;
    float _523 = float(_448);
    float _525 = float(uint(_521));
    float _527 = as_type<float>(_506) * _525;
    float _529 = trunc(_527);
    float _531 = precise::max(_529, 0.0);
    uint _533 = uint(_531);
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _537 = _535 != 0;
    bool _539 = !_537;
    float _541 = _539 ? 7.345489978790283203125 : 1.0;
    float _543 = _541 * _442;
    int _545 = int(_517) + int(_533);
    float _547 = float(_504);
    float _549 = floor(_543);
    int _551 = _490 * _545;
    int _553 = _551 + _504;
    bool _555 = _547 >= _523;
    bool _557 = isnan(_547);
    bool _559 = _555 || _557;
    bool _561 = isnan(_523);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    bool _567 = uint(_553) >= uint(_448);
    float _569 = trunc(_565);
    int _571 = int(_569);
    bool _573 = !_567;
    int _575 = _573 ? 0 : (-1);
    int _577 = ~_545;
    int _579 = _577 + _575;
    int _581 = _579 + 1;
    float _583 = -_549;
    float _585 = _543 + _583;
    int _587 = _448 * _581;
    int _589 = _587 + _504;
    float _591 = _585 * _523;
    int _593 = ~_571;
    int _595 = _593 + 1;
    int _597 = _595 + 1;
    float _599 = trunc(_591);
    int _601 = int(_599);
    bool _603 = !_494;
    int _605 = _603 ? _589 : (-1);
    int _607 = _605 * _597;
    float _609 = _523 * _134;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _613 = _611 != 0;
    int _615 = _448 + (-1);
    float _617 = _609 * _168;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _621 = _619 != 0;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _625 = _623 != 0;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _629 = _627 != 0;
    bool _631 = !_613;
    int _633 = _631 ? 0 : 1;
    int _635 = _571 * _615;
    int _637 = _635 + _607;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _641 = _639 != 0;
    float _643 = trunc(_617);
    int _645 = int(_643);
    bool _647 = !_625;
    int _649 = _647 ? 0 : 1;
    bool _651 = !_621;
    int _653 = _651 ? 0 : 1;
    int _655 = abs(_649);
    bool _657 = !_629;
    int _659 = _657 ? 0 : 1;
    int _661 = abs(_653);
    bool _663 = !_641;
    int _665 = _663 ? 0 : 1;
    int _667 = abs(_633);
    int _669 = abs(_659);
    int _671 = _637 * _655;
    int _673 = abs(_665);
    int _675 = _601 * _667;
    int _677 = _675 + _504;
    int _679 = _645 * _661;
    int _681 = _679 + _671;
    float _683 = in.m_63.z;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _687 = _685 != 0;
    int _689 = _677 * _669;
    int _691 = _689 + _681;
    int _693 = ~_448;
    int _695 = _693 + 1;
    float _697 = in.m_63.y;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _701 = _699 != 0;
    int _703 = _601 * _673;
    int _705 = _703 + _691;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _709 = _707 != 0;
    float _711 = in.m_65.x;
    float _713 = float(uint(_705));
    float _715 = 0.0;
    if (_687)
    {
        float _717 = in.m_57.x;
        _715 = _717;
    }
    float _719 = _715;
    float _721 = as_type<float>(_506) * _713;
    float _723 = trunc(_721);
    float _725 = precise::max(_723, 0.0);
    uint _727 = uint(_725);
    out.m_67.z = _683;
    out.m_67.y = _697;
    int _729 = ~_448;
    int _731 = _729 + 1;
    float _733 = in.m_65.y;
    float _735 = _733;
    if (_687)
    {
        _316 = _711;
    }
    float _737 = _316;
    int _739 = _695 * int(_727);
    int _741 = _739 + _705;
    bool _743 = _719 > 0.5;
    bool _745 = _743 && _687;
    float _747 = float(uint(_741));
    float _749 = in.m_63.x;
    float _751 = as_type<float>(_506) * _747;
    float _753 = trunc(_751);
    float _755 = precise::max(_753, 0.0);
    uint _757 = uint(_755);
    float _759 = _737;
    if (_745)
    {
        float _761 = -_737;
        float _763 = _761 + 1.0;
        _759 = _763;
    }
    float _765 = _759;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _769 = int(_727) + int(_757);
    out.m_67.x = _749;
    int _771 = _498 * _769;
    int _773 = _771 + _705;
    float _775 = in.m_63.w;
    bool _777 = uint(_773) >= uint(_448);
    float _779 = float(uint(_677));
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _783 = !_777;
    int _785 = _783 ? 0 : (-1);
    bool _787 = _444 > 0.5;
    float _789 = as_type<float>(_506) * _779;
    int _791 = ~_769;
    int _793 = _791 + _785;
    int _795 = _793 + 1;
    float _797 = -_733;
    float _799 = _797 + 1.0;
    float _801 = trunc(_789);
    float _803 = precise::max(_801, 0.0);
    uint _805 = uint(_803);
    int _807 = _448 * _795;
    int _809 = _807 + _705;
    if (_701)
    {
        float _811 = _787 ? _799 : _733;
        _735 = _811;
    }
    float _813 = _735;
    float _815 = _444 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _817 = !_494;
    int _819 = _817 ? _809 : (-1);
    float _821 = fma(_815, -2.0, _781);
    out.m_67.w = _775;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _827 = _819 >> 31;
    int _829 = _819 & 3;
    bool _831 = _829 != 0;
    float _833 = 1.0 / _825;
    int _835 = _819 & 3;
    bool _837 = _835 != 0;
    int _839 = _731 * int(_805);
    int _841 = _839 + _677;
    float _843 = _442 * 2.0;
    bool _845 = uint(_829) > 1u;
    float _847 = float(uint(_841));
    float _849 = -_767;
    float _851 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[77].x, _849);
    int _853 = _827 & 3;
    float _855 = floor(_843);
    float _857 = as_type<float>(_506) * _847;
    int _859 = _819 + _853;
    float _861 = in.m_57.z;
    int _863 = _859 >> 2;
    float _865 = trunc(_857);
    float _867 = precise::max(_865, 0.0);
    uint _869 = uint(_867);
    float _871 = _843;
    if (!_687)
    {
        _871 = _711;
    }
    float _873 = _871;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _875;
    int _879 = _863 << 4;
    int _881 = _879 + 368;
    int _883 = _837 ? 0 : 1;
    float _885 = _877 * _833;
    uint _887 = uint(int(uint(_881) >> uint(2)));
    uint _889 = uint(int(uint(int(_887)) >> uint(2)));
    int _891 = int(_887) & 3;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[int(_889)][_891];
    int _895 = int(_887) + 1;
    uint _897 = uint(int(uint(_895) >> uint(2)));
    int _899 = _895 & 3;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[int(_897)][_899];
    bool _903 = _855 > 0.0;
    float _905 = _444 * 2.0;
    bool _907 = _855 >= 0.0;
    bool _909 = isnan(_855);
    bool _911 = _907 || _909;
    bool _913 = isnan(0.0);
    bool _915 = _911 || _913;
    float _917 = _873;
    if (_687)
    {
        _917 = _765;
    }
    float _919 = _917;
    float _921 = floor(_905);
    bool _923 = _829 != 3;
    int _925 = int(_805) + int(_869);
    int _927 = _881 + 8;
    uint _929 = uint(int(uint(_927) >> uint(2)));
    uint _931 = uint(int(uint(int(_929)) >> uint(2)));
    int _933 = int(_929) & 3;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[int(_931)][_933];
    int _937 = int(_929) + 1;
    uint _939 = uint(int(uint(_937) >> uint(2)));
    int _941 = _937 & 3;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[int(_939)][_941];
    int _945 = ~_883;
    int _947 = _945 + 1;
    int _949 = _947 + 1;
    float _951 = _444 + _861;
    int _953 = _949;
    if (!_845)
    {
        int _955 = ~_883;
        int _957 = _955 + 1;
        _953 = _957;
    }
    int _959 = _953;
    float _961 = _444 + _442;
    bool _963 = uint(_829) >= 2u;
    float _965 = _951 + (-1.0);
    int _967 = ~_448;
    int _969 = _967 + 1;
    float _971 = _961 + (-1.0);
    int _973 = _963 ? 0 : 1;
    float _975 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _977 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _979 = int(_977);
    float _981 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _983 = ~_973;
    int _985 = _983 + 1;
    int _987 = _985 + 1;
    int _989 = _969 * _925;
    int _991 = _989 + _677;
    int _993 = _987;
    if (_923)
    {
        int _995 = ~_973;
        int _997 = _995 + 1;
        _993 = _997;
    }
    int _999 = _993;
    int _1001 = abs(_959);
    bool _1003 = _829 != 3;
    bool _1005 = !_831;
    int _1007 = _1005 ? 0 : 1;
    int _1009 = abs(_1007);
    int _1011 = ~_1001;
    int _1013 = _1011 + 1;
    int _1015 = _1013 + 1;
    int _1017 = ~_1009;
    int _1019 = _1017 + 1;
    int _1021 = _1019 + 1;
    int _1023 = abs(_999);
    bool _1025 = uint(_991) >= uint(_448);
    bool _1027 = !_1003;
    int _1029 = _1027 ? 0 : (-1);
    int _1031 = _1015 * as_type<int>(_901);
    bool _1033 = !_709;
    int _1035 = _1033 ? 0 : 1;
    float _1037 = _861 * 2.0;
    bool _1039 = _921 > 0.0;
    int _1041 = _1021 * as_type<int>(_893);
    int _1043 = _1041 + _1031;
    bool _1045 = _921 >= 0.0;
    bool _1047 = isnan(_921);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan(0.0);
    bool _1053 = _1049 || _1051;
    float _1055 = floor(_1037);
    bool _1057 = !_1025;
    int _1059 = _1057 ? 0 : (-1);
    int _1061 = abs(_1029);
    int _1063 = ~_1023;
    int _1065 = _1063 + 1;
    int _1067 = _1065 + 1;
    int _1069 = ~_925;
    int _1071 = _1069 + _1059;
    int _1073 = _1071 + 1;
    int _1075 = abs(_1035);
    int _1077 = _1067 * as_type<int>(_935);
    int _1079 = _1077 + _1043;
    int _1081 = ~_1061;
    int _1083 = _1081 + 1;
    int _1085 = _1083 + 1;
    int _1087 = _448 * _1073;
    int _1089 = _1087 + _677;
    int _1091 = _915 ? 0 : 1;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1095 = _1093 != 0;
    int _1097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1099 = _1097 != 0;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1103 = _1101 != 0;
    int _1105 = _1085 * as_type<int>(_943);
    int _1107 = _1105 + _1079;
    float _1109 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1111 = log2(_1109);
    int _1113 = ~_1075;
    int _1115 = _1113 + 1;
    int _1117 = _1115 + 1;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1121 = _436 + _1119;
    float _1123 = float(uint(_979));
    int _1125 = abs(_979);
    int _1127 = _1107 * _1117;
    bool _1129 = !_494;
    int _1131 = _1129 ? _1089 : (-1);
    float _1133 = 1.0 / _1123;
    float _1135 = float(uint(_1125));
    int _1137 = _1131 * _1075;
    int _1139 = _1137 + _1127;
    int _1141 = ~_1091;
    int _1143 = _1141 + 1;
    int _1145 = _1143 + 1;
    int _1147 = _1145;
    if (!_903)
    {
        int _1149 = ~_1091;
        int _1151 = _1149 + 1;
        _1147 = _1151;
    }
    int _1153 = _1147;
    float _1155 = _1111 * _134;
    float _1157 = 1.0 / _1135;
    bool _1159 = _1055 > 0.0;
    bool _1161 = _1055 >= 0.0;
    bool _1163 = isnan(_1055);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan(0.0);
    bool _1169 = _1165 || _1167;
    float _1171 = fma(_885, _1121, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1173 = float(uint(_1139));
    int _1175 = abs(_1139);
    float _1177 = exp2(_1155);
    int _1179 = as_type<int>(_1133) + (-2);
    float _1181 = in.m_48.x;
    float _1183 = in.m_48.y;
    float _1185 = in.m_48.z;
    float _1187 = float(uint(_1175));
    float _1189 = as_type<float>(_1179) * _1173;
    float _1191 = in.m_69.y;
    int _1193 = as_type<int>(_1157) + (-2);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1197 = 1.0 + _1195;
    int _1199 = _1169 ? 0 : 1;
    float _1201 = trunc(_1189);
    float _1203 = precise::max(_1201, 0.0);
    uint _1205 = uint(_1203);
    bool _1207 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1209 = isnan(0.0);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1215 = _1211 || _1213;
    float _1217 = as_type<float>(_1193) * _1187;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1221 = -_1177;
    float _1223 = _1221 + 1.0;
    int _1225 = ~_979;
    int _1227 = _1225 + 1;
    float _1229 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _482);
    int _1231 = _1053 ? 0 : 1;
    float _1233 = trunc(_1217);
    float _1235 = precise::max(_1233, 0.0);
    uint _1237 = uint(_1235);
    float _1239 = _1215 ? _1223 : 0.0;
    float _1241 = -_472;
    float _1243 = _1241 + 1.0;
    bool _1245 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1247 = isnan(1.0);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1253 = _1249 || _1251;
    float _1255 = _460 * _1243;
    float _1257 = -_134;
    float _1259 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[76].x, _851);
    float _1261 = 1.0 / _1197;
    int _1263 = ~_1125;
    int _1265 = _1263 + 1;
    float _1267 = _1171 * _1255;
    int _1269 = ~_1199;
    int _1271 = _1269 + 1;
    int _1273 = _1271 + 1;
    float _1275 = _1183 + _1191;
    int _1277 = _1273;
    float _1279 = as_type<float>(_1205);
    if (!_1159)
    {
        int _1281 = ~_1199;
        int _1283 = _1281 + 1;
        _1277 = _1283;
    }
    int _1285 = _1277;
    float _1287 = _1183 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1289 = _1265 * int(_1237);
    int _1291 = _1289 + _1175;
    float _1293 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1219);
    float _1295 = fma(_1181, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1287);
    float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1299 = _1275 + _1297;
    float _1301 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1293);
    float _1303 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _821);
    int _1305 = _1227 * int(_1205);
    int _1307 = _1305 + _1139;
    if (_1253)
    {
        float _1309 = _1239 * _1261;
        _154 = _1309;
    }
    float _1311 = _154;
    float _1313 = -_460;
    float _1315 = _1313 + 1.0;
    float _1317 = float(uint(_1291));
    float _1319 = fma(_1185, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1295);
    float _1321 = float(uint(_1307));
    float _1323 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1267);
    bool _1325 = !_1099;
    int _1327 = _1325 ? 0 : 1;
    float _1329 = as_type<float>(_1193) * _1317;
    float _1331 = _1319 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1333 = as_type<float>(_1179) * _1321;
    float _1335 = _1183 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1337 = !_1095;
    int _1339 = _1337 ? 0 : 1;
    float _1341 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1343 = abs(_1327);
    float _1345 = fma(_1181, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1335);
    float _1347 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1349 = _1331 + _1347;
    float _1351 = in.m_71.x;
    float _1353 = in.m_71.y;
    float _1355 = in.m_71.z;
    int _1357 = abs(_1339);
    float _1359 = fma(_1185, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1345);
    float _1361 = trunc(_1329);
    float _1363 = precise::max(_1361, 0.0);
    uint _1365 = uint(_1363);
    float _1367 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1341);
    float _1369 = float(_1357);
    float _1371 = _1359 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1373 = float(_1285);
    float _1375 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1323);
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1379 = _1371 + _1377;
    float _1381 = trunc(_1333);
    float _1383 = precise::max(_1381, 0.0);
    uint _1385 = uint(_1383);
    float _1387 = _1369 * _1373;
    int _1389 = ~_1125;
    int _1391 = _1389 + 1;
    float _1393 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1367);
    float _1395 = float(_1153);
    float _1397 = _1387 * (-2.0);
    float _1399 = float(_1343);
    bool _1401 = _1393 >= 0.0;
    int _1403 = int(_1237) + int(_1365);
    float _1405 = _1399 * _1395;
    float _1407 = fma(_1397, _1351, _1351);
    int _1409 = ~_979;
    int _1411 = _1409 + 1;
    float _1413 = _1405 * (-2.0);
    int _1415 = int(_1205) + int(_1385);
    int _1417 = _1391 * _1403;
    int _1419 = _1417 + _1175;
    float _1421 = _1299 * _1299;
    int _1423 = ~_1231;
    int _1425 = _1423 + 1;
    int _1427 = _1425 + 1;
    float _1429 = fma(_981, _1397, _981);
    int _1431 = _1427;
    if (_1401)
    {
        _1279 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1433 = _1279;
    int _1435 = _1411 * _1415;
    int _1437 = _1435 + _1139;
    int _1439 = as_type<int>(_1433);
    if (!_1039)
    {
        int _1441 = ~_1231;
        int _1443 = _1441 + 1;
        _1431 = _1443;
    }
    int _1445 = _1431;
    float _1447 = fma(_1349, _1349, _1421);
    bool _1449 = uint(_1419) >= uint(_1125);
    int _1451 = _1139 ^ _979;
    if (_1401)
    {
        float _1453 = _1433 * 5.0;
        _1439 = as_type<int>(_1453);
    }
    int _1455 = _1439;
    bool _1457 = uint(_1437) >= uint(_979);
    float _1459 = fma(_1379, _1379, _1447);
    bool _1461 = !_1449;
    int _1463 = _1461 ? 0 : (-1);
    float _1465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _1467 = uint(int(uint(_1451) >> uint(31)));
    if (_1401)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5632 = as_type<float>(_1455);
        out.gl_Position.z = _5632;
    }
    bool _1469 = !_1457;
    int _1471 = _1469 ? 0 : (-1);
    float _1473 = fma(_975, _1413, _975);
    int _1475 = ~_1463;
    int _1477 = _1403 + _1475;
    int _1479 = _1477 + 1;
    float _1481 = _442 + (-0.5);
    int _1483 = ~_1415;
    int _1485 = _1483 + _1471;
    int _1487 = _1485 + 1;
    float _1489 = rsqrt(_1459);
    bool _1491 = _979 == 0;
    float _1493 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1407);
    bool _1495 = _979 == 0;
    if (_1401)
    {
        out.m_51.x = 0.0;
    }
    float _1497 = fma(_1413, _1353, _1353);
    int _1499 = ~int(_1467);
    int _1501 = _1499 + 1;
    int _1503 = _979 * _1487;
    int _1505 = _1503 + _1139;
    float _1507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1509 = _1465 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1511 = _1479 ^ _1501;
    float _1513 = fma(_1429, _1311, _1493);
    bool _1515 = !_1491;
    int _1517 = _1515 ? _1505 : (-1);
    float _1519 = fma(_1509, _919, -0.5);
    int _1521 = ~_1501;
    int _1523 = _1521 + _1511;
    int _1525 = _1523 + 1;
    float _1527 = float(_1517);
    float _1529 = _1299 * _1489;
    bool _1531 = !_1495;
    int _1533 = _1531 ? _1525 : (-1);
    float _1535 = _1349 * _1489;
    float _1537 = fma(_1509, _1527, _1259);
    float _1539 = float(_1533);
    float _1541 = -_1529;
    float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1299);
    float _1545 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1547 = fma(_1301, _1519, _1537);
    float _1549 = -_1535;
    float _1551 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1349);
    float _1553 = _1543 * _1543;
    float _1555 = fma(_1545, _813, -0.5);
    float _1557 = -_1303;
    float _1559 = fma(_1545, _1539, _1557);
    float _1561 = fma(_1551, _1551, _1553);
    float _1563 = fma(_1229, _1555, _1559);
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1567 = _1379 * _1489;
    float _1569 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1571 = _1547 + 0.5;
    float _1573 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1575 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1577 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1579 = _1563 + 0.5;
    float _1581 = _1573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1583 = _1375 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1585 = -_1567;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1379);
    bool _1589 = !_1103;
    int _1591 = _1589 ? 0 : 1;
    out.m_73.x = _1571;
    out.m_73.y = _1579;
    float _1593 = fma(_1587, _1587, _1561);
    int _1595 = abs(_1591);
    out.m_75.x = _1575;
    out.m_75.y = _1577;
    out.m_75.z = _1581;
    out.m_75.w = _1583;
    float _1597 = _1535;
    float _1599 = _1529;
    if (_1401)
    {
        return out;
    }
    float _1601 = -_1529;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1275);
    float _1605 = _444 + (-0.5);
    float _1607 = -_1535;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1331);
    float _1611 = float(_1445);
    float _1613 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1615 = _1603 + _1613;
    float _1617 = float(_1595);
    float _1619 = -_1567;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1371);
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1625 = _1609 + _1623;
    float _1627 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1629 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1497);
    float _1631 = _1617 * _1611;
    float _1633 = _861 + _442;
    float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1637 = _1621 + _1635;
    float _1639 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1627);
    float _1641 = fma(_1473, _1311, _1629);
    float _1643 = _1633 + (-1.0);
    float _1645 = _1631 * (-2.0);
    float _1647 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1639);
    float _1649 = _861 + (-0.5);
    float _1651 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1653 = fma(_1645, _1355, _1355);
    float _1655 = _1513 * 0.15915493667125701904296875;
    bool _1657 = _1647 >= 0.0;
    float _1659 = fma(_1651, _1645, _1651);
    float _1661 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1653);
    float _1663 = _1641 * 0.15915493667125701904296875;
    float _1665 = _1655 * 6.283185482025146484375;
    float _1667 = sin(_1665);
    float _1669 = fma(_1659, _1311, _1661);
    float _1671 = _1669 * 0.15915493667125701904296875;
    float _1673 = _1655 * 6.283185482025146484375;
    float _1675 = cos(_1673);
    float _1677 = _1653;
    float _1679 = _1637;
    if (_1657)
    {
        _1677 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1681 = _1677;
    int _1683 = as_type<int>(_1681);
    if (_1657)
    {
        out.m_51.x = 0.0;
    }
    if (_1657)
    {
        float _1685 = _1681 * 5.0;
        _1683 = as_type<int>(_1685);
    }
    int _1687 = _1683;
    float _1689 = sqrt(_1593);
    if (_1657)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6005 = as_type<float>(_1687);
        out.gl_Position.z = _6005;
    }
    float _1691 = _1663 * 6.283185482025146484375;
    float _1693 = sin(_1691);
    float _1695 = _1663 * 6.283185482025146484375;
    float _1697 = cos(_1695);
    float _1699 = _1671 * 6.283185482025146484375;
    float _1701 = sin(_1699);
    if (_1657)
    {
        return out;
    }
    float _1703 = _1671 * 6.283185482025146484375;
    float _1705 = cos(_1703);
    float _1707 = _1667 * _1693;
    float _1709 = _1675 * _1697;
    float _1711 = _1489 * _1689;
    float _1713 = _1667 * _1697;
    float _1715 = _1183 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1717 = fma(_1701, _1709, _1707);
    float _1719 = fma(_1701, _1707, _1709);
    float _1721 = _1675 * _1693;
    float _1723 = in.m_77.x;
    float _1725 = in.m_77.y;
    float _1727 = in.m_77.z;
    float _1729 = _310 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1731 = _1711 * _1729;
    float _1733 = _1675 * _1705;
    float _1735 = _1697 * _1705;
    float _1737 = _1667 * _1705;
    float _1739 = _1693 * _1705;
    float _1741 = -_1331;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1745 = -_1275;
    float _1747 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1749 = fma(_1181, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1715);
    float _1751 = -_1721;
    float _1753 = fma(_1701, _1713, _1751);
    float _1755 = _1743 * _1743;
    float _1757 = -_1713;
    float _1759 = fma(_1701, _1721, _1757);
    float _1761 = -_1371;
    float _1763 = _1761 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1765 = fma(_1185, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1749);
    float _1767 = fma(_1747, _1747, _1755);
    float _1769 = _304 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1771 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1773 = fma(_1763, _1763, _1767);
    float _1775 = _1765 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1777 = _1711 * _1769;
    float _1779 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1725);
    float _1781 = rsqrt(_1773);
    float _1783 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1771);
    float _1785 = -_1775;
    float _1787 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1789 = _1779 * _1731;
    float _1791 = _312 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1793 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1723);
    float _1795 = fma(_1787, _1787, _1755);
    float _1797 = _1711 * _1791;
    float _1799 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1801 = _1793 * _1777;
    float _1803 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1783);
    float _1805 = fma(_1763, _1763, _1795);
    float _1807 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1799);
    float _1809 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1727);
    float _1811 = _1743 * _1781;
    float _1813 = _1763 * _1781;
    float _1815 = _1747 * _1781;
    float _1817 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1807);
    float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1821 = _1811 * _1819;
    float _1823 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1825 = _1813 * _1823;
    float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1829 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1827;
    float _1831 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1835 = -_1821;
    float _1837 = fma(_1813, _1833, _1835);
    float _1839 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1841 = _1815 * _1839;
    float _1843 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1845 = -_1825;
    float _1847 = fma(_1815, _1843, _1845);
    float _1849 = _1817 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1851 = _1837 * _1837;
    float _1853 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1855 = -_1841;
    float _1857 = fma(_1811, _1853, _1855);
    float _1859 = -_1849;
    float _1861 = _1831 + _1859;
    float _1863 = fma(_1847, _1847, _1851);
    float _1865 = sqrt(_1805);
    float _1867 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1869 = _1809 * _1797;
    float _1871 = fma(_1857, _1857, _1863);
    float _1873 = abs(_1861);
    float _1875 = precise::max(_1873, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1877 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1867);
    float _1879 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1881 = 1.0 / _1829;
    float _1883 = precise::min(_1875, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    bool _1885 = _1849 >= _1831;
    bool _1887 = isnan(_1849);
    bool _1889 = _1885 || _1887;
    bool _1891 = isnan(_1831);
    bool _1893 = _1889 || _1891;
    float _1895 = -_1789;
    float _1897 = _1701 * _1895;
    float _1899 = _1733 * _1789;
    float _1901 = _1737 * _1789;
    float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1905 = _1883 + _1903;
    float _1907 = rsqrt(_1871);
    float _1909 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1877);
    float _1911 = fma(_1735, _1801, _1897);
    float _1913 = fma(_1717, _1801, _1899);
    float _1915 = fma(_1753, _1801, _1901);
    float _1917 = abs(_1865);
    float _1919 = precise::max(0.0, _1917);
    bool _1921 = !_1893;
    float _1923 = _1921 ? 1.0 : (-1.0);
    float _1925 = _1905 * _1881;
    float _1927 = precise::min(_1919, 40.0);
    float _1929 = _172 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1931 = rsqrt(_1909);
    float _1933 = _1923 * _1925;
    float _1935 = fma(_1739, _1869, _1911);
    float _1937 = fma(_1927, -0.02500000037252902984619140625, 1.0);
    float _1939 = fma(_1759, _1869, _1913);
    float _1941 = _1857 * _1907;
    float _1943 = _1929 * _1933;
    float _1945 = _1847 * _1907;
    float _1947 = _1837 * _1907;
    float _1949 = _1811 * _1941;
    float _1951 = fma(_1719, _1869, _1915);
    float _1953 = _1815 * _1945;
    float _1955 = _1813 * _1947;
    float _1957 = -_1949;
    float _1959 = fma(_1813, _1945, _1957);
    float _1961 = -_1953;
    float _1963 = fma(_1811, _1947, _1961);
    float _1965 = -_1955;
    float _1967 = fma(_1815, _1941, _1965);
    float _1969 = _1959 * _1939;
    float _1971 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1973 = _1963 * _1939;
    float _1975 = _1967 * _1939;
    float _1977 = fma(_1947, _1935, _1969);
    float _1979 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1981 = _1971 * _1971;
    float _1983 = fma(_1945, _1935, _1975);
    float _1985 = fma(_1815, _1951, _1977);
    float _1987 = fma(_1941, _1935, _1973);
    float _1989 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1991 = fma(_1811, _1951, _1983);
    float _1993 = _1275 + _1985;
    float _1995 = _1943 * 0.15915493667125701904296875;
    float _1997 = fma(_1979, _1979, _1981);
    float _1999 = _1331 + _1991;
    float _2001 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2003 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2005 = fma(_1813, _1951, _1987);
    float _2007 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2009 = fma(_1989, _1989, _1997);
    float _2011 = fma(_1999, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2001);
    float _2013 = fma(_1999, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2003);
    float _2015 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1879);
    float _2017 = _1371 + _2005;
    float _2019 = fma(_1999, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2007);
    float _2021 = rsqrt(_2009);
    float _2023 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2015);
    float _2025 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2013);
    float _2027 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2019);
    float _2029 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2011);
    float _2031 = _2023 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2033 = _2025 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2035 = _2027 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2037 = _1995 * 6.283185482025146484375;
    float _2039 = cos(_2037);
    float _2041 = _2029 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2043 = -_2033;
    float _2045 = _2043 + _2031;
    float _2047 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2049 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2051 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2053 = fma(_1937, _2045, _2033);
    float _2055 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2047);
    float _2057 = _1995 * 6.283185482025146484375;
    float _2059 = sin(_2057);
    float _2061 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2049);
    float _2063 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2051);
    float _2065 = _1989 * _2021;
    float _2067 = _1979 * _2021;
    float _2069 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2061);
    float _2071 = _1971 * _2021;
    float _2073 = _2065 * _2065;
    float _2075 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2055);
    float _2077 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2063);
    float _2079 = -_2039;
    float _2081 = _2079 + 1.0;
    float _2083 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2085 = _2075 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2087 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2089 = _2087 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2091 = _2071 * _2081;
    float _2093 = _2067 * _2059;
    float _2095 = _2071 * _2059;
    float _2097 = _2065 * _2059;
    float _2099 = fma(_2081, _2073, _2039);
    float _2101 = _2067 * _2081;
    float _2103 = fma(_2065, _2091, _2093);
    float _2105 = -_1775;
    float _2107 = _2105 + _2083;
    float _2109 = -_1331;
    float _2111 = _2109 + _2085;
    float _2113 = -_2097;
    float _2115 = fma(_2071, _2101, _2113);
    float _2117 = -_2095;
    float _2119 = fma(_2065, _2101, _2117);
    float _2121 = _2103 * _2107;
    float _2123 = _2077 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2125 = fma(_2067, _2101, _2039);
    float _2127 = _2115 * _2107;
    float _2129 = fma(_2119, _2111, _2121);
    float _2131 = -_1371;
    float _2133 = _2131 + _2123;
    float _2135 = fma(_172, _2089, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2137 = fma(_2125, _2111, _2127);
    float _2139 = fma(_2065, _2101, _2095);
    float _2141 = fma(_2099, _2133, _2129);
    float _2143 = -_2093;
    float _2145 = fma(_2065, _2091, _2143);
    float _2147 = fma(_2139, _2133, _2137);
    float _2149 = fma(_2141, _2135, _1371);
    float _2151 = fma(_2147, _2135, _1331);
    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2155 = _2149 + _2153;
    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2159 = _2151 + _2157;
    float _2161 = _2155 * _2155;
    float _2163 = fma(_2159, _2159, _2161);
    float _2165 = sqrt(_2163);
    bool _2167 = _2165 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2171 = _2165 + _2169;
    float _2173 = _2121;
    float _2175 = _2163;
    float _2177 = _2039;
    float _2179 = _1775;
    float _2181 = _2151;
    float _2183 = _2149;
    if (_2167)
    {
        float _2185 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2173 = _2185;
    }
    float _2187 = _2173;
    if (_2167)
    {
        float _2189 = rsqrt(_2163);
        _2175 = _2189;
    }
    float _2191 = _2175;
    float _2193 = _2187;
    if (_2167)
    {
        float _2195 = _2171 * _2187;
        _2193 = _2195;
    }
    float _2197 = _2193;
    float _2199 = fma(_2071, _2091, _2039);
    float _2201 = fma(_2071, _2101, _2097);
    if (_2167)
    {
        float _2203 = _2197 * 0.15915493667125701904296875;
        _2177 = _2203;
    }
    float _2205 = _2177;
    float _2207 = _2199 * _2107;
    float _2209 = _2097;
    if (_2167)
    {
        float _2211 = _2205 * 6.283185482025146484375;
        float _2213 = sin(_2211);
        _2209 = _2213;
    }
    float _2215 = _2209;
    float _2217 = fma(_2201, _2111, _2207);
    float _2219 = fma(_2145, _2133, _2217);
    float _2221 = _1775 + _2219;
    float _2223 = _2221;
    if (_2167)
    {
        float _2225 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2179 = _2225;
    }
    float _2227 = _2179;
    float _2229 = _2227;
    if (_2167)
    {
        float _2231 = fma(_2215, _2227, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2229 = _2231;
    }
    float _2233 = _2229;
    float _2235 = _2233;
    if (_2167)
    {
        float _2237 = _2191 * _2233;
        _2235 = _2237;
    }
    float _2239 = _2235;
    if (_2167)
    {
        float _2241 = fma(_2159, _2239, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _2181 = _2241;
    }
    float _2243 = _2181;
    float _2245 = _2243;
    if (_2167)
    {
        float _2247 = fma(_2155, _2239, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2183 = _2247;
    }
    float _2249 = _2183;
    float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2253 = _2243 + _2251;
    float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2257 = _2249 + _2255;
    float _2259 = fma(_2253, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2261 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6967 = float2(_2259, _2261);
    float _2263 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6967, float2(0.0), isnan(_6967)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6967, float2(0.0), isnan(_6967)), level(0.0)).x;
    float _2265 = _2205;
    float _2267 = _2253;
    float _2269 = _2249;
    if (_2167)
    {
        float _2271 = _2205 * 6.283185482025146484375;
        float _2273 = cos(_2271);
        _2265 = _2273;
    }
    float _2275 = _2265;
    float _2277 = -_1371;
    float _2279 = _2277 + _2249;
    if (_2167)
    {
        float _2281 = _2275 + (-1.0);
        _2267 = _2281;
    }
    float _2283 = _2267;
    float _2285 = _2283;
    if (_2167)
    {
        float _2287 = _2283 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2285 = _2287;
    }
    float _2289 = _2285;
    if (_2167)
    {
        float _2291 = fma(_2221, _2275, _2289);
        _2223 = _2291;
    }
    float _2293 = _2223;
    float _2295 = -_1331;
    float _2297 = _2295 + _2243;
    float _2299 = fma(_2263, 100.0, _1275);
    float _2301 = -_1275;
    float _2303 = _2301 + _2293;
    float _2305 = fma(_2263, 100.0, _2293);
    float _2307 = -_1529;
    float _2309 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2299);
    float _2311 = _2303 * _2303;
    float _2313 = _2309 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2315 = fma(_2297, _2297, _2311);
    float _2317 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2313);
    float _2319 = fma(_2279, _2279, _2315);
    float _2321 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2317);
    float _2323 = sqrt(_2319);
    float _2325 = _2321 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2327 = _2309 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2329 = 1.0 / _2325;
    float _2331 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2327);
    float _2333 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2331);
    bool _2335 = _2323 > 0.0;
    float _2337 = _2333 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2339 = _2337 + _2325;
    float _2341 = _2339 * _2329;
    float _2343 = _2341 * 0.5;
    bool _2345 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2347 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2349 = _2345 || _2347;
    bool _2351 = isnan(0.5);
    bool _2353 = _2349 || _2351;
    float _2355 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2357 = fma(_2343, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2355);
    bool _2359 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2361 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan(0.5);
    bool _2367 = _2363 || _2365;
    float _2369 = 1.0 / _2357;
    bool _2371 = !_2335;
    float _2373 = _2305;
    float _2375 = _2303;
    if (!_2371)
    {
        float _2377 = _188 * _188;
        float _2379 = rsqrt(_2319);
        float _2381 = fma(_186, _186, _2377);
        float _2383 = fma(_190, _190, _2381);
        float _2385 = sqrt(_2383);
        float _2387 = _2303 * _2379;
        float _2389 = _2279 * _2379;
        bool _2391 = _2385 > 0.0;
        float _2393 = _2297 * _2379;
        bool _2395 = !_2391;
        if (!_2395)
        {
            float _2397 = rsqrt(_2383);
            float _2399 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2401 = _188 * _2397;
            float _2403 = _186 * _2397;
            float _2405 = _2387 * _2401;
            float _2407 = _190 * _2397;
            float _2409 = fma(_2393, _2403, _2405);
            float _2411 = _2399 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2413 = fma(_2389, _2407, _2409);
            float _2415 = _2413 * _2411;
            float _2417 = fma(_186, _2415, _2243);
            float _2419 = fma(_188, _2415, _2305);
            float _2421 = fma(_190, _2415, _2249);
            _2245 = _2417;
            _2373 = _2419;
            _2269 = _2421;
            _2375 = _2407;
        }
    }
    float _2423 = _2245;
    float _2425 = _2373;
    float _2427 = _2269;
    float _2429 = _2375;
    float _2431 = -_1535;
    float _2433 = fma(_2431, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2423);
    float _2435 = -_1529;
    float _2437 = fma(_2435, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2425);
    float _2439 = -_1567;
    float _2441 = fma(_2439, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2427);
    float _2443 = _2437;
    float _2445 = _2441;
    float _2447 = _2429;
    if (_2367)
    {
        _1597 = 1.0;
    }
    float _2449 = _1597;
    float _2451 = _2449;
    if (_2353)
    {
        _1599 = _2433;
    }
    float _2453 = _1599;
    float _2455 = _2453;
    if (!_2353)
    {
        float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2459 = _2309 + _2457;
        float _2461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2463 = -_1371;
        float _2465 = _2463 + _2427;
        float _2467 = -_2299;
        float _2469 = _2467 + _2425;
        float _2471 = _2459 * _2459;
        float _2473 = -_1331;
        float _2475 = _2473 + _2423;
        float _2477 = fma(_1625, _1625, _2471);
        float _2479 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2481 = fma(_1637, _1637, _2477);
        float _2483 = 1.0 / _1711;
        float _2485 = sqrt(_2481);
        float _2487 = _2479 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2489 = precise::min(_2485, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2491 = _2489 * _2461;
        float _2493 = _2491 * _2483;
        float _2495 = _2487 * _2493;
        float _2497 = _2465 * _2493;
        float _2499 = fma(_2469, _2495, _2309);
        float _2501 = fma(_2475, _2495, _1609);
        float _2503 = fma(_2487, _2497, _1621);
        _194 = _2461;
        _2443 = _2499;
        _2455 = _2501;
        _2445 = _2503;
        _2447 = _2471;
    }
    float _2505 = _194;
    float _2507 = _2443;
    float _2509 = _2455;
    float _2511 = _2445;
    float _2513 = _2447;
    float _2515 = _2505;
    float _2517 = _2513;
    if (_2367)
    {
        _1679 = 1.0;
    }
    float _2519 = _1679;
    float _2521 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2523 = _2369 * _2521;
    float _2525 = _2519;
    if (!_2367)
    {
        float _2527 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2529 = _2527 * 0.15915493667125701904296875;
        float _2531 = _2529 * 6.283185482025146484375;
        float _2533 = cos(_2531);
        float _2535 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2537 = _2535 * 0.15915493667125701904296875;
        float _2539 = _2529 * 6.283185482025146484375;
        float _2541 = sin(_2539);
        float _2543 = 1.0 / _2533;
        float _2545 = _2537 * 6.283185482025146484375;
        float _2547 = cos(_2545);
        float _2549 = _2541 * _2543;
        float _2551 = _2537 * 6.283185482025146484375;
        float _2553 = sin(_2551);
        float _2555 = _2547 * _2549;
        float _2557 = 1.0 / _2555;
        float _2559 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2561 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2559;
        float _2563 = 1.0 / _2561;
        float _2565 = _2553 * _2557;
        float _2567 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2569 = fma(_2523, _2565, _2567);
        float _2571 = _2569 * _2563;
        float _2573 = precise::clamp(_2571, 0.0, 1.0);
        _2515 = _2537;
        _2517 = _2563;
        _2451 = _2573;
    }
    float _2575 = _2515;
    float _2577 = _2517;
    float _2579 = _2451;
    float _2581 = _2577;
    float _2583 = _2575;
    if (!_2367)
    {
        float _2585 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2587 = _2585 * 0.15915493667125701904296875;
        float _2589 = _2587 * 6.283185482025146484375;
        float _2591 = cos(_2589);
        float _2593 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2595 = _2593 * 0.15915493667125701904296875;
        float _2597 = _2587 * 6.283185482025146484375;
        float _2599 = sin(_2597);
        float _2601 = 1.0 / _2591;
        float _2603 = _2595 * 6.283185482025146484375;
        float _2605 = cos(_2603);
        float _2607 = _2599 * _2601;
        float _2609 = _2595 * 6.283185482025146484375;
        float _2611 = sin(_2609);
        float _2613 = _2605 * _2607;
        float _2615 = 1.0 / _2613;
        float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2619 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2617;
        float _2621 = 1.0 / _2619;
        float _2623 = _2611 * _2615;
        float _2625 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2627 = fma(_2523, _2623, _2625);
        float _2629 = _2627 * _2621;
        float _2631 = precise::clamp(_2629, 0.0, 1.0);
        float _2633 = -_2631;
        float _2635 = _2633 + 1.0;
        _2581 = _2613;
        _2583 = _2591;
        _2525 = _2635;
    }
    float _2637 = _2581;
    float _2639 = _2583;
    float _2641 = _2525;
    float _2643 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2645 = _2507 + _2643;
    float _2647 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2649 = _2509 + _2647;
    float _2651 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2653 = _2511 + _2651;
    float _2655 = _2645 * _2645;
    float _2657 = fma(_2649, _2649, _2655);
    float _2659 = fma(_1609, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2661 = fma(_2653, _2653, _2657);
    float _2663 = rsqrt(_2661);
    float _2665 = sqrt(_2661);
    float _2667 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2669 = _2649 * _2667;
    float _2671 = _2653 * _2667;
    float _2673 = _2669 * _2669;
    float _2675 = _2671 * _2671;
    float _2677 = _2673 + _2675;
    float _2679 = sqrt(_2677);
    bool _2681 = _2679 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2683 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2685 = _2679 + _2683;
    float _2687 = _2653;
    float _2689 = _2677;
    float _2691 = _2685;
    float _2693 = _2637;
    float _2695 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2697 = _2667;
    if (_2681)
    {
        float _2699 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2687 = _2699;
    }
    float _2701 = _2687;
    if (_2681)
    {
        float _2703 = rsqrt(_2677);
        _2689 = _2703;
    }
    float _2705 = _2689;
    float _2707 = _2705;
    if (_2681)
    {
        float _2709 = _2685 * _2701;
        _2691 = _2709;
    }
    float _2711 = _2691;
    if (_2681)
    {
        float _2713 = _2711 * 0.15915493667125701904296875;
        _2693 = _2713;
    }
    float _2715 = _2693;
    float _2717 = _2701;
    float _2719 = _2715;
    if (_2681)
    {
        float _2721 = _2715 * 6.283185482025146484375;
        float _2723 = sin(_2721);
        _2717 = _2723;
    }
    float _2725 = _2717;
    float _2727 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2729 = precise::max(0.0, _2727);
    float _2731 = _2639;
    float _2733 = _2729;
    if (_2681)
    {
        float _2735 = _2715 * 6.283185482025146484375;
        float _2737 = cos(_2735);
        _2731 = _2737;
    }
    float _2739 = _2731;
    float _2741 = -_2667;
    float _2743 = -_2729;
    float _2745 = fma(_2645, _2741, _2743);
    float _2747 = _2745;
    if (_2681)
    {
        float _2749 = _2745 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2733 = _2749;
    }
    float _2751 = _2733;
    float _2753 = _2751;
    if (!_2681)
    {
        _2719 = _2669;
    }
    float _2755 = _2719;
    float _2757 = _2725;
    float _2759 = _2755;
    if (_2681)
    {
        float _2761 = fma(_2725, _2751, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2757 = _2761;
    }
    float _2763 = _2757;
    float _2765 = _2763;
    float _2767 = _2739;
    if (_2681)
    {
        float _2769 = _2739 + (-1.0);
        _2753 = _2769;
    }
    float _2771 = _2753;
    if (_2681)
    {
        float _2773 = _2705 * _2763;
        _2695 = _2773;
    }
    float _2775 = _2695;
    if (!_2681)
    {
        _2765 = _2671;
    }
    float _2777 = _2765;
    float _2779 = _2777;
    if (_2681)
    {
        float _2781 = _2771 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2697 = _2781;
    }
    float _2783 = _2697;
    if (_2681)
    {
        float _2785 = _2669 * _2775;
        _2759 = _2785;
    }
    float _2787 = _2759;
    if (!_2681)
    {
        _2707 = _2673;
    }
    float _2789 = _2707;
    float _2791 = _2789;
    if (_2681)
    {
        float _2793 = _2671 * _2775;
        _2779 = _2793;
    }
    float _2795 = _2779;
    if (_2681)
    {
        float _2797 = fma(_2745, _2739, _2783);
        _2747 = _2797;
    }
    float _2799 = _2747;
    if (_2681)
    {
        float _2801 = _2787 * _2787;
        _2791 = _2801;
    }
    float _2803 = _2791;
    if (!_2681)
    {
        _2767 = _2675;
    }
    float _2805 = _2767;
    float _2807 = _2805;
    if (_2681)
    {
        float _2809 = _2795 * _2795;
        _2807 = _2809;
    }
    float _2811 = _2807;
    float _2813 = fma(_2799, _2799, _2803);
    float _2815 = _2507 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2817 = _2507 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2819 = _2813 + _2811;
    float _2821 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2815);
    float _2823 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2825 = fma(_2665, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2823);
    float _2827 = precise::clamp(_2825, 0.0, 1.0);
    float _2829 = rsqrt(_2819);
    float _2831 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2821);
    float _2833 = -_2827;
    float _2835 = _2833 + 1.0;
    float _2837 = fma(_1621, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2839 = _2831 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2841 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2843 = _2507 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2845 = abs(_2835);
    float _2847 = log2(_2845);
    float _2849 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2851 = _2507 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2853 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2817);
    float _2855 = -_2849;
    float _2857 = fma(_2855, _2841, 1.0);
    float _2859 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2843);
    float _2861 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2853);
    float _2863 = _2829 * _2795;
    float _2865 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2851);
    float _2867 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2859);
    float _2869 = _2829 * _2787;
    float _2871 = _2829 * _2799;
    float _2873 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2865);
    float _2875 = _2867 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2877 = floor(_2659);
    float _2879 = _2869 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2881 = _2873 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2883 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2885 = _2847 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2887 = -_2879;
    float _2889 = fma(_2871, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2887);
    float _2891 = _2861 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2893 = fma(_2881, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2883);
    float _2895 = floor(_2837);
    float _2897 = -_2863;
    float _2899 = fma(_2897, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2889);
    float _2901 = fma(_2839, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2893);
    float _2903 = fma(_2899, -0.5, 0.5);
    float _2905 = fma(_2899, 0.5, 0.5);
    float _2907 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2901);
    float _2909 = exp2(_2885);
    float _2911 = -_2877;
    float _2913 = _2659 + _2911;
    float _2915 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2917 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2919 = fma(_2881, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2917);
    float _2921 = log2(_2857);
    float _2923 = -_2895;
    float _2925 = _2837 + _2923;
    float _2927 = fma(_2881, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2915);
    float _2929 = _2871 + 1.0;
    float _2931 = fma(_2839, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2919);
    float _2933 = fma(_2905, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2935 = fma(_2839, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2927);
    float _2937 = 1.0 / _2907;
    float _2939 = -_2871;
    float _2941 = fma(_2909, _2929, _2939);
    float _2943 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2935);
    float _2945 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2931);
    float _2947 = fma(_2905, _2933, -0.212114393711090087890625);
    float _2949 = sqrt(_2903);
    float _2951 = _2921 * 0.693147182464599609375;
    float2 _8037 = float2(_2913, _2925);
    float _2953 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8037, float2(0.0), isnan(_8037)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8037, float2(0.0), isnan(_8037)), level(0.0)).x;
    float _2955 = fma(_2905, _2947, 1.570728778839111328125);
    float _2957 = _2951 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2959 = _2943 * _2937;
    float _2961 = _2945 * _2937;
    float _2963 = fma(_2959, 0.5, 0.5);
    float _2965 = fma(_2961, -0.5, 0.5);
    float _2967 = _2949 * 0.636619746685028076171875;
    float3 _8067 = float3(_2963, _2965, _2957);
    float _2969 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8067, float3(0.0), isnan(_8067)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8067, float3(0.0), isnan(_8067)), level(0.0)).x;
    float _2971 = -_2955;
    float _2973 = fma(_2967, _2971, 1.0);
    float _2975 = fma(_2941, 0.5, 0.5);
    float3 _8085 = float3(_2963, _2965, _2957);
    float4 _2978 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8085, float3(0.0), isnan(_8085)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8085, float3(0.0), isnan(_8085)), level(0.0)).xyzw;
    float _2980 = _2978.x;
    float _2982 = _2978.y;
    float _2984 = _2978.z;
    float _2986 = _2978.w;
    float2 _8101 = float2(_2973, _2975);
    float3 _2990 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8101, float2(0.0), isnan(_8101)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8101, float2(0.0), isnan(_8101)), level(0.0)).xyz;
    float _2992 = _2990.x;
    float _2994 = _2990.y;
    float _2996 = _2990.z;
    float _2998 = in.m_79.x;
    float _3000 = in.m_79.y;
    float _3002 = in.m_79.z;
    bool _3004 = _1725 != 0.0;
    bool _3006 = isnan(_1725);
    bool _3008 = _3004 || _3006;
    bool _3010 = isnan(0.0);
    bool _3012 = _3008 || _3010;
    float _3014 = _2847 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3016 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_61.x = _406;
    out.m_61.y = _408;
    out.m_61.z = _410;
    out.m_61.w = _412;
    bool _3018 = _1723 == 0.0;
    bool _3020 = !_3012;
    bool _3022 = _3018 && _3020;
    float _3024 = _1733 * _1967;
    float _3026 = fma(_2881, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3016);
    float _3028 = _1733 * _1963;
    bool _3030 = _1727 == 0.0;
    bool _3032 = _3030 && _3022;
    float _3034 = exp2(_3014);
    out.m_75.x = _1575;
    out.m_75.y = _1577;
    out.m_75.z = _1581;
    out.m_75.w = _1583;
    float _3036 = in.m_69.x;
    float _3038 = -_1701;
    float _3040 = fma(_3038, _1945, _3024);
    float _3042 = -_1701;
    float _3044 = fma(_3042, _1941, _3028);
    float _3046 = fma(_1737, _1811, _3040);
    float _3048 = _3000;
    float _3050 = _3002;
    float _3052 = _2998;
    if (!_3032)
    {
        float _3054 = fma(_1725, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3000);
        _3048 = _3054;
    }
    float _3056 = _3048;
    if (!_3032)
    {
        float _3058 = fma(_1727, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3002);
        _3050 = _3058;
    }
    float _3060 = _3050;
    float _3062 = _1733 * _1959;
    float _3064 = _1717 * _1967;
    if (!_3032)
    {
        float _3066 = fma(_1723, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2998);
        _3052 = _3066;
    }
    float _3068 = _3052;
    float _3070 = _1717 * _1959;
    float _3072 = -_1701;
    float _3074 = fma(_3072, _1947, _3062);
    float _3076 = fma(_1735, _1945, _3064);
    float _3078 = _1717 * _1963;
    float _3080 = _1759 * _1967;
    float _3082 = fma(_1737, _1815, _3074);
    float _3084 = fma(_1753, _1811, _3076);
    float _3086 = fma(_1735, _1947, _3070);
    float _3088 = abs(_2523);
    float _3090 = log2(_3088);
    float _3092 = fma(_1735, _1941, _3078);
    float _3094 = fma(_1737, _1813, _3044);
    float _3096 = fma(_1739, _1945, _3080);
    float _3098 = _3046 * _3056;
    float _3100 = fma(_1753, _1815, _3086);
    float _3102 = fma(_1753, _1813, _3092);
    float _3104 = _3082 * _3056;
    float _3106 = _3094 * _3056;
    float _3108 = fma(_1719, _1811, _3096);
    float _3110 = fma(_3084, _3068, _3098);
    float _3112 = fma(_3100, _3068, _3104);
    float _3114 = fma(_3102, _3068, _3106);
    float _3116 = fma(_3108, _3060, _3110);
    float _3118 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _3120 = _2523 <= 8000.0;
    bool _3122 = isnan(_2523);
    bool _3124 = _3120 || _3122;
    bool _3126 = isnan(8000.0);
    bool _3128 = _3124 || _3126;
    float _3130 = float(_3128);
    float _3132 = _2907 * 0.5;
    float _3134 = -_3034;
    float _3136 = _3134 + 1.0;
    float _3138 = _1759 * _1959;
    float _3140 = _1759 * _1963;
    float _3142 = exp2(_3118);
    float _3144 = fma(_1739, _1947, _3138);
    float _3146 = fma(_1739, _1941, _3140);
    bool _3148 = _2665 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3150 = isnan(_2665);
    bool _3152 = _3148 || _3150;
    bool _3154 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3156 = _3152 || _3154;
    float _3158 = fma(_1719, _1815, _3144);
    float _3160 = fma(_1719, _1813, _3146);
    float _3162 = fma(_2839, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3026);
    float _3164 = fma(_3158, _3060, _3112);
    float _3166 = fma(_3160, _3060, _3114);
    float _3168 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3162);
    float _3170 = fma(_3142, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3172 = precise::clamp(_3170, 0.0, 1.0);
    out.gl_Position.x = _2943;
    out.gl_Position.y = _2945;
    out.gl_Position.z = _3168;
    out.gl_Position.w = _2907;
    float _3174 = _2943 + _2907;
    float _3176 = fma(_3172, -2.0, 3.0);
    float _3178 = _3172 * _3172;
    out.m_81.x = _3116;
    out.m_81.y = _3164;
    out.m_81.z = _3166;
    float _3180 = _3174 * 0.5;
    float _3182 = _3178 * _3176;
    float _3184 = -_3182;
    float _3186 = _3184 + 1.0;
    float _3188 = fma(_3186, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3182);
    float _3190 = fma(_2945, -0.5, _3132);
    float _3192 = _3136 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3194 = _3168 + _2907;
    float _3196 = _3130 * _3188;
    float _3198 = _3194 * 0.5;
    float _3200 = _3196 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = _3180;
    out.m_83.y = _3190;
    out.m_83.z = _3198;
    out.m_83.w = _2907;
    float _3202 = _2579 * _2641;
    float _3204 = _2907;
    float _3206 = _3198;
    float _3208 = _3190;
    float _3210 = _3202;
    if (!_3156)
    {
        _3204 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3212 = _3204;
    float _3214 = _3212;
    float _3216 = _3212;
    if (!_3156)
    {
        _3206 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3218 = _3206;
    float _3220 = _3218;
    float _3222 = _3218;
    if (!_3156)
    {
        _3208 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3224 = _3208;
    float _3226 = -_2953;
    float _3228 = _3226 + 1.0;
    float _3230 = _3228 * _3200;
    float _3232 = precise::clamp(_3230, 0.0, 1.0);
    float _3234 = -_3232;
    float _3236 = fma(_3234, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3238 = _3236 * _3036;
    float _3240 = _3192 * _2969;
    float _3242 = -_3192;
    float _3244 = _3242 + 1.0;
    float _3246 = _3238 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3248 = _3238;
    float _3250 = _3244;
    float _3252 = _3224;
    float _3254 = _3224;
    if (!_3156)
    {
        _3248 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3256 = _3248;
    float _3258 = _2986 * _3240;
    float _3260 = _2986 * _3244;
    out.m_85.x = _3246;
    float _3262 = _3256;
    float _3264 = _3256;
    if (!_3156)
    {
        _3250 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3266 = _3250;
    float _3268 = _2996 * _3240;
    float _3270 = fma(_2992, _3258, _2980);
    float _3272 = fma(_2994, _3258, _2982);
    float _3274 = _3202 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3276 = fma(_2986, _3268, _2984);
    float _3278 = _3266;
    float _3280 = _3266;
    if (!_3156)
    {
        _3210 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3282 = _3210;
    out.m_87.x = _3270;
    out.m_87.y = _3272;
    out.m_87.z = _3276;
    out.m_87.w = _3260;
    bool _3284 = !_3156;
    float _3286 = _3282;
    float _3288 = _3282;
    if (!_3284)
    {
        bool _3290 = _2665 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3292 = isnan(_2665);
        bool _3294 = _3290 || _3292;
        bool _3296 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3298 = _3294 || _3296;
        if (!_3298)
        {
            float _3300 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3302 = _2665 + _3300;
            float _3304 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3306 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3304;
            float _3308 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3310 = _3308 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3312 = 1.0 / _3306;
            float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3316 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3320 = _3318 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3322 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3324 = _3322 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3326 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3328 = _3326 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3330 = _3302 * _3312;
            float _3332 = precise::clamp(_3330, 0.0, 1.0);
            float _3334 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3336 = _3334 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3338 = fma(_3332, _3310, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3340 = fma(_3332, _3336, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3342 = fma(_3332, _3316, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3344 = fma(_3332, _3320, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3346 = fma(_3332, _3324, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3348 = fma(_3332, _3328, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3280 = _3342;
            _3254 = _3346;
            _3264 = _3338;
            _3222 = _3344;
            _3216 = _3340;
            _3288 = _3348;
            _3350 = true;
        }
        else
        {
            bool _3352 = _2665 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3354 = isnan(_2665);
            bool _3356 = _3352 || _3354;
            bool _3358 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3360 = _3356 || _3358;
            if (!_3360)
            {
                _3262 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3362 = _3262;
            _3264 = _3362;
            if (!_3360)
            {
                _3278 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3364 = _3278;
            _3280 = _3364;
            if (!_3360)
            {
                _3214 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3366 = _3214;
            _3216 = _3366;
            if (!_3360)
            {
                _3220 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3368 = _3220;
            _3222 = _3368;
            if (!_3360)
            {
                _3252 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3370 = _3252;
            _3254 = _3370;
            if (!_3360)
            {
                _3286 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3372 = _3286;
            bool _3374 = !_3360;
            _3288 = _3372;
            if (!_3374)
            {
                bool _3376 = _2665 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3378 = isnan(_2665);
                bool _3380 = _3376 || _3378;
                bool _3382 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3384 = _3380 || _3382;
                if (!_3384)
                {
                    float _3386 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3388 = _2665 + _3386;
                    float _3390 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3392 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3390;
                    float _3394 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3396 = _3394 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3398 = 1.0 / _3392;
                    float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3402 = _3400 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3404 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3406 = _3404 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3408 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3410 = _3408 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3412 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3414 = _3412 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3416 = _3388 * _3398;
                    float _3418 = precise::clamp(_3416, 0.0, 1.0);
                    float _3420 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3422 = _3420 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3424 = fma(_3418, _3396, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3426 = fma(_3418, _3422, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3428 = fma(_3418, _3402, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3430 = fma(_3418, _3406, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3432 = fma(_3418, _3410, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3434 = fma(_3418, _3414, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3280 = _3428;
                    _3254 = _3432;
                    _3264 = _3424;
                    _3222 = _3430;
                    _3216 = _3426;
                    _3288 = _3434;
                    _3350 = true;
                }
                else
                {
                    _3280 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3254 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3264 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3222 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3216 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3288 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3350 = false;
    float _3436 = _3280;
    float _3438 = _3254;
    float _3440 = _3264;
    float _3442 = _3222;
    float _3444 = _3216;
    float _3446 = _3288;
    float _3448 = fma(_3164, -0.5, 0.5);
    float _3450 = precise::clamp(_3448, 0.0, 1.0);
    float _3452 = -_3436;
    float _3454 = _3452 + _3438;
    float _3456 = _3274 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3458 = -_3440;
    float _3460 = _3458 + _3442;
    float _3462 = fma(_3450, _3454, _3436);
    out.m_89.x = 0.0;
    float _3464 = -_3444;
    float _3466 = _3464 + _3446;
    float _3468 = fma(_3450, _3460, _3440);
    float _3470 = _3462 * 0.586610972881317138671875;
    out.m_51.x = _3456;
    bool _3472 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3474 = fma(_3450, _3466, _3444);
    float _3476 = fma(_3468, 0.298911988735198974609375, _3470);
    bool _3478 = _2579 > 0.0;
    bool _3480 = isnan(_2579);
    bool _3482 = _3478 || _3480;
    bool _3484 = isnan(0.0);
    bool _3486 = _3482 || _3484;
    float _3488 = fma(_3474, 0.114477999508380889892578125, _3476);
    bool _3490 = _2641 <= 0.0;
    bool _3492 = !_3486;
    bool _3494 = _3490 || _3492;
    float _3496 = -_3488;
    float _3498 = _3468 + _3496;
    float _3500 = -_3488;
    float _3502 = _3462 + _3500;
    float _3504 = -_3488;
    float _3506 = _3474 + _3504;
    float _3508 = fma(_3498, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3488);
    float _3510 = fma(_3502, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3488);
    float _3512 = fma(_3506, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3488);
    bool _3514 = !_3472;
    if (!_3514)
    {
        float _3516 = -_2507;
        float _3518 = _3516 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3520 = -_2509;
        float _3522 = _3520 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3524 = -_2511;
        float _3526 = _3524 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3528 = _3518 * _3518;
        float _3530 = fma(_3522, _3522, _3528);
        float _3532 = fma(_3526, _3526, _3530);
        float _3534 = sqrt(_3532);
        float _3536 = rsqrt(_3532);
        float _3538 = -_3534;
        float _3540 = _3538 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3542 = _3540 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3544 = precise::clamp(_3542, 0.0, 1.0);
        float _3546 = _3522 * _3536;
        float _3548 = _3518 * _3536;
        float _3550 = abs(_3544);
        float _3552 = log2(_3550);
        float _3554 = _3526 * _3536;
        float _3556 = _3546 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3558 = _3164 * _3548;
        float _3560 = -_3548;
        float _3562 = -_3556;
        float _3564 = fma(_3560, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3562);
        float _3566 = fma(_3116, _3546, _3558);
        float _3568 = -_3554;
        float _3570 = fma(_3568, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3564);
        float _3572 = fma(_3166, _3554, _3566);
        float _3574 = precise::clamp(_3572, 0.0, 1.0);
        float _3576 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3578 = _3570 + _3576;
        float _3580 = _3552 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3582 = _3578 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3584 = precise::clamp(_3582, 0.0, 1.0);
        float _3586 = exp2(_3580);
        float _3588 = _3586 * _3584;
        float _3590 = _3574 * _3588;
        float _3592 = _3590 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3594 = _3590 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3596 = _3590 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3592;
        out.m_89.y = _3594;
        out.m_89.z = _3596;
    }
    out.m_91.x = _3508;
    out.m_91.y = _3510;
    out.m_91.z = _3512;
    if (!_3494)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3598 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3598;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3350 = false;
    bool _434 = false;
    bool _336 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_114)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3654 = as_type<float>(_124);
        out.gl_Position.z = _3654;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_53.w;
    float _130 = float(_110);
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
    float _152 = _128;
    float _154 = _134;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _152;
    if (_150)
    {
        out.m_51.x = 0.0;
    }
    if (_150)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3719 = as_type<float>(_160);
        out.gl_Position.z = _3719;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _130;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _134 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _186;
    float _212;
    if (!_192)
    {
        float _196 = in.m_57.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _172;
    }
    _214 = false;
    float _216 = _212;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    float _222 = in.m_59.x;
    float _224 = in.m_59.y;
    float _226 = in.m_59.z;
    bool _228 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _230 = isnan(_216);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    bool _244 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _246 = isnan(_216);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -_238;
    float _258 = _256 + 1.0;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _260;
    float _264 = 1.0 / _242;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _268 = _254 * _258;
    float _270 = -_254;
    float _272 = _270 + 1.0;
    float _274 = _220 * _264;
    float _276 = fma(_262, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = _276 * _268;
    float _288 = fma(_280, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _290 = fma(_284, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _292 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].x, _286);
    float _294 = _288 * _268;
    float _296 = _290 * _268;
    float _298 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].x, _292);
    float _300 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].y, _294);
    float _302 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].z, _296);
    float _304 = _298 * _222;
    float _306 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].y, _300);
    float _308 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].z, _302);
    float _310 = _306 * _224;
    float _312 = _308 * _226;
    bool _314 = !_266;
    float _316 = _222;
    float _334;
    if (!_314)
    {
        float _318 = in.m_57.x;
        float _320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _322 = _318 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _326 = _324 * _320;
        float _328 = floor(_326);
        float _330 = -_328;
        float _332 = _326 + _330;
        _334 = _332;
        _336 = true;
    }
    else
    {
        _334 = _172;
    }
    _336 = false;
    float _338 = _334;
    bool _340 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _342 = isnan(_338);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _356 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _358 = isnan(_338);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _374 = _338 + _372;
    float _376 = -_350;
    float _378 = _376 + 1.0;
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _382 = 1.0 / _354;
    float _384 = _366 * _378;
    float _386 = -_366;
    float _388 = _386 + 1.0;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _392 = _370 * _382;
    float _394 = fma(_392, _374, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _398 = _394 * _384;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _402 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[115].x, _398);
    float _404 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[116].x, _402);
    float _406 = _400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _408 = _396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _410 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _412 = _404 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _406;
    out.m_61.y = _408;
    out.m_61.z = _410;
    out.m_61.w = _412;
    bool _414 = !_380;
    float _432;
    if (!_414)
    {
        float _416 = in.m_57.x;
        float _418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _420 = _416 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _422 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _424 = _422 * _418;
        float _426 = floor(_424);
        float _428 = -_426;
        float _430 = _424 + _428;
        _432 = _430;
        _434 = true;
    }
    else
    {
        _432 = _172;
    }
    _434 = false;
    float _436 = _432;
    float _438 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _440 = int(_438);
    float _442 = in.m_57.x;
    float _444 = in.m_57.y;
    float _446 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _448 = int(_446);
    bool _450 = _436 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _452 = isnan(_436);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    bool _462 = _436 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _464 = isnan(_436);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = float(_440);
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _478 = 1.0 / _474;
    float _480 = float(uint(_448));
    float _482 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[78].w, _476);
    int _484 = ~_448;
    int _486 = _484 + 1;
    int _488 = ~_448;
    int _490 = _488 + 1;
    float _492 = 1.0 / _480;
    bool _494 = _448 == 0;
    int _496 = ~_448;
    int _498 = _496 + 1;
    float _500 = _478 * _134;
    float _502 = trunc(_500);
    int _504 = int(_502);
    int _506 = as_type<int>(_492) + (-2);
    float _508 = float(uint(_504));
    float _510 = as_type<float>(_506) * _508;
    float _512 = trunc(_510);
    float _514 = precise::max(_512, 0.0);
    uint _517 = uint(_514);
    int _519 = _486 * int(_517);
    int _521 = _519 + _504;
    float _523 = float(_448);
    float _525 = float(uint(_521));
    float _527 = as_type<float>(_506) * _525;
    float _529 = trunc(_527);
    float _531 = precise::max(_529, 0.0);
    uint _533 = uint(_531);
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _537 = _535 != 0;
    bool _539 = !_537;
    float _541 = _539 ? 7.345489978790283203125 : 1.0;
    float _543 = _541 * _442;
    int _545 = int(_517) + int(_533);
    float _547 = float(_504);
    float _549 = floor(_543);
    int _551 = _490 * _545;
    int _553 = _551 + _504;
    bool _555 = _547 >= _523;
    bool _557 = isnan(_547);
    bool _559 = _555 || _557;
    bool _561 = isnan(_523);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    bool _567 = uint(_553) >= uint(_448);
    float _569 = trunc(_565);
    int _571 = int(_569);
    bool _573 = !_567;
    int _575 = _573 ? 0 : (-1);
    int _577 = ~_545;
    int _579 = _577 + _575;
    int _581 = _579 + 1;
    float _583 = -_549;
    float _585 = _543 + _583;
    int _587 = _448 * _581;
    int _589 = _587 + _504;
    float _591 = _585 * _523;
    int _593 = ~_571;
    int _595 = _593 + 1;
    int _597 = _595 + 1;
    float _599 = trunc(_591);
    int _601 = int(_599);
    bool _603 = !_494;
    int _605 = _603 ? _589 : (-1);
    int _607 = _605 * _597;
    float _609 = _523 * _134;
    int _611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _613 = _611 != 0;
    int _615 = _448 + (-1);
    float _617 = _609 * _168;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _621 = _619 != 0;
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _625 = _623 != 0;
    int _627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _629 = _627 != 0;
    bool _631 = !_613;
    int _633 = _631 ? 0 : 1;
    int _635 = _571 * _615;
    int _637 = _635 + _607;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _641 = _639 != 0;
    float _643 = trunc(_617);
    int _645 = int(_643);
    bool _647 = !_625;
    int _649 = _647 ? 0 : 1;
    bool _651 = !_621;
    int _653 = _651 ? 0 : 1;
    int _655 = abs(_649);
    bool _657 = !_629;
    int _659 = _657 ? 0 : 1;
    int _661 = abs(_653);
    bool _663 = !_641;
    int _665 = _663 ? 0 : 1;
    int _667 = abs(_633);
    int _669 = abs(_659);
    int _671 = _637 * _655;
    int _673 = abs(_665);
    int _675 = _601 * _667;
    int _677 = _675 + _504;
    int _679 = _645 * _661;
    int _681 = _679 + _671;
    float _683 = in.m_63.z;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _687 = _685 != 0;
    int _689 = _677 * _669;
    int _691 = _689 + _681;
    int _693 = ~_448;
    int _695 = _693 + 1;
    float _697 = in.m_63.y;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _701 = _699 != 0;
    int _703 = _601 * _673;
    int _705 = _703 + _691;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _709 = _707 != 0;
    float _711 = in.m_65.x;
    float _713 = float(uint(_705));
    float _715 = 0.0;
    if (_687)
    {
        float _717 = in.m_57.x;
        _715 = _717;
    }
    float _719 = _715;
    float _721 = as_type<float>(_506) * _713;
    float _723 = trunc(_721);
    float _725 = precise::max(_723, 0.0);
    uint _727 = uint(_725);
    out.m_67.z = _683;
    out.m_67.y = _697;
    int _729 = ~_448;
    int _731 = _729 + 1;
    float _733 = in.m_65.y;
    float _735 = _733;
    if (_687)
    {
        _316 = _711;
    }
    float _737 = _316;
    int _739 = _695 * int(_727);
    int _741 = _739 + _705;
    bool _743 = _719 > 0.5;
    bool _745 = _743 && _687;
    float _747 = float(uint(_741));
    float _749 = in.m_63.x;
    float _751 = as_type<float>(_506) * _747;
    float _753 = trunc(_751);
    float _755 = precise::max(_753, 0.0);
    uint _757 = uint(_755);
    float _759 = _737;
    if (_745)
    {
        float _761 = -_737;
        float _763 = _761 + 1.0;
        _759 = _763;
    }
    float _765 = _759;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _769 = int(_727) + int(_757);
    out.m_67.x = _749;
    int _771 = _498 * _769;
    int _773 = _771 + _705;
    float _775 = in.m_63.w;
    bool _777 = uint(_773) >= uint(_448);
    float _779 = float(uint(_677));
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _783 = !_777;
    int _785 = _783 ? 0 : (-1);
    bool _787 = _444 > 0.5;
    float _789 = as_type<float>(_506) * _779;
    int _791 = ~_769;
    int _793 = _791 + _785;
    int _795 = _793 + 1;
    float _797 = -_733;
    float _799 = _797 + 1.0;
    float _801 = trunc(_789);
    float _803 = precise::max(_801, 0.0);
    uint _805 = uint(_803);
    int _807 = _448 * _795;
    int _809 = _807 + _705;
    if (_701)
    {
        float _811 = _787 ? _799 : _733;
        _735 = _811;
    }
    float _813 = _735;
    float _815 = _444 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _817 = !_494;
    int _819 = _817 ? _809 : (-1);
    float _821 = fma(_815, -2.0, _781);
    out.m_67.w = _775;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _827 = _819 >> 31;
    int _829 = _819 & 3;
    bool _831 = _829 != 0;
    float _833 = 1.0 / _825;
    int _835 = _819 & 3;
    bool _837 = _835 != 0;
    int _839 = _731 * int(_805);
    int _841 = _839 + _677;
    float _843 = _442 * 2.0;
    bool _845 = uint(_829) > 1u;
    float _847 = float(uint(_841));
    float _849 = -_767;
    float _851 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[77].x, _849);
    int _853 = _827 & 3;
    float _855 = floor(_843);
    float _857 = as_type<float>(_506) * _847;
    int _859 = _819 + _853;
    float _861 = in.m_57.z;
    int _863 = _859 >> 2;
    float _865 = trunc(_857);
    float _867 = precise::max(_865, 0.0);
    uint _869 = uint(_867);
    float _871 = _843;
    if (!_687)
    {
        _871 = _711;
    }
    float _873 = _871;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _875;
    int _879 = _863 << 4;
    int _881 = _879 + 368;
    int _883 = _837 ? 0 : 1;
    float _885 = _877 * _833;
    uint _887 = uint(int(uint(_881) >> uint(2)));
    uint _889 = uint(int(uint(int(_887)) >> uint(2)));
    int _891 = int(_887) & 3;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[int(_889)][_891];
    int _895 = int(_887) + 1;
    uint _897 = uint(int(uint(_895) >> uint(2)));
    int _899 = _895 & 3;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[int(_897)][_899];
    bool _903 = _855 > 0.0;
    float _905 = _444 * 2.0;
    bool _907 = _855 >= 0.0;
    bool _909 = isnan(_855);
    bool _911 = _907 || _909;
    bool _913 = isnan(0.0);
    bool _915 = _911 || _913;
    float _917 = _873;
    if (_687)
    {
        _917 = _765;
    }
    float _919 = _917;
    float _921 = floor(_905);
    bool _923 = _829 != 3;
    int _925 = int(_805) + int(_869);
    int _927 = _881 + 8;
    uint _929 = uint(int(uint(_927) >> uint(2)));
    uint _931 = uint(int(uint(int(_929)) >> uint(2)));
    int _933 = int(_929) & 3;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[int(_931)][_933];
    int _937 = int(_929) + 1;
    uint _939 = uint(int(uint(_937) >> uint(2)));
    int _941 = _937 & 3;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[int(_939)][_941];
    int _945 = ~_883;
    int _947 = _945 + 1;
    int _949 = _947 + 1;
    float _951 = _444 + _861;
    int _953 = _949;
    if (!_845)
    {
        int _955 = ~_883;
        int _957 = _955 + 1;
        _953 = _957;
    }
    int _959 = _953;
    float _961 = _444 + _442;
    bool _963 = uint(_829) >= 2u;
    float _965 = _951 + (-1.0);
    int _967 = ~_448;
    int _969 = _967 + 1;
    float _971 = _961 + (-1.0);
    int _973 = _963 ? 0 : 1;
    float _975 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _977 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _979 = int(_977);
    float _981 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _983 = ~_973;
    int _985 = _983 + 1;
    int _987 = _985 + 1;
    int _989 = _969 * _925;
    int _991 = _989 + _677;
    int _993 = _987;
    if (_923)
    {
        int _995 = ~_973;
        int _997 = _995 + 1;
        _993 = _997;
    }
    int _999 = _993;
    int _1001 = abs(_959);
    bool _1003 = _829 != 3;
    bool _1005 = !_831;
    int _1007 = _1005 ? 0 : 1;
    int _1009 = abs(_1007);
    int _1011 = ~_1001;
    int _1013 = _1011 + 1;
    int _1015 = _1013 + 1;
    int _1017 = ~_1009;
    int _1019 = _1017 + 1;
    int _1021 = _1019 + 1;
    int _1023 = abs(_999);
    bool _1025 = uint(_991) >= uint(_448);
    bool _1027 = !_1003;
    int _1029 = _1027 ? 0 : (-1);
    int _1031 = _1015 * as_type<int>(_901);
    bool _1033 = !_709;
    int _1035 = _1033 ? 0 : 1;
    float _1037 = _861 * 2.0;
    bool _1039 = _921 > 0.0;
    int _1041 = _1021 * as_type<int>(_893);
    int _1043 = _1041 + _1031;
    bool _1045 = _921 >= 0.0;
    bool _1047 = isnan(_921);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan(0.0);
    bool _1053 = _1049 || _1051;
    float _1055 = floor(_1037);
    bool _1057 = !_1025;
    int _1059 = _1057 ? 0 : (-1);
    int _1061 = abs(_1029);
    int _1063 = ~_1023;
    int _1065 = _1063 + 1;
    int _1067 = _1065 + 1;
    int _1069 = ~_925;
    int _1071 = _1069 + _1059;
    int _1073 = _1071 + 1;
    int _1075 = abs(_1035);
    int _1077 = _1067 * as_type<int>(_935);
    int _1079 = _1077 + _1043;
    int _1081 = ~_1061;
    int _1083 = _1081 + 1;
    int _1085 = _1083 + 1;
    int _1087 = _448 * _1073;
    int _1089 = _1087 + _677;
    int _1091 = _915 ? 0 : 1;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1095 = _1093 != 0;
    int _1097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1099 = _1097 != 0;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1103 = _1101 != 0;
    int _1105 = _1085 * as_type<int>(_943);
    int _1107 = _1105 + _1079;
    float _1109 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1111 = log2(_1109);
    int _1113 = ~_1075;
    int _1115 = _1113 + 1;
    int _1117 = _1115 + 1;
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1121 = _436 + _1119;
    float _1123 = float(uint(_979));
    int _1125 = abs(_979);
    int _1127 = _1107 * _1117;
    bool _1129 = !_494;
    int _1131 = _1129 ? _1089 : (-1);
    float _1133 = 1.0 / _1123;
    float _1135 = float(uint(_1125));
    int _1137 = _1131 * _1075;
    int _1139 = _1137 + _1127;
    int _1141 = ~_1091;
    int _1143 = _1141 + 1;
    int _1145 = _1143 + 1;
    int _1147 = _1145;
    if (!_903)
    {
        int _1149 = ~_1091;
        int _1151 = _1149 + 1;
        _1147 = _1151;
    }
    int _1153 = _1147;
    float _1155 = _1111 * _134;
    float _1157 = 1.0 / _1135;
    bool _1159 = _1055 > 0.0;
    bool _1161 = _1055 >= 0.0;
    bool _1163 = isnan(_1055);
    bool _1165 = _1161 || _1163;
    bool _1167 = isnan(0.0);
    bool _1169 = _1165 || _1167;
    float _1171 = fma(_885, _1121, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1173 = float(uint(_1139));
    int _1175 = abs(_1139);
    float _1177 = exp2(_1155);
    int _1179 = as_type<int>(_1133) + (-2);
    float _1181 = in.m_48.x;
    float _1183 = in.m_48.y;
    float _1185 = in.m_48.z;
    float _1187 = float(uint(_1175));
    float _1189 = as_type<float>(_1179) * _1173;
    float _1191 = in.m_69.y;
    int _1193 = as_type<int>(_1157) + (-2);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1197 = 1.0 + _1195;
    int _1199 = _1169 ? 0 : 1;
    float _1201 = trunc(_1189);
    float _1203 = precise::max(_1201, 0.0);
    uint _1205 = uint(_1203);
    bool _1207 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1209 = isnan(0.0);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1215 = _1211 || _1213;
    float _1217 = as_type<float>(_1193) * _1187;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1221 = -_1177;
    float _1223 = _1221 + 1.0;
    int _1225 = ~_979;
    int _1227 = _1225 + 1;
    float _1229 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _482);
    int _1231 = _1053 ? 0 : 1;
    float _1233 = trunc(_1217);
    float _1235 = precise::max(_1233, 0.0);
    uint _1237 = uint(_1235);
    float _1239 = _1215 ? _1223 : 0.0;
    float _1241 = -_472;
    float _1243 = _1241 + 1.0;
    bool _1245 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1247 = isnan(1.0);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1253 = _1249 || _1251;
    float _1255 = _460 * _1243;
    float _1257 = -_134;
    float _1259 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[76].x, _851);
    float _1261 = 1.0 / _1197;
    int _1263 = ~_1125;
    int _1265 = _1263 + 1;
    float _1267 = _1171 * _1255;
    int _1269 = ~_1199;
    int _1271 = _1269 + 1;
    int _1273 = _1271 + 1;
    float _1275 = _1183 + _1191;
    int _1277 = _1273;
    float _1279 = as_type<float>(_1205);
    if (!_1159)
    {
        int _1281 = ~_1199;
        int _1283 = _1281 + 1;
        _1277 = _1283;
    }
    int _1285 = _1277;
    float _1287 = _1183 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1289 = _1265 * int(_1237);
    int _1291 = _1289 + _1175;
    float _1293 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1219);
    float _1295 = fma(_1181, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1287);
    float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1299 = _1275 + _1297;
    float _1301 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1293);
    float _1303 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _821);
    int _1305 = _1227 * int(_1205);
    int _1307 = _1305 + _1139;
    if (_1253)
    {
        float _1309 = _1239 * _1261;
        _154 = _1309;
    }
    float _1311 = _154;
    float _1313 = -_460;
    float _1315 = _1313 + 1.0;
    float _1317 = float(uint(_1291));
    float _1319 = fma(_1185, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1295);
    float _1321 = float(uint(_1307));
    float _1323 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1267);
    bool _1325 = !_1099;
    int _1327 = _1325 ? 0 : 1;
    float _1329 = as_type<float>(_1193) * _1317;
    float _1331 = _1319 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1333 = as_type<float>(_1179) * _1321;
    float _1335 = _1183 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1337 = !_1095;
    int _1339 = _1337 ? 0 : 1;
    float _1341 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1343 = abs(_1327);
    float _1345 = fma(_1181, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1335);
    float _1347 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1349 = _1331 + _1347;
    float _1351 = in.m_71.x;
    float _1353 = in.m_71.y;
    float _1355 = in.m_71.z;
    int _1357 = abs(_1339);
    float _1359 = fma(_1185, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1345);
    float _1361 = trunc(_1329);
    float _1363 = precise::max(_1361, 0.0);
    uint _1365 = uint(_1363);
    float _1367 = fma(_1349, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1341);
    float _1369 = float(_1357);
    float _1371 = _1359 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1373 = float(_1285);
    float _1375 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1323);
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1379 = _1371 + _1377;
    float _1381 = trunc(_1333);
    float _1383 = precise::max(_1381, 0.0);
    uint _1385 = uint(_1383);
    float _1387 = _1369 * _1373;
    int _1389 = ~_1125;
    int _1391 = _1389 + 1;
    float _1393 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1367);
    float _1395 = float(_1153);
    float _1397 = _1387 * (-2.0);
    float _1399 = float(_1343);
    bool _1401 = _1393 >= 0.0;
    int _1403 = int(_1237) + int(_1365);
    float _1405 = _1399 * _1395;
    float _1407 = fma(_1397, _1351, _1351);
    int _1409 = ~_979;
    int _1411 = _1409 + 1;
    float _1413 = _1405 * (-2.0);
    int _1415 = int(_1205) + int(_1385);
    int _1417 = _1391 * _1403;
    int _1419 = _1417 + _1175;
    float _1421 = _1299 * _1299;
    int _1423 = ~_1231;
    int _1425 = _1423 + 1;
    int _1427 = _1425 + 1;
    float _1429 = fma(_981, _1397, _981);
    int _1431 = _1427;
    if (_1401)
    {
        _1279 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1433 = _1279;
    int _1435 = _1411 * _1415;
    int _1437 = _1435 + _1139;
    int _1439 = as_type<int>(_1433);
    if (!_1039)
    {
        int _1441 = ~_1231;
        int _1443 = _1441 + 1;
        _1431 = _1443;
    }
    int _1445 = _1431;
    float _1447 = fma(_1349, _1349, _1421);
    bool _1449 = uint(_1419) >= uint(_1125);
    int _1451 = _1139 ^ _979;
    if (_1401)
    {
        float _1453 = _1433 * 5.0;
        _1439 = as_type<int>(_1453);
    }
    int _1455 = _1439;
    bool _1457 = uint(_1437) >= uint(_979);
    float _1459 = fma(_1379, _1379, _1447);
    bool _1461 = !_1449;
    int _1463 = _1461 ? 0 : (-1);
    float _1465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _1467 = uint(int(uint(_1451) >> uint(31)));
    if (_1401)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5632 = as_type<float>(_1455);
        out.gl_Position.z = _5632;
    }
    bool _1469 = !_1457;
    int _1471 = _1469 ? 0 : (-1);
    float _1473 = fma(_975, _1413, _975);
    int _1475 = ~_1463;
    int _1477 = _1403 + _1475;
    int _1479 = _1477 + 1;
    float _1481 = _442 + (-0.5);
    int _1483 = ~_1415;
    int _1485 = _1483 + _1471;
    int _1487 = _1485 + 1;
    float _1489 = rsqrt(_1459);
    bool _1491 = _979 == 0;
    float _1493 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1407);
    bool _1495 = _979 == 0;
    if (_1401)
    {
        out.m_51.x = 0.0;
    }
    float _1497 = fma(_1413, _1353, _1353);
    int _1499 = ~int(_1467);
    int _1501 = _1499 + 1;
    int _1503 = _979 * _1487;
    int _1505 = _1503 + _1139;
    float _1507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1509 = _1465 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1511 = _1479 ^ _1501;
    float _1513 = fma(_1429, _1311, _1493);
    bool _1515 = !_1491;
    int _1517 = _1515 ? _1505 : (-1);
    float _1519 = fma(_1509, _919, -0.5);
    int _1521 = ~_1501;
    int _1523 = _1521 + _1511;
    int _1525 = _1523 + 1;
    float _1527 = float(_1517);
    float _1529 = _1299 * _1489;
    bool _1531 = !_1495;
    int _1533 = _1531 ? _1525 : (-1);
    float _1535 = _1349 * _1489;
    float _1537 = fma(_1509, _1527, _1259);
    float _1539 = float(_1533);
    float _1541 = -_1529;
    float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1299);
    float _1545 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1547 = fma(_1301, _1519, _1537);
    float _1549 = -_1535;
    float _1551 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1349);
    float _1553 = _1543 * _1543;
    float _1555 = fma(_1545, _813, -0.5);
    float _1557 = -_1303;
    float _1559 = fma(_1545, _1539, _1557);
    float _1561 = fma(_1551, _1551, _1553);
    float _1563 = fma(_1229, _1555, _1559);
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1567 = _1379 * _1489;
    float _1569 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1571 = _1547 + 0.5;
    float _1573 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1575 = _1565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1577 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1579 = _1563 + 0.5;
    float _1581 = _1573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1583 = _1375 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1585 = -_1567;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1379);
    bool _1589 = !_1103;
    int _1591 = _1589 ? 0 : 1;
    out.m_73.x = _1571;
    out.m_73.y = _1579;
    float _1593 = fma(_1587, _1587, _1561);
    int _1595 = abs(_1591);
    out.m_75.x = _1575;
    out.m_75.y = _1577;
    out.m_75.z = _1581;
    out.m_75.w = _1583;
    float _1597 = _1535;
    float _1599 = _1529;
    if (_1401)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1601 = -_1529;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1275);
    float _1605 = _444 + (-0.5);
    float _1607 = -_1535;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1331);
    float _1611 = float(_1445);
    float _1613 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1615 = _1603 + _1613;
    float _1617 = float(_1595);
    float _1619 = -_1567;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1371);
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1625 = _1609 + _1623;
    float _1627 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1629 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1497);
    float _1631 = _1617 * _1611;
    float _1633 = _861 + _442;
    float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1637 = _1621 + _1635;
    float _1639 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1627);
    float _1641 = fma(_1473, _1311, _1629);
    float _1643 = _1633 + (-1.0);
    float _1645 = _1631 * (-2.0);
    float _1647 = fma(_1637, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1639);
    float _1649 = _861 + (-0.5);
    float _1651 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1653 = fma(_1645, _1355, _1355);
    float _1655 = _1513 * 0.15915493667125701904296875;
    bool _1657 = _1647 >= 0.0;
    float _1659 = fma(_1651, _1645, _1651);
    float _1661 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1653);
    float _1663 = _1641 * 0.15915493667125701904296875;
    float _1665 = _1655 * 6.283185482025146484375;
    float _1667 = sin(_1665);
    float _1669 = fma(_1659, _1311, _1661);
    float _1671 = _1669 * 0.15915493667125701904296875;
    float _1673 = _1655 * 6.283185482025146484375;
    float _1675 = cos(_1673);
    float _1677 = _1653;
    float _1679 = _1637;
    if (_1657)
    {
        _1677 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1681 = _1677;
    int _1683 = as_type<int>(_1681);
    if (_1657)
    {
        out.m_51.x = 0.0;
    }
    if (_1657)
    {
        float _1685 = _1681 * 5.0;
        _1683 = as_type<int>(_1685);
    }
    int _1687 = _1683;
    float _1689 = sqrt(_1593);
    if (_1657)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6005 = as_type<float>(_1687);
        out.gl_Position.z = _6005;
    }
    float _1691 = _1663 * 6.283185482025146484375;
    float _1693 = sin(_1691);
    float _1695 = _1663 * 6.283185482025146484375;
    float _1697 = cos(_1695);
    float _1699 = _1671 * 6.283185482025146484375;
    float _1701 = sin(_1699);
    if (_1657)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1703 = _1671 * 6.283185482025146484375;
    float _1705 = cos(_1703);
    float _1707 = _1667 * _1693;
    float _1709 = _1675 * _1697;
    float _1711 = _1489 * _1689;
    float _1713 = _1667 * _1697;
    float _1715 = _1183 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1717 = fma(_1701, _1709, _1707);
    float _1719 = fma(_1701, _1707, _1709);
    float _1721 = _1675 * _1693;
    float _1723 = in.m_77.x;
    float _1725 = in.m_77.y;
    float _1727 = in.m_77.z;
    float _1729 = _310 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1731 = _1711 * _1729;
    float _1733 = _1675 * _1705;
    float _1735 = _1697 * _1705;
    float _1737 = _1667 * _1705;
    float _1739 = _1693 * _1705;
    float _1741 = -_1331;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1745 = -_1275;
    float _1747 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1749 = fma(_1181, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1715);
    float _1751 = -_1721;
    float _1753 = fma(_1701, _1713, _1751);
    float _1755 = _1743 * _1743;
    float _1757 = -_1713;
    float _1759 = fma(_1701, _1721, _1757);
    float _1761 = -_1371;
    float _1763 = _1761 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1765 = fma(_1185, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1749);
    float _1767 = fma(_1747, _1747, _1755);
    float _1769 = _304 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1771 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1773 = fma(_1763, _1763, _1767);
    float _1775 = _1765 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1777 = _1711 * _1769;
    float _1779 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1725);
    float _1781 = rsqrt(_1773);
    float _1783 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1771);
    float _1785 = -_1775;
    float _1787 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1789 = _1779 * _1731;
    float _1791 = _312 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1793 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1723);
    float _1795 = fma(_1787, _1787, _1755);
    float _1797 = _1711 * _1791;
    float _1799 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1801 = _1793 * _1777;
    float _1803 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1783);
    float _1805 = fma(_1763, _1763, _1795);
    float _1807 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1799);
    float _1809 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1727);
    float _1811 = _1743 * _1781;
    float _1813 = _1763 * _1781;
    float _1815 = _1747 * _1781;
    float _1817 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1807);
    float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1821 = _1811 * _1819;
    float _1823 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1825 = _1813 * _1823;
    float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1829 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1827;
    float _1831 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1835 = -_1821;
    float _1837 = fma(_1813, _1833, _1835);
    float _1839 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1841 = _1815 * _1839;
    float _1843 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1845 = -_1825;
    float _1847 = fma(_1815, _1843, _1845);
    float _1849 = _1817 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1851 = _1837 * _1837;
    float _1853 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1855 = -_1841;
    float _1857 = fma(_1811, _1853, _1855);
    float _1859 = -_1849;
    float _1861 = _1831 + _1859;
    float _1863 = fma(_1847, _1847, _1851);
    float _1865 = sqrt(_1805);
    float _1867 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1869 = _1809 * _1797;
    float _1871 = fma(_1857, _1857, _1863);
    float _1873 = abs(_1861);
    float _1875 = precise::max(_1873, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1877 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1867);
    float _1879 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1881 = 1.0 / _1829;
    float _1883 = precise::min(_1875, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    bool _1885 = _1849 >= _1831;
    bool _1887 = isnan(_1849);
    bool _1889 = _1885 || _1887;
    bool _1891 = isnan(_1831);
    bool _1893 = _1889 || _1891;
    float _1895 = -_1789;
    float _1897 = _1701 * _1895;
    float _1899 = _1733 * _1789;
    float _1901 = _1737 * _1789;
    float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1905 = _1883 + _1903;
    float _1907 = rsqrt(_1871);
    float _1909 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1877);
    float _1911 = fma(_1735, _1801, _1897);
    float _1913 = fma(_1717, _1801, _1899);
    float _1915 = fma(_1753, _1801, _1901);
    float _1917 = abs(_1865);
    float _1919 = precise::max(0.0, _1917);
    bool _1921 = !_1893;
    float _1923 = _1921 ? 1.0 : (-1.0);
    float _1925 = _1905 * _1881;
    float _1927 = precise::min(_1919, 40.0);
    float _1929 = _172 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1931 = rsqrt(_1909);
    float _1933 = _1923 * _1925;
    float _1935 = fma(_1739, _1869, _1911);
    float _1937 = fma(_1927, -0.02500000037252902984619140625, 1.0);
    float _1939 = fma(_1759, _1869, _1913);
    float _1941 = _1857 * _1907;
    float _1943 = _1929 * _1933;
    float _1945 = _1847 * _1907;
    float _1947 = _1837 * _1907;
    float _1949 = _1811 * _1941;
    float _1951 = fma(_1719, _1869, _1915);
    float _1953 = _1815 * _1945;
    float _1955 = _1813 * _1947;
    float _1957 = -_1949;
    float _1959 = fma(_1813, _1945, _1957);
    float _1961 = -_1953;
    float _1963 = fma(_1811, _1947, _1961);
    float _1965 = -_1955;
    float _1967 = fma(_1815, _1941, _1965);
    float _1969 = _1959 * _1939;
    float _1971 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1973 = _1963 * _1939;
    float _1975 = _1967 * _1939;
    float _1977 = fma(_1947, _1935, _1969);
    float _1979 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1981 = _1971 * _1971;
    float _1983 = fma(_1945, _1935, _1975);
    float _1985 = fma(_1815, _1951, _1977);
    float _1987 = fma(_1941, _1935, _1973);
    float _1989 = _1931 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1991 = fma(_1811, _1951, _1983);
    float _1993 = _1275 + _1985;
    float _1995 = _1943 * 0.15915493667125701904296875;
    float _1997 = fma(_1979, _1979, _1981);
    float _1999 = _1331 + _1991;
    float _2001 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2003 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2005 = fma(_1813, _1951, _1987);
    float _2007 = _1993 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2009 = fma(_1989, _1989, _1997);
    float _2011 = fma(_1999, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2001);
    float _2013 = fma(_1999, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2003);
    float _2015 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1879);
    float _2017 = _1371 + _2005;
    float _2019 = fma(_1999, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2007);
    float _2021 = rsqrt(_2009);
    float _2023 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2015);
    float _2025 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2013);
    float _2027 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2019);
    float _2029 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2011);
    float _2031 = _2023 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2033 = _2025 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2035 = _2027 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2037 = _1995 * 6.283185482025146484375;
    float _2039 = cos(_2037);
    float _2041 = _2029 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2043 = -_2033;
    float _2045 = _2043 + _2031;
    float _2047 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[12].y;
    float _2049 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[13].y;
    float _2051 = _2035 * (*spvDescriptorSet0.vp_c8)._m0[14].y;
    float _2053 = fma(_1937, _2045, _2033);
    float _2055 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[12].x, _2047);
    float _2057 = _1995 * 6.283185482025146484375;
    float _2059 = sin(_2057);
    float _2061 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[13].x, _2049);
    float _2063 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[14].x, _2051);
    float _2065 = _1989 * _2021;
    float _2067 = _1979 * _2021;
    float _2069 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[13].z, _2061);
    float _2071 = _1971 * _2021;
    float _2073 = _2065 * _2065;
    float _2075 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[12].z, _2055);
    float _2077 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[14].z, _2063);
    float _2079 = -_2039;
    float _2081 = _2079 + 1.0;
    float _2083 = _2069 + (*spvDescriptorSet0.vp_c8)._m0[13].w;
    float _2085 = _2075 + (*spvDescriptorSet0.vp_c8)._m0[12].w;
    float _2087 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2089 = _2087 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _2091 = _2071 * _2081;
    float _2093 = _2067 * _2059;
    float _2095 = _2071 * _2059;
    float _2097 = _2065 * _2059;
    float _2099 = fma(_2081, _2073, _2039);
    float _2101 = _2067 * _2081;
    float _2103 = fma(_2065, _2091, _2093);
    float _2105 = -_1775;
    float _2107 = _2105 + _2083;
    float _2109 = -_1331;
    float _2111 = _2109 + _2085;
    float _2113 = -_2097;
    float _2115 = fma(_2071, _2101, _2113);
    float _2117 = -_2095;
    float _2119 = fma(_2065, _2101, _2117);
    float _2121 = _2103 * _2107;
    float _2123 = _2077 + (*spvDescriptorSet0.vp_c8)._m0[14].w;
    float _2125 = fma(_2067, _2101, _2039);
    float _2127 = _2115 * _2107;
    float _2129 = fma(_2119, _2111, _2121);
    float _2131 = -_1371;
    float _2133 = _2131 + _2123;
    float _2135 = fma(_172, _2089, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _2137 = fma(_2125, _2111, _2127);
    float _2139 = fma(_2065, _2101, _2095);
    float _2141 = fma(_2099, _2133, _2129);
    float _2143 = -_2093;
    float _2145 = fma(_2065, _2091, _2143);
    float _2147 = fma(_2139, _2133, _2137);
    float _2149 = fma(_2141, _2135, _1371);
    float _2151 = fma(_2147, _2135, _1331);
    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2155 = _2149 + _2153;
    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2159 = _2151 + _2157;
    float _2161 = _2155 * _2155;
    float _2163 = fma(_2159, _2159, _2161);
    float _2165 = sqrt(_2163);
    bool _2167 = _2165 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2171 = _2165 + _2169;
    float _2173 = _2121;
    float _2175 = _2163;
    float _2177 = _2039;
    float _2179 = _1775;
    float _2181 = _2151;
    float _2183 = _2149;
    if (_2167)
    {
        float _2185 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2173 = _2185;
    }
    float _2187 = _2173;
    if (_2167)
    {
        float _2189 = rsqrt(_2163);
        _2175 = _2189;
    }
    float _2191 = _2175;
    float _2193 = _2187;
    if (_2167)
    {
        float _2195 = _2171 * _2187;
        _2193 = _2195;
    }
    float _2197 = _2193;
    float _2199 = fma(_2071, _2091, _2039);
    float _2201 = fma(_2071, _2101, _2097);
    if (_2167)
    {
        float _2203 = _2197 * 0.15915493667125701904296875;
        _2177 = _2203;
    }
    float _2205 = _2177;
    float _2207 = _2199 * _2107;
    float _2209 = _2097;
    if (_2167)
    {
        float _2211 = _2205 * 6.283185482025146484375;
        float _2213 = sin(_2211);
        _2209 = _2213;
    }
    float _2215 = _2209;
    float _2217 = fma(_2201, _2111, _2207);
    float _2219 = fma(_2145, _2133, _2217);
    float _2221 = _1775 + _2219;
    float _2223 = _2221;
    if (_2167)
    {
        float _2225 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2179 = _2225;
    }
    float _2227 = _2179;
    float _2229 = _2227;
    if (_2167)
    {
        float _2231 = fma(_2215, _2227, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2229 = _2231;
    }
    float _2233 = _2229;
    float _2235 = _2233;
    if (_2167)
    {
        float _2237 = _2191 * _2233;
        _2235 = _2237;
    }
    float _2239 = _2235;
    if (_2167)
    {
        float _2241 = fma(_2159, _2239, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _2181 = _2241;
    }
    float _2243 = _2181;
    float _2245 = _2243;
    if (_2167)
    {
        float _2247 = fma(_2155, _2239, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2183 = _2247;
    }
    float _2249 = _2183;
    float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2253 = _2243 + _2251;
    float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2257 = _2249 + _2255;
    float _2259 = fma(_2253, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2261 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6967 = float2(_2259, _2261);
    float _2263 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6967, float2(0.0), isnan(_6967)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6967, float2(0.0), isnan(_6967)), level(0.0)).x;
    float _2265 = _2205;
    float _2267 = _2253;
    float _2269 = _2249;
    if (_2167)
    {
        float _2271 = _2205 * 6.283185482025146484375;
        float _2273 = cos(_2271);
        _2265 = _2273;
    }
    float _2275 = _2265;
    float _2277 = -_1371;
    float _2279 = _2277 + _2249;
    if (_2167)
    {
        float _2281 = _2275 + (-1.0);
        _2267 = _2281;
    }
    float _2283 = _2267;
    float _2285 = _2283;
    if (_2167)
    {
        float _2287 = _2283 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2285 = _2287;
    }
    float _2289 = _2285;
    if (_2167)
    {
        float _2291 = fma(_2221, _2275, _2289);
        _2223 = _2291;
    }
    float _2293 = _2223;
    float _2295 = -_1331;
    float _2297 = _2295 + _2243;
    float _2299 = fma(_2263, 100.0, _1275);
    float _2301 = -_1275;
    float _2303 = _2301 + _2293;
    float _2305 = fma(_2263, 100.0, _2293);
    float _2307 = -_1529;
    float _2309 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2299);
    float _2311 = _2303 * _2303;
    float _2313 = _2309 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2315 = fma(_2297, _2297, _2311);
    float _2317 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2313);
    float _2319 = fma(_2279, _2279, _2315);
    float _2321 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2317);
    float _2323 = sqrt(_2319);
    float _2325 = _2321 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2327 = _2309 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2329 = 1.0 / _2325;
    float _2331 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2327);
    float _2333 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2331);
    bool _2335 = _2323 > 0.0;
    float _2337 = _2333 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2339 = _2337 + _2325;
    float _2341 = _2339 * _2329;
    float _2343 = _2341 * 0.5;
    bool _2345 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2347 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2349 = _2345 || _2347;
    bool _2351 = isnan(0.5);
    bool _2353 = _2349 || _2351;
    float _2355 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2357 = fma(_2343, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2355);
    bool _2359 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2361 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan(0.5);
    bool _2367 = _2363 || _2365;
    float _2369 = 1.0 / _2357;
    bool _2371 = !_2335;
    float _2373 = _2305;
    float _2375 = _2303;
    if (!_2371)
    {
        float _2377 = _188 * _188;
        float _2379 = rsqrt(_2319);
        float _2381 = fma(_186, _186, _2377);
        float _2383 = fma(_190, _190, _2381);
        float _2385 = sqrt(_2383);
        float _2387 = _2303 * _2379;
        float _2389 = _2279 * _2379;
        bool _2391 = _2385 > 0.0;
        float _2393 = _2297 * _2379;
        bool _2395 = !_2391;
        if (!_2395)
        {
            float _2397 = rsqrt(_2383);
            float _2399 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2401 = _188 * _2397;
            float _2403 = _186 * _2397;
            float _2405 = _2387 * _2401;
            float _2407 = _190 * _2397;
            float _2409 = fma(_2393, _2403, _2405);
            float _2411 = _2399 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2413 = fma(_2389, _2407, _2409);
            float _2415 = _2413 * _2411;
            float _2417 = fma(_186, _2415, _2243);
            float _2419 = fma(_188, _2415, _2305);
            float _2421 = fma(_190, _2415, _2249);
            _2245 = _2417;
            _2373 = _2419;
            _2269 = _2421;
            _2375 = _2407;
        }
    }
    float _2423 = _2245;
    float _2425 = _2373;
    float _2427 = _2269;
    float _2429 = _2375;
    float _2431 = -_1535;
    float _2433 = fma(_2431, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2423);
    float _2435 = -_1529;
    float _2437 = fma(_2435, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2425);
    float _2439 = -_1567;
    float _2441 = fma(_2439, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2427);
    float _2443 = _2437;
    float _2445 = _2441;
    float _2447 = _2429;
    if (_2367)
    {
        _1597 = 1.0;
    }
    float _2449 = _1597;
    float _2451 = _2449;
    if (_2353)
    {
        _1599 = _2433;
    }
    float _2453 = _1599;
    float _2455 = _2453;
    if (!_2353)
    {
        float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2459 = _2309 + _2457;
        float _2461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2463 = -_1371;
        float _2465 = _2463 + _2427;
        float _2467 = -_2299;
        float _2469 = _2467 + _2425;
        float _2471 = _2459 * _2459;
        float _2473 = -_1331;
        float _2475 = _2473 + _2423;
        float _2477 = fma(_1625, _1625, _2471);
        float _2479 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2481 = fma(_1637, _1637, _2477);
        float _2483 = 1.0 / _1711;
        float _2485 = sqrt(_2481);
        float _2487 = _2479 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2489 = precise::min(_2485, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2491 = _2489 * _2461;
        float _2493 = _2491 * _2483;
        float _2495 = _2487 * _2493;
        float _2497 = _2465 * _2493;
        float _2499 = fma(_2469, _2495, _2309);
        float _2501 = fma(_2475, _2495, _1609);
        float _2503 = fma(_2487, _2497, _1621);
        _194 = _2461;
        _2443 = _2499;
        _2455 = _2501;
        _2445 = _2503;
        _2447 = _2471;
    }
    float _2505 = _194;
    float _2507 = _2443;
    float _2509 = _2455;
    float _2511 = _2445;
    float _2513 = _2447;
    float _2515 = _2505;
    float _2517 = _2513;
    if (_2367)
    {
        _1679 = 1.0;
    }
    float _2519 = _1679;
    float _2521 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2523 = _2369 * _2521;
    float _2525 = _2519;
    if (!_2367)
    {
        float _2527 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2529 = _2527 * 0.15915493667125701904296875;
        float _2531 = _2529 * 6.283185482025146484375;
        float _2533 = cos(_2531);
        float _2535 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2537 = _2535 * 0.15915493667125701904296875;
        float _2539 = _2529 * 6.283185482025146484375;
        float _2541 = sin(_2539);
        float _2543 = 1.0 / _2533;
        float _2545 = _2537 * 6.283185482025146484375;
        float _2547 = cos(_2545);
        float _2549 = _2541 * _2543;
        float _2551 = _2537 * 6.283185482025146484375;
        float _2553 = sin(_2551);
        float _2555 = _2547 * _2549;
        float _2557 = 1.0 / _2555;
        float _2559 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2561 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2559;
        float _2563 = 1.0 / _2561;
        float _2565 = _2553 * _2557;
        float _2567 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2569 = fma(_2523, _2565, _2567);
        float _2571 = _2569 * _2563;
        float _2573 = precise::clamp(_2571, 0.0, 1.0);
        _2515 = _2537;
        _2517 = _2563;
        _2451 = _2573;
    }
    float _2575 = _2515;
    float _2577 = _2517;
    float _2579 = _2451;
    float _2581 = _2577;
    float _2583 = _2575;
    if (!_2367)
    {
        float _2585 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2587 = _2585 * 0.15915493667125701904296875;
        float _2589 = _2587 * 6.283185482025146484375;
        float _2591 = cos(_2589);
        float _2593 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2595 = _2593 * 0.15915493667125701904296875;
        float _2597 = _2587 * 6.283185482025146484375;
        float _2599 = sin(_2597);
        float _2601 = 1.0 / _2591;
        float _2603 = _2595 * 6.283185482025146484375;
        float _2605 = cos(_2603);
        float _2607 = _2599 * _2601;
        float _2609 = _2595 * 6.283185482025146484375;
        float _2611 = sin(_2609);
        float _2613 = _2605 * _2607;
        float _2615 = 1.0 / _2613;
        float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2619 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2617;
        float _2621 = 1.0 / _2619;
        float _2623 = _2611 * _2615;
        float _2625 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2627 = fma(_2523, _2623, _2625);
        float _2629 = _2627 * _2621;
        float _2631 = precise::clamp(_2629, 0.0, 1.0);
        float _2633 = -_2631;
        float _2635 = _2633 + 1.0;
        _2581 = _2613;
        _2583 = _2591;
        _2525 = _2635;
    }
    float _2637 = _2581;
    float _2639 = _2583;
    float _2641 = _2525;
    float _2643 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2645 = _2507 + _2643;
    float _2647 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2649 = _2509 + _2647;
    float _2651 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2653 = _2511 + _2651;
    float _2655 = _2645 * _2645;
    float _2657 = fma(_2649, _2649, _2655);
    float _2659 = fma(_1609, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2661 = fma(_2653, _2653, _2657);
    float _2663 = rsqrt(_2661);
    float _2665 = sqrt(_2661);
    float _2667 = _2663 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2669 = _2649 * _2667;
    float _2671 = _2653 * _2667;
    float _2673 = _2669 * _2669;
    float _2675 = _2671 * _2671;
    float _2677 = _2673 + _2675;
    float _2679 = sqrt(_2677);
    bool _2681 = _2679 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2683 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2685 = _2679 + _2683;
    float _2687 = _2653;
    float _2689 = _2677;
    float _2691 = _2685;
    float _2693 = _2637;
    float _2695 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2697 = _2667;
    if (_2681)
    {
        float _2699 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2687 = _2699;
    }
    float _2701 = _2687;
    if (_2681)
    {
        float _2703 = rsqrt(_2677);
        _2689 = _2703;
    }
    float _2705 = _2689;
    float _2707 = _2705;
    if (_2681)
    {
        float _2709 = _2685 * _2701;
        _2691 = _2709;
    }
    float _2711 = _2691;
    if (_2681)
    {
        float _2713 = _2711 * 0.15915493667125701904296875;
        _2693 = _2713;
    }
    float _2715 = _2693;
    float _2717 = _2701;
    float _2719 = _2715;
    if (_2681)
    {
        float _2721 = _2715 * 6.283185482025146484375;
        float _2723 = sin(_2721);
        _2717 = _2723;
    }
    float _2725 = _2717;
    float _2727 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2729 = precise::max(0.0, _2727);
    float _2731 = _2639;
    float _2733 = _2729;
    if (_2681)
    {
        float _2735 = _2715 * 6.283185482025146484375;
        float _2737 = cos(_2735);
        _2731 = _2737;
    }
    float _2739 = _2731;
    float _2741 = -_2667;
    float _2743 = -_2729;
    float _2745 = fma(_2645, _2741, _2743);
    float _2747 = _2745;
    if (_2681)
    {
        float _2749 = _2745 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2733 = _2749;
    }
    float _2751 = _2733;
    float _2753 = _2751;
    if (!_2681)
    {
        _2719 = _2669;
    }
    float _2755 = _2719;
    float _2757 = _2725;
    float _2759 = _2755;
    if (_2681)
    {
        float _2761 = fma(_2725, _2751, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2757 = _2761;
    }
    float _2763 = _2757;
    float _2765 = _2763;
    float _2767 = _2739;
    if (_2681)
    {
        float _2769 = _2739 + (-1.0);
        _2753 = _2769;
    }
    float _2771 = _2753;
    if (_2681)
    {
        float _2773 = _2705 * _2763;
        _2695 = _2773;
    }
    float _2775 = _2695;
    if (!_2681)
    {
        _2765 = _2671;
    }
    float _2777 = _2765;
    float _2779 = _2777;
    if (_2681)
    {
        float _2781 = _2771 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2697 = _2781;
    }
    float _2783 = _2697;
    if (_2681)
    {
        float _2785 = _2669 * _2775;
        _2759 = _2785;
    }
    float _2787 = _2759;
    if (!_2681)
    {
        _2707 = _2673;
    }
    float _2789 = _2707;
    float _2791 = _2789;
    if (_2681)
    {
        float _2793 = _2671 * _2775;
        _2779 = _2793;
    }
    float _2795 = _2779;
    if (_2681)
    {
        float _2797 = fma(_2745, _2739, _2783);
        _2747 = _2797;
    }
    float _2799 = _2747;
    if (_2681)
    {
        float _2801 = _2787 * _2787;
        _2791 = _2801;
    }
    float _2803 = _2791;
    if (!_2681)
    {
        _2767 = _2675;
    }
    float _2805 = _2767;
    float _2807 = _2805;
    if (_2681)
    {
        float _2809 = _2795 * _2795;
        _2807 = _2809;
    }
    float _2811 = _2807;
    float _2813 = fma(_2799, _2799, _2803);
    float _2815 = _2507 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2817 = _2507 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2819 = _2813 + _2811;
    float _2821 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2815);
    float _2823 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2825 = fma(_2665, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2823);
    float _2827 = precise::clamp(_2825, 0.0, 1.0);
    float _2829 = rsqrt(_2819);
    float _2831 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2821);
    float _2833 = -_2827;
    float _2835 = _2833 + 1.0;
    float _2837 = fma(_1621, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2839 = _2831 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2841 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2843 = _2507 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2845 = abs(_2835);
    float _2847 = log2(_2845);
    float _2849 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2851 = _2507 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2853 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2817);
    float _2855 = -_2849;
    float _2857 = fma(_2855, _2841, 1.0);
    float _2859 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2843);
    float _2861 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2853);
    float _2863 = _2829 * _2795;
    float _2865 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2851);
    float _2867 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2859);
    float _2869 = _2829 * _2787;
    float _2871 = _2829 * _2799;
    float _2873 = fma(_2511, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2865);
    float _2875 = _2867 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2877 = floor(_2659);
    float _2879 = _2869 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2881 = _2873 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2883 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2885 = _2847 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2887 = -_2879;
    float _2889 = fma(_2871, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2887);
    float _2891 = _2861 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2893 = fma(_2881, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2883);
    float _2895 = floor(_2837);
    float _2897 = -_2863;
    float _2899 = fma(_2897, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2889);
    float _2901 = fma(_2839, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2893);
    float _2903 = fma(_2899, -0.5, 0.5);
    float _2905 = fma(_2899, 0.5, 0.5);
    float _2907 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2901);
    float _2909 = exp2(_2885);
    float _2911 = -_2877;
    float _2913 = _2659 + _2911;
    float _2915 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2917 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2919 = fma(_2881, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2917);
    float _2921 = log2(_2857);
    float _2923 = -_2895;
    float _2925 = _2837 + _2923;
    float _2927 = fma(_2881, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2915);
    float _2929 = _2871 + 1.0;
    float _2931 = fma(_2839, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2919);
    float _2933 = fma(_2905, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2935 = fma(_2839, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2927);
    float _2937 = 1.0 / _2907;
    float _2939 = -_2871;
    float _2941 = fma(_2909, _2929, _2939);
    float _2943 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2935);
    float _2945 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2931);
    float _2947 = fma(_2905, _2933, -0.212114393711090087890625);
    float _2949 = sqrt(_2903);
    float _2951 = _2921 * 0.693147182464599609375;
    float2 _8037 = float2(_2913, _2925);
    float _2953 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8037, float2(0.0), isnan(_8037)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8037, float2(0.0), isnan(_8037)), level(0.0)).x;
    float _2955 = fma(_2905, _2947, 1.570728778839111328125);
    float _2957 = _2951 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2959 = _2943 * _2937;
    float _2961 = _2945 * _2937;
    float _2963 = fma(_2959, 0.5, 0.5);
    float _2965 = fma(_2961, -0.5, 0.5);
    float _2967 = _2949 * 0.636619746685028076171875;
    float3 _8067 = float3(_2963, _2965, _2957);
    float _2969 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8067, float3(0.0), isnan(_8067)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8067, float3(0.0), isnan(_8067)), level(0.0)).x;
    float _2971 = -_2955;
    float _2973 = fma(_2967, _2971, 1.0);
    float _2975 = fma(_2941, 0.5, 0.5);
    float3 _8085 = float3(_2963, _2965, _2957);
    float4 _2978 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8085, float3(0.0), isnan(_8085)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8085, float3(0.0), isnan(_8085)), level(0.0)).xyzw;
    float _2980 = _2978.x;
    float _2982 = _2978.y;
    float _2984 = _2978.z;
    float _2986 = _2978.w;
    float2 _8101 = float2(_2973, _2975);
    float3 _2990 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8101, float2(0.0), isnan(_8101)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8101, float2(0.0), isnan(_8101)), level(0.0)).xyz;
    float _2992 = _2990.x;
    float _2994 = _2990.y;
    float _2996 = _2990.z;
    float _2998 = in.m_79.x;
    float _3000 = in.m_79.y;
    float _3002 = in.m_79.z;
    bool _3004 = _1725 != 0.0;
    bool _3006 = isnan(_1725);
    bool _3008 = _3004 || _3006;
    bool _3010 = isnan(0.0);
    bool _3012 = _3008 || _3010;
    float _3014 = _2847 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3016 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_61.x = _406;
    out.m_61.y = _408;
    out.m_61.z = _410;
    out.m_61.w = _412;
    bool _3018 = _1723 == 0.0;
    bool _3020 = !_3012;
    bool _3022 = _3018 && _3020;
    float _3024 = _1733 * _1967;
    float _3026 = fma(_2881, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3016);
    float _3028 = _1733 * _1963;
    bool _3030 = _1727 == 0.0;
    bool _3032 = _3030 && _3022;
    float _3034 = exp2(_3014);
    out.m_75.x = _1575;
    out.m_75.y = _1577;
    out.m_75.z = _1581;
    out.m_75.w = _1583;
    float _3036 = in.m_69.x;
    float _3038 = -_1701;
    float _3040 = fma(_3038, _1945, _3024);
    float _3042 = -_1701;
    float _3044 = fma(_3042, _1941, _3028);
    float _3046 = fma(_1737, _1811, _3040);
    float _3048 = _3000;
    float _3050 = _3002;
    float _3052 = _2998;
    if (!_3032)
    {
        float _3054 = fma(_1725, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3000);
        _3048 = _3054;
    }
    float _3056 = _3048;
    if (!_3032)
    {
        float _3058 = fma(_1727, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3002);
        _3050 = _3058;
    }
    float _3060 = _3050;
    float _3062 = _1733 * _1959;
    float _3064 = _1717 * _1967;
    if (!_3032)
    {
        float _3066 = fma(_1723, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2998);
        _3052 = _3066;
    }
    float _3068 = _3052;
    float _3070 = _1717 * _1959;
    float _3072 = -_1701;
    float _3074 = fma(_3072, _1947, _3062);
    float _3076 = fma(_1735, _1945, _3064);
    float _3078 = _1717 * _1963;
    float _3080 = _1759 * _1967;
    float _3082 = fma(_1737, _1815, _3074);
    float _3084 = fma(_1753, _1811, _3076);
    float _3086 = fma(_1735, _1947, _3070);
    float _3088 = abs(_2523);
    float _3090 = log2(_3088);
    float _3092 = fma(_1735, _1941, _3078);
    float _3094 = fma(_1737, _1813, _3044);
    float _3096 = fma(_1739, _1945, _3080);
    float _3098 = _3046 * _3056;
    float _3100 = fma(_1753, _1815, _3086);
    float _3102 = fma(_1753, _1813, _3092);
    float _3104 = _3082 * _3056;
    float _3106 = _3094 * _3056;
    float _3108 = fma(_1719, _1811, _3096);
    float _3110 = fma(_3084, _3068, _3098);
    float _3112 = fma(_3100, _3068, _3104);
    float _3114 = fma(_3102, _3068, _3106);
    float _3116 = fma(_3108, _3060, _3110);
    float _3118 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _3120 = _2523 <= 8000.0;
    bool _3122 = isnan(_2523);
    bool _3124 = _3120 || _3122;
    bool _3126 = isnan(8000.0);
    bool _3128 = _3124 || _3126;
    float _3130 = float(_3128);
    float _3132 = _2907 * 0.5;
    float _3134 = -_3034;
    float _3136 = _3134 + 1.0;
    float _3138 = _1759 * _1959;
    float _3140 = _1759 * _1963;
    float _3142 = exp2(_3118);
    float _3144 = fma(_1739, _1947, _3138);
    float _3146 = fma(_1739, _1941, _3140);
    bool _3148 = _2665 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3150 = isnan(_2665);
    bool _3152 = _3148 || _3150;
    bool _3154 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3156 = _3152 || _3154;
    float _3158 = fma(_1719, _1815, _3144);
    float _3160 = fma(_1719, _1813, _3146);
    float _3162 = fma(_2839, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3026);
    float _3164 = fma(_3158, _3060, _3112);
    float _3166 = fma(_3160, _3060, _3114);
    float _3168 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3162);
    float _3170 = fma(_3142, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3172 = precise::clamp(_3170, 0.0, 1.0);
    out.gl_Position.x = _2943;
    out.gl_Position.y = _2945;
    out.gl_Position.z = _3168;
    out.gl_Position.w = _2907;
    float _3174 = _2943 + _2907;
    float _3176 = fma(_3172, -2.0, 3.0);
    float _3178 = _3172 * _3172;
    out.m_81.x = _3116;
    out.m_81.y = _3164;
    out.m_81.z = _3166;
    float _3180 = _3174 * 0.5;
    float _3182 = _3178 * _3176;
    float _3184 = -_3182;
    float _3186 = _3184 + 1.0;
    float _3188 = fma(_3186, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3182);
    float _3190 = fma(_2945, -0.5, _3132);
    float _3192 = _3136 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3194 = _3168 + _2907;
    float _3196 = _3130 * _3188;
    float _3198 = _3194 * 0.5;
    float _3200 = _3196 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = _3180;
    out.m_83.y = _3190;
    out.m_83.z = _3198;
    out.m_83.w = _2907;
    float _3202 = _2579 * _2641;
    float _3204 = _2907;
    float _3206 = _3198;
    float _3208 = _3190;
    float _3210 = _3202;
    if (!_3156)
    {
        _3204 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3212 = _3204;
    float _3214 = _3212;
    float _3216 = _3212;
    if (!_3156)
    {
        _3206 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3218 = _3206;
    float _3220 = _3218;
    float _3222 = _3218;
    if (!_3156)
    {
        _3208 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3224 = _3208;
    float _3226 = -_2953;
    float _3228 = _3226 + 1.0;
    float _3230 = _3228 * _3200;
    float _3232 = precise::clamp(_3230, 0.0, 1.0);
    float _3234 = -_3232;
    float _3236 = fma(_3234, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3238 = _3236 * _3036;
    float _3240 = _3192 * _2969;
    float _3242 = -_3192;
    float _3244 = _3242 + 1.0;
    float _3246 = _3238 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3248 = _3238;
    float _3250 = _3244;
    float _3252 = _3224;
    float _3254 = _3224;
    if (!_3156)
    {
        _3248 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3256 = _3248;
    float _3258 = _2986 * _3240;
    float _3260 = _2986 * _3244;
    out.m_85.x = _3246;
    float _3262 = _3256;
    float _3264 = _3256;
    if (!_3156)
    {
        _3250 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3266 = _3250;
    float _3268 = _2996 * _3240;
    float _3270 = fma(_2992, _3258, _2980);
    float _3272 = fma(_2994, _3258, _2982);
    float _3274 = _3202 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3276 = fma(_2986, _3268, _2984);
    float _3278 = _3266;
    float _3280 = _3266;
    if (!_3156)
    {
        _3210 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3282 = _3210;
    out.m_87.x = _3270;
    out.m_87.y = _3272;
    out.m_87.z = _3276;
    out.m_87.w = _3260;
    bool _3284 = !_3156;
    float _3286 = _3282;
    float _3288 = _3282;
    if (!_3284)
    {
        bool _3290 = _2665 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3292 = isnan(_2665);
        bool _3294 = _3290 || _3292;
        bool _3296 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3298 = _3294 || _3296;
        if (!_3298)
        {
            float _3300 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3302 = _2665 + _3300;
            float _3304 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3306 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3304;
            float _3308 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3310 = _3308 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3312 = 1.0 / _3306;
            float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3316 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3320 = _3318 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3322 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3324 = _3322 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3326 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3328 = _3326 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3330 = _3302 * _3312;
            float _3332 = precise::clamp(_3330, 0.0, 1.0);
            float _3334 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3336 = _3334 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3338 = fma(_3332, _3310, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3340 = fma(_3332, _3336, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3342 = fma(_3332, _3316, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3344 = fma(_3332, _3320, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3346 = fma(_3332, _3324, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3348 = fma(_3332, _3328, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3280 = _3342;
            _3254 = _3346;
            _3264 = _3338;
            _3222 = _3344;
            _3216 = _3340;
            _3288 = _3348;
            _3350 = true;
        }
        else
        {
            bool _3352 = _2665 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3354 = isnan(_2665);
            bool _3356 = _3352 || _3354;
            bool _3358 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3360 = _3356 || _3358;
            if (!_3360)
            {
                _3262 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3362 = _3262;
            _3264 = _3362;
            if (!_3360)
            {
                _3278 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3364 = _3278;
            _3280 = _3364;
            if (!_3360)
            {
                _3214 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3366 = _3214;
            _3216 = _3366;
            if (!_3360)
            {
                _3220 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3368 = _3220;
            _3222 = _3368;
            if (!_3360)
            {
                _3252 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3370 = _3252;
            _3254 = _3370;
            if (!_3360)
            {
                _3286 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3372 = _3286;
            bool _3374 = !_3360;
            _3288 = _3372;
            if (!_3374)
            {
                bool _3376 = _2665 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3378 = isnan(_2665);
                bool _3380 = _3376 || _3378;
                bool _3382 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3384 = _3380 || _3382;
                if (!_3384)
                {
                    float _3386 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3388 = _2665 + _3386;
                    float _3390 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3392 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3390;
                    float _3394 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3396 = _3394 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3398 = 1.0 / _3392;
                    float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3402 = _3400 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3404 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3406 = _3404 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3408 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3410 = _3408 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3412 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3414 = _3412 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3416 = _3388 * _3398;
                    float _3418 = precise::clamp(_3416, 0.0, 1.0);
                    float _3420 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3422 = _3420 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3424 = fma(_3418, _3396, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3426 = fma(_3418, _3422, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3428 = fma(_3418, _3402, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3430 = fma(_3418, _3406, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3432 = fma(_3418, _3410, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3434 = fma(_3418, _3414, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3280 = _3428;
                    _3254 = _3432;
                    _3264 = _3424;
                    _3222 = _3430;
                    _3216 = _3426;
                    _3288 = _3434;
                    _3350 = true;
                }
                else
                {
                    _3280 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3254 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3264 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3222 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3216 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3288 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3350 = false;
    float _3436 = _3280;
    float _3438 = _3254;
    float _3440 = _3264;
    float _3442 = _3222;
    float _3444 = _3216;
    float _3446 = _3288;
    float _3448 = fma(_3164, -0.5, 0.5);
    float _3450 = precise::clamp(_3448, 0.0, 1.0);
    float _3452 = -_3436;
    float _3454 = _3452 + _3438;
    float _3456 = _3274 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3458 = -_3440;
    float _3460 = _3458 + _3442;
    float _3462 = fma(_3450, _3454, _3436);
    out.m_89.x = 0.0;
    float _3464 = -_3444;
    float _3466 = _3464 + _3446;
    float _3468 = fma(_3450, _3460, _3440);
    float _3470 = _3462 * 0.586610972881317138671875;
    out.m_51.x = _3456;
    bool _3472 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3474 = fma(_3450, _3466, _3444);
    float _3476 = fma(_3468, 0.298911988735198974609375, _3470);
    bool _3478 = _2579 > 0.0;
    bool _3480 = isnan(_2579);
    bool _3482 = _3478 || _3480;
    bool _3484 = isnan(0.0);
    bool _3486 = _3482 || _3484;
    float _3488 = fma(_3474, 0.114477999508380889892578125, _3476);
    bool _3490 = _2641 <= 0.0;
    bool _3492 = !_3486;
    bool _3494 = _3490 || _3492;
    float _3496 = -_3488;
    float _3498 = _3468 + _3496;
    float _3500 = -_3488;
    float _3502 = _3462 + _3500;
    float _3504 = -_3488;
    float _3506 = _3474 + _3504;
    float _3508 = fma(_3498, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3488);
    float _3510 = fma(_3502, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3488);
    float _3512 = fma(_3506, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3488);
    bool _3514 = !_3472;
    if (!_3514)
    {
        float _3516 = -_2507;
        float _3518 = _3516 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3520 = -_2509;
        float _3522 = _3520 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3524 = -_2511;
        float _3526 = _3524 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3528 = _3518 * _3518;
        float _3530 = fma(_3522, _3522, _3528);
        float _3532 = fma(_3526, _3526, _3530);
        float _3534 = sqrt(_3532);
        float _3536 = rsqrt(_3532);
        float _3538 = -_3534;
        float _3540 = _3538 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3542 = _3540 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3544 = precise::clamp(_3542, 0.0, 1.0);
        float _3546 = _3522 * _3536;
        float _3548 = _3518 * _3536;
        float _3550 = abs(_3544);
        float _3552 = log2(_3550);
        float _3554 = _3526 * _3536;
        float _3556 = _3546 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3558 = _3164 * _3548;
        float _3560 = -_3548;
        float _3562 = -_3556;
        float _3564 = fma(_3560, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3562);
        float _3566 = fma(_3116, _3546, _3558);
        float _3568 = -_3554;
        float _3570 = fma(_3568, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3564);
        float _3572 = fma(_3166, _3554, _3566);
        float _3574 = precise::clamp(_3572, 0.0, 1.0);
        float _3576 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3578 = _3570 + _3576;
        float _3580 = _3552 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3582 = _3578 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3584 = precise::clamp(_3582, 0.0, 1.0);
        float _3586 = exp2(_3580);
        float _3588 = _3586 * _3584;
        float _3590 = _3574 * _3588;
        float _3592 = _3590 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3594 = _3590 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3596 = _3590 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3592;
        out.m_89.y = _3594;
        out.m_89.z = _3596;
    }
    out.m_91.x = _3508;
    out.m_91.y = _3510;
    out.m_91.z = _3512;
    if (!_3494)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3598 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3598;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

