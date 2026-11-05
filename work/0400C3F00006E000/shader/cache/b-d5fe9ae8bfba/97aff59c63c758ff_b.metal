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
    float4 m_57 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_49 [[attribute(7)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _102 = _100;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_94)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1146 = as_type<float>(_108);
        out.gl_Position.z = _1146;
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
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    if (_136)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _98;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    int _140 = 0;
    if (_136)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1215 = as_type<float>(_144);
        out.gl_Position.z = _1215;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_51.y;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_51.x;
    float _164 = in.m_51.z;
    float _166 = in.m_47.x;
    float _168 = in.m_47.y;
    float _170 = in.m_47.z;
    float _172 = _148;
    if (!_160)
    {
        float _174 = _148 * _148;
        float _176 = _174 * 0.5;
        _126 = _176;
    }
    float _178 = _126;
    float _180 = in.m_42.x;
    float _182 = in.m_42.y;
    float _184 = in.m_42.z;
    float _186 = _178;
    if (!_160)
    {
        float _188 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    float _192 = in.m_49.x;
    float _194 = in.m_49.y;
    float _196 = in.m_49.z;
    bool _198 = !_160;
    float _200 = _190;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _148 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _148);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_160;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _148 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _172 = _254;
    }
    float _256 = _172;
    float _258 = _192 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = _194 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _162);
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _150);
    float _266 = _258 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _268 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _272 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = _262 * _266;
    float _276 = fma(_256, _168, _268);
    float _278 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _282 = _264 * _270;
    float _284 = fma(_276, _146, _182);
    float _286 = fma(_256, _166, _278);
    float _288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _164);
    float _290 = _272 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _292 = fma(_256, _170, _280);
    float _294 = fma(_286, _146, _180);
    float _296 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _298 = _288 * _290;
    float _300 = fma(_292, _146, _184);
    float _302 = _282 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _304 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _306 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _296);
    float _308 = _282 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _310 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[10].x, _302);
    float _312 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _304);
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _306);
    float _316 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[8].x, _308);
    float _318 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].z, _310);
    float _320 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _322 = _314 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _324 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[8].z, _316);
    float _326 = _282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _322 + _318;
    float _332 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[9].x, _326);
    float _334 = _328 + _324;
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _338 = _330 + _336;
    float _340 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[9].z, _332);
    float _342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _344 = _334 + _342;
    float _346 = _338 * _338;
    float _348 = fma(_344, _344, _346);
    float _350 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _352 = sqrt(_348);
    float _354 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _350);
    float _356 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _354);
    float _358 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _360 = _358 + _340;
    bool _362 = _352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _364 = _340;
    float _366 = _298;
    float _368 = _274;
    float _370 = _330;
    float _372 = _344;
    float _374 = _282;
    if (!_362)
    {
        _364 = _334;
    }
    float _376 = _364;
    float _378 = _376;
    if (!_362)
    {
        _366 = _330;
    }
    float _380 = _366;
    float _382 = _380;
    if (!_362)
    {
        _368 = _360;
    }
    float _384 = _368;
    bool _386 = !_362;
    float _388 = _384;
    if (!_386)
    {
        float _390 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _392 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _394 = _352 + _392;
        float _396 = rsqrt(_348);
        float _398 = _394 * _390;
        float _400 = _360 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _402 = _398 * 0.15915493667125701904296875;
        float _404 = _402 * 6.283185482025146484375;
        float _406 = sin(_404);
        float _408 = _402 * 6.283185482025146484375;
        float _410 = cos(_408);
        float _412 = fma(_406, _400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _414 = _396 * _412;
        float _416 = _410 + (-1.0);
        float _418 = fma(_344, _414, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _420 = fma(_338, _414, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _422 = _416 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _424 = fma(_360, _410, _422);
        _388 = _424;
        _378 = _418;
        _382 = _420;
    }
    float _426 = _388;
    float _428 = _378;
    float _430 = _382;
    float _432 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _434 = _426 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _438 = _428 + _436;
    float _440 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _442 = _430 + _440;
    float _444 = _434 * _434;
    float _446 = fma(_438, _438, _444);
    float _448 = fma(_442, _442, _446);
    float _450 = rsqrt(_448);
    float _452 = sqrt(_448);
    float _454 = _450 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _456 = _438 * _454;
    float _458 = _442 * _454;
    float _460 = _456 * _456;
    float _462 = _458 * _458;
    float _464 = _460 + _462;
    float _466 = sqrt(_464);
    bool _468 = _466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _472 = _466 + _470;
    float _474 = _334;
    float _476 = _472;
    if (_468)
    {
        float _478 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _474 = _478;
    }
    float _480 = _474;
    if (_468)
    {
        float _482 = rsqrt(_464);
        _370 = _482;
    }
    float _484 = _370;
    float _486 = _484;
    if (_468)
    {
        float _488 = _472 * _480;
        _476 = _488;
    }
    float _490 = _476;
    if (_468)
    {
        float _492 = _490 * 0.15915493667125701904296875;
        _372 = _492;
    }
    float _494 = _372;
    float _496 = _284;
    if (_468)
    {
        float _498 = _494 * 6.283185482025146484375;
        float _500 = sin(_498);
        _496 = _500;
    }
    float _502 = _496;
    float _504 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _506 = precise::max(0.0, _504);
    float _508 = _360;
    float _510 = _504;
    float _512 = _506;
    if (_468)
    {
        float _514 = _494 * 6.283185482025146484375;
        float _516 = cos(_514);
        _508 = _516;
    }
    float _518 = _508;
    if (!_468)
    {
        _510 = _456;
    }
    float _520 = _510;
    float _522 = -_454;
    float _524 = -_506;
    float _526 = fma(_434, _522, _524);
    float _528 = _520;
    if (_468)
    {
        float _530 = _526 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _512 = _530;
    }
    float _532 = _512;
    float _534 = _502;
    float _536 = _532;
    if (_468)
    {
        float _538 = fma(_502, _532, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _374 = _538;
    }
    float _540 = _374;
    float _542 = _540;
    if (!_468)
    {
        _534 = _526;
    }
    float _544 = _534;
    float _546 = _544;
    float _548 = _518;
    if (_468)
    {
        float _550 = _518 + (-1.0);
        _536 = _550;
    }
    float _552 = _536;
    float _554 = _552;
    if (_468)
    {
        float _556 = _484 * _540;
        _542 = _556;
    }
    float _558 = _542;
    if (_468)
    {
        float _560 = _552 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _486 = _560;
    }
    float _562 = _486;
    float _564 = _562;
    if (_468)
    {
        float _566 = _456 * _558;
        _528 = _566;
    }
    float _568 = _528;
    if (!_468)
    {
        _554 = _458;
    }
    float _570 = _554;
    float _572 = _570;
    if (_468)
    {
        float _574 = _458 * _558;
        _572 = _574;
    }
    float _576 = _572;
    if (_468)
    {
        float _578 = fma(_526, _518, _562);
        _546 = _578;
    }
    float _580 = _546;
    if (!_468)
    {
        _548 = _460;
    }
    float _582 = _548;
    float _584 = _582;
    if (_468)
    {
        float _586 = _568 * _568;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = _426 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _592 = _426 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _594 = _426 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_468)
    {
        _564 = _462;
    }
    float _596 = _564;
    float _598 = _426 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _600 = _596;
    if (_468)
    {
        float _602 = _576 * _576;
        _600 = _602;
    }
    float _604 = _600;
    float _606 = fma(_580, _580, _588);
    float _608 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[0].x, _590);
    float _610 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[1].x, _592);
    float _612 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[2].x, _594);
    float _614 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[3].x, _598);
    float _616 = _606 + _604;
    float _618 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[1].z, _610);
    float _620 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _622 = fma(_452, (*spvDescriptorSet0.vp_c15)._m0[23].w, _620);
    float _624 = precise::clamp(_622, 0.0, 1.0);
    float _626 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[0].z, _608);
    float _628 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[2].z, _612);
    float _630 = _618 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _632 = rsqrt(_616);
    float _634 = -_624;
    float _636 = _634 + 1.0;
    float _638 = _626 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _640 = _630 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _642 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[3].z, _614);
    float _644 = _628 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _646 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _648 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[7].x, _640);
    float _650 = abs(_636);
    float _652 = log2(_650);
    float _654 = _642 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _656 = _644 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _658 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[7].z, _648);
    float _660 = -_656;
    float _662 = fma(_660, _646, 1.0);
    float _664 = _632 * _568;
    float _666 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[7].w, _658);
    float _668 = _632 * _580;
    float _670 = _632 * _576;
    float _672 = _664 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _674 = log2(_662);
    float _676 = _630 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _678 = -_672;
    float _680 = fma(_668, (*spvDescriptorSet0.vp_c15)._m0[21].y, _678);
    float _682 = _652 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _684 = -_670;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c15)._m0[21].z, _680);
    float _688 = 1.0 / _666;
    float _690 = _630 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _692 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[5].x, _676);
    float _694 = fma(_686, -0.5, 0.5);
    float _696 = fma(_686, 0.5, 0.5);
    float _698 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[4].x, _690);
    float _700 = _668 + 1.0;
    float _702 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[5].z, _692);
    float _704 = exp2(_682);
    float _706 = fma(_696, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _708 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[4].z, _698);
    float _710 = _674 * 0.693147182464599609375;
    float _712 = fma(_696, _706, -0.212114393711090087890625);
    float _714 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[4].w, _708);
    float _716 = sqrt(_694);
    float _718 = fma(_696, _712, 1.570728778839111328125);
    float _720 = _714 * _688;
    float _722 = fma(_720, 0.5, 0.5);
    float _724 = -_668;
    float _726 = fma(_704, _700, _724);
    float _728 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[5].w, _702);
    float _730 = _710 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _732 = _728 * _688;
    float _734 = fma(_726, 0.5, 0.5);
    float _736 = _716 * 0.636619746685028076171875;
    float _738 = fma(_732, -0.5, 0.5);
    float _740 = -_718;
    float _742 = fma(_736, _740, 1.0);
    float3 _2214 = float3(_722, _738, _730);
    float _744 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2214, float3(0.0), isnan(_2214)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2214, float3(0.0), isnan(_2214)), level(0.0)).x;
    float3 _2225 = float3(_722, _738, _730);
    float4 _747 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2225, float3(0.0), isnan(_2225)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2225, float3(0.0), isnan(_2225)), level(0.0)).xyzw;
    float _749 = _747.x;
    float _751 = _747.y;
    float _753 = _747.z;
    float _755 = _747.w;
    float2 _2242 = float2(_742, _734);
    float3 _759 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2242, float2(0.0), isnan(_2242)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2242, float2(0.0), isnan(_2242)), level(0.0)).xyz;
    float _761 = _759.x;
    float _763 = _759.y;
    float _765 = _759.z;
    float _767 = in.m_53.x;
    float _769 = in.m_53.y;
    float _771 = in.m_53.z;
    bool _773 = _150 != 0.0;
    bool _775 = isnan(_150);
    bool _777 = _773 || _775;
    bool _779 = isnan(0.0);
    bool _781 = _777 || _779;
    float _783 = _652 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _785 = _162 == 0.0;
    bool _787 = !_781;
    bool _789 = _785 && _787;
    float _791 = _358 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _793 = _164 == 0.0;
    bool _795 = _793 && _789;
    float _797 = _358 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _799 = exp2(_783);
    float _801 = _769;
    float _803 = _767;
    float _805 = _771;
    if (!_795)
    {
        float _807 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[17].y, _769);
        _801 = _807;
    }
    float _809 = _801;
    if (!_795)
    {
        float _811 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[17].y, _767);
        _803 = _811;
    }
    float _813 = _803;
    if (!_795)
    {
        float _815 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[17].y, _771);
        _805 = _815;
    }
    float _817 = _805;
    bool _819 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _821 = isnan(0.5);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _827 = _823 || _825;
    float _829 = _809 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _831 = _809 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _833 = _809 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _835 = fma(_813, (*spvDescriptorSet0.vp_c10)._m0[9].x, _829);
    float _837 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _791);
    float _839 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _797);
    float _841 = fma(_813, (*spvDescriptorSet0.vp_c10)._m0[8].x, _831);
    float _843 = fma(_813, (*spvDescriptorSet0.vp_c10)._m0[10].x, _833);
    float _845 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _837);
    float _847 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _839);
    float _849 = fma(_817, (*spvDescriptorSet0.vp_c10)._m0[8].z, _841);
    float _851 = _845 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _853 = _847 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _855 = fma(_817, (*spvDescriptorSet0.vp_c10)._m0[9].z, _835);
    float _857 = _851 + _853;
    float _859 = fma(_817, (*spvDescriptorSet0.vp_c10)._m0[10].z, _843);
    float _861 = 1.0 / _853;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _875 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _849;
    out.m_55.y = _855;
    out.m_55.z = _859;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _883 = _869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = _857 * _861;
    float _887 = _885 * 0.5;
    out.m_57.x = _875;
    out.m_57.y = _877;
    out.m_57.z = _879;
    out.m_57.w = _873;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _891 = _871 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _895 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[30].w, _893);
    float _897 = in.m_59.w;
    float _899 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _901 = _630 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _903 = 1.0 / _895;
    out.m_61.x = _899;
    out.m_61.y = _883;
    out.m_61.z = _891;
    out.m_61.w = _881;
    float _905 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[6].x, _901);
    float _907 = _901;
    float _909 = _899;
    if (_827)
    {
        _907 = 1.0;
    }
    float _911 = _907;
    float _913 = _911;
    if (_827)
    {
        _909 = 1.0;
    }
    float _915 = _909;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _919 = _903 * _917;
    float _921 = _915;
    if (!_827)
    {
        float _923 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _925 = _923 * 0.15915493667125701904296875;
        float _927 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _929 = _925 * 6.283185482025146484375;
        float _931 = cos(_929);
        float _933 = _927 * 0.15915493667125701904296875;
        float _935 = _925 * 6.283185482025146484375;
        float _937 = sin(_935);
        float _939 = 1.0 / _931;
        float _941 = _933 * 6.283185482025146484375;
        float _943 = cos(_941);
        float _945 = _937 * _939;
        float _947 = _933 * 6.283185482025146484375;
        float _949 = sin(_947);
        float _951 = _943 * _945;
        float _953 = 1.0 / _951;
        float _955 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _957 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _955;
        float _959 = 1.0 / _957;
        float _961 = _949 * _953;
        float _963 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _965 = fma(_919, _961, _963);
        float _967 = _965 * _959;
        float _969 = precise::clamp(_967, 0.0, 1.0);
        _913 = _969;
    }
    float _971 = _913;
    if (!_827)
    {
        float _973 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _975 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _977 = _973 * 0.15915493667125701904296875;
        float _979 = _975 * 0.15915493667125701904296875;
        float _981 = _977 * 6.283185482025146484375;
        float _983 = cos(_981);
        float _985 = _977 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = 1.0 / _983;
        float _991 = _979 * 6.283185482025146484375;
        float _993 = cos(_991);
        float _995 = _987 * _989;
        float _997 = _979 * 6.283185482025146484375;
        float _999 = sin(_997);
        float _1001 = _993 * _995;
        float _1003 = 1.0 / _1001;
        float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1007 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1005;
        float _1009 = 1.0 / _1007;
        float _1011 = _999 * _1003;
        float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1015 = fma(_919, _1011, _1013);
        float _1017 = _1015 * _1009;
        float _1019 = precise::clamp(_1017, 0.0, 1.0);
        float _1021 = -_1019;
        float _1023 = _1021 + 1.0;
        _921 = _1023;
    }
    float _1025 = _921;
    float _1027 = _971 * _1025;
    float _1029 = -_799;
    float _1031 = _1029 + 1.0;
    float _1033 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[6].z, _905);
    bool _1035 = _971 > 0.0;
    bool _1037 = isnan(_971);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan(0.0);
    bool _1043 = _1039 || _1041;
    float _1045 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1047 = _1031 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1049 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1033);
    bool _1051 = _1025 <= 0.0;
    bool _1053 = !_1043;
    bool _1055 = _1051 || _1053;
    float _1057 = _1045 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1059 = _666 * 0.5;
    float _1061 = _1047 * _744;
    out.m_63.z = _164;
    float _1063 = _1049 + _666;
    float _1065 = fma(_728, -0.5, _1059);
    float _1067 = _714 + _666;
    float _1069 = _765 * _1061;
    float _1071 = -_1047;
    float _1073 = _1071 + 1.0;
    out.m_63.y = _150;
    float _1075 = _755 * _1061;
    float _1077 = _1063 * 0.5;
    out.m_65.x = _438;
    out.m_65.y = _434;
    out.m_65.z = _442;
    float _1079 = _1067 * 0.5;
    float _1081 = fma(_761, _1075, _749);
    float _1083 = fma(_763, _1075, _751);
    float _1085 = _755 * _1073;
    float _1087 = fma(_755, _1069, _753);
    out.m_63.x = _162;
    out.m_67.w = _897;
    out.m_45.x = _1057;
    out.gl_Position.x = _714;
    out.gl_Position.y = _728;
    out.gl_Position.z = _1049;
    out.gl_Position.w = _666;
    out.m_69.x = _1079;
    out.m_69.y = _1065;
    out.m_69.z = _1077;
    out.m_69.w = _666;
    out.m_71.x = _1081;
    out.m_71.y = _1083;
    out.m_71.z = _1087;
    out.m_71.w = _1085;
    if (!_1055)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1089 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1089;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _102 = _100;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_94)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1146 = as_type<float>(_108);
        out.gl_Position.z = _1146;
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
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    if (_136)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _98;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    int _140 = 0;
    if (_136)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1215 = as_type<float>(_144);
        out.gl_Position.z = _1215;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_51.y;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_51.x;
    float _164 = in.m_51.z;
    float _166 = in.m_47.x;
    float _168 = in.m_47.y;
    float _170 = in.m_47.z;
    float _172 = _148;
    if (!_160)
    {
        float _174 = _148 * _148;
        float _176 = _174 * 0.5;
        _126 = _176;
    }
    float _178 = _126;
    float _180 = in.m_42.x;
    float _182 = in.m_42.y;
    float _184 = in.m_42.z;
    float _186 = _178;
    if (!_160)
    {
        float _188 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    float _192 = in.m_49.x;
    float _194 = in.m_49.y;
    float _196 = in.m_49.z;
    bool _198 = !_160;
    float _200 = _190;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _148 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _148);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_160;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _148 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _172 = _254;
    }
    float _256 = _172;
    float _258 = _192 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = _194 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _162);
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _150);
    float _266 = _258 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _268 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _272 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = _262 * _266;
    float _276 = fma(_256, _168, _268);
    float _278 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _282 = _264 * _270;
    float _284 = fma(_276, _146, _182);
    float _286 = fma(_256, _166, _278);
    float _288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _164);
    float _290 = _272 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _292 = fma(_256, _170, _280);
    float _294 = fma(_286, _146, _180);
    float _296 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _298 = _288 * _290;
    float _300 = fma(_292, _146, _184);
    float _302 = _282 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _304 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _306 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _296);
    float _308 = _282 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _310 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[10].x, _302);
    float _312 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _304);
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _306);
    float _316 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[8].x, _308);
    float _318 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].z, _310);
    float _320 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _322 = _314 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _324 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[8].z, _316);
    float _326 = _282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _322 + _318;
    float _332 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[9].x, _326);
    float _334 = _328 + _324;
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _338 = _330 + _336;
    float _340 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[9].z, _332);
    float _342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _344 = _334 + _342;
    float _346 = _338 * _338;
    float _348 = fma(_344, _344, _346);
    float _350 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _352 = sqrt(_348);
    float _354 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _350);
    float _356 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _354);
    float _358 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _360 = _358 + _340;
    bool _362 = _352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _364 = _340;
    float _366 = _298;
    float _368 = _274;
    float _370 = _330;
    float _372 = _344;
    float _374 = _282;
    if (!_362)
    {
        _364 = _334;
    }
    float _376 = _364;
    float _378 = _376;
    if (!_362)
    {
        _366 = _330;
    }
    float _380 = _366;
    float _382 = _380;
    if (!_362)
    {
        _368 = _360;
    }
    float _384 = _368;
    bool _386 = !_362;
    float _388 = _384;
    if (!_386)
    {
        float _390 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _392 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _394 = _352 + _392;
        float _396 = rsqrt(_348);
        float _398 = _394 * _390;
        float _400 = _360 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _402 = _398 * 0.15915493667125701904296875;
        float _404 = _402 * 6.283185482025146484375;
        float _406 = sin(_404);
        float _408 = _402 * 6.283185482025146484375;
        float _410 = cos(_408);
        float _412 = fma(_406, _400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _414 = _396 * _412;
        float _416 = _410 + (-1.0);
        float _418 = fma(_344, _414, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _420 = fma(_338, _414, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _422 = _416 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _424 = fma(_360, _410, _422);
        _388 = _424;
        _378 = _418;
        _382 = _420;
    }
    float _426 = _388;
    float _428 = _378;
    float _430 = _382;
    float _432 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _434 = _426 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _438 = _428 + _436;
    float _440 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _442 = _430 + _440;
    float _444 = _434 * _434;
    float _446 = fma(_438, _438, _444);
    float _448 = fma(_442, _442, _446);
    float _450 = rsqrt(_448);
    float _452 = sqrt(_448);
    float _454 = _450 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _456 = _438 * _454;
    float _458 = _442 * _454;
    float _460 = _456 * _456;
    float _462 = _458 * _458;
    float _464 = _460 + _462;
    float _466 = sqrt(_464);
    bool _468 = _466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _472 = _466 + _470;
    float _474 = _334;
    float _476 = _472;
    if (_468)
    {
        float _478 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _474 = _478;
    }
    float _480 = _474;
    if (_468)
    {
        float _482 = rsqrt(_464);
        _370 = _482;
    }
    float _484 = _370;
    float _486 = _484;
    if (_468)
    {
        float _488 = _472 * _480;
        _476 = _488;
    }
    float _490 = _476;
    if (_468)
    {
        float _492 = _490 * 0.15915493667125701904296875;
        _372 = _492;
    }
    float _494 = _372;
    float _496 = _284;
    if (_468)
    {
        float _498 = _494 * 6.283185482025146484375;
        float _500 = sin(_498);
        _496 = _500;
    }
    float _502 = _496;
    float _504 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _506 = precise::max(0.0, _504);
    float _508 = _360;
    float _510 = _504;
    float _512 = _506;
    if (_468)
    {
        float _514 = _494 * 6.283185482025146484375;
        float _516 = cos(_514);
        _508 = _516;
    }
    float _518 = _508;
    if (!_468)
    {
        _510 = _456;
    }
    float _520 = _510;
    float _522 = -_454;
    float _524 = -_506;
    float _526 = fma(_434, _522, _524);
    float _528 = _520;
    if (_468)
    {
        float _530 = _526 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _512 = _530;
    }
    float _532 = _512;
    float _534 = _502;
    float _536 = _532;
    if (_468)
    {
        float _538 = fma(_502, _532, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _374 = _538;
    }
    float _540 = _374;
    float _542 = _540;
    if (!_468)
    {
        _534 = _526;
    }
    float _544 = _534;
    float _546 = _544;
    float _548 = _518;
    if (_468)
    {
        float _550 = _518 + (-1.0);
        _536 = _550;
    }
    float _552 = _536;
    float _554 = _552;
    if (_468)
    {
        float _556 = _484 * _540;
        _542 = _556;
    }
    float _558 = _542;
    if (_468)
    {
        float _560 = _552 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _486 = _560;
    }
    float _562 = _486;
    float _564 = _562;
    if (_468)
    {
        float _566 = _456 * _558;
        _528 = _566;
    }
    float _568 = _528;
    if (!_468)
    {
        _554 = _458;
    }
    float _570 = _554;
    float _572 = _570;
    if (_468)
    {
        float _574 = _458 * _558;
        _572 = _574;
    }
    float _576 = _572;
    if (_468)
    {
        float _578 = fma(_526, _518, _562);
        _546 = _578;
    }
    float _580 = _546;
    if (!_468)
    {
        _548 = _460;
    }
    float _582 = _548;
    float _584 = _582;
    if (_468)
    {
        float _586 = _568 * _568;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = _426 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _592 = _426 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _594 = _426 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_468)
    {
        _564 = _462;
    }
    float _596 = _564;
    float _598 = _426 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _600 = _596;
    if (_468)
    {
        float _602 = _576 * _576;
        _600 = _602;
    }
    float _604 = _600;
    float _606 = fma(_580, _580, _588);
    float _608 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[0].x, _590);
    float _610 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[1].x, _592);
    float _612 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[2].x, _594);
    float _614 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[3].x, _598);
    float _616 = _606 + _604;
    float _618 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[1].z, _610);
    float _620 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _622 = fma(_452, (*spvDescriptorSet0.vp_c15)._m0[23].w, _620);
    float _624 = precise::clamp(_622, 0.0, 1.0);
    float _626 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[0].z, _608);
    float _628 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[2].z, _612);
    float _630 = _618 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _632 = rsqrt(_616);
    float _634 = -_624;
    float _636 = _634 + 1.0;
    float _638 = _626 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _640 = _630 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _642 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[3].z, _614);
    float _644 = _628 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _646 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _648 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[7].x, _640);
    float _650 = abs(_636);
    float _652 = log2(_650);
    float _654 = _642 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _656 = _644 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _658 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[7].z, _648);
    float _660 = -_656;
    float _662 = fma(_660, _646, 1.0);
    float _664 = _632 * _568;
    float _666 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[7].w, _658);
    float _668 = _632 * _580;
    float _670 = _632 * _576;
    float _672 = _664 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _674 = log2(_662);
    float _676 = _630 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _678 = -_672;
    float _680 = fma(_668, (*spvDescriptorSet0.vp_c15)._m0[21].y, _678);
    float _682 = _652 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _684 = -_670;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c15)._m0[21].z, _680);
    float _688 = 1.0 / _666;
    float _690 = _630 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _692 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[5].x, _676);
    float _694 = fma(_686, -0.5, 0.5);
    float _696 = fma(_686, 0.5, 0.5);
    float _698 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[4].x, _690);
    float _700 = _668 + 1.0;
    float _702 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[5].z, _692);
    float _704 = exp2(_682);
    float _706 = fma(_696, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _708 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[4].z, _698);
    float _710 = _674 * 0.693147182464599609375;
    float _712 = fma(_696, _706, -0.212114393711090087890625);
    float _714 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[4].w, _708);
    float _716 = sqrt(_694);
    float _718 = fma(_696, _712, 1.570728778839111328125);
    float _720 = _714 * _688;
    float _722 = fma(_720, 0.5, 0.5);
    float _724 = -_668;
    float _726 = fma(_704, _700, _724);
    float _728 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[5].w, _702);
    float _730 = _710 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _732 = _728 * _688;
    float _734 = fma(_726, 0.5, 0.5);
    float _736 = _716 * 0.636619746685028076171875;
    float _738 = fma(_732, -0.5, 0.5);
    float _740 = -_718;
    float _742 = fma(_736, _740, 1.0);
    float3 _2214 = float3(_722, _738, _730);
    float _744 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2214, float3(0.0), isnan(_2214)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2214, float3(0.0), isnan(_2214)), level(0.0)).x;
    float3 _2225 = float3(_722, _738, _730);
    float4 _747 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2225, float3(0.0), isnan(_2225)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2225, float3(0.0), isnan(_2225)), level(0.0)).xyzw;
    float _749 = _747.x;
    float _751 = _747.y;
    float _753 = _747.z;
    float _755 = _747.w;
    float2 _2242 = float2(_742, _734);
    float3 _759 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2242, float2(0.0), isnan(_2242)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2242, float2(0.0), isnan(_2242)), level(0.0)).xyz;
    float _761 = _759.x;
    float _763 = _759.y;
    float _765 = _759.z;
    float _767 = in.m_53.x;
    float _769 = in.m_53.y;
    float _771 = in.m_53.z;
    bool _773 = _150 != 0.0;
    bool _775 = isnan(_150);
    bool _777 = _773 || _775;
    bool _779 = isnan(0.0);
    bool _781 = _777 || _779;
    float _783 = _652 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _785 = _162 == 0.0;
    bool _787 = !_781;
    bool _789 = _785 && _787;
    float _791 = _358 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _793 = _164 == 0.0;
    bool _795 = _793 && _789;
    float _797 = _358 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _799 = exp2(_783);
    float _801 = _769;
    float _803 = _767;
    float _805 = _771;
    if (!_795)
    {
        float _807 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[17].y, _769);
        _801 = _807;
    }
    float _809 = _801;
    if (!_795)
    {
        float _811 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[17].y, _767);
        _803 = _811;
    }
    float _813 = _803;
    if (!_795)
    {
        float _815 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[17].y, _771);
        _805 = _815;
    }
    float _817 = _805;
    bool _819 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _821 = isnan(0.5);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _827 = _823 || _825;
    float _829 = _809 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _831 = _809 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _833 = _809 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _835 = fma(_813, (*spvDescriptorSet0.vp_c10)._m0[9].x, _829);
    float _837 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _791);
    float _839 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _797);
    float _841 = fma(_813, (*spvDescriptorSet0.vp_c10)._m0[8].x, _831);
    float _843 = fma(_813, (*spvDescriptorSet0.vp_c10)._m0[10].x, _833);
    float _845 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _837);
    float _847 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _839);
    float _849 = fma(_817, (*spvDescriptorSet0.vp_c10)._m0[8].z, _841);
    float _851 = _845 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _853 = _847 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _855 = fma(_817, (*spvDescriptorSet0.vp_c10)._m0[9].z, _835);
    float _857 = _851 + _853;
    float _859 = fma(_817, (*spvDescriptorSet0.vp_c10)._m0[10].z, _843);
    float _861 = 1.0 / _853;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _875 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _849;
    out.m_55.y = _855;
    out.m_55.z = _859;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _883 = _869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = _857 * _861;
    float _887 = _885 * 0.5;
    out.m_57.x = _875;
    out.m_57.y = _877;
    out.m_57.z = _879;
    out.m_57.w = _873;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _891 = _871 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _895 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[30].w, _893);
    float _897 = in.m_59.w;
    float _899 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _901 = _630 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _903 = 1.0 / _895;
    out.m_61.x = _899;
    out.m_61.y = _883;
    out.m_61.z = _891;
    out.m_61.w = _881;
    float _905 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[6].x, _901);
    float _907 = _901;
    float _909 = _899;
    if (_827)
    {
        _907 = 1.0;
    }
    float _911 = _907;
    float _913 = _911;
    if (_827)
    {
        _909 = 1.0;
    }
    float _915 = _909;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _919 = _903 * _917;
    float _921 = _915;
    if (!_827)
    {
        float _923 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _925 = _923 * 0.15915493667125701904296875;
        float _927 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _929 = _925 * 6.283185482025146484375;
        float _931 = cos(_929);
        float _933 = _927 * 0.15915493667125701904296875;
        float _935 = _925 * 6.283185482025146484375;
        float _937 = sin(_935);
        float _939 = 1.0 / _931;
        float _941 = _933 * 6.283185482025146484375;
        float _943 = cos(_941);
        float _945 = _937 * _939;
        float _947 = _933 * 6.283185482025146484375;
        float _949 = sin(_947);
        float _951 = _943 * _945;
        float _953 = 1.0 / _951;
        float _955 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _957 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _955;
        float _959 = 1.0 / _957;
        float _961 = _949 * _953;
        float _963 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _965 = fma(_919, _961, _963);
        float _967 = _965 * _959;
        float _969 = precise::clamp(_967, 0.0, 1.0);
        _913 = _969;
    }
    float _971 = _913;
    if (!_827)
    {
        float _973 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _975 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _977 = _973 * 0.15915493667125701904296875;
        float _979 = _975 * 0.15915493667125701904296875;
        float _981 = _977 * 6.283185482025146484375;
        float _983 = cos(_981);
        float _985 = _977 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = 1.0 / _983;
        float _991 = _979 * 6.283185482025146484375;
        float _993 = cos(_991);
        float _995 = _987 * _989;
        float _997 = _979 * 6.283185482025146484375;
        float _999 = sin(_997);
        float _1001 = _993 * _995;
        float _1003 = 1.0 / _1001;
        float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1007 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1005;
        float _1009 = 1.0 / _1007;
        float _1011 = _999 * _1003;
        float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1015 = fma(_919, _1011, _1013);
        float _1017 = _1015 * _1009;
        float _1019 = precise::clamp(_1017, 0.0, 1.0);
        float _1021 = -_1019;
        float _1023 = _1021 + 1.0;
        _921 = _1023;
    }
    float _1025 = _921;
    float _1027 = _971 * _1025;
    float _1029 = -_799;
    float _1031 = _1029 + 1.0;
    float _1033 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[6].z, _905);
    bool _1035 = _971 > 0.0;
    bool _1037 = isnan(_971);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan(0.0);
    bool _1043 = _1039 || _1041;
    float _1045 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1047 = _1031 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1049 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1033);
    bool _1051 = _1025 <= 0.0;
    bool _1053 = !_1043;
    bool _1055 = _1051 || _1053;
    float _1057 = _1045 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1059 = _666 * 0.5;
    float _1061 = _1047 * _744;
    out.m_63.z = _164;
    float _1063 = _1049 + _666;
    float _1065 = fma(_728, -0.5, _1059);
    float _1067 = _714 + _666;
    float _1069 = _765 * _1061;
    float _1071 = -_1047;
    float _1073 = _1071 + 1.0;
    out.m_63.y = _150;
    float _1075 = _755 * _1061;
    float _1077 = _1063 * 0.5;
    out.m_65.x = _438;
    out.m_65.y = _434;
    out.m_65.z = _442;
    float _1079 = _1067 * 0.5;
    float _1081 = fma(_761, _1075, _749);
    float _1083 = fma(_763, _1075, _751);
    float _1085 = _755 * _1073;
    float _1087 = fma(_755, _1069, _753);
    out.m_63.x = _162;
    out.m_67.w = _897;
    out.m_45.x = _1057;
    out.gl_Position.x = _714;
    out.gl_Position.y = _728;
    out.gl_Position.z = _1049;
    out.gl_Position.w = _666;
    out.m_69.x = _1079;
    out.m_69.y = _1065;
    out.m_69.z = _1077;
    out.m_69.w = _666;
    out.m_71.x = _1081;
    out.m_71.y = _1083;
    out.m_71.z = _1087;
    out.m_71.w = _1085;
    if (!_1055)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1089 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1089;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _102 = _100;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_94)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1146 = as_type<float>(_108);
        out.gl_Position.z = _1146;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    if (_136)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _98;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    int _140 = 0;
    if (_136)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1215 = as_type<float>(_144);
        out.gl_Position.z = _1215;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_51.y;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_51.x;
    float _164 = in.m_51.z;
    float _166 = in.m_47.x;
    float _168 = in.m_47.y;
    float _170 = in.m_47.z;
    float _172 = _148;
    if (!_160)
    {
        float _174 = _148 * _148;
        float _176 = _174 * 0.5;
        _126 = _176;
    }
    float _178 = _126;
    float _180 = in.m_42.x;
    float _182 = in.m_42.y;
    float _184 = in.m_42.z;
    float _186 = _178;
    if (!_160)
    {
        float _188 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    float _192 = in.m_49.x;
    float _194 = in.m_49.y;
    float _196 = in.m_49.z;
    bool _198 = !_160;
    float _200 = _190;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _148 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _148);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_160;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _148 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _172 = _254;
    }
    float _256 = _172;
    float _258 = _192 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = _194 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _162);
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _150);
    float _266 = _258 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _268 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _272 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = _262 * _266;
    float _276 = fma(_256, _168, _268);
    float _278 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _282 = _264 * _270;
    float _284 = fma(_276, _146, _182);
    float _286 = fma(_256, _166, _278);
    float _288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _164);
    float _290 = _272 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _292 = fma(_256, _170, _280);
    float _294 = fma(_286, _146, _180);
    float _296 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _298 = _288 * _290;
    float _300 = fma(_292, _146, _184);
    float _302 = _282 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _304 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _306 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _296);
    float _308 = _282 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _310 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[10].x, _302);
    float _312 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _304);
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _306);
    float _316 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[8].x, _308);
    float _318 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[10].z, _310);
    float _320 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _322 = _314 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _324 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[8].z, _316);
    float _326 = _282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _322 + _318;
    float _332 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[9].x, _326);
    float _334 = _328 + _324;
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _338 = _330 + _336;
    float _340 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[9].z, _332);
    float _342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _344 = _334 + _342;
    float _346 = _338 * _338;
    float _348 = fma(_344, _344, _346);
    float _350 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _352 = sqrt(_348);
    float _354 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _350);
    float _356 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _354);
    float _358 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _360 = _358 + _340;
    bool _362 = _352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _364 = _340;
    float _366 = _298;
    float _368 = _274;
    float _370 = _330;
    float _372 = _344;
    float _374 = _282;
    if (!_362)
    {
        _364 = _334;
    }
    float _376 = _364;
    float _378 = _376;
    if (!_362)
    {
        _366 = _330;
    }
    float _380 = _366;
    float _382 = _380;
    if (!_362)
    {
        _368 = _360;
    }
    float _384 = _368;
    bool _386 = !_362;
    float _388 = _384;
    if (!_386)
    {
        float _390 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _392 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _394 = _352 + _392;
        float _396 = rsqrt(_348);
        float _398 = _394 * _390;
        float _400 = _360 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _402 = _398 * 0.15915493667125701904296875;
        float _404 = _402 * 6.283185482025146484375;
        float _406 = sin(_404);
        float _408 = _402 * 6.283185482025146484375;
        float _410 = cos(_408);
        float _412 = fma(_406, _400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _414 = _396 * _412;
        float _416 = _410 + (-1.0);
        float _418 = fma(_344, _414, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _420 = fma(_338, _414, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _422 = _416 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _424 = fma(_360, _410, _422);
        _388 = _424;
        _378 = _418;
        _382 = _420;
    }
    float _426 = _388;
    float _428 = _378;
    float _430 = _382;
    float _432 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _434 = _426 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _438 = _428 + _436;
    float _440 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _442 = _430 + _440;
    float _444 = _434 * _434;
    float _446 = fma(_438, _438, _444);
    float _448 = fma(_442, _442, _446);
    float _450 = rsqrt(_448);
    float _452 = sqrt(_448);
    float _454 = _450 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _456 = _438 * _454;
    float _458 = _442 * _454;
    float _460 = _456 * _456;
    float _462 = _458 * _458;
    float _464 = _460 + _462;
    float _466 = sqrt(_464);
    bool _468 = _466 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _472 = _466 + _470;
    float _474 = _334;
    float _476 = _472;
    if (_468)
    {
        float _478 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _474 = _478;
    }
    float _480 = _474;
    if (_468)
    {
        float _482 = rsqrt(_464);
        _370 = _482;
    }
    float _484 = _370;
    float _486 = _484;
    if (_468)
    {
        float _488 = _472 * _480;
        _476 = _488;
    }
    float _490 = _476;
    if (_468)
    {
        float _492 = _490 * 0.15915493667125701904296875;
        _372 = _492;
    }
    float _494 = _372;
    float _496 = _284;
    if (_468)
    {
        float _498 = _494 * 6.283185482025146484375;
        float _500 = sin(_498);
        _496 = _500;
    }
    float _502 = _496;
    float _504 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _506 = precise::max(0.0, _504);
    float _508 = _360;
    float _510 = _504;
    float _512 = _506;
    if (_468)
    {
        float _514 = _494 * 6.283185482025146484375;
        float _516 = cos(_514);
        _508 = _516;
    }
    float _518 = _508;
    if (!_468)
    {
        _510 = _456;
    }
    float _520 = _510;
    float _522 = -_454;
    float _524 = -_506;
    float _526 = fma(_434, _522, _524);
    float _528 = _520;
    if (_468)
    {
        float _530 = _526 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _512 = _530;
    }
    float _532 = _512;
    float _534 = _502;
    float _536 = _532;
    if (_468)
    {
        float _538 = fma(_502, _532, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _374 = _538;
    }
    float _540 = _374;
    float _542 = _540;
    if (!_468)
    {
        _534 = _526;
    }
    float _544 = _534;
    float _546 = _544;
    float _548 = _518;
    if (_468)
    {
        float _550 = _518 + (-1.0);
        _536 = _550;
    }
    float _552 = _536;
    float _554 = _552;
    if (_468)
    {
        float _556 = _484 * _540;
        _542 = _556;
    }
    float _558 = _542;
    if (_468)
    {
        float _560 = _552 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _486 = _560;
    }
    float _562 = _486;
    float _564 = _562;
    if (_468)
    {
        float _566 = _456 * _558;
        _528 = _566;
    }
    float _568 = _528;
    if (!_468)
    {
        _554 = _458;
    }
    float _570 = _554;
    float _572 = _570;
    if (_468)
    {
        float _574 = _458 * _558;
        _572 = _574;
    }
    float _576 = _572;
    if (_468)
    {
        float _578 = fma(_526, _518, _562);
        _546 = _578;
    }
    float _580 = _546;
    if (!_468)
    {
        _548 = _460;
    }
    float _582 = _548;
    float _584 = _582;
    if (_468)
    {
        float _586 = _568 * _568;
        _584 = _586;
    }
    float _588 = _584;
    float _590 = _426 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _592 = _426 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _594 = _426 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_468)
    {
        _564 = _462;
    }
    float _596 = _564;
    float _598 = _426 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _600 = _596;
    if (_468)
    {
        float _602 = _576 * _576;
        _600 = _602;
    }
    float _604 = _600;
    float _606 = fma(_580, _580, _588);
    float _608 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[0].x, _590);
    float _610 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[1].x, _592);
    float _612 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[2].x, _594);
    float _614 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[3].x, _598);
    float _616 = _606 + _604;
    float _618 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[1].z, _610);
    float _620 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _622 = fma(_452, (*spvDescriptorSet0.vp_c15)._m0[23].w, _620);
    float _624 = precise::clamp(_622, 0.0, 1.0);
    float _626 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[0].z, _608);
    float _628 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[2].z, _612);
    float _630 = _618 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _632 = rsqrt(_616);
    float _634 = -_624;
    float _636 = _634 + 1.0;
    float _638 = _626 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _640 = _630 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _642 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[3].z, _614);
    float _644 = _628 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _646 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _648 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[7].x, _640);
    float _650 = abs(_636);
    float _652 = log2(_650);
    float _654 = _642 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _656 = _644 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _658 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[7].z, _648);
    float _660 = -_656;
    float _662 = fma(_660, _646, 1.0);
    float _664 = _632 * _568;
    float _666 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[7].w, _658);
    float _668 = _632 * _580;
    float _670 = _632 * _576;
    float _672 = _664 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _674 = log2(_662);
    float _676 = _630 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _678 = -_672;
    float _680 = fma(_668, (*spvDescriptorSet0.vp_c15)._m0[21].y, _678);
    float _682 = _652 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _684 = -_670;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c15)._m0[21].z, _680);
    float _688 = 1.0 / _666;
    float _690 = _630 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _692 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[5].x, _676);
    float _694 = fma(_686, -0.5, 0.5);
    float _696 = fma(_686, 0.5, 0.5);
    float _698 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[4].x, _690);
    float _700 = _668 + 1.0;
    float _702 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[5].z, _692);
    float _704 = exp2(_682);
    float _706 = fma(_696, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _708 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[4].z, _698);
    float _710 = _674 * 0.693147182464599609375;
    float _712 = fma(_696, _706, -0.212114393711090087890625);
    float _714 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[4].w, _708);
    float _716 = sqrt(_694);
    float _718 = fma(_696, _712, 1.570728778839111328125);
    float _720 = _714 * _688;
    float _722 = fma(_720, 0.5, 0.5);
    float _724 = -_668;
    float _726 = fma(_704, _700, _724);
    float _728 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[5].w, _702);
    float _730 = _710 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _732 = _728 * _688;
    float _734 = fma(_726, 0.5, 0.5);
    float _736 = _716 * 0.636619746685028076171875;
    float _738 = fma(_732, -0.5, 0.5);
    float _740 = -_718;
    float _742 = fma(_736, _740, 1.0);
    float3 _2214 = float3(_722, _738, _730);
    float _744 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2214, float3(0.0), isnan(_2214)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2214, float3(0.0), isnan(_2214)), level(0.0)).x;
    float3 _2225 = float3(_722, _738, _730);
    float4 _747 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2225, float3(0.0), isnan(_2225)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2225, float3(0.0), isnan(_2225)), level(0.0)).xyzw;
    float _749 = _747.x;
    float _751 = _747.y;
    float _753 = _747.z;
    float _755 = _747.w;
    float2 _2242 = float2(_742, _734);
    float3 _759 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2242, float2(0.0), isnan(_2242)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2242, float2(0.0), isnan(_2242)), level(0.0)).xyz;
    float _761 = _759.x;
    float _763 = _759.y;
    float _765 = _759.z;
    float _767 = in.m_53.x;
    float _769 = in.m_53.y;
    float _771 = in.m_53.z;
    bool _773 = _150 != 0.0;
    bool _775 = isnan(_150);
    bool _777 = _773 || _775;
    bool _779 = isnan(0.0);
    bool _781 = _777 || _779;
    float _783 = _652 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _785 = _162 == 0.0;
    bool _787 = !_781;
    bool _789 = _785 && _787;
    float _791 = _358 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _793 = _164 == 0.0;
    bool _795 = _793 && _789;
    float _797 = _358 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _799 = exp2(_783);
    float _801 = _769;
    float _803 = _767;
    float _805 = _771;
    if (!_795)
    {
        float _807 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[17].y, _769);
        _801 = _807;
    }
    float _809 = _801;
    if (!_795)
    {
        float _811 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[17].y, _767);
        _803 = _811;
    }
    float _813 = _803;
    if (!_795)
    {
        float _815 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[17].y, _771);
        _805 = _815;
    }
    float _817 = _805;
    bool _819 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _821 = isnan(0.5);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _827 = _823 || _825;
    float _829 = _809 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _831 = _809 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _833 = _809 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _835 = fma(_813, (*spvDescriptorSet0.vp_c10)._m0[9].x, _829);
    float _837 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _791);
    float _839 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _797);
    float _841 = fma(_813, (*spvDescriptorSet0.vp_c10)._m0[8].x, _831);
    float _843 = fma(_813, (*spvDescriptorSet0.vp_c10)._m0[10].x, _833);
    float _845 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _837);
    float _847 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _839);
    float _849 = fma(_817, (*spvDescriptorSet0.vp_c10)._m0[8].z, _841);
    float _851 = _845 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _853 = _847 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _855 = fma(_817, (*spvDescriptorSet0.vp_c10)._m0[9].z, _835);
    float _857 = _851 + _853;
    float _859 = fma(_817, (*spvDescriptorSet0.vp_c10)._m0[10].z, _843);
    float _861 = 1.0 / _853;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _875 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _879 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _849;
    out.m_55.y = _855;
    out.m_55.z = _859;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _883 = _869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = _857 * _861;
    float _887 = _885 * 0.5;
    out.m_57.x = _875;
    out.m_57.y = _877;
    out.m_57.z = _879;
    out.m_57.w = _873;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _891 = _871 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _895 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[30].w, _893);
    float _897 = in.m_59.w;
    float _899 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _901 = _630 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _903 = 1.0 / _895;
    out.m_61.x = _899;
    out.m_61.y = _883;
    out.m_61.z = _891;
    out.m_61.w = _881;
    float _905 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[6].x, _901);
    float _907 = _901;
    float _909 = _899;
    if (_827)
    {
        _907 = 1.0;
    }
    float _911 = _907;
    float _913 = _911;
    if (_827)
    {
        _909 = 1.0;
    }
    float _915 = _909;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _919 = _903 * _917;
    float _921 = _915;
    if (!_827)
    {
        float _923 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _925 = _923 * 0.15915493667125701904296875;
        float _927 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _929 = _925 * 6.283185482025146484375;
        float _931 = cos(_929);
        float _933 = _927 * 0.15915493667125701904296875;
        float _935 = _925 * 6.283185482025146484375;
        float _937 = sin(_935);
        float _939 = 1.0 / _931;
        float _941 = _933 * 6.283185482025146484375;
        float _943 = cos(_941);
        float _945 = _937 * _939;
        float _947 = _933 * 6.283185482025146484375;
        float _949 = sin(_947);
        float _951 = _943 * _945;
        float _953 = 1.0 / _951;
        float _955 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _957 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _955;
        float _959 = 1.0 / _957;
        float _961 = _949 * _953;
        float _963 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _965 = fma(_919, _961, _963);
        float _967 = _965 * _959;
        float _969 = precise::clamp(_967, 0.0, 1.0);
        _913 = _969;
    }
    float _971 = _913;
    if (!_827)
    {
        float _973 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _975 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _977 = _973 * 0.15915493667125701904296875;
        float _979 = _975 * 0.15915493667125701904296875;
        float _981 = _977 * 6.283185482025146484375;
        float _983 = cos(_981);
        float _985 = _977 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = 1.0 / _983;
        float _991 = _979 * 6.283185482025146484375;
        float _993 = cos(_991);
        float _995 = _987 * _989;
        float _997 = _979 * 6.283185482025146484375;
        float _999 = sin(_997);
        float _1001 = _993 * _995;
        float _1003 = 1.0 / _1001;
        float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1007 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1005;
        float _1009 = 1.0 / _1007;
        float _1011 = _999 * _1003;
        float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1015 = fma(_919, _1011, _1013);
        float _1017 = _1015 * _1009;
        float _1019 = precise::clamp(_1017, 0.0, 1.0);
        float _1021 = -_1019;
        float _1023 = _1021 + 1.0;
        _921 = _1023;
    }
    float _1025 = _921;
    float _1027 = _971 * _1025;
    float _1029 = -_799;
    float _1031 = _1029 + 1.0;
    float _1033 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[6].z, _905);
    bool _1035 = _971 > 0.0;
    bool _1037 = isnan(_971);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan(0.0);
    bool _1043 = _1039 || _1041;
    float _1045 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1047 = _1031 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1049 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1033);
    bool _1051 = _1025 <= 0.0;
    bool _1053 = !_1043;
    bool _1055 = _1051 || _1053;
    float _1057 = _1045 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1059 = _666 * 0.5;
    float _1061 = _1047 * _744;
    out.m_63.z = _164;
    float _1063 = _1049 + _666;
    float _1065 = fma(_728, -0.5, _1059);
    float _1067 = _714 + _666;
    float _1069 = _765 * _1061;
    float _1071 = -_1047;
    float _1073 = _1071 + 1.0;
    out.m_63.y = _150;
    float _1075 = _755 * _1061;
    float _1077 = _1063 * 0.5;
    out.m_65.x = _438;
    out.m_65.y = _434;
    out.m_65.z = _442;
    float _1079 = _1067 * 0.5;
    float _1081 = fma(_761, _1075, _749);
    float _1083 = fma(_763, _1075, _751);
    float _1085 = _755 * _1073;
    float _1087 = fma(_755, _1069, _753);
    out.m_63.x = _162;
    out.m_67.w = _897;
    out.m_45.x = _1057;
    out.gl_Position.x = _714;
    out.gl_Position.y = _728;
    out.gl_Position.z = _1049;
    out.gl_Position.w = _666;
    out.m_69.x = _1079;
    out.m_69.y = _1065;
    out.m_69.z = _1077;
    out.m_69.w = _666;
    out.m_71.x = _1081;
    out.m_71.y = _1083;
    out.m_71.z = _1087;
    out.m_71.w = _1085;
    if (!_1055)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1089 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1089;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

