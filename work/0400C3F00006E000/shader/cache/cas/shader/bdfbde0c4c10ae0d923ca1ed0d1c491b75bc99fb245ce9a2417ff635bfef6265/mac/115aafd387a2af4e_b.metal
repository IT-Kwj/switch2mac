#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
};

struct main0_out
{
    float4 m_57 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_32 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_45 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_43 [[attribute(7)]];
    float4 m_47 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_30.w;
    float _81 = in.m_32.w;
    float _83 = trunc(_79);
    int _86 = int(_83);
    float _88 = -_81;
    float _90 = _88 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _90;
    bool _94 = _86 >= 1;
    float _96 = 0.0;
    float _98 = as_type<float>(_86);
    float _100 = _90;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _96;
    if (!_94)
    {
        out.m_37.x = 0.0;
    }
    int _104 = 0;
    if (!_94)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _760 = as_type<float>(_108);
        out.gl_Position.z = _760;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _112 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_81);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = in.m_39.x;
    float _124 = float(_86);
    float _126 = in.m_39.y;
    bool _128 = _90 >= _124;
    bool _130 = !_120;
    bool _132 = _128 || _130;
    if (_132)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _98;
    if (_132)
    {
        out.m_37.x = 0.0;
    }
    if (_132)
    {
        float _136 = _134 * 5.0;
        _110 = as_type<int>(_136);
    }
    int _138 = _110;
    out.m_41.x = _122;
    out.m_41.y = _126;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _823 = as_type<float>(_138);
        out.gl_Position.z = _823;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = precise::max(_90, 120.0);
    float _142 = in.m_43.x;
    float _144 = in.m_43.y;
    float _146 = in.m_43.z;
    float _148 = _90 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_45.z;
    float _152 = fma(_140, 0.004999999888241291046142578125, -0.599999964237213134765625);
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_47.y;
    float _166 = _152 * 0.15915493667125701904296875;
    float _168 = in.m_43.w;
    float _170 = _166 * 6.283185482025146484375;
    float _172 = sin(_170);
    float _174 = in.m_45.x;
    float _176 = in.m_45.y;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = _148;
    float _184 = 0.5;
    if (!_162)
    {
        float _186 = _148 * _148;
        float _188 = _186 * 0.5;
        _100 = _188;
    }
    float _190 = _100;
    float _192 = in.m_32.x;
    float _194 = in.m_32.y;
    float _196 = in.m_32.z;
    float _198 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _200 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _202 = _190;
    if (!_162)
    {
        float _204 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _204;
    }
    float _206 = _202;
    float _208 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _210 = _172 * 0.3499999940395355224609375;
    float _212 = in.m_30.x;
    float _214 = in.m_30.y;
    float _216 = in.m_30.z;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _220 = _210 * 0.15915493667125701904296875;
    float _222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _150);
    out.m_51.y = _164;
    float _224 = _218 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _226 = _220 * 6.283185482025146484375;
    float _228 = sin(_226);
    float _230 = _222 * _208;
    float _232 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _234 = _220 * 6.283185482025146484375;
    float _236 = cos(_234);
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _242 = _238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _244 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _246 = !_162;
    float _248 = _206;
    if (!_246)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = _148 * _252;
        float _262 = 1.0 / _256;
        float _264 = _258 * 0.693147182464599609375;
        float _266 = exp2(_260);
        float _268 = 1.0 / _264;
        float _270 = _266 + (-1.0);
        float _272 = -_270;
        float _274 = fma(_272, _268, _148);
        float _276 = _274 * _262;
        float _278 = _276 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _248 = _278;
    }
    float _280 = _248;
    bool _282 = !_162;
    if (!_282)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _290 = _288 + 1.0;
        float _292 = 1.0 / _290;
        float _294 = _148 * _286;
        float _296 = exp2(_294);
        float _298 = -_296;
        float _300 = _298 + 1.0;
        float _302 = _300 * _292;
        _182 = _302;
    }
    float _304 = _182;
    float _306 = _228 * _176;
    float _308 = _236 * _176;
    float _310 = _228 * _180;
    float _312 = _236 * _180;
    float _314 = -_306;
    float _316 = fma(_236, _174, _314);
    float _318 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _320 = -_310;
    float _322 = fma(_236, _178, _320);
    float _324 = fma(_228, _174, _308);
    float _326 = fma(_228, _178, _312);
    float _328 = fma(_304, _192, _318);
    float _330 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    out.m_53.x = _224;
    out.m_53.y = _244;
    out.m_53.z = _242;
    float _332 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _334 = _324 != 0.0;
    bool _336 = isnan(_324);
    bool _338 = _334 || _336;
    bool _340 = isnan(0.0);
    bool _342 = _338 || _340;
    float _344 = fma(_304, _194, _330);
    float _346 = in.m_49.z;
    float _348 = fma(_304, _196, _332);
    float _350 = _200 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _352 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _316);
    float _354 = fma(_344, _168, _214);
    float _356 = _232 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _324);
    bool _360 = _316 == 0.0;
    bool _362 = !_342;
    bool _364 = _360 && _362;
    float _366 = fma(_328, _168, _212);
    float _368 = fma(_348, _168, _216);
    float _370 = _352 * _350;
    float _372 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _374 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _376 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _378 = _358 * _356;
    bool _380 = _150 == 0.0;
    bool _382 = _380 && _364;
    float _384 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].x, _372);
    float _386 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].x, _376);
    float _388 = _378 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _390 = _378 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _392 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].x, _374);
    float _394 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].z, _386);
    float _396 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[10].x, _388);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[8].x, _390);
    float _400 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].z, _384);
    float _402 = _394 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _404 = fma(_230, (*spvDescriptorSet0.vp_c10)._m0[10].z, _396);
    float _406 = fma(_230, (*spvDescriptorSet0.vp_c10)._m0[8].z, _398);
    float _408 = _346;
    float _410 = _326;
    float _412 = _322;
    if (!_382)
    {
        float _414 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[17].y, _346);
        _408 = _414;
    }
    float _416 = _408;
    float _418 = _400 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _420 = _402 + _404;
    float _422 = in.m_55.w;
    float _424 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].z, _392);
    float _426 = _418 + _406;
    float _428 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _430 = _420 + _428;
    if (!_382)
    {
        float _432 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[17].y, _326);
        _410 = _432;
    }
    float _434 = _410;
    float _436 = _424 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _438 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _440 = _426 + _438;
    float _442 = _430 * _430;
    if (!_382)
    {
        float _444 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[17].y, _322);
        _412 = _444;
    }
    float _446 = _412;
    float _448 = _436 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _450 = fma(_440, _440, _442);
    float _452 = _434 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _454 = _434 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _456 = _434 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _458 = sqrt(_450);
    float _460 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[11].x, _448);
    float _462 = fma(_446, (*spvDescriptorSet0.vp_c10)._m0[9].x, _454);
    float _464 = fma(_446, (*spvDescriptorSet0.vp_c10)._m0[8].x, _452);
    float _466 = fma(_446, (*spvDescriptorSet0.vp_c10)._m0[10].x, _456);
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _470 = fma(_402, (*spvDescriptorSet0.vp_c8)._m0[11].z, _460);
    float _472 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[9].z, _462);
    float _474 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[8].z, _464);
    float _476 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[10].z, _466);
    float _478 = _436 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _480 = _470 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_57.w = _468;
    float _482 = _378 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _484 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[10].x, _478);
    float _486 = 1.0 / _480;
    out.m_59.w = _422;
    bool _488 = _458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _490 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[9].x, _482);
    float _492 = fma(_402, (*spvDescriptorSet0.vp_c8)._m0[10].z, _484);
    out.m_61.x = _474;
    out.m_61.y = _472;
    out.m_61.z = _476;
    float _494 = fma(_230, (*spvDescriptorSet0.vp_c10)._m0[9].z, _490);
    float _496 = _492 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _498 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _500 = isnan(0.5);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _506 = _502 || _504;
    float _508 = _436 + _494;
    float _510 = _496 + _480;
    float _512 = _510 * _486;
    float _514 = _512 * 0.5;
    float _516 = _474;
    float _518 = _476;
    float _520 = _472;
    if (!_488)
    {
        _516 = _426;
    }
    float _522 = _516;
    float _524 = _522;
    if (!_488)
    {
        _518 = _420;
    }
    float _526 = _518;
    float _528 = _526;
    if (!_488)
    {
        _520 = _508;
    }
    float _530 = _520;
    bool _532 = !_488;
    float _534 = _530;
    if (!_532)
    {
        float _536 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _538 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _540 = _458 + _538;
        float _542 = _508 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _544 = rsqrt(_450);
        float _546 = _540 * _536;
        float _548 = _546 * 0.15915493667125701904296875;
        float _550 = _548 * 6.283185482025146484375;
        float _552 = cos(_550);
        float _554 = _548 * 6.283185482025146484375;
        float _556 = sin(_554);
        float _558 = _552 + (-1.0);
        float _560 = _558 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _562 = fma(_556, _542, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _564 = fma(_508, _552, _560);
        float _566 = _544 * _562;
        float _568 = fma(_440, _566, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _570 = fma(_430, _566, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _534 = _564;
        _184 = _566;
        _524 = _568;
        _528 = _570;
    }
    float _572 = _534;
    float _574 = _184;
    float _576 = _524;
    float _578 = _528;
    float _580 = _572 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _582 = _574;
    if (_506)
    {
        _582 = 1.0;
    }
    float _584 = _582;
    float _586 = _584;
    if (!_506)
    {
        float _588 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _590 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[30].w, _588);
        float _592 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _596 = 1.0 / _590;
        float _598 = 1.0 / _594;
        float _600 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _602 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _604 = fma(_596, _600, _602);
        float _606 = _604 * _598;
        float _608 = precise::clamp(_606, 0.0, 1.0);
        _586 = _608;
    }
    float _610 = _586;
    float _612 = _572 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _614 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[1].x, _580);
    float _616 = _572 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _618 = _572 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _620 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[0].x, _612);
    float _622 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[1].z, _614);
    float _624 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[2].x, _616);
    float _626 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[3].x, _618);
    float _628 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[0].z, _620);
    float _630 = _622 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _632 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[2].z, _624);
    float _634 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[3].z, _626);
    float _636 = _628 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _638 = _630 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _640 = _630 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _642 = _630 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _644 = _632 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _646 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[6].x, _638);
    float _648 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[7].x, _640);
    float _650 = _630 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _652 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[4].x, _642);
    float _654 = _634 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _656 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[6].z, _646);
    float _658 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[7].z, _648);
    float _660 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[5].x, _650);
    float _662 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[4].z, _652);
    float _664 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[6].w, _656);
    float _666 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[7].w, _658);
    bool _668 = _610 > 0.0;
    bool _670 = isnan(_610);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    float _678 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[5].z, _660);
    float _680 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[4].w, _662);
    float _682 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _684 = _664 + _666;
    float _686 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[5].w, _678);
    float _688 = _682 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _690 = _684 * 0.5;
    out.m_63.x = _576;
    out.m_63.y = _572;
    out.m_63.z = _578;
    out.m_37.x = _688;
    out.gl_Position.x = _680;
    out.gl_Position.y = _686;
    out.gl_Position.z = _664;
    out.gl_Position.w = _666;
    out.m_65.z = _690;
    out.m_65.w = _666;
    if (_676)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_37.x = 0.0;
    float _692 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _692;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_30.w;
    float _81 = in.m_32.w;
    float _83 = trunc(_79);
    int _86 = int(_83);
    float _88 = -_81;
    float _90 = _88 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _90;
    bool _94 = _86 >= 1;
    float _96 = 0.0;
    float _98 = as_type<float>(_86);
    float _100 = _90;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _96;
    if (!_94)
    {
        out.m_37.x = 0.0;
    }
    int _104 = 0;
    if (!_94)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _760 = as_type<float>(_108);
        out.gl_Position.z = _760;
    }
    if (!_94)
    {
        return out;
    }
    bool _112 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_81);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = in.m_39.x;
    float _124 = float(_86);
    float _126 = in.m_39.y;
    bool _128 = _90 >= _124;
    bool _130 = !_120;
    bool _132 = _128 || _130;
    if (_132)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _98;
    if (_132)
    {
        out.m_37.x = 0.0;
    }
    if (_132)
    {
        float _136 = _134 * 5.0;
        _110 = as_type<int>(_136);
    }
    int _138 = _110;
    out.m_41.x = _122;
    out.m_41.y = _126;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _823 = as_type<float>(_138);
        out.gl_Position.z = _823;
    }
    if (_132)
    {
        return out;
    }
    float _140 = precise::max(_90, 120.0);
    float _142 = in.m_43.x;
    float _144 = in.m_43.y;
    float _146 = in.m_43.z;
    float _148 = _90 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_45.z;
    float _152 = fma(_140, 0.004999999888241291046142578125, -0.599999964237213134765625);
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_47.y;
    float _166 = _152 * 0.15915493667125701904296875;
    float _168 = in.m_43.w;
    float _170 = _166 * 6.283185482025146484375;
    float _172 = sin(_170);
    float _174 = in.m_45.x;
    float _176 = in.m_45.y;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = _148;
    float _184 = 0.5;
    if (!_162)
    {
        float _186 = _148 * _148;
        float _188 = _186 * 0.5;
        _100 = _188;
    }
    float _190 = _100;
    float _192 = in.m_32.x;
    float _194 = in.m_32.y;
    float _196 = in.m_32.z;
    float _198 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _200 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _202 = _190;
    if (!_162)
    {
        float _204 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _204;
    }
    float _206 = _202;
    float _208 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _210 = _172 * 0.3499999940395355224609375;
    float _212 = in.m_30.x;
    float _214 = in.m_30.y;
    float _216 = in.m_30.z;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _220 = _210 * 0.15915493667125701904296875;
    float _222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _150);
    out.m_51.y = _164;
    float _224 = _218 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _226 = _220 * 6.283185482025146484375;
    float _228 = sin(_226);
    float _230 = _222 * _208;
    float _232 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _234 = _220 * 6.283185482025146484375;
    float _236 = cos(_234);
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _242 = _238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _244 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _246 = !_162;
    float _248 = _206;
    if (!_246)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = _148 * _252;
        float _262 = 1.0 / _256;
        float _264 = _258 * 0.693147182464599609375;
        float _266 = exp2(_260);
        float _268 = 1.0 / _264;
        float _270 = _266 + (-1.0);
        float _272 = -_270;
        float _274 = fma(_272, _268, _148);
        float _276 = _274 * _262;
        float _278 = _276 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _248 = _278;
    }
    float _280 = _248;
    bool _282 = !_162;
    if (!_282)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _290 = _288 + 1.0;
        float _292 = 1.0 / _290;
        float _294 = _148 * _286;
        float _296 = exp2(_294);
        float _298 = -_296;
        float _300 = _298 + 1.0;
        float _302 = _300 * _292;
        _182 = _302;
    }
    float _304 = _182;
    float _306 = _228 * _176;
    float _308 = _236 * _176;
    float _310 = _228 * _180;
    float _312 = _236 * _180;
    float _314 = -_306;
    float _316 = fma(_236, _174, _314);
    float _318 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _320 = -_310;
    float _322 = fma(_236, _178, _320);
    float _324 = fma(_228, _174, _308);
    float _326 = fma(_228, _178, _312);
    float _328 = fma(_304, _192, _318);
    float _330 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    out.m_53.x = _224;
    out.m_53.y = _244;
    out.m_53.z = _242;
    float _332 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _334 = _324 != 0.0;
    bool _336 = isnan(_324);
    bool _338 = _334 || _336;
    bool _340 = isnan(0.0);
    bool _342 = _338 || _340;
    float _344 = fma(_304, _194, _330);
    float _346 = in.m_49.z;
    float _348 = fma(_304, _196, _332);
    float _350 = _200 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _352 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _316);
    float _354 = fma(_344, _168, _214);
    float _356 = _232 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _324);
    bool _360 = _316 == 0.0;
    bool _362 = !_342;
    bool _364 = _360 && _362;
    float _366 = fma(_328, _168, _212);
    float _368 = fma(_348, _168, _216);
    float _370 = _352 * _350;
    float _372 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _374 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _376 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _378 = _358 * _356;
    bool _380 = _150 == 0.0;
    bool _382 = _380 && _364;
    float _384 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].x, _372);
    float _386 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].x, _376);
    float _388 = _378 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _390 = _378 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _392 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].x, _374);
    float _394 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].z, _386);
    float _396 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[10].x, _388);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[8].x, _390);
    float _400 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].z, _384);
    float _402 = _394 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _404 = fma(_230, (*spvDescriptorSet0.vp_c10)._m0[10].z, _396);
    float _406 = fma(_230, (*spvDescriptorSet0.vp_c10)._m0[8].z, _398);
    float _408 = _346;
    float _410 = _326;
    float _412 = _322;
    if (!_382)
    {
        float _414 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[17].y, _346);
        _408 = _414;
    }
    float _416 = _408;
    float _418 = _400 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _420 = _402 + _404;
    float _422 = in.m_55.w;
    float _424 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].z, _392);
    float _426 = _418 + _406;
    float _428 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _430 = _420 + _428;
    if (!_382)
    {
        float _432 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[17].y, _326);
        _410 = _432;
    }
    float _434 = _410;
    float _436 = _424 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _438 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _440 = _426 + _438;
    float _442 = _430 * _430;
    if (!_382)
    {
        float _444 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[17].y, _322);
        _412 = _444;
    }
    float _446 = _412;
    float _448 = _436 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _450 = fma(_440, _440, _442);
    float _452 = _434 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _454 = _434 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _456 = _434 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _458 = sqrt(_450);
    float _460 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[11].x, _448);
    float _462 = fma(_446, (*spvDescriptorSet0.vp_c10)._m0[9].x, _454);
    float _464 = fma(_446, (*spvDescriptorSet0.vp_c10)._m0[8].x, _452);
    float _466 = fma(_446, (*spvDescriptorSet0.vp_c10)._m0[10].x, _456);
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _470 = fma(_402, (*spvDescriptorSet0.vp_c8)._m0[11].z, _460);
    float _472 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[9].z, _462);
    float _474 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[8].z, _464);
    float _476 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[10].z, _466);
    float _478 = _436 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _480 = _470 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_57.w = _468;
    float _482 = _378 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _484 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[10].x, _478);
    float _486 = 1.0 / _480;
    out.m_59.w = _422;
    bool _488 = _458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _490 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[9].x, _482);
    float _492 = fma(_402, (*spvDescriptorSet0.vp_c8)._m0[10].z, _484);
    out.m_61.x = _474;
    out.m_61.y = _472;
    out.m_61.z = _476;
    float _494 = fma(_230, (*spvDescriptorSet0.vp_c10)._m0[9].z, _490);
    float _496 = _492 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _498 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _500 = isnan(0.5);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _506 = _502 || _504;
    float _508 = _436 + _494;
    float _510 = _496 + _480;
    float _512 = _510 * _486;
    float _514 = _512 * 0.5;
    float _516 = _474;
    float _518 = _476;
    float _520 = _472;
    if (!_488)
    {
        _516 = _426;
    }
    float _522 = _516;
    float _524 = _522;
    if (!_488)
    {
        _518 = _420;
    }
    float _526 = _518;
    float _528 = _526;
    if (!_488)
    {
        _520 = _508;
    }
    float _530 = _520;
    bool _532 = !_488;
    float _534 = _530;
    if (!_532)
    {
        float _536 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _538 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _540 = _458 + _538;
        float _542 = _508 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _544 = rsqrt(_450);
        float _546 = _540 * _536;
        float _548 = _546 * 0.15915493667125701904296875;
        float _550 = _548 * 6.283185482025146484375;
        float _552 = cos(_550);
        float _554 = _548 * 6.283185482025146484375;
        float _556 = sin(_554);
        float _558 = _552 + (-1.0);
        float _560 = _558 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _562 = fma(_556, _542, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _564 = fma(_508, _552, _560);
        float _566 = _544 * _562;
        float _568 = fma(_440, _566, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _570 = fma(_430, _566, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _534 = _564;
        _184 = _566;
        _524 = _568;
        _528 = _570;
    }
    float _572 = _534;
    float _574 = _184;
    float _576 = _524;
    float _578 = _528;
    float _580 = _572 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _582 = _574;
    if (_506)
    {
        _582 = 1.0;
    }
    float _584 = _582;
    float _586 = _584;
    if (!_506)
    {
        float _588 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _590 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[30].w, _588);
        float _592 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _596 = 1.0 / _590;
        float _598 = 1.0 / _594;
        float _600 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _602 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _604 = fma(_596, _600, _602);
        float _606 = _604 * _598;
        float _608 = precise::clamp(_606, 0.0, 1.0);
        _586 = _608;
    }
    float _610 = _586;
    float _612 = _572 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _614 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[1].x, _580);
    float _616 = _572 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _618 = _572 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _620 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[0].x, _612);
    float _622 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[1].z, _614);
    float _624 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[2].x, _616);
    float _626 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[3].x, _618);
    float _628 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[0].z, _620);
    float _630 = _622 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _632 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[2].z, _624);
    float _634 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[3].z, _626);
    float _636 = _628 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _638 = _630 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _640 = _630 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _642 = _630 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _644 = _632 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _646 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[6].x, _638);
    float _648 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[7].x, _640);
    float _650 = _630 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _652 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[4].x, _642);
    float _654 = _634 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _656 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[6].z, _646);
    float _658 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[7].z, _648);
    float _660 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[5].x, _650);
    float _662 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[4].z, _652);
    float _664 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[6].w, _656);
    float _666 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[7].w, _658);
    bool _668 = _610 > 0.0;
    bool _670 = isnan(_610);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    float _678 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[5].z, _660);
    float _680 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[4].w, _662);
    float _682 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _684 = _664 + _666;
    float _686 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[5].w, _678);
    float _688 = _682 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _690 = _684 * 0.5;
    out.m_63.x = _576;
    out.m_63.y = _572;
    out.m_63.z = _578;
    out.m_37.x = _688;
    out.gl_Position.x = _680;
    out.gl_Position.y = _686;
    out.gl_Position.z = _664;
    out.gl_Position.w = _666;
    out.m_65.z = _690;
    out.m_65.w = _666;
    if (_676)
    {
        return out;
    }
    out.m_37.x = 0.0;
    float _692 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _692;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_30.w;
    float _81 = in.m_32.w;
    float _83 = trunc(_79);
    int _86 = int(_83);
    float _88 = -_81;
    float _90 = _88 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _90;
    bool _94 = _86 >= 1;
    float _96 = 0.0;
    float _98 = as_type<float>(_86);
    float _100 = _90;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _96;
    if (!_94)
    {
        out.m_37.x = 0.0;
    }
    int _104 = 0;
    if (!_94)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _760 = as_type<float>(_108);
        out.gl_Position.z = _760;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _112 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_81);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = in.m_39.x;
    float _124 = float(_86);
    float _126 = in.m_39.y;
    bool _128 = _90 >= _124;
    bool _130 = !_120;
    bool _132 = _128 || _130;
    if (_132)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _98;
    if (_132)
    {
        out.m_37.x = 0.0;
    }
    if (_132)
    {
        float _136 = _134 * 5.0;
        _110 = as_type<int>(_136);
    }
    int _138 = _110;
    out.m_41.x = _122;
    out.m_41.y = _126;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _823 = as_type<float>(_138);
        out.gl_Position.z = _823;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = precise::max(_90, 120.0);
    float _142 = in.m_43.x;
    float _144 = in.m_43.y;
    float _146 = in.m_43.z;
    float _148 = _90 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_45.z;
    float _152 = fma(_140, 0.004999999888241291046142578125, -0.599999964237213134765625);
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_47.y;
    float _166 = _152 * 0.15915493667125701904296875;
    float _168 = in.m_43.w;
    float _170 = _166 * 6.283185482025146484375;
    float _172 = sin(_170);
    float _174 = in.m_45.x;
    float _176 = in.m_45.y;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = _148;
    float _184 = 0.5;
    if (!_162)
    {
        float _186 = _148 * _148;
        float _188 = _186 * 0.5;
        _100 = _188;
    }
    float _190 = _100;
    float _192 = in.m_32.x;
    float _194 = in.m_32.y;
    float _196 = in.m_32.z;
    float _198 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _200 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _202 = _190;
    if (!_162)
    {
        float _204 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _204;
    }
    float _206 = _202;
    float _208 = _198 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _210 = _172 * 0.3499999940395355224609375;
    float _212 = in.m_30.x;
    float _214 = in.m_30.y;
    float _216 = in.m_30.z;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _220 = _210 * 0.15915493667125701904296875;
    float _222 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _150);
    out.m_51.y = _164;
    float _224 = _218 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _226 = _220 * 6.283185482025146484375;
    float _228 = sin(_226);
    float _230 = _222 * _208;
    float _232 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _234 = _220 * 6.283185482025146484375;
    float _236 = cos(_234);
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _242 = _238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _244 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _246 = !_162;
    float _248 = _206;
    if (!_246)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = _148 * _252;
        float _262 = 1.0 / _256;
        float _264 = _258 * 0.693147182464599609375;
        float _266 = exp2(_260);
        float _268 = 1.0 / _264;
        float _270 = _266 + (-1.0);
        float _272 = -_270;
        float _274 = fma(_272, _268, _148);
        float _276 = _274 * _262;
        float _278 = _276 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _248 = _278;
    }
    float _280 = _248;
    bool _282 = !_162;
    if (!_282)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _290 = _288 + 1.0;
        float _292 = 1.0 / _290;
        float _294 = _148 * _286;
        float _296 = exp2(_294);
        float _298 = -_296;
        float _300 = _298 + 1.0;
        float _302 = _300 * _292;
        _182 = _302;
    }
    float _304 = _182;
    float _306 = _228 * _176;
    float _308 = _236 * _176;
    float _310 = _228 * _180;
    float _312 = _236 * _180;
    float _314 = -_306;
    float _316 = fma(_236, _174, _314);
    float _318 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _320 = -_310;
    float _322 = fma(_236, _178, _320);
    float _324 = fma(_228, _174, _308);
    float _326 = fma(_228, _178, _312);
    float _328 = fma(_304, _192, _318);
    float _330 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    out.m_53.x = _224;
    out.m_53.y = _244;
    out.m_53.z = _242;
    float _332 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _334 = _324 != 0.0;
    bool _336 = isnan(_324);
    bool _338 = _334 || _336;
    bool _340 = isnan(0.0);
    bool _342 = _338 || _340;
    float _344 = fma(_304, _194, _330);
    float _346 = in.m_49.z;
    float _348 = fma(_304, _196, _332);
    float _350 = _200 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _352 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _316);
    float _354 = fma(_344, _168, _214);
    float _356 = _232 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _324);
    bool _360 = _316 == 0.0;
    bool _362 = !_342;
    bool _364 = _360 && _362;
    float _366 = fma(_328, _168, _212);
    float _368 = fma(_348, _168, _216);
    float _370 = _352 * _350;
    float _372 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _374 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _376 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _378 = _358 * _356;
    bool _380 = _150 == 0.0;
    bool _382 = _380 && _364;
    float _384 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].x, _372);
    float _386 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].x, _376);
    float _388 = _378 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _390 = _378 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _392 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].x, _374);
    float _394 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].z, _386);
    float _396 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[10].x, _388);
    float _398 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[8].x, _390);
    float _400 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].z, _384);
    float _402 = _394 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _404 = fma(_230, (*spvDescriptorSet0.vp_c10)._m0[10].z, _396);
    float _406 = fma(_230, (*spvDescriptorSet0.vp_c10)._m0[8].z, _398);
    float _408 = _346;
    float _410 = _326;
    float _412 = _322;
    if (!_382)
    {
        float _414 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[17].y, _346);
        _408 = _414;
    }
    float _416 = _408;
    float _418 = _400 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _420 = _402 + _404;
    float _422 = in.m_55.w;
    float _424 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].z, _392);
    float _426 = _418 + _406;
    float _428 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _430 = _420 + _428;
    if (!_382)
    {
        float _432 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[17].y, _326);
        _410 = _432;
    }
    float _434 = _410;
    float _436 = _424 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _438 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _440 = _426 + _438;
    float _442 = _430 * _430;
    if (!_382)
    {
        float _444 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[17].y, _322);
        _412 = _444;
    }
    float _446 = _412;
    float _448 = _436 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _450 = fma(_440, _440, _442);
    float _452 = _434 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _454 = _434 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _456 = _434 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _458 = sqrt(_450);
    float _460 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[11].x, _448);
    float _462 = fma(_446, (*spvDescriptorSet0.vp_c10)._m0[9].x, _454);
    float _464 = fma(_446, (*spvDescriptorSet0.vp_c10)._m0[8].x, _452);
    float _466 = fma(_446, (*spvDescriptorSet0.vp_c10)._m0[10].x, _456);
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _470 = fma(_402, (*spvDescriptorSet0.vp_c8)._m0[11].z, _460);
    float _472 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[9].z, _462);
    float _474 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[8].z, _464);
    float _476 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[10].z, _466);
    float _478 = _436 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _480 = _470 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_57.w = _468;
    float _482 = _378 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _484 = fma(_418, (*spvDescriptorSet0.vp_c8)._m0[10].x, _478);
    float _486 = 1.0 / _480;
    out.m_59.w = _422;
    bool _488 = _458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _490 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[9].x, _482);
    float _492 = fma(_402, (*spvDescriptorSet0.vp_c8)._m0[10].z, _484);
    out.m_61.x = _474;
    out.m_61.y = _472;
    out.m_61.z = _476;
    float _494 = fma(_230, (*spvDescriptorSet0.vp_c10)._m0[9].z, _490);
    float _496 = _492 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _498 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _500 = isnan(0.5);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _506 = _502 || _504;
    float _508 = _436 + _494;
    float _510 = _496 + _480;
    float _512 = _510 * _486;
    float _514 = _512 * 0.5;
    float _516 = _474;
    float _518 = _476;
    float _520 = _472;
    if (!_488)
    {
        _516 = _426;
    }
    float _522 = _516;
    float _524 = _522;
    if (!_488)
    {
        _518 = _420;
    }
    float _526 = _518;
    float _528 = _526;
    if (!_488)
    {
        _520 = _508;
    }
    float _530 = _520;
    bool _532 = !_488;
    float _534 = _530;
    if (!_532)
    {
        float _536 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _538 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _540 = _458 + _538;
        float _542 = _508 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _544 = rsqrt(_450);
        float _546 = _540 * _536;
        float _548 = _546 * 0.15915493667125701904296875;
        float _550 = _548 * 6.283185482025146484375;
        float _552 = cos(_550);
        float _554 = _548 * 6.283185482025146484375;
        float _556 = sin(_554);
        float _558 = _552 + (-1.0);
        float _560 = _558 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _562 = fma(_556, _542, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _564 = fma(_508, _552, _560);
        float _566 = _544 * _562;
        float _568 = fma(_440, _566, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _570 = fma(_430, _566, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _534 = _564;
        _184 = _566;
        _524 = _568;
        _528 = _570;
    }
    float _572 = _534;
    float _574 = _184;
    float _576 = _524;
    float _578 = _528;
    float _580 = _572 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _582 = _574;
    if (_506)
    {
        _582 = 1.0;
    }
    float _584 = _582;
    float _586 = _584;
    if (!_506)
    {
        float _588 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _590 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[30].w, _588);
        float _592 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _596 = 1.0 / _590;
        float _598 = 1.0 / _594;
        float _600 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _602 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _604 = fma(_596, _600, _602);
        float _606 = _604 * _598;
        float _608 = precise::clamp(_606, 0.0, 1.0);
        _586 = _608;
    }
    float _610 = _586;
    float _612 = _572 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _614 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[1].x, _580);
    float _616 = _572 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _618 = _572 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _620 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[0].x, _612);
    float _622 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[1].z, _614);
    float _624 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[2].x, _616);
    float _626 = fma(_576, (*spvDescriptorSet0.vp_c8)._m0[3].x, _618);
    float _628 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[0].z, _620);
    float _630 = _622 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _632 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[2].z, _624);
    float _634 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[3].z, _626);
    float _636 = _628 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _638 = _630 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _640 = _630 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _642 = _630 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _644 = _632 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _646 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[6].x, _638);
    float _648 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[7].x, _640);
    float _650 = _630 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _652 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[4].x, _642);
    float _654 = _634 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _656 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[6].z, _646);
    float _658 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[7].z, _648);
    float _660 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[5].x, _650);
    float _662 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[4].z, _652);
    float _664 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[6].w, _656);
    float _666 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[7].w, _658);
    bool _668 = _610 > 0.0;
    bool _670 = isnan(_610);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    float _678 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[5].z, _660);
    float _680 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[4].w, _662);
    float _682 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _684 = _664 + _666;
    float _686 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[5].w, _678);
    float _688 = _682 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _690 = _684 * 0.5;
    out.m_63.x = _576;
    out.m_63.y = _572;
    out.m_63.z = _578;
    out.m_37.x = _688;
    out.gl_Position.x = _680;
    out.gl_Position.y = _686;
    out.gl_Position.z = _664;
    out.gl_Position.w = _666;
    out.m_65.z = _690;
    out.m_65.w = _666;
    if (_676)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_37.x = 0.0;
    float _692 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _692;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

