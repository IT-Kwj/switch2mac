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
    float4 m_61 [[user(locn0)]];
    float4 m_63 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_65 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_42.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_88)
    {
        out.m_45.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _92 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1384 = as_type<float>(_100);
        out.gl_Position.z = _1384;
    }
    if (!_88)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _104 = in.m_47.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _120 = _118;
    if (_114)
    {
        float _122 = float(_84);
        _94 = _122;
    }
    float _124 = _94;
    bool _126 = _118 >= _124;
    bool _128 = !_114;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _102 = as_type<int>(_136);
    }
    int _138 = _102;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1454 = as_type<float>(_138);
        out.gl_Position.z = _1454;
    }
    if (_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_49.w;
    float _142 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_47.x;
    float _156 = in.m_47.y;
    float _158 = in.m_47.z;
    float _160 = in.m_42.x;
    float _162 = in.m_42.y;
    float _164 = in.m_42.z;
    float _166 = 0.0;
    float _168 = _142;
    if (!_152)
    {
        float _170 = _142 * _142;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_152)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_152;
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_240, _156, _246);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    bool _262 = !_242;
    float _280;
    if (!_262)
    {
        float _264 = in.m_51.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        float _284 = float(_84);
        float _286 = 1.0 / _284;
        float _288 = _118 * _286;
        _280 = _288;
    }
    _282 = false;
    float _290 = _280;
    float _292 = in.m_51.x;
    float _294 = in.m_51.y;
    float _296 = in.m_51.z;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _304 = _302 != 0;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _308 = _306 != 0;
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _312 = _310 != 0;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = _290 + _314;
    float _318 = 1.0 / _300;
    float _320 = _292 * 2.0;
    float _322 = _296 * 2.0;
    float _324 = _294 * 2.0;
    float _326 = _296 + _292;
    float _328 = _294 + _292;
    float _330 = floor(_322);
    float _332 = _292 + (-0.5);
    float _334 = _294 + _296;
    float _336 = _316 * _318;
    float _338 = _296 + (-0.5);
    float _340 = _334 + (-1.0);
    float _342 = _326 + (-1.0);
    float _344 = floor(_320);
    float _346 = _294 + (-0.5);
    float _348 = _328 + (-1.0);
    float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _352 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _354 = log2(_352);
    bool _356 = _330 > 0.0;
    bool _358 = _330 >= 0.0;
    bool _360 = isnan(_330);
    bool _362 = _358 || _360;
    bool _364 = isnan(0.0);
    bool _366 = _362 || _364;
    float _368 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _370 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _372 = floor(_324);
    bool _374 = _344 > 0.0;
    bool _376 = _344 >= 0.0;
    bool _378 = isnan(_344);
    bool _380 = _376 || _378;
    bool _382 = isnan(0.0);
    bool _384 = _380 || _382;
    int _386 = _366 ? 0 : 1;
    int _388 = _384 ? 0 : 1;
    float _390 = _354 * _118;
    int _392 = ~_386;
    int _394 = _392 + 1;
    int _396 = _394 + 1;
    int _398 = ~_388;
    int _400 = _398 + 1;
    int _402 = _400 + 1;
    int _404 = _396;
    int _406 = _402;
    if (!_356)
    {
        int _408 = ~_386;
        int _410 = _408 + 1;
        _404 = _410;
    }
    int _412 = _404;
    float _414 = exp2(_390);
    if (!_374)
    {
        int _416 = ~_388;
        int _418 = _416 + 1;
        _406 = _418;
    }
    int _420 = _406;
    bool _422 = !_304;
    int _424 = _422 ? 0 : 1;
    float _426 = in.m_53.x;
    float _428 = in.m_53.y;
    float _430 = in.m_53.z;
    bool _432 = _372 > 0.0;
    bool _434 = _372 >= 0.0;
    bool _436 = isnan(_372);
    bool _438 = _434 || _436;
    bool _440 = isnan(0.0);
    bool _442 = _438 || _440;
    bool _444 = !_308;
    int _446 = _444 ? 0 : 1;
    int _448 = abs(_424);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _452 = 1.0 + _450;
    int _454 = abs(_446);
    float _456 = 1.0 / _452;
    float _458 = float(_412);
    float _460 = -_414;
    float _462 = _460 + 1.0;
    float _464 = float(_448);
    float _466 = float(_454);
    float _468 = float(_420);
    float _470 = _464 * _458;
    bool _472 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _474 = isnan(1.0);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _480 = _476 || _478;
    bool _482 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _490 = _486 || _488;
    float _492 = _466 * _468;
    float _494 = _470 * (-2.0);
    int _496 = _442 ? 0 : 1;
    float _498 = _492 * (-2.0);
    float _500 = fma(_494, _426, _426);
    float _502 = _490 ? _462 : 0.0;
    float _504 = fma(_498, _428, _428);
    float _506 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[196].x, _500);
    bool _508 = !_312;
    int _510 = _508 ? 0 : 1;
    float _512 = fma(_368, _498, _368);
    float _514 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[196].y, _504);
    if (_480)
    {
        float _516 = _502 * _456;
        _120 = _516;
    }
    float _518 = _120;
    int _520 = abs(_510);
    float _522 = fma(_350, _494, _350);
    int _524 = ~_496;
    int _526 = _524 + 1;
    int _528 = _526 + 1;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _530;
    int _534 = _528;
    if (!_432)
    {
        int _536 = ~_496;
        int _538 = _536 + 1;
        _534 = _538;
    }
    int _540 = _534;
    float _542 = fma(_522, _518, _506);
    float _544 = fma(_512, _518, _514);
    float _546 = float(_540);
    float _548 = _542 * 0.15915493667125701904296875;
    float _550 = float(_520);
    float _552 = fma(_532, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _554 = _544 * 0.15915493667125701904296875;
    float _556 = _550 * _546;
    bool _558 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _560 = isnan(_290);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _570;
    bool _574 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _576 = isnan(_290);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _586;
    float _590 = _556 * (-2.0);
    float _592 = fma(_572, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _594 = -_568;
    float _596 = _594 + 1.0;
    float _598 = fma(_588, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _600 = fma(_590, _430, _430);
    float _602 = in.m_49.x;
    float _604 = in.m_49.y;
    float _606 = in.m_49.z;
    float _608 = _584 * _596;
    float _610 = fma(_370, _590, _370);
    float _612 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[196].z, _600);
    float _614 = in.m_55.x;
    float _616 = in.m_55.y;
    float _618 = in.m_55.z;
    float _620 = -_584;
    float _622 = _620 + 1.0;
    float _624 = _552 * _608;
    float _626 = _592 * _608;
    float _628 = fma(_610, _518, _612);
    float _630 = _598 * _608;
    float _632 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].x, _624);
    float _634 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].y, _626);
    float _636 = _628 * 0.15915493667125701904296875;
    float _638 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[144].x, _632);
    float _640 = _548 * 6.283185482025146484375;
    float _642 = sin(_640);
    float _644 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].z, _630);
    float _646 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[144].y, _634);
    bool _648 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _650 = isnan(0.5);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _656 = _652 || _654;
    float _658 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[144].z, _644);
    float _660 = _548 * 6.283185482025146484375;
    float _662 = cos(_660);
    float _664 = _638 * _602;
    float _666 = _646 * _604;
    float _668 = _658 * _606;
    float _670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _614);
    float _672 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _616);
    float _674 = _666 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _676 = _554 * 6.283185482025146484375;
    float _678 = sin(_676);
    float _680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _618);
    float _682 = _664 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _684 = _668 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _686 = _674 * _672;
    float _688 = _682 * _670;
    float _690 = _684 * _680;
    float _692 = _554 * 6.283185482025146484375;
    float _694 = cos(_692);
    float _696 = _636 * 6.283185482025146484375;
    float _698 = cos(_696);
    float _700 = _662 * _678;
    float _702 = _642 * _678;
    float _704 = _636 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = _642 * _694;
    float _710 = _662 * _694;
    float _712 = _698 * _686;
    float _714 = _678 * _698;
    float _716 = _694 * _698;
    float _718 = _662 * _712;
    float _720 = _642 * _712;
    float _722 = -_700;
    float _724 = fma(_706, _708, _722);
    float _726 = -_708;
    float _728 = fma(_706, _700, _726);
    float _730 = fma(_706, _710, _702);
    float _732 = -_686;
    float _734 = _706 * _732;
    float _736 = fma(_706, _702, _710);
    float _738 = fma(_724, _688, _720);
    float _740 = fma(_730, _688, _718);
    float _742 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _744 = fma(_716, _688, _734);
    float _746 = fma(_736, _690, _738);
    float _748 = fma(_728, _690, _740);
    float _750 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _752 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _742);
    float _754 = fma(_714, _690, _744);
    float _756 = _748 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _758 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _750);
    float _760 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _752);
    float _762 = _748 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _764 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[10].x, _756);
    float _766 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _758);
    float _768 = _760 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _770 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[8].x, _762);
    float _772 = fma(_746, (*spvDescriptorSet0.vp_c10)._m0[10].z, _764);
    float _774 = _766 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _776 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _778 = fma(_746, (*spvDescriptorSet0.vp_c10)._m0[8].z, _770);
    float _780 = _768 + _772;
    float _782 = _748 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _784 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _776);
    float _786 = _774 + _778;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _790 = _780 + _788;
    float _792 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[9].x, _782);
    float _794 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _784);
    float _796 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _798 = _786 + _796;
    float _800 = _790 * _790;
    float _802 = fma(_746, (*spvDescriptorSet0.vp_c10)._m0[9].z, _792);
    float _804 = _794 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _806 = fma(_798, _798, _800);
    float _808 = _804 + _802;
    float _810 = sqrt(_806);
    bool _812 = _810 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _814 = _782;
    float _816 = _786;
    float _818 = _780;
    float _820 = _804;
    float _822 = _798;
    float _824 = _712;
    if (!_812)
    {
        _814 = _786;
    }
    float _826 = _814;
    float _828 = _826;
    if (!_812)
    {
        _816 = _808;
    }
    float _830 = _816;
    bool _832 = !_812;
    float _834 = _830;
    if (!_832)
    {
        float _836 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _838 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _840 = _810 + _838;
        float _842 = rsqrt(_806);
        float _844 = _840 * _836;
        float _846 = _808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _848 = _844 * 0.15915493667125701904296875;
        float _850 = _848 * 6.283185482025146484375;
        float _852 = cos(_850);
        float _854 = _848 * 6.283185482025146484375;
        float _856 = sin(_854);
        float _858 = _852 + (-1.0);
        float _860 = _858 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _862 = fma(_856, _846, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _864 = fma(_808, _852, _860);
        float _866 = _842 * _862;
        float _868 = fma(_798, _866, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _870 = fma(_790, _866, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _828 = _868;
        _834 = _864;
        _818 = _870;
    }
    float _872 = _828;
    float _874 = _834;
    float _876 = _818;
    float _878 = _874;
    float _880 = _872;
    float _882 = _876;
    if (!_656)
    {
        float _884 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _886 = _804 + _884;
        float _888 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _890 = _774 + _888;
        float _892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _894 = -_774;
        float _896 = _894 + _872;
        float _898 = _886 * _886;
        float _900 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _902 = _768 + _900;
        float _904 = -_804;
        float _906 = _904 + _874;
        float _908 = -_768;
        float _910 = _908 + _876;
        float _912 = fma(_890, _890, _898);
        float _914 = fma(_902, _902, _912);
        float _916 = sqrt(_914);
        float _918 = precise::min(_916, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _920 = _918 * _892;
        float _922 = fma(_896, _920, _774);
        float _924 = fma(_906, _920, _804);
        float _926 = fma(_910, _920, _768);
        _878 = _924;
        _880 = _922;
        _882 = _926;
    }
    float _928 = _878;
    float _930 = _880;
    float _932 = _882;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _936 = _928 + _934;
    float _938 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _940 = _930 + _938;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _944 = _932 + _942;
    float _946 = _936 * _936;
    float _948 = fma(_940, _940, _946);
    float _950 = fma(_944, _944, _948);
    float _952 = rsqrt(_950);
    float _954 = sqrt(_950);
    float _956 = _952 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _958 = _940 * _956;
    float _960 = _944 * _956;
    float _962 = _958 * _958;
    float _964 = _960 * _960;
    float _966 = _962 + _964;
    float _968 = sqrt(_966);
    bool _970 = _968 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _972 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _974 = _968 + _972;
    float _976 = _952;
    float _978 = _974;
    float _980 = _936;
    float _982 = _958;
    if (_970)
    {
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _976 = _984;
    }
    float _986 = _976;
    if (_970)
    {
        float _988 = rsqrt(_966);
        _820 = _988;
    }
    float _990 = _820;
    float _992 = _990;
    if (_970)
    {
        float _994 = _974 * _986;
        _978 = _994;
    }
    float _996 = _978;
    if (_970)
    {
        float _998 = _996 * 0.15915493667125701904296875;
        _822 = _998;
    }
    float _1000 = _822;
    float _1002 = _986;
    float _1004 = _1000;
    if (_970)
    {
        float _1006 = _1000 * 6.283185482025146484375;
        float _1008 = sin(_1006);
        _1002 = _1008;
    }
    float _1010 = _1002;
    float _1012 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1014 = precise::max(0.0, _1012);
    float _1016 = _944;
    float _1018 = _1014;
    if (_970)
    {
        float _1020 = _1000 * 6.283185482025146484375;
        float _1022 = cos(_1020);
        _1016 = _1022;
    }
    float _1024 = _1016;
    float _1026 = -_956;
    float _1028 = -_1014;
    float _1030 = fma(_936, _1026, _1028);
    if (!_970)
    {
        _980 = _962;
    }
    float _1032 = _980;
    float _1034 = _1032;
    if (_970)
    {
        float _1036 = _1030 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1018 = _1036;
    }
    float _1038 = _1018;
    float _1040 = _1010;
    float _1042 = _1038;
    if (_970)
    {
        float _1044 = fma(_1010, _1038, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1040 = _1044;
    }
    float _1046 = _1040;
    float _1048 = _1046;
    if (_970)
    {
        float _1050 = _1024 + (-1.0);
        _1042 = _1050;
    }
    float _1052 = _1042;
    float _1054 = _1052;
    if (_970)
    {
        float _1056 = _990 * _1046;
        _824 = _1056;
    }
    float _1058 = _824;
    if (!_970)
    {
        _992 = _1030;
    }
    float _1060 = _992;
    float _1062 = _1060;
    if (_970)
    {
        float _1064 = _1052 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1004 = _1064;
    }
    float _1066 = _1004;
    if (_970)
    {
        float _1068 = _958 * _1058;
        _982 = _1068;
    }
    float _1070 = _982;
    if (!_970)
    {
        _1048 = _960;
    }
    float _1072 = _1048;
    float _1074 = _1072;
    if (_970)
    {
        float _1076 = _960 * _1058;
        _1074 = _1076;
    }
    float _1078 = _1074;
    if (_970)
    {
        float _1080 = fma(_1030, _1024, _1066);
        _1062 = _1080;
    }
    float _1082 = _1062;
    if (_970)
    {
        float _1084 = _1070 * _1070;
        _1034 = _1084;
    }
    float _1086 = _1034;
    if (!_970)
    {
        _1054 = _964;
    }
    float _1088 = _1054;
    float _1090 = _1088;
    if (_970)
    {
        float _1092 = _1078 * _1078;
        _1090 = _1092;
    }
    float _1094 = _1090;
    float _1096 = fma(_1082, _1082, _1086);
    float _1098 = _928 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1100 = _1096 + _1094;
    float _1102 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1098);
    float _1104 = _928 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1108 = fma(_954, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1106);
    float _1110 = precise::clamp(_1108, 0.0, 1.0);
    float _1112 = rsqrt(_1100);
    float _1114 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1116 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1102);
    float _1118 = _928 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1120 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1104);
    float _1122 = _928 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1124 = -_1110;
    float _1126 = _1124 + 1.0;
    float _1128 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1130 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1118);
    float _1132 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1120);
    float _1134 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1122);
    float _1136 = abs(_1126);
    float _1138 = log2(_1136);
    float _1140 = _1128 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1142 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1130);
    float _1144 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1146 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1134);
    float _1148 = _1112 * _1070;
    float _1150 = -_1140;
    float _1152 = fma(_1150, _1114, 1.0);
    float _1154 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1156 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1158 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1160 = _1112 * _1082;
    float _1162 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1164 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1156);
    float _1166 = _1112 * _1078;
    float _1168 = log2(_1152);
    float _1170 = -_1162;
    float _1172 = fma(_1160, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1170);
    float _1174 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1164);
    float _1176 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1178 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1180 = -_1166;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1172);
    float _1184 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1174);
    float _1186 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1188 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1178);
    float _1190 = fma(_1182, -0.5, 0.5);
    float _1192 = exp2(_1176);
    float _1194 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1186);
    float _1196 = fma(_1182, 0.5, 0.5);
    float _1198 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1188);
    float _1200 = _1160 + 1.0;
    float _1202 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1194);
    float _1204 = fma(_1196, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1206 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1198);
    float _1208 = 1.0 / _1184;
    float _1210 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1202);
    float _1212 = fma(_1196, _1204, -0.212114393711090087890625);
    float _1214 = _1168 * 0.693147182464599609375;
    float _1216 = fma(_1196, _1212, 1.570728778839111328125);
    float _1218 = sqrt(_1190);
    float _1220 = -_1160;
    float _1222 = fma(_1192, _1200, _1220);
    float _1224 = fma(_1222, 0.5, 0.5);
    float _1226 = _1206 * _1208;
    float _1228 = _1210 * _1208;
    float _1230 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1232 = fma(_1226, 0.5, 0.5);
    float _1234 = fma(_1228, -0.5, 0.5);
    float _1236 = _1218 * 0.636619746685028076171875;
    float3 _3158 = float3(_1232, _1234, _1230);
    float _1238 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3158, float3(0.0), isnan(_3158)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3158, float3(0.0), isnan(_3158)), level(0.0)).x;
    float3 _3169 = float3(_1232, _1234, _1230);
    float4 _1241 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3169, float3(0.0), isnan(_3169)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3169, float3(0.0), isnan(_3169)), level(0.0)).xyzw;
    float _1243 = _1241.x;
    float _1245 = _1241.y;
    float _1247 = _1241.z;
    float _1249 = _1241.w;
    float _1251 = -_1216;
    float _1253 = fma(_1236, _1251, 1.0);
    float2 _3191 = float2(_1253, _1224);
    float3 _1257 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3191, float2(0.0), isnan(_3191)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3191, float2(0.0), isnan(_3191)), level(0.0)).xyz;
    float _1259 = _1257.x;
    float _1261 = _1257.y;
    float _1263 = _1257.z;
    float _1265 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1267 = in.m_57.x;
    float _1269 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1271 = exp2(_1265);
    float _1273 = in.m_57.z;
    float _1275 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1269);
    float _1277 = in.m_57.y;
    float _1279 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1275);
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1283 = in.m_57.w;
    float _1285 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1279);
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = _1285 + _1184;
    float _1293 = -_1271;
    float _1295 = _1293 + 1.0;
    float _1297 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1291 * 0.5;
    float _1301 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_59.x = _1267;
    out.m_59.z = _1273;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_59.y = _1277;
    float _1305 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.w = _1283;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1309 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1206;
    out.gl_Position.y = _1210;
    out.gl_Position.z = _1285;
    out.gl_Position.w = _1184;
    out.m_61.x = _1289;
    out.m_61.y = _1297;
    out.m_61.z = _1305;
    out.m_61.w = _1307;
    out.m_63.z = _1299;
    out.m_63.w = _1184;
    out.m_45.x = _1309;
    float _1311 = _1301 * _1238;
    float _1313 = -_1301;
    float _1315 = _1313 + 1.0;
    float _1317 = _1249 * _1311;
    float _1319 = _1263 * _1311;
    float _1321 = fma(_1259, _1317, _1243);
    float _1323 = fma(_1261, _1317, _1245);
    float _1325 = _1249 * _1315;
    float _1327 = fma(_1249, _1319, _1247);
    out.m_65.x = _1321;
    out.m_65.y = _1323;
    out.m_65.z = _1327;
    out.m_65.w = _1325;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_42.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_88)
    {
        out.m_45.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _92 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1384 = as_type<float>(_100);
        out.gl_Position.z = _1384;
    }
    if (!_88)
    {
        return out;
    }
    float _104 = in.m_47.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _120 = _118;
    if (_114)
    {
        float _122 = float(_84);
        _94 = _122;
    }
    float _124 = _94;
    bool _126 = _118 >= _124;
    bool _128 = !_114;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _102 = as_type<int>(_136);
    }
    int _138 = _102;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1454 = as_type<float>(_138);
        out.gl_Position.z = _1454;
    }
    if (_130)
    {
        return out;
    }
    float _140 = in.m_49.w;
    float _142 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_47.x;
    float _156 = in.m_47.y;
    float _158 = in.m_47.z;
    float _160 = in.m_42.x;
    float _162 = in.m_42.y;
    float _164 = in.m_42.z;
    float _166 = 0.0;
    float _168 = _142;
    if (!_152)
    {
        float _170 = _142 * _142;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_152)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_152;
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_240, _156, _246);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    bool _262 = !_242;
    float _280;
    if (!_262)
    {
        float _264 = in.m_51.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        float _284 = float(_84);
        float _286 = 1.0 / _284;
        float _288 = _118 * _286;
        _280 = _288;
    }
    _282 = false;
    float _290 = _280;
    float _292 = in.m_51.x;
    float _294 = in.m_51.y;
    float _296 = in.m_51.z;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _304 = _302 != 0;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _308 = _306 != 0;
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _312 = _310 != 0;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = _290 + _314;
    float _318 = 1.0 / _300;
    float _320 = _292 * 2.0;
    float _322 = _296 * 2.0;
    float _324 = _294 * 2.0;
    float _326 = _296 + _292;
    float _328 = _294 + _292;
    float _330 = floor(_322);
    float _332 = _292 + (-0.5);
    float _334 = _294 + _296;
    float _336 = _316 * _318;
    float _338 = _296 + (-0.5);
    float _340 = _334 + (-1.0);
    float _342 = _326 + (-1.0);
    float _344 = floor(_320);
    float _346 = _294 + (-0.5);
    float _348 = _328 + (-1.0);
    float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _352 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _354 = log2(_352);
    bool _356 = _330 > 0.0;
    bool _358 = _330 >= 0.0;
    bool _360 = isnan(_330);
    bool _362 = _358 || _360;
    bool _364 = isnan(0.0);
    bool _366 = _362 || _364;
    float _368 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _370 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _372 = floor(_324);
    bool _374 = _344 > 0.0;
    bool _376 = _344 >= 0.0;
    bool _378 = isnan(_344);
    bool _380 = _376 || _378;
    bool _382 = isnan(0.0);
    bool _384 = _380 || _382;
    int _386 = _366 ? 0 : 1;
    int _388 = _384 ? 0 : 1;
    float _390 = _354 * _118;
    int _392 = ~_386;
    int _394 = _392 + 1;
    int _396 = _394 + 1;
    int _398 = ~_388;
    int _400 = _398 + 1;
    int _402 = _400 + 1;
    int _404 = _396;
    int _406 = _402;
    if (!_356)
    {
        int _408 = ~_386;
        int _410 = _408 + 1;
        _404 = _410;
    }
    int _412 = _404;
    float _414 = exp2(_390);
    if (!_374)
    {
        int _416 = ~_388;
        int _418 = _416 + 1;
        _406 = _418;
    }
    int _420 = _406;
    bool _422 = !_304;
    int _424 = _422 ? 0 : 1;
    float _426 = in.m_53.x;
    float _428 = in.m_53.y;
    float _430 = in.m_53.z;
    bool _432 = _372 > 0.0;
    bool _434 = _372 >= 0.0;
    bool _436 = isnan(_372);
    bool _438 = _434 || _436;
    bool _440 = isnan(0.0);
    bool _442 = _438 || _440;
    bool _444 = !_308;
    int _446 = _444 ? 0 : 1;
    int _448 = abs(_424);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _452 = 1.0 + _450;
    int _454 = abs(_446);
    float _456 = 1.0 / _452;
    float _458 = float(_412);
    float _460 = -_414;
    float _462 = _460 + 1.0;
    float _464 = float(_448);
    float _466 = float(_454);
    float _468 = float(_420);
    float _470 = _464 * _458;
    bool _472 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _474 = isnan(1.0);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _480 = _476 || _478;
    bool _482 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _490 = _486 || _488;
    float _492 = _466 * _468;
    float _494 = _470 * (-2.0);
    int _496 = _442 ? 0 : 1;
    float _498 = _492 * (-2.0);
    float _500 = fma(_494, _426, _426);
    float _502 = _490 ? _462 : 0.0;
    float _504 = fma(_498, _428, _428);
    float _506 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[196].x, _500);
    bool _508 = !_312;
    int _510 = _508 ? 0 : 1;
    float _512 = fma(_368, _498, _368);
    float _514 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[196].y, _504);
    if (_480)
    {
        float _516 = _502 * _456;
        _120 = _516;
    }
    float _518 = _120;
    int _520 = abs(_510);
    float _522 = fma(_350, _494, _350);
    int _524 = ~_496;
    int _526 = _524 + 1;
    int _528 = _526 + 1;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _530;
    int _534 = _528;
    if (!_432)
    {
        int _536 = ~_496;
        int _538 = _536 + 1;
        _534 = _538;
    }
    int _540 = _534;
    float _542 = fma(_522, _518, _506);
    float _544 = fma(_512, _518, _514);
    float _546 = float(_540);
    float _548 = _542 * 0.15915493667125701904296875;
    float _550 = float(_520);
    float _552 = fma(_532, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _554 = _544 * 0.15915493667125701904296875;
    float _556 = _550 * _546;
    bool _558 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _560 = isnan(_290);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _570;
    bool _574 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _576 = isnan(_290);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _586;
    float _590 = _556 * (-2.0);
    float _592 = fma(_572, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _594 = -_568;
    float _596 = _594 + 1.0;
    float _598 = fma(_588, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _600 = fma(_590, _430, _430);
    float _602 = in.m_49.x;
    float _604 = in.m_49.y;
    float _606 = in.m_49.z;
    float _608 = _584 * _596;
    float _610 = fma(_370, _590, _370);
    float _612 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[196].z, _600);
    float _614 = in.m_55.x;
    float _616 = in.m_55.y;
    float _618 = in.m_55.z;
    float _620 = -_584;
    float _622 = _620 + 1.0;
    float _624 = _552 * _608;
    float _626 = _592 * _608;
    float _628 = fma(_610, _518, _612);
    float _630 = _598 * _608;
    float _632 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].x, _624);
    float _634 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].y, _626);
    float _636 = _628 * 0.15915493667125701904296875;
    float _638 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[144].x, _632);
    float _640 = _548 * 6.283185482025146484375;
    float _642 = sin(_640);
    float _644 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].z, _630);
    float _646 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[144].y, _634);
    bool _648 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _650 = isnan(0.5);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _656 = _652 || _654;
    float _658 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[144].z, _644);
    float _660 = _548 * 6.283185482025146484375;
    float _662 = cos(_660);
    float _664 = _638 * _602;
    float _666 = _646 * _604;
    float _668 = _658 * _606;
    float _670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _614);
    float _672 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _616);
    float _674 = _666 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _676 = _554 * 6.283185482025146484375;
    float _678 = sin(_676);
    float _680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _618);
    float _682 = _664 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _684 = _668 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _686 = _674 * _672;
    float _688 = _682 * _670;
    float _690 = _684 * _680;
    float _692 = _554 * 6.283185482025146484375;
    float _694 = cos(_692);
    float _696 = _636 * 6.283185482025146484375;
    float _698 = cos(_696);
    float _700 = _662 * _678;
    float _702 = _642 * _678;
    float _704 = _636 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = _642 * _694;
    float _710 = _662 * _694;
    float _712 = _698 * _686;
    float _714 = _678 * _698;
    float _716 = _694 * _698;
    float _718 = _662 * _712;
    float _720 = _642 * _712;
    float _722 = -_700;
    float _724 = fma(_706, _708, _722);
    float _726 = -_708;
    float _728 = fma(_706, _700, _726);
    float _730 = fma(_706, _710, _702);
    float _732 = -_686;
    float _734 = _706 * _732;
    float _736 = fma(_706, _702, _710);
    float _738 = fma(_724, _688, _720);
    float _740 = fma(_730, _688, _718);
    float _742 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _744 = fma(_716, _688, _734);
    float _746 = fma(_736, _690, _738);
    float _748 = fma(_728, _690, _740);
    float _750 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _752 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _742);
    float _754 = fma(_714, _690, _744);
    float _756 = _748 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _758 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _750);
    float _760 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _752);
    float _762 = _748 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _764 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[10].x, _756);
    float _766 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _758);
    float _768 = _760 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _770 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[8].x, _762);
    float _772 = fma(_746, (*spvDescriptorSet0.vp_c10)._m0[10].z, _764);
    float _774 = _766 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _776 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _778 = fma(_746, (*spvDescriptorSet0.vp_c10)._m0[8].z, _770);
    float _780 = _768 + _772;
    float _782 = _748 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _784 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _776);
    float _786 = _774 + _778;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _790 = _780 + _788;
    float _792 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[9].x, _782);
    float _794 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _784);
    float _796 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _798 = _786 + _796;
    float _800 = _790 * _790;
    float _802 = fma(_746, (*spvDescriptorSet0.vp_c10)._m0[9].z, _792);
    float _804 = _794 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _806 = fma(_798, _798, _800);
    float _808 = _804 + _802;
    float _810 = sqrt(_806);
    bool _812 = _810 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _814 = _782;
    float _816 = _786;
    float _818 = _780;
    float _820 = _804;
    float _822 = _798;
    float _824 = _712;
    if (!_812)
    {
        _814 = _786;
    }
    float _826 = _814;
    float _828 = _826;
    if (!_812)
    {
        _816 = _808;
    }
    float _830 = _816;
    bool _832 = !_812;
    float _834 = _830;
    if (!_832)
    {
        float _836 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _838 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _840 = _810 + _838;
        float _842 = rsqrt(_806);
        float _844 = _840 * _836;
        float _846 = _808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _848 = _844 * 0.15915493667125701904296875;
        float _850 = _848 * 6.283185482025146484375;
        float _852 = cos(_850);
        float _854 = _848 * 6.283185482025146484375;
        float _856 = sin(_854);
        float _858 = _852 + (-1.0);
        float _860 = _858 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _862 = fma(_856, _846, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _864 = fma(_808, _852, _860);
        float _866 = _842 * _862;
        float _868 = fma(_798, _866, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _870 = fma(_790, _866, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _828 = _868;
        _834 = _864;
        _818 = _870;
    }
    float _872 = _828;
    float _874 = _834;
    float _876 = _818;
    float _878 = _874;
    float _880 = _872;
    float _882 = _876;
    if (!_656)
    {
        float _884 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _886 = _804 + _884;
        float _888 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _890 = _774 + _888;
        float _892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _894 = -_774;
        float _896 = _894 + _872;
        float _898 = _886 * _886;
        float _900 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _902 = _768 + _900;
        float _904 = -_804;
        float _906 = _904 + _874;
        float _908 = -_768;
        float _910 = _908 + _876;
        float _912 = fma(_890, _890, _898);
        float _914 = fma(_902, _902, _912);
        float _916 = sqrt(_914);
        float _918 = precise::min(_916, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _920 = _918 * _892;
        float _922 = fma(_896, _920, _774);
        float _924 = fma(_906, _920, _804);
        float _926 = fma(_910, _920, _768);
        _878 = _924;
        _880 = _922;
        _882 = _926;
    }
    float _928 = _878;
    float _930 = _880;
    float _932 = _882;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _936 = _928 + _934;
    float _938 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _940 = _930 + _938;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _944 = _932 + _942;
    float _946 = _936 * _936;
    float _948 = fma(_940, _940, _946);
    float _950 = fma(_944, _944, _948);
    float _952 = rsqrt(_950);
    float _954 = sqrt(_950);
    float _956 = _952 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _958 = _940 * _956;
    float _960 = _944 * _956;
    float _962 = _958 * _958;
    float _964 = _960 * _960;
    float _966 = _962 + _964;
    float _968 = sqrt(_966);
    bool _970 = _968 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _972 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _974 = _968 + _972;
    float _976 = _952;
    float _978 = _974;
    float _980 = _936;
    float _982 = _958;
    if (_970)
    {
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _976 = _984;
    }
    float _986 = _976;
    if (_970)
    {
        float _988 = rsqrt(_966);
        _820 = _988;
    }
    float _990 = _820;
    float _992 = _990;
    if (_970)
    {
        float _994 = _974 * _986;
        _978 = _994;
    }
    float _996 = _978;
    if (_970)
    {
        float _998 = _996 * 0.15915493667125701904296875;
        _822 = _998;
    }
    float _1000 = _822;
    float _1002 = _986;
    float _1004 = _1000;
    if (_970)
    {
        float _1006 = _1000 * 6.283185482025146484375;
        float _1008 = sin(_1006);
        _1002 = _1008;
    }
    float _1010 = _1002;
    float _1012 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1014 = precise::max(0.0, _1012);
    float _1016 = _944;
    float _1018 = _1014;
    if (_970)
    {
        float _1020 = _1000 * 6.283185482025146484375;
        float _1022 = cos(_1020);
        _1016 = _1022;
    }
    float _1024 = _1016;
    float _1026 = -_956;
    float _1028 = -_1014;
    float _1030 = fma(_936, _1026, _1028);
    if (!_970)
    {
        _980 = _962;
    }
    float _1032 = _980;
    float _1034 = _1032;
    if (_970)
    {
        float _1036 = _1030 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1018 = _1036;
    }
    float _1038 = _1018;
    float _1040 = _1010;
    float _1042 = _1038;
    if (_970)
    {
        float _1044 = fma(_1010, _1038, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1040 = _1044;
    }
    float _1046 = _1040;
    float _1048 = _1046;
    if (_970)
    {
        float _1050 = _1024 + (-1.0);
        _1042 = _1050;
    }
    float _1052 = _1042;
    float _1054 = _1052;
    if (_970)
    {
        float _1056 = _990 * _1046;
        _824 = _1056;
    }
    float _1058 = _824;
    if (!_970)
    {
        _992 = _1030;
    }
    float _1060 = _992;
    float _1062 = _1060;
    if (_970)
    {
        float _1064 = _1052 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1004 = _1064;
    }
    float _1066 = _1004;
    if (_970)
    {
        float _1068 = _958 * _1058;
        _982 = _1068;
    }
    float _1070 = _982;
    if (!_970)
    {
        _1048 = _960;
    }
    float _1072 = _1048;
    float _1074 = _1072;
    if (_970)
    {
        float _1076 = _960 * _1058;
        _1074 = _1076;
    }
    float _1078 = _1074;
    if (_970)
    {
        float _1080 = fma(_1030, _1024, _1066);
        _1062 = _1080;
    }
    float _1082 = _1062;
    if (_970)
    {
        float _1084 = _1070 * _1070;
        _1034 = _1084;
    }
    float _1086 = _1034;
    if (!_970)
    {
        _1054 = _964;
    }
    float _1088 = _1054;
    float _1090 = _1088;
    if (_970)
    {
        float _1092 = _1078 * _1078;
        _1090 = _1092;
    }
    float _1094 = _1090;
    float _1096 = fma(_1082, _1082, _1086);
    float _1098 = _928 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1100 = _1096 + _1094;
    float _1102 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1098);
    float _1104 = _928 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1108 = fma(_954, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1106);
    float _1110 = precise::clamp(_1108, 0.0, 1.0);
    float _1112 = rsqrt(_1100);
    float _1114 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1116 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1102);
    float _1118 = _928 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1120 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1104);
    float _1122 = _928 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1124 = -_1110;
    float _1126 = _1124 + 1.0;
    float _1128 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1130 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1118);
    float _1132 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1120);
    float _1134 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1122);
    float _1136 = abs(_1126);
    float _1138 = log2(_1136);
    float _1140 = _1128 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1142 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1130);
    float _1144 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1146 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1134);
    float _1148 = _1112 * _1070;
    float _1150 = -_1140;
    float _1152 = fma(_1150, _1114, 1.0);
    float _1154 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1156 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1158 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1160 = _1112 * _1082;
    float _1162 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1164 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1156);
    float _1166 = _1112 * _1078;
    float _1168 = log2(_1152);
    float _1170 = -_1162;
    float _1172 = fma(_1160, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1170);
    float _1174 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1164);
    float _1176 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1178 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1180 = -_1166;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1172);
    float _1184 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1174);
    float _1186 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1188 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1178);
    float _1190 = fma(_1182, -0.5, 0.5);
    float _1192 = exp2(_1176);
    float _1194 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1186);
    float _1196 = fma(_1182, 0.5, 0.5);
    float _1198 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1188);
    float _1200 = _1160 + 1.0;
    float _1202 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1194);
    float _1204 = fma(_1196, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1206 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1198);
    float _1208 = 1.0 / _1184;
    float _1210 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1202);
    float _1212 = fma(_1196, _1204, -0.212114393711090087890625);
    float _1214 = _1168 * 0.693147182464599609375;
    float _1216 = fma(_1196, _1212, 1.570728778839111328125);
    float _1218 = sqrt(_1190);
    float _1220 = -_1160;
    float _1222 = fma(_1192, _1200, _1220);
    float _1224 = fma(_1222, 0.5, 0.5);
    float _1226 = _1206 * _1208;
    float _1228 = _1210 * _1208;
    float _1230 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1232 = fma(_1226, 0.5, 0.5);
    float _1234 = fma(_1228, -0.5, 0.5);
    float _1236 = _1218 * 0.636619746685028076171875;
    float3 _3158 = float3(_1232, _1234, _1230);
    float _1238 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3158, float3(0.0), isnan(_3158)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3158, float3(0.0), isnan(_3158)), level(0.0)).x;
    float3 _3169 = float3(_1232, _1234, _1230);
    float4 _1241 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3169, float3(0.0), isnan(_3169)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3169, float3(0.0), isnan(_3169)), level(0.0)).xyzw;
    float _1243 = _1241.x;
    float _1245 = _1241.y;
    float _1247 = _1241.z;
    float _1249 = _1241.w;
    float _1251 = -_1216;
    float _1253 = fma(_1236, _1251, 1.0);
    float2 _3191 = float2(_1253, _1224);
    float3 _1257 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3191, float2(0.0), isnan(_3191)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3191, float2(0.0), isnan(_3191)), level(0.0)).xyz;
    float _1259 = _1257.x;
    float _1261 = _1257.y;
    float _1263 = _1257.z;
    float _1265 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1267 = in.m_57.x;
    float _1269 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1271 = exp2(_1265);
    float _1273 = in.m_57.z;
    float _1275 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1269);
    float _1277 = in.m_57.y;
    float _1279 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1275);
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1283 = in.m_57.w;
    float _1285 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1279);
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = _1285 + _1184;
    float _1293 = -_1271;
    float _1295 = _1293 + 1.0;
    float _1297 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1291 * 0.5;
    float _1301 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_59.x = _1267;
    out.m_59.z = _1273;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_59.y = _1277;
    float _1305 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.w = _1283;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1309 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1206;
    out.gl_Position.y = _1210;
    out.gl_Position.z = _1285;
    out.gl_Position.w = _1184;
    out.m_61.x = _1289;
    out.m_61.y = _1297;
    out.m_61.z = _1305;
    out.m_61.w = _1307;
    out.m_63.z = _1299;
    out.m_63.w = _1184;
    out.m_45.x = _1309;
    float _1311 = _1301 * _1238;
    float _1313 = -_1301;
    float _1315 = _1313 + 1.0;
    float _1317 = _1249 * _1311;
    float _1319 = _1263 * _1311;
    float _1321 = fma(_1259, _1317, _1243);
    float _1323 = fma(_1261, _1317, _1245);
    float _1325 = _1249 * _1315;
    float _1327 = fma(_1249, _1319, _1247);
    out.m_65.x = _1321;
    out.m_65.y = _1323;
    out.m_65.z = _1327;
    out.m_65.w = _1325;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_42.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_88)
    {
        out.m_45.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _92 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1384 = as_type<float>(_100);
        out.gl_Position.z = _1384;
    }
    if (!_88)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _104 = in.m_47.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _120 = _118;
    if (_114)
    {
        float _122 = float(_84);
        _94 = _122;
    }
    float _124 = _94;
    bool _126 = _118 >= _124;
    bool _128 = !_114;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _102 = as_type<int>(_136);
    }
    int _138 = _102;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1454 = as_type<float>(_138);
        out.gl_Position.z = _1454;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_49.w;
    float _142 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_47.x;
    float _156 = in.m_47.y;
    float _158 = in.m_47.z;
    float _160 = in.m_42.x;
    float _162 = in.m_42.y;
    float _164 = in.m_42.z;
    float _166 = 0.0;
    float _168 = _142;
    if (!_152)
    {
        float _170 = _142 * _142;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_152)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_152;
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_240, _156, _246);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    bool _262 = !_242;
    float _280;
    if (!_262)
    {
        float _264 = in.m_51.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        float _284 = float(_84);
        float _286 = 1.0 / _284;
        float _288 = _118 * _286;
        _280 = _288;
    }
    _282 = false;
    float _290 = _280;
    float _292 = in.m_51.x;
    float _294 = in.m_51.y;
    float _296 = in.m_51.z;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _304 = _302 != 0;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _308 = _306 != 0;
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _312 = _310 != 0;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = _290 + _314;
    float _318 = 1.0 / _300;
    float _320 = _292 * 2.0;
    float _322 = _296 * 2.0;
    float _324 = _294 * 2.0;
    float _326 = _296 + _292;
    float _328 = _294 + _292;
    float _330 = floor(_322);
    float _332 = _292 + (-0.5);
    float _334 = _294 + _296;
    float _336 = _316 * _318;
    float _338 = _296 + (-0.5);
    float _340 = _334 + (-1.0);
    float _342 = _326 + (-1.0);
    float _344 = floor(_320);
    float _346 = _294 + (-0.5);
    float _348 = _328 + (-1.0);
    float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _352 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _354 = log2(_352);
    bool _356 = _330 > 0.0;
    bool _358 = _330 >= 0.0;
    bool _360 = isnan(_330);
    bool _362 = _358 || _360;
    bool _364 = isnan(0.0);
    bool _366 = _362 || _364;
    float _368 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _370 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _372 = floor(_324);
    bool _374 = _344 > 0.0;
    bool _376 = _344 >= 0.0;
    bool _378 = isnan(_344);
    bool _380 = _376 || _378;
    bool _382 = isnan(0.0);
    bool _384 = _380 || _382;
    int _386 = _366 ? 0 : 1;
    int _388 = _384 ? 0 : 1;
    float _390 = _354 * _118;
    int _392 = ~_386;
    int _394 = _392 + 1;
    int _396 = _394 + 1;
    int _398 = ~_388;
    int _400 = _398 + 1;
    int _402 = _400 + 1;
    int _404 = _396;
    int _406 = _402;
    if (!_356)
    {
        int _408 = ~_386;
        int _410 = _408 + 1;
        _404 = _410;
    }
    int _412 = _404;
    float _414 = exp2(_390);
    if (!_374)
    {
        int _416 = ~_388;
        int _418 = _416 + 1;
        _406 = _418;
    }
    int _420 = _406;
    bool _422 = !_304;
    int _424 = _422 ? 0 : 1;
    float _426 = in.m_53.x;
    float _428 = in.m_53.y;
    float _430 = in.m_53.z;
    bool _432 = _372 > 0.0;
    bool _434 = _372 >= 0.0;
    bool _436 = isnan(_372);
    bool _438 = _434 || _436;
    bool _440 = isnan(0.0);
    bool _442 = _438 || _440;
    bool _444 = !_308;
    int _446 = _444 ? 0 : 1;
    int _448 = abs(_424);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _452 = 1.0 + _450;
    int _454 = abs(_446);
    float _456 = 1.0 / _452;
    float _458 = float(_412);
    float _460 = -_414;
    float _462 = _460 + 1.0;
    float _464 = float(_448);
    float _466 = float(_454);
    float _468 = float(_420);
    float _470 = _464 * _458;
    bool _472 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _474 = isnan(1.0);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _480 = _476 || _478;
    bool _482 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _490 = _486 || _488;
    float _492 = _466 * _468;
    float _494 = _470 * (-2.0);
    int _496 = _442 ? 0 : 1;
    float _498 = _492 * (-2.0);
    float _500 = fma(_494, _426, _426);
    float _502 = _490 ? _462 : 0.0;
    float _504 = fma(_498, _428, _428);
    float _506 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[196].x, _500);
    bool _508 = !_312;
    int _510 = _508 ? 0 : 1;
    float _512 = fma(_368, _498, _368);
    float _514 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[196].y, _504);
    if (_480)
    {
        float _516 = _502 * _456;
        _120 = _516;
    }
    float _518 = _120;
    int _520 = abs(_510);
    float _522 = fma(_350, _494, _350);
    int _524 = ~_496;
    int _526 = _524 + 1;
    int _528 = _526 + 1;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _530;
    int _534 = _528;
    if (!_432)
    {
        int _536 = ~_496;
        int _538 = _536 + 1;
        _534 = _538;
    }
    int _540 = _534;
    float _542 = fma(_522, _518, _506);
    float _544 = fma(_512, _518, _514);
    float _546 = float(_540);
    float _548 = _542 * 0.15915493667125701904296875;
    float _550 = float(_520);
    float _552 = fma(_532, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _554 = _544 * 0.15915493667125701904296875;
    float _556 = _550 * _546;
    bool _558 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _560 = isnan(_290);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _570;
    bool _574 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _576 = isnan(_290);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _586;
    float _590 = _556 * (-2.0);
    float _592 = fma(_572, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _594 = -_568;
    float _596 = _594 + 1.0;
    float _598 = fma(_588, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _600 = fma(_590, _430, _430);
    float _602 = in.m_49.x;
    float _604 = in.m_49.y;
    float _606 = in.m_49.z;
    float _608 = _584 * _596;
    float _610 = fma(_370, _590, _370);
    float _612 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[196].z, _600);
    float _614 = in.m_55.x;
    float _616 = in.m_55.y;
    float _618 = in.m_55.z;
    float _620 = -_584;
    float _622 = _620 + 1.0;
    float _624 = _552 * _608;
    float _626 = _592 * _608;
    float _628 = fma(_610, _518, _612);
    float _630 = _598 * _608;
    float _632 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].x, _624);
    float _634 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].y, _626);
    float _636 = _628 * 0.15915493667125701904296875;
    float _638 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[144].x, _632);
    float _640 = _548 * 6.283185482025146484375;
    float _642 = sin(_640);
    float _644 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[143].z, _630);
    float _646 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[144].y, _634);
    bool _648 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _650 = isnan(0.5);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _656 = _652 || _654;
    float _658 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[144].z, _644);
    float _660 = _548 * 6.283185482025146484375;
    float _662 = cos(_660);
    float _664 = _638 * _602;
    float _666 = _646 * _604;
    float _668 = _658 * _606;
    float _670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _614);
    float _672 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _616);
    float _674 = _666 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _676 = _554 * 6.283185482025146484375;
    float _678 = sin(_676);
    float _680 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _618);
    float _682 = _664 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _684 = _668 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _686 = _674 * _672;
    float _688 = _682 * _670;
    float _690 = _684 * _680;
    float _692 = _554 * 6.283185482025146484375;
    float _694 = cos(_692);
    float _696 = _636 * 6.283185482025146484375;
    float _698 = cos(_696);
    float _700 = _662 * _678;
    float _702 = _642 * _678;
    float _704 = _636 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = _642 * _694;
    float _710 = _662 * _694;
    float _712 = _698 * _686;
    float _714 = _678 * _698;
    float _716 = _694 * _698;
    float _718 = _662 * _712;
    float _720 = _642 * _712;
    float _722 = -_700;
    float _724 = fma(_706, _708, _722);
    float _726 = -_708;
    float _728 = fma(_706, _700, _726);
    float _730 = fma(_706, _710, _702);
    float _732 = -_686;
    float _734 = _706 * _732;
    float _736 = fma(_706, _702, _710);
    float _738 = fma(_724, _688, _720);
    float _740 = fma(_730, _688, _718);
    float _742 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _744 = fma(_716, _688, _734);
    float _746 = fma(_736, _690, _738);
    float _748 = fma(_728, _690, _740);
    float _750 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _752 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _742);
    float _754 = fma(_714, _690, _744);
    float _756 = _748 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _758 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _750);
    float _760 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _752);
    float _762 = _748 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _764 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[10].x, _756);
    float _766 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _758);
    float _768 = _760 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _770 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[8].x, _762);
    float _772 = fma(_746, (*spvDescriptorSet0.vp_c10)._m0[10].z, _764);
    float _774 = _766 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _776 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _778 = fma(_746, (*spvDescriptorSet0.vp_c10)._m0[8].z, _770);
    float _780 = _768 + _772;
    float _782 = _748 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _784 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _776);
    float _786 = _774 + _778;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _790 = _780 + _788;
    float _792 = fma(_754, (*spvDescriptorSet0.vp_c10)._m0[9].x, _782);
    float _794 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _784);
    float _796 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _798 = _786 + _796;
    float _800 = _790 * _790;
    float _802 = fma(_746, (*spvDescriptorSet0.vp_c10)._m0[9].z, _792);
    float _804 = _794 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _806 = fma(_798, _798, _800);
    float _808 = _804 + _802;
    float _810 = sqrt(_806);
    bool _812 = _810 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _814 = _782;
    float _816 = _786;
    float _818 = _780;
    float _820 = _804;
    float _822 = _798;
    float _824 = _712;
    if (!_812)
    {
        _814 = _786;
    }
    float _826 = _814;
    float _828 = _826;
    if (!_812)
    {
        _816 = _808;
    }
    float _830 = _816;
    bool _832 = !_812;
    float _834 = _830;
    if (!_832)
    {
        float _836 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _838 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _840 = _810 + _838;
        float _842 = rsqrt(_806);
        float _844 = _840 * _836;
        float _846 = _808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _848 = _844 * 0.15915493667125701904296875;
        float _850 = _848 * 6.283185482025146484375;
        float _852 = cos(_850);
        float _854 = _848 * 6.283185482025146484375;
        float _856 = sin(_854);
        float _858 = _852 + (-1.0);
        float _860 = _858 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _862 = fma(_856, _846, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _864 = fma(_808, _852, _860);
        float _866 = _842 * _862;
        float _868 = fma(_798, _866, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _870 = fma(_790, _866, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _828 = _868;
        _834 = _864;
        _818 = _870;
    }
    float _872 = _828;
    float _874 = _834;
    float _876 = _818;
    float _878 = _874;
    float _880 = _872;
    float _882 = _876;
    if (!_656)
    {
        float _884 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _886 = _804 + _884;
        float _888 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _890 = _774 + _888;
        float _892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _894 = -_774;
        float _896 = _894 + _872;
        float _898 = _886 * _886;
        float _900 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _902 = _768 + _900;
        float _904 = -_804;
        float _906 = _904 + _874;
        float _908 = -_768;
        float _910 = _908 + _876;
        float _912 = fma(_890, _890, _898);
        float _914 = fma(_902, _902, _912);
        float _916 = sqrt(_914);
        float _918 = precise::min(_916, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _920 = _918 * _892;
        float _922 = fma(_896, _920, _774);
        float _924 = fma(_906, _920, _804);
        float _926 = fma(_910, _920, _768);
        _878 = _924;
        _880 = _922;
        _882 = _926;
    }
    float _928 = _878;
    float _930 = _880;
    float _932 = _882;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _936 = _928 + _934;
    float _938 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _940 = _930 + _938;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _944 = _932 + _942;
    float _946 = _936 * _936;
    float _948 = fma(_940, _940, _946);
    float _950 = fma(_944, _944, _948);
    float _952 = rsqrt(_950);
    float _954 = sqrt(_950);
    float _956 = _952 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _958 = _940 * _956;
    float _960 = _944 * _956;
    float _962 = _958 * _958;
    float _964 = _960 * _960;
    float _966 = _962 + _964;
    float _968 = sqrt(_966);
    bool _970 = _968 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _972 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _974 = _968 + _972;
    float _976 = _952;
    float _978 = _974;
    float _980 = _936;
    float _982 = _958;
    if (_970)
    {
        float _984 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _976 = _984;
    }
    float _986 = _976;
    if (_970)
    {
        float _988 = rsqrt(_966);
        _820 = _988;
    }
    float _990 = _820;
    float _992 = _990;
    if (_970)
    {
        float _994 = _974 * _986;
        _978 = _994;
    }
    float _996 = _978;
    if (_970)
    {
        float _998 = _996 * 0.15915493667125701904296875;
        _822 = _998;
    }
    float _1000 = _822;
    float _1002 = _986;
    float _1004 = _1000;
    if (_970)
    {
        float _1006 = _1000 * 6.283185482025146484375;
        float _1008 = sin(_1006);
        _1002 = _1008;
    }
    float _1010 = _1002;
    float _1012 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1014 = precise::max(0.0, _1012);
    float _1016 = _944;
    float _1018 = _1014;
    if (_970)
    {
        float _1020 = _1000 * 6.283185482025146484375;
        float _1022 = cos(_1020);
        _1016 = _1022;
    }
    float _1024 = _1016;
    float _1026 = -_956;
    float _1028 = -_1014;
    float _1030 = fma(_936, _1026, _1028);
    if (!_970)
    {
        _980 = _962;
    }
    float _1032 = _980;
    float _1034 = _1032;
    if (_970)
    {
        float _1036 = _1030 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1018 = _1036;
    }
    float _1038 = _1018;
    float _1040 = _1010;
    float _1042 = _1038;
    if (_970)
    {
        float _1044 = fma(_1010, _1038, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1040 = _1044;
    }
    float _1046 = _1040;
    float _1048 = _1046;
    if (_970)
    {
        float _1050 = _1024 + (-1.0);
        _1042 = _1050;
    }
    float _1052 = _1042;
    float _1054 = _1052;
    if (_970)
    {
        float _1056 = _990 * _1046;
        _824 = _1056;
    }
    float _1058 = _824;
    if (!_970)
    {
        _992 = _1030;
    }
    float _1060 = _992;
    float _1062 = _1060;
    if (_970)
    {
        float _1064 = _1052 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1004 = _1064;
    }
    float _1066 = _1004;
    if (_970)
    {
        float _1068 = _958 * _1058;
        _982 = _1068;
    }
    float _1070 = _982;
    if (!_970)
    {
        _1048 = _960;
    }
    float _1072 = _1048;
    float _1074 = _1072;
    if (_970)
    {
        float _1076 = _960 * _1058;
        _1074 = _1076;
    }
    float _1078 = _1074;
    if (_970)
    {
        float _1080 = fma(_1030, _1024, _1066);
        _1062 = _1080;
    }
    float _1082 = _1062;
    if (_970)
    {
        float _1084 = _1070 * _1070;
        _1034 = _1084;
    }
    float _1086 = _1034;
    if (!_970)
    {
        _1054 = _964;
    }
    float _1088 = _1054;
    float _1090 = _1088;
    if (_970)
    {
        float _1092 = _1078 * _1078;
        _1090 = _1092;
    }
    float _1094 = _1090;
    float _1096 = fma(_1082, _1082, _1086);
    float _1098 = _928 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1100 = _1096 + _1094;
    float _1102 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1098);
    float _1104 = _928 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1106 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1108 = fma(_954, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1106);
    float _1110 = precise::clamp(_1108, 0.0, 1.0);
    float _1112 = rsqrt(_1100);
    float _1114 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1116 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1102);
    float _1118 = _928 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1120 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1104);
    float _1122 = _928 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1124 = -_1110;
    float _1126 = _1124 + 1.0;
    float _1128 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1130 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1118);
    float _1132 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1120);
    float _1134 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1122);
    float _1136 = abs(_1126);
    float _1138 = log2(_1136);
    float _1140 = _1128 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1142 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1130);
    float _1144 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1146 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1134);
    float _1148 = _1112 * _1070;
    float _1150 = -_1140;
    float _1152 = fma(_1150, _1114, 1.0);
    float _1154 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1156 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1158 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1160 = _1112 * _1082;
    float _1162 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1164 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1156);
    float _1166 = _1112 * _1078;
    float _1168 = log2(_1152);
    float _1170 = -_1162;
    float _1172 = fma(_1160, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1170);
    float _1174 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1164);
    float _1176 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1178 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1180 = -_1166;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1172);
    float _1184 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1174);
    float _1186 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1188 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1178);
    float _1190 = fma(_1182, -0.5, 0.5);
    float _1192 = exp2(_1176);
    float _1194 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1186);
    float _1196 = fma(_1182, 0.5, 0.5);
    float _1198 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1188);
    float _1200 = _1160 + 1.0;
    float _1202 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1194);
    float _1204 = fma(_1196, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1206 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1198);
    float _1208 = 1.0 / _1184;
    float _1210 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1202);
    float _1212 = fma(_1196, _1204, -0.212114393711090087890625);
    float _1214 = _1168 * 0.693147182464599609375;
    float _1216 = fma(_1196, _1212, 1.570728778839111328125);
    float _1218 = sqrt(_1190);
    float _1220 = -_1160;
    float _1222 = fma(_1192, _1200, _1220);
    float _1224 = fma(_1222, 0.5, 0.5);
    float _1226 = _1206 * _1208;
    float _1228 = _1210 * _1208;
    float _1230 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1232 = fma(_1226, 0.5, 0.5);
    float _1234 = fma(_1228, -0.5, 0.5);
    float _1236 = _1218 * 0.636619746685028076171875;
    float3 _3158 = float3(_1232, _1234, _1230);
    float _1238 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3158, float3(0.0), isnan(_3158)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3158, float3(0.0), isnan(_3158)), level(0.0)).x;
    float3 _3169 = float3(_1232, _1234, _1230);
    float4 _1241 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3169, float3(0.0), isnan(_3169)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3169, float3(0.0), isnan(_3169)), level(0.0)).xyzw;
    float _1243 = _1241.x;
    float _1245 = _1241.y;
    float _1247 = _1241.z;
    float _1249 = _1241.w;
    float _1251 = -_1216;
    float _1253 = fma(_1236, _1251, 1.0);
    float2 _3191 = float2(_1253, _1224);
    float3 _1257 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3191, float2(0.0), isnan(_3191)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3191, float2(0.0), isnan(_3191)), level(0.0)).xyz;
    float _1259 = _1257.x;
    float _1261 = _1257.y;
    float _1263 = _1257.z;
    float _1265 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1267 = in.m_57.x;
    float _1269 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1271 = exp2(_1265);
    float _1273 = in.m_57.z;
    float _1275 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1269);
    float _1277 = in.m_57.y;
    float _1279 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1275);
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1283 = in.m_57.w;
    float _1285 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1279);
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = _1285 + _1184;
    float _1293 = -_1271;
    float _1295 = _1293 + 1.0;
    float _1297 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1299 = _1291 * 0.5;
    float _1301 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_59.x = _1267;
    out.m_59.z = _1273;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_59.y = _1277;
    float _1305 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.w = _1283;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1309 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1206;
    out.gl_Position.y = _1210;
    out.gl_Position.z = _1285;
    out.gl_Position.w = _1184;
    out.m_61.x = _1289;
    out.m_61.y = _1297;
    out.m_61.z = _1305;
    out.m_61.w = _1307;
    out.m_63.z = _1299;
    out.m_63.w = _1184;
    out.m_45.x = _1309;
    float _1311 = _1301 * _1238;
    float _1313 = -_1301;
    float _1315 = _1313 + 1.0;
    float _1317 = _1249 * _1311;
    float _1319 = _1263 * _1311;
    float _1321 = fma(_1259, _1317, _1243);
    float _1323 = fma(_1261, _1317, _1245);
    float _1325 = _1249 * _1315;
    float _1327 = fma(_1249, _1319, _1247);
    out.m_65.x = _1321;
    out.m_65.y = _1323;
    out.m_65.z = _1327;
    out.m_65.w = _1325;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

