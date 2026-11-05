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
    float4 m_49 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_69 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_71 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_47 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_43 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_37 [[attribute(9)]];
    float4 m_41 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_30.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    float _98 = as_type<float>(_90);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    float _102 = _100;
    if (!_94)
    {
        out.m_33.x = 0.0;
    }
    int _104 = 0;
    if (!_94)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1412 = as_type<float>(_108);
        out.gl_Position.z = _1412;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_35.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_90);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _98;
    if (_138)
    {
        out.m_33.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1481 = as_type<float>(_144);
        out.gl_Position.z = _1481;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_37.y;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _150 = in.m_39.y;
    int _152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _154 = _152 != 0;
    int _156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _158 = _156 != 0;
    float _160 = in.m_39.w;
    int _162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _164 = _162 != 0;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _168 = _166 != 0;
    float _170 = in.m_39.z;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _174 = _172 != 0;
    float _176 = in.m_37.x;
    float _178 = in.m_39.x;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _184 = -_146;
    float _186 = _184 + 1.0;
    float _188 = in.m_41.z;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _192 = _150 > 0.5;
    float _194 = in.m_41.x;
    float _196 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _198 = _190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _200 = _160 > 0.5;
    float _202 = in.m_41.w;
    int _204 = _192 ? as_type<int>(_186) : as_type<int>(_146);
    float _206 = _196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _208 = _200 ? as_type<int>(_186) : as_type<int>(_146);
    float _210 = _170 * 2.0;
    float _212 = _154 ? as_type<float>(_204) : _146;
    float _214 = _150 * 2.0;
    int _216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _218 = _216 != 0;
    float _220 = floor(_210);
    float _222 = in.m_43.x;
    float _224 = in.m_43.y;
    float _226 = in.m_43.z;
    bool _228 = _170 > 0.5;
    int _230 = 0;
    int _232 = _208;
    float _234 = _146;
    int _236 = as_type<int>(_186);
    bool _238 = _218;
    if (_168)
    {
        float _240 = -_176;
        float _242 = _240 + 1.0;
        _230 = as_type<int>(_242);
    }
    int _244 = _230;
    float _246 = _174 ? as_type<float>(_208) : _146;
    if (_164)
    {
        float _248 = -_176;
        float _250 = _248 + 1.0;
        _232 = as_type<int>(_250);
    }
    int _252 = _232;
    int _254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _256 = _254 != 0;
    float _258 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _260 = 0.0;
    if (!_158)
    {
        _260 = _176;
    }
    float _262 = _260;
    out.m_45.z = _188;
    float _264 = _262;
    if (_218)
    {
        float _266 = _228 ? _186 : _146;
        _234 = _266;
    }
    float _268 = _234;
    float _270 = _268;
    if (_158)
    {
        float _272 = -_176;
        float _274 = _272 + 1.0;
        _236 = as_type<int>(_274);
    }
    int _276 = _236;
    if (_158)
    {
        bool _278 = _178 > 0.5;
        _238 = _278;
    }
    bool _280 = _238;
    out.m_45.x = _194;
    float _282 = 0.0;
    if (!_164)
    {
        _282 = _176;
    }
    float _284 = _282;
    float _286 = fma(_258, -2.0, _182);
    float _288 = _284;
    if (_158)
    {
        float _290 = _280 ? as_type<float>(_276) : _176;
        _264 = _290;
    }
    float _292 = _264;
    out.m_45.w = _202;
    if (_164)
    {
        float _294 = _228 ? as_type<float>(_252) : _176;
        _288 = _294;
    }
    float _296 = _288;
    float _298 = floor(_214);
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _306 = _304 != 0;
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _310 = _308 != 0;
    float _312 = in.m_30.x;
    float _314 = in.m_30.y;
    float _316 = in.m_30.z;
    float _318 = _222 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _320 = _178 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _322 = _220 >= 0.0;
    bool _324 = isnan(_220);
    bool _326 = _322 || _324;
    bool _328 = isnan(0.0);
    bool _330 = _326 || _328;
    float _332 = _224 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = _226 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _336 = -_180;
    float _338 = fma(_320, 2.0, _336);
    float _340 = _178 * 2.0;
    int _342 = _330 ? 0 : 1;
    bool _344 = _220 > 0.0;
    float _346 = floor(_340);
    float _348 = -_126;
    float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[76].x, _338);
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _356 = in.m_47.x;
    float _358 = in.m_47.y;
    float _360 = in.m_47.z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _364 = _352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _368 = _314 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _370 = _314 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _372 = _314 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _374 = ~_342;
    int _376 = _374 + 1;
    int _378 = _376 + 1;
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[4].x, _368);
    float _382 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[5].x, _370);
    float _384 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[6].x, _372);
    float _386 = _150 + _170;
    int _388 = _378;
    float _390 = _316;
    if (!_344)
    {
        int _392 = ~_342;
        int _394 = _392 + 1;
        _388 = _394;
    }
    int _396 = _388;
    float _398 = _354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _400 = _346 >= 0.0;
    bool _402 = isnan(_346);
    bool _404 = _400 || _402;
    bool _406 = isnan(0.0);
    bool _408 = _404 || _406;
    float _410 = _386 + (-1.0);
    float _412 = _362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _414 = _366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _416 = _408 ? 0 : 1;
    float _418 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _420 = _346 > 0.0;
    float _422 = _150 + _178;
    out.m_49.x = _364;
    out.m_49.y = _398;
    out.m_49.z = _412;
    float _424 = _422 + (-1.0);
    out.m_51.x = _414;
    out.m_51.y = _198;
    out.m_51.z = _206;
    int _426 = ~_416;
    int _428 = _426 + 1;
    int _430 = _428 + 1;
    int _432 = _430;
    if (!_420)
    {
        int _434 = ~_416;
        int _436 = _434 + 1;
        _432 = _436;
    }
    int _438 = _432;
    float _440 = _178 + _170;
    float _442 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _446 = _440 + (-1.0);
    float _448 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _450 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _356);
    float _452 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _454 = _332 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _456 = _450 * _442;
    float _458 = _334 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _460 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _360);
    float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _466 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _358);
    float _468 = _148 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _470 = _460 * _458;
    float _472 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].w, _464);
    float _474 = _466 * _454;
    float _476 = fma(_468, _212, -0.5);
    float _478 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _286);
    float _480 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _472);
    float _482 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _484 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[5].z, _382);
    float _486 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[6].z, _384);
    float _488 = -_478;
    float _490 = fma(_480, _476, _488);
    float _492 = _480;
    float _494 = _472;
    if (_256)
    {
        _390 = _178;
    }
    float _496 = _390;
    float _498 = _444 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _500 = _496;
    if (!_256)
    {
        _492 = _150;
    }
    float _502 = _492;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _506 = _502;
    if (!_256)
    {
        _500 = _170;
    }
    float _508 = _500;
    float _510 = _462 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_256)
    {
        _506 = _178;
    }
    float _512 = _506;
    float _514 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _516 = log2(_514);
    float _518 = fma(_246, _498, -0.5);
    float _520 = _508 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _522 = _298 > 0.0;
    float _524 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[83].z, _504);
    if (!_256)
    {
        _494 = _170;
    }
    float _526 = _494;
    float _528 = _512 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _530 = _526;
    float _532 = _528;
    if (_256)
    {
        _530 = _150;
    }
    float _534 = _530;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _540 = !_302;
    int _542 = _540 ? 0 : 1;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _546 = _298 >= 0.0;
    bool _548 = isnan(_298);
    bool _550 = _546 || _548;
    bool _552 = isnan(0.0);
    bool _554 = _550 || _552;
    float _556 = -_536;
    float _558 = fma(_528, 2.0, _556);
    float _560 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[83].w, _538);
    float _562 = -_544;
    float _564 = fma(_520, 2.0, _562);
    float _566 = fma(_510, _268, -0.5);
    if (!_256)
    {
        _532 = _170;
    }
    float _568 = _532;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _572 = -_126;
    float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[86].x, _564);
    float _576 = _568;
    if (_256)
    {
        _576 = _150;
    }
    float _578 = _576;
    float _580 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _524);
    if (_256)
    {
        _270 = _150;
    }
    float _582 = _270;
    float _584 = -_126;
    float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[81].x, _558);
    int _588 = _554 ? 0 : 1;
    float _590 = _484 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _592 = _582;
    if (!_256)
    {
        _592 = _178;
    }
    float _594 = _592;
    float _596 = _482 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _598 = abs(_542);
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _602 = ~_588;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = _578 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _610 = _606;
    if (!_522)
    {
        int _612 = ~_588;
        int _614 = _612 + 1;
        _610 = _614;
    }
    int _616 = _610;
    float _618 = _594 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _620 = _516 * _126;
    float _622 = float(_598);
    float _624 = _490 + 0.5;
    float _626 = float(_396);
    float _628 = fma(_608, -2.0, _600);
    float _630 = fma(_618, -2.0, _570);
    float _632 = exp2(_620);
    float _634 = _622 * _626;
    float _636 = in.m_53.x;
    float _638 = in.m_53.y;
    float _640 = in.m_53.z;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _646 = 1.0 + _644;
    bool _648 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _650 = isnan(1.0);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _656 = _652 || _654;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _660 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _668 = _664 || _666;
    float _670 = 1.0 / _646;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _674 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[78].z, _642);
    float _676 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].w, _658);
    float _678 = -_632;
    float _680 = _678 + 1.0;
    float _682 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[88].z, _672);
    bool _684 = !_306;
    int _686 = _684 ? 0 : 1;
    float _688 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _674);
    float _690 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _676);
    float _692 = _668 ? _680 : 0.0;
    float _694 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _682);
    float _696 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _560);
    float _698 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _628);
    float _700 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _630);
    float _702 = _634 * (-2.0);
    bool _704 = _358 != 0.0;
    bool _706 = isnan(_358);
    bool _708 = _704 || _706;
    bool _710 = isnan(0.0);
    bool _712 = _708 || _710;
    if (_656)
    {
        float _714 = _692 * _670;
        _128 = _714;
    }
    float _716 = _128;
    int _718 = abs(_686);
    float _720 = fma(_702, _636, _636);
    float _722 = fma(_448, _702, _448);
    float _724 = _178 + (-0.5);
    float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _728 = in.m_55.x;
    float _730 = in.m_55.y;
    float _732 = in.m_55.z;
    bool _734 = !_310;
    int _736 = _734 ? 0 : 1;
    float _738 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[196].x, _720);
    bool _740 = _356 == 0.0;
    bool _742 = !_712;
    bool _744 = _740 && _742;
    float _746 = -_698;
    float _748 = fma(_696, _518, _746);
    int _750 = abs(_736);
    float _752 = fma(_722, _716, _738);
    float _754 = float(_718);
    float _756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _758 = float(_438);
    float _760 = _752 * 0.15915493667125701904296875;
    bool _762 = _360 == 0.0;
    bool _764 = _762 && _744;
    float _766 = _754 * _758;
    float _768 = float(_616);
    float _770 = _150 + (-0.5);
    float _772 = float(_750);
    float _774 = _766 * (-2.0);
    float _776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _778 = as_type<float>(_750);
    float _780 = _768;
    float _782 = _774;
    if (!_168)
    {
        _778 = _176;
    }
    float _784 = _778;
    float _786 = _726 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _788 = _772 * _768;
    float _790 = fma(_774, _638, _638);
    float _792 = _788;
    float _794 = _784;
    float _796 = _730;
    if (_764)
    {
        _780 = _728;
    }
    float _798 = _780;
    float _800 = fma(_418, _774, _418);
    float _802 = _788 * (-2.0);
    float _804 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[196].y, _790);
    float _806 = _798;
    if (_764)
    {
        _792 = _798;
    }
    float _808 = _792;
    float _810 = _760 * 6.283185482025146484375;
    float _812 = sin(_810);
    float _814 = _808;
    if (!_764)
    {
        _806 = _728;
    }
    float _816 = _806;
    float _818 = fma(_802, _640, _640);
    float _820 = _170 + (-0.5);
    float _822 = fma(_800, _716, _804);
    float _824 = fma(_452, _802, _452);
    float _826 = _820;
    if (_168)
    {
        float _828 = _192 ? as_type<float>(_244) : _176;
        _794 = _828;
    }
    float _830 = _794;
    float _832 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[196].z, _818);
    float _834 = _822 * 0.15915493667125701904296875;
    float _836 = _760 * 6.283185482025146484375;
    float _838 = cos(_836);
    float _840 = in.m_57.x;
    float _842 = in.m_57.y;
    float _844 = in.m_57.z;
    float _846 = in.m_57.w;
    float _848 = fma(_824, _716, _832);
    float _850 = _776 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_764)
    {
        _782 = _730;
    }
    float _852 = _782;
    float _854 = _756 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _856 = _848 * 0.15915493667125701904296875;
    float _858 = fma(_850, _296, -0.5);
    float _860 = _834 * 6.283185482025146484375;
    float _862 = sin(_860);
    float _864 = fma(_786, _292, -0.5);
    float _866 = _852;
    if (_764)
    {
        _826 = _852;
    }
    float _868 = _826;
    float _870 = fma(_580, _858, _586);
    float _872 = _868;
    if (!_764)
    {
        _866 = _730;
    }
    float _874 = _866;
    float _876 = fma(_854, _830, -0.5);
    float _878 = fma(_688, _864, _350);
    if (_764)
    {
        _796 = _732;
    }
    float _880 = _796;
    float _882 = _834 * 6.283185482025146484375;
    float _884 = cos(_882);
    float _886 = _880;
    if (!_764)
    {
        float _888 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[17].y, _816);
        _814 = _888;
    }
    float _890 = _814;
    if (!_764)
    {
        float _892 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[17].y, _874);
        _872 = _892;
    }
    float _894 = _872;
    if (!_764)
    {
        float _896 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[17].y, _732);
        _886 = _896;
    }
    float _898 = _886;
    float _900 = fma(_694, _876, _574);
    float _902 = _856 * 6.283185482025146484375;
    float _904 = cos(_902);
    float _906 = _844 * _816;
    float _908 = _842 * _732;
    float _910 = _840 * _874;
    float _912 = _838 * _862;
    float _914 = -_906;
    float _916 = fma(_840, _732, _914);
    float _918 = -_908;
    float _920 = fma(_844, _874, _918);
    float _922 = -_910;
    float _924 = fma(_842, _816, _922);
    float _926 = _856 * 6.283185482025146484375;
    float _928 = sin(_926);
    float _930 = _838 * _884;
    float _932 = -_700;
    float _934 = fma(_690, _566, _932);
    float _936 = _900 + 0.5;
    float _938 = _920 * _846;
    float _940 = _870 + 0.5;
    float _942 = _934 + 0.5;
    float _944 = _838 * _904;
    float _946 = _812 * _862;
    float _948 = _812 * _884;
    float _950 = _862 * _904;
    float _952 = _944 * _474;
    float _954 = _884 * _904;
    float _956 = _812 * _904;
    out.m_59.x = _936;
    out.m_59.y = _942;
    float _958 = fma(_928, _930, _946);
    float _960 = -_912;
    float _962 = fma(_928, _948, _960);
    float _964 = -_474;
    float _966 = _928 * _964;
    float _968 = -_948;
    float _970 = fma(_928, _912, _968);
    float _972 = fma(_958, _456, _952);
    float _974 = _956 * _474;
    float _976 = fma(_954, _456, _966);
    float _978 = fma(_928, _946, _930);
    float _980 = fma(_970, _470, _972);
    float _982 = fma(_962, _456, _974);
    float _984 = fma(_950, _470, _976);
    float _986 = _980 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _988 = fma(_978, _470, _982);
    float _990 = _916 * _846;
    float _992 = _878 + 0.5;
    float _994 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[9].x, _986);
    float _996 = _924 * _846;
    float _998 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.310000002384185791015625);
    float _1000 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.550000011920928955078125);
    float _1002 = fma(_988, (*spvDescriptorSet0.vp_c10)._m0[9].z, _994);
    float _1004 = _748 + 0.5;
    float _1006 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.2800000011920928955078125);
    float _1008 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.60000002384185791015625);
    float _1010 = _590 + _1002;
    float _1012 = -_842;
    float _1014 = _928 * _1012;
    float _1016 = _944 * _842;
    float _1018 = _956 * _842;
    float _1020 = fma(_1010, 0.3499999940395355224609375, _998);
    float _1022 = fma(_1010, 0.75, _1000);
    float _1024 = _944 * _894;
    float _1026 = fma(_954, _840, _1014);
    float _1028 = _1020 * 0.15915493667125701904296875;
    float _1030 = fma(_1010, 0.4000000059604644775390625, _1006);
    float _1032 = fma(_958, _890, _1024);
    float _1034 = fma(_1010, 0.85000002384185791015625, _1008);
    float _1036 = _1022 * 0.15915493667125701904296875;
    float _1038 = fma(_962, _840, _1018);
    float _1040 = -_894;
    float _1042 = _928 * _1040;
    float _1044 = _1030 * 0.15915493667125701904296875;
    float _1046 = _1034 * 0.15915493667125701904296875;
    float _1048 = _956 * _894;
    float _1050 = _1028 * 6.283185482025146484375;
    float _1052 = sin(_1050);
    float _1054 = fma(_954, _890, _1042);
    float _1056 = fma(_958, _840, _1016);
    float _1058 = fma(_962, _890, _1048);
    float _1060 = _980 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1062 = _980 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1064 = fma(_950, _898, _1054);
    float _1066 = fma(_970, _898, _1032);
    float _1068 = _1036 * 6.283185482025146484375;
    float _1070 = sin(_1068);
    float _1072 = fma(_978, _898, _1058);
    float _1074 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1060);
    float _1076 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1062);
    out.m_61.x = _992;
    out.m_61.y = _624;
    out.m_61.z = _940;
    out.m_61.w = _1004;
    float _1078 = fma(_950, _844, _1026);
    float _1080 = fma(_970, _844, _1056);
    float _1082 = fma(_988, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1076);
    float _1084 = _1044 * 6.283185482025146484375;
    float _1086 = sin(_1084);
    float _1088 = _486 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1090 = fma(_988, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1074);
    float _1092 = fma(_978, _844, _1038);
    float _1094 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1096 = _1088 + _1082;
    float _1098 = _596 + _1090;
    float _1100 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.17000000178813934326171875;
    float _1102 = _1046 * 6.283185482025146484375;
    float _1104 = sin(_1102);
    float _1106 = _1052 + _1070;
    float _1108 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.300000011920928955078125;
    float _1110 = fma(_1096, 0.550000011920928955078125, _1100);
    float _1112 = _944 * _990;
    float _1114 = fma(_1106, 0.00999999977648258209228515625, _1096);
    float _1116 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1118 = _1110 * 0.15915493667125701904296875;
    float _1120 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1122 = _1080 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1124 = -_990;
    float _1126 = _928 * _1124;
    float _1128 = _1118 * 6.283185482025146484375;
    float _1130 = sin(_1128);
    float _1132 = fma(_1064, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1116);
    float _1134 = fma(_958, _938, _1112);
    float _1136 = fma(_1064, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1094);
    float _1138 = fma(_1064, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1120);
    float _1140 = _1086 + _1104;
    float _1142 = fma(_954, _938, _1126);
    float _1144 = _956 * _990;
    float _1146 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1132);
    float _1148 = fma(_1140, 0.00999999977648258209228515625, _1098);
    float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1152 = _1114 + _1150;
    float _1154 = fma(_1098, 0.89999997615814208984375, _1108);
    float _1156 = _1080 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1160 = _1148 + _1158;
    float _1162 = _1152 * _1152;
    float _1164 = _1154 * 0.15915493667125701904296875;
    float _1166 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1156);
    float _1168 = _1130 * 0.20999999344348907470703125;
    float _1170 = fma(_1160, _1160, _1162);
    float _1172 = _1080 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1174 = fma(_970, _996, _1134);
    float _1176 = _1164 * 6.283185482025146484375;
    float _1178 = sin(_1176);
    float _1180 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1136);
    float _1182 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1172);
    float _1184 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1122);
    float _1186 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1138);
    float _1188 = fma(_1092, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1166);
    float _1190 = fma(_1092, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1182);
    float _1192 = fma(_1092, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1184);
    float _1194 = sqrt(_1170);
    float _1196 = fma(_962, _938, _1144);
    float _1198 = fma(_950, _996, _1142);
    float _1200 = _1174 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1202 = _1174 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1204 = _1174 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_63.x = _1146;
    out.m_63.y = _1180;
    out.m_63.z = _1186;
    float _1206 = fma(_978, _996, _1196);
    float _1208 = fma(_1178, 0.300000011920928955078125, _1168);
    float _1210 = fma(_1198, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1200);
    float _1212 = fma(_1198, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1204);
    out.m_65.x = _1188;
    out.m_65.y = _1190;
    out.m_65.z = _1192;
    float _1214 = _1010 + _1208;
    bool _1216 = _1194 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1218 = fma(_1198, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1202);
    float _1220 = fma(_1206, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1210);
    float _1222 = fma(_1206, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1212);
    float _1224 = fma(_1206, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1218);
    float _1226 = _1188;
    float _1228 = _1192;
    float _1230 = _1190;
    if (!_1216)
    {
        _1226 = _1148;
    }
    float _1232 = _1226;
    float _1234 = _1232;
    if (!_1216)
    {
        _1228 = _1114;
    }
    float _1236 = _1228;
    float _1238 = _1236;
    if (!_1216)
    {
        _1230 = _1214;
    }
    float _1240 = _1230;
    bool _1242 = !_1216;
    float _1244 = _1240;
    if (!_1242)
    {
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1250 = _1194 + _1248;
        float _1252 = _1214 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1254 = rsqrt(_1170);
        float _1256 = _1250 * _1246;
        float _1258 = _1256 * 0.15915493667125701904296875;
        float _1260 = _1258 * 6.283185482025146484375;
        float _1262 = cos(_1260);
        float _1264 = _1258 * 6.283185482025146484375;
        float _1266 = sin(_1264);
        float _1268 = _1262 + (-1.0);
        float _1270 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1272 = fma(_1266, _1252, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1274 = fma(_1214, _1262, _1270);
        float _1276 = _1254 * _1272;
        float _1278 = fma(_1160, _1276, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1280 = fma(_1152, _1276, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1244 = _1274;
        _1234 = _1278;
        _1238 = _1280;
    }
    float _1282 = _1244;
    float _1284 = _1234;
    float _1286 = _1238;
    float _1288 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1294 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1296 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1288);
    float _1298 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1290);
    float _1300 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1292);
    float _1302 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1294);
    float _1304 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1296);
    float _1306 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1298);
    float _1308 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1300);
    out.m_67.x = _1220;
    out.m_67.y = _1224;
    out.m_67.z = _1222;
    float _1310 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1312 = _1306 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1314 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1302);
    float _1316 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1318 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1320 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1322 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    out.m_69.x = _1284;
    out.m_69.y = _1282;
    out.m_69.z = _1286;
    float _1324 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1318);
    float _1326 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1320);
    float _1328 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1330 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1332 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1324);
    float _1334 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1326);
    float _1336 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1328);
    float _1338 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1330);
    float _1340 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1332);
    float _1342 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1336);
    float _1344 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1338);
    float _1346 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1334);
    float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1350 = _1340 + _1348;
    float _1352 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1342);
    float _1354 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1344);
    out.m_33.x = 1.0;
    out.m_71.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1352;
    out.gl_Position.y = _1354;
    out.gl_Position.z = _1350;
    out.gl_Position.w = _1346;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_30.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    float _98 = as_type<float>(_90);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    float _102 = _100;
    if (!_94)
    {
        out.m_33.x = 0.0;
    }
    int _104 = 0;
    if (!_94)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1412 = as_type<float>(_108);
        out.gl_Position.z = _1412;
    }
    if (!_94)
    {
        return out;
    }
    float _112 = in.m_35.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_90);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _98;
    if (_138)
    {
        out.m_33.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1481 = as_type<float>(_144);
        out.gl_Position.z = _1481;
    }
    if (_138)
    {
        return out;
    }
    float _146 = in.m_37.y;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _150 = in.m_39.y;
    int _152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _154 = _152 != 0;
    int _156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _158 = _156 != 0;
    float _160 = in.m_39.w;
    int _162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _164 = _162 != 0;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _168 = _166 != 0;
    float _170 = in.m_39.z;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _174 = _172 != 0;
    float _176 = in.m_37.x;
    float _178 = in.m_39.x;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _184 = -_146;
    float _186 = _184 + 1.0;
    float _188 = in.m_41.z;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _192 = _150 > 0.5;
    float _194 = in.m_41.x;
    float _196 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _198 = _190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _200 = _160 > 0.5;
    float _202 = in.m_41.w;
    int _204 = _192 ? as_type<int>(_186) : as_type<int>(_146);
    float _206 = _196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _208 = _200 ? as_type<int>(_186) : as_type<int>(_146);
    float _210 = _170 * 2.0;
    float _212 = _154 ? as_type<float>(_204) : _146;
    float _214 = _150 * 2.0;
    int _216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _218 = _216 != 0;
    float _220 = floor(_210);
    float _222 = in.m_43.x;
    float _224 = in.m_43.y;
    float _226 = in.m_43.z;
    bool _228 = _170 > 0.5;
    int _230 = 0;
    int _232 = _208;
    float _234 = _146;
    int _236 = as_type<int>(_186);
    bool _238 = _218;
    if (_168)
    {
        float _240 = -_176;
        float _242 = _240 + 1.0;
        _230 = as_type<int>(_242);
    }
    int _244 = _230;
    float _246 = _174 ? as_type<float>(_208) : _146;
    if (_164)
    {
        float _248 = -_176;
        float _250 = _248 + 1.0;
        _232 = as_type<int>(_250);
    }
    int _252 = _232;
    int _254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _256 = _254 != 0;
    float _258 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _260 = 0.0;
    if (!_158)
    {
        _260 = _176;
    }
    float _262 = _260;
    out.m_45.z = _188;
    float _264 = _262;
    if (_218)
    {
        float _266 = _228 ? _186 : _146;
        _234 = _266;
    }
    float _268 = _234;
    float _270 = _268;
    if (_158)
    {
        float _272 = -_176;
        float _274 = _272 + 1.0;
        _236 = as_type<int>(_274);
    }
    int _276 = _236;
    if (_158)
    {
        bool _278 = _178 > 0.5;
        _238 = _278;
    }
    bool _280 = _238;
    out.m_45.x = _194;
    float _282 = 0.0;
    if (!_164)
    {
        _282 = _176;
    }
    float _284 = _282;
    float _286 = fma(_258, -2.0, _182);
    float _288 = _284;
    if (_158)
    {
        float _290 = _280 ? as_type<float>(_276) : _176;
        _264 = _290;
    }
    float _292 = _264;
    out.m_45.w = _202;
    if (_164)
    {
        float _294 = _228 ? as_type<float>(_252) : _176;
        _288 = _294;
    }
    float _296 = _288;
    float _298 = floor(_214);
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _306 = _304 != 0;
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _310 = _308 != 0;
    float _312 = in.m_30.x;
    float _314 = in.m_30.y;
    float _316 = in.m_30.z;
    float _318 = _222 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _320 = _178 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _322 = _220 >= 0.0;
    bool _324 = isnan(_220);
    bool _326 = _322 || _324;
    bool _328 = isnan(0.0);
    bool _330 = _326 || _328;
    float _332 = _224 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = _226 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _336 = -_180;
    float _338 = fma(_320, 2.0, _336);
    float _340 = _178 * 2.0;
    int _342 = _330 ? 0 : 1;
    bool _344 = _220 > 0.0;
    float _346 = floor(_340);
    float _348 = -_126;
    float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[76].x, _338);
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _356 = in.m_47.x;
    float _358 = in.m_47.y;
    float _360 = in.m_47.z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _364 = _352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _368 = _314 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _370 = _314 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _372 = _314 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _374 = ~_342;
    int _376 = _374 + 1;
    int _378 = _376 + 1;
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[4].x, _368);
    float _382 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[5].x, _370);
    float _384 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[6].x, _372);
    float _386 = _150 + _170;
    int _388 = _378;
    float _390 = _316;
    if (!_344)
    {
        int _392 = ~_342;
        int _394 = _392 + 1;
        _388 = _394;
    }
    int _396 = _388;
    float _398 = _354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _400 = _346 >= 0.0;
    bool _402 = isnan(_346);
    bool _404 = _400 || _402;
    bool _406 = isnan(0.0);
    bool _408 = _404 || _406;
    float _410 = _386 + (-1.0);
    float _412 = _362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _414 = _366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _416 = _408 ? 0 : 1;
    float _418 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _420 = _346 > 0.0;
    float _422 = _150 + _178;
    out.m_49.x = _364;
    out.m_49.y = _398;
    out.m_49.z = _412;
    float _424 = _422 + (-1.0);
    out.m_51.x = _414;
    out.m_51.y = _198;
    out.m_51.z = _206;
    int _426 = ~_416;
    int _428 = _426 + 1;
    int _430 = _428 + 1;
    int _432 = _430;
    if (!_420)
    {
        int _434 = ~_416;
        int _436 = _434 + 1;
        _432 = _436;
    }
    int _438 = _432;
    float _440 = _178 + _170;
    float _442 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _446 = _440 + (-1.0);
    float _448 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _450 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _356);
    float _452 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _454 = _332 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _456 = _450 * _442;
    float _458 = _334 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _460 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _360);
    float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _466 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _358);
    float _468 = _148 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _470 = _460 * _458;
    float _472 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].w, _464);
    float _474 = _466 * _454;
    float _476 = fma(_468, _212, -0.5);
    float _478 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _286);
    float _480 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _472);
    float _482 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _484 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[5].z, _382);
    float _486 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[6].z, _384);
    float _488 = -_478;
    float _490 = fma(_480, _476, _488);
    float _492 = _480;
    float _494 = _472;
    if (_256)
    {
        _390 = _178;
    }
    float _496 = _390;
    float _498 = _444 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _500 = _496;
    if (!_256)
    {
        _492 = _150;
    }
    float _502 = _492;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _506 = _502;
    if (!_256)
    {
        _500 = _170;
    }
    float _508 = _500;
    float _510 = _462 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_256)
    {
        _506 = _178;
    }
    float _512 = _506;
    float _514 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _516 = log2(_514);
    float _518 = fma(_246, _498, -0.5);
    float _520 = _508 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _522 = _298 > 0.0;
    float _524 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[83].z, _504);
    if (!_256)
    {
        _494 = _170;
    }
    float _526 = _494;
    float _528 = _512 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _530 = _526;
    float _532 = _528;
    if (_256)
    {
        _530 = _150;
    }
    float _534 = _530;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _540 = !_302;
    int _542 = _540 ? 0 : 1;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _546 = _298 >= 0.0;
    bool _548 = isnan(_298);
    bool _550 = _546 || _548;
    bool _552 = isnan(0.0);
    bool _554 = _550 || _552;
    float _556 = -_536;
    float _558 = fma(_528, 2.0, _556);
    float _560 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[83].w, _538);
    float _562 = -_544;
    float _564 = fma(_520, 2.0, _562);
    float _566 = fma(_510, _268, -0.5);
    if (!_256)
    {
        _532 = _170;
    }
    float _568 = _532;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _572 = -_126;
    float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[86].x, _564);
    float _576 = _568;
    if (_256)
    {
        _576 = _150;
    }
    float _578 = _576;
    float _580 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _524);
    if (_256)
    {
        _270 = _150;
    }
    float _582 = _270;
    float _584 = -_126;
    float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[81].x, _558);
    int _588 = _554 ? 0 : 1;
    float _590 = _484 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _592 = _582;
    if (!_256)
    {
        _592 = _178;
    }
    float _594 = _592;
    float _596 = _482 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _598 = abs(_542);
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _602 = ~_588;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = _578 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _610 = _606;
    if (!_522)
    {
        int _612 = ~_588;
        int _614 = _612 + 1;
        _610 = _614;
    }
    int _616 = _610;
    float _618 = _594 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _620 = _516 * _126;
    float _622 = float(_598);
    float _624 = _490 + 0.5;
    float _626 = float(_396);
    float _628 = fma(_608, -2.0, _600);
    float _630 = fma(_618, -2.0, _570);
    float _632 = exp2(_620);
    float _634 = _622 * _626;
    float _636 = in.m_53.x;
    float _638 = in.m_53.y;
    float _640 = in.m_53.z;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _646 = 1.0 + _644;
    bool _648 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _650 = isnan(1.0);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _656 = _652 || _654;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _660 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _668 = _664 || _666;
    float _670 = 1.0 / _646;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _674 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[78].z, _642);
    float _676 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].w, _658);
    float _678 = -_632;
    float _680 = _678 + 1.0;
    float _682 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[88].z, _672);
    bool _684 = !_306;
    int _686 = _684 ? 0 : 1;
    float _688 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _674);
    float _690 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _676);
    float _692 = _668 ? _680 : 0.0;
    float _694 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _682);
    float _696 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _560);
    float _698 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _628);
    float _700 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _630);
    float _702 = _634 * (-2.0);
    bool _704 = _358 != 0.0;
    bool _706 = isnan(_358);
    bool _708 = _704 || _706;
    bool _710 = isnan(0.0);
    bool _712 = _708 || _710;
    if (_656)
    {
        float _714 = _692 * _670;
        _128 = _714;
    }
    float _716 = _128;
    int _718 = abs(_686);
    float _720 = fma(_702, _636, _636);
    float _722 = fma(_448, _702, _448);
    float _724 = _178 + (-0.5);
    float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _728 = in.m_55.x;
    float _730 = in.m_55.y;
    float _732 = in.m_55.z;
    bool _734 = !_310;
    int _736 = _734 ? 0 : 1;
    float _738 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[196].x, _720);
    bool _740 = _356 == 0.0;
    bool _742 = !_712;
    bool _744 = _740 && _742;
    float _746 = -_698;
    float _748 = fma(_696, _518, _746);
    int _750 = abs(_736);
    float _752 = fma(_722, _716, _738);
    float _754 = float(_718);
    float _756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _758 = float(_438);
    float _760 = _752 * 0.15915493667125701904296875;
    bool _762 = _360 == 0.0;
    bool _764 = _762 && _744;
    float _766 = _754 * _758;
    float _768 = float(_616);
    float _770 = _150 + (-0.5);
    float _772 = float(_750);
    float _774 = _766 * (-2.0);
    float _776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _778 = as_type<float>(_750);
    float _780 = _768;
    float _782 = _774;
    if (!_168)
    {
        _778 = _176;
    }
    float _784 = _778;
    float _786 = _726 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _788 = _772 * _768;
    float _790 = fma(_774, _638, _638);
    float _792 = _788;
    float _794 = _784;
    float _796 = _730;
    if (_764)
    {
        _780 = _728;
    }
    float _798 = _780;
    float _800 = fma(_418, _774, _418);
    float _802 = _788 * (-2.0);
    float _804 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[196].y, _790);
    float _806 = _798;
    if (_764)
    {
        _792 = _798;
    }
    float _808 = _792;
    float _810 = _760 * 6.283185482025146484375;
    float _812 = sin(_810);
    float _814 = _808;
    if (!_764)
    {
        _806 = _728;
    }
    float _816 = _806;
    float _818 = fma(_802, _640, _640);
    float _820 = _170 + (-0.5);
    float _822 = fma(_800, _716, _804);
    float _824 = fma(_452, _802, _452);
    float _826 = _820;
    if (_168)
    {
        float _828 = _192 ? as_type<float>(_244) : _176;
        _794 = _828;
    }
    float _830 = _794;
    float _832 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[196].z, _818);
    float _834 = _822 * 0.15915493667125701904296875;
    float _836 = _760 * 6.283185482025146484375;
    float _838 = cos(_836);
    float _840 = in.m_57.x;
    float _842 = in.m_57.y;
    float _844 = in.m_57.z;
    float _846 = in.m_57.w;
    float _848 = fma(_824, _716, _832);
    float _850 = _776 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_764)
    {
        _782 = _730;
    }
    float _852 = _782;
    float _854 = _756 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _856 = _848 * 0.15915493667125701904296875;
    float _858 = fma(_850, _296, -0.5);
    float _860 = _834 * 6.283185482025146484375;
    float _862 = sin(_860);
    float _864 = fma(_786, _292, -0.5);
    float _866 = _852;
    if (_764)
    {
        _826 = _852;
    }
    float _868 = _826;
    float _870 = fma(_580, _858, _586);
    float _872 = _868;
    if (!_764)
    {
        _866 = _730;
    }
    float _874 = _866;
    float _876 = fma(_854, _830, -0.5);
    float _878 = fma(_688, _864, _350);
    if (_764)
    {
        _796 = _732;
    }
    float _880 = _796;
    float _882 = _834 * 6.283185482025146484375;
    float _884 = cos(_882);
    float _886 = _880;
    if (!_764)
    {
        float _888 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[17].y, _816);
        _814 = _888;
    }
    float _890 = _814;
    if (!_764)
    {
        float _892 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[17].y, _874);
        _872 = _892;
    }
    float _894 = _872;
    if (!_764)
    {
        float _896 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[17].y, _732);
        _886 = _896;
    }
    float _898 = _886;
    float _900 = fma(_694, _876, _574);
    float _902 = _856 * 6.283185482025146484375;
    float _904 = cos(_902);
    float _906 = _844 * _816;
    float _908 = _842 * _732;
    float _910 = _840 * _874;
    float _912 = _838 * _862;
    float _914 = -_906;
    float _916 = fma(_840, _732, _914);
    float _918 = -_908;
    float _920 = fma(_844, _874, _918);
    float _922 = -_910;
    float _924 = fma(_842, _816, _922);
    float _926 = _856 * 6.283185482025146484375;
    float _928 = sin(_926);
    float _930 = _838 * _884;
    float _932 = -_700;
    float _934 = fma(_690, _566, _932);
    float _936 = _900 + 0.5;
    float _938 = _920 * _846;
    float _940 = _870 + 0.5;
    float _942 = _934 + 0.5;
    float _944 = _838 * _904;
    float _946 = _812 * _862;
    float _948 = _812 * _884;
    float _950 = _862 * _904;
    float _952 = _944 * _474;
    float _954 = _884 * _904;
    float _956 = _812 * _904;
    out.m_59.x = _936;
    out.m_59.y = _942;
    float _958 = fma(_928, _930, _946);
    float _960 = -_912;
    float _962 = fma(_928, _948, _960);
    float _964 = -_474;
    float _966 = _928 * _964;
    float _968 = -_948;
    float _970 = fma(_928, _912, _968);
    float _972 = fma(_958, _456, _952);
    float _974 = _956 * _474;
    float _976 = fma(_954, _456, _966);
    float _978 = fma(_928, _946, _930);
    float _980 = fma(_970, _470, _972);
    float _982 = fma(_962, _456, _974);
    float _984 = fma(_950, _470, _976);
    float _986 = _980 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _988 = fma(_978, _470, _982);
    float _990 = _916 * _846;
    float _992 = _878 + 0.5;
    float _994 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[9].x, _986);
    float _996 = _924 * _846;
    float _998 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.310000002384185791015625);
    float _1000 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.550000011920928955078125);
    float _1002 = fma(_988, (*spvDescriptorSet0.vp_c10)._m0[9].z, _994);
    float _1004 = _748 + 0.5;
    float _1006 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.2800000011920928955078125);
    float _1008 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.60000002384185791015625);
    float _1010 = _590 + _1002;
    float _1012 = -_842;
    float _1014 = _928 * _1012;
    float _1016 = _944 * _842;
    float _1018 = _956 * _842;
    float _1020 = fma(_1010, 0.3499999940395355224609375, _998);
    float _1022 = fma(_1010, 0.75, _1000);
    float _1024 = _944 * _894;
    float _1026 = fma(_954, _840, _1014);
    float _1028 = _1020 * 0.15915493667125701904296875;
    float _1030 = fma(_1010, 0.4000000059604644775390625, _1006);
    float _1032 = fma(_958, _890, _1024);
    float _1034 = fma(_1010, 0.85000002384185791015625, _1008);
    float _1036 = _1022 * 0.15915493667125701904296875;
    float _1038 = fma(_962, _840, _1018);
    float _1040 = -_894;
    float _1042 = _928 * _1040;
    float _1044 = _1030 * 0.15915493667125701904296875;
    float _1046 = _1034 * 0.15915493667125701904296875;
    float _1048 = _956 * _894;
    float _1050 = _1028 * 6.283185482025146484375;
    float _1052 = sin(_1050);
    float _1054 = fma(_954, _890, _1042);
    float _1056 = fma(_958, _840, _1016);
    float _1058 = fma(_962, _890, _1048);
    float _1060 = _980 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1062 = _980 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1064 = fma(_950, _898, _1054);
    float _1066 = fma(_970, _898, _1032);
    float _1068 = _1036 * 6.283185482025146484375;
    float _1070 = sin(_1068);
    float _1072 = fma(_978, _898, _1058);
    float _1074 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1060);
    float _1076 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1062);
    out.m_61.x = _992;
    out.m_61.y = _624;
    out.m_61.z = _940;
    out.m_61.w = _1004;
    float _1078 = fma(_950, _844, _1026);
    float _1080 = fma(_970, _844, _1056);
    float _1082 = fma(_988, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1076);
    float _1084 = _1044 * 6.283185482025146484375;
    float _1086 = sin(_1084);
    float _1088 = _486 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1090 = fma(_988, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1074);
    float _1092 = fma(_978, _844, _1038);
    float _1094 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1096 = _1088 + _1082;
    float _1098 = _596 + _1090;
    float _1100 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.17000000178813934326171875;
    float _1102 = _1046 * 6.283185482025146484375;
    float _1104 = sin(_1102);
    float _1106 = _1052 + _1070;
    float _1108 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.300000011920928955078125;
    float _1110 = fma(_1096, 0.550000011920928955078125, _1100);
    float _1112 = _944 * _990;
    float _1114 = fma(_1106, 0.00999999977648258209228515625, _1096);
    float _1116 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1118 = _1110 * 0.15915493667125701904296875;
    float _1120 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1122 = _1080 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1124 = -_990;
    float _1126 = _928 * _1124;
    float _1128 = _1118 * 6.283185482025146484375;
    float _1130 = sin(_1128);
    float _1132 = fma(_1064, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1116);
    float _1134 = fma(_958, _938, _1112);
    float _1136 = fma(_1064, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1094);
    float _1138 = fma(_1064, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1120);
    float _1140 = _1086 + _1104;
    float _1142 = fma(_954, _938, _1126);
    float _1144 = _956 * _990;
    float _1146 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1132);
    float _1148 = fma(_1140, 0.00999999977648258209228515625, _1098);
    float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1152 = _1114 + _1150;
    float _1154 = fma(_1098, 0.89999997615814208984375, _1108);
    float _1156 = _1080 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1160 = _1148 + _1158;
    float _1162 = _1152 * _1152;
    float _1164 = _1154 * 0.15915493667125701904296875;
    float _1166 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1156);
    float _1168 = _1130 * 0.20999999344348907470703125;
    float _1170 = fma(_1160, _1160, _1162);
    float _1172 = _1080 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1174 = fma(_970, _996, _1134);
    float _1176 = _1164 * 6.283185482025146484375;
    float _1178 = sin(_1176);
    float _1180 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1136);
    float _1182 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1172);
    float _1184 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1122);
    float _1186 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1138);
    float _1188 = fma(_1092, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1166);
    float _1190 = fma(_1092, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1182);
    float _1192 = fma(_1092, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1184);
    float _1194 = sqrt(_1170);
    float _1196 = fma(_962, _938, _1144);
    float _1198 = fma(_950, _996, _1142);
    float _1200 = _1174 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1202 = _1174 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1204 = _1174 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_63.x = _1146;
    out.m_63.y = _1180;
    out.m_63.z = _1186;
    float _1206 = fma(_978, _996, _1196);
    float _1208 = fma(_1178, 0.300000011920928955078125, _1168);
    float _1210 = fma(_1198, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1200);
    float _1212 = fma(_1198, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1204);
    out.m_65.x = _1188;
    out.m_65.y = _1190;
    out.m_65.z = _1192;
    float _1214 = _1010 + _1208;
    bool _1216 = _1194 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1218 = fma(_1198, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1202);
    float _1220 = fma(_1206, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1210);
    float _1222 = fma(_1206, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1212);
    float _1224 = fma(_1206, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1218);
    float _1226 = _1188;
    float _1228 = _1192;
    float _1230 = _1190;
    if (!_1216)
    {
        _1226 = _1148;
    }
    float _1232 = _1226;
    float _1234 = _1232;
    if (!_1216)
    {
        _1228 = _1114;
    }
    float _1236 = _1228;
    float _1238 = _1236;
    if (!_1216)
    {
        _1230 = _1214;
    }
    float _1240 = _1230;
    bool _1242 = !_1216;
    float _1244 = _1240;
    if (!_1242)
    {
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1250 = _1194 + _1248;
        float _1252 = _1214 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1254 = rsqrt(_1170);
        float _1256 = _1250 * _1246;
        float _1258 = _1256 * 0.15915493667125701904296875;
        float _1260 = _1258 * 6.283185482025146484375;
        float _1262 = cos(_1260);
        float _1264 = _1258 * 6.283185482025146484375;
        float _1266 = sin(_1264);
        float _1268 = _1262 + (-1.0);
        float _1270 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1272 = fma(_1266, _1252, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1274 = fma(_1214, _1262, _1270);
        float _1276 = _1254 * _1272;
        float _1278 = fma(_1160, _1276, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1280 = fma(_1152, _1276, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1244 = _1274;
        _1234 = _1278;
        _1238 = _1280;
    }
    float _1282 = _1244;
    float _1284 = _1234;
    float _1286 = _1238;
    float _1288 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1294 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1296 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1288);
    float _1298 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1290);
    float _1300 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1292);
    float _1302 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1294);
    float _1304 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1296);
    float _1306 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1298);
    float _1308 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1300);
    out.m_67.x = _1220;
    out.m_67.y = _1224;
    out.m_67.z = _1222;
    float _1310 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1312 = _1306 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1314 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1302);
    float _1316 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1318 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1320 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1322 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    out.m_69.x = _1284;
    out.m_69.y = _1282;
    out.m_69.z = _1286;
    float _1324 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1318);
    float _1326 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1320);
    float _1328 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1330 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1332 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1324);
    float _1334 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1326);
    float _1336 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1328);
    float _1338 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1330);
    float _1340 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1332);
    float _1342 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1336);
    float _1344 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1338);
    float _1346 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1334);
    float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1350 = _1340 + _1348;
    float _1352 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1342);
    float _1354 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1344);
    out.m_33.x = 1.0;
    out.m_71.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1352;
    out.gl_Position.y = _1354;
    out.gl_Position.z = _1350;
    out.gl_Position.w = _1346;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_30.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    float _98 = as_type<float>(_90);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    float _102 = _100;
    if (!_94)
    {
        out.m_33.x = 0.0;
    }
    int _104 = 0;
    if (!_94)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1412 = as_type<float>(_108);
        out.gl_Position.z = _1412;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_35.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_90);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _98;
    if (_138)
    {
        out.m_33.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1481 = as_type<float>(_144);
        out.gl_Position.z = _1481;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_37.y;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _150 = in.m_39.y;
    int _152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _154 = _152 != 0;
    int _156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _158 = _156 != 0;
    float _160 = in.m_39.w;
    int _162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _164 = _162 != 0;
    int _166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _168 = _166 != 0;
    float _170 = in.m_39.z;
    int _172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _174 = _172 != 0;
    float _176 = in.m_37.x;
    float _178 = in.m_39.x;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _184 = -_146;
    float _186 = _184 + 1.0;
    float _188 = in.m_41.z;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _192 = _150 > 0.5;
    float _194 = in.m_41.x;
    float _196 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _198 = _190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _200 = _160 > 0.5;
    float _202 = in.m_41.w;
    int _204 = _192 ? as_type<int>(_186) : as_type<int>(_146);
    float _206 = _196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _208 = _200 ? as_type<int>(_186) : as_type<int>(_146);
    float _210 = _170 * 2.0;
    float _212 = _154 ? as_type<float>(_204) : _146;
    float _214 = _150 * 2.0;
    int _216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _218 = _216 != 0;
    float _220 = floor(_210);
    float _222 = in.m_43.x;
    float _224 = in.m_43.y;
    float _226 = in.m_43.z;
    bool _228 = _170 > 0.5;
    int _230 = 0;
    int _232 = _208;
    float _234 = _146;
    int _236 = as_type<int>(_186);
    bool _238 = _218;
    if (_168)
    {
        float _240 = -_176;
        float _242 = _240 + 1.0;
        _230 = as_type<int>(_242);
    }
    int _244 = _230;
    float _246 = _174 ? as_type<float>(_208) : _146;
    if (_164)
    {
        float _248 = -_176;
        float _250 = _248 + 1.0;
        _232 = as_type<int>(_250);
    }
    int _252 = _232;
    int _254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _256 = _254 != 0;
    float _258 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _260 = 0.0;
    if (!_158)
    {
        _260 = _176;
    }
    float _262 = _260;
    out.m_45.z = _188;
    float _264 = _262;
    if (_218)
    {
        float _266 = _228 ? _186 : _146;
        _234 = _266;
    }
    float _268 = _234;
    float _270 = _268;
    if (_158)
    {
        float _272 = -_176;
        float _274 = _272 + 1.0;
        _236 = as_type<int>(_274);
    }
    int _276 = _236;
    if (_158)
    {
        bool _278 = _178 > 0.5;
        _238 = _278;
    }
    bool _280 = _238;
    out.m_45.x = _194;
    float _282 = 0.0;
    if (!_164)
    {
        _282 = _176;
    }
    float _284 = _282;
    float _286 = fma(_258, -2.0, _182);
    float _288 = _284;
    if (_158)
    {
        float _290 = _280 ? as_type<float>(_276) : _176;
        _264 = _290;
    }
    float _292 = _264;
    out.m_45.w = _202;
    if (_164)
    {
        float _294 = _228 ? as_type<float>(_252) : _176;
        _288 = _294;
    }
    float _296 = _288;
    float _298 = floor(_214);
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _306 = _304 != 0;
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _310 = _308 != 0;
    float _312 = in.m_30.x;
    float _314 = in.m_30.y;
    float _316 = in.m_30.z;
    float _318 = _222 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _320 = _178 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _322 = _220 >= 0.0;
    bool _324 = isnan(_220);
    bool _326 = _322 || _324;
    bool _328 = isnan(0.0);
    bool _330 = _326 || _328;
    float _332 = _224 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = _226 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _336 = -_180;
    float _338 = fma(_320, 2.0, _336);
    float _340 = _178 * 2.0;
    int _342 = _330 ? 0 : 1;
    bool _344 = _220 > 0.0;
    float _346 = floor(_340);
    float _348 = -_126;
    float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[76].x, _338);
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _356 = in.m_47.x;
    float _358 = in.m_47.y;
    float _360 = in.m_47.z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _364 = _352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _368 = _314 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _370 = _314 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _372 = _314 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _374 = ~_342;
    int _376 = _374 + 1;
    int _378 = _376 + 1;
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[4].x, _368);
    float _382 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[5].x, _370);
    float _384 = fma(_312, (*spvDescriptorSet0.vp_c10)._m0[6].x, _372);
    float _386 = _150 + _170;
    int _388 = _378;
    float _390 = _316;
    if (!_344)
    {
        int _392 = ~_342;
        int _394 = _392 + 1;
        _388 = _394;
    }
    int _396 = _388;
    float _398 = _354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _400 = _346 >= 0.0;
    bool _402 = isnan(_346);
    bool _404 = _400 || _402;
    bool _406 = isnan(0.0);
    bool _408 = _404 || _406;
    float _410 = _386 + (-1.0);
    float _412 = _362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _414 = _366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _416 = _408 ? 0 : 1;
    float _418 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _420 = _346 > 0.0;
    float _422 = _150 + _178;
    out.m_49.x = _364;
    out.m_49.y = _398;
    out.m_49.z = _412;
    float _424 = _422 + (-1.0);
    out.m_51.x = _414;
    out.m_51.y = _198;
    out.m_51.z = _206;
    int _426 = ~_416;
    int _428 = _426 + 1;
    int _430 = _428 + 1;
    int _432 = _430;
    if (!_420)
    {
        int _434 = ~_416;
        int _436 = _434 + 1;
        _432 = _436;
    }
    int _438 = _432;
    float _440 = _178 + _170;
    float _442 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _446 = _440 + (-1.0);
    float _448 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _450 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _356);
    float _452 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _454 = _332 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _456 = _450 * _442;
    float _458 = _334 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _460 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _360);
    float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _466 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _358);
    float _468 = _148 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _470 = _460 * _458;
    float _472 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].w, _464);
    float _474 = _466 * _454;
    float _476 = fma(_468, _212, -0.5);
    float _478 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _286);
    float _480 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _472);
    float _482 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[4].z, _380);
    float _484 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[5].z, _382);
    float _486 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[6].z, _384);
    float _488 = -_478;
    float _490 = fma(_480, _476, _488);
    float _492 = _480;
    float _494 = _472;
    if (_256)
    {
        _390 = _178;
    }
    float _496 = _390;
    float _498 = _444 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _500 = _496;
    if (!_256)
    {
        _492 = _150;
    }
    float _502 = _492;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _506 = _502;
    if (!_256)
    {
        _500 = _170;
    }
    float _508 = _500;
    float _510 = _462 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_256)
    {
        _506 = _178;
    }
    float _512 = _506;
    float _514 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _516 = log2(_514);
    float _518 = fma(_246, _498, -0.5);
    float _520 = _508 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _522 = _298 > 0.0;
    float _524 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[83].z, _504);
    if (!_256)
    {
        _494 = _170;
    }
    float _526 = _494;
    float _528 = _512 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _530 = _526;
    float _532 = _528;
    if (_256)
    {
        _530 = _150;
    }
    float _534 = _530;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _540 = !_302;
    int _542 = _540 ? 0 : 1;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _546 = _298 >= 0.0;
    bool _548 = isnan(_298);
    bool _550 = _546 || _548;
    bool _552 = isnan(0.0);
    bool _554 = _550 || _552;
    float _556 = -_536;
    float _558 = fma(_528, 2.0, _556);
    float _560 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[83].w, _538);
    float _562 = -_544;
    float _564 = fma(_520, 2.0, _562);
    float _566 = fma(_510, _268, -0.5);
    if (!_256)
    {
        _532 = _170;
    }
    float _568 = _532;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _572 = -_126;
    float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[86].x, _564);
    float _576 = _568;
    if (_256)
    {
        _576 = _150;
    }
    float _578 = _576;
    float _580 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _524);
    if (_256)
    {
        _270 = _150;
    }
    float _582 = _270;
    float _584 = -_126;
    float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[81].x, _558);
    int _588 = _554 ? 0 : 1;
    float _590 = _484 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _592 = _582;
    if (!_256)
    {
        _592 = _178;
    }
    float _594 = _592;
    float _596 = _482 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _598 = abs(_542);
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _602 = ~_588;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = _578 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _610 = _606;
    if (!_522)
    {
        int _612 = ~_588;
        int _614 = _612 + 1;
        _610 = _614;
    }
    int _616 = _610;
    float _618 = _594 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _620 = _516 * _126;
    float _622 = float(_598);
    float _624 = _490 + 0.5;
    float _626 = float(_396);
    float _628 = fma(_608, -2.0, _600);
    float _630 = fma(_618, -2.0, _570);
    float _632 = exp2(_620);
    float _634 = _622 * _626;
    float _636 = in.m_53.x;
    float _638 = in.m_53.y;
    float _640 = in.m_53.z;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _646 = 1.0 + _644;
    bool _648 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _650 = isnan(1.0);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _656 = _652 || _654;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _660 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _668 = _664 || _666;
    float _670 = 1.0 / _646;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _674 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[78].z, _642);
    float _676 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].w, _658);
    float _678 = -_632;
    float _680 = _678 + 1.0;
    float _682 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[88].z, _672);
    bool _684 = !_306;
    int _686 = _684 ? 0 : 1;
    float _688 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _674);
    float _690 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _676);
    float _692 = _668 ? _680 : 0.0;
    float _694 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _682);
    float _696 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _560);
    float _698 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _628);
    float _700 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _630);
    float _702 = _634 * (-2.0);
    bool _704 = _358 != 0.0;
    bool _706 = isnan(_358);
    bool _708 = _704 || _706;
    bool _710 = isnan(0.0);
    bool _712 = _708 || _710;
    if (_656)
    {
        float _714 = _692 * _670;
        _128 = _714;
    }
    float _716 = _128;
    int _718 = abs(_686);
    float _720 = fma(_702, _636, _636);
    float _722 = fma(_448, _702, _448);
    float _724 = _178 + (-0.5);
    float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _728 = in.m_55.x;
    float _730 = in.m_55.y;
    float _732 = in.m_55.z;
    bool _734 = !_310;
    int _736 = _734 ? 0 : 1;
    float _738 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[196].x, _720);
    bool _740 = _356 == 0.0;
    bool _742 = !_712;
    bool _744 = _740 && _742;
    float _746 = -_698;
    float _748 = fma(_696, _518, _746);
    int _750 = abs(_736);
    float _752 = fma(_722, _716, _738);
    float _754 = float(_718);
    float _756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _758 = float(_438);
    float _760 = _752 * 0.15915493667125701904296875;
    bool _762 = _360 == 0.0;
    bool _764 = _762 && _744;
    float _766 = _754 * _758;
    float _768 = float(_616);
    float _770 = _150 + (-0.5);
    float _772 = float(_750);
    float _774 = _766 * (-2.0);
    float _776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _778 = as_type<float>(_750);
    float _780 = _768;
    float _782 = _774;
    if (!_168)
    {
        _778 = _176;
    }
    float _784 = _778;
    float _786 = _726 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _788 = _772 * _768;
    float _790 = fma(_774, _638, _638);
    float _792 = _788;
    float _794 = _784;
    float _796 = _730;
    if (_764)
    {
        _780 = _728;
    }
    float _798 = _780;
    float _800 = fma(_418, _774, _418);
    float _802 = _788 * (-2.0);
    float _804 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[196].y, _790);
    float _806 = _798;
    if (_764)
    {
        _792 = _798;
    }
    float _808 = _792;
    float _810 = _760 * 6.283185482025146484375;
    float _812 = sin(_810);
    float _814 = _808;
    if (!_764)
    {
        _806 = _728;
    }
    float _816 = _806;
    float _818 = fma(_802, _640, _640);
    float _820 = _170 + (-0.5);
    float _822 = fma(_800, _716, _804);
    float _824 = fma(_452, _802, _452);
    float _826 = _820;
    if (_168)
    {
        float _828 = _192 ? as_type<float>(_244) : _176;
        _794 = _828;
    }
    float _830 = _794;
    float _832 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[196].z, _818);
    float _834 = _822 * 0.15915493667125701904296875;
    float _836 = _760 * 6.283185482025146484375;
    float _838 = cos(_836);
    float _840 = in.m_57.x;
    float _842 = in.m_57.y;
    float _844 = in.m_57.z;
    float _846 = in.m_57.w;
    float _848 = fma(_824, _716, _832);
    float _850 = _776 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_764)
    {
        _782 = _730;
    }
    float _852 = _782;
    float _854 = _756 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _856 = _848 * 0.15915493667125701904296875;
    float _858 = fma(_850, _296, -0.5);
    float _860 = _834 * 6.283185482025146484375;
    float _862 = sin(_860);
    float _864 = fma(_786, _292, -0.5);
    float _866 = _852;
    if (_764)
    {
        _826 = _852;
    }
    float _868 = _826;
    float _870 = fma(_580, _858, _586);
    float _872 = _868;
    if (!_764)
    {
        _866 = _730;
    }
    float _874 = _866;
    float _876 = fma(_854, _830, -0.5);
    float _878 = fma(_688, _864, _350);
    if (_764)
    {
        _796 = _732;
    }
    float _880 = _796;
    float _882 = _834 * 6.283185482025146484375;
    float _884 = cos(_882);
    float _886 = _880;
    if (!_764)
    {
        float _888 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[17].y, _816);
        _814 = _888;
    }
    float _890 = _814;
    if (!_764)
    {
        float _892 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[17].y, _874);
        _872 = _892;
    }
    float _894 = _872;
    if (!_764)
    {
        float _896 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[17].y, _732);
        _886 = _896;
    }
    float _898 = _886;
    float _900 = fma(_694, _876, _574);
    float _902 = _856 * 6.283185482025146484375;
    float _904 = cos(_902);
    float _906 = _844 * _816;
    float _908 = _842 * _732;
    float _910 = _840 * _874;
    float _912 = _838 * _862;
    float _914 = -_906;
    float _916 = fma(_840, _732, _914);
    float _918 = -_908;
    float _920 = fma(_844, _874, _918);
    float _922 = -_910;
    float _924 = fma(_842, _816, _922);
    float _926 = _856 * 6.283185482025146484375;
    float _928 = sin(_926);
    float _930 = _838 * _884;
    float _932 = -_700;
    float _934 = fma(_690, _566, _932);
    float _936 = _900 + 0.5;
    float _938 = _920 * _846;
    float _940 = _870 + 0.5;
    float _942 = _934 + 0.5;
    float _944 = _838 * _904;
    float _946 = _812 * _862;
    float _948 = _812 * _884;
    float _950 = _862 * _904;
    float _952 = _944 * _474;
    float _954 = _884 * _904;
    float _956 = _812 * _904;
    out.m_59.x = _936;
    out.m_59.y = _942;
    float _958 = fma(_928, _930, _946);
    float _960 = -_912;
    float _962 = fma(_928, _948, _960);
    float _964 = -_474;
    float _966 = _928 * _964;
    float _968 = -_948;
    float _970 = fma(_928, _912, _968);
    float _972 = fma(_958, _456, _952);
    float _974 = _956 * _474;
    float _976 = fma(_954, _456, _966);
    float _978 = fma(_928, _946, _930);
    float _980 = fma(_970, _470, _972);
    float _982 = fma(_962, _456, _974);
    float _984 = fma(_950, _470, _976);
    float _986 = _980 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _988 = fma(_978, _470, _982);
    float _990 = _916 * _846;
    float _992 = _878 + 0.5;
    float _994 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[9].x, _986);
    float _996 = _924 * _846;
    float _998 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.310000002384185791015625);
    float _1000 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.550000011920928955078125);
    float _1002 = fma(_988, (*spvDescriptorSet0.vp_c10)._m0[9].z, _994);
    float _1004 = _748 + 0.5;
    float _1006 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.2800000011920928955078125);
    float _1008 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.60000002384185791015625);
    float _1010 = _590 + _1002;
    float _1012 = -_842;
    float _1014 = _928 * _1012;
    float _1016 = _944 * _842;
    float _1018 = _956 * _842;
    float _1020 = fma(_1010, 0.3499999940395355224609375, _998);
    float _1022 = fma(_1010, 0.75, _1000);
    float _1024 = _944 * _894;
    float _1026 = fma(_954, _840, _1014);
    float _1028 = _1020 * 0.15915493667125701904296875;
    float _1030 = fma(_1010, 0.4000000059604644775390625, _1006);
    float _1032 = fma(_958, _890, _1024);
    float _1034 = fma(_1010, 0.85000002384185791015625, _1008);
    float _1036 = _1022 * 0.15915493667125701904296875;
    float _1038 = fma(_962, _840, _1018);
    float _1040 = -_894;
    float _1042 = _928 * _1040;
    float _1044 = _1030 * 0.15915493667125701904296875;
    float _1046 = _1034 * 0.15915493667125701904296875;
    float _1048 = _956 * _894;
    float _1050 = _1028 * 6.283185482025146484375;
    float _1052 = sin(_1050);
    float _1054 = fma(_954, _890, _1042);
    float _1056 = fma(_958, _840, _1016);
    float _1058 = fma(_962, _890, _1048);
    float _1060 = _980 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1062 = _980 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1064 = fma(_950, _898, _1054);
    float _1066 = fma(_970, _898, _1032);
    float _1068 = _1036 * 6.283185482025146484375;
    float _1070 = sin(_1068);
    float _1072 = fma(_978, _898, _1058);
    float _1074 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1060);
    float _1076 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1062);
    out.m_61.x = _992;
    out.m_61.y = _624;
    out.m_61.z = _940;
    out.m_61.w = _1004;
    float _1078 = fma(_950, _844, _1026);
    float _1080 = fma(_970, _844, _1056);
    float _1082 = fma(_988, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1076);
    float _1084 = _1044 * 6.283185482025146484375;
    float _1086 = sin(_1084);
    float _1088 = _486 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1090 = fma(_988, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1074);
    float _1092 = fma(_978, _844, _1038);
    float _1094 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1096 = _1088 + _1082;
    float _1098 = _596 + _1090;
    float _1100 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.17000000178813934326171875;
    float _1102 = _1046 * 6.283185482025146484375;
    float _1104 = sin(_1102);
    float _1106 = _1052 + _1070;
    float _1108 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.300000011920928955078125;
    float _1110 = fma(_1096, 0.550000011920928955078125, _1100);
    float _1112 = _944 * _990;
    float _1114 = fma(_1106, 0.00999999977648258209228515625, _1096);
    float _1116 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1118 = _1110 * 0.15915493667125701904296875;
    float _1120 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1122 = _1080 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1124 = -_990;
    float _1126 = _928 * _1124;
    float _1128 = _1118 * 6.283185482025146484375;
    float _1130 = sin(_1128);
    float _1132 = fma(_1064, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1116);
    float _1134 = fma(_958, _938, _1112);
    float _1136 = fma(_1064, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1094);
    float _1138 = fma(_1064, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1120);
    float _1140 = _1086 + _1104;
    float _1142 = fma(_954, _938, _1126);
    float _1144 = _956 * _990;
    float _1146 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1132);
    float _1148 = fma(_1140, 0.00999999977648258209228515625, _1098);
    float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1152 = _1114 + _1150;
    float _1154 = fma(_1098, 0.89999997615814208984375, _1108);
    float _1156 = _1080 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1160 = _1148 + _1158;
    float _1162 = _1152 * _1152;
    float _1164 = _1154 * 0.15915493667125701904296875;
    float _1166 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1156);
    float _1168 = _1130 * 0.20999999344348907470703125;
    float _1170 = fma(_1160, _1160, _1162);
    float _1172 = _1080 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1174 = fma(_970, _996, _1134);
    float _1176 = _1164 * 6.283185482025146484375;
    float _1178 = sin(_1176);
    float _1180 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1136);
    float _1182 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1172);
    float _1184 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1122);
    float _1186 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1138);
    float _1188 = fma(_1092, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1166);
    float _1190 = fma(_1092, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1182);
    float _1192 = fma(_1092, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1184);
    float _1194 = sqrt(_1170);
    float _1196 = fma(_962, _938, _1144);
    float _1198 = fma(_950, _996, _1142);
    float _1200 = _1174 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1202 = _1174 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1204 = _1174 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_63.x = _1146;
    out.m_63.y = _1180;
    out.m_63.z = _1186;
    float _1206 = fma(_978, _996, _1196);
    float _1208 = fma(_1178, 0.300000011920928955078125, _1168);
    float _1210 = fma(_1198, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1200);
    float _1212 = fma(_1198, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1204);
    out.m_65.x = _1188;
    out.m_65.y = _1190;
    out.m_65.z = _1192;
    float _1214 = _1010 + _1208;
    bool _1216 = _1194 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1218 = fma(_1198, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1202);
    float _1220 = fma(_1206, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1210);
    float _1222 = fma(_1206, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1212);
    float _1224 = fma(_1206, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1218);
    float _1226 = _1188;
    float _1228 = _1192;
    float _1230 = _1190;
    if (!_1216)
    {
        _1226 = _1148;
    }
    float _1232 = _1226;
    float _1234 = _1232;
    if (!_1216)
    {
        _1228 = _1114;
    }
    float _1236 = _1228;
    float _1238 = _1236;
    if (!_1216)
    {
        _1230 = _1214;
    }
    float _1240 = _1230;
    bool _1242 = !_1216;
    float _1244 = _1240;
    if (!_1242)
    {
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1250 = _1194 + _1248;
        float _1252 = _1214 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1254 = rsqrt(_1170);
        float _1256 = _1250 * _1246;
        float _1258 = _1256 * 0.15915493667125701904296875;
        float _1260 = _1258 * 6.283185482025146484375;
        float _1262 = cos(_1260);
        float _1264 = _1258 * 6.283185482025146484375;
        float _1266 = sin(_1264);
        float _1268 = _1262 + (-1.0);
        float _1270 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1272 = fma(_1266, _1252, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1274 = fma(_1214, _1262, _1270);
        float _1276 = _1254 * _1272;
        float _1278 = fma(_1160, _1276, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1280 = fma(_1152, _1276, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1244 = _1274;
        _1234 = _1278;
        _1238 = _1280;
    }
    float _1282 = _1244;
    float _1284 = _1234;
    float _1286 = _1238;
    float _1288 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1294 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1296 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1288);
    float _1298 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1290);
    float _1300 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1292);
    float _1302 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1294);
    float _1304 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1296);
    float _1306 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1298);
    float _1308 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1300);
    out.m_67.x = _1220;
    out.m_67.y = _1224;
    out.m_67.z = _1222;
    float _1310 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1312 = _1306 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1314 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1302);
    float _1316 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1318 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1320 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1322 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    out.m_69.x = _1284;
    out.m_69.y = _1282;
    out.m_69.z = _1286;
    float _1324 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1318);
    float _1326 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1320);
    float _1328 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1330 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1332 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1324);
    float _1334 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1326);
    float _1336 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1328);
    float _1338 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1330);
    float _1340 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1332);
    float _1342 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1336);
    float _1344 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1338);
    float _1346 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1334);
    float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1350 = _1340 + _1348;
    float _1352 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1342);
    float _1354 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1344);
    out.m_33.x = 1.0;
    out.m_71.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1352;
    out.gl_Position.y = _1354;
    out.gl_Position.z = _1350;
    out.gl_Position.w = _1346;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

