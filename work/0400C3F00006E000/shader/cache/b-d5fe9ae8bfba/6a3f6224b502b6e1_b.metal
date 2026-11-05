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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _402 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1630 = as_type<float>(_106);
        out.gl_Position.z = _1630;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1700 = as_type<float>(_144);
        out.gl_Position.z = _1700;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_51.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_312;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = 1.0 / _316;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _342 = _328 * _332;
    float _344 = -_328;
    float _346 = _344 + 1.0;
    float _348 = _300 * _338;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    float _354 = fma(_336, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _356;
    float _360 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = _354 * _342;
    float _364 = fma(_358, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _362);
    float _368 = _364 * _342;
    float _370 = _360 * _342;
    float _372 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _366);
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _368);
    float _376 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _370);
    float _378 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _374);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _376);
    bool _382 = !_340;
    float _400;
    if (!_382)
    {
        float _384 = in.m_51.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_90);
        float _406 = 1.0 / _404;
        float _408 = _124 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = in.m_51.x;
    float _414 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _416 = log2(_414);
    float _418 = in.m_51.z;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _422 = _420 != 0;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _430 = _428 != 0;
    float _432 = in.m_51.y;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _436 = 1.0 + _434;
    bool _438 = !_422;
    int _440 = _438 ? 0 : 1;
    float _442 = 1.0 / _436;
    bool _444 = !_426;
    int _446 = _444 ? 0 : 1;
    int _448 = abs(_440);
    int _450 = abs(_446);
    float _452 = _412 * 2.0;
    float _454 = float(_448);
    float _456 = _418 * 2.0;
    float _458 = floor(_452);
    float _460 = _432 * 2.0;
    float _462 = floor(_456);
    bool _464 = _458 > 0.0;
    float _466 = floor(_460);
    bool _468 = _458 >= 0.0;
    bool _470 = isnan(_458);
    bool _472 = _468 || _470;
    bool _474 = isnan(0.0);
    bool _476 = _472 || _474;
    float _478 = _416 * _124;
    int _480 = _476 ? 0 : 1;
    bool _482 = _462 > 0.0;
    float _484 = exp2(_478);
    bool _486 = _462 >= 0.0;
    bool _488 = isnan(_462);
    bool _490 = _486 || _488;
    bool _492 = isnan(0.0);
    bool _494 = _490 || _492;
    float _496 = _432 + _418;
    int _498 = ~_480;
    int _500 = _498 + 1;
    int _502 = _500 + 1;
    int _504 = _494 ? 0 : 1;
    float _506 = _496 + (-1.0);
    int _508 = _502;
    if (!_464)
    {
        int _510 = ~_480;
        int _512 = _510 + 1;
        _508 = _512;
    }
    int _514 = _508;
    int _516 = ~_504;
    int _518 = _516 + 1;
    int _520 = _518 + 1;
    float _522 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _524 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _526 = isnan(1.0);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _532 = _528 || _530;
    float _534 = _412 + _432;
    int _536 = _520;
    if (!_482)
    {
        int _538 = ~_504;
        int _540 = _538 + 1;
        _536 = _540;
    }
    int _542 = _536;
    float _544 = in.m_53.x;
    float _546 = in.m_53.y;
    float _548 = in.m_53.z;
    float _550 = -_484;
    float _552 = _550 + 1.0;
    bool _554 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _562 = _558 || _560;
    float _564 = _534 + (-1.0);
    float _566 = float(_542);
    float _568 = _562 ? _552 : 0.0;
    float _570 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _572 = _466 > 0.0;
    float _574 = _454 * _566;
    float _576 = float(_450);
    if (_532)
    {
        float _578 = _568 * _442;
        _126 = _578;
    }
    float _580 = _126;
    float _582 = float(_514);
    float _584 = _574 * (-2.0);
    bool _586 = _466 >= 0.0;
    bool _588 = isnan(_466);
    bool _590 = _586 || _588;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    bool _596 = !_430;
    int _598 = _596 ? 0 : 1;
    float _600 = _576 * _582;
    int _602 = _594 ? 0 : 1;
    float _604 = _412 + (-0.5);
    int _606 = abs(_598);
    float _608 = fma(_570, _584, _570);
    float _610 = fma(_584, _544, _544);
    int _612 = ~_602;
    int _614 = _612 + 1;
    int _616 = _614 + 1;
    float _618 = _600 * (-2.0);
    int _620 = _616;
    if (!_572)
    {
        int _622 = ~_602;
        int _624 = _622 + 1;
        _620 = _624;
    }
    int _626 = _620;
    float _628 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[196].x, _610);
    float _630 = _432 + (-0.5);
    float _632 = float(_606);
    float _634 = fma(_618, _546, _546);
    float _636 = float(_626);
    float _638 = fma(_522, _618, _522);
    float _640 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[196].y, _634);
    float _642 = _412 + _418;
    float _644 = _632 * _636;
    float _646 = _418 + (-0.5);
    float _648 = fma(_638, _580, _640);
    float _650 = _642 + (-1.0);
    float _652 = _644 * (-2.0);
    float _654 = fma(_608, _580, _628);
    float _656 = in.m_49.x;
    float _658 = in.m_49.y;
    float _660 = in.m_49.z;
    float _662 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _664 = fma(_652, _548, _548);
    float _666 = _648 * 0.15915493667125701904296875;
    float _668 = in.m_55.x;
    float _670 = in.m_55.y;
    float _672 = in.m_55.z;
    float _674 = fma(_662, _652, _662);
    float _676 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].z, _664);
    float _678 = _654 * 0.15915493667125701904296875;
    float _680 = _666 * 6.283185482025146484375;
    float _682 = sin(_680);
    float _684 = fma(_674, _580, _676);
    float _686 = _684 * 0.15915493667125701904296875;
    float _688 = _678 * 6.283185482025146484375;
    float _690 = sin(_688);
    bool _692 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _694 = isnan(0.5);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _700 = _696 || _698;
    float _702 = _678 * 6.283185482025146484375;
    float _704 = cos(_702);
    float _706 = _378 * _658;
    float _708 = _380 * _660;
    float _710 = _372 * _656;
    float _712 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _672);
    float _714 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _670);
    float _716 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _718 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _720 = _666 * 6.283185482025146484375;
    float _722 = cos(_720);
    float _724 = _690 * _682;
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _668);
    float _728 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _730 = _712 * _716;
    float _732 = _714 * _718;
    float _734 = _726 * _728;
    float _736 = _686 * 6.283185482025146484375;
    float _738 = sin(_736);
    float _740 = _686 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = _704 * _722;
    float _746 = _690 * _722;
    float _748 = fma(_738, _744, _724);
    float _750 = fma(_738, _724, _744);
    float _752 = _704 * _682;
    float _754 = _742 * _730;
    float _756 = _682 * _742;
    float _758 = _722 * _742;
    float _760 = -_730;
    float _762 = _738 * _760;
    float _764 = _704 * _754;
    float _766 = _690 * _754;
    float _768 = -_752;
    float _770 = fma(_738, _746, _768);
    float _772 = -_746;
    float _774 = fma(_738, _752, _772);
    float _776 = fma(_758, _734, _762);
    float _778 = fma(_748, _734, _764);
    float _780 = fma(_770, _734, _766);
    float _782 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _784 = -_732;
    float _786 = fma(_756, _784, _776);
    float _788 = -_732;
    float _790 = fma(_774, _788, _778);
    float _792 = -_732;
    float _794 = fma(_750, _792, _780);
    float _796 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _782);
    float _798 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _800 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _802 = _790 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _804 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _796);
    float _806 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _798);
    float _808 = _790 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _810 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[10].x, _802);
    float _812 = _804 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _814 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _806);
    float _816 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].x, _808);
    float _818 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[10].z, _810);
    float _820 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _800);
    float _822 = _814 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _824 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[8].z, _816);
    float _826 = _812 + _818;
    float _828 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _820);
    float _830 = _822 + _824;
    float _832 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _834 = _826 + _832;
    float _836 = _828 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _838 = _828;
    float _840 = _790;
    float _842 = _826;
    if (_700)
    {
        _838 = 1.0;
    }
    float _844 = _838;
    float _846 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _848 = _830 + _846;
    float _850 = _834 * _834;
    float _852 = _836 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _854 = fma(_848, _848, _850);
    float _856 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[11].x, _852);
    float _858 = sqrt(_854);
    float _860 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[11].z, _856);
    float _862 = _836 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _864 = _860 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _866 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[10].x, _862);
    float _868 = 1.0 / _864;
    float _870 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[10].z, _866);
    float _872 = _790 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _874 = _870 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _876 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[9].x, _872);
    bool _878 = _858 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _880 = _874 + _864;
    float _882 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[9].z, _876);
    float _884 = _836 + _882;
    float _886 = _880 * _868;
    float _888 = _886 * 0.5;
    float _890 = _864;
    float _892 = _882;
    float _894 = _884;
    float _896 = _844;
    if (!_878)
    {
        _890 = _830;
    }
    float _898 = _890;
    float _900 = _898;
    if (!_878)
    {
        _892 = _826;
    }
    float _902 = _892;
    float _904 = _902;
    if (!_878)
    {
        _840 = _884;
    }
    float _906 = _840;
    bool _908 = !_878;
    float _910 = _906;
    if (!_908)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _916 = _858 + _914;
        float _918 = rsqrt(_854);
        float _920 = _916 * _912;
        float _922 = _884 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _924 = _920 * 0.15915493667125701904296875;
        float _926 = _924 * 6.283185482025146484375;
        float _928 = cos(_926);
        float _930 = _924 * 6.283185482025146484375;
        float _932 = sin(_930);
        float _934 = _928 + (-1.0);
        float _936 = fma(_932, _922, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _938 = _934 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _940 = _918 * _936;
        float _942 = fma(_884, _928, _938);
        float _944 = fma(_848, _940, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _946 = fma(_834, _940, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _910 = _942;
        _900 = _944;
        _904 = _946;
    }
    float _948 = _910;
    float _950 = _900;
    float _952 = _904;
    if (!_700)
    {
        float _954 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _956 = _954 * 0.15915493667125701904296875;
        float _958 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _960 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _962 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[30].w, _960);
        float _964 = _956 * 6.283185482025146484375;
        float _966 = cos(_964);
        float _968 = _958 * 0.15915493667125701904296875;
        float _970 = _956 * 6.283185482025146484375;
        float _972 = sin(_970);
        float _974 = 1.0 / _966;
        float _976 = _968 * 6.283185482025146484375;
        float _978 = cos(_976);
        float _980 = _972 * _974;
        float _982 = _968 * 6.283185482025146484375;
        float _984 = sin(_982);
        float _986 = _978 * _980;
        float _988 = 1.0 / _962;
        float _990 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _992 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _990;
        float _994 = 1.0 / _986;
        float _996 = 1.0 / _992;
        float _998 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1000 = _988 * _998;
        float _1002 = _984 * _994;
        float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1006 = fma(_1002, _1000, _1004);
        float _1008 = _1006 * _996;
        float _1010 = precise::clamp(_1008, 0.0, 1.0);
        float _1012 = -_1010;
        float _1014 = _1012 + 1.0;
        _842 = _968;
        _894 = _988;
        _896 = _1014;
    }
    float _1016 = _842;
    float _1018 = _894;
    float _1020 = _896;
    float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1024 = _948 + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1028 = _950 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1032 = _952 + _1030;
    float _1034 = _1024 * _1024;
    float _1036 = fma(_1028, _1028, _1034);
    float _1038 = fma(_1032, _1032, _1036);
    float _1040 = rsqrt(_1038);
    float _1042 = sqrt(_1038);
    float _1044 = _1040 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1046 = _1028 * _1044;
    float _1048 = _1032 * _1044;
    float _1050 = _1046 * _1046;
    float _1052 = _1048 * _1048;
    float _1054 = _1050 + _1052;
    float _1056 = sqrt(_1054);
    bool _1058 = _1056 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1060 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = _1056 + _1060;
    float _1064 = _1032;
    float _1066 = _1018;
    float _1068 = _1062;
    float _1070 = _1034;
    float _1072 = _1024;
    if (_1058)
    {
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1064 = _1074;
    }
    float _1076 = _1064;
    if (_1058)
    {
        float _1078 = rsqrt(_1054);
        _1066 = _1078;
    }
    float _1080 = _1066;
    float _1082 = _1080;
    if (_1058)
    {
        float _1084 = _1062 * _1076;
        _1068 = _1084;
    }
    float _1086 = _1068;
    if (_1058)
    {
        float _1088 = _1086 * 0.15915493667125701904296875;
        _1070 = _1088;
    }
    float _1090 = _1070;
    float _1092 = _1040;
    float _1094 = _1090;
    if (_1058)
    {
        float _1096 = _1090 * 6.283185482025146484375;
        float _1098 = sin(_1096);
        _1092 = _1098;
    }
    float _1100 = _1092;
    float _1102 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1104 = precise::max(0.0, _1102);
    float _1106 = _1016;
    float _1108 = _1104;
    float _1110 = _1102;
    if (_1058)
    {
        float _1112 = _1090 * 6.283185482025146484375;
        float _1114 = cos(_1112);
        _1106 = _1114;
    }
    float _1116 = _1106;
    float _1118 = -_1044;
    float _1120 = -_1104;
    float _1122 = fma(_1024, _1118, _1120);
    if (_1058)
    {
        float _1124 = _1122 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1108 = _1124;
    }
    float _1126 = _1108;
    float _1128 = _1126;
    if (!_1058)
    {
        _1094 = _1050;
    }
    float _1130 = _1094;
    float _1132 = _1100;
    float _1134 = _1130;
    if (_1058)
    {
        float _1136 = fma(_1100, _1126, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1128 = _1136;
    }
    float _1138 = _1128;
    float _1140 = _1138;
    if (!_1058)
    {
        _1132 = _1122;
    }
    float _1142 = _1132;
    float _1144 = _1142;
    if (_1058)
    {
        float _1146 = _1116 + (-1.0);
        _1110 = _1146;
    }
    float _1148 = _1110;
    float _1150 = _1148;
    if (_1058)
    {
        float _1152 = _1080 * _1138;
        _1072 = _1152;
    }
    float _1154 = _1072;
    if (!_1058)
    {
        _1082 = _1046;
    }
    float _1156 = _1082;
    float _1158 = _1156;
    if (_1058)
    {
        float _1160 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1150 = _1160;
    }
    float _1162 = _1150;
    float _1164 = _1162;
    if (_1058)
    {
        float _1166 = _1046 * _1154;
        _1158 = _1166;
    }
    float _1168 = _1158;
    if (!_1058)
    {
        _1140 = _1048;
    }
    float _1170 = _1140;
    float _1172 = _1170;
    if (_1058)
    {
        float _1174 = _1048 * _1154;
        _1172 = _1174;
    }
    float _1176 = _1172;
    if (_1058)
    {
        float _1178 = fma(_1122, _1116, _1162);
        _1144 = _1178;
    }
    float _1180 = _1144;
    if (_1058)
    {
        float _1182 = _1168 * _1168;
        _1134 = _1182;
    }
    float _1184 = _1134;
    if (!_1058)
    {
        _1164 = _1052;
    }
    float _1186 = _1164;
    float _1188 = _1186;
    if (_1058)
    {
        float _1190 = _1176 * _1176;
        _1188 = _1190;
    }
    float _1192 = _1188;
    float _1194 = fma(_1180, _1180, _1184);
    float _1196 = _948 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1198 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1200 = _948 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1202 = _1194 + _1192;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1206 = fma(_1042, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1204);
    float _1208 = precise::clamp(_1206, 0.0, 1.0);
    float _1210 = _948 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1212 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1196);
    float _1214 = rsqrt(_1202);
    float _1216 = -_1208;
    float _1218 = _1216 + 1.0;
    float _1220 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1210);
    float _1222 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1212);
    float _1224 = _948 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1226 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1200);
    float _1228 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1220);
    float _1230 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1232 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1224);
    float _1234 = abs(_1218);
    float _1236 = log2(_1234);
    float _1238 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1226);
    float _1240 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1242 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1244 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1232);
    float _1246 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1248 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1250 = _1214 * _1168;
    float _1252 = _1214 * _1180;
    float _1254 = -_1242;
    float _1256 = fma(_1254, _1198, 1.0);
    float _1258 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1260 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1262 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1248);
    float _1264 = _1214 * _1176;
    float _1266 = -_1260;
    float _1268 = fma(_1252, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1266);
    float _1270 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1262);
    float _1272 = _1236 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1274 = log2(_1256);
    float _1276 = -_1264;
    float _1278 = fma(_1276, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1268);
    float _1280 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1270);
    float _1282 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1284 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1286 = fma(_1278, -0.5, 0.5);
    float _1288 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1282);
    float _1290 = exp2(_1272);
    float _1292 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1284);
    float _1294 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1288);
    float _1296 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1292);
    float _1298 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1294);
    float _1300 = 1.0 / _1280;
    float _1302 = fma(_1278, 0.5, 0.5);
    float _1304 = _1252 + 1.0;
    float _1306 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1296);
    float _1308 = _1274 * 0.693147182464599609375;
    float _1310 = fma(_1302, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1312 = sqrt(_1286);
    float _1314 = -_1252;
    float _1316 = fma(_1290, _1304, _1314);
    float _1318 = fma(_1302, _1310, -0.212114393711090087890625);
    float _1320 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1322 = fma(_1302, _1318, 1.570728778839111328125);
    float _1324 = _1298 * _1300;
    float _1326 = _1306 * _1300;
    float _1328 = fma(_1316, 0.5, 0.5);
    float _1330 = fma(_1324, 0.5, 0.5);
    float _1332 = fma(_1326, -0.5, 0.5);
    float _1334 = _1312 * 0.636619746685028076171875;
    float3 _3533 = float3(_1330, _1332, _1320);
    float _1336 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3533, float3(0.0), isnan(_3533)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3533, float3(0.0), isnan(_3533)), level(0.0)).x;
    float _1338 = -_1322;
    float _1340 = fma(_1334, _1338, 1.0);
    float3 _3549 = float3(_1330, _1332, _1320);
    float4 _1343 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3549, float3(0.0), isnan(_3549)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3549, float3(0.0), isnan(_3549)), level(0.0)).xyzw;
    float _1345 = _1343.x;
    float _1347 = _1343.y;
    float _1349 = _1343.z;
    float _1351 = _1343.w;
    float2 _3566 = float2(_1340, _1328);
    float3 _1355 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3566, float2(0.0), isnan(_3566)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3566, float2(0.0), isnan(_3566)), level(0.0)).xyz;
    float _1357 = _1355.x;
    float _1359 = _1355.y;
    float _1361 = _1355.z;
    float _1363 = in.m_57.y;
    float _1365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1367 = in.m_59.x;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1371 = _1369 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1375 = _1373 != 0;
    float _1377 = in.m_59.y;
    int _1379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1381 = _1379 != 0;
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1383;
    bool _1387 = _412 > 0.5;
    bool _1389 = _1387 && _1375;
    float _1391 = 1.0 / _1371;
    float _1393 = in.m_57.x;
    bool _1395 = _432 > 0.5;
    float _1397 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1399 = in.m_57.z;
    bool _1401 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1403 = isnan(_410);
    bool _1405 = _1401 || _1403;
    bool _1407 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1409 = _1405 || _1407;
    float _1411 = float(_1409);
    float _1413 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1397);
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1419 = in.m_57.w;
    float _1421 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1413);
    out.m_61.y = _1363;
    float _1423 = _1385 * _1391;
    float _1425 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1427 = _410 + _1425;
    bool _1429 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1431 = isnan(_410);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1437 = _1433 || _1435;
    float _1439 = float(_1437);
    float _1441 = -_1377;
    float _1443 = _1441 + 1.0;
    float _1445 = fma(_1423, _1427, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1447 = _1427;
    float _1449 = _1363;
    float _1451 = _1377;
    if (!_1375)
    {
        _1447 = _1367;
    }
    float _1453 = _1447;
    float _1455 = _1453;
    if (_1375)
    {
        _1449 = _1367;
    }
    float _1457 = _1449;
    out.m_61.x = _1393;
    float _1459 = _1457;
    if (_1381)
    {
        float _1461 = _1395 ? _1443 : _1377;
        _1451 = _1461;
    }
    float _1463 = _1451;
    if (_1389)
    {
        float _1465 = -_1457;
        float _1467 = _1465 + 1.0;
        _1459 = _1467;
    }
    float _1469 = _1459;
    out.m_61.z = _1399;
    bool _1471 = _1020 > 0.0;
    bool _1473 = isnan(_1020);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan(0.0);
    bool _1479 = _1475 || _1477;
    float _1481 = -_1411;
    float _1483 = _1481 + 1.0;
    if (_1375)
    {
        _1455 = _1469;
    }
    float _1485 = _1455;
    float _1487 = _1463 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1491 = _1439 * _1483;
    float _1493 = -_1439;
    float _1495 = _1493 + 1.0;
    float _1497 = _1485 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1499 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1501 = _1236 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1503 = _1445 * _1491;
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1507 = _1487 * _1417;
    float _1509 = _1497 * _1365;
    float _1511 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1503);
    float _1513 = exp2(_1501);
    float _1515 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1421);
    float _1517 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1519 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1521 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1511);
    out.m_63.x = _1509;
    out.m_63.y = _1507;
    float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1525 = _1515 + _1523;
    out.m_65.x = _1517;
    out.m_65.y = _1499;
    out.m_65.z = _1519;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_61.w = _1419;
    float _1531 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1533 = -_1513;
    float _1535 = _1533 + 1.0;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1539 = _1521 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1541 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1543 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1545 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1547 = _1280 + _1525;
    out.gl_Position.x = _1298;
    out.gl_Position.y = _1306;
    out.gl_Position.z = _1525;
    out.gl_Position.w = _1280;
    float _1549 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1551 = _1547 * 0.5;
    float _1553 = _1545 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _1531;
    out.m_67.y = _1543;
    out.m_67.z = _1549;
    out.m_67.w = _1539;
    out.m_69.z = _1551;
    out.m_69.w = _1280;
    out.m_45.x = _1553;
    float _1555 = _1541 * _1336;
    float _1557 = -_1541;
    float _1559 = _1557 + 1.0;
    float _1561 = _1351 * _1555;
    float _1563 = _1351 * _1559;
    float _1565 = _1361 * _1555;
    float _1567 = fma(_1357, _1561, _1345);
    float _1569 = fma(_1359, _1561, _1347);
    float _1571 = fma(_1351, _1565, _1349);
    out.m_71.x = _1567;
    out.m_71.y = _1569;
    out.m_71.z = _1571;
    out.m_71.w = _1563;
    if (_1479)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1573 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1573;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _402 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1630 = as_type<float>(_106);
        out.gl_Position.z = _1630;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1700 = as_type<float>(_144);
        out.gl_Position.z = _1700;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_51.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_312;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = 1.0 / _316;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _342 = _328 * _332;
    float _344 = -_328;
    float _346 = _344 + 1.0;
    float _348 = _300 * _338;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    float _354 = fma(_336, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _356;
    float _360 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = _354 * _342;
    float _364 = fma(_358, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _362);
    float _368 = _364 * _342;
    float _370 = _360 * _342;
    float _372 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _366);
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _368);
    float _376 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _370);
    float _378 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _374);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _376);
    bool _382 = !_340;
    float _400;
    if (!_382)
    {
        float _384 = in.m_51.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_90);
        float _406 = 1.0 / _404;
        float _408 = _124 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = in.m_51.x;
    float _414 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _416 = log2(_414);
    float _418 = in.m_51.z;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _422 = _420 != 0;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _430 = _428 != 0;
    float _432 = in.m_51.y;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _436 = 1.0 + _434;
    bool _438 = !_422;
    int _440 = _438 ? 0 : 1;
    float _442 = 1.0 / _436;
    bool _444 = !_426;
    int _446 = _444 ? 0 : 1;
    int _448 = abs(_440);
    int _450 = abs(_446);
    float _452 = _412 * 2.0;
    float _454 = float(_448);
    float _456 = _418 * 2.0;
    float _458 = floor(_452);
    float _460 = _432 * 2.0;
    float _462 = floor(_456);
    bool _464 = _458 > 0.0;
    float _466 = floor(_460);
    bool _468 = _458 >= 0.0;
    bool _470 = isnan(_458);
    bool _472 = _468 || _470;
    bool _474 = isnan(0.0);
    bool _476 = _472 || _474;
    float _478 = _416 * _124;
    int _480 = _476 ? 0 : 1;
    bool _482 = _462 > 0.0;
    float _484 = exp2(_478);
    bool _486 = _462 >= 0.0;
    bool _488 = isnan(_462);
    bool _490 = _486 || _488;
    bool _492 = isnan(0.0);
    bool _494 = _490 || _492;
    float _496 = _432 + _418;
    int _498 = ~_480;
    int _500 = _498 + 1;
    int _502 = _500 + 1;
    int _504 = _494 ? 0 : 1;
    float _506 = _496 + (-1.0);
    int _508 = _502;
    if (!_464)
    {
        int _510 = ~_480;
        int _512 = _510 + 1;
        _508 = _512;
    }
    int _514 = _508;
    int _516 = ~_504;
    int _518 = _516 + 1;
    int _520 = _518 + 1;
    float _522 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _524 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _526 = isnan(1.0);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _532 = _528 || _530;
    float _534 = _412 + _432;
    int _536 = _520;
    if (!_482)
    {
        int _538 = ~_504;
        int _540 = _538 + 1;
        _536 = _540;
    }
    int _542 = _536;
    float _544 = in.m_53.x;
    float _546 = in.m_53.y;
    float _548 = in.m_53.z;
    float _550 = -_484;
    float _552 = _550 + 1.0;
    bool _554 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _562 = _558 || _560;
    float _564 = _534 + (-1.0);
    float _566 = float(_542);
    float _568 = _562 ? _552 : 0.0;
    float _570 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _572 = _466 > 0.0;
    float _574 = _454 * _566;
    float _576 = float(_450);
    if (_532)
    {
        float _578 = _568 * _442;
        _126 = _578;
    }
    float _580 = _126;
    float _582 = float(_514);
    float _584 = _574 * (-2.0);
    bool _586 = _466 >= 0.0;
    bool _588 = isnan(_466);
    bool _590 = _586 || _588;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    bool _596 = !_430;
    int _598 = _596 ? 0 : 1;
    float _600 = _576 * _582;
    int _602 = _594 ? 0 : 1;
    float _604 = _412 + (-0.5);
    int _606 = abs(_598);
    float _608 = fma(_570, _584, _570);
    float _610 = fma(_584, _544, _544);
    int _612 = ~_602;
    int _614 = _612 + 1;
    int _616 = _614 + 1;
    float _618 = _600 * (-2.0);
    int _620 = _616;
    if (!_572)
    {
        int _622 = ~_602;
        int _624 = _622 + 1;
        _620 = _624;
    }
    int _626 = _620;
    float _628 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[196].x, _610);
    float _630 = _432 + (-0.5);
    float _632 = float(_606);
    float _634 = fma(_618, _546, _546);
    float _636 = float(_626);
    float _638 = fma(_522, _618, _522);
    float _640 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[196].y, _634);
    float _642 = _412 + _418;
    float _644 = _632 * _636;
    float _646 = _418 + (-0.5);
    float _648 = fma(_638, _580, _640);
    float _650 = _642 + (-1.0);
    float _652 = _644 * (-2.0);
    float _654 = fma(_608, _580, _628);
    float _656 = in.m_49.x;
    float _658 = in.m_49.y;
    float _660 = in.m_49.z;
    float _662 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _664 = fma(_652, _548, _548);
    float _666 = _648 * 0.15915493667125701904296875;
    float _668 = in.m_55.x;
    float _670 = in.m_55.y;
    float _672 = in.m_55.z;
    float _674 = fma(_662, _652, _662);
    float _676 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].z, _664);
    float _678 = _654 * 0.15915493667125701904296875;
    float _680 = _666 * 6.283185482025146484375;
    float _682 = sin(_680);
    float _684 = fma(_674, _580, _676);
    float _686 = _684 * 0.15915493667125701904296875;
    float _688 = _678 * 6.283185482025146484375;
    float _690 = sin(_688);
    bool _692 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _694 = isnan(0.5);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _700 = _696 || _698;
    float _702 = _678 * 6.283185482025146484375;
    float _704 = cos(_702);
    float _706 = _378 * _658;
    float _708 = _380 * _660;
    float _710 = _372 * _656;
    float _712 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _672);
    float _714 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _670);
    float _716 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _718 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _720 = _666 * 6.283185482025146484375;
    float _722 = cos(_720);
    float _724 = _690 * _682;
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _668);
    float _728 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _730 = _712 * _716;
    float _732 = _714 * _718;
    float _734 = _726 * _728;
    float _736 = _686 * 6.283185482025146484375;
    float _738 = sin(_736);
    float _740 = _686 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = _704 * _722;
    float _746 = _690 * _722;
    float _748 = fma(_738, _744, _724);
    float _750 = fma(_738, _724, _744);
    float _752 = _704 * _682;
    float _754 = _742 * _730;
    float _756 = _682 * _742;
    float _758 = _722 * _742;
    float _760 = -_730;
    float _762 = _738 * _760;
    float _764 = _704 * _754;
    float _766 = _690 * _754;
    float _768 = -_752;
    float _770 = fma(_738, _746, _768);
    float _772 = -_746;
    float _774 = fma(_738, _752, _772);
    float _776 = fma(_758, _734, _762);
    float _778 = fma(_748, _734, _764);
    float _780 = fma(_770, _734, _766);
    float _782 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _784 = -_732;
    float _786 = fma(_756, _784, _776);
    float _788 = -_732;
    float _790 = fma(_774, _788, _778);
    float _792 = -_732;
    float _794 = fma(_750, _792, _780);
    float _796 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _782);
    float _798 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _800 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _802 = _790 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _804 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _796);
    float _806 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _798);
    float _808 = _790 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _810 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[10].x, _802);
    float _812 = _804 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _814 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _806);
    float _816 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].x, _808);
    float _818 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[10].z, _810);
    float _820 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _800);
    float _822 = _814 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _824 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[8].z, _816);
    float _826 = _812 + _818;
    float _828 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _820);
    float _830 = _822 + _824;
    float _832 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _834 = _826 + _832;
    float _836 = _828 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _838 = _828;
    float _840 = _790;
    float _842 = _826;
    if (_700)
    {
        _838 = 1.0;
    }
    float _844 = _838;
    float _846 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _848 = _830 + _846;
    float _850 = _834 * _834;
    float _852 = _836 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _854 = fma(_848, _848, _850);
    float _856 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[11].x, _852);
    float _858 = sqrt(_854);
    float _860 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[11].z, _856);
    float _862 = _836 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _864 = _860 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _866 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[10].x, _862);
    float _868 = 1.0 / _864;
    float _870 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[10].z, _866);
    float _872 = _790 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _874 = _870 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _876 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[9].x, _872);
    bool _878 = _858 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _880 = _874 + _864;
    float _882 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[9].z, _876);
    float _884 = _836 + _882;
    float _886 = _880 * _868;
    float _888 = _886 * 0.5;
    float _890 = _864;
    float _892 = _882;
    float _894 = _884;
    float _896 = _844;
    if (!_878)
    {
        _890 = _830;
    }
    float _898 = _890;
    float _900 = _898;
    if (!_878)
    {
        _892 = _826;
    }
    float _902 = _892;
    float _904 = _902;
    if (!_878)
    {
        _840 = _884;
    }
    float _906 = _840;
    bool _908 = !_878;
    float _910 = _906;
    if (!_908)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _916 = _858 + _914;
        float _918 = rsqrt(_854);
        float _920 = _916 * _912;
        float _922 = _884 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _924 = _920 * 0.15915493667125701904296875;
        float _926 = _924 * 6.283185482025146484375;
        float _928 = cos(_926);
        float _930 = _924 * 6.283185482025146484375;
        float _932 = sin(_930);
        float _934 = _928 + (-1.0);
        float _936 = fma(_932, _922, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _938 = _934 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _940 = _918 * _936;
        float _942 = fma(_884, _928, _938);
        float _944 = fma(_848, _940, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _946 = fma(_834, _940, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _910 = _942;
        _900 = _944;
        _904 = _946;
    }
    float _948 = _910;
    float _950 = _900;
    float _952 = _904;
    if (!_700)
    {
        float _954 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _956 = _954 * 0.15915493667125701904296875;
        float _958 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _960 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _962 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[30].w, _960);
        float _964 = _956 * 6.283185482025146484375;
        float _966 = cos(_964);
        float _968 = _958 * 0.15915493667125701904296875;
        float _970 = _956 * 6.283185482025146484375;
        float _972 = sin(_970);
        float _974 = 1.0 / _966;
        float _976 = _968 * 6.283185482025146484375;
        float _978 = cos(_976);
        float _980 = _972 * _974;
        float _982 = _968 * 6.283185482025146484375;
        float _984 = sin(_982);
        float _986 = _978 * _980;
        float _988 = 1.0 / _962;
        float _990 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _992 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _990;
        float _994 = 1.0 / _986;
        float _996 = 1.0 / _992;
        float _998 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1000 = _988 * _998;
        float _1002 = _984 * _994;
        float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1006 = fma(_1002, _1000, _1004);
        float _1008 = _1006 * _996;
        float _1010 = precise::clamp(_1008, 0.0, 1.0);
        float _1012 = -_1010;
        float _1014 = _1012 + 1.0;
        _842 = _968;
        _894 = _988;
        _896 = _1014;
    }
    float _1016 = _842;
    float _1018 = _894;
    float _1020 = _896;
    float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1024 = _948 + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1028 = _950 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1032 = _952 + _1030;
    float _1034 = _1024 * _1024;
    float _1036 = fma(_1028, _1028, _1034);
    float _1038 = fma(_1032, _1032, _1036);
    float _1040 = rsqrt(_1038);
    float _1042 = sqrt(_1038);
    float _1044 = _1040 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1046 = _1028 * _1044;
    float _1048 = _1032 * _1044;
    float _1050 = _1046 * _1046;
    float _1052 = _1048 * _1048;
    float _1054 = _1050 + _1052;
    float _1056 = sqrt(_1054);
    bool _1058 = _1056 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1060 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = _1056 + _1060;
    float _1064 = _1032;
    float _1066 = _1018;
    float _1068 = _1062;
    float _1070 = _1034;
    float _1072 = _1024;
    if (_1058)
    {
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1064 = _1074;
    }
    float _1076 = _1064;
    if (_1058)
    {
        float _1078 = rsqrt(_1054);
        _1066 = _1078;
    }
    float _1080 = _1066;
    float _1082 = _1080;
    if (_1058)
    {
        float _1084 = _1062 * _1076;
        _1068 = _1084;
    }
    float _1086 = _1068;
    if (_1058)
    {
        float _1088 = _1086 * 0.15915493667125701904296875;
        _1070 = _1088;
    }
    float _1090 = _1070;
    float _1092 = _1040;
    float _1094 = _1090;
    if (_1058)
    {
        float _1096 = _1090 * 6.283185482025146484375;
        float _1098 = sin(_1096);
        _1092 = _1098;
    }
    float _1100 = _1092;
    float _1102 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1104 = precise::max(0.0, _1102);
    float _1106 = _1016;
    float _1108 = _1104;
    float _1110 = _1102;
    if (_1058)
    {
        float _1112 = _1090 * 6.283185482025146484375;
        float _1114 = cos(_1112);
        _1106 = _1114;
    }
    float _1116 = _1106;
    float _1118 = -_1044;
    float _1120 = -_1104;
    float _1122 = fma(_1024, _1118, _1120);
    if (_1058)
    {
        float _1124 = _1122 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1108 = _1124;
    }
    float _1126 = _1108;
    float _1128 = _1126;
    if (!_1058)
    {
        _1094 = _1050;
    }
    float _1130 = _1094;
    float _1132 = _1100;
    float _1134 = _1130;
    if (_1058)
    {
        float _1136 = fma(_1100, _1126, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1128 = _1136;
    }
    float _1138 = _1128;
    float _1140 = _1138;
    if (!_1058)
    {
        _1132 = _1122;
    }
    float _1142 = _1132;
    float _1144 = _1142;
    if (_1058)
    {
        float _1146 = _1116 + (-1.0);
        _1110 = _1146;
    }
    float _1148 = _1110;
    float _1150 = _1148;
    if (_1058)
    {
        float _1152 = _1080 * _1138;
        _1072 = _1152;
    }
    float _1154 = _1072;
    if (!_1058)
    {
        _1082 = _1046;
    }
    float _1156 = _1082;
    float _1158 = _1156;
    if (_1058)
    {
        float _1160 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1150 = _1160;
    }
    float _1162 = _1150;
    float _1164 = _1162;
    if (_1058)
    {
        float _1166 = _1046 * _1154;
        _1158 = _1166;
    }
    float _1168 = _1158;
    if (!_1058)
    {
        _1140 = _1048;
    }
    float _1170 = _1140;
    float _1172 = _1170;
    if (_1058)
    {
        float _1174 = _1048 * _1154;
        _1172 = _1174;
    }
    float _1176 = _1172;
    if (_1058)
    {
        float _1178 = fma(_1122, _1116, _1162);
        _1144 = _1178;
    }
    float _1180 = _1144;
    if (_1058)
    {
        float _1182 = _1168 * _1168;
        _1134 = _1182;
    }
    float _1184 = _1134;
    if (!_1058)
    {
        _1164 = _1052;
    }
    float _1186 = _1164;
    float _1188 = _1186;
    if (_1058)
    {
        float _1190 = _1176 * _1176;
        _1188 = _1190;
    }
    float _1192 = _1188;
    float _1194 = fma(_1180, _1180, _1184);
    float _1196 = _948 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1198 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1200 = _948 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1202 = _1194 + _1192;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1206 = fma(_1042, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1204);
    float _1208 = precise::clamp(_1206, 0.0, 1.0);
    float _1210 = _948 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1212 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1196);
    float _1214 = rsqrt(_1202);
    float _1216 = -_1208;
    float _1218 = _1216 + 1.0;
    float _1220 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1210);
    float _1222 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1212);
    float _1224 = _948 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1226 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1200);
    float _1228 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1220);
    float _1230 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1232 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1224);
    float _1234 = abs(_1218);
    float _1236 = log2(_1234);
    float _1238 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1226);
    float _1240 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1242 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1244 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1232);
    float _1246 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1248 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1250 = _1214 * _1168;
    float _1252 = _1214 * _1180;
    float _1254 = -_1242;
    float _1256 = fma(_1254, _1198, 1.0);
    float _1258 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1260 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1262 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1248);
    float _1264 = _1214 * _1176;
    float _1266 = -_1260;
    float _1268 = fma(_1252, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1266);
    float _1270 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1262);
    float _1272 = _1236 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1274 = log2(_1256);
    float _1276 = -_1264;
    float _1278 = fma(_1276, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1268);
    float _1280 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1270);
    float _1282 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1284 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1286 = fma(_1278, -0.5, 0.5);
    float _1288 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1282);
    float _1290 = exp2(_1272);
    float _1292 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1284);
    float _1294 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1288);
    float _1296 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1292);
    float _1298 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1294);
    float _1300 = 1.0 / _1280;
    float _1302 = fma(_1278, 0.5, 0.5);
    float _1304 = _1252 + 1.0;
    float _1306 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1296);
    float _1308 = _1274 * 0.693147182464599609375;
    float _1310 = fma(_1302, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1312 = sqrt(_1286);
    float _1314 = -_1252;
    float _1316 = fma(_1290, _1304, _1314);
    float _1318 = fma(_1302, _1310, -0.212114393711090087890625);
    float _1320 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1322 = fma(_1302, _1318, 1.570728778839111328125);
    float _1324 = _1298 * _1300;
    float _1326 = _1306 * _1300;
    float _1328 = fma(_1316, 0.5, 0.5);
    float _1330 = fma(_1324, 0.5, 0.5);
    float _1332 = fma(_1326, -0.5, 0.5);
    float _1334 = _1312 * 0.636619746685028076171875;
    float3 _3533 = float3(_1330, _1332, _1320);
    float _1336 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3533, float3(0.0), isnan(_3533)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3533, float3(0.0), isnan(_3533)), level(0.0)).x;
    float _1338 = -_1322;
    float _1340 = fma(_1334, _1338, 1.0);
    float3 _3549 = float3(_1330, _1332, _1320);
    float4 _1343 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3549, float3(0.0), isnan(_3549)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3549, float3(0.0), isnan(_3549)), level(0.0)).xyzw;
    float _1345 = _1343.x;
    float _1347 = _1343.y;
    float _1349 = _1343.z;
    float _1351 = _1343.w;
    float2 _3566 = float2(_1340, _1328);
    float3 _1355 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3566, float2(0.0), isnan(_3566)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3566, float2(0.0), isnan(_3566)), level(0.0)).xyz;
    float _1357 = _1355.x;
    float _1359 = _1355.y;
    float _1361 = _1355.z;
    float _1363 = in.m_57.y;
    float _1365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1367 = in.m_59.x;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1371 = _1369 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1375 = _1373 != 0;
    float _1377 = in.m_59.y;
    int _1379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1381 = _1379 != 0;
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1383;
    bool _1387 = _412 > 0.5;
    bool _1389 = _1387 && _1375;
    float _1391 = 1.0 / _1371;
    float _1393 = in.m_57.x;
    bool _1395 = _432 > 0.5;
    float _1397 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1399 = in.m_57.z;
    bool _1401 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1403 = isnan(_410);
    bool _1405 = _1401 || _1403;
    bool _1407 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1409 = _1405 || _1407;
    float _1411 = float(_1409);
    float _1413 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1397);
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1419 = in.m_57.w;
    float _1421 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1413);
    out.m_61.y = _1363;
    float _1423 = _1385 * _1391;
    float _1425 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1427 = _410 + _1425;
    bool _1429 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1431 = isnan(_410);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1437 = _1433 || _1435;
    float _1439 = float(_1437);
    float _1441 = -_1377;
    float _1443 = _1441 + 1.0;
    float _1445 = fma(_1423, _1427, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1447 = _1427;
    float _1449 = _1363;
    float _1451 = _1377;
    if (!_1375)
    {
        _1447 = _1367;
    }
    float _1453 = _1447;
    float _1455 = _1453;
    if (_1375)
    {
        _1449 = _1367;
    }
    float _1457 = _1449;
    out.m_61.x = _1393;
    float _1459 = _1457;
    if (_1381)
    {
        float _1461 = _1395 ? _1443 : _1377;
        _1451 = _1461;
    }
    float _1463 = _1451;
    if (_1389)
    {
        float _1465 = -_1457;
        float _1467 = _1465 + 1.0;
        _1459 = _1467;
    }
    float _1469 = _1459;
    out.m_61.z = _1399;
    bool _1471 = _1020 > 0.0;
    bool _1473 = isnan(_1020);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan(0.0);
    bool _1479 = _1475 || _1477;
    float _1481 = -_1411;
    float _1483 = _1481 + 1.0;
    if (_1375)
    {
        _1455 = _1469;
    }
    float _1485 = _1455;
    float _1487 = _1463 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1491 = _1439 * _1483;
    float _1493 = -_1439;
    float _1495 = _1493 + 1.0;
    float _1497 = _1485 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1499 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1501 = _1236 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1503 = _1445 * _1491;
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1507 = _1487 * _1417;
    float _1509 = _1497 * _1365;
    float _1511 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1503);
    float _1513 = exp2(_1501);
    float _1515 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1421);
    float _1517 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1519 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1521 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1511);
    out.m_63.x = _1509;
    out.m_63.y = _1507;
    float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1525 = _1515 + _1523;
    out.m_65.x = _1517;
    out.m_65.y = _1499;
    out.m_65.z = _1519;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_61.w = _1419;
    float _1531 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1533 = -_1513;
    float _1535 = _1533 + 1.0;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1539 = _1521 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1541 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1543 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1545 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1547 = _1280 + _1525;
    out.gl_Position.x = _1298;
    out.gl_Position.y = _1306;
    out.gl_Position.z = _1525;
    out.gl_Position.w = _1280;
    float _1549 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1551 = _1547 * 0.5;
    float _1553 = _1545 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _1531;
    out.m_67.y = _1543;
    out.m_67.z = _1549;
    out.m_67.w = _1539;
    out.m_69.z = _1551;
    out.m_69.w = _1280;
    out.m_45.x = _1553;
    float _1555 = _1541 * _1336;
    float _1557 = -_1541;
    float _1559 = _1557 + 1.0;
    float _1561 = _1351 * _1555;
    float _1563 = _1351 * _1559;
    float _1565 = _1361 * _1555;
    float _1567 = fma(_1357, _1561, _1345);
    float _1569 = fma(_1359, _1561, _1347);
    float _1571 = fma(_1351, _1565, _1349);
    out.m_71.x = _1567;
    out.m_71.y = _1569;
    out.m_71.z = _1571;
    out.m_71.w = _1563;
    if (_1479)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1573 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1573;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _402 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1630 = as_type<float>(_106);
        out.gl_Position.z = _1630;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1700 = as_type<float>(_144);
        out.gl_Position.z = _1700;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_51.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_312;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = 1.0 / _316;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _342 = _328 * _332;
    float _344 = -_328;
    float _346 = _344 + 1.0;
    float _348 = _300 * _338;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    float _354 = fma(_336, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _356;
    float _360 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = _354 * _342;
    float _364 = fma(_358, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _362);
    float _368 = _364 * _342;
    float _370 = _360 * _342;
    float _372 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _366);
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _368);
    float _376 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _370);
    float _378 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _374);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _376);
    bool _382 = !_340;
    float _400;
    if (!_382)
    {
        float _384 = in.m_51.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_90);
        float _406 = 1.0 / _404;
        float _408 = _124 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = in.m_51.x;
    float _414 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _416 = log2(_414);
    float _418 = in.m_51.z;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _422 = _420 != 0;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _430 = _428 != 0;
    float _432 = in.m_51.y;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _436 = 1.0 + _434;
    bool _438 = !_422;
    int _440 = _438 ? 0 : 1;
    float _442 = 1.0 / _436;
    bool _444 = !_426;
    int _446 = _444 ? 0 : 1;
    int _448 = abs(_440);
    int _450 = abs(_446);
    float _452 = _412 * 2.0;
    float _454 = float(_448);
    float _456 = _418 * 2.0;
    float _458 = floor(_452);
    float _460 = _432 * 2.0;
    float _462 = floor(_456);
    bool _464 = _458 > 0.0;
    float _466 = floor(_460);
    bool _468 = _458 >= 0.0;
    bool _470 = isnan(_458);
    bool _472 = _468 || _470;
    bool _474 = isnan(0.0);
    bool _476 = _472 || _474;
    float _478 = _416 * _124;
    int _480 = _476 ? 0 : 1;
    bool _482 = _462 > 0.0;
    float _484 = exp2(_478);
    bool _486 = _462 >= 0.0;
    bool _488 = isnan(_462);
    bool _490 = _486 || _488;
    bool _492 = isnan(0.0);
    bool _494 = _490 || _492;
    float _496 = _432 + _418;
    int _498 = ~_480;
    int _500 = _498 + 1;
    int _502 = _500 + 1;
    int _504 = _494 ? 0 : 1;
    float _506 = _496 + (-1.0);
    int _508 = _502;
    if (!_464)
    {
        int _510 = ~_480;
        int _512 = _510 + 1;
        _508 = _512;
    }
    int _514 = _508;
    int _516 = ~_504;
    int _518 = _516 + 1;
    int _520 = _518 + 1;
    float _522 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _524 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _526 = isnan(1.0);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _532 = _528 || _530;
    float _534 = _412 + _432;
    int _536 = _520;
    if (!_482)
    {
        int _538 = ~_504;
        int _540 = _538 + 1;
        _536 = _540;
    }
    int _542 = _536;
    float _544 = in.m_53.x;
    float _546 = in.m_53.y;
    float _548 = in.m_53.z;
    float _550 = -_484;
    float _552 = _550 + 1.0;
    bool _554 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _562 = _558 || _560;
    float _564 = _534 + (-1.0);
    float _566 = float(_542);
    float _568 = _562 ? _552 : 0.0;
    float _570 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _572 = _466 > 0.0;
    float _574 = _454 * _566;
    float _576 = float(_450);
    if (_532)
    {
        float _578 = _568 * _442;
        _126 = _578;
    }
    float _580 = _126;
    float _582 = float(_514);
    float _584 = _574 * (-2.0);
    bool _586 = _466 >= 0.0;
    bool _588 = isnan(_466);
    bool _590 = _586 || _588;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    bool _596 = !_430;
    int _598 = _596 ? 0 : 1;
    float _600 = _576 * _582;
    int _602 = _594 ? 0 : 1;
    float _604 = _412 + (-0.5);
    int _606 = abs(_598);
    float _608 = fma(_570, _584, _570);
    float _610 = fma(_584, _544, _544);
    int _612 = ~_602;
    int _614 = _612 + 1;
    int _616 = _614 + 1;
    float _618 = _600 * (-2.0);
    int _620 = _616;
    if (!_572)
    {
        int _622 = ~_602;
        int _624 = _622 + 1;
        _620 = _624;
    }
    int _626 = _620;
    float _628 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[196].x, _610);
    float _630 = _432 + (-0.5);
    float _632 = float(_606);
    float _634 = fma(_618, _546, _546);
    float _636 = float(_626);
    float _638 = fma(_522, _618, _522);
    float _640 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[196].y, _634);
    float _642 = _412 + _418;
    float _644 = _632 * _636;
    float _646 = _418 + (-0.5);
    float _648 = fma(_638, _580, _640);
    float _650 = _642 + (-1.0);
    float _652 = _644 * (-2.0);
    float _654 = fma(_608, _580, _628);
    float _656 = in.m_49.x;
    float _658 = in.m_49.y;
    float _660 = in.m_49.z;
    float _662 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _664 = fma(_652, _548, _548);
    float _666 = _648 * 0.15915493667125701904296875;
    float _668 = in.m_55.x;
    float _670 = in.m_55.y;
    float _672 = in.m_55.z;
    float _674 = fma(_662, _652, _662);
    float _676 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].z, _664);
    float _678 = _654 * 0.15915493667125701904296875;
    float _680 = _666 * 6.283185482025146484375;
    float _682 = sin(_680);
    float _684 = fma(_674, _580, _676);
    float _686 = _684 * 0.15915493667125701904296875;
    float _688 = _678 * 6.283185482025146484375;
    float _690 = sin(_688);
    bool _692 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _694 = isnan(0.5);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _700 = _696 || _698;
    float _702 = _678 * 6.283185482025146484375;
    float _704 = cos(_702);
    float _706 = _378 * _658;
    float _708 = _380 * _660;
    float _710 = _372 * _656;
    float _712 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _672);
    float _714 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _670);
    float _716 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _718 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _720 = _666 * 6.283185482025146484375;
    float _722 = cos(_720);
    float _724 = _690 * _682;
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _668);
    float _728 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _730 = _712 * _716;
    float _732 = _714 * _718;
    float _734 = _726 * _728;
    float _736 = _686 * 6.283185482025146484375;
    float _738 = sin(_736);
    float _740 = _686 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = _704 * _722;
    float _746 = _690 * _722;
    float _748 = fma(_738, _744, _724);
    float _750 = fma(_738, _724, _744);
    float _752 = _704 * _682;
    float _754 = _742 * _730;
    float _756 = _682 * _742;
    float _758 = _722 * _742;
    float _760 = -_730;
    float _762 = _738 * _760;
    float _764 = _704 * _754;
    float _766 = _690 * _754;
    float _768 = -_752;
    float _770 = fma(_738, _746, _768);
    float _772 = -_746;
    float _774 = fma(_738, _752, _772);
    float _776 = fma(_758, _734, _762);
    float _778 = fma(_748, _734, _764);
    float _780 = fma(_770, _734, _766);
    float _782 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _784 = -_732;
    float _786 = fma(_756, _784, _776);
    float _788 = -_732;
    float _790 = fma(_774, _788, _778);
    float _792 = -_732;
    float _794 = fma(_750, _792, _780);
    float _796 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _782);
    float _798 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _800 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _802 = _790 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _804 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _796);
    float _806 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _798);
    float _808 = _790 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _810 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[10].x, _802);
    float _812 = _804 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _814 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _806);
    float _816 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].x, _808);
    float _818 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[10].z, _810);
    float _820 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _800);
    float _822 = _814 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _824 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[8].z, _816);
    float _826 = _812 + _818;
    float _828 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _820);
    float _830 = _822 + _824;
    float _832 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _834 = _826 + _832;
    float _836 = _828 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _838 = _828;
    float _840 = _790;
    float _842 = _826;
    if (_700)
    {
        _838 = 1.0;
    }
    float _844 = _838;
    float _846 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _848 = _830 + _846;
    float _850 = _834 * _834;
    float _852 = _836 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _854 = fma(_848, _848, _850);
    float _856 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[11].x, _852);
    float _858 = sqrt(_854);
    float _860 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[11].z, _856);
    float _862 = _836 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _864 = _860 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _866 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[10].x, _862);
    float _868 = 1.0 / _864;
    float _870 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[10].z, _866);
    float _872 = _790 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _874 = _870 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _876 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[9].x, _872);
    bool _878 = _858 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _880 = _874 + _864;
    float _882 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[9].z, _876);
    float _884 = _836 + _882;
    float _886 = _880 * _868;
    float _888 = _886 * 0.5;
    float _890 = _864;
    float _892 = _882;
    float _894 = _884;
    float _896 = _844;
    if (!_878)
    {
        _890 = _830;
    }
    float _898 = _890;
    float _900 = _898;
    if (!_878)
    {
        _892 = _826;
    }
    float _902 = _892;
    float _904 = _902;
    if (!_878)
    {
        _840 = _884;
    }
    float _906 = _840;
    bool _908 = !_878;
    float _910 = _906;
    if (!_908)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _916 = _858 + _914;
        float _918 = rsqrt(_854);
        float _920 = _916 * _912;
        float _922 = _884 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _924 = _920 * 0.15915493667125701904296875;
        float _926 = _924 * 6.283185482025146484375;
        float _928 = cos(_926);
        float _930 = _924 * 6.283185482025146484375;
        float _932 = sin(_930);
        float _934 = _928 + (-1.0);
        float _936 = fma(_932, _922, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _938 = _934 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _940 = _918 * _936;
        float _942 = fma(_884, _928, _938);
        float _944 = fma(_848, _940, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _946 = fma(_834, _940, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _910 = _942;
        _900 = _944;
        _904 = _946;
    }
    float _948 = _910;
    float _950 = _900;
    float _952 = _904;
    if (!_700)
    {
        float _954 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _956 = _954 * 0.15915493667125701904296875;
        float _958 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _960 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _962 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[30].w, _960);
        float _964 = _956 * 6.283185482025146484375;
        float _966 = cos(_964);
        float _968 = _958 * 0.15915493667125701904296875;
        float _970 = _956 * 6.283185482025146484375;
        float _972 = sin(_970);
        float _974 = 1.0 / _966;
        float _976 = _968 * 6.283185482025146484375;
        float _978 = cos(_976);
        float _980 = _972 * _974;
        float _982 = _968 * 6.283185482025146484375;
        float _984 = sin(_982);
        float _986 = _978 * _980;
        float _988 = 1.0 / _962;
        float _990 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _992 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _990;
        float _994 = 1.0 / _986;
        float _996 = 1.0 / _992;
        float _998 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1000 = _988 * _998;
        float _1002 = _984 * _994;
        float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1006 = fma(_1002, _1000, _1004);
        float _1008 = _1006 * _996;
        float _1010 = precise::clamp(_1008, 0.0, 1.0);
        float _1012 = -_1010;
        float _1014 = _1012 + 1.0;
        _842 = _968;
        _894 = _988;
        _896 = _1014;
    }
    float _1016 = _842;
    float _1018 = _894;
    float _1020 = _896;
    float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1024 = _948 + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1028 = _950 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1032 = _952 + _1030;
    float _1034 = _1024 * _1024;
    float _1036 = fma(_1028, _1028, _1034);
    float _1038 = fma(_1032, _1032, _1036);
    float _1040 = rsqrt(_1038);
    float _1042 = sqrt(_1038);
    float _1044 = _1040 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1046 = _1028 * _1044;
    float _1048 = _1032 * _1044;
    float _1050 = _1046 * _1046;
    float _1052 = _1048 * _1048;
    float _1054 = _1050 + _1052;
    float _1056 = sqrt(_1054);
    bool _1058 = _1056 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1060 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = _1056 + _1060;
    float _1064 = _1032;
    float _1066 = _1018;
    float _1068 = _1062;
    float _1070 = _1034;
    float _1072 = _1024;
    if (_1058)
    {
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1064 = _1074;
    }
    float _1076 = _1064;
    if (_1058)
    {
        float _1078 = rsqrt(_1054);
        _1066 = _1078;
    }
    float _1080 = _1066;
    float _1082 = _1080;
    if (_1058)
    {
        float _1084 = _1062 * _1076;
        _1068 = _1084;
    }
    float _1086 = _1068;
    if (_1058)
    {
        float _1088 = _1086 * 0.15915493667125701904296875;
        _1070 = _1088;
    }
    float _1090 = _1070;
    float _1092 = _1040;
    float _1094 = _1090;
    if (_1058)
    {
        float _1096 = _1090 * 6.283185482025146484375;
        float _1098 = sin(_1096);
        _1092 = _1098;
    }
    float _1100 = _1092;
    float _1102 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1104 = precise::max(0.0, _1102);
    float _1106 = _1016;
    float _1108 = _1104;
    float _1110 = _1102;
    if (_1058)
    {
        float _1112 = _1090 * 6.283185482025146484375;
        float _1114 = cos(_1112);
        _1106 = _1114;
    }
    float _1116 = _1106;
    float _1118 = -_1044;
    float _1120 = -_1104;
    float _1122 = fma(_1024, _1118, _1120);
    if (_1058)
    {
        float _1124 = _1122 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1108 = _1124;
    }
    float _1126 = _1108;
    float _1128 = _1126;
    if (!_1058)
    {
        _1094 = _1050;
    }
    float _1130 = _1094;
    float _1132 = _1100;
    float _1134 = _1130;
    if (_1058)
    {
        float _1136 = fma(_1100, _1126, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1128 = _1136;
    }
    float _1138 = _1128;
    float _1140 = _1138;
    if (!_1058)
    {
        _1132 = _1122;
    }
    float _1142 = _1132;
    float _1144 = _1142;
    if (_1058)
    {
        float _1146 = _1116 + (-1.0);
        _1110 = _1146;
    }
    float _1148 = _1110;
    float _1150 = _1148;
    if (_1058)
    {
        float _1152 = _1080 * _1138;
        _1072 = _1152;
    }
    float _1154 = _1072;
    if (!_1058)
    {
        _1082 = _1046;
    }
    float _1156 = _1082;
    float _1158 = _1156;
    if (_1058)
    {
        float _1160 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1150 = _1160;
    }
    float _1162 = _1150;
    float _1164 = _1162;
    if (_1058)
    {
        float _1166 = _1046 * _1154;
        _1158 = _1166;
    }
    float _1168 = _1158;
    if (!_1058)
    {
        _1140 = _1048;
    }
    float _1170 = _1140;
    float _1172 = _1170;
    if (_1058)
    {
        float _1174 = _1048 * _1154;
        _1172 = _1174;
    }
    float _1176 = _1172;
    if (_1058)
    {
        float _1178 = fma(_1122, _1116, _1162);
        _1144 = _1178;
    }
    float _1180 = _1144;
    if (_1058)
    {
        float _1182 = _1168 * _1168;
        _1134 = _1182;
    }
    float _1184 = _1134;
    if (!_1058)
    {
        _1164 = _1052;
    }
    float _1186 = _1164;
    float _1188 = _1186;
    if (_1058)
    {
        float _1190 = _1176 * _1176;
        _1188 = _1190;
    }
    float _1192 = _1188;
    float _1194 = fma(_1180, _1180, _1184);
    float _1196 = _948 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1198 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1200 = _948 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1202 = _1194 + _1192;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1206 = fma(_1042, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1204);
    float _1208 = precise::clamp(_1206, 0.0, 1.0);
    float _1210 = _948 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1212 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1196);
    float _1214 = rsqrt(_1202);
    float _1216 = -_1208;
    float _1218 = _1216 + 1.0;
    float _1220 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1210);
    float _1222 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1212);
    float _1224 = _948 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1226 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1200);
    float _1228 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1220);
    float _1230 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1232 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1224);
    float _1234 = abs(_1218);
    float _1236 = log2(_1234);
    float _1238 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1226);
    float _1240 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1242 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1244 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1232);
    float _1246 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1248 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1250 = _1214 * _1168;
    float _1252 = _1214 * _1180;
    float _1254 = -_1242;
    float _1256 = fma(_1254, _1198, 1.0);
    float _1258 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1260 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1262 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1248);
    float _1264 = _1214 * _1176;
    float _1266 = -_1260;
    float _1268 = fma(_1252, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1266);
    float _1270 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1262);
    float _1272 = _1236 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1274 = log2(_1256);
    float _1276 = -_1264;
    float _1278 = fma(_1276, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1268);
    float _1280 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1270);
    float _1282 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1284 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1286 = fma(_1278, -0.5, 0.5);
    float _1288 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1282);
    float _1290 = exp2(_1272);
    float _1292 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1284);
    float _1294 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1288);
    float _1296 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1292);
    float _1298 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1294);
    float _1300 = 1.0 / _1280;
    float _1302 = fma(_1278, 0.5, 0.5);
    float _1304 = _1252 + 1.0;
    float _1306 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1296);
    float _1308 = _1274 * 0.693147182464599609375;
    float _1310 = fma(_1302, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1312 = sqrt(_1286);
    float _1314 = -_1252;
    float _1316 = fma(_1290, _1304, _1314);
    float _1318 = fma(_1302, _1310, -0.212114393711090087890625);
    float _1320 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1322 = fma(_1302, _1318, 1.570728778839111328125);
    float _1324 = _1298 * _1300;
    float _1326 = _1306 * _1300;
    float _1328 = fma(_1316, 0.5, 0.5);
    float _1330 = fma(_1324, 0.5, 0.5);
    float _1332 = fma(_1326, -0.5, 0.5);
    float _1334 = _1312 * 0.636619746685028076171875;
    float3 _3533 = float3(_1330, _1332, _1320);
    float _1336 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3533, float3(0.0), isnan(_3533)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3533, float3(0.0), isnan(_3533)), level(0.0)).x;
    float _1338 = -_1322;
    float _1340 = fma(_1334, _1338, 1.0);
    float3 _3549 = float3(_1330, _1332, _1320);
    float4 _1343 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3549, float3(0.0), isnan(_3549)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3549, float3(0.0), isnan(_3549)), level(0.0)).xyzw;
    float _1345 = _1343.x;
    float _1347 = _1343.y;
    float _1349 = _1343.z;
    float _1351 = _1343.w;
    float2 _3566 = float2(_1340, _1328);
    float3 _1355 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3566, float2(0.0), isnan(_3566)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3566, float2(0.0), isnan(_3566)), level(0.0)).xyz;
    float _1357 = _1355.x;
    float _1359 = _1355.y;
    float _1361 = _1355.z;
    float _1363 = in.m_57.y;
    float _1365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1367 = in.m_59.x;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1371 = _1369 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1375 = _1373 != 0;
    float _1377 = in.m_59.y;
    int _1379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1381 = _1379 != 0;
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1383;
    bool _1387 = _412 > 0.5;
    bool _1389 = _1387 && _1375;
    float _1391 = 1.0 / _1371;
    float _1393 = in.m_57.x;
    bool _1395 = _432 > 0.5;
    float _1397 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1399 = in.m_57.z;
    bool _1401 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1403 = isnan(_410);
    bool _1405 = _1401 || _1403;
    bool _1407 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1409 = _1405 || _1407;
    float _1411 = float(_1409);
    float _1413 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1397);
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1419 = in.m_57.w;
    float _1421 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1413);
    out.m_61.y = _1363;
    float _1423 = _1385 * _1391;
    float _1425 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1427 = _410 + _1425;
    bool _1429 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1431 = isnan(_410);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1437 = _1433 || _1435;
    float _1439 = float(_1437);
    float _1441 = -_1377;
    float _1443 = _1441 + 1.0;
    float _1445 = fma(_1423, _1427, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1447 = _1427;
    float _1449 = _1363;
    float _1451 = _1377;
    if (!_1375)
    {
        _1447 = _1367;
    }
    float _1453 = _1447;
    float _1455 = _1453;
    if (_1375)
    {
        _1449 = _1367;
    }
    float _1457 = _1449;
    out.m_61.x = _1393;
    float _1459 = _1457;
    if (_1381)
    {
        float _1461 = _1395 ? _1443 : _1377;
        _1451 = _1461;
    }
    float _1463 = _1451;
    if (_1389)
    {
        float _1465 = -_1457;
        float _1467 = _1465 + 1.0;
        _1459 = _1467;
    }
    float _1469 = _1459;
    out.m_61.z = _1399;
    bool _1471 = _1020 > 0.0;
    bool _1473 = isnan(_1020);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan(0.0);
    bool _1479 = _1475 || _1477;
    float _1481 = -_1411;
    float _1483 = _1481 + 1.0;
    if (_1375)
    {
        _1455 = _1469;
    }
    float _1485 = _1455;
    float _1487 = _1463 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1491 = _1439 * _1483;
    float _1493 = -_1439;
    float _1495 = _1493 + 1.0;
    float _1497 = _1485 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1499 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1501 = _1236 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1503 = _1445 * _1491;
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1507 = _1487 * _1417;
    float _1509 = _1497 * _1365;
    float _1511 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1503);
    float _1513 = exp2(_1501);
    float _1515 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1421);
    float _1517 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1519 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1521 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1511);
    out.m_63.x = _1509;
    out.m_63.y = _1507;
    float _1523 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1525 = _1515 + _1523;
    out.m_65.x = _1517;
    out.m_65.y = _1499;
    out.m_65.z = _1519;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1529 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_61.w = _1419;
    float _1531 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1533 = -_1513;
    float _1535 = _1533 + 1.0;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1539 = _1521 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1541 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1543 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1545 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1547 = _1280 + _1525;
    out.gl_Position.x = _1298;
    out.gl_Position.y = _1306;
    out.gl_Position.z = _1525;
    out.gl_Position.w = _1280;
    float _1549 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1551 = _1547 * 0.5;
    float _1553 = _1545 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _1531;
    out.m_67.y = _1543;
    out.m_67.z = _1549;
    out.m_67.w = _1539;
    out.m_69.z = _1551;
    out.m_69.w = _1280;
    out.m_45.x = _1553;
    float _1555 = _1541 * _1336;
    float _1557 = -_1541;
    float _1559 = _1557 + 1.0;
    float _1561 = _1351 * _1555;
    float _1563 = _1351 * _1559;
    float _1565 = _1361 * _1555;
    float _1567 = fma(_1357, _1561, _1345);
    float _1569 = fma(_1359, _1561, _1347);
    float _1571 = fma(_1351, _1565, _1349);
    out.m_71.x = _1567;
    out.m_71.y = _1569;
    out.m_71.z = _1571;
    out.m_71.w = _1563;
    if (_1479)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1573 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1573;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

