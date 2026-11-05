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
    float4 m_63 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_51 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_53 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _98 = as_type<float>(_90);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _954 = as_type<float>(_106);
        out.gl_Position.z = _954;
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
    if (_120)
    {
        float _126 = float(_90);
        _98 = _126;
    }
    float _128 = _98;
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
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1023 = as_type<float>(_142);
        out.gl_Position.z = _1023;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.x;
    float _146 = in.m_49.y;
    float _148 = in.m_49.z;
    float _150 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_51.x;
    float _154 = in.m_51.y;
    float _156 = in.m_51.z;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.w;
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _150;
    if (!_166)
    {
        float _186 = _150 * _150;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_166)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    float _198 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _200 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _202 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _152);
    float _206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _154);
    float _208 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _156);
    float _210 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _212 = _200 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _214 = !_166;
    float _216 = _196;
    float _218 = _168;
    if (!_214)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _150 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _150);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _248;
    }
    float _250 = _216;
    bool _252 = !_166;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _150 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _184 = _272;
    }
    float _274 = _184;
    float _276 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _278 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _212 * _206;
    float _282 = _210 * _204;
    float _284 = fma(_274, _172, _276);
    float _286 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _288 = fma(_274, _170, _278);
    float _290 = _202 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _292 = fma(_284, _168, _178);
    float _294 = fma(_274, _174, _286);
    float _296 = fma(_288, _168, _176);
    float _298 = _280 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _300 = _292 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _302 = fma(_294, _168, _180);
    float _304 = _292 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _306 = _290 * _208;
    float _308 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _300);
    float _310 = _280 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _312 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[10].x, _298);
    float _314 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _304);
    float _316 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].z, _308);
    float _318 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[8].x, _310);
    float _320 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].z, _312);
    float _322 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].z, _314);
    float _324 = _316 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _326 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[8].z, _318);
    float _328 = _280 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _330 = _322 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _332 = _324 + _320;
    float _334 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[9].x, _328);
    float _336 = _330 + _326;
    float _338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _340 = _332 + _338;
    float _342 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[9].z, _334);
    float _344 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _346 = _336 + _344;
    float _348 = _340 * _340;
    float _350 = fma(_346, _346, _348);
    float _352 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _354 = sqrt(_350);
    float _356 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _352);
    float _358 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].z, _356);
    float _360 = _358 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _362 = _360 + _342;
    bool _364 = _354 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _366 = _326;
    float _368 = _332;
    float _370 = _336;
    float _372 = _340;
    float _374 = _302;
    if (!_364)
    {
        _366 = _332;
    }
    float _376 = _366;
    float _378 = _376;
    if (!_364)
    {
        _368 = _362;
    }
    float _380 = _368;
    bool _382 = !_364;
    float _384 = _380;
    if (!_382)
    {
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _388 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _390 = _354 + _388;
        float _392 = rsqrt(_350);
        float _394 = _390 * _386;
        float _396 = _362 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _398 = _394 * 0.15915493667125701904296875;
        float _400 = _398 * 6.283185482025146484375;
        float _402 = cos(_400);
        float _404 = _398 * 6.283185482025146484375;
        float _406 = sin(_404);
        float _408 = _402 + (-1.0);
        float _410 = fma(_406, _396, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _412 = _408 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _414 = _392 * _410;
        float _416 = fma(_362, _402, _412);
        float _418 = fma(_346, _414, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _420 = fma(_340, _414, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _384 = _416;
        _370 = _418;
        _378 = _420;
    }
    float _422 = _384;
    float _424 = _370;
    float _426 = _378;
    float _428 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _430 = _422 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _434 = _424 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _438 = _426 + _436;
    float _440 = _430 * _430;
    float _442 = fma(_434, _434, _440);
    float _444 = fma(_438, _438, _442);
    float _446 = rsqrt(_444);
    float _448 = _446 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _450 = _434 * _448;
    float _452 = _438 * _448;
    float _454 = _450 * _450;
    float _456 = _452 * _452;
    float _458 = _454 + _456;
    float _460 = sqrt(_458);
    bool _462 = _460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _464 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _466 = _460 + _464;
    float _468 = _438;
    float _470 = _466;
    float _472 = _450;
    if (_462)
    {
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _468 = _474;
    }
    float _476 = _468;
    if (_462)
    {
        float _478 = rsqrt(_458);
        _372 = _478;
    }
    float _480 = _372;
    float _482 = _480;
    if (_462)
    {
        float _484 = _466 * _476;
        _470 = _484;
    }
    float _486 = _470;
    if (_462)
    {
        float _488 = _486 * 0.15915493667125701904296875;
        _374 = _488;
    }
    float _490 = _374;
    float _492 = _446;
    float _494 = _490;
    if (_462)
    {
        float _496 = _490 * 6.283185482025146484375;
        float _498 = sin(_496);
        _492 = _498;
    }
    float _500 = _492;
    float _502 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _504 = precise::max(0.0, _502);
    float _506 = _350;
    float _508 = _504;
    float _510 = _502;
    if (_462)
    {
        float _512 = _490 * 6.283185482025146484375;
        float _514 = cos(_512);
        _506 = _514;
    }
    float _516 = _506;
    float _518 = -_448;
    float _520 = -_504;
    float _522 = fma(_430, _518, _520);
    if (_462)
    {
        float _524 = _522 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _508 = _524;
    }
    float _526 = _508;
    float _528 = sqrt(_444);
    float _530 = _526;
    float _532 = _500;
    if (_462)
    {
        float _534 = fma(_500, _526, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _530 = _534;
    }
    float _536 = _530;
    float _538 = _536;
    if (!_462)
    {
        _532 = _452;
    }
    float _540 = _532;
    float _542 = _540;
    if (_462)
    {
        float _544 = _516 + (-1.0);
        _510 = _544;
    }
    float _546 = _510;
    float _548 = _546;
    if (_462)
    {
        float _550 = _480 * _536;
        _218 = _550;
    }
    float _552 = _218;
    if (!_462)
    {
        _482 = _522;
    }
    float _554 = _482;
    float _556 = _554;
    if (_462)
    {
        float _558 = _546 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _494 = _558;
    }
    float _560 = _494;
    if (_462)
    {
        float _562 = _450 * _552;
        _472 = _562;
    }
    float _564 = _472;
    if (!_462)
    {
        _538 = _454;
    }
    float _566 = _538;
    float _568 = _566;
    if (_462)
    {
        float _570 = _452 * _552;
        _542 = _570;
    }
    float _572 = _542;
    if (_462)
    {
        float _574 = fma(_522, _516, _560);
        _556 = _574;
    }
    float _576 = _556;
    if (_462)
    {
        float _578 = _564 * _564;
        _568 = _578;
    }
    float _580 = _568;
    if (!_462)
    {
        _548 = _456;
    }
    float _582 = _548;
    float _584 = _582;
    if (_462)
    {
        float _586 = _572 * _572;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = fma(_576, _576, _580);
    float _592 = _422 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _594 = _590 + _588;
    float _596 = _422 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _598 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _600 = fma(_528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _598);
    float _602 = precise::clamp(_600, 0.0, 1.0);
    float _604 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _606 = rsqrt(_594);
    float _608 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[2].x, _596);
    float _610 = _422 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _612 = -_602;
    float _614 = _612 + 1.0;
    float _616 = _422 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _618 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _608);
    float _620 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[1].x, _610);
    float _622 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[3].x, _592);
    float _624 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[0].x, _616);
    float _626 = _618 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _628 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _620);
    float _630 = abs(_614);
    float _632 = log2(_630);
    float _634 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _624);
    float _636 = _626 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _638 = _628 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _640 = _634 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _642 = _606 * _564;
    float _644 = _638 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _646 = -_636;
    float _648 = fma(_646, _604, 1.0);
    float _650 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[3].z, _622);
    float _652 = _642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _654 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[7].x, _644);
    float _656 = _606 * _576;
    float _658 = _606 * _572;
    float _660 = _650 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _662 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[7].z, _654);
    float _664 = -_652;
    float _666 = fma(_656, (*spvDescriptorSet0.vp_c15)._m0[21].y, _664);
    float _668 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _670 = log2(_648);
    float _672 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[7].w, _662);
    float _674 = -_658;
    float _676 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[21].z, _666);
    float _678 = _638 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _680 = _638 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _682 = fma(_676, -0.5, 0.5);
    float _684 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[4].x, _678);
    float _686 = exp2(_668);
    float _688 = fma(_676, 0.5, 0.5);
    float _690 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[5].x, _680);
    float _692 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[4].z, _684);
    float _694 = _656 + 1.0;
    float _696 = fma(_688, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _698 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[5].z, _690);
    float _700 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[4].w, _692);
    float _702 = 1.0 / _672;
    float _704 = fma(_688, _696, -0.212114393711090087890625);
    float _706 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[5].w, _698);
    float _708 = _670 * 0.693147182464599609375;
    float _710 = fma(_688, _704, 1.570728778839111328125);
    float _712 = _708 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _714 = sqrt(_682);
    float _716 = -_656;
    float _718 = fma(_686, _694, _716);
    float _720 = fma(_718, 0.5, 0.5);
    float _722 = _700 * _702;
    float _724 = _706 * _702;
    float _726 = fma(_722, 0.5, 0.5);
    float _728 = fma(_724, -0.5, 0.5);
    float _730 = _714 * 0.636619746685028076171875;
    float3 _2003 = float3(_726, _728, _712);
    float _732 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2003, float3(0.0), isnan(_2003)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2003, float3(0.0), isnan(_2003)), level(0.0)).x;
    float _734 = -_710;
    float _736 = fma(_730, _734, 1.0);
    float3 _2019 = float3(_726, _728, _712);
    float4 _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2019, float3(0.0), isnan(_2019)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2019, float3(0.0), isnan(_2019)), level(0.0)).xyzw;
    float _741 = _739.x;
    float _743 = _739.y;
    float _745 = _739.z;
    float _747 = _739.w;
    float2 _2036 = float2(_736, _720);
    float3 _751 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2036, float2(0.0), isnan(_2036)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2036, float2(0.0), isnan(_2036)), level(0.0)).xyz;
    float _753 = _751.x;
    float _755 = _751.y;
    float _757 = _751.z;
    float _759 = in.m_53.y;
    float _761 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _763 = _638 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _767 = _765 != 0;
    float _769 = in.m_55.y;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _773 = _771 != 0;
    float _775 = in.m_53.x;
    float _777 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _781 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[6].x, _763);
    float _783 = in.m_57.x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _787 = _722;
    float _789 = _759;
    if (_767)
    {
        float _791 = in.m_55.x;
        _787 = _791;
    }
    float _793 = _787;
    float _795 = exp2(_777);
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _803 = in.m_57.y;
    float _805 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = in.m_57.z;
    bool _811 = _769 > 0.5;
    float _813 = in.m_57.w;
    float _815 = _769;
    float _817 = _775;
    if (_767)
    {
        _815 = _775;
    }
    float _819 = _815;
    out.m_59.x = _783;
    bool _821 = _793 > 0.5;
    bool _823 = _821 && _767;
    float _825 = -_759;
    float _827 = _825 + 1.0;
    out.m_59.y = _803;
    float _829 = _819;
    if (_773)
    {
        float _831 = _811 ? _827 : _759;
        _789 = _831;
    }
    float _833 = _789;
    out.m_59.z = _809;
    float _835 = _833 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_823)
    {
        float _837 = -_819;
        float _839 = _837 + 1.0;
        _829 = _839;
    }
    float _841 = _829;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _845 = _835 * _761;
    out.m_59.w = _813;
    if (_767)
    {
        _817 = _841;
    }
    float _847 = _817;
    float _849 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _853 = _847 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _855 = _785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _857 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _859 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _863 = _853 * _779;
    float _865 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[6].z, _781);
    float _867 = -_795;
    float _869 = _867 + 1.0;
    out.m_61.x = _805;
    out.m_61.y = _807;
    out.m_61.z = _849;
    out.m_61.w = _861;
    float _871 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[6].w, _865);
    out.m_63.x = _855;
    out.m_63.y = _857;
    out.m_63.z = _859;
    float _873 = _871 + _672;
    out.gl_Position.x = _700;
    out.gl_Position.y = _706;
    out.gl_Position.z = _871;
    out.gl_Position.w = _672;
    float _875 = _873 * 0.5;
    out.m_65.x = _863;
    out.m_65.y = _845;
    float _877 = _869 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _875;
    out.m_67.w = _672;
    float _879 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.w = _879;
    float _881 = _877 * _732;
    float _883 = -_877;
    float _885 = _883 + 1.0;
    float _887 = _747 * _881;
    float _889 = _757 * _881;
    float _891 = fma(_753, _887, _741);
    float _893 = fma(_755, _887, _743);
    float _895 = _747 * _885;
    float _897 = fma(_747, _889, _745);
    out.m_45.x = 1.0;
    out.m_71.x = _891;
    out.m_71.y = _893;
    out.m_71.z = _897;
    out.m_71.w = _895;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _98 = as_type<float>(_90);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _954 = as_type<float>(_106);
        out.gl_Position.z = _954;
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
    if (_120)
    {
        float _126 = float(_90);
        _98 = _126;
    }
    float _128 = _98;
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
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1023 = as_type<float>(_142);
        out.gl_Position.z = _1023;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_49.x;
    float _146 = in.m_49.y;
    float _148 = in.m_49.z;
    float _150 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_51.x;
    float _154 = in.m_51.y;
    float _156 = in.m_51.z;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.w;
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _150;
    if (!_166)
    {
        float _186 = _150 * _150;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_166)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    float _198 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _200 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _202 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _152);
    float _206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _154);
    float _208 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _156);
    float _210 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _212 = _200 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _214 = !_166;
    float _216 = _196;
    float _218 = _168;
    if (!_214)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _150 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _150);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _248;
    }
    float _250 = _216;
    bool _252 = !_166;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _150 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _184 = _272;
    }
    float _274 = _184;
    float _276 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _278 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _212 * _206;
    float _282 = _210 * _204;
    float _284 = fma(_274, _172, _276);
    float _286 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _288 = fma(_274, _170, _278);
    float _290 = _202 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _292 = fma(_284, _168, _178);
    float _294 = fma(_274, _174, _286);
    float _296 = fma(_288, _168, _176);
    float _298 = _280 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _300 = _292 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _302 = fma(_294, _168, _180);
    float _304 = _292 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _306 = _290 * _208;
    float _308 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _300);
    float _310 = _280 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _312 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[10].x, _298);
    float _314 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _304);
    float _316 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].z, _308);
    float _318 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[8].x, _310);
    float _320 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].z, _312);
    float _322 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].z, _314);
    float _324 = _316 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _326 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[8].z, _318);
    float _328 = _280 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _330 = _322 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _332 = _324 + _320;
    float _334 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[9].x, _328);
    float _336 = _330 + _326;
    float _338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _340 = _332 + _338;
    float _342 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[9].z, _334);
    float _344 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _346 = _336 + _344;
    float _348 = _340 * _340;
    float _350 = fma(_346, _346, _348);
    float _352 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _354 = sqrt(_350);
    float _356 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _352);
    float _358 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].z, _356);
    float _360 = _358 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _362 = _360 + _342;
    bool _364 = _354 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _366 = _326;
    float _368 = _332;
    float _370 = _336;
    float _372 = _340;
    float _374 = _302;
    if (!_364)
    {
        _366 = _332;
    }
    float _376 = _366;
    float _378 = _376;
    if (!_364)
    {
        _368 = _362;
    }
    float _380 = _368;
    bool _382 = !_364;
    float _384 = _380;
    if (!_382)
    {
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _388 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _390 = _354 + _388;
        float _392 = rsqrt(_350);
        float _394 = _390 * _386;
        float _396 = _362 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _398 = _394 * 0.15915493667125701904296875;
        float _400 = _398 * 6.283185482025146484375;
        float _402 = cos(_400);
        float _404 = _398 * 6.283185482025146484375;
        float _406 = sin(_404);
        float _408 = _402 + (-1.0);
        float _410 = fma(_406, _396, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _412 = _408 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _414 = _392 * _410;
        float _416 = fma(_362, _402, _412);
        float _418 = fma(_346, _414, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _420 = fma(_340, _414, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _384 = _416;
        _370 = _418;
        _378 = _420;
    }
    float _422 = _384;
    float _424 = _370;
    float _426 = _378;
    float _428 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _430 = _422 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _434 = _424 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _438 = _426 + _436;
    float _440 = _430 * _430;
    float _442 = fma(_434, _434, _440);
    float _444 = fma(_438, _438, _442);
    float _446 = rsqrt(_444);
    float _448 = _446 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _450 = _434 * _448;
    float _452 = _438 * _448;
    float _454 = _450 * _450;
    float _456 = _452 * _452;
    float _458 = _454 + _456;
    float _460 = sqrt(_458);
    bool _462 = _460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _464 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _466 = _460 + _464;
    float _468 = _438;
    float _470 = _466;
    float _472 = _450;
    if (_462)
    {
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _468 = _474;
    }
    float _476 = _468;
    if (_462)
    {
        float _478 = rsqrt(_458);
        _372 = _478;
    }
    float _480 = _372;
    float _482 = _480;
    if (_462)
    {
        float _484 = _466 * _476;
        _470 = _484;
    }
    float _486 = _470;
    if (_462)
    {
        float _488 = _486 * 0.15915493667125701904296875;
        _374 = _488;
    }
    float _490 = _374;
    float _492 = _446;
    float _494 = _490;
    if (_462)
    {
        float _496 = _490 * 6.283185482025146484375;
        float _498 = sin(_496);
        _492 = _498;
    }
    float _500 = _492;
    float _502 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _504 = precise::max(0.0, _502);
    float _506 = _350;
    float _508 = _504;
    float _510 = _502;
    if (_462)
    {
        float _512 = _490 * 6.283185482025146484375;
        float _514 = cos(_512);
        _506 = _514;
    }
    float _516 = _506;
    float _518 = -_448;
    float _520 = -_504;
    float _522 = fma(_430, _518, _520);
    if (_462)
    {
        float _524 = _522 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _508 = _524;
    }
    float _526 = _508;
    float _528 = sqrt(_444);
    float _530 = _526;
    float _532 = _500;
    if (_462)
    {
        float _534 = fma(_500, _526, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _530 = _534;
    }
    float _536 = _530;
    float _538 = _536;
    if (!_462)
    {
        _532 = _452;
    }
    float _540 = _532;
    float _542 = _540;
    if (_462)
    {
        float _544 = _516 + (-1.0);
        _510 = _544;
    }
    float _546 = _510;
    float _548 = _546;
    if (_462)
    {
        float _550 = _480 * _536;
        _218 = _550;
    }
    float _552 = _218;
    if (!_462)
    {
        _482 = _522;
    }
    float _554 = _482;
    float _556 = _554;
    if (_462)
    {
        float _558 = _546 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _494 = _558;
    }
    float _560 = _494;
    if (_462)
    {
        float _562 = _450 * _552;
        _472 = _562;
    }
    float _564 = _472;
    if (!_462)
    {
        _538 = _454;
    }
    float _566 = _538;
    float _568 = _566;
    if (_462)
    {
        float _570 = _452 * _552;
        _542 = _570;
    }
    float _572 = _542;
    if (_462)
    {
        float _574 = fma(_522, _516, _560);
        _556 = _574;
    }
    float _576 = _556;
    if (_462)
    {
        float _578 = _564 * _564;
        _568 = _578;
    }
    float _580 = _568;
    if (!_462)
    {
        _548 = _456;
    }
    float _582 = _548;
    float _584 = _582;
    if (_462)
    {
        float _586 = _572 * _572;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = fma(_576, _576, _580);
    float _592 = _422 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _594 = _590 + _588;
    float _596 = _422 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _598 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _600 = fma(_528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _598);
    float _602 = precise::clamp(_600, 0.0, 1.0);
    float _604 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _606 = rsqrt(_594);
    float _608 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[2].x, _596);
    float _610 = _422 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _612 = -_602;
    float _614 = _612 + 1.0;
    float _616 = _422 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _618 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _608);
    float _620 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[1].x, _610);
    float _622 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[3].x, _592);
    float _624 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[0].x, _616);
    float _626 = _618 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _628 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _620);
    float _630 = abs(_614);
    float _632 = log2(_630);
    float _634 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _624);
    float _636 = _626 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _638 = _628 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _640 = _634 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _642 = _606 * _564;
    float _644 = _638 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _646 = -_636;
    float _648 = fma(_646, _604, 1.0);
    float _650 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[3].z, _622);
    float _652 = _642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _654 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[7].x, _644);
    float _656 = _606 * _576;
    float _658 = _606 * _572;
    float _660 = _650 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _662 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[7].z, _654);
    float _664 = -_652;
    float _666 = fma(_656, (*spvDescriptorSet0.vp_c15)._m0[21].y, _664);
    float _668 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _670 = log2(_648);
    float _672 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[7].w, _662);
    float _674 = -_658;
    float _676 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[21].z, _666);
    float _678 = _638 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _680 = _638 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _682 = fma(_676, -0.5, 0.5);
    float _684 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[4].x, _678);
    float _686 = exp2(_668);
    float _688 = fma(_676, 0.5, 0.5);
    float _690 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[5].x, _680);
    float _692 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[4].z, _684);
    float _694 = _656 + 1.0;
    float _696 = fma(_688, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _698 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[5].z, _690);
    float _700 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[4].w, _692);
    float _702 = 1.0 / _672;
    float _704 = fma(_688, _696, -0.212114393711090087890625);
    float _706 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[5].w, _698);
    float _708 = _670 * 0.693147182464599609375;
    float _710 = fma(_688, _704, 1.570728778839111328125);
    float _712 = _708 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _714 = sqrt(_682);
    float _716 = -_656;
    float _718 = fma(_686, _694, _716);
    float _720 = fma(_718, 0.5, 0.5);
    float _722 = _700 * _702;
    float _724 = _706 * _702;
    float _726 = fma(_722, 0.5, 0.5);
    float _728 = fma(_724, -0.5, 0.5);
    float _730 = _714 * 0.636619746685028076171875;
    float3 _2003 = float3(_726, _728, _712);
    float _732 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2003, float3(0.0), isnan(_2003)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2003, float3(0.0), isnan(_2003)), level(0.0)).x;
    float _734 = -_710;
    float _736 = fma(_730, _734, 1.0);
    float3 _2019 = float3(_726, _728, _712);
    float4 _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2019, float3(0.0), isnan(_2019)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2019, float3(0.0), isnan(_2019)), level(0.0)).xyzw;
    float _741 = _739.x;
    float _743 = _739.y;
    float _745 = _739.z;
    float _747 = _739.w;
    float2 _2036 = float2(_736, _720);
    float3 _751 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2036, float2(0.0), isnan(_2036)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2036, float2(0.0), isnan(_2036)), level(0.0)).xyz;
    float _753 = _751.x;
    float _755 = _751.y;
    float _757 = _751.z;
    float _759 = in.m_53.y;
    float _761 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _763 = _638 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _767 = _765 != 0;
    float _769 = in.m_55.y;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _773 = _771 != 0;
    float _775 = in.m_53.x;
    float _777 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _781 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[6].x, _763);
    float _783 = in.m_57.x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _787 = _722;
    float _789 = _759;
    if (_767)
    {
        float _791 = in.m_55.x;
        _787 = _791;
    }
    float _793 = _787;
    float _795 = exp2(_777);
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _803 = in.m_57.y;
    float _805 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = in.m_57.z;
    bool _811 = _769 > 0.5;
    float _813 = in.m_57.w;
    float _815 = _769;
    float _817 = _775;
    if (_767)
    {
        _815 = _775;
    }
    float _819 = _815;
    out.m_59.x = _783;
    bool _821 = _793 > 0.5;
    bool _823 = _821 && _767;
    float _825 = -_759;
    float _827 = _825 + 1.0;
    out.m_59.y = _803;
    float _829 = _819;
    if (_773)
    {
        float _831 = _811 ? _827 : _759;
        _789 = _831;
    }
    float _833 = _789;
    out.m_59.z = _809;
    float _835 = _833 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_823)
    {
        float _837 = -_819;
        float _839 = _837 + 1.0;
        _829 = _839;
    }
    float _841 = _829;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _845 = _835 * _761;
    out.m_59.w = _813;
    if (_767)
    {
        _817 = _841;
    }
    float _847 = _817;
    float _849 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _853 = _847 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _855 = _785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _857 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _859 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _863 = _853 * _779;
    float _865 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[6].z, _781);
    float _867 = -_795;
    float _869 = _867 + 1.0;
    out.m_61.x = _805;
    out.m_61.y = _807;
    out.m_61.z = _849;
    out.m_61.w = _861;
    float _871 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[6].w, _865);
    out.m_63.x = _855;
    out.m_63.y = _857;
    out.m_63.z = _859;
    float _873 = _871 + _672;
    out.gl_Position.x = _700;
    out.gl_Position.y = _706;
    out.gl_Position.z = _871;
    out.gl_Position.w = _672;
    float _875 = _873 * 0.5;
    out.m_65.x = _863;
    out.m_65.y = _845;
    float _877 = _869 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _875;
    out.m_67.w = _672;
    float _879 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.w = _879;
    float _881 = _877 * _732;
    float _883 = -_877;
    float _885 = _883 + 1.0;
    float _887 = _747 * _881;
    float _889 = _757 * _881;
    float _891 = fma(_753, _887, _741);
    float _893 = fma(_755, _887, _743);
    float _895 = _747 * _885;
    float _897 = fma(_747, _889, _745);
    out.m_45.x = 1.0;
    out.m_71.x = _891;
    out.m_71.y = _893;
    out.m_71.z = _897;
    out.m_71.w = _895;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _98 = as_type<float>(_90);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _954 = as_type<float>(_106);
        out.gl_Position.z = _954;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
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
        _98 = _126;
    }
    float _128 = _98;
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
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1023 = as_type<float>(_142);
        out.gl_Position.z = _1023;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.x;
    float _146 = in.m_49.y;
    float _148 = in.m_49.z;
    float _150 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_51.x;
    float _154 = in.m_51.y;
    float _156 = in.m_51.z;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.w;
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _150;
    if (!_166)
    {
        float _186 = _150 * _150;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_166)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    float _198 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _200 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _202 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _152);
    float _206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _154);
    float _208 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _156);
    float _210 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _212 = _200 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _214 = !_166;
    float _216 = _196;
    float _218 = _168;
    if (!_214)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _150 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _150);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _248;
    }
    float _250 = _216;
    bool _252 = !_166;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _150 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _184 = _272;
    }
    float _274 = _184;
    float _276 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _278 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _212 * _206;
    float _282 = _210 * _204;
    float _284 = fma(_274, _172, _276);
    float _286 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _288 = fma(_274, _170, _278);
    float _290 = _202 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _292 = fma(_284, _168, _178);
    float _294 = fma(_274, _174, _286);
    float _296 = fma(_288, _168, _176);
    float _298 = _280 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _300 = _292 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _302 = fma(_294, _168, _180);
    float _304 = _292 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _306 = _290 * _208;
    float _308 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _300);
    float _310 = _280 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _312 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[10].x, _298);
    float _314 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _304);
    float _316 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].z, _308);
    float _318 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[8].x, _310);
    float _320 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].z, _312);
    float _322 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].z, _314);
    float _324 = _316 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _326 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[8].z, _318);
    float _328 = _280 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _330 = _322 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _332 = _324 + _320;
    float _334 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[9].x, _328);
    float _336 = _330 + _326;
    float _338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _340 = _332 + _338;
    float _342 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[9].z, _334);
    float _344 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _346 = _336 + _344;
    float _348 = _340 * _340;
    float _350 = fma(_346, _346, _348);
    float _352 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _354 = sqrt(_350);
    float _356 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _352);
    float _358 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].z, _356);
    float _360 = _358 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _362 = _360 + _342;
    bool _364 = _354 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _366 = _326;
    float _368 = _332;
    float _370 = _336;
    float _372 = _340;
    float _374 = _302;
    if (!_364)
    {
        _366 = _332;
    }
    float _376 = _366;
    float _378 = _376;
    if (!_364)
    {
        _368 = _362;
    }
    float _380 = _368;
    bool _382 = !_364;
    float _384 = _380;
    if (!_382)
    {
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _388 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _390 = _354 + _388;
        float _392 = rsqrt(_350);
        float _394 = _390 * _386;
        float _396 = _362 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _398 = _394 * 0.15915493667125701904296875;
        float _400 = _398 * 6.283185482025146484375;
        float _402 = cos(_400);
        float _404 = _398 * 6.283185482025146484375;
        float _406 = sin(_404);
        float _408 = _402 + (-1.0);
        float _410 = fma(_406, _396, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _412 = _408 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _414 = _392 * _410;
        float _416 = fma(_362, _402, _412);
        float _418 = fma(_346, _414, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _420 = fma(_340, _414, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _384 = _416;
        _370 = _418;
        _378 = _420;
    }
    float _422 = _384;
    float _424 = _370;
    float _426 = _378;
    float _428 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _430 = _422 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _434 = _424 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _438 = _426 + _436;
    float _440 = _430 * _430;
    float _442 = fma(_434, _434, _440);
    float _444 = fma(_438, _438, _442);
    float _446 = rsqrt(_444);
    float _448 = _446 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _450 = _434 * _448;
    float _452 = _438 * _448;
    float _454 = _450 * _450;
    float _456 = _452 * _452;
    float _458 = _454 + _456;
    float _460 = sqrt(_458);
    bool _462 = _460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _464 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _466 = _460 + _464;
    float _468 = _438;
    float _470 = _466;
    float _472 = _450;
    if (_462)
    {
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _468 = _474;
    }
    float _476 = _468;
    if (_462)
    {
        float _478 = rsqrt(_458);
        _372 = _478;
    }
    float _480 = _372;
    float _482 = _480;
    if (_462)
    {
        float _484 = _466 * _476;
        _470 = _484;
    }
    float _486 = _470;
    if (_462)
    {
        float _488 = _486 * 0.15915493667125701904296875;
        _374 = _488;
    }
    float _490 = _374;
    float _492 = _446;
    float _494 = _490;
    if (_462)
    {
        float _496 = _490 * 6.283185482025146484375;
        float _498 = sin(_496);
        _492 = _498;
    }
    float _500 = _492;
    float _502 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _504 = precise::max(0.0, _502);
    float _506 = _350;
    float _508 = _504;
    float _510 = _502;
    if (_462)
    {
        float _512 = _490 * 6.283185482025146484375;
        float _514 = cos(_512);
        _506 = _514;
    }
    float _516 = _506;
    float _518 = -_448;
    float _520 = -_504;
    float _522 = fma(_430, _518, _520);
    if (_462)
    {
        float _524 = _522 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _508 = _524;
    }
    float _526 = _508;
    float _528 = sqrt(_444);
    float _530 = _526;
    float _532 = _500;
    if (_462)
    {
        float _534 = fma(_500, _526, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _530 = _534;
    }
    float _536 = _530;
    float _538 = _536;
    if (!_462)
    {
        _532 = _452;
    }
    float _540 = _532;
    float _542 = _540;
    if (_462)
    {
        float _544 = _516 + (-1.0);
        _510 = _544;
    }
    float _546 = _510;
    float _548 = _546;
    if (_462)
    {
        float _550 = _480 * _536;
        _218 = _550;
    }
    float _552 = _218;
    if (!_462)
    {
        _482 = _522;
    }
    float _554 = _482;
    float _556 = _554;
    if (_462)
    {
        float _558 = _546 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _494 = _558;
    }
    float _560 = _494;
    if (_462)
    {
        float _562 = _450 * _552;
        _472 = _562;
    }
    float _564 = _472;
    if (!_462)
    {
        _538 = _454;
    }
    float _566 = _538;
    float _568 = _566;
    if (_462)
    {
        float _570 = _452 * _552;
        _542 = _570;
    }
    float _572 = _542;
    if (_462)
    {
        float _574 = fma(_522, _516, _560);
        _556 = _574;
    }
    float _576 = _556;
    if (_462)
    {
        float _578 = _564 * _564;
        _568 = _578;
    }
    float _580 = _568;
    if (!_462)
    {
        _548 = _456;
    }
    float _582 = _548;
    float _584 = _582;
    if (_462)
    {
        float _586 = _572 * _572;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = fma(_576, _576, _580);
    float _592 = _422 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _594 = _590 + _588;
    float _596 = _422 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _598 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _600 = fma(_528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _598);
    float _602 = precise::clamp(_600, 0.0, 1.0);
    float _604 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _606 = rsqrt(_594);
    float _608 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[2].x, _596);
    float _610 = _422 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _612 = -_602;
    float _614 = _612 + 1.0;
    float _616 = _422 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _618 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _608);
    float _620 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[1].x, _610);
    float _622 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[3].x, _592);
    float _624 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[0].x, _616);
    float _626 = _618 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _628 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _620);
    float _630 = abs(_614);
    float _632 = log2(_630);
    float _634 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _624);
    float _636 = _626 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _638 = _628 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _640 = _634 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _642 = _606 * _564;
    float _644 = _638 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _646 = -_636;
    float _648 = fma(_646, _604, 1.0);
    float _650 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[3].z, _622);
    float _652 = _642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _654 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[7].x, _644);
    float _656 = _606 * _576;
    float _658 = _606 * _572;
    float _660 = _650 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _662 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[7].z, _654);
    float _664 = -_652;
    float _666 = fma(_656, (*spvDescriptorSet0.vp_c15)._m0[21].y, _664);
    float _668 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _670 = log2(_648);
    float _672 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[7].w, _662);
    float _674 = -_658;
    float _676 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[21].z, _666);
    float _678 = _638 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _680 = _638 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _682 = fma(_676, -0.5, 0.5);
    float _684 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[4].x, _678);
    float _686 = exp2(_668);
    float _688 = fma(_676, 0.5, 0.5);
    float _690 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[5].x, _680);
    float _692 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[4].z, _684);
    float _694 = _656 + 1.0;
    float _696 = fma(_688, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _698 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[5].z, _690);
    float _700 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[4].w, _692);
    float _702 = 1.0 / _672;
    float _704 = fma(_688, _696, -0.212114393711090087890625);
    float _706 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[5].w, _698);
    float _708 = _670 * 0.693147182464599609375;
    float _710 = fma(_688, _704, 1.570728778839111328125);
    float _712 = _708 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _714 = sqrt(_682);
    float _716 = -_656;
    float _718 = fma(_686, _694, _716);
    float _720 = fma(_718, 0.5, 0.5);
    float _722 = _700 * _702;
    float _724 = _706 * _702;
    float _726 = fma(_722, 0.5, 0.5);
    float _728 = fma(_724, -0.5, 0.5);
    float _730 = _714 * 0.636619746685028076171875;
    float3 _2003 = float3(_726, _728, _712);
    float _732 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2003, float3(0.0), isnan(_2003)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2003, float3(0.0), isnan(_2003)), level(0.0)).x;
    float _734 = -_710;
    float _736 = fma(_730, _734, 1.0);
    float3 _2019 = float3(_726, _728, _712);
    float4 _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2019, float3(0.0), isnan(_2019)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2019, float3(0.0), isnan(_2019)), level(0.0)).xyzw;
    float _741 = _739.x;
    float _743 = _739.y;
    float _745 = _739.z;
    float _747 = _739.w;
    float2 _2036 = float2(_736, _720);
    float3 _751 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2036, float2(0.0), isnan(_2036)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2036, float2(0.0), isnan(_2036)), level(0.0)).xyz;
    float _753 = _751.x;
    float _755 = _751.y;
    float _757 = _751.z;
    float _759 = in.m_53.y;
    float _761 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _763 = _638 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _767 = _765 != 0;
    float _769 = in.m_55.y;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _773 = _771 != 0;
    float _775 = in.m_53.x;
    float _777 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _781 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[6].x, _763);
    float _783 = in.m_57.x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _787 = _722;
    float _789 = _759;
    if (_767)
    {
        float _791 = in.m_55.x;
        _787 = _791;
    }
    float _793 = _787;
    float _795 = exp2(_777);
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _803 = in.m_57.y;
    float _805 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _801 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = in.m_57.z;
    bool _811 = _769 > 0.5;
    float _813 = in.m_57.w;
    float _815 = _769;
    float _817 = _775;
    if (_767)
    {
        _815 = _775;
    }
    float _819 = _815;
    out.m_59.x = _783;
    bool _821 = _793 > 0.5;
    bool _823 = _821 && _767;
    float _825 = -_759;
    float _827 = _825 + 1.0;
    out.m_59.y = _803;
    float _829 = _819;
    if (_773)
    {
        float _831 = _811 ? _827 : _759;
        _789 = _831;
    }
    float _833 = _789;
    out.m_59.z = _809;
    float _835 = _833 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_823)
    {
        float _837 = -_819;
        float _839 = _837 + 1.0;
        _829 = _839;
    }
    float _841 = _829;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _845 = _835 * _761;
    out.m_59.w = _813;
    if (_767)
    {
        _817 = _841;
    }
    float _847 = _817;
    float _849 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _853 = _847 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _855 = _785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _857 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _859 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _863 = _853 * _779;
    float _865 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[6].z, _781);
    float _867 = -_795;
    float _869 = _867 + 1.0;
    out.m_61.x = _805;
    out.m_61.y = _807;
    out.m_61.z = _849;
    out.m_61.w = _861;
    float _871 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[6].w, _865);
    out.m_63.x = _855;
    out.m_63.y = _857;
    out.m_63.z = _859;
    float _873 = _871 + _672;
    out.gl_Position.x = _700;
    out.gl_Position.y = _706;
    out.gl_Position.z = _871;
    out.gl_Position.w = _672;
    float _875 = _873 * 0.5;
    out.m_65.x = _863;
    out.m_65.y = _845;
    float _877 = _869 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _875;
    out.m_67.w = _672;
    float _879 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.w = _879;
    float _881 = _877 * _732;
    float _883 = -_877;
    float _885 = _883 + 1.0;
    float _887 = _747 * _881;
    float _889 = _757 * _881;
    float _891 = fma(_753, _887, _741);
    float _893 = fma(_755, _887, _743);
    float _895 = _747 * _885;
    float _897 = fma(_747, _889, _745);
    out.m_45.x = 1.0;
    out.m_71.x = _891;
    out.m_71.y = _893;
    out.m_71.z = _897;
    out.m_71.w = _895;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

