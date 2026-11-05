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
    float4 m_67 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_73 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_63 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1305 = false;
    bool _464 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1865 = as_type<float>(_110);
        out.gl_Position.z = _1865;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _114 = in.m_49.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    float _132 = _128;
    if (_124)
    {
        float _134 = float(_94);
        _130 = _134;
    }
    float _136 = _130;
    bool _138 = _128 >= _136;
    bool _140 = !_124;
    bool _142 = _138 || _140;
    if (_142)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _104;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1934 = as_type<float>(_148);
        out.gl_Position.z = _1934;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = in.m_51.z;
    float _156 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_53.x;
    float _160 = in.m_53.y;
    float _162 = in.m_53.z;
    float _164 = in.m_55.x;
    float _166 = in.m_55.y;
    float _168 = in.m_55.z;
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _150 * _150;
    float _178 = _152 * _152;
    float _180 = _154 * _154;
    float _182 = fma(_158, _158, _176);
    float _184 = fma(_160, _160, _178);
    float _186 = fma(_162, _162, _180);
    float _188 = fma(_164, _164, _182);
    float _190 = fma(_166, _166, _184);
    float _192 = fma(_168, _168, _186);
    float _194 = sqrt(_188);
    float _196 = sqrt(_190);
    bool _198 = _194 > 0.0;
    float _200 = sqrt(_192);
    bool _202 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _204 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _206 = _202 || _204;
    bool _208 = isnan(1.0);
    bool _210 = _206 || _208;
    bool _212 = _196 > 0.0;
    float _214 = 0.0;
    float _216 = _196;
    float _218 = _188;
    float _220 = _156;
    float _222 = _192;
    float _224 = _152;
    float _226 = _150;
    if (_198)
    {
        float _228 = rsqrt(_188);
        _214 = _228;
    }
    float _230 = _214;
    bool _232 = _200 > 0.0;
    float _234 = 0.0;
    float _236 = _200;
    if (!_210)
    {
        float _238 = _156 * _156;
        float _240 = _238 * 0.5;
        _234 = _240;
    }
    float _242 = _234;
    float _244 = 0.0;
    float _246 = _242;
    if (_212)
    {
        float _248 = rsqrt(_190);
        _244 = _248;
    }
    float _250 = _244;
    if (!_210)
    {
        float _252 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _246 = _252;
    }
    float _254 = _246;
    bool _256 = !_210;
    float _258 = _254;
    float _260 = _230;
    if (!_256)
    {
        float _262 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _264 = log2(_262);
        float _266 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _268 = _266 + 1.0;
        float _270 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _272 = _156 * _264;
        float _274 = 1.0 / _268;
        float _276 = _270 * 0.693147182464599609375;
        float _278 = exp2(_272);
        float _280 = 1.0 / _276;
        float _282 = _278 + (-1.0);
        float _284 = -_282;
        float _286 = fma(_284, _280, _156);
        float _288 = _286 * _274;
        float _290 = _288 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _258 = _290;
        _216 = _278;
        _218 = _280;
        _236 = _274;
    }
    float _292 = _258;
    float _294 = _216;
    float _296 = _218;
    float _298 = _236;
    bool _300 = !_210;
    float _302 = _298;
    float _304 = _294;
    float _306 = _296;
    if (!_300)
    {
        float _308 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _310 = log2(_308);
        float _312 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _314 = _312 + 1.0;
        float _316 = 1.0 / _314;
        float _318 = _156 * _310;
        float _320 = exp2(_318);
        float _322 = -_320;
        float _324 = _322 + 1.0;
        float _326 = _324 * _316;
        _220 = _326;
    }
    float _328 = _220;
    float _330 = in.m_57.w;
    float _332 = 0.0;
    if (!_198)
    {
        _332 = 0.0;
    }
    float _334 = _332;
    float _336 = _334;
    if (_198)
    {
        float _338 = _230 * _158;
        _336 = _338;
    }
    float _340 = _336;
    if (!_198)
    {
        _302 = 0.0;
    }
    float _342 = _302;
    float _344 = in.m_44.x;
    float _346 = in.m_44.y;
    float _348 = in.m_44.z;
    float _350 = 0.0;
    float _352 = _342;
    if (!_198)
    {
        _350 = 0.0;
    }
    float _354 = _350;
    float _356 = _354;
    if (_198)
    {
        float _358 = _230 * _150;
        _352 = _358;
    }
    float _360 = _352;
    if (_198)
    {
        float _362 = _230 * _164;
        _356 = _362;
    }
    float _364 = _356;
    float _366 = 0.0;
    if (_232)
    {
        float _368 = rsqrt(_192);
        _366 = _368;
    }
    float _370 = _366;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _374 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _376 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _378 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _380 = _376;
    if (!_212)
    {
        _304 = 0.0;
    }
    float _382 = _304;
    float _384 = fma(_328, _170, _374);
    float _386 = fma(_328, _172, _376);
    float _388 = fma(_328, _174, _378);
    float _390 = 0.0;
    float _392 = _382;
    if (!_232)
    {
        _390 = 0.0;
        _380 = 0.0;
    }
    float _394 = _390;
    float _396 = _380;
    float _398 = _394;
    float _400 = _396;
    if (!_212)
    {
        _306 = 0.0;
    }
    float _402 = _306;
    float _404 = _402;
    if (_212)
    {
        float _406 = _250 * _160;
        _392 = _406;
    }
    float _408 = _392;
    if (!_212)
    {
        _260 = 0.0;
    }
    float _410 = _260;
    float _412 = _410;
    if (_212)
    {
        float _414 = _250 * _152;
        _404 = _414;
    }
    float _416 = _404;
    if (!_232)
    {
        _222 = 0.0;
    }
    float _418 = _222;
    float _420 = _418;
    if (_212)
    {
        float _422 = _250 * _166;
        _412 = _422;
    }
    float _424 = _412;
    if (_232)
    {
        float _426 = _370 * _162;
        _398 = _426;
    }
    float _428 = _398;
    if (_232)
    {
        float _430 = _370 * _154;
        _420 = _430;
    }
    float _432 = _420;
    if (_232)
    {
        float _434 = _370 * _168;
        _400 = _434;
    }
    float _436 = _400;
    float _438 = fma(_384, _330, _344);
    float _440 = fma(_386, _330, _346);
    float _442 = fma(_388, _330, _348);
    bool _444 = !_372;
    float _462;
    if (!_444)
    {
        float _446 = in.m_59.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_94);
        float _468 = 1.0 / _466;
        float _470 = _128 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = in.m_59.z;
    float _476 = _440 * _160;
    float _478 = _440 * _166;
    float _480 = in.m_59.x;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _484 = _472 + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _494 = in.m_59.y;
    float _496 = fma(_438, _158, _476);
    float _498 = 1.0 / _488;
    float _500 = fma(_438, _164, _478);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _504 = _472 + _502;
    float _506 = fma(_442, _162, _496);
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _510 = _508 != 0;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _514 = _512 != 0;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _518 = _516 != 0;
    float _520 = _440 * _152;
    float _522 = 1.0 / _492;
    float _524 = fma(_438, _150, _520);
    bool _526 = !_510;
    int _528 = _526 ? 0 : 1;
    float _530 = _474 * 2.0;
    bool _532 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _534 = isnan(0.0);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _540 = _536 || _538;
    float _542 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _544 = log2(_542);
    float _546 = _504 * _498;
    float _548 = _480 * 2.0;
    float _550 = _480 + _474;
    int _552 = abs(_528);
    float _554 = fma(_442, _154, _524);
    float _556 = _494 + _474;
    float _558 = _480 + _494;
    float _560 = floor(_530);
    float _562 = _484 * _522;
    float _564 = _556 + (-1.0);
    float _566 = _558 + (-1.0);
    float _568 = _550 + (-1.0);
    bool _570 = !_514;
    int _572 = _570 ? 0 : 1;
    float _574 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _576 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _578 = floor(_548);
    float _580 = _544 * _128;
    float _582 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _584 = _474 + (-0.5);
    int _586 = abs(_572);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _588;
    bool _592 = _560 > 0.0;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _598 = _560 >= 0.0;
    bool _600 = isnan(_560);
    bool _602 = _598 || _600;
    bool _604 = isnan(0.0);
    bool _606 = _602 || _604;
    float _608 = _494 * 2.0;
    float _610 = exp2(_580);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _612;
    int _616 = _606 ? 0 : 1;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _622 = _578 > 0.0;
    float _624 = fma(_614, _546, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _626 = _578 >= 0.0;
    bool _628 = isnan(_578);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = fma(_590, _546, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _638 = floor(_608);
    float _640 = fma(_620, _562, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _642 = fma(_596, _562, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _644 = ~_616;
    int _646 = _644 + 1;
    int _648 = _646 + 1;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _658 = _648;
    if (!_592)
    {
        int _660 = ~_616;
        int _662 = _660 + 1;
        _658 = _662;
    }
    int _664 = _658;
    float _666 = -_610;
    float _668 = _666 + 1.0;
    float _670 = fma(_652, _546, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _674 = 1.0 + _672;
    float _676 = fma(_656, _562, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _678 = _634 ? 0 : 1;
    float _680 = _494 + (-0.5);
    float _682 = 1.0 / _674;
    bool _684 = _638 > 0.0;
    bool _686 = _638 >= 0.0;
    bool _688 = isnan(_638);
    bool _690 = _686 || _688;
    bool _692 = isnan(0.0);
    bool _694 = _690 || _692;
    float _696 = in.m_61.x;
    float _698 = in.m_61.y;
    float _700 = in.m_61.z;
    bool _702 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _704 = isnan(1.0);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _710 = _706 || _708;
    float _712 = float(_552);
    int _714 = ~_678;
    int _716 = _714 + 1;
    int _718 = _716 + 1;
    float _720 = float(_664);
    int _722 = _718;
    if (!_622)
    {
        int _724 = ~_678;
        int _726 = _724 + 1;
        _722 = _726;
    }
    int _728 = _722;
    float _730 = _712 * _720;
    float _732 = _540 ? _668 : 0.0;
    float _734 = float(_586);
    float _736 = float(_728);
    if (_710)
    {
        float _738 = _732 * _682;
        _132 = _738;
    }
    float _740 = _132;
    float _742 = _730 * (-2.0);
    float _744 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _746 = _734 * _736;
    float _748 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _750 = fma(_576, _742, _576);
    float _752 = fma(_742, _696, _696);
    float _754 = _744 * _480;
    float _756 = _746 * (-2.0);
    float _758 = _748 * _480;
    float _760 = _480 + (-0.5);
    bool _762 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _764 = isnan(_472);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = fma(_756, _698, _698);
    int _776 = _694 ? 0 : 1;
    float _778 = fma(_574, _756, _574);
    float _780 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[196].x, _752);
    bool _782 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _784 = isnan(_472);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -_772;
    float _796 = _794 + 1.0;
    bool _798 = !_518;
    int _800 = _798 ? 0 : 1;
    float _802 = fma(_750, _740, _780);
    int _804 = ~_776;
    int _806 = _804 + 1;
    int _808 = _806 + 1;
    float _810 = _792 * _796;
    int _812 = _808;
    if (!_684)
    {
        int _814 = ~_776;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    float _820 = -_792;
    float _822 = _820 + 1.0;
    int _824 = abs(_800);
    float _826 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].y, _774);
    bool _828 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _830 = isnan(_472);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = _802 * 0.15915493667125701904296875;
    float _842 = float(_824);
    float _844 = fma(_778, _740, _826);
    float _846 = float(_818);
    float _848 = _838 * _822;
    float _850 = -_838;
    float _852 = _850 + 1.0;
    float _854 = _844 * 0.15915493667125701904296875;
    float _856 = _840 * 6.283185482025146484375;
    float _858 = sin(_856);
    float _860 = _842 * _846;
    float _862 = _624 * _848;
    float _864 = _636 * _848;
    float _866 = _670 * _848;
    float _868 = _860 * (-2.0);
    float _870 = in.m_57.x;
    float _872 = in.m_57.y;
    float _874 = in.m_57.z;
    float _876 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].x, _862);
    float _878 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].y, _864);
    float _880 = fma(_868, _700, _700);
    float _882 = in.m_63.x;
    float _884 = in.m_63.y;
    float _886 = in.m_63.z;
    float _888 = fma(_582, _868, _582);
    float _890 = fma(_640, _810, _876);
    float _892 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[196].z, _880);
    float _894 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].z, _866);
    float _896 = fma(_642, _810, _878);
    float _898 = _840 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = fma(_888, _740, _892);
    float _904 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[145].x, _890);
    float _906 = fma(_676, _810, _894);
    float _908 = _902 * 0.15915493667125701904296875;
    float _910 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[145].y, _896);
    float _912 = in.m_53.w;
    float _914 = _854 * 6.283185482025146484375;
    float _916 = sin(_914);
    float _918 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[145].z, _906);
    float _920 = _904 * _870;
    float _922 = _910 * _872;
    float _924 = _854 * 6.283185482025146484375;
    float _926 = cos(_924);
    float _928 = _918 * _874;
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _882);
    float _932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _884);
    float _934 = _922 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _886);
    float _938 = _920 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _940 = _928 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _942 = _908 * 6.283185482025146484375;
    float _944 = cos(_942);
    float _946 = _934 * _932;
    float _948 = _938 * _930;
    float _950 = _940 * _936;
    float _952 = in.m_55.w;
    float _954 = _858 * _916;
    float _956 = _900 * _916;
    float _958 = _908 * 6.283185482025146484375;
    float _960 = sin(_958);
    float _962 = _900 * _926;
    float _964 = _944 * _946;
    float _966 = _916 * _944;
    float _968 = _926 * _944;
    float _970 = _858 * _926;
    float _972 = _900 * _964;
    float _974 = trunc(_754);
    int _976 = int(_974);
    float _978 = _858 * _964;
    float _980 = fma(_960, _962, _954);
    float _982 = -_946;
    float _984 = _960 * _982;
    float _986 = -_970;
    float _988 = fma(_960, _956, _986);
    float _990 = -_956;
    float _992 = fma(_960, _970, _990);
    float _994 = fma(_980, _948, _972);
    float _996 = trunc(_758);
    int _998 = int(_996);
    float _1000 = fma(_968, _948, _984);
    float _1002 = fma(_960, _954, _962);
    float _1004 = fma(_988, _950, _994);
    float _1006 = fma(_992, _948, _978);
    float _1008 = fma(_966, _950, _1000);
    float _1010 = fma(_442, _168, _500);
    float _1012 = _1004 * _408;
    float _1014 = _1004 * _424;
    float _1016 = fma(_1002, _950, _1006);
    float _1018 = _506 + _912;
    float _1020 = fma(_1008, _340, _1012);
    float _1022 = fma(_1008, _364, _1014);
    float _1024 = _1010 + _952;
    int _1026 = _976 << 4;
    int _1028 = _1026 + 1712;
    float _1030 = fma(_1016, _428, _1020);
    float _1032 = fma(_1016, _436, _1022);
    int _1034 = _998 << 4;
    int _1036 = _1034 + 1968;
    int _1038 = _1028 + 8;
    uint _1041 = uint(int(uint(_1038) >> uint(2)));
    uint _1043 = uint(int(uint(int(_1041)) >> uint(2)));
    int _1045 = int(_1041) & 3;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[int(_1043)][_1045];
    float _1049 = _1018 + _1030;
    float _1051 = _1024 + _1032;
    float _1053 = in.m_51.w;
    float _1055 = _1004 * _416;
    float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1059 = _1049 + _1057;
    float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1063 = _1051 + _1061;
    int _1065 = _1036 + 8;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    uint _1069 = uint(int(uint(int(_1067)) >> uint(2)));
    int _1071 = int(_1067) & 3;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[int(_1069)][_1071];
    float _1075 = _1059 * _1059;
    float _1077 = _1063 * _1063;
    float _1079 = fma(_1008, _360, _1055);
    float _1081 = _1075 + _1077;
    float _1083 = fma(_1016, _432, _1079);
    uint _1085 = uint(int(uint(_1028) >> uint(2)));
    uint _1087 = uint(int(uint(int(_1085)) >> uint(2)));
    int _1089 = int(_1085) & 3;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[int(_1087)][_1089];
    int _1093 = int(_1085) + 1;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    int _1097 = _1093 & 3;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[int(_1095)][_1097];
    float _1101 = sqrt(_1081);
    uint _1103 = uint(int(uint(_1036) >> uint(2)));
    uint _1105 = uint(int(uint(int(_1103)) >> uint(2)));
    int _1107 = int(_1103) & 3;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[int(_1105)][_1107];
    int _1111 = int(_1103) + 1;
    uint _1113 = uint(int(uint(_1111) >> uint(2)));
    int _1115 = _1111 & 3;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[int(_1113)][_1115];
    float _1119 = _554 + _1053;
    float _1121 = _1119 + _1083;
    bool _1123 = _1101 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1125 = _1004;
    float _1127 = _1053;
    float _1129 = _1083;
    float _1131 = _1024;
    float _1133 = _1121;
    if (!_1123)
    {
        _224 = _1077;
    }
    float _1135 = _224;
    float _1137 = _1135;
    if (!_1123)
    {
        _226 = _1075;
    }
    float _1139 = _226;
    float _1141 = _1139;
    if (!_1123)
    {
        _1125 = _1049;
    }
    float _1143 = _1125;
    float _1145 = _1143;
    if (!_1123)
    {
        _1127 = _1051;
    }
    float _1147 = _1127;
    float _1149 = _1147;
    if (!_1123)
    {
        _1129 = _1121;
    }
    float _1151 = _1129;
    bool _1153 = !_1123;
    float _1155 = _1151;
    if (!_1153)
    {
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1161 = _1101 + _1159;
        float _1163 = _1121 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1165 = rsqrt(_1081);
        float _1167 = _1161 * _1157;
        float _1169 = _1167 * 0.15915493667125701904296875;
        float _1171 = _1169 * 6.283185482025146484375;
        float _1173 = sin(_1171);
        float _1175 = _1169 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        float _1179 = fma(_1173, _1163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1181 = _1165 * _1179;
        float _1183 = _1177 + (-1.0);
        float _1185 = fma(_1059, _1181, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1187 = fma(_1063, _1181, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1189 = _1183 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1191 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1193 = _1185 + _1191;
        float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1197 = _1187 + _1195;
        float _1199 = fma(_1121, _1177, _1189);
        float _1201 = _1193 * _1193;
        float _1203 = _1197 * _1197;
        _1155 = _1199;
        _1141 = _1201;
        _1137 = _1203;
        _1145 = _1185;
        _1149 = _1187;
    }
    float _1205 = _1155;
    float _1207 = _1141;
    float _1209 = _1137;
    float _1211 = _1145;
    float _1213 = _1149;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1217 = _1205 + _1215;
    float _1219 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1221 = _1047 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1223 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1225 = fma(_1217, _1217, _1207);
    float _1227 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1229 = _1225 + _1209;
    float _1231 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1233 = _1099 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1235 = _1109 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1237 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1239 = sqrt(_1229);
    float _1241 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1243 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1245 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1247 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1249 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    out.m_67.x = _1241;
    out.m_67.y = _1243;
    out.m_67.z = _1227;
    out.m_67.w = _1237;
    out.m_69.x = _1245;
    out.m_69.y = _1247;
    out.m_69.z = _1249;
    bool _1251 = _1239 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1253 = isnan(_1239);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1259 = _1255 || _1257;
    float _1261 = _1219;
    float _1263 = _1243;
    float _1265 = _1237;
    float _1267 = 1.0;
    float _1269 = _1245;
    if (!_1259)
    {
        _1261 = 1.0;
    }
    float _1271 = _1261;
    bool _1273 = !_1259;
    float _1275 = _1271;
    if (!_1273)
    {
        bool _1277 = _1239 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1279 = isnan(_1239);
        bool _1281 = _1277 || _1279;
        bool _1283 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1285 = _1281 || _1283;
        if (!_1285)
        {
            float _1287 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1289 = _1239 + _1287;
            float _1291 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1293 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1291;
            float _1295 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1297 = _1295 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1299 = 1.0 / _1293;
            float _1301 = _1289 * _1299;
            float _1303 = fma(_1301, _1297, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1275 = _1303;
            _1263 = _1299;
            _1305 = true;
        }
        else
        {
            bool _1307 = _1239 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1309 = isnan(_1239);
            bool _1311 = _1307 || _1309;
            bool _1313 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1315 = _1311 || _1313;
            if (!_1315)
            {
                float _1317 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1319 = _1239 + _1317;
                float _1321 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1323 = _1321 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1325 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1327 = _1325 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1329 = 1.0 / _1323;
                float _1331 = _1319 * _1329;
                float _1333 = fma(_1331, _1327, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1275 = _1333;
                _1263 = _1329;
                _1305 = true;
            }
            else
            {
                _1275 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1305 = false;
    float _1335 = _1275;
    float _1337 = _1263;
    float _1339 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1341 = _1211 + _1339;
    float _1343 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1345 = _1205 + _1343;
    bool _1347 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.5);
    bool _1355 = _1351 || _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1359 = _1213 + _1357;
    float _1361 = fma(_1341, _1335, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1363 = fma(_1345, _1335, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1365 = fma(_1359, _1335, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1367 = _1337;
    if (_1355)
    {
        _1265 = _1361;
    }
    float _1369 = _1265;
    float _1371 = _1369;
    if (_1355)
    {
        _1267 = _1363;
    }
    float _1373 = _1267;
    float _1375 = _1373;
    if (_1355)
    {
        _1367 = _1365;
    }
    float _1377 = _1367;
    float _1379 = _1377;
    if (!_1355)
    {
        float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1383 = _1119 + _1381;
        float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1387 = _1018 + _1385;
        float _1389 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1391 = _1383 * _1383;
        float _1393 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1395 = _1024 + _1393;
        float _1397 = fma(_1387, _1387, _1391);
        float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1401 = fma(_1395, _1395, _1397);
        float _1403 = sqrt(_1401);
        float _1405 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1407 = precise::min(_1403, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1409 = _1407 * _1399;
        float _1411 = -_1018;
        float _1413 = _1411 + _1361;
        float _1415 = _1405 * _1409;
        float _1417 = -_1119;
        float _1419 = _1417 + _1363;
        float _1421 = -_1024;
        float _1423 = _1421 + _1365;
        float _1425 = fma(_1413, _1415, _1018);
        float _1427 = fma(_1419, _1415, _1119);
        float _1429 = fma(_1423, _1415, _1024);
        _1375 = _1427;
        _1371 = _1425;
        _1379 = _1429;
    }
    float _1431 = _1375;
    float _1433 = _1371;
    float _1435 = _1379;
    float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1439 = _1431 + _1437;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1443 = _1433 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1447 = _1435 + _1445;
    float _1449 = _1439 * _1439;
    float _1451 = fma(_1443, _1443, _1449);
    float _1453 = fma(_1447, _1447, _1451);
    float _1455 = rsqrt(_1453);
    float _1457 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1459 = _1443 * _1457;
    float _1461 = _1447 * _1457;
    float _1463 = _1459 * _1459;
    float _1465 = _1461 * _1461;
    float _1467 = _1463 + _1465;
    float _1469 = sqrt(_1467);
    bool _1471 = _1469 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1473 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1475 = _1469 + _1473;
    float _1477 = _1455;
    float _1479 = _1475;
    float _1481 = _1457;
    float _1483 = _1459;
    if (_1471)
    {
        float _1485 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1477 = _1485;
    }
    float _1487 = _1477;
    if (_1471)
    {
        float _1489 = rsqrt(_1467);
        _1131 = _1489;
    }
    float _1491 = _1131;
    float _1493 = _1491;
    if (_1471)
    {
        float _1495 = _1475 * _1487;
        _1479 = _1495;
    }
    float _1497 = _1479;
    if (_1471)
    {
        float _1499 = _1497 * 0.15915493667125701904296875;
        _1269 = _1499;
    }
    float _1501 = _1269;
    float _1503 = _1018;
    if (_1471)
    {
        float _1505 = _1501 * 6.283185482025146484375;
        float _1507 = sin(_1505);
        _1503 = _1507;
    }
    float _1509 = _1503;
    float _1511 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1513 = precise::max(0.0, _1511);
    float _1515 = _1447;
    float _1517 = _1513;
    float _1519 = _1511;
    if (_1471)
    {
        float _1521 = _1501 * 6.283185482025146484375;
        float _1523 = cos(_1521);
        _1515 = _1523;
    }
    float _1525 = _1515;
    float _1527 = -_1457;
    float _1529 = -_1513;
    float _1531 = fma(_1439, _1527, _1529);
    if (_1471)
    {
        float _1533 = _1531 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1517 = _1533;
    }
    float _1535 = _1517;
    float _1537 = sqrt(_1453);
    float _1539 = _1535;
    float _1541 = _1509;
    if (_1471)
    {
        float _1543 = fma(_1509, _1535, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1539 = _1543;
    }
    float _1545 = _1539;
    float _1547 = _1545;
    if (!_1471)
    {
        _1541 = _1461;
    }
    float _1549 = _1541;
    float _1551 = _1549;
    if (_1471)
    {
        float _1553 = _1525 + (-1.0);
        _1519 = _1553;
    }
    float _1555 = _1519;
    float _1557 = _1555;
    if (_1471)
    {
        float _1559 = _1491 * _1545;
        _1133 = _1559;
    }
    float _1561 = _1133;
    if (!_1471)
    {
        _1493 = _1531;
    }
    float _1563 = _1493;
    float _1565 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1567 = _1563;
    if (_1471)
    {
        float _1569 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1481 = _1569;
    }
    float _1571 = _1481;
    if (_1471)
    {
        float _1573 = _1459 * _1561;
        _1483 = _1573;
    }
    float _1575 = _1483;
    if (!_1471)
    {
        _1547 = _1463;
    }
    float _1577 = _1547;
    float _1579 = _1577;
    if (_1471)
    {
        float _1581 = _1461 * _1561;
        _1551 = _1581;
    }
    float _1583 = _1551;
    if (_1471)
    {
        float _1585 = fma(_1531, _1525, _1571);
        _1567 = _1585;
    }
    float _1587 = _1567;
    if (_1471)
    {
        float _1589 = _1575 * _1575;
        _1579 = _1589;
    }
    float _1591 = _1579;
    if (!_1471)
    {
        _1557 = _1465;
    }
    float _1593 = _1557;
    float _1595 = _1593;
    if (_1471)
    {
        float _1597 = _1583 * _1583;
        _1595 = _1597;
    }
    float _1599 = _1595;
    float _1601 = fma(_1587, _1587, _1591);
    float _1603 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1565);
    float _1605 = _1601 + _1599;
    float _1607 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1611 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1609);
    float _1613 = precise::clamp(_1611, 0.0, 1.0);
    float _1615 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1617 = rsqrt(_1605);
    float _1619 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1607);
    float _1621 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1623 = -_1613;
    float _1625 = _1623 + 1.0;
    float _1627 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1629 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1619);
    float _1631 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1621);
    float _1633 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1627);
    float _1635 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1637 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1631);
    float _1639 = abs(_1625);
    float _1641 = log2(_1639);
    float _1643 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1633);
    float _1645 = _1635 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1647 = _1637 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1649 = _1617 * _1575;
    float _1651 = -_1645;
    float _1653 = fma(_1651, _1615, 1.0);
    float _1655 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1603);
    float _1657 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1659 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1661 = _1617 * _1587;
    float _1663 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1665 = _1617 * _1583;
    float _1667 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1659);
    float _1669 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1671 = -_1663;
    float _1673 = fma(_1661, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1671);
    float _1675 = _1641 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1677 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1667);
    float _1679 = log2(_1653);
    float _1681 = -_1665;
    float _1683 = fma(_1681, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1673);
    float _1685 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1687 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1677);
    float _1689 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1691 = fma(_1683, -0.5, 0.5);
    float _1693 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1685);
    float _1695 = fma(_1683, 0.5, 0.5);
    float _1697 = exp2(_1675);
    float _1699 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1689);
    float _1701 = _1661 + 1.0;
    float _1703 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1693);
    float _1705 = fma(_1695, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1707 = 1.0 / _1687;
    float _1709 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1699);
    float _1711 = fma(_1695, _1705, -0.212114393711090087890625);
    float _1713 = _1679 * 0.693147182464599609375;
    float _1715 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1709);
    float _1717 = fma(_1695, _1711, 1.570728778839111328125);
    float _1719 = _1713 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1721 = sqrt(_1691);
    float _1723 = -_1661;
    float _1725 = fma(_1697, _1701, _1723);
    float _1727 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1703);
    float _1729 = fma(_1725, 0.5, 0.5);
    float _1731 = _1727 * _1707;
    float _1733 = _1715 * _1707;
    float _1735 = fma(_1731, 0.5, 0.5);
    float _1737 = fma(_1733, -0.5, 0.5);
    float _1739 = _1721 * 0.636619746685028076171875;
    float3 _4386 = float3(_1735, _1737, _1719);
    float _1741 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4386, float3(0.0), isnan(_4386)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4386, float3(0.0), isnan(_4386)), level(0.0)).x;
    float _1743 = -_1717;
    float _1745 = fma(_1739, _1743, 1.0);
    float3 _4402 = float3(_1735, _1737, _1719);
    float4 _1748 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4402, float3(0.0), isnan(_4402)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4402, float3(0.0), isnan(_4402)), level(0.0)).xyzw;
    float _1750 = _1748.x;
    float _1752 = _1748.y;
    float _1754 = _1748.z;
    float _1756 = _1748.w;
    float2 _4419 = float2(_1745, _1729);
    float3 _1760 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4419, float2(0.0), isnan(_4419)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4419, float2(0.0), isnan(_4419)), level(0.0)).xyz;
    float _1762 = _1760.x;
    float _1764 = _1760.y;
    float _1766 = _1760.z;
    float _1768 = _1641 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1770 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _1772 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1770);
    float _1774 = exp2(_1768);
    float _1776 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1772);
    float _1778 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1776);
    float _1780 = _1778 + _1687;
    out.gl_Position.x = _1727;
    out.gl_Position.y = _1715;
    out.gl_Position.z = _1778;
    out.gl_Position.w = _1687;
    float _1782 = _1780 * 0.5;
    float _1784 = -_1774;
    float _1786 = _1784 + 1.0;
    float _1788 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1790 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.z = _1782;
    out.m_71.w = _1687;
    out.m_73.w = _1790;
    float _1792 = _1788 * _1741;
    float _1794 = -_1788;
    float _1796 = _1794 + 1.0;
    float _1798 = _1756 * _1792;
    float _1800 = _1766 * _1792;
    float _1802 = fma(_1762, _1798, _1750);
    float _1804 = fma(_1764, _1798, _1752);
    float _1806 = _1756 * _1796;
    float _1808 = fma(_1756, _1800, _1754);
    out.m_75.x = _1802;
    out.m_75.y = _1804;
    out.m_75.z = _1808;
    out.m_75.w = _1806;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1305 = false;
    bool _464 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1865 = as_type<float>(_110);
        out.gl_Position.z = _1865;
    }
    if (!_98)
    {
        return out;
    }
    float _114 = in.m_49.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    float _132 = _128;
    if (_124)
    {
        float _134 = float(_94);
        _130 = _134;
    }
    float _136 = _130;
    bool _138 = _128 >= _136;
    bool _140 = !_124;
    bool _142 = _138 || _140;
    if (_142)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _104;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1934 = as_type<float>(_148);
        out.gl_Position.z = _1934;
    }
    if (_142)
    {
        return out;
    }
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = in.m_51.z;
    float _156 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_53.x;
    float _160 = in.m_53.y;
    float _162 = in.m_53.z;
    float _164 = in.m_55.x;
    float _166 = in.m_55.y;
    float _168 = in.m_55.z;
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _150 * _150;
    float _178 = _152 * _152;
    float _180 = _154 * _154;
    float _182 = fma(_158, _158, _176);
    float _184 = fma(_160, _160, _178);
    float _186 = fma(_162, _162, _180);
    float _188 = fma(_164, _164, _182);
    float _190 = fma(_166, _166, _184);
    float _192 = fma(_168, _168, _186);
    float _194 = sqrt(_188);
    float _196 = sqrt(_190);
    bool _198 = _194 > 0.0;
    float _200 = sqrt(_192);
    bool _202 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _204 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _206 = _202 || _204;
    bool _208 = isnan(1.0);
    bool _210 = _206 || _208;
    bool _212 = _196 > 0.0;
    float _214 = 0.0;
    float _216 = _196;
    float _218 = _188;
    float _220 = _156;
    float _222 = _192;
    float _224 = _152;
    float _226 = _150;
    if (_198)
    {
        float _228 = rsqrt(_188);
        _214 = _228;
    }
    float _230 = _214;
    bool _232 = _200 > 0.0;
    float _234 = 0.0;
    float _236 = _200;
    if (!_210)
    {
        float _238 = _156 * _156;
        float _240 = _238 * 0.5;
        _234 = _240;
    }
    float _242 = _234;
    float _244 = 0.0;
    float _246 = _242;
    if (_212)
    {
        float _248 = rsqrt(_190);
        _244 = _248;
    }
    float _250 = _244;
    if (!_210)
    {
        float _252 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _246 = _252;
    }
    float _254 = _246;
    bool _256 = !_210;
    float _258 = _254;
    float _260 = _230;
    if (!_256)
    {
        float _262 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _264 = log2(_262);
        float _266 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _268 = _266 + 1.0;
        float _270 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _272 = _156 * _264;
        float _274 = 1.0 / _268;
        float _276 = _270 * 0.693147182464599609375;
        float _278 = exp2(_272);
        float _280 = 1.0 / _276;
        float _282 = _278 + (-1.0);
        float _284 = -_282;
        float _286 = fma(_284, _280, _156);
        float _288 = _286 * _274;
        float _290 = _288 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _258 = _290;
        _216 = _278;
        _218 = _280;
        _236 = _274;
    }
    float _292 = _258;
    float _294 = _216;
    float _296 = _218;
    float _298 = _236;
    bool _300 = !_210;
    float _302 = _298;
    float _304 = _294;
    float _306 = _296;
    if (!_300)
    {
        float _308 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _310 = log2(_308);
        float _312 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _314 = _312 + 1.0;
        float _316 = 1.0 / _314;
        float _318 = _156 * _310;
        float _320 = exp2(_318);
        float _322 = -_320;
        float _324 = _322 + 1.0;
        float _326 = _324 * _316;
        _220 = _326;
    }
    float _328 = _220;
    float _330 = in.m_57.w;
    float _332 = 0.0;
    if (!_198)
    {
        _332 = 0.0;
    }
    float _334 = _332;
    float _336 = _334;
    if (_198)
    {
        float _338 = _230 * _158;
        _336 = _338;
    }
    float _340 = _336;
    if (!_198)
    {
        _302 = 0.0;
    }
    float _342 = _302;
    float _344 = in.m_44.x;
    float _346 = in.m_44.y;
    float _348 = in.m_44.z;
    float _350 = 0.0;
    float _352 = _342;
    if (!_198)
    {
        _350 = 0.0;
    }
    float _354 = _350;
    float _356 = _354;
    if (_198)
    {
        float _358 = _230 * _150;
        _352 = _358;
    }
    float _360 = _352;
    if (_198)
    {
        float _362 = _230 * _164;
        _356 = _362;
    }
    float _364 = _356;
    float _366 = 0.0;
    if (_232)
    {
        float _368 = rsqrt(_192);
        _366 = _368;
    }
    float _370 = _366;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _374 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _376 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _378 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _380 = _376;
    if (!_212)
    {
        _304 = 0.0;
    }
    float _382 = _304;
    float _384 = fma(_328, _170, _374);
    float _386 = fma(_328, _172, _376);
    float _388 = fma(_328, _174, _378);
    float _390 = 0.0;
    float _392 = _382;
    if (!_232)
    {
        _390 = 0.0;
        _380 = 0.0;
    }
    float _394 = _390;
    float _396 = _380;
    float _398 = _394;
    float _400 = _396;
    if (!_212)
    {
        _306 = 0.0;
    }
    float _402 = _306;
    float _404 = _402;
    if (_212)
    {
        float _406 = _250 * _160;
        _392 = _406;
    }
    float _408 = _392;
    if (!_212)
    {
        _260 = 0.0;
    }
    float _410 = _260;
    float _412 = _410;
    if (_212)
    {
        float _414 = _250 * _152;
        _404 = _414;
    }
    float _416 = _404;
    if (!_232)
    {
        _222 = 0.0;
    }
    float _418 = _222;
    float _420 = _418;
    if (_212)
    {
        float _422 = _250 * _166;
        _412 = _422;
    }
    float _424 = _412;
    if (_232)
    {
        float _426 = _370 * _162;
        _398 = _426;
    }
    float _428 = _398;
    if (_232)
    {
        float _430 = _370 * _154;
        _420 = _430;
    }
    float _432 = _420;
    if (_232)
    {
        float _434 = _370 * _168;
        _400 = _434;
    }
    float _436 = _400;
    float _438 = fma(_384, _330, _344);
    float _440 = fma(_386, _330, _346);
    float _442 = fma(_388, _330, _348);
    bool _444 = !_372;
    float _462;
    if (!_444)
    {
        float _446 = in.m_59.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_94);
        float _468 = 1.0 / _466;
        float _470 = _128 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = in.m_59.z;
    float _476 = _440 * _160;
    float _478 = _440 * _166;
    float _480 = in.m_59.x;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _484 = _472 + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _494 = in.m_59.y;
    float _496 = fma(_438, _158, _476);
    float _498 = 1.0 / _488;
    float _500 = fma(_438, _164, _478);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _504 = _472 + _502;
    float _506 = fma(_442, _162, _496);
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _510 = _508 != 0;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _514 = _512 != 0;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _518 = _516 != 0;
    float _520 = _440 * _152;
    float _522 = 1.0 / _492;
    float _524 = fma(_438, _150, _520);
    bool _526 = !_510;
    int _528 = _526 ? 0 : 1;
    float _530 = _474 * 2.0;
    bool _532 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _534 = isnan(0.0);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _540 = _536 || _538;
    float _542 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _544 = log2(_542);
    float _546 = _504 * _498;
    float _548 = _480 * 2.0;
    float _550 = _480 + _474;
    int _552 = abs(_528);
    float _554 = fma(_442, _154, _524);
    float _556 = _494 + _474;
    float _558 = _480 + _494;
    float _560 = floor(_530);
    float _562 = _484 * _522;
    float _564 = _556 + (-1.0);
    float _566 = _558 + (-1.0);
    float _568 = _550 + (-1.0);
    bool _570 = !_514;
    int _572 = _570 ? 0 : 1;
    float _574 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _576 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _578 = floor(_548);
    float _580 = _544 * _128;
    float _582 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _584 = _474 + (-0.5);
    int _586 = abs(_572);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _588;
    bool _592 = _560 > 0.0;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _598 = _560 >= 0.0;
    bool _600 = isnan(_560);
    bool _602 = _598 || _600;
    bool _604 = isnan(0.0);
    bool _606 = _602 || _604;
    float _608 = _494 * 2.0;
    float _610 = exp2(_580);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _612;
    int _616 = _606 ? 0 : 1;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _622 = _578 > 0.0;
    float _624 = fma(_614, _546, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _626 = _578 >= 0.0;
    bool _628 = isnan(_578);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = fma(_590, _546, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _638 = floor(_608);
    float _640 = fma(_620, _562, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _642 = fma(_596, _562, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _644 = ~_616;
    int _646 = _644 + 1;
    int _648 = _646 + 1;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _658 = _648;
    if (!_592)
    {
        int _660 = ~_616;
        int _662 = _660 + 1;
        _658 = _662;
    }
    int _664 = _658;
    float _666 = -_610;
    float _668 = _666 + 1.0;
    float _670 = fma(_652, _546, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _674 = 1.0 + _672;
    float _676 = fma(_656, _562, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _678 = _634 ? 0 : 1;
    float _680 = _494 + (-0.5);
    float _682 = 1.0 / _674;
    bool _684 = _638 > 0.0;
    bool _686 = _638 >= 0.0;
    bool _688 = isnan(_638);
    bool _690 = _686 || _688;
    bool _692 = isnan(0.0);
    bool _694 = _690 || _692;
    float _696 = in.m_61.x;
    float _698 = in.m_61.y;
    float _700 = in.m_61.z;
    bool _702 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _704 = isnan(1.0);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _710 = _706 || _708;
    float _712 = float(_552);
    int _714 = ~_678;
    int _716 = _714 + 1;
    int _718 = _716 + 1;
    float _720 = float(_664);
    int _722 = _718;
    if (!_622)
    {
        int _724 = ~_678;
        int _726 = _724 + 1;
        _722 = _726;
    }
    int _728 = _722;
    float _730 = _712 * _720;
    float _732 = _540 ? _668 : 0.0;
    float _734 = float(_586);
    float _736 = float(_728);
    if (_710)
    {
        float _738 = _732 * _682;
        _132 = _738;
    }
    float _740 = _132;
    float _742 = _730 * (-2.0);
    float _744 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _746 = _734 * _736;
    float _748 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _750 = fma(_576, _742, _576);
    float _752 = fma(_742, _696, _696);
    float _754 = _744 * _480;
    float _756 = _746 * (-2.0);
    float _758 = _748 * _480;
    float _760 = _480 + (-0.5);
    bool _762 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _764 = isnan(_472);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = fma(_756, _698, _698);
    int _776 = _694 ? 0 : 1;
    float _778 = fma(_574, _756, _574);
    float _780 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[196].x, _752);
    bool _782 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _784 = isnan(_472);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -_772;
    float _796 = _794 + 1.0;
    bool _798 = !_518;
    int _800 = _798 ? 0 : 1;
    float _802 = fma(_750, _740, _780);
    int _804 = ~_776;
    int _806 = _804 + 1;
    int _808 = _806 + 1;
    float _810 = _792 * _796;
    int _812 = _808;
    if (!_684)
    {
        int _814 = ~_776;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    float _820 = -_792;
    float _822 = _820 + 1.0;
    int _824 = abs(_800);
    float _826 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].y, _774);
    bool _828 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _830 = isnan(_472);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = _802 * 0.15915493667125701904296875;
    float _842 = float(_824);
    float _844 = fma(_778, _740, _826);
    float _846 = float(_818);
    float _848 = _838 * _822;
    float _850 = -_838;
    float _852 = _850 + 1.0;
    float _854 = _844 * 0.15915493667125701904296875;
    float _856 = _840 * 6.283185482025146484375;
    float _858 = sin(_856);
    float _860 = _842 * _846;
    float _862 = _624 * _848;
    float _864 = _636 * _848;
    float _866 = _670 * _848;
    float _868 = _860 * (-2.0);
    float _870 = in.m_57.x;
    float _872 = in.m_57.y;
    float _874 = in.m_57.z;
    float _876 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].x, _862);
    float _878 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].y, _864);
    float _880 = fma(_868, _700, _700);
    float _882 = in.m_63.x;
    float _884 = in.m_63.y;
    float _886 = in.m_63.z;
    float _888 = fma(_582, _868, _582);
    float _890 = fma(_640, _810, _876);
    float _892 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[196].z, _880);
    float _894 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].z, _866);
    float _896 = fma(_642, _810, _878);
    float _898 = _840 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = fma(_888, _740, _892);
    float _904 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[145].x, _890);
    float _906 = fma(_676, _810, _894);
    float _908 = _902 * 0.15915493667125701904296875;
    float _910 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[145].y, _896);
    float _912 = in.m_53.w;
    float _914 = _854 * 6.283185482025146484375;
    float _916 = sin(_914);
    float _918 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[145].z, _906);
    float _920 = _904 * _870;
    float _922 = _910 * _872;
    float _924 = _854 * 6.283185482025146484375;
    float _926 = cos(_924);
    float _928 = _918 * _874;
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _882);
    float _932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _884);
    float _934 = _922 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _886);
    float _938 = _920 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _940 = _928 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _942 = _908 * 6.283185482025146484375;
    float _944 = cos(_942);
    float _946 = _934 * _932;
    float _948 = _938 * _930;
    float _950 = _940 * _936;
    float _952 = in.m_55.w;
    float _954 = _858 * _916;
    float _956 = _900 * _916;
    float _958 = _908 * 6.283185482025146484375;
    float _960 = sin(_958);
    float _962 = _900 * _926;
    float _964 = _944 * _946;
    float _966 = _916 * _944;
    float _968 = _926 * _944;
    float _970 = _858 * _926;
    float _972 = _900 * _964;
    float _974 = trunc(_754);
    int _976 = int(_974);
    float _978 = _858 * _964;
    float _980 = fma(_960, _962, _954);
    float _982 = -_946;
    float _984 = _960 * _982;
    float _986 = -_970;
    float _988 = fma(_960, _956, _986);
    float _990 = -_956;
    float _992 = fma(_960, _970, _990);
    float _994 = fma(_980, _948, _972);
    float _996 = trunc(_758);
    int _998 = int(_996);
    float _1000 = fma(_968, _948, _984);
    float _1002 = fma(_960, _954, _962);
    float _1004 = fma(_988, _950, _994);
    float _1006 = fma(_992, _948, _978);
    float _1008 = fma(_966, _950, _1000);
    float _1010 = fma(_442, _168, _500);
    float _1012 = _1004 * _408;
    float _1014 = _1004 * _424;
    float _1016 = fma(_1002, _950, _1006);
    float _1018 = _506 + _912;
    float _1020 = fma(_1008, _340, _1012);
    float _1022 = fma(_1008, _364, _1014);
    float _1024 = _1010 + _952;
    int _1026 = _976 << 4;
    int _1028 = _1026 + 1712;
    float _1030 = fma(_1016, _428, _1020);
    float _1032 = fma(_1016, _436, _1022);
    int _1034 = _998 << 4;
    int _1036 = _1034 + 1968;
    int _1038 = _1028 + 8;
    uint _1041 = uint(int(uint(_1038) >> uint(2)));
    uint _1043 = uint(int(uint(int(_1041)) >> uint(2)));
    int _1045 = int(_1041) & 3;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[int(_1043)][_1045];
    float _1049 = _1018 + _1030;
    float _1051 = _1024 + _1032;
    float _1053 = in.m_51.w;
    float _1055 = _1004 * _416;
    float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1059 = _1049 + _1057;
    float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1063 = _1051 + _1061;
    int _1065 = _1036 + 8;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    uint _1069 = uint(int(uint(int(_1067)) >> uint(2)));
    int _1071 = int(_1067) & 3;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[int(_1069)][_1071];
    float _1075 = _1059 * _1059;
    float _1077 = _1063 * _1063;
    float _1079 = fma(_1008, _360, _1055);
    float _1081 = _1075 + _1077;
    float _1083 = fma(_1016, _432, _1079);
    uint _1085 = uint(int(uint(_1028) >> uint(2)));
    uint _1087 = uint(int(uint(int(_1085)) >> uint(2)));
    int _1089 = int(_1085) & 3;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[int(_1087)][_1089];
    int _1093 = int(_1085) + 1;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    int _1097 = _1093 & 3;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[int(_1095)][_1097];
    float _1101 = sqrt(_1081);
    uint _1103 = uint(int(uint(_1036) >> uint(2)));
    uint _1105 = uint(int(uint(int(_1103)) >> uint(2)));
    int _1107 = int(_1103) & 3;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[int(_1105)][_1107];
    int _1111 = int(_1103) + 1;
    uint _1113 = uint(int(uint(_1111) >> uint(2)));
    int _1115 = _1111 & 3;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[int(_1113)][_1115];
    float _1119 = _554 + _1053;
    float _1121 = _1119 + _1083;
    bool _1123 = _1101 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1125 = _1004;
    float _1127 = _1053;
    float _1129 = _1083;
    float _1131 = _1024;
    float _1133 = _1121;
    if (!_1123)
    {
        _224 = _1077;
    }
    float _1135 = _224;
    float _1137 = _1135;
    if (!_1123)
    {
        _226 = _1075;
    }
    float _1139 = _226;
    float _1141 = _1139;
    if (!_1123)
    {
        _1125 = _1049;
    }
    float _1143 = _1125;
    float _1145 = _1143;
    if (!_1123)
    {
        _1127 = _1051;
    }
    float _1147 = _1127;
    float _1149 = _1147;
    if (!_1123)
    {
        _1129 = _1121;
    }
    float _1151 = _1129;
    bool _1153 = !_1123;
    float _1155 = _1151;
    if (!_1153)
    {
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1161 = _1101 + _1159;
        float _1163 = _1121 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1165 = rsqrt(_1081);
        float _1167 = _1161 * _1157;
        float _1169 = _1167 * 0.15915493667125701904296875;
        float _1171 = _1169 * 6.283185482025146484375;
        float _1173 = sin(_1171);
        float _1175 = _1169 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        float _1179 = fma(_1173, _1163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1181 = _1165 * _1179;
        float _1183 = _1177 + (-1.0);
        float _1185 = fma(_1059, _1181, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1187 = fma(_1063, _1181, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1189 = _1183 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1191 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1193 = _1185 + _1191;
        float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1197 = _1187 + _1195;
        float _1199 = fma(_1121, _1177, _1189);
        float _1201 = _1193 * _1193;
        float _1203 = _1197 * _1197;
        _1155 = _1199;
        _1141 = _1201;
        _1137 = _1203;
        _1145 = _1185;
        _1149 = _1187;
    }
    float _1205 = _1155;
    float _1207 = _1141;
    float _1209 = _1137;
    float _1211 = _1145;
    float _1213 = _1149;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1217 = _1205 + _1215;
    float _1219 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1221 = _1047 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1223 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1225 = fma(_1217, _1217, _1207);
    float _1227 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1229 = _1225 + _1209;
    float _1231 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1233 = _1099 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1235 = _1109 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1237 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1239 = sqrt(_1229);
    float _1241 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1243 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1245 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1247 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1249 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    out.m_67.x = _1241;
    out.m_67.y = _1243;
    out.m_67.z = _1227;
    out.m_67.w = _1237;
    out.m_69.x = _1245;
    out.m_69.y = _1247;
    out.m_69.z = _1249;
    bool _1251 = _1239 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1253 = isnan(_1239);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1259 = _1255 || _1257;
    float _1261 = _1219;
    float _1263 = _1243;
    float _1265 = _1237;
    float _1267 = 1.0;
    float _1269 = _1245;
    if (!_1259)
    {
        _1261 = 1.0;
    }
    float _1271 = _1261;
    bool _1273 = !_1259;
    float _1275 = _1271;
    if (!_1273)
    {
        bool _1277 = _1239 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1279 = isnan(_1239);
        bool _1281 = _1277 || _1279;
        bool _1283 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1285 = _1281 || _1283;
        if (!_1285)
        {
            float _1287 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1289 = _1239 + _1287;
            float _1291 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1293 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1291;
            float _1295 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1297 = _1295 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1299 = 1.0 / _1293;
            float _1301 = _1289 * _1299;
            float _1303 = fma(_1301, _1297, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1275 = _1303;
            _1263 = _1299;
            _1305 = true;
        }
        else
        {
            bool _1307 = _1239 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1309 = isnan(_1239);
            bool _1311 = _1307 || _1309;
            bool _1313 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1315 = _1311 || _1313;
            if (!_1315)
            {
                float _1317 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1319 = _1239 + _1317;
                float _1321 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1323 = _1321 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1325 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1327 = _1325 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1329 = 1.0 / _1323;
                float _1331 = _1319 * _1329;
                float _1333 = fma(_1331, _1327, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1275 = _1333;
                _1263 = _1329;
                _1305 = true;
            }
            else
            {
                _1275 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1305 = false;
    float _1335 = _1275;
    float _1337 = _1263;
    float _1339 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1341 = _1211 + _1339;
    float _1343 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1345 = _1205 + _1343;
    bool _1347 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.5);
    bool _1355 = _1351 || _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1359 = _1213 + _1357;
    float _1361 = fma(_1341, _1335, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1363 = fma(_1345, _1335, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1365 = fma(_1359, _1335, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1367 = _1337;
    if (_1355)
    {
        _1265 = _1361;
    }
    float _1369 = _1265;
    float _1371 = _1369;
    if (_1355)
    {
        _1267 = _1363;
    }
    float _1373 = _1267;
    float _1375 = _1373;
    if (_1355)
    {
        _1367 = _1365;
    }
    float _1377 = _1367;
    float _1379 = _1377;
    if (!_1355)
    {
        float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1383 = _1119 + _1381;
        float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1387 = _1018 + _1385;
        float _1389 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1391 = _1383 * _1383;
        float _1393 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1395 = _1024 + _1393;
        float _1397 = fma(_1387, _1387, _1391);
        float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1401 = fma(_1395, _1395, _1397);
        float _1403 = sqrt(_1401);
        float _1405 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1407 = precise::min(_1403, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1409 = _1407 * _1399;
        float _1411 = -_1018;
        float _1413 = _1411 + _1361;
        float _1415 = _1405 * _1409;
        float _1417 = -_1119;
        float _1419 = _1417 + _1363;
        float _1421 = -_1024;
        float _1423 = _1421 + _1365;
        float _1425 = fma(_1413, _1415, _1018);
        float _1427 = fma(_1419, _1415, _1119);
        float _1429 = fma(_1423, _1415, _1024);
        _1375 = _1427;
        _1371 = _1425;
        _1379 = _1429;
    }
    float _1431 = _1375;
    float _1433 = _1371;
    float _1435 = _1379;
    float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1439 = _1431 + _1437;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1443 = _1433 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1447 = _1435 + _1445;
    float _1449 = _1439 * _1439;
    float _1451 = fma(_1443, _1443, _1449);
    float _1453 = fma(_1447, _1447, _1451);
    float _1455 = rsqrt(_1453);
    float _1457 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1459 = _1443 * _1457;
    float _1461 = _1447 * _1457;
    float _1463 = _1459 * _1459;
    float _1465 = _1461 * _1461;
    float _1467 = _1463 + _1465;
    float _1469 = sqrt(_1467);
    bool _1471 = _1469 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1473 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1475 = _1469 + _1473;
    float _1477 = _1455;
    float _1479 = _1475;
    float _1481 = _1457;
    float _1483 = _1459;
    if (_1471)
    {
        float _1485 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1477 = _1485;
    }
    float _1487 = _1477;
    if (_1471)
    {
        float _1489 = rsqrt(_1467);
        _1131 = _1489;
    }
    float _1491 = _1131;
    float _1493 = _1491;
    if (_1471)
    {
        float _1495 = _1475 * _1487;
        _1479 = _1495;
    }
    float _1497 = _1479;
    if (_1471)
    {
        float _1499 = _1497 * 0.15915493667125701904296875;
        _1269 = _1499;
    }
    float _1501 = _1269;
    float _1503 = _1018;
    if (_1471)
    {
        float _1505 = _1501 * 6.283185482025146484375;
        float _1507 = sin(_1505);
        _1503 = _1507;
    }
    float _1509 = _1503;
    float _1511 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1513 = precise::max(0.0, _1511);
    float _1515 = _1447;
    float _1517 = _1513;
    float _1519 = _1511;
    if (_1471)
    {
        float _1521 = _1501 * 6.283185482025146484375;
        float _1523 = cos(_1521);
        _1515 = _1523;
    }
    float _1525 = _1515;
    float _1527 = -_1457;
    float _1529 = -_1513;
    float _1531 = fma(_1439, _1527, _1529);
    if (_1471)
    {
        float _1533 = _1531 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1517 = _1533;
    }
    float _1535 = _1517;
    float _1537 = sqrt(_1453);
    float _1539 = _1535;
    float _1541 = _1509;
    if (_1471)
    {
        float _1543 = fma(_1509, _1535, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1539 = _1543;
    }
    float _1545 = _1539;
    float _1547 = _1545;
    if (!_1471)
    {
        _1541 = _1461;
    }
    float _1549 = _1541;
    float _1551 = _1549;
    if (_1471)
    {
        float _1553 = _1525 + (-1.0);
        _1519 = _1553;
    }
    float _1555 = _1519;
    float _1557 = _1555;
    if (_1471)
    {
        float _1559 = _1491 * _1545;
        _1133 = _1559;
    }
    float _1561 = _1133;
    if (!_1471)
    {
        _1493 = _1531;
    }
    float _1563 = _1493;
    float _1565 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1567 = _1563;
    if (_1471)
    {
        float _1569 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1481 = _1569;
    }
    float _1571 = _1481;
    if (_1471)
    {
        float _1573 = _1459 * _1561;
        _1483 = _1573;
    }
    float _1575 = _1483;
    if (!_1471)
    {
        _1547 = _1463;
    }
    float _1577 = _1547;
    float _1579 = _1577;
    if (_1471)
    {
        float _1581 = _1461 * _1561;
        _1551 = _1581;
    }
    float _1583 = _1551;
    if (_1471)
    {
        float _1585 = fma(_1531, _1525, _1571);
        _1567 = _1585;
    }
    float _1587 = _1567;
    if (_1471)
    {
        float _1589 = _1575 * _1575;
        _1579 = _1589;
    }
    float _1591 = _1579;
    if (!_1471)
    {
        _1557 = _1465;
    }
    float _1593 = _1557;
    float _1595 = _1593;
    if (_1471)
    {
        float _1597 = _1583 * _1583;
        _1595 = _1597;
    }
    float _1599 = _1595;
    float _1601 = fma(_1587, _1587, _1591);
    float _1603 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1565);
    float _1605 = _1601 + _1599;
    float _1607 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1611 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1609);
    float _1613 = precise::clamp(_1611, 0.0, 1.0);
    float _1615 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1617 = rsqrt(_1605);
    float _1619 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1607);
    float _1621 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1623 = -_1613;
    float _1625 = _1623 + 1.0;
    float _1627 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1629 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1619);
    float _1631 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1621);
    float _1633 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1627);
    float _1635 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1637 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1631);
    float _1639 = abs(_1625);
    float _1641 = log2(_1639);
    float _1643 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1633);
    float _1645 = _1635 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1647 = _1637 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1649 = _1617 * _1575;
    float _1651 = -_1645;
    float _1653 = fma(_1651, _1615, 1.0);
    float _1655 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1603);
    float _1657 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1659 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1661 = _1617 * _1587;
    float _1663 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1665 = _1617 * _1583;
    float _1667 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1659);
    float _1669 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1671 = -_1663;
    float _1673 = fma(_1661, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1671);
    float _1675 = _1641 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1677 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1667);
    float _1679 = log2(_1653);
    float _1681 = -_1665;
    float _1683 = fma(_1681, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1673);
    float _1685 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1687 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1677);
    float _1689 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1691 = fma(_1683, -0.5, 0.5);
    float _1693 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1685);
    float _1695 = fma(_1683, 0.5, 0.5);
    float _1697 = exp2(_1675);
    float _1699 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1689);
    float _1701 = _1661 + 1.0;
    float _1703 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1693);
    float _1705 = fma(_1695, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1707 = 1.0 / _1687;
    float _1709 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1699);
    float _1711 = fma(_1695, _1705, -0.212114393711090087890625);
    float _1713 = _1679 * 0.693147182464599609375;
    float _1715 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1709);
    float _1717 = fma(_1695, _1711, 1.570728778839111328125);
    float _1719 = _1713 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1721 = sqrt(_1691);
    float _1723 = -_1661;
    float _1725 = fma(_1697, _1701, _1723);
    float _1727 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1703);
    float _1729 = fma(_1725, 0.5, 0.5);
    float _1731 = _1727 * _1707;
    float _1733 = _1715 * _1707;
    float _1735 = fma(_1731, 0.5, 0.5);
    float _1737 = fma(_1733, -0.5, 0.5);
    float _1739 = _1721 * 0.636619746685028076171875;
    float3 _4386 = float3(_1735, _1737, _1719);
    float _1741 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4386, float3(0.0), isnan(_4386)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4386, float3(0.0), isnan(_4386)), level(0.0)).x;
    float _1743 = -_1717;
    float _1745 = fma(_1739, _1743, 1.0);
    float3 _4402 = float3(_1735, _1737, _1719);
    float4 _1748 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4402, float3(0.0), isnan(_4402)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4402, float3(0.0), isnan(_4402)), level(0.0)).xyzw;
    float _1750 = _1748.x;
    float _1752 = _1748.y;
    float _1754 = _1748.z;
    float _1756 = _1748.w;
    float2 _4419 = float2(_1745, _1729);
    float3 _1760 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4419, float2(0.0), isnan(_4419)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4419, float2(0.0), isnan(_4419)), level(0.0)).xyz;
    float _1762 = _1760.x;
    float _1764 = _1760.y;
    float _1766 = _1760.z;
    float _1768 = _1641 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1770 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _1772 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1770);
    float _1774 = exp2(_1768);
    float _1776 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1772);
    float _1778 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1776);
    float _1780 = _1778 + _1687;
    out.gl_Position.x = _1727;
    out.gl_Position.y = _1715;
    out.gl_Position.z = _1778;
    out.gl_Position.w = _1687;
    float _1782 = _1780 * 0.5;
    float _1784 = -_1774;
    float _1786 = _1784 + 1.0;
    float _1788 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1790 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.z = _1782;
    out.m_71.w = _1687;
    out.m_73.w = _1790;
    float _1792 = _1788 * _1741;
    float _1794 = -_1788;
    float _1796 = _1794 + 1.0;
    float _1798 = _1756 * _1792;
    float _1800 = _1766 * _1792;
    float _1802 = fma(_1762, _1798, _1750);
    float _1804 = fma(_1764, _1798, _1752);
    float _1806 = _1756 * _1796;
    float _1808 = fma(_1756, _1800, _1754);
    out.m_75.x = _1802;
    out.m_75.y = _1804;
    out.m_75.z = _1808;
    out.m_75.w = _1806;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1305 = false;
    bool _464 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1865 = as_type<float>(_110);
        out.gl_Position.z = _1865;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_49.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    float _132 = _128;
    if (_124)
    {
        float _134 = float(_94);
        _130 = _134;
    }
    float _136 = _130;
    bool _138 = _128 >= _136;
    bool _140 = !_124;
    bool _142 = _138 || _140;
    if (_142)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _104;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1934 = as_type<float>(_148);
        out.gl_Position.z = _1934;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = in.m_51.z;
    float _156 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_53.x;
    float _160 = in.m_53.y;
    float _162 = in.m_53.z;
    float _164 = in.m_55.x;
    float _166 = in.m_55.y;
    float _168 = in.m_55.z;
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _150 * _150;
    float _178 = _152 * _152;
    float _180 = _154 * _154;
    float _182 = fma(_158, _158, _176);
    float _184 = fma(_160, _160, _178);
    float _186 = fma(_162, _162, _180);
    float _188 = fma(_164, _164, _182);
    float _190 = fma(_166, _166, _184);
    float _192 = fma(_168, _168, _186);
    float _194 = sqrt(_188);
    float _196 = sqrt(_190);
    bool _198 = _194 > 0.0;
    float _200 = sqrt(_192);
    bool _202 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _204 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _206 = _202 || _204;
    bool _208 = isnan(1.0);
    bool _210 = _206 || _208;
    bool _212 = _196 > 0.0;
    float _214 = 0.0;
    float _216 = _196;
    float _218 = _188;
    float _220 = _156;
    float _222 = _192;
    float _224 = _152;
    float _226 = _150;
    if (_198)
    {
        float _228 = rsqrt(_188);
        _214 = _228;
    }
    float _230 = _214;
    bool _232 = _200 > 0.0;
    float _234 = 0.0;
    float _236 = _200;
    if (!_210)
    {
        float _238 = _156 * _156;
        float _240 = _238 * 0.5;
        _234 = _240;
    }
    float _242 = _234;
    float _244 = 0.0;
    float _246 = _242;
    if (_212)
    {
        float _248 = rsqrt(_190);
        _244 = _248;
    }
    float _250 = _244;
    if (!_210)
    {
        float _252 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _246 = _252;
    }
    float _254 = _246;
    bool _256 = !_210;
    float _258 = _254;
    float _260 = _230;
    if (!_256)
    {
        float _262 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _264 = log2(_262);
        float _266 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _268 = _266 + 1.0;
        float _270 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _272 = _156 * _264;
        float _274 = 1.0 / _268;
        float _276 = _270 * 0.693147182464599609375;
        float _278 = exp2(_272);
        float _280 = 1.0 / _276;
        float _282 = _278 + (-1.0);
        float _284 = -_282;
        float _286 = fma(_284, _280, _156);
        float _288 = _286 * _274;
        float _290 = _288 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _258 = _290;
        _216 = _278;
        _218 = _280;
        _236 = _274;
    }
    float _292 = _258;
    float _294 = _216;
    float _296 = _218;
    float _298 = _236;
    bool _300 = !_210;
    float _302 = _298;
    float _304 = _294;
    float _306 = _296;
    if (!_300)
    {
        float _308 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _310 = log2(_308);
        float _312 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _314 = _312 + 1.0;
        float _316 = 1.0 / _314;
        float _318 = _156 * _310;
        float _320 = exp2(_318);
        float _322 = -_320;
        float _324 = _322 + 1.0;
        float _326 = _324 * _316;
        _220 = _326;
    }
    float _328 = _220;
    float _330 = in.m_57.w;
    float _332 = 0.0;
    if (!_198)
    {
        _332 = 0.0;
    }
    float _334 = _332;
    float _336 = _334;
    if (_198)
    {
        float _338 = _230 * _158;
        _336 = _338;
    }
    float _340 = _336;
    if (!_198)
    {
        _302 = 0.0;
    }
    float _342 = _302;
    float _344 = in.m_44.x;
    float _346 = in.m_44.y;
    float _348 = in.m_44.z;
    float _350 = 0.0;
    float _352 = _342;
    if (!_198)
    {
        _350 = 0.0;
    }
    float _354 = _350;
    float _356 = _354;
    if (_198)
    {
        float _358 = _230 * _150;
        _352 = _358;
    }
    float _360 = _352;
    if (_198)
    {
        float _362 = _230 * _164;
        _356 = _362;
    }
    float _364 = _356;
    float _366 = 0.0;
    if (_232)
    {
        float _368 = rsqrt(_192);
        _366 = _368;
    }
    float _370 = _366;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _374 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _376 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _378 = _292 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _380 = _376;
    if (!_212)
    {
        _304 = 0.0;
    }
    float _382 = _304;
    float _384 = fma(_328, _170, _374);
    float _386 = fma(_328, _172, _376);
    float _388 = fma(_328, _174, _378);
    float _390 = 0.0;
    float _392 = _382;
    if (!_232)
    {
        _390 = 0.0;
        _380 = 0.0;
    }
    float _394 = _390;
    float _396 = _380;
    float _398 = _394;
    float _400 = _396;
    if (!_212)
    {
        _306 = 0.0;
    }
    float _402 = _306;
    float _404 = _402;
    if (_212)
    {
        float _406 = _250 * _160;
        _392 = _406;
    }
    float _408 = _392;
    if (!_212)
    {
        _260 = 0.0;
    }
    float _410 = _260;
    float _412 = _410;
    if (_212)
    {
        float _414 = _250 * _152;
        _404 = _414;
    }
    float _416 = _404;
    if (!_232)
    {
        _222 = 0.0;
    }
    float _418 = _222;
    float _420 = _418;
    if (_212)
    {
        float _422 = _250 * _166;
        _412 = _422;
    }
    float _424 = _412;
    if (_232)
    {
        float _426 = _370 * _162;
        _398 = _426;
    }
    float _428 = _398;
    if (_232)
    {
        float _430 = _370 * _154;
        _420 = _430;
    }
    float _432 = _420;
    if (_232)
    {
        float _434 = _370 * _168;
        _400 = _434;
    }
    float _436 = _400;
    float _438 = fma(_384, _330, _344);
    float _440 = fma(_386, _330, _346);
    float _442 = fma(_388, _330, _348);
    bool _444 = !_372;
    float _462;
    if (!_444)
    {
        float _446 = in.m_59.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_94);
        float _468 = 1.0 / _466;
        float _470 = _128 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = in.m_59.z;
    float _476 = _440 * _160;
    float _478 = _440 * _166;
    float _480 = in.m_59.x;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _484 = _472 + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _494 = in.m_59.y;
    float _496 = fma(_438, _158, _476);
    float _498 = 1.0 / _488;
    float _500 = fma(_438, _164, _478);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _504 = _472 + _502;
    float _506 = fma(_442, _162, _496);
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _510 = _508 != 0;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _514 = _512 != 0;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _518 = _516 != 0;
    float _520 = _440 * _152;
    float _522 = 1.0 / _492;
    float _524 = fma(_438, _150, _520);
    bool _526 = !_510;
    int _528 = _526 ? 0 : 1;
    float _530 = _474 * 2.0;
    bool _532 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _534 = isnan(0.0);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _540 = _536 || _538;
    float _542 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _544 = log2(_542);
    float _546 = _504 * _498;
    float _548 = _480 * 2.0;
    float _550 = _480 + _474;
    int _552 = abs(_528);
    float _554 = fma(_442, _154, _524);
    float _556 = _494 + _474;
    float _558 = _480 + _494;
    float _560 = floor(_530);
    float _562 = _484 * _522;
    float _564 = _556 + (-1.0);
    float _566 = _558 + (-1.0);
    float _568 = _550 + (-1.0);
    bool _570 = !_514;
    int _572 = _570 ? 0 : 1;
    float _574 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _576 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _578 = floor(_548);
    float _580 = _544 * _128;
    float _582 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _584 = _474 + (-0.5);
    int _586 = abs(_572);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _588;
    bool _592 = _560 > 0.0;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _598 = _560 >= 0.0;
    bool _600 = isnan(_560);
    bool _602 = _598 || _600;
    bool _604 = isnan(0.0);
    bool _606 = _602 || _604;
    float _608 = _494 * 2.0;
    float _610 = exp2(_580);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _612;
    int _616 = _606 ? 0 : 1;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _622 = _578 > 0.0;
    float _624 = fma(_614, _546, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _626 = _578 >= 0.0;
    bool _628 = isnan(_578);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = fma(_590, _546, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _638 = floor(_608);
    float _640 = fma(_620, _562, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _642 = fma(_596, _562, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _644 = ~_616;
    int _646 = _644 + 1;
    int _648 = _646 + 1;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _658 = _648;
    if (!_592)
    {
        int _660 = ~_616;
        int _662 = _660 + 1;
        _658 = _662;
    }
    int _664 = _658;
    float _666 = -_610;
    float _668 = _666 + 1.0;
    float _670 = fma(_652, _546, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _674 = 1.0 + _672;
    float _676 = fma(_656, _562, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _678 = _634 ? 0 : 1;
    float _680 = _494 + (-0.5);
    float _682 = 1.0 / _674;
    bool _684 = _638 > 0.0;
    bool _686 = _638 >= 0.0;
    bool _688 = isnan(_638);
    bool _690 = _686 || _688;
    bool _692 = isnan(0.0);
    bool _694 = _690 || _692;
    float _696 = in.m_61.x;
    float _698 = in.m_61.y;
    float _700 = in.m_61.z;
    bool _702 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _704 = isnan(1.0);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _710 = _706 || _708;
    float _712 = float(_552);
    int _714 = ~_678;
    int _716 = _714 + 1;
    int _718 = _716 + 1;
    float _720 = float(_664);
    int _722 = _718;
    if (!_622)
    {
        int _724 = ~_678;
        int _726 = _724 + 1;
        _722 = _726;
    }
    int _728 = _722;
    float _730 = _712 * _720;
    float _732 = _540 ? _668 : 0.0;
    float _734 = float(_586);
    float _736 = float(_728);
    if (_710)
    {
        float _738 = _732 * _682;
        _132 = _738;
    }
    float _740 = _132;
    float _742 = _730 * (-2.0);
    float _744 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _746 = _734 * _736;
    float _748 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _750 = fma(_576, _742, _576);
    float _752 = fma(_742, _696, _696);
    float _754 = _744 * _480;
    float _756 = _746 * (-2.0);
    float _758 = _748 * _480;
    float _760 = _480 + (-0.5);
    bool _762 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _764 = isnan(_472);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = fma(_756, _698, _698);
    int _776 = _694 ? 0 : 1;
    float _778 = fma(_574, _756, _574);
    float _780 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[196].x, _752);
    bool _782 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _784 = isnan(_472);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -_772;
    float _796 = _794 + 1.0;
    bool _798 = !_518;
    int _800 = _798 ? 0 : 1;
    float _802 = fma(_750, _740, _780);
    int _804 = ~_776;
    int _806 = _804 + 1;
    int _808 = _806 + 1;
    float _810 = _792 * _796;
    int _812 = _808;
    if (!_684)
    {
        int _814 = ~_776;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    float _820 = -_792;
    float _822 = _820 + 1.0;
    int _824 = abs(_800);
    float _826 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].y, _774);
    bool _828 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _830 = isnan(_472);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = _802 * 0.15915493667125701904296875;
    float _842 = float(_824);
    float _844 = fma(_778, _740, _826);
    float _846 = float(_818);
    float _848 = _838 * _822;
    float _850 = -_838;
    float _852 = _850 + 1.0;
    float _854 = _844 * 0.15915493667125701904296875;
    float _856 = _840 * 6.283185482025146484375;
    float _858 = sin(_856);
    float _860 = _842 * _846;
    float _862 = _624 * _848;
    float _864 = _636 * _848;
    float _866 = _670 * _848;
    float _868 = _860 * (-2.0);
    float _870 = in.m_57.x;
    float _872 = in.m_57.y;
    float _874 = in.m_57.z;
    float _876 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].x, _862);
    float _878 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].y, _864);
    float _880 = fma(_868, _700, _700);
    float _882 = in.m_63.x;
    float _884 = in.m_63.y;
    float _886 = in.m_63.z;
    float _888 = fma(_582, _868, _582);
    float _890 = fma(_640, _810, _876);
    float _892 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[196].z, _880);
    float _894 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[143].z, _866);
    float _896 = fma(_642, _810, _878);
    float _898 = _840 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = fma(_888, _740, _892);
    float _904 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[145].x, _890);
    float _906 = fma(_676, _810, _894);
    float _908 = _902 * 0.15915493667125701904296875;
    float _910 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[145].y, _896);
    float _912 = in.m_53.w;
    float _914 = _854 * 6.283185482025146484375;
    float _916 = sin(_914);
    float _918 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[145].z, _906);
    float _920 = _904 * _870;
    float _922 = _910 * _872;
    float _924 = _854 * 6.283185482025146484375;
    float _926 = cos(_924);
    float _928 = _918 * _874;
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _882);
    float _932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _884);
    float _934 = _922 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _886);
    float _938 = _920 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _940 = _928 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _942 = _908 * 6.283185482025146484375;
    float _944 = cos(_942);
    float _946 = _934 * _932;
    float _948 = _938 * _930;
    float _950 = _940 * _936;
    float _952 = in.m_55.w;
    float _954 = _858 * _916;
    float _956 = _900 * _916;
    float _958 = _908 * 6.283185482025146484375;
    float _960 = sin(_958);
    float _962 = _900 * _926;
    float _964 = _944 * _946;
    float _966 = _916 * _944;
    float _968 = _926 * _944;
    float _970 = _858 * _926;
    float _972 = _900 * _964;
    float _974 = trunc(_754);
    int _976 = int(_974);
    float _978 = _858 * _964;
    float _980 = fma(_960, _962, _954);
    float _982 = -_946;
    float _984 = _960 * _982;
    float _986 = -_970;
    float _988 = fma(_960, _956, _986);
    float _990 = -_956;
    float _992 = fma(_960, _970, _990);
    float _994 = fma(_980, _948, _972);
    float _996 = trunc(_758);
    int _998 = int(_996);
    float _1000 = fma(_968, _948, _984);
    float _1002 = fma(_960, _954, _962);
    float _1004 = fma(_988, _950, _994);
    float _1006 = fma(_992, _948, _978);
    float _1008 = fma(_966, _950, _1000);
    float _1010 = fma(_442, _168, _500);
    float _1012 = _1004 * _408;
    float _1014 = _1004 * _424;
    float _1016 = fma(_1002, _950, _1006);
    float _1018 = _506 + _912;
    float _1020 = fma(_1008, _340, _1012);
    float _1022 = fma(_1008, _364, _1014);
    float _1024 = _1010 + _952;
    int _1026 = _976 << 4;
    int _1028 = _1026 + 1712;
    float _1030 = fma(_1016, _428, _1020);
    float _1032 = fma(_1016, _436, _1022);
    int _1034 = _998 << 4;
    int _1036 = _1034 + 1968;
    int _1038 = _1028 + 8;
    uint _1041 = uint(int(uint(_1038) >> uint(2)));
    uint _1043 = uint(int(uint(int(_1041)) >> uint(2)));
    int _1045 = int(_1041) & 3;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[int(_1043)][_1045];
    float _1049 = _1018 + _1030;
    float _1051 = _1024 + _1032;
    float _1053 = in.m_51.w;
    float _1055 = _1004 * _416;
    float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1059 = _1049 + _1057;
    float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1063 = _1051 + _1061;
    int _1065 = _1036 + 8;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    uint _1069 = uint(int(uint(int(_1067)) >> uint(2)));
    int _1071 = int(_1067) & 3;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[int(_1069)][_1071];
    float _1075 = _1059 * _1059;
    float _1077 = _1063 * _1063;
    float _1079 = fma(_1008, _360, _1055);
    float _1081 = _1075 + _1077;
    float _1083 = fma(_1016, _432, _1079);
    uint _1085 = uint(int(uint(_1028) >> uint(2)));
    uint _1087 = uint(int(uint(int(_1085)) >> uint(2)));
    int _1089 = int(_1085) & 3;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[int(_1087)][_1089];
    int _1093 = int(_1085) + 1;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    int _1097 = _1093 & 3;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[int(_1095)][_1097];
    float _1101 = sqrt(_1081);
    uint _1103 = uint(int(uint(_1036) >> uint(2)));
    uint _1105 = uint(int(uint(int(_1103)) >> uint(2)));
    int _1107 = int(_1103) & 3;
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[int(_1105)][_1107];
    int _1111 = int(_1103) + 1;
    uint _1113 = uint(int(uint(_1111) >> uint(2)));
    int _1115 = _1111 & 3;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[int(_1113)][_1115];
    float _1119 = _554 + _1053;
    float _1121 = _1119 + _1083;
    bool _1123 = _1101 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1125 = _1004;
    float _1127 = _1053;
    float _1129 = _1083;
    float _1131 = _1024;
    float _1133 = _1121;
    if (!_1123)
    {
        _224 = _1077;
    }
    float _1135 = _224;
    float _1137 = _1135;
    if (!_1123)
    {
        _226 = _1075;
    }
    float _1139 = _226;
    float _1141 = _1139;
    if (!_1123)
    {
        _1125 = _1049;
    }
    float _1143 = _1125;
    float _1145 = _1143;
    if (!_1123)
    {
        _1127 = _1051;
    }
    float _1147 = _1127;
    float _1149 = _1147;
    if (!_1123)
    {
        _1129 = _1121;
    }
    float _1151 = _1129;
    bool _1153 = !_1123;
    float _1155 = _1151;
    if (!_1153)
    {
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1161 = _1101 + _1159;
        float _1163 = _1121 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1165 = rsqrt(_1081);
        float _1167 = _1161 * _1157;
        float _1169 = _1167 * 0.15915493667125701904296875;
        float _1171 = _1169 * 6.283185482025146484375;
        float _1173 = sin(_1171);
        float _1175 = _1169 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        float _1179 = fma(_1173, _1163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1181 = _1165 * _1179;
        float _1183 = _1177 + (-1.0);
        float _1185 = fma(_1059, _1181, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1187 = fma(_1063, _1181, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1189 = _1183 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1191 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1193 = _1185 + _1191;
        float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1197 = _1187 + _1195;
        float _1199 = fma(_1121, _1177, _1189);
        float _1201 = _1193 * _1193;
        float _1203 = _1197 * _1197;
        _1155 = _1199;
        _1141 = _1201;
        _1137 = _1203;
        _1145 = _1185;
        _1149 = _1187;
    }
    float _1205 = _1155;
    float _1207 = _1141;
    float _1209 = _1137;
    float _1211 = _1145;
    float _1213 = _1149;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1217 = _1205 + _1215;
    float _1219 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1221 = _1047 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1223 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1225 = fma(_1217, _1217, _1207);
    float _1227 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1229 = _1225 + _1209;
    float _1231 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1233 = _1099 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1235 = _1109 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1237 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1239 = sqrt(_1229);
    float _1241 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1243 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1245 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1247 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1249 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    out.m_67.x = _1241;
    out.m_67.y = _1243;
    out.m_67.z = _1227;
    out.m_67.w = _1237;
    out.m_69.x = _1245;
    out.m_69.y = _1247;
    out.m_69.z = _1249;
    bool _1251 = _1239 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1253 = isnan(_1239);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1259 = _1255 || _1257;
    float _1261 = _1219;
    float _1263 = _1243;
    float _1265 = _1237;
    float _1267 = 1.0;
    float _1269 = _1245;
    if (!_1259)
    {
        _1261 = 1.0;
    }
    float _1271 = _1261;
    bool _1273 = !_1259;
    float _1275 = _1271;
    if (!_1273)
    {
        bool _1277 = _1239 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1279 = isnan(_1239);
        bool _1281 = _1277 || _1279;
        bool _1283 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1285 = _1281 || _1283;
        if (!_1285)
        {
            float _1287 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1289 = _1239 + _1287;
            float _1291 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1293 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1291;
            float _1295 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1297 = _1295 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1299 = 1.0 / _1293;
            float _1301 = _1289 * _1299;
            float _1303 = fma(_1301, _1297, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1275 = _1303;
            _1263 = _1299;
            _1305 = true;
        }
        else
        {
            bool _1307 = _1239 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1309 = isnan(_1239);
            bool _1311 = _1307 || _1309;
            bool _1313 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1315 = _1311 || _1313;
            if (!_1315)
            {
                float _1317 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1319 = _1239 + _1317;
                float _1321 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1323 = _1321 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1325 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1327 = _1325 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1329 = 1.0 / _1323;
                float _1331 = _1319 * _1329;
                float _1333 = fma(_1331, _1327, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1275 = _1333;
                _1263 = _1329;
                _1305 = true;
            }
            else
            {
                _1275 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1305 = false;
    float _1335 = _1275;
    float _1337 = _1263;
    float _1339 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1341 = _1211 + _1339;
    float _1343 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1345 = _1205 + _1343;
    bool _1347 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.5);
    bool _1355 = _1351 || _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1359 = _1213 + _1357;
    float _1361 = fma(_1341, _1335, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1363 = fma(_1345, _1335, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1365 = fma(_1359, _1335, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1367 = _1337;
    if (_1355)
    {
        _1265 = _1361;
    }
    float _1369 = _1265;
    float _1371 = _1369;
    if (_1355)
    {
        _1267 = _1363;
    }
    float _1373 = _1267;
    float _1375 = _1373;
    if (_1355)
    {
        _1367 = _1365;
    }
    float _1377 = _1367;
    float _1379 = _1377;
    if (!_1355)
    {
        float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1383 = _1119 + _1381;
        float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1387 = _1018 + _1385;
        float _1389 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1391 = _1383 * _1383;
        float _1393 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1395 = _1024 + _1393;
        float _1397 = fma(_1387, _1387, _1391);
        float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1401 = fma(_1395, _1395, _1397);
        float _1403 = sqrt(_1401);
        float _1405 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1407 = precise::min(_1403, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1409 = _1407 * _1399;
        float _1411 = -_1018;
        float _1413 = _1411 + _1361;
        float _1415 = _1405 * _1409;
        float _1417 = -_1119;
        float _1419 = _1417 + _1363;
        float _1421 = -_1024;
        float _1423 = _1421 + _1365;
        float _1425 = fma(_1413, _1415, _1018);
        float _1427 = fma(_1419, _1415, _1119);
        float _1429 = fma(_1423, _1415, _1024);
        _1375 = _1427;
        _1371 = _1425;
        _1379 = _1429;
    }
    float _1431 = _1375;
    float _1433 = _1371;
    float _1435 = _1379;
    float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1439 = _1431 + _1437;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1443 = _1433 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1447 = _1435 + _1445;
    float _1449 = _1439 * _1439;
    float _1451 = fma(_1443, _1443, _1449);
    float _1453 = fma(_1447, _1447, _1451);
    float _1455 = rsqrt(_1453);
    float _1457 = _1455 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1459 = _1443 * _1457;
    float _1461 = _1447 * _1457;
    float _1463 = _1459 * _1459;
    float _1465 = _1461 * _1461;
    float _1467 = _1463 + _1465;
    float _1469 = sqrt(_1467);
    bool _1471 = _1469 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1473 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1475 = _1469 + _1473;
    float _1477 = _1455;
    float _1479 = _1475;
    float _1481 = _1457;
    float _1483 = _1459;
    if (_1471)
    {
        float _1485 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1477 = _1485;
    }
    float _1487 = _1477;
    if (_1471)
    {
        float _1489 = rsqrt(_1467);
        _1131 = _1489;
    }
    float _1491 = _1131;
    float _1493 = _1491;
    if (_1471)
    {
        float _1495 = _1475 * _1487;
        _1479 = _1495;
    }
    float _1497 = _1479;
    if (_1471)
    {
        float _1499 = _1497 * 0.15915493667125701904296875;
        _1269 = _1499;
    }
    float _1501 = _1269;
    float _1503 = _1018;
    if (_1471)
    {
        float _1505 = _1501 * 6.283185482025146484375;
        float _1507 = sin(_1505);
        _1503 = _1507;
    }
    float _1509 = _1503;
    float _1511 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1513 = precise::max(0.0, _1511);
    float _1515 = _1447;
    float _1517 = _1513;
    float _1519 = _1511;
    if (_1471)
    {
        float _1521 = _1501 * 6.283185482025146484375;
        float _1523 = cos(_1521);
        _1515 = _1523;
    }
    float _1525 = _1515;
    float _1527 = -_1457;
    float _1529 = -_1513;
    float _1531 = fma(_1439, _1527, _1529);
    if (_1471)
    {
        float _1533 = _1531 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1517 = _1533;
    }
    float _1535 = _1517;
    float _1537 = sqrt(_1453);
    float _1539 = _1535;
    float _1541 = _1509;
    if (_1471)
    {
        float _1543 = fma(_1509, _1535, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1539 = _1543;
    }
    float _1545 = _1539;
    float _1547 = _1545;
    if (!_1471)
    {
        _1541 = _1461;
    }
    float _1549 = _1541;
    float _1551 = _1549;
    if (_1471)
    {
        float _1553 = _1525 + (-1.0);
        _1519 = _1553;
    }
    float _1555 = _1519;
    float _1557 = _1555;
    if (_1471)
    {
        float _1559 = _1491 * _1545;
        _1133 = _1559;
    }
    float _1561 = _1133;
    if (!_1471)
    {
        _1493 = _1531;
    }
    float _1563 = _1493;
    float _1565 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1567 = _1563;
    if (_1471)
    {
        float _1569 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1481 = _1569;
    }
    float _1571 = _1481;
    if (_1471)
    {
        float _1573 = _1459 * _1561;
        _1483 = _1573;
    }
    float _1575 = _1483;
    if (!_1471)
    {
        _1547 = _1463;
    }
    float _1577 = _1547;
    float _1579 = _1577;
    if (_1471)
    {
        float _1581 = _1461 * _1561;
        _1551 = _1581;
    }
    float _1583 = _1551;
    if (_1471)
    {
        float _1585 = fma(_1531, _1525, _1571);
        _1567 = _1585;
    }
    float _1587 = _1567;
    if (_1471)
    {
        float _1589 = _1575 * _1575;
        _1579 = _1589;
    }
    float _1591 = _1579;
    if (!_1471)
    {
        _1557 = _1465;
    }
    float _1593 = _1557;
    float _1595 = _1593;
    if (_1471)
    {
        float _1597 = _1583 * _1583;
        _1595 = _1597;
    }
    float _1599 = _1595;
    float _1601 = fma(_1587, _1587, _1591);
    float _1603 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1565);
    float _1605 = _1601 + _1599;
    float _1607 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1611 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1609);
    float _1613 = precise::clamp(_1611, 0.0, 1.0);
    float _1615 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1617 = rsqrt(_1605);
    float _1619 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1607);
    float _1621 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1623 = -_1613;
    float _1625 = _1623 + 1.0;
    float _1627 = _1431 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1629 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1619);
    float _1631 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1621);
    float _1633 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1627);
    float _1635 = _1629 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1637 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1631);
    float _1639 = abs(_1625);
    float _1641 = log2(_1639);
    float _1643 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1633);
    float _1645 = _1635 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1647 = _1637 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1649 = _1617 * _1575;
    float _1651 = -_1645;
    float _1653 = fma(_1651, _1615, 1.0);
    float _1655 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1603);
    float _1657 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1659 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1661 = _1617 * _1587;
    float _1663 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1665 = _1617 * _1583;
    float _1667 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1659);
    float _1669 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1671 = -_1663;
    float _1673 = fma(_1661, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1671);
    float _1675 = _1641 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1677 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1667);
    float _1679 = log2(_1653);
    float _1681 = -_1665;
    float _1683 = fma(_1681, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1673);
    float _1685 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1687 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1677);
    float _1689 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1691 = fma(_1683, -0.5, 0.5);
    float _1693 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1685);
    float _1695 = fma(_1683, 0.5, 0.5);
    float _1697 = exp2(_1675);
    float _1699 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1689);
    float _1701 = _1661 + 1.0;
    float _1703 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1693);
    float _1705 = fma(_1695, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1707 = 1.0 / _1687;
    float _1709 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1699);
    float _1711 = fma(_1695, _1705, -0.212114393711090087890625);
    float _1713 = _1679 * 0.693147182464599609375;
    float _1715 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1709);
    float _1717 = fma(_1695, _1711, 1.570728778839111328125);
    float _1719 = _1713 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1721 = sqrt(_1691);
    float _1723 = -_1661;
    float _1725 = fma(_1697, _1701, _1723);
    float _1727 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1703);
    float _1729 = fma(_1725, 0.5, 0.5);
    float _1731 = _1727 * _1707;
    float _1733 = _1715 * _1707;
    float _1735 = fma(_1731, 0.5, 0.5);
    float _1737 = fma(_1733, -0.5, 0.5);
    float _1739 = _1721 * 0.636619746685028076171875;
    float3 _4386 = float3(_1735, _1737, _1719);
    float _1741 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4386, float3(0.0), isnan(_4386)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4386, float3(0.0), isnan(_4386)), level(0.0)).x;
    float _1743 = -_1717;
    float _1745 = fma(_1739, _1743, 1.0);
    float3 _4402 = float3(_1735, _1737, _1719);
    float4 _1748 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4402, float3(0.0), isnan(_4402)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4402, float3(0.0), isnan(_4402)), level(0.0)).xyzw;
    float _1750 = _1748.x;
    float _1752 = _1748.y;
    float _1754 = _1748.z;
    float _1756 = _1748.w;
    float2 _4419 = float2(_1745, _1729);
    float3 _1760 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4419, float2(0.0), isnan(_4419)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4419, float2(0.0), isnan(_4419)), level(0.0)).xyz;
    float _1762 = _1760.x;
    float _1764 = _1760.y;
    float _1766 = _1760.z;
    float _1768 = _1641 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1770 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _1772 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1770);
    float _1774 = exp2(_1768);
    float _1776 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1772);
    float _1778 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1776);
    float _1780 = _1778 + _1687;
    out.gl_Position.x = _1727;
    out.gl_Position.y = _1715;
    out.gl_Position.z = _1778;
    out.gl_Position.w = _1687;
    float _1782 = _1780 * 0.5;
    float _1784 = -_1774;
    float _1786 = _1784 + 1.0;
    float _1788 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1790 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.z = _1782;
    out.m_71.w = _1687;
    out.m_73.w = _1790;
    float _1792 = _1788 * _1741;
    float _1794 = -_1788;
    float _1796 = _1794 + 1.0;
    float _1798 = _1756 * _1792;
    float _1800 = _1766 * _1792;
    float _1802 = fma(_1762, _1798, _1750);
    float _1804 = fma(_1764, _1798, _1752);
    float _1806 = _1756 * _1796;
    float _1808 = fma(_1756, _1800, _1754);
    out.m_75.x = _1802;
    out.m_75.y = _1804;
    out.m_75.z = _1808;
    out.m_75.w = _1806;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

