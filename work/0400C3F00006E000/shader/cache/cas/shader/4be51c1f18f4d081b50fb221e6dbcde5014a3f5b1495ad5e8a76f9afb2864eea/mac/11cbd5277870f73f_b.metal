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
    float4 m_81 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_73 [[user(locn10)]];
    float4 m_65 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 m_83 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1417 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1703 = as_type<float>(_122);
        out.gl_Position.z = _1703;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_49.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_106);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1772 = as_type<float>(_158);
        out.gl_Position.z = _1772;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_51.w;
    float _162 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _164 = in.m_49.x;
    float _166 = in.m_49.y;
    float _168 = in.m_49.z;
    bool _170 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _172 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _174 = _170 || _172;
    bool _176 = isnan(1.0);
    bool _178 = _174 || _176;
    float _180 = in.m_44.x;
    float _182 = in.m_44.y;
    float _184 = in.m_44.z;
    float _186 = in.m_53.x;
    float _188 = in.m_53.y;
    float _190 = in.m_53.z;
    float _192 = in.m_51.x;
    float _194 = in.m_51.y;
    float _196 = in.m_51.z;
    float _198 = 0.0;
    float _200 = _162;
    if (!_178)
    {
        float _202 = _162 * _162;
        float _204 = _202 * 0.5;
        _198 = _204;
    }
    float _206 = _198;
    float _208 = _206;
    if (!_178)
    {
        float _210 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _210;
    }
    float _212 = _208;
    bool _214 = !_178;
    float _216 = _212;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _162 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _162);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_178;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _162 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _200 = _270;
    }
    float _272 = _200;
    float _274 = _192 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _276 = _194 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _188);
    float _282 = _274 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _284 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _286 = _276 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _186);
    float _290 = _278 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _292 = fma(_272, _166, _284);
    float _294 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _296 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _298 = _286 * _280;
    float _300 = fma(_292, _160, _182);
    float _302 = fma(_272, _164, _294);
    float _304 = fma(_272, _168, _296);
    float _306 = _282 * _288;
    float _308 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _190);
    float _310 = fma(_302, _160, _180);
    float _312 = _300 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _314 = fma(_304, _160, _184);
    float _316 = _298 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _318 = _300 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _320 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[6].x, _312);
    float _322 = _298 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _324 = _290 * _308;
    float _326 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].x, _316);
    float _328 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[4].x, _318);
    float _330 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[6].z, _320);
    float _332 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[8].x, _322);
    float _334 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[10].z, _326);
    float _336 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[4].z, _328);
    float _338 = _330 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _340 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[8].z, _332);
    float _342 = _298 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _344 = _336 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _346 = _338 + _334;
    float _348 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[9].x, _342);
    float _350 = _344 + _340;
    float _352 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _354 = _346 + _352;
    float _356 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[9].z, _348);
    float _358 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _360 = _350 + _358;
    float _362 = _354 * _354;
    float _364 = fma(_360, _360, _362);
    float _366 = _300 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _368 = sqrt(_364);
    float _370 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[5].x, _366);
    float _372 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[5].z, _370);
    float _374 = _372 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _376 = _374 + _356;
    bool _378 = _368 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _380 = _372;
    float _382 = _350;
    float _384 = _374;
    float _386 = _364;
    float _388 = _280;
    if (!_378)
    {
        _380 = _350;
    }
    float _390 = _380;
    float _392 = _390;
    if (!_378)
    {
        _382 = _346;
    }
    float _394 = _382;
    float _396 = _394;
    if (!_378)
    {
        _384 = _376;
    }
    float _398 = _384;
    bool _400 = !_378;
    float _402 = _398;
    if (!_400)
    {
        float _404 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _406 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _408 = _368 + _406;
        float _410 = _376 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _412 = rsqrt(_364);
        float _414 = _408 * _404;
        float _416 = _414 * 0.15915493667125701904296875;
        float _418 = _416 * 6.283185482025146484375;
        float _420 = cos(_418);
        float _422 = _416 * 6.283185482025146484375;
        float _424 = sin(_422);
        float _426 = _420 + (-1.0);
        float _428 = _426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _430 = fma(_424, _410, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _432 = fma(_376, _420, _428);
        float _434 = _412 * _430;
        float _436 = fma(_360, _434, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _438 = fma(_354, _434, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _402 = _432;
        _392 = _436;
        _396 = _438;
    }
    float _440 = _402;
    float _442 = _392;
    float _444 = _396;
    float _446 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _448 = _440 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _452 = _442 + _450;
    float _454 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _456 = _444 + _454;
    float _458 = _448 * _448;
    float _460 = fma(_452, _452, _458);
    float _462 = fma(_456, _456, _460);
    float _464 = rsqrt(_462);
    float _466 = sqrt(_462);
    float _468 = _464 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _470 = _452 * _468;
    float _472 = _456 * _468;
    float _474 = _470 * _470;
    float _476 = _472 * _472;
    float _478 = _474 + _476;
    float _480 = sqrt(_478);
    bool _482 = _480 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _486 = _480 + _484;
    float _488 = _324;
    float _490 = _478;
    float _492 = _486;
    float _494 = _470;
    float _496 = _456;
    float _498 = _448;
    float _500 = _452;
    if (_482)
    {
        float _502 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _488 = _502;
    }
    float _504 = _488;
    if (_482)
    {
        float _506 = rsqrt(_478);
        _490 = _506;
    }
    float _508 = _490;
    float _510 = _508;
    if (_482)
    {
        float _512 = _486 * _504;
        _492 = _512;
    }
    float _514 = _492;
    if (_482)
    {
        float _516 = _514 * 0.15915493667125701904296875;
        _386 = _516;
    }
    float _518 = _386;
    float _520 = _504;
    float _522 = _518;
    if (_482)
    {
        float _524 = _518 * 6.283185482025146484375;
        float _526 = sin(_524);
        _520 = _526;
    }
    float _528 = _520;
    float _530 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _532 = precise::max(0.0, _530);
    float _534 = _342;
    float _536 = _532;
    if (_482)
    {
        float _538 = _518 * 6.283185482025146484375;
        float _540 = cos(_538);
        _534 = _540;
    }
    float _542 = _534;
    float _544 = -_468;
    float _546 = -_532;
    float _548 = fma(_448, _544, _546);
    if (_482)
    {
        float _550 = _548 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _536 = _550;
    }
    float _552 = _536;
    float _554 = _528;
    float _556 = _552;
    if (_482)
    {
        float _558 = fma(_528, _552, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _554 = _558;
    }
    float _560 = _554;
    float _562 = _560;
    float _564 = _542;
    if (_482)
    {
        float _566 = _542 + (-1.0);
        _556 = _566;
    }
    float _568 = _556;
    float _570 = _568;
    if (_482)
    {
        float _572 = _508 * _560;
        _388 = _572;
    }
    float _574 = _388;
    if (!_482)
    {
        _562 = _548;
    }
    float _576 = _562;
    float _578 = _576;
    if (_482)
    {
        float _580 = _568 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _522 = _580;
    }
    float _582 = _522;
    if (_482)
    {
        float _584 = _470 * _574;
        _494 = _584;
    }
    float _586 = _494;
    if (!_482)
    {
        _570 = _472;
    }
    float _588 = _570;
    float _590 = _588;
    if (_482)
    {
        float _592 = _472 * _574;
        _590 = _592;
    }
    float _594 = _590;
    if (!_482)
    {
        _510 = _474;
    }
    float _596 = _510;
    float _598 = _596;
    if (_482)
    {
        float _600 = fma(_548, _542, _582);
        _578 = _600;
    }
    float _602 = _578;
    if (_482)
    {
        float _604 = _586 * _586;
        _598 = _604;
    }
    float _606 = _598;
    if (!_482)
    {
        _564 = _476;
    }
    float _608 = _564;
    float _610 = _608;
    if (_482)
    {
        float _612 = _594 * _594;
        _610 = _612;
    }
    float _614 = _610;
    float _616 = _440 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _618 = fma(_602, _602, _606);
    float _620 = _440 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _622 = _618 + _614;
    float _624 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[2].x, _616);
    float _626 = _440 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _628 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _630 = fma(_466, (*spvDescriptorSet0.vp_c15)._m0[23].w, _628);
    float _632 = precise::clamp(_630, 0.0, 1.0);
    float _634 = rsqrt(_622);
    float _636 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[2].z, _624);
    float _638 = _440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _640 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[1].x, _626);
    float _642 = -_632;
    float _644 = _642 + 1.0;
    float _646 = _636 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _648 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[0].x, _638);
    float _650 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[1].z, _640);
    float _652 = abs(_644);
    float _654 = log2(_652);
    float _656 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _658 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _648);
    float _660 = _650 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _662 = _646 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _664 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[3].x, _620);
    float _666 = _658 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _668 = _634 * _586;
    float _670 = _660 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _672 = _634 * _602;
    float _674 = -_662;
    float _676 = fma(_674, _656, 1.0);
    float _678 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[3].z, _664);
    float _680 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[7].x, _670);
    float _682 = _668 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _684 = _634 * _594;
    float _686 = _654 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _688 = _678 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _690 = -_682;
    float _692 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[21].y, _690);
    float _694 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[7].z, _680);
    float _696 = exp2(_686);
    float _698 = _660 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _700 = -_684;
    float _702 = fma(_700, (*spvDescriptorSet0.vp_c15)._m0[21].z, _692);
    float _704 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[7].w, _694);
    float _706 = _660 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _708 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[5].x, _698);
    float _710 = fma(_702, -0.5, 0.5);
    float _712 = fma(_702, 0.5, 0.5);
    float _714 = log2(_676);
    float _716 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[4].x, _706);
    float _718 = _672 + 1.0;
    float _720 = fma(_712, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _722 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[5].z, _708);
    float _724 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[4].z, _716);
    float _726 = fma(_712, _720, -0.212114393711090087890625);
    float _728 = 1.0 / _704;
    float _730 = -_672;
    float _732 = fma(_696, _718, _730);
    float _734 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[4].w, _724);
    float _736 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[5].w, _722);
    float _738 = fma(_712, _726, 1.570728778839111328125);
    float _740 = fma(_732, 0.5, 0.5);
    float _742 = sqrt(_710);
    float _744 = _714 * 0.693147182464599609375;
    float _746 = _734 * _728;
    float _748 = _736 * _728;
    float _750 = _744 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _752 = fma(_746, 0.5, 0.5);
    float _754 = fma(_748, -0.5, 0.5);
    float _756 = _742 * 0.636619746685028076171875;
    float3 _2762 = float3(_752, _754, _750);
    float _758 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2762, float3(0.0), isnan(_2762)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2762, float3(0.0), isnan(_2762)), level(0.0)).x;
    float3 _2773 = float3(_752, _754, _750);
    float4 _761 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2773, float3(0.0), isnan(_2773)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2773, float3(0.0), isnan(_2773)), level(0.0)).xyzw;
    float _763 = _761.x;
    float _765 = _761.y;
    float _767 = _761.z;
    float _769 = _761.w;
    float _771 = -_738;
    float _773 = fma(_756, _771, 1.0);
    float2 _2795 = float2(_773, _740);
    float3 _777 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2795, float2(0.0), isnan(_2795)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2795, float2(0.0), isnan(_2795)), level(0.0)).xyz;
    float _779 = _777.x;
    float _781 = _777.y;
    float _783 = _777.z;
    float _785 = in.m_55.w;
    float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _789 = in.m_57.z;
    float _791 = in.m_57.w;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _795 = _793 != 0;
    float _797 = _654 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _801 = _799 != 0;
    float _803 = in.m_55.y;
    float _805 = in.m_57.y;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _811 = _809 != 0;
    float _813 = in.m_57.x;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _817 = _815 != 0;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _823 = _821 != 0;
    float _825 = in.m_55.z;
    float _827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _829 = -_785;
    float _831 = _829 + 1.0;
    out.m_59.w = _785;
    float _833 = _660 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _835 = _789 > 0.5;
    float _837 = in.m_55.x;
    bool _839 = _791 > 0.5;
    float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _845 = _785;
    bool _847 = _839;
    float _849 = _789;
    float _851 = _704;
    float _853 = _734;
    float _855 = _736;
    if (_795)
    {
        float _857 = _835 ? _831 : _785;
        _845 = _857;
    }
    float _859 = _845;
    float _861 = -_803;
    float _863 = _861 + 1.0;
    int _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _867 = _865 != 0;
    float _869 = _791;
    float _871 = _803;
    float _873 = _805;
    if (_801)
    {
        float _875 = in.m_57.z;
        _869 = _875;
    }
    float _877 = _869;
    bool _879 = _805 > 0.5;
    float _881 = _827 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _885 = _813 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _887 = _879 ? as_type<int>(_863) : as_type<int>(_803);
    float _889 = fma(_881, _859, -0.5);
    int _891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _893 = _891 != 0;
    float _895 = -_819;
    float _897 = fma(_885, 2.0, _895);
    float _899 = _805 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _901 = _867 ? as_type<float>(_887) : _803;
    float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _905 = _825;
    float _907 = _901;
    if (_811)
    {
        float _909 = _839 ? _863 : _803;
        _871 = _909;
    }
    float _911 = _871;
    float _913 = fma(_899, -2.0, _807);
    bool _915 = _805 > 0.5;
    bool _917 = _915 && _823;
    float _919 = in.m_61.x;
    float _921 = in.m_61.y;
    float _923 = in.m_61.z;
    bool _925 = _188 != 0.0;
    bool _927 = isnan(_188);
    bool _929 = _925 || _927;
    bool _931 = isnan(0.0);
    bool _933 = _929 || _931;
    float _935 = -_140;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[76].x, _897);
    float _939 = 0.0;
    if (_823)
    {
        _939 = _825;
    }
    float _941 = _939;
    float _943 = exp2(_797);
    bool _945 = _186 == 0.0;
    bool _947 = !_933;
    bool _949 = _945 && _947;
    float _951 = in.m_63.y;
    float _953 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[6].x, _833);
    bool _955 = _190 == 0.0;
    bool _957 = _955 && _949;
    out.m_65.x = _442;
    out.m_65.y = _440;
    out.m_65.z = _444;
    float _959 = _941;
    float _961 = _877;
    bool _963 = _957;
    if (_801)
    {
        bool _965 = _877 > 0.5;
        _847 = _965;
    }
    bool _967 = _847;
    if (_917)
    {
        float _969 = -_941;
        float _971 = _969 + 1.0;
        _959 = _971;
    }
    float _973 = _959;
    float _975 = _903 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_817)
    {
        _961 = _837;
    }
    float _977 = _961;
    float _979 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[6].z, _953);
    float _981 = fma(_975, _901, -0.5);
    float _983 = _977;
    if (_823)
    {
        _905 = _973;
    }
    float _985 = _905;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _991 = _987;
    if (_893)
    {
        _907 = _813;
    }
    float _993 = _907;
    float _995 = -_943;
    float _997 = _995 + 1.0;
    float _999 = _993;
    if (!_893)
    {
        _999 = _789;
    }
    float _1001 = _999;
    float _1003 = _919;
    float _1005 = _923;
    float _1007 = _921;
    if (!_957)
    {
        float _1009 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[17].y, _919);
        _1003 = _1009;
    }
    float _1011 = _1003;
    float _1013 = 0.0;
    if (!_817)
    {
        _1013 = _977;
    }
    float _1015 = _1013;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1019 = _1015;
    if (_817)
    {
        _983 = _837;
    }
    float _1021 = _983;
    float _1023 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1025 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _913);
    float _1027 = _1021;
    if (!_957)
    {
        float _1029 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[17].y, _923);
        _1005 = _1029;
    }
    float _1031 = _1005;
    float _1033 = -_1017;
    float _1035 = fma(_1023, 2.0, _1033);
    float _1037 = _1017;
    if (!_893)
    {
        float _1039 = in.m_57.z;
        _1037 = _1039;
    }
    float _1041 = _1037;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1045 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[78].w, _987);
    if (!_893)
    {
        _991 = _805;
    }
    float _1047 = _991;
    float _1049 = _787 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1051 = _1047;
    int _1053 = as_type<int>(_1049);
    if (_893)
    {
        _1051 = _813;
    }
    float _1055 = _1051;
    float _1057 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1045);
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1061 = fma(_1049, _911, -0.5);
    if (!_957)
    {
        float _1063 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[17].y, _921);
        _1007 = _1063;
    }
    float _1065 = _1007;
    float _1067 = -_1025;
    float _1069 = fma(_1057, _981, _1067);
    if (_817)
    {
        float _1071 = -_1021;
        float _1073 = _1071 + 1.0;
        _1053 = as_type<int>(_1073);
    }
    int _1075 = _1053;
    float _1077 = as_type<float>(_1075);
    if (_817)
    {
        bool _1079 = _813 > 0.5;
        _963 = _1079;
    }
    bool _1081 = _963;
    float _1083 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1059);
    int _1085 = 0;
    if (_801)
    {
        float _1087 = -_1021;
        float _1089 = _1087 + 1.0;
        _1085 = as_type<int>(_1089);
    }
    int _1091 = _1085;
    float _1093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1097 = _841 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1099 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1101 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1043);
    if (_817)
    {
        float _1103 = _1081 ? as_type<float>(_1075) : _1021;
        _1019 = _1103;
    }
    float _1105 = _1019;
    float _1107 = fma(_1097, _985, -0.5);
    float _1109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_801)
    {
        float _1111 = _967 ? as_type<float>(_1091) : _1021;
        _1027 = _1111;
    }
    float _1113 = _1027;
    float _1115 = -_1095;
    float _1117 = fma(_1099, 2.0, _1115);
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1121 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1083);
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_893)
    {
        _849 = _805;
    }
    float _1125 = _849;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1129 = _1041;
    if (!_893)
    {
        _1077 = _1041;
    }
    float _1131 = _1077;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1135 = _1131;
    if (_893)
    {
        _1129 = _805;
    }
    float _1137 = _1129;
    float _1139 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1119);
    if (_893)
    {
        _1135 = _805;
    }
    float _1141 = _1135;
    float _1143 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1123);
    float _1145 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1133);
    if (!_893)
    {
        _873 = _813;
    }
    float _1147 = _873;
    float _1149 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1127);
    float _1151 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1153 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1155 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1157 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1139);
    float _1159 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1161 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1163 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1165 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1167 = fma(_1011, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1151);
    float _1169 = fma(_1011, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1153);
    float _1171 = fma(_1011, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1155);
    float _1173 = _1157 * (-0.15915493667125701904296875);
    float _1175 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1143);
    float _1177 = fma(_1159, _1105, -0.5);
    float _1179 = fma(_1161, _1113, -0.5);
    float _1181 = fma(_1165, -2.0, _883);
    float _1183 = fma(_1031, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1167);
    float _1185 = fma(_1031, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1169);
    float _1187 = fma(_1031, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1171);
    float _1189 = _1173 * 6.283185482025146484375;
    float _1191 = sin(_1189);
    float _1193 = fma(_1175, _1177, _937);
    float _1195 = -_140;
    float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1117);
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1201 = _1173 * 6.283185482025146484375;
    float _1203 = cos(_1201);
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1211 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1213 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1215 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1221 = fma(_1121, _1179, _1197);
    float _1223 = in.m_63.x;
    float _1225 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1227 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1149);
    float _1229 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1181);
    float _1231 = in.m_63.w;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1235 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1237 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1211;
    out.m_67.y = _1213;
    out.m_67.z = _1215;
    out.m_67.w = _1209;
    float _1239 = fma(_1225, -2.0, _989);
    float _1241 = _997 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1243 = -_140;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1035);
    out.m_69.x = _1163;
    out.m_69.y = _1235;
    out.m_69.z = _1237;
    out.m_69.w = _1233;
    float _1247 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1239);
    float _1249 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[6].w, _979);
    bool _1251 = _466 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1253 = isnan(_466);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1259 = _1255 || _1257;
    out.m_71.y = _951;
    out.m_73.x = _1183;
    out.m_73.y = _1185;
    out.m_73.z = _1187;
    float _1261 = _1191 * _889;
    float _1263 = -_1229;
    float _1265 = fma(_1227, _1061, _1263);
    float _1267 = _1203 * _889;
    float _1269 = _1193 + 0.5;
    float _1271 = -_1261;
    float _1273 = fma(_1203, _1107, _1271);
    float _1275 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1145);
    float _1277 = _1069 + 0.5;
    float _1279 = _1221 + 0.5;
    float _1281 = _1265 + 0.5;
    float _1283 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1101);
    float _1285 = fma(_1191, _1107, _1267);
    float _1287 = fma(_1275, _1273, _1245);
    float _1289 = _1249 + _704;
    out.m_75.x = _1269;
    out.m_75.y = _1277;
    out.m_75.z = _1279;
    out.m_75.w = _1281;
    float _1291 = -_1247;
    float _1293 = fma(_1283, _1285, _1291);
    float _1295 = _1287 + 0.5;
    float _1297 = _1289 * 0.5;
    out.m_71.x = _1223;
    float _1299 = _1293 + 0.5;
    out.m_71.w = _1231;
    out.m_77.x = _1295;
    out.m_77.y = _1299;
    float _1301 = -_1241;
    float _1303 = _1301 + 1.0;
    out.m_79.z = _1297;
    out.m_79.w = _704;
    out.m_81.x = _452;
    out.m_81.y = _448;
    out.m_81.z = _456;
    out.gl_Position.x = _734;
    out.gl_Position.y = _736;
    out.gl_Position.z = _1249;
    out.gl_Position.w = _704;
    if (!_1259)
    {
        _496 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1305 = _496;
    float _1307 = _1305;
    float _1309 = _1305;
    if (!_1259)
    {
        _498 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1311 = _498;
    float _1313 = _1311;
    float _1315 = _1311;
    if (!_1259)
    {
        _500 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1317 = _500;
    float _1319 = _1317;
    float _1321 = _1317;
    if (!_1259)
    {
        _851 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1323 = _851;
    float _1325 = _1323;
    float _1327 = _1323;
    if (!_1259)
    {
        _853 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1329 = _853;
    float _1331 = _1329;
    float _1333 = _1329;
    if (!_1259)
    {
        _855 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1335 = _855;
    float _1337 = _1241 * _758;
    float _1339 = _769 * _1303;
    float _1341 = _769 * _1337;
    float _1343 = _783 * _1337;
    float _1345 = fma(_779, _1341, _763);
    float _1347 = fma(_781, _1341, _765);
    float _1349 = fma(_769, _1343, _767);
    out.m_83.x = _1345;
    out.m_83.y = _1347;
    out.m_83.z = _1349;
    out.m_83.w = _1339;
    bool _1351 = !_1259;
    float _1353 = _1335;
    float _1355 = _1335;
    if (!_1351)
    {
        bool _1357 = _466 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1359 = isnan(_466);
        bool _1361 = _1357 || _1359;
        bool _1363 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1365 = _1361 || _1363;
        if (!_1365)
        {
            float _1367 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1369 = _466 + _1367;
            float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1373 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1371;
            float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1377 = _1375 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1379 = 1.0 / _1373;
            float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1383 = _1381 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1387 = _1385 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1389 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1391 = _1389 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1393 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1395 = _1393 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1397 = _1369 * _1379;
            float _1399 = precise::clamp(_1397, 0.0, 1.0);
            float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1403 = _1401 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1405 = fma(_1399, _1377, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1407 = fma(_1399, _1403, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1409 = fma(_1399, _1383, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1411 = fma(_1399, _1387, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1413 = fma(_1399, _1391, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1415 = fma(_1399, _1395, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1333 = _1409;
            _1315 = _1413;
            _1327 = _1405;
            _1309 = _1411;
            _1355 = _1407;
            _1321 = _1415;
            _1417 = true;
        }
        else
        {
            bool _1419 = _466 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1421 = isnan(_466);
            bool _1423 = _1419 || _1421;
            bool _1425 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1427 = _1423 || _1425;
            if (!_1427)
            {
                _1325 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1429 = _1325;
            _1327 = _1429;
            if (!_1427)
            {
                _1331 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1431 = _1331;
            _1333 = _1431;
            if (!_1427)
            {
                _1353 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1433 = _1353;
            _1355 = _1433;
            if (!_1427)
            {
                _1307 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1435 = _1307;
            _1309 = _1435;
            if (!_1427)
            {
                _1313 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1437 = _1313;
            _1315 = _1437;
            if (!_1427)
            {
                _1319 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1439 = _1319;
            bool _1441 = !_1427;
            _1321 = _1439;
            if (!_1441)
            {
                bool _1443 = _466 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1445 = isnan(_466);
                bool _1447 = _1443 || _1445;
                bool _1449 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1451 = _1447 || _1449;
                if (!_1451)
                {
                    float _1453 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1455 = _466 + _1453;
                    float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1459 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1457;
                    float _1461 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1463 = _1461 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1465 = 1.0 / _1459;
                    float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1469 = _1467 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1471 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1473 = _1471 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1477 = _1475 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1481 = _1479 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1483 = _1455 * _1465;
                    float _1485 = precise::clamp(_1483, 0.0, 1.0);
                    float _1487 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1489 = _1487 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1491 = fma(_1485, _1463, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1493 = fma(_1485, _1489, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1495 = fma(_1485, _1469, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1497 = fma(_1485, _1473, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1499 = fma(_1485, _1477, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1501 = fma(_1485, _1481, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1333 = _1495;
                    _1315 = _1499;
                    _1327 = _1491;
                    _1309 = _1497;
                    _1355 = _1493;
                    _1321 = _1501;
                    _1417 = true;
                }
                else
                {
                    _1333 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1315 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1327 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1309 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1355 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1321 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1417 = false;
    float _1503 = _1333;
    float _1505 = _1315;
    float _1507 = _1327;
    float _1509 = _1309;
    float _1511 = _1355;
    float _1513 = _1321;
    float _1515 = fma(_1185, -0.5, 0.5);
    float _1517 = precise::clamp(_1515, 0.0, 1.0);
    float _1519 = -_1503;
    float _1521 = _1519 + _1505;
    float _1523 = -_1507;
    float _1525 = _1523 + _1509;
    float _1527 = -_1511;
    float _1529 = _1527 + _1513;
    bool _1531 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1533 = fma(_1517, _1521, _1503);
    float _1535 = fma(_1517, _1525, _1507);
    float _1537 = fma(_1517, _1529, _1511);
    float _1539 = _1533 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _1541 = fma(_1535, 0.298911988735198974609375, _1539);
    float _1543 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1545 = fma(_1537, 0.114477999508380889892578125, _1541);
    out.m_47.x = _1543;
    float _1547 = -_1545;
    float _1549 = _1535 + _1547;
    float _1551 = -_1545;
    float _1553 = _1533 + _1551;
    float _1555 = -_1545;
    float _1557 = _1537 + _1555;
    float _1559 = fma(_1549, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1545);
    float _1561 = fma(_1553, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1545);
    float _1563 = fma(_1557, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1545);
    out.m_87.x = _1559;
    out.m_87.y = _1561;
    out.m_87.z = _1563;
    if (!_1531)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1565 = -_440;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1569 = -_442;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1573 = -_444;
    float _1575 = _1573 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1577 = _1567 * _1567;
    float _1579 = fma(_1571, _1571, _1577);
    float _1581 = fma(_1575, _1575, _1579);
    float _1583 = sqrt(_1581);
    float _1585 = rsqrt(_1581);
    float _1587 = -_1583;
    float _1589 = _1587 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1591 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1593 = precise::clamp(_1591, 0.0, 1.0);
    float _1595 = _1571 * _1585;
    float _1597 = _1567 * _1585;
    float _1599 = abs(_1593);
    float _1601 = log2(_1599);
    float _1603 = _1575 * _1585;
    float _1605 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1607 = _1185 * _1597;
    float _1609 = -_1597;
    float _1611 = -_1605;
    float _1613 = fma(_1609, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1611);
    float _1615 = fma(_1183, _1595, _1607);
    float _1617 = -_1603;
    float _1619 = fma(_1617, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1613);
    float _1621 = fma(_1187, _1603, _1615);
    float _1623 = precise::clamp(_1621, 0.0, 1.0);
    float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1627 = _1619 + _1625;
    float _1629 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1631 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1633 = precise::clamp(_1631, 0.0, 1.0);
    float _1635 = exp2(_1629);
    float _1637 = _1635 * _1633;
    float _1639 = _1623 * _1637;
    float _1641 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1643 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1645 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1641;
    out.m_85.y = _1643;
    out.m_85.z = _1645;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1417 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1703 = as_type<float>(_122);
        out.gl_Position.z = _1703;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_49.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_106);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1772 = as_type<float>(_158);
        out.gl_Position.z = _1772;
    }
    if (_150)
    {
        return out;
    }
    float _160 = in.m_51.w;
    float _162 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _164 = in.m_49.x;
    float _166 = in.m_49.y;
    float _168 = in.m_49.z;
    bool _170 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _172 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _174 = _170 || _172;
    bool _176 = isnan(1.0);
    bool _178 = _174 || _176;
    float _180 = in.m_44.x;
    float _182 = in.m_44.y;
    float _184 = in.m_44.z;
    float _186 = in.m_53.x;
    float _188 = in.m_53.y;
    float _190 = in.m_53.z;
    float _192 = in.m_51.x;
    float _194 = in.m_51.y;
    float _196 = in.m_51.z;
    float _198 = 0.0;
    float _200 = _162;
    if (!_178)
    {
        float _202 = _162 * _162;
        float _204 = _202 * 0.5;
        _198 = _204;
    }
    float _206 = _198;
    float _208 = _206;
    if (!_178)
    {
        float _210 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _210;
    }
    float _212 = _208;
    bool _214 = !_178;
    float _216 = _212;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _162 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _162);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_178;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _162 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _200 = _270;
    }
    float _272 = _200;
    float _274 = _192 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _276 = _194 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _188);
    float _282 = _274 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _284 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _286 = _276 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _186);
    float _290 = _278 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _292 = fma(_272, _166, _284);
    float _294 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _296 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _298 = _286 * _280;
    float _300 = fma(_292, _160, _182);
    float _302 = fma(_272, _164, _294);
    float _304 = fma(_272, _168, _296);
    float _306 = _282 * _288;
    float _308 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _190);
    float _310 = fma(_302, _160, _180);
    float _312 = _300 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _314 = fma(_304, _160, _184);
    float _316 = _298 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _318 = _300 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _320 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[6].x, _312);
    float _322 = _298 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _324 = _290 * _308;
    float _326 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].x, _316);
    float _328 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[4].x, _318);
    float _330 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[6].z, _320);
    float _332 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[8].x, _322);
    float _334 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[10].z, _326);
    float _336 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[4].z, _328);
    float _338 = _330 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _340 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[8].z, _332);
    float _342 = _298 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _344 = _336 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _346 = _338 + _334;
    float _348 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[9].x, _342);
    float _350 = _344 + _340;
    float _352 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _354 = _346 + _352;
    float _356 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[9].z, _348);
    float _358 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _360 = _350 + _358;
    float _362 = _354 * _354;
    float _364 = fma(_360, _360, _362);
    float _366 = _300 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _368 = sqrt(_364);
    float _370 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[5].x, _366);
    float _372 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[5].z, _370);
    float _374 = _372 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _376 = _374 + _356;
    bool _378 = _368 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _380 = _372;
    float _382 = _350;
    float _384 = _374;
    float _386 = _364;
    float _388 = _280;
    if (!_378)
    {
        _380 = _350;
    }
    float _390 = _380;
    float _392 = _390;
    if (!_378)
    {
        _382 = _346;
    }
    float _394 = _382;
    float _396 = _394;
    if (!_378)
    {
        _384 = _376;
    }
    float _398 = _384;
    bool _400 = !_378;
    float _402 = _398;
    if (!_400)
    {
        float _404 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _406 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _408 = _368 + _406;
        float _410 = _376 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _412 = rsqrt(_364);
        float _414 = _408 * _404;
        float _416 = _414 * 0.15915493667125701904296875;
        float _418 = _416 * 6.283185482025146484375;
        float _420 = cos(_418);
        float _422 = _416 * 6.283185482025146484375;
        float _424 = sin(_422);
        float _426 = _420 + (-1.0);
        float _428 = _426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _430 = fma(_424, _410, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _432 = fma(_376, _420, _428);
        float _434 = _412 * _430;
        float _436 = fma(_360, _434, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _438 = fma(_354, _434, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _402 = _432;
        _392 = _436;
        _396 = _438;
    }
    float _440 = _402;
    float _442 = _392;
    float _444 = _396;
    float _446 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _448 = _440 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _452 = _442 + _450;
    float _454 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _456 = _444 + _454;
    float _458 = _448 * _448;
    float _460 = fma(_452, _452, _458);
    float _462 = fma(_456, _456, _460);
    float _464 = rsqrt(_462);
    float _466 = sqrt(_462);
    float _468 = _464 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _470 = _452 * _468;
    float _472 = _456 * _468;
    float _474 = _470 * _470;
    float _476 = _472 * _472;
    float _478 = _474 + _476;
    float _480 = sqrt(_478);
    bool _482 = _480 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _486 = _480 + _484;
    float _488 = _324;
    float _490 = _478;
    float _492 = _486;
    float _494 = _470;
    float _496 = _456;
    float _498 = _448;
    float _500 = _452;
    if (_482)
    {
        float _502 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _488 = _502;
    }
    float _504 = _488;
    if (_482)
    {
        float _506 = rsqrt(_478);
        _490 = _506;
    }
    float _508 = _490;
    float _510 = _508;
    if (_482)
    {
        float _512 = _486 * _504;
        _492 = _512;
    }
    float _514 = _492;
    if (_482)
    {
        float _516 = _514 * 0.15915493667125701904296875;
        _386 = _516;
    }
    float _518 = _386;
    float _520 = _504;
    float _522 = _518;
    if (_482)
    {
        float _524 = _518 * 6.283185482025146484375;
        float _526 = sin(_524);
        _520 = _526;
    }
    float _528 = _520;
    float _530 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _532 = precise::max(0.0, _530);
    float _534 = _342;
    float _536 = _532;
    if (_482)
    {
        float _538 = _518 * 6.283185482025146484375;
        float _540 = cos(_538);
        _534 = _540;
    }
    float _542 = _534;
    float _544 = -_468;
    float _546 = -_532;
    float _548 = fma(_448, _544, _546);
    if (_482)
    {
        float _550 = _548 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _536 = _550;
    }
    float _552 = _536;
    float _554 = _528;
    float _556 = _552;
    if (_482)
    {
        float _558 = fma(_528, _552, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _554 = _558;
    }
    float _560 = _554;
    float _562 = _560;
    float _564 = _542;
    if (_482)
    {
        float _566 = _542 + (-1.0);
        _556 = _566;
    }
    float _568 = _556;
    float _570 = _568;
    if (_482)
    {
        float _572 = _508 * _560;
        _388 = _572;
    }
    float _574 = _388;
    if (!_482)
    {
        _562 = _548;
    }
    float _576 = _562;
    float _578 = _576;
    if (_482)
    {
        float _580 = _568 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _522 = _580;
    }
    float _582 = _522;
    if (_482)
    {
        float _584 = _470 * _574;
        _494 = _584;
    }
    float _586 = _494;
    if (!_482)
    {
        _570 = _472;
    }
    float _588 = _570;
    float _590 = _588;
    if (_482)
    {
        float _592 = _472 * _574;
        _590 = _592;
    }
    float _594 = _590;
    if (!_482)
    {
        _510 = _474;
    }
    float _596 = _510;
    float _598 = _596;
    if (_482)
    {
        float _600 = fma(_548, _542, _582);
        _578 = _600;
    }
    float _602 = _578;
    if (_482)
    {
        float _604 = _586 * _586;
        _598 = _604;
    }
    float _606 = _598;
    if (!_482)
    {
        _564 = _476;
    }
    float _608 = _564;
    float _610 = _608;
    if (_482)
    {
        float _612 = _594 * _594;
        _610 = _612;
    }
    float _614 = _610;
    float _616 = _440 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _618 = fma(_602, _602, _606);
    float _620 = _440 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _622 = _618 + _614;
    float _624 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[2].x, _616);
    float _626 = _440 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _628 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _630 = fma(_466, (*spvDescriptorSet0.vp_c15)._m0[23].w, _628);
    float _632 = precise::clamp(_630, 0.0, 1.0);
    float _634 = rsqrt(_622);
    float _636 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[2].z, _624);
    float _638 = _440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _640 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[1].x, _626);
    float _642 = -_632;
    float _644 = _642 + 1.0;
    float _646 = _636 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _648 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[0].x, _638);
    float _650 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[1].z, _640);
    float _652 = abs(_644);
    float _654 = log2(_652);
    float _656 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _658 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _648);
    float _660 = _650 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _662 = _646 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _664 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[3].x, _620);
    float _666 = _658 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _668 = _634 * _586;
    float _670 = _660 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _672 = _634 * _602;
    float _674 = -_662;
    float _676 = fma(_674, _656, 1.0);
    float _678 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[3].z, _664);
    float _680 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[7].x, _670);
    float _682 = _668 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _684 = _634 * _594;
    float _686 = _654 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _688 = _678 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _690 = -_682;
    float _692 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[21].y, _690);
    float _694 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[7].z, _680);
    float _696 = exp2(_686);
    float _698 = _660 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _700 = -_684;
    float _702 = fma(_700, (*spvDescriptorSet0.vp_c15)._m0[21].z, _692);
    float _704 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[7].w, _694);
    float _706 = _660 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _708 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[5].x, _698);
    float _710 = fma(_702, -0.5, 0.5);
    float _712 = fma(_702, 0.5, 0.5);
    float _714 = log2(_676);
    float _716 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[4].x, _706);
    float _718 = _672 + 1.0;
    float _720 = fma(_712, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _722 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[5].z, _708);
    float _724 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[4].z, _716);
    float _726 = fma(_712, _720, -0.212114393711090087890625);
    float _728 = 1.0 / _704;
    float _730 = -_672;
    float _732 = fma(_696, _718, _730);
    float _734 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[4].w, _724);
    float _736 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[5].w, _722);
    float _738 = fma(_712, _726, 1.570728778839111328125);
    float _740 = fma(_732, 0.5, 0.5);
    float _742 = sqrt(_710);
    float _744 = _714 * 0.693147182464599609375;
    float _746 = _734 * _728;
    float _748 = _736 * _728;
    float _750 = _744 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _752 = fma(_746, 0.5, 0.5);
    float _754 = fma(_748, -0.5, 0.5);
    float _756 = _742 * 0.636619746685028076171875;
    float3 _2762 = float3(_752, _754, _750);
    float _758 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2762, float3(0.0), isnan(_2762)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2762, float3(0.0), isnan(_2762)), level(0.0)).x;
    float3 _2773 = float3(_752, _754, _750);
    float4 _761 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2773, float3(0.0), isnan(_2773)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2773, float3(0.0), isnan(_2773)), level(0.0)).xyzw;
    float _763 = _761.x;
    float _765 = _761.y;
    float _767 = _761.z;
    float _769 = _761.w;
    float _771 = -_738;
    float _773 = fma(_756, _771, 1.0);
    float2 _2795 = float2(_773, _740);
    float3 _777 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2795, float2(0.0), isnan(_2795)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2795, float2(0.0), isnan(_2795)), level(0.0)).xyz;
    float _779 = _777.x;
    float _781 = _777.y;
    float _783 = _777.z;
    float _785 = in.m_55.w;
    float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _789 = in.m_57.z;
    float _791 = in.m_57.w;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _795 = _793 != 0;
    float _797 = _654 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _801 = _799 != 0;
    float _803 = in.m_55.y;
    float _805 = in.m_57.y;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _811 = _809 != 0;
    float _813 = in.m_57.x;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _817 = _815 != 0;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _823 = _821 != 0;
    float _825 = in.m_55.z;
    float _827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _829 = -_785;
    float _831 = _829 + 1.0;
    out.m_59.w = _785;
    float _833 = _660 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _835 = _789 > 0.5;
    float _837 = in.m_55.x;
    bool _839 = _791 > 0.5;
    float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _845 = _785;
    bool _847 = _839;
    float _849 = _789;
    float _851 = _704;
    float _853 = _734;
    float _855 = _736;
    if (_795)
    {
        float _857 = _835 ? _831 : _785;
        _845 = _857;
    }
    float _859 = _845;
    float _861 = -_803;
    float _863 = _861 + 1.0;
    int _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _867 = _865 != 0;
    float _869 = _791;
    float _871 = _803;
    float _873 = _805;
    if (_801)
    {
        float _875 = in.m_57.z;
        _869 = _875;
    }
    float _877 = _869;
    bool _879 = _805 > 0.5;
    float _881 = _827 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _885 = _813 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _887 = _879 ? as_type<int>(_863) : as_type<int>(_803);
    float _889 = fma(_881, _859, -0.5);
    int _891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _893 = _891 != 0;
    float _895 = -_819;
    float _897 = fma(_885, 2.0, _895);
    float _899 = _805 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _901 = _867 ? as_type<float>(_887) : _803;
    float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _905 = _825;
    float _907 = _901;
    if (_811)
    {
        float _909 = _839 ? _863 : _803;
        _871 = _909;
    }
    float _911 = _871;
    float _913 = fma(_899, -2.0, _807);
    bool _915 = _805 > 0.5;
    bool _917 = _915 && _823;
    float _919 = in.m_61.x;
    float _921 = in.m_61.y;
    float _923 = in.m_61.z;
    bool _925 = _188 != 0.0;
    bool _927 = isnan(_188);
    bool _929 = _925 || _927;
    bool _931 = isnan(0.0);
    bool _933 = _929 || _931;
    float _935 = -_140;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[76].x, _897);
    float _939 = 0.0;
    if (_823)
    {
        _939 = _825;
    }
    float _941 = _939;
    float _943 = exp2(_797);
    bool _945 = _186 == 0.0;
    bool _947 = !_933;
    bool _949 = _945 && _947;
    float _951 = in.m_63.y;
    float _953 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[6].x, _833);
    bool _955 = _190 == 0.0;
    bool _957 = _955 && _949;
    out.m_65.x = _442;
    out.m_65.y = _440;
    out.m_65.z = _444;
    float _959 = _941;
    float _961 = _877;
    bool _963 = _957;
    if (_801)
    {
        bool _965 = _877 > 0.5;
        _847 = _965;
    }
    bool _967 = _847;
    if (_917)
    {
        float _969 = -_941;
        float _971 = _969 + 1.0;
        _959 = _971;
    }
    float _973 = _959;
    float _975 = _903 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_817)
    {
        _961 = _837;
    }
    float _977 = _961;
    float _979 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[6].z, _953);
    float _981 = fma(_975, _901, -0.5);
    float _983 = _977;
    if (_823)
    {
        _905 = _973;
    }
    float _985 = _905;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _991 = _987;
    if (_893)
    {
        _907 = _813;
    }
    float _993 = _907;
    float _995 = -_943;
    float _997 = _995 + 1.0;
    float _999 = _993;
    if (!_893)
    {
        _999 = _789;
    }
    float _1001 = _999;
    float _1003 = _919;
    float _1005 = _923;
    float _1007 = _921;
    if (!_957)
    {
        float _1009 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[17].y, _919);
        _1003 = _1009;
    }
    float _1011 = _1003;
    float _1013 = 0.0;
    if (!_817)
    {
        _1013 = _977;
    }
    float _1015 = _1013;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1019 = _1015;
    if (_817)
    {
        _983 = _837;
    }
    float _1021 = _983;
    float _1023 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1025 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _913);
    float _1027 = _1021;
    if (!_957)
    {
        float _1029 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[17].y, _923);
        _1005 = _1029;
    }
    float _1031 = _1005;
    float _1033 = -_1017;
    float _1035 = fma(_1023, 2.0, _1033);
    float _1037 = _1017;
    if (!_893)
    {
        float _1039 = in.m_57.z;
        _1037 = _1039;
    }
    float _1041 = _1037;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1045 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[78].w, _987);
    if (!_893)
    {
        _991 = _805;
    }
    float _1047 = _991;
    float _1049 = _787 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1051 = _1047;
    int _1053 = as_type<int>(_1049);
    if (_893)
    {
        _1051 = _813;
    }
    float _1055 = _1051;
    float _1057 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1045);
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1061 = fma(_1049, _911, -0.5);
    if (!_957)
    {
        float _1063 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[17].y, _921);
        _1007 = _1063;
    }
    float _1065 = _1007;
    float _1067 = -_1025;
    float _1069 = fma(_1057, _981, _1067);
    if (_817)
    {
        float _1071 = -_1021;
        float _1073 = _1071 + 1.0;
        _1053 = as_type<int>(_1073);
    }
    int _1075 = _1053;
    float _1077 = as_type<float>(_1075);
    if (_817)
    {
        bool _1079 = _813 > 0.5;
        _963 = _1079;
    }
    bool _1081 = _963;
    float _1083 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1059);
    int _1085 = 0;
    if (_801)
    {
        float _1087 = -_1021;
        float _1089 = _1087 + 1.0;
        _1085 = as_type<int>(_1089);
    }
    int _1091 = _1085;
    float _1093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1097 = _841 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1099 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1101 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1043);
    if (_817)
    {
        float _1103 = _1081 ? as_type<float>(_1075) : _1021;
        _1019 = _1103;
    }
    float _1105 = _1019;
    float _1107 = fma(_1097, _985, -0.5);
    float _1109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_801)
    {
        float _1111 = _967 ? as_type<float>(_1091) : _1021;
        _1027 = _1111;
    }
    float _1113 = _1027;
    float _1115 = -_1095;
    float _1117 = fma(_1099, 2.0, _1115);
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1121 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1083);
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_893)
    {
        _849 = _805;
    }
    float _1125 = _849;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1129 = _1041;
    if (!_893)
    {
        _1077 = _1041;
    }
    float _1131 = _1077;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1135 = _1131;
    if (_893)
    {
        _1129 = _805;
    }
    float _1137 = _1129;
    float _1139 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1119);
    if (_893)
    {
        _1135 = _805;
    }
    float _1141 = _1135;
    float _1143 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1123);
    float _1145 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1133);
    if (!_893)
    {
        _873 = _813;
    }
    float _1147 = _873;
    float _1149 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1127);
    float _1151 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1153 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1155 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1157 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1139);
    float _1159 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1161 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1163 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1165 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1167 = fma(_1011, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1151);
    float _1169 = fma(_1011, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1153);
    float _1171 = fma(_1011, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1155);
    float _1173 = _1157 * (-0.15915493667125701904296875);
    float _1175 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1143);
    float _1177 = fma(_1159, _1105, -0.5);
    float _1179 = fma(_1161, _1113, -0.5);
    float _1181 = fma(_1165, -2.0, _883);
    float _1183 = fma(_1031, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1167);
    float _1185 = fma(_1031, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1169);
    float _1187 = fma(_1031, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1171);
    float _1189 = _1173 * 6.283185482025146484375;
    float _1191 = sin(_1189);
    float _1193 = fma(_1175, _1177, _937);
    float _1195 = -_140;
    float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1117);
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1201 = _1173 * 6.283185482025146484375;
    float _1203 = cos(_1201);
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1211 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1213 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1215 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1221 = fma(_1121, _1179, _1197);
    float _1223 = in.m_63.x;
    float _1225 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1227 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1149);
    float _1229 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1181);
    float _1231 = in.m_63.w;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1235 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1237 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1211;
    out.m_67.y = _1213;
    out.m_67.z = _1215;
    out.m_67.w = _1209;
    float _1239 = fma(_1225, -2.0, _989);
    float _1241 = _997 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1243 = -_140;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1035);
    out.m_69.x = _1163;
    out.m_69.y = _1235;
    out.m_69.z = _1237;
    out.m_69.w = _1233;
    float _1247 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1239);
    float _1249 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[6].w, _979);
    bool _1251 = _466 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1253 = isnan(_466);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1259 = _1255 || _1257;
    out.m_71.y = _951;
    out.m_73.x = _1183;
    out.m_73.y = _1185;
    out.m_73.z = _1187;
    float _1261 = _1191 * _889;
    float _1263 = -_1229;
    float _1265 = fma(_1227, _1061, _1263);
    float _1267 = _1203 * _889;
    float _1269 = _1193 + 0.5;
    float _1271 = -_1261;
    float _1273 = fma(_1203, _1107, _1271);
    float _1275 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1145);
    float _1277 = _1069 + 0.5;
    float _1279 = _1221 + 0.5;
    float _1281 = _1265 + 0.5;
    float _1283 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1101);
    float _1285 = fma(_1191, _1107, _1267);
    float _1287 = fma(_1275, _1273, _1245);
    float _1289 = _1249 + _704;
    out.m_75.x = _1269;
    out.m_75.y = _1277;
    out.m_75.z = _1279;
    out.m_75.w = _1281;
    float _1291 = -_1247;
    float _1293 = fma(_1283, _1285, _1291);
    float _1295 = _1287 + 0.5;
    float _1297 = _1289 * 0.5;
    out.m_71.x = _1223;
    float _1299 = _1293 + 0.5;
    out.m_71.w = _1231;
    out.m_77.x = _1295;
    out.m_77.y = _1299;
    float _1301 = -_1241;
    float _1303 = _1301 + 1.0;
    out.m_79.z = _1297;
    out.m_79.w = _704;
    out.m_81.x = _452;
    out.m_81.y = _448;
    out.m_81.z = _456;
    out.gl_Position.x = _734;
    out.gl_Position.y = _736;
    out.gl_Position.z = _1249;
    out.gl_Position.w = _704;
    if (!_1259)
    {
        _496 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1305 = _496;
    float _1307 = _1305;
    float _1309 = _1305;
    if (!_1259)
    {
        _498 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1311 = _498;
    float _1313 = _1311;
    float _1315 = _1311;
    if (!_1259)
    {
        _500 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1317 = _500;
    float _1319 = _1317;
    float _1321 = _1317;
    if (!_1259)
    {
        _851 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1323 = _851;
    float _1325 = _1323;
    float _1327 = _1323;
    if (!_1259)
    {
        _853 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1329 = _853;
    float _1331 = _1329;
    float _1333 = _1329;
    if (!_1259)
    {
        _855 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1335 = _855;
    float _1337 = _1241 * _758;
    float _1339 = _769 * _1303;
    float _1341 = _769 * _1337;
    float _1343 = _783 * _1337;
    float _1345 = fma(_779, _1341, _763);
    float _1347 = fma(_781, _1341, _765);
    float _1349 = fma(_769, _1343, _767);
    out.m_83.x = _1345;
    out.m_83.y = _1347;
    out.m_83.z = _1349;
    out.m_83.w = _1339;
    bool _1351 = !_1259;
    float _1353 = _1335;
    float _1355 = _1335;
    if (!_1351)
    {
        bool _1357 = _466 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1359 = isnan(_466);
        bool _1361 = _1357 || _1359;
        bool _1363 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1365 = _1361 || _1363;
        if (!_1365)
        {
            float _1367 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1369 = _466 + _1367;
            float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1373 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1371;
            float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1377 = _1375 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1379 = 1.0 / _1373;
            float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1383 = _1381 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1387 = _1385 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1389 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1391 = _1389 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1393 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1395 = _1393 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1397 = _1369 * _1379;
            float _1399 = precise::clamp(_1397, 0.0, 1.0);
            float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1403 = _1401 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1405 = fma(_1399, _1377, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1407 = fma(_1399, _1403, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1409 = fma(_1399, _1383, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1411 = fma(_1399, _1387, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1413 = fma(_1399, _1391, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1415 = fma(_1399, _1395, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1333 = _1409;
            _1315 = _1413;
            _1327 = _1405;
            _1309 = _1411;
            _1355 = _1407;
            _1321 = _1415;
            _1417 = true;
        }
        else
        {
            bool _1419 = _466 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1421 = isnan(_466);
            bool _1423 = _1419 || _1421;
            bool _1425 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1427 = _1423 || _1425;
            if (!_1427)
            {
                _1325 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1429 = _1325;
            _1327 = _1429;
            if (!_1427)
            {
                _1331 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1431 = _1331;
            _1333 = _1431;
            if (!_1427)
            {
                _1353 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1433 = _1353;
            _1355 = _1433;
            if (!_1427)
            {
                _1307 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1435 = _1307;
            _1309 = _1435;
            if (!_1427)
            {
                _1313 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1437 = _1313;
            _1315 = _1437;
            if (!_1427)
            {
                _1319 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1439 = _1319;
            bool _1441 = !_1427;
            _1321 = _1439;
            if (!_1441)
            {
                bool _1443 = _466 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1445 = isnan(_466);
                bool _1447 = _1443 || _1445;
                bool _1449 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1451 = _1447 || _1449;
                if (!_1451)
                {
                    float _1453 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1455 = _466 + _1453;
                    float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1459 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1457;
                    float _1461 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1463 = _1461 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1465 = 1.0 / _1459;
                    float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1469 = _1467 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1471 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1473 = _1471 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1477 = _1475 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1481 = _1479 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1483 = _1455 * _1465;
                    float _1485 = precise::clamp(_1483, 0.0, 1.0);
                    float _1487 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1489 = _1487 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1491 = fma(_1485, _1463, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1493 = fma(_1485, _1489, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1495 = fma(_1485, _1469, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1497 = fma(_1485, _1473, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1499 = fma(_1485, _1477, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1501 = fma(_1485, _1481, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1333 = _1495;
                    _1315 = _1499;
                    _1327 = _1491;
                    _1309 = _1497;
                    _1355 = _1493;
                    _1321 = _1501;
                    _1417 = true;
                }
                else
                {
                    _1333 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1315 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1327 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1309 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1355 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1321 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1417 = false;
    float _1503 = _1333;
    float _1505 = _1315;
    float _1507 = _1327;
    float _1509 = _1309;
    float _1511 = _1355;
    float _1513 = _1321;
    float _1515 = fma(_1185, -0.5, 0.5);
    float _1517 = precise::clamp(_1515, 0.0, 1.0);
    float _1519 = -_1503;
    float _1521 = _1519 + _1505;
    float _1523 = -_1507;
    float _1525 = _1523 + _1509;
    float _1527 = -_1511;
    float _1529 = _1527 + _1513;
    bool _1531 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1533 = fma(_1517, _1521, _1503);
    float _1535 = fma(_1517, _1525, _1507);
    float _1537 = fma(_1517, _1529, _1511);
    float _1539 = _1533 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _1541 = fma(_1535, 0.298911988735198974609375, _1539);
    float _1543 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1545 = fma(_1537, 0.114477999508380889892578125, _1541);
    out.m_47.x = _1543;
    float _1547 = -_1545;
    float _1549 = _1535 + _1547;
    float _1551 = -_1545;
    float _1553 = _1533 + _1551;
    float _1555 = -_1545;
    float _1557 = _1537 + _1555;
    float _1559 = fma(_1549, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1545);
    float _1561 = fma(_1553, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1545);
    float _1563 = fma(_1557, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1545);
    out.m_87.x = _1559;
    out.m_87.y = _1561;
    out.m_87.z = _1563;
    if (!_1531)
    {
        return out;
    }
    float _1565 = -_440;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1569 = -_442;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1573 = -_444;
    float _1575 = _1573 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1577 = _1567 * _1567;
    float _1579 = fma(_1571, _1571, _1577);
    float _1581 = fma(_1575, _1575, _1579);
    float _1583 = sqrt(_1581);
    float _1585 = rsqrt(_1581);
    float _1587 = -_1583;
    float _1589 = _1587 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1591 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1593 = precise::clamp(_1591, 0.0, 1.0);
    float _1595 = _1571 * _1585;
    float _1597 = _1567 * _1585;
    float _1599 = abs(_1593);
    float _1601 = log2(_1599);
    float _1603 = _1575 * _1585;
    float _1605 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1607 = _1185 * _1597;
    float _1609 = -_1597;
    float _1611 = -_1605;
    float _1613 = fma(_1609, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1611);
    float _1615 = fma(_1183, _1595, _1607);
    float _1617 = -_1603;
    float _1619 = fma(_1617, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1613);
    float _1621 = fma(_1187, _1603, _1615);
    float _1623 = precise::clamp(_1621, 0.0, 1.0);
    float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1627 = _1619 + _1625;
    float _1629 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1631 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1633 = precise::clamp(_1631, 0.0, 1.0);
    float _1635 = exp2(_1629);
    float _1637 = _1635 * _1633;
    float _1639 = _1623 * _1637;
    float _1641 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1643 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1645 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1641;
    out.m_85.y = _1643;
    out.m_85.z = _1645;
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1417 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1703 = as_type<float>(_122);
        out.gl_Position.z = _1703;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_49.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_106);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1772 = as_type<float>(_158);
        out.gl_Position.z = _1772;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_51.w;
    float _162 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _164 = in.m_49.x;
    float _166 = in.m_49.y;
    float _168 = in.m_49.z;
    bool _170 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _172 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _174 = _170 || _172;
    bool _176 = isnan(1.0);
    bool _178 = _174 || _176;
    float _180 = in.m_44.x;
    float _182 = in.m_44.y;
    float _184 = in.m_44.z;
    float _186 = in.m_53.x;
    float _188 = in.m_53.y;
    float _190 = in.m_53.z;
    float _192 = in.m_51.x;
    float _194 = in.m_51.y;
    float _196 = in.m_51.z;
    float _198 = 0.0;
    float _200 = _162;
    if (!_178)
    {
        float _202 = _162 * _162;
        float _204 = _202 * 0.5;
        _198 = _204;
    }
    float _206 = _198;
    float _208 = _206;
    if (!_178)
    {
        float _210 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _210;
    }
    float _212 = _208;
    bool _214 = !_178;
    float _216 = _212;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _162 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _162);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_178;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _162 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _200 = _270;
    }
    float _272 = _200;
    float _274 = _192 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _276 = _194 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _188);
    float _282 = _274 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _284 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _286 = _276 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _186);
    float _290 = _278 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _292 = fma(_272, _166, _284);
    float _294 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _296 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _298 = _286 * _280;
    float _300 = fma(_292, _160, _182);
    float _302 = fma(_272, _164, _294);
    float _304 = fma(_272, _168, _296);
    float _306 = _282 * _288;
    float _308 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _190);
    float _310 = fma(_302, _160, _180);
    float _312 = _300 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _314 = fma(_304, _160, _184);
    float _316 = _298 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _318 = _300 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _320 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[6].x, _312);
    float _322 = _298 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _324 = _290 * _308;
    float _326 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].x, _316);
    float _328 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[4].x, _318);
    float _330 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[6].z, _320);
    float _332 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[8].x, _322);
    float _334 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[10].z, _326);
    float _336 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[4].z, _328);
    float _338 = _330 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _340 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[8].z, _332);
    float _342 = _298 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _344 = _336 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _346 = _338 + _334;
    float _348 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[9].x, _342);
    float _350 = _344 + _340;
    float _352 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _354 = _346 + _352;
    float _356 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[9].z, _348);
    float _358 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _360 = _350 + _358;
    float _362 = _354 * _354;
    float _364 = fma(_360, _360, _362);
    float _366 = _300 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _368 = sqrt(_364);
    float _370 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[5].x, _366);
    float _372 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[5].z, _370);
    float _374 = _372 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _376 = _374 + _356;
    bool _378 = _368 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _380 = _372;
    float _382 = _350;
    float _384 = _374;
    float _386 = _364;
    float _388 = _280;
    if (!_378)
    {
        _380 = _350;
    }
    float _390 = _380;
    float _392 = _390;
    if (!_378)
    {
        _382 = _346;
    }
    float _394 = _382;
    float _396 = _394;
    if (!_378)
    {
        _384 = _376;
    }
    float _398 = _384;
    bool _400 = !_378;
    float _402 = _398;
    if (!_400)
    {
        float _404 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _406 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _408 = _368 + _406;
        float _410 = _376 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _412 = rsqrt(_364);
        float _414 = _408 * _404;
        float _416 = _414 * 0.15915493667125701904296875;
        float _418 = _416 * 6.283185482025146484375;
        float _420 = cos(_418);
        float _422 = _416 * 6.283185482025146484375;
        float _424 = sin(_422);
        float _426 = _420 + (-1.0);
        float _428 = _426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _430 = fma(_424, _410, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _432 = fma(_376, _420, _428);
        float _434 = _412 * _430;
        float _436 = fma(_360, _434, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _438 = fma(_354, _434, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _402 = _432;
        _392 = _436;
        _396 = _438;
    }
    float _440 = _402;
    float _442 = _392;
    float _444 = _396;
    float _446 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _448 = _440 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _452 = _442 + _450;
    float _454 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _456 = _444 + _454;
    float _458 = _448 * _448;
    float _460 = fma(_452, _452, _458);
    float _462 = fma(_456, _456, _460);
    float _464 = rsqrt(_462);
    float _466 = sqrt(_462);
    float _468 = _464 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _470 = _452 * _468;
    float _472 = _456 * _468;
    float _474 = _470 * _470;
    float _476 = _472 * _472;
    float _478 = _474 + _476;
    float _480 = sqrt(_478);
    bool _482 = _480 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _486 = _480 + _484;
    float _488 = _324;
    float _490 = _478;
    float _492 = _486;
    float _494 = _470;
    float _496 = _456;
    float _498 = _448;
    float _500 = _452;
    if (_482)
    {
        float _502 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _488 = _502;
    }
    float _504 = _488;
    if (_482)
    {
        float _506 = rsqrt(_478);
        _490 = _506;
    }
    float _508 = _490;
    float _510 = _508;
    if (_482)
    {
        float _512 = _486 * _504;
        _492 = _512;
    }
    float _514 = _492;
    if (_482)
    {
        float _516 = _514 * 0.15915493667125701904296875;
        _386 = _516;
    }
    float _518 = _386;
    float _520 = _504;
    float _522 = _518;
    if (_482)
    {
        float _524 = _518 * 6.283185482025146484375;
        float _526 = sin(_524);
        _520 = _526;
    }
    float _528 = _520;
    float _530 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _532 = precise::max(0.0, _530);
    float _534 = _342;
    float _536 = _532;
    if (_482)
    {
        float _538 = _518 * 6.283185482025146484375;
        float _540 = cos(_538);
        _534 = _540;
    }
    float _542 = _534;
    float _544 = -_468;
    float _546 = -_532;
    float _548 = fma(_448, _544, _546);
    if (_482)
    {
        float _550 = _548 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _536 = _550;
    }
    float _552 = _536;
    float _554 = _528;
    float _556 = _552;
    if (_482)
    {
        float _558 = fma(_528, _552, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _554 = _558;
    }
    float _560 = _554;
    float _562 = _560;
    float _564 = _542;
    if (_482)
    {
        float _566 = _542 + (-1.0);
        _556 = _566;
    }
    float _568 = _556;
    float _570 = _568;
    if (_482)
    {
        float _572 = _508 * _560;
        _388 = _572;
    }
    float _574 = _388;
    if (!_482)
    {
        _562 = _548;
    }
    float _576 = _562;
    float _578 = _576;
    if (_482)
    {
        float _580 = _568 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _522 = _580;
    }
    float _582 = _522;
    if (_482)
    {
        float _584 = _470 * _574;
        _494 = _584;
    }
    float _586 = _494;
    if (!_482)
    {
        _570 = _472;
    }
    float _588 = _570;
    float _590 = _588;
    if (_482)
    {
        float _592 = _472 * _574;
        _590 = _592;
    }
    float _594 = _590;
    if (!_482)
    {
        _510 = _474;
    }
    float _596 = _510;
    float _598 = _596;
    if (_482)
    {
        float _600 = fma(_548, _542, _582);
        _578 = _600;
    }
    float _602 = _578;
    if (_482)
    {
        float _604 = _586 * _586;
        _598 = _604;
    }
    float _606 = _598;
    if (!_482)
    {
        _564 = _476;
    }
    float _608 = _564;
    float _610 = _608;
    if (_482)
    {
        float _612 = _594 * _594;
        _610 = _612;
    }
    float _614 = _610;
    float _616 = _440 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _618 = fma(_602, _602, _606);
    float _620 = _440 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _622 = _618 + _614;
    float _624 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[2].x, _616);
    float _626 = _440 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _628 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _630 = fma(_466, (*spvDescriptorSet0.vp_c15)._m0[23].w, _628);
    float _632 = precise::clamp(_630, 0.0, 1.0);
    float _634 = rsqrt(_622);
    float _636 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[2].z, _624);
    float _638 = _440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _640 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[1].x, _626);
    float _642 = -_632;
    float _644 = _642 + 1.0;
    float _646 = _636 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _648 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[0].x, _638);
    float _650 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[1].z, _640);
    float _652 = abs(_644);
    float _654 = log2(_652);
    float _656 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _658 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _648);
    float _660 = _650 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _662 = _646 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _664 = fma(_442, (*spvDescriptorSet0.vp_c8)._m0[3].x, _620);
    float _666 = _658 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _668 = _634 * _586;
    float _670 = _660 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _672 = _634 * _602;
    float _674 = -_662;
    float _676 = fma(_674, _656, 1.0);
    float _678 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[3].z, _664);
    float _680 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[7].x, _670);
    float _682 = _668 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _684 = _634 * _594;
    float _686 = _654 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _688 = _678 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _690 = -_682;
    float _692 = fma(_672, (*spvDescriptorSet0.vp_c15)._m0[21].y, _690);
    float _694 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[7].z, _680);
    float _696 = exp2(_686);
    float _698 = _660 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _700 = -_684;
    float _702 = fma(_700, (*spvDescriptorSet0.vp_c15)._m0[21].z, _692);
    float _704 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[7].w, _694);
    float _706 = _660 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _708 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[5].x, _698);
    float _710 = fma(_702, -0.5, 0.5);
    float _712 = fma(_702, 0.5, 0.5);
    float _714 = log2(_676);
    float _716 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[4].x, _706);
    float _718 = _672 + 1.0;
    float _720 = fma(_712, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _722 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[5].z, _708);
    float _724 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[4].z, _716);
    float _726 = fma(_712, _720, -0.212114393711090087890625);
    float _728 = 1.0 / _704;
    float _730 = -_672;
    float _732 = fma(_696, _718, _730);
    float _734 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[4].w, _724);
    float _736 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[5].w, _722);
    float _738 = fma(_712, _726, 1.570728778839111328125);
    float _740 = fma(_732, 0.5, 0.5);
    float _742 = sqrt(_710);
    float _744 = _714 * 0.693147182464599609375;
    float _746 = _734 * _728;
    float _748 = _736 * _728;
    float _750 = _744 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _752 = fma(_746, 0.5, 0.5);
    float _754 = fma(_748, -0.5, 0.5);
    float _756 = _742 * 0.636619746685028076171875;
    float3 _2762 = float3(_752, _754, _750);
    float _758 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2762, float3(0.0), isnan(_2762)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2762, float3(0.0), isnan(_2762)), level(0.0)).x;
    float3 _2773 = float3(_752, _754, _750);
    float4 _761 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2773, float3(0.0), isnan(_2773)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2773, float3(0.0), isnan(_2773)), level(0.0)).xyzw;
    float _763 = _761.x;
    float _765 = _761.y;
    float _767 = _761.z;
    float _769 = _761.w;
    float _771 = -_738;
    float _773 = fma(_756, _771, 1.0);
    float2 _2795 = float2(_773, _740);
    float3 _777 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2795, float2(0.0), isnan(_2795)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2795, float2(0.0), isnan(_2795)), level(0.0)).xyz;
    float _779 = _777.x;
    float _781 = _777.y;
    float _783 = _777.z;
    float _785 = in.m_55.w;
    float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _789 = in.m_57.z;
    float _791 = in.m_57.w;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _795 = _793 != 0;
    float _797 = _654 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _801 = _799 != 0;
    float _803 = in.m_55.y;
    float _805 = in.m_57.y;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _811 = _809 != 0;
    float _813 = in.m_57.x;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _817 = _815 != 0;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _823 = _821 != 0;
    float _825 = in.m_55.z;
    float _827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _829 = -_785;
    float _831 = _829 + 1.0;
    out.m_59.w = _785;
    float _833 = _660 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _835 = _789 > 0.5;
    float _837 = in.m_55.x;
    bool _839 = _791 > 0.5;
    float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _845 = _785;
    bool _847 = _839;
    float _849 = _789;
    float _851 = _704;
    float _853 = _734;
    float _855 = _736;
    if (_795)
    {
        float _857 = _835 ? _831 : _785;
        _845 = _857;
    }
    float _859 = _845;
    float _861 = -_803;
    float _863 = _861 + 1.0;
    int _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _867 = _865 != 0;
    float _869 = _791;
    float _871 = _803;
    float _873 = _805;
    if (_801)
    {
        float _875 = in.m_57.z;
        _869 = _875;
    }
    float _877 = _869;
    bool _879 = _805 > 0.5;
    float _881 = _827 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _885 = _813 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _887 = _879 ? as_type<int>(_863) : as_type<int>(_803);
    float _889 = fma(_881, _859, -0.5);
    int _891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _893 = _891 != 0;
    float _895 = -_819;
    float _897 = fma(_885, 2.0, _895);
    float _899 = _805 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _901 = _867 ? as_type<float>(_887) : _803;
    float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _905 = _825;
    float _907 = _901;
    if (_811)
    {
        float _909 = _839 ? _863 : _803;
        _871 = _909;
    }
    float _911 = _871;
    float _913 = fma(_899, -2.0, _807);
    bool _915 = _805 > 0.5;
    bool _917 = _915 && _823;
    float _919 = in.m_61.x;
    float _921 = in.m_61.y;
    float _923 = in.m_61.z;
    bool _925 = _188 != 0.0;
    bool _927 = isnan(_188);
    bool _929 = _925 || _927;
    bool _931 = isnan(0.0);
    bool _933 = _929 || _931;
    float _935 = -_140;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[76].x, _897);
    float _939 = 0.0;
    if (_823)
    {
        _939 = _825;
    }
    float _941 = _939;
    float _943 = exp2(_797);
    bool _945 = _186 == 0.0;
    bool _947 = !_933;
    bool _949 = _945 && _947;
    float _951 = in.m_63.y;
    float _953 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[6].x, _833);
    bool _955 = _190 == 0.0;
    bool _957 = _955 && _949;
    out.m_65.x = _442;
    out.m_65.y = _440;
    out.m_65.z = _444;
    float _959 = _941;
    float _961 = _877;
    bool _963 = _957;
    if (_801)
    {
        bool _965 = _877 > 0.5;
        _847 = _965;
    }
    bool _967 = _847;
    if (_917)
    {
        float _969 = -_941;
        float _971 = _969 + 1.0;
        _959 = _971;
    }
    float _973 = _959;
    float _975 = _903 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_817)
    {
        _961 = _837;
    }
    float _977 = _961;
    float _979 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[6].z, _953);
    float _981 = fma(_975, _901, -0.5);
    float _983 = _977;
    if (_823)
    {
        _905 = _973;
    }
    float _985 = _905;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _991 = _987;
    if (_893)
    {
        _907 = _813;
    }
    float _993 = _907;
    float _995 = -_943;
    float _997 = _995 + 1.0;
    float _999 = _993;
    if (!_893)
    {
        _999 = _789;
    }
    float _1001 = _999;
    float _1003 = _919;
    float _1005 = _923;
    float _1007 = _921;
    if (!_957)
    {
        float _1009 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[17].y, _919);
        _1003 = _1009;
    }
    float _1011 = _1003;
    float _1013 = 0.0;
    if (!_817)
    {
        _1013 = _977;
    }
    float _1015 = _1013;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1019 = _1015;
    if (_817)
    {
        _983 = _837;
    }
    float _1021 = _983;
    float _1023 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1025 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _913);
    float _1027 = _1021;
    if (!_957)
    {
        float _1029 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[17].y, _923);
        _1005 = _1029;
    }
    float _1031 = _1005;
    float _1033 = -_1017;
    float _1035 = fma(_1023, 2.0, _1033);
    float _1037 = _1017;
    if (!_893)
    {
        float _1039 = in.m_57.z;
        _1037 = _1039;
    }
    float _1041 = _1037;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1045 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[78].w, _987);
    if (!_893)
    {
        _991 = _805;
    }
    float _1047 = _991;
    float _1049 = _787 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1051 = _1047;
    int _1053 = as_type<int>(_1049);
    if (_893)
    {
        _1051 = _813;
    }
    float _1055 = _1051;
    float _1057 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1045);
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1061 = fma(_1049, _911, -0.5);
    if (!_957)
    {
        float _1063 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[17].y, _921);
        _1007 = _1063;
    }
    float _1065 = _1007;
    float _1067 = -_1025;
    float _1069 = fma(_1057, _981, _1067);
    if (_817)
    {
        float _1071 = -_1021;
        float _1073 = _1071 + 1.0;
        _1053 = as_type<int>(_1073);
    }
    int _1075 = _1053;
    float _1077 = as_type<float>(_1075);
    if (_817)
    {
        bool _1079 = _813 > 0.5;
        _963 = _1079;
    }
    bool _1081 = _963;
    float _1083 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1059);
    int _1085 = 0;
    if (_801)
    {
        float _1087 = -_1021;
        float _1089 = _1087 + 1.0;
        _1085 = as_type<int>(_1089);
    }
    int _1091 = _1085;
    float _1093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1097 = _841 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1099 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1101 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1043);
    if (_817)
    {
        float _1103 = _1081 ? as_type<float>(_1075) : _1021;
        _1019 = _1103;
    }
    float _1105 = _1019;
    float _1107 = fma(_1097, _985, -0.5);
    float _1109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_801)
    {
        float _1111 = _967 ? as_type<float>(_1091) : _1021;
        _1027 = _1111;
    }
    float _1113 = _1027;
    float _1115 = -_1095;
    float _1117 = fma(_1099, 2.0, _1115);
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1121 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1083);
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_893)
    {
        _849 = _805;
    }
    float _1125 = _849;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1129 = _1041;
    if (!_893)
    {
        _1077 = _1041;
    }
    float _1131 = _1077;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1135 = _1131;
    if (_893)
    {
        _1129 = _805;
    }
    float _1137 = _1129;
    float _1139 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1119);
    if (_893)
    {
        _1135 = _805;
    }
    float _1141 = _1135;
    float _1143 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1123);
    float _1145 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1133);
    if (!_893)
    {
        _873 = _813;
    }
    float _1147 = _873;
    float _1149 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1127);
    float _1151 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1153 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1155 = _1065 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1157 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1139);
    float _1159 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1161 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1163 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1165 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1167 = fma(_1011, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1151);
    float _1169 = fma(_1011, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1153);
    float _1171 = fma(_1011, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1155);
    float _1173 = _1157 * (-0.15915493667125701904296875);
    float _1175 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1143);
    float _1177 = fma(_1159, _1105, -0.5);
    float _1179 = fma(_1161, _1113, -0.5);
    float _1181 = fma(_1165, -2.0, _883);
    float _1183 = fma(_1031, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1167);
    float _1185 = fma(_1031, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1169);
    float _1187 = fma(_1031, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1171);
    float _1189 = _1173 * 6.283185482025146484375;
    float _1191 = sin(_1189);
    float _1193 = fma(_1175, _1177, _937);
    float _1195 = -_140;
    float _1197 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1117);
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1201 = _1173 * 6.283185482025146484375;
    float _1203 = cos(_1201);
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1211 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1213 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1215 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1221 = fma(_1121, _1179, _1197);
    float _1223 = in.m_63.x;
    float _1225 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1227 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1149);
    float _1229 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1181);
    float _1231 = in.m_63.w;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1235 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1237 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1211;
    out.m_67.y = _1213;
    out.m_67.z = _1215;
    out.m_67.w = _1209;
    float _1239 = fma(_1225, -2.0, _989);
    float _1241 = _997 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1243 = -_140;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1035);
    out.m_69.x = _1163;
    out.m_69.y = _1235;
    out.m_69.z = _1237;
    out.m_69.w = _1233;
    float _1247 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1239);
    float _1249 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[6].w, _979);
    bool _1251 = _466 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1253 = isnan(_466);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1259 = _1255 || _1257;
    out.m_71.y = _951;
    out.m_73.x = _1183;
    out.m_73.y = _1185;
    out.m_73.z = _1187;
    float _1261 = _1191 * _889;
    float _1263 = -_1229;
    float _1265 = fma(_1227, _1061, _1263);
    float _1267 = _1203 * _889;
    float _1269 = _1193 + 0.5;
    float _1271 = -_1261;
    float _1273 = fma(_1203, _1107, _1271);
    float _1275 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1145);
    float _1277 = _1069 + 0.5;
    float _1279 = _1221 + 0.5;
    float _1281 = _1265 + 0.5;
    float _1283 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1101);
    float _1285 = fma(_1191, _1107, _1267);
    float _1287 = fma(_1275, _1273, _1245);
    float _1289 = _1249 + _704;
    out.m_75.x = _1269;
    out.m_75.y = _1277;
    out.m_75.z = _1279;
    out.m_75.w = _1281;
    float _1291 = -_1247;
    float _1293 = fma(_1283, _1285, _1291);
    float _1295 = _1287 + 0.5;
    float _1297 = _1289 * 0.5;
    out.m_71.x = _1223;
    float _1299 = _1293 + 0.5;
    out.m_71.w = _1231;
    out.m_77.x = _1295;
    out.m_77.y = _1299;
    float _1301 = -_1241;
    float _1303 = _1301 + 1.0;
    out.m_79.z = _1297;
    out.m_79.w = _704;
    out.m_81.x = _452;
    out.m_81.y = _448;
    out.m_81.z = _456;
    out.gl_Position.x = _734;
    out.gl_Position.y = _736;
    out.gl_Position.z = _1249;
    out.gl_Position.w = _704;
    if (!_1259)
    {
        _496 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1305 = _496;
    float _1307 = _1305;
    float _1309 = _1305;
    if (!_1259)
    {
        _498 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1311 = _498;
    float _1313 = _1311;
    float _1315 = _1311;
    if (!_1259)
    {
        _500 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1317 = _500;
    float _1319 = _1317;
    float _1321 = _1317;
    if (!_1259)
    {
        _851 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1323 = _851;
    float _1325 = _1323;
    float _1327 = _1323;
    if (!_1259)
    {
        _853 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1329 = _853;
    float _1331 = _1329;
    float _1333 = _1329;
    if (!_1259)
    {
        _855 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1335 = _855;
    float _1337 = _1241 * _758;
    float _1339 = _769 * _1303;
    float _1341 = _769 * _1337;
    float _1343 = _783 * _1337;
    float _1345 = fma(_779, _1341, _763);
    float _1347 = fma(_781, _1341, _765);
    float _1349 = fma(_769, _1343, _767);
    out.m_83.x = _1345;
    out.m_83.y = _1347;
    out.m_83.z = _1349;
    out.m_83.w = _1339;
    bool _1351 = !_1259;
    float _1353 = _1335;
    float _1355 = _1335;
    if (!_1351)
    {
        bool _1357 = _466 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1359 = isnan(_466);
        bool _1361 = _1357 || _1359;
        bool _1363 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1365 = _1361 || _1363;
        if (!_1365)
        {
            float _1367 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1369 = _466 + _1367;
            float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1373 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1371;
            float _1375 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1377 = _1375 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1379 = 1.0 / _1373;
            float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1383 = _1381 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1385 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1387 = _1385 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1389 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1391 = _1389 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1393 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1395 = _1393 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1397 = _1369 * _1379;
            float _1399 = precise::clamp(_1397, 0.0, 1.0);
            float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1403 = _1401 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1405 = fma(_1399, _1377, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1407 = fma(_1399, _1403, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1409 = fma(_1399, _1383, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1411 = fma(_1399, _1387, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1413 = fma(_1399, _1391, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1415 = fma(_1399, _1395, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1333 = _1409;
            _1315 = _1413;
            _1327 = _1405;
            _1309 = _1411;
            _1355 = _1407;
            _1321 = _1415;
            _1417 = true;
        }
        else
        {
            bool _1419 = _466 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1421 = isnan(_466);
            bool _1423 = _1419 || _1421;
            bool _1425 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1427 = _1423 || _1425;
            if (!_1427)
            {
                _1325 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1429 = _1325;
            _1327 = _1429;
            if (!_1427)
            {
                _1331 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1431 = _1331;
            _1333 = _1431;
            if (!_1427)
            {
                _1353 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1433 = _1353;
            _1355 = _1433;
            if (!_1427)
            {
                _1307 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1435 = _1307;
            _1309 = _1435;
            if (!_1427)
            {
                _1313 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1437 = _1313;
            _1315 = _1437;
            if (!_1427)
            {
                _1319 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1439 = _1319;
            bool _1441 = !_1427;
            _1321 = _1439;
            if (!_1441)
            {
                bool _1443 = _466 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1445 = isnan(_466);
                bool _1447 = _1443 || _1445;
                bool _1449 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1451 = _1447 || _1449;
                if (!_1451)
                {
                    float _1453 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1455 = _466 + _1453;
                    float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1459 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1457;
                    float _1461 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1463 = _1461 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1465 = 1.0 / _1459;
                    float _1467 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1469 = _1467 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1471 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1473 = _1471 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1475 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1477 = _1475 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1479 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1481 = _1479 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1483 = _1455 * _1465;
                    float _1485 = precise::clamp(_1483, 0.0, 1.0);
                    float _1487 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1489 = _1487 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1491 = fma(_1485, _1463, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1493 = fma(_1485, _1489, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1495 = fma(_1485, _1469, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1497 = fma(_1485, _1473, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1499 = fma(_1485, _1477, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1501 = fma(_1485, _1481, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1333 = _1495;
                    _1315 = _1499;
                    _1327 = _1491;
                    _1309 = _1497;
                    _1355 = _1493;
                    _1321 = _1501;
                    _1417 = true;
                }
                else
                {
                    _1333 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1315 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1327 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1309 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1355 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1321 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1417 = false;
    float _1503 = _1333;
    float _1505 = _1315;
    float _1507 = _1327;
    float _1509 = _1309;
    float _1511 = _1355;
    float _1513 = _1321;
    float _1515 = fma(_1185, -0.5, 0.5);
    float _1517 = precise::clamp(_1515, 0.0, 1.0);
    float _1519 = -_1503;
    float _1521 = _1519 + _1505;
    float _1523 = -_1507;
    float _1525 = _1523 + _1509;
    float _1527 = -_1511;
    float _1529 = _1527 + _1513;
    bool _1531 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1533 = fma(_1517, _1521, _1503);
    float _1535 = fma(_1517, _1525, _1507);
    float _1537 = fma(_1517, _1529, _1511);
    float _1539 = _1533 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _1541 = fma(_1535, 0.298911988735198974609375, _1539);
    float _1543 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1545 = fma(_1537, 0.114477999508380889892578125, _1541);
    out.m_47.x = _1543;
    float _1547 = -_1545;
    float _1549 = _1535 + _1547;
    float _1551 = -_1545;
    float _1553 = _1533 + _1551;
    float _1555 = -_1545;
    float _1557 = _1537 + _1555;
    float _1559 = fma(_1549, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1545);
    float _1561 = fma(_1553, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1545);
    float _1563 = fma(_1557, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1545);
    out.m_87.x = _1559;
    out.m_87.y = _1561;
    out.m_87.z = _1563;
    if (!_1531)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1565 = -_440;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1569 = -_442;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1573 = -_444;
    float _1575 = _1573 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1577 = _1567 * _1567;
    float _1579 = fma(_1571, _1571, _1577);
    float _1581 = fma(_1575, _1575, _1579);
    float _1583 = sqrt(_1581);
    float _1585 = rsqrt(_1581);
    float _1587 = -_1583;
    float _1589 = _1587 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1591 = _1589 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1593 = precise::clamp(_1591, 0.0, 1.0);
    float _1595 = _1571 * _1585;
    float _1597 = _1567 * _1585;
    float _1599 = abs(_1593);
    float _1601 = log2(_1599);
    float _1603 = _1575 * _1585;
    float _1605 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1607 = _1185 * _1597;
    float _1609 = -_1597;
    float _1611 = -_1605;
    float _1613 = fma(_1609, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1611);
    float _1615 = fma(_1183, _1595, _1607);
    float _1617 = -_1603;
    float _1619 = fma(_1617, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1613);
    float _1621 = fma(_1187, _1603, _1615);
    float _1623 = precise::clamp(_1621, 0.0, 1.0);
    float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1627 = _1619 + _1625;
    float _1629 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1631 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1633 = precise::clamp(_1631, 0.0, 1.0);
    float _1635 = exp2(_1629);
    float _1637 = _1635 * _1633;
    float _1639 = _1623 * _1637;
    float _1641 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1643 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1645 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1641;
    out.m_85.y = _1643;
    out.m_85.z = _1645;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

