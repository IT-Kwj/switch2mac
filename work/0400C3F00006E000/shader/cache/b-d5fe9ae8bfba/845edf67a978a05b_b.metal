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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_41 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_43 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_30.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    float _78 = _76;
    if (!_72)
    {
        out.m_33.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _76 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _723 = as_type<float>(_84);
        out.gl_Position.z = _723;
    }
    if (!_72)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _88 = in.m_35.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = 0.0;
    if (_98)
    {
        float _106 = float(_68);
        _104 = _106;
    }
    float _108 = _104;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    if (_114)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _78;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _86 = as_type<int>(_118);
    }
    int _120 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _791 = as_type<float>(_120);
        out.gl_Position.z = _791;
    }
    if (_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_37.w;
    float _124 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _126 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _128 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    float _136 = in.m_35.x;
    float _138 = in.m_35.y;
    float _140 = in.m_35.z;
    float _142 = in.m_30.x;
    float _144 = in.m_30.y;
    float _146 = in.m_30.z;
    float _148 = 0.0;
    float _150 = _124;
    if (!_134)
    {
        float _152 = _124 * _124;
        float _154 = _152 * 0.5;
        _148 = _154;
    }
    float _156 = _148;
    float _158 = _156;
    if (!_134)
    {
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = !_134;
    float _166 = _162;
    if (!_164)
    {
        float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _170 = log2(_168);
        float _172 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _174 = _172 + 1.0;
        float _176 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = _124 * _170;
        float _180 = exp2(_178);
        float _182 = _176 * 0.693147182464599609375;
        float _184 = 1.0 / _182;
        float _186 = 1.0 / _174;
        float _188 = _180 + (-1.0);
        float _190 = -_188;
        float _192 = fma(_190, _184, _124);
        float _194 = _192 * _186;
        float _196 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _196;
    }
    float _198 = _166;
    bool _200 = !_134;
    if (!_200)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = 1.0 / _208;
        float _212 = _124 * _204;
        float _214 = exp2(_212);
        float _216 = -_214;
        float _218 = _216 + 1.0;
        float _220 = _218 * _210;
        _150 = _220;
    }
    float _222 = _150;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _226 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _228 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _230 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _232 = fma(_222, _136, _226);
    float _234 = fma(_222, _138, _228);
    float _236 = fma(_222, _140, _230);
    float _238 = fma(_232, _122, _142);
    float _240 = fma(_234, _122, _144);
    float _242 = fma(_236, _122, _146);
    bool _244 = !_224;
    float _262;
    if (!_244)
    {
        float _246 = in.m_39.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_68);
        float _268 = 1.0 / _266;
        float _270 = _102 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = in.m_37.x;
    float _276 = in.m_37.y;
    float _278 = in.m_37.z;
    float _280 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _282 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _284 = in.m_41.x;
    float _286 = in.m_41.y;
    float _288 = in.m_41.z;
    float _290 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _292 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _280);
    float _294 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _282);
    float _296 = in.m_43.y;
    float _298 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _290);
    float _300 = in.m_43.x;
    float _302 = in.m_43.z;
    float _304 = in.m_43.w;
    float _306 = _276 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _308 = _274 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _310 = _278 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _312 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _286);
    float _314 = _306 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _316 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _284);
    float _318 = _308 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    out.m_45.y = _296;
    float _320 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _288);
    float _322 = _310 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_45.x = _300;
    float _324 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _292);
    float _326 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _294);
    float _328 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _298);
    float _330 = _314 * _312;
    out.m_45.z = _302;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _336 = _328 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _338 = _318 * _316;
    float _340 = _330 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _342 = _330 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_45.w = _304;
    float _344 = _322 * _320;
    float _346 = fma(_338, (*spvDescriptorSet0.vp_c8)._m0[26].x, _340);
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c8)._m0[24].x, _342);
    float _350 = 1.0 / _334;
    float _352 = fma(_344, (*spvDescriptorSet0.vp_c8)._m0[26].z, _346);
    float _354 = fma(_344, (*spvDescriptorSet0.vp_c8)._m0[24].z, _348);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _356;
    float _360 = _330 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _362 = _352 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _364 = _354 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _370 = _324 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _372 = _336 + _362;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _378 = 1.0 / _368;
    float _380 = _370 + _364;
    float _382 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _384 = _372 + _382;
    bool _386 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _388 = isnan(_272);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = _358 * _350;
    float _400 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _402 = _380 + _400;
    float _404 = _384 * _384;
    bool _406 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _408 = isnan(_272);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = 1.0 / _376;
    bool _420 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _422 = isnan(_272);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = fma(_402, _402, _404);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _436 = _272 + _434;
    float _438 = -_416;
    float _440 = _438 + 1.0;
    float _442 = fma(_338, (*spvDescriptorSet0.vp_c8)._m0[25].x, _360);
    float _444 = -_430;
    float _446 = _444 + 1.0;
    float _448 = fma(_398, _436, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _450 = sqrt(_432);
    float _452 = _430 * _440;
    float _454 = _396 * _446;
    bool _456 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _458 = isnan(_272);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -_396;
    float _470 = _468 + 1.0;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _476;
    float _480 = fma(_344, (*spvDescriptorSet0.vp_c8)._m0[25].z, _442);
    float _482 = _466 * _470;
    float _484 = _474 * _378;
    float _486 = _478 * _418;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _490 = _272 + _488;
    float _492 = _448 * _482;
    float _494 = -_466;
    float _496 = _494 + 1.0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _500 = _272 + _498;
    bool _502 = _450 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _504 = fma(_484, _490, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _506 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[115].x, _492);
    float _508 = _326 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _510 = _480 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _512 = fma(_486, _500, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _514 = fma(_504, _454, _506);
    float _516 = _508 + _510;
    float _518 = fma(_512, _452, _514);
    float _520 = _512;
    float _522 = _272;
    float _524 = _508;
    if (!_502)
    {
        _520 = _380;
    }
    float _526 = _520;
    float _528 = _526;
    if (!_502)
    {
        _522 = _372;
    }
    float _530 = _522;
    float _532 = _530;
    if (!_502)
    {
        _524 = _516;
    }
    float _534 = _524;
    bool _536 = !_502;
    float _538 = _534;
    if (!_536)
    {
        float _540 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _542 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _544 = _450 + _542;
        float _546 = _516 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _548 = rsqrt(_432);
        float _550 = _544 * _540;
        float _552 = _550 * 0.15915493667125701904296875;
        float _554 = _552 * 6.283185482025146484375;
        float _556 = cos(_554);
        float _558 = _552 * 6.283185482025146484375;
        float _560 = sin(_558);
        float _562 = _556 + (-1.0);
        float _564 = _562 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _566 = fma(_560, _546, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _568 = fma(_516, _556, _564);
        float _570 = _548 * _566;
        float _572 = fma(_402, _570, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _574 = fma(_384, _570, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _538 = _568;
        _528 = _572;
        _532 = _574;
    }
    float _576 = _538;
    float _578 = _528;
    float _580 = _532;
    float _582 = _576 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _584 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[118].x, _518);
    float _586 = _576 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _588 = _576 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _590 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[1].x, _582);
    float _592 = _576 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _594 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[0].x, _586);
    float _596 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[2].x, _588);
    float _598 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[1].z, _590);
    float _600 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[3].x, _592);
    float _602 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[0].z, _594);
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[2].z, _596);
    float _606 = _598 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _608 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[3].z, _600);
    float _610 = _602 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _612 = _604 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _614 = _606 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _616 = _606 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _618 = _606 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _620 = _606 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _622 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[5].x, _614);
    float _624 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[6].x, _616);
    float _626 = _608 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _628 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[4].x, _618);
    float _630 = fma(_612, (*spvDescriptorSet0.vp_c8)._m0[5].z, _622);
    float _632 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[7].x, _620);
    float _634 = fma(_612, (*spvDescriptorSet0.vp_c8)._m0[6].z, _624);
    float _636 = fma(_612, (*spvDescriptorSet0.vp_c8)._m0[4].z, _628);
    float _638 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[5].w, _630);
    float _640 = fma(_612, (*spvDescriptorSet0.vp_c8)._m0[7].z, _632);
    float _642 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[6].w, _634);
    float _644 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[4].w, _636);
    float _646 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[7].w, _640);
    float _648 = _584 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _656 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _642 + _646;
    float _660 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _666 = _658 * 0.5;
    out.m_33.x = _664;
    out.m_47.x = _660;
    out.m_47.y = _656;
    out.m_47.z = _662;
    out.m_47.w = _648;
    out.gl_Position.x = _644;
    out.gl_Position.y = _638;
    out.gl_Position.z = _642;
    out.gl_Position.w = _646;
    out.m_49.z = _666;
    out.m_49.w = _646;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_30.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    float _78 = _76;
    if (!_72)
    {
        out.m_33.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _76 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _723 = as_type<float>(_84);
        out.gl_Position.z = _723;
    }
    if (!_72)
    {
        return out;
    }
    float _88 = in.m_35.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = 0.0;
    if (_98)
    {
        float _106 = float(_68);
        _104 = _106;
    }
    float _108 = _104;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    if (_114)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _78;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _86 = as_type<int>(_118);
    }
    int _120 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _791 = as_type<float>(_120);
        out.gl_Position.z = _791;
    }
    if (_114)
    {
        return out;
    }
    float _122 = in.m_37.w;
    float _124 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _126 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _128 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    float _136 = in.m_35.x;
    float _138 = in.m_35.y;
    float _140 = in.m_35.z;
    float _142 = in.m_30.x;
    float _144 = in.m_30.y;
    float _146 = in.m_30.z;
    float _148 = 0.0;
    float _150 = _124;
    if (!_134)
    {
        float _152 = _124 * _124;
        float _154 = _152 * 0.5;
        _148 = _154;
    }
    float _156 = _148;
    float _158 = _156;
    if (!_134)
    {
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = !_134;
    float _166 = _162;
    if (!_164)
    {
        float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _170 = log2(_168);
        float _172 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _174 = _172 + 1.0;
        float _176 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = _124 * _170;
        float _180 = exp2(_178);
        float _182 = _176 * 0.693147182464599609375;
        float _184 = 1.0 / _182;
        float _186 = 1.0 / _174;
        float _188 = _180 + (-1.0);
        float _190 = -_188;
        float _192 = fma(_190, _184, _124);
        float _194 = _192 * _186;
        float _196 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _196;
    }
    float _198 = _166;
    bool _200 = !_134;
    if (!_200)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = 1.0 / _208;
        float _212 = _124 * _204;
        float _214 = exp2(_212);
        float _216 = -_214;
        float _218 = _216 + 1.0;
        float _220 = _218 * _210;
        _150 = _220;
    }
    float _222 = _150;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _226 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _228 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _230 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _232 = fma(_222, _136, _226);
    float _234 = fma(_222, _138, _228);
    float _236 = fma(_222, _140, _230);
    float _238 = fma(_232, _122, _142);
    float _240 = fma(_234, _122, _144);
    float _242 = fma(_236, _122, _146);
    bool _244 = !_224;
    float _262;
    if (!_244)
    {
        float _246 = in.m_39.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_68);
        float _268 = 1.0 / _266;
        float _270 = _102 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = in.m_37.x;
    float _276 = in.m_37.y;
    float _278 = in.m_37.z;
    float _280 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _282 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _284 = in.m_41.x;
    float _286 = in.m_41.y;
    float _288 = in.m_41.z;
    float _290 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _292 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _280);
    float _294 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _282);
    float _296 = in.m_43.y;
    float _298 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _290);
    float _300 = in.m_43.x;
    float _302 = in.m_43.z;
    float _304 = in.m_43.w;
    float _306 = _276 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _308 = _274 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _310 = _278 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _312 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _286);
    float _314 = _306 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _316 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _284);
    float _318 = _308 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    out.m_45.y = _296;
    float _320 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _288);
    float _322 = _310 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_45.x = _300;
    float _324 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _292);
    float _326 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _294);
    float _328 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _298);
    float _330 = _314 * _312;
    out.m_45.z = _302;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _336 = _328 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _338 = _318 * _316;
    float _340 = _330 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _342 = _330 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_45.w = _304;
    float _344 = _322 * _320;
    float _346 = fma(_338, (*spvDescriptorSet0.vp_c8)._m0[26].x, _340);
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c8)._m0[24].x, _342);
    float _350 = 1.0 / _334;
    float _352 = fma(_344, (*spvDescriptorSet0.vp_c8)._m0[26].z, _346);
    float _354 = fma(_344, (*spvDescriptorSet0.vp_c8)._m0[24].z, _348);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _356;
    float _360 = _330 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _362 = _352 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _364 = _354 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _370 = _324 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _372 = _336 + _362;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _378 = 1.0 / _368;
    float _380 = _370 + _364;
    float _382 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _384 = _372 + _382;
    bool _386 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _388 = isnan(_272);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = _358 * _350;
    float _400 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _402 = _380 + _400;
    float _404 = _384 * _384;
    bool _406 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _408 = isnan(_272);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = 1.0 / _376;
    bool _420 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _422 = isnan(_272);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = fma(_402, _402, _404);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _436 = _272 + _434;
    float _438 = -_416;
    float _440 = _438 + 1.0;
    float _442 = fma(_338, (*spvDescriptorSet0.vp_c8)._m0[25].x, _360);
    float _444 = -_430;
    float _446 = _444 + 1.0;
    float _448 = fma(_398, _436, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _450 = sqrt(_432);
    float _452 = _430 * _440;
    float _454 = _396 * _446;
    bool _456 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _458 = isnan(_272);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -_396;
    float _470 = _468 + 1.0;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _476;
    float _480 = fma(_344, (*spvDescriptorSet0.vp_c8)._m0[25].z, _442);
    float _482 = _466 * _470;
    float _484 = _474 * _378;
    float _486 = _478 * _418;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _490 = _272 + _488;
    float _492 = _448 * _482;
    float _494 = -_466;
    float _496 = _494 + 1.0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _500 = _272 + _498;
    bool _502 = _450 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _504 = fma(_484, _490, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _506 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[115].x, _492);
    float _508 = _326 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _510 = _480 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _512 = fma(_486, _500, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _514 = fma(_504, _454, _506);
    float _516 = _508 + _510;
    float _518 = fma(_512, _452, _514);
    float _520 = _512;
    float _522 = _272;
    float _524 = _508;
    if (!_502)
    {
        _520 = _380;
    }
    float _526 = _520;
    float _528 = _526;
    if (!_502)
    {
        _522 = _372;
    }
    float _530 = _522;
    float _532 = _530;
    if (!_502)
    {
        _524 = _516;
    }
    float _534 = _524;
    bool _536 = !_502;
    float _538 = _534;
    if (!_536)
    {
        float _540 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _542 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _544 = _450 + _542;
        float _546 = _516 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _548 = rsqrt(_432);
        float _550 = _544 * _540;
        float _552 = _550 * 0.15915493667125701904296875;
        float _554 = _552 * 6.283185482025146484375;
        float _556 = cos(_554);
        float _558 = _552 * 6.283185482025146484375;
        float _560 = sin(_558);
        float _562 = _556 + (-1.0);
        float _564 = _562 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _566 = fma(_560, _546, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _568 = fma(_516, _556, _564);
        float _570 = _548 * _566;
        float _572 = fma(_402, _570, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _574 = fma(_384, _570, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _538 = _568;
        _528 = _572;
        _532 = _574;
    }
    float _576 = _538;
    float _578 = _528;
    float _580 = _532;
    float _582 = _576 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _584 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[118].x, _518);
    float _586 = _576 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _588 = _576 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _590 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[1].x, _582);
    float _592 = _576 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _594 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[0].x, _586);
    float _596 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[2].x, _588);
    float _598 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[1].z, _590);
    float _600 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[3].x, _592);
    float _602 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[0].z, _594);
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[2].z, _596);
    float _606 = _598 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _608 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[3].z, _600);
    float _610 = _602 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _612 = _604 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _614 = _606 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _616 = _606 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _618 = _606 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _620 = _606 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _622 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[5].x, _614);
    float _624 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[6].x, _616);
    float _626 = _608 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _628 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[4].x, _618);
    float _630 = fma(_612, (*spvDescriptorSet0.vp_c8)._m0[5].z, _622);
    float _632 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[7].x, _620);
    float _634 = fma(_612, (*spvDescriptorSet0.vp_c8)._m0[6].z, _624);
    float _636 = fma(_612, (*spvDescriptorSet0.vp_c8)._m0[4].z, _628);
    float _638 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[5].w, _630);
    float _640 = fma(_612, (*spvDescriptorSet0.vp_c8)._m0[7].z, _632);
    float _642 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[6].w, _634);
    float _644 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[4].w, _636);
    float _646 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[7].w, _640);
    float _648 = _584 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _656 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _642 + _646;
    float _660 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _666 = _658 * 0.5;
    out.m_33.x = _664;
    out.m_47.x = _660;
    out.m_47.y = _656;
    out.m_47.z = _662;
    out.m_47.w = _648;
    out.gl_Position.x = _644;
    out.gl_Position.y = _638;
    out.gl_Position.z = _642;
    out.gl_Position.w = _646;
    out.m_49.z = _666;
    out.m_49.w = _646;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _264 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_30.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    float _78 = _76;
    if (!_72)
    {
        out.m_33.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _76 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _723 = as_type<float>(_84);
        out.gl_Position.z = _723;
    }
    if (!_72)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _88 = in.m_35.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = 0.0;
    if (_98)
    {
        float _106 = float(_68);
        _104 = _106;
    }
    float _108 = _104;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    if (_114)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _78;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _86 = as_type<int>(_118);
    }
    int _120 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _791 = as_type<float>(_120);
        out.gl_Position.z = _791;
    }
    if (_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_37.w;
    float _124 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _126 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _128 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    float _136 = in.m_35.x;
    float _138 = in.m_35.y;
    float _140 = in.m_35.z;
    float _142 = in.m_30.x;
    float _144 = in.m_30.y;
    float _146 = in.m_30.z;
    float _148 = 0.0;
    float _150 = _124;
    if (!_134)
    {
        float _152 = _124 * _124;
        float _154 = _152 * 0.5;
        _148 = _154;
    }
    float _156 = _148;
    float _158 = _156;
    if (!_134)
    {
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = !_134;
    float _166 = _162;
    if (!_164)
    {
        float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _170 = log2(_168);
        float _172 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _174 = _172 + 1.0;
        float _176 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = _124 * _170;
        float _180 = exp2(_178);
        float _182 = _176 * 0.693147182464599609375;
        float _184 = 1.0 / _182;
        float _186 = 1.0 / _174;
        float _188 = _180 + (-1.0);
        float _190 = -_188;
        float _192 = fma(_190, _184, _124);
        float _194 = _192 * _186;
        float _196 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _196;
    }
    float _198 = _166;
    bool _200 = !_134;
    if (!_200)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = 1.0 / _208;
        float _212 = _124 * _204;
        float _214 = exp2(_212);
        float _216 = -_214;
        float _218 = _216 + 1.0;
        float _220 = _218 * _210;
        _150 = _220;
    }
    float _222 = _150;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _226 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _228 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _230 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _232 = fma(_222, _136, _226);
    float _234 = fma(_222, _138, _228);
    float _236 = fma(_222, _140, _230);
    float _238 = fma(_232, _122, _142);
    float _240 = fma(_234, _122, _144);
    float _242 = fma(_236, _122, _146);
    bool _244 = !_224;
    float _262;
    if (!_244)
    {
        float _246 = in.m_39.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_68);
        float _268 = 1.0 / _266;
        float _270 = _102 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = in.m_37.x;
    float _276 = in.m_37.y;
    float _278 = in.m_37.z;
    float _280 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _282 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _284 = in.m_41.x;
    float _286 = in.m_41.y;
    float _288 = in.m_41.z;
    float _290 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _292 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _280);
    float _294 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _282);
    float _296 = in.m_43.y;
    float _298 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _290);
    float _300 = in.m_43.x;
    float _302 = in.m_43.z;
    float _304 = in.m_43.w;
    float _306 = _276 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _308 = _274 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _310 = _278 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _312 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _286);
    float _314 = _306 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _316 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _284);
    float _318 = _308 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    out.m_45.y = _296;
    float _320 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _288);
    float _322 = _310 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_45.x = _300;
    float _324 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _292);
    float _326 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _294);
    float _328 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _298);
    float _330 = _314 * _312;
    out.m_45.z = _302;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _336 = _328 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _338 = _318 * _316;
    float _340 = _330 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _342 = _330 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_45.w = _304;
    float _344 = _322 * _320;
    float _346 = fma(_338, (*spvDescriptorSet0.vp_c8)._m0[26].x, _340);
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c8)._m0[24].x, _342);
    float _350 = 1.0 / _334;
    float _352 = fma(_344, (*spvDescriptorSet0.vp_c8)._m0[26].z, _346);
    float _354 = fma(_344, (*spvDescriptorSet0.vp_c8)._m0[24].z, _348);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _356;
    float _360 = _330 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _362 = _352 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _364 = _354 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _370 = _324 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _372 = _336 + _362;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _378 = 1.0 / _368;
    float _380 = _370 + _364;
    float _382 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _384 = _372 + _382;
    bool _386 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _388 = isnan(_272);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = _358 * _350;
    float _400 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _402 = _380 + _400;
    float _404 = _384 * _384;
    bool _406 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _408 = isnan(_272);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = 1.0 / _376;
    bool _420 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _422 = isnan(_272);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = fma(_402, _402, _404);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _436 = _272 + _434;
    float _438 = -_416;
    float _440 = _438 + 1.0;
    float _442 = fma(_338, (*spvDescriptorSet0.vp_c8)._m0[25].x, _360);
    float _444 = -_430;
    float _446 = _444 + 1.0;
    float _448 = fma(_398, _436, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _450 = sqrt(_432);
    float _452 = _430 * _440;
    float _454 = _396 * _446;
    bool _456 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _458 = isnan(_272);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -_396;
    float _470 = _468 + 1.0;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _476;
    float _480 = fma(_344, (*spvDescriptorSet0.vp_c8)._m0[25].z, _442);
    float _482 = _466 * _470;
    float _484 = _474 * _378;
    float _486 = _478 * _418;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _490 = _272 + _488;
    float _492 = _448 * _482;
    float _494 = -_466;
    float _496 = _494 + 1.0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _500 = _272 + _498;
    bool _502 = _450 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _504 = fma(_484, _490, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _506 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[115].x, _492);
    float _508 = _326 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _510 = _480 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _512 = fma(_486, _500, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _514 = fma(_504, _454, _506);
    float _516 = _508 + _510;
    float _518 = fma(_512, _452, _514);
    float _520 = _512;
    float _522 = _272;
    float _524 = _508;
    if (!_502)
    {
        _520 = _380;
    }
    float _526 = _520;
    float _528 = _526;
    if (!_502)
    {
        _522 = _372;
    }
    float _530 = _522;
    float _532 = _530;
    if (!_502)
    {
        _524 = _516;
    }
    float _534 = _524;
    bool _536 = !_502;
    float _538 = _534;
    if (!_536)
    {
        float _540 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _542 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _544 = _450 + _542;
        float _546 = _516 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _548 = rsqrt(_432);
        float _550 = _544 * _540;
        float _552 = _550 * 0.15915493667125701904296875;
        float _554 = _552 * 6.283185482025146484375;
        float _556 = cos(_554);
        float _558 = _552 * 6.283185482025146484375;
        float _560 = sin(_558);
        float _562 = _556 + (-1.0);
        float _564 = _562 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _566 = fma(_560, _546, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _568 = fma(_516, _556, _564);
        float _570 = _548 * _566;
        float _572 = fma(_402, _570, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _574 = fma(_384, _570, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _538 = _568;
        _528 = _572;
        _532 = _574;
    }
    float _576 = _538;
    float _578 = _528;
    float _580 = _532;
    float _582 = _576 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _584 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[118].x, _518);
    float _586 = _576 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _588 = _576 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _590 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[1].x, _582);
    float _592 = _576 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _594 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[0].x, _586);
    float _596 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[2].x, _588);
    float _598 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[1].z, _590);
    float _600 = fma(_578, (*spvDescriptorSet0.vp_c8)._m0[3].x, _592);
    float _602 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[0].z, _594);
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[2].z, _596);
    float _606 = _598 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _608 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[3].z, _600);
    float _610 = _602 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _612 = _604 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _614 = _606 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _616 = _606 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _618 = _606 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _620 = _606 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _622 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[5].x, _614);
    float _624 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[6].x, _616);
    float _626 = _608 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _628 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[4].x, _618);
    float _630 = fma(_612, (*spvDescriptorSet0.vp_c8)._m0[5].z, _622);
    float _632 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[7].x, _620);
    float _634 = fma(_612, (*spvDescriptorSet0.vp_c8)._m0[6].z, _624);
    float _636 = fma(_612, (*spvDescriptorSet0.vp_c8)._m0[4].z, _628);
    float _638 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[5].w, _630);
    float _640 = fma(_612, (*spvDescriptorSet0.vp_c8)._m0[7].z, _632);
    float _642 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[6].w, _634);
    float _644 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[4].w, _636);
    float _646 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[7].w, _640);
    float _648 = _584 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _656 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _642 + _646;
    float _660 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _666 = _658 * 0.5;
    out.m_33.x = _664;
    out.m_47.x = _660;
    out.m_47.y = _656;
    out.m_47.z = _662;
    out.m_47.w = _648;
    out.gl_Position.x = _644;
    out.gl_Position.y = _638;
    out.gl_Position.z = _642;
    out.gl_Position.w = _646;
    out.m_49.z = _666;
    out.m_49.w = _646;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

