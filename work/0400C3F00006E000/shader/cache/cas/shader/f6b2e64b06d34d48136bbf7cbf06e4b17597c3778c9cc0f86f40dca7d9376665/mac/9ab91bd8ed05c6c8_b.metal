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
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_1C [[id(8)]];
    sampler vp_t_tcb_1CSmplr [[id(9)]];
    sampler vp_t_tcb_32Smplr_w [[id(10)]];
    sampler vp_t_tcb_1CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_81 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_49 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
    float4 m_63 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1698 = false;
    bool _468 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1983 = as_type<float>(_116);
        out.gl_Position.z = _1983;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = 0.0;
    if (_130)
    {
        float _138 = float(_100);
        _136 = _138;
    }
    float _140 = _136;
    bool _142 = _134 >= _140;
    bool _144 = !_130;
    bool _146 = _142 || _144;
    if (_146)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _110;
    if (_146)
    {
        out.m_45.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2051 = as_type<float>(_152);
        out.gl_Position.z = _2051;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_49.x;
    float _156 = in.m_49.y;
    float _158 = in.m_49.z;
    float _160 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _162 = in.m_51.x;
    float _164 = in.m_51.y;
    float _166 = in.m_51.z;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    float _184 = in.m_42.x;
    float _186 = in.m_42.y;
    float _188 = in.m_42.z;
    float _190 = _154 * _154;
    float _192 = _156 * _156;
    float _194 = fma(_162, _162, _190);
    float _196 = fma(_164, _164, _192);
    float _198 = fma(_178, _178, _194);
    float _200 = _158 * _158;
    float _202 = fma(_180, _180, _196);
    float _204 = sqrt(_198);
    float _206 = fma(_166, _166, _200);
    float _208 = fma(_182, _182, _206);
    float _210 = in.m_55.w;
    float _212 = sqrt(_202);
    bool _214 = _204 > 0.0;
    float _216 = sqrt(_208);
    float _218 = in.m_47.x;
    float _220 = in.m_47.y;
    float _222 = in.m_47.z;
    bool _224 = _212 > 0.0;
    float _226 = 0.0;
    float _228 = _212;
    float _230 = _160;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _234 = _202;
    if (_214)
    {
        float _236 = rsqrt(_198);
        _226 = _236;
    }
    float _238 = _226;
    bool _240 = _216 > 0.0;
    float _242 = _216;
    if (!_176)
    {
        float _244 = _160 * _160;
        float _246 = _244 * 0.5;
        _242 = _246;
    }
    float _248 = _242;
    float _250 = _248;
    if (!_176)
    {
        float _252 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _250 = _252;
    }
    float _254 = _250;
    bool _256 = !_176;
    float _258 = _254;
    float _260 = 0.0;
    float _262 = _238;
    if (!_256)
    {
        float _264 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = log2(_264);
        float _268 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _270 = _268 + 1.0;
        float _272 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _274 = _160 * _266;
        float _276 = 1.0 / _270;
        float _278 = _272 * 0.693147182464599609375;
        float _280 = exp2(_274);
        float _282 = 1.0 / _278;
        float _284 = _280 + (-1.0);
        float _286 = -_284;
        float _288 = fma(_286, _282, _160);
        float _290 = _288 * _276;
        float _292 = _290 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _258 = _292;
        _260 = _276;
        _228 = _280;
    }
    float _294 = _258;
    float _296 = _260;
    float _298 = _228;
    bool _300 = !_176;
    float _302 = _296;
    float _304 = _298;
    if (!_300)
    {
        float _306 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = log2(_306);
        float _310 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _312 = _310 + 1.0;
        float _314 = 1.0 / _312;
        float _316 = _160 * _308;
        float _318 = exp2(_316);
        float _320 = -_318;
        float _322 = _320 + 1.0;
        float _324 = _322 * _314;
        _230 = _324;
        _232 = _312;
    }
    float _326 = _230;
    float _328 = _232;
    float _330 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _332 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _334 = _328;
    float _336 = _330;
    if (!_214)
    {
        _302 = 0.0;
    }
    float _338 = _302;
    float _340 = _338;
    if (_214)
    {
        float _342 = _238 * _162;
        _340 = _342;
    }
    float _344 = _340;
    float _346 = fma(_326, _218, _330);
    float _348 = fma(_326, _220, _332);
    float _350 = _348;
    float _352 = _346;
    if (!_214)
    {
        _304 = 0.0;
    }
    float _354 = _304;
    float _356 = _218;
    float _358 = _354;
    if (_224)
    {
        float _360 = rsqrt(_202);
        _356 = _360;
    }
    float _362 = _356;
    float _364 = fma(_346, _210, _184);
    float _366 = fma(_348, _210, _186);
    float _368 = _364;
    float _370 = _366;
    if (!_214)
    {
        _334 = 0.0;
    }
    float _372 = _334;
    float _374 = _372;
    if (_214)
    {
        float _376 = _238 * _154;
        _358 = _376;
    }
    float _378 = _358;
    if (_214)
    {
        float _380 = _238 * _178;
        _374 = _380;
    }
    float _382 = _374;
    bool _384 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    out.m_57.x = _364;
    out.m_57.y = _366;
    float _386 = _220;
    if (_240)
    {
        float _388 = rsqrt(_208);
        _386 = _388;
    }
    float _390 = _386;
    float _392 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _394 = 0.0;
    if (!_224)
    {
        _394 = 0.0;
        _350 = 0.0;
    }
    float _396 = _394;
    float _398 = _350;
    float _400 = _398;
    float _402 = _396;
    if (!_224)
    {
        _262 = 0.0;
    }
    float _404 = _262;
    float _406 = fma(_326, _222, _392);
    float _408 = _404;
    if (!_240)
    {
        _336 = 0.0;
    }
    float _410 = _336;
    float _412 = _410;
    if (!_240)
    {
        _234 = 0.0;
    }
    float _414 = _234;
    float _416 = _414;
    if (_224)
    {
        float _418 = _362 * _164;
        _408 = _418;
    }
    float _420 = _408;
    if (!_240)
    {
        _352 = 0.0;
    }
    float _422 = _352;
    float _424 = _422;
    if (_224)
    {
        float _426 = _362 * _156;
        _400 = _426;
    }
    float _428 = _400;
    if (_224)
    {
        float _430 = _362 * _180;
        _402 = _430;
    }
    float _432 = _402;
    float _434 = fma(_406, _210, _188);
    if (_240)
    {
        float _436 = _390 * _166;
        _412 = _436;
    }
    float _438 = _412;
    if (_240)
    {
        float _440 = _390 * _158;
        _416 = _440;
    }
    float _442 = _416;
    if (_240)
    {
        float _444 = _390 * _182;
        _424 = _444;
    }
    float _446 = _424;
    bool _448 = !_384;
    float _466;
    if (!_448)
    {
        float _450 = in.m_59.x;
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _454 = _450 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _456 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _458 = _456 * _452;
        float _460 = floor(_458);
        float _462 = -_460;
        float _464 = _458 + _462;
        _466 = _464;
        _468 = true;
    }
    else
    {
        float _470 = float(_100);
        float _472 = 1.0 / _470;
        float _474 = _134 * _472;
        _466 = _474;
    }
    _468 = false;
    float _476 = _466;
    float _478 = in.m_59.x;
    float _480 = _366 * _180;
    float _482 = in.m_61.x;
    float _484 = in.m_61.y;
    float _486 = in.m_61.z;
    float _488 = _366 * _164;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _498 = fma(_364, _178, _480);
    float _500 = 1.0 / _492;
    float _502 = fma(_364, _162, _488);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _506 = _476 + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _510 = _476 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _512;
    float _516 = fma(_434, _182, _498);
    float _518 = 1.0 / _496;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _522 = _476 + _520;
    float _524 = _366 * _156;
    float _526 = fma(_478, 0.2000000476837158203125, 0.89999997615814208984375);
    float _528 = _478 * 100.0;
    float _530 = _506 * _500;
    float _532 = 1.0 / _514;
    float _534 = _526 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    bool _536 = _482 > 0.0;
    float _538 = fma(_134, 0.00999999977648258209228515625, _528);
    bool _540 = _482 >= 0.0;
    bool _542 = isnan(_482);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    float _550 = fma(_134, _534, _528);
    float _552 = _522 * _518;
    float _554 = abs(_482);
    float _556 = -_554;
    float _558 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[191].y, _550);
    float _560 = _538 * 0.15915493667125701904296875;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _570 = _558 * 0.15915493667125701904296875;
    int _572 = _548 ? 0 : 1;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _574;
    float _578 = _510 * _532;
    float _580 = _570 * 6.283185482025146484375;
    float _582 = cos(_580);
    int _584 = ~_572;
    int _586 = _584 + 1;
    int _588 = _586 + 1;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _590;
    int _594 = _588;
    if (!_536)
    {
        int _596 = ~_572;
        int _598 = _596 + 1;
        _594 = _598;
    }
    int _600 = _594;
    float _602 = abs(_482);
    float _604 = -_602;
    float _606 = _604 + 1.0;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _616 = float(_600);
    float _618 = _570 * 6.283185482025146484375;
    float _620 = sin(_618);
    float _622 = -_606;
    float _624 = fma(_622, _606, 1.0);
    bool _626 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _628 = isnan(_476);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = fma(_568, _552, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _640 = _616 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    bool _642 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _644 = isnan(_476);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = fma(_610, _552, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _656 = fma(_614, _552, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _658 = _582 * _624;
    bool _660 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _662 = isnan(_476);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = _560 * 6.283185482025146484375;
    float _674 = sin(_672);
    bool _676 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _678 = isnan(_476);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = -_652;
    float _690 = _688 + 1.0;
    float _692 = _658 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _694 = -_670;
    float _696 = _694 + 1.0;
    float _698 = fma(_564, _530, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _700 = _620 * _640;
    float _702 = _686 * _690;
    float _704 = -_686;
    float _706 = _704 + 1.0;
    float _708 = fma(_576, _530, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _710 = _700 * 0.15915493667125701904296875;
    float _712 = _652 * _696;
    float _714 = _636 * _706;
    float _716 = fma(_592, _530, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _718;
    float _722 = _658 * _640;
    float _724 = _692 * 0.15915493667125701904296875;
    float _726 = _698 * _714;
    float _728 = _708 * _714;
    float _730 = -_636;
    float _732 = _730 + 1.0;
    float _734 = _722 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _736 = fma(_720, _578, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _738 = _716 * _714;
    float _740 = _710 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = fma(_674, 2.0, 2.0);
    float _746 = precise::clamp(_744, 0.0, 1.0);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _748;
    float _752 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[143].x, _726);
    float _754 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[143].y, _728);
    float _756 = _734 * 0.15915493667125701904296875;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _758;
    float _762 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[143].z, _738);
    float _764 = _710 * 6.283185482025146484375;
    float _766 = cos(_764);
    float _768 = fma(_750, _578, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _770 = fma(_654, _702, _754);
    float _772 = fma(_760, _578, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _774 = fma(_638, _702, _752);
    float _776 = fma(_656, _702, _762);
    float _778 = fma(_768, _712, _770);
    float _780 = fma(_364, _154, _524);
    float _782 = _724 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = fma(_736, _712, _774);
    float _788 = fma(_772, _712, _776);
    float _790 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[146].y, _778);
    float _792 = in.m_63.x;
    float _794 = fma(_746, 0.949999988079071044921875, -1.0);
    float _796 = _724 * 6.283185482025146484375;
    float _798 = cos(_796);
    float _800 = in.m_55.x;
    float _802 = in.m_55.y;
    float _804 = in.m_55.z;
    float _806 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[146].x, _786);
    float _808 = _766 * _482;
    float _810 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[192].z, 1.0);
    float _812 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[146].z, _788);
    float _814 = _550 * 0.15915493667125701904296875;
    float _816 = _742 * _482;
    float _818 = _756 * 6.283185482025146484375;
    float _820 = cos(_818);
    float _822 = _784 * _486;
    float _824 = _756 * 6.283185482025146484375;
    float _826 = sin(_824);
    float _828 = _798 * _486;
    float _830 = -_822;
    float _832 = fma(_798, _484, _830);
    float _834 = fma(_784, _484, _828);
    float _836 = _832 * _820;
    float _838 = fma(_834, _742, _808);
    float _840 = _814 * 6.283185482025146484375;
    float _842 = sin(_840);
    float _844 = _806 * _800;
    float _846 = -_816;
    float _848 = fma(_834, _766, _846);
    float _850 = _790 * _802;
    float _852 = _812 * _804;
    float _854 = _832 * _826;
    float _856 = fma(_838, _826, _836);
    float _858 = -_848;
    float _860 = _858 + _486;
    float _862 = _850 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _864 = -_854;
    float _866 = fma(_838, _820, _864);
    float _868 = -_856;
    float _870 = _868 + _484;
    float _872 = fma(_860, _792, _848);
    float _874 = in.m_53.w;
    float _876 = -_866;
    float _878 = _876 + _482;
    float _880 = fma(_870, _792, _856);
    float _882 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[191].w, _872);
    float _884 = _844 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _886 = fma(_878, _792, _866);
    float _888 = -_484;
    float _890 = _880 + _888;
    float _892 = in.m_51.w;
    float _894 = -_486;
    float _896 = _882 + _894;
    float _898 = -_482;
    float _900 = _886 + _898;
    float _902 = fma(_810, _890, _484);
    float _904 = _852 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _906 = fma(_810, _896, _486);
    float _908 = fma(_810, _900, _482);
    float _910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _902);
    bool _912 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _914 = isnan(0.5);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _920 = _916 || _918;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _908);
    float _924 = _862 * _910;
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _906);
    float _928 = _884 * _922;
    float _930 = _924 * _432;
    float _932 = _904 * _926;
    float _934 = _924 * _420;
    float _936 = fma(_434, _166, _502);
    float _938 = fma(_928, _382, _930);
    float _940 = _516 + _874;
    float _942 = fma(_928, _344, _934);
    float _944 = _924 * _428;
    float _946 = fma(_932, _446, _938);
    float _948 = _936 + _892;
    float _950 = fma(_932, _438, _942);
    float _952 = fma(_928, _378, _944);
    float _954 = _940 + _946;
    float _956 = _948 + _950;
    float _958 = fma(_434, _158, _780);
    float _960 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _962 = _954 + _960;
    float _964 = fma(_932, _442, _952);
    float _966 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _968 = _956 + _966;
    float _970 = _962 * _962;
    float _972 = fma(_968, _968, _970);
    float _974 = in.m_49.w;
    float _976 = sqrt(_972);
    bool _978 = _976 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _980 = _958 + _974;
    float _982 = _980 + _964;
    float _984 = _956;
    if (!_978)
    {
        _368 = _954;
    }
    float _986 = _368;
    float _988 = _986;
    if (!_978)
    {
        _370 = _982;
    }
    float _990 = _370;
    bool _992 = !_978;
    float _994 = _990;
    if (!_992)
    {
        float _996 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _998 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1000 = _976 + _998;
        float _1002 = _982 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1004 = rsqrt(_972);
        float _1006 = _1000 * _996;
        float _1008 = _1006 * 0.15915493667125701904296875;
        float _1010 = _1008 * 6.283185482025146484375;
        float _1012 = cos(_1010);
        float _1014 = _1008 * 6.283185482025146484375;
        float _1016 = sin(_1014);
        float _1018 = _1012 + (-1.0);
        float _1020 = _1018 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1022 = fma(_1016, _1002, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1024 = fma(_982, _1012, _1020);
        float _1026 = _1004 * _1022;
        float _1028 = fma(_968, _1026, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1030 = fma(_962, _1026, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _984 = _1028;
        _994 = _1024;
        _988 = _1030;
    }
    float _1032 = _984;
    float _1034 = _994;
    float _1036 = _988;
    float _1038 = _1034;
    float _1040 = _1032;
    float _1042 = _1036;
    if (!_920)
    {
        float _1044 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1046 = _980 + _1044;
        float _1048 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1050 = _948 + _1048;
        float _1052 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1054 = -_948;
        float _1056 = _1054 + _1032;
        float _1058 = _1046 * _1046;
        float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1062 = _940 + _1060;
        float _1064 = -_980;
        float _1066 = _1064 + _1034;
        float _1068 = fma(_1050, _1050, _1058);
        float _1070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1072 = fma(_1062, _1062, _1068);
        float _1074 = sqrt(_1072);
        float _1076 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1078 = precise::min(_1074, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1080 = _1078 * _1070;
        float _1082 = _1076 * _1080;
        float _1084 = -_940;
        float _1086 = _1084 + _1036;
        float _1088 = fma(_1056, _1082, _948);
        float _1090 = fma(_1066, _1082, _980);
        float _1092 = fma(_1086, _1082, _940);
        _1038 = _1090;
        _1040 = _1088;
        _1042 = _1092;
    }
    float _1094 = _1038;
    float _1096 = _1040;
    float _1098 = _1042;
    float _1100 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1102 = _1094 + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1106 = _1096 + _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1110 = _1098 + _1108;
    float _1112 = _1102 * _1102;
    float _1114 = fma(_1106, _1106, _1112);
    float _1116 = fma(_1110, _1110, _1114);
    float _1118 = rsqrt(_1116);
    float _1120 = sqrt(_1116);
    float _1122 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1124 = _1106 * _1122;
    float _1126 = _1110 * _1122;
    float _1128 = _1124 * _1124;
    float _1130 = _1126 * _1126;
    float _1132 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1134 = _1128 + _1130;
    float _1136 = precise::max(0.0, _1132);
    float _1138 = sqrt(_1134);
    float _1140 = -_1122;
    float _1142 = -_1136;
    float _1144 = fma(_1102, _1140, _1142);
    bool _1146 = _1138 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1148 = _1122;
    float _1150 = _1102;
    float _1152 = _1136;
    float _1154 = _1128;
    float _1156 = _1130;
    if (!_1146)
    {
        _1148 = _1124;
    }
    float _1158 = _1148;
    float _1160 = _1158;
    if (!_1146)
    {
        _1150 = _1144;
    }
    float _1162 = _1150;
    float _1164 = _1162;
    if (!_1146)
    {
        _1152 = _1126;
    }
    float _1166 = _1152;
    bool _1168 = !_1146;
    float _1170 = _1166;
    if (!_1168)
    {
        float _1172 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1176 = _1138 + _1174;
        float _1178 = _1144 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1180 = rsqrt(_1134);
        float _1182 = _1176 * _1172;
        float _1184 = _1182 * 0.15915493667125701904296875;
        float _1186 = _1184 * 6.283185482025146484375;
        float _1188 = sin(_1186);
        float _1190 = _1184 * 6.283185482025146484375;
        float _1192 = cos(_1190);
        float _1194 = fma(_1188, _1178, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1196 = _1180 * _1194;
        float _1198 = _1192 + (-1.0);
        float _1200 = _1124 * _1196;
        float _1202 = _1198 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1204 = _1126 * _1196;
        float _1206 = fma(_1144, _1192, _1202);
        float _1208 = _1200 * _1200;
        float _1210 = _1204 * _1204;
        _1164 = _1206;
        _1154 = _1208;
        _1156 = _1210;
        _1160 = _1200;
        _1170 = _1204;
    }
    float _1212 = _1164;
    float _1214 = _1154;
    float _1216 = _1156;
    float _1218 = _1160;
    float _1220 = _1170;
    float _1222 = fma(_1212, _1212, _1214);
    float _1224 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1226 = _1222 + _1216;
    float _1228 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1230 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1224);
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1234 = fma(_1120, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1232);
    float _1236 = precise::clamp(_1234, 0.0, 1.0);
    float _1238 = rsqrt(_1226);
    float _1240 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1228);
    float _1242 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1230);
    float _1244 = -_1236;
    float _1246 = _1244 + 1.0;
    float _1248 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1250 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1240);
    float _1252 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1254 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1256 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1248);
    float _1258 = abs(_1246);
    float _1260 = log2(_1258);
    float _1262 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1264 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1266 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1256);
    float _1268 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1270 = -_1262;
    float _1272 = fma(_1254, _1270, 1.0);
    float _1274 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1276 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1278 = _1238 * _1218;
    float _1280 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1268);
    float _1282 = _1238 * _1212;
    float _1284 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1274);
    float _1286 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1288 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1280);
    float _1290 = _1238 * _1220;
    float _1292 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1284);
    float _1294 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1296 = -_1286;
    float _1298 = fma(_1282, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1296);
    float _1300 = _1288 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1302 = log2(_1272);
    float _1304 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1306 = -_1290;
    float _1308 = fma(_1306, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1298);
    float _1310 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1292);
    float _1312 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1314 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1304);
    float _1316 = fma(_1308, -0.5, 0.5);
    float _1318 = fma(_1308, 0.5, 0.5);
    float _1320 = exp2(_1294);
    float _1322 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1312);
    float _1324 = _1282 + 1.0;
    float _1326 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1314);
    float _1328 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1322);
    float _1330 = fma(_1318, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1332 = 1.0 / _1310;
    float _1334 = _1302 * 0.693147182464599609375;
    float _1336 = fma(_1318, _1330, -0.212114393711090087890625);
    float _1338 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1340 = fma(_1318, _1336, 1.570728778839111328125);
    float _1342 = sqrt(_1316);
    float _1344 = -_1282;
    float _1346 = fma(_1320, _1324, _1344);
    float _1348 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1328);
    float _1350 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1326);
    float _1352 = fma(_1346, 0.5, 0.5);
    float _1354 = _1348 * _1332;
    float _1356 = _1350 * _1332;
    float _1358 = fma(_1354, 0.5, 0.5);
    float _1360 = fma(_1356, -0.5, 0.5);
    float _1362 = _1342 * 0.636619746685028076171875;
    float3 _3903 = float3(_1358, _1360, _1338);
    float _1364 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3903, float3(0.0), isnan(_3903)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3903, float3(0.0), isnan(_3903)), level(0.0)).x;
    float _1366 = -_1340;
    float _1368 = fma(_1362, _1366, 1.0);
    float2 _3919 = float2(_1368, _1352);
    float3 _1372 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3919, float2(0.0), isnan(_3919)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3919, float2(0.0), isnan(_3919)), level(0.0)).xyz;
    float _1374 = _1372.x;
    float _1376 = _1372.y;
    float _1378 = _1372.z;
    float _1380 = in.m_65.x;
    float _1382 = in.m_65.y;
    float _1384 = in.m_65.z;
    bool _1386 = _902 != 0.0;
    bool _1388 = isnan(_902);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan(0.0);
    bool _1394 = _1390 || _1392;
    float _1396 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1398 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1400 = _908 == 0.0;
    bool _1402 = !_1394;
    bool _1404 = _1400 && _1402;
    float _1406 = exp2(_1396);
    float _1408 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1398);
    bool _1410 = _906 == 0.0;
    bool _1412 = _1410 && _1404;
    out.m_67.w = _1310;
    float _1414 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1408);
    float _1416 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1414);
    out.gl_Position.x = _1348;
    out.gl_Position.y = _1350;
    out.gl_Position.z = _1416;
    out.gl_Position.w = _1310;
    float _1418 = _798 * _1384;
    float _1420 = _784 * _1384;
    float _1422 = _766 * _1380;
    float _1424 = _742 * _1380;
    float _1426 = fma(_784, _1382, _1418);
    float _1428 = -_1420;
    float _1430 = fma(_798, _1382, _1428);
    float _1432 = -_1406;
    float _1434 = _1432 + 1.0;
    float _1436 = fma(_742, _1426, _1422);
    float _1438 = _820 * _1430;
    float _1440 = _826 * _1430;
    float _1442 = -_1424;
    float _1444 = fma(_766, _1426, _1442);
    float _1446 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1448 = fma(_826, _1436, _1438);
    float _1450 = -_1440;
    float _1452 = fma(_820, _1436, _1450);
    float _1454 = -_1448;
    float _1456 = _1454 + _1382;
    float _1458 = -_1452;
    float _1460 = _1458 + _1380;
    float _1462 = fma(_1456, _792, _1448);
    float _1464 = fma(_1460, _792, _1452);
    float _1466 = -_1444;
    float _1468 = _1466 + _1384;
    float _1470 = _1462 * _1462;
    float _1472 = fma(_1468, _792, _1444);
    float _1474 = fma(_1464, _1464, _1470);
    float _1476 = fma(_1472, _1472, _1474);
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1488 = rsqrt(_1476);
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1492 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1494 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1496 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1498 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1492;
    out.m_69.y = _1494;
    out.m_69.z = _1496;
    out.m_71.x = _1498;
    out.m_71.y = _1500;
    out.m_71.z = _1502;
    float _1504 = -_1380;
    float _1506 = fma(_1464, _1488, _1504);
    float _1508 = -_1382;
    float _1510 = fma(_1462, _1488, _1508);
    float _1512 = -_1384;
    float _1514 = fma(_1472, _1488, _1512);
    float _1516 = fma(_810, _1506, _1380);
    float _1518 = fma(_810, _1510, _1382);
    float _1520 = fma(_810, _1514, _1384);
    float _1522 = _1348 + _1310;
    float _1524 = _1516;
    float _1526 = _1518;
    float _1528 = _1520;
    float _1530 = _1310;
    float _1532 = _1416;
    float _1534 = _1350;
    float _1536 = _1348;
    if (!_1412)
    {
        float _1538 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1516);
        _1524 = _1538;
    }
    float _1540 = _1524;
    if (!_1412)
    {
        float _1542 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1518);
        _1526 = _1542;
    }
    float _1544 = _1526;
    if (!_1412)
    {
        float _1546 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1520);
        _1528 = _1546;
    }
    float _1548 = _1528;
    bool _1550 = _1120 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1552 = isnan(_1120);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1558 = _1554 || _1556;
    float _1560 = _1522 * 0.5;
    float _1562 = _420 * _1544;
    float _1564 = _428 * _1544;
    float _1566 = _432 * _1544;
    float _1568 = fma(_344, _1540, _1562);
    float _1570 = fma(_378, _1540, _1564);
    float _1572 = _1310 * 0.5;
    float _1574 = fma(_382, _1540, _1566);
    float _1576 = fma(_438, _1548, _1568);
    float _1578 = fma(_442, _1548, _1570);
    float _1580 = fma(_1350, -0.5, _1572);
    float _1582 = fma(_446, _1548, _1574);
    out.m_67.x = _1560;
    float _1584 = _1574;
    float _1586 = _1560;
    if (!_1558)
    {
        _1584 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1588 = _1584;
    float _1590 = _1588;
    float _1592 = _1588;
    if (!_1558)
    {
        _1530 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1594 = _1530;
    out.m_67.y = _1580;
    float _1596 = _1594;
    float _1598 = _1594;
    if (!_1558)
    {
        _1532 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1600 = _1532;
    float _1602 = _1600;
    float _1604 = _1600;
    if (!_1558)
    {
        _1534 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1606 = _1534;
    out.m_73.x = _1576;
    out.m_73.y = _1578;
    out.m_73.z = _1582;
    float _1608 = _1606;
    float _1610 = _1606;
    if (!_1558)
    {
        _1586 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1612 = _1586;
    float _1614 = _1612;
    float _1616 = _1612;
    if (!_1558)
    {
        _1536 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1618 = _1536;
    float _1620 = _1446 * _1364;
    float _1622 = -_1446;
    float _1624 = _1622 + 1.0;
    float _1626 = _1374 * _1620;
    float _1628 = _1376 * _1620;
    float _1630 = _1378 * _1620;
    out.m_75.x = _1626;
    out.m_75.y = _1628;
    out.m_75.z = _1630;
    out.m_75.w = _1624;
    bool _1632 = !_1558;
    float _1634 = _1618;
    float _1636 = _1618;
    if (!_1632)
    {
        bool _1638 = _1120 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1640 = isnan(_1120);
        bool _1642 = _1638 || _1640;
        bool _1644 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1646 = _1642 || _1644;
        if (!_1646)
        {
            float _1648 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1650 = _1120 + _1648;
            float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1654 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1652;
            float _1656 = 1.0 / _1654;
            float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1660 = _1658 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1664 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1668 = _1666 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1670 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1672 = _1670 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1676 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1678 = _1650 * _1656;
            float _1680 = precise::clamp(_1678, 0.0, 1.0);
            float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1684 = _1682 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1686 = fma(_1680, _1660, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1688 = fma(_1680, _1684, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1690 = fma(_1680, _1664, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1692 = fma(_1680, _1668, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1694 = fma(_1680, _1672, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1696 = fma(_1680, _1676, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1592 = _1688;
            _1610 = _1694;
            _1616 = _1686;
            _1604 = _1692;
            _1598 = _1690;
            _1636 = _1696;
            _1698 = true;
        }
        else
        {
            bool _1700 = _1120 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1702 = isnan(_1120);
            bool _1704 = _1700 || _1702;
            bool _1706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1708 = _1704 || _1706;
            if (!_1708)
            {
                _1614 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1710 = _1614;
            _1616 = _1710;
            if (!_1708)
            {
                _1590 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1712 = _1590;
            _1592 = _1712;
            if (!_1708)
            {
                _1596 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1714 = _1596;
            _1598 = _1714;
            if (!_1708)
            {
                _1602 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1716 = _1602;
            _1604 = _1716;
            if (!_1708)
            {
                _1608 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1718 = _1608;
            _1610 = _1718;
            if (!_1708)
            {
                _1634 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1720 = _1634;
            bool _1722 = !_1708;
            _1636 = _1720;
            if (!_1722)
            {
                bool _1724 = _1120 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1726 = isnan(_1120);
                bool _1728 = _1724 || _1726;
                bool _1730 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1732 = _1728 || _1730;
                if (!_1732)
                {
                    float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1736 = _1120 + _1734;
                    float _1738 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1740 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1738;
                    float _1742 = 1.0 / _1740;
                    float _1744 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1746 = _1744 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1748 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1750 = _1748 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1754 = _1752 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1756 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1758 = _1756 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1762 = _1760 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1764 = _1736 * _1742;
                    float _1766 = precise::clamp(_1764, 0.0, 1.0);
                    float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1770 = _1768 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1772 = fma(_1766, _1746, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1774 = fma(_1766, _1770, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1776 = fma(_1766, _1750, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1778 = fma(_1766, _1754, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1780 = fma(_1766, _1758, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1782 = fma(_1766, _1762, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1592 = _1774;
                    _1610 = _1780;
                    _1616 = _1772;
                    _1604 = _1778;
                    _1598 = _1776;
                    _1636 = _1782;
                    _1698 = true;
                }
                else
                {
                    _1592 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1610 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1616 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1604 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1598 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1636 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1698 = false;
    float _1784 = _1592;
    float _1786 = _1610;
    float _1788 = _1616;
    float _1790 = _1604;
    float _1792 = _1598;
    float _1794 = _1636;
    float _1796 = fma(_1578, -0.5, 0.5);
    float _1798 = precise::clamp(_1796, 0.0, 1.0);
    float _1800 = -_1784;
    float _1802 = _1800 + _1786;
    float _1804 = -_1788;
    float _1806 = _1804 + _1790;
    float _1808 = -_1792;
    float _1810 = _1808 + _1794;
    bool _1812 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1814 = fma(_1798, _1802, _1784);
    float _1816 = fma(_1798, _1806, _1788);
    float _1818 = fma(_1798, _1810, _1792);
    float _1820 = _1814 * 0.586610972881317138671875;
    out.m_77.x = 0.0;
    float _1822 = fma(_1816, 0.298911988735198974609375, _1820);
    out.m_45.x = 1.0;
    float _1824 = fma(_1818, 0.114477999508380889892578125, _1822);
    float _1826 = -_1824;
    float _1828 = _1816 + _1826;
    float _1830 = -_1824;
    float _1832 = _1814 + _1830;
    float _1834 = -_1824;
    float _1836 = _1818 + _1834;
    float _1838 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1840 = fma(_1828, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1824);
    float _1842 = fma(_1832, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1824);
    float _1844 = fma(_1836, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1824);
    out.m_79.w = _1838;
    out.m_81.x = _1840;
    out.m_81.y = _1842;
    out.m_81.z = _1844;
    if (!_1812)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1846 = -_1094;
    float _1848 = _1846 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1850 = -_1096;
    float _1852 = _1850 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1854 = -_1098;
    float _1856 = _1854 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1858 = _1848 * _1848;
    float _1860 = fma(_1852, _1852, _1858);
    float _1862 = fma(_1856, _1856, _1860);
    float _1864 = sqrt(_1862);
    float _1866 = rsqrt(_1862);
    float _1868 = -_1864;
    float _1870 = _1868 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1872 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1874 = precise::clamp(_1872, 0.0, 1.0);
    float _1876 = _1852 * _1866;
    float _1878 = _1848 * _1866;
    float _1880 = abs(_1874);
    float _1882 = log2(_1880);
    float _1884 = _1856 * _1866;
    float _1886 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1888 = _1578 * _1878;
    float _1890 = -_1878;
    float _1892 = -_1886;
    float _1894 = fma(_1890, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1892);
    float _1896 = fma(_1576, _1876, _1888);
    float _1898 = -_1884;
    float _1900 = fma(_1898, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1894);
    float _1902 = fma(_1582, _1884, _1896);
    float _1904 = precise::clamp(_1902, 0.0, 1.0);
    float _1906 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1908 = _1900 + _1906;
    float _1910 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1912 = _1908 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1914 = precise::clamp(_1912, 0.0, 1.0);
    float _1916 = exp2(_1910);
    float _1918 = _1916 * _1914;
    float _1920 = _1904 * _1918;
    float _1922 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1924 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1926 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_77.x = _1922;
    out.m_77.y = _1924;
    out.m_77.z = _1926;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1698 = false;
    bool _468 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1983 = as_type<float>(_116);
        out.gl_Position.z = _1983;
    }
    if (!_104)
    {
        return out;
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = 0.0;
    if (_130)
    {
        float _138 = float(_100);
        _136 = _138;
    }
    float _140 = _136;
    bool _142 = _134 >= _140;
    bool _144 = !_130;
    bool _146 = _142 || _144;
    if (_146)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _110;
    if (_146)
    {
        out.m_45.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2051 = as_type<float>(_152);
        out.gl_Position.z = _2051;
    }
    if (_146)
    {
        return out;
    }
    float _154 = in.m_49.x;
    float _156 = in.m_49.y;
    float _158 = in.m_49.z;
    float _160 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _162 = in.m_51.x;
    float _164 = in.m_51.y;
    float _166 = in.m_51.z;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    float _184 = in.m_42.x;
    float _186 = in.m_42.y;
    float _188 = in.m_42.z;
    float _190 = _154 * _154;
    float _192 = _156 * _156;
    float _194 = fma(_162, _162, _190);
    float _196 = fma(_164, _164, _192);
    float _198 = fma(_178, _178, _194);
    float _200 = _158 * _158;
    float _202 = fma(_180, _180, _196);
    float _204 = sqrt(_198);
    float _206 = fma(_166, _166, _200);
    float _208 = fma(_182, _182, _206);
    float _210 = in.m_55.w;
    float _212 = sqrt(_202);
    bool _214 = _204 > 0.0;
    float _216 = sqrt(_208);
    float _218 = in.m_47.x;
    float _220 = in.m_47.y;
    float _222 = in.m_47.z;
    bool _224 = _212 > 0.0;
    float _226 = 0.0;
    float _228 = _212;
    float _230 = _160;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _234 = _202;
    if (_214)
    {
        float _236 = rsqrt(_198);
        _226 = _236;
    }
    float _238 = _226;
    bool _240 = _216 > 0.0;
    float _242 = _216;
    if (!_176)
    {
        float _244 = _160 * _160;
        float _246 = _244 * 0.5;
        _242 = _246;
    }
    float _248 = _242;
    float _250 = _248;
    if (!_176)
    {
        float _252 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _250 = _252;
    }
    float _254 = _250;
    bool _256 = !_176;
    float _258 = _254;
    float _260 = 0.0;
    float _262 = _238;
    if (!_256)
    {
        float _264 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = log2(_264);
        float _268 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _270 = _268 + 1.0;
        float _272 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _274 = _160 * _266;
        float _276 = 1.0 / _270;
        float _278 = _272 * 0.693147182464599609375;
        float _280 = exp2(_274);
        float _282 = 1.0 / _278;
        float _284 = _280 + (-1.0);
        float _286 = -_284;
        float _288 = fma(_286, _282, _160);
        float _290 = _288 * _276;
        float _292 = _290 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _258 = _292;
        _260 = _276;
        _228 = _280;
    }
    float _294 = _258;
    float _296 = _260;
    float _298 = _228;
    bool _300 = !_176;
    float _302 = _296;
    float _304 = _298;
    if (!_300)
    {
        float _306 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = log2(_306);
        float _310 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _312 = _310 + 1.0;
        float _314 = 1.0 / _312;
        float _316 = _160 * _308;
        float _318 = exp2(_316);
        float _320 = -_318;
        float _322 = _320 + 1.0;
        float _324 = _322 * _314;
        _230 = _324;
        _232 = _312;
    }
    float _326 = _230;
    float _328 = _232;
    float _330 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _332 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _334 = _328;
    float _336 = _330;
    if (!_214)
    {
        _302 = 0.0;
    }
    float _338 = _302;
    float _340 = _338;
    if (_214)
    {
        float _342 = _238 * _162;
        _340 = _342;
    }
    float _344 = _340;
    float _346 = fma(_326, _218, _330);
    float _348 = fma(_326, _220, _332);
    float _350 = _348;
    float _352 = _346;
    if (!_214)
    {
        _304 = 0.0;
    }
    float _354 = _304;
    float _356 = _218;
    float _358 = _354;
    if (_224)
    {
        float _360 = rsqrt(_202);
        _356 = _360;
    }
    float _362 = _356;
    float _364 = fma(_346, _210, _184);
    float _366 = fma(_348, _210, _186);
    float _368 = _364;
    float _370 = _366;
    if (!_214)
    {
        _334 = 0.0;
    }
    float _372 = _334;
    float _374 = _372;
    if (_214)
    {
        float _376 = _238 * _154;
        _358 = _376;
    }
    float _378 = _358;
    if (_214)
    {
        float _380 = _238 * _178;
        _374 = _380;
    }
    float _382 = _374;
    bool _384 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    out.m_57.x = _364;
    out.m_57.y = _366;
    float _386 = _220;
    if (_240)
    {
        float _388 = rsqrt(_208);
        _386 = _388;
    }
    float _390 = _386;
    float _392 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _394 = 0.0;
    if (!_224)
    {
        _394 = 0.0;
        _350 = 0.0;
    }
    float _396 = _394;
    float _398 = _350;
    float _400 = _398;
    float _402 = _396;
    if (!_224)
    {
        _262 = 0.0;
    }
    float _404 = _262;
    float _406 = fma(_326, _222, _392);
    float _408 = _404;
    if (!_240)
    {
        _336 = 0.0;
    }
    float _410 = _336;
    float _412 = _410;
    if (!_240)
    {
        _234 = 0.0;
    }
    float _414 = _234;
    float _416 = _414;
    if (_224)
    {
        float _418 = _362 * _164;
        _408 = _418;
    }
    float _420 = _408;
    if (!_240)
    {
        _352 = 0.0;
    }
    float _422 = _352;
    float _424 = _422;
    if (_224)
    {
        float _426 = _362 * _156;
        _400 = _426;
    }
    float _428 = _400;
    if (_224)
    {
        float _430 = _362 * _180;
        _402 = _430;
    }
    float _432 = _402;
    float _434 = fma(_406, _210, _188);
    if (_240)
    {
        float _436 = _390 * _166;
        _412 = _436;
    }
    float _438 = _412;
    if (_240)
    {
        float _440 = _390 * _158;
        _416 = _440;
    }
    float _442 = _416;
    if (_240)
    {
        float _444 = _390 * _182;
        _424 = _444;
    }
    float _446 = _424;
    bool _448 = !_384;
    float _466;
    if (!_448)
    {
        float _450 = in.m_59.x;
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _454 = _450 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _456 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _458 = _456 * _452;
        float _460 = floor(_458);
        float _462 = -_460;
        float _464 = _458 + _462;
        _466 = _464;
        _468 = true;
    }
    else
    {
        float _470 = float(_100);
        float _472 = 1.0 / _470;
        float _474 = _134 * _472;
        _466 = _474;
    }
    _468 = false;
    float _476 = _466;
    float _478 = in.m_59.x;
    float _480 = _366 * _180;
    float _482 = in.m_61.x;
    float _484 = in.m_61.y;
    float _486 = in.m_61.z;
    float _488 = _366 * _164;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _498 = fma(_364, _178, _480);
    float _500 = 1.0 / _492;
    float _502 = fma(_364, _162, _488);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _506 = _476 + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _510 = _476 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _512;
    float _516 = fma(_434, _182, _498);
    float _518 = 1.0 / _496;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _522 = _476 + _520;
    float _524 = _366 * _156;
    float _526 = fma(_478, 0.2000000476837158203125, 0.89999997615814208984375);
    float _528 = _478 * 100.0;
    float _530 = _506 * _500;
    float _532 = 1.0 / _514;
    float _534 = _526 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    bool _536 = _482 > 0.0;
    float _538 = fma(_134, 0.00999999977648258209228515625, _528);
    bool _540 = _482 >= 0.0;
    bool _542 = isnan(_482);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    float _550 = fma(_134, _534, _528);
    float _552 = _522 * _518;
    float _554 = abs(_482);
    float _556 = -_554;
    float _558 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[191].y, _550);
    float _560 = _538 * 0.15915493667125701904296875;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _570 = _558 * 0.15915493667125701904296875;
    int _572 = _548 ? 0 : 1;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _574;
    float _578 = _510 * _532;
    float _580 = _570 * 6.283185482025146484375;
    float _582 = cos(_580);
    int _584 = ~_572;
    int _586 = _584 + 1;
    int _588 = _586 + 1;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _590;
    int _594 = _588;
    if (!_536)
    {
        int _596 = ~_572;
        int _598 = _596 + 1;
        _594 = _598;
    }
    int _600 = _594;
    float _602 = abs(_482);
    float _604 = -_602;
    float _606 = _604 + 1.0;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _616 = float(_600);
    float _618 = _570 * 6.283185482025146484375;
    float _620 = sin(_618);
    float _622 = -_606;
    float _624 = fma(_622, _606, 1.0);
    bool _626 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _628 = isnan(_476);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = fma(_568, _552, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _640 = _616 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    bool _642 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _644 = isnan(_476);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = fma(_610, _552, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _656 = fma(_614, _552, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _658 = _582 * _624;
    bool _660 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _662 = isnan(_476);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = _560 * 6.283185482025146484375;
    float _674 = sin(_672);
    bool _676 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _678 = isnan(_476);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = -_652;
    float _690 = _688 + 1.0;
    float _692 = _658 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _694 = -_670;
    float _696 = _694 + 1.0;
    float _698 = fma(_564, _530, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _700 = _620 * _640;
    float _702 = _686 * _690;
    float _704 = -_686;
    float _706 = _704 + 1.0;
    float _708 = fma(_576, _530, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _710 = _700 * 0.15915493667125701904296875;
    float _712 = _652 * _696;
    float _714 = _636 * _706;
    float _716 = fma(_592, _530, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _718;
    float _722 = _658 * _640;
    float _724 = _692 * 0.15915493667125701904296875;
    float _726 = _698 * _714;
    float _728 = _708 * _714;
    float _730 = -_636;
    float _732 = _730 + 1.0;
    float _734 = _722 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _736 = fma(_720, _578, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _738 = _716 * _714;
    float _740 = _710 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = fma(_674, 2.0, 2.0);
    float _746 = precise::clamp(_744, 0.0, 1.0);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _748;
    float _752 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[143].x, _726);
    float _754 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[143].y, _728);
    float _756 = _734 * 0.15915493667125701904296875;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _758;
    float _762 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[143].z, _738);
    float _764 = _710 * 6.283185482025146484375;
    float _766 = cos(_764);
    float _768 = fma(_750, _578, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _770 = fma(_654, _702, _754);
    float _772 = fma(_760, _578, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _774 = fma(_638, _702, _752);
    float _776 = fma(_656, _702, _762);
    float _778 = fma(_768, _712, _770);
    float _780 = fma(_364, _154, _524);
    float _782 = _724 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = fma(_736, _712, _774);
    float _788 = fma(_772, _712, _776);
    float _790 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[146].y, _778);
    float _792 = in.m_63.x;
    float _794 = fma(_746, 0.949999988079071044921875, -1.0);
    float _796 = _724 * 6.283185482025146484375;
    float _798 = cos(_796);
    float _800 = in.m_55.x;
    float _802 = in.m_55.y;
    float _804 = in.m_55.z;
    float _806 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[146].x, _786);
    float _808 = _766 * _482;
    float _810 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[192].z, 1.0);
    float _812 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[146].z, _788);
    float _814 = _550 * 0.15915493667125701904296875;
    float _816 = _742 * _482;
    float _818 = _756 * 6.283185482025146484375;
    float _820 = cos(_818);
    float _822 = _784 * _486;
    float _824 = _756 * 6.283185482025146484375;
    float _826 = sin(_824);
    float _828 = _798 * _486;
    float _830 = -_822;
    float _832 = fma(_798, _484, _830);
    float _834 = fma(_784, _484, _828);
    float _836 = _832 * _820;
    float _838 = fma(_834, _742, _808);
    float _840 = _814 * 6.283185482025146484375;
    float _842 = sin(_840);
    float _844 = _806 * _800;
    float _846 = -_816;
    float _848 = fma(_834, _766, _846);
    float _850 = _790 * _802;
    float _852 = _812 * _804;
    float _854 = _832 * _826;
    float _856 = fma(_838, _826, _836);
    float _858 = -_848;
    float _860 = _858 + _486;
    float _862 = _850 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _864 = -_854;
    float _866 = fma(_838, _820, _864);
    float _868 = -_856;
    float _870 = _868 + _484;
    float _872 = fma(_860, _792, _848);
    float _874 = in.m_53.w;
    float _876 = -_866;
    float _878 = _876 + _482;
    float _880 = fma(_870, _792, _856);
    float _882 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[191].w, _872);
    float _884 = _844 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _886 = fma(_878, _792, _866);
    float _888 = -_484;
    float _890 = _880 + _888;
    float _892 = in.m_51.w;
    float _894 = -_486;
    float _896 = _882 + _894;
    float _898 = -_482;
    float _900 = _886 + _898;
    float _902 = fma(_810, _890, _484);
    float _904 = _852 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _906 = fma(_810, _896, _486);
    float _908 = fma(_810, _900, _482);
    float _910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _902);
    bool _912 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _914 = isnan(0.5);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _920 = _916 || _918;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _908);
    float _924 = _862 * _910;
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _906);
    float _928 = _884 * _922;
    float _930 = _924 * _432;
    float _932 = _904 * _926;
    float _934 = _924 * _420;
    float _936 = fma(_434, _166, _502);
    float _938 = fma(_928, _382, _930);
    float _940 = _516 + _874;
    float _942 = fma(_928, _344, _934);
    float _944 = _924 * _428;
    float _946 = fma(_932, _446, _938);
    float _948 = _936 + _892;
    float _950 = fma(_932, _438, _942);
    float _952 = fma(_928, _378, _944);
    float _954 = _940 + _946;
    float _956 = _948 + _950;
    float _958 = fma(_434, _158, _780);
    float _960 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _962 = _954 + _960;
    float _964 = fma(_932, _442, _952);
    float _966 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _968 = _956 + _966;
    float _970 = _962 * _962;
    float _972 = fma(_968, _968, _970);
    float _974 = in.m_49.w;
    float _976 = sqrt(_972);
    bool _978 = _976 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _980 = _958 + _974;
    float _982 = _980 + _964;
    float _984 = _956;
    if (!_978)
    {
        _368 = _954;
    }
    float _986 = _368;
    float _988 = _986;
    if (!_978)
    {
        _370 = _982;
    }
    float _990 = _370;
    bool _992 = !_978;
    float _994 = _990;
    if (!_992)
    {
        float _996 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _998 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1000 = _976 + _998;
        float _1002 = _982 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1004 = rsqrt(_972);
        float _1006 = _1000 * _996;
        float _1008 = _1006 * 0.15915493667125701904296875;
        float _1010 = _1008 * 6.283185482025146484375;
        float _1012 = cos(_1010);
        float _1014 = _1008 * 6.283185482025146484375;
        float _1016 = sin(_1014);
        float _1018 = _1012 + (-1.0);
        float _1020 = _1018 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1022 = fma(_1016, _1002, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1024 = fma(_982, _1012, _1020);
        float _1026 = _1004 * _1022;
        float _1028 = fma(_968, _1026, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1030 = fma(_962, _1026, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _984 = _1028;
        _994 = _1024;
        _988 = _1030;
    }
    float _1032 = _984;
    float _1034 = _994;
    float _1036 = _988;
    float _1038 = _1034;
    float _1040 = _1032;
    float _1042 = _1036;
    if (!_920)
    {
        float _1044 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1046 = _980 + _1044;
        float _1048 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1050 = _948 + _1048;
        float _1052 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1054 = -_948;
        float _1056 = _1054 + _1032;
        float _1058 = _1046 * _1046;
        float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1062 = _940 + _1060;
        float _1064 = -_980;
        float _1066 = _1064 + _1034;
        float _1068 = fma(_1050, _1050, _1058);
        float _1070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1072 = fma(_1062, _1062, _1068);
        float _1074 = sqrt(_1072);
        float _1076 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1078 = precise::min(_1074, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1080 = _1078 * _1070;
        float _1082 = _1076 * _1080;
        float _1084 = -_940;
        float _1086 = _1084 + _1036;
        float _1088 = fma(_1056, _1082, _948);
        float _1090 = fma(_1066, _1082, _980);
        float _1092 = fma(_1086, _1082, _940);
        _1038 = _1090;
        _1040 = _1088;
        _1042 = _1092;
    }
    float _1094 = _1038;
    float _1096 = _1040;
    float _1098 = _1042;
    float _1100 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1102 = _1094 + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1106 = _1096 + _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1110 = _1098 + _1108;
    float _1112 = _1102 * _1102;
    float _1114 = fma(_1106, _1106, _1112);
    float _1116 = fma(_1110, _1110, _1114);
    float _1118 = rsqrt(_1116);
    float _1120 = sqrt(_1116);
    float _1122 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1124 = _1106 * _1122;
    float _1126 = _1110 * _1122;
    float _1128 = _1124 * _1124;
    float _1130 = _1126 * _1126;
    float _1132 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1134 = _1128 + _1130;
    float _1136 = precise::max(0.0, _1132);
    float _1138 = sqrt(_1134);
    float _1140 = -_1122;
    float _1142 = -_1136;
    float _1144 = fma(_1102, _1140, _1142);
    bool _1146 = _1138 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1148 = _1122;
    float _1150 = _1102;
    float _1152 = _1136;
    float _1154 = _1128;
    float _1156 = _1130;
    if (!_1146)
    {
        _1148 = _1124;
    }
    float _1158 = _1148;
    float _1160 = _1158;
    if (!_1146)
    {
        _1150 = _1144;
    }
    float _1162 = _1150;
    float _1164 = _1162;
    if (!_1146)
    {
        _1152 = _1126;
    }
    float _1166 = _1152;
    bool _1168 = !_1146;
    float _1170 = _1166;
    if (!_1168)
    {
        float _1172 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1176 = _1138 + _1174;
        float _1178 = _1144 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1180 = rsqrt(_1134);
        float _1182 = _1176 * _1172;
        float _1184 = _1182 * 0.15915493667125701904296875;
        float _1186 = _1184 * 6.283185482025146484375;
        float _1188 = sin(_1186);
        float _1190 = _1184 * 6.283185482025146484375;
        float _1192 = cos(_1190);
        float _1194 = fma(_1188, _1178, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1196 = _1180 * _1194;
        float _1198 = _1192 + (-1.0);
        float _1200 = _1124 * _1196;
        float _1202 = _1198 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1204 = _1126 * _1196;
        float _1206 = fma(_1144, _1192, _1202);
        float _1208 = _1200 * _1200;
        float _1210 = _1204 * _1204;
        _1164 = _1206;
        _1154 = _1208;
        _1156 = _1210;
        _1160 = _1200;
        _1170 = _1204;
    }
    float _1212 = _1164;
    float _1214 = _1154;
    float _1216 = _1156;
    float _1218 = _1160;
    float _1220 = _1170;
    float _1222 = fma(_1212, _1212, _1214);
    float _1224 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1226 = _1222 + _1216;
    float _1228 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1230 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1224);
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1234 = fma(_1120, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1232);
    float _1236 = precise::clamp(_1234, 0.0, 1.0);
    float _1238 = rsqrt(_1226);
    float _1240 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1228);
    float _1242 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1230);
    float _1244 = -_1236;
    float _1246 = _1244 + 1.0;
    float _1248 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1250 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1240);
    float _1252 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1254 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1256 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1248);
    float _1258 = abs(_1246);
    float _1260 = log2(_1258);
    float _1262 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1264 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1266 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1256);
    float _1268 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1270 = -_1262;
    float _1272 = fma(_1254, _1270, 1.0);
    float _1274 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1276 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1278 = _1238 * _1218;
    float _1280 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1268);
    float _1282 = _1238 * _1212;
    float _1284 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1274);
    float _1286 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1288 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1280);
    float _1290 = _1238 * _1220;
    float _1292 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1284);
    float _1294 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1296 = -_1286;
    float _1298 = fma(_1282, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1296);
    float _1300 = _1288 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1302 = log2(_1272);
    float _1304 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1306 = -_1290;
    float _1308 = fma(_1306, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1298);
    float _1310 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1292);
    float _1312 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1314 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1304);
    float _1316 = fma(_1308, -0.5, 0.5);
    float _1318 = fma(_1308, 0.5, 0.5);
    float _1320 = exp2(_1294);
    float _1322 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1312);
    float _1324 = _1282 + 1.0;
    float _1326 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1314);
    float _1328 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1322);
    float _1330 = fma(_1318, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1332 = 1.0 / _1310;
    float _1334 = _1302 * 0.693147182464599609375;
    float _1336 = fma(_1318, _1330, -0.212114393711090087890625);
    float _1338 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1340 = fma(_1318, _1336, 1.570728778839111328125);
    float _1342 = sqrt(_1316);
    float _1344 = -_1282;
    float _1346 = fma(_1320, _1324, _1344);
    float _1348 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1328);
    float _1350 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1326);
    float _1352 = fma(_1346, 0.5, 0.5);
    float _1354 = _1348 * _1332;
    float _1356 = _1350 * _1332;
    float _1358 = fma(_1354, 0.5, 0.5);
    float _1360 = fma(_1356, -0.5, 0.5);
    float _1362 = _1342 * 0.636619746685028076171875;
    float3 _3903 = float3(_1358, _1360, _1338);
    float _1364 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3903, float3(0.0), isnan(_3903)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3903, float3(0.0), isnan(_3903)), level(0.0)).x;
    float _1366 = -_1340;
    float _1368 = fma(_1362, _1366, 1.0);
    float2 _3919 = float2(_1368, _1352);
    float3 _1372 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3919, float2(0.0), isnan(_3919)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3919, float2(0.0), isnan(_3919)), level(0.0)).xyz;
    float _1374 = _1372.x;
    float _1376 = _1372.y;
    float _1378 = _1372.z;
    float _1380 = in.m_65.x;
    float _1382 = in.m_65.y;
    float _1384 = in.m_65.z;
    bool _1386 = _902 != 0.0;
    bool _1388 = isnan(_902);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan(0.0);
    bool _1394 = _1390 || _1392;
    float _1396 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1398 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1400 = _908 == 0.0;
    bool _1402 = !_1394;
    bool _1404 = _1400 && _1402;
    float _1406 = exp2(_1396);
    float _1408 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1398);
    bool _1410 = _906 == 0.0;
    bool _1412 = _1410 && _1404;
    out.m_67.w = _1310;
    float _1414 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1408);
    float _1416 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1414);
    out.gl_Position.x = _1348;
    out.gl_Position.y = _1350;
    out.gl_Position.z = _1416;
    out.gl_Position.w = _1310;
    float _1418 = _798 * _1384;
    float _1420 = _784 * _1384;
    float _1422 = _766 * _1380;
    float _1424 = _742 * _1380;
    float _1426 = fma(_784, _1382, _1418);
    float _1428 = -_1420;
    float _1430 = fma(_798, _1382, _1428);
    float _1432 = -_1406;
    float _1434 = _1432 + 1.0;
    float _1436 = fma(_742, _1426, _1422);
    float _1438 = _820 * _1430;
    float _1440 = _826 * _1430;
    float _1442 = -_1424;
    float _1444 = fma(_766, _1426, _1442);
    float _1446 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1448 = fma(_826, _1436, _1438);
    float _1450 = -_1440;
    float _1452 = fma(_820, _1436, _1450);
    float _1454 = -_1448;
    float _1456 = _1454 + _1382;
    float _1458 = -_1452;
    float _1460 = _1458 + _1380;
    float _1462 = fma(_1456, _792, _1448);
    float _1464 = fma(_1460, _792, _1452);
    float _1466 = -_1444;
    float _1468 = _1466 + _1384;
    float _1470 = _1462 * _1462;
    float _1472 = fma(_1468, _792, _1444);
    float _1474 = fma(_1464, _1464, _1470);
    float _1476 = fma(_1472, _1472, _1474);
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1488 = rsqrt(_1476);
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1492 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1494 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1496 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1498 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1492;
    out.m_69.y = _1494;
    out.m_69.z = _1496;
    out.m_71.x = _1498;
    out.m_71.y = _1500;
    out.m_71.z = _1502;
    float _1504 = -_1380;
    float _1506 = fma(_1464, _1488, _1504);
    float _1508 = -_1382;
    float _1510 = fma(_1462, _1488, _1508);
    float _1512 = -_1384;
    float _1514 = fma(_1472, _1488, _1512);
    float _1516 = fma(_810, _1506, _1380);
    float _1518 = fma(_810, _1510, _1382);
    float _1520 = fma(_810, _1514, _1384);
    float _1522 = _1348 + _1310;
    float _1524 = _1516;
    float _1526 = _1518;
    float _1528 = _1520;
    float _1530 = _1310;
    float _1532 = _1416;
    float _1534 = _1350;
    float _1536 = _1348;
    if (!_1412)
    {
        float _1538 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1516);
        _1524 = _1538;
    }
    float _1540 = _1524;
    if (!_1412)
    {
        float _1542 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1518);
        _1526 = _1542;
    }
    float _1544 = _1526;
    if (!_1412)
    {
        float _1546 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1520);
        _1528 = _1546;
    }
    float _1548 = _1528;
    bool _1550 = _1120 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1552 = isnan(_1120);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1558 = _1554 || _1556;
    float _1560 = _1522 * 0.5;
    float _1562 = _420 * _1544;
    float _1564 = _428 * _1544;
    float _1566 = _432 * _1544;
    float _1568 = fma(_344, _1540, _1562);
    float _1570 = fma(_378, _1540, _1564);
    float _1572 = _1310 * 0.5;
    float _1574 = fma(_382, _1540, _1566);
    float _1576 = fma(_438, _1548, _1568);
    float _1578 = fma(_442, _1548, _1570);
    float _1580 = fma(_1350, -0.5, _1572);
    float _1582 = fma(_446, _1548, _1574);
    out.m_67.x = _1560;
    float _1584 = _1574;
    float _1586 = _1560;
    if (!_1558)
    {
        _1584 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1588 = _1584;
    float _1590 = _1588;
    float _1592 = _1588;
    if (!_1558)
    {
        _1530 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1594 = _1530;
    out.m_67.y = _1580;
    float _1596 = _1594;
    float _1598 = _1594;
    if (!_1558)
    {
        _1532 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1600 = _1532;
    float _1602 = _1600;
    float _1604 = _1600;
    if (!_1558)
    {
        _1534 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1606 = _1534;
    out.m_73.x = _1576;
    out.m_73.y = _1578;
    out.m_73.z = _1582;
    float _1608 = _1606;
    float _1610 = _1606;
    if (!_1558)
    {
        _1586 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1612 = _1586;
    float _1614 = _1612;
    float _1616 = _1612;
    if (!_1558)
    {
        _1536 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1618 = _1536;
    float _1620 = _1446 * _1364;
    float _1622 = -_1446;
    float _1624 = _1622 + 1.0;
    float _1626 = _1374 * _1620;
    float _1628 = _1376 * _1620;
    float _1630 = _1378 * _1620;
    out.m_75.x = _1626;
    out.m_75.y = _1628;
    out.m_75.z = _1630;
    out.m_75.w = _1624;
    bool _1632 = !_1558;
    float _1634 = _1618;
    float _1636 = _1618;
    if (!_1632)
    {
        bool _1638 = _1120 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1640 = isnan(_1120);
        bool _1642 = _1638 || _1640;
        bool _1644 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1646 = _1642 || _1644;
        if (!_1646)
        {
            float _1648 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1650 = _1120 + _1648;
            float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1654 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1652;
            float _1656 = 1.0 / _1654;
            float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1660 = _1658 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1664 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1668 = _1666 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1670 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1672 = _1670 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1676 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1678 = _1650 * _1656;
            float _1680 = precise::clamp(_1678, 0.0, 1.0);
            float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1684 = _1682 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1686 = fma(_1680, _1660, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1688 = fma(_1680, _1684, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1690 = fma(_1680, _1664, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1692 = fma(_1680, _1668, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1694 = fma(_1680, _1672, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1696 = fma(_1680, _1676, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1592 = _1688;
            _1610 = _1694;
            _1616 = _1686;
            _1604 = _1692;
            _1598 = _1690;
            _1636 = _1696;
            _1698 = true;
        }
        else
        {
            bool _1700 = _1120 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1702 = isnan(_1120);
            bool _1704 = _1700 || _1702;
            bool _1706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1708 = _1704 || _1706;
            if (!_1708)
            {
                _1614 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1710 = _1614;
            _1616 = _1710;
            if (!_1708)
            {
                _1590 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1712 = _1590;
            _1592 = _1712;
            if (!_1708)
            {
                _1596 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1714 = _1596;
            _1598 = _1714;
            if (!_1708)
            {
                _1602 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1716 = _1602;
            _1604 = _1716;
            if (!_1708)
            {
                _1608 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1718 = _1608;
            _1610 = _1718;
            if (!_1708)
            {
                _1634 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1720 = _1634;
            bool _1722 = !_1708;
            _1636 = _1720;
            if (!_1722)
            {
                bool _1724 = _1120 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1726 = isnan(_1120);
                bool _1728 = _1724 || _1726;
                bool _1730 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1732 = _1728 || _1730;
                if (!_1732)
                {
                    float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1736 = _1120 + _1734;
                    float _1738 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1740 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1738;
                    float _1742 = 1.0 / _1740;
                    float _1744 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1746 = _1744 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1748 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1750 = _1748 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1754 = _1752 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1756 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1758 = _1756 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1762 = _1760 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1764 = _1736 * _1742;
                    float _1766 = precise::clamp(_1764, 0.0, 1.0);
                    float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1770 = _1768 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1772 = fma(_1766, _1746, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1774 = fma(_1766, _1770, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1776 = fma(_1766, _1750, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1778 = fma(_1766, _1754, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1780 = fma(_1766, _1758, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1782 = fma(_1766, _1762, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1592 = _1774;
                    _1610 = _1780;
                    _1616 = _1772;
                    _1604 = _1778;
                    _1598 = _1776;
                    _1636 = _1782;
                    _1698 = true;
                }
                else
                {
                    _1592 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1610 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1616 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1604 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1598 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1636 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1698 = false;
    float _1784 = _1592;
    float _1786 = _1610;
    float _1788 = _1616;
    float _1790 = _1604;
    float _1792 = _1598;
    float _1794 = _1636;
    float _1796 = fma(_1578, -0.5, 0.5);
    float _1798 = precise::clamp(_1796, 0.0, 1.0);
    float _1800 = -_1784;
    float _1802 = _1800 + _1786;
    float _1804 = -_1788;
    float _1806 = _1804 + _1790;
    float _1808 = -_1792;
    float _1810 = _1808 + _1794;
    bool _1812 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1814 = fma(_1798, _1802, _1784);
    float _1816 = fma(_1798, _1806, _1788);
    float _1818 = fma(_1798, _1810, _1792);
    float _1820 = _1814 * 0.586610972881317138671875;
    out.m_77.x = 0.0;
    float _1822 = fma(_1816, 0.298911988735198974609375, _1820);
    out.m_45.x = 1.0;
    float _1824 = fma(_1818, 0.114477999508380889892578125, _1822);
    float _1826 = -_1824;
    float _1828 = _1816 + _1826;
    float _1830 = -_1824;
    float _1832 = _1814 + _1830;
    float _1834 = -_1824;
    float _1836 = _1818 + _1834;
    float _1838 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1840 = fma(_1828, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1824);
    float _1842 = fma(_1832, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1824);
    float _1844 = fma(_1836, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1824);
    out.m_79.w = _1838;
    out.m_81.x = _1840;
    out.m_81.y = _1842;
    out.m_81.z = _1844;
    if (!_1812)
    {
        return out;
    }
    float _1846 = -_1094;
    float _1848 = _1846 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1850 = -_1096;
    float _1852 = _1850 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1854 = -_1098;
    float _1856 = _1854 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1858 = _1848 * _1848;
    float _1860 = fma(_1852, _1852, _1858);
    float _1862 = fma(_1856, _1856, _1860);
    float _1864 = sqrt(_1862);
    float _1866 = rsqrt(_1862);
    float _1868 = -_1864;
    float _1870 = _1868 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1872 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1874 = precise::clamp(_1872, 0.0, 1.0);
    float _1876 = _1852 * _1866;
    float _1878 = _1848 * _1866;
    float _1880 = abs(_1874);
    float _1882 = log2(_1880);
    float _1884 = _1856 * _1866;
    float _1886 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1888 = _1578 * _1878;
    float _1890 = -_1878;
    float _1892 = -_1886;
    float _1894 = fma(_1890, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1892);
    float _1896 = fma(_1576, _1876, _1888);
    float _1898 = -_1884;
    float _1900 = fma(_1898, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1894);
    float _1902 = fma(_1582, _1884, _1896);
    float _1904 = precise::clamp(_1902, 0.0, 1.0);
    float _1906 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1908 = _1900 + _1906;
    float _1910 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1912 = _1908 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1914 = precise::clamp(_1912, 0.0, 1.0);
    float _1916 = exp2(_1910);
    float _1918 = _1916 * _1914;
    float _1920 = _1904 * _1918;
    float _1922 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1924 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1926 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_77.x = _1922;
    out.m_77.y = _1924;
    out.m_77.z = _1926;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1698 = false;
    bool _468 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1983 = as_type<float>(_116);
        out.gl_Position.z = _1983;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = 0.0;
    if (_130)
    {
        float _138 = float(_100);
        _136 = _138;
    }
    float _140 = _136;
    bool _142 = _134 >= _140;
    bool _144 = !_130;
    bool _146 = _142 || _144;
    if (_146)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _110;
    if (_146)
    {
        out.m_45.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2051 = as_type<float>(_152);
        out.gl_Position.z = _2051;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_49.x;
    float _156 = in.m_49.y;
    float _158 = in.m_49.z;
    float _160 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _162 = in.m_51.x;
    float _164 = in.m_51.y;
    float _166 = in.m_51.z;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    float _184 = in.m_42.x;
    float _186 = in.m_42.y;
    float _188 = in.m_42.z;
    float _190 = _154 * _154;
    float _192 = _156 * _156;
    float _194 = fma(_162, _162, _190);
    float _196 = fma(_164, _164, _192);
    float _198 = fma(_178, _178, _194);
    float _200 = _158 * _158;
    float _202 = fma(_180, _180, _196);
    float _204 = sqrt(_198);
    float _206 = fma(_166, _166, _200);
    float _208 = fma(_182, _182, _206);
    float _210 = in.m_55.w;
    float _212 = sqrt(_202);
    bool _214 = _204 > 0.0;
    float _216 = sqrt(_208);
    float _218 = in.m_47.x;
    float _220 = in.m_47.y;
    float _222 = in.m_47.z;
    bool _224 = _212 > 0.0;
    float _226 = 0.0;
    float _228 = _212;
    float _230 = _160;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _234 = _202;
    if (_214)
    {
        float _236 = rsqrt(_198);
        _226 = _236;
    }
    float _238 = _226;
    bool _240 = _216 > 0.0;
    float _242 = _216;
    if (!_176)
    {
        float _244 = _160 * _160;
        float _246 = _244 * 0.5;
        _242 = _246;
    }
    float _248 = _242;
    float _250 = _248;
    if (!_176)
    {
        float _252 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _250 = _252;
    }
    float _254 = _250;
    bool _256 = !_176;
    float _258 = _254;
    float _260 = 0.0;
    float _262 = _238;
    if (!_256)
    {
        float _264 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = log2(_264);
        float _268 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _270 = _268 + 1.0;
        float _272 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _274 = _160 * _266;
        float _276 = 1.0 / _270;
        float _278 = _272 * 0.693147182464599609375;
        float _280 = exp2(_274);
        float _282 = 1.0 / _278;
        float _284 = _280 + (-1.0);
        float _286 = -_284;
        float _288 = fma(_286, _282, _160);
        float _290 = _288 * _276;
        float _292 = _290 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _258 = _292;
        _260 = _276;
        _228 = _280;
    }
    float _294 = _258;
    float _296 = _260;
    float _298 = _228;
    bool _300 = !_176;
    float _302 = _296;
    float _304 = _298;
    if (!_300)
    {
        float _306 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = log2(_306);
        float _310 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _312 = _310 + 1.0;
        float _314 = 1.0 / _312;
        float _316 = _160 * _308;
        float _318 = exp2(_316);
        float _320 = -_318;
        float _322 = _320 + 1.0;
        float _324 = _322 * _314;
        _230 = _324;
        _232 = _312;
    }
    float _326 = _230;
    float _328 = _232;
    float _330 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _332 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _334 = _328;
    float _336 = _330;
    if (!_214)
    {
        _302 = 0.0;
    }
    float _338 = _302;
    float _340 = _338;
    if (_214)
    {
        float _342 = _238 * _162;
        _340 = _342;
    }
    float _344 = _340;
    float _346 = fma(_326, _218, _330);
    float _348 = fma(_326, _220, _332);
    float _350 = _348;
    float _352 = _346;
    if (!_214)
    {
        _304 = 0.0;
    }
    float _354 = _304;
    float _356 = _218;
    float _358 = _354;
    if (_224)
    {
        float _360 = rsqrt(_202);
        _356 = _360;
    }
    float _362 = _356;
    float _364 = fma(_346, _210, _184);
    float _366 = fma(_348, _210, _186);
    float _368 = _364;
    float _370 = _366;
    if (!_214)
    {
        _334 = 0.0;
    }
    float _372 = _334;
    float _374 = _372;
    if (_214)
    {
        float _376 = _238 * _154;
        _358 = _376;
    }
    float _378 = _358;
    if (_214)
    {
        float _380 = _238 * _178;
        _374 = _380;
    }
    float _382 = _374;
    bool _384 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    out.m_57.x = _364;
    out.m_57.y = _366;
    float _386 = _220;
    if (_240)
    {
        float _388 = rsqrt(_208);
        _386 = _388;
    }
    float _390 = _386;
    float _392 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _394 = 0.0;
    if (!_224)
    {
        _394 = 0.0;
        _350 = 0.0;
    }
    float _396 = _394;
    float _398 = _350;
    float _400 = _398;
    float _402 = _396;
    if (!_224)
    {
        _262 = 0.0;
    }
    float _404 = _262;
    float _406 = fma(_326, _222, _392);
    float _408 = _404;
    if (!_240)
    {
        _336 = 0.0;
    }
    float _410 = _336;
    float _412 = _410;
    if (!_240)
    {
        _234 = 0.0;
    }
    float _414 = _234;
    float _416 = _414;
    if (_224)
    {
        float _418 = _362 * _164;
        _408 = _418;
    }
    float _420 = _408;
    if (!_240)
    {
        _352 = 0.0;
    }
    float _422 = _352;
    float _424 = _422;
    if (_224)
    {
        float _426 = _362 * _156;
        _400 = _426;
    }
    float _428 = _400;
    if (_224)
    {
        float _430 = _362 * _180;
        _402 = _430;
    }
    float _432 = _402;
    float _434 = fma(_406, _210, _188);
    if (_240)
    {
        float _436 = _390 * _166;
        _412 = _436;
    }
    float _438 = _412;
    if (_240)
    {
        float _440 = _390 * _158;
        _416 = _440;
    }
    float _442 = _416;
    if (_240)
    {
        float _444 = _390 * _182;
        _424 = _444;
    }
    float _446 = _424;
    bool _448 = !_384;
    float _466;
    if (!_448)
    {
        float _450 = in.m_59.x;
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _454 = _450 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _456 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _458 = _456 * _452;
        float _460 = floor(_458);
        float _462 = -_460;
        float _464 = _458 + _462;
        _466 = _464;
        _468 = true;
    }
    else
    {
        float _470 = float(_100);
        float _472 = 1.0 / _470;
        float _474 = _134 * _472;
        _466 = _474;
    }
    _468 = false;
    float _476 = _466;
    float _478 = in.m_59.x;
    float _480 = _366 * _180;
    float _482 = in.m_61.x;
    float _484 = in.m_61.y;
    float _486 = in.m_61.z;
    float _488 = _366 * _164;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _498 = fma(_364, _178, _480);
    float _500 = 1.0 / _492;
    float _502 = fma(_364, _162, _488);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _506 = _476 + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _510 = _476 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _512;
    float _516 = fma(_434, _182, _498);
    float _518 = 1.0 / _496;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _522 = _476 + _520;
    float _524 = _366 * _156;
    float _526 = fma(_478, 0.2000000476837158203125, 0.89999997615814208984375);
    float _528 = _478 * 100.0;
    float _530 = _506 * _500;
    float _532 = 1.0 / _514;
    float _534 = _526 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    bool _536 = _482 > 0.0;
    float _538 = fma(_134, 0.00999999977648258209228515625, _528);
    bool _540 = _482 >= 0.0;
    bool _542 = isnan(_482);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    float _550 = fma(_134, _534, _528);
    float _552 = _522 * _518;
    float _554 = abs(_482);
    float _556 = -_554;
    float _558 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[191].y, _550);
    float _560 = _538 * 0.15915493667125701904296875;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _570 = _558 * 0.15915493667125701904296875;
    int _572 = _548 ? 0 : 1;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _574;
    float _578 = _510 * _532;
    float _580 = _570 * 6.283185482025146484375;
    float _582 = cos(_580);
    int _584 = ~_572;
    int _586 = _584 + 1;
    int _588 = _586 + 1;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _590;
    int _594 = _588;
    if (!_536)
    {
        int _596 = ~_572;
        int _598 = _596 + 1;
        _594 = _598;
    }
    int _600 = _594;
    float _602 = abs(_482);
    float _604 = -_602;
    float _606 = _604 + 1.0;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _616 = float(_600);
    float _618 = _570 * 6.283185482025146484375;
    float _620 = sin(_618);
    float _622 = -_606;
    float _624 = fma(_622, _606, 1.0);
    bool _626 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _628 = isnan(_476);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = fma(_568, _552, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _640 = _616 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    bool _642 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _644 = isnan(_476);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = fma(_610, _552, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _656 = fma(_614, _552, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _658 = _582 * _624;
    bool _660 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _662 = isnan(_476);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = _560 * 6.283185482025146484375;
    float _674 = sin(_672);
    bool _676 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _678 = isnan(_476);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = -_652;
    float _690 = _688 + 1.0;
    float _692 = _658 * (*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _694 = -_670;
    float _696 = _694 + 1.0;
    float _698 = fma(_564, _530, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _700 = _620 * _640;
    float _702 = _686 * _690;
    float _704 = -_686;
    float _706 = _704 + 1.0;
    float _708 = fma(_576, _530, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _710 = _700 * 0.15915493667125701904296875;
    float _712 = _652 * _696;
    float _714 = _636 * _706;
    float _716 = fma(_592, _530, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _718;
    float _722 = _658 * _640;
    float _724 = _692 * 0.15915493667125701904296875;
    float _726 = _698 * _714;
    float _728 = _708 * _714;
    float _730 = -_636;
    float _732 = _730 + 1.0;
    float _734 = _722 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _736 = fma(_720, _578, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _738 = _716 * _714;
    float _740 = _710 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = fma(_674, 2.0, 2.0);
    float _746 = precise::clamp(_744, 0.0, 1.0);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _748;
    float _752 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[143].x, _726);
    float _754 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[143].y, _728);
    float _756 = _734 * 0.15915493667125701904296875;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _758;
    float _762 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[143].z, _738);
    float _764 = _710 * 6.283185482025146484375;
    float _766 = cos(_764);
    float _768 = fma(_750, _578, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _770 = fma(_654, _702, _754);
    float _772 = fma(_760, _578, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _774 = fma(_638, _702, _752);
    float _776 = fma(_656, _702, _762);
    float _778 = fma(_768, _712, _770);
    float _780 = fma(_364, _154, _524);
    float _782 = _724 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = fma(_736, _712, _774);
    float _788 = fma(_772, _712, _776);
    float _790 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[146].y, _778);
    float _792 = in.m_63.x;
    float _794 = fma(_746, 0.949999988079071044921875, -1.0);
    float _796 = _724 * 6.283185482025146484375;
    float _798 = cos(_796);
    float _800 = in.m_55.x;
    float _802 = in.m_55.y;
    float _804 = in.m_55.z;
    float _806 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[146].x, _786);
    float _808 = _766 * _482;
    float _810 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[192].z, 1.0);
    float _812 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[146].z, _788);
    float _814 = _550 * 0.15915493667125701904296875;
    float _816 = _742 * _482;
    float _818 = _756 * 6.283185482025146484375;
    float _820 = cos(_818);
    float _822 = _784 * _486;
    float _824 = _756 * 6.283185482025146484375;
    float _826 = sin(_824);
    float _828 = _798 * _486;
    float _830 = -_822;
    float _832 = fma(_798, _484, _830);
    float _834 = fma(_784, _484, _828);
    float _836 = _832 * _820;
    float _838 = fma(_834, _742, _808);
    float _840 = _814 * 6.283185482025146484375;
    float _842 = sin(_840);
    float _844 = _806 * _800;
    float _846 = -_816;
    float _848 = fma(_834, _766, _846);
    float _850 = _790 * _802;
    float _852 = _812 * _804;
    float _854 = _832 * _826;
    float _856 = fma(_838, _826, _836);
    float _858 = -_848;
    float _860 = _858 + _486;
    float _862 = _850 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _864 = -_854;
    float _866 = fma(_838, _820, _864);
    float _868 = -_856;
    float _870 = _868 + _484;
    float _872 = fma(_860, _792, _848);
    float _874 = in.m_53.w;
    float _876 = -_866;
    float _878 = _876 + _482;
    float _880 = fma(_870, _792, _856);
    float _882 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[191].w, _872);
    float _884 = _844 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _886 = fma(_878, _792, _866);
    float _888 = -_484;
    float _890 = _880 + _888;
    float _892 = in.m_51.w;
    float _894 = -_486;
    float _896 = _882 + _894;
    float _898 = -_482;
    float _900 = _886 + _898;
    float _902 = fma(_810, _890, _484);
    float _904 = _852 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _906 = fma(_810, _896, _486);
    float _908 = fma(_810, _900, _482);
    float _910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _902);
    bool _912 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _914 = isnan(0.5);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _920 = _916 || _918;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _908);
    float _924 = _862 * _910;
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _906);
    float _928 = _884 * _922;
    float _930 = _924 * _432;
    float _932 = _904 * _926;
    float _934 = _924 * _420;
    float _936 = fma(_434, _166, _502);
    float _938 = fma(_928, _382, _930);
    float _940 = _516 + _874;
    float _942 = fma(_928, _344, _934);
    float _944 = _924 * _428;
    float _946 = fma(_932, _446, _938);
    float _948 = _936 + _892;
    float _950 = fma(_932, _438, _942);
    float _952 = fma(_928, _378, _944);
    float _954 = _940 + _946;
    float _956 = _948 + _950;
    float _958 = fma(_434, _158, _780);
    float _960 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _962 = _954 + _960;
    float _964 = fma(_932, _442, _952);
    float _966 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _968 = _956 + _966;
    float _970 = _962 * _962;
    float _972 = fma(_968, _968, _970);
    float _974 = in.m_49.w;
    float _976 = sqrt(_972);
    bool _978 = _976 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _980 = _958 + _974;
    float _982 = _980 + _964;
    float _984 = _956;
    if (!_978)
    {
        _368 = _954;
    }
    float _986 = _368;
    float _988 = _986;
    if (!_978)
    {
        _370 = _982;
    }
    float _990 = _370;
    bool _992 = !_978;
    float _994 = _990;
    if (!_992)
    {
        float _996 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _998 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1000 = _976 + _998;
        float _1002 = _982 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1004 = rsqrt(_972);
        float _1006 = _1000 * _996;
        float _1008 = _1006 * 0.15915493667125701904296875;
        float _1010 = _1008 * 6.283185482025146484375;
        float _1012 = cos(_1010);
        float _1014 = _1008 * 6.283185482025146484375;
        float _1016 = sin(_1014);
        float _1018 = _1012 + (-1.0);
        float _1020 = _1018 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1022 = fma(_1016, _1002, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1024 = fma(_982, _1012, _1020);
        float _1026 = _1004 * _1022;
        float _1028 = fma(_968, _1026, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1030 = fma(_962, _1026, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _984 = _1028;
        _994 = _1024;
        _988 = _1030;
    }
    float _1032 = _984;
    float _1034 = _994;
    float _1036 = _988;
    float _1038 = _1034;
    float _1040 = _1032;
    float _1042 = _1036;
    if (!_920)
    {
        float _1044 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1046 = _980 + _1044;
        float _1048 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1050 = _948 + _1048;
        float _1052 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1054 = -_948;
        float _1056 = _1054 + _1032;
        float _1058 = _1046 * _1046;
        float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1062 = _940 + _1060;
        float _1064 = -_980;
        float _1066 = _1064 + _1034;
        float _1068 = fma(_1050, _1050, _1058);
        float _1070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1072 = fma(_1062, _1062, _1068);
        float _1074 = sqrt(_1072);
        float _1076 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1078 = precise::min(_1074, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1080 = _1078 * _1070;
        float _1082 = _1076 * _1080;
        float _1084 = -_940;
        float _1086 = _1084 + _1036;
        float _1088 = fma(_1056, _1082, _948);
        float _1090 = fma(_1066, _1082, _980);
        float _1092 = fma(_1086, _1082, _940);
        _1038 = _1090;
        _1040 = _1088;
        _1042 = _1092;
    }
    float _1094 = _1038;
    float _1096 = _1040;
    float _1098 = _1042;
    float _1100 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1102 = _1094 + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1106 = _1096 + _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1110 = _1098 + _1108;
    float _1112 = _1102 * _1102;
    float _1114 = fma(_1106, _1106, _1112);
    float _1116 = fma(_1110, _1110, _1114);
    float _1118 = rsqrt(_1116);
    float _1120 = sqrt(_1116);
    float _1122 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1124 = _1106 * _1122;
    float _1126 = _1110 * _1122;
    float _1128 = _1124 * _1124;
    float _1130 = _1126 * _1126;
    float _1132 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1134 = _1128 + _1130;
    float _1136 = precise::max(0.0, _1132);
    float _1138 = sqrt(_1134);
    float _1140 = -_1122;
    float _1142 = -_1136;
    float _1144 = fma(_1102, _1140, _1142);
    bool _1146 = _1138 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1148 = _1122;
    float _1150 = _1102;
    float _1152 = _1136;
    float _1154 = _1128;
    float _1156 = _1130;
    if (!_1146)
    {
        _1148 = _1124;
    }
    float _1158 = _1148;
    float _1160 = _1158;
    if (!_1146)
    {
        _1150 = _1144;
    }
    float _1162 = _1150;
    float _1164 = _1162;
    if (!_1146)
    {
        _1152 = _1126;
    }
    float _1166 = _1152;
    bool _1168 = !_1146;
    float _1170 = _1166;
    if (!_1168)
    {
        float _1172 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1176 = _1138 + _1174;
        float _1178 = _1144 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1180 = rsqrt(_1134);
        float _1182 = _1176 * _1172;
        float _1184 = _1182 * 0.15915493667125701904296875;
        float _1186 = _1184 * 6.283185482025146484375;
        float _1188 = sin(_1186);
        float _1190 = _1184 * 6.283185482025146484375;
        float _1192 = cos(_1190);
        float _1194 = fma(_1188, _1178, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1196 = _1180 * _1194;
        float _1198 = _1192 + (-1.0);
        float _1200 = _1124 * _1196;
        float _1202 = _1198 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1204 = _1126 * _1196;
        float _1206 = fma(_1144, _1192, _1202);
        float _1208 = _1200 * _1200;
        float _1210 = _1204 * _1204;
        _1164 = _1206;
        _1154 = _1208;
        _1156 = _1210;
        _1160 = _1200;
        _1170 = _1204;
    }
    float _1212 = _1164;
    float _1214 = _1154;
    float _1216 = _1156;
    float _1218 = _1160;
    float _1220 = _1170;
    float _1222 = fma(_1212, _1212, _1214);
    float _1224 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1226 = _1222 + _1216;
    float _1228 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1230 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1224);
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1234 = fma(_1120, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1232);
    float _1236 = precise::clamp(_1234, 0.0, 1.0);
    float _1238 = rsqrt(_1226);
    float _1240 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1228);
    float _1242 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1230);
    float _1244 = -_1236;
    float _1246 = _1244 + 1.0;
    float _1248 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1250 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1240);
    float _1252 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1254 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1256 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1248);
    float _1258 = abs(_1246);
    float _1260 = log2(_1258);
    float _1262 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1264 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1266 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1256);
    float _1268 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1270 = -_1262;
    float _1272 = fma(_1254, _1270, 1.0);
    float _1274 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1276 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1278 = _1238 * _1218;
    float _1280 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1268);
    float _1282 = _1238 * _1212;
    float _1284 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1274);
    float _1286 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1288 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1280);
    float _1290 = _1238 * _1220;
    float _1292 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1284);
    float _1294 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1296 = -_1286;
    float _1298 = fma(_1282, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1296);
    float _1300 = _1288 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1302 = log2(_1272);
    float _1304 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1306 = -_1290;
    float _1308 = fma(_1306, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1298);
    float _1310 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1292);
    float _1312 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1314 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1304);
    float _1316 = fma(_1308, -0.5, 0.5);
    float _1318 = fma(_1308, 0.5, 0.5);
    float _1320 = exp2(_1294);
    float _1322 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1312);
    float _1324 = _1282 + 1.0;
    float _1326 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1314);
    float _1328 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1322);
    float _1330 = fma(_1318, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1332 = 1.0 / _1310;
    float _1334 = _1302 * 0.693147182464599609375;
    float _1336 = fma(_1318, _1330, -0.212114393711090087890625);
    float _1338 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1340 = fma(_1318, _1336, 1.570728778839111328125);
    float _1342 = sqrt(_1316);
    float _1344 = -_1282;
    float _1346 = fma(_1320, _1324, _1344);
    float _1348 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1328);
    float _1350 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1326);
    float _1352 = fma(_1346, 0.5, 0.5);
    float _1354 = _1348 * _1332;
    float _1356 = _1350 * _1332;
    float _1358 = fma(_1354, 0.5, 0.5);
    float _1360 = fma(_1356, -0.5, 0.5);
    float _1362 = _1342 * 0.636619746685028076171875;
    float3 _3903 = float3(_1358, _1360, _1338);
    float _1364 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3903, float3(0.0), isnan(_3903)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3903, float3(0.0), isnan(_3903)), level(0.0)).x;
    float _1366 = -_1340;
    float _1368 = fma(_1362, _1366, 1.0);
    float2 _3919 = float2(_1368, _1352);
    float3 _1372 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3919, float2(0.0), isnan(_3919)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3919, float2(0.0), isnan(_3919)), level(0.0)).xyz;
    float _1374 = _1372.x;
    float _1376 = _1372.y;
    float _1378 = _1372.z;
    float _1380 = in.m_65.x;
    float _1382 = in.m_65.y;
    float _1384 = in.m_65.z;
    bool _1386 = _902 != 0.0;
    bool _1388 = isnan(_902);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan(0.0);
    bool _1394 = _1390 || _1392;
    float _1396 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1398 = _1264 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1400 = _908 == 0.0;
    bool _1402 = !_1394;
    bool _1404 = _1400 && _1402;
    float _1406 = exp2(_1396);
    float _1408 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1398);
    bool _1410 = _906 == 0.0;
    bool _1412 = _1410 && _1404;
    out.m_67.w = _1310;
    float _1414 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1408);
    float _1416 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1414);
    out.gl_Position.x = _1348;
    out.gl_Position.y = _1350;
    out.gl_Position.z = _1416;
    out.gl_Position.w = _1310;
    float _1418 = _798 * _1384;
    float _1420 = _784 * _1384;
    float _1422 = _766 * _1380;
    float _1424 = _742 * _1380;
    float _1426 = fma(_784, _1382, _1418);
    float _1428 = -_1420;
    float _1430 = fma(_798, _1382, _1428);
    float _1432 = -_1406;
    float _1434 = _1432 + 1.0;
    float _1436 = fma(_742, _1426, _1422);
    float _1438 = _820 * _1430;
    float _1440 = _826 * _1430;
    float _1442 = -_1424;
    float _1444 = fma(_766, _1426, _1442);
    float _1446 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1448 = fma(_826, _1436, _1438);
    float _1450 = -_1440;
    float _1452 = fma(_820, _1436, _1450);
    float _1454 = -_1448;
    float _1456 = _1454 + _1382;
    float _1458 = -_1452;
    float _1460 = _1458 + _1380;
    float _1462 = fma(_1456, _792, _1448);
    float _1464 = fma(_1460, _792, _1452);
    float _1466 = -_1444;
    float _1468 = _1466 + _1384;
    float _1470 = _1462 * _1462;
    float _1472 = fma(_1468, _792, _1444);
    float _1474 = fma(_1464, _1464, _1470);
    float _1476 = fma(_1472, _1472, _1474);
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1488 = rsqrt(_1476);
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1492 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1494 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1496 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1498 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1492;
    out.m_69.y = _1494;
    out.m_69.z = _1496;
    out.m_71.x = _1498;
    out.m_71.y = _1500;
    out.m_71.z = _1502;
    float _1504 = -_1380;
    float _1506 = fma(_1464, _1488, _1504);
    float _1508 = -_1382;
    float _1510 = fma(_1462, _1488, _1508);
    float _1512 = -_1384;
    float _1514 = fma(_1472, _1488, _1512);
    float _1516 = fma(_810, _1506, _1380);
    float _1518 = fma(_810, _1510, _1382);
    float _1520 = fma(_810, _1514, _1384);
    float _1522 = _1348 + _1310;
    float _1524 = _1516;
    float _1526 = _1518;
    float _1528 = _1520;
    float _1530 = _1310;
    float _1532 = _1416;
    float _1534 = _1350;
    float _1536 = _1348;
    if (!_1412)
    {
        float _1538 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1516);
        _1524 = _1538;
    }
    float _1540 = _1524;
    if (!_1412)
    {
        float _1542 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1518);
        _1526 = _1542;
    }
    float _1544 = _1526;
    if (!_1412)
    {
        float _1546 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1520);
        _1528 = _1546;
    }
    float _1548 = _1528;
    bool _1550 = _1120 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1552 = isnan(_1120);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1558 = _1554 || _1556;
    float _1560 = _1522 * 0.5;
    float _1562 = _420 * _1544;
    float _1564 = _428 * _1544;
    float _1566 = _432 * _1544;
    float _1568 = fma(_344, _1540, _1562);
    float _1570 = fma(_378, _1540, _1564);
    float _1572 = _1310 * 0.5;
    float _1574 = fma(_382, _1540, _1566);
    float _1576 = fma(_438, _1548, _1568);
    float _1578 = fma(_442, _1548, _1570);
    float _1580 = fma(_1350, -0.5, _1572);
    float _1582 = fma(_446, _1548, _1574);
    out.m_67.x = _1560;
    float _1584 = _1574;
    float _1586 = _1560;
    if (!_1558)
    {
        _1584 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1588 = _1584;
    float _1590 = _1588;
    float _1592 = _1588;
    if (!_1558)
    {
        _1530 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1594 = _1530;
    out.m_67.y = _1580;
    float _1596 = _1594;
    float _1598 = _1594;
    if (!_1558)
    {
        _1532 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1600 = _1532;
    float _1602 = _1600;
    float _1604 = _1600;
    if (!_1558)
    {
        _1534 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1606 = _1534;
    out.m_73.x = _1576;
    out.m_73.y = _1578;
    out.m_73.z = _1582;
    float _1608 = _1606;
    float _1610 = _1606;
    if (!_1558)
    {
        _1586 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1612 = _1586;
    float _1614 = _1612;
    float _1616 = _1612;
    if (!_1558)
    {
        _1536 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1618 = _1536;
    float _1620 = _1446 * _1364;
    float _1622 = -_1446;
    float _1624 = _1622 + 1.0;
    float _1626 = _1374 * _1620;
    float _1628 = _1376 * _1620;
    float _1630 = _1378 * _1620;
    out.m_75.x = _1626;
    out.m_75.y = _1628;
    out.m_75.z = _1630;
    out.m_75.w = _1624;
    bool _1632 = !_1558;
    float _1634 = _1618;
    float _1636 = _1618;
    if (!_1632)
    {
        bool _1638 = _1120 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1640 = isnan(_1120);
        bool _1642 = _1638 || _1640;
        bool _1644 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1646 = _1642 || _1644;
        if (!_1646)
        {
            float _1648 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1650 = _1120 + _1648;
            float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1654 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1652;
            float _1656 = 1.0 / _1654;
            float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1660 = _1658 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1664 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1668 = _1666 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1670 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1672 = _1670 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1676 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1678 = _1650 * _1656;
            float _1680 = precise::clamp(_1678, 0.0, 1.0);
            float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1684 = _1682 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1686 = fma(_1680, _1660, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1688 = fma(_1680, _1684, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1690 = fma(_1680, _1664, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1692 = fma(_1680, _1668, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1694 = fma(_1680, _1672, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1696 = fma(_1680, _1676, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1592 = _1688;
            _1610 = _1694;
            _1616 = _1686;
            _1604 = _1692;
            _1598 = _1690;
            _1636 = _1696;
            _1698 = true;
        }
        else
        {
            bool _1700 = _1120 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1702 = isnan(_1120);
            bool _1704 = _1700 || _1702;
            bool _1706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1708 = _1704 || _1706;
            if (!_1708)
            {
                _1614 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1710 = _1614;
            _1616 = _1710;
            if (!_1708)
            {
                _1590 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1712 = _1590;
            _1592 = _1712;
            if (!_1708)
            {
                _1596 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1714 = _1596;
            _1598 = _1714;
            if (!_1708)
            {
                _1602 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1716 = _1602;
            _1604 = _1716;
            if (!_1708)
            {
                _1608 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1718 = _1608;
            _1610 = _1718;
            if (!_1708)
            {
                _1634 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1720 = _1634;
            bool _1722 = !_1708;
            _1636 = _1720;
            if (!_1722)
            {
                bool _1724 = _1120 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1726 = isnan(_1120);
                bool _1728 = _1724 || _1726;
                bool _1730 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1732 = _1728 || _1730;
                if (!_1732)
                {
                    float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1736 = _1120 + _1734;
                    float _1738 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1740 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1738;
                    float _1742 = 1.0 / _1740;
                    float _1744 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1746 = _1744 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1748 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1750 = _1748 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1754 = _1752 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1756 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1758 = _1756 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1762 = _1760 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1764 = _1736 * _1742;
                    float _1766 = precise::clamp(_1764, 0.0, 1.0);
                    float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1770 = _1768 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1772 = fma(_1766, _1746, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1774 = fma(_1766, _1770, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1776 = fma(_1766, _1750, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1778 = fma(_1766, _1754, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1780 = fma(_1766, _1758, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1782 = fma(_1766, _1762, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1592 = _1774;
                    _1610 = _1780;
                    _1616 = _1772;
                    _1604 = _1778;
                    _1598 = _1776;
                    _1636 = _1782;
                    _1698 = true;
                }
                else
                {
                    _1592 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1610 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1616 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1604 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1598 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1636 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1698 = false;
    float _1784 = _1592;
    float _1786 = _1610;
    float _1788 = _1616;
    float _1790 = _1604;
    float _1792 = _1598;
    float _1794 = _1636;
    float _1796 = fma(_1578, -0.5, 0.5);
    float _1798 = precise::clamp(_1796, 0.0, 1.0);
    float _1800 = -_1784;
    float _1802 = _1800 + _1786;
    float _1804 = -_1788;
    float _1806 = _1804 + _1790;
    float _1808 = -_1792;
    float _1810 = _1808 + _1794;
    bool _1812 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1814 = fma(_1798, _1802, _1784);
    float _1816 = fma(_1798, _1806, _1788);
    float _1818 = fma(_1798, _1810, _1792);
    float _1820 = _1814 * 0.586610972881317138671875;
    out.m_77.x = 0.0;
    float _1822 = fma(_1816, 0.298911988735198974609375, _1820);
    out.m_45.x = 1.0;
    float _1824 = fma(_1818, 0.114477999508380889892578125, _1822);
    float _1826 = -_1824;
    float _1828 = _1816 + _1826;
    float _1830 = -_1824;
    float _1832 = _1814 + _1830;
    float _1834 = -_1824;
    float _1836 = _1818 + _1834;
    float _1838 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1840 = fma(_1828, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1824);
    float _1842 = fma(_1832, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1824);
    float _1844 = fma(_1836, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1824);
    out.m_79.w = _1838;
    out.m_81.x = _1840;
    out.m_81.y = _1842;
    out.m_81.z = _1844;
    if (!_1812)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1846 = -_1094;
    float _1848 = _1846 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1850 = -_1096;
    float _1852 = _1850 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1854 = -_1098;
    float _1856 = _1854 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1858 = _1848 * _1848;
    float _1860 = fma(_1852, _1852, _1858);
    float _1862 = fma(_1856, _1856, _1860);
    float _1864 = sqrt(_1862);
    float _1866 = rsqrt(_1862);
    float _1868 = -_1864;
    float _1870 = _1868 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1872 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1874 = precise::clamp(_1872, 0.0, 1.0);
    float _1876 = _1852 * _1866;
    float _1878 = _1848 * _1866;
    float _1880 = abs(_1874);
    float _1882 = log2(_1880);
    float _1884 = _1856 * _1866;
    float _1886 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1888 = _1578 * _1878;
    float _1890 = -_1878;
    float _1892 = -_1886;
    float _1894 = fma(_1890, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1892);
    float _1896 = fma(_1576, _1876, _1888);
    float _1898 = -_1884;
    float _1900 = fma(_1898, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1894);
    float _1902 = fma(_1582, _1884, _1896);
    float _1904 = precise::clamp(_1902, 0.0, 1.0);
    float _1906 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1908 = _1900 + _1906;
    float _1910 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1912 = _1908 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1914 = precise::clamp(_1912, 0.0, 1.0);
    float _1916 = exp2(_1910);
    float _1918 = _1916 * _1914;
    float _1920 = _1904 * _1918;
    float _1922 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1924 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1926 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_77.x = _1922;
    out.m_77.y = _1924;
    out.m_77.z = _1926;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

