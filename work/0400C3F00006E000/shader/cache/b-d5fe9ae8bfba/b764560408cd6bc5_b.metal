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
    texture2d<float> vp_t_tcb_1C [[id(7)]];
    sampler vp_t_tcb_1CSmplr [[id(8)]];
    sampler vp_t_tcb_32Smplr_w [[id(9)]];
    sampler vp_t_tcb_1CSmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_63 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_69 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_49 [[attribute(1)]];
    float4 m_47 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_53 [[attribute(5)]];
    float4 m_40 [[attribute(6)]];
    float4 m_45 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
    float4 m_59 [[attribute(11)]];
    float4 m_61 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _314 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_40.w;
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
        out.m_43.x = 0.0;
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
        float _1447 = as_type<float>(_106);
        out.gl_Position.z = _1447;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_45.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_120)
    {
        float _126 = float(_90);
        _100 = _126;
    }
    float _128 = _100;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_43.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    float _144 = as_type<float>(_142);
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1518 = as_type<float>(_142);
        out.gl_Position.z = _1518;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_47.z;
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _150 = in.m_49.z;
    float _152 = in.m_47.y;
    float _154 = in.m_51.z;
    float _156 = in.m_49.y;
    float _158 = in.m_51.y;
    float _160 = _146 * _146;
    float _162 = in.m_47.x;
    float _164 = fma(_150, _150, _160);
    float _166 = in.m_49.x;
    float _168 = _152 * _152;
    float _170 = in.m_51.x;
    float _172 = fma(_154, _154, _164);
    float _174 = fma(_156, _156, _168);
    float _176 = sqrt(_172);
    float _178 = fma(_158, _158, _174);
    float _180 = in.m_53.x;
    float _182 = in.m_53.y;
    float _184 = in.m_53.z;
    float _186 = sqrt(_178);
    bool _188 = _176 > 0.0;
    bool _190 = _186 > 0.0;
    float _192 = _186;
    float _194 = _172;
    float _196 = _162;
    if (_188)
    {
        float _198 = rsqrt(_172);
        _192 = _198;
    }
    float _200 = _192;
    float _202 = _152 * _182;
    float _204 = _156 * _182;
    float _206 = _158 * _182;
    float _208 = _204;
    float _210 = _202;
    if (!_188)
    {
        _144 = 0.0;
    }
    float _212 = _144;
    float _214 = fma(_180, _162, _202);
    float _216 = fma(_180, _166, _204);
    float _218 = fma(_180, _170, _206);
    float _220 = _178;
    float _222 = _212;
    if (_190)
    {
        float _224 = rsqrt(_178);
        _220 = _224;
    }
    float _226 = _220;
    float _228 = 0.0;
    float _230 = 0.0;
    if (!_190)
    {
        _228 = 0.0;
        _230 = 0.0;
    }
    float _232 = _228;
    float _234 = _230;
    float _236 = _232;
    float _238 = _234;
    if (!_188)
    {
        _194 = 0.0;
        _208 = 0.0;
    }
    float _240 = _194;
    float _242 = _208;
    float _244 = _240;
    float _246 = _242;
    if (!_190)
    {
        _210 = 0.0;
    }
    float _248 = _210;
    float _250 = fma(_146, _184, _214);
    float _252 = fma(_150, _184, _216);
    float _254 = fma(_154, _184, _218);
    float _256 = _200;
    float _258 = _248;
    if (_188)
    {
        float _260 = _200 * 0.001000000047497451305389404296875;
        _256 = _260;
    }
    float _262 = _256;
    if (_188)
    {
        float _264 = _150 * _262;
        _244 = _264;
    }
    float _266 = _244;
    if (_188)
    {
        float _268 = _146 * _262;
        _246 = _268;
    }
    float _270 = _246;
    if (_188)
    {
        float _272 = _154 * _262;
        _222 = _272;
    }
    float _274 = _222;
    if (_190)
    {
        float _276 = _226 * _156;
        _258 = _276;
    }
    float _278 = _258;
    float _280 = _278;
    if (_190)
    {
        float _282 = _226 * _152;
        _236 = _282;
    }
    float _284 = _236;
    float _286 = _284;
    if (_190)
    {
        float _288 = _226 * _158;
        _238 = _288;
    }
    float _290 = _238;
    bool _292 = !_148;
    float _294 = _290;
    float _312;
    if (!_292)
    {
        float _296 = in.m_55.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _312 = _310;
        _314 = true;
    }
    else
    {
        float _316 = float(_90);
        float _318 = 1.0 / _316;
        float _320 = _124 * _318;
        _312 = _320;
    }
    _314 = false;
    float _322 = _312;
    float _324 = in.m_40.x;
    float _326 = in.m_40.y;
    float _328 = in.m_40.z;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = _322 + _330;
    float _334 = in.m_55.x;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _344;
    bool _348 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _350 = isnan(_322);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = 1.0 / _338;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _362;
    float _366 = 1.0 / _342;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _368;
    float _372 = _156 * _326;
    float _374 = _158 * _326;
    float _376 = 1.0 / _346;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _322 + _378;
    float _382 = fma(_166, _324, _372);
    float _384 = fma(_170, _324, _374);
    float _386 = fma(_334, 0.2000000476837158203125, 0.89999997615814208984375);
    float _388 = _334 * 100.0;
    float _390 = in.m_57.x;
    float _392 = in.m_57.y;
    float _394 = in.m_57.z;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _398 = _322 + _396;
    float _400 = _386 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _402 = _380 * _366;
    float _404 = fma(_124, 0.00999999977648258209228515625, _388);
    float _406 = fma(_124, _400, _388);
    float _408 = _398 * _360;
    float _410 = _332 * _376;
    float _412 = fma(_150, _328, _382);
    float _414 = fma(_154, _328, _384);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _424;
    float _428 = _250 * _250;
    float _430 = fma(_418, _408, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _432 = fma(_422, _408, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _434 = fma(_426, _408, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _436 = fma(_252, _252, _428);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _450 = fma(_254, _254, _436);
    bool _452 = _390 > 0.0;
    float _454 = abs(_390);
    float _456 = -_454;
    float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[191].y, _406);
    bool _460 = _390 >= 0.0;
    bool _462 = isnan(_390);
    bool _464 = _460 || _462;
    bool _466 = isnan(0.0);
    bool _468 = _464 || _466;
    float _470 = fma(_440, _402, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _472 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _474 = isnan(_322);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = rsqrt(_450);
    int _486 = _468 ? 0 : 1;
    float _488 = _458 * 0.15915493667125701904296875;
    bool _490 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _492 = isnan(_322);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = fma(_444, _402, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _504 = ~_486;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    float _510 = fma(_448, _402, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _512 = -_482;
    float _514 = _512 + 1.0;
    int _516 = _508;
    float _518 = _326;
    float _520 = _324;
    if (!_452)
    {
        int _522 = ~_486;
        int _524 = _522 + 1;
        _516 = _524;
    }
    int _526 = _516;
    float _528 = -_500;
    float _530 = _528 + 1.0;
    bool _532 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _534 = isnan(_322);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = _488 * 6.283185482025146484375;
    float _546 = cos(_544);
    float _548 = _404 * 0.15915493667125701904296875;
    float _550 = _358 * _530;
    float _552 = abs(_390);
    float _554 = -_552;
    float _556 = _554 + 1.0;
    float _558 = _542 * _514;
    float _560 = _250 * _484;
    float _562 = -_542;
    float _564 = _562 + 1.0;
    float _566 = _252 * _484;
    float _568 = _488 * 6.283185482025146484375;
    float _570 = sin(_568);
    float _572 = _500 * _564;
    float _574 = fma(_364, _410, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _576 = -_556;
    float _578 = fma(_576, _556, 1.0);
    float _580 = _254 * _484;
    float _582 = float(_526);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _584;
    float _588 = _548 * 6.283185482025146484375;
    float _590 = sin(_588);
    float _592 = _432 * _550;
    float _594 = _560 * _284;
    float _596 = _546 * _578;
    float _598 = _430 * _550;
    float _600 = _434 * _550;
    float _602 = fma(_566, _278, _594);
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _606 = _582 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _608 = fma(_580, _290, _602);
    float _610 = _604 * 0.15915493667125701904296875;
    float _612 = -_358;
    float _614 = _612 + 1.0;
    float _616 = _570 * _606;
    float _618 = _596 * _606;
    float _620 = abs(_608);
    bool _622 = _620 > 0.99989998340606689453125;
    float _624 = fma(_590, 2.0, 2.0);
    float _626 = precise::clamp(_624, 0.0, 1.0);
    float _628 = _610 * 6.283185482025146484375;
    float _630 = cos(_628);
    float _632 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].x, _598);
    float _634 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].y, _592);
    float _636 = fma(_586, _410, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _638 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].z, _600);
    float _640 = fma(_370, _410, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _642 = _616 * 0.15915493667125701904296875;
    float _644 = _610 * 6.283185482025146484375;
    float _646 = sin(_644);
    float _648 = _618 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _650 = fma(_470, _572, _632);
    float _652 = fma(_502, _572, _634);
    float _654 = fma(_510, _572, _638);
    if (_622)
    {
        float _656 = _278 + _266;
        _280 = _656;
    }
    float _658 = _280;
    if (_622)
    {
        float _660 = _284 + _270;
        _286 = _660;
    }
    float _662 = _286;
    if (_622)
    {
        float _664 = _290 + _274;
        _294 = _664;
    }
    float _666 = _294;
    float _668 = _642 * 6.283185482025146484375;
    float _670 = cos(_668);
    float _672 = in.m_59.x;
    float _674 = in.m_59.y;
    float _676 = in.m_59.z;
    float _678 = _648 * 0.15915493667125701904296875;
    float _680 = fma(_626, 0.949999988079071044921875, -1.0);
    float _682 = fma(_640, _558, _654);
    float _684 = -_658;
    float _686 = _580 * _684;
    float _688 = fma(_636, _558, _650);
    float _690 = _642 * 6.283185482025146484375;
    float _692 = sin(_690);
    float _694 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[192].z, 1.0);
    float _696 = fma(_574, _558, _652);
    float _698 = -_666;
    float _700 = _560 * _698;
    float _702 = -_662;
    float _704 = _566 * _702;
    float _706 = -_666;
    float _708 = -_686;
    float _710 = fma(_566, _706, _708);
    float _712 = _630 * _394;
    float _714 = in.m_61.x;
    float _716 = _678 * 6.283185482025146484375;
    float _718 = sin(_716);
    float _720 = _406 * 0.15915493667125701904296875;
    float _722 = -_658;
    float _724 = -_704;
    float _726 = fma(_560, _722, _724);
    float _728 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[146].x, _688);
    float _730 = -_662;
    float _732 = -_700;
    float _734 = fma(_580, _730, _732);
    float _736 = _710 * _710;
    float _738 = fma(_646, _392, _712);
    float _740 = _646 * _394;
    float _742 = _678 * 6.283185482025146484375;
    float _744 = cos(_742);
    float _746 = _670 * _390;
    float _748 = _728 * _672;
    float _750 = -_740;
    float _752 = fma(_630, _392, _750);
    float _754 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[146].y, _696);
    float _756 = fma(_738, _692, _746);
    float _758 = _692 * _390;
    float _760 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[146].z, _682);
    float _762 = _752 * _718;
    float _764 = fma(_734, _734, _736);
    float _766 = _720 * 6.283185482025146484375;
    float _768 = sin(_766);
    float _770 = _754 * _674;
    float _772 = -_758;
    float _774 = fma(_738, _670, _772);
    float _776 = fma(_726, _726, _764);
    float _778 = _760 * _676;
    float _780 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _782 = _752 * _744;
    float _784 = -_762;
    float _786 = fma(_756, _744, _784);
    float _788 = -_774;
    float _790 = _788 + _394;
    float _792 = rsqrt(_776);
    float _794 = fma(_756, _718, _782);
    float _796 = -_786;
    float _798 = _796 + _390;
    float _800 = fma(_790, _714, _774);
    float _802 = in.m_51.w;
    float _804 = -_794;
    float _806 = _804 + _392;
    float _808 = fma(_798, _714, _786);
    float _810 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[191].w, _800);
    float _812 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _814 = fma(_806, _714, _794);
    float _816 = -_390;
    float _818 = _808 + _816;
    float _820 = -_394;
    float _822 = _810 + _820;
    float _824 = _778 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _826 = -_392;
    float _828 = _814 + _826;
    float _830 = fma(_694, _818, _390);
    float _832 = _734 * _792;
    float _834 = fma(_694, _828, _392);
    float _836 = in.m_49.w;
    float _838 = _710 * _792;
    float _840 = fma(_694, _822, _394);
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _834);
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _830);
    float _846 = _726 * _792;
    float _848 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _840);
    float _850 = _780 * _842;
    float _852 = _812 * _844;
    float _854 = _566 * _838;
    float _856 = _824 * _848;
    float _858 = _850 * _580;
    float _860 = _560 * _846;
    float _862 = -_854;
    float _864 = fma(_560, _832, _862);
    float _866 = _850 * _566;
    float _868 = fma(_852, _846, _858);
    float _870 = _414 + _802;
    float _872 = -_860;
    float _874 = fma(_580, _838, _872);
    float _876 = fma(_852, _832, _866);
    float _878 = fma(_856, _864, _868);
    float _880 = _152 * _326;
    float _882 = _580 * _832;
    float _884 = fma(_856, _874, _876);
    float _886 = _870 + _878;
    float _888 = _412 + _836;
    float _890 = in.m_47.w;
    float _892 = fma(_162, _324, _880);
    float _894 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _896 = _886 + _894;
    float _898 = _888 + _884;
    float _900 = _850 * _560;
    float _902 = fma(_146, _328, _892);
    float _904 = _896 * _896;
    float _906 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _908 = _898 + _906;
    float _910 = -_882;
    float _912 = fma(_566, _846, _910);
    float _914 = fma(_852, _838, _900);
    bool _916 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _918 = isnan(0.5);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _924 = _920 || _922;
    float _926 = fma(_908, _908, _904);
    float _928 = fma(_856, _912, _914);
    float _930 = sqrt(_926);
    float _932 = _902 + _890;
    float _934 = _932 + _928;
    bool _936 = _930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_936)
    {
        _518 = _898;
    }
    float _938 = _518;
    float _940 = _938;
    if (!_936)
    {
        _520 = _886;
    }
    float _942 = _520;
    float _944 = _942;
    if (!_936)
    {
        _196 = _934;
    }
    float _946 = _196;
    bool _948 = !_936;
    float _950 = _946;
    if (!_948)
    {
        float _952 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _954 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _956 = _930 + _954;
        float _958 = rsqrt(_926);
        float _960 = _956 * _952;
        float _962 = _934 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _964 = _960 * 0.15915493667125701904296875;
        float _966 = _964 * 6.283185482025146484375;
        float _968 = sin(_966);
        float _970 = _964 * 6.283185482025146484375;
        float _972 = cos(_970);
        float _974 = fma(_968, _962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _976 = _958 * _974;
        float _978 = _972 + (-1.0);
        float _980 = fma(_908, _976, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _982 = fma(_896, _976, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _984 = _978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _986 = fma(_934, _972, _984);
        _950 = _986;
        _940 = _980;
        _944 = _982;
    }
    float _988 = _950;
    float _990 = _940;
    float _992 = _944;
    float _994 = _988;
    float _996 = _990;
    float _998 = _992;
    if (!_924)
    {
        float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1002 = _932 + _1000;
        float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1006 = _888 + _1004;
        float _1008 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1010 = -_932;
        float _1012 = _1010 + _988;
        float _1014 = _1002 * _1002;
        float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1018 = _870 + _1016;
        float _1020 = fma(_1006, _1006, _1014);
        float _1022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1024 = fma(_1018, _1018, _1020);
        float _1026 = sqrt(_1024);
        float _1028 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1030 = precise::min(_1026, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1032 = _1030 * _1022;
        float _1034 = -_888;
        float _1036 = _1034 + _990;
        float _1038 = _1028 * _1032;
        float _1040 = -_870;
        float _1042 = _1040 + _992;
        float _1044 = fma(_1036, _1038, _888);
        float _1046 = fma(_1012, _1038, _932);
        float _1048 = fma(_1042, _1038, _870);
        _994 = _1046;
        _996 = _1044;
        _998 = _1048;
    }
    float _1050 = _994;
    float _1052 = _996;
    float _1054 = _998;
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1058 = _1050 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1062 = _1052 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1066 = _1054 + _1064;
    float _1068 = _1058 * _1058;
    float _1070 = fma(_1062, _1062, _1068);
    float _1072 = fma(_1066, _1066, _1070);
    float _1074 = rsqrt(_1072);
    float _1076 = sqrt(_1072);
    float _1078 = _1074 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1080 = _1062 * _1078;
    float _1082 = _1066 * _1078;
    float _1084 = _1080 * _1080;
    float _1086 = _1082 * _1082;
    float _1088 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1090 = _1084 + _1086;
    float _1092 = precise::max(0.0, _1088);
    float _1094 = sqrt(_1090);
    float _1096 = -_1078;
    float _1098 = -_1092;
    float _1100 = fma(_1058, _1096, _1098);
    bool _1102 = _1094 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1104 = _1058;
    float _1106 = _1092;
    float _1108 = _1084;
    float _1110 = _1080;
    float _1112 = _1082;
    if (!_1102)
    {
        _1104 = _1084;
    }
    float _1114 = _1104;
    float _1116 = _1114;
    if (!_1102)
    {
        _1106 = _1086;
    }
    float _1118 = _1106;
    float _1120 = _1118;
    if (!_1102)
    {
        _1108 = _1100;
    }
    float _1122 = _1108;
    bool _1124 = !_1102;
    float _1126 = _1122;
    if (!_1124)
    {
        float _1128 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1132 = _1094 + _1130;
        float _1134 = rsqrt(_1090);
        float _1136 = _1132 * _1128;
        float _1138 = _1100 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1140 = _1136 * 0.15915493667125701904296875;
        float _1142 = _1140 * 6.283185482025146484375;
        float _1144 = sin(_1142);
        float _1146 = _1140 * 6.283185482025146484375;
        float _1148 = cos(_1146);
        float _1150 = fma(_1144, _1138, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1152 = _1134 * _1150;
        float _1154 = _1148 + (-1.0);
        float _1156 = _1080 * _1152;
        float _1158 = _1082 * _1152;
        float _1160 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1162 = _1158 * _1158;
        float _1164 = fma(_1100, _1148, _1160);
        float _1166 = _1156 * _1156;
        _1126 = _1164;
        _1116 = _1166;
        _1120 = _1162;
        _1110 = _1156;
        _1112 = _1158;
    }
    float _1168 = _1126;
    float _1170 = _1116;
    float _1172 = _1120;
    float _1174 = _1110;
    float _1176 = _1112;
    float _1178 = fma(_1168, _1168, _1170);
    float _1180 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1182 = _1178 + _1172;
    float _1184 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1186 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1188 = fma(_1076, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1186);
    float _1190 = precise::clamp(_1188, 0.0, 1.0);
    float _1192 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1194 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1184);
    float _1196 = rsqrt(_1182);
    float _1198 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1200 = -_1190;
    float _1202 = _1200 + 1.0;
    float _1204 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1194);
    float _1206 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1208 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1198);
    float _1210 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1180);
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1214 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1206);
    float _1216 = abs(_1202);
    float _1218 = log2(_1216);
    float _1220 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1208);
    float _1222 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1210);
    float _1224 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1214);
    float _1226 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1228 = _1220 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1230 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1232 = _1196 * _1174;
    float _1234 = _1196 * _1168;
    float _1236 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1238 = _1196 * _1176;
    float _1240 = _1232 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1242 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1244 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1236);
    float _1246 = -_1226;
    float _1248 = fma(_1192, _1246, 1.0);
    float _1250 = -_1240;
    float _1252 = fma(_1234, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1250);
    float _1254 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1256 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1244);
    float _1258 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1260 = -_1238;
    float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1252);
    float _1264 = log2(_1248);
    float _1266 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1256);
    float _1268 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1270 = fma(_1262, -0.5, 0.5);
    float _1272 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1258);
    float _1274 = fma(_1262, 0.5, 0.5);
    float _1276 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1268);
    float _1278 = _1234 + 1.0;
    float _1280 = exp2(_1254);
    float _1282 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1272);
    float _1284 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1276);
    float _1286 = fma(_1274, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1288 = 1.0 / _1266;
    float _1290 = _1264 * 0.693147182464599609375;
    float _1292 = fma(_1274, _1286, -0.212114393711090087890625);
    float _1294 = _1290 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1296 = fma(_1274, _1292, 1.570728778839111328125);
    float _1298 = sqrt(_1270);
    float _1300 = -_1234;
    float _1302 = fma(_1280, _1278, _1300);
    float _1304 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1282);
    float _1306 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1284);
    float _1308 = fma(_1302, 0.5, 0.5);
    float _1310 = _1304 * _1288;
    float _1312 = _1306 * _1288;
    float _1314 = fma(_1310, 0.5, 0.5);
    float _1316 = fma(_1312, -0.5, 0.5);
    float _1318 = _1298 * 0.636619746685028076171875;
    float3 _3325 = float3(_1314, _1316, _1294);
    float _1320 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3325, float3(0.0), isnan(_3325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3325, float3(0.0), isnan(_3325)), level(0.0)).x;
    float _1322 = -_1296;
    float _1324 = fma(_1318, _1322, 1.0);
    float2 _3341 = float2(_1324, _1308);
    float3 _1328 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3341, float2(0.0), isnan(_3341)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3341, float2(0.0), isnan(_3341)), level(0.0)).xyz;
    float _1330 = _1328.x;
    float _1332 = _1328.y;
    float _1334 = _1328.z;
    float _1336 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1338 = in.m_61.w;
    float _1340 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1336);
    float _1342 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_63.w = _1266;
    float _1344 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1340);
    float _1346 = exp2(_1342);
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1356 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1358 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1344);
    float _1360 = _1266 * 0.5;
    float _1362 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1304;
    out.gl_Position.y = _1306;
    out.gl_Position.z = _1358;
    out.gl_Position.w = _1266;
    float _1366 = _1304 + _1266;
    float _1368 = fma(_1306, -0.5, _1360);
    float _1370 = -_1346;
    float _1372 = _1370 + 1.0;
    float _1374 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1376 = _1366 * 0.5;
    out.m_65.w = _1338;
    float _1378 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1356;
    out.m_67.y = _1364;
    out.m_67.z = _1362;
    out.m_67.w = _1348;
    float _1380 = -_1378;
    float _1382 = _1380 + 1.0;
    out.m_63.x = _1376;
    out.m_63.y = _1368;
    out.m_69.w = _1374;
    float _1384 = _1378 * _1320;
    float _1386 = _1330 * _1384;
    float _1388 = _1332 * _1384;
    float _1390 = _1334 * _1384;
    out.m_71.x = _1386;
    out.m_71.y = _1388;
    out.m_71.z = _1390;
    out.m_71.w = _1382;
    out.m_43.x = 1.0;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _314 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_40.w;
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
        out.m_43.x = 0.0;
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
        float _1447 = as_type<float>(_106);
        out.gl_Position.z = _1447;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_45.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_120)
    {
        float _126 = float(_90);
        _100 = _126;
    }
    float _128 = _100;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_43.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    float _144 = as_type<float>(_142);
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1518 = as_type<float>(_142);
        out.gl_Position.z = _1518;
    }
    if (_134)
    {
        return out;
    }
    float _146 = in.m_47.z;
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _150 = in.m_49.z;
    float _152 = in.m_47.y;
    float _154 = in.m_51.z;
    float _156 = in.m_49.y;
    float _158 = in.m_51.y;
    float _160 = _146 * _146;
    float _162 = in.m_47.x;
    float _164 = fma(_150, _150, _160);
    float _166 = in.m_49.x;
    float _168 = _152 * _152;
    float _170 = in.m_51.x;
    float _172 = fma(_154, _154, _164);
    float _174 = fma(_156, _156, _168);
    float _176 = sqrt(_172);
    float _178 = fma(_158, _158, _174);
    float _180 = in.m_53.x;
    float _182 = in.m_53.y;
    float _184 = in.m_53.z;
    float _186 = sqrt(_178);
    bool _188 = _176 > 0.0;
    bool _190 = _186 > 0.0;
    float _192 = _186;
    float _194 = _172;
    float _196 = _162;
    if (_188)
    {
        float _198 = rsqrt(_172);
        _192 = _198;
    }
    float _200 = _192;
    float _202 = _152 * _182;
    float _204 = _156 * _182;
    float _206 = _158 * _182;
    float _208 = _204;
    float _210 = _202;
    if (!_188)
    {
        _144 = 0.0;
    }
    float _212 = _144;
    float _214 = fma(_180, _162, _202);
    float _216 = fma(_180, _166, _204);
    float _218 = fma(_180, _170, _206);
    float _220 = _178;
    float _222 = _212;
    if (_190)
    {
        float _224 = rsqrt(_178);
        _220 = _224;
    }
    float _226 = _220;
    float _228 = 0.0;
    float _230 = 0.0;
    if (!_190)
    {
        _228 = 0.0;
        _230 = 0.0;
    }
    float _232 = _228;
    float _234 = _230;
    float _236 = _232;
    float _238 = _234;
    if (!_188)
    {
        _194 = 0.0;
        _208 = 0.0;
    }
    float _240 = _194;
    float _242 = _208;
    float _244 = _240;
    float _246 = _242;
    if (!_190)
    {
        _210 = 0.0;
    }
    float _248 = _210;
    float _250 = fma(_146, _184, _214);
    float _252 = fma(_150, _184, _216);
    float _254 = fma(_154, _184, _218);
    float _256 = _200;
    float _258 = _248;
    if (_188)
    {
        float _260 = _200 * 0.001000000047497451305389404296875;
        _256 = _260;
    }
    float _262 = _256;
    if (_188)
    {
        float _264 = _150 * _262;
        _244 = _264;
    }
    float _266 = _244;
    if (_188)
    {
        float _268 = _146 * _262;
        _246 = _268;
    }
    float _270 = _246;
    if (_188)
    {
        float _272 = _154 * _262;
        _222 = _272;
    }
    float _274 = _222;
    if (_190)
    {
        float _276 = _226 * _156;
        _258 = _276;
    }
    float _278 = _258;
    float _280 = _278;
    if (_190)
    {
        float _282 = _226 * _152;
        _236 = _282;
    }
    float _284 = _236;
    float _286 = _284;
    if (_190)
    {
        float _288 = _226 * _158;
        _238 = _288;
    }
    float _290 = _238;
    bool _292 = !_148;
    float _294 = _290;
    float _312;
    if (!_292)
    {
        float _296 = in.m_55.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _312 = _310;
        _314 = true;
    }
    else
    {
        float _316 = float(_90);
        float _318 = 1.0 / _316;
        float _320 = _124 * _318;
        _312 = _320;
    }
    _314 = false;
    float _322 = _312;
    float _324 = in.m_40.x;
    float _326 = in.m_40.y;
    float _328 = in.m_40.z;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = _322 + _330;
    float _334 = in.m_55.x;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _344;
    bool _348 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _350 = isnan(_322);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = 1.0 / _338;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _362;
    float _366 = 1.0 / _342;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _368;
    float _372 = _156 * _326;
    float _374 = _158 * _326;
    float _376 = 1.0 / _346;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _322 + _378;
    float _382 = fma(_166, _324, _372);
    float _384 = fma(_170, _324, _374);
    float _386 = fma(_334, 0.2000000476837158203125, 0.89999997615814208984375);
    float _388 = _334 * 100.0;
    float _390 = in.m_57.x;
    float _392 = in.m_57.y;
    float _394 = in.m_57.z;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _398 = _322 + _396;
    float _400 = _386 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _402 = _380 * _366;
    float _404 = fma(_124, 0.00999999977648258209228515625, _388);
    float _406 = fma(_124, _400, _388);
    float _408 = _398 * _360;
    float _410 = _332 * _376;
    float _412 = fma(_150, _328, _382);
    float _414 = fma(_154, _328, _384);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _424;
    float _428 = _250 * _250;
    float _430 = fma(_418, _408, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _432 = fma(_422, _408, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _434 = fma(_426, _408, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _436 = fma(_252, _252, _428);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _450 = fma(_254, _254, _436);
    bool _452 = _390 > 0.0;
    float _454 = abs(_390);
    float _456 = -_454;
    float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[191].y, _406);
    bool _460 = _390 >= 0.0;
    bool _462 = isnan(_390);
    bool _464 = _460 || _462;
    bool _466 = isnan(0.0);
    bool _468 = _464 || _466;
    float _470 = fma(_440, _402, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _472 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _474 = isnan(_322);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = rsqrt(_450);
    int _486 = _468 ? 0 : 1;
    float _488 = _458 * 0.15915493667125701904296875;
    bool _490 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _492 = isnan(_322);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = fma(_444, _402, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _504 = ~_486;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    float _510 = fma(_448, _402, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _512 = -_482;
    float _514 = _512 + 1.0;
    int _516 = _508;
    float _518 = _326;
    float _520 = _324;
    if (!_452)
    {
        int _522 = ~_486;
        int _524 = _522 + 1;
        _516 = _524;
    }
    int _526 = _516;
    float _528 = -_500;
    float _530 = _528 + 1.0;
    bool _532 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _534 = isnan(_322);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = _488 * 6.283185482025146484375;
    float _546 = cos(_544);
    float _548 = _404 * 0.15915493667125701904296875;
    float _550 = _358 * _530;
    float _552 = abs(_390);
    float _554 = -_552;
    float _556 = _554 + 1.0;
    float _558 = _542 * _514;
    float _560 = _250 * _484;
    float _562 = -_542;
    float _564 = _562 + 1.0;
    float _566 = _252 * _484;
    float _568 = _488 * 6.283185482025146484375;
    float _570 = sin(_568);
    float _572 = _500 * _564;
    float _574 = fma(_364, _410, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _576 = -_556;
    float _578 = fma(_576, _556, 1.0);
    float _580 = _254 * _484;
    float _582 = float(_526);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _584;
    float _588 = _548 * 6.283185482025146484375;
    float _590 = sin(_588);
    float _592 = _432 * _550;
    float _594 = _560 * _284;
    float _596 = _546 * _578;
    float _598 = _430 * _550;
    float _600 = _434 * _550;
    float _602 = fma(_566, _278, _594);
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _606 = _582 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _608 = fma(_580, _290, _602);
    float _610 = _604 * 0.15915493667125701904296875;
    float _612 = -_358;
    float _614 = _612 + 1.0;
    float _616 = _570 * _606;
    float _618 = _596 * _606;
    float _620 = abs(_608);
    bool _622 = _620 > 0.99989998340606689453125;
    float _624 = fma(_590, 2.0, 2.0);
    float _626 = precise::clamp(_624, 0.0, 1.0);
    float _628 = _610 * 6.283185482025146484375;
    float _630 = cos(_628);
    float _632 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].x, _598);
    float _634 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].y, _592);
    float _636 = fma(_586, _410, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _638 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].z, _600);
    float _640 = fma(_370, _410, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _642 = _616 * 0.15915493667125701904296875;
    float _644 = _610 * 6.283185482025146484375;
    float _646 = sin(_644);
    float _648 = _618 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _650 = fma(_470, _572, _632);
    float _652 = fma(_502, _572, _634);
    float _654 = fma(_510, _572, _638);
    if (_622)
    {
        float _656 = _278 + _266;
        _280 = _656;
    }
    float _658 = _280;
    if (_622)
    {
        float _660 = _284 + _270;
        _286 = _660;
    }
    float _662 = _286;
    if (_622)
    {
        float _664 = _290 + _274;
        _294 = _664;
    }
    float _666 = _294;
    float _668 = _642 * 6.283185482025146484375;
    float _670 = cos(_668);
    float _672 = in.m_59.x;
    float _674 = in.m_59.y;
    float _676 = in.m_59.z;
    float _678 = _648 * 0.15915493667125701904296875;
    float _680 = fma(_626, 0.949999988079071044921875, -1.0);
    float _682 = fma(_640, _558, _654);
    float _684 = -_658;
    float _686 = _580 * _684;
    float _688 = fma(_636, _558, _650);
    float _690 = _642 * 6.283185482025146484375;
    float _692 = sin(_690);
    float _694 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[192].z, 1.0);
    float _696 = fma(_574, _558, _652);
    float _698 = -_666;
    float _700 = _560 * _698;
    float _702 = -_662;
    float _704 = _566 * _702;
    float _706 = -_666;
    float _708 = -_686;
    float _710 = fma(_566, _706, _708);
    float _712 = _630 * _394;
    float _714 = in.m_61.x;
    float _716 = _678 * 6.283185482025146484375;
    float _718 = sin(_716);
    float _720 = _406 * 0.15915493667125701904296875;
    float _722 = -_658;
    float _724 = -_704;
    float _726 = fma(_560, _722, _724);
    float _728 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[146].x, _688);
    float _730 = -_662;
    float _732 = -_700;
    float _734 = fma(_580, _730, _732);
    float _736 = _710 * _710;
    float _738 = fma(_646, _392, _712);
    float _740 = _646 * _394;
    float _742 = _678 * 6.283185482025146484375;
    float _744 = cos(_742);
    float _746 = _670 * _390;
    float _748 = _728 * _672;
    float _750 = -_740;
    float _752 = fma(_630, _392, _750);
    float _754 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[146].y, _696);
    float _756 = fma(_738, _692, _746);
    float _758 = _692 * _390;
    float _760 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[146].z, _682);
    float _762 = _752 * _718;
    float _764 = fma(_734, _734, _736);
    float _766 = _720 * 6.283185482025146484375;
    float _768 = sin(_766);
    float _770 = _754 * _674;
    float _772 = -_758;
    float _774 = fma(_738, _670, _772);
    float _776 = fma(_726, _726, _764);
    float _778 = _760 * _676;
    float _780 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _782 = _752 * _744;
    float _784 = -_762;
    float _786 = fma(_756, _744, _784);
    float _788 = -_774;
    float _790 = _788 + _394;
    float _792 = rsqrt(_776);
    float _794 = fma(_756, _718, _782);
    float _796 = -_786;
    float _798 = _796 + _390;
    float _800 = fma(_790, _714, _774);
    float _802 = in.m_51.w;
    float _804 = -_794;
    float _806 = _804 + _392;
    float _808 = fma(_798, _714, _786);
    float _810 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[191].w, _800);
    float _812 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _814 = fma(_806, _714, _794);
    float _816 = -_390;
    float _818 = _808 + _816;
    float _820 = -_394;
    float _822 = _810 + _820;
    float _824 = _778 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _826 = -_392;
    float _828 = _814 + _826;
    float _830 = fma(_694, _818, _390);
    float _832 = _734 * _792;
    float _834 = fma(_694, _828, _392);
    float _836 = in.m_49.w;
    float _838 = _710 * _792;
    float _840 = fma(_694, _822, _394);
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _834);
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _830);
    float _846 = _726 * _792;
    float _848 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _840);
    float _850 = _780 * _842;
    float _852 = _812 * _844;
    float _854 = _566 * _838;
    float _856 = _824 * _848;
    float _858 = _850 * _580;
    float _860 = _560 * _846;
    float _862 = -_854;
    float _864 = fma(_560, _832, _862);
    float _866 = _850 * _566;
    float _868 = fma(_852, _846, _858);
    float _870 = _414 + _802;
    float _872 = -_860;
    float _874 = fma(_580, _838, _872);
    float _876 = fma(_852, _832, _866);
    float _878 = fma(_856, _864, _868);
    float _880 = _152 * _326;
    float _882 = _580 * _832;
    float _884 = fma(_856, _874, _876);
    float _886 = _870 + _878;
    float _888 = _412 + _836;
    float _890 = in.m_47.w;
    float _892 = fma(_162, _324, _880);
    float _894 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _896 = _886 + _894;
    float _898 = _888 + _884;
    float _900 = _850 * _560;
    float _902 = fma(_146, _328, _892);
    float _904 = _896 * _896;
    float _906 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _908 = _898 + _906;
    float _910 = -_882;
    float _912 = fma(_566, _846, _910);
    float _914 = fma(_852, _838, _900);
    bool _916 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _918 = isnan(0.5);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _924 = _920 || _922;
    float _926 = fma(_908, _908, _904);
    float _928 = fma(_856, _912, _914);
    float _930 = sqrt(_926);
    float _932 = _902 + _890;
    float _934 = _932 + _928;
    bool _936 = _930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_936)
    {
        _518 = _898;
    }
    float _938 = _518;
    float _940 = _938;
    if (!_936)
    {
        _520 = _886;
    }
    float _942 = _520;
    float _944 = _942;
    if (!_936)
    {
        _196 = _934;
    }
    float _946 = _196;
    bool _948 = !_936;
    float _950 = _946;
    if (!_948)
    {
        float _952 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _954 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _956 = _930 + _954;
        float _958 = rsqrt(_926);
        float _960 = _956 * _952;
        float _962 = _934 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _964 = _960 * 0.15915493667125701904296875;
        float _966 = _964 * 6.283185482025146484375;
        float _968 = sin(_966);
        float _970 = _964 * 6.283185482025146484375;
        float _972 = cos(_970);
        float _974 = fma(_968, _962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _976 = _958 * _974;
        float _978 = _972 + (-1.0);
        float _980 = fma(_908, _976, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _982 = fma(_896, _976, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _984 = _978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _986 = fma(_934, _972, _984);
        _950 = _986;
        _940 = _980;
        _944 = _982;
    }
    float _988 = _950;
    float _990 = _940;
    float _992 = _944;
    float _994 = _988;
    float _996 = _990;
    float _998 = _992;
    if (!_924)
    {
        float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1002 = _932 + _1000;
        float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1006 = _888 + _1004;
        float _1008 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1010 = -_932;
        float _1012 = _1010 + _988;
        float _1014 = _1002 * _1002;
        float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1018 = _870 + _1016;
        float _1020 = fma(_1006, _1006, _1014);
        float _1022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1024 = fma(_1018, _1018, _1020);
        float _1026 = sqrt(_1024);
        float _1028 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1030 = precise::min(_1026, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1032 = _1030 * _1022;
        float _1034 = -_888;
        float _1036 = _1034 + _990;
        float _1038 = _1028 * _1032;
        float _1040 = -_870;
        float _1042 = _1040 + _992;
        float _1044 = fma(_1036, _1038, _888);
        float _1046 = fma(_1012, _1038, _932);
        float _1048 = fma(_1042, _1038, _870);
        _994 = _1046;
        _996 = _1044;
        _998 = _1048;
    }
    float _1050 = _994;
    float _1052 = _996;
    float _1054 = _998;
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1058 = _1050 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1062 = _1052 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1066 = _1054 + _1064;
    float _1068 = _1058 * _1058;
    float _1070 = fma(_1062, _1062, _1068);
    float _1072 = fma(_1066, _1066, _1070);
    float _1074 = rsqrt(_1072);
    float _1076 = sqrt(_1072);
    float _1078 = _1074 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1080 = _1062 * _1078;
    float _1082 = _1066 * _1078;
    float _1084 = _1080 * _1080;
    float _1086 = _1082 * _1082;
    float _1088 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1090 = _1084 + _1086;
    float _1092 = precise::max(0.0, _1088);
    float _1094 = sqrt(_1090);
    float _1096 = -_1078;
    float _1098 = -_1092;
    float _1100 = fma(_1058, _1096, _1098);
    bool _1102 = _1094 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1104 = _1058;
    float _1106 = _1092;
    float _1108 = _1084;
    float _1110 = _1080;
    float _1112 = _1082;
    if (!_1102)
    {
        _1104 = _1084;
    }
    float _1114 = _1104;
    float _1116 = _1114;
    if (!_1102)
    {
        _1106 = _1086;
    }
    float _1118 = _1106;
    float _1120 = _1118;
    if (!_1102)
    {
        _1108 = _1100;
    }
    float _1122 = _1108;
    bool _1124 = !_1102;
    float _1126 = _1122;
    if (!_1124)
    {
        float _1128 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1132 = _1094 + _1130;
        float _1134 = rsqrt(_1090);
        float _1136 = _1132 * _1128;
        float _1138 = _1100 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1140 = _1136 * 0.15915493667125701904296875;
        float _1142 = _1140 * 6.283185482025146484375;
        float _1144 = sin(_1142);
        float _1146 = _1140 * 6.283185482025146484375;
        float _1148 = cos(_1146);
        float _1150 = fma(_1144, _1138, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1152 = _1134 * _1150;
        float _1154 = _1148 + (-1.0);
        float _1156 = _1080 * _1152;
        float _1158 = _1082 * _1152;
        float _1160 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1162 = _1158 * _1158;
        float _1164 = fma(_1100, _1148, _1160);
        float _1166 = _1156 * _1156;
        _1126 = _1164;
        _1116 = _1166;
        _1120 = _1162;
        _1110 = _1156;
        _1112 = _1158;
    }
    float _1168 = _1126;
    float _1170 = _1116;
    float _1172 = _1120;
    float _1174 = _1110;
    float _1176 = _1112;
    float _1178 = fma(_1168, _1168, _1170);
    float _1180 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1182 = _1178 + _1172;
    float _1184 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1186 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1188 = fma(_1076, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1186);
    float _1190 = precise::clamp(_1188, 0.0, 1.0);
    float _1192 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1194 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1184);
    float _1196 = rsqrt(_1182);
    float _1198 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1200 = -_1190;
    float _1202 = _1200 + 1.0;
    float _1204 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1194);
    float _1206 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1208 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1198);
    float _1210 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1180);
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1214 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1206);
    float _1216 = abs(_1202);
    float _1218 = log2(_1216);
    float _1220 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1208);
    float _1222 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1210);
    float _1224 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1214);
    float _1226 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1228 = _1220 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1230 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1232 = _1196 * _1174;
    float _1234 = _1196 * _1168;
    float _1236 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1238 = _1196 * _1176;
    float _1240 = _1232 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1242 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1244 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1236);
    float _1246 = -_1226;
    float _1248 = fma(_1192, _1246, 1.0);
    float _1250 = -_1240;
    float _1252 = fma(_1234, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1250);
    float _1254 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1256 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1244);
    float _1258 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1260 = -_1238;
    float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1252);
    float _1264 = log2(_1248);
    float _1266 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1256);
    float _1268 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1270 = fma(_1262, -0.5, 0.5);
    float _1272 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1258);
    float _1274 = fma(_1262, 0.5, 0.5);
    float _1276 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1268);
    float _1278 = _1234 + 1.0;
    float _1280 = exp2(_1254);
    float _1282 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1272);
    float _1284 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1276);
    float _1286 = fma(_1274, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1288 = 1.0 / _1266;
    float _1290 = _1264 * 0.693147182464599609375;
    float _1292 = fma(_1274, _1286, -0.212114393711090087890625);
    float _1294 = _1290 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1296 = fma(_1274, _1292, 1.570728778839111328125);
    float _1298 = sqrt(_1270);
    float _1300 = -_1234;
    float _1302 = fma(_1280, _1278, _1300);
    float _1304 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1282);
    float _1306 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1284);
    float _1308 = fma(_1302, 0.5, 0.5);
    float _1310 = _1304 * _1288;
    float _1312 = _1306 * _1288;
    float _1314 = fma(_1310, 0.5, 0.5);
    float _1316 = fma(_1312, -0.5, 0.5);
    float _1318 = _1298 * 0.636619746685028076171875;
    float3 _3325 = float3(_1314, _1316, _1294);
    float _1320 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3325, float3(0.0), isnan(_3325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3325, float3(0.0), isnan(_3325)), level(0.0)).x;
    float _1322 = -_1296;
    float _1324 = fma(_1318, _1322, 1.0);
    float2 _3341 = float2(_1324, _1308);
    float3 _1328 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3341, float2(0.0), isnan(_3341)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3341, float2(0.0), isnan(_3341)), level(0.0)).xyz;
    float _1330 = _1328.x;
    float _1332 = _1328.y;
    float _1334 = _1328.z;
    float _1336 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1338 = in.m_61.w;
    float _1340 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1336);
    float _1342 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_63.w = _1266;
    float _1344 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1340);
    float _1346 = exp2(_1342);
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1356 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1358 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1344);
    float _1360 = _1266 * 0.5;
    float _1362 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1304;
    out.gl_Position.y = _1306;
    out.gl_Position.z = _1358;
    out.gl_Position.w = _1266;
    float _1366 = _1304 + _1266;
    float _1368 = fma(_1306, -0.5, _1360);
    float _1370 = -_1346;
    float _1372 = _1370 + 1.0;
    float _1374 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1376 = _1366 * 0.5;
    out.m_65.w = _1338;
    float _1378 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1356;
    out.m_67.y = _1364;
    out.m_67.z = _1362;
    out.m_67.w = _1348;
    float _1380 = -_1378;
    float _1382 = _1380 + 1.0;
    out.m_63.x = _1376;
    out.m_63.y = _1368;
    out.m_69.w = _1374;
    float _1384 = _1378 * _1320;
    float _1386 = _1330 * _1384;
    float _1388 = _1332 * _1384;
    float _1390 = _1334 * _1384;
    out.m_71.x = _1386;
    out.m_71.y = _1388;
    out.m_71.z = _1390;
    out.m_71.w = _1382;
    out.m_43.x = 1.0;
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
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _314 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_40.w;
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
        out.m_43.x = 0.0;
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
        float _1447 = as_type<float>(_106);
        out.gl_Position.z = _1447;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_45.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_120)
    {
        float _126 = float(_90);
        _100 = _126;
    }
    float _128 = _100;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_43.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    float _144 = as_type<float>(_142);
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1518 = as_type<float>(_142);
        out.gl_Position.z = _1518;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_47.z;
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _150 = in.m_49.z;
    float _152 = in.m_47.y;
    float _154 = in.m_51.z;
    float _156 = in.m_49.y;
    float _158 = in.m_51.y;
    float _160 = _146 * _146;
    float _162 = in.m_47.x;
    float _164 = fma(_150, _150, _160);
    float _166 = in.m_49.x;
    float _168 = _152 * _152;
    float _170 = in.m_51.x;
    float _172 = fma(_154, _154, _164);
    float _174 = fma(_156, _156, _168);
    float _176 = sqrt(_172);
    float _178 = fma(_158, _158, _174);
    float _180 = in.m_53.x;
    float _182 = in.m_53.y;
    float _184 = in.m_53.z;
    float _186 = sqrt(_178);
    bool _188 = _176 > 0.0;
    bool _190 = _186 > 0.0;
    float _192 = _186;
    float _194 = _172;
    float _196 = _162;
    if (_188)
    {
        float _198 = rsqrt(_172);
        _192 = _198;
    }
    float _200 = _192;
    float _202 = _152 * _182;
    float _204 = _156 * _182;
    float _206 = _158 * _182;
    float _208 = _204;
    float _210 = _202;
    if (!_188)
    {
        _144 = 0.0;
    }
    float _212 = _144;
    float _214 = fma(_180, _162, _202);
    float _216 = fma(_180, _166, _204);
    float _218 = fma(_180, _170, _206);
    float _220 = _178;
    float _222 = _212;
    if (_190)
    {
        float _224 = rsqrt(_178);
        _220 = _224;
    }
    float _226 = _220;
    float _228 = 0.0;
    float _230 = 0.0;
    if (!_190)
    {
        _228 = 0.0;
        _230 = 0.0;
    }
    float _232 = _228;
    float _234 = _230;
    float _236 = _232;
    float _238 = _234;
    if (!_188)
    {
        _194 = 0.0;
        _208 = 0.0;
    }
    float _240 = _194;
    float _242 = _208;
    float _244 = _240;
    float _246 = _242;
    if (!_190)
    {
        _210 = 0.0;
    }
    float _248 = _210;
    float _250 = fma(_146, _184, _214);
    float _252 = fma(_150, _184, _216);
    float _254 = fma(_154, _184, _218);
    float _256 = _200;
    float _258 = _248;
    if (_188)
    {
        float _260 = _200 * 0.001000000047497451305389404296875;
        _256 = _260;
    }
    float _262 = _256;
    if (_188)
    {
        float _264 = _150 * _262;
        _244 = _264;
    }
    float _266 = _244;
    if (_188)
    {
        float _268 = _146 * _262;
        _246 = _268;
    }
    float _270 = _246;
    if (_188)
    {
        float _272 = _154 * _262;
        _222 = _272;
    }
    float _274 = _222;
    if (_190)
    {
        float _276 = _226 * _156;
        _258 = _276;
    }
    float _278 = _258;
    float _280 = _278;
    if (_190)
    {
        float _282 = _226 * _152;
        _236 = _282;
    }
    float _284 = _236;
    float _286 = _284;
    if (_190)
    {
        float _288 = _226 * _158;
        _238 = _288;
    }
    float _290 = _238;
    bool _292 = !_148;
    float _294 = _290;
    float _312;
    if (!_292)
    {
        float _296 = in.m_55.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _312 = _310;
        _314 = true;
    }
    else
    {
        float _316 = float(_90);
        float _318 = 1.0 / _316;
        float _320 = _124 * _318;
        _312 = _320;
    }
    _314 = false;
    float _322 = _312;
    float _324 = in.m_40.x;
    float _326 = in.m_40.y;
    float _328 = in.m_40.z;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = _322 + _330;
    float _334 = in.m_55.x;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _344;
    bool _348 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _350 = isnan(_322);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = 1.0 / _338;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _362;
    float _366 = 1.0 / _342;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _368;
    float _372 = _156 * _326;
    float _374 = _158 * _326;
    float _376 = 1.0 / _346;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _322 + _378;
    float _382 = fma(_166, _324, _372);
    float _384 = fma(_170, _324, _374);
    float _386 = fma(_334, 0.2000000476837158203125, 0.89999997615814208984375);
    float _388 = _334 * 100.0;
    float _390 = in.m_57.x;
    float _392 = in.m_57.y;
    float _394 = in.m_57.z;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _398 = _322 + _396;
    float _400 = _386 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _402 = _380 * _366;
    float _404 = fma(_124, 0.00999999977648258209228515625, _388);
    float _406 = fma(_124, _400, _388);
    float _408 = _398 * _360;
    float _410 = _332 * _376;
    float _412 = fma(_150, _328, _382);
    float _414 = fma(_154, _328, _384);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _424;
    float _428 = _250 * _250;
    float _430 = fma(_418, _408, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _432 = fma(_422, _408, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _434 = fma(_426, _408, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _436 = fma(_252, _252, _428);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _450 = fma(_254, _254, _436);
    bool _452 = _390 > 0.0;
    float _454 = abs(_390);
    float _456 = -_454;
    float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[191].y, _406);
    bool _460 = _390 >= 0.0;
    bool _462 = isnan(_390);
    bool _464 = _460 || _462;
    bool _466 = isnan(0.0);
    bool _468 = _464 || _466;
    float _470 = fma(_440, _402, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _472 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _474 = isnan(_322);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = rsqrt(_450);
    int _486 = _468 ? 0 : 1;
    float _488 = _458 * 0.15915493667125701904296875;
    bool _490 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _492 = isnan(_322);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = fma(_444, _402, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _504 = ~_486;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    float _510 = fma(_448, _402, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _512 = -_482;
    float _514 = _512 + 1.0;
    int _516 = _508;
    float _518 = _326;
    float _520 = _324;
    if (!_452)
    {
        int _522 = ~_486;
        int _524 = _522 + 1;
        _516 = _524;
    }
    int _526 = _516;
    float _528 = -_500;
    float _530 = _528 + 1.0;
    bool _532 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _534 = isnan(_322);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = _488 * 6.283185482025146484375;
    float _546 = cos(_544);
    float _548 = _404 * 0.15915493667125701904296875;
    float _550 = _358 * _530;
    float _552 = abs(_390);
    float _554 = -_552;
    float _556 = _554 + 1.0;
    float _558 = _542 * _514;
    float _560 = _250 * _484;
    float _562 = -_542;
    float _564 = _562 + 1.0;
    float _566 = _252 * _484;
    float _568 = _488 * 6.283185482025146484375;
    float _570 = sin(_568);
    float _572 = _500 * _564;
    float _574 = fma(_364, _410, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _576 = -_556;
    float _578 = fma(_576, _556, 1.0);
    float _580 = _254 * _484;
    float _582 = float(_526);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _584;
    float _588 = _548 * 6.283185482025146484375;
    float _590 = sin(_588);
    float _592 = _432 * _550;
    float _594 = _560 * _284;
    float _596 = _546 * _578;
    float _598 = _430 * _550;
    float _600 = _434 * _550;
    float _602 = fma(_566, _278, _594);
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _606 = _582 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _608 = fma(_580, _290, _602);
    float _610 = _604 * 0.15915493667125701904296875;
    float _612 = -_358;
    float _614 = _612 + 1.0;
    float _616 = _570 * _606;
    float _618 = _596 * _606;
    float _620 = abs(_608);
    bool _622 = _620 > 0.99989998340606689453125;
    float _624 = fma(_590, 2.0, 2.0);
    float _626 = precise::clamp(_624, 0.0, 1.0);
    float _628 = _610 * 6.283185482025146484375;
    float _630 = cos(_628);
    float _632 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].x, _598);
    float _634 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].y, _592);
    float _636 = fma(_586, _410, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _638 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[143].z, _600);
    float _640 = fma(_370, _410, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _642 = _616 * 0.15915493667125701904296875;
    float _644 = _610 * 6.283185482025146484375;
    float _646 = sin(_644);
    float _648 = _618 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _650 = fma(_470, _572, _632);
    float _652 = fma(_502, _572, _634);
    float _654 = fma(_510, _572, _638);
    if (_622)
    {
        float _656 = _278 + _266;
        _280 = _656;
    }
    float _658 = _280;
    if (_622)
    {
        float _660 = _284 + _270;
        _286 = _660;
    }
    float _662 = _286;
    if (_622)
    {
        float _664 = _290 + _274;
        _294 = _664;
    }
    float _666 = _294;
    float _668 = _642 * 6.283185482025146484375;
    float _670 = cos(_668);
    float _672 = in.m_59.x;
    float _674 = in.m_59.y;
    float _676 = in.m_59.z;
    float _678 = _648 * 0.15915493667125701904296875;
    float _680 = fma(_626, 0.949999988079071044921875, -1.0);
    float _682 = fma(_640, _558, _654);
    float _684 = -_658;
    float _686 = _580 * _684;
    float _688 = fma(_636, _558, _650);
    float _690 = _642 * 6.283185482025146484375;
    float _692 = sin(_690);
    float _694 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[192].z, 1.0);
    float _696 = fma(_574, _558, _652);
    float _698 = -_666;
    float _700 = _560 * _698;
    float _702 = -_662;
    float _704 = _566 * _702;
    float _706 = -_666;
    float _708 = -_686;
    float _710 = fma(_566, _706, _708);
    float _712 = _630 * _394;
    float _714 = in.m_61.x;
    float _716 = _678 * 6.283185482025146484375;
    float _718 = sin(_716);
    float _720 = _406 * 0.15915493667125701904296875;
    float _722 = -_658;
    float _724 = -_704;
    float _726 = fma(_560, _722, _724);
    float _728 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[146].x, _688);
    float _730 = -_662;
    float _732 = -_700;
    float _734 = fma(_580, _730, _732);
    float _736 = _710 * _710;
    float _738 = fma(_646, _392, _712);
    float _740 = _646 * _394;
    float _742 = _678 * 6.283185482025146484375;
    float _744 = cos(_742);
    float _746 = _670 * _390;
    float _748 = _728 * _672;
    float _750 = -_740;
    float _752 = fma(_630, _392, _750);
    float _754 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[146].y, _696);
    float _756 = fma(_738, _692, _746);
    float _758 = _692 * _390;
    float _760 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[146].z, _682);
    float _762 = _752 * _718;
    float _764 = fma(_734, _734, _736);
    float _766 = _720 * 6.283185482025146484375;
    float _768 = sin(_766);
    float _770 = _754 * _674;
    float _772 = -_758;
    float _774 = fma(_738, _670, _772);
    float _776 = fma(_726, _726, _764);
    float _778 = _760 * _676;
    float _780 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _782 = _752 * _744;
    float _784 = -_762;
    float _786 = fma(_756, _744, _784);
    float _788 = -_774;
    float _790 = _788 + _394;
    float _792 = rsqrt(_776);
    float _794 = fma(_756, _718, _782);
    float _796 = -_786;
    float _798 = _796 + _390;
    float _800 = fma(_790, _714, _774);
    float _802 = in.m_51.w;
    float _804 = -_794;
    float _806 = _804 + _392;
    float _808 = fma(_798, _714, _786);
    float _810 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[191].w, _800);
    float _812 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _814 = fma(_806, _714, _794);
    float _816 = -_390;
    float _818 = _808 + _816;
    float _820 = -_394;
    float _822 = _810 + _820;
    float _824 = _778 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _826 = -_392;
    float _828 = _814 + _826;
    float _830 = fma(_694, _818, _390);
    float _832 = _734 * _792;
    float _834 = fma(_694, _828, _392);
    float _836 = in.m_49.w;
    float _838 = _710 * _792;
    float _840 = fma(_694, _822, _394);
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _834);
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _830);
    float _846 = _726 * _792;
    float _848 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _840);
    float _850 = _780 * _842;
    float _852 = _812 * _844;
    float _854 = _566 * _838;
    float _856 = _824 * _848;
    float _858 = _850 * _580;
    float _860 = _560 * _846;
    float _862 = -_854;
    float _864 = fma(_560, _832, _862);
    float _866 = _850 * _566;
    float _868 = fma(_852, _846, _858);
    float _870 = _414 + _802;
    float _872 = -_860;
    float _874 = fma(_580, _838, _872);
    float _876 = fma(_852, _832, _866);
    float _878 = fma(_856, _864, _868);
    float _880 = _152 * _326;
    float _882 = _580 * _832;
    float _884 = fma(_856, _874, _876);
    float _886 = _870 + _878;
    float _888 = _412 + _836;
    float _890 = in.m_47.w;
    float _892 = fma(_162, _324, _880);
    float _894 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _896 = _886 + _894;
    float _898 = _888 + _884;
    float _900 = _850 * _560;
    float _902 = fma(_146, _328, _892);
    float _904 = _896 * _896;
    float _906 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _908 = _898 + _906;
    float _910 = -_882;
    float _912 = fma(_566, _846, _910);
    float _914 = fma(_852, _838, _900);
    bool _916 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _918 = isnan(0.5);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _924 = _920 || _922;
    float _926 = fma(_908, _908, _904);
    float _928 = fma(_856, _912, _914);
    float _930 = sqrt(_926);
    float _932 = _902 + _890;
    float _934 = _932 + _928;
    bool _936 = _930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_936)
    {
        _518 = _898;
    }
    float _938 = _518;
    float _940 = _938;
    if (!_936)
    {
        _520 = _886;
    }
    float _942 = _520;
    float _944 = _942;
    if (!_936)
    {
        _196 = _934;
    }
    float _946 = _196;
    bool _948 = !_936;
    float _950 = _946;
    if (!_948)
    {
        float _952 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _954 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _956 = _930 + _954;
        float _958 = rsqrt(_926);
        float _960 = _956 * _952;
        float _962 = _934 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _964 = _960 * 0.15915493667125701904296875;
        float _966 = _964 * 6.283185482025146484375;
        float _968 = sin(_966);
        float _970 = _964 * 6.283185482025146484375;
        float _972 = cos(_970);
        float _974 = fma(_968, _962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _976 = _958 * _974;
        float _978 = _972 + (-1.0);
        float _980 = fma(_908, _976, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _982 = fma(_896, _976, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _984 = _978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _986 = fma(_934, _972, _984);
        _950 = _986;
        _940 = _980;
        _944 = _982;
    }
    float _988 = _950;
    float _990 = _940;
    float _992 = _944;
    float _994 = _988;
    float _996 = _990;
    float _998 = _992;
    if (!_924)
    {
        float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1002 = _932 + _1000;
        float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1006 = _888 + _1004;
        float _1008 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1010 = -_932;
        float _1012 = _1010 + _988;
        float _1014 = _1002 * _1002;
        float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1018 = _870 + _1016;
        float _1020 = fma(_1006, _1006, _1014);
        float _1022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1024 = fma(_1018, _1018, _1020);
        float _1026 = sqrt(_1024);
        float _1028 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1030 = precise::min(_1026, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1032 = _1030 * _1022;
        float _1034 = -_888;
        float _1036 = _1034 + _990;
        float _1038 = _1028 * _1032;
        float _1040 = -_870;
        float _1042 = _1040 + _992;
        float _1044 = fma(_1036, _1038, _888);
        float _1046 = fma(_1012, _1038, _932);
        float _1048 = fma(_1042, _1038, _870);
        _994 = _1046;
        _996 = _1044;
        _998 = _1048;
    }
    float _1050 = _994;
    float _1052 = _996;
    float _1054 = _998;
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1058 = _1050 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1062 = _1052 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1066 = _1054 + _1064;
    float _1068 = _1058 * _1058;
    float _1070 = fma(_1062, _1062, _1068);
    float _1072 = fma(_1066, _1066, _1070);
    float _1074 = rsqrt(_1072);
    float _1076 = sqrt(_1072);
    float _1078 = _1074 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1080 = _1062 * _1078;
    float _1082 = _1066 * _1078;
    float _1084 = _1080 * _1080;
    float _1086 = _1082 * _1082;
    float _1088 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1090 = _1084 + _1086;
    float _1092 = precise::max(0.0, _1088);
    float _1094 = sqrt(_1090);
    float _1096 = -_1078;
    float _1098 = -_1092;
    float _1100 = fma(_1058, _1096, _1098);
    bool _1102 = _1094 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1104 = _1058;
    float _1106 = _1092;
    float _1108 = _1084;
    float _1110 = _1080;
    float _1112 = _1082;
    if (!_1102)
    {
        _1104 = _1084;
    }
    float _1114 = _1104;
    float _1116 = _1114;
    if (!_1102)
    {
        _1106 = _1086;
    }
    float _1118 = _1106;
    float _1120 = _1118;
    if (!_1102)
    {
        _1108 = _1100;
    }
    float _1122 = _1108;
    bool _1124 = !_1102;
    float _1126 = _1122;
    if (!_1124)
    {
        float _1128 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1132 = _1094 + _1130;
        float _1134 = rsqrt(_1090);
        float _1136 = _1132 * _1128;
        float _1138 = _1100 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1140 = _1136 * 0.15915493667125701904296875;
        float _1142 = _1140 * 6.283185482025146484375;
        float _1144 = sin(_1142);
        float _1146 = _1140 * 6.283185482025146484375;
        float _1148 = cos(_1146);
        float _1150 = fma(_1144, _1138, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1152 = _1134 * _1150;
        float _1154 = _1148 + (-1.0);
        float _1156 = _1080 * _1152;
        float _1158 = _1082 * _1152;
        float _1160 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1162 = _1158 * _1158;
        float _1164 = fma(_1100, _1148, _1160);
        float _1166 = _1156 * _1156;
        _1126 = _1164;
        _1116 = _1166;
        _1120 = _1162;
        _1110 = _1156;
        _1112 = _1158;
    }
    float _1168 = _1126;
    float _1170 = _1116;
    float _1172 = _1120;
    float _1174 = _1110;
    float _1176 = _1112;
    float _1178 = fma(_1168, _1168, _1170);
    float _1180 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1182 = _1178 + _1172;
    float _1184 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1186 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1188 = fma(_1076, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1186);
    float _1190 = precise::clamp(_1188, 0.0, 1.0);
    float _1192 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1194 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1184);
    float _1196 = rsqrt(_1182);
    float _1198 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1200 = -_1190;
    float _1202 = _1200 + 1.0;
    float _1204 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1194);
    float _1206 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1208 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1198);
    float _1210 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1180);
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1214 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1206);
    float _1216 = abs(_1202);
    float _1218 = log2(_1216);
    float _1220 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1208);
    float _1222 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1210);
    float _1224 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1214);
    float _1226 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1228 = _1220 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1230 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1232 = _1196 * _1174;
    float _1234 = _1196 * _1168;
    float _1236 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1238 = _1196 * _1176;
    float _1240 = _1232 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1242 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1244 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1236);
    float _1246 = -_1226;
    float _1248 = fma(_1192, _1246, 1.0);
    float _1250 = -_1240;
    float _1252 = fma(_1234, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1250);
    float _1254 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1256 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1244);
    float _1258 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1260 = -_1238;
    float _1262 = fma(_1260, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1252);
    float _1264 = log2(_1248);
    float _1266 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1256);
    float _1268 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1270 = fma(_1262, -0.5, 0.5);
    float _1272 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1258);
    float _1274 = fma(_1262, 0.5, 0.5);
    float _1276 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1268);
    float _1278 = _1234 + 1.0;
    float _1280 = exp2(_1254);
    float _1282 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1272);
    float _1284 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1276);
    float _1286 = fma(_1274, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1288 = 1.0 / _1266;
    float _1290 = _1264 * 0.693147182464599609375;
    float _1292 = fma(_1274, _1286, -0.212114393711090087890625);
    float _1294 = _1290 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1296 = fma(_1274, _1292, 1.570728778839111328125);
    float _1298 = sqrt(_1270);
    float _1300 = -_1234;
    float _1302 = fma(_1280, _1278, _1300);
    float _1304 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1282);
    float _1306 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1284);
    float _1308 = fma(_1302, 0.5, 0.5);
    float _1310 = _1304 * _1288;
    float _1312 = _1306 * _1288;
    float _1314 = fma(_1310, 0.5, 0.5);
    float _1316 = fma(_1312, -0.5, 0.5);
    float _1318 = _1298 * 0.636619746685028076171875;
    float3 _3325 = float3(_1314, _1316, _1294);
    float _1320 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3325, float3(0.0), isnan(_3325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3325, float3(0.0), isnan(_3325)), level(0.0)).x;
    float _1322 = -_1296;
    float _1324 = fma(_1318, _1322, 1.0);
    float2 _3341 = float2(_1324, _1308);
    float3 _1328 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3341, float2(0.0), isnan(_3341)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3341, float2(0.0), isnan(_3341)), level(0.0)).xyz;
    float _1330 = _1328.x;
    float _1332 = _1328.y;
    float _1334 = _1328.z;
    float _1336 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1338 = in.m_61.w;
    float _1340 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1336);
    float _1342 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_63.w = _1266;
    float _1344 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1340);
    float _1346 = exp2(_1342);
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1356 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1358 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1344);
    float _1360 = _1266 * 0.5;
    float _1362 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1304;
    out.gl_Position.y = _1306;
    out.gl_Position.z = _1358;
    out.gl_Position.w = _1266;
    float _1366 = _1304 + _1266;
    float _1368 = fma(_1306, -0.5, _1360);
    float _1370 = -_1346;
    float _1372 = _1370 + 1.0;
    float _1374 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1376 = _1366 * 0.5;
    out.m_65.w = _1338;
    float _1378 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1356;
    out.m_67.y = _1364;
    out.m_67.z = _1362;
    out.m_67.w = _1348;
    float _1380 = -_1378;
    float _1382 = _1380 + 1.0;
    out.m_63.x = _1376;
    out.m_63.y = _1368;
    out.m_69.w = _1374;
    float _1384 = _1378 * _1320;
    float _1386 = _1330 * _1384;
    float _1388 = _1332 * _1384;
    float _1390 = _1334 * _1384;
    out.m_71.x = _1386;
    out.m_71.y = _1388;
    out.m_71.z = _1390;
    out.m_71.w = _1382;
    out.m_43.x = 1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

