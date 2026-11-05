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
    float4 m_65 [[user(locn1)]];
    float4 m_91 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_71 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_77 [[attribute(4)]];
    float4 m_75 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_61 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2654 = false;
    bool _470 = false;
    bool _350 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2965 = as_type<float>(_134);
        out.gl_Position.z = _2965;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _138 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_107);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3020 = as_type<float>(_160);
        out.gl_Position.z = _3020;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = 1.0 / _148;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _116 * _162;
    bool _168 = !_164;
    float _186;
    if (!_168)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        _186 = _166;
    }
    _188 = false;
    float _190 = _186;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _194 = _190 + _192;
    bool _196 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _198 = isnan(_190);
    bool _200 = _196 || _198;
    bool _202 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _204 = _200 || _202;
    float _206 = float(_204);
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _190 + _208;
    bool _212 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _214 = isnan(_190);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _220 = _216 || _218;
    float _222 = float(_220);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _232 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _234 = isnan(_190);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    float _244 = -_206;
    float _246 = _244 + 1.0;
    float _248 = 1.0 / _230;
    float _250 = _242 * _246;
    float _252 = -_242;
    float _254 = _252 + 1.0;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = 1.0 / _226;
    float _264 = _222 * _254;
    float _266 = -_222;
    float _268 = _266 + 1.0;
    float _270 = _210 * _248;
    float _272 = _194 * _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    float _282 = fma(_258, _272, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _284 = fma(_276, _272, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _286 = fma(_280, _272, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _288 = _282 * _264;
    float _290 = _284 * _264;
    float _292 = _286 * _264;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _306 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _288);
    float _308 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _290);
    float _310 = fma(_296, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _312 = fma(_300, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _314 = fma(_304, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _316 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].z, _292);
    float _318 = fma(_310, _250, _306);
    float _320 = fma(_312, _250, _308);
    float _322 = fma(_314, _250, _316);
    float _324 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].x, _318);
    float _326 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].y, _320);
    float _328 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].z, _322);
    bool _330 = !_260;
    float _348;
    if (!_330)
    {
        float _332 = in.m_55.x;
        float _334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _336 = _332 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _340 = _338 * _334;
        float _342 = floor(_340);
        float _344 = -_342;
        float _346 = _340 + _344;
        _348 = _346;
        _350 = true;
    }
    else
    {
        _348 = _166;
    }
    _350 = false;
    float _352 = _348;
    float _354 = in.m_57.x;
    float _356 = in.m_57.y;
    float _358 = in.m_57.z;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _362 = _352 + _360;
    bool _364 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _366 = isnan(_352);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _378;
    float _382 = 1.0 / _380;
    float _384 = _328 * _358;
    float _386 = _326 * _356;
    float _388 = _362 * _382;
    float _390 = -_374;
    float _392 = _390 + 1.0;
    bool _394 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _396 = isnan(_352);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _414;
    float _418 = _404 * _392;
    float _420 = fma(_408, _388, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _422 = fma(_412, _388, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _424 = fma(_416, _388, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _426 = -_404;
    float _428 = _426 + 1.0;
    float _430 = _420 * _418;
    float _432 = _422 * _418;
    float _434 = _424 * _418;
    float _436 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[107].x, _430);
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[107].y, _432);
    float _440 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[107].z, _434);
    float _442 = _324 * _354;
    float _444 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[108].x, _436);
    float _446 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[108].y, _438);
    float _448 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[108].z, _440);
    bool _450 = !_376;
    float _468;
    if (!_450)
    {
        float _452 = in.m_55.x;
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _456 = _452 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _460 = _458 * _454;
        float _462 = floor(_460);
        float _464 = -_462;
        float _466 = _460 + _464;
        _468 = _466;
        _470 = true;
    }
    else
    {
        _468 = _166;
    }
    _470 = false;
    float _472 = _468;
    float _474 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _476 = int(_474);
    float _478 = in.m_59.y;
    float _480 = in.m_61.y;
    float _482 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _484 = int(_482);
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _488 = in.m_59.w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _492 = in.m_59.z;
    float _494 = float(_476);
    float _496 = 1.0 / _494;
    float _498 = float(uint(_484));
    int _500 = ~_484;
    int _502 = _500 + 1;
    out.m_63.y = _478;
    int _504 = ~_484;
    int _506 = _504 + 1;
    float _508 = 1.0 / _498;
    int _510 = ~_484;
    int _512 = _510 + 1;
    out.m_63.w = _488;
    float _514 = _496 * _116;
    out.m_63.z = _492;
    float _516 = trunc(_514);
    int _518 = int(_516);
    int _520 = as_type<int>(_508) + (-2);
    float _522 = float(uint(_518));
    float _524 = as_type<float>(_520) * _522;
    float _526 = trunc(_524);
    float _528 = precise::max(_526, 0.0);
    uint _531 = uint(_528);
    int _533 = _502 * int(_531);
    int _535 = _533 + _518;
    float _537 = in.m_55.x;
    float _539 = in.m_55.y;
    float _541 = float(uint(_535));
    float _543 = as_type<float>(_520) * _541;
    int _545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _547 = _545 != 0;
    float _549 = trunc(_543);
    float _551 = precise::max(_549, 0.0);
    uint _553 = uint(_551);
    bool _555 = !_547;
    float _557 = _555 ? 7.345489978790283203125 : 1.0;
    float _559 = float(_518);
    float _561 = _557 * _537;
    float _563 = _537 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _565 = floor(_561);
    int _567 = int(_531) + int(_553);
    float _569 = -_490;
    float _571 = fma(_563, 2.0, _569);
    float _573 = float(_484);
    int _575 = _506 * _567;
    int _577 = _575 + _518;
    bool _579 = _559 >= _573;
    bool _581 = isnan(_559);
    bool _583 = _579 || _581;
    bool _585 = isnan(_573);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = -_116;
    float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[76].x, _571);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _595;
    bool _599 = uint(_577) >= uint(_484);
    float _601 = trunc(_589);
    int _603 = int(_601);
    float _605 = in.m_59.x;
    bool _607 = !_599;
    int _609 = _607 ? 0 : (-1);
    float _611 = -_565;
    float _613 = _561 + _611;
    bool _615 = _484 == 0;
    int _617 = ~_567;
    int _619 = _617 + _609;
    int _621 = _619 + 1;
    float _623 = _613 * _573;
    float _625 = _573 * _116;
    int _627 = _484 * _621;
    int _629 = _627 + _518;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _633 = _631 != 0;
    float _635 = _625 * _162;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _639 = _637 != 0;
    float _641 = trunc(_623);
    int _643 = int(_641);
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _647 = _645 != 0;
    int _649 = ~_603;
    int _651 = _649 + 1;
    int _653 = _651 + 1;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _657 = _655 != 0;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _661 = _659 != 0;
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _665 = _663 != 0;
    bool _667 = !_615;
    int _669 = _667 ? _629 : (-1);
    float _671 = trunc(_635);
    int _673 = int(_671);
    bool _675 = !_647;
    int _677 = _675 ? 0 : 1;
    float _679 = 0.0;
    float _681 = _480;
    if (_633)
    {
        float _683 = in.m_55.x;
        _679 = _683;
    }
    float _685 = _679;
    bool _687 = !_661;
    int _689 = _687 ? 0 : 1;
    int _691 = _669 * _653;
    int _693 = _484 + (-1);
    out.m_63.x = _605;
    bool _695 = !_657;
    int _697 = _695 ? 0 : 1;
    int _699 = abs(_689);
    int _701 = _603 * _693;
    int _703 = _701 + _691;
    int _705 = abs(_697);
    int _707 = abs(_677);
    int _709 = _703 * _699;
    float _711 = _539 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _715 = _713 != 0;
    int _717 = _673 * _705;
    int _719 = _717 + _709;
    bool _721 = !_665;
    int _723 = _721 ? 0 : 1;
    int _725 = _643 * _707;
    int _727 = _725 + _518;
    bool _729 = !_715;
    int _731 = _729 ? 0 : 1;
    float _733 = in.m_46.x;
    float _735 = in.m_46.y;
    float _737 = in.m_46.z;
    int _739 = abs(_723);
    float _741 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _743 = log2(_741);
    int _745 = abs(_731);
    float _747 = -_480;
    float _749 = _747 + 1.0;
    bool _751 = _539 > 0.5;
    int _753 = _727 * _739;
    int _755 = _753 + _719;
    float _757 = fma(_711, -2.0, _486);
    int _759 = _643 * _745;
    int _761 = _759 + _755;
    if (_639)
    {
        float _763 = _751 ? _749 : _480;
        _681 = _763;
    }
    float _765 = _681;
    float _767 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _757);
    float _769 = float(uint(_761));
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _775 = as_type<float>(_520) * _769;
    bool _777 = _685 > 0.5;
    bool _779 = _777 && _633;
    float _781 = 1.0 / _773;
    float _783 = _735 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _785 = _735 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _787 = _735 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _795 = trunc(_775);
    float _797 = precise::max(_795, 0.0);
    uint _799 = uint(_797);
    float _801 = _743 * _116;
    float _803 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _807 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = fma(_733, (*spvDescriptorSet0.vp_c10)._m0[5].x, _785);
    float _813 = _537 * 2.0;
    float _815 = in.m_55.z;
    float _817 = exp2(_801);
    float _819 = fma(_733, (*spvDescriptorSet0.vp_c10)._m0[4].x, _783);
    float _821 = fma(_733, (*spvDescriptorSet0.vp_c10)._m0[6].x, _787);
    out.m_65.x = _807;
    out.m_65.y = _803;
    out.m_65.z = _809;
    out.m_65.w = _805;
    bool _823 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _825 = isnan(1.0);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _831 = _827 || _829;
    float _833 = _597 * _781;
    float _835 = _539 + _537;
    float _837 = in.m_61.x;
    float _839 = floor(_813);
    bool _841 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _843 = isnan(0.0);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _849 = _845 || _847;
    float _851 = _835 + (-1.0);
    float _853 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[6].z, _821);
    float _855 = _853 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _857 = -_817;
    float _859 = _857 + 1.0;
    int _861 = _512 * int(_799);
    int _863 = _861 + _761;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _867 = 1.0 + _865;
    float _869 = _849 ? _859 : 0.0;
    float _871 = 1.0 / _867;
    float _873 = float(uint(_863));
    float _875 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _877 = _839 > 0.0;
    float _879 = _539 + _815;
    bool _881 = _839 >= 0.0;
    bool _883 = isnan(_839);
    bool _885 = _881 || _883;
    bool _887 = isnan(0.0);
    bool _889 = _885 || _887;
    float _891 = as_type<float>(_520) * _873;
    float _893 = _539 * 2.0;
    float _895 = trunc(_891);
    float _897 = precise::max(_895, 0.0);
    uint _899 = uint(_897);
    float _901 = _879 + (-1.0);
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _905 = 0.0;
    float _907 = _837;
    float _909 = _875;
    if (_633)
    {
        _905 = _837;
    }
    float _911 = _905;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _915 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[78].z, _903);
    float _917 = floor(_893);
    int _919 = ~_484;
    int _921 = _919 + 1;
    float _923 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[78].w, _913);
    float _925 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _915);
    float _927 = _911;
    if (_779)
    {
        float _929 = -_911;
        float _931 = _929 + 1.0;
        _927 = _931;
    }
    float _933 = _927;
    float _935 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _923);
    if (_831)
    {
        float _937 = _869 * _871;
        _126 = _937;
    }
    float _939 = _126;
    int _941 = int(_799) + int(_899);
    float _943 = _815 * 2.0;
    int _945 = _889 ? 0 : 1;
    float _947 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_633)
    {
        _907 = _933;
    }
    float _949 = _907;
    int _951 = _921 * _941;
    int _953 = _951 + _761;
    bool _955 = _917 >= 0.0;
    bool _957 = isnan(_917);
    bool _959 = _955 || _957;
    bool _961 = isnan(0.0);
    bool _963 = _959 || _961;
    bool _965 = uint(_953) >= uint(_484);
    bool _967 = _917 > 0.0;
    float _969 = floor(_943);
    bool _971 = !_965;
    int _973 = _971 ? 0 : (-1);
    int _975 = _963 ? 0 : 1;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _983 = _981 != 0;
    int _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _987 = _985 != 0;
    bool _989 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _991 = isnan(_472);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _997 = _993 || _995;
    float _999 = float(_997);
    int _1001 = ~_941;
    int _1003 = _1001 + _973;
    int _1005 = _1003 + 1;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1009 = _472 + _1007;
    bool _1011 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1013 = isnan(_472);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1019 = _1015 || _1017;
    float _1021 = float(_1019);
    float _1023 = -_999;
    float _1025 = _1023 + 1.0;
    int _1027 = ~_945;
    int _1029 = _1027 + 1;
    int _1031 = _1029 + 1;
    int _1033 = _484 * _1005;
    int _1035 = _1033 + _761;
    float _1037 = fma(_833, _1009, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1039 = _1021 * _1025;
    float _1041 = float(uint(_727));
    bool _1043 = !_615;
    int _1045 = _1043 ? _1035 : (-1);
    float _1047 = _1037 * _1039;
    int _1049 = _1031;
    if (!_877)
    {
        int _1051 = ~_945;
        int _1053 = _1051 + 1;
        _1049 = _1053;
    }
    int _1055 = _1049;
    float _1057 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[4].z, _819);
    bool _1059 = _969 > 0.0;
    float _1061 = _1057 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1063 = _969 >= 0.0;
    bool _1065 = isnan(_969);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan(0.0);
    bool _1071 = _1067 || _1069;
    float _1073 = -_1021;
    float _1075 = _1073 + 1.0;
    float _1077 = as_type<float>(_520) * _1041;
    int _1079 = _1045 >> 31;
    float _1081 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1083 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[5].z, _811);
    int _1085 = ~_975;
    int _1087 = _1085 + 1;
    int _1089 = _1087 + 1;
    float _1091 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1047);
    int _1093 = _1079 & 3;
    float _1095 = trunc(_1077);
    float _1097 = precise::max(_1095, 0.0);
    uint _1099 = uint(_1097);
    int _1101 = _1089;
    if (!_967)
    {
        int _1103 = ~_975;
        int _1105 = _1103 + 1;
        _1101 = _1105;
    }
    int _1107 = _1101;
    float _1109 = -_767;
    float _1111 = fma(_935, _1081, _1109);
    int _1113 = _1045 + _1093;
    float _1115 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1117 = !_983;
    int _1119 = _1117 ? 0 : 1;
    float _1121 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1091);
    int _1123 = _1113 >> 2;
    float _1125 = fma(_925, _1115, _593);
    int _1127 = abs(_1119);
    float _1129 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1131 = _1123 << 4;
    int _1133 = _1131 + 368;
    float _1135 = _1121 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1137 = ~_484;
    int _1139 = _1137 + 1;
    float _1141 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1111 + 0.5;
    float _1145 = float(_1055);
    int _1147 = _1139 * int(_1099);
    int _1149 = _1147 + _727;
    uint _1151 = uint(int(uint(_1133) >> uint(2)));
    uint _1153 = uint(int(uint(int(_1151)) >> uint(2)));
    int _1155 = int(_1151) & 3;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[int(_1153)][_1155];
    int _1159 = int(_1151) + 1;
    uint _1161 = uint(int(uint(_1159) >> uint(2)));
    int _1163 = _1159 & 3;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[int(_1161)][_1163];
    int _1167 = _1071 ? 0 : 1;
    float _1169 = float(_1127);
    int _1171 = ~_1167;
    int _1173 = _1171 + 1;
    int _1175 = _1173 + 1;
    int _1177 = _1175;
    if (!_1059)
    {
        int _1179 = ~_1167;
        int _1181 = _1179 + 1;
        _1177 = _1181;
    }
    int _1183 = _1177;
    float _1185 = _1169 * _1145;
    float _1187 = float(uint(_1149));
    float _1189 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1191 = _1045 & 3;
    bool _1193 = _1191 != 0;
    float _1195 = _1185 * (-2.0);
    int _1197 = _1045 & 3;
    bool _1199 = _1197 != 0;
    float _1201 = as_type<float>(_520) * _1187;
    bool _1203 = !_979;
    int _1205 = _1203 ? 0 : 1;
    float _1207 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1209 = uint(_1197) > 1u;
    float _1211 = trunc(_1201);
    float _1213 = precise::max(_1211, 0.0);
    uint _1215 = uint(_1213);
    int _1217 = abs(_1205);
    float _1219 = _448 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1221 = float(_1183);
    int _1223 = _1133 + 8;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    uint _1227 = uint(int(uint(int(_1225)) >> uint(2)));
    int _1229 = int(_1225) & 3;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[int(_1227)][_1229];
    int _1233 = int(_1225) + 1;
    uint _1235 = uint(int(uint(_1233) >> uint(2)));
    int _1237 = _1233 & 3;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[int(_1235)][_1237];
    float _1241 = float(_1217);
    float _1243 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1245 = _1193 ? 0 : 1;
    int _1247 = ~_484;
    int _1249 = _1247 + 1;
    float _1251 = _1241 * _1221;
    int _1253 = ~_1245;
    int _1255 = _1253 + 1;
    int _1257 = _1255 + 1;
    out.m_67.x = _1141;
    out.m_67.y = _1207;
    out.m_67.z = _1243;
    out.m_67.w = _1135;
    int _1259 = _1257;
    if (!_1209)
    {
        int _1261 = ~_1245;
        int _1263 = _1261 + 1;
        _1259 = _1263;
    }
    int _1265 = _1259;
    float _1267 = _1251 * (-2.0);
    bool _1269 = _1197 != 3;
    int _1271 = int(_1099) + int(_1215);
    bool _1273 = !_1199;
    int _1275 = _1273 ? 0 : 1;
    int _1277 = abs(_1265);
    int _1279 = abs(_1275);
    int _1281 = _1249 * _1271;
    int _1283 = _1281 + _727;
    float _1285 = _1125 + 0.5;
    bool _1287 = uint(_1197) >= 2u;
    int _1289 = ~_1277;
    int _1291 = _1289 + 1;
    int _1293 = _1291 + 1;
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1297 = _1061 + _1295;
    out.m_69.x = _1285;
    out.m_69.y = _1143;
    int _1299 = _1287 ? 0 : 1;
    int _1301 = _1293 * as_type<int>(_1165);
    int _1303 = ~_1279;
    int _1305 = _1303 + 1;
    int _1307 = _1305 + 1;
    int _1309 = ~_1299;
    int _1311 = _1309 + 1;
    int _1313 = _1311 + 1;
    int _1315 = _1313;
    if (_1269)
    {
        int _1317 = ~_1299;
        int _1319 = _1317 + 1;
        _1315 = _1319;
    }
    int _1321 = _1315;
    int _1323 = _1307 * as_type<int>(_1157);
    int _1325 = _1323 + _1301;
    int _1327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1329 = _1327 != 0;
    float _1331 = in.m_71.x;
    float _1333 = in.m_71.y;
    float _1335 = in.m_71.z;
    float _1337 = _1083 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1339 = _1197 != 3;
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1343 = _855 + _1341;
    bool _1345 = uint(_1283) >= uint(_484);
    float _1347 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1349 = _1337 + _1347;
    bool _1351 = !_1339;
    int _1353 = _1351 ? 0 : (-1);
    int _1355 = abs(_1321);
    float _1357 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1359 = !_1345;
    int _1361 = _1359 ? 0 : (-1);
    int _1363 = abs(_1353);
    float _1365 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1357);
    bool _1367 = !_1329;
    int _1369 = _1367 ? 0 : 1;
    int _1371 = ~_1355;
    int _1373 = _1371 + 1;
    int _1375 = _1373 + 1;
    float _1377 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1365);
    int _1379 = ~_1271;
    int _1381 = _1379 + _1361;
    int _1383 = _1381 + 1;
    int _1385 = abs(_1369);
    int _1387 = _1375 * as_type<int>(_1231);
    int _1389 = _1387 + _1325;
    int _1391 = ~_1363;
    int _1393 = _1391 + 1;
    int _1395 = _1393 + 1;
    int _1397 = _484 * _1383;
    int _1399 = _1397 + _727;
    float _1401 = _1349 * _1349;
    bool _1403 = _1377 >= 0.0;
    float _1405 = fma(_1267, _1331, _1331);
    int _1407 = ~_1385;
    int _1409 = _1407 + 1;
    int _1411 = _1409 + 1;
    int _1413 = _1395 * as_type<int>(_1239);
    int _1415 = _1413 + _1389;
    float _1417 = fma(_1297, _1297, _1401);
    bool _1419 = !_615;
    int _1421 = _1419 ? _1399 : (-1);
    float _1423 = fma(_875, _1267, _875);
    int _1425 = _1415 * _1411;
    float _1427 = fma(_1343, _1343, _1417);
    float _1429 = _537 + (-0.5);
    float _1431 = fma(_947, _1195, _947);
    int _1433 = _1421 * _1385;
    int _1435 = _1433 + _1425;
    bool _1437 = !_987;
    int _1439 = _1437 ? 0 : 1;
    float _1441 = rsqrt(_1427);
    if (_1403)
    {
        _909 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1443 = _909;
    float _1445 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1405);
    float _1447 = float(_1435);
    int _1449 = as_type<int>(_1443);
    if (_1403)
    {
        out.m_53.x = 0.0;
    }
    if (_1403)
    {
        float _1451 = _1443 * 5.0;
        _1449 = as_type<int>(_1451);
    }
    int _1453 = _1449;
    float _1455 = fma(_1423, _939, _1445);
    float _1457 = fma(_1195, _1333, _1333);
    out.m_73.x = _1447;
    float _1459 = float(_1107);
    float _1461 = _539 + (-0.5);
    int _1463 = abs(_1439);
    if (_1403)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4984 = as_type<float>(_1453);
        out.gl_Position.z = _4984;
    }
    float _1465 = _1349 * _1441;
    float _1467 = _1297 * _1441;
    if (_1403)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1469 = -_1465;
    float _1471 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1337);
    float _1473 = _1343 * _1441;
    float _1475 = -_1467;
    float _1477 = fma(_1475, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1061);
    float _1479 = float(_1463);
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1483 = _1471 + _1481;
    float _1485 = _1455 * 0.15915493667125701904296875;
    float _1487 = -_1473;
    float _1489 = fma(_1487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _855);
    float _1491 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1493 = _1477 + _1491;
    float _1495 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1497 = _815 + _537;
    float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1501 = _1489 + _1499;
    float _1503 = _1479 * _1459;
    float _1505 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1495);
    float _1507 = _1497 + (-1.0);
    float _1509 = -_1465;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1349);
    float _1513 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1505);
    float _1515 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1457);
    float _1517 = fma(_1507, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1519 = -_1467;
    float _1521 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1297);
    float _1523 = _1511 * _1511;
    bool _1525 = _1513 >= 0.0;
    float _1527 = _1503 * (-2.0);
    float _1529 = fma(_1431, _939, _1515);
    float _1531 = fma(_1521, _1521, _1523);
    float _1533 = -_1473;
    float _1535 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1343);
    float _1537 = fma(_1527, _1335, _1335);
    float _1539 = _815 + (-0.5);
    float _1541 = _1529 * 0.15915493667125701904296875;
    float _1543 = fma(_1535, _1535, _1531);
    float _1545 = fma(_1517, _1527, _1517);
    float _1547 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1537);
    float _1549 = _1485 * 6.283185482025146484375;
    float _1551 = sin(_1549);
    float _1553 = _1537;
    float _1555 = _1501;
    float _1557 = _1493;
    if (_1525)
    {
        _1553 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1559 = _1553;
    float _1561 = fma(_1545, _939, _1547);
    int _1563 = as_type<int>(_1559);
    if (_1525)
    {
        out.m_53.x = 0.0;
    }
    if (_1525)
    {
        float _1565 = _1559 * 5.0;
        _1563 = as_type<int>(_1565);
    }
    int _1567 = _1563;
    float _1569 = _1485 * 6.283185482025146484375;
    float _1571 = cos(_1569);
    float _1573 = _1561 * 0.15915493667125701904296875;
    if (_1525)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5177 = as_type<float>(_1567);
        out.gl_Position.z = _5177;
    }
    float _1575 = _1541 * 6.283185482025146484375;
    float _1577 = sin(_1575);
    float _1579 = _1541 * 6.283185482025146484375;
    float _1581 = cos(_1579);
    float _1583 = sqrt(_1543);
    if (_1525)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1585 = in.m_75.x;
    float _1587 = in.m_75.y;
    float _1589 = in.m_75.z;
    float _1591 = _1573 * 6.283185482025146484375;
    float _1593 = cos(_1591);
    float _1595 = _1441 * _1583;
    float _1597 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1599 = _1551 * _1577;
    float _1601 = _1551 * _1581;
    float _1603 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1605 = _1571 * _1581;
    float _1607 = _1571 * _1577;
    float _1609 = _1573 * 6.283185482025146484375;
    float _1611 = sin(_1609);
    float _1613 = _1595 * _1603;
    bool _1615 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1617 = isnan(0.5);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1623 = _1619 || _1621;
    float _1625 = _1571 * _1593;
    float _1627 = _1581 * _1593;
    float _1629 = _1551 * _1593;
    float _1631 = _1577 * _1593;
    float _1633 = _1595 * _1597;
    float _1635 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1637 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1587);
    float _1639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1585);
    float _1641 = _1595 * _1635;
    float _1643 = _1637 * _1633;
    float _1645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1589);
    float _1647 = _1639 * _1613;
    float _1649 = fma(_1611, _1605, _1599);
    float _1651 = _1625 * _1643;
    float _1653 = _1645 * _1641;
    float _1655 = -_1601;
    float _1657 = fma(_1611, _1607, _1655);
    float _1659 = -_1643;
    float _1661 = _1611 * _1659;
    float _1663 = fma(_1649, _1647, _1651);
    float _1665 = -_1607;
    float _1667 = fma(_1611, _1601, _1665);
    float _1669 = _1629 * _1643;
    float _1671 = fma(_1627, _1647, _1661);
    float _1673 = fma(_1657, _1653, _1663);
    float _1675 = fma(_1611, _1599, _1605);
    float _1677 = fma(_1667, _1647, _1669);
    float _1679 = fma(_1631, _1653, _1671);
    float _1681 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1683 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1685 = fma(_1675, _1653, _1677);
    float _1687 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1689 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1681);
    float _1691 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1683);
    float _1693 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1687);
    float _1695 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1689);
    float _1697 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1691);
    float _1699 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1693);
    float _1701 = _1695 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1703 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1705 = _1699 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1707 = _855 + _1701;
    float _1709 = _1061 + _1703;
    float _1711 = _1337 + _1705;
    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1715 = _1707 + _1713;
    float _1717 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1719 = _1709 + _1717;
    float _1721 = _1715 * _1715;
    float _1723 = fma(_1719, _1719, _1721);
    float _1725 = sqrt(_1723);
    bool _1727 = _1725 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1729 = _1705;
    float _1731 = _1685;
    float _1733 = _1721;
    float _1735 = _1707;
    if (!_1727)
    {
        _1729 = _1709;
    }
    float _1737 = _1729;
    float _1739 = _1737;
    if (!_1727)
    {
        _1731 = _1707;
    }
    float _1741 = _1731;
    float _1743 = _1741;
    if (!_1727)
    {
        _1733 = _1711;
    }
    float _1745 = _1733;
    bool _1747 = !_1727;
    float _1749 = _1745;
    if (!_1747)
    {
        float _1751 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1753 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1755 = _1725 + _1753;
        float _1757 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1759 = _1755 * _1751;
        float _1761 = rsqrt(_1723);
        float _1763 = _1759 * 0.15915493667125701904296875;
        float _1765 = _1763 * 6.283185482025146484375;
        float _1767 = cos(_1765);
        float _1769 = _1763 * 6.283185482025146484375;
        float _1771 = sin(_1769);
        float _1773 = _1767 + (-1.0);
        float _1775 = fma(_1771, _1757, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1777 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1779 = _1761 * _1775;
        float _1781 = fma(_1711, _1767, _1777);
        float _1783 = fma(_1719, _1779, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1785 = fma(_1715, _1779, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1739 = _1783;
        _1749 = _1781;
        _1743 = _1785;
    }
    float _1787 = _1739;
    float _1789 = _1749;
    float _1791 = _1743;
    float _1793 = -_1467;
    float _1795 = fma(_1793, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1787);
    float _1797 = -_1465;
    float _1799 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1789);
    float _1801 = -_1473;
    float _1803 = fma(_1801, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1791);
    float _1805 = _1799;
    float _1807 = _1795;
    float _1809 = _1803;
    if (!_1623)
    {
        float _1811 = _1483 * _1483;
        float _1813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1815 = -_855;
        float _1817 = _1815 + _1791;
        float _1819 = -_1061;
        float _1821 = _1819 + _1787;
        float _1823 = fma(_1493, _1493, _1811);
        float _1825 = -_1337;
        float _1827 = _1825 + _1789;
        float _1829 = fma(_1501, _1501, _1823);
        float _1831 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1833 = sqrt(_1829);
        float _1835 = 1.0 / _1595;
        float _1837 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1839 = precise::min(_1833, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1841 = _1839 * _1813;
        float _1843 = _1841 * _1835;
        float _1845 = _1837 * _1843;
        float _1847 = _1817 * _1843;
        float _1849 = fma(_1821, _1845, _1477);
        float _1851 = fma(_1827, _1845, _1471);
        float _1853 = fma(_1837, _1847, _1489);
        _1805 = _1851;
        _1807 = _1849;
        _1809 = _1853;
        _1555 = _1845;
        _1557 = _1833;
    }
    float _1855 = _1805;
    float _1857 = _1807;
    float _1859 = _1809;
    float _1861 = _1555;
    float _1863 = _1557;
    float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1867 = _1855 + _1865;
    float _1869 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1871 = _1857 + _1869;
    float _1873 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1875 = _1859 + _1873;
    float _1877 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1879 = _1867 * _1867;
    float _1881 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1883 = fma(_1871, _1871, _1879);
    float _1885 = fma(_1875, _1875, _1883);
    float _1887 = rsqrt(_1885);
    float _1889 = sqrt(_1885);
    float _1891 = _1887 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1893 = _1871 * _1891;
    float _1895 = _1875 * _1891;
    float _1897 = _1893 * _1893;
    float _1899 = _1895 * _1895;
    float _1901 = _1897 + _1899;
    float _1903 = sqrt(_1901);
    bool _1905 = _1903 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1907 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1909 = _1903 + _1907;
    float _1911 = _1875;
    float _1913 = _1901;
    float _1915 = _1909;
    float _1917 = _1861;
    float _1919 = _1867;
    float _1921 = _1863;
    if (_1905)
    {
        float _1923 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1911 = _1923;
    }
    float _1925 = _1911;
    if (_1905)
    {
        float _1927 = rsqrt(_1901);
        _1913 = _1927;
    }
    float _1929 = _1913;
    float _1931 = _1929;
    if (_1905)
    {
        float _1933 = _1909 * _1925;
        _1915 = _1933;
    }
    float _1935 = _1915;
    if (_1905)
    {
        float _1937 = _1935 * 0.15915493667125701904296875;
        _1917 = _1937;
    }
    float _1939 = _1917;
    float _1941 = _1887;
    float _1943 = _1939;
    if (_1905)
    {
        float _1945 = _1939 * 6.283185482025146484375;
        float _1947 = sin(_1945);
        _1941 = _1947;
    }
    float _1949 = _1941;
    float _1951 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1953 = precise::max(0.0, _1951);
    float _1955 = _1925;
    float _1957 = _1953;
    if (_1905)
    {
        float _1959 = _1939 * 6.283185482025146484375;
        float _1961 = cos(_1959);
        _1955 = _1961;
    }
    float _1963 = _1955;
    float _1965 = -_1891;
    float _1967 = -_1953;
    float _1969 = fma(_1867, _1965, _1967);
    if (_1905)
    {
        float _1971 = _1969 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1919 = _1971;
    }
    float _1973 = _1919;
    if (!_1905)
    {
        _1943 = _1899;
    }
    float _1975 = _1943;
    float _1977 = _1949;
    float _1979 = _1975;
    if (_1905)
    {
        float _1981 = fma(_1949, _1973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1921 = _1981;
    }
    float _1983 = _1921;
    float _1985 = _1983;
    if (!_1905)
    {
        _1977 = _1969;
    }
    float _1987 = _1977;
    float _1989 = _1987;
    float _1991 = _1963;
    if (_1905)
    {
        float _1993 = _1963 + (-1.0);
        _1957 = _1993;
    }
    float _1995 = _1957;
    float _1997 = _1995;
    if (_1905)
    {
        float _1999 = _1929 * _1983;
        _1735 = _1999;
    }
    float _2001 = _1735;
    if (!_1905)
    {
        _1985 = _1893;
    }
    float _2003 = _1985;
    float _2005 = _2003;
    if (_1905)
    {
        float _2007 = _1995 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1997 = _2007;
    }
    float _2009 = _1997;
    if (_1905)
    {
        float _2011 = _1893 * _2001;
        _2005 = _2011;
    }
    float _2013 = _2005;
    if (!_1905)
    {
        _1931 = _1897;
    }
    float _2015 = _1931;
    float _2017 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2019 = _2015;
    if (_1905)
    {
        float _2021 = fma(_1969, _1963, _2009);
        _1989 = _2021;
    }
    float _2023 = _1989;
    if (!_1905)
    {
        _1991 = _1895;
    }
    float _2025 = _1991;
    float _2027 = _2025;
    if (_1905)
    {
        float _2029 = _1895 * _2001;
        _2027 = _2029;
    }
    float _2031 = _2027;
    if (_1905)
    {
        float _2033 = _2013 * _2013;
        _2019 = _2033;
    }
    float _2035 = _2019;
    if (_1905)
    {
        float _2037 = _2031 * _2031;
        _1979 = _2037;
    }
    float _2039 = _1979;
    float _2041 = fma(_2023, _2023, _2035);
    float _2043 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2017);
    float _2045 = _2041 + _2039;
    float _2047 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2043);
    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2051 = fma(_1889, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2049);
    float _2053 = precise::clamp(_2051, 0.0, 1.0);
    float _2055 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2057 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2059 = rsqrt(_2045);
    float _2061 = -_2053;
    float _2063 = _2061 + 1.0;
    float _2065 = fma(_1489, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2067 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2069 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2071 = -_2067;
    float _2073 = fma(_2071, _2055, 1.0);
    float _2075 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1877);
    float _2077 = abs(_2063);
    float _2079 = log2(_2077);
    float _2081 = fma(_1477, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2083 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2075);
    float _2085 = _2059 * _2031;
    float _2087 = _2059 * _2013;
    float _2089 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2069);
    float _2091 = _2059 * _2023;
    float _2093 = _2083 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2095 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2097 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2089);
    float _2099 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1881);
    float _2101 = floor(_2081);
    float _2103 = -_2095;
    float _2105 = fma(_2091, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2103);
    float _2107 = _2097 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2109 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2111 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2099);
    float _2113 = -_2085;
    float _2115 = fma(_2113, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2105);
    float _2117 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2119 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2109);
    float _2121 = floor(_2065);
    float _2123 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2125 = fma(_2115, 0.5, 0.5);
    float _2127 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2119);
    float _2129 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2127);
    float _2131 = log2(_2073);
    float _2133 = -_2101;
    float _2135 = _2081 + _2133;
    float _2137 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2139 = fma(_2125, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2141 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2137);
    float _2143 = fma(_2125, _2139, -0.212114393711090087890625);
    float _2145 = 1.0 / _2129;
    float _2147 = fma(_2115, -0.5, 0.5);
    float _2149 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2151 = -_2121;
    float _2153 = _2065 + _2151;
    float _2155 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2141);
    float _2157 = fma(_2125, _2143, 1.570728778839111328125);
    float _2159 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2149);
    float _2161 = _2091 + 1.0;
    float _2163 = sqrt(_2147);
    float _2165 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2155);
    float _2167 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2159);
    float _2169 = _2131 * 0.693147182464599609375;
    float _2171 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2167);
    float _2173 = exp2(_2117);
    float _2175 = _2165 * _2145;
    float _2177 = _2171 * _2145;
    float2 _6164 = float2(_2135, _2153);
    float _2179 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6164, float2(0.0), isnan(_6164)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6164, float2(0.0), isnan(_6164)), level(0.0)).x;
    float _2181 = fma(_2175, 0.5, 0.5);
    float _2183 = fma(_2177, -0.5, 0.5);
    float _2185 = _2163 * 0.636619746685028076171875;
    float _2187 = -_2157;
    float _2189 = fma(_2185, _2187, 1.0);
    float _2191 = _2169 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2193 = -_2091;
    float _2195 = fma(_2173, _2161, _2193);
    float3 _6197 = float3(_2181, _2183, _2191);
    float _2197 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6197, float3(0.0), isnan(_6197)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6197, float3(0.0), isnan(_6197)), level(0.0)).x;
    float _2199 = fma(_2195, 0.5, 0.5);
    float3 _6210 = float3(_2181, _2183, _2191);
    float4 _2202 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6210, float3(0.0), isnan(_6210)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6210, float3(0.0), isnan(_6210)), level(0.0)).xyzw;
    float _2204 = _2202.x;
    float _2206 = _2202.y;
    float _2208 = _2202.z;
    float _2210 = _2202.w;
    float2 _6226 = float2(_2189, _2199);
    float3 _2214 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6226, float2(0.0), isnan(_6226)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6226, float2(0.0), isnan(_6226)), level(0.0)).xyz;
    float _2216 = _2214.x;
    float _2218 = _2214.y;
    float _2220 = _2214.z;
    float _2222 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2224 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2226 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2228 = _1587 != 0.0;
    bool _2230 = isnan(_1587);
    bool _2232 = _2228 || _2230;
    bool _2234 = isnan(0.0);
    bool _2236 = _2232 || _2234;
    float _2238 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2222);
    float _2240 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2224);
    float _2242 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2244 = _1585 == 0.0;
    bool _2246 = !_2236;
    bool _2248 = _2244 && _2246;
    float _2250 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2238);
    float _2252 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2240);
    float _2254 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2256 = _2250 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2258 = _2252 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2260 = _1589 == 0.0;
    bool _2262 = _2260 && _2248;
    float _2264 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2254);
    float _2266 = 1.0 / _2256;
    float _2268 = _2258 + _2256;
    float _2270 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2272 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2274 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2276 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2278 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2280 = exp2(_2242);
    float _2282 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2284 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2276);
    float _2286 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2282);
    float _2288 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2290 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2292 = _2268 * _2266;
    float _2294 = _2292 * 0.5;
    float _2296 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2226);
    float _2298 = -_1611;
    float _2300 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2288);
    float _2302 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2272);
    float _2304 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2306 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2304);
    float _2308 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2274);
    float _2310 = in.m_77.x;
    float _2312 = in.m_77.y;
    float _2314 = in.m_77.z;
    float _2316 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2300);
    float _2318 = 1.0 / _2306;
    float _2320 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2278);
    float _2322 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2302);
    float _2324 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2308);
    float _2326 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2284);
    float _2328 = -_2280;
    float _2330 = _2328 + 1.0;
    float _2332 = _2129 * 0.5;
    float _2334 = -_1611;
    float _2336 = fma(_2334, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2270);
    float _2338 = -_1611;
    float _2340 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2290);
    float _2342 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2264);
    float _2344 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2286);
    float _2346 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2296);
    float _2348 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2340);
    float _2350 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2336);
    float _2352 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2354 = _2318 * _2352;
    float _2356 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2320);
    float _2358 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2326);
    float _2360 = abs(_2354);
    float _2362 = log2(_2360);
    float _2364 = _2310;
    float _2366 = _2312;
    float _2368 = _2314;
    float _2370 = _2320;
    float _2372 = _2171;
    float _2374 = _2165;
    if (!_2262)
    {
        float _2376 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2310);
        _2364 = _2376;
    }
    float _2378 = _2364;
    if (!_2262)
    {
        float _2380 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2312);
        _2366 = _2380;
    }
    float _2382 = _2366;
    if (!_2262)
    {
        float _2384 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2314);
        _2368 = _2384;
    }
    float _2386 = _2368;
    bool _2388 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2390 = isnan(0.5);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2396 = _2392 || _2394;
    float _2398 = fma(_2171, -0.5, _2332);
    float _2400 = _2348 * _2382;
    float _2402 = _2316 * _2382;
    float _2404 = _2350 * _2382;
    out.gl_Position.x = _2165;
    out.gl_Position.y = _2171;
    out.gl_Position.z = _2358;
    out.gl_Position.w = _2129;
    float _2406 = fma(_2346, _2378, _2400);
    float _2408 = fma(_2344, _2378, _2402);
    bool _2410 = _2354 <= 8000.0;
    bool _2412 = isnan(_2354);
    bool _2414 = _2410 || _2412;
    bool _2416 = isnan(8000.0);
    bool _2418 = _2414 || _2416;
    float _2420 = float(_2418);
    float _2422 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2424 = in.m_79.x;
    float _2426 = fma(_2342, _2378, _2404);
    float _2428 = fma(_2324, _2386, _2408);
    float _2430 = _2400;
    float _2432 = _2398;
    if (!_2396)
    {
        float _2434 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2436 = _2354 + _2434;
        _2370 = _2436;
    }
    float _2438 = _2370;
    if (_2396)
    {
        _2430 = 1.0;
    }
    float _2440 = _2430;
    float _2442 = exp2(_2422);
    float _2444 = fma(_2322, _2386, _2426);
    float _2446 = fma(_2356, _2386, _2406);
    float _2448 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2444;
    out.m_81.y = _2428;
    out.m_81.z = _2446;
    float _2450 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2452 = precise::clamp(_2450, 0.0, 1.0);
    float _2454 = fma(_2452, -2.0, 3.0);
    float _2456 = _2452 * _2452;
    float _2458 = _2456 * _2454;
    float _2460 = _2454;
    float _2462 = _2440;
    float _2464 = _2129;
    if (!_2396)
    {
        _2460 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2466 = _2460;
    float _2468 = -_2458;
    float _2470 = _2468 + 1.0;
    float _2472 = _2466;
    if (!_2396)
    {
        float _2474 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2476 = _2466 + _2474;
        _2472 = _2476;
    }
    float _2478 = _2472;
    float _2480 = fma(_2470, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2458);
    float _2482 = _2358 + _2129;
    float _2484 = _2286;
    if (!_2396)
    {
        float _2486 = 1.0 / _2478;
        _2484 = _2486;
    }
    float _2488 = _2484;
    float _2490 = _2420 * _2480;
    float _2492 = _2482 * 0.5;
    float _2494 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2496 = _2165 + _2129;
    float _2498 = _2496 * 0.5;
    float _2500 = _2492;
    if (!_2396)
    {
        float _2502 = _2438 * _2488;
        float _2504 = precise::clamp(_2502, 0.0, 1.0);
        _2462 = _2504;
    }
    float _2506 = _2462;
    out.m_83.x = _2498;
    out.m_83.y = _2398;
    out.m_83.z = _2492;
    out.m_83.w = _2129;
    bool _2508 = _1889 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2510 = isnan(_1889);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2516 = _2512 || _2514;
    float _2518 = _2506 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2520 = -_2448;
    float _2522 = _2520 + 1.0;
    float _2524 = _2522;
    if (!_2516)
    {
        _2372 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2526 = _2372;
    float _2528 = _2526;
    float _2530 = _2526;
    if (!_2516)
    {
        _2374 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2532 = _2374;
    float _2534 = _2532;
    float _2536 = _2532;
    if (!_2516)
    {
        _2464 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2538 = _2464;
    float _2540 = _2538;
    float _2542 = _2538;
    if (!_2516)
    {
        _2500 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2544 = _2500;
    float _2546 = _2544;
    float _2548 = _2544;
    if (!_2516)
    {
        _2432 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2550 = _2432;
    float _2552 = -_2179;
    float _2554 = _2552 + 1.0;
    float _2556 = _2554 * _2494;
    float _2558 = precise::clamp(_2556, 0.0, 1.0);
    float _2560 = -_2558;
    float _2562 = fma(_2560, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2564 = _2562 * _2424;
    float _2566 = _2448 * _2197;
    float _2568 = _2564 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2570 = _2210 * _2566;
    float _2572 = _2210 * _2522;
    out.m_85.x = _2568;
    float _2574 = _2550;
    float _2576 = _2550;
    if (!_2516)
    {
        _2524 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2578 = _2524;
    float _2580 = _2220 * _2566;
    float _2582 = fma(_2216, _2570, _2204);
    float _2584 = fma(_2218, _2570, _2206);
    float _2586 = fma(_2210, _2580, _2208);
    out.m_87.x = _2582;
    out.m_87.y = _2584;
    out.m_87.z = _2586;
    out.m_87.w = _2572;
    bool _2588 = !_2516;
    float _2590 = _2578;
    float _2592 = _2578;
    if (!_2588)
    {
        bool _2594 = _1889 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2596 = isnan(_1889);
        bool _2598 = _2594 || _2596;
        bool _2600 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2602 = _2598 || _2600;
        if (!_2602)
        {
            float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2606 = _1889 + _2604;
            float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2610 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2608;
            float _2612 = 1.0 / _2610;
            float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2632 = _2630 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2634 = _2606 * _2612;
            float _2636 = precise::clamp(_2634, 0.0, 1.0);
            float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2642 = fma(_2636, _2616, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2644 = fma(_2636, _2640, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2646 = fma(_2636, _2620, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2648 = fma(_2636, _2624, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2650 = fma(_2636, _2628, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2652 = fma(_2636, _2632, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2536 = _2644;
            _2576 = _2650;
            _2530 = _2642;
            _2548 = _2648;
            _2542 = _2646;
            _2592 = _2652;
            _2654 = true;
        }
        else
        {
            bool _2656 = _1889 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2658 = isnan(_1889);
            bool _2660 = _2656 || _2658;
            bool _2662 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2664 = _2660 || _2662;
            if (!_2664)
            {
                _2528 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2666 = _2528;
            _2530 = _2666;
            if (!_2664)
            {
                _2534 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2668 = _2534;
            _2536 = _2668;
            if (!_2664)
            {
                _2540 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2670 = _2540;
            _2542 = _2670;
            if (!_2664)
            {
                _2546 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2672 = _2546;
            _2548 = _2672;
            if (!_2664)
            {
                _2574 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2674 = _2574;
            _2576 = _2674;
            if (!_2664)
            {
                _2590 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2676 = _2590;
            bool _2678 = !_2664;
            _2592 = _2676;
            if (!_2678)
            {
                bool _2680 = _1889 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2682 = isnan(_1889);
                bool _2684 = _2680 || _2682;
                bool _2686 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2688 = _2684 || _2686;
                if (!_2688)
                {
                    float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2692 = _1889 + _2690;
                    float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2696 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2694;
                    float _2698 = 1.0 / _2696;
                    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2720 = _2692 * _2698;
                    float _2722 = precise::clamp(_2720, 0.0, 1.0);
                    float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2728 = fma(_2722, _2702, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2730 = fma(_2722, _2726, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2732 = fma(_2722, _2706, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2734 = fma(_2722, _2710, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2736 = fma(_2722, _2714, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2738 = fma(_2722, _2718, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2536 = _2730;
                    _2576 = _2736;
                    _2530 = _2728;
                    _2548 = _2734;
                    _2542 = _2732;
                    _2592 = _2738;
                    _2654 = true;
                }
                else
                {
                    _2536 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2576 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2530 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2548 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2542 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2592 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2654 = false;
    float _2740 = _2536;
    float _2742 = _2576;
    float _2744 = _2530;
    float _2746 = _2548;
    float _2748 = _2542;
    float _2750 = _2592;
    float _2752 = fma(_2428, -0.5, 0.5);
    float _2754 = precise::clamp(_2752, 0.0, 1.0);
    float _2756 = -_2740;
    float _2758 = _2756 + _2742;
    float _2760 = -_2744;
    float _2762 = _2760 + _2746;
    out.m_89.x = 0.0;
    float _2764 = fma(_2754, _2758, _2740);
    float _2766 = -_2748;
    float _2768 = _2766 + _2750;
    float _2770 = fma(_2754, _2762, _2744);
    float _2772 = _2764 * 0.586610972881317138671875;
    bool _2774 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2776 = fma(_2754, _2768, _2748);
    float _2778 = _2518 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2780 = fma(_2770, 0.298911988735198974609375, _2772);
    bool _2782 = _2506 > 0.0;
    bool _2784 = isnan(_2506);
    bool _2786 = _2782 || _2784;
    bool _2788 = isnan(0.0);
    bool _2790 = _2786 || _2788;
    float _2792 = fma(_2776, 0.114477999508380889892578125, _2780);
    out.m_53.x = _2778;
    float _2794 = -_2792;
    float _2796 = _2770 + _2794;
    float _2798 = -_2792;
    float _2800 = _2764 + _2798;
    float _2802 = -_2792;
    float _2804 = _2776 + _2802;
    float _2806 = fma(_2796, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2792);
    float _2808 = fma(_2800, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2792);
    float _2810 = fma(_2804, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2792);
    bool _2812 = !_2774;
    if (!_2812)
    {
        float _2814 = -_1855;
        float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2818 = -_1857;
        float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2822 = -_1859;
        float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2826 = _2816 * _2816;
        float _2828 = fma(_2820, _2820, _2826);
        float _2830 = fma(_2824, _2824, _2828);
        float _2832 = sqrt(_2830);
        float _2834 = rsqrt(_2830);
        float _2836 = -_2832;
        float _2838 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2840 = _2838 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2842 = precise::clamp(_2840, 0.0, 1.0);
        float _2844 = _2820 * _2834;
        float _2846 = _2816 * _2834;
        float _2848 = abs(_2842);
        float _2850 = log2(_2848);
        float _2852 = _2824 * _2834;
        float _2854 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2856 = _2428 * _2846;
        float _2858 = -_2846;
        float _2860 = -_2854;
        float _2862 = fma(_2858, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2860);
        float _2864 = fma(_2444, _2844, _2856);
        float _2866 = -_2852;
        float _2868 = fma(_2866, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2862);
        float _2870 = fma(_2446, _2852, _2864);
        float _2872 = precise::clamp(_2870, 0.0, 1.0);
        float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2876 = _2868 + _2874;
        float _2878 = _2850 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2880 = _2876 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2882 = precise::clamp(_2880, 0.0, 1.0);
        float _2884 = exp2(_2878);
        float _2886 = _2884 * _2882;
        float _2888 = _2872 * _2886;
        float _2890 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2892 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2894 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2890;
        out.m_89.y = _2892;
        out.m_89.z = _2894;
    }
    out.m_91.x = _2806;
    out.m_91.y = _2808;
    out.m_91.z = _2810;
    if (_2790)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2896 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2896;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2654 = false;
    bool _470 = false;
    bool _350 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2965 = as_type<float>(_134);
        out.gl_Position.z = _2965;
    }
    if (!_120)
    {
        return out;
    }
    bool _138 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_107);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3020 = as_type<float>(_160);
        out.gl_Position.z = _3020;
    }
    if (_154)
    {
        return out;
    }
    float _162 = 1.0 / _148;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _116 * _162;
    bool _168 = !_164;
    float _186;
    if (!_168)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        _186 = _166;
    }
    _188 = false;
    float _190 = _186;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _194 = _190 + _192;
    bool _196 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _198 = isnan(_190);
    bool _200 = _196 || _198;
    bool _202 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _204 = _200 || _202;
    float _206 = float(_204);
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _190 + _208;
    bool _212 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _214 = isnan(_190);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _220 = _216 || _218;
    float _222 = float(_220);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _232 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _234 = isnan(_190);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    float _244 = -_206;
    float _246 = _244 + 1.0;
    float _248 = 1.0 / _230;
    float _250 = _242 * _246;
    float _252 = -_242;
    float _254 = _252 + 1.0;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = 1.0 / _226;
    float _264 = _222 * _254;
    float _266 = -_222;
    float _268 = _266 + 1.0;
    float _270 = _210 * _248;
    float _272 = _194 * _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    float _282 = fma(_258, _272, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _284 = fma(_276, _272, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _286 = fma(_280, _272, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _288 = _282 * _264;
    float _290 = _284 * _264;
    float _292 = _286 * _264;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _306 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _288);
    float _308 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _290);
    float _310 = fma(_296, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _312 = fma(_300, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _314 = fma(_304, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _316 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].z, _292);
    float _318 = fma(_310, _250, _306);
    float _320 = fma(_312, _250, _308);
    float _322 = fma(_314, _250, _316);
    float _324 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].x, _318);
    float _326 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].y, _320);
    float _328 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].z, _322);
    bool _330 = !_260;
    float _348;
    if (!_330)
    {
        float _332 = in.m_55.x;
        float _334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _336 = _332 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _340 = _338 * _334;
        float _342 = floor(_340);
        float _344 = -_342;
        float _346 = _340 + _344;
        _348 = _346;
        _350 = true;
    }
    else
    {
        _348 = _166;
    }
    _350 = false;
    float _352 = _348;
    float _354 = in.m_57.x;
    float _356 = in.m_57.y;
    float _358 = in.m_57.z;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _362 = _352 + _360;
    bool _364 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _366 = isnan(_352);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _378;
    float _382 = 1.0 / _380;
    float _384 = _328 * _358;
    float _386 = _326 * _356;
    float _388 = _362 * _382;
    float _390 = -_374;
    float _392 = _390 + 1.0;
    bool _394 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _396 = isnan(_352);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _414;
    float _418 = _404 * _392;
    float _420 = fma(_408, _388, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _422 = fma(_412, _388, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _424 = fma(_416, _388, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _426 = -_404;
    float _428 = _426 + 1.0;
    float _430 = _420 * _418;
    float _432 = _422 * _418;
    float _434 = _424 * _418;
    float _436 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[107].x, _430);
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[107].y, _432);
    float _440 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[107].z, _434);
    float _442 = _324 * _354;
    float _444 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[108].x, _436);
    float _446 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[108].y, _438);
    float _448 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[108].z, _440);
    bool _450 = !_376;
    float _468;
    if (!_450)
    {
        float _452 = in.m_55.x;
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _456 = _452 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _460 = _458 * _454;
        float _462 = floor(_460);
        float _464 = -_462;
        float _466 = _460 + _464;
        _468 = _466;
        _470 = true;
    }
    else
    {
        _468 = _166;
    }
    _470 = false;
    float _472 = _468;
    float _474 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _476 = int(_474);
    float _478 = in.m_59.y;
    float _480 = in.m_61.y;
    float _482 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _484 = int(_482);
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _488 = in.m_59.w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _492 = in.m_59.z;
    float _494 = float(_476);
    float _496 = 1.0 / _494;
    float _498 = float(uint(_484));
    int _500 = ~_484;
    int _502 = _500 + 1;
    out.m_63.y = _478;
    int _504 = ~_484;
    int _506 = _504 + 1;
    float _508 = 1.0 / _498;
    int _510 = ~_484;
    int _512 = _510 + 1;
    out.m_63.w = _488;
    float _514 = _496 * _116;
    out.m_63.z = _492;
    float _516 = trunc(_514);
    int _518 = int(_516);
    int _520 = as_type<int>(_508) + (-2);
    float _522 = float(uint(_518));
    float _524 = as_type<float>(_520) * _522;
    float _526 = trunc(_524);
    float _528 = precise::max(_526, 0.0);
    uint _531 = uint(_528);
    int _533 = _502 * int(_531);
    int _535 = _533 + _518;
    float _537 = in.m_55.x;
    float _539 = in.m_55.y;
    float _541 = float(uint(_535));
    float _543 = as_type<float>(_520) * _541;
    int _545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _547 = _545 != 0;
    float _549 = trunc(_543);
    float _551 = precise::max(_549, 0.0);
    uint _553 = uint(_551);
    bool _555 = !_547;
    float _557 = _555 ? 7.345489978790283203125 : 1.0;
    float _559 = float(_518);
    float _561 = _557 * _537;
    float _563 = _537 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _565 = floor(_561);
    int _567 = int(_531) + int(_553);
    float _569 = -_490;
    float _571 = fma(_563, 2.0, _569);
    float _573 = float(_484);
    int _575 = _506 * _567;
    int _577 = _575 + _518;
    bool _579 = _559 >= _573;
    bool _581 = isnan(_559);
    bool _583 = _579 || _581;
    bool _585 = isnan(_573);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = -_116;
    float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[76].x, _571);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _595;
    bool _599 = uint(_577) >= uint(_484);
    float _601 = trunc(_589);
    int _603 = int(_601);
    float _605 = in.m_59.x;
    bool _607 = !_599;
    int _609 = _607 ? 0 : (-1);
    float _611 = -_565;
    float _613 = _561 + _611;
    bool _615 = _484 == 0;
    int _617 = ~_567;
    int _619 = _617 + _609;
    int _621 = _619 + 1;
    float _623 = _613 * _573;
    float _625 = _573 * _116;
    int _627 = _484 * _621;
    int _629 = _627 + _518;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _633 = _631 != 0;
    float _635 = _625 * _162;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _639 = _637 != 0;
    float _641 = trunc(_623);
    int _643 = int(_641);
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _647 = _645 != 0;
    int _649 = ~_603;
    int _651 = _649 + 1;
    int _653 = _651 + 1;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _657 = _655 != 0;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _661 = _659 != 0;
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _665 = _663 != 0;
    bool _667 = !_615;
    int _669 = _667 ? _629 : (-1);
    float _671 = trunc(_635);
    int _673 = int(_671);
    bool _675 = !_647;
    int _677 = _675 ? 0 : 1;
    float _679 = 0.0;
    float _681 = _480;
    if (_633)
    {
        float _683 = in.m_55.x;
        _679 = _683;
    }
    float _685 = _679;
    bool _687 = !_661;
    int _689 = _687 ? 0 : 1;
    int _691 = _669 * _653;
    int _693 = _484 + (-1);
    out.m_63.x = _605;
    bool _695 = !_657;
    int _697 = _695 ? 0 : 1;
    int _699 = abs(_689);
    int _701 = _603 * _693;
    int _703 = _701 + _691;
    int _705 = abs(_697);
    int _707 = abs(_677);
    int _709 = _703 * _699;
    float _711 = _539 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _715 = _713 != 0;
    int _717 = _673 * _705;
    int _719 = _717 + _709;
    bool _721 = !_665;
    int _723 = _721 ? 0 : 1;
    int _725 = _643 * _707;
    int _727 = _725 + _518;
    bool _729 = !_715;
    int _731 = _729 ? 0 : 1;
    float _733 = in.m_46.x;
    float _735 = in.m_46.y;
    float _737 = in.m_46.z;
    int _739 = abs(_723);
    float _741 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _743 = log2(_741);
    int _745 = abs(_731);
    float _747 = -_480;
    float _749 = _747 + 1.0;
    bool _751 = _539 > 0.5;
    int _753 = _727 * _739;
    int _755 = _753 + _719;
    float _757 = fma(_711, -2.0, _486);
    int _759 = _643 * _745;
    int _761 = _759 + _755;
    if (_639)
    {
        float _763 = _751 ? _749 : _480;
        _681 = _763;
    }
    float _765 = _681;
    float _767 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _757);
    float _769 = float(uint(_761));
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _775 = as_type<float>(_520) * _769;
    bool _777 = _685 > 0.5;
    bool _779 = _777 && _633;
    float _781 = 1.0 / _773;
    float _783 = _735 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _785 = _735 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _787 = _735 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _795 = trunc(_775);
    float _797 = precise::max(_795, 0.0);
    uint _799 = uint(_797);
    float _801 = _743 * _116;
    float _803 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _807 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = fma(_733, (*spvDescriptorSet0.vp_c10)._m0[5].x, _785);
    float _813 = _537 * 2.0;
    float _815 = in.m_55.z;
    float _817 = exp2(_801);
    float _819 = fma(_733, (*spvDescriptorSet0.vp_c10)._m0[4].x, _783);
    float _821 = fma(_733, (*spvDescriptorSet0.vp_c10)._m0[6].x, _787);
    out.m_65.x = _807;
    out.m_65.y = _803;
    out.m_65.z = _809;
    out.m_65.w = _805;
    bool _823 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _825 = isnan(1.0);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _831 = _827 || _829;
    float _833 = _597 * _781;
    float _835 = _539 + _537;
    float _837 = in.m_61.x;
    float _839 = floor(_813);
    bool _841 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _843 = isnan(0.0);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _849 = _845 || _847;
    float _851 = _835 + (-1.0);
    float _853 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[6].z, _821);
    float _855 = _853 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _857 = -_817;
    float _859 = _857 + 1.0;
    int _861 = _512 * int(_799);
    int _863 = _861 + _761;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _867 = 1.0 + _865;
    float _869 = _849 ? _859 : 0.0;
    float _871 = 1.0 / _867;
    float _873 = float(uint(_863));
    float _875 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _877 = _839 > 0.0;
    float _879 = _539 + _815;
    bool _881 = _839 >= 0.0;
    bool _883 = isnan(_839);
    bool _885 = _881 || _883;
    bool _887 = isnan(0.0);
    bool _889 = _885 || _887;
    float _891 = as_type<float>(_520) * _873;
    float _893 = _539 * 2.0;
    float _895 = trunc(_891);
    float _897 = precise::max(_895, 0.0);
    uint _899 = uint(_897);
    float _901 = _879 + (-1.0);
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _905 = 0.0;
    float _907 = _837;
    float _909 = _875;
    if (_633)
    {
        _905 = _837;
    }
    float _911 = _905;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _915 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[78].z, _903);
    float _917 = floor(_893);
    int _919 = ~_484;
    int _921 = _919 + 1;
    float _923 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[78].w, _913);
    float _925 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _915);
    float _927 = _911;
    if (_779)
    {
        float _929 = -_911;
        float _931 = _929 + 1.0;
        _927 = _931;
    }
    float _933 = _927;
    float _935 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _923);
    if (_831)
    {
        float _937 = _869 * _871;
        _126 = _937;
    }
    float _939 = _126;
    int _941 = int(_799) + int(_899);
    float _943 = _815 * 2.0;
    int _945 = _889 ? 0 : 1;
    float _947 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_633)
    {
        _907 = _933;
    }
    float _949 = _907;
    int _951 = _921 * _941;
    int _953 = _951 + _761;
    bool _955 = _917 >= 0.0;
    bool _957 = isnan(_917);
    bool _959 = _955 || _957;
    bool _961 = isnan(0.0);
    bool _963 = _959 || _961;
    bool _965 = uint(_953) >= uint(_484);
    bool _967 = _917 > 0.0;
    float _969 = floor(_943);
    bool _971 = !_965;
    int _973 = _971 ? 0 : (-1);
    int _975 = _963 ? 0 : 1;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _983 = _981 != 0;
    int _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _987 = _985 != 0;
    bool _989 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _991 = isnan(_472);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _997 = _993 || _995;
    float _999 = float(_997);
    int _1001 = ~_941;
    int _1003 = _1001 + _973;
    int _1005 = _1003 + 1;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1009 = _472 + _1007;
    bool _1011 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1013 = isnan(_472);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1019 = _1015 || _1017;
    float _1021 = float(_1019);
    float _1023 = -_999;
    float _1025 = _1023 + 1.0;
    int _1027 = ~_945;
    int _1029 = _1027 + 1;
    int _1031 = _1029 + 1;
    int _1033 = _484 * _1005;
    int _1035 = _1033 + _761;
    float _1037 = fma(_833, _1009, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1039 = _1021 * _1025;
    float _1041 = float(uint(_727));
    bool _1043 = !_615;
    int _1045 = _1043 ? _1035 : (-1);
    float _1047 = _1037 * _1039;
    int _1049 = _1031;
    if (!_877)
    {
        int _1051 = ~_945;
        int _1053 = _1051 + 1;
        _1049 = _1053;
    }
    int _1055 = _1049;
    float _1057 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[4].z, _819);
    bool _1059 = _969 > 0.0;
    float _1061 = _1057 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1063 = _969 >= 0.0;
    bool _1065 = isnan(_969);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan(0.0);
    bool _1071 = _1067 || _1069;
    float _1073 = -_1021;
    float _1075 = _1073 + 1.0;
    float _1077 = as_type<float>(_520) * _1041;
    int _1079 = _1045 >> 31;
    float _1081 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1083 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[5].z, _811);
    int _1085 = ~_975;
    int _1087 = _1085 + 1;
    int _1089 = _1087 + 1;
    float _1091 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1047);
    int _1093 = _1079 & 3;
    float _1095 = trunc(_1077);
    float _1097 = precise::max(_1095, 0.0);
    uint _1099 = uint(_1097);
    int _1101 = _1089;
    if (!_967)
    {
        int _1103 = ~_975;
        int _1105 = _1103 + 1;
        _1101 = _1105;
    }
    int _1107 = _1101;
    float _1109 = -_767;
    float _1111 = fma(_935, _1081, _1109);
    int _1113 = _1045 + _1093;
    float _1115 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1117 = !_983;
    int _1119 = _1117 ? 0 : 1;
    float _1121 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1091);
    int _1123 = _1113 >> 2;
    float _1125 = fma(_925, _1115, _593);
    int _1127 = abs(_1119);
    float _1129 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1131 = _1123 << 4;
    int _1133 = _1131 + 368;
    float _1135 = _1121 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1137 = ~_484;
    int _1139 = _1137 + 1;
    float _1141 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1111 + 0.5;
    float _1145 = float(_1055);
    int _1147 = _1139 * int(_1099);
    int _1149 = _1147 + _727;
    uint _1151 = uint(int(uint(_1133) >> uint(2)));
    uint _1153 = uint(int(uint(int(_1151)) >> uint(2)));
    int _1155 = int(_1151) & 3;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[int(_1153)][_1155];
    int _1159 = int(_1151) + 1;
    uint _1161 = uint(int(uint(_1159) >> uint(2)));
    int _1163 = _1159 & 3;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[int(_1161)][_1163];
    int _1167 = _1071 ? 0 : 1;
    float _1169 = float(_1127);
    int _1171 = ~_1167;
    int _1173 = _1171 + 1;
    int _1175 = _1173 + 1;
    int _1177 = _1175;
    if (!_1059)
    {
        int _1179 = ~_1167;
        int _1181 = _1179 + 1;
        _1177 = _1181;
    }
    int _1183 = _1177;
    float _1185 = _1169 * _1145;
    float _1187 = float(uint(_1149));
    float _1189 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1191 = _1045 & 3;
    bool _1193 = _1191 != 0;
    float _1195 = _1185 * (-2.0);
    int _1197 = _1045 & 3;
    bool _1199 = _1197 != 0;
    float _1201 = as_type<float>(_520) * _1187;
    bool _1203 = !_979;
    int _1205 = _1203 ? 0 : 1;
    float _1207 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1209 = uint(_1197) > 1u;
    float _1211 = trunc(_1201);
    float _1213 = precise::max(_1211, 0.0);
    uint _1215 = uint(_1213);
    int _1217 = abs(_1205);
    float _1219 = _448 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1221 = float(_1183);
    int _1223 = _1133 + 8;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    uint _1227 = uint(int(uint(int(_1225)) >> uint(2)));
    int _1229 = int(_1225) & 3;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[int(_1227)][_1229];
    int _1233 = int(_1225) + 1;
    uint _1235 = uint(int(uint(_1233) >> uint(2)));
    int _1237 = _1233 & 3;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[int(_1235)][_1237];
    float _1241 = float(_1217);
    float _1243 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1245 = _1193 ? 0 : 1;
    int _1247 = ~_484;
    int _1249 = _1247 + 1;
    float _1251 = _1241 * _1221;
    int _1253 = ~_1245;
    int _1255 = _1253 + 1;
    int _1257 = _1255 + 1;
    out.m_67.x = _1141;
    out.m_67.y = _1207;
    out.m_67.z = _1243;
    out.m_67.w = _1135;
    int _1259 = _1257;
    if (!_1209)
    {
        int _1261 = ~_1245;
        int _1263 = _1261 + 1;
        _1259 = _1263;
    }
    int _1265 = _1259;
    float _1267 = _1251 * (-2.0);
    bool _1269 = _1197 != 3;
    int _1271 = int(_1099) + int(_1215);
    bool _1273 = !_1199;
    int _1275 = _1273 ? 0 : 1;
    int _1277 = abs(_1265);
    int _1279 = abs(_1275);
    int _1281 = _1249 * _1271;
    int _1283 = _1281 + _727;
    float _1285 = _1125 + 0.5;
    bool _1287 = uint(_1197) >= 2u;
    int _1289 = ~_1277;
    int _1291 = _1289 + 1;
    int _1293 = _1291 + 1;
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1297 = _1061 + _1295;
    out.m_69.x = _1285;
    out.m_69.y = _1143;
    int _1299 = _1287 ? 0 : 1;
    int _1301 = _1293 * as_type<int>(_1165);
    int _1303 = ~_1279;
    int _1305 = _1303 + 1;
    int _1307 = _1305 + 1;
    int _1309 = ~_1299;
    int _1311 = _1309 + 1;
    int _1313 = _1311 + 1;
    int _1315 = _1313;
    if (_1269)
    {
        int _1317 = ~_1299;
        int _1319 = _1317 + 1;
        _1315 = _1319;
    }
    int _1321 = _1315;
    int _1323 = _1307 * as_type<int>(_1157);
    int _1325 = _1323 + _1301;
    int _1327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1329 = _1327 != 0;
    float _1331 = in.m_71.x;
    float _1333 = in.m_71.y;
    float _1335 = in.m_71.z;
    float _1337 = _1083 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1339 = _1197 != 3;
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1343 = _855 + _1341;
    bool _1345 = uint(_1283) >= uint(_484);
    float _1347 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1349 = _1337 + _1347;
    bool _1351 = !_1339;
    int _1353 = _1351 ? 0 : (-1);
    int _1355 = abs(_1321);
    float _1357 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1359 = !_1345;
    int _1361 = _1359 ? 0 : (-1);
    int _1363 = abs(_1353);
    float _1365 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1357);
    bool _1367 = !_1329;
    int _1369 = _1367 ? 0 : 1;
    int _1371 = ~_1355;
    int _1373 = _1371 + 1;
    int _1375 = _1373 + 1;
    float _1377 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1365);
    int _1379 = ~_1271;
    int _1381 = _1379 + _1361;
    int _1383 = _1381 + 1;
    int _1385 = abs(_1369);
    int _1387 = _1375 * as_type<int>(_1231);
    int _1389 = _1387 + _1325;
    int _1391 = ~_1363;
    int _1393 = _1391 + 1;
    int _1395 = _1393 + 1;
    int _1397 = _484 * _1383;
    int _1399 = _1397 + _727;
    float _1401 = _1349 * _1349;
    bool _1403 = _1377 >= 0.0;
    float _1405 = fma(_1267, _1331, _1331);
    int _1407 = ~_1385;
    int _1409 = _1407 + 1;
    int _1411 = _1409 + 1;
    int _1413 = _1395 * as_type<int>(_1239);
    int _1415 = _1413 + _1389;
    float _1417 = fma(_1297, _1297, _1401);
    bool _1419 = !_615;
    int _1421 = _1419 ? _1399 : (-1);
    float _1423 = fma(_875, _1267, _875);
    int _1425 = _1415 * _1411;
    float _1427 = fma(_1343, _1343, _1417);
    float _1429 = _537 + (-0.5);
    float _1431 = fma(_947, _1195, _947);
    int _1433 = _1421 * _1385;
    int _1435 = _1433 + _1425;
    bool _1437 = !_987;
    int _1439 = _1437 ? 0 : 1;
    float _1441 = rsqrt(_1427);
    if (_1403)
    {
        _909 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1443 = _909;
    float _1445 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1405);
    float _1447 = float(_1435);
    int _1449 = as_type<int>(_1443);
    if (_1403)
    {
        out.m_53.x = 0.0;
    }
    if (_1403)
    {
        float _1451 = _1443 * 5.0;
        _1449 = as_type<int>(_1451);
    }
    int _1453 = _1449;
    float _1455 = fma(_1423, _939, _1445);
    float _1457 = fma(_1195, _1333, _1333);
    out.m_73.x = _1447;
    float _1459 = float(_1107);
    float _1461 = _539 + (-0.5);
    int _1463 = abs(_1439);
    if (_1403)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4984 = as_type<float>(_1453);
        out.gl_Position.z = _4984;
    }
    float _1465 = _1349 * _1441;
    float _1467 = _1297 * _1441;
    if (_1403)
    {
        return out;
    }
    float _1469 = -_1465;
    float _1471 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1337);
    float _1473 = _1343 * _1441;
    float _1475 = -_1467;
    float _1477 = fma(_1475, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1061);
    float _1479 = float(_1463);
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1483 = _1471 + _1481;
    float _1485 = _1455 * 0.15915493667125701904296875;
    float _1487 = -_1473;
    float _1489 = fma(_1487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _855);
    float _1491 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1493 = _1477 + _1491;
    float _1495 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1497 = _815 + _537;
    float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1501 = _1489 + _1499;
    float _1503 = _1479 * _1459;
    float _1505 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1495);
    float _1507 = _1497 + (-1.0);
    float _1509 = -_1465;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1349);
    float _1513 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1505);
    float _1515 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1457);
    float _1517 = fma(_1507, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1519 = -_1467;
    float _1521 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1297);
    float _1523 = _1511 * _1511;
    bool _1525 = _1513 >= 0.0;
    float _1527 = _1503 * (-2.0);
    float _1529 = fma(_1431, _939, _1515);
    float _1531 = fma(_1521, _1521, _1523);
    float _1533 = -_1473;
    float _1535 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1343);
    float _1537 = fma(_1527, _1335, _1335);
    float _1539 = _815 + (-0.5);
    float _1541 = _1529 * 0.15915493667125701904296875;
    float _1543 = fma(_1535, _1535, _1531);
    float _1545 = fma(_1517, _1527, _1517);
    float _1547 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1537);
    float _1549 = _1485 * 6.283185482025146484375;
    float _1551 = sin(_1549);
    float _1553 = _1537;
    float _1555 = _1501;
    float _1557 = _1493;
    if (_1525)
    {
        _1553 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1559 = _1553;
    float _1561 = fma(_1545, _939, _1547);
    int _1563 = as_type<int>(_1559);
    if (_1525)
    {
        out.m_53.x = 0.0;
    }
    if (_1525)
    {
        float _1565 = _1559 * 5.0;
        _1563 = as_type<int>(_1565);
    }
    int _1567 = _1563;
    float _1569 = _1485 * 6.283185482025146484375;
    float _1571 = cos(_1569);
    float _1573 = _1561 * 0.15915493667125701904296875;
    if (_1525)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5177 = as_type<float>(_1567);
        out.gl_Position.z = _5177;
    }
    float _1575 = _1541 * 6.283185482025146484375;
    float _1577 = sin(_1575);
    float _1579 = _1541 * 6.283185482025146484375;
    float _1581 = cos(_1579);
    float _1583 = sqrt(_1543);
    if (_1525)
    {
        return out;
    }
    float _1585 = in.m_75.x;
    float _1587 = in.m_75.y;
    float _1589 = in.m_75.z;
    float _1591 = _1573 * 6.283185482025146484375;
    float _1593 = cos(_1591);
    float _1595 = _1441 * _1583;
    float _1597 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1599 = _1551 * _1577;
    float _1601 = _1551 * _1581;
    float _1603 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1605 = _1571 * _1581;
    float _1607 = _1571 * _1577;
    float _1609 = _1573 * 6.283185482025146484375;
    float _1611 = sin(_1609);
    float _1613 = _1595 * _1603;
    bool _1615 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1617 = isnan(0.5);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1623 = _1619 || _1621;
    float _1625 = _1571 * _1593;
    float _1627 = _1581 * _1593;
    float _1629 = _1551 * _1593;
    float _1631 = _1577 * _1593;
    float _1633 = _1595 * _1597;
    float _1635 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1637 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1587);
    float _1639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1585);
    float _1641 = _1595 * _1635;
    float _1643 = _1637 * _1633;
    float _1645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1589);
    float _1647 = _1639 * _1613;
    float _1649 = fma(_1611, _1605, _1599);
    float _1651 = _1625 * _1643;
    float _1653 = _1645 * _1641;
    float _1655 = -_1601;
    float _1657 = fma(_1611, _1607, _1655);
    float _1659 = -_1643;
    float _1661 = _1611 * _1659;
    float _1663 = fma(_1649, _1647, _1651);
    float _1665 = -_1607;
    float _1667 = fma(_1611, _1601, _1665);
    float _1669 = _1629 * _1643;
    float _1671 = fma(_1627, _1647, _1661);
    float _1673 = fma(_1657, _1653, _1663);
    float _1675 = fma(_1611, _1599, _1605);
    float _1677 = fma(_1667, _1647, _1669);
    float _1679 = fma(_1631, _1653, _1671);
    float _1681 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1683 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1685 = fma(_1675, _1653, _1677);
    float _1687 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1689 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1681);
    float _1691 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1683);
    float _1693 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1687);
    float _1695 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1689);
    float _1697 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1691);
    float _1699 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1693);
    float _1701 = _1695 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1703 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1705 = _1699 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1707 = _855 + _1701;
    float _1709 = _1061 + _1703;
    float _1711 = _1337 + _1705;
    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1715 = _1707 + _1713;
    float _1717 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1719 = _1709 + _1717;
    float _1721 = _1715 * _1715;
    float _1723 = fma(_1719, _1719, _1721);
    float _1725 = sqrt(_1723);
    bool _1727 = _1725 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1729 = _1705;
    float _1731 = _1685;
    float _1733 = _1721;
    float _1735 = _1707;
    if (!_1727)
    {
        _1729 = _1709;
    }
    float _1737 = _1729;
    float _1739 = _1737;
    if (!_1727)
    {
        _1731 = _1707;
    }
    float _1741 = _1731;
    float _1743 = _1741;
    if (!_1727)
    {
        _1733 = _1711;
    }
    float _1745 = _1733;
    bool _1747 = !_1727;
    float _1749 = _1745;
    if (!_1747)
    {
        float _1751 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1753 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1755 = _1725 + _1753;
        float _1757 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1759 = _1755 * _1751;
        float _1761 = rsqrt(_1723);
        float _1763 = _1759 * 0.15915493667125701904296875;
        float _1765 = _1763 * 6.283185482025146484375;
        float _1767 = cos(_1765);
        float _1769 = _1763 * 6.283185482025146484375;
        float _1771 = sin(_1769);
        float _1773 = _1767 + (-1.0);
        float _1775 = fma(_1771, _1757, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1777 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1779 = _1761 * _1775;
        float _1781 = fma(_1711, _1767, _1777);
        float _1783 = fma(_1719, _1779, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1785 = fma(_1715, _1779, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1739 = _1783;
        _1749 = _1781;
        _1743 = _1785;
    }
    float _1787 = _1739;
    float _1789 = _1749;
    float _1791 = _1743;
    float _1793 = -_1467;
    float _1795 = fma(_1793, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1787);
    float _1797 = -_1465;
    float _1799 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1789);
    float _1801 = -_1473;
    float _1803 = fma(_1801, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1791);
    float _1805 = _1799;
    float _1807 = _1795;
    float _1809 = _1803;
    if (!_1623)
    {
        float _1811 = _1483 * _1483;
        float _1813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1815 = -_855;
        float _1817 = _1815 + _1791;
        float _1819 = -_1061;
        float _1821 = _1819 + _1787;
        float _1823 = fma(_1493, _1493, _1811);
        float _1825 = -_1337;
        float _1827 = _1825 + _1789;
        float _1829 = fma(_1501, _1501, _1823);
        float _1831 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1833 = sqrt(_1829);
        float _1835 = 1.0 / _1595;
        float _1837 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1839 = precise::min(_1833, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1841 = _1839 * _1813;
        float _1843 = _1841 * _1835;
        float _1845 = _1837 * _1843;
        float _1847 = _1817 * _1843;
        float _1849 = fma(_1821, _1845, _1477);
        float _1851 = fma(_1827, _1845, _1471);
        float _1853 = fma(_1837, _1847, _1489);
        _1805 = _1851;
        _1807 = _1849;
        _1809 = _1853;
        _1555 = _1845;
        _1557 = _1833;
    }
    float _1855 = _1805;
    float _1857 = _1807;
    float _1859 = _1809;
    float _1861 = _1555;
    float _1863 = _1557;
    float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1867 = _1855 + _1865;
    float _1869 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1871 = _1857 + _1869;
    float _1873 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1875 = _1859 + _1873;
    float _1877 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1879 = _1867 * _1867;
    float _1881 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1883 = fma(_1871, _1871, _1879);
    float _1885 = fma(_1875, _1875, _1883);
    float _1887 = rsqrt(_1885);
    float _1889 = sqrt(_1885);
    float _1891 = _1887 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1893 = _1871 * _1891;
    float _1895 = _1875 * _1891;
    float _1897 = _1893 * _1893;
    float _1899 = _1895 * _1895;
    float _1901 = _1897 + _1899;
    float _1903 = sqrt(_1901);
    bool _1905 = _1903 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1907 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1909 = _1903 + _1907;
    float _1911 = _1875;
    float _1913 = _1901;
    float _1915 = _1909;
    float _1917 = _1861;
    float _1919 = _1867;
    float _1921 = _1863;
    if (_1905)
    {
        float _1923 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1911 = _1923;
    }
    float _1925 = _1911;
    if (_1905)
    {
        float _1927 = rsqrt(_1901);
        _1913 = _1927;
    }
    float _1929 = _1913;
    float _1931 = _1929;
    if (_1905)
    {
        float _1933 = _1909 * _1925;
        _1915 = _1933;
    }
    float _1935 = _1915;
    if (_1905)
    {
        float _1937 = _1935 * 0.15915493667125701904296875;
        _1917 = _1937;
    }
    float _1939 = _1917;
    float _1941 = _1887;
    float _1943 = _1939;
    if (_1905)
    {
        float _1945 = _1939 * 6.283185482025146484375;
        float _1947 = sin(_1945);
        _1941 = _1947;
    }
    float _1949 = _1941;
    float _1951 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1953 = precise::max(0.0, _1951);
    float _1955 = _1925;
    float _1957 = _1953;
    if (_1905)
    {
        float _1959 = _1939 * 6.283185482025146484375;
        float _1961 = cos(_1959);
        _1955 = _1961;
    }
    float _1963 = _1955;
    float _1965 = -_1891;
    float _1967 = -_1953;
    float _1969 = fma(_1867, _1965, _1967);
    if (_1905)
    {
        float _1971 = _1969 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1919 = _1971;
    }
    float _1973 = _1919;
    if (!_1905)
    {
        _1943 = _1899;
    }
    float _1975 = _1943;
    float _1977 = _1949;
    float _1979 = _1975;
    if (_1905)
    {
        float _1981 = fma(_1949, _1973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1921 = _1981;
    }
    float _1983 = _1921;
    float _1985 = _1983;
    if (!_1905)
    {
        _1977 = _1969;
    }
    float _1987 = _1977;
    float _1989 = _1987;
    float _1991 = _1963;
    if (_1905)
    {
        float _1993 = _1963 + (-1.0);
        _1957 = _1993;
    }
    float _1995 = _1957;
    float _1997 = _1995;
    if (_1905)
    {
        float _1999 = _1929 * _1983;
        _1735 = _1999;
    }
    float _2001 = _1735;
    if (!_1905)
    {
        _1985 = _1893;
    }
    float _2003 = _1985;
    float _2005 = _2003;
    if (_1905)
    {
        float _2007 = _1995 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1997 = _2007;
    }
    float _2009 = _1997;
    if (_1905)
    {
        float _2011 = _1893 * _2001;
        _2005 = _2011;
    }
    float _2013 = _2005;
    if (!_1905)
    {
        _1931 = _1897;
    }
    float _2015 = _1931;
    float _2017 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2019 = _2015;
    if (_1905)
    {
        float _2021 = fma(_1969, _1963, _2009);
        _1989 = _2021;
    }
    float _2023 = _1989;
    if (!_1905)
    {
        _1991 = _1895;
    }
    float _2025 = _1991;
    float _2027 = _2025;
    if (_1905)
    {
        float _2029 = _1895 * _2001;
        _2027 = _2029;
    }
    float _2031 = _2027;
    if (_1905)
    {
        float _2033 = _2013 * _2013;
        _2019 = _2033;
    }
    float _2035 = _2019;
    if (_1905)
    {
        float _2037 = _2031 * _2031;
        _1979 = _2037;
    }
    float _2039 = _1979;
    float _2041 = fma(_2023, _2023, _2035);
    float _2043 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2017);
    float _2045 = _2041 + _2039;
    float _2047 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2043);
    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2051 = fma(_1889, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2049);
    float _2053 = precise::clamp(_2051, 0.0, 1.0);
    float _2055 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2057 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2059 = rsqrt(_2045);
    float _2061 = -_2053;
    float _2063 = _2061 + 1.0;
    float _2065 = fma(_1489, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2067 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2069 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2071 = -_2067;
    float _2073 = fma(_2071, _2055, 1.0);
    float _2075 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1877);
    float _2077 = abs(_2063);
    float _2079 = log2(_2077);
    float _2081 = fma(_1477, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2083 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2075);
    float _2085 = _2059 * _2031;
    float _2087 = _2059 * _2013;
    float _2089 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2069);
    float _2091 = _2059 * _2023;
    float _2093 = _2083 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2095 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2097 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2089);
    float _2099 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1881);
    float _2101 = floor(_2081);
    float _2103 = -_2095;
    float _2105 = fma(_2091, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2103);
    float _2107 = _2097 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2109 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2111 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2099);
    float _2113 = -_2085;
    float _2115 = fma(_2113, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2105);
    float _2117 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2119 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2109);
    float _2121 = floor(_2065);
    float _2123 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2125 = fma(_2115, 0.5, 0.5);
    float _2127 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2119);
    float _2129 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2127);
    float _2131 = log2(_2073);
    float _2133 = -_2101;
    float _2135 = _2081 + _2133;
    float _2137 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2139 = fma(_2125, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2141 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2137);
    float _2143 = fma(_2125, _2139, -0.212114393711090087890625);
    float _2145 = 1.0 / _2129;
    float _2147 = fma(_2115, -0.5, 0.5);
    float _2149 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2151 = -_2121;
    float _2153 = _2065 + _2151;
    float _2155 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2141);
    float _2157 = fma(_2125, _2143, 1.570728778839111328125);
    float _2159 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2149);
    float _2161 = _2091 + 1.0;
    float _2163 = sqrt(_2147);
    float _2165 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2155);
    float _2167 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2159);
    float _2169 = _2131 * 0.693147182464599609375;
    float _2171 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2167);
    float _2173 = exp2(_2117);
    float _2175 = _2165 * _2145;
    float _2177 = _2171 * _2145;
    float2 _6164 = float2(_2135, _2153);
    float _2179 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6164, float2(0.0), isnan(_6164)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6164, float2(0.0), isnan(_6164)), level(0.0)).x;
    float _2181 = fma(_2175, 0.5, 0.5);
    float _2183 = fma(_2177, -0.5, 0.5);
    float _2185 = _2163 * 0.636619746685028076171875;
    float _2187 = -_2157;
    float _2189 = fma(_2185, _2187, 1.0);
    float _2191 = _2169 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2193 = -_2091;
    float _2195 = fma(_2173, _2161, _2193);
    float3 _6197 = float3(_2181, _2183, _2191);
    float _2197 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6197, float3(0.0), isnan(_6197)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6197, float3(0.0), isnan(_6197)), level(0.0)).x;
    float _2199 = fma(_2195, 0.5, 0.5);
    float3 _6210 = float3(_2181, _2183, _2191);
    float4 _2202 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6210, float3(0.0), isnan(_6210)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6210, float3(0.0), isnan(_6210)), level(0.0)).xyzw;
    float _2204 = _2202.x;
    float _2206 = _2202.y;
    float _2208 = _2202.z;
    float _2210 = _2202.w;
    float2 _6226 = float2(_2189, _2199);
    float3 _2214 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6226, float2(0.0), isnan(_6226)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6226, float2(0.0), isnan(_6226)), level(0.0)).xyz;
    float _2216 = _2214.x;
    float _2218 = _2214.y;
    float _2220 = _2214.z;
    float _2222 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2224 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2226 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2228 = _1587 != 0.0;
    bool _2230 = isnan(_1587);
    bool _2232 = _2228 || _2230;
    bool _2234 = isnan(0.0);
    bool _2236 = _2232 || _2234;
    float _2238 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2222);
    float _2240 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2224);
    float _2242 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2244 = _1585 == 0.0;
    bool _2246 = !_2236;
    bool _2248 = _2244 && _2246;
    float _2250 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2238);
    float _2252 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2240);
    float _2254 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2256 = _2250 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2258 = _2252 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2260 = _1589 == 0.0;
    bool _2262 = _2260 && _2248;
    float _2264 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2254);
    float _2266 = 1.0 / _2256;
    float _2268 = _2258 + _2256;
    float _2270 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2272 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2274 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2276 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2278 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2280 = exp2(_2242);
    float _2282 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2284 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2276);
    float _2286 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2282);
    float _2288 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2290 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2292 = _2268 * _2266;
    float _2294 = _2292 * 0.5;
    float _2296 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2226);
    float _2298 = -_1611;
    float _2300 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2288);
    float _2302 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2272);
    float _2304 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2306 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2304);
    float _2308 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2274);
    float _2310 = in.m_77.x;
    float _2312 = in.m_77.y;
    float _2314 = in.m_77.z;
    float _2316 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2300);
    float _2318 = 1.0 / _2306;
    float _2320 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2278);
    float _2322 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2302);
    float _2324 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2308);
    float _2326 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2284);
    float _2328 = -_2280;
    float _2330 = _2328 + 1.0;
    float _2332 = _2129 * 0.5;
    float _2334 = -_1611;
    float _2336 = fma(_2334, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2270);
    float _2338 = -_1611;
    float _2340 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2290);
    float _2342 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2264);
    float _2344 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2286);
    float _2346 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2296);
    float _2348 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2340);
    float _2350 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2336);
    float _2352 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2354 = _2318 * _2352;
    float _2356 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2320);
    float _2358 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2326);
    float _2360 = abs(_2354);
    float _2362 = log2(_2360);
    float _2364 = _2310;
    float _2366 = _2312;
    float _2368 = _2314;
    float _2370 = _2320;
    float _2372 = _2171;
    float _2374 = _2165;
    if (!_2262)
    {
        float _2376 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2310);
        _2364 = _2376;
    }
    float _2378 = _2364;
    if (!_2262)
    {
        float _2380 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2312);
        _2366 = _2380;
    }
    float _2382 = _2366;
    if (!_2262)
    {
        float _2384 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2314);
        _2368 = _2384;
    }
    float _2386 = _2368;
    bool _2388 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2390 = isnan(0.5);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2396 = _2392 || _2394;
    float _2398 = fma(_2171, -0.5, _2332);
    float _2400 = _2348 * _2382;
    float _2402 = _2316 * _2382;
    float _2404 = _2350 * _2382;
    out.gl_Position.x = _2165;
    out.gl_Position.y = _2171;
    out.gl_Position.z = _2358;
    out.gl_Position.w = _2129;
    float _2406 = fma(_2346, _2378, _2400);
    float _2408 = fma(_2344, _2378, _2402);
    bool _2410 = _2354 <= 8000.0;
    bool _2412 = isnan(_2354);
    bool _2414 = _2410 || _2412;
    bool _2416 = isnan(8000.0);
    bool _2418 = _2414 || _2416;
    float _2420 = float(_2418);
    float _2422 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2424 = in.m_79.x;
    float _2426 = fma(_2342, _2378, _2404);
    float _2428 = fma(_2324, _2386, _2408);
    float _2430 = _2400;
    float _2432 = _2398;
    if (!_2396)
    {
        float _2434 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2436 = _2354 + _2434;
        _2370 = _2436;
    }
    float _2438 = _2370;
    if (_2396)
    {
        _2430 = 1.0;
    }
    float _2440 = _2430;
    float _2442 = exp2(_2422);
    float _2444 = fma(_2322, _2386, _2426);
    float _2446 = fma(_2356, _2386, _2406);
    float _2448 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2444;
    out.m_81.y = _2428;
    out.m_81.z = _2446;
    float _2450 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2452 = precise::clamp(_2450, 0.0, 1.0);
    float _2454 = fma(_2452, -2.0, 3.0);
    float _2456 = _2452 * _2452;
    float _2458 = _2456 * _2454;
    float _2460 = _2454;
    float _2462 = _2440;
    float _2464 = _2129;
    if (!_2396)
    {
        _2460 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2466 = _2460;
    float _2468 = -_2458;
    float _2470 = _2468 + 1.0;
    float _2472 = _2466;
    if (!_2396)
    {
        float _2474 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2476 = _2466 + _2474;
        _2472 = _2476;
    }
    float _2478 = _2472;
    float _2480 = fma(_2470, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2458);
    float _2482 = _2358 + _2129;
    float _2484 = _2286;
    if (!_2396)
    {
        float _2486 = 1.0 / _2478;
        _2484 = _2486;
    }
    float _2488 = _2484;
    float _2490 = _2420 * _2480;
    float _2492 = _2482 * 0.5;
    float _2494 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2496 = _2165 + _2129;
    float _2498 = _2496 * 0.5;
    float _2500 = _2492;
    if (!_2396)
    {
        float _2502 = _2438 * _2488;
        float _2504 = precise::clamp(_2502, 0.0, 1.0);
        _2462 = _2504;
    }
    float _2506 = _2462;
    out.m_83.x = _2498;
    out.m_83.y = _2398;
    out.m_83.z = _2492;
    out.m_83.w = _2129;
    bool _2508 = _1889 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2510 = isnan(_1889);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2516 = _2512 || _2514;
    float _2518 = _2506 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2520 = -_2448;
    float _2522 = _2520 + 1.0;
    float _2524 = _2522;
    if (!_2516)
    {
        _2372 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2526 = _2372;
    float _2528 = _2526;
    float _2530 = _2526;
    if (!_2516)
    {
        _2374 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2532 = _2374;
    float _2534 = _2532;
    float _2536 = _2532;
    if (!_2516)
    {
        _2464 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2538 = _2464;
    float _2540 = _2538;
    float _2542 = _2538;
    if (!_2516)
    {
        _2500 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2544 = _2500;
    float _2546 = _2544;
    float _2548 = _2544;
    if (!_2516)
    {
        _2432 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2550 = _2432;
    float _2552 = -_2179;
    float _2554 = _2552 + 1.0;
    float _2556 = _2554 * _2494;
    float _2558 = precise::clamp(_2556, 0.0, 1.0);
    float _2560 = -_2558;
    float _2562 = fma(_2560, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2564 = _2562 * _2424;
    float _2566 = _2448 * _2197;
    float _2568 = _2564 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2570 = _2210 * _2566;
    float _2572 = _2210 * _2522;
    out.m_85.x = _2568;
    float _2574 = _2550;
    float _2576 = _2550;
    if (!_2516)
    {
        _2524 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2578 = _2524;
    float _2580 = _2220 * _2566;
    float _2582 = fma(_2216, _2570, _2204);
    float _2584 = fma(_2218, _2570, _2206);
    float _2586 = fma(_2210, _2580, _2208);
    out.m_87.x = _2582;
    out.m_87.y = _2584;
    out.m_87.z = _2586;
    out.m_87.w = _2572;
    bool _2588 = !_2516;
    float _2590 = _2578;
    float _2592 = _2578;
    if (!_2588)
    {
        bool _2594 = _1889 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2596 = isnan(_1889);
        bool _2598 = _2594 || _2596;
        bool _2600 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2602 = _2598 || _2600;
        if (!_2602)
        {
            float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2606 = _1889 + _2604;
            float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2610 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2608;
            float _2612 = 1.0 / _2610;
            float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2632 = _2630 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2634 = _2606 * _2612;
            float _2636 = precise::clamp(_2634, 0.0, 1.0);
            float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2642 = fma(_2636, _2616, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2644 = fma(_2636, _2640, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2646 = fma(_2636, _2620, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2648 = fma(_2636, _2624, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2650 = fma(_2636, _2628, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2652 = fma(_2636, _2632, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2536 = _2644;
            _2576 = _2650;
            _2530 = _2642;
            _2548 = _2648;
            _2542 = _2646;
            _2592 = _2652;
            _2654 = true;
        }
        else
        {
            bool _2656 = _1889 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2658 = isnan(_1889);
            bool _2660 = _2656 || _2658;
            bool _2662 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2664 = _2660 || _2662;
            if (!_2664)
            {
                _2528 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2666 = _2528;
            _2530 = _2666;
            if (!_2664)
            {
                _2534 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2668 = _2534;
            _2536 = _2668;
            if (!_2664)
            {
                _2540 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2670 = _2540;
            _2542 = _2670;
            if (!_2664)
            {
                _2546 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2672 = _2546;
            _2548 = _2672;
            if (!_2664)
            {
                _2574 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2674 = _2574;
            _2576 = _2674;
            if (!_2664)
            {
                _2590 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2676 = _2590;
            bool _2678 = !_2664;
            _2592 = _2676;
            if (!_2678)
            {
                bool _2680 = _1889 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2682 = isnan(_1889);
                bool _2684 = _2680 || _2682;
                bool _2686 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2688 = _2684 || _2686;
                if (!_2688)
                {
                    float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2692 = _1889 + _2690;
                    float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2696 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2694;
                    float _2698 = 1.0 / _2696;
                    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2720 = _2692 * _2698;
                    float _2722 = precise::clamp(_2720, 0.0, 1.0);
                    float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2728 = fma(_2722, _2702, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2730 = fma(_2722, _2726, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2732 = fma(_2722, _2706, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2734 = fma(_2722, _2710, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2736 = fma(_2722, _2714, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2738 = fma(_2722, _2718, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2536 = _2730;
                    _2576 = _2736;
                    _2530 = _2728;
                    _2548 = _2734;
                    _2542 = _2732;
                    _2592 = _2738;
                    _2654 = true;
                }
                else
                {
                    _2536 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2576 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2530 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2548 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2542 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2592 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2654 = false;
    float _2740 = _2536;
    float _2742 = _2576;
    float _2744 = _2530;
    float _2746 = _2548;
    float _2748 = _2542;
    float _2750 = _2592;
    float _2752 = fma(_2428, -0.5, 0.5);
    float _2754 = precise::clamp(_2752, 0.0, 1.0);
    float _2756 = -_2740;
    float _2758 = _2756 + _2742;
    float _2760 = -_2744;
    float _2762 = _2760 + _2746;
    out.m_89.x = 0.0;
    float _2764 = fma(_2754, _2758, _2740);
    float _2766 = -_2748;
    float _2768 = _2766 + _2750;
    float _2770 = fma(_2754, _2762, _2744);
    float _2772 = _2764 * 0.586610972881317138671875;
    bool _2774 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2776 = fma(_2754, _2768, _2748);
    float _2778 = _2518 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2780 = fma(_2770, 0.298911988735198974609375, _2772);
    bool _2782 = _2506 > 0.0;
    bool _2784 = isnan(_2506);
    bool _2786 = _2782 || _2784;
    bool _2788 = isnan(0.0);
    bool _2790 = _2786 || _2788;
    float _2792 = fma(_2776, 0.114477999508380889892578125, _2780);
    out.m_53.x = _2778;
    float _2794 = -_2792;
    float _2796 = _2770 + _2794;
    float _2798 = -_2792;
    float _2800 = _2764 + _2798;
    float _2802 = -_2792;
    float _2804 = _2776 + _2802;
    float _2806 = fma(_2796, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2792);
    float _2808 = fma(_2800, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2792);
    float _2810 = fma(_2804, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2792);
    bool _2812 = !_2774;
    if (!_2812)
    {
        float _2814 = -_1855;
        float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2818 = -_1857;
        float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2822 = -_1859;
        float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2826 = _2816 * _2816;
        float _2828 = fma(_2820, _2820, _2826);
        float _2830 = fma(_2824, _2824, _2828);
        float _2832 = sqrt(_2830);
        float _2834 = rsqrt(_2830);
        float _2836 = -_2832;
        float _2838 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2840 = _2838 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2842 = precise::clamp(_2840, 0.0, 1.0);
        float _2844 = _2820 * _2834;
        float _2846 = _2816 * _2834;
        float _2848 = abs(_2842);
        float _2850 = log2(_2848);
        float _2852 = _2824 * _2834;
        float _2854 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2856 = _2428 * _2846;
        float _2858 = -_2846;
        float _2860 = -_2854;
        float _2862 = fma(_2858, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2860);
        float _2864 = fma(_2444, _2844, _2856);
        float _2866 = -_2852;
        float _2868 = fma(_2866, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2862);
        float _2870 = fma(_2446, _2852, _2864);
        float _2872 = precise::clamp(_2870, 0.0, 1.0);
        float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2876 = _2868 + _2874;
        float _2878 = _2850 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2880 = _2876 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2882 = precise::clamp(_2880, 0.0, 1.0);
        float _2884 = exp2(_2878);
        float _2886 = _2884 * _2882;
        float _2888 = _2872 * _2886;
        float _2890 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2892 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2894 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2890;
        out.m_89.y = _2892;
        out.m_89.z = _2894;
    }
    out.m_91.x = _2806;
    out.m_91.y = _2808;
    out.m_91.z = _2810;
    if (_2790)
    {
        return out;
    }
    float _2896 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2896;
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
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2654 = false;
    bool _470 = false;
    bool _350 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = as_type<float>(_112);
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2965 = as_type<float>(_134);
        out.gl_Position.z = _2965;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _138 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_107);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3020 = as_type<float>(_160);
        out.gl_Position.z = _3020;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = 1.0 / _148;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _116 * _162;
    bool _168 = !_164;
    float _186;
    if (!_168)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        _186 = _166;
    }
    _188 = false;
    float _190 = _186;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _194 = _190 + _192;
    bool _196 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _198 = isnan(_190);
    bool _200 = _196 || _198;
    bool _202 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _204 = _200 || _202;
    float _206 = float(_204);
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _190 + _208;
    bool _212 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _214 = isnan(_190);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _220 = _216 || _218;
    float _222 = float(_220);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _232 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _234 = isnan(_190);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    float _244 = -_206;
    float _246 = _244 + 1.0;
    float _248 = 1.0 / _230;
    float _250 = _242 * _246;
    float _252 = -_242;
    float _254 = _252 + 1.0;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = 1.0 / _226;
    float _264 = _222 * _254;
    float _266 = -_222;
    float _268 = _266 + 1.0;
    float _270 = _210 * _248;
    float _272 = _194 * _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    float _282 = fma(_258, _272, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _284 = fma(_276, _272, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _286 = fma(_280, _272, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _288 = _282 * _264;
    float _290 = _284 * _264;
    float _292 = _286 * _264;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _306 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _288);
    float _308 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _290);
    float _310 = fma(_296, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _312 = fma(_300, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _314 = fma(_304, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _316 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].z, _292);
    float _318 = fma(_310, _250, _306);
    float _320 = fma(_312, _250, _308);
    float _322 = fma(_314, _250, _316);
    float _324 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].x, _318);
    float _326 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].y, _320);
    float _328 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].z, _322);
    bool _330 = !_260;
    float _348;
    if (!_330)
    {
        float _332 = in.m_55.x;
        float _334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _336 = _332 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _340 = _338 * _334;
        float _342 = floor(_340);
        float _344 = -_342;
        float _346 = _340 + _344;
        _348 = _346;
        _350 = true;
    }
    else
    {
        _348 = _166;
    }
    _350 = false;
    float _352 = _348;
    float _354 = in.m_57.x;
    float _356 = in.m_57.y;
    float _358 = in.m_57.z;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _362 = _352 + _360;
    bool _364 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _366 = isnan(_352);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _378;
    float _382 = 1.0 / _380;
    float _384 = _328 * _358;
    float _386 = _326 * _356;
    float _388 = _362 * _382;
    float _390 = -_374;
    float _392 = _390 + 1.0;
    bool _394 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _396 = isnan(_352);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _414;
    float _418 = _404 * _392;
    float _420 = fma(_408, _388, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _422 = fma(_412, _388, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _424 = fma(_416, _388, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _426 = -_404;
    float _428 = _426 + 1.0;
    float _430 = _420 * _418;
    float _432 = _422 * _418;
    float _434 = _424 * _418;
    float _436 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[107].x, _430);
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[107].y, _432);
    float _440 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[107].z, _434);
    float _442 = _324 * _354;
    float _444 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[108].x, _436);
    float _446 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[108].y, _438);
    float _448 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[108].z, _440);
    bool _450 = !_376;
    float _468;
    if (!_450)
    {
        float _452 = in.m_55.x;
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _456 = _452 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _460 = _458 * _454;
        float _462 = floor(_460);
        float _464 = -_462;
        float _466 = _460 + _464;
        _468 = _466;
        _470 = true;
    }
    else
    {
        _468 = _166;
    }
    _470 = false;
    float _472 = _468;
    float _474 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _476 = int(_474);
    float _478 = in.m_59.y;
    float _480 = in.m_61.y;
    float _482 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _484 = int(_482);
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _488 = in.m_59.w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _492 = in.m_59.z;
    float _494 = float(_476);
    float _496 = 1.0 / _494;
    float _498 = float(uint(_484));
    int _500 = ~_484;
    int _502 = _500 + 1;
    out.m_63.y = _478;
    int _504 = ~_484;
    int _506 = _504 + 1;
    float _508 = 1.0 / _498;
    int _510 = ~_484;
    int _512 = _510 + 1;
    out.m_63.w = _488;
    float _514 = _496 * _116;
    out.m_63.z = _492;
    float _516 = trunc(_514);
    int _518 = int(_516);
    int _520 = as_type<int>(_508) + (-2);
    float _522 = float(uint(_518));
    float _524 = as_type<float>(_520) * _522;
    float _526 = trunc(_524);
    float _528 = precise::max(_526, 0.0);
    uint _531 = uint(_528);
    int _533 = _502 * int(_531);
    int _535 = _533 + _518;
    float _537 = in.m_55.x;
    float _539 = in.m_55.y;
    float _541 = float(uint(_535));
    float _543 = as_type<float>(_520) * _541;
    int _545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _547 = _545 != 0;
    float _549 = trunc(_543);
    float _551 = precise::max(_549, 0.0);
    uint _553 = uint(_551);
    bool _555 = !_547;
    float _557 = _555 ? 7.345489978790283203125 : 1.0;
    float _559 = float(_518);
    float _561 = _557 * _537;
    float _563 = _537 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _565 = floor(_561);
    int _567 = int(_531) + int(_553);
    float _569 = -_490;
    float _571 = fma(_563, 2.0, _569);
    float _573 = float(_484);
    int _575 = _506 * _567;
    int _577 = _575 + _518;
    bool _579 = _559 >= _573;
    bool _581 = isnan(_559);
    bool _583 = _579 || _581;
    bool _585 = isnan(_573);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = -_116;
    float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[76].x, _571);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _595;
    bool _599 = uint(_577) >= uint(_484);
    float _601 = trunc(_589);
    int _603 = int(_601);
    float _605 = in.m_59.x;
    bool _607 = !_599;
    int _609 = _607 ? 0 : (-1);
    float _611 = -_565;
    float _613 = _561 + _611;
    bool _615 = _484 == 0;
    int _617 = ~_567;
    int _619 = _617 + _609;
    int _621 = _619 + 1;
    float _623 = _613 * _573;
    float _625 = _573 * _116;
    int _627 = _484 * _621;
    int _629 = _627 + _518;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _633 = _631 != 0;
    float _635 = _625 * _162;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _639 = _637 != 0;
    float _641 = trunc(_623);
    int _643 = int(_641);
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _647 = _645 != 0;
    int _649 = ~_603;
    int _651 = _649 + 1;
    int _653 = _651 + 1;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _657 = _655 != 0;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _661 = _659 != 0;
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _665 = _663 != 0;
    bool _667 = !_615;
    int _669 = _667 ? _629 : (-1);
    float _671 = trunc(_635);
    int _673 = int(_671);
    bool _675 = !_647;
    int _677 = _675 ? 0 : 1;
    float _679 = 0.0;
    float _681 = _480;
    if (_633)
    {
        float _683 = in.m_55.x;
        _679 = _683;
    }
    float _685 = _679;
    bool _687 = !_661;
    int _689 = _687 ? 0 : 1;
    int _691 = _669 * _653;
    int _693 = _484 + (-1);
    out.m_63.x = _605;
    bool _695 = !_657;
    int _697 = _695 ? 0 : 1;
    int _699 = abs(_689);
    int _701 = _603 * _693;
    int _703 = _701 + _691;
    int _705 = abs(_697);
    int _707 = abs(_677);
    int _709 = _703 * _699;
    float _711 = _539 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _715 = _713 != 0;
    int _717 = _673 * _705;
    int _719 = _717 + _709;
    bool _721 = !_665;
    int _723 = _721 ? 0 : 1;
    int _725 = _643 * _707;
    int _727 = _725 + _518;
    bool _729 = !_715;
    int _731 = _729 ? 0 : 1;
    float _733 = in.m_46.x;
    float _735 = in.m_46.y;
    float _737 = in.m_46.z;
    int _739 = abs(_723);
    float _741 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _743 = log2(_741);
    int _745 = abs(_731);
    float _747 = -_480;
    float _749 = _747 + 1.0;
    bool _751 = _539 > 0.5;
    int _753 = _727 * _739;
    int _755 = _753 + _719;
    float _757 = fma(_711, -2.0, _486);
    int _759 = _643 * _745;
    int _761 = _759 + _755;
    if (_639)
    {
        float _763 = _751 ? _749 : _480;
        _681 = _763;
    }
    float _765 = _681;
    float _767 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _757);
    float _769 = float(uint(_761));
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _775 = as_type<float>(_520) * _769;
    bool _777 = _685 > 0.5;
    bool _779 = _777 && _633;
    float _781 = 1.0 / _773;
    float _783 = _735 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _785 = _735 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _787 = _735 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _795 = trunc(_775);
    float _797 = precise::max(_795, 0.0);
    uint _799 = uint(_797);
    float _801 = _743 * _116;
    float _803 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _807 = _793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = _791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = fma(_733, (*spvDescriptorSet0.vp_c10)._m0[5].x, _785);
    float _813 = _537 * 2.0;
    float _815 = in.m_55.z;
    float _817 = exp2(_801);
    float _819 = fma(_733, (*spvDescriptorSet0.vp_c10)._m0[4].x, _783);
    float _821 = fma(_733, (*spvDescriptorSet0.vp_c10)._m0[6].x, _787);
    out.m_65.x = _807;
    out.m_65.y = _803;
    out.m_65.z = _809;
    out.m_65.w = _805;
    bool _823 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _825 = isnan(1.0);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _831 = _827 || _829;
    float _833 = _597 * _781;
    float _835 = _539 + _537;
    float _837 = in.m_61.x;
    float _839 = floor(_813);
    bool _841 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _843 = isnan(0.0);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _849 = _845 || _847;
    float _851 = _835 + (-1.0);
    float _853 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[6].z, _821);
    float _855 = _853 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _857 = -_817;
    float _859 = _857 + 1.0;
    int _861 = _512 * int(_799);
    int _863 = _861 + _761;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _867 = 1.0 + _865;
    float _869 = _849 ? _859 : 0.0;
    float _871 = 1.0 / _867;
    float _873 = float(uint(_863));
    float _875 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _877 = _839 > 0.0;
    float _879 = _539 + _815;
    bool _881 = _839 >= 0.0;
    bool _883 = isnan(_839);
    bool _885 = _881 || _883;
    bool _887 = isnan(0.0);
    bool _889 = _885 || _887;
    float _891 = as_type<float>(_520) * _873;
    float _893 = _539 * 2.0;
    float _895 = trunc(_891);
    float _897 = precise::max(_895, 0.0);
    uint _899 = uint(_897);
    float _901 = _879 + (-1.0);
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _905 = 0.0;
    float _907 = _837;
    float _909 = _875;
    if (_633)
    {
        _905 = _837;
    }
    float _911 = _905;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _915 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[78].z, _903);
    float _917 = floor(_893);
    int _919 = ~_484;
    int _921 = _919 + 1;
    float _923 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[78].w, _913);
    float _925 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _915);
    float _927 = _911;
    if (_779)
    {
        float _929 = -_911;
        float _931 = _929 + 1.0;
        _927 = _931;
    }
    float _933 = _927;
    float _935 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _923);
    if (_831)
    {
        float _937 = _869 * _871;
        _126 = _937;
    }
    float _939 = _126;
    int _941 = int(_799) + int(_899);
    float _943 = _815 * 2.0;
    int _945 = _889 ? 0 : 1;
    float _947 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_633)
    {
        _907 = _933;
    }
    float _949 = _907;
    int _951 = _921 * _941;
    int _953 = _951 + _761;
    bool _955 = _917 >= 0.0;
    bool _957 = isnan(_917);
    bool _959 = _955 || _957;
    bool _961 = isnan(0.0);
    bool _963 = _959 || _961;
    bool _965 = uint(_953) >= uint(_484);
    bool _967 = _917 > 0.0;
    float _969 = floor(_943);
    bool _971 = !_965;
    int _973 = _971 ? 0 : (-1);
    int _975 = _963 ? 0 : 1;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _983 = _981 != 0;
    int _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _987 = _985 != 0;
    bool _989 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _991 = isnan(_472);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _997 = _993 || _995;
    float _999 = float(_997);
    int _1001 = ~_941;
    int _1003 = _1001 + _973;
    int _1005 = _1003 + 1;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1009 = _472 + _1007;
    bool _1011 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1013 = isnan(_472);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1019 = _1015 || _1017;
    float _1021 = float(_1019);
    float _1023 = -_999;
    float _1025 = _1023 + 1.0;
    int _1027 = ~_945;
    int _1029 = _1027 + 1;
    int _1031 = _1029 + 1;
    int _1033 = _484 * _1005;
    int _1035 = _1033 + _761;
    float _1037 = fma(_833, _1009, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1039 = _1021 * _1025;
    float _1041 = float(uint(_727));
    bool _1043 = !_615;
    int _1045 = _1043 ? _1035 : (-1);
    float _1047 = _1037 * _1039;
    int _1049 = _1031;
    if (!_877)
    {
        int _1051 = ~_945;
        int _1053 = _1051 + 1;
        _1049 = _1053;
    }
    int _1055 = _1049;
    float _1057 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[4].z, _819);
    bool _1059 = _969 > 0.0;
    float _1061 = _1057 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1063 = _969 >= 0.0;
    bool _1065 = isnan(_969);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan(0.0);
    bool _1071 = _1067 || _1069;
    float _1073 = -_1021;
    float _1075 = _1073 + 1.0;
    float _1077 = as_type<float>(_520) * _1041;
    int _1079 = _1045 >> 31;
    float _1081 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1083 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[5].z, _811);
    int _1085 = ~_975;
    int _1087 = _1085 + 1;
    int _1089 = _1087 + 1;
    float _1091 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1047);
    int _1093 = _1079 & 3;
    float _1095 = trunc(_1077);
    float _1097 = precise::max(_1095, 0.0);
    uint _1099 = uint(_1097);
    int _1101 = _1089;
    if (!_967)
    {
        int _1103 = ~_975;
        int _1105 = _1103 + 1;
        _1101 = _1105;
    }
    int _1107 = _1101;
    float _1109 = -_767;
    float _1111 = fma(_935, _1081, _1109);
    int _1113 = _1045 + _1093;
    float _1115 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1117 = !_983;
    int _1119 = _1117 ? 0 : 1;
    float _1121 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1091);
    int _1123 = _1113 >> 2;
    float _1125 = fma(_925, _1115, _593);
    int _1127 = abs(_1119);
    float _1129 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1131 = _1123 << 4;
    int _1133 = _1131 + 368;
    float _1135 = _1121 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1137 = ~_484;
    int _1139 = _1137 + 1;
    float _1141 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1111 + 0.5;
    float _1145 = float(_1055);
    int _1147 = _1139 * int(_1099);
    int _1149 = _1147 + _727;
    uint _1151 = uint(int(uint(_1133) >> uint(2)));
    uint _1153 = uint(int(uint(int(_1151)) >> uint(2)));
    int _1155 = int(_1151) & 3;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[int(_1153)][_1155];
    int _1159 = int(_1151) + 1;
    uint _1161 = uint(int(uint(_1159) >> uint(2)));
    int _1163 = _1159 & 3;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[int(_1161)][_1163];
    int _1167 = _1071 ? 0 : 1;
    float _1169 = float(_1127);
    int _1171 = ~_1167;
    int _1173 = _1171 + 1;
    int _1175 = _1173 + 1;
    int _1177 = _1175;
    if (!_1059)
    {
        int _1179 = ~_1167;
        int _1181 = _1179 + 1;
        _1177 = _1181;
    }
    int _1183 = _1177;
    float _1185 = _1169 * _1145;
    float _1187 = float(uint(_1149));
    float _1189 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1191 = _1045 & 3;
    bool _1193 = _1191 != 0;
    float _1195 = _1185 * (-2.0);
    int _1197 = _1045 & 3;
    bool _1199 = _1197 != 0;
    float _1201 = as_type<float>(_520) * _1187;
    bool _1203 = !_979;
    int _1205 = _1203 ? 0 : 1;
    float _1207 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1209 = uint(_1197) > 1u;
    float _1211 = trunc(_1201);
    float _1213 = precise::max(_1211, 0.0);
    uint _1215 = uint(_1213);
    int _1217 = abs(_1205);
    float _1219 = _448 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1221 = float(_1183);
    int _1223 = _1133 + 8;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    uint _1227 = uint(int(uint(int(_1225)) >> uint(2)));
    int _1229 = int(_1225) & 3;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[int(_1227)][_1229];
    int _1233 = int(_1225) + 1;
    uint _1235 = uint(int(uint(_1233) >> uint(2)));
    int _1237 = _1233 & 3;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[int(_1235)][_1237];
    float _1241 = float(_1217);
    float _1243 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1245 = _1193 ? 0 : 1;
    int _1247 = ~_484;
    int _1249 = _1247 + 1;
    float _1251 = _1241 * _1221;
    int _1253 = ~_1245;
    int _1255 = _1253 + 1;
    int _1257 = _1255 + 1;
    out.m_67.x = _1141;
    out.m_67.y = _1207;
    out.m_67.z = _1243;
    out.m_67.w = _1135;
    int _1259 = _1257;
    if (!_1209)
    {
        int _1261 = ~_1245;
        int _1263 = _1261 + 1;
        _1259 = _1263;
    }
    int _1265 = _1259;
    float _1267 = _1251 * (-2.0);
    bool _1269 = _1197 != 3;
    int _1271 = int(_1099) + int(_1215);
    bool _1273 = !_1199;
    int _1275 = _1273 ? 0 : 1;
    int _1277 = abs(_1265);
    int _1279 = abs(_1275);
    int _1281 = _1249 * _1271;
    int _1283 = _1281 + _727;
    float _1285 = _1125 + 0.5;
    bool _1287 = uint(_1197) >= 2u;
    int _1289 = ~_1277;
    int _1291 = _1289 + 1;
    int _1293 = _1291 + 1;
    float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1297 = _1061 + _1295;
    out.m_69.x = _1285;
    out.m_69.y = _1143;
    int _1299 = _1287 ? 0 : 1;
    int _1301 = _1293 * as_type<int>(_1165);
    int _1303 = ~_1279;
    int _1305 = _1303 + 1;
    int _1307 = _1305 + 1;
    int _1309 = ~_1299;
    int _1311 = _1309 + 1;
    int _1313 = _1311 + 1;
    int _1315 = _1313;
    if (_1269)
    {
        int _1317 = ~_1299;
        int _1319 = _1317 + 1;
        _1315 = _1319;
    }
    int _1321 = _1315;
    int _1323 = _1307 * as_type<int>(_1157);
    int _1325 = _1323 + _1301;
    int _1327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1329 = _1327 != 0;
    float _1331 = in.m_71.x;
    float _1333 = in.m_71.y;
    float _1335 = in.m_71.z;
    float _1337 = _1083 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1339 = _1197 != 3;
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1343 = _855 + _1341;
    bool _1345 = uint(_1283) >= uint(_484);
    float _1347 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1349 = _1337 + _1347;
    bool _1351 = !_1339;
    int _1353 = _1351 ? 0 : (-1);
    int _1355 = abs(_1321);
    float _1357 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1359 = !_1345;
    int _1361 = _1359 ? 0 : (-1);
    int _1363 = abs(_1353);
    float _1365 = fma(_1297, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1357);
    bool _1367 = !_1329;
    int _1369 = _1367 ? 0 : 1;
    int _1371 = ~_1355;
    int _1373 = _1371 + 1;
    int _1375 = _1373 + 1;
    float _1377 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1365);
    int _1379 = ~_1271;
    int _1381 = _1379 + _1361;
    int _1383 = _1381 + 1;
    int _1385 = abs(_1369);
    int _1387 = _1375 * as_type<int>(_1231);
    int _1389 = _1387 + _1325;
    int _1391 = ~_1363;
    int _1393 = _1391 + 1;
    int _1395 = _1393 + 1;
    int _1397 = _484 * _1383;
    int _1399 = _1397 + _727;
    float _1401 = _1349 * _1349;
    bool _1403 = _1377 >= 0.0;
    float _1405 = fma(_1267, _1331, _1331);
    int _1407 = ~_1385;
    int _1409 = _1407 + 1;
    int _1411 = _1409 + 1;
    int _1413 = _1395 * as_type<int>(_1239);
    int _1415 = _1413 + _1389;
    float _1417 = fma(_1297, _1297, _1401);
    bool _1419 = !_615;
    int _1421 = _1419 ? _1399 : (-1);
    float _1423 = fma(_875, _1267, _875);
    int _1425 = _1415 * _1411;
    float _1427 = fma(_1343, _1343, _1417);
    float _1429 = _537 + (-0.5);
    float _1431 = fma(_947, _1195, _947);
    int _1433 = _1421 * _1385;
    int _1435 = _1433 + _1425;
    bool _1437 = !_987;
    int _1439 = _1437 ? 0 : 1;
    float _1441 = rsqrt(_1427);
    if (_1403)
    {
        _909 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1443 = _909;
    float _1445 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1405);
    float _1447 = float(_1435);
    int _1449 = as_type<int>(_1443);
    if (_1403)
    {
        out.m_53.x = 0.0;
    }
    if (_1403)
    {
        float _1451 = _1443 * 5.0;
        _1449 = as_type<int>(_1451);
    }
    int _1453 = _1449;
    float _1455 = fma(_1423, _939, _1445);
    float _1457 = fma(_1195, _1333, _1333);
    out.m_73.x = _1447;
    float _1459 = float(_1107);
    float _1461 = _539 + (-0.5);
    int _1463 = abs(_1439);
    if (_1403)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4984 = as_type<float>(_1453);
        out.gl_Position.z = _4984;
    }
    float _1465 = _1349 * _1441;
    float _1467 = _1297 * _1441;
    if (_1403)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1469 = -_1465;
    float _1471 = fma(_1469, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1337);
    float _1473 = _1343 * _1441;
    float _1475 = -_1467;
    float _1477 = fma(_1475, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1061);
    float _1479 = float(_1463);
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1483 = _1471 + _1481;
    float _1485 = _1455 * 0.15915493667125701904296875;
    float _1487 = -_1473;
    float _1489 = fma(_1487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _855);
    float _1491 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1493 = _1477 + _1491;
    float _1495 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1497 = _815 + _537;
    float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1501 = _1489 + _1499;
    float _1503 = _1479 * _1459;
    float _1505 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1495);
    float _1507 = _1497 + (-1.0);
    float _1509 = -_1465;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1349);
    float _1513 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1505);
    float _1515 = fma(_1461, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1457);
    float _1517 = fma(_1507, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1519 = -_1467;
    float _1521 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1297);
    float _1523 = _1511 * _1511;
    bool _1525 = _1513 >= 0.0;
    float _1527 = _1503 * (-2.0);
    float _1529 = fma(_1431, _939, _1515);
    float _1531 = fma(_1521, _1521, _1523);
    float _1533 = -_1473;
    float _1535 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1343);
    float _1537 = fma(_1527, _1335, _1335);
    float _1539 = _815 + (-0.5);
    float _1541 = _1529 * 0.15915493667125701904296875;
    float _1543 = fma(_1535, _1535, _1531);
    float _1545 = fma(_1517, _1527, _1517);
    float _1547 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1537);
    float _1549 = _1485 * 6.283185482025146484375;
    float _1551 = sin(_1549);
    float _1553 = _1537;
    float _1555 = _1501;
    float _1557 = _1493;
    if (_1525)
    {
        _1553 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1559 = _1553;
    float _1561 = fma(_1545, _939, _1547);
    int _1563 = as_type<int>(_1559);
    if (_1525)
    {
        out.m_53.x = 0.0;
    }
    if (_1525)
    {
        float _1565 = _1559 * 5.0;
        _1563 = as_type<int>(_1565);
    }
    int _1567 = _1563;
    float _1569 = _1485 * 6.283185482025146484375;
    float _1571 = cos(_1569);
    float _1573 = _1561 * 0.15915493667125701904296875;
    if (_1525)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5177 = as_type<float>(_1567);
        out.gl_Position.z = _5177;
    }
    float _1575 = _1541 * 6.283185482025146484375;
    float _1577 = sin(_1575);
    float _1579 = _1541 * 6.283185482025146484375;
    float _1581 = cos(_1579);
    float _1583 = sqrt(_1543);
    if (_1525)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1585 = in.m_75.x;
    float _1587 = in.m_75.y;
    float _1589 = in.m_75.z;
    float _1591 = _1573 * 6.283185482025146484375;
    float _1593 = cos(_1591);
    float _1595 = _1441 * _1583;
    float _1597 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1599 = _1551 * _1577;
    float _1601 = _1551 * _1581;
    float _1603 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1605 = _1571 * _1581;
    float _1607 = _1571 * _1577;
    float _1609 = _1573 * 6.283185482025146484375;
    float _1611 = sin(_1609);
    float _1613 = _1595 * _1603;
    bool _1615 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1617 = isnan(0.5);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1623 = _1619 || _1621;
    float _1625 = _1571 * _1593;
    float _1627 = _1581 * _1593;
    float _1629 = _1551 * _1593;
    float _1631 = _1577 * _1593;
    float _1633 = _1595 * _1597;
    float _1635 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1637 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1587);
    float _1639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1585);
    float _1641 = _1595 * _1635;
    float _1643 = _1637 * _1633;
    float _1645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1589);
    float _1647 = _1639 * _1613;
    float _1649 = fma(_1611, _1605, _1599);
    float _1651 = _1625 * _1643;
    float _1653 = _1645 * _1641;
    float _1655 = -_1601;
    float _1657 = fma(_1611, _1607, _1655);
    float _1659 = -_1643;
    float _1661 = _1611 * _1659;
    float _1663 = fma(_1649, _1647, _1651);
    float _1665 = -_1607;
    float _1667 = fma(_1611, _1601, _1665);
    float _1669 = _1629 * _1643;
    float _1671 = fma(_1627, _1647, _1661);
    float _1673 = fma(_1657, _1653, _1663);
    float _1675 = fma(_1611, _1599, _1605);
    float _1677 = fma(_1667, _1647, _1669);
    float _1679 = fma(_1631, _1653, _1671);
    float _1681 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1683 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1685 = fma(_1675, _1653, _1677);
    float _1687 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1689 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1681);
    float _1691 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1683);
    float _1693 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1687);
    float _1695 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1689);
    float _1697 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1691);
    float _1699 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1693);
    float _1701 = _1695 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1703 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1705 = _1699 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1707 = _855 + _1701;
    float _1709 = _1061 + _1703;
    float _1711 = _1337 + _1705;
    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1715 = _1707 + _1713;
    float _1717 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1719 = _1709 + _1717;
    float _1721 = _1715 * _1715;
    float _1723 = fma(_1719, _1719, _1721);
    float _1725 = sqrt(_1723);
    bool _1727 = _1725 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1729 = _1705;
    float _1731 = _1685;
    float _1733 = _1721;
    float _1735 = _1707;
    if (!_1727)
    {
        _1729 = _1709;
    }
    float _1737 = _1729;
    float _1739 = _1737;
    if (!_1727)
    {
        _1731 = _1707;
    }
    float _1741 = _1731;
    float _1743 = _1741;
    if (!_1727)
    {
        _1733 = _1711;
    }
    float _1745 = _1733;
    bool _1747 = !_1727;
    float _1749 = _1745;
    if (!_1747)
    {
        float _1751 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1753 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1755 = _1725 + _1753;
        float _1757 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1759 = _1755 * _1751;
        float _1761 = rsqrt(_1723);
        float _1763 = _1759 * 0.15915493667125701904296875;
        float _1765 = _1763 * 6.283185482025146484375;
        float _1767 = cos(_1765);
        float _1769 = _1763 * 6.283185482025146484375;
        float _1771 = sin(_1769);
        float _1773 = _1767 + (-1.0);
        float _1775 = fma(_1771, _1757, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1777 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1779 = _1761 * _1775;
        float _1781 = fma(_1711, _1767, _1777);
        float _1783 = fma(_1719, _1779, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1785 = fma(_1715, _1779, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1739 = _1783;
        _1749 = _1781;
        _1743 = _1785;
    }
    float _1787 = _1739;
    float _1789 = _1749;
    float _1791 = _1743;
    float _1793 = -_1467;
    float _1795 = fma(_1793, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1787);
    float _1797 = -_1465;
    float _1799 = fma(_1797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1789);
    float _1801 = -_1473;
    float _1803 = fma(_1801, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1791);
    float _1805 = _1799;
    float _1807 = _1795;
    float _1809 = _1803;
    if (!_1623)
    {
        float _1811 = _1483 * _1483;
        float _1813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1815 = -_855;
        float _1817 = _1815 + _1791;
        float _1819 = -_1061;
        float _1821 = _1819 + _1787;
        float _1823 = fma(_1493, _1493, _1811);
        float _1825 = -_1337;
        float _1827 = _1825 + _1789;
        float _1829 = fma(_1501, _1501, _1823);
        float _1831 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1833 = sqrt(_1829);
        float _1835 = 1.0 / _1595;
        float _1837 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1839 = precise::min(_1833, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1841 = _1839 * _1813;
        float _1843 = _1841 * _1835;
        float _1845 = _1837 * _1843;
        float _1847 = _1817 * _1843;
        float _1849 = fma(_1821, _1845, _1477);
        float _1851 = fma(_1827, _1845, _1471);
        float _1853 = fma(_1837, _1847, _1489);
        _1805 = _1851;
        _1807 = _1849;
        _1809 = _1853;
        _1555 = _1845;
        _1557 = _1833;
    }
    float _1855 = _1805;
    float _1857 = _1807;
    float _1859 = _1809;
    float _1861 = _1555;
    float _1863 = _1557;
    float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1867 = _1855 + _1865;
    float _1869 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1871 = _1857 + _1869;
    float _1873 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1875 = _1859 + _1873;
    float _1877 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1879 = _1867 * _1867;
    float _1881 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1883 = fma(_1871, _1871, _1879);
    float _1885 = fma(_1875, _1875, _1883);
    float _1887 = rsqrt(_1885);
    float _1889 = sqrt(_1885);
    float _1891 = _1887 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1893 = _1871 * _1891;
    float _1895 = _1875 * _1891;
    float _1897 = _1893 * _1893;
    float _1899 = _1895 * _1895;
    float _1901 = _1897 + _1899;
    float _1903 = sqrt(_1901);
    bool _1905 = _1903 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1907 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1909 = _1903 + _1907;
    float _1911 = _1875;
    float _1913 = _1901;
    float _1915 = _1909;
    float _1917 = _1861;
    float _1919 = _1867;
    float _1921 = _1863;
    if (_1905)
    {
        float _1923 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1911 = _1923;
    }
    float _1925 = _1911;
    if (_1905)
    {
        float _1927 = rsqrt(_1901);
        _1913 = _1927;
    }
    float _1929 = _1913;
    float _1931 = _1929;
    if (_1905)
    {
        float _1933 = _1909 * _1925;
        _1915 = _1933;
    }
    float _1935 = _1915;
    if (_1905)
    {
        float _1937 = _1935 * 0.15915493667125701904296875;
        _1917 = _1937;
    }
    float _1939 = _1917;
    float _1941 = _1887;
    float _1943 = _1939;
    if (_1905)
    {
        float _1945 = _1939 * 6.283185482025146484375;
        float _1947 = sin(_1945);
        _1941 = _1947;
    }
    float _1949 = _1941;
    float _1951 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1953 = precise::max(0.0, _1951);
    float _1955 = _1925;
    float _1957 = _1953;
    if (_1905)
    {
        float _1959 = _1939 * 6.283185482025146484375;
        float _1961 = cos(_1959);
        _1955 = _1961;
    }
    float _1963 = _1955;
    float _1965 = -_1891;
    float _1967 = -_1953;
    float _1969 = fma(_1867, _1965, _1967);
    if (_1905)
    {
        float _1971 = _1969 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1919 = _1971;
    }
    float _1973 = _1919;
    if (!_1905)
    {
        _1943 = _1899;
    }
    float _1975 = _1943;
    float _1977 = _1949;
    float _1979 = _1975;
    if (_1905)
    {
        float _1981 = fma(_1949, _1973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1921 = _1981;
    }
    float _1983 = _1921;
    float _1985 = _1983;
    if (!_1905)
    {
        _1977 = _1969;
    }
    float _1987 = _1977;
    float _1989 = _1987;
    float _1991 = _1963;
    if (_1905)
    {
        float _1993 = _1963 + (-1.0);
        _1957 = _1993;
    }
    float _1995 = _1957;
    float _1997 = _1995;
    if (_1905)
    {
        float _1999 = _1929 * _1983;
        _1735 = _1999;
    }
    float _2001 = _1735;
    if (!_1905)
    {
        _1985 = _1893;
    }
    float _2003 = _1985;
    float _2005 = _2003;
    if (_1905)
    {
        float _2007 = _1995 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1997 = _2007;
    }
    float _2009 = _1997;
    if (_1905)
    {
        float _2011 = _1893 * _2001;
        _2005 = _2011;
    }
    float _2013 = _2005;
    if (!_1905)
    {
        _1931 = _1897;
    }
    float _2015 = _1931;
    float _2017 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2019 = _2015;
    if (_1905)
    {
        float _2021 = fma(_1969, _1963, _2009);
        _1989 = _2021;
    }
    float _2023 = _1989;
    if (!_1905)
    {
        _1991 = _1895;
    }
    float _2025 = _1991;
    float _2027 = _2025;
    if (_1905)
    {
        float _2029 = _1895 * _2001;
        _2027 = _2029;
    }
    float _2031 = _2027;
    if (_1905)
    {
        float _2033 = _2013 * _2013;
        _2019 = _2033;
    }
    float _2035 = _2019;
    if (_1905)
    {
        float _2037 = _2031 * _2031;
        _1979 = _2037;
    }
    float _2039 = _1979;
    float _2041 = fma(_2023, _2023, _2035);
    float _2043 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2017);
    float _2045 = _2041 + _2039;
    float _2047 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2043);
    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2051 = fma(_1889, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2049);
    float _2053 = precise::clamp(_2051, 0.0, 1.0);
    float _2055 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2057 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2059 = rsqrt(_2045);
    float _2061 = -_2053;
    float _2063 = _2061 + 1.0;
    float _2065 = fma(_1489, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2067 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2069 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2071 = -_2067;
    float _2073 = fma(_2071, _2055, 1.0);
    float _2075 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1877);
    float _2077 = abs(_2063);
    float _2079 = log2(_2077);
    float _2081 = fma(_1477, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2083 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2075);
    float _2085 = _2059 * _2031;
    float _2087 = _2059 * _2013;
    float _2089 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2069);
    float _2091 = _2059 * _2023;
    float _2093 = _2083 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2095 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2097 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2089);
    float _2099 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1881);
    float _2101 = floor(_2081);
    float _2103 = -_2095;
    float _2105 = fma(_2091, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2103);
    float _2107 = _2097 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2109 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2111 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2099);
    float _2113 = -_2085;
    float _2115 = fma(_2113, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2105);
    float _2117 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2119 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2109);
    float _2121 = floor(_2065);
    float _2123 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2125 = fma(_2115, 0.5, 0.5);
    float _2127 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2119);
    float _2129 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2127);
    float _2131 = log2(_2073);
    float _2133 = -_2101;
    float _2135 = _2081 + _2133;
    float _2137 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2139 = fma(_2125, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2141 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2137);
    float _2143 = fma(_2125, _2139, -0.212114393711090087890625);
    float _2145 = 1.0 / _2129;
    float _2147 = fma(_2115, -0.5, 0.5);
    float _2149 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2151 = -_2121;
    float _2153 = _2065 + _2151;
    float _2155 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2141);
    float _2157 = fma(_2125, _2143, 1.570728778839111328125);
    float _2159 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2149);
    float _2161 = _2091 + 1.0;
    float _2163 = sqrt(_2147);
    float _2165 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2155);
    float _2167 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2159);
    float _2169 = _2131 * 0.693147182464599609375;
    float _2171 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2167);
    float _2173 = exp2(_2117);
    float _2175 = _2165 * _2145;
    float _2177 = _2171 * _2145;
    float2 _6164 = float2(_2135, _2153);
    float _2179 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6164, float2(0.0), isnan(_6164)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6164, float2(0.0), isnan(_6164)), level(0.0)).x;
    float _2181 = fma(_2175, 0.5, 0.5);
    float _2183 = fma(_2177, -0.5, 0.5);
    float _2185 = _2163 * 0.636619746685028076171875;
    float _2187 = -_2157;
    float _2189 = fma(_2185, _2187, 1.0);
    float _2191 = _2169 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2193 = -_2091;
    float _2195 = fma(_2173, _2161, _2193);
    float3 _6197 = float3(_2181, _2183, _2191);
    float _2197 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6197, float3(0.0), isnan(_6197)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6197, float3(0.0), isnan(_6197)), level(0.0)).x;
    float _2199 = fma(_2195, 0.5, 0.5);
    float3 _6210 = float3(_2181, _2183, _2191);
    float4 _2202 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6210, float3(0.0), isnan(_6210)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6210, float3(0.0), isnan(_6210)), level(0.0)).xyzw;
    float _2204 = _2202.x;
    float _2206 = _2202.y;
    float _2208 = _2202.z;
    float _2210 = _2202.w;
    float2 _6226 = float2(_2189, _2199);
    float3 _2214 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6226, float2(0.0), isnan(_6226)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6226, float2(0.0), isnan(_6226)), level(0.0)).xyz;
    float _2216 = _2214.x;
    float _2218 = _2214.y;
    float _2220 = _2214.z;
    float _2222 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2224 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2226 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2228 = _1587 != 0.0;
    bool _2230 = isnan(_1587);
    bool _2232 = _2228 || _2230;
    bool _2234 = isnan(0.0);
    bool _2236 = _2232 || _2234;
    float _2238 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2222);
    float _2240 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2224);
    float _2242 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2244 = _1585 == 0.0;
    bool _2246 = !_2236;
    bool _2248 = _2244 && _2246;
    float _2250 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2238);
    float _2252 = fma(_1489, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2240);
    float _2254 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2256 = _2250 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2258 = _2252 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2260 = _1589 == 0.0;
    bool _2262 = _2260 && _2248;
    float _2264 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2254);
    float _2266 = 1.0 / _2256;
    float _2268 = _2258 + _2256;
    float _2270 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2272 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2274 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2276 = _2093 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2278 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2280 = exp2(_2242);
    float _2282 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2284 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2276);
    float _2286 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2282);
    float _2288 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2290 = _1625 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2292 = _2268 * _2266;
    float _2294 = _2292 * 0.5;
    float _2296 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2226);
    float _2298 = -_1611;
    float _2300 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2288);
    float _2302 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2272);
    float _2304 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2306 = fma(_2294, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2304);
    float _2308 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2274);
    float _2310 = in.m_77.x;
    float _2312 = in.m_77.y;
    float _2314 = in.m_77.z;
    float _2316 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2300);
    float _2318 = 1.0 / _2306;
    float _2320 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2278);
    float _2322 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2302);
    float _2324 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2308);
    float _2326 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2284);
    float _2328 = -_2280;
    float _2330 = _2328 + 1.0;
    float _2332 = _2129 * 0.5;
    float _2334 = -_1611;
    float _2336 = fma(_2334, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2270);
    float _2338 = -_1611;
    float _2340 = fma(_2338, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2290);
    float _2342 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2264);
    float _2344 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2286);
    float _2346 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2296);
    float _2348 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2340);
    float _2350 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2336);
    float _2352 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2354 = _2318 * _2352;
    float _2356 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2320);
    float _2358 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2326);
    float _2360 = abs(_2354);
    float _2362 = log2(_2360);
    float _2364 = _2310;
    float _2366 = _2312;
    float _2368 = _2314;
    float _2370 = _2320;
    float _2372 = _2171;
    float _2374 = _2165;
    if (!_2262)
    {
        float _2376 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2310);
        _2364 = _2376;
    }
    float _2378 = _2364;
    if (!_2262)
    {
        float _2380 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2312);
        _2366 = _2380;
    }
    float _2382 = _2366;
    if (!_2262)
    {
        float _2384 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2314);
        _2368 = _2384;
    }
    float _2386 = _2368;
    bool _2388 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2390 = isnan(0.5);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2396 = _2392 || _2394;
    float _2398 = fma(_2171, -0.5, _2332);
    float _2400 = _2348 * _2382;
    float _2402 = _2316 * _2382;
    float _2404 = _2350 * _2382;
    out.gl_Position.x = _2165;
    out.gl_Position.y = _2171;
    out.gl_Position.z = _2358;
    out.gl_Position.w = _2129;
    float _2406 = fma(_2346, _2378, _2400);
    float _2408 = fma(_2344, _2378, _2402);
    bool _2410 = _2354 <= 8000.0;
    bool _2412 = isnan(_2354);
    bool _2414 = _2410 || _2412;
    bool _2416 = isnan(8000.0);
    bool _2418 = _2414 || _2416;
    float _2420 = float(_2418);
    float _2422 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2424 = in.m_79.x;
    float _2426 = fma(_2342, _2378, _2404);
    float _2428 = fma(_2324, _2386, _2408);
    float _2430 = _2400;
    float _2432 = _2398;
    if (!_2396)
    {
        float _2434 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2436 = _2354 + _2434;
        _2370 = _2436;
    }
    float _2438 = _2370;
    if (_2396)
    {
        _2430 = 1.0;
    }
    float _2440 = _2430;
    float _2442 = exp2(_2422);
    float _2444 = fma(_2322, _2386, _2426);
    float _2446 = fma(_2356, _2386, _2406);
    float _2448 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2444;
    out.m_81.y = _2428;
    out.m_81.z = _2446;
    float _2450 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2452 = precise::clamp(_2450, 0.0, 1.0);
    float _2454 = fma(_2452, -2.0, 3.0);
    float _2456 = _2452 * _2452;
    float _2458 = _2456 * _2454;
    float _2460 = _2454;
    float _2462 = _2440;
    float _2464 = _2129;
    if (!_2396)
    {
        _2460 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2466 = _2460;
    float _2468 = -_2458;
    float _2470 = _2468 + 1.0;
    float _2472 = _2466;
    if (!_2396)
    {
        float _2474 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2476 = _2466 + _2474;
        _2472 = _2476;
    }
    float _2478 = _2472;
    float _2480 = fma(_2470, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2458);
    float _2482 = _2358 + _2129;
    float _2484 = _2286;
    if (!_2396)
    {
        float _2486 = 1.0 / _2478;
        _2484 = _2486;
    }
    float _2488 = _2484;
    float _2490 = _2420 * _2480;
    float _2492 = _2482 * 0.5;
    float _2494 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2496 = _2165 + _2129;
    float _2498 = _2496 * 0.5;
    float _2500 = _2492;
    if (!_2396)
    {
        float _2502 = _2438 * _2488;
        float _2504 = precise::clamp(_2502, 0.0, 1.0);
        _2462 = _2504;
    }
    float _2506 = _2462;
    out.m_83.x = _2498;
    out.m_83.y = _2398;
    out.m_83.z = _2492;
    out.m_83.w = _2129;
    bool _2508 = _1889 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2510 = isnan(_1889);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2516 = _2512 || _2514;
    float _2518 = _2506 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2520 = -_2448;
    float _2522 = _2520 + 1.0;
    float _2524 = _2522;
    if (!_2516)
    {
        _2372 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2526 = _2372;
    float _2528 = _2526;
    float _2530 = _2526;
    if (!_2516)
    {
        _2374 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2532 = _2374;
    float _2534 = _2532;
    float _2536 = _2532;
    if (!_2516)
    {
        _2464 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2538 = _2464;
    float _2540 = _2538;
    float _2542 = _2538;
    if (!_2516)
    {
        _2500 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2544 = _2500;
    float _2546 = _2544;
    float _2548 = _2544;
    if (!_2516)
    {
        _2432 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2550 = _2432;
    float _2552 = -_2179;
    float _2554 = _2552 + 1.0;
    float _2556 = _2554 * _2494;
    float _2558 = precise::clamp(_2556, 0.0, 1.0);
    float _2560 = -_2558;
    float _2562 = fma(_2560, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2564 = _2562 * _2424;
    float _2566 = _2448 * _2197;
    float _2568 = _2564 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2570 = _2210 * _2566;
    float _2572 = _2210 * _2522;
    out.m_85.x = _2568;
    float _2574 = _2550;
    float _2576 = _2550;
    if (!_2516)
    {
        _2524 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2578 = _2524;
    float _2580 = _2220 * _2566;
    float _2582 = fma(_2216, _2570, _2204);
    float _2584 = fma(_2218, _2570, _2206);
    float _2586 = fma(_2210, _2580, _2208);
    out.m_87.x = _2582;
    out.m_87.y = _2584;
    out.m_87.z = _2586;
    out.m_87.w = _2572;
    bool _2588 = !_2516;
    float _2590 = _2578;
    float _2592 = _2578;
    if (!_2588)
    {
        bool _2594 = _1889 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2596 = isnan(_1889);
        bool _2598 = _2594 || _2596;
        bool _2600 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2602 = _2598 || _2600;
        if (!_2602)
        {
            float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2606 = _1889 + _2604;
            float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2610 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2608;
            float _2612 = 1.0 / _2610;
            float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2632 = _2630 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2634 = _2606 * _2612;
            float _2636 = precise::clamp(_2634, 0.0, 1.0);
            float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2642 = fma(_2636, _2616, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2644 = fma(_2636, _2640, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2646 = fma(_2636, _2620, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2648 = fma(_2636, _2624, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2650 = fma(_2636, _2628, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2652 = fma(_2636, _2632, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2536 = _2644;
            _2576 = _2650;
            _2530 = _2642;
            _2548 = _2648;
            _2542 = _2646;
            _2592 = _2652;
            _2654 = true;
        }
        else
        {
            bool _2656 = _1889 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2658 = isnan(_1889);
            bool _2660 = _2656 || _2658;
            bool _2662 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2664 = _2660 || _2662;
            if (!_2664)
            {
                _2528 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2666 = _2528;
            _2530 = _2666;
            if (!_2664)
            {
                _2534 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2668 = _2534;
            _2536 = _2668;
            if (!_2664)
            {
                _2540 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2670 = _2540;
            _2542 = _2670;
            if (!_2664)
            {
                _2546 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2672 = _2546;
            _2548 = _2672;
            if (!_2664)
            {
                _2574 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2674 = _2574;
            _2576 = _2674;
            if (!_2664)
            {
                _2590 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2676 = _2590;
            bool _2678 = !_2664;
            _2592 = _2676;
            if (!_2678)
            {
                bool _2680 = _1889 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2682 = isnan(_1889);
                bool _2684 = _2680 || _2682;
                bool _2686 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2688 = _2684 || _2686;
                if (!_2688)
                {
                    float _2690 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2692 = _1889 + _2690;
                    float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2696 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2694;
                    float _2698 = 1.0 / _2696;
                    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2708 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2720 = _2692 * _2698;
                    float _2722 = precise::clamp(_2720, 0.0, 1.0);
                    float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2728 = fma(_2722, _2702, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2730 = fma(_2722, _2726, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2732 = fma(_2722, _2706, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2734 = fma(_2722, _2710, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2736 = fma(_2722, _2714, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2738 = fma(_2722, _2718, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2536 = _2730;
                    _2576 = _2736;
                    _2530 = _2728;
                    _2548 = _2734;
                    _2542 = _2732;
                    _2592 = _2738;
                    _2654 = true;
                }
                else
                {
                    _2536 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2576 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2530 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2548 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2542 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2592 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2654 = false;
    float _2740 = _2536;
    float _2742 = _2576;
    float _2744 = _2530;
    float _2746 = _2548;
    float _2748 = _2542;
    float _2750 = _2592;
    float _2752 = fma(_2428, -0.5, 0.5);
    float _2754 = precise::clamp(_2752, 0.0, 1.0);
    float _2756 = -_2740;
    float _2758 = _2756 + _2742;
    float _2760 = -_2744;
    float _2762 = _2760 + _2746;
    out.m_89.x = 0.0;
    float _2764 = fma(_2754, _2758, _2740);
    float _2766 = -_2748;
    float _2768 = _2766 + _2750;
    float _2770 = fma(_2754, _2762, _2744);
    float _2772 = _2764 * 0.586610972881317138671875;
    bool _2774 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2776 = fma(_2754, _2768, _2748);
    float _2778 = _2518 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2780 = fma(_2770, 0.298911988735198974609375, _2772);
    bool _2782 = _2506 > 0.0;
    bool _2784 = isnan(_2506);
    bool _2786 = _2782 || _2784;
    bool _2788 = isnan(0.0);
    bool _2790 = _2786 || _2788;
    float _2792 = fma(_2776, 0.114477999508380889892578125, _2780);
    out.m_53.x = _2778;
    float _2794 = -_2792;
    float _2796 = _2770 + _2794;
    float _2798 = -_2792;
    float _2800 = _2764 + _2798;
    float _2802 = -_2792;
    float _2804 = _2776 + _2802;
    float _2806 = fma(_2796, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2792);
    float _2808 = fma(_2800, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2792);
    float _2810 = fma(_2804, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2792);
    bool _2812 = !_2774;
    if (!_2812)
    {
        float _2814 = -_1855;
        float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2818 = -_1857;
        float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2822 = -_1859;
        float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2826 = _2816 * _2816;
        float _2828 = fma(_2820, _2820, _2826);
        float _2830 = fma(_2824, _2824, _2828);
        float _2832 = sqrt(_2830);
        float _2834 = rsqrt(_2830);
        float _2836 = -_2832;
        float _2838 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2840 = _2838 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2842 = precise::clamp(_2840, 0.0, 1.0);
        float _2844 = _2820 * _2834;
        float _2846 = _2816 * _2834;
        float _2848 = abs(_2842);
        float _2850 = log2(_2848);
        float _2852 = _2824 * _2834;
        float _2854 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2856 = _2428 * _2846;
        float _2858 = -_2846;
        float _2860 = -_2854;
        float _2862 = fma(_2858, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2860);
        float _2864 = fma(_2444, _2844, _2856);
        float _2866 = -_2852;
        float _2868 = fma(_2866, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2862);
        float _2870 = fma(_2446, _2852, _2864);
        float _2872 = precise::clamp(_2870, 0.0, 1.0);
        float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2876 = _2868 + _2874;
        float _2878 = _2850 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2880 = _2876 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2882 = precise::clamp(_2880, 0.0, 1.0);
        float _2884 = exp2(_2878);
        float _2886 = _2884 * _2882;
        float _2888 = _2872 * _2886;
        float _2890 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2892 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2894 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2890;
        out.m_89.y = _2892;
        out.m_89.z = _2894;
    }
    out.m_91.x = _2806;
    out.m_91.y = _2808;
    out.m_91.z = _2810;
    if (_2790)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2896 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2896;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

