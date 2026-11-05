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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
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
    float4 m_65 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_69 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = in.m_44.w;
    float _87 = trunc(_83);
    int _90 = int(_87);
    float _92 = -_85;
    float _94 = _92 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _94;
    bool _98 = _90 >= 1;
    float _100 = 0.0;
    float _102 = _94;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _100;
    if (!_98)
    {
        out.m_49.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1239 = as_type<float>(_110);
        out.gl_Position.z = _1239;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _114 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_85);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = float(_90);
    bool _126 = _94 >= _124;
    bool _128 = !_122;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_49.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _112 = as_type<int>(_136);
    }
    int _138 = _112;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1295 = as_type<float>(_138);
        out.gl_Position.z = _1295;
    }
    if (_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_51.x;
    float _142 = in.m_51.y;
    float _144 = in.m_51.z;
    float _146 = _94 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_53.x;
    float _150 = in.m_53.y;
    float _152 = in.m_53.z;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_51.w;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = in.m_42.x;
    float _174 = in.m_42.y;
    float _176 = in.m_42.z;
    float _178 = 0.0;
    float _180 = _146;
    if (!_162)
    {
        float _182 = _146 * _146;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_162)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    float _194 = _140 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _196 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _198 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _200 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _148);
    float _202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _150);
    float _204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _152);
    float _206 = _194 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _208 = _196 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _210 = !_162;
    float _212 = _192;
    float _214 = _176;
    float _216 = _150;
    if (!_210)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _146 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _146);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _246;
    }
    float _248 = _212;
    bool _250 = !_162;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _146 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _180 = _270;
    }
    float _272 = _180;
    float _274 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _276 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _278 = _208 * _202;
    float _280 = _206 * _200;
    float _282 = fma(_272, _168, _274);
    float _284 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = fma(_272, _166, _276);
    float _288 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _290 = fma(_282, _164, _174);
    float _292 = fma(_272, _170, _284);
    float _294 = fma(_286, _164, _172);
    float _296 = _278 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _298 = _290 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _300 = fma(_292, _164, _176);
    float _302 = _290 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _304 = _288 * _204;
    float _306 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _298);
    float _308 = _278 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _310 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[10].x, _296);
    float _312 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _302);
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _306);
    float _316 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[8].x, _308);
    float _318 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[10].z, _310);
    float _320 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _322 = _314 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _324 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[8].z, _316);
    float _326 = _278 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _322 + _318;
    float _332 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[9].x, _326);
    float _334 = _328 + _324;
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _338 = _330 + _336;
    float _340 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[9].z, _332);
    float _342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _344 = _334 + _342;
    float _346 = _338 * _338;
    float _348 = fma(_344, _344, _346);
    float _350 = _290 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _352 = sqrt(_348);
    float _354 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _350);
    float _356 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _354);
    float _358 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _360 = _358 + _340;
    bool _362 = _352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _364 = _334;
    float _366 = _330;
    float _368 = _280;
    float _370 = _332;
    if (!_362)
    {
        _214 = _360;
    }
    float _372 = _214;
    bool _374 = !_362;
    float _376 = _372;
    if (!_374)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _380 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _382 = _352 + _380;
        float _384 = _360 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _386 = rsqrt(_348);
        float _388 = _382 * _378;
        float _390 = _388 * 0.15915493667125701904296875;
        float _392 = _390 * 6.283185482025146484375;
        float _394 = sin(_392);
        float _396 = _390 * 6.283185482025146484375;
        float _398 = cos(_396);
        float _400 = fma(_394, _384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _402 = _386 * _400;
        float _404 = _398 + (-1.0);
        float _406 = fma(_344, _402, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _408 = fma(_338, _402, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _410 = _404 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _412 = fma(_360, _398, _410);
        _376 = _412;
        _364 = _406;
        _366 = _408;
    }
    float _414 = _376;
    float _416 = _364;
    float _418 = _366;
    float _420 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _422 = _414 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _426 = _416 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _430 = _418 + _428;
    float _432 = _422 * _422;
    float _434 = fma(_426, _426, _432);
    float _436 = fma(_430, _430, _434);
    float _438 = rsqrt(_436);
    float _440 = _438 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _442 = _426 * _440;
    float _444 = _430 * _440;
    float _446 = _442 * _442;
    float _448 = _444 * _444;
    float _450 = _446 + _448;
    float _452 = sqrt(_450);
    bool _454 = _452 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _456 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _458 = _452 + _456;
    float _460 = _438;
    float _462 = _450;
    float _464 = _458;
    float _466 = _422;
    if (_454)
    {
        float _468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _460 = _468;
    }
    float _470 = _460;
    if (_454)
    {
        float _472 = rsqrt(_450);
        _462 = _472;
    }
    float _474 = _462;
    float _476 = _474;
    if (_454)
    {
        float _478 = _458 * _470;
        _464 = _478;
    }
    float _480 = _464;
    if (_454)
    {
        float _482 = _480 * 0.15915493667125701904296875;
        _368 = _482;
    }
    float _484 = _368;
    float _486 = _430;
    if (_454)
    {
        float _488 = _484 * 6.283185482025146484375;
        float _490 = sin(_488);
        _486 = _490;
    }
    float _492 = _486;
    float _494 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _496 = precise::max(0.0, _494);
    float _498 = _470;
    float _500 = _496;
    if (_454)
    {
        float _502 = _484 * 6.283185482025146484375;
        float _504 = cos(_502);
        _498 = _504;
    }
    float _506 = _498;
    float _508 = -_440;
    float _510 = -_496;
    float _512 = fma(_422, _508, _510);
    if (_454)
    {
        float _514 = _512 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _466 = _514;
    }
    float _516 = _466;
    float _518 = sqrt(_436);
    float _520 = _516;
    float _522 = _492;
    if (_454)
    {
        float _524 = fma(_492, _516, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _520 = _524;
    }
    float _526 = _520;
    float _528 = _526;
    if (!_454)
    {
        _522 = _442;
    }
    float _530 = _522;
    float _532 = _530;
    float _534 = _506;
    if (_454)
    {
        float _536 = _506 + (-1.0);
        _500 = _536;
    }
    float _538 = _500;
    float _540 = _538;
    if (_454)
    {
        float _542 = _474 * _526;
        _216 = _542;
    }
    float _544 = _216;
    if (!_454)
    {
        _528 = _512;
    }
    float _546 = _528;
    float _548 = _546;
    if (_454)
    {
        float _550 = _538 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _370 = _550;
    }
    float _552 = _370;
    if (_454)
    {
        float _554 = _442 * _544;
        _532 = _554;
    }
    float _556 = _532;
    if (!_454)
    {
        _540 = _444;
    }
    float _558 = _540;
    float _560 = _558;
    if (_454)
    {
        float _562 = _444 * _544;
        _560 = _562;
    }
    float _564 = _560;
    if (!_454)
    {
        _476 = _446;
    }
    float _566 = _476;
    float _568 = _566;
    if (_454)
    {
        float _570 = fma(_512, _506, _552);
        _548 = _570;
    }
    float _572 = _548;
    if (_454)
    {
        float _574 = _556 * _556;
        _568 = _574;
    }
    float _576 = _568;
    if (!_454)
    {
        _534 = _448;
    }
    float _578 = _534;
    float _580 = _578;
    if (_454)
    {
        float _582 = _564 * _564;
        _580 = _582;
    }
    float _584 = _580;
    float _586 = fma(_572, _572, _576);
    float _588 = _586 + _584;
    float _590 = _414 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _592 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _594 = fma(_518, (*spvDescriptorSet0.vp_c15)._m0[23].w, _592);
    float _596 = precise::clamp(_594, 0.0, 1.0);
    float _598 = _414 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _600 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _602 = fma(_416, (*spvDescriptorSet0.vp_c8)._m0[2].x, _590);
    float _604 = rsqrt(_588);
    float _606 = -_596;
    float _608 = _606 + 1.0;
    float _610 = _414 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _612 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[2].z, _602);
    float _614 = fma(_416, (*spvDescriptorSet0.vp_c8)._m0[1].x, _598);
    float _616 = _414 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _618 = _612 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _620 = abs(_608);
    float _622 = log2(_620);
    float _624 = fma(_416, (*spvDescriptorSet0.vp_c8)._m0[0].x, _610);
    float _626 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[1].z, _614);
    float _628 = fma(_416, (*spvDescriptorSet0.vp_c8)._m0[3].x, _616);
    float _630 = _618 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _632 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[0].z, _624);
    float _634 = _626 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _636 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[3].z, _628);
    float _638 = _604 * _556;
    float _640 = _632 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _642 = _634 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _644 = _604 * _572;
    float _646 = _638 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _648 = _604 * _564;
    float _650 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[7].x, _642);
    float _652 = _636 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _654 = -_646;
    float _656 = fma(_644, (*spvDescriptorSet0.vp_c15)._m0[21].y, _654);
    float _658 = _622 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _660 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[7].z, _650);
    float _662 = -_630;
    float _664 = fma(_662, _600, 1.0);
    float _666 = -_648;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c15)._m0[21].z, _656);
    float _670 = exp2(_658);
    float _672 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[7].w, _660);
    float _674 = _634 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _676 = fma(_668, -0.5, 0.5);
    float _678 = _634 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _680 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[4].x, _674);
    float _682 = fma(_668, 0.5, 0.5);
    float _684 = log2(_664);
    float _686 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[5].x, _678);
    float _688 = _644 + 1.0;
    float _690 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[4].z, _680);
    float _692 = fma(_682, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _694 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[5].z, _686);
    float _696 = 1.0 / _672;
    float _698 = -_644;
    float _700 = fma(_670, _688, _698);
    float _702 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[4].w, _690);
    float _704 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[5].w, _694);
    float _706 = fma(_682, _692, -0.212114393711090087890625);
    float _708 = fma(_700, 0.5, 0.5);
    float _710 = sqrt(_676);
    float _712 = _684 * 0.693147182464599609375;
    float _714 = fma(_682, _706, 1.570728778839111328125);
    float _716 = _712 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _718 = _702 * _696;
    float _720 = _704 * _696;
    float _722 = fma(_718, 0.5, 0.5);
    float _724 = fma(_720, -0.5, 0.5);
    float _726 = _710 * 0.636619746685028076171875;
    float3 _2275 = float3(_722, _724, _716);
    float _728 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2275, float3(0.0), isnan(_2275)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2275, float3(0.0), isnan(_2275)), level(0.0)).x;
    float _730 = -_714;
    float _732 = fma(_726, _730, 1.0);
    float3 _2291 = float3(_722, _724, _716);
    float4 _735 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2291, float3(0.0), isnan(_2291)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2291, float3(0.0), isnan(_2291)), level(0.0)).xyzw;
    float _737 = _735.x;
    float _739 = _735.y;
    float _741 = _735.z;
    float _743 = _735.w;
    float2 _2308 = float2(_732, _708);
    float3 _747 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2308, float2(0.0), isnan(_2308)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2308, float2(0.0), isnan(_2308)), level(0.0)).xyz;
    float _749 = _747.x;
    float _751 = _747.y;
    float _753 = _747.z;
    float _755 = in.m_55.w;
    float _757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _761 = _759 != 0;
    float _763 = in.m_57.y;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _767 = _765 != 0;
    float _769 = _634 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _773 = _771 != 0;
    float _775 = in.m_57.x;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _779 = _777 != 0;
    float _781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _785 = _783 != 0;
    float _787 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[6].x, _769);
    out.m_59.x = _328;
    out.m_59.y = _358;
    out.m_59.z = _322;
    float _789 = _446;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_761)
    {
        float _793 = in.m_55.y;
        _789 = _793;
    }
    float _795 = _789;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _799 = 0.0;
    if (_767)
    {
        float _801 = in.m_55.x;
        _799 = _801;
    }
    float _803 = _799;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _807 = _755 > 0.5;
    float _809 = _358 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _811 = _722;
    if (!_761)
    {
        float _813 = in.m_55.z;
        _811 = _813;
    }
    float _815 = _811;
    float _817 = _781 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _819 = -_763;
    float _821 = _819 + 1.0;
    float _823 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _809);
    float _825 = 0.0;
    int _827 = as_type<int>(_823);
    float _829 = _817;
    float _831 = _763;
    float _833 = _821;
    if (_773)
    {
        float _835 = in.m_55.z;
        _825 = _835;
    }
    float _837 = _825;
    float _839 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _807 ? _821 : _763;
    out.m_61.x = _775;
    bool _843 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _845 = isnan(0.5);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _851 = _847 || _849;
    float _853 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _823);
    float _855 = _779 ? _841 : _763;
    float _857 = _853;
    float _859 = _841;
    float _861 = _775;
    if (_767)
    {
        float _863 = -_775;
        float _865 = _863 + 1.0;
        _827 = as_type<int>(_865);
    }
    int _867 = _827;
    out.m_61.y = _763;
    float _869 = _853 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _871 = _869;
    if (!_767)
    {
        _857 = _775;
    }
    float _873 = _857;
    float _875 = _873;
    if (!_761)
    {
        _791 = _795;
    }
    float _877 = _791;
    float _879 = 1.0 / _869;
    bool _881 = false;
    if (_767)
    {
        bool _883 = _803 > 0.5;
        _881 = _883;
    }
    bool _885 = _881;
    float _887 = _358 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _889 = 0.0;
    if (!_851)
    {
        _889 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _891 = _889;
    float _893 = _877;
    float _895 = _795;
    if (_761)
    {
        float _897 = in.m_55.x;
        float _899 = in.m_55.y;
        _893 = _897;
        _895 = _899;
    }
    float _901 = _893;
    float _903 = _895;
    float _905 = _815;
    if (!_761)
    {
        _859 = _815;
    }
    float _907 = _859;
    float _909 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _887);
    float _911 = _907;
    if (_767)
    {
        float _913 = _885 ? as_type<float>(_867) : _775;
        _875 = _913;
    }
    float _915 = _875;
    float _917 = fma(_817, _855, -0.5);
    bool _919 = _837 > 0.5;
    bool _921 = _919 && _773;
    float _923 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _909);
    float _925 = 0.0;
    if (!_851)
    {
        float _927 = -_891;
        float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _925 = _929;
    }
    float _931 = _925;
    float _933 = _931;
    if (!_851)
    {
        _829 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _935 = _829;
    float _937 = _923 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _941 = _937;
    if (!_851)
    {
        float _943 = 1.0 / _931;
        _933 = _943;
    }
    float _945 = _933;
    if (_761)
    {
        _911 = _903;
    }
    float _947 = _911;
    float _949 = _947;
    if (_761)
    {
        _905 = _903;
    }
    float _951 = _905;
    bool _953 = _903 > 0.5;
    float _955 = _937 + _869;
    float _957 = _955;
    if (!_773)
    {
        _941 = _775;
    }
    float _959 = _941;
    float _961 = _959;
    if (_921)
    {
        float _963 = -_775;
        float _965 = _963 + 1.0;
        _861 = _965;
    }
    float _967 = _861;
    if (!_851)
    {
        float _969 = -_935;
        float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _871 = _971;
    }
    float _973 = _871;
    float _975 = _955 * _879;
    float _977 = _975 * 0.5;
    float _979 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[83].z, _939);
    float _981 = _901 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_773)
    {
        _961 = _967;
    }
    float _983 = _961;
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _987 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[30].w, _985);
    float _989 = _757 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _991 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[83].w, _797);
    if (!_851)
    {
        float _993 = 1.0 / _973;
        _957 = _993;
    }
    float _995 = _957;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _999 = fma(_989, _983, -0.5);
    float _1001 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[82].z, _979);
    float _1003 = _999;
    if (_785)
    {
        float _1005 = _953 ? _821 : _763;
        _831 = _1005;
    }
    float _1007 = _831;
    float _1009 = -_997;
    float _1011 = fma(_981, 2.0, _1009);
    float _1013 = 1.0 / _987;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1017 = -_94;
    float _1019 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1011);
    float _1021 = _947 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_851)
    {
        _949 = 1.0;
    }
    float _1023 = _949;
    float _1025 = fma(_1001, _999, _1019);
    float _1027 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[82].w, _991);
    float _1029 = fma(_1021, -2.0, _1015);
    float _1031 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1033 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1029);
    float _1035 = _1023;
    if (_851)
    {
        _102 = 1.0;
    }
    float _1037 = _102;
    float _1039 = _1037;
    if (!_851)
    {
        float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1043 = -_935;
        float _1045 = fma(_1013, _1041, _1043);
        _1003 = _1045;
    }
    float _1047 = _1003;
    float _1049 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1051 = -_1033;
    float _1053 = fma(_1027, _917, _1051);
    if (!_851)
    {
        float _1055 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1057 = -_891;
        float _1059 = fma(_1013, _1055, _1057);
        _833 = _1059;
    }
    float _1061 = _833;
    float _1063 = _1061;
    if (!_851)
    {
        float _1065 = _1047 * _995;
        float _1067 = precise::clamp(_1065, 0.0, 1.0);
        _1039 = _1067;
    }
    float _1069 = _1039;
    float _1071 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1073 = _915 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_851)
    {
        float _1075 = _1061 * _945;
        float _1077 = precise::clamp(_1075, 0.0, 1.0);
        _1063 = _1077;
    }
    float _1079 = _1063;
    float _1081 = _1053 + 0.5;
    float _1083 = _1071 * _1031;
    float _1085 = _622 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1087 = _1025 + 0.5;
    if (!_851)
    {
        float _1089 = -_1079;
        float _1091 = _1089 + 1.0;
        _1035 = _1091;
    }
    float _1093 = _1035;
    float _1095 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[6].z, _787);
    float _1097 = exp2(_1085);
    bool _1099 = _1069 > 0.0;
    bool _1101 = isnan(_1069);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan(0.0);
    bool _1107 = _1103 || _1105;
    float _1109 = _1069 * _1093;
    float _1111 = _1073 * _1049;
    float _1113 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1095);
    float _1115 = _1109 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_63.x = _1111;
    out.m_63.y = _1083;
    out.m_63.z = _1087;
    out.m_63.w = _1081;
    float _1117 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1119 = _1113 + _1117;
    bool _1121 = _1093 <= 0.0;
    bool _1123 = !_1107;
    bool _1125 = _1121 || _1123;
    float _1127 = _1115 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1129 = _672 * 0.5;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1135 = _702 + _672;
    float _1137 = -_1097;
    float _1139 = _1137 + 1.0;
    float _1141 = _672 + _1119;
    float _1143 = fma(_704, -0.5, _1129);
    float _1145 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1147 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1149 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1151 = _1135 * 0.5;
    float _1153 = _1141 * 0.5;
    out.m_65.x = _1145;
    out.m_65.y = _1147;
    out.m_65.z = _839;
    out.m_49.x = _1127;
    out.gl_Position.x = _702;
    out.gl_Position.y = _704;
    out.gl_Position.z = _1119;
    out.gl_Position.w = _672;
    out.m_67.x = _1151;
    out.m_67.y = _1143;
    out.m_67.z = _1153;
    out.m_67.w = _672;
    float _1155 = _1149 * _728;
    float _1157 = -_1149;
    float _1159 = _1157 + 1.0;
    float _1161 = _743 * _1155;
    float _1163 = _753 * _1155;
    float _1165 = fma(_749, _1161, _737);
    float _1167 = fma(_751, _1161, _739);
    float _1169 = _743 * _1159;
    float _1171 = fma(_743, _1163, _741);
    out.m_69.x = _1165;
    out.m_69.y = _1167;
    out.m_69.z = _1171;
    out.m_69.w = _1169;
    if (!_1125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _1173 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1173;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = in.m_44.w;
    float _87 = trunc(_83);
    int _90 = int(_87);
    float _92 = -_85;
    float _94 = _92 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _94;
    bool _98 = _90 >= 1;
    float _100 = 0.0;
    float _102 = _94;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _100;
    if (!_98)
    {
        out.m_49.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1239 = as_type<float>(_110);
        out.gl_Position.z = _1239;
    }
    if (!_98)
    {
        return out;
    }
    bool _114 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_85);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = float(_90);
    bool _126 = _94 >= _124;
    bool _128 = !_122;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_49.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _112 = as_type<int>(_136);
    }
    int _138 = _112;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1295 = as_type<float>(_138);
        out.gl_Position.z = _1295;
    }
    if (_130)
    {
        return out;
    }
    float _140 = in.m_51.x;
    float _142 = in.m_51.y;
    float _144 = in.m_51.z;
    float _146 = _94 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_53.x;
    float _150 = in.m_53.y;
    float _152 = in.m_53.z;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_51.w;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = in.m_42.x;
    float _174 = in.m_42.y;
    float _176 = in.m_42.z;
    float _178 = 0.0;
    float _180 = _146;
    if (!_162)
    {
        float _182 = _146 * _146;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_162)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    float _194 = _140 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _196 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _198 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _200 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _148);
    float _202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _150);
    float _204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _152);
    float _206 = _194 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _208 = _196 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _210 = !_162;
    float _212 = _192;
    float _214 = _176;
    float _216 = _150;
    if (!_210)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _146 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _146);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _246;
    }
    float _248 = _212;
    bool _250 = !_162;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _146 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _180 = _270;
    }
    float _272 = _180;
    float _274 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _276 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _278 = _208 * _202;
    float _280 = _206 * _200;
    float _282 = fma(_272, _168, _274);
    float _284 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = fma(_272, _166, _276);
    float _288 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _290 = fma(_282, _164, _174);
    float _292 = fma(_272, _170, _284);
    float _294 = fma(_286, _164, _172);
    float _296 = _278 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _298 = _290 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _300 = fma(_292, _164, _176);
    float _302 = _290 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _304 = _288 * _204;
    float _306 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _298);
    float _308 = _278 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _310 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[10].x, _296);
    float _312 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _302);
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _306);
    float _316 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[8].x, _308);
    float _318 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[10].z, _310);
    float _320 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _322 = _314 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _324 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[8].z, _316);
    float _326 = _278 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _322 + _318;
    float _332 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[9].x, _326);
    float _334 = _328 + _324;
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _338 = _330 + _336;
    float _340 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[9].z, _332);
    float _342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _344 = _334 + _342;
    float _346 = _338 * _338;
    float _348 = fma(_344, _344, _346);
    float _350 = _290 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _352 = sqrt(_348);
    float _354 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _350);
    float _356 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _354);
    float _358 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _360 = _358 + _340;
    bool _362 = _352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _364 = _334;
    float _366 = _330;
    float _368 = _280;
    float _370 = _332;
    if (!_362)
    {
        _214 = _360;
    }
    float _372 = _214;
    bool _374 = !_362;
    float _376 = _372;
    if (!_374)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _380 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _382 = _352 + _380;
        float _384 = _360 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _386 = rsqrt(_348);
        float _388 = _382 * _378;
        float _390 = _388 * 0.15915493667125701904296875;
        float _392 = _390 * 6.283185482025146484375;
        float _394 = sin(_392);
        float _396 = _390 * 6.283185482025146484375;
        float _398 = cos(_396);
        float _400 = fma(_394, _384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _402 = _386 * _400;
        float _404 = _398 + (-1.0);
        float _406 = fma(_344, _402, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _408 = fma(_338, _402, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _410 = _404 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _412 = fma(_360, _398, _410);
        _376 = _412;
        _364 = _406;
        _366 = _408;
    }
    float _414 = _376;
    float _416 = _364;
    float _418 = _366;
    float _420 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _422 = _414 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _426 = _416 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _430 = _418 + _428;
    float _432 = _422 * _422;
    float _434 = fma(_426, _426, _432);
    float _436 = fma(_430, _430, _434);
    float _438 = rsqrt(_436);
    float _440 = _438 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _442 = _426 * _440;
    float _444 = _430 * _440;
    float _446 = _442 * _442;
    float _448 = _444 * _444;
    float _450 = _446 + _448;
    float _452 = sqrt(_450);
    bool _454 = _452 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _456 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _458 = _452 + _456;
    float _460 = _438;
    float _462 = _450;
    float _464 = _458;
    float _466 = _422;
    if (_454)
    {
        float _468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _460 = _468;
    }
    float _470 = _460;
    if (_454)
    {
        float _472 = rsqrt(_450);
        _462 = _472;
    }
    float _474 = _462;
    float _476 = _474;
    if (_454)
    {
        float _478 = _458 * _470;
        _464 = _478;
    }
    float _480 = _464;
    if (_454)
    {
        float _482 = _480 * 0.15915493667125701904296875;
        _368 = _482;
    }
    float _484 = _368;
    float _486 = _430;
    if (_454)
    {
        float _488 = _484 * 6.283185482025146484375;
        float _490 = sin(_488);
        _486 = _490;
    }
    float _492 = _486;
    float _494 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _496 = precise::max(0.0, _494);
    float _498 = _470;
    float _500 = _496;
    if (_454)
    {
        float _502 = _484 * 6.283185482025146484375;
        float _504 = cos(_502);
        _498 = _504;
    }
    float _506 = _498;
    float _508 = -_440;
    float _510 = -_496;
    float _512 = fma(_422, _508, _510);
    if (_454)
    {
        float _514 = _512 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _466 = _514;
    }
    float _516 = _466;
    float _518 = sqrt(_436);
    float _520 = _516;
    float _522 = _492;
    if (_454)
    {
        float _524 = fma(_492, _516, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _520 = _524;
    }
    float _526 = _520;
    float _528 = _526;
    if (!_454)
    {
        _522 = _442;
    }
    float _530 = _522;
    float _532 = _530;
    float _534 = _506;
    if (_454)
    {
        float _536 = _506 + (-1.0);
        _500 = _536;
    }
    float _538 = _500;
    float _540 = _538;
    if (_454)
    {
        float _542 = _474 * _526;
        _216 = _542;
    }
    float _544 = _216;
    if (!_454)
    {
        _528 = _512;
    }
    float _546 = _528;
    float _548 = _546;
    if (_454)
    {
        float _550 = _538 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _370 = _550;
    }
    float _552 = _370;
    if (_454)
    {
        float _554 = _442 * _544;
        _532 = _554;
    }
    float _556 = _532;
    if (!_454)
    {
        _540 = _444;
    }
    float _558 = _540;
    float _560 = _558;
    if (_454)
    {
        float _562 = _444 * _544;
        _560 = _562;
    }
    float _564 = _560;
    if (!_454)
    {
        _476 = _446;
    }
    float _566 = _476;
    float _568 = _566;
    if (_454)
    {
        float _570 = fma(_512, _506, _552);
        _548 = _570;
    }
    float _572 = _548;
    if (_454)
    {
        float _574 = _556 * _556;
        _568 = _574;
    }
    float _576 = _568;
    if (!_454)
    {
        _534 = _448;
    }
    float _578 = _534;
    float _580 = _578;
    if (_454)
    {
        float _582 = _564 * _564;
        _580 = _582;
    }
    float _584 = _580;
    float _586 = fma(_572, _572, _576);
    float _588 = _586 + _584;
    float _590 = _414 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _592 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _594 = fma(_518, (*spvDescriptorSet0.vp_c15)._m0[23].w, _592);
    float _596 = precise::clamp(_594, 0.0, 1.0);
    float _598 = _414 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _600 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _602 = fma(_416, (*spvDescriptorSet0.vp_c8)._m0[2].x, _590);
    float _604 = rsqrt(_588);
    float _606 = -_596;
    float _608 = _606 + 1.0;
    float _610 = _414 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _612 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[2].z, _602);
    float _614 = fma(_416, (*spvDescriptorSet0.vp_c8)._m0[1].x, _598);
    float _616 = _414 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _618 = _612 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _620 = abs(_608);
    float _622 = log2(_620);
    float _624 = fma(_416, (*spvDescriptorSet0.vp_c8)._m0[0].x, _610);
    float _626 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[1].z, _614);
    float _628 = fma(_416, (*spvDescriptorSet0.vp_c8)._m0[3].x, _616);
    float _630 = _618 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _632 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[0].z, _624);
    float _634 = _626 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _636 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[3].z, _628);
    float _638 = _604 * _556;
    float _640 = _632 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _642 = _634 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _644 = _604 * _572;
    float _646 = _638 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _648 = _604 * _564;
    float _650 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[7].x, _642);
    float _652 = _636 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _654 = -_646;
    float _656 = fma(_644, (*spvDescriptorSet0.vp_c15)._m0[21].y, _654);
    float _658 = _622 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _660 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[7].z, _650);
    float _662 = -_630;
    float _664 = fma(_662, _600, 1.0);
    float _666 = -_648;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c15)._m0[21].z, _656);
    float _670 = exp2(_658);
    float _672 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[7].w, _660);
    float _674 = _634 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _676 = fma(_668, -0.5, 0.5);
    float _678 = _634 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _680 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[4].x, _674);
    float _682 = fma(_668, 0.5, 0.5);
    float _684 = log2(_664);
    float _686 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[5].x, _678);
    float _688 = _644 + 1.0;
    float _690 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[4].z, _680);
    float _692 = fma(_682, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _694 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[5].z, _686);
    float _696 = 1.0 / _672;
    float _698 = -_644;
    float _700 = fma(_670, _688, _698);
    float _702 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[4].w, _690);
    float _704 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[5].w, _694);
    float _706 = fma(_682, _692, -0.212114393711090087890625);
    float _708 = fma(_700, 0.5, 0.5);
    float _710 = sqrt(_676);
    float _712 = _684 * 0.693147182464599609375;
    float _714 = fma(_682, _706, 1.570728778839111328125);
    float _716 = _712 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _718 = _702 * _696;
    float _720 = _704 * _696;
    float _722 = fma(_718, 0.5, 0.5);
    float _724 = fma(_720, -0.5, 0.5);
    float _726 = _710 * 0.636619746685028076171875;
    float3 _2275 = float3(_722, _724, _716);
    float _728 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2275, float3(0.0), isnan(_2275)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2275, float3(0.0), isnan(_2275)), level(0.0)).x;
    float _730 = -_714;
    float _732 = fma(_726, _730, 1.0);
    float3 _2291 = float3(_722, _724, _716);
    float4 _735 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2291, float3(0.0), isnan(_2291)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2291, float3(0.0), isnan(_2291)), level(0.0)).xyzw;
    float _737 = _735.x;
    float _739 = _735.y;
    float _741 = _735.z;
    float _743 = _735.w;
    float2 _2308 = float2(_732, _708);
    float3 _747 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2308, float2(0.0), isnan(_2308)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2308, float2(0.0), isnan(_2308)), level(0.0)).xyz;
    float _749 = _747.x;
    float _751 = _747.y;
    float _753 = _747.z;
    float _755 = in.m_55.w;
    float _757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _761 = _759 != 0;
    float _763 = in.m_57.y;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _767 = _765 != 0;
    float _769 = _634 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _773 = _771 != 0;
    float _775 = in.m_57.x;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _779 = _777 != 0;
    float _781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _785 = _783 != 0;
    float _787 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[6].x, _769);
    out.m_59.x = _328;
    out.m_59.y = _358;
    out.m_59.z = _322;
    float _789 = _446;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_761)
    {
        float _793 = in.m_55.y;
        _789 = _793;
    }
    float _795 = _789;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _799 = 0.0;
    if (_767)
    {
        float _801 = in.m_55.x;
        _799 = _801;
    }
    float _803 = _799;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _807 = _755 > 0.5;
    float _809 = _358 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _811 = _722;
    if (!_761)
    {
        float _813 = in.m_55.z;
        _811 = _813;
    }
    float _815 = _811;
    float _817 = _781 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _819 = -_763;
    float _821 = _819 + 1.0;
    float _823 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _809);
    float _825 = 0.0;
    int _827 = as_type<int>(_823);
    float _829 = _817;
    float _831 = _763;
    float _833 = _821;
    if (_773)
    {
        float _835 = in.m_55.z;
        _825 = _835;
    }
    float _837 = _825;
    float _839 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _807 ? _821 : _763;
    out.m_61.x = _775;
    bool _843 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _845 = isnan(0.5);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _851 = _847 || _849;
    float _853 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _823);
    float _855 = _779 ? _841 : _763;
    float _857 = _853;
    float _859 = _841;
    float _861 = _775;
    if (_767)
    {
        float _863 = -_775;
        float _865 = _863 + 1.0;
        _827 = as_type<int>(_865);
    }
    int _867 = _827;
    out.m_61.y = _763;
    float _869 = _853 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _871 = _869;
    if (!_767)
    {
        _857 = _775;
    }
    float _873 = _857;
    float _875 = _873;
    if (!_761)
    {
        _791 = _795;
    }
    float _877 = _791;
    float _879 = 1.0 / _869;
    bool _881 = false;
    if (_767)
    {
        bool _883 = _803 > 0.5;
        _881 = _883;
    }
    bool _885 = _881;
    float _887 = _358 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _889 = 0.0;
    if (!_851)
    {
        _889 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _891 = _889;
    float _893 = _877;
    float _895 = _795;
    if (_761)
    {
        float _897 = in.m_55.x;
        float _899 = in.m_55.y;
        _893 = _897;
        _895 = _899;
    }
    float _901 = _893;
    float _903 = _895;
    float _905 = _815;
    if (!_761)
    {
        _859 = _815;
    }
    float _907 = _859;
    float _909 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _887);
    float _911 = _907;
    if (_767)
    {
        float _913 = _885 ? as_type<float>(_867) : _775;
        _875 = _913;
    }
    float _915 = _875;
    float _917 = fma(_817, _855, -0.5);
    bool _919 = _837 > 0.5;
    bool _921 = _919 && _773;
    float _923 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _909);
    float _925 = 0.0;
    if (!_851)
    {
        float _927 = -_891;
        float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _925 = _929;
    }
    float _931 = _925;
    float _933 = _931;
    if (!_851)
    {
        _829 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _935 = _829;
    float _937 = _923 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _941 = _937;
    if (!_851)
    {
        float _943 = 1.0 / _931;
        _933 = _943;
    }
    float _945 = _933;
    if (_761)
    {
        _911 = _903;
    }
    float _947 = _911;
    float _949 = _947;
    if (_761)
    {
        _905 = _903;
    }
    float _951 = _905;
    bool _953 = _903 > 0.5;
    float _955 = _937 + _869;
    float _957 = _955;
    if (!_773)
    {
        _941 = _775;
    }
    float _959 = _941;
    float _961 = _959;
    if (_921)
    {
        float _963 = -_775;
        float _965 = _963 + 1.0;
        _861 = _965;
    }
    float _967 = _861;
    if (!_851)
    {
        float _969 = -_935;
        float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _871 = _971;
    }
    float _973 = _871;
    float _975 = _955 * _879;
    float _977 = _975 * 0.5;
    float _979 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[83].z, _939);
    float _981 = _901 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_773)
    {
        _961 = _967;
    }
    float _983 = _961;
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _987 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[30].w, _985);
    float _989 = _757 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _991 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[83].w, _797);
    if (!_851)
    {
        float _993 = 1.0 / _973;
        _957 = _993;
    }
    float _995 = _957;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _999 = fma(_989, _983, -0.5);
    float _1001 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[82].z, _979);
    float _1003 = _999;
    if (_785)
    {
        float _1005 = _953 ? _821 : _763;
        _831 = _1005;
    }
    float _1007 = _831;
    float _1009 = -_997;
    float _1011 = fma(_981, 2.0, _1009);
    float _1013 = 1.0 / _987;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1017 = -_94;
    float _1019 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1011);
    float _1021 = _947 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_851)
    {
        _949 = 1.0;
    }
    float _1023 = _949;
    float _1025 = fma(_1001, _999, _1019);
    float _1027 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[82].w, _991);
    float _1029 = fma(_1021, -2.0, _1015);
    float _1031 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1033 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1029);
    float _1035 = _1023;
    if (_851)
    {
        _102 = 1.0;
    }
    float _1037 = _102;
    float _1039 = _1037;
    if (!_851)
    {
        float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1043 = -_935;
        float _1045 = fma(_1013, _1041, _1043);
        _1003 = _1045;
    }
    float _1047 = _1003;
    float _1049 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1051 = -_1033;
    float _1053 = fma(_1027, _917, _1051);
    if (!_851)
    {
        float _1055 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1057 = -_891;
        float _1059 = fma(_1013, _1055, _1057);
        _833 = _1059;
    }
    float _1061 = _833;
    float _1063 = _1061;
    if (!_851)
    {
        float _1065 = _1047 * _995;
        float _1067 = precise::clamp(_1065, 0.0, 1.0);
        _1039 = _1067;
    }
    float _1069 = _1039;
    float _1071 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1073 = _915 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_851)
    {
        float _1075 = _1061 * _945;
        float _1077 = precise::clamp(_1075, 0.0, 1.0);
        _1063 = _1077;
    }
    float _1079 = _1063;
    float _1081 = _1053 + 0.5;
    float _1083 = _1071 * _1031;
    float _1085 = _622 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1087 = _1025 + 0.5;
    if (!_851)
    {
        float _1089 = -_1079;
        float _1091 = _1089 + 1.0;
        _1035 = _1091;
    }
    float _1093 = _1035;
    float _1095 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[6].z, _787);
    float _1097 = exp2(_1085);
    bool _1099 = _1069 > 0.0;
    bool _1101 = isnan(_1069);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan(0.0);
    bool _1107 = _1103 || _1105;
    float _1109 = _1069 * _1093;
    float _1111 = _1073 * _1049;
    float _1113 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1095);
    float _1115 = _1109 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_63.x = _1111;
    out.m_63.y = _1083;
    out.m_63.z = _1087;
    out.m_63.w = _1081;
    float _1117 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1119 = _1113 + _1117;
    bool _1121 = _1093 <= 0.0;
    bool _1123 = !_1107;
    bool _1125 = _1121 || _1123;
    float _1127 = _1115 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1129 = _672 * 0.5;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1135 = _702 + _672;
    float _1137 = -_1097;
    float _1139 = _1137 + 1.0;
    float _1141 = _672 + _1119;
    float _1143 = fma(_704, -0.5, _1129);
    float _1145 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1147 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1149 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1151 = _1135 * 0.5;
    float _1153 = _1141 * 0.5;
    out.m_65.x = _1145;
    out.m_65.y = _1147;
    out.m_65.z = _839;
    out.m_49.x = _1127;
    out.gl_Position.x = _702;
    out.gl_Position.y = _704;
    out.gl_Position.z = _1119;
    out.gl_Position.w = _672;
    out.m_67.x = _1151;
    out.m_67.y = _1143;
    out.m_67.z = _1153;
    out.m_67.w = _672;
    float _1155 = _1149 * _728;
    float _1157 = -_1149;
    float _1159 = _1157 + 1.0;
    float _1161 = _743 * _1155;
    float _1163 = _753 * _1155;
    float _1165 = fma(_749, _1161, _737);
    float _1167 = fma(_751, _1161, _739);
    float _1169 = _743 * _1159;
    float _1171 = fma(_743, _1163, _741);
    out.m_69.x = _1165;
    out.m_69.y = _1167;
    out.m_69.z = _1171;
    out.m_69.w = _1169;
    if (!_1125)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _1173 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1173;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = in.m_44.w;
    float _87 = trunc(_83);
    int _90 = int(_87);
    float _92 = -_85;
    float _94 = _92 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _94;
    bool _98 = _90 >= 1;
    float _100 = 0.0;
    float _102 = _94;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _100;
    if (!_98)
    {
        out.m_49.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1239 = as_type<float>(_110);
        out.gl_Position.z = _1239;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _114 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_85);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = float(_90);
    bool _126 = _94 >= _124;
    bool _128 = !_122;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_49.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _112 = as_type<int>(_136);
    }
    int _138 = _112;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1295 = as_type<float>(_138);
        out.gl_Position.z = _1295;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_51.x;
    float _142 = in.m_51.y;
    float _144 = in.m_51.z;
    float _146 = _94 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_53.x;
    float _150 = in.m_53.y;
    float _152 = in.m_53.z;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_51.w;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = in.m_42.x;
    float _174 = in.m_42.y;
    float _176 = in.m_42.z;
    float _178 = 0.0;
    float _180 = _146;
    if (!_162)
    {
        float _182 = _146 * _146;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_162)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    float _194 = _140 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _196 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _198 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _200 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _148);
    float _202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _150);
    float _204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _152);
    float _206 = _194 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _208 = _196 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _210 = !_162;
    float _212 = _192;
    float _214 = _176;
    float _216 = _150;
    if (!_210)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _146 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _146);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _246;
    }
    float _248 = _212;
    bool _250 = !_162;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _146 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _180 = _270;
    }
    float _272 = _180;
    float _274 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _276 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _278 = _208 * _202;
    float _280 = _206 * _200;
    float _282 = fma(_272, _168, _274);
    float _284 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = fma(_272, _166, _276);
    float _288 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _290 = fma(_282, _164, _174);
    float _292 = fma(_272, _170, _284);
    float _294 = fma(_286, _164, _172);
    float _296 = _278 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _298 = _290 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _300 = fma(_292, _164, _176);
    float _302 = _290 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _304 = _288 * _204;
    float _306 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _298);
    float _308 = _278 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _310 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[10].x, _296);
    float _312 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _302);
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _306);
    float _316 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[8].x, _308);
    float _318 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[10].z, _310);
    float _320 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _322 = _314 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _324 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[8].z, _316);
    float _326 = _278 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _322 + _318;
    float _332 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[9].x, _326);
    float _334 = _328 + _324;
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _338 = _330 + _336;
    float _340 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[9].z, _332);
    float _342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _344 = _334 + _342;
    float _346 = _338 * _338;
    float _348 = fma(_344, _344, _346);
    float _350 = _290 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _352 = sqrt(_348);
    float _354 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _350);
    float _356 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _354);
    float _358 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _360 = _358 + _340;
    bool _362 = _352 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _364 = _334;
    float _366 = _330;
    float _368 = _280;
    float _370 = _332;
    if (!_362)
    {
        _214 = _360;
    }
    float _372 = _214;
    bool _374 = !_362;
    float _376 = _372;
    if (!_374)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _380 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _382 = _352 + _380;
        float _384 = _360 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _386 = rsqrt(_348);
        float _388 = _382 * _378;
        float _390 = _388 * 0.15915493667125701904296875;
        float _392 = _390 * 6.283185482025146484375;
        float _394 = sin(_392);
        float _396 = _390 * 6.283185482025146484375;
        float _398 = cos(_396);
        float _400 = fma(_394, _384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _402 = _386 * _400;
        float _404 = _398 + (-1.0);
        float _406 = fma(_344, _402, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _408 = fma(_338, _402, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _410 = _404 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _412 = fma(_360, _398, _410);
        _376 = _412;
        _364 = _406;
        _366 = _408;
    }
    float _414 = _376;
    float _416 = _364;
    float _418 = _366;
    float _420 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _422 = _414 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _426 = _416 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _430 = _418 + _428;
    float _432 = _422 * _422;
    float _434 = fma(_426, _426, _432);
    float _436 = fma(_430, _430, _434);
    float _438 = rsqrt(_436);
    float _440 = _438 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _442 = _426 * _440;
    float _444 = _430 * _440;
    float _446 = _442 * _442;
    float _448 = _444 * _444;
    float _450 = _446 + _448;
    float _452 = sqrt(_450);
    bool _454 = _452 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _456 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _458 = _452 + _456;
    float _460 = _438;
    float _462 = _450;
    float _464 = _458;
    float _466 = _422;
    if (_454)
    {
        float _468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _460 = _468;
    }
    float _470 = _460;
    if (_454)
    {
        float _472 = rsqrt(_450);
        _462 = _472;
    }
    float _474 = _462;
    float _476 = _474;
    if (_454)
    {
        float _478 = _458 * _470;
        _464 = _478;
    }
    float _480 = _464;
    if (_454)
    {
        float _482 = _480 * 0.15915493667125701904296875;
        _368 = _482;
    }
    float _484 = _368;
    float _486 = _430;
    if (_454)
    {
        float _488 = _484 * 6.283185482025146484375;
        float _490 = sin(_488);
        _486 = _490;
    }
    float _492 = _486;
    float _494 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _496 = precise::max(0.0, _494);
    float _498 = _470;
    float _500 = _496;
    if (_454)
    {
        float _502 = _484 * 6.283185482025146484375;
        float _504 = cos(_502);
        _498 = _504;
    }
    float _506 = _498;
    float _508 = -_440;
    float _510 = -_496;
    float _512 = fma(_422, _508, _510);
    if (_454)
    {
        float _514 = _512 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _466 = _514;
    }
    float _516 = _466;
    float _518 = sqrt(_436);
    float _520 = _516;
    float _522 = _492;
    if (_454)
    {
        float _524 = fma(_492, _516, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _520 = _524;
    }
    float _526 = _520;
    float _528 = _526;
    if (!_454)
    {
        _522 = _442;
    }
    float _530 = _522;
    float _532 = _530;
    float _534 = _506;
    if (_454)
    {
        float _536 = _506 + (-1.0);
        _500 = _536;
    }
    float _538 = _500;
    float _540 = _538;
    if (_454)
    {
        float _542 = _474 * _526;
        _216 = _542;
    }
    float _544 = _216;
    if (!_454)
    {
        _528 = _512;
    }
    float _546 = _528;
    float _548 = _546;
    if (_454)
    {
        float _550 = _538 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _370 = _550;
    }
    float _552 = _370;
    if (_454)
    {
        float _554 = _442 * _544;
        _532 = _554;
    }
    float _556 = _532;
    if (!_454)
    {
        _540 = _444;
    }
    float _558 = _540;
    float _560 = _558;
    if (_454)
    {
        float _562 = _444 * _544;
        _560 = _562;
    }
    float _564 = _560;
    if (!_454)
    {
        _476 = _446;
    }
    float _566 = _476;
    float _568 = _566;
    if (_454)
    {
        float _570 = fma(_512, _506, _552);
        _548 = _570;
    }
    float _572 = _548;
    if (_454)
    {
        float _574 = _556 * _556;
        _568 = _574;
    }
    float _576 = _568;
    if (!_454)
    {
        _534 = _448;
    }
    float _578 = _534;
    float _580 = _578;
    if (_454)
    {
        float _582 = _564 * _564;
        _580 = _582;
    }
    float _584 = _580;
    float _586 = fma(_572, _572, _576);
    float _588 = _586 + _584;
    float _590 = _414 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _592 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _594 = fma(_518, (*spvDescriptorSet0.vp_c15)._m0[23].w, _592);
    float _596 = precise::clamp(_594, 0.0, 1.0);
    float _598 = _414 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _600 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _602 = fma(_416, (*spvDescriptorSet0.vp_c8)._m0[2].x, _590);
    float _604 = rsqrt(_588);
    float _606 = -_596;
    float _608 = _606 + 1.0;
    float _610 = _414 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _612 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[2].z, _602);
    float _614 = fma(_416, (*spvDescriptorSet0.vp_c8)._m0[1].x, _598);
    float _616 = _414 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _618 = _612 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _620 = abs(_608);
    float _622 = log2(_620);
    float _624 = fma(_416, (*spvDescriptorSet0.vp_c8)._m0[0].x, _610);
    float _626 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[1].z, _614);
    float _628 = fma(_416, (*spvDescriptorSet0.vp_c8)._m0[3].x, _616);
    float _630 = _618 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _632 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[0].z, _624);
    float _634 = _626 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _636 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[3].z, _628);
    float _638 = _604 * _556;
    float _640 = _632 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _642 = _634 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _644 = _604 * _572;
    float _646 = _638 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _648 = _604 * _564;
    float _650 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[7].x, _642);
    float _652 = _636 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _654 = -_646;
    float _656 = fma(_644, (*spvDescriptorSet0.vp_c15)._m0[21].y, _654);
    float _658 = _622 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _660 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[7].z, _650);
    float _662 = -_630;
    float _664 = fma(_662, _600, 1.0);
    float _666 = -_648;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c15)._m0[21].z, _656);
    float _670 = exp2(_658);
    float _672 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[7].w, _660);
    float _674 = _634 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _676 = fma(_668, -0.5, 0.5);
    float _678 = _634 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _680 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[4].x, _674);
    float _682 = fma(_668, 0.5, 0.5);
    float _684 = log2(_664);
    float _686 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[5].x, _678);
    float _688 = _644 + 1.0;
    float _690 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[4].z, _680);
    float _692 = fma(_682, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _694 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[5].z, _686);
    float _696 = 1.0 / _672;
    float _698 = -_644;
    float _700 = fma(_670, _688, _698);
    float _702 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[4].w, _690);
    float _704 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[5].w, _694);
    float _706 = fma(_682, _692, -0.212114393711090087890625);
    float _708 = fma(_700, 0.5, 0.5);
    float _710 = sqrt(_676);
    float _712 = _684 * 0.693147182464599609375;
    float _714 = fma(_682, _706, 1.570728778839111328125);
    float _716 = _712 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _718 = _702 * _696;
    float _720 = _704 * _696;
    float _722 = fma(_718, 0.5, 0.5);
    float _724 = fma(_720, -0.5, 0.5);
    float _726 = _710 * 0.636619746685028076171875;
    float3 _2275 = float3(_722, _724, _716);
    float _728 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2275, float3(0.0), isnan(_2275)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2275, float3(0.0), isnan(_2275)), level(0.0)).x;
    float _730 = -_714;
    float _732 = fma(_726, _730, 1.0);
    float3 _2291 = float3(_722, _724, _716);
    float4 _735 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2291, float3(0.0), isnan(_2291)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2291, float3(0.0), isnan(_2291)), level(0.0)).xyzw;
    float _737 = _735.x;
    float _739 = _735.y;
    float _741 = _735.z;
    float _743 = _735.w;
    float2 _2308 = float2(_732, _708);
    float3 _747 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2308, float2(0.0), isnan(_2308)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2308, float2(0.0), isnan(_2308)), level(0.0)).xyz;
    float _749 = _747.x;
    float _751 = _747.y;
    float _753 = _747.z;
    float _755 = in.m_55.w;
    float _757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _761 = _759 != 0;
    float _763 = in.m_57.y;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _767 = _765 != 0;
    float _769 = _634 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _773 = _771 != 0;
    float _775 = in.m_57.x;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _779 = _777 != 0;
    float _781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _785 = _783 != 0;
    float _787 = fma(_640, (*spvDescriptorSet0.vp_c8)._m0[6].x, _769);
    out.m_59.x = _328;
    out.m_59.y = _358;
    out.m_59.z = _322;
    float _789 = _446;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_761)
    {
        float _793 = in.m_55.y;
        _789 = _793;
    }
    float _795 = _789;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _799 = 0.0;
    if (_767)
    {
        float _801 = in.m_55.x;
        _799 = _801;
    }
    float _803 = _799;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _807 = _755 > 0.5;
    float _809 = _358 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _811 = _722;
    if (!_761)
    {
        float _813 = in.m_55.z;
        _811 = _813;
    }
    float _815 = _811;
    float _817 = _781 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _819 = -_763;
    float _821 = _819 + 1.0;
    float _823 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _809);
    float _825 = 0.0;
    int _827 = as_type<int>(_823);
    float _829 = _817;
    float _831 = _763;
    float _833 = _821;
    if (_773)
    {
        float _835 = in.m_55.z;
        _825 = _835;
    }
    float _837 = _825;
    float _839 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _807 ? _821 : _763;
    out.m_61.x = _775;
    bool _843 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _845 = isnan(0.5);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _851 = _847 || _849;
    float _853 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _823);
    float _855 = _779 ? _841 : _763;
    float _857 = _853;
    float _859 = _841;
    float _861 = _775;
    if (_767)
    {
        float _863 = -_775;
        float _865 = _863 + 1.0;
        _827 = as_type<int>(_865);
    }
    int _867 = _827;
    out.m_61.y = _763;
    float _869 = _853 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _871 = _869;
    if (!_767)
    {
        _857 = _775;
    }
    float _873 = _857;
    float _875 = _873;
    if (!_761)
    {
        _791 = _795;
    }
    float _877 = _791;
    float _879 = 1.0 / _869;
    bool _881 = false;
    if (_767)
    {
        bool _883 = _803 > 0.5;
        _881 = _883;
    }
    bool _885 = _881;
    float _887 = _358 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _889 = 0.0;
    if (!_851)
    {
        _889 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _891 = _889;
    float _893 = _877;
    float _895 = _795;
    if (_761)
    {
        float _897 = in.m_55.x;
        float _899 = in.m_55.y;
        _893 = _897;
        _895 = _899;
    }
    float _901 = _893;
    float _903 = _895;
    float _905 = _815;
    if (!_761)
    {
        _859 = _815;
    }
    float _907 = _859;
    float _909 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _887);
    float _911 = _907;
    if (_767)
    {
        float _913 = _885 ? as_type<float>(_867) : _775;
        _875 = _913;
    }
    float _915 = _875;
    float _917 = fma(_817, _855, -0.5);
    bool _919 = _837 > 0.5;
    bool _921 = _919 && _773;
    float _923 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _909);
    float _925 = 0.0;
    if (!_851)
    {
        float _927 = -_891;
        float _929 = _927 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _925 = _929;
    }
    float _931 = _925;
    float _933 = _931;
    if (!_851)
    {
        _829 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _935 = _829;
    float _937 = _923 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _941 = _937;
    if (!_851)
    {
        float _943 = 1.0 / _931;
        _933 = _943;
    }
    float _945 = _933;
    if (_761)
    {
        _911 = _903;
    }
    float _947 = _911;
    float _949 = _947;
    if (_761)
    {
        _905 = _903;
    }
    float _951 = _905;
    bool _953 = _903 > 0.5;
    float _955 = _937 + _869;
    float _957 = _955;
    if (!_773)
    {
        _941 = _775;
    }
    float _959 = _941;
    float _961 = _959;
    if (_921)
    {
        float _963 = -_775;
        float _965 = _963 + 1.0;
        _861 = _965;
    }
    float _967 = _861;
    if (!_851)
    {
        float _969 = -_935;
        float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _871 = _971;
    }
    float _973 = _871;
    float _975 = _955 * _879;
    float _977 = _975 * 0.5;
    float _979 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[83].z, _939);
    float _981 = _901 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_773)
    {
        _961 = _967;
    }
    float _983 = _961;
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _987 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[30].w, _985);
    float _989 = _757 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _991 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[83].w, _797);
    if (!_851)
    {
        float _993 = 1.0 / _973;
        _957 = _993;
    }
    float _995 = _957;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _999 = fma(_989, _983, -0.5);
    float _1001 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[82].z, _979);
    float _1003 = _999;
    if (_785)
    {
        float _1005 = _953 ? _821 : _763;
        _831 = _1005;
    }
    float _1007 = _831;
    float _1009 = -_997;
    float _1011 = fma(_981, 2.0, _1009);
    float _1013 = 1.0 / _987;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1017 = -_94;
    float _1019 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1011);
    float _1021 = _947 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_851)
    {
        _949 = 1.0;
    }
    float _1023 = _949;
    float _1025 = fma(_1001, _999, _1019);
    float _1027 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[82].w, _991);
    float _1029 = fma(_1021, -2.0, _1015);
    float _1031 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1033 = fma(_94, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1029);
    float _1035 = _1023;
    if (_851)
    {
        _102 = 1.0;
    }
    float _1037 = _102;
    float _1039 = _1037;
    if (!_851)
    {
        float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1043 = -_935;
        float _1045 = fma(_1013, _1041, _1043);
        _1003 = _1045;
    }
    float _1047 = _1003;
    float _1049 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1051 = -_1033;
    float _1053 = fma(_1027, _917, _1051);
    if (!_851)
    {
        float _1055 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1057 = -_891;
        float _1059 = fma(_1013, _1055, _1057);
        _833 = _1059;
    }
    float _1061 = _833;
    float _1063 = _1061;
    if (!_851)
    {
        float _1065 = _1047 * _995;
        float _1067 = precise::clamp(_1065, 0.0, 1.0);
        _1039 = _1067;
    }
    float _1069 = _1039;
    float _1071 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1073 = _915 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_851)
    {
        float _1075 = _1061 * _945;
        float _1077 = precise::clamp(_1075, 0.0, 1.0);
        _1063 = _1077;
    }
    float _1079 = _1063;
    float _1081 = _1053 + 0.5;
    float _1083 = _1071 * _1031;
    float _1085 = _622 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1087 = _1025 + 0.5;
    if (!_851)
    {
        float _1089 = -_1079;
        float _1091 = _1089 + 1.0;
        _1035 = _1091;
    }
    float _1093 = _1035;
    float _1095 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[6].z, _787);
    float _1097 = exp2(_1085);
    bool _1099 = _1069 > 0.0;
    bool _1101 = isnan(_1069);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan(0.0);
    bool _1107 = _1103 || _1105;
    float _1109 = _1069 * _1093;
    float _1111 = _1073 * _1049;
    float _1113 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1095);
    float _1115 = _1109 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_63.x = _1111;
    out.m_63.y = _1083;
    out.m_63.z = _1087;
    out.m_63.w = _1081;
    float _1117 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1119 = _1113 + _1117;
    bool _1121 = _1093 <= 0.0;
    bool _1123 = !_1107;
    bool _1125 = _1121 || _1123;
    float _1127 = _1115 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1129 = _672 * 0.5;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1135 = _702 + _672;
    float _1137 = -_1097;
    float _1139 = _1137 + 1.0;
    float _1141 = _672 + _1119;
    float _1143 = fma(_704, -0.5, _1129);
    float _1145 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1147 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1149 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1151 = _1135 * 0.5;
    float _1153 = _1141 * 0.5;
    out.m_65.x = _1145;
    out.m_65.y = _1147;
    out.m_65.z = _839;
    out.m_49.x = _1127;
    out.gl_Position.x = _702;
    out.gl_Position.y = _704;
    out.gl_Position.z = _1119;
    out.gl_Position.w = _672;
    out.m_67.x = _1151;
    out.m_67.y = _1143;
    out.m_67.z = _1153;
    out.m_67.w = _672;
    float _1155 = _1149 * _728;
    float _1157 = -_1149;
    float _1159 = _1157 + 1.0;
    float _1161 = _743 * _1155;
    float _1163 = _753 * _1155;
    float _1165 = fma(_749, _1161, _737);
    float _1167 = fma(_751, _1161, _739);
    float _1169 = _743 * _1159;
    float _1171 = fma(_743, _1163, _741);
    out.m_69.x = _1165;
    out.m_69.y = _1167;
    out.m_69.z = _1171;
    out.m_69.w = _1169;
    if (!_1125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _1173 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1173;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

