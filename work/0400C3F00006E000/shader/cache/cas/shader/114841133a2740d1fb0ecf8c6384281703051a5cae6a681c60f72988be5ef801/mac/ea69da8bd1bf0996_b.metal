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
    float4 m_53 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_34 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_43 [[attribute(6)]];
    float4 m_45 [[attribute(7)]];
    float4 m_41 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _974 = false;
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
    float _90 = _73;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _88;
    if (!_86)
    {
        out.m_39.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _92 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1233 = as_type<float>(_98);
        out.gl_Position.z = _1233;
    }
    if (!_86)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _102 = _73 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_73);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = float(_78);
    bool _114 = _82 >= _112;
    bool _116 = !_110;
    bool _118 = _114 || _116;
    float _120 = _112;
    if (_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    int _124 = as_type<int>(_122);
    if (_118)
    {
        out.m_39.x = 0.0;
    }
    if (_118)
    {
        float _126 = _122 * 5.0;
        _100 = as_type<int>(_126);
    }
    int _128 = _100;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1291 = as_type<float>(_128);
        out.gl_Position.z = _1291;
    }
    if (_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_41.x;
    float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _134 = in.m_43.x;
    int _136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _138 = _136 != 0;
    int _140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _142 = _140 != 0;
    float _144 = in.m_43.w;
    int _146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _148 = _146 != 0;
    float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _154 = _152 != 0;
    float _156 = in.m_41.y;
    int _158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _160 = _158 != 0;
    int _162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _164 = _162 != 0;
    float _166 = in.m_43.y;
    float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _170 = in.m_43.z;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _174 = _168;
    float _176 = _130;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_138)
    {
        float _180 = -_130;
        float _182 = _180 + 1.0;
        _124 = as_type<int>(_182);
    }
    int _184 = _124;
    if (!_138)
    {
        _90 = _130;
    }
    float _186 = _90;
    int _188 = 0;
    float _190 = _186;
    if (_142)
    {
        float _192 = -_130;
        float _194 = _192 + 1.0;
        _188 = as_type<int>(_194);
    }
    int _196 = _188;
    float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _200 = false;
    if (_138)
    {
        bool _202 = _134 > 0.5;
        _200 = _202;
    }
    bool _204 = _200;
    float _206 = _134 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _208 = in.m_45.w;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_138)
    {
        float _212 = _204 ? as_type<float>(_184) : _130;
        _190 = _212;
    }
    float _214 = _190;
    out.m_47.x = _130;
    bool _216 = _144 > 0.5;
    float _218 = -_156;
    float _220 = _218 + 1.0;
    out.m_47.y = _156;
    float _222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _224 = _166 > 0.5;
    float _226 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _230 = _198 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _232 = _224 ? as_type<int>(_220) : as_type<int>(_156);
    float _234 = fma(_226, -2.0, _172);
    int _236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _238 = _236 != 0;
    float _240 = -_228;
    float _242 = fma(_206, 2.0, _240);
    float _244 = _148 ? as_type<float>(_232) : _156;
    float _246 = _132 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _248 = _170 > 0.5;
    float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _252 = _228;
    float _254 = _156;
    float _256 = _170;
    if (!_142)
    {
        _252 = _130;
    }
    float _258 = _252;
    float _260 = _150 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _262 = _258;
    if (_142)
    {
        float _264 = _248 ? as_type<float>(_196) : _130;
        _262 = _264;
    }
    float _266 = _262;
    float _268 = fma(_246, _214, -0.5);
    float _270 = _168 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _272 = fma(_260, _244, -0.5);
    int _274 = _248 ? as_type<int>(_220) : as_type<int>(_156);
    float _276 = fma(_270, _266, -0.5);
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _282 = _160 ? as_type<float>(_274) : _156;
    float _284 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[76].y, _234);
    float _286 = _268;
    if (_164)
    {
        float _288 = _216 ? _220 : _156;
        _254 = _288;
    }
    float _290 = _254;
    float _292 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _280);
    bool _294 = _166 > 0.5;
    bool _296 = _294 && _154;
    float _298 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[78].z, _278);
    float _300 = _250 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _302 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[77].w, _292);
    float _304 = -_82;
    float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[76].x, _242);
    float _308 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[77].z, _298);
    float _310 = fma(_282, _300, -0.5);
    float _312 = -_284;
    float _314 = fma(_302, _272, _312);
    if (!_154)
    {
        _174 = _130;
    }
    float _316 = _174;
    float _318 = fma(_308, _268, _306);
    float _320 = in.m_34.x;
    float _322 = in.m_34.y;
    float _324 = in.m_34.z;
    float _326 = _316;
    if (_238)
    {
        _286 = _134;
    }
    float _328 = _286;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _332 = _328;
    if (_296)
    {
        float _334 = -_130;
        float _336 = _334 + 1.0;
        _176 = _336;
    }
    float _338 = _176;
    float _340 = in.m_32.x;
    float _342 = in.m_32.y;
    float _344 = in.m_32.z;
    if (!_238)
    {
        _332 = _170;
    }
    float _346 = _332;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _350 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _354 = _350 || _352;
    bool _356 = isnan(1.0);
    bool _358 = _354 || _356;
    float _360 = fma(_230, _290, -0.5);
    float _362 = 0.0;
    float _364 = _346;
    float _366 = _348;
    if (!_238)
    {
        _362 = _166;
    }
    float _368 = _362;
    float _370 = _346 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _372 = _368;
    if (_154)
    {
        _326 = _338;
    }
    float _374 = _326;
    float _376 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[88].w, _330);
    if (!_238)
    {
        _178 = _368;
    }
    float _378 = _178;
    float _380 = -_210;
    float _382 = fma(_370, 2.0, _380);
    float _384 = _378;
    if (_238)
    {
        _384 = _134;
    }
    float _386 = _384;
    float _388 = _82 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _390 = _388;
    if (_238)
    {
        _372 = _166;
    }
    float _392 = _372;
    float _394 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[83].z, _348);
    float _396 = _386 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _400 = _398;
    if (!_358)
    {
        float _402 = _388 * _388;
        float _404 = _402 * 0.5;
        _364 = _404;
    }
    float _406 = _364;
    float _408 = _406;
    if (!_238)
    {
        _366 = _170;
    }
    float _410 = _366;
    float _412 = -_398;
    float _414 = fma(_396, 2.0, _412);
    float _416 = _410;
    if (_238)
    {
        _416 = _392;
    }
    float _418 = _416;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_238)
    {
        _256 = _392;
    }
    float _422 = _256;
    if (!_358)
    {
        float _424 = _406 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _408 = _424;
    }
    float _426 = _408;
    float _428 = _426;
    if (_238)
    {
        _400 = _392;
    }
    float _430 = _400;
    bool _432 = !_358;
    float _434 = _430;
    if (!_432)
    {
        float _436 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _438 = log2(_436);
        float _440 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _442 = _440 + 1.0;
        float _444 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _446 = _388 * _438;
        float _448 = 1.0 / _442;
        float _450 = _444 * 0.693147182464599609375;
        float _452 = exp2(_446);
        float _454 = 1.0 / _450;
        float _456 = _452 + (-1.0);
        float _458 = -_456;
        float _460 = fma(_458, _454, _388);
        float _462 = _460 * _448;
        float _464 = _462 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _428 = _464;
    }
    float _466 = _428;
    bool _468 = !_358;
    if (!_468)
    {
        float _470 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _472 = log2(_470);
        float _474 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _476 = _474 + 1.0;
        float _478 = 1.0 / _476;
        float _480 = _388 * _472;
        float _482 = exp2(_480);
        float _484 = -_482;
        float _486 = _484 + 1.0;
        float _488 = _486 * _478;
        _390 = _488;
    }
    float _490 = _390;
    float _492 = _466 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _494 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[88].z, _420);
    if (!_238)
    {
        _434 = _134;
    }
    float _496 = _434;
    float _498 = _466 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _500 = fma(_490, _322, _492);
    float _502 = _466 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _504 = _222 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _506 = fma(_490, _320, _498);
    float _508 = fma(_500, _208, _342);
    float _510 = fma(_490, _324, _502);
    float _512 = fma(_504, _374, -0.5);
    float _514 = fma(_506, _208, _340);
    float _516 = _508 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _518 = _508 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _520 = fma(_510, _208, _344);
    float _522 = _508 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _524 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[5].x, _516);
    float _526 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[4].x, _518);
    float _528 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[6].x, _522);
    float _530 = fma(_520, (*spvDescriptorSet0.vp_c10)._m0[5].z, _524);
    float _532 = fma(_520, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
    float _534 = fma(_520, (*spvDescriptorSet0.vp_c10)._m0[6].z, _528);
    float _536 = _530 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _538 = _532 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _540 = _534 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _544 = _536 + _542;
    float _546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _548 = _538 + _546;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _554 = _540 + _552;
    float _556 = _544 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _562 = _418 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _564 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[28].x, _556);
    float _566 = -_82;
    float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[86].x, _382);
    float _570 = _496 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _572 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[83].w, _558);
    float _574 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[28].z, _564);
    float _576 = fma(_562, -2.0, _550);
    float _578 = fma(_570, -2.0, _560);
    float _580 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[87].w, _376);
    float _582 = _544 * _544;
    bool _584 = _574 >= 0.0;
    float _586 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[87].z, _494);
    float _588 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[82].z, _394);
    float _590 = -_82;
    float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[81].x, _414);
    float _594 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[82].w, _572);
    float _596 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[81].y, _576);
    float _598 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[86].y, _578);
    float _600 = fma(_548, _548, _582);
    float _602 = fma(_586, _512, _568);
    float _604 = -_596;
    float _606 = fma(_594, _360, _604);
    float _608 = fma(_588, _276, _592);
    float _610 = fma(_554, _554, _600);
    float _612 = -_598;
    float _614 = fma(_580, _310, _612);
    float _616 = _572;
    int _618 = as_type<int>(_554);
    if (_584)
    {
        _616 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _620 = _616;
    float _622 = rsqrt(_610);
    float _624 = _318 + 0.5;
    float _626 = _314 + 0.5;
    float _628 = _602 + 0.5;
    float _630 = _608 + 0.5;
    float _632 = _606 + 0.5;
    float _634 = _614 + 0.5;
    int _636 = as_type<int>(_620);
    if (_584)
    {
        float _638 = _620 * 5.0;
        _636 = as_type<int>(_638);
    }
    int _640 = _636;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _644 = as_type<float>(_640);
    if (_584)
    {
        out.m_39.x = 0.0;
    }
    out.m_49.x = _624;
    out.m_49.y = _626;
    out.m_49.z = _630;
    out.m_49.w = _632;
    float _646 = _544 * _622;
    float _648 = _548 * _622;
    out.m_51.x = _628;
    out.m_51.y = _634;
    if (_584)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2218 = as_type<float>(_640);
        out.gl_Position.z = _2218;
    }
    out.m_53.w = _642;
    if (_584)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _650 = -_646;
    float _652 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[18].w, _536);
    float _654 = _554 * _622;
    float _656 = -_648;
    float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[18].w, _538);
    float _660 = -_646;
    float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[18].w, _544);
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _666 = _652 + _664;
    float _668 = -_654;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _540);
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _674 = _658 + _672;
    float _676 = -_648;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _548);
    float _680 = _666 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _682 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _684 = _670 + _682;
    float _686 = _662 * _662;
    float _688 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[28].x, _680);
    float _690 = fma(_678, _678, _686);
    float _692 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[28].z, _688);
    bool _694 = _692 >= 0.0;
    float _696 = -_654;
    float _698 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[18].w, _554);
    float _700 = fma(_698, _698, _690);
    if (_694)
    {
        _644 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _702 = _644;
    if (_694)
    {
        out.m_39.x = 0.0;
    }
    if (_694)
    {
        float _704 = _702 * 5.0;
        _618 = as_type<int>(_704);
    }
    int _706 = _618;
    if (_694)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2340 = as_type<float>(_706);
        out.gl_Position.z = _2340;
    }
    if (_694)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _708 = in.m_45.x;
    float _710 = in.m_45.y;
    float _712 = in.m_45.z;
    float _714 = sqrt(_700);
    float _716 = in.m_55.x;
    float _718 = in.m_55.y;
    float _720 = in.m_55.z;
    float _722 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _724 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _722;
    float _726 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _728 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _726;
    float _730 = _724 * _724;
    float _732 = fma(_728, _728, _730);
    float _734 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _736 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _734;
    float _738 = _622 * _714;
    float _740 = fma(_736, _736, _732);
    float _742 = _710 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _744 = sqrt(_740);
    float _746 = _708 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _748 = _712 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _750 = _742 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _718);
    float _754 = _746 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _756 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _758 = _738 * _750;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _716);
    float _762 = _738 * _754;
    float _764 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _720);
    float _766 = _752 * _758;
    float _768 = _738 * _756;
    float _770 = _760 * _762;
    float _772 = _766 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _774 = _766 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _776 = fma(_744, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _778 = _764 * _768;
    float _780 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[24].x, _772);
    float _782 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[26].x, _774);
    float _784 = precise::max(_776, 1.0);
    float _786 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[24].z, _780);
    float _788 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[26].z, _782);
    float _790 = precise::min(_784, 1.89999997615814208984375);
    float _792 = _786 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _794 = _788 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _796 = fma(_792, _790, _538);
    float _798 = fma(_794, _790, _540);
    float _800 = _766 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _802 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _804 = _796 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _808 = _798 + _806;
    float _810 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[25].x, _800);
    float _812 = _804 * _804;
    float _814 = _808 * _808;
    float _816 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[25].z, _810);
    float _818 = _812 + _814;
    float _820 = _816 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _822 = sqrt(_818);
    float _824 = fma(_820, _790, _536);
    bool _826 = _822 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _828 = _790;
    float _830 = _766;
    float _832 = _820;
    float _834 = _816;
    float _836 = _796;
    if (!_826)
    {
        _828 = _796;
    }
    float _838 = _828;
    float _840 = _838;
    if (!_826)
    {
        _830 = _814;
    }
    float _842 = _830;
    float _844 = _842;
    if (!_826)
    {
        _832 = _812;
    }
    float _846 = _832;
    float _848 = _846;
    if (!_826)
    {
        _834 = _798;
    }
    float _850 = _834;
    float _852 = _850;
    if (!_826)
    {
        _836 = _824;
    }
    float _854 = _836;
    bool _856 = !_826;
    float _858 = _854;
    if (!_856)
    {
        float _860 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _862 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _864 = _822 + _862;
        float _866 = rsqrt(_818);
        float _868 = _864 * _860;
        float _870 = _824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _872 = _868 * 0.15915493667125701904296875;
        float _874 = _872 * 6.283185482025146484375;
        float _876 = sin(_874);
        float _878 = _872 * 6.283185482025146484375;
        float _880 = cos(_878);
        float _882 = fma(_876, _870, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _884 = _866 * _882;
        float _886 = _880 + (-1.0);
        float _888 = fma(_804, _884, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _890 = fma(_808, _884, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _892 = _886 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _894 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _896 = _888 + _894;
        float _898 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _900 = _890 + _898;
        float _902 = fma(_824, _880, _892);
        float _904 = _896 * _896;
        float _906 = _900 * _900;
        _858 = _902;
        _848 = _904;
        _844 = _906;
        _840 = _888;
        _852 = _890;
    }
    float _908 = _858;
    float _910 = _848;
    float _912 = _844;
    float _914 = _840;
    float _916 = _852;
    float _918 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _920 = _908 + _918;
    out.m_53.w = _642;
    float _922 = fma(_920, _920, _910);
    float _924 = _922 + _912;
    float _926 = sqrt(_924);
    bool _928 = _926 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _930 = isnan(_926);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _936 = _932 || _934;
    float _938 = _922;
    if (!_936)
    {
        _938 = 1.0;
    }
    float _940 = _938;
    bool _942 = !_936;
    float _944 = _940;
    if (!_942)
    {
        bool _946 = _926 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _948 = isnan(_926);
        bool _950 = _946 || _948;
        bool _952 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _954 = _950 || _952;
        if (!_954)
        {
            float _956 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _958 = _926 + _956;
            float _960 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _962 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _960;
            float _964 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _966 = _964 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _968 = 1.0 / _962;
            float _970 = _958 * _968;
            float _972 = fma(_970, _966, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _944 = _972;
            _974 = true;
        }
        else
        {
            bool _976 = _926 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _978 = isnan(_926);
            bool _980 = _976 || _978;
            bool _982 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _984 = _980 || _982;
            if (!_984)
            {
                float _986 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _988 = _926 + _986;
                float _990 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _992 = _990 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _994 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _996 = _994 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _998 = 1.0 / _992;
                float _1000 = _988 * _998;
                float _1002 = fma(_1000, _996, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _944 = _1002;
                _974 = true;
            }
            else
            {
                _944 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _974 = false;
    float _1004 = _944;
    float _1006 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1008 = _914 + _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1012 = _916 + _1010;
    bool _1014 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan(0.5);
    bool _1022 = _1018 || _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1026 = _908 + _1024;
    float _1028 = fma(_1008, _1004, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1030 = fma(_1012, _1004, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1032 = fma(_1026, _1004, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1034 = -_648;
    float _1036 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1028);
    float _1038 = -_654;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1030);
    float _1042 = -_646;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1032);
    float _1046 = _1044;
    float _1048 = _1036;
    float _1050 = _1040;
    if (!_1022)
    {
        float _1052 = _666 * _666;
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1056 = -_540;
        float _1058 = _1056 + _1030;
        float _1060 = fma(_674, _674, _1052);
        float _1062 = fma(_684, _684, _1060);
        float _1064 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1066 = sqrt(_1062);
        float _1068 = 1.0 / _738;
        float _1070 = precise::min(_1066, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1072 = _1070 * _1054;
        float _1074 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1076 = _1072 * _1068;
        float _1078 = -_538;
        float _1080 = _1078 + _1028;
        float _1082 = -_536;
        float _1084 = _1082 + _1032;
        float _1086 = _1074 * _1076;
        float _1088 = _1058 * _1076;
        float _1090 = fma(_1080, _1086, _658);
        float _1092 = fma(_1084, _1086, _652);
        float _1094 = fma(_1074, _1088, _670);
        _1046 = _1092;
        _1048 = _1090;
        _1050 = _1094;
    }
    float _1096 = _1046;
    float _1098 = _1048;
    float _1100 = _1050;
    float _1102 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1104 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1106 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1108 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1110 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1102);
    float _1112 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1104);
    float _1114 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1106);
    float _1116 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1108);
    float _1118 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1110);
    float _1120 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1112);
    float _1122 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1114);
    float _1124 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1116);
    float _1126 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1128 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1130 = _1122 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1132 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1134 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1136 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1138 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1140 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1142 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1134);
    float _1144 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1136);
    float _1146 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1138);
    float _1148 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1140);
    float _1150 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1142);
    float _1152 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1144);
    float _1154 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1146);
    float _1156 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1148);
    float _1158 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1160 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1150);
    float _1162 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1152);
    float _1164 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1154);
    float _1166 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1156);
    out.m_39.x = 1.0;
    out.m_57.w = _1158;
    out.gl_Position.x = _1160;
    out.gl_Position.y = _1162;
    out.gl_Position.z = _1164;
    out.gl_Position.w = _1166;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _974 = false;
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
    float _90 = _73;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _88;
    if (!_86)
    {
        out.m_39.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _92 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1233 = as_type<float>(_98);
        out.gl_Position.z = _1233;
    }
    if (!_86)
    {
        return out;
    }
    bool _102 = _73 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_73);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = float(_78);
    bool _114 = _82 >= _112;
    bool _116 = !_110;
    bool _118 = _114 || _116;
    float _120 = _112;
    if (_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    int _124 = as_type<int>(_122);
    if (_118)
    {
        out.m_39.x = 0.0;
    }
    if (_118)
    {
        float _126 = _122 * 5.0;
        _100 = as_type<int>(_126);
    }
    int _128 = _100;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1291 = as_type<float>(_128);
        out.gl_Position.z = _1291;
    }
    if (_118)
    {
        return out;
    }
    float _130 = in.m_41.x;
    float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _134 = in.m_43.x;
    int _136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _138 = _136 != 0;
    int _140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _142 = _140 != 0;
    float _144 = in.m_43.w;
    int _146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _148 = _146 != 0;
    float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _154 = _152 != 0;
    float _156 = in.m_41.y;
    int _158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _160 = _158 != 0;
    int _162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _164 = _162 != 0;
    float _166 = in.m_43.y;
    float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _170 = in.m_43.z;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _174 = _168;
    float _176 = _130;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_138)
    {
        float _180 = -_130;
        float _182 = _180 + 1.0;
        _124 = as_type<int>(_182);
    }
    int _184 = _124;
    if (!_138)
    {
        _90 = _130;
    }
    float _186 = _90;
    int _188 = 0;
    float _190 = _186;
    if (_142)
    {
        float _192 = -_130;
        float _194 = _192 + 1.0;
        _188 = as_type<int>(_194);
    }
    int _196 = _188;
    float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _200 = false;
    if (_138)
    {
        bool _202 = _134 > 0.5;
        _200 = _202;
    }
    bool _204 = _200;
    float _206 = _134 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _208 = in.m_45.w;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_138)
    {
        float _212 = _204 ? as_type<float>(_184) : _130;
        _190 = _212;
    }
    float _214 = _190;
    out.m_47.x = _130;
    bool _216 = _144 > 0.5;
    float _218 = -_156;
    float _220 = _218 + 1.0;
    out.m_47.y = _156;
    float _222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _224 = _166 > 0.5;
    float _226 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _230 = _198 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _232 = _224 ? as_type<int>(_220) : as_type<int>(_156);
    float _234 = fma(_226, -2.0, _172);
    int _236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _238 = _236 != 0;
    float _240 = -_228;
    float _242 = fma(_206, 2.0, _240);
    float _244 = _148 ? as_type<float>(_232) : _156;
    float _246 = _132 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _248 = _170 > 0.5;
    float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _252 = _228;
    float _254 = _156;
    float _256 = _170;
    if (!_142)
    {
        _252 = _130;
    }
    float _258 = _252;
    float _260 = _150 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _262 = _258;
    if (_142)
    {
        float _264 = _248 ? as_type<float>(_196) : _130;
        _262 = _264;
    }
    float _266 = _262;
    float _268 = fma(_246, _214, -0.5);
    float _270 = _168 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _272 = fma(_260, _244, -0.5);
    int _274 = _248 ? as_type<int>(_220) : as_type<int>(_156);
    float _276 = fma(_270, _266, -0.5);
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _282 = _160 ? as_type<float>(_274) : _156;
    float _284 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[76].y, _234);
    float _286 = _268;
    if (_164)
    {
        float _288 = _216 ? _220 : _156;
        _254 = _288;
    }
    float _290 = _254;
    float _292 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _280);
    bool _294 = _166 > 0.5;
    bool _296 = _294 && _154;
    float _298 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[78].z, _278);
    float _300 = _250 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _302 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[77].w, _292);
    float _304 = -_82;
    float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[76].x, _242);
    float _308 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[77].z, _298);
    float _310 = fma(_282, _300, -0.5);
    float _312 = -_284;
    float _314 = fma(_302, _272, _312);
    if (!_154)
    {
        _174 = _130;
    }
    float _316 = _174;
    float _318 = fma(_308, _268, _306);
    float _320 = in.m_34.x;
    float _322 = in.m_34.y;
    float _324 = in.m_34.z;
    float _326 = _316;
    if (_238)
    {
        _286 = _134;
    }
    float _328 = _286;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _332 = _328;
    if (_296)
    {
        float _334 = -_130;
        float _336 = _334 + 1.0;
        _176 = _336;
    }
    float _338 = _176;
    float _340 = in.m_32.x;
    float _342 = in.m_32.y;
    float _344 = in.m_32.z;
    if (!_238)
    {
        _332 = _170;
    }
    float _346 = _332;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _350 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _354 = _350 || _352;
    bool _356 = isnan(1.0);
    bool _358 = _354 || _356;
    float _360 = fma(_230, _290, -0.5);
    float _362 = 0.0;
    float _364 = _346;
    float _366 = _348;
    if (!_238)
    {
        _362 = _166;
    }
    float _368 = _362;
    float _370 = _346 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _372 = _368;
    if (_154)
    {
        _326 = _338;
    }
    float _374 = _326;
    float _376 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[88].w, _330);
    if (!_238)
    {
        _178 = _368;
    }
    float _378 = _178;
    float _380 = -_210;
    float _382 = fma(_370, 2.0, _380);
    float _384 = _378;
    if (_238)
    {
        _384 = _134;
    }
    float _386 = _384;
    float _388 = _82 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _390 = _388;
    if (_238)
    {
        _372 = _166;
    }
    float _392 = _372;
    float _394 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[83].z, _348);
    float _396 = _386 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _400 = _398;
    if (!_358)
    {
        float _402 = _388 * _388;
        float _404 = _402 * 0.5;
        _364 = _404;
    }
    float _406 = _364;
    float _408 = _406;
    if (!_238)
    {
        _366 = _170;
    }
    float _410 = _366;
    float _412 = -_398;
    float _414 = fma(_396, 2.0, _412);
    float _416 = _410;
    if (_238)
    {
        _416 = _392;
    }
    float _418 = _416;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_238)
    {
        _256 = _392;
    }
    float _422 = _256;
    if (!_358)
    {
        float _424 = _406 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _408 = _424;
    }
    float _426 = _408;
    float _428 = _426;
    if (_238)
    {
        _400 = _392;
    }
    float _430 = _400;
    bool _432 = !_358;
    float _434 = _430;
    if (!_432)
    {
        float _436 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _438 = log2(_436);
        float _440 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _442 = _440 + 1.0;
        float _444 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _446 = _388 * _438;
        float _448 = 1.0 / _442;
        float _450 = _444 * 0.693147182464599609375;
        float _452 = exp2(_446);
        float _454 = 1.0 / _450;
        float _456 = _452 + (-1.0);
        float _458 = -_456;
        float _460 = fma(_458, _454, _388);
        float _462 = _460 * _448;
        float _464 = _462 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _428 = _464;
    }
    float _466 = _428;
    bool _468 = !_358;
    if (!_468)
    {
        float _470 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _472 = log2(_470);
        float _474 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _476 = _474 + 1.0;
        float _478 = 1.0 / _476;
        float _480 = _388 * _472;
        float _482 = exp2(_480);
        float _484 = -_482;
        float _486 = _484 + 1.0;
        float _488 = _486 * _478;
        _390 = _488;
    }
    float _490 = _390;
    float _492 = _466 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _494 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[88].z, _420);
    if (!_238)
    {
        _434 = _134;
    }
    float _496 = _434;
    float _498 = _466 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _500 = fma(_490, _322, _492);
    float _502 = _466 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _504 = _222 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _506 = fma(_490, _320, _498);
    float _508 = fma(_500, _208, _342);
    float _510 = fma(_490, _324, _502);
    float _512 = fma(_504, _374, -0.5);
    float _514 = fma(_506, _208, _340);
    float _516 = _508 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _518 = _508 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _520 = fma(_510, _208, _344);
    float _522 = _508 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _524 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[5].x, _516);
    float _526 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[4].x, _518);
    float _528 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[6].x, _522);
    float _530 = fma(_520, (*spvDescriptorSet0.vp_c10)._m0[5].z, _524);
    float _532 = fma(_520, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
    float _534 = fma(_520, (*spvDescriptorSet0.vp_c10)._m0[6].z, _528);
    float _536 = _530 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _538 = _532 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _540 = _534 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _544 = _536 + _542;
    float _546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _548 = _538 + _546;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _554 = _540 + _552;
    float _556 = _544 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _562 = _418 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _564 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[28].x, _556);
    float _566 = -_82;
    float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[86].x, _382);
    float _570 = _496 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _572 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[83].w, _558);
    float _574 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[28].z, _564);
    float _576 = fma(_562, -2.0, _550);
    float _578 = fma(_570, -2.0, _560);
    float _580 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[87].w, _376);
    float _582 = _544 * _544;
    bool _584 = _574 >= 0.0;
    float _586 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[87].z, _494);
    float _588 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[82].z, _394);
    float _590 = -_82;
    float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[81].x, _414);
    float _594 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[82].w, _572);
    float _596 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[81].y, _576);
    float _598 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[86].y, _578);
    float _600 = fma(_548, _548, _582);
    float _602 = fma(_586, _512, _568);
    float _604 = -_596;
    float _606 = fma(_594, _360, _604);
    float _608 = fma(_588, _276, _592);
    float _610 = fma(_554, _554, _600);
    float _612 = -_598;
    float _614 = fma(_580, _310, _612);
    float _616 = _572;
    int _618 = as_type<int>(_554);
    if (_584)
    {
        _616 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _620 = _616;
    float _622 = rsqrt(_610);
    float _624 = _318 + 0.5;
    float _626 = _314 + 0.5;
    float _628 = _602 + 0.5;
    float _630 = _608 + 0.5;
    float _632 = _606 + 0.5;
    float _634 = _614 + 0.5;
    int _636 = as_type<int>(_620);
    if (_584)
    {
        float _638 = _620 * 5.0;
        _636 = as_type<int>(_638);
    }
    int _640 = _636;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _644 = as_type<float>(_640);
    if (_584)
    {
        out.m_39.x = 0.0;
    }
    out.m_49.x = _624;
    out.m_49.y = _626;
    out.m_49.z = _630;
    out.m_49.w = _632;
    float _646 = _544 * _622;
    float _648 = _548 * _622;
    out.m_51.x = _628;
    out.m_51.y = _634;
    if (_584)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2218 = as_type<float>(_640);
        out.gl_Position.z = _2218;
    }
    out.m_53.w = _642;
    if (_584)
    {
        return out;
    }
    float _650 = -_646;
    float _652 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[18].w, _536);
    float _654 = _554 * _622;
    float _656 = -_648;
    float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[18].w, _538);
    float _660 = -_646;
    float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[18].w, _544);
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _666 = _652 + _664;
    float _668 = -_654;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _540);
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _674 = _658 + _672;
    float _676 = -_648;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _548);
    float _680 = _666 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _682 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _684 = _670 + _682;
    float _686 = _662 * _662;
    float _688 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[28].x, _680);
    float _690 = fma(_678, _678, _686);
    float _692 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[28].z, _688);
    bool _694 = _692 >= 0.0;
    float _696 = -_654;
    float _698 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[18].w, _554);
    float _700 = fma(_698, _698, _690);
    if (_694)
    {
        _644 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _702 = _644;
    if (_694)
    {
        out.m_39.x = 0.0;
    }
    if (_694)
    {
        float _704 = _702 * 5.0;
        _618 = as_type<int>(_704);
    }
    int _706 = _618;
    if (_694)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2340 = as_type<float>(_706);
        out.gl_Position.z = _2340;
    }
    if (_694)
    {
        return out;
    }
    float _708 = in.m_45.x;
    float _710 = in.m_45.y;
    float _712 = in.m_45.z;
    float _714 = sqrt(_700);
    float _716 = in.m_55.x;
    float _718 = in.m_55.y;
    float _720 = in.m_55.z;
    float _722 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _724 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _722;
    float _726 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _728 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _726;
    float _730 = _724 * _724;
    float _732 = fma(_728, _728, _730);
    float _734 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _736 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _734;
    float _738 = _622 * _714;
    float _740 = fma(_736, _736, _732);
    float _742 = _710 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _744 = sqrt(_740);
    float _746 = _708 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _748 = _712 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _750 = _742 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _718);
    float _754 = _746 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _756 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _758 = _738 * _750;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _716);
    float _762 = _738 * _754;
    float _764 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _720);
    float _766 = _752 * _758;
    float _768 = _738 * _756;
    float _770 = _760 * _762;
    float _772 = _766 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _774 = _766 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _776 = fma(_744, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _778 = _764 * _768;
    float _780 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[24].x, _772);
    float _782 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[26].x, _774);
    float _784 = precise::max(_776, 1.0);
    float _786 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[24].z, _780);
    float _788 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[26].z, _782);
    float _790 = precise::min(_784, 1.89999997615814208984375);
    float _792 = _786 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _794 = _788 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _796 = fma(_792, _790, _538);
    float _798 = fma(_794, _790, _540);
    float _800 = _766 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _802 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _804 = _796 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _808 = _798 + _806;
    float _810 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[25].x, _800);
    float _812 = _804 * _804;
    float _814 = _808 * _808;
    float _816 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[25].z, _810);
    float _818 = _812 + _814;
    float _820 = _816 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _822 = sqrt(_818);
    float _824 = fma(_820, _790, _536);
    bool _826 = _822 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _828 = _790;
    float _830 = _766;
    float _832 = _820;
    float _834 = _816;
    float _836 = _796;
    if (!_826)
    {
        _828 = _796;
    }
    float _838 = _828;
    float _840 = _838;
    if (!_826)
    {
        _830 = _814;
    }
    float _842 = _830;
    float _844 = _842;
    if (!_826)
    {
        _832 = _812;
    }
    float _846 = _832;
    float _848 = _846;
    if (!_826)
    {
        _834 = _798;
    }
    float _850 = _834;
    float _852 = _850;
    if (!_826)
    {
        _836 = _824;
    }
    float _854 = _836;
    bool _856 = !_826;
    float _858 = _854;
    if (!_856)
    {
        float _860 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _862 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _864 = _822 + _862;
        float _866 = rsqrt(_818);
        float _868 = _864 * _860;
        float _870 = _824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _872 = _868 * 0.15915493667125701904296875;
        float _874 = _872 * 6.283185482025146484375;
        float _876 = sin(_874);
        float _878 = _872 * 6.283185482025146484375;
        float _880 = cos(_878);
        float _882 = fma(_876, _870, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _884 = _866 * _882;
        float _886 = _880 + (-1.0);
        float _888 = fma(_804, _884, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _890 = fma(_808, _884, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _892 = _886 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _894 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _896 = _888 + _894;
        float _898 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _900 = _890 + _898;
        float _902 = fma(_824, _880, _892);
        float _904 = _896 * _896;
        float _906 = _900 * _900;
        _858 = _902;
        _848 = _904;
        _844 = _906;
        _840 = _888;
        _852 = _890;
    }
    float _908 = _858;
    float _910 = _848;
    float _912 = _844;
    float _914 = _840;
    float _916 = _852;
    float _918 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _920 = _908 + _918;
    out.m_53.w = _642;
    float _922 = fma(_920, _920, _910);
    float _924 = _922 + _912;
    float _926 = sqrt(_924);
    bool _928 = _926 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _930 = isnan(_926);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _936 = _932 || _934;
    float _938 = _922;
    if (!_936)
    {
        _938 = 1.0;
    }
    float _940 = _938;
    bool _942 = !_936;
    float _944 = _940;
    if (!_942)
    {
        bool _946 = _926 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _948 = isnan(_926);
        bool _950 = _946 || _948;
        bool _952 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _954 = _950 || _952;
        if (!_954)
        {
            float _956 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _958 = _926 + _956;
            float _960 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _962 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _960;
            float _964 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _966 = _964 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _968 = 1.0 / _962;
            float _970 = _958 * _968;
            float _972 = fma(_970, _966, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _944 = _972;
            _974 = true;
        }
        else
        {
            bool _976 = _926 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _978 = isnan(_926);
            bool _980 = _976 || _978;
            bool _982 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _984 = _980 || _982;
            if (!_984)
            {
                float _986 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _988 = _926 + _986;
                float _990 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _992 = _990 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _994 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _996 = _994 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _998 = 1.0 / _992;
                float _1000 = _988 * _998;
                float _1002 = fma(_1000, _996, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _944 = _1002;
                _974 = true;
            }
            else
            {
                _944 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _974 = false;
    float _1004 = _944;
    float _1006 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1008 = _914 + _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1012 = _916 + _1010;
    bool _1014 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan(0.5);
    bool _1022 = _1018 || _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1026 = _908 + _1024;
    float _1028 = fma(_1008, _1004, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1030 = fma(_1012, _1004, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1032 = fma(_1026, _1004, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1034 = -_648;
    float _1036 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1028);
    float _1038 = -_654;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1030);
    float _1042 = -_646;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1032);
    float _1046 = _1044;
    float _1048 = _1036;
    float _1050 = _1040;
    if (!_1022)
    {
        float _1052 = _666 * _666;
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1056 = -_540;
        float _1058 = _1056 + _1030;
        float _1060 = fma(_674, _674, _1052);
        float _1062 = fma(_684, _684, _1060);
        float _1064 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1066 = sqrt(_1062);
        float _1068 = 1.0 / _738;
        float _1070 = precise::min(_1066, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1072 = _1070 * _1054;
        float _1074 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1076 = _1072 * _1068;
        float _1078 = -_538;
        float _1080 = _1078 + _1028;
        float _1082 = -_536;
        float _1084 = _1082 + _1032;
        float _1086 = _1074 * _1076;
        float _1088 = _1058 * _1076;
        float _1090 = fma(_1080, _1086, _658);
        float _1092 = fma(_1084, _1086, _652);
        float _1094 = fma(_1074, _1088, _670);
        _1046 = _1092;
        _1048 = _1090;
        _1050 = _1094;
    }
    float _1096 = _1046;
    float _1098 = _1048;
    float _1100 = _1050;
    float _1102 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1104 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1106 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1108 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1110 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1102);
    float _1112 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1104);
    float _1114 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1106);
    float _1116 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1108);
    float _1118 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1110);
    float _1120 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1112);
    float _1122 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1114);
    float _1124 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1116);
    float _1126 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1128 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1130 = _1122 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1132 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1134 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1136 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1138 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1140 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1142 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1134);
    float _1144 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1136);
    float _1146 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1138);
    float _1148 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1140);
    float _1150 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1142);
    float _1152 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1144);
    float _1154 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1146);
    float _1156 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1148);
    float _1158 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1160 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1150);
    float _1162 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1152);
    float _1164 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1154);
    float _1166 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1156);
    out.m_39.x = 1.0;
    out.m_57.w = _1158;
    out.gl_Position.x = _1160;
    out.gl_Position.y = _1162;
    out.gl_Position.z = _1164;
    out.gl_Position.w = _1166;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _974 = false;
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
    float _90 = _73;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _88;
    if (!_86)
    {
        out.m_39.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _92 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1233 = as_type<float>(_98);
        out.gl_Position.z = _1233;
    }
    if (!_86)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _102 = _73 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_73);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = float(_78);
    bool _114 = _82 >= _112;
    bool _116 = !_110;
    bool _118 = _114 || _116;
    float _120 = _112;
    if (_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    int _124 = as_type<int>(_122);
    if (_118)
    {
        out.m_39.x = 0.0;
    }
    if (_118)
    {
        float _126 = _122 * 5.0;
        _100 = as_type<int>(_126);
    }
    int _128 = _100;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1291 = as_type<float>(_128);
        out.gl_Position.z = _1291;
    }
    if (_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_41.x;
    float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _134 = in.m_43.x;
    int _136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _138 = _136 != 0;
    int _140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _142 = _140 != 0;
    float _144 = in.m_43.w;
    int _146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _148 = _146 != 0;
    float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _154 = _152 != 0;
    float _156 = in.m_41.y;
    int _158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _160 = _158 != 0;
    int _162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _164 = _162 != 0;
    float _166 = in.m_43.y;
    float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _170 = in.m_43.z;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _174 = _168;
    float _176 = _130;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (_138)
    {
        float _180 = -_130;
        float _182 = _180 + 1.0;
        _124 = as_type<int>(_182);
    }
    int _184 = _124;
    if (!_138)
    {
        _90 = _130;
    }
    float _186 = _90;
    int _188 = 0;
    float _190 = _186;
    if (_142)
    {
        float _192 = -_130;
        float _194 = _192 + 1.0;
        _188 = as_type<int>(_194);
    }
    int _196 = _188;
    float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _200 = false;
    if (_138)
    {
        bool _202 = _134 > 0.5;
        _200 = _202;
    }
    bool _204 = _200;
    float _206 = _134 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _208 = in.m_45.w;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_138)
    {
        float _212 = _204 ? as_type<float>(_184) : _130;
        _190 = _212;
    }
    float _214 = _190;
    out.m_47.x = _130;
    bool _216 = _144 > 0.5;
    float _218 = -_156;
    float _220 = _218 + 1.0;
    out.m_47.y = _156;
    float _222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _224 = _166 > 0.5;
    float _226 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _230 = _198 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _232 = _224 ? as_type<int>(_220) : as_type<int>(_156);
    float _234 = fma(_226, -2.0, _172);
    int _236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _238 = _236 != 0;
    float _240 = -_228;
    float _242 = fma(_206, 2.0, _240);
    float _244 = _148 ? as_type<float>(_232) : _156;
    float _246 = _132 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _248 = _170 > 0.5;
    float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _252 = _228;
    float _254 = _156;
    float _256 = _170;
    if (!_142)
    {
        _252 = _130;
    }
    float _258 = _252;
    float _260 = _150 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _262 = _258;
    if (_142)
    {
        float _264 = _248 ? as_type<float>(_196) : _130;
        _262 = _264;
    }
    float _266 = _262;
    float _268 = fma(_246, _214, -0.5);
    float _270 = _168 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _272 = fma(_260, _244, -0.5);
    int _274 = _248 ? as_type<int>(_220) : as_type<int>(_156);
    float _276 = fma(_270, _266, -0.5);
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _282 = _160 ? as_type<float>(_274) : _156;
    float _284 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[76].y, _234);
    float _286 = _268;
    if (_164)
    {
        float _288 = _216 ? _220 : _156;
        _254 = _288;
    }
    float _290 = _254;
    float _292 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _280);
    bool _294 = _166 > 0.5;
    bool _296 = _294 && _154;
    float _298 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[78].z, _278);
    float _300 = _250 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _302 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[77].w, _292);
    float _304 = -_82;
    float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[76].x, _242);
    float _308 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[77].z, _298);
    float _310 = fma(_282, _300, -0.5);
    float _312 = -_284;
    float _314 = fma(_302, _272, _312);
    if (!_154)
    {
        _174 = _130;
    }
    float _316 = _174;
    float _318 = fma(_308, _268, _306);
    float _320 = in.m_34.x;
    float _322 = in.m_34.y;
    float _324 = in.m_34.z;
    float _326 = _316;
    if (_238)
    {
        _286 = _134;
    }
    float _328 = _286;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _332 = _328;
    if (_296)
    {
        float _334 = -_130;
        float _336 = _334 + 1.0;
        _176 = _336;
    }
    float _338 = _176;
    float _340 = in.m_32.x;
    float _342 = in.m_32.y;
    float _344 = in.m_32.z;
    if (!_238)
    {
        _332 = _170;
    }
    float _346 = _332;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _350 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _354 = _350 || _352;
    bool _356 = isnan(1.0);
    bool _358 = _354 || _356;
    float _360 = fma(_230, _290, -0.5);
    float _362 = 0.0;
    float _364 = _346;
    float _366 = _348;
    if (!_238)
    {
        _362 = _166;
    }
    float _368 = _362;
    float _370 = _346 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _372 = _368;
    if (_154)
    {
        _326 = _338;
    }
    float _374 = _326;
    float _376 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[88].w, _330);
    if (!_238)
    {
        _178 = _368;
    }
    float _378 = _178;
    float _380 = -_210;
    float _382 = fma(_370, 2.0, _380);
    float _384 = _378;
    if (_238)
    {
        _384 = _134;
    }
    float _386 = _384;
    float _388 = _82 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _390 = _388;
    if (_238)
    {
        _372 = _166;
    }
    float _392 = _372;
    float _394 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[83].z, _348);
    float _396 = _386 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _400 = _398;
    if (!_358)
    {
        float _402 = _388 * _388;
        float _404 = _402 * 0.5;
        _364 = _404;
    }
    float _406 = _364;
    float _408 = _406;
    if (!_238)
    {
        _366 = _170;
    }
    float _410 = _366;
    float _412 = -_398;
    float _414 = fma(_396, 2.0, _412);
    float _416 = _410;
    if (_238)
    {
        _416 = _392;
    }
    float _418 = _416;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_238)
    {
        _256 = _392;
    }
    float _422 = _256;
    if (!_358)
    {
        float _424 = _406 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _408 = _424;
    }
    float _426 = _408;
    float _428 = _426;
    if (_238)
    {
        _400 = _392;
    }
    float _430 = _400;
    bool _432 = !_358;
    float _434 = _430;
    if (!_432)
    {
        float _436 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _438 = log2(_436);
        float _440 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _442 = _440 + 1.0;
        float _444 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _446 = _388 * _438;
        float _448 = 1.0 / _442;
        float _450 = _444 * 0.693147182464599609375;
        float _452 = exp2(_446);
        float _454 = 1.0 / _450;
        float _456 = _452 + (-1.0);
        float _458 = -_456;
        float _460 = fma(_458, _454, _388);
        float _462 = _460 * _448;
        float _464 = _462 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _428 = _464;
    }
    float _466 = _428;
    bool _468 = !_358;
    if (!_468)
    {
        float _470 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _472 = log2(_470);
        float _474 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _476 = _474 + 1.0;
        float _478 = 1.0 / _476;
        float _480 = _388 * _472;
        float _482 = exp2(_480);
        float _484 = -_482;
        float _486 = _484 + 1.0;
        float _488 = _486 * _478;
        _390 = _488;
    }
    float _490 = _390;
    float _492 = _466 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _494 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[88].z, _420);
    if (!_238)
    {
        _434 = _134;
    }
    float _496 = _434;
    float _498 = _466 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _500 = fma(_490, _322, _492);
    float _502 = _466 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _504 = _222 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _506 = fma(_490, _320, _498);
    float _508 = fma(_500, _208, _342);
    float _510 = fma(_490, _324, _502);
    float _512 = fma(_504, _374, -0.5);
    float _514 = fma(_506, _208, _340);
    float _516 = _508 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _518 = _508 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _520 = fma(_510, _208, _344);
    float _522 = _508 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _524 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[5].x, _516);
    float _526 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[4].x, _518);
    float _528 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[6].x, _522);
    float _530 = fma(_520, (*spvDescriptorSet0.vp_c10)._m0[5].z, _524);
    float _532 = fma(_520, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
    float _534 = fma(_520, (*spvDescriptorSet0.vp_c10)._m0[6].z, _528);
    float _536 = _530 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _538 = _532 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _540 = _534 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _544 = _536 + _542;
    float _546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _548 = _538 + _546;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _554 = _540 + _552;
    float _556 = _544 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _562 = _418 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _564 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[28].x, _556);
    float _566 = -_82;
    float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[86].x, _382);
    float _570 = _496 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _572 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[83].w, _558);
    float _574 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[28].z, _564);
    float _576 = fma(_562, -2.0, _550);
    float _578 = fma(_570, -2.0, _560);
    float _580 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[87].w, _376);
    float _582 = _544 * _544;
    bool _584 = _574 >= 0.0;
    float _586 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[87].z, _494);
    float _588 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[82].z, _394);
    float _590 = -_82;
    float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[81].x, _414);
    float _594 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[82].w, _572);
    float _596 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[81].y, _576);
    float _598 = fma(_82, (*spvDescriptorSet0.vp_c9)._m0[86].y, _578);
    float _600 = fma(_548, _548, _582);
    float _602 = fma(_586, _512, _568);
    float _604 = -_596;
    float _606 = fma(_594, _360, _604);
    float _608 = fma(_588, _276, _592);
    float _610 = fma(_554, _554, _600);
    float _612 = -_598;
    float _614 = fma(_580, _310, _612);
    float _616 = _572;
    int _618 = as_type<int>(_554);
    if (_584)
    {
        _616 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _620 = _616;
    float _622 = rsqrt(_610);
    float _624 = _318 + 0.5;
    float _626 = _314 + 0.5;
    float _628 = _602 + 0.5;
    float _630 = _608 + 0.5;
    float _632 = _606 + 0.5;
    float _634 = _614 + 0.5;
    int _636 = as_type<int>(_620);
    if (_584)
    {
        float _638 = _620 * 5.0;
        _636 = as_type<int>(_638);
    }
    int _640 = _636;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _644 = as_type<float>(_640);
    if (_584)
    {
        out.m_39.x = 0.0;
    }
    out.m_49.x = _624;
    out.m_49.y = _626;
    out.m_49.z = _630;
    out.m_49.w = _632;
    float _646 = _544 * _622;
    float _648 = _548 * _622;
    out.m_51.x = _628;
    out.m_51.y = _634;
    if (_584)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2218 = as_type<float>(_640);
        out.gl_Position.z = _2218;
    }
    out.m_53.w = _642;
    if (_584)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _650 = -_646;
    float _652 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[18].w, _536);
    float _654 = _554 * _622;
    float _656 = -_648;
    float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[18].w, _538);
    float _660 = -_646;
    float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[18].w, _544);
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _666 = _652 + _664;
    float _668 = -_654;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _540);
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _674 = _658 + _672;
    float _676 = -_648;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _548);
    float _680 = _666 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _682 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _684 = _670 + _682;
    float _686 = _662 * _662;
    float _688 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[28].x, _680);
    float _690 = fma(_678, _678, _686);
    float _692 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[28].z, _688);
    bool _694 = _692 >= 0.0;
    float _696 = -_654;
    float _698 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[18].w, _554);
    float _700 = fma(_698, _698, _690);
    if (_694)
    {
        _644 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _702 = _644;
    if (_694)
    {
        out.m_39.x = 0.0;
    }
    if (_694)
    {
        float _704 = _702 * 5.0;
        _618 = as_type<int>(_704);
    }
    int _706 = _618;
    if (_694)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2340 = as_type<float>(_706);
        out.gl_Position.z = _2340;
    }
    if (_694)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _708 = in.m_45.x;
    float _710 = in.m_45.y;
    float _712 = in.m_45.z;
    float _714 = sqrt(_700);
    float _716 = in.m_55.x;
    float _718 = in.m_55.y;
    float _720 = in.m_55.z;
    float _722 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _724 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _722;
    float _726 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _728 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _726;
    float _730 = _724 * _724;
    float _732 = fma(_728, _728, _730);
    float _734 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _736 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _734;
    float _738 = _622 * _714;
    float _740 = fma(_736, _736, _732);
    float _742 = _710 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _744 = sqrt(_740);
    float _746 = _708 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _748 = _712 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _750 = _742 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _718);
    float _754 = _746 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _756 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _758 = _738 * _750;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _716);
    float _762 = _738 * _754;
    float _764 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _720);
    float _766 = _752 * _758;
    float _768 = _738 * _756;
    float _770 = _760 * _762;
    float _772 = _766 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _774 = _766 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _776 = fma(_744, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _778 = _764 * _768;
    float _780 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[24].x, _772);
    float _782 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[26].x, _774);
    float _784 = precise::max(_776, 1.0);
    float _786 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[24].z, _780);
    float _788 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[26].z, _782);
    float _790 = precise::min(_784, 1.89999997615814208984375);
    float _792 = _786 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _794 = _788 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _796 = fma(_792, _790, _538);
    float _798 = fma(_794, _790, _540);
    float _800 = _766 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _802 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _804 = _796 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _808 = _798 + _806;
    float _810 = fma(_770, (*spvDescriptorSet0.vp_c8)._m0[25].x, _800);
    float _812 = _804 * _804;
    float _814 = _808 * _808;
    float _816 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[25].z, _810);
    float _818 = _812 + _814;
    float _820 = _816 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _822 = sqrt(_818);
    float _824 = fma(_820, _790, _536);
    bool _826 = _822 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _828 = _790;
    float _830 = _766;
    float _832 = _820;
    float _834 = _816;
    float _836 = _796;
    if (!_826)
    {
        _828 = _796;
    }
    float _838 = _828;
    float _840 = _838;
    if (!_826)
    {
        _830 = _814;
    }
    float _842 = _830;
    float _844 = _842;
    if (!_826)
    {
        _832 = _812;
    }
    float _846 = _832;
    float _848 = _846;
    if (!_826)
    {
        _834 = _798;
    }
    float _850 = _834;
    float _852 = _850;
    if (!_826)
    {
        _836 = _824;
    }
    float _854 = _836;
    bool _856 = !_826;
    float _858 = _854;
    if (!_856)
    {
        float _860 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _862 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _864 = _822 + _862;
        float _866 = rsqrt(_818);
        float _868 = _864 * _860;
        float _870 = _824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _872 = _868 * 0.15915493667125701904296875;
        float _874 = _872 * 6.283185482025146484375;
        float _876 = sin(_874);
        float _878 = _872 * 6.283185482025146484375;
        float _880 = cos(_878);
        float _882 = fma(_876, _870, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _884 = _866 * _882;
        float _886 = _880 + (-1.0);
        float _888 = fma(_804, _884, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _890 = fma(_808, _884, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _892 = _886 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _894 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _896 = _888 + _894;
        float _898 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _900 = _890 + _898;
        float _902 = fma(_824, _880, _892);
        float _904 = _896 * _896;
        float _906 = _900 * _900;
        _858 = _902;
        _848 = _904;
        _844 = _906;
        _840 = _888;
        _852 = _890;
    }
    float _908 = _858;
    float _910 = _848;
    float _912 = _844;
    float _914 = _840;
    float _916 = _852;
    float _918 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _920 = _908 + _918;
    out.m_53.w = _642;
    float _922 = fma(_920, _920, _910);
    float _924 = _922 + _912;
    float _926 = sqrt(_924);
    bool _928 = _926 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _930 = isnan(_926);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _936 = _932 || _934;
    float _938 = _922;
    if (!_936)
    {
        _938 = 1.0;
    }
    float _940 = _938;
    bool _942 = !_936;
    float _944 = _940;
    if (!_942)
    {
        bool _946 = _926 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _948 = isnan(_926);
        bool _950 = _946 || _948;
        bool _952 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _954 = _950 || _952;
        if (!_954)
        {
            float _956 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _958 = _926 + _956;
            float _960 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _962 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _960;
            float _964 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _966 = _964 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _968 = 1.0 / _962;
            float _970 = _958 * _968;
            float _972 = fma(_970, _966, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _944 = _972;
            _974 = true;
        }
        else
        {
            bool _976 = _926 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _978 = isnan(_926);
            bool _980 = _976 || _978;
            bool _982 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _984 = _980 || _982;
            if (!_984)
            {
                float _986 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _988 = _926 + _986;
                float _990 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _992 = _990 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _994 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _996 = _994 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _998 = 1.0 / _992;
                float _1000 = _988 * _998;
                float _1002 = fma(_1000, _996, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _944 = _1002;
                _974 = true;
            }
            else
            {
                _944 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _974 = false;
    float _1004 = _944;
    float _1006 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1008 = _914 + _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1012 = _916 + _1010;
    bool _1014 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan(0.5);
    bool _1022 = _1018 || _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1026 = _908 + _1024;
    float _1028 = fma(_1008, _1004, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1030 = fma(_1012, _1004, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1032 = fma(_1026, _1004, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1034 = -_648;
    float _1036 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1028);
    float _1038 = -_654;
    float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1030);
    float _1042 = -_646;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1032);
    float _1046 = _1044;
    float _1048 = _1036;
    float _1050 = _1040;
    if (!_1022)
    {
        float _1052 = _666 * _666;
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1056 = -_540;
        float _1058 = _1056 + _1030;
        float _1060 = fma(_674, _674, _1052);
        float _1062 = fma(_684, _684, _1060);
        float _1064 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1066 = sqrt(_1062);
        float _1068 = 1.0 / _738;
        float _1070 = precise::min(_1066, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1072 = _1070 * _1054;
        float _1074 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1076 = _1072 * _1068;
        float _1078 = -_538;
        float _1080 = _1078 + _1028;
        float _1082 = -_536;
        float _1084 = _1082 + _1032;
        float _1086 = _1074 * _1076;
        float _1088 = _1058 * _1076;
        float _1090 = fma(_1080, _1086, _658);
        float _1092 = fma(_1084, _1086, _652);
        float _1094 = fma(_1074, _1088, _670);
        _1046 = _1092;
        _1048 = _1090;
        _1050 = _1094;
    }
    float _1096 = _1046;
    float _1098 = _1048;
    float _1100 = _1050;
    float _1102 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1104 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1106 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1108 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1110 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1102);
    float _1112 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1104);
    float _1114 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1106);
    float _1116 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1108);
    float _1118 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1110);
    float _1120 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1112);
    float _1122 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1114);
    float _1124 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1116);
    float _1126 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1128 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1130 = _1122 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1132 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1134 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1136 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1138 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1140 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1142 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1134);
    float _1144 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1136);
    float _1146 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1138);
    float _1148 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1140);
    float _1150 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1142);
    float _1152 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1144);
    float _1154 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1146);
    float _1156 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1148);
    float _1158 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1160 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1150);
    float _1162 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1152);
    float _1164 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1154);
    float _1166 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1156);
    out.m_39.x = 1.0;
    out.m_57.w = _1158;
    out.gl_Position.x = _1160;
    out.gl_Position.y = _1162;
    out.gl_Position.z = _1164;
    out.gl_Position.w = _1166;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

