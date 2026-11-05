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
    float4 m_79 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2634 = false;
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
        float _2945 = as_type<float>(_134);
        out.gl_Position.z = _2945;
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
        float _3000 = as_type<float>(_160);
        out.gl_Position.z = _3000;
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
    float _771 = as_type<float>(_520) * _769;
    bool _773 = _685 > 0.5;
    bool _775 = _773 && _633;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _781 = _735 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _783 = _735 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _785 = _735 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _791 = _743 * _116;
    float _793 = trunc(_771);
    float _795 = precise::max(_793, 0.0);
    uint _797 = uint(_795);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _803 = _537 * 2.0;
    float _805 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = fma(_733, (*spvDescriptorSet0.vp_c10)._m0[4].x, _781);
    float _809 = _801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = fma(_733, (*spvDescriptorSet0.vp_c10)._m0[6].x, _785);
    float _813 = 1.0 / _779;
    bool _815 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _817 = isnan(0.0);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _823 = _819 || _821;
    bool _825 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _827 = isnan(1.0);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _833 = _829 || _831;
    float _835 = exp2(_791);
    float _837 = _787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = fma(_733, (*spvDescriptorSet0.vp_c10)._m0[5].x, _783);
    float _841 = _539 + _537;
    float _843 = in.m_55.z;
    float _845 = _841 + (-1.0);
    float _847 = floor(_803);
    out.m_65.x = _809;
    out.m_65.y = _837;
    out.m_65.z = _805;
    out.m_65.w = _799;
    float _849 = _597 * _813;
    float _851 = in.m_61.x;
    float _853 = -_835;
    float _855 = _853 + 1.0;
    float _857 = _823 ? _855 : 0.0;
    int _859 = _512 * int(_797);
    int _861 = _859 + _761;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _865 = 1.0 + _863;
    bool _867 = _847 > 0.0;
    float _869 = 1.0 / _865;
    float _871 = float(uint(_861));
    float _873 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _875 = _847 >= 0.0;
    bool _877 = isnan(_847);
    bool _879 = _875 || _877;
    bool _881 = isnan(0.0);
    bool _883 = _879 || _881;
    float _885 = _539 * 2.0;
    float _887 = _539 + _843;
    float _889 = as_type<float>(_520) * _871;
    float _891 = trunc(_889);
    float _893 = precise::max(_891, 0.0);
    uint _895 = uint(_893);
    float _897 = _887 + (-1.0);
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _901 = 0.0;
    float _903 = _851;
    float _905 = _873;
    if (_633)
    {
        _901 = _851;
    }
    float _907 = _901;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _911 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[78].z, _899);
    float _913 = floor(_885);
    int _915 = ~_484;
    int _917 = _915 + 1;
    float _919 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[78].w, _909);
    float _921 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _911);
    float _923 = _907;
    if (_775)
    {
        float _925 = -_907;
        float _927 = _925 + 1.0;
        _923 = _927;
    }
    float _929 = _923;
    float _931 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _919);
    if (_833)
    {
        float _933 = _857 * _869;
        _126 = _933;
    }
    float _935 = _126;
    int _937 = int(_797) + int(_895);
    float _939 = _843 * 2.0;
    int _941 = _883 ? 0 : 1;
    float _943 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_633)
    {
        _903 = _929;
    }
    float _945 = _903;
    int _947 = _917 * _937;
    int _949 = _947 + _761;
    bool _951 = _913 > 0.0;
    bool _953 = _913 >= 0.0;
    bool _955 = isnan(_913);
    bool _957 = _953 || _955;
    bool _959 = isnan(0.0);
    bool _961 = _957 || _959;
    float _963 = floor(_939);
    bool _965 = uint(_949) >= uint(_484);
    int _967 = _961 ? 0 : 1;
    bool _969 = !_965;
    int _971 = _969 ? 0 : (-1);
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _975 = _973 != 0;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _983 = _981 != 0;
    bool _985 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _987 = isnan(_472);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    int _997 = ~_937;
    int _999 = _997 + _971;
    int _1001 = _999 + 1;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1005 = _472 + _1003;
    int _1007 = ~_941;
    int _1009 = _1007 + 1;
    int _1011 = _1009 + 1;
    float _1013 = -_995;
    float _1015 = _1013 + 1.0;
    bool _1017 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1019 = isnan(_472);
    bool _1021 = _1017 || _1019;
    bool _1023 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1025 = _1021 || _1023;
    float _1027 = float(_1025);
    float _1029 = fma(_849, _1005, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1031 = _1011;
    if (!_867)
    {
        int _1033 = ~_941;
        int _1035 = _1033 + 1;
        _1031 = _1035;
    }
    int _1037 = _1031;
    bool _1039 = _963 > 0.0;
    float _1041 = _1027 * _1015;
    bool _1043 = _963 >= 0.0;
    bool _1045 = isnan(_963);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.0);
    bool _1051 = _1047 || _1049;
    int _1053 = _484 * _1001;
    int _1055 = _1053 + _761;
    float _1057 = float(uint(_727));
    float _1059 = _1029 * _1041;
    float _1061 = -_1027;
    float _1063 = _1061 + 1.0;
    bool _1065 = !_615;
    int _1067 = _1065 ? _1055 : (-1);
    float _1069 = as_type<float>(_520) * _1057;
    float _1071 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[4].z, _807);
    int _1073 = ~_967;
    int _1075 = _1073 + 1;
    int _1077 = _1075 + 1;
    float _1079 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[6].z, _811);
    int _1081 = _1067 >> 31;
    float _1083 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1059);
    int _1085 = _1077;
    if (!_951)
    {
        int _1087 = ~_967;
        int _1089 = _1087 + 1;
        _1085 = _1089;
    }
    int _1091 = _1085;
    float _1093 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1095 = _1081 & 3;
    float _1097 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[5].z, _839);
    float _1099 = trunc(_1069);
    float _1101 = precise::max(_1099, 0.0);
    uint _1103 = uint(_1101);
    bool _1105 = !_979;
    int _1107 = _1105 ? 0 : 1;
    float _1109 = -_767;
    float _1111 = fma(_931, _1093, _1109);
    int _1113 = _1067 + _1095;
    float _1115 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1117 = abs(_1107);
    float _1119 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1083);
    int _1121 = _1113 >> 2;
    float _1123 = fma(_921, _1115, _593);
    int _1125 = ~_484;
    int _1127 = _1125 + 1;
    float _1129 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1131 = _1121 << 4;
    int _1133 = _1131 + 368;
    float _1135 = _1119 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1137 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1139 = float(_1037);
    int _1141 = _1127 * int(_1103);
    int _1143 = _1141 + _727;
    uint _1145 = uint(int(uint(_1133) >> uint(2)));
    uint _1147 = uint(int(uint(int(_1145)) >> uint(2)));
    int _1149 = int(_1145) & 3;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[int(_1147)][_1149];
    int _1153 = int(_1145) + 1;
    uint _1155 = uint(int(uint(_1153) >> uint(2)));
    int _1157 = _1153 & 3;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[int(_1155)][_1157];
    int _1161 = _1051 ? 0 : 1;
    float _1163 = _1111 + 0.5;
    float _1165 = float(_1117);
    float _1167 = _1071 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1169 = ~_1161;
    int _1171 = _1169 + 1;
    int _1173 = _1171 + 1;
    float _1175 = _1079 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1177 = _1173;
    if (!_1039)
    {
        int _1179 = ~_1161;
        int _1181 = _1179 + 1;
        _1177 = _1181;
    }
    int _1183 = _1177;
    float _1185 = _1165 * _1139;
    float _1187 = float(uint(_1143));
    float _1189 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1191 = !_975;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = _1185 * (-2.0);
    int _1197 = _1067 & 3;
    bool _1199 = _1197 != 0;
    float _1201 = as_type<float>(_520) * _1187;
    int _1203 = _1067 & 3;
    bool _1205 = _1203 != 0;
    float _1207 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1209 = abs(_1193);
    float _1211 = trunc(_1201);
    float _1213 = precise::max(_1211, 0.0);
    uint _1215 = uint(_1213);
    bool _1217 = uint(_1203) > 1u;
    float _1219 = _448 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1221 = float(_1209);
    int _1223 = _1133 + 8;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    uint _1227 = uint(int(uint(int(_1225)) >> uint(2)));
    int _1229 = int(_1225) & 3;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[int(_1227)][_1229];
    int _1233 = int(_1225) + 1;
    uint _1235 = uint(int(uint(_1233) >> uint(2)));
    int _1237 = _1233 & 3;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[int(_1235)][_1237];
    float _1241 = float(_1183);
    float _1243 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1245 = _1199 ? 0 : 1;
    int _1247 = ~_484;
    int _1249 = _1247 + 1;
    float _1251 = _1221 * _1241;
    int _1253 = ~_1245;
    int _1255 = _1253 + 1;
    int _1257 = _1255 + 1;
    out.m_67.x = _1137;
    out.m_67.y = _1207;
    out.m_67.z = _1243;
    out.m_67.w = _1135;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1261 = _1259 != 0;
    float _1263 = _1097 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1265 = _1257;
    if (!_1217)
    {
        int _1267 = ~_1245;
        int _1269 = _1267 + 1;
        _1265 = _1269;
    }
    int _1271 = _1265;
    float _1273 = _1251 * (-2.0);
    int _1275 = int(_1103) + int(_1215);
    float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1279 = _1263 + _1277;
    bool _1281 = !_1205;
    int _1283 = _1281 ? 0 : 1;
    int _1285 = abs(_1271);
    int _1287 = abs(_1283);
    int _1289 = _1249 * _1275;
    int _1291 = _1289 + _727;
    bool _1293 = _1203 != 3;
    float _1295 = _1123 + 0.5;
    int _1297 = ~_1285;
    int _1299 = _1297 + 1;
    int _1301 = _1299 + 1;
    bool _1303 = uint(_1203) >= 2u;
    int _1305 = _1301 * as_type<int>(_1159);
    int _1307 = _1303 ? 0 : 1;
    out.m_69.x = _1295;
    out.m_69.y = _1163;
    int _1309 = ~_1287;
    int _1311 = _1309 + 1;
    int _1313 = _1311 + 1;
    float _1315 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1317 = ~_1307;
    int _1319 = _1317 + 1;
    int _1321 = _1319 + 1;
    bool _1323 = _1203 != 3;
    int _1325 = _1313 * as_type<int>(_1151);
    int _1327 = _1325 + _1305;
    int _1329 = _1321;
    if (_1293)
    {
        int _1331 = ~_1307;
        int _1333 = _1331 + 1;
        _1329 = _1333;
    }
    int _1335 = _1329;
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1339 = _1167 + _1337;
    float _1341 = in.m_71.x;
    float _1343 = in.m_71.y;
    float _1345 = in.m_71.z;
    bool _1347 = uint(_1291) >= uint(_484);
    bool _1349 = !_1323;
    int _1351 = _1349 ? 0 : (-1);
    int _1353 = abs(_1335);
    float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1357 = _1175 + _1355;
    bool _1359 = !_1347;
    int _1361 = _1359 ? 0 : (-1);
    int _1363 = abs(_1351);
    float _1365 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1315);
    bool _1367 = !_1261;
    int _1369 = _1367 ? 0 : 1;
    int _1371 = ~_1275;
    int _1373 = _1371 + _1361;
    int _1375 = _1373 + 1;
    float _1377 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1365);
    int _1379 = ~_1353;
    int _1381 = _1379 + 1;
    int _1383 = _1381 + 1;
    int _1385 = abs(_1369);
    int _1387 = _484 * _1375;
    int _1389 = _1387 + _727;
    float _1391 = _1279 * _1279;
    int _1393 = _1383 * as_type<int>(_1231);
    int _1395 = _1393 + _1327;
    int _1397 = ~_1363;
    int _1399 = _1397 + 1;
    int _1401 = _1399 + 1;
    float _1403 = fma(_1273, _1341, _1341);
    bool _1405 = _1377 >= 0.0;
    float _1407 = fma(_1339, _1339, _1391);
    int _1409 = _1401 * as_type<int>(_1239);
    int _1411 = _1409 + _1395;
    bool _1413 = !_615;
    int _1415 = _1413 ? _1389 : (-1);
    float _1417 = fma(_1357, _1357, _1407);
    int _1419 = ~_1385;
    int _1421 = _1419 + 1;
    int _1423 = _1421 + 1;
    float _1425 = fma(_873, _1273, _873);
    float _1427 = _537 + (-0.5);
    float _1429 = rsqrt(_1417);
    float _1431 = fma(_943, _1195, _943);
    int _1433 = _1411 * _1423;
    float _1435 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1403);
    if (_1405)
    {
        _905 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1437 = _905;
    int _1439 = _1415 * _1385;
    int _1441 = _1439 + _1433;
    bool _1443 = !_983;
    int _1445 = _1443 ? 0 : 1;
    int _1447 = as_type<int>(_1437);
    if (_1405)
    {
        out.m_53.x = 0.0;
    }
    if (_1405)
    {
        float _1449 = _1437 * 5.0;
        _1447 = as_type<int>(_1449);
    }
    int _1451 = _1447;
    float _1453 = fma(_1425, _935, _1435);
    float _1455 = float(_1441);
    float _1457 = fma(_1195, _1343, _1343);
    float _1459 = float(_1091);
    if (_1405)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4958 = as_type<float>(_1451);
        out.gl_Position.z = _4958;
    }
    int _1461 = abs(_1445);
    float _1463 = _539 + (-0.5);
    float _1465 = _1279 * _1429;
    out.m_73.x = _1455;
    float _1467 = _1339 * _1429;
    float _1469 = _1465;
    if (_1405)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1471 = -_1465;
    float _1473 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1263);
    float _1475 = _1357 * _1429;
    float _1477 = -_1467;
    float _1479 = fma(_1477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1167);
    float _1481 = float(_1461);
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1485 = _1473 + _1483;
    float _1487 = _1453 * 0.15915493667125701904296875;
    float _1489 = -_1475;
    float _1491 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1175);
    float _1493 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1495 = _1479 + _1493;
    float _1497 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1499 = _843 + _537;
    float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1503 = _1491 + _1501;
    float _1505 = _1481 * _1459;
    float _1507 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1497);
    float _1509 = _1499 + (-1.0);
    float _1511 = -_1465;
    float _1513 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1279);
    float _1515 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1507);
    float _1517 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1457);
    float _1519 = _1505 * (-2.0);
    float _1521 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1523 = -_1467;
    float _1525 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1339);
    bool _1527 = _1515 >= 0.0;
    float _1529 = _1513 * _1513;
    float _1531 = fma(_1519, _1345, _1345);
    float _1533 = _843 + (-0.5);
    float _1535 = fma(_1431, _935, _1517);
    float _1537 = fma(_1525, _1525, _1529);
    float _1539 = -_1475;
    float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1357);
    float _1543 = fma(_1521, _1519, _1521);
    float _1545 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1531);
    float _1547 = _1535 * 0.15915493667125701904296875;
    float _1549 = fma(_1541, _1541, _1537);
    float _1551 = _1487 * 6.283185482025146484375;
    float _1553 = sin(_1551);
    float _1555 = fma(_1543, _935, _1545);
    float _1557 = _1531;
    float _1559 = _1475;
    if (_1527)
    {
        _1557 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1561 = _1557;
    int _1563 = as_type<int>(_1561);
    if (_1527)
    {
        out.m_53.x = 0.0;
    }
    float _1565 = _1555 * 0.15915493667125701904296875;
    if (_1527)
    {
        float _1567 = _1561 * 5.0;
        _1563 = as_type<int>(_1567);
    }
    int _1569 = _1563;
    float _1571 = _1487 * 6.283185482025146484375;
    float _1573 = cos(_1571);
    if (_1527)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5157 = as_type<float>(_1569);
        out.gl_Position.z = _5157;
    }
    float _1575 = _1547 * 6.283185482025146484375;
    float _1577 = sin(_1575);
    float _1579 = _1547 * 6.283185482025146484375;
    float _1581 = cos(_1579);
    float _1583 = sqrt(_1549);
    if (_1527)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1585 = in.m_75.x;
    float _1587 = in.m_75.y;
    float _1589 = in.m_75.z;
    float _1591 = _1565 * 6.283185482025146484375;
    float _1593 = cos(_1591);
    float _1595 = _1429 * _1583;
    float _1597 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1599 = _1553 * _1577;
    float _1601 = _1553 * _1581;
    float _1603 = _1573 * _1581;
    float _1605 = _1573 * _1577;
    float _1607 = _1565 * 6.283185482025146484375;
    float _1609 = sin(_1607);
    bool _1611 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1613 = isnan(0.5);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1619 = _1615 || _1617;
    float _1621 = _1573 * _1593;
    float _1623 = _1581 * _1593;
    float _1625 = _1553 * _1593;
    float _1627 = _1577 * _1593;
    float _1629 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1631 = _1595 * _1597;
    float _1633 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1587);
    float _1637 = _1595 * _1629;
    float _1639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1585);
    float _1641 = _1595 * _1633;
    float _1643 = _1635 * _1631;
    float _1645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1589);
    float _1647 = _1639 * _1637;
    float _1649 = fma(_1609, _1603, _1599);
    float _1651 = _1621 * _1643;
    float _1653 = _1645 * _1641;
    float _1655 = -_1601;
    float _1657 = fma(_1609, _1605, _1655);
    float _1659 = -_1643;
    float _1661 = _1609 * _1659;
    float _1663 = fma(_1649, _1647, _1651);
    float _1665 = -_1605;
    float _1667 = fma(_1609, _1601, _1665);
    float _1669 = _1625 * _1643;
    float _1671 = fma(_1623, _1647, _1661);
    float _1673 = fma(_1657, _1653, _1663);
    float _1675 = fma(_1609, _1599, _1603);
    float _1677 = fma(_1667, _1647, _1669);
    float _1679 = fma(_1627, _1653, _1671);
    float _1681 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1683 = fma(_1675, _1653, _1677);
    float _1685 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1687 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1681);
    float _1689 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1685);
    float _1691 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1687);
    float _1693 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1689);
    float _1695 = _1691 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1697 = _1693 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1699 = _1175 + _1695;
    float _1701 = _1167 + _1697;
    float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1705 = _1699 + _1703;
    float _1707 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1711 = _1701 + _1709;
    float _1713 = _1705 * _1705;
    float _1715 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1707);
    float _1717 = fma(_1711, _1711, _1713);
    float _1719 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1715);
    float _1721 = sqrt(_1717);
    float _1723 = _1719 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1725 = _1263 + _1723;
    bool _1727 = _1721 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1729 = _1679;
    float _1731 = _1701;
    float _1733 = _1699;
    float _1735 = _1725;
    float _1737 = _1585;
    if (!_1727)
    {
        _1729 = _1725;
    }
    float _1739 = _1729;
    bool _1741 = !_1727;
    float _1743 = _1739;
    if (!_1741)
    {
        float _1745 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1747 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1749 = _1721 + _1747;
        float _1751 = rsqrt(_1717);
        float _1753 = _1749 * _1745;
        float _1755 = _1725 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1757 = _1753 * 0.15915493667125701904296875;
        float _1759 = _1757 * 6.283185482025146484375;
        float _1761 = sin(_1759);
        float _1763 = _1757 * 6.283185482025146484375;
        float _1765 = cos(_1763);
        float _1767 = fma(_1761, _1755, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1769 = _1751 * _1767;
        float _1771 = _1765 + (-1.0);
        float _1773 = fma(_1711, _1769, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1775 = fma(_1705, _1769, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1777 = _1771 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1779 = fma(_1725, _1765, _1777);
        _1731 = _1773;
        _1743 = _1779;
        _1733 = _1775;
    }
    float _1781 = _1731;
    float _1783 = _1743;
    float _1785 = _1733;
    float _1787 = -_1467;
    float _1789 = fma(_1787, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1781);
    float _1791 = -_1465;
    float _1793 = fma(_1791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1783);
    float _1795 = -_1475;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1785);
    float _1799 = _1793;
    float _1801 = _1789;
    float _1803 = _1797;
    if (!_1619)
    {
        float _1805 = _1485 * _1485;
        float _1807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1809 = -_1175;
        float _1811 = _1809 + _1785;
        float _1813 = -_1167;
        float _1815 = _1813 + _1781;
        float _1817 = fma(_1495, _1495, _1805);
        float _1819 = -_1263;
        float _1821 = _1819 + _1783;
        float _1823 = fma(_1503, _1503, _1817);
        float _1825 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1827 = sqrt(_1823);
        float _1829 = 1.0 / _1595;
        float _1831 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1833 = precise::min(_1827, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1835 = _1833 * _1807;
        float _1837 = _1835 * _1829;
        float _1839 = _1831 * _1837;
        float _1841 = _1811 * _1837;
        float _1843 = fma(_1815, _1839, _1479);
        float _1845 = fma(_1821, _1839, _1473);
        float _1847 = fma(_1831, _1841, _1491);
        _1799 = _1845;
        _1801 = _1843;
        _1803 = _1847;
        _1469 = _1807;
    }
    float _1849 = _1799;
    float _1851 = _1801;
    float _1853 = _1803;
    float _1855 = _1469;
    float _1857 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1859 = _1849 + _1857;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1863 = _1851 + _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1867 = _1853 + _1865;
    float _1869 = _1859 * _1859;
    float _1871 = fma(_1863, _1863, _1869);
    float _1873 = fma(_1867, _1867, _1871);
    float _1875 = rsqrt(_1873);
    float _1877 = sqrt(_1873);
    float _1879 = _1875 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1881 = _1863 * _1879;
    float _1883 = _1867 * _1879;
    float _1885 = _1881 * _1881;
    float _1887 = _1883 * _1883;
    float _1889 = _1885 + _1887;
    float _1891 = sqrt(_1889);
    bool _1893 = _1891 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1897 = _1891 + _1895;
    float _1899 = _1867;
    float _1901 = _1897;
    float _1903 = _1855;
    float _1905 = _1859;
    if (_1893)
    {
        float _1907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1899 = _1907;
    }
    float _1909 = _1899;
    if (_1893)
    {
        float _1911 = rsqrt(_1889);
        _1559 = _1911;
    }
    float _1913 = _1559;
    float _1915 = _1913;
    if (_1893)
    {
        float _1917 = _1897 * _1909;
        _1901 = _1917;
    }
    float _1919 = _1901;
    if (_1893)
    {
        float _1921 = _1919 * 0.15915493667125701904296875;
        _1903 = _1921;
    }
    float _1923 = _1903;
    float _1925 = _1875;
    float _1927 = _1923;
    if (_1893)
    {
        float _1929 = _1923 * 6.283185482025146484375;
        float _1931 = sin(_1929);
        _1925 = _1931;
    }
    float _1933 = _1925;
    float _1935 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1937 = precise::max(0.0, _1935);
    float _1939 = _1869;
    float _1941 = _1937;
    float _1943 = _1935;
    if (_1893)
    {
        float _1945 = _1923 * 6.283185482025146484375;
        float _1947 = cos(_1945);
        _1939 = _1947;
    }
    float _1949 = _1939;
    float _1951 = -_1879;
    float _1953 = -_1937;
    float _1955 = fma(_1859, _1951, _1953);
    if (!_1893)
    {
        _1905 = _1883;
    }
    float _1957 = _1905;
    float _1959 = _1957;
    if (_1893)
    {
        float _1961 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1941 = _1961;
    }
    float _1963 = _1941;
    float _1965 = _1963;
    if (!_1893)
    {
        _1927 = _1887;
    }
    float _1967 = _1927;
    float _1969 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1971 = _1933;
    float _1973 = _1967;
    if (_1893)
    {
        float _1975 = fma(_1933, _1963, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1965 = _1975;
    }
    float _1977 = _1965;
    if (!_1893)
    {
        _1971 = _1955;
    }
    float _1979 = _1971;
    float _1981 = _1979;
    float _1983 = _1949;
    if (_1893)
    {
        float _1985 = _1949 + (-1.0);
        _1943 = _1985;
    }
    float _1987 = _1943;
    float _1989 = _1987;
    if (_1893)
    {
        float _1991 = _1913 * _1977;
        _1735 = _1991;
    }
    float _1993 = _1735;
    if (!_1893)
    {
        _1915 = _1881;
    }
    float _1995 = _1915;
    float _1997 = _1995;
    if (_1893)
    {
        float _1999 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1989 = _1999;
    }
    float _2001 = _1989;
    if (_1893)
    {
        float _2003 = _1881 * _1993;
        _1997 = _2003;
    }
    float _2005 = _1997;
    if (_1893)
    {
        float _2007 = _1883 * _1993;
        _1959 = _2007;
    }
    float _2009 = _1959;
    if (_1893)
    {
        float _2011 = fma(_1955, _1949, _2001);
        _1981 = _2011;
    }
    float _2013 = _1981;
    if (!_1893)
    {
        _1983 = _1885;
    }
    float _2015 = _1983;
    float _2017 = _2015;
    if (_1893)
    {
        float _2019 = _2005 * _2005;
        _2017 = _2019;
    }
    float _2021 = _2017;
    if (_1893)
    {
        float _2023 = _2009 * _2009;
        _1973 = _2023;
    }
    float _2025 = _1973;
    float _2027 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1969);
    float _2029 = fma(_2013, _2013, _2021);
    float _2031 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2033 = fma(_1479, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2035 = _2029 + _2025;
    float _2037 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2031);
    float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2041 = fma(_1877, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2039);
    float _2043 = precise::clamp(_2041, 0.0, 1.0);
    float _2045 = rsqrt(_2035);
    float _2047 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2037);
    float _2049 = -_2043;
    float _2051 = _2049 + 1.0;
    float _2053 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2055 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2057 = floor(_2033);
    float _2059 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2061 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2063 = fma(_1491, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2065 = -_2059;
    float _2067 = fma(_2065, _2055, 1.0);
    float _2069 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2071 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2061);
    float _2073 = _2045 * _2005;
    float _2075 = _2045 * _2009;
    float _2077 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2069);
    float _2079 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2071);
    float _2081 = abs(_2051);
    float _2083 = log2(_2081);
    float _2085 = _2045 * _2013;
    float _2087 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2089 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2077);
    float _2091 = _2079 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2093 = -_2057;
    float _2095 = _2033 + _2093;
    float _2097 = -_2087;
    float _2099 = fma(_2085, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2097);
    float _2101 = _2089 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2103 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2105 = floor(_2063);
    float _2107 = -_2075;
    float _2109 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2099);
    float _2111 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2027);
    float _2113 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2103);
    float _2115 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2117 = fma(_2109, 0.5, 0.5);
    float _2119 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2121 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2113);
    float _2123 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2125 = log2(_2067);
    float _2127 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2129 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2121);
    float _2131 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2115);
    float _2133 = fma(_2117, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2135 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2127);
    float _2137 = exp2(_2123);
    float _2139 = fma(_2109, -0.5, 0.5);
    float _2141 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2135);
    float _2143 = -_2105;
    float _2145 = _2063 + _2143;
    float _2147 = _2085 + 1.0;
    float _2149 = fma(_2117, _2133, -0.212114393711090087890625);
    float _2151 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2141);
    float _2153 = sqrt(_2139);
    float _2155 = fma(_2117, _2149, 1.570728778839111328125);
    float _2157 = _2125 * 0.693147182464599609375;
    float _2159 = 1.0 / _2129;
    float _2161 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2131);
    float _2163 = -_2085;
    float _2165 = fma(_2137, _2147, _2163);
    float _2167 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2161);
    float2 _6128 = float2(_2095, _2145);
    float _2169 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6128, float2(0.0), isnan(_6128)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6128, float2(0.0), isnan(_6128)), level(0.0)).x;
    float _2171 = fma(_2165, 0.5, 0.5);
    float _2173 = _2153 * 0.636619746685028076171875;
    float _2175 = -_2155;
    float _2177 = fma(_2173, _2175, 1.0);
    float _2179 = _2167 * _2159;
    float _2181 = _2151 * _2159;
    float _2183 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2185 = fma(_2179, 0.5, 0.5);
    float _2187 = fma(_2181, -0.5, 0.5);
    float3 _6163 = float3(_2185, _2187, _2183);
    float _2189 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6163, float3(0.0), isnan(_6163)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6163, float3(0.0), isnan(_6163)), level(0.0)).x;
    float3 _6174 = float3(_2185, _2187, _2183);
    float4 _2192 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6174, float3(0.0), isnan(_6174)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6174, float3(0.0), isnan(_6174)), level(0.0)).xyzw;
    float _2194 = _2192.x;
    float _2196 = _2192.y;
    float _2198 = _2192.z;
    float _2200 = _2192.w;
    float2 _6190 = float2(_2177, _2171);
    float3 _2204 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6190, float2(0.0), isnan(_6190)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6190, float2(0.0), isnan(_6190)), level(0.0)).xyz;
    float _2206 = _2204.x;
    float _2208 = _2204.y;
    float _2210 = _2204.z;
    float _2212 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2214 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2216 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2218 = _1587 != 0.0;
    bool _2220 = isnan(_1587);
    bool _2222 = _2218 || _2220;
    bool _2224 = isnan(0.0);
    bool _2226 = _2222 || _2224;
    float _2228 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2212);
    float _2230 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2214);
    float _2232 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2234 = _1585 == 0.0;
    bool _2236 = !_2226;
    bool _2238 = _2234 && _2236;
    float _2240 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2228);
    float _2242 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2230);
    float _2244 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2246 = _2240 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2248 = _2242 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2250 = _1589 == 0.0;
    bool _2252 = _2250 && _2238;
    float _2254 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2256 = 1.0 / _2246;
    float _2258 = _2248 + _2246;
    float _2260 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2262 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2244);
    float _2264 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2216);
    float _2266 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2268 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2270 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2272 = isnan(0.5);
    bool _2274 = _2270 || _2272;
    bool _2276 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2278 = _2274 || _2276;
    float _2280 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2282 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2284 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2266);
    float _2286 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2268);
    float _2288 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2262);
    float _2290 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2282);
    float _2292 = -_1609;
    float _2294 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2232);
    float _2296 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2298 = _2258 * _2256;
    float _2300 = _2298 * 0.5;
    float _2302 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2286);
    float _2304 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2294);
    float _2306 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2296);
    float _2308 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2310 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2308);
    float _2312 = exp2(_2280);
    float _2314 = in.m_77.x;
    float _2316 = in.m_77.y;
    float _2318 = in.m_77.z;
    float _2320 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2306);
    float _2322 = 1.0 / _2310;
    float _2324 = -_2312;
    float _2326 = _2324 + 1.0;
    float _2328 = -_1609;
    float _2330 = fma(_2328, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2254);
    float _2332 = -_1609;
    float _2334 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2260);
    float _2336 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2338 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2290);
    float _2340 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2330);
    float _2342 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2334);
    float _2344 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2346 = _2322 * _2344;
    float _2348 = _2316;
    float _2350 = _2314;
    float _2352 = _2318;
    float _2354 = _2129;
    float _2356 = _2151;
    if (!_2252)
    {
        float _2358 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2316);
        _2348 = _2358;
    }
    float _2360 = _2348;
    float _2362 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2336);
    float _2364 = abs(_2346);
    float _2366 = log2(_2364);
    if (!_2252)
    {
        float _2368 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2314);
        _2350 = _2368;
    }
    float _2370 = _2350;
    float _2372 = _2304 * _2360;
    float _2374 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2362);
    float _2376 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2264);
    float _2378 = _2340 * _2360;
    float _2380 = _2342 * _2360;
    if (!_2252)
    {
        float _2382 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2318);
        _2352 = _2382;
    }
    float _2384 = _2352;
    float _2386 = fma(_2288, _2370, _2372);
    float _2388 = fma(_2338, _2370, _2378);
    float _2390 = fma(_2376, _2370, _2380);
    float _2392 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2394 = fma(_2320, _2384, _2386);
    float _2396 = _2386;
    if (!_2278)
    {
        float _2398 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2400 = _2346 + _2398;
        _2396 = _2400;
    }
    float _2402 = _2396;
    bool _2404 = _2346 <= 8000.0;
    bool _2406 = isnan(_2346);
    bool _2408 = _2404 || _2406;
    bool _2410 = isnan(8000.0);
    bool _2412 = _2408 || _2410;
    float _2414 = float(_2412);
    float _2416 = fma(_2374, _2384, _2388);
    float _2418 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (!_2278)
    {
        _1737 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2420 = _1737;
    float _2422 = exp2(_2418);
    float _2424 = _2420;
    float _2426 = _2167;
    if (!_2278)
    {
        float _2428 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2430 = _2420 + _2428;
        _2424 = _2430;
    }
    float _2432 = _2424;
    bool _2434 = _1877 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2436 = isnan(_1877);
    bool _2438 = _2434 || _2436;
    bool _2440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2442 = _2438 || _2440;
    float _2444 = _2338;
    float _2446 = _2432;
    if (!_2278)
    {
        float _2448 = 1.0 / _2432;
        _2444 = _2448;
    }
    float _2450 = _2444;
    float _2452 = fma(_2422, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2454 = precise::clamp(_2452, 0.0, 1.0);
    float _2456 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2284);
    if (_2278)
    {
        _2446 = 1.0;
    }
    float _2458 = _2446;
    float _2460 = fma(_2454, -2.0, 3.0);
    float _2462 = _2454 * _2454;
    float _2464 = fma(_2456, _2384, _2390);
    float _2466 = _2458;
    if (!_2278)
    {
        float _2468 = _2402 * _2450;
        float _2470 = precise::clamp(_2468, 0.0, 1.0);
        _2466 = _2470;
    }
    float _2472 = _2466;
    float _2474 = _2462 * _2460;
    out.m_79.x = _2394;
    out.m_79.y = _2416;
    out.m_79.z = _2464;
    float _2476 = -_2474;
    float _2478 = _2476 + 1.0;
    float _2480 = fma(_2478, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2474);
    float _2482 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2302);
    float _2484 = in.m_81.x;
    float _2486 = _2414 * _2480;
    float _2488 = _2482 + _2129;
    out.gl_Position.x = _2167;
    out.gl_Position.y = _2151;
    out.gl_Position.z = _2482;
    out.gl_Position.w = _2129;
    float _2490 = _2486 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2492 = _2488 * 0.5;
    out.m_83.z = _2492;
    out.m_83.w = _2129;
    float _2494 = _2482;
    if (!_2442)
    {
        _2354 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2496 = _2354;
    float _2498 = _2496;
    float _2500 = _2496;
    if (!_2442)
    {
        _2356 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2502 = _2356;
    float _2504 = _2502;
    float _2506 = _2502;
    if (!_2442)
    {
        _2494 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2508 = _2494;
    float _2510 = _2508;
    float _2512 = _2508;
    if (!_2442)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2514 = _2426;
    float _2516 = -_2169;
    float _2518 = _2516 + 1.0;
    float _2520 = _2518 * _2490;
    float _2522 = precise::clamp(_2520, 0.0, 1.0);
    float _2524 = -_2522;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2528 = _2526 * _2484;
    float _2530 = _2392 * _2189;
    float _2532 = -_2392;
    float _2534 = _2532 + 1.0;
    float _2536 = _2200 * _2530;
    float _2538 = _2210 * _2530;
    float _2540 = _2200 * _2534;
    float _2542 = fma(_2206, _2536, _2194);
    float _2544 = fma(_2208, _2536, _2196);
    float _2546 = _2528 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2548 = fma(_2200, _2538, _2198);
    float _2550 = _2472 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2552 = _2536;
    float _2554 = _2528;
    float _2556 = _2514;
    float _2558 = _2514;
    if (!_2442)
    {
        _2552 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2560 = _2552;
    out.m_85.x = _2546;
    float _2562 = _2560;
    float _2564 = _2560;
    if (!_2442)
    {
        _2554 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2566 = _2554;
    out.m_87.x = _2542;
    out.m_87.y = _2544;
    out.m_87.z = _2548;
    out.m_87.w = _2540;
    bool _2568 = !_2442;
    float _2570 = _2566;
    float _2572 = _2566;
    if (!_2568)
    {
        bool _2574 = _1877 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2576 = isnan(_1877);
        bool _2578 = _2574 || _2576;
        bool _2580 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2582 = _2578 || _2580;
        if (!_2582)
        {
            float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2586 = _1877 + _2584;
            float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2590 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2588;
            float _2592 = 1.0 / _2590;
            float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2610 = _2586 * _2592;
            float _2612 = precise::clamp(_2610, 0.0, 1.0);
            float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2622 = fma(_2612, _2596, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2624 = fma(_2612, _2616, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2626 = fma(_2612, _2620, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2628 = fma(_2612, _2600, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2630 = fma(_2612, _2604, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2632 = fma(_2612, _2608, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2506 = _2626;
            _2564 = _2630;
            _2500 = _2624;
            _2558 = _2628;
            _2512 = _2622;
            _2572 = _2632;
            _2634 = true;
        }
        else
        {
            bool _2636 = _1877 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2638 = isnan(_1877);
            bool _2640 = _2636 || _2638;
            bool _2642 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2644 = _2640 || _2642;
            if (!_2644)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2646 = _2498;
            _2500 = _2646;
            if (!_2644)
            {
                _2504 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2648 = _2504;
            _2506 = _2648;
            if (!_2644)
            {
                _2510 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2650 = _2510;
            _2512 = _2650;
            if (!_2644)
            {
                _2556 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2652 = _2556;
            _2558 = _2652;
            if (!_2644)
            {
                _2562 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2654 = _2562;
            _2564 = _2654;
            if (!_2644)
            {
                _2570 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2656 = _2570;
            bool _2658 = !_2644;
            _2572 = _2656;
            if (!_2658)
            {
                bool _2660 = _1877 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2662 = isnan(_1877);
                bool _2664 = _2660 || _2662;
                bool _2666 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2668 = _2664 || _2666;
                if (!_2668)
                {
                    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2672 = _1877 + _2670;
                    float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2676 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2674;
                    float _2678 = 1.0 / _2676;
                    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2694 = _2692 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2696 = _2672 * _2678;
                    float _2698 = precise::clamp(_2696, 0.0, 1.0);
                    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2708 = fma(_2698, _2682, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2710 = fma(_2698, _2702, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2712 = fma(_2698, _2706, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2714 = fma(_2698, _2686, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2716 = fma(_2698, _2690, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2718 = fma(_2698, _2694, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2506 = _2712;
                    _2564 = _2716;
                    _2500 = _2710;
                    _2558 = _2714;
                    _2512 = _2708;
                    _2572 = _2718;
                    _2634 = true;
                }
                else
                {
                    _2506 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2564 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2558 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2512 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2572 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2634 = false;
    float _2720 = _2506;
    float _2722 = _2564;
    float _2724 = _2500;
    float _2726 = _2558;
    float _2728 = _2512;
    float _2730 = _2572;
    float _2732 = _2550 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2734 = fma(_2416, -0.5, 0.5);
    float _2736 = precise::clamp(_2734, 0.0, 1.0);
    float _2738 = -_2720;
    float _2740 = _2738 + _2722;
    float _2742 = -_2724;
    float _2744 = _2742 + _2726;
    out.m_53.x = _2732;
    float _2746 = fma(_2736, _2740, _2720);
    float _2748 = -_2728;
    float _2750 = _2748 + _2730;
    float _2752 = fma(_2736, _2744, _2724);
    float _2754 = _2746 * 0.586610972881317138671875;
    bool _2756 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2758 = fma(_2736, _2750, _2728);
    out.m_89.x = 0.0;
    float _2760 = fma(_2752, 0.298911988735198974609375, _2754);
    bool _2762 = _2472 > 0.0;
    bool _2764 = isnan(_2472);
    bool _2766 = _2762 || _2764;
    bool _2768 = isnan(0.0);
    bool _2770 = _2766 || _2768;
    float _2772 = fma(_2758, 0.114477999508380889892578125, _2760);
    float _2774 = -_2772;
    float _2776 = _2752 + _2774;
    float _2778 = -_2772;
    float _2780 = _2746 + _2778;
    float _2782 = -_2772;
    float _2784 = _2758 + _2782;
    float _2786 = fma(_2776, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2772);
    float _2788 = fma(_2780, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2772);
    float _2790 = fma(_2784, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2772);
    bool _2792 = !_2756;
    if (!_2792)
    {
        float _2794 = -_1849;
        float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2798 = -_1851;
        float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2802 = -_1853;
        float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2806 = _2796 * _2796;
        float _2808 = fma(_2800, _2800, _2806);
        float _2810 = fma(_2804, _2804, _2808);
        float _2812 = sqrt(_2810);
        float _2814 = rsqrt(_2810);
        float _2816 = -_2812;
        float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2820 = _2818 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2822 = precise::clamp(_2820, 0.0, 1.0);
        float _2824 = _2800 * _2814;
        float _2826 = _2796 * _2814;
        float _2828 = abs(_2822);
        float _2830 = log2(_2828);
        float _2832 = _2804 * _2814;
        float _2834 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2836 = _2416 * _2826;
        float _2838 = -_2826;
        float _2840 = -_2834;
        float _2842 = fma(_2838, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2840);
        float _2844 = fma(_2394, _2824, _2836);
        float _2846 = -_2832;
        float _2848 = fma(_2846, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2842);
        float _2850 = fma(_2464, _2832, _2844);
        float _2852 = precise::clamp(_2850, 0.0, 1.0);
        float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2856 = _2848 + _2854;
        float _2858 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2860 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2862 = precise::clamp(_2860, 0.0, 1.0);
        float _2864 = exp2(_2858);
        float _2866 = _2864 * _2862;
        float _2868 = _2852 * _2866;
        float _2870 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2872 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2874 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2870;
        out.m_89.y = _2872;
        out.m_89.z = _2874;
    }
    out.m_91.x = _2786;
    out.m_91.y = _2788;
    out.m_91.z = _2790;
    if (_2770)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2876 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2876;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2634 = false;
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
        float _2945 = as_type<float>(_134);
        out.gl_Position.z = _2945;
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
        float _3000 = as_type<float>(_160);
        out.gl_Position.z = _3000;
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
    float _771 = as_type<float>(_520) * _769;
    bool _773 = _685 > 0.5;
    bool _775 = _773 && _633;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _781 = _735 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _783 = _735 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _785 = _735 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _791 = _743 * _116;
    float _793 = trunc(_771);
    float _795 = precise::max(_793, 0.0);
    uint _797 = uint(_795);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _803 = _537 * 2.0;
    float _805 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = fma(_733, (*spvDescriptorSet0.vp_c10)._m0[4].x, _781);
    float _809 = _801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = fma(_733, (*spvDescriptorSet0.vp_c10)._m0[6].x, _785);
    float _813 = 1.0 / _779;
    bool _815 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _817 = isnan(0.0);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _823 = _819 || _821;
    bool _825 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _827 = isnan(1.0);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _833 = _829 || _831;
    float _835 = exp2(_791);
    float _837 = _787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = fma(_733, (*spvDescriptorSet0.vp_c10)._m0[5].x, _783);
    float _841 = _539 + _537;
    float _843 = in.m_55.z;
    float _845 = _841 + (-1.0);
    float _847 = floor(_803);
    out.m_65.x = _809;
    out.m_65.y = _837;
    out.m_65.z = _805;
    out.m_65.w = _799;
    float _849 = _597 * _813;
    float _851 = in.m_61.x;
    float _853 = -_835;
    float _855 = _853 + 1.0;
    float _857 = _823 ? _855 : 0.0;
    int _859 = _512 * int(_797);
    int _861 = _859 + _761;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _865 = 1.0 + _863;
    bool _867 = _847 > 0.0;
    float _869 = 1.0 / _865;
    float _871 = float(uint(_861));
    float _873 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _875 = _847 >= 0.0;
    bool _877 = isnan(_847);
    bool _879 = _875 || _877;
    bool _881 = isnan(0.0);
    bool _883 = _879 || _881;
    float _885 = _539 * 2.0;
    float _887 = _539 + _843;
    float _889 = as_type<float>(_520) * _871;
    float _891 = trunc(_889);
    float _893 = precise::max(_891, 0.0);
    uint _895 = uint(_893);
    float _897 = _887 + (-1.0);
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _901 = 0.0;
    float _903 = _851;
    float _905 = _873;
    if (_633)
    {
        _901 = _851;
    }
    float _907 = _901;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _911 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[78].z, _899);
    float _913 = floor(_885);
    int _915 = ~_484;
    int _917 = _915 + 1;
    float _919 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[78].w, _909);
    float _921 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _911);
    float _923 = _907;
    if (_775)
    {
        float _925 = -_907;
        float _927 = _925 + 1.0;
        _923 = _927;
    }
    float _929 = _923;
    float _931 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _919);
    if (_833)
    {
        float _933 = _857 * _869;
        _126 = _933;
    }
    float _935 = _126;
    int _937 = int(_797) + int(_895);
    float _939 = _843 * 2.0;
    int _941 = _883 ? 0 : 1;
    float _943 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_633)
    {
        _903 = _929;
    }
    float _945 = _903;
    int _947 = _917 * _937;
    int _949 = _947 + _761;
    bool _951 = _913 > 0.0;
    bool _953 = _913 >= 0.0;
    bool _955 = isnan(_913);
    bool _957 = _953 || _955;
    bool _959 = isnan(0.0);
    bool _961 = _957 || _959;
    float _963 = floor(_939);
    bool _965 = uint(_949) >= uint(_484);
    int _967 = _961 ? 0 : 1;
    bool _969 = !_965;
    int _971 = _969 ? 0 : (-1);
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _975 = _973 != 0;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _983 = _981 != 0;
    bool _985 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _987 = isnan(_472);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    int _997 = ~_937;
    int _999 = _997 + _971;
    int _1001 = _999 + 1;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1005 = _472 + _1003;
    int _1007 = ~_941;
    int _1009 = _1007 + 1;
    int _1011 = _1009 + 1;
    float _1013 = -_995;
    float _1015 = _1013 + 1.0;
    bool _1017 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1019 = isnan(_472);
    bool _1021 = _1017 || _1019;
    bool _1023 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1025 = _1021 || _1023;
    float _1027 = float(_1025);
    float _1029 = fma(_849, _1005, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1031 = _1011;
    if (!_867)
    {
        int _1033 = ~_941;
        int _1035 = _1033 + 1;
        _1031 = _1035;
    }
    int _1037 = _1031;
    bool _1039 = _963 > 0.0;
    float _1041 = _1027 * _1015;
    bool _1043 = _963 >= 0.0;
    bool _1045 = isnan(_963);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.0);
    bool _1051 = _1047 || _1049;
    int _1053 = _484 * _1001;
    int _1055 = _1053 + _761;
    float _1057 = float(uint(_727));
    float _1059 = _1029 * _1041;
    float _1061 = -_1027;
    float _1063 = _1061 + 1.0;
    bool _1065 = !_615;
    int _1067 = _1065 ? _1055 : (-1);
    float _1069 = as_type<float>(_520) * _1057;
    float _1071 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[4].z, _807);
    int _1073 = ~_967;
    int _1075 = _1073 + 1;
    int _1077 = _1075 + 1;
    float _1079 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[6].z, _811);
    int _1081 = _1067 >> 31;
    float _1083 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1059);
    int _1085 = _1077;
    if (!_951)
    {
        int _1087 = ~_967;
        int _1089 = _1087 + 1;
        _1085 = _1089;
    }
    int _1091 = _1085;
    float _1093 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1095 = _1081 & 3;
    float _1097 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[5].z, _839);
    float _1099 = trunc(_1069);
    float _1101 = precise::max(_1099, 0.0);
    uint _1103 = uint(_1101);
    bool _1105 = !_979;
    int _1107 = _1105 ? 0 : 1;
    float _1109 = -_767;
    float _1111 = fma(_931, _1093, _1109);
    int _1113 = _1067 + _1095;
    float _1115 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1117 = abs(_1107);
    float _1119 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1083);
    int _1121 = _1113 >> 2;
    float _1123 = fma(_921, _1115, _593);
    int _1125 = ~_484;
    int _1127 = _1125 + 1;
    float _1129 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1131 = _1121 << 4;
    int _1133 = _1131 + 368;
    float _1135 = _1119 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1137 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1139 = float(_1037);
    int _1141 = _1127 * int(_1103);
    int _1143 = _1141 + _727;
    uint _1145 = uint(int(uint(_1133) >> uint(2)));
    uint _1147 = uint(int(uint(int(_1145)) >> uint(2)));
    int _1149 = int(_1145) & 3;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[int(_1147)][_1149];
    int _1153 = int(_1145) + 1;
    uint _1155 = uint(int(uint(_1153) >> uint(2)));
    int _1157 = _1153 & 3;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[int(_1155)][_1157];
    int _1161 = _1051 ? 0 : 1;
    float _1163 = _1111 + 0.5;
    float _1165 = float(_1117);
    float _1167 = _1071 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1169 = ~_1161;
    int _1171 = _1169 + 1;
    int _1173 = _1171 + 1;
    float _1175 = _1079 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1177 = _1173;
    if (!_1039)
    {
        int _1179 = ~_1161;
        int _1181 = _1179 + 1;
        _1177 = _1181;
    }
    int _1183 = _1177;
    float _1185 = _1165 * _1139;
    float _1187 = float(uint(_1143));
    float _1189 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1191 = !_975;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = _1185 * (-2.0);
    int _1197 = _1067 & 3;
    bool _1199 = _1197 != 0;
    float _1201 = as_type<float>(_520) * _1187;
    int _1203 = _1067 & 3;
    bool _1205 = _1203 != 0;
    float _1207 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1209 = abs(_1193);
    float _1211 = trunc(_1201);
    float _1213 = precise::max(_1211, 0.0);
    uint _1215 = uint(_1213);
    bool _1217 = uint(_1203) > 1u;
    float _1219 = _448 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1221 = float(_1209);
    int _1223 = _1133 + 8;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    uint _1227 = uint(int(uint(int(_1225)) >> uint(2)));
    int _1229 = int(_1225) & 3;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[int(_1227)][_1229];
    int _1233 = int(_1225) + 1;
    uint _1235 = uint(int(uint(_1233) >> uint(2)));
    int _1237 = _1233 & 3;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[int(_1235)][_1237];
    float _1241 = float(_1183);
    float _1243 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1245 = _1199 ? 0 : 1;
    int _1247 = ~_484;
    int _1249 = _1247 + 1;
    float _1251 = _1221 * _1241;
    int _1253 = ~_1245;
    int _1255 = _1253 + 1;
    int _1257 = _1255 + 1;
    out.m_67.x = _1137;
    out.m_67.y = _1207;
    out.m_67.z = _1243;
    out.m_67.w = _1135;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1261 = _1259 != 0;
    float _1263 = _1097 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1265 = _1257;
    if (!_1217)
    {
        int _1267 = ~_1245;
        int _1269 = _1267 + 1;
        _1265 = _1269;
    }
    int _1271 = _1265;
    float _1273 = _1251 * (-2.0);
    int _1275 = int(_1103) + int(_1215);
    float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1279 = _1263 + _1277;
    bool _1281 = !_1205;
    int _1283 = _1281 ? 0 : 1;
    int _1285 = abs(_1271);
    int _1287 = abs(_1283);
    int _1289 = _1249 * _1275;
    int _1291 = _1289 + _727;
    bool _1293 = _1203 != 3;
    float _1295 = _1123 + 0.5;
    int _1297 = ~_1285;
    int _1299 = _1297 + 1;
    int _1301 = _1299 + 1;
    bool _1303 = uint(_1203) >= 2u;
    int _1305 = _1301 * as_type<int>(_1159);
    int _1307 = _1303 ? 0 : 1;
    out.m_69.x = _1295;
    out.m_69.y = _1163;
    int _1309 = ~_1287;
    int _1311 = _1309 + 1;
    int _1313 = _1311 + 1;
    float _1315 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1317 = ~_1307;
    int _1319 = _1317 + 1;
    int _1321 = _1319 + 1;
    bool _1323 = _1203 != 3;
    int _1325 = _1313 * as_type<int>(_1151);
    int _1327 = _1325 + _1305;
    int _1329 = _1321;
    if (_1293)
    {
        int _1331 = ~_1307;
        int _1333 = _1331 + 1;
        _1329 = _1333;
    }
    int _1335 = _1329;
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1339 = _1167 + _1337;
    float _1341 = in.m_71.x;
    float _1343 = in.m_71.y;
    float _1345 = in.m_71.z;
    bool _1347 = uint(_1291) >= uint(_484);
    bool _1349 = !_1323;
    int _1351 = _1349 ? 0 : (-1);
    int _1353 = abs(_1335);
    float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1357 = _1175 + _1355;
    bool _1359 = !_1347;
    int _1361 = _1359 ? 0 : (-1);
    int _1363 = abs(_1351);
    float _1365 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1315);
    bool _1367 = !_1261;
    int _1369 = _1367 ? 0 : 1;
    int _1371 = ~_1275;
    int _1373 = _1371 + _1361;
    int _1375 = _1373 + 1;
    float _1377 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1365);
    int _1379 = ~_1353;
    int _1381 = _1379 + 1;
    int _1383 = _1381 + 1;
    int _1385 = abs(_1369);
    int _1387 = _484 * _1375;
    int _1389 = _1387 + _727;
    float _1391 = _1279 * _1279;
    int _1393 = _1383 * as_type<int>(_1231);
    int _1395 = _1393 + _1327;
    int _1397 = ~_1363;
    int _1399 = _1397 + 1;
    int _1401 = _1399 + 1;
    float _1403 = fma(_1273, _1341, _1341);
    bool _1405 = _1377 >= 0.0;
    float _1407 = fma(_1339, _1339, _1391);
    int _1409 = _1401 * as_type<int>(_1239);
    int _1411 = _1409 + _1395;
    bool _1413 = !_615;
    int _1415 = _1413 ? _1389 : (-1);
    float _1417 = fma(_1357, _1357, _1407);
    int _1419 = ~_1385;
    int _1421 = _1419 + 1;
    int _1423 = _1421 + 1;
    float _1425 = fma(_873, _1273, _873);
    float _1427 = _537 + (-0.5);
    float _1429 = rsqrt(_1417);
    float _1431 = fma(_943, _1195, _943);
    int _1433 = _1411 * _1423;
    float _1435 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1403);
    if (_1405)
    {
        _905 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1437 = _905;
    int _1439 = _1415 * _1385;
    int _1441 = _1439 + _1433;
    bool _1443 = !_983;
    int _1445 = _1443 ? 0 : 1;
    int _1447 = as_type<int>(_1437);
    if (_1405)
    {
        out.m_53.x = 0.0;
    }
    if (_1405)
    {
        float _1449 = _1437 * 5.0;
        _1447 = as_type<int>(_1449);
    }
    int _1451 = _1447;
    float _1453 = fma(_1425, _935, _1435);
    float _1455 = float(_1441);
    float _1457 = fma(_1195, _1343, _1343);
    float _1459 = float(_1091);
    if (_1405)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4958 = as_type<float>(_1451);
        out.gl_Position.z = _4958;
    }
    int _1461 = abs(_1445);
    float _1463 = _539 + (-0.5);
    float _1465 = _1279 * _1429;
    out.m_73.x = _1455;
    float _1467 = _1339 * _1429;
    float _1469 = _1465;
    if (_1405)
    {
        return out;
    }
    float _1471 = -_1465;
    float _1473 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1263);
    float _1475 = _1357 * _1429;
    float _1477 = -_1467;
    float _1479 = fma(_1477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1167);
    float _1481 = float(_1461);
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1485 = _1473 + _1483;
    float _1487 = _1453 * 0.15915493667125701904296875;
    float _1489 = -_1475;
    float _1491 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1175);
    float _1493 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1495 = _1479 + _1493;
    float _1497 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1499 = _843 + _537;
    float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1503 = _1491 + _1501;
    float _1505 = _1481 * _1459;
    float _1507 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1497);
    float _1509 = _1499 + (-1.0);
    float _1511 = -_1465;
    float _1513 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1279);
    float _1515 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1507);
    float _1517 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1457);
    float _1519 = _1505 * (-2.0);
    float _1521 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1523 = -_1467;
    float _1525 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1339);
    bool _1527 = _1515 >= 0.0;
    float _1529 = _1513 * _1513;
    float _1531 = fma(_1519, _1345, _1345);
    float _1533 = _843 + (-0.5);
    float _1535 = fma(_1431, _935, _1517);
    float _1537 = fma(_1525, _1525, _1529);
    float _1539 = -_1475;
    float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1357);
    float _1543 = fma(_1521, _1519, _1521);
    float _1545 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1531);
    float _1547 = _1535 * 0.15915493667125701904296875;
    float _1549 = fma(_1541, _1541, _1537);
    float _1551 = _1487 * 6.283185482025146484375;
    float _1553 = sin(_1551);
    float _1555 = fma(_1543, _935, _1545);
    float _1557 = _1531;
    float _1559 = _1475;
    if (_1527)
    {
        _1557 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1561 = _1557;
    int _1563 = as_type<int>(_1561);
    if (_1527)
    {
        out.m_53.x = 0.0;
    }
    float _1565 = _1555 * 0.15915493667125701904296875;
    if (_1527)
    {
        float _1567 = _1561 * 5.0;
        _1563 = as_type<int>(_1567);
    }
    int _1569 = _1563;
    float _1571 = _1487 * 6.283185482025146484375;
    float _1573 = cos(_1571);
    if (_1527)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5157 = as_type<float>(_1569);
        out.gl_Position.z = _5157;
    }
    float _1575 = _1547 * 6.283185482025146484375;
    float _1577 = sin(_1575);
    float _1579 = _1547 * 6.283185482025146484375;
    float _1581 = cos(_1579);
    float _1583 = sqrt(_1549);
    if (_1527)
    {
        return out;
    }
    float _1585 = in.m_75.x;
    float _1587 = in.m_75.y;
    float _1589 = in.m_75.z;
    float _1591 = _1565 * 6.283185482025146484375;
    float _1593 = cos(_1591);
    float _1595 = _1429 * _1583;
    float _1597 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1599 = _1553 * _1577;
    float _1601 = _1553 * _1581;
    float _1603 = _1573 * _1581;
    float _1605 = _1573 * _1577;
    float _1607 = _1565 * 6.283185482025146484375;
    float _1609 = sin(_1607);
    bool _1611 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1613 = isnan(0.5);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1619 = _1615 || _1617;
    float _1621 = _1573 * _1593;
    float _1623 = _1581 * _1593;
    float _1625 = _1553 * _1593;
    float _1627 = _1577 * _1593;
    float _1629 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1631 = _1595 * _1597;
    float _1633 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1587);
    float _1637 = _1595 * _1629;
    float _1639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1585);
    float _1641 = _1595 * _1633;
    float _1643 = _1635 * _1631;
    float _1645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1589);
    float _1647 = _1639 * _1637;
    float _1649 = fma(_1609, _1603, _1599);
    float _1651 = _1621 * _1643;
    float _1653 = _1645 * _1641;
    float _1655 = -_1601;
    float _1657 = fma(_1609, _1605, _1655);
    float _1659 = -_1643;
    float _1661 = _1609 * _1659;
    float _1663 = fma(_1649, _1647, _1651);
    float _1665 = -_1605;
    float _1667 = fma(_1609, _1601, _1665);
    float _1669 = _1625 * _1643;
    float _1671 = fma(_1623, _1647, _1661);
    float _1673 = fma(_1657, _1653, _1663);
    float _1675 = fma(_1609, _1599, _1603);
    float _1677 = fma(_1667, _1647, _1669);
    float _1679 = fma(_1627, _1653, _1671);
    float _1681 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1683 = fma(_1675, _1653, _1677);
    float _1685 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1687 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1681);
    float _1689 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1685);
    float _1691 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1687);
    float _1693 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1689);
    float _1695 = _1691 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1697 = _1693 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1699 = _1175 + _1695;
    float _1701 = _1167 + _1697;
    float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1705 = _1699 + _1703;
    float _1707 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1711 = _1701 + _1709;
    float _1713 = _1705 * _1705;
    float _1715 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1707);
    float _1717 = fma(_1711, _1711, _1713);
    float _1719 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1715);
    float _1721 = sqrt(_1717);
    float _1723 = _1719 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1725 = _1263 + _1723;
    bool _1727 = _1721 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1729 = _1679;
    float _1731 = _1701;
    float _1733 = _1699;
    float _1735 = _1725;
    float _1737 = _1585;
    if (!_1727)
    {
        _1729 = _1725;
    }
    float _1739 = _1729;
    bool _1741 = !_1727;
    float _1743 = _1739;
    if (!_1741)
    {
        float _1745 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1747 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1749 = _1721 + _1747;
        float _1751 = rsqrt(_1717);
        float _1753 = _1749 * _1745;
        float _1755 = _1725 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1757 = _1753 * 0.15915493667125701904296875;
        float _1759 = _1757 * 6.283185482025146484375;
        float _1761 = sin(_1759);
        float _1763 = _1757 * 6.283185482025146484375;
        float _1765 = cos(_1763);
        float _1767 = fma(_1761, _1755, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1769 = _1751 * _1767;
        float _1771 = _1765 + (-1.0);
        float _1773 = fma(_1711, _1769, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1775 = fma(_1705, _1769, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1777 = _1771 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1779 = fma(_1725, _1765, _1777);
        _1731 = _1773;
        _1743 = _1779;
        _1733 = _1775;
    }
    float _1781 = _1731;
    float _1783 = _1743;
    float _1785 = _1733;
    float _1787 = -_1467;
    float _1789 = fma(_1787, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1781);
    float _1791 = -_1465;
    float _1793 = fma(_1791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1783);
    float _1795 = -_1475;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1785);
    float _1799 = _1793;
    float _1801 = _1789;
    float _1803 = _1797;
    if (!_1619)
    {
        float _1805 = _1485 * _1485;
        float _1807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1809 = -_1175;
        float _1811 = _1809 + _1785;
        float _1813 = -_1167;
        float _1815 = _1813 + _1781;
        float _1817 = fma(_1495, _1495, _1805);
        float _1819 = -_1263;
        float _1821 = _1819 + _1783;
        float _1823 = fma(_1503, _1503, _1817);
        float _1825 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1827 = sqrt(_1823);
        float _1829 = 1.0 / _1595;
        float _1831 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1833 = precise::min(_1827, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1835 = _1833 * _1807;
        float _1837 = _1835 * _1829;
        float _1839 = _1831 * _1837;
        float _1841 = _1811 * _1837;
        float _1843 = fma(_1815, _1839, _1479);
        float _1845 = fma(_1821, _1839, _1473);
        float _1847 = fma(_1831, _1841, _1491);
        _1799 = _1845;
        _1801 = _1843;
        _1803 = _1847;
        _1469 = _1807;
    }
    float _1849 = _1799;
    float _1851 = _1801;
    float _1853 = _1803;
    float _1855 = _1469;
    float _1857 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1859 = _1849 + _1857;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1863 = _1851 + _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1867 = _1853 + _1865;
    float _1869 = _1859 * _1859;
    float _1871 = fma(_1863, _1863, _1869);
    float _1873 = fma(_1867, _1867, _1871);
    float _1875 = rsqrt(_1873);
    float _1877 = sqrt(_1873);
    float _1879 = _1875 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1881 = _1863 * _1879;
    float _1883 = _1867 * _1879;
    float _1885 = _1881 * _1881;
    float _1887 = _1883 * _1883;
    float _1889 = _1885 + _1887;
    float _1891 = sqrt(_1889);
    bool _1893 = _1891 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1897 = _1891 + _1895;
    float _1899 = _1867;
    float _1901 = _1897;
    float _1903 = _1855;
    float _1905 = _1859;
    if (_1893)
    {
        float _1907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1899 = _1907;
    }
    float _1909 = _1899;
    if (_1893)
    {
        float _1911 = rsqrt(_1889);
        _1559 = _1911;
    }
    float _1913 = _1559;
    float _1915 = _1913;
    if (_1893)
    {
        float _1917 = _1897 * _1909;
        _1901 = _1917;
    }
    float _1919 = _1901;
    if (_1893)
    {
        float _1921 = _1919 * 0.15915493667125701904296875;
        _1903 = _1921;
    }
    float _1923 = _1903;
    float _1925 = _1875;
    float _1927 = _1923;
    if (_1893)
    {
        float _1929 = _1923 * 6.283185482025146484375;
        float _1931 = sin(_1929);
        _1925 = _1931;
    }
    float _1933 = _1925;
    float _1935 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1937 = precise::max(0.0, _1935);
    float _1939 = _1869;
    float _1941 = _1937;
    float _1943 = _1935;
    if (_1893)
    {
        float _1945 = _1923 * 6.283185482025146484375;
        float _1947 = cos(_1945);
        _1939 = _1947;
    }
    float _1949 = _1939;
    float _1951 = -_1879;
    float _1953 = -_1937;
    float _1955 = fma(_1859, _1951, _1953);
    if (!_1893)
    {
        _1905 = _1883;
    }
    float _1957 = _1905;
    float _1959 = _1957;
    if (_1893)
    {
        float _1961 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1941 = _1961;
    }
    float _1963 = _1941;
    float _1965 = _1963;
    if (!_1893)
    {
        _1927 = _1887;
    }
    float _1967 = _1927;
    float _1969 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1971 = _1933;
    float _1973 = _1967;
    if (_1893)
    {
        float _1975 = fma(_1933, _1963, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1965 = _1975;
    }
    float _1977 = _1965;
    if (!_1893)
    {
        _1971 = _1955;
    }
    float _1979 = _1971;
    float _1981 = _1979;
    float _1983 = _1949;
    if (_1893)
    {
        float _1985 = _1949 + (-1.0);
        _1943 = _1985;
    }
    float _1987 = _1943;
    float _1989 = _1987;
    if (_1893)
    {
        float _1991 = _1913 * _1977;
        _1735 = _1991;
    }
    float _1993 = _1735;
    if (!_1893)
    {
        _1915 = _1881;
    }
    float _1995 = _1915;
    float _1997 = _1995;
    if (_1893)
    {
        float _1999 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1989 = _1999;
    }
    float _2001 = _1989;
    if (_1893)
    {
        float _2003 = _1881 * _1993;
        _1997 = _2003;
    }
    float _2005 = _1997;
    if (_1893)
    {
        float _2007 = _1883 * _1993;
        _1959 = _2007;
    }
    float _2009 = _1959;
    if (_1893)
    {
        float _2011 = fma(_1955, _1949, _2001);
        _1981 = _2011;
    }
    float _2013 = _1981;
    if (!_1893)
    {
        _1983 = _1885;
    }
    float _2015 = _1983;
    float _2017 = _2015;
    if (_1893)
    {
        float _2019 = _2005 * _2005;
        _2017 = _2019;
    }
    float _2021 = _2017;
    if (_1893)
    {
        float _2023 = _2009 * _2009;
        _1973 = _2023;
    }
    float _2025 = _1973;
    float _2027 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1969);
    float _2029 = fma(_2013, _2013, _2021);
    float _2031 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2033 = fma(_1479, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2035 = _2029 + _2025;
    float _2037 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2031);
    float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2041 = fma(_1877, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2039);
    float _2043 = precise::clamp(_2041, 0.0, 1.0);
    float _2045 = rsqrt(_2035);
    float _2047 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2037);
    float _2049 = -_2043;
    float _2051 = _2049 + 1.0;
    float _2053 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2055 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2057 = floor(_2033);
    float _2059 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2061 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2063 = fma(_1491, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2065 = -_2059;
    float _2067 = fma(_2065, _2055, 1.0);
    float _2069 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2071 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2061);
    float _2073 = _2045 * _2005;
    float _2075 = _2045 * _2009;
    float _2077 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2069);
    float _2079 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2071);
    float _2081 = abs(_2051);
    float _2083 = log2(_2081);
    float _2085 = _2045 * _2013;
    float _2087 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2089 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2077);
    float _2091 = _2079 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2093 = -_2057;
    float _2095 = _2033 + _2093;
    float _2097 = -_2087;
    float _2099 = fma(_2085, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2097);
    float _2101 = _2089 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2103 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2105 = floor(_2063);
    float _2107 = -_2075;
    float _2109 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2099);
    float _2111 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2027);
    float _2113 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2103);
    float _2115 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2117 = fma(_2109, 0.5, 0.5);
    float _2119 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2121 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2113);
    float _2123 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2125 = log2(_2067);
    float _2127 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2129 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2121);
    float _2131 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2115);
    float _2133 = fma(_2117, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2135 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2127);
    float _2137 = exp2(_2123);
    float _2139 = fma(_2109, -0.5, 0.5);
    float _2141 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2135);
    float _2143 = -_2105;
    float _2145 = _2063 + _2143;
    float _2147 = _2085 + 1.0;
    float _2149 = fma(_2117, _2133, -0.212114393711090087890625);
    float _2151 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2141);
    float _2153 = sqrt(_2139);
    float _2155 = fma(_2117, _2149, 1.570728778839111328125);
    float _2157 = _2125 * 0.693147182464599609375;
    float _2159 = 1.0 / _2129;
    float _2161 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2131);
    float _2163 = -_2085;
    float _2165 = fma(_2137, _2147, _2163);
    float _2167 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2161);
    float2 _6128 = float2(_2095, _2145);
    float _2169 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6128, float2(0.0), isnan(_6128)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6128, float2(0.0), isnan(_6128)), level(0.0)).x;
    float _2171 = fma(_2165, 0.5, 0.5);
    float _2173 = _2153 * 0.636619746685028076171875;
    float _2175 = -_2155;
    float _2177 = fma(_2173, _2175, 1.0);
    float _2179 = _2167 * _2159;
    float _2181 = _2151 * _2159;
    float _2183 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2185 = fma(_2179, 0.5, 0.5);
    float _2187 = fma(_2181, -0.5, 0.5);
    float3 _6163 = float3(_2185, _2187, _2183);
    float _2189 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6163, float3(0.0), isnan(_6163)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6163, float3(0.0), isnan(_6163)), level(0.0)).x;
    float3 _6174 = float3(_2185, _2187, _2183);
    float4 _2192 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6174, float3(0.0), isnan(_6174)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6174, float3(0.0), isnan(_6174)), level(0.0)).xyzw;
    float _2194 = _2192.x;
    float _2196 = _2192.y;
    float _2198 = _2192.z;
    float _2200 = _2192.w;
    float2 _6190 = float2(_2177, _2171);
    float3 _2204 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6190, float2(0.0), isnan(_6190)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6190, float2(0.0), isnan(_6190)), level(0.0)).xyz;
    float _2206 = _2204.x;
    float _2208 = _2204.y;
    float _2210 = _2204.z;
    float _2212 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2214 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2216 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2218 = _1587 != 0.0;
    bool _2220 = isnan(_1587);
    bool _2222 = _2218 || _2220;
    bool _2224 = isnan(0.0);
    bool _2226 = _2222 || _2224;
    float _2228 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2212);
    float _2230 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2214);
    float _2232 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2234 = _1585 == 0.0;
    bool _2236 = !_2226;
    bool _2238 = _2234 && _2236;
    float _2240 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2228);
    float _2242 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2230);
    float _2244 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2246 = _2240 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2248 = _2242 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2250 = _1589 == 0.0;
    bool _2252 = _2250 && _2238;
    float _2254 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2256 = 1.0 / _2246;
    float _2258 = _2248 + _2246;
    float _2260 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2262 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2244);
    float _2264 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2216);
    float _2266 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2268 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2270 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2272 = isnan(0.5);
    bool _2274 = _2270 || _2272;
    bool _2276 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2278 = _2274 || _2276;
    float _2280 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2282 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2284 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2266);
    float _2286 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2268);
    float _2288 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2262);
    float _2290 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2282);
    float _2292 = -_1609;
    float _2294 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2232);
    float _2296 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2298 = _2258 * _2256;
    float _2300 = _2298 * 0.5;
    float _2302 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2286);
    float _2304 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2294);
    float _2306 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2296);
    float _2308 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2310 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2308);
    float _2312 = exp2(_2280);
    float _2314 = in.m_77.x;
    float _2316 = in.m_77.y;
    float _2318 = in.m_77.z;
    float _2320 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2306);
    float _2322 = 1.0 / _2310;
    float _2324 = -_2312;
    float _2326 = _2324 + 1.0;
    float _2328 = -_1609;
    float _2330 = fma(_2328, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2254);
    float _2332 = -_1609;
    float _2334 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2260);
    float _2336 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2338 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2290);
    float _2340 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2330);
    float _2342 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2334);
    float _2344 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2346 = _2322 * _2344;
    float _2348 = _2316;
    float _2350 = _2314;
    float _2352 = _2318;
    float _2354 = _2129;
    float _2356 = _2151;
    if (!_2252)
    {
        float _2358 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2316);
        _2348 = _2358;
    }
    float _2360 = _2348;
    float _2362 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2336);
    float _2364 = abs(_2346);
    float _2366 = log2(_2364);
    if (!_2252)
    {
        float _2368 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2314);
        _2350 = _2368;
    }
    float _2370 = _2350;
    float _2372 = _2304 * _2360;
    float _2374 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2362);
    float _2376 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2264);
    float _2378 = _2340 * _2360;
    float _2380 = _2342 * _2360;
    if (!_2252)
    {
        float _2382 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2318);
        _2352 = _2382;
    }
    float _2384 = _2352;
    float _2386 = fma(_2288, _2370, _2372);
    float _2388 = fma(_2338, _2370, _2378);
    float _2390 = fma(_2376, _2370, _2380);
    float _2392 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2394 = fma(_2320, _2384, _2386);
    float _2396 = _2386;
    if (!_2278)
    {
        float _2398 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2400 = _2346 + _2398;
        _2396 = _2400;
    }
    float _2402 = _2396;
    bool _2404 = _2346 <= 8000.0;
    bool _2406 = isnan(_2346);
    bool _2408 = _2404 || _2406;
    bool _2410 = isnan(8000.0);
    bool _2412 = _2408 || _2410;
    float _2414 = float(_2412);
    float _2416 = fma(_2374, _2384, _2388);
    float _2418 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (!_2278)
    {
        _1737 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2420 = _1737;
    float _2422 = exp2(_2418);
    float _2424 = _2420;
    float _2426 = _2167;
    if (!_2278)
    {
        float _2428 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2430 = _2420 + _2428;
        _2424 = _2430;
    }
    float _2432 = _2424;
    bool _2434 = _1877 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2436 = isnan(_1877);
    bool _2438 = _2434 || _2436;
    bool _2440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2442 = _2438 || _2440;
    float _2444 = _2338;
    float _2446 = _2432;
    if (!_2278)
    {
        float _2448 = 1.0 / _2432;
        _2444 = _2448;
    }
    float _2450 = _2444;
    float _2452 = fma(_2422, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2454 = precise::clamp(_2452, 0.0, 1.0);
    float _2456 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2284);
    if (_2278)
    {
        _2446 = 1.0;
    }
    float _2458 = _2446;
    float _2460 = fma(_2454, -2.0, 3.0);
    float _2462 = _2454 * _2454;
    float _2464 = fma(_2456, _2384, _2390);
    float _2466 = _2458;
    if (!_2278)
    {
        float _2468 = _2402 * _2450;
        float _2470 = precise::clamp(_2468, 0.0, 1.0);
        _2466 = _2470;
    }
    float _2472 = _2466;
    float _2474 = _2462 * _2460;
    out.m_79.x = _2394;
    out.m_79.y = _2416;
    out.m_79.z = _2464;
    float _2476 = -_2474;
    float _2478 = _2476 + 1.0;
    float _2480 = fma(_2478, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2474);
    float _2482 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2302);
    float _2484 = in.m_81.x;
    float _2486 = _2414 * _2480;
    float _2488 = _2482 + _2129;
    out.gl_Position.x = _2167;
    out.gl_Position.y = _2151;
    out.gl_Position.z = _2482;
    out.gl_Position.w = _2129;
    float _2490 = _2486 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2492 = _2488 * 0.5;
    out.m_83.z = _2492;
    out.m_83.w = _2129;
    float _2494 = _2482;
    if (!_2442)
    {
        _2354 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2496 = _2354;
    float _2498 = _2496;
    float _2500 = _2496;
    if (!_2442)
    {
        _2356 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2502 = _2356;
    float _2504 = _2502;
    float _2506 = _2502;
    if (!_2442)
    {
        _2494 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2508 = _2494;
    float _2510 = _2508;
    float _2512 = _2508;
    if (!_2442)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2514 = _2426;
    float _2516 = -_2169;
    float _2518 = _2516 + 1.0;
    float _2520 = _2518 * _2490;
    float _2522 = precise::clamp(_2520, 0.0, 1.0);
    float _2524 = -_2522;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2528 = _2526 * _2484;
    float _2530 = _2392 * _2189;
    float _2532 = -_2392;
    float _2534 = _2532 + 1.0;
    float _2536 = _2200 * _2530;
    float _2538 = _2210 * _2530;
    float _2540 = _2200 * _2534;
    float _2542 = fma(_2206, _2536, _2194);
    float _2544 = fma(_2208, _2536, _2196);
    float _2546 = _2528 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2548 = fma(_2200, _2538, _2198);
    float _2550 = _2472 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2552 = _2536;
    float _2554 = _2528;
    float _2556 = _2514;
    float _2558 = _2514;
    if (!_2442)
    {
        _2552 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2560 = _2552;
    out.m_85.x = _2546;
    float _2562 = _2560;
    float _2564 = _2560;
    if (!_2442)
    {
        _2554 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2566 = _2554;
    out.m_87.x = _2542;
    out.m_87.y = _2544;
    out.m_87.z = _2548;
    out.m_87.w = _2540;
    bool _2568 = !_2442;
    float _2570 = _2566;
    float _2572 = _2566;
    if (!_2568)
    {
        bool _2574 = _1877 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2576 = isnan(_1877);
        bool _2578 = _2574 || _2576;
        bool _2580 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2582 = _2578 || _2580;
        if (!_2582)
        {
            float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2586 = _1877 + _2584;
            float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2590 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2588;
            float _2592 = 1.0 / _2590;
            float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2610 = _2586 * _2592;
            float _2612 = precise::clamp(_2610, 0.0, 1.0);
            float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2622 = fma(_2612, _2596, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2624 = fma(_2612, _2616, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2626 = fma(_2612, _2620, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2628 = fma(_2612, _2600, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2630 = fma(_2612, _2604, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2632 = fma(_2612, _2608, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2506 = _2626;
            _2564 = _2630;
            _2500 = _2624;
            _2558 = _2628;
            _2512 = _2622;
            _2572 = _2632;
            _2634 = true;
        }
        else
        {
            bool _2636 = _1877 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2638 = isnan(_1877);
            bool _2640 = _2636 || _2638;
            bool _2642 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2644 = _2640 || _2642;
            if (!_2644)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2646 = _2498;
            _2500 = _2646;
            if (!_2644)
            {
                _2504 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2648 = _2504;
            _2506 = _2648;
            if (!_2644)
            {
                _2510 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2650 = _2510;
            _2512 = _2650;
            if (!_2644)
            {
                _2556 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2652 = _2556;
            _2558 = _2652;
            if (!_2644)
            {
                _2562 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2654 = _2562;
            _2564 = _2654;
            if (!_2644)
            {
                _2570 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2656 = _2570;
            bool _2658 = !_2644;
            _2572 = _2656;
            if (!_2658)
            {
                bool _2660 = _1877 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2662 = isnan(_1877);
                bool _2664 = _2660 || _2662;
                bool _2666 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2668 = _2664 || _2666;
                if (!_2668)
                {
                    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2672 = _1877 + _2670;
                    float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2676 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2674;
                    float _2678 = 1.0 / _2676;
                    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2694 = _2692 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2696 = _2672 * _2678;
                    float _2698 = precise::clamp(_2696, 0.0, 1.0);
                    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2708 = fma(_2698, _2682, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2710 = fma(_2698, _2702, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2712 = fma(_2698, _2706, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2714 = fma(_2698, _2686, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2716 = fma(_2698, _2690, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2718 = fma(_2698, _2694, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2506 = _2712;
                    _2564 = _2716;
                    _2500 = _2710;
                    _2558 = _2714;
                    _2512 = _2708;
                    _2572 = _2718;
                    _2634 = true;
                }
                else
                {
                    _2506 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2564 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2558 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2512 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2572 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2634 = false;
    float _2720 = _2506;
    float _2722 = _2564;
    float _2724 = _2500;
    float _2726 = _2558;
    float _2728 = _2512;
    float _2730 = _2572;
    float _2732 = _2550 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2734 = fma(_2416, -0.5, 0.5);
    float _2736 = precise::clamp(_2734, 0.0, 1.0);
    float _2738 = -_2720;
    float _2740 = _2738 + _2722;
    float _2742 = -_2724;
    float _2744 = _2742 + _2726;
    out.m_53.x = _2732;
    float _2746 = fma(_2736, _2740, _2720);
    float _2748 = -_2728;
    float _2750 = _2748 + _2730;
    float _2752 = fma(_2736, _2744, _2724);
    float _2754 = _2746 * 0.586610972881317138671875;
    bool _2756 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2758 = fma(_2736, _2750, _2728);
    out.m_89.x = 0.0;
    float _2760 = fma(_2752, 0.298911988735198974609375, _2754);
    bool _2762 = _2472 > 0.0;
    bool _2764 = isnan(_2472);
    bool _2766 = _2762 || _2764;
    bool _2768 = isnan(0.0);
    bool _2770 = _2766 || _2768;
    float _2772 = fma(_2758, 0.114477999508380889892578125, _2760);
    float _2774 = -_2772;
    float _2776 = _2752 + _2774;
    float _2778 = -_2772;
    float _2780 = _2746 + _2778;
    float _2782 = -_2772;
    float _2784 = _2758 + _2782;
    float _2786 = fma(_2776, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2772);
    float _2788 = fma(_2780, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2772);
    float _2790 = fma(_2784, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2772);
    bool _2792 = !_2756;
    if (!_2792)
    {
        float _2794 = -_1849;
        float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2798 = -_1851;
        float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2802 = -_1853;
        float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2806 = _2796 * _2796;
        float _2808 = fma(_2800, _2800, _2806);
        float _2810 = fma(_2804, _2804, _2808);
        float _2812 = sqrt(_2810);
        float _2814 = rsqrt(_2810);
        float _2816 = -_2812;
        float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2820 = _2818 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2822 = precise::clamp(_2820, 0.0, 1.0);
        float _2824 = _2800 * _2814;
        float _2826 = _2796 * _2814;
        float _2828 = abs(_2822);
        float _2830 = log2(_2828);
        float _2832 = _2804 * _2814;
        float _2834 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2836 = _2416 * _2826;
        float _2838 = -_2826;
        float _2840 = -_2834;
        float _2842 = fma(_2838, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2840);
        float _2844 = fma(_2394, _2824, _2836);
        float _2846 = -_2832;
        float _2848 = fma(_2846, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2842);
        float _2850 = fma(_2464, _2832, _2844);
        float _2852 = precise::clamp(_2850, 0.0, 1.0);
        float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2856 = _2848 + _2854;
        float _2858 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2860 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2862 = precise::clamp(_2860, 0.0, 1.0);
        float _2864 = exp2(_2858);
        float _2866 = _2864 * _2862;
        float _2868 = _2852 * _2866;
        float _2870 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2872 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2874 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2870;
        out.m_89.y = _2872;
        out.m_89.z = _2874;
    }
    out.m_91.x = _2786;
    out.m_91.y = _2788;
    out.m_91.z = _2790;
    if (_2770)
    {
        return out;
    }
    float _2876 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2876;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2634 = false;
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
        float _2945 = as_type<float>(_134);
        out.gl_Position.z = _2945;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3000 = as_type<float>(_160);
        out.gl_Position.z = _3000;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _771 = as_type<float>(_520) * _769;
    bool _773 = _685 > 0.5;
    bool _775 = _773 && _633;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _781 = _735 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _783 = _735 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _785 = _735 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _791 = _743 * _116;
    float _793 = trunc(_771);
    float _795 = precise::max(_793, 0.0);
    uint _797 = uint(_795);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _803 = _537 * 2.0;
    float _805 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = fma(_733, (*spvDescriptorSet0.vp_c10)._m0[4].x, _781);
    float _809 = _801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = fma(_733, (*spvDescriptorSet0.vp_c10)._m0[6].x, _785);
    float _813 = 1.0 / _779;
    bool _815 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _817 = isnan(0.0);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _823 = _819 || _821;
    bool _825 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _827 = isnan(1.0);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _833 = _829 || _831;
    float _835 = exp2(_791);
    float _837 = _787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _839 = fma(_733, (*spvDescriptorSet0.vp_c10)._m0[5].x, _783);
    float _841 = _539 + _537;
    float _843 = in.m_55.z;
    float _845 = _841 + (-1.0);
    float _847 = floor(_803);
    out.m_65.x = _809;
    out.m_65.y = _837;
    out.m_65.z = _805;
    out.m_65.w = _799;
    float _849 = _597 * _813;
    float _851 = in.m_61.x;
    float _853 = -_835;
    float _855 = _853 + 1.0;
    float _857 = _823 ? _855 : 0.0;
    int _859 = _512 * int(_797);
    int _861 = _859 + _761;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _865 = 1.0 + _863;
    bool _867 = _847 > 0.0;
    float _869 = 1.0 / _865;
    float _871 = float(uint(_861));
    float _873 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _875 = _847 >= 0.0;
    bool _877 = isnan(_847);
    bool _879 = _875 || _877;
    bool _881 = isnan(0.0);
    bool _883 = _879 || _881;
    float _885 = _539 * 2.0;
    float _887 = _539 + _843;
    float _889 = as_type<float>(_520) * _871;
    float _891 = trunc(_889);
    float _893 = precise::max(_891, 0.0);
    uint _895 = uint(_893);
    float _897 = _887 + (-1.0);
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _901 = 0.0;
    float _903 = _851;
    float _905 = _873;
    if (_633)
    {
        _901 = _851;
    }
    float _907 = _901;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _911 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[78].z, _899);
    float _913 = floor(_885);
    int _915 = ~_484;
    int _917 = _915 + 1;
    float _919 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[78].w, _909);
    float _921 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _911);
    float _923 = _907;
    if (_775)
    {
        float _925 = -_907;
        float _927 = _925 + 1.0;
        _923 = _927;
    }
    float _929 = _923;
    float _931 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _919);
    if (_833)
    {
        float _933 = _857 * _869;
        _126 = _933;
    }
    float _935 = _126;
    int _937 = int(_797) + int(_895);
    float _939 = _843 * 2.0;
    int _941 = _883 ? 0 : 1;
    float _943 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_633)
    {
        _903 = _929;
    }
    float _945 = _903;
    int _947 = _917 * _937;
    int _949 = _947 + _761;
    bool _951 = _913 > 0.0;
    bool _953 = _913 >= 0.0;
    bool _955 = isnan(_913);
    bool _957 = _953 || _955;
    bool _959 = isnan(0.0);
    bool _961 = _957 || _959;
    float _963 = floor(_939);
    bool _965 = uint(_949) >= uint(_484);
    int _967 = _961 ? 0 : 1;
    bool _969 = !_965;
    int _971 = _969 ? 0 : (-1);
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _975 = _973 != 0;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _979 = _977 != 0;
    int _981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _983 = _981 != 0;
    bool _985 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _987 = isnan(_472);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    int _997 = ~_937;
    int _999 = _997 + _971;
    int _1001 = _999 + 1;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1005 = _472 + _1003;
    int _1007 = ~_941;
    int _1009 = _1007 + 1;
    int _1011 = _1009 + 1;
    float _1013 = -_995;
    float _1015 = _1013 + 1.0;
    bool _1017 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1019 = isnan(_472);
    bool _1021 = _1017 || _1019;
    bool _1023 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1025 = _1021 || _1023;
    float _1027 = float(_1025);
    float _1029 = fma(_849, _1005, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1031 = _1011;
    if (!_867)
    {
        int _1033 = ~_941;
        int _1035 = _1033 + 1;
        _1031 = _1035;
    }
    int _1037 = _1031;
    bool _1039 = _963 > 0.0;
    float _1041 = _1027 * _1015;
    bool _1043 = _963 >= 0.0;
    bool _1045 = isnan(_963);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.0);
    bool _1051 = _1047 || _1049;
    int _1053 = _484 * _1001;
    int _1055 = _1053 + _761;
    float _1057 = float(uint(_727));
    float _1059 = _1029 * _1041;
    float _1061 = -_1027;
    float _1063 = _1061 + 1.0;
    bool _1065 = !_615;
    int _1067 = _1065 ? _1055 : (-1);
    float _1069 = as_type<float>(_520) * _1057;
    float _1071 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[4].z, _807);
    int _1073 = ~_967;
    int _1075 = _1073 + 1;
    int _1077 = _1075 + 1;
    float _1079 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[6].z, _811);
    int _1081 = _1067 >> 31;
    float _1083 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1059);
    int _1085 = _1077;
    if (!_951)
    {
        int _1087 = ~_967;
        int _1089 = _1087 + 1;
        _1085 = _1089;
    }
    int _1091 = _1085;
    float _1093 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    int _1095 = _1081 & 3;
    float _1097 = fma(_737, (*spvDescriptorSet0.vp_c10)._m0[5].z, _839);
    float _1099 = trunc(_1069);
    float _1101 = precise::max(_1099, 0.0);
    uint _1103 = uint(_1101);
    bool _1105 = !_979;
    int _1107 = _1105 ? 0 : 1;
    float _1109 = -_767;
    float _1111 = fma(_931, _1093, _1109);
    int _1113 = _1067 + _1095;
    float _1115 = fma(_945, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1117 = abs(_1107);
    float _1119 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1083);
    int _1121 = _1113 >> 2;
    float _1123 = fma(_921, _1115, _593);
    int _1125 = ~_484;
    int _1127 = _1125 + 1;
    float _1129 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1131 = _1121 << 4;
    int _1133 = _1131 + 368;
    float _1135 = _1119 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1137 = _1129 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1139 = float(_1037);
    int _1141 = _1127 * int(_1103);
    int _1143 = _1141 + _727;
    uint _1145 = uint(int(uint(_1133) >> uint(2)));
    uint _1147 = uint(int(uint(int(_1145)) >> uint(2)));
    int _1149 = int(_1145) & 3;
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[int(_1147)][_1149];
    int _1153 = int(_1145) + 1;
    uint _1155 = uint(int(uint(_1153) >> uint(2)));
    int _1157 = _1153 & 3;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[int(_1155)][_1157];
    int _1161 = _1051 ? 0 : 1;
    float _1163 = _1111 + 0.5;
    float _1165 = float(_1117);
    float _1167 = _1071 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1169 = ~_1161;
    int _1171 = _1169 + 1;
    int _1173 = _1171 + 1;
    float _1175 = _1079 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1177 = _1173;
    if (!_1039)
    {
        int _1179 = ~_1161;
        int _1181 = _1179 + 1;
        _1177 = _1181;
    }
    int _1183 = _1177;
    float _1185 = _1165 * _1139;
    float _1187 = float(uint(_1143));
    float _1189 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1191 = !_975;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = _1185 * (-2.0);
    int _1197 = _1067 & 3;
    bool _1199 = _1197 != 0;
    float _1201 = as_type<float>(_520) * _1187;
    int _1203 = _1067 & 3;
    bool _1205 = _1203 != 0;
    float _1207 = _1189 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1209 = abs(_1193);
    float _1211 = trunc(_1201);
    float _1213 = precise::max(_1211, 0.0);
    uint _1215 = uint(_1213);
    bool _1217 = uint(_1203) > 1u;
    float _1219 = _448 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1221 = float(_1209);
    int _1223 = _1133 + 8;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    uint _1227 = uint(int(uint(int(_1225)) >> uint(2)));
    int _1229 = int(_1225) & 3;
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[int(_1227)][_1229];
    int _1233 = int(_1225) + 1;
    uint _1235 = uint(int(uint(_1233) >> uint(2)));
    int _1237 = _1233 & 3;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[int(_1235)][_1237];
    float _1241 = float(_1183);
    float _1243 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1245 = _1199 ? 0 : 1;
    int _1247 = ~_484;
    int _1249 = _1247 + 1;
    float _1251 = _1221 * _1241;
    int _1253 = ~_1245;
    int _1255 = _1253 + 1;
    int _1257 = _1255 + 1;
    out.m_67.x = _1137;
    out.m_67.y = _1207;
    out.m_67.z = _1243;
    out.m_67.w = _1135;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1261 = _1259 != 0;
    float _1263 = _1097 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1265 = _1257;
    if (!_1217)
    {
        int _1267 = ~_1245;
        int _1269 = _1267 + 1;
        _1265 = _1269;
    }
    int _1271 = _1265;
    float _1273 = _1251 * (-2.0);
    int _1275 = int(_1103) + int(_1215);
    float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1279 = _1263 + _1277;
    bool _1281 = !_1205;
    int _1283 = _1281 ? 0 : 1;
    int _1285 = abs(_1271);
    int _1287 = abs(_1283);
    int _1289 = _1249 * _1275;
    int _1291 = _1289 + _727;
    bool _1293 = _1203 != 3;
    float _1295 = _1123 + 0.5;
    int _1297 = ~_1285;
    int _1299 = _1297 + 1;
    int _1301 = _1299 + 1;
    bool _1303 = uint(_1203) >= 2u;
    int _1305 = _1301 * as_type<int>(_1159);
    int _1307 = _1303 ? 0 : 1;
    out.m_69.x = _1295;
    out.m_69.y = _1163;
    int _1309 = ~_1287;
    int _1311 = _1309 + 1;
    int _1313 = _1311 + 1;
    float _1315 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1317 = ~_1307;
    int _1319 = _1317 + 1;
    int _1321 = _1319 + 1;
    bool _1323 = _1203 != 3;
    int _1325 = _1313 * as_type<int>(_1151);
    int _1327 = _1325 + _1305;
    int _1329 = _1321;
    if (_1293)
    {
        int _1331 = ~_1307;
        int _1333 = _1331 + 1;
        _1329 = _1333;
    }
    int _1335 = _1329;
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1339 = _1167 + _1337;
    float _1341 = in.m_71.x;
    float _1343 = in.m_71.y;
    float _1345 = in.m_71.z;
    bool _1347 = uint(_1291) >= uint(_484);
    bool _1349 = !_1323;
    int _1351 = _1349 ? 0 : (-1);
    int _1353 = abs(_1335);
    float _1355 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1357 = _1175 + _1355;
    bool _1359 = !_1347;
    int _1361 = _1359 ? 0 : (-1);
    int _1363 = abs(_1351);
    float _1365 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1315);
    bool _1367 = !_1261;
    int _1369 = _1367 ? 0 : 1;
    int _1371 = ~_1275;
    int _1373 = _1371 + _1361;
    int _1375 = _1373 + 1;
    float _1377 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1365);
    int _1379 = ~_1353;
    int _1381 = _1379 + 1;
    int _1383 = _1381 + 1;
    int _1385 = abs(_1369);
    int _1387 = _484 * _1375;
    int _1389 = _1387 + _727;
    float _1391 = _1279 * _1279;
    int _1393 = _1383 * as_type<int>(_1231);
    int _1395 = _1393 + _1327;
    int _1397 = ~_1363;
    int _1399 = _1397 + 1;
    int _1401 = _1399 + 1;
    float _1403 = fma(_1273, _1341, _1341);
    bool _1405 = _1377 >= 0.0;
    float _1407 = fma(_1339, _1339, _1391);
    int _1409 = _1401 * as_type<int>(_1239);
    int _1411 = _1409 + _1395;
    bool _1413 = !_615;
    int _1415 = _1413 ? _1389 : (-1);
    float _1417 = fma(_1357, _1357, _1407);
    int _1419 = ~_1385;
    int _1421 = _1419 + 1;
    int _1423 = _1421 + 1;
    float _1425 = fma(_873, _1273, _873);
    float _1427 = _537 + (-0.5);
    float _1429 = rsqrt(_1417);
    float _1431 = fma(_943, _1195, _943);
    int _1433 = _1411 * _1423;
    float _1435 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1403);
    if (_1405)
    {
        _905 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1437 = _905;
    int _1439 = _1415 * _1385;
    int _1441 = _1439 + _1433;
    bool _1443 = !_983;
    int _1445 = _1443 ? 0 : 1;
    int _1447 = as_type<int>(_1437);
    if (_1405)
    {
        out.m_53.x = 0.0;
    }
    if (_1405)
    {
        float _1449 = _1437 * 5.0;
        _1447 = as_type<int>(_1449);
    }
    int _1451 = _1447;
    float _1453 = fma(_1425, _935, _1435);
    float _1455 = float(_1441);
    float _1457 = fma(_1195, _1343, _1343);
    float _1459 = float(_1091);
    if (_1405)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4958 = as_type<float>(_1451);
        out.gl_Position.z = _4958;
    }
    int _1461 = abs(_1445);
    float _1463 = _539 + (-0.5);
    float _1465 = _1279 * _1429;
    out.m_73.x = _1455;
    float _1467 = _1339 * _1429;
    float _1469 = _1465;
    if (_1405)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1471 = -_1465;
    float _1473 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1263);
    float _1475 = _1357 * _1429;
    float _1477 = -_1467;
    float _1479 = fma(_1477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1167);
    float _1481 = float(_1461);
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1485 = _1473 + _1483;
    float _1487 = _1453 * 0.15915493667125701904296875;
    float _1489 = -_1475;
    float _1491 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1175);
    float _1493 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1495 = _1479 + _1493;
    float _1497 = _1485 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1499 = _843 + _537;
    float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1503 = _1491 + _1501;
    float _1505 = _1481 * _1459;
    float _1507 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1497);
    float _1509 = _1499 + (-1.0);
    float _1511 = -_1465;
    float _1513 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1279);
    float _1515 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1507);
    float _1517 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1457);
    float _1519 = _1505 * (-2.0);
    float _1521 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1523 = -_1467;
    float _1525 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1339);
    bool _1527 = _1515 >= 0.0;
    float _1529 = _1513 * _1513;
    float _1531 = fma(_1519, _1345, _1345);
    float _1533 = _843 + (-0.5);
    float _1535 = fma(_1431, _935, _1517);
    float _1537 = fma(_1525, _1525, _1529);
    float _1539 = -_1475;
    float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1357);
    float _1543 = fma(_1521, _1519, _1521);
    float _1545 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1531);
    float _1547 = _1535 * 0.15915493667125701904296875;
    float _1549 = fma(_1541, _1541, _1537);
    float _1551 = _1487 * 6.283185482025146484375;
    float _1553 = sin(_1551);
    float _1555 = fma(_1543, _935, _1545);
    float _1557 = _1531;
    float _1559 = _1475;
    if (_1527)
    {
        _1557 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1561 = _1557;
    int _1563 = as_type<int>(_1561);
    if (_1527)
    {
        out.m_53.x = 0.0;
    }
    float _1565 = _1555 * 0.15915493667125701904296875;
    if (_1527)
    {
        float _1567 = _1561 * 5.0;
        _1563 = as_type<int>(_1567);
    }
    int _1569 = _1563;
    float _1571 = _1487 * 6.283185482025146484375;
    float _1573 = cos(_1571);
    if (_1527)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5157 = as_type<float>(_1569);
        out.gl_Position.z = _5157;
    }
    float _1575 = _1547 * 6.283185482025146484375;
    float _1577 = sin(_1575);
    float _1579 = _1547 * 6.283185482025146484375;
    float _1581 = cos(_1579);
    float _1583 = sqrt(_1549);
    if (_1527)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1585 = in.m_75.x;
    float _1587 = in.m_75.y;
    float _1589 = in.m_75.z;
    float _1591 = _1565 * 6.283185482025146484375;
    float _1593 = cos(_1591);
    float _1595 = _1429 * _1583;
    float _1597 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1599 = _1553 * _1577;
    float _1601 = _1553 * _1581;
    float _1603 = _1573 * _1581;
    float _1605 = _1573 * _1577;
    float _1607 = _1565 * 6.283185482025146484375;
    float _1609 = sin(_1607);
    bool _1611 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1613 = isnan(0.5);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1619 = _1615 || _1617;
    float _1621 = _1573 * _1593;
    float _1623 = _1581 * _1593;
    float _1625 = _1553 * _1593;
    float _1627 = _1577 * _1593;
    float _1629 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1631 = _1595 * _1597;
    float _1633 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1587);
    float _1637 = _1595 * _1629;
    float _1639 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1585);
    float _1641 = _1595 * _1633;
    float _1643 = _1635 * _1631;
    float _1645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1589);
    float _1647 = _1639 * _1637;
    float _1649 = fma(_1609, _1603, _1599);
    float _1651 = _1621 * _1643;
    float _1653 = _1645 * _1641;
    float _1655 = -_1601;
    float _1657 = fma(_1609, _1605, _1655);
    float _1659 = -_1643;
    float _1661 = _1609 * _1659;
    float _1663 = fma(_1649, _1647, _1651);
    float _1665 = -_1605;
    float _1667 = fma(_1609, _1601, _1665);
    float _1669 = _1625 * _1643;
    float _1671 = fma(_1623, _1647, _1661);
    float _1673 = fma(_1657, _1653, _1663);
    float _1675 = fma(_1609, _1599, _1603);
    float _1677 = fma(_1667, _1647, _1669);
    float _1679 = fma(_1627, _1653, _1671);
    float _1681 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1683 = fma(_1675, _1653, _1677);
    float _1685 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1687 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1681);
    float _1689 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1685);
    float _1691 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1687);
    float _1693 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1689);
    float _1695 = _1691 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1697 = _1693 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1699 = _1175 + _1695;
    float _1701 = _1167 + _1697;
    float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1705 = _1699 + _1703;
    float _1707 = _1673 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1711 = _1701 + _1709;
    float _1713 = _1705 * _1705;
    float _1715 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1707);
    float _1717 = fma(_1711, _1711, _1713);
    float _1719 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1715);
    float _1721 = sqrt(_1717);
    float _1723 = _1719 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1725 = _1263 + _1723;
    bool _1727 = _1721 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1729 = _1679;
    float _1731 = _1701;
    float _1733 = _1699;
    float _1735 = _1725;
    float _1737 = _1585;
    if (!_1727)
    {
        _1729 = _1725;
    }
    float _1739 = _1729;
    bool _1741 = !_1727;
    float _1743 = _1739;
    if (!_1741)
    {
        float _1745 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1747 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1749 = _1721 + _1747;
        float _1751 = rsqrt(_1717);
        float _1753 = _1749 * _1745;
        float _1755 = _1725 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1757 = _1753 * 0.15915493667125701904296875;
        float _1759 = _1757 * 6.283185482025146484375;
        float _1761 = sin(_1759);
        float _1763 = _1757 * 6.283185482025146484375;
        float _1765 = cos(_1763);
        float _1767 = fma(_1761, _1755, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1769 = _1751 * _1767;
        float _1771 = _1765 + (-1.0);
        float _1773 = fma(_1711, _1769, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1775 = fma(_1705, _1769, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1777 = _1771 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1779 = fma(_1725, _1765, _1777);
        _1731 = _1773;
        _1743 = _1779;
        _1733 = _1775;
    }
    float _1781 = _1731;
    float _1783 = _1743;
    float _1785 = _1733;
    float _1787 = -_1467;
    float _1789 = fma(_1787, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1781);
    float _1791 = -_1465;
    float _1793 = fma(_1791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1783);
    float _1795 = -_1475;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1785);
    float _1799 = _1793;
    float _1801 = _1789;
    float _1803 = _1797;
    if (!_1619)
    {
        float _1805 = _1485 * _1485;
        float _1807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1809 = -_1175;
        float _1811 = _1809 + _1785;
        float _1813 = -_1167;
        float _1815 = _1813 + _1781;
        float _1817 = fma(_1495, _1495, _1805);
        float _1819 = -_1263;
        float _1821 = _1819 + _1783;
        float _1823 = fma(_1503, _1503, _1817);
        float _1825 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1827 = sqrt(_1823);
        float _1829 = 1.0 / _1595;
        float _1831 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1833 = precise::min(_1827, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1835 = _1833 * _1807;
        float _1837 = _1835 * _1829;
        float _1839 = _1831 * _1837;
        float _1841 = _1811 * _1837;
        float _1843 = fma(_1815, _1839, _1479);
        float _1845 = fma(_1821, _1839, _1473);
        float _1847 = fma(_1831, _1841, _1491);
        _1799 = _1845;
        _1801 = _1843;
        _1803 = _1847;
        _1469 = _1807;
    }
    float _1849 = _1799;
    float _1851 = _1801;
    float _1853 = _1803;
    float _1855 = _1469;
    float _1857 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1859 = _1849 + _1857;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1863 = _1851 + _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1867 = _1853 + _1865;
    float _1869 = _1859 * _1859;
    float _1871 = fma(_1863, _1863, _1869);
    float _1873 = fma(_1867, _1867, _1871);
    float _1875 = rsqrt(_1873);
    float _1877 = sqrt(_1873);
    float _1879 = _1875 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1881 = _1863 * _1879;
    float _1883 = _1867 * _1879;
    float _1885 = _1881 * _1881;
    float _1887 = _1883 * _1883;
    float _1889 = _1885 + _1887;
    float _1891 = sqrt(_1889);
    bool _1893 = _1891 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1897 = _1891 + _1895;
    float _1899 = _1867;
    float _1901 = _1897;
    float _1903 = _1855;
    float _1905 = _1859;
    if (_1893)
    {
        float _1907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1899 = _1907;
    }
    float _1909 = _1899;
    if (_1893)
    {
        float _1911 = rsqrt(_1889);
        _1559 = _1911;
    }
    float _1913 = _1559;
    float _1915 = _1913;
    if (_1893)
    {
        float _1917 = _1897 * _1909;
        _1901 = _1917;
    }
    float _1919 = _1901;
    if (_1893)
    {
        float _1921 = _1919 * 0.15915493667125701904296875;
        _1903 = _1921;
    }
    float _1923 = _1903;
    float _1925 = _1875;
    float _1927 = _1923;
    if (_1893)
    {
        float _1929 = _1923 * 6.283185482025146484375;
        float _1931 = sin(_1929);
        _1925 = _1931;
    }
    float _1933 = _1925;
    float _1935 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1937 = precise::max(0.0, _1935);
    float _1939 = _1869;
    float _1941 = _1937;
    float _1943 = _1935;
    if (_1893)
    {
        float _1945 = _1923 * 6.283185482025146484375;
        float _1947 = cos(_1945);
        _1939 = _1947;
    }
    float _1949 = _1939;
    float _1951 = -_1879;
    float _1953 = -_1937;
    float _1955 = fma(_1859, _1951, _1953);
    if (!_1893)
    {
        _1905 = _1883;
    }
    float _1957 = _1905;
    float _1959 = _1957;
    if (_1893)
    {
        float _1961 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1941 = _1961;
    }
    float _1963 = _1941;
    float _1965 = _1963;
    if (!_1893)
    {
        _1927 = _1887;
    }
    float _1967 = _1927;
    float _1969 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1971 = _1933;
    float _1973 = _1967;
    if (_1893)
    {
        float _1975 = fma(_1933, _1963, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1965 = _1975;
    }
    float _1977 = _1965;
    if (!_1893)
    {
        _1971 = _1955;
    }
    float _1979 = _1971;
    float _1981 = _1979;
    float _1983 = _1949;
    if (_1893)
    {
        float _1985 = _1949 + (-1.0);
        _1943 = _1985;
    }
    float _1987 = _1943;
    float _1989 = _1987;
    if (_1893)
    {
        float _1991 = _1913 * _1977;
        _1735 = _1991;
    }
    float _1993 = _1735;
    if (!_1893)
    {
        _1915 = _1881;
    }
    float _1995 = _1915;
    float _1997 = _1995;
    if (_1893)
    {
        float _1999 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1989 = _1999;
    }
    float _2001 = _1989;
    if (_1893)
    {
        float _2003 = _1881 * _1993;
        _1997 = _2003;
    }
    float _2005 = _1997;
    if (_1893)
    {
        float _2007 = _1883 * _1993;
        _1959 = _2007;
    }
    float _2009 = _1959;
    if (_1893)
    {
        float _2011 = fma(_1955, _1949, _2001);
        _1981 = _2011;
    }
    float _2013 = _1981;
    if (!_1893)
    {
        _1983 = _1885;
    }
    float _2015 = _1983;
    float _2017 = _2015;
    if (_1893)
    {
        float _2019 = _2005 * _2005;
        _2017 = _2019;
    }
    float _2021 = _2017;
    if (_1893)
    {
        float _2023 = _2009 * _2009;
        _1973 = _2023;
    }
    float _2025 = _1973;
    float _2027 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1969);
    float _2029 = fma(_2013, _2013, _2021);
    float _2031 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2033 = fma(_1479, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2035 = _2029 + _2025;
    float _2037 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2031);
    float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2041 = fma(_1877, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2039);
    float _2043 = precise::clamp(_2041, 0.0, 1.0);
    float _2045 = rsqrt(_2035);
    float _2047 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2037);
    float _2049 = -_2043;
    float _2051 = _2049 + 1.0;
    float _2053 = _2047 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2055 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2057 = floor(_2033);
    float _2059 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2061 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2063 = fma(_1491, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2065 = -_2059;
    float _2067 = fma(_2065, _2055, 1.0);
    float _2069 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2071 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2061);
    float _2073 = _2045 * _2005;
    float _2075 = _2045 * _2009;
    float _2077 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2069);
    float _2079 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2071);
    float _2081 = abs(_2051);
    float _2083 = log2(_2081);
    float _2085 = _2045 * _2013;
    float _2087 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2089 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2077);
    float _2091 = _2079 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2093 = -_2057;
    float _2095 = _2033 + _2093;
    float _2097 = -_2087;
    float _2099 = fma(_2085, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2097);
    float _2101 = _2089 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2103 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2105 = floor(_2063);
    float _2107 = -_2075;
    float _2109 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2099);
    float _2111 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2027);
    float _2113 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2103);
    float _2115 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2117 = fma(_2109, 0.5, 0.5);
    float _2119 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2121 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2113);
    float _2123 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2125 = log2(_2067);
    float _2127 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2129 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2121);
    float _2131 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2115);
    float _2133 = fma(_2117, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2135 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2127);
    float _2137 = exp2(_2123);
    float _2139 = fma(_2109, -0.5, 0.5);
    float _2141 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2135);
    float _2143 = -_2105;
    float _2145 = _2063 + _2143;
    float _2147 = _2085 + 1.0;
    float _2149 = fma(_2117, _2133, -0.212114393711090087890625);
    float _2151 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2141);
    float _2153 = sqrt(_2139);
    float _2155 = fma(_2117, _2149, 1.570728778839111328125);
    float _2157 = _2125 * 0.693147182464599609375;
    float _2159 = 1.0 / _2129;
    float _2161 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2131);
    float _2163 = -_2085;
    float _2165 = fma(_2137, _2147, _2163);
    float _2167 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2161);
    float2 _6128 = float2(_2095, _2145);
    float _2169 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6128, float2(0.0), isnan(_6128)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6128, float2(0.0), isnan(_6128)), level(0.0)).x;
    float _2171 = fma(_2165, 0.5, 0.5);
    float _2173 = _2153 * 0.636619746685028076171875;
    float _2175 = -_2155;
    float _2177 = fma(_2173, _2175, 1.0);
    float _2179 = _2167 * _2159;
    float _2181 = _2151 * _2159;
    float _2183 = _2157 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2185 = fma(_2179, 0.5, 0.5);
    float _2187 = fma(_2181, -0.5, 0.5);
    float3 _6163 = float3(_2185, _2187, _2183);
    float _2189 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6163, float3(0.0), isnan(_6163)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6163, float3(0.0), isnan(_6163)), level(0.0)).x;
    float3 _6174 = float3(_2185, _2187, _2183);
    float4 _2192 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6174, float3(0.0), isnan(_6174)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6174, float3(0.0), isnan(_6174)), level(0.0)).xyzw;
    float _2194 = _2192.x;
    float _2196 = _2192.y;
    float _2198 = _2192.z;
    float _2200 = _2192.w;
    float2 _6190 = float2(_2177, _2171);
    float3 _2204 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6190, float2(0.0), isnan(_6190)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6190, float2(0.0), isnan(_6190)), level(0.0)).xyz;
    float _2206 = _2204.x;
    float _2208 = _2204.y;
    float _2210 = _2204.z;
    float _2212 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2214 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2216 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2218 = _1587 != 0.0;
    bool _2220 = isnan(_1587);
    bool _2222 = _2218 || _2220;
    bool _2224 = isnan(0.0);
    bool _2226 = _2222 || _2224;
    float _2228 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2212);
    float _2230 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2214);
    float _2232 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2234 = _1585 == 0.0;
    bool _2236 = !_2226;
    bool _2238 = _2234 && _2236;
    float _2240 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2228);
    float _2242 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2230);
    float _2244 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2246 = _2240 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2248 = _2242 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2250 = _1589 == 0.0;
    bool _2252 = _2250 && _2238;
    float _2254 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2256 = 1.0 / _2246;
    float _2258 = _2248 + _2246;
    float _2260 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2262 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2244);
    float _2264 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2216);
    float _2266 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2268 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2270 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2272 = isnan(0.5);
    bool _2274 = _2270 || _2272;
    bool _2276 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2278 = _2274 || _2276;
    float _2280 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2282 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2284 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2266);
    float _2286 = fma(_2101, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2268);
    float _2288 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2262);
    float _2290 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2282);
    float _2292 = -_1609;
    float _2294 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2232);
    float _2296 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2298 = _2258 * _2256;
    float _2300 = _2298 * 0.5;
    float _2302 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2286);
    float _2304 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2294);
    float _2306 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2296);
    float _2308 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2310 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2308);
    float _2312 = exp2(_2280);
    float _2314 = in.m_77.x;
    float _2316 = in.m_77.y;
    float _2318 = in.m_77.z;
    float _2320 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2306);
    float _2322 = 1.0 / _2310;
    float _2324 = -_2312;
    float _2326 = _2324 + 1.0;
    float _2328 = -_1609;
    float _2330 = fma(_2328, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2254);
    float _2332 = -_1609;
    float _2334 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2260);
    float _2336 = _1657 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2338 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2290);
    float _2340 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2330);
    float _2342 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2334);
    float _2344 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2346 = _2322 * _2344;
    float _2348 = _2316;
    float _2350 = _2314;
    float _2352 = _2318;
    float _2354 = _2129;
    float _2356 = _2151;
    if (!_2252)
    {
        float _2358 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2316);
        _2348 = _2358;
    }
    float _2360 = _2348;
    float _2362 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2336);
    float _2364 = abs(_2346);
    float _2366 = log2(_2364);
    if (!_2252)
    {
        float _2368 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2314);
        _2350 = _2368;
    }
    float _2370 = _2350;
    float _2372 = _2304 * _2360;
    float _2374 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2362);
    float _2376 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2264);
    float _2378 = _2340 * _2360;
    float _2380 = _2342 * _2360;
    if (!_2252)
    {
        float _2382 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2318);
        _2352 = _2382;
    }
    float _2384 = _2352;
    float _2386 = fma(_2288, _2370, _2372);
    float _2388 = fma(_2338, _2370, _2378);
    float _2390 = fma(_2376, _2370, _2380);
    float _2392 = _2326 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2394 = fma(_2320, _2384, _2386);
    float _2396 = _2386;
    if (!_2278)
    {
        float _2398 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2400 = _2346 + _2398;
        _2396 = _2400;
    }
    float _2402 = _2396;
    bool _2404 = _2346 <= 8000.0;
    bool _2406 = isnan(_2346);
    bool _2408 = _2404 || _2406;
    bool _2410 = isnan(8000.0);
    bool _2412 = _2408 || _2410;
    float _2414 = float(_2412);
    float _2416 = fma(_2374, _2384, _2388);
    float _2418 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (!_2278)
    {
        _1737 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2420 = _1737;
    float _2422 = exp2(_2418);
    float _2424 = _2420;
    float _2426 = _2167;
    if (!_2278)
    {
        float _2428 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2430 = _2420 + _2428;
        _2424 = _2430;
    }
    float _2432 = _2424;
    bool _2434 = _1877 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2436 = isnan(_1877);
    bool _2438 = _2434 || _2436;
    bool _2440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2442 = _2438 || _2440;
    float _2444 = _2338;
    float _2446 = _2432;
    if (!_2278)
    {
        float _2448 = 1.0 / _2432;
        _2444 = _2448;
    }
    float _2450 = _2444;
    float _2452 = fma(_2422, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2454 = precise::clamp(_2452, 0.0, 1.0);
    float _2456 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2284);
    if (_2278)
    {
        _2446 = 1.0;
    }
    float _2458 = _2446;
    float _2460 = fma(_2454, -2.0, 3.0);
    float _2462 = _2454 * _2454;
    float _2464 = fma(_2456, _2384, _2390);
    float _2466 = _2458;
    if (!_2278)
    {
        float _2468 = _2402 * _2450;
        float _2470 = precise::clamp(_2468, 0.0, 1.0);
        _2466 = _2470;
    }
    float _2472 = _2466;
    float _2474 = _2462 * _2460;
    out.m_79.x = _2394;
    out.m_79.y = _2416;
    out.m_79.z = _2464;
    float _2476 = -_2474;
    float _2478 = _2476 + 1.0;
    float _2480 = fma(_2478, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2474);
    float _2482 = fma(_2119, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2302);
    float _2484 = in.m_81.x;
    float _2486 = _2414 * _2480;
    float _2488 = _2482 + _2129;
    out.gl_Position.x = _2167;
    out.gl_Position.y = _2151;
    out.gl_Position.z = _2482;
    out.gl_Position.w = _2129;
    float _2490 = _2486 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2492 = _2488 * 0.5;
    out.m_83.z = _2492;
    out.m_83.w = _2129;
    float _2494 = _2482;
    if (!_2442)
    {
        _2354 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2496 = _2354;
    float _2498 = _2496;
    float _2500 = _2496;
    if (!_2442)
    {
        _2356 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2502 = _2356;
    float _2504 = _2502;
    float _2506 = _2502;
    if (!_2442)
    {
        _2494 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2508 = _2494;
    float _2510 = _2508;
    float _2512 = _2508;
    if (!_2442)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2514 = _2426;
    float _2516 = -_2169;
    float _2518 = _2516 + 1.0;
    float _2520 = _2518 * _2490;
    float _2522 = precise::clamp(_2520, 0.0, 1.0);
    float _2524 = -_2522;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2528 = _2526 * _2484;
    float _2530 = _2392 * _2189;
    float _2532 = -_2392;
    float _2534 = _2532 + 1.0;
    float _2536 = _2200 * _2530;
    float _2538 = _2210 * _2530;
    float _2540 = _2200 * _2534;
    float _2542 = fma(_2206, _2536, _2194);
    float _2544 = fma(_2208, _2536, _2196);
    float _2546 = _2528 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2548 = fma(_2200, _2538, _2198);
    float _2550 = _2472 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2552 = _2536;
    float _2554 = _2528;
    float _2556 = _2514;
    float _2558 = _2514;
    if (!_2442)
    {
        _2552 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2560 = _2552;
    out.m_85.x = _2546;
    float _2562 = _2560;
    float _2564 = _2560;
    if (!_2442)
    {
        _2554 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2566 = _2554;
    out.m_87.x = _2542;
    out.m_87.y = _2544;
    out.m_87.z = _2548;
    out.m_87.w = _2540;
    bool _2568 = !_2442;
    float _2570 = _2566;
    float _2572 = _2566;
    if (!_2568)
    {
        bool _2574 = _1877 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2576 = isnan(_1877);
        bool _2578 = _2574 || _2576;
        bool _2580 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2582 = _2578 || _2580;
        if (!_2582)
        {
            float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2586 = _1877 + _2584;
            float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2590 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2588;
            float _2592 = 1.0 / _2590;
            float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2610 = _2586 * _2592;
            float _2612 = precise::clamp(_2610, 0.0, 1.0);
            float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2622 = fma(_2612, _2596, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2624 = fma(_2612, _2616, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2626 = fma(_2612, _2620, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2628 = fma(_2612, _2600, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2630 = fma(_2612, _2604, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2632 = fma(_2612, _2608, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2506 = _2626;
            _2564 = _2630;
            _2500 = _2624;
            _2558 = _2628;
            _2512 = _2622;
            _2572 = _2632;
            _2634 = true;
        }
        else
        {
            bool _2636 = _1877 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2638 = isnan(_1877);
            bool _2640 = _2636 || _2638;
            bool _2642 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2644 = _2640 || _2642;
            if (!_2644)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2646 = _2498;
            _2500 = _2646;
            if (!_2644)
            {
                _2504 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2648 = _2504;
            _2506 = _2648;
            if (!_2644)
            {
                _2510 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2650 = _2510;
            _2512 = _2650;
            if (!_2644)
            {
                _2556 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2652 = _2556;
            _2558 = _2652;
            if (!_2644)
            {
                _2562 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2654 = _2562;
            _2564 = _2654;
            if (!_2644)
            {
                _2570 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2656 = _2570;
            bool _2658 = !_2644;
            _2572 = _2656;
            if (!_2658)
            {
                bool _2660 = _1877 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2662 = isnan(_1877);
                bool _2664 = _2660 || _2662;
                bool _2666 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2668 = _2664 || _2666;
                if (!_2668)
                {
                    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2672 = _1877 + _2670;
                    float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2676 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2674;
                    float _2678 = 1.0 / _2676;
                    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2692 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2694 = _2692 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2696 = _2672 * _2678;
                    float _2698 = precise::clamp(_2696, 0.0, 1.0);
                    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2704 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2708 = fma(_2698, _2682, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2710 = fma(_2698, _2702, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2712 = fma(_2698, _2706, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2714 = fma(_2698, _2686, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2716 = fma(_2698, _2690, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2718 = fma(_2698, _2694, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2506 = _2712;
                    _2564 = _2716;
                    _2500 = _2710;
                    _2558 = _2714;
                    _2512 = _2708;
                    _2572 = _2718;
                    _2634 = true;
                }
                else
                {
                    _2506 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2564 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2558 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2512 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2572 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2634 = false;
    float _2720 = _2506;
    float _2722 = _2564;
    float _2724 = _2500;
    float _2726 = _2558;
    float _2728 = _2512;
    float _2730 = _2572;
    float _2732 = _2550 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2734 = fma(_2416, -0.5, 0.5);
    float _2736 = precise::clamp(_2734, 0.0, 1.0);
    float _2738 = -_2720;
    float _2740 = _2738 + _2722;
    float _2742 = -_2724;
    float _2744 = _2742 + _2726;
    out.m_53.x = _2732;
    float _2746 = fma(_2736, _2740, _2720);
    float _2748 = -_2728;
    float _2750 = _2748 + _2730;
    float _2752 = fma(_2736, _2744, _2724);
    float _2754 = _2746 * 0.586610972881317138671875;
    bool _2756 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2758 = fma(_2736, _2750, _2728);
    out.m_89.x = 0.0;
    float _2760 = fma(_2752, 0.298911988735198974609375, _2754);
    bool _2762 = _2472 > 0.0;
    bool _2764 = isnan(_2472);
    bool _2766 = _2762 || _2764;
    bool _2768 = isnan(0.0);
    bool _2770 = _2766 || _2768;
    float _2772 = fma(_2758, 0.114477999508380889892578125, _2760);
    float _2774 = -_2772;
    float _2776 = _2752 + _2774;
    float _2778 = -_2772;
    float _2780 = _2746 + _2778;
    float _2782 = -_2772;
    float _2784 = _2758 + _2782;
    float _2786 = fma(_2776, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2772);
    float _2788 = fma(_2780, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2772);
    float _2790 = fma(_2784, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2772);
    bool _2792 = !_2756;
    if (!_2792)
    {
        float _2794 = -_1849;
        float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2798 = -_1851;
        float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2802 = -_1853;
        float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2806 = _2796 * _2796;
        float _2808 = fma(_2800, _2800, _2806);
        float _2810 = fma(_2804, _2804, _2808);
        float _2812 = sqrt(_2810);
        float _2814 = rsqrt(_2810);
        float _2816 = -_2812;
        float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2820 = _2818 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2822 = precise::clamp(_2820, 0.0, 1.0);
        float _2824 = _2800 * _2814;
        float _2826 = _2796 * _2814;
        float _2828 = abs(_2822);
        float _2830 = log2(_2828);
        float _2832 = _2804 * _2814;
        float _2834 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2836 = _2416 * _2826;
        float _2838 = -_2826;
        float _2840 = -_2834;
        float _2842 = fma(_2838, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2840);
        float _2844 = fma(_2394, _2824, _2836);
        float _2846 = -_2832;
        float _2848 = fma(_2846, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2842);
        float _2850 = fma(_2464, _2832, _2844);
        float _2852 = precise::clamp(_2850, 0.0, 1.0);
        float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2856 = _2848 + _2854;
        float _2858 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2860 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2862 = precise::clamp(_2860, 0.0, 1.0);
        float _2864 = exp2(_2858);
        float _2866 = _2864 * _2862;
        float _2868 = _2852 * _2866;
        float _2870 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2872 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2874 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2870;
        out.m_89.y = _2872;
        out.m_89.z = _2874;
    }
    out.m_91.x = _2786;
    out.m_91.y = _2788;
    out.m_91.z = _2790;
    if (_2770)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2876 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2876;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

