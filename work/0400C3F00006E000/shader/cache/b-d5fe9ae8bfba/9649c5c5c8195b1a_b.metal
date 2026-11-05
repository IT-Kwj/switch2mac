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
    float4 m_51 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_32 [[attribute(3)]];
    float4 m_45 [[attribute(4)]];
    float4 m_41 [[attribute(5)]];
    float4 m_43 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = in.m_32.w;
    float _77 = trunc(_73);
    int _80 = int(_77);
    float _82 = -_75;
    float _84 = _82 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _84;
    bool _88 = _80 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_80);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    if (!_88)
    {
        out.m_37.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _94 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1075 = as_type<float>(_100);
        out.gl_Position.z = _1075;
    }
    if (!_88)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _104 = _75 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_75);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = float(_80);
    bool _116 = _84 >= _114;
    bool _118 = !_112;
    bool _120 = _116 || _118;
    int _122 = 0;
    if (_120)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _92;
    if (_120)
    {
        out.m_37.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _102 = as_type<int>(_126);
    }
    int _128 = _102;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1130 = as_type<float>(_128);
        out.gl_Position.z = _1130;
    }
    if (_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_39.x;
    float _132 = _84 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _134 = in.m_41.z;
    int _136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _138 = _136 != 0;
    int _140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _142 = _140 != 0;
    float _144 = in.m_41.x;
    float _146 = in.m_41.w;
    int _148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _150 = _148 != 0;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_43.x;
    float _164 = in.m_43.y;
    float _166 = in.m_43.z;
    float _168 = in.m_45.x;
    float _170 = in.m_45.y;
    float _172 = in.m_45.z;
    float _174 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _176 = in.m_41.y;
    int _178 = 0;
    float _180 = _132;
    if (_138)
    {
        float _182 = -_130;
        float _184 = _182 + 1.0;
        _178 = as_type<int>(_184);
    }
    int _186 = _178;
    if (_142)
    {
        float _188 = -_130;
        float _190 = _188 + 1.0;
        _122 = as_type<int>(_190);
    }
    int _192 = _122;
    float _194 = 0.0;
    if (!_138)
    {
        _194 = _130;
    }
    float _196 = _194;
    float _198 = in.m_39.y;
    bool _200 = false;
    float _202 = _196;
    if (_138)
    {
        bool _204 = _134 > 0.5;
        _200 = _204;
    }
    bool _206 = _200;
    float _208 = 0.0;
    if (!_142)
    {
        _208 = _130;
    }
    float _210 = _208;
    float _212 = in.m_43.w;
    bool _214 = false;
    float _216 = _210;
    if (_142)
    {
        bool _218 = _144 > 0.5;
        _214 = _218;
    }
    bool _220 = _214;
    float _222 = _144 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_138)
    {
        float _224 = _206 ? as_type<float>(_186) : _130;
        _202 = _224;
    }
    float _226 = _202;
    float _228 = -_174;
    float _230 = fma(_222, 2.0, _228);
    float _232 = 0.5;
    if (_142)
    {
        float _234 = _220 ? as_type<float>(_192) : _130;
        _216 = _234;
    }
    float _236 = _216;
    float _238 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _240 = _146 > 0.5;
    float _242 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _246 = _244 != 0;
    float _248 = _166 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _252 = _250 != 0;
    float _254 = in.m_30.x;
    float _256 = in.m_30.y;
    float _258 = in.m_30.z;
    int _260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _262 = _260 != 0;
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _168);
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _268 = _266 != 0;
    float _270 = _168 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _272 = in.m_32.x;
    float _274 = in.m_32.y;
    float _276 = in.m_32.z;
    float _278 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _170);
    float _280 = _170 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _282 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _286 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _288 = _280 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _290 = _280 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _292 = fma(_282, -2.0, _284);
    float _294 = _280 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _298 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[9].x, _288);
    float _300 = _288;
    float _302 = _176;
    if (!_160)
    {
        float _304 = _132 * _132;
        float _306 = _304 * 0.5;
        _300 = _306;
    }
    float _308 = _300;
    float _310 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[8].x, _290);
    float _312 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _172);
    float _314 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[10].x, _294);
    float _316 = -_198;
    float _318 = _316 + 1.0;
    float _320 = _308;
    float _322 = _198;
    if (!_160)
    {
        float _324 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _320 = _324;
    }
    float _326 = _320;
    bool _328 = !_160;
    float _330 = _326;
    if (!_328)
    {
        float _332 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _334 = log2(_332);
        float _336 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _338 = _336 + 1.0;
        float _340 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _342 = _132 * _334;
        float _344 = 1.0 / _338;
        float _346 = _340 * 0.693147182464599609375;
        float _348 = exp2(_342);
        float _350 = 1.0 / _346;
        float _352 = _348 + (-1.0);
        float _354 = -_352;
        float _356 = fma(_354, _350, _132);
        float _358 = _356 * _344;
        float _360 = _358 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _330 = _360;
    }
    float _362 = _330;
    int _364 = int(_150);
    int _366 = _240 ? 2 : 0;
    int _368 = _364 | _366;
    int _370 = _246 ? 4 : 0;
    int _372 = _368 | _370;
    int _374 = _252 ? 8 : 0;
    int _376 = _372 | _374;
    int _378 = _262 ? 16 : 0;
    int _380 = _376 | _378;
    int _382 = _268 ? 32 : 0;
    int _384 = _380 | _382;
    int _386 = _160 ? 64 : 0;
    int _388 = _384 | _386;
    int _390 = _388 & 1;
    bool _392 = _390 != 0;
    bool _394 = !_160;
    float _396 = as_type<float>(_390);
    if (!_394)
    {
        float _398 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _400 = log2(_398);
        float _402 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _404 = _402 + 1.0;
        float _406 = 1.0 / _404;
        float _408 = _132 * _400;
        float _410 = exp2(_408);
        float _412 = -_410;
        float _414 = _412 + 1.0;
        float _416 = _414 * _406;
        _180 = _416;
    }
    float _418 = _180;
    bool _420 = _176 > 0.5;
    float _422 = _296 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _426 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[76].y, _292);
    int _428 = _420 ? as_type<int>(_318) : as_type<int>(_198);
    float _430 = -_84;
    float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[76].x, _230);
    float _434 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].w, _424);
    if (_392)
    {
        _396 = _134;
    }
    float _436 = _396;
    float _438 = _238 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _440 = _252 ? as_type<float>(_428) : _198;
    float _442 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _444 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[77].w, _434);
    float _446 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _448 = _436;
    if (!_392)
    {
        _448 = _176;
    }
    float _450 = _448;
    float _452 = fma(_422, _440, -0.5);
    float _454 = fma(_418, _274, _442);
    float _456 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _458 = fma(_418, _276, _446);
    float _460 = fma(_454, _212, _256);
    float _462 = fma(_418, _272, _456);
    float _464 = fma(_458, _212, _258);
    float _466 = _460 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _468 = fma(_462, _212, _254);
    float _470 = _460 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _472 = _460 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _474 = -_426;
    float _476 = fma(_444, _452, _474);
    float _478 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[5].x, _466);
    float _480 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[4].x, _470);
    float _482 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[6].x, _472);
    float _484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _486 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[5].z, _478);
    float _488 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[4].z, _480);
    float _490 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[6].z, _482);
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _494 = _486 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _496 = _488 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _498 = _490 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _500 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].w, _492);
    float _502 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _504 = _494 + _502;
    float _506 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _508 = _496 + _506;
    float _510 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _512 = _498 + _510;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _516 = _504 * _504;
    float _518 = _514;
    if (!_392)
    {
        _302 = _144;
    }
    float _520 = _302;
    float _522 = _248 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _524 = fma(_508, _508, _516);
    float _526 = _520 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _528 = as_type<int>(_520);
    float _530 = _526;
    if (_246)
    {
        float _532 = -_130;
        float _534 = _532 + 1.0;
        _528 = as_type<int>(_534);
    }
    int _536 = _528;
    float _538 = fma(_512, _512, _524);
    float _540 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[89].z, _514);
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_246)
    {
        _518 = _130;
    }
    float _546 = _518;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _550 = fma(_526, -2.0, _542);
    float _552 = _546;
    if (_392)
    {
        _530 = _144;
    }
    float _554 = _530;
    float _556 = _554;
    if (_246)
    {
        float _558 = _420 ? as_type<float>(_536) : _130;
        _552 = _558;
    }
    float _560 = _552;
    float _562 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[78].z, _548);
    float _564 = rsqrt(_538);
    if (!_392)
    {
        _556 = _134;
    }
    float _566 = _556;
    float _568 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[86].y, _550);
    bool _570 = _134 > 0.5;
    float _572 = _484 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _576 = fma(_572, _236, -0.5);
    float _578 = _544 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _586 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[88].z, _580);
    int _588 = _240 ? as_type<int>(_318) : as_type<int>(_198);
    float _590 = _504 * _564;
    float _592 = _508 * _564;
    float _594 = _512 * _564;
    float _596 = _262 ? as_type<float>(_588) : _198;
    float _598 = -_590;
    float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[18].w, _504);
    float _602 = -_592;
    float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[18].w, _508);
    float _606 = -_594;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _512);
    if (_268)
    {
        float _610 = _570 ? _318 : _198;
        _322 = _610;
    }
    float _612 = _322;
    float _614 = _600 * _600;
    float _616 = fma(_578, _560, -0.5);
    float _618 = -_584;
    float _620 = fma(_574, 2.0, _618);
    float _622 = fma(_604, _604, _614);
    float _624 = _582 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _626 = fma(_608, _608, _622);
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _632 = sqrt(_626);
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _636 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[89].x, _540);
    float _638 = _630 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _642 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _644 = _636 * (-0.15915493667125701904296875);
    float _646 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].z, _310);
    float _648 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[9].z, _298);
    float _650 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[10].z, _314);
    float _652 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[77].z, _562);
    float _654 = _644 * 6.283185482025146484375;
    float _656 = sin(_654);
    float _658 = fma(_624, _612, -0.5);
    float _660 = _628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = fma(_652, _576, _432);
    float _664 = _242 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _666 = _564 * _632;
    out.m_47.x = _646;
    out.m_47.y = _648;
    out.m_47.z = _650;
    float _668 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[87].z, _586);
    float _670 = _644 * 6.283185482025146484375;
    float _672 = cos(_670);
    float _674 = _664 * _666;
    float _676 = _438 * _666;
    out.m_49.x = _660;
    out.m_49.y = _638;
    out.m_49.z = _642;
    out.m_49.w = _640;
    float _678 = _522 * _666;
    float _680 = _674 * _278;
    float _682 = _676 * _264;
    float _684 = -_84;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[86].x, _620);
    float _688 = _678 * _312;
    float _690 = -_590;
    float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _494);
    float _694 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[87].w, _500);
    float _696 = _692 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _698 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _700 = isnan(0.5);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _706 = _702 || _704;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _710 = _680 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _712 = _656 * _658;
    float _714 = _680 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _718 = fma(_682, (*spvDescriptorSet0.vp_c10)._m0[10].x, _710);
    float _720 = -_712;
    float _722 = fma(_672, _616, _720);
    float _724 = fma(_682, (*spvDescriptorSet0.vp_c10)._m0[8].x, _714);
    float _726 = _672 * _658;
    float _728 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[10].z, _718);
    float _730 = fma(_668, _722, _686);
    float _732 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[8].z, _724);
    float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _736 = _498 + _728;
    float _738 = _596 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _740 = _496 + _732;
    float _742 = fma(_656, _616, _726);
    float _744 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _746 = _736 + _744;
    float _748 = -_592;
    float _750 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _752 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _754 = _740 + _752;
    float _756 = _738 * _716;
    float _758 = _746 * _746;
    float _760 = _226 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _762 = _692 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _764 = -_568;
    float _766 = fma(_694, _742, _764);
    float _768 = fma(_754, _754, _758);
    float _770 = -_594;
    float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[18].w, _498);
    float _774 = _730 + 0.5;
    float _776 = _760 * _734;
    float _778 = sqrt(_768);
    float _780 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[11].x, _762);
    float _782 = _766 + 0.5;
    out.m_51.w = _708;
    float _784 = _476 + 0.5;
    float _786 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[11].z, _780);
    float _788 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[10].x, _696);
    out.m_53.x = _774;
    out.m_53.y = _782;
    float _790 = _680 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _792 = _786 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _794 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[10].z, _788);
    float _796 = _662 + 0.5;
    float _798 = fma(_682, (*spvDescriptorSet0.vp_c10)._m0[9].x, _790);
    float _800 = 1.0 / _792;
    float _802 = _794 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _804 = _778 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _806 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[9].z, _798);
    float _808 = _802 + _792;
    out.m_55.x = _796;
    out.m_55.y = _784;
    out.m_55.z = _776;
    out.m_55.w = _756;
    float _810 = _494 + _806;
    float _812 = _808 * _800;
    float _814 = _812 * 0.5;
    float _816 = _776;
    float _818 = _796;
    float _820 = _756;
    if (!_804)
    {
        _232 = _740;
    }
    float _822 = _232;
    float _824 = _822;
    if (!_804)
    {
        _816 = _736;
    }
    float _826 = _816;
    float _828 = _826;
    if (!_804)
    {
        _818 = _810;
    }
    float _830 = _818;
    bool _832 = !_804;
    float _834 = _830;
    if (!_832)
    {
        float _836 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _838 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _840 = _778 + _838;
        float _842 = _810 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _844 = rsqrt(_768);
        float _846 = _840 * _836;
        float _848 = _846 * 0.15915493667125701904296875;
        float _850 = _848 * 6.283185482025146484375;
        float _852 = cos(_850);
        float _854 = _848 * 6.283185482025146484375;
        float _856 = sin(_854);
        float _858 = _852 + (-1.0);
        float _860 = _858 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _862 = fma(_856, _842, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _864 = fma(_810, _852, _860);
        float _866 = _844 * _862;
        float _868 = fma(_754, _866, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _870 = fma(_746, _866, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _834 = _864;
        _824 = _868;
        _828 = _870;
        _820 = _860;
    }
    float _872 = _834;
    float _874 = _824;
    float _876 = _828;
    float _878 = _820;
    float _880 = -_590;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _884 = _878;
    if (_706)
    {
        _884 = 1.0;
    }
    float _886 = _884;
    float _888 = _886;
    if (!_706)
    {
        float _890 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _892 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[30].w, _890);
        float _894 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        float _898 = 1.0 / _892;
        float _900 = 1.0 / _896;
        float _902 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _904 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _906 = fma(_898, _902, _904);
        float _908 = _906 * _900;
        float _910 = precise::clamp(_908, 0.0, 1.0);
        float _912 = -_910;
        float _914 = _912 + 1.0;
        _888 = _914;
    }
    float _916 = _888;
    float _918 = -_592;
    float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[18].w, _874);
    float _922 = _882 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _924 = -_594;
    float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[18].w, _876);
    float _928 = _882 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _930 = _882 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _932 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[1].x, _922);
    float _934 = _882 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _936 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[0].x, _928);
    float _938 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[2].x, _930);
    float _940 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[1].z, _932);
    float _942 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[3].x, _934);
    float _944 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[0].z, _936);
    float _946 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[2].z, _938);
    float _948 = _940 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _950 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[3].z, _942);
    float _952 = _944 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _954 = _946 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _956 = _948 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _958 = _948 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _960 = _948 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _962 = _948 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _964 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[6].x, _956);
    float _966 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[7].x, _958);
    float _968 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[4].x, _960);
    float _970 = _950 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _972 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[6].z, _964);
    float _974 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[7].z, _966);
    float _976 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[5].x, _962);
    float _978 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[4].z, _968);
    float _980 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[6].w, _972);
    float _982 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[7].w, _974);
    bool _984 = _916 > 0.0;
    bool _986 = isnan(_916);
    bool _988 = _984 || _986;
    bool _990 = isnan(0.0);
    bool _992 = _988 || _990;
    float _994 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[5].z, _976);
    float _996 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[4].w, _978);
    float _998 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1000 = _980 + _982;
    float _1002 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[5].w, _994);
    float _1004 = _998 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1006 = _1000 * 0.5;
    out.m_57.x = _920;
    out.m_57.y = _882;
    out.m_57.z = _926;
    out.m_37.x = _1004;
    out.gl_Position.x = _996;
    out.gl_Position.y = _1002;
    out.gl_Position.z = _980;
    out.gl_Position.w = _982;
    out.m_59.z = _1006;
    out.m_59.w = _982;
    if (_992)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_37.x = 0.0;
    float _1008 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1008;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = in.m_32.w;
    float _77 = trunc(_73);
    int _80 = int(_77);
    float _82 = -_75;
    float _84 = _82 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _84;
    bool _88 = _80 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_80);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    if (!_88)
    {
        out.m_37.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _94 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1075 = as_type<float>(_100);
        out.gl_Position.z = _1075;
    }
    if (!_88)
    {
        return out;
    }
    bool _104 = _75 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_75);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = float(_80);
    bool _116 = _84 >= _114;
    bool _118 = !_112;
    bool _120 = _116 || _118;
    int _122 = 0;
    if (_120)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _92;
    if (_120)
    {
        out.m_37.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _102 = as_type<int>(_126);
    }
    int _128 = _102;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1130 = as_type<float>(_128);
        out.gl_Position.z = _1130;
    }
    if (_120)
    {
        return out;
    }
    float _130 = in.m_39.x;
    float _132 = _84 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _134 = in.m_41.z;
    int _136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _138 = _136 != 0;
    int _140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _142 = _140 != 0;
    float _144 = in.m_41.x;
    float _146 = in.m_41.w;
    int _148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _150 = _148 != 0;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_43.x;
    float _164 = in.m_43.y;
    float _166 = in.m_43.z;
    float _168 = in.m_45.x;
    float _170 = in.m_45.y;
    float _172 = in.m_45.z;
    float _174 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _176 = in.m_41.y;
    int _178 = 0;
    float _180 = _132;
    if (_138)
    {
        float _182 = -_130;
        float _184 = _182 + 1.0;
        _178 = as_type<int>(_184);
    }
    int _186 = _178;
    if (_142)
    {
        float _188 = -_130;
        float _190 = _188 + 1.0;
        _122 = as_type<int>(_190);
    }
    int _192 = _122;
    float _194 = 0.0;
    if (!_138)
    {
        _194 = _130;
    }
    float _196 = _194;
    float _198 = in.m_39.y;
    bool _200 = false;
    float _202 = _196;
    if (_138)
    {
        bool _204 = _134 > 0.5;
        _200 = _204;
    }
    bool _206 = _200;
    float _208 = 0.0;
    if (!_142)
    {
        _208 = _130;
    }
    float _210 = _208;
    float _212 = in.m_43.w;
    bool _214 = false;
    float _216 = _210;
    if (_142)
    {
        bool _218 = _144 > 0.5;
        _214 = _218;
    }
    bool _220 = _214;
    float _222 = _144 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_138)
    {
        float _224 = _206 ? as_type<float>(_186) : _130;
        _202 = _224;
    }
    float _226 = _202;
    float _228 = -_174;
    float _230 = fma(_222, 2.0, _228);
    float _232 = 0.5;
    if (_142)
    {
        float _234 = _220 ? as_type<float>(_192) : _130;
        _216 = _234;
    }
    float _236 = _216;
    float _238 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _240 = _146 > 0.5;
    float _242 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _246 = _244 != 0;
    float _248 = _166 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _252 = _250 != 0;
    float _254 = in.m_30.x;
    float _256 = in.m_30.y;
    float _258 = in.m_30.z;
    int _260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _262 = _260 != 0;
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _168);
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _268 = _266 != 0;
    float _270 = _168 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _272 = in.m_32.x;
    float _274 = in.m_32.y;
    float _276 = in.m_32.z;
    float _278 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _170);
    float _280 = _170 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _282 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _286 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _288 = _280 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _290 = _280 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _292 = fma(_282, -2.0, _284);
    float _294 = _280 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _298 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[9].x, _288);
    float _300 = _288;
    float _302 = _176;
    if (!_160)
    {
        float _304 = _132 * _132;
        float _306 = _304 * 0.5;
        _300 = _306;
    }
    float _308 = _300;
    float _310 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[8].x, _290);
    float _312 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _172);
    float _314 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[10].x, _294);
    float _316 = -_198;
    float _318 = _316 + 1.0;
    float _320 = _308;
    float _322 = _198;
    if (!_160)
    {
        float _324 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _320 = _324;
    }
    float _326 = _320;
    bool _328 = !_160;
    float _330 = _326;
    if (!_328)
    {
        float _332 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _334 = log2(_332);
        float _336 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _338 = _336 + 1.0;
        float _340 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _342 = _132 * _334;
        float _344 = 1.0 / _338;
        float _346 = _340 * 0.693147182464599609375;
        float _348 = exp2(_342);
        float _350 = 1.0 / _346;
        float _352 = _348 + (-1.0);
        float _354 = -_352;
        float _356 = fma(_354, _350, _132);
        float _358 = _356 * _344;
        float _360 = _358 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _330 = _360;
    }
    float _362 = _330;
    int _364 = int(_150);
    int _366 = _240 ? 2 : 0;
    int _368 = _364 | _366;
    int _370 = _246 ? 4 : 0;
    int _372 = _368 | _370;
    int _374 = _252 ? 8 : 0;
    int _376 = _372 | _374;
    int _378 = _262 ? 16 : 0;
    int _380 = _376 | _378;
    int _382 = _268 ? 32 : 0;
    int _384 = _380 | _382;
    int _386 = _160 ? 64 : 0;
    int _388 = _384 | _386;
    int _390 = _388 & 1;
    bool _392 = _390 != 0;
    bool _394 = !_160;
    float _396 = as_type<float>(_390);
    if (!_394)
    {
        float _398 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _400 = log2(_398);
        float _402 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _404 = _402 + 1.0;
        float _406 = 1.0 / _404;
        float _408 = _132 * _400;
        float _410 = exp2(_408);
        float _412 = -_410;
        float _414 = _412 + 1.0;
        float _416 = _414 * _406;
        _180 = _416;
    }
    float _418 = _180;
    bool _420 = _176 > 0.5;
    float _422 = _296 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _426 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[76].y, _292);
    int _428 = _420 ? as_type<int>(_318) : as_type<int>(_198);
    float _430 = -_84;
    float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[76].x, _230);
    float _434 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].w, _424);
    if (_392)
    {
        _396 = _134;
    }
    float _436 = _396;
    float _438 = _238 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _440 = _252 ? as_type<float>(_428) : _198;
    float _442 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _444 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[77].w, _434);
    float _446 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _448 = _436;
    if (!_392)
    {
        _448 = _176;
    }
    float _450 = _448;
    float _452 = fma(_422, _440, -0.5);
    float _454 = fma(_418, _274, _442);
    float _456 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _458 = fma(_418, _276, _446);
    float _460 = fma(_454, _212, _256);
    float _462 = fma(_418, _272, _456);
    float _464 = fma(_458, _212, _258);
    float _466 = _460 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _468 = fma(_462, _212, _254);
    float _470 = _460 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _472 = _460 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _474 = -_426;
    float _476 = fma(_444, _452, _474);
    float _478 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[5].x, _466);
    float _480 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[4].x, _470);
    float _482 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[6].x, _472);
    float _484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _486 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[5].z, _478);
    float _488 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[4].z, _480);
    float _490 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[6].z, _482);
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _494 = _486 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _496 = _488 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _498 = _490 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _500 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].w, _492);
    float _502 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _504 = _494 + _502;
    float _506 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _508 = _496 + _506;
    float _510 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _512 = _498 + _510;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _516 = _504 * _504;
    float _518 = _514;
    if (!_392)
    {
        _302 = _144;
    }
    float _520 = _302;
    float _522 = _248 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _524 = fma(_508, _508, _516);
    float _526 = _520 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _528 = as_type<int>(_520);
    float _530 = _526;
    if (_246)
    {
        float _532 = -_130;
        float _534 = _532 + 1.0;
        _528 = as_type<int>(_534);
    }
    int _536 = _528;
    float _538 = fma(_512, _512, _524);
    float _540 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[89].z, _514);
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_246)
    {
        _518 = _130;
    }
    float _546 = _518;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _550 = fma(_526, -2.0, _542);
    float _552 = _546;
    if (_392)
    {
        _530 = _144;
    }
    float _554 = _530;
    float _556 = _554;
    if (_246)
    {
        float _558 = _420 ? as_type<float>(_536) : _130;
        _552 = _558;
    }
    float _560 = _552;
    float _562 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[78].z, _548);
    float _564 = rsqrt(_538);
    if (!_392)
    {
        _556 = _134;
    }
    float _566 = _556;
    float _568 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[86].y, _550);
    bool _570 = _134 > 0.5;
    float _572 = _484 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _576 = fma(_572, _236, -0.5);
    float _578 = _544 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _586 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[88].z, _580);
    int _588 = _240 ? as_type<int>(_318) : as_type<int>(_198);
    float _590 = _504 * _564;
    float _592 = _508 * _564;
    float _594 = _512 * _564;
    float _596 = _262 ? as_type<float>(_588) : _198;
    float _598 = -_590;
    float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[18].w, _504);
    float _602 = -_592;
    float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[18].w, _508);
    float _606 = -_594;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _512);
    if (_268)
    {
        float _610 = _570 ? _318 : _198;
        _322 = _610;
    }
    float _612 = _322;
    float _614 = _600 * _600;
    float _616 = fma(_578, _560, -0.5);
    float _618 = -_584;
    float _620 = fma(_574, 2.0, _618);
    float _622 = fma(_604, _604, _614);
    float _624 = _582 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _626 = fma(_608, _608, _622);
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _632 = sqrt(_626);
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _636 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[89].x, _540);
    float _638 = _630 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _642 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _644 = _636 * (-0.15915493667125701904296875);
    float _646 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].z, _310);
    float _648 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[9].z, _298);
    float _650 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[10].z, _314);
    float _652 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[77].z, _562);
    float _654 = _644 * 6.283185482025146484375;
    float _656 = sin(_654);
    float _658 = fma(_624, _612, -0.5);
    float _660 = _628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = fma(_652, _576, _432);
    float _664 = _242 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _666 = _564 * _632;
    out.m_47.x = _646;
    out.m_47.y = _648;
    out.m_47.z = _650;
    float _668 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[87].z, _586);
    float _670 = _644 * 6.283185482025146484375;
    float _672 = cos(_670);
    float _674 = _664 * _666;
    float _676 = _438 * _666;
    out.m_49.x = _660;
    out.m_49.y = _638;
    out.m_49.z = _642;
    out.m_49.w = _640;
    float _678 = _522 * _666;
    float _680 = _674 * _278;
    float _682 = _676 * _264;
    float _684 = -_84;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[86].x, _620);
    float _688 = _678 * _312;
    float _690 = -_590;
    float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _494);
    float _694 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[87].w, _500);
    float _696 = _692 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _698 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _700 = isnan(0.5);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _706 = _702 || _704;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _710 = _680 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _712 = _656 * _658;
    float _714 = _680 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _718 = fma(_682, (*spvDescriptorSet0.vp_c10)._m0[10].x, _710);
    float _720 = -_712;
    float _722 = fma(_672, _616, _720);
    float _724 = fma(_682, (*spvDescriptorSet0.vp_c10)._m0[8].x, _714);
    float _726 = _672 * _658;
    float _728 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[10].z, _718);
    float _730 = fma(_668, _722, _686);
    float _732 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[8].z, _724);
    float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _736 = _498 + _728;
    float _738 = _596 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _740 = _496 + _732;
    float _742 = fma(_656, _616, _726);
    float _744 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _746 = _736 + _744;
    float _748 = -_592;
    float _750 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _752 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _754 = _740 + _752;
    float _756 = _738 * _716;
    float _758 = _746 * _746;
    float _760 = _226 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _762 = _692 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _764 = -_568;
    float _766 = fma(_694, _742, _764);
    float _768 = fma(_754, _754, _758);
    float _770 = -_594;
    float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[18].w, _498);
    float _774 = _730 + 0.5;
    float _776 = _760 * _734;
    float _778 = sqrt(_768);
    float _780 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[11].x, _762);
    float _782 = _766 + 0.5;
    out.m_51.w = _708;
    float _784 = _476 + 0.5;
    float _786 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[11].z, _780);
    float _788 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[10].x, _696);
    out.m_53.x = _774;
    out.m_53.y = _782;
    float _790 = _680 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _792 = _786 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _794 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[10].z, _788);
    float _796 = _662 + 0.5;
    float _798 = fma(_682, (*spvDescriptorSet0.vp_c10)._m0[9].x, _790);
    float _800 = 1.0 / _792;
    float _802 = _794 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _804 = _778 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _806 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[9].z, _798);
    float _808 = _802 + _792;
    out.m_55.x = _796;
    out.m_55.y = _784;
    out.m_55.z = _776;
    out.m_55.w = _756;
    float _810 = _494 + _806;
    float _812 = _808 * _800;
    float _814 = _812 * 0.5;
    float _816 = _776;
    float _818 = _796;
    float _820 = _756;
    if (!_804)
    {
        _232 = _740;
    }
    float _822 = _232;
    float _824 = _822;
    if (!_804)
    {
        _816 = _736;
    }
    float _826 = _816;
    float _828 = _826;
    if (!_804)
    {
        _818 = _810;
    }
    float _830 = _818;
    bool _832 = !_804;
    float _834 = _830;
    if (!_832)
    {
        float _836 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _838 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _840 = _778 + _838;
        float _842 = _810 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _844 = rsqrt(_768);
        float _846 = _840 * _836;
        float _848 = _846 * 0.15915493667125701904296875;
        float _850 = _848 * 6.283185482025146484375;
        float _852 = cos(_850);
        float _854 = _848 * 6.283185482025146484375;
        float _856 = sin(_854);
        float _858 = _852 + (-1.0);
        float _860 = _858 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _862 = fma(_856, _842, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _864 = fma(_810, _852, _860);
        float _866 = _844 * _862;
        float _868 = fma(_754, _866, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _870 = fma(_746, _866, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _834 = _864;
        _824 = _868;
        _828 = _870;
        _820 = _860;
    }
    float _872 = _834;
    float _874 = _824;
    float _876 = _828;
    float _878 = _820;
    float _880 = -_590;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _884 = _878;
    if (_706)
    {
        _884 = 1.0;
    }
    float _886 = _884;
    float _888 = _886;
    if (!_706)
    {
        float _890 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _892 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[30].w, _890);
        float _894 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        float _898 = 1.0 / _892;
        float _900 = 1.0 / _896;
        float _902 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _904 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _906 = fma(_898, _902, _904);
        float _908 = _906 * _900;
        float _910 = precise::clamp(_908, 0.0, 1.0);
        float _912 = -_910;
        float _914 = _912 + 1.0;
        _888 = _914;
    }
    float _916 = _888;
    float _918 = -_592;
    float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[18].w, _874);
    float _922 = _882 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _924 = -_594;
    float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[18].w, _876);
    float _928 = _882 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _930 = _882 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _932 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[1].x, _922);
    float _934 = _882 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _936 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[0].x, _928);
    float _938 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[2].x, _930);
    float _940 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[1].z, _932);
    float _942 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[3].x, _934);
    float _944 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[0].z, _936);
    float _946 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[2].z, _938);
    float _948 = _940 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _950 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[3].z, _942);
    float _952 = _944 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _954 = _946 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _956 = _948 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _958 = _948 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _960 = _948 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _962 = _948 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _964 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[6].x, _956);
    float _966 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[7].x, _958);
    float _968 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[4].x, _960);
    float _970 = _950 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _972 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[6].z, _964);
    float _974 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[7].z, _966);
    float _976 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[5].x, _962);
    float _978 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[4].z, _968);
    float _980 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[6].w, _972);
    float _982 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[7].w, _974);
    bool _984 = _916 > 0.0;
    bool _986 = isnan(_916);
    bool _988 = _984 || _986;
    bool _990 = isnan(0.0);
    bool _992 = _988 || _990;
    float _994 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[5].z, _976);
    float _996 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[4].w, _978);
    float _998 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1000 = _980 + _982;
    float _1002 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[5].w, _994);
    float _1004 = _998 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1006 = _1000 * 0.5;
    out.m_57.x = _920;
    out.m_57.y = _882;
    out.m_57.z = _926;
    out.m_37.x = _1004;
    out.gl_Position.x = _996;
    out.gl_Position.y = _1002;
    out.gl_Position.z = _980;
    out.gl_Position.w = _982;
    out.m_59.z = _1006;
    out.m_59.w = _982;
    if (_992)
    {
        return out;
    }
    out.m_37.x = 0.0;
    float _1008 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1008;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = in.m_32.w;
    float _77 = trunc(_73);
    int _80 = int(_77);
    float _82 = -_75;
    float _84 = _82 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _84;
    bool _88 = _80 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_80);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    if (!_88)
    {
        out.m_37.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _94 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1075 = as_type<float>(_100);
        out.gl_Position.z = _1075;
    }
    if (!_88)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _104 = _75 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_75);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = float(_80);
    bool _116 = _84 >= _114;
    bool _118 = !_112;
    bool _120 = _116 || _118;
    int _122 = 0;
    if (_120)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _92;
    if (_120)
    {
        out.m_37.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _102 = as_type<int>(_126);
    }
    int _128 = _102;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1130 = as_type<float>(_128);
        out.gl_Position.z = _1130;
    }
    if (_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_39.x;
    float _132 = _84 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _134 = in.m_41.z;
    int _136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _138 = _136 != 0;
    int _140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _142 = _140 != 0;
    float _144 = in.m_41.x;
    float _146 = in.m_41.w;
    int _148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _150 = _148 != 0;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_43.x;
    float _164 = in.m_43.y;
    float _166 = in.m_43.z;
    float _168 = in.m_45.x;
    float _170 = in.m_45.y;
    float _172 = in.m_45.z;
    float _174 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _176 = in.m_41.y;
    int _178 = 0;
    float _180 = _132;
    if (_138)
    {
        float _182 = -_130;
        float _184 = _182 + 1.0;
        _178 = as_type<int>(_184);
    }
    int _186 = _178;
    if (_142)
    {
        float _188 = -_130;
        float _190 = _188 + 1.0;
        _122 = as_type<int>(_190);
    }
    int _192 = _122;
    float _194 = 0.0;
    if (!_138)
    {
        _194 = _130;
    }
    float _196 = _194;
    float _198 = in.m_39.y;
    bool _200 = false;
    float _202 = _196;
    if (_138)
    {
        bool _204 = _134 > 0.5;
        _200 = _204;
    }
    bool _206 = _200;
    float _208 = 0.0;
    if (!_142)
    {
        _208 = _130;
    }
    float _210 = _208;
    float _212 = in.m_43.w;
    bool _214 = false;
    float _216 = _210;
    if (_142)
    {
        bool _218 = _144 > 0.5;
        _214 = _218;
    }
    bool _220 = _214;
    float _222 = _144 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_138)
    {
        float _224 = _206 ? as_type<float>(_186) : _130;
        _202 = _224;
    }
    float _226 = _202;
    float _228 = -_174;
    float _230 = fma(_222, 2.0, _228);
    float _232 = 0.5;
    if (_142)
    {
        float _234 = _220 ? as_type<float>(_192) : _130;
        _216 = _234;
    }
    float _236 = _216;
    float _238 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _240 = _146 > 0.5;
    float _242 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _246 = _244 != 0;
    float _248 = _166 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _252 = _250 != 0;
    float _254 = in.m_30.x;
    float _256 = in.m_30.y;
    float _258 = in.m_30.z;
    int _260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _262 = _260 != 0;
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _168);
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _268 = _266 != 0;
    float _270 = _168 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _272 = in.m_32.x;
    float _274 = in.m_32.y;
    float _276 = in.m_32.z;
    float _278 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _170);
    float _280 = _170 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _282 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _286 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _288 = _280 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _290 = _280 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _292 = fma(_282, -2.0, _284);
    float _294 = _280 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _298 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[9].x, _288);
    float _300 = _288;
    float _302 = _176;
    if (!_160)
    {
        float _304 = _132 * _132;
        float _306 = _304 * 0.5;
        _300 = _306;
    }
    float _308 = _300;
    float _310 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[8].x, _290);
    float _312 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _172);
    float _314 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[10].x, _294);
    float _316 = -_198;
    float _318 = _316 + 1.0;
    float _320 = _308;
    float _322 = _198;
    if (!_160)
    {
        float _324 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _320 = _324;
    }
    float _326 = _320;
    bool _328 = !_160;
    float _330 = _326;
    if (!_328)
    {
        float _332 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _334 = log2(_332);
        float _336 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _338 = _336 + 1.0;
        float _340 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _342 = _132 * _334;
        float _344 = 1.0 / _338;
        float _346 = _340 * 0.693147182464599609375;
        float _348 = exp2(_342);
        float _350 = 1.0 / _346;
        float _352 = _348 + (-1.0);
        float _354 = -_352;
        float _356 = fma(_354, _350, _132);
        float _358 = _356 * _344;
        float _360 = _358 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _330 = _360;
    }
    float _362 = _330;
    int _364 = int(_150);
    int _366 = _240 ? 2 : 0;
    int _368 = _364 | _366;
    int _370 = _246 ? 4 : 0;
    int _372 = _368 | _370;
    int _374 = _252 ? 8 : 0;
    int _376 = _372 | _374;
    int _378 = _262 ? 16 : 0;
    int _380 = _376 | _378;
    int _382 = _268 ? 32 : 0;
    int _384 = _380 | _382;
    int _386 = _160 ? 64 : 0;
    int _388 = _384 | _386;
    int _390 = _388 & 1;
    bool _392 = _390 != 0;
    bool _394 = !_160;
    float _396 = as_type<float>(_390);
    if (!_394)
    {
        float _398 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _400 = log2(_398);
        float _402 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _404 = _402 + 1.0;
        float _406 = 1.0 / _404;
        float _408 = _132 * _400;
        float _410 = exp2(_408);
        float _412 = -_410;
        float _414 = _412 + 1.0;
        float _416 = _414 * _406;
        _180 = _416;
    }
    float _418 = _180;
    bool _420 = _176 > 0.5;
    float _422 = _296 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _426 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[76].y, _292);
    int _428 = _420 ? as_type<int>(_318) : as_type<int>(_198);
    float _430 = -_84;
    float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[76].x, _230);
    float _434 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].w, _424);
    if (_392)
    {
        _396 = _134;
    }
    float _436 = _396;
    float _438 = _238 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _440 = _252 ? as_type<float>(_428) : _198;
    float _442 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _444 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[77].w, _434);
    float _446 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _448 = _436;
    if (!_392)
    {
        _448 = _176;
    }
    float _450 = _448;
    float _452 = fma(_422, _440, -0.5);
    float _454 = fma(_418, _274, _442);
    float _456 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _458 = fma(_418, _276, _446);
    float _460 = fma(_454, _212, _256);
    float _462 = fma(_418, _272, _456);
    float _464 = fma(_458, _212, _258);
    float _466 = _460 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _468 = fma(_462, _212, _254);
    float _470 = _460 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _472 = _460 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _474 = -_426;
    float _476 = fma(_444, _452, _474);
    float _478 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[5].x, _466);
    float _480 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[4].x, _470);
    float _482 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[6].x, _472);
    float _484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _486 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[5].z, _478);
    float _488 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[4].z, _480);
    float _490 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[6].z, _482);
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _494 = _486 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _496 = _488 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _498 = _490 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _500 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].w, _492);
    float _502 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _504 = _494 + _502;
    float _506 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _508 = _496 + _506;
    float _510 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _512 = _498 + _510;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _516 = _504 * _504;
    float _518 = _514;
    if (!_392)
    {
        _302 = _144;
    }
    float _520 = _302;
    float _522 = _248 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _524 = fma(_508, _508, _516);
    float _526 = _520 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _528 = as_type<int>(_520);
    float _530 = _526;
    if (_246)
    {
        float _532 = -_130;
        float _534 = _532 + 1.0;
        _528 = as_type<int>(_534);
    }
    int _536 = _528;
    float _538 = fma(_512, _512, _524);
    float _540 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[89].z, _514);
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (!_246)
    {
        _518 = _130;
    }
    float _546 = _518;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _550 = fma(_526, -2.0, _542);
    float _552 = _546;
    if (_392)
    {
        _530 = _144;
    }
    float _554 = _530;
    float _556 = _554;
    if (_246)
    {
        float _558 = _420 ? as_type<float>(_536) : _130;
        _552 = _558;
    }
    float _560 = _552;
    float _562 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[78].z, _548);
    float _564 = rsqrt(_538);
    if (!_392)
    {
        _556 = _134;
    }
    float _566 = _556;
    float _568 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[86].y, _550);
    bool _570 = _134 > 0.5;
    float _572 = _484 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _576 = fma(_572, _236, -0.5);
    float _578 = _544 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _586 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[88].z, _580);
    int _588 = _240 ? as_type<int>(_318) : as_type<int>(_198);
    float _590 = _504 * _564;
    float _592 = _508 * _564;
    float _594 = _512 * _564;
    float _596 = _262 ? as_type<float>(_588) : _198;
    float _598 = -_590;
    float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[18].w, _504);
    float _602 = -_592;
    float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[18].w, _508);
    float _606 = -_594;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _512);
    if (_268)
    {
        float _610 = _570 ? _318 : _198;
        _322 = _610;
    }
    float _612 = _322;
    float _614 = _600 * _600;
    float _616 = fma(_578, _560, -0.5);
    float _618 = -_584;
    float _620 = fma(_574, 2.0, _618);
    float _622 = fma(_604, _604, _614);
    float _624 = _582 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _626 = fma(_608, _608, _622);
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _632 = sqrt(_626);
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _636 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[89].x, _540);
    float _638 = _630 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _642 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _644 = _636 * (-0.15915493667125701904296875);
    float _646 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[8].z, _310);
    float _648 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[9].z, _298);
    float _650 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[10].z, _314);
    float _652 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[77].z, _562);
    float _654 = _644 * 6.283185482025146484375;
    float _656 = sin(_654);
    float _658 = fma(_624, _612, -0.5);
    float _660 = _628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = fma(_652, _576, _432);
    float _664 = _242 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _666 = _564 * _632;
    out.m_47.x = _646;
    out.m_47.y = _648;
    out.m_47.z = _650;
    float _668 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[87].z, _586);
    float _670 = _644 * 6.283185482025146484375;
    float _672 = cos(_670);
    float _674 = _664 * _666;
    float _676 = _438 * _666;
    out.m_49.x = _660;
    out.m_49.y = _638;
    out.m_49.z = _642;
    out.m_49.w = _640;
    float _678 = _522 * _666;
    float _680 = _674 * _278;
    float _682 = _676 * _264;
    float _684 = -_84;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[86].x, _620);
    float _688 = _678 * _312;
    float _690 = -_590;
    float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _494);
    float _694 = fma(_84, (*spvDescriptorSet0.vp_c9)._m0[87].w, _500);
    float _696 = _692 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _698 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _700 = isnan(0.5);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _706 = _702 || _704;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _710 = _680 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _712 = _656 * _658;
    float _714 = _680 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _718 = fma(_682, (*spvDescriptorSet0.vp_c10)._m0[10].x, _710);
    float _720 = -_712;
    float _722 = fma(_672, _616, _720);
    float _724 = fma(_682, (*spvDescriptorSet0.vp_c10)._m0[8].x, _714);
    float _726 = _672 * _658;
    float _728 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[10].z, _718);
    float _730 = fma(_668, _722, _686);
    float _732 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[8].z, _724);
    float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _736 = _498 + _728;
    float _738 = _596 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _740 = _496 + _732;
    float _742 = fma(_656, _616, _726);
    float _744 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _746 = _736 + _744;
    float _748 = -_592;
    float _750 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _752 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _754 = _740 + _752;
    float _756 = _738 * _716;
    float _758 = _746 * _746;
    float _760 = _226 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _762 = _692 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _764 = -_568;
    float _766 = fma(_694, _742, _764);
    float _768 = fma(_754, _754, _758);
    float _770 = -_594;
    float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[18].w, _498);
    float _774 = _730 + 0.5;
    float _776 = _760 * _734;
    float _778 = sqrt(_768);
    float _780 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[11].x, _762);
    float _782 = _766 + 0.5;
    out.m_51.w = _708;
    float _784 = _476 + 0.5;
    float _786 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[11].z, _780);
    float _788 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[10].x, _696);
    out.m_53.x = _774;
    out.m_53.y = _782;
    float _790 = _680 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _792 = _786 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _794 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[10].z, _788);
    float _796 = _662 + 0.5;
    float _798 = fma(_682, (*spvDescriptorSet0.vp_c10)._m0[9].x, _790);
    float _800 = 1.0 / _792;
    float _802 = _794 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _804 = _778 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _806 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[9].z, _798);
    float _808 = _802 + _792;
    out.m_55.x = _796;
    out.m_55.y = _784;
    out.m_55.z = _776;
    out.m_55.w = _756;
    float _810 = _494 + _806;
    float _812 = _808 * _800;
    float _814 = _812 * 0.5;
    float _816 = _776;
    float _818 = _796;
    float _820 = _756;
    if (!_804)
    {
        _232 = _740;
    }
    float _822 = _232;
    float _824 = _822;
    if (!_804)
    {
        _816 = _736;
    }
    float _826 = _816;
    float _828 = _826;
    if (!_804)
    {
        _818 = _810;
    }
    float _830 = _818;
    bool _832 = !_804;
    float _834 = _830;
    if (!_832)
    {
        float _836 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _838 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _840 = _778 + _838;
        float _842 = _810 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _844 = rsqrt(_768);
        float _846 = _840 * _836;
        float _848 = _846 * 0.15915493667125701904296875;
        float _850 = _848 * 6.283185482025146484375;
        float _852 = cos(_850);
        float _854 = _848 * 6.283185482025146484375;
        float _856 = sin(_854);
        float _858 = _852 + (-1.0);
        float _860 = _858 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _862 = fma(_856, _842, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _864 = fma(_810, _852, _860);
        float _866 = _844 * _862;
        float _868 = fma(_754, _866, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _870 = fma(_746, _866, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _834 = _864;
        _824 = _868;
        _828 = _870;
        _820 = _860;
    }
    float _872 = _834;
    float _874 = _824;
    float _876 = _828;
    float _878 = _820;
    float _880 = -_590;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _884 = _878;
    if (_706)
    {
        _884 = 1.0;
    }
    float _886 = _884;
    float _888 = _886;
    if (!_706)
    {
        float _890 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _892 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[30].w, _890);
        float _894 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        float _898 = 1.0 / _892;
        float _900 = 1.0 / _896;
        float _902 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _904 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _906 = fma(_898, _902, _904);
        float _908 = _906 * _900;
        float _910 = precise::clamp(_908, 0.0, 1.0);
        float _912 = -_910;
        float _914 = _912 + 1.0;
        _888 = _914;
    }
    float _916 = _888;
    float _918 = -_592;
    float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[18].w, _874);
    float _922 = _882 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _924 = -_594;
    float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[18].w, _876);
    float _928 = _882 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _930 = _882 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _932 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[1].x, _922);
    float _934 = _882 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _936 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[0].x, _928);
    float _938 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[2].x, _930);
    float _940 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[1].z, _932);
    float _942 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[3].x, _934);
    float _944 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[0].z, _936);
    float _946 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[2].z, _938);
    float _948 = _940 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _950 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[3].z, _942);
    float _952 = _944 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _954 = _946 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _956 = _948 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _958 = _948 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _960 = _948 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _962 = _948 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _964 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[6].x, _956);
    float _966 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[7].x, _958);
    float _968 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[4].x, _960);
    float _970 = _950 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _972 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[6].z, _964);
    float _974 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[7].z, _966);
    float _976 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[5].x, _962);
    float _978 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[4].z, _968);
    float _980 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[6].w, _972);
    float _982 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[7].w, _974);
    bool _984 = _916 > 0.0;
    bool _986 = isnan(_916);
    bool _988 = _984 || _986;
    bool _990 = isnan(0.0);
    bool _992 = _988 || _990;
    float _994 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[5].z, _976);
    float _996 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[4].w, _978);
    float _998 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1000 = _980 + _982;
    float _1002 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[5].w, _994);
    float _1004 = _998 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1006 = _1000 * 0.5;
    out.m_57.x = _920;
    out.m_57.y = _882;
    out.m_57.z = _926;
    out.m_37.x = _1004;
    out.gl_Position.x = _996;
    out.gl_Position.y = _1002;
    out.gl_Position.z = _980;
    out.gl_Position.w = _982;
    out.m_59.z = _1006;
    out.m_59.w = _982;
    if (_992)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_37.x = 0.0;
    float _1008 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1008;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

