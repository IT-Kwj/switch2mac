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
    float4 m_61 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_77 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_65 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_67 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1718 = false;
    bool _978 = false;
    bool _850 = false;
    bool _616 = false;
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
        float _2672 = as_type<float>(_112);
        out.gl_Position.z = _2672;
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
        float _2741 = as_type<float>(_148);
        out.gl_Position.z = _2741;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = in.m_51.z;
    float _156 = in.m_53.x;
    float _158 = in.m_53.y;
    float _160 = in.m_53.z;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_55.x;
    float _174 = in.m_55.y;
    float _176 = in.m_55.z;
    float _178 = in.m_57.w;
    float _180 = in.m_44.x;
    float _182 = in.m_44.y;
    float _184 = in.m_44.z;
    float _186 = _150 * _150;
    float _188 = _152 * _152;
    float _190 = fma(_156, _156, _186);
    float _192 = fma(_158, _158, _188);
    float _194 = fma(_172, _172, _190);
    float _196 = _154 * _154;
    float _198 = fma(_174, _174, _192);
    float _200 = sqrt(_194);
    float _202 = fma(_160, _160, _196);
    float _204 = fma(_176, _176, _202);
    float _206 = sqrt(_198);
    float _208 = sqrt(_204);
    bool _210 = _200 > 0.0;
    bool _212 = _206 > 0.0;
    float _214 = 0.0;
    float _216 = _198;
    float _218 = _172;
    if (_210)
    {
        float _220 = rsqrt(_194);
        _214 = _220;
    }
    float _222 = _214;
    float _224 = 0.0;
    float _226 = 0.0;
    if (!_210)
    {
        _224 = 0.0;
        _226 = 0.0;
    }
    float _228 = _224;
    float _230 = _226;
    bool _232 = _208 > 0.0;
    float _234 = in.m_49.x;
    float _236 = in.m_49.y;
    float _238 = in.m_49.z;
    float _240 = 0.0;
    float _242 = _230;
    float _244 = _228;
    if (!_210)
    {
        _240 = 0.0;
    }
    float _246 = _240;
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
    float _268 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _270 = 0.0;
    float _272 = _268;
    if (!_212)
    {
        _270 = 0.0;
    }
    float _274 = _270;
    float _276 = 0.0;
    float _278 = _274;
    if (!_232)
    {
        _276 = 0.0;
    }
    float _280 = _276;
    float _282 = _204;
    float _284 = _280;
    if (_232)
    {
        float _286 = rsqrt(_204);
        _282 = _286;
    }
    float _288 = _282;
    float _290 = _222;
    if (!_170)
    {
        float _292 = _268 * _268;
        float _294 = _292 * 0.5;
        _216 = _294;
    }
    float _296 = _216;
    float _298 = _296;
    if (_210)
    {
        float _300 = _222 * _156;
        _242 = _300;
    }
    float _302 = _242;
    if (_210)
    {
        float _304 = _222 * _150;
        _244 = _304;
    }
    float _306 = _244;
    if (_210)
    {
        float _308 = _222 * _172;
        _252 = _308;
    }
    float _310 = _252;
    float _312 = 0.0;
    if (!_232)
    {
        _312 = 0.0;
    }
    float _314 = _312;
    float _316 = _314;
    if (!_170)
    {
        float _318 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _298 = _318;
    }
    float _320 = _298;
    float _322 = _320;
    if (!_232)
    {
        _290 = 0.0;
    }
    float _324 = _290;
    float _326 = _324;
    if (_212)
    {
        float _328 = _266 * _158;
        _278 = _328;
    }
    float _330 = _278;
    if (_212)
    {
        float _332 = _266 * _152;
        _260 = _332;
    }
    float _334 = _260;
    if (_212)
    {
        float _336 = _266 * _174;
        _262 = _336;
    }
    float _338 = _262;
    if (_232)
    {
        float _340 = _288 * _160;
        _284 = _340;
    }
    float _342 = _284;
    if (_232)
    {
        float _344 = _288 * _154;
        _316 = _344;
    }
    float _346 = _316;
    float _348 = _346;
    if (_232)
    {
        float _350 = _288 * _176;
        _326 = _350;
    }
    float _352 = _326;
    bool _354 = !_170;
    if (!_354)
    {
        float _356 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = log2(_356);
        float _360 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _362 = _360 + 1.0;
        float _364 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _366 = _268 * _358;
        float _368 = 1.0 / _362;
        float _370 = _364 * 0.693147182464599609375;
        float _372 = exp2(_366);
        float _374 = 1.0 / _370;
        float _376 = _372 + (-1.0);
        float _378 = -_376;
        float _380 = fma(_378, _374, _268);
        float _382 = _380 * _368;
        float _384 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _322 = _384;
    }
    float _386 = _322;
    float _388 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _390 = !_170;
    float _392 = _386;
    if (!_390)
    {
        float _394 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _396 = log2(_394);
        float _398 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _400 = _398 + 1.0;
        float _402 = 1.0 / _400;
        float _404 = _268 * _396;
        float _406 = exp2(_404);
        float _408 = -_406;
        float _410 = _408 + 1.0;
        float _412 = _410 * _402;
        _272 = _412;
    }
    float _414 = _272;
    float _416 = _388 * _306;
    float _418 = _388 * _334;
    float _420 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _422 = _388 * _346;
    float _424 = 0.0;
    float _426 = _414;
    if (!_170)
    {
        float _428 = _130 * _130;
        float _430 = _428 * 0.5;
        _424 = _430;
    }
    float _432 = _424;
    float _434 = fma(_420, _302, _416);
    float _436 = fma(_420, _330, _418);
    float _438 = fma(_420, _342, _422);
    float _440 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_170)
    {
        float _442 = _432 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _392 = _442;
    }
    float _444 = _392;
    bool _446 = !_170;
    float _448 = _444;
    if (!_446)
    {
        float _450 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _452 = log2(_450);
        float _454 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _456 = _454 + 1.0;
        float _458 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _460 = _130 * _452;
        float _462 = exp2(_460);
        float _464 = _458 * 0.693147182464599609375;
        float _466 = 1.0 / _464;
        float _468 = 1.0 / _456;
        float _470 = _462 + (-1.0);
        float _472 = -_470;
        float _474 = fma(_472, _466, _130);
        float _476 = _474 * _468;
        float _478 = _476 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _448 = _478;
    }
    float _480 = _448;
    float _482 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _484 = fma(_440, _310, _434);
    float _486 = fma(_440, _338, _436);
    float _488 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _490 = _482 * _306;
    float _492 = _482 * _334;
    float _494 = _482 * _346;
    float _496 = fma(_440, _352, _438);
    float _498 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _500 = fma(_488, _330, _492);
    float _502 = fma(_488, _302, _490);
    float _504 = fma(_488, _342, _494);
    float _506 = fma(_414, _234, _484);
    float _508 = fma(_414, _236, _486);
    float _510 = fma(_414, _238, _496);
    float _512 = fma(_498, _338, _500);
    float _514 = fma(_498, _310, _502);
    float _516 = fma(_498, _352, _504);
    if (!_170)
    {
        _426 = _130;
    }
    float _518 = _426;
    bool _520 = !_170;
    float _522 = _518;
    if (!_520)
    {
        float _524 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _526 = log2(_524);
        float _528 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _530 = _528 + 1.0;
        float _532 = 1.0 / _530;
        float _534 = _130 * _526;
        float _536 = exp2(_534);
        float _538 = -_536;
        float _540 = _538 + 1.0;
        float _542 = _540 * _532;
        _522 = _542;
    }
    float _544 = _522;
    float _546 = fma(_544, _236, _512);
    bool _548 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _550 = fma(_544, _234, _514);
    float _552 = fma(_508, _178, _182);
    float _554 = -_546;
    float _556 = _508 + _554;
    float _558 = fma(_506, _178, _180);
    float _560 = -_550;
    float _562 = _506 + _560;
    float _564 = fma(_544, _238, _516);
    float _566 = _556 * _158;
    float _568 = _556 * _152;
    float _570 = _556 * _174;
    float _572 = -_564;
    float _574 = _510 + _572;
    float _576 = fma(_562, _156, _566);
    float _578 = fma(_562, _150, _568);
    float _580 = fma(_562, _172, _570);
    float _582 = fma(_510, _178, _184);
    float _584 = fma(_574, _160, _576);
    float _586 = fma(_574, _154, _578);
    float _588 = fma(_574, _176, _580);
    bool _590 = !_548;
    float _592 = _586;
    float _594 = _584;
    float _596 = _588;
    float _614;
    if (!_590)
    {
        float _598 = in.m_59.x;
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _602 = _598 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        float _618 = float(_96);
        float _620 = 1.0 / _618;
        float _622 = _130 * _620;
        _614 = _622;
    }
    _616 = false;
    float _624 = _614;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _628 = _624 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _632 = _624 + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _636 = _624 + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _646;
    float _650 = 1.0 / _644;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _668 = 1.0 / _640;
    bool _670 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _672 = isnan(_624);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _678 = _674 || _676;
    float _680 = float(_678);
    bool _682 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _684 = 1.0 / _648;
    float _686 = _628 * _668;
    bool _688 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _690 = isnan(_624);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -_680;
    float _702 = _700 + 1.0;
    float _704 = _632 * _650;
    bool _706 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _708 = isnan(_624);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = fma(_654, _686, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _720 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _722 = isnan(_624);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = _698 * _702;
    float _734 = _636 * _684;
    float _736 = -_698;
    float _738 = _736 + 1.0;
    float _740 = fma(_662, _686, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _742 = fma(_658, _704, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _744 = fma(_666, _704, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _746;
    float _750 = _730 * _738;
    float _752 = -_730;
    float _754 = _752 + 1.0;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _760 = fma(_748, _686, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _762 = _716 * _754;
    float _764 = fma(_758, _704, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _766 = in.m_57.x;
    float _768 = in.m_57.y;
    float _770 = in.m_57.z;
    float _772 = _718 * _762;
    float _774 = _760 * _762;
    float _776 = -_716;
    float _778 = _776 + 1.0;
    float _780 = _740 * _762;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _782;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _786;
    float _790 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[143].x, _774);
    float _792 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[143].y, _772);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _794;
    float _798 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[143].z, _780);
    float _800 = fma(_784, _734, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _802 = fma(_788, _734, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _804 = fma(_796, _734, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _806 = fma(_764, _750, _790);
    float _808 = fma(_742, _750, _792);
    float _810 = fma(_744, _750, _798);
    float _812 = fma(_800, _732, _806);
    float _814 = fma(_802, _732, _808);
    float _816 = fma(_804, _732, _810);
    float _818 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[146].x, _812);
    float _820 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[146].y, _814);
    float _822 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[146].z, _816);
    float _824 = _818 * _766;
    float _826 = _820 * _768;
    float _828 = _822 * _770;
    bool _830 = !_682;
    float _848;
    if (!_830)
    {
        float _832 = in.m_59.x;
        float _834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _836 = _832 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _840 = _838 * _834;
        float _842 = floor(_840);
        float _844 = -_842;
        float _846 = _840 + _844;
        _848 = _846;
        _850 = true;
    }
    else
    {
        float _852 = float(_96);
        float _854 = 1.0 / _852;
        float _856 = _130 * _854;
        _848 = _856;
    }
    _850 = false;
    float _858 = _848;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _862 = _858 + _860;
    bool _864 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _866 = isnan(_858);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _876;
    bool _880 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _882 = isnan(_858);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = -_874;
    float _894 = _892 + 1.0;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _896;
    float _900 = 1.0 / _878;
    bool _902 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _904 = _862 * _900;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _906;
    float _910 = _890 * _894;
    float _912 = fma(_898, _904, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _914 = -_890;
    float _916 = _914 + 1.0;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _918;
    float _922 = fma(_908, _904, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _924 = _912 * _910;
    float _926 = fma(_920, _904, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _928 = _922 * _910;
    float _930 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[107].x, _924);
    float _932 = _926 * _910;
    float _934 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[107].z, _928);
    float _936 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[108].x, _930);
    float _938 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[107].y, _932);
    float _940 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[108].z, _934);
    float _942 = _936 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _944 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[108].y, _938);
    float _946 = _940 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _950 = _944 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _952 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _956 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _952;
    out.m_61.y = _956;
    out.m_61.z = _954;
    out.m_61.w = _948;
    bool _958 = !_902;
    float _976;
    if (!_958)
    {
        float _960 = in.m_59.x;
        float _962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _964 = _960 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _966 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _968 = _966 * _962;
        float _970 = floor(_968);
        float _972 = -_970;
        float _974 = _968 + _972;
        _976 = _974;
        _978 = true;
    }
    else
    {
        float _980 = float(_96);
        float _982 = 1.0 / _980;
        float _984 = _130 * _982;
        _976 = _984;
    }
    _978 = false;
    float _986 = _976;
    float _988 = in.m_59.z;
    float _990 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _992 = log2(_990);
    float _994 = _824 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _996 = in.m_59.y;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1000 = _998 != 0;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1004 = _1002 != 0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1008 = _1006 != 0;
    float _1010 = in.m_59.x;
    bool _1012 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1014 = isnan(0.0);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1020 = _1016 || _1018;
    bool _1022 = !_1000;
    int _1024 = _1022 ? 0 : 1;
    float _1026 = _130 * _992;
    int _1028 = abs(_1024);
    float _1030 = exp2(_1026);
    float _1032 = _988 * 2.0;
    float _1034 = _996 + _988;
    float _1036 = _996 * 2.0;
    float _1038 = floor(_1032);
    float _1040 = _1010 * 2.0;
    float _1042 = _1034 + (-1.0);
    float _1044 = _1010 + _996;
    float _1046 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1048 = floor(_1040);
    float _1050 = -_1030;
    float _1052 = _1050 + 1.0;
    float _1054 = _1044 + (-1.0);
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1058 = 1.0 + _1056;
    float _1060 = _1020 ? _1052 : 0.0;
    float _1062 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1064 = _1038 > 0.0;
    float _1066 = floor(_1036);
    bool _1068 = _1038 >= 0.0;
    bool _1070 = isnan(_1038);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(0.0);
    bool _1076 = _1072 || _1074;
    float _1078 = in.m_63.x;
    float _1080 = in.m_63.y;
    float _1082 = in.m_63.z;
    int _1084 = _1076 ? 0 : 1;
    bool _1086 = _1048 >= 0.0;
    bool _1088 = isnan(_1048);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan(0.0);
    bool _1094 = _1090 || _1092;
    float _1096 = 1.0 / _1058;
    int _1098 = ~_1084;
    int _1100 = _1098 + 1;
    int _1102 = _1100 + 1;
    int _1104 = _1102;
    if (!_1064)
    {
        int _1106 = ~_1084;
        int _1108 = _1106 + 1;
        _1104 = _1108;
    }
    int _1110 = _1104;
    bool _1112 = _1048 > 0.0;
    float _1114 = float(_1028);
    float _1116 = float(_1110);
    bool _1118 = !_1004;
    int _1120 = _1118 ? 0 : 1;
    bool _1122 = _1066 >= 0.0;
    bool _1124 = isnan(_1066);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan(0.0);
    bool _1130 = _1126 || _1128;
    float _1132 = _1114 * _1116;
    int _1134 = _1094 ? 0 : 1;
    bool _1136 = _1066 > 0.0;
    float _1138 = _1132 * (-2.0);
    int _1140 = ~_1134;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    float _1146 = _1060 * _1096;
    int _1148 = _1144;
    if (!_1112)
    {
        int _1150 = ~_1134;
        int _1152 = _1150 + 1;
        _1148 = _1152;
    }
    int _1154 = _1148;
    float _1156 = fma(_1062, _1138, _1062);
    int _1158 = abs(_1120);
    float _1160 = fma(_1138, _1078, _1078);
    bool _1162 = !_1008;
    int _1164 = _1162 ? 0 : 1;
    float _1166 = _1010 + (-0.5);
    float _1168 = float(_1158);
    float _1170 = float(_1154);
    float _1172 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1160);
    bool _1174 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1176 = isnan(1.0);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1182 = _1178 || _1180;
    float _1184 = _996 + (-0.5);
    int _1186 = _1130 ? 0 : 1;
    float _1188 = _1168 * _1170;
    int _1190 = abs(_1164);
    bool _1192 = !_1182;
    float _1194 = _1192 ? _130 : _1146;
    int _1196 = ~_1186;
    int _1198 = _1196 + 1;
    int _1200 = _1198 + 1;
    float _1202 = _1188 * (-2.0);
    int _1204 = _1200;
    if (!_1136)
    {
        int _1206 = ~_1186;
        int _1208 = _1206 + 1;
        _1204 = _1208;
    }
    int _1210 = _1204;
    float _1212 = fma(_1194, _1156, _1172);
    float _1214 = float(_1190);
    float _1216 = fma(_1202, _1080, _1080);
    float _1218 = float(_1210);
    float _1220 = _1212 * 0.15915493667125701904296875;
    float _1222 = fma(_1046, _1202, _1046);
    float _1224 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1216);
    float _1226 = _1010 + _988;
    float _1228 = _1214 * _1218;
    float _1230 = fma(_1194, _1222, _1224);
    float _1232 = in.m_65.x;
    float _1234 = in.m_65.y;
    float _1236 = in.m_65.z;
    float _1238 = _1226 + (-1.0);
    float _1240 = _1228 * (-2.0);
    float _1242 = _988 + (-0.5);
    float _1244 = _1220 * 6.283185482025146484375;
    float _1246 = sin(_1244);
    float _1248 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1250 = fma(_1240, _1082, _1082);
    float _1252 = _1230 * 0.15915493667125701904296875;
    bool _1254 = _996 > 0.5;
    float _1256 = fma(_1248, _1240, _1248);
    float _1258 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1250);
    float _1260 = in.m_53.w;
    float _1262 = _1220 * 6.283185482025146484375;
    float _1264 = cos(_1262);
    float _1266 = fma(_1194, _1256, _1258);
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1270 = _1268 != 0;
    float _1272 = _1266 * 0.15915493667125701904296875;
    float _1274 = _1252 * 6.283185482025146484375;
    float _1276 = cos(_1274);
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1280 = _1278 != 0;
    float _1282 = _552 * _158;
    float _1284 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1232);
    float _1286 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1234);
    float _1288 = _826 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1290 = fma(_558, _156, _1282);
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1236);
    float _1294 = _1272 * 6.283185482025146484375;
    float _1296 = cos(_1294);
    float _1298 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1300 = fma(_582, _160, _1290);
    float _1302 = _1288 * _1286;
    float _1304 = _994 * _1284;
    float _1306 = _1298 * _1292;
    float _1308 = _1300 + _1260;
    float _1310 = in.m_55.w;
    float _1312 = _1252 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1246 * _1276;
    bool _1318 = _1010 > 0.5;
    bool _1320 = _1318 && _1270;
    float _1322 = _1272 * 6.283185482025146484375;
    float _1324 = sin(_1322);
    float _1326 = _1276 * _1296;
    float _1328 = _1296 * _1302;
    float _1330 = _1264 * _1276;
    float _1332 = _1264 * _1328;
    float _1334 = _1246 * _1328;
    float _1336 = _1246 * _1314;
    float _1338 = _1264 * _1314;
    float _1340 = _1314 * _1296;
    float _1342 = fma(_1324, _1330, _1336);
    float _1344 = -_1338;
    float _1346 = fma(_1324, _1316, _1344);
    float _1348 = -_1302;
    float _1350 = _1324 * _1348;
    float _1352 = -_1316;
    float _1354 = fma(_1324, _1338, _1352);
    float _1356 = fma(_1342, _1304, _1332);
    float _1358 = fma(_1324, _1336, _1330);
    float _1360 = fma(_1326, _1304, _1350);
    float _1362 = fma(_1346, _1304, _1334);
    float _1364 = fma(_1354, _1306, _1356);
    float _1366 = _552 * _174;
    float _1368 = fma(_1340, _1306, _1360);
    float _1370 = fma(_1358, _1306, _1362);
    float _1372 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1374 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1376 = fma(_558, _172, _1366);
    float _1378 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1372);
    float _1380 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1374);
    float _1382 = fma(_582, _176, _1376);
    float _1384 = in.m_67.y;
    float _1386 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1378);
    float _1388 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1380);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1390;
    float _1394 = _1382 + _1310;
    float _1396 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1398 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1400 = 1.0 / _1392;
    float _1402 = _552 * _152;
    float _1404 = _1308 + _1396;
    float _1406 = _1394 + _1398;
    float _1408 = in.m_51.w;
    float _1410 = fma(_558, _150, _1402);
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1414 = _1404 + _1412;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1418 = _1406 + _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1422 = _986 + _1420;
    float _1424 = in.m_67.x;
    float _1426 = _1414 * _1414;
    float _1428 = _1418 * _1418;
    float _1430 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1432 = fma(_582, _154, _1410);
    float _1434 = _1426 + _1428;
    float _1436 = _1422 * _1400;
    float _1438 = -_1384;
    float _1440 = _1438 + 1.0;
    float _1442 = sqrt(_1434);
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1444;
    float _1448 = _1384;
    float _1450 = _1272;
    float _1452 = _1446;
    float _1454 = _1426;
    float _1456 = _1428;
    if (_1280)
    {
        float _1458 = _1254 ? _1440 : _1384;
        _1448 = _1458;
    }
    float _1460 = _1448;
    float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1462;
    bool _1466 = _986 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1468 = isnan(_986);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1474 = _1470 || _1472;
    float _1476 = float(_1474);
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1478;
    float _1482 = fma(_1464, _1436, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1484 = _1432 + _1408;
    float _1486 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1430);
    bool _1488 = _986 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1490 = isnan(_986);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1496 = _1492 || _1494;
    float _1498 = float(_1496);
    float _1500 = fma(_1446, _1436, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1502 = fma(_1480, _1436, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1504 = -_1476;
    float _1506 = _1504 + 1.0;
    float _1508 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1486);
    bool _1510 = _1442 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1514 = _1424;
    float _1516 = _1442;
    if (_1270)
    {
        _1450 = _1424;
    }
    float _1518 = _1450;
    float _1520 = _1498 * _1506;
    float _1522 = _1508 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1524 = _1518;
    float _1526 = _1522;
    if (_1320)
    {
        float _1528 = -_1518;
        float _1530 = _1528 + 1.0;
        _1524 = _1530;
    }
    float _1532 = _1524;
    float _1534 = _1482 * _1520;
    float _1536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1538 = _1500 * _1520;
    float _1540 = _1502 * _1520;
    float _1542 = -_1498;
    float _1544 = _1542 + 1.0;
    float _1546 = _1484 + _1522;
    float _1548 = _1546;
    if (!_1510)
    {
        _1526 = _1428;
    }
    float _1550 = _1526;
    float _1552 = _1550;
    if (!_1510)
    {
        _1452 = _1426;
    }
    float _1554 = _1452;
    float _1556 = _1554;
    if (_1270)
    {
        _1514 = _1532;
    }
    float _1558 = _1514;
    if (!_1510)
    {
        _1454 = _1404;
    }
    float _1560 = _1454;
    float _1562 = _1560;
    if (!_1510)
    {
        _1456 = _1406;
    }
    float _1564 = _1456;
    bool _1566 = !_1510;
    float _1568 = _1564;
    if (!_1566)
    {
        float _1570 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1572 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1574 = _1442 + _1572;
        float _1576 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1578 = rsqrt(_1434);
        float _1580 = _1574 * _1570;
        float _1582 = _1580 * 0.15915493667125701904296875;
        float _1584 = _1582 * 6.283185482025146484375;
        float _1586 = sin(_1584);
        float _1588 = _1582 * 6.283185482025146484375;
        float _1590 = cos(_1588);
        float _1592 = fma(_1586, _1576, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1594 = _1578 * _1592;
        float _1596 = fma(_1414, _1594, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1598 = _1590 + (-1.0);
        float _1600 = fma(_1418, _1594, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1604 = _1596 + _1602;
        float _1606 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1610 = _1600 + _1608;
        float _1612 = _1604 * _1604;
        float _1614 = fma(_1546, _1590, _1606);
        float _1616 = _1610 * _1610;
        _1548 = _1614;
        _1556 = _1612;
        _1552 = _1616;
        _1562 = _1596;
        _1568 = _1600;
        _1516 = _1576;
    }
    float _1618 = _1548;
    float _1620 = _1556;
    float _1622 = _1552;
    float _1624 = _1562;
    float _1626 = _1568;
    float _1628 = _1516;
    float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1632 = _1618 + _1630;
    float _1634 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1534);
    float _1636 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1538);
    float _1638 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1540);
    float _1640 = fma(_1632, _1632, _1620);
    float _1642 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1634);
    float _1644 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1636);
    float _1646 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1638);
    float _1648 = _1640 + _1622;
    float _1650 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1652 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1654 = _1642 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1656 = _1644 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1658 = _1646 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1660 = sqrt(_1648);
    float _1662 = _1652 * _1512;
    float _1664 = _1650 * _1536;
    float _1666 = _1654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1668 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1670 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1662;
    out.m_69.y = _1664;
    out.m_71.x = 1.0;
    out.m_71.y = 1.0;
    out.m_71.z = 1.0;
    out.m_73.x = _1666;
    out.m_73.y = _1668;
    out.m_73.z = _1670;
    bool _1672 = _1660 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1674 = isnan(_1660);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1680 = _1676 || _1678;
    float _1682 = _1628;
    if (!_1680)
    {
        _1682 = 1.0;
    }
    float _1684 = _1682;
    bool _1686 = !_1680;
    float _1688 = _1684;
    if (!_1686)
    {
        bool _1690 = _1660 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1692 = isnan(_1660);
        bool _1694 = _1690 || _1692;
        bool _1696 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1698 = _1694 || _1696;
        if (!_1698)
        {
            float _1700 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1702 = _1660 + _1700;
            float _1704 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1706 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1704;
            float _1708 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1710 = _1708 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1712 = 1.0 / _1706;
            float _1714 = _1702 * _1712;
            float _1716 = fma(_1714, _1710, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1688 = _1716;
            _1718 = true;
        }
        else
        {
            bool _1720 = _1660 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1722 = isnan(_1660);
            bool _1724 = _1720 || _1722;
            bool _1726 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1728 = _1724 || _1726;
            if (!_1728)
            {
                float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1732 = _1660 + _1730;
                float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1736 = _1734 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1738 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1740 = _1738 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1742 = 1.0 / _1736;
                float _1744 = _1732 * _1742;
                float _1746 = fma(_1744, _1740, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1688 = _1746;
                _1718 = true;
            }
            else
            {
                _1688 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1718 = false;
    float _1748 = _1688;
    float _1750 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1752 = _1618 + _1750;
    float _1754 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1756 = _1624 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1760 = _1626 + _1758;
    float _1762 = fma(_1752, _1748, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1764 = fma(_1756, _1748, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1766 = fma(_1760, _1748, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1768 = -_1484;
    float _1770 = _1768 + _1762;
    float _1772 = -_1308;
    float _1774 = _1772 + _1764;
    float _1776 = -_1394;
    float _1778 = _1776 + _1766;
    float _1780 = _1770 * _1770;
    float _1782 = fma(_1774, _1774, _1780);
    float _1784 = fma(_1778, _1778, _1782);
    float _1786 = sqrt(_1784);
    bool _1788 = _1786 > 0.0;
    bool _1790 = !_1788;
    float _1792 = _1782;
    float _1794 = _1748;
    float _1796 = _1786;
    float _1798 = _1764;
    float _1800 = _1762;
    float _1802 = _1766;
    if (!_1790)
    {
        bool _1804 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1806 = _1476;
        if (_1804)
        {
            float _1808 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1806 = _1808;
        }
        float _1810 = _1806;
        if (_1804)
        {
            _1792 = _584;
        }
        float _1812 = _1792;
        float _1814 = _1812;
        if (_1804)
        {
            _1794 = _586;
        }
        float _1816 = _1794;
        float _1818 = _1816;
        if (_1804)
        {
            float _1820 = _584 * _1810;
            _1796 = _1820;
        }
        float _1822 = _1796;
        float _1824 = _1822;
        float _1826 = _1822;
        if (_1804)
        {
            float _1828 = _586 * _1810;
            _592 = _1828;
        }
        float _1830 = _592;
        float _1832 = _1830;
        if (_1804)
        {
            float _1834 = _588 * _1810;
            _594 = _1834;
        }
        float _1836 = _594;
        float _1838 = _1836;
        if (!_1804)
        {
            float _1840 = _130 + 1.0;
            if (!_170)
            {
                float _1842 = _1840 * _1840;
                float _1844 = _1842 * 0.5;
                _1824 = _1844;
            }
            float _1846 = _1824;
            float _1848 = _1846;
            if (!_170)
            {
                float _1850 = _1846 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1848 = _1850;
            }
            float _1852 = _1848;
            bool _1854 = !_170;
            float _1856 = _1852;
            if (!_1854)
            {
                float _1858 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1860 = log2(_1858);
                float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1864 = _1862 + 1.0;
                float _1866 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1868 = _1860 * _1840;
                float _1870 = 1.0 / _1864;
                float _1872 = _1866 * 0.693147182464599609375;
                float _1874 = exp2(_1868);
                float _1876 = 1.0 / _1872;
                float _1878 = _1874 + (-1.0);
                float _1880 = -_1878;
                float _1882 = fma(_1880, _1876, _1840);
                float _1884 = _1882 * _1870;
                float _1886 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1856 = _1886;
            }
            float _1888 = _1856;
            float _1890 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1892 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1894 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1896 = _1890 * _334;
            float _1898 = _1890 * _306;
            float _1900 = _1890 * _346;
            if (!_170)
            {
                _348 = _1840;
            }
            float _1902 = _348;
            float _1904 = fma(_1892, _330, _1896);
            float _1906 = fma(_1892, _302, _1898);
            float _1908 = fma(_1894, _338, _1904);
            bool _1910 = !_170;
            float _1912 = _1902;
            if (!_1910)
            {
                float _1914 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1916 = log2(_1914);
                float _1918 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1920 = _1918 + 1.0;
                float _1922 = 1.0 / _1920;
                float _1924 = _1916 * _1840;
                float _1926 = exp2(_1924);
                float _1928 = -_1926;
                float _1930 = _1928 + 1.0;
                float _1932 = _1930 * _1922;
                _1912 = _1932;
            }
            float _1934 = _1912;
            float _1936 = fma(_1894, _310, _1906);
            float _1938 = fma(_1892, _342, _1900);
            float _1940 = fma(_1934, _236, _1908);
            float _1942 = fma(_1934, _234, _1936);
            float _1944 = fma(_1894, _352, _1938);
            float _1946 = -_546;
            float _1948 = _1946 + _1940;
            float _1950 = -_550;
            float _1952 = _1950 + _1942;
            float _1954 = fma(_1934, _238, _1944);
            float _1956 = _1948 * _158;
            float _1958 = _1948 * _152;
            float _1960 = _1948 * _174;
            float _1962 = -_564;
            float _1964 = _1962 + _1954;
            float _1966 = fma(_1952, _156, _1956);
            float _1968 = fma(_1952, _150, _1958);
            float _1970 = fma(_1952, _172, _1960);
            float _1972 = fma(_1964, _160, _1966);
            float _1974 = fma(_1964, _154, _1968);
            float _1976 = fma(_1964, _176, _1970);
            _1818 = _1974;
            _1814 = _1972;
            _596 = _1976;
            _1826 = _1972;
            _1832 = _1974;
            _1838 = _1976;
        }
        float _1978 = _1818;
        float _1980 = _1814;
        float _1982 = _596;
        float _1984 = _1826;
        float _1986 = _1832;
        float _1988 = _1838;
        float _1990 = _1978 * _1978;
        float _1992 = fma(_1980, _1980, _1990);
        float _1994 = fma(_1982, _1982, _1992);
        float _1996 = rsqrt(_1784);
        float _1998 = sqrt(_1994);
        float _2000 = _1774 * _1996;
        float _2002 = _1770 * _1996;
        float _2004 = _1778 * _1996;
        bool _2006 = _1998 > 0.0;
        bool _2008 = !_2006;
        _218 = _1994;
        if (!_2008)
        {
            float _2010 = rsqrt(_1994);
            float _2012 = _2010 * _1978;
            float _2014 = _2010 * _1980;
            float _2016 = _2010 * _1982;
            float _2018 = _2002 * _2012;
            float _2020 = fma(_2000, _2014, _2018);
            float _2022 = fma(_2004, _2016, _2020);
            float _2024 = _2022 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2026 = fma(_1984, _2024, _1764);
            float _2028 = fma(_1986, _2024, _1762);
            float _2030 = fma(_1988, _2024, _1766);
            _1798 = _2026;
            _1800 = _2028;
            _1802 = _2030;
        }
    }
    float _2032 = _218;
    float _2034 = _1798;
    float _2036 = _1800;
    float _2038 = _1802;
    float _2040 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2042 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2040);
    bool _2044 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2046 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan(0.5);
    bool _2052 = _2048 || _2050;
    float _2054 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2056 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2060 = _2056 || _2058;
    bool _2062 = isnan(0.5);
    bool _2064 = _2060 || _2062;
    float _2066 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2042);
    float _2068 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2054);
    float _2070 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2072 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2068);
    float _2074 = 1.0 / _2070;
    float _2076 = _2072 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2078 = _2076 + _2070;
    float _2080 = _2036;
    float _2082 = _2034;
    float _2084 = _2038;
    float _2086 = _2032;
    float _2088 = _2078;
    float _2090 = _2074;
    if (!_2052)
    {
        float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2094 = _1484 + _2092;
        float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2098 = _1308 + _2096;
        float _2100 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2102 = -_1308;
        float _2104 = _2102 + _2034;
        float _2106 = _2094 * _2094;
        float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2110 = _1394 + _2108;
        float _2112 = -_1484;
        float _2114 = _2112 + _2036;
        float _2116 = -_1394;
        float _2118 = _2116 + _2038;
        float _2120 = fma(_2098, _2098, _2106);
        float _2122 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2124 = fma(_2110, _2110, _2120);
        float _2126 = sqrt(_2124);
        float _2128 = _2100 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2130 = precise::min(_2126, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2132 = _2130 * _2122;
        float _2134 = _2128 * _2132;
        float _2136 = fma(_2104, _2134, _1308);
        float _2138 = fma(_2114, _2134, _1484);
        float _2140 = fma(_2118, _2134, _1394);
        _2080 = _2138;
        _2082 = _2136;
        _2084 = _2140;
        _2086 = _2100;
    }
    float _2142 = _2080;
    float _2144 = _2082;
    float _2146 = _2084;
    float _2148 = _2086;
    float _2150 = _2148;
    if (_2064)
    {
        _2150 = 1.0;
    }
    float _2152 = _2150;
    float _2154 = _2078 * _2074;
    float _2156 = _2154 * 0.5;
    float _2158 = _2152;
    float _2160 = _2156;
    if (!_2064)
    {
        float _2162 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2166 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2164);
        float _2168 = _2162 * 0.15915493667125701904296875;
        float _2170 = _2168 * 6.283185482025146484375;
        float _2172 = cos(_2170);
        float _2174 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2176 = _2174 * 0.15915493667125701904296875;
        float _2178 = _2168 * 6.283185482025146484375;
        float _2180 = sin(_2178);
        float _2182 = 1.0 / _2172;
        float _2184 = _2176 * 6.283185482025146484375;
        float _2186 = cos(_2184);
        float _2188 = _2180 * _2182;
        float _2190 = 1.0 / _2166;
        float _2192 = _2186 * _2188;
        float _2194 = _2176 * 6.283185482025146484375;
        float _2196 = sin(_2194);
        float _2198 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2200 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2198;
        float _2202 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2204 = _2190 * _2202;
        float _2206 = 1.0 / _2192;
        float _2208 = 1.0 / _2200;
        float _2210 = _2196 * _2206;
        float _2212 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2214 = fma(_2210, _2204, _2212);
        float _2216 = _2214 * _2208;
        float _2218 = precise::clamp(_2216, 0.0, 1.0);
        _2088 = _2208;
        _2090 = _2176;
        _2158 = _2218;
    }
    float _2220 = _2088;
    float _2222 = _2090;
    float _2224 = _2158;
    float _2226 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2228 = _2142 + _2226;
    float _2230 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2232 = _2144 + _2230;
    float _2234 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2236 = _2146 + _2234;
    float _2238 = _2228 * _2228;
    float _2240 = fma(_2232, _2232, _2238);
    float _2242 = fma(_2236, _2236, _2240);
    float _2244 = rsqrt(_2242);
    float _2246 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2248 = _2232 * _2246;
    float _2250 = _2236 * _2246;
    float _2252 = _2248 * _2248;
    float _2254 = _2250 * _2250;
    float _2256 = _2252 + _2254;
    float _2258 = sqrt(_2256);
    bool _2260 = _2258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2264 = _2258 + _2262;
    float _2266 = _2244;
    float _2268 = _2220;
    float _2270 = _2264;
    float _2272 = _2228;
    float _2274 = _2222;
    float _2276 = _2246;
    float _2278 = _2248;
    if (_2260)
    {
        float _2280 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2266 = _2280;
    }
    float _2282 = _2266;
    if (_2260)
    {
        float _2284 = rsqrt(_2256);
        _2268 = _2284;
    }
    float _2286 = _2268;
    float _2288 = _2286;
    if (_2260)
    {
        float _2290 = _2264 * _2282;
        _2270 = _2290;
    }
    float _2292 = _2270;
    if (_2260)
    {
        float _2294 = _2292 * 0.15915493667125701904296875;
        _2160 = _2294;
    }
    float _2296 = _2160;
    float _2298 = _2282;
    if (_2260)
    {
        float _2300 = _2296 * 6.283185482025146484375;
        float _2302 = sin(_2300);
        _2298 = _2302;
    }
    float _2304 = _2298;
    float _2306 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2308 = precise::max(0.0, _2306);
    float _2310 = _2236;
    float _2312 = _2308;
    if (_2260)
    {
        float _2314 = _2296 * 6.283185482025146484375;
        float _2316 = cos(_2314);
        _2310 = _2316;
    }
    float _2318 = _2310;
    float _2320 = -_2246;
    float _2322 = -_2308;
    float _2324 = fma(_2228, _2320, _2322);
    if (!_2260)
    {
        _2272 = _2250;
    }
    float _2326 = _2272;
    float _2328 = _2326;
    if (_2260)
    {
        float _2330 = _2324 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2312 = _2330;
    }
    float _2332 = _2312;
    float _2334 = _2304;
    float _2336 = _2332;
    if (_2260)
    {
        float _2338 = fma(_2304, _2332, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2274 = _2338;
    }
    float _2340 = _2274;
    if (!_2260)
    {
        _2334 = _2324;
    }
    float _2342 = _2334;
    float _2344 = _2342;
    float _2346 = _2318;
    if (_2260)
    {
        float _2348 = _2318 + (-1.0);
        _2336 = _2348;
    }
    float _2350 = _2336;
    float _2352 = _2350;
    if (_2260)
    {
        float _2354 = _2286 * _2340;
        _2276 = _2354;
    }
    float _2356 = _2276;
    float _2358 = sqrt(_2242);
    if (_2260)
    {
        float _2360 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2288 = _2360;
    }
    float _2362 = _2288;
    if (_2260)
    {
        float _2364 = _2248 * _2356;
        _2278 = _2364;
    }
    float _2366 = _2278;
    if (!_2260)
    {
        _2352 = _2252;
    }
    float _2368 = _2352;
    float _2370 = _2368;
    if (_2260)
    {
        float _2372 = _2250 * _2356;
        _2328 = _2372;
    }
    float _2374 = _2328;
    if (_2260)
    {
        float _2376 = fma(_2324, _2318, _2362);
        _2344 = _2376;
    }
    float _2378 = _2344;
    if (_2260)
    {
        float _2380 = _2366 * _2366;
        _2370 = _2380;
    }
    float _2382 = _2370;
    if (!_2260)
    {
        _2346 = _2254;
    }
    float _2384 = _2346;
    float _2386 = _2384;
    if (_2260)
    {
        float _2388 = _2374 * _2374;
        _2386 = _2388;
    }
    float _2390 = _2386;
    float _2392 = fma(_2378, _2378, _2382);
    float _2394 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2396 = _2392 + _2390;
    float _2398 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2394);
    float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2402 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2400);
    float _2404 = precise::clamp(_2402, 0.0, 1.0);
    float _2406 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2408 = rsqrt(_2396);
    float _2410 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2398);
    float _2412 = -_2404;
    float _2414 = _2412 + 1.0;
    float _2416 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2418 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2406);
    float _2420 = _2410 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2422 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2424 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2416);
    float _2426 = abs(_2414);
    float _2428 = log2(_2426);
    float _2430 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2418);
    float _2432 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2434 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2424);
    float _2436 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2438 = _2430 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2440 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2422);
    float _2442 = _2434 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2444 = _2408 * _2366;
    float _2446 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2448 = _2408 * _2378;
    float _2450 = -_2436;
    float _2452 = fma(_2450, _2432, 1.0);
    float _2454 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2456 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2440);
    float _2458 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2446);
    float _2460 = _2408 * _2374;
    float _2462 = -_2454;
    float _2464 = fma(_2448, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2462);
    float _2466 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2468 = _2456 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2470 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2458);
    float _2472 = -_2460;
    float _2474 = fma(_2472, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2464);
    float _2476 = exp2(_2466);
    float _2478 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2480 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2470);
    float _2482 = fma(_2474, -0.5, 0.5);
    float _2484 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2486 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2478);
    float _2488 = fma(_2474, 0.5, 0.5);
    float _2490 = log2(_2452);
    float _2492 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2484);
    float _2494 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2486);
    float _2496 = _2448 + 1.0;
    float _2498 = fma(_2488, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2500 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2492);
    float _2502 = 1.0 / _2480;
    float _2504 = -_2448;
    float _2506 = fma(_2476, _2496, _2504);
    float _2508 = fma(_2488, _2498, -0.212114393711090087890625);
    float _2510 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2494);
    float _2512 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2500);
    float _2514 = fma(_2506, 0.5, 0.5);
    float _2516 = fma(_2488, _2508, 1.570728778839111328125);
    float _2518 = sqrt(_2482);
    float _2520 = _2490 * 0.693147182464599609375;
    float _2522 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2524 = _2510 * _2502;
    float _2526 = _2512 * _2502;
    float _2528 = fma(_2524, 0.5, 0.5);
    float _2530 = fma(_2526, -0.5, 0.5);
    float _2532 = _2518 * 0.636619746685028076171875;
    float3 _6414 = float3(_2528, _2530, _2522);
    float _2534 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6414, float3(0.0), isnan(_6414)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6414, float3(0.0), isnan(_6414)), level(0.0)).x;
    float3 _6425 = float3(_2528, _2530, _2522);
    float4 _2537 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6425, float3(0.0), isnan(_6425)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6425, float3(0.0), isnan(_6425)), level(0.0)).xyzw;
    float _2539 = _2537.x;
    float _2541 = _2537.y;
    float _2543 = _2537.z;
    float _2545 = _2537.w;
    float _2547 = -_2516;
    float _2549 = fma(_2532, _2547, 1.0);
    float2 _6447 = float2(_2549, _2514);
    float3 _2553 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6447, float2(0.0), isnan(_6447)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6447, float2(0.0), isnan(_6447)), level(0.0)).xyz;
    float _2555 = _2553.x;
    float _2557 = _2553.y;
    float _2559 = _2553.z;
    float _2561 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2563 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2565 = _2224 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2567 = _2224 > 0.0;
    bool _2569 = isnan(_2224);
    bool _2571 = _2567 || _2569;
    bool _2573 = isnan(0.0);
    bool _2575 = _2571 || _2573;
    float _2577 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2563);
    float _2579 = exp2(_2561);
    float _2581 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2577);
    float _2583 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2581);
    float _2585 = _2583 + _2480;
    out.gl_Position.x = _2510;
    out.gl_Position.y = _2512;
    out.gl_Position.z = _2583;
    out.gl_Position.w = _2480;
    float _2587 = _2585 * 0.5;
    float _2589 = -_2579;
    float _2591 = _2589 + 1.0;
    float _2593 = _2565 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2595 = _2591 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.z = _2587;
    out.m_75.w = _2480;
    float _2597 = -_2595;
    float _2599 = _2597 + 1.0;
    out.m_47.x = _2593;
    float _2601 = _2595 * _2534;
    float _2603 = _2545 * _2601;
    float _2605 = _2559 * _2601;
    float _2607 = fma(_2555, _2603, _2539);
    float _2609 = fma(_2557, _2603, _2541);
    float _2611 = _2545 * _2599;
    float _2613 = fma(_2545, _2605, _2543);
    out.m_77.x = _2607;
    out.m_77.y = _2609;
    out.m_77.z = _2613;
    out.m_77.w = _2611;
    if (_2575)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2615 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2615;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1718 = false;
    bool _978 = false;
    bool _850 = false;
    bool _616 = false;
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
        float _2672 = as_type<float>(_112);
        out.gl_Position.z = _2672;
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
        float _2741 = as_type<float>(_148);
        out.gl_Position.z = _2741;
    }
    if (_140)
    {
        return out;
    }
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = in.m_51.z;
    float _156 = in.m_53.x;
    float _158 = in.m_53.y;
    float _160 = in.m_53.z;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_55.x;
    float _174 = in.m_55.y;
    float _176 = in.m_55.z;
    float _178 = in.m_57.w;
    float _180 = in.m_44.x;
    float _182 = in.m_44.y;
    float _184 = in.m_44.z;
    float _186 = _150 * _150;
    float _188 = _152 * _152;
    float _190 = fma(_156, _156, _186);
    float _192 = fma(_158, _158, _188);
    float _194 = fma(_172, _172, _190);
    float _196 = _154 * _154;
    float _198 = fma(_174, _174, _192);
    float _200 = sqrt(_194);
    float _202 = fma(_160, _160, _196);
    float _204 = fma(_176, _176, _202);
    float _206 = sqrt(_198);
    float _208 = sqrt(_204);
    bool _210 = _200 > 0.0;
    bool _212 = _206 > 0.0;
    float _214 = 0.0;
    float _216 = _198;
    float _218 = _172;
    if (_210)
    {
        float _220 = rsqrt(_194);
        _214 = _220;
    }
    float _222 = _214;
    float _224 = 0.0;
    float _226 = 0.0;
    if (!_210)
    {
        _224 = 0.0;
        _226 = 0.0;
    }
    float _228 = _224;
    float _230 = _226;
    bool _232 = _208 > 0.0;
    float _234 = in.m_49.x;
    float _236 = in.m_49.y;
    float _238 = in.m_49.z;
    float _240 = 0.0;
    float _242 = _230;
    float _244 = _228;
    if (!_210)
    {
        _240 = 0.0;
    }
    float _246 = _240;
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
    float _268 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _270 = 0.0;
    float _272 = _268;
    if (!_212)
    {
        _270 = 0.0;
    }
    float _274 = _270;
    float _276 = 0.0;
    float _278 = _274;
    if (!_232)
    {
        _276 = 0.0;
    }
    float _280 = _276;
    float _282 = _204;
    float _284 = _280;
    if (_232)
    {
        float _286 = rsqrt(_204);
        _282 = _286;
    }
    float _288 = _282;
    float _290 = _222;
    if (!_170)
    {
        float _292 = _268 * _268;
        float _294 = _292 * 0.5;
        _216 = _294;
    }
    float _296 = _216;
    float _298 = _296;
    if (_210)
    {
        float _300 = _222 * _156;
        _242 = _300;
    }
    float _302 = _242;
    if (_210)
    {
        float _304 = _222 * _150;
        _244 = _304;
    }
    float _306 = _244;
    if (_210)
    {
        float _308 = _222 * _172;
        _252 = _308;
    }
    float _310 = _252;
    float _312 = 0.0;
    if (!_232)
    {
        _312 = 0.0;
    }
    float _314 = _312;
    float _316 = _314;
    if (!_170)
    {
        float _318 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _298 = _318;
    }
    float _320 = _298;
    float _322 = _320;
    if (!_232)
    {
        _290 = 0.0;
    }
    float _324 = _290;
    float _326 = _324;
    if (_212)
    {
        float _328 = _266 * _158;
        _278 = _328;
    }
    float _330 = _278;
    if (_212)
    {
        float _332 = _266 * _152;
        _260 = _332;
    }
    float _334 = _260;
    if (_212)
    {
        float _336 = _266 * _174;
        _262 = _336;
    }
    float _338 = _262;
    if (_232)
    {
        float _340 = _288 * _160;
        _284 = _340;
    }
    float _342 = _284;
    if (_232)
    {
        float _344 = _288 * _154;
        _316 = _344;
    }
    float _346 = _316;
    float _348 = _346;
    if (_232)
    {
        float _350 = _288 * _176;
        _326 = _350;
    }
    float _352 = _326;
    bool _354 = !_170;
    if (!_354)
    {
        float _356 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = log2(_356);
        float _360 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _362 = _360 + 1.0;
        float _364 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _366 = _268 * _358;
        float _368 = 1.0 / _362;
        float _370 = _364 * 0.693147182464599609375;
        float _372 = exp2(_366);
        float _374 = 1.0 / _370;
        float _376 = _372 + (-1.0);
        float _378 = -_376;
        float _380 = fma(_378, _374, _268);
        float _382 = _380 * _368;
        float _384 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _322 = _384;
    }
    float _386 = _322;
    float _388 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _390 = !_170;
    float _392 = _386;
    if (!_390)
    {
        float _394 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _396 = log2(_394);
        float _398 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _400 = _398 + 1.0;
        float _402 = 1.0 / _400;
        float _404 = _268 * _396;
        float _406 = exp2(_404);
        float _408 = -_406;
        float _410 = _408 + 1.0;
        float _412 = _410 * _402;
        _272 = _412;
    }
    float _414 = _272;
    float _416 = _388 * _306;
    float _418 = _388 * _334;
    float _420 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _422 = _388 * _346;
    float _424 = 0.0;
    float _426 = _414;
    if (!_170)
    {
        float _428 = _130 * _130;
        float _430 = _428 * 0.5;
        _424 = _430;
    }
    float _432 = _424;
    float _434 = fma(_420, _302, _416);
    float _436 = fma(_420, _330, _418);
    float _438 = fma(_420, _342, _422);
    float _440 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_170)
    {
        float _442 = _432 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _392 = _442;
    }
    float _444 = _392;
    bool _446 = !_170;
    float _448 = _444;
    if (!_446)
    {
        float _450 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _452 = log2(_450);
        float _454 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _456 = _454 + 1.0;
        float _458 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _460 = _130 * _452;
        float _462 = exp2(_460);
        float _464 = _458 * 0.693147182464599609375;
        float _466 = 1.0 / _464;
        float _468 = 1.0 / _456;
        float _470 = _462 + (-1.0);
        float _472 = -_470;
        float _474 = fma(_472, _466, _130);
        float _476 = _474 * _468;
        float _478 = _476 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _448 = _478;
    }
    float _480 = _448;
    float _482 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _484 = fma(_440, _310, _434);
    float _486 = fma(_440, _338, _436);
    float _488 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _490 = _482 * _306;
    float _492 = _482 * _334;
    float _494 = _482 * _346;
    float _496 = fma(_440, _352, _438);
    float _498 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _500 = fma(_488, _330, _492);
    float _502 = fma(_488, _302, _490);
    float _504 = fma(_488, _342, _494);
    float _506 = fma(_414, _234, _484);
    float _508 = fma(_414, _236, _486);
    float _510 = fma(_414, _238, _496);
    float _512 = fma(_498, _338, _500);
    float _514 = fma(_498, _310, _502);
    float _516 = fma(_498, _352, _504);
    if (!_170)
    {
        _426 = _130;
    }
    float _518 = _426;
    bool _520 = !_170;
    float _522 = _518;
    if (!_520)
    {
        float _524 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _526 = log2(_524);
        float _528 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _530 = _528 + 1.0;
        float _532 = 1.0 / _530;
        float _534 = _130 * _526;
        float _536 = exp2(_534);
        float _538 = -_536;
        float _540 = _538 + 1.0;
        float _542 = _540 * _532;
        _522 = _542;
    }
    float _544 = _522;
    float _546 = fma(_544, _236, _512);
    bool _548 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _550 = fma(_544, _234, _514);
    float _552 = fma(_508, _178, _182);
    float _554 = -_546;
    float _556 = _508 + _554;
    float _558 = fma(_506, _178, _180);
    float _560 = -_550;
    float _562 = _506 + _560;
    float _564 = fma(_544, _238, _516);
    float _566 = _556 * _158;
    float _568 = _556 * _152;
    float _570 = _556 * _174;
    float _572 = -_564;
    float _574 = _510 + _572;
    float _576 = fma(_562, _156, _566);
    float _578 = fma(_562, _150, _568);
    float _580 = fma(_562, _172, _570);
    float _582 = fma(_510, _178, _184);
    float _584 = fma(_574, _160, _576);
    float _586 = fma(_574, _154, _578);
    float _588 = fma(_574, _176, _580);
    bool _590 = !_548;
    float _592 = _586;
    float _594 = _584;
    float _596 = _588;
    float _614;
    if (!_590)
    {
        float _598 = in.m_59.x;
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _602 = _598 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        float _618 = float(_96);
        float _620 = 1.0 / _618;
        float _622 = _130 * _620;
        _614 = _622;
    }
    _616 = false;
    float _624 = _614;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _628 = _624 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _632 = _624 + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _636 = _624 + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _646;
    float _650 = 1.0 / _644;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _668 = 1.0 / _640;
    bool _670 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _672 = isnan(_624);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _678 = _674 || _676;
    float _680 = float(_678);
    bool _682 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _684 = 1.0 / _648;
    float _686 = _628 * _668;
    bool _688 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _690 = isnan(_624);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -_680;
    float _702 = _700 + 1.0;
    float _704 = _632 * _650;
    bool _706 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _708 = isnan(_624);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = fma(_654, _686, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _720 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _722 = isnan(_624);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = _698 * _702;
    float _734 = _636 * _684;
    float _736 = -_698;
    float _738 = _736 + 1.0;
    float _740 = fma(_662, _686, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _742 = fma(_658, _704, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _744 = fma(_666, _704, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _746;
    float _750 = _730 * _738;
    float _752 = -_730;
    float _754 = _752 + 1.0;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _760 = fma(_748, _686, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _762 = _716 * _754;
    float _764 = fma(_758, _704, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _766 = in.m_57.x;
    float _768 = in.m_57.y;
    float _770 = in.m_57.z;
    float _772 = _718 * _762;
    float _774 = _760 * _762;
    float _776 = -_716;
    float _778 = _776 + 1.0;
    float _780 = _740 * _762;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _782;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _786;
    float _790 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[143].x, _774);
    float _792 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[143].y, _772);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _794;
    float _798 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[143].z, _780);
    float _800 = fma(_784, _734, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _802 = fma(_788, _734, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _804 = fma(_796, _734, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _806 = fma(_764, _750, _790);
    float _808 = fma(_742, _750, _792);
    float _810 = fma(_744, _750, _798);
    float _812 = fma(_800, _732, _806);
    float _814 = fma(_802, _732, _808);
    float _816 = fma(_804, _732, _810);
    float _818 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[146].x, _812);
    float _820 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[146].y, _814);
    float _822 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[146].z, _816);
    float _824 = _818 * _766;
    float _826 = _820 * _768;
    float _828 = _822 * _770;
    bool _830 = !_682;
    float _848;
    if (!_830)
    {
        float _832 = in.m_59.x;
        float _834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _836 = _832 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _840 = _838 * _834;
        float _842 = floor(_840);
        float _844 = -_842;
        float _846 = _840 + _844;
        _848 = _846;
        _850 = true;
    }
    else
    {
        float _852 = float(_96);
        float _854 = 1.0 / _852;
        float _856 = _130 * _854;
        _848 = _856;
    }
    _850 = false;
    float _858 = _848;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _862 = _858 + _860;
    bool _864 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _866 = isnan(_858);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _876;
    bool _880 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _882 = isnan(_858);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = -_874;
    float _894 = _892 + 1.0;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _896;
    float _900 = 1.0 / _878;
    bool _902 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _904 = _862 * _900;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _906;
    float _910 = _890 * _894;
    float _912 = fma(_898, _904, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _914 = -_890;
    float _916 = _914 + 1.0;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _918;
    float _922 = fma(_908, _904, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _924 = _912 * _910;
    float _926 = fma(_920, _904, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _928 = _922 * _910;
    float _930 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[107].x, _924);
    float _932 = _926 * _910;
    float _934 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[107].z, _928);
    float _936 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[108].x, _930);
    float _938 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[107].y, _932);
    float _940 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[108].z, _934);
    float _942 = _936 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _944 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[108].y, _938);
    float _946 = _940 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _950 = _944 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _952 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _956 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _952;
    out.m_61.y = _956;
    out.m_61.z = _954;
    out.m_61.w = _948;
    bool _958 = !_902;
    float _976;
    if (!_958)
    {
        float _960 = in.m_59.x;
        float _962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _964 = _960 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _966 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _968 = _966 * _962;
        float _970 = floor(_968);
        float _972 = -_970;
        float _974 = _968 + _972;
        _976 = _974;
        _978 = true;
    }
    else
    {
        float _980 = float(_96);
        float _982 = 1.0 / _980;
        float _984 = _130 * _982;
        _976 = _984;
    }
    _978 = false;
    float _986 = _976;
    float _988 = in.m_59.z;
    float _990 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _992 = log2(_990);
    float _994 = _824 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _996 = in.m_59.y;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1000 = _998 != 0;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1004 = _1002 != 0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1008 = _1006 != 0;
    float _1010 = in.m_59.x;
    bool _1012 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1014 = isnan(0.0);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1020 = _1016 || _1018;
    bool _1022 = !_1000;
    int _1024 = _1022 ? 0 : 1;
    float _1026 = _130 * _992;
    int _1028 = abs(_1024);
    float _1030 = exp2(_1026);
    float _1032 = _988 * 2.0;
    float _1034 = _996 + _988;
    float _1036 = _996 * 2.0;
    float _1038 = floor(_1032);
    float _1040 = _1010 * 2.0;
    float _1042 = _1034 + (-1.0);
    float _1044 = _1010 + _996;
    float _1046 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1048 = floor(_1040);
    float _1050 = -_1030;
    float _1052 = _1050 + 1.0;
    float _1054 = _1044 + (-1.0);
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1058 = 1.0 + _1056;
    float _1060 = _1020 ? _1052 : 0.0;
    float _1062 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1064 = _1038 > 0.0;
    float _1066 = floor(_1036);
    bool _1068 = _1038 >= 0.0;
    bool _1070 = isnan(_1038);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(0.0);
    bool _1076 = _1072 || _1074;
    float _1078 = in.m_63.x;
    float _1080 = in.m_63.y;
    float _1082 = in.m_63.z;
    int _1084 = _1076 ? 0 : 1;
    bool _1086 = _1048 >= 0.0;
    bool _1088 = isnan(_1048);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan(0.0);
    bool _1094 = _1090 || _1092;
    float _1096 = 1.0 / _1058;
    int _1098 = ~_1084;
    int _1100 = _1098 + 1;
    int _1102 = _1100 + 1;
    int _1104 = _1102;
    if (!_1064)
    {
        int _1106 = ~_1084;
        int _1108 = _1106 + 1;
        _1104 = _1108;
    }
    int _1110 = _1104;
    bool _1112 = _1048 > 0.0;
    float _1114 = float(_1028);
    float _1116 = float(_1110);
    bool _1118 = !_1004;
    int _1120 = _1118 ? 0 : 1;
    bool _1122 = _1066 >= 0.0;
    bool _1124 = isnan(_1066);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan(0.0);
    bool _1130 = _1126 || _1128;
    float _1132 = _1114 * _1116;
    int _1134 = _1094 ? 0 : 1;
    bool _1136 = _1066 > 0.0;
    float _1138 = _1132 * (-2.0);
    int _1140 = ~_1134;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    float _1146 = _1060 * _1096;
    int _1148 = _1144;
    if (!_1112)
    {
        int _1150 = ~_1134;
        int _1152 = _1150 + 1;
        _1148 = _1152;
    }
    int _1154 = _1148;
    float _1156 = fma(_1062, _1138, _1062);
    int _1158 = abs(_1120);
    float _1160 = fma(_1138, _1078, _1078);
    bool _1162 = !_1008;
    int _1164 = _1162 ? 0 : 1;
    float _1166 = _1010 + (-0.5);
    float _1168 = float(_1158);
    float _1170 = float(_1154);
    float _1172 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1160);
    bool _1174 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1176 = isnan(1.0);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1182 = _1178 || _1180;
    float _1184 = _996 + (-0.5);
    int _1186 = _1130 ? 0 : 1;
    float _1188 = _1168 * _1170;
    int _1190 = abs(_1164);
    bool _1192 = !_1182;
    float _1194 = _1192 ? _130 : _1146;
    int _1196 = ~_1186;
    int _1198 = _1196 + 1;
    int _1200 = _1198 + 1;
    float _1202 = _1188 * (-2.0);
    int _1204 = _1200;
    if (!_1136)
    {
        int _1206 = ~_1186;
        int _1208 = _1206 + 1;
        _1204 = _1208;
    }
    int _1210 = _1204;
    float _1212 = fma(_1194, _1156, _1172);
    float _1214 = float(_1190);
    float _1216 = fma(_1202, _1080, _1080);
    float _1218 = float(_1210);
    float _1220 = _1212 * 0.15915493667125701904296875;
    float _1222 = fma(_1046, _1202, _1046);
    float _1224 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1216);
    float _1226 = _1010 + _988;
    float _1228 = _1214 * _1218;
    float _1230 = fma(_1194, _1222, _1224);
    float _1232 = in.m_65.x;
    float _1234 = in.m_65.y;
    float _1236 = in.m_65.z;
    float _1238 = _1226 + (-1.0);
    float _1240 = _1228 * (-2.0);
    float _1242 = _988 + (-0.5);
    float _1244 = _1220 * 6.283185482025146484375;
    float _1246 = sin(_1244);
    float _1248 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1250 = fma(_1240, _1082, _1082);
    float _1252 = _1230 * 0.15915493667125701904296875;
    bool _1254 = _996 > 0.5;
    float _1256 = fma(_1248, _1240, _1248);
    float _1258 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1250);
    float _1260 = in.m_53.w;
    float _1262 = _1220 * 6.283185482025146484375;
    float _1264 = cos(_1262);
    float _1266 = fma(_1194, _1256, _1258);
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1270 = _1268 != 0;
    float _1272 = _1266 * 0.15915493667125701904296875;
    float _1274 = _1252 * 6.283185482025146484375;
    float _1276 = cos(_1274);
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1280 = _1278 != 0;
    float _1282 = _552 * _158;
    float _1284 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1232);
    float _1286 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1234);
    float _1288 = _826 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1290 = fma(_558, _156, _1282);
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1236);
    float _1294 = _1272 * 6.283185482025146484375;
    float _1296 = cos(_1294);
    float _1298 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1300 = fma(_582, _160, _1290);
    float _1302 = _1288 * _1286;
    float _1304 = _994 * _1284;
    float _1306 = _1298 * _1292;
    float _1308 = _1300 + _1260;
    float _1310 = in.m_55.w;
    float _1312 = _1252 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1246 * _1276;
    bool _1318 = _1010 > 0.5;
    bool _1320 = _1318 && _1270;
    float _1322 = _1272 * 6.283185482025146484375;
    float _1324 = sin(_1322);
    float _1326 = _1276 * _1296;
    float _1328 = _1296 * _1302;
    float _1330 = _1264 * _1276;
    float _1332 = _1264 * _1328;
    float _1334 = _1246 * _1328;
    float _1336 = _1246 * _1314;
    float _1338 = _1264 * _1314;
    float _1340 = _1314 * _1296;
    float _1342 = fma(_1324, _1330, _1336);
    float _1344 = -_1338;
    float _1346 = fma(_1324, _1316, _1344);
    float _1348 = -_1302;
    float _1350 = _1324 * _1348;
    float _1352 = -_1316;
    float _1354 = fma(_1324, _1338, _1352);
    float _1356 = fma(_1342, _1304, _1332);
    float _1358 = fma(_1324, _1336, _1330);
    float _1360 = fma(_1326, _1304, _1350);
    float _1362 = fma(_1346, _1304, _1334);
    float _1364 = fma(_1354, _1306, _1356);
    float _1366 = _552 * _174;
    float _1368 = fma(_1340, _1306, _1360);
    float _1370 = fma(_1358, _1306, _1362);
    float _1372 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1374 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1376 = fma(_558, _172, _1366);
    float _1378 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1372);
    float _1380 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1374);
    float _1382 = fma(_582, _176, _1376);
    float _1384 = in.m_67.y;
    float _1386 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1378);
    float _1388 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1380);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1390;
    float _1394 = _1382 + _1310;
    float _1396 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1398 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1400 = 1.0 / _1392;
    float _1402 = _552 * _152;
    float _1404 = _1308 + _1396;
    float _1406 = _1394 + _1398;
    float _1408 = in.m_51.w;
    float _1410 = fma(_558, _150, _1402);
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1414 = _1404 + _1412;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1418 = _1406 + _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1422 = _986 + _1420;
    float _1424 = in.m_67.x;
    float _1426 = _1414 * _1414;
    float _1428 = _1418 * _1418;
    float _1430 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1432 = fma(_582, _154, _1410);
    float _1434 = _1426 + _1428;
    float _1436 = _1422 * _1400;
    float _1438 = -_1384;
    float _1440 = _1438 + 1.0;
    float _1442 = sqrt(_1434);
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1444;
    float _1448 = _1384;
    float _1450 = _1272;
    float _1452 = _1446;
    float _1454 = _1426;
    float _1456 = _1428;
    if (_1280)
    {
        float _1458 = _1254 ? _1440 : _1384;
        _1448 = _1458;
    }
    float _1460 = _1448;
    float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1462;
    bool _1466 = _986 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1468 = isnan(_986);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1474 = _1470 || _1472;
    float _1476 = float(_1474);
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1478;
    float _1482 = fma(_1464, _1436, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1484 = _1432 + _1408;
    float _1486 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1430);
    bool _1488 = _986 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1490 = isnan(_986);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1496 = _1492 || _1494;
    float _1498 = float(_1496);
    float _1500 = fma(_1446, _1436, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1502 = fma(_1480, _1436, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1504 = -_1476;
    float _1506 = _1504 + 1.0;
    float _1508 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1486);
    bool _1510 = _1442 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1514 = _1424;
    float _1516 = _1442;
    if (_1270)
    {
        _1450 = _1424;
    }
    float _1518 = _1450;
    float _1520 = _1498 * _1506;
    float _1522 = _1508 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1524 = _1518;
    float _1526 = _1522;
    if (_1320)
    {
        float _1528 = -_1518;
        float _1530 = _1528 + 1.0;
        _1524 = _1530;
    }
    float _1532 = _1524;
    float _1534 = _1482 * _1520;
    float _1536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1538 = _1500 * _1520;
    float _1540 = _1502 * _1520;
    float _1542 = -_1498;
    float _1544 = _1542 + 1.0;
    float _1546 = _1484 + _1522;
    float _1548 = _1546;
    if (!_1510)
    {
        _1526 = _1428;
    }
    float _1550 = _1526;
    float _1552 = _1550;
    if (!_1510)
    {
        _1452 = _1426;
    }
    float _1554 = _1452;
    float _1556 = _1554;
    if (_1270)
    {
        _1514 = _1532;
    }
    float _1558 = _1514;
    if (!_1510)
    {
        _1454 = _1404;
    }
    float _1560 = _1454;
    float _1562 = _1560;
    if (!_1510)
    {
        _1456 = _1406;
    }
    float _1564 = _1456;
    bool _1566 = !_1510;
    float _1568 = _1564;
    if (!_1566)
    {
        float _1570 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1572 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1574 = _1442 + _1572;
        float _1576 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1578 = rsqrt(_1434);
        float _1580 = _1574 * _1570;
        float _1582 = _1580 * 0.15915493667125701904296875;
        float _1584 = _1582 * 6.283185482025146484375;
        float _1586 = sin(_1584);
        float _1588 = _1582 * 6.283185482025146484375;
        float _1590 = cos(_1588);
        float _1592 = fma(_1586, _1576, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1594 = _1578 * _1592;
        float _1596 = fma(_1414, _1594, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1598 = _1590 + (-1.0);
        float _1600 = fma(_1418, _1594, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1604 = _1596 + _1602;
        float _1606 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1610 = _1600 + _1608;
        float _1612 = _1604 * _1604;
        float _1614 = fma(_1546, _1590, _1606);
        float _1616 = _1610 * _1610;
        _1548 = _1614;
        _1556 = _1612;
        _1552 = _1616;
        _1562 = _1596;
        _1568 = _1600;
        _1516 = _1576;
    }
    float _1618 = _1548;
    float _1620 = _1556;
    float _1622 = _1552;
    float _1624 = _1562;
    float _1626 = _1568;
    float _1628 = _1516;
    float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1632 = _1618 + _1630;
    float _1634 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1534);
    float _1636 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1538);
    float _1638 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1540);
    float _1640 = fma(_1632, _1632, _1620);
    float _1642 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1634);
    float _1644 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1636);
    float _1646 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1638);
    float _1648 = _1640 + _1622;
    float _1650 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1652 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1654 = _1642 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1656 = _1644 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1658 = _1646 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1660 = sqrt(_1648);
    float _1662 = _1652 * _1512;
    float _1664 = _1650 * _1536;
    float _1666 = _1654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1668 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1670 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1662;
    out.m_69.y = _1664;
    out.m_71.x = 1.0;
    out.m_71.y = 1.0;
    out.m_71.z = 1.0;
    out.m_73.x = _1666;
    out.m_73.y = _1668;
    out.m_73.z = _1670;
    bool _1672 = _1660 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1674 = isnan(_1660);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1680 = _1676 || _1678;
    float _1682 = _1628;
    if (!_1680)
    {
        _1682 = 1.0;
    }
    float _1684 = _1682;
    bool _1686 = !_1680;
    float _1688 = _1684;
    if (!_1686)
    {
        bool _1690 = _1660 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1692 = isnan(_1660);
        bool _1694 = _1690 || _1692;
        bool _1696 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1698 = _1694 || _1696;
        if (!_1698)
        {
            float _1700 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1702 = _1660 + _1700;
            float _1704 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1706 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1704;
            float _1708 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1710 = _1708 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1712 = 1.0 / _1706;
            float _1714 = _1702 * _1712;
            float _1716 = fma(_1714, _1710, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1688 = _1716;
            _1718 = true;
        }
        else
        {
            bool _1720 = _1660 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1722 = isnan(_1660);
            bool _1724 = _1720 || _1722;
            bool _1726 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1728 = _1724 || _1726;
            if (!_1728)
            {
                float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1732 = _1660 + _1730;
                float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1736 = _1734 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1738 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1740 = _1738 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1742 = 1.0 / _1736;
                float _1744 = _1732 * _1742;
                float _1746 = fma(_1744, _1740, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1688 = _1746;
                _1718 = true;
            }
            else
            {
                _1688 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1718 = false;
    float _1748 = _1688;
    float _1750 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1752 = _1618 + _1750;
    float _1754 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1756 = _1624 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1760 = _1626 + _1758;
    float _1762 = fma(_1752, _1748, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1764 = fma(_1756, _1748, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1766 = fma(_1760, _1748, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1768 = -_1484;
    float _1770 = _1768 + _1762;
    float _1772 = -_1308;
    float _1774 = _1772 + _1764;
    float _1776 = -_1394;
    float _1778 = _1776 + _1766;
    float _1780 = _1770 * _1770;
    float _1782 = fma(_1774, _1774, _1780);
    float _1784 = fma(_1778, _1778, _1782);
    float _1786 = sqrt(_1784);
    bool _1788 = _1786 > 0.0;
    bool _1790 = !_1788;
    float _1792 = _1782;
    float _1794 = _1748;
    float _1796 = _1786;
    float _1798 = _1764;
    float _1800 = _1762;
    float _1802 = _1766;
    if (!_1790)
    {
        bool _1804 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1806 = _1476;
        if (_1804)
        {
            float _1808 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1806 = _1808;
        }
        float _1810 = _1806;
        if (_1804)
        {
            _1792 = _584;
        }
        float _1812 = _1792;
        float _1814 = _1812;
        if (_1804)
        {
            _1794 = _586;
        }
        float _1816 = _1794;
        float _1818 = _1816;
        if (_1804)
        {
            float _1820 = _584 * _1810;
            _1796 = _1820;
        }
        float _1822 = _1796;
        float _1824 = _1822;
        float _1826 = _1822;
        if (_1804)
        {
            float _1828 = _586 * _1810;
            _592 = _1828;
        }
        float _1830 = _592;
        float _1832 = _1830;
        if (_1804)
        {
            float _1834 = _588 * _1810;
            _594 = _1834;
        }
        float _1836 = _594;
        float _1838 = _1836;
        if (!_1804)
        {
            float _1840 = _130 + 1.0;
            if (!_170)
            {
                float _1842 = _1840 * _1840;
                float _1844 = _1842 * 0.5;
                _1824 = _1844;
            }
            float _1846 = _1824;
            float _1848 = _1846;
            if (!_170)
            {
                float _1850 = _1846 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1848 = _1850;
            }
            float _1852 = _1848;
            bool _1854 = !_170;
            float _1856 = _1852;
            if (!_1854)
            {
                float _1858 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1860 = log2(_1858);
                float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1864 = _1862 + 1.0;
                float _1866 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1868 = _1860 * _1840;
                float _1870 = 1.0 / _1864;
                float _1872 = _1866 * 0.693147182464599609375;
                float _1874 = exp2(_1868);
                float _1876 = 1.0 / _1872;
                float _1878 = _1874 + (-1.0);
                float _1880 = -_1878;
                float _1882 = fma(_1880, _1876, _1840);
                float _1884 = _1882 * _1870;
                float _1886 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1856 = _1886;
            }
            float _1888 = _1856;
            float _1890 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1892 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1894 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1896 = _1890 * _334;
            float _1898 = _1890 * _306;
            float _1900 = _1890 * _346;
            if (!_170)
            {
                _348 = _1840;
            }
            float _1902 = _348;
            float _1904 = fma(_1892, _330, _1896);
            float _1906 = fma(_1892, _302, _1898);
            float _1908 = fma(_1894, _338, _1904);
            bool _1910 = !_170;
            float _1912 = _1902;
            if (!_1910)
            {
                float _1914 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1916 = log2(_1914);
                float _1918 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1920 = _1918 + 1.0;
                float _1922 = 1.0 / _1920;
                float _1924 = _1916 * _1840;
                float _1926 = exp2(_1924);
                float _1928 = -_1926;
                float _1930 = _1928 + 1.0;
                float _1932 = _1930 * _1922;
                _1912 = _1932;
            }
            float _1934 = _1912;
            float _1936 = fma(_1894, _310, _1906);
            float _1938 = fma(_1892, _342, _1900);
            float _1940 = fma(_1934, _236, _1908);
            float _1942 = fma(_1934, _234, _1936);
            float _1944 = fma(_1894, _352, _1938);
            float _1946 = -_546;
            float _1948 = _1946 + _1940;
            float _1950 = -_550;
            float _1952 = _1950 + _1942;
            float _1954 = fma(_1934, _238, _1944);
            float _1956 = _1948 * _158;
            float _1958 = _1948 * _152;
            float _1960 = _1948 * _174;
            float _1962 = -_564;
            float _1964 = _1962 + _1954;
            float _1966 = fma(_1952, _156, _1956);
            float _1968 = fma(_1952, _150, _1958);
            float _1970 = fma(_1952, _172, _1960);
            float _1972 = fma(_1964, _160, _1966);
            float _1974 = fma(_1964, _154, _1968);
            float _1976 = fma(_1964, _176, _1970);
            _1818 = _1974;
            _1814 = _1972;
            _596 = _1976;
            _1826 = _1972;
            _1832 = _1974;
            _1838 = _1976;
        }
        float _1978 = _1818;
        float _1980 = _1814;
        float _1982 = _596;
        float _1984 = _1826;
        float _1986 = _1832;
        float _1988 = _1838;
        float _1990 = _1978 * _1978;
        float _1992 = fma(_1980, _1980, _1990);
        float _1994 = fma(_1982, _1982, _1992);
        float _1996 = rsqrt(_1784);
        float _1998 = sqrt(_1994);
        float _2000 = _1774 * _1996;
        float _2002 = _1770 * _1996;
        float _2004 = _1778 * _1996;
        bool _2006 = _1998 > 0.0;
        bool _2008 = !_2006;
        _218 = _1994;
        if (!_2008)
        {
            float _2010 = rsqrt(_1994);
            float _2012 = _2010 * _1978;
            float _2014 = _2010 * _1980;
            float _2016 = _2010 * _1982;
            float _2018 = _2002 * _2012;
            float _2020 = fma(_2000, _2014, _2018);
            float _2022 = fma(_2004, _2016, _2020);
            float _2024 = _2022 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2026 = fma(_1984, _2024, _1764);
            float _2028 = fma(_1986, _2024, _1762);
            float _2030 = fma(_1988, _2024, _1766);
            _1798 = _2026;
            _1800 = _2028;
            _1802 = _2030;
        }
    }
    float _2032 = _218;
    float _2034 = _1798;
    float _2036 = _1800;
    float _2038 = _1802;
    float _2040 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2042 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2040);
    bool _2044 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2046 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan(0.5);
    bool _2052 = _2048 || _2050;
    float _2054 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2056 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2060 = _2056 || _2058;
    bool _2062 = isnan(0.5);
    bool _2064 = _2060 || _2062;
    float _2066 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2042);
    float _2068 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2054);
    float _2070 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2072 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2068);
    float _2074 = 1.0 / _2070;
    float _2076 = _2072 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2078 = _2076 + _2070;
    float _2080 = _2036;
    float _2082 = _2034;
    float _2084 = _2038;
    float _2086 = _2032;
    float _2088 = _2078;
    float _2090 = _2074;
    if (!_2052)
    {
        float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2094 = _1484 + _2092;
        float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2098 = _1308 + _2096;
        float _2100 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2102 = -_1308;
        float _2104 = _2102 + _2034;
        float _2106 = _2094 * _2094;
        float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2110 = _1394 + _2108;
        float _2112 = -_1484;
        float _2114 = _2112 + _2036;
        float _2116 = -_1394;
        float _2118 = _2116 + _2038;
        float _2120 = fma(_2098, _2098, _2106);
        float _2122 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2124 = fma(_2110, _2110, _2120);
        float _2126 = sqrt(_2124);
        float _2128 = _2100 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2130 = precise::min(_2126, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2132 = _2130 * _2122;
        float _2134 = _2128 * _2132;
        float _2136 = fma(_2104, _2134, _1308);
        float _2138 = fma(_2114, _2134, _1484);
        float _2140 = fma(_2118, _2134, _1394);
        _2080 = _2138;
        _2082 = _2136;
        _2084 = _2140;
        _2086 = _2100;
    }
    float _2142 = _2080;
    float _2144 = _2082;
    float _2146 = _2084;
    float _2148 = _2086;
    float _2150 = _2148;
    if (_2064)
    {
        _2150 = 1.0;
    }
    float _2152 = _2150;
    float _2154 = _2078 * _2074;
    float _2156 = _2154 * 0.5;
    float _2158 = _2152;
    float _2160 = _2156;
    if (!_2064)
    {
        float _2162 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2166 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2164);
        float _2168 = _2162 * 0.15915493667125701904296875;
        float _2170 = _2168 * 6.283185482025146484375;
        float _2172 = cos(_2170);
        float _2174 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2176 = _2174 * 0.15915493667125701904296875;
        float _2178 = _2168 * 6.283185482025146484375;
        float _2180 = sin(_2178);
        float _2182 = 1.0 / _2172;
        float _2184 = _2176 * 6.283185482025146484375;
        float _2186 = cos(_2184);
        float _2188 = _2180 * _2182;
        float _2190 = 1.0 / _2166;
        float _2192 = _2186 * _2188;
        float _2194 = _2176 * 6.283185482025146484375;
        float _2196 = sin(_2194);
        float _2198 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2200 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2198;
        float _2202 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2204 = _2190 * _2202;
        float _2206 = 1.0 / _2192;
        float _2208 = 1.0 / _2200;
        float _2210 = _2196 * _2206;
        float _2212 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2214 = fma(_2210, _2204, _2212);
        float _2216 = _2214 * _2208;
        float _2218 = precise::clamp(_2216, 0.0, 1.0);
        _2088 = _2208;
        _2090 = _2176;
        _2158 = _2218;
    }
    float _2220 = _2088;
    float _2222 = _2090;
    float _2224 = _2158;
    float _2226 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2228 = _2142 + _2226;
    float _2230 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2232 = _2144 + _2230;
    float _2234 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2236 = _2146 + _2234;
    float _2238 = _2228 * _2228;
    float _2240 = fma(_2232, _2232, _2238);
    float _2242 = fma(_2236, _2236, _2240);
    float _2244 = rsqrt(_2242);
    float _2246 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2248 = _2232 * _2246;
    float _2250 = _2236 * _2246;
    float _2252 = _2248 * _2248;
    float _2254 = _2250 * _2250;
    float _2256 = _2252 + _2254;
    float _2258 = sqrt(_2256);
    bool _2260 = _2258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2264 = _2258 + _2262;
    float _2266 = _2244;
    float _2268 = _2220;
    float _2270 = _2264;
    float _2272 = _2228;
    float _2274 = _2222;
    float _2276 = _2246;
    float _2278 = _2248;
    if (_2260)
    {
        float _2280 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2266 = _2280;
    }
    float _2282 = _2266;
    if (_2260)
    {
        float _2284 = rsqrt(_2256);
        _2268 = _2284;
    }
    float _2286 = _2268;
    float _2288 = _2286;
    if (_2260)
    {
        float _2290 = _2264 * _2282;
        _2270 = _2290;
    }
    float _2292 = _2270;
    if (_2260)
    {
        float _2294 = _2292 * 0.15915493667125701904296875;
        _2160 = _2294;
    }
    float _2296 = _2160;
    float _2298 = _2282;
    if (_2260)
    {
        float _2300 = _2296 * 6.283185482025146484375;
        float _2302 = sin(_2300);
        _2298 = _2302;
    }
    float _2304 = _2298;
    float _2306 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2308 = precise::max(0.0, _2306);
    float _2310 = _2236;
    float _2312 = _2308;
    if (_2260)
    {
        float _2314 = _2296 * 6.283185482025146484375;
        float _2316 = cos(_2314);
        _2310 = _2316;
    }
    float _2318 = _2310;
    float _2320 = -_2246;
    float _2322 = -_2308;
    float _2324 = fma(_2228, _2320, _2322);
    if (!_2260)
    {
        _2272 = _2250;
    }
    float _2326 = _2272;
    float _2328 = _2326;
    if (_2260)
    {
        float _2330 = _2324 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2312 = _2330;
    }
    float _2332 = _2312;
    float _2334 = _2304;
    float _2336 = _2332;
    if (_2260)
    {
        float _2338 = fma(_2304, _2332, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2274 = _2338;
    }
    float _2340 = _2274;
    if (!_2260)
    {
        _2334 = _2324;
    }
    float _2342 = _2334;
    float _2344 = _2342;
    float _2346 = _2318;
    if (_2260)
    {
        float _2348 = _2318 + (-1.0);
        _2336 = _2348;
    }
    float _2350 = _2336;
    float _2352 = _2350;
    if (_2260)
    {
        float _2354 = _2286 * _2340;
        _2276 = _2354;
    }
    float _2356 = _2276;
    float _2358 = sqrt(_2242);
    if (_2260)
    {
        float _2360 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2288 = _2360;
    }
    float _2362 = _2288;
    if (_2260)
    {
        float _2364 = _2248 * _2356;
        _2278 = _2364;
    }
    float _2366 = _2278;
    if (!_2260)
    {
        _2352 = _2252;
    }
    float _2368 = _2352;
    float _2370 = _2368;
    if (_2260)
    {
        float _2372 = _2250 * _2356;
        _2328 = _2372;
    }
    float _2374 = _2328;
    if (_2260)
    {
        float _2376 = fma(_2324, _2318, _2362);
        _2344 = _2376;
    }
    float _2378 = _2344;
    if (_2260)
    {
        float _2380 = _2366 * _2366;
        _2370 = _2380;
    }
    float _2382 = _2370;
    if (!_2260)
    {
        _2346 = _2254;
    }
    float _2384 = _2346;
    float _2386 = _2384;
    if (_2260)
    {
        float _2388 = _2374 * _2374;
        _2386 = _2388;
    }
    float _2390 = _2386;
    float _2392 = fma(_2378, _2378, _2382);
    float _2394 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2396 = _2392 + _2390;
    float _2398 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2394);
    float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2402 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2400);
    float _2404 = precise::clamp(_2402, 0.0, 1.0);
    float _2406 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2408 = rsqrt(_2396);
    float _2410 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2398);
    float _2412 = -_2404;
    float _2414 = _2412 + 1.0;
    float _2416 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2418 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2406);
    float _2420 = _2410 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2422 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2424 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2416);
    float _2426 = abs(_2414);
    float _2428 = log2(_2426);
    float _2430 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2418);
    float _2432 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2434 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2424);
    float _2436 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2438 = _2430 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2440 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2422);
    float _2442 = _2434 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2444 = _2408 * _2366;
    float _2446 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2448 = _2408 * _2378;
    float _2450 = -_2436;
    float _2452 = fma(_2450, _2432, 1.0);
    float _2454 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2456 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2440);
    float _2458 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2446);
    float _2460 = _2408 * _2374;
    float _2462 = -_2454;
    float _2464 = fma(_2448, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2462);
    float _2466 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2468 = _2456 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2470 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2458);
    float _2472 = -_2460;
    float _2474 = fma(_2472, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2464);
    float _2476 = exp2(_2466);
    float _2478 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2480 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2470);
    float _2482 = fma(_2474, -0.5, 0.5);
    float _2484 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2486 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2478);
    float _2488 = fma(_2474, 0.5, 0.5);
    float _2490 = log2(_2452);
    float _2492 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2484);
    float _2494 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2486);
    float _2496 = _2448 + 1.0;
    float _2498 = fma(_2488, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2500 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2492);
    float _2502 = 1.0 / _2480;
    float _2504 = -_2448;
    float _2506 = fma(_2476, _2496, _2504);
    float _2508 = fma(_2488, _2498, -0.212114393711090087890625);
    float _2510 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2494);
    float _2512 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2500);
    float _2514 = fma(_2506, 0.5, 0.5);
    float _2516 = fma(_2488, _2508, 1.570728778839111328125);
    float _2518 = sqrt(_2482);
    float _2520 = _2490 * 0.693147182464599609375;
    float _2522 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2524 = _2510 * _2502;
    float _2526 = _2512 * _2502;
    float _2528 = fma(_2524, 0.5, 0.5);
    float _2530 = fma(_2526, -0.5, 0.5);
    float _2532 = _2518 * 0.636619746685028076171875;
    float3 _6414 = float3(_2528, _2530, _2522);
    float _2534 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6414, float3(0.0), isnan(_6414)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6414, float3(0.0), isnan(_6414)), level(0.0)).x;
    float3 _6425 = float3(_2528, _2530, _2522);
    float4 _2537 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6425, float3(0.0), isnan(_6425)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6425, float3(0.0), isnan(_6425)), level(0.0)).xyzw;
    float _2539 = _2537.x;
    float _2541 = _2537.y;
    float _2543 = _2537.z;
    float _2545 = _2537.w;
    float _2547 = -_2516;
    float _2549 = fma(_2532, _2547, 1.0);
    float2 _6447 = float2(_2549, _2514);
    float3 _2553 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6447, float2(0.0), isnan(_6447)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6447, float2(0.0), isnan(_6447)), level(0.0)).xyz;
    float _2555 = _2553.x;
    float _2557 = _2553.y;
    float _2559 = _2553.z;
    float _2561 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2563 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2565 = _2224 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2567 = _2224 > 0.0;
    bool _2569 = isnan(_2224);
    bool _2571 = _2567 || _2569;
    bool _2573 = isnan(0.0);
    bool _2575 = _2571 || _2573;
    float _2577 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2563);
    float _2579 = exp2(_2561);
    float _2581 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2577);
    float _2583 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2581);
    float _2585 = _2583 + _2480;
    out.gl_Position.x = _2510;
    out.gl_Position.y = _2512;
    out.gl_Position.z = _2583;
    out.gl_Position.w = _2480;
    float _2587 = _2585 * 0.5;
    float _2589 = -_2579;
    float _2591 = _2589 + 1.0;
    float _2593 = _2565 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2595 = _2591 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.z = _2587;
    out.m_75.w = _2480;
    float _2597 = -_2595;
    float _2599 = _2597 + 1.0;
    out.m_47.x = _2593;
    float _2601 = _2595 * _2534;
    float _2603 = _2545 * _2601;
    float _2605 = _2559 * _2601;
    float _2607 = fma(_2555, _2603, _2539);
    float _2609 = fma(_2557, _2603, _2541);
    float _2611 = _2545 * _2599;
    float _2613 = fma(_2545, _2605, _2543);
    out.m_77.x = _2607;
    out.m_77.y = _2609;
    out.m_77.z = _2613;
    out.m_77.w = _2611;
    if (_2575)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2615 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2615;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1718 = false;
    bool _978 = false;
    bool _850 = false;
    bool _616 = false;
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
        float _2672 = as_type<float>(_112);
        out.gl_Position.z = _2672;
    }
    if (!_100)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2741 = as_type<float>(_148);
        out.gl_Position.z = _2741;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = in.m_51.z;
    float _156 = in.m_53.x;
    float _158 = in.m_53.y;
    float _160 = in.m_53.z;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_55.x;
    float _174 = in.m_55.y;
    float _176 = in.m_55.z;
    float _178 = in.m_57.w;
    float _180 = in.m_44.x;
    float _182 = in.m_44.y;
    float _184 = in.m_44.z;
    float _186 = _150 * _150;
    float _188 = _152 * _152;
    float _190 = fma(_156, _156, _186);
    float _192 = fma(_158, _158, _188);
    float _194 = fma(_172, _172, _190);
    float _196 = _154 * _154;
    float _198 = fma(_174, _174, _192);
    float _200 = sqrt(_194);
    float _202 = fma(_160, _160, _196);
    float _204 = fma(_176, _176, _202);
    float _206 = sqrt(_198);
    float _208 = sqrt(_204);
    bool _210 = _200 > 0.0;
    bool _212 = _206 > 0.0;
    float _214 = 0.0;
    float _216 = _198;
    float _218 = _172;
    if (_210)
    {
        float _220 = rsqrt(_194);
        _214 = _220;
    }
    float _222 = _214;
    float _224 = 0.0;
    float _226 = 0.0;
    if (!_210)
    {
        _224 = 0.0;
        _226 = 0.0;
    }
    float _228 = _224;
    float _230 = _226;
    bool _232 = _208 > 0.0;
    float _234 = in.m_49.x;
    float _236 = in.m_49.y;
    float _238 = in.m_49.z;
    float _240 = 0.0;
    float _242 = _230;
    float _244 = _228;
    if (!_210)
    {
        _240 = 0.0;
    }
    float _246 = _240;
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
    float _268 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _270 = 0.0;
    float _272 = _268;
    if (!_212)
    {
        _270 = 0.0;
    }
    float _274 = _270;
    float _276 = 0.0;
    float _278 = _274;
    if (!_232)
    {
        _276 = 0.0;
    }
    float _280 = _276;
    float _282 = _204;
    float _284 = _280;
    if (_232)
    {
        float _286 = rsqrt(_204);
        _282 = _286;
    }
    float _288 = _282;
    float _290 = _222;
    if (!_170)
    {
        float _292 = _268 * _268;
        float _294 = _292 * 0.5;
        _216 = _294;
    }
    float _296 = _216;
    float _298 = _296;
    if (_210)
    {
        float _300 = _222 * _156;
        _242 = _300;
    }
    float _302 = _242;
    if (_210)
    {
        float _304 = _222 * _150;
        _244 = _304;
    }
    float _306 = _244;
    if (_210)
    {
        float _308 = _222 * _172;
        _252 = _308;
    }
    float _310 = _252;
    float _312 = 0.0;
    if (!_232)
    {
        _312 = 0.0;
    }
    float _314 = _312;
    float _316 = _314;
    if (!_170)
    {
        float _318 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _298 = _318;
    }
    float _320 = _298;
    float _322 = _320;
    if (!_232)
    {
        _290 = 0.0;
    }
    float _324 = _290;
    float _326 = _324;
    if (_212)
    {
        float _328 = _266 * _158;
        _278 = _328;
    }
    float _330 = _278;
    if (_212)
    {
        float _332 = _266 * _152;
        _260 = _332;
    }
    float _334 = _260;
    if (_212)
    {
        float _336 = _266 * _174;
        _262 = _336;
    }
    float _338 = _262;
    if (_232)
    {
        float _340 = _288 * _160;
        _284 = _340;
    }
    float _342 = _284;
    if (_232)
    {
        float _344 = _288 * _154;
        _316 = _344;
    }
    float _346 = _316;
    float _348 = _346;
    if (_232)
    {
        float _350 = _288 * _176;
        _326 = _350;
    }
    float _352 = _326;
    bool _354 = !_170;
    if (!_354)
    {
        float _356 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = log2(_356);
        float _360 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _362 = _360 + 1.0;
        float _364 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _366 = _268 * _358;
        float _368 = 1.0 / _362;
        float _370 = _364 * 0.693147182464599609375;
        float _372 = exp2(_366);
        float _374 = 1.0 / _370;
        float _376 = _372 + (-1.0);
        float _378 = -_376;
        float _380 = fma(_378, _374, _268);
        float _382 = _380 * _368;
        float _384 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _322 = _384;
    }
    float _386 = _322;
    float _388 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _390 = !_170;
    float _392 = _386;
    if (!_390)
    {
        float _394 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _396 = log2(_394);
        float _398 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _400 = _398 + 1.0;
        float _402 = 1.0 / _400;
        float _404 = _268 * _396;
        float _406 = exp2(_404);
        float _408 = -_406;
        float _410 = _408 + 1.0;
        float _412 = _410 * _402;
        _272 = _412;
    }
    float _414 = _272;
    float _416 = _388 * _306;
    float _418 = _388 * _334;
    float _420 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _422 = _388 * _346;
    float _424 = 0.0;
    float _426 = _414;
    if (!_170)
    {
        float _428 = _130 * _130;
        float _430 = _428 * 0.5;
        _424 = _430;
    }
    float _432 = _424;
    float _434 = fma(_420, _302, _416);
    float _436 = fma(_420, _330, _418);
    float _438 = fma(_420, _342, _422);
    float _440 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_170)
    {
        float _442 = _432 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _392 = _442;
    }
    float _444 = _392;
    bool _446 = !_170;
    float _448 = _444;
    if (!_446)
    {
        float _450 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _452 = log2(_450);
        float _454 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _456 = _454 + 1.0;
        float _458 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _460 = _130 * _452;
        float _462 = exp2(_460);
        float _464 = _458 * 0.693147182464599609375;
        float _466 = 1.0 / _464;
        float _468 = 1.0 / _456;
        float _470 = _462 + (-1.0);
        float _472 = -_470;
        float _474 = fma(_472, _466, _130);
        float _476 = _474 * _468;
        float _478 = _476 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _448 = _478;
    }
    float _480 = _448;
    float _482 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _484 = fma(_440, _310, _434);
    float _486 = fma(_440, _338, _436);
    float _488 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _490 = _482 * _306;
    float _492 = _482 * _334;
    float _494 = _482 * _346;
    float _496 = fma(_440, _352, _438);
    float _498 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _500 = fma(_488, _330, _492);
    float _502 = fma(_488, _302, _490);
    float _504 = fma(_488, _342, _494);
    float _506 = fma(_414, _234, _484);
    float _508 = fma(_414, _236, _486);
    float _510 = fma(_414, _238, _496);
    float _512 = fma(_498, _338, _500);
    float _514 = fma(_498, _310, _502);
    float _516 = fma(_498, _352, _504);
    if (!_170)
    {
        _426 = _130;
    }
    float _518 = _426;
    bool _520 = !_170;
    float _522 = _518;
    if (!_520)
    {
        float _524 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _526 = log2(_524);
        float _528 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _530 = _528 + 1.0;
        float _532 = 1.0 / _530;
        float _534 = _130 * _526;
        float _536 = exp2(_534);
        float _538 = -_536;
        float _540 = _538 + 1.0;
        float _542 = _540 * _532;
        _522 = _542;
    }
    float _544 = _522;
    float _546 = fma(_544, _236, _512);
    bool _548 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _550 = fma(_544, _234, _514);
    float _552 = fma(_508, _178, _182);
    float _554 = -_546;
    float _556 = _508 + _554;
    float _558 = fma(_506, _178, _180);
    float _560 = -_550;
    float _562 = _506 + _560;
    float _564 = fma(_544, _238, _516);
    float _566 = _556 * _158;
    float _568 = _556 * _152;
    float _570 = _556 * _174;
    float _572 = -_564;
    float _574 = _510 + _572;
    float _576 = fma(_562, _156, _566);
    float _578 = fma(_562, _150, _568);
    float _580 = fma(_562, _172, _570);
    float _582 = fma(_510, _178, _184);
    float _584 = fma(_574, _160, _576);
    float _586 = fma(_574, _154, _578);
    float _588 = fma(_574, _176, _580);
    bool _590 = !_548;
    float _592 = _586;
    float _594 = _584;
    float _596 = _588;
    float _614;
    if (!_590)
    {
        float _598 = in.m_59.x;
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _602 = _598 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        float _618 = float(_96);
        float _620 = 1.0 / _618;
        float _622 = _130 * _620;
        _614 = _622;
    }
    _616 = false;
    float _624 = _614;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _628 = _624 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _632 = _624 + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _636 = _624 + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _646;
    float _650 = 1.0 / _644;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _668 = 1.0 / _640;
    bool _670 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _672 = isnan(_624);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _678 = _674 || _676;
    float _680 = float(_678);
    bool _682 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _684 = 1.0 / _648;
    float _686 = _628 * _668;
    bool _688 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _690 = isnan(_624);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -_680;
    float _702 = _700 + 1.0;
    float _704 = _632 * _650;
    bool _706 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _708 = isnan(_624);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = fma(_654, _686, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _720 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _722 = isnan(_624);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = _698 * _702;
    float _734 = _636 * _684;
    float _736 = -_698;
    float _738 = _736 + 1.0;
    float _740 = fma(_662, _686, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _742 = fma(_658, _704, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _744 = fma(_666, _704, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _746;
    float _750 = _730 * _738;
    float _752 = -_730;
    float _754 = _752 + 1.0;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _760 = fma(_748, _686, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _762 = _716 * _754;
    float _764 = fma(_758, _704, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _766 = in.m_57.x;
    float _768 = in.m_57.y;
    float _770 = in.m_57.z;
    float _772 = _718 * _762;
    float _774 = _760 * _762;
    float _776 = -_716;
    float _778 = _776 + 1.0;
    float _780 = _740 * _762;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _782;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _786;
    float _790 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[143].x, _774);
    float _792 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[143].y, _772);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _794;
    float _798 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[143].z, _780);
    float _800 = fma(_784, _734, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _802 = fma(_788, _734, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _804 = fma(_796, _734, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _806 = fma(_764, _750, _790);
    float _808 = fma(_742, _750, _792);
    float _810 = fma(_744, _750, _798);
    float _812 = fma(_800, _732, _806);
    float _814 = fma(_802, _732, _808);
    float _816 = fma(_804, _732, _810);
    float _818 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[146].x, _812);
    float _820 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[146].y, _814);
    float _822 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[146].z, _816);
    float _824 = _818 * _766;
    float _826 = _820 * _768;
    float _828 = _822 * _770;
    bool _830 = !_682;
    float _848;
    if (!_830)
    {
        float _832 = in.m_59.x;
        float _834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _836 = _832 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _840 = _838 * _834;
        float _842 = floor(_840);
        float _844 = -_842;
        float _846 = _840 + _844;
        _848 = _846;
        _850 = true;
    }
    else
    {
        float _852 = float(_96);
        float _854 = 1.0 / _852;
        float _856 = _130 * _854;
        _848 = _856;
    }
    _850 = false;
    float _858 = _848;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _862 = _858 + _860;
    bool _864 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _866 = isnan(_858);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _876;
    bool _880 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _882 = isnan(_858);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = -_874;
    float _894 = _892 + 1.0;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _896;
    float _900 = 1.0 / _878;
    bool _902 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _904 = _862 * _900;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _906;
    float _910 = _890 * _894;
    float _912 = fma(_898, _904, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _914 = -_890;
    float _916 = _914 + 1.0;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _918;
    float _922 = fma(_908, _904, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _924 = _912 * _910;
    float _926 = fma(_920, _904, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _928 = _922 * _910;
    float _930 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[107].x, _924);
    float _932 = _926 * _910;
    float _934 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[107].z, _928);
    float _936 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[108].x, _930);
    float _938 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[107].y, _932);
    float _940 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[108].z, _934);
    float _942 = _936 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _944 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[108].y, _938);
    float _946 = _940 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _950 = _944 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _952 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _956 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _952;
    out.m_61.y = _956;
    out.m_61.z = _954;
    out.m_61.w = _948;
    bool _958 = !_902;
    float _976;
    if (!_958)
    {
        float _960 = in.m_59.x;
        float _962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _964 = _960 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _966 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _968 = _966 * _962;
        float _970 = floor(_968);
        float _972 = -_970;
        float _974 = _968 + _972;
        _976 = _974;
        _978 = true;
    }
    else
    {
        float _980 = float(_96);
        float _982 = 1.0 / _980;
        float _984 = _130 * _982;
        _976 = _984;
    }
    _978 = false;
    float _986 = _976;
    float _988 = in.m_59.z;
    float _990 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _992 = log2(_990);
    float _994 = _824 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _996 = in.m_59.y;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1000 = _998 != 0;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1004 = _1002 != 0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1008 = _1006 != 0;
    float _1010 = in.m_59.x;
    bool _1012 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1014 = isnan(0.0);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1020 = _1016 || _1018;
    bool _1022 = !_1000;
    int _1024 = _1022 ? 0 : 1;
    float _1026 = _130 * _992;
    int _1028 = abs(_1024);
    float _1030 = exp2(_1026);
    float _1032 = _988 * 2.0;
    float _1034 = _996 + _988;
    float _1036 = _996 * 2.0;
    float _1038 = floor(_1032);
    float _1040 = _1010 * 2.0;
    float _1042 = _1034 + (-1.0);
    float _1044 = _1010 + _996;
    float _1046 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1048 = floor(_1040);
    float _1050 = -_1030;
    float _1052 = _1050 + 1.0;
    float _1054 = _1044 + (-1.0);
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1058 = 1.0 + _1056;
    float _1060 = _1020 ? _1052 : 0.0;
    float _1062 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1064 = _1038 > 0.0;
    float _1066 = floor(_1036);
    bool _1068 = _1038 >= 0.0;
    bool _1070 = isnan(_1038);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(0.0);
    bool _1076 = _1072 || _1074;
    float _1078 = in.m_63.x;
    float _1080 = in.m_63.y;
    float _1082 = in.m_63.z;
    int _1084 = _1076 ? 0 : 1;
    bool _1086 = _1048 >= 0.0;
    bool _1088 = isnan(_1048);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan(0.0);
    bool _1094 = _1090 || _1092;
    float _1096 = 1.0 / _1058;
    int _1098 = ~_1084;
    int _1100 = _1098 + 1;
    int _1102 = _1100 + 1;
    int _1104 = _1102;
    if (!_1064)
    {
        int _1106 = ~_1084;
        int _1108 = _1106 + 1;
        _1104 = _1108;
    }
    int _1110 = _1104;
    bool _1112 = _1048 > 0.0;
    float _1114 = float(_1028);
    float _1116 = float(_1110);
    bool _1118 = !_1004;
    int _1120 = _1118 ? 0 : 1;
    bool _1122 = _1066 >= 0.0;
    bool _1124 = isnan(_1066);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan(0.0);
    bool _1130 = _1126 || _1128;
    float _1132 = _1114 * _1116;
    int _1134 = _1094 ? 0 : 1;
    bool _1136 = _1066 > 0.0;
    float _1138 = _1132 * (-2.0);
    int _1140 = ~_1134;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    float _1146 = _1060 * _1096;
    int _1148 = _1144;
    if (!_1112)
    {
        int _1150 = ~_1134;
        int _1152 = _1150 + 1;
        _1148 = _1152;
    }
    int _1154 = _1148;
    float _1156 = fma(_1062, _1138, _1062);
    int _1158 = abs(_1120);
    float _1160 = fma(_1138, _1078, _1078);
    bool _1162 = !_1008;
    int _1164 = _1162 ? 0 : 1;
    float _1166 = _1010 + (-0.5);
    float _1168 = float(_1158);
    float _1170 = float(_1154);
    float _1172 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1160);
    bool _1174 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1176 = isnan(1.0);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1182 = _1178 || _1180;
    float _1184 = _996 + (-0.5);
    int _1186 = _1130 ? 0 : 1;
    float _1188 = _1168 * _1170;
    int _1190 = abs(_1164);
    bool _1192 = !_1182;
    float _1194 = _1192 ? _130 : _1146;
    int _1196 = ~_1186;
    int _1198 = _1196 + 1;
    int _1200 = _1198 + 1;
    float _1202 = _1188 * (-2.0);
    int _1204 = _1200;
    if (!_1136)
    {
        int _1206 = ~_1186;
        int _1208 = _1206 + 1;
        _1204 = _1208;
    }
    int _1210 = _1204;
    float _1212 = fma(_1194, _1156, _1172);
    float _1214 = float(_1190);
    float _1216 = fma(_1202, _1080, _1080);
    float _1218 = float(_1210);
    float _1220 = _1212 * 0.15915493667125701904296875;
    float _1222 = fma(_1046, _1202, _1046);
    float _1224 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1216);
    float _1226 = _1010 + _988;
    float _1228 = _1214 * _1218;
    float _1230 = fma(_1194, _1222, _1224);
    float _1232 = in.m_65.x;
    float _1234 = in.m_65.y;
    float _1236 = in.m_65.z;
    float _1238 = _1226 + (-1.0);
    float _1240 = _1228 * (-2.0);
    float _1242 = _988 + (-0.5);
    float _1244 = _1220 * 6.283185482025146484375;
    float _1246 = sin(_1244);
    float _1248 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1250 = fma(_1240, _1082, _1082);
    float _1252 = _1230 * 0.15915493667125701904296875;
    bool _1254 = _996 > 0.5;
    float _1256 = fma(_1248, _1240, _1248);
    float _1258 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1250);
    float _1260 = in.m_53.w;
    float _1262 = _1220 * 6.283185482025146484375;
    float _1264 = cos(_1262);
    float _1266 = fma(_1194, _1256, _1258);
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1270 = _1268 != 0;
    float _1272 = _1266 * 0.15915493667125701904296875;
    float _1274 = _1252 * 6.283185482025146484375;
    float _1276 = cos(_1274);
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1280 = _1278 != 0;
    float _1282 = _552 * _158;
    float _1284 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1232);
    float _1286 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1234);
    float _1288 = _826 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1290 = fma(_558, _156, _1282);
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1236);
    float _1294 = _1272 * 6.283185482025146484375;
    float _1296 = cos(_1294);
    float _1298 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1300 = fma(_582, _160, _1290);
    float _1302 = _1288 * _1286;
    float _1304 = _994 * _1284;
    float _1306 = _1298 * _1292;
    float _1308 = _1300 + _1260;
    float _1310 = in.m_55.w;
    float _1312 = _1252 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1246 * _1276;
    bool _1318 = _1010 > 0.5;
    bool _1320 = _1318 && _1270;
    float _1322 = _1272 * 6.283185482025146484375;
    float _1324 = sin(_1322);
    float _1326 = _1276 * _1296;
    float _1328 = _1296 * _1302;
    float _1330 = _1264 * _1276;
    float _1332 = _1264 * _1328;
    float _1334 = _1246 * _1328;
    float _1336 = _1246 * _1314;
    float _1338 = _1264 * _1314;
    float _1340 = _1314 * _1296;
    float _1342 = fma(_1324, _1330, _1336);
    float _1344 = -_1338;
    float _1346 = fma(_1324, _1316, _1344);
    float _1348 = -_1302;
    float _1350 = _1324 * _1348;
    float _1352 = -_1316;
    float _1354 = fma(_1324, _1338, _1352);
    float _1356 = fma(_1342, _1304, _1332);
    float _1358 = fma(_1324, _1336, _1330);
    float _1360 = fma(_1326, _1304, _1350);
    float _1362 = fma(_1346, _1304, _1334);
    float _1364 = fma(_1354, _1306, _1356);
    float _1366 = _552 * _174;
    float _1368 = fma(_1340, _1306, _1360);
    float _1370 = fma(_1358, _1306, _1362);
    float _1372 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1374 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1376 = fma(_558, _172, _1366);
    float _1378 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1372);
    float _1380 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1374);
    float _1382 = fma(_582, _176, _1376);
    float _1384 = in.m_67.y;
    float _1386 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1378);
    float _1388 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1380);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1390;
    float _1394 = _1382 + _1310;
    float _1396 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1398 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1400 = 1.0 / _1392;
    float _1402 = _552 * _152;
    float _1404 = _1308 + _1396;
    float _1406 = _1394 + _1398;
    float _1408 = in.m_51.w;
    float _1410 = fma(_558, _150, _1402);
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1414 = _1404 + _1412;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1418 = _1406 + _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1422 = _986 + _1420;
    float _1424 = in.m_67.x;
    float _1426 = _1414 * _1414;
    float _1428 = _1418 * _1418;
    float _1430 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1432 = fma(_582, _154, _1410);
    float _1434 = _1426 + _1428;
    float _1436 = _1422 * _1400;
    float _1438 = -_1384;
    float _1440 = _1438 + 1.0;
    float _1442 = sqrt(_1434);
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1444;
    float _1448 = _1384;
    float _1450 = _1272;
    float _1452 = _1446;
    float _1454 = _1426;
    float _1456 = _1428;
    if (_1280)
    {
        float _1458 = _1254 ? _1440 : _1384;
        _1448 = _1458;
    }
    float _1460 = _1448;
    float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1462;
    bool _1466 = _986 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1468 = isnan(_986);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1474 = _1470 || _1472;
    float _1476 = float(_1474);
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1478;
    float _1482 = fma(_1464, _1436, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1484 = _1432 + _1408;
    float _1486 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1430);
    bool _1488 = _986 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1490 = isnan(_986);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1496 = _1492 || _1494;
    float _1498 = float(_1496);
    float _1500 = fma(_1446, _1436, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1502 = fma(_1480, _1436, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1504 = -_1476;
    float _1506 = _1504 + 1.0;
    float _1508 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1486);
    bool _1510 = _1442 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1514 = _1424;
    float _1516 = _1442;
    if (_1270)
    {
        _1450 = _1424;
    }
    float _1518 = _1450;
    float _1520 = _1498 * _1506;
    float _1522 = _1508 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1524 = _1518;
    float _1526 = _1522;
    if (_1320)
    {
        float _1528 = -_1518;
        float _1530 = _1528 + 1.0;
        _1524 = _1530;
    }
    float _1532 = _1524;
    float _1534 = _1482 * _1520;
    float _1536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1538 = _1500 * _1520;
    float _1540 = _1502 * _1520;
    float _1542 = -_1498;
    float _1544 = _1542 + 1.0;
    float _1546 = _1484 + _1522;
    float _1548 = _1546;
    if (!_1510)
    {
        _1526 = _1428;
    }
    float _1550 = _1526;
    float _1552 = _1550;
    if (!_1510)
    {
        _1452 = _1426;
    }
    float _1554 = _1452;
    float _1556 = _1554;
    if (_1270)
    {
        _1514 = _1532;
    }
    float _1558 = _1514;
    if (!_1510)
    {
        _1454 = _1404;
    }
    float _1560 = _1454;
    float _1562 = _1560;
    if (!_1510)
    {
        _1456 = _1406;
    }
    float _1564 = _1456;
    bool _1566 = !_1510;
    float _1568 = _1564;
    if (!_1566)
    {
        float _1570 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1572 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1574 = _1442 + _1572;
        float _1576 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1578 = rsqrt(_1434);
        float _1580 = _1574 * _1570;
        float _1582 = _1580 * 0.15915493667125701904296875;
        float _1584 = _1582 * 6.283185482025146484375;
        float _1586 = sin(_1584);
        float _1588 = _1582 * 6.283185482025146484375;
        float _1590 = cos(_1588);
        float _1592 = fma(_1586, _1576, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1594 = _1578 * _1592;
        float _1596 = fma(_1414, _1594, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1598 = _1590 + (-1.0);
        float _1600 = fma(_1418, _1594, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1604 = _1596 + _1602;
        float _1606 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1610 = _1600 + _1608;
        float _1612 = _1604 * _1604;
        float _1614 = fma(_1546, _1590, _1606);
        float _1616 = _1610 * _1610;
        _1548 = _1614;
        _1556 = _1612;
        _1552 = _1616;
        _1562 = _1596;
        _1568 = _1600;
        _1516 = _1576;
    }
    float _1618 = _1548;
    float _1620 = _1556;
    float _1622 = _1552;
    float _1624 = _1562;
    float _1626 = _1568;
    float _1628 = _1516;
    float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1632 = _1618 + _1630;
    float _1634 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1534);
    float _1636 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1538);
    float _1638 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1540);
    float _1640 = fma(_1632, _1632, _1620);
    float _1642 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1634);
    float _1644 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1636);
    float _1646 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1638);
    float _1648 = _1640 + _1622;
    float _1650 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1652 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1654 = _1642 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1656 = _1644 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1658 = _1646 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1660 = sqrt(_1648);
    float _1662 = _1652 * _1512;
    float _1664 = _1650 * _1536;
    float _1666 = _1654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1668 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1670 = _1658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1662;
    out.m_69.y = _1664;
    out.m_71.x = 1.0;
    out.m_71.y = 1.0;
    out.m_71.z = 1.0;
    out.m_73.x = _1666;
    out.m_73.y = _1668;
    out.m_73.z = _1670;
    bool _1672 = _1660 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1674 = isnan(_1660);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1680 = _1676 || _1678;
    float _1682 = _1628;
    if (!_1680)
    {
        _1682 = 1.0;
    }
    float _1684 = _1682;
    bool _1686 = !_1680;
    float _1688 = _1684;
    if (!_1686)
    {
        bool _1690 = _1660 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1692 = isnan(_1660);
        bool _1694 = _1690 || _1692;
        bool _1696 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1698 = _1694 || _1696;
        if (!_1698)
        {
            float _1700 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1702 = _1660 + _1700;
            float _1704 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1706 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1704;
            float _1708 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1710 = _1708 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1712 = 1.0 / _1706;
            float _1714 = _1702 * _1712;
            float _1716 = fma(_1714, _1710, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1688 = _1716;
            _1718 = true;
        }
        else
        {
            bool _1720 = _1660 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1722 = isnan(_1660);
            bool _1724 = _1720 || _1722;
            bool _1726 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1728 = _1724 || _1726;
            if (!_1728)
            {
                float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1732 = _1660 + _1730;
                float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1736 = _1734 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1738 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1740 = _1738 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1742 = 1.0 / _1736;
                float _1744 = _1732 * _1742;
                float _1746 = fma(_1744, _1740, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1688 = _1746;
                _1718 = true;
            }
            else
            {
                _1688 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1718 = false;
    float _1748 = _1688;
    float _1750 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1752 = _1618 + _1750;
    float _1754 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1756 = _1624 + _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1760 = _1626 + _1758;
    float _1762 = fma(_1752, _1748, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1764 = fma(_1756, _1748, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1766 = fma(_1760, _1748, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1768 = -_1484;
    float _1770 = _1768 + _1762;
    float _1772 = -_1308;
    float _1774 = _1772 + _1764;
    float _1776 = -_1394;
    float _1778 = _1776 + _1766;
    float _1780 = _1770 * _1770;
    float _1782 = fma(_1774, _1774, _1780);
    float _1784 = fma(_1778, _1778, _1782);
    float _1786 = sqrt(_1784);
    bool _1788 = _1786 > 0.0;
    bool _1790 = !_1788;
    float _1792 = _1782;
    float _1794 = _1748;
    float _1796 = _1786;
    float _1798 = _1764;
    float _1800 = _1762;
    float _1802 = _1766;
    if (!_1790)
    {
        bool _1804 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1806 = _1476;
        if (_1804)
        {
            float _1808 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1806 = _1808;
        }
        float _1810 = _1806;
        if (_1804)
        {
            _1792 = _584;
        }
        float _1812 = _1792;
        float _1814 = _1812;
        if (_1804)
        {
            _1794 = _586;
        }
        float _1816 = _1794;
        float _1818 = _1816;
        if (_1804)
        {
            float _1820 = _584 * _1810;
            _1796 = _1820;
        }
        float _1822 = _1796;
        float _1824 = _1822;
        float _1826 = _1822;
        if (_1804)
        {
            float _1828 = _586 * _1810;
            _592 = _1828;
        }
        float _1830 = _592;
        float _1832 = _1830;
        if (_1804)
        {
            float _1834 = _588 * _1810;
            _594 = _1834;
        }
        float _1836 = _594;
        float _1838 = _1836;
        if (!_1804)
        {
            float _1840 = _130 + 1.0;
            if (!_170)
            {
                float _1842 = _1840 * _1840;
                float _1844 = _1842 * 0.5;
                _1824 = _1844;
            }
            float _1846 = _1824;
            float _1848 = _1846;
            if (!_170)
            {
                float _1850 = _1846 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1848 = _1850;
            }
            float _1852 = _1848;
            bool _1854 = !_170;
            float _1856 = _1852;
            if (!_1854)
            {
                float _1858 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1860 = log2(_1858);
                float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1864 = _1862 + 1.0;
                float _1866 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1868 = _1860 * _1840;
                float _1870 = 1.0 / _1864;
                float _1872 = _1866 * 0.693147182464599609375;
                float _1874 = exp2(_1868);
                float _1876 = 1.0 / _1872;
                float _1878 = _1874 + (-1.0);
                float _1880 = -_1878;
                float _1882 = fma(_1880, _1876, _1840);
                float _1884 = _1882 * _1870;
                float _1886 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1856 = _1886;
            }
            float _1888 = _1856;
            float _1890 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1892 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1894 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1896 = _1890 * _334;
            float _1898 = _1890 * _306;
            float _1900 = _1890 * _346;
            if (!_170)
            {
                _348 = _1840;
            }
            float _1902 = _348;
            float _1904 = fma(_1892, _330, _1896);
            float _1906 = fma(_1892, _302, _1898);
            float _1908 = fma(_1894, _338, _1904);
            bool _1910 = !_170;
            float _1912 = _1902;
            if (!_1910)
            {
                float _1914 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1916 = log2(_1914);
                float _1918 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1920 = _1918 + 1.0;
                float _1922 = 1.0 / _1920;
                float _1924 = _1916 * _1840;
                float _1926 = exp2(_1924);
                float _1928 = -_1926;
                float _1930 = _1928 + 1.0;
                float _1932 = _1930 * _1922;
                _1912 = _1932;
            }
            float _1934 = _1912;
            float _1936 = fma(_1894, _310, _1906);
            float _1938 = fma(_1892, _342, _1900);
            float _1940 = fma(_1934, _236, _1908);
            float _1942 = fma(_1934, _234, _1936);
            float _1944 = fma(_1894, _352, _1938);
            float _1946 = -_546;
            float _1948 = _1946 + _1940;
            float _1950 = -_550;
            float _1952 = _1950 + _1942;
            float _1954 = fma(_1934, _238, _1944);
            float _1956 = _1948 * _158;
            float _1958 = _1948 * _152;
            float _1960 = _1948 * _174;
            float _1962 = -_564;
            float _1964 = _1962 + _1954;
            float _1966 = fma(_1952, _156, _1956);
            float _1968 = fma(_1952, _150, _1958);
            float _1970 = fma(_1952, _172, _1960);
            float _1972 = fma(_1964, _160, _1966);
            float _1974 = fma(_1964, _154, _1968);
            float _1976 = fma(_1964, _176, _1970);
            _1818 = _1974;
            _1814 = _1972;
            _596 = _1976;
            _1826 = _1972;
            _1832 = _1974;
            _1838 = _1976;
        }
        float _1978 = _1818;
        float _1980 = _1814;
        float _1982 = _596;
        float _1984 = _1826;
        float _1986 = _1832;
        float _1988 = _1838;
        float _1990 = _1978 * _1978;
        float _1992 = fma(_1980, _1980, _1990);
        float _1994 = fma(_1982, _1982, _1992);
        float _1996 = rsqrt(_1784);
        float _1998 = sqrt(_1994);
        float _2000 = _1774 * _1996;
        float _2002 = _1770 * _1996;
        float _2004 = _1778 * _1996;
        bool _2006 = _1998 > 0.0;
        bool _2008 = !_2006;
        _218 = _1994;
        if (!_2008)
        {
            float _2010 = rsqrt(_1994);
            float _2012 = _2010 * _1978;
            float _2014 = _2010 * _1980;
            float _2016 = _2010 * _1982;
            float _2018 = _2002 * _2012;
            float _2020 = fma(_2000, _2014, _2018);
            float _2022 = fma(_2004, _2016, _2020);
            float _2024 = _2022 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2026 = fma(_1984, _2024, _1764);
            float _2028 = fma(_1986, _2024, _1762);
            float _2030 = fma(_1988, _2024, _1766);
            _1798 = _2026;
            _1800 = _2028;
            _1802 = _2030;
        }
    }
    float _2032 = _218;
    float _2034 = _1798;
    float _2036 = _1800;
    float _2038 = _1802;
    float _2040 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2042 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2040);
    bool _2044 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2046 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan(0.5);
    bool _2052 = _2048 || _2050;
    float _2054 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2056 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2060 = _2056 || _2058;
    bool _2062 = isnan(0.5);
    bool _2064 = _2060 || _2062;
    float _2066 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2042);
    float _2068 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2054);
    float _2070 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2072 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2068);
    float _2074 = 1.0 / _2070;
    float _2076 = _2072 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2078 = _2076 + _2070;
    float _2080 = _2036;
    float _2082 = _2034;
    float _2084 = _2038;
    float _2086 = _2032;
    float _2088 = _2078;
    float _2090 = _2074;
    if (!_2052)
    {
        float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2094 = _1484 + _2092;
        float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2098 = _1308 + _2096;
        float _2100 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2102 = -_1308;
        float _2104 = _2102 + _2034;
        float _2106 = _2094 * _2094;
        float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2110 = _1394 + _2108;
        float _2112 = -_1484;
        float _2114 = _2112 + _2036;
        float _2116 = -_1394;
        float _2118 = _2116 + _2038;
        float _2120 = fma(_2098, _2098, _2106);
        float _2122 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2124 = fma(_2110, _2110, _2120);
        float _2126 = sqrt(_2124);
        float _2128 = _2100 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2130 = precise::min(_2126, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2132 = _2130 * _2122;
        float _2134 = _2128 * _2132;
        float _2136 = fma(_2104, _2134, _1308);
        float _2138 = fma(_2114, _2134, _1484);
        float _2140 = fma(_2118, _2134, _1394);
        _2080 = _2138;
        _2082 = _2136;
        _2084 = _2140;
        _2086 = _2100;
    }
    float _2142 = _2080;
    float _2144 = _2082;
    float _2146 = _2084;
    float _2148 = _2086;
    float _2150 = _2148;
    if (_2064)
    {
        _2150 = 1.0;
    }
    float _2152 = _2150;
    float _2154 = _2078 * _2074;
    float _2156 = _2154 * 0.5;
    float _2158 = _2152;
    float _2160 = _2156;
    if (!_2064)
    {
        float _2162 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2164 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2166 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2164);
        float _2168 = _2162 * 0.15915493667125701904296875;
        float _2170 = _2168 * 6.283185482025146484375;
        float _2172 = cos(_2170);
        float _2174 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2176 = _2174 * 0.15915493667125701904296875;
        float _2178 = _2168 * 6.283185482025146484375;
        float _2180 = sin(_2178);
        float _2182 = 1.0 / _2172;
        float _2184 = _2176 * 6.283185482025146484375;
        float _2186 = cos(_2184);
        float _2188 = _2180 * _2182;
        float _2190 = 1.0 / _2166;
        float _2192 = _2186 * _2188;
        float _2194 = _2176 * 6.283185482025146484375;
        float _2196 = sin(_2194);
        float _2198 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2200 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2198;
        float _2202 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2204 = _2190 * _2202;
        float _2206 = 1.0 / _2192;
        float _2208 = 1.0 / _2200;
        float _2210 = _2196 * _2206;
        float _2212 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2214 = fma(_2210, _2204, _2212);
        float _2216 = _2214 * _2208;
        float _2218 = precise::clamp(_2216, 0.0, 1.0);
        _2088 = _2208;
        _2090 = _2176;
        _2158 = _2218;
    }
    float _2220 = _2088;
    float _2222 = _2090;
    float _2224 = _2158;
    float _2226 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2228 = _2142 + _2226;
    float _2230 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2232 = _2144 + _2230;
    float _2234 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2236 = _2146 + _2234;
    float _2238 = _2228 * _2228;
    float _2240 = fma(_2232, _2232, _2238);
    float _2242 = fma(_2236, _2236, _2240);
    float _2244 = rsqrt(_2242);
    float _2246 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2248 = _2232 * _2246;
    float _2250 = _2236 * _2246;
    float _2252 = _2248 * _2248;
    float _2254 = _2250 * _2250;
    float _2256 = _2252 + _2254;
    float _2258 = sqrt(_2256);
    bool _2260 = _2258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2264 = _2258 + _2262;
    float _2266 = _2244;
    float _2268 = _2220;
    float _2270 = _2264;
    float _2272 = _2228;
    float _2274 = _2222;
    float _2276 = _2246;
    float _2278 = _2248;
    if (_2260)
    {
        float _2280 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2266 = _2280;
    }
    float _2282 = _2266;
    if (_2260)
    {
        float _2284 = rsqrt(_2256);
        _2268 = _2284;
    }
    float _2286 = _2268;
    float _2288 = _2286;
    if (_2260)
    {
        float _2290 = _2264 * _2282;
        _2270 = _2290;
    }
    float _2292 = _2270;
    if (_2260)
    {
        float _2294 = _2292 * 0.15915493667125701904296875;
        _2160 = _2294;
    }
    float _2296 = _2160;
    float _2298 = _2282;
    if (_2260)
    {
        float _2300 = _2296 * 6.283185482025146484375;
        float _2302 = sin(_2300);
        _2298 = _2302;
    }
    float _2304 = _2298;
    float _2306 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2308 = precise::max(0.0, _2306);
    float _2310 = _2236;
    float _2312 = _2308;
    if (_2260)
    {
        float _2314 = _2296 * 6.283185482025146484375;
        float _2316 = cos(_2314);
        _2310 = _2316;
    }
    float _2318 = _2310;
    float _2320 = -_2246;
    float _2322 = -_2308;
    float _2324 = fma(_2228, _2320, _2322);
    if (!_2260)
    {
        _2272 = _2250;
    }
    float _2326 = _2272;
    float _2328 = _2326;
    if (_2260)
    {
        float _2330 = _2324 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2312 = _2330;
    }
    float _2332 = _2312;
    float _2334 = _2304;
    float _2336 = _2332;
    if (_2260)
    {
        float _2338 = fma(_2304, _2332, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2274 = _2338;
    }
    float _2340 = _2274;
    if (!_2260)
    {
        _2334 = _2324;
    }
    float _2342 = _2334;
    float _2344 = _2342;
    float _2346 = _2318;
    if (_2260)
    {
        float _2348 = _2318 + (-1.0);
        _2336 = _2348;
    }
    float _2350 = _2336;
    float _2352 = _2350;
    if (_2260)
    {
        float _2354 = _2286 * _2340;
        _2276 = _2354;
    }
    float _2356 = _2276;
    float _2358 = sqrt(_2242);
    if (_2260)
    {
        float _2360 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2288 = _2360;
    }
    float _2362 = _2288;
    if (_2260)
    {
        float _2364 = _2248 * _2356;
        _2278 = _2364;
    }
    float _2366 = _2278;
    if (!_2260)
    {
        _2352 = _2252;
    }
    float _2368 = _2352;
    float _2370 = _2368;
    if (_2260)
    {
        float _2372 = _2250 * _2356;
        _2328 = _2372;
    }
    float _2374 = _2328;
    if (_2260)
    {
        float _2376 = fma(_2324, _2318, _2362);
        _2344 = _2376;
    }
    float _2378 = _2344;
    if (_2260)
    {
        float _2380 = _2366 * _2366;
        _2370 = _2380;
    }
    float _2382 = _2370;
    if (!_2260)
    {
        _2346 = _2254;
    }
    float _2384 = _2346;
    float _2386 = _2384;
    if (_2260)
    {
        float _2388 = _2374 * _2374;
        _2386 = _2388;
    }
    float _2390 = _2386;
    float _2392 = fma(_2378, _2378, _2382);
    float _2394 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2396 = _2392 + _2390;
    float _2398 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2394);
    float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2402 = fma(_2358, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2400);
    float _2404 = precise::clamp(_2402, 0.0, 1.0);
    float _2406 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2408 = rsqrt(_2396);
    float _2410 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2398);
    float _2412 = -_2404;
    float _2414 = _2412 + 1.0;
    float _2416 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2418 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2406);
    float _2420 = _2410 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2422 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2424 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2416);
    float _2426 = abs(_2414);
    float _2428 = log2(_2426);
    float _2430 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2418);
    float _2432 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2434 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2424);
    float _2436 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2438 = _2430 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2440 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2422);
    float _2442 = _2434 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2444 = _2408 * _2366;
    float _2446 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2448 = _2408 * _2378;
    float _2450 = -_2436;
    float _2452 = fma(_2450, _2432, 1.0);
    float _2454 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2456 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2440);
    float _2458 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2446);
    float _2460 = _2408 * _2374;
    float _2462 = -_2454;
    float _2464 = fma(_2448, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2462);
    float _2466 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2468 = _2456 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2470 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2458);
    float _2472 = -_2460;
    float _2474 = fma(_2472, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2464);
    float _2476 = exp2(_2466);
    float _2478 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2480 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2470);
    float _2482 = fma(_2474, -0.5, 0.5);
    float _2484 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2486 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2478);
    float _2488 = fma(_2474, 0.5, 0.5);
    float _2490 = log2(_2452);
    float _2492 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2484);
    float _2494 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2486);
    float _2496 = _2448 + 1.0;
    float _2498 = fma(_2488, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2500 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2492);
    float _2502 = 1.0 / _2480;
    float _2504 = -_2448;
    float _2506 = fma(_2476, _2496, _2504);
    float _2508 = fma(_2488, _2498, -0.212114393711090087890625);
    float _2510 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2494);
    float _2512 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2500);
    float _2514 = fma(_2506, 0.5, 0.5);
    float _2516 = fma(_2488, _2508, 1.570728778839111328125);
    float _2518 = sqrt(_2482);
    float _2520 = _2490 * 0.693147182464599609375;
    float _2522 = _2520 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2524 = _2510 * _2502;
    float _2526 = _2512 * _2502;
    float _2528 = fma(_2524, 0.5, 0.5);
    float _2530 = fma(_2526, -0.5, 0.5);
    float _2532 = _2518 * 0.636619746685028076171875;
    float3 _6414 = float3(_2528, _2530, _2522);
    float _2534 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6414, float3(0.0), isnan(_6414)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6414, float3(0.0), isnan(_6414)), level(0.0)).x;
    float3 _6425 = float3(_2528, _2530, _2522);
    float4 _2537 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6425, float3(0.0), isnan(_6425)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6425, float3(0.0), isnan(_6425)), level(0.0)).xyzw;
    float _2539 = _2537.x;
    float _2541 = _2537.y;
    float _2543 = _2537.z;
    float _2545 = _2537.w;
    float _2547 = -_2516;
    float _2549 = fma(_2532, _2547, 1.0);
    float2 _6447 = float2(_2549, _2514);
    float3 _2553 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6447, float2(0.0), isnan(_6447)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6447, float2(0.0), isnan(_6447)), level(0.0)).xyz;
    float _2555 = _2553.x;
    float _2557 = _2553.y;
    float _2559 = _2553.z;
    float _2561 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2563 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2565 = _2224 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2567 = _2224 > 0.0;
    bool _2569 = isnan(_2224);
    bool _2571 = _2567 || _2569;
    bool _2573 = isnan(0.0);
    bool _2575 = _2571 || _2573;
    float _2577 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2563);
    float _2579 = exp2(_2561);
    float _2581 = fma(_2420, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2577);
    float _2583 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2581);
    float _2585 = _2583 + _2480;
    out.gl_Position.x = _2510;
    out.gl_Position.y = _2512;
    out.gl_Position.z = _2583;
    out.gl_Position.w = _2480;
    float _2587 = _2585 * 0.5;
    float _2589 = -_2579;
    float _2591 = _2589 + 1.0;
    float _2593 = _2565 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2595 = _2591 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.z = _2587;
    out.m_75.w = _2480;
    float _2597 = -_2595;
    float _2599 = _2597 + 1.0;
    out.m_47.x = _2593;
    float _2601 = _2595 * _2534;
    float _2603 = _2545 * _2601;
    float _2605 = _2559 * _2601;
    float _2607 = fma(_2555, _2603, _2539);
    float _2609 = fma(_2557, _2603, _2541);
    float _2611 = _2545 * _2599;
    float _2613 = fma(_2545, _2605, _2543);
    out.m_77.x = _2607;
    out.m_77.y = _2609;
    out.m_77.z = _2613;
    out.m_77.w = _2611;
    if (_2575)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2615 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2615;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

