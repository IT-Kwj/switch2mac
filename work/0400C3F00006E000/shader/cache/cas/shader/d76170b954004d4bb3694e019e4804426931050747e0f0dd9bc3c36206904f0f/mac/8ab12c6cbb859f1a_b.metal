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
    float4 m_65 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
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
    float4 m_55 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1142 = as_type<float>(_104);
        out.gl_Position.z = _1142;
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
        float _1211 = as_type<float>(_140);
        out.gl_Position.z = _1211;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_49.x;
    float _144 = in.m_49.y;
    float _146 = in.m_49.z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = in.m_51.z;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_49.w;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = in.m_42.x;
    float _176 = in.m_42.y;
    float _178 = in.m_42.z;
    float _180 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _182 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _184 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _186 = _180 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _188 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _150);
    float _190 = _180;
    float _192 = _148;
    if (!_164)
    {
        float _194 = _148 * _148;
        float _196 = _194 * 0.5;
        _190 = _196;
    }
    float _198 = _190;
    float _200 = _188 * _186;
    float _202 = _198;
    if (!_164)
    {
        float _204 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _204;
    }
    float _206 = _202;
    bool _208 = !_164;
    float _210 = _206;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _148 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _148);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_164;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _148 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _192 = _264;
    }
    float _266 = _192;
    float _268 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _272 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _274 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _152);
    float _276 = fma(_266, _170, _268);
    float _278 = fma(_266, _168, _270);
    float _280 = fma(_266, _172, _272);
    float _282 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _284 = fma(_276, _166, _176);
    float _286 = fma(_278, _166, _174);
    float _288 = fma(_280, _166, _178);
    float _290 = _274 * _282;
    float _292 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _294 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _296 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _298 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _154);
    float _300 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _292);
    float _302 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _294);
    float _304 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _296);
    float _306 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _308 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].z, _300);
    float _310 = _290 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _312 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].z, _302);
    float _314 = _298 * _306;
    float _316 = _308 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _318 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].z, _304);
    float _320 = _290 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _322 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[10].x, _310);
    float _324 = _312 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _326 = _316 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _328 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[8].x, _320);
    float _330 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[10].z, _322);
    float _332 = _318 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _334 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[11].x, _326);
    float _336 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[8].z, _328);
    float _338 = _316 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _340 = _332 + _330;
    float _342 = fma(_332, (*spvDescriptorSet0.vp_c8)._m0[11].z, _334);
    float _344 = _324 + _336;
    float _346 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[10].x, _338);
    float _348 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _350 = _340 + _348;
    float _352 = _342 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _354 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _356 = _344 + _354;
    float _358 = fma(_332, (*spvDescriptorSet0.vp_c8)._m0[10].z, _346);
    float _360 = _350 * _350;
    float _362 = 1.0 / _352;
    float _364 = _290 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _366 = _358 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _368 = fma(_356, _356, _360);
    float _370 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[9].x, _364);
    float _372 = _366 + _352;
    bool _374 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _376 = isnan(0.5);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _382 = _378 || _380;
    float _384 = sqrt(_368);
    float _386 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[9].z, _370);
    float _388 = _372 * _362;
    float _390 = _388 * 0.5;
    float _392 = _316 + _386;
    float _394 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _396 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[30].w, _394);
    float _398 = _332;
    float _400 = _314;
    float _402 = _390;
    float _404 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _406 = _392;
    float _408 = _344;
    if (_382)
    {
        _398 = 1.0;
    }
    float _410 = _398;
    bool _412 = _384 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _414 = 1.0 / _396;
    float _416 = _410;
    if (!_412)
    {
        _400 = _344;
    }
    float _418 = _400;
    float _420 = _418;
    if (!_412)
    {
        _402 = _340;
    }
    float _422 = _402;
    float _424 = _422;
    if (!_412)
    {
        _404 = _392;
    }
    float _426 = _404;
    bool _428 = !_412;
    float _430 = _426;
    if (!_428)
    {
        float _432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _434 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _436 = _384 + _434;
        float _438 = _392 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _440 = rsqrt(_368);
        float _442 = _436 * _432;
        float _444 = _442 * 0.15915493667125701904296875;
        float _446 = _444 * 6.283185482025146484375;
        float _448 = cos(_446);
        float _450 = _444 * 6.283185482025146484375;
        float _452 = sin(_450);
        float _454 = _448 + (-1.0);
        float _456 = _454 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _458 = fma(_452, _438, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _460 = fma(_392, _448, _456);
        float _462 = _440 * _458;
        float _464 = fma(_356, _462, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _466 = fma(_350, _462, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _430 = _460;
        _420 = _464;
        _424 = _466;
    }
    float _468 = _430;
    float _470 = _420;
    float _472 = _424;
    float _474 = 0.0;
    if (_382)
    {
        _474 = 1.0;
    }
    float _476 = _474;
    float _478 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _480 = _414 * _478;
    float _482 = _476;
    float _484 = _480;
    if (!_382)
    {
        float _486 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _488 = _486 * 0.15915493667125701904296875;
        float _490 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _492 = _488 * 6.283185482025146484375;
        float _494 = cos(_492);
        float _496 = _490 * 0.15915493667125701904296875;
        float _498 = _488 * 6.283185482025146484375;
        float _500 = sin(_498);
        float _502 = 1.0 / _494;
        float _504 = _496 * 6.283185482025146484375;
        float _506 = cos(_504);
        float _508 = _500 * _502;
        float _510 = _496 * 6.283185482025146484375;
        float _512 = sin(_510);
        float _514 = _506 * _508;
        float _516 = 1.0 / _514;
        float _518 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _520 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _518;
        float _522 = 1.0 / _520;
        float _524 = _512 * _516;
        float _526 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _528 = fma(_480, _524, _526);
        float _530 = _528 * _522;
        float _532 = precise::clamp(_530, 0.0, 1.0);
        _406 = _496;
        _416 = _532;
    }
    float _534 = _406;
    float _536 = _416;
    float _538 = _534;
    if (!_382)
    {
        float _540 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _542 = _540 * 0.15915493667125701904296875;
        float _544 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _546 = _542 * 6.283185482025146484375;
        float _548 = cos(_546);
        float _550 = _544 * 0.15915493667125701904296875;
        float _552 = _542 * 6.283185482025146484375;
        float _554 = sin(_552);
        float _556 = 1.0 / _548;
        float _558 = _550 * 6.283185482025146484375;
        float _560 = cos(_558);
        float _562 = _554 * _556;
        float _564 = _550 * 6.283185482025146484375;
        float _566 = sin(_564);
        float _568 = _560 * _562;
        float _570 = 1.0 / _568;
        float _572 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _574 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _572;
        float _576 = 1.0 / _574;
        float _578 = _566 * _570;
        float _580 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _582 = fma(_480, _578, _580);
        float _584 = _582 * _576;
        float _586 = precise::clamp(_584, 0.0, 1.0);
        float _588 = -_586;
        float _590 = _588 + 1.0;
        _538 = _570;
        _408 = _568;
        _482 = _590;
    }
    float _592 = _538;
    float _594 = _408;
    float _596 = _482;
    float _598 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _600 = _468 + _598;
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _604 = _470 + _602;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _608 = _472 + _606;
    float _610 = _600 * _600;
    float _612 = fma(_604, _604, _610);
    float _614 = fma(_608, _608, _612);
    float _616 = rsqrt(_614);
    float _618 = _616 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _620 = _604 * _618;
    float _622 = _608 * _618;
    float _624 = _620 * _620;
    float _626 = _622 * _622;
    float _628 = _624 + _626;
    float _630 = sqrt(_628);
    bool _632 = _630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _636 = _630 + _634;
    float _638 = _616;
    float _640 = _592;
    float _642 = _636;
    float _644 = _600;
    float _646 = _594;
    float _648 = _620;
    if (_632)
    {
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _638 = _650;
    }
    float _652 = _638;
    if (_632)
    {
        float _654 = rsqrt(_628);
        _640 = _654;
    }
    float _656 = _640;
    float _658 = _656;
    if (_632)
    {
        float _660 = _636 * _652;
        _642 = _660;
    }
    float _662 = _642;
    if (_632)
    {
        float _664 = _662 * 0.15915493667125701904296875;
        _484 = _664;
    }
    float _666 = _484;
    float _668 = _652;
    if (_632)
    {
        float _670 = _666 * 6.283185482025146484375;
        float _672 = sin(_670);
        _668 = _672;
    }
    float _674 = _668;
    float _676 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _678 = precise::max(0.0, _676);
    float _680 = _608;
    float _682 = _678;
    if (_632)
    {
        float _684 = _666 * 6.283185482025146484375;
        float _686 = cos(_684);
        _680 = _686;
    }
    float _688 = _680;
    float _690 = -_618;
    float _692 = -_678;
    float _694 = fma(_600, _690, _692);
    if (!_632)
    {
        _644 = _622;
    }
    float _696 = _644;
    float _698 = _696;
    if (_632)
    {
        float _700 = _694 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _682 = _700;
    }
    float _702 = _682;
    float _704 = sqrt(_614);
    float _706 = _674;
    float _708 = _702;
    if (_632)
    {
        float _710 = fma(_674, _702, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _646 = _710;
    }
    float _712 = _646;
    float _714 = _712;
    if (!_632)
    {
        _706 = _694;
    }
    float _716 = _706;
    float _718 = _716;
    float _720 = _688;
    if (_632)
    {
        float _722 = _688 + (-1.0);
        _708 = _722;
    }
    float _724 = _708;
    float _726 = _724;
    if (_632)
    {
        float _728 = _656 * _712;
        _714 = _728;
    }
    float _730 = _714;
    if (_632)
    {
        float _732 = _724 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _658 = _732;
    }
    float _734 = _658;
    if (_632)
    {
        float _736 = _620 * _730;
        _648 = _736;
    }
    float _738 = _648;
    if (!_632)
    {
        _726 = _624;
    }
    float _740 = _726;
    float _742 = _740;
    if (_632)
    {
        float _744 = _622 * _730;
        _698 = _744;
    }
    float _746 = _698;
    if (_632)
    {
        float _748 = fma(_694, _688, _734);
        _718 = _748;
    }
    float _750 = _718;
    if (_632)
    {
        float _752 = _738 * _738;
        _742 = _752;
    }
    float _754 = _742;
    if (!_632)
    {
        _720 = _626;
    }
    float _756 = _720;
    float _758 = _756;
    if (_632)
    {
        float _760 = _746 * _746;
        _758 = _760;
    }
    float _762 = _758;
    float _764 = _468 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _766 = fma(_750, _750, _754);
    float _768 = _766 + _762;
    float _770 = _468 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _772 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _774 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[23].w, _772);
    float _776 = precise::clamp(_774, 0.0, 1.0);
    float _778 = _468 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _780 = rsqrt(_768);
    float _782 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[2].x, _770);
    float _784 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[3].x, _764);
    float _786 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[1].x, _778);
    float _788 = -_776;
    float _790 = _788 + 1.0;
    float _792 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[2].z, _782);
    float _794 = _468 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _796 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[1].z, _786);
    float _798 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _800 = _792 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _802 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[0].x, _794);
    float _804 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[3].z, _784);
    float _806 = abs(_790);
    float _808 = log2(_806);
    float _810 = _800 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _812 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[0].z, _802);
    float _814 = _796 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _816 = _780 * _738;
    float _818 = -_810;
    float _820 = fma(_818, _798, 1.0);
    float _822 = _804 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _824 = _812 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _826 = _814 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _828 = _780 * _750;
    float _830 = _816 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _832 = _780 * _746;
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[7].x, _826);
    float _836 = log2(_820);
    float _838 = -_830;
    float _840 = fma(_828, (*spvDescriptorSet0.vp_c15)._m0[21].y, _838);
    float _842 = _828 + 1.0;
    float _844 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[7].z, _834);
    float _846 = _808 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _848 = -_832;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[21].z, _840);
    float _852 = _814 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _854 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[7].w, _844);
    float _856 = _814 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _858 = fma(_850, -0.5, 0.5);
    float _860 = exp2(_846);
    float _862 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[4].x, _852);
    float _864 = fma(_850, 0.5, 0.5);
    float _866 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[5].x, _856);
    float _868 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[4].z, _862);
    float _870 = fma(_864, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _872 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[5].z, _866);
    float _874 = 1.0 / _854;
    float _876 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[4].w, _868);
    float _878 = fma(_864, _870, -0.212114393711090087890625);
    float _880 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[5].w, _872);
    float _882 = _836 * 0.693147182464599609375;
    float _884 = fma(_864, _878, 1.570728778839111328125);
    float _886 = sqrt(_858);
    float _888 = -_828;
    float _890 = fma(_860, _842, _888);
    float _892 = _882 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _894 = fma(_890, 0.5, 0.5);
    float _896 = _876 * _874;
    float _898 = _880 * _874;
    float _900 = fma(_896, 0.5, 0.5);
    float _902 = fma(_898, -0.5, 0.5);
    float _904 = _886 * 0.636619746685028076171875;
    float3 _2435 = float3(_900, _902, _892);
    float _906 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2435, float3(0.0), isnan(_2435)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2435, float3(0.0), isnan(_2435)), level(0.0)).x;
    float _908 = -_884;
    float _910 = fma(_904, _908, 1.0);
    float3 _2451 = float3(_900, _902, _892);
    float4 _913 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2451, float3(0.0), isnan(_2451)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2451, float3(0.0), isnan(_2451)), level(0.0)).xyzw;
    float _915 = _913.x;
    float _917 = _913.y;
    float _919 = _913.z;
    float _921 = _913.w;
    float2 _2468 = float2(_910, _894);
    float3 _925 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2468, float2(0.0), isnan(_2468)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2468, float2(0.0), isnan(_2468)), level(0.0)).xyz;
    float _927 = _925.x;
    float _929 = _925.y;
    float _931 = _925.z;
    float _933 = in.m_53.x;
    float _935 = in.m_53.y;
    float _937 = in.m_53.z;
    bool _939 = _152 != 0.0;
    bool _941 = isnan(_152);
    bool _943 = _939 || _941;
    bool _945 = isnan(0.0);
    bool _947 = _943 || _945;
    float _949 = _814 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _951 = in.m_55.w;
    bool _953 = _150 == 0.0;
    bool _955 = !_947;
    bool _957 = _953 && _955;
    float _959 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[6].x, _949);
    out.m_57.x = _470;
    out.m_57.y = _468;
    out.m_57.z = _472;
    bool _961 = _154 == 0.0;
    bool _963 = _961 && _957;
    float _965 = _808 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _967 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[6].z, _959);
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _971 = exp2(_965);
    float _973 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[6].w, _967);
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _979 = _973 + _854;
    float _981 = _975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _983 = _935;
    float _985 = _933;
    float _987 = _937;
    if (!_963)
    {
        float _989 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _935);
        _983 = _989;
    }
    float _991 = _983;
    if (!_963)
    {
        float _993 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[17].y, _933);
        _985 = _993;
    }
    float _995 = _985;
    if (!_963)
    {
        float _997 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[17].y, _937);
        _987 = _997;
    }
    float _999 = _987;
    float _1001 = _991 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1003 = _991 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1005 = _991 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1007 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1001);
    float _1009 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1003);
    float _1011 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1005);
    float _1013 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1007);
    float _1015 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1009);
    float _1017 = _536 * _596;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1025 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1027 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1031 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1033 = _1025 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1035 = -_971;
    float _1037 = _1035 + 1.0;
    bool _1039 = _536 > 0.0;
    bool _1041 = isnan(_536);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan(0.0);
    bool _1047 = _1043 || _1045;
    float _1049 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1011);
    out.m_59.x = _1027;
    out.m_59.y = _1029;
    out.m_59.z = _1031;
    out.m_59.w = _969;
    float _1051 = _977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1053 = _596 <= 0.0;
    bool _1055 = !_1047;
    bool _1057 = _1053 || _1055;
    float _1059 = _979 * 0.5;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_61.x = _1013;
    out.m_61.y = _1015;
    out.m_61.z = _1049;
    float _1063 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.w = _951;
    float _1065 = _1037 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_65.x = _981;
    out.m_65.y = _1063;
    out.m_65.z = _1051;
    out.m_45.x = _1033;
    out.gl_Position.x = _876;
    out.gl_Position.y = _880;
    out.gl_Position.z = _973;
    out.gl_Position.w = _854;
    out.m_67.z = _1059;
    out.m_67.w = _854;
    float _1067 = _1065 * _906;
    float _1069 = -_1065;
    float _1071 = _1069 + 1.0;
    float _1073 = _921 * _1067;
    float _1075 = _921 * _1071;
    float _1077 = _931 * _1067;
    float _1079 = fma(_927, _1073, _915);
    float _1081 = fma(_929, _1073, _917);
    float _1083 = fma(_921, _1077, _919);
    out.m_69.x = _1079;
    out.m_69.y = _1081;
    out.m_69.z = _1083;
    out.m_69.w = _1075;
    if (!_1057)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1085 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1085;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1142 = as_type<float>(_104);
        out.gl_Position.z = _1142;
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
        float _1211 = as_type<float>(_140);
        out.gl_Position.z = _1211;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_49.x;
    float _144 = in.m_49.y;
    float _146 = in.m_49.z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = in.m_51.z;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_49.w;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = in.m_42.x;
    float _176 = in.m_42.y;
    float _178 = in.m_42.z;
    float _180 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _182 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _184 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _186 = _180 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _188 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _150);
    float _190 = _180;
    float _192 = _148;
    if (!_164)
    {
        float _194 = _148 * _148;
        float _196 = _194 * 0.5;
        _190 = _196;
    }
    float _198 = _190;
    float _200 = _188 * _186;
    float _202 = _198;
    if (!_164)
    {
        float _204 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _204;
    }
    float _206 = _202;
    bool _208 = !_164;
    float _210 = _206;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _148 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _148);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_164;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _148 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _192 = _264;
    }
    float _266 = _192;
    float _268 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _272 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _274 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _152);
    float _276 = fma(_266, _170, _268);
    float _278 = fma(_266, _168, _270);
    float _280 = fma(_266, _172, _272);
    float _282 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _284 = fma(_276, _166, _176);
    float _286 = fma(_278, _166, _174);
    float _288 = fma(_280, _166, _178);
    float _290 = _274 * _282;
    float _292 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _294 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _296 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _298 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _154);
    float _300 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _292);
    float _302 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _294);
    float _304 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _296);
    float _306 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _308 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].z, _300);
    float _310 = _290 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _312 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].z, _302);
    float _314 = _298 * _306;
    float _316 = _308 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _318 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].z, _304);
    float _320 = _290 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _322 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[10].x, _310);
    float _324 = _312 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _326 = _316 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _328 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[8].x, _320);
    float _330 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[10].z, _322);
    float _332 = _318 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _334 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[11].x, _326);
    float _336 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[8].z, _328);
    float _338 = _316 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _340 = _332 + _330;
    float _342 = fma(_332, (*spvDescriptorSet0.vp_c8)._m0[11].z, _334);
    float _344 = _324 + _336;
    float _346 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[10].x, _338);
    float _348 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _350 = _340 + _348;
    float _352 = _342 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _354 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _356 = _344 + _354;
    float _358 = fma(_332, (*spvDescriptorSet0.vp_c8)._m0[10].z, _346);
    float _360 = _350 * _350;
    float _362 = 1.0 / _352;
    float _364 = _290 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _366 = _358 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _368 = fma(_356, _356, _360);
    float _370 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[9].x, _364);
    float _372 = _366 + _352;
    bool _374 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _376 = isnan(0.5);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _382 = _378 || _380;
    float _384 = sqrt(_368);
    float _386 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[9].z, _370);
    float _388 = _372 * _362;
    float _390 = _388 * 0.5;
    float _392 = _316 + _386;
    float _394 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _396 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[30].w, _394);
    float _398 = _332;
    float _400 = _314;
    float _402 = _390;
    float _404 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _406 = _392;
    float _408 = _344;
    if (_382)
    {
        _398 = 1.0;
    }
    float _410 = _398;
    bool _412 = _384 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _414 = 1.0 / _396;
    float _416 = _410;
    if (!_412)
    {
        _400 = _344;
    }
    float _418 = _400;
    float _420 = _418;
    if (!_412)
    {
        _402 = _340;
    }
    float _422 = _402;
    float _424 = _422;
    if (!_412)
    {
        _404 = _392;
    }
    float _426 = _404;
    bool _428 = !_412;
    float _430 = _426;
    if (!_428)
    {
        float _432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _434 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _436 = _384 + _434;
        float _438 = _392 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _440 = rsqrt(_368);
        float _442 = _436 * _432;
        float _444 = _442 * 0.15915493667125701904296875;
        float _446 = _444 * 6.283185482025146484375;
        float _448 = cos(_446);
        float _450 = _444 * 6.283185482025146484375;
        float _452 = sin(_450);
        float _454 = _448 + (-1.0);
        float _456 = _454 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _458 = fma(_452, _438, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _460 = fma(_392, _448, _456);
        float _462 = _440 * _458;
        float _464 = fma(_356, _462, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _466 = fma(_350, _462, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _430 = _460;
        _420 = _464;
        _424 = _466;
    }
    float _468 = _430;
    float _470 = _420;
    float _472 = _424;
    float _474 = 0.0;
    if (_382)
    {
        _474 = 1.0;
    }
    float _476 = _474;
    float _478 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _480 = _414 * _478;
    float _482 = _476;
    float _484 = _480;
    if (!_382)
    {
        float _486 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _488 = _486 * 0.15915493667125701904296875;
        float _490 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _492 = _488 * 6.283185482025146484375;
        float _494 = cos(_492);
        float _496 = _490 * 0.15915493667125701904296875;
        float _498 = _488 * 6.283185482025146484375;
        float _500 = sin(_498);
        float _502 = 1.0 / _494;
        float _504 = _496 * 6.283185482025146484375;
        float _506 = cos(_504);
        float _508 = _500 * _502;
        float _510 = _496 * 6.283185482025146484375;
        float _512 = sin(_510);
        float _514 = _506 * _508;
        float _516 = 1.0 / _514;
        float _518 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _520 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _518;
        float _522 = 1.0 / _520;
        float _524 = _512 * _516;
        float _526 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _528 = fma(_480, _524, _526);
        float _530 = _528 * _522;
        float _532 = precise::clamp(_530, 0.0, 1.0);
        _406 = _496;
        _416 = _532;
    }
    float _534 = _406;
    float _536 = _416;
    float _538 = _534;
    if (!_382)
    {
        float _540 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _542 = _540 * 0.15915493667125701904296875;
        float _544 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _546 = _542 * 6.283185482025146484375;
        float _548 = cos(_546);
        float _550 = _544 * 0.15915493667125701904296875;
        float _552 = _542 * 6.283185482025146484375;
        float _554 = sin(_552);
        float _556 = 1.0 / _548;
        float _558 = _550 * 6.283185482025146484375;
        float _560 = cos(_558);
        float _562 = _554 * _556;
        float _564 = _550 * 6.283185482025146484375;
        float _566 = sin(_564);
        float _568 = _560 * _562;
        float _570 = 1.0 / _568;
        float _572 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _574 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _572;
        float _576 = 1.0 / _574;
        float _578 = _566 * _570;
        float _580 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _582 = fma(_480, _578, _580);
        float _584 = _582 * _576;
        float _586 = precise::clamp(_584, 0.0, 1.0);
        float _588 = -_586;
        float _590 = _588 + 1.0;
        _538 = _570;
        _408 = _568;
        _482 = _590;
    }
    float _592 = _538;
    float _594 = _408;
    float _596 = _482;
    float _598 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _600 = _468 + _598;
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _604 = _470 + _602;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _608 = _472 + _606;
    float _610 = _600 * _600;
    float _612 = fma(_604, _604, _610);
    float _614 = fma(_608, _608, _612);
    float _616 = rsqrt(_614);
    float _618 = _616 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _620 = _604 * _618;
    float _622 = _608 * _618;
    float _624 = _620 * _620;
    float _626 = _622 * _622;
    float _628 = _624 + _626;
    float _630 = sqrt(_628);
    bool _632 = _630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _636 = _630 + _634;
    float _638 = _616;
    float _640 = _592;
    float _642 = _636;
    float _644 = _600;
    float _646 = _594;
    float _648 = _620;
    if (_632)
    {
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _638 = _650;
    }
    float _652 = _638;
    if (_632)
    {
        float _654 = rsqrt(_628);
        _640 = _654;
    }
    float _656 = _640;
    float _658 = _656;
    if (_632)
    {
        float _660 = _636 * _652;
        _642 = _660;
    }
    float _662 = _642;
    if (_632)
    {
        float _664 = _662 * 0.15915493667125701904296875;
        _484 = _664;
    }
    float _666 = _484;
    float _668 = _652;
    if (_632)
    {
        float _670 = _666 * 6.283185482025146484375;
        float _672 = sin(_670);
        _668 = _672;
    }
    float _674 = _668;
    float _676 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _678 = precise::max(0.0, _676);
    float _680 = _608;
    float _682 = _678;
    if (_632)
    {
        float _684 = _666 * 6.283185482025146484375;
        float _686 = cos(_684);
        _680 = _686;
    }
    float _688 = _680;
    float _690 = -_618;
    float _692 = -_678;
    float _694 = fma(_600, _690, _692);
    if (!_632)
    {
        _644 = _622;
    }
    float _696 = _644;
    float _698 = _696;
    if (_632)
    {
        float _700 = _694 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _682 = _700;
    }
    float _702 = _682;
    float _704 = sqrt(_614);
    float _706 = _674;
    float _708 = _702;
    if (_632)
    {
        float _710 = fma(_674, _702, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _646 = _710;
    }
    float _712 = _646;
    float _714 = _712;
    if (!_632)
    {
        _706 = _694;
    }
    float _716 = _706;
    float _718 = _716;
    float _720 = _688;
    if (_632)
    {
        float _722 = _688 + (-1.0);
        _708 = _722;
    }
    float _724 = _708;
    float _726 = _724;
    if (_632)
    {
        float _728 = _656 * _712;
        _714 = _728;
    }
    float _730 = _714;
    if (_632)
    {
        float _732 = _724 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _658 = _732;
    }
    float _734 = _658;
    if (_632)
    {
        float _736 = _620 * _730;
        _648 = _736;
    }
    float _738 = _648;
    if (!_632)
    {
        _726 = _624;
    }
    float _740 = _726;
    float _742 = _740;
    if (_632)
    {
        float _744 = _622 * _730;
        _698 = _744;
    }
    float _746 = _698;
    if (_632)
    {
        float _748 = fma(_694, _688, _734);
        _718 = _748;
    }
    float _750 = _718;
    if (_632)
    {
        float _752 = _738 * _738;
        _742 = _752;
    }
    float _754 = _742;
    if (!_632)
    {
        _720 = _626;
    }
    float _756 = _720;
    float _758 = _756;
    if (_632)
    {
        float _760 = _746 * _746;
        _758 = _760;
    }
    float _762 = _758;
    float _764 = _468 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _766 = fma(_750, _750, _754);
    float _768 = _766 + _762;
    float _770 = _468 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _772 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _774 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[23].w, _772);
    float _776 = precise::clamp(_774, 0.0, 1.0);
    float _778 = _468 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _780 = rsqrt(_768);
    float _782 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[2].x, _770);
    float _784 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[3].x, _764);
    float _786 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[1].x, _778);
    float _788 = -_776;
    float _790 = _788 + 1.0;
    float _792 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[2].z, _782);
    float _794 = _468 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _796 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[1].z, _786);
    float _798 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _800 = _792 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _802 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[0].x, _794);
    float _804 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[3].z, _784);
    float _806 = abs(_790);
    float _808 = log2(_806);
    float _810 = _800 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _812 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[0].z, _802);
    float _814 = _796 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _816 = _780 * _738;
    float _818 = -_810;
    float _820 = fma(_818, _798, 1.0);
    float _822 = _804 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _824 = _812 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _826 = _814 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _828 = _780 * _750;
    float _830 = _816 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _832 = _780 * _746;
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[7].x, _826);
    float _836 = log2(_820);
    float _838 = -_830;
    float _840 = fma(_828, (*spvDescriptorSet0.vp_c15)._m0[21].y, _838);
    float _842 = _828 + 1.0;
    float _844 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[7].z, _834);
    float _846 = _808 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _848 = -_832;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[21].z, _840);
    float _852 = _814 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _854 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[7].w, _844);
    float _856 = _814 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _858 = fma(_850, -0.5, 0.5);
    float _860 = exp2(_846);
    float _862 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[4].x, _852);
    float _864 = fma(_850, 0.5, 0.5);
    float _866 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[5].x, _856);
    float _868 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[4].z, _862);
    float _870 = fma(_864, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _872 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[5].z, _866);
    float _874 = 1.0 / _854;
    float _876 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[4].w, _868);
    float _878 = fma(_864, _870, -0.212114393711090087890625);
    float _880 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[5].w, _872);
    float _882 = _836 * 0.693147182464599609375;
    float _884 = fma(_864, _878, 1.570728778839111328125);
    float _886 = sqrt(_858);
    float _888 = -_828;
    float _890 = fma(_860, _842, _888);
    float _892 = _882 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _894 = fma(_890, 0.5, 0.5);
    float _896 = _876 * _874;
    float _898 = _880 * _874;
    float _900 = fma(_896, 0.5, 0.5);
    float _902 = fma(_898, -0.5, 0.5);
    float _904 = _886 * 0.636619746685028076171875;
    float3 _2435 = float3(_900, _902, _892);
    float _906 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2435, float3(0.0), isnan(_2435)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2435, float3(0.0), isnan(_2435)), level(0.0)).x;
    float _908 = -_884;
    float _910 = fma(_904, _908, 1.0);
    float3 _2451 = float3(_900, _902, _892);
    float4 _913 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2451, float3(0.0), isnan(_2451)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2451, float3(0.0), isnan(_2451)), level(0.0)).xyzw;
    float _915 = _913.x;
    float _917 = _913.y;
    float _919 = _913.z;
    float _921 = _913.w;
    float2 _2468 = float2(_910, _894);
    float3 _925 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2468, float2(0.0), isnan(_2468)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2468, float2(0.0), isnan(_2468)), level(0.0)).xyz;
    float _927 = _925.x;
    float _929 = _925.y;
    float _931 = _925.z;
    float _933 = in.m_53.x;
    float _935 = in.m_53.y;
    float _937 = in.m_53.z;
    bool _939 = _152 != 0.0;
    bool _941 = isnan(_152);
    bool _943 = _939 || _941;
    bool _945 = isnan(0.0);
    bool _947 = _943 || _945;
    float _949 = _814 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _951 = in.m_55.w;
    bool _953 = _150 == 0.0;
    bool _955 = !_947;
    bool _957 = _953 && _955;
    float _959 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[6].x, _949);
    out.m_57.x = _470;
    out.m_57.y = _468;
    out.m_57.z = _472;
    bool _961 = _154 == 0.0;
    bool _963 = _961 && _957;
    float _965 = _808 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _967 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[6].z, _959);
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _971 = exp2(_965);
    float _973 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[6].w, _967);
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _979 = _973 + _854;
    float _981 = _975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _983 = _935;
    float _985 = _933;
    float _987 = _937;
    if (!_963)
    {
        float _989 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _935);
        _983 = _989;
    }
    float _991 = _983;
    if (!_963)
    {
        float _993 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[17].y, _933);
        _985 = _993;
    }
    float _995 = _985;
    if (!_963)
    {
        float _997 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[17].y, _937);
        _987 = _997;
    }
    float _999 = _987;
    float _1001 = _991 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1003 = _991 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1005 = _991 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1007 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1001);
    float _1009 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1003);
    float _1011 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1005);
    float _1013 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1007);
    float _1015 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1009);
    float _1017 = _536 * _596;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1025 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1027 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1031 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1033 = _1025 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1035 = -_971;
    float _1037 = _1035 + 1.0;
    bool _1039 = _536 > 0.0;
    bool _1041 = isnan(_536);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan(0.0);
    bool _1047 = _1043 || _1045;
    float _1049 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1011);
    out.m_59.x = _1027;
    out.m_59.y = _1029;
    out.m_59.z = _1031;
    out.m_59.w = _969;
    float _1051 = _977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1053 = _596 <= 0.0;
    bool _1055 = !_1047;
    bool _1057 = _1053 || _1055;
    float _1059 = _979 * 0.5;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_61.x = _1013;
    out.m_61.y = _1015;
    out.m_61.z = _1049;
    float _1063 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.w = _951;
    float _1065 = _1037 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_65.x = _981;
    out.m_65.y = _1063;
    out.m_65.z = _1051;
    out.m_45.x = _1033;
    out.gl_Position.x = _876;
    out.gl_Position.y = _880;
    out.gl_Position.z = _973;
    out.gl_Position.w = _854;
    out.m_67.z = _1059;
    out.m_67.w = _854;
    float _1067 = _1065 * _906;
    float _1069 = -_1065;
    float _1071 = _1069 + 1.0;
    float _1073 = _921 * _1067;
    float _1075 = _921 * _1071;
    float _1077 = _931 * _1067;
    float _1079 = fma(_927, _1073, _915);
    float _1081 = fma(_929, _1073, _917);
    float _1083 = fma(_921, _1077, _919);
    out.m_69.x = _1079;
    out.m_69.y = _1081;
    out.m_69.z = _1083;
    out.m_69.w = _1075;
    if (!_1057)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1085 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1085;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1142 = as_type<float>(_104);
        out.gl_Position.z = _1142;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1211 = as_type<float>(_140);
        out.gl_Position.z = _1211;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_49.x;
    float _144 = in.m_49.y;
    float _146 = in.m_49.z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = in.m_51.z;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_49.w;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = in.m_42.x;
    float _176 = in.m_42.y;
    float _178 = in.m_42.z;
    float _180 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _182 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _184 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _186 = _180 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _188 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _150);
    float _190 = _180;
    float _192 = _148;
    if (!_164)
    {
        float _194 = _148 * _148;
        float _196 = _194 * 0.5;
        _190 = _196;
    }
    float _198 = _190;
    float _200 = _188 * _186;
    float _202 = _198;
    if (!_164)
    {
        float _204 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _204;
    }
    float _206 = _202;
    bool _208 = !_164;
    float _210 = _206;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _148 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _148);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_164;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _148 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _192 = _264;
    }
    float _266 = _192;
    float _268 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _272 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _274 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _152);
    float _276 = fma(_266, _170, _268);
    float _278 = fma(_266, _168, _270);
    float _280 = fma(_266, _172, _272);
    float _282 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _284 = fma(_276, _166, _176);
    float _286 = fma(_278, _166, _174);
    float _288 = fma(_280, _166, _178);
    float _290 = _274 * _282;
    float _292 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _294 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _296 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _298 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _154);
    float _300 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _292);
    float _302 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _294);
    float _304 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _296);
    float _306 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _308 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].z, _300);
    float _310 = _290 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _312 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].z, _302);
    float _314 = _298 * _306;
    float _316 = _308 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _318 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].z, _304);
    float _320 = _290 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _322 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[10].x, _310);
    float _324 = _312 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _326 = _316 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _328 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[8].x, _320);
    float _330 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[10].z, _322);
    float _332 = _318 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _334 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[11].x, _326);
    float _336 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[8].z, _328);
    float _338 = _316 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _340 = _332 + _330;
    float _342 = fma(_332, (*spvDescriptorSet0.vp_c8)._m0[11].z, _334);
    float _344 = _324 + _336;
    float _346 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[10].x, _338);
    float _348 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _350 = _340 + _348;
    float _352 = _342 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _354 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _356 = _344 + _354;
    float _358 = fma(_332, (*spvDescriptorSet0.vp_c8)._m0[10].z, _346);
    float _360 = _350 * _350;
    float _362 = 1.0 / _352;
    float _364 = _290 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _366 = _358 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _368 = fma(_356, _356, _360);
    float _370 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[9].x, _364);
    float _372 = _366 + _352;
    bool _374 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _376 = isnan(0.5);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _382 = _378 || _380;
    float _384 = sqrt(_368);
    float _386 = fma(_314, (*spvDescriptorSet0.vp_c10)._m0[9].z, _370);
    float _388 = _372 * _362;
    float _390 = _388 * 0.5;
    float _392 = _316 + _386;
    float _394 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _396 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[30].w, _394);
    float _398 = _332;
    float _400 = _314;
    float _402 = _390;
    float _404 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _406 = _392;
    float _408 = _344;
    if (_382)
    {
        _398 = 1.0;
    }
    float _410 = _398;
    bool _412 = _384 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _414 = 1.0 / _396;
    float _416 = _410;
    if (!_412)
    {
        _400 = _344;
    }
    float _418 = _400;
    float _420 = _418;
    if (!_412)
    {
        _402 = _340;
    }
    float _422 = _402;
    float _424 = _422;
    if (!_412)
    {
        _404 = _392;
    }
    float _426 = _404;
    bool _428 = !_412;
    float _430 = _426;
    if (!_428)
    {
        float _432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _434 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _436 = _384 + _434;
        float _438 = _392 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _440 = rsqrt(_368);
        float _442 = _436 * _432;
        float _444 = _442 * 0.15915493667125701904296875;
        float _446 = _444 * 6.283185482025146484375;
        float _448 = cos(_446);
        float _450 = _444 * 6.283185482025146484375;
        float _452 = sin(_450);
        float _454 = _448 + (-1.0);
        float _456 = _454 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _458 = fma(_452, _438, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _460 = fma(_392, _448, _456);
        float _462 = _440 * _458;
        float _464 = fma(_356, _462, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _466 = fma(_350, _462, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _430 = _460;
        _420 = _464;
        _424 = _466;
    }
    float _468 = _430;
    float _470 = _420;
    float _472 = _424;
    float _474 = 0.0;
    if (_382)
    {
        _474 = 1.0;
    }
    float _476 = _474;
    float _478 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _480 = _414 * _478;
    float _482 = _476;
    float _484 = _480;
    if (!_382)
    {
        float _486 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _488 = _486 * 0.15915493667125701904296875;
        float _490 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _492 = _488 * 6.283185482025146484375;
        float _494 = cos(_492);
        float _496 = _490 * 0.15915493667125701904296875;
        float _498 = _488 * 6.283185482025146484375;
        float _500 = sin(_498);
        float _502 = 1.0 / _494;
        float _504 = _496 * 6.283185482025146484375;
        float _506 = cos(_504);
        float _508 = _500 * _502;
        float _510 = _496 * 6.283185482025146484375;
        float _512 = sin(_510);
        float _514 = _506 * _508;
        float _516 = 1.0 / _514;
        float _518 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _520 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _518;
        float _522 = 1.0 / _520;
        float _524 = _512 * _516;
        float _526 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _528 = fma(_480, _524, _526);
        float _530 = _528 * _522;
        float _532 = precise::clamp(_530, 0.0, 1.0);
        _406 = _496;
        _416 = _532;
    }
    float _534 = _406;
    float _536 = _416;
    float _538 = _534;
    if (!_382)
    {
        float _540 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _542 = _540 * 0.15915493667125701904296875;
        float _544 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _546 = _542 * 6.283185482025146484375;
        float _548 = cos(_546);
        float _550 = _544 * 0.15915493667125701904296875;
        float _552 = _542 * 6.283185482025146484375;
        float _554 = sin(_552);
        float _556 = 1.0 / _548;
        float _558 = _550 * 6.283185482025146484375;
        float _560 = cos(_558);
        float _562 = _554 * _556;
        float _564 = _550 * 6.283185482025146484375;
        float _566 = sin(_564);
        float _568 = _560 * _562;
        float _570 = 1.0 / _568;
        float _572 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _574 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _572;
        float _576 = 1.0 / _574;
        float _578 = _566 * _570;
        float _580 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _582 = fma(_480, _578, _580);
        float _584 = _582 * _576;
        float _586 = precise::clamp(_584, 0.0, 1.0);
        float _588 = -_586;
        float _590 = _588 + 1.0;
        _538 = _570;
        _408 = _568;
        _482 = _590;
    }
    float _592 = _538;
    float _594 = _408;
    float _596 = _482;
    float _598 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _600 = _468 + _598;
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _604 = _470 + _602;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _608 = _472 + _606;
    float _610 = _600 * _600;
    float _612 = fma(_604, _604, _610);
    float _614 = fma(_608, _608, _612);
    float _616 = rsqrt(_614);
    float _618 = _616 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _620 = _604 * _618;
    float _622 = _608 * _618;
    float _624 = _620 * _620;
    float _626 = _622 * _622;
    float _628 = _624 + _626;
    float _630 = sqrt(_628);
    bool _632 = _630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _636 = _630 + _634;
    float _638 = _616;
    float _640 = _592;
    float _642 = _636;
    float _644 = _600;
    float _646 = _594;
    float _648 = _620;
    if (_632)
    {
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _638 = _650;
    }
    float _652 = _638;
    if (_632)
    {
        float _654 = rsqrt(_628);
        _640 = _654;
    }
    float _656 = _640;
    float _658 = _656;
    if (_632)
    {
        float _660 = _636 * _652;
        _642 = _660;
    }
    float _662 = _642;
    if (_632)
    {
        float _664 = _662 * 0.15915493667125701904296875;
        _484 = _664;
    }
    float _666 = _484;
    float _668 = _652;
    if (_632)
    {
        float _670 = _666 * 6.283185482025146484375;
        float _672 = sin(_670);
        _668 = _672;
    }
    float _674 = _668;
    float _676 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _678 = precise::max(0.0, _676);
    float _680 = _608;
    float _682 = _678;
    if (_632)
    {
        float _684 = _666 * 6.283185482025146484375;
        float _686 = cos(_684);
        _680 = _686;
    }
    float _688 = _680;
    float _690 = -_618;
    float _692 = -_678;
    float _694 = fma(_600, _690, _692);
    if (!_632)
    {
        _644 = _622;
    }
    float _696 = _644;
    float _698 = _696;
    if (_632)
    {
        float _700 = _694 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _682 = _700;
    }
    float _702 = _682;
    float _704 = sqrt(_614);
    float _706 = _674;
    float _708 = _702;
    if (_632)
    {
        float _710 = fma(_674, _702, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _646 = _710;
    }
    float _712 = _646;
    float _714 = _712;
    if (!_632)
    {
        _706 = _694;
    }
    float _716 = _706;
    float _718 = _716;
    float _720 = _688;
    if (_632)
    {
        float _722 = _688 + (-1.0);
        _708 = _722;
    }
    float _724 = _708;
    float _726 = _724;
    if (_632)
    {
        float _728 = _656 * _712;
        _714 = _728;
    }
    float _730 = _714;
    if (_632)
    {
        float _732 = _724 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _658 = _732;
    }
    float _734 = _658;
    if (_632)
    {
        float _736 = _620 * _730;
        _648 = _736;
    }
    float _738 = _648;
    if (!_632)
    {
        _726 = _624;
    }
    float _740 = _726;
    float _742 = _740;
    if (_632)
    {
        float _744 = _622 * _730;
        _698 = _744;
    }
    float _746 = _698;
    if (_632)
    {
        float _748 = fma(_694, _688, _734);
        _718 = _748;
    }
    float _750 = _718;
    if (_632)
    {
        float _752 = _738 * _738;
        _742 = _752;
    }
    float _754 = _742;
    if (!_632)
    {
        _720 = _626;
    }
    float _756 = _720;
    float _758 = _756;
    if (_632)
    {
        float _760 = _746 * _746;
        _758 = _760;
    }
    float _762 = _758;
    float _764 = _468 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _766 = fma(_750, _750, _754);
    float _768 = _766 + _762;
    float _770 = _468 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _772 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _774 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[23].w, _772);
    float _776 = precise::clamp(_774, 0.0, 1.0);
    float _778 = _468 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _780 = rsqrt(_768);
    float _782 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[2].x, _770);
    float _784 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[3].x, _764);
    float _786 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[1].x, _778);
    float _788 = -_776;
    float _790 = _788 + 1.0;
    float _792 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[2].z, _782);
    float _794 = _468 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _796 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[1].z, _786);
    float _798 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _800 = _792 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _802 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[0].x, _794);
    float _804 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[3].z, _784);
    float _806 = abs(_790);
    float _808 = log2(_806);
    float _810 = _800 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _812 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[0].z, _802);
    float _814 = _796 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _816 = _780 * _738;
    float _818 = -_810;
    float _820 = fma(_818, _798, 1.0);
    float _822 = _804 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _824 = _812 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _826 = _814 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _828 = _780 * _750;
    float _830 = _816 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _832 = _780 * _746;
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[7].x, _826);
    float _836 = log2(_820);
    float _838 = -_830;
    float _840 = fma(_828, (*spvDescriptorSet0.vp_c15)._m0[21].y, _838);
    float _842 = _828 + 1.0;
    float _844 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[7].z, _834);
    float _846 = _808 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _848 = -_832;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[21].z, _840);
    float _852 = _814 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _854 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[7].w, _844);
    float _856 = _814 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _858 = fma(_850, -0.5, 0.5);
    float _860 = exp2(_846);
    float _862 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[4].x, _852);
    float _864 = fma(_850, 0.5, 0.5);
    float _866 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[5].x, _856);
    float _868 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[4].z, _862);
    float _870 = fma(_864, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _872 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[5].z, _866);
    float _874 = 1.0 / _854;
    float _876 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[4].w, _868);
    float _878 = fma(_864, _870, -0.212114393711090087890625);
    float _880 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[5].w, _872);
    float _882 = _836 * 0.693147182464599609375;
    float _884 = fma(_864, _878, 1.570728778839111328125);
    float _886 = sqrt(_858);
    float _888 = -_828;
    float _890 = fma(_860, _842, _888);
    float _892 = _882 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _894 = fma(_890, 0.5, 0.5);
    float _896 = _876 * _874;
    float _898 = _880 * _874;
    float _900 = fma(_896, 0.5, 0.5);
    float _902 = fma(_898, -0.5, 0.5);
    float _904 = _886 * 0.636619746685028076171875;
    float3 _2435 = float3(_900, _902, _892);
    float _906 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2435, float3(0.0), isnan(_2435)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2435, float3(0.0), isnan(_2435)), level(0.0)).x;
    float _908 = -_884;
    float _910 = fma(_904, _908, 1.0);
    float3 _2451 = float3(_900, _902, _892);
    float4 _913 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2451, float3(0.0), isnan(_2451)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2451, float3(0.0), isnan(_2451)), level(0.0)).xyzw;
    float _915 = _913.x;
    float _917 = _913.y;
    float _919 = _913.z;
    float _921 = _913.w;
    float2 _2468 = float2(_910, _894);
    float3 _925 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2468, float2(0.0), isnan(_2468)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2468, float2(0.0), isnan(_2468)), level(0.0)).xyz;
    float _927 = _925.x;
    float _929 = _925.y;
    float _931 = _925.z;
    float _933 = in.m_53.x;
    float _935 = in.m_53.y;
    float _937 = in.m_53.z;
    bool _939 = _152 != 0.0;
    bool _941 = isnan(_152);
    bool _943 = _939 || _941;
    bool _945 = isnan(0.0);
    bool _947 = _943 || _945;
    float _949 = _814 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _951 = in.m_55.w;
    bool _953 = _150 == 0.0;
    bool _955 = !_947;
    bool _957 = _953 && _955;
    float _959 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[6].x, _949);
    out.m_57.x = _470;
    out.m_57.y = _468;
    out.m_57.z = _472;
    bool _961 = _154 == 0.0;
    bool _963 = _961 && _957;
    float _965 = _808 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _967 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[6].z, _959);
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _971 = exp2(_965);
    float _973 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[6].w, _967);
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _979 = _973 + _854;
    float _981 = _975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _983 = _935;
    float _985 = _933;
    float _987 = _937;
    if (!_963)
    {
        float _989 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _935);
        _983 = _989;
    }
    float _991 = _983;
    if (!_963)
    {
        float _993 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[17].y, _933);
        _985 = _993;
    }
    float _995 = _985;
    if (!_963)
    {
        float _997 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[17].y, _937);
        _987 = _997;
    }
    float _999 = _987;
    float _1001 = _991 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1003 = _991 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1005 = _991 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1007 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1001);
    float _1009 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1003);
    float _1011 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1005);
    float _1013 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1007);
    float _1015 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1009);
    float _1017 = _536 * _596;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1025 = _1017 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1027 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1031 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1033 = _1025 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1035 = -_971;
    float _1037 = _1035 + 1.0;
    bool _1039 = _536 > 0.0;
    bool _1041 = isnan(_536);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan(0.0);
    bool _1047 = _1043 || _1045;
    float _1049 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1011);
    out.m_59.x = _1027;
    out.m_59.y = _1029;
    out.m_59.z = _1031;
    out.m_59.w = _969;
    float _1051 = _977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1053 = _596 <= 0.0;
    bool _1055 = !_1047;
    bool _1057 = _1053 || _1055;
    float _1059 = _979 * 0.5;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_61.x = _1013;
    out.m_61.y = _1015;
    out.m_61.z = _1049;
    float _1063 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.w = _951;
    float _1065 = _1037 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_65.x = _981;
    out.m_65.y = _1063;
    out.m_65.z = _1051;
    out.m_45.x = _1033;
    out.gl_Position.x = _876;
    out.gl_Position.y = _880;
    out.gl_Position.z = _973;
    out.gl_Position.w = _854;
    out.m_67.z = _1059;
    out.m_67.w = _854;
    float _1067 = _1065 * _906;
    float _1069 = -_1065;
    float _1071 = _1069 + 1.0;
    float _1073 = _921 * _1067;
    float _1075 = _921 * _1071;
    float _1077 = _931 * _1067;
    float _1079 = fma(_927, _1073, _915);
    float _1081 = fma(_929, _1073, _917);
    float _1083 = fma(_921, _1077, _919);
    out.m_69.x = _1079;
    out.m_69.y = _1081;
    out.m_69.z = _1083;
    out.m_69.w = _1075;
    if (!_1057)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1085 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1085;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

