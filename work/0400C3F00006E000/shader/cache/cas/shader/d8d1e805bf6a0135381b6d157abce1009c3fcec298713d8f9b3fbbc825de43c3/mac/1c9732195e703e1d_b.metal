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
    float4 m_59 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_57 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_49 [[attribute(7)]];
    float4 m_53 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1066 = as_type<float>(_104);
        out.gl_Position.z = _1066;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _96 = _124;
    }
    float _126 = _96;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1135 = as_type<float>(_140);
        out.gl_Position.z = _1135;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _146 = in.m_47.x;
    float _148 = in.m_47.y;
    float _150 = in.m_47.z;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = in.m_51.x;
    float _170 = in.m_51.y;
    float _172 = in.m_51.z;
    float _174 = in.m_49.x;
    float _176 = in.m_49.y;
    float _178 = in.m_49.z;
    float _180 = 0.0;
    float _182 = _144;
    if (!_160)
    {
        float _184 = _144 * _144;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_160)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_160;
    float _198 = _194;
    float _200 = _168;
    if (!_196)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _144 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _144);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _230;
    }
    float _232 = _198;
    bool _234 = !_160;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _144 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _182 = _254;
    }
    float _256 = _182;
    float _258 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _170);
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _168);
    float _266 = _258 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _268 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _272 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = _264 * _266;
    float _276 = fma(_256, _148, _268);
    float _278 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _282 = _262 * _270;
    float _284 = fma(_276, _142, _164);
    float _286 = fma(_256, _146, _278);
    float _288 = fma(_256, _150, _280);
    float _290 = _272 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _292 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _294 = fma(_286, _142, _162);
    float _296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _172);
    float _298 = fma(_288, _142, _166);
    float _300 = _282 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _302 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _304 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _292);
    float _306 = _282 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _308 = _296 * _290;
    float _310 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[10].x, _300);
    float _312 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _302);
    float _314 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].z, _304);
    float _316 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[8].x, _306);
    float _318 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[10].z, _310);
    float _320 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _322 = _314 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _324 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[8].z, _316);
    float _326 = _282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _322 + _318;
    float _332 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[9].x, _326);
    float _334 = _328 + _324;
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _338 = _330 + _336;
    float _340 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[9].z, _332);
    float _342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _344 = _334 + _342;
    float _346 = _338 * _338;
    float _348 = fma(_344, _344, _346);
    float _350 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _352 = sqrt(_348);
    float _354 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _350);
    float _356 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].z, _354);
    float _358 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _360 = _358 + _340;
    bool _362 = _352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _364 = _356;
    float _366 = _294;
    float _368 = _330;
    float _370 = _348;
    float _372 = _326;
    if (!_362)
    {
        _364 = _334;
    }
    float _374 = _364;
    float _376 = _374;
    if (!_362)
    {
        _366 = _360;
    }
    float _378 = _366;
    bool _380 = !_362;
    float _382 = _378;
    if (!_380)
    {
        float _384 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _386 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _388 = _352 + _386;
        float _390 = _360 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _392 = rsqrt(_348);
        float _394 = _388 * _384;
        float _396 = _394 * 0.15915493667125701904296875;
        float _398 = _396 * 6.283185482025146484375;
        float _400 = cos(_398);
        float _402 = _396 * 6.283185482025146484375;
        float _404 = sin(_402);
        float _406 = _400 + (-1.0);
        float _408 = _406 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _410 = fma(_404, _390, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _412 = fma(_360, _400, _408);
        float _414 = _392 * _410;
        float _416 = fma(_344, _414, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _418 = fma(_338, _414, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _382 = _412;
        _376 = _416;
        _368 = _418;
    }
    float _420 = _382;
    float _422 = _376;
    float _424 = _368;
    float _426 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _428 = _420 + _426;
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _432 = _422 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _436 = _424 + _434;
    float _438 = _428 * _428;
    float _440 = fma(_432, _432, _438);
    float _442 = fma(_436, _436, _440);
    float _444 = rsqrt(_442);
    float _446 = _444 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _448 = _432 * _446;
    float _450 = _436 * _446;
    float _452 = _448 * _448;
    float _454 = _450 * _450;
    float _456 = _452 + _454;
    float _458 = sqrt(_456);
    bool _460 = _458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _462 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _464 = _458 + _462;
    float _466 = _436;
    float _468 = _464;
    float _470 = _428;
    float _472 = _448;
    if (_460)
    {
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _466 = _474;
    }
    float _476 = _466;
    if (_460)
    {
        float _478 = rsqrt(_456);
        _370 = _478;
    }
    float _480 = _370;
    float _482 = _480;
    if (_460)
    {
        float _484 = _464 * _476;
        _468 = _484;
    }
    float _486 = _468;
    if (_460)
    {
        float _488 = _486 * 0.15915493667125701904296875;
        _372 = _488;
    }
    float _490 = _372;
    float _492 = _476;
    if (_460)
    {
        float _494 = _490 * 6.283185482025146484375;
        float _496 = sin(_494);
        _492 = _496;
    }
    float _498 = _492;
    float _500 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _502 = precise::max(0.0, _500);
    float _504 = _438;
    float _506 = _502;
    if (_460)
    {
        float _508 = _490 * 6.283185482025146484375;
        float _510 = cos(_508);
        _504 = _510;
    }
    float _512 = _504;
    float _514 = -_446;
    float _516 = -_502;
    float _518 = fma(_428, _514, _516);
    if (!_460)
    {
        _470 = _450;
    }
    float _520 = _470;
    float _522 = _520;
    if (_460)
    {
        float _524 = _518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _506 = _524;
    }
    float _526 = _506;
    float _528 = sqrt(_442);
    float _530 = _498;
    float _532 = _526;
    if (_460)
    {
        float _534 = fma(_498, _526, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _530 = _534;
    }
    float _536 = _530;
    float _538 = _536;
    float _540 = _512;
    if (_460)
    {
        float _542 = _512 + (-1.0);
        _532 = _542;
    }
    float _544 = _532;
    float _546 = 0.0;
    float _548 = _544;
    if (_460)
    {
        float _550 = _480 * _536;
        _546 = _550;
    }
    float _552 = _546;
    if (!_460)
    {
        _538 = _518;
    }
    float _554 = _538;
    float _556 = _554;
    if (_460)
    {
        float _558 = _544 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _482 = _558;
    }
    float _560 = _482;
    if (_460)
    {
        float _562 = _448 * _552;
        _472 = _562;
    }
    float _564 = _472;
    if (!_460)
    {
        _548 = _452;
    }
    float _566 = _548;
    float _568 = _566;
    if (_460)
    {
        float _570 = _450 * _552;
        _522 = _570;
    }
    float _572 = _522;
    if (_460)
    {
        float _574 = fma(_518, _512, _560);
        _556 = _574;
    }
    float _576 = _556;
    if (_460)
    {
        float _578 = _564 * _564;
        _568 = _578;
    }
    float _580 = _568;
    if (!_460)
    {
        _540 = _454;
    }
    float _582 = _540;
    float _584 = _582;
    if (_460)
    {
        float _586 = _572 * _572;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = fma(_576, _576, _580);
    float _592 = _420 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _594 = _590 + _588;
    float _596 = _420 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _598 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _600 = fma(_528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _598);
    float _602 = precise::clamp(_600, 0.0, 1.0);
    float _604 = _420 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _606 = rsqrt(_594);
    float _608 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[2].x, _596);
    float _610 = -_602;
    float _612 = _610 + 1.0;
    float _614 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _604);
    float _616 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[3].x, _592);
    float _618 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[2].z, _608);
    float _620 = _420 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _622 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[1].z, _614);
    float _624 = abs(_612);
    float _626 = log2(_624);
    float _628 = _618 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _630 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[0].x, _620);
    float _632 = _622 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _634 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[3].z, _616);
    float _636 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _638 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[0].z, _630);
    float _640 = _628 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _642 = _606 * _564;
    float _644 = _606 * _576;
    float _646 = _638 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _648 = _632 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _650 = _642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _652 = _606 * _572;
    float _654 = _634 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _656 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[7].x, _648);
    float _658 = -_650;
    float _660 = fma(_644, (*spvDescriptorSet0.vp_c15)._m0[21].y, _658);
    float _662 = -_640;
    float _664 = fma(_662, _636, 1.0);
    float _666 = _626 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _668 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[7].z, _656);
    float _670 = -_652;
    float _672 = fma(_670, (*spvDescriptorSet0.vp_c15)._m0[21].z, _660);
    float _674 = _632 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _676 = _632 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _678 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[7].w, _668);
    float _680 = fma(_672, -0.5, 0.5);
    float _682 = log2(_664);
    float _684 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[4].x, _674);
    float _686 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[5].x, _676);
    float _688 = fma(_672, 0.5, 0.5);
    float _690 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[4].z, _684);
    float _692 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[5].z, _686);
    float _694 = _644 + 1.0;
    float _696 = exp2(_666);
    float _698 = fma(_688, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _700 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[4].w, _690);
    float _702 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[5].w, _692);
    float _704 = fma(_688, _698, -0.212114393711090087890625);
    float _706 = 1.0 / _678;
    float _708 = _682 * 0.693147182464599609375;
    float _710 = fma(_688, _704, 1.570728778839111328125);
    float _712 = _708 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _714 = sqrt(_680);
    float _716 = -_644;
    float _718 = fma(_696, _694, _716);
    float _720 = _700 * _706;
    float _722 = _702 * _706;
    float _724 = fma(_718, 0.5, 0.5);
    float _726 = fma(_720, 0.5, 0.5);
    float _728 = fma(_722, -0.5, 0.5);
    float _730 = _714 * 0.636619746685028076171875;
    float3 _2115 = float3(_726, _728, _712);
    float _732 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2115, float3(0.0), isnan(_2115)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2115, float3(0.0), isnan(_2115)), level(0.0)).x;
    float _734 = -_710;
    float _736 = fma(_730, _734, 1.0);
    float3 _2131 = float3(_726, _728, _712);
    float4 _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2131, float3(0.0), isnan(_2131)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2131, float3(0.0), isnan(_2131)), level(0.0)).xyzw;
    float _741 = _739.x;
    float _743 = _739.y;
    float _745 = _739.z;
    float _747 = _739.w;
    float2 _2148 = float2(_736, _724);
    float3 _751 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2148, float2(0.0), isnan(_2148)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2148, float2(0.0), isnan(_2148)), level(0.0)).xyz;
    float _753 = _751.x;
    float _755 = _751.y;
    float _757 = _751.z;
    float _759 = in.m_53.x;
    float _761 = _358 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _763 = _170 != 0.0;
    bool _765 = isnan(_170);
    bool _767 = _763 || _765;
    bool _769 = isnan(0.0);
    bool _771 = _767 || _769;
    float _773 = _358 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _775 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _777 = isnan(0.5);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _783 = _779 || _781;
    float _785 = in.m_53.w;
    bool _787 = _168 == 0.0;
    bool _789 = !_771;
    bool _791 = _787 && _789;
    float _793 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _761);
    float _795 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _773);
    float _797 = _632 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _799 = _172 == 0.0;
    bool _801 = _799 && _791;
    float _803 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _793);
    float _805 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _795);
    out.m_55.x = _422;
    out.m_55.y = _420;
    out.m_55.z = _424;
    float _807 = _803 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _809 = _805 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _811 = 1.0 / _807;
    float _813 = _809 + _807;
    float _815 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _759);
    float _817 = _815 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _819 = in.m_57.x;
    float _821 = in.m_57.y;
    float _823 = in.m_57.z;
    float _825 = _817 * 0.15915493667125701904296875;
    float _827 = _813 * _811;
    float _829 = _827 * 0.5;
    float _831 = _825 * 6.283185482025146484375;
    float _833 = sin(_831);
    float _835 = _821;
    float _837 = _819;
    float _839 = _823;
    float _841 = _785;
    float _843 = _813;
    float _845 = _626;
    if (!_801)
    {
        float _847 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[17].y, _821);
        _835 = _847;
    }
    float _849 = _835;
    if (!_801)
    {
        float _851 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[17].y, _819);
        _837 = _851;
    }
    float _853 = _837;
    if (!_801)
    {
        float _855 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[17].y, _823);
        _839 = _855;
    }
    float _857 = _839;
    if (!_783)
    {
        _200 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _859 = _200;
    float _861 = _849 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _863 = _849 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _865 = _849 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _867 = fma(_833, 0.5, 0.5);
    float _869 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[9].x, _861);
    float _871 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[8].x, _863);
    float _873 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[10].x, _865);
    float _875 = _867 * _785;
    float _877 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[9].z, _869);
    float _879 = _869;
    if (!_783)
    {
        float _881 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _883 = fma(_829, _859, _881);
        _879 = _883;
    }
    float _885 = _879;
    if (!_783)
    {
        _841 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _887 = _841;
    float _889 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[8].z, _871);
    float _891 = _807;
    if (!_783)
    {
        float _893 = 1.0 / _885;
        _891 = _893;
    }
    float _895 = _891;
    if (!_783)
    {
        float _897 = -_887;
        float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _843 = _899;
    }
    float _901 = _843;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _905 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[10].z, _873);
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _909 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[6].x, _797);
    float _911 = _829;
    float _913 = _901;
    if (!_783)
    {
        float _915 = 1.0 / _901;
        _911 = _915;
    }
    float _917 = _911;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _921 = _626 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _925 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _927 = _907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_783)
    {
        _845 = 1.0;
    }
    float _929 = _845;
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _933 = exp2(_921);
    float _935 = _929;
    if (!_783)
    {
        float _937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _939 = -_887;
        float _941 = fma(_895, _937, _939);
        _913 = _941;
    }
    float _943 = _913;
    float _945 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[6].z, _909);
    out.m_59.x = _925;
    out.m_59.y = _927;
    out.m_59.z = _931;
    out.m_59.w = _919;
    if (!_783)
    {
        float _947 = _943 * _917;
        float _949 = precise::clamp(_947, 0.0, 1.0);
        _935 = _949;
    }
    float _951 = _935;
    float _953 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[6].w, _945);
    out.m_61.w = _875;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _959 = _951 > 0.0;
    bool _961 = isnan(_951);
    bool _963 = _959 || _961;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _971 = _951 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _973 = -_933;
    float _975 = _973 + 1.0;
    float _977 = _953 + _678;
    float _979 = _955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _981 = _957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _983 = _975 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _985 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _987 = _977 * 0.5;
    float _989 = -_983;
    float _991 = _989 + 1.0;
    float _993 = _971 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _979;
    out.m_63.y = _981;
    out.m_63.z = _985;
    out.m_65.x = _889;
    out.m_65.y = _877;
    out.m_65.z = _905;
    out.gl_Position.x = _700;
    out.gl_Position.y = _702;
    out.gl_Position.z = _953;
    out.gl_Position.w = _678;
    out.m_67.z = _987;
    out.m_67.w = _678;
    out.m_45.x = _993;
    float _995 = _983 * _732;
    float _997 = _747 * _995;
    float _999 = _757 * _995;
    float _1001 = fma(_753, _997, _741);
    float _1003 = fma(_755, _997, _743);
    float _1005 = _747 * _991;
    float _1007 = fma(_747, _999, _745);
    out.m_69.x = _1001;
    out.m_69.y = _1003;
    out.m_69.z = _1007;
    out.m_69.w = _1005;
    if (_967)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1009 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1009;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1066 = as_type<float>(_104);
        out.gl_Position.z = _1066;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _96 = _124;
    }
    float _126 = _96;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1135 = as_type<float>(_140);
        out.gl_Position.z = _1135;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _146 = in.m_47.x;
    float _148 = in.m_47.y;
    float _150 = in.m_47.z;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = in.m_51.x;
    float _170 = in.m_51.y;
    float _172 = in.m_51.z;
    float _174 = in.m_49.x;
    float _176 = in.m_49.y;
    float _178 = in.m_49.z;
    float _180 = 0.0;
    float _182 = _144;
    if (!_160)
    {
        float _184 = _144 * _144;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_160)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_160;
    float _198 = _194;
    float _200 = _168;
    if (!_196)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _144 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _144);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _230;
    }
    float _232 = _198;
    bool _234 = !_160;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _144 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _182 = _254;
    }
    float _256 = _182;
    float _258 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _170);
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _168);
    float _266 = _258 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _268 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _272 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = _264 * _266;
    float _276 = fma(_256, _148, _268);
    float _278 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _282 = _262 * _270;
    float _284 = fma(_276, _142, _164);
    float _286 = fma(_256, _146, _278);
    float _288 = fma(_256, _150, _280);
    float _290 = _272 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _292 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _294 = fma(_286, _142, _162);
    float _296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _172);
    float _298 = fma(_288, _142, _166);
    float _300 = _282 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _302 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _304 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _292);
    float _306 = _282 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _308 = _296 * _290;
    float _310 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[10].x, _300);
    float _312 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _302);
    float _314 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].z, _304);
    float _316 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[8].x, _306);
    float _318 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[10].z, _310);
    float _320 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _322 = _314 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _324 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[8].z, _316);
    float _326 = _282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _322 + _318;
    float _332 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[9].x, _326);
    float _334 = _328 + _324;
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _338 = _330 + _336;
    float _340 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[9].z, _332);
    float _342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _344 = _334 + _342;
    float _346 = _338 * _338;
    float _348 = fma(_344, _344, _346);
    float _350 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _352 = sqrt(_348);
    float _354 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _350);
    float _356 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].z, _354);
    float _358 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _360 = _358 + _340;
    bool _362 = _352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _364 = _356;
    float _366 = _294;
    float _368 = _330;
    float _370 = _348;
    float _372 = _326;
    if (!_362)
    {
        _364 = _334;
    }
    float _374 = _364;
    float _376 = _374;
    if (!_362)
    {
        _366 = _360;
    }
    float _378 = _366;
    bool _380 = !_362;
    float _382 = _378;
    if (!_380)
    {
        float _384 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _386 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _388 = _352 + _386;
        float _390 = _360 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _392 = rsqrt(_348);
        float _394 = _388 * _384;
        float _396 = _394 * 0.15915493667125701904296875;
        float _398 = _396 * 6.283185482025146484375;
        float _400 = cos(_398);
        float _402 = _396 * 6.283185482025146484375;
        float _404 = sin(_402);
        float _406 = _400 + (-1.0);
        float _408 = _406 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _410 = fma(_404, _390, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _412 = fma(_360, _400, _408);
        float _414 = _392 * _410;
        float _416 = fma(_344, _414, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _418 = fma(_338, _414, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _382 = _412;
        _376 = _416;
        _368 = _418;
    }
    float _420 = _382;
    float _422 = _376;
    float _424 = _368;
    float _426 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _428 = _420 + _426;
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _432 = _422 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _436 = _424 + _434;
    float _438 = _428 * _428;
    float _440 = fma(_432, _432, _438);
    float _442 = fma(_436, _436, _440);
    float _444 = rsqrt(_442);
    float _446 = _444 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _448 = _432 * _446;
    float _450 = _436 * _446;
    float _452 = _448 * _448;
    float _454 = _450 * _450;
    float _456 = _452 + _454;
    float _458 = sqrt(_456);
    bool _460 = _458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _462 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _464 = _458 + _462;
    float _466 = _436;
    float _468 = _464;
    float _470 = _428;
    float _472 = _448;
    if (_460)
    {
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _466 = _474;
    }
    float _476 = _466;
    if (_460)
    {
        float _478 = rsqrt(_456);
        _370 = _478;
    }
    float _480 = _370;
    float _482 = _480;
    if (_460)
    {
        float _484 = _464 * _476;
        _468 = _484;
    }
    float _486 = _468;
    if (_460)
    {
        float _488 = _486 * 0.15915493667125701904296875;
        _372 = _488;
    }
    float _490 = _372;
    float _492 = _476;
    if (_460)
    {
        float _494 = _490 * 6.283185482025146484375;
        float _496 = sin(_494);
        _492 = _496;
    }
    float _498 = _492;
    float _500 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _502 = precise::max(0.0, _500);
    float _504 = _438;
    float _506 = _502;
    if (_460)
    {
        float _508 = _490 * 6.283185482025146484375;
        float _510 = cos(_508);
        _504 = _510;
    }
    float _512 = _504;
    float _514 = -_446;
    float _516 = -_502;
    float _518 = fma(_428, _514, _516);
    if (!_460)
    {
        _470 = _450;
    }
    float _520 = _470;
    float _522 = _520;
    if (_460)
    {
        float _524 = _518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _506 = _524;
    }
    float _526 = _506;
    float _528 = sqrt(_442);
    float _530 = _498;
    float _532 = _526;
    if (_460)
    {
        float _534 = fma(_498, _526, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _530 = _534;
    }
    float _536 = _530;
    float _538 = _536;
    float _540 = _512;
    if (_460)
    {
        float _542 = _512 + (-1.0);
        _532 = _542;
    }
    float _544 = _532;
    float _546 = 0.0;
    float _548 = _544;
    if (_460)
    {
        float _550 = _480 * _536;
        _546 = _550;
    }
    float _552 = _546;
    if (!_460)
    {
        _538 = _518;
    }
    float _554 = _538;
    float _556 = _554;
    if (_460)
    {
        float _558 = _544 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _482 = _558;
    }
    float _560 = _482;
    if (_460)
    {
        float _562 = _448 * _552;
        _472 = _562;
    }
    float _564 = _472;
    if (!_460)
    {
        _548 = _452;
    }
    float _566 = _548;
    float _568 = _566;
    if (_460)
    {
        float _570 = _450 * _552;
        _522 = _570;
    }
    float _572 = _522;
    if (_460)
    {
        float _574 = fma(_518, _512, _560);
        _556 = _574;
    }
    float _576 = _556;
    if (_460)
    {
        float _578 = _564 * _564;
        _568 = _578;
    }
    float _580 = _568;
    if (!_460)
    {
        _540 = _454;
    }
    float _582 = _540;
    float _584 = _582;
    if (_460)
    {
        float _586 = _572 * _572;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = fma(_576, _576, _580);
    float _592 = _420 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _594 = _590 + _588;
    float _596 = _420 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _598 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _600 = fma(_528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _598);
    float _602 = precise::clamp(_600, 0.0, 1.0);
    float _604 = _420 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _606 = rsqrt(_594);
    float _608 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[2].x, _596);
    float _610 = -_602;
    float _612 = _610 + 1.0;
    float _614 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _604);
    float _616 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[3].x, _592);
    float _618 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[2].z, _608);
    float _620 = _420 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _622 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[1].z, _614);
    float _624 = abs(_612);
    float _626 = log2(_624);
    float _628 = _618 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _630 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[0].x, _620);
    float _632 = _622 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _634 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[3].z, _616);
    float _636 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _638 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[0].z, _630);
    float _640 = _628 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _642 = _606 * _564;
    float _644 = _606 * _576;
    float _646 = _638 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _648 = _632 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _650 = _642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _652 = _606 * _572;
    float _654 = _634 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _656 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[7].x, _648);
    float _658 = -_650;
    float _660 = fma(_644, (*spvDescriptorSet0.vp_c15)._m0[21].y, _658);
    float _662 = -_640;
    float _664 = fma(_662, _636, 1.0);
    float _666 = _626 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _668 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[7].z, _656);
    float _670 = -_652;
    float _672 = fma(_670, (*spvDescriptorSet0.vp_c15)._m0[21].z, _660);
    float _674 = _632 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _676 = _632 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _678 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[7].w, _668);
    float _680 = fma(_672, -0.5, 0.5);
    float _682 = log2(_664);
    float _684 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[4].x, _674);
    float _686 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[5].x, _676);
    float _688 = fma(_672, 0.5, 0.5);
    float _690 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[4].z, _684);
    float _692 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[5].z, _686);
    float _694 = _644 + 1.0;
    float _696 = exp2(_666);
    float _698 = fma(_688, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _700 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[4].w, _690);
    float _702 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[5].w, _692);
    float _704 = fma(_688, _698, -0.212114393711090087890625);
    float _706 = 1.0 / _678;
    float _708 = _682 * 0.693147182464599609375;
    float _710 = fma(_688, _704, 1.570728778839111328125);
    float _712 = _708 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _714 = sqrt(_680);
    float _716 = -_644;
    float _718 = fma(_696, _694, _716);
    float _720 = _700 * _706;
    float _722 = _702 * _706;
    float _724 = fma(_718, 0.5, 0.5);
    float _726 = fma(_720, 0.5, 0.5);
    float _728 = fma(_722, -0.5, 0.5);
    float _730 = _714 * 0.636619746685028076171875;
    float3 _2115 = float3(_726, _728, _712);
    float _732 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2115, float3(0.0), isnan(_2115)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2115, float3(0.0), isnan(_2115)), level(0.0)).x;
    float _734 = -_710;
    float _736 = fma(_730, _734, 1.0);
    float3 _2131 = float3(_726, _728, _712);
    float4 _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2131, float3(0.0), isnan(_2131)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2131, float3(0.0), isnan(_2131)), level(0.0)).xyzw;
    float _741 = _739.x;
    float _743 = _739.y;
    float _745 = _739.z;
    float _747 = _739.w;
    float2 _2148 = float2(_736, _724);
    float3 _751 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2148, float2(0.0), isnan(_2148)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2148, float2(0.0), isnan(_2148)), level(0.0)).xyz;
    float _753 = _751.x;
    float _755 = _751.y;
    float _757 = _751.z;
    float _759 = in.m_53.x;
    float _761 = _358 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _763 = _170 != 0.0;
    bool _765 = isnan(_170);
    bool _767 = _763 || _765;
    bool _769 = isnan(0.0);
    bool _771 = _767 || _769;
    float _773 = _358 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _775 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _777 = isnan(0.5);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _783 = _779 || _781;
    float _785 = in.m_53.w;
    bool _787 = _168 == 0.0;
    bool _789 = !_771;
    bool _791 = _787 && _789;
    float _793 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _761);
    float _795 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _773);
    float _797 = _632 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _799 = _172 == 0.0;
    bool _801 = _799 && _791;
    float _803 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _793);
    float _805 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _795);
    out.m_55.x = _422;
    out.m_55.y = _420;
    out.m_55.z = _424;
    float _807 = _803 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _809 = _805 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _811 = 1.0 / _807;
    float _813 = _809 + _807;
    float _815 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _759);
    float _817 = _815 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _819 = in.m_57.x;
    float _821 = in.m_57.y;
    float _823 = in.m_57.z;
    float _825 = _817 * 0.15915493667125701904296875;
    float _827 = _813 * _811;
    float _829 = _827 * 0.5;
    float _831 = _825 * 6.283185482025146484375;
    float _833 = sin(_831);
    float _835 = _821;
    float _837 = _819;
    float _839 = _823;
    float _841 = _785;
    float _843 = _813;
    float _845 = _626;
    if (!_801)
    {
        float _847 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[17].y, _821);
        _835 = _847;
    }
    float _849 = _835;
    if (!_801)
    {
        float _851 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[17].y, _819);
        _837 = _851;
    }
    float _853 = _837;
    if (!_801)
    {
        float _855 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[17].y, _823);
        _839 = _855;
    }
    float _857 = _839;
    if (!_783)
    {
        _200 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _859 = _200;
    float _861 = _849 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _863 = _849 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _865 = _849 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _867 = fma(_833, 0.5, 0.5);
    float _869 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[9].x, _861);
    float _871 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[8].x, _863);
    float _873 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[10].x, _865);
    float _875 = _867 * _785;
    float _877 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[9].z, _869);
    float _879 = _869;
    if (!_783)
    {
        float _881 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _883 = fma(_829, _859, _881);
        _879 = _883;
    }
    float _885 = _879;
    if (!_783)
    {
        _841 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _887 = _841;
    float _889 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[8].z, _871);
    float _891 = _807;
    if (!_783)
    {
        float _893 = 1.0 / _885;
        _891 = _893;
    }
    float _895 = _891;
    if (!_783)
    {
        float _897 = -_887;
        float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _843 = _899;
    }
    float _901 = _843;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _905 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[10].z, _873);
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _909 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[6].x, _797);
    float _911 = _829;
    float _913 = _901;
    if (!_783)
    {
        float _915 = 1.0 / _901;
        _911 = _915;
    }
    float _917 = _911;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _921 = _626 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _925 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _927 = _907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_783)
    {
        _845 = 1.0;
    }
    float _929 = _845;
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _933 = exp2(_921);
    float _935 = _929;
    if (!_783)
    {
        float _937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _939 = -_887;
        float _941 = fma(_895, _937, _939);
        _913 = _941;
    }
    float _943 = _913;
    float _945 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[6].z, _909);
    out.m_59.x = _925;
    out.m_59.y = _927;
    out.m_59.z = _931;
    out.m_59.w = _919;
    if (!_783)
    {
        float _947 = _943 * _917;
        float _949 = precise::clamp(_947, 0.0, 1.0);
        _935 = _949;
    }
    float _951 = _935;
    float _953 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[6].w, _945);
    out.m_61.w = _875;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _959 = _951 > 0.0;
    bool _961 = isnan(_951);
    bool _963 = _959 || _961;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _971 = _951 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _973 = -_933;
    float _975 = _973 + 1.0;
    float _977 = _953 + _678;
    float _979 = _955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _981 = _957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _983 = _975 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _985 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _987 = _977 * 0.5;
    float _989 = -_983;
    float _991 = _989 + 1.0;
    float _993 = _971 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _979;
    out.m_63.y = _981;
    out.m_63.z = _985;
    out.m_65.x = _889;
    out.m_65.y = _877;
    out.m_65.z = _905;
    out.gl_Position.x = _700;
    out.gl_Position.y = _702;
    out.gl_Position.z = _953;
    out.gl_Position.w = _678;
    out.m_67.z = _987;
    out.m_67.w = _678;
    out.m_45.x = _993;
    float _995 = _983 * _732;
    float _997 = _747 * _995;
    float _999 = _757 * _995;
    float _1001 = fma(_753, _997, _741);
    float _1003 = fma(_755, _997, _743);
    float _1005 = _747 * _991;
    float _1007 = fma(_747, _999, _745);
    out.m_69.x = _1001;
    out.m_69.y = _1003;
    out.m_69.z = _1007;
    out.m_69.w = _1005;
    if (_967)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1009 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1009;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1066 = as_type<float>(_104);
        out.gl_Position.z = _1066;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _96 = _124;
    }
    float _126 = _96;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1135 = as_type<float>(_140);
        out.gl_Position.z = _1135;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_49.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _146 = in.m_47.x;
    float _148 = in.m_47.y;
    float _150 = in.m_47.z;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = in.m_51.x;
    float _170 = in.m_51.y;
    float _172 = in.m_51.z;
    float _174 = in.m_49.x;
    float _176 = in.m_49.y;
    float _178 = in.m_49.z;
    float _180 = 0.0;
    float _182 = _144;
    if (!_160)
    {
        float _184 = _144 * _144;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_160)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_160;
    float _198 = _194;
    float _200 = _168;
    if (!_196)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _144 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _144);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _230;
    }
    float _232 = _198;
    bool _234 = !_160;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _144 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _182 = _254;
    }
    float _256 = _182;
    float _258 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _170);
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _168);
    float _266 = _258 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _268 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _272 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = _264 * _266;
    float _276 = fma(_256, _148, _268);
    float _278 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _282 = _262 * _270;
    float _284 = fma(_276, _142, _164);
    float _286 = fma(_256, _146, _278);
    float _288 = fma(_256, _150, _280);
    float _290 = _272 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _292 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _294 = fma(_286, _142, _162);
    float _296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _172);
    float _298 = fma(_288, _142, _166);
    float _300 = _282 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _302 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _304 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _292);
    float _306 = _282 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _308 = _296 * _290;
    float _310 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[10].x, _300);
    float _312 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _302);
    float _314 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].z, _304);
    float _316 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[8].x, _306);
    float _318 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[10].z, _310);
    float _320 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _322 = _314 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _324 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[8].z, _316);
    float _326 = _282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _322 + _318;
    float _332 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[9].x, _326);
    float _334 = _328 + _324;
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _338 = _330 + _336;
    float _340 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[9].z, _332);
    float _342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _344 = _334 + _342;
    float _346 = _338 * _338;
    float _348 = fma(_344, _344, _346);
    float _350 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _352 = sqrt(_348);
    float _354 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _350);
    float _356 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].z, _354);
    float _358 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _360 = _358 + _340;
    bool _362 = _352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _364 = _356;
    float _366 = _294;
    float _368 = _330;
    float _370 = _348;
    float _372 = _326;
    if (!_362)
    {
        _364 = _334;
    }
    float _374 = _364;
    float _376 = _374;
    if (!_362)
    {
        _366 = _360;
    }
    float _378 = _366;
    bool _380 = !_362;
    float _382 = _378;
    if (!_380)
    {
        float _384 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _386 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _388 = _352 + _386;
        float _390 = _360 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _392 = rsqrt(_348);
        float _394 = _388 * _384;
        float _396 = _394 * 0.15915493667125701904296875;
        float _398 = _396 * 6.283185482025146484375;
        float _400 = cos(_398);
        float _402 = _396 * 6.283185482025146484375;
        float _404 = sin(_402);
        float _406 = _400 + (-1.0);
        float _408 = _406 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _410 = fma(_404, _390, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _412 = fma(_360, _400, _408);
        float _414 = _392 * _410;
        float _416 = fma(_344, _414, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _418 = fma(_338, _414, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _382 = _412;
        _376 = _416;
        _368 = _418;
    }
    float _420 = _382;
    float _422 = _376;
    float _424 = _368;
    float _426 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _428 = _420 + _426;
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _432 = _422 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _436 = _424 + _434;
    float _438 = _428 * _428;
    float _440 = fma(_432, _432, _438);
    float _442 = fma(_436, _436, _440);
    float _444 = rsqrt(_442);
    float _446 = _444 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _448 = _432 * _446;
    float _450 = _436 * _446;
    float _452 = _448 * _448;
    float _454 = _450 * _450;
    float _456 = _452 + _454;
    float _458 = sqrt(_456);
    bool _460 = _458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _462 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _464 = _458 + _462;
    float _466 = _436;
    float _468 = _464;
    float _470 = _428;
    float _472 = _448;
    if (_460)
    {
        float _474 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _466 = _474;
    }
    float _476 = _466;
    if (_460)
    {
        float _478 = rsqrt(_456);
        _370 = _478;
    }
    float _480 = _370;
    float _482 = _480;
    if (_460)
    {
        float _484 = _464 * _476;
        _468 = _484;
    }
    float _486 = _468;
    if (_460)
    {
        float _488 = _486 * 0.15915493667125701904296875;
        _372 = _488;
    }
    float _490 = _372;
    float _492 = _476;
    if (_460)
    {
        float _494 = _490 * 6.283185482025146484375;
        float _496 = sin(_494);
        _492 = _496;
    }
    float _498 = _492;
    float _500 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _502 = precise::max(0.0, _500);
    float _504 = _438;
    float _506 = _502;
    if (_460)
    {
        float _508 = _490 * 6.283185482025146484375;
        float _510 = cos(_508);
        _504 = _510;
    }
    float _512 = _504;
    float _514 = -_446;
    float _516 = -_502;
    float _518 = fma(_428, _514, _516);
    if (!_460)
    {
        _470 = _450;
    }
    float _520 = _470;
    float _522 = _520;
    if (_460)
    {
        float _524 = _518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _506 = _524;
    }
    float _526 = _506;
    float _528 = sqrt(_442);
    float _530 = _498;
    float _532 = _526;
    if (_460)
    {
        float _534 = fma(_498, _526, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _530 = _534;
    }
    float _536 = _530;
    float _538 = _536;
    float _540 = _512;
    if (_460)
    {
        float _542 = _512 + (-1.0);
        _532 = _542;
    }
    float _544 = _532;
    float _546 = 0.0;
    float _548 = _544;
    if (_460)
    {
        float _550 = _480 * _536;
        _546 = _550;
    }
    float _552 = _546;
    if (!_460)
    {
        _538 = _518;
    }
    float _554 = _538;
    float _556 = _554;
    if (_460)
    {
        float _558 = _544 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _482 = _558;
    }
    float _560 = _482;
    if (_460)
    {
        float _562 = _448 * _552;
        _472 = _562;
    }
    float _564 = _472;
    if (!_460)
    {
        _548 = _452;
    }
    float _566 = _548;
    float _568 = _566;
    if (_460)
    {
        float _570 = _450 * _552;
        _522 = _570;
    }
    float _572 = _522;
    if (_460)
    {
        float _574 = fma(_518, _512, _560);
        _556 = _574;
    }
    float _576 = _556;
    if (_460)
    {
        float _578 = _564 * _564;
        _568 = _578;
    }
    float _580 = _568;
    if (!_460)
    {
        _540 = _454;
    }
    float _582 = _540;
    float _584 = _582;
    if (_460)
    {
        float _586 = _572 * _572;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = fma(_576, _576, _580);
    float _592 = _420 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _594 = _590 + _588;
    float _596 = _420 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _598 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _600 = fma(_528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _598);
    float _602 = precise::clamp(_600, 0.0, 1.0);
    float _604 = _420 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _606 = rsqrt(_594);
    float _608 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[2].x, _596);
    float _610 = -_602;
    float _612 = _610 + 1.0;
    float _614 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[1].x, _604);
    float _616 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[3].x, _592);
    float _618 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[2].z, _608);
    float _620 = _420 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _622 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[1].z, _614);
    float _624 = abs(_612);
    float _626 = log2(_624);
    float _628 = _618 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _630 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[0].x, _620);
    float _632 = _622 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _634 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[3].z, _616);
    float _636 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _638 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[0].z, _630);
    float _640 = _628 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _642 = _606 * _564;
    float _644 = _606 * _576;
    float _646 = _638 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _648 = _632 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _650 = _642 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _652 = _606 * _572;
    float _654 = _634 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _656 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[7].x, _648);
    float _658 = -_650;
    float _660 = fma(_644, (*spvDescriptorSet0.vp_c15)._m0[21].y, _658);
    float _662 = -_640;
    float _664 = fma(_662, _636, 1.0);
    float _666 = _626 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _668 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[7].z, _656);
    float _670 = -_652;
    float _672 = fma(_670, (*spvDescriptorSet0.vp_c15)._m0[21].z, _660);
    float _674 = _632 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _676 = _632 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _678 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[7].w, _668);
    float _680 = fma(_672, -0.5, 0.5);
    float _682 = log2(_664);
    float _684 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[4].x, _674);
    float _686 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[5].x, _676);
    float _688 = fma(_672, 0.5, 0.5);
    float _690 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[4].z, _684);
    float _692 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[5].z, _686);
    float _694 = _644 + 1.0;
    float _696 = exp2(_666);
    float _698 = fma(_688, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _700 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[4].w, _690);
    float _702 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[5].w, _692);
    float _704 = fma(_688, _698, -0.212114393711090087890625);
    float _706 = 1.0 / _678;
    float _708 = _682 * 0.693147182464599609375;
    float _710 = fma(_688, _704, 1.570728778839111328125);
    float _712 = _708 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _714 = sqrt(_680);
    float _716 = -_644;
    float _718 = fma(_696, _694, _716);
    float _720 = _700 * _706;
    float _722 = _702 * _706;
    float _724 = fma(_718, 0.5, 0.5);
    float _726 = fma(_720, 0.5, 0.5);
    float _728 = fma(_722, -0.5, 0.5);
    float _730 = _714 * 0.636619746685028076171875;
    float3 _2115 = float3(_726, _728, _712);
    float _732 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2115, float3(0.0), isnan(_2115)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2115, float3(0.0), isnan(_2115)), level(0.0)).x;
    float _734 = -_710;
    float _736 = fma(_730, _734, 1.0);
    float3 _2131 = float3(_726, _728, _712);
    float4 _739 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2131, float3(0.0), isnan(_2131)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2131, float3(0.0), isnan(_2131)), level(0.0)).xyzw;
    float _741 = _739.x;
    float _743 = _739.y;
    float _745 = _739.z;
    float _747 = _739.w;
    float2 _2148 = float2(_736, _724);
    float3 _751 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2148, float2(0.0), isnan(_2148)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2148, float2(0.0), isnan(_2148)), level(0.0)).xyz;
    float _753 = _751.x;
    float _755 = _751.y;
    float _757 = _751.z;
    float _759 = in.m_53.x;
    float _761 = _358 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _763 = _170 != 0.0;
    bool _765 = isnan(_170);
    bool _767 = _763 || _765;
    bool _769 = isnan(0.0);
    bool _771 = _767 || _769;
    float _773 = _358 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _775 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _777 = isnan(0.5);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _783 = _779 || _781;
    float _785 = in.m_53.w;
    bool _787 = _168 == 0.0;
    bool _789 = !_771;
    bool _791 = _787 && _789;
    float _793 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _761);
    float _795 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _773);
    float _797 = _632 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _799 = _172 == 0.0;
    bool _801 = _799 && _791;
    float _803 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _793);
    float _805 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _795);
    out.m_55.x = _422;
    out.m_55.y = _420;
    out.m_55.z = _424;
    float _807 = _803 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _809 = _805 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _811 = 1.0 / _807;
    float _813 = _809 + _807;
    float _815 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _759);
    float _817 = _815 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _819 = in.m_57.x;
    float _821 = in.m_57.y;
    float _823 = in.m_57.z;
    float _825 = _817 * 0.15915493667125701904296875;
    float _827 = _813 * _811;
    float _829 = _827 * 0.5;
    float _831 = _825 * 6.283185482025146484375;
    float _833 = sin(_831);
    float _835 = _821;
    float _837 = _819;
    float _839 = _823;
    float _841 = _785;
    float _843 = _813;
    float _845 = _626;
    if (!_801)
    {
        float _847 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[17].y, _821);
        _835 = _847;
    }
    float _849 = _835;
    if (!_801)
    {
        float _851 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[17].y, _819);
        _837 = _851;
    }
    float _853 = _837;
    if (!_801)
    {
        float _855 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[17].y, _823);
        _839 = _855;
    }
    float _857 = _839;
    if (!_783)
    {
        _200 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _859 = _200;
    float _861 = _849 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _863 = _849 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _865 = _849 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _867 = fma(_833, 0.5, 0.5);
    float _869 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[9].x, _861);
    float _871 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[8].x, _863);
    float _873 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[10].x, _865);
    float _875 = _867 * _785;
    float _877 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[9].z, _869);
    float _879 = _869;
    if (!_783)
    {
        float _881 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _883 = fma(_829, _859, _881);
        _879 = _883;
    }
    float _885 = _879;
    if (!_783)
    {
        _841 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _887 = _841;
    float _889 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[8].z, _871);
    float _891 = _807;
    if (!_783)
    {
        float _893 = 1.0 / _885;
        _891 = _893;
    }
    float _895 = _891;
    if (!_783)
    {
        float _897 = -_887;
        float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _843 = _899;
    }
    float _901 = _843;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _905 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[10].z, _873);
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _909 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[6].x, _797);
    float _911 = _829;
    float _913 = _901;
    if (!_783)
    {
        float _915 = 1.0 / _901;
        _911 = _915;
    }
    float _917 = _911;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _921 = _626 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _925 = _903 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _927 = _907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_783)
    {
        _845 = 1.0;
    }
    float _929 = _845;
    float _931 = _923 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _933 = exp2(_921);
    float _935 = _929;
    if (!_783)
    {
        float _937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _939 = -_887;
        float _941 = fma(_895, _937, _939);
        _913 = _941;
    }
    float _943 = _913;
    float _945 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[6].z, _909);
    out.m_59.x = _925;
    out.m_59.y = _927;
    out.m_59.z = _931;
    out.m_59.w = _919;
    if (!_783)
    {
        float _947 = _943 * _917;
        float _949 = precise::clamp(_947, 0.0, 1.0);
        _935 = _949;
    }
    float _951 = _935;
    float _953 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[6].w, _945);
    out.m_61.w = _875;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _959 = _951 > 0.0;
    bool _961 = isnan(_951);
    bool _963 = _959 || _961;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _971 = _951 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _973 = -_933;
    float _975 = _973 + 1.0;
    float _977 = _953 + _678;
    float _979 = _955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _981 = _957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _983 = _975 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _985 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _987 = _977 * 0.5;
    float _989 = -_983;
    float _991 = _989 + 1.0;
    float _993 = _971 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _979;
    out.m_63.y = _981;
    out.m_63.z = _985;
    out.m_65.x = _889;
    out.m_65.y = _877;
    out.m_65.z = _905;
    out.gl_Position.x = _700;
    out.gl_Position.y = _702;
    out.gl_Position.z = _953;
    out.gl_Position.w = _678;
    out.m_67.z = _987;
    out.m_67.w = _678;
    out.m_45.x = _993;
    float _995 = _983 * _732;
    float _997 = _747 * _995;
    float _999 = _757 * _995;
    float _1001 = fma(_753, _997, _741);
    float _1003 = fma(_755, _997, _743);
    float _1005 = _747 * _991;
    float _1007 = fma(_747, _999, _745);
    out.m_69.x = _1001;
    out.m_69.y = _1003;
    out.m_69.z = _1007;
    out.m_69.w = _1005;
    if (_967)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1009 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1009;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

