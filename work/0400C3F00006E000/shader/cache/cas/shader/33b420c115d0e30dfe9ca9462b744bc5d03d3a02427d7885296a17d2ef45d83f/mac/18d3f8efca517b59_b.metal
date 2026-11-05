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
    float4 m_65 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _100 = as_type<float>(_92);
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1140 = as_type<float>(_108);
        out.gl_Position.z = _1140;
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
        _100 = _128;
    }
    float _130 = _100;
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
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1209 = as_type<float>(_144);
        out.gl_Position.z = _1209;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_49.w;
    float _148 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_47.x;
    float _152 = in.m_47.y;
    float _154 = in.m_47.z;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = in.m_51.x;
    float _174 = in.m_51.y;
    float _176 = in.m_51.z;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = in.m_49.z;
    float _184 = 0.0;
    float _186 = _148;
    if (!_164)
    {
        float _188 = _148 * _148;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_164)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    bool _200 = !_164;
    float _202 = _198;
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _148 * _206;
        float _216 = exp2(_214);
        float _218 = _212 * 0.693147182464599609375;
        float _220 = 1.0 / _218;
        float _222 = 1.0 / _210;
        float _224 = _216 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _220, _148);
        float _230 = _228 * _222;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _232;
    }
    float _234 = _202;
    bool _236 = !_164;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _148 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _186 = _256;
    }
    float _258 = _186;
    float _260 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _174);
    float _266 = _182 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _268 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _270 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _262 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _274 = _266 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _172);
    float _278 = fma(_258, _152, _270);
    float _280 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _282 = _272 * _264;
    float _284 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _176);
    float _286 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _288 = fma(_258, _150, _280);
    float _290 = fma(_278, _146, _168);
    float _292 = _274 * _284;
    float _294 = fma(_258, _154, _286);
    float _296 = fma(_288, _146, _166);
    float _298 = _290 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _300 = _268 * _276;
    float _302 = fma(_294, _146, _170);
    float _304 = _282 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _306 = _290 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _308 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _298);
    float _310 = _282 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _312 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[10].x, _304);
    float _314 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _306);
    float _316 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].z, _308);
    float _318 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[8].x, _310);
    float _320 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[10].z, _312);
    float _322 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].z, _314);
    float _324 = _316 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _326 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[8].z, _318);
    float _328 = _282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _330 = _322 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _332 = _324 + _320;
    float _334 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[9].x, _328);
    float _336 = _330 + _326;
    float _338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _340 = _332 + _338;
    float _342 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[9].z, _334);
    float _344 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _346 = _336 + _344;
    float _348 = _340 * _340;
    float _350 = fma(_346, _346, _348);
    float _352 = _290 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _354 = sqrt(_350);
    float _356 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _352);
    float _358 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].z, _356);
    float _360 = _358 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _362 = _360 + _342;
    bool _364 = _354 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _366 = _328;
    float _368 = _358;
    float _370 = _332;
    float _372 = _296;
    if (!_364)
    {
        _366 = _332;
    }
    float _374 = _366;
    float _376 = _374;
    if (!_364)
    {
        _368 = _336;
    }
    float _378 = _368;
    float _380 = _378;
    if (!_364)
    {
        _370 = _362;
    }
    float _382 = _370;
    bool _384 = !_364;
    float _386 = _382;
    if (!_384)
    {
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _390 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _392 = _354 + _390;
        float _394 = _362 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _396 = rsqrt(_350);
        float _398 = _392 * _388;
        float _400 = _398 * 0.15915493667125701904296875;
        float _402 = _400 * 6.283185482025146484375;
        float _404 = cos(_402);
        float _406 = _400 * 6.283185482025146484375;
        float _408 = sin(_406);
        float _410 = _404 + (-1.0);
        float _412 = _410 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _414 = fma(_408, _394, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _416 = fma(_362, _404, _412);
        float _418 = _396 * _414;
        float _420 = fma(_346, _418, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _422 = fma(_340, _418, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _386 = _416;
        _380 = _420;
        _376 = _422;
    }
    float _424 = _386;
    float _426 = _380;
    float _428 = _376;
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _432 = _424 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _436 = _426 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _440 = _428 + _438;
    float _442 = _432 * _432;
    float _444 = fma(_436, _436, _442);
    float _446 = fma(_440, _440, _444);
    float _448 = rsqrt(_446);
    float _450 = sqrt(_446);
    float _452 = _448 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _454 = _436 * _452;
    float _456 = _440 * _452;
    float _458 = _454 * _454;
    float _460 = _456 * _456;
    float _462 = _458 + _460;
    float _464 = sqrt(_462);
    bool _466 = _464 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _468 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _470 = _464 + _468;
    float _472 = _290;
    float _474 = _462;
    float _476 = _470;
    float _478 = _452;
    float _480 = _426;
    if (_466)
    {
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _472 = _482;
    }
    float _484 = _472;
    if (_466)
    {
        float _486 = rsqrt(_462);
        _474 = _486;
    }
    float _488 = _474;
    float _490 = _488;
    if (_466)
    {
        float _492 = _470 * _484;
        _476 = _492;
    }
    float _494 = _476;
    if (_466)
    {
        float _496 = _494 * 0.15915493667125701904296875;
        _372 = _496;
    }
    float _498 = _372;
    float _500 = _334;
    float _502 = _498;
    if (_466)
    {
        float _504 = _498 * 6.283185482025146484375;
        float _506 = sin(_504);
        _500 = _506;
    }
    float _508 = _500;
    float _510 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _512 = precise::max(0.0, _510);
    float _514 = _342;
    float _516 = _512;
    float _518 = _510;
    if (_466)
    {
        float _520 = _498 * 6.283185482025146484375;
        float _522 = cos(_520);
        _514 = _522;
    }
    float _524 = _514;
    float _526 = -_452;
    float _528 = -_512;
    float _530 = fma(_432, _526, _528);
    if (_466)
    {
        float _532 = _530 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _516 = _532;
    }
    float _534 = _516;
    float _536 = _534;
    float _538 = _508;
    if (_466)
    {
        float _540 = fma(_508, _534, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _536 = _540;
    }
    float _542 = _536;
    float _544 = _542;
    if (!_466)
    {
        _538 = _454;
    }
    float _546 = _538;
    float _548 = _546;
    float _550 = _524;
    if (_466)
    {
        float _552 = _524 + (-1.0);
        _518 = _552;
    }
    float _554 = _518;
    float _556 = _554;
    if (_466)
    {
        float _558 = _488 * _542;
        _478 = _558;
    }
    float _560 = _478;
    if (!_466)
    {
        _544 = _530;
    }
    float _562 = _544;
    float _564 = _562;
    if (_466)
    {
        float _566 = _554 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _502 = _566;
    }
    float _568 = _502;
    if (_466)
    {
        float _570 = _454 * _560;
        _548 = _570;
    }
    float _572 = _548;
    if (!_466)
    {
        _556 = _456;
    }
    float _574 = _556;
    float _576 = _574;
    if (_466)
    {
        float _578 = _456 * _560;
        _576 = _578;
    }
    float _580 = _576;
    if (!_466)
    {
        _490 = _458;
    }
    float _582 = _490;
    float _584 = _582;
    if (_466)
    {
        float _586 = fma(_530, _524, _568);
        _564 = _586;
    }
    float _588 = _564;
    if (_466)
    {
        float _590 = _572 * _572;
        _584 = _590;
    }
    float _592 = _584;
    float _594 = _424 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_466)
    {
        _550 = _460;
    }
    float _596 = _550;
    float _598 = _596;
    if (_466)
    {
        float _600 = _580 * _580;
        _598 = _600;
    }
    float _602 = _598;
    float _604 = fma(_588, _588, _592);
    float _606 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _608 = fma(_450, (*spvDescriptorSet0.vp_c15)._m0[23].w, _606);
    float _610 = precise::clamp(_608, 0.0, 1.0);
    float _612 = _424 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _614 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[2].x, _594);
    float _616 = _604 + _602;
    float _618 = _424 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _620 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[1].x, _612);
    float _622 = -_610;
    float _624 = _622 + 1.0;
    float _626 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[2].z, _614);
    float _628 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[0].x, _618);
    float _630 = rsqrt(_616);
    float _632 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[1].z, _620);
    float _634 = _424 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _636 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[0].z, _628);
    float _638 = _632 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _640 = _626 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _642 = _636 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _644 = abs(_624);
    float _646 = log2(_644);
    float _648 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[3].x, _634);
    float _650 = _638 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _652 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _654 = _640 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _656 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[3].z, _648);
    float _658 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[7].x, _650);
    float _660 = _630 * _572;
    float _662 = _630 * _588;
    float _664 = _630 * _580;
    float _666 = -_654;
    float _668 = fma(_666, _652, 1.0);
    float _670 = _660 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _672 = _656 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _674 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[7].z, _658);
    float _676 = _638 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _678 = -_670;
    float _680 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[21].y, _678);
    float _682 = log2(_668);
    float _684 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[7].w, _674);
    float _686 = _646 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _688 = -_664;
    float _690 = fma(_688, (*spvDescriptorSet0.vp_c15)._m0[21].z, _680);
    float _692 = _638 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _694 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[5].x, _676);
    float _696 = fma(_690, -0.5, 0.5);
    float _698 = exp2(_686);
    float _700 = fma(_690, 0.5, 0.5);
    float _702 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[4].x, _692);
    float _704 = _662 + 1.0;
    float _706 = fma(_700, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _708 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[4].z, _702);
    float _710 = 1.0 / _684;
    float _712 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[5].z, _694);
    float _714 = fma(_700, _706, -0.212114393711090087890625);
    float _716 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[4].w, _708);
    float _718 = _682 * 0.693147182464599609375;
    float _720 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[5].w, _712);
    float _722 = fma(_700, _714, 1.570728778839111328125);
    float _724 = sqrt(_696);
    float _726 = -_662;
    float _728 = fma(_698, _704, _726);
    float _730 = _718 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _732 = fma(_728, 0.5, 0.5);
    float _734 = _716 * _710;
    float _736 = _720 * _710;
    float _738 = fma(_734, 0.5, 0.5);
    float _740 = fma(_736, -0.5, 0.5);
    float _742 = _724 * 0.636619746685028076171875;
    float _744 = -_722;
    float _746 = fma(_742, _744, 1.0);
    float3 _2209 = float3(_738, _740, _730);
    float _748 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2209, float3(0.0), isnan(_2209)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2209, float3(0.0), isnan(_2209)), level(0.0)).x;
    float3 _2220 = float3(_738, _740, _730);
    float4 _751 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2220, float3(0.0), isnan(_2220)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2220, float3(0.0), isnan(_2220)), level(0.0)).xyzw;
    float _753 = _751.x;
    float _755 = _751.y;
    float _757 = _751.z;
    float _759 = _751.w;
    float2 _2237 = float2(_746, _732);
    float3 _763 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2237, float2(0.0), isnan(_2237)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2237, float2(0.0), isnan(_2237)), level(0.0)).xyz;
    float _765 = _763.x;
    float _767 = _763.y;
    float _769 = _763.z;
    float _771 = in.m_53.x;
    float _773 = in.m_53.y;
    float _775 = _172 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _779 = _777 != 0;
    float _781 = in.m_55.y;
    float _783 = _360 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _785 = in.m_55.x;
    float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _791 = _789 != 0;
    float _793 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _797 = _174 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _799 = fma(_330, (*spvDescriptorSet0.vp_c8)._m0[11].x, _783);
    float _801 = 0.0;
    float _803 = _785;
    if (_779)
    {
        float _805 = in.m_53.x;
        _801 = _805;
    }
    float _807 = _801;
    float _809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _813 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[11].z, _799);
    float _815 = _360 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _817 = _646 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _819 = _638 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_57.x = _426;
    out.m_57.y = _424;
    out.m_57.z = _428;
    float _821 = _771 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _823 = _773 > 0.5;
    float _825 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[78].z, _811);
    float _827 = _797 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _829 = -_795;
    float _831 = fma(_821, 2.0, _829);
    float _833 = -_781;
    float _835 = _833 + 1.0;
    float _837 = _773 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _839 = -_126;
    float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[76].x, _831);
    float _843 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[8].x, _827);
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _847 = _781;
    if (_791)
    {
        float _849 = _823 ? _835 : _781;
        _847 = _849;
    }
    float _851 = _847;
    float _853 = _787 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _855 = _797 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _857 = fma(_837, -2.0, _845);
    float _859 = _797 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _861 = _807 > 0.5;
    bool _863 = _861 && _779;
    float _865 = fma(_853, _851, -0.5);
    float _867 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[9].x, _855);
    float _869 = _853;
    if (!_779)
    {
        _869 = _785;
    }
    float _871 = _869;
    float _873 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[10].x, _859);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _877 = fma(_330, (*spvDescriptorSet0.vp_c8)._m0[10].x, _815);
    bool _879 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _881 = isnan(0.5);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _887 = _883 || _885;
    float _889 = exp2(_817);
    float _891 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[78].w, _875);
    float _893 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _825);
    float _895 = _871;
    if (_863)
    {
        float _897 = -_785;
        float _899 = _897 + 1.0;
        _803 = _899;
    }
    float _901 = _803;
    float _903 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _857);
    float _905 = _809 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _907 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _891);
    float _909 = in.m_59.w;
    if (_779)
    {
        _895 = _901;
    }
    float _911 = _895;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _915 = -_903;
    float _917 = fma(_907, _865, _915);
    float _919 = _813 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _921 = fma(_905, _911, -0.5);
    float _923 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _925 = fma(_893, _921, _841);
    float _927 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[9].z, _867);
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _935 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[8].z, _843);
    float _937 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[10].z, _873);
    float _939 = _917 + 0.5;
    float _941 = _925 + 0.5;
    float _943 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = _931 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _947 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[10].z, _877);
    float _949 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[6].x, _819);
    out.m_61.x = _941;
    out.m_61.y = _939;
    if (_887)
    {
        _480 = 1.0;
    }
    float _951 = _480;
    float _953 = _947 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _955 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[6].z, _949);
    out.m_63.w = _909;
    float _957 = _953 + _919;
    float _959 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[6].w, _955);
    out.m_65.x = _923;
    out.m_65.y = _943;
    out.m_65.z = _945;
    out.m_65.w = _933;
    out.m_67.x = _935;
    out.m_67.y = _927;
    out.m_67.z = _937;
    float _961 = 1.0 / _919;
    float _963 = _957 * _961;
    float _965 = _963 * 0.5;
    float _967 = _951;
    if (!_887)
    {
        float _969 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _971 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _973 = _969 * 0.15915493667125701904296875;
        float _975 = _971 * 0.15915493667125701904296875;
        float _977 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _979 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[30].w, _977);
        float _981 = _973 * 6.283185482025146484375;
        float _983 = cos(_981);
        float _985 = _973 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = 1.0 / _983;
        float _991 = _975 * 6.283185482025146484375;
        float _993 = cos(_991);
        float _995 = _987 * _989;
        float _997 = _975 * 6.283185482025146484375;
        float _999 = sin(_997);
        float _1001 = _993 * _995;
        float _1003 = 1.0 / _979;
        float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1007 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1005;
        float _1009 = 1.0 / _1001;
        float _1011 = 1.0 / _1007;
        float _1013 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1015 = _1003 * _1013;
        float _1017 = _999 * _1009;
        float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1021 = fma(_1017, _1015, _1019);
        float _1023 = _1021 * _1011;
        float _1025 = precise::clamp(_1023, 0.0, 1.0);
        float _1027 = -_1025;
        float _1029 = _1027 + 1.0;
        _967 = _1029;
    }
    float _1031 = _967;
    float _1033 = -_889;
    float _1035 = _1033 + 1.0;
    float _1037 = _684 * 0.5;
    bool _1039 = _1031 > 0.0;
    bool _1041 = isnan(_1031);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan(0.0);
    bool _1047 = _1043 || _1045;
    float _1049 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1051 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1053 = fma(_720, -0.5, _1037);
    float _1055 = _959 + _684;
    float _1057 = _716 + _684;
    float _1059 = _1051 * _748;
    float _1061 = -_1051;
    float _1063 = _1061 + 1.0;
    float _1065 = _1055 * 0.5;
    float _1067 = _759 * _1059;
    float _1069 = _769 * _1059;
    float _1071 = _1057 * 0.5;
    float _1073 = _1049 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1075 = fma(_765, _1067, _753);
    float _1077 = fma(_767, _1067, _755);
    float _1079 = _759 * _1063;
    float _1081 = fma(_759, _1069, _757);
    out.m_69.x = _436;
    out.m_69.y = _432;
    out.m_69.z = _440;
    out.gl_Position.x = _716;
    out.gl_Position.y = _720;
    out.gl_Position.z = _959;
    out.gl_Position.w = _684;
    out.m_71.x = _1071;
    out.m_71.y = _1053;
    out.m_71.z = _1065;
    out.m_71.w = _684;
    out.m_45.x = _1073;
    out.m_73.x = _1075;
    out.m_73.y = _1077;
    out.m_73.z = _1081;
    out.m_73.w = _1079;
    if (_1047)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1083 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1083;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _100 = as_type<float>(_92);
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1140 = as_type<float>(_108);
        out.gl_Position.z = _1140;
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
        _100 = _128;
    }
    float _130 = _100;
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
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1209 = as_type<float>(_144);
        out.gl_Position.z = _1209;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_49.w;
    float _148 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_47.x;
    float _152 = in.m_47.y;
    float _154 = in.m_47.z;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = in.m_51.x;
    float _174 = in.m_51.y;
    float _176 = in.m_51.z;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = in.m_49.z;
    float _184 = 0.0;
    float _186 = _148;
    if (!_164)
    {
        float _188 = _148 * _148;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_164)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    bool _200 = !_164;
    float _202 = _198;
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _148 * _206;
        float _216 = exp2(_214);
        float _218 = _212 * 0.693147182464599609375;
        float _220 = 1.0 / _218;
        float _222 = 1.0 / _210;
        float _224 = _216 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _220, _148);
        float _230 = _228 * _222;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _232;
    }
    float _234 = _202;
    bool _236 = !_164;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _148 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _186 = _256;
    }
    float _258 = _186;
    float _260 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _174);
    float _266 = _182 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _268 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _270 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _262 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _274 = _266 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _172);
    float _278 = fma(_258, _152, _270);
    float _280 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _282 = _272 * _264;
    float _284 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _176);
    float _286 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _288 = fma(_258, _150, _280);
    float _290 = fma(_278, _146, _168);
    float _292 = _274 * _284;
    float _294 = fma(_258, _154, _286);
    float _296 = fma(_288, _146, _166);
    float _298 = _290 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _300 = _268 * _276;
    float _302 = fma(_294, _146, _170);
    float _304 = _282 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _306 = _290 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _308 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _298);
    float _310 = _282 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _312 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[10].x, _304);
    float _314 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _306);
    float _316 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].z, _308);
    float _318 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[8].x, _310);
    float _320 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[10].z, _312);
    float _322 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].z, _314);
    float _324 = _316 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _326 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[8].z, _318);
    float _328 = _282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _330 = _322 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _332 = _324 + _320;
    float _334 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[9].x, _328);
    float _336 = _330 + _326;
    float _338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _340 = _332 + _338;
    float _342 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[9].z, _334);
    float _344 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _346 = _336 + _344;
    float _348 = _340 * _340;
    float _350 = fma(_346, _346, _348);
    float _352 = _290 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _354 = sqrt(_350);
    float _356 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _352);
    float _358 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].z, _356);
    float _360 = _358 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _362 = _360 + _342;
    bool _364 = _354 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _366 = _328;
    float _368 = _358;
    float _370 = _332;
    float _372 = _296;
    if (!_364)
    {
        _366 = _332;
    }
    float _374 = _366;
    float _376 = _374;
    if (!_364)
    {
        _368 = _336;
    }
    float _378 = _368;
    float _380 = _378;
    if (!_364)
    {
        _370 = _362;
    }
    float _382 = _370;
    bool _384 = !_364;
    float _386 = _382;
    if (!_384)
    {
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _390 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _392 = _354 + _390;
        float _394 = _362 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _396 = rsqrt(_350);
        float _398 = _392 * _388;
        float _400 = _398 * 0.15915493667125701904296875;
        float _402 = _400 * 6.283185482025146484375;
        float _404 = cos(_402);
        float _406 = _400 * 6.283185482025146484375;
        float _408 = sin(_406);
        float _410 = _404 + (-1.0);
        float _412 = _410 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _414 = fma(_408, _394, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _416 = fma(_362, _404, _412);
        float _418 = _396 * _414;
        float _420 = fma(_346, _418, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _422 = fma(_340, _418, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _386 = _416;
        _380 = _420;
        _376 = _422;
    }
    float _424 = _386;
    float _426 = _380;
    float _428 = _376;
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _432 = _424 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _436 = _426 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _440 = _428 + _438;
    float _442 = _432 * _432;
    float _444 = fma(_436, _436, _442);
    float _446 = fma(_440, _440, _444);
    float _448 = rsqrt(_446);
    float _450 = sqrt(_446);
    float _452 = _448 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _454 = _436 * _452;
    float _456 = _440 * _452;
    float _458 = _454 * _454;
    float _460 = _456 * _456;
    float _462 = _458 + _460;
    float _464 = sqrt(_462);
    bool _466 = _464 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _468 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _470 = _464 + _468;
    float _472 = _290;
    float _474 = _462;
    float _476 = _470;
    float _478 = _452;
    float _480 = _426;
    if (_466)
    {
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _472 = _482;
    }
    float _484 = _472;
    if (_466)
    {
        float _486 = rsqrt(_462);
        _474 = _486;
    }
    float _488 = _474;
    float _490 = _488;
    if (_466)
    {
        float _492 = _470 * _484;
        _476 = _492;
    }
    float _494 = _476;
    if (_466)
    {
        float _496 = _494 * 0.15915493667125701904296875;
        _372 = _496;
    }
    float _498 = _372;
    float _500 = _334;
    float _502 = _498;
    if (_466)
    {
        float _504 = _498 * 6.283185482025146484375;
        float _506 = sin(_504);
        _500 = _506;
    }
    float _508 = _500;
    float _510 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _512 = precise::max(0.0, _510);
    float _514 = _342;
    float _516 = _512;
    float _518 = _510;
    if (_466)
    {
        float _520 = _498 * 6.283185482025146484375;
        float _522 = cos(_520);
        _514 = _522;
    }
    float _524 = _514;
    float _526 = -_452;
    float _528 = -_512;
    float _530 = fma(_432, _526, _528);
    if (_466)
    {
        float _532 = _530 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _516 = _532;
    }
    float _534 = _516;
    float _536 = _534;
    float _538 = _508;
    if (_466)
    {
        float _540 = fma(_508, _534, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _536 = _540;
    }
    float _542 = _536;
    float _544 = _542;
    if (!_466)
    {
        _538 = _454;
    }
    float _546 = _538;
    float _548 = _546;
    float _550 = _524;
    if (_466)
    {
        float _552 = _524 + (-1.0);
        _518 = _552;
    }
    float _554 = _518;
    float _556 = _554;
    if (_466)
    {
        float _558 = _488 * _542;
        _478 = _558;
    }
    float _560 = _478;
    if (!_466)
    {
        _544 = _530;
    }
    float _562 = _544;
    float _564 = _562;
    if (_466)
    {
        float _566 = _554 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _502 = _566;
    }
    float _568 = _502;
    if (_466)
    {
        float _570 = _454 * _560;
        _548 = _570;
    }
    float _572 = _548;
    if (!_466)
    {
        _556 = _456;
    }
    float _574 = _556;
    float _576 = _574;
    if (_466)
    {
        float _578 = _456 * _560;
        _576 = _578;
    }
    float _580 = _576;
    if (!_466)
    {
        _490 = _458;
    }
    float _582 = _490;
    float _584 = _582;
    if (_466)
    {
        float _586 = fma(_530, _524, _568);
        _564 = _586;
    }
    float _588 = _564;
    if (_466)
    {
        float _590 = _572 * _572;
        _584 = _590;
    }
    float _592 = _584;
    float _594 = _424 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_466)
    {
        _550 = _460;
    }
    float _596 = _550;
    float _598 = _596;
    if (_466)
    {
        float _600 = _580 * _580;
        _598 = _600;
    }
    float _602 = _598;
    float _604 = fma(_588, _588, _592);
    float _606 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _608 = fma(_450, (*spvDescriptorSet0.vp_c15)._m0[23].w, _606);
    float _610 = precise::clamp(_608, 0.0, 1.0);
    float _612 = _424 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _614 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[2].x, _594);
    float _616 = _604 + _602;
    float _618 = _424 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _620 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[1].x, _612);
    float _622 = -_610;
    float _624 = _622 + 1.0;
    float _626 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[2].z, _614);
    float _628 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[0].x, _618);
    float _630 = rsqrt(_616);
    float _632 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[1].z, _620);
    float _634 = _424 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _636 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[0].z, _628);
    float _638 = _632 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _640 = _626 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _642 = _636 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _644 = abs(_624);
    float _646 = log2(_644);
    float _648 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[3].x, _634);
    float _650 = _638 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _652 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _654 = _640 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _656 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[3].z, _648);
    float _658 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[7].x, _650);
    float _660 = _630 * _572;
    float _662 = _630 * _588;
    float _664 = _630 * _580;
    float _666 = -_654;
    float _668 = fma(_666, _652, 1.0);
    float _670 = _660 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _672 = _656 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _674 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[7].z, _658);
    float _676 = _638 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _678 = -_670;
    float _680 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[21].y, _678);
    float _682 = log2(_668);
    float _684 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[7].w, _674);
    float _686 = _646 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _688 = -_664;
    float _690 = fma(_688, (*spvDescriptorSet0.vp_c15)._m0[21].z, _680);
    float _692 = _638 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _694 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[5].x, _676);
    float _696 = fma(_690, -0.5, 0.5);
    float _698 = exp2(_686);
    float _700 = fma(_690, 0.5, 0.5);
    float _702 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[4].x, _692);
    float _704 = _662 + 1.0;
    float _706 = fma(_700, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _708 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[4].z, _702);
    float _710 = 1.0 / _684;
    float _712 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[5].z, _694);
    float _714 = fma(_700, _706, -0.212114393711090087890625);
    float _716 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[4].w, _708);
    float _718 = _682 * 0.693147182464599609375;
    float _720 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[5].w, _712);
    float _722 = fma(_700, _714, 1.570728778839111328125);
    float _724 = sqrt(_696);
    float _726 = -_662;
    float _728 = fma(_698, _704, _726);
    float _730 = _718 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _732 = fma(_728, 0.5, 0.5);
    float _734 = _716 * _710;
    float _736 = _720 * _710;
    float _738 = fma(_734, 0.5, 0.5);
    float _740 = fma(_736, -0.5, 0.5);
    float _742 = _724 * 0.636619746685028076171875;
    float _744 = -_722;
    float _746 = fma(_742, _744, 1.0);
    float3 _2209 = float3(_738, _740, _730);
    float _748 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2209, float3(0.0), isnan(_2209)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2209, float3(0.0), isnan(_2209)), level(0.0)).x;
    float3 _2220 = float3(_738, _740, _730);
    float4 _751 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2220, float3(0.0), isnan(_2220)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2220, float3(0.0), isnan(_2220)), level(0.0)).xyzw;
    float _753 = _751.x;
    float _755 = _751.y;
    float _757 = _751.z;
    float _759 = _751.w;
    float2 _2237 = float2(_746, _732);
    float3 _763 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2237, float2(0.0), isnan(_2237)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2237, float2(0.0), isnan(_2237)), level(0.0)).xyz;
    float _765 = _763.x;
    float _767 = _763.y;
    float _769 = _763.z;
    float _771 = in.m_53.x;
    float _773 = in.m_53.y;
    float _775 = _172 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _779 = _777 != 0;
    float _781 = in.m_55.y;
    float _783 = _360 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _785 = in.m_55.x;
    float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _791 = _789 != 0;
    float _793 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _797 = _174 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _799 = fma(_330, (*spvDescriptorSet0.vp_c8)._m0[11].x, _783);
    float _801 = 0.0;
    float _803 = _785;
    if (_779)
    {
        float _805 = in.m_53.x;
        _801 = _805;
    }
    float _807 = _801;
    float _809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _813 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[11].z, _799);
    float _815 = _360 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _817 = _646 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _819 = _638 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_57.x = _426;
    out.m_57.y = _424;
    out.m_57.z = _428;
    float _821 = _771 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _823 = _773 > 0.5;
    float _825 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[78].z, _811);
    float _827 = _797 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _829 = -_795;
    float _831 = fma(_821, 2.0, _829);
    float _833 = -_781;
    float _835 = _833 + 1.0;
    float _837 = _773 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _839 = -_126;
    float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[76].x, _831);
    float _843 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[8].x, _827);
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _847 = _781;
    if (_791)
    {
        float _849 = _823 ? _835 : _781;
        _847 = _849;
    }
    float _851 = _847;
    float _853 = _787 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _855 = _797 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _857 = fma(_837, -2.0, _845);
    float _859 = _797 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _861 = _807 > 0.5;
    bool _863 = _861 && _779;
    float _865 = fma(_853, _851, -0.5);
    float _867 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[9].x, _855);
    float _869 = _853;
    if (!_779)
    {
        _869 = _785;
    }
    float _871 = _869;
    float _873 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[10].x, _859);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _877 = fma(_330, (*spvDescriptorSet0.vp_c8)._m0[10].x, _815);
    bool _879 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _881 = isnan(0.5);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _887 = _883 || _885;
    float _889 = exp2(_817);
    float _891 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[78].w, _875);
    float _893 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _825);
    float _895 = _871;
    if (_863)
    {
        float _897 = -_785;
        float _899 = _897 + 1.0;
        _803 = _899;
    }
    float _901 = _803;
    float _903 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _857);
    float _905 = _809 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _907 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _891);
    float _909 = in.m_59.w;
    if (_779)
    {
        _895 = _901;
    }
    float _911 = _895;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _915 = -_903;
    float _917 = fma(_907, _865, _915);
    float _919 = _813 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _921 = fma(_905, _911, -0.5);
    float _923 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _925 = fma(_893, _921, _841);
    float _927 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[9].z, _867);
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _935 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[8].z, _843);
    float _937 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[10].z, _873);
    float _939 = _917 + 0.5;
    float _941 = _925 + 0.5;
    float _943 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = _931 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _947 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[10].z, _877);
    float _949 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[6].x, _819);
    out.m_61.x = _941;
    out.m_61.y = _939;
    if (_887)
    {
        _480 = 1.0;
    }
    float _951 = _480;
    float _953 = _947 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _955 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[6].z, _949);
    out.m_63.w = _909;
    float _957 = _953 + _919;
    float _959 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[6].w, _955);
    out.m_65.x = _923;
    out.m_65.y = _943;
    out.m_65.z = _945;
    out.m_65.w = _933;
    out.m_67.x = _935;
    out.m_67.y = _927;
    out.m_67.z = _937;
    float _961 = 1.0 / _919;
    float _963 = _957 * _961;
    float _965 = _963 * 0.5;
    float _967 = _951;
    if (!_887)
    {
        float _969 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _971 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _973 = _969 * 0.15915493667125701904296875;
        float _975 = _971 * 0.15915493667125701904296875;
        float _977 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _979 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[30].w, _977);
        float _981 = _973 * 6.283185482025146484375;
        float _983 = cos(_981);
        float _985 = _973 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = 1.0 / _983;
        float _991 = _975 * 6.283185482025146484375;
        float _993 = cos(_991);
        float _995 = _987 * _989;
        float _997 = _975 * 6.283185482025146484375;
        float _999 = sin(_997);
        float _1001 = _993 * _995;
        float _1003 = 1.0 / _979;
        float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1007 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1005;
        float _1009 = 1.0 / _1001;
        float _1011 = 1.0 / _1007;
        float _1013 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1015 = _1003 * _1013;
        float _1017 = _999 * _1009;
        float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1021 = fma(_1017, _1015, _1019);
        float _1023 = _1021 * _1011;
        float _1025 = precise::clamp(_1023, 0.0, 1.0);
        float _1027 = -_1025;
        float _1029 = _1027 + 1.0;
        _967 = _1029;
    }
    float _1031 = _967;
    float _1033 = -_889;
    float _1035 = _1033 + 1.0;
    float _1037 = _684 * 0.5;
    bool _1039 = _1031 > 0.0;
    bool _1041 = isnan(_1031);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan(0.0);
    bool _1047 = _1043 || _1045;
    float _1049 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1051 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1053 = fma(_720, -0.5, _1037);
    float _1055 = _959 + _684;
    float _1057 = _716 + _684;
    float _1059 = _1051 * _748;
    float _1061 = -_1051;
    float _1063 = _1061 + 1.0;
    float _1065 = _1055 * 0.5;
    float _1067 = _759 * _1059;
    float _1069 = _769 * _1059;
    float _1071 = _1057 * 0.5;
    float _1073 = _1049 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1075 = fma(_765, _1067, _753);
    float _1077 = fma(_767, _1067, _755);
    float _1079 = _759 * _1063;
    float _1081 = fma(_759, _1069, _757);
    out.m_69.x = _436;
    out.m_69.y = _432;
    out.m_69.z = _440;
    out.gl_Position.x = _716;
    out.gl_Position.y = _720;
    out.gl_Position.z = _959;
    out.gl_Position.w = _684;
    out.m_71.x = _1071;
    out.m_71.y = _1053;
    out.m_71.z = _1065;
    out.m_71.w = _684;
    out.m_45.x = _1073;
    out.m_73.x = _1075;
    out.m_73.y = _1077;
    out.m_73.z = _1081;
    out.m_73.w = _1079;
    if (_1047)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1083 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1083;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _100 = as_type<float>(_92);
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1140 = as_type<float>(_108);
        out.gl_Position.z = _1140;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        _100 = _128;
    }
    float _130 = _100;
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
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1209 = as_type<float>(_144);
        out.gl_Position.z = _1209;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_49.w;
    float _148 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_47.x;
    float _152 = in.m_47.y;
    float _154 = in.m_47.z;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = in.m_51.x;
    float _174 = in.m_51.y;
    float _176 = in.m_51.z;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = in.m_49.z;
    float _184 = 0.0;
    float _186 = _148;
    if (!_164)
    {
        float _188 = _148 * _148;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_164)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    bool _200 = !_164;
    float _202 = _198;
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _148 * _206;
        float _216 = exp2(_214);
        float _218 = _212 * 0.693147182464599609375;
        float _220 = 1.0 / _218;
        float _222 = 1.0 / _210;
        float _224 = _216 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _220, _148);
        float _230 = _228 * _222;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _232;
    }
    float _234 = _202;
    bool _236 = !_164;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _148 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _186 = _256;
    }
    float _258 = _186;
    float _260 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = _180 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _174);
    float _266 = _182 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _268 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _270 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _262 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _274 = _266 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _172);
    float _278 = fma(_258, _152, _270);
    float _280 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _282 = _272 * _264;
    float _284 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _176);
    float _286 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _288 = fma(_258, _150, _280);
    float _290 = fma(_278, _146, _168);
    float _292 = _274 * _284;
    float _294 = fma(_258, _154, _286);
    float _296 = fma(_288, _146, _166);
    float _298 = _290 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _300 = _268 * _276;
    float _302 = fma(_294, _146, _170);
    float _304 = _282 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _306 = _290 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _308 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _298);
    float _310 = _282 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _312 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[10].x, _304);
    float _314 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _306);
    float _316 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].z, _308);
    float _318 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[8].x, _310);
    float _320 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[10].z, _312);
    float _322 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].z, _314);
    float _324 = _316 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _326 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[8].z, _318);
    float _328 = _282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _330 = _322 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _332 = _324 + _320;
    float _334 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[9].x, _328);
    float _336 = _330 + _326;
    float _338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _340 = _332 + _338;
    float _342 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[9].z, _334);
    float _344 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _346 = _336 + _344;
    float _348 = _340 * _340;
    float _350 = fma(_346, _346, _348);
    float _352 = _290 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _354 = sqrt(_350);
    float _356 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _352);
    float _358 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].z, _356);
    float _360 = _358 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _362 = _360 + _342;
    bool _364 = _354 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _366 = _328;
    float _368 = _358;
    float _370 = _332;
    float _372 = _296;
    if (!_364)
    {
        _366 = _332;
    }
    float _374 = _366;
    float _376 = _374;
    if (!_364)
    {
        _368 = _336;
    }
    float _378 = _368;
    float _380 = _378;
    if (!_364)
    {
        _370 = _362;
    }
    float _382 = _370;
    bool _384 = !_364;
    float _386 = _382;
    if (!_384)
    {
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _390 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _392 = _354 + _390;
        float _394 = _362 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _396 = rsqrt(_350);
        float _398 = _392 * _388;
        float _400 = _398 * 0.15915493667125701904296875;
        float _402 = _400 * 6.283185482025146484375;
        float _404 = cos(_402);
        float _406 = _400 * 6.283185482025146484375;
        float _408 = sin(_406);
        float _410 = _404 + (-1.0);
        float _412 = _410 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _414 = fma(_408, _394, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _416 = fma(_362, _404, _412);
        float _418 = _396 * _414;
        float _420 = fma(_346, _418, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _422 = fma(_340, _418, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _386 = _416;
        _380 = _420;
        _376 = _422;
    }
    float _424 = _386;
    float _426 = _380;
    float _428 = _376;
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _432 = _424 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _436 = _426 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _440 = _428 + _438;
    float _442 = _432 * _432;
    float _444 = fma(_436, _436, _442);
    float _446 = fma(_440, _440, _444);
    float _448 = rsqrt(_446);
    float _450 = sqrt(_446);
    float _452 = _448 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _454 = _436 * _452;
    float _456 = _440 * _452;
    float _458 = _454 * _454;
    float _460 = _456 * _456;
    float _462 = _458 + _460;
    float _464 = sqrt(_462);
    bool _466 = _464 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _468 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _470 = _464 + _468;
    float _472 = _290;
    float _474 = _462;
    float _476 = _470;
    float _478 = _452;
    float _480 = _426;
    if (_466)
    {
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _472 = _482;
    }
    float _484 = _472;
    if (_466)
    {
        float _486 = rsqrt(_462);
        _474 = _486;
    }
    float _488 = _474;
    float _490 = _488;
    if (_466)
    {
        float _492 = _470 * _484;
        _476 = _492;
    }
    float _494 = _476;
    if (_466)
    {
        float _496 = _494 * 0.15915493667125701904296875;
        _372 = _496;
    }
    float _498 = _372;
    float _500 = _334;
    float _502 = _498;
    if (_466)
    {
        float _504 = _498 * 6.283185482025146484375;
        float _506 = sin(_504);
        _500 = _506;
    }
    float _508 = _500;
    float _510 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _512 = precise::max(0.0, _510);
    float _514 = _342;
    float _516 = _512;
    float _518 = _510;
    if (_466)
    {
        float _520 = _498 * 6.283185482025146484375;
        float _522 = cos(_520);
        _514 = _522;
    }
    float _524 = _514;
    float _526 = -_452;
    float _528 = -_512;
    float _530 = fma(_432, _526, _528);
    if (_466)
    {
        float _532 = _530 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _516 = _532;
    }
    float _534 = _516;
    float _536 = _534;
    float _538 = _508;
    if (_466)
    {
        float _540 = fma(_508, _534, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _536 = _540;
    }
    float _542 = _536;
    float _544 = _542;
    if (!_466)
    {
        _538 = _454;
    }
    float _546 = _538;
    float _548 = _546;
    float _550 = _524;
    if (_466)
    {
        float _552 = _524 + (-1.0);
        _518 = _552;
    }
    float _554 = _518;
    float _556 = _554;
    if (_466)
    {
        float _558 = _488 * _542;
        _478 = _558;
    }
    float _560 = _478;
    if (!_466)
    {
        _544 = _530;
    }
    float _562 = _544;
    float _564 = _562;
    if (_466)
    {
        float _566 = _554 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _502 = _566;
    }
    float _568 = _502;
    if (_466)
    {
        float _570 = _454 * _560;
        _548 = _570;
    }
    float _572 = _548;
    if (!_466)
    {
        _556 = _456;
    }
    float _574 = _556;
    float _576 = _574;
    if (_466)
    {
        float _578 = _456 * _560;
        _576 = _578;
    }
    float _580 = _576;
    if (!_466)
    {
        _490 = _458;
    }
    float _582 = _490;
    float _584 = _582;
    if (_466)
    {
        float _586 = fma(_530, _524, _568);
        _564 = _586;
    }
    float _588 = _564;
    if (_466)
    {
        float _590 = _572 * _572;
        _584 = _590;
    }
    float _592 = _584;
    float _594 = _424 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_466)
    {
        _550 = _460;
    }
    float _596 = _550;
    float _598 = _596;
    if (_466)
    {
        float _600 = _580 * _580;
        _598 = _600;
    }
    float _602 = _598;
    float _604 = fma(_588, _588, _592);
    float _606 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _608 = fma(_450, (*spvDescriptorSet0.vp_c15)._m0[23].w, _606);
    float _610 = precise::clamp(_608, 0.0, 1.0);
    float _612 = _424 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _614 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[2].x, _594);
    float _616 = _604 + _602;
    float _618 = _424 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _620 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[1].x, _612);
    float _622 = -_610;
    float _624 = _622 + 1.0;
    float _626 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[2].z, _614);
    float _628 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[0].x, _618);
    float _630 = rsqrt(_616);
    float _632 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[1].z, _620);
    float _634 = _424 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _636 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[0].z, _628);
    float _638 = _632 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _640 = _626 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _642 = _636 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _644 = abs(_624);
    float _646 = log2(_644);
    float _648 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[3].x, _634);
    float _650 = _638 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _652 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _654 = _640 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _656 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[3].z, _648);
    float _658 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[7].x, _650);
    float _660 = _630 * _572;
    float _662 = _630 * _588;
    float _664 = _630 * _580;
    float _666 = -_654;
    float _668 = fma(_666, _652, 1.0);
    float _670 = _660 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _672 = _656 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _674 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[7].z, _658);
    float _676 = _638 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _678 = -_670;
    float _680 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[21].y, _678);
    float _682 = log2(_668);
    float _684 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[7].w, _674);
    float _686 = _646 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _688 = -_664;
    float _690 = fma(_688, (*spvDescriptorSet0.vp_c15)._m0[21].z, _680);
    float _692 = _638 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _694 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[5].x, _676);
    float _696 = fma(_690, -0.5, 0.5);
    float _698 = exp2(_686);
    float _700 = fma(_690, 0.5, 0.5);
    float _702 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[4].x, _692);
    float _704 = _662 + 1.0;
    float _706 = fma(_700, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _708 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[4].z, _702);
    float _710 = 1.0 / _684;
    float _712 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[5].z, _694);
    float _714 = fma(_700, _706, -0.212114393711090087890625);
    float _716 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[4].w, _708);
    float _718 = _682 * 0.693147182464599609375;
    float _720 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[5].w, _712);
    float _722 = fma(_700, _714, 1.570728778839111328125);
    float _724 = sqrt(_696);
    float _726 = -_662;
    float _728 = fma(_698, _704, _726);
    float _730 = _718 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _732 = fma(_728, 0.5, 0.5);
    float _734 = _716 * _710;
    float _736 = _720 * _710;
    float _738 = fma(_734, 0.5, 0.5);
    float _740 = fma(_736, -0.5, 0.5);
    float _742 = _724 * 0.636619746685028076171875;
    float _744 = -_722;
    float _746 = fma(_742, _744, 1.0);
    float3 _2209 = float3(_738, _740, _730);
    float _748 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2209, float3(0.0), isnan(_2209)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2209, float3(0.0), isnan(_2209)), level(0.0)).x;
    float3 _2220 = float3(_738, _740, _730);
    float4 _751 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2220, float3(0.0), isnan(_2220)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2220, float3(0.0), isnan(_2220)), level(0.0)).xyzw;
    float _753 = _751.x;
    float _755 = _751.y;
    float _757 = _751.z;
    float _759 = _751.w;
    float2 _2237 = float2(_746, _732);
    float3 _763 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2237, float2(0.0), isnan(_2237)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2237, float2(0.0), isnan(_2237)), level(0.0)).xyz;
    float _765 = _763.x;
    float _767 = _763.y;
    float _769 = _763.z;
    float _771 = in.m_53.x;
    float _773 = in.m_53.y;
    float _775 = _172 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _779 = _777 != 0;
    float _781 = in.m_55.y;
    float _783 = _360 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _785 = in.m_55.x;
    float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _791 = _789 != 0;
    float _793 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _797 = _174 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _799 = fma(_330, (*spvDescriptorSet0.vp_c8)._m0[11].x, _783);
    float _801 = 0.0;
    float _803 = _785;
    if (_779)
    {
        float _805 = in.m_53.x;
        _801 = _805;
    }
    float _807 = _801;
    float _809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _813 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[11].z, _799);
    float _815 = _360 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _817 = _646 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _819 = _638 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_57.x = _426;
    out.m_57.y = _424;
    out.m_57.z = _428;
    float _821 = _771 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _823 = _773 > 0.5;
    float _825 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[78].z, _811);
    float _827 = _797 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _829 = -_795;
    float _831 = fma(_821, 2.0, _829);
    float _833 = -_781;
    float _835 = _833 + 1.0;
    float _837 = _773 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _839 = -_126;
    float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[76].x, _831);
    float _843 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[8].x, _827);
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _847 = _781;
    if (_791)
    {
        float _849 = _823 ? _835 : _781;
        _847 = _849;
    }
    float _851 = _847;
    float _853 = _787 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _855 = _797 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _857 = fma(_837, -2.0, _845);
    float _859 = _797 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _861 = _807 > 0.5;
    bool _863 = _861 && _779;
    float _865 = fma(_853, _851, -0.5);
    float _867 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[9].x, _855);
    float _869 = _853;
    if (!_779)
    {
        _869 = _785;
    }
    float _871 = _869;
    float _873 = fma(_775, (*spvDescriptorSet0.vp_c10)._m0[10].x, _859);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _877 = fma(_330, (*spvDescriptorSet0.vp_c8)._m0[10].x, _815);
    bool _879 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _881 = isnan(0.5);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _887 = _883 || _885;
    float _889 = exp2(_817);
    float _891 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[78].w, _875);
    float _893 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _825);
    float _895 = _871;
    if (_863)
    {
        float _897 = -_785;
        float _899 = _897 + 1.0;
        _803 = _899;
    }
    float _901 = _803;
    float _903 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _857);
    float _905 = _809 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _907 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _891);
    float _909 = in.m_59.w;
    if (_779)
    {
        _895 = _901;
    }
    float _911 = _895;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _915 = -_903;
    float _917 = fma(_907, _865, _915);
    float _919 = _813 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _921 = fma(_905, _911, -0.5);
    float _923 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _925 = fma(_893, _921, _841);
    float _927 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[9].z, _867);
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _935 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[8].z, _843);
    float _937 = fma(_793, (*spvDescriptorSet0.vp_c10)._m0[10].z, _873);
    float _939 = _917 + 0.5;
    float _941 = _925 + 0.5;
    float _943 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = _931 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _947 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[10].z, _877);
    float _949 = fma(_642, (*spvDescriptorSet0.vp_c8)._m0[6].x, _819);
    out.m_61.x = _941;
    out.m_61.y = _939;
    if (_887)
    {
        _480 = 1.0;
    }
    float _951 = _480;
    float _953 = _947 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _955 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[6].z, _949);
    out.m_63.w = _909;
    float _957 = _953 + _919;
    float _959 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[6].w, _955);
    out.m_65.x = _923;
    out.m_65.y = _943;
    out.m_65.z = _945;
    out.m_65.w = _933;
    out.m_67.x = _935;
    out.m_67.y = _927;
    out.m_67.z = _937;
    float _961 = 1.0 / _919;
    float _963 = _957 * _961;
    float _965 = _963 * 0.5;
    float _967 = _951;
    if (!_887)
    {
        float _969 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _971 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _973 = _969 * 0.15915493667125701904296875;
        float _975 = _971 * 0.15915493667125701904296875;
        float _977 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _979 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[30].w, _977);
        float _981 = _973 * 6.283185482025146484375;
        float _983 = cos(_981);
        float _985 = _973 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = 1.0 / _983;
        float _991 = _975 * 6.283185482025146484375;
        float _993 = cos(_991);
        float _995 = _987 * _989;
        float _997 = _975 * 6.283185482025146484375;
        float _999 = sin(_997);
        float _1001 = _993 * _995;
        float _1003 = 1.0 / _979;
        float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1007 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1005;
        float _1009 = 1.0 / _1001;
        float _1011 = 1.0 / _1007;
        float _1013 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1015 = _1003 * _1013;
        float _1017 = _999 * _1009;
        float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1021 = fma(_1017, _1015, _1019);
        float _1023 = _1021 * _1011;
        float _1025 = precise::clamp(_1023, 0.0, 1.0);
        float _1027 = -_1025;
        float _1029 = _1027 + 1.0;
        _967 = _1029;
    }
    float _1031 = _967;
    float _1033 = -_889;
    float _1035 = _1033 + 1.0;
    float _1037 = _684 * 0.5;
    bool _1039 = _1031 > 0.0;
    bool _1041 = isnan(_1031);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan(0.0);
    bool _1047 = _1043 || _1045;
    float _1049 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1051 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1053 = fma(_720, -0.5, _1037);
    float _1055 = _959 + _684;
    float _1057 = _716 + _684;
    float _1059 = _1051 * _748;
    float _1061 = -_1051;
    float _1063 = _1061 + 1.0;
    float _1065 = _1055 * 0.5;
    float _1067 = _759 * _1059;
    float _1069 = _769 * _1059;
    float _1071 = _1057 * 0.5;
    float _1073 = _1049 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1075 = fma(_765, _1067, _753);
    float _1077 = fma(_767, _1067, _755);
    float _1079 = _759 * _1063;
    float _1081 = fma(_759, _1069, _757);
    out.m_69.x = _436;
    out.m_69.y = _432;
    out.m_69.z = _440;
    out.gl_Position.x = _716;
    out.gl_Position.y = _720;
    out.gl_Position.z = _959;
    out.gl_Position.w = _684;
    out.m_71.x = _1071;
    out.m_71.y = _1053;
    out.m_71.z = _1065;
    out.m_71.w = _684;
    out.m_45.x = _1073;
    out.m_73.x = _1075;
    out.m_73.y = _1077;
    out.m_73.z = _1081;
    out.m_73.w = _1079;
    if (_1047)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1083 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1083;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

