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
    float4 m_69 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_87 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_79 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 m_81 [[user(locn13)]];
    float4 m_89 [[user(locn14)]];
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1551 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    float _120 = _118;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _122 = 0;
    if (!_112)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1918 = as_type<float>(_126);
        out.gl_Position.z = _1918;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_49.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_140)
    {
        float _146 = float(_108);
        _120 = _146;
    }
    float _148 = _120;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_47.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _128 = as_type<int>(_158);
    }
    int _160 = _128;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1986 = as_type<float>(_160);
        out.gl_Position.z = _1986;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_51.w;
    float _164 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_49.x;
    float _178 = in.m_49.y;
    float _180 = in.m_49.z;
    float _182 = in.m_44.x;
    float _184 = in.m_44.y;
    float _186 = in.m_44.z;
    float _188 = 0.0;
    float _190 = _164;
    if (!_174)
    {
        float _192 = _164 * _164;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = exp2(_218);
        float _222 = _216 * 0.693147182464599609375;
        float _224 = 1.0 / _222;
        float _226 = 1.0 / _214;
        float _228 = _220 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _224, _164);
        float _234 = _232 * _226;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_174;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _164 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    float _264 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _270 = in.m_53.x;
    float _272 = in.m_53.y;
    float _274 = in.m_53.z;
    float _276 = fma(_262, _178, _264);
    float _278 = fma(_262, _176, _266);
    float _280 = fma(_262, _180, _268);
    float _282 = fma(_276, _162, _184);
    float _284 = fma(_278, _162, _182);
    float _286 = fma(_280, _162, _186);
    float _288 = _282 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _290 = _282 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _292 = _282 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _294 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].x, _288);
    float _296 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].x, _290);
    float _298 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].x, _292);
    float _300 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].z, _294);
    float _302 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].z, _296);
    float _304 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].z, _298);
    float _306 = _300 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _308 = _302 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _310 = _304 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _312 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _314 = _306 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _318 = _308 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _322 = _310 + _320;
    float _324 = _314 * _314;
    float _326 = fma(_318, _318, _324);
    float _328 = fma(_322, _322, _326);
    float _330 = rsqrt(_328);
    float _332 = _314 * _330;
    float _334 = _318 * _330;
    float _336 = _322 * _330;
    float _338 = -_332;
    float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _314);
    float _342 = -_334;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[18].w, _318);
    float _346 = -_336;
    float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[18].w, _322);
    float _350 = _340 * _340;
    float _352 = in.m_51.x;
    float _354 = in.m_51.y;
    float _356 = in.m_51.z;
    float _358 = fma(_344, _344, _350);
    float _360 = fma(_348, _348, _358);
    float _362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _270);
    float _364 = sqrt(_360);
    float _366 = _354 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _368 = _352 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _370 = _330 * _364;
    float _372 = _356 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _374 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _376 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _272);
    float _378 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _380 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _382 = _374 * _370;
    float _384 = _378 * _370;
    float _386 = _380 * _370;
    float _388 = _382 * _376;
    float _390 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _274);
    float _392 = _384 * _362;
    float _394 = _388 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _396 = _386 * _390;
    float _398 = _388 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _400 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[10].x, _394);
    float _402 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[8].x, _398);
    float _404 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[10].z, _400);
    float _406 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[8].z, _402);
    float _408 = _310 + _404;
    float _410 = _308 + _406;
    float _412 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _414 = _408 + _412;
    float _416 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _418 = _410 + _416;
    float _420 = _414 * _414;
    float _422 = fma(_418, _418, _420);
    float _424 = _388 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _426 = sqrt(_422);
    float _428 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[9].x, _424);
    float _430 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[9].z, _428);
    float _432 = _306 + _430;
    bool _434 = _426 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _436 = _392;
    float _438 = _410;
    float _440 = _396;
    float _442 = _408;
    float _444 = _414;
    if (!_434)
    {
        _436 = _410;
    }
    float _446 = _436;
    float _448 = _446;
    if (!_434)
    {
        _438 = _408;
    }
    float _450 = _438;
    float _452 = _450;
    if (!_434)
    {
        _440 = _432;
    }
    float _454 = _440;
    bool _456 = !_434;
    float _458 = _454;
    if (!_456)
    {
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _462 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _464 = _426 + _462;
        float _466 = _432 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _468 = rsqrt(_422);
        float _470 = _464 * _460;
        float _472 = _470 * 0.15915493667125701904296875;
        float _474 = _472 * 6.283185482025146484375;
        float _476 = sin(_474);
        float _478 = _472 * 6.283185482025146484375;
        float _480 = cos(_478);
        float _482 = fma(_476, _466, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _484 = _468 * _482;
        float _486 = _480 + (-1.0);
        float _488 = fma(_418, _484, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _490 = fma(_414, _484, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _492 = _486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _494 = fma(_432, _480, _492);
        _458 = _494;
        _448 = _488;
        _452 = _490;
        _442 = _472;
    }
    float _496 = _458;
    float _498 = _448;
    float _500 = _452;
    float _502 = _442;
    float _504 = -_332;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _508 = -_334;
    float _510 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[18].w, _498);
    float _512 = -_336;
    float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _500);
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _518 = _506 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _522 = _510 + _520;
    float _524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _526 = _514 + _524;
    float _528 = _518 * _518;
    float _530 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _532 = fma(_522, _522, _528);
    float _534 = fma(_526, _526, _532);
    float _536 = rsqrt(_534);
    float _538 = sqrt(_534);
    float _540 = _522 * _536;
    float _542 = _526 * _536;
    float _544 = _518 * _536;
    float _546 = _540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _548 = _542 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _550 = _546 * _546;
    float _552 = _548 * _548;
    float _554 = _550 + _552;
    float _556 = sqrt(_554);
    bool _558 = _556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _560 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _562 = _556 + _560;
    float _564 = _498;
    float _566 = _502;
    float _568 = _562;
    if (_558)
    {
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _564 = _570;
    }
    float _572 = _564;
    if (_558)
    {
        float _574 = rsqrt(_554);
        _566 = _574;
    }
    float _576 = _566;
    float _578 = _576;
    if (_558)
    {
        float _580 = _562 * _572;
        _568 = _580;
    }
    float _582 = _568;
    if (_558)
    {
        float _584 = _582 * 0.15915493667125701904296875;
        _444 = _584;
    }
    float _586 = _444;
    float _588 = _572;
    float _590 = _586;
    if (_558)
    {
        float _592 = _586 * 6.283185482025146484375;
        float _594 = sin(_592);
        _588 = _594;
    }
    float _596 = _588;
    float _598 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _600 = precise::max(0.0, _598);
    float _602 = _432;
    float _604 = _598;
    float _606 = _600;
    if (_558)
    {
        float _608 = _586 * 6.283185482025146484375;
        float _610 = cos(_608);
        _602 = _610;
    }
    float _612 = _602;
    float _614 = -_544;
    float _616 = -_600;
    float _618 = fma(_614, (*spvDescriptorSet0.vp_c15)._m0[24].y, _616);
    if (_558)
    {
        float _620 = _618 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _604 = _620;
    }
    float _622 = _604;
    float _624 = _596;
    float _626 = _622;
    if (_558)
    {
        float _628 = fma(_596, _622, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _624 = _628;
    }
    float _630 = _624;
    float _632 = _630;
    if (!_558)
    {
        _626 = _546;
    }
    float _634 = _626;
    float _636 = _634;
    float _638 = _612;
    if (_558)
    {
        float _640 = _612 + (-1.0);
        _606 = _640;
    }
    float _642 = _606;
    float _644 = 0.0;
    float _646 = _642;
    if (_558)
    {
        float _648 = _576 * _630;
        _644 = _648;
    }
    float _650 = _644;
    if (!_558)
    {
        _632 = _618;
    }
    float _652 = _632;
    float _654 = _652;
    if (_558)
    {
        float _656 = _642 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _656;
    }
    float _658 = _590;
    if (_558)
    {
        float _660 = _546 * _650;
        _636 = _660;
    }
    float _662 = _636;
    if (!_558)
    {
        _646 = _548;
    }
    float _664 = _646;
    float _666 = _664;
    if (_558)
    {
        float _668 = _548 * _650;
        _666 = _668;
    }
    float _670 = _666;
    if (!_558)
    {
        _578 = _550;
    }
    float _672 = _578;
    float _674 = _672;
    if (_558)
    {
        float _676 = fma(_618, _612, _658);
        _654 = _676;
    }
    float _678 = _654;
    if (_558)
    {
        float _680 = _662 * _662;
        _674 = _680;
    }
    float _682 = _674;
    if (!_558)
    {
        _638 = _552;
    }
    float _684 = _638;
    float _686 = _684;
    if (_558)
    {
        float _688 = _670 * _670;
        _686 = _688;
    }
    float _690 = _686;
    float _692 = _506 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _694 = fma(_678, _678, _682);
    float _696 = _506 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _698 = _506 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _700 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[3].x, _692);
    float _702 = _694 + _690;
    float _704 = _506 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _706 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[1].x, _696);
    float _708 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[2].x, _698);
    float _710 = rsqrt(_702);
    float _712 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _714 = fma(_538, (*spvDescriptorSet0.vp_c15)._m0[23].w, _712);
    float _716 = precise::clamp(_714, 0.0, 1.0);
    float _718 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[0].x, _704);
    float _720 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[1].z, _706);
    float _722 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[2].z, _708);
    float _724 = -_716;
    float _726 = _724 + 1.0;
    float _728 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[0].z, _718);
    float _730 = _720 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _732 = _722 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _734 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[3].z, _700);
    float _736 = _728 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _738 = abs(_726);
    float _740 = log2(_738);
    float _742 = _730 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _744 = _732 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _746 = _734 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _748 = _710 * _662;
    float _750 = _710 * _678;
    float _752 = _710 * _670;
    float _754 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[7].x, _742);
    float _756 = _748 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _758 = -_744;
    float _760 = fma(_758, _530, 1.0);
    float _762 = _730 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _764 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _754);
    float _766 = -_756;
    float _768 = fma(_750, (*spvDescriptorSet0.vp_c15)._m0[21].y, _766);
    float _770 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[5].x, _762);
    float _772 = _740 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _774 = -_752;
    float _776 = fma(_774, (*spvDescriptorSet0.vp_c15)._m0[21].z, _768);
    float _778 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[7].w, _764);
    float _780 = log2(_760);
    float _782 = _730 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _784 = fma(_776, -0.5, 0.5);
    float _786 = fma(_776, 0.5, 0.5);
    float _788 = _750 + 1.0;
    float _790 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[4].x, _782);
    float _792 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _770);
    float _794 = fma(_786, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _796 = exp2(_772);
    float _798 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _790);
    float _800 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[5].w, _792);
    float _802 = fma(_786, _794, -0.212114393711090087890625);
    float _804 = fma(_786, _802, 1.570728778839111328125);
    float _806 = 1.0 / _778;
    float _808 = sqrt(_784);
    float _810 = -_750;
    float _812 = fma(_796, _788, _810);
    float _814 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[4].w, _798);
    float _816 = _780 * 0.693147182464599609375;
    float _818 = fma(_812, 0.5, 0.5);
    float _820 = _816 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _822 = _814 * _806;
    float _824 = _800 * _806;
    float _826 = fma(_822, 0.5, 0.5);
    float _828 = fma(_824, -0.5, 0.5);
    float _830 = _808 * 0.636619746685028076171875;
    float _832 = -_804;
    float _834 = fma(_830, _832, 1.0);
    float3 _3102 = float3(_826, _828, _820);
    float _836 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3102, float3(0.0), isnan(_3102)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3102, float3(0.0), isnan(_3102)), level(0.0)).x;
    float3 _3113 = float3(_826, _828, _820);
    float4 _839 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3113, float3(0.0), isnan(_3113)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3113, float3(0.0), isnan(_3113)), level(0.0)).xyzw;
    float _841 = _839.x;
    float _843 = _839.y;
    float _845 = _839.z;
    float _847 = _839.w;
    float2 _3130 = float2(_834, _818);
    float3 _851 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3130, float2(0.0), isnan(_3130)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3130, float2(0.0), isnan(_3130)), level(0.0)).xyz;
    float _853 = _851.x;
    float _855 = _851.y;
    float _857 = _851.z;
    float _859 = in.m_55.y;
    float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _863 = in.m_57.y;
    int _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _867 = _865 != 0;
    float _869 = -_332;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _306);
    float _873 = in.m_57.z;
    int _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _877 = _875 != 0;
    float _879 = -_334;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[18].w, _308);
    int _883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _885 = _883 != 0;
    float _887 = in.m_57.w;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _891 = _889 != 0;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _895 = in.m_57.x;
    float _897 = _861 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _903 = -_859;
    float _905 = _903 + 1.0;
    out.m_59.y = _859;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _911 = _863 > 0.5;
    float _913 = _863 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _915 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[78].w, _907);
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _919 = _873 > 0.5;
    float _921 = fma(_913, -2.0, _899);
    float _923 = _911 ? _905 : _859;
    float _925 = -_336;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _310);
    int _929 = _919 ? as_type<int>(_905) : as_type<int>(_859);
    float _931 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _921);
    bool _933 = _887 > 0.5;
    float _935 = _730 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _937 = _895 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _939 = _885 ? _923 : _859;
    float _941 = _891 ? as_type<float>(_929) : _859;
    float _943 = -_893;
    float _945 = fma(_937, 2.0, _943);
    float _947 = _859;
    float _949 = _923;
    float _951 = _873;
    bool _953 = _877;
    float _955 = _863;
    float _957 = _778;
    float _959 = _800;
    float _961 = _814;
    if (_867)
    {
        float _963 = _933 ? _905 : _859;
        _947 = _963;
    }
    float _965 = _947;
    float _967 = fma(_897, _939, -0.5);
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _971 = _969 != 0;
    float _973 = in.m_61.x;
    float _975 = in.m_61.y;
    float _977 = in.m_61.z;
    bool _979 = _272 != 0.0;
    bool _981 = isnan(_272);
    bool _983 = _979 || _981;
    bool _985 = isnan(0.0);
    bool _987 = _983 || _985;
    float _989 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _993 = _991 != 0;
    float _995 = -_144;
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[76].x, _945);
    int _999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1001 = _999 != 0;
    float _1003 = _941 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1005 = in.m_55.x;
    bool _1007 = _270 == 0.0;
    bool _1009 = !_987;
    bool _1011 = _1007 && _1009;
    float _1013 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[6].x, _935);
    float _1015 = _973;
    float _1017 = _975;
    float _1019 = _977;
    int _1021 = as_type<int>(_967);
    float _1023 = _1003;
    if (!_877)
    {
        _949 = _863;
    }
    float _1025 = _949;
    float _1027 = 0.0;
    float _1029 = _1025;
    if (!_877)
    {
        _1027 = _873;
    }
    float _1031 = _1027;
    float _1033 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1013);
    float _1035 = _1031;
    if (_877)
    {
        _1029 = _895;
    }
    float _1037 = _1029;
    float _1039 = _778 * 0.5;
    if (_877)
    {
        _951 = _863;
    }
    float _1041 = _951;
    float _1043 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1033);
    float _1045 = _1041;
    float _1047 = _1043;
    if (_877)
    {
        _1035 = _863;
    }
    float _1049 = _1035;
    bool _1051 = _274 == 0.0;
    bool _1053 = _1051 && _1011;
    float _1055 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_971)
    {
        bool _1057 = _895 > 0.5;
        _953 = _1057;
    }
    bool _1059 = _953;
    float _1061 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[78].z, _901);
    float _1063 = fma(_1055, -2.0, _917);
    float _1065 = _1043 + _778;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1069 = _1005;
    if (!_993)
    {
        _1045 = _1005;
    }
    float _1071 = _1045;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1075 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1067);
    float _1077 = _1071;
    if (!_1053)
    {
        float _1079 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[17].y, _973);
        _1015 = _1079;
    }
    float _1081 = _1015;
    float _1083 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _915);
    int _1085 = as_type<int>(_1083);
    if (!_1053)
    {
        float _1087 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[17].y, _975);
        _1017 = _1087;
    }
    float _1089 = _1017;
    float _1091 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[83].z, _909);
    float _1093 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1097 = -_931;
    float _1099 = fma(_1083, _967, _1097);
    float _1101 = _989 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1103 = as_type<int>(_989);
    if (_993)
    {
        float _1105 = -_1005;
        float _1107 = _1105 + 1.0;
        _1103 = as_type<int>(_1107);
    }
    int _1109 = _1103;
    float _1111 = -_1095;
    float _1113 = fma(_1093, 2.0, _1111);
    if (!_1053)
    {
        float _1115 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[17].y, _977);
        _1019 = _1115;
    }
    float _1117 = _1019;
    float _1119 = fma(_1101, _965, -0.5);
    float _1121 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1061);
    if (_993)
    {
        float _1123 = _919 ? as_type<float>(_1109) : _1005;
        _1077 = _1123;
    }
    float _1125 = _1077;
    float _1127 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1091);
    float _1129 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1075);
    float _1131 = -_144;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1113);
    float _1135 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1063);
    float _1137 = _871 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_971)
    {
        float _1139 = -_1005;
        float _1141 = _1139 + 1.0;
        _1085 = as_type<int>(_1141);
    }
    int _1143 = _1085;
    float _1145 = _871 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1147 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1149 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1151 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1153 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1137);
    if (!_971)
    {
        _955 = _1005;
    }
    float _1155 = _955;
    float _1157 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1145);
    float _1159 = _1155;
    if (_971)
    {
        float _1161 = _1059 ? as_type<float>(_1143) : _1005;
        _1159 = _1161;
    }
    float _1163 = _1159;
    float _1165 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1147);
    float _1167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1169 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1149);
    float _1171 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1151);
    float _1173 = -_1135;
    float _1175 = fma(_1129, _1119, _1173);
    float _1177 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1157);
    if (_1001)
    {
        float _1179 = -_1005;
        float _1181 = _1179 + 1.0;
        _1021 = as_type<int>(_1181);
    }
    int _1183 = _1021;
    float _1185 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1153);
    float _1187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1189 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1191 = in.m_63.w;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (_1001)
    {
        float _1195 = _911 ? as_type<float>(_1183) : _1005;
        _1069 = _1195;
    }
    float _1197 = _1069;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1201 = 1.0 / _1189;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1207 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1211 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1213 = _1203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1215 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1219 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1221 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1223 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1225 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1227 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1229 = fma(_1215, _1125, -0.5);
    float _1231 = _1223 + _1189;
    float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1235 = _1197 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    out.m_65.x = _1221;
    out.m_65.y = _1225;
    out.m_65.z = _1227;
    float _1237 = fma(_1207, _1163, -0.5);
    float _1239 = fma(_1127, _1229, _1133);
    float _1241 = _1231 * _1201;
    float _1243 = _1241 * 0.5;
    out.m_67.w = _1191;
    float _1245 = fma(_1121, _1237, _997);
    float _1247 = _1235 * _1217;
    bool _1249 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1251 = isnan(0.5);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1257 = _1253 || _1255;
    out.m_69.x = _1211;
    out.m_69.y = _1219;
    out.m_69.z = _1213;
    float _1259 = fma(_1117, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1165);
    float _1261 = _740 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1263 = _1003 * _1233;
    float _1265 = _1175 + 0.5;
    float _1267 = fma(_1117, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1169);
    float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1271 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1269);
    float _1273 = fma(_1117, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1171);
    out.m_71.x = _1247;
    out.m_71.y = _1263;
    float _1275 = _1245 + 0.5;
    float _1277 = _1099 + 0.5;
    float _1279 = exp2(_1261);
    float _1281 = _1239 + 0.5;
    float _1283 = _1227;
    if (_1257)
    {
        _1023 = 1.0;
    }
    float _1285 = _1023;
    float _1287 = _1285;
    if (_1257)
    {
        _1283 = 1.0;
    }
    float _1289 = _1283;
    out.m_73.x = _1275;
    out.m_73.y = _1277;
    out.m_73.z = _1281;
    out.m_73.w = _1265;
    float _1291 = 1.0 / _1271;
    float _1293 = _814 + _778;
    float _1295 = _1065 * 0.5;
    float _1297 = _1293 * 0.5;
    float _1299 = fma(_800, -0.5, _1039);
    float _1301 = -_1279;
    float _1303 = _1301 + 1.0;
    float _1305 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1307 = _1291 * _1305;
    float _1309 = _1289;
    float _1311 = _1297;
    if (!_1257)
    {
        float _1313 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1315 = _1313 * 0.15915493667125701904296875;
        float _1317 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1319 = _1315 * 6.283185482025146484375;
        float _1321 = cos(_1319);
        float _1323 = _1317 * 0.15915493667125701904296875;
        float _1325 = _1315 * 6.283185482025146484375;
        float _1327 = sin(_1325);
        float _1329 = 1.0 / _1321;
        float _1331 = _1323 * 6.283185482025146484375;
        float _1333 = cos(_1331);
        float _1335 = _1327 * _1329;
        float _1337 = _1323 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        float _1341 = _1333 * _1335;
        float _1343 = 1.0 / _1341;
        float _1345 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1347 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1345;
        float _1349 = 1.0 / _1347;
        float _1351 = _1339 * _1343;
        float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1355 = fma(_1307, _1351, _1353);
        float _1357 = _1355 * _1349;
        float _1359 = precise::clamp(_1357, 0.0, 1.0);
        _1287 = _1359;
    }
    float _1361 = _1287;
    if (!_1257)
    {
        float _1363 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1365 = _1363 * 0.15915493667125701904296875;
        float _1367 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1369 = _1365 * 6.283185482025146484375;
        float _1371 = cos(_1369);
        float _1373 = _1367 * 0.15915493667125701904296875;
        float _1375 = _1365 * 6.283185482025146484375;
        float _1377 = sin(_1375);
        float _1379 = 1.0 / _1371;
        float _1381 = _1373 * 6.283185482025146484375;
        float _1383 = cos(_1381);
        float _1385 = _1377 * _1379;
        float _1387 = _1373 * 6.283185482025146484375;
        float _1389 = sin(_1387);
        float _1391 = _1383 * _1385;
        float _1393 = 1.0 / _1391;
        float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1397 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1395;
        float _1399 = 1.0 / _1397;
        float _1401 = _1389 * _1393;
        float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1405 = fma(_1307, _1401, _1403);
        float _1407 = _1405 * _1399;
        float _1409 = precise::clamp(_1407, 0.0, 1.0);
        float _1411 = -_1409;
        float _1413 = _1411 + 1.0;
        _1309 = _1413;
    }
    float _1415 = _1309;
    float _1417 = _1303 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.z = _1295;
    out.m_75.w = _778;
    bool _1419 = _538 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1421 = isnan(_538);
    bool _1423 = _1419 || _1421;
    bool _1425 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1427 = _1423 || _1425;
    float _1429 = _1417 * _836;
    float _1431 = -_1417;
    float _1433 = _1431 + 1.0;
    out.m_77.x = _1267;
    out.m_77.y = _1259;
    out.m_77.z = _1273;
    float _1435 = _847 * _1429;
    float _1437 = _857 * _1429;
    out.m_79.x = _510;
    out.m_79.y = _506;
    out.m_79.z = _514;
    float _1439 = fma(_853, _1435, _841);
    float _1441 = fma(_855, _1435, _843);
    float _1443 = _847 * _1433;
    float _1445 = fma(_847, _1437, _845);
    float _1447 = _1361 * _1415;
    out.gl_Position.x = _814;
    out.gl_Position.y = _800;
    out.gl_Position.z = _1043;
    out.gl_Position.w = _778;
    float _1449 = _1447 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_81.x = _1439;
    out.m_81.y = _1441;
    out.m_81.z = _1445;
    out.m_81.w = _1443;
    float _1451 = _1447;
    if (!_1427)
    {
        _1451 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1453 = _1451;
    out.m_83.x = _1297;
    out.m_83.y = _1299;
    out.m_83.z = _1295;
    out.m_83.w = _778;
    float _1455 = _1453;
    float _1457 = _1453;
    if (!_1427)
    {
        _957 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1459 = _957;
    float _1461 = _1459;
    float _1463 = _1459;
    if (!_1427)
    {
        _1047 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1465 = _1047;
    float _1467 = _1465;
    float _1469 = _1465;
    if (!_1427)
    {
        _959 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1471 = _959;
    float _1473 = _1471;
    float _1475 = _1471;
    if (!_1427)
    {
        _961 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1477 = _961;
    float _1479 = _1477;
    float _1481 = _1477;
    if (!_1427)
    {
        _1311 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1483 = _1311;
    bool _1485 = !_1427;
    float _1487 = _1483;
    float _1489 = _1483;
    if (!_1485)
    {
        bool _1491 = _538 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1493 = isnan(_538);
        bool _1495 = _1491 || _1493;
        bool _1497 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1499 = _1495 || _1497;
        if (!_1499)
        {
            float _1501 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1503 = _538 + _1501;
            float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1507 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1505;
            float _1509 = 1.0 / _1507;
            float _1511 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1513 = _1511 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1517 = _1515 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1519 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1521 = _1519 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1525 = _1523 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1527 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1529 = _1527 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1531 = _1503 * _1509;
            float _1533 = precise::clamp(_1531, 0.0, 1.0);
            float _1535 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1537 = _1535 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1539 = fma(_1533, _1513, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1541 = fma(_1533, _1537, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1543 = fma(_1533, _1517, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1545 = fma(_1533, _1521, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1547 = fma(_1533, _1525, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1549 = fma(_1533, _1529, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1463 = _1541;
            _1481 = _1547;
            _1489 = _1539;
            _1475 = _1545;
            _1469 = _1543;
            _1457 = _1549;
            _1551 = true;
        }
        else
        {
            bool _1553 = _538 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1555 = isnan(_538);
            bool _1557 = _1553 || _1555;
            bool _1559 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1561 = _1557 || _1559;
            if (!_1561)
            {
                _1487 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1563 = _1487;
            _1489 = _1563;
            if (!_1561)
            {
                _1461 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1565 = _1461;
            _1463 = _1565;
            if (!_1561)
            {
                _1467 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1567 = _1467;
            _1469 = _1567;
            if (!_1561)
            {
                _1473 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1569 = _1473;
            _1475 = _1569;
            if (!_1561)
            {
                _1479 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1571 = _1479;
            _1481 = _1571;
            if (!_1561)
            {
                _1455 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1573 = _1455;
            bool _1575 = !_1561;
            _1457 = _1573;
            if (!_1575)
            {
                bool _1577 = _538 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1579 = isnan(_538);
                bool _1581 = _1577 || _1579;
                bool _1583 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1585 = _1581 || _1583;
                if (!_1585)
                {
                    float _1587 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1589 = _538 + _1587;
                    float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1593 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1591;
                    float _1595 = 1.0 / _1593;
                    float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1599 = _1597 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1603 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1607 = _1605 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1611 = _1609 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1615 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1617 = _1589 * _1595;
                    float _1619 = precise::clamp(_1617, 0.0, 1.0);
                    float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1623 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1625 = fma(_1619, _1599, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1627 = fma(_1619, _1623, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1629 = fma(_1619, _1603, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1631 = fma(_1619, _1607, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1633 = fma(_1619, _1611, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1635 = fma(_1619, _1615, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1463 = _1627;
                    _1481 = _1633;
                    _1489 = _1625;
                    _1475 = _1631;
                    _1469 = _1629;
                    _1457 = _1635;
                    _1551 = true;
                }
                else
                {
                    _1463 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1481 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1489 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1475 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1469 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1457 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1551 = false;
    float _1637 = _1463;
    float _1639 = _1481;
    float _1641 = _1489;
    float _1643 = _1475;
    float _1645 = _1469;
    float _1647 = _1457;
    float _1649 = fma(_1259, -0.5, 0.5);
    float _1651 = precise::clamp(_1649, 0.0, 1.0);
    float _1653 = -_1637;
    float _1655 = _1653 + _1639;
    float _1657 = _1449 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1659 = -_1641;
    float _1661 = _1659 + _1643;
    float _1663 = fma(_1651, _1655, _1637);
    out.m_85.x = 0.0;
    float _1665 = -_1645;
    float _1667 = _1665 + _1647;
    float _1669 = fma(_1651, _1661, _1641);
    float _1671 = _1663 * 0.586610972881317138671875;
    out.m_47.x = _1657;
    bool _1673 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1675 = fma(_1651, _1667, _1645);
    float _1677 = fma(_1669, 0.298911988735198974609375, _1671);
    bool _1679 = _1361 > 0.0;
    bool _1681 = isnan(_1361);
    bool _1683 = _1679 || _1681;
    bool _1685 = isnan(0.0);
    bool _1687 = _1683 || _1685;
    float _1689 = fma(_1675, 0.114477999508380889892578125, _1677);
    out.m_87.x = 0.0;
    bool _1691 = _1415 <= 0.0;
    bool _1693 = !_1687;
    bool _1695 = _1691 || _1693;
    float _1697 = -_1689;
    float _1699 = _1669 + _1697;
    float _1701 = -_1689;
    float _1703 = _1663 + _1701;
    float _1705 = -_1689;
    float _1707 = _1675 + _1705;
    float _1709 = fma(_1699, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1689);
    float _1711 = fma(_1703, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1689);
    float _1713 = fma(_1707, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1689);
    bool _1715 = !_1673;
    if (!_1715)
    {
        float _1717 = -_506;
        float _1719 = _1717 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1721 = -_510;
        float _1723 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1725 = -_514;
        float _1727 = _1725 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1729 = _1719 * _1719;
        float _1731 = fma(_1723, _1723, _1729);
        float _1733 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _1735 = precise::clamp(_1733, 0.0, 1.0);
        float _1737 = fma(_1727, _1727, _1731);
        float _1739 = _1735 * _1735;
        float _1741 = rsqrt(_1737);
        float _1743 = _1739 + (-1.0);
        float _1745 = _1719 * _1741;
        float _1747 = _1723 * _1741;
        float _1749 = _1727 * _1741;
        float _1751 = sqrt(_1737);
        float _1753 = -_544;
        float _1755 = _1753 + _1745;
        float _1757 = -_540;
        float _1759 = _1757 + _1747;
        float _1761 = -_542;
        float _1763 = _1761 + _1749;
        float _1765 = _1755 * _1755;
        float _1767 = fma(_1759, _1759, _1765);
        float _1769 = fma(_1763, _1763, _1767);
        float _1771 = -_1751;
        float _1773 = _1771 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1775 = rsqrt(_1769);
        float _1777 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1779 = precise::clamp(_1777, 0.0, 1.0);
        float _1781 = abs(_1779);
        float _1783 = log2(_1781);
        float _1785 = _1747 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1787 = _1755 * _1775;
        float _1789 = _1759 * _1775;
        float _1791 = _1763 * _1775;
        float _1793 = _1259 * _1787;
        float _1795 = fma(_1267, _1789, _1793);
        float _1797 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1799 = fma(_1273, _1791, _1795);
        float _1801 = precise::clamp(_1799, 0.0, 1.0);
        float _1803 = exp2(_1797);
        float _1805 = _1801 * _1801;
        float _1807 = fma(_1805, _1743, 1.0);
        float _1809 = -_1745;
        float _1811 = -_1785;
        float _1813 = fma(_1809, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1811);
        float _1815 = _1259 * _1745;
        float _1817 = _1807 * _1807;
        float _1819 = -_1749;
        float _1821 = fma(_1819, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1813);
        float _1823 = fma(_1267, _1747, _1815);
        float _1825 = 1.0 / _1817;
        float _1827 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1829 = _1821 + _1827;
        float _1831 = fma(_1273, _1749, _1823);
        float _1833 = precise::clamp(_1831, 0.0, 1.0);
        float _1835 = _1829 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1837 = precise::clamp(_1835, 0.0, 1.0);
        float _1839 = _1803 * _1837;
        float _1841 = _1833 * _1839;
        float _1843 = _1739 * _1825;
        float _1845 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1847 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1849 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _1851 = _1841 * _1843;
        float _1853 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1855 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1857 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _1845;
        out.m_85.y = _1847;
        out.m_85.z = _1849;
        out.m_87.x = _1853;
        out.m_87.y = _1855;
        out.m_87.z = _1857;
    }
    out.m_89.x = _1709;
    out.m_89.y = _1711;
    out.m_89.z = _1713;
    if (!_1695)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1859 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1859;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1551 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    float _120 = _118;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _122 = 0;
    if (!_112)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1918 = as_type<float>(_126);
        out.gl_Position.z = _1918;
    }
    if (!_112)
    {
        return out;
    }
    float _130 = in.m_49.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_140)
    {
        float _146 = float(_108);
        _120 = _146;
    }
    float _148 = _120;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_47.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _128 = as_type<int>(_158);
    }
    int _160 = _128;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1986 = as_type<float>(_160);
        out.gl_Position.z = _1986;
    }
    if (_154)
    {
        return out;
    }
    float _162 = in.m_51.w;
    float _164 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_49.x;
    float _178 = in.m_49.y;
    float _180 = in.m_49.z;
    float _182 = in.m_44.x;
    float _184 = in.m_44.y;
    float _186 = in.m_44.z;
    float _188 = 0.0;
    float _190 = _164;
    if (!_174)
    {
        float _192 = _164 * _164;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = exp2(_218);
        float _222 = _216 * 0.693147182464599609375;
        float _224 = 1.0 / _222;
        float _226 = 1.0 / _214;
        float _228 = _220 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _224, _164);
        float _234 = _232 * _226;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_174;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _164 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    float _264 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _270 = in.m_53.x;
    float _272 = in.m_53.y;
    float _274 = in.m_53.z;
    float _276 = fma(_262, _178, _264);
    float _278 = fma(_262, _176, _266);
    float _280 = fma(_262, _180, _268);
    float _282 = fma(_276, _162, _184);
    float _284 = fma(_278, _162, _182);
    float _286 = fma(_280, _162, _186);
    float _288 = _282 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _290 = _282 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _292 = _282 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _294 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].x, _288);
    float _296 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].x, _290);
    float _298 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].x, _292);
    float _300 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].z, _294);
    float _302 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].z, _296);
    float _304 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].z, _298);
    float _306 = _300 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _308 = _302 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _310 = _304 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _312 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _314 = _306 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _318 = _308 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _322 = _310 + _320;
    float _324 = _314 * _314;
    float _326 = fma(_318, _318, _324);
    float _328 = fma(_322, _322, _326);
    float _330 = rsqrt(_328);
    float _332 = _314 * _330;
    float _334 = _318 * _330;
    float _336 = _322 * _330;
    float _338 = -_332;
    float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _314);
    float _342 = -_334;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[18].w, _318);
    float _346 = -_336;
    float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[18].w, _322);
    float _350 = _340 * _340;
    float _352 = in.m_51.x;
    float _354 = in.m_51.y;
    float _356 = in.m_51.z;
    float _358 = fma(_344, _344, _350);
    float _360 = fma(_348, _348, _358);
    float _362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _270);
    float _364 = sqrt(_360);
    float _366 = _354 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _368 = _352 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _370 = _330 * _364;
    float _372 = _356 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _374 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _376 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _272);
    float _378 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _380 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _382 = _374 * _370;
    float _384 = _378 * _370;
    float _386 = _380 * _370;
    float _388 = _382 * _376;
    float _390 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _274);
    float _392 = _384 * _362;
    float _394 = _388 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _396 = _386 * _390;
    float _398 = _388 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _400 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[10].x, _394);
    float _402 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[8].x, _398);
    float _404 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[10].z, _400);
    float _406 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[8].z, _402);
    float _408 = _310 + _404;
    float _410 = _308 + _406;
    float _412 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _414 = _408 + _412;
    float _416 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _418 = _410 + _416;
    float _420 = _414 * _414;
    float _422 = fma(_418, _418, _420);
    float _424 = _388 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _426 = sqrt(_422);
    float _428 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[9].x, _424);
    float _430 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[9].z, _428);
    float _432 = _306 + _430;
    bool _434 = _426 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _436 = _392;
    float _438 = _410;
    float _440 = _396;
    float _442 = _408;
    float _444 = _414;
    if (!_434)
    {
        _436 = _410;
    }
    float _446 = _436;
    float _448 = _446;
    if (!_434)
    {
        _438 = _408;
    }
    float _450 = _438;
    float _452 = _450;
    if (!_434)
    {
        _440 = _432;
    }
    float _454 = _440;
    bool _456 = !_434;
    float _458 = _454;
    if (!_456)
    {
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _462 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _464 = _426 + _462;
        float _466 = _432 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _468 = rsqrt(_422);
        float _470 = _464 * _460;
        float _472 = _470 * 0.15915493667125701904296875;
        float _474 = _472 * 6.283185482025146484375;
        float _476 = sin(_474);
        float _478 = _472 * 6.283185482025146484375;
        float _480 = cos(_478);
        float _482 = fma(_476, _466, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _484 = _468 * _482;
        float _486 = _480 + (-1.0);
        float _488 = fma(_418, _484, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _490 = fma(_414, _484, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _492 = _486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _494 = fma(_432, _480, _492);
        _458 = _494;
        _448 = _488;
        _452 = _490;
        _442 = _472;
    }
    float _496 = _458;
    float _498 = _448;
    float _500 = _452;
    float _502 = _442;
    float _504 = -_332;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _508 = -_334;
    float _510 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[18].w, _498);
    float _512 = -_336;
    float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _500);
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _518 = _506 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _522 = _510 + _520;
    float _524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _526 = _514 + _524;
    float _528 = _518 * _518;
    float _530 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _532 = fma(_522, _522, _528);
    float _534 = fma(_526, _526, _532);
    float _536 = rsqrt(_534);
    float _538 = sqrt(_534);
    float _540 = _522 * _536;
    float _542 = _526 * _536;
    float _544 = _518 * _536;
    float _546 = _540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _548 = _542 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _550 = _546 * _546;
    float _552 = _548 * _548;
    float _554 = _550 + _552;
    float _556 = sqrt(_554);
    bool _558 = _556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _560 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _562 = _556 + _560;
    float _564 = _498;
    float _566 = _502;
    float _568 = _562;
    if (_558)
    {
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _564 = _570;
    }
    float _572 = _564;
    if (_558)
    {
        float _574 = rsqrt(_554);
        _566 = _574;
    }
    float _576 = _566;
    float _578 = _576;
    if (_558)
    {
        float _580 = _562 * _572;
        _568 = _580;
    }
    float _582 = _568;
    if (_558)
    {
        float _584 = _582 * 0.15915493667125701904296875;
        _444 = _584;
    }
    float _586 = _444;
    float _588 = _572;
    float _590 = _586;
    if (_558)
    {
        float _592 = _586 * 6.283185482025146484375;
        float _594 = sin(_592);
        _588 = _594;
    }
    float _596 = _588;
    float _598 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _600 = precise::max(0.0, _598);
    float _602 = _432;
    float _604 = _598;
    float _606 = _600;
    if (_558)
    {
        float _608 = _586 * 6.283185482025146484375;
        float _610 = cos(_608);
        _602 = _610;
    }
    float _612 = _602;
    float _614 = -_544;
    float _616 = -_600;
    float _618 = fma(_614, (*spvDescriptorSet0.vp_c15)._m0[24].y, _616);
    if (_558)
    {
        float _620 = _618 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _604 = _620;
    }
    float _622 = _604;
    float _624 = _596;
    float _626 = _622;
    if (_558)
    {
        float _628 = fma(_596, _622, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _624 = _628;
    }
    float _630 = _624;
    float _632 = _630;
    if (!_558)
    {
        _626 = _546;
    }
    float _634 = _626;
    float _636 = _634;
    float _638 = _612;
    if (_558)
    {
        float _640 = _612 + (-1.0);
        _606 = _640;
    }
    float _642 = _606;
    float _644 = 0.0;
    float _646 = _642;
    if (_558)
    {
        float _648 = _576 * _630;
        _644 = _648;
    }
    float _650 = _644;
    if (!_558)
    {
        _632 = _618;
    }
    float _652 = _632;
    float _654 = _652;
    if (_558)
    {
        float _656 = _642 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _656;
    }
    float _658 = _590;
    if (_558)
    {
        float _660 = _546 * _650;
        _636 = _660;
    }
    float _662 = _636;
    if (!_558)
    {
        _646 = _548;
    }
    float _664 = _646;
    float _666 = _664;
    if (_558)
    {
        float _668 = _548 * _650;
        _666 = _668;
    }
    float _670 = _666;
    if (!_558)
    {
        _578 = _550;
    }
    float _672 = _578;
    float _674 = _672;
    if (_558)
    {
        float _676 = fma(_618, _612, _658);
        _654 = _676;
    }
    float _678 = _654;
    if (_558)
    {
        float _680 = _662 * _662;
        _674 = _680;
    }
    float _682 = _674;
    if (!_558)
    {
        _638 = _552;
    }
    float _684 = _638;
    float _686 = _684;
    if (_558)
    {
        float _688 = _670 * _670;
        _686 = _688;
    }
    float _690 = _686;
    float _692 = _506 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _694 = fma(_678, _678, _682);
    float _696 = _506 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _698 = _506 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _700 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[3].x, _692);
    float _702 = _694 + _690;
    float _704 = _506 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _706 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[1].x, _696);
    float _708 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[2].x, _698);
    float _710 = rsqrt(_702);
    float _712 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _714 = fma(_538, (*spvDescriptorSet0.vp_c15)._m0[23].w, _712);
    float _716 = precise::clamp(_714, 0.0, 1.0);
    float _718 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[0].x, _704);
    float _720 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[1].z, _706);
    float _722 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[2].z, _708);
    float _724 = -_716;
    float _726 = _724 + 1.0;
    float _728 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[0].z, _718);
    float _730 = _720 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _732 = _722 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _734 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[3].z, _700);
    float _736 = _728 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _738 = abs(_726);
    float _740 = log2(_738);
    float _742 = _730 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _744 = _732 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _746 = _734 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _748 = _710 * _662;
    float _750 = _710 * _678;
    float _752 = _710 * _670;
    float _754 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[7].x, _742);
    float _756 = _748 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _758 = -_744;
    float _760 = fma(_758, _530, 1.0);
    float _762 = _730 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _764 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _754);
    float _766 = -_756;
    float _768 = fma(_750, (*spvDescriptorSet0.vp_c15)._m0[21].y, _766);
    float _770 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[5].x, _762);
    float _772 = _740 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _774 = -_752;
    float _776 = fma(_774, (*spvDescriptorSet0.vp_c15)._m0[21].z, _768);
    float _778 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[7].w, _764);
    float _780 = log2(_760);
    float _782 = _730 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _784 = fma(_776, -0.5, 0.5);
    float _786 = fma(_776, 0.5, 0.5);
    float _788 = _750 + 1.0;
    float _790 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[4].x, _782);
    float _792 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _770);
    float _794 = fma(_786, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _796 = exp2(_772);
    float _798 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _790);
    float _800 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[5].w, _792);
    float _802 = fma(_786, _794, -0.212114393711090087890625);
    float _804 = fma(_786, _802, 1.570728778839111328125);
    float _806 = 1.0 / _778;
    float _808 = sqrt(_784);
    float _810 = -_750;
    float _812 = fma(_796, _788, _810);
    float _814 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[4].w, _798);
    float _816 = _780 * 0.693147182464599609375;
    float _818 = fma(_812, 0.5, 0.5);
    float _820 = _816 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _822 = _814 * _806;
    float _824 = _800 * _806;
    float _826 = fma(_822, 0.5, 0.5);
    float _828 = fma(_824, -0.5, 0.5);
    float _830 = _808 * 0.636619746685028076171875;
    float _832 = -_804;
    float _834 = fma(_830, _832, 1.0);
    float3 _3102 = float3(_826, _828, _820);
    float _836 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3102, float3(0.0), isnan(_3102)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3102, float3(0.0), isnan(_3102)), level(0.0)).x;
    float3 _3113 = float3(_826, _828, _820);
    float4 _839 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3113, float3(0.0), isnan(_3113)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3113, float3(0.0), isnan(_3113)), level(0.0)).xyzw;
    float _841 = _839.x;
    float _843 = _839.y;
    float _845 = _839.z;
    float _847 = _839.w;
    float2 _3130 = float2(_834, _818);
    float3 _851 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3130, float2(0.0), isnan(_3130)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3130, float2(0.0), isnan(_3130)), level(0.0)).xyz;
    float _853 = _851.x;
    float _855 = _851.y;
    float _857 = _851.z;
    float _859 = in.m_55.y;
    float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _863 = in.m_57.y;
    int _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _867 = _865 != 0;
    float _869 = -_332;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _306);
    float _873 = in.m_57.z;
    int _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _877 = _875 != 0;
    float _879 = -_334;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[18].w, _308);
    int _883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _885 = _883 != 0;
    float _887 = in.m_57.w;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _891 = _889 != 0;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _895 = in.m_57.x;
    float _897 = _861 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _903 = -_859;
    float _905 = _903 + 1.0;
    out.m_59.y = _859;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _911 = _863 > 0.5;
    float _913 = _863 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _915 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[78].w, _907);
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _919 = _873 > 0.5;
    float _921 = fma(_913, -2.0, _899);
    float _923 = _911 ? _905 : _859;
    float _925 = -_336;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _310);
    int _929 = _919 ? as_type<int>(_905) : as_type<int>(_859);
    float _931 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _921);
    bool _933 = _887 > 0.5;
    float _935 = _730 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _937 = _895 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _939 = _885 ? _923 : _859;
    float _941 = _891 ? as_type<float>(_929) : _859;
    float _943 = -_893;
    float _945 = fma(_937, 2.0, _943);
    float _947 = _859;
    float _949 = _923;
    float _951 = _873;
    bool _953 = _877;
    float _955 = _863;
    float _957 = _778;
    float _959 = _800;
    float _961 = _814;
    if (_867)
    {
        float _963 = _933 ? _905 : _859;
        _947 = _963;
    }
    float _965 = _947;
    float _967 = fma(_897, _939, -0.5);
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _971 = _969 != 0;
    float _973 = in.m_61.x;
    float _975 = in.m_61.y;
    float _977 = in.m_61.z;
    bool _979 = _272 != 0.0;
    bool _981 = isnan(_272);
    bool _983 = _979 || _981;
    bool _985 = isnan(0.0);
    bool _987 = _983 || _985;
    float _989 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _993 = _991 != 0;
    float _995 = -_144;
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[76].x, _945);
    int _999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1001 = _999 != 0;
    float _1003 = _941 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1005 = in.m_55.x;
    bool _1007 = _270 == 0.0;
    bool _1009 = !_987;
    bool _1011 = _1007 && _1009;
    float _1013 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[6].x, _935);
    float _1015 = _973;
    float _1017 = _975;
    float _1019 = _977;
    int _1021 = as_type<int>(_967);
    float _1023 = _1003;
    if (!_877)
    {
        _949 = _863;
    }
    float _1025 = _949;
    float _1027 = 0.0;
    float _1029 = _1025;
    if (!_877)
    {
        _1027 = _873;
    }
    float _1031 = _1027;
    float _1033 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1013);
    float _1035 = _1031;
    if (_877)
    {
        _1029 = _895;
    }
    float _1037 = _1029;
    float _1039 = _778 * 0.5;
    if (_877)
    {
        _951 = _863;
    }
    float _1041 = _951;
    float _1043 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1033);
    float _1045 = _1041;
    float _1047 = _1043;
    if (_877)
    {
        _1035 = _863;
    }
    float _1049 = _1035;
    bool _1051 = _274 == 0.0;
    bool _1053 = _1051 && _1011;
    float _1055 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_971)
    {
        bool _1057 = _895 > 0.5;
        _953 = _1057;
    }
    bool _1059 = _953;
    float _1061 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[78].z, _901);
    float _1063 = fma(_1055, -2.0, _917);
    float _1065 = _1043 + _778;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1069 = _1005;
    if (!_993)
    {
        _1045 = _1005;
    }
    float _1071 = _1045;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1075 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1067);
    float _1077 = _1071;
    if (!_1053)
    {
        float _1079 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[17].y, _973);
        _1015 = _1079;
    }
    float _1081 = _1015;
    float _1083 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _915);
    int _1085 = as_type<int>(_1083);
    if (!_1053)
    {
        float _1087 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[17].y, _975);
        _1017 = _1087;
    }
    float _1089 = _1017;
    float _1091 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[83].z, _909);
    float _1093 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1097 = -_931;
    float _1099 = fma(_1083, _967, _1097);
    float _1101 = _989 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1103 = as_type<int>(_989);
    if (_993)
    {
        float _1105 = -_1005;
        float _1107 = _1105 + 1.0;
        _1103 = as_type<int>(_1107);
    }
    int _1109 = _1103;
    float _1111 = -_1095;
    float _1113 = fma(_1093, 2.0, _1111);
    if (!_1053)
    {
        float _1115 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[17].y, _977);
        _1019 = _1115;
    }
    float _1117 = _1019;
    float _1119 = fma(_1101, _965, -0.5);
    float _1121 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1061);
    if (_993)
    {
        float _1123 = _919 ? as_type<float>(_1109) : _1005;
        _1077 = _1123;
    }
    float _1125 = _1077;
    float _1127 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1091);
    float _1129 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1075);
    float _1131 = -_144;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1113);
    float _1135 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1063);
    float _1137 = _871 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_971)
    {
        float _1139 = -_1005;
        float _1141 = _1139 + 1.0;
        _1085 = as_type<int>(_1141);
    }
    int _1143 = _1085;
    float _1145 = _871 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1147 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1149 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1151 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1153 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1137);
    if (!_971)
    {
        _955 = _1005;
    }
    float _1155 = _955;
    float _1157 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1145);
    float _1159 = _1155;
    if (_971)
    {
        float _1161 = _1059 ? as_type<float>(_1143) : _1005;
        _1159 = _1161;
    }
    float _1163 = _1159;
    float _1165 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1147);
    float _1167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1169 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1149);
    float _1171 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1151);
    float _1173 = -_1135;
    float _1175 = fma(_1129, _1119, _1173);
    float _1177 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1157);
    if (_1001)
    {
        float _1179 = -_1005;
        float _1181 = _1179 + 1.0;
        _1021 = as_type<int>(_1181);
    }
    int _1183 = _1021;
    float _1185 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1153);
    float _1187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1189 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1191 = in.m_63.w;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (_1001)
    {
        float _1195 = _911 ? as_type<float>(_1183) : _1005;
        _1069 = _1195;
    }
    float _1197 = _1069;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1201 = 1.0 / _1189;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1207 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1211 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1213 = _1203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1215 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1219 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1221 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1223 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1225 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1227 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1229 = fma(_1215, _1125, -0.5);
    float _1231 = _1223 + _1189;
    float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1235 = _1197 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    out.m_65.x = _1221;
    out.m_65.y = _1225;
    out.m_65.z = _1227;
    float _1237 = fma(_1207, _1163, -0.5);
    float _1239 = fma(_1127, _1229, _1133);
    float _1241 = _1231 * _1201;
    float _1243 = _1241 * 0.5;
    out.m_67.w = _1191;
    float _1245 = fma(_1121, _1237, _997);
    float _1247 = _1235 * _1217;
    bool _1249 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1251 = isnan(0.5);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1257 = _1253 || _1255;
    out.m_69.x = _1211;
    out.m_69.y = _1219;
    out.m_69.z = _1213;
    float _1259 = fma(_1117, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1165);
    float _1261 = _740 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1263 = _1003 * _1233;
    float _1265 = _1175 + 0.5;
    float _1267 = fma(_1117, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1169);
    float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1271 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1269);
    float _1273 = fma(_1117, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1171);
    out.m_71.x = _1247;
    out.m_71.y = _1263;
    float _1275 = _1245 + 0.5;
    float _1277 = _1099 + 0.5;
    float _1279 = exp2(_1261);
    float _1281 = _1239 + 0.5;
    float _1283 = _1227;
    if (_1257)
    {
        _1023 = 1.0;
    }
    float _1285 = _1023;
    float _1287 = _1285;
    if (_1257)
    {
        _1283 = 1.0;
    }
    float _1289 = _1283;
    out.m_73.x = _1275;
    out.m_73.y = _1277;
    out.m_73.z = _1281;
    out.m_73.w = _1265;
    float _1291 = 1.0 / _1271;
    float _1293 = _814 + _778;
    float _1295 = _1065 * 0.5;
    float _1297 = _1293 * 0.5;
    float _1299 = fma(_800, -0.5, _1039);
    float _1301 = -_1279;
    float _1303 = _1301 + 1.0;
    float _1305 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1307 = _1291 * _1305;
    float _1309 = _1289;
    float _1311 = _1297;
    if (!_1257)
    {
        float _1313 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1315 = _1313 * 0.15915493667125701904296875;
        float _1317 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1319 = _1315 * 6.283185482025146484375;
        float _1321 = cos(_1319);
        float _1323 = _1317 * 0.15915493667125701904296875;
        float _1325 = _1315 * 6.283185482025146484375;
        float _1327 = sin(_1325);
        float _1329 = 1.0 / _1321;
        float _1331 = _1323 * 6.283185482025146484375;
        float _1333 = cos(_1331);
        float _1335 = _1327 * _1329;
        float _1337 = _1323 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        float _1341 = _1333 * _1335;
        float _1343 = 1.0 / _1341;
        float _1345 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1347 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1345;
        float _1349 = 1.0 / _1347;
        float _1351 = _1339 * _1343;
        float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1355 = fma(_1307, _1351, _1353);
        float _1357 = _1355 * _1349;
        float _1359 = precise::clamp(_1357, 0.0, 1.0);
        _1287 = _1359;
    }
    float _1361 = _1287;
    if (!_1257)
    {
        float _1363 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1365 = _1363 * 0.15915493667125701904296875;
        float _1367 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1369 = _1365 * 6.283185482025146484375;
        float _1371 = cos(_1369);
        float _1373 = _1367 * 0.15915493667125701904296875;
        float _1375 = _1365 * 6.283185482025146484375;
        float _1377 = sin(_1375);
        float _1379 = 1.0 / _1371;
        float _1381 = _1373 * 6.283185482025146484375;
        float _1383 = cos(_1381);
        float _1385 = _1377 * _1379;
        float _1387 = _1373 * 6.283185482025146484375;
        float _1389 = sin(_1387);
        float _1391 = _1383 * _1385;
        float _1393 = 1.0 / _1391;
        float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1397 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1395;
        float _1399 = 1.0 / _1397;
        float _1401 = _1389 * _1393;
        float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1405 = fma(_1307, _1401, _1403);
        float _1407 = _1405 * _1399;
        float _1409 = precise::clamp(_1407, 0.0, 1.0);
        float _1411 = -_1409;
        float _1413 = _1411 + 1.0;
        _1309 = _1413;
    }
    float _1415 = _1309;
    float _1417 = _1303 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.z = _1295;
    out.m_75.w = _778;
    bool _1419 = _538 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1421 = isnan(_538);
    bool _1423 = _1419 || _1421;
    bool _1425 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1427 = _1423 || _1425;
    float _1429 = _1417 * _836;
    float _1431 = -_1417;
    float _1433 = _1431 + 1.0;
    out.m_77.x = _1267;
    out.m_77.y = _1259;
    out.m_77.z = _1273;
    float _1435 = _847 * _1429;
    float _1437 = _857 * _1429;
    out.m_79.x = _510;
    out.m_79.y = _506;
    out.m_79.z = _514;
    float _1439 = fma(_853, _1435, _841);
    float _1441 = fma(_855, _1435, _843);
    float _1443 = _847 * _1433;
    float _1445 = fma(_847, _1437, _845);
    float _1447 = _1361 * _1415;
    out.gl_Position.x = _814;
    out.gl_Position.y = _800;
    out.gl_Position.z = _1043;
    out.gl_Position.w = _778;
    float _1449 = _1447 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_81.x = _1439;
    out.m_81.y = _1441;
    out.m_81.z = _1445;
    out.m_81.w = _1443;
    float _1451 = _1447;
    if (!_1427)
    {
        _1451 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1453 = _1451;
    out.m_83.x = _1297;
    out.m_83.y = _1299;
    out.m_83.z = _1295;
    out.m_83.w = _778;
    float _1455 = _1453;
    float _1457 = _1453;
    if (!_1427)
    {
        _957 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1459 = _957;
    float _1461 = _1459;
    float _1463 = _1459;
    if (!_1427)
    {
        _1047 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1465 = _1047;
    float _1467 = _1465;
    float _1469 = _1465;
    if (!_1427)
    {
        _959 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1471 = _959;
    float _1473 = _1471;
    float _1475 = _1471;
    if (!_1427)
    {
        _961 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1477 = _961;
    float _1479 = _1477;
    float _1481 = _1477;
    if (!_1427)
    {
        _1311 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1483 = _1311;
    bool _1485 = !_1427;
    float _1487 = _1483;
    float _1489 = _1483;
    if (!_1485)
    {
        bool _1491 = _538 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1493 = isnan(_538);
        bool _1495 = _1491 || _1493;
        bool _1497 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1499 = _1495 || _1497;
        if (!_1499)
        {
            float _1501 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1503 = _538 + _1501;
            float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1507 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1505;
            float _1509 = 1.0 / _1507;
            float _1511 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1513 = _1511 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1517 = _1515 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1519 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1521 = _1519 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1525 = _1523 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1527 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1529 = _1527 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1531 = _1503 * _1509;
            float _1533 = precise::clamp(_1531, 0.0, 1.0);
            float _1535 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1537 = _1535 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1539 = fma(_1533, _1513, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1541 = fma(_1533, _1537, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1543 = fma(_1533, _1517, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1545 = fma(_1533, _1521, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1547 = fma(_1533, _1525, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1549 = fma(_1533, _1529, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1463 = _1541;
            _1481 = _1547;
            _1489 = _1539;
            _1475 = _1545;
            _1469 = _1543;
            _1457 = _1549;
            _1551 = true;
        }
        else
        {
            bool _1553 = _538 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1555 = isnan(_538);
            bool _1557 = _1553 || _1555;
            bool _1559 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1561 = _1557 || _1559;
            if (!_1561)
            {
                _1487 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1563 = _1487;
            _1489 = _1563;
            if (!_1561)
            {
                _1461 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1565 = _1461;
            _1463 = _1565;
            if (!_1561)
            {
                _1467 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1567 = _1467;
            _1469 = _1567;
            if (!_1561)
            {
                _1473 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1569 = _1473;
            _1475 = _1569;
            if (!_1561)
            {
                _1479 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1571 = _1479;
            _1481 = _1571;
            if (!_1561)
            {
                _1455 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1573 = _1455;
            bool _1575 = !_1561;
            _1457 = _1573;
            if (!_1575)
            {
                bool _1577 = _538 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1579 = isnan(_538);
                bool _1581 = _1577 || _1579;
                bool _1583 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1585 = _1581 || _1583;
                if (!_1585)
                {
                    float _1587 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1589 = _538 + _1587;
                    float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1593 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1591;
                    float _1595 = 1.0 / _1593;
                    float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1599 = _1597 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1603 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1607 = _1605 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1611 = _1609 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1615 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1617 = _1589 * _1595;
                    float _1619 = precise::clamp(_1617, 0.0, 1.0);
                    float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1623 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1625 = fma(_1619, _1599, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1627 = fma(_1619, _1623, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1629 = fma(_1619, _1603, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1631 = fma(_1619, _1607, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1633 = fma(_1619, _1611, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1635 = fma(_1619, _1615, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1463 = _1627;
                    _1481 = _1633;
                    _1489 = _1625;
                    _1475 = _1631;
                    _1469 = _1629;
                    _1457 = _1635;
                    _1551 = true;
                }
                else
                {
                    _1463 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1481 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1489 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1475 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1469 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1457 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1551 = false;
    float _1637 = _1463;
    float _1639 = _1481;
    float _1641 = _1489;
    float _1643 = _1475;
    float _1645 = _1469;
    float _1647 = _1457;
    float _1649 = fma(_1259, -0.5, 0.5);
    float _1651 = precise::clamp(_1649, 0.0, 1.0);
    float _1653 = -_1637;
    float _1655 = _1653 + _1639;
    float _1657 = _1449 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1659 = -_1641;
    float _1661 = _1659 + _1643;
    float _1663 = fma(_1651, _1655, _1637);
    out.m_85.x = 0.0;
    float _1665 = -_1645;
    float _1667 = _1665 + _1647;
    float _1669 = fma(_1651, _1661, _1641);
    float _1671 = _1663 * 0.586610972881317138671875;
    out.m_47.x = _1657;
    bool _1673 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1675 = fma(_1651, _1667, _1645);
    float _1677 = fma(_1669, 0.298911988735198974609375, _1671);
    bool _1679 = _1361 > 0.0;
    bool _1681 = isnan(_1361);
    bool _1683 = _1679 || _1681;
    bool _1685 = isnan(0.0);
    bool _1687 = _1683 || _1685;
    float _1689 = fma(_1675, 0.114477999508380889892578125, _1677);
    out.m_87.x = 0.0;
    bool _1691 = _1415 <= 0.0;
    bool _1693 = !_1687;
    bool _1695 = _1691 || _1693;
    float _1697 = -_1689;
    float _1699 = _1669 + _1697;
    float _1701 = -_1689;
    float _1703 = _1663 + _1701;
    float _1705 = -_1689;
    float _1707 = _1675 + _1705;
    float _1709 = fma(_1699, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1689);
    float _1711 = fma(_1703, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1689);
    float _1713 = fma(_1707, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1689);
    bool _1715 = !_1673;
    if (!_1715)
    {
        float _1717 = -_506;
        float _1719 = _1717 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1721 = -_510;
        float _1723 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1725 = -_514;
        float _1727 = _1725 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1729 = _1719 * _1719;
        float _1731 = fma(_1723, _1723, _1729);
        float _1733 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _1735 = precise::clamp(_1733, 0.0, 1.0);
        float _1737 = fma(_1727, _1727, _1731);
        float _1739 = _1735 * _1735;
        float _1741 = rsqrt(_1737);
        float _1743 = _1739 + (-1.0);
        float _1745 = _1719 * _1741;
        float _1747 = _1723 * _1741;
        float _1749 = _1727 * _1741;
        float _1751 = sqrt(_1737);
        float _1753 = -_544;
        float _1755 = _1753 + _1745;
        float _1757 = -_540;
        float _1759 = _1757 + _1747;
        float _1761 = -_542;
        float _1763 = _1761 + _1749;
        float _1765 = _1755 * _1755;
        float _1767 = fma(_1759, _1759, _1765);
        float _1769 = fma(_1763, _1763, _1767);
        float _1771 = -_1751;
        float _1773 = _1771 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1775 = rsqrt(_1769);
        float _1777 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1779 = precise::clamp(_1777, 0.0, 1.0);
        float _1781 = abs(_1779);
        float _1783 = log2(_1781);
        float _1785 = _1747 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1787 = _1755 * _1775;
        float _1789 = _1759 * _1775;
        float _1791 = _1763 * _1775;
        float _1793 = _1259 * _1787;
        float _1795 = fma(_1267, _1789, _1793);
        float _1797 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1799 = fma(_1273, _1791, _1795);
        float _1801 = precise::clamp(_1799, 0.0, 1.0);
        float _1803 = exp2(_1797);
        float _1805 = _1801 * _1801;
        float _1807 = fma(_1805, _1743, 1.0);
        float _1809 = -_1745;
        float _1811 = -_1785;
        float _1813 = fma(_1809, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1811);
        float _1815 = _1259 * _1745;
        float _1817 = _1807 * _1807;
        float _1819 = -_1749;
        float _1821 = fma(_1819, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1813);
        float _1823 = fma(_1267, _1747, _1815);
        float _1825 = 1.0 / _1817;
        float _1827 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1829 = _1821 + _1827;
        float _1831 = fma(_1273, _1749, _1823);
        float _1833 = precise::clamp(_1831, 0.0, 1.0);
        float _1835 = _1829 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1837 = precise::clamp(_1835, 0.0, 1.0);
        float _1839 = _1803 * _1837;
        float _1841 = _1833 * _1839;
        float _1843 = _1739 * _1825;
        float _1845 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1847 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1849 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _1851 = _1841 * _1843;
        float _1853 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1855 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1857 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _1845;
        out.m_85.y = _1847;
        out.m_85.z = _1849;
        out.m_87.x = _1853;
        out.m_87.y = _1855;
        out.m_87.z = _1857;
    }
    out.m_89.x = _1709;
    out.m_89.y = _1711;
    out.m_89.z = _1713;
    if (!_1695)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1859 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1859;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1551 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    float _120 = _118;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _122 = 0;
    if (!_112)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1918 = as_type<float>(_126);
        out.gl_Position.z = _1918;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_49.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_140)
    {
        float _146 = float(_108);
        _120 = _146;
    }
    float _148 = _120;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_47.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _128 = as_type<int>(_158);
    }
    int _160 = _128;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1986 = as_type<float>(_160);
        out.gl_Position.z = _1986;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_51.w;
    float _164 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_49.x;
    float _178 = in.m_49.y;
    float _180 = in.m_49.z;
    float _182 = in.m_44.x;
    float _184 = in.m_44.y;
    float _186 = in.m_44.z;
    float _188 = 0.0;
    float _190 = _164;
    if (!_174)
    {
        float _192 = _164 * _164;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = exp2(_218);
        float _222 = _216 * 0.693147182464599609375;
        float _224 = 1.0 / _222;
        float _226 = 1.0 / _214;
        float _228 = _220 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _224, _164);
        float _234 = _232 * _226;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_174;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _164 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    float _264 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _270 = in.m_53.x;
    float _272 = in.m_53.y;
    float _274 = in.m_53.z;
    float _276 = fma(_262, _178, _264);
    float _278 = fma(_262, _176, _266);
    float _280 = fma(_262, _180, _268);
    float _282 = fma(_276, _162, _184);
    float _284 = fma(_278, _162, _182);
    float _286 = fma(_280, _162, _186);
    float _288 = _282 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _290 = _282 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _292 = _282 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _294 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].x, _288);
    float _296 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].x, _290);
    float _298 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].x, _292);
    float _300 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].z, _294);
    float _302 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].z, _296);
    float _304 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].z, _298);
    float _306 = _300 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _308 = _302 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _310 = _304 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _312 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _314 = _306 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _318 = _308 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _322 = _310 + _320;
    float _324 = _314 * _314;
    float _326 = fma(_318, _318, _324);
    float _328 = fma(_322, _322, _326);
    float _330 = rsqrt(_328);
    float _332 = _314 * _330;
    float _334 = _318 * _330;
    float _336 = _322 * _330;
    float _338 = -_332;
    float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _314);
    float _342 = -_334;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[18].w, _318);
    float _346 = -_336;
    float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[18].w, _322);
    float _350 = _340 * _340;
    float _352 = in.m_51.x;
    float _354 = in.m_51.y;
    float _356 = in.m_51.z;
    float _358 = fma(_344, _344, _350);
    float _360 = fma(_348, _348, _358);
    float _362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _270);
    float _364 = sqrt(_360);
    float _366 = _354 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _368 = _352 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _370 = _330 * _364;
    float _372 = _356 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _374 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _376 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _272);
    float _378 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _380 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _382 = _374 * _370;
    float _384 = _378 * _370;
    float _386 = _380 * _370;
    float _388 = _382 * _376;
    float _390 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _274);
    float _392 = _384 * _362;
    float _394 = _388 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _396 = _386 * _390;
    float _398 = _388 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _400 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[10].x, _394);
    float _402 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[8].x, _398);
    float _404 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[10].z, _400);
    float _406 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[8].z, _402);
    float _408 = _310 + _404;
    float _410 = _308 + _406;
    float _412 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _414 = _408 + _412;
    float _416 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _418 = _410 + _416;
    float _420 = _414 * _414;
    float _422 = fma(_418, _418, _420);
    float _424 = _388 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _426 = sqrt(_422);
    float _428 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[9].x, _424);
    float _430 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[9].z, _428);
    float _432 = _306 + _430;
    bool _434 = _426 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _436 = _392;
    float _438 = _410;
    float _440 = _396;
    float _442 = _408;
    float _444 = _414;
    if (!_434)
    {
        _436 = _410;
    }
    float _446 = _436;
    float _448 = _446;
    if (!_434)
    {
        _438 = _408;
    }
    float _450 = _438;
    float _452 = _450;
    if (!_434)
    {
        _440 = _432;
    }
    float _454 = _440;
    bool _456 = !_434;
    float _458 = _454;
    if (!_456)
    {
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _462 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _464 = _426 + _462;
        float _466 = _432 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _468 = rsqrt(_422);
        float _470 = _464 * _460;
        float _472 = _470 * 0.15915493667125701904296875;
        float _474 = _472 * 6.283185482025146484375;
        float _476 = sin(_474);
        float _478 = _472 * 6.283185482025146484375;
        float _480 = cos(_478);
        float _482 = fma(_476, _466, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _484 = _468 * _482;
        float _486 = _480 + (-1.0);
        float _488 = fma(_418, _484, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _490 = fma(_414, _484, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _492 = _486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _494 = fma(_432, _480, _492);
        _458 = _494;
        _448 = _488;
        _452 = _490;
        _442 = _472;
    }
    float _496 = _458;
    float _498 = _448;
    float _500 = _452;
    float _502 = _442;
    float _504 = -_332;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _508 = -_334;
    float _510 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[18].w, _498);
    float _512 = -_336;
    float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _500);
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _518 = _506 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _522 = _510 + _520;
    float _524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _526 = _514 + _524;
    float _528 = _518 * _518;
    float _530 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _532 = fma(_522, _522, _528);
    float _534 = fma(_526, _526, _532);
    float _536 = rsqrt(_534);
    float _538 = sqrt(_534);
    float _540 = _522 * _536;
    float _542 = _526 * _536;
    float _544 = _518 * _536;
    float _546 = _540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _548 = _542 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _550 = _546 * _546;
    float _552 = _548 * _548;
    float _554 = _550 + _552;
    float _556 = sqrt(_554);
    bool _558 = _556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _560 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _562 = _556 + _560;
    float _564 = _498;
    float _566 = _502;
    float _568 = _562;
    if (_558)
    {
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _564 = _570;
    }
    float _572 = _564;
    if (_558)
    {
        float _574 = rsqrt(_554);
        _566 = _574;
    }
    float _576 = _566;
    float _578 = _576;
    if (_558)
    {
        float _580 = _562 * _572;
        _568 = _580;
    }
    float _582 = _568;
    if (_558)
    {
        float _584 = _582 * 0.15915493667125701904296875;
        _444 = _584;
    }
    float _586 = _444;
    float _588 = _572;
    float _590 = _586;
    if (_558)
    {
        float _592 = _586 * 6.283185482025146484375;
        float _594 = sin(_592);
        _588 = _594;
    }
    float _596 = _588;
    float _598 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _600 = precise::max(0.0, _598);
    float _602 = _432;
    float _604 = _598;
    float _606 = _600;
    if (_558)
    {
        float _608 = _586 * 6.283185482025146484375;
        float _610 = cos(_608);
        _602 = _610;
    }
    float _612 = _602;
    float _614 = -_544;
    float _616 = -_600;
    float _618 = fma(_614, (*spvDescriptorSet0.vp_c15)._m0[24].y, _616);
    if (_558)
    {
        float _620 = _618 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _604 = _620;
    }
    float _622 = _604;
    float _624 = _596;
    float _626 = _622;
    if (_558)
    {
        float _628 = fma(_596, _622, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _624 = _628;
    }
    float _630 = _624;
    float _632 = _630;
    if (!_558)
    {
        _626 = _546;
    }
    float _634 = _626;
    float _636 = _634;
    float _638 = _612;
    if (_558)
    {
        float _640 = _612 + (-1.0);
        _606 = _640;
    }
    float _642 = _606;
    float _644 = 0.0;
    float _646 = _642;
    if (_558)
    {
        float _648 = _576 * _630;
        _644 = _648;
    }
    float _650 = _644;
    if (!_558)
    {
        _632 = _618;
    }
    float _652 = _632;
    float _654 = _652;
    if (_558)
    {
        float _656 = _642 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _656;
    }
    float _658 = _590;
    if (_558)
    {
        float _660 = _546 * _650;
        _636 = _660;
    }
    float _662 = _636;
    if (!_558)
    {
        _646 = _548;
    }
    float _664 = _646;
    float _666 = _664;
    if (_558)
    {
        float _668 = _548 * _650;
        _666 = _668;
    }
    float _670 = _666;
    if (!_558)
    {
        _578 = _550;
    }
    float _672 = _578;
    float _674 = _672;
    if (_558)
    {
        float _676 = fma(_618, _612, _658);
        _654 = _676;
    }
    float _678 = _654;
    if (_558)
    {
        float _680 = _662 * _662;
        _674 = _680;
    }
    float _682 = _674;
    if (!_558)
    {
        _638 = _552;
    }
    float _684 = _638;
    float _686 = _684;
    if (_558)
    {
        float _688 = _670 * _670;
        _686 = _688;
    }
    float _690 = _686;
    float _692 = _506 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _694 = fma(_678, _678, _682);
    float _696 = _506 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _698 = _506 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _700 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[3].x, _692);
    float _702 = _694 + _690;
    float _704 = _506 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _706 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[1].x, _696);
    float _708 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[2].x, _698);
    float _710 = rsqrt(_702);
    float _712 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _714 = fma(_538, (*spvDescriptorSet0.vp_c15)._m0[23].w, _712);
    float _716 = precise::clamp(_714, 0.0, 1.0);
    float _718 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[0].x, _704);
    float _720 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[1].z, _706);
    float _722 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[2].z, _708);
    float _724 = -_716;
    float _726 = _724 + 1.0;
    float _728 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[0].z, _718);
    float _730 = _720 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _732 = _722 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _734 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[3].z, _700);
    float _736 = _728 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _738 = abs(_726);
    float _740 = log2(_738);
    float _742 = _730 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _744 = _732 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _746 = _734 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _748 = _710 * _662;
    float _750 = _710 * _678;
    float _752 = _710 * _670;
    float _754 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[7].x, _742);
    float _756 = _748 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _758 = -_744;
    float _760 = fma(_758, _530, 1.0);
    float _762 = _730 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _764 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _754);
    float _766 = -_756;
    float _768 = fma(_750, (*spvDescriptorSet0.vp_c15)._m0[21].y, _766);
    float _770 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[5].x, _762);
    float _772 = _740 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _774 = -_752;
    float _776 = fma(_774, (*spvDescriptorSet0.vp_c15)._m0[21].z, _768);
    float _778 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[7].w, _764);
    float _780 = log2(_760);
    float _782 = _730 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _784 = fma(_776, -0.5, 0.5);
    float _786 = fma(_776, 0.5, 0.5);
    float _788 = _750 + 1.0;
    float _790 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[4].x, _782);
    float _792 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _770);
    float _794 = fma(_786, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _796 = exp2(_772);
    float _798 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _790);
    float _800 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[5].w, _792);
    float _802 = fma(_786, _794, -0.212114393711090087890625);
    float _804 = fma(_786, _802, 1.570728778839111328125);
    float _806 = 1.0 / _778;
    float _808 = sqrt(_784);
    float _810 = -_750;
    float _812 = fma(_796, _788, _810);
    float _814 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[4].w, _798);
    float _816 = _780 * 0.693147182464599609375;
    float _818 = fma(_812, 0.5, 0.5);
    float _820 = _816 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _822 = _814 * _806;
    float _824 = _800 * _806;
    float _826 = fma(_822, 0.5, 0.5);
    float _828 = fma(_824, -0.5, 0.5);
    float _830 = _808 * 0.636619746685028076171875;
    float _832 = -_804;
    float _834 = fma(_830, _832, 1.0);
    float3 _3102 = float3(_826, _828, _820);
    float _836 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3102, float3(0.0), isnan(_3102)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3102, float3(0.0), isnan(_3102)), level(0.0)).x;
    float3 _3113 = float3(_826, _828, _820);
    float4 _839 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3113, float3(0.0), isnan(_3113)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3113, float3(0.0), isnan(_3113)), level(0.0)).xyzw;
    float _841 = _839.x;
    float _843 = _839.y;
    float _845 = _839.z;
    float _847 = _839.w;
    float2 _3130 = float2(_834, _818);
    float3 _851 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3130, float2(0.0), isnan(_3130)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3130, float2(0.0), isnan(_3130)), level(0.0)).xyz;
    float _853 = _851.x;
    float _855 = _851.y;
    float _857 = _851.z;
    float _859 = in.m_55.y;
    float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _863 = in.m_57.y;
    int _865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _867 = _865 != 0;
    float _869 = -_332;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _306);
    float _873 = in.m_57.z;
    int _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _877 = _875 != 0;
    float _879 = -_334;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[18].w, _308);
    int _883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _885 = _883 != 0;
    float _887 = in.m_57.w;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _891 = _889 != 0;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _895 = in.m_57.x;
    float _897 = _861 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _903 = -_859;
    float _905 = _903 + 1.0;
    out.m_59.y = _859;
    float _907 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _911 = _863 > 0.5;
    float _913 = _863 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _915 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[78].w, _907);
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _919 = _873 > 0.5;
    float _921 = fma(_913, -2.0, _899);
    float _923 = _911 ? _905 : _859;
    float _925 = -_336;
    float _927 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _310);
    int _929 = _919 ? as_type<int>(_905) : as_type<int>(_859);
    float _931 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _921);
    bool _933 = _887 > 0.5;
    float _935 = _730 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _937 = _895 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _939 = _885 ? _923 : _859;
    float _941 = _891 ? as_type<float>(_929) : _859;
    float _943 = -_893;
    float _945 = fma(_937, 2.0, _943);
    float _947 = _859;
    float _949 = _923;
    float _951 = _873;
    bool _953 = _877;
    float _955 = _863;
    float _957 = _778;
    float _959 = _800;
    float _961 = _814;
    if (_867)
    {
        float _963 = _933 ? _905 : _859;
        _947 = _963;
    }
    float _965 = _947;
    float _967 = fma(_897, _939, -0.5);
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _971 = _969 != 0;
    float _973 = in.m_61.x;
    float _975 = in.m_61.y;
    float _977 = in.m_61.z;
    bool _979 = _272 != 0.0;
    bool _981 = isnan(_272);
    bool _983 = _979 || _981;
    bool _985 = isnan(0.0);
    bool _987 = _983 || _985;
    float _989 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _993 = _991 != 0;
    float _995 = -_144;
    float _997 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[76].x, _945);
    int _999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1001 = _999 != 0;
    float _1003 = _941 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1005 = in.m_55.x;
    bool _1007 = _270 == 0.0;
    bool _1009 = !_987;
    bool _1011 = _1007 && _1009;
    float _1013 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[6].x, _935);
    float _1015 = _973;
    float _1017 = _975;
    float _1019 = _977;
    int _1021 = as_type<int>(_967);
    float _1023 = _1003;
    if (!_877)
    {
        _949 = _863;
    }
    float _1025 = _949;
    float _1027 = 0.0;
    float _1029 = _1025;
    if (!_877)
    {
        _1027 = _873;
    }
    float _1031 = _1027;
    float _1033 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1013);
    float _1035 = _1031;
    if (_877)
    {
        _1029 = _895;
    }
    float _1037 = _1029;
    float _1039 = _778 * 0.5;
    if (_877)
    {
        _951 = _863;
    }
    float _1041 = _951;
    float _1043 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1033);
    float _1045 = _1041;
    float _1047 = _1043;
    if (_877)
    {
        _1035 = _863;
    }
    float _1049 = _1035;
    bool _1051 = _274 == 0.0;
    bool _1053 = _1051 && _1011;
    float _1055 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_971)
    {
        bool _1057 = _895 > 0.5;
        _953 = _1057;
    }
    bool _1059 = _953;
    float _1061 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[78].z, _901);
    float _1063 = fma(_1055, -2.0, _917);
    float _1065 = _1043 + _778;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1069 = _1005;
    if (!_993)
    {
        _1045 = _1005;
    }
    float _1071 = _1045;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1075 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1067);
    float _1077 = _1071;
    if (!_1053)
    {
        float _1079 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[17].y, _973);
        _1015 = _1079;
    }
    float _1081 = _1015;
    float _1083 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _915);
    int _1085 = as_type<int>(_1083);
    if (!_1053)
    {
        float _1087 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[17].y, _975);
        _1017 = _1087;
    }
    float _1089 = _1017;
    float _1091 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[83].z, _909);
    float _1093 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1097 = -_931;
    float _1099 = fma(_1083, _967, _1097);
    float _1101 = _989 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1103 = as_type<int>(_989);
    if (_993)
    {
        float _1105 = -_1005;
        float _1107 = _1105 + 1.0;
        _1103 = as_type<int>(_1107);
    }
    int _1109 = _1103;
    float _1111 = -_1095;
    float _1113 = fma(_1093, 2.0, _1111);
    if (!_1053)
    {
        float _1115 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[17].y, _977);
        _1019 = _1115;
    }
    float _1117 = _1019;
    float _1119 = fma(_1101, _965, -0.5);
    float _1121 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1061);
    if (_993)
    {
        float _1123 = _919 ? as_type<float>(_1109) : _1005;
        _1077 = _1123;
    }
    float _1125 = _1077;
    float _1127 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1091);
    float _1129 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1075);
    float _1131 = -_144;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1113);
    float _1135 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1063);
    float _1137 = _871 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_971)
    {
        float _1139 = -_1005;
        float _1141 = _1139 + 1.0;
        _1085 = as_type<int>(_1141);
    }
    int _1143 = _1085;
    float _1145 = _871 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1147 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1149 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1151 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1153 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1137);
    if (!_971)
    {
        _955 = _1005;
    }
    float _1155 = _955;
    float _1157 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1145);
    float _1159 = _1155;
    if (_971)
    {
        float _1161 = _1059 ? as_type<float>(_1143) : _1005;
        _1159 = _1161;
    }
    float _1163 = _1159;
    float _1165 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1147);
    float _1167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1169 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1149);
    float _1171 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1151);
    float _1173 = -_1135;
    float _1175 = fma(_1129, _1119, _1173);
    float _1177 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1157);
    if (_1001)
    {
        float _1179 = -_1005;
        float _1181 = _1179 + 1.0;
        _1021 = as_type<int>(_1181);
    }
    int _1183 = _1021;
    float _1185 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1153);
    float _1187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1189 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1191 = in.m_63.w;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (_1001)
    {
        float _1195 = _911 ? as_type<float>(_1183) : _1005;
        _1069 = _1195;
    }
    float _1197 = _1069;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1201 = 1.0 / _1189;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1207 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1211 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1213 = _1203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1215 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1219 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1221 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1223 = _1185 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1225 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1227 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1229 = fma(_1215, _1125, -0.5);
    float _1231 = _1223 + _1189;
    float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1235 = _1197 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    out.m_65.x = _1221;
    out.m_65.y = _1225;
    out.m_65.z = _1227;
    float _1237 = fma(_1207, _1163, -0.5);
    float _1239 = fma(_1127, _1229, _1133);
    float _1241 = _1231 * _1201;
    float _1243 = _1241 * 0.5;
    out.m_67.w = _1191;
    float _1245 = fma(_1121, _1237, _997);
    float _1247 = _1235 * _1217;
    bool _1249 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1251 = isnan(0.5);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1257 = _1253 || _1255;
    out.m_69.x = _1211;
    out.m_69.y = _1219;
    out.m_69.z = _1213;
    float _1259 = fma(_1117, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1165);
    float _1261 = _740 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1263 = _1003 * _1233;
    float _1265 = _1175 + 0.5;
    float _1267 = fma(_1117, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1169);
    float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1271 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1269);
    float _1273 = fma(_1117, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1171);
    out.m_71.x = _1247;
    out.m_71.y = _1263;
    float _1275 = _1245 + 0.5;
    float _1277 = _1099 + 0.5;
    float _1279 = exp2(_1261);
    float _1281 = _1239 + 0.5;
    float _1283 = _1227;
    if (_1257)
    {
        _1023 = 1.0;
    }
    float _1285 = _1023;
    float _1287 = _1285;
    if (_1257)
    {
        _1283 = 1.0;
    }
    float _1289 = _1283;
    out.m_73.x = _1275;
    out.m_73.y = _1277;
    out.m_73.z = _1281;
    out.m_73.w = _1265;
    float _1291 = 1.0 / _1271;
    float _1293 = _814 + _778;
    float _1295 = _1065 * 0.5;
    float _1297 = _1293 * 0.5;
    float _1299 = fma(_800, -0.5, _1039);
    float _1301 = -_1279;
    float _1303 = _1301 + 1.0;
    float _1305 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1307 = _1291 * _1305;
    float _1309 = _1289;
    float _1311 = _1297;
    if (!_1257)
    {
        float _1313 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1315 = _1313 * 0.15915493667125701904296875;
        float _1317 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1319 = _1315 * 6.283185482025146484375;
        float _1321 = cos(_1319);
        float _1323 = _1317 * 0.15915493667125701904296875;
        float _1325 = _1315 * 6.283185482025146484375;
        float _1327 = sin(_1325);
        float _1329 = 1.0 / _1321;
        float _1331 = _1323 * 6.283185482025146484375;
        float _1333 = cos(_1331);
        float _1335 = _1327 * _1329;
        float _1337 = _1323 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        float _1341 = _1333 * _1335;
        float _1343 = 1.0 / _1341;
        float _1345 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1347 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1345;
        float _1349 = 1.0 / _1347;
        float _1351 = _1339 * _1343;
        float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1355 = fma(_1307, _1351, _1353);
        float _1357 = _1355 * _1349;
        float _1359 = precise::clamp(_1357, 0.0, 1.0);
        _1287 = _1359;
    }
    float _1361 = _1287;
    if (!_1257)
    {
        float _1363 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1365 = _1363 * 0.15915493667125701904296875;
        float _1367 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1369 = _1365 * 6.283185482025146484375;
        float _1371 = cos(_1369);
        float _1373 = _1367 * 0.15915493667125701904296875;
        float _1375 = _1365 * 6.283185482025146484375;
        float _1377 = sin(_1375);
        float _1379 = 1.0 / _1371;
        float _1381 = _1373 * 6.283185482025146484375;
        float _1383 = cos(_1381);
        float _1385 = _1377 * _1379;
        float _1387 = _1373 * 6.283185482025146484375;
        float _1389 = sin(_1387);
        float _1391 = _1383 * _1385;
        float _1393 = 1.0 / _1391;
        float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1397 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1395;
        float _1399 = 1.0 / _1397;
        float _1401 = _1389 * _1393;
        float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1405 = fma(_1307, _1401, _1403);
        float _1407 = _1405 * _1399;
        float _1409 = precise::clamp(_1407, 0.0, 1.0);
        float _1411 = -_1409;
        float _1413 = _1411 + 1.0;
        _1309 = _1413;
    }
    float _1415 = _1309;
    float _1417 = _1303 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.z = _1295;
    out.m_75.w = _778;
    bool _1419 = _538 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1421 = isnan(_538);
    bool _1423 = _1419 || _1421;
    bool _1425 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1427 = _1423 || _1425;
    float _1429 = _1417 * _836;
    float _1431 = -_1417;
    float _1433 = _1431 + 1.0;
    out.m_77.x = _1267;
    out.m_77.y = _1259;
    out.m_77.z = _1273;
    float _1435 = _847 * _1429;
    float _1437 = _857 * _1429;
    out.m_79.x = _510;
    out.m_79.y = _506;
    out.m_79.z = _514;
    float _1439 = fma(_853, _1435, _841);
    float _1441 = fma(_855, _1435, _843);
    float _1443 = _847 * _1433;
    float _1445 = fma(_847, _1437, _845);
    float _1447 = _1361 * _1415;
    out.gl_Position.x = _814;
    out.gl_Position.y = _800;
    out.gl_Position.z = _1043;
    out.gl_Position.w = _778;
    float _1449 = _1447 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_81.x = _1439;
    out.m_81.y = _1441;
    out.m_81.z = _1445;
    out.m_81.w = _1443;
    float _1451 = _1447;
    if (!_1427)
    {
        _1451 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1453 = _1451;
    out.m_83.x = _1297;
    out.m_83.y = _1299;
    out.m_83.z = _1295;
    out.m_83.w = _778;
    float _1455 = _1453;
    float _1457 = _1453;
    if (!_1427)
    {
        _957 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1459 = _957;
    float _1461 = _1459;
    float _1463 = _1459;
    if (!_1427)
    {
        _1047 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1465 = _1047;
    float _1467 = _1465;
    float _1469 = _1465;
    if (!_1427)
    {
        _959 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1471 = _959;
    float _1473 = _1471;
    float _1475 = _1471;
    if (!_1427)
    {
        _961 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1477 = _961;
    float _1479 = _1477;
    float _1481 = _1477;
    if (!_1427)
    {
        _1311 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1483 = _1311;
    bool _1485 = !_1427;
    float _1487 = _1483;
    float _1489 = _1483;
    if (!_1485)
    {
        bool _1491 = _538 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1493 = isnan(_538);
        bool _1495 = _1491 || _1493;
        bool _1497 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1499 = _1495 || _1497;
        if (!_1499)
        {
            float _1501 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1503 = _538 + _1501;
            float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1507 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1505;
            float _1509 = 1.0 / _1507;
            float _1511 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1513 = _1511 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1517 = _1515 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1519 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1521 = _1519 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1525 = _1523 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1527 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1529 = _1527 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1531 = _1503 * _1509;
            float _1533 = precise::clamp(_1531, 0.0, 1.0);
            float _1535 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1537 = _1535 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1539 = fma(_1533, _1513, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1541 = fma(_1533, _1537, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1543 = fma(_1533, _1517, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1545 = fma(_1533, _1521, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1547 = fma(_1533, _1525, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1549 = fma(_1533, _1529, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1463 = _1541;
            _1481 = _1547;
            _1489 = _1539;
            _1475 = _1545;
            _1469 = _1543;
            _1457 = _1549;
            _1551 = true;
        }
        else
        {
            bool _1553 = _538 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1555 = isnan(_538);
            bool _1557 = _1553 || _1555;
            bool _1559 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1561 = _1557 || _1559;
            if (!_1561)
            {
                _1487 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1563 = _1487;
            _1489 = _1563;
            if (!_1561)
            {
                _1461 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1565 = _1461;
            _1463 = _1565;
            if (!_1561)
            {
                _1467 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1567 = _1467;
            _1469 = _1567;
            if (!_1561)
            {
                _1473 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1569 = _1473;
            _1475 = _1569;
            if (!_1561)
            {
                _1479 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1571 = _1479;
            _1481 = _1571;
            if (!_1561)
            {
                _1455 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1573 = _1455;
            bool _1575 = !_1561;
            _1457 = _1573;
            if (!_1575)
            {
                bool _1577 = _538 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1579 = isnan(_538);
                bool _1581 = _1577 || _1579;
                bool _1583 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1585 = _1581 || _1583;
                if (!_1585)
                {
                    float _1587 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1589 = _538 + _1587;
                    float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1593 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1591;
                    float _1595 = 1.0 / _1593;
                    float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1599 = _1597 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1603 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1607 = _1605 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1611 = _1609 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1615 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1617 = _1589 * _1595;
                    float _1619 = precise::clamp(_1617, 0.0, 1.0);
                    float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1623 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1625 = fma(_1619, _1599, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1627 = fma(_1619, _1623, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1629 = fma(_1619, _1603, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1631 = fma(_1619, _1607, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1633 = fma(_1619, _1611, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1635 = fma(_1619, _1615, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1463 = _1627;
                    _1481 = _1633;
                    _1489 = _1625;
                    _1475 = _1631;
                    _1469 = _1629;
                    _1457 = _1635;
                    _1551 = true;
                }
                else
                {
                    _1463 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1481 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1489 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1475 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1469 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1457 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1551 = false;
    float _1637 = _1463;
    float _1639 = _1481;
    float _1641 = _1489;
    float _1643 = _1475;
    float _1645 = _1469;
    float _1647 = _1457;
    float _1649 = fma(_1259, -0.5, 0.5);
    float _1651 = precise::clamp(_1649, 0.0, 1.0);
    float _1653 = -_1637;
    float _1655 = _1653 + _1639;
    float _1657 = _1449 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1659 = -_1641;
    float _1661 = _1659 + _1643;
    float _1663 = fma(_1651, _1655, _1637);
    out.m_85.x = 0.0;
    float _1665 = -_1645;
    float _1667 = _1665 + _1647;
    float _1669 = fma(_1651, _1661, _1641);
    float _1671 = _1663 * 0.586610972881317138671875;
    out.m_47.x = _1657;
    bool _1673 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1675 = fma(_1651, _1667, _1645);
    float _1677 = fma(_1669, 0.298911988735198974609375, _1671);
    bool _1679 = _1361 > 0.0;
    bool _1681 = isnan(_1361);
    bool _1683 = _1679 || _1681;
    bool _1685 = isnan(0.0);
    bool _1687 = _1683 || _1685;
    float _1689 = fma(_1675, 0.114477999508380889892578125, _1677);
    out.m_87.x = 0.0;
    bool _1691 = _1415 <= 0.0;
    bool _1693 = !_1687;
    bool _1695 = _1691 || _1693;
    float _1697 = -_1689;
    float _1699 = _1669 + _1697;
    float _1701 = -_1689;
    float _1703 = _1663 + _1701;
    float _1705 = -_1689;
    float _1707 = _1675 + _1705;
    float _1709 = fma(_1699, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1689);
    float _1711 = fma(_1703, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1689);
    float _1713 = fma(_1707, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1689);
    bool _1715 = !_1673;
    if (!_1715)
    {
        float _1717 = -_506;
        float _1719 = _1717 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1721 = -_510;
        float _1723 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1725 = -_514;
        float _1727 = _1725 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1729 = _1719 * _1719;
        float _1731 = fma(_1723, _1723, _1729);
        float _1733 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _1735 = precise::clamp(_1733, 0.0, 1.0);
        float _1737 = fma(_1727, _1727, _1731);
        float _1739 = _1735 * _1735;
        float _1741 = rsqrt(_1737);
        float _1743 = _1739 + (-1.0);
        float _1745 = _1719 * _1741;
        float _1747 = _1723 * _1741;
        float _1749 = _1727 * _1741;
        float _1751 = sqrt(_1737);
        float _1753 = -_544;
        float _1755 = _1753 + _1745;
        float _1757 = -_540;
        float _1759 = _1757 + _1747;
        float _1761 = -_542;
        float _1763 = _1761 + _1749;
        float _1765 = _1755 * _1755;
        float _1767 = fma(_1759, _1759, _1765);
        float _1769 = fma(_1763, _1763, _1767);
        float _1771 = -_1751;
        float _1773 = _1771 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1775 = rsqrt(_1769);
        float _1777 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1779 = precise::clamp(_1777, 0.0, 1.0);
        float _1781 = abs(_1779);
        float _1783 = log2(_1781);
        float _1785 = _1747 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1787 = _1755 * _1775;
        float _1789 = _1759 * _1775;
        float _1791 = _1763 * _1775;
        float _1793 = _1259 * _1787;
        float _1795 = fma(_1267, _1789, _1793);
        float _1797 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1799 = fma(_1273, _1791, _1795);
        float _1801 = precise::clamp(_1799, 0.0, 1.0);
        float _1803 = exp2(_1797);
        float _1805 = _1801 * _1801;
        float _1807 = fma(_1805, _1743, 1.0);
        float _1809 = -_1745;
        float _1811 = -_1785;
        float _1813 = fma(_1809, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1811);
        float _1815 = _1259 * _1745;
        float _1817 = _1807 * _1807;
        float _1819 = -_1749;
        float _1821 = fma(_1819, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1813);
        float _1823 = fma(_1267, _1747, _1815);
        float _1825 = 1.0 / _1817;
        float _1827 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1829 = _1821 + _1827;
        float _1831 = fma(_1273, _1749, _1823);
        float _1833 = precise::clamp(_1831, 0.0, 1.0);
        float _1835 = _1829 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1837 = precise::clamp(_1835, 0.0, 1.0);
        float _1839 = _1803 * _1837;
        float _1841 = _1833 * _1839;
        float _1843 = _1739 * _1825;
        float _1845 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1847 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1849 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _1851 = _1841 * _1843;
        float _1853 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1855 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1857 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _1845;
        out.m_85.y = _1847;
        out.m_85.z = _1849;
        out.m_87.x = _1853;
        out.m_87.y = _1855;
        out.m_87.z = _1857;
    }
    out.m_89.x = _1709;
    out.m_89.y = _1711;
    out.m_89.z = _1713;
    if (!_1695)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1859 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1859;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

