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
    float4 m_69 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _108 = as_type<float>(_100);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    float _112 = _110;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1217 = as_type<float>(_118);
        out.gl_Position.z = _1217;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_47.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = 0.0;
    if (_132)
    {
        float _140 = float(_100);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    if (_148)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _108;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _120 = as_type<int>(_152);
    }
    int _154 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1285 = as_type<float>(_154);
        out.gl_Position.z = _1285;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _156 = in.m_49.w;
    float _158 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _160 = in.m_51.x;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_51.y;
    float _174 = in.m_51.z;
    float _176 = in.m_47.x;
    float _178 = in.m_47.y;
    float _180 = in.m_47.z;
    float _182 = _158;
    if (!_170)
    {
        float _184 = _158 * _158;
        float _186 = _184 * 0.5;
        _138 = _186;
    }
    float _188 = _138;
    float _190 = in.m_42.x;
    float _192 = in.m_42.y;
    float _194 = in.m_42.z;
    float _196 = _188;
    if (!_170)
    {
        float _198 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    float _202 = in.m_49.x;
    float _204 = in.m_49.y;
    float _206 = in.m_49.z;
    bool _208 = !_170;
    float _210 = _200;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _158 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _158);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_170;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _158 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _182 = _264;
    }
    float _266 = _182;
    float _268 = _202 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = _204 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _160);
    float _274 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _172);
    float _276 = _268 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _278 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _270 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _282 = _206 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = _272 * _276;
    float _286 = fma(_266, _178, _278);
    float _288 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _290 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _292 = _274 * _280;
    float _294 = fma(_286, _156, _192);
    float _296 = fma(_266, _176, _288);
    float _298 = fma(_266, _180, _290);
    float _300 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _174);
    float _302 = _282 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _304 = fma(_296, _156, _190);
    float _306 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _308 = fma(_298, _156, _194);
    float _310 = _292 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _312 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _314 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[6].x, _306);
    float _316 = _300 * _302;
    float _318 = _292 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _320 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[10].x, _310);
    float _322 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[4].x, _312);
    float _324 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].z, _314);
    float _326 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[8].x, _318);
    float _328 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[10].z, _320);
    float _330 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].z, _322);
    float _332 = _324 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _334 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[8].z, _326);
    float _336 = _292 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _338 = _330 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _340 = _328 + _332;
    float _342 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[9].x, _336);
    float _344 = _334 + _338;
    float _346 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _348 = _340 + _346;
    float _350 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[9].z, _342);
    float _352 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _354 = _344 + _352;
    float _356 = _348 * _348;
    float _358 = fma(_354, _354, _356);
    float _360 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _362 = sqrt(_358);
    float _364 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[5].x, _360);
    float _366 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].z, _364);
    float _368 = _366 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _370 = _350 + _368;
    bool _372 = _362 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _374 = _368;
    float _376 = _344;
    float _378 = _350;
    float _380 = _358;
    float _382 = _284;
    if (!_372)
    {
        _374 = _344;
    }
    float _384 = _374;
    float _386 = _384;
    if (!_372)
    {
        _376 = _340;
    }
    float _388 = _376;
    float _390 = _388;
    if (!_372)
    {
        _378 = _370;
    }
    float _392 = _378;
    bool _394 = !_372;
    float _396 = _392;
    if (!_394)
    {
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _400 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _402 = _362 + _400;
        float _404 = rsqrt(_358);
        float _406 = _402 * _398;
        float _408 = _370 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _410 = _406 * 0.15915493667125701904296875;
        float _412 = _410 * 6.283185482025146484375;
        float _414 = cos(_412);
        float _416 = _410 * 6.283185482025146484375;
        float _418 = sin(_416);
        float _420 = _414 + (-1.0);
        float _422 = _420 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _424 = fma(_418, _408, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _426 = fma(_370, _414, _422);
        float _428 = _404 * _424;
        float _430 = fma(_354, _428, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _432 = fma(_348, _428, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _396 = _426;
        _386 = _430;
        _390 = _432;
    }
    float _434 = _396;
    float _436 = _386;
    float _438 = _390;
    float _440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _442 = _434 + _440;
    float _444 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _446 = _436 + _444;
    float _448 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _450 = _438 + _448;
    float _452 = _442 * _442;
    float _454 = fma(_446, _446, _452);
    float _456 = fma(_450, _450, _454);
    float _458 = rsqrt(_456);
    float _460 = sqrt(_456);
    float _462 = _458 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _464 = _446 * _462;
    float _466 = _450 * _462;
    float _468 = _464 * _464;
    float _470 = _466 * _466;
    float _472 = _468 + _470;
    float _474 = sqrt(_472);
    bool _476 = _474 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _478 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _480 = _474 + _478;
    float _482 = _450;
    float _484 = _472;
    float _486 = _480;
    float _488 = _442;
    if (_476)
    {
        float _490 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _482 = _490;
    }
    float _492 = _482;
    if (_476)
    {
        float _494 = rsqrt(_472);
        _484 = _494;
    }
    float _496 = _484;
    float _498 = _496;
    if (_476)
    {
        float _500 = _480 * _492;
        _486 = _500;
    }
    float _502 = _486;
    if (_476)
    {
        float _504 = _502 * 0.15915493667125701904296875;
        _380 = _504;
    }
    float _506 = _380;
    float _508 = _492;
    float _510 = _506;
    if (_476)
    {
        float _512 = _506 * 6.283185482025146484375;
        float _514 = sin(_512);
        _508 = _514;
    }
    float _516 = _508;
    float _518 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _520 = precise::max(0.0, _518);
    float _522 = _452;
    float _524 = _520;
    if (_476)
    {
        float _526 = _506 * 6.283185482025146484375;
        float _528 = cos(_526);
        _522 = _528;
    }
    float _530 = _522;
    float _532 = -_462;
    float _534 = -_520;
    float _536 = fma(_442, _532, _534);
    if (_476)
    {
        float _538 = _536 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _524 = _538;
    }
    float _540 = _524;
    float _542 = _516;
    float _544 = _540;
    if (_476)
    {
        float _546 = fma(_516, _540, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _488 = _546;
    }
    float _548 = _488;
    float _550 = _548;
    if (!_476)
    {
        _542 = _464;
    }
    float _552 = _542;
    float _554 = _552;
    float _556 = _530;
    if (_476)
    {
        float _558 = _530 + (-1.0);
        _544 = _558;
    }
    float _560 = _544;
    float _562 = _560;
    if (_476)
    {
        float _564 = _496 * _548;
        _382 = _564;
    }
    float _566 = _382;
    if (!_476)
    {
        _550 = _536;
    }
    float _568 = _550;
    float _570 = _568;
    if (_476)
    {
        float _572 = _560 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _510 = _572;
    }
    float _574 = _510;
    if (_476)
    {
        float _576 = _464 * _566;
        _554 = _576;
    }
    float _578 = _554;
    if (!_476)
    {
        _562 = _466;
    }
    float _580 = _562;
    float _582 = _580;
    if (_476)
    {
        float _584 = _466 * _566;
        _582 = _584;
    }
    float _586 = _582;
    if (!_476)
    {
        _498 = _468;
    }
    float _588 = _498;
    float _590 = _588;
    if (_476)
    {
        float _592 = fma(_536, _530, _574);
        _570 = _592;
    }
    float _594 = _570;
    if (_476)
    {
        float _596 = _578 * _578;
        _590 = _596;
    }
    float _598 = _590;
    if (!_476)
    {
        _556 = _470;
    }
    float _600 = _556;
    float _602 = _600;
    if (_476)
    {
        float _604 = _586 * _586;
        _602 = _604;
    }
    float _606 = _602;
    float _608 = fma(_594, _594, _598);
    float _610 = _434 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _612 = _608 + _606;
    float _614 = _434 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _616 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _618 = fma(_460, (*spvDescriptorSet0.vp_c15)._m0[23].w, _616);
    float _620 = precise::clamp(_618, 0.0, 1.0);
    float _622 = _434 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _624 = rsqrt(_612);
    float _626 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[2].x, _614);
    float _628 = -_620;
    float _630 = _628 + 1.0;
    float _632 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[1].x, _622);
    float _634 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _636 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[2].z, _626);
    float _638 = _434 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _640 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[1].z, _632);
    float _642 = abs(_630);
    float _644 = log2(_642);
    float _646 = _636 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _648 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[0].x, _638);
    float _650 = _640 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _652 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[3].x, _610);
    float _654 = _646 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _656 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[0].z, _648);
    float _658 = _624 * _578;
    float _660 = _624 * _594;
    float _662 = _656 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _664 = _650 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _666 = _658 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _668 = -_654;
    float _670 = fma(_668, _634, 1.0);
    float _672 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[3].z, _652);
    float _674 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[7].x, _664);
    float _676 = _644 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _678 = _624 * _586;
    float _680 = -_666;
    float _682 = fma(_660, (*spvDescriptorSet0.vp_c15)._m0[21].y, _680);
    float _684 = _672 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _686 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[7].z, _674);
    float _688 = log2(_670);
    float _690 = -_678;
    float _692 = fma(_690, (*spvDescriptorSet0.vp_c15)._m0[21].z, _682);
    float _694 = _650 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _696 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[7].w, _686);
    float _698 = _650 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _700 = fma(_692, -0.5, 0.5);
    float _702 = fma(_692, 0.5, 0.5);
    float _704 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[4].x, _694);
    float _706 = exp2(_676);
    float _708 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[5].x, _698);
    float _710 = _660 + 1.0;
    float _712 = fma(_702, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _714 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[4].z, _704);
    float _716 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[5].z, _708);
    float _718 = 1.0 / _696;
    float _720 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[4].w, _714);
    float _722 = _688 * 0.693147182464599609375;
    float _724 = _722 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _726 = sqrt(_700);
    float _728 = -_660;
    float _730 = fma(_706, _710, _728);
    float _732 = fma(_702, _712, -0.212114393711090087890625);
    float _734 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[5].w, _716);
    float _736 = fma(_730, 0.5, 0.5);
    float _738 = fma(_702, _732, 1.570728778839111328125);
    float _740 = _720 * _718;
    float _742 = _734 * _718;
    float _744 = fma(_740, 0.5, 0.5);
    float _746 = fma(_742, -0.5, 0.5);
    float _748 = _726 * 0.636619746685028076171875;
    float3 _2279 = float3(_744, _746, _724);
    float _750 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2279, float3(0.0), isnan(_2279)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2279, float3(0.0), isnan(_2279)), level(0.0)).x;
    float _752 = -_738;
    float _754 = fma(_748, _752, 1.0);
    float3 _2295 = float3(_744, _746, _724);
    float4 _757 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2295, float3(0.0), isnan(_2295)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2295, float3(0.0), isnan(_2295)), level(0.0)).xyzw;
    float _759 = _757.x;
    float _761 = _757.y;
    float _763 = _757.z;
    float _765 = _757.w;
    float2 _2312 = float2(_754, _736);
    float3 _769 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2312, float2(0.0), isnan(_2312)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2312, float2(0.0), isnan(_2312)), level(0.0)).xyz;
    float _771 = _769.x;
    float _773 = _769.y;
    float _775 = _769.z;
    float _777 = in.m_53.x;
    float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _781 = in.m_55.y;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _785 = _783 != 0;
    float _787 = _644 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _791 = _789 != 0;
    float _793 = in.m_53.w;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _797 = _795 != 0;
    float _799 = _650 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _803 = _801 != 0;
    float _805 = in.m_53.y;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _809 = exp2(_787);
    float _811 = in.m_55.x;
    float _813 = _779 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _815 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[6].x, _799);
    float _817 = 0.0;
    bool _819 = _797;
    float _821 = _813;
    if (_785)
    {
        float _823 = in.m_53.z;
        _817 = _823;
    }
    float _825 = _817;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _829 = _777 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _831 = false;
    if (_791)
    {
        bool _833 = _777 > 0.5;
        _831 = _833;
    }
    bool _835 = _831;
    out.m_57.x = _160;
    float _837 = -_807;
    float _839 = fma(_829, 2.0, _837);
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _843 = -_781;
    float _845 = _843 + 1.0;
    bool _847 = _793 > 0.5;
    float _849 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[78].z, _841);
    float _851 = in.m_59.x;
    float _853 = in.m_59.y;
    float _855 = in.m_59.z;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _859 = _805 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _861 = _847 ? as_type<int>(_845) : as_type<int>(_781);
    float _863 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _849);
    bool _865 = _805 > 0.5;
    float _867 = fma(_859, -2.0, _827);
    float _869 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[78].w, _857);
    float _871 = _797 ? as_type<float>(_861) : _781;
    int _873 = as_type<int>(_849);
    int _875 = as_type<int>(_867);
    float _877 = _781;
    float _879 = _845;
    if (_785)
    {
        float _881 = -_811;
        float _883 = _881 + 1.0;
        _873 = as_type<int>(_883);
    }
    int _885 = _873;
    float _887 = in.m_61.x;
    float _889 = in.m_61.y;
    float _891 = in.m_61.z;
    float _893 = in.m_61.w;
    bool _895 = _172 != 0.0;
    bool _897 = isnan(_172);
    bool _899 = _895 || _897;
    bool _901 = isnan(0.0);
    bool _903 = _899 || _901;
    float _905 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _867);
    float _907 = _905;
    if (_791)
    {
        float _909 = -_811;
        float _911 = _909 + 1.0;
        _875 = as_type<int>(_911);
    }
    int _913 = _875;
    float _915 = _825;
    float _917 = as_type<float>(_913);
    if (_785)
    {
        bool _919 = _825 > 0.5;
        _819 = _919;
    }
    bool _921 = _819;
    float _923 = -_136;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[76].x, _839);
    bool _927 = _160 == 0.0;
    bool _929 = !_903;
    bool _931 = _927 && _929;
    float _933 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _869);
    if (_803)
    {
        float _935 = _865 ? _845 : _781;
        _877 = _935;
    }
    float _937 = _877;
    float _939 = -_809;
    float _941 = _939 + 1.0;
    float _943 = _937;
    if (!_791)
    {
        _915 = _811;
    }
    float _945 = _915;
    out.m_63.x = _436;
    out.m_63.y = _434;
    out.m_63.z = _438;
    bool _947 = _174 == 0.0;
    bool _949 = _947 && _931;
    float _951 = fma(_813, _937, -0.5);
    float _953 = _945;
    if (!_785)
    {
        _879 = _811;
    }
    float _955 = _879;
    float _957 = _941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _959 = _955;
    if (_791)
    {
        float _961 = _835 ? as_type<float>(_913) : _811;
        _953 = _961;
    }
    float _963 = _953;
    float _965 = -_905;
    float _967 = fma(_933, _951, _965);
    if (_785)
    {
        float _969 = _921 ? as_type<float>(_885) : _811;
        _959 = _969;
    }
    float _971 = _959;
    float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _975 = _889 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _977 = 0.0;
    if (_949)
    {
        _977 = _851;
    }
    float _979 = _977;
    float _981 = _889 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _983 = 0.0;
    float _985 = _979;
    if (_949)
    {
        _983 = _853;
    }
    float _987 = _983;
    float _989 = fma(_887, (*spvDescriptorSet0.vp_c10)._m0[9].x, _975);
    float _991 = _987;
    if (_949)
    {
        _907 = _855;
    }
    float _993 = _907;
    float _995 = fma(_887, (*spvDescriptorSet0.vp_c10)._m0[10].x, _981);
    float _997 = _993;
    if (_949)
    {
        _917 = _979;
    }
    float _999 = _917;
    out.m_45.x = 1.0;
    float _1001 = _999;
    if (!_949)
    {
        _985 = _851;
    }
    float _1003 = _985;
    if (_949)
    {
        _821 = _987;
    }
    float _1005 = _821;
    float _1007 = _973 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1009 = _1005;
    if (!_949)
    {
        _991 = _853;
    }
    float _1011 = _991;
    float _1013 = _889 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_949)
    {
        _943 = _993;
    }
    float _1015 = _943;
    float _1017 = fma(_1007, _963, -0.5);
    float _1019 = _1015;
    if (!_949)
    {
        _997 = _855;
    }
    float _1021 = _997;
    float _1023 = _891 * _1003;
    float _1025 = fma(_887, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1013);
    if (!_949)
    {
        float _1027 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1011);
        _1009 = _1027;
    }
    float _1029 = _1009;
    float _1031 = fma(_863, _1017, _925);
    if (!_949)
    {
        float _1033 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1021);
        _1019 = _1033;
    }
    float _1035 = _1019;
    float _1037 = _889 * _1021;
    float _1039 = -_1023;
    float _1041 = fma(_887, _1021, _1039);
    float _1043 = fma(_891, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1025);
    float _1045 = fma(_891, (*spvDescriptorSet0.vp_c10)._m0[9].z, _989);
    float _1047 = fma(_891, (*spvDescriptorSet0.vp_c10)._m0[10].z, _995);
    float _1049 = _887 * _1011;
    float _1051 = -_1037;
    float _1053 = fma(_891, _1011, _1051);
    float _1055 = _1041 * _893;
    if (!_949)
    {
        float _1057 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1003);
        _1001 = _1057;
    }
    float _1059 = _1001;
    float _1061 = -_1049;
    float _1063 = fma(_889, _1003, _1061);
    float _1065 = _1053 * _893;
    float _1067 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    out.m_65.x = _1043;
    out.m_65.y = _1045;
    out.m_65.z = _1047;
    float _1069 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1071 = _1063 * _893;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1075 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1067);
    float _1077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1079 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1081 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_67.w = _1073;
    float _1083 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[6].z, _815);
    float _1085 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1079);
    float _1087 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1089 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1091 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1081);
    float _1093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1095 = fma(_1059, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1087);
    float _1097 = fma(_1059, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1089);
    float _1099 = fma(_1059, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1069);
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1103 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1095);
    float _1105 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1097);
    float _1107 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1099);
    float _1109 = _1031 + 0.5;
    float _1111 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1083);
    float _1113 = _967 + 0.5;
    out.m_69.w = _1101;
    float _1115 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1075);
    float _1117 = _696 * 0.5;
    float _1119 = _871 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_71.x = _1103;
    out.m_71.y = _1105;
    out.m_71.z = _1107;
    float _1121 = _971 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1123 = _1111 + _696;
    float _1125 = _720 + _696;
    float _1127 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1091);
    float _1129 = fma(_734, -0.5, _1117);
    float _1131 = _1119 * _1077;
    float _1133 = _1121 * _1093;
    float _1135 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1085);
    float _1137 = _1123 * 0.5;
    float _1139 = _1125 * 0.5;
    float _1141 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _1109;
    out.m_73.y = _1113;
    out.m_73.z = _1133;
    out.m_73.w = _1131;
    out.m_75.x = _1115;
    out.m_75.y = _1135;
    out.m_75.z = _1127;
    out.gl_Position.x = _720;
    out.gl_Position.y = _734;
    out.gl_Position.z = _1111;
    out.gl_Position.w = _696;
    out.m_77.x = _1139;
    out.m_77.y = _1129;
    out.m_77.z = _1137;
    out.m_77.w = _696;
    out.m_79.w = _1141;
    float _1143 = _957 * _750;
    float _1145 = -_957;
    float _1147 = _1145 + 1.0;
    float _1149 = _765 * _1143;
    float _1151 = _765 * _1147;
    float _1153 = _775 * _1143;
    float _1155 = fma(_771, _1149, _759);
    float _1157 = fma(_773, _1149, _761);
    float _1159 = fma(_765, _1153, _763);
    out.m_81.x = _1155;
    out.m_81.y = _1157;
    out.m_81.z = _1159;
    out.m_81.w = _1151;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _108 = as_type<float>(_100);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    float _112 = _110;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1217 = as_type<float>(_118);
        out.gl_Position.z = _1217;
    }
    if (!_104)
    {
        return out;
    }
    float _122 = in.m_47.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = 0.0;
    if (_132)
    {
        float _140 = float(_100);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    if (_148)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _108;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _120 = as_type<int>(_152);
    }
    int _154 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1285 = as_type<float>(_154);
        out.gl_Position.z = _1285;
    }
    if (_148)
    {
        return out;
    }
    float _156 = in.m_49.w;
    float _158 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _160 = in.m_51.x;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_51.y;
    float _174 = in.m_51.z;
    float _176 = in.m_47.x;
    float _178 = in.m_47.y;
    float _180 = in.m_47.z;
    float _182 = _158;
    if (!_170)
    {
        float _184 = _158 * _158;
        float _186 = _184 * 0.5;
        _138 = _186;
    }
    float _188 = _138;
    float _190 = in.m_42.x;
    float _192 = in.m_42.y;
    float _194 = in.m_42.z;
    float _196 = _188;
    if (!_170)
    {
        float _198 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    float _202 = in.m_49.x;
    float _204 = in.m_49.y;
    float _206 = in.m_49.z;
    bool _208 = !_170;
    float _210 = _200;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _158 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _158);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_170;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _158 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _182 = _264;
    }
    float _266 = _182;
    float _268 = _202 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = _204 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _160);
    float _274 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _172);
    float _276 = _268 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _278 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _270 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _282 = _206 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = _272 * _276;
    float _286 = fma(_266, _178, _278);
    float _288 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _290 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _292 = _274 * _280;
    float _294 = fma(_286, _156, _192);
    float _296 = fma(_266, _176, _288);
    float _298 = fma(_266, _180, _290);
    float _300 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _174);
    float _302 = _282 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _304 = fma(_296, _156, _190);
    float _306 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _308 = fma(_298, _156, _194);
    float _310 = _292 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _312 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _314 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[6].x, _306);
    float _316 = _300 * _302;
    float _318 = _292 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _320 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[10].x, _310);
    float _322 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[4].x, _312);
    float _324 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].z, _314);
    float _326 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[8].x, _318);
    float _328 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[10].z, _320);
    float _330 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].z, _322);
    float _332 = _324 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _334 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[8].z, _326);
    float _336 = _292 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _338 = _330 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _340 = _328 + _332;
    float _342 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[9].x, _336);
    float _344 = _334 + _338;
    float _346 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _348 = _340 + _346;
    float _350 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[9].z, _342);
    float _352 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _354 = _344 + _352;
    float _356 = _348 * _348;
    float _358 = fma(_354, _354, _356);
    float _360 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _362 = sqrt(_358);
    float _364 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[5].x, _360);
    float _366 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].z, _364);
    float _368 = _366 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _370 = _350 + _368;
    bool _372 = _362 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _374 = _368;
    float _376 = _344;
    float _378 = _350;
    float _380 = _358;
    float _382 = _284;
    if (!_372)
    {
        _374 = _344;
    }
    float _384 = _374;
    float _386 = _384;
    if (!_372)
    {
        _376 = _340;
    }
    float _388 = _376;
    float _390 = _388;
    if (!_372)
    {
        _378 = _370;
    }
    float _392 = _378;
    bool _394 = !_372;
    float _396 = _392;
    if (!_394)
    {
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _400 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _402 = _362 + _400;
        float _404 = rsqrt(_358);
        float _406 = _402 * _398;
        float _408 = _370 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _410 = _406 * 0.15915493667125701904296875;
        float _412 = _410 * 6.283185482025146484375;
        float _414 = cos(_412);
        float _416 = _410 * 6.283185482025146484375;
        float _418 = sin(_416);
        float _420 = _414 + (-1.0);
        float _422 = _420 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _424 = fma(_418, _408, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _426 = fma(_370, _414, _422);
        float _428 = _404 * _424;
        float _430 = fma(_354, _428, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _432 = fma(_348, _428, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _396 = _426;
        _386 = _430;
        _390 = _432;
    }
    float _434 = _396;
    float _436 = _386;
    float _438 = _390;
    float _440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _442 = _434 + _440;
    float _444 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _446 = _436 + _444;
    float _448 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _450 = _438 + _448;
    float _452 = _442 * _442;
    float _454 = fma(_446, _446, _452);
    float _456 = fma(_450, _450, _454);
    float _458 = rsqrt(_456);
    float _460 = sqrt(_456);
    float _462 = _458 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _464 = _446 * _462;
    float _466 = _450 * _462;
    float _468 = _464 * _464;
    float _470 = _466 * _466;
    float _472 = _468 + _470;
    float _474 = sqrt(_472);
    bool _476 = _474 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _478 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _480 = _474 + _478;
    float _482 = _450;
    float _484 = _472;
    float _486 = _480;
    float _488 = _442;
    if (_476)
    {
        float _490 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _482 = _490;
    }
    float _492 = _482;
    if (_476)
    {
        float _494 = rsqrt(_472);
        _484 = _494;
    }
    float _496 = _484;
    float _498 = _496;
    if (_476)
    {
        float _500 = _480 * _492;
        _486 = _500;
    }
    float _502 = _486;
    if (_476)
    {
        float _504 = _502 * 0.15915493667125701904296875;
        _380 = _504;
    }
    float _506 = _380;
    float _508 = _492;
    float _510 = _506;
    if (_476)
    {
        float _512 = _506 * 6.283185482025146484375;
        float _514 = sin(_512);
        _508 = _514;
    }
    float _516 = _508;
    float _518 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _520 = precise::max(0.0, _518);
    float _522 = _452;
    float _524 = _520;
    if (_476)
    {
        float _526 = _506 * 6.283185482025146484375;
        float _528 = cos(_526);
        _522 = _528;
    }
    float _530 = _522;
    float _532 = -_462;
    float _534 = -_520;
    float _536 = fma(_442, _532, _534);
    if (_476)
    {
        float _538 = _536 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _524 = _538;
    }
    float _540 = _524;
    float _542 = _516;
    float _544 = _540;
    if (_476)
    {
        float _546 = fma(_516, _540, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _488 = _546;
    }
    float _548 = _488;
    float _550 = _548;
    if (!_476)
    {
        _542 = _464;
    }
    float _552 = _542;
    float _554 = _552;
    float _556 = _530;
    if (_476)
    {
        float _558 = _530 + (-1.0);
        _544 = _558;
    }
    float _560 = _544;
    float _562 = _560;
    if (_476)
    {
        float _564 = _496 * _548;
        _382 = _564;
    }
    float _566 = _382;
    if (!_476)
    {
        _550 = _536;
    }
    float _568 = _550;
    float _570 = _568;
    if (_476)
    {
        float _572 = _560 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _510 = _572;
    }
    float _574 = _510;
    if (_476)
    {
        float _576 = _464 * _566;
        _554 = _576;
    }
    float _578 = _554;
    if (!_476)
    {
        _562 = _466;
    }
    float _580 = _562;
    float _582 = _580;
    if (_476)
    {
        float _584 = _466 * _566;
        _582 = _584;
    }
    float _586 = _582;
    if (!_476)
    {
        _498 = _468;
    }
    float _588 = _498;
    float _590 = _588;
    if (_476)
    {
        float _592 = fma(_536, _530, _574);
        _570 = _592;
    }
    float _594 = _570;
    if (_476)
    {
        float _596 = _578 * _578;
        _590 = _596;
    }
    float _598 = _590;
    if (!_476)
    {
        _556 = _470;
    }
    float _600 = _556;
    float _602 = _600;
    if (_476)
    {
        float _604 = _586 * _586;
        _602 = _604;
    }
    float _606 = _602;
    float _608 = fma(_594, _594, _598);
    float _610 = _434 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _612 = _608 + _606;
    float _614 = _434 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _616 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _618 = fma(_460, (*spvDescriptorSet0.vp_c15)._m0[23].w, _616);
    float _620 = precise::clamp(_618, 0.0, 1.0);
    float _622 = _434 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _624 = rsqrt(_612);
    float _626 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[2].x, _614);
    float _628 = -_620;
    float _630 = _628 + 1.0;
    float _632 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[1].x, _622);
    float _634 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _636 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[2].z, _626);
    float _638 = _434 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _640 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[1].z, _632);
    float _642 = abs(_630);
    float _644 = log2(_642);
    float _646 = _636 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _648 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[0].x, _638);
    float _650 = _640 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _652 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[3].x, _610);
    float _654 = _646 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _656 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[0].z, _648);
    float _658 = _624 * _578;
    float _660 = _624 * _594;
    float _662 = _656 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _664 = _650 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _666 = _658 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _668 = -_654;
    float _670 = fma(_668, _634, 1.0);
    float _672 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[3].z, _652);
    float _674 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[7].x, _664);
    float _676 = _644 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _678 = _624 * _586;
    float _680 = -_666;
    float _682 = fma(_660, (*spvDescriptorSet0.vp_c15)._m0[21].y, _680);
    float _684 = _672 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _686 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[7].z, _674);
    float _688 = log2(_670);
    float _690 = -_678;
    float _692 = fma(_690, (*spvDescriptorSet0.vp_c15)._m0[21].z, _682);
    float _694 = _650 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _696 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[7].w, _686);
    float _698 = _650 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _700 = fma(_692, -0.5, 0.5);
    float _702 = fma(_692, 0.5, 0.5);
    float _704 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[4].x, _694);
    float _706 = exp2(_676);
    float _708 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[5].x, _698);
    float _710 = _660 + 1.0;
    float _712 = fma(_702, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _714 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[4].z, _704);
    float _716 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[5].z, _708);
    float _718 = 1.0 / _696;
    float _720 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[4].w, _714);
    float _722 = _688 * 0.693147182464599609375;
    float _724 = _722 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _726 = sqrt(_700);
    float _728 = -_660;
    float _730 = fma(_706, _710, _728);
    float _732 = fma(_702, _712, -0.212114393711090087890625);
    float _734 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[5].w, _716);
    float _736 = fma(_730, 0.5, 0.5);
    float _738 = fma(_702, _732, 1.570728778839111328125);
    float _740 = _720 * _718;
    float _742 = _734 * _718;
    float _744 = fma(_740, 0.5, 0.5);
    float _746 = fma(_742, -0.5, 0.5);
    float _748 = _726 * 0.636619746685028076171875;
    float3 _2279 = float3(_744, _746, _724);
    float _750 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2279, float3(0.0), isnan(_2279)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2279, float3(0.0), isnan(_2279)), level(0.0)).x;
    float _752 = -_738;
    float _754 = fma(_748, _752, 1.0);
    float3 _2295 = float3(_744, _746, _724);
    float4 _757 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2295, float3(0.0), isnan(_2295)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2295, float3(0.0), isnan(_2295)), level(0.0)).xyzw;
    float _759 = _757.x;
    float _761 = _757.y;
    float _763 = _757.z;
    float _765 = _757.w;
    float2 _2312 = float2(_754, _736);
    float3 _769 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2312, float2(0.0), isnan(_2312)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2312, float2(0.0), isnan(_2312)), level(0.0)).xyz;
    float _771 = _769.x;
    float _773 = _769.y;
    float _775 = _769.z;
    float _777 = in.m_53.x;
    float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _781 = in.m_55.y;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _785 = _783 != 0;
    float _787 = _644 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _791 = _789 != 0;
    float _793 = in.m_53.w;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _797 = _795 != 0;
    float _799 = _650 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _803 = _801 != 0;
    float _805 = in.m_53.y;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _809 = exp2(_787);
    float _811 = in.m_55.x;
    float _813 = _779 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _815 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[6].x, _799);
    float _817 = 0.0;
    bool _819 = _797;
    float _821 = _813;
    if (_785)
    {
        float _823 = in.m_53.z;
        _817 = _823;
    }
    float _825 = _817;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _829 = _777 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _831 = false;
    if (_791)
    {
        bool _833 = _777 > 0.5;
        _831 = _833;
    }
    bool _835 = _831;
    out.m_57.x = _160;
    float _837 = -_807;
    float _839 = fma(_829, 2.0, _837);
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _843 = -_781;
    float _845 = _843 + 1.0;
    bool _847 = _793 > 0.5;
    float _849 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[78].z, _841);
    float _851 = in.m_59.x;
    float _853 = in.m_59.y;
    float _855 = in.m_59.z;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _859 = _805 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _861 = _847 ? as_type<int>(_845) : as_type<int>(_781);
    float _863 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _849);
    bool _865 = _805 > 0.5;
    float _867 = fma(_859, -2.0, _827);
    float _869 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[78].w, _857);
    float _871 = _797 ? as_type<float>(_861) : _781;
    int _873 = as_type<int>(_849);
    int _875 = as_type<int>(_867);
    float _877 = _781;
    float _879 = _845;
    if (_785)
    {
        float _881 = -_811;
        float _883 = _881 + 1.0;
        _873 = as_type<int>(_883);
    }
    int _885 = _873;
    float _887 = in.m_61.x;
    float _889 = in.m_61.y;
    float _891 = in.m_61.z;
    float _893 = in.m_61.w;
    bool _895 = _172 != 0.0;
    bool _897 = isnan(_172);
    bool _899 = _895 || _897;
    bool _901 = isnan(0.0);
    bool _903 = _899 || _901;
    float _905 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _867);
    float _907 = _905;
    if (_791)
    {
        float _909 = -_811;
        float _911 = _909 + 1.0;
        _875 = as_type<int>(_911);
    }
    int _913 = _875;
    float _915 = _825;
    float _917 = as_type<float>(_913);
    if (_785)
    {
        bool _919 = _825 > 0.5;
        _819 = _919;
    }
    bool _921 = _819;
    float _923 = -_136;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[76].x, _839);
    bool _927 = _160 == 0.0;
    bool _929 = !_903;
    bool _931 = _927 && _929;
    float _933 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _869);
    if (_803)
    {
        float _935 = _865 ? _845 : _781;
        _877 = _935;
    }
    float _937 = _877;
    float _939 = -_809;
    float _941 = _939 + 1.0;
    float _943 = _937;
    if (!_791)
    {
        _915 = _811;
    }
    float _945 = _915;
    out.m_63.x = _436;
    out.m_63.y = _434;
    out.m_63.z = _438;
    bool _947 = _174 == 0.0;
    bool _949 = _947 && _931;
    float _951 = fma(_813, _937, -0.5);
    float _953 = _945;
    if (!_785)
    {
        _879 = _811;
    }
    float _955 = _879;
    float _957 = _941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _959 = _955;
    if (_791)
    {
        float _961 = _835 ? as_type<float>(_913) : _811;
        _953 = _961;
    }
    float _963 = _953;
    float _965 = -_905;
    float _967 = fma(_933, _951, _965);
    if (_785)
    {
        float _969 = _921 ? as_type<float>(_885) : _811;
        _959 = _969;
    }
    float _971 = _959;
    float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _975 = _889 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _977 = 0.0;
    if (_949)
    {
        _977 = _851;
    }
    float _979 = _977;
    float _981 = _889 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _983 = 0.0;
    float _985 = _979;
    if (_949)
    {
        _983 = _853;
    }
    float _987 = _983;
    float _989 = fma(_887, (*spvDescriptorSet0.vp_c10)._m0[9].x, _975);
    float _991 = _987;
    if (_949)
    {
        _907 = _855;
    }
    float _993 = _907;
    float _995 = fma(_887, (*spvDescriptorSet0.vp_c10)._m0[10].x, _981);
    float _997 = _993;
    if (_949)
    {
        _917 = _979;
    }
    float _999 = _917;
    out.m_45.x = 1.0;
    float _1001 = _999;
    if (!_949)
    {
        _985 = _851;
    }
    float _1003 = _985;
    if (_949)
    {
        _821 = _987;
    }
    float _1005 = _821;
    float _1007 = _973 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1009 = _1005;
    if (!_949)
    {
        _991 = _853;
    }
    float _1011 = _991;
    float _1013 = _889 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_949)
    {
        _943 = _993;
    }
    float _1015 = _943;
    float _1017 = fma(_1007, _963, -0.5);
    float _1019 = _1015;
    if (!_949)
    {
        _997 = _855;
    }
    float _1021 = _997;
    float _1023 = _891 * _1003;
    float _1025 = fma(_887, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1013);
    if (!_949)
    {
        float _1027 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1011);
        _1009 = _1027;
    }
    float _1029 = _1009;
    float _1031 = fma(_863, _1017, _925);
    if (!_949)
    {
        float _1033 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1021);
        _1019 = _1033;
    }
    float _1035 = _1019;
    float _1037 = _889 * _1021;
    float _1039 = -_1023;
    float _1041 = fma(_887, _1021, _1039);
    float _1043 = fma(_891, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1025);
    float _1045 = fma(_891, (*spvDescriptorSet0.vp_c10)._m0[9].z, _989);
    float _1047 = fma(_891, (*spvDescriptorSet0.vp_c10)._m0[10].z, _995);
    float _1049 = _887 * _1011;
    float _1051 = -_1037;
    float _1053 = fma(_891, _1011, _1051);
    float _1055 = _1041 * _893;
    if (!_949)
    {
        float _1057 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1003);
        _1001 = _1057;
    }
    float _1059 = _1001;
    float _1061 = -_1049;
    float _1063 = fma(_889, _1003, _1061);
    float _1065 = _1053 * _893;
    float _1067 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    out.m_65.x = _1043;
    out.m_65.y = _1045;
    out.m_65.z = _1047;
    float _1069 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1071 = _1063 * _893;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1075 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1067);
    float _1077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1079 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1081 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_67.w = _1073;
    float _1083 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[6].z, _815);
    float _1085 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1079);
    float _1087 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1089 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1091 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1081);
    float _1093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1095 = fma(_1059, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1087);
    float _1097 = fma(_1059, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1089);
    float _1099 = fma(_1059, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1069);
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1103 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1095);
    float _1105 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1097);
    float _1107 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1099);
    float _1109 = _1031 + 0.5;
    float _1111 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1083);
    float _1113 = _967 + 0.5;
    out.m_69.w = _1101;
    float _1115 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1075);
    float _1117 = _696 * 0.5;
    float _1119 = _871 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_71.x = _1103;
    out.m_71.y = _1105;
    out.m_71.z = _1107;
    float _1121 = _971 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1123 = _1111 + _696;
    float _1125 = _720 + _696;
    float _1127 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1091);
    float _1129 = fma(_734, -0.5, _1117);
    float _1131 = _1119 * _1077;
    float _1133 = _1121 * _1093;
    float _1135 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1085);
    float _1137 = _1123 * 0.5;
    float _1139 = _1125 * 0.5;
    float _1141 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _1109;
    out.m_73.y = _1113;
    out.m_73.z = _1133;
    out.m_73.w = _1131;
    out.m_75.x = _1115;
    out.m_75.y = _1135;
    out.m_75.z = _1127;
    out.gl_Position.x = _720;
    out.gl_Position.y = _734;
    out.gl_Position.z = _1111;
    out.gl_Position.w = _696;
    out.m_77.x = _1139;
    out.m_77.y = _1129;
    out.m_77.z = _1137;
    out.m_77.w = _696;
    out.m_79.w = _1141;
    float _1143 = _957 * _750;
    float _1145 = -_957;
    float _1147 = _1145 + 1.0;
    float _1149 = _765 * _1143;
    float _1151 = _765 * _1147;
    float _1153 = _775 * _1143;
    float _1155 = fma(_771, _1149, _759);
    float _1157 = fma(_773, _1149, _761);
    float _1159 = fma(_765, _1153, _763);
    out.m_81.x = _1155;
    out.m_81.y = _1157;
    out.m_81.z = _1159;
    out.m_81.w = _1151;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _108 = as_type<float>(_100);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    float _112 = _110;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1217 = as_type<float>(_118);
        out.gl_Position.z = _1217;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_47.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = 0.0;
    if (_132)
    {
        float _140 = float(_100);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    if (_148)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _108;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _120 = as_type<int>(_152);
    }
    int _154 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1285 = as_type<float>(_154);
        out.gl_Position.z = _1285;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _156 = in.m_49.w;
    float _158 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _160 = in.m_51.x;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_51.y;
    float _174 = in.m_51.z;
    float _176 = in.m_47.x;
    float _178 = in.m_47.y;
    float _180 = in.m_47.z;
    float _182 = _158;
    if (!_170)
    {
        float _184 = _158 * _158;
        float _186 = _184 * 0.5;
        _138 = _186;
    }
    float _188 = _138;
    float _190 = in.m_42.x;
    float _192 = in.m_42.y;
    float _194 = in.m_42.z;
    float _196 = _188;
    if (!_170)
    {
        float _198 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    float _202 = in.m_49.x;
    float _204 = in.m_49.y;
    float _206 = in.m_49.z;
    bool _208 = !_170;
    float _210 = _200;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _158 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _158);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_170;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _158 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _182 = _264;
    }
    float _266 = _182;
    float _268 = _202 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = _204 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _160);
    float _274 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _172);
    float _276 = _268 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _278 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _270 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _282 = _206 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = _272 * _276;
    float _286 = fma(_266, _178, _278);
    float _288 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _290 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _292 = _274 * _280;
    float _294 = fma(_286, _156, _192);
    float _296 = fma(_266, _176, _288);
    float _298 = fma(_266, _180, _290);
    float _300 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _174);
    float _302 = _282 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _304 = fma(_296, _156, _190);
    float _306 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _308 = fma(_298, _156, _194);
    float _310 = _292 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _312 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _314 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[6].x, _306);
    float _316 = _300 * _302;
    float _318 = _292 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _320 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[10].x, _310);
    float _322 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[4].x, _312);
    float _324 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].z, _314);
    float _326 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[8].x, _318);
    float _328 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[10].z, _320);
    float _330 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].z, _322);
    float _332 = _324 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _334 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[8].z, _326);
    float _336 = _292 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _338 = _330 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _340 = _328 + _332;
    float _342 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[9].x, _336);
    float _344 = _334 + _338;
    float _346 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _348 = _340 + _346;
    float _350 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[9].z, _342);
    float _352 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _354 = _344 + _352;
    float _356 = _348 * _348;
    float _358 = fma(_354, _354, _356);
    float _360 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _362 = sqrt(_358);
    float _364 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[5].x, _360);
    float _366 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].z, _364);
    float _368 = _366 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _370 = _350 + _368;
    bool _372 = _362 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _374 = _368;
    float _376 = _344;
    float _378 = _350;
    float _380 = _358;
    float _382 = _284;
    if (!_372)
    {
        _374 = _344;
    }
    float _384 = _374;
    float _386 = _384;
    if (!_372)
    {
        _376 = _340;
    }
    float _388 = _376;
    float _390 = _388;
    if (!_372)
    {
        _378 = _370;
    }
    float _392 = _378;
    bool _394 = !_372;
    float _396 = _392;
    if (!_394)
    {
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _400 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _402 = _362 + _400;
        float _404 = rsqrt(_358);
        float _406 = _402 * _398;
        float _408 = _370 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _410 = _406 * 0.15915493667125701904296875;
        float _412 = _410 * 6.283185482025146484375;
        float _414 = cos(_412);
        float _416 = _410 * 6.283185482025146484375;
        float _418 = sin(_416);
        float _420 = _414 + (-1.0);
        float _422 = _420 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _424 = fma(_418, _408, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _426 = fma(_370, _414, _422);
        float _428 = _404 * _424;
        float _430 = fma(_354, _428, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _432 = fma(_348, _428, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _396 = _426;
        _386 = _430;
        _390 = _432;
    }
    float _434 = _396;
    float _436 = _386;
    float _438 = _390;
    float _440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _442 = _434 + _440;
    float _444 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _446 = _436 + _444;
    float _448 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _450 = _438 + _448;
    float _452 = _442 * _442;
    float _454 = fma(_446, _446, _452);
    float _456 = fma(_450, _450, _454);
    float _458 = rsqrt(_456);
    float _460 = sqrt(_456);
    float _462 = _458 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _464 = _446 * _462;
    float _466 = _450 * _462;
    float _468 = _464 * _464;
    float _470 = _466 * _466;
    float _472 = _468 + _470;
    float _474 = sqrt(_472);
    bool _476 = _474 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _478 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _480 = _474 + _478;
    float _482 = _450;
    float _484 = _472;
    float _486 = _480;
    float _488 = _442;
    if (_476)
    {
        float _490 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _482 = _490;
    }
    float _492 = _482;
    if (_476)
    {
        float _494 = rsqrt(_472);
        _484 = _494;
    }
    float _496 = _484;
    float _498 = _496;
    if (_476)
    {
        float _500 = _480 * _492;
        _486 = _500;
    }
    float _502 = _486;
    if (_476)
    {
        float _504 = _502 * 0.15915493667125701904296875;
        _380 = _504;
    }
    float _506 = _380;
    float _508 = _492;
    float _510 = _506;
    if (_476)
    {
        float _512 = _506 * 6.283185482025146484375;
        float _514 = sin(_512);
        _508 = _514;
    }
    float _516 = _508;
    float _518 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _520 = precise::max(0.0, _518);
    float _522 = _452;
    float _524 = _520;
    if (_476)
    {
        float _526 = _506 * 6.283185482025146484375;
        float _528 = cos(_526);
        _522 = _528;
    }
    float _530 = _522;
    float _532 = -_462;
    float _534 = -_520;
    float _536 = fma(_442, _532, _534);
    if (_476)
    {
        float _538 = _536 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _524 = _538;
    }
    float _540 = _524;
    float _542 = _516;
    float _544 = _540;
    if (_476)
    {
        float _546 = fma(_516, _540, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _488 = _546;
    }
    float _548 = _488;
    float _550 = _548;
    if (!_476)
    {
        _542 = _464;
    }
    float _552 = _542;
    float _554 = _552;
    float _556 = _530;
    if (_476)
    {
        float _558 = _530 + (-1.0);
        _544 = _558;
    }
    float _560 = _544;
    float _562 = _560;
    if (_476)
    {
        float _564 = _496 * _548;
        _382 = _564;
    }
    float _566 = _382;
    if (!_476)
    {
        _550 = _536;
    }
    float _568 = _550;
    float _570 = _568;
    if (_476)
    {
        float _572 = _560 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _510 = _572;
    }
    float _574 = _510;
    if (_476)
    {
        float _576 = _464 * _566;
        _554 = _576;
    }
    float _578 = _554;
    if (!_476)
    {
        _562 = _466;
    }
    float _580 = _562;
    float _582 = _580;
    if (_476)
    {
        float _584 = _466 * _566;
        _582 = _584;
    }
    float _586 = _582;
    if (!_476)
    {
        _498 = _468;
    }
    float _588 = _498;
    float _590 = _588;
    if (_476)
    {
        float _592 = fma(_536, _530, _574);
        _570 = _592;
    }
    float _594 = _570;
    if (_476)
    {
        float _596 = _578 * _578;
        _590 = _596;
    }
    float _598 = _590;
    if (!_476)
    {
        _556 = _470;
    }
    float _600 = _556;
    float _602 = _600;
    if (_476)
    {
        float _604 = _586 * _586;
        _602 = _604;
    }
    float _606 = _602;
    float _608 = fma(_594, _594, _598);
    float _610 = _434 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _612 = _608 + _606;
    float _614 = _434 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _616 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _618 = fma(_460, (*spvDescriptorSet0.vp_c15)._m0[23].w, _616);
    float _620 = precise::clamp(_618, 0.0, 1.0);
    float _622 = _434 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _624 = rsqrt(_612);
    float _626 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[2].x, _614);
    float _628 = -_620;
    float _630 = _628 + 1.0;
    float _632 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[1].x, _622);
    float _634 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _636 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[2].z, _626);
    float _638 = _434 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _640 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[1].z, _632);
    float _642 = abs(_630);
    float _644 = log2(_642);
    float _646 = _636 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _648 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[0].x, _638);
    float _650 = _640 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _652 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[3].x, _610);
    float _654 = _646 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _656 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[0].z, _648);
    float _658 = _624 * _578;
    float _660 = _624 * _594;
    float _662 = _656 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _664 = _650 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _666 = _658 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _668 = -_654;
    float _670 = fma(_668, _634, 1.0);
    float _672 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[3].z, _652);
    float _674 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[7].x, _664);
    float _676 = _644 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _678 = _624 * _586;
    float _680 = -_666;
    float _682 = fma(_660, (*spvDescriptorSet0.vp_c15)._m0[21].y, _680);
    float _684 = _672 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _686 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[7].z, _674);
    float _688 = log2(_670);
    float _690 = -_678;
    float _692 = fma(_690, (*spvDescriptorSet0.vp_c15)._m0[21].z, _682);
    float _694 = _650 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _696 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[7].w, _686);
    float _698 = _650 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _700 = fma(_692, -0.5, 0.5);
    float _702 = fma(_692, 0.5, 0.5);
    float _704 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[4].x, _694);
    float _706 = exp2(_676);
    float _708 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[5].x, _698);
    float _710 = _660 + 1.0;
    float _712 = fma(_702, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _714 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[4].z, _704);
    float _716 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[5].z, _708);
    float _718 = 1.0 / _696;
    float _720 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[4].w, _714);
    float _722 = _688 * 0.693147182464599609375;
    float _724 = _722 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _726 = sqrt(_700);
    float _728 = -_660;
    float _730 = fma(_706, _710, _728);
    float _732 = fma(_702, _712, -0.212114393711090087890625);
    float _734 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[5].w, _716);
    float _736 = fma(_730, 0.5, 0.5);
    float _738 = fma(_702, _732, 1.570728778839111328125);
    float _740 = _720 * _718;
    float _742 = _734 * _718;
    float _744 = fma(_740, 0.5, 0.5);
    float _746 = fma(_742, -0.5, 0.5);
    float _748 = _726 * 0.636619746685028076171875;
    float3 _2279 = float3(_744, _746, _724);
    float _750 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2279, float3(0.0), isnan(_2279)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2279, float3(0.0), isnan(_2279)), level(0.0)).x;
    float _752 = -_738;
    float _754 = fma(_748, _752, 1.0);
    float3 _2295 = float3(_744, _746, _724);
    float4 _757 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2295, float3(0.0), isnan(_2295)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2295, float3(0.0), isnan(_2295)), level(0.0)).xyzw;
    float _759 = _757.x;
    float _761 = _757.y;
    float _763 = _757.z;
    float _765 = _757.w;
    float2 _2312 = float2(_754, _736);
    float3 _769 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2312, float2(0.0), isnan(_2312)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2312, float2(0.0), isnan(_2312)), level(0.0)).xyz;
    float _771 = _769.x;
    float _773 = _769.y;
    float _775 = _769.z;
    float _777 = in.m_53.x;
    float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _781 = in.m_55.y;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _785 = _783 != 0;
    float _787 = _644 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _791 = _789 != 0;
    float _793 = in.m_53.w;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _797 = _795 != 0;
    float _799 = _650 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _803 = _801 != 0;
    float _805 = in.m_53.y;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _809 = exp2(_787);
    float _811 = in.m_55.x;
    float _813 = _779 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _815 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[6].x, _799);
    float _817 = 0.0;
    bool _819 = _797;
    float _821 = _813;
    if (_785)
    {
        float _823 = in.m_53.z;
        _817 = _823;
    }
    float _825 = _817;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _829 = _777 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _831 = false;
    if (_791)
    {
        bool _833 = _777 > 0.5;
        _831 = _833;
    }
    bool _835 = _831;
    out.m_57.x = _160;
    float _837 = -_807;
    float _839 = fma(_829, 2.0, _837);
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _843 = -_781;
    float _845 = _843 + 1.0;
    bool _847 = _793 > 0.5;
    float _849 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[78].z, _841);
    float _851 = in.m_59.x;
    float _853 = in.m_59.y;
    float _855 = in.m_59.z;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _859 = _805 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _861 = _847 ? as_type<int>(_845) : as_type<int>(_781);
    float _863 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _849);
    bool _865 = _805 > 0.5;
    float _867 = fma(_859, -2.0, _827);
    float _869 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[78].w, _857);
    float _871 = _797 ? as_type<float>(_861) : _781;
    int _873 = as_type<int>(_849);
    int _875 = as_type<int>(_867);
    float _877 = _781;
    float _879 = _845;
    if (_785)
    {
        float _881 = -_811;
        float _883 = _881 + 1.0;
        _873 = as_type<int>(_883);
    }
    int _885 = _873;
    float _887 = in.m_61.x;
    float _889 = in.m_61.y;
    float _891 = in.m_61.z;
    float _893 = in.m_61.w;
    bool _895 = _172 != 0.0;
    bool _897 = isnan(_172);
    bool _899 = _895 || _897;
    bool _901 = isnan(0.0);
    bool _903 = _899 || _901;
    float _905 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _867);
    float _907 = _905;
    if (_791)
    {
        float _909 = -_811;
        float _911 = _909 + 1.0;
        _875 = as_type<int>(_911);
    }
    int _913 = _875;
    float _915 = _825;
    float _917 = as_type<float>(_913);
    if (_785)
    {
        bool _919 = _825 > 0.5;
        _819 = _919;
    }
    bool _921 = _819;
    float _923 = -_136;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[76].x, _839);
    bool _927 = _160 == 0.0;
    bool _929 = !_903;
    bool _931 = _927 && _929;
    float _933 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _869);
    if (_803)
    {
        float _935 = _865 ? _845 : _781;
        _877 = _935;
    }
    float _937 = _877;
    float _939 = -_809;
    float _941 = _939 + 1.0;
    float _943 = _937;
    if (!_791)
    {
        _915 = _811;
    }
    float _945 = _915;
    out.m_63.x = _436;
    out.m_63.y = _434;
    out.m_63.z = _438;
    bool _947 = _174 == 0.0;
    bool _949 = _947 && _931;
    float _951 = fma(_813, _937, -0.5);
    float _953 = _945;
    if (!_785)
    {
        _879 = _811;
    }
    float _955 = _879;
    float _957 = _941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _959 = _955;
    if (_791)
    {
        float _961 = _835 ? as_type<float>(_913) : _811;
        _953 = _961;
    }
    float _963 = _953;
    float _965 = -_905;
    float _967 = fma(_933, _951, _965);
    if (_785)
    {
        float _969 = _921 ? as_type<float>(_885) : _811;
        _959 = _969;
    }
    float _971 = _959;
    float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _975 = _889 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _977 = 0.0;
    if (_949)
    {
        _977 = _851;
    }
    float _979 = _977;
    float _981 = _889 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _983 = 0.0;
    float _985 = _979;
    if (_949)
    {
        _983 = _853;
    }
    float _987 = _983;
    float _989 = fma(_887, (*spvDescriptorSet0.vp_c10)._m0[9].x, _975);
    float _991 = _987;
    if (_949)
    {
        _907 = _855;
    }
    float _993 = _907;
    float _995 = fma(_887, (*spvDescriptorSet0.vp_c10)._m0[10].x, _981);
    float _997 = _993;
    if (_949)
    {
        _917 = _979;
    }
    float _999 = _917;
    out.m_45.x = 1.0;
    float _1001 = _999;
    if (!_949)
    {
        _985 = _851;
    }
    float _1003 = _985;
    if (_949)
    {
        _821 = _987;
    }
    float _1005 = _821;
    float _1007 = _973 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1009 = _1005;
    if (!_949)
    {
        _991 = _853;
    }
    float _1011 = _991;
    float _1013 = _889 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_949)
    {
        _943 = _993;
    }
    float _1015 = _943;
    float _1017 = fma(_1007, _963, -0.5);
    float _1019 = _1015;
    if (!_949)
    {
        _997 = _855;
    }
    float _1021 = _997;
    float _1023 = _891 * _1003;
    float _1025 = fma(_887, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1013);
    if (!_949)
    {
        float _1027 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1011);
        _1009 = _1027;
    }
    float _1029 = _1009;
    float _1031 = fma(_863, _1017, _925);
    if (!_949)
    {
        float _1033 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1021);
        _1019 = _1033;
    }
    float _1035 = _1019;
    float _1037 = _889 * _1021;
    float _1039 = -_1023;
    float _1041 = fma(_887, _1021, _1039);
    float _1043 = fma(_891, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1025);
    float _1045 = fma(_891, (*spvDescriptorSet0.vp_c10)._m0[9].z, _989);
    float _1047 = fma(_891, (*spvDescriptorSet0.vp_c10)._m0[10].z, _995);
    float _1049 = _887 * _1011;
    float _1051 = -_1037;
    float _1053 = fma(_891, _1011, _1051);
    float _1055 = _1041 * _893;
    if (!_949)
    {
        float _1057 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1003);
        _1001 = _1057;
    }
    float _1059 = _1001;
    float _1061 = -_1049;
    float _1063 = fma(_889, _1003, _1061);
    float _1065 = _1053 * _893;
    float _1067 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    out.m_65.x = _1043;
    out.m_65.y = _1045;
    out.m_65.z = _1047;
    float _1069 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1071 = _1063 * _893;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1075 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1067);
    float _1077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1079 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1081 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_67.w = _1073;
    float _1083 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[6].z, _815);
    float _1085 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1079);
    float _1087 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1089 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1091 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1081);
    float _1093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1095 = fma(_1059, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1087);
    float _1097 = fma(_1059, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1089);
    float _1099 = fma(_1059, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1069);
    float _1101 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1103 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1095);
    float _1105 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1097);
    float _1107 = fma(_1035, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1099);
    float _1109 = _1031 + 0.5;
    float _1111 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1083);
    float _1113 = _967 + 0.5;
    out.m_69.w = _1101;
    float _1115 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1075);
    float _1117 = _696 * 0.5;
    float _1119 = _871 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_71.x = _1103;
    out.m_71.y = _1105;
    out.m_71.z = _1107;
    float _1121 = _971 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1123 = _1111 + _696;
    float _1125 = _720 + _696;
    float _1127 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1091);
    float _1129 = fma(_734, -0.5, _1117);
    float _1131 = _1119 * _1077;
    float _1133 = _1121 * _1093;
    float _1135 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1085);
    float _1137 = _1123 * 0.5;
    float _1139 = _1125 * 0.5;
    float _1141 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _1109;
    out.m_73.y = _1113;
    out.m_73.z = _1133;
    out.m_73.w = _1131;
    out.m_75.x = _1115;
    out.m_75.y = _1135;
    out.m_75.z = _1127;
    out.gl_Position.x = _720;
    out.gl_Position.y = _734;
    out.gl_Position.z = _1111;
    out.gl_Position.w = _696;
    out.m_77.x = _1139;
    out.m_77.y = _1129;
    out.m_77.z = _1137;
    out.m_77.w = _696;
    out.m_79.w = _1141;
    float _1143 = _957 * _750;
    float _1145 = -_957;
    float _1147 = _1145 + 1.0;
    float _1149 = _765 * _1143;
    float _1151 = _765 * _1147;
    float _1153 = _775 * _1143;
    float _1155 = fma(_771, _1149, _759);
    float _1157 = fma(_773, _1149, _761);
    float _1159 = fma(_765, _1153, _763);
    out.m_81.x = _1155;
    out.m_81.y = _1157;
    out.m_81.z = _1159;
    out.m_81.w = _1151;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

