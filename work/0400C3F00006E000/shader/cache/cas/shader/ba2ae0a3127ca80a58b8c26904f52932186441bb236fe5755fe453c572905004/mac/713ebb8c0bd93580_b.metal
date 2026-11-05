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
    float4 m_65 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1571 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
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
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1819 = as_type<float>(_116);
        out.gl_Position.z = _1819;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_49.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_100);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1888 = as_type<float>(_152);
        out.gl_Position.z = _1888;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_51.w;
    float _156 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = in.m_44.x;
    float _176 = in.m_44.y;
    float _178 = in.m_44.z;
    float _180 = 0.0;
    float _182 = _156;
    if (!_166)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_166)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_166;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _156 * _202;
        float _212 = exp2(_210);
        float _214 = _208 * 0.693147182464599609375;
        float _216 = 1.0 / _214;
        float _218 = 1.0 / _206;
        float _220 = _212 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _216, _156);
        float _226 = _224 * _218;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_166;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _156 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    float _256 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_254, _170, _256);
    float _264 = fma(_254, _168, _258);
    float _266 = fma(_254, _172, _260);
    float _268 = fma(_262, _154, _176);
    float _270 = fma(_264, _154, _174);
    float _272 = fma(_266, _154, _178);
    float _274 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _276 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _278 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _280 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _274);
    float _282 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _276);
    float _284 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _278);
    float _286 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _280);
    float _288 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _282);
    float _290 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _284);
    float _292 = _286 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _294 = _288 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _296 = _290 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _298 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _300 = -_292;
    float _302 = _300 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _304 = -_294;
    float _306 = _304 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _308 = -_296;
    float _310 = _308 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _312 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _314 = _302 * _302;
    float _316 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _318 = -_298;
    float _320 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _318);
    float _322 = -_312;
    float _324 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _322);
    float _326 = fma(_306, _306, _314);
    float _328 = fma(_310, _310, _326);
    float _330 = rsqrt(_328);
    float _332 = _306 * _330;
    float _334 = _310 * _330;
    float _336 = _302 * _330;
    float _338 = _332 * _332;
    float _340 = fma(_334, _334, _338);
    float _342 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _344 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _346 = rsqrt(_340);
    float _348 = -_342;
    float _350 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _348);
    float _352 = -_344;
    float _354 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _352);
    float _356 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _358 = _350 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _360 = _354 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _362 = -_356;
    float _364 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _362);
    float _366 = -_316;
    float _368 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _366);
    float _370 = _354 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _372 = -_358;
    float _374 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[1].y, _372);
    float _376 = -_360;
    float _378 = fma(_350, (*spvDescriptorSet0.vp_c8)._m0[1].x, _376);
    float _380 = _368 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _382 = -_370;
    float _384 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _382);
    float _386 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[1].w, _374);
    float _388 = _334 * _346;
    float _390 = _332 * _346;
    float _392 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[1].w, _384);
    float _394 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[1].w, _378);
    float _396 = -_388;
    float _398 = _334 * _396;
    float _400 = -_388;
    float _402 = _336 * _400;
    float _404 = _392 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _406 = -_398;
    float _408 = fma(_332, _390, _406);
    float _410 = _336 * _390;
    float _412 = -_404;
    float _414 = fma(_386, (*spvDescriptorSet0.vp_c8)._m0[0].x, _412);
    float _416 = -_380;
    float _418 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _416);
    float _420 = _408 * _408;
    float _422 = _354 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _424 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[0].z, _414);
    float _426 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[1].z, _418);
    float _428 = fma(_410, _410, _420);
    float _430 = -_422;
    float _432 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _430);
    float _434 = _350 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _436 = -_426;
    float _438 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[0].w, _424);
    float _440 = fma(_402, _402, _428);
    float _442 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[0].w, _432);
    float _444 = -_434;
    float _446 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[0].y, _444);
    float _448 = 1.0 / _438;
    float _450 = _354 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _452 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[0].w, _446);
    float _454 = -_450;
    float _456 = fma(_350, (*spvDescriptorSet0.vp_c8)._m0[0].x, _454);
    float _458 = rsqrt(_440);
    float _460 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[0].w, _456);
    float _462 = fma(_442, _448, -1.0);
    float _464 = _408 * _458;
    float _466 = precise::clamp(_464, 0.0, 1.0);
    float _468 = -_466;
    float _470 = _468 + 1.0;
    float _472 = _470 * _448;
    float _474 = fma(_470, _462, 1.0);
    float _476 = _452 * _472;
    float _478 = _474 * _474;
    float _480 = _460 * _472;
    float _482 = fma(_476, _476, _478);
    float _484 = fma(_480, _480, _482);
    float _486 = rsqrt(_484);
    float _488 = _480 * _486;
    float _490 = _476 * _486;
    float _492 = _474 * _486;
    float _494 = -_488;
    float _496 = _332 * _494;
    float _498 = _334 * _492;
    float _500 = -_490;
    float _502 = -_496;
    float _504 = fma(_334, _500, _502);
    float _506 = -_490;
    float _508 = _336 * _506;
    float _510 = -_488;
    float _512 = -_498;
    float _514 = fma(_336, _510, _512);
    float _516 = _504 * _504;
    float _518 = -_508;
    float _520 = fma(_332, _492, _518);
    float _522 = fma(_514, _514, _516);
    float _524 = fma(_520, _520, _522);
    float _526 = rsqrt(_524);
    float _528 = _514 * _526;
    float _530 = _520 * _526;
    float _532 = _504 * _526;
    float _534 = _334 * _528;
    float _536 = _336 * _530;
    float _538 = -_534;
    float _540 = fma(_332, _530, _538);
    float _542 = _332 * _532;
    float _544 = -_536;
    float _546 = fma(_334, _532, _544);
    float _548 = _540 * _540;
    float _550 = -_542;
    float _552 = fma(_336, _528, _550);
    float _554 = in.m_53.x;
    float _556 = in.m_53.y;
    float _558 = in.m_53.z;
    float _560 = fma(_546, _546, _548);
    float _562 = fma(_552, _552, _560);
    float _564 = rsqrt(_562);
    float _566 = _552 * _564;
    float _568 = _546 * _564;
    float _570 = _540 * _564;
    float _572 = in.m_51.x;
    float _574 = in.m_51.y;
    float _576 = in.m_51.z;
    float _578 = _332 * _566;
    float _580 = _334 * _570;
    float _582 = -_578;
    float _584 = fma(_334, _568, _582);
    float _586 = _336 * _568;
    float _588 = -_580;
    float _590 = fma(_336, _566, _588);
    float _592 = _584 * _584;
    float _594 = -_586;
    float _596 = fma(_332, _570, _594);
    float _598 = fma(_590, _590, _592);
    float _600 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _554);
    float _602 = fma(_596, _596, _598);
    float _604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _556);
    float _606 = rsqrt(_602);
    float _608 = _574 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _610 = _572 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _612 = _576 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _614 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _616 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _618 = _614 * _604;
    float _620 = _616 * _600;
    float _622 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _624 = _618 * _566;
    float _626 = _596 * _606;
    float _628 = _622 * _558;
    float _630 = _618 * _568;
    float _632 = _590 * _606;
    float _634 = fma(_620, _626, _624);
    float _636 = _618 * _570;
    float _638 = _584 * _606;
    float _640 = fma(_620, _632, _630);
    float _642 = fma(_628, _334, _634);
    float _644 = fma(_620, _638, _636);
    float _646 = fma(_628, _332, _640);
    float _648 = _296 + _642;
    float _650 = fma(_628, _336, _644);
    float _652 = _294 + _646;
    float _654 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _656 = _648 + _654;
    float _658 = _292 + _650;
    float _660 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _662 = _652 + _660;
    float _664 = _656 * _656;
    float _666 = fma(_662, _662, _664);
    float _668 = sqrt(_666);
    bool _670 = _668 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _672 = 0.0;
    float _674 = _652;
    float _676 = _648;
    float _678 = _656;
    float _680 = _606;
    int _682 = as_type<int>(_554);
    if (!_670)
    {
        _672 = _658;
    }
    float _684 = _672;
    bool _686 = !_670;
    float _688 = _684;
    if (!_686)
    {
        float _690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _694 = _668 + _692;
        float _696 = rsqrt(_666);
        float _698 = _694 * _690;
        float _700 = _658 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _702 = _698 * 0.15915493667125701904296875;
        float _704 = _702 * 6.283185482025146484375;
        float _706 = cos(_704);
        float _708 = _702 * 6.283185482025146484375;
        float _710 = sin(_708);
        float _712 = _706 + (-1.0);
        float _714 = _712 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _716 = fma(_710, _700, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _718 = fma(_658, _706, _714);
        float _720 = _696 * _716;
        float _722 = fma(_662, _720, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _724 = fma(_656, _720, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _688 = _718;
        _674 = _722;
        _676 = _724;
    }
    float _726 = _688;
    float _728 = _674;
    float _730 = _676;
    float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _734 = _726 + _732;
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _738 = _728 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _742 = _730 + _740;
    float _744 = _734 * _734;
    float _746 = fma(_738, _738, _744);
    float _748 = fma(_742, _742, _746);
    float _750 = rsqrt(_748);
    float _752 = sqrt(_748);
    float _754 = _750 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _756 = _738 * _754;
    float _758 = _742 * _754;
    float _760 = _756 * _756;
    float _762 = _758 * _758;
    float _764 = _760 + _762;
    float _766 = sqrt(_764);
    bool _768 = _766 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _770 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _772 = _766 + _770;
    float _774 = _746;
    float _776 = _764;
    float _778 = _772;
    float _780 = _734;
    if (_768)
    {
        float _782 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _774 = _782;
    }
    float _784 = _774;
    if (_768)
    {
        float _786 = rsqrt(_764);
        _776 = _786;
    }
    float _788 = _776;
    float _790 = _788;
    if (_768)
    {
        float _792 = _772 * _784;
        _778 = _792;
    }
    float _794 = _778;
    if (_768)
    {
        float _796 = _794 * 0.15915493667125701904296875;
        _678 = _796;
    }
    float _798 = _678;
    float _800 = _742;
    if (_768)
    {
        float _802 = _798 * 6.283185482025146484375;
        float _804 = sin(_802);
        _800 = _804;
    }
    float _806 = _800;
    float _808 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _810 = precise::max(0.0, _808);
    float _812 = _784;
    float _814 = _810;
    if (_768)
    {
        float _816 = _798 * 6.283185482025146484375;
        float _818 = cos(_816);
        _812 = _818;
    }
    float _820 = _812;
    float _822 = -_754;
    float _824 = -_810;
    float _826 = fma(_734, _822, _824);
    if (_768)
    {
        float _828 = _826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _780 = _828;
    }
    float _830 = _780;
    float _832 = _830;
    float _834 = _806;
    if (_768)
    {
        float _836 = fma(_806, _830, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _832 = _836;
    }
    float _838 = _832;
    float _840 = _838;
    if (!_768)
    {
        _834 = _756;
    }
    float _842 = _834;
    float _844 = _842;
    float _846 = _820;
    if (_768)
    {
        float _848 = _820 + (-1.0);
        _814 = _848;
    }
    float _850 = _814;
    float _852 = 0.0;
    float _854 = _850;
    if (_768)
    {
        float _856 = _788 * _838;
        _852 = _856;
    }
    float _858 = _852;
    if (!_768)
    {
        _840 = _826;
    }
    float _860 = _840;
    float _862 = _860;
    if (_768)
    {
        float _864 = _850 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _680 = _864;
    }
    float _866 = _680;
    if (_768)
    {
        float _868 = _756 * _858;
        _844 = _868;
    }
    float _870 = _844;
    if (!_768)
    {
        _854 = _758;
    }
    float _872 = _854;
    float _874 = _872;
    if (_768)
    {
        float _876 = _758 * _858;
        _874 = _876;
    }
    float _878 = _874;
    if (!_768)
    {
        _790 = _760;
    }
    float _880 = _790;
    float _882 = _880;
    if (_768)
    {
        float _884 = fma(_826, _820, _866);
        _862 = _884;
    }
    float _886 = _862;
    if (_768)
    {
        float _888 = _870 * _870;
        _882 = _888;
    }
    float _890 = _882;
    if (!_768)
    {
        _846 = _762;
    }
    float _892 = _846;
    float _894 = _892;
    if (_768)
    {
        float _896 = _878 * _878;
        _894 = _896;
    }
    float _898 = _894;
    float _900 = fma(_886, _886, _890);
    float _902 = _726 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _904 = _900 + _898;
    float _906 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[2].x, _902);
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _910 = fma(_752, (*spvDescriptorSet0.vp_c15)._m0[23].w, _908);
    float _912 = precise::clamp(_910, 0.0, 1.0);
    float _914 = _726 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _916 = rsqrt(_904);
    float _918 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[2].z, _906);
    float _920 = -_912;
    float _922 = _920 + 1.0;
    float _924 = _726 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _926 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[1].x, _914);
    float _928 = _918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _930 = _726 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _932 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[0].x, _924);
    float _934 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[1].z, _926);
    float _936 = abs(_922);
    float _938 = log2(_936);
    float _940 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[3].x, _930);
    float _942 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[0].z, _932);
    float _944 = _934 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _946 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _948 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[3].z, _940);
    float _950 = _942 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _952 = _944 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _954 = _916 * _870;
    float _956 = _948 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _958 = _916 * _886;
    float _960 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[7].x, _952);
    float _962 = _954 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _964 = _928 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _966 = _916 * _878;
    float _968 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[7].z, _960);
    float _970 = -_962;
    float _972 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[21].y, _970);
    float _974 = _938 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _976 = -_964;
    float _978 = fma(_976, _946, 1.0);
    float _980 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[7].w, _968);
    float _982 = -_966;
    float _984 = fma(_982, (*spvDescriptorSet0.vp_c15)._m0[21].z, _972);
    float _986 = _944 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _988 = log2(_978);
    float _990 = _944 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _992 = fma(_984, -0.5, 0.5);
    float _994 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[4].x, _986);
    float _996 = fma(_984, 0.5, 0.5);
    float _998 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[5].x, _990);
    float _1000 = _958 + 1.0;
    float _1002 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[4].z, _994);
    float _1004 = exp2(_974);
    float _1006 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[5].z, _998);
    float _1008 = fma(_996, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1010 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1002);
    float _1012 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1006);
    float _1014 = fma(_996, _1008, -0.212114393711090087890625);
    float _1016 = 1.0 / _980;
    float _1018 = _988 * 0.693147182464599609375;
    float _1020 = fma(_996, _1014, 1.570728778839111328125);
    float _1022 = _1018 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1024 = sqrt(_992);
    float _1026 = -_958;
    float _1028 = fma(_1004, _1000, _1026);
    float _1030 = fma(_1028, 0.5, 0.5);
    float _1032 = _1010 * _1016;
    float _1034 = _1012 * _1016;
    float _1036 = fma(_1032, 0.5, 0.5);
    float _1038 = fma(_1034, -0.5, 0.5);
    float _1040 = _1024 * 0.636619746685028076171875;
    float3 _3355 = float3(_1036, _1038, _1022);
    float _1042 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3355, float3(0.0), isnan(_3355)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3355, float3(0.0), isnan(_3355)), level(0.0)).x;
    float _1044 = -_1020;
    float _1046 = fma(_1040, _1044, 1.0);
    float3 _3371 = float3(_1036, _1038, _1022);
    float4 _1049 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3371, float3(0.0), isnan(_3371)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3371, float3(0.0), isnan(_3371)), level(0.0)).xyzw;
    float _1051 = _1049.x;
    float _1053 = _1049.y;
    float _1055 = _1049.z;
    float _1057 = _1049.w;
    float2 _3388 = float2(_1046, _1030);
    float3 _1061 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3388, float2(0.0), isnan(_3388)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3388, float2(0.0), isnan(_3388)), level(0.0)).xyz;
    float _1063 = _1061.x;
    float _1065 = _1061.y;
    float _1067 = _1061.z;
    float _1069 = in.m_55.x;
    float _1071 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1073 = in.m_57.x;
    int _1075 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1077 = _1075 != 0;
    float _1079 = _938 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1083 = _1081 != 0;
    float _1085 = in.m_55.y;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1089 = _1087 != 0;
    float _1091 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1093 = in.m_57.z;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1097 = in.m_57.y;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1101 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1103 = exp2(_1079);
    float _1105 = in.m_57.w;
    int _1107 = as_type<int>(_1036);
    float _1109 = _1022;
    float _1111 = _1095;
    float _1113 = _1069;
    float _1115 = _980;
    float _1117 = _1012;
    float _1119 = _1010;
    if (_1077)
    {
        float _1121 = -_1069;
        float _1123 = _1121 + 1.0;
        _1107 = as_type<int>(_1123);
    }
    int _1125 = _1107;
    if (!_1077)
    {
        _1109 = _1069;
    }
    float _1127 = _1109;
    float _1129 = in.m_59.x;
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1133 = false;
    float _1135 = _1127;
    if (_1077)
    {
        bool _1137 = _1073 > 0.5;
        _1133 = _1137;
    }
    bool _1139 = _1133;
    float _1141 = in.m_59.z;
    float _1143 = -_1085;
    float _1145 = _1143 + 1.0;
    float _1147 = _1085;
    if (_1077)
    {
        float _1149 = _1139 ? as_type<float>(_1125) : _1069;
        _1135 = _1149;
    }
    float _1151 = _1135;
    float _1153 = in.m_59.w;
    float _1155 = -_1103;
    float _1157 = _1155 + 1.0;
    bool _1159 = _1093 > 0.5;
    float _1161 = fma(_1101, _1151, -0.5);
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1165 = _1163 != 0;
    float _1167 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1169 = _1097 > 0.5;
    float _1171 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1099);
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1175 = _1173 != 0;
    float _1177 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1179 = _1105 > 0.5;
    float _1181 = _292 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1183 = _1169 ? as_type<int>(_1145) : as_type<int>(_1085);
    float _1185 = _292 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1187 = _1159 ? as_type<int>(_1145) : as_type<int>(_1085);
    float _1189 = _1157 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1191 = _1165 ? as_type<float>(_1183) : _1085;
    out.m_61.x = _1129;
    float _1193 = _1175 ? as_type<float>(_1187) : _1085;
    bool _1195 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1197 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan(0.5);
    bool _1203 = _1199 || _1201;
    float _1205 = fma(_1177, _1191, -0.5);
    if (_1083)
    {
        float _1207 = _1179 ? _1145 : _1085;
        _1147 = _1207;
    }
    float _1209 = _1147;
    out.m_61.z = _1141;
    bool _1211 = _556 != 0.0;
    bool _1213 = isnan(_556);
    bool _1215 = _1211 || _1213;
    bool _1217 = isnan(0.0);
    bool _1219 = _1215 || _1217;
    float _1221 = in.m_63.x;
    float _1223 = in.m_63.y;
    float _1225 = in.m_63.z;
    bool _1227 = _554 == 0.0;
    bool _1229 = !_1219;
    bool _1231 = _1227 && _1229;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1235 = _558 == 0.0;
    bool _1237 = _1235 && _1231;
    out.m_61.w = _1153;
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1241 = _1239 != 0;
    float _1243 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1247 = -_1233;
    float _1249 = fma(_1243, 2.0, _1247);
    float _1251 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1095);
    int _1253 = as_type<int>(_1251);
    if (!_1089)
    {
        _1111 = _1069;
    }
    float _1255 = _1111;
    float _1257 = fma(_1167, -2.0, _1245);
    float _1259 = -_134;
    float _1261 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1249);
    float _1263 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1251);
    float _1265 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1171);
    float _1267 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1257);
    float _1269 = fma(_1263, _1161, _1261);
    float _1271 = fma(_294, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1181);
    float _1273 = -_1267;
    float _1275 = fma(_1265, _1205, _1273);
    float _1277 = _1221;
    float _1279 = _1223;
    float _1281 = _1225;
    float _1283 = _1255;
    if (!_1237)
    {
        float _1285 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1221);
        _1277 = _1285;
    }
    float _1287 = _1277;
    if (_1089)
    {
        float _1289 = -_1069;
        float _1291 = _1289 + 1.0;
        _682 = as_type<int>(_1291);
    }
    int _1293 = _682;
    if (!_1237)
    {
        float _1295 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1223);
        _1279 = _1295;
    }
    float _1297 = _1279;
    if (!_1237)
    {
        float _1299 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1225);
        _1281 = _1299;
    }
    float _1301 = _1281;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_1089)
    {
        float _1305 = _1159 ? as_type<float>(_1293) : _1069;
        _1283 = _1305;
    }
    float _1307 = _1283;
    float _1309 = fma(_296, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1271);
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1313 = fma(_294, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1185);
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1317 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1321 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1323 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1325 = fma(_296, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1313);
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_65.x = _1321;
    out.m_65.y = _1317;
    out.m_65.z = _1323;
    out.m_65.w = _1303;
    if (_1241)
    {
        float _1333 = -_1069;
        float _1335 = _1333 + 1.0;
        _1253 = as_type<int>(_1335);
    }
    int _1337 = _1253;
    float _1339 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1343 = _1327 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1345 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1347 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1351 = _1347;
    if (_1241)
    {
        float _1353 = _1169 ? as_type<float>(_1337) : _1069;
        _1113 = _1353;
    }
    float _1355 = _1113;
    float _1357 = in.m_59.y;
    float _1359 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1361 = _568 * _1297;
    float _1363 = _570 * _1297;
    out.m_67.x = _1343;
    out.m_67.y = _1345;
    out.m_67.z = _1347;
    out.m_67.w = _1341;
    float _1365 = _1309 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1369 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1371 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1373 = _1339 + _1365;
    float _1375 = _1269 + 0.5;
    float _1377 = _566 * _1297;
    float _1379 = fma(_638, _1287, _1363);
    bool _1381 = _752 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1383 = isnan(_752);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1389 = _1385 || _1387;
    float _1391 = 1.0 / _1365;
    float _1393 = fma(_626, _1287, _1377);
    if (!_1203)
    {
        _1351 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1395 = _1351;
    float _1397 = _944 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1399 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1401 = _1369 * _1349;
    float _1403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1405 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1397);
    float _1407 = _1399 * _1131;
    float _1409 = _1359 * _1367;
    float _1411 = _1275 + 0.5;
    float _1413 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1405);
    out.m_61.y = _1357;
    float _1415 = _1373 * _1391;
    float _1417 = _1415 * 0.5;
    out.m_69.x = _1401;
    out.m_69.y = _1407;
    float _1419 = _1395;
    float _1421 = _1413;
    if (!_1203)
    {
        float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1425 = fma(_1417, _1395, _1423);
        _1419 = _1425;
    }
    float _1427 = _1419;
    float _1429 = _1371 * _1403;
    float _1431 = _1427;
    if (!_1203)
    {
        float _1433 = 1.0 / _1427;
        _1431 = _1433;
    }
    float _1435 = _1431;
    float _1437 = fma(_632, _1287, _1361);
    out.m_71.x = _1375;
    out.m_71.y = _1411;
    out.m_71.z = _1409;
    out.m_71.w = _1429;
    float _1439 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1413);
    float _1441 = _1439;
    if (!_1203)
    {
        _1421 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1443 = _1421;
    float _1445 = fma(_332, _1301, _1437);
    float _1447 = _1439 + _980;
    out.gl_Position.x = _1010;
    out.gl_Position.y = _1012;
    out.gl_Position.z = _1439;
    out.gl_Position.w = _980;
    float _1449 = _1447 * 0.5;
    float _1451 = fma(_336, _1301, _1379);
    float _1453 = fma(_334, _1301, _1393);
    float _1455 = _1435;
    float _1457 = _1443;
    if (!_1203)
    {
        float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1461 = -_1443;
        float _1463 = fma(_1435, _1459, _1461);
        _1455 = _1463;
    }
    float _1465 = _1455;
    if (!_1203)
    {
        float _1467 = -_1443;
        float _1469 = _1467 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1457 = _1469;
    }
    float _1471 = _1457;
    out.m_73.z = _1449;
    out.m_73.w = _980;
    out.m_75.x = _1445;
    out.m_75.y = _1451;
    out.m_75.z = _1453;
    float _1473 = _1471;
    if (!_1203)
    {
        float _1475 = 1.0 / _1471;
        _1473 = _1475;
    }
    float _1477 = _1473;
    if (_1203)
    {
        _1115 = 1.0;
    }
    float _1479 = _1115;
    float _1481 = _1479;
    if (!_1389)
    {
        _1441 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1483 = _1441;
    float _1485 = _1483;
    float _1487 = _1483;
    if (!_1389)
    {
        _1117 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1489 = _1117;
    float _1491 = _1489;
    float _1493 = _1489;
    if (!_1389)
    {
        _1119 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1495 = _1119;
    float _1497 = _1495;
    float _1499 = _1495;
    if (!_1203)
    {
        float _1501 = _1465 * _1477;
        float _1503 = precise::clamp(_1501, 0.0, 1.0);
        _1481 = _1503;
    }
    float _1505 = _1481;
    float _1507 = _1505 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1509 = _1189 * _1042;
    float _1511 = _1057 * _1509;
    float _1513 = _1067 * _1509;
    float _1515 = fma(_1063, _1511, _1051);
    float _1517 = -_1189;
    float _1519 = _1517 + 1.0;
    float _1521 = fma(_1065, _1511, _1053);
    float _1523 = fma(_1057, _1513, _1055);
    float _1525 = _1057 * _1519;
    out.m_77.x = _1515;
    out.m_77.y = _1521;
    out.m_77.z = _1523;
    out.m_77.w = _1525;
    bool _1527 = !_1389;
    if (!_1527)
    {
        bool _1529 = _752 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1531 = isnan(_752);
        bool _1533 = _1529 || _1531;
        bool _1535 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1537 = _1533 || _1535;
        if (!_1537)
        {
            float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1541 = _752 + _1539;
            float _1543 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1545 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1543;
            float _1547 = 1.0 / _1545;
            float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1551 = _1549 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1555 = _1553 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1557 = _1541 * _1547;
            float _1559 = precise::clamp(_1557, 0.0, 1.0);
            float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1563 = _1561 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1565 = fma(_1559, _1555, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1567 = fma(_1559, _1563, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1569 = fma(_1559, _1551, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1493 = _1569;
            _1487 = _1567;
            _1499 = _1565;
            _1571 = true;
        }
        else
        {
            bool _1573 = _752 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1575 = isnan(_752);
            bool _1577 = _1573 || _1575;
            bool _1579 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1581 = _1577 || _1579;
            if (!_1581)
            {
                _1485 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1583 = _1485;
            _1487 = _1583;
            if (!_1581)
            {
                _1491 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1585 = _1491;
            _1493 = _1585;
            if (!_1581)
            {
                _1497 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1587 = _1497;
            bool _1589 = !_1581;
            _1499 = _1587;
            if (!_1589)
            {
                bool _1591 = _752 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1593 = isnan(_752);
                bool _1595 = _1591 || _1593;
                bool _1597 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1599 = _1595 || _1597;
                if (!_1599)
                {
                    float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1603 = _752 + _1601;
                    float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1607 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1605;
                    float _1609 = 1.0 / _1607;
                    float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1613 = _1611 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1619 = _1603 * _1609;
                    float _1621 = precise::clamp(_1619, 0.0, 1.0);
                    float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1625 = _1623 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1627 = fma(_1621, _1617, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1629 = fma(_1621, _1625, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1631 = fma(_1621, _1613, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1493 = _1631;
                    _1487 = _1629;
                    _1499 = _1627;
                    _1571 = true;
                }
                else
                {
                    _1493 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1487 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1499 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1571 = false;
    float _1633 = _1493;
    float _1635 = _1487;
    float _1637 = _1499;
    float _1639 = _1507 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.x = 0.0;
    float _1641 = _1633 * 0.586610972881317138671875;
    bool _1643 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _1639;
    float _1645 = fma(_1635, 0.298911988735198974609375, _1641);
    bool _1647 = _1505 > 0.0;
    bool _1649 = isnan(_1505);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan(0.0);
    bool _1655 = _1651 || _1653;
    float _1657 = fma(_1637, 0.114477999508380889892578125, _1645);
    float _1659 = -_1657;
    float _1661 = _1659 + _1635;
    float _1663 = -_1657;
    float _1665 = _1663 + _1633;
    float _1667 = -_1657;
    float _1669 = _1667 + _1637;
    float _1671 = fma(_1661, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1657);
    float _1673 = fma(_1665, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1657);
    float _1675 = fma(_1669, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1657);
    bool _1677 = !_1643;
    if (!_1677)
    {
        float _1679 = -_726;
        float _1681 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1683 = -_728;
        float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1687 = -_730;
        float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1691 = _1681 * _1681;
        float _1693 = fma(_1685, _1685, _1691);
        float _1695 = fma(_1689, _1689, _1693);
        float _1697 = sqrt(_1695);
        float _1699 = rsqrt(_1695);
        float _1701 = -_1697;
        float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1705 = _1703 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1707 = precise::clamp(_1705, 0.0, 1.0);
        float _1709 = _1685 * _1699;
        float _1711 = _1681 * _1699;
        float _1713 = abs(_1707);
        float _1715 = log2(_1713);
        float _1717 = _1689 * _1699;
        float _1719 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1721 = _1451 * _1711;
        float _1723 = -_1711;
        float _1725 = -_1719;
        float _1727 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1725);
        float _1729 = fma(_1445, _1709, _1721);
        float _1731 = -_1717;
        float _1733 = fma(_1731, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1727);
        float _1735 = fma(_1453, _1717, _1729);
        float _1737 = precise::clamp(_1735, 0.0, 1.0);
        float _1739 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1741 = _1733 + _1739;
        float _1743 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1745 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1747 = precise::clamp(_1745, 0.0, 1.0);
        float _1749 = exp2(_1743);
        float _1751 = _1749 * _1747;
        float _1753 = _1737 * _1751;
        float _1755 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1757 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1759 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _1755;
        out.m_79.y = _1757;
        out.m_79.z = _1759;
    }
    out.m_81.x = _1671;
    out.m_81.y = _1673;
    out.m_81.z = _1675;
    if (_1655)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1761 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1761;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1571 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
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
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1819 = as_type<float>(_116);
        out.gl_Position.z = _1819;
    }
    if (!_104)
    {
        return out;
    }
    float _120 = in.m_49.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_100);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1888 = as_type<float>(_152);
        out.gl_Position.z = _1888;
    }
    if (_144)
    {
        return out;
    }
    float _154 = in.m_51.w;
    float _156 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = in.m_44.x;
    float _176 = in.m_44.y;
    float _178 = in.m_44.z;
    float _180 = 0.0;
    float _182 = _156;
    if (!_166)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_166)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_166;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _156 * _202;
        float _212 = exp2(_210);
        float _214 = _208 * 0.693147182464599609375;
        float _216 = 1.0 / _214;
        float _218 = 1.0 / _206;
        float _220 = _212 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _216, _156);
        float _226 = _224 * _218;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_166;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _156 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    float _256 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_254, _170, _256);
    float _264 = fma(_254, _168, _258);
    float _266 = fma(_254, _172, _260);
    float _268 = fma(_262, _154, _176);
    float _270 = fma(_264, _154, _174);
    float _272 = fma(_266, _154, _178);
    float _274 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _276 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _278 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _280 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _274);
    float _282 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _276);
    float _284 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _278);
    float _286 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _280);
    float _288 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _282);
    float _290 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _284);
    float _292 = _286 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _294 = _288 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _296 = _290 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _298 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _300 = -_292;
    float _302 = _300 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _304 = -_294;
    float _306 = _304 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _308 = -_296;
    float _310 = _308 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _312 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _314 = _302 * _302;
    float _316 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _318 = -_298;
    float _320 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _318);
    float _322 = -_312;
    float _324 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _322);
    float _326 = fma(_306, _306, _314);
    float _328 = fma(_310, _310, _326);
    float _330 = rsqrt(_328);
    float _332 = _306 * _330;
    float _334 = _310 * _330;
    float _336 = _302 * _330;
    float _338 = _332 * _332;
    float _340 = fma(_334, _334, _338);
    float _342 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _344 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _346 = rsqrt(_340);
    float _348 = -_342;
    float _350 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _348);
    float _352 = -_344;
    float _354 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _352);
    float _356 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _358 = _350 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _360 = _354 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _362 = -_356;
    float _364 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _362);
    float _366 = -_316;
    float _368 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _366);
    float _370 = _354 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _372 = -_358;
    float _374 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[1].y, _372);
    float _376 = -_360;
    float _378 = fma(_350, (*spvDescriptorSet0.vp_c8)._m0[1].x, _376);
    float _380 = _368 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _382 = -_370;
    float _384 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _382);
    float _386 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[1].w, _374);
    float _388 = _334 * _346;
    float _390 = _332 * _346;
    float _392 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[1].w, _384);
    float _394 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[1].w, _378);
    float _396 = -_388;
    float _398 = _334 * _396;
    float _400 = -_388;
    float _402 = _336 * _400;
    float _404 = _392 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _406 = -_398;
    float _408 = fma(_332, _390, _406);
    float _410 = _336 * _390;
    float _412 = -_404;
    float _414 = fma(_386, (*spvDescriptorSet0.vp_c8)._m0[0].x, _412);
    float _416 = -_380;
    float _418 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _416);
    float _420 = _408 * _408;
    float _422 = _354 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _424 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[0].z, _414);
    float _426 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[1].z, _418);
    float _428 = fma(_410, _410, _420);
    float _430 = -_422;
    float _432 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _430);
    float _434 = _350 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _436 = -_426;
    float _438 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[0].w, _424);
    float _440 = fma(_402, _402, _428);
    float _442 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[0].w, _432);
    float _444 = -_434;
    float _446 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[0].y, _444);
    float _448 = 1.0 / _438;
    float _450 = _354 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _452 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[0].w, _446);
    float _454 = -_450;
    float _456 = fma(_350, (*spvDescriptorSet0.vp_c8)._m0[0].x, _454);
    float _458 = rsqrt(_440);
    float _460 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[0].w, _456);
    float _462 = fma(_442, _448, -1.0);
    float _464 = _408 * _458;
    float _466 = precise::clamp(_464, 0.0, 1.0);
    float _468 = -_466;
    float _470 = _468 + 1.0;
    float _472 = _470 * _448;
    float _474 = fma(_470, _462, 1.0);
    float _476 = _452 * _472;
    float _478 = _474 * _474;
    float _480 = _460 * _472;
    float _482 = fma(_476, _476, _478);
    float _484 = fma(_480, _480, _482);
    float _486 = rsqrt(_484);
    float _488 = _480 * _486;
    float _490 = _476 * _486;
    float _492 = _474 * _486;
    float _494 = -_488;
    float _496 = _332 * _494;
    float _498 = _334 * _492;
    float _500 = -_490;
    float _502 = -_496;
    float _504 = fma(_334, _500, _502);
    float _506 = -_490;
    float _508 = _336 * _506;
    float _510 = -_488;
    float _512 = -_498;
    float _514 = fma(_336, _510, _512);
    float _516 = _504 * _504;
    float _518 = -_508;
    float _520 = fma(_332, _492, _518);
    float _522 = fma(_514, _514, _516);
    float _524 = fma(_520, _520, _522);
    float _526 = rsqrt(_524);
    float _528 = _514 * _526;
    float _530 = _520 * _526;
    float _532 = _504 * _526;
    float _534 = _334 * _528;
    float _536 = _336 * _530;
    float _538 = -_534;
    float _540 = fma(_332, _530, _538);
    float _542 = _332 * _532;
    float _544 = -_536;
    float _546 = fma(_334, _532, _544);
    float _548 = _540 * _540;
    float _550 = -_542;
    float _552 = fma(_336, _528, _550);
    float _554 = in.m_53.x;
    float _556 = in.m_53.y;
    float _558 = in.m_53.z;
    float _560 = fma(_546, _546, _548);
    float _562 = fma(_552, _552, _560);
    float _564 = rsqrt(_562);
    float _566 = _552 * _564;
    float _568 = _546 * _564;
    float _570 = _540 * _564;
    float _572 = in.m_51.x;
    float _574 = in.m_51.y;
    float _576 = in.m_51.z;
    float _578 = _332 * _566;
    float _580 = _334 * _570;
    float _582 = -_578;
    float _584 = fma(_334, _568, _582);
    float _586 = _336 * _568;
    float _588 = -_580;
    float _590 = fma(_336, _566, _588);
    float _592 = _584 * _584;
    float _594 = -_586;
    float _596 = fma(_332, _570, _594);
    float _598 = fma(_590, _590, _592);
    float _600 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _554);
    float _602 = fma(_596, _596, _598);
    float _604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _556);
    float _606 = rsqrt(_602);
    float _608 = _574 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _610 = _572 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _612 = _576 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _614 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _616 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _618 = _614 * _604;
    float _620 = _616 * _600;
    float _622 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _624 = _618 * _566;
    float _626 = _596 * _606;
    float _628 = _622 * _558;
    float _630 = _618 * _568;
    float _632 = _590 * _606;
    float _634 = fma(_620, _626, _624);
    float _636 = _618 * _570;
    float _638 = _584 * _606;
    float _640 = fma(_620, _632, _630);
    float _642 = fma(_628, _334, _634);
    float _644 = fma(_620, _638, _636);
    float _646 = fma(_628, _332, _640);
    float _648 = _296 + _642;
    float _650 = fma(_628, _336, _644);
    float _652 = _294 + _646;
    float _654 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _656 = _648 + _654;
    float _658 = _292 + _650;
    float _660 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _662 = _652 + _660;
    float _664 = _656 * _656;
    float _666 = fma(_662, _662, _664);
    float _668 = sqrt(_666);
    bool _670 = _668 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _672 = 0.0;
    float _674 = _652;
    float _676 = _648;
    float _678 = _656;
    float _680 = _606;
    int _682 = as_type<int>(_554);
    if (!_670)
    {
        _672 = _658;
    }
    float _684 = _672;
    bool _686 = !_670;
    float _688 = _684;
    if (!_686)
    {
        float _690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _694 = _668 + _692;
        float _696 = rsqrt(_666);
        float _698 = _694 * _690;
        float _700 = _658 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _702 = _698 * 0.15915493667125701904296875;
        float _704 = _702 * 6.283185482025146484375;
        float _706 = cos(_704);
        float _708 = _702 * 6.283185482025146484375;
        float _710 = sin(_708);
        float _712 = _706 + (-1.0);
        float _714 = _712 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _716 = fma(_710, _700, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _718 = fma(_658, _706, _714);
        float _720 = _696 * _716;
        float _722 = fma(_662, _720, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _724 = fma(_656, _720, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _688 = _718;
        _674 = _722;
        _676 = _724;
    }
    float _726 = _688;
    float _728 = _674;
    float _730 = _676;
    float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _734 = _726 + _732;
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _738 = _728 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _742 = _730 + _740;
    float _744 = _734 * _734;
    float _746 = fma(_738, _738, _744);
    float _748 = fma(_742, _742, _746);
    float _750 = rsqrt(_748);
    float _752 = sqrt(_748);
    float _754 = _750 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _756 = _738 * _754;
    float _758 = _742 * _754;
    float _760 = _756 * _756;
    float _762 = _758 * _758;
    float _764 = _760 + _762;
    float _766 = sqrt(_764);
    bool _768 = _766 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _770 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _772 = _766 + _770;
    float _774 = _746;
    float _776 = _764;
    float _778 = _772;
    float _780 = _734;
    if (_768)
    {
        float _782 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _774 = _782;
    }
    float _784 = _774;
    if (_768)
    {
        float _786 = rsqrt(_764);
        _776 = _786;
    }
    float _788 = _776;
    float _790 = _788;
    if (_768)
    {
        float _792 = _772 * _784;
        _778 = _792;
    }
    float _794 = _778;
    if (_768)
    {
        float _796 = _794 * 0.15915493667125701904296875;
        _678 = _796;
    }
    float _798 = _678;
    float _800 = _742;
    if (_768)
    {
        float _802 = _798 * 6.283185482025146484375;
        float _804 = sin(_802);
        _800 = _804;
    }
    float _806 = _800;
    float _808 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _810 = precise::max(0.0, _808);
    float _812 = _784;
    float _814 = _810;
    if (_768)
    {
        float _816 = _798 * 6.283185482025146484375;
        float _818 = cos(_816);
        _812 = _818;
    }
    float _820 = _812;
    float _822 = -_754;
    float _824 = -_810;
    float _826 = fma(_734, _822, _824);
    if (_768)
    {
        float _828 = _826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _780 = _828;
    }
    float _830 = _780;
    float _832 = _830;
    float _834 = _806;
    if (_768)
    {
        float _836 = fma(_806, _830, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _832 = _836;
    }
    float _838 = _832;
    float _840 = _838;
    if (!_768)
    {
        _834 = _756;
    }
    float _842 = _834;
    float _844 = _842;
    float _846 = _820;
    if (_768)
    {
        float _848 = _820 + (-1.0);
        _814 = _848;
    }
    float _850 = _814;
    float _852 = 0.0;
    float _854 = _850;
    if (_768)
    {
        float _856 = _788 * _838;
        _852 = _856;
    }
    float _858 = _852;
    if (!_768)
    {
        _840 = _826;
    }
    float _860 = _840;
    float _862 = _860;
    if (_768)
    {
        float _864 = _850 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _680 = _864;
    }
    float _866 = _680;
    if (_768)
    {
        float _868 = _756 * _858;
        _844 = _868;
    }
    float _870 = _844;
    if (!_768)
    {
        _854 = _758;
    }
    float _872 = _854;
    float _874 = _872;
    if (_768)
    {
        float _876 = _758 * _858;
        _874 = _876;
    }
    float _878 = _874;
    if (!_768)
    {
        _790 = _760;
    }
    float _880 = _790;
    float _882 = _880;
    if (_768)
    {
        float _884 = fma(_826, _820, _866);
        _862 = _884;
    }
    float _886 = _862;
    if (_768)
    {
        float _888 = _870 * _870;
        _882 = _888;
    }
    float _890 = _882;
    if (!_768)
    {
        _846 = _762;
    }
    float _892 = _846;
    float _894 = _892;
    if (_768)
    {
        float _896 = _878 * _878;
        _894 = _896;
    }
    float _898 = _894;
    float _900 = fma(_886, _886, _890);
    float _902 = _726 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _904 = _900 + _898;
    float _906 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[2].x, _902);
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _910 = fma(_752, (*spvDescriptorSet0.vp_c15)._m0[23].w, _908);
    float _912 = precise::clamp(_910, 0.0, 1.0);
    float _914 = _726 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _916 = rsqrt(_904);
    float _918 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[2].z, _906);
    float _920 = -_912;
    float _922 = _920 + 1.0;
    float _924 = _726 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _926 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[1].x, _914);
    float _928 = _918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _930 = _726 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _932 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[0].x, _924);
    float _934 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[1].z, _926);
    float _936 = abs(_922);
    float _938 = log2(_936);
    float _940 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[3].x, _930);
    float _942 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[0].z, _932);
    float _944 = _934 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _946 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _948 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[3].z, _940);
    float _950 = _942 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _952 = _944 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _954 = _916 * _870;
    float _956 = _948 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _958 = _916 * _886;
    float _960 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[7].x, _952);
    float _962 = _954 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _964 = _928 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _966 = _916 * _878;
    float _968 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[7].z, _960);
    float _970 = -_962;
    float _972 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[21].y, _970);
    float _974 = _938 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _976 = -_964;
    float _978 = fma(_976, _946, 1.0);
    float _980 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[7].w, _968);
    float _982 = -_966;
    float _984 = fma(_982, (*spvDescriptorSet0.vp_c15)._m0[21].z, _972);
    float _986 = _944 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _988 = log2(_978);
    float _990 = _944 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _992 = fma(_984, -0.5, 0.5);
    float _994 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[4].x, _986);
    float _996 = fma(_984, 0.5, 0.5);
    float _998 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[5].x, _990);
    float _1000 = _958 + 1.0;
    float _1002 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[4].z, _994);
    float _1004 = exp2(_974);
    float _1006 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[5].z, _998);
    float _1008 = fma(_996, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1010 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1002);
    float _1012 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1006);
    float _1014 = fma(_996, _1008, -0.212114393711090087890625);
    float _1016 = 1.0 / _980;
    float _1018 = _988 * 0.693147182464599609375;
    float _1020 = fma(_996, _1014, 1.570728778839111328125);
    float _1022 = _1018 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1024 = sqrt(_992);
    float _1026 = -_958;
    float _1028 = fma(_1004, _1000, _1026);
    float _1030 = fma(_1028, 0.5, 0.5);
    float _1032 = _1010 * _1016;
    float _1034 = _1012 * _1016;
    float _1036 = fma(_1032, 0.5, 0.5);
    float _1038 = fma(_1034, -0.5, 0.5);
    float _1040 = _1024 * 0.636619746685028076171875;
    float3 _3355 = float3(_1036, _1038, _1022);
    float _1042 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3355, float3(0.0), isnan(_3355)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3355, float3(0.0), isnan(_3355)), level(0.0)).x;
    float _1044 = -_1020;
    float _1046 = fma(_1040, _1044, 1.0);
    float3 _3371 = float3(_1036, _1038, _1022);
    float4 _1049 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3371, float3(0.0), isnan(_3371)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3371, float3(0.0), isnan(_3371)), level(0.0)).xyzw;
    float _1051 = _1049.x;
    float _1053 = _1049.y;
    float _1055 = _1049.z;
    float _1057 = _1049.w;
    float2 _3388 = float2(_1046, _1030);
    float3 _1061 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3388, float2(0.0), isnan(_3388)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3388, float2(0.0), isnan(_3388)), level(0.0)).xyz;
    float _1063 = _1061.x;
    float _1065 = _1061.y;
    float _1067 = _1061.z;
    float _1069 = in.m_55.x;
    float _1071 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1073 = in.m_57.x;
    int _1075 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1077 = _1075 != 0;
    float _1079 = _938 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1083 = _1081 != 0;
    float _1085 = in.m_55.y;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1089 = _1087 != 0;
    float _1091 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1093 = in.m_57.z;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1097 = in.m_57.y;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1101 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1103 = exp2(_1079);
    float _1105 = in.m_57.w;
    int _1107 = as_type<int>(_1036);
    float _1109 = _1022;
    float _1111 = _1095;
    float _1113 = _1069;
    float _1115 = _980;
    float _1117 = _1012;
    float _1119 = _1010;
    if (_1077)
    {
        float _1121 = -_1069;
        float _1123 = _1121 + 1.0;
        _1107 = as_type<int>(_1123);
    }
    int _1125 = _1107;
    if (!_1077)
    {
        _1109 = _1069;
    }
    float _1127 = _1109;
    float _1129 = in.m_59.x;
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1133 = false;
    float _1135 = _1127;
    if (_1077)
    {
        bool _1137 = _1073 > 0.5;
        _1133 = _1137;
    }
    bool _1139 = _1133;
    float _1141 = in.m_59.z;
    float _1143 = -_1085;
    float _1145 = _1143 + 1.0;
    float _1147 = _1085;
    if (_1077)
    {
        float _1149 = _1139 ? as_type<float>(_1125) : _1069;
        _1135 = _1149;
    }
    float _1151 = _1135;
    float _1153 = in.m_59.w;
    float _1155 = -_1103;
    float _1157 = _1155 + 1.0;
    bool _1159 = _1093 > 0.5;
    float _1161 = fma(_1101, _1151, -0.5);
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1165 = _1163 != 0;
    float _1167 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1169 = _1097 > 0.5;
    float _1171 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1099);
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1175 = _1173 != 0;
    float _1177 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1179 = _1105 > 0.5;
    float _1181 = _292 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1183 = _1169 ? as_type<int>(_1145) : as_type<int>(_1085);
    float _1185 = _292 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1187 = _1159 ? as_type<int>(_1145) : as_type<int>(_1085);
    float _1189 = _1157 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1191 = _1165 ? as_type<float>(_1183) : _1085;
    out.m_61.x = _1129;
    float _1193 = _1175 ? as_type<float>(_1187) : _1085;
    bool _1195 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1197 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan(0.5);
    bool _1203 = _1199 || _1201;
    float _1205 = fma(_1177, _1191, -0.5);
    if (_1083)
    {
        float _1207 = _1179 ? _1145 : _1085;
        _1147 = _1207;
    }
    float _1209 = _1147;
    out.m_61.z = _1141;
    bool _1211 = _556 != 0.0;
    bool _1213 = isnan(_556);
    bool _1215 = _1211 || _1213;
    bool _1217 = isnan(0.0);
    bool _1219 = _1215 || _1217;
    float _1221 = in.m_63.x;
    float _1223 = in.m_63.y;
    float _1225 = in.m_63.z;
    bool _1227 = _554 == 0.0;
    bool _1229 = !_1219;
    bool _1231 = _1227 && _1229;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1235 = _558 == 0.0;
    bool _1237 = _1235 && _1231;
    out.m_61.w = _1153;
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1241 = _1239 != 0;
    float _1243 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1247 = -_1233;
    float _1249 = fma(_1243, 2.0, _1247);
    float _1251 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1095);
    int _1253 = as_type<int>(_1251);
    if (!_1089)
    {
        _1111 = _1069;
    }
    float _1255 = _1111;
    float _1257 = fma(_1167, -2.0, _1245);
    float _1259 = -_134;
    float _1261 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1249);
    float _1263 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1251);
    float _1265 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1171);
    float _1267 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1257);
    float _1269 = fma(_1263, _1161, _1261);
    float _1271 = fma(_294, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1181);
    float _1273 = -_1267;
    float _1275 = fma(_1265, _1205, _1273);
    float _1277 = _1221;
    float _1279 = _1223;
    float _1281 = _1225;
    float _1283 = _1255;
    if (!_1237)
    {
        float _1285 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1221);
        _1277 = _1285;
    }
    float _1287 = _1277;
    if (_1089)
    {
        float _1289 = -_1069;
        float _1291 = _1289 + 1.0;
        _682 = as_type<int>(_1291);
    }
    int _1293 = _682;
    if (!_1237)
    {
        float _1295 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1223);
        _1279 = _1295;
    }
    float _1297 = _1279;
    if (!_1237)
    {
        float _1299 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1225);
        _1281 = _1299;
    }
    float _1301 = _1281;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_1089)
    {
        float _1305 = _1159 ? as_type<float>(_1293) : _1069;
        _1283 = _1305;
    }
    float _1307 = _1283;
    float _1309 = fma(_296, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1271);
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1313 = fma(_294, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1185);
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1317 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1321 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1323 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1325 = fma(_296, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1313);
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_65.x = _1321;
    out.m_65.y = _1317;
    out.m_65.z = _1323;
    out.m_65.w = _1303;
    if (_1241)
    {
        float _1333 = -_1069;
        float _1335 = _1333 + 1.0;
        _1253 = as_type<int>(_1335);
    }
    int _1337 = _1253;
    float _1339 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1343 = _1327 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1345 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1347 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1351 = _1347;
    if (_1241)
    {
        float _1353 = _1169 ? as_type<float>(_1337) : _1069;
        _1113 = _1353;
    }
    float _1355 = _1113;
    float _1357 = in.m_59.y;
    float _1359 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1361 = _568 * _1297;
    float _1363 = _570 * _1297;
    out.m_67.x = _1343;
    out.m_67.y = _1345;
    out.m_67.z = _1347;
    out.m_67.w = _1341;
    float _1365 = _1309 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1369 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1371 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1373 = _1339 + _1365;
    float _1375 = _1269 + 0.5;
    float _1377 = _566 * _1297;
    float _1379 = fma(_638, _1287, _1363);
    bool _1381 = _752 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1383 = isnan(_752);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1389 = _1385 || _1387;
    float _1391 = 1.0 / _1365;
    float _1393 = fma(_626, _1287, _1377);
    if (!_1203)
    {
        _1351 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1395 = _1351;
    float _1397 = _944 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1399 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1401 = _1369 * _1349;
    float _1403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1405 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1397);
    float _1407 = _1399 * _1131;
    float _1409 = _1359 * _1367;
    float _1411 = _1275 + 0.5;
    float _1413 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1405);
    out.m_61.y = _1357;
    float _1415 = _1373 * _1391;
    float _1417 = _1415 * 0.5;
    out.m_69.x = _1401;
    out.m_69.y = _1407;
    float _1419 = _1395;
    float _1421 = _1413;
    if (!_1203)
    {
        float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1425 = fma(_1417, _1395, _1423);
        _1419 = _1425;
    }
    float _1427 = _1419;
    float _1429 = _1371 * _1403;
    float _1431 = _1427;
    if (!_1203)
    {
        float _1433 = 1.0 / _1427;
        _1431 = _1433;
    }
    float _1435 = _1431;
    float _1437 = fma(_632, _1287, _1361);
    out.m_71.x = _1375;
    out.m_71.y = _1411;
    out.m_71.z = _1409;
    out.m_71.w = _1429;
    float _1439 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1413);
    float _1441 = _1439;
    if (!_1203)
    {
        _1421 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1443 = _1421;
    float _1445 = fma(_332, _1301, _1437);
    float _1447 = _1439 + _980;
    out.gl_Position.x = _1010;
    out.gl_Position.y = _1012;
    out.gl_Position.z = _1439;
    out.gl_Position.w = _980;
    float _1449 = _1447 * 0.5;
    float _1451 = fma(_336, _1301, _1379);
    float _1453 = fma(_334, _1301, _1393);
    float _1455 = _1435;
    float _1457 = _1443;
    if (!_1203)
    {
        float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1461 = -_1443;
        float _1463 = fma(_1435, _1459, _1461);
        _1455 = _1463;
    }
    float _1465 = _1455;
    if (!_1203)
    {
        float _1467 = -_1443;
        float _1469 = _1467 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1457 = _1469;
    }
    float _1471 = _1457;
    out.m_73.z = _1449;
    out.m_73.w = _980;
    out.m_75.x = _1445;
    out.m_75.y = _1451;
    out.m_75.z = _1453;
    float _1473 = _1471;
    if (!_1203)
    {
        float _1475 = 1.0 / _1471;
        _1473 = _1475;
    }
    float _1477 = _1473;
    if (_1203)
    {
        _1115 = 1.0;
    }
    float _1479 = _1115;
    float _1481 = _1479;
    if (!_1389)
    {
        _1441 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1483 = _1441;
    float _1485 = _1483;
    float _1487 = _1483;
    if (!_1389)
    {
        _1117 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1489 = _1117;
    float _1491 = _1489;
    float _1493 = _1489;
    if (!_1389)
    {
        _1119 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1495 = _1119;
    float _1497 = _1495;
    float _1499 = _1495;
    if (!_1203)
    {
        float _1501 = _1465 * _1477;
        float _1503 = precise::clamp(_1501, 0.0, 1.0);
        _1481 = _1503;
    }
    float _1505 = _1481;
    float _1507 = _1505 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1509 = _1189 * _1042;
    float _1511 = _1057 * _1509;
    float _1513 = _1067 * _1509;
    float _1515 = fma(_1063, _1511, _1051);
    float _1517 = -_1189;
    float _1519 = _1517 + 1.0;
    float _1521 = fma(_1065, _1511, _1053);
    float _1523 = fma(_1057, _1513, _1055);
    float _1525 = _1057 * _1519;
    out.m_77.x = _1515;
    out.m_77.y = _1521;
    out.m_77.z = _1523;
    out.m_77.w = _1525;
    bool _1527 = !_1389;
    if (!_1527)
    {
        bool _1529 = _752 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1531 = isnan(_752);
        bool _1533 = _1529 || _1531;
        bool _1535 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1537 = _1533 || _1535;
        if (!_1537)
        {
            float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1541 = _752 + _1539;
            float _1543 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1545 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1543;
            float _1547 = 1.0 / _1545;
            float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1551 = _1549 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1555 = _1553 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1557 = _1541 * _1547;
            float _1559 = precise::clamp(_1557, 0.0, 1.0);
            float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1563 = _1561 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1565 = fma(_1559, _1555, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1567 = fma(_1559, _1563, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1569 = fma(_1559, _1551, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1493 = _1569;
            _1487 = _1567;
            _1499 = _1565;
            _1571 = true;
        }
        else
        {
            bool _1573 = _752 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1575 = isnan(_752);
            bool _1577 = _1573 || _1575;
            bool _1579 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1581 = _1577 || _1579;
            if (!_1581)
            {
                _1485 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1583 = _1485;
            _1487 = _1583;
            if (!_1581)
            {
                _1491 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1585 = _1491;
            _1493 = _1585;
            if (!_1581)
            {
                _1497 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1587 = _1497;
            bool _1589 = !_1581;
            _1499 = _1587;
            if (!_1589)
            {
                bool _1591 = _752 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1593 = isnan(_752);
                bool _1595 = _1591 || _1593;
                bool _1597 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1599 = _1595 || _1597;
                if (!_1599)
                {
                    float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1603 = _752 + _1601;
                    float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1607 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1605;
                    float _1609 = 1.0 / _1607;
                    float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1613 = _1611 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1619 = _1603 * _1609;
                    float _1621 = precise::clamp(_1619, 0.0, 1.0);
                    float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1625 = _1623 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1627 = fma(_1621, _1617, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1629 = fma(_1621, _1625, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1631 = fma(_1621, _1613, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1493 = _1631;
                    _1487 = _1629;
                    _1499 = _1627;
                    _1571 = true;
                }
                else
                {
                    _1493 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1487 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1499 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1571 = false;
    float _1633 = _1493;
    float _1635 = _1487;
    float _1637 = _1499;
    float _1639 = _1507 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.x = 0.0;
    float _1641 = _1633 * 0.586610972881317138671875;
    bool _1643 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _1639;
    float _1645 = fma(_1635, 0.298911988735198974609375, _1641);
    bool _1647 = _1505 > 0.0;
    bool _1649 = isnan(_1505);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan(0.0);
    bool _1655 = _1651 || _1653;
    float _1657 = fma(_1637, 0.114477999508380889892578125, _1645);
    float _1659 = -_1657;
    float _1661 = _1659 + _1635;
    float _1663 = -_1657;
    float _1665 = _1663 + _1633;
    float _1667 = -_1657;
    float _1669 = _1667 + _1637;
    float _1671 = fma(_1661, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1657);
    float _1673 = fma(_1665, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1657);
    float _1675 = fma(_1669, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1657);
    bool _1677 = !_1643;
    if (!_1677)
    {
        float _1679 = -_726;
        float _1681 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1683 = -_728;
        float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1687 = -_730;
        float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1691 = _1681 * _1681;
        float _1693 = fma(_1685, _1685, _1691);
        float _1695 = fma(_1689, _1689, _1693);
        float _1697 = sqrt(_1695);
        float _1699 = rsqrt(_1695);
        float _1701 = -_1697;
        float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1705 = _1703 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1707 = precise::clamp(_1705, 0.0, 1.0);
        float _1709 = _1685 * _1699;
        float _1711 = _1681 * _1699;
        float _1713 = abs(_1707);
        float _1715 = log2(_1713);
        float _1717 = _1689 * _1699;
        float _1719 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1721 = _1451 * _1711;
        float _1723 = -_1711;
        float _1725 = -_1719;
        float _1727 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1725);
        float _1729 = fma(_1445, _1709, _1721);
        float _1731 = -_1717;
        float _1733 = fma(_1731, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1727);
        float _1735 = fma(_1453, _1717, _1729);
        float _1737 = precise::clamp(_1735, 0.0, 1.0);
        float _1739 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1741 = _1733 + _1739;
        float _1743 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1745 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1747 = precise::clamp(_1745, 0.0, 1.0);
        float _1749 = exp2(_1743);
        float _1751 = _1749 * _1747;
        float _1753 = _1737 * _1751;
        float _1755 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1757 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1759 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _1755;
        out.m_79.y = _1757;
        out.m_79.z = _1759;
    }
    out.m_81.x = _1671;
    out.m_81.y = _1673;
    out.m_81.z = _1675;
    if (_1655)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1761 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1761;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1571 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
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
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1819 = as_type<float>(_116);
        out.gl_Position.z = _1819;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_49.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_100);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1888 = as_type<float>(_152);
        out.gl_Position.z = _1888;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_51.w;
    float _156 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = in.m_44.x;
    float _176 = in.m_44.y;
    float _178 = in.m_44.z;
    float _180 = 0.0;
    float _182 = _156;
    if (!_166)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_166)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_166;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _156 * _202;
        float _212 = exp2(_210);
        float _214 = _208 * 0.693147182464599609375;
        float _216 = 1.0 / _214;
        float _218 = 1.0 / _206;
        float _220 = _212 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _216, _156);
        float _226 = _224 * _218;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_166;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _156 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    float _256 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_254, _170, _256);
    float _264 = fma(_254, _168, _258);
    float _266 = fma(_254, _172, _260);
    float _268 = fma(_262, _154, _176);
    float _270 = fma(_264, _154, _174);
    float _272 = fma(_266, _154, _178);
    float _274 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _276 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _278 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _280 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _274);
    float _282 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _276);
    float _284 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _278);
    float _286 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _280);
    float _288 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _282);
    float _290 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _284);
    float _292 = _286 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _294 = _288 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _296 = _290 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _298 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _300 = -_292;
    float _302 = _300 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _304 = -_294;
    float _306 = _304 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _308 = -_296;
    float _310 = _308 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _312 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _314 = _302 * _302;
    float _316 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _318 = -_298;
    float _320 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _318);
    float _322 = -_312;
    float _324 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _322);
    float _326 = fma(_306, _306, _314);
    float _328 = fma(_310, _310, _326);
    float _330 = rsqrt(_328);
    float _332 = _306 * _330;
    float _334 = _310 * _330;
    float _336 = _302 * _330;
    float _338 = _332 * _332;
    float _340 = fma(_334, _334, _338);
    float _342 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _344 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _346 = rsqrt(_340);
    float _348 = -_342;
    float _350 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _348);
    float _352 = -_344;
    float _354 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _352);
    float _356 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _358 = _350 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _360 = _354 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _362 = -_356;
    float _364 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _362);
    float _366 = -_316;
    float _368 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _366);
    float _370 = _354 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _372 = -_358;
    float _374 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[1].y, _372);
    float _376 = -_360;
    float _378 = fma(_350, (*spvDescriptorSet0.vp_c8)._m0[1].x, _376);
    float _380 = _368 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _382 = -_370;
    float _384 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _382);
    float _386 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[1].w, _374);
    float _388 = _334 * _346;
    float _390 = _332 * _346;
    float _392 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[1].w, _384);
    float _394 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[1].w, _378);
    float _396 = -_388;
    float _398 = _334 * _396;
    float _400 = -_388;
    float _402 = _336 * _400;
    float _404 = _392 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _406 = -_398;
    float _408 = fma(_332, _390, _406);
    float _410 = _336 * _390;
    float _412 = -_404;
    float _414 = fma(_386, (*spvDescriptorSet0.vp_c8)._m0[0].x, _412);
    float _416 = -_380;
    float _418 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _416);
    float _420 = _408 * _408;
    float _422 = _354 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _424 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[0].z, _414);
    float _426 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[1].z, _418);
    float _428 = fma(_410, _410, _420);
    float _430 = -_422;
    float _432 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _430);
    float _434 = _350 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _436 = -_426;
    float _438 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[0].w, _424);
    float _440 = fma(_402, _402, _428);
    float _442 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[0].w, _432);
    float _444 = -_434;
    float _446 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[0].y, _444);
    float _448 = 1.0 / _438;
    float _450 = _354 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _452 = fma(_324, (*spvDescriptorSet0.vp_c8)._m0[0].w, _446);
    float _454 = -_450;
    float _456 = fma(_350, (*spvDescriptorSet0.vp_c8)._m0[0].x, _454);
    float _458 = rsqrt(_440);
    float _460 = fma(_364, (*spvDescriptorSet0.vp_c8)._m0[0].w, _456);
    float _462 = fma(_442, _448, -1.0);
    float _464 = _408 * _458;
    float _466 = precise::clamp(_464, 0.0, 1.0);
    float _468 = -_466;
    float _470 = _468 + 1.0;
    float _472 = _470 * _448;
    float _474 = fma(_470, _462, 1.0);
    float _476 = _452 * _472;
    float _478 = _474 * _474;
    float _480 = _460 * _472;
    float _482 = fma(_476, _476, _478);
    float _484 = fma(_480, _480, _482);
    float _486 = rsqrt(_484);
    float _488 = _480 * _486;
    float _490 = _476 * _486;
    float _492 = _474 * _486;
    float _494 = -_488;
    float _496 = _332 * _494;
    float _498 = _334 * _492;
    float _500 = -_490;
    float _502 = -_496;
    float _504 = fma(_334, _500, _502);
    float _506 = -_490;
    float _508 = _336 * _506;
    float _510 = -_488;
    float _512 = -_498;
    float _514 = fma(_336, _510, _512);
    float _516 = _504 * _504;
    float _518 = -_508;
    float _520 = fma(_332, _492, _518);
    float _522 = fma(_514, _514, _516);
    float _524 = fma(_520, _520, _522);
    float _526 = rsqrt(_524);
    float _528 = _514 * _526;
    float _530 = _520 * _526;
    float _532 = _504 * _526;
    float _534 = _334 * _528;
    float _536 = _336 * _530;
    float _538 = -_534;
    float _540 = fma(_332, _530, _538);
    float _542 = _332 * _532;
    float _544 = -_536;
    float _546 = fma(_334, _532, _544);
    float _548 = _540 * _540;
    float _550 = -_542;
    float _552 = fma(_336, _528, _550);
    float _554 = in.m_53.x;
    float _556 = in.m_53.y;
    float _558 = in.m_53.z;
    float _560 = fma(_546, _546, _548);
    float _562 = fma(_552, _552, _560);
    float _564 = rsqrt(_562);
    float _566 = _552 * _564;
    float _568 = _546 * _564;
    float _570 = _540 * _564;
    float _572 = in.m_51.x;
    float _574 = in.m_51.y;
    float _576 = in.m_51.z;
    float _578 = _332 * _566;
    float _580 = _334 * _570;
    float _582 = -_578;
    float _584 = fma(_334, _568, _582);
    float _586 = _336 * _568;
    float _588 = -_580;
    float _590 = fma(_336, _566, _588);
    float _592 = _584 * _584;
    float _594 = -_586;
    float _596 = fma(_332, _570, _594);
    float _598 = fma(_590, _590, _592);
    float _600 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _554);
    float _602 = fma(_596, _596, _598);
    float _604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _556);
    float _606 = rsqrt(_602);
    float _608 = _574 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _610 = _572 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _612 = _576 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _614 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _616 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _618 = _614 * _604;
    float _620 = _616 * _600;
    float _622 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _624 = _618 * _566;
    float _626 = _596 * _606;
    float _628 = _622 * _558;
    float _630 = _618 * _568;
    float _632 = _590 * _606;
    float _634 = fma(_620, _626, _624);
    float _636 = _618 * _570;
    float _638 = _584 * _606;
    float _640 = fma(_620, _632, _630);
    float _642 = fma(_628, _334, _634);
    float _644 = fma(_620, _638, _636);
    float _646 = fma(_628, _332, _640);
    float _648 = _296 + _642;
    float _650 = fma(_628, _336, _644);
    float _652 = _294 + _646;
    float _654 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _656 = _648 + _654;
    float _658 = _292 + _650;
    float _660 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _662 = _652 + _660;
    float _664 = _656 * _656;
    float _666 = fma(_662, _662, _664);
    float _668 = sqrt(_666);
    bool _670 = _668 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _672 = 0.0;
    float _674 = _652;
    float _676 = _648;
    float _678 = _656;
    float _680 = _606;
    int _682 = as_type<int>(_554);
    if (!_670)
    {
        _672 = _658;
    }
    float _684 = _672;
    bool _686 = !_670;
    float _688 = _684;
    if (!_686)
    {
        float _690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _694 = _668 + _692;
        float _696 = rsqrt(_666);
        float _698 = _694 * _690;
        float _700 = _658 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _702 = _698 * 0.15915493667125701904296875;
        float _704 = _702 * 6.283185482025146484375;
        float _706 = cos(_704);
        float _708 = _702 * 6.283185482025146484375;
        float _710 = sin(_708);
        float _712 = _706 + (-1.0);
        float _714 = _712 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _716 = fma(_710, _700, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _718 = fma(_658, _706, _714);
        float _720 = _696 * _716;
        float _722 = fma(_662, _720, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _724 = fma(_656, _720, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _688 = _718;
        _674 = _722;
        _676 = _724;
    }
    float _726 = _688;
    float _728 = _674;
    float _730 = _676;
    float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _734 = _726 + _732;
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _738 = _728 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _742 = _730 + _740;
    float _744 = _734 * _734;
    float _746 = fma(_738, _738, _744);
    float _748 = fma(_742, _742, _746);
    float _750 = rsqrt(_748);
    float _752 = sqrt(_748);
    float _754 = _750 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _756 = _738 * _754;
    float _758 = _742 * _754;
    float _760 = _756 * _756;
    float _762 = _758 * _758;
    float _764 = _760 + _762;
    float _766 = sqrt(_764);
    bool _768 = _766 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _770 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _772 = _766 + _770;
    float _774 = _746;
    float _776 = _764;
    float _778 = _772;
    float _780 = _734;
    if (_768)
    {
        float _782 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _774 = _782;
    }
    float _784 = _774;
    if (_768)
    {
        float _786 = rsqrt(_764);
        _776 = _786;
    }
    float _788 = _776;
    float _790 = _788;
    if (_768)
    {
        float _792 = _772 * _784;
        _778 = _792;
    }
    float _794 = _778;
    if (_768)
    {
        float _796 = _794 * 0.15915493667125701904296875;
        _678 = _796;
    }
    float _798 = _678;
    float _800 = _742;
    if (_768)
    {
        float _802 = _798 * 6.283185482025146484375;
        float _804 = sin(_802);
        _800 = _804;
    }
    float _806 = _800;
    float _808 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _810 = precise::max(0.0, _808);
    float _812 = _784;
    float _814 = _810;
    if (_768)
    {
        float _816 = _798 * 6.283185482025146484375;
        float _818 = cos(_816);
        _812 = _818;
    }
    float _820 = _812;
    float _822 = -_754;
    float _824 = -_810;
    float _826 = fma(_734, _822, _824);
    if (_768)
    {
        float _828 = _826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _780 = _828;
    }
    float _830 = _780;
    float _832 = _830;
    float _834 = _806;
    if (_768)
    {
        float _836 = fma(_806, _830, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _832 = _836;
    }
    float _838 = _832;
    float _840 = _838;
    if (!_768)
    {
        _834 = _756;
    }
    float _842 = _834;
    float _844 = _842;
    float _846 = _820;
    if (_768)
    {
        float _848 = _820 + (-1.0);
        _814 = _848;
    }
    float _850 = _814;
    float _852 = 0.0;
    float _854 = _850;
    if (_768)
    {
        float _856 = _788 * _838;
        _852 = _856;
    }
    float _858 = _852;
    if (!_768)
    {
        _840 = _826;
    }
    float _860 = _840;
    float _862 = _860;
    if (_768)
    {
        float _864 = _850 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _680 = _864;
    }
    float _866 = _680;
    if (_768)
    {
        float _868 = _756 * _858;
        _844 = _868;
    }
    float _870 = _844;
    if (!_768)
    {
        _854 = _758;
    }
    float _872 = _854;
    float _874 = _872;
    if (_768)
    {
        float _876 = _758 * _858;
        _874 = _876;
    }
    float _878 = _874;
    if (!_768)
    {
        _790 = _760;
    }
    float _880 = _790;
    float _882 = _880;
    if (_768)
    {
        float _884 = fma(_826, _820, _866);
        _862 = _884;
    }
    float _886 = _862;
    if (_768)
    {
        float _888 = _870 * _870;
        _882 = _888;
    }
    float _890 = _882;
    if (!_768)
    {
        _846 = _762;
    }
    float _892 = _846;
    float _894 = _892;
    if (_768)
    {
        float _896 = _878 * _878;
        _894 = _896;
    }
    float _898 = _894;
    float _900 = fma(_886, _886, _890);
    float _902 = _726 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _904 = _900 + _898;
    float _906 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[2].x, _902);
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _910 = fma(_752, (*spvDescriptorSet0.vp_c15)._m0[23].w, _908);
    float _912 = precise::clamp(_910, 0.0, 1.0);
    float _914 = _726 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _916 = rsqrt(_904);
    float _918 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[2].z, _906);
    float _920 = -_912;
    float _922 = _920 + 1.0;
    float _924 = _726 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _926 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[1].x, _914);
    float _928 = _918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _930 = _726 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _932 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[0].x, _924);
    float _934 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[1].z, _926);
    float _936 = abs(_922);
    float _938 = log2(_936);
    float _940 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[3].x, _930);
    float _942 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[0].z, _932);
    float _944 = _934 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _946 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _948 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[3].z, _940);
    float _950 = _942 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _952 = _944 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _954 = _916 * _870;
    float _956 = _948 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _958 = _916 * _886;
    float _960 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[7].x, _952);
    float _962 = _954 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _964 = _928 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _966 = _916 * _878;
    float _968 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[7].z, _960);
    float _970 = -_962;
    float _972 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[21].y, _970);
    float _974 = _938 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _976 = -_964;
    float _978 = fma(_976, _946, 1.0);
    float _980 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[7].w, _968);
    float _982 = -_966;
    float _984 = fma(_982, (*spvDescriptorSet0.vp_c15)._m0[21].z, _972);
    float _986 = _944 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _988 = log2(_978);
    float _990 = _944 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _992 = fma(_984, -0.5, 0.5);
    float _994 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[4].x, _986);
    float _996 = fma(_984, 0.5, 0.5);
    float _998 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[5].x, _990);
    float _1000 = _958 + 1.0;
    float _1002 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[4].z, _994);
    float _1004 = exp2(_974);
    float _1006 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[5].z, _998);
    float _1008 = fma(_996, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1010 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1002);
    float _1012 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1006);
    float _1014 = fma(_996, _1008, -0.212114393711090087890625);
    float _1016 = 1.0 / _980;
    float _1018 = _988 * 0.693147182464599609375;
    float _1020 = fma(_996, _1014, 1.570728778839111328125);
    float _1022 = _1018 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1024 = sqrt(_992);
    float _1026 = -_958;
    float _1028 = fma(_1004, _1000, _1026);
    float _1030 = fma(_1028, 0.5, 0.5);
    float _1032 = _1010 * _1016;
    float _1034 = _1012 * _1016;
    float _1036 = fma(_1032, 0.5, 0.5);
    float _1038 = fma(_1034, -0.5, 0.5);
    float _1040 = _1024 * 0.636619746685028076171875;
    float3 _3355 = float3(_1036, _1038, _1022);
    float _1042 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3355, float3(0.0), isnan(_3355)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3355, float3(0.0), isnan(_3355)), level(0.0)).x;
    float _1044 = -_1020;
    float _1046 = fma(_1040, _1044, 1.0);
    float3 _3371 = float3(_1036, _1038, _1022);
    float4 _1049 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3371, float3(0.0), isnan(_3371)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3371, float3(0.0), isnan(_3371)), level(0.0)).xyzw;
    float _1051 = _1049.x;
    float _1053 = _1049.y;
    float _1055 = _1049.z;
    float _1057 = _1049.w;
    float2 _3388 = float2(_1046, _1030);
    float3 _1061 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3388, float2(0.0), isnan(_3388)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3388, float2(0.0), isnan(_3388)), level(0.0)).xyz;
    float _1063 = _1061.x;
    float _1065 = _1061.y;
    float _1067 = _1061.z;
    float _1069 = in.m_55.x;
    float _1071 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1073 = in.m_57.x;
    int _1075 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1077 = _1075 != 0;
    float _1079 = _938 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1083 = _1081 != 0;
    float _1085 = in.m_55.y;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1089 = _1087 != 0;
    float _1091 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1093 = in.m_57.z;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1097 = in.m_57.y;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1101 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1103 = exp2(_1079);
    float _1105 = in.m_57.w;
    int _1107 = as_type<int>(_1036);
    float _1109 = _1022;
    float _1111 = _1095;
    float _1113 = _1069;
    float _1115 = _980;
    float _1117 = _1012;
    float _1119 = _1010;
    if (_1077)
    {
        float _1121 = -_1069;
        float _1123 = _1121 + 1.0;
        _1107 = as_type<int>(_1123);
    }
    int _1125 = _1107;
    if (!_1077)
    {
        _1109 = _1069;
    }
    float _1127 = _1109;
    float _1129 = in.m_59.x;
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1133 = false;
    float _1135 = _1127;
    if (_1077)
    {
        bool _1137 = _1073 > 0.5;
        _1133 = _1137;
    }
    bool _1139 = _1133;
    float _1141 = in.m_59.z;
    float _1143 = -_1085;
    float _1145 = _1143 + 1.0;
    float _1147 = _1085;
    if (_1077)
    {
        float _1149 = _1139 ? as_type<float>(_1125) : _1069;
        _1135 = _1149;
    }
    float _1151 = _1135;
    float _1153 = in.m_59.w;
    float _1155 = -_1103;
    float _1157 = _1155 + 1.0;
    bool _1159 = _1093 > 0.5;
    float _1161 = fma(_1101, _1151, -0.5);
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1165 = _1163 != 0;
    float _1167 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1169 = _1097 > 0.5;
    float _1171 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1099);
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1175 = _1173 != 0;
    float _1177 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1179 = _1105 > 0.5;
    float _1181 = _292 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1183 = _1169 ? as_type<int>(_1145) : as_type<int>(_1085);
    float _1185 = _292 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1187 = _1159 ? as_type<int>(_1145) : as_type<int>(_1085);
    float _1189 = _1157 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1191 = _1165 ? as_type<float>(_1183) : _1085;
    out.m_61.x = _1129;
    float _1193 = _1175 ? as_type<float>(_1187) : _1085;
    bool _1195 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1197 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan(0.5);
    bool _1203 = _1199 || _1201;
    float _1205 = fma(_1177, _1191, -0.5);
    if (_1083)
    {
        float _1207 = _1179 ? _1145 : _1085;
        _1147 = _1207;
    }
    float _1209 = _1147;
    out.m_61.z = _1141;
    bool _1211 = _556 != 0.0;
    bool _1213 = isnan(_556);
    bool _1215 = _1211 || _1213;
    bool _1217 = isnan(0.0);
    bool _1219 = _1215 || _1217;
    float _1221 = in.m_63.x;
    float _1223 = in.m_63.y;
    float _1225 = in.m_63.z;
    bool _1227 = _554 == 0.0;
    bool _1229 = !_1219;
    bool _1231 = _1227 && _1229;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1235 = _558 == 0.0;
    bool _1237 = _1235 && _1231;
    out.m_61.w = _1153;
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1241 = _1239 != 0;
    float _1243 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1247 = -_1233;
    float _1249 = fma(_1243, 2.0, _1247);
    float _1251 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1095);
    int _1253 = as_type<int>(_1251);
    if (!_1089)
    {
        _1111 = _1069;
    }
    float _1255 = _1111;
    float _1257 = fma(_1167, -2.0, _1245);
    float _1259 = -_134;
    float _1261 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1249);
    float _1263 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1251);
    float _1265 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1171);
    float _1267 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1257);
    float _1269 = fma(_1263, _1161, _1261);
    float _1271 = fma(_294, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1181);
    float _1273 = -_1267;
    float _1275 = fma(_1265, _1205, _1273);
    float _1277 = _1221;
    float _1279 = _1223;
    float _1281 = _1225;
    float _1283 = _1255;
    if (!_1237)
    {
        float _1285 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1221);
        _1277 = _1285;
    }
    float _1287 = _1277;
    if (_1089)
    {
        float _1289 = -_1069;
        float _1291 = _1289 + 1.0;
        _682 = as_type<int>(_1291);
    }
    int _1293 = _682;
    if (!_1237)
    {
        float _1295 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1223);
        _1279 = _1295;
    }
    float _1297 = _1279;
    if (!_1237)
    {
        float _1299 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1225);
        _1281 = _1299;
    }
    float _1301 = _1281;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_1089)
    {
        float _1305 = _1159 ? as_type<float>(_1293) : _1069;
        _1283 = _1305;
    }
    float _1307 = _1283;
    float _1309 = fma(_296, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1271);
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1313 = fma(_294, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1185);
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1317 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1321 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1323 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1325 = fma(_296, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1313);
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_65.x = _1321;
    out.m_65.y = _1317;
    out.m_65.z = _1323;
    out.m_65.w = _1303;
    if (_1241)
    {
        float _1333 = -_1069;
        float _1335 = _1333 + 1.0;
        _1253 = as_type<int>(_1335);
    }
    int _1337 = _1253;
    float _1339 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1341 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1343 = _1327 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1345 = _1329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1347 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1351 = _1347;
    if (_1241)
    {
        float _1353 = _1169 ? as_type<float>(_1337) : _1069;
        _1113 = _1353;
    }
    float _1355 = _1113;
    float _1357 = in.m_59.y;
    float _1359 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1361 = _568 * _1297;
    float _1363 = _570 * _1297;
    out.m_67.x = _1343;
    out.m_67.y = _1345;
    out.m_67.z = _1347;
    out.m_67.w = _1341;
    float _1365 = _1309 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1369 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1371 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1373 = _1339 + _1365;
    float _1375 = _1269 + 0.5;
    float _1377 = _566 * _1297;
    float _1379 = fma(_638, _1287, _1363);
    bool _1381 = _752 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1383 = isnan(_752);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1389 = _1385 || _1387;
    float _1391 = 1.0 / _1365;
    float _1393 = fma(_626, _1287, _1377);
    if (!_1203)
    {
        _1351 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1395 = _1351;
    float _1397 = _944 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1399 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1401 = _1369 * _1349;
    float _1403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1405 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1397);
    float _1407 = _1399 * _1131;
    float _1409 = _1359 * _1367;
    float _1411 = _1275 + 0.5;
    float _1413 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1405);
    out.m_61.y = _1357;
    float _1415 = _1373 * _1391;
    float _1417 = _1415 * 0.5;
    out.m_69.x = _1401;
    out.m_69.y = _1407;
    float _1419 = _1395;
    float _1421 = _1413;
    if (!_1203)
    {
        float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1425 = fma(_1417, _1395, _1423);
        _1419 = _1425;
    }
    float _1427 = _1419;
    float _1429 = _1371 * _1403;
    float _1431 = _1427;
    if (!_1203)
    {
        float _1433 = 1.0 / _1427;
        _1431 = _1433;
    }
    float _1435 = _1431;
    float _1437 = fma(_632, _1287, _1361);
    out.m_71.x = _1375;
    out.m_71.y = _1411;
    out.m_71.z = _1409;
    out.m_71.w = _1429;
    float _1439 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1413);
    float _1441 = _1439;
    if (!_1203)
    {
        _1421 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1443 = _1421;
    float _1445 = fma(_332, _1301, _1437);
    float _1447 = _1439 + _980;
    out.gl_Position.x = _1010;
    out.gl_Position.y = _1012;
    out.gl_Position.z = _1439;
    out.gl_Position.w = _980;
    float _1449 = _1447 * 0.5;
    float _1451 = fma(_336, _1301, _1379);
    float _1453 = fma(_334, _1301, _1393);
    float _1455 = _1435;
    float _1457 = _1443;
    if (!_1203)
    {
        float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1461 = -_1443;
        float _1463 = fma(_1435, _1459, _1461);
        _1455 = _1463;
    }
    float _1465 = _1455;
    if (!_1203)
    {
        float _1467 = -_1443;
        float _1469 = _1467 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1457 = _1469;
    }
    float _1471 = _1457;
    out.m_73.z = _1449;
    out.m_73.w = _980;
    out.m_75.x = _1445;
    out.m_75.y = _1451;
    out.m_75.z = _1453;
    float _1473 = _1471;
    if (!_1203)
    {
        float _1475 = 1.0 / _1471;
        _1473 = _1475;
    }
    float _1477 = _1473;
    if (_1203)
    {
        _1115 = 1.0;
    }
    float _1479 = _1115;
    float _1481 = _1479;
    if (!_1389)
    {
        _1441 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1483 = _1441;
    float _1485 = _1483;
    float _1487 = _1483;
    if (!_1389)
    {
        _1117 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1489 = _1117;
    float _1491 = _1489;
    float _1493 = _1489;
    if (!_1389)
    {
        _1119 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1495 = _1119;
    float _1497 = _1495;
    float _1499 = _1495;
    if (!_1203)
    {
        float _1501 = _1465 * _1477;
        float _1503 = precise::clamp(_1501, 0.0, 1.0);
        _1481 = _1503;
    }
    float _1505 = _1481;
    float _1507 = _1505 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1509 = _1189 * _1042;
    float _1511 = _1057 * _1509;
    float _1513 = _1067 * _1509;
    float _1515 = fma(_1063, _1511, _1051);
    float _1517 = -_1189;
    float _1519 = _1517 + 1.0;
    float _1521 = fma(_1065, _1511, _1053);
    float _1523 = fma(_1057, _1513, _1055);
    float _1525 = _1057 * _1519;
    out.m_77.x = _1515;
    out.m_77.y = _1521;
    out.m_77.z = _1523;
    out.m_77.w = _1525;
    bool _1527 = !_1389;
    if (!_1527)
    {
        bool _1529 = _752 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1531 = isnan(_752);
        bool _1533 = _1529 || _1531;
        bool _1535 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1537 = _1533 || _1535;
        if (!_1537)
        {
            float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1541 = _752 + _1539;
            float _1543 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1545 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1543;
            float _1547 = 1.0 / _1545;
            float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1551 = _1549 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1555 = _1553 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1557 = _1541 * _1547;
            float _1559 = precise::clamp(_1557, 0.0, 1.0);
            float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1563 = _1561 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1565 = fma(_1559, _1555, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1567 = fma(_1559, _1563, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1569 = fma(_1559, _1551, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1493 = _1569;
            _1487 = _1567;
            _1499 = _1565;
            _1571 = true;
        }
        else
        {
            bool _1573 = _752 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1575 = isnan(_752);
            bool _1577 = _1573 || _1575;
            bool _1579 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1581 = _1577 || _1579;
            if (!_1581)
            {
                _1485 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1583 = _1485;
            _1487 = _1583;
            if (!_1581)
            {
                _1491 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1585 = _1491;
            _1493 = _1585;
            if (!_1581)
            {
                _1497 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1587 = _1497;
            bool _1589 = !_1581;
            _1499 = _1587;
            if (!_1589)
            {
                bool _1591 = _752 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1593 = isnan(_752);
                bool _1595 = _1591 || _1593;
                bool _1597 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1599 = _1595 || _1597;
                if (!_1599)
                {
                    float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1603 = _752 + _1601;
                    float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1607 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1605;
                    float _1609 = 1.0 / _1607;
                    float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1613 = _1611 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1619 = _1603 * _1609;
                    float _1621 = precise::clamp(_1619, 0.0, 1.0);
                    float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1625 = _1623 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1627 = fma(_1621, _1617, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1629 = fma(_1621, _1625, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1631 = fma(_1621, _1613, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1493 = _1631;
                    _1487 = _1629;
                    _1499 = _1627;
                    _1571 = true;
                }
                else
                {
                    _1493 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1487 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1499 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1571 = false;
    float _1633 = _1493;
    float _1635 = _1487;
    float _1637 = _1499;
    float _1639 = _1507 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.x = 0.0;
    float _1641 = _1633 * 0.586610972881317138671875;
    bool _1643 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _1639;
    float _1645 = fma(_1635, 0.298911988735198974609375, _1641);
    bool _1647 = _1505 > 0.0;
    bool _1649 = isnan(_1505);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan(0.0);
    bool _1655 = _1651 || _1653;
    float _1657 = fma(_1637, 0.114477999508380889892578125, _1645);
    float _1659 = -_1657;
    float _1661 = _1659 + _1635;
    float _1663 = -_1657;
    float _1665 = _1663 + _1633;
    float _1667 = -_1657;
    float _1669 = _1667 + _1637;
    float _1671 = fma(_1661, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1657);
    float _1673 = fma(_1665, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1657);
    float _1675 = fma(_1669, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1657);
    bool _1677 = !_1643;
    if (!_1677)
    {
        float _1679 = -_726;
        float _1681 = _1679 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1683 = -_728;
        float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1687 = -_730;
        float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1691 = _1681 * _1681;
        float _1693 = fma(_1685, _1685, _1691);
        float _1695 = fma(_1689, _1689, _1693);
        float _1697 = sqrt(_1695);
        float _1699 = rsqrt(_1695);
        float _1701 = -_1697;
        float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1705 = _1703 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1707 = precise::clamp(_1705, 0.0, 1.0);
        float _1709 = _1685 * _1699;
        float _1711 = _1681 * _1699;
        float _1713 = abs(_1707);
        float _1715 = log2(_1713);
        float _1717 = _1689 * _1699;
        float _1719 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1721 = _1451 * _1711;
        float _1723 = -_1711;
        float _1725 = -_1719;
        float _1727 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1725);
        float _1729 = fma(_1445, _1709, _1721);
        float _1731 = -_1717;
        float _1733 = fma(_1731, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1727);
        float _1735 = fma(_1453, _1717, _1729);
        float _1737 = precise::clamp(_1735, 0.0, 1.0);
        float _1739 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1741 = _1733 + _1739;
        float _1743 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1745 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1747 = precise::clamp(_1745, 0.0, 1.0);
        float _1749 = exp2(_1743);
        float _1751 = _1749 * _1747;
        float _1753 = _1737 * _1751;
        float _1755 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1757 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1759 = _1753 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _1755;
        out.m_79.y = _1757;
        out.m_79.z = _1759;
    }
    out.m_81.x = _1671;
    out.m_81.y = _1673;
    out.m_81.z = _1675;
    if (_1655)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1761 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1761;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

