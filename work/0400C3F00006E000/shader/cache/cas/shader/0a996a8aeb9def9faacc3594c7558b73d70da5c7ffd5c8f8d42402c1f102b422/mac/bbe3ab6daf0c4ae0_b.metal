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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    sampler vp_t_tcb_30Smplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_77 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_57 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
    float4 m_63 [[attribute(11)]];
    float4 m_67 [[attribute(12)]];
    float4 m_75 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2231 = false;
    bool _1592 = false;
    bool _634 = false;
    bool _442 = false;
    bool _328 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2530 = as_type<float>(_126);
        out.gl_Position.z = _2530;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_51.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2599 = as_type<float>(_164);
        out.gl_Position.z = _2599;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_53.y;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = in.m_53.z;
    float _172 = in.m_55.y;
    float _174 = in.m_55.z;
    float _176 = in.m_57.y;
    float _178 = in.m_57.z;
    float _180 = _166 * _166;
    float _182 = in.m_53.x;
    float _184 = _170 * _170;
    float _186 = in.m_57.x;
    float _188 = fma(_172, _172, _180);
    float _190 = in.m_55.x;
    float _192 = fma(_174, _174, _184);
    float _194 = fma(_176, _176, _188);
    float _196 = fma(_178, _178, _192);
    float _198 = sqrt(_194);
    float _200 = in.m_59.x;
    float _202 = in.m_59.y;
    float _204 = in.m_59.z;
    float _206 = sqrt(_196);
    bool _208 = _198 > 0.0;
    bool _210 = _206 > 0.0;
    float _212 = _166 * _202;
    float _214 = _176 * _202;
    float _216 = _172 * _202;
    float _218 = 0.0;
    if (_208)
    {
        float _220 = rsqrt(_194);
        _218 = _220;
    }
    float _222 = _218;
    float _224 = fma(_200, _182, _212);
    float _226 = fma(_200, _186, _214);
    float _228 = fma(_200, _190, _216);
    float _230 = 0.0;
    float _232 = _226;
    if (!_208)
    {
        _230 = 0.0;
    }
    float _234 = _230;
    float _236 = fma(_170, _204, _224);
    float _238 = fma(_178, _204, _226);
    float _240 = 0.0;
    float _242 = _234;
    if (!_208)
    {
        _240 = 0.0;
    }
    float _244 = _240;
    float _246 = 0.0;
    float _248 = _244;
    if (_210)
    {
        float _250 = rsqrt(_196);
        _246 = _250;
    }
    float _252 = _246;
    float _254 = 0.0;
    if (!_208)
    {
        _254 = 0.0;
    }
    float _256 = _254;
    float _258 = fma(_174, _204, _228);
    float _260 = 0.0;
    float _262 = _256;
    if (!_210)
    {
        _260 = 0.0;
    }
    float _264 = _260;
    float _266 = _264;
    if (!_210)
    {
        _232 = 0.0;
    }
    float _268 = _232;
    float _270 = 0.0;
    float _272 = _268;
    if (!_210)
    {
        _270 = 0.0;
    }
    float _274 = _270;
    float _276 = _274;
    if (_208)
    {
        float _278 = _222 * _172;
        _242 = _278;
    }
    float _280 = _242;
    float _282 = _280;
    if (_208)
    {
        float _284 = _222 * _166;
        _248 = _284;
    }
    float _286 = _248;
    float _288 = _286;
    if (_208)
    {
        float _290 = _222 * _176;
        _262 = _290;
    }
    float _292 = _262;
    float _294 = _292;
    if (_210)
    {
        float _296 = _252 * _174;
        _266 = _296;
    }
    float _298 = _266;
    if (_210)
    {
        float _300 = _252 * _170;
        _272 = _300;
    }
    float _302 = _272;
    if (_210)
    {
        float _304 = _252 * _178;
        _276 = _304;
    }
    float _306 = _276;
    bool _308 = !_168;
    float _326;
    if (!_308)
    {
        float _310 = in.m_61.x;
        float _312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _314 = _310 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _318 = _316 * _312;
        float _320 = floor(_318);
        float _322 = -_320;
        float _324 = _318 + _322;
        _326 = _324;
        _328 = true;
    }
    else
    {
        float _330 = float(_110);
        float _332 = 1.0 / _330;
        float _334 = _144 * _332;
        _326 = _334;
    }
    _328 = false;
    float _336 = _326;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = _336 + _338;
    bool _342 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _344 = isnan(_336);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _354;
    bool _358 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _360 = isnan(_336);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = -_352;
    float _372 = _370 + 1.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _374;
    float _378 = 1.0 / _356;
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _382 = _368 * _372;
    float _384 = -_368;
    float _386 = _384 + 1.0;
    float _388 = _340 * _378;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = fma(_376, _388, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _396;
    float _400 = fma(_392, _388, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _402 = _394 * _382;
    float _404 = fma(_398, _388, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _406 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].x, _402);
    float _408 = _404 * _382;
    float _410 = _400 * _382;
    float _412 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[144].x, _406);
    float _414 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].y, _408);
    float _416 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].z, _410);
    float _418 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[144].y, _414);
    float _420 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[144].z, _416);
    bool _422 = !_380;
    float _440;
    if (!_422)
    {
        float _424 = in.m_61.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        float _444 = float(_110);
        float _446 = 1.0 / _444;
        float _448 = _144 * _446;
        _440 = _448;
    }
    _442 = false;
    float _450 = _440;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _454 = _450 + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _460 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _462 = isnan(_450);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _480 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _482 = isnan(_450);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = 1.0 / _458;
    float _494 = -_470;
    float _496 = _494 + 1.0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _498;
    bool _502 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _504 = isnan(_450);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = _490 * _496;
    float _516 = -_490;
    float _518 = _516 + 1.0;
    bool _520 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _522 = 1.0 / _474;
    float _524 = _512 * _518;
    float _526 = -_512;
    float _528 = _526 + 1.0;
    float _530 = 1.0 / _478;
    float _532 = _500 * _492;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _538 = fma(_532, _454, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _540 = _536 * _522;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _544 = _450 + _542;
    bool _546 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _548 = isnan(_450);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _558;
    float _562 = _538 * _524;
    float _564 = fma(_540, _544, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _568 = _450 + _566;
    float _570 = -_556;
    float _572 = _570 + 1.0;
    float _574 = _560 * _530;
    float _576 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[115].x, _562);
    float _578 = _470 * _572;
    float _580 = fma(_574, _568, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _582 = fma(_564, _514, _576);
    float _584 = fma(_580, _578, _582);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _588 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[118].x, _584);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _594 = in.m_63.x;
    float _596 = in.m_63.y;
    float _598 = in.m_63.z;
    float _600 = _586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_65.x = _600;
    out.m_65.y = _604;
    out.m_65.z = _602;
    out.m_65.w = _606;
    float _608 = _418 * _596;
    float _610 = _420 * _598;
    float _612 = _412 * _594;
    bool _614 = !_520;
    float _632;
    if (!_614)
    {
        float _616 = in.m_61.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        float _636 = float(_110);
        float _638 = 1.0 / _636;
        float _640 = _144 * _638;
        _632 = _640;
    }
    _634 = false;
    float _642 = _632;
    float _644 = in.m_61.z;
    float _646 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _648 = log2(_646);
    float _650 = in.m_46.x;
    float _652 = in.m_46.y;
    float _654 = in.m_46.z;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _658 = _656 != 0;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _662 = _660 != 0;
    float _664 = in.m_61.x;
    float _666 = in.m_61.y;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _670 = in.m_67.y;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _674 = _672 != 0;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _682 = _680 != 0;
    bool _684 = !_674;
    int _686 = _684 ? 0 : 1;
    bool _688 = !_678;
    int _690 = _688 ? 0 : 1;
    int _692 = abs(_686);
    float _694 = _644 * 2.0;
    bool _696 = !_682;
    int _698 = _696 ? 0 : 1;
    float _700 = _172 * _652;
    float _702 = _166 * _652;
    float _704 = _176 * _652;
    float _706 = floor(_694);
    float _708 = _666 * 2.0;
    float _710 = _664 * 2.0;
    bool _712 = _666 > 0.5;
    float _714 = fma(_190, _650, _700);
    float _716 = -_670;
    float _718 = _716 + 1.0;
    float _720 = _236 * _236;
    float _722 = floor(_708);
    float _724 = fma(_182, _650, _702);
    float _726 = _670;
    if (_658)
    {
        float _728 = _712 ? _718 : _670;
        _726 = _728;
    }
    float _730 = _726;
    float _732 = fma(_186, _650, _704);
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _736 = _664 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _738 = fma(_258, _258, _720);
    float _740 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _742 = floor(_710);
    float _744 = -_734;
    float _746 = fma(_736, 2.0, _744);
    bool _748 = _706 >= 0.0;
    bool _750 = isnan(_706);
    bool _752 = _748 || _750;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    float _758 = fma(_238, _238, _738);
    bool _760 = _706 > 0.0;
    float _762 = _666 + _644;
    int _764 = _756 ? 0 : 1;
    float _766 = fma(_170, _654, _724);
    float _768 = rsqrt(_758);
    float _770 = in.m_69.x;
    float _772 = in.m_69.y;
    float _774 = in.m_69.z;
    bool _776 = _722 >= 0.0;
    bool _778 = isnan(_722);
    bool _780 = _776 || _778;
    bool _782 = isnan(0.0);
    bool _784 = _780 || _782;
    float _786 = _762 + (-1.0);
    int _788 = _784 ? 0 : 1;
    bool _790 = _742 >= 0.0;
    bool _792 = isnan(_742);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    float _800 = _666 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _802 = _722 > 0.0;
    float _804 = _666 + _664;
    int _806 = _798 ? 0 : 1;
    float _808 = fma(_800, -2.0, _668);
    float _810 = _804 + (-1.0);
    bool _812 = _742 > 0.0;
    float _814 = _236 * _768;
    int _816 = ~_788;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _824 = _648 * _144;
    float _826 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _828 = _238 * _768;
    float _830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _770);
    int _832 = _820;
    float _834 = _770;
    if (!_802)
    {
        int _836 = ~_788;
        int _838 = _836 + 1;
        _832 = _838;
    }
    int _840 = _832;
    float _842 = _740 * _830;
    float _844 = _258 * _768;
    float _846 = exp2(_824);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _850 = 1.0 + _848;
    int _852 = ~_806;
    int _854 = _852 + 1;
    int _856 = _854 + 1;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _862 = _856;
    if (!_812)
    {
        int _864 = ~_806;
        int _866 = _864 + 1;
        _862 = _866;
    }
    int _868 = _862;
    float _870 = in.m_71.x;
    float _872 = in.m_71.y;
    float _874 = in.m_71.z;
    float _876 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[78].z, _860);
    int _878 = ~_764;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    float _884 = 1.0 / _850;
    int _886 = _882;
    if (!_760)
    {
        int _888 = ~_764;
        int _890 = _888 + 1;
        _886 = _890;
    }
    int _892 = _886;
    float _894 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[78].w, _858);
    float _896 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _876);
    float _898 = -_144;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[76].x, _746);
    bool _902 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _904 = isnan(1.0);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _910 = _906 || _908;
    float _912 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _808);
    float _914 = -_846;
    float _916 = _914 + 1.0;
    bool _918 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _920 = isnan(0.0);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _926 = _922 || _924;
    float _928 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _894);
    float _930 = float(_692);
    float _932 = _666 + (-0.5);
    float _934 = float(_892);
    int _936 = abs(_690);
    int _938 = abs(_698);
    float _940 = _930 * _934;
    float _942 = _926 ? _916 : 0.0;
    float _944 = in.m_53.w;
    float _946 = float(_868);
    float _948 = float(_938);
    if (_910)
    {
        float _950 = _942 * _884;
        _148 = _950;
    }
    float _952 = _148;
    float _954 = _814 * _286;
    float _956 = float(_936);
    float _958 = _940 * (-2.0);
    float _960 = _664 + (-0.5);
    float _962 = fma(_844, _280, _954);
    float _964 = float(_840);
    float _966 = fma(_958, _870, _870);
    float _968 = _956 * _946;
    float _970 = fma(_828, _292, _962);
    float _972 = fma(_826, _958, _826);
    float _974 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[196].x, _966);
    float _976 = _968 * (-2.0);
    float _978 = _948 * _964;
    float _980 = abs(_970);
    bool _982 = _980 > 0.99989998340606689453125;
    float _984 = fma(_972, _952, _974);
    float _986 = fma(_976, _872, _872);
    float _988 = _644 + _664;
    float _990 = _644 + (-0.5);
    float _992 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[196].y, _986);
    float _994 = _988 + (-1.0);
    float _996 = _978 * (-2.0);
    float _998 = fma(_822, _976, _822);
    float _1000 = _984 * 0.15915493667125701904296875;
    float _1002 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1004 = fma(_996, _874, _874);
    if (_982)
    {
        float _1006 = fma(_298, 0.001000000047497451305389404296875, _280);
        _282 = _1006;
    }
    float _1008 = _282;
    if (_982)
    {
        float _1010 = fma(_306, 0.001000000047497451305389404296875, _292);
        _294 = _1010;
    }
    float _1012 = _294;
    float _1014 = fma(_1002, _996, _1002);
    float _1016 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1004);
    float _1018 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1020 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _772);
    float _1022 = fma(_998, _952, _992);
    float _1024 = fma(_1014, _952, _1016);
    float _1026 = -_1008;
    float _1028 = _828 * _1026;
    float _1030 = _1000 * 6.283185482025146484375;
    float _1032 = sin(_1030);
    if (_982)
    {
        float _1034 = fma(_302, 0.001000000047497451305389404296875, _286);
        _288 = _1034;
    }
    float _1036 = _288;
    float _1038 = -_1012;
    float _1040 = _814 * _1038;
    float _1042 = -_1012;
    float _1044 = -_1028;
    float _1046 = fma(_844, _1042, _1044);
    float _1048 = _1018 * _1020;
    float _1050 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1052 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _774);
    float _1054 = fma(_174, _654, _714);
    float _1056 = _1000 * 6.283185482025146484375;
    float _1058 = cos(_1056);
    float _1060 = -_1036;
    float _1062 = _844 * _1060;
    float _1064 = -_1036;
    float _1066 = -_1040;
    float _1068 = fma(_828, _1064, _1066);
    float _1070 = _1046 * _1046;
    float _1072 = _1022 * 0.15915493667125701904296875;
    float _1074 = in.m_55.w;
    float _1076 = _1024 * 0.15915493667125701904296875;
    float _1078 = _1050 * _1052;
    float _1080 = -_1008;
    float _1082 = -_1062;
    float _1084 = fma(_814, _1080, _1082);
    float _1086 = in.m_57.w;
    float _1088 = fma(_1068, _1068, _1070);
    float _1090 = _1072 * 6.283185482025146484375;
    float _1092 = sin(_1090);
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1098 = fma(_178, _654, _732);
    float _1100 = fma(_1084, _1084, _1088);
    float _1102 = _968;
    if (_662)
    {
        float _1104 = in.m_61.x;
        _1102 = _1104;
    }
    float _1106 = _1102;
    bool _1108 = _772 != 0.0;
    bool _1110 = isnan(_772);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan(0.0);
    bool _1116 = _1112 || _1114;
    float _1118 = _766 + _944;
    float _1120 = _1072 * 6.283185482025146484375;
    float _1122 = cos(_1120);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1124;
    bool _1128 = _770 == 0.0;
    bool _1130 = !_1116;
    bool _1132 = _1128 && _1130;
    bool _1134 = _774 == 0.0;
    bool _1136 = _1134 && _1132;
    float _1138 = _1076 * 6.283185482025146484375;
    float _1140 = cos(_1138);
    float _1142 = _1032 * _1092;
    float _1144 = _1054 + _1074;
    float _1146 = _1098 + _1086;
    float _1148 = _1076 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    float _1152 = _1032 * _1122;
    bool _1154 = _1106 > 0.5;
    bool _1156 = _1154 && _662;
    float _1158 = in.m_67.x;
    float _1160 = 1.0 / _1096;
    float _1162 = _1032 * _1140;
    float _1164 = _1058 * _1122;
    float _1166 = _1122 * _1140;
    float _1168 = _1058 * _1092;
    float _1170 = _1058 * _1140;
    float _1172 = _1092 * _1140;
    float _1174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1176 = fma(_1150, _1164, _1142);
    float _1178 = -_1168;
    float _1180 = fma(_1150, _1152, _1178);
    float _1182 = -_1152;
    float _1184 = fma(_1150, _1168, _1182);
    float _1186 = fma(_1150, _1142, _1164);
    float _1188 = _1176 * _828;
    float _1190 = _1170 * _844;
    float _1192 = _1184 * _828;
    float _1194 = rsqrt(_1100);
    float _1196 = _1126 * _1160;
    float _1198 = _1170 * _828;
    float _1200 = _1184 * _844;
    float _1202 = _1170 * _814;
    float _1204 = _1176 * _814;
    float _1206 = _1184 * _814;
    float _1208 = _1184;
    float _1210 = _1158;
    float _1212 = _1146;
    if (_662)
    {
        _1208 = _1158;
    }
    float _1214 = _1208;
    float _1216 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1218 = fma(_1216, _730, -0.5);
    float _1220 = _1214;
    if (_1156)
    {
        float _1222 = -_1214;
        float _1224 = _1222 + 1.0;
        _1220 = _1224;
    }
    float _1226 = _1220;
    float _1228 = _1046 * _1194;
    float _1230 = _1068 * _1194;
    float _1232 = _1084 * _1194;
    float _1234 = _1176 * _844;
    float _1236 = -_912;
    float _1238 = fma(_928, _1218, _1236);
    float _1240 = -_1150;
    float _1242 = fma(_1240, _1230, _1190);
    float _1244 = fma(_1166, _1232, _1188);
    float _1246 = fma(_1166, _1230, _1234);
    float _1248 = _814 * _1232;
    float _1250 = _844 * _1228;
    float _1252 = fma(_1172, _1232, _1192);
    float _1254 = -_1150;
    float _1256 = fma(_1254, _1232, _1198);
    float _1258 = -_1248;
    float _1260 = fma(_828, _1228, _1258);
    float _1262 = -_1250;
    float _1264 = fma(_814, _1230, _1262);
    float _1266 = fma(_1172, _1230, _1200);
    float _1268 = _828 * _1230;
    float _1270 = fma(_1162, _1260, _1242);
    float _1272 = fma(_1162, _1264, _1256);
    float _1274 = fma(_1180, _1264, _1244);
    float _1276 = fma(_1180, _1260, _1246);
    float _1278 = _1048 * _1270;
    float _1280 = _1048 * _1272;
    float _1282 = fma(_1186, _1260, _1266);
    bool _1284 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1286 = isnan(_642);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    float _1296 = fma(_1186, _1264, _1252);
    float _1298 = fma(_842, _1276, _1278);
    float _1300 = fma(_842, _1274, _1280);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1304 = _642 + _1302;
    bool _1306 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1308 = isnan(_642);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = -_1294;
    float _1320 = _1318 + 1.0;
    float _1322 = fma(_1078, _1282, _1298);
    float _1324 = fma(_1078, _1296, _1300);
    float _1326 = fma(_1196, _1304, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1328 = _1316 * _1320;
    float _1330 = _1144 + _1322;
    float _1332 = _1146 + _1324;
    float _1334 = in.m_73.x;
    float _1336 = in.m_73.y;
    float _1338 = in.m_73.z;
    float _1340 = _1326 * _1328;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1344 = _1330 + _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1348 = _1332 + _1346;
    float _1350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1352 = -_1150;
    float _1354 = fma(_1352, _1228, _1202);
    float _1356 = _1344 * _1344;
    float _1358 = _1348 * _1348;
    float _1360 = -_1268;
    float _1362 = fma(_844, _1232, _1360);
    float _1364 = fma(_1166, _1228, _1204);
    float _1366 = fma(_1172, _1228, _1206);
    float _1368 = _1356 + _1358;
    float _1370 = fma(_1162, _1362, _1354);
    float _1372 = fma(_1180, _1362, _1364);
    float _1374 = fma(_1186, _1362, _1366);
    float _1376 = sqrt(_1368);
    float _1378 = _1048 * _1370;
    float _1380 = _1356;
    float _1382 = _1358;
    float _1384 = _1330;
    float _1386 = _1332;
    float _1388 = _1296;
    if (_662)
    {
        _1210 = _1226;
    }
    float _1390 = _1210;
    float _1392 = -_1316;
    float _1394 = _1392 + 1.0;
    float _1396 = fma(_842, _1372, _1378);
    float _1398 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1400 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1340);
    float _1402 = fma(_1078, _1374, _1396);
    float _1404 = fma(_1398, _1390, -0.5);
    float _1406 = _1334;
    float _1408 = _1336;
    float _1410 = _1338;
    if (!_1136)
    {
        float _1412 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1334);
        _1406 = _1412;
    }
    float _1414 = _1406;
    if (!_1136)
    {
        float _1416 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1336);
        _1408 = _1416;
    }
    float _1418 = _1408;
    float _1420 = _1118 + _1402;
    float _1422 = fma(_896, _1404, _900);
    if (!_1136)
    {
        float _1424 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1338);
        _1410 = _1424;
    }
    float _1426 = _1410;
    bool _1428 = _1376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1430 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1400);
    if (!_1428)
    {
        _834 = _1420;
    }
    float _1432 = _834;
    bool _1434 = !_1428;
    float _1436 = _1432;
    if (!_1434)
    {
        float _1438 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1442 = _1376 + _1440;
        float _1444 = _1420 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1446 = rsqrt(_1368);
        float _1448 = _1442 * _1438;
        float _1450 = _1448 * 0.15915493667125701904296875;
        float _1452 = _1450 * 6.283185482025146484375;
        float _1454 = sin(_1452);
        float _1456 = _1450 * 6.283185482025146484375;
        float _1458 = cos(_1456);
        float _1460 = fma(_1454, _1444, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1462 = _1446 * _1460;
        float _1464 = _1458 + (-1.0);
        float _1466 = fma(_1344, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1468 = fma(_1348, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1470 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1474 = _1466 + _1472;
        float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1478 = _1468 + _1476;
        float _1480 = fma(_1420, _1458, _1470);
        float _1482 = _1474 * _1474;
        float _1484 = _1478 * _1478;
        _1436 = _1480;
        _1380 = _1482;
        _1382 = _1484;
        _1384 = _1466;
        _1386 = _1468;
    }
    float _1486 = _1436;
    float _1488 = _1380;
    float _1490 = _1382;
    float _1492 = _1384;
    float _1494 = _1386;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1498 = _1486 + _1496;
    float _1500 = in.m_75.x;
    float _1502 = _1270 * _1418;
    float _1504 = _1370 * _1418;
    float _1506 = fma(_1498, _1498, _1488);
    float _1508 = _1272 * _1418;
    float _1510 = fma(_1276, _1414, _1502);
    float _1512 = _1506 + _1490;
    float _1514 = fma(_1274, _1414, _1508);
    float _1516 = fma(_1372, _1414, _1504);
    float _1518 = fma(_1282, _1426, _1510);
    float _1520 = sqrt(_1512);
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1528 = fma(_1374, _1426, _1516);
    float _1530 = _1522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1532 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1534 = _1526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1536 = _1238 + 0.5;
    float _1538 = _1430 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1540 = _1422 + 0.5;
    float _1542 = fma(_1296, _1426, _1514);
    out.m_77.x = _1500;
    out.m_79.x = _1530;
    out.m_79.y = _1532;
    out.m_79.z = _1534;
    out.m_79.w = _1538;
    bool _1544 = _1520 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1546 = isnan(_1520);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1552 = _1548 || _1550;
    out.m_81.x = _1540;
    out.m_81.y = _1536;
    out.m_83.x = _1518;
    out.m_83.y = _1528;
    out.m_83.z = _1542;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1556 = _1510;
    if (!_1552)
    {
        _1554 = 1.0;
    }
    float _1558 = _1554;
    bool _1560 = !_1552;
    float _1562 = _1558;
    if (!_1560)
    {
        bool _1564 = _1520 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1566 = isnan(_1520);
        bool _1568 = _1564 || _1566;
        bool _1570 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1572 = _1568 || _1570;
        if (!_1572)
        {
            float _1574 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1576 = _1520 + _1574;
            float _1578 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1580 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1578;
            float _1582 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1584 = _1582 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1586 = 1.0 / _1580;
            float _1588 = _1576 * _1586;
            float _1590 = fma(_1588, _1584, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1562 = _1590;
            _1592 = true;
        }
        else
        {
            bool _1594 = _1520 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1596 = isnan(_1520);
            bool _1598 = _1594 || _1596;
            bool _1600 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1602 = _1598 || _1600;
            if (!_1602)
            {
                float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1606 = _1520 + _1604;
                float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1610 = _1608 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1614 = _1612 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1616 = 1.0 / _1610;
                float _1618 = _1606 * _1616;
                float _1620 = fma(_1618, _1614, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1562 = _1620;
                _1592 = true;
            }
            else
            {
                _1562 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1592 = false;
    float _1622 = _1562;
    float _1624 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1626 = _1486 + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1630 = _1492 + _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1634 = _1494 + _1632;
    float _1636 = fma(_1626, _1622, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1638 = fma(_1630, _1622, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1640 = fma(_1634, _1622, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1644 = _1636 + _1642;
    float _1646 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1648 = _1638 + _1646;
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1652 = _1640 + _1650;
    float _1654 = _1644 * _1644;
    float _1656 = fma(_1648, _1648, _1654);
    float _1658 = fma(_1652, _1652, _1656);
    float _1660 = rsqrt(_1658);
    float _1662 = sqrt(_1658);
    float _1664 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1666 = _1648 * _1664;
    float _1668 = _1652 * _1664;
    float _1670 = _1666 * _1666;
    float _1672 = _1668 * _1668;
    float _1674 = _1670 + _1672;
    float _1676 = sqrt(_1674);
    bool _1678 = _1676 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1682 = _1676 + _1680;
    float _1684 = _1652;
    float _1686 = _1660;
    float _1688 = _1682;
    float _1690 = _1644;
    if (_1678)
    {
        float _1692 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1684 = _1692;
    }
    float _1694 = _1684;
    if (_1678)
    {
        float _1696 = rsqrt(_1674);
        _1686 = _1696;
    }
    float _1698 = _1686;
    float _1700 = _1698;
    if (_1678)
    {
        float _1702 = _1682 * _1694;
        _1688 = _1702;
    }
    float _1704 = _1688;
    if (_1678)
    {
        float _1706 = _1704 * 0.15915493667125701904296875;
        _1388 = _1706;
    }
    float _1708 = _1388;
    float _1710 = _1694;
    float _1712 = _1708;
    if (_1678)
    {
        float _1714 = _1708 * 6.283185482025146484375;
        float _1716 = sin(_1714);
        _1710 = _1716;
    }
    float _1718 = _1710;
    float _1720 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1722 = precise::max(0.0, _1720);
    float _1724 = _1634;
    float _1726 = _1722;
    if (_1678)
    {
        float _1728 = _1708 * 6.283185482025146484375;
        float _1730 = cos(_1728);
        _1724 = _1730;
    }
    float _1732 = _1724;
    float _1734 = -_1664;
    float _1736 = -_1722;
    float _1738 = fma(_1644, _1734, _1736);
    if (!_1678)
    {
        _1690 = _1668;
    }
    float _1740 = _1690;
    float _1742 = _1740;
    if (_1678)
    {
        float _1744 = _1738 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1726 = _1744;
    }
    float _1746 = _1726;
    float _1748 = _1718;
    float _1750 = _1746;
    if (_1678)
    {
        float _1752 = fma(_1718, _1746, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1748 = _1752;
    }
    float _1754 = _1748;
    float _1756 = _1754;
    float _1758 = _1732;
    if (_1678)
    {
        float _1760 = _1732 + (-1.0);
        _1750 = _1760;
    }
    float _1762 = _1750;
    float _1764 = _1762;
    if (_1678)
    {
        float _1766 = _1698 * _1754;
        _1556 = _1766;
    }
    float _1768 = _1556;
    if (!_1678)
    {
        _1700 = _1666;
    }
    float _1770 = _1700;
    float _1772 = _1770;
    if (_1678)
    {
        float _1774 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1712 = _1774;
    }
    float _1776 = _1712;
    if (_1678)
    {
        float _1778 = _1666 * _1768;
        _1772 = _1778;
    }
    float _1780 = _1772;
    if (!_1678)
    {
        _1756 = _1738;
    }
    float _1782 = _1756;
    float _1784 = _1782;
    if (_1678)
    {
        float _1786 = _1668 * _1768;
        _1742 = _1786;
    }
    float _1788 = _1742;
    if (!_1678)
    {
        _1764 = _1670;
    }
    float _1790 = _1764;
    float _1792 = _1790;
    if (_1678)
    {
        float _1794 = fma(_1738, _1732, _1776);
        _1784 = _1794;
    }
    float _1796 = _1784;
    if (_1678)
    {
        float _1798 = _1780 * _1780;
        _1792 = _1798;
    }
    float _1800 = _1792;
    if (!_1678)
    {
        _1758 = _1672;
    }
    float _1802 = _1758;
    float _1804 = _1802;
    if (_1678)
    {
        float _1806 = _1788 * _1788;
        _1804 = _1806;
    }
    float _1808 = _1804;
    float _1810 = fma(_1796, _1796, _1800);
    float _1812 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1814 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1816 = _1810 + _1808;
    float _1818 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1820 = fma(_1662, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1818);
    float _1822 = precise::clamp(_1820, 0.0, 1.0);
    float _1824 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1812);
    float _1826 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1828 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1830 = -_1822;
    float _1832 = _1830 + 1.0;
    float _1834 = rsqrt(_1816);
    float _1836 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1824);
    float _1838 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1840 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1826);
    float _1842 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1828);
    float _1844 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1846 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1838);
    float _1848 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1840);
    float _1850 = abs(_1832);
    float _1852 = log2(_1850);
    float _1854 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1842);
    float _1856 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1858 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1846);
    float _1860 = _1848 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1862 = -_1856;
    float _1864 = fma(_1862, _1814, 1.0);
    float _1866 = _1858 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1868 = _1834 * _1780;
    float _1870 = _1854 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1872 = _1834 * _1796;
    float _1874 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1876 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1878 = _1834 * _1788;
    float _1880 = log2(_1864);
    float _1882 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1874);
    float _1884 = -_1876;
    float _1886 = fma(_1872, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1884);
    float _1888 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1890 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1882);
    float _1892 = -_1878;
    float _1894 = fma(_1892, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1886);
    float _1896 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1898 = exp2(_1888);
    float _1900 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1890);
    float _1902 = fma(_1894, -0.5, 0.5);
    float _1904 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1906 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1896);
    float _1908 = fma(_1894, 0.5, 0.5);
    float _1910 = _1872 + 1.0;
    float _1912 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1904);
    float _1914 = 1.0 / _1900;
    float _1916 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1906);
    float _1918 = fma(_1908, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1920 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1912);
    float _1922 = _1880 * 0.693147182464599609375;
    float _1924 = fma(_1908, _1918, -0.212114393711090087890625);
    float _1926 = sqrt(_1902);
    float _1928 = -_1872;
    float _1930 = fma(_1898, _1910, _1928);
    float _1932 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1916);
    float _1934 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1920);
    float _1936 = fma(_1908, _1924, 1.570728778839111328125);
    float _1938 = _1922 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1940 = fma(_1930, 0.5, 0.5);
    float _1942 = _1932 * _1914;
    float _1944 = _1934 * _1914;
    float _1946 = fma(_1942, 0.5, 0.5);
    float _1948 = fma(_1944, -0.5, 0.5);
    float _1950 = _1926 * 0.636619746685028076171875;
    float3 _5398 = float3(_1946, _1948, _1938);
    float _1952 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5398, float3(0.0), isnan(_5398)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5398, float3(0.0), isnan(_5398)), level(0.0)).x;
    float _1954 = -_1936;
    float _1956 = fma(_1950, _1954, 1.0);
    float2 _5414 = float2(_1956, _1940);
    float3 _1960 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5414, float2(0.0), isnan(_5414)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5414, float2(0.0), isnan(_5414)), level(0.0)).xyz;
    float _1962 = _1960.x;
    float _1964 = _1960.y;
    float _1966 = _1960.z;
    float3 _5431 = float3(_1946, _1948, _1938);
    float4 _1969 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5431, float3(0.0), isnan(_5431)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5431, float3(0.0), isnan(_5431)), level(0.0)).xyzw;
    float _1971 = _1969.x;
    float _1973 = _1969.y;
    float _1975 = _1969.z;
    float _1977 = _1969.w;
    float _1979 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1981 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1983 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1985 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1987 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1979);
    float _1989 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1981);
    bool _1991 = _1662 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1993 = isnan(_1662);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1999 = _1995 || _1997;
    float _2001 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1985);
    float _2003 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1987);
    float _2005 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1989);
    float _2007 = exp2(_1983);
    float _2009 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2001);
    float _2011 = _2003 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2013 = _2005 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2015 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2017 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2019 = _2015 || _2017;
    bool _2021 = isnan(0.5);
    bool _2023 = _2019 || _2021;
    float _2025 = 1.0 / _2011;
    float _2027 = _2013 + _2011;
    float _2029 = _1866;
    float _2031 = _1900;
    if (!_2023)
    {
        _1212 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2033 = _1212;
    if (!_2023)
    {
        _2029 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2035 = _2029;
    float _2037 = _2027 * _2025;
    float _2039 = _2037 * 0.5;
    float _2041 = _2025;
    if (!_2023)
    {
        float _2043 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2045 = fma(_2039, _2033, _2043);
        _2041 = _2045;
    }
    float _2047 = _2041;
    float _2049 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2009);
    float _2051 = -_2007;
    float _2053 = _2051 + 1.0;
    float _2055 = _2049 + _1900;
    float _2057 = _2047;
    float _2059 = _2053;
    float _2061 = _2049;
    float _2063 = _1932;
    if (!_2023)
    {
        float _2065 = 1.0 / _2047;
        _2057 = _2065;
    }
    float _2067 = _2057;
    out.gl_Position.x = _1932;
    out.gl_Position.y = _1934;
    out.gl_Position.z = _2049;
    out.gl_Position.w = _1900;
    float _2069 = _2055 * 0.5;
    float _2071 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2073 = _2071;
    if (!_2023)
    {
        float _2075 = -_2035;
        float _2077 = _2075 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2059 = _2077;
    }
    float _2079 = _2059;
    float _2081 = -_2071;
    float _2083 = _2081 + 1.0;
    out.m_85.z = _2069;
    out.m_85.w = _1900;
    float _2085 = _1934;
    if (!_2023)
    {
        float _2087 = 1.0 / _2079;
        _2085 = _2087;
    }
    float _2089 = _2085;
    float _2091 = _2067;
    if (!_2023)
    {
        float _2093 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2095 = -_2035;
        float _2097 = fma(_2067, _2093, _2095);
        _2091 = _2097;
    }
    float _2099 = _2091;
    float _2101 = _2099;
    if (!_1999)
    {
        _2031 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2103 = _2031;
    float _2105 = _2103;
    float _2107 = _2103;
    if (!_1999)
    {
        _2061 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2109 = _2061;
    float _2111 = _2109;
    float _2113 = _2109;
    if (!_1999)
    {
        _2063 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2115 = _2063;
    float _2117 = _2071 * _1952;
    float _2119 = _2089;
    float _2121 = _1973;
    float _2123 = _2115;
    float _2125 = _2115;
    if (_2023)
    {
        _2073 = 1.0;
    }
    float _2127 = _2073;
    float _2129 = _2127;
    if (!_2023)
    {
        float _2131 = _2099 * _2089;
        float _2133 = precise::clamp(_2131, 0.0, 1.0);
        _2129 = _2133;
    }
    float _2135 = _2129;
    if (!_1999)
    {
        _2101 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2137 = _2101;
    float _2139 = _2137;
    float _2141 = _2137;
    if (!_1999)
    {
        _2119 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2143 = _2119;
    float _2145 = _1966 * _2117;
    float _2147 = _1977 * _2117;
    float _2149 = _1977 * _2083;
    float _2151 = fma(_1977, _2145, _1975);
    float _2153 = fma(_1962, _2147, _1971);
    float _2155 = fma(_1964, _2147, _1973);
    float _2157 = _2143;
    float _2159 = _2143;
    if (!_1999)
    {
        _2121 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2161 = _2121;
    float _2163 = _2135 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_87.x = _2153;
    out.m_87.y = _2155;
    out.m_87.z = _2151;
    out.m_87.w = _2149;
    bool _2165 = !_1999;
    float _2167 = _2161;
    float _2169 = _2161;
    if (!_2165)
    {
        bool _2171 = _1662 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2173 = isnan(_1662);
        bool _2175 = _2171 || _2173;
        bool _2177 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2179 = _2175 || _2177;
        if (!_2179)
        {
            float _2181 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2183 = _1662 + _2181;
            float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2187 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2185;
            float _2189 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2193 = 1.0 / _2187;
            float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2207 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2209 = _2207 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2211 = _2183 * _2193;
            float _2213 = precise::clamp(_2211, 0.0, 1.0);
            float _2215 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2217 = _2215 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2219 = fma(_2213, _2191, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2221 = fma(_2213, _2217, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2223 = fma(_2213, _2197, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2225 = fma(_2213, _2201, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2227 = fma(_2213, _2205, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2229 = fma(_2213, _2209, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2141 = _2223;
            _2159 = _2227;
            _2169 = _2219;
            _2113 = _2225;
            _2107 = _2221;
            _2125 = _2229;
            _2231 = true;
        }
        else
        {
            bool _2233 = _1662 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2235 = isnan(_1662);
            bool _2237 = _2233 || _2235;
            bool _2239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2241 = _2237 || _2239;
            if (!_2241)
            {
                _2167 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2243 = _2167;
            _2169 = _2243;
            if (!_2241)
            {
                _2139 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2245 = _2139;
            _2141 = _2245;
            if (!_2241)
            {
                _2105 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2247 = _2105;
            _2107 = _2247;
            if (!_2241)
            {
                _2111 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2249 = _2111;
            _2113 = _2249;
            if (!_2241)
            {
                _2157 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2251 = _2157;
            _2159 = _2251;
            if (!_2241)
            {
                _2123 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2253 = _2123;
            bool _2255 = !_2241;
            _2125 = _2253;
            if (!_2255)
            {
                bool _2257 = _1662 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2259 = isnan(_1662);
                bool _2261 = _2257 || _2259;
                bool _2263 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2265 = _2261 || _2263;
                if (!_2265)
                {
                    float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2269 = _1662 + _2267;
                    float _2271 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2273 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2271;
                    float _2275 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2279 = 1.0 / _2273;
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2289 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2295 = _2293 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2297 = _2269 * _2279;
                    float _2299 = precise::clamp(_2297, 0.0, 1.0);
                    float _2301 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2305 = fma(_2299, _2277, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2307 = fma(_2299, _2303, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2309 = fma(_2299, _2283, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2311 = fma(_2299, _2287, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2313 = fma(_2299, _2291, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2315 = fma(_2299, _2295, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2141 = _2309;
                    _2159 = _2313;
                    _2169 = _2305;
                    _2113 = _2311;
                    _2107 = _2307;
                    _2125 = _2315;
                    _2231 = true;
                }
                else
                {
                    _2141 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2159 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2169 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2113 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2107 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2125 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2231 = false;
    float _2317 = _2141;
    float _2319 = _2159;
    float _2321 = _2169;
    float _2323 = _2113;
    float _2325 = _2107;
    float _2327 = _2125;
    float _2329 = fma(_1528, -0.5, 0.5);
    float _2331 = precise::clamp(_2329, 0.0, 1.0);
    float _2333 = -_2317;
    float _2335 = _2333 + _2319;
    float _2337 = _2163 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2339 = -_2321;
    float _2341 = _2339 + _2323;
    float _2343 = fma(_2331, _2335, _2317);
    out.m_89.x = 0.0;
    float _2345 = -_2325;
    float _2347 = _2345 + _2327;
    float _2349 = fma(_2331, _2341, _2321);
    float _2351 = _2343 * 0.586610972881317138671875;
    out.m_49.x = _2337;
    bool _2353 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2355 = fma(_2331, _2347, _2325);
    float _2357 = fma(_2349, 0.298911988735198974609375, _2351);
    bool _2359 = _2135 > 0.0;
    bool _2361 = isnan(_2135);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan(0.0);
    bool _2367 = _2363 || _2365;
    float _2369 = fma(_2355, 0.114477999508380889892578125, _2357);
    float _2371 = -_2369;
    float _2373 = _2349 + _2371;
    float _2375 = -_2369;
    float _2377 = _2343 + _2375;
    float _2379 = -_2369;
    float _2381 = _2355 + _2379;
    float _2383 = fma(_2373, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2369);
    float _2385 = fma(_2377, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2369);
    float _2387 = fma(_2381, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2369);
    bool _2389 = !_2353;
    if (!_2389)
    {
        float _2391 = -_1636;
        float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2395 = -_1638;
        float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2399 = -_1640;
        float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2403 = _2393 * _2393;
        float _2405 = fma(_2397, _2397, _2403);
        float _2407 = fma(_2401, _2401, _2405);
        float _2409 = sqrt(_2407);
        float _2411 = rsqrt(_2407);
        float _2413 = -_2409;
        float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2417 = _2415 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2419 = precise::clamp(_2417, 0.0, 1.0);
        float _2421 = _2397 * _2411;
        float _2423 = _2393 * _2411;
        float _2425 = abs(_2419);
        float _2427 = log2(_2425);
        float _2429 = _2401 * _2411;
        float _2431 = _2421 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2433 = _1528 * _2423;
        float _2435 = -_2423;
        float _2437 = -_2431;
        float _2439 = fma(_2435, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2437);
        float _2441 = fma(_1518, _2421, _2433);
        float _2443 = -_2429;
        float _2445 = fma(_2443, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2439);
        float _2447 = fma(_1542, _2429, _2441);
        float _2449 = precise::clamp(_2447, 0.0, 1.0);
        float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2453 = _2445 + _2451;
        float _2455 = _2427 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2457 = _2453 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2459 = precise::clamp(_2457, 0.0, 1.0);
        float _2461 = exp2(_2455);
        float _2463 = _2461 * _2459;
        float _2465 = _2449 * _2463;
        float _2467 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2469 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2471 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2467;
        out.m_89.y = _2469;
        out.m_89.z = _2471;
    }
    out.m_91.x = _2383;
    out.m_91.y = _2385;
    out.m_91.z = _2387;
    if (_2367)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2473 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2473;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2231 = false;
    bool _1592 = false;
    bool _634 = false;
    bool _442 = false;
    bool _328 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2530 = as_type<float>(_126);
        out.gl_Position.z = _2530;
    }
    if (!_114)
    {
        return out;
    }
    float _130 = in.m_51.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2599 = as_type<float>(_164);
        out.gl_Position.z = _2599;
    }
    if (_158)
    {
        return out;
    }
    float _166 = in.m_53.y;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = in.m_53.z;
    float _172 = in.m_55.y;
    float _174 = in.m_55.z;
    float _176 = in.m_57.y;
    float _178 = in.m_57.z;
    float _180 = _166 * _166;
    float _182 = in.m_53.x;
    float _184 = _170 * _170;
    float _186 = in.m_57.x;
    float _188 = fma(_172, _172, _180);
    float _190 = in.m_55.x;
    float _192 = fma(_174, _174, _184);
    float _194 = fma(_176, _176, _188);
    float _196 = fma(_178, _178, _192);
    float _198 = sqrt(_194);
    float _200 = in.m_59.x;
    float _202 = in.m_59.y;
    float _204 = in.m_59.z;
    float _206 = sqrt(_196);
    bool _208 = _198 > 0.0;
    bool _210 = _206 > 0.0;
    float _212 = _166 * _202;
    float _214 = _176 * _202;
    float _216 = _172 * _202;
    float _218 = 0.0;
    if (_208)
    {
        float _220 = rsqrt(_194);
        _218 = _220;
    }
    float _222 = _218;
    float _224 = fma(_200, _182, _212);
    float _226 = fma(_200, _186, _214);
    float _228 = fma(_200, _190, _216);
    float _230 = 0.0;
    float _232 = _226;
    if (!_208)
    {
        _230 = 0.0;
    }
    float _234 = _230;
    float _236 = fma(_170, _204, _224);
    float _238 = fma(_178, _204, _226);
    float _240 = 0.0;
    float _242 = _234;
    if (!_208)
    {
        _240 = 0.0;
    }
    float _244 = _240;
    float _246 = 0.0;
    float _248 = _244;
    if (_210)
    {
        float _250 = rsqrt(_196);
        _246 = _250;
    }
    float _252 = _246;
    float _254 = 0.0;
    if (!_208)
    {
        _254 = 0.0;
    }
    float _256 = _254;
    float _258 = fma(_174, _204, _228);
    float _260 = 0.0;
    float _262 = _256;
    if (!_210)
    {
        _260 = 0.0;
    }
    float _264 = _260;
    float _266 = _264;
    if (!_210)
    {
        _232 = 0.0;
    }
    float _268 = _232;
    float _270 = 0.0;
    float _272 = _268;
    if (!_210)
    {
        _270 = 0.0;
    }
    float _274 = _270;
    float _276 = _274;
    if (_208)
    {
        float _278 = _222 * _172;
        _242 = _278;
    }
    float _280 = _242;
    float _282 = _280;
    if (_208)
    {
        float _284 = _222 * _166;
        _248 = _284;
    }
    float _286 = _248;
    float _288 = _286;
    if (_208)
    {
        float _290 = _222 * _176;
        _262 = _290;
    }
    float _292 = _262;
    float _294 = _292;
    if (_210)
    {
        float _296 = _252 * _174;
        _266 = _296;
    }
    float _298 = _266;
    if (_210)
    {
        float _300 = _252 * _170;
        _272 = _300;
    }
    float _302 = _272;
    if (_210)
    {
        float _304 = _252 * _178;
        _276 = _304;
    }
    float _306 = _276;
    bool _308 = !_168;
    float _326;
    if (!_308)
    {
        float _310 = in.m_61.x;
        float _312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _314 = _310 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _318 = _316 * _312;
        float _320 = floor(_318);
        float _322 = -_320;
        float _324 = _318 + _322;
        _326 = _324;
        _328 = true;
    }
    else
    {
        float _330 = float(_110);
        float _332 = 1.0 / _330;
        float _334 = _144 * _332;
        _326 = _334;
    }
    _328 = false;
    float _336 = _326;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = _336 + _338;
    bool _342 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _344 = isnan(_336);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _354;
    bool _358 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _360 = isnan(_336);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = -_352;
    float _372 = _370 + 1.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _374;
    float _378 = 1.0 / _356;
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _382 = _368 * _372;
    float _384 = -_368;
    float _386 = _384 + 1.0;
    float _388 = _340 * _378;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = fma(_376, _388, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _396;
    float _400 = fma(_392, _388, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _402 = _394 * _382;
    float _404 = fma(_398, _388, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _406 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].x, _402);
    float _408 = _404 * _382;
    float _410 = _400 * _382;
    float _412 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[144].x, _406);
    float _414 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].y, _408);
    float _416 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].z, _410);
    float _418 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[144].y, _414);
    float _420 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[144].z, _416);
    bool _422 = !_380;
    float _440;
    if (!_422)
    {
        float _424 = in.m_61.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        float _444 = float(_110);
        float _446 = 1.0 / _444;
        float _448 = _144 * _446;
        _440 = _448;
    }
    _442 = false;
    float _450 = _440;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _454 = _450 + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _460 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _462 = isnan(_450);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _480 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _482 = isnan(_450);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = 1.0 / _458;
    float _494 = -_470;
    float _496 = _494 + 1.0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _498;
    bool _502 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _504 = isnan(_450);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = _490 * _496;
    float _516 = -_490;
    float _518 = _516 + 1.0;
    bool _520 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _522 = 1.0 / _474;
    float _524 = _512 * _518;
    float _526 = -_512;
    float _528 = _526 + 1.0;
    float _530 = 1.0 / _478;
    float _532 = _500 * _492;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _538 = fma(_532, _454, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _540 = _536 * _522;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _544 = _450 + _542;
    bool _546 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _548 = isnan(_450);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _558;
    float _562 = _538 * _524;
    float _564 = fma(_540, _544, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _568 = _450 + _566;
    float _570 = -_556;
    float _572 = _570 + 1.0;
    float _574 = _560 * _530;
    float _576 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[115].x, _562);
    float _578 = _470 * _572;
    float _580 = fma(_574, _568, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _582 = fma(_564, _514, _576);
    float _584 = fma(_580, _578, _582);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _588 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[118].x, _584);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _594 = in.m_63.x;
    float _596 = in.m_63.y;
    float _598 = in.m_63.z;
    float _600 = _586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_65.x = _600;
    out.m_65.y = _604;
    out.m_65.z = _602;
    out.m_65.w = _606;
    float _608 = _418 * _596;
    float _610 = _420 * _598;
    float _612 = _412 * _594;
    bool _614 = !_520;
    float _632;
    if (!_614)
    {
        float _616 = in.m_61.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        float _636 = float(_110);
        float _638 = 1.0 / _636;
        float _640 = _144 * _638;
        _632 = _640;
    }
    _634 = false;
    float _642 = _632;
    float _644 = in.m_61.z;
    float _646 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _648 = log2(_646);
    float _650 = in.m_46.x;
    float _652 = in.m_46.y;
    float _654 = in.m_46.z;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _658 = _656 != 0;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _662 = _660 != 0;
    float _664 = in.m_61.x;
    float _666 = in.m_61.y;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _670 = in.m_67.y;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _674 = _672 != 0;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _682 = _680 != 0;
    bool _684 = !_674;
    int _686 = _684 ? 0 : 1;
    bool _688 = !_678;
    int _690 = _688 ? 0 : 1;
    int _692 = abs(_686);
    float _694 = _644 * 2.0;
    bool _696 = !_682;
    int _698 = _696 ? 0 : 1;
    float _700 = _172 * _652;
    float _702 = _166 * _652;
    float _704 = _176 * _652;
    float _706 = floor(_694);
    float _708 = _666 * 2.0;
    float _710 = _664 * 2.0;
    bool _712 = _666 > 0.5;
    float _714 = fma(_190, _650, _700);
    float _716 = -_670;
    float _718 = _716 + 1.0;
    float _720 = _236 * _236;
    float _722 = floor(_708);
    float _724 = fma(_182, _650, _702);
    float _726 = _670;
    if (_658)
    {
        float _728 = _712 ? _718 : _670;
        _726 = _728;
    }
    float _730 = _726;
    float _732 = fma(_186, _650, _704);
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _736 = _664 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _738 = fma(_258, _258, _720);
    float _740 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _742 = floor(_710);
    float _744 = -_734;
    float _746 = fma(_736, 2.0, _744);
    bool _748 = _706 >= 0.0;
    bool _750 = isnan(_706);
    bool _752 = _748 || _750;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    float _758 = fma(_238, _238, _738);
    bool _760 = _706 > 0.0;
    float _762 = _666 + _644;
    int _764 = _756 ? 0 : 1;
    float _766 = fma(_170, _654, _724);
    float _768 = rsqrt(_758);
    float _770 = in.m_69.x;
    float _772 = in.m_69.y;
    float _774 = in.m_69.z;
    bool _776 = _722 >= 0.0;
    bool _778 = isnan(_722);
    bool _780 = _776 || _778;
    bool _782 = isnan(0.0);
    bool _784 = _780 || _782;
    float _786 = _762 + (-1.0);
    int _788 = _784 ? 0 : 1;
    bool _790 = _742 >= 0.0;
    bool _792 = isnan(_742);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    float _800 = _666 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _802 = _722 > 0.0;
    float _804 = _666 + _664;
    int _806 = _798 ? 0 : 1;
    float _808 = fma(_800, -2.0, _668);
    float _810 = _804 + (-1.0);
    bool _812 = _742 > 0.0;
    float _814 = _236 * _768;
    int _816 = ~_788;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _824 = _648 * _144;
    float _826 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _828 = _238 * _768;
    float _830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _770);
    int _832 = _820;
    float _834 = _770;
    if (!_802)
    {
        int _836 = ~_788;
        int _838 = _836 + 1;
        _832 = _838;
    }
    int _840 = _832;
    float _842 = _740 * _830;
    float _844 = _258 * _768;
    float _846 = exp2(_824);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _850 = 1.0 + _848;
    int _852 = ~_806;
    int _854 = _852 + 1;
    int _856 = _854 + 1;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _862 = _856;
    if (!_812)
    {
        int _864 = ~_806;
        int _866 = _864 + 1;
        _862 = _866;
    }
    int _868 = _862;
    float _870 = in.m_71.x;
    float _872 = in.m_71.y;
    float _874 = in.m_71.z;
    float _876 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[78].z, _860);
    int _878 = ~_764;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    float _884 = 1.0 / _850;
    int _886 = _882;
    if (!_760)
    {
        int _888 = ~_764;
        int _890 = _888 + 1;
        _886 = _890;
    }
    int _892 = _886;
    float _894 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[78].w, _858);
    float _896 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _876);
    float _898 = -_144;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[76].x, _746);
    bool _902 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _904 = isnan(1.0);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _910 = _906 || _908;
    float _912 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _808);
    float _914 = -_846;
    float _916 = _914 + 1.0;
    bool _918 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _920 = isnan(0.0);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _926 = _922 || _924;
    float _928 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _894);
    float _930 = float(_692);
    float _932 = _666 + (-0.5);
    float _934 = float(_892);
    int _936 = abs(_690);
    int _938 = abs(_698);
    float _940 = _930 * _934;
    float _942 = _926 ? _916 : 0.0;
    float _944 = in.m_53.w;
    float _946 = float(_868);
    float _948 = float(_938);
    if (_910)
    {
        float _950 = _942 * _884;
        _148 = _950;
    }
    float _952 = _148;
    float _954 = _814 * _286;
    float _956 = float(_936);
    float _958 = _940 * (-2.0);
    float _960 = _664 + (-0.5);
    float _962 = fma(_844, _280, _954);
    float _964 = float(_840);
    float _966 = fma(_958, _870, _870);
    float _968 = _956 * _946;
    float _970 = fma(_828, _292, _962);
    float _972 = fma(_826, _958, _826);
    float _974 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[196].x, _966);
    float _976 = _968 * (-2.0);
    float _978 = _948 * _964;
    float _980 = abs(_970);
    bool _982 = _980 > 0.99989998340606689453125;
    float _984 = fma(_972, _952, _974);
    float _986 = fma(_976, _872, _872);
    float _988 = _644 + _664;
    float _990 = _644 + (-0.5);
    float _992 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[196].y, _986);
    float _994 = _988 + (-1.0);
    float _996 = _978 * (-2.0);
    float _998 = fma(_822, _976, _822);
    float _1000 = _984 * 0.15915493667125701904296875;
    float _1002 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1004 = fma(_996, _874, _874);
    if (_982)
    {
        float _1006 = fma(_298, 0.001000000047497451305389404296875, _280);
        _282 = _1006;
    }
    float _1008 = _282;
    if (_982)
    {
        float _1010 = fma(_306, 0.001000000047497451305389404296875, _292);
        _294 = _1010;
    }
    float _1012 = _294;
    float _1014 = fma(_1002, _996, _1002);
    float _1016 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1004);
    float _1018 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1020 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _772);
    float _1022 = fma(_998, _952, _992);
    float _1024 = fma(_1014, _952, _1016);
    float _1026 = -_1008;
    float _1028 = _828 * _1026;
    float _1030 = _1000 * 6.283185482025146484375;
    float _1032 = sin(_1030);
    if (_982)
    {
        float _1034 = fma(_302, 0.001000000047497451305389404296875, _286);
        _288 = _1034;
    }
    float _1036 = _288;
    float _1038 = -_1012;
    float _1040 = _814 * _1038;
    float _1042 = -_1012;
    float _1044 = -_1028;
    float _1046 = fma(_844, _1042, _1044);
    float _1048 = _1018 * _1020;
    float _1050 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1052 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _774);
    float _1054 = fma(_174, _654, _714);
    float _1056 = _1000 * 6.283185482025146484375;
    float _1058 = cos(_1056);
    float _1060 = -_1036;
    float _1062 = _844 * _1060;
    float _1064 = -_1036;
    float _1066 = -_1040;
    float _1068 = fma(_828, _1064, _1066);
    float _1070 = _1046 * _1046;
    float _1072 = _1022 * 0.15915493667125701904296875;
    float _1074 = in.m_55.w;
    float _1076 = _1024 * 0.15915493667125701904296875;
    float _1078 = _1050 * _1052;
    float _1080 = -_1008;
    float _1082 = -_1062;
    float _1084 = fma(_814, _1080, _1082);
    float _1086 = in.m_57.w;
    float _1088 = fma(_1068, _1068, _1070);
    float _1090 = _1072 * 6.283185482025146484375;
    float _1092 = sin(_1090);
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1098 = fma(_178, _654, _732);
    float _1100 = fma(_1084, _1084, _1088);
    float _1102 = _968;
    if (_662)
    {
        float _1104 = in.m_61.x;
        _1102 = _1104;
    }
    float _1106 = _1102;
    bool _1108 = _772 != 0.0;
    bool _1110 = isnan(_772);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan(0.0);
    bool _1116 = _1112 || _1114;
    float _1118 = _766 + _944;
    float _1120 = _1072 * 6.283185482025146484375;
    float _1122 = cos(_1120);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1124;
    bool _1128 = _770 == 0.0;
    bool _1130 = !_1116;
    bool _1132 = _1128 && _1130;
    bool _1134 = _774 == 0.0;
    bool _1136 = _1134 && _1132;
    float _1138 = _1076 * 6.283185482025146484375;
    float _1140 = cos(_1138);
    float _1142 = _1032 * _1092;
    float _1144 = _1054 + _1074;
    float _1146 = _1098 + _1086;
    float _1148 = _1076 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    float _1152 = _1032 * _1122;
    bool _1154 = _1106 > 0.5;
    bool _1156 = _1154 && _662;
    float _1158 = in.m_67.x;
    float _1160 = 1.0 / _1096;
    float _1162 = _1032 * _1140;
    float _1164 = _1058 * _1122;
    float _1166 = _1122 * _1140;
    float _1168 = _1058 * _1092;
    float _1170 = _1058 * _1140;
    float _1172 = _1092 * _1140;
    float _1174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1176 = fma(_1150, _1164, _1142);
    float _1178 = -_1168;
    float _1180 = fma(_1150, _1152, _1178);
    float _1182 = -_1152;
    float _1184 = fma(_1150, _1168, _1182);
    float _1186 = fma(_1150, _1142, _1164);
    float _1188 = _1176 * _828;
    float _1190 = _1170 * _844;
    float _1192 = _1184 * _828;
    float _1194 = rsqrt(_1100);
    float _1196 = _1126 * _1160;
    float _1198 = _1170 * _828;
    float _1200 = _1184 * _844;
    float _1202 = _1170 * _814;
    float _1204 = _1176 * _814;
    float _1206 = _1184 * _814;
    float _1208 = _1184;
    float _1210 = _1158;
    float _1212 = _1146;
    if (_662)
    {
        _1208 = _1158;
    }
    float _1214 = _1208;
    float _1216 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1218 = fma(_1216, _730, -0.5);
    float _1220 = _1214;
    if (_1156)
    {
        float _1222 = -_1214;
        float _1224 = _1222 + 1.0;
        _1220 = _1224;
    }
    float _1226 = _1220;
    float _1228 = _1046 * _1194;
    float _1230 = _1068 * _1194;
    float _1232 = _1084 * _1194;
    float _1234 = _1176 * _844;
    float _1236 = -_912;
    float _1238 = fma(_928, _1218, _1236);
    float _1240 = -_1150;
    float _1242 = fma(_1240, _1230, _1190);
    float _1244 = fma(_1166, _1232, _1188);
    float _1246 = fma(_1166, _1230, _1234);
    float _1248 = _814 * _1232;
    float _1250 = _844 * _1228;
    float _1252 = fma(_1172, _1232, _1192);
    float _1254 = -_1150;
    float _1256 = fma(_1254, _1232, _1198);
    float _1258 = -_1248;
    float _1260 = fma(_828, _1228, _1258);
    float _1262 = -_1250;
    float _1264 = fma(_814, _1230, _1262);
    float _1266 = fma(_1172, _1230, _1200);
    float _1268 = _828 * _1230;
    float _1270 = fma(_1162, _1260, _1242);
    float _1272 = fma(_1162, _1264, _1256);
    float _1274 = fma(_1180, _1264, _1244);
    float _1276 = fma(_1180, _1260, _1246);
    float _1278 = _1048 * _1270;
    float _1280 = _1048 * _1272;
    float _1282 = fma(_1186, _1260, _1266);
    bool _1284 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1286 = isnan(_642);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    float _1296 = fma(_1186, _1264, _1252);
    float _1298 = fma(_842, _1276, _1278);
    float _1300 = fma(_842, _1274, _1280);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1304 = _642 + _1302;
    bool _1306 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1308 = isnan(_642);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = -_1294;
    float _1320 = _1318 + 1.0;
    float _1322 = fma(_1078, _1282, _1298);
    float _1324 = fma(_1078, _1296, _1300);
    float _1326 = fma(_1196, _1304, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1328 = _1316 * _1320;
    float _1330 = _1144 + _1322;
    float _1332 = _1146 + _1324;
    float _1334 = in.m_73.x;
    float _1336 = in.m_73.y;
    float _1338 = in.m_73.z;
    float _1340 = _1326 * _1328;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1344 = _1330 + _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1348 = _1332 + _1346;
    float _1350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1352 = -_1150;
    float _1354 = fma(_1352, _1228, _1202);
    float _1356 = _1344 * _1344;
    float _1358 = _1348 * _1348;
    float _1360 = -_1268;
    float _1362 = fma(_844, _1232, _1360);
    float _1364 = fma(_1166, _1228, _1204);
    float _1366 = fma(_1172, _1228, _1206);
    float _1368 = _1356 + _1358;
    float _1370 = fma(_1162, _1362, _1354);
    float _1372 = fma(_1180, _1362, _1364);
    float _1374 = fma(_1186, _1362, _1366);
    float _1376 = sqrt(_1368);
    float _1378 = _1048 * _1370;
    float _1380 = _1356;
    float _1382 = _1358;
    float _1384 = _1330;
    float _1386 = _1332;
    float _1388 = _1296;
    if (_662)
    {
        _1210 = _1226;
    }
    float _1390 = _1210;
    float _1392 = -_1316;
    float _1394 = _1392 + 1.0;
    float _1396 = fma(_842, _1372, _1378);
    float _1398 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1400 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1340);
    float _1402 = fma(_1078, _1374, _1396);
    float _1404 = fma(_1398, _1390, -0.5);
    float _1406 = _1334;
    float _1408 = _1336;
    float _1410 = _1338;
    if (!_1136)
    {
        float _1412 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1334);
        _1406 = _1412;
    }
    float _1414 = _1406;
    if (!_1136)
    {
        float _1416 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1336);
        _1408 = _1416;
    }
    float _1418 = _1408;
    float _1420 = _1118 + _1402;
    float _1422 = fma(_896, _1404, _900);
    if (!_1136)
    {
        float _1424 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1338);
        _1410 = _1424;
    }
    float _1426 = _1410;
    bool _1428 = _1376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1430 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1400);
    if (!_1428)
    {
        _834 = _1420;
    }
    float _1432 = _834;
    bool _1434 = !_1428;
    float _1436 = _1432;
    if (!_1434)
    {
        float _1438 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1442 = _1376 + _1440;
        float _1444 = _1420 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1446 = rsqrt(_1368);
        float _1448 = _1442 * _1438;
        float _1450 = _1448 * 0.15915493667125701904296875;
        float _1452 = _1450 * 6.283185482025146484375;
        float _1454 = sin(_1452);
        float _1456 = _1450 * 6.283185482025146484375;
        float _1458 = cos(_1456);
        float _1460 = fma(_1454, _1444, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1462 = _1446 * _1460;
        float _1464 = _1458 + (-1.0);
        float _1466 = fma(_1344, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1468 = fma(_1348, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1470 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1474 = _1466 + _1472;
        float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1478 = _1468 + _1476;
        float _1480 = fma(_1420, _1458, _1470);
        float _1482 = _1474 * _1474;
        float _1484 = _1478 * _1478;
        _1436 = _1480;
        _1380 = _1482;
        _1382 = _1484;
        _1384 = _1466;
        _1386 = _1468;
    }
    float _1486 = _1436;
    float _1488 = _1380;
    float _1490 = _1382;
    float _1492 = _1384;
    float _1494 = _1386;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1498 = _1486 + _1496;
    float _1500 = in.m_75.x;
    float _1502 = _1270 * _1418;
    float _1504 = _1370 * _1418;
    float _1506 = fma(_1498, _1498, _1488);
    float _1508 = _1272 * _1418;
    float _1510 = fma(_1276, _1414, _1502);
    float _1512 = _1506 + _1490;
    float _1514 = fma(_1274, _1414, _1508);
    float _1516 = fma(_1372, _1414, _1504);
    float _1518 = fma(_1282, _1426, _1510);
    float _1520 = sqrt(_1512);
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1528 = fma(_1374, _1426, _1516);
    float _1530 = _1522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1532 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1534 = _1526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1536 = _1238 + 0.5;
    float _1538 = _1430 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1540 = _1422 + 0.5;
    float _1542 = fma(_1296, _1426, _1514);
    out.m_77.x = _1500;
    out.m_79.x = _1530;
    out.m_79.y = _1532;
    out.m_79.z = _1534;
    out.m_79.w = _1538;
    bool _1544 = _1520 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1546 = isnan(_1520);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1552 = _1548 || _1550;
    out.m_81.x = _1540;
    out.m_81.y = _1536;
    out.m_83.x = _1518;
    out.m_83.y = _1528;
    out.m_83.z = _1542;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1556 = _1510;
    if (!_1552)
    {
        _1554 = 1.0;
    }
    float _1558 = _1554;
    bool _1560 = !_1552;
    float _1562 = _1558;
    if (!_1560)
    {
        bool _1564 = _1520 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1566 = isnan(_1520);
        bool _1568 = _1564 || _1566;
        bool _1570 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1572 = _1568 || _1570;
        if (!_1572)
        {
            float _1574 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1576 = _1520 + _1574;
            float _1578 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1580 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1578;
            float _1582 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1584 = _1582 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1586 = 1.0 / _1580;
            float _1588 = _1576 * _1586;
            float _1590 = fma(_1588, _1584, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1562 = _1590;
            _1592 = true;
        }
        else
        {
            bool _1594 = _1520 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1596 = isnan(_1520);
            bool _1598 = _1594 || _1596;
            bool _1600 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1602 = _1598 || _1600;
            if (!_1602)
            {
                float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1606 = _1520 + _1604;
                float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1610 = _1608 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1614 = _1612 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1616 = 1.0 / _1610;
                float _1618 = _1606 * _1616;
                float _1620 = fma(_1618, _1614, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1562 = _1620;
                _1592 = true;
            }
            else
            {
                _1562 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1592 = false;
    float _1622 = _1562;
    float _1624 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1626 = _1486 + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1630 = _1492 + _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1634 = _1494 + _1632;
    float _1636 = fma(_1626, _1622, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1638 = fma(_1630, _1622, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1640 = fma(_1634, _1622, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1644 = _1636 + _1642;
    float _1646 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1648 = _1638 + _1646;
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1652 = _1640 + _1650;
    float _1654 = _1644 * _1644;
    float _1656 = fma(_1648, _1648, _1654);
    float _1658 = fma(_1652, _1652, _1656);
    float _1660 = rsqrt(_1658);
    float _1662 = sqrt(_1658);
    float _1664 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1666 = _1648 * _1664;
    float _1668 = _1652 * _1664;
    float _1670 = _1666 * _1666;
    float _1672 = _1668 * _1668;
    float _1674 = _1670 + _1672;
    float _1676 = sqrt(_1674);
    bool _1678 = _1676 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1682 = _1676 + _1680;
    float _1684 = _1652;
    float _1686 = _1660;
    float _1688 = _1682;
    float _1690 = _1644;
    if (_1678)
    {
        float _1692 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1684 = _1692;
    }
    float _1694 = _1684;
    if (_1678)
    {
        float _1696 = rsqrt(_1674);
        _1686 = _1696;
    }
    float _1698 = _1686;
    float _1700 = _1698;
    if (_1678)
    {
        float _1702 = _1682 * _1694;
        _1688 = _1702;
    }
    float _1704 = _1688;
    if (_1678)
    {
        float _1706 = _1704 * 0.15915493667125701904296875;
        _1388 = _1706;
    }
    float _1708 = _1388;
    float _1710 = _1694;
    float _1712 = _1708;
    if (_1678)
    {
        float _1714 = _1708 * 6.283185482025146484375;
        float _1716 = sin(_1714);
        _1710 = _1716;
    }
    float _1718 = _1710;
    float _1720 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1722 = precise::max(0.0, _1720);
    float _1724 = _1634;
    float _1726 = _1722;
    if (_1678)
    {
        float _1728 = _1708 * 6.283185482025146484375;
        float _1730 = cos(_1728);
        _1724 = _1730;
    }
    float _1732 = _1724;
    float _1734 = -_1664;
    float _1736 = -_1722;
    float _1738 = fma(_1644, _1734, _1736);
    if (!_1678)
    {
        _1690 = _1668;
    }
    float _1740 = _1690;
    float _1742 = _1740;
    if (_1678)
    {
        float _1744 = _1738 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1726 = _1744;
    }
    float _1746 = _1726;
    float _1748 = _1718;
    float _1750 = _1746;
    if (_1678)
    {
        float _1752 = fma(_1718, _1746, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1748 = _1752;
    }
    float _1754 = _1748;
    float _1756 = _1754;
    float _1758 = _1732;
    if (_1678)
    {
        float _1760 = _1732 + (-1.0);
        _1750 = _1760;
    }
    float _1762 = _1750;
    float _1764 = _1762;
    if (_1678)
    {
        float _1766 = _1698 * _1754;
        _1556 = _1766;
    }
    float _1768 = _1556;
    if (!_1678)
    {
        _1700 = _1666;
    }
    float _1770 = _1700;
    float _1772 = _1770;
    if (_1678)
    {
        float _1774 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1712 = _1774;
    }
    float _1776 = _1712;
    if (_1678)
    {
        float _1778 = _1666 * _1768;
        _1772 = _1778;
    }
    float _1780 = _1772;
    if (!_1678)
    {
        _1756 = _1738;
    }
    float _1782 = _1756;
    float _1784 = _1782;
    if (_1678)
    {
        float _1786 = _1668 * _1768;
        _1742 = _1786;
    }
    float _1788 = _1742;
    if (!_1678)
    {
        _1764 = _1670;
    }
    float _1790 = _1764;
    float _1792 = _1790;
    if (_1678)
    {
        float _1794 = fma(_1738, _1732, _1776);
        _1784 = _1794;
    }
    float _1796 = _1784;
    if (_1678)
    {
        float _1798 = _1780 * _1780;
        _1792 = _1798;
    }
    float _1800 = _1792;
    if (!_1678)
    {
        _1758 = _1672;
    }
    float _1802 = _1758;
    float _1804 = _1802;
    if (_1678)
    {
        float _1806 = _1788 * _1788;
        _1804 = _1806;
    }
    float _1808 = _1804;
    float _1810 = fma(_1796, _1796, _1800);
    float _1812 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1814 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1816 = _1810 + _1808;
    float _1818 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1820 = fma(_1662, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1818);
    float _1822 = precise::clamp(_1820, 0.0, 1.0);
    float _1824 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1812);
    float _1826 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1828 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1830 = -_1822;
    float _1832 = _1830 + 1.0;
    float _1834 = rsqrt(_1816);
    float _1836 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1824);
    float _1838 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1840 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1826);
    float _1842 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1828);
    float _1844 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1846 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1838);
    float _1848 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1840);
    float _1850 = abs(_1832);
    float _1852 = log2(_1850);
    float _1854 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1842);
    float _1856 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1858 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1846);
    float _1860 = _1848 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1862 = -_1856;
    float _1864 = fma(_1862, _1814, 1.0);
    float _1866 = _1858 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1868 = _1834 * _1780;
    float _1870 = _1854 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1872 = _1834 * _1796;
    float _1874 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1876 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1878 = _1834 * _1788;
    float _1880 = log2(_1864);
    float _1882 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1874);
    float _1884 = -_1876;
    float _1886 = fma(_1872, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1884);
    float _1888 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1890 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1882);
    float _1892 = -_1878;
    float _1894 = fma(_1892, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1886);
    float _1896 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1898 = exp2(_1888);
    float _1900 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1890);
    float _1902 = fma(_1894, -0.5, 0.5);
    float _1904 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1906 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1896);
    float _1908 = fma(_1894, 0.5, 0.5);
    float _1910 = _1872 + 1.0;
    float _1912 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1904);
    float _1914 = 1.0 / _1900;
    float _1916 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1906);
    float _1918 = fma(_1908, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1920 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1912);
    float _1922 = _1880 * 0.693147182464599609375;
    float _1924 = fma(_1908, _1918, -0.212114393711090087890625);
    float _1926 = sqrt(_1902);
    float _1928 = -_1872;
    float _1930 = fma(_1898, _1910, _1928);
    float _1932 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1916);
    float _1934 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1920);
    float _1936 = fma(_1908, _1924, 1.570728778839111328125);
    float _1938 = _1922 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1940 = fma(_1930, 0.5, 0.5);
    float _1942 = _1932 * _1914;
    float _1944 = _1934 * _1914;
    float _1946 = fma(_1942, 0.5, 0.5);
    float _1948 = fma(_1944, -0.5, 0.5);
    float _1950 = _1926 * 0.636619746685028076171875;
    float3 _5398 = float3(_1946, _1948, _1938);
    float _1952 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5398, float3(0.0), isnan(_5398)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5398, float3(0.0), isnan(_5398)), level(0.0)).x;
    float _1954 = -_1936;
    float _1956 = fma(_1950, _1954, 1.0);
    float2 _5414 = float2(_1956, _1940);
    float3 _1960 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5414, float2(0.0), isnan(_5414)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5414, float2(0.0), isnan(_5414)), level(0.0)).xyz;
    float _1962 = _1960.x;
    float _1964 = _1960.y;
    float _1966 = _1960.z;
    float3 _5431 = float3(_1946, _1948, _1938);
    float4 _1969 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5431, float3(0.0), isnan(_5431)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5431, float3(0.0), isnan(_5431)), level(0.0)).xyzw;
    float _1971 = _1969.x;
    float _1973 = _1969.y;
    float _1975 = _1969.z;
    float _1977 = _1969.w;
    float _1979 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1981 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1983 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1985 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1987 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1979);
    float _1989 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1981);
    bool _1991 = _1662 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1993 = isnan(_1662);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1999 = _1995 || _1997;
    float _2001 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1985);
    float _2003 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1987);
    float _2005 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1989);
    float _2007 = exp2(_1983);
    float _2009 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2001);
    float _2011 = _2003 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2013 = _2005 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2015 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2017 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2019 = _2015 || _2017;
    bool _2021 = isnan(0.5);
    bool _2023 = _2019 || _2021;
    float _2025 = 1.0 / _2011;
    float _2027 = _2013 + _2011;
    float _2029 = _1866;
    float _2031 = _1900;
    if (!_2023)
    {
        _1212 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2033 = _1212;
    if (!_2023)
    {
        _2029 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2035 = _2029;
    float _2037 = _2027 * _2025;
    float _2039 = _2037 * 0.5;
    float _2041 = _2025;
    if (!_2023)
    {
        float _2043 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2045 = fma(_2039, _2033, _2043);
        _2041 = _2045;
    }
    float _2047 = _2041;
    float _2049 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2009);
    float _2051 = -_2007;
    float _2053 = _2051 + 1.0;
    float _2055 = _2049 + _1900;
    float _2057 = _2047;
    float _2059 = _2053;
    float _2061 = _2049;
    float _2063 = _1932;
    if (!_2023)
    {
        float _2065 = 1.0 / _2047;
        _2057 = _2065;
    }
    float _2067 = _2057;
    out.gl_Position.x = _1932;
    out.gl_Position.y = _1934;
    out.gl_Position.z = _2049;
    out.gl_Position.w = _1900;
    float _2069 = _2055 * 0.5;
    float _2071 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2073 = _2071;
    if (!_2023)
    {
        float _2075 = -_2035;
        float _2077 = _2075 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2059 = _2077;
    }
    float _2079 = _2059;
    float _2081 = -_2071;
    float _2083 = _2081 + 1.0;
    out.m_85.z = _2069;
    out.m_85.w = _1900;
    float _2085 = _1934;
    if (!_2023)
    {
        float _2087 = 1.0 / _2079;
        _2085 = _2087;
    }
    float _2089 = _2085;
    float _2091 = _2067;
    if (!_2023)
    {
        float _2093 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2095 = -_2035;
        float _2097 = fma(_2067, _2093, _2095);
        _2091 = _2097;
    }
    float _2099 = _2091;
    float _2101 = _2099;
    if (!_1999)
    {
        _2031 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2103 = _2031;
    float _2105 = _2103;
    float _2107 = _2103;
    if (!_1999)
    {
        _2061 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2109 = _2061;
    float _2111 = _2109;
    float _2113 = _2109;
    if (!_1999)
    {
        _2063 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2115 = _2063;
    float _2117 = _2071 * _1952;
    float _2119 = _2089;
    float _2121 = _1973;
    float _2123 = _2115;
    float _2125 = _2115;
    if (_2023)
    {
        _2073 = 1.0;
    }
    float _2127 = _2073;
    float _2129 = _2127;
    if (!_2023)
    {
        float _2131 = _2099 * _2089;
        float _2133 = precise::clamp(_2131, 0.0, 1.0);
        _2129 = _2133;
    }
    float _2135 = _2129;
    if (!_1999)
    {
        _2101 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2137 = _2101;
    float _2139 = _2137;
    float _2141 = _2137;
    if (!_1999)
    {
        _2119 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2143 = _2119;
    float _2145 = _1966 * _2117;
    float _2147 = _1977 * _2117;
    float _2149 = _1977 * _2083;
    float _2151 = fma(_1977, _2145, _1975);
    float _2153 = fma(_1962, _2147, _1971);
    float _2155 = fma(_1964, _2147, _1973);
    float _2157 = _2143;
    float _2159 = _2143;
    if (!_1999)
    {
        _2121 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2161 = _2121;
    float _2163 = _2135 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_87.x = _2153;
    out.m_87.y = _2155;
    out.m_87.z = _2151;
    out.m_87.w = _2149;
    bool _2165 = !_1999;
    float _2167 = _2161;
    float _2169 = _2161;
    if (!_2165)
    {
        bool _2171 = _1662 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2173 = isnan(_1662);
        bool _2175 = _2171 || _2173;
        bool _2177 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2179 = _2175 || _2177;
        if (!_2179)
        {
            float _2181 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2183 = _1662 + _2181;
            float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2187 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2185;
            float _2189 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2193 = 1.0 / _2187;
            float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2207 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2209 = _2207 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2211 = _2183 * _2193;
            float _2213 = precise::clamp(_2211, 0.0, 1.0);
            float _2215 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2217 = _2215 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2219 = fma(_2213, _2191, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2221 = fma(_2213, _2217, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2223 = fma(_2213, _2197, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2225 = fma(_2213, _2201, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2227 = fma(_2213, _2205, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2229 = fma(_2213, _2209, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2141 = _2223;
            _2159 = _2227;
            _2169 = _2219;
            _2113 = _2225;
            _2107 = _2221;
            _2125 = _2229;
            _2231 = true;
        }
        else
        {
            bool _2233 = _1662 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2235 = isnan(_1662);
            bool _2237 = _2233 || _2235;
            bool _2239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2241 = _2237 || _2239;
            if (!_2241)
            {
                _2167 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2243 = _2167;
            _2169 = _2243;
            if (!_2241)
            {
                _2139 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2245 = _2139;
            _2141 = _2245;
            if (!_2241)
            {
                _2105 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2247 = _2105;
            _2107 = _2247;
            if (!_2241)
            {
                _2111 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2249 = _2111;
            _2113 = _2249;
            if (!_2241)
            {
                _2157 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2251 = _2157;
            _2159 = _2251;
            if (!_2241)
            {
                _2123 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2253 = _2123;
            bool _2255 = !_2241;
            _2125 = _2253;
            if (!_2255)
            {
                bool _2257 = _1662 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2259 = isnan(_1662);
                bool _2261 = _2257 || _2259;
                bool _2263 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2265 = _2261 || _2263;
                if (!_2265)
                {
                    float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2269 = _1662 + _2267;
                    float _2271 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2273 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2271;
                    float _2275 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2279 = 1.0 / _2273;
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2289 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2295 = _2293 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2297 = _2269 * _2279;
                    float _2299 = precise::clamp(_2297, 0.0, 1.0);
                    float _2301 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2305 = fma(_2299, _2277, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2307 = fma(_2299, _2303, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2309 = fma(_2299, _2283, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2311 = fma(_2299, _2287, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2313 = fma(_2299, _2291, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2315 = fma(_2299, _2295, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2141 = _2309;
                    _2159 = _2313;
                    _2169 = _2305;
                    _2113 = _2311;
                    _2107 = _2307;
                    _2125 = _2315;
                    _2231 = true;
                }
                else
                {
                    _2141 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2159 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2169 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2113 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2107 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2125 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2231 = false;
    float _2317 = _2141;
    float _2319 = _2159;
    float _2321 = _2169;
    float _2323 = _2113;
    float _2325 = _2107;
    float _2327 = _2125;
    float _2329 = fma(_1528, -0.5, 0.5);
    float _2331 = precise::clamp(_2329, 0.0, 1.0);
    float _2333 = -_2317;
    float _2335 = _2333 + _2319;
    float _2337 = _2163 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2339 = -_2321;
    float _2341 = _2339 + _2323;
    float _2343 = fma(_2331, _2335, _2317);
    out.m_89.x = 0.0;
    float _2345 = -_2325;
    float _2347 = _2345 + _2327;
    float _2349 = fma(_2331, _2341, _2321);
    float _2351 = _2343 * 0.586610972881317138671875;
    out.m_49.x = _2337;
    bool _2353 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2355 = fma(_2331, _2347, _2325);
    float _2357 = fma(_2349, 0.298911988735198974609375, _2351);
    bool _2359 = _2135 > 0.0;
    bool _2361 = isnan(_2135);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan(0.0);
    bool _2367 = _2363 || _2365;
    float _2369 = fma(_2355, 0.114477999508380889892578125, _2357);
    float _2371 = -_2369;
    float _2373 = _2349 + _2371;
    float _2375 = -_2369;
    float _2377 = _2343 + _2375;
    float _2379 = -_2369;
    float _2381 = _2355 + _2379;
    float _2383 = fma(_2373, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2369);
    float _2385 = fma(_2377, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2369);
    float _2387 = fma(_2381, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2369);
    bool _2389 = !_2353;
    if (!_2389)
    {
        float _2391 = -_1636;
        float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2395 = -_1638;
        float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2399 = -_1640;
        float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2403 = _2393 * _2393;
        float _2405 = fma(_2397, _2397, _2403);
        float _2407 = fma(_2401, _2401, _2405);
        float _2409 = sqrt(_2407);
        float _2411 = rsqrt(_2407);
        float _2413 = -_2409;
        float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2417 = _2415 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2419 = precise::clamp(_2417, 0.0, 1.0);
        float _2421 = _2397 * _2411;
        float _2423 = _2393 * _2411;
        float _2425 = abs(_2419);
        float _2427 = log2(_2425);
        float _2429 = _2401 * _2411;
        float _2431 = _2421 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2433 = _1528 * _2423;
        float _2435 = -_2423;
        float _2437 = -_2431;
        float _2439 = fma(_2435, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2437);
        float _2441 = fma(_1518, _2421, _2433);
        float _2443 = -_2429;
        float _2445 = fma(_2443, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2439);
        float _2447 = fma(_1542, _2429, _2441);
        float _2449 = precise::clamp(_2447, 0.0, 1.0);
        float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2453 = _2445 + _2451;
        float _2455 = _2427 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2457 = _2453 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2459 = precise::clamp(_2457, 0.0, 1.0);
        float _2461 = exp2(_2455);
        float _2463 = _2461 * _2459;
        float _2465 = _2449 * _2463;
        float _2467 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2469 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2471 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2467;
        out.m_89.y = _2469;
        out.m_89.z = _2471;
    }
    out.m_91.x = _2383;
    out.m_91.y = _2385;
    out.m_91.z = _2387;
    if (_2367)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2473 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2473;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2231 = false;
    bool _1592 = false;
    bool _634 = false;
    bool _442 = false;
    bool _328 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2530 = as_type<float>(_126);
        out.gl_Position.z = _2530;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_51.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2599 = as_type<float>(_164);
        out.gl_Position.z = _2599;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_53.y;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = in.m_53.z;
    float _172 = in.m_55.y;
    float _174 = in.m_55.z;
    float _176 = in.m_57.y;
    float _178 = in.m_57.z;
    float _180 = _166 * _166;
    float _182 = in.m_53.x;
    float _184 = _170 * _170;
    float _186 = in.m_57.x;
    float _188 = fma(_172, _172, _180);
    float _190 = in.m_55.x;
    float _192 = fma(_174, _174, _184);
    float _194 = fma(_176, _176, _188);
    float _196 = fma(_178, _178, _192);
    float _198 = sqrt(_194);
    float _200 = in.m_59.x;
    float _202 = in.m_59.y;
    float _204 = in.m_59.z;
    float _206 = sqrt(_196);
    bool _208 = _198 > 0.0;
    bool _210 = _206 > 0.0;
    float _212 = _166 * _202;
    float _214 = _176 * _202;
    float _216 = _172 * _202;
    float _218 = 0.0;
    if (_208)
    {
        float _220 = rsqrt(_194);
        _218 = _220;
    }
    float _222 = _218;
    float _224 = fma(_200, _182, _212);
    float _226 = fma(_200, _186, _214);
    float _228 = fma(_200, _190, _216);
    float _230 = 0.0;
    float _232 = _226;
    if (!_208)
    {
        _230 = 0.0;
    }
    float _234 = _230;
    float _236 = fma(_170, _204, _224);
    float _238 = fma(_178, _204, _226);
    float _240 = 0.0;
    float _242 = _234;
    if (!_208)
    {
        _240 = 0.0;
    }
    float _244 = _240;
    float _246 = 0.0;
    float _248 = _244;
    if (_210)
    {
        float _250 = rsqrt(_196);
        _246 = _250;
    }
    float _252 = _246;
    float _254 = 0.0;
    if (!_208)
    {
        _254 = 0.0;
    }
    float _256 = _254;
    float _258 = fma(_174, _204, _228);
    float _260 = 0.0;
    float _262 = _256;
    if (!_210)
    {
        _260 = 0.0;
    }
    float _264 = _260;
    float _266 = _264;
    if (!_210)
    {
        _232 = 0.0;
    }
    float _268 = _232;
    float _270 = 0.0;
    float _272 = _268;
    if (!_210)
    {
        _270 = 0.0;
    }
    float _274 = _270;
    float _276 = _274;
    if (_208)
    {
        float _278 = _222 * _172;
        _242 = _278;
    }
    float _280 = _242;
    float _282 = _280;
    if (_208)
    {
        float _284 = _222 * _166;
        _248 = _284;
    }
    float _286 = _248;
    float _288 = _286;
    if (_208)
    {
        float _290 = _222 * _176;
        _262 = _290;
    }
    float _292 = _262;
    float _294 = _292;
    if (_210)
    {
        float _296 = _252 * _174;
        _266 = _296;
    }
    float _298 = _266;
    if (_210)
    {
        float _300 = _252 * _170;
        _272 = _300;
    }
    float _302 = _272;
    if (_210)
    {
        float _304 = _252 * _178;
        _276 = _304;
    }
    float _306 = _276;
    bool _308 = !_168;
    float _326;
    if (!_308)
    {
        float _310 = in.m_61.x;
        float _312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _314 = _310 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _318 = _316 * _312;
        float _320 = floor(_318);
        float _322 = -_320;
        float _324 = _318 + _322;
        _326 = _324;
        _328 = true;
    }
    else
    {
        float _330 = float(_110);
        float _332 = 1.0 / _330;
        float _334 = _144 * _332;
        _326 = _334;
    }
    _328 = false;
    float _336 = _326;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = _336 + _338;
    bool _342 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _344 = isnan(_336);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _354;
    bool _358 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _360 = isnan(_336);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = -_352;
    float _372 = _370 + 1.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _374;
    float _378 = 1.0 / _356;
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _382 = _368 * _372;
    float _384 = -_368;
    float _386 = _384 + 1.0;
    float _388 = _340 * _378;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = fma(_376, _388, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _396;
    float _400 = fma(_392, _388, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _402 = _394 * _382;
    float _404 = fma(_398, _388, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _406 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].x, _402);
    float _408 = _404 * _382;
    float _410 = _400 * _382;
    float _412 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[144].x, _406);
    float _414 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].y, _408);
    float _416 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].z, _410);
    float _418 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[144].y, _414);
    float _420 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[144].z, _416);
    bool _422 = !_380;
    float _440;
    if (!_422)
    {
        float _424 = in.m_61.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        float _444 = float(_110);
        float _446 = 1.0 / _444;
        float _448 = _144 * _446;
        _440 = _448;
    }
    _442 = false;
    float _450 = _440;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _454 = _450 + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _460 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _462 = isnan(_450);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _480 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _482 = isnan(_450);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = 1.0 / _458;
    float _494 = -_470;
    float _496 = _494 + 1.0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _498;
    bool _502 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _504 = isnan(_450);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = _490 * _496;
    float _516 = -_490;
    float _518 = _516 + 1.0;
    bool _520 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _522 = 1.0 / _474;
    float _524 = _512 * _518;
    float _526 = -_512;
    float _528 = _526 + 1.0;
    float _530 = 1.0 / _478;
    float _532 = _500 * _492;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _538 = fma(_532, _454, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _540 = _536 * _522;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _544 = _450 + _542;
    bool _546 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _548 = isnan(_450);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _558;
    float _562 = _538 * _524;
    float _564 = fma(_540, _544, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _568 = _450 + _566;
    float _570 = -_556;
    float _572 = _570 + 1.0;
    float _574 = _560 * _530;
    float _576 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[115].x, _562);
    float _578 = _470 * _572;
    float _580 = fma(_574, _568, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _582 = fma(_564, _514, _576);
    float _584 = fma(_580, _578, _582);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _588 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[118].x, _584);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _594 = in.m_63.x;
    float _596 = in.m_63.y;
    float _598 = in.m_63.z;
    float _600 = _586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_65.x = _600;
    out.m_65.y = _604;
    out.m_65.z = _602;
    out.m_65.w = _606;
    float _608 = _418 * _596;
    float _610 = _420 * _598;
    float _612 = _412 * _594;
    bool _614 = !_520;
    float _632;
    if (!_614)
    {
        float _616 = in.m_61.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        float _636 = float(_110);
        float _638 = 1.0 / _636;
        float _640 = _144 * _638;
        _632 = _640;
    }
    _634 = false;
    float _642 = _632;
    float _644 = in.m_61.z;
    float _646 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _648 = log2(_646);
    float _650 = in.m_46.x;
    float _652 = in.m_46.y;
    float _654 = in.m_46.z;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _658 = _656 != 0;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _662 = _660 != 0;
    float _664 = in.m_61.x;
    float _666 = in.m_61.y;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _670 = in.m_67.y;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _674 = _672 != 0;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _682 = _680 != 0;
    bool _684 = !_674;
    int _686 = _684 ? 0 : 1;
    bool _688 = !_678;
    int _690 = _688 ? 0 : 1;
    int _692 = abs(_686);
    float _694 = _644 * 2.0;
    bool _696 = !_682;
    int _698 = _696 ? 0 : 1;
    float _700 = _172 * _652;
    float _702 = _166 * _652;
    float _704 = _176 * _652;
    float _706 = floor(_694);
    float _708 = _666 * 2.0;
    float _710 = _664 * 2.0;
    bool _712 = _666 > 0.5;
    float _714 = fma(_190, _650, _700);
    float _716 = -_670;
    float _718 = _716 + 1.0;
    float _720 = _236 * _236;
    float _722 = floor(_708);
    float _724 = fma(_182, _650, _702);
    float _726 = _670;
    if (_658)
    {
        float _728 = _712 ? _718 : _670;
        _726 = _728;
    }
    float _730 = _726;
    float _732 = fma(_186, _650, _704);
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _736 = _664 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _738 = fma(_258, _258, _720);
    float _740 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _742 = floor(_710);
    float _744 = -_734;
    float _746 = fma(_736, 2.0, _744);
    bool _748 = _706 >= 0.0;
    bool _750 = isnan(_706);
    bool _752 = _748 || _750;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    float _758 = fma(_238, _238, _738);
    bool _760 = _706 > 0.0;
    float _762 = _666 + _644;
    int _764 = _756 ? 0 : 1;
    float _766 = fma(_170, _654, _724);
    float _768 = rsqrt(_758);
    float _770 = in.m_69.x;
    float _772 = in.m_69.y;
    float _774 = in.m_69.z;
    bool _776 = _722 >= 0.0;
    bool _778 = isnan(_722);
    bool _780 = _776 || _778;
    bool _782 = isnan(0.0);
    bool _784 = _780 || _782;
    float _786 = _762 + (-1.0);
    int _788 = _784 ? 0 : 1;
    bool _790 = _742 >= 0.0;
    bool _792 = isnan(_742);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    float _800 = _666 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _802 = _722 > 0.0;
    float _804 = _666 + _664;
    int _806 = _798 ? 0 : 1;
    float _808 = fma(_800, -2.0, _668);
    float _810 = _804 + (-1.0);
    bool _812 = _742 > 0.0;
    float _814 = _236 * _768;
    int _816 = ~_788;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _824 = _648 * _144;
    float _826 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _828 = _238 * _768;
    float _830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _770);
    int _832 = _820;
    float _834 = _770;
    if (!_802)
    {
        int _836 = ~_788;
        int _838 = _836 + 1;
        _832 = _838;
    }
    int _840 = _832;
    float _842 = _740 * _830;
    float _844 = _258 * _768;
    float _846 = exp2(_824);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _850 = 1.0 + _848;
    int _852 = ~_806;
    int _854 = _852 + 1;
    int _856 = _854 + 1;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _862 = _856;
    if (!_812)
    {
        int _864 = ~_806;
        int _866 = _864 + 1;
        _862 = _866;
    }
    int _868 = _862;
    float _870 = in.m_71.x;
    float _872 = in.m_71.y;
    float _874 = in.m_71.z;
    float _876 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[78].z, _860);
    int _878 = ~_764;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    float _884 = 1.0 / _850;
    int _886 = _882;
    if (!_760)
    {
        int _888 = ~_764;
        int _890 = _888 + 1;
        _886 = _890;
    }
    int _892 = _886;
    float _894 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[78].w, _858);
    float _896 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _876);
    float _898 = -_144;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[76].x, _746);
    bool _902 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _904 = isnan(1.0);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _910 = _906 || _908;
    float _912 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _808);
    float _914 = -_846;
    float _916 = _914 + 1.0;
    bool _918 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _920 = isnan(0.0);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _926 = _922 || _924;
    float _928 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _894);
    float _930 = float(_692);
    float _932 = _666 + (-0.5);
    float _934 = float(_892);
    int _936 = abs(_690);
    int _938 = abs(_698);
    float _940 = _930 * _934;
    float _942 = _926 ? _916 : 0.0;
    float _944 = in.m_53.w;
    float _946 = float(_868);
    float _948 = float(_938);
    if (_910)
    {
        float _950 = _942 * _884;
        _148 = _950;
    }
    float _952 = _148;
    float _954 = _814 * _286;
    float _956 = float(_936);
    float _958 = _940 * (-2.0);
    float _960 = _664 + (-0.5);
    float _962 = fma(_844, _280, _954);
    float _964 = float(_840);
    float _966 = fma(_958, _870, _870);
    float _968 = _956 * _946;
    float _970 = fma(_828, _292, _962);
    float _972 = fma(_826, _958, _826);
    float _974 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[196].x, _966);
    float _976 = _968 * (-2.0);
    float _978 = _948 * _964;
    float _980 = abs(_970);
    bool _982 = _980 > 0.99989998340606689453125;
    float _984 = fma(_972, _952, _974);
    float _986 = fma(_976, _872, _872);
    float _988 = _644 + _664;
    float _990 = _644 + (-0.5);
    float _992 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[196].y, _986);
    float _994 = _988 + (-1.0);
    float _996 = _978 * (-2.0);
    float _998 = fma(_822, _976, _822);
    float _1000 = _984 * 0.15915493667125701904296875;
    float _1002 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1004 = fma(_996, _874, _874);
    if (_982)
    {
        float _1006 = fma(_298, 0.001000000047497451305389404296875, _280);
        _282 = _1006;
    }
    float _1008 = _282;
    if (_982)
    {
        float _1010 = fma(_306, 0.001000000047497451305389404296875, _292);
        _294 = _1010;
    }
    float _1012 = _294;
    float _1014 = fma(_1002, _996, _1002);
    float _1016 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1004);
    float _1018 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1020 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _772);
    float _1022 = fma(_998, _952, _992);
    float _1024 = fma(_1014, _952, _1016);
    float _1026 = -_1008;
    float _1028 = _828 * _1026;
    float _1030 = _1000 * 6.283185482025146484375;
    float _1032 = sin(_1030);
    if (_982)
    {
        float _1034 = fma(_302, 0.001000000047497451305389404296875, _286);
        _288 = _1034;
    }
    float _1036 = _288;
    float _1038 = -_1012;
    float _1040 = _814 * _1038;
    float _1042 = -_1012;
    float _1044 = -_1028;
    float _1046 = fma(_844, _1042, _1044);
    float _1048 = _1018 * _1020;
    float _1050 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1052 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _774);
    float _1054 = fma(_174, _654, _714);
    float _1056 = _1000 * 6.283185482025146484375;
    float _1058 = cos(_1056);
    float _1060 = -_1036;
    float _1062 = _844 * _1060;
    float _1064 = -_1036;
    float _1066 = -_1040;
    float _1068 = fma(_828, _1064, _1066);
    float _1070 = _1046 * _1046;
    float _1072 = _1022 * 0.15915493667125701904296875;
    float _1074 = in.m_55.w;
    float _1076 = _1024 * 0.15915493667125701904296875;
    float _1078 = _1050 * _1052;
    float _1080 = -_1008;
    float _1082 = -_1062;
    float _1084 = fma(_814, _1080, _1082);
    float _1086 = in.m_57.w;
    float _1088 = fma(_1068, _1068, _1070);
    float _1090 = _1072 * 6.283185482025146484375;
    float _1092 = sin(_1090);
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1098 = fma(_178, _654, _732);
    float _1100 = fma(_1084, _1084, _1088);
    float _1102 = _968;
    if (_662)
    {
        float _1104 = in.m_61.x;
        _1102 = _1104;
    }
    float _1106 = _1102;
    bool _1108 = _772 != 0.0;
    bool _1110 = isnan(_772);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan(0.0);
    bool _1116 = _1112 || _1114;
    float _1118 = _766 + _944;
    float _1120 = _1072 * 6.283185482025146484375;
    float _1122 = cos(_1120);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1124;
    bool _1128 = _770 == 0.0;
    bool _1130 = !_1116;
    bool _1132 = _1128 && _1130;
    bool _1134 = _774 == 0.0;
    bool _1136 = _1134 && _1132;
    float _1138 = _1076 * 6.283185482025146484375;
    float _1140 = cos(_1138);
    float _1142 = _1032 * _1092;
    float _1144 = _1054 + _1074;
    float _1146 = _1098 + _1086;
    float _1148 = _1076 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    float _1152 = _1032 * _1122;
    bool _1154 = _1106 > 0.5;
    bool _1156 = _1154 && _662;
    float _1158 = in.m_67.x;
    float _1160 = 1.0 / _1096;
    float _1162 = _1032 * _1140;
    float _1164 = _1058 * _1122;
    float _1166 = _1122 * _1140;
    float _1168 = _1058 * _1092;
    float _1170 = _1058 * _1140;
    float _1172 = _1092 * _1140;
    float _1174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1176 = fma(_1150, _1164, _1142);
    float _1178 = -_1168;
    float _1180 = fma(_1150, _1152, _1178);
    float _1182 = -_1152;
    float _1184 = fma(_1150, _1168, _1182);
    float _1186 = fma(_1150, _1142, _1164);
    float _1188 = _1176 * _828;
    float _1190 = _1170 * _844;
    float _1192 = _1184 * _828;
    float _1194 = rsqrt(_1100);
    float _1196 = _1126 * _1160;
    float _1198 = _1170 * _828;
    float _1200 = _1184 * _844;
    float _1202 = _1170 * _814;
    float _1204 = _1176 * _814;
    float _1206 = _1184 * _814;
    float _1208 = _1184;
    float _1210 = _1158;
    float _1212 = _1146;
    if (_662)
    {
        _1208 = _1158;
    }
    float _1214 = _1208;
    float _1216 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1218 = fma(_1216, _730, -0.5);
    float _1220 = _1214;
    if (_1156)
    {
        float _1222 = -_1214;
        float _1224 = _1222 + 1.0;
        _1220 = _1224;
    }
    float _1226 = _1220;
    float _1228 = _1046 * _1194;
    float _1230 = _1068 * _1194;
    float _1232 = _1084 * _1194;
    float _1234 = _1176 * _844;
    float _1236 = -_912;
    float _1238 = fma(_928, _1218, _1236);
    float _1240 = -_1150;
    float _1242 = fma(_1240, _1230, _1190);
    float _1244 = fma(_1166, _1232, _1188);
    float _1246 = fma(_1166, _1230, _1234);
    float _1248 = _814 * _1232;
    float _1250 = _844 * _1228;
    float _1252 = fma(_1172, _1232, _1192);
    float _1254 = -_1150;
    float _1256 = fma(_1254, _1232, _1198);
    float _1258 = -_1248;
    float _1260 = fma(_828, _1228, _1258);
    float _1262 = -_1250;
    float _1264 = fma(_814, _1230, _1262);
    float _1266 = fma(_1172, _1230, _1200);
    float _1268 = _828 * _1230;
    float _1270 = fma(_1162, _1260, _1242);
    float _1272 = fma(_1162, _1264, _1256);
    float _1274 = fma(_1180, _1264, _1244);
    float _1276 = fma(_1180, _1260, _1246);
    float _1278 = _1048 * _1270;
    float _1280 = _1048 * _1272;
    float _1282 = fma(_1186, _1260, _1266);
    bool _1284 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1286 = isnan(_642);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    float _1296 = fma(_1186, _1264, _1252);
    float _1298 = fma(_842, _1276, _1278);
    float _1300 = fma(_842, _1274, _1280);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1304 = _642 + _1302;
    bool _1306 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1308 = isnan(_642);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = -_1294;
    float _1320 = _1318 + 1.0;
    float _1322 = fma(_1078, _1282, _1298);
    float _1324 = fma(_1078, _1296, _1300);
    float _1326 = fma(_1196, _1304, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1328 = _1316 * _1320;
    float _1330 = _1144 + _1322;
    float _1332 = _1146 + _1324;
    float _1334 = in.m_73.x;
    float _1336 = in.m_73.y;
    float _1338 = in.m_73.z;
    float _1340 = _1326 * _1328;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1344 = _1330 + _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1348 = _1332 + _1346;
    float _1350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1352 = -_1150;
    float _1354 = fma(_1352, _1228, _1202);
    float _1356 = _1344 * _1344;
    float _1358 = _1348 * _1348;
    float _1360 = -_1268;
    float _1362 = fma(_844, _1232, _1360);
    float _1364 = fma(_1166, _1228, _1204);
    float _1366 = fma(_1172, _1228, _1206);
    float _1368 = _1356 + _1358;
    float _1370 = fma(_1162, _1362, _1354);
    float _1372 = fma(_1180, _1362, _1364);
    float _1374 = fma(_1186, _1362, _1366);
    float _1376 = sqrt(_1368);
    float _1378 = _1048 * _1370;
    float _1380 = _1356;
    float _1382 = _1358;
    float _1384 = _1330;
    float _1386 = _1332;
    float _1388 = _1296;
    if (_662)
    {
        _1210 = _1226;
    }
    float _1390 = _1210;
    float _1392 = -_1316;
    float _1394 = _1392 + 1.0;
    float _1396 = fma(_842, _1372, _1378);
    float _1398 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1400 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1340);
    float _1402 = fma(_1078, _1374, _1396);
    float _1404 = fma(_1398, _1390, -0.5);
    float _1406 = _1334;
    float _1408 = _1336;
    float _1410 = _1338;
    if (!_1136)
    {
        float _1412 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1334);
        _1406 = _1412;
    }
    float _1414 = _1406;
    if (!_1136)
    {
        float _1416 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1336);
        _1408 = _1416;
    }
    float _1418 = _1408;
    float _1420 = _1118 + _1402;
    float _1422 = fma(_896, _1404, _900);
    if (!_1136)
    {
        float _1424 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1338);
        _1410 = _1424;
    }
    float _1426 = _1410;
    bool _1428 = _1376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1430 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1400);
    if (!_1428)
    {
        _834 = _1420;
    }
    float _1432 = _834;
    bool _1434 = !_1428;
    float _1436 = _1432;
    if (!_1434)
    {
        float _1438 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1442 = _1376 + _1440;
        float _1444 = _1420 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1446 = rsqrt(_1368);
        float _1448 = _1442 * _1438;
        float _1450 = _1448 * 0.15915493667125701904296875;
        float _1452 = _1450 * 6.283185482025146484375;
        float _1454 = sin(_1452);
        float _1456 = _1450 * 6.283185482025146484375;
        float _1458 = cos(_1456);
        float _1460 = fma(_1454, _1444, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1462 = _1446 * _1460;
        float _1464 = _1458 + (-1.0);
        float _1466 = fma(_1344, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1468 = fma(_1348, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1470 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1474 = _1466 + _1472;
        float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1478 = _1468 + _1476;
        float _1480 = fma(_1420, _1458, _1470);
        float _1482 = _1474 * _1474;
        float _1484 = _1478 * _1478;
        _1436 = _1480;
        _1380 = _1482;
        _1382 = _1484;
        _1384 = _1466;
        _1386 = _1468;
    }
    float _1486 = _1436;
    float _1488 = _1380;
    float _1490 = _1382;
    float _1492 = _1384;
    float _1494 = _1386;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1498 = _1486 + _1496;
    float _1500 = in.m_75.x;
    float _1502 = _1270 * _1418;
    float _1504 = _1370 * _1418;
    float _1506 = fma(_1498, _1498, _1488);
    float _1508 = _1272 * _1418;
    float _1510 = fma(_1276, _1414, _1502);
    float _1512 = _1506 + _1490;
    float _1514 = fma(_1274, _1414, _1508);
    float _1516 = fma(_1372, _1414, _1504);
    float _1518 = fma(_1282, _1426, _1510);
    float _1520 = sqrt(_1512);
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1528 = fma(_1374, _1426, _1516);
    float _1530 = _1522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1532 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1534 = _1526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1536 = _1238 + 0.5;
    float _1538 = _1430 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1540 = _1422 + 0.5;
    float _1542 = fma(_1296, _1426, _1514);
    out.m_77.x = _1500;
    out.m_79.x = _1530;
    out.m_79.y = _1532;
    out.m_79.z = _1534;
    out.m_79.w = _1538;
    bool _1544 = _1520 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1546 = isnan(_1520);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1552 = _1548 || _1550;
    out.m_81.x = _1540;
    out.m_81.y = _1536;
    out.m_83.x = _1518;
    out.m_83.y = _1528;
    out.m_83.z = _1542;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1556 = _1510;
    if (!_1552)
    {
        _1554 = 1.0;
    }
    float _1558 = _1554;
    bool _1560 = !_1552;
    float _1562 = _1558;
    if (!_1560)
    {
        bool _1564 = _1520 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1566 = isnan(_1520);
        bool _1568 = _1564 || _1566;
        bool _1570 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1572 = _1568 || _1570;
        if (!_1572)
        {
            float _1574 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1576 = _1520 + _1574;
            float _1578 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1580 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1578;
            float _1582 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1584 = _1582 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1586 = 1.0 / _1580;
            float _1588 = _1576 * _1586;
            float _1590 = fma(_1588, _1584, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1562 = _1590;
            _1592 = true;
        }
        else
        {
            bool _1594 = _1520 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1596 = isnan(_1520);
            bool _1598 = _1594 || _1596;
            bool _1600 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1602 = _1598 || _1600;
            if (!_1602)
            {
                float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1606 = _1520 + _1604;
                float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1610 = _1608 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1614 = _1612 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1616 = 1.0 / _1610;
                float _1618 = _1606 * _1616;
                float _1620 = fma(_1618, _1614, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1562 = _1620;
                _1592 = true;
            }
            else
            {
                _1562 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1592 = false;
    float _1622 = _1562;
    float _1624 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1626 = _1486 + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1630 = _1492 + _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1634 = _1494 + _1632;
    float _1636 = fma(_1626, _1622, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1638 = fma(_1630, _1622, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1640 = fma(_1634, _1622, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1644 = _1636 + _1642;
    float _1646 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1648 = _1638 + _1646;
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1652 = _1640 + _1650;
    float _1654 = _1644 * _1644;
    float _1656 = fma(_1648, _1648, _1654);
    float _1658 = fma(_1652, _1652, _1656);
    float _1660 = rsqrt(_1658);
    float _1662 = sqrt(_1658);
    float _1664 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1666 = _1648 * _1664;
    float _1668 = _1652 * _1664;
    float _1670 = _1666 * _1666;
    float _1672 = _1668 * _1668;
    float _1674 = _1670 + _1672;
    float _1676 = sqrt(_1674);
    bool _1678 = _1676 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1682 = _1676 + _1680;
    float _1684 = _1652;
    float _1686 = _1660;
    float _1688 = _1682;
    float _1690 = _1644;
    if (_1678)
    {
        float _1692 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1684 = _1692;
    }
    float _1694 = _1684;
    if (_1678)
    {
        float _1696 = rsqrt(_1674);
        _1686 = _1696;
    }
    float _1698 = _1686;
    float _1700 = _1698;
    if (_1678)
    {
        float _1702 = _1682 * _1694;
        _1688 = _1702;
    }
    float _1704 = _1688;
    if (_1678)
    {
        float _1706 = _1704 * 0.15915493667125701904296875;
        _1388 = _1706;
    }
    float _1708 = _1388;
    float _1710 = _1694;
    float _1712 = _1708;
    if (_1678)
    {
        float _1714 = _1708 * 6.283185482025146484375;
        float _1716 = sin(_1714);
        _1710 = _1716;
    }
    float _1718 = _1710;
    float _1720 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1722 = precise::max(0.0, _1720);
    float _1724 = _1634;
    float _1726 = _1722;
    if (_1678)
    {
        float _1728 = _1708 * 6.283185482025146484375;
        float _1730 = cos(_1728);
        _1724 = _1730;
    }
    float _1732 = _1724;
    float _1734 = -_1664;
    float _1736 = -_1722;
    float _1738 = fma(_1644, _1734, _1736);
    if (!_1678)
    {
        _1690 = _1668;
    }
    float _1740 = _1690;
    float _1742 = _1740;
    if (_1678)
    {
        float _1744 = _1738 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1726 = _1744;
    }
    float _1746 = _1726;
    float _1748 = _1718;
    float _1750 = _1746;
    if (_1678)
    {
        float _1752 = fma(_1718, _1746, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1748 = _1752;
    }
    float _1754 = _1748;
    float _1756 = _1754;
    float _1758 = _1732;
    if (_1678)
    {
        float _1760 = _1732 + (-1.0);
        _1750 = _1760;
    }
    float _1762 = _1750;
    float _1764 = _1762;
    if (_1678)
    {
        float _1766 = _1698 * _1754;
        _1556 = _1766;
    }
    float _1768 = _1556;
    if (!_1678)
    {
        _1700 = _1666;
    }
    float _1770 = _1700;
    float _1772 = _1770;
    if (_1678)
    {
        float _1774 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1712 = _1774;
    }
    float _1776 = _1712;
    if (_1678)
    {
        float _1778 = _1666 * _1768;
        _1772 = _1778;
    }
    float _1780 = _1772;
    if (!_1678)
    {
        _1756 = _1738;
    }
    float _1782 = _1756;
    float _1784 = _1782;
    if (_1678)
    {
        float _1786 = _1668 * _1768;
        _1742 = _1786;
    }
    float _1788 = _1742;
    if (!_1678)
    {
        _1764 = _1670;
    }
    float _1790 = _1764;
    float _1792 = _1790;
    if (_1678)
    {
        float _1794 = fma(_1738, _1732, _1776);
        _1784 = _1794;
    }
    float _1796 = _1784;
    if (_1678)
    {
        float _1798 = _1780 * _1780;
        _1792 = _1798;
    }
    float _1800 = _1792;
    if (!_1678)
    {
        _1758 = _1672;
    }
    float _1802 = _1758;
    float _1804 = _1802;
    if (_1678)
    {
        float _1806 = _1788 * _1788;
        _1804 = _1806;
    }
    float _1808 = _1804;
    float _1810 = fma(_1796, _1796, _1800);
    float _1812 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1814 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1816 = _1810 + _1808;
    float _1818 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1820 = fma(_1662, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1818);
    float _1822 = precise::clamp(_1820, 0.0, 1.0);
    float _1824 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1812);
    float _1826 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1828 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1830 = -_1822;
    float _1832 = _1830 + 1.0;
    float _1834 = rsqrt(_1816);
    float _1836 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1824);
    float _1838 = _1636 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1840 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1826);
    float _1842 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1828);
    float _1844 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1846 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1838);
    float _1848 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1840);
    float _1850 = abs(_1832);
    float _1852 = log2(_1850);
    float _1854 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1842);
    float _1856 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1858 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1846);
    float _1860 = _1848 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1862 = -_1856;
    float _1864 = fma(_1862, _1814, 1.0);
    float _1866 = _1858 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1868 = _1834 * _1780;
    float _1870 = _1854 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1872 = _1834 * _1796;
    float _1874 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1876 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1878 = _1834 * _1788;
    float _1880 = log2(_1864);
    float _1882 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1874);
    float _1884 = -_1876;
    float _1886 = fma(_1872, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1884);
    float _1888 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1890 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1882);
    float _1892 = -_1878;
    float _1894 = fma(_1892, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1886);
    float _1896 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1898 = exp2(_1888);
    float _1900 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1890);
    float _1902 = fma(_1894, -0.5, 0.5);
    float _1904 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1906 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1896);
    float _1908 = fma(_1894, 0.5, 0.5);
    float _1910 = _1872 + 1.0;
    float _1912 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1904);
    float _1914 = 1.0 / _1900;
    float _1916 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1906);
    float _1918 = fma(_1908, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1920 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1912);
    float _1922 = _1880 * 0.693147182464599609375;
    float _1924 = fma(_1908, _1918, -0.212114393711090087890625);
    float _1926 = sqrt(_1902);
    float _1928 = -_1872;
    float _1930 = fma(_1898, _1910, _1928);
    float _1932 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1916);
    float _1934 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1920);
    float _1936 = fma(_1908, _1924, 1.570728778839111328125);
    float _1938 = _1922 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1940 = fma(_1930, 0.5, 0.5);
    float _1942 = _1932 * _1914;
    float _1944 = _1934 * _1914;
    float _1946 = fma(_1942, 0.5, 0.5);
    float _1948 = fma(_1944, -0.5, 0.5);
    float _1950 = _1926 * 0.636619746685028076171875;
    float3 _5398 = float3(_1946, _1948, _1938);
    float _1952 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5398, float3(0.0), isnan(_5398)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5398, float3(0.0), isnan(_5398)), level(0.0)).x;
    float _1954 = -_1936;
    float _1956 = fma(_1950, _1954, 1.0);
    float2 _5414 = float2(_1956, _1940);
    float3 _1960 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5414, float2(0.0), isnan(_5414)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5414, float2(0.0), isnan(_5414)), level(0.0)).xyz;
    float _1962 = _1960.x;
    float _1964 = _1960.y;
    float _1966 = _1960.z;
    float3 _5431 = float3(_1946, _1948, _1938);
    float4 _1969 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5431, float3(0.0), isnan(_5431)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5431, float3(0.0), isnan(_5431)), level(0.0)).xyzw;
    float _1971 = _1969.x;
    float _1973 = _1969.y;
    float _1975 = _1969.z;
    float _1977 = _1969.w;
    float _1979 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1981 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1983 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1985 = _1860 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1987 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1979);
    float _1989 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1981);
    bool _1991 = _1662 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1993 = isnan(_1662);
    bool _1995 = _1991 || _1993;
    bool _1997 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1999 = _1995 || _1997;
    float _2001 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1985);
    float _2003 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1987);
    float _2005 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1989);
    float _2007 = exp2(_1983);
    float _2009 = fma(_1844, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2001);
    float _2011 = _2003 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2013 = _2005 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2015 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2017 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2019 = _2015 || _2017;
    bool _2021 = isnan(0.5);
    bool _2023 = _2019 || _2021;
    float _2025 = 1.0 / _2011;
    float _2027 = _2013 + _2011;
    float _2029 = _1866;
    float _2031 = _1900;
    if (!_2023)
    {
        _1212 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2033 = _1212;
    if (!_2023)
    {
        _2029 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2035 = _2029;
    float _2037 = _2027 * _2025;
    float _2039 = _2037 * 0.5;
    float _2041 = _2025;
    if (!_2023)
    {
        float _2043 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2045 = fma(_2039, _2033, _2043);
        _2041 = _2045;
    }
    float _2047 = _2041;
    float _2049 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2009);
    float _2051 = -_2007;
    float _2053 = _2051 + 1.0;
    float _2055 = _2049 + _1900;
    float _2057 = _2047;
    float _2059 = _2053;
    float _2061 = _2049;
    float _2063 = _1932;
    if (!_2023)
    {
        float _2065 = 1.0 / _2047;
        _2057 = _2065;
    }
    float _2067 = _2057;
    out.gl_Position.x = _1932;
    out.gl_Position.y = _1934;
    out.gl_Position.z = _2049;
    out.gl_Position.w = _1900;
    float _2069 = _2055 * 0.5;
    float _2071 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2073 = _2071;
    if (!_2023)
    {
        float _2075 = -_2035;
        float _2077 = _2075 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2059 = _2077;
    }
    float _2079 = _2059;
    float _2081 = -_2071;
    float _2083 = _2081 + 1.0;
    out.m_85.z = _2069;
    out.m_85.w = _1900;
    float _2085 = _1934;
    if (!_2023)
    {
        float _2087 = 1.0 / _2079;
        _2085 = _2087;
    }
    float _2089 = _2085;
    float _2091 = _2067;
    if (!_2023)
    {
        float _2093 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2095 = -_2035;
        float _2097 = fma(_2067, _2093, _2095);
        _2091 = _2097;
    }
    float _2099 = _2091;
    float _2101 = _2099;
    if (!_1999)
    {
        _2031 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2103 = _2031;
    float _2105 = _2103;
    float _2107 = _2103;
    if (!_1999)
    {
        _2061 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2109 = _2061;
    float _2111 = _2109;
    float _2113 = _2109;
    if (!_1999)
    {
        _2063 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2115 = _2063;
    float _2117 = _2071 * _1952;
    float _2119 = _2089;
    float _2121 = _1973;
    float _2123 = _2115;
    float _2125 = _2115;
    if (_2023)
    {
        _2073 = 1.0;
    }
    float _2127 = _2073;
    float _2129 = _2127;
    if (!_2023)
    {
        float _2131 = _2099 * _2089;
        float _2133 = precise::clamp(_2131, 0.0, 1.0);
        _2129 = _2133;
    }
    float _2135 = _2129;
    if (!_1999)
    {
        _2101 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2137 = _2101;
    float _2139 = _2137;
    float _2141 = _2137;
    if (!_1999)
    {
        _2119 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2143 = _2119;
    float _2145 = _1966 * _2117;
    float _2147 = _1977 * _2117;
    float _2149 = _1977 * _2083;
    float _2151 = fma(_1977, _2145, _1975);
    float _2153 = fma(_1962, _2147, _1971);
    float _2155 = fma(_1964, _2147, _1973);
    float _2157 = _2143;
    float _2159 = _2143;
    if (!_1999)
    {
        _2121 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2161 = _2121;
    float _2163 = _2135 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_87.x = _2153;
    out.m_87.y = _2155;
    out.m_87.z = _2151;
    out.m_87.w = _2149;
    bool _2165 = !_1999;
    float _2167 = _2161;
    float _2169 = _2161;
    if (!_2165)
    {
        bool _2171 = _1662 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2173 = isnan(_1662);
        bool _2175 = _2171 || _2173;
        bool _2177 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2179 = _2175 || _2177;
        if (!_2179)
        {
            float _2181 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2183 = _1662 + _2181;
            float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2187 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2185;
            float _2189 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2193 = 1.0 / _2187;
            float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2207 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2209 = _2207 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2211 = _2183 * _2193;
            float _2213 = precise::clamp(_2211, 0.0, 1.0);
            float _2215 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2217 = _2215 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2219 = fma(_2213, _2191, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2221 = fma(_2213, _2217, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2223 = fma(_2213, _2197, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2225 = fma(_2213, _2201, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2227 = fma(_2213, _2205, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2229 = fma(_2213, _2209, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2141 = _2223;
            _2159 = _2227;
            _2169 = _2219;
            _2113 = _2225;
            _2107 = _2221;
            _2125 = _2229;
            _2231 = true;
        }
        else
        {
            bool _2233 = _1662 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2235 = isnan(_1662);
            bool _2237 = _2233 || _2235;
            bool _2239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2241 = _2237 || _2239;
            if (!_2241)
            {
                _2167 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2243 = _2167;
            _2169 = _2243;
            if (!_2241)
            {
                _2139 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2245 = _2139;
            _2141 = _2245;
            if (!_2241)
            {
                _2105 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2247 = _2105;
            _2107 = _2247;
            if (!_2241)
            {
                _2111 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2249 = _2111;
            _2113 = _2249;
            if (!_2241)
            {
                _2157 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2251 = _2157;
            _2159 = _2251;
            if (!_2241)
            {
                _2123 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2253 = _2123;
            bool _2255 = !_2241;
            _2125 = _2253;
            if (!_2255)
            {
                bool _2257 = _1662 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2259 = isnan(_1662);
                bool _2261 = _2257 || _2259;
                bool _2263 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2265 = _2261 || _2263;
                if (!_2265)
                {
                    float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2269 = _1662 + _2267;
                    float _2271 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2273 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2271;
                    float _2275 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2279 = 1.0 / _2273;
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2289 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2295 = _2293 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2297 = _2269 * _2279;
                    float _2299 = precise::clamp(_2297, 0.0, 1.0);
                    float _2301 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2305 = fma(_2299, _2277, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2307 = fma(_2299, _2303, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2309 = fma(_2299, _2283, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2311 = fma(_2299, _2287, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2313 = fma(_2299, _2291, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2315 = fma(_2299, _2295, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2141 = _2309;
                    _2159 = _2313;
                    _2169 = _2305;
                    _2113 = _2311;
                    _2107 = _2307;
                    _2125 = _2315;
                    _2231 = true;
                }
                else
                {
                    _2141 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2159 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2169 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2113 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2107 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2125 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2231 = false;
    float _2317 = _2141;
    float _2319 = _2159;
    float _2321 = _2169;
    float _2323 = _2113;
    float _2325 = _2107;
    float _2327 = _2125;
    float _2329 = fma(_1528, -0.5, 0.5);
    float _2331 = precise::clamp(_2329, 0.0, 1.0);
    float _2333 = -_2317;
    float _2335 = _2333 + _2319;
    float _2337 = _2163 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2339 = -_2321;
    float _2341 = _2339 + _2323;
    float _2343 = fma(_2331, _2335, _2317);
    out.m_89.x = 0.0;
    float _2345 = -_2325;
    float _2347 = _2345 + _2327;
    float _2349 = fma(_2331, _2341, _2321);
    float _2351 = _2343 * 0.586610972881317138671875;
    out.m_49.x = _2337;
    bool _2353 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2355 = fma(_2331, _2347, _2325);
    float _2357 = fma(_2349, 0.298911988735198974609375, _2351);
    bool _2359 = _2135 > 0.0;
    bool _2361 = isnan(_2135);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan(0.0);
    bool _2367 = _2363 || _2365;
    float _2369 = fma(_2355, 0.114477999508380889892578125, _2357);
    float _2371 = -_2369;
    float _2373 = _2349 + _2371;
    float _2375 = -_2369;
    float _2377 = _2343 + _2375;
    float _2379 = -_2369;
    float _2381 = _2355 + _2379;
    float _2383 = fma(_2373, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2369);
    float _2385 = fma(_2377, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2369);
    float _2387 = fma(_2381, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2369);
    bool _2389 = !_2353;
    if (!_2389)
    {
        float _2391 = -_1636;
        float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2395 = -_1638;
        float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2399 = -_1640;
        float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2403 = _2393 * _2393;
        float _2405 = fma(_2397, _2397, _2403);
        float _2407 = fma(_2401, _2401, _2405);
        float _2409 = sqrt(_2407);
        float _2411 = rsqrt(_2407);
        float _2413 = -_2409;
        float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2417 = _2415 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2419 = precise::clamp(_2417, 0.0, 1.0);
        float _2421 = _2397 * _2411;
        float _2423 = _2393 * _2411;
        float _2425 = abs(_2419);
        float _2427 = log2(_2425);
        float _2429 = _2401 * _2411;
        float _2431 = _2421 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2433 = _1528 * _2423;
        float _2435 = -_2423;
        float _2437 = -_2431;
        float _2439 = fma(_2435, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2437);
        float _2441 = fma(_1518, _2421, _2433);
        float _2443 = -_2429;
        float _2445 = fma(_2443, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2439);
        float _2447 = fma(_1542, _2429, _2441);
        float _2449 = precise::clamp(_2447, 0.0, 1.0);
        float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2453 = _2445 + _2451;
        float _2455 = _2427 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2457 = _2453 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2459 = precise::clamp(_2457, 0.0, 1.0);
        float _2461 = exp2(_2455);
        float _2463 = _2461 * _2459;
        float _2465 = _2449 * _2463;
        float _2467 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2469 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2471 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2467;
        out.m_89.y = _2469;
        out.m_89.z = _2471;
    }
    out.m_91.x = _2383;
    out.m_91.y = _2385;
    out.m_91.z = _2387;
    if (_2367)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2473 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2473;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

