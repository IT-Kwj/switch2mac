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
    float4 m_65 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_77 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_81 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
    float4 m_71 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1479 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1765 = as_type<float>(_120);
        out.gl_Position.z = _1765;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_134)
    {
        float _140 = float(_104);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _138 >= _142;
    bool _146 = !_134;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _122 = as_type<int>(_154);
    }
    int _156 = _122;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1834 = as_type<float>(_156);
        out.gl_Position.z = _1834;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_51.w;
    float _160 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_49.x;
    float _174 = in.m_49.y;
    float _176 = in.m_49.z;
    float _178 = in.m_44.x;
    float _180 = in.m_44.y;
    float _182 = in.m_44.z;
    float _184 = 0.0;
    float _186 = _160;
    if (!_170)
    {
        float _188 = _160 * _160;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_170)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    bool _200 = !_170;
    float _202 = _198;
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _160 * _206;
        float _216 = 1.0 / _210;
        float _218 = _212 * 0.693147182464599609375;
        float _220 = exp2(_214);
        float _222 = 1.0 / _218;
        float _224 = _220 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _222, _160);
        float _230 = _228 * _216;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _232;
    }
    float _234 = _202;
    bool _236 = !_170;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _160 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _186 = _256;
    }
    float _258 = _186;
    float _260 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _264 = fma(_258, _174, _260);
    float _266 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _268 = fma(_258, _172, _262);
    float _270 = fma(_264, _158, _180);
    float _272 = fma(_258, _176, _266);
    float _274 = fma(_268, _158, _178);
    float _276 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _278 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _280 = fma(_272, _158, _182);
    float _282 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _284 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _276);
    float _286 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _278);
    float _288 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _282);
    float _290 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].z, _284);
    float _292 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].z, _286);
    float _294 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].z, _288);
    float _296 = _290 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _298 = _292 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _300 = _294 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _304 = _296 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _308 = _298 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _312 = _300 + _310;
    float _314 = _304 * _304;
    float _316 = fma(_308, _308, _314);
    float _318 = fma(_312, _312, _316);
    float _320 = in.m_51.x;
    float _322 = in.m_51.y;
    float _324 = in.m_51.z;
    float _326 = rsqrt(_318);
    float _328 = _304 * _326;
    float _330 = _308 * _326;
    float _332 = _312 * _326;
    float _334 = -_328;
    float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    float _338 = -_330;
    float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _308);
    float _342 = -_332;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[18].w, _312);
    float _346 = _322 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _348 = _336 * _336;
    float _350 = _320 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _352 = _324 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = _346 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _356 = fma(_340, _340, _348);
    float _358 = _350 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _360 = in.m_53.x;
    float _362 = in.m_53.y;
    float _364 = in.m_53.z;
    float _366 = _352 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _368 = fma(_344, _344, _356);
    float _370 = sqrt(_368);
    float _372 = _326 * _370;
    float _374 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _362);
    float _376 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _360);
    float _378 = _354 * _372;
    float _380 = _358 * _372;
    float _382 = _366 * _372;
    bool _384 = _362 != 0.0;
    bool _386 = isnan(_362);
    bool _388 = _384 || _386;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    float _394 = _378 * _374;
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _364);
    float _398 = _380 * _376;
    bool _400 = _360 == 0.0;
    bool _402 = !_392;
    bool _404 = _400 && _402;
    float _406 = _394 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _408 = _382 * _396;
    float _410 = _394 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _412 = _394 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _414 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[9].x, _406);
    float _416 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[8].x, _410);
    float _418 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[10].x, _412);
    float _420 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[9].z, _414);
    bool _422 = _364 == 0.0;
    bool _424 = _422 && _404;
    float _426 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[8].z, _416);
    float _428 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[10].z, _418);
    float _430 = _296 + _420;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[191].z + _432;
    float _436 = _298 + _426;
    float _438 = _300 + _428;
    float _440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _442 = _430 + _440;
    float _444 = 1.0 / _434;
    float _446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _448 = _436 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _452 = _438 + _450;
    float _454 = _442 * _442;
    float _456 = fma(_448, _448, _454);
    float _458 = in.m_55.x;
    float _460 = in.m_55.y;
    float _462 = in.m_55.z;
    float _464 = fma(_452, _452, _456);
    float _466 = sqrt(_464);
    float _468 = precise::max(_466, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _470 = _460;
    float _472 = _458;
    float _474 = _462;
    if (!_424)
    {
        float _476 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[17].y, _460);
        _470 = _476;
    }
    float _478 = _470;
    if (!_424)
    {
        float _480 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[17].y, _458);
        _472 = _480;
    }
    float _482 = _472;
    float _484 = _482;
    if (!_424)
    {
        float _486 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[17].y, _462);
        _474 = _486;
    }
    float _488 = _474;
    float _490 = precise::min(_468, (*spvDescriptorSet0.vp_c9)._m0[191].z);
    float _492 = _478 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _494 = _478 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _496 = _478 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _500 = _490 + _498;
    float _502 = fma(_482, (*spvDescriptorSet0.vp_c10)._m0[10].x, _492);
    float _504 = fma(_482, (*spvDescriptorSet0.vp_c10)._m0[8].x, _494);
    float _506 = -_500;
    float _508 = fma(_506, _444, 1.0);
    float _510 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[10].z, _502);
    float _512 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[8].z, _504);
    float _514 = _508 * (*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _516 = -_510;
    float _518 = fma(_516, _514, _438);
    float _520 = -_512;
    float _522 = fma(_520, _514, _436);
    float _524 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _526 = _518 + _524;
    float _528 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _530 = _522 + _528;
    float _532 = _526 * _526;
    float _534 = fma(_530, _530, _532);
    float _536 = fma(_482, (*spvDescriptorSet0.vp_c10)._m0[9].x, _496);
    float _538 = sqrt(_534);
    float _540 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[9].z, _536);
    float _542 = -_540;
    float _544 = fma(_542, _514, _430);
    bool _546 = _538 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _548 = _496;
    float _550 = _488;
    float _552 = _518;
    if (!_546)
    {
        _548 = _522;
    }
    float _554 = _548;
    float _556 = _554;
    if (!_546)
    {
        _484 = _518;
    }
    float _558 = _484;
    float _560 = _558;
    if (!_546)
    {
        _550 = _544;
    }
    float _562 = _550;
    bool _564 = !_546;
    float _566 = _562;
    if (!_564)
    {
        float _568 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _570 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _572 = _538 + _570;
        float _574 = _544 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _576 = _572 * _568;
        float _578 = rsqrt(_534);
        float _580 = _576 * 0.15915493667125701904296875;
        float _582 = _580 * 6.283185482025146484375;
        float _584 = cos(_582);
        float _586 = _580 * 6.283185482025146484375;
        float _588 = sin(_586);
        float _590 = _584 + (-1.0);
        float _592 = fma(_588, _574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _594 = _590 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _596 = _578 * _592;
        float _598 = fma(_544, _584, _594);
        float _600 = fma(_530, _596, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _602 = fma(_526, _596, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _566 = _598;
        _556 = _600;
        _560 = _602;
    }
    float _604 = _566;
    float _606 = _556;
    float _608 = _560;
    float _610 = -_328;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _604);
    float _614 = -_330;
    float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[18].w, _606);
    float _618 = -_332;
    float _620 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[18].w, _608);
    float _622 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _624 = _612 + _622;
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _628 = _616 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _632 = _620 + _630;
    float _634 = _624 * _624;
    float _636 = fma(_628, _628, _634);
    float _638 = fma(_632, _632, _636);
    float _640 = rsqrt(_638);
    float _642 = sqrt(_638);
    float _644 = _640 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _646 = _628 * _644;
    float _648 = _632 * _644;
    float _650 = _646 * _646;
    float _652 = _648 * _648;
    float _654 = _650 + _652;
    float _656 = sqrt(_654);
    bool _658 = _656 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _660 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _662 = _656 + _660;
    float _664 = _636;
    float _666 = _654;
    float _668 = _662;
    float _670 = _644;
    float _672 = _646;
    float _674 = _632;
    float _676 = _624;
    float _678 = _628;
    if (_658)
    {
        float _680 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _664 = _680;
    }
    float _682 = _664;
    if (_658)
    {
        float _684 = rsqrt(_654);
        _666 = _684;
    }
    float _686 = _666;
    float _688 = _686;
    if (_658)
    {
        float _690 = _662 * _682;
        _668 = _690;
    }
    float _692 = _668;
    if (_658)
    {
        float _694 = _692 * 0.15915493667125701904296875;
        _552 = _694;
    }
    float _696 = _552;
    float _698 = _682;
    float _700 = _696;
    if (_658)
    {
        float _702 = _696 * 6.283185482025146484375;
        float _704 = sin(_702);
        _698 = _704;
    }
    float _706 = _698;
    float _708 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _710 = precise::max(0.0, _708);
    float _712 = _544;
    float _714 = _710;
    if (_658)
    {
        float _716 = _696 * 6.283185482025146484375;
        float _718 = cos(_716);
        _712 = _718;
    }
    float _720 = _712;
    float _722 = -_644;
    float _724 = -_710;
    float _726 = fma(_624, _722, _724);
    if (_658)
    {
        float _728 = _726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _714 = _728;
    }
    float _730 = _714;
    float _732 = _706;
    float _734 = _730;
    if (_658)
    {
        float _736 = fma(_706, _730, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _732 = _736;
    }
    float _738 = _732;
    float _740 = _738;
    float _742 = _720;
    if (_658)
    {
        float _744 = _720 + (-1.0);
        _734 = _744;
    }
    float _746 = _734;
    float _748 = _746;
    if (_658)
    {
        float _750 = _686 * _738;
        _670 = _750;
    }
    float _752 = _670;
    if (!_658)
    {
        _740 = _726;
    }
    float _754 = _740;
    float _756 = _754;
    if (_658)
    {
        float _758 = _746 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _700 = _758;
    }
    float _760 = _700;
    if (_658)
    {
        float _762 = _646 * _752;
        _672 = _762;
    }
    float _764 = _672;
    if (!_658)
    {
        _748 = _648;
    }
    float _766 = _748;
    float _768 = _766;
    if (_658)
    {
        float _770 = _648 * _752;
        _768 = _770;
    }
    float _772 = _768;
    if (!_658)
    {
        _688 = _650;
    }
    float _774 = _688;
    float _776 = _774;
    if (_658)
    {
        float _778 = fma(_726, _720, _760);
        _756 = _778;
    }
    float _780 = _756;
    if (_658)
    {
        float _782 = _764 * _764;
        _776 = _782;
    }
    float _784 = _776;
    if (!_658)
    {
        _742 = _652;
    }
    float _786 = _742;
    float _788 = _786;
    if (_658)
    {
        float _790 = _772 * _772;
        _788 = _790;
    }
    float _792 = _788;
    float _794 = fma(_780, _780, _784);
    float _796 = _612 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _798 = _794 + _792;
    float _800 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _802 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[23].w, _800);
    float _804 = precise::clamp(_802, 0.0, 1.0);
    float _806 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[2].x, _796);
    float _808 = _612 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _810 = rsqrt(_798);
    float _812 = -_804;
    float _814 = _812 + 1.0;
    float _816 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[2].z, _806);
    float _818 = _612 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _820 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[1].x, _808);
    float _822 = _612 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _824 = _816 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _826 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[0].x, _818);
    float _828 = abs(_814);
    float _830 = log2(_828);
    float _832 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[1].z, _820);
    float _834 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _836 = _824 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _838 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[0].z, _826);
    float _840 = _832 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _842 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[3].x, _822);
    float _844 = -_836;
    float _846 = fma(_844, _834, 1.0);
    float _848 = _810 * _764;
    float _850 = _838 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _852 = _840 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _854 = _810 * _780;
    float _856 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[3].z, _842);
    float _858 = _848 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _860 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[7].x, _852);
    float _862 = _810 * _772;
    float _864 = _856 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _866 = -_858;
    float _868 = fma(_854, (*spvDescriptorSet0.vp_c15)._m0[21].y, _866);
    float _870 = _830 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _872 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[7].z, _860);
    float _874 = log2(_846);
    float _876 = -_862;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c15)._m0[21].z, _868);
    float _880 = _840 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _882 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[7].w, _872);
    float _884 = _840 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _886 = fma(_878, -0.5, 0.5);
    float _888 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[4].x, _880);
    float _890 = fma(_878, 0.5, 0.5);
    float _892 = exp2(_870);
    float _894 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[5].x, _884);
    float _896 = _854 + 1.0;
    float _898 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[4].z, _888);
    float _900 = fma(_890, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _902 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[5].z, _894);
    float _904 = 1.0 / _882;
    float _906 = fma(_890, _900, -0.212114393711090087890625);
    float _908 = _874 * 0.693147182464599609375;
    float _910 = fma(_890, _906, 1.570728778839111328125);
    float _912 = _908 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _914 = sqrt(_886);
    float _916 = -_854;
    float _918 = fma(_892, _896, _916);
    float _920 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[4].w, _898);
    float _922 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[5].w, _902);
    float _924 = fma(_918, 0.5, 0.5);
    float _926 = _920 * _904;
    float _928 = _922 * _904;
    float _930 = fma(_926, 0.5, 0.5);
    float _932 = fma(_928, -0.5, 0.5);
    float _934 = _914 * 0.636619746685028076171875;
    float3 _3120 = float3(_930, _932, _912);
    float _936 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3120, float3(0.0), isnan(_3120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3120, float3(0.0), isnan(_3120)), level(0.0)).x;
    float _938 = -_910;
    float _940 = fma(_934, _938, 1.0);
    float3 _3136 = float3(_930, _932, _912);
    float4 _943 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3136, float3(0.0), isnan(_3136)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3136, float3(0.0), isnan(_3136)), level(0.0)).xyzw;
    float _945 = _943.x;
    float _947 = _943.y;
    float _949 = _943.z;
    float _951 = _943.w;
    float2 _3153 = float2(_940, _924);
    float3 _955 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3153, float2(0.0), isnan(_3153)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3153, float2(0.0), isnan(_3153)), level(0.0)).xyz;
    float _957 = _955.x;
    float _959 = _955.y;
    float _961 = _955.z;
    float _963 = in.m_57.w;
    float _965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _967 = in.m_59.y;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _971 = in.m_57.y;
    float _973 = _840 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _975 = in.m_57.x;
    float _977 = in.m_59.x;
    float _979 = in.m_57.z;
    float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _985 = _963 > 0.5;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _991 = -_967;
    float _993 = _991 + 1.0;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _999 = _997 != 0;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1003 = _971 > 0.5;
    float _1005 = _971 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1009 = _1007 != 0;
    float _1011 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[6].x, _973);
    float _1013 = _1003 ? _993 : _967;
    out.m_61.x = _466;
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1017 = _1015 != 0;
    float _1019 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1011);
    float _1021 = _1009 ? _1013 : _967;
    float _1023 = _920 + _882;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1027 = _1025 != 0;
    float _1029 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1019);
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1033 = _1031 != 0;
    float _1035 = _1023 * 0.5;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1039 = _1037 != 0;
    float _1041 = _975 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1043 = _1013;
    float _1045 = _1041;
    float _1047 = _967;
    bool _1049 = _1039;
    float _1051 = _983;
    float _1053 = _979;
    float _1055 = _971;
    float _1057 = _920;
    float _1059 = _922;
    if (!_999)
    {
        _1043 = _977;
    }
    float _1061 = _1043;
    float _1063 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1065 = _1029 + _1063;
    int _1067 = _985 ? as_type<int>(_993) : as_type<int>(_967);
    float _1069 = -_969;
    float _1071 = fma(_1041, 2.0, _1069);
    float _1073 = _1061;
    if (!_999)
    {
        _1045 = _1061;
    }
    float _1075 = _1045;
    float _1077 = _882 + _1065;
    float _1079 = _1075;
    if (_999)
    {
        _1073 = _977;
    }
    float _1081 = _1073;
    float _1083 = -_138;
    float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1071);
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1089 = _1087 != 0;
    float _1091 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1093 = fma(_1005, -2.0, _989);
    float _1095 = _981 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1097 = _1033 ? as_type<float>(_1067) : _967;
    int _1099 = 0;
    float _1101 = _1081;
    if (_1017)
    {
        float _1103 = -_1081;
        float _1105 = _1103 + 1.0;
        _1099 = as_type<int>(_1105);
    }
    int _1107 = _1099;
    bool _1109 = _979 > 0.5;
    float _1111 = fma(_1095, _1021, -0.5);
    int _1113 = 0;
    int _1115 = as_type<int>(_1111);
    float _1117 = as_type<float>(_1107);
    if (_1027)
    {
        float _1119 = -_1081;
        float _1121 = _1119 + 1.0;
        _1113 = as_type<int>(_1121);
    }
    int _1123 = _1113;
    if (_1039)
    {
        float _1125 = _1109 ? _993 : _967;
        _1047 = _1125;
    }
    float _1127 = _1047;
    float _1129 = _1077 * 0.5;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1133 = _1131;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_999)
    {
        bool _1137 = _975 > 0.5;
        _1049 = _1137;
    }
    bool _1139 = _1049;
    out.m_63.x = _512;
    out.m_63.y = _540;
    out.m_63.z = _510;
    float _1141 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1131);
    float _1143 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1145 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1093);
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1149 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1141);
    if (_1089)
    {
        _1133 = _975;
    }
    float _1151 = _1133;
    float _1153 = fma(_1097, _1143, -0.5);
    float _1155 = _1151;
    if (!_1089)
    {
        _1135 = _971;
    }
    float _1157 = _1135;
    float _1159 = -_1145;
    float _1161 = fma(_1149, _1111, _1159);
    float _1163 = _1157;
    if (!_1089)
    {
        _1155 = _979;
    }
    float _1165 = _1155;
    if (_999)
    {
        float _1167 = -_1081;
        float _1169 = _1167 + 1.0;
        _1115 = as_type<int>(_1169);
    }
    int _1171 = _1115;
    float _1173 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1147);
    if (_1089)
    {
        _1163 = _975;
    }
    float _1175 = _1163;
    float _1177 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1179 = _965 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_999)
    {
        float _1181 = _1139 ? as_type<float>(_1171) : _1081;
        _1079 = _1181;
    }
    float _1183 = _1079;
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1187 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1191 = fma(_1179, _1127, -0.5);
    float _1193 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1185);
    float _1195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1197 = -_1189;
    float _1199 = fma(_1187, 2.0, _1197);
    float _1201 = -_983;
    float _1203 = fma(_1177, 2.0, _1201);
    if (!_1017)
    {
        _1051 = _1081;
    }
    float _1205 = _1051;
    float _1207 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[88].z, _987);
    float _1209 = _1205;
    if (_1017)
    {
        float _1211 = _1109 ? as_type<float>(_1107) : _1081;
        _1209 = _1211;
    }
    float _1213 = _1209;
    float _1215 = -_138;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1199);
    if (_1027)
    {
        float _1219 = _1003 ? as_type<float>(_1123) : _1081;
        _1101 = _1219;
    }
    float _1221 = _1101;
    float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1225 = -_138;
    float _1227 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1203);
    if (!_1089)
    {
        _1117 = _979;
    }
    float _1229 = _1117;
    out.m_65.x = _628;
    out.m_65.y = _624;
    out.m_65.z = _632;
    float _1231 = _1229;
    if (_1089)
    {
        _1231 = _971;
    }
    float _1233 = _1231;
    float _1235 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1089)
    {
        _1053 = _971;
    }
    float _1237 = _1053;
    float _1239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_1089)
    {
        _1055 = _975;
    }
    float _1241 = _1055;
    float _1243 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1235);
    float _1245 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1247 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1249 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1001);
    float _1251 = fma(_1245, -2.0, _995);
    float _1253 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1255 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1243);
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1259 = fma(_1253, _1213, -0.5);
    float _1261 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1263 = _1257 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1265 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1267 = fma(_1247, _1183, -0.5);
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1271 = fma(_1265, _1221, -0.5);
    float _1273 = fma(_1255, _1267, _1085);
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1279 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1193);
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1287 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1289 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1293 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1295 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1297 = fma(_1261, -2.0, _1283);
    out.m_67.x = _1287;
    out.m_67.y = _1289;
    out.m_67.z = _1263;
    float _1299 = fma(_1279, _1259, _1217);
    float _1301 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1249);
    float _1303 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1251);
    out.m_69.x = _1291;
    out.m_69.y = _1293;
    out.m_69.z = _1295;
    float _1305 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1297);
    bool _1307 = _642 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1309 = isnan(_642);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1315 = _1311 || _1313;
    float _1317 = -_1303;
    float _1319 = fma(_1301, _1153, _1317);
    float _1321 = in.m_71.x;
    float _1323 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1207);
    float _1325 = in.m_71.y;
    float _1327 = _1273 + 0.5;
    float _1329 = _1299 + 0.5;
    float _1331 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1173);
    float _1333 = _830 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1335 = fma(_1323, _1271, _1227);
    float _1337 = _1161 + 0.5;
    float _1339 = -_1305;
    float _1341 = fma(_1331, _1191, _1339);
    float _1343 = _1319 + 0.5;
    float _1345 = _1335 + 0.5;
    float _1347 = exp2(_1333);
    float _1349 = _1341 + 0.5;
    float _1351 = _882 * 0.5;
    out.m_73.x = _1327;
    out.m_73.y = _1337;
    out.m_73.z = _1329;
    out.m_73.w = _1343;
    float _1353 = fma(_922, -0.5, _1351);
    out.m_75.x = _1345;
    out.m_75.y = _1349;
    if (!_1315)
    {
        _674 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1355 = _674;
    float _1357 = _1355;
    float _1359 = _1355;
    if (!_1315)
    {
        _676 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1361 = _676;
    out.m_77.x = _1321;
    float _1363 = _1361;
    float _1365 = _1361;
    if (!_1315)
    {
        _678 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1367 = _678;
    out.m_77.y = _1325;
    float _1369 = -_1347;
    float _1371 = _1369 + 1.0;
    out.m_79.x = _1035;
    out.m_79.y = _1353;
    out.m_79.z = _1129;
    out.m_79.w = _882;
    float _1373 = _1371 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _920;
    out.gl_Position.y = _922;
    out.gl_Position.z = _1065;
    out.gl_Position.w = _882;
    float _1375 = -_1373;
    float _1377 = _1375 + 1.0;
    float _1379 = _1373;
    float _1381 = _1367;
    float _1383 = _1367;
    if (!_1315)
    {
        _1057 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1385 = _1057;
    float _1387 = _1385;
    float _1389 = _1385;
    if (!_1315)
    {
        _1059 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1391 = _1059;
    float _1393 = _1373 * _936;
    float _1395 = _1391;
    float _1397 = _1391;
    if (!_1315)
    {
        _1379 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1399 = _1379;
    float _1401 = _951 * _1393;
    float _1403 = _951 * _1377;
    float _1405 = _961 * _1393;
    float _1407 = fma(_957, _1401, _945);
    float _1409 = fma(_959, _1401, _947);
    float _1411 = fma(_951, _1405, _949);
    out.m_81.x = _1407;
    out.m_81.y = _1409;
    out.m_81.z = _1411;
    out.m_81.w = _1403;
    bool _1413 = !_1315;
    float _1415 = _1399;
    float _1417 = _1399;
    if (!_1413)
    {
        bool _1419 = _642 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1421 = isnan(_642);
        bool _1423 = _1419 || _1421;
        bool _1425 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1427 = _1423 || _1425;
        if (!_1427)
        {
            float _1429 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1431 = _642 + _1429;
            float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1435 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1433;
            float _1437 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1439 = _1437 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1441 = 1.0 / _1435;
            float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1445 = _1443 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1447 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1449 = _1447 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1451 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1453 = _1451 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1455 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1457 = _1455 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1459 = _1431 * _1441;
            float _1461 = precise::clamp(_1459, 0.0, 1.0);
            float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1465 = _1463 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1467 = fma(_1461, _1439, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1469 = fma(_1461, _1465, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1471 = fma(_1461, _1445, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1473 = fma(_1461, _1449, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1475 = fma(_1461, _1453, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1477 = fma(_1461, _1457, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1397 = _1471;
            _1383 = _1475;
            _1389 = _1467;
            _1365 = _1473;
            _1359 = _1469;
            _1417 = _1477;
            _1479 = true;
        }
        else
        {
            bool _1481 = _642 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1483 = isnan(_642);
            bool _1485 = _1481 || _1483;
            bool _1487 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1489 = _1485 || _1487;
            if (!_1489)
            {
                _1387 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1491 = _1387;
            _1389 = _1491;
            if (!_1489)
            {
                _1395 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1493 = _1395;
            _1397 = _1493;
            if (!_1489)
            {
                _1357 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1495 = _1357;
            _1359 = _1495;
            if (!_1489)
            {
                _1363 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1497 = _1363;
            _1365 = _1497;
            if (!_1489)
            {
                _1381 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1499 = _1381;
            _1383 = _1499;
            if (!_1489)
            {
                _1415 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1501 = _1415;
            bool _1503 = !_1489;
            _1417 = _1501;
            if (!_1503)
            {
                bool _1505 = _642 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1507 = isnan(_642);
                bool _1509 = _1505 || _1507;
                bool _1511 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1513 = _1509 || _1511;
                if (!_1513)
                {
                    float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1517 = _642 + _1515;
                    float _1519 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1521 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1519;
                    float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1525 = _1523 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1527 = 1.0 / _1521;
                    float _1529 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1531 = _1529 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1533 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1535 = _1533 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1539 = _1537 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1543 = _1541 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1545 = _1517 * _1527;
                    float _1547 = precise::clamp(_1545, 0.0, 1.0);
                    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1551 = _1549 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1553 = fma(_1547, _1525, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1555 = fma(_1547, _1551, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1557 = fma(_1547, _1531, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1559 = fma(_1547, _1535, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1561 = fma(_1547, _1539, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1563 = fma(_1547, _1543, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1397 = _1557;
                    _1383 = _1561;
                    _1389 = _1553;
                    _1365 = _1559;
                    _1359 = _1555;
                    _1417 = _1563;
                    _1479 = true;
                }
                else
                {
                    _1397 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1383 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1389 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1365 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1359 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1417 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1479 = false;
    float _1565 = _1397;
    float _1567 = _1383;
    float _1569 = _1389;
    float _1571 = _1365;
    float _1573 = _1359;
    float _1575 = _1417;
    float _1577 = fma(_540, -0.5, 0.5);
    float _1579 = precise::clamp(_1577, 0.0, 1.0);
    float _1581 = -_1565;
    float _1583 = _1581 + _1567;
    float _1585 = -_1569;
    float _1587 = _1585 + _1571;
    float _1589 = -_1573;
    float _1591 = _1589 + _1575;
    bool _1593 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1595 = fma(_1579, _1583, _1565);
    float _1597 = fma(_1579, _1587, _1569);
    float _1599 = fma(_1579, _1591, _1573);
    float _1601 = _1595 * 0.586610972881317138671875;
    out.m_83.x = 0.0;
    float _1603 = fma(_1597, 0.298911988735198974609375, _1601);
    float _1605 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1607 = fma(_1599, 0.114477999508380889892578125, _1603);
    out.m_47.x = _1605;
    float _1609 = -_1607;
    float _1611 = _1597 + _1609;
    float _1613 = -_1607;
    float _1615 = _1595 + _1613;
    float _1617 = -_1607;
    float _1619 = _1599 + _1617;
    float _1621 = fma(_1611, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1607);
    float _1623 = fma(_1615, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1607);
    float _1625 = fma(_1619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1607);
    out.m_85.x = _1621;
    out.m_85.y = _1623;
    out.m_85.z = _1625;
    if (!_1593)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1627 = -_612;
    float _1629 = _1627 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1631 = -_616;
    float _1633 = _1631 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1635 = -_620;
    float _1637 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1639 = _1629 * _1629;
    float _1641 = fma(_1633, _1633, _1639);
    float _1643 = fma(_1637, _1637, _1641);
    float _1645 = sqrt(_1643);
    float _1647 = rsqrt(_1643);
    float _1649 = -_1645;
    float _1651 = _1649 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1653 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1655 = precise::clamp(_1653, 0.0, 1.0);
    float _1657 = _1633 * _1647;
    float _1659 = _1629 * _1647;
    float _1661 = abs(_1655);
    float _1663 = log2(_1661);
    float _1665 = _1637 * _1647;
    float _1667 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1669 = _540 * _1659;
    float _1671 = -_1659;
    float _1673 = -_1667;
    float _1675 = fma(_1671, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1673);
    float _1677 = fma(_512, _1657, _1669);
    float _1679 = -_1665;
    float _1681 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1675);
    float _1683 = fma(_510, _1665, _1677);
    float _1685 = precise::clamp(_1683, 0.0, 1.0);
    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1689 = _1681 + _1687;
    float _1691 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1693 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1695 = precise::clamp(_1693, 0.0, 1.0);
    float _1697 = exp2(_1691);
    float _1699 = _1697 * _1695;
    float _1701 = _1685 * _1699;
    float _1703 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1705 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1707 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _1703;
    out.m_83.y = _1705;
    out.m_83.z = _1707;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1479 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1765 = as_type<float>(_120);
        out.gl_Position.z = _1765;
    }
    if (!_108)
    {
        return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_134)
    {
        float _140 = float(_104);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _138 >= _142;
    bool _146 = !_134;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _122 = as_type<int>(_154);
    }
    int _156 = _122;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1834 = as_type<float>(_156);
        out.gl_Position.z = _1834;
    }
    if (_148)
    {
        return out;
    }
    float _158 = in.m_51.w;
    float _160 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_49.x;
    float _174 = in.m_49.y;
    float _176 = in.m_49.z;
    float _178 = in.m_44.x;
    float _180 = in.m_44.y;
    float _182 = in.m_44.z;
    float _184 = 0.0;
    float _186 = _160;
    if (!_170)
    {
        float _188 = _160 * _160;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_170)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    bool _200 = !_170;
    float _202 = _198;
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _160 * _206;
        float _216 = 1.0 / _210;
        float _218 = _212 * 0.693147182464599609375;
        float _220 = exp2(_214);
        float _222 = 1.0 / _218;
        float _224 = _220 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _222, _160);
        float _230 = _228 * _216;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _232;
    }
    float _234 = _202;
    bool _236 = !_170;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _160 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _186 = _256;
    }
    float _258 = _186;
    float _260 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _264 = fma(_258, _174, _260);
    float _266 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _268 = fma(_258, _172, _262);
    float _270 = fma(_264, _158, _180);
    float _272 = fma(_258, _176, _266);
    float _274 = fma(_268, _158, _178);
    float _276 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _278 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _280 = fma(_272, _158, _182);
    float _282 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _284 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _276);
    float _286 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _278);
    float _288 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _282);
    float _290 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].z, _284);
    float _292 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].z, _286);
    float _294 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].z, _288);
    float _296 = _290 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _298 = _292 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _300 = _294 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _304 = _296 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _308 = _298 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _312 = _300 + _310;
    float _314 = _304 * _304;
    float _316 = fma(_308, _308, _314);
    float _318 = fma(_312, _312, _316);
    float _320 = in.m_51.x;
    float _322 = in.m_51.y;
    float _324 = in.m_51.z;
    float _326 = rsqrt(_318);
    float _328 = _304 * _326;
    float _330 = _308 * _326;
    float _332 = _312 * _326;
    float _334 = -_328;
    float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    float _338 = -_330;
    float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _308);
    float _342 = -_332;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[18].w, _312);
    float _346 = _322 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _348 = _336 * _336;
    float _350 = _320 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _352 = _324 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = _346 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _356 = fma(_340, _340, _348);
    float _358 = _350 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _360 = in.m_53.x;
    float _362 = in.m_53.y;
    float _364 = in.m_53.z;
    float _366 = _352 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _368 = fma(_344, _344, _356);
    float _370 = sqrt(_368);
    float _372 = _326 * _370;
    float _374 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _362);
    float _376 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _360);
    float _378 = _354 * _372;
    float _380 = _358 * _372;
    float _382 = _366 * _372;
    bool _384 = _362 != 0.0;
    bool _386 = isnan(_362);
    bool _388 = _384 || _386;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    float _394 = _378 * _374;
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _364);
    float _398 = _380 * _376;
    bool _400 = _360 == 0.0;
    bool _402 = !_392;
    bool _404 = _400 && _402;
    float _406 = _394 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _408 = _382 * _396;
    float _410 = _394 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _412 = _394 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _414 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[9].x, _406);
    float _416 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[8].x, _410);
    float _418 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[10].x, _412);
    float _420 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[9].z, _414);
    bool _422 = _364 == 0.0;
    bool _424 = _422 && _404;
    float _426 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[8].z, _416);
    float _428 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[10].z, _418);
    float _430 = _296 + _420;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[191].z + _432;
    float _436 = _298 + _426;
    float _438 = _300 + _428;
    float _440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _442 = _430 + _440;
    float _444 = 1.0 / _434;
    float _446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _448 = _436 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _452 = _438 + _450;
    float _454 = _442 * _442;
    float _456 = fma(_448, _448, _454);
    float _458 = in.m_55.x;
    float _460 = in.m_55.y;
    float _462 = in.m_55.z;
    float _464 = fma(_452, _452, _456);
    float _466 = sqrt(_464);
    float _468 = precise::max(_466, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _470 = _460;
    float _472 = _458;
    float _474 = _462;
    if (!_424)
    {
        float _476 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[17].y, _460);
        _470 = _476;
    }
    float _478 = _470;
    if (!_424)
    {
        float _480 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[17].y, _458);
        _472 = _480;
    }
    float _482 = _472;
    float _484 = _482;
    if (!_424)
    {
        float _486 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[17].y, _462);
        _474 = _486;
    }
    float _488 = _474;
    float _490 = precise::min(_468, (*spvDescriptorSet0.vp_c9)._m0[191].z);
    float _492 = _478 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _494 = _478 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _496 = _478 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _500 = _490 + _498;
    float _502 = fma(_482, (*spvDescriptorSet0.vp_c10)._m0[10].x, _492);
    float _504 = fma(_482, (*spvDescriptorSet0.vp_c10)._m0[8].x, _494);
    float _506 = -_500;
    float _508 = fma(_506, _444, 1.0);
    float _510 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[10].z, _502);
    float _512 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[8].z, _504);
    float _514 = _508 * (*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _516 = -_510;
    float _518 = fma(_516, _514, _438);
    float _520 = -_512;
    float _522 = fma(_520, _514, _436);
    float _524 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _526 = _518 + _524;
    float _528 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _530 = _522 + _528;
    float _532 = _526 * _526;
    float _534 = fma(_530, _530, _532);
    float _536 = fma(_482, (*spvDescriptorSet0.vp_c10)._m0[9].x, _496);
    float _538 = sqrt(_534);
    float _540 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[9].z, _536);
    float _542 = -_540;
    float _544 = fma(_542, _514, _430);
    bool _546 = _538 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _548 = _496;
    float _550 = _488;
    float _552 = _518;
    if (!_546)
    {
        _548 = _522;
    }
    float _554 = _548;
    float _556 = _554;
    if (!_546)
    {
        _484 = _518;
    }
    float _558 = _484;
    float _560 = _558;
    if (!_546)
    {
        _550 = _544;
    }
    float _562 = _550;
    bool _564 = !_546;
    float _566 = _562;
    if (!_564)
    {
        float _568 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _570 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _572 = _538 + _570;
        float _574 = _544 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _576 = _572 * _568;
        float _578 = rsqrt(_534);
        float _580 = _576 * 0.15915493667125701904296875;
        float _582 = _580 * 6.283185482025146484375;
        float _584 = cos(_582);
        float _586 = _580 * 6.283185482025146484375;
        float _588 = sin(_586);
        float _590 = _584 + (-1.0);
        float _592 = fma(_588, _574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _594 = _590 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _596 = _578 * _592;
        float _598 = fma(_544, _584, _594);
        float _600 = fma(_530, _596, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _602 = fma(_526, _596, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _566 = _598;
        _556 = _600;
        _560 = _602;
    }
    float _604 = _566;
    float _606 = _556;
    float _608 = _560;
    float _610 = -_328;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _604);
    float _614 = -_330;
    float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[18].w, _606);
    float _618 = -_332;
    float _620 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[18].w, _608);
    float _622 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _624 = _612 + _622;
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _628 = _616 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _632 = _620 + _630;
    float _634 = _624 * _624;
    float _636 = fma(_628, _628, _634);
    float _638 = fma(_632, _632, _636);
    float _640 = rsqrt(_638);
    float _642 = sqrt(_638);
    float _644 = _640 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _646 = _628 * _644;
    float _648 = _632 * _644;
    float _650 = _646 * _646;
    float _652 = _648 * _648;
    float _654 = _650 + _652;
    float _656 = sqrt(_654);
    bool _658 = _656 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _660 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _662 = _656 + _660;
    float _664 = _636;
    float _666 = _654;
    float _668 = _662;
    float _670 = _644;
    float _672 = _646;
    float _674 = _632;
    float _676 = _624;
    float _678 = _628;
    if (_658)
    {
        float _680 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _664 = _680;
    }
    float _682 = _664;
    if (_658)
    {
        float _684 = rsqrt(_654);
        _666 = _684;
    }
    float _686 = _666;
    float _688 = _686;
    if (_658)
    {
        float _690 = _662 * _682;
        _668 = _690;
    }
    float _692 = _668;
    if (_658)
    {
        float _694 = _692 * 0.15915493667125701904296875;
        _552 = _694;
    }
    float _696 = _552;
    float _698 = _682;
    float _700 = _696;
    if (_658)
    {
        float _702 = _696 * 6.283185482025146484375;
        float _704 = sin(_702);
        _698 = _704;
    }
    float _706 = _698;
    float _708 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _710 = precise::max(0.0, _708);
    float _712 = _544;
    float _714 = _710;
    if (_658)
    {
        float _716 = _696 * 6.283185482025146484375;
        float _718 = cos(_716);
        _712 = _718;
    }
    float _720 = _712;
    float _722 = -_644;
    float _724 = -_710;
    float _726 = fma(_624, _722, _724);
    if (_658)
    {
        float _728 = _726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _714 = _728;
    }
    float _730 = _714;
    float _732 = _706;
    float _734 = _730;
    if (_658)
    {
        float _736 = fma(_706, _730, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _732 = _736;
    }
    float _738 = _732;
    float _740 = _738;
    float _742 = _720;
    if (_658)
    {
        float _744 = _720 + (-1.0);
        _734 = _744;
    }
    float _746 = _734;
    float _748 = _746;
    if (_658)
    {
        float _750 = _686 * _738;
        _670 = _750;
    }
    float _752 = _670;
    if (!_658)
    {
        _740 = _726;
    }
    float _754 = _740;
    float _756 = _754;
    if (_658)
    {
        float _758 = _746 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _700 = _758;
    }
    float _760 = _700;
    if (_658)
    {
        float _762 = _646 * _752;
        _672 = _762;
    }
    float _764 = _672;
    if (!_658)
    {
        _748 = _648;
    }
    float _766 = _748;
    float _768 = _766;
    if (_658)
    {
        float _770 = _648 * _752;
        _768 = _770;
    }
    float _772 = _768;
    if (!_658)
    {
        _688 = _650;
    }
    float _774 = _688;
    float _776 = _774;
    if (_658)
    {
        float _778 = fma(_726, _720, _760);
        _756 = _778;
    }
    float _780 = _756;
    if (_658)
    {
        float _782 = _764 * _764;
        _776 = _782;
    }
    float _784 = _776;
    if (!_658)
    {
        _742 = _652;
    }
    float _786 = _742;
    float _788 = _786;
    if (_658)
    {
        float _790 = _772 * _772;
        _788 = _790;
    }
    float _792 = _788;
    float _794 = fma(_780, _780, _784);
    float _796 = _612 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _798 = _794 + _792;
    float _800 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _802 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[23].w, _800);
    float _804 = precise::clamp(_802, 0.0, 1.0);
    float _806 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[2].x, _796);
    float _808 = _612 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _810 = rsqrt(_798);
    float _812 = -_804;
    float _814 = _812 + 1.0;
    float _816 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[2].z, _806);
    float _818 = _612 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _820 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[1].x, _808);
    float _822 = _612 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _824 = _816 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _826 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[0].x, _818);
    float _828 = abs(_814);
    float _830 = log2(_828);
    float _832 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[1].z, _820);
    float _834 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _836 = _824 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _838 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[0].z, _826);
    float _840 = _832 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _842 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[3].x, _822);
    float _844 = -_836;
    float _846 = fma(_844, _834, 1.0);
    float _848 = _810 * _764;
    float _850 = _838 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _852 = _840 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _854 = _810 * _780;
    float _856 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[3].z, _842);
    float _858 = _848 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _860 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[7].x, _852);
    float _862 = _810 * _772;
    float _864 = _856 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _866 = -_858;
    float _868 = fma(_854, (*spvDescriptorSet0.vp_c15)._m0[21].y, _866);
    float _870 = _830 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _872 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[7].z, _860);
    float _874 = log2(_846);
    float _876 = -_862;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c15)._m0[21].z, _868);
    float _880 = _840 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _882 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[7].w, _872);
    float _884 = _840 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _886 = fma(_878, -0.5, 0.5);
    float _888 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[4].x, _880);
    float _890 = fma(_878, 0.5, 0.5);
    float _892 = exp2(_870);
    float _894 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[5].x, _884);
    float _896 = _854 + 1.0;
    float _898 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[4].z, _888);
    float _900 = fma(_890, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _902 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[5].z, _894);
    float _904 = 1.0 / _882;
    float _906 = fma(_890, _900, -0.212114393711090087890625);
    float _908 = _874 * 0.693147182464599609375;
    float _910 = fma(_890, _906, 1.570728778839111328125);
    float _912 = _908 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _914 = sqrt(_886);
    float _916 = -_854;
    float _918 = fma(_892, _896, _916);
    float _920 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[4].w, _898);
    float _922 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[5].w, _902);
    float _924 = fma(_918, 0.5, 0.5);
    float _926 = _920 * _904;
    float _928 = _922 * _904;
    float _930 = fma(_926, 0.5, 0.5);
    float _932 = fma(_928, -0.5, 0.5);
    float _934 = _914 * 0.636619746685028076171875;
    float3 _3120 = float3(_930, _932, _912);
    float _936 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3120, float3(0.0), isnan(_3120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3120, float3(0.0), isnan(_3120)), level(0.0)).x;
    float _938 = -_910;
    float _940 = fma(_934, _938, 1.0);
    float3 _3136 = float3(_930, _932, _912);
    float4 _943 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3136, float3(0.0), isnan(_3136)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3136, float3(0.0), isnan(_3136)), level(0.0)).xyzw;
    float _945 = _943.x;
    float _947 = _943.y;
    float _949 = _943.z;
    float _951 = _943.w;
    float2 _3153 = float2(_940, _924);
    float3 _955 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3153, float2(0.0), isnan(_3153)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3153, float2(0.0), isnan(_3153)), level(0.0)).xyz;
    float _957 = _955.x;
    float _959 = _955.y;
    float _961 = _955.z;
    float _963 = in.m_57.w;
    float _965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _967 = in.m_59.y;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _971 = in.m_57.y;
    float _973 = _840 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _975 = in.m_57.x;
    float _977 = in.m_59.x;
    float _979 = in.m_57.z;
    float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _985 = _963 > 0.5;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _991 = -_967;
    float _993 = _991 + 1.0;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _999 = _997 != 0;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1003 = _971 > 0.5;
    float _1005 = _971 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1009 = _1007 != 0;
    float _1011 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[6].x, _973);
    float _1013 = _1003 ? _993 : _967;
    out.m_61.x = _466;
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1017 = _1015 != 0;
    float _1019 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1011);
    float _1021 = _1009 ? _1013 : _967;
    float _1023 = _920 + _882;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1027 = _1025 != 0;
    float _1029 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1019);
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1033 = _1031 != 0;
    float _1035 = _1023 * 0.5;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1039 = _1037 != 0;
    float _1041 = _975 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1043 = _1013;
    float _1045 = _1041;
    float _1047 = _967;
    bool _1049 = _1039;
    float _1051 = _983;
    float _1053 = _979;
    float _1055 = _971;
    float _1057 = _920;
    float _1059 = _922;
    if (!_999)
    {
        _1043 = _977;
    }
    float _1061 = _1043;
    float _1063 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1065 = _1029 + _1063;
    int _1067 = _985 ? as_type<int>(_993) : as_type<int>(_967);
    float _1069 = -_969;
    float _1071 = fma(_1041, 2.0, _1069);
    float _1073 = _1061;
    if (!_999)
    {
        _1045 = _1061;
    }
    float _1075 = _1045;
    float _1077 = _882 + _1065;
    float _1079 = _1075;
    if (_999)
    {
        _1073 = _977;
    }
    float _1081 = _1073;
    float _1083 = -_138;
    float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1071);
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1089 = _1087 != 0;
    float _1091 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1093 = fma(_1005, -2.0, _989);
    float _1095 = _981 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1097 = _1033 ? as_type<float>(_1067) : _967;
    int _1099 = 0;
    float _1101 = _1081;
    if (_1017)
    {
        float _1103 = -_1081;
        float _1105 = _1103 + 1.0;
        _1099 = as_type<int>(_1105);
    }
    int _1107 = _1099;
    bool _1109 = _979 > 0.5;
    float _1111 = fma(_1095, _1021, -0.5);
    int _1113 = 0;
    int _1115 = as_type<int>(_1111);
    float _1117 = as_type<float>(_1107);
    if (_1027)
    {
        float _1119 = -_1081;
        float _1121 = _1119 + 1.0;
        _1113 = as_type<int>(_1121);
    }
    int _1123 = _1113;
    if (_1039)
    {
        float _1125 = _1109 ? _993 : _967;
        _1047 = _1125;
    }
    float _1127 = _1047;
    float _1129 = _1077 * 0.5;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1133 = _1131;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_999)
    {
        bool _1137 = _975 > 0.5;
        _1049 = _1137;
    }
    bool _1139 = _1049;
    out.m_63.x = _512;
    out.m_63.y = _540;
    out.m_63.z = _510;
    float _1141 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1131);
    float _1143 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1145 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1093);
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1149 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1141);
    if (_1089)
    {
        _1133 = _975;
    }
    float _1151 = _1133;
    float _1153 = fma(_1097, _1143, -0.5);
    float _1155 = _1151;
    if (!_1089)
    {
        _1135 = _971;
    }
    float _1157 = _1135;
    float _1159 = -_1145;
    float _1161 = fma(_1149, _1111, _1159);
    float _1163 = _1157;
    if (!_1089)
    {
        _1155 = _979;
    }
    float _1165 = _1155;
    if (_999)
    {
        float _1167 = -_1081;
        float _1169 = _1167 + 1.0;
        _1115 = as_type<int>(_1169);
    }
    int _1171 = _1115;
    float _1173 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1147);
    if (_1089)
    {
        _1163 = _975;
    }
    float _1175 = _1163;
    float _1177 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1179 = _965 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_999)
    {
        float _1181 = _1139 ? as_type<float>(_1171) : _1081;
        _1079 = _1181;
    }
    float _1183 = _1079;
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1187 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1191 = fma(_1179, _1127, -0.5);
    float _1193 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1185);
    float _1195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1197 = -_1189;
    float _1199 = fma(_1187, 2.0, _1197);
    float _1201 = -_983;
    float _1203 = fma(_1177, 2.0, _1201);
    if (!_1017)
    {
        _1051 = _1081;
    }
    float _1205 = _1051;
    float _1207 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[88].z, _987);
    float _1209 = _1205;
    if (_1017)
    {
        float _1211 = _1109 ? as_type<float>(_1107) : _1081;
        _1209 = _1211;
    }
    float _1213 = _1209;
    float _1215 = -_138;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1199);
    if (_1027)
    {
        float _1219 = _1003 ? as_type<float>(_1123) : _1081;
        _1101 = _1219;
    }
    float _1221 = _1101;
    float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1225 = -_138;
    float _1227 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1203);
    if (!_1089)
    {
        _1117 = _979;
    }
    float _1229 = _1117;
    out.m_65.x = _628;
    out.m_65.y = _624;
    out.m_65.z = _632;
    float _1231 = _1229;
    if (_1089)
    {
        _1231 = _971;
    }
    float _1233 = _1231;
    float _1235 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1089)
    {
        _1053 = _971;
    }
    float _1237 = _1053;
    float _1239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_1089)
    {
        _1055 = _975;
    }
    float _1241 = _1055;
    float _1243 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1235);
    float _1245 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1247 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1249 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1001);
    float _1251 = fma(_1245, -2.0, _995);
    float _1253 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1255 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1243);
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1259 = fma(_1253, _1213, -0.5);
    float _1261 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1263 = _1257 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1265 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1267 = fma(_1247, _1183, -0.5);
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1271 = fma(_1265, _1221, -0.5);
    float _1273 = fma(_1255, _1267, _1085);
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1279 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1193);
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1287 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1289 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1293 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1295 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1297 = fma(_1261, -2.0, _1283);
    out.m_67.x = _1287;
    out.m_67.y = _1289;
    out.m_67.z = _1263;
    float _1299 = fma(_1279, _1259, _1217);
    float _1301 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1249);
    float _1303 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1251);
    out.m_69.x = _1291;
    out.m_69.y = _1293;
    out.m_69.z = _1295;
    float _1305 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1297);
    bool _1307 = _642 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1309 = isnan(_642);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1315 = _1311 || _1313;
    float _1317 = -_1303;
    float _1319 = fma(_1301, _1153, _1317);
    float _1321 = in.m_71.x;
    float _1323 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1207);
    float _1325 = in.m_71.y;
    float _1327 = _1273 + 0.5;
    float _1329 = _1299 + 0.5;
    float _1331 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1173);
    float _1333 = _830 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1335 = fma(_1323, _1271, _1227);
    float _1337 = _1161 + 0.5;
    float _1339 = -_1305;
    float _1341 = fma(_1331, _1191, _1339);
    float _1343 = _1319 + 0.5;
    float _1345 = _1335 + 0.5;
    float _1347 = exp2(_1333);
    float _1349 = _1341 + 0.5;
    float _1351 = _882 * 0.5;
    out.m_73.x = _1327;
    out.m_73.y = _1337;
    out.m_73.z = _1329;
    out.m_73.w = _1343;
    float _1353 = fma(_922, -0.5, _1351);
    out.m_75.x = _1345;
    out.m_75.y = _1349;
    if (!_1315)
    {
        _674 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1355 = _674;
    float _1357 = _1355;
    float _1359 = _1355;
    if (!_1315)
    {
        _676 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1361 = _676;
    out.m_77.x = _1321;
    float _1363 = _1361;
    float _1365 = _1361;
    if (!_1315)
    {
        _678 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1367 = _678;
    out.m_77.y = _1325;
    float _1369 = -_1347;
    float _1371 = _1369 + 1.0;
    out.m_79.x = _1035;
    out.m_79.y = _1353;
    out.m_79.z = _1129;
    out.m_79.w = _882;
    float _1373 = _1371 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _920;
    out.gl_Position.y = _922;
    out.gl_Position.z = _1065;
    out.gl_Position.w = _882;
    float _1375 = -_1373;
    float _1377 = _1375 + 1.0;
    float _1379 = _1373;
    float _1381 = _1367;
    float _1383 = _1367;
    if (!_1315)
    {
        _1057 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1385 = _1057;
    float _1387 = _1385;
    float _1389 = _1385;
    if (!_1315)
    {
        _1059 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1391 = _1059;
    float _1393 = _1373 * _936;
    float _1395 = _1391;
    float _1397 = _1391;
    if (!_1315)
    {
        _1379 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1399 = _1379;
    float _1401 = _951 * _1393;
    float _1403 = _951 * _1377;
    float _1405 = _961 * _1393;
    float _1407 = fma(_957, _1401, _945);
    float _1409 = fma(_959, _1401, _947);
    float _1411 = fma(_951, _1405, _949);
    out.m_81.x = _1407;
    out.m_81.y = _1409;
    out.m_81.z = _1411;
    out.m_81.w = _1403;
    bool _1413 = !_1315;
    float _1415 = _1399;
    float _1417 = _1399;
    if (!_1413)
    {
        bool _1419 = _642 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1421 = isnan(_642);
        bool _1423 = _1419 || _1421;
        bool _1425 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1427 = _1423 || _1425;
        if (!_1427)
        {
            float _1429 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1431 = _642 + _1429;
            float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1435 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1433;
            float _1437 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1439 = _1437 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1441 = 1.0 / _1435;
            float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1445 = _1443 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1447 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1449 = _1447 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1451 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1453 = _1451 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1455 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1457 = _1455 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1459 = _1431 * _1441;
            float _1461 = precise::clamp(_1459, 0.0, 1.0);
            float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1465 = _1463 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1467 = fma(_1461, _1439, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1469 = fma(_1461, _1465, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1471 = fma(_1461, _1445, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1473 = fma(_1461, _1449, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1475 = fma(_1461, _1453, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1477 = fma(_1461, _1457, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1397 = _1471;
            _1383 = _1475;
            _1389 = _1467;
            _1365 = _1473;
            _1359 = _1469;
            _1417 = _1477;
            _1479 = true;
        }
        else
        {
            bool _1481 = _642 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1483 = isnan(_642);
            bool _1485 = _1481 || _1483;
            bool _1487 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1489 = _1485 || _1487;
            if (!_1489)
            {
                _1387 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1491 = _1387;
            _1389 = _1491;
            if (!_1489)
            {
                _1395 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1493 = _1395;
            _1397 = _1493;
            if (!_1489)
            {
                _1357 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1495 = _1357;
            _1359 = _1495;
            if (!_1489)
            {
                _1363 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1497 = _1363;
            _1365 = _1497;
            if (!_1489)
            {
                _1381 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1499 = _1381;
            _1383 = _1499;
            if (!_1489)
            {
                _1415 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1501 = _1415;
            bool _1503 = !_1489;
            _1417 = _1501;
            if (!_1503)
            {
                bool _1505 = _642 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1507 = isnan(_642);
                bool _1509 = _1505 || _1507;
                bool _1511 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1513 = _1509 || _1511;
                if (!_1513)
                {
                    float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1517 = _642 + _1515;
                    float _1519 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1521 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1519;
                    float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1525 = _1523 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1527 = 1.0 / _1521;
                    float _1529 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1531 = _1529 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1533 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1535 = _1533 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1539 = _1537 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1543 = _1541 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1545 = _1517 * _1527;
                    float _1547 = precise::clamp(_1545, 0.0, 1.0);
                    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1551 = _1549 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1553 = fma(_1547, _1525, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1555 = fma(_1547, _1551, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1557 = fma(_1547, _1531, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1559 = fma(_1547, _1535, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1561 = fma(_1547, _1539, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1563 = fma(_1547, _1543, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1397 = _1557;
                    _1383 = _1561;
                    _1389 = _1553;
                    _1365 = _1559;
                    _1359 = _1555;
                    _1417 = _1563;
                    _1479 = true;
                }
                else
                {
                    _1397 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1383 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1389 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1365 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1359 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1417 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1479 = false;
    float _1565 = _1397;
    float _1567 = _1383;
    float _1569 = _1389;
    float _1571 = _1365;
    float _1573 = _1359;
    float _1575 = _1417;
    float _1577 = fma(_540, -0.5, 0.5);
    float _1579 = precise::clamp(_1577, 0.0, 1.0);
    float _1581 = -_1565;
    float _1583 = _1581 + _1567;
    float _1585 = -_1569;
    float _1587 = _1585 + _1571;
    float _1589 = -_1573;
    float _1591 = _1589 + _1575;
    bool _1593 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1595 = fma(_1579, _1583, _1565);
    float _1597 = fma(_1579, _1587, _1569);
    float _1599 = fma(_1579, _1591, _1573);
    float _1601 = _1595 * 0.586610972881317138671875;
    out.m_83.x = 0.0;
    float _1603 = fma(_1597, 0.298911988735198974609375, _1601);
    float _1605 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1607 = fma(_1599, 0.114477999508380889892578125, _1603);
    out.m_47.x = _1605;
    float _1609 = -_1607;
    float _1611 = _1597 + _1609;
    float _1613 = -_1607;
    float _1615 = _1595 + _1613;
    float _1617 = -_1607;
    float _1619 = _1599 + _1617;
    float _1621 = fma(_1611, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1607);
    float _1623 = fma(_1615, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1607);
    float _1625 = fma(_1619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1607);
    out.m_85.x = _1621;
    out.m_85.y = _1623;
    out.m_85.z = _1625;
    if (!_1593)
    {
        return out;
    }
    float _1627 = -_612;
    float _1629 = _1627 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1631 = -_616;
    float _1633 = _1631 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1635 = -_620;
    float _1637 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1639 = _1629 * _1629;
    float _1641 = fma(_1633, _1633, _1639);
    float _1643 = fma(_1637, _1637, _1641);
    float _1645 = sqrt(_1643);
    float _1647 = rsqrt(_1643);
    float _1649 = -_1645;
    float _1651 = _1649 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1653 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1655 = precise::clamp(_1653, 0.0, 1.0);
    float _1657 = _1633 * _1647;
    float _1659 = _1629 * _1647;
    float _1661 = abs(_1655);
    float _1663 = log2(_1661);
    float _1665 = _1637 * _1647;
    float _1667 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1669 = _540 * _1659;
    float _1671 = -_1659;
    float _1673 = -_1667;
    float _1675 = fma(_1671, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1673);
    float _1677 = fma(_512, _1657, _1669);
    float _1679 = -_1665;
    float _1681 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1675);
    float _1683 = fma(_510, _1665, _1677);
    float _1685 = precise::clamp(_1683, 0.0, 1.0);
    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1689 = _1681 + _1687;
    float _1691 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1693 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1695 = precise::clamp(_1693, 0.0, 1.0);
    float _1697 = exp2(_1691);
    float _1699 = _1697 * _1695;
    float _1701 = _1685 * _1699;
    float _1703 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1705 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1707 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _1703;
    out.m_83.y = _1705;
    out.m_83.z = _1707;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1479 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1765 = as_type<float>(_120);
        out.gl_Position.z = _1765;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_134)
    {
        float _140 = float(_104);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _138 >= _142;
    bool _146 = !_134;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _122 = as_type<int>(_154);
    }
    int _156 = _122;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1834 = as_type<float>(_156);
        out.gl_Position.z = _1834;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_51.w;
    float _160 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_49.x;
    float _174 = in.m_49.y;
    float _176 = in.m_49.z;
    float _178 = in.m_44.x;
    float _180 = in.m_44.y;
    float _182 = in.m_44.z;
    float _184 = 0.0;
    float _186 = _160;
    if (!_170)
    {
        float _188 = _160 * _160;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_170)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    bool _200 = !_170;
    float _202 = _198;
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _160 * _206;
        float _216 = 1.0 / _210;
        float _218 = _212 * 0.693147182464599609375;
        float _220 = exp2(_214);
        float _222 = 1.0 / _218;
        float _224 = _220 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _222, _160);
        float _230 = _228 * _216;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _232;
    }
    float _234 = _202;
    bool _236 = !_170;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _160 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _186 = _256;
    }
    float _258 = _186;
    float _260 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _264 = fma(_258, _174, _260);
    float _266 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _268 = fma(_258, _172, _262);
    float _270 = fma(_264, _158, _180);
    float _272 = fma(_258, _176, _266);
    float _274 = fma(_268, _158, _178);
    float _276 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _278 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _280 = fma(_272, _158, _182);
    float _282 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _284 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _276);
    float _286 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _278);
    float _288 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _282);
    float _290 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].z, _284);
    float _292 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].z, _286);
    float _294 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].z, _288);
    float _296 = _290 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _298 = _292 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _300 = _294 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _304 = _296 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _308 = _298 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _312 = _300 + _310;
    float _314 = _304 * _304;
    float _316 = fma(_308, _308, _314);
    float _318 = fma(_312, _312, _316);
    float _320 = in.m_51.x;
    float _322 = in.m_51.y;
    float _324 = in.m_51.z;
    float _326 = rsqrt(_318);
    float _328 = _304 * _326;
    float _330 = _308 * _326;
    float _332 = _312 * _326;
    float _334 = -_328;
    float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    float _338 = -_330;
    float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _308);
    float _342 = -_332;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[18].w, _312);
    float _346 = _322 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _348 = _336 * _336;
    float _350 = _320 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _352 = _324 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = _346 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _356 = fma(_340, _340, _348);
    float _358 = _350 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _360 = in.m_53.x;
    float _362 = in.m_53.y;
    float _364 = in.m_53.z;
    float _366 = _352 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _368 = fma(_344, _344, _356);
    float _370 = sqrt(_368);
    float _372 = _326 * _370;
    float _374 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _362);
    float _376 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _360);
    float _378 = _354 * _372;
    float _380 = _358 * _372;
    float _382 = _366 * _372;
    bool _384 = _362 != 0.0;
    bool _386 = isnan(_362);
    bool _388 = _384 || _386;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    float _394 = _378 * _374;
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _364);
    float _398 = _380 * _376;
    bool _400 = _360 == 0.0;
    bool _402 = !_392;
    bool _404 = _400 && _402;
    float _406 = _394 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _408 = _382 * _396;
    float _410 = _394 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _412 = _394 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _414 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[9].x, _406);
    float _416 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[8].x, _410);
    float _418 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[10].x, _412);
    float _420 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[9].z, _414);
    bool _422 = _364 == 0.0;
    bool _424 = _422 && _404;
    float _426 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[8].z, _416);
    float _428 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[10].z, _418);
    float _430 = _296 + _420;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[191].z + _432;
    float _436 = _298 + _426;
    float _438 = _300 + _428;
    float _440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _442 = _430 + _440;
    float _444 = 1.0 / _434;
    float _446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _448 = _436 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _452 = _438 + _450;
    float _454 = _442 * _442;
    float _456 = fma(_448, _448, _454);
    float _458 = in.m_55.x;
    float _460 = in.m_55.y;
    float _462 = in.m_55.z;
    float _464 = fma(_452, _452, _456);
    float _466 = sqrt(_464);
    float _468 = precise::max(_466, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _470 = _460;
    float _472 = _458;
    float _474 = _462;
    if (!_424)
    {
        float _476 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[17].y, _460);
        _470 = _476;
    }
    float _478 = _470;
    if (!_424)
    {
        float _480 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[17].y, _458);
        _472 = _480;
    }
    float _482 = _472;
    float _484 = _482;
    if (!_424)
    {
        float _486 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[17].y, _462);
        _474 = _486;
    }
    float _488 = _474;
    float _490 = precise::min(_468, (*spvDescriptorSet0.vp_c9)._m0[191].z);
    float _492 = _478 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _494 = _478 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _496 = _478 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _500 = _490 + _498;
    float _502 = fma(_482, (*spvDescriptorSet0.vp_c10)._m0[10].x, _492);
    float _504 = fma(_482, (*spvDescriptorSet0.vp_c10)._m0[8].x, _494);
    float _506 = -_500;
    float _508 = fma(_506, _444, 1.0);
    float _510 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[10].z, _502);
    float _512 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[8].z, _504);
    float _514 = _508 * (*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _516 = -_510;
    float _518 = fma(_516, _514, _438);
    float _520 = -_512;
    float _522 = fma(_520, _514, _436);
    float _524 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _526 = _518 + _524;
    float _528 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _530 = _522 + _528;
    float _532 = _526 * _526;
    float _534 = fma(_530, _530, _532);
    float _536 = fma(_482, (*spvDescriptorSet0.vp_c10)._m0[9].x, _496);
    float _538 = sqrt(_534);
    float _540 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[9].z, _536);
    float _542 = -_540;
    float _544 = fma(_542, _514, _430);
    bool _546 = _538 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _548 = _496;
    float _550 = _488;
    float _552 = _518;
    if (!_546)
    {
        _548 = _522;
    }
    float _554 = _548;
    float _556 = _554;
    if (!_546)
    {
        _484 = _518;
    }
    float _558 = _484;
    float _560 = _558;
    if (!_546)
    {
        _550 = _544;
    }
    float _562 = _550;
    bool _564 = !_546;
    float _566 = _562;
    if (!_564)
    {
        float _568 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _570 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _572 = _538 + _570;
        float _574 = _544 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _576 = _572 * _568;
        float _578 = rsqrt(_534);
        float _580 = _576 * 0.15915493667125701904296875;
        float _582 = _580 * 6.283185482025146484375;
        float _584 = cos(_582);
        float _586 = _580 * 6.283185482025146484375;
        float _588 = sin(_586);
        float _590 = _584 + (-1.0);
        float _592 = fma(_588, _574, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _594 = _590 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _596 = _578 * _592;
        float _598 = fma(_544, _584, _594);
        float _600 = fma(_530, _596, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _602 = fma(_526, _596, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _566 = _598;
        _556 = _600;
        _560 = _602;
    }
    float _604 = _566;
    float _606 = _556;
    float _608 = _560;
    float _610 = -_328;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _604);
    float _614 = -_330;
    float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[18].w, _606);
    float _618 = -_332;
    float _620 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[18].w, _608);
    float _622 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _624 = _612 + _622;
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _628 = _616 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _632 = _620 + _630;
    float _634 = _624 * _624;
    float _636 = fma(_628, _628, _634);
    float _638 = fma(_632, _632, _636);
    float _640 = rsqrt(_638);
    float _642 = sqrt(_638);
    float _644 = _640 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _646 = _628 * _644;
    float _648 = _632 * _644;
    float _650 = _646 * _646;
    float _652 = _648 * _648;
    float _654 = _650 + _652;
    float _656 = sqrt(_654);
    bool _658 = _656 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _660 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _662 = _656 + _660;
    float _664 = _636;
    float _666 = _654;
    float _668 = _662;
    float _670 = _644;
    float _672 = _646;
    float _674 = _632;
    float _676 = _624;
    float _678 = _628;
    if (_658)
    {
        float _680 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _664 = _680;
    }
    float _682 = _664;
    if (_658)
    {
        float _684 = rsqrt(_654);
        _666 = _684;
    }
    float _686 = _666;
    float _688 = _686;
    if (_658)
    {
        float _690 = _662 * _682;
        _668 = _690;
    }
    float _692 = _668;
    if (_658)
    {
        float _694 = _692 * 0.15915493667125701904296875;
        _552 = _694;
    }
    float _696 = _552;
    float _698 = _682;
    float _700 = _696;
    if (_658)
    {
        float _702 = _696 * 6.283185482025146484375;
        float _704 = sin(_702);
        _698 = _704;
    }
    float _706 = _698;
    float _708 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _710 = precise::max(0.0, _708);
    float _712 = _544;
    float _714 = _710;
    if (_658)
    {
        float _716 = _696 * 6.283185482025146484375;
        float _718 = cos(_716);
        _712 = _718;
    }
    float _720 = _712;
    float _722 = -_644;
    float _724 = -_710;
    float _726 = fma(_624, _722, _724);
    if (_658)
    {
        float _728 = _726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _714 = _728;
    }
    float _730 = _714;
    float _732 = _706;
    float _734 = _730;
    if (_658)
    {
        float _736 = fma(_706, _730, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _732 = _736;
    }
    float _738 = _732;
    float _740 = _738;
    float _742 = _720;
    if (_658)
    {
        float _744 = _720 + (-1.0);
        _734 = _744;
    }
    float _746 = _734;
    float _748 = _746;
    if (_658)
    {
        float _750 = _686 * _738;
        _670 = _750;
    }
    float _752 = _670;
    if (!_658)
    {
        _740 = _726;
    }
    float _754 = _740;
    float _756 = _754;
    if (_658)
    {
        float _758 = _746 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _700 = _758;
    }
    float _760 = _700;
    if (_658)
    {
        float _762 = _646 * _752;
        _672 = _762;
    }
    float _764 = _672;
    if (!_658)
    {
        _748 = _648;
    }
    float _766 = _748;
    float _768 = _766;
    if (_658)
    {
        float _770 = _648 * _752;
        _768 = _770;
    }
    float _772 = _768;
    if (!_658)
    {
        _688 = _650;
    }
    float _774 = _688;
    float _776 = _774;
    if (_658)
    {
        float _778 = fma(_726, _720, _760);
        _756 = _778;
    }
    float _780 = _756;
    if (_658)
    {
        float _782 = _764 * _764;
        _776 = _782;
    }
    float _784 = _776;
    if (!_658)
    {
        _742 = _652;
    }
    float _786 = _742;
    float _788 = _786;
    if (_658)
    {
        float _790 = _772 * _772;
        _788 = _790;
    }
    float _792 = _788;
    float _794 = fma(_780, _780, _784);
    float _796 = _612 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _798 = _794 + _792;
    float _800 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _802 = fma(_642, (*spvDescriptorSet0.vp_c15)._m0[23].w, _800);
    float _804 = precise::clamp(_802, 0.0, 1.0);
    float _806 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[2].x, _796);
    float _808 = _612 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _810 = rsqrt(_798);
    float _812 = -_804;
    float _814 = _812 + 1.0;
    float _816 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[2].z, _806);
    float _818 = _612 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _820 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[1].x, _808);
    float _822 = _612 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _824 = _816 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _826 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[0].x, _818);
    float _828 = abs(_814);
    float _830 = log2(_828);
    float _832 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[1].z, _820);
    float _834 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _836 = _824 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _838 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[0].z, _826);
    float _840 = _832 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _842 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[3].x, _822);
    float _844 = -_836;
    float _846 = fma(_844, _834, 1.0);
    float _848 = _810 * _764;
    float _850 = _838 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _852 = _840 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _854 = _810 * _780;
    float _856 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[3].z, _842);
    float _858 = _848 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _860 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[7].x, _852);
    float _862 = _810 * _772;
    float _864 = _856 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _866 = -_858;
    float _868 = fma(_854, (*spvDescriptorSet0.vp_c15)._m0[21].y, _866);
    float _870 = _830 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _872 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[7].z, _860);
    float _874 = log2(_846);
    float _876 = -_862;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c15)._m0[21].z, _868);
    float _880 = _840 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _882 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[7].w, _872);
    float _884 = _840 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _886 = fma(_878, -0.5, 0.5);
    float _888 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[4].x, _880);
    float _890 = fma(_878, 0.5, 0.5);
    float _892 = exp2(_870);
    float _894 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[5].x, _884);
    float _896 = _854 + 1.0;
    float _898 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[4].z, _888);
    float _900 = fma(_890, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _902 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[5].z, _894);
    float _904 = 1.0 / _882;
    float _906 = fma(_890, _900, -0.212114393711090087890625);
    float _908 = _874 * 0.693147182464599609375;
    float _910 = fma(_890, _906, 1.570728778839111328125);
    float _912 = _908 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _914 = sqrt(_886);
    float _916 = -_854;
    float _918 = fma(_892, _896, _916);
    float _920 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[4].w, _898);
    float _922 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[5].w, _902);
    float _924 = fma(_918, 0.5, 0.5);
    float _926 = _920 * _904;
    float _928 = _922 * _904;
    float _930 = fma(_926, 0.5, 0.5);
    float _932 = fma(_928, -0.5, 0.5);
    float _934 = _914 * 0.636619746685028076171875;
    float3 _3120 = float3(_930, _932, _912);
    float _936 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3120, float3(0.0), isnan(_3120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3120, float3(0.0), isnan(_3120)), level(0.0)).x;
    float _938 = -_910;
    float _940 = fma(_934, _938, 1.0);
    float3 _3136 = float3(_930, _932, _912);
    float4 _943 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3136, float3(0.0), isnan(_3136)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3136, float3(0.0), isnan(_3136)), level(0.0)).xyzw;
    float _945 = _943.x;
    float _947 = _943.y;
    float _949 = _943.z;
    float _951 = _943.w;
    float2 _3153 = float2(_940, _924);
    float3 _955 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3153, float2(0.0), isnan(_3153)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3153, float2(0.0), isnan(_3153)), level(0.0)).xyz;
    float _957 = _955.x;
    float _959 = _955.y;
    float _961 = _955.z;
    float _963 = in.m_57.w;
    float _965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _967 = in.m_59.y;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _971 = in.m_57.y;
    float _973 = _840 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _975 = in.m_57.x;
    float _977 = in.m_59.x;
    float _979 = in.m_57.z;
    float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _985 = _963 > 0.5;
    float _987 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _991 = -_967;
    float _993 = _991 + 1.0;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _999 = _997 != 0;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1003 = _971 > 0.5;
    float _1005 = _971 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1009 = _1007 != 0;
    float _1011 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[6].x, _973);
    float _1013 = _1003 ? _993 : _967;
    out.m_61.x = _466;
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1017 = _1015 != 0;
    float _1019 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1011);
    float _1021 = _1009 ? _1013 : _967;
    float _1023 = _920 + _882;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1027 = _1025 != 0;
    float _1029 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1019);
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1033 = _1031 != 0;
    float _1035 = _1023 * 0.5;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1039 = _1037 != 0;
    float _1041 = _975 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1043 = _1013;
    float _1045 = _1041;
    float _1047 = _967;
    bool _1049 = _1039;
    float _1051 = _983;
    float _1053 = _979;
    float _1055 = _971;
    float _1057 = _920;
    float _1059 = _922;
    if (!_999)
    {
        _1043 = _977;
    }
    float _1061 = _1043;
    float _1063 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1065 = _1029 + _1063;
    int _1067 = _985 ? as_type<int>(_993) : as_type<int>(_967);
    float _1069 = -_969;
    float _1071 = fma(_1041, 2.0, _1069);
    float _1073 = _1061;
    if (!_999)
    {
        _1045 = _1061;
    }
    float _1075 = _1045;
    float _1077 = _882 + _1065;
    float _1079 = _1075;
    if (_999)
    {
        _1073 = _977;
    }
    float _1081 = _1073;
    float _1083 = -_138;
    float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1071);
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1089 = _1087 != 0;
    float _1091 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1093 = fma(_1005, -2.0, _989);
    float _1095 = _981 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1097 = _1033 ? as_type<float>(_1067) : _967;
    int _1099 = 0;
    float _1101 = _1081;
    if (_1017)
    {
        float _1103 = -_1081;
        float _1105 = _1103 + 1.0;
        _1099 = as_type<int>(_1105);
    }
    int _1107 = _1099;
    bool _1109 = _979 > 0.5;
    float _1111 = fma(_1095, _1021, -0.5);
    int _1113 = 0;
    int _1115 = as_type<int>(_1111);
    float _1117 = as_type<float>(_1107);
    if (_1027)
    {
        float _1119 = -_1081;
        float _1121 = _1119 + 1.0;
        _1113 = as_type<int>(_1121);
    }
    int _1123 = _1113;
    if (_1039)
    {
        float _1125 = _1109 ? _993 : _967;
        _1047 = _1125;
    }
    float _1127 = _1047;
    float _1129 = _1077 * 0.5;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1133 = _1131;
    float _1135 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_999)
    {
        bool _1137 = _975 > 0.5;
        _1049 = _1137;
    }
    bool _1139 = _1049;
    out.m_63.x = _512;
    out.m_63.y = _540;
    out.m_63.z = _510;
    float _1141 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1131);
    float _1143 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1145 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1093);
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1149 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1141);
    if (_1089)
    {
        _1133 = _975;
    }
    float _1151 = _1133;
    float _1153 = fma(_1097, _1143, -0.5);
    float _1155 = _1151;
    if (!_1089)
    {
        _1135 = _971;
    }
    float _1157 = _1135;
    float _1159 = -_1145;
    float _1161 = fma(_1149, _1111, _1159);
    float _1163 = _1157;
    if (!_1089)
    {
        _1155 = _979;
    }
    float _1165 = _1155;
    if (_999)
    {
        float _1167 = -_1081;
        float _1169 = _1167 + 1.0;
        _1115 = as_type<int>(_1169);
    }
    int _1171 = _1115;
    float _1173 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1147);
    if (_1089)
    {
        _1163 = _975;
    }
    float _1175 = _1163;
    float _1177 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1179 = _965 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_999)
    {
        float _1181 = _1139 ? as_type<float>(_1171) : _1081;
        _1079 = _1181;
    }
    float _1183 = _1079;
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1187 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1191 = fma(_1179, _1127, -0.5);
    float _1193 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1185);
    float _1195 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1197 = -_1189;
    float _1199 = fma(_1187, 2.0, _1197);
    float _1201 = -_983;
    float _1203 = fma(_1177, 2.0, _1201);
    if (!_1017)
    {
        _1051 = _1081;
    }
    float _1205 = _1051;
    float _1207 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[88].z, _987);
    float _1209 = _1205;
    if (_1017)
    {
        float _1211 = _1109 ? as_type<float>(_1107) : _1081;
        _1209 = _1211;
    }
    float _1213 = _1209;
    float _1215 = -_138;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1199);
    if (_1027)
    {
        float _1219 = _1003 ? as_type<float>(_1123) : _1081;
        _1101 = _1219;
    }
    float _1221 = _1101;
    float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1225 = -_138;
    float _1227 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1203);
    if (!_1089)
    {
        _1117 = _979;
    }
    float _1229 = _1117;
    out.m_65.x = _628;
    out.m_65.y = _624;
    out.m_65.z = _632;
    float _1231 = _1229;
    if (_1089)
    {
        _1231 = _971;
    }
    float _1233 = _1231;
    float _1235 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1089)
    {
        _1053 = _971;
    }
    float _1237 = _1053;
    float _1239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_1089)
    {
        _1055 = _975;
    }
    float _1241 = _1055;
    float _1243 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1235);
    float _1245 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1247 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1249 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1001);
    float _1251 = fma(_1245, -2.0, _995);
    float _1253 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1255 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1243);
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1259 = fma(_1253, _1213, -0.5);
    float _1261 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1263 = _1257 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1265 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1267 = fma(_1247, _1183, -0.5);
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1271 = fma(_1265, _1221, -0.5);
    float _1273 = fma(_1255, _1267, _1085);
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1279 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1193);
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1287 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1289 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1293 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1295 = _1285 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1297 = fma(_1261, -2.0, _1283);
    out.m_67.x = _1287;
    out.m_67.y = _1289;
    out.m_67.z = _1263;
    float _1299 = fma(_1279, _1259, _1217);
    float _1301 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1249);
    float _1303 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1251);
    out.m_69.x = _1291;
    out.m_69.y = _1293;
    out.m_69.z = _1295;
    float _1305 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1297);
    bool _1307 = _642 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1309 = isnan(_642);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1315 = _1311 || _1313;
    float _1317 = -_1303;
    float _1319 = fma(_1301, _1153, _1317);
    float _1321 = in.m_71.x;
    float _1323 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1207);
    float _1325 = in.m_71.y;
    float _1327 = _1273 + 0.5;
    float _1329 = _1299 + 0.5;
    float _1331 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1173);
    float _1333 = _830 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1335 = fma(_1323, _1271, _1227);
    float _1337 = _1161 + 0.5;
    float _1339 = -_1305;
    float _1341 = fma(_1331, _1191, _1339);
    float _1343 = _1319 + 0.5;
    float _1345 = _1335 + 0.5;
    float _1347 = exp2(_1333);
    float _1349 = _1341 + 0.5;
    float _1351 = _882 * 0.5;
    out.m_73.x = _1327;
    out.m_73.y = _1337;
    out.m_73.z = _1329;
    out.m_73.w = _1343;
    float _1353 = fma(_922, -0.5, _1351);
    out.m_75.x = _1345;
    out.m_75.y = _1349;
    if (!_1315)
    {
        _674 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1355 = _674;
    float _1357 = _1355;
    float _1359 = _1355;
    if (!_1315)
    {
        _676 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1361 = _676;
    out.m_77.x = _1321;
    float _1363 = _1361;
    float _1365 = _1361;
    if (!_1315)
    {
        _678 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1367 = _678;
    out.m_77.y = _1325;
    float _1369 = -_1347;
    float _1371 = _1369 + 1.0;
    out.m_79.x = _1035;
    out.m_79.y = _1353;
    out.m_79.z = _1129;
    out.m_79.w = _882;
    float _1373 = _1371 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _920;
    out.gl_Position.y = _922;
    out.gl_Position.z = _1065;
    out.gl_Position.w = _882;
    float _1375 = -_1373;
    float _1377 = _1375 + 1.0;
    float _1379 = _1373;
    float _1381 = _1367;
    float _1383 = _1367;
    if (!_1315)
    {
        _1057 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1385 = _1057;
    float _1387 = _1385;
    float _1389 = _1385;
    if (!_1315)
    {
        _1059 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1391 = _1059;
    float _1393 = _1373 * _936;
    float _1395 = _1391;
    float _1397 = _1391;
    if (!_1315)
    {
        _1379 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1399 = _1379;
    float _1401 = _951 * _1393;
    float _1403 = _951 * _1377;
    float _1405 = _961 * _1393;
    float _1407 = fma(_957, _1401, _945);
    float _1409 = fma(_959, _1401, _947);
    float _1411 = fma(_951, _1405, _949);
    out.m_81.x = _1407;
    out.m_81.y = _1409;
    out.m_81.z = _1411;
    out.m_81.w = _1403;
    bool _1413 = !_1315;
    float _1415 = _1399;
    float _1417 = _1399;
    if (!_1413)
    {
        bool _1419 = _642 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1421 = isnan(_642);
        bool _1423 = _1419 || _1421;
        bool _1425 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1427 = _1423 || _1425;
        if (!_1427)
        {
            float _1429 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1431 = _642 + _1429;
            float _1433 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1435 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1433;
            float _1437 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1439 = _1437 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1441 = 1.0 / _1435;
            float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1445 = _1443 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1447 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1449 = _1447 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1451 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1453 = _1451 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1455 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1457 = _1455 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1459 = _1431 * _1441;
            float _1461 = precise::clamp(_1459, 0.0, 1.0);
            float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1465 = _1463 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1467 = fma(_1461, _1439, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1469 = fma(_1461, _1465, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1471 = fma(_1461, _1445, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1473 = fma(_1461, _1449, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1475 = fma(_1461, _1453, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1477 = fma(_1461, _1457, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1397 = _1471;
            _1383 = _1475;
            _1389 = _1467;
            _1365 = _1473;
            _1359 = _1469;
            _1417 = _1477;
            _1479 = true;
        }
        else
        {
            bool _1481 = _642 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1483 = isnan(_642);
            bool _1485 = _1481 || _1483;
            bool _1487 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1489 = _1485 || _1487;
            if (!_1489)
            {
                _1387 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1491 = _1387;
            _1389 = _1491;
            if (!_1489)
            {
                _1395 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1493 = _1395;
            _1397 = _1493;
            if (!_1489)
            {
                _1357 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1495 = _1357;
            _1359 = _1495;
            if (!_1489)
            {
                _1363 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1497 = _1363;
            _1365 = _1497;
            if (!_1489)
            {
                _1381 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1499 = _1381;
            _1383 = _1499;
            if (!_1489)
            {
                _1415 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1501 = _1415;
            bool _1503 = !_1489;
            _1417 = _1501;
            if (!_1503)
            {
                bool _1505 = _642 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1507 = isnan(_642);
                bool _1509 = _1505 || _1507;
                bool _1511 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1513 = _1509 || _1511;
                if (!_1513)
                {
                    float _1515 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1517 = _642 + _1515;
                    float _1519 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1521 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1519;
                    float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1525 = _1523 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1527 = 1.0 / _1521;
                    float _1529 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1531 = _1529 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1533 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1535 = _1533 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1539 = _1537 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1543 = _1541 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1545 = _1517 * _1527;
                    float _1547 = precise::clamp(_1545, 0.0, 1.0);
                    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1551 = _1549 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1553 = fma(_1547, _1525, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1555 = fma(_1547, _1551, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1557 = fma(_1547, _1531, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1559 = fma(_1547, _1535, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1561 = fma(_1547, _1539, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1563 = fma(_1547, _1543, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1397 = _1557;
                    _1383 = _1561;
                    _1389 = _1553;
                    _1365 = _1559;
                    _1359 = _1555;
                    _1417 = _1563;
                    _1479 = true;
                }
                else
                {
                    _1397 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1383 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1389 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1365 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1359 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1417 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1479 = false;
    float _1565 = _1397;
    float _1567 = _1383;
    float _1569 = _1389;
    float _1571 = _1365;
    float _1573 = _1359;
    float _1575 = _1417;
    float _1577 = fma(_540, -0.5, 0.5);
    float _1579 = precise::clamp(_1577, 0.0, 1.0);
    float _1581 = -_1565;
    float _1583 = _1581 + _1567;
    float _1585 = -_1569;
    float _1587 = _1585 + _1571;
    float _1589 = -_1573;
    float _1591 = _1589 + _1575;
    bool _1593 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1595 = fma(_1579, _1583, _1565);
    float _1597 = fma(_1579, _1587, _1569);
    float _1599 = fma(_1579, _1591, _1573);
    float _1601 = _1595 * 0.586610972881317138671875;
    out.m_83.x = 0.0;
    float _1603 = fma(_1597, 0.298911988735198974609375, _1601);
    float _1605 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1607 = fma(_1599, 0.114477999508380889892578125, _1603);
    out.m_47.x = _1605;
    float _1609 = -_1607;
    float _1611 = _1597 + _1609;
    float _1613 = -_1607;
    float _1615 = _1595 + _1613;
    float _1617 = -_1607;
    float _1619 = _1599 + _1617;
    float _1621 = fma(_1611, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1607);
    float _1623 = fma(_1615, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1607);
    float _1625 = fma(_1619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1607);
    out.m_85.x = _1621;
    out.m_85.y = _1623;
    out.m_85.z = _1625;
    if (!_1593)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1627 = -_612;
    float _1629 = _1627 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1631 = -_616;
    float _1633 = _1631 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1635 = -_620;
    float _1637 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1639 = _1629 * _1629;
    float _1641 = fma(_1633, _1633, _1639);
    float _1643 = fma(_1637, _1637, _1641);
    float _1645 = sqrt(_1643);
    float _1647 = rsqrt(_1643);
    float _1649 = -_1645;
    float _1651 = _1649 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1653 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1655 = precise::clamp(_1653, 0.0, 1.0);
    float _1657 = _1633 * _1647;
    float _1659 = _1629 * _1647;
    float _1661 = abs(_1655);
    float _1663 = log2(_1661);
    float _1665 = _1637 * _1647;
    float _1667 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1669 = _540 * _1659;
    float _1671 = -_1659;
    float _1673 = -_1667;
    float _1675 = fma(_1671, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1673);
    float _1677 = fma(_512, _1657, _1669);
    float _1679 = -_1665;
    float _1681 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1675);
    float _1683 = fma(_510, _1665, _1677);
    float _1685 = precise::clamp(_1683, 0.0, 1.0);
    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1689 = _1681 + _1687;
    float _1691 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1693 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1695 = precise::clamp(_1693, 0.0, 1.0);
    float _1697 = exp2(_1691);
    float _1699 = _1697 * _1695;
    float _1701 = _1685 * _1699;
    float _1703 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1705 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1707 = _1701 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _1703;
    out.m_83.y = _1705;
    out.m_83.z = _1707;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

