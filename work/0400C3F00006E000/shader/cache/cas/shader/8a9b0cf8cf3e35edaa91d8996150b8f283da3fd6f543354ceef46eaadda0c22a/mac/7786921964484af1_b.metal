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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_83 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_69 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
    float4 m_73 [[attribute(11)]];
    float4 m_65 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4215 = false;
    bool _1490 = false;
    bool _1310 = false;
    bool _1198 = false;
    bool _1058 = false;
    bool _934 = false;
    bool _660 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5257 = as_type<float>(_122);
        out.gl_Position.z = _5257;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_49.w;
    float _128 = in.m_51.x;
    bool _130 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_126);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_126;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _128;
    float _144 = 0.0;
    if (_138)
    {
        float _146 = float(_106);
        _144 = _146;
    }
    float _148 = _144;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_47.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5329 = as_type<float>(_160);
        out.gl_Position.z = _5329;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = in.m_57.x;
    float _170 = in.m_57.y;
    float _172 = in.m_57.z;
    bool _174 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _176 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _178 = _174 || _176;
    bool _180 = isnan(1.0);
    bool _182 = _178 || _180;
    float _184 = in.m_59.x;
    float _186 = in.m_59.y;
    float _188 = in.m_59.z;
    float _190 = in.m_61.w;
    float _192 = in.m_44.x;
    float _194 = in.m_44.y;
    float _196 = in.m_44.z;
    float _198 = _162 * _162;
    float _200 = _164 * _164;
    float _202 = fma(_168, _168, _198);
    float _204 = fma(_170, _170, _200);
    float _206 = fma(_184, _184, _202);
    float _208 = _166 * _166;
    float _210 = fma(_186, _186, _204);
    float _212 = sqrt(_206);
    float _214 = fma(_172, _172, _208);
    float _216 = fma(_188, _188, _214);
    float _218 = sqrt(_210);
    float _220 = sqrt(_216);
    bool _222 = _212 > 0.0;
    bool _224 = _218 > 0.0;
    float _226 = 0.0;
    float _228 = _170;
    float _230 = _168;
    float _232 = _172;
    if (_222)
    {
        float _234 = rsqrt(_206);
        _226 = _234;
    }
    float _236 = _226;
    float _238 = 0.0;
    float _240 = 0.0;
    if (!_222)
    {
        _238 = 0.0;
        _240 = 0.0;
    }
    float _242 = _238;
    float _244 = _240;
    bool _246 = _220 > 0.0;
    float _248 = in.m_49.x;
    float _250 = in.m_49.y;
    float _252 = in.m_49.z;
    float _254 = 0.0;
    float _256 = _242;
    float _258 = _244;
    if (!_222)
    {
        _254 = 0.0;
    }
    float _260 = _254;
    float _262 = 0.0;
    float _264 = 0.0;
    float _266 = _260;
    if (!_224)
    {
        _262 = 0.0;
        _264 = 0.0;
    }
    float _268 = _262;
    float _270 = _264;
    float _272 = 0.0;
    float _274 = _270;
    float _276 = _268;
    if (_224)
    {
        float _278 = rsqrt(_210);
        _272 = _278;
    }
    float _280 = _272;
    int _282 = int(_222);
    int _284 = _224 ? 2 : 0;
    int _286 = _282 | _284;
    int _288 = _246 ? 4 : 0;
    int _290 = _286 | _288;
    int _292 = _182 ? 8 : 0;
    int _294 = _290 | _292;
    int _296 = false ? 16 : 0;
    int _298 = _294 | _296;
    int _300 = false ? 32 : 0;
    int _302 = _298 | _300;
    int _304 = false ? 64 : 0;
    int _306 = _302 | _304;
    int _308 = _306 & 8;
    float _310 = 0.0;
    float _312 = as_type<float>(_308);
    if (!_224)
    {
        _310 = 0.0;
    }
    float _314 = _310;
    float _316 = 0.0;
    float _318 = 0.0;
    float _320 = _314;
    if (!_246)
    {
        _316 = 0.0;
        _318 = 0.0;
    }
    float _322 = _316;
    float _324 = _318;
    float _326 = _216;
    float _328 = _322;
    float _330 = _324;
    if (_246)
    {
        float _332 = rsqrt(_216);
        _326 = _332;
    }
    float _334 = _326;
    float _336 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _338 = 0.0;
    float _340 = _336;
    if (!_246)
    {
        _338 = 0.0;
    }
    float _342 = _338;
    float _344 = _342;
    if (_222)
    {
        float _346 = _236 * _168;
        _266 = _346;
    }
    float _348 = _266;
    if (_222)
    {
        float _350 = _236 * _162;
        _256 = _350;
    }
    float _352 = _256;
    if (!_182)
    {
        float _354 = _336 * _336;
        float _356 = _354 * 0.5;
        _312 = _356;
    }
    float _358 = _312;
    float _360 = _358;
    if (_222)
    {
        float _362 = _236 * _184;
        _258 = _362;
    }
    float _364 = _258;
    if (_224)
    {
        float _366 = _280 * _170;
        _274 = _366;
    }
    float _368 = _274;
    if (_224)
    {
        float _370 = _280 * _164;
        _276 = _370;
    }
    float _372 = _276;
    if (_224)
    {
        float _374 = _280 * _186;
        _320 = _374;
    }
    float _376 = _320;
    if (!_182)
    {
        float _378 = _358 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _360 = _378;
    }
    float _380 = _360;
    float _382 = _380;
    if (_246)
    {
        float _384 = _334 * _172;
        _344 = _384;
    }
    float _386 = _344;
    if (_246)
    {
        float _388 = _334 * _166;
        _328 = _388;
    }
    float _390 = _328;
    if (_246)
    {
        float _392 = _334 * _188;
        _330 = _392;
    }
    float _394 = _330;
    bool _396 = !_182;
    if (!_396)
    {
        float _398 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _400 = log2(_398);
        float _402 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _404 = _402 + 1.0;
        float _406 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _408 = _336 * _400;
        float _410 = 1.0 / _404;
        float _412 = _406 * 0.693147182464599609375;
        float _414 = exp2(_408);
        float _416 = 1.0 / _412;
        float _418 = _414 + (-1.0);
        float _420 = -_418;
        float _422 = fma(_420, _416, _336);
        float _424 = _422 * _410;
        float _426 = _424 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _382 = _426;
    }
    float _428 = _382;
    float _430 = _428 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _432 = !_182;
    float _434 = _428;
    if (!_432)
    {
        float _436 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _438 = log2(_436);
        float _440 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _442 = _440 + 1.0;
        float _444 = 1.0 / _442;
        float _446 = _336 * _438;
        float _448 = exp2(_446);
        float _450 = -_448;
        float _452 = _450 + 1.0;
        float _454 = _452 * _444;
        _340 = _454;
    }
    float _456 = _340;
    float _458 = _428 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _460 = _430 * _352;
    float _462 = _430 * _372;
    float _464 = _430 * _390;
    float _466 = 0.0;
    if (!_182)
    {
        float _468 = _142 * _142;
        float _470 = _468 * 0.5;
        _466 = _470;
    }
    float _472 = _466;
    float _474 = fma(_458, _348, _460);
    float _476 = fma(_458, _368, _462);
    float _478 = fma(_458, _386, _464);
    float _480 = _428 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_182)
    {
        float _482 = _472 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _434 = _482;
    }
    float _484 = _434;
    bool _486 = !_182;
    float _488 = _484;
    if (!_486)
    {
        float _490 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _492 = log2(_490);
        float _494 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _496 = _494 + 1.0;
        float _498 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _500 = _142 * _492;
        float _502 = 1.0 / _496;
        float _504 = _498 * 0.693147182464599609375;
        float _506 = exp2(_500);
        float _508 = 1.0 / _504;
        float _510 = _506 + (-1.0);
        float _512 = -_510;
        float _514 = fma(_512, _508, _142);
        float _516 = _514 * _502;
        float _518 = _516 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _488 = _518;
    }
    float _520 = _488;
    float _522 = _520 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _524 = fma(_480, _364, _474);
    float _526 = fma(_480, _376, _476);
    float _528 = _520 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _530 = _522 * _352;
    float _532 = _522 * _372;
    float _534 = _522 * _390;
    float _536 = fma(_480, _394, _478);
    float _538 = fma(_528, _348, _530);
    float _540 = fma(_528, _368, _532);
    float _542 = fma(_528, _386, _534);
    float _544 = _520 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _546 = fma(_456, _248, _524);
    float _548 = fma(_456, _250, _526);
    float _550 = fma(_456, _252, _536);
    float _552 = fma(_544, _364, _538);
    float _554 = fma(_544, _376, _540);
    float _556 = fma(_544, _394, _542);
    float _558 = _544;
    if (!_182)
    {
        _558 = _142;
    }
    float _560 = _558;
    bool _562 = !_182;
    float _564 = _560;
    if (!_562)
    {
        float _566 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _568 = log2(_566);
        float _570 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _572 = _570 + 1.0;
        float _574 = 1.0 / _572;
        float _576 = _142 * _568;
        float _578 = exp2(_576);
        float _580 = -_578;
        float _582 = _580 + 1.0;
        float _584 = _582 * _574;
        _564 = _584;
    }
    float _586 = _564;
    float _588 = fma(_586, _250, _554);
    bool _590 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _592 = fma(_548, _190, _194);
    float _594 = fma(_586, _248, _552);
    float _596 = -_588;
    float _598 = _548 + _596;
    float _600 = fma(_586, _252, _556);
    float _602 = fma(_546, _190, _192);
    float _604 = -_594;
    float _606 = _546 + _604;
    float _608 = _598 * _170;
    float _610 = _598 * _164;
    float _612 = _598 * _186;
    float _614 = -_600;
    float _616 = _550 + _614;
    float _618 = fma(_606, _168, _608);
    float _620 = fma(_606, _162, _610);
    float _622 = fma(_606, _184, _612);
    float _624 = fma(_550, _190, _196);
    float _626 = fma(_616, _172, _618);
    float _628 = fma(_616, _166, _620);
    float _630 = fma(_616, _188, _622);
    bool _632 = !_590;
    float _634 = _630;
    float _636 = _628;
    float _638 = _626;
    float _640 = _630;
    float _642 = _628;
    float _658;
    if (!_632)
    {
        float _644 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _646 = _128 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _648 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _650 = _648 * _644;
        float _652 = floor(_650);
        float _654 = -_652;
        float _656 = _650 + _654;
        _658 = _656;
        _660 = true;
    }
    else
    {
        float _662 = float(_106);
        float _664 = 1.0 / _662;
        float _666 = _142 * _664;
        _658 = _666;
    }
    _660 = false;
    float _668 = _658;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _672 = _668 + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _676 = _668 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _680 = _668 + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _698 = 1.0 / _684;
    float _700 = 1.0 / _692;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _704 = _668 + _702;
    bool _706 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _708 = 1.0 / _688;
    float _710 = _672 * _698;
    bool _712 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _714 = isnan(_668);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _724;
    float _728 = fma(_726, _710, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _730 = 1.0 / _696;
    float _732 = _676 * _700;
    bool _734 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _736 = isnan(_668);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -_722;
    float _748 = _746 + 1.0;
    float _750 = _744 * _748;
    float _752 = _680 * _708;
    bool _754 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _756 = isnan(_668);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _766;
    float _770 = -_744;
    float _772 = _770 + 1.0;
    bool _774 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _776 = isnan(_668);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = fma(_768, _710, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _788 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _790 = isnan(_668);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = _704 * _730;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _802;
    float _806 = -_764;
    float _808 = _806 + 1.0;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _814 = fma(_804, _710, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _816 = _764 * _772;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _822 = _784 * _808;
    float _824 = -_784;
    float _826 = _824 + 1.0;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _832 = fma(_812, _752, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _834 = fma(_820, _752, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _836 = _798 * _826;
    float _838 = fma(_830, _752, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _840 = -_798;
    float _842 = _840 + 1.0;
    float _844 = _814 * _836;
    float _846 = _728 * _836;
    float _848 = _786 * _836;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _850;
    float _854 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[143].x, _844);
    float _856 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[143].y, _846);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _858;
    float _862 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[143].z, _848);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _864;
    float _868 = fma(_832, _822, _854);
    float _870 = fma(_834, _822, _856);
    float _872 = fma(_852, _732, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _874 = fma(_860, _732, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _876 = fma(_838, _822, _862);
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _886 = fma(_866, _732, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _892 = fma(_872, _816, _868);
    float _894 = fma(_880, _800, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _896 = fma(_884, _800, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _898 = fma(_874, _816, _870);
    float _900 = fma(_890, _800, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _902 = fma(_886, _816, _876);
    float _904 = fma(_894, _750, _892);
    float _906 = fma(_896, _750, _898);
    float _908 = fma(_900, _750, _902);
    float _910 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[147].x, _904);
    float _912 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[147].y, _906);
    float _914 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[147].z, _908);
    bool _916 = !_706;
    float _932;
    if (!_916)
    {
        float _918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _920 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[11].x, _142);
        float _924 = _922 * _918;
        float _926 = floor(_924);
        float _928 = -_926;
        float _930 = _924 + _928;
        _932 = _930;
        _934 = true;
    }
    else
    {
        float _936 = float(_106);
        float _938 = 1.0 / _936;
        float _940 = _142 * _938;
        _932 = _940;
    }
    _934 = false;
    float _942 = _932;
    float _944 = in.m_61.x;
    float _946 = in.m_61.y;
    float _948 = in.m_61.z;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _952 = _942 + _950;
    bool _954 = _942 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _956 = isnan(_942);
    bool _958 = _954 || _956;
    bool _960 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _962 = _958 || _960;
    float _964 = float(_962);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _966;
    bool _970 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _972 = 1.0 / _968;
    float _974 = _914 * _948;
    float _976 = _912 * _946;
    float _978 = -_964;
    float _980 = _978 + 1.0;
    float _982 = _952 * _972;
    bool _984 = _942 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _986 = isnan(_942);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1004;
    float _1008 = _910 * _944;
    float _1010 = _994 * _980;
    float _1012 = fma(_998, _982, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1014 = fma(_1006, _982, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1016 = fma(_1002, _982, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1018 = -_994;
    float _1020 = _1018 + 1.0;
    float _1022 = _1012 * _1010;
    float _1024 = _1014 * _1010;
    float _1026 = _1016 * _1010;
    float _1028 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1022);
    float _1030 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1024);
    float _1032 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1026);
    float _1034 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1028);
    float _1036 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1030);
    float _1038 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1032);
    bool _1040 = !_970;
    float _1056;
    if (!_1040)
    {
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1044 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _1048 = _1046 * _1042;
        float _1050 = floor(_1048);
        float _1052 = -_1050;
        float _1054 = _1048 + _1052;
        _1056 = _1054;
        _1058 = true;
    }
    else
    {
        float _1060 = float(_106);
        float _1062 = 1.0 / _1060;
        float _1064 = _142 * _1062;
        _1056 = _1064;
    }
    _1058 = false;
    float _1066 = _1056;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1070 = _1066 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1076 = _1066 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1078 = isnan(_1066);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1084 = _1080 || _1082;
    float _1086 = float(_1084);
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1092 = _1066 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1094 = isnan(_1066);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1100 = _1096 || _1098;
    float _1102 = float(_1100);
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1104;
    bool _1108 = _1066 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1110 = isnan(_1066);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = 1.0 / _1074;
    float _1122 = -_1086;
    float _1124 = _1122 + 1.0;
    bool _1126 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1128 = _1102 * _1124;
    float _1130 = -_1102;
    float _1132 = _1130 + 1.0;
    float _1134 = 1.0 / _1090;
    float _1136 = _1106 * _1120;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1140 = _1138 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1142 = fma(_1136, _1070, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1144 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1146 = _1140 * _1134;
    float _1148 = _1142 * _1128;
    float _1150 = -_1118;
    float _1152 = _1150 + 1.0;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1156 = _1066 + _1154;
    float _1158 = _1144 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1160 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1148);
    float _1162 = _1086 * _1152;
    float _1164 = fma(_1146, _1156, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1166 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1168 = _1038 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1170 = fma(_1164, _1162, _1160);
    float _1172 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1174 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1170);
    float _1178 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1180 = !_1126;
    float _1196;
    if (!_1180)
    {
        float _1182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1184 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1186 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[11].z, _142);
        float _1188 = _1186 * _1182;
        float _1190 = floor(_1188);
        float _1192 = -_1190;
        float _1194 = _1188 + _1192;
        _1196 = _1194;
        _1198 = true;
    }
    else
    {
        float _1200 = float(_106);
        float _1202 = 1.0 / _1200;
        float _1204 = _142 * _1202;
        _1196 = _1204;
    }
    _1198 = false;
    float _1206 = _1196;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1210 = _1206 + _1208;
    bool _1212 = _1206 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1214 = isnan(_1206);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1220 = _1216 || _1218;
    float _1222 = float(_1220);
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1224;
    bool _1228 = _1206 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1230 = isnan(_1206);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = -_1222;
    float _1242 = _1240 + 1.0;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1244;
    float _1248 = 1.0 / _1226;
    bool _1250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1252 = _1238 * _1242;
    float _1254 = -_1238;
    float _1256 = _1254 + 1.0;
    float _1258 = _1210 * _1248;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1260;
    float _1264 = fma(_1246, _1258, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1266;
    float _1270 = fma(_1262, _1258, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1272 = _1264 * _1252;
    float _1274 = fma(_1268, _1258, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1276 = _1270 * _1252;
    float _1278 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1272);
    float _1280 = _1274 * _1252;
    float _1282 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1276);
    float _1284 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1278);
    float _1286 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1280);
    float _1288 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1282);
    float _1290 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1286);
    bool _1292 = !_1250;
    float _1308;
    if (!_1292)
    {
        float _1294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1296 = _128 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1298 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _1300 = _1298 * _1294;
        float _1302 = floor(_1300);
        float _1304 = -_1302;
        float _1306 = _1300 + _1304;
        _1308 = _1306;
        _1310 = true;
    }
    else
    {
        float _1312 = float(_106);
        float _1314 = 1.0 / _1312;
        float _1316 = _142 * _1314;
        _1308 = _1316;
    }
    _1310 = false;
    float _1318 = _1308;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1322 = _1318 + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1328 = _1318 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1330 = isnan(_1318);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1342 = _1340 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1346 = _1344 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1348 = _1318 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1350 = isnan(_1318);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1356 = _1352 || _1354;
    float _1358 = float(_1356);
    float _1360 = 1.0 / _1326;
    float _1362 = -_1338;
    float _1364 = _1362 + 1.0;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1366;
    bool _1370 = _1318 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1372 = isnan(_1318);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1378 = _1374 || _1376;
    float _1380 = float(_1378);
    float _1382 = _1358 * _1364;
    float _1384 = -_1358;
    float _1386 = _1384 + 1.0;
    bool _1388 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1390 = 1.0 / _1342;
    float _1392 = _1380 * _1386;
    float _1394 = -_1380;
    float _1396 = _1394 + 1.0;
    float _1398 = 1.0 / _1346;
    float _1400 = _1368 * _1360;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1406 = fma(_1400, _1322, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1408 = _1318 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1410 = isnan(_1318);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = _1404 * _1390;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1422;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1428 = _1318 + _1426;
    float _1430 = _1406 * _1392;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1434 = _1318 + _1432;
    float _1436 = _1284 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1438 = fma(_1420, _1428, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1440 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1430);
    float _1442 = _1424 * _1398;
    float _1444 = -_1418;
    float _1446 = _1444 + 1.0;
    float _1448 = fma(_1438, _1382, _1440);
    float _1450 = fma(_1442, _1434, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1452 = _1338 * _1446;
    float _1454 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1456 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1458 = fma(_1450, _1452, _1448);
    float _1460 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1462 = _1454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1464 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1466 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1458);
    float _1468 = _1466 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1470 = !_1388;
    float _1472 = _1452;
    float _1488;
    if (!_1470)
    {
        float _1474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1476 = _128 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[14].x, _142);
        float _1480 = _1478 * _1474;
        float _1482 = floor(_1480);
        float _1484 = -_1482;
        float _1486 = _1480 + _1484;
        _1488 = _1486;
        _1490 = true;
    }
    else
    {
        float _1492 = float(_106);
        float _1494 = 1.0 / _1492;
        float _1496 = _142 * _1494;
        _1488 = _1496;
    }
    _1490 = false;
    float _1498 = _1488;
    float _1500 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1502 = int(_1500);
    float _1504 = in.m_51.y;
    float _1506 = float(_106);
    float _1508 = _976 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1510 = in.m_51.z;
    float _1512 = _974 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1514 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1516 = int(_1514);
    out.m_63.x = _1158;
    out.m_63.y = _1172;
    out.m_63.z = _1174;
    out.m_63.w = _1178;
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1520 = _1498 + _1518;
    float _1522 = in.m_59.w;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1526 = _1524 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1528 = float(_1502);
    float _1530 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1532 = int(_1530);
    float _1534 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1538 = _1536 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1540 = in.m_55.w;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1544 = _1498 + _1542;
    float _1546 = _592 * _164;
    float _1548 = 1.0 / _1528;
    float _1550 = float(uint(_1516));
    float _1552 = _592 * _186;
    bool _1554 = _1516 == 0;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1558 = _1556 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1560 = fma(_602, _162, _1546);
    float _1562 = _128 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1564 = 1.0 / _1550;
    float _1566 = float(_1532);
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1570 = _1498 + _1568;
    bool _1572 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1574 = isnan(_1498);
    bool _1576 = _1572 || _1574;
    bool _1578 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1580 = _1576 || _1578;
    float _1582 = float(_1580);
    float _1584 = _142 * _1548;
    float _1586 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1588 = int(_1586);
    int _1590 = as_type<int>(_1564) + (-2);
    float _1592 = trunc(_1584);
    int _1594 = int(_1592);
    float _1596 = 1.0 / _1566;
    float _1598 = float(uint(_1588));
    int _1600 = ~_1588;
    int _1602 = _1600 + 1;
    float _1604 = float(_1588);
    int _1606 = ~_1588;
    int _1608 = _1606 + 1;
    float _1610 = 1.0 / _1598;
    float _1612 = float(uint(_1594));
    float _1614 = as_type<float>(_1590) * _1612;
    float _1616 = _142 * _1596;
    int _1618 = ~_1516;
    int _1620 = _1618 + 1;
    float _1622 = trunc(_1614);
    float _1624 = precise::max(_1622, 0.0);
    uint _1627 = uint(_1624);
    int _1629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1631 = _1629 != 0;
    int _1633 = as_type<int>(_1610) + (-2);
    float _1635 = trunc(_1616);
    int _1637 = int(_1635);
    int _1639 = _1590;
    if (_1631)
    {
        _1472 = 1.0;
    }
    float _1641 = _1472;
    int _1643 = _1620 * int(_1627);
    int _1645 = _1643 + _1594;
    float _1647 = _1641;
    float _1649 = as_type<float>(_1645);
    if (!_1631)
    {
        _1647 = 7.345489978790283203125;
    }
    float _1651 = _1647;
    float _1653 = 1.0 / _1506;
    float _1655 = float(uint(_1645));
    float _1657 = _1651 * _128;
    float _1659 = _1655;
    if (_1631)
    {
        _1649 = 1.0;
    }
    float _1661 = _1649;
    float _1663 = float(uint(_1637));
    float _1665 = 1.0 / _1558;
    float _1667 = _1661;
    if (!_1631)
    {
        _1667 = 1.2345600128173828125;
    }
    float _1669 = _1667;
    float _1671 = as_type<float>(_1633) * _1663;
    float _1673 = as_type<float>(_1590) * _1655;
    if (_1631)
    {
        _1659 = _128;
    }
    float _1675 = _1659;
    float _1677 = trunc(_1671);
    float _1679 = precise::max(_1677, 0.0);
    uint _1681 = uint(_1679);
    float _1683 = _1675;
    if (!_1631)
    {
        _1683 = _1504;
    }
    float _1685 = _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1689 = _1687 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1691 = _1685 * _1669;
    int _1693 = ~_1516;
    int _1695 = _1693 + 1;
    float _1697 = trunc(_1673);
    float _1699 = precise::max(_1697, 0.0);
    uint _1701 = uint(_1699);
    float _1703 = float(_1594);
    float _1705 = floor(_1657);
    int _1707 = _1602 * int(_1681);
    int _1709 = _1707 + _1637;
    float _1711 = float(uint(_1709));
    int _1713 = int(_1627) + int(_1701);
    float _1715 = floor(_1691);
    float _1717 = as_type<float>(_1633) * _1711;
    float _1719 = float(_1516);
    float _1721 = _142 * _1604;
    int _1723 = _1695 * _1713;
    int _1725 = _1723 + _1594;
    bool _1727 = _1703 >= _1719;
    bool _1729 = isnan(_1703);
    bool _1731 = _1727 || _1729;
    bool _1733 = isnan(_1719);
    bool _1735 = _1731 || _1733;
    float _1737 = float(_1735);
    float _1739 = trunc(_1717);
    float _1741 = precise::max(_1739, 0.0);
    uint _1743 = uint(_1741);
    float _1745 = -_1705;
    float _1747 = _1657 + _1745;
    float _1749 = _1721 * _1653;
    bool _1751 = uint(_1725) >= uint(_1516);
    float _1753 = _142 * _1719;
    float _1755 = _1747 * _1719;
    int _1757 = _1516 + (-1);
    float _1759 = trunc(_1737);
    int _1761 = int(_1759);
    bool _1763 = !_1751;
    int _1765 = _1763 ? 0 : (-1);
    float _1767 = -_1715;
    float _1769 = _1691 + _1767;
    int _1771 = ~_1588;
    int _1773 = _1771 + 1;
    float _1775 = _1753 * _1653;
    int _1777 = ~_1713;
    int _1779 = _1777 + _1765;
    int _1781 = _1779 + 1;
    float _1783 = _1604 * _1769;
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1787 = _1785 != 0;
    int _1789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1791 = _1789 != 0;
    int _1793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1795 = _1793 != 0;
    float _1797 = trunc(_1755);
    int _1799 = int(_1797);
    int _1801 = int(_1681) + int(_1743);
    int _1803 = _1516 * _1781;
    int _1805 = _1803 + _1594;
    int _1807 = _1773 * _1801;
    int _1809 = _1807 + _1637;
    bool _1811 = !_1554;
    int _1813 = _1811 ? _1805 : (-1);
    float _1815 = trunc(_1775);
    int _1817 = int(_1815);
    int _1819 = ~_1761;
    int _1821 = _1819 + 1;
    int _1823 = _1821 + 1;
    int _1825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1827 = _1825 != 0;
    bool _1829 = uint(_1809) >= uint(_1588);
    int _1831 = _1813 * _1823;
    bool _1833 = !_1791;
    int _1835 = _1833 ? 0 : 1;
    float _1837 = trunc(_1783);
    int _1839 = int(_1837);
    bool _1841 = !_1827;
    int _1843 = _1841 ? 0 : 1;
    int _1845 = _1761 * _1757;
    int _1847 = _1845 + _1831;
    float _1849 = float(_1637);
    bool _1851 = !_1787;
    int _1853 = _1851 ? 0 : 1;
    bool _1855 = _1849 >= _1604;
    bool _1857 = isnan(_1849);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan(_1604);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    float _1867 = trunc(_1749);
    int _1869 = int(_1867);
    int _1871 = abs(_1835);
    int _1873 = abs(_1853);
    int _1875 = abs(_1843);
    float _1877 = trunc(_1865);
    int _1879 = int(_1877);
    int _1881 = _1799 * _1875;
    int _1883 = _1881 + _1594;
    bool _1885 = !_1829;
    int _1887 = _1885 ? 0 : (-1);
    int _1889 = _1847 * _1871;
    int _1891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1893 = _1891 != 0;
    int _1895 = ~_1801;
    int _1897 = _1895 + _1887;
    int _1899 = _1897 + 1;
    int _1901 = _1817 * _1873;
    int _1903 = _1901 + _1889;
    bool _1905 = !_1795;
    int _1907 = _1905 ? 0 : 1;
    float _1909 = 1.0 / _1526;
    int _1911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1913 = _1911 != 0;
    int _1915 = _1588 * _1899;
    int _1917 = _1915 + _1637;
    bool _1919 = !_1893;
    int _1921 = _1919 ? 0 : 1;
    bool _1923 = _1588 == 0;
    int _1925 = abs(_1907);
    float _1927 = 1.0 / _1689;
    bool _1929 = !_1913;
    int _1931 = _1929 ? 0 : 1;
    int _1933 = abs(_1921);
    int _1935 = ~_1879;
    int _1937 = _1935 + 1;
    int _1939 = _1937 + 1;
    bool _1941 = !_1923;
    int _1943 = _1941 ? _1917 : (-1);
    int _1945 = _1839 * _1933;
    int _1947 = _1945 + _1637;
    int _1949 = abs(_1931);
    int _1951 = _1883 * _1925;
    int _1953 = _1951 + _1903;
    int _1955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1957 = _1955 != 0;
    int _1959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1961 = _1959 != 0;
    int _1963 = _1939 * _1943;
    int _1965 = _1588 + (-1);
    int _1967 = _1799 * _1949;
    int _1969 = _1967 + _1953;
    int _1971 = ~_1516;
    int _1973 = _1971 + 1;
    float _1975 = 1.0 / _1538;
    bool _1977 = !_1961;
    int _1979 = _1977 ? 0 : 1;
    int _1981 = _1879 * _1965;
    int _1983 = _1981 + _1963;
    int _1985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1987 = _1985 != 0;
    int _1989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1991 = _1989 != 0;
    bool _1993 = !_1957;
    int _1995 = _1993 ? 0 : 1;
    int _1997 = abs(_1979);
    bool _1999 = !_1987;
    int _2001 = _1999 ? 0 : 1;
    float _2003 = float(uint(_1969));
    int _2005 = abs(_1995);
    float _2007 = as_type<float>(_1590) * _2003;
    bool _2009 = !_1991;
    int _2011 = _2009 ? 0 : 1;
    int _2013 = abs(_2001);
    int _2015 = _1983 * _1997;
    float _2017 = trunc(_2007);
    float _2019 = precise::max(_2017, 0.0);
    uint _2021 = uint(_2019);
    int _2023 = abs(_2011);
    int _2025 = _1869 * _2005;
    int _2027 = _2025 + _2015;
    int _2029 = ~_1516;
    int _2031 = _2029 + 1;
    float _2033 = in.m_65.x;
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2037 = _2035 != 0;
    int _2039 = _1947 * _2013;
    int _2041 = _2039 + _2027;
    int _2043 = ~_1588;
    int _2045 = _2043 + 1;
    int _2047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2049 = _2047 != 0;
    int _2051 = _1839 * _2023;
    int _2053 = _2051 + _2041;
    bool _2055 = _1516 == 0;
    float _2057 = float(uint(_2053));
    int _2059 = _2031 * int(_2021);
    int _2061 = _2059 + _1969;
    bool _2063 = _1961;
    float _2065 = _2007;
    if (_2037)
    {
        bool _2067 = _128 > 0.5;
        _2063 = _2067;
    }
    bool _2069 = _2063;
    float _2071 = as_type<float>(_1633) * _2057;
    float _2073 = float(uint(_2061));
    float _2075 = trunc(_2071);
    float _2077 = precise::max(_2075, 0.0);
    uint _2079 = uint(_2077);
    float _2081 = as_type<float>(_1590) * _2073;
    float _2083 = _2073;
    if (!_2037)
    {
        _2083 = _2033;
    }
    float _2085 = _2083;
    float _2087 = trunc(_2081);
    float _2089 = precise::max(_2087, 0.0);
    uint _2091 = uint(_2089);
    float _2093 = _2085;
    if (!_2037)
    {
        _2065 = _2085;
    }
    float _2095 = _2065;
    float _2097 = _2095;
    if (_2037)
    {
        _2093 = _2033;
    }
    float _2099 = _2093;
    int _2101 = ~_1516;
    int _2103 = _2101 + 1;
    int _2105 = _2045 * int(_2079);
    int _2107 = _2105 + _2053;
    float _2109 = float(uint(_2107));
    float _2111 = in.m_65.y;
    int _2113 = int(_2021) + int(_2091);
    int _2115 = int(_2091);
    float _2117 = _2099;
    if (_2037)
    {
        float _2119 = -_2099;
        float _2121 = _2119 + 1.0;
        _2115 = as_type<int>(_2121);
    }
    int _2123 = _2115;
    float _2125 = as_type<float>(_1633) * _2109;
    int _2127 = _2103 * _2113;
    int _2129 = _2127 + _1969;
    int _2131 = _2129;
    if (_2037)
    {
        float _2133 = _2069 ? as_type<float>(_2123) : _2099;
        _2097 = _2133;
    }
    float _2135 = _2097;
    float _2137 = in.m_51.w;
    float _2139 = trunc(_2125);
    float _2141 = precise::max(_2139, 0.0);
    uint _2143 = uint(_2141);
    int _2145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2147 = _2145 != 0;
    bool _2149 = uint(_2129) >= uint(_1516);
    bool _2151 = _2149;
    if (_2049)
    {
        float _2153 = -_2099;
        float _2155 = _2153 + 1.0;
        _2131 = as_type<int>(_2155);
    }
    int _2157 = _2131;
    bool _2159 = !_2149;
    int _2161 = _2159 ? 0 : (-1);
    if (_2049)
    {
        bool _2163 = _1510 > 0.5;
        _2151 = _2163;
    }
    bool _2165 = _2151;
    int _2167 = ~_2113;
    int _2169 = _2167 + _2161;
    int _2171 = _2169 + 1;
    int _2173 = ~_1588;
    int _2175 = _2173 + 1;
    if (_2049)
    {
        float _2177 = _2165 ? as_type<float>(_2157) : _2099;
        _2117 = _2177;
    }
    float _2179 = _2117;
    int _2181 = _1516 * _2171;
    int _2183 = _2181 + _1969;
    int _2185 = int(_2079) + int(_2143);
    float _2187 = -_2111;
    float _2189 = _2187 + 1.0;
    bool _2191 = _1504 > 0.5;
    int _2193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2195 = _2193 != 0;
    int _2197 = _2175 * _2185;
    int _2199 = _2197 + _2053;
    int _2201 = _2191 ? as_type<int>(_2189) : as_type<int>(_2111);
    bool _2203 = !_2055;
    int _2205 = _2203 ? _2183 : (-1);
    bool _2207 = uint(_2199) >= uint(_1588);
    float _2209 = _2147 ? as_type<float>(_2201) : _2111;
    bool _2211 = !_2207;
    int _2213 = _2211 ? 0 : (-1);
    bool _2215 = _2137 > 0.5;
    int _2217 = ~_2185;
    int _2219 = _2217 + _2213;
    int _2221 = _2219 + 1;
    float _2223 = float(uint(_1883));
    int _2225 = _2205 & 3;
    bool _2227 = _2225 != 0;
    int _2229 = _1588 * _2221;
    int _2231 = _2229 + _2053;
    float _2233 = _2111;
    if (_2195)
    {
        float _2235 = _2215 ? _2189 : _2111;
        _2233 = _2235;
    }
    float _2237 = _2233;
    float _2239 = as_type<float>(_1590) * _2223;
    bool _2241 = uint(_2225) > 1u;
    float _2243 = _128 * 2.0;
    float _2245 = float(uint(_1947));
    bool _2247 = !_1923;
    int _2249 = _2247 ? _2231 : (-1);
    float _2251 = floor(_2243);
    int _2253 = _2205 & 3;
    bool _2255 = _2253 != 0;
    float _2257 = as_type<float>(_1633) * _2245;
    int _2259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2261 = _2259 != 0;
    int _2263 = _2255 ? 0 : 1;
    int _2265 = _2249 & 3;
    bool _2267 = _2265 != 0;
    float _2269 = trunc(_2239);
    float _2271 = precise::max(_2269, 0.0);
    uint _2273 = uint(_2271);
    int _2275 = ~_2263;
    int _2277 = _2275 + 1;
    int _2279 = _2277 + 1;
    int _2281 = _2279;
    if (!_2241)
    {
        int _2283 = ~_2263;
        int _2285 = _2283 + 1;
        _2281 = _2285;
    }
    int _2287 = _2281;
    int _2289 = _2267 ? 0 : 1;
    bool _2291 = uint(_2225) >= 2u;
    float _2293 = trunc(_2257);
    float _2295 = precise::max(_2293, 0.0);
    uint _2297 = uint(_2295);
    bool _2299 = _2225 != 3;
    float _2301 = _1504 * 2.0;
    int _2303 = _2291 ? 0 : 1;
    bool _2305 = uint(_2265) > 1u;
    int _2307 = ~_2303;
    int _2309 = _2307 + 1;
    int _2311 = _2309 + 1;
    int _2313 = _1973 * int(_2273);
    int _2315 = _2313 + _1883;
    int _2317 = ~_2289;
    int _2319 = _2317 + 1;
    int _2321 = _2319 + 1;
    float _2323 = floor(_2301);
    int _2325 = abs(_2287);
    float _2327 = float(uint(_2315));
    int _2329 = _2311;
    int _2331 = _2321;
    if (_2299)
    {
        int _2333 = ~_2303;
        int _2335 = _2333 + 1;
        _2329 = _2335;
    }
    int _2337 = _2329;
    int _2339 = _1608 * int(_2297);
    int _2341 = _2339 + _1947;
    bool _2343 = _2251 >= 0.0;
    bool _2345 = isnan(_2251);
    bool _2347 = _2343 || _2345;
    bool _2349 = isnan(0.0);
    bool _2351 = _2347 || _2349;
    float _2353 = as_type<float>(_1590) * _2327;
    if (!_2305)
    {
        int _2355 = ~_2289;
        int _2357 = _2355 + 1;
        _2331 = _2357;
    }
    int _2359 = _2331;
    float _2361 = float(uint(_2341));
    float _2363 = trunc(_2353);
    float _2365 = precise::max(_2363, 0.0);
    uint _2367 = uint(_2365);
    bool _2369 = _2251 > 0.0;
    float _2371 = as_type<float>(_1633) * _2361;
    int _2373 = _2351 ? 0 : 1;
    bool _2375 = _2323 > 0.0;
    int _2377 = ~_1516;
    int _2379 = _2377 + 1;
    float _2381 = trunc(_2371);
    float _2383 = precise::max(_2381, 0.0);
    uint _2385 = uint(_2383);
    int _2387 = ~_2373;
    int _2389 = _2387 + 1;
    int _2391 = _2389 + 1;
    int _2393 = _2391;
    if (_2261)
    {
        _1639 = 0;
    }
    int _2395 = _1639;
    int _2397 = _2395;
    if (!_2369)
    {
        int _2399 = ~_2373;
        int _2401 = _2399 + 1;
        _2393 = _2401;
    }
    int _2403 = _2393;
    bool _2405 = uint(_2265) >= 2u;
    int _2407 = int(_2273) + int(_2367);
    if (!_2261)
    {
        _2397 = 1;
    }
    int _2409 = _2397;
    bool _2411 = _2323 >= 0.0;
    bool _2413 = isnan(_2323);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan(0.0);
    bool _2419 = _2415 || _2417;
    int _2421 = _2405 ? 0 : 1;
    int _2423 = _2419 ? 0 : 1;
    bool _2425 = _2409 != 1;
    int _2427 = _2379 * _2407;
    int _2429 = _2427 + _1883;
    int _2431 = ~_1588;
    int _2433 = _2431 + 1;
    bool _2435 = _2265 != 3;
    int _2437 = ~_2423;
    int _2439 = _2437 + 1;
    int _2441 = _2439 + 1;
    int _2443 = _2441;
    if (!_2375)
    {
        int _2445 = ~_2423;
        int _2447 = _2445 + 1;
        _2443 = _2447;
    }
    int _2449 = _2443;
    bool _2451 = uint(_2429) >= uint(_1516);
    int _2453 = int(_2297) + int(_2385);
    float _2455 = 0.0;
    if (!_2425)
    {
        _2455 = _1504;
    }
    float _2457 = _2455;
    int _2459 = _2433 * _2453;
    int _2461 = _2459 + _1947;
    float _2463 = 0.0;
    float _2465 = _2457;
    if (!_2425)
    {
        _2463 = _1504;
    }
    float _2467 = _2463;
    float _2469 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2471 = _2469 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2473 = 0.0;
    float _2475 = _2467;
    if (!_2425)
    {
        _2473 = _1510;
    }
    float _2477 = _2473;
    float _2479 = 0.0;
    float _2481 = _2477;
    if (!_2425)
    {
        _2479 = _1510;
    }
    float _2483 = _2479;
    int _2485 = ~_2421;
    int _2487 = _2485 + 1;
    int _2489 = _2487 + 1;
    float _2491 = 1.0 / _2471;
    float _2493 = _2483;
    int _2495 = _2489;
    if (_2425)
    {
        _2465 = _128;
    }
    float _2497 = _2465;
    if (_2425)
    {
        _2475 = _128;
    }
    float _2499 = _2475;
    if (_2425)
    {
        _2481 = _1504;
    }
    float _2501 = _2481;
    float _2503 = _2497 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2425)
    {
        _2493 = _1504;
    }
    float _2505 = _2493;
    if (_2435)
    {
        int _2507 = ~_2421;
        int _2509 = _2507 + 1;
        _2495 = _2509;
    }
    int _2511 = _2495;
    float _2513 = _2501 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2515 = uint(_2461) >= uint(_1588);
    float _2517 = in.m_67.x;
    float _2519 = in.m_67.y;
    float _2521 = in.m_67.z;
    bool _2523 = !_2451;
    int _2525 = _2523 ? 0 : (-1);
    bool _2527 = !_2515;
    int _2529 = _2527 ? 0 : (-1);
    int _2531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2533 = _2531 != 0;
    int _2535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2537 = _2535 != 0;
    int _2539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2541 = _2539 != 0;
    float _2543 = _592 * _170;
    int _2545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2547 = _2545 != 0;
    float _2549 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2553 = _2551 != 0;
    float _2555 = fma(_602, _168, _2543);
    float _2557 = fma(_602, _184, _1552);
    float _2559 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2561 = fma(_2549, -2.0, _2559);
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2565 = _2563 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2567 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2569 = fma(_624, _166, _1560);
    float _2571 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2519);
    float _2573 = fma(_624, _188, _2557);
    float _2575 = _1510 * 2.0;
    float _2577 = 1.0 / _2565;
    float _2579 = _2571 * _1508;
    float _2581 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2583 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2585 = _2583 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2587 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2517);
    float _2589 = _2569 + _1540;
    float _2591 = -_2581;
    float _2593 = fma(_1562, 2.0, _2591);
    float _2595 = fma(_624, _172, _2555);
    float _2597 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2599 = log2(_2597);
    float _2601 = _2587 * _2567;
    float _2603 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2521);
    bool _2605 = !_2537;
    int _2607 = _2605 ? 0 : 1;
    float _2609 = _2603 * _1512;
    float _2611 = floor(_2575);
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2615 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2613;
    float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2619 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2617;
    bool _2621 = !_2541;
    int _2623 = _2621 ? 0 : 1;
    float _2625 = _2615 * _2491;
    float _2627 = _2619 * _1665;
    float _2629 = 1.0 / _2585;
    float _2631 = _142 * _2599;
    float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2635 = _2633 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2637 = !_2533;
    float _2639 = _2637 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _2641 = abs(_2623);
    int _2643 = ~_2407;
    int _2645 = _2643 + _2525;
    int _2647 = _2645 + 1;
    float _2649 = exp2(_2631);
    bool _2651 = _2611 >= 0.0;
    bool _2653 = isnan(_2611);
    bool _2655 = _2651 || _2653;
    bool _2657 = isnan(0.0);
    bool _2659 = _2655 || _2657;
    int _2661 = _1516 * _2647;
    int _2663 = _2661 + _1883;
    int _2665 = ~_2325;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    float _2671 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1534);
    float _2673 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2675 = _2673 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2677 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2677;
    int _2681 = _2659 ? 0 : 1;
    float _2683 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2685 = _2683 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2687 = _2675 * _2577;
    float _2689 = _2679 * _1909;
    bool _2691 = _2611 > 0.0;
    float _2693 = _2685 * _1975;
    int _2695 = ~_2681;
    int _2697 = _2695 + 1;
    int _2699 = _2697 + 1;
    float _2701 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2703 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2701;
    float _2705 = _128 + _1504;
    float _2707 = -_2649;
    float _2709 = _2707 + 1.0;
    float _2711 = _2635 * _2629;
    float _2713 = _2703 * _1927;
    float _2715 = _128 + _1510;
    float _2717 = in.m_57.w;
    float _2719 = _2705 + (-1.0);
    float _2721 = _2715 + (-1.0);
    int _2723 = _2699;
    float _2725 = _2639;
    if (!_2691)
    {
        int _2727 = ~_2681;
        int _2729 = _2727 + 1;
        _2723 = _2729;
    }
    int _2731 = _2723;
    float _2733 = fma(_2719, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2735 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2737 = isnan(0.0);
    bool _2739 = _2735 || _2737;
    bool _2741 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2743 = _2739 || _2741;
    float _2745 = _1504 + _1510;
    float _2747 = fma(_2721, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2749 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2671);
    float _2751 = _2743 ? _2709 : 0.0;
    float _2753 = _2745 + (-1.0);
    bool _2755 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2757 = isnan(1.0);
    bool _2759 = _2755 || _2757;
    bool _2761 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2763 = _2759 || _2761;
    float _2765 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2767 = 1.0 + _2765;
    bool _2769 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2771 = isnan(_1498);
    bool _2773 = _2769 || _2771;
    bool _2775 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2777 = _2773 || _2775;
    float _2779 = float(_2777);
    float _2781 = fma(_2753, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2783 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2785 = isnan(_1498);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2791 = _2787 || _2789;
    float _2793 = float(_2791);
    float _2795 = 1.0 / _2767;
    float _2797 = fma(_2689, _1520, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2799 = -_2779;
    float _2801 = _2799 + 1.0;
    float _2803 = fma(_2687, _1544, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2805 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2807 = _1498 + _2805;
    float _2809 = _2595 + _2717;
    bool _2811 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2813 = isnan(_1498);
    bool _2815 = _2811 || _2813;
    bool _2817 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2819 = _2815 || _2817;
    float _2821 = float(_2819);
    float _2823 = -_2793;
    float _2825 = _2823 + 1.0;
    float _2827 = _2793 * _2801;
    float _2829 = _2573 + _1522;
    bool _2831 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2833 = isnan(_1498);
    bool _2835 = _2831 || _2833;
    bool _2837 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2839 = _2835 || _2837;
    float _2841 = float(_2839);
    float _2843 = _2821 * _2825;
    float _2845 = -_2821;
    float _2847 = _2845 + 1.0;
    bool _2849 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2851 = isnan(_1498);
    bool _2853 = _2849 || _2851;
    bool _2855 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2857 = _2853 || _2855;
    float _2859 = float(_2857);
    float _2861 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2863 = _1498 + _2861;
    float _2865 = -_2841;
    float _2867 = _2865 + 1.0;
    float _2869 = _2841 * _2847;
    float _2871 = _2751 * _2795;
    bool _2873 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2875 = isnan(_1498);
    bool _2877 = _2873 || _2875;
    bool _2879 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2881 = _2877 || _2879;
    float _2883 = float(_2881);
    float _2885 = -_2859;
    float _2887 = _2885 + 1.0;
    float _2889 = fma(_2625, _2863, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2891 = _2859 * _2867;
    bool _2893 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2895 = isnan(_1498);
    bool _2897 = _2893 || _2895;
    bool _2899 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2901 = _2897 || _2899;
    float _2903 = float(_2901);
    float _2905 = in.m_69.x;
    float _2907 = in.m_69.y;
    float _2909 = in.m_69.z;
    float _2911 = _2883 * _2887;
    float _2913 = -_2883;
    float _2915 = _2913 + 1.0;
    bool _2917 = !_2763;
    float _2919 = _2917 ? _142 : _2871;
    float _2921 = -_2903;
    float _2923 = _2921 + 1.0;
    bool _2925 = _2519 != 0.0;
    bool _2927 = isnan(_2519);
    bool _2929 = _2925 || _2927;
    bool _2931 = isnan(0.0);
    bool _2933 = _2929 || _2931;
    float _2935 = _2903 * _2915;
    float _2937 = fma(_2693, _1570, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2939 = _1582 * _2923;
    bool _2941 = _2517 == 0.0;
    bool _2943 = !_2933;
    bool _2945 = _2941 && _2943;
    float _2947 = -_1582;
    float _2949 = _2947 + 1.0;
    int _2951 = abs(as_type<int>(_2639));
    float _2953 = _2889 * _2939;
    bool _2955 = _2521 == 0.0;
    bool _2957 = _2955 && _2945;
    float _2959 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2961 = _1498 + _2959;
    float _2963 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2965 = _1498 + _2963;
    float _2967 = fma(_2949, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2953);
    float _2969 = fma(_2627, _2807, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2971 = fma(_2711, _2961, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2973 = fma(_2713, _2965, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2975 = fma(_2803, _2935, _2967);
    float _2977 = in.m_71.x;
    float _2979 = in.m_71.y;
    float _2981 = in.m_71.z;
    int _2983 = abs(_2607);
    float _2985 = sqrt(_2749);
    float _2987 = fma(_2797, _2911, _2975);
    int _2989 = ~_2453;
    int _2991 = _2989 + _2529;
    int _2993 = _2991 + 1;
    float _2995 = _2949;
    float _2997 = _2953;
    float _2999 = _2807;
    float _3001 = _2871;
    float _3003 = as_type<float>(_2731);
    if (_2957)
    {
        _2995 = _2905;
    }
    float _3005 = _2995;
    float _3007 = fma(_2937, _2891, _2987);
    float _3009 = _3005;
    if (_2957)
    {
        _2997 = _2907;
    }
    float _3011 = _2997;
    float _3013 = _3011;
    if (_2957)
    {
        _2725 = _3005;
    }
    float _3015 = _2725;
    float _3017 = fma(_2969, _2869, _3007);
    float _3019 = _3015;
    if (_2957)
    {
        _2999 = _3011;
    }
    float _3021 = _2999;
    float _3023 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3025 = int(_3023);
    float _3027 = _3021;
    if (!_2957)
    {
        _3009 = _2905;
    }
    float _3029 = _3009;
    float _3031 = fma(_2971, _2843, _3017);
    if (!_2957)
    {
        _3013 = _2907;
    }
    float _3033 = _3013;
    if (_2957)
    {
        _3001 = _2909;
    }
    float _3035 = _3001;
    float _3037 = _3035;
    if (!_2957)
    {
        float _3039 = fma(_2517, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3029);
        _3019 = _3039;
    }
    float _3041 = _3019;
    if (!_2957)
    {
        float _3043 = fma(_2519, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3033);
        _3027 = _3043;
    }
    float _3045 = _3027;
    float _3047 = float(_2951);
    float _3049 = _1510 + (-0.5);
    float _3051 = float(_2731);
    float _3053 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_2957)
    {
        _3003 = _3035;
    }
    float _3055 = _3003;
    float _3057 = fma(_2973, _2827, _3031);
    float _3059 = _3055;
    if (!_2957)
    {
        _3037 = _2909;
    }
    float _3061 = _3037;
    float _3063 = _3047 * _3051;
    float _3065 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3053);
    float _3067 = _3063 * (-2.0);
    float _3069 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3071 = float(_2403);
    float _3073 = _128 + (-0.5);
    float _3075 = fma(_3067, _2977, _2977);
    float _3077 = fma(_2499, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3069);
    float _3079 = float(_2983);
    float _3081 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3083 = fma(_3073, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3075);
    float _3085 = fma(_2733, _3067, _2733);
    float _3087 = fma(_1504, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3081);
    float _3089 = _3079 * _3071;
    float _3091 = _1504 + (-0.5);
    float _3093 = fma(_2919, _3085, _3083);
    float _3095 = _3089 * (-2.0);
    float _3097 = float(_2449);
    float _3099 = fma(_2779, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3057);
    float _3101 = float(_2641);
    float _3103 = fma(_3095, _2979, _2979);
    float _3105 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3107 = _3093 * 0.15915493667125701904296875;
    float _3109 = fma(_2781, _3095, _2781);
    float _3111 = _3101 * _3097;
    float _3113 = fma(_3091, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3103);
    float _3115 = fma(_2505, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3105);
    float _3117 = _3107 * 6.283185482025146484375;
    float _3119 = cos(_3117);
    float _3121 = _3111 * (-2.0);
    float _3123 = fma(_2919, _3109, _3113);
    float _3125 = in.m_73.x;
    float _3127 = in.m_73.y;
    float _3129 = in.m_73.z;
    float _3131 = in.m_73.w;
    float _3133 = fma(_3121, _2981, _2981);
    float _3135 = fma(_2747, _3121, _2747);
    float _3137 = _3123 * 0.15915493667125701904296875;
    float _3139 = _3107 * 6.283185482025146484375;
    float _3141 = sin(_3139);
    float _3143 = fma(_3049, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3133);
    float _3145 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3147 = _2985 * 50.0;
    float _3149 = fma(_2919, _3135, _3143);
    if (!_2957)
    {
        float _3151 = fma(_2521, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3061);
        _3059 = _3151;
    }
    float _3153 = _3059;
    float _3155 = fma(_2513, -2.0, _3145);
    float _3157 = _3137 * 6.283185482025146484375;
    float _3159 = sin(_3157);
    float _3161 = _3149 * 0.15915493667125701904296875;
    float _3163 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3165 = _3099 * _3147;
    bool _3167 = _1516 == 0;
    float _3169 = -_3163;
    float _3171 = fma(_2503, 2.0, _3169);
    float _3173 = _3165 * _3165;
    float _3175 = _3137 * 6.283185482025146484375;
    float _3177 = cos(_3175);
    float _3179 = _3129 * _3029;
    float _3181 = _3127 * _3061;
    float _3183 = _3125 * _3033;
    float _3185 = _3161 * 6.283185482025146484375;
    float _3187 = cos(_3185);
    float _3189 = -_3179;
    float _3191 = fma(_3125, _3061, _3189);
    float _3193 = -_3181;
    float _3195 = fma(_3129, _3033, _3193);
    float _3197 = _3119 * _3159;
    float _3199 = -_3183;
    float _3201 = fma(_3127, _3029, _3199);
    float _3203 = _3191 * _3131;
    float _3205 = _3195 * _3131;
    float _3207 = _3161 * 6.283185482025146484375;
    float _3209 = sin(_3207);
    float _3211 = _3119 * _3177;
    float _3213 = _3141 * _3177;
    float _3215 = _3201 * _3131;
    float _3217 = _3119 * _3187;
    int _3219 = _2205 >> 31;
    float _3221 = _3141 * _3159;
    float _3223 = _3141 * _3187;
    float _3225 = _3159 * _3187;
    int _3227 = _3219 & 3;
    float _3229 = _3217 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3231 = _3177 * _3187;
    float _3233 = -_3197;
    float _3235 = fma(_3209, _3213, _3233);
    float _3237 = -_3213;
    float _3239 = fma(_3209, _3197, _3237);
    int _3241 = _2205 + _3227;
    float _3243 = _3217 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3245 = -_3209;
    float _3247 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3229);
    float _3249 = -_2579;
    float _3251 = _3209 * _3249;
    float _3253 = fma(_3209, _3211, _3221);
    float _3255 = -_3209;
    float _3257 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3243);
    int _3259 = _2249 >> 31;
    float _3261 = fma(_3231, _2601, _3251);
    float _3263 = _3217 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3265 = _3223 * _2579;
    int _3267 = _3259 & 3;
    float _3269 = _3217 * _2579;
    float _3271 = fma(_3209, _3221, _3211);
    float _3273 = -_3209;
    float _3275 = fma(_3273, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3263);
    int _3277 = _2249 + _3267;
    float _3279 = fma(_3253, _2601, _3269);
    int _3281 = _3241 >> 2;
    float _3283 = rsqrt(_3173);
    int _3285 = _3277 >> 2;
    float _3287 = fma(_3235, _2601, _3265);
    int _3289 = _3281 << 4;
    int _3291 = _3289 + 368;
    float _3293 = _3253 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3295 = _3285 << 4;
    int _3297 = _3295 + 512;
    float _3299 = _3253 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _3301 = uint(int(uint(_3291) >> uint(2)));
    uint _3303 = uint(int(uint(int(_3301)) >> uint(2)));
    int _3305 = int(_3301) & 3;
    float _3307 = (*spvDescriptorSet0.vp_c9)._m0[int(_3303)][_3305];
    int _3309 = int(_3301) + 1;
    uint _3311 = uint(int(uint(_3309) >> uint(2)));
    int _3313 = _3309 & 3;
    float _3315 = (*spvDescriptorSet0.vp_c9)._m0[int(_3311)][_3313];
    float _3317 = _3239 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3319 = _3239 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3321 = fma(_3225, _2609, _3261);
    float _3323 = fma(_3239, _2609, _3279);
    float _3325 = fma(_3271, _2609, _3287);
    float _3327 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3317);
    float _3329 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3319);
    uint _3331 = uint(int(uint(_3297) >> uint(2)));
    uint _3333 = uint(int(uint(int(_3331)) >> uint(2)));
    int _3335 = int(_3331) & 3;
    float _3337 = (*spvDescriptorSet0.vp_c9)._m0[int(_3333)][_3335];
    int _3339 = int(_3331) + 1;
    uint _3341 = uint(int(uint(_3339) >> uint(2)));
    int _3343 = _3339 & 3;
    float _3345 = (*spvDescriptorSet0.vp_c9)._m0[int(_3341)][_3343];
    float _3347 = _3165 * _3283;
    float _3349 = _3253 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3351 = _3239 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3353 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3293);
    float _3355 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3299);
    float _3357 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3349);
    float _3359 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3351);
    int _3361 = _3297 + 8;
    uint _3363 = uint(int(uint(_3361) >> uint(2)));
    uint _3365 = uint(int(uint(int(_3363)) >> uint(2)));
    int _3367 = int(_3363) & 3;
    float _3369 = (*spvDescriptorSet0.vp_c9)._m0[int(_3365)][_3367];
    int _3371 = int(_3363) + 1;
    uint _3373 = uint(int(uint(_3371) >> uint(2)));
    int _3375 = _3371 & 3;
    float _3377 = (*spvDescriptorSet0.vp_c9)._m0[int(_3373)][_3375];
    float _3379 = _3323 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3381 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3357);
    float _3383 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3353);
    float _3385 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3355);
    float _3387 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3379);
    float _3389 = _3323 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3391 = _3323 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3393 = _3291 + 8;
    uint _3395 = uint(int(uint(_3393) >> uint(2)));
    uint _3397 = uint(int(uint(int(_3395)) >> uint(2)));
    int _3399 = int(_3395) & 3;
    float _3401 = (*spvDescriptorSet0.vp_c9)._m0[int(_3397)][_3399];
    int _3403 = int(_3395) + 1;
    uint _3405 = uint(int(uint(_3403) >> uint(2)));
    int _3407 = _3403 & 3;
    float _3409 = (*spvDescriptorSet0.vp_c9)._m0[int(_3405)][_3407];
    float _3411 = fma(_3325, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3387);
    bool _3413 = !_2227;
    int _3415 = _3413 ? 0 : 1;
    float _3417 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3389);
    int _3419 = _2249 & 3;
    bool _3421 = _3419 != 0;
    float _3423 = fma(_3223, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3257);
    int _3425 = abs(_2359);
    float _3427 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3391);
    float _3429 = fma(_3325, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3417);
    bool _3431 = !_3421;
    int _3433 = _3431 ? 0 : 1;
    float _3435 = _3411 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _3437 = ~_3425;
    int _3439 = _3437 + 1;
    int _3441 = _3439 + 1;
    float _3443 = fma(_3325, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3427);
    bool _3445 = _2225 != 3;
    float _3447 = fma(_3223, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3247);
    int _3449 = abs(_3415);
    float _3451 = fma(_3223, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3275);
    int _3453 = abs(_3433);
    float _3455 = sqrt(_3173);
    bool _3457 = !_3445;
    int _3459 = _3457 ? 0 : (-1);
    float _3461 = _3423 * _3127;
    bool _3463 = _2265 != 3;
    float _3465 = _3447 * _3127;
    int _3467 = abs(_2337);
    int _3469 = _2669 * as_type<int>(_3315);
    float _3471 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3473 = int(_3471);
    int _3475 = abs(_3459);
    float _3477 = _3451 * _3127;
    int _3479 = ~_3453;
    int _3481 = _3479 + 1;
    int _3483 = _3481 + 1;
    float _3485 = _3423 * _3045;
    float _3487 = _3447 * _3045;
    int _3489 = _3441 * as_type<int>(_3345);
    float _3491 = _3203 * _3447;
    int _3493 = abs(_2511);
    int _3495 = _3483 * as_type<int>(_3337);
    int _3497 = _3495 + _3489;
    int _3499 = ~_3449;
    int _3501 = _3499 + 1;
    int _3503 = _3501 + 1;
    float _3505 = _3451 * _3045;
    float _3507 = float(uint(_3025));
    int _3509 = _3503 * as_type<int>(_3307);
    int _3511 = _3509 + _3469;
    int _3513 = ~_3493;
    int _3515 = _3513 + 1;
    int _3517 = _3515 + 1;
    int _3519 = abs(_3473);
    float _3521 = 1.0 / _3507;
    int _3523 = ~_3467;
    int _3525 = _3523 + 1;
    int _3527 = _3525 + 1;
    int _3529 = _3517 * as_type<int>(_3369);
    int _3531 = _3529 + _3497;
    bool _3533 = !_3463;
    int _3535 = _3533 ? 0 : (-1);
    int _3537 = _3527 * as_type<int>(_3401);
    int _3539 = _3537 + _3511;
    int _3541 = abs(_3535);
    bool _3543 = !_2547;
    int _3545 = _3543 ? 0 : 1;
    bool _3547 = !_2553;
    int _3549 = _3547 ? 0 : 1;
    int _3551 = abs(_3545);
    int _3553 = ~_3475;
    int _3555 = _3553 + 1;
    int _3557 = _3555 + 1;
    int _3559 = ~_3541;
    int _3561 = _3559 + 1;
    int _3563 = _3561 + 1;
    int _3565 = abs(_3549);
    int _3567 = _3557 * as_type<int>(_3409);
    int _3569 = _3567 + _3539;
    float _3571 = float(uint(_3473));
    int _3573 = _3563 * as_type<int>(_3377);
    int _3575 = _3573 + _3531;
    int _3577 = ~_3551;
    int _3579 = _3577 + 1;
    int _3581 = _3579 + 1;
    int _3583 = _1588 * _2993;
    int _3585 = _3583 + _1947;
    float _3587 = float(uint(_3519));
    float _3589 = _3429 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _3591 = abs(_3025);
    int _3593 = _3569 * _3581;
    bool _3595 = !_3167;
    int _3597 = _3595 ? _2663 : (-1);
    float _3599 = 1.0 / _3571;
    int _3601 = ~_3565;
    int _3603 = _3601 + 1;
    int _3605 = _3603 + 1;
    bool _3607 = _1588 == 0;
    int _3609 = _3597 * _3551;
    int _3611 = _3609 + _3593;
    float _3613 = float(uint(_3591));
    int _3615 = _3605 * _3575;
    bool _3617 = !_3607;
    int _3619 = _3617 ? _3585 : (-1);
    float _3621 = 1.0 / _3587;
    int _3623 = ~_3025;
    int _3625 = _3623 + 1;
    float _3627 = _3443 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _3629 = as_type<int>(_3521) + (-2);
    int _3631 = _3619 * _3565;
    int _3633 = _3631 + _3615;
    float _3635 = _3589 * _3589;
    float _3637 = float(uint(_3611));
    float _3639 = 1.0 / _3613;
    int _3641 = as_type<int>(_3599) + (-2);
    float _3643 = fma(_3435, _3435, _3635);
    float _3645 = float(uint(_3633));
    float _3647 = as_type<float>(_3629) * _3637;
    int _3649 = abs(_3633);
    float _3651 = fma(_3627, _3627, _3643);
    float _3653 = _2809 + _3435;
    float _3655 = trunc(_3647);
    float _3657 = precise::max(_3655, 0.0);
    uint _3659 = uint(_3657);
    int _3661 = as_type<int>(_3621) + (-2);
    float _3663 = as_type<float>(_3641) * _3645;
    int _3665 = abs(_3611);
    float _3667 = _2829 + _3627;
    int _3669 = ~_3473;
    int _3671 = _3669 + 1;
    float _3673 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3675 = _3653 + _3673;
    float _3677 = float(uint(_3665));
    float _3679 = rsqrt(_3651);
    int _3681 = as_type<int>(_3639) + (-2);
    float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3685 = _3667 + _3683;
    float _3687 = _3675 * _3675;
    float _3689 = fma(_3381, _3041, _3485);
    float _3691 = as_type<float>(_3681) * _3677;
    float _3693 = _3203 * _3423;
    float _3695 = trunc(_3663);
    float _3697 = precise::max(_3695, 0.0);
    uint _3699 = uint(_3697);
    float _3701 = float(uint(_3649));
    float _3703 = _3685 * _3685;
    float _3705 = _3203 * _3451;
    float _3707 = as_type<float>(_3661) * _3701;
    float _3709 = _3687 + _3703;
    float _3711 = trunc(_3691);
    float _3713 = precise::max(_3711, 0.0);
    uint _3715 = uint(_3713);
    int _3717 = _3625 * int(_3659);
    int _3719 = _3717 + _3611;
    float _3721 = float(uint(_3719));
    float _3723 = trunc(_3707);
    float _3725 = precise::max(_3723, 0.0);
    uint _3727 = uint(_3725);
    int _3729 = _3671 * int(_3699);
    int _3731 = _3729 + _3633;
    int _3733 = ~_3591;
    int _3735 = _3733 + 1;
    float _3737 = as_type<float>(_3629) * _3721;
    float _3739 = fma(_3271, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3327);
    float _3741 = fma(_3271, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3359);
    float _3743 = float(uint(_3731));
    float _3745 = fma(_3271, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3329);
    float _3747 = sqrt(_3709);
    int _3749 = ~_3519;
    int _3751 = _3749 + 1;
    int _3753 = _3735 * int(_3715);
    int _3755 = _3753 + _3665;
    float _3757 = _3589 * _3679;
    float _3759 = as_type<float>(_3641) * _3743;
    float _3761 = fma(_3205, _3381, _3693);
    int _3763 = _3751 * int(_3727);
    int _3765 = _3763 + _3649;
    float _3767 = float(uint(_3755));
    float _3769 = trunc(_3737);
    float _3771 = precise::max(_3769, 0.0);
    uint _3773 = uint(_3771);
    float _3775 = fma(_3385, _3041, _3505);
    float _3777 = _3347 * _3757;
    float _3779 = fma(_3383, _3041, _3487);
    float _3781 = as_type<float>(_3681) * _3767;
    float _3783 = fma(_3383, _3125, _3465);
    float _3785 = fma(_3205, _3383, _3491);
    float _3787 = _3777 * _3455;
    bool _3789 = _3747 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3791 = fma(_3205, _3385, _3705);
    float _3793 = float(uint(_3765));
    float _3795 = trunc(_3759);
    float _3797 = precise::max(_3795, 0.0);
    uint _3799 = uint(_3797);
    float _3801 = fma(_3347, _3787, _3589);
    float _3803 = fma(_3381, _3125, _3461);
    float _3805 = fma(_3385, _3125, _3477);
    float _3807 = as_type<float>(_3661) * _3793;
    float _3809 = _2589 + _3801;
    float _3811 = fma(_3741, _3129, _3803);
    float _3813 = fma(_3739, _3129, _3783);
    float _3815 = trunc(_3781);
    float _3817 = precise::max(_3815, 0.0);
    uint _3819 = uint(_3817);
    float _3821 = fma(_3745, _3129, _3805);
    float _3823 = _3801;
    float _3825 = _3787;
    float _3827 = _3653;
    float _3829 = _3687;
    float _3831 = _3703;
    float _3833 = _3215;
    float _3835 = _3813;
    float _3837 = _3811;
    if (!_3789)
    {
        _3823 = _3653;
    }
    float _3839 = _3823;
    float _3841 = _3839;
    if (!_3789)
    {
        _3825 = _3667;
    }
    float _3843 = _3825;
    float _3845 = _3843;
    if (!_3789)
    {
        _3827 = _3809;
    }
    float _3847 = _3827;
    float _3849 = trunc(_3807);
    float _3851 = precise::max(_3849, 0.0);
    uint _3853 = uint(_3851);
    bool _3855 = !_3789;
    float _3857 = _3847;
    if (!_3855)
    {
        float _3859 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3863 = _3747 + _3861;
        float _3865 = _3809 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3867 = rsqrt(_3709);
        float _3869 = _3863 * _3859;
        float _3871 = _3869 * 0.15915493667125701904296875;
        float _3873 = _3871 * 6.283185482025146484375;
        float _3875 = sin(_3873);
        float _3877 = _3871 * 6.283185482025146484375;
        float _3879 = cos(_3877);
        float _3881 = fma(_3875, _3865, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3883 = _3867 * _3881;
        float _3885 = fma(_3675, _3883, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3887 = _3879 + (-1.0);
        float _3889 = fma(_3685, _3883, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3891 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3893 = _3885 + _3891;
        float _3895 = _3887 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3899 = _3889 + _3897;
        float _3901 = _3893 * _3893;
        float _3903 = fma(_3809, _3879, _3895);
        float _3905 = _3899 * _3899;
        _3857 = _3903;
        _3829 = _3901;
        _3831 = _3905;
        _3841 = _3885;
        _3845 = _3889;
    }
    float _3907 = _3857;
    float _3909 = _3829;
    float _3911 = _3831;
    float _3913 = _3841;
    float _3915 = _3845;
    int _3917 = int(_3659) + int(_3773);
    float _3919 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3065);
    int _3921 = ~_3025;
    int _3923 = _3921 + 1;
    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3927 = _3907 + _3925;
    int _3929 = int(_3699) + int(_3799);
    float _3931 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2561);
    int _3933 = int(_3715) + int(_3819);
    int _3935 = _3923 * _3917;
    int _3937 = _3935 + _3611;
    int _3939 = ~_3591;
    int _3941 = _3939 + 1;
    float _3943 = fma(_3927, _3927, _3909);
    int _3945 = ~_3473;
    int _3947 = _3945 + 1;
    float _3949 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3155);
    bool _3951 = uint(_3937) >= uint(_3025);
    int _3953 = _3941 * _3933;
    int _3955 = _3953 + _3665;
    int _3957 = int(_3727) + int(_3853);
    int _3959 = _3947 * _3929;
    int _3961 = _3959 + _3633;
    int _3963 = ~_3519;
    int _3965 = _3963 + 1;
    float _3967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3969 = !_3951;
    int _3971 = _3969 ? 0 : (-1);
    float _3973 = _3943 + _3911;
    bool _3975 = uint(_3955) >= uint(_3591);
    int _3977 = _3965 * _3957;
    int _3979 = _3977 + _3649;
    int _3981 = ~_3917;
    int _3983 = _3981 + _3971;
    int _3985 = _3983 + 1;
    float _3987 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3087);
    bool _3989 = uint(_3961) >= uint(_3473);
    float _3991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3993 = uint(_3979) >= uint(_3519);
    int _3995 = _3025 * _3985;
    int _3997 = _3995 + _3611;
    bool _3999 = !_3975;
    int _4001 = _3999 ? 0 : (-1);
    float _4003 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3115);
    bool _4005 = !_3989;
    int _4007 = _4005 ? 0 : (-1);
    out.m_75.x = _1460;
    out.m_75.y = _1462;
    out.m_75.z = _1464;
    out.m_75.w = _1468;
    bool _4009 = _3025 == 0;
    float _4011 = sqrt(_3973);
    int _4013 = ~_3929;
    int _4015 = _4013 + _4007;
    int _4017 = _4015 + 1;
    out.m_77.x = _3811;
    out.m_77.y = _3813;
    out.m_77.z = _3821;
    int _4019 = ~_4001;
    int _4021 = _3933 + _4019;
    int _4023 = _4021 + 1;
    bool _4025 = !_4009;
    int _4027 = _4025 ? _3997 : (-1);
    int _4029 = _3473 * _4017;
    int _4031 = _4029 + _3633;
    bool _4033 = _3025 == 0;
    float _4035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4037 = _3611 ^ _3025;
    bool _4039 = _3473 == 0;
    bool _4041 = _3473 == 0;
    int _4043 = _3633 ^ _3473;
    float _4045 = _3967 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _4047 = float(_4027);
    float _4049 = -_142;
    float _4051 = fma(_4049, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2593);
    bool _4053 = !_3993;
    int _4055 = _4053 ? 0 : (-1);
    float _4057 = fma(_4045, _2135, -0.5);
    uint _4059 = uint(int(uint(_4037) >> uint(31)));
    float _4061 = fma(_4045, _4047, _4051);
    uint _4063 = uint(int(uint(_4043) >> uint(31)));
    bool _4065 = !_4039;
    int _4067 = _4065 ? _4031 : (-1);
    float _4069 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4071 = ~_4055;
    int _4073 = _3957 + _4071;
    int _4075 = _4073 + 1;
    float _4077 = fma(_3919, _4057, _4061);
    int _4079 = ~int(_4059);
    int _4081 = _4079 + 1;
    int _4083 = ~int(_4063);
    int _4085 = _4083 + 1;
    float _4087 = _4035 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _4089 = float(_4067);
    float _4091 = -_142;
    float _4093 = fma(_4091, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3171);
    int _4095 = _4023 ^ _4081;
    float _4097 = fma(_4087, _2179, -0.5);
    int _4099 = _4075 ^ _4085;
    float _4101 = fma(_4087, _4089, _4093);
    int _4103 = ~_4081;
    int _4105 = _4103 + _4095;
    int _4107 = _4105 + 1;
    float _4109 = _3991 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4111 = ~_4085;
    int _4113 = _4111 + _4099;
    int _4115 = _4113 + 1;
    float _4117 = _4069 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _4119 = !_4033;
    int _4121 = _4119 ? _4107 : (-1);
    float _4123 = fma(_4109, _2209, -0.5);
    bool _4125 = !_4041;
    int _4127 = _4125 ? _4115 : (-1);
    float _4129 = fma(_4117, _2237, -0.5);
    float _4131 = float(_4121);
    float _4133 = float(_4127);
    float _4135 = fma(_3739, _3153, _3779);
    float _4137 = fma(_3215, _3739, _3785);
    float _4139 = -_3931;
    float _4141 = fma(_4109, _4131, _4139);
    float _4143 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3077);
    float _4145 = -_3949;
    float _4147 = fma(_4117, _4133, _4145);
    float _4149 = fma(_3741, _3153, _3689);
    float _4151 = fma(_3987, _4123, _4141);
    float _4153 = fma(_4143, _4097, _4101);
    float _4155 = fma(_4003, _4129, _4147);
    float _4157 = fma(_3745, _3153, _3775);
    float _4159 = fma(_3215, _3741, _3761);
    float _4161 = fma(_3215, _3745, _3791);
    float _4163 = _4153 + 0.5;
    float _4165 = _4077 + 0.5;
    float _4167 = _4155 + 0.5;
    float _4169 = _4151 + 0.5;
    out.m_79.x = _4159;
    out.m_79.y = _4137;
    out.m_79.z = _4161;
    bool _4171 = _4011 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4173 = isnan(_4011);
    bool _4175 = _4171 || _4173;
    bool _4177 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4179 = _4175 || _4177;
    out.m_81.x = _4149;
    out.m_81.y = _4135;
    out.m_81.z = _4157;
    out.m_83.x = _4165;
    out.m_83.y = _4169;
    out.m_83.z = _4163;
    out.m_83.w = _4167;
    if (!_4179)
    {
        _3833 = 1.0;
    }
    float _4181 = _3833;
    bool _4183 = !_4179;
    float _4185 = _4181;
    if (!_4183)
    {
        bool _4187 = _4011 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4189 = isnan(_4011);
        bool _4191 = _4187 || _4189;
        bool _4193 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4195 = _4191 || _4193;
        if (!_4195)
        {
            float _4197 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4199 = _4011 + _4197;
            float _4201 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4203 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4201;
            float _4205 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4207 = _4205 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4209 = 1.0 / _4203;
            float _4211 = _4199 * _4209;
            float _4213 = fma(_4211, _4207, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4185 = _4213;
            _4215 = true;
        }
        else
        {
            bool _4217 = _4011 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4219 = isnan(_4011);
            bool _4221 = _4217 || _4219;
            bool _4223 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4225 = _4221 || _4223;
            if (!_4225)
            {
                float _4227 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4229 = _4011 + _4227;
                float _4231 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4233 = _4231 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4235 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4237 = _4235 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4239 = 1.0 / _4233;
                float _4241 = _4229 * _4239;
                float _4243 = fma(_4241, _4237, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4185 = _4243;
                _4215 = true;
            }
            else
            {
                _4185 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4215 = false;
    float _4245 = _4185;
    float _4247 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4249 = _3907 + _4247;
    float _4251 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4253 = _3913 + _4251;
    float _4255 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4257 = _3915 + _4255;
    float _4259 = fma(_4249, _4245, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4261 = fma(_4253, _4245, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4263 = fma(_4257, _4245, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4265 = -_2589;
    float _4267 = _4265 + _4259;
    float _4269 = -_2809;
    float _4271 = _4269 + _4261;
    float _4273 = -_2829;
    float _4275 = _4273 + _4263;
    float _4277 = _4267 * _4267;
    float _4279 = fma(_4271, _4271, _4277);
    float _4281 = fma(_4275, _4275, _4279);
    float _4283 = sqrt(_4281);
    bool _4285 = _4283 > 0.0;
    float _4287 = _4283;
    float _4289 = _4261;
    float _4291 = _4259;
    if (!_4285)
    {
        _4287 = _4263;
    }
    float _4293 = _4287;
    bool _4295 = !_4285;
    float _4297 = _4293;
    float _4299 = _4293;
    if (!_4295)
    {
        bool _4301 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4303 = _1464;
        if (_4301)
        {
            float _4305 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4303 = _4305;
        }
        float _4307 = _4303;
        float _4309 = _4307;
        if (_4301)
        {
            float _4311 = _626 * _4307;
            _3835 = _4311;
        }
        float _4313 = _3835;
        float _4315 = _4313;
        if (_4301)
        {
            float _4317 = _628 * _4307;
            _3837 = _4317;
        }
        float _4319 = _3837;
        float _4321 = _4319;
        if (_4301)
        {
            float _4323 = _630 * _4307;
            _4309 = _4323;
        }
        float _4325 = _4309;
        float _4327 = _4325;
        if (!_4301)
        {
            bool _4329 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4331 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4333 = _4329 || _4331;
            bool _4335 = isnan(1.0);
            bool _4337 = _4333 || _4335;
            float _4339 = _142 + 1.0;
            if (!_4337)
            {
                float _4341 = _4339 * _4339;
                float _4343 = _4341 * 0.5;
                _634 = _4343;
            }
            float _4345 = _634;
            float _4347 = _4345;
            if (!_4337)
            {
                float _4349 = _4345 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4347 = _4349;
            }
            float _4351 = _4347;
            bool _4353 = !_4337;
            float _4355 = _4351;
            if (!_4353)
            {
                float _4357 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4359 = log2(_4357);
                float _4361 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4363 = _4361 + 1.0;
                float _4365 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4367 = _4359 * _4339;
                float _4369 = 1.0 / _4363;
                float _4371 = _4365 * 0.693147182464599609375;
                float _4373 = exp2(_4367);
                float _4375 = 1.0 / _4371;
                float _4377 = _4373 + (-1.0);
                float _4379 = -_4377;
                float _4381 = fma(_4379, _4375, _4339);
                float _4383 = _4381 * _4369;
                float _4385 = _4383 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4355 = _4385;
            }
            float _4387 = _4355;
            float _4389 = _4387 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _4391 = _4387 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4393 = _4387 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4395 = _4387;
            if (!_4337)
            {
                _4395 = _4339;
            }
            float _4397 = _4395;
            float _4399 = _4389 * _372;
            float _4401 = _4389 * _352;
            float _4403 = _4389 * _390;
            float _4405 = fma(_4391, _368, _4399);
            float _4407 = fma(_4391, _348, _4401);
            float _4409 = fma(_4393, _376, _4405);
            bool _4411 = !_4337;
            float _4413 = _4397;
            if (!_4411)
            {
                float _4415 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4417 = log2(_4415);
                float _4419 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4421 = _4419 + 1.0;
                float _4423 = 1.0 / _4421;
                float _4425 = _4417 * _4339;
                float _4427 = exp2(_4425);
                float _4429 = -_4427;
                float _4431 = _4429 + 1.0;
                float _4433 = _4431 * _4423;
                _4413 = _4433;
            }
            float _4435 = _4413;
            float _4437 = fma(_4391, _386, _4403);
            float _4439 = fma(_4393, _364, _4407);
            float _4441 = fma(_4435, _250, _4409);
            float _4443 = fma(_4393, _394, _4437);
            float _4445 = fma(_4435, _248, _4439);
            float _4447 = -_588;
            float _4449 = _4447 + _4441;
            float _4451 = fma(_4435, _252, _4443);
            float _4453 = -_594;
            float _4455 = _4453 + _4445;
            float _4457 = _4449 * _170;
            float _4459 = _4449 * _164;
            float _4461 = _4449 * _186;
            float _4463 = -_600;
            float _4465 = _4463 + _4451;
            float _4467 = fma(_4455, _168, _4457);
            float _4469 = fma(_4455, _162, _4459);
            float _4471 = fma(_4455, _184, _4461);
            float _4473 = fma(_4465, _172, _4467);
            float _4475 = fma(_4465, _166, _4469);
            float _4477 = fma(_4465, _188, _4471);
            _636 = _4475;
            _638 = _4473;
            _640 = _4477;
            _4315 = _4473;
            _4321 = _4475;
            _4327 = _4477;
            _4297 = _4449;
        }
        float _4479 = _636;
        float _4481 = _638;
        float _4483 = _640;
        float _4485 = _4315;
        float _4487 = _4321;
        float _4489 = _4327;
        float _4491 = _4297;
        float _4493 = _4479 * _4479;
        float _4495 = fma(_4481, _4481, _4493);
        float _4497 = fma(_4483, _4483, _4495);
        float _4499 = rsqrt(_4281);
        float _4501 = sqrt(_4497);
        float _4503 = _4271 * _4499;
        float _4505 = _4267 * _4499;
        float _4507 = _4275 * _4499;
        bool _4509 = _4501 > 0.0;
        float _4511 = _4491;
        _642 = _4479;
        if (!_4509)
        {
            _4511 = _4263;
        }
        float _4513 = _4511;
        bool _4515 = !_4509;
        _4299 = _4513;
        if (!_4515)
        {
            float _4517 = rsqrt(_4497);
            float _4519 = _4517 * _4479;
            float _4521 = _4517 * _4481;
            float _4523 = _4517 * _4483;
            float _4525 = _4505 * _4519;
            float _4527 = fma(_4503, _4521, _4525);
            float _4529 = fma(_4507, _4523, _4527);
            float _4531 = _4529 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4533 = fma(_4485, _4531, _4261);
            float _4535 = fma(_4487, _4531, _4259);
            float _4537 = fma(_4489, _4531, _4263);
            _4289 = _4533;
            _4291 = _4535;
            _4299 = _4537;
        }
    }
    float _4539 = _4289;
    float _4541 = _4291;
    float _4543 = _4299;
    float _4545 = _642;
    float _4547 = _2589 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4549 = fma(_2809, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4547);
    float _4551 = _2589 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4553 = fma(_2829, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4549);
    bool _4555 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4557 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4559 = _4555 || _4557;
    bool _4561 = isnan(0.5);
    bool _4563 = _4559 || _4561;
    bool _4565 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4567 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4569 = _4565 || _4567;
    bool _4571 = isnan(0.5);
    bool _4573 = _4569 || _4571;
    float _4575 = _4553 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4577 = fma(_2809, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4551);
    float _4579 = 1.0 / _4575;
    float _4581 = fma(_2829, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4577);
    float _4583 = _4581 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4585 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4587 = _4545;
    float _4589 = _4543;
    float _4591 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_4563)
    {
        _228 = _4539;
    }
    float _4593 = _228;
    float _4595 = _4593;
    if (_4563)
    {
        _230 = _4541;
    }
    float _4597 = _230;
    float _4599 = _4583 + _4575;
    float _4601 = _4597;
    if (_4573)
    {
        _4585 = 1.0;
    }
    float _4603 = _4585;
    float _4605 = _4603;
    if (_4563)
    {
        _4587 = _4543;
    }
    float _4607 = _4587;
    float _4609 = _4599 * _4579;
    float _4611 = _4609 * 0.5;
    float _4613 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4615 = fma(_4611, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4613);
    float _4617 = 1.0 / _4615;
    float _4619 = _4607;
    if (!_4563)
    {
        float _4621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4623 = _2589 + _4621;
        float _4625 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4627 = _2809 + _4625;
        float _4629 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4631 = -_2809;
        float _4633 = _4631 + _4539;
        float _4635 = _4623 * _4623;
        float _4637 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4639 = _2829 + _4637;
        float _4641 = -_2589;
        float _4643 = _4641 + _4541;
        float _4645 = -_2829;
        float _4647 = _4645 + _4543;
        float _4649 = fma(_4627, _4627, _4635);
        float _4651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4653 = fma(_4639, _4639, _4649);
        float _4655 = sqrt(_4653);
        float _4657 = _4629 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4659 = precise::min(_4655, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4661 = _4659 * _4651;
        float _4663 = _4657 * _4661;
        float _4665 = fma(_4633, _4663, _2809);
        float _4667 = fma(_4643, _4663, _2589);
        float _4669 = fma(_4647, _4663, _2829);
        _4601 = _4667;
        _4595 = _4665;
        _4619 = _4669;
        _4589 = _4647;
        _4591 = _4629;
    }
    float _4671 = _4601;
    float _4673 = _4595;
    float _4675 = _4619;
    float _4677 = _4589;
    float _4679 = _4591;
    float _4681 = _4679;
    float _4683 = _4677;
    if (_4573)
    {
        _4681 = 1.0;
    }
    float _4685 = _4681;
    float _4687 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4689 = _4617 * _4687;
    float _4691 = _4685;
    if (!_4573)
    {
        float _4693 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4695 = _4693 * 0.15915493667125701904296875;
        float _4697 = _4695 * 6.283185482025146484375;
        float _4699 = cos(_4697);
        float _4701 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4703 = _4701 * 0.15915493667125701904296875;
        float _4705 = _4695 * 6.283185482025146484375;
        float _4707 = sin(_4705);
        float _4709 = 1.0 / _4699;
        float _4711 = _4703 * 6.283185482025146484375;
        float _4713 = cos(_4711);
        float _4715 = _4707 * _4709;
        float _4717 = _4703 * 6.283185482025146484375;
        float _4719 = sin(_4717);
        float _4721 = _4713 * _4715;
        float _4723 = 1.0 / _4721;
        float _4725 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4727 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4725;
        float _4729 = 1.0 / _4727;
        float _4731 = _4719 * _4723;
        float _4733 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4735 = fma(_4689, _4731, _4733);
        float _4737 = _4735 * _4729;
        float _4739 = precise::clamp(_4737, 0.0, 1.0);
        _4605 = _4739;
    }
    float _4741 = _4605;
    if (!_4573)
    {
        float _4743 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4745 = _4743 * 0.15915493667125701904296875;
        float _4747 = _4745 * 6.283185482025146484375;
        float _4749 = cos(_4747);
        float _4751 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4753 = _4751 * 0.15915493667125701904296875;
        float _4755 = _4745 * 6.283185482025146484375;
        float _4757 = sin(_4755);
        float _4759 = 1.0 / _4749;
        float _4761 = _4753 * 6.283185482025146484375;
        float _4763 = cos(_4761);
        float _4765 = _4757 * _4759;
        float _4767 = _4753 * 6.283185482025146484375;
        float _4769 = sin(_4767);
        float _4771 = _4763 * _4765;
        float _4773 = 1.0 / _4771;
        float _4775 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4777 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _4775;
        float _4779 = 1.0 / _4777;
        float _4781 = _4769 * _4773;
        float _4783 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4785 = fma(_4689, _4781, _4783);
        float _4787 = _4785 * _4779;
        float _4789 = precise::clamp(_4787, 0.0, 1.0);
        float _4791 = -_4789;
        float _4793 = _4791 + 1.0;
        _232 = _4771;
        _4691 = _4793;
    }
    float _4795 = _232;
    float _4797 = _4691;
    float _4799 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4801 = _4671 + _4799;
    float _4803 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4805 = _4673 + _4803;
    float _4807 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4809 = _4675 + _4807;
    float _4811 = _4801 * _4801;
    float _4813 = fma(_4805, _4805, _4811);
    float _4815 = fma(_4809, _4809, _4813);
    float _4817 = rsqrt(_4815);
    float _4819 = sqrt(_4815);
    float _4821 = _4817 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4823 = _4805 * _4821;
    float _4825 = _4809 * _4821;
    float _4827 = _4823 * _4823;
    float _4829 = _4825 * _4825;
    float _4831 = _4827 + _4829;
    float _4833 = sqrt(_4831);
    bool _4835 = _4833 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4837 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4839 = _4833 + _4837;
    float _4841 = _4817;
    float _4843 = _4831;
    float _4845 = _4839;
    float _4847 = _4795;
    float _4849 = _4801;
    if (_4835)
    {
        float _4851 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4841 = _4851;
    }
    float _4853 = _4841;
    if (_4835)
    {
        float _4855 = rsqrt(_4831);
        _4843 = _4855;
    }
    float _4857 = _4843;
    float _4859 = _4857;
    if (_4835)
    {
        float _4861 = _4839 * _4853;
        _4845 = _4861;
    }
    float _4863 = _4845;
    if (_4835)
    {
        float _4865 = _4863 * 0.15915493667125701904296875;
        _4847 = _4865;
    }
    float _4867 = _4847;
    float _4869 = _4809;
    float _4871 = _4867;
    if (_4835)
    {
        float _4873 = _4867 * 6.283185482025146484375;
        float _4875 = sin(_4873);
        _4869 = _4875;
    }
    float _4877 = _4869;
    float _4879 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4881 = precise::max(0.0, _4879);
    float _4883 = _4853;
    float _4885 = _4881;
    if (_4835)
    {
        float _4887 = _4867 * 6.283185482025146484375;
        float _4889 = cos(_4887);
        _4883 = _4889;
    }
    float _4891 = _4883;
    float _4893 = -_4821;
    float _4895 = -_4881;
    float _4897 = fma(_4801, _4893, _4895);
    if (_4835)
    {
        float _4899 = _4897 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4849 = _4899;
    }
    float _4901 = _4849;
    float _4903 = _4901;
    float _4905 = _4877;
    if (_4835)
    {
        float _4907 = fma(_4877, _4901, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4903 = _4907;
    }
    float _4909 = _4903;
    float _4911 = _4909;
    if (!_4835)
    {
        _4905 = _4823;
    }
    float _4913 = _4905;
    float _4915 = _4913;
    float _4917 = _4891;
    if (_4835)
    {
        float _4919 = _4891 + (-1.0);
        _4885 = _4919;
    }
    float _4921 = _4885;
    float _4923 = _4921;
    if (_4835)
    {
        float _4925 = _4857 * _4909;
        _4683 = _4925;
    }
    float _4927 = _4683;
    if (!_4835)
    {
        _4911 = _4897;
    }
    float _4929 = _4911;
    float _4931 = _4929;
    if (_4835)
    {
        float _4933 = _4921 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4871 = _4933;
    }
    float _4935 = _4871;
    if (_4835)
    {
        float _4937 = _4823 * _4927;
        _4915 = _4937;
    }
    float _4939 = _4915;
    if (!_4835)
    {
        _4923 = _4825;
    }
    float _4941 = _4923;
    float _4943 = _4941;
    if (_4835)
    {
        float _4945 = _4825 * _4927;
        _4943 = _4945;
    }
    float _4947 = _4943;
    if (!_4835)
    {
        _4859 = _4827;
    }
    float _4949 = _4859;
    float _4951 = _4949;
    if (_4835)
    {
        float _4953 = fma(_4897, _4891, _4935);
        _4931 = _4953;
    }
    float _4955 = _4931;
    if (_4835)
    {
        float _4957 = _4939 * _4939;
        _4951 = _4957;
    }
    float _4959 = _4951;
    if (!_4835)
    {
        _4917 = _4829;
    }
    float _4961 = _4917;
    float _4963 = _4961;
    if (_4835)
    {
        float _4965 = _4947 * _4947;
        _4963 = _4965;
    }
    float _4967 = _4963;
    float _4969 = fma(_4955, _4955, _4959);
    float _4971 = _4671 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4973 = _4969 + _4967;
    float _4975 = _4671 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4977 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4979 = fma(_4819, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4977);
    float _4981 = precise::clamp(_4979, 0.0, 1.0);
    float _4983 = fma(_4673, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4971);
    float _4985 = fma(_4673, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4975);
    float _4987 = rsqrt(_4973);
    float _4989 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4991 = -_4981;
    float _4993 = _4991 + 1.0;
    float _4995 = fma(_4675, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4985);
    float _4997 = _4671 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4999 = fma(_4675, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4983);
    float _5001 = _4671 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _5003 = _4995 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _5005 = fma(_4673, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4997);
    float _5007 = abs(_4993);
    float _5009 = log2(_5007);
    float _5011 = _4999 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _5013 = _5003 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _5015 = fma(_4675, (*spvDescriptorSet0.vp_c8)._m0[0].z, _5005);
    float _5017 = fma(_4673, (*spvDescriptorSet0.vp_c8)._m0[3].x, _5001);
    float _5019 = -_5013;
    float _5021 = fma(_5019, _4989, 1.0);
    float _5023 = _4987 * _4939;
    float _5025 = _5015 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _5027 = _5011 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _5029 = _4987 * _4955;
    float _5031 = _5023 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5033 = fma(_4675, (*spvDescriptorSet0.vp_c8)._m0[3].z, _5017);
    float _5035 = fma(_5025, (*spvDescriptorSet0.vp_c8)._m0[7].x, _5027);
    float _5037 = _4987 * _4947;
    float _5039 = -_5031;
    float _5041 = fma(_5029, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5039);
    float _5043 = _5033 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _5045 = fma(_5003, (*spvDescriptorSet0.vp_c8)._m0[7].z, _5035);
    float _5047 = _5009 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5049 = -_5037;
    float _5051 = fma(_5049, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5041);
    float _5053 = _5011 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _5055 = fma(_5043, (*spvDescriptorSet0.vp_c8)._m0[7].w, _5045);
    float _5057 = log2(_5021);
    float _5059 = fma(_5051, -0.5, 0.5);
    float _5061 = _5011 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _5063 = fma(_5025, (*spvDescriptorSet0.vp_c8)._m0[4].x, _5053);
    float _5065 = fma(_5051, 0.5, 0.5);
    float _5067 = _5029 + 1.0;
    float _5069 = fma(_5025, (*spvDescriptorSet0.vp_c8)._m0[5].x, _5061);
    float _5071 = fma(_5003, (*spvDescriptorSet0.vp_c8)._m0[4].z, _5063);
    float _5073 = exp2(_5047);
    float _5075 = fma(_5065, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5077 = fma(_5003, (*spvDescriptorSet0.vp_c8)._m0[5].z, _5069);
    float _5079 = fma(_5043, (*spvDescriptorSet0.vp_c8)._m0[4].w, _5071);
    float _5081 = fma(_5065, _5075, -0.212114393711090087890625);
    float _5083 = fma(_5043, (*spvDescriptorSet0.vp_c8)._m0[5].w, _5077);
    float _5085 = 1.0 / _5055;
    float _5087 = fma(_5065, _5081, 1.570728778839111328125);
    float _5089 = _5057 * 0.693147182464599609375;
    float _5091 = _5089 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _5093 = sqrt(_5059);
    float _5095 = -_5029;
    float _5097 = fma(_5073, _5067, _5095);
    float _5099 = fma(_5097, 0.5, 0.5);
    float _5101 = _5079 * _5085;
    float _5103 = _5083 * _5085;
    float _5105 = fma(_5101, 0.5, 0.5);
    float _5107 = fma(_5103, -0.5, 0.5);
    float _5109 = _5093 * 0.636619746685028076171875;
    float3 _12760 = float3(_5105, _5107, _5091);
    float _5111 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12760, float3(0.0), isnan(_12760)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12760, float3(0.0), isnan(_12760)), level(0.0)).x;
    float3 _12771 = float3(_5105, _5107, _5091);
    float4 _5114 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12771, float3(0.0), isnan(_12771)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12771, float3(0.0), isnan(_12771)), level(0.0)).xyzw;
    float _5116 = _5114.x;
    float _5118 = _5114.y;
    float _5120 = _5114.z;
    float _5122 = _5114.w;
    float _5124 = -_5087;
    float _5126 = fma(_5109, _5124, 1.0);
    float2 _12793 = float2(_5126, _5099);
    float3 _5130 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12793, float2(0.0), isnan(_12793)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12793, float2(0.0), isnan(_12793)), level(0.0)).xyz;
    float _5132 = _5130.x;
    float _5134 = _5130.y;
    float _5136 = _5130.z;
    float _5138 = _5009 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5140 = _5011 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5142 = _4741 * _4797;
    bool _5144 = _4741 > 0.0;
    bool _5146 = isnan(_4741);
    bool _5148 = _5144 || _5146;
    bool _5150 = isnan(0.0);
    bool _5152 = _5148 || _5150;
    float _5154 = fma(_5025, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5140);
    float _5156 = exp2(_5138);
    float _5158 = _5142 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _5160 = _4797 <= 0.0;
    bool _5162 = !_5152;
    bool _5164 = _5160 || _5162;
    float _5166 = fma(_5003, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5154);
    float _5168 = _5158 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5170 = fma(_5043, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5166);
    out.m_47.x = _5168;
    float _5172 = _5170 + _5055;
    out.gl_Position.x = _5079;
    out.gl_Position.y = _5083;
    out.gl_Position.z = _5170;
    out.gl_Position.w = _5055;
    float _5174 = _5172 * 0.5;
    float _5176 = -_5156;
    float _5178 = _5176 + 1.0;
    float _5180 = _5178 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_85.z = _5174;
    out.m_85.w = _5055;
    float _5182 = _5180 * _5111;
    float _5184 = -_5180;
    float _5186 = _5184 + 1.0;
    float _5188 = _5122 * _5182;
    float _5190 = _5122 * _5186;
    float _5192 = _5136 * _5182;
    float _5194 = fma(_5132, _5188, _5116);
    float _5196 = fma(_5134, _5188, _5118);
    float _5198 = fma(_5122, _5192, _5120);
    out.m_87.x = _5194;
    out.m_87.y = _5196;
    out.m_87.z = _5198;
    out.m_87.w = _5190;
    if (!_5164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _5200 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5200;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4215 = false;
    bool _1490 = false;
    bool _1310 = false;
    bool _1198 = false;
    bool _1058 = false;
    bool _934 = false;
    bool _660 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5257 = as_type<float>(_122);
        out.gl_Position.z = _5257;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_49.w;
    float _128 = in.m_51.x;
    bool _130 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_126);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_126;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _128;
    float _144 = 0.0;
    if (_138)
    {
        float _146 = float(_106);
        _144 = _146;
    }
    float _148 = _144;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_47.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5329 = as_type<float>(_160);
        out.gl_Position.z = _5329;
    }
    if (_154)
    {
        return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = in.m_57.x;
    float _170 = in.m_57.y;
    float _172 = in.m_57.z;
    bool _174 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _176 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _178 = _174 || _176;
    bool _180 = isnan(1.0);
    bool _182 = _178 || _180;
    float _184 = in.m_59.x;
    float _186 = in.m_59.y;
    float _188 = in.m_59.z;
    float _190 = in.m_61.w;
    float _192 = in.m_44.x;
    float _194 = in.m_44.y;
    float _196 = in.m_44.z;
    float _198 = _162 * _162;
    float _200 = _164 * _164;
    float _202 = fma(_168, _168, _198);
    float _204 = fma(_170, _170, _200);
    float _206 = fma(_184, _184, _202);
    float _208 = _166 * _166;
    float _210 = fma(_186, _186, _204);
    float _212 = sqrt(_206);
    float _214 = fma(_172, _172, _208);
    float _216 = fma(_188, _188, _214);
    float _218 = sqrt(_210);
    float _220 = sqrt(_216);
    bool _222 = _212 > 0.0;
    bool _224 = _218 > 0.0;
    float _226 = 0.0;
    float _228 = _170;
    float _230 = _168;
    float _232 = _172;
    if (_222)
    {
        float _234 = rsqrt(_206);
        _226 = _234;
    }
    float _236 = _226;
    float _238 = 0.0;
    float _240 = 0.0;
    if (!_222)
    {
        _238 = 0.0;
        _240 = 0.0;
    }
    float _242 = _238;
    float _244 = _240;
    bool _246 = _220 > 0.0;
    float _248 = in.m_49.x;
    float _250 = in.m_49.y;
    float _252 = in.m_49.z;
    float _254 = 0.0;
    float _256 = _242;
    float _258 = _244;
    if (!_222)
    {
        _254 = 0.0;
    }
    float _260 = _254;
    float _262 = 0.0;
    float _264 = 0.0;
    float _266 = _260;
    if (!_224)
    {
        _262 = 0.0;
        _264 = 0.0;
    }
    float _268 = _262;
    float _270 = _264;
    float _272 = 0.0;
    float _274 = _270;
    float _276 = _268;
    if (_224)
    {
        float _278 = rsqrt(_210);
        _272 = _278;
    }
    float _280 = _272;
    int _282 = int(_222);
    int _284 = _224 ? 2 : 0;
    int _286 = _282 | _284;
    int _288 = _246 ? 4 : 0;
    int _290 = _286 | _288;
    int _292 = _182 ? 8 : 0;
    int _294 = _290 | _292;
    int _296 = false ? 16 : 0;
    int _298 = _294 | _296;
    int _300 = false ? 32 : 0;
    int _302 = _298 | _300;
    int _304 = false ? 64 : 0;
    int _306 = _302 | _304;
    int _308 = _306 & 8;
    float _310 = 0.0;
    float _312 = as_type<float>(_308);
    if (!_224)
    {
        _310 = 0.0;
    }
    float _314 = _310;
    float _316 = 0.0;
    float _318 = 0.0;
    float _320 = _314;
    if (!_246)
    {
        _316 = 0.0;
        _318 = 0.0;
    }
    float _322 = _316;
    float _324 = _318;
    float _326 = _216;
    float _328 = _322;
    float _330 = _324;
    if (_246)
    {
        float _332 = rsqrt(_216);
        _326 = _332;
    }
    float _334 = _326;
    float _336 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _338 = 0.0;
    float _340 = _336;
    if (!_246)
    {
        _338 = 0.0;
    }
    float _342 = _338;
    float _344 = _342;
    if (_222)
    {
        float _346 = _236 * _168;
        _266 = _346;
    }
    float _348 = _266;
    if (_222)
    {
        float _350 = _236 * _162;
        _256 = _350;
    }
    float _352 = _256;
    if (!_182)
    {
        float _354 = _336 * _336;
        float _356 = _354 * 0.5;
        _312 = _356;
    }
    float _358 = _312;
    float _360 = _358;
    if (_222)
    {
        float _362 = _236 * _184;
        _258 = _362;
    }
    float _364 = _258;
    if (_224)
    {
        float _366 = _280 * _170;
        _274 = _366;
    }
    float _368 = _274;
    if (_224)
    {
        float _370 = _280 * _164;
        _276 = _370;
    }
    float _372 = _276;
    if (_224)
    {
        float _374 = _280 * _186;
        _320 = _374;
    }
    float _376 = _320;
    if (!_182)
    {
        float _378 = _358 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _360 = _378;
    }
    float _380 = _360;
    float _382 = _380;
    if (_246)
    {
        float _384 = _334 * _172;
        _344 = _384;
    }
    float _386 = _344;
    if (_246)
    {
        float _388 = _334 * _166;
        _328 = _388;
    }
    float _390 = _328;
    if (_246)
    {
        float _392 = _334 * _188;
        _330 = _392;
    }
    float _394 = _330;
    bool _396 = !_182;
    if (!_396)
    {
        float _398 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _400 = log2(_398);
        float _402 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _404 = _402 + 1.0;
        float _406 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _408 = _336 * _400;
        float _410 = 1.0 / _404;
        float _412 = _406 * 0.693147182464599609375;
        float _414 = exp2(_408);
        float _416 = 1.0 / _412;
        float _418 = _414 + (-1.0);
        float _420 = -_418;
        float _422 = fma(_420, _416, _336);
        float _424 = _422 * _410;
        float _426 = _424 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _382 = _426;
    }
    float _428 = _382;
    float _430 = _428 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _432 = !_182;
    float _434 = _428;
    if (!_432)
    {
        float _436 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _438 = log2(_436);
        float _440 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _442 = _440 + 1.0;
        float _444 = 1.0 / _442;
        float _446 = _336 * _438;
        float _448 = exp2(_446);
        float _450 = -_448;
        float _452 = _450 + 1.0;
        float _454 = _452 * _444;
        _340 = _454;
    }
    float _456 = _340;
    float _458 = _428 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _460 = _430 * _352;
    float _462 = _430 * _372;
    float _464 = _430 * _390;
    float _466 = 0.0;
    if (!_182)
    {
        float _468 = _142 * _142;
        float _470 = _468 * 0.5;
        _466 = _470;
    }
    float _472 = _466;
    float _474 = fma(_458, _348, _460);
    float _476 = fma(_458, _368, _462);
    float _478 = fma(_458, _386, _464);
    float _480 = _428 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_182)
    {
        float _482 = _472 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _434 = _482;
    }
    float _484 = _434;
    bool _486 = !_182;
    float _488 = _484;
    if (!_486)
    {
        float _490 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _492 = log2(_490);
        float _494 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _496 = _494 + 1.0;
        float _498 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _500 = _142 * _492;
        float _502 = 1.0 / _496;
        float _504 = _498 * 0.693147182464599609375;
        float _506 = exp2(_500);
        float _508 = 1.0 / _504;
        float _510 = _506 + (-1.0);
        float _512 = -_510;
        float _514 = fma(_512, _508, _142);
        float _516 = _514 * _502;
        float _518 = _516 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _488 = _518;
    }
    float _520 = _488;
    float _522 = _520 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _524 = fma(_480, _364, _474);
    float _526 = fma(_480, _376, _476);
    float _528 = _520 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _530 = _522 * _352;
    float _532 = _522 * _372;
    float _534 = _522 * _390;
    float _536 = fma(_480, _394, _478);
    float _538 = fma(_528, _348, _530);
    float _540 = fma(_528, _368, _532);
    float _542 = fma(_528, _386, _534);
    float _544 = _520 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _546 = fma(_456, _248, _524);
    float _548 = fma(_456, _250, _526);
    float _550 = fma(_456, _252, _536);
    float _552 = fma(_544, _364, _538);
    float _554 = fma(_544, _376, _540);
    float _556 = fma(_544, _394, _542);
    float _558 = _544;
    if (!_182)
    {
        _558 = _142;
    }
    float _560 = _558;
    bool _562 = !_182;
    float _564 = _560;
    if (!_562)
    {
        float _566 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _568 = log2(_566);
        float _570 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _572 = _570 + 1.0;
        float _574 = 1.0 / _572;
        float _576 = _142 * _568;
        float _578 = exp2(_576);
        float _580 = -_578;
        float _582 = _580 + 1.0;
        float _584 = _582 * _574;
        _564 = _584;
    }
    float _586 = _564;
    float _588 = fma(_586, _250, _554);
    bool _590 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _592 = fma(_548, _190, _194);
    float _594 = fma(_586, _248, _552);
    float _596 = -_588;
    float _598 = _548 + _596;
    float _600 = fma(_586, _252, _556);
    float _602 = fma(_546, _190, _192);
    float _604 = -_594;
    float _606 = _546 + _604;
    float _608 = _598 * _170;
    float _610 = _598 * _164;
    float _612 = _598 * _186;
    float _614 = -_600;
    float _616 = _550 + _614;
    float _618 = fma(_606, _168, _608);
    float _620 = fma(_606, _162, _610);
    float _622 = fma(_606, _184, _612);
    float _624 = fma(_550, _190, _196);
    float _626 = fma(_616, _172, _618);
    float _628 = fma(_616, _166, _620);
    float _630 = fma(_616, _188, _622);
    bool _632 = !_590;
    float _634 = _630;
    float _636 = _628;
    float _638 = _626;
    float _640 = _630;
    float _642 = _628;
    float _658;
    if (!_632)
    {
        float _644 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _646 = _128 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _648 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _650 = _648 * _644;
        float _652 = floor(_650);
        float _654 = -_652;
        float _656 = _650 + _654;
        _658 = _656;
        _660 = true;
    }
    else
    {
        float _662 = float(_106);
        float _664 = 1.0 / _662;
        float _666 = _142 * _664;
        _658 = _666;
    }
    _660 = false;
    float _668 = _658;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _672 = _668 + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _676 = _668 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _680 = _668 + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _698 = 1.0 / _684;
    float _700 = 1.0 / _692;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _704 = _668 + _702;
    bool _706 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _708 = 1.0 / _688;
    float _710 = _672 * _698;
    bool _712 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _714 = isnan(_668);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _724;
    float _728 = fma(_726, _710, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _730 = 1.0 / _696;
    float _732 = _676 * _700;
    bool _734 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _736 = isnan(_668);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -_722;
    float _748 = _746 + 1.0;
    float _750 = _744 * _748;
    float _752 = _680 * _708;
    bool _754 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _756 = isnan(_668);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _766;
    float _770 = -_744;
    float _772 = _770 + 1.0;
    bool _774 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _776 = isnan(_668);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = fma(_768, _710, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _788 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _790 = isnan(_668);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = _704 * _730;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _802;
    float _806 = -_764;
    float _808 = _806 + 1.0;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _814 = fma(_804, _710, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _816 = _764 * _772;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _822 = _784 * _808;
    float _824 = -_784;
    float _826 = _824 + 1.0;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _832 = fma(_812, _752, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _834 = fma(_820, _752, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _836 = _798 * _826;
    float _838 = fma(_830, _752, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _840 = -_798;
    float _842 = _840 + 1.0;
    float _844 = _814 * _836;
    float _846 = _728 * _836;
    float _848 = _786 * _836;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _850;
    float _854 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[143].x, _844);
    float _856 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[143].y, _846);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _858;
    float _862 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[143].z, _848);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _864;
    float _868 = fma(_832, _822, _854);
    float _870 = fma(_834, _822, _856);
    float _872 = fma(_852, _732, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _874 = fma(_860, _732, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _876 = fma(_838, _822, _862);
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _886 = fma(_866, _732, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _892 = fma(_872, _816, _868);
    float _894 = fma(_880, _800, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _896 = fma(_884, _800, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _898 = fma(_874, _816, _870);
    float _900 = fma(_890, _800, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _902 = fma(_886, _816, _876);
    float _904 = fma(_894, _750, _892);
    float _906 = fma(_896, _750, _898);
    float _908 = fma(_900, _750, _902);
    float _910 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[147].x, _904);
    float _912 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[147].y, _906);
    float _914 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[147].z, _908);
    bool _916 = !_706;
    float _932;
    if (!_916)
    {
        float _918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _920 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[11].x, _142);
        float _924 = _922 * _918;
        float _926 = floor(_924);
        float _928 = -_926;
        float _930 = _924 + _928;
        _932 = _930;
        _934 = true;
    }
    else
    {
        float _936 = float(_106);
        float _938 = 1.0 / _936;
        float _940 = _142 * _938;
        _932 = _940;
    }
    _934 = false;
    float _942 = _932;
    float _944 = in.m_61.x;
    float _946 = in.m_61.y;
    float _948 = in.m_61.z;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _952 = _942 + _950;
    bool _954 = _942 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _956 = isnan(_942);
    bool _958 = _954 || _956;
    bool _960 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _962 = _958 || _960;
    float _964 = float(_962);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _966;
    bool _970 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _972 = 1.0 / _968;
    float _974 = _914 * _948;
    float _976 = _912 * _946;
    float _978 = -_964;
    float _980 = _978 + 1.0;
    float _982 = _952 * _972;
    bool _984 = _942 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _986 = isnan(_942);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1004;
    float _1008 = _910 * _944;
    float _1010 = _994 * _980;
    float _1012 = fma(_998, _982, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1014 = fma(_1006, _982, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1016 = fma(_1002, _982, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1018 = -_994;
    float _1020 = _1018 + 1.0;
    float _1022 = _1012 * _1010;
    float _1024 = _1014 * _1010;
    float _1026 = _1016 * _1010;
    float _1028 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1022);
    float _1030 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1024);
    float _1032 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1026);
    float _1034 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1028);
    float _1036 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1030);
    float _1038 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1032);
    bool _1040 = !_970;
    float _1056;
    if (!_1040)
    {
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1044 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _1048 = _1046 * _1042;
        float _1050 = floor(_1048);
        float _1052 = -_1050;
        float _1054 = _1048 + _1052;
        _1056 = _1054;
        _1058 = true;
    }
    else
    {
        float _1060 = float(_106);
        float _1062 = 1.0 / _1060;
        float _1064 = _142 * _1062;
        _1056 = _1064;
    }
    _1058 = false;
    float _1066 = _1056;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1070 = _1066 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1076 = _1066 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1078 = isnan(_1066);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1084 = _1080 || _1082;
    float _1086 = float(_1084);
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1092 = _1066 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1094 = isnan(_1066);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1100 = _1096 || _1098;
    float _1102 = float(_1100);
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1104;
    bool _1108 = _1066 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1110 = isnan(_1066);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = 1.0 / _1074;
    float _1122 = -_1086;
    float _1124 = _1122 + 1.0;
    bool _1126 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1128 = _1102 * _1124;
    float _1130 = -_1102;
    float _1132 = _1130 + 1.0;
    float _1134 = 1.0 / _1090;
    float _1136 = _1106 * _1120;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1140 = _1138 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1142 = fma(_1136, _1070, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1144 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1146 = _1140 * _1134;
    float _1148 = _1142 * _1128;
    float _1150 = -_1118;
    float _1152 = _1150 + 1.0;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1156 = _1066 + _1154;
    float _1158 = _1144 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1160 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1148);
    float _1162 = _1086 * _1152;
    float _1164 = fma(_1146, _1156, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1166 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1168 = _1038 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1170 = fma(_1164, _1162, _1160);
    float _1172 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1174 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1170);
    float _1178 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1180 = !_1126;
    float _1196;
    if (!_1180)
    {
        float _1182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1184 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1186 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[11].z, _142);
        float _1188 = _1186 * _1182;
        float _1190 = floor(_1188);
        float _1192 = -_1190;
        float _1194 = _1188 + _1192;
        _1196 = _1194;
        _1198 = true;
    }
    else
    {
        float _1200 = float(_106);
        float _1202 = 1.0 / _1200;
        float _1204 = _142 * _1202;
        _1196 = _1204;
    }
    _1198 = false;
    float _1206 = _1196;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1210 = _1206 + _1208;
    bool _1212 = _1206 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1214 = isnan(_1206);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1220 = _1216 || _1218;
    float _1222 = float(_1220);
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1224;
    bool _1228 = _1206 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1230 = isnan(_1206);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = -_1222;
    float _1242 = _1240 + 1.0;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1244;
    float _1248 = 1.0 / _1226;
    bool _1250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1252 = _1238 * _1242;
    float _1254 = -_1238;
    float _1256 = _1254 + 1.0;
    float _1258 = _1210 * _1248;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1260;
    float _1264 = fma(_1246, _1258, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1266;
    float _1270 = fma(_1262, _1258, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1272 = _1264 * _1252;
    float _1274 = fma(_1268, _1258, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1276 = _1270 * _1252;
    float _1278 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1272);
    float _1280 = _1274 * _1252;
    float _1282 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1276);
    float _1284 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1278);
    float _1286 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1280);
    float _1288 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1282);
    float _1290 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1286);
    bool _1292 = !_1250;
    float _1308;
    if (!_1292)
    {
        float _1294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1296 = _128 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1298 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _1300 = _1298 * _1294;
        float _1302 = floor(_1300);
        float _1304 = -_1302;
        float _1306 = _1300 + _1304;
        _1308 = _1306;
        _1310 = true;
    }
    else
    {
        float _1312 = float(_106);
        float _1314 = 1.0 / _1312;
        float _1316 = _142 * _1314;
        _1308 = _1316;
    }
    _1310 = false;
    float _1318 = _1308;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1322 = _1318 + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1328 = _1318 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1330 = isnan(_1318);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1342 = _1340 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1346 = _1344 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1348 = _1318 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1350 = isnan(_1318);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1356 = _1352 || _1354;
    float _1358 = float(_1356);
    float _1360 = 1.0 / _1326;
    float _1362 = -_1338;
    float _1364 = _1362 + 1.0;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1366;
    bool _1370 = _1318 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1372 = isnan(_1318);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1378 = _1374 || _1376;
    float _1380 = float(_1378);
    float _1382 = _1358 * _1364;
    float _1384 = -_1358;
    float _1386 = _1384 + 1.0;
    bool _1388 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1390 = 1.0 / _1342;
    float _1392 = _1380 * _1386;
    float _1394 = -_1380;
    float _1396 = _1394 + 1.0;
    float _1398 = 1.0 / _1346;
    float _1400 = _1368 * _1360;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1406 = fma(_1400, _1322, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1408 = _1318 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1410 = isnan(_1318);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = _1404 * _1390;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1422;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1428 = _1318 + _1426;
    float _1430 = _1406 * _1392;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1434 = _1318 + _1432;
    float _1436 = _1284 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1438 = fma(_1420, _1428, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1440 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1430);
    float _1442 = _1424 * _1398;
    float _1444 = -_1418;
    float _1446 = _1444 + 1.0;
    float _1448 = fma(_1438, _1382, _1440);
    float _1450 = fma(_1442, _1434, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1452 = _1338 * _1446;
    float _1454 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1456 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1458 = fma(_1450, _1452, _1448);
    float _1460 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1462 = _1454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1464 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1466 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1458);
    float _1468 = _1466 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1470 = !_1388;
    float _1472 = _1452;
    float _1488;
    if (!_1470)
    {
        float _1474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1476 = _128 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[14].x, _142);
        float _1480 = _1478 * _1474;
        float _1482 = floor(_1480);
        float _1484 = -_1482;
        float _1486 = _1480 + _1484;
        _1488 = _1486;
        _1490 = true;
    }
    else
    {
        float _1492 = float(_106);
        float _1494 = 1.0 / _1492;
        float _1496 = _142 * _1494;
        _1488 = _1496;
    }
    _1490 = false;
    float _1498 = _1488;
    float _1500 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1502 = int(_1500);
    float _1504 = in.m_51.y;
    float _1506 = float(_106);
    float _1508 = _976 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1510 = in.m_51.z;
    float _1512 = _974 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1514 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1516 = int(_1514);
    out.m_63.x = _1158;
    out.m_63.y = _1172;
    out.m_63.z = _1174;
    out.m_63.w = _1178;
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1520 = _1498 + _1518;
    float _1522 = in.m_59.w;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1526 = _1524 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1528 = float(_1502);
    float _1530 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1532 = int(_1530);
    float _1534 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1538 = _1536 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1540 = in.m_55.w;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1544 = _1498 + _1542;
    float _1546 = _592 * _164;
    float _1548 = 1.0 / _1528;
    float _1550 = float(uint(_1516));
    float _1552 = _592 * _186;
    bool _1554 = _1516 == 0;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1558 = _1556 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1560 = fma(_602, _162, _1546);
    float _1562 = _128 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1564 = 1.0 / _1550;
    float _1566 = float(_1532);
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1570 = _1498 + _1568;
    bool _1572 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1574 = isnan(_1498);
    bool _1576 = _1572 || _1574;
    bool _1578 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1580 = _1576 || _1578;
    float _1582 = float(_1580);
    float _1584 = _142 * _1548;
    float _1586 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1588 = int(_1586);
    int _1590 = as_type<int>(_1564) + (-2);
    float _1592 = trunc(_1584);
    int _1594 = int(_1592);
    float _1596 = 1.0 / _1566;
    float _1598 = float(uint(_1588));
    int _1600 = ~_1588;
    int _1602 = _1600 + 1;
    float _1604 = float(_1588);
    int _1606 = ~_1588;
    int _1608 = _1606 + 1;
    float _1610 = 1.0 / _1598;
    float _1612 = float(uint(_1594));
    float _1614 = as_type<float>(_1590) * _1612;
    float _1616 = _142 * _1596;
    int _1618 = ~_1516;
    int _1620 = _1618 + 1;
    float _1622 = trunc(_1614);
    float _1624 = precise::max(_1622, 0.0);
    uint _1627 = uint(_1624);
    int _1629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1631 = _1629 != 0;
    int _1633 = as_type<int>(_1610) + (-2);
    float _1635 = trunc(_1616);
    int _1637 = int(_1635);
    int _1639 = _1590;
    if (_1631)
    {
        _1472 = 1.0;
    }
    float _1641 = _1472;
    int _1643 = _1620 * int(_1627);
    int _1645 = _1643 + _1594;
    float _1647 = _1641;
    float _1649 = as_type<float>(_1645);
    if (!_1631)
    {
        _1647 = 7.345489978790283203125;
    }
    float _1651 = _1647;
    float _1653 = 1.0 / _1506;
    float _1655 = float(uint(_1645));
    float _1657 = _1651 * _128;
    float _1659 = _1655;
    if (_1631)
    {
        _1649 = 1.0;
    }
    float _1661 = _1649;
    float _1663 = float(uint(_1637));
    float _1665 = 1.0 / _1558;
    float _1667 = _1661;
    if (!_1631)
    {
        _1667 = 1.2345600128173828125;
    }
    float _1669 = _1667;
    float _1671 = as_type<float>(_1633) * _1663;
    float _1673 = as_type<float>(_1590) * _1655;
    if (_1631)
    {
        _1659 = _128;
    }
    float _1675 = _1659;
    float _1677 = trunc(_1671);
    float _1679 = precise::max(_1677, 0.0);
    uint _1681 = uint(_1679);
    float _1683 = _1675;
    if (!_1631)
    {
        _1683 = _1504;
    }
    float _1685 = _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1689 = _1687 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1691 = _1685 * _1669;
    int _1693 = ~_1516;
    int _1695 = _1693 + 1;
    float _1697 = trunc(_1673);
    float _1699 = precise::max(_1697, 0.0);
    uint _1701 = uint(_1699);
    float _1703 = float(_1594);
    float _1705 = floor(_1657);
    int _1707 = _1602 * int(_1681);
    int _1709 = _1707 + _1637;
    float _1711 = float(uint(_1709));
    int _1713 = int(_1627) + int(_1701);
    float _1715 = floor(_1691);
    float _1717 = as_type<float>(_1633) * _1711;
    float _1719 = float(_1516);
    float _1721 = _142 * _1604;
    int _1723 = _1695 * _1713;
    int _1725 = _1723 + _1594;
    bool _1727 = _1703 >= _1719;
    bool _1729 = isnan(_1703);
    bool _1731 = _1727 || _1729;
    bool _1733 = isnan(_1719);
    bool _1735 = _1731 || _1733;
    float _1737 = float(_1735);
    float _1739 = trunc(_1717);
    float _1741 = precise::max(_1739, 0.0);
    uint _1743 = uint(_1741);
    float _1745 = -_1705;
    float _1747 = _1657 + _1745;
    float _1749 = _1721 * _1653;
    bool _1751 = uint(_1725) >= uint(_1516);
    float _1753 = _142 * _1719;
    float _1755 = _1747 * _1719;
    int _1757 = _1516 + (-1);
    float _1759 = trunc(_1737);
    int _1761 = int(_1759);
    bool _1763 = !_1751;
    int _1765 = _1763 ? 0 : (-1);
    float _1767 = -_1715;
    float _1769 = _1691 + _1767;
    int _1771 = ~_1588;
    int _1773 = _1771 + 1;
    float _1775 = _1753 * _1653;
    int _1777 = ~_1713;
    int _1779 = _1777 + _1765;
    int _1781 = _1779 + 1;
    float _1783 = _1604 * _1769;
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1787 = _1785 != 0;
    int _1789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1791 = _1789 != 0;
    int _1793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1795 = _1793 != 0;
    float _1797 = trunc(_1755);
    int _1799 = int(_1797);
    int _1801 = int(_1681) + int(_1743);
    int _1803 = _1516 * _1781;
    int _1805 = _1803 + _1594;
    int _1807 = _1773 * _1801;
    int _1809 = _1807 + _1637;
    bool _1811 = !_1554;
    int _1813 = _1811 ? _1805 : (-1);
    float _1815 = trunc(_1775);
    int _1817 = int(_1815);
    int _1819 = ~_1761;
    int _1821 = _1819 + 1;
    int _1823 = _1821 + 1;
    int _1825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1827 = _1825 != 0;
    bool _1829 = uint(_1809) >= uint(_1588);
    int _1831 = _1813 * _1823;
    bool _1833 = !_1791;
    int _1835 = _1833 ? 0 : 1;
    float _1837 = trunc(_1783);
    int _1839 = int(_1837);
    bool _1841 = !_1827;
    int _1843 = _1841 ? 0 : 1;
    int _1845 = _1761 * _1757;
    int _1847 = _1845 + _1831;
    float _1849 = float(_1637);
    bool _1851 = !_1787;
    int _1853 = _1851 ? 0 : 1;
    bool _1855 = _1849 >= _1604;
    bool _1857 = isnan(_1849);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan(_1604);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    float _1867 = trunc(_1749);
    int _1869 = int(_1867);
    int _1871 = abs(_1835);
    int _1873 = abs(_1853);
    int _1875 = abs(_1843);
    float _1877 = trunc(_1865);
    int _1879 = int(_1877);
    int _1881 = _1799 * _1875;
    int _1883 = _1881 + _1594;
    bool _1885 = !_1829;
    int _1887 = _1885 ? 0 : (-1);
    int _1889 = _1847 * _1871;
    int _1891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1893 = _1891 != 0;
    int _1895 = ~_1801;
    int _1897 = _1895 + _1887;
    int _1899 = _1897 + 1;
    int _1901 = _1817 * _1873;
    int _1903 = _1901 + _1889;
    bool _1905 = !_1795;
    int _1907 = _1905 ? 0 : 1;
    float _1909 = 1.0 / _1526;
    int _1911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1913 = _1911 != 0;
    int _1915 = _1588 * _1899;
    int _1917 = _1915 + _1637;
    bool _1919 = !_1893;
    int _1921 = _1919 ? 0 : 1;
    bool _1923 = _1588 == 0;
    int _1925 = abs(_1907);
    float _1927 = 1.0 / _1689;
    bool _1929 = !_1913;
    int _1931 = _1929 ? 0 : 1;
    int _1933 = abs(_1921);
    int _1935 = ~_1879;
    int _1937 = _1935 + 1;
    int _1939 = _1937 + 1;
    bool _1941 = !_1923;
    int _1943 = _1941 ? _1917 : (-1);
    int _1945 = _1839 * _1933;
    int _1947 = _1945 + _1637;
    int _1949 = abs(_1931);
    int _1951 = _1883 * _1925;
    int _1953 = _1951 + _1903;
    int _1955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1957 = _1955 != 0;
    int _1959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1961 = _1959 != 0;
    int _1963 = _1939 * _1943;
    int _1965 = _1588 + (-1);
    int _1967 = _1799 * _1949;
    int _1969 = _1967 + _1953;
    int _1971 = ~_1516;
    int _1973 = _1971 + 1;
    float _1975 = 1.0 / _1538;
    bool _1977 = !_1961;
    int _1979 = _1977 ? 0 : 1;
    int _1981 = _1879 * _1965;
    int _1983 = _1981 + _1963;
    int _1985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1987 = _1985 != 0;
    int _1989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1991 = _1989 != 0;
    bool _1993 = !_1957;
    int _1995 = _1993 ? 0 : 1;
    int _1997 = abs(_1979);
    bool _1999 = !_1987;
    int _2001 = _1999 ? 0 : 1;
    float _2003 = float(uint(_1969));
    int _2005 = abs(_1995);
    float _2007 = as_type<float>(_1590) * _2003;
    bool _2009 = !_1991;
    int _2011 = _2009 ? 0 : 1;
    int _2013 = abs(_2001);
    int _2015 = _1983 * _1997;
    float _2017 = trunc(_2007);
    float _2019 = precise::max(_2017, 0.0);
    uint _2021 = uint(_2019);
    int _2023 = abs(_2011);
    int _2025 = _1869 * _2005;
    int _2027 = _2025 + _2015;
    int _2029 = ~_1516;
    int _2031 = _2029 + 1;
    float _2033 = in.m_65.x;
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2037 = _2035 != 0;
    int _2039 = _1947 * _2013;
    int _2041 = _2039 + _2027;
    int _2043 = ~_1588;
    int _2045 = _2043 + 1;
    int _2047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2049 = _2047 != 0;
    int _2051 = _1839 * _2023;
    int _2053 = _2051 + _2041;
    bool _2055 = _1516 == 0;
    float _2057 = float(uint(_2053));
    int _2059 = _2031 * int(_2021);
    int _2061 = _2059 + _1969;
    bool _2063 = _1961;
    float _2065 = _2007;
    if (_2037)
    {
        bool _2067 = _128 > 0.5;
        _2063 = _2067;
    }
    bool _2069 = _2063;
    float _2071 = as_type<float>(_1633) * _2057;
    float _2073 = float(uint(_2061));
    float _2075 = trunc(_2071);
    float _2077 = precise::max(_2075, 0.0);
    uint _2079 = uint(_2077);
    float _2081 = as_type<float>(_1590) * _2073;
    float _2083 = _2073;
    if (!_2037)
    {
        _2083 = _2033;
    }
    float _2085 = _2083;
    float _2087 = trunc(_2081);
    float _2089 = precise::max(_2087, 0.0);
    uint _2091 = uint(_2089);
    float _2093 = _2085;
    if (!_2037)
    {
        _2065 = _2085;
    }
    float _2095 = _2065;
    float _2097 = _2095;
    if (_2037)
    {
        _2093 = _2033;
    }
    float _2099 = _2093;
    int _2101 = ~_1516;
    int _2103 = _2101 + 1;
    int _2105 = _2045 * int(_2079);
    int _2107 = _2105 + _2053;
    float _2109 = float(uint(_2107));
    float _2111 = in.m_65.y;
    int _2113 = int(_2021) + int(_2091);
    int _2115 = int(_2091);
    float _2117 = _2099;
    if (_2037)
    {
        float _2119 = -_2099;
        float _2121 = _2119 + 1.0;
        _2115 = as_type<int>(_2121);
    }
    int _2123 = _2115;
    float _2125 = as_type<float>(_1633) * _2109;
    int _2127 = _2103 * _2113;
    int _2129 = _2127 + _1969;
    int _2131 = _2129;
    if (_2037)
    {
        float _2133 = _2069 ? as_type<float>(_2123) : _2099;
        _2097 = _2133;
    }
    float _2135 = _2097;
    float _2137 = in.m_51.w;
    float _2139 = trunc(_2125);
    float _2141 = precise::max(_2139, 0.0);
    uint _2143 = uint(_2141);
    int _2145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2147 = _2145 != 0;
    bool _2149 = uint(_2129) >= uint(_1516);
    bool _2151 = _2149;
    if (_2049)
    {
        float _2153 = -_2099;
        float _2155 = _2153 + 1.0;
        _2131 = as_type<int>(_2155);
    }
    int _2157 = _2131;
    bool _2159 = !_2149;
    int _2161 = _2159 ? 0 : (-1);
    if (_2049)
    {
        bool _2163 = _1510 > 0.5;
        _2151 = _2163;
    }
    bool _2165 = _2151;
    int _2167 = ~_2113;
    int _2169 = _2167 + _2161;
    int _2171 = _2169 + 1;
    int _2173 = ~_1588;
    int _2175 = _2173 + 1;
    if (_2049)
    {
        float _2177 = _2165 ? as_type<float>(_2157) : _2099;
        _2117 = _2177;
    }
    float _2179 = _2117;
    int _2181 = _1516 * _2171;
    int _2183 = _2181 + _1969;
    int _2185 = int(_2079) + int(_2143);
    float _2187 = -_2111;
    float _2189 = _2187 + 1.0;
    bool _2191 = _1504 > 0.5;
    int _2193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2195 = _2193 != 0;
    int _2197 = _2175 * _2185;
    int _2199 = _2197 + _2053;
    int _2201 = _2191 ? as_type<int>(_2189) : as_type<int>(_2111);
    bool _2203 = !_2055;
    int _2205 = _2203 ? _2183 : (-1);
    bool _2207 = uint(_2199) >= uint(_1588);
    float _2209 = _2147 ? as_type<float>(_2201) : _2111;
    bool _2211 = !_2207;
    int _2213 = _2211 ? 0 : (-1);
    bool _2215 = _2137 > 0.5;
    int _2217 = ~_2185;
    int _2219 = _2217 + _2213;
    int _2221 = _2219 + 1;
    float _2223 = float(uint(_1883));
    int _2225 = _2205 & 3;
    bool _2227 = _2225 != 0;
    int _2229 = _1588 * _2221;
    int _2231 = _2229 + _2053;
    float _2233 = _2111;
    if (_2195)
    {
        float _2235 = _2215 ? _2189 : _2111;
        _2233 = _2235;
    }
    float _2237 = _2233;
    float _2239 = as_type<float>(_1590) * _2223;
    bool _2241 = uint(_2225) > 1u;
    float _2243 = _128 * 2.0;
    float _2245 = float(uint(_1947));
    bool _2247 = !_1923;
    int _2249 = _2247 ? _2231 : (-1);
    float _2251 = floor(_2243);
    int _2253 = _2205 & 3;
    bool _2255 = _2253 != 0;
    float _2257 = as_type<float>(_1633) * _2245;
    int _2259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2261 = _2259 != 0;
    int _2263 = _2255 ? 0 : 1;
    int _2265 = _2249 & 3;
    bool _2267 = _2265 != 0;
    float _2269 = trunc(_2239);
    float _2271 = precise::max(_2269, 0.0);
    uint _2273 = uint(_2271);
    int _2275 = ~_2263;
    int _2277 = _2275 + 1;
    int _2279 = _2277 + 1;
    int _2281 = _2279;
    if (!_2241)
    {
        int _2283 = ~_2263;
        int _2285 = _2283 + 1;
        _2281 = _2285;
    }
    int _2287 = _2281;
    int _2289 = _2267 ? 0 : 1;
    bool _2291 = uint(_2225) >= 2u;
    float _2293 = trunc(_2257);
    float _2295 = precise::max(_2293, 0.0);
    uint _2297 = uint(_2295);
    bool _2299 = _2225 != 3;
    float _2301 = _1504 * 2.0;
    int _2303 = _2291 ? 0 : 1;
    bool _2305 = uint(_2265) > 1u;
    int _2307 = ~_2303;
    int _2309 = _2307 + 1;
    int _2311 = _2309 + 1;
    int _2313 = _1973 * int(_2273);
    int _2315 = _2313 + _1883;
    int _2317 = ~_2289;
    int _2319 = _2317 + 1;
    int _2321 = _2319 + 1;
    float _2323 = floor(_2301);
    int _2325 = abs(_2287);
    float _2327 = float(uint(_2315));
    int _2329 = _2311;
    int _2331 = _2321;
    if (_2299)
    {
        int _2333 = ~_2303;
        int _2335 = _2333 + 1;
        _2329 = _2335;
    }
    int _2337 = _2329;
    int _2339 = _1608 * int(_2297);
    int _2341 = _2339 + _1947;
    bool _2343 = _2251 >= 0.0;
    bool _2345 = isnan(_2251);
    bool _2347 = _2343 || _2345;
    bool _2349 = isnan(0.0);
    bool _2351 = _2347 || _2349;
    float _2353 = as_type<float>(_1590) * _2327;
    if (!_2305)
    {
        int _2355 = ~_2289;
        int _2357 = _2355 + 1;
        _2331 = _2357;
    }
    int _2359 = _2331;
    float _2361 = float(uint(_2341));
    float _2363 = trunc(_2353);
    float _2365 = precise::max(_2363, 0.0);
    uint _2367 = uint(_2365);
    bool _2369 = _2251 > 0.0;
    float _2371 = as_type<float>(_1633) * _2361;
    int _2373 = _2351 ? 0 : 1;
    bool _2375 = _2323 > 0.0;
    int _2377 = ~_1516;
    int _2379 = _2377 + 1;
    float _2381 = trunc(_2371);
    float _2383 = precise::max(_2381, 0.0);
    uint _2385 = uint(_2383);
    int _2387 = ~_2373;
    int _2389 = _2387 + 1;
    int _2391 = _2389 + 1;
    int _2393 = _2391;
    if (_2261)
    {
        _1639 = 0;
    }
    int _2395 = _1639;
    int _2397 = _2395;
    if (!_2369)
    {
        int _2399 = ~_2373;
        int _2401 = _2399 + 1;
        _2393 = _2401;
    }
    int _2403 = _2393;
    bool _2405 = uint(_2265) >= 2u;
    int _2407 = int(_2273) + int(_2367);
    if (!_2261)
    {
        _2397 = 1;
    }
    int _2409 = _2397;
    bool _2411 = _2323 >= 0.0;
    bool _2413 = isnan(_2323);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan(0.0);
    bool _2419 = _2415 || _2417;
    int _2421 = _2405 ? 0 : 1;
    int _2423 = _2419 ? 0 : 1;
    bool _2425 = _2409 != 1;
    int _2427 = _2379 * _2407;
    int _2429 = _2427 + _1883;
    int _2431 = ~_1588;
    int _2433 = _2431 + 1;
    bool _2435 = _2265 != 3;
    int _2437 = ~_2423;
    int _2439 = _2437 + 1;
    int _2441 = _2439 + 1;
    int _2443 = _2441;
    if (!_2375)
    {
        int _2445 = ~_2423;
        int _2447 = _2445 + 1;
        _2443 = _2447;
    }
    int _2449 = _2443;
    bool _2451 = uint(_2429) >= uint(_1516);
    int _2453 = int(_2297) + int(_2385);
    float _2455 = 0.0;
    if (!_2425)
    {
        _2455 = _1504;
    }
    float _2457 = _2455;
    int _2459 = _2433 * _2453;
    int _2461 = _2459 + _1947;
    float _2463 = 0.0;
    float _2465 = _2457;
    if (!_2425)
    {
        _2463 = _1504;
    }
    float _2467 = _2463;
    float _2469 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2471 = _2469 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2473 = 0.0;
    float _2475 = _2467;
    if (!_2425)
    {
        _2473 = _1510;
    }
    float _2477 = _2473;
    float _2479 = 0.0;
    float _2481 = _2477;
    if (!_2425)
    {
        _2479 = _1510;
    }
    float _2483 = _2479;
    int _2485 = ~_2421;
    int _2487 = _2485 + 1;
    int _2489 = _2487 + 1;
    float _2491 = 1.0 / _2471;
    float _2493 = _2483;
    int _2495 = _2489;
    if (_2425)
    {
        _2465 = _128;
    }
    float _2497 = _2465;
    if (_2425)
    {
        _2475 = _128;
    }
    float _2499 = _2475;
    if (_2425)
    {
        _2481 = _1504;
    }
    float _2501 = _2481;
    float _2503 = _2497 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2425)
    {
        _2493 = _1504;
    }
    float _2505 = _2493;
    if (_2435)
    {
        int _2507 = ~_2421;
        int _2509 = _2507 + 1;
        _2495 = _2509;
    }
    int _2511 = _2495;
    float _2513 = _2501 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2515 = uint(_2461) >= uint(_1588);
    float _2517 = in.m_67.x;
    float _2519 = in.m_67.y;
    float _2521 = in.m_67.z;
    bool _2523 = !_2451;
    int _2525 = _2523 ? 0 : (-1);
    bool _2527 = !_2515;
    int _2529 = _2527 ? 0 : (-1);
    int _2531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2533 = _2531 != 0;
    int _2535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2537 = _2535 != 0;
    int _2539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2541 = _2539 != 0;
    float _2543 = _592 * _170;
    int _2545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2547 = _2545 != 0;
    float _2549 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2553 = _2551 != 0;
    float _2555 = fma(_602, _168, _2543);
    float _2557 = fma(_602, _184, _1552);
    float _2559 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2561 = fma(_2549, -2.0, _2559);
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2565 = _2563 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2567 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2569 = fma(_624, _166, _1560);
    float _2571 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2519);
    float _2573 = fma(_624, _188, _2557);
    float _2575 = _1510 * 2.0;
    float _2577 = 1.0 / _2565;
    float _2579 = _2571 * _1508;
    float _2581 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2583 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2585 = _2583 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2587 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2517);
    float _2589 = _2569 + _1540;
    float _2591 = -_2581;
    float _2593 = fma(_1562, 2.0, _2591);
    float _2595 = fma(_624, _172, _2555);
    float _2597 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2599 = log2(_2597);
    float _2601 = _2587 * _2567;
    float _2603 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2521);
    bool _2605 = !_2537;
    int _2607 = _2605 ? 0 : 1;
    float _2609 = _2603 * _1512;
    float _2611 = floor(_2575);
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2615 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2613;
    float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2619 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2617;
    bool _2621 = !_2541;
    int _2623 = _2621 ? 0 : 1;
    float _2625 = _2615 * _2491;
    float _2627 = _2619 * _1665;
    float _2629 = 1.0 / _2585;
    float _2631 = _142 * _2599;
    float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2635 = _2633 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2637 = !_2533;
    float _2639 = _2637 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _2641 = abs(_2623);
    int _2643 = ~_2407;
    int _2645 = _2643 + _2525;
    int _2647 = _2645 + 1;
    float _2649 = exp2(_2631);
    bool _2651 = _2611 >= 0.0;
    bool _2653 = isnan(_2611);
    bool _2655 = _2651 || _2653;
    bool _2657 = isnan(0.0);
    bool _2659 = _2655 || _2657;
    int _2661 = _1516 * _2647;
    int _2663 = _2661 + _1883;
    int _2665 = ~_2325;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    float _2671 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1534);
    float _2673 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2675 = _2673 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2677 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2677;
    int _2681 = _2659 ? 0 : 1;
    float _2683 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2685 = _2683 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2687 = _2675 * _2577;
    float _2689 = _2679 * _1909;
    bool _2691 = _2611 > 0.0;
    float _2693 = _2685 * _1975;
    int _2695 = ~_2681;
    int _2697 = _2695 + 1;
    int _2699 = _2697 + 1;
    float _2701 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2703 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2701;
    float _2705 = _128 + _1504;
    float _2707 = -_2649;
    float _2709 = _2707 + 1.0;
    float _2711 = _2635 * _2629;
    float _2713 = _2703 * _1927;
    float _2715 = _128 + _1510;
    float _2717 = in.m_57.w;
    float _2719 = _2705 + (-1.0);
    float _2721 = _2715 + (-1.0);
    int _2723 = _2699;
    float _2725 = _2639;
    if (!_2691)
    {
        int _2727 = ~_2681;
        int _2729 = _2727 + 1;
        _2723 = _2729;
    }
    int _2731 = _2723;
    float _2733 = fma(_2719, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2735 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2737 = isnan(0.0);
    bool _2739 = _2735 || _2737;
    bool _2741 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2743 = _2739 || _2741;
    float _2745 = _1504 + _1510;
    float _2747 = fma(_2721, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2749 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2671);
    float _2751 = _2743 ? _2709 : 0.0;
    float _2753 = _2745 + (-1.0);
    bool _2755 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2757 = isnan(1.0);
    bool _2759 = _2755 || _2757;
    bool _2761 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2763 = _2759 || _2761;
    float _2765 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2767 = 1.0 + _2765;
    bool _2769 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2771 = isnan(_1498);
    bool _2773 = _2769 || _2771;
    bool _2775 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2777 = _2773 || _2775;
    float _2779 = float(_2777);
    float _2781 = fma(_2753, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2783 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2785 = isnan(_1498);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2791 = _2787 || _2789;
    float _2793 = float(_2791);
    float _2795 = 1.0 / _2767;
    float _2797 = fma(_2689, _1520, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2799 = -_2779;
    float _2801 = _2799 + 1.0;
    float _2803 = fma(_2687, _1544, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2805 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2807 = _1498 + _2805;
    float _2809 = _2595 + _2717;
    bool _2811 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2813 = isnan(_1498);
    bool _2815 = _2811 || _2813;
    bool _2817 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2819 = _2815 || _2817;
    float _2821 = float(_2819);
    float _2823 = -_2793;
    float _2825 = _2823 + 1.0;
    float _2827 = _2793 * _2801;
    float _2829 = _2573 + _1522;
    bool _2831 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2833 = isnan(_1498);
    bool _2835 = _2831 || _2833;
    bool _2837 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2839 = _2835 || _2837;
    float _2841 = float(_2839);
    float _2843 = _2821 * _2825;
    float _2845 = -_2821;
    float _2847 = _2845 + 1.0;
    bool _2849 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2851 = isnan(_1498);
    bool _2853 = _2849 || _2851;
    bool _2855 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2857 = _2853 || _2855;
    float _2859 = float(_2857);
    float _2861 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2863 = _1498 + _2861;
    float _2865 = -_2841;
    float _2867 = _2865 + 1.0;
    float _2869 = _2841 * _2847;
    float _2871 = _2751 * _2795;
    bool _2873 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2875 = isnan(_1498);
    bool _2877 = _2873 || _2875;
    bool _2879 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2881 = _2877 || _2879;
    float _2883 = float(_2881);
    float _2885 = -_2859;
    float _2887 = _2885 + 1.0;
    float _2889 = fma(_2625, _2863, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2891 = _2859 * _2867;
    bool _2893 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2895 = isnan(_1498);
    bool _2897 = _2893 || _2895;
    bool _2899 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2901 = _2897 || _2899;
    float _2903 = float(_2901);
    float _2905 = in.m_69.x;
    float _2907 = in.m_69.y;
    float _2909 = in.m_69.z;
    float _2911 = _2883 * _2887;
    float _2913 = -_2883;
    float _2915 = _2913 + 1.0;
    bool _2917 = !_2763;
    float _2919 = _2917 ? _142 : _2871;
    float _2921 = -_2903;
    float _2923 = _2921 + 1.0;
    bool _2925 = _2519 != 0.0;
    bool _2927 = isnan(_2519);
    bool _2929 = _2925 || _2927;
    bool _2931 = isnan(0.0);
    bool _2933 = _2929 || _2931;
    float _2935 = _2903 * _2915;
    float _2937 = fma(_2693, _1570, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2939 = _1582 * _2923;
    bool _2941 = _2517 == 0.0;
    bool _2943 = !_2933;
    bool _2945 = _2941 && _2943;
    float _2947 = -_1582;
    float _2949 = _2947 + 1.0;
    int _2951 = abs(as_type<int>(_2639));
    float _2953 = _2889 * _2939;
    bool _2955 = _2521 == 0.0;
    bool _2957 = _2955 && _2945;
    float _2959 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2961 = _1498 + _2959;
    float _2963 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2965 = _1498 + _2963;
    float _2967 = fma(_2949, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2953);
    float _2969 = fma(_2627, _2807, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2971 = fma(_2711, _2961, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2973 = fma(_2713, _2965, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2975 = fma(_2803, _2935, _2967);
    float _2977 = in.m_71.x;
    float _2979 = in.m_71.y;
    float _2981 = in.m_71.z;
    int _2983 = abs(_2607);
    float _2985 = sqrt(_2749);
    float _2987 = fma(_2797, _2911, _2975);
    int _2989 = ~_2453;
    int _2991 = _2989 + _2529;
    int _2993 = _2991 + 1;
    float _2995 = _2949;
    float _2997 = _2953;
    float _2999 = _2807;
    float _3001 = _2871;
    float _3003 = as_type<float>(_2731);
    if (_2957)
    {
        _2995 = _2905;
    }
    float _3005 = _2995;
    float _3007 = fma(_2937, _2891, _2987);
    float _3009 = _3005;
    if (_2957)
    {
        _2997 = _2907;
    }
    float _3011 = _2997;
    float _3013 = _3011;
    if (_2957)
    {
        _2725 = _3005;
    }
    float _3015 = _2725;
    float _3017 = fma(_2969, _2869, _3007);
    float _3019 = _3015;
    if (_2957)
    {
        _2999 = _3011;
    }
    float _3021 = _2999;
    float _3023 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3025 = int(_3023);
    float _3027 = _3021;
    if (!_2957)
    {
        _3009 = _2905;
    }
    float _3029 = _3009;
    float _3031 = fma(_2971, _2843, _3017);
    if (!_2957)
    {
        _3013 = _2907;
    }
    float _3033 = _3013;
    if (_2957)
    {
        _3001 = _2909;
    }
    float _3035 = _3001;
    float _3037 = _3035;
    if (!_2957)
    {
        float _3039 = fma(_2517, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3029);
        _3019 = _3039;
    }
    float _3041 = _3019;
    if (!_2957)
    {
        float _3043 = fma(_2519, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3033);
        _3027 = _3043;
    }
    float _3045 = _3027;
    float _3047 = float(_2951);
    float _3049 = _1510 + (-0.5);
    float _3051 = float(_2731);
    float _3053 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_2957)
    {
        _3003 = _3035;
    }
    float _3055 = _3003;
    float _3057 = fma(_2973, _2827, _3031);
    float _3059 = _3055;
    if (!_2957)
    {
        _3037 = _2909;
    }
    float _3061 = _3037;
    float _3063 = _3047 * _3051;
    float _3065 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3053);
    float _3067 = _3063 * (-2.0);
    float _3069 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3071 = float(_2403);
    float _3073 = _128 + (-0.5);
    float _3075 = fma(_3067, _2977, _2977);
    float _3077 = fma(_2499, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3069);
    float _3079 = float(_2983);
    float _3081 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3083 = fma(_3073, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3075);
    float _3085 = fma(_2733, _3067, _2733);
    float _3087 = fma(_1504, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3081);
    float _3089 = _3079 * _3071;
    float _3091 = _1504 + (-0.5);
    float _3093 = fma(_2919, _3085, _3083);
    float _3095 = _3089 * (-2.0);
    float _3097 = float(_2449);
    float _3099 = fma(_2779, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3057);
    float _3101 = float(_2641);
    float _3103 = fma(_3095, _2979, _2979);
    float _3105 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3107 = _3093 * 0.15915493667125701904296875;
    float _3109 = fma(_2781, _3095, _2781);
    float _3111 = _3101 * _3097;
    float _3113 = fma(_3091, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3103);
    float _3115 = fma(_2505, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3105);
    float _3117 = _3107 * 6.283185482025146484375;
    float _3119 = cos(_3117);
    float _3121 = _3111 * (-2.0);
    float _3123 = fma(_2919, _3109, _3113);
    float _3125 = in.m_73.x;
    float _3127 = in.m_73.y;
    float _3129 = in.m_73.z;
    float _3131 = in.m_73.w;
    float _3133 = fma(_3121, _2981, _2981);
    float _3135 = fma(_2747, _3121, _2747);
    float _3137 = _3123 * 0.15915493667125701904296875;
    float _3139 = _3107 * 6.283185482025146484375;
    float _3141 = sin(_3139);
    float _3143 = fma(_3049, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3133);
    float _3145 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3147 = _2985 * 50.0;
    float _3149 = fma(_2919, _3135, _3143);
    if (!_2957)
    {
        float _3151 = fma(_2521, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3061);
        _3059 = _3151;
    }
    float _3153 = _3059;
    float _3155 = fma(_2513, -2.0, _3145);
    float _3157 = _3137 * 6.283185482025146484375;
    float _3159 = sin(_3157);
    float _3161 = _3149 * 0.15915493667125701904296875;
    float _3163 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3165 = _3099 * _3147;
    bool _3167 = _1516 == 0;
    float _3169 = -_3163;
    float _3171 = fma(_2503, 2.0, _3169);
    float _3173 = _3165 * _3165;
    float _3175 = _3137 * 6.283185482025146484375;
    float _3177 = cos(_3175);
    float _3179 = _3129 * _3029;
    float _3181 = _3127 * _3061;
    float _3183 = _3125 * _3033;
    float _3185 = _3161 * 6.283185482025146484375;
    float _3187 = cos(_3185);
    float _3189 = -_3179;
    float _3191 = fma(_3125, _3061, _3189);
    float _3193 = -_3181;
    float _3195 = fma(_3129, _3033, _3193);
    float _3197 = _3119 * _3159;
    float _3199 = -_3183;
    float _3201 = fma(_3127, _3029, _3199);
    float _3203 = _3191 * _3131;
    float _3205 = _3195 * _3131;
    float _3207 = _3161 * 6.283185482025146484375;
    float _3209 = sin(_3207);
    float _3211 = _3119 * _3177;
    float _3213 = _3141 * _3177;
    float _3215 = _3201 * _3131;
    float _3217 = _3119 * _3187;
    int _3219 = _2205 >> 31;
    float _3221 = _3141 * _3159;
    float _3223 = _3141 * _3187;
    float _3225 = _3159 * _3187;
    int _3227 = _3219 & 3;
    float _3229 = _3217 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3231 = _3177 * _3187;
    float _3233 = -_3197;
    float _3235 = fma(_3209, _3213, _3233);
    float _3237 = -_3213;
    float _3239 = fma(_3209, _3197, _3237);
    int _3241 = _2205 + _3227;
    float _3243 = _3217 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3245 = -_3209;
    float _3247 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3229);
    float _3249 = -_2579;
    float _3251 = _3209 * _3249;
    float _3253 = fma(_3209, _3211, _3221);
    float _3255 = -_3209;
    float _3257 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3243);
    int _3259 = _2249 >> 31;
    float _3261 = fma(_3231, _2601, _3251);
    float _3263 = _3217 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3265 = _3223 * _2579;
    int _3267 = _3259 & 3;
    float _3269 = _3217 * _2579;
    float _3271 = fma(_3209, _3221, _3211);
    float _3273 = -_3209;
    float _3275 = fma(_3273, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3263);
    int _3277 = _2249 + _3267;
    float _3279 = fma(_3253, _2601, _3269);
    int _3281 = _3241 >> 2;
    float _3283 = rsqrt(_3173);
    int _3285 = _3277 >> 2;
    float _3287 = fma(_3235, _2601, _3265);
    int _3289 = _3281 << 4;
    int _3291 = _3289 + 368;
    float _3293 = _3253 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3295 = _3285 << 4;
    int _3297 = _3295 + 512;
    float _3299 = _3253 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _3301 = uint(int(uint(_3291) >> uint(2)));
    uint _3303 = uint(int(uint(int(_3301)) >> uint(2)));
    int _3305 = int(_3301) & 3;
    float _3307 = (*spvDescriptorSet0.vp_c9)._m0[int(_3303)][_3305];
    int _3309 = int(_3301) + 1;
    uint _3311 = uint(int(uint(_3309) >> uint(2)));
    int _3313 = _3309 & 3;
    float _3315 = (*spvDescriptorSet0.vp_c9)._m0[int(_3311)][_3313];
    float _3317 = _3239 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3319 = _3239 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3321 = fma(_3225, _2609, _3261);
    float _3323 = fma(_3239, _2609, _3279);
    float _3325 = fma(_3271, _2609, _3287);
    float _3327 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3317);
    float _3329 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3319);
    uint _3331 = uint(int(uint(_3297) >> uint(2)));
    uint _3333 = uint(int(uint(int(_3331)) >> uint(2)));
    int _3335 = int(_3331) & 3;
    float _3337 = (*spvDescriptorSet0.vp_c9)._m0[int(_3333)][_3335];
    int _3339 = int(_3331) + 1;
    uint _3341 = uint(int(uint(_3339) >> uint(2)));
    int _3343 = _3339 & 3;
    float _3345 = (*spvDescriptorSet0.vp_c9)._m0[int(_3341)][_3343];
    float _3347 = _3165 * _3283;
    float _3349 = _3253 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3351 = _3239 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3353 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3293);
    float _3355 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3299);
    float _3357 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3349);
    float _3359 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3351);
    int _3361 = _3297 + 8;
    uint _3363 = uint(int(uint(_3361) >> uint(2)));
    uint _3365 = uint(int(uint(int(_3363)) >> uint(2)));
    int _3367 = int(_3363) & 3;
    float _3369 = (*spvDescriptorSet0.vp_c9)._m0[int(_3365)][_3367];
    int _3371 = int(_3363) + 1;
    uint _3373 = uint(int(uint(_3371) >> uint(2)));
    int _3375 = _3371 & 3;
    float _3377 = (*spvDescriptorSet0.vp_c9)._m0[int(_3373)][_3375];
    float _3379 = _3323 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3381 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3357);
    float _3383 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3353);
    float _3385 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3355);
    float _3387 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3379);
    float _3389 = _3323 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3391 = _3323 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3393 = _3291 + 8;
    uint _3395 = uint(int(uint(_3393) >> uint(2)));
    uint _3397 = uint(int(uint(int(_3395)) >> uint(2)));
    int _3399 = int(_3395) & 3;
    float _3401 = (*spvDescriptorSet0.vp_c9)._m0[int(_3397)][_3399];
    int _3403 = int(_3395) + 1;
    uint _3405 = uint(int(uint(_3403) >> uint(2)));
    int _3407 = _3403 & 3;
    float _3409 = (*spvDescriptorSet0.vp_c9)._m0[int(_3405)][_3407];
    float _3411 = fma(_3325, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3387);
    bool _3413 = !_2227;
    int _3415 = _3413 ? 0 : 1;
    float _3417 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3389);
    int _3419 = _2249 & 3;
    bool _3421 = _3419 != 0;
    float _3423 = fma(_3223, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3257);
    int _3425 = abs(_2359);
    float _3427 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3391);
    float _3429 = fma(_3325, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3417);
    bool _3431 = !_3421;
    int _3433 = _3431 ? 0 : 1;
    float _3435 = _3411 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _3437 = ~_3425;
    int _3439 = _3437 + 1;
    int _3441 = _3439 + 1;
    float _3443 = fma(_3325, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3427);
    bool _3445 = _2225 != 3;
    float _3447 = fma(_3223, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3247);
    int _3449 = abs(_3415);
    float _3451 = fma(_3223, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3275);
    int _3453 = abs(_3433);
    float _3455 = sqrt(_3173);
    bool _3457 = !_3445;
    int _3459 = _3457 ? 0 : (-1);
    float _3461 = _3423 * _3127;
    bool _3463 = _2265 != 3;
    float _3465 = _3447 * _3127;
    int _3467 = abs(_2337);
    int _3469 = _2669 * as_type<int>(_3315);
    float _3471 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3473 = int(_3471);
    int _3475 = abs(_3459);
    float _3477 = _3451 * _3127;
    int _3479 = ~_3453;
    int _3481 = _3479 + 1;
    int _3483 = _3481 + 1;
    float _3485 = _3423 * _3045;
    float _3487 = _3447 * _3045;
    int _3489 = _3441 * as_type<int>(_3345);
    float _3491 = _3203 * _3447;
    int _3493 = abs(_2511);
    int _3495 = _3483 * as_type<int>(_3337);
    int _3497 = _3495 + _3489;
    int _3499 = ~_3449;
    int _3501 = _3499 + 1;
    int _3503 = _3501 + 1;
    float _3505 = _3451 * _3045;
    float _3507 = float(uint(_3025));
    int _3509 = _3503 * as_type<int>(_3307);
    int _3511 = _3509 + _3469;
    int _3513 = ~_3493;
    int _3515 = _3513 + 1;
    int _3517 = _3515 + 1;
    int _3519 = abs(_3473);
    float _3521 = 1.0 / _3507;
    int _3523 = ~_3467;
    int _3525 = _3523 + 1;
    int _3527 = _3525 + 1;
    int _3529 = _3517 * as_type<int>(_3369);
    int _3531 = _3529 + _3497;
    bool _3533 = !_3463;
    int _3535 = _3533 ? 0 : (-1);
    int _3537 = _3527 * as_type<int>(_3401);
    int _3539 = _3537 + _3511;
    int _3541 = abs(_3535);
    bool _3543 = !_2547;
    int _3545 = _3543 ? 0 : 1;
    bool _3547 = !_2553;
    int _3549 = _3547 ? 0 : 1;
    int _3551 = abs(_3545);
    int _3553 = ~_3475;
    int _3555 = _3553 + 1;
    int _3557 = _3555 + 1;
    int _3559 = ~_3541;
    int _3561 = _3559 + 1;
    int _3563 = _3561 + 1;
    int _3565 = abs(_3549);
    int _3567 = _3557 * as_type<int>(_3409);
    int _3569 = _3567 + _3539;
    float _3571 = float(uint(_3473));
    int _3573 = _3563 * as_type<int>(_3377);
    int _3575 = _3573 + _3531;
    int _3577 = ~_3551;
    int _3579 = _3577 + 1;
    int _3581 = _3579 + 1;
    int _3583 = _1588 * _2993;
    int _3585 = _3583 + _1947;
    float _3587 = float(uint(_3519));
    float _3589 = _3429 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _3591 = abs(_3025);
    int _3593 = _3569 * _3581;
    bool _3595 = !_3167;
    int _3597 = _3595 ? _2663 : (-1);
    float _3599 = 1.0 / _3571;
    int _3601 = ~_3565;
    int _3603 = _3601 + 1;
    int _3605 = _3603 + 1;
    bool _3607 = _1588 == 0;
    int _3609 = _3597 * _3551;
    int _3611 = _3609 + _3593;
    float _3613 = float(uint(_3591));
    int _3615 = _3605 * _3575;
    bool _3617 = !_3607;
    int _3619 = _3617 ? _3585 : (-1);
    float _3621 = 1.0 / _3587;
    int _3623 = ~_3025;
    int _3625 = _3623 + 1;
    float _3627 = _3443 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _3629 = as_type<int>(_3521) + (-2);
    int _3631 = _3619 * _3565;
    int _3633 = _3631 + _3615;
    float _3635 = _3589 * _3589;
    float _3637 = float(uint(_3611));
    float _3639 = 1.0 / _3613;
    int _3641 = as_type<int>(_3599) + (-2);
    float _3643 = fma(_3435, _3435, _3635);
    float _3645 = float(uint(_3633));
    float _3647 = as_type<float>(_3629) * _3637;
    int _3649 = abs(_3633);
    float _3651 = fma(_3627, _3627, _3643);
    float _3653 = _2809 + _3435;
    float _3655 = trunc(_3647);
    float _3657 = precise::max(_3655, 0.0);
    uint _3659 = uint(_3657);
    int _3661 = as_type<int>(_3621) + (-2);
    float _3663 = as_type<float>(_3641) * _3645;
    int _3665 = abs(_3611);
    float _3667 = _2829 + _3627;
    int _3669 = ~_3473;
    int _3671 = _3669 + 1;
    float _3673 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3675 = _3653 + _3673;
    float _3677 = float(uint(_3665));
    float _3679 = rsqrt(_3651);
    int _3681 = as_type<int>(_3639) + (-2);
    float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3685 = _3667 + _3683;
    float _3687 = _3675 * _3675;
    float _3689 = fma(_3381, _3041, _3485);
    float _3691 = as_type<float>(_3681) * _3677;
    float _3693 = _3203 * _3423;
    float _3695 = trunc(_3663);
    float _3697 = precise::max(_3695, 0.0);
    uint _3699 = uint(_3697);
    float _3701 = float(uint(_3649));
    float _3703 = _3685 * _3685;
    float _3705 = _3203 * _3451;
    float _3707 = as_type<float>(_3661) * _3701;
    float _3709 = _3687 + _3703;
    float _3711 = trunc(_3691);
    float _3713 = precise::max(_3711, 0.0);
    uint _3715 = uint(_3713);
    int _3717 = _3625 * int(_3659);
    int _3719 = _3717 + _3611;
    float _3721 = float(uint(_3719));
    float _3723 = trunc(_3707);
    float _3725 = precise::max(_3723, 0.0);
    uint _3727 = uint(_3725);
    int _3729 = _3671 * int(_3699);
    int _3731 = _3729 + _3633;
    int _3733 = ~_3591;
    int _3735 = _3733 + 1;
    float _3737 = as_type<float>(_3629) * _3721;
    float _3739 = fma(_3271, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3327);
    float _3741 = fma(_3271, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3359);
    float _3743 = float(uint(_3731));
    float _3745 = fma(_3271, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3329);
    float _3747 = sqrt(_3709);
    int _3749 = ~_3519;
    int _3751 = _3749 + 1;
    int _3753 = _3735 * int(_3715);
    int _3755 = _3753 + _3665;
    float _3757 = _3589 * _3679;
    float _3759 = as_type<float>(_3641) * _3743;
    float _3761 = fma(_3205, _3381, _3693);
    int _3763 = _3751 * int(_3727);
    int _3765 = _3763 + _3649;
    float _3767 = float(uint(_3755));
    float _3769 = trunc(_3737);
    float _3771 = precise::max(_3769, 0.0);
    uint _3773 = uint(_3771);
    float _3775 = fma(_3385, _3041, _3505);
    float _3777 = _3347 * _3757;
    float _3779 = fma(_3383, _3041, _3487);
    float _3781 = as_type<float>(_3681) * _3767;
    float _3783 = fma(_3383, _3125, _3465);
    float _3785 = fma(_3205, _3383, _3491);
    float _3787 = _3777 * _3455;
    bool _3789 = _3747 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3791 = fma(_3205, _3385, _3705);
    float _3793 = float(uint(_3765));
    float _3795 = trunc(_3759);
    float _3797 = precise::max(_3795, 0.0);
    uint _3799 = uint(_3797);
    float _3801 = fma(_3347, _3787, _3589);
    float _3803 = fma(_3381, _3125, _3461);
    float _3805 = fma(_3385, _3125, _3477);
    float _3807 = as_type<float>(_3661) * _3793;
    float _3809 = _2589 + _3801;
    float _3811 = fma(_3741, _3129, _3803);
    float _3813 = fma(_3739, _3129, _3783);
    float _3815 = trunc(_3781);
    float _3817 = precise::max(_3815, 0.0);
    uint _3819 = uint(_3817);
    float _3821 = fma(_3745, _3129, _3805);
    float _3823 = _3801;
    float _3825 = _3787;
    float _3827 = _3653;
    float _3829 = _3687;
    float _3831 = _3703;
    float _3833 = _3215;
    float _3835 = _3813;
    float _3837 = _3811;
    if (!_3789)
    {
        _3823 = _3653;
    }
    float _3839 = _3823;
    float _3841 = _3839;
    if (!_3789)
    {
        _3825 = _3667;
    }
    float _3843 = _3825;
    float _3845 = _3843;
    if (!_3789)
    {
        _3827 = _3809;
    }
    float _3847 = _3827;
    float _3849 = trunc(_3807);
    float _3851 = precise::max(_3849, 0.0);
    uint _3853 = uint(_3851);
    bool _3855 = !_3789;
    float _3857 = _3847;
    if (!_3855)
    {
        float _3859 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3863 = _3747 + _3861;
        float _3865 = _3809 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3867 = rsqrt(_3709);
        float _3869 = _3863 * _3859;
        float _3871 = _3869 * 0.15915493667125701904296875;
        float _3873 = _3871 * 6.283185482025146484375;
        float _3875 = sin(_3873);
        float _3877 = _3871 * 6.283185482025146484375;
        float _3879 = cos(_3877);
        float _3881 = fma(_3875, _3865, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3883 = _3867 * _3881;
        float _3885 = fma(_3675, _3883, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3887 = _3879 + (-1.0);
        float _3889 = fma(_3685, _3883, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3891 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3893 = _3885 + _3891;
        float _3895 = _3887 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3899 = _3889 + _3897;
        float _3901 = _3893 * _3893;
        float _3903 = fma(_3809, _3879, _3895);
        float _3905 = _3899 * _3899;
        _3857 = _3903;
        _3829 = _3901;
        _3831 = _3905;
        _3841 = _3885;
        _3845 = _3889;
    }
    float _3907 = _3857;
    float _3909 = _3829;
    float _3911 = _3831;
    float _3913 = _3841;
    float _3915 = _3845;
    int _3917 = int(_3659) + int(_3773);
    float _3919 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3065);
    int _3921 = ~_3025;
    int _3923 = _3921 + 1;
    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3927 = _3907 + _3925;
    int _3929 = int(_3699) + int(_3799);
    float _3931 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2561);
    int _3933 = int(_3715) + int(_3819);
    int _3935 = _3923 * _3917;
    int _3937 = _3935 + _3611;
    int _3939 = ~_3591;
    int _3941 = _3939 + 1;
    float _3943 = fma(_3927, _3927, _3909);
    int _3945 = ~_3473;
    int _3947 = _3945 + 1;
    float _3949 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3155);
    bool _3951 = uint(_3937) >= uint(_3025);
    int _3953 = _3941 * _3933;
    int _3955 = _3953 + _3665;
    int _3957 = int(_3727) + int(_3853);
    int _3959 = _3947 * _3929;
    int _3961 = _3959 + _3633;
    int _3963 = ~_3519;
    int _3965 = _3963 + 1;
    float _3967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3969 = !_3951;
    int _3971 = _3969 ? 0 : (-1);
    float _3973 = _3943 + _3911;
    bool _3975 = uint(_3955) >= uint(_3591);
    int _3977 = _3965 * _3957;
    int _3979 = _3977 + _3649;
    int _3981 = ~_3917;
    int _3983 = _3981 + _3971;
    int _3985 = _3983 + 1;
    float _3987 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3087);
    bool _3989 = uint(_3961) >= uint(_3473);
    float _3991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3993 = uint(_3979) >= uint(_3519);
    int _3995 = _3025 * _3985;
    int _3997 = _3995 + _3611;
    bool _3999 = !_3975;
    int _4001 = _3999 ? 0 : (-1);
    float _4003 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3115);
    bool _4005 = !_3989;
    int _4007 = _4005 ? 0 : (-1);
    out.m_75.x = _1460;
    out.m_75.y = _1462;
    out.m_75.z = _1464;
    out.m_75.w = _1468;
    bool _4009 = _3025 == 0;
    float _4011 = sqrt(_3973);
    int _4013 = ~_3929;
    int _4015 = _4013 + _4007;
    int _4017 = _4015 + 1;
    out.m_77.x = _3811;
    out.m_77.y = _3813;
    out.m_77.z = _3821;
    int _4019 = ~_4001;
    int _4021 = _3933 + _4019;
    int _4023 = _4021 + 1;
    bool _4025 = !_4009;
    int _4027 = _4025 ? _3997 : (-1);
    int _4029 = _3473 * _4017;
    int _4031 = _4029 + _3633;
    bool _4033 = _3025 == 0;
    float _4035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4037 = _3611 ^ _3025;
    bool _4039 = _3473 == 0;
    bool _4041 = _3473 == 0;
    int _4043 = _3633 ^ _3473;
    float _4045 = _3967 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _4047 = float(_4027);
    float _4049 = -_142;
    float _4051 = fma(_4049, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2593);
    bool _4053 = !_3993;
    int _4055 = _4053 ? 0 : (-1);
    float _4057 = fma(_4045, _2135, -0.5);
    uint _4059 = uint(int(uint(_4037) >> uint(31)));
    float _4061 = fma(_4045, _4047, _4051);
    uint _4063 = uint(int(uint(_4043) >> uint(31)));
    bool _4065 = !_4039;
    int _4067 = _4065 ? _4031 : (-1);
    float _4069 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4071 = ~_4055;
    int _4073 = _3957 + _4071;
    int _4075 = _4073 + 1;
    float _4077 = fma(_3919, _4057, _4061);
    int _4079 = ~int(_4059);
    int _4081 = _4079 + 1;
    int _4083 = ~int(_4063);
    int _4085 = _4083 + 1;
    float _4087 = _4035 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _4089 = float(_4067);
    float _4091 = -_142;
    float _4093 = fma(_4091, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3171);
    int _4095 = _4023 ^ _4081;
    float _4097 = fma(_4087, _2179, -0.5);
    int _4099 = _4075 ^ _4085;
    float _4101 = fma(_4087, _4089, _4093);
    int _4103 = ~_4081;
    int _4105 = _4103 + _4095;
    int _4107 = _4105 + 1;
    float _4109 = _3991 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4111 = ~_4085;
    int _4113 = _4111 + _4099;
    int _4115 = _4113 + 1;
    float _4117 = _4069 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _4119 = !_4033;
    int _4121 = _4119 ? _4107 : (-1);
    float _4123 = fma(_4109, _2209, -0.5);
    bool _4125 = !_4041;
    int _4127 = _4125 ? _4115 : (-1);
    float _4129 = fma(_4117, _2237, -0.5);
    float _4131 = float(_4121);
    float _4133 = float(_4127);
    float _4135 = fma(_3739, _3153, _3779);
    float _4137 = fma(_3215, _3739, _3785);
    float _4139 = -_3931;
    float _4141 = fma(_4109, _4131, _4139);
    float _4143 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3077);
    float _4145 = -_3949;
    float _4147 = fma(_4117, _4133, _4145);
    float _4149 = fma(_3741, _3153, _3689);
    float _4151 = fma(_3987, _4123, _4141);
    float _4153 = fma(_4143, _4097, _4101);
    float _4155 = fma(_4003, _4129, _4147);
    float _4157 = fma(_3745, _3153, _3775);
    float _4159 = fma(_3215, _3741, _3761);
    float _4161 = fma(_3215, _3745, _3791);
    float _4163 = _4153 + 0.5;
    float _4165 = _4077 + 0.5;
    float _4167 = _4155 + 0.5;
    float _4169 = _4151 + 0.5;
    out.m_79.x = _4159;
    out.m_79.y = _4137;
    out.m_79.z = _4161;
    bool _4171 = _4011 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4173 = isnan(_4011);
    bool _4175 = _4171 || _4173;
    bool _4177 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4179 = _4175 || _4177;
    out.m_81.x = _4149;
    out.m_81.y = _4135;
    out.m_81.z = _4157;
    out.m_83.x = _4165;
    out.m_83.y = _4169;
    out.m_83.z = _4163;
    out.m_83.w = _4167;
    if (!_4179)
    {
        _3833 = 1.0;
    }
    float _4181 = _3833;
    bool _4183 = !_4179;
    float _4185 = _4181;
    if (!_4183)
    {
        bool _4187 = _4011 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4189 = isnan(_4011);
        bool _4191 = _4187 || _4189;
        bool _4193 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4195 = _4191 || _4193;
        if (!_4195)
        {
            float _4197 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4199 = _4011 + _4197;
            float _4201 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4203 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4201;
            float _4205 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4207 = _4205 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4209 = 1.0 / _4203;
            float _4211 = _4199 * _4209;
            float _4213 = fma(_4211, _4207, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4185 = _4213;
            _4215 = true;
        }
        else
        {
            bool _4217 = _4011 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4219 = isnan(_4011);
            bool _4221 = _4217 || _4219;
            bool _4223 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4225 = _4221 || _4223;
            if (!_4225)
            {
                float _4227 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4229 = _4011 + _4227;
                float _4231 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4233 = _4231 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4235 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4237 = _4235 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4239 = 1.0 / _4233;
                float _4241 = _4229 * _4239;
                float _4243 = fma(_4241, _4237, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4185 = _4243;
                _4215 = true;
            }
            else
            {
                _4185 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4215 = false;
    float _4245 = _4185;
    float _4247 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4249 = _3907 + _4247;
    float _4251 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4253 = _3913 + _4251;
    float _4255 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4257 = _3915 + _4255;
    float _4259 = fma(_4249, _4245, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4261 = fma(_4253, _4245, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4263 = fma(_4257, _4245, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4265 = -_2589;
    float _4267 = _4265 + _4259;
    float _4269 = -_2809;
    float _4271 = _4269 + _4261;
    float _4273 = -_2829;
    float _4275 = _4273 + _4263;
    float _4277 = _4267 * _4267;
    float _4279 = fma(_4271, _4271, _4277);
    float _4281 = fma(_4275, _4275, _4279);
    float _4283 = sqrt(_4281);
    bool _4285 = _4283 > 0.0;
    float _4287 = _4283;
    float _4289 = _4261;
    float _4291 = _4259;
    if (!_4285)
    {
        _4287 = _4263;
    }
    float _4293 = _4287;
    bool _4295 = !_4285;
    float _4297 = _4293;
    float _4299 = _4293;
    if (!_4295)
    {
        bool _4301 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4303 = _1464;
        if (_4301)
        {
            float _4305 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4303 = _4305;
        }
        float _4307 = _4303;
        float _4309 = _4307;
        if (_4301)
        {
            float _4311 = _626 * _4307;
            _3835 = _4311;
        }
        float _4313 = _3835;
        float _4315 = _4313;
        if (_4301)
        {
            float _4317 = _628 * _4307;
            _3837 = _4317;
        }
        float _4319 = _3837;
        float _4321 = _4319;
        if (_4301)
        {
            float _4323 = _630 * _4307;
            _4309 = _4323;
        }
        float _4325 = _4309;
        float _4327 = _4325;
        if (!_4301)
        {
            bool _4329 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4331 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4333 = _4329 || _4331;
            bool _4335 = isnan(1.0);
            bool _4337 = _4333 || _4335;
            float _4339 = _142 + 1.0;
            if (!_4337)
            {
                float _4341 = _4339 * _4339;
                float _4343 = _4341 * 0.5;
                _634 = _4343;
            }
            float _4345 = _634;
            float _4347 = _4345;
            if (!_4337)
            {
                float _4349 = _4345 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4347 = _4349;
            }
            float _4351 = _4347;
            bool _4353 = !_4337;
            float _4355 = _4351;
            if (!_4353)
            {
                float _4357 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4359 = log2(_4357);
                float _4361 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4363 = _4361 + 1.0;
                float _4365 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4367 = _4359 * _4339;
                float _4369 = 1.0 / _4363;
                float _4371 = _4365 * 0.693147182464599609375;
                float _4373 = exp2(_4367);
                float _4375 = 1.0 / _4371;
                float _4377 = _4373 + (-1.0);
                float _4379 = -_4377;
                float _4381 = fma(_4379, _4375, _4339);
                float _4383 = _4381 * _4369;
                float _4385 = _4383 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4355 = _4385;
            }
            float _4387 = _4355;
            float _4389 = _4387 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _4391 = _4387 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4393 = _4387 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4395 = _4387;
            if (!_4337)
            {
                _4395 = _4339;
            }
            float _4397 = _4395;
            float _4399 = _4389 * _372;
            float _4401 = _4389 * _352;
            float _4403 = _4389 * _390;
            float _4405 = fma(_4391, _368, _4399);
            float _4407 = fma(_4391, _348, _4401);
            float _4409 = fma(_4393, _376, _4405);
            bool _4411 = !_4337;
            float _4413 = _4397;
            if (!_4411)
            {
                float _4415 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4417 = log2(_4415);
                float _4419 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4421 = _4419 + 1.0;
                float _4423 = 1.0 / _4421;
                float _4425 = _4417 * _4339;
                float _4427 = exp2(_4425);
                float _4429 = -_4427;
                float _4431 = _4429 + 1.0;
                float _4433 = _4431 * _4423;
                _4413 = _4433;
            }
            float _4435 = _4413;
            float _4437 = fma(_4391, _386, _4403);
            float _4439 = fma(_4393, _364, _4407);
            float _4441 = fma(_4435, _250, _4409);
            float _4443 = fma(_4393, _394, _4437);
            float _4445 = fma(_4435, _248, _4439);
            float _4447 = -_588;
            float _4449 = _4447 + _4441;
            float _4451 = fma(_4435, _252, _4443);
            float _4453 = -_594;
            float _4455 = _4453 + _4445;
            float _4457 = _4449 * _170;
            float _4459 = _4449 * _164;
            float _4461 = _4449 * _186;
            float _4463 = -_600;
            float _4465 = _4463 + _4451;
            float _4467 = fma(_4455, _168, _4457);
            float _4469 = fma(_4455, _162, _4459);
            float _4471 = fma(_4455, _184, _4461);
            float _4473 = fma(_4465, _172, _4467);
            float _4475 = fma(_4465, _166, _4469);
            float _4477 = fma(_4465, _188, _4471);
            _636 = _4475;
            _638 = _4473;
            _640 = _4477;
            _4315 = _4473;
            _4321 = _4475;
            _4327 = _4477;
            _4297 = _4449;
        }
        float _4479 = _636;
        float _4481 = _638;
        float _4483 = _640;
        float _4485 = _4315;
        float _4487 = _4321;
        float _4489 = _4327;
        float _4491 = _4297;
        float _4493 = _4479 * _4479;
        float _4495 = fma(_4481, _4481, _4493);
        float _4497 = fma(_4483, _4483, _4495);
        float _4499 = rsqrt(_4281);
        float _4501 = sqrt(_4497);
        float _4503 = _4271 * _4499;
        float _4505 = _4267 * _4499;
        float _4507 = _4275 * _4499;
        bool _4509 = _4501 > 0.0;
        float _4511 = _4491;
        _642 = _4479;
        if (!_4509)
        {
            _4511 = _4263;
        }
        float _4513 = _4511;
        bool _4515 = !_4509;
        _4299 = _4513;
        if (!_4515)
        {
            float _4517 = rsqrt(_4497);
            float _4519 = _4517 * _4479;
            float _4521 = _4517 * _4481;
            float _4523 = _4517 * _4483;
            float _4525 = _4505 * _4519;
            float _4527 = fma(_4503, _4521, _4525);
            float _4529 = fma(_4507, _4523, _4527);
            float _4531 = _4529 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4533 = fma(_4485, _4531, _4261);
            float _4535 = fma(_4487, _4531, _4259);
            float _4537 = fma(_4489, _4531, _4263);
            _4289 = _4533;
            _4291 = _4535;
            _4299 = _4537;
        }
    }
    float _4539 = _4289;
    float _4541 = _4291;
    float _4543 = _4299;
    float _4545 = _642;
    float _4547 = _2589 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4549 = fma(_2809, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4547);
    float _4551 = _2589 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4553 = fma(_2829, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4549);
    bool _4555 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4557 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4559 = _4555 || _4557;
    bool _4561 = isnan(0.5);
    bool _4563 = _4559 || _4561;
    bool _4565 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4567 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4569 = _4565 || _4567;
    bool _4571 = isnan(0.5);
    bool _4573 = _4569 || _4571;
    float _4575 = _4553 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4577 = fma(_2809, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4551);
    float _4579 = 1.0 / _4575;
    float _4581 = fma(_2829, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4577);
    float _4583 = _4581 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4585 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4587 = _4545;
    float _4589 = _4543;
    float _4591 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_4563)
    {
        _228 = _4539;
    }
    float _4593 = _228;
    float _4595 = _4593;
    if (_4563)
    {
        _230 = _4541;
    }
    float _4597 = _230;
    float _4599 = _4583 + _4575;
    float _4601 = _4597;
    if (_4573)
    {
        _4585 = 1.0;
    }
    float _4603 = _4585;
    float _4605 = _4603;
    if (_4563)
    {
        _4587 = _4543;
    }
    float _4607 = _4587;
    float _4609 = _4599 * _4579;
    float _4611 = _4609 * 0.5;
    float _4613 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4615 = fma(_4611, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4613);
    float _4617 = 1.0 / _4615;
    float _4619 = _4607;
    if (!_4563)
    {
        float _4621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4623 = _2589 + _4621;
        float _4625 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4627 = _2809 + _4625;
        float _4629 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4631 = -_2809;
        float _4633 = _4631 + _4539;
        float _4635 = _4623 * _4623;
        float _4637 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4639 = _2829 + _4637;
        float _4641 = -_2589;
        float _4643 = _4641 + _4541;
        float _4645 = -_2829;
        float _4647 = _4645 + _4543;
        float _4649 = fma(_4627, _4627, _4635);
        float _4651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4653 = fma(_4639, _4639, _4649);
        float _4655 = sqrt(_4653);
        float _4657 = _4629 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4659 = precise::min(_4655, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4661 = _4659 * _4651;
        float _4663 = _4657 * _4661;
        float _4665 = fma(_4633, _4663, _2809);
        float _4667 = fma(_4643, _4663, _2589);
        float _4669 = fma(_4647, _4663, _2829);
        _4601 = _4667;
        _4595 = _4665;
        _4619 = _4669;
        _4589 = _4647;
        _4591 = _4629;
    }
    float _4671 = _4601;
    float _4673 = _4595;
    float _4675 = _4619;
    float _4677 = _4589;
    float _4679 = _4591;
    float _4681 = _4679;
    float _4683 = _4677;
    if (_4573)
    {
        _4681 = 1.0;
    }
    float _4685 = _4681;
    float _4687 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4689 = _4617 * _4687;
    float _4691 = _4685;
    if (!_4573)
    {
        float _4693 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4695 = _4693 * 0.15915493667125701904296875;
        float _4697 = _4695 * 6.283185482025146484375;
        float _4699 = cos(_4697);
        float _4701 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4703 = _4701 * 0.15915493667125701904296875;
        float _4705 = _4695 * 6.283185482025146484375;
        float _4707 = sin(_4705);
        float _4709 = 1.0 / _4699;
        float _4711 = _4703 * 6.283185482025146484375;
        float _4713 = cos(_4711);
        float _4715 = _4707 * _4709;
        float _4717 = _4703 * 6.283185482025146484375;
        float _4719 = sin(_4717);
        float _4721 = _4713 * _4715;
        float _4723 = 1.0 / _4721;
        float _4725 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4727 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4725;
        float _4729 = 1.0 / _4727;
        float _4731 = _4719 * _4723;
        float _4733 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4735 = fma(_4689, _4731, _4733);
        float _4737 = _4735 * _4729;
        float _4739 = precise::clamp(_4737, 0.0, 1.0);
        _4605 = _4739;
    }
    float _4741 = _4605;
    if (!_4573)
    {
        float _4743 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4745 = _4743 * 0.15915493667125701904296875;
        float _4747 = _4745 * 6.283185482025146484375;
        float _4749 = cos(_4747);
        float _4751 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4753 = _4751 * 0.15915493667125701904296875;
        float _4755 = _4745 * 6.283185482025146484375;
        float _4757 = sin(_4755);
        float _4759 = 1.0 / _4749;
        float _4761 = _4753 * 6.283185482025146484375;
        float _4763 = cos(_4761);
        float _4765 = _4757 * _4759;
        float _4767 = _4753 * 6.283185482025146484375;
        float _4769 = sin(_4767);
        float _4771 = _4763 * _4765;
        float _4773 = 1.0 / _4771;
        float _4775 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4777 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _4775;
        float _4779 = 1.0 / _4777;
        float _4781 = _4769 * _4773;
        float _4783 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4785 = fma(_4689, _4781, _4783);
        float _4787 = _4785 * _4779;
        float _4789 = precise::clamp(_4787, 0.0, 1.0);
        float _4791 = -_4789;
        float _4793 = _4791 + 1.0;
        _232 = _4771;
        _4691 = _4793;
    }
    float _4795 = _232;
    float _4797 = _4691;
    float _4799 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4801 = _4671 + _4799;
    float _4803 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4805 = _4673 + _4803;
    float _4807 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4809 = _4675 + _4807;
    float _4811 = _4801 * _4801;
    float _4813 = fma(_4805, _4805, _4811);
    float _4815 = fma(_4809, _4809, _4813);
    float _4817 = rsqrt(_4815);
    float _4819 = sqrt(_4815);
    float _4821 = _4817 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4823 = _4805 * _4821;
    float _4825 = _4809 * _4821;
    float _4827 = _4823 * _4823;
    float _4829 = _4825 * _4825;
    float _4831 = _4827 + _4829;
    float _4833 = sqrt(_4831);
    bool _4835 = _4833 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4837 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4839 = _4833 + _4837;
    float _4841 = _4817;
    float _4843 = _4831;
    float _4845 = _4839;
    float _4847 = _4795;
    float _4849 = _4801;
    if (_4835)
    {
        float _4851 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4841 = _4851;
    }
    float _4853 = _4841;
    if (_4835)
    {
        float _4855 = rsqrt(_4831);
        _4843 = _4855;
    }
    float _4857 = _4843;
    float _4859 = _4857;
    if (_4835)
    {
        float _4861 = _4839 * _4853;
        _4845 = _4861;
    }
    float _4863 = _4845;
    if (_4835)
    {
        float _4865 = _4863 * 0.15915493667125701904296875;
        _4847 = _4865;
    }
    float _4867 = _4847;
    float _4869 = _4809;
    float _4871 = _4867;
    if (_4835)
    {
        float _4873 = _4867 * 6.283185482025146484375;
        float _4875 = sin(_4873);
        _4869 = _4875;
    }
    float _4877 = _4869;
    float _4879 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4881 = precise::max(0.0, _4879);
    float _4883 = _4853;
    float _4885 = _4881;
    if (_4835)
    {
        float _4887 = _4867 * 6.283185482025146484375;
        float _4889 = cos(_4887);
        _4883 = _4889;
    }
    float _4891 = _4883;
    float _4893 = -_4821;
    float _4895 = -_4881;
    float _4897 = fma(_4801, _4893, _4895);
    if (_4835)
    {
        float _4899 = _4897 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4849 = _4899;
    }
    float _4901 = _4849;
    float _4903 = _4901;
    float _4905 = _4877;
    if (_4835)
    {
        float _4907 = fma(_4877, _4901, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4903 = _4907;
    }
    float _4909 = _4903;
    float _4911 = _4909;
    if (!_4835)
    {
        _4905 = _4823;
    }
    float _4913 = _4905;
    float _4915 = _4913;
    float _4917 = _4891;
    if (_4835)
    {
        float _4919 = _4891 + (-1.0);
        _4885 = _4919;
    }
    float _4921 = _4885;
    float _4923 = _4921;
    if (_4835)
    {
        float _4925 = _4857 * _4909;
        _4683 = _4925;
    }
    float _4927 = _4683;
    if (!_4835)
    {
        _4911 = _4897;
    }
    float _4929 = _4911;
    float _4931 = _4929;
    if (_4835)
    {
        float _4933 = _4921 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4871 = _4933;
    }
    float _4935 = _4871;
    if (_4835)
    {
        float _4937 = _4823 * _4927;
        _4915 = _4937;
    }
    float _4939 = _4915;
    if (!_4835)
    {
        _4923 = _4825;
    }
    float _4941 = _4923;
    float _4943 = _4941;
    if (_4835)
    {
        float _4945 = _4825 * _4927;
        _4943 = _4945;
    }
    float _4947 = _4943;
    if (!_4835)
    {
        _4859 = _4827;
    }
    float _4949 = _4859;
    float _4951 = _4949;
    if (_4835)
    {
        float _4953 = fma(_4897, _4891, _4935);
        _4931 = _4953;
    }
    float _4955 = _4931;
    if (_4835)
    {
        float _4957 = _4939 * _4939;
        _4951 = _4957;
    }
    float _4959 = _4951;
    if (!_4835)
    {
        _4917 = _4829;
    }
    float _4961 = _4917;
    float _4963 = _4961;
    if (_4835)
    {
        float _4965 = _4947 * _4947;
        _4963 = _4965;
    }
    float _4967 = _4963;
    float _4969 = fma(_4955, _4955, _4959);
    float _4971 = _4671 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4973 = _4969 + _4967;
    float _4975 = _4671 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4977 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4979 = fma(_4819, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4977);
    float _4981 = precise::clamp(_4979, 0.0, 1.0);
    float _4983 = fma(_4673, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4971);
    float _4985 = fma(_4673, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4975);
    float _4987 = rsqrt(_4973);
    float _4989 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4991 = -_4981;
    float _4993 = _4991 + 1.0;
    float _4995 = fma(_4675, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4985);
    float _4997 = _4671 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4999 = fma(_4675, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4983);
    float _5001 = _4671 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _5003 = _4995 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _5005 = fma(_4673, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4997);
    float _5007 = abs(_4993);
    float _5009 = log2(_5007);
    float _5011 = _4999 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _5013 = _5003 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _5015 = fma(_4675, (*spvDescriptorSet0.vp_c8)._m0[0].z, _5005);
    float _5017 = fma(_4673, (*spvDescriptorSet0.vp_c8)._m0[3].x, _5001);
    float _5019 = -_5013;
    float _5021 = fma(_5019, _4989, 1.0);
    float _5023 = _4987 * _4939;
    float _5025 = _5015 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _5027 = _5011 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _5029 = _4987 * _4955;
    float _5031 = _5023 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5033 = fma(_4675, (*spvDescriptorSet0.vp_c8)._m0[3].z, _5017);
    float _5035 = fma(_5025, (*spvDescriptorSet0.vp_c8)._m0[7].x, _5027);
    float _5037 = _4987 * _4947;
    float _5039 = -_5031;
    float _5041 = fma(_5029, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5039);
    float _5043 = _5033 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _5045 = fma(_5003, (*spvDescriptorSet0.vp_c8)._m0[7].z, _5035);
    float _5047 = _5009 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5049 = -_5037;
    float _5051 = fma(_5049, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5041);
    float _5053 = _5011 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _5055 = fma(_5043, (*spvDescriptorSet0.vp_c8)._m0[7].w, _5045);
    float _5057 = log2(_5021);
    float _5059 = fma(_5051, -0.5, 0.5);
    float _5061 = _5011 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _5063 = fma(_5025, (*spvDescriptorSet0.vp_c8)._m0[4].x, _5053);
    float _5065 = fma(_5051, 0.5, 0.5);
    float _5067 = _5029 + 1.0;
    float _5069 = fma(_5025, (*spvDescriptorSet0.vp_c8)._m0[5].x, _5061);
    float _5071 = fma(_5003, (*spvDescriptorSet0.vp_c8)._m0[4].z, _5063);
    float _5073 = exp2(_5047);
    float _5075 = fma(_5065, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5077 = fma(_5003, (*spvDescriptorSet0.vp_c8)._m0[5].z, _5069);
    float _5079 = fma(_5043, (*spvDescriptorSet0.vp_c8)._m0[4].w, _5071);
    float _5081 = fma(_5065, _5075, -0.212114393711090087890625);
    float _5083 = fma(_5043, (*spvDescriptorSet0.vp_c8)._m0[5].w, _5077);
    float _5085 = 1.0 / _5055;
    float _5087 = fma(_5065, _5081, 1.570728778839111328125);
    float _5089 = _5057 * 0.693147182464599609375;
    float _5091 = _5089 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _5093 = sqrt(_5059);
    float _5095 = -_5029;
    float _5097 = fma(_5073, _5067, _5095);
    float _5099 = fma(_5097, 0.5, 0.5);
    float _5101 = _5079 * _5085;
    float _5103 = _5083 * _5085;
    float _5105 = fma(_5101, 0.5, 0.5);
    float _5107 = fma(_5103, -0.5, 0.5);
    float _5109 = _5093 * 0.636619746685028076171875;
    float3 _12760 = float3(_5105, _5107, _5091);
    float _5111 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12760, float3(0.0), isnan(_12760)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12760, float3(0.0), isnan(_12760)), level(0.0)).x;
    float3 _12771 = float3(_5105, _5107, _5091);
    float4 _5114 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12771, float3(0.0), isnan(_12771)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12771, float3(0.0), isnan(_12771)), level(0.0)).xyzw;
    float _5116 = _5114.x;
    float _5118 = _5114.y;
    float _5120 = _5114.z;
    float _5122 = _5114.w;
    float _5124 = -_5087;
    float _5126 = fma(_5109, _5124, 1.0);
    float2 _12793 = float2(_5126, _5099);
    float3 _5130 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12793, float2(0.0), isnan(_12793)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12793, float2(0.0), isnan(_12793)), level(0.0)).xyz;
    float _5132 = _5130.x;
    float _5134 = _5130.y;
    float _5136 = _5130.z;
    float _5138 = _5009 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5140 = _5011 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5142 = _4741 * _4797;
    bool _5144 = _4741 > 0.0;
    bool _5146 = isnan(_4741);
    bool _5148 = _5144 || _5146;
    bool _5150 = isnan(0.0);
    bool _5152 = _5148 || _5150;
    float _5154 = fma(_5025, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5140);
    float _5156 = exp2(_5138);
    float _5158 = _5142 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _5160 = _4797 <= 0.0;
    bool _5162 = !_5152;
    bool _5164 = _5160 || _5162;
    float _5166 = fma(_5003, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5154);
    float _5168 = _5158 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5170 = fma(_5043, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5166);
    out.m_47.x = _5168;
    float _5172 = _5170 + _5055;
    out.gl_Position.x = _5079;
    out.gl_Position.y = _5083;
    out.gl_Position.z = _5170;
    out.gl_Position.w = _5055;
    float _5174 = _5172 * 0.5;
    float _5176 = -_5156;
    float _5178 = _5176 + 1.0;
    float _5180 = _5178 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_85.z = _5174;
    out.m_85.w = _5055;
    float _5182 = _5180 * _5111;
    float _5184 = -_5180;
    float _5186 = _5184 + 1.0;
    float _5188 = _5122 * _5182;
    float _5190 = _5122 * _5186;
    float _5192 = _5136 * _5182;
    float _5194 = fma(_5132, _5188, _5116);
    float _5196 = fma(_5134, _5188, _5118);
    float _5198 = fma(_5122, _5192, _5120);
    out.m_87.x = _5194;
    out.m_87.y = _5196;
    out.m_87.z = _5198;
    out.m_87.w = _5190;
    if (!_5164)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _5200 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5200;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4215 = false;
    bool _1490 = false;
    bool _1310 = false;
    bool _1198 = false;
    bool _1058 = false;
    bool _934 = false;
    bool _660 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5257 = as_type<float>(_122);
        out.gl_Position.z = _5257;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_49.w;
    float _128 = in.m_51.x;
    bool _130 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_126);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_126;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _128;
    float _144 = 0.0;
    if (_138)
    {
        float _146 = float(_106);
        _144 = _146;
    }
    float _148 = _144;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_47.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5329 = as_type<float>(_160);
        out.gl_Position.z = _5329;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = in.m_57.x;
    float _170 = in.m_57.y;
    float _172 = in.m_57.z;
    bool _174 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _176 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _178 = _174 || _176;
    bool _180 = isnan(1.0);
    bool _182 = _178 || _180;
    float _184 = in.m_59.x;
    float _186 = in.m_59.y;
    float _188 = in.m_59.z;
    float _190 = in.m_61.w;
    float _192 = in.m_44.x;
    float _194 = in.m_44.y;
    float _196 = in.m_44.z;
    float _198 = _162 * _162;
    float _200 = _164 * _164;
    float _202 = fma(_168, _168, _198);
    float _204 = fma(_170, _170, _200);
    float _206 = fma(_184, _184, _202);
    float _208 = _166 * _166;
    float _210 = fma(_186, _186, _204);
    float _212 = sqrt(_206);
    float _214 = fma(_172, _172, _208);
    float _216 = fma(_188, _188, _214);
    float _218 = sqrt(_210);
    float _220 = sqrt(_216);
    bool _222 = _212 > 0.0;
    bool _224 = _218 > 0.0;
    float _226 = 0.0;
    float _228 = _170;
    float _230 = _168;
    float _232 = _172;
    if (_222)
    {
        float _234 = rsqrt(_206);
        _226 = _234;
    }
    float _236 = _226;
    float _238 = 0.0;
    float _240 = 0.0;
    if (!_222)
    {
        _238 = 0.0;
        _240 = 0.0;
    }
    float _242 = _238;
    float _244 = _240;
    bool _246 = _220 > 0.0;
    float _248 = in.m_49.x;
    float _250 = in.m_49.y;
    float _252 = in.m_49.z;
    float _254 = 0.0;
    float _256 = _242;
    float _258 = _244;
    if (!_222)
    {
        _254 = 0.0;
    }
    float _260 = _254;
    float _262 = 0.0;
    float _264 = 0.0;
    float _266 = _260;
    if (!_224)
    {
        _262 = 0.0;
        _264 = 0.0;
    }
    float _268 = _262;
    float _270 = _264;
    float _272 = 0.0;
    float _274 = _270;
    float _276 = _268;
    if (_224)
    {
        float _278 = rsqrt(_210);
        _272 = _278;
    }
    float _280 = _272;
    int _282 = int(_222);
    int _284 = _224 ? 2 : 0;
    int _286 = _282 | _284;
    int _288 = _246 ? 4 : 0;
    int _290 = _286 | _288;
    int _292 = _182 ? 8 : 0;
    int _294 = _290 | _292;
    int _296 = false ? 16 : 0;
    int _298 = _294 | _296;
    int _300 = false ? 32 : 0;
    int _302 = _298 | _300;
    int _304 = false ? 64 : 0;
    int _306 = _302 | _304;
    int _308 = _306 & 8;
    float _310 = 0.0;
    float _312 = as_type<float>(_308);
    if (!_224)
    {
        _310 = 0.0;
    }
    float _314 = _310;
    float _316 = 0.0;
    float _318 = 0.0;
    float _320 = _314;
    if (!_246)
    {
        _316 = 0.0;
        _318 = 0.0;
    }
    float _322 = _316;
    float _324 = _318;
    float _326 = _216;
    float _328 = _322;
    float _330 = _324;
    if (_246)
    {
        float _332 = rsqrt(_216);
        _326 = _332;
    }
    float _334 = _326;
    float _336 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _338 = 0.0;
    float _340 = _336;
    if (!_246)
    {
        _338 = 0.0;
    }
    float _342 = _338;
    float _344 = _342;
    if (_222)
    {
        float _346 = _236 * _168;
        _266 = _346;
    }
    float _348 = _266;
    if (_222)
    {
        float _350 = _236 * _162;
        _256 = _350;
    }
    float _352 = _256;
    if (!_182)
    {
        float _354 = _336 * _336;
        float _356 = _354 * 0.5;
        _312 = _356;
    }
    float _358 = _312;
    float _360 = _358;
    if (_222)
    {
        float _362 = _236 * _184;
        _258 = _362;
    }
    float _364 = _258;
    if (_224)
    {
        float _366 = _280 * _170;
        _274 = _366;
    }
    float _368 = _274;
    if (_224)
    {
        float _370 = _280 * _164;
        _276 = _370;
    }
    float _372 = _276;
    if (_224)
    {
        float _374 = _280 * _186;
        _320 = _374;
    }
    float _376 = _320;
    if (!_182)
    {
        float _378 = _358 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _360 = _378;
    }
    float _380 = _360;
    float _382 = _380;
    if (_246)
    {
        float _384 = _334 * _172;
        _344 = _384;
    }
    float _386 = _344;
    if (_246)
    {
        float _388 = _334 * _166;
        _328 = _388;
    }
    float _390 = _328;
    if (_246)
    {
        float _392 = _334 * _188;
        _330 = _392;
    }
    float _394 = _330;
    bool _396 = !_182;
    if (!_396)
    {
        float _398 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _400 = log2(_398);
        float _402 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _404 = _402 + 1.0;
        float _406 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _408 = _336 * _400;
        float _410 = 1.0 / _404;
        float _412 = _406 * 0.693147182464599609375;
        float _414 = exp2(_408);
        float _416 = 1.0 / _412;
        float _418 = _414 + (-1.0);
        float _420 = -_418;
        float _422 = fma(_420, _416, _336);
        float _424 = _422 * _410;
        float _426 = _424 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _382 = _426;
    }
    float _428 = _382;
    float _430 = _428 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _432 = !_182;
    float _434 = _428;
    if (!_432)
    {
        float _436 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _438 = log2(_436);
        float _440 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _442 = _440 + 1.0;
        float _444 = 1.0 / _442;
        float _446 = _336 * _438;
        float _448 = exp2(_446);
        float _450 = -_448;
        float _452 = _450 + 1.0;
        float _454 = _452 * _444;
        _340 = _454;
    }
    float _456 = _340;
    float _458 = _428 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _460 = _430 * _352;
    float _462 = _430 * _372;
    float _464 = _430 * _390;
    float _466 = 0.0;
    if (!_182)
    {
        float _468 = _142 * _142;
        float _470 = _468 * 0.5;
        _466 = _470;
    }
    float _472 = _466;
    float _474 = fma(_458, _348, _460);
    float _476 = fma(_458, _368, _462);
    float _478 = fma(_458, _386, _464);
    float _480 = _428 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_182)
    {
        float _482 = _472 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _434 = _482;
    }
    float _484 = _434;
    bool _486 = !_182;
    float _488 = _484;
    if (!_486)
    {
        float _490 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _492 = log2(_490);
        float _494 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _496 = _494 + 1.0;
        float _498 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _500 = _142 * _492;
        float _502 = 1.0 / _496;
        float _504 = _498 * 0.693147182464599609375;
        float _506 = exp2(_500);
        float _508 = 1.0 / _504;
        float _510 = _506 + (-1.0);
        float _512 = -_510;
        float _514 = fma(_512, _508, _142);
        float _516 = _514 * _502;
        float _518 = _516 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _488 = _518;
    }
    float _520 = _488;
    float _522 = _520 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _524 = fma(_480, _364, _474);
    float _526 = fma(_480, _376, _476);
    float _528 = _520 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _530 = _522 * _352;
    float _532 = _522 * _372;
    float _534 = _522 * _390;
    float _536 = fma(_480, _394, _478);
    float _538 = fma(_528, _348, _530);
    float _540 = fma(_528, _368, _532);
    float _542 = fma(_528, _386, _534);
    float _544 = _520 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _546 = fma(_456, _248, _524);
    float _548 = fma(_456, _250, _526);
    float _550 = fma(_456, _252, _536);
    float _552 = fma(_544, _364, _538);
    float _554 = fma(_544, _376, _540);
    float _556 = fma(_544, _394, _542);
    float _558 = _544;
    if (!_182)
    {
        _558 = _142;
    }
    float _560 = _558;
    bool _562 = !_182;
    float _564 = _560;
    if (!_562)
    {
        float _566 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _568 = log2(_566);
        float _570 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _572 = _570 + 1.0;
        float _574 = 1.0 / _572;
        float _576 = _142 * _568;
        float _578 = exp2(_576);
        float _580 = -_578;
        float _582 = _580 + 1.0;
        float _584 = _582 * _574;
        _564 = _584;
    }
    float _586 = _564;
    float _588 = fma(_586, _250, _554);
    bool _590 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _592 = fma(_548, _190, _194);
    float _594 = fma(_586, _248, _552);
    float _596 = -_588;
    float _598 = _548 + _596;
    float _600 = fma(_586, _252, _556);
    float _602 = fma(_546, _190, _192);
    float _604 = -_594;
    float _606 = _546 + _604;
    float _608 = _598 * _170;
    float _610 = _598 * _164;
    float _612 = _598 * _186;
    float _614 = -_600;
    float _616 = _550 + _614;
    float _618 = fma(_606, _168, _608);
    float _620 = fma(_606, _162, _610);
    float _622 = fma(_606, _184, _612);
    float _624 = fma(_550, _190, _196);
    float _626 = fma(_616, _172, _618);
    float _628 = fma(_616, _166, _620);
    float _630 = fma(_616, _188, _622);
    bool _632 = !_590;
    float _634 = _630;
    float _636 = _628;
    float _638 = _626;
    float _640 = _630;
    float _642 = _628;
    float _658;
    if (!_632)
    {
        float _644 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _646 = _128 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _648 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _650 = _648 * _644;
        float _652 = floor(_650);
        float _654 = -_652;
        float _656 = _650 + _654;
        _658 = _656;
        _660 = true;
    }
    else
    {
        float _662 = float(_106);
        float _664 = 1.0 / _662;
        float _666 = _142 * _664;
        _658 = _666;
    }
    _660 = false;
    float _668 = _658;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _672 = _668 + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _676 = _668 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _680 = _668 + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _698 = 1.0 / _684;
    float _700 = 1.0 / _692;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _704 = _668 + _702;
    bool _706 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _708 = 1.0 / _688;
    float _710 = _672 * _698;
    bool _712 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _714 = isnan(_668);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _724;
    float _728 = fma(_726, _710, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _730 = 1.0 / _696;
    float _732 = _676 * _700;
    bool _734 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _736 = isnan(_668);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -_722;
    float _748 = _746 + 1.0;
    float _750 = _744 * _748;
    float _752 = _680 * _708;
    bool _754 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _756 = isnan(_668);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _766;
    float _770 = -_744;
    float _772 = _770 + 1.0;
    bool _774 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _776 = isnan(_668);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = fma(_768, _710, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _788 = _668 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _790 = isnan(_668);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = _704 * _730;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _802;
    float _806 = -_764;
    float _808 = _806 + 1.0;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _814 = fma(_804, _710, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _816 = _764 * _772;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _822 = _784 * _808;
    float _824 = -_784;
    float _826 = _824 + 1.0;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _832 = fma(_812, _752, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _834 = fma(_820, _752, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _836 = _798 * _826;
    float _838 = fma(_830, _752, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _840 = -_798;
    float _842 = _840 + 1.0;
    float _844 = _814 * _836;
    float _846 = _728 * _836;
    float _848 = _786 * _836;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _850;
    float _854 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[143].x, _844);
    float _856 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[143].y, _846);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _858;
    float _862 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[143].z, _848);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _864;
    float _868 = fma(_832, _822, _854);
    float _870 = fma(_834, _822, _856);
    float _872 = fma(_852, _732, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _874 = fma(_860, _732, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _876 = fma(_838, _822, _862);
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _886 = fma(_866, _732, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _892 = fma(_872, _816, _868);
    float _894 = fma(_880, _800, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _896 = fma(_884, _800, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _898 = fma(_874, _816, _870);
    float _900 = fma(_890, _800, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _902 = fma(_886, _816, _876);
    float _904 = fma(_894, _750, _892);
    float _906 = fma(_896, _750, _898);
    float _908 = fma(_900, _750, _902);
    float _910 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[147].x, _904);
    float _912 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[147].y, _906);
    float _914 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[147].z, _908);
    bool _916 = !_706;
    float _932;
    if (!_916)
    {
        float _918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _920 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _922 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[11].x, _142);
        float _924 = _922 * _918;
        float _926 = floor(_924);
        float _928 = -_926;
        float _930 = _924 + _928;
        _932 = _930;
        _934 = true;
    }
    else
    {
        float _936 = float(_106);
        float _938 = 1.0 / _936;
        float _940 = _142 * _938;
        _932 = _940;
    }
    _934 = false;
    float _942 = _932;
    float _944 = in.m_61.x;
    float _946 = in.m_61.y;
    float _948 = in.m_61.z;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _952 = _942 + _950;
    bool _954 = _942 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _956 = isnan(_942);
    bool _958 = _954 || _956;
    bool _960 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _962 = _958 || _960;
    float _964 = float(_962);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _966;
    bool _970 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _972 = 1.0 / _968;
    float _974 = _914 * _948;
    float _976 = _912 * _946;
    float _978 = -_964;
    float _980 = _978 + 1.0;
    float _982 = _952 * _972;
    bool _984 = _942 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _986 = isnan(_942);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1004;
    float _1008 = _910 * _944;
    float _1010 = _994 * _980;
    float _1012 = fma(_998, _982, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1014 = fma(_1006, _982, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1016 = fma(_1002, _982, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1018 = -_994;
    float _1020 = _1018 + 1.0;
    float _1022 = _1012 * _1010;
    float _1024 = _1014 * _1010;
    float _1026 = _1016 * _1010;
    float _1028 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1022);
    float _1030 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1024);
    float _1032 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1026);
    float _1034 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1028);
    float _1036 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1030);
    float _1038 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1032);
    bool _1040 = !_970;
    float _1056;
    if (!_1040)
    {
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1044 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _1048 = _1046 * _1042;
        float _1050 = floor(_1048);
        float _1052 = -_1050;
        float _1054 = _1048 + _1052;
        _1056 = _1054;
        _1058 = true;
    }
    else
    {
        float _1060 = float(_106);
        float _1062 = 1.0 / _1060;
        float _1064 = _142 * _1062;
        _1056 = _1064;
    }
    _1058 = false;
    float _1066 = _1056;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1070 = _1066 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1076 = _1066 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1078 = isnan(_1066);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1084 = _1080 || _1082;
    float _1086 = float(_1084);
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1092 = _1066 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1094 = isnan(_1066);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1100 = _1096 || _1098;
    float _1102 = float(_1100);
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1104;
    bool _1108 = _1066 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1110 = isnan(_1066);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = 1.0 / _1074;
    float _1122 = -_1086;
    float _1124 = _1122 + 1.0;
    bool _1126 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1128 = _1102 * _1124;
    float _1130 = -_1102;
    float _1132 = _1130 + 1.0;
    float _1134 = 1.0 / _1090;
    float _1136 = _1106 * _1120;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1140 = _1138 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1142 = fma(_1136, _1070, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1144 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1146 = _1140 * _1134;
    float _1148 = _1142 * _1128;
    float _1150 = -_1118;
    float _1152 = _1150 + 1.0;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1156 = _1066 + _1154;
    float _1158 = _1144 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1160 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1148);
    float _1162 = _1086 * _1152;
    float _1164 = fma(_1146, _1156, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1166 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1168 = _1038 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1170 = fma(_1164, _1162, _1160);
    float _1172 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1174 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1176 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1170);
    float _1178 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1180 = !_1126;
    float _1196;
    if (!_1180)
    {
        float _1182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1184 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1186 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[11].z, _142);
        float _1188 = _1186 * _1182;
        float _1190 = floor(_1188);
        float _1192 = -_1190;
        float _1194 = _1188 + _1192;
        _1196 = _1194;
        _1198 = true;
    }
    else
    {
        float _1200 = float(_106);
        float _1202 = 1.0 / _1200;
        float _1204 = _142 * _1202;
        _1196 = _1204;
    }
    _1198 = false;
    float _1206 = _1196;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1210 = _1206 + _1208;
    bool _1212 = _1206 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1214 = isnan(_1206);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1220 = _1216 || _1218;
    float _1222 = float(_1220);
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1224;
    bool _1228 = _1206 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1230 = isnan(_1206);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = -_1222;
    float _1242 = _1240 + 1.0;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1244;
    float _1248 = 1.0 / _1226;
    bool _1250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1252 = _1238 * _1242;
    float _1254 = -_1238;
    float _1256 = _1254 + 1.0;
    float _1258 = _1210 * _1248;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1260;
    float _1264 = fma(_1246, _1258, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1266;
    float _1270 = fma(_1262, _1258, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1272 = _1264 * _1252;
    float _1274 = fma(_1268, _1258, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1276 = _1270 * _1252;
    float _1278 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1272);
    float _1280 = _1274 * _1252;
    float _1282 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1276);
    float _1284 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1278);
    float _1286 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1280);
    float _1288 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1282);
    float _1290 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1286);
    bool _1292 = !_1250;
    float _1308;
    if (!_1292)
    {
        float _1294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1296 = _128 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1298 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _1300 = _1298 * _1294;
        float _1302 = floor(_1300);
        float _1304 = -_1302;
        float _1306 = _1300 + _1304;
        _1308 = _1306;
        _1310 = true;
    }
    else
    {
        float _1312 = float(_106);
        float _1314 = 1.0 / _1312;
        float _1316 = _142 * _1314;
        _1308 = _1316;
    }
    _1310 = false;
    float _1318 = _1308;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1322 = _1318 + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1328 = _1318 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1330 = isnan(_1318);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1342 = _1340 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1346 = _1344 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1348 = _1318 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1350 = isnan(_1318);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1356 = _1352 || _1354;
    float _1358 = float(_1356);
    float _1360 = 1.0 / _1326;
    float _1362 = -_1338;
    float _1364 = _1362 + 1.0;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1366;
    bool _1370 = _1318 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1372 = isnan(_1318);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1378 = _1374 || _1376;
    float _1380 = float(_1378);
    float _1382 = _1358 * _1364;
    float _1384 = -_1358;
    float _1386 = _1384 + 1.0;
    bool _1388 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1390 = 1.0 / _1342;
    float _1392 = _1380 * _1386;
    float _1394 = -_1380;
    float _1396 = _1394 + 1.0;
    float _1398 = 1.0 / _1346;
    float _1400 = _1368 * _1360;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1406 = fma(_1400, _1322, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1408 = _1318 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1410 = isnan(_1318);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = _1404 * _1390;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1422;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1428 = _1318 + _1426;
    float _1430 = _1406 * _1392;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1434 = _1318 + _1432;
    float _1436 = _1284 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1438 = fma(_1420, _1428, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1440 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1430);
    float _1442 = _1424 * _1398;
    float _1444 = -_1418;
    float _1446 = _1444 + 1.0;
    float _1448 = fma(_1438, _1382, _1440);
    float _1450 = fma(_1442, _1434, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1452 = _1338 * _1446;
    float _1454 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1456 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1458 = fma(_1450, _1452, _1448);
    float _1460 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1462 = _1454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1464 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1466 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1458);
    float _1468 = _1466 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1470 = !_1388;
    float _1472 = _1452;
    float _1488;
    if (!_1470)
    {
        float _1474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1476 = _128 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[14].x, _142);
        float _1480 = _1478 * _1474;
        float _1482 = floor(_1480);
        float _1484 = -_1482;
        float _1486 = _1480 + _1484;
        _1488 = _1486;
        _1490 = true;
    }
    else
    {
        float _1492 = float(_106);
        float _1494 = 1.0 / _1492;
        float _1496 = _142 * _1494;
        _1488 = _1496;
    }
    _1490 = false;
    float _1498 = _1488;
    float _1500 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1502 = int(_1500);
    float _1504 = in.m_51.y;
    float _1506 = float(_106);
    float _1508 = _976 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1510 = in.m_51.z;
    float _1512 = _974 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1514 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1516 = int(_1514);
    out.m_63.x = _1158;
    out.m_63.y = _1172;
    out.m_63.z = _1174;
    out.m_63.w = _1178;
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1520 = _1498 + _1518;
    float _1522 = in.m_59.w;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1526 = _1524 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1528 = float(_1502);
    float _1530 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1532 = int(_1530);
    float _1534 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1538 = _1536 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1540 = in.m_55.w;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1544 = _1498 + _1542;
    float _1546 = _592 * _164;
    float _1548 = 1.0 / _1528;
    float _1550 = float(uint(_1516));
    float _1552 = _592 * _186;
    bool _1554 = _1516 == 0;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1558 = _1556 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1560 = fma(_602, _162, _1546);
    float _1562 = _128 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1564 = 1.0 / _1550;
    float _1566 = float(_1532);
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1570 = _1498 + _1568;
    bool _1572 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1574 = isnan(_1498);
    bool _1576 = _1572 || _1574;
    bool _1578 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1580 = _1576 || _1578;
    float _1582 = float(_1580);
    float _1584 = _142 * _1548;
    float _1586 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1588 = int(_1586);
    int _1590 = as_type<int>(_1564) + (-2);
    float _1592 = trunc(_1584);
    int _1594 = int(_1592);
    float _1596 = 1.0 / _1566;
    float _1598 = float(uint(_1588));
    int _1600 = ~_1588;
    int _1602 = _1600 + 1;
    float _1604 = float(_1588);
    int _1606 = ~_1588;
    int _1608 = _1606 + 1;
    float _1610 = 1.0 / _1598;
    float _1612 = float(uint(_1594));
    float _1614 = as_type<float>(_1590) * _1612;
    float _1616 = _142 * _1596;
    int _1618 = ~_1516;
    int _1620 = _1618 + 1;
    float _1622 = trunc(_1614);
    float _1624 = precise::max(_1622, 0.0);
    uint _1627 = uint(_1624);
    int _1629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1631 = _1629 != 0;
    int _1633 = as_type<int>(_1610) + (-2);
    float _1635 = trunc(_1616);
    int _1637 = int(_1635);
    int _1639 = _1590;
    if (_1631)
    {
        _1472 = 1.0;
    }
    float _1641 = _1472;
    int _1643 = _1620 * int(_1627);
    int _1645 = _1643 + _1594;
    float _1647 = _1641;
    float _1649 = as_type<float>(_1645);
    if (!_1631)
    {
        _1647 = 7.345489978790283203125;
    }
    float _1651 = _1647;
    float _1653 = 1.0 / _1506;
    float _1655 = float(uint(_1645));
    float _1657 = _1651 * _128;
    float _1659 = _1655;
    if (_1631)
    {
        _1649 = 1.0;
    }
    float _1661 = _1649;
    float _1663 = float(uint(_1637));
    float _1665 = 1.0 / _1558;
    float _1667 = _1661;
    if (!_1631)
    {
        _1667 = 1.2345600128173828125;
    }
    float _1669 = _1667;
    float _1671 = as_type<float>(_1633) * _1663;
    float _1673 = as_type<float>(_1590) * _1655;
    if (_1631)
    {
        _1659 = _128;
    }
    float _1675 = _1659;
    float _1677 = trunc(_1671);
    float _1679 = precise::max(_1677, 0.0);
    uint _1681 = uint(_1679);
    float _1683 = _1675;
    if (!_1631)
    {
        _1683 = _1504;
    }
    float _1685 = _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1689 = _1687 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1691 = _1685 * _1669;
    int _1693 = ~_1516;
    int _1695 = _1693 + 1;
    float _1697 = trunc(_1673);
    float _1699 = precise::max(_1697, 0.0);
    uint _1701 = uint(_1699);
    float _1703 = float(_1594);
    float _1705 = floor(_1657);
    int _1707 = _1602 * int(_1681);
    int _1709 = _1707 + _1637;
    float _1711 = float(uint(_1709));
    int _1713 = int(_1627) + int(_1701);
    float _1715 = floor(_1691);
    float _1717 = as_type<float>(_1633) * _1711;
    float _1719 = float(_1516);
    float _1721 = _142 * _1604;
    int _1723 = _1695 * _1713;
    int _1725 = _1723 + _1594;
    bool _1727 = _1703 >= _1719;
    bool _1729 = isnan(_1703);
    bool _1731 = _1727 || _1729;
    bool _1733 = isnan(_1719);
    bool _1735 = _1731 || _1733;
    float _1737 = float(_1735);
    float _1739 = trunc(_1717);
    float _1741 = precise::max(_1739, 0.0);
    uint _1743 = uint(_1741);
    float _1745 = -_1705;
    float _1747 = _1657 + _1745;
    float _1749 = _1721 * _1653;
    bool _1751 = uint(_1725) >= uint(_1516);
    float _1753 = _142 * _1719;
    float _1755 = _1747 * _1719;
    int _1757 = _1516 + (-1);
    float _1759 = trunc(_1737);
    int _1761 = int(_1759);
    bool _1763 = !_1751;
    int _1765 = _1763 ? 0 : (-1);
    float _1767 = -_1715;
    float _1769 = _1691 + _1767;
    int _1771 = ~_1588;
    int _1773 = _1771 + 1;
    float _1775 = _1753 * _1653;
    int _1777 = ~_1713;
    int _1779 = _1777 + _1765;
    int _1781 = _1779 + 1;
    float _1783 = _1604 * _1769;
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1787 = _1785 != 0;
    int _1789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1791 = _1789 != 0;
    int _1793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1795 = _1793 != 0;
    float _1797 = trunc(_1755);
    int _1799 = int(_1797);
    int _1801 = int(_1681) + int(_1743);
    int _1803 = _1516 * _1781;
    int _1805 = _1803 + _1594;
    int _1807 = _1773 * _1801;
    int _1809 = _1807 + _1637;
    bool _1811 = !_1554;
    int _1813 = _1811 ? _1805 : (-1);
    float _1815 = trunc(_1775);
    int _1817 = int(_1815);
    int _1819 = ~_1761;
    int _1821 = _1819 + 1;
    int _1823 = _1821 + 1;
    int _1825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1827 = _1825 != 0;
    bool _1829 = uint(_1809) >= uint(_1588);
    int _1831 = _1813 * _1823;
    bool _1833 = !_1791;
    int _1835 = _1833 ? 0 : 1;
    float _1837 = trunc(_1783);
    int _1839 = int(_1837);
    bool _1841 = !_1827;
    int _1843 = _1841 ? 0 : 1;
    int _1845 = _1761 * _1757;
    int _1847 = _1845 + _1831;
    float _1849 = float(_1637);
    bool _1851 = !_1787;
    int _1853 = _1851 ? 0 : 1;
    bool _1855 = _1849 >= _1604;
    bool _1857 = isnan(_1849);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan(_1604);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    float _1867 = trunc(_1749);
    int _1869 = int(_1867);
    int _1871 = abs(_1835);
    int _1873 = abs(_1853);
    int _1875 = abs(_1843);
    float _1877 = trunc(_1865);
    int _1879 = int(_1877);
    int _1881 = _1799 * _1875;
    int _1883 = _1881 + _1594;
    bool _1885 = !_1829;
    int _1887 = _1885 ? 0 : (-1);
    int _1889 = _1847 * _1871;
    int _1891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1893 = _1891 != 0;
    int _1895 = ~_1801;
    int _1897 = _1895 + _1887;
    int _1899 = _1897 + 1;
    int _1901 = _1817 * _1873;
    int _1903 = _1901 + _1889;
    bool _1905 = !_1795;
    int _1907 = _1905 ? 0 : 1;
    float _1909 = 1.0 / _1526;
    int _1911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1913 = _1911 != 0;
    int _1915 = _1588 * _1899;
    int _1917 = _1915 + _1637;
    bool _1919 = !_1893;
    int _1921 = _1919 ? 0 : 1;
    bool _1923 = _1588 == 0;
    int _1925 = abs(_1907);
    float _1927 = 1.0 / _1689;
    bool _1929 = !_1913;
    int _1931 = _1929 ? 0 : 1;
    int _1933 = abs(_1921);
    int _1935 = ~_1879;
    int _1937 = _1935 + 1;
    int _1939 = _1937 + 1;
    bool _1941 = !_1923;
    int _1943 = _1941 ? _1917 : (-1);
    int _1945 = _1839 * _1933;
    int _1947 = _1945 + _1637;
    int _1949 = abs(_1931);
    int _1951 = _1883 * _1925;
    int _1953 = _1951 + _1903;
    int _1955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1957 = _1955 != 0;
    int _1959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1961 = _1959 != 0;
    int _1963 = _1939 * _1943;
    int _1965 = _1588 + (-1);
    int _1967 = _1799 * _1949;
    int _1969 = _1967 + _1953;
    int _1971 = ~_1516;
    int _1973 = _1971 + 1;
    float _1975 = 1.0 / _1538;
    bool _1977 = !_1961;
    int _1979 = _1977 ? 0 : 1;
    int _1981 = _1879 * _1965;
    int _1983 = _1981 + _1963;
    int _1985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1987 = _1985 != 0;
    int _1989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1991 = _1989 != 0;
    bool _1993 = !_1957;
    int _1995 = _1993 ? 0 : 1;
    int _1997 = abs(_1979);
    bool _1999 = !_1987;
    int _2001 = _1999 ? 0 : 1;
    float _2003 = float(uint(_1969));
    int _2005 = abs(_1995);
    float _2007 = as_type<float>(_1590) * _2003;
    bool _2009 = !_1991;
    int _2011 = _2009 ? 0 : 1;
    int _2013 = abs(_2001);
    int _2015 = _1983 * _1997;
    float _2017 = trunc(_2007);
    float _2019 = precise::max(_2017, 0.0);
    uint _2021 = uint(_2019);
    int _2023 = abs(_2011);
    int _2025 = _1869 * _2005;
    int _2027 = _2025 + _2015;
    int _2029 = ~_1516;
    int _2031 = _2029 + 1;
    float _2033 = in.m_65.x;
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2037 = _2035 != 0;
    int _2039 = _1947 * _2013;
    int _2041 = _2039 + _2027;
    int _2043 = ~_1588;
    int _2045 = _2043 + 1;
    int _2047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2049 = _2047 != 0;
    int _2051 = _1839 * _2023;
    int _2053 = _2051 + _2041;
    bool _2055 = _1516 == 0;
    float _2057 = float(uint(_2053));
    int _2059 = _2031 * int(_2021);
    int _2061 = _2059 + _1969;
    bool _2063 = _1961;
    float _2065 = _2007;
    if (_2037)
    {
        bool _2067 = _128 > 0.5;
        _2063 = _2067;
    }
    bool _2069 = _2063;
    float _2071 = as_type<float>(_1633) * _2057;
    float _2073 = float(uint(_2061));
    float _2075 = trunc(_2071);
    float _2077 = precise::max(_2075, 0.0);
    uint _2079 = uint(_2077);
    float _2081 = as_type<float>(_1590) * _2073;
    float _2083 = _2073;
    if (!_2037)
    {
        _2083 = _2033;
    }
    float _2085 = _2083;
    float _2087 = trunc(_2081);
    float _2089 = precise::max(_2087, 0.0);
    uint _2091 = uint(_2089);
    float _2093 = _2085;
    if (!_2037)
    {
        _2065 = _2085;
    }
    float _2095 = _2065;
    float _2097 = _2095;
    if (_2037)
    {
        _2093 = _2033;
    }
    float _2099 = _2093;
    int _2101 = ~_1516;
    int _2103 = _2101 + 1;
    int _2105 = _2045 * int(_2079);
    int _2107 = _2105 + _2053;
    float _2109 = float(uint(_2107));
    float _2111 = in.m_65.y;
    int _2113 = int(_2021) + int(_2091);
    int _2115 = int(_2091);
    float _2117 = _2099;
    if (_2037)
    {
        float _2119 = -_2099;
        float _2121 = _2119 + 1.0;
        _2115 = as_type<int>(_2121);
    }
    int _2123 = _2115;
    float _2125 = as_type<float>(_1633) * _2109;
    int _2127 = _2103 * _2113;
    int _2129 = _2127 + _1969;
    int _2131 = _2129;
    if (_2037)
    {
        float _2133 = _2069 ? as_type<float>(_2123) : _2099;
        _2097 = _2133;
    }
    float _2135 = _2097;
    float _2137 = in.m_51.w;
    float _2139 = trunc(_2125);
    float _2141 = precise::max(_2139, 0.0);
    uint _2143 = uint(_2141);
    int _2145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2147 = _2145 != 0;
    bool _2149 = uint(_2129) >= uint(_1516);
    bool _2151 = _2149;
    if (_2049)
    {
        float _2153 = -_2099;
        float _2155 = _2153 + 1.0;
        _2131 = as_type<int>(_2155);
    }
    int _2157 = _2131;
    bool _2159 = !_2149;
    int _2161 = _2159 ? 0 : (-1);
    if (_2049)
    {
        bool _2163 = _1510 > 0.5;
        _2151 = _2163;
    }
    bool _2165 = _2151;
    int _2167 = ~_2113;
    int _2169 = _2167 + _2161;
    int _2171 = _2169 + 1;
    int _2173 = ~_1588;
    int _2175 = _2173 + 1;
    if (_2049)
    {
        float _2177 = _2165 ? as_type<float>(_2157) : _2099;
        _2117 = _2177;
    }
    float _2179 = _2117;
    int _2181 = _1516 * _2171;
    int _2183 = _2181 + _1969;
    int _2185 = int(_2079) + int(_2143);
    float _2187 = -_2111;
    float _2189 = _2187 + 1.0;
    bool _2191 = _1504 > 0.5;
    int _2193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2195 = _2193 != 0;
    int _2197 = _2175 * _2185;
    int _2199 = _2197 + _2053;
    int _2201 = _2191 ? as_type<int>(_2189) : as_type<int>(_2111);
    bool _2203 = !_2055;
    int _2205 = _2203 ? _2183 : (-1);
    bool _2207 = uint(_2199) >= uint(_1588);
    float _2209 = _2147 ? as_type<float>(_2201) : _2111;
    bool _2211 = !_2207;
    int _2213 = _2211 ? 0 : (-1);
    bool _2215 = _2137 > 0.5;
    int _2217 = ~_2185;
    int _2219 = _2217 + _2213;
    int _2221 = _2219 + 1;
    float _2223 = float(uint(_1883));
    int _2225 = _2205 & 3;
    bool _2227 = _2225 != 0;
    int _2229 = _1588 * _2221;
    int _2231 = _2229 + _2053;
    float _2233 = _2111;
    if (_2195)
    {
        float _2235 = _2215 ? _2189 : _2111;
        _2233 = _2235;
    }
    float _2237 = _2233;
    float _2239 = as_type<float>(_1590) * _2223;
    bool _2241 = uint(_2225) > 1u;
    float _2243 = _128 * 2.0;
    float _2245 = float(uint(_1947));
    bool _2247 = !_1923;
    int _2249 = _2247 ? _2231 : (-1);
    float _2251 = floor(_2243);
    int _2253 = _2205 & 3;
    bool _2255 = _2253 != 0;
    float _2257 = as_type<float>(_1633) * _2245;
    int _2259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2261 = _2259 != 0;
    int _2263 = _2255 ? 0 : 1;
    int _2265 = _2249 & 3;
    bool _2267 = _2265 != 0;
    float _2269 = trunc(_2239);
    float _2271 = precise::max(_2269, 0.0);
    uint _2273 = uint(_2271);
    int _2275 = ~_2263;
    int _2277 = _2275 + 1;
    int _2279 = _2277 + 1;
    int _2281 = _2279;
    if (!_2241)
    {
        int _2283 = ~_2263;
        int _2285 = _2283 + 1;
        _2281 = _2285;
    }
    int _2287 = _2281;
    int _2289 = _2267 ? 0 : 1;
    bool _2291 = uint(_2225) >= 2u;
    float _2293 = trunc(_2257);
    float _2295 = precise::max(_2293, 0.0);
    uint _2297 = uint(_2295);
    bool _2299 = _2225 != 3;
    float _2301 = _1504 * 2.0;
    int _2303 = _2291 ? 0 : 1;
    bool _2305 = uint(_2265) > 1u;
    int _2307 = ~_2303;
    int _2309 = _2307 + 1;
    int _2311 = _2309 + 1;
    int _2313 = _1973 * int(_2273);
    int _2315 = _2313 + _1883;
    int _2317 = ~_2289;
    int _2319 = _2317 + 1;
    int _2321 = _2319 + 1;
    float _2323 = floor(_2301);
    int _2325 = abs(_2287);
    float _2327 = float(uint(_2315));
    int _2329 = _2311;
    int _2331 = _2321;
    if (_2299)
    {
        int _2333 = ~_2303;
        int _2335 = _2333 + 1;
        _2329 = _2335;
    }
    int _2337 = _2329;
    int _2339 = _1608 * int(_2297);
    int _2341 = _2339 + _1947;
    bool _2343 = _2251 >= 0.0;
    bool _2345 = isnan(_2251);
    bool _2347 = _2343 || _2345;
    bool _2349 = isnan(0.0);
    bool _2351 = _2347 || _2349;
    float _2353 = as_type<float>(_1590) * _2327;
    if (!_2305)
    {
        int _2355 = ~_2289;
        int _2357 = _2355 + 1;
        _2331 = _2357;
    }
    int _2359 = _2331;
    float _2361 = float(uint(_2341));
    float _2363 = trunc(_2353);
    float _2365 = precise::max(_2363, 0.0);
    uint _2367 = uint(_2365);
    bool _2369 = _2251 > 0.0;
    float _2371 = as_type<float>(_1633) * _2361;
    int _2373 = _2351 ? 0 : 1;
    bool _2375 = _2323 > 0.0;
    int _2377 = ~_1516;
    int _2379 = _2377 + 1;
    float _2381 = trunc(_2371);
    float _2383 = precise::max(_2381, 0.0);
    uint _2385 = uint(_2383);
    int _2387 = ~_2373;
    int _2389 = _2387 + 1;
    int _2391 = _2389 + 1;
    int _2393 = _2391;
    if (_2261)
    {
        _1639 = 0;
    }
    int _2395 = _1639;
    int _2397 = _2395;
    if (!_2369)
    {
        int _2399 = ~_2373;
        int _2401 = _2399 + 1;
        _2393 = _2401;
    }
    int _2403 = _2393;
    bool _2405 = uint(_2265) >= 2u;
    int _2407 = int(_2273) + int(_2367);
    if (!_2261)
    {
        _2397 = 1;
    }
    int _2409 = _2397;
    bool _2411 = _2323 >= 0.0;
    bool _2413 = isnan(_2323);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan(0.0);
    bool _2419 = _2415 || _2417;
    int _2421 = _2405 ? 0 : 1;
    int _2423 = _2419 ? 0 : 1;
    bool _2425 = _2409 != 1;
    int _2427 = _2379 * _2407;
    int _2429 = _2427 + _1883;
    int _2431 = ~_1588;
    int _2433 = _2431 + 1;
    bool _2435 = _2265 != 3;
    int _2437 = ~_2423;
    int _2439 = _2437 + 1;
    int _2441 = _2439 + 1;
    int _2443 = _2441;
    if (!_2375)
    {
        int _2445 = ~_2423;
        int _2447 = _2445 + 1;
        _2443 = _2447;
    }
    int _2449 = _2443;
    bool _2451 = uint(_2429) >= uint(_1516);
    int _2453 = int(_2297) + int(_2385);
    float _2455 = 0.0;
    if (!_2425)
    {
        _2455 = _1504;
    }
    float _2457 = _2455;
    int _2459 = _2433 * _2453;
    int _2461 = _2459 + _1947;
    float _2463 = 0.0;
    float _2465 = _2457;
    if (!_2425)
    {
        _2463 = _1504;
    }
    float _2467 = _2463;
    float _2469 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2471 = _2469 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2473 = 0.0;
    float _2475 = _2467;
    if (!_2425)
    {
        _2473 = _1510;
    }
    float _2477 = _2473;
    float _2479 = 0.0;
    float _2481 = _2477;
    if (!_2425)
    {
        _2479 = _1510;
    }
    float _2483 = _2479;
    int _2485 = ~_2421;
    int _2487 = _2485 + 1;
    int _2489 = _2487 + 1;
    float _2491 = 1.0 / _2471;
    float _2493 = _2483;
    int _2495 = _2489;
    if (_2425)
    {
        _2465 = _128;
    }
    float _2497 = _2465;
    if (_2425)
    {
        _2475 = _128;
    }
    float _2499 = _2475;
    if (_2425)
    {
        _2481 = _1504;
    }
    float _2501 = _2481;
    float _2503 = _2497 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2425)
    {
        _2493 = _1504;
    }
    float _2505 = _2493;
    if (_2435)
    {
        int _2507 = ~_2421;
        int _2509 = _2507 + 1;
        _2495 = _2509;
    }
    int _2511 = _2495;
    float _2513 = _2501 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2515 = uint(_2461) >= uint(_1588);
    float _2517 = in.m_67.x;
    float _2519 = in.m_67.y;
    float _2521 = in.m_67.z;
    bool _2523 = !_2451;
    int _2525 = _2523 ? 0 : (-1);
    bool _2527 = !_2515;
    int _2529 = _2527 ? 0 : (-1);
    int _2531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2533 = _2531 != 0;
    int _2535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2537 = _2535 != 0;
    int _2539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2541 = _2539 != 0;
    float _2543 = _592 * _170;
    int _2545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2547 = _2545 != 0;
    float _2549 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2553 = _2551 != 0;
    float _2555 = fma(_602, _168, _2543);
    float _2557 = fma(_602, _184, _1552);
    float _2559 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2561 = fma(_2549, -2.0, _2559);
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2565 = _2563 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2567 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2569 = fma(_624, _166, _1560);
    float _2571 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2519);
    float _2573 = fma(_624, _188, _2557);
    float _2575 = _1510 * 2.0;
    float _2577 = 1.0 / _2565;
    float _2579 = _2571 * _1508;
    float _2581 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2583 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2585 = _2583 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2587 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2517);
    float _2589 = _2569 + _1540;
    float _2591 = -_2581;
    float _2593 = fma(_1562, 2.0, _2591);
    float _2595 = fma(_624, _172, _2555);
    float _2597 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2599 = log2(_2597);
    float _2601 = _2587 * _2567;
    float _2603 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2521);
    bool _2605 = !_2537;
    int _2607 = _2605 ? 0 : 1;
    float _2609 = _2603 * _1512;
    float _2611 = floor(_2575);
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2615 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2613;
    float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2619 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2617;
    bool _2621 = !_2541;
    int _2623 = _2621 ? 0 : 1;
    float _2625 = _2615 * _2491;
    float _2627 = _2619 * _1665;
    float _2629 = 1.0 / _2585;
    float _2631 = _142 * _2599;
    float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2635 = _2633 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2637 = !_2533;
    float _2639 = _2637 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _2641 = abs(_2623);
    int _2643 = ~_2407;
    int _2645 = _2643 + _2525;
    int _2647 = _2645 + 1;
    float _2649 = exp2(_2631);
    bool _2651 = _2611 >= 0.0;
    bool _2653 = isnan(_2611);
    bool _2655 = _2651 || _2653;
    bool _2657 = isnan(0.0);
    bool _2659 = _2655 || _2657;
    int _2661 = _1516 * _2647;
    int _2663 = _2661 + _1883;
    int _2665 = ~_2325;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    float _2671 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1534);
    float _2673 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2675 = _2673 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2677 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2677;
    int _2681 = _2659 ? 0 : 1;
    float _2683 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2685 = _2683 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2687 = _2675 * _2577;
    float _2689 = _2679 * _1909;
    bool _2691 = _2611 > 0.0;
    float _2693 = _2685 * _1975;
    int _2695 = ~_2681;
    int _2697 = _2695 + 1;
    int _2699 = _2697 + 1;
    float _2701 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2703 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2701;
    float _2705 = _128 + _1504;
    float _2707 = -_2649;
    float _2709 = _2707 + 1.0;
    float _2711 = _2635 * _2629;
    float _2713 = _2703 * _1927;
    float _2715 = _128 + _1510;
    float _2717 = in.m_57.w;
    float _2719 = _2705 + (-1.0);
    float _2721 = _2715 + (-1.0);
    int _2723 = _2699;
    float _2725 = _2639;
    if (!_2691)
    {
        int _2727 = ~_2681;
        int _2729 = _2727 + 1;
        _2723 = _2729;
    }
    int _2731 = _2723;
    float _2733 = fma(_2719, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2735 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2737 = isnan(0.0);
    bool _2739 = _2735 || _2737;
    bool _2741 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2743 = _2739 || _2741;
    float _2745 = _1504 + _1510;
    float _2747 = fma(_2721, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2749 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2671);
    float _2751 = _2743 ? _2709 : 0.0;
    float _2753 = _2745 + (-1.0);
    bool _2755 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2757 = isnan(1.0);
    bool _2759 = _2755 || _2757;
    bool _2761 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2763 = _2759 || _2761;
    float _2765 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2767 = 1.0 + _2765;
    bool _2769 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2771 = isnan(_1498);
    bool _2773 = _2769 || _2771;
    bool _2775 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2777 = _2773 || _2775;
    float _2779 = float(_2777);
    float _2781 = fma(_2753, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2783 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2785 = isnan(_1498);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2791 = _2787 || _2789;
    float _2793 = float(_2791);
    float _2795 = 1.0 / _2767;
    float _2797 = fma(_2689, _1520, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2799 = -_2779;
    float _2801 = _2799 + 1.0;
    float _2803 = fma(_2687, _1544, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2805 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2807 = _1498 + _2805;
    float _2809 = _2595 + _2717;
    bool _2811 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2813 = isnan(_1498);
    bool _2815 = _2811 || _2813;
    bool _2817 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2819 = _2815 || _2817;
    float _2821 = float(_2819);
    float _2823 = -_2793;
    float _2825 = _2823 + 1.0;
    float _2827 = _2793 * _2801;
    float _2829 = _2573 + _1522;
    bool _2831 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2833 = isnan(_1498);
    bool _2835 = _2831 || _2833;
    bool _2837 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2839 = _2835 || _2837;
    float _2841 = float(_2839);
    float _2843 = _2821 * _2825;
    float _2845 = -_2821;
    float _2847 = _2845 + 1.0;
    bool _2849 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2851 = isnan(_1498);
    bool _2853 = _2849 || _2851;
    bool _2855 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2857 = _2853 || _2855;
    float _2859 = float(_2857);
    float _2861 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2863 = _1498 + _2861;
    float _2865 = -_2841;
    float _2867 = _2865 + 1.0;
    float _2869 = _2841 * _2847;
    float _2871 = _2751 * _2795;
    bool _2873 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2875 = isnan(_1498);
    bool _2877 = _2873 || _2875;
    bool _2879 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2881 = _2877 || _2879;
    float _2883 = float(_2881);
    float _2885 = -_2859;
    float _2887 = _2885 + 1.0;
    float _2889 = fma(_2625, _2863, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2891 = _2859 * _2867;
    bool _2893 = _1498 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2895 = isnan(_1498);
    bool _2897 = _2893 || _2895;
    bool _2899 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2901 = _2897 || _2899;
    float _2903 = float(_2901);
    float _2905 = in.m_69.x;
    float _2907 = in.m_69.y;
    float _2909 = in.m_69.z;
    float _2911 = _2883 * _2887;
    float _2913 = -_2883;
    float _2915 = _2913 + 1.0;
    bool _2917 = !_2763;
    float _2919 = _2917 ? _142 : _2871;
    float _2921 = -_2903;
    float _2923 = _2921 + 1.0;
    bool _2925 = _2519 != 0.0;
    bool _2927 = isnan(_2519);
    bool _2929 = _2925 || _2927;
    bool _2931 = isnan(0.0);
    bool _2933 = _2929 || _2931;
    float _2935 = _2903 * _2915;
    float _2937 = fma(_2693, _1570, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2939 = _1582 * _2923;
    bool _2941 = _2517 == 0.0;
    bool _2943 = !_2933;
    bool _2945 = _2941 && _2943;
    float _2947 = -_1582;
    float _2949 = _2947 + 1.0;
    int _2951 = abs(as_type<int>(_2639));
    float _2953 = _2889 * _2939;
    bool _2955 = _2521 == 0.0;
    bool _2957 = _2955 && _2945;
    float _2959 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2961 = _1498 + _2959;
    float _2963 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2965 = _1498 + _2963;
    float _2967 = fma(_2949, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2953);
    float _2969 = fma(_2627, _2807, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2971 = fma(_2711, _2961, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2973 = fma(_2713, _2965, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2975 = fma(_2803, _2935, _2967);
    float _2977 = in.m_71.x;
    float _2979 = in.m_71.y;
    float _2981 = in.m_71.z;
    int _2983 = abs(_2607);
    float _2985 = sqrt(_2749);
    float _2987 = fma(_2797, _2911, _2975);
    int _2989 = ~_2453;
    int _2991 = _2989 + _2529;
    int _2993 = _2991 + 1;
    float _2995 = _2949;
    float _2997 = _2953;
    float _2999 = _2807;
    float _3001 = _2871;
    float _3003 = as_type<float>(_2731);
    if (_2957)
    {
        _2995 = _2905;
    }
    float _3005 = _2995;
    float _3007 = fma(_2937, _2891, _2987);
    float _3009 = _3005;
    if (_2957)
    {
        _2997 = _2907;
    }
    float _3011 = _2997;
    float _3013 = _3011;
    if (_2957)
    {
        _2725 = _3005;
    }
    float _3015 = _2725;
    float _3017 = fma(_2969, _2869, _3007);
    float _3019 = _3015;
    if (_2957)
    {
        _2999 = _3011;
    }
    float _3021 = _2999;
    float _3023 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3025 = int(_3023);
    float _3027 = _3021;
    if (!_2957)
    {
        _3009 = _2905;
    }
    float _3029 = _3009;
    float _3031 = fma(_2971, _2843, _3017);
    if (!_2957)
    {
        _3013 = _2907;
    }
    float _3033 = _3013;
    if (_2957)
    {
        _3001 = _2909;
    }
    float _3035 = _3001;
    float _3037 = _3035;
    if (!_2957)
    {
        float _3039 = fma(_2517, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3029);
        _3019 = _3039;
    }
    float _3041 = _3019;
    if (!_2957)
    {
        float _3043 = fma(_2519, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3033);
        _3027 = _3043;
    }
    float _3045 = _3027;
    float _3047 = float(_2951);
    float _3049 = _1510 + (-0.5);
    float _3051 = float(_2731);
    float _3053 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_2957)
    {
        _3003 = _3035;
    }
    float _3055 = _3003;
    float _3057 = fma(_2973, _2827, _3031);
    float _3059 = _3055;
    if (!_2957)
    {
        _3037 = _2909;
    }
    float _3061 = _3037;
    float _3063 = _3047 * _3051;
    float _3065 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3053);
    float _3067 = _3063 * (-2.0);
    float _3069 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3071 = float(_2403);
    float _3073 = _128 + (-0.5);
    float _3075 = fma(_3067, _2977, _2977);
    float _3077 = fma(_2499, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3069);
    float _3079 = float(_2983);
    float _3081 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3083 = fma(_3073, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3075);
    float _3085 = fma(_2733, _3067, _2733);
    float _3087 = fma(_1504, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3081);
    float _3089 = _3079 * _3071;
    float _3091 = _1504 + (-0.5);
    float _3093 = fma(_2919, _3085, _3083);
    float _3095 = _3089 * (-2.0);
    float _3097 = float(_2449);
    float _3099 = fma(_2779, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3057);
    float _3101 = float(_2641);
    float _3103 = fma(_3095, _2979, _2979);
    float _3105 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3107 = _3093 * 0.15915493667125701904296875;
    float _3109 = fma(_2781, _3095, _2781);
    float _3111 = _3101 * _3097;
    float _3113 = fma(_3091, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3103);
    float _3115 = fma(_2505, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3105);
    float _3117 = _3107 * 6.283185482025146484375;
    float _3119 = cos(_3117);
    float _3121 = _3111 * (-2.0);
    float _3123 = fma(_2919, _3109, _3113);
    float _3125 = in.m_73.x;
    float _3127 = in.m_73.y;
    float _3129 = in.m_73.z;
    float _3131 = in.m_73.w;
    float _3133 = fma(_3121, _2981, _2981);
    float _3135 = fma(_2747, _3121, _2747);
    float _3137 = _3123 * 0.15915493667125701904296875;
    float _3139 = _3107 * 6.283185482025146484375;
    float _3141 = sin(_3139);
    float _3143 = fma(_3049, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3133);
    float _3145 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3147 = _2985 * 50.0;
    float _3149 = fma(_2919, _3135, _3143);
    if (!_2957)
    {
        float _3151 = fma(_2521, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3061);
        _3059 = _3151;
    }
    float _3153 = _3059;
    float _3155 = fma(_2513, -2.0, _3145);
    float _3157 = _3137 * 6.283185482025146484375;
    float _3159 = sin(_3157);
    float _3161 = _3149 * 0.15915493667125701904296875;
    float _3163 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3165 = _3099 * _3147;
    bool _3167 = _1516 == 0;
    float _3169 = -_3163;
    float _3171 = fma(_2503, 2.0, _3169);
    float _3173 = _3165 * _3165;
    float _3175 = _3137 * 6.283185482025146484375;
    float _3177 = cos(_3175);
    float _3179 = _3129 * _3029;
    float _3181 = _3127 * _3061;
    float _3183 = _3125 * _3033;
    float _3185 = _3161 * 6.283185482025146484375;
    float _3187 = cos(_3185);
    float _3189 = -_3179;
    float _3191 = fma(_3125, _3061, _3189);
    float _3193 = -_3181;
    float _3195 = fma(_3129, _3033, _3193);
    float _3197 = _3119 * _3159;
    float _3199 = -_3183;
    float _3201 = fma(_3127, _3029, _3199);
    float _3203 = _3191 * _3131;
    float _3205 = _3195 * _3131;
    float _3207 = _3161 * 6.283185482025146484375;
    float _3209 = sin(_3207);
    float _3211 = _3119 * _3177;
    float _3213 = _3141 * _3177;
    float _3215 = _3201 * _3131;
    float _3217 = _3119 * _3187;
    int _3219 = _2205 >> 31;
    float _3221 = _3141 * _3159;
    float _3223 = _3141 * _3187;
    float _3225 = _3159 * _3187;
    int _3227 = _3219 & 3;
    float _3229 = _3217 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3231 = _3177 * _3187;
    float _3233 = -_3197;
    float _3235 = fma(_3209, _3213, _3233);
    float _3237 = -_3213;
    float _3239 = fma(_3209, _3197, _3237);
    int _3241 = _2205 + _3227;
    float _3243 = _3217 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3245 = -_3209;
    float _3247 = fma(_3245, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3229);
    float _3249 = -_2579;
    float _3251 = _3209 * _3249;
    float _3253 = fma(_3209, _3211, _3221);
    float _3255 = -_3209;
    float _3257 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3243);
    int _3259 = _2249 >> 31;
    float _3261 = fma(_3231, _2601, _3251);
    float _3263 = _3217 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3265 = _3223 * _2579;
    int _3267 = _3259 & 3;
    float _3269 = _3217 * _2579;
    float _3271 = fma(_3209, _3221, _3211);
    float _3273 = -_3209;
    float _3275 = fma(_3273, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3263);
    int _3277 = _2249 + _3267;
    float _3279 = fma(_3253, _2601, _3269);
    int _3281 = _3241 >> 2;
    float _3283 = rsqrt(_3173);
    int _3285 = _3277 >> 2;
    float _3287 = fma(_3235, _2601, _3265);
    int _3289 = _3281 << 4;
    int _3291 = _3289 + 368;
    float _3293 = _3253 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3295 = _3285 << 4;
    int _3297 = _3295 + 512;
    float _3299 = _3253 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _3301 = uint(int(uint(_3291) >> uint(2)));
    uint _3303 = uint(int(uint(int(_3301)) >> uint(2)));
    int _3305 = int(_3301) & 3;
    float _3307 = (*spvDescriptorSet0.vp_c9)._m0[int(_3303)][_3305];
    int _3309 = int(_3301) + 1;
    uint _3311 = uint(int(uint(_3309) >> uint(2)));
    int _3313 = _3309 & 3;
    float _3315 = (*spvDescriptorSet0.vp_c9)._m0[int(_3311)][_3313];
    float _3317 = _3239 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3319 = _3239 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3321 = fma(_3225, _2609, _3261);
    float _3323 = fma(_3239, _2609, _3279);
    float _3325 = fma(_3271, _2609, _3287);
    float _3327 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3317);
    float _3329 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3319);
    uint _3331 = uint(int(uint(_3297) >> uint(2)));
    uint _3333 = uint(int(uint(int(_3331)) >> uint(2)));
    int _3335 = int(_3331) & 3;
    float _3337 = (*spvDescriptorSet0.vp_c9)._m0[int(_3333)][_3335];
    int _3339 = int(_3331) + 1;
    uint _3341 = uint(int(uint(_3339) >> uint(2)));
    int _3343 = _3339 & 3;
    float _3345 = (*spvDescriptorSet0.vp_c9)._m0[int(_3341)][_3343];
    float _3347 = _3165 * _3283;
    float _3349 = _3253 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3351 = _3239 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3353 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3293);
    float _3355 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3299);
    float _3357 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3349);
    float _3359 = fma(_3225, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3351);
    int _3361 = _3297 + 8;
    uint _3363 = uint(int(uint(_3361) >> uint(2)));
    uint _3365 = uint(int(uint(int(_3363)) >> uint(2)));
    int _3367 = int(_3363) & 3;
    float _3369 = (*spvDescriptorSet0.vp_c9)._m0[int(_3365)][_3367];
    int _3371 = int(_3363) + 1;
    uint _3373 = uint(int(uint(_3371) >> uint(2)));
    int _3375 = _3371 & 3;
    float _3377 = (*spvDescriptorSet0.vp_c9)._m0[int(_3373)][_3375];
    float _3379 = _3323 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3381 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3357);
    float _3383 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3353);
    float _3385 = fma(_3235, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3355);
    float _3387 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3379);
    float _3389 = _3323 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3391 = _3323 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3393 = _3291 + 8;
    uint _3395 = uint(int(uint(_3393) >> uint(2)));
    uint _3397 = uint(int(uint(int(_3395)) >> uint(2)));
    int _3399 = int(_3395) & 3;
    float _3401 = (*spvDescriptorSet0.vp_c9)._m0[int(_3397)][_3399];
    int _3403 = int(_3395) + 1;
    uint _3405 = uint(int(uint(_3403) >> uint(2)));
    int _3407 = _3403 & 3;
    float _3409 = (*spvDescriptorSet0.vp_c9)._m0[int(_3405)][_3407];
    float _3411 = fma(_3325, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3387);
    bool _3413 = !_2227;
    int _3415 = _3413 ? 0 : 1;
    float _3417 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3389);
    int _3419 = _2249 & 3;
    bool _3421 = _3419 != 0;
    float _3423 = fma(_3223, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3257);
    int _3425 = abs(_2359);
    float _3427 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3391);
    float _3429 = fma(_3325, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3417);
    bool _3431 = !_3421;
    int _3433 = _3431 ? 0 : 1;
    float _3435 = _3411 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _3437 = ~_3425;
    int _3439 = _3437 + 1;
    int _3441 = _3439 + 1;
    float _3443 = fma(_3325, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3427);
    bool _3445 = _2225 != 3;
    float _3447 = fma(_3223, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3247);
    int _3449 = abs(_3415);
    float _3451 = fma(_3223, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3275);
    int _3453 = abs(_3433);
    float _3455 = sqrt(_3173);
    bool _3457 = !_3445;
    int _3459 = _3457 ? 0 : (-1);
    float _3461 = _3423 * _3127;
    bool _3463 = _2265 != 3;
    float _3465 = _3447 * _3127;
    int _3467 = abs(_2337);
    int _3469 = _2669 * as_type<int>(_3315);
    float _3471 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3473 = int(_3471);
    int _3475 = abs(_3459);
    float _3477 = _3451 * _3127;
    int _3479 = ~_3453;
    int _3481 = _3479 + 1;
    int _3483 = _3481 + 1;
    float _3485 = _3423 * _3045;
    float _3487 = _3447 * _3045;
    int _3489 = _3441 * as_type<int>(_3345);
    float _3491 = _3203 * _3447;
    int _3493 = abs(_2511);
    int _3495 = _3483 * as_type<int>(_3337);
    int _3497 = _3495 + _3489;
    int _3499 = ~_3449;
    int _3501 = _3499 + 1;
    int _3503 = _3501 + 1;
    float _3505 = _3451 * _3045;
    float _3507 = float(uint(_3025));
    int _3509 = _3503 * as_type<int>(_3307);
    int _3511 = _3509 + _3469;
    int _3513 = ~_3493;
    int _3515 = _3513 + 1;
    int _3517 = _3515 + 1;
    int _3519 = abs(_3473);
    float _3521 = 1.0 / _3507;
    int _3523 = ~_3467;
    int _3525 = _3523 + 1;
    int _3527 = _3525 + 1;
    int _3529 = _3517 * as_type<int>(_3369);
    int _3531 = _3529 + _3497;
    bool _3533 = !_3463;
    int _3535 = _3533 ? 0 : (-1);
    int _3537 = _3527 * as_type<int>(_3401);
    int _3539 = _3537 + _3511;
    int _3541 = abs(_3535);
    bool _3543 = !_2547;
    int _3545 = _3543 ? 0 : 1;
    bool _3547 = !_2553;
    int _3549 = _3547 ? 0 : 1;
    int _3551 = abs(_3545);
    int _3553 = ~_3475;
    int _3555 = _3553 + 1;
    int _3557 = _3555 + 1;
    int _3559 = ~_3541;
    int _3561 = _3559 + 1;
    int _3563 = _3561 + 1;
    int _3565 = abs(_3549);
    int _3567 = _3557 * as_type<int>(_3409);
    int _3569 = _3567 + _3539;
    float _3571 = float(uint(_3473));
    int _3573 = _3563 * as_type<int>(_3377);
    int _3575 = _3573 + _3531;
    int _3577 = ~_3551;
    int _3579 = _3577 + 1;
    int _3581 = _3579 + 1;
    int _3583 = _1588 * _2993;
    int _3585 = _3583 + _1947;
    float _3587 = float(uint(_3519));
    float _3589 = _3429 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _3591 = abs(_3025);
    int _3593 = _3569 * _3581;
    bool _3595 = !_3167;
    int _3597 = _3595 ? _2663 : (-1);
    float _3599 = 1.0 / _3571;
    int _3601 = ~_3565;
    int _3603 = _3601 + 1;
    int _3605 = _3603 + 1;
    bool _3607 = _1588 == 0;
    int _3609 = _3597 * _3551;
    int _3611 = _3609 + _3593;
    float _3613 = float(uint(_3591));
    int _3615 = _3605 * _3575;
    bool _3617 = !_3607;
    int _3619 = _3617 ? _3585 : (-1);
    float _3621 = 1.0 / _3587;
    int _3623 = ~_3025;
    int _3625 = _3623 + 1;
    float _3627 = _3443 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _3629 = as_type<int>(_3521) + (-2);
    int _3631 = _3619 * _3565;
    int _3633 = _3631 + _3615;
    float _3635 = _3589 * _3589;
    float _3637 = float(uint(_3611));
    float _3639 = 1.0 / _3613;
    int _3641 = as_type<int>(_3599) + (-2);
    float _3643 = fma(_3435, _3435, _3635);
    float _3645 = float(uint(_3633));
    float _3647 = as_type<float>(_3629) * _3637;
    int _3649 = abs(_3633);
    float _3651 = fma(_3627, _3627, _3643);
    float _3653 = _2809 + _3435;
    float _3655 = trunc(_3647);
    float _3657 = precise::max(_3655, 0.0);
    uint _3659 = uint(_3657);
    int _3661 = as_type<int>(_3621) + (-2);
    float _3663 = as_type<float>(_3641) * _3645;
    int _3665 = abs(_3611);
    float _3667 = _2829 + _3627;
    int _3669 = ~_3473;
    int _3671 = _3669 + 1;
    float _3673 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3675 = _3653 + _3673;
    float _3677 = float(uint(_3665));
    float _3679 = rsqrt(_3651);
    int _3681 = as_type<int>(_3639) + (-2);
    float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3685 = _3667 + _3683;
    float _3687 = _3675 * _3675;
    float _3689 = fma(_3381, _3041, _3485);
    float _3691 = as_type<float>(_3681) * _3677;
    float _3693 = _3203 * _3423;
    float _3695 = trunc(_3663);
    float _3697 = precise::max(_3695, 0.0);
    uint _3699 = uint(_3697);
    float _3701 = float(uint(_3649));
    float _3703 = _3685 * _3685;
    float _3705 = _3203 * _3451;
    float _3707 = as_type<float>(_3661) * _3701;
    float _3709 = _3687 + _3703;
    float _3711 = trunc(_3691);
    float _3713 = precise::max(_3711, 0.0);
    uint _3715 = uint(_3713);
    int _3717 = _3625 * int(_3659);
    int _3719 = _3717 + _3611;
    float _3721 = float(uint(_3719));
    float _3723 = trunc(_3707);
    float _3725 = precise::max(_3723, 0.0);
    uint _3727 = uint(_3725);
    int _3729 = _3671 * int(_3699);
    int _3731 = _3729 + _3633;
    int _3733 = ~_3591;
    int _3735 = _3733 + 1;
    float _3737 = as_type<float>(_3629) * _3721;
    float _3739 = fma(_3271, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3327);
    float _3741 = fma(_3271, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3359);
    float _3743 = float(uint(_3731));
    float _3745 = fma(_3271, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3329);
    float _3747 = sqrt(_3709);
    int _3749 = ~_3519;
    int _3751 = _3749 + 1;
    int _3753 = _3735 * int(_3715);
    int _3755 = _3753 + _3665;
    float _3757 = _3589 * _3679;
    float _3759 = as_type<float>(_3641) * _3743;
    float _3761 = fma(_3205, _3381, _3693);
    int _3763 = _3751 * int(_3727);
    int _3765 = _3763 + _3649;
    float _3767 = float(uint(_3755));
    float _3769 = trunc(_3737);
    float _3771 = precise::max(_3769, 0.0);
    uint _3773 = uint(_3771);
    float _3775 = fma(_3385, _3041, _3505);
    float _3777 = _3347 * _3757;
    float _3779 = fma(_3383, _3041, _3487);
    float _3781 = as_type<float>(_3681) * _3767;
    float _3783 = fma(_3383, _3125, _3465);
    float _3785 = fma(_3205, _3383, _3491);
    float _3787 = _3777 * _3455;
    bool _3789 = _3747 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3791 = fma(_3205, _3385, _3705);
    float _3793 = float(uint(_3765));
    float _3795 = trunc(_3759);
    float _3797 = precise::max(_3795, 0.0);
    uint _3799 = uint(_3797);
    float _3801 = fma(_3347, _3787, _3589);
    float _3803 = fma(_3381, _3125, _3461);
    float _3805 = fma(_3385, _3125, _3477);
    float _3807 = as_type<float>(_3661) * _3793;
    float _3809 = _2589 + _3801;
    float _3811 = fma(_3741, _3129, _3803);
    float _3813 = fma(_3739, _3129, _3783);
    float _3815 = trunc(_3781);
    float _3817 = precise::max(_3815, 0.0);
    uint _3819 = uint(_3817);
    float _3821 = fma(_3745, _3129, _3805);
    float _3823 = _3801;
    float _3825 = _3787;
    float _3827 = _3653;
    float _3829 = _3687;
    float _3831 = _3703;
    float _3833 = _3215;
    float _3835 = _3813;
    float _3837 = _3811;
    if (!_3789)
    {
        _3823 = _3653;
    }
    float _3839 = _3823;
    float _3841 = _3839;
    if (!_3789)
    {
        _3825 = _3667;
    }
    float _3843 = _3825;
    float _3845 = _3843;
    if (!_3789)
    {
        _3827 = _3809;
    }
    float _3847 = _3827;
    float _3849 = trunc(_3807);
    float _3851 = precise::max(_3849, 0.0);
    uint _3853 = uint(_3851);
    bool _3855 = !_3789;
    float _3857 = _3847;
    if (!_3855)
    {
        float _3859 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3863 = _3747 + _3861;
        float _3865 = _3809 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3867 = rsqrt(_3709);
        float _3869 = _3863 * _3859;
        float _3871 = _3869 * 0.15915493667125701904296875;
        float _3873 = _3871 * 6.283185482025146484375;
        float _3875 = sin(_3873);
        float _3877 = _3871 * 6.283185482025146484375;
        float _3879 = cos(_3877);
        float _3881 = fma(_3875, _3865, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3883 = _3867 * _3881;
        float _3885 = fma(_3675, _3883, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3887 = _3879 + (-1.0);
        float _3889 = fma(_3685, _3883, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3891 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3893 = _3885 + _3891;
        float _3895 = _3887 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3899 = _3889 + _3897;
        float _3901 = _3893 * _3893;
        float _3903 = fma(_3809, _3879, _3895);
        float _3905 = _3899 * _3899;
        _3857 = _3903;
        _3829 = _3901;
        _3831 = _3905;
        _3841 = _3885;
        _3845 = _3889;
    }
    float _3907 = _3857;
    float _3909 = _3829;
    float _3911 = _3831;
    float _3913 = _3841;
    float _3915 = _3845;
    int _3917 = int(_3659) + int(_3773);
    float _3919 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3065);
    int _3921 = ~_3025;
    int _3923 = _3921 + 1;
    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3927 = _3907 + _3925;
    int _3929 = int(_3699) + int(_3799);
    float _3931 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2561);
    int _3933 = int(_3715) + int(_3819);
    int _3935 = _3923 * _3917;
    int _3937 = _3935 + _3611;
    int _3939 = ~_3591;
    int _3941 = _3939 + 1;
    float _3943 = fma(_3927, _3927, _3909);
    int _3945 = ~_3473;
    int _3947 = _3945 + 1;
    float _3949 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3155);
    bool _3951 = uint(_3937) >= uint(_3025);
    int _3953 = _3941 * _3933;
    int _3955 = _3953 + _3665;
    int _3957 = int(_3727) + int(_3853);
    int _3959 = _3947 * _3929;
    int _3961 = _3959 + _3633;
    int _3963 = ~_3519;
    int _3965 = _3963 + 1;
    float _3967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3969 = !_3951;
    int _3971 = _3969 ? 0 : (-1);
    float _3973 = _3943 + _3911;
    bool _3975 = uint(_3955) >= uint(_3591);
    int _3977 = _3965 * _3957;
    int _3979 = _3977 + _3649;
    int _3981 = ~_3917;
    int _3983 = _3981 + _3971;
    int _3985 = _3983 + 1;
    float _3987 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3087);
    bool _3989 = uint(_3961) >= uint(_3473);
    float _3991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3993 = uint(_3979) >= uint(_3519);
    int _3995 = _3025 * _3985;
    int _3997 = _3995 + _3611;
    bool _3999 = !_3975;
    int _4001 = _3999 ? 0 : (-1);
    float _4003 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3115);
    bool _4005 = !_3989;
    int _4007 = _4005 ? 0 : (-1);
    out.m_75.x = _1460;
    out.m_75.y = _1462;
    out.m_75.z = _1464;
    out.m_75.w = _1468;
    bool _4009 = _3025 == 0;
    float _4011 = sqrt(_3973);
    int _4013 = ~_3929;
    int _4015 = _4013 + _4007;
    int _4017 = _4015 + 1;
    out.m_77.x = _3811;
    out.m_77.y = _3813;
    out.m_77.z = _3821;
    int _4019 = ~_4001;
    int _4021 = _3933 + _4019;
    int _4023 = _4021 + 1;
    bool _4025 = !_4009;
    int _4027 = _4025 ? _3997 : (-1);
    int _4029 = _3473 * _4017;
    int _4031 = _4029 + _3633;
    bool _4033 = _3025 == 0;
    float _4035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4037 = _3611 ^ _3025;
    bool _4039 = _3473 == 0;
    bool _4041 = _3473 == 0;
    int _4043 = _3633 ^ _3473;
    float _4045 = _3967 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _4047 = float(_4027);
    float _4049 = -_142;
    float _4051 = fma(_4049, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2593);
    bool _4053 = !_3993;
    int _4055 = _4053 ? 0 : (-1);
    float _4057 = fma(_4045, _2135, -0.5);
    uint _4059 = uint(int(uint(_4037) >> uint(31)));
    float _4061 = fma(_4045, _4047, _4051);
    uint _4063 = uint(int(uint(_4043) >> uint(31)));
    bool _4065 = !_4039;
    int _4067 = _4065 ? _4031 : (-1);
    float _4069 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4071 = ~_4055;
    int _4073 = _3957 + _4071;
    int _4075 = _4073 + 1;
    float _4077 = fma(_3919, _4057, _4061);
    int _4079 = ~int(_4059);
    int _4081 = _4079 + 1;
    int _4083 = ~int(_4063);
    int _4085 = _4083 + 1;
    float _4087 = _4035 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _4089 = float(_4067);
    float _4091 = -_142;
    float _4093 = fma(_4091, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3171);
    int _4095 = _4023 ^ _4081;
    float _4097 = fma(_4087, _2179, -0.5);
    int _4099 = _4075 ^ _4085;
    float _4101 = fma(_4087, _4089, _4093);
    int _4103 = ~_4081;
    int _4105 = _4103 + _4095;
    int _4107 = _4105 + 1;
    float _4109 = _3991 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4111 = ~_4085;
    int _4113 = _4111 + _4099;
    int _4115 = _4113 + 1;
    float _4117 = _4069 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _4119 = !_4033;
    int _4121 = _4119 ? _4107 : (-1);
    float _4123 = fma(_4109, _2209, -0.5);
    bool _4125 = !_4041;
    int _4127 = _4125 ? _4115 : (-1);
    float _4129 = fma(_4117, _2237, -0.5);
    float _4131 = float(_4121);
    float _4133 = float(_4127);
    float _4135 = fma(_3739, _3153, _3779);
    float _4137 = fma(_3215, _3739, _3785);
    float _4139 = -_3931;
    float _4141 = fma(_4109, _4131, _4139);
    float _4143 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3077);
    float _4145 = -_3949;
    float _4147 = fma(_4117, _4133, _4145);
    float _4149 = fma(_3741, _3153, _3689);
    float _4151 = fma(_3987, _4123, _4141);
    float _4153 = fma(_4143, _4097, _4101);
    float _4155 = fma(_4003, _4129, _4147);
    float _4157 = fma(_3745, _3153, _3775);
    float _4159 = fma(_3215, _3741, _3761);
    float _4161 = fma(_3215, _3745, _3791);
    float _4163 = _4153 + 0.5;
    float _4165 = _4077 + 0.5;
    float _4167 = _4155 + 0.5;
    float _4169 = _4151 + 0.5;
    out.m_79.x = _4159;
    out.m_79.y = _4137;
    out.m_79.z = _4161;
    bool _4171 = _4011 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4173 = isnan(_4011);
    bool _4175 = _4171 || _4173;
    bool _4177 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4179 = _4175 || _4177;
    out.m_81.x = _4149;
    out.m_81.y = _4135;
    out.m_81.z = _4157;
    out.m_83.x = _4165;
    out.m_83.y = _4169;
    out.m_83.z = _4163;
    out.m_83.w = _4167;
    if (!_4179)
    {
        _3833 = 1.0;
    }
    float _4181 = _3833;
    bool _4183 = !_4179;
    float _4185 = _4181;
    if (!_4183)
    {
        bool _4187 = _4011 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4189 = isnan(_4011);
        bool _4191 = _4187 || _4189;
        bool _4193 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4195 = _4191 || _4193;
        if (!_4195)
        {
            float _4197 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4199 = _4011 + _4197;
            float _4201 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4203 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4201;
            float _4205 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4207 = _4205 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4209 = 1.0 / _4203;
            float _4211 = _4199 * _4209;
            float _4213 = fma(_4211, _4207, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4185 = _4213;
            _4215 = true;
        }
        else
        {
            bool _4217 = _4011 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4219 = isnan(_4011);
            bool _4221 = _4217 || _4219;
            bool _4223 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4225 = _4221 || _4223;
            if (!_4225)
            {
                float _4227 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4229 = _4011 + _4227;
                float _4231 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4233 = _4231 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4235 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4237 = _4235 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4239 = 1.0 / _4233;
                float _4241 = _4229 * _4239;
                float _4243 = fma(_4241, _4237, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4185 = _4243;
                _4215 = true;
            }
            else
            {
                _4185 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4215 = false;
    float _4245 = _4185;
    float _4247 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4249 = _3907 + _4247;
    float _4251 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4253 = _3913 + _4251;
    float _4255 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4257 = _3915 + _4255;
    float _4259 = fma(_4249, _4245, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4261 = fma(_4253, _4245, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4263 = fma(_4257, _4245, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4265 = -_2589;
    float _4267 = _4265 + _4259;
    float _4269 = -_2809;
    float _4271 = _4269 + _4261;
    float _4273 = -_2829;
    float _4275 = _4273 + _4263;
    float _4277 = _4267 * _4267;
    float _4279 = fma(_4271, _4271, _4277);
    float _4281 = fma(_4275, _4275, _4279);
    float _4283 = sqrt(_4281);
    bool _4285 = _4283 > 0.0;
    float _4287 = _4283;
    float _4289 = _4261;
    float _4291 = _4259;
    if (!_4285)
    {
        _4287 = _4263;
    }
    float _4293 = _4287;
    bool _4295 = !_4285;
    float _4297 = _4293;
    float _4299 = _4293;
    if (!_4295)
    {
        bool _4301 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4303 = _1464;
        if (_4301)
        {
            float _4305 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4303 = _4305;
        }
        float _4307 = _4303;
        float _4309 = _4307;
        if (_4301)
        {
            float _4311 = _626 * _4307;
            _3835 = _4311;
        }
        float _4313 = _3835;
        float _4315 = _4313;
        if (_4301)
        {
            float _4317 = _628 * _4307;
            _3837 = _4317;
        }
        float _4319 = _3837;
        float _4321 = _4319;
        if (_4301)
        {
            float _4323 = _630 * _4307;
            _4309 = _4323;
        }
        float _4325 = _4309;
        float _4327 = _4325;
        if (!_4301)
        {
            bool _4329 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4331 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4333 = _4329 || _4331;
            bool _4335 = isnan(1.0);
            bool _4337 = _4333 || _4335;
            float _4339 = _142 + 1.0;
            if (!_4337)
            {
                float _4341 = _4339 * _4339;
                float _4343 = _4341 * 0.5;
                _634 = _4343;
            }
            float _4345 = _634;
            float _4347 = _4345;
            if (!_4337)
            {
                float _4349 = _4345 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4347 = _4349;
            }
            float _4351 = _4347;
            bool _4353 = !_4337;
            float _4355 = _4351;
            if (!_4353)
            {
                float _4357 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4359 = log2(_4357);
                float _4361 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4363 = _4361 + 1.0;
                float _4365 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4367 = _4359 * _4339;
                float _4369 = 1.0 / _4363;
                float _4371 = _4365 * 0.693147182464599609375;
                float _4373 = exp2(_4367);
                float _4375 = 1.0 / _4371;
                float _4377 = _4373 + (-1.0);
                float _4379 = -_4377;
                float _4381 = fma(_4379, _4375, _4339);
                float _4383 = _4381 * _4369;
                float _4385 = _4383 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4355 = _4385;
            }
            float _4387 = _4355;
            float _4389 = _4387 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _4391 = _4387 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4393 = _4387 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4395 = _4387;
            if (!_4337)
            {
                _4395 = _4339;
            }
            float _4397 = _4395;
            float _4399 = _4389 * _372;
            float _4401 = _4389 * _352;
            float _4403 = _4389 * _390;
            float _4405 = fma(_4391, _368, _4399);
            float _4407 = fma(_4391, _348, _4401);
            float _4409 = fma(_4393, _376, _4405);
            bool _4411 = !_4337;
            float _4413 = _4397;
            if (!_4411)
            {
                float _4415 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4417 = log2(_4415);
                float _4419 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4421 = _4419 + 1.0;
                float _4423 = 1.0 / _4421;
                float _4425 = _4417 * _4339;
                float _4427 = exp2(_4425);
                float _4429 = -_4427;
                float _4431 = _4429 + 1.0;
                float _4433 = _4431 * _4423;
                _4413 = _4433;
            }
            float _4435 = _4413;
            float _4437 = fma(_4391, _386, _4403);
            float _4439 = fma(_4393, _364, _4407);
            float _4441 = fma(_4435, _250, _4409);
            float _4443 = fma(_4393, _394, _4437);
            float _4445 = fma(_4435, _248, _4439);
            float _4447 = -_588;
            float _4449 = _4447 + _4441;
            float _4451 = fma(_4435, _252, _4443);
            float _4453 = -_594;
            float _4455 = _4453 + _4445;
            float _4457 = _4449 * _170;
            float _4459 = _4449 * _164;
            float _4461 = _4449 * _186;
            float _4463 = -_600;
            float _4465 = _4463 + _4451;
            float _4467 = fma(_4455, _168, _4457);
            float _4469 = fma(_4455, _162, _4459);
            float _4471 = fma(_4455, _184, _4461);
            float _4473 = fma(_4465, _172, _4467);
            float _4475 = fma(_4465, _166, _4469);
            float _4477 = fma(_4465, _188, _4471);
            _636 = _4475;
            _638 = _4473;
            _640 = _4477;
            _4315 = _4473;
            _4321 = _4475;
            _4327 = _4477;
            _4297 = _4449;
        }
        float _4479 = _636;
        float _4481 = _638;
        float _4483 = _640;
        float _4485 = _4315;
        float _4487 = _4321;
        float _4489 = _4327;
        float _4491 = _4297;
        float _4493 = _4479 * _4479;
        float _4495 = fma(_4481, _4481, _4493);
        float _4497 = fma(_4483, _4483, _4495);
        float _4499 = rsqrt(_4281);
        float _4501 = sqrt(_4497);
        float _4503 = _4271 * _4499;
        float _4505 = _4267 * _4499;
        float _4507 = _4275 * _4499;
        bool _4509 = _4501 > 0.0;
        float _4511 = _4491;
        _642 = _4479;
        if (!_4509)
        {
            _4511 = _4263;
        }
        float _4513 = _4511;
        bool _4515 = !_4509;
        _4299 = _4513;
        if (!_4515)
        {
            float _4517 = rsqrt(_4497);
            float _4519 = _4517 * _4479;
            float _4521 = _4517 * _4481;
            float _4523 = _4517 * _4483;
            float _4525 = _4505 * _4519;
            float _4527 = fma(_4503, _4521, _4525);
            float _4529 = fma(_4507, _4523, _4527);
            float _4531 = _4529 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4533 = fma(_4485, _4531, _4261);
            float _4535 = fma(_4487, _4531, _4259);
            float _4537 = fma(_4489, _4531, _4263);
            _4289 = _4533;
            _4291 = _4535;
            _4299 = _4537;
        }
    }
    float _4539 = _4289;
    float _4541 = _4291;
    float _4543 = _4299;
    float _4545 = _642;
    float _4547 = _2589 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4549 = fma(_2809, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4547);
    float _4551 = _2589 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4553 = fma(_2829, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4549);
    bool _4555 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4557 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4559 = _4555 || _4557;
    bool _4561 = isnan(0.5);
    bool _4563 = _4559 || _4561;
    bool _4565 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4567 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4569 = _4565 || _4567;
    bool _4571 = isnan(0.5);
    bool _4573 = _4569 || _4571;
    float _4575 = _4553 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4577 = fma(_2809, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4551);
    float _4579 = 1.0 / _4575;
    float _4581 = fma(_2829, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4577);
    float _4583 = _4581 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4585 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4587 = _4545;
    float _4589 = _4543;
    float _4591 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_4563)
    {
        _228 = _4539;
    }
    float _4593 = _228;
    float _4595 = _4593;
    if (_4563)
    {
        _230 = _4541;
    }
    float _4597 = _230;
    float _4599 = _4583 + _4575;
    float _4601 = _4597;
    if (_4573)
    {
        _4585 = 1.0;
    }
    float _4603 = _4585;
    float _4605 = _4603;
    if (_4563)
    {
        _4587 = _4543;
    }
    float _4607 = _4587;
    float _4609 = _4599 * _4579;
    float _4611 = _4609 * 0.5;
    float _4613 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4615 = fma(_4611, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4613);
    float _4617 = 1.0 / _4615;
    float _4619 = _4607;
    if (!_4563)
    {
        float _4621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4623 = _2589 + _4621;
        float _4625 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4627 = _2809 + _4625;
        float _4629 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4631 = -_2809;
        float _4633 = _4631 + _4539;
        float _4635 = _4623 * _4623;
        float _4637 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4639 = _2829 + _4637;
        float _4641 = -_2589;
        float _4643 = _4641 + _4541;
        float _4645 = -_2829;
        float _4647 = _4645 + _4543;
        float _4649 = fma(_4627, _4627, _4635);
        float _4651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4653 = fma(_4639, _4639, _4649);
        float _4655 = sqrt(_4653);
        float _4657 = _4629 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4659 = precise::min(_4655, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4661 = _4659 * _4651;
        float _4663 = _4657 * _4661;
        float _4665 = fma(_4633, _4663, _2809);
        float _4667 = fma(_4643, _4663, _2589);
        float _4669 = fma(_4647, _4663, _2829);
        _4601 = _4667;
        _4595 = _4665;
        _4619 = _4669;
        _4589 = _4647;
        _4591 = _4629;
    }
    float _4671 = _4601;
    float _4673 = _4595;
    float _4675 = _4619;
    float _4677 = _4589;
    float _4679 = _4591;
    float _4681 = _4679;
    float _4683 = _4677;
    if (_4573)
    {
        _4681 = 1.0;
    }
    float _4685 = _4681;
    float _4687 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4689 = _4617 * _4687;
    float _4691 = _4685;
    if (!_4573)
    {
        float _4693 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4695 = _4693 * 0.15915493667125701904296875;
        float _4697 = _4695 * 6.283185482025146484375;
        float _4699 = cos(_4697);
        float _4701 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4703 = _4701 * 0.15915493667125701904296875;
        float _4705 = _4695 * 6.283185482025146484375;
        float _4707 = sin(_4705);
        float _4709 = 1.0 / _4699;
        float _4711 = _4703 * 6.283185482025146484375;
        float _4713 = cos(_4711);
        float _4715 = _4707 * _4709;
        float _4717 = _4703 * 6.283185482025146484375;
        float _4719 = sin(_4717);
        float _4721 = _4713 * _4715;
        float _4723 = 1.0 / _4721;
        float _4725 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4727 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4725;
        float _4729 = 1.0 / _4727;
        float _4731 = _4719 * _4723;
        float _4733 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4735 = fma(_4689, _4731, _4733);
        float _4737 = _4735 * _4729;
        float _4739 = precise::clamp(_4737, 0.0, 1.0);
        _4605 = _4739;
    }
    float _4741 = _4605;
    if (!_4573)
    {
        float _4743 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4745 = _4743 * 0.15915493667125701904296875;
        float _4747 = _4745 * 6.283185482025146484375;
        float _4749 = cos(_4747);
        float _4751 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4753 = _4751 * 0.15915493667125701904296875;
        float _4755 = _4745 * 6.283185482025146484375;
        float _4757 = sin(_4755);
        float _4759 = 1.0 / _4749;
        float _4761 = _4753 * 6.283185482025146484375;
        float _4763 = cos(_4761);
        float _4765 = _4757 * _4759;
        float _4767 = _4753 * 6.283185482025146484375;
        float _4769 = sin(_4767);
        float _4771 = _4763 * _4765;
        float _4773 = 1.0 / _4771;
        float _4775 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4777 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _4775;
        float _4779 = 1.0 / _4777;
        float _4781 = _4769 * _4773;
        float _4783 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4785 = fma(_4689, _4781, _4783);
        float _4787 = _4785 * _4779;
        float _4789 = precise::clamp(_4787, 0.0, 1.0);
        float _4791 = -_4789;
        float _4793 = _4791 + 1.0;
        _232 = _4771;
        _4691 = _4793;
    }
    float _4795 = _232;
    float _4797 = _4691;
    float _4799 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4801 = _4671 + _4799;
    float _4803 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4805 = _4673 + _4803;
    float _4807 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4809 = _4675 + _4807;
    float _4811 = _4801 * _4801;
    float _4813 = fma(_4805, _4805, _4811);
    float _4815 = fma(_4809, _4809, _4813);
    float _4817 = rsqrt(_4815);
    float _4819 = sqrt(_4815);
    float _4821 = _4817 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4823 = _4805 * _4821;
    float _4825 = _4809 * _4821;
    float _4827 = _4823 * _4823;
    float _4829 = _4825 * _4825;
    float _4831 = _4827 + _4829;
    float _4833 = sqrt(_4831);
    bool _4835 = _4833 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4837 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4839 = _4833 + _4837;
    float _4841 = _4817;
    float _4843 = _4831;
    float _4845 = _4839;
    float _4847 = _4795;
    float _4849 = _4801;
    if (_4835)
    {
        float _4851 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4841 = _4851;
    }
    float _4853 = _4841;
    if (_4835)
    {
        float _4855 = rsqrt(_4831);
        _4843 = _4855;
    }
    float _4857 = _4843;
    float _4859 = _4857;
    if (_4835)
    {
        float _4861 = _4839 * _4853;
        _4845 = _4861;
    }
    float _4863 = _4845;
    if (_4835)
    {
        float _4865 = _4863 * 0.15915493667125701904296875;
        _4847 = _4865;
    }
    float _4867 = _4847;
    float _4869 = _4809;
    float _4871 = _4867;
    if (_4835)
    {
        float _4873 = _4867 * 6.283185482025146484375;
        float _4875 = sin(_4873);
        _4869 = _4875;
    }
    float _4877 = _4869;
    float _4879 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4881 = precise::max(0.0, _4879);
    float _4883 = _4853;
    float _4885 = _4881;
    if (_4835)
    {
        float _4887 = _4867 * 6.283185482025146484375;
        float _4889 = cos(_4887);
        _4883 = _4889;
    }
    float _4891 = _4883;
    float _4893 = -_4821;
    float _4895 = -_4881;
    float _4897 = fma(_4801, _4893, _4895);
    if (_4835)
    {
        float _4899 = _4897 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4849 = _4899;
    }
    float _4901 = _4849;
    float _4903 = _4901;
    float _4905 = _4877;
    if (_4835)
    {
        float _4907 = fma(_4877, _4901, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4903 = _4907;
    }
    float _4909 = _4903;
    float _4911 = _4909;
    if (!_4835)
    {
        _4905 = _4823;
    }
    float _4913 = _4905;
    float _4915 = _4913;
    float _4917 = _4891;
    if (_4835)
    {
        float _4919 = _4891 + (-1.0);
        _4885 = _4919;
    }
    float _4921 = _4885;
    float _4923 = _4921;
    if (_4835)
    {
        float _4925 = _4857 * _4909;
        _4683 = _4925;
    }
    float _4927 = _4683;
    if (!_4835)
    {
        _4911 = _4897;
    }
    float _4929 = _4911;
    float _4931 = _4929;
    if (_4835)
    {
        float _4933 = _4921 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4871 = _4933;
    }
    float _4935 = _4871;
    if (_4835)
    {
        float _4937 = _4823 * _4927;
        _4915 = _4937;
    }
    float _4939 = _4915;
    if (!_4835)
    {
        _4923 = _4825;
    }
    float _4941 = _4923;
    float _4943 = _4941;
    if (_4835)
    {
        float _4945 = _4825 * _4927;
        _4943 = _4945;
    }
    float _4947 = _4943;
    if (!_4835)
    {
        _4859 = _4827;
    }
    float _4949 = _4859;
    float _4951 = _4949;
    if (_4835)
    {
        float _4953 = fma(_4897, _4891, _4935);
        _4931 = _4953;
    }
    float _4955 = _4931;
    if (_4835)
    {
        float _4957 = _4939 * _4939;
        _4951 = _4957;
    }
    float _4959 = _4951;
    if (!_4835)
    {
        _4917 = _4829;
    }
    float _4961 = _4917;
    float _4963 = _4961;
    if (_4835)
    {
        float _4965 = _4947 * _4947;
        _4963 = _4965;
    }
    float _4967 = _4963;
    float _4969 = fma(_4955, _4955, _4959);
    float _4971 = _4671 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4973 = _4969 + _4967;
    float _4975 = _4671 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4977 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4979 = fma(_4819, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4977);
    float _4981 = precise::clamp(_4979, 0.0, 1.0);
    float _4983 = fma(_4673, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4971);
    float _4985 = fma(_4673, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4975);
    float _4987 = rsqrt(_4973);
    float _4989 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4991 = -_4981;
    float _4993 = _4991 + 1.0;
    float _4995 = fma(_4675, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4985);
    float _4997 = _4671 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4999 = fma(_4675, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4983);
    float _5001 = _4671 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _5003 = _4995 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _5005 = fma(_4673, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4997);
    float _5007 = abs(_4993);
    float _5009 = log2(_5007);
    float _5011 = _4999 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _5013 = _5003 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _5015 = fma(_4675, (*spvDescriptorSet0.vp_c8)._m0[0].z, _5005);
    float _5017 = fma(_4673, (*spvDescriptorSet0.vp_c8)._m0[3].x, _5001);
    float _5019 = -_5013;
    float _5021 = fma(_5019, _4989, 1.0);
    float _5023 = _4987 * _4939;
    float _5025 = _5015 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _5027 = _5011 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _5029 = _4987 * _4955;
    float _5031 = _5023 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5033 = fma(_4675, (*spvDescriptorSet0.vp_c8)._m0[3].z, _5017);
    float _5035 = fma(_5025, (*spvDescriptorSet0.vp_c8)._m0[7].x, _5027);
    float _5037 = _4987 * _4947;
    float _5039 = -_5031;
    float _5041 = fma(_5029, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5039);
    float _5043 = _5033 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _5045 = fma(_5003, (*spvDescriptorSet0.vp_c8)._m0[7].z, _5035);
    float _5047 = _5009 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5049 = -_5037;
    float _5051 = fma(_5049, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5041);
    float _5053 = _5011 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _5055 = fma(_5043, (*spvDescriptorSet0.vp_c8)._m0[7].w, _5045);
    float _5057 = log2(_5021);
    float _5059 = fma(_5051, -0.5, 0.5);
    float _5061 = _5011 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _5063 = fma(_5025, (*spvDescriptorSet0.vp_c8)._m0[4].x, _5053);
    float _5065 = fma(_5051, 0.5, 0.5);
    float _5067 = _5029 + 1.0;
    float _5069 = fma(_5025, (*spvDescriptorSet0.vp_c8)._m0[5].x, _5061);
    float _5071 = fma(_5003, (*spvDescriptorSet0.vp_c8)._m0[4].z, _5063);
    float _5073 = exp2(_5047);
    float _5075 = fma(_5065, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5077 = fma(_5003, (*spvDescriptorSet0.vp_c8)._m0[5].z, _5069);
    float _5079 = fma(_5043, (*spvDescriptorSet0.vp_c8)._m0[4].w, _5071);
    float _5081 = fma(_5065, _5075, -0.212114393711090087890625);
    float _5083 = fma(_5043, (*spvDescriptorSet0.vp_c8)._m0[5].w, _5077);
    float _5085 = 1.0 / _5055;
    float _5087 = fma(_5065, _5081, 1.570728778839111328125);
    float _5089 = _5057 * 0.693147182464599609375;
    float _5091 = _5089 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _5093 = sqrt(_5059);
    float _5095 = -_5029;
    float _5097 = fma(_5073, _5067, _5095);
    float _5099 = fma(_5097, 0.5, 0.5);
    float _5101 = _5079 * _5085;
    float _5103 = _5083 * _5085;
    float _5105 = fma(_5101, 0.5, 0.5);
    float _5107 = fma(_5103, -0.5, 0.5);
    float _5109 = _5093 * 0.636619746685028076171875;
    float3 _12760 = float3(_5105, _5107, _5091);
    float _5111 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12760, float3(0.0), isnan(_12760)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12760, float3(0.0), isnan(_12760)), level(0.0)).x;
    float3 _12771 = float3(_5105, _5107, _5091);
    float4 _5114 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12771, float3(0.0), isnan(_12771)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12771, float3(0.0), isnan(_12771)), level(0.0)).xyzw;
    float _5116 = _5114.x;
    float _5118 = _5114.y;
    float _5120 = _5114.z;
    float _5122 = _5114.w;
    float _5124 = -_5087;
    float _5126 = fma(_5109, _5124, 1.0);
    float2 _12793 = float2(_5126, _5099);
    float3 _5130 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12793, float2(0.0), isnan(_12793)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12793, float2(0.0), isnan(_12793)), level(0.0)).xyz;
    float _5132 = _5130.x;
    float _5134 = _5130.y;
    float _5136 = _5130.z;
    float _5138 = _5009 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5140 = _5011 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5142 = _4741 * _4797;
    bool _5144 = _4741 > 0.0;
    bool _5146 = isnan(_4741);
    bool _5148 = _5144 || _5146;
    bool _5150 = isnan(0.0);
    bool _5152 = _5148 || _5150;
    float _5154 = fma(_5025, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5140);
    float _5156 = exp2(_5138);
    float _5158 = _5142 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _5160 = _4797 <= 0.0;
    bool _5162 = !_5152;
    bool _5164 = _5160 || _5162;
    float _5166 = fma(_5003, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5154);
    float _5168 = _5158 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5170 = fma(_5043, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5166);
    out.m_47.x = _5168;
    float _5172 = _5170 + _5055;
    out.gl_Position.x = _5079;
    out.gl_Position.y = _5083;
    out.gl_Position.z = _5170;
    out.gl_Position.w = _5055;
    float _5174 = _5172 * 0.5;
    float _5176 = -_5156;
    float _5178 = _5176 + 1.0;
    float _5180 = _5178 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_85.z = _5174;
    out.m_85.w = _5055;
    float _5182 = _5180 * _5111;
    float _5184 = -_5180;
    float _5186 = _5184 + 1.0;
    float _5188 = _5122 * _5182;
    float _5190 = _5122 * _5186;
    float _5192 = _5136 * _5182;
    float _5194 = fma(_5132, _5188, _5116);
    float _5196 = fma(_5134, _5188, _5118);
    float _5198 = fma(_5122, _5192, _5120);
    out.m_87.x = _5194;
    out.m_87.y = _5196;
    out.m_87.z = _5198;
    out.m_87.w = _5190;
    if (!_5164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _5200 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5200;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

