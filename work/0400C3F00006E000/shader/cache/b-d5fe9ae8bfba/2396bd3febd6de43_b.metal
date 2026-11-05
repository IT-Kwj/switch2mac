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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_51 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_55 [[user(locn5)]];
    float4 m_57 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_34 [[attribute(3)]];
    float4 m_47 [[attribute(5)]];
    float4 m_43 [[attribute(6)]];
    float4 m_45 [[attribute(7)]];
    float4 m_41 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1056 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_32.w;
    float _73 = in.m_34.w;
    float _75 = trunc(_71);
    int _78 = int(_75);
    float _80 = -_73;
    float _82 = _80 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_37.y = _82;
    bool _86 = _78 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    if (!_86)
    {
        out.m_39.x = 0.0;
    }
    int _92 = 0;
    if (!_86)
    {
        float _94 = _90 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1302 = as_type<float>(_96);
        out.gl_Position.z = _1302;
    }
    if (!_86)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _100 = _73 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_73);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    float _110 = float(_78);
    bool _112 = _82 >= _110;
    bool _114 = !_108;
    bool _116 = _112 || _114;
    float _118 = _110;
    int _120 = 0;
    bool _122 = _116;
    if (_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _118;
    if (_116)
    {
        out.m_39.x = 0.0;
    }
    if (_116)
    {
        float _126 = _124 * 5.0;
        _98 = as_type<int>(_126);
    }
    int _128 = _98;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1359 = as_type<float>(_128);
        out.gl_Position.z = _1359;
    }
    if (_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_41.x;
    float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _134 = _82 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _138 = _136 != 0;
    float _140 = in.m_43.x;
    int _142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _144 = _142 != 0;
    float _146 = in.m_43.z;
    float _148 = in.m_43.w;
    float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _152 = in.m_45.x;
    float _154 = in.m_45.y;
    float _156 = in.m_45.z;
    int _158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _160 = _158 != 0;
    float _162 = 0.0;
    float _164 = _146;
    if (_138)
    {
        float _166 = in.m_43.z;
        _162 = _166;
    }
    float _168 = _162;
    float _170 = _134 * _132;
    float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _174 = in.m_47.x;
    float _176 = in.m_47.y;
    float _178 = in.m_47.z;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = _130;
    if (_144)
    {
        float _192 = -_130;
        float _194 = _192 + 1.0;
        _120 = as_type<int>(_194);
    }
    int _196 = _120;
    float _198 = in.m_43.y;
    float _200 = 0.0;
    int _202 = _196;
    if (!_144)
    {
        _200 = _130;
    }
    float _204 = _200;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _208 = _204;
    float _210 = _140;
    if (_144)
    {
        bool _212 = _140 > 0.5;
        _122 = _212;
    }
    bool _214 = _122;
    float _216 = in.m_41.y;
    float _218 = 0.0;
    if (!_138)
    {
        _218 = _130;
    }
    float _220 = _218;
    float _222 = _140 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _224 = _220;
    if (_144)
    {
        float _226 = _214 ? as_type<float>(_196) : _130;
        _208 = _226;
    }
    float _228 = _208;
    if (_138)
    {
        float _230 = -_130;
        float _232 = _230 + 1.0;
        _202 = as_type<int>(_232);
    }
    int _234 = _202;
    int _236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _238 = _236 != 0;
    float _240 = in.m_45.w;
    int _242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _244 = _242 != 0;
    float _246 = _156 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _248 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _248;
    bool _252 = false;
    if (_138)
    {
        bool _254 = _168 > 0.5;
        _252 = _254;
    }
    bool _256 = _252;
    float _258 = -_206;
    float _260 = fma(_222, 2.0, _258);
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (_138)
    {
        float _264 = _256 ? as_type<float>(_234) : _130;
        _224 = _264;
    }
    float _266 = _224;
    float _268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _176);
    bool _270 = _148 > 0.5;
    float _272 = _154 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _276 = _274 != 0;
    float _278 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _174);
    float _280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _178);
    float _282 = in.m_34.x;
    float _284 = in.m_34.y;
    float _286 = in.m_34.z;
    float _288 = _198 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _290 = _250 * _250;
    float _292 = in.m_32.x;
    float _294 = in.m_32.y;
    float _296 = in.m_32.z;
    float _298 = _82 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _300 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _302 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _300;
    float _304 = fma(_288, -2.0, _262);
    float _306 = -_216;
    float _308 = _306 + 1.0;
    bool _310 = _198 > 0.5;
    float _312 = fma(_302, _302, _290);
    float _314 = _150 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _316 = _302;
    float _318 = _298;
    float _320 = _216;
    if (!_188)
    {
        float _322 = _298 * _298;
        float _324 = _322 * 0.5;
        _316 = _324;
    }
    float _326 = _316;
    float _328 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _330 = _310 ? as_type<int>(_308) : as_type<int>(_216);
    float _332 = fma(_314, _228, -0.5);
    float _334 = _326;
    if (!_188)
    {
        float _336 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _334 = _336;
    }
    float _338 = _334;
    bool _340 = !_188;
    float _342 = _338;
    if (!_340)
    {
        float _344 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = log2(_344);
        float _348 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _350 = _348 + 1.0;
        float _352 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _354 = _298 * _346;
        float _356 = 1.0 / _350;
        float _358 = _352 * 0.693147182464599609375;
        float _360 = exp2(_354);
        float _362 = 1.0 / _358;
        float _364 = _360 + (-1.0);
        float _366 = -_364;
        float _368 = fma(_366, _362, _298);
        float _370 = _368 * _356;
        float _372 = _370 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _342 = _372;
    }
    float _374 = _342;
    int _376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _378 = _376 != 0;
    bool _380 = !_188;
    if (!_380)
    {
        float _382 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _384 = log2(_382);
        float _386 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _388 = _386 + 1.0;
        float _390 = 1.0 / _388;
        float _392 = _298 * _384;
        float _394 = exp2(_392);
        float _396 = -_394;
        float _398 = _396 + 1.0;
        float _400 = _398 * _390;
        _318 = _400;
    }
    float _402 = _318;
    float _404 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _406 = _238 ? as_type<float>(_330) : _216;
    float _408 = _172 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _410 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _412 = fma(_402, _284, _404);
    float _414 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[20].x, _170);
    float _416 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _418 = fma(_408, _406, -0.5);
    float _420 = fma(_402, _282, _410);
    float _422 = fma(_412, _240, _294);
    float _424 = fma(_402, _286, _416);
    float _426 = floor(_414);
    float _428 = fma(_420, _240, _292);
    float _430 = _422 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _432 = fma(_424, _240, _296);
    float _434 = _422 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _436 = _422 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[5].x, _430);
    bool _440 = _146 > 0.5;
    float _442 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[4].x, _434);
    float _444 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[6].x, _436);
    float _446 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[5].z, _438);
    int _448 = _440 ? as_type<int>(_308) : as_type<int>(_216);
    float _450 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].z, _442);
    float _452 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[6].z, _444);
    float _454 = _446 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    out.m_49.y = _216;
    float _456 = -_426;
    float _458 = _414 + _456;
    float _460 = _414 * 6.283185482025146484375;
    float _462 = _276 ? as_type<float>(_448) : _216;
    float _464 = _450 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _466 = -_454;
    float _468 = _466 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _470 = _452 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _472 = -_464;
    float _474 = _472 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _476 = _452;
    if (_160)
    {
        float _478 = _270 ? _308 : _216;
        _320 = _478;
    }
    float _480 = _320;
    float _482 = _460 * 0.15915493667125701904296875;
    float _484 = _468 * _468;
    float _486 = -_470;
    float _488 = _486 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _492 = _490 != 0;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _496 = _494 != 0;
    float _498 = fma(_474, _474, _484);
    float _500 = _482 * 6.283185482025146484375;
    float _502 = cos(_500);
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _506 = fma(_488, _488, _498);
    float _508 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[78].w, _504);
    bool _510 = !_492;
    int _512 = _510 ? 0 : 1;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _516 = rsqrt(_506);
    float _518 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _520 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _518;
    int _522 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _524 = _522 != 0;
    float _526 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[88].w, _514);
    float _528 = fma(_520, _520, _312);
    int _530 = abs(_512);
    float _532 = -_82;
    float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[76].x, _260);
    float _536 = fma(_502, 0.5, 0.5);
    bool _538 = _458 < 0.5;
    float _540 = float(_538);
    float _542 = -_458;
    float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _546 = -_536;
    float _548 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _550 = !_524;
    int _552 = _550 ? 0 : 1;
    float _554 = -_540;
    float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _558 = float(_530);
    float _560 = _474 * _516;
    int _562 = abs(_552);
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _566 = _488 * _516;
    float _568 = abs(_544);
    float _570 = _558 * _568;
    float _572 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _574 = _560 * _572;
    float _576 = _468 * _516;
    float _578 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[78].z, _564);
    bool _580 = !_496;
    int _582 = _580 ? 0 : 1;
    float _584 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _586 = _566 * _584;
    float _588 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _590 = -_574;
    float _592 = fma(_566, _588, _590);
    float _594 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _596 = _576 * _594;
    int _598 = abs(_582);
    float _600 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _602 = -_586;
    float _604 = fma(_576, _600, _602);
    float _606 = _592 * _592;
    float _608 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _610 = -_596;
    float _612 = fma(_560, _608, _610);
    float _614 = float(_562);
    float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _618 = fma(_604, _604, _606);
    float _620 = float(_598);
    float _622 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[77].z, _578);
    float _624 = fma(_614, _548, _570);
    float _626 = fma(_612, _612, _618);
    float _628 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[76].y, _304);
    float _630 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[77].w, _508);
    float _632 = abs(_556);
    float _634 = fma(_620, _632, _624);
    float _636 = sqrt(_528);
    float _638 = fma(_622, _332, _534);
    float _640 = _634 * _328;
    float _642 = _634 * _272;
    float _644 = _634 * _246;
    float _646 = -_628;
    float _648 = fma(_630, _418, _646);
    float _650 = _640 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _652 = rsqrt(_626);
    float _654 = _616 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _656 = _642 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _658 = _650 * _278;
    float _660 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _662 = fma(_654, _480, -0.5);
    float _664 = _656 * _268;
    bool _666 = _198 > 0.5;
    bool _668 = _666 && _244;
    float _670 = fma(_636, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _672 = _660 * _280;
    float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _676 = _560;
    if (!_378)
    {
        _476 = _198;
    }
    float _678 = _476;
    out.m_49.x = _130;
    float _680 = _678;
    if (_378)
    {
        _680 = _140;
    }
    float _682 = _680;
    float _684 = _592 * _652;
    float _686 = _604 * _652;
    float _688 = _612 * _652;
    float _690 = precise::max(_670, 1.0);
    float _692 = _566 * _684;
    float _694 = _576 * _686;
    float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _698 = -_692;
    float _700 = fma(_576, _688, _698);
    float _702 = -_694;
    float _704 = fma(_560, _684, _702);
    float _706 = precise::min(_690, 1.89999997615814208984375);
    float _708 = _674 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _710 = _664 * _700;
    float _712 = _664 * _704;
    float _714 = _700;
    if (_378)
    {
        _714 = _140;
    }
    float _716 = _714;
    float _718 = fma(_708, _266, -0.5);
    float _720 = fma(_658, _686, _710);
    float _722 = fma(_658, _688, _712);
    float _724 = _560 * _688;
    float _726 = fma(_672, _560, _720);
    float _728 = fma(_672, _566, _722);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _732 = -_724;
    float _734 = fma(_566, _686, _732);
    float _736 = fma(_726, _706, _464);
    float _738 = fma(_728, _706, _470);
    float _740 = _716;
    if (!_378)
    {
        _740 = _146;
    }
    float _742 = _740;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _746 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _748 = _736 + _746;
    float _750 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _752 = _738 + _750;
    if (!_378)
    {
        _676 = _146;
    }
    float _754 = _676;
    float _756 = _742 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _758 = _748 * _748;
    float _760 = _752 * _752;
    float _762 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[83].z, _744);
    float _764 = -_730;
    float _766 = fma(_756, 2.0, _764);
    float _768 = _682 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _770 = _758 + _760;
    float _772 = _756;
    float _774 = _754;
    if (!_244)
    {
        _772 = _130;
    }
    float _776 = _772;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _780 = _776;
    if (_668)
    {
        float _782 = -_130;
        float _784 = _782 + 1.0;
        _190 = _784;
    }
    float _786 = _190;
    float _788 = sqrt(_770);
    float _790 = _664 * _734;
    float _792 = _696 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_244)
    {
        _780 = _786;
    }
    float _794 = _780;
    float _796 = fma(_658, _684, _790);
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _800 = fma(_672, _576, _796);
    float _802 = _800;
    if (_378)
    {
        _164 = _198;
    }
    float _804 = _164;
    float _806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _808 = _804;
    if (_378)
    {
        _774 = _198;
    }
    float _810 = _774;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _816 = _804 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _818 = _788 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _820 = fma(_800, _706, _454);
    float _822 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[83].w, _778);
    float _824 = _810;
    float _826 = _816;
    float _828 = _814;
    if (_378)
    {
        _824 = _198;
    }
    float _830 = _824;
    float _832 = -_798;
    float _834 = fma(_768, 2.0, _832);
    float _836 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[88].z, _814);
    float _838 = _830;
    if (!_378)
    {
        _838 = _140;
    }
    float _840 = _838;
    float _842 = fma(_816, -2.0, _812);
    float _844 = fma(_462, _792, -0.5);
    if (!_818)
    {
        _802 = _760;
    }
    float _846 = _802;
    float _848 = _846;
    if (!_818)
    {
        _826 = _758;
    }
    float _850 = _826;
    float _852 = _850;
    if (!_818)
    {
        _210 = _736;
    }
    float _854 = _210;
    float _856 = _854;
    if (!_818)
    {
        _808 = _738;
    }
    float _858 = _808;
    float _860 = _858;
    if (!_818)
    {
        _828 = _820;
    }
    float _862 = _828;
    bool _864 = !_818;
    float _866 = _862;
    if (!_864)
    {
        float _868 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _872 = _788 + _870;
        float _874 = _820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = rsqrt(_770);
        float _878 = _872 * _868;
        float _880 = _878 * 0.15915493667125701904296875;
        float _882 = _880 * 6.283185482025146484375;
        float _884 = sin(_882);
        float _886 = _880 * 6.283185482025146484375;
        float _888 = cos(_886);
        float _890 = fma(_884, _874, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _892 = _876 * _890;
        float _894 = _888 + (-1.0);
        float _896 = fma(_748, _892, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _898 = fma(_752, _892, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _900 = _894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _904 = _896 + _902;
        float _906 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _908 = _898 + _906;
        float _910 = fma(_820, _888, _900);
        float _912 = _904 * _904;
        float _914 = _908 * _908;
        _866 = _910;
        _852 = _912;
        _848 = _914;
        _856 = _896;
        _860 = _898;
    }
    float _916 = _866;
    float _918 = _852;
    float _920 = _848;
    float _922 = _856;
    float _924 = _860;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _928 = _916 + _926;
    float _930 = -_82;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[81].x, _834);
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _936 = _840 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _938 = fma(_928, _928, _918);
    float _940 = _806 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _942 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[82].z, _762);
    float _944 = fma(_936, -2.0, _934);
    float _946 = _938 + _920;
    float _948 = fma(_940, _794, -0.5);
    float _950 = fma(_942, _718, _932);
    float _952 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[87].z, _836);
    float _954 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[87].w, _526);
    float _956 = -_82;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[86].x, _766);
    float _960 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[82].w, _822);
    float _962 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[81].y, _842);
    float _964 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[86].y, _944);
    float _966 = sqrt(_946);
    float _968 = fma(_952, _948, _958);
    float _970 = -_962;
    float _972 = fma(_960, _662, _970);
    float _974 = -_964;
    float _976 = fma(_954, _844, _974);
    float _978 = _638 + 0.5;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _982 = _648 + 0.5;
    float _984 = _968 + 0.5;
    float _986 = _950 + 0.5;
    float _988 = _972 + 0.5;
    float _990 = _976 + 0.5;
    out.m_51.w = _980;
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _994 = _454 + _992;
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _998 = _464 + _996;
    out.m_53.x = _978;
    out.m_53.y = _982;
    out.m_53.z = _986;
    out.m_53.w = _988;
    bool _1000 = _966 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1002 = isnan(_966);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1008 = _1004 || _1006;
    float _1010 = _994 * _994;
    out.m_55.x = _984;
    out.m_55.y = _990;
    float _1012 = fma(_998, _998, _1010);
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1016 = _470 + _1014;
    float _1018 = fma(_1016, _1016, _1012);
    float _1020 = _1016;
    if (!_1008)
    {
        _1020 = 1.0;
    }
    float _1022 = _1020;
    bool _1024 = !_1008;
    float _1026 = _1022;
    if (!_1024)
    {
        bool _1028 = _966 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1030 = isnan(_966);
        bool _1032 = _1028 || _1030;
        bool _1034 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1036 = _1032 || _1034;
        if (!_1036)
        {
            float _1038 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1040 = _966 + _1038;
            float _1042 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1044 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1042;
            float _1046 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1048 = _1046 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1050 = 1.0 / _1044;
            float _1052 = _1040 * _1050;
            float _1054 = fma(_1052, _1048, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1026 = _1054;
            _1056 = true;
        }
        else
        {
            bool _1058 = _966 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1060 = isnan(_966);
            bool _1062 = _1058 || _1060;
            bool _1064 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1066 = _1062 || _1064;
            if (!_1066)
            {
                float _1068 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1070 = _966 + _1068;
                float _1072 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1074 = _1072 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1076 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1078 = _1076 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1080 = 1.0 / _1074;
                float _1082 = _1070 * _1080;
                float _1084 = fma(_1082, _1078, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1026 = _1084;
                _1056 = true;
            }
            else
            {
                _1026 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1056 = false;
    float _1086 = _1026;
    float _1088 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1090 = _922 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1094 = _924 + _1092;
    bool _1096 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan(0.5);
    bool _1104 = _1100 || _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1108 = _916 + _1106;
    float _1110 = fma(_1090, _1086, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1112 = fma(_1094, _1086, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1114 = fma(_1108, _1086, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1116 = _1094;
    float _1118 = _1108;
    float _1120 = _1086;
    if (_1104)
    {
        _1116 = _1110;
    }
    float _1122 = _1116;
    float _1124 = _1122;
    if (_1104)
    {
        _1118 = _1114;
    }
    float _1126 = _1118;
    float _1128 = _1126;
    if (_1104)
    {
        _1120 = _1112;
    }
    float _1130 = _1120;
    float _1132 = _1130;
    if (!_1104)
    {
        float _1134 = sqrt(_1018);
        float _1136 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1140 = precise::min(_1134, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1142 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1144 = -_464;
        float _1146 = _1144 + _1110;
        float _1148 = _1140 * _1138;
        float _1150 = _1142 * _1148;
        float _1152 = -_454;
        float _1154 = _1152 + _1114;
        float _1156 = -_470;
        float _1158 = _1156 + _1112;
        float _1160 = fma(_1146, _1150, _464);
        float _1162 = fma(_1154, _1150, _454);
        float _1164 = fma(_1158, _1150, _470);
        _1128 = _1162;
        _1124 = _1160;
        _1132 = _1164;
    }
    float _1166 = _1128;
    float _1168 = _1124;
    float _1170 = _1132;
    float _1172 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1176 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1178 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1172);
    float _1180 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1182 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1174);
    float _1184 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1176);
    float _1186 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1178);
    float _1188 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1180);
    float _1190 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1182);
    float _1192 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1184);
    float _1194 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1196 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1188);
    float _1198 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1200 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1202 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1204 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1206 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1208 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1210 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1202);
    float _1212 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1204);
    float _1214 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1206);
    float _1216 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1208);
    float _1218 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1210);
    float _1220 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1222 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1212);
    float _1224 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1214);
    float _1226 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1216);
    float _1228 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1218);
    float _1230 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1232 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1222);
    float _1234 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1224);
    float _1236 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1226);
    out.m_39.x = 1.0;
    out.m_57.w = _1230;
    out.gl_Position.x = _1232;
    out.gl_Position.y = _1228;
    out.gl_Position.z = _1234;
    out.gl_Position.w = _1236;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1056 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_32.w;
    float _73 = in.m_34.w;
    float _75 = trunc(_71);
    int _78 = int(_75);
    float _80 = -_73;
    float _82 = _80 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_37.y = _82;
    bool _86 = _78 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    if (!_86)
    {
        out.m_39.x = 0.0;
    }
    int _92 = 0;
    if (!_86)
    {
        float _94 = _90 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1302 = as_type<float>(_96);
        out.gl_Position.z = _1302;
    }
    if (!_86)
    {
        return out;
    }
    bool _100 = _73 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_73);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    float _110 = float(_78);
    bool _112 = _82 >= _110;
    bool _114 = !_108;
    bool _116 = _112 || _114;
    float _118 = _110;
    int _120 = 0;
    bool _122 = _116;
    if (_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _118;
    if (_116)
    {
        out.m_39.x = 0.0;
    }
    if (_116)
    {
        float _126 = _124 * 5.0;
        _98 = as_type<int>(_126);
    }
    int _128 = _98;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1359 = as_type<float>(_128);
        out.gl_Position.z = _1359;
    }
    if (_116)
    {
        return out;
    }
    float _130 = in.m_41.x;
    float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _134 = _82 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _138 = _136 != 0;
    float _140 = in.m_43.x;
    int _142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _144 = _142 != 0;
    float _146 = in.m_43.z;
    float _148 = in.m_43.w;
    float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _152 = in.m_45.x;
    float _154 = in.m_45.y;
    float _156 = in.m_45.z;
    int _158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _160 = _158 != 0;
    float _162 = 0.0;
    float _164 = _146;
    if (_138)
    {
        float _166 = in.m_43.z;
        _162 = _166;
    }
    float _168 = _162;
    float _170 = _134 * _132;
    float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _174 = in.m_47.x;
    float _176 = in.m_47.y;
    float _178 = in.m_47.z;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = _130;
    if (_144)
    {
        float _192 = -_130;
        float _194 = _192 + 1.0;
        _120 = as_type<int>(_194);
    }
    int _196 = _120;
    float _198 = in.m_43.y;
    float _200 = 0.0;
    int _202 = _196;
    if (!_144)
    {
        _200 = _130;
    }
    float _204 = _200;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _208 = _204;
    float _210 = _140;
    if (_144)
    {
        bool _212 = _140 > 0.5;
        _122 = _212;
    }
    bool _214 = _122;
    float _216 = in.m_41.y;
    float _218 = 0.0;
    if (!_138)
    {
        _218 = _130;
    }
    float _220 = _218;
    float _222 = _140 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _224 = _220;
    if (_144)
    {
        float _226 = _214 ? as_type<float>(_196) : _130;
        _208 = _226;
    }
    float _228 = _208;
    if (_138)
    {
        float _230 = -_130;
        float _232 = _230 + 1.0;
        _202 = as_type<int>(_232);
    }
    int _234 = _202;
    int _236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _238 = _236 != 0;
    float _240 = in.m_45.w;
    int _242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _244 = _242 != 0;
    float _246 = _156 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _248 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _248;
    bool _252 = false;
    if (_138)
    {
        bool _254 = _168 > 0.5;
        _252 = _254;
    }
    bool _256 = _252;
    float _258 = -_206;
    float _260 = fma(_222, 2.0, _258);
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (_138)
    {
        float _264 = _256 ? as_type<float>(_234) : _130;
        _224 = _264;
    }
    float _266 = _224;
    float _268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _176);
    bool _270 = _148 > 0.5;
    float _272 = _154 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _276 = _274 != 0;
    float _278 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _174);
    float _280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _178);
    float _282 = in.m_34.x;
    float _284 = in.m_34.y;
    float _286 = in.m_34.z;
    float _288 = _198 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _290 = _250 * _250;
    float _292 = in.m_32.x;
    float _294 = in.m_32.y;
    float _296 = in.m_32.z;
    float _298 = _82 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _300 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _302 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _300;
    float _304 = fma(_288, -2.0, _262);
    float _306 = -_216;
    float _308 = _306 + 1.0;
    bool _310 = _198 > 0.5;
    float _312 = fma(_302, _302, _290);
    float _314 = _150 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _316 = _302;
    float _318 = _298;
    float _320 = _216;
    if (!_188)
    {
        float _322 = _298 * _298;
        float _324 = _322 * 0.5;
        _316 = _324;
    }
    float _326 = _316;
    float _328 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _330 = _310 ? as_type<int>(_308) : as_type<int>(_216);
    float _332 = fma(_314, _228, -0.5);
    float _334 = _326;
    if (!_188)
    {
        float _336 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _334 = _336;
    }
    float _338 = _334;
    bool _340 = !_188;
    float _342 = _338;
    if (!_340)
    {
        float _344 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = log2(_344);
        float _348 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _350 = _348 + 1.0;
        float _352 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _354 = _298 * _346;
        float _356 = 1.0 / _350;
        float _358 = _352 * 0.693147182464599609375;
        float _360 = exp2(_354);
        float _362 = 1.0 / _358;
        float _364 = _360 + (-1.0);
        float _366 = -_364;
        float _368 = fma(_366, _362, _298);
        float _370 = _368 * _356;
        float _372 = _370 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _342 = _372;
    }
    float _374 = _342;
    int _376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _378 = _376 != 0;
    bool _380 = !_188;
    if (!_380)
    {
        float _382 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _384 = log2(_382);
        float _386 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _388 = _386 + 1.0;
        float _390 = 1.0 / _388;
        float _392 = _298 * _384;
        float _394 = exp2(_392);
        float _396 = -_394;
        float _398 = _396 + 1.0;
        float _400 = _398 * _390;
        _318 = _400;
    }
    float _402 = _318;
    float _404 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _406 = _238 ? as_type<float>(_330) : _216;
    float _408 = _172 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _410 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _412 = fma(_402, _284, _404);
    float _414 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[20].x, _170);
    float _416 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _418 = fma(_408, _406, -0.5);
    float _420 = fma(_402, _282, _410);
    float _422 = fma(_412, _240, _294);
    float _424 = fma(_402, _286, _416);
    float _426 = floor(_414);
    float _428 = fma(_420, _240, _292);
    float _430 = _422 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _432 = fma(_424, _240, _296);
    float _434 = _422 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _436 = _422 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[5].x, _430);
    bool _440 = _146 > 0.5;
    float _442 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[4].x, _434);
    float _444 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[6].x, _436);
    float _446 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[5].z, _438);
    int _448 = _440 ? as_type<int>(_308) : as_type<int>(_216);
    float _450 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].z, _442);
    float _452 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[6].z, _444);
    float _454 = _446 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    out.m_49.y = _216;
    float _456 = -_426;
    float _458 = _414 + _456;
    float _460 = _414 * 6.283185482025146484375;
    float _462 = _276 ? as_type<float>(_448) : _216;
    float _464 = _450 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _466 = -_454;
    float _468 = _466 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _470 = _452 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _472 = -_464;
    float _474 = _472 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _476 = _452;
    if (_160)
    {
        float _478 = _270 ? _308 : _216;
        _320 = _478;
    }
    float _480 = _320;
    float _482 = _460 * 0.15915493667125701904296875;
    float _484 = _468 * _468;
    float _486 = -_470;
    float _488 = _486 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _492 = _490 != 0;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _496 = _494 != 0;
    float _498 = fma(_474, _474, _484);
    float _500 = _482 * 6.283185482025146484375;
    float _502 = cos(_500);
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _506 = fma(_488, _488, _498);
    float _508 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[78].w, _504);
    bool _510 = !_492;
    int _512 = _510 ? 0 : 1;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _516 = rsqrt(_506);
    float _518 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _520 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _518;
    int _522 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _524 = _522 != 0;
    float _526 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[88].w, _514);
    float _528 = fma(_520, _520, _312);
    int _530 = abs(_512);
    float _532 = -_82;
    float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[76].x, _260);
    float _536 = fma(_502, 0.5, 0.5);
    bool _538 = _458 < 0.5;
    float _540 = float(_538);
    float _542 = -_458;
    float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _546 = -_536;
    float _548 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _550 = !_524;
    int _552 = _550 ? 0 : 1;
    float _554 = -_540;
    float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _558 = float(_530);
    float _560 = _474 * _516;
    int _562 = abs(_552);
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _566 = _488 * _516;
    float _568 = abs(_544);
    float _570 = _558 * _568;
    float _572 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _574 = _560 * _572;
    float _576 = _468 * _516;
    float _578 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[78].z, _564);
    bool _580 = !_496;
    int _582 = _580 ? 0 : 1;
    float _584 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _586 = _566 * _584;
    float _588 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _590 = -_574;
    float _592 = fma(_566, _588, _590);
    float _594 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _596 = _576 * _594;
    int _598 = abs(_582);
    float _600 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _602 = -_586;
    float _604 = fma(_576, _600, _602);
    float _606 = _592 * _592;
    float _608 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _610 = -_596;
    float _612 = fma(_560, _608, _610);
    float _614 = float(_562);
    float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _618 = fma(_604, _604, _606);
    float _620 = float(_598);
    float _622 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[77].z, _578);
    float _624 = fma(_614, _548, _570);
    float _626 = fma(_612, _612, _618);
    float _628 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[76].y, _304);
    float _630 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[77].w, _508);
    float _632 = abs(_556);
    float _634 = fma(_620, _632, _624);
    float _636 = sqrt(_528);
    float _638 = fma(_622, _332, _534);
    float _640 = _634 * _328;
    float _642 = _634 * _272;
    float _644 = _634 * _246;
    float _646 = -_628;
    float _648 = fma(_630, _418, _646);
    float _650 = _640 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _652 = rsqrt(_626);
    float _654 = _616 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _656 = _642 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _658 = _650 * _278;
    float _660 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _662 = fma(_654, _480, -0.5);
    float _664 = _656 * _268;
    bool _666 = _198 > 0.5;
    bool _668 = _666 && _244;
    float _670 = fma(_636, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _672 = _660 * _280;
    float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _676 = _560;
    if (!_378)
    {
        _476 = _198;
    }
    float _678 = _476;
    out.m_49.x = _130;
    float _680 = _678;
    if (_378)
    {
        _680 = _140;
    }
    float _682 = _680;
    float _684 = _592 * _652;
    float _686 = _604 * _652;
    float _688 = _612 * _652;
    float _690 = precise::max(_670, 1.0);
    float _692 = _566 * _684;
    float _694 = _576 * _686;
    float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _698 = -_692;
    float _700 = fma(_576, _688, _698);
    float _702 = -_694;
    float _704 = fma(_560, _684, _702);
    float _706 = precise::min(_690, 1.89999997615814208984375);
    float _708 = _674 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _710 = _664 * _700;
    float _712 = _664 * _704;
    float _714 = _700;
    if (_378)
    {
        _714 = _140;
    }
    float _716 = _714;
    float _718 = fma(_708, _266, -0.5);
    float _720 = fma(_658, _686, _710);
    float _722 = fma(_658, _688, _712);
    float _724 = _560 * _688;
    float _726 = fma(_672, _560, _720);
    float _728 = fma(_672, _566, _722);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _732 = -_724;
    float _734 = fma(_566, _686, _732);
    float _736 = fma(_726, _706, _464);
    float _738 = fma(_728, _706, _470);
    float _740 = _716;
    if (!_378)
    {
        _740 = _146;
    }
    float _742 = _740;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _746 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _748 = _736 + _746;
    float _750 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _752 = _738 + _750;
    if (!_378)
    {
        _676 = _146;
    }
    float _754 = _676;
    float _756 = _742 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _758 = _748 * _748;
    float _760 = _752 * _752;
    float _762 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[83].z, _744);
    float _764 = -_730;
    float _766 = fma(_756, 2.0, _764);
    float _768 = _682 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _770 = _758 + _760;
    float _772 = _756;
    float _774 = _754;
    if (!_244)
    {
        _772 = _130;
    }
    float _776 = _772;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _780 = _776;
    if (_668)
    {
        float _782 = -_130;
        float _784 = _782 + 1.0;
        _190 = _784;
    }
    float _786 = _190;
    float _788 = sqrt(_770);
    float _790 = _664 * _734;
    float _792 = _696 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_244)
    {
        _780 = _786;
    }
    float _794 = _780;
    float _796 = fma(_658, _684, _790);
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _800 = fma(_672, _576, _796);
    float _802 = _800;
    if (_378)
    {
        _164 = _198;
    }
    float _804 = _164;
    float _806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _808 = _804;
    if (_378)
    {
        _774 = _198;
    }
    float _810 = _774;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _816 = _804 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _818 = _788 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _820 = fma(_800, _706, _454);
    float _822 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[83].w, _778);
    float _824 = _810;
    float _826 = _816;
    float _828 = _814;
    if (_378)
    {
        _824 = _198;
    }
    float _830 = _824;
    float _832 = -_798;
    float _834 = fma(_768, 2.0, _832);
    float _836 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[88].z, _814);
    float _838 = _830;
    if (!_378)
    {
        _838 = _140;
    }
    float _840 = _838;
    float _842 = fma(_816, -2.0, _812);
    float _844 = fma(_462, _792, -0.5);
    if (!_818)
    {
        _802 = _760;
    }
    float _846 = _802;
    float _848 = _846;
    if (!_818)
    {
        _826 = _758;
    }
    float _850 = _826;
    float _852 = _850;
    if (!_818)
    {
        _210 = _736;
    }
    float _854 = _210;
    float _856 = _854;
    if (!_818)
    {
        _808 = _738;
    }
    float _858 = _808;
    float _860 = _858;
    if (!_818)
    {
        _828 = _820;
    }
    float _862 = _828;
    bool _864 = !_818;
    float _866 = _862;
    if (!_864)
    {
        float _868 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _872 = _788 + _870;
        float _874 = _820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = rsqrt(_770);
        float _878 = _872 * _868;
        float _880 = _878 * 0.15915493667125701904296875;
        float _882 = _880 * 6.283185482025146484375;
        float _884 = sin(_882);
        float _886 = _880 * 6.283185482025146484375;
        float _888 = cos(_886);
        float _890 = fma(_884, _874, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _892 = _876 * _890;
        float _894 = _888 + (-1.0);
        float _896 = fma(_748, _892, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _898 = fma(_752, _892, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _900 = _894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _904 = _896 + _902;
        float _906 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _908 = _898 + _906;
        float _910 = fma(_820, _888, _900);
        float _912 = _904 * _904;
        float _914 = _908 * _908;
        _866 = _910;
        _852 = _912;
        _848 = _914;
        _856 = _896;
        _860 = _898;
    }
    float _916 = _866;
    float _918 = _852;
    float _920 = _848;
    float _922 = _856;
    float _924 = _860;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _928 = _916 + _926;
    float _930 = -_82;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[81].x, _834);
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _936 = _840 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _938 = fma(_928, _928, _918);
    float _940 = _806 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _942 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[82].z, _762);
    float _944 = fma(_936, -2.0, _934);
    float _946 = _938 + _920;
    float _948 = fma(_940, _794, -0.5);
    float _950 = fma(_942, _718, _932);
    float _952 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[87].z, _836);
    float _954 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[87].w, _526);
    float _956 = -_82;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[86].x, _766);
    float _960 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[82].w, _822);
    float _962 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[81].y, _842);
    float _964 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[86].y, _944);
    float _966 = sqrt(_946);
    float _968 = fma(_952, _948, _958);
    float _970 = -_962;
    float _972 = fma(_960, _662, _970);
    float _974 = -_964;
    float _976 = fma(_954, _844, _974);
    float _978 = _638 + 0.5;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _982 = _648 + 0.5;
    float _984 = _968 + 0.5;
    float _986 = _950 + 0.5;
    float _988 = _972 + 0.5;
    float _990 = _976 + 0.5;
    out.m_51.w = _980;
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _994 = _454 + _992;
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _998 = _464 + _996;
    out.m_53.x = _978;
    out.m_53.y = _982;
    out.m_53.z = _986;
    out.m_53.w = _988;
    bool _1000 = _966 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1002 = isnan(_966);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1008 = _1004 || _1006;
    float _1010 = _994 * _994;
    out.m_55.x = _984;
    out.m_55.y = _990;
    float _1012 = fma(_998, _998, _1010);
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1016 = _470 + _1014;
    float _1018 = fma(_1016, _1016, _1012);
    float _1020 = _1016;
    if (!_1008)
    {
        _1020 = 1.0;
    }
    float _1022 = _1020;
    bool _1024 = !_1008;
    float _1026 = _1022;
    if (!_1024)
    {
        bool _1028 = _966 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1030 = isnan(_966);
        bool _1032 = _1028 || _1030;
        bool _1034 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1036 = _1032 || _1034;
        if (!_1036)
        {
            float _1038 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1040 = _966 + _1038;
            float _1042 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1044 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1042;
            float _1046 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1048 = _1046 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1050 = 1.0 / _1044;
            float _1052 = _1040 * _1050;
            float _1054 = fma(_1052, _1048, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1026 = _1054;
            _1056 = true;
        }
        else
        {
            bool _1058 = _966 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1060 = isnan(_966);
            bool _1062 = _1058 || _1060;
            bool _1064 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1066 = _1062 || _1064;
            if (!_1066)
            {
                float _1068 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1070 = _966 + _1068;
                float _1072 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1074 = _1072 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1076 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1078 = _1076 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1080 = 1.0 / _1074;
                float _1082 = _1070 * _1080;
                float _1084 = fma(_1082, _1078, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1026 = _1084;
                _1056 = true;
            }
            else
            {
                _1026 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1056 = false;
    float _1086 = _1026;
    float _1088 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1090 = _922 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1094 = _924 + _1092;
    bool _1096 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan(0.5);
    bool _1104 = _1100 || _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1108 = _916 + _1106;
    float _1110 = fma(_1090, _1086, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1112 = fma(_1094, _1086, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1114 = fma(_1108, _1086, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1116 = _1094;
    float _1118 = _1108;
    float _1120 = _1086;
    if (_1104)
    {
        _1116 = _1110;
    }
    float _1122 = _1116;
    float _1124 = _1122;
    if (_1104)
    {
        _1118 = _1114;
    }
    float _1126 = _1118;
    float _1128 = _1126;
    if (_1104)
    {
        _1120 = _1112;
    }
    float _1130 = _1120;
    float _1132 = _1130;
    if (!_1104)
    {
        float _1134 = sqrt(_1018);
        float _1136 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1140 = precise::min(_1134, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1142 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1144 = -_464;
        float _1146 = _1144 + _1110;
        float _1148 = _1140 * _1138;
        float _1150 = _1142 * _1148;
        float _1152 = -_454;
        float _1154 = _1152 + _1114;
        float _1156 = -_470;
        float _1158 = _1156 + _1112;
        float _1160 = fma(_1146, _1150, _464);
        float _1162 = fma(_1154, _1150, _454);
        float _1164 = fma(_1158, _1150, _470);
        _1128 = _1162;
        _1124 = _1160;
        _1132 = _1164;
    }
    float _1166 = _1128;
    float _1168 = _1124;
    float _1170 = _1132;
    float _1172 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1176 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1178 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1172);
    float _1180 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1182 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1174);
    float _1184 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1176);
    float _1186 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1178);
    float _1188 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1180);
    float _1190 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1182);
    float _1192 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1184);
    float _1194 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1196 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1188);
    float _1198 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1200 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1202 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1204 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1206 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1208 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1210 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1202);
    float _1212 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1204);
    float _1214 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1206);
    float _1216 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1208);
    float _1218 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1210);
    float _1220 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1222 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1212);
    float _1224 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1214);
    float _1226 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1216);
    float _1228 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1218);
    float _1230 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1232 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1222);
    float _1234 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1224);
    float _1236 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1226);
    out.m_39.x = 1.0;
    out.m_57.w = _1230;
    out.gl_Position.x = _1232;
    out.gl_Position.y = _1228;
    out.gl_Position.z = _1234;
    out.gl_Position.w = _1236;
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
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1056 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_32.w;
    float _73 = in.m_34.w;
    float _75 = trunc(_71);
    int _78 = int(_75);
    float _80 = -_73;
    float _82 = _80 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_37.y = _82;
    bool _86 = _78 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    if (!_86)
    {
        out.m_39.x = 0.0;
    }
    int _92 = 0;
    if (!_86)
    {
        float _94 = _90 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1302 = as_type<float>(_96);
        out.gl_Position.z = _1302;
    }
    if (!_86)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _100 = _73 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_73);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    float _110 = float(_78);
    bool _112 = _82 >= _110;
    bool _114 = !_108;
    bool _116 = _112 || _114;
    float _118 = _110;
    int _120 = 0;
    bool _122 = _116;
    if (_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _118;
    if (_116)
    {
        out.m_39.x = 0.0;
    }
    if (_116)
    {
        float _126 = _124 * 5.0;
        _98 = as_type<int>(_126);
    }
    int _128 = _98;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1359 = as_type<float>(_128);
        out.gl_Position.z = _1359;
    }
    if (_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_41.x;
    float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _134 = _82 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _138 = _136 != 0;
    float _140 = in.m_43.x;
    int _142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _144 = _142 != 0;
    float _146 = in.m_43.z;
    float _148 = in.m_43.w;
    float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _152 = in.m_45.x;
    float _154 = in.m_45.y;
    float _156 = in.m_45.z;
    int _158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _160 = _158 != 0;
    float _162 = 0.0;
    float _164 = _146;
    if (_138)
    {
        float _166 = in.m_43.z;
        _162 = _166;
    }
    float _168 = _162;
    float _170 = _134 * _132;
    float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _174 = in.m_47.x;
    float _176 = in.m_47.y;
    float _178 = in.m_47.z;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = _130;
    if (_144)
    {
        float _192 = -_130;
        float _194 = _192 + 1.0;
        _120 = as_type<int>(_194);
    }
    int _196 = _120;
    float _198 = in.m_43.y;
    float _200 = 0.0;
    int _202 = _196;
    if (!_144)
    {
        _200 = _130;
    }
    float _204 = _200;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _208 = _204;
    float _210 = _140;
    if (_144)
    {
        bool _212 = _140 > 0.5;
        _122 = _212;
    }
    bool _214 = _122;
    float _216 = in.m_41.y;
    float _218 = 0.0;
    if (!_138)
    {
        _218 = _130;
    }
    float _220 = _218;
    float _222 = _140 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _224 = _220;
    if (_144)
    {
        float _226 = _214 ? as_type<float>(_196) : _130;
        _208 = _226;
    }
    float _228 = _208;
    if (_138)
    {
        float _230 = -_130;
        float _232 = _230 + 1.0;
        _202 = as_type<int>(_232);
    }
    int _234 = _202;
    int _236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _238 = _236 != 0;
    float _240 = in.m_45.w;
    int _242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _244 = _242 != 0;
    float _246 = _156 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _248 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _248;
    bool _252 = false;
    if (_138)
    {
        bool _254 = _168 > 0.5;
        _252 = _254;
    }
    bool _256 = _252;
    float _258 = -_206;
    float _260 = fma(_222, 2.0, _258);
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (_138)
    {
        float _264 = _256 ? as_type<float>(_234) : _130;
        _224 = _264;
    }
    float _266 = _224;
    float _268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _176);
    bool _270 = _148 > 0.5;
    float _272 = _154 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _276 = _274 != 0;
    float _278 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _174);
    float _280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _178);
    float _282 = in.m_34.x;
    float _284 = in.m_34.y;
    float _286 = in.m_34.z;
    float _288 = _198 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _290 = _250 * _250;
    float _292 = in.m_32.x;
    float _294 = in.m_32.y;
    float _296 = in.m_32.z;
    float _298 = _82 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _300 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _302 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _300;
    float _304 = fma(_288, -2.0, _262);
    float _306 = -_216;
    float _308 = _306 + 1.0;
    bool _310 = _198 > 0.5;
    float _312 = fma(_302, _302, _290);
    float _314 = _150 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _316 = _302;
    float _318 = _298;
    float _320 = _216;
    if (!_188)
    {
        float _322 = _298 * _298;
        float _324 = _322 * 0.5;
        _316 = _324;
    }
    float _326 = _316;
    float _328 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _330 = _310 ? as_type<int>(_308) : as_type<int>(_216);
    float _332 = fma(_314, _228, -0.5);
    float _334 = _326;
    if (!_188)
    {
        float _336 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _334 = _336;
    }
    float _338 = _334;
    bool _340 = !_188;
    float _342 = _338;
    if (!_340)
    {
        float _344 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = log2(_344);
        float _348 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _350 = _348 + 1.0;
        float _352 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _354 = _298 * _346;
        float _356 = 1.0 / _350;
        float _358 = _352 * 0.693147182464599609375;
        float _360 = exp2(_354);
        float _362 = 1.0 / _358;
        float _364 = _360 + (-1.0);
        float _366 = -_364;
        float _368 = fma(_366, _362, _298);
        float _370 = _368 * _356;
        float _372 = _370 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _342 = _372;
    }
    float _374 = _342;
    int _376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _378 = _376 != 0;
    bool _380 = !_188;
    if (!_380)
    {
        float _382 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _384 = log2(_382);
        float _386 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _388 = _386 + 1.0;
        float _390 = 1.0 / _388;
        float _392 = _298 * _384;
        float _394 = exp2(_392);
        float _396 = -_394;
        float _398 = _396 + 1.0;
        float _400 = _398 * _390;
        _318 = _400;
    }
    float _402 = _318;
    float _404 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _406 = _238 ? as_type<float>(_330) : _216;
    float _408 = _172 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _410 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _412 = fma(_402, _284, _404);
    float _414 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[20].x, _170);
    float _416 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _418 = fma(_408, _406, -0.5);
    float _420 = fma(_402, _282, _410);
    float _422 = fma(_412, _240, _294);
    float _424 = fma(_402, _286, _416);
    float _426 = floor(_414);
    float _428 = fma(_420, _240, _292);
    float _430 = _422 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _432 = fma(_424, _240, _296);
    float _434 = _422 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _436 = _422 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[5].x, _430);
    bool _440 = _146 > 0.5;
    float _442 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[4].x, _434);
    float _444 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[6].x, _436);
    float _446 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[5].z, _438);
    int _448 = _440 ? as_type<int>(_308) : as_type<int>(_216);
    float _450 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].z, _442);
    float _452 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[6].z, _444);
    float _454 = _446 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    out.m_49.y = _216;
    float _456 = -_426;
    float _458 = _414 + _456;
    float _460 = _414 * 6.283185482025146484375;
    float _462 = _276 ? as_type<float>(_448) : _216;
    float _464 = _450 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _466 = -_454;
    float _468 = _466 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _470 = _452 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _472 = -_464;
    float _474 = _472 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _476 = _452;
    if (_160)
    {
        float _478 = _270 ? _308 : _216;
        _320 = _478;
    }
    float _480 = _320;
    float _482 = _460 * 0.15915493667125701904296875;
    float _484 = _468 * _468;
    float _486 = -_470;
    float _488 = _486 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _492 = _490 != 0;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _496 = _494 != 0;
    float _498 = fma(_474, _474, _484);
    float _500 = _482 * 6.283185482025146484375;
    float _502 = cos(_500);
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _506 = fma(_488, _488, _498);
    float _508 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[78].w, _504);
    bool _510 = !_492;
    int _512 = _510 ? 0 : 1;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _516 = rsqrt(_506);
    float _518 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _520 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _518;
    int _522 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _524 = _522 != 0;
    float _526 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[88].w, _514);
    float _528 = fma(_520, _520, _312);
    int _530 = abs(_512);
    float _532 = -_82;
    float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[76].x, _260);
    float _536 = fma(_502, 0.5, 0.5);
    bool _538 = _458 < 0.5;
    float _540 = float(_538);
    float _542 = -_458;
    float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _546 = -_536;
    float _548 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _550 = !_524;
    int _552 = _550 ? 0 : 1;
    float _554 = -_540;
    float _556 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _558 = float(_530);
    float _560 = _474 * _516;
    int _562 = abs(_552);
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _566 = _488 * _516;
    float _568 = abs(_544);
    float _570 = _558 * _568;
    float _572 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _574 = _560 * _572;
    float _576 = _468 * _516;
    float _578 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[78].z, _564);
    bool _580 = !_496;
    int _582 = _580 ? 0 : 1;
    float _584 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _586 = _566 * _584;
    float _588 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _590 = -_574;
    float _592 = fma(_566, _588, _590);
    float _594 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _596 = _576 * _594;
    int _598 = abs(_582);
    float _600 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _602 = -_586;
    float _604 = fma(_576, _600, _602);
    float _606 = _592 * _592;
    float _608 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _610 = -_596;
    float _612 = fma(_560, _608, _610);
    float _614 = float(_562);
    float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _618 = fma(_604, _604, _606);
    float _620 = float(_598);
    float _622 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[77].z, _578);
    float _624 = fma(_614, _548, _570);
    float _626 = fma(_612, _612, _618);
    float _628 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[76].y, _304);
    float _630 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[77].w, _508);
    float _632 = abs(_556);
    float _634 = fma(_620, _632, _624);
    float _636 = sqrt(_528);
    float _638 = fma(_622, _332, _534);
    float _640 = _634 * _328;
    float _642 = _634 * _272;
    float _644 = _634 * _246;
    float _646 = -_628;
    float _648 = fma(_630, _418, _646);
    float _650 = _640 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _652 = rsqrt(_626);
    float _654 = _616 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _656 = _642 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _658 = _650 * _278;
    float _660 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _662 = fma(_654, _480, -0.5);
    float _664 = _656 * _268;
    bool _666 = _198 > 0.5;
    bool _668 = _666 && _244;
    float _670 = fma(_636, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _672 = _660 * _280;
    float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _676 = _560;
    if (!_378)
    {
        _476 = _198;
    }
    float _678 = _476;
    out.m_49.x = _130;
    float _680 = _678;
    if (_378)
    {
        _680 = _140;
    }
    float _682 = _680;
    float _684 = _592 * _652;
    float _686 = _604 * _652;
    float _688 = _612 * _652;
    float _690 = precise::max(_670, 1.0);
    float _692 = _566 * _684;
    float _694 = _576 * _686;
    float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _698 = -_692;
    float _700 = fma(_576, _688, _698);
    float _702 = -_694;
    float _704 = fma(_560, _684, _702);
    float _706 = precise::min(_690, 1.89999997615814208984375);
    float _708 = _674 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _710 = _664 * _700;
    float _712 = _664 * _704;
    float _714 = _700;
    if (_378)
    {
        _714 = _140;
    }
    float _716 = _714;
    float _718 = fma(_708, _266, -0.5);
    float _720 = fma(_658, _686, _710);
    float _722 = fma(_658, _688, _712);
    float _724 = _560 * _688;
    float _726 = fma(_672, _560, _720);
    float _728 = fma(_672, _566, _722);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _732 = -_724;
    float _734 = fma(_566, _686, _732);
    float _736 = fma(_726, _706, _464);
    float _738 = fma(_728, _706, _470);
    float _740 = _716;
    if (!_378)
    {
        _740 = _146;
    }
    float _742 = _740;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _746 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _748 = _736 + _746;
    float _750 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _752 = _738 + _750;
    if (!_378)
    {
        _676 = _146;
    }
    float _754 = _676;
    float _756 = _742 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _758 = _748 * _748;
    float _760 = _752 * _752;
    float _762 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[83].z, _744);
    float _764 = -_730;
    float _766 = fma(_756, 2.0, _764);
    float _768 = _682 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _770 = _758 + _760;
    float _772 = _756;
    float _774 = _754;
    if (!_244)
    {
        _772 = _130;
    }
    float _776 = _772;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _780 = _776;
    if (_668)
    {
        float _782 = -_130;
        float _784 = _782 + 1.0;
        _190 = _784;
    }
    float _786 = _190;
    float _788 = sqrt(_770);
    float _790 = _664 * _734;
    float _792 = _696 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_244)
    {
        _780 = _786;
    }
    float _794 = _780;
    float _796 = fma(_658, _684, _790);
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _800 = fma(_672, _576, _796);
    float _802 = _800;
    if (_378)
    {
        _164 = _198;
    }
    float _804 = _164;
    float _806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _808 = _804;
    if (_378)
    {
        _774 = _198;
    }
    float _810 = _774;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _816 = _804 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _818 = _788 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _820 = fma(_800, _706, _454);
    float _822 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[83].w, _778);
    float _824 = _810;
    float _826 = _816;
    float _828 = _814;
    if (_378)
    {
        _824 = _198;
    }
    float _830 = _824;
    float _832 = -_798;
    float _834 = fma(_768, 2.0, _832);
    float _836 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[88].z, _814);
    float _838 = _830;
    if (!_378)
    {
        _838 = _140;
    }
    float _840 = _838;
    float _842 = fma(_816, -2.0, _812);
    float _844 = fma(_462, _792, -0.5);
    if (!_818)
    {
        _802 = _760;
    }
    float _846 = _802;
    float _848 = _846;
    if (!_818)
    {
        _826 = _758;
    }
    float _850 = _826;
    float _852 = _850;
    if (!_818)
    {
        _210 = _736;
    }
    float _854 = _210;
    float _856 = _854;
    if (!_818)
    {
        _808 = _738;
    }
    float _858 = _808;
    float _860 = _858;
    if (!_818)
    {
        _828 = _820;
    }
    float _862 = _828;
    bool _864 = !_818;
    float _866 = _862;
    if (!_864)
    {
        float _868 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _872 = _788 + _870;
        float _874 = _820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = rsqrt(_770);
        float _878 = _872 * _868;
        float _880 = _878 * 0.15915493667125701904296875;
        float _882 = _880 * 6.283185482025146484375;
        float _884 = sin(_882);
        float _886 = _880 * 6.283185482025146484375;
        float _888 = cos(_886);
        float _890 = fma(_884, _874, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _892 = _876 * _890;
        float _894 = _888 + (-1.0);
        float _896 = fma(_748, _892, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _898 = fma(_752, _892, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _900 = _894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _904 = _896 + _902;
        float _906 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _908 = _898 + _906;
        float _910 = fma(_820, _888, _900);
        float _912 = _904 * _904;
        float _914 = _908 * _908;
        _866 = _910;
        _852 = _912;
        _848 = _914;
        _856 = _896;
        _860 = _898;
    }
    float _916 = _866;
    float _918 = _852;
    float _920 = _848;
    float _922 = _856;
    float _924 = _860;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _928 = _916 + _926;
    float _930 = -_82;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[81].x, _834);
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _936 = _840 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _938 = fma(_928, _928, _918);
    float _940 = _806 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _942 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[82].z, _762);
    float _944 = fma(_936, -2.0, _934);
    float _946 = _938 + _920;
    float _948 = fma(_940, _794, -0.5);
    float _950 = fma(_942, _718, _932);
    float _952 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[87].z, _836);
    float _954 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[87].w, _526);
    float _956 = -_82;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[86].x, _766);
    float _960 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[82].w, _822);
    float _962 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[81].y, _842);
    float _964 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[86].y, _944);
    float _966 = sqrt(_946);
    float _968 = fma(_952, _948, _958);
    float _970 = -_962;
    float _972 = fma(_960, _662, _970);
    float _974 = -_964;
    float _976 = fma(_954, _844, _974);
    float _978 = _638 + 0.5;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _982 = _648 + 0.5;
    float _984 = _968 + 0.5;
    float _986 = _950 + 0.5;
    float _988 = _972 + 0.5;
    float _990 = _976 + 0.5;
    out.m_51.w = _980;
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _994 = _454 + _992;
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _998 = _464 + _996;
    out.m_53.x = _978;
    out.m_53.y = _982;
    out.m_53.z = _986;
    out.m_53.w = _988;
    bool _1000 = _966 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1002 = isnan(_966);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1008 = _1004 || _1006;
    float _1010 = _994 * _994;
    out.m_55.x = _984;
    out.m_55.y = _990;
    float _1012 = fma(_998, _998, _1010);
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1016 = _470 + _1014;
    float _1018 = fma(_1016, _1016, _1012);
    float _1020 = _1016;
    if (!_1008)
    {
        _1020 = 1.0;
    }
    float _1022 = _1020;
    bool _1024 = !_1008;
    float _1026 = _1022;
    if (!_1024)
    {
        bool _1028 = _966 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1030 = isnan(_966);
        bool _1032 = _1028 || _1030;
        bool _1034 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1036 = _1032 || _1034;
        if (!_1036)
        {
            float _1038 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1040 = _966 + _1038;
            float _1042 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1044 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1042;
            float _1046 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1048 = _1046 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1050 = 1.0 / _1044;
            float _1052 = _1040 * _1050;
            float _1054 = fma(_1052, _1048, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1026 = _1054;
            _1056 = true;
        }
        else
        {
            bool _1058 = _966 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1060 = isnan(_966);
            bool _1062 = _1058 || _1060;
            bool _1064 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1066 = _1062 || _1064;
            if (!_1066)
            {
                float _1068 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1070 = _966 + _1068;
                float _1072 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1074 = _1072 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1076 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1078 = _1076 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1080 = 1.0 / _1074;
                float _1082 = _1070 * _1080;
                float _1084 = fma(_1082, _1078, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1026 = _1084;
                _1056 = true;
            }
            else
            {
                _1026 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1056 = false;
    float _1086 = _1026;
    float _1088 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1090 = _922 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1094 = _924 + _1092;
    bool _1096 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan(0.5);
    bool _1104 = _1100 || _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1108 = _916 + _1106;
    float _1110 = fma(_1090, _1086, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1112 = fma(_1094, _1086, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1114 = fma(_1108, _1086, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1116 = _1094;
    float _1118 = _1108;
    float _1120 = _1086;
    if (_1104)
    {
        _1116 = _1110;
    }
    float _1122 = _1116;
    float _1124 = _1122;
    if (_1104)
    {
        _1118 = _1114;
    }
    float _1126 = _1118;
    float _1128 = _1126;
    if (_1104)
    {
        _1120 = _1112;
    }
    float _1130 = _1120;
    float _1132 = _1130;
    if (!_1104)
    {
        float _1134 = sqrt(_1018);
        float _1136 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1140 = precise::min(_1134, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1142 = _1136 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1144 = -_464;
        float _1146 = _1144 + _1110;
        float _1148 = _1140 * _1138;
        float _1150 = _1142 * _1148;
        float _1152 = -_454;
        float _1154 = _1152 + _1114;
        float _1156 = -_470;
        float _1158 = _1156 + _1112;
        float _1160 = fma(_1146, _1150, _464);
        float _1162 = fma(_1154, _1150, _454);
        float _1164 = fma(_1158, _1150, _470);
        _1128 = _1162;
        _1124 = _1160;
        _1132 = _1164;
    }
    float _1166 = _1128;
    float _1168 = _1124;
    float _1170 = _1132;
    float _1172 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1176 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1178 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1172);
    float _1180 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1182 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1174);
    float _1184 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1176);
    float _1186 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1178);
    float _1188 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1180);
    float _1190 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1182);
    float _1192 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1184);
    float _1194 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1196 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1188);
    float _1198 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1200 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1202 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1204 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1206 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1208 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1210 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1202);
    float _1212 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1204);
    float _1214 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1206);
    float _1216 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1208);
    float _1218 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1210);
    float _1220 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1222 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1212);
    float _1224 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1214);
    float _1226 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1216);
    float _1228 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1218);
    float _1230 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1232 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1222);
    float _1234 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1224);
    float _1236 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1226);
    out.m_39.x = 1.0;
    out.m_57.w = _1230;
    out.gl_Position.x = _1232;
    out.gl_Position.y = _1228;
    out.gl_Position.z = _1234;
    out.gl_Position.w = _1236;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

