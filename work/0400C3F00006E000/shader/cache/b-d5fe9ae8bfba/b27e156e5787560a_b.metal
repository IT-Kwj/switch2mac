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
    float4 m_69 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_71 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_49 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_42 [[attribute(6)]];
    float4 m_47 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_61 [[attribute(11)]];
    float4 m_63 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _316 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1436 = as_type<float>(_108);
        out.gl_Position.z = _1436;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
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
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    float _146 = as_type<float>(_144);
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1507 = as_type<float>(_144);
        out.gl_Position.z = _1507;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_49.z;
    bool _150 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _152 = in.m_51.z;
    float _154 = in.m_49.y;
    float _156 = in.m_53.z;
    float _158 = in.m_51.y;
    float _160 = in.m_53.y;
    float _162 = _148 * _148;
    float _164 = in.m_49.x;
    float _166 = fma(_152, _152, _162);
    float _168 = in.m_51.x;
    float _170 = _154 * _154;
    float _172 = in.m_53.x;
    float _174 = fma(_156, _156, _166);
    float _176 = fma(_158, _158, _170);
    float _178 = sqrt(_174);
    float _180 = fma(_160, _160, _176);
    float _182 = in.m_55.x;
    float _184 = in.m_55.y;
    float _186 = in.m_55.z;
    float _188 = sqrt(_180);
    bool _190 = _178 > 0.0;
    bool _192 = _188 > 0.0;
    float _194 = _188;
    float _196 = _174;
    float _198 = _164;
    if (_190)
    {
        float _200 = rsqrt(_174);
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _154 * _184;
    float _206 = _158 * _184;
    float _208 = _160 * _184;
    float _210 = _206;
    float _212 = _204;
    if (!_190)
    {
        _146 = 0.0;
    }
    float _214 = _146;
    float _216 = fma(_182, _164, _204);
    float _218 = fma(_182, _168, _206);
    float _220 = fma(_182, _172, _208);
    float _222 = _180;
    float _224 = _214;
    if (_192)
    {
        float _226 = rsqrt(_180);
        _222 = _226;
    }
    float _228 = _222;
    if (!_190)
    {
        _196 = 0.0;
        _210 = 0.0;
    }
    float _230 = _196;
    float _232 = _210;
    float _234 = _230;
    float _236 = _232;
    if (!_192)
    {
        _212 = 0.0;
    }
    float _238 = _212;
    float _240 = fma(_148, _186, _216);
    float _242 = 0.0;
    float _244 = _238;
    if (!_192)
    {
        _242 = 0.0;
    }
    float _246 = _242;
    float _248 = fma(_152, _186, _218);
    float _250 = 0.0;
    float _252 = _246;
    if (!_192)
    {
        _250 = 0.0;
    }
    float _254 = _250;
    float _256 = fma(_156, _186, _220);
    float _258 = _202;
    float _260 = _254;
    if (_190)
    {
        float _262 = _202 * 0.001000000047497451305389404296875;
        _258 = _262;
    }
    float _264 = _258;
    if (_190)
    {
        float _266 = _152 * _264;
        _234 = _266;
    }
    float _268 = _234;
    if (_190)
    {
        float _270 = _148 * _264;
        _224 = _270;
    }
    float _272 = _224;
    if (_190)
    {
        float _274 = _156 * _264;
        _236 = _274;
    }
    float _276 = _236;
    if (_192)
    {
        float _278 = _228 * _158;
        _244 = _278;
    }
    float _280 = _244;
    float _282 = _280;
    if (_192)
    {
        float _284 = _228 * _154;
        _252 = _284;
    }
    float _286 = _252;
    float _288 = _286;
    if (_192)
    {
        float _290 = _228 * _160;
        _260 = _290;
    }
    float _292 = _260;
    bool _294 = !_150;
    float _296 = _292;
    float _314;
    if (!_294)
    {
        float _298 = in.m_57.x;
        float _300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _302 = _298 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _306 = _304 * _300;
        float _308 = floor(_306);
        float _310 = -_308;
        float _312 = _306 + _310;
        _314 = _312;
        _316 = true;
    }
    else
    {
        float _318 = float(_92);
        float _320 = 1.0 / _318;
        float _322 = _126 * _320;
        _314 = _322;
    }
    _316 = false;
    float _324 = _314;
    float _326 = in.m_42.x;
    float _328 = in.m_42.y;
    float _330 = in.m_42.z;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = _324 + _332;
    float _336 = in.m_57.x;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _346 = 1.0 / _340;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _348;
    bool _352 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _354 = isnan(_324);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _364;
    float _368 = 1.0 / _344;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _370;
    float _374 = _158 * _328;
    float _376 = _160 * _328;
    float _378 = 1.0 / _350;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _382 = _324 + _380;
    float _384 = fma(_168, _326, _374);
    float _386 = fma(_172, _326, _376);
    float _388 = fma(_336, 0.2000000476837158203125, 0.89999997615814208984375);
    float _390 = _336 * 100.0;
    float _392 = in.m_59.x;
    float _394 = in.m_59.y;
    float _396 = in.m_59.z;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = _324 + _398;
    float _402 = _388 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _404 = _382 * _368;
    float _406 = fma(_126, 0.00999999977648258209228515625, _390);
    float _408 = fma(_126, _402, _390);
    float _410 = _400 * _346;
    float _412 = _334 * _378;
    float _414 = fma(_152, _330, _384);
    float _416 = fma(_156, _330, _386);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _426;
    float _430 = _240 * _240;
    float _432 = fma(_420, _410, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _434 = fma(_424, _410, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _436 = fma(_428, _410, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _438 = fma(_248, _248, _430);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _452 = _392 > 0.0;
    float _454 = fma(_256, _256, _438);
    bool _456 = _392 >= 0.0;
    bool _458 = isnan(_392);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    float _466 = abs(_392);
    float _468 = -_466;
    float _470 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[191].y, _408);
    bool _472 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _474 = isnan(_324);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = fma(_442, _404, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _486 = _464 ? 0 : 1;
    float _488 = _470 * 0.15915493667125701904296875;
    float _490 = rsqrt(_454);
    float _492 = fma(_446, _404, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _494 = ~_486;
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    float _500 = fma(_450, _404, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _502 = -_482;
    float _504 = _502 + 1.0;
    int _506 = _498;
    float _508 = _328;
    if (!_452)
    {
        int _510 = ~_486;
        int _512 = _510 + 1;
        _506 = _512;
    }
    int _514 = _506;
    float _516 = _406 * 0.15915493667125701904296875;
    bool _518 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _520 = isnan(_324);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _488 * 6.283185482025146484375;
    float _532 = cos(_530);
    bool _534 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _536 = isnan(_324);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = abs(_392);
    float _548 = -_546;
    float _550 = _548 + 1.0;
    float _552 = _528 * _504;
    float _554 = -_528;
    float _556 = _554 + 1.0;
    float _558 = -_544;
    float _560 = _558 + 1.0;
    float _562 = float(_514);
    float _564 = _240 * _490;
    float _566 = _544 * _556;
    float _568 = fma(_366, _412, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _570 = -_550;
    float _572 = fma(_570, _550, 1.0);
    float _574 = _362 * _560;
    float _576 = _248 * _490;
    float _578 = _488 * 6.283185482025146484375;
    float _580 = sin(_578);
    float _582 = _256 * _490;
    float _584 = _532 * _572;
    float _586 = _432 * _574;
    float _588 = _564 * _286;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _590;
    float _594 = _436 * _574;
    float _596 = _562 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _598 = _516 * 6.283185482025146484375;
    float _600 = sin(_598);
    float _602 = fma(_576, _280, _588);
    float _604 = _434 * _574;
    float _606 = _584 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _608 = fma(_582, _292, _602);
    float _610 = -_362;
    float _612 = _610 + 1.0;
    float _614 = _606 * 0.15915493667125701904296875;
    float _616 = fma(_592, _412, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _618 = _580 * _596;
    float _620 = abs(_608);
    bool _622 = _620 > 0.99989998340606689453125;
    float _624 = fma(_372, _412, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _626 = _614 * 6.283185482025146484375;
    float _628 = cos(_626);
    float _630 = _584 * _596;
    float _632 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].y, _604);
    float _634 = fma(_600, 2.0, 2.0);
    float _636 = precise::clamp(_634, 0.0, 1.0);
    float _638 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].x, _586);
    float _640 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].z, _594);
    float _642 = _618 * 0.15915493667125701904296875;
    float _644 = _614 * 6.283185482025146484375;
    float _646 = sin(_644);
    float _648 = _630 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _650 = fma(_636, 0.949999988079071044921875, -1.0);
    float _652 = fma(_484, _566, _638);
    float _654 = fma(_492, _566, _632);
    float _656 = fma(_500, _566, _640);
    if (_622)
    {
        float _658 = _280 + _268;
        _282 = _658;
    }
    float _660 = _282;
    if (_622)
    {
        float _662 = _286 + _272;
        _288 = _662;
    }
    float _664 = _288;
    if (_622)
    {
        float _666 = _292 + _276;
        _296 = _666;
    }
    float _668 = _296;
    float _670 = _642 * 6.283185482025146484375;
    float _672 = cos(_670);
    float _674 = in.m_61.x;
    float _676 = in.m_61.y;
    float _678 = in.m_61.z;
    float _680 = _648 * 0.15915493667125701904296875;
    float _682 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[192].z, 1.0);
    float _684 = fma(_624, _552, _656);
    float _686 = -_664;
    float _688 = _576 * _686;
    float _690 = -_660;
    float _692 = _582 * _690;
    float _694 = fma(_616, _552, _652);
    float _696 = _642 * 6.283185482025146484375;
    float _698 = sin(_696);
    float _700 = fma(_568, _552, _654);
    float _702 = -_668;
    float _704 = _564 * _702;
    float _706 = -_668;
    float _708 = -_692;
    float _710 = fma(_576, _706, _708);
    float _712 = -_660;
    float _714 = -_688;
    float _716 = fma(_564, _712, _714);
    float _718 = _628 * _396;
    float _720 = in.m_63.x;
    float _722 = _408 * 0.15915493667125701904296875;
    float _724 = _680 * 6.283185482025146484375;
    float _726 = sin(_724);
    float _728 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[146].x, _694);
    float _730 = -_664;
    float _732 = -_704;
    float _734 = fma(_582, _730, _732);
    float _736 = fma(_646, _394, _718);
    float _738 = _646 * _396;
    float _740 = _672 * _392;
    float _742 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[146].y, _700);
    float _744 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[146].z, _684);
    float _746 = _680 * 6.283185482025146484375;
    float _748 = cos(_746);
    float _750 = -_738;
    float _752 = fma(_628, _394, _750);
    float _754 = fma(_736, _698, _740);
    float _756 = _728 * _674;
    float _758 = _698 * _392;
    float _760 = _742 * _676;
    float _762 = _744 * _678;
    float _764 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _766 = _752 * _726;
    float _768 = _710 * _710;
    float _770 = _722 * 6.283185482025146484375;
    float _772 = sin(_770);
    float _774 = -_758;
    float _776 = fma(_736, _672, _774);
    float _778 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _780 = fma(_734, _734, _768);
    float _782 = _762 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _784 = -_776;
    float _786 = _784 + _396;
    float _788 = _752 * _748;
    float _790 = fma(_716, _716, _780);
    float _792 = -_766;
    float _794 = fma(_754, _748, _792);
    float _796 = fma(_786, _720, _776);
    float _798 = fma(_754, _726, _788);
    float _800 = _154 * _328;
    float _802 = -_794;
    float _804 = _802 + _392;
    float _806 = rsqrt(_790);
    float _808 = -_798;
    float _810 = _808 + _394;
    float _812 = in.m_53.w;
    float _814 = fma(_804, _720, _794);
    float _816 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[191].w, _796);
    float _818 = fma(_810, _720, _798);
    float _820 = fma(_164, _326, _800);
    float _822 = -_392;
    float _824 = _814 + _822;
    float _826 = -_396;
    float _828 = _816 + _826;
    float _830 = -_394;
    float _832 = _818 + _830;
    float _834 = fma(_148, _330, _820);
    float _836 = fma(_682, _824, _392);
    float _838 = fma(_682, _832, _394);
    float _840 = fma(_682, _828, _396);
    float _842 = _710 * _806;
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _838);
    float _846 = in.m_51.w;
    float _848 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _836);
    float _850 = _734 * _806;
    float _852 = _778 * _844;
    float _854 = _716 * _806;
    float _856 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _840);
    float _858 = _764 * _848;
    float _860 = _576 * _842;
    float _862 = _852 * _582;
    float _864 = _782 * _856;
    float _866 = _564 * _854;
    float _868 = -_860;
    float _870 = fma(_564, _850, _868);
    float _872 = _852 * _576;
    float _874 = fma(_858, _854, _862);
    float _876 = _416 + _812;
    float _878 = -_866;
    float _880 = fma(_582, _842, _878);
    float _882 = fma(_858, _850, _872);
    float _884 = fma(_864, _870, _874);
    float _886 = _582 * _850;
    float _888 = _852 * _564;
    float _890 = fma(_864, _880, _882);
    float _892 = _876 + _884;
    float _894 = -_886;
    float _896 = fma(_576, _854, _894);
    float _898 = fma(_858, _842, _888);
    float _900 = _414 + _846;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _904 = _892 + _902;
    float _906 = fma(_864, _896, _898);
    float _908 = _900 + _890;
    float _910 = _904 * _904;
    float _912 = in.m_49.w;
    float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _916 = _908 + _914;
    float _918 = fma(_916, _916, _910);
    float _920 = sqrt(_918);
    float _922 = _834 + _912;
    bool _924 = _920 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _926 = _922 + _906;
    float _928 = _906;
    float _930 = _842;
    float _932 = _854;
    if (!_924)
    {
        _198 = _908;
    }
    float _934 = _198;
    float _936 = _934;
    if (!_924)
    {
        _508 = _892;
    }
    float _938 = _508;
    float _940 = _938;
    if (!_924)
    {
        _928 = _926;
    }
    float _942 = _928;
    bool _944 = !_924;
    float _946 = _942;
    if (!_944)
    {
        float _948 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _952 = _920 + _950;
        float _954 = rsqrt(_918);
        float _956 = _952 * _948;
        float _958 = _926 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _960 = _956 * 0.15915493667125701904296875;
        float _962 = _960 * 6.283185482025146484375;
        float _964 = cos(_962);
        float _966 = _960 * 6.283185482025146484375;
        float _968 = sin(_966);
        float _970 = _964 + (-1.0);
        float _972 = _970 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = fma(_968, _958, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _976 = fma(_926, _964, _972);
        float _978 = _954 * _974;
        float _980 = fma(_916, _978, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _982 = fma(_904, _978, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _946 = _976;
        _936 = _980;
        _940 = _982;
    }
    float _984 = _946;
    float _986 = _936;
    float _988 = _940;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _992 = _984 + _990;
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _996 = _986 + _994;
    float _998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1000 = _988 + _998;
    float _1002 = _992 * _992;
    float _1004 = fma(_996, _996, _1002);
    float _1006 = fma(_1000, _1000, _1004);
    float _1008 = rsqrt(_1006);
    float _1010 = _1008 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1012 = _996 * _1010;
    float _1014 = _1000 * _1010;
    float _1016 = _1012 * _1012;
    float _1018 = _1014 * _1014;
    float _1020 = _1016 + _1018;
    float _1022 = sqrt(_1020);
    bool _1024 = _1022 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1028 = _1022 + _1026;
    float _1030 = _1008;
    float _1032 = _1028;
    float _1034 = _1010;
    float _1036 = _1012;
    if (_1024)
    {
        float _1038 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1030 = _1038;
    }
    float _1040 = _1030;
    if (_1024)
    {
        float _1042 = rsqrt(_1020);
        _930 = _1042;
    }
    float _1044 = _930;
    float _1046 = _1044;
    if (_1024)
    {
        float _1048 = _1028 * _1040;
        _1032 = _1048;
    }
    float _1050 = _1032;
    if (_1024)
    {
        float _1052 = _1050 * 0.15915493667125701904296875;
        _932 = _1052;
    }
    float _1054 = _932;
    float _1056 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1058 = _858;
    if (_1024)
    {
        float _1060 = _1054 * 6.283185482025146484375;
        float _1062 = sin(_1060);
        _1058 = _1062;
    }
    float _1064 = _1058;
    float _1066 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1068 = precise::max(0.0, _1066);
    float _1070 = _1000;
    float _1072 = _1068;
    float _1074 = _1066;
    if (_1024)
    {
        float _1076 = _1054 * 6.283185482025146484375;
        float _1078 = cos(_1076);
        _1070 = _1078;
    }
    float _1080 = _1070;
    float _1082 = -_1010;
    float _1084 = -_1068;
    float _1086 = fma(_992, _1082, _1084);
    float _1088 = _1086;
    if (_1024)
    {
        float _1090 = _1086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1072 = _1090;
    }
    float _1092 = _1072;
    float _1094 = sqrt(_1006);
    float _1096 = _1064;
    float _1098 = _1092;
    if (_1024)
    {
        float _1100 = fma(_1064, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1096 = _1100;
    }
    float _1102 = _1096;
    float _1104 = _1102;
    if (_1024)
    {
        float _1106 = _1080 + (-1.0);
        _1074 = _1106;
    }
    float _1108 = _1074;
    float _1110 = _1108;
    if (_1024)
    {
        float _1112 = _1044 * _1102;
        _1034 = _1112;
    }
    float _1114 = _1034;
    if (!_1024)
    {
        _1046 = _1086;
    }
    float _1116 = _1046;
    float _1118 = _1116;
    if (_1024)
    {
        float _1120 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1098 = _1120;
    }
    float _1122 = _1098;
    if (_1024)
    {
        float _1124 = _1012 * _1114;
        _1036 = _1124;
    }
    float _1126 = _1036;
    if (!_1024)
    {
        _1104 = _1014;
    }
    float _1128 = _1104;
    float _1130 = _1128;
    if (_1024)
    {
        float _1132 = _1014 * _1114;
        _1130 = _1132;
    }
    float _1134 = _1130;
    if (!_1024)
    {
        _1110 = _1016;
    }
    float _1136 = _1110;
    float _1138 = _1136;
    if (_1024)
    {
        float _1140 = fma(_1086, _1080, _1122);
        _1118 = _1140;
    }
    float _1142 = _1118;
    if (_1024)
    {
        float _1144 = _1126 * _1126;
        _1138 = _1144;
    }
    float _1146 = _1138;
    if (!_1024)
    {
        _1088 = _1018;
    }
    float _1148 = _1088;
    float _1150 = _1148;
    if (_1024)
    {
        float _1152 = _1134 * _1134;
        _1150 = _1152;
    }
    float _1154 = _1150;
    float _1156 = fma(_1142, _1142, _1146);
    float _1158 = _984 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1160 = _984 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1162 = _1156 + _1154;
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1166 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1164);
    float _1168 = precise::clamp(_1166, 0.0, 1.0);
    float _1170 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1158);
    float _1172 = _984 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1174 = rsqrt(_1162);
    float _1176 = -_1168;
    float _1178 = _1176 + 1.0;
    float _1180 = _984 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1182 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1170);
    float _1184 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1172);
    float _1186 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1160);
    float _1188 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1180);
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1192 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1184);
    float _1194 = abs(_1178);
    float _1196 = log2(_1194);
    float _1198 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1188);
    float _1200 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1202 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1204 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1206 = -_1200;
    float _1208 = fma(_1206, _1056, 1.0);
    float _1210 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1212 = _1174 * _1126;
    float _1214 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1186);
    float _1216 = _1174 * _1134;
    float _1218 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1210);
    float _1220 = _1174 * _1142;
    float _1222 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1224 = _1214 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1226 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1218);
    float _1228 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1230 = -_1222;
    float _1232 = fma(_1220, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1230);
    float _1234 = log2(_1208);
    float _1236 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1226);
    float _1238 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1240 = -_1216;
    float _1242 = fma(_1240, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1232);
    float _1244 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1246 = _1220 + 1.0;
    float _1248 = fma(_1242, -0.5, 0.5);
    float _1250 = exp2(_1228);
    float _1252 = fma(_1242, 0.5, 0.5);
    float _1254 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1244);
    float _1256 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1238);
    float _1258 = fma(_1252, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1260 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1254);
    float _1262 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1256);
    float _1264 = 1.0 / _1236;
    float _1266 = _1234 * 0.693147182464599609375;
    float _1268 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1260);
    float _1270 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1262);
    float _1272 = fma(_1252, _1258, -0.212114393711090087890625);
    float _1274 = sqrt(_1248);
    float _1276 = -_1220;
    float _1278 = fma(_1250, _1246, _1276);
    float _1280 = fma(_1252, _1272, 1.570728778839111328125);
    float _1282 = fma(_1278, 0.5, 0.5);
    float _1284 = _1268 * _1264;
    float _1286 = _1270 * _1264;
    float _1288 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1290 = fma(_1284, 0.5, 0.5);
    float _1292 = fma(_1286, -0.5, 0.5);
    float _1294 = _1274 * 0.636619746685028076171875;
    float3 _3293 = float3(_1290, _1292, _1288);
    float _1296 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3293, float3(0.0), isnan(_3293)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3293, float3(0.0), isnan(_3293)), level(0.0)).x;
    float3 _3304 = float3(_1290, _1292, _1288);
    float4 _1299 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3304, float3(0.0), isnan(_3304)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3304, float3(0.0), isnan(_3304)), level(0.0)).xyzw;
    float _1301 = _1299.x;
    float _1303 = _1299.y;
    float _1305 = _1299.z;
    float _1307 = _1299.w;
    float _1309 = -_1280;
    float _1311 = fma(_1294, _1309, 1.0);
    float2 _3326 = float2(_1311, _1282);
    float3 _1315 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3326, float2(0.0), isnan(_3326)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3326, float2(0.0), isnan(_3326)), level(0.0)).xyz;
    float _1317 = _1315.x;
    float _1319 = _1315.y;
    float _1321 = _1315.z;
    float _1323 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1325 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1327 = in.m_63.w;
    float _1329 = exp2(_1323);
    float _1331 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1325);
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1335 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1331);
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1339 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1335);
    float _1341 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1345 = _1339 + _1236;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1349 = -_1329;
    float _1351 = _1349 + 1.0;
    float _1353 = _1345 * 0.5;
    float _1355 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1357 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1359 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1268;
    out.gl_Position.y = _1270;
    out.gl_Position.z = _1339;
    out.gl_Position.w = _1236;
    out.m_65.w = _1327;
    out.m_67.x = _1341;
    out.m_67.y = _1355;
    out.m_67.z = _1357;
    out.m_67.w = _1347;
    out.m_69.z = _1353;
    out.m_69.w = _1236;
    out.m_45.x = 1.0;
    float _1361 = _1359 * _1296;
    float _1363 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1365 = _1307 * _1361;
    out.m_71.w = _1363;
    float _1367 = fma(_1317, _1365, _1301);
    float _1369 = _1321 * _1361;
    float _1371 = -_1359;
    float _1373 = _1371 + 1.0;
    float _1375 = fma(_1319, _1365, _1303);
    float _1377 = fma(_1307, _1369, _1305);
    float _1379 = _1307 * _1373;
    out.m_73.x = _1367;
    out.m_73.y = _1375;
    out.m_73.z = _1377;
    out.m_73.w = _1379;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _316 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1436 = as_type<float>(_108);
        out.gl_Position.z = _1436;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
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
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    float _146 = as_type<float>(_144);
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1507 = as_type<float>(_144);
        out.gl_Position.z = _1507;
    }
    if (_136)
    {
        return out;
    }
    float _148 = in.m_49.z;
    bool _150 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _152 = in.m_51.z;
    float _154 = in.m_49.y;
    float _156 = in.m_53.z;
    float _158 = in.m_51.y;
    float _160 = in.m_53.y;
    float _162 = _148 * _148;
    float _164 = in.m_49.x;
    float _166 = fma(_152, _152, _162);
    float _168 = in.m_51.x;
    float _170 = _154 * _154;
    float _172 = in.m_53.x;
    float _174 = fma(_156, _156, _166);
    float _176 = fma(_158, _158, _170);
    float _178 = sqrt(_174);
    float _180 = fma(_160, _160, _176);
    float _182 = in.m_55.x;
    float _184 = in.m_55.y;
    float _186 = in.m_55.z;
    float _188 = sqrt(_180);
    bool _190 = _178 > 0.0;
    bool _192 = _188 > 0.0;
    float _194 = _188;
    float _196 = _174;
    float _198 = _164;
    if (_190)
    {
        float _200 = rsqrt(_174);
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _154 * _184;
    float _206 = _158 * _184;
    float _208 = _160 * _184;
    float _210 = _206;
    float _212 = _204;
    if (!_190)
    {
        _146 = 0.0;
    }
    float _214 = _146;
    float _216 = fma(_182, _164, _204);
    float _218 = fma(_182, _168, _206);
    float _220 = fma(_182, _172, _208);
    float _222 = _180;
    float _224 = _214;
    if (_192)
    {
        float _226 = rsqrt(_180);
        _222 = _226;
    }
    float _228 = _222;
    if (!_190)
    {
        _196 = 0.0;
        _210 = 0.0;
    }
    float _230 = _196;
    float _232 = _210;
    float _234 = _230;
    float _236 = _232;
    if (!_192)
    {
        _212 = 0.0;
    }
    float _238 = _212;
    float _240 = fma(_148, _186, _216);
    float _242 = 0.0;
    float _244 = _238;
    if (!_192)
    {
        _242 = 0.0;
    }
    float _246 = _242;
    float _248 = fma(_152, _186, _218);
    float _250 = 0.0;
    float _252 = _246;
    if (!_192)
    {
        _250 = 0.0;
    }
    float _254 = _250;
    float _256 = fma(_156, _186, _220);
    float _258 = _202;
    float _260 = _254;
    if (_190)
    {
        float _262 = _202 * 0.001000000047497451305389404296875;
        _258 = _262;
    }
    float _264 = _258;
    if (_190)
    {
        float _266 = _152 * _264;
        _234 = _266;
    }
    float _268 = _234;
    if (_190)
    {
        float _270 = _148 * _264;
        _224 = _270;
    }
    float _272 = _224;
    if (_190)
    {
        float _274 = _156 * _264;
        _236 = _274;
    }
    float _276 = _236;
    if (_192)
    {
        float _278 = _228 * _158;
        _244 = _278;
    }
    float _280 = _244;
    float _282 = _280;
    if (_192)
    {
        float _284 = _228 * _154;
        _252 = _284;
    }
    float _286 = _252;
    float _288 = _286;
    if (_192)
    {
        float _290 = _228 * _160;
        _260 = _290;
    }
    float _292 = _260;
    bool _294 = !_150;
    float _296 = _292;
    float _314;
    if (!_294)
    {
        float _298 = in.m_57.x;
        float _300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _302 = _298 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _306 = _304 * _300;
        float _308 = floor(_306);
        float _310 = -_308;
        float _312 = _306 + _310;
        _314 = _312;
        _316 = true;
    }
    else
    {
        float _318 = float(_92);
        float _320 = 1.0 / _318;
        float _322 = _126 * _320;
        _314 = _322;
    }
    _316 = false;
    float _324 = _314;
    float _326 = in.m_42.x;
    float _328 = in.m_42.y;
    float _330 = in.m_42.z;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = _324 + _332;
    float _336 = in.m_57.x;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _346 = 1.0 / _340;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _348;
    bool _352 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _354 = isnan(_324);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _364;
    float _368 = 1.0 / _344;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _370;
    float _374 = _158 * _328;
    float _376 = _160 * _328;
    float _378 = 1.0 / _350;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _382 = _324 + _380;
    float _384 = fma(_168, _326, _374);
    float _386 = fma(_172, _326, _376);
    float _388 = fma(_336, 0.2000000476837158203125, 0.89999997615814208984375);
    float _390 = _336 * 100.0;
    float _392 = in.m_59.x;
    float _394 = in.m_59.y;
    float _396 = in.m_59.z;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = _324 + _398;
    float _402 = _388 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _404 = _382 * _368;
    float _406 = fma(_126, 0.00999999977648258209228515625, _390);
    float _408 = fma(_126, _402, _390);
    float _410 = _400 * _346;
    float _412 = _334 * _378;
    float _414 = fma(_152, _330, _384);
    float _416 = fma(_156, _330, _386);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _426;
    float _430 = _240 * _240;
    float _432 = fma(_420, _410, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _434 = fma(_424, _410, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _436 = fma(_428, _410, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _438 = fma(_248, _248, _430);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _452 = _392 > 0.0;
    float _454 = fma(_256, _256, _438);
    bool _456 = _392 >= 0.0;
    bool _458 = isnan(_392);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    float _466 = abs(_392);
    float _468 = -_466;
    float _470 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[191].y, _408);
    bool _472 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _474 = isnan(_324);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = fma(_442, _404, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _486 = _464 ? 0 : 1;
    float _488 = _470 * 0.15915493667125701904296875;
    float _490 = rsqrt(_454);
    float _492 = fma(_446, _404, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _494 = ~_486;
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    float _500 = fma(_450, _404, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _502 = -_482;
    float _504 = _502 + 1.0;
    int _506 = _498;
    float _508 = _328;
    if (!_452)
    {
        int _510 = ~_486;
        int _512 = _510 + 1;
        _506 = _512;
    }
    int _514 = _506;
    float _516 = _406 * 0.15915493667125701904296875;
    bool _518 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _520 = isnan(_324);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _488 * 6.283185482025146484375;
    float _532 = cos(_530);
    bool _534 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _536 = isnan(_324);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = abs(_392);
    float _548 = -_546;
    float _550 = _548 + 1.0;
    float _552 = _528 * _504;
    float _554 = -_528;
    float _556 = _554 + 1.0;
    float _558 = -_544;
    float _560 = _558 + 1.0;
    float _562 = float(_514);
    float _564 = _240 * _490;
    float _566 = _544 * _556;
    float _568 = fma(_366, _412, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _570 = -_550;
    float _572 = fma(_570, _550, 1.0);
    float _574 = _362 * _560;
    float _576 = _248 * _490;
    float _578 = _488 * 6.283185482025146484375;
    float _580 = sin(_578);
    float _582 = _256 * _490;
    float _584 = _532 * _572;
    float _586 = _432 * _574;
    float _588 = _564 * _286;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _590;
    float _594 = _436 * _574;
    float _596 = _562 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _598 = _516 * 6.283185482025146484375;
    float _600 = sin(_598);
    float _602 = fma(_576, _280, _588);
    float _604 = _434 * _574;
    float _606 = _584 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _608 = fma(_582, _292, _602);
    float _610 = -_362;
    float _612 = _610 + 1.0;
    float _614 = _606 * 0.15915493667125701904296875;
    float _616 = fma(_592, _412, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _618 = _580 * _596;
    float _620 = abs(_608);
    bool _622 = _620 > 0.99989998340606689453125;
    float _624 = fma(_372, _412, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _626 = _614 * 6.283185482025146484375;
    float _628 = cos(_626);
    float _630 = _584 * _596;
    float _632 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].y, _604);
    float _634 = fma(_600, 2.0, 2.0);
    float _636 = precise::clamp(_634, 0.0, 1.0);
    float _638 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].x, _586);
    float _640 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].z, _594);
    float _642 = _618 * 0.15915493667125701904296875;
    float _644 = _614 * 6.283185482025146484375;
    float _646 = sin(_644);
    float _648 = _630 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _650 = fma(_636, 0.949999988079071044921875, -1.0);
    float _652 = fma(_484, _566, _638);
    float _654 = fma(_492, _566, _632);
    float _656 = fma(_500, _566, _640);
    if (_622)
    {
        float _658 = _280 + _268;
        _282 = _658;
    }
    float _660 = _282;
    if (_622)
    {
        float _662 = _286 + _272;
        _288 = _662;
    }
    float _664 = _288;
    if (_622)
    {
        float _666 = _292 + _276;
        _296 = _666;
    }
    float _668 = _296;
    float _670 = _642 * 6.283185482025146484375;
    float _672 = cos(_670);
    float _674 = in.m_61.x;
    float _676 = in.m_61.y;
    float _678 = in.m_61.z;
    float _680 = _648 * 0.15915493667125701904296875;
    float _682 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[192].z, 1.0);
    float _684 = fma(_624, _552, _656);
    float _686 = -_664;
    float _688 = _576 * _686;
    float _690 = -_660;
    float _692 = _582 * _690;
    float _694 = fma(_616, _552, _652);
    float _696 = _642 * 6.283185482025146484375;
    float _698 = sin(_696);
    float _700 = fma(_568, _552, _654);
    float _702 = -_668;
    float _704 = _564 * _702;
    float _706 = -_668;
    float _708 = -_692;
    float _710 = fma(_576, _706, _708);
    float _712 = -_660;
    float _714 = -_688;
    float _716 = fma(_564, _712, _714);
    float _718 = _628 * _396;
    float _720 = in.m_63.x;
    float _722 = _408 * 0.15915493667125701904296875;
    float _724 = _680 * 6.283185482025146484375;
    float _726 = sin(_724);
    float _728 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[146].x, _694);
    float _730 = -_664;
    float _732 = -_704;
    float _734 = fma(_582, _730, _732);
    float _736 = fma(_646, _394, _718);
    float _738 = _646 * _396;
    float _740 = _672 * _392;
    float _742 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[146].y, _700);
    float _744 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[146].z, _684);
    float _746 = _680 * 6.283185482025146484375;
    float _748 = cos(_746);
    float _750 = -_738;
    float _752 = fma(_628, _394, _750);
    float _754 = fma(_736, _698, _740);
    float _756 = _728 * _674;
    float _758 = _698 * _392;
    float _760 = _742 * _676;
    float _762 = _744 * _678;
    float _764 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _766 = _752 * _726;
    float _768 = _710 * _710;
    float _770 = _722 * 6.283185482025146484375;
    float _772 = sin(_770);
    float _774 = -_758;
    float _776 = fma(_736, _672, _774);
    float _778 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _780 = fma(_734, _734, _768);
    float _782 = _762 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _784 = -_776;
    float _786 = _784 + _396;
    float _788 = _752 * _748;
    float _790 = fma(_716, _716, _780);
    float _792 = -_766;
    float _794 = fma(_754, _748, _792);
    float _796 = fma(_786, _720, _776);
    float _798 = fma(_754, _726, _788);
    float _800 = _154 * _328;
    float _802 = -_794;
    float _804 = _802 + _392;
    float _806 = rsqrt(_790);
    float _808 = -_798;
    float _810 = _808 + _394;
    float _812 = in.m_53.w;
    float _814 = fma(_804, _720, _794);
    float _816 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[191].w, _796);
    float _818 = fma(_810, _720, _798);
    float _820 = fma(_164, _326, _800);
    float _822 = -_392;
    float _824 = _814 + _822;
    float _826 = -_396;
    float _828 = _816 + _826;
    float _830 = -_394;
    float _832 = _818 + _830;
    float _834 = fma(_148, _330, _820);
    float _836 = fma(_682, _824, _392);
    float _838 = fma(_682, _832, _394);
    float _840 = fma(_682, _828, _396);
    float _842 = _710 * _806;
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _838);
    float _846 = in.m_51.w;
    float _848 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _836);
    float _850 = _734 * _806;
    float _852 = _778 * _844;
    float _854 = _716 * _806;
    float _856 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _840);
    float _858 = _764 * _848;
    float _860 = _576 * _842;
    float _862 = _852 * _582;
    float _864 = _782 * _856;
    float _866 = _564 * _854;
    float _868 = -_860;
    float _870 = fma(_564, _850, _868);
    float _872 = _852 * _576;
    float _874 = fma(_858, _854, _862);
    float _876 = _416 + _812;
    float _878 = -_866;
    float _880 = fma(_582, _842, _878);
    float _882 = fma(_858, _850, _872);
    float _884 = fma(_864, _870, _874);
    float _886 = _582 * _850;
    float _888 = _852 * _564;
    float _890 = fma(_864, _880, _882);
    float _892 = _876 + _884;
    float _894 = -_886;
    float _896 = fma(_576, _854, _894);
    float _898 = fma(_858, _842, _888);
    float _900 = _414 + _846;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _904 = _892 + _902;
    float _906 = fma(_864, _896, _898);
    float _908 = _900 + _890;
    float _910 = _904 * _904;
    float _912 = in.m_49.w;
    float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _916 = _908 + _914;
    float _918 = fma(_916, _916, _910);
    float _920 = sqrt(_918);
    float _922 = _834 + _912;
    bool _924 = _920 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _926 = _922 + _906;
    float _928 = _906;
    float _930 = _842;
    float _932 = _854;
    if (!_924)
    {
        _198 = _908;
    }
    float _934 = _198;
    float _936 = _934;
    if (!_924)
    {
        _508 = _892;
    }
    float _938 = _508;
    float _940 = _938;
    if (!_924)
    {
        _928 = _926;
    }
    float _942 = _928;
    bool _944 = !_924;
    float _946 = _942;
    if (!_944)
    {
        float _948 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _952 = _920 + _950;
        float _954 = rsqrt(_918);
        float _956 = _952 * _948;
        float _958 = _926 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _960 = _956 * 0.15915493667125701904296875;
        float _962 = _960 * 6.283185482025146484375;
        float _964 = cos(_962);
        float _966 = _960 * 6.283185482025146484375;
        float _968 = sin(_966);
        float _970 = _964 + (-1.0);
        float _972 = _970 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = fma(_968, _958, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _976 = fma(_926, _964, _972);
        float _978 = _954 * _974;
        float _980 = fma(_916, _978, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _982 = fma(_904, _978, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _946 = _976;
        _936 = _980;
        _940 = _982;
    }
    float _984 = _946;
    float _986 = _936;
    float _988 = _940;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _992 = _984 + _990;
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _996 = _986 + _994;
    float _998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1000 = _988 + _998;
    float _1002 = _992 * _992;
    float _1004 = fma(_996, _996, _1002);
    float _1006 = fma(_1000, _1000, _1004);
    float _1008 = rsqrt(_1006);
    float _1010 = _1008 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1012 = _996 * _1010;
    float _1014 = _1000 * _1010;
    float _1016 = _1012 * _1012;
    float _1018 = _1014 * _1014;
    float _1020 = _1016 + _1018;
    float _1022 = sqrt(_1020);
    bool _1024 = _1022 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1028 = _1022 + _1026;
    float _1030 = _1008;
    float _1032 = _1028;
    float _1034 = _1010;
    float _1036 = _1012;
    if (_1024)
    {
        float _1038 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1030 = _1038;
    }
    float _1040 = _1030;
    if (_1024)
    {
        float _1042 = rsqrt(_1020);
        _930 = _1042;
    }
    float _1044 = _930;
    float _1046 = _1044;
    if (_1024)
    {
        float _1048 = _1028 * _1040;
        _1032 = _1048;
    }
    float _1050 = _1032;
    if (_1024)
    {
        float _1052 = _1050 * 0.15915493667125701904296875;
        _932 = _1052;
    }
    float _1054 = _932;
    float _1056 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1058 = _858;
    if (_1024)
    {
        float _1060 = _1054 * 6.283185482025146484375;
        float _1062 = sin(_1060);
        _1058 = _1062;
    }
    float _1064 = _1058;
    float _1066 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1068 = precise::max(0.0, _1066);
    float _1070 = _1000;
    float _1072 = _1068;
    float _1074 = _1066;
    if (_1024)
    {
        float _1076 = _1054 * 6.283185482025146484375;
        float _1078 = cos(_1076);
        _1070 = _1078;
    }
    float _1080 = _1070;
    float _1082 = -_1010;
    float _1084 = -_1068;
    float _1086 = fma(_992, _1082, _1084);
    float _1088 = _1086;
    if (_1024)
    {
        float _1090 = _1086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1072 = _1090;
    }
    float _1092 = _1072;
    float _1094 = sqrt(_1006);
    float _1096 = _1064;
    float _1098 = _1092;
    if (_1024)
    {
        float _1100 = fma(_1064, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1096 = _1100;
    }
    float _1102 = _1096;
    float _1104 = _1102;
    if (_1024)
    {
        float _1106 = _1080 + (-1.0);
        _1074 = _1106;
    }
    float _1108 = _1074;
    float _1110 = _1108;
    if (_1024)
    {
        float _1112 = _1044 * _1102;
        _1034 = _1112;
    }
    float _1114 = _1034;
    if (!_1024)
    {
        _1046 = _1086;
    }
    float _1116 = _1046;
    float _1118 = _1116;
    if (_1024)
    {
        float _1120 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1098 = _1120;
    }
    float _1122 = _1098;
    if (_1024)
    {
        float _1124 = _1012 * _1114;
        _1036 = _1124;
    }
    float _1126 = _1036;
    if (!_1024)
    {
        _1104 = _1014;
    }
    float _1128 = _1104;
    float _1130 = _1128;
    if (_1024)
    {
        float _1132 = _1014 * _1114;
        _1130 = _1132;
    }
    float _1134 = _1130;
    if (!_1024)
    {
        _1110 = _1016;
    }
    float _1136 = _1110;
    float _1138 = _1136;
    if (_1024)
    {
        float _1140 = fma(_1086, _1080, _1122);
        _1118 = _1140;
    }
    float _1142 = _1118;
    if (_1024)
    {
        float _1144 = _1126 * _1126;
        _1138 = _1144;
    }
    float _1146 = _1138;
    if (!_1024)
    {
        _1088 = _1018;
    }
    float _1148 = _1088;
    float _1150 = _1148;
    if (_1024)
    {
        float _1152 = _1134 * _1134;
        _1150 = _1152;
    }
    float _1154 = _1150;
    float _1156 = fma(_1142, _1142, _1146);
    float _1158 = _984 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1160 = _984 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1162 = _1156 + _1154;
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1166 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1164);
    float _1168 = precise::clamp(_1166, 0.0, 1.0);
    float _1170 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1158);
    float _1172 = _984 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1174 = rsqrt(_1162);
    float _1176 = -_1168;
    float _1178 = _1176 + 1.0;
    float _1180 = _984 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1182 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1170);
    float _1184 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1172);
    float _1186 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1160);
    float _1188 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1180);
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1192 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1184);
    float _1194 = abs(_1178);
    float _1196 = log2(_1194);
    float _1198 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1188);
    float _1200 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1202 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1204 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1206 = -_1200;
    float _1208 = fma(_1206, _1056, 1.0);
    float _1210 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1212 = _1174 * _1126;
    float _1214 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1186);
    float _1216 = _1174 * _1134;
    float _1218 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1210);
    float _1220 = _1174 * _1142;
    float _1222 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1224 = _1214 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1226 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1218);
    float _1228 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1230 = -_1222;
    float _1232 = fma(_1220, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1230);
    float _1234 = log2(_1208);
    float _1236 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1226);
    float _1238 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1240 = -_1216;
    float _1242 = fma(_1240, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1232);
    float _1244 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1246 = _1220 + 1.0;
    float _1248 = fma(_1242, -0.5, 0.5);
    float _1250 = exp2(_1228);
    float _1252 = fma(_1242, 0.5, 0.5);
    float _1254 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1244);
    float _1256 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1238);
    float _1258 = fma(_1252, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1260 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1254);
    float _1262 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1256);
    float _1264 = 1.0 / _1236;
    float _1266 = _1234 * 0.693147182464599609375;
    float _1268 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1260);
    float _1270 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1262);
    float _1272 = fma(_1252, _1258, -0.212114393711090087890625);
    float _1274 = sqrt(_1248);
    float _1276 = -_1220;
    float _1278 = fma(_1250, _1246, _1276);
    float _1280 = fma(_1252, _1272, 1.570728778839111328125);
    float _1282 = fma(_1278, 0.5, 0.5);
    float _1284 = _1268 * _1264;
    float _1286 = _1270 * _1264;
    float _1288 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1290 = fma(_1284, 0.5, 0.5);
    float _1292 = fma(_1286, -0.5, 0.5);
    float _1294 = _1274 * 0.636619746685028076171875;
    float3 _3293 = float3(_1290, _1292, _1288);
    float _1296 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3293, float3(0.0), isnan(_3293)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3293, float3(0.0), isnan(_3293)), level(0.0)).x;
    float3 _3304 = float3(_1290, _1292, _1288);
    float4 _1299 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3304, float3(0.0), isnan(_3304)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3304, float3(0.0), isnan(_3304)), level(0.0)).xyzw;
    float _1301 = _1299.x;
    float _1303 = _1299.y;
    float _1305 = _1299.z;
    float _1307 = _1299.w;
    float _1309 = -_1280;
    float _1311 = fma(_1294, _1309, 1.0);
    float2 _3326 = float2(_1311, _1282);
    float3 _1315 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3326, float2(0.0), isnan(_3326)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3326, float2(0.0), isnan(_3326)), level(0.0)).xyz;
    float _1317 = _1315.x;
    float _1319 = _1315.y;
    float _1321 = _1315.z;
    float _1323 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1325 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1327 = in.m_63.w;
    float _1329 = exp2(_1323);
    float _1331 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1325);
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1335 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1331);
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1339 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1335);
    float _1341 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1345 = _1339 + _1236;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1349 = -_1329;
    float _1351 = _1349 + 1.0;
    float _1353 = _1345 * 0.5;
    float _1355 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1357 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1359 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1268;
    out.gl_Position.y = _1270;
    out.gl_Position.z = _1339;
    out.gl_Position.w = _1236;
    out.m_65.w = _1327;
    out.m_67.x = _1341;
    out.m_67.y = _1355;
    out.m_67.z = _1357;
    out.m_67.w = _1347;
    out.m_69.z = _1353;
    out.m_69.w = _1236;
    out.m_45.x = 1.0;
    float _1361 = _1359 * _1296;
    float _1363 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1365 = _1307 * _1361;
    out.m_71.w = _1363;
    float _1367 = fma(_1317, _1365, _1301);
    float _1369 = _1321 * _1361;
    float _1371 = -_1359;
    float _1373 = _1371 + 1.0;
    float _1375 = fma(_1319, _1365, _1303);
    float _1377 = fma(_1307, _1369, _1305);
    float _1379 = _1307 * _1373;
    out.m_73.x = _1367;
    out.m_73.y = _1375;
    out.m_73.z = _1377;
    out.m_73.w = _1379;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _316 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1436 = as_type<float>(_108);
        out.gl_Position.z = _1436;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
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
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    float _146 = as_type<float>(_144);
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1507 = as_type<float>(_144);
        out.gl_Position.z = _1507;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_49.z;
    bool _150 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _152 = in.m_51.z;
    float _154 = in.m_49.y;
    float _156 = in.m_53.z;
    float _158 = in.m_51.y;
    float _160 = in.m_53.y;
    float _162 = _148 * _148;
    float _164 = in.m_49.x;
    float _166 = fma(_152, _152, _162);
    float _168 = in.m_51.x;
    float _170 = _154 * _154;
    float _172 = in.m_53.x;
    float _174 = fma(_156, _156, _166);
    float _176 = fma(_158, _158, _170);
    float _178 = sqrt(_174);
    float _180 = fma(_160, _160, _176);
    float _182 = in.m_55.x;
    float _184 = in.m_55.y;
    float _186 = in.m_55.z;
    float _188 = sqrt(_180);
    bool _190 = _178 > 0.0;
    bool _192 = _188 > 0.0;
    float _194 = _188;
    float _196 = _174;
    float _198 = _164;
    if (_190)
    {
        float _200 = rsqrt(_174);
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _154 * _184;
    float _206 = _158 * _184;
    float _208 = _160 * _184;
    float _210 = _206;
    float _212 = _204;
    if (!_190)
    {
        _146 = 0.0;
    }
    float _214 = _146;
    float _216 = fma(_182, _164, _204);
    float _218 = fma(_182, _168, _206);
    float _220 = fma(_182, _172, _208);
    float _222 = _180;
    float _224 = _214;
    if (_192)
    {
        float _226 = rsqrt(_180);
        _222 = _226;
    }
    float _228 = _222;
    if (!_190)
    {
        _196 = 0.0;
        _210 = 0.0;
    }
    float _230 = _196;
    float _232 = _210;
    float _234 = _230;
    float _236 = _232;
    if (!_192)
    {
        _212 = 0.0;
    }
    float _238 = _212;
    float _240 = fma(_148, _186, _216);
    float _242 = 0.0;
    float _244 = _238;
    if (!_192)
    {
        _242 = 0.0;
    }
    float _246 = _242;
    float _248 = fma(_152, _186, _218);
    float _250 = 0.0;
    float _252 = _246;
    if (!_192)
    {
        _250 = 0.0;
    }
    float _254 = _250;
    float _256 = fma(_156, _186, _220);
    float _258 = _202;
    float _260 = _254;
    if (_190)
    {
        float _262 = _202 * 0.001000000047497451305389404296875;
        _258 = _262;
    }
    float _264 = _258;
    if (_190)
    {
        float _266 = _152 * _264;
        _234 = _266;
    }
    float _268 = _234;
    if (_190)
    {
        float _270 = _148 * _264;
        _224 = _270;
    }
    float _272 = _224;
    if (_190)
    {
        float _274 = _156 * _264;
        _236 = _274;
    }
    float _276 = _236;
    if (_192)
    {
        float _278 = _228 * _158;
        _244 = _278;
    }
    float _280 = _244;
    float _282 = _280;
    if (_192)
    {
        float _284 = _228 * _154;
        _252 = _284;
    }
    float _286 = _252;
    float _288 = _286;
    if (_192)
    {
        float _290 = _228 * _160;
        _260 = _290;
    }
    float _292 = _260;
    bool _294 = !_150;
    float _296 = _292;
    float _314;
    if (!_294)
    {
        float _298 = in.m_57.x;
        float _300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _302 = _298 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _306 = _304 * _300;
        float _308 = floor(_306);
        float _310 = -_308;
        float _312 = _306 + _310;
        _314 = _312;
        _316 = true;
    }
    else
    {
        float _318 = float(_92);
        float _320 = 1.0 / _318;
        float _322 = _126 * _320;
        _314 = _322;
    }
    _316 = false;
    float _324 = _314;
    float _326 = in.m_42.x;
    float _328 = in.m_42.y;
    float _330 = in.m_42.z;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = _324 + _332;
    float _336 = in.m_57.x;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _346 = 1.0 / _340;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _348;
    bool _352 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _354 = isnan(_324);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _364;
    float _368 = 1.0 / _344;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _370;
    float _374 = _158 * _328;
    float _376 = _160 * _328;
    float _378 = 1.0 / _350;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _382 = _324 + _380;
    float _384 = fma(_168, _326, _374);
    float _386 = fma(_172, _326, _376);
    float _388 = fma(_336, 0.2000000476837158203125, 0.89999997615814208984375);
    float _390 = _336 * 100.0;
    float _392 = in.m_59.x;
    float _394 = in.m_59.y;
    float _396 = in.m_59.z;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = _324 + _398;
    float _402 = _388 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _404 = _382 * _368;
    float _406 = fma(_126, 0.00999999977648258209228515625, _390);
    float _408 = fma(_126, _402, _390);
    float _410 = _400 * _346;
    float _412 = _334 * _378;
    float _414 = fma(_152, _330, _384);
    float _416 = fma(_156, _330, _386);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _426;
    float _430 = _240 * _240;
    float _432 = fma(_420, _410, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _434 = fma(_424, _410, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _436 = fma(_428, _410, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _438 = fma(_248, _248, _430);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _452 = _392 > 0.0;
    float _454 = fma(_256, _256, _438);
    bool _456 = _392 >= 0.0;
    bool _458 = isnan(_392);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    float _466 = abs(_392);
    float _468 = -_466;
    float _470 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[191].y, _408);
    bool _472 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _474 = isnan(_324);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = fma(_442, _404, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _486 = _464 ? 0 : 1;
    float _488 = _470 * 0.15915493667125701904296875;
    float _490 = rsqrt(_454);
    float _492 = fma(_446, _404, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _494 = ~_486;
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    float _500 = fma(_450, _404, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _502 = -_482;
    float _504 = _502 + 1.0;
    int _506 = _498;
    float _508 = _328;
    if (!_452)
    {
        int _510 = ~_486;
        int _512 = _510 + 1;
        _506 = _512;
    }
    int _514 = _506;
    float _516 = _406 * 0.15915493667125701904296875;
    bool _518 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _520 = isnan(_324);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _488 * 6.283185482025146484375;
    float _532 = cos(_530);
    bool _534 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _536 = isnan(_324);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = abs(_392);
    float _548 = -_546;
    float _550 = _548 + 1.0;
    float _552 = _528 * _504;
    float _554 = -_528;
    float _556 = _554 + 1.0;
    float _558 = -_544;
    float _560 = _558 + 1.0;
    float _562 = float(_514);
    float _564 = _240 * _490;
    float _566 = _544 * _556;
    float _568 = fma(_366, _412, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _570 = -_550;
    float _572 = fma(_570, _550, 1.0);
    float _574 = _362 * _560;
    float _576 = _248 * _490;
    float _578 = _488 * 6.283185482025146484375;
    float _580 = sin(_578);
    float _582 = _256 * _490;
    float _584 = _532 * _572;
    float _586 = _432 * _574;
    float _588 = _564 * _286;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _590;
    float _594 = _436 * _574;
    float _596 = _562 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _598 = _516 * 6.283185482025146484375;
    float _600 = sin(_598);
    float _602 = fma(_576, _280, _588);
    float _604 = _434 * _574;
    float _606 = _584 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _608 = fma(_582, _292, _602);
    float _610 = -_362;
    float _612 = _610 + 1.0;
    float _614 = _606 * 0.15915493667125701904296875;
    float _616 = fma(_592, _412, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _618 = _580 * _596;
    float _620 = abs(_608);
    bool _622 = _620 > 0.99989998340606689453125;
    float _624 = fma(_372, _412, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _626 = _614 * 6.283185482025146484375;
    float _628 = cos(_626);
    float _630 = _584 * _596;
    float _632 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].y, _604);
    float _634 = fma(_600, 2.0, 2.0);
    float _636 = precise::clamp(_634, 0.0, 1.0);
    float _638 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].x, _586);
    float _640 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].z, _594);
    float _642 = _618 * 0.15915493667125701904296875;
    float _644 = _614 * 6.283185482025146484375;
    float _646 = sin(_644);
    float _648 = _630 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _650 = fma(_636, 0.949999988079071044921875, -1.0);
    float _652 = fma(_484, _566, _638);
    float _654 = fma(_492, _566, _632);
    float _656 = fma(_500, _566, _640);
    if (_622)
    {
        float _658 = _280 + _268;
        _282 = _658;
    }
    float _660 = _282;
    if (_622)
    {
        float _662 = _286 + _272;
        _288 = _662;
    }
    float _664 = _288;
    if (_622)
    {
        float _666 = _292 + _276;
        _296 = _666;
    }
    float _668 = _296;
    float _670 = _642 * 6.283185482025146484375;
    float _672 = cos(_670);
    float _674 = in.m_61.x;
    float _676 = in.m_61.y;
    float _678 = in.m_61.z;
    float _680 = _648 * 0.15915493667125701904296875;
    float _682 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[192].z, 1.0);
    float _684 = fma(_624, _552, _656);
    float _686 = -_664;
    float _688 = _576 * _686;
    float _690 = -_660;
    float _692 = _582 * _690;
    float _694 = fma(_616, _552, _652);
    float _696 = _642 * 6.283185482025146484375;
    float _698 = sin(_696);
    float _700 = fma(_568, _552, _654);
    float _702 = -_668;
    float _704 = _564 * _702;
    float _706 = -_668;
    float _708 = -_692;
    float _710 = fma(_576, _706, _708);
    float _712 = -_660;
    float _714 = -_688;
    float _716 = fma(_564, _712, _714);
    float _718 = _628 * _396;
    float _720 = in.m_63.x;
    float _722 = _408 * 0.15915493667125701904296875;
    float _724 = _680 * 6.283185482025146484375;
    float _726 = sin(_724);
    float _728 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[146].x, _694);
    float _730 = -_664;
    float _732 = -_704;
    float _734 = fma(_582, _730, _732);
    float _736 = fma(_646, _394, _718);
    float _738 = _646 * _396;
    float _740 = _672 * _392;
    float _742 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[146].y, _700);
    float _744 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[146].z, _684);
    float _746 = _680 * 6.283185482025146484375;
    float _748 = cos(_746);
    float _750 = -_738;
    float _752 = fma(_628, _394, _750);
    float _754 = fma(_736, _698, _740);
    float _756 = _728 * _674;
    float _758 = _698 * _392;
    float _760 = _742 * _676;
    float _762 = _744 * _678;
    float _764 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _766 = _752 * _726;
    float _768 = _710 * _710;
    float _770 = _722 * 6.283185482025146484375;
    float _772 = sin(_770);
    float _774 = -_758;
    float _776 = fma(_736, _672, _774);
    float _778 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _780 = fma(_734, _734, _768);
    float _782 = _762 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _784 = -_776;
    float _786 = _784 + _396;
    float _788 = _752 * _748;
    float _790 = fma(_716, _716, _780);
    float _792 = -_766;
    float _794 = fma(_754, _748, _792);
    float _796 = fma(_786, _720, _776);
    float _798 = fma(_754, _726, _788);
    float _800 = _154 * _328;
    float _802 = -_794;
    float _804 = _802 + _392;
    float _806 = rsqrt(_790);
    float _808 = -_798;
    float _810 = _808 + _394;
    float _812 = in.m_53.w;
    float _814 = fma(_804, _720, _794);
    float _816 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[191].w, _796);
    float _818 = fma(_810, _720, _798);
    float _820 = fma(_164, _326, _800);
    float _822 = -_392;
    float _824 = _814 + _822;
    float _826 = -_396;
    float _828 = _816 + _826;
    float _830 = -_394;
    float _832 = _818 + _830;
    float _834 = fma(_148, _330, _820);
    float _836 = fma(_682, _824, _392);
    float _838 = fma(_682, _832, _394);
    float _840 = fma(_682, _828, _396);
    float _842 = _710 * _806;
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _838);
    float _846 = in.m_51.w;
    float _848 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _836);
    float _850 = _734 * _806;
    float _852 = _778 * _844;
    float _854 = _716 * _806;
    float _856 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _840);
    float _858 = _764 * _848;
    float _860 = _576 * _842;
    float _862 = _852 * _582;
    float _864 = _782 * _856;
    float _866 = _564 * _854;
    float _868 = -_860;
    float _870 = fma(_564, _850, _868);
    float _872 = _852 * _576;
    float _874 = fma(_858, _854, _862);
    float _876 = _416 + _812;
    float _878 = -_866;
    float _880 = fma(_582, _842, _878);
    float _882 = fma(_858, _850, _872);
    float _884 = fma(_864, _870, _874);
    float _886 = _582 * _850;
    float _888 = _852 * _564;
    float _890 = fma(_864, _880, _882);
    float _892 = _876 + _884;
    float _894 = -_886;
    float _896 = fma(_576, _854, _894);
    float _898 = fma(_858, _842, _888);
    float _900 = _414 + _846;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _904 = _892 + _902;
    float _906 = fma(_864, _896, _898);
    float _908 = _900 + _890;
    float _910 = _904 * _904;
    float _912 = in.m_49.w;
    float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _916 = _908 + _914;
    float _918 = fma(_916, _916, _910);
    float _920 = sqrt(_918);
    float _922 = _834 + _912;
    bool _924 = _920 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _926 = _922 + _906;
    float _928 = _906;
    float _930 = _842;
    float _932 = _854;
    if (!_924)
    {
        _198 = _908;
    }
    float _934 = _198;
    float _936 = _934;
    if (!_924)
    {
        _508 = _892;
    }
    float _938 = _508;
    float _940 = _938;
    if (!_924)
    {
        _928 = _926;
    }
    float _942 = _928;
    bool _944 = !_924;
    float _946 = _942;
    if (!_944)
    {
        float _948 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _952 = _920 + _950;
        float _954 = rsqrt(_918);
        float _956 = _952 * _948;
        float _958 = _926 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _960 = _956 * 0.15915493667125701904296875;
        float _962 = _960 * 6.283185482025146484375;
        float _964 = cos(_962);
        float _966 = _960 * 6.283185482025146484375;
        float _968 = sin(_966);
        float _970 = _964 + (-1.0);
        float _972 = _970 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = fma(_968, _958, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _976 = fma(_926, _964, _972);
        float _978 = _954 * _974;
        float _980 = fma(_916, _978, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _982 = fma(_904, _978, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _946 = _976;
        _936 = _980;
        _940 = _982;
    }
    float _984 = _946;
    float _986 = _936;
    float _988 = _940;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _992 = _984 + _990;
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _996 = _986 + _994;
    float _998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1000 = _988 + _998;
    float _1002 = _992 * _992;
    float _1004 = fma(_996, _996, _1002);
    float _1006 = fma(_1000, _1000, _1004);
    float _1008 = rsqrt(_1006);
    float _1010 = _1008 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1012 = _996 * _1010;
    float _1014 = _1000 * _1010;
    float _1016 = _1012 * _1012;
    float _1018 = _1014 * _1014;
    float _1020 = _1016 + _1018;
    float _1022 = sqrt(_1020);
    bool _1024 = _1022 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1028 = _1022 + _1026;
    float _1030 = _1008;
    float _1032 = _1028;
    float _1034 = _1010;
    float _1036 = _1012;
    if (_1024)
    {
        float _1038 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1030 = _1038;
    }
    float _1040 = _1030;
    if (_1024)
    {
        float _1042 = rsqrt(_1020);
        _930 = _1042;
    }
    float _1044 = _930;
    float _1046 = _1044;
    if (_1024)
    {
        float _1048 = _1028 * _1040;
        _1032 = _1048;
    }
    float _1050 = _1032;
    if (_1024)
    {
        float _1052 = _1050 * 0.15915493667125701904296875;
        _932 = _1052;
    }
    float _1054 = _932;
    float _1056 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1058 = _858;
    if (_1024)
    {
        float _1060 = _1054 * 6.283185482025146484375;
        float _1062 = sin(_1060);
        _1058 = _1062;
    }
    float _1064 = _1058;
    float _1066 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1068 = precise::max(0.0, _1066);
    float _1070 = _1000;
    float _1072 = _1068;
    float _1074 = _1066;
    if (_1024)
    {
        float _1076 = _1054 * 6.283185482025146484375;
        float _1078 = cos(_1076);
        _1070 = _1078;
    }
    float _1080 = _1070;
    float _1082 = -_1010;
    float _1084 = -_1068;
    float _1086 = fma(_992, _1082, _1084);
    float _1088 = _1086;
    if (_1024)
    {
        float _1090 = _1086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1072 = _1090;
    }
    float _1092 = _1072;
    float _1094 = sqrt(_1006);
    float _1096 = _1064;
    float _1098 = _1092;
    if (_1024)
    {
        float _1100 = fma(_1064, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1096 = _1100;
    }
    float _1102 = _1096;
    float _1104 = _1102;
    if (_1024)
    {
        float _1106 = _1080 + (-1.0);
        _1074 = _1106;
    }
    float _1108 = _1074;
    float _1110 = _1108;
    if (_1024)
    {
        float _1112 = _1044 * _1102;
        _1034 = _1112;
    }
    float _1114 = _1034;
    if (!_1024)
    {
        _1046 = _1086;
    }
    float _1116 = _1046;
    float _1118 = _1116;
    if (_1024)
    {
        float _1120 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1098 = _1120;
    }
    float _1122 = _1098;
    if (_1024)
    {
        float _1124 = _1012 * _1114;
        _1036 = _1124;
    }
    float _1126 = _1036;
    if (!_1024)
    {
        _1104 = _1014;
    }
    float _1128 = _1104;
    float _1130 = _1128;
    if (_1024)
    {
        float _1132 = _1014 * _1114;
        _1130 = _1132;
    }
    float _1134 = _1130;
    if (!_1024)
    {
        _1110 = _1016;
    }
    float _1136 = _1110;
    float _1138 = _1136;
    if (_1024)
    {
        float _1140 = fma(_1086, _1080, _1122);
        _1118 = _1140;
    }
    float _1142 = _1118;
    if (_1024)
    {
        float _1144 = _1126 * _1126;
        _1138 = _1144;
    }
    float _1146 = _1138;
    if (!_1024)
    {
        _1088 = _1018;
    }
    float _1148 = _1088;
    float _1150 = _1148;
    if (_1024)
    {
        float _1152 = _1134 * _1134;
        _1150 = _1152;
    }
    float _1154 = _1150;
    float _1156 = fma(_1142, _1142, _1146);
    float _1158 = _984 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1160 = _984 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1162 = _1156 + _1154;
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1166 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1164);
    float _1168 = precise::clamp(_1166, 0.0, 1.0);
    float _1170 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1158);
    float _1172 = _984 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1174 = rsqrt(_1162);
    float _1176 = -_1168;
    float _1178 = _1176 + 1.0;
    float _1180 = _984 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1182 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1170);
    float _1184 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1172);
    float _1186 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1160);
    float _1188 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1180);
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1192 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1184);
    float _1194 = abs(_1178);
    float _1196 = log2(_1194);
    float _1198 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1188);
    float _1200 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1202 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1204 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1206 = -_1200;
    float _1208 = fma(_1206, _1056, 1.0);
    float _1210 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1212 = _1174 * _1126;
    float _1214 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1186);
    float _1216 = _1174 * _1134;
    float _1218 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1210);
    float _1220 = _1174 * _1142;
    float _1222 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1224 = _1214 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1226 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1218);
    float _1228 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1230 = -_1222;
    float _1232 = fma(_1220, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1230);
    float _1234 = log2(_1208);
    float _1236 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1226);
    float _1238 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1240 = -_1216;
    float _1242 = fma(_1240, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1232);
    float _1244 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1246 = _1220 + 1.0;
    float _1248 = fma(_1242, -0.5, 0.5);
    float _1250 = exp2(_1228);
    float _1252 = fma(_1242, 0.5, 0.5);
    float _1254 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1244);
    float _1256 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1238);
    float _1258 = fma(_1252, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1260 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1254);
    float _1262 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1256);
    float _1264 = 1.0 / _1236;
    float _1266 = _1234 * 0.693147182464599609375;
    float _1268 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1260);
    float _1270 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1262);
    float _1272 = fma(_1252, _1258, -0.212114393711090087890625);
    float _1274 = sqrt(_1248);
    float _1276 = -_1220;
    float _1278 = fma(_1250, _1246, _1276);
    float _1280 = fma(_1252, _1272, 1.570728778839111328125);
    float _1282 = fma(_1278, 0.5, 0.5);
    float _1284 = _1268 * _1264;
    float _1286 = _1270 * _1264;
    float _1288 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1290 = fma(_1284, 0.5, 0.5);
    float _1292 = fma(_1286, -0.5, 0.5);
    float _1294 = _1274 * 0.636619746685028076171875;
    float3 _3293 = float3(_1290, _1292, _1288);
    float _1296 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3293, float3(0.0), isnan(_3293)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3293, float3(0.0), isnan(_3293)), level(0.0)).x;
    float3 _3304 = float3(_1290, _1292, _1288);
    float4 _1299 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3304, float3(0.0), isnan(_3304)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3304, float3(0.0), isnan(_3304)), level(0.0)).xyzw;
    float _1301 = _1299.x;
    float _1303 = _1299.y;
    float _1305 = _1299.z;
    float _1307 = _1299.w;
    float _1309 = -_1280;
    float _1311 = fma(_1294, _1309, 1.0);
    float2 _3326 = float2(_1311, _1282);
    float3 _1315 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3326, float2(0.0), isnan(_3326)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3326, float2(0.0), isnan(_3326)), level(0.0)).xyz;
    float _1317 = _1315.x;
    float _1319 = _1315.y;
    float _1321 = _1315.z;
    float _1323 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1325 = _1202 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1327 = in.m_63.w;
    float _1329 = exp2(_1323);
    float _1331 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1325);
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1335 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1331);
    float _1337 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1339 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1335);
    float _1341 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1345 = _1339 + _1236;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1349 = -_1329;
    float _1351 = _1349 + 1.0;
    float _1353 = _1345 * 0.5;
    float _1355 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1357 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1359 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1268;
    out.gl_Position.y = _1270;
    out.gl_Position.z = _1339;
    out.gl_Position.w = _1236;
    out.m_65.w = _1327;
    out.m_67.x = _1341;
    out.m_67.y = _1355;
    out.m_67.z = _1357;
    out.m_67.w = _1347;
    out.m_69.z = _1353;
    out.m_69.w = _1236;
    out.m_45.x = 1.0;
    float _1361 = _1359 * _1296;
    float _1363 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1365 = _1307 * _1361;
    out.m_71.w = _1363;
    float _1367 = fma(_1317, _1365, _1301);
    float _1369 = _1321 * _1361;
    float _1371 = -_1359;
    float _1373 = _1371 + 1.0;
    float _1375 = fma(_1319, _1365, _1303);
    float _1377 = fma(_1307, _1369, _1305);
    float _1379 = _1307 * _1373;
    out.m_73.x = _1367;
    out.m_73.y = _1375;
    out.m_73.z = _1377;
    out.m_73.w = _1379;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

