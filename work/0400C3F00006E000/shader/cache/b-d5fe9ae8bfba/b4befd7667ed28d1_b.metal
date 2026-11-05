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
    float4 m_69 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_77 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_73 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_61 [[attribute(11)]];
    float4 m_63 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1280 = false;
    bool _604 = false;
    bool _476 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_44.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_47.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1770 = as_type<float>(_112);
        out.gl_Position.z = _1770;
    }
    if (!_100)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _116 = in.m_49.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_126)
    {
        float _132 = float(_96);
        _106 = _132;
    }
    float _134 = _106;
    bool _136 = _130 >= _134;
    bool _138 = !_126;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _114 = as_type<int>(_146);
    }
    int _148 = _114;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1839 = as_type<float>(_148);
        out.gl_Position.z = _1839;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = in.m_51.z;
    float _156 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_53.x;
    float _160 = in.m_53.y;
    float _162 = in.m_53.z;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = in.m_49.x;
    float _182 = in.m_49.y;
    float _184 = in.m_49.z;
    float _186 = _150 * _150;
    float _188 = _152 * _152;
    float _190 = fma(_158, _158, _186);
    float _192 = fma(_160, _160, _188);
    float _194 = fma(_174, _174, _190);
    float _196 = _154 * _154;
    float _198 = fma(_176, _176, _192);
    float _200 = sqrt(_194);
    float _202 = fma(_162, _162, _196);
    float _204 = fma(_178, _178, _202);
    float _206 = sqrt(_198);
    float _208 = sqrt(_204);
    bool _210 = _200 > 0.0;
    bool _212 = _206 > 0.0;
    float _214 = in.m_57.w;
    float _216 = 0.0;
    float _218 = _194;
    float _220 = _198;
    float _222 = _204;
    float _224 = _158;
    if (_210)
    {
        float _226 = rsqrt(_194);
        _216 = _226;
    }
    float _228 = _216;
    float _230 = 0.0;
    if (!_210)
    {
        _230 = 0.0;
    }
    float _232 = _230;
    bool _234 = _208 > 0.0;
    float _236 = in.m_44.x;
    float _238 = in.m_44.y;
    float _240 = in.m_44.z;
    float _242 = 0.0;
    float _244 = _232;
    if (!_210)
    {
        _242 = 0.0;
    }
    float _246 = _242;
    float _248 = 0.0;
    float _250 = 0.0;
    float _252 = _246;
    if (!_212)
    {
        _248 = 0.0;
        _250 = 0.0;
    }
    float _254 = _248;
    float _256 = _250;
    float _258 = 0.0;
    float _260 = _254;
    float _262 = _256;
    if (_212)
    {
        float _264 = rsqrt(_198);
        _258 = _264;
    }
    float _266 = _258;
    if (!_172)
    {
        float _268 = _156 * _156;
        float _270 = _268 * 0.5;
        _218 = _270;
    }
    float _272 = _218;
    float _274 = 0.0;
    float _276 = _272;
    if (!_210)
    {
        _274 = 0.0;
    }
    float _278 = _274;
    float _280 = 0.0;
    float _282 = _278;
    if (!_212)
    {
        _280 = 0.0;
    }
    float _284 = _280;
    float _286 = _284;
    if (!_172)
    {
        float _288 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _276 = _288;
    }
    float _290 = _276;
    float _292 = 0.0;
    float _294 = _290;
    if (_234)
    {
        float _296 = rsqrt(_204);
        _292 = _296;
    }
    float _298 = _292;
    if (_210)
    {
        float _300 = _228 * _158;
        _244 = _300;
    }
    float _302 = _244;
    if (_210)
    {
        float _304 = _228 * _150;
        _252 = _304;
    }
    float _306 = _252;
    float _308 = _306;
    if (_210)
    {
        float _310 = _228 * _174;
        _282 = _310;
    }
    float _312 = _282;
    if (!_234)
    {
        _220 = 0.0;
    }
    float _314 = _220;
    float _316 = _314;
    if (_212)
    {
        float _318 = _266 * _160;
        _286 = _318;
    }
    float _320 = _286;
    if (_212)
    {
        float _322 = _266 * _152;
        _260 = _322;
    }
    float _324 = _260;
    if (_212)
    {
        float _326 = _266 * _176;
        _262 = _326;
    }
    float _328 = _262;
    bool _330 = !_172;
    if (!_330)
    {
        float _332 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _334 = log2(_332);
        float _336 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _338 = _336 + 1.0;
        float _340 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _342 = _156 * _334;
        float _344 = 1.0 / _338;
        float _346 = _340 * 0.693147182464599609375;
        float _348 = exp2(_342);
        float _350 = 1.0 / _346;
        float _352 = _348 + (-1.0);
        float _354 = -_352;
        float _356 = fma(_354, _350, _156);
        float _358 = _356 * _344;
        float _360 = _358 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _294 = _360;
        _222 = _350;
    }
    float _362 = _294;
    float _364 = _222;
    float _366 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _368 = _364;
    float _370 = _362;
    if (_234)
    {
        float _372 = _298 * _154;
        _316 = _372;
    }
    float _374 = _316;
    float _376 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    if (!_234)
    {
        _368 = 0.0;
    }
    float _378 = _368;
    float _380 = _366 * _306;
    float _382 = _366 * _324;
    float _384 = _366 * _374;
    float _386 = _378;
    if (_234)
    {
        float _388 = _298 * _162;
        _386 = _388;
    }
    float _390 = _386;
    float _392 = fma(_376, _302, _380);
    float _394 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_234)
    {
        _308 = 0.0;
    }
    float _396 = _308;
    float _398 = _396;
    if (_234)
    {
        float _400 = _298 * _178;
        _398 = _400;
    }
    float _402 = _398;
    float _404 = fma(_376, _320, _382);
    float _406 = fma(_376, _390, _384);
    float _408 = fma(_394, _312, _392);
    if (!_172)
    {
        _370 = _156;
    }
    float _410 = _370;
    bool _412 = !_172;
    float _414 = _410;
    if (!_412)
    {
        float _416 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _418 = log2(_416);
        float _420 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _422 = _420 + 1.0;
        float _424 = 1.0 / _422;
        float _426 = _156 * _418;
        float _428 = exp2(_426);
        float _430 = -_428;
        float _432 = _430 + 1.0;
        float _434 = _432 * _424;
        _414 = _434;
    }
    float _436 = _414;
    bool _438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _440 = fma(_394, _328, _404);
    float _442 = fma(_394, _402, _406);
    float _444 = fma(_436, _180, _408);
    float _446 = fma(_436, _182, _440);
    float _448 = fma(_436, _184, _442);
    float _450 = fma(_444, _214, _236);
    float _452 = fma(_446, _214, _238);
    float _454 = fma(_448, _214, _240);
    bool _456 = !_438;
    float _474;
    if (!_456)
    {
        float _458 = in.m_59.x;
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _462 = _458 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _466 = _464 * _460;
        float _468 = floor(_466);
        float _470 = -_468;
        float _472 = _466 + _470;
        _474 = _472;
        _476 = true;
    }
    else
    {
        float _478 = float(_96);
        float _480 = 1.0 / _478;
        float _482 = _130 * _480;
        _474 = _482;
    }
    _476 = false;
    float _484 = _474;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _488 = _484 + _486;
    bool _490 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _492 = isnan(_484);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _502;
    float _506 = 1.0 / _504;
    bool _508 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _510 = isnan(_484);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -_500;
    float _522 = _520 + 1.0;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _528;
    bool _532 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _534;
    float _538 = _518 * _522;
    float _540 = -_518;
    float _542 = _540 + 1.0;
    float _544 = _488 * _506;
    float _546 = in.m_57.x;
    float _548 = in.m_57.y;
    float _550 = in.m_57.z;
    float _552 = fma(_526, _544, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _554 = fma(_536, _544, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _556 = fma(_530, _544, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _558 = _552 * _538;
    float _560 = _554 * _538;
    float _562 = _556 * _538;
    float _564 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[143].x, _558);
    float _566 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[143].y, _560);
    float _568 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[143].z, _562);
    float _570 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[144].x, _564);
    float _572 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[144].y, _566);
    float _574 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[144].z, _568);
    float _576 = _570 * _546;
    float _578 = _572 * _548;
    float _580 = _574 * _550;
    bool _582 = !_532;
    float _584 = _580;
    float _602;
    if (!_582)
    {
        float _586 = in.m_59.x;
        float _588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _590 = _586 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _594 = _592 * _588;
        float _596 = floor(_594);
        float _598 = -_596;
        float _600 = _594 + _598;
        _602 = _600;
        _604 = true;
    }
    else
    {
        float _606 = float(_96);
        float _608 = 1.0 / _606;
        float _610 = _130 * _608;
        _602 = _610;
    }
    _604 = false;
    float _612 = _602;
    float _614 = in.m_59.w;
    float _616 = _452 * _160;
    float _618 = _452 * _152;
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _622 = _620 != 0;
    float _624 = _452 * _176;
    float _626 = in.m_61.y;
    float _628 = fma(_450, _150, _618);
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _632 = _630 != 0;
    float _634 = in.m_51.w;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _638 = _636 != 0;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _644 = fma(_450, _158, _616);
    float _646 = fma(_450, _174, _624);
    float _648 = in.m_63.w;
    float _650 = 1.0 / _642;
    float _652 = fma(_454, _162, _644);
    float _654 = _160;
    if (!_622)
    {
        float _656 = in.m_59.y;
        _654 = _656;
    }
    float _658 = _654;
    float _660 = fma(_454, _178, _646);
    float _662 = fma(_454, _154, _628);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _664;
    float _668 = in.m_53.w;
    bool _670 = _614 > 0.5;
    float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _676 = _674 != 0;
    float _678 = in.m_61.x;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _682 = _612 + _680;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _686 = _684 != 0;
    float _688 = -_626;
    float _690 = _688 + 1.0;
    float _692 = _156;
    bool _694 = _670;
    float _696 = _626;
    if (_632)
    {
        float _698 = in.m_59.x;
        _692 = _698;
    }
    float _700 = _692;
    float _702 = _666 * _650;
    bool _704 = _612 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _706 = isnan(_612);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = _662 + _634;
    float _718 = _312;
    float _720 = _634;
    if (_638)
    {
        float _722 = in.m_59.z;
        _718 = _722;
    }
    float _724 = _718;
    float _726 = _670 ? _690 : _626;
    float _728 = fma(_702, _682, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _730 = _612 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _732 = isnan(_612);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    float _742 = _178;
    float _744 = _726;
    float _746 = _728;
    if (!_622)
    {
        float _748 = in.m_59.z;
        _742 = _748;
    }
    float _750 = _742;
    float _752 = -_714;
    float _754 = _752 + 1.0;
    float _756 = _676 ? _726 : _626;
    float _758 = _672 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _760 = as_type<int>(_668);
    float _762 = _758;
    if (!_622)
    {
        _224 = _658;
    }
    float _764 = _224;
    float _766 = _740 * _754;
    out.m_65.w = _648;
    float _768 = -_740;
    float _770 = _768 + 1.0;
    float _772 = _652 + _668;
    float _774 = _728 * _766;
    float _776 = _764;
    float _778 = _658;
    int _780 = as_type<int>(_766);
    if (_622)
    {
        float _782 = in.m_59.x;
        float _784 = in.m_59.y;
        _776 = _782;
        _778 = _784;
    }
    float _786 = _776;
    float _788 = _778;
    float _790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (!_632)
    {
        _720 = _678;
    }
    float _792 = _720;
    float _794 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[115].x, _774);
    float _796 = in.m_55.w;
    float _798 = _792;
    if (!_632)
    {
        _744 = _792;
    }
    float _800 = _744;
    float _802 = _800;
    if (_632)
    {
        _798 = _678;
    }
    float _804 = _798;
    float _806 = fma(_758, _756, -0.5);
    float _808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _810 = false;
    if (_632)
    {
        bool _812 = _700 > 0.5;
        _810 = _812;
    }
    bool _814 = _810;
    if (_632)
    {
        float _816 = -_804;
        float _818 = _816 + 1.0;
        _780 = as_type<int>(_818);
    }
    int _820 = _780;
    if (_638)
    {
        float _822 = -_804;
        float _824 = _822 + 1.0;
        _760 = as_type<int>(_824);
    }
    int _826 = _760;
    if (_638)
    {
        bool _828 = _724 > 0.5;
        _694 = _828;
    }
    bool _830 = _694;
    float _832 = _750;
    if (!_622)
    {
        _762 = _750;
    }
    float _834 = _762;
    float _836 = _834;
    if (!_638)
    {
        _746 = _804;
    }
    float _838 = _746;
    float _840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _842 = _838;
    if (_632)
    {
        float _844 = _814 ? as_type<float>(_820) : _804;
        _802 = _844;
    }
    float _846 = _802;
    if (_638)
    {
        float _848 = _830 ? as_type<float>(_826) : _804;
        _842 = _848;
    }
    float _850 = _842;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _854 = _716 + _852;
    if (_622)
    {
        _836 = _788;
    }
    float _856 = _836;
    if (_622)
    {
        _832 = _788;
    }
    float _858 = _832;
    float _860 = _660 + _796;
    bool _862 = _788 > 0.5;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _866 = _854 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _868 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[83].z, _864);
    float _870 = _786 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_686)
    {
        float _874 = _862 ? _690 : _626;
        _696 = _874;
    }
    float _876 = _696;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _880 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _882 = _772 + _880;
    float _884 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[83].w, _872);
    float _886 = _808 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _888 = -_878;
    float _890 = fma(_870, 2.0, _888);
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _894 = _860 + _892;
    float _896 = fma(_886, _850, -0.5);
    float _898 = _856 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _900 = -_130;
    float _902 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[81].x, _890);
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _906 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _868);
    float _908 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[28].x, _866);
    float _910 = _876 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _912 = fma(_898, -2.0, _904);
    float _914 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _884);
    float _916 = fma(_906, _896, _902);
    float _918 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[28].z, _908);
    float _920 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _912);
    float _922 = _910 * _790;
    float _924 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[116].x, _794);
    float _926 = _846 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _928 = -_920;
    float _930 = fma(_914, _806, _928);
    float _932 = _854 * _854;
    bool _934 = _918 >= 0.0;
    float _936 = _576 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _938 = fma(_882, _882, _932);
    float _940 = _926 * _840;
    float _942 = fma(_894, _894, _938);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _948 = rsqrt(_942);
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_934)
    {
        _952 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _954 = _952;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _962 = _936 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _966 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _972 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _974 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _924 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _980 = _916 + 0.5;
    float _982 = _930 + 0.5;
    int _984 = as_type<int>(_954);
    if (_934)
    {
        float _986 = _954 * 5.0;
        _984 = as_type<int>(_986);
    }
    int _988 = _984;
    float _990 = _962 * _948;
    out.m_67.x = _972;
    out.m_67.y = _974;
    out.m_67.z = _976;
    out.m_67.w = _964;
    float _992 = _882 * _990;
    out.m_69.x = _966;
    out.m_69.y = _968;
    out.m_69.z = _970;
    out.m_69.w = _978;
    float _994 = _854 * _990;
    out.m_71.x = _940;
    out.m_71.y = _922;
    out.m_71.z = _980;
    out.m_71.w = _982;
    int _996 = _988;
    if (_934)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3201 = as_type<float>(_988);
        out.gl_Position.z = _3201;
    }
    if (_934)
    {
        out.m_47.x = 0.0;
    }
    if (_934)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _998 = -_994;
    float _1000 = _716 + _998;
    float _1002 = _894 * _990;
    float _1004 = -_992;
    float _1006 = _772 + _1004;
    float _1008 = -_994;
    float _1010 = _854 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1014 = _1000 + _1012;
    float _1016 = -_1002;
    float _1018 = _860 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1022 = _1006 + _1020;
    float _1024 = -_992;
    float _1026 = _882 + _1024;
    float _1028 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1030 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1032 = _1018 + _1030;
    float _1034 = _1010 * _1010;
    float _1036 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1028);
    float _1038 = -_1002;
    float _1040 = _894 + _1038;
    float _1042 = fma(_1026, _1026, _1034);
    float _1044 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1036);
    float _1046 = fma(_1040, _1040, _1042);
    bool _1048 = _1044 >= 0.0;
    float _1050 = _1022;
    if (_1048)
    {
        _1050 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1052 = _1050;
    if (_1048)
    {
        out.m_47.x = 0.0;
    }
    if (_1048)
    {
        float _1054 = _1052 * 5.0;
        _996 = as_type<int>(_1054);
    }
    int _1056 = _996;
    if (_1048)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3313 = as_type<float>(_1056);
        out.gl_Position.z = _3313;
    }
    if (_1048)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1058 = in.m_73.x;
    float _1060 = in.m_73.y;
    float _1062 = in.m_73.z;
    float _1064 = sqrt(_1046);
    float _1066 = _578 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1068 = _948 * _1064;
    float _1070 = _1068 * _1066;
    float _1072 = _936 * _1068;
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1060);
    float _1076 = _580 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1078 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1058);
    float _1080 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1062);
    float _1082 = _1070 * _1074;
    float _1084 = _1068 * _1076;
    float _1086 = _1072 * _1078;
    float _1088 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1090 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1092 = _1084 * _1080;
    float _1094 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1096 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1088);
    float _1098 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1090);
    float _1100 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1094);
    float _1102 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1096);
    float _1104 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1098);
    float _1106 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1100);
    float _1108 = _1102 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1110 = _1104 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1112 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1114 = _772 + _1108;
    float _1116 = _860 + _1110;
    float _1118 = _716 + _1112;
    float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1122 = _1114 + _1120;
    float _1124 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1126 = _1116 + _1124;
    float _1128 = _1122 * _1122;
    float _1130 = _1126 * _1126;
    float _1132 = _1128 + _1130;
    float _1134 = sqrt(_1132);
    bool _1136 = _1134 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1138 = _1112;
    float _1140 = _1086;
    float _1142 = _1114;
    float _1144 = _1092;
    float _1146 = _1130;
    if (!_1136)
    {
        _1138 = _1114;
    }
    float _1148 = _1138;
    float _1150 = _1148;
    if (!_1136)
    {
        _1140 = _1128;
    }
    float _1152 = _1140;
    float _1154 = _1152;
    if (!_1136)
    {
        _1142 = _1116;
    }
    float _1156 = _1142;
    float _1158 = _1156;
    if (!_1136)
    {
        _1144 = _1118;
    }
    float _1160 = _1144;
    bool _1162 = !_1136;
    float _1164 = _1160;
    if (!_1162)
    {
        float _1166 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1170 = _1134 + _1168;
        float _1172 = _1118 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1174 = rsqrt(_1132);
        float _1176 = _1170 * _1166;
        float _1178 = _1176 * 0.15915493667125701904296875;
        float _1180 = _1178 * 6.283185482025146484375;
        float _1182 = sin(_1180);
        float _1184 = _1178 * 6.283185482025146484375;
        float _1186 = cos(_1184);
        float _1188 = fma(_1182, _1172, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1190 = _1174 * _1188;
        float _1192 = _1186 + (-1.0);
        float _1194 = fma(_1122, _1190, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1196 = fma(_1126, _1190, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1198 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1202 = _1194 + _1200;
        float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1206 = _1196 + _1204;
        float _1208 = fma(_1118, _1186, _1198);
        float _1210 = _1202 * _1202;
        float _1212 = _1206 * _1206;
        _1164 = _1208;
        _1154 = _1210;
        _1146 = _1212;
        _1150 = _1194;
        _1158 = _1196;
    }
    float _1214 = _1164;
    float _1216 = _1154;
    float _1218 = _1146;
    float _1220 = _1150;
    float _1222 = _1158;
    float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1226 = _1214 + _1224;
    float _1228 = fma(_1226, _1226, _1216);
    float _1230 = _1228 + _1218;
    float _1232 = sqrt(_1230);
    bool _1234 = _1232 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1236 = isnan(_1232);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1242 = _1238 || _1240;
    float _1244 = _1216;
    if (!_1242)
    {
        _1244 = 1.0;
    }
    float _1246 = _1244;
    bool _1248 = !_1242;
    float _1250 = _1246;
    if (!_1248)
    {
        bool _1252 = _1232 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1254 = isnan(_1232);
        bool _1256 = _1252 || _1254;
        bool _1258 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1260 = _1256 || _1258;
        if (!_1260)
        {
            float _1262 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1264 = _1232 + _1262;
            float _1266 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1268 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1266;
            float _1270 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1272 = _1270 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1274 = 1.0 / _1268;
            float _1276 = _1264 * _1274;
            float _1278 = fma(_1276, _1272, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1250 = _1278;
            _1280 = true;
        }
        else
        {
            bool _1282 = _1232 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1284 = isnan(_1232);
            bool _1286 = _1282 || _1284;
            bool _1288 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1290 = _1286 || _1288;
            if (!_1290)
            {
                float _1292 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1294 = _1232 + _1292;
                float _1296 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1298 = _1296 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1300 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1302 = _1300 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1304 = 1.0 / _1298;
                float _1306 = _1294 * _1304;
                float _1308 = fma(_1306, _1302, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1250 = _1308;
                _1280 = true;
            }
            else
            {
                _1250 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1280 = false;
    float _1310 = _1250;
    float _1312 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1314 = _1214 + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1318 = _1220 + _1316;
    float _1320 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1322 = _1222 + _1320;
    float _1324 = fma(_1314, _1310, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1326 = fma(_1318, _1310, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1328 = fma(_1322, _1310, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1330 = -_994;
    float _1332 = _1330 + _1324;
    float _1334 = -_992;
    float _1336 = _1334 + _1326;
    float _1338 = -_1002;
    float _1340 = _1338 + _1328;
    float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1344 = _1332 + _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1348 = _1336 + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1352 = _1340 + _1350;
    float _1354 = _1344 * _1344;
    float _1356 = fma(_1348, _1348, _1354);
    float _1358 = fma(_1352, _1352, _1356);
    float _1360 = rsqrt(_1358);
    float _1362 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1364 = _1348 * _1362;
    float _1366 = _1352 * _1362;
    float _1368 = _1364 * _1364;
    float _1370 = _1366 * _1366;
    float _1372 = _1368 + _1370;
    float _1374 = sqrt(_1372);
    bool _1376 = _1374 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1378 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1380 = _1374 + _1378;
    float _1382 = _1360;
    float _1384 = _1372;
    float _1386 = _1380;
    float _1388 = _1314;
    float _1390 = _1344;
    float _1392 = _1364;
    if (_1376)
    {
        float _1394 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1382 = _1394;
    }
    float _1396 = _1382;
    if (_1376)
    {
        float _1398 = rsqrt(_1372);
        _1384 = _1398;
    }
    float _1400 = _1384;
    if (_1376)
    {
        float _1402 = _1380 * _1396;
        _1386 = _1402;
    }
    float _1404 = _1386;
    if (_1376)
    {
        float _1406 = _1404 * 0.15915493667125701904296875;
        _1388 = _1406;
    }
    float _1408 = _1388;
    float _1410 = _1396;
    float _1412 = _1408;
    if (_1376)
    {
        float _1414 = _1408 * 6.283185482025146484375;
        float _1416 = sin(_1414);
        _1410 = _1416;
    }
    float _1418 = _1410;
    float _1420 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1422 = precise::max(0.0, _1420);
    float _1424 = _1352;
    float _1426 = _1422;
    if (_1376)
    {
        float _1428 = _1408 * 6.283185482025146484375;
        float _1430 = cos(_1428);
        _1424 = _1430;
    }
    float _1432 = _1424;
    float _1434 = -_1362;
    float _1436 = -_1422;
    float _1438 = fma(_1344, _1434, _1436);
    float _1440 = _1438;
    if (!_1376)
    {
        _1390 = _1366;
    }
    float _1442 = _1390;
    float _1444 = _1442;
    if (_1376)
    {
        float _1446 = _1438 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1426 = _1446;
    }
    float _1448 = _1426;
    float _1450 = _1418;
    float _1452 = _1448;
    if (_1376)
    {
        float _1454 = fma(_1418, _1448, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1450 = _1454;
    }
    float _1456 = _1450;
    float _1458 = _1456;
    if (_1376)
    {
        float _1460 = _1432 + (-1.0);
        _1452 = _1460;
    }
    float _1462 = _1452;
    float _1464 = _1462;
    if (_1376)
    {
        float _1466 = _1400 * _1456;
        _584 = _1466;
    }
    float _1468 = _584;
    if (!_1376)
    {
        _1458 = _1368;
    }
    float _1470 = _1458;
    float _1472 = sqrt(_1358);
    float _1474 = _1470;
    if (_1376)
    {
        float _1476 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1412 = _1476;
    }
    float _1478 = _1412;
    if (_1376)
    {
        float _1480 = _1364 * _1468;
        _1392 = _1480;
    }
    float _1482 = _1392;
    if (_1376)
    {
        float _1484 = _1366 * _1468;
        _1444 = _1484;
    }
    float _1486 = _1444;
    if (!_1376)
    {
        _1464 = _1370;
    }
    float _1488 = _1464;
    float _1490 = _1488;
    if (_1376)
    {
        float _1492 = fma(_1438, _1432, _1478);
        _1440 = _1492;
    }
    float _1494 = _1440;
    if (_1376)
    {
        float _1496 = _1482 * _1482;
        _1474 = _1496;
    }
    float _1498 = _1474;
    if (_1376)
    {
        float _1500 = _1486 * _1486;
        _1490 = _1500;
    }
    float _1502 = _1490;
    float _1504 = fma(_1494, _1494, _1498);
    float _1506 = _1504 + _1502;
    float _1508 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1512 = fma(_1472, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1510);
    float _1514 = precise::clamp(_1512, 0.0, 1.0);
    float _1516 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1518 = rsqrt(_1506);
    float _1520 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1508);
    float _1522 = -_1514;
    float _1524 = _1522 + 1.0;
    float _1526 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1528 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1516);
    float _1530 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1520);
    float _1532 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1534 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1526);
    float _1536 = abs(_1524);
    float _1538 = log2(_1536);
    float _1540 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1542 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1528);
    float _1544 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1546 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1532);
    float _1548 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1550 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1534);
    float _1552 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1554 = _1518 * _1482;
    float _1556 = -_1548;
    float _1558 = fma(_1556, _1544, 1.0);
    float _1560 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1546);
    float _1562 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1564 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1566 = _1518 * _1494;
    float _1568 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1570 = _1518 * _1486;
    float _1572 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1564);
    float _1574 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1576 = -_1568;
    float _1578 = fma(_1566, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1576);
    float _1580 = _1560 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1582 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1572);
    float _1584 = log2(_1558);
    float _1586 = -_1570;
    float _1588 = fma(_1586, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1578);
    float _1590 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1592 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1582);
    float _1594 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1596 = fma(_1588, -0.5, 0.5);
    float _1598 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1590);
    float _1600 = fma(_1588, 0.5, 0.5);
    float _1602 = exp2(_1574);
    float _1604 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1594);
    float _1606 = _1566 + 1.0;
    float _1608 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1598);
    float _1610 = fma(_1600, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1612 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1604);
    float _1614 = 1.0 / _1592;
    float _1616 = sqrt(_1596);
    float _1618 = -_1566;
    float _1620 = fma(_1602, _1606, _1618);
    float _1622 = fma(_1600, _1610, -0.212114393711090087890625);
    float _1624 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1608);
    float _1626 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1612);
    float _1628 = _1584 * 0.693147182464599609375;
    float _1630 = fma(_1600, _1622, 1.570728778839111328125);
    float _1632 = fma(_1620, 0.5, 0.5);
    float _1634 = _1624 * _1614;
    float _1636 = _1626 * _1614;
    float _1638 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1640 = fma(_1634, 0.5, 0.5);
    float _1642 = fma(_1636, -0.5, 0.5);
    float _1644 = _1616 * 0.636619746685028076171875;
    float _1646 = -_1630;
    float _1648 = fma(_1644, _1646, 1.0);
    float3 _4293 = float3(_1640, _1642, _1638);
    float _1650 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4293, float3(0.0), isnan(_4293)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4293, float3(0.0), isnan(_4293)), level(0.0)).x;
    float3 _4304 = float3(_1640, _1642, _1638);
    float4 _1653 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4304, float3(0.0), isnan(_4304)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4304, float3(0.0), isnan(_4304)), level(0.0)).xyzw;
    float _1655 = _1653.x;
    float _1657 = _1653.y;
    float _1659 = _1653.z;
    float _1661 = _1653.w;
    float2 _4321 = float2(_1648, _1632);
    float3 _1665 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4321, float2(0.0), isnan(_4321)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4321, float2(0.0), isnan(_4321)), level(0.0)).xyz;
    float _1667 = _1665.x;
    float _1669 = _1665.y;
    float _1671 = _1665.z;
    float _1673 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1675 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1677 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1675);
    float _1679 = exp2(_1673);
    float _1681 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1677);
    float _1683 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1681);
    float _1685 = _1683 + _1592;
    out.gl_Position.x = _1624;
    out.gl_Position.y = _1626;
    out.gl_Position.z = _1683;
    out.gl_Position.w = _1592;
    float _1687 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1689 = _1685 * 0.5;
    float _1691 = -_1679;
    float _1693 = _1691 + 1.0;
    out.m_47.x = _1687;
    float _1695 = _1693 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.z = _1689;
    out.m_75.w = _1592;
    float _1697 = _1695 * _1650;
    float _1699 = -_1695;
    float _1701 = _1699 + 1.0;
    float _1703 = _1661 * _1697;
    float _1705 = _1671 * _1697;
    float _1707 = _1661 * _1701;
    float _1709 = fma(_1667, _1703, _1655);
    float _1711 = fma(_1669, _1703, _1657);
    float _1713 = fma(_1661, _1705, _1659);
    out.m_77.x = _1709;
    out.m_77.y = _1711;
    out.m_77.z = _1713;
    out.m_77.w = _1707;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1280 = false;
    bool _604 = false;
    bool _476 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_44.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_47.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1770 = as_type<float>(_112);
        out.gl_Position.z = _1770;
    }
    if (!_100)
    {
        return out;
    }
    float _116 = in.m_49.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_126)
    {
        float _132 = float(_96);
        _106 = _132;
    }
    float _134 = _106;
    bool _136 = _130 >= _134;
    bool _138 = !_126;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _114 = as_type<int>(_146);
    }
    int _148 = _114;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1839 = as_type<float>(_148);
        out.gl_Position.z = _1839;
    }
    if (_140)
    {
        return out;
    }
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = in.m_51.z;
    float _156 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_53.x;
    float _160 = in.m_53.y;
    float _162 = in.m_53.z;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = in.m_49.x;
    float _182 = in.m_49.y;
    float _184 = in.m_49.z;
    float _186 = _150 * _150;
    float _188 = _152 * _152;
    float _190 = fma(_158, _158, _186);
    float _192 = fma(_160, _160, _188);
    float _194 = fma(_174, _174, _190);
    float _196 = _154 * _154;
    float _198 = fma(_176, _176, _192);
    float _200 = sqrt(_194);
    float _202 = fma(_162, _162, _196);
    float _204 = fma(_178, _178, _202);
    float _206 = sqrt(_198);
    float _208 = sqrt(_204);
    bool _210 = _200 > 0.0;
    bool _212 = _206 > 0.0;
    float _214 = in.m_57.w;
    float _216 = 0.0;
    float _218 = _194;
    float _220 = _198;
    float _222 = _204;
    float _224 = _158;
    if (_210)
    {
        float _226 = rsqrt(_194);
        _216 = _226;
    }
    float _228 = _216;
    float _230 = 0.0;
    if (!_210)
    {
        _230 = 0.0;
    }
    float _232 = _230;
    bool _234 = _208 > 0.0;
    float _236 = in.m_44.x;
    float _238 = in.m_44.y;
    float _240 = in.m_44.z;
    float _242 = 0.0;
    float _244 = _232;
    if (!_210)
    {
        _242 = 0.0;
    }
    float _246 = _242;
    float _248 = 0.0;
    float _250 = 0.0;
    float _252 = _246;
    if (!_212)
    {
        _248 = 0.0;
        _250 = 0.0;
    }
    float _254 = _248;
    float _256 = _250;
    float _258 = 0.0;
    float _260 = _254;
    float _262 = _256;
    if (_212)
    {
        float _264 = rsqrt(_198);
        _258 = _264;
    }
    float _266 = _258;
    if (!_172)
    {
        float _268 = _156 * _156;
        float _270 = _268 * 0.5;
        _218 = _270;
    }
    float _272 = _218;
    float _274 = 0.0;
    float _276 = _272;
    if (!_210)
    {
        _274 = 0.0;
    }
    float _278 = _274;
    float _280 = 0.0;
    float _282 = _278;
    if (!_212)
    {
        _280 = 0.0;
    }
    float _284 = _280;
    float _286 = _284;
    if (!_172)
    {
        float _288 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _276 = _288;
    }
    float _290 = _276;
    float _292 = 0.0;
    float _294 = _290;
    if (_234)
    {
        float _296 = rsqrt(_204);
        _292 = _296;
    }
    float _298 = _292;
    if (_210)
    {
        float _300 = _228 * _158;
        _244 = _300;
    }
    float _302 = _244;
    if (_210)
    {
        float _304 = _228 * _150;
        _252 = _304;
    }
    float _306 = _252;
    float _308 = _306;
    if (_210)
    {
        float _310 = _228 * _174;
        _282 = _310;
    }
    float _312 = _282;
    if (!_234)
    {
        _220 = 0.0;
    }
    float _314 = _220;
    float _316 = _314;
    if (_212)
    {
        float _318 = _266 * _160;
        _286 = _318;
    }
    float _320 = _286;
    if (_212)
    {
        float _322 = _266 * _152;
        _260 = _322;
    }
    float _324 = _260;
    if (_212)
    {
        float _326 = _266 * _176;
        _262 = _326;
    }
    float _328 = _262;
    bool _330 = !_172;
    if (!_330)
    {
        float _332 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _334 = log2(_332);
        float _336 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _338 = _336 + 1.0;
        float _340 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _342 = _156 * _334;
        float _344 = 1.0 / _338;
        float _346 = _340 * 0.693147182464599609375;
        float _348 = exp2(_342);
        float _350 = 1.0 / _346;
        float _352 = _348 + (-1.0);
        float _354 = -_352;
        float _356 = fma(_354, _350, _156);
        float _358 = _356 * _344;
        float _360 = _358 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _294 = _360;
        _222 = _350;
    }
    float _362 = _294;
    float _364 = _222;
    float _366 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _368 = _364;
    float _370 = _362;
    if (_234)
    {
        float _372 = _298 * _154;
        _316 = _372;
    }
    float _374 = _316;
    float _376 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    if (!_234)
    {
        _368 = 0.0;
    }
    float _378 = _368;
    float _380 = _366 * _306;
    float _382 = _366 * _324;
    float _384 = _366 * _374;
    float _386 = _378;
    if (_234)
    {
        float _388 = _298 * _162;
        _386 = _388;
    }
    float _390 = _386;
    float _392 = fma(_376, _302, _380);
    float _394 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_234)
    {
        _308 = 0.0;
    }
    float _396 = _308;
    float _398 = _396;
    if (_234)
    {
        float _400 = _298 * _178;
        _398 = _400;
    }
    float _402 = _398;
    float _404 = fma(_376, _320, _382);
    float _406 = fma(_376, _390, _384);
    float _408 = fma(_394, _312, _392);
    if (!_172)
    {
        _370 = _156;
    }
    float _410 = _370;
    bool _412 = !_172;
    float _414 = _410;
    if (!_412)
    {
        float _416 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _418 = log2(_416);
        float _420 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _422 = _420 + 1.0;
        float _424 = 1.0 / _422;
        float _426 = _156 * _418;
        float _428 = exp2(_426);
        float _430 = -_428;
        float _432 = _430 + 1.0;
        float _434 = _432 * _424;
        _414 = _434;
    }
    float _436 = _414;
    bool _438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _440 = fma(_394, _328, _404);
    float _442 = fma(_394, _402, _406);
    float _444 = fma(_436, _180, _408);
    float _446 = fma(_436, _182, _440);
    float _448 = fma(_436, _184, _442);
    float _450 = fma(_444, _214, _236);
    float _452 = fma(_446, _214, _238);
    float _454 = fma(_448, _214, _240);
    bool _456 = !_438;
    float _474;
    if (!_456)
    {
        float _458 = in.m_59.x;
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _462 = _458 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _466 = _464 * _460;
        float _468 = floor(_466);
        float _470 = -_468;
        float _472 = _466 + _470;
        _474 = _472;
        _476 = true;
    }
    else
    {
        float _478 = float(_96);
        float _480 = 1.0 / _478;
        float _482 = _130 * _480;
        _474 = _482;
    }
    _476 = false;
    float _484 = _474;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _488 = _484 + _486;
    bool _490 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _492 = isnan(_484);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _502;
    float _506 = 1.0 / _504;
    bool _508 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _510 = isnan(_484);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -_500;
    float _522 = _520 + 1.0;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _528;
    bool _532 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _534;
    float _538 = _518 * _522;
    float _540 = -_518;
    float _542 = _540 + 1.0;
    float _544 = _488 * _506;
    float _546 = in.m_57.x;
    float _548 = in.m_57.y;
    float _550 = in.m_57.z;
    float _552 = fma(_526, _544, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _554 = fma(_536, _544, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _556 = fma(_530, _544, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _558 = _552 * _538;
    float _560 = _554 * _538;
    float _562 = _556 * _538;
    float _564 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[143].x, _558);
    float _566 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[143].y, _560);
    float _568 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[143].z, _562);
    float _570 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[144].x, _564);
    float _572 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[144].y, _566);
    float _574 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[144].z, _568);
    float _576 = _570 * _546;
    float _578 = _572 * _548;
    float _580 = _574 * _550;
    bool _582 = !_532;
    float _584 = _580;
    float _602;
    if (!_582)
    {
        float _586 = in.m_59.x;
        float _588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _590 = _586 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _594 = _592 * _588;
        float _596 = floor(_594);
        float _598 = -_596;
        float _600 = _594 + _598;
        _602 = _600;
        _604 = true;
    }
    else
    {
        float _606 = float(_96);
        float _608 = 1.0 / _606;
        float _610 = _130 * _608;
        _602 = _610;
    }
    _604 = false;
    float _612 = _602;
    float _614 = in.m_59.w;
    float _616 = _452 * _160;
    float _618 = _452 * _152;
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _622 = _620 != 0;
    float _624 = _452 * _176;
    float _626 = in.m_61.y;
    float _628 = fma(_450, _150, _618);
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _632 = _630 != 0;
    float _634 = in.m_51.w;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _638 = _636 != 0;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _644 = fma(_450, _158, _616);
    float _646 = fma(_450, _174, _624);
    float _648 = in.m_63.w;
    float _650 = 1.0 / _642;
    float _652 = fma(_454, _162, _644);
    float _654 = _160;
    if (!_622)
    {
        float _656 = in.m_59.y;
        _654 = _656;
    }
    float _658 = _654;
    float _660 = fma(_454, _178, _646);
    float _662 = fma(_454, _154, _628);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _664;
    float _668 = in.m_53.w;
    bool _670 = _614 > 0.5;
    float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _676 = _674 != 0;
    float _678 = in.m_61.x;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _682 = _612 + _680;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _686 = _684 != 0;
    float _688 = -_626;
    float _690 = _688 + 1.0;
    float _692 = _156;
    bool _694 = _670;
    float _696 = _626;
    if (_632)
    {
        float _698 = in.m_59.x;
        _692 = _698;
    }
    float _700 = _692;
    float _702 = _666 * _650;
    bool _704 = _612 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _706 = isnan(_612);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = _662 + _634;
    float _718 = _312;
    float _720 = _634;
    if (_638)
    {
        float _722 = in.m_59.z;
        _718 = _722;
    }
    float _724 = _718;
    float _726 = _670 ? _690 : _626;
    float _728 = fma(_702, _682, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _730 = _612 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _732 = isnan(_612);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    float _742 = _178;
    float _744 = _726;
    float _746 = _728;
    if (!_622)
    {
        float _748 = in.m_59.z;
        _742 = _748;
    }
    float _750 = _742;
    float _752 = -_714;
    float _754 = _752 + 1.0;
    float _756 = _676 ? _726 : _626;
    float _758 = _672 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _760 = as_type<int>(_668);
    float _762 = _758;
    if (!_622)
    {
        _224 = _658;
    }
    float _764 = _224;
    float _766 = _740 * _754;
    out.m_65.w = _648;
    float _768 = -_740;
    float _770 = _768 + 1.0;
    float _772 = _652 + _668;
    float _774 = _728 * _766;
    float _776 = _764;
    float _778 = _658;
    int _780 = as_type<int>(_766);
    if (_622)
    {
        float _782 = in.m_59.x;
        float _784 = in.m_59.y;
        _776 = _782;
        _778 = _784;
    }
    float _786 = _776;
    float _788 = _778;
    float _790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (!_632)
    {
        _720 = _678;
    }
    float _792 = _720;
    float _794 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[115].x, _774);
    float _796 = in.m_55.w;
    float _798 = _792;
    if (!_632)
    {
        _744 = _792;
    }
    float _800 = _744;
    float _802 = _800;
    if (_632)
    {
        _798 = _678;
    }
    float _804 = _798;
    float _806 = fma(_758, _756, -0.5);
    float _808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _810 = false;
    if (_632)
    {
        bool _812 = _700 > 0.5;
        _810 = _812;
    }
    bool _814 = _810;
    if (_632)
    {
        float _816 = -_804;
        float _818 = _816 + 1.0;
        _780 = as_type<int>(_818);
    }
    int _820 = _780;
    if (_638)
    {
        float _822 = -_804;
        float _824 = _822 + 1.0;
        _760 = as_type<int>(_824);
    }
    int _826 = _760;
    if (_638)
    {
        bool _828 = _724 > 0.5;
        _694 = _828;
    }
    bool _830 = _694;
    float _832 = _750;
    if (!_622)
    {
        _762 = _750;
    }
    float _834 = _762;
    float _836 = _834;
    if (!_638)
    {
        _746 = _804;
    }
    float _838 = _746;
    float _840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _842 = _838;
    if (_632)
    {
        float _844 = _814 ? as_type<float>(_820) : _804;
        _802 = _844;
    }
    float _846 = _802;
    if (_638)
    {
        float _848 = _830 ? as_type<float>(_826) : _804;
        _842 = _848;
    }
    float _850 = _842;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _854 = _716 + _852;
    if (_622)
    {
        _836 = _788;
    }
    float _856 = _836;
    if (_622)
    {
        _832 = _788;
    }
    float _858 = _832;
    float _860 = _660 + _796;
    bool _862 = _788 > 0.5;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _866 = _854 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _868 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[83].z, _864);
    float _870 = _786 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_686)
    {
        float _874 = _862 ? _690 : _626;
        _696 = _874;
    }
    float _876 = _696;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _880 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _882 = _772 + _880;
    float _884 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[83].w, _872);
    float _886 = _808 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _888 = -_878;
    float _890 = fma(_870, 2.0, _888);
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _894 = _860 + _892;
    float _896 = fma(_886, _850, -0.5);
    float _898 = _856 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _900 = -_130;
    float _902 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[81].x, _890);
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _906 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _868);
    float _908 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[28].x, _866);
    float _910 = _876 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _912 = fma(_898, -2.0, _904);
    float _914 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _884);
    float _916 = fma(_906, _896, _902);
    float _918 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[28].z, _908);
    float _920 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _912);
    float _922 = _910 * _790;
    float _924 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[116].x, _794);
    float _926 = _846 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _928 = -_920;
    float _930 = fma(_914, _806, _928);
    float _932 = _854 * _854;
    bool _934 = _918 >= 0.0;
    float _936 = _576 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _938 = fma(_882, _882, _932);
    float _940 = _926 * _840;
    float _942 = fma(_894, _894, _938);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _948 = rsqrt(_942);
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_934)
    {
        _952 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _954 = _952;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _962 = _936 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _966 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _972 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _974 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _924 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _980 = _916 + 0.5;
    float _982 = _930 + 0.5;
    int _984 = as_type<int>(_954);
    if (_934)
    {
        float _986 = _954 * 5.0;
        _984 = as_type<int>(_986);
    }
    int _988 = _984;
    float _990 = _962 * _948;
    out.m_67.x = _972;
    out.m_67.y = _974;
    out.m_67.z = _976;
    out.m_67.w = _964;
    float _992 = _882 * _990;
    out.m_69.x = _966;
    out.m_69.y = _968;
    out.m_69.z = _970;
    out.m_69.w = _978;
    float _994 = _854 * _990;
    out.m_71.x = _940;
    out.m_71.y = _922;
    out.m_71.z = _980;
    out.m_71.w = _982;
    int _996 = _988;
    if (_934)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3201 = as_type<float>(_988);
        out.gl_Position.z = _3201;
    }
    if (_934)
    {
        out.m_47.x = 0.0;
    }
    if (_934)
    {
        return out;
    }
    float _998 = -_994;
    float _1000 = _716 + _998;
    float _1002 = _894 * _990;
    float _1004 = -_992;
    float _1006 = _772 + _1004;
    float _1008 = -_994;
    float _1010 = _854 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1014 = _1000 + _1012;
    float _1016 = -_1002;
    float _1018 = _860 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1022 = _1006 + _1020;
    float _1024 = -_992;
    float _1026 = _882 + _1024;
    float _1028 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1030 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1032 = _1018 + _1030;
    float _1034 = _1010 * _1010;
    float _1036 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1028);
    float _1038 = -_1002;
    float _1040 = _894 + _1038;
    float _1042 = fma(_1026, _1026, _1034);
    float _1044 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1036);
    float _1046 = fma(_1040, _1040, _1042);
    bool _1048 = _1044 >= 0.0;
    float _1050 = _1022;
    if (_1048)
    {
        _1050 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1052 = _1050;
    if (_1048)
    {
        out.m_47.x = 0.0;
    }
    if (_1048)
    {
        float _1054 = _1052 * 5.0;
        _996 = as_type<int>(_1054);
    }
    int _1056 = _996;
    if (_1048)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3313 = as_type<float>(_1056);
        out.gl_Position.z = _3313;
    }
    if (_1048)
    {
        return out;
    }
    float _1058 = in.m_73.x;
    float _1060 = in.m_73.y;
    float _1062 = in.m_73.z;
    float _1064 = sqrt(_1046);
    float _1066 = _578 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1068 = _948 * _1064;
    float _1070 = _1068 * _1066;
    float _1072 = _936 * _1068;
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1060);
    float _1076 = _580 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1078 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1058);
    float _1080 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1062);
    float _1082 = _1070 * _1074;
    float _1084 = _1068 * _1076;
    float _1086 = _1072 * _1078;
    float _1088 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1090 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1092 = _1084 * _1080;
    float _1094 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1096 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1088);
    float _1098 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1090);
    float _1100 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1094);
    float _1102 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1096);
    float _1104 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1098);
    float _1106 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1100);
    float _1108 = _1102 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1110 = _1104 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1112 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1114 = _772 + _1108;
    float _1116 = _860 + _1110;
    float _1118 = _716 + _1112;
    float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1122 = _1114 + _1120;
    float _1124 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1126 = _1116 + _1124;
    float _1128 = _1122 * _1122;
    float _1130 = _1126 * _1126;
    float _1132 = _1128 + _1130;
    float _1134 = sqrt(_1132);
    bool _1136 = _1134 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1138 = _1112;
    float _1140 = _1086;
    float _1142 = _1114;
    float _1144 = _1092;
    float _1146 = _1130;
    if (!_1136)
    {
        _1138 = _1114;
    }
    float _1148 = _1138;
    float _1150 = _1148;
    if (!_1136)
    {
        _1140 = _1128;
    }
    float _1152 = _1140;
    float _1154 = _1152;
    if (!_1136)
    {
        _1142 = _1116;
    }
    float _1156 = _1142;
    float _1158 = _1156;
    if (!_1136)
    {
        _1144 = _1118;
    }
    float _1160 = _1144;
    bool _1162 = !_1136;
    float _1164 = _1160;
    if (!_1162)
    {
        float _1166 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1170 = _1134 + _1168;
        float _1172 = _1118 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1174 = rsqrt(_1132);
        float _1176 = _1170 * _1166;
        float _1178 = _1176 * 0.15915493667125701904296875;
        float _1180 = _1178 * 6.283185482025146484375;
        float _1182 = sin(_1180);
        float _1184 = _1178 * 6.283185482025146484375;
        float _1186 = cos(_1184);
        float _1188 = fma(_1182, _1172, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1190 = _1174 * _1188;
        float _1192 = _1186 + (-1.0);
        float _1194 = fma(_1122, _1190, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1196 = fma(_1126, _1190, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1198 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1202 = _1194 + _1200;
        float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1206 = _1196 + _1204;
        float _1208 = fma(_1118, _1186, _1198);
        float _1210 = _1202 * _1202;
        float _1212 = _1206 * _1206;
        _1164 = _1208;
        _1154 = _1210;
        _1146 = _1212;
        _1150 = _1194;
        _1158 = _1196;
    }
    float _1214 = _1164;
    float _1216 = _1154;
    float _1218 = _1146;
    float _1220 = _1150;
    float _1222 = _1158;
    float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1226 = _1214 + _1224;
    float _1228 = fma(_1226, _1226, _1216);
    float _1230 = _1228 + _1218;
    float _1232 = sqrt(_1230);
    bool _1234 = _1232 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1236 = isnan(_1232);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1242 = _1238 || _1240;
    float _1244 = _1216;
    if (!_1242)
    {
        _1244 = 1.0;
    }
    float _1246 = _1244;
    bool _1248 = !_1242;
    float _1250 = _1246;
    if (!_1248)
    {
        bool _1252 = _1232 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1254 = isnan(_1232);
        bool _1256 = _1252 || _1254;
        bool _1258 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1260 = _1256 || _1258;
        if (!_1260)
        {
            float _1262 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1264 = _1232 + _1262;
            float _1266 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1268 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1266;
            float _1270 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1272 = _1270 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1274 = 1.0 / _1268;
            float _1276 = _1264 * _1274;
            float _1278 = fma(_1276, _1272, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1250 = _1278;
            _1280 = true;
        }
        else
        {
            bool _1282 = _1232 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1284 = isnan(_1232);
            bool _1286 = _1282 || _1284;
            bool _1288 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1290 = _1286 || _1288;
            if (!_1290)
            {
                float _1292 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1294 = _1232 + _1292;
                float _1296 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1298 = _1296 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1300 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1302 = _1300 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1304 = 1.0 / _1298;
                float _1306 = _1294 * _1304;
                float _1308 = fma(_1306, _1302, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1250 = _1308;
                _1280 = true;
            }
            else
            {
                _1250 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1280 = false;
    float _1310 = _1250;
    float _1312 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1314 = _1214 + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1318 = _1220 + _1316;
    float _1320 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1322 = _1222 + _1320;
    float _1324 = fma(_1314, _1310, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1326 = fma(_1318, _1310, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1328 = fma(_1322, _1310, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1330 = -_994;
    float _1332 = _1330 + _1324;
    float _1334 = -_992;
    float _1336 = _1334 + _1326;
    float _1338 = -_1002;
    float _1340 = _1338 + _1328;
    float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1344 = _1332 + _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1348 = _1336 + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1352 = _1340 + _1350;
    float _1354 = _1344 * _1344;
    float _1356 = fma(_1348, _1348, _1354);
    float _1358 = fma(_1352, _1352, _1356);
    float _1360 = rsqrt(_1358);
    float _1362 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1364 = _1348 * _1362;
    float _1366 = _1352 * _1362;
    float _1368 = _1364 * _1364;
    float _1370 = _1366 * _1366;
    float _1372 = _1368 + _1370;
    float _1374 = sqrt(_1372);
    bool _1376 = _1374 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1378 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1380 = _1374 + _1378;
    float _1382 = _1360;
    float _1384 = _1372;
    float _1386 = _1380;
    float _1388 = _1314;
    float _1390 = _1344;
    float _1392 = _1364;
    if (_1376)
    {
        float _1394 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1382 = _1394;
    }
    float _1396 = _1382;
    if (_1376)
    {
        float _1398 = rsqrt(_1372);
        _1384 = _1398;
    }
    float _1400 = _1384;
    if (_1376)
    {
        float _1402 = _1380 * _1396;
        _1386 = _1402;
    }
    float _1404 = _1386;
    if (_1376)
    {
        float _1406 = _1404 * 0.15915493667125701904296875;
        _1388 = _1406;
    }
    float _1408 = _1388;
    float _1410 = _1396;
    float _1412 = _1408;
    if (_1376)
    {
        float _1414 = _1408 * 6.283185482025146484375;
        float _1416 = sin(_1414);
        _1410 = _1416;
    }
    float _1418 = _1410;
    float _1420 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1422 = precise::max(0.0, _1420);
    float _1424 = _1352;
    float _1426 = _1422;
    if (_1376)
    {
        float _1428 = _1408 * 6.283185482025146484375;
        float _1430 = cos(_1428);
        _1424 = _1430;
    }
    float _1432 = _1424;
    float _1434 = -_1362;
    float _1436 = -_1422;
    float _1438 = fma(_1344, _1434, _1436);
    float _1440 = _1438;
    if (!_1376)
    {
        _1390 = _1366;
    }
    float _1442 = _1390;
    float _1444 = _1442;
    if (_1376)
    {
        float _1446 = _1438 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1426 = _1446;
    }
    float _1448 = _1426;
    float _1450 = _1418;
    float _1452 = _1448;
    if (_1376)
    {
        float _1454 = fma(_1418, _1448, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1450 = _1454;
    }
    float _1456 = _1450;
    float _1458 = _1456;
    if (_1376)
    {
        float _1460 = _1432 + (-1.0);
        _1452 = _1460;
    }
    float _1462 = _1452;
    float _1464 = _1462;
    if (_1376)
    {
        float _1466 = _1400 * _1456;
        _584 = _1466;
    }
    float _1468 = _584;
    if (!_1376)
    {
        _1458 = _1368;
    }
    float _1470 = _1458;
    float _1472 = sqrt(_1358);
    float _1474 = _1470;
    if (_1376)
    {
        float _1476 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1412 = _1476;
    }
    float _1478 = _1412;
    if (_1376)
    {
        float _1480 = _1364 * _1468;
        _1392 = _1480;
    }
    float _1482 = _1392;
    if (_1376)
    {
        float _1484 = _1366 * _1468;
        _1444 = _1484;
    }
    float _1486 = _1444;
    if (!_1376)
    {
        _1464 = _1370;
    }
    float _1488 = _1464;
    float _1490 = _1488;
    if (_1376)
    {
        float _1492 = fma(_1438, _1432, _1478);
        _1440 = _1492;
    }
    float _1494 = _1440;
    if (_1376)
    {
        float _1496 = _1482 * _1482;
        _1474 = _1496;
    }
    float _1498 = _1474;
    if (_1376)
    {
        float _1500 = _1486 * _1486;
        _1490 = _1500;
    }
    float _1502 = _1490;
    float _1504 = fma(_1494, _1494, _1498);
    float _1506 = _1504 + _1502;
    float _1508 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1512 = fma(_1472, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1510);
    float _1514 = precise::clamp(_1512, 0.0, 1.0);
    float _1516 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1518 = rsqrt(_1506);
    float _1520 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1508);
    float _1522 = -_1514;
    float _1524 = _1522 + 1.0;
    float _1526 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1528 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1516);
    float _1530 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1520);
    float _1532 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1534 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1526);
    float _1536 = abs(_1524);
    float _1538 = log2(_1536);
    float _1540 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1542 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1528);
    float _1544 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1546 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1532);
    float _1548 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1550 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1534);
    float _1552 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1554 = _1518 * _1482;
    float _1556 = -_1548;
    float _1558 = fma(_1556, _1544, 1.0);
    float _1560 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1546);
    float _1562 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1564 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1566 = _1518 * _1494;
    float _1568 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1570 = _1518 * _1486;
    float _1572 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1564);
    float _1574 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1576 = -_1568;
    float _1578 = fma(_1566, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1576);
    float _1580 = _1560 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1582 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1572);
    float _1584 = log2(_1558);
    float _1586 = -_1570;
    float _1588 = fma(_1586, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1578);
    float _1590 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1592 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1582);
    float _1594 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1596 = fma(_1588, -0.5, 0.5);
    float _1598 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1590);
    float _1600 = fma(_1588, 0.5, 0.5);
    float _1602 = exp2(_1574);
    float _1604 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1594);
    float _1606 = _1566 + 1.0;
    float _1608 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1598);
    float _1610 = fma(_1600, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1612 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1604);
    float _1614 = 1.0 / _1592;
    float _1616 = sqrt(_1596);
    float _1618 = -_1566;
    float _1620 = fma(_1602, _1606, _1618);
    float _1622 = fma(_1600, _1610, -0.212114393711090087890625);
    float _1624 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1608);
    float _1626 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1612);
    float _1628 = _1584 * 0.693147182464599609375;
    float _1630 = fma(_1600, _1622, 1.570728778839111328125);
    float _1632 = fma(_1620, 0.5, 0.5);
    float _1634 = _1624 * _1614;
    float _1636 = _1626 * _1614;
    float _1638 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1640 = fma(_1634, 0.5, 0.5);
    float _1642 = fma(_1636, -0.5, 0.5);
    float _1644 = _1616 * 0.636619746685028076171875;
    float _1646 = -_1630;
    float _1648 = fma(_1644, _1646, 1.0);
    float3 _4293 = float3(_1640, _1642, _1638);
    float _1650 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4293, float3(0.0), isnan(_4293)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4293, float3(0.0), isnan(_4293)), level(0.0)).x;
    float3 _4304 = float3(_1640, _1642, _1638);
    float4 _1653 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4304, float3(0.0), isnan(_4304)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4304, float3(0.0), isnan(_4304)), level(0.0)).xyzw;
    float _1655 = _1653.x;
    float _1657 = _1653.y;
    float _1659 = _1653.z;
    float _1661 = _1653.w;
    float2 _4321 = float2(_1648, _1632);
    float3 _1665 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4321, float2(0.0), isnan(_4321)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4321, float2(0.0), isnan(_4321)), level(0.0)).xyz;
    float _1667 = _1665.x;
    float _1669 = _1665.y;
    float _1671 = _1665.z;
    float _1673 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1675 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1677 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1675);
    float _1679 = exp2(_1673);
    float _1681 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1677);
    float _1683 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1681);
    float _1685 = _1683 + _1592;
    out.gl_Position.x = _1624;
    out.gl_Position.y = _1626;
    out.gl_Position.z = _1683;
    out.gl_Position.w = _1592;
    float _1687 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1689 = _1685 * 0.5;
    float _1691 = -_1679;
    float _1693 = _1691 + 1.0;
    out.m_47.x = _1687;
    float _1695 = _1693 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.z = _1689;
    out.m_75.w = _1592;
    float _1697 = _1695 * _1650;
    float _1699 = -_1695;
    float _1701 = _1699 + 1.0;
    float _1703 = _1661 * _1697;
    float _1705 = _1671 * _1697;
    float _1707 = _1661 * _1701;
    float _1709 = fma(_1667, _1703, _1655);
    float _1711 = fma(_1669, _1703, _1657);
    float _1713 = fma(_1661, _1705, _1659);
    out.m_77.x = _1709;
    out.m_77.y = _1711;
    out.m_77.z = _1713;
    out.m_77.w = _1707;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1280 = false;
    bool _604 = false;
    bool _476 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_44.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_47.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1770 = as_type<float>(_112);
        out.gl_Position.z = _1770;
    }
    if (!_100)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _116 = in.m_49.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_126)
    {
        float _132 = float(_96);
        _106 = _132;
    }
    float _134 = _106;
    bool _136 = _130 >= _134;
    bool _138 = !_126;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _114 = as_type<int>(_146);
    }
    int _148 = _114;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1839 = as_type<float>(_148);
        out.gl_Position.z = _1839;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = in.m_51.z;
    float _156 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_53.x;
    float _160 = in.m_53.y;
    float _162 = in.m_53.z;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = in.m_49.x;
    float _182 = in.m_49.y;
    float _184 = in.m_49.z;
    float _186 = _150 * _150;
    float _188 = _152 * _152;
    float _190 = fma(_158, _158, _186);
    float _192 = fma(_160, _160, _188);
    float _194 = fma(_174, _174, _190);
    float _196 = _154 * _154;
    float _198 = fma(_176, _176, _192);
    float _200 = sqrt(_194);
    float _202 = fma(_162, _162, _196);
    float _204 = fma(_178, _178, _202);
    float _206 = sqrt(_198);
    float _208 = sqrt(_204);
    bool _210 = _200 > 0.0;
    bool _212 = _206 > 0.0;
    float _214 = in.m_57.w;
    float _216 = 0.0;
    float _218 = _194;
    float _220 = _198;
    float _222 = _204;
    float _224 = _158;
    if (_210)
    {
        float _226 = rsqrt(_194);
        _216 = _226;
    }
    float _228 = _216;
    float _230 = 0.0;
    if (!_210)
    {
        _230 = 0.0;
    }
    float _232 = _230;
    bool _234 = _208 > 0.0;
    float _236 = in.m_44.x;
    float _238 = in.m_44.y;
    float _240 = in.m_44.z;
    float _242 = 0.0;
    float _244 = _232;
    if (!_210)
    {
        _242 = 0.0;
    }
    float _246 = _242;
    float _248 = 0.0;
    float _250 = 0.0;
    float _252 = _246;
    if (!_212)
    {
        _248 = 0.0;
        _250 = 0.0;
    }
    float _254 = _248;
    float _256 = _250;
    float _258 = 0.0;
    float _260 = _254;
    float _262 = _256;
    if (_212)
    {
        float _264 = rsqrt(_198);
        _258 = _264;
    }
    float _266 = _258;
    if (!_172)
    {
        float _268 = _156 * _156;
        float _270 = _268 * 0.5;
        _218 = _270;
    }
    float _272 = _218;
    float _274 = 0.0;
    float _276 = _272;
    if (!_210)
    {
        _274 = 0.0;
    }
    float _278 = _274;
    float _280 = 0.0;
    float _282 = _278;
    if (!_212)
    {
        _280 = 0.0;
    }
    float _284 = _280;
    float _286 = _284;
    if (!_172)
    {
        float _288 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _276 = _288;
    }
    float _290 = _276;
    float _292 = 0.0;
    float _294 = _290;
    if (_234)
    {
        float _296 = rsqrt(_204);
        _292 = _296;
    }
    float _298 = _292;
    if (_210)
    {
        float _300 = _228 * _158;
        _244 = _300;
    }
    float _302 = _244;
    if (_210)
    {
        float _304 = _228 * _150;
        _252 = _304;
    }
    float _306 = _252;
    float _308 = _306;
    if (_210)
    {
        float _310 = _228 * _174;
        _282 = _310;
    }
    float _312 = _282;
    if (!_234)
    {
        _220 = 0.0;
    }
    float _314 = _220;
    float _316 = _314;
    if (_212)
    {
        float _318 = _266 * _160;
        _286 = _318;
    }
    float _320 = _286;
    if (_212)
    {
        float _322 = _266 * _152;
        _260 = _322;
    }
    float _324 = _260;
    if (_212)
    {
        float _326 = _266 * _176;
        _262 = _326;
    }
    float _328 = _262;
    bool _330 = !_172;
    if (!_330)
    {
        float _332 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _334 = log2(_332);
        float _336 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _338 = _336 + 1.0;
        float _340 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _342 = _156 * _334;
        float _344 = 1.0 / _338;
        float _346 = _340 * 0.693147182464599609375;
        float _348 = exp2(_342);
        float _350 = 1.0 / _346;
        float _352 = _348 + (-1.0);
        float _354 = -_352;
        float _356 = fma(_354, _350, _156);
        float _358 = _356 * _344;
        float _360 = _358 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _294 = _360;
        _222 = _350;
    }
    float _362 = _294;
    float _364 = _222;
    float _366 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _368 = _364;
    float _370 = _362;
    if (_234)
    {
        float _372 = _298 * _154;
        _316 = _372;
    }
    float _374 = _316;
    float _376 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    if (!_234)
    {
        _368 = 0.0;
    }
    float _378 = _368;
    float _380 = _366 * _306;
    float _382 = _366 * _324;
    float _384 = _366 * _374;
    float _386 = _378;
    if (_234)
    {
        float _388 = _298 * _162;
        _386 = _388;
    }
    float _390 = _386;
    float _392 = fma(_376, _302, _380);
    float _394 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_234)
    {
        _308 = 0.0;
    }
    float _396 = _308;
    float _398 = _396;
    if (_234)
    {
        float _400 = _298 * _178;
        _398 = _400;
    }
    float _402 = _398;
    float _404 = fma(_376, _320, _382);
    float _406 = fma(_376, _390, _384);
    float _408 = fma(_394, _312, _392);
    if (!_172)
    {
        _370 = _156;
    }
    float _410 = _370;
    bool _412 = !_172;
    float _414 = _410;
    if (!_412)
    {
        float _416 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _418 = log2(_416);
        float _420 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _422 = _420 + 1.0;
        float _424 = 1.0 / _422;
        float _426 = _156 * _418;
        float _428 = exp2(_426);
        float _430 = -_428;
        float _432 = _430 + 1.0;
        float _434 = _432 * _424;
        _414 = _434;
    }
    float _436 = _414;
    bool _438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _440 = fma(_394, _328, _404);
    float _442 = fma(_394, _402, _406);
    float _444 = fma(_436, _180, _408);
    float _446 = fma(_436, _182, _440);
    float _448 = fma(_436, _184, _442);
    float _450 = fma(_444, _214, _236);
    float _452 = fma(_446, _214, _238);
    float _454 = fma(_448, _214, _240);
    bool _456 = !_438;
    float _474;
    if (!_456)
    {
        float _458 = in.m_59.x;
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _462 = _458 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _466 = _464 * _460;
        float _468 = floor(_466);
        float _470 = -_468;
        float _472 = _466 + _470;
        _474 = _472;
        _476 = true;
    }
    else
    {
        float _478 = float(_96);
        float _480 = 1.0 / _478;
        float _482 = _130 * _480;
        _474 = _482;
    }
    _476 = false;
    float _484 = _474;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _488 = _484 + _486;
    bool _490 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _492 = isnan(_484);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _502;
    float _506 = 1.0 / _504;
    bool _508 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _510 = isnan(_484);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -_500;
    float _522 = _520 + 1.0;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _528;
    bool _532 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _534;
    float _538 = _518 * _522;
    float _540 = -_518;
    float _542 = _540 + 1.0;
    float _544 = _488 * _506;
    float _546 = in.m_57.x;
    float _548 = in.m_57.y;
    float _550 = in.m_57.z;
    float _552 = fma(_526, _544, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _554 = fma(_536, _544, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _556 = fma(_530, _544, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _558 = _552 * _538;
    float _560 = _554 * _538;
    float _562 = _556 * _538;
    float _564 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[143].x, _558);
    float _566 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[143].y, _560);
    float _568 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[143].z, _562);
    float _570 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[144].x, _564);
    float _572 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[144].y, _566);
    float _574 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[144].z, _568);
    float _576 = _570 * _546;
    float _578 = _572 * _548;
    float _580 = _574 * _550;
    bool _582 = !_532;
    float _584 = _580;
    float _602;
    if (!_582)
    {
        float _586 = in.m_59.x;
        float _588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _590 = _586 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _594 = _592 * _588;
        float _596 = floor(_594);
        float _598 = -_596;
        float _600 = _594 + _598;
        _602 = _600;
        _604 = true;
    }
    else
    {
        float _606 = float(_96);
        float _608 = 1.0 / _606;
        float _610 = _130 * _608;
        _602 = _610;
    }
    _604 = false;
    float _612 = _602;
    float _614 = in.m_59.w;
    float _616 = _452 * _160;
    float _618 = _452 * _152;
    int _620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _622 = _620 != 0;
    float _624 = _452 * _176;
    float _626 = in.m_61.y;
    float _628 = fma(_450, _150, _618);
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _632 = _630 != 0;
    float _634 = in.m_51.w;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _638 = _636 != 0;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _644 = fma(_450, _158, _616);
    float _646 = fma(_450, _174, _624);
    float _648 = in.m_63.w;
    float _650 = 1.0 / _642;
    float _652 = fma(_454, _162, _644);
    float _654 = _160;
    if (!_622)
    {
        float _656 = in.m_59.y;
        _654 = _656;
    }
    float _658 = _654;
    float _660 = fma(_454, _178, _646);
    float _662 = fma(_454, _154, _628);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _664;
    float _668 = in.m_53.w;
    bool _670 = _614 > 0.5;
    float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _676 = _674 != 0;
    float _678 = in.m_61.x;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _682 = _612 + _680;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _686 = _684 != 0;
    float _688 = -_626;
    float _690 = _688 + 1.0;
    float _692 = _156;
    bool _694 = _670;
    float _696 = _626;
    if (_632)
    {
        float _698 = in.m_59.x;
        _692 = _698;
    }
    float _700 = _692;
    float _702 = _666 * _650;
    bool _704 = _612 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _706 = isnan(_612);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = _662 + _634;
    float _718 = _312;
    float _720 = _634;
    if (_638)
    {
        float _722 = in.m_59.z;
        _718 = _722;
    }
    float _724 = _718;
    float _726 = _670 ? _690 : _626;
    float _728 = fma(_702, _682, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _730 = _612 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _732 = isnan(_612);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    float _742 = _178;
    float _744 = _726;
    float _746 = _728;
    if (!_622)
    {
        float _748 = in.m_59.z;
        _742 = _748;
    }
    float _750 = _742;
    float _752 = -_714;
    float _754 = _752 + 1.0;
    float _756 = _676 ? _726 : _626;
    float _758 = _672 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _760 = as_type<int>(_668);
    float _762 = _758;
    if (!_622)
    {
        _224 = _658;
    }
    float _764 = _224;
    float _766 = _740 * _754;
    out.m_65.w = _648;
    float _768 = -_740;
    float _770 = _768 + 1.0;
    float _772 = _652 + _668;
    float _774 = _728 * _766;
    float _776 = _764;
    float _778 = _658;
    int _780 = as_type<int>(_766);
    if (_622)
    {
        float _782 = in.m_59.x;
        float _784 = in.m_59.y;
        _776 = _782;
        _778 = _784;
    }
    float _786 = _776;
    float _788 = _778;
    float _790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (!_632)
    {
        _720 = _678;
    }
    float _792 = _720;
    float _794 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[115].x, _774);
    float _796 = in.m_55.w;
    float _798 = _792;
    if (!_632)
    {
        _744 = _792;
    }
    float _800 = _744;
    float _802 = _800;
    if (_632)
    {
        _798 = _678;
    }
    float _804 = _798;
    float _806 = fma(_758, _756, -0.5);
    float _808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _810 = false;
    if (_632)
    {
        bool _812 = _700 > 0.5;
        _810 = _812;
    }
    bool _814 = _810;
    if (_632)
    {
        float _816 = -_804;
        float _818 = _816 + 1.0;
        _780 = as_type<int>(_818);
    }
    int _820 = _780;
    if (_638)
    {
        float _822 = -_804;
        float _824 = _822 + 1.0;
        _760 = as_type<int>(_824);
    }
    int _826 = _760;
    if (_638)
    {
        bool _828 = _724 > 0.5;
        _694 = _828;
    }
    bool _830 = _694;
    float _832 = _750;
    if (!_622)
    {
        _762 = _750;
    }
    float _834 = _762;
    float _836 = _834;
    if (!_638)
    {
        _746 = _804;
    }
    float _838 = _746;
    float _840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _842 = _838;
    if (_632)
    {
        float _844 = _814 ? as_type<float>(_820) : _804;
        _802 = _844;
    }
    float _846 = _802;
    if (_638)
    {
        float _848 = _830 ? as_type<float>(_826) : _804;
        _842 = _848;
    }
    float _850 = _842;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _854 = _716 + _852;
    if (_622)
    {
        _836 = _788;
    }
    float _856 = _836;
    if (_622)
    {
        _832 = _788;
    }
    float _858 = _832;
    float _860 = _660 + _796;
    bool _862 = _788 > 0.5;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _866 = _854 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _868 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[83].z, _864);
    float _870 = _786 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_686)
    {
        float _874 = _862 ? _690 : _626;
        _696 = _874;
    }
    float _876 = _696;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _880 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _882 = _772 + _880;
    float _884 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[83].w, _872);
    float _886 = _808 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _888 = -_878;
    float _890 = fma(_870, 2.0, _888);
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _894 = _860 + _892;
    float _896 = fma(_886, _850, -0.5);
    float _898 = _856 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _900 = -_130;
    float _902 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[81].x, _890);
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _906 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _868);
    float _908 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[28].x, _866);
    float _910 = _876 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _912 = fma(_898, -2.0, _904);
    float _914 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _884);
    float _916 = fma(_906, _896, _902);
    float _918 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[28].z, _908);
    float _920 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _912);
    float _922 = _910 * _790;
    float _924 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[116].x, _794);
    float _926 = _846 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _928 = -_920;
    float _930 = fma(_914, _806, _928);
    float _932 = _854 * _854;
    bool _934 = _918 >= 0.0;
    float _936 = _576 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _938 = fma(_882, _882, _932);
    float _940 = _926 * _840;
    float _942 = fma(_894, _894, _938);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _948 = rsqrt(_942);
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_934)
    {
        _952 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _954 = _952;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _962 = _936 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _966 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _972 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _974 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _924 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _980 = _916 + 0.5;
    float _982 = _930 + 0.5;
    int _984 = as_type<int>(_954);
    if (_934)
    {
        float _986 = _954 * 5.0;
        _984 = as_type<int>(_986);
    }
    int _988 = _984;
    float _990 = _962 * _948;
    out.m_67.x = _972;
    out.m_67.y = _974;
    out.m_67.z = _976;
    out.m_67.w = _964;
    float _992 = _882 * _990;
    out.m_69.x = _966;
    out.m_69.y = _968;
    out.m_69.z = _970;
    out.m_69.w = _978;
    float _994 = _854 * _990;
    out.m_71.x = _940;
    out.m_71.y = _922;
    out.m_71.z = _980;
    out.m_71.w = _982;
    int _996 = _988;
    if (_934)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3201 = as_type<float>(_988);
        out.gl_Position.z = _3201;
    }
    if (_934)
    {
        out.m_47.x = 0.0;
    }
    if (_934)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _998 = -_994;
    float _1000 = _716 + _998;
    float _1002 = _894 * _990;
    float _1004 = -_992;
    float _1006 = _772 + _1004;
    float _1008 = -_994;
    float _1010 = _854 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1014 = _1000 + _1012;
    float _1016 = -_1002;
    float _1018 = _860 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1022 = _1006 + _1020;
    float _1024 = -_992;
    float _1026 = _882 + _1024;
    float _1028 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1030 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1032 = _1018 + _1030;
    float _1034 = _1010 * _1010;
    float _1036 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1028);
    float _1038 = -_1002;
    float _1040 = _894 + _1038;
    float _1042 = fma(_1026, _1026, _1034);
    float _1044 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1036);
    float _1046 = fma(_1040, _1040, _1042);
    bool _1048 = _1044 >= 0.0;
    float _1050 = _1022;
    if (_1048)
    {
        _1050 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1052 = _1050;
    if (_1048)
    {
        out.m_47.x = 0.0;
    }
    if (_1048)
    {
        float _1054 = _1052 * 5.0;
        _996 = as_type<int>(_1054);
    }
    int _1056 = _996;
    if (_1048)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3313 = as_type<float>(_1056);
        out.gl_Position.z = _3313;
    }
    if (_1048)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1058 = in.m_73.x;
    float _1060 = in.m_73.y;
    float _1062 = in.m_73.z;
    float _1064 = sqrt(_1046);
    float _1066 = _578 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1068 = _948 * _1064;
    float _1070 = _1068 * _1066;
    float _1072 = _936 * _1068;
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1060);
    float _1076 = _580 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1078 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1058);
    float _1080 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1062);
    float _1082 = _1070 * _1074;
    float _1084 = _1068 * _1076;
    float _1086 = _1072 * _1078;
    float _1088 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1090 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1092 = _1084 * _1080;
    float _1094 = _1082 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1096 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1088);
    float _1098 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1090);
    float _1100 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1094);
    float _1102 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1096);
    float _1104 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1098);
    float _1106 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1100);
    float _1108 = _1102 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1110 = _1104 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1112 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1114 = _772 + _1108;
    float _1116 = _860 + _1110;
    float _1118 = _716 + _1112;
    float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1122 = _1114 + _1120;
    float _1124 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1126 = _1116 + _1124;
    float _1128 = _1122 * _1122;
    float _1130 = _1126 * _1126;
    float _1132 = _1128 + _1130;
    float _1134 = sqrt(_1132);
    bool _1136 = _1134 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1138 = _1112;
    float _1140 = _1086;
    float _1142 = _1114;
    float _1144 = _1092;
    float _1146 = _1130;
    if (!_1136)
    {
        _1138 = _1114;
    }
    float _1148 = _1138;
    float _1150 = _1148;
    if (!_1136)
    {
        _1140 = _1128;
    }
    float _1152 = _1140;
    float _1154 = _1152;
    if (!_1136)
    {
        _1142 = _1116;
    }
    float _1156 = _1142;
    float _1158 = _1156;
    if (!_1136)
    {
        _1144 = _1118;
    }
    float _1160 = _1144;
    bool _1162 = !_1136;
    float _1164 = _1160;
    if (!_1162)
    {
        float _1166 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1170 = _1134 + _1168;
        float _1172 = _1118 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1174 = rsqrt(_1132);
        float _1176 = _1170 * _1166;
        float _1178 = _1176 * 0.15915493667125701904296875;
        float _1180 = _1178 * 6.283185482025146484375;
        float _1182 = sin(_1180);
        float _1184 = _1178 * 6.283185482025146484375;
        float _1186 = cos(_1184);
        float _1188 = fma(_1182, _1172, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1190 = _1174 * _1188;
        float _1192 = _1186 + (-1.0);
        float _1194 = fma(_1122, _1190, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1196 = fma(_1126, _1190, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1198 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1202 = _1194 + _1200;
        float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1206 = _1196 + _1204;
        float _1208 = fma(_1118, _1186, _1198);
        float _1210 = _1202 * _1202;
        float _1212 = _1206 * _1206;
        _1164 = _1208;
        _1154 = _1210;
        _1146 = _1212;
        _1150 = _1194;
        _1158 = _1196;
    }
    float _1214 = _1164;
    float _1216 = _1154;
    float _1218 = _1146;
    float _1220 = _1150;
    float _1222 = _1158;
    float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1226 = _1214 + _1224;
    float _1228 = fma(_1226, _1226, _1216);
    float _1230 = _1228 + _1218;
    float _1232 = sqrt(_1230);
    bool _1234 = _1232 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1236 = isnan(_1232);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1242 = _1238 || _1240;
    float _1244 = _1216;
    if (!_1242)
    {
        _1244 = 1.0;
    }
    float _1246 = _1244;
    bool _1248 = !_1242;
    float _1250 = _1246;
    if (!_1248)
    {
        bool _1252 = _1232 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1254 = isnan(_1232);
        bool _1256 = _1252 || _1254;
        bool _1258 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1260 = _1256 || _1258;
        if (!_1260)
        {
            float _1262 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1264 = _1232 + _1262;
            float _1266 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1268 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1266;
            float _1270 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1272 = _1270 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1274 = 1.0 / _1268;
            float _1276 = _1264 * _1274;
            float _1278 = fma(_1276, _1272, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1250 = _1278;
            _1280 = true;
        }
        else
        {
            bool _1282 = _1232 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1284 = isnan(_1232);
            bool _1286 = _1282 || _1284;
            bool _1288 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1290 = _1286 || _1288;
            if (!_1290)
            {
                float _1292 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1294 = _1232 + _1292;
                float _1296 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1298 = _1296 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1300 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1302 = _1300 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1304 = 1.0 / _1298;
                float _1306 = _1294 * _1304;
                float _1308 = fma(_1306, _1302, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1250 = _1308;
                _1280 = true;
            }
            else
            {
                _1250 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1280 = false;
    float _1310 = _1250;
    float _1312 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1314 = _1214 + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1318 = _1220 + _1316;
    float _1320 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1322 = _1222 + _1320;
    float _1324 = fma(_1314, _1310, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1326 = fma(_1318, _1310, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1328 = fma(_1322, _1310, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1330 = -_994;
    float _1332 = _1330 + _1324;
    float _1334 = -_992;
    float _1336 = _1334 + _1326;
    float _1338 = -_1002;
    float _1340 = _1338 + _1328;
    float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1344 = _1332 + _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1348 = _1336 + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1352 = _1340 + _1350;
    float _1354 = _1344 * _1344;
    float _1356 = fma(_1348, _1348, _1354);
    float _1358 = fma(_1352, _1352, _1356);
    float _1360 = rsqrt(_1358);
    float _1362 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1364 = _1348 * _1362;
    float _1366 = _1352 * _1362;
    float _1368 = _1364 * _1364;
    float _1370 = _1366 * _1366;
    float _1372 = _1368 + _1370;
    float _1374 = sqrt(_1372);
    bool _1376 = _1374 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1378 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1380 = _1374 + _1378;
    float _1382 = _1360;
    float _1384 = _1372;
    float _1386 = _1380;
    float _1388 = _1314;
    float _1390 = _1344;
    float _1392 = _1364;
    if (_1376)
    {
        float _1394 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1382 = _1394;
    }
    float _1396 = _1382;
    if (_1376)
    {
        float _1398 = rsqrt(_1372);
        _1384 = _1398;
    }
    float _1400 = _1384;
    if (_1376)
    {
        float _1402 = _1380 * _1396;
        _1386 = _1402;
    }
    float _1404 = _1386;
    if (_1376)
    {
        float _1406 = _1404 * 0.15915493667125701904296875;
        _1388 = _1406;
    }
    float _1408 = _1388;
    float _1410 = _1396;
    float _1412 = _1408;
    if (_1376)
    {
        float _1414 = _1408 * 6.283185482025146484375;
        float _1416 = sin(_1414);
        _1410 = _1416;
    }
    float _1418 = _1410;
    float _1420 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1422 = precise::max(0.0, _1420);
    float _1424 = _1352;
    float _1426 = _1422;
    if (_1376)
    {
        float _1428 = _1408 * 6.283185482025146484375;
        float _1430 = cos(_1428);
        _1424 = _1430;
    }
    float _1432 = _1424;
    float _1434 = -_1362;
    float _1436 = -_1422;
    float _1438 = fma(_1344, _1434, _1436);
    float _1440 = _1438;
    if (!_1376)
    {
        _1390 = _1366;
    }
    float _1442 = _1390;
    float _1444 = _1442;
    if (_1376)
    {
        float _1446 = _1438 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1426 = _1446;
    }
    float _1448 = _1426;
    float _1450 = _1418;
    float _1452 = _1448;
    if (_1376)
    {
        float _1454 = fma(_1418, _1448, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1450 = _1454;
    }
    float _1456 = _1450;
    float _1458 = _1456;
    if (_1376)
    {
        float _1460 = _1432 + (-1.0);
        _1452 = _1460;
    }
    float _1462 = _1452;
    float _1464 = _1462;
    if (_1376)
    {
        float _1466 = _1400 * _1456;
        _584 = _1466;
    }
    float _1468 = _584;
    if (!_1376)
    {
        _1458 = _1368;
    }
    float _1470 = _1458;
    float _1472 = sqrt(_1358);
    float _1474 = _1470;
    if (_1376)
    {
        float _1476 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1412 = _1476;
    }
    float _1478 = _1412;
    if (_1376)
    {
        float _1480 = _1364 * _1468;
        _1392 = _1480;
    }
    float _1482 = _1392;
    if (_1376)
    {
        float _1484 = _1366 * _1468;
        _1444 = _1484;
    }
    float _1486 = _1444;
    if (!_1376)
    {
        _1464 = _1370;
    }
    float _1488 = _1464;
    float _1490 = _1488;
    if (_1376)
    {
        float _1492 = fma(_1438, _1432, _1478);
        _1440 = _1492;
    }
    float _1494 = _1440;
    if (_1376)
    {
        float _1496 = _1482 * _1482;
        _1474 = _1496;
    }
    float _1498 = _1474;
    if (_1376)
    {
        float _1500 = _1486 * _1486;
        _1490 = _1500;
    }
    float _1502 = _1490;
    float _1504 = fma(_1494, _1494, _1498);
    float _1506 = _1504 + _1502;
    float _1508 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1512 = fma(_1472, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1510);
    float _1514 = precise::clamp(_1512, 0.0, 1.0);
    float _1516 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1518 = rsqrt(_1506);
    float _1520 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1508);
    float _1522 = -_1514;
    float _1524 = _1522 + 1.0;
    float _1526 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1528 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1516);
    float _1530 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1520);
    float _1532 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1534 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1526);
    float _1536 = abs(_1524);
    float _1538 = log2(_1536);
    float _1540 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1542 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1528);
    float _1544 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1546 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1532);
    float _1548 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1550 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1534);
    float _1552 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1554 = _1518 * _1482;
    float _1556 = -_1548;
    float _1558 = fma(_1556, _1544, 1.0);
    float _1560 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1546);
    float _1562 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1564 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1566 = _1518 * _1494;
    float _1568 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1570 = _1518 * _1486;
    float _1572 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1564);
    float _1574 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1576 = -_1568;
    float _1578 = fma(_1566, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1576);
    float _1580 = _1560 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1582 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1572);
    float _1584 = log2(_1558);
    float _1586 = -_1570;
    float _1588 = fma(_1586, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1578);
    float _1590 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1592 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1582);
    float _1594 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1596 = fma(_1588, -0.5, 0.5);
    float _1598 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1590);
    float _1600 = fma(_1588, 0.5, 0.5);
    float _1602 = exp2(_1574);
    float _1604 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1594);
    float _1606 = _1566 + 1.0;
    float _1608 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1598);
    float _1610 = fma(_1600, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1612 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1604);
    float _1614 = 1.0 / _1592;
    float _1616 = sqrt(_1596);
    float _1618 = -_1566;
    float _1620 = fma(_1602, _1606, _1618);
    float _1622 = fma(_1600, _1610, -0.212114393711090087890625);
    float _1624 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1608);
    float _1626 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1612);
    float _1628 = _1584 * 0.693147182464599609375;
    float _1630 = fma(_1600, _1622, 1.570728778839111328125);
    float _1632 = fma(_1620, 0.5, 0.5);
    float _1634 = _1624 * _1614;
    float _1636 = _1626 * _1614;
    float _1638 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1640 = fma(_1634, 0.5, 0.5);
    float _1642 = fma(_1636, -0.5, 0.5);
    float _1644 = _1616 * 0.636619746685028076171875;
    float _1646 = -_1630;
    float _1648 = fma(_1644, _1646, 1.0);
    float3 _4293 = float3(_1640, _1642, _1638);
    float _1650 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4293, float3(0.0), isnan(_4293)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4293, float3(0.0), isnan(_4293)), level(0.0)).x;
    float3 _4304 = float3(_1640, _1642, _1638);
    float4 _1653 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4304, float3(0.0), isnan(_4304)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4304, float3(0.0), isnan(_4304)), level(0.0)).xyzw;
    float _1655 = _1653.x;
    float _1657 = _1653.y;
    float _1659 = _1653.z;
    float _1661 = _1653.w;
    float2 _4321 = float2(_1648, _1632);
    float3 _1665 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4321, float2(0.0), isnan(_4321)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4321, float2(0.0), isnan(_4321)), level(0.0)).xyz;
    float _1667 = _1665.x;
    float _1669 = _1665.y;
    float _1671 = _1665.z;
    float _1673 = _1538 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1675 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1677 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1675);
    float _1679 = exp2(_1673);
    float _1681 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1677);
    float _1683 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1681);
    float _1685 = _1683 + _1592;
    out.gl_Position.x = _1624;
    out.gl_Position.y = _1626;
    out.gl_Position.z = _1683;
    out.gl_Position.w = _1592;
    float _1687 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1689 = _1685 * 0.5;
    float _1691 = -_1679;
    float _1693 = _1691 + 1.0;
    out.m_47.x = _1687;
    float _1695 = _1693 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.z = _1689;
    out.m_75.w = _1592;
    float _1697 = _1695 * _1650;
    float _1699 = -_1695;
    float _1701 = _1699 + 1.0;
    float _1703 = _1661 * _1697;
    float _1705 = _1671 * _1697;
    float _1707 = _1661 * _1701;
    float _1709 = fma(_1667, _1703, _1655);
    float _1711 = fma(_1669, _1703, _1657);
    float _1713 = fma(_1661, _1705, _1659);
    out.m_77.x = _1709;
    out.m_77.y = _1711;
    out.m_77.z = _1713;
    out.m_77.w = _1707;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

