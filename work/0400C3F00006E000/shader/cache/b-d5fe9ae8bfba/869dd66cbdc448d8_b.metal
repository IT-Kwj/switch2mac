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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_49 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_73 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_57 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_41 [[attribute(6)]];
    float4 m_45 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_39 [[attribute(9)]];
    float4 m_43 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1336 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_32.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    float _100 = as_type<float>(_92);
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    if (!_96)
    {
        out.m_35.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1506 = as_type<float>(_108);
        out.gl_Position.z = _1506;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_37.w;
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
        float _130 = float(_92);
        _100 = _130;
    }
    float _132 = _100;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_35.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1576 = as_type<float>(_146);
        out.gl_Position.z = _1576;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_39.y;
    float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _152 = in.m_41.y;
    int _154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _156 = _154 != 0;
    int _158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _160 = _158 != 0;
    float _162 = in.m_41.w;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _166 = _164 != 0;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _172 = _170 != 0;
    float _174 = in.m_41.z;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _178 = _176 != 0;
    float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _182 = in.m_39.x;
    float _184 = in.m_41.x;
    float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _188 = in.m_43.z;
    float _190 = -_148;
    float _192 = _190 + 1.0;
    bool _194 = _152 > 0.5;
    float _196 = in.m_45.x;
    float _198 = in.m_45.y;
    float _200 = in.m_45.z;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _206 = log2(_204);
    int _208 = _194 ? as_type<int>(_192) : as_type<int>(_148);
    float _210 = in.m_43.w;
    bool _212 = _162 > 0.5;
    float _214 = _166 ? as_type<float>(_208) : _148;
    float _216 = in.m_32.x;
    float _218 = in.m_32.y;
    float _220 = in.m_32.z;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _224 = _222 != 0;
    int _226 = _212 ? as_type<int>(_192) : as_type<int>(_148);
    int _228 = as_type<int>(_162);
    float _230 = _148;
    bool _232 = _224;
    float _234 = _182;
    if (_160)
    {
        float _236 = -_182;
        float _238 = _236 + 1.0;
        _228 = as_type<int>(_238);
    }
    int _240 = _228;
    bool _242 = _174 > 0.5;
    int _244 = 0;
    if (_172)
    {
        float _246 = -_182;
        float _248 = _246 + 1.0;
        _244 = as_type<int>(_248);
    }
    int _250 = _244;
    float _252 = _224 ? as_type<float>(_226) : _148;
    float _254 = _184 * 2.0;
    if (_156)
    {
        float _256 = _242 ? _192 : _148;
        _230 = _256;
    }
    float _258 = _230;
    float _260 = _184 + _174;
    out.m_47.z = _188;
    if (_160)
    {
        bool _262 = _184 > 0.5;
        _232 = _262;
    }
    bool _264 = _232;
    float _266 = floor(_254);
    float _268 = _198 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _272 = _270 != 0;
    float _274 = _184 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _276 = 0.0;
    if (!_160)
    {
        _276 = _182;
    }
    float _278 = _276;
    float _280 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _282 = 0.0;
    float _284 = _278;
    if (!_172)
    {
        _282 = _182;
    }
    float _286 = _282;
    float _288 = -_168;
    float _290 = fma(_274, 2.0, _288);
    float _292 = _286;
    if (_160)
    {
        float _294 = _264 ? as_type<float>(_240) : _182;
        _284 = _294;
    }
    float _296 = _284;
    out.m_47.w = _210;
    if (_172)
    {
        float _298 = _242 ? as_type<float>(_250) : _182;
        _292 = _298;
    }
    float _300 = _292;
    float _302 = _218 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _306 = _304 != 0;
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _310 = _308 != 0;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _314 = _312 != 0;
    float _316 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = _218 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _320 = _218 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _328 = _322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _332 = _324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _334 = fma(_280, -2.0, _326);
    float _336 = _174 * 2.0;
    float _338 = _330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _342 = floor(_336);
    float _344 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[4].x, _302);
    out.m_49.x = _338;
    out.m_49.y = _328;
    out.m_49.z = _332;
    float _346 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[5].x, _318);
    float _348 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[6].x, _320);
    float _350 = _260 + (-1.0);
    int _352 = 0;
    float _354 = _344;
    float _356 = _220;
    if (_178)
    {
        float _358 = -_182;
        float _360 = _358 + 1.0;
        _352 = as_type<int>(_360);
    }
    int _362 = _352;
    float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _368 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_178)
    {
        float _370 = _194 ? as_type<float>(_362) : _182;
        _234 = _370;
    }
    float _372 = _234;
    float _374 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _376 = _340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _380 = in.m_43.x;
    float _382 = in.m_43.y;
    float _384 = _152 + _174;
    float _386 = _366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _388 = _378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _390 = _152 + _184;
    float _392 = _384 + (-1.0);
    bool _394 = _342 >= 0.0;
    bool _396 = isnan(_342);
    bool _398 = _394 || _396;
    bool _400 = isnan(0.0);
    bool _402 = _398 || _400;
    float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_51.x = _386;
    out.m_51.y = _376;
    out.m_51.z = _388;
    float _406 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _408 = _152 * 2.0;
    float _410 = _390 + (-1.0);
    float _412 = in.m_53.x;
    float _414 = in.m_53.y;
    float _416 = in.m_53.z;
    bool _418 = _342 > 0.0;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _422 = floor(_408);
    float _424 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _426 = _200 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _428 = _402 ? 0 : 1;
    bool _430 = _266 >= 0.0;
    bool _432 = isnan(_266);
    bool _434 = _430 || _432;
    bool _436 = isnan(0.0);
    bool _438 = _434 || _436;
    bool _440 = _266 > 0.0;
    float _442 = _382 * 6.283185482025146484375;
    int _444 = _438 ? 0 : 1;
    float _446 = _150 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _448 = _404 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _450 = fma(_380, 8.0, _442);
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _454 = fma(_252, _448, -0.5);
    bool _456 = _422 >= 0.0;
    bool _458 = isnan(_422);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    float _466 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.3300000131130218505859375, _450);
    float _468 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].w, _452);
    float _470 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _334);
    int _472 = _464 ? 0 : 1;
    float _474 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[4].z, _344);
    bool _476 = _422 > 0.0;
    float _478 = fma(_446, _214, -0.5);
    float _480 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _468);
    float _482 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[6].z, _348);
    float _484 = _478;
    if (!_272)
    {
        _354 = _152;
    }
    float _486 = _354;
    float _488 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[5].z, _346);
    float _490 = -_470;
    float _492 = fma(_480, _478, _490);
    float _494 = _414 * 0.20000000298023223876953125;
    float _496 = _466 * 0.15915493667125701904296875;
    float _498 = _486;
    if (_272)
    {
        _498 = _184;
    }
    float _500 = _498;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _504 = _494 * _494;
    if (_272)
    {
        _356 = _184;
    }
    float _506 = _356;
    float _508 = _180 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _510 = fma(_412, _412, _504);
    float _512 = _506;
    if (!_272)
    {
        _512 = _174;
    }
    float _514 = _512;
    float _516 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[83].z, _502);
    float _518 = _500 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _520 = fma(_416, _416, _510);
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _524 = _496 * 6.283185482025146484375;
    float _526 = sin(_524);
    float _528 = _514 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_272)
    {
        _484 = _174;
    }
    float _530 = _484;
    float _532 = -_202;
    float _534 = fma(_518, 2.0, _532);
    float _536 = _530;
    if (_272)
    {
        _536 = _152;
    }
    float _538 = _536;
    float _540 = -_522;
    float _542 = fma(_528, 2.0, _540);
    int _544 = ~_428;
    int _546 = _544 + 1;
    int _548 = _546 + 1;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _552 = rsqrt(_520);
    int _554 = _548;
    if (!_418)
    {
        int _556 = ~_428;
        int _558 = _556 + 1;
        _554 = _558;
    }
    int _560 = _554;
    float _562 = _364 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _564 = _186 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _566 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[83].w, _550);
    int _568 = ~_444;
    int _570 = _568 + 1;
    int _572 = _570 + 1;
    float _574 = fma(_562, _296, -0.5);
    bool _576 = !_310;
    int _578 = _576 ? 0 : 1;
    float _580 = fma(_564, _300, -0.5);
    bool _582 = !_306;
    float _584 = _582 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _586 = fma(_508, _258, -0.5);
    float _588 = _564;
    int _590 = _572;
    float _592 = _584;
    float _594 = _574;
    if (!_272)
    {
        _588 = _174;
    }
    float _596 = _588;
    float _598 = -_126;
    float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[76].x, _290);
    float _602 = _596;
    if (_272)
    {
        _602 = _152;
    }
    float _604 = _602;
    float _606 = -_126;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[81].x, _534);
    if (!_440)
    {
        int _610 = ~_444;
        int _612 = _610 + 1;
        _590 = _612;
    }
    int _614 = _590;
    float _616 = _552 * _526;
    int _618 = abs(_578);
    float _620 = _604 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _622 = abs(as_type<int>(_584));
    float _624 = _206 * _126;
    if (_272)
    {
        _592 = _152;
    }
    float _626 = _592;
    float _628 = fma(_620, -2.0, _420);
    float _630 = _626;
    if (!_272)
    {
        _630 = _184;
    }
    float _632 = _630;
    float _634 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _566);
    float _636 = float(_618);
    float _638 = exp2(_624);
    float _640 = float(_614);
    float _642 = _632 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _644 = _174 + (-0.5);
    float _646 = float(_622);
    float _648 = _636 * _640;
    float _650 = float(_560);
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _654 = in.m_55.x;
    float _656 = in.m_55.y;
    float _658 = in.m_55.z;
    int _660 = ~_472;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    float _666 = _474 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _668 = fma(_642, -2.0, _652);
    float _670 = _646 * _650;
    int _672 = _664;
    if (!_476)
    {
        int _674 = ~_472;
        int _676 = _674 + 1;
        _672 = _676;
    }
    int _678 = _672;
    float _680 = -_638;
    float _682 = _680 + 1.0;
    float _684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _688 = 1.0 + _686;
    float _690 = _488 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _694 = 1.0 / _688;
    bool _696 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _698 = isnan(1.0);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _704 = _700 || _702;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _708 = !_314;
    int _710 = _708 ? 0 : 1;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _714 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _716 = isnan(0.0);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _722 = _718 || _720;
    float _724 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[78].z, _692);
    int _726 = abs(_710);
    float _728 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _516);
    float _730 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _628);
    float _732 = _648 * (-2.0);
    float _734 = _152 + (-0.5);
    float _736 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[88].z, _706);
    float _738 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[88].w, _712);
    float _740 = fma(_732, _656, _656);
    float _742 = _722 ? _682 : 0.0;
    float _744 = fma(_406, _732, _406);
    float _746 = -_126;
    float _748 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[86].x, _542);
    float _750 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[196].y, _740);
    float _752 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _724);
    float _754 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _736);
    float _756 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _738);
    float _758 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _668);
    float _760 = float(_726);
    float _762 = _748;
    float _764 = _756;
    if (_704)
    {
        float _766 = _742 * _694;
        _128 = _766;
    }
    float _768 = _128;
    float _770 = float(_678);
    float _772 = _684 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _774 = _670 * (-2.0);
    float _776 = fma(_744, _768, _750);
    float _778 = fma(_772, _372, -0.5);
    float _780 = _760 * _770;
    float _782 = fma(_774, _654, _654);
    float _784 = _184 + (-0.5);
    float _786 = fma(_424, _774, _424);
    float _788 = _780 * (-2.0);
    float _790 = fma(_380, 0.5, 0.5);
    float _792 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[196].x, _782);
    float _794 = _616 * 0.01200000010430812835693359375;
    float _796 = fma(_788, _658, _658);
    float _798 = fma(_786, _768, _792);
    float _800 = _790 * _794;
    float _802 = fma(_368, _788, _368);
    float _804 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[196].z, _796);
    float _806 = _798 * 0.15915493667125701904296875;
    float _808 = fma(_494, _800, _414);
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _812 = fma(_412, _800, _412);
    float _814 = fma(_802, _768, _804);
    float _816 = fma(_416, _800, _416);
    float _818 = _810 * _808;
    float _820 = in.m_57.x;
    float _822 = in.m_57.y;
    float _824 = in.m_57.z;
    float _826 = _810 * _812;
    float _828 = fma(_728, _580, _608);
    float _830 = _810 * _816;
    bool _832 = _818 != 0.0;
    bool _834 = isnan(_818);
    bool _836 = _832 || _834;
    bool _838 = isnan(0.0);
    bool _840 = _836 || _838;
    float _842 = _268 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _826);
    float _846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _818);
    bool _848 = _826 == 0.0;
    bool _850 = !_840;
    bool _852 = _848 && _850;
    float _854 = _776 * 0.15915493667125701904296875;
    float _856 = _814 * 0.15915493667125701904296875;
    float _858 = -_730;
    float _860 = fma(_634, _454, _858);
    bool _862 = _830 == 0.0;
    bool _864 = _862 && _852;
    float _866 = _844 * _374;
    float _868 = _846 * _842;
    float _870 = _854 * 6.283185482025146484375;
    float _872 = sin(_870);
    float _874 = in.m_59.x;
    float _876 = in.m_59.y;
    float _878 = in.m_59.z;
    float _880 = in.m_59.w;
    float _882 = _426 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _884 = fma(_752, _574, _600);
    float _886 = fma(_754, _778, _748);
    float _888 = -_758;
    float _890 = fma(_756, _586, _888);
    float _892 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _830);
    float _894 = _854 * 6.283185482025146484375;
    float _896 = cos(_894);
    float _898 = _806;
    float _900 = _820;
    if (_864)
    {
        _594 = _820;
    }
    float _902 = _594;
    float _904 = _892 * _882;
    float _906 = _902;
    if (_864)
    {
        _762 = _824;
    }
    float _908 = _762;
    float _910 = _806 * 6.283185482025146484375;
    float _912 = cos(_910);
    float _914 = _856 * 6.283185482025146484375;
    float _916 = cos(_914);
    float _918 = _806 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = _912 * _896;
    float _924 = _912 * _872;
    float _926 = _856 * 6.283185482025146484375;
    float _928 = sin(_926);
    float _930 = _912;
    float _932 = _908;
    if (_864)
    {
        _898 = _822;
    }
    float _934 = _898;
    float _936 = _912 * _916;
    float _938 = _934;
    if (_864)
    {
        _930 = _902;
    }
    float _940 = _930;
    float _942 = _896 * _916;
    float _944 = _940;
    if (_864)
    {
        _764 = _934;
    }
    float _946 = _764;
    float _948 = _946;
    if (!_864)
    {
        _938 = _822;
    }
    float _950 = _938;
    float _952 = _920 * _872;
    if (!_864)
    {
        _906 = _820;
    }
    float _954 = _906;
    float _956 = _920 * _896;
    if (_864)
    {
        _900 = _908;
    }
    float _958 = _900;
    float _960 = _920 * _916;
    float _962 = _958;
    if (!_864)
    {
        _932 = _824;
    }
    float _964 = _932;
    float _966 = _872 * _916;
    if (!_864)
    {
        float _968 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[17].y, _950);
        _948 = _968;
    }
    float _970 = _948;
    float _972 = fma(_928, _922, _952);
    float _974 = fma(_928, _952, _922);
    float _976 = _936 * _868;
    float _978 = _936 * _876;
    if (!_864)
    {
        float _980 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[17].y, _964);
        _962 = _980;
    }
    float _982 = _962;
    float _984 = -_924;
    float _986 = fma(_928, _956, _984);
    if (!_864)
    {
        float _988 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[17].y, _954);
        _944 = _988;
    }
    float _990 = _944;
    float _992 = -_868;
    float _994 = _928 * _992;
    float _996 = _960 * _868;
    float _998 = -_956;
    float _1000 = fma(_928, _924, _998);
    float _1002 = -_876;
    float _1004 = _928 * _1002;
    float _1006 = fma(_972, _866, _976);
    float _1008 = _878 * _954;
    float _1010 = fma(_972, _874, _978);
    float _1012 = _960 * _876;
    float _1014 = _874 * _950;
    float _1016 = fma(_942, _866, _994);
    float _1018 = fma(_986, _866, _996);
    float _1020 = fma(_942, _874, _1004);
    float _1022 = fma(_1000, _904, _1006);
    float _1024 = -_1008;
    float _1026 = fma(_874, _964, _1024);
    float _1028 = fma(_986, _874, _1012);
    float _1030 = _876 * _964;
    float _1032 = -_1014;
    float _1034 = fma(_876, _954, _1032);
    float _1036 = fma(_966, _904, _1016);
    float _1038 = fma(_974, _904, _1018);
    float _1040 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1042 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1044 = -_1030;
    float _1046 = fma(_878, _950, _1044);
    float _1048 = -_970;
    float _1050 = _928 * _1048;
    float _1052 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1040);
    float _1054 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1042);
    float _1056 = _482 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1058 = fma(_966, _878, _1020);
    float _1060 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1052);
    float _1062 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1054);
    float _1064 = fma(_942, _990, _1050);
    float _1066 = fma(_1000, _878, _1010);
    float _1068 = _666 + _1060;
    float _1070 = _1056 + _1062;
    float _1072 = fma(_974, _878, _1028);
    float _1074 = _936 * _970;
    float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1078 = _1068 + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1082 = _1070 + _1080;
    float _1084 = _960 * _970;
    float _1086 = fma(_972, _990, _1074);
    float _1088 = _1078 * _1078;
    float _1090 = _1082 * _1082;
    float _1092 = fma(_986, _990, _1084);
    float _1094 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1096 = _1026 * _880;
    float _1098 = _1088 + _1090;
    float _1100 = _1046 * _880;
    float _1102 = fma(_1000, _982, _1086);
    float _1104 = -_1096;
    float _1106 = _928 * _1104;
    float _1108 = sqrt(_1098);
    float _1110 = _936 * _1096;
    float _1112 = _960 * _1096;
    float _1114 = _1034 * _880;
    float _1116 = fma(_966, _982, _1064);
    float _1118 = fma(_974, _982, _1092);
    float _1120 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1094);
    float _1122 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1124 = fma(_942, _1100, _1106);
    float _1126 = fma(_972, _1100, _1110);
    float _1128 = fma(_986, _1100, _1112);
    float _1130 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1132 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1134 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1136 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1120);
    float _1138 = fma(_1058, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1122);
    bool _1140 = _1108 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1142 = fma(_966, _1114, _1124);
    float _1144 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1130);
    float _1146 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1132);
    float _1148 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1134);
    float _1150 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1152 = _690 + _1136;
    float _1154 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1156 = fma(_1000, _1114, _1126);
    float _1158 = fma(_1058, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1150);
    float _1160 = fma(_974, _1114, _1128);
    float _1162 = fma(_1058, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1154);
    float _1164 = _1132;
    float _1166 = _1088;
    float _1168 = _1090;
    float _1170 = _1068;
    float _1172 = _1070;
    float _1174 = _1118;
    if (!_1140)
    {
        _1164 = _1152;
    }
    float _1176 = _1164;
    bool _1178 = !_1140;
    float _1180 = _1176;
    if (!_1178)
    {
        float _1182 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1186 = _1108 + _1184;
        float _1188 = rsqrt(_1098);
        float _1190 = _1186 * _1182;
        float _1192 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1194 = _1190 * 0.15915493667125701904296875;
        float _1196 = _1194 * 6.283185482025146484375;
        float _1198 = sin(_1196);
        float _1200 = _1194 * 6.283185482025146484375;
        float _1202 = cos(_1200);
        float _1204 = fma(_1198, _1192, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1206 = _1188 * _1204;
        float _1208 = _1202 + (-1.0);
        float _1210 = fma(_1078, _1206, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1212 = fma(_1082, _1206, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1214 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1218 = _1210 + _1216;
        float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1222 = _1212 + _1220;
        float _1224 = fma(_1152, _1202, _1214);
        float _1226 = _1218 * _1218;
        float _1228 = _1222 * _1222;
        _1180 = _1224;
        _1166 = _1226;
        _1168 = _1228;
        _1170 = _1210;
        _1172 = _1212;
    }
    float _1230 = _1180;
    float _1232 = _1166;
    float _1234 = _1168;
    float _1236 = _1170;
    float _1238 = _1172;
    float _1240 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1242 = _1230 + _1240;
    float _1244 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1246 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1248 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1250 = fma(_1242, _1242, _1232);
    float _1252 = fma(_1142, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1244);
    float _1254 = fma(_1142, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1246);
    float _1256 = fma(_1142, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1248);
    float _1258 = _1250 + _1234;
    float _1260 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1146);
    float _1262 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1138);
    float _1264 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1158);
    float _1266 = _828 + 0.5;
    float _1268 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1162);
    float _1270 = sqrt(_1258);
    float _1272 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1144);
    float _1274 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1148);
    float _1276 = _492 + 0.5;
    float _1278 = _886 + 0.5;
    float _1280 = _884 + 0.5;
    float _1282 = _860 + 0.5;
    float _1284 = _890 + 0.5;
    float _1286 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1252);
    float _1288 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1254);
    float _1290 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1256);
    out.m_61.x = _1280;
    out.m_61.y = _1276;
    out.m_61.z = _1266;
    out.m_61.w = _1282;
    out.m_63.x = _1278;
    out.m_63.y = _1284;
    bool _1292 = _1270 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1294 = isnan(_1270);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1300 = _1296 || _1298;
    out.m_65.x = _1262;
    out.m_65.y = _1264;
    out.m_65.z = _1268;
    out.m_67.x = _1272;
    out.m_67.y = _1260;
    out.m_67.z = _1274;
    out.m_69.x = _1286;
    out.m_69.y = _1288;
    out.m_69.z = _1290;
    if (!_1300)
    {
        _1174 = 1.0;
    }
    float _1302 = _1174;
    bool _1304 = !_1300;
    float _1306 = _1302;
    if (!_1304)
    {
        bool _1308 = _1270 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1310 = isnan(_1270);
        bool _1312 = _1308 || _1310;
        bool _1314 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1316 = _1312 || _1314;
        if (!_1316)
        {
            float _1318 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1320 = _1270 + _1318;
            float _1322 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1324 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1322;
            float _1326 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1328 = _1326 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1330 = 1.0 / _1324;
            float _1332 = _1320 * _1330;
            float _1334 = fma(_1332, _1328, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1306 = _1334;
            _1336 = true;
        }
        else
        {
            bool _1338 = _1270 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1340 = isnan(_1270);
            bool _1342 = _1338 || _1340;
            bool _1344 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1346 = _1342 || _1344;
            if (!_1346)
            {
                float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1350 = _1270 + _1348;
                float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1354 = _1352 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1358 = _1356 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1360 = 1.0 / _1354;
                float _1362 = _1350 * _1360;
                float _1364 = fma(_1362, _1358, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1306 = _1364;
                _1336 = true;
            }
            else
            {
                _1306 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1336 = false;
    float _1366 = _1306;
    float _1368 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1370 = _1230 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1374 = _1236 + _1372;
    out.m_35.x = 1.0;
    float _1376 = fma(_1370, _1366, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1380 = _1238 + _1378;
    float _1382 = fma(_1374, _1366, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1384 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1386 = fma(_1380, _1366, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1390 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1392 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1384);
    float _1394 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1396 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1388);
    float _1398 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1390);
    float _1400 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1392);
    float _1402 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1394);
    float _1404 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1396);
    float _1406 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1398);
    float _1408 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1410 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1414 = _1406 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1416 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1418 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1420 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1422 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1424 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1416);
    float _1426 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1418);
    float _1428 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1420);
    float _1430 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1422);
    float _1432 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1434 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1424);
    float _1436 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1426);
    float _1438 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1428);
    float _1440 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1430);
    float _1442 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1434);
    float _1444 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1436);
    float _1446 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1438);
    float _1448 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1440);
    out.m_71.x = _1382;
    out.m_71.y = _1376;
    out.m_71.z = _1386;
    out.m_73.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1444;
    out.gl_Position.y = _1442;
    out.gl_Position.z = _1446;
    out.gl_Position.w = _1448;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1336 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_32.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    float _100 = as_type<float>(_92);
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    if (!_96)
    {
        out.m_35.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1506 = as_type<float>(_108);
        out.gl_Position.z = _1506;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_37.w;
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
        float _130 = float(_92);
        _100 = _130;
    }
    float _132 = _100;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_35.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1576 = as_type<float>(_146);
        out.gl_Position.z = _1576;
    }
    if (_138)
    {
        return out;
    }
    float _148 = in.m_39.y;
    float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _152 = in.m_41.y;
    int _154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _156 = _154 != 0;
    int _158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _160 = _158 != 0;
    float _162 = in.m_41.w;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _166 = _164 != 0;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _172 = _170 != 0;
    float _174 = in.m_41.z;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _178 = _176 != 0;
    float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _182 = in.m_39.x;
    float _184 = in.m_41.x;
    float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _188 = in.m_43.z;
    float _190 = -_148;
    float _192 = _190 + 1.0;
    bool _194 = _152 > 0.5;
    float _196 = in.m_45.x;
    float _198 = in.m_45.y;
    float _200 = in.m_45.z;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _206 = log2(_204);
    int _208 = _194 ? as_type<int>(_192) : as_type<int>(_148);
    float _210 = in.m_43.w;
    bool _212 = _162 > 0.5;
    float _214 = _166 ? as_type<float>(_208) : _148;
    float _216 = in.m_32.x;
    float _218 = in.m_32.y;
    float _220 = in.m_32.z;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _224 = _222 != 0;
    int _226 = _212 ? as_type<int>(_192) : as_type<int>(_148);
    int _228 = as_type<int>(_162);
    float _230 = _148;
    bool _232 = _224;
    float _234 = _182;
    if (_160)
    {
        float _236 = -_182;
        float _238 = _236 + 1.0;
        _228 = as_type<int>(_238);
    }
    int _240 = _228;
    bool _242 = _174 > 0.5;
    int _244 = 0;
    if (_172)
    {
        float _246 = -_182;
        float _248 = _246 + 1.0;
        _244 = as_type<int>(_248);
    }
    int _250 = _244;
    float _252 = _224 ? as_type<float>(_226) : _148;
    float _254 = _184 * 2.0;
    if (_156)
    {
        float _256 = _242 ? _192 : _148;
        _230 = _256;
    }
    float _258 = _230;
    float _260 = _184 + _174;
    out.m_47.z = _188;
    if (_160)
    {
        bool _262 = _184 > 0.5;
        _232 = _262;
    }
    bool _264 = _232;
    float _266 = floor(_254);
    float _268 = _198 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _272 = _270 != 0;
    float _274 = _184 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _276 = 0.0;
    if (!_160)
    {
        _276 = _182;
    }
    float _278 = _276;
    float _280 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _282 = 0.0;
    float _284 = _278;
    if (!_172)
    {
        _282 = _182;
    }
    float _286 = _282;
    float _288 = -_168;
    float _290 = fma(_274, 2.0, _288);
    float _292 = _286;
    if (_160)
    {
        float _294 = _264 ? as_type<float>(_240) : _182;
        _284 = _294;
    }
    float _296 = _284;
    out.m_47.w = _210;
    if (_172)
    {
        float _298 = _242 ? as_type<float>(_250) : _182;
        _292 = _298;
    }
    float _300 = _292;
    float _302 = _218 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _306 = _304 != 0;
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _310 = _308 != 0;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _314 = _312 != 0;
    float _316 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = _218 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _320 = _218 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _328 = _322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _332 = _324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _334 = fma(_280, -2.0, _326);
    float _336 = _174 * 2.0;
    float _338 = _330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _342 = floor(_336);
    float _344 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[4].x, _302);
    out.m_49.x = _338;
    out.m_49.y = _328;
    out.m_49.z = _332;
    float _346 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[5].x, _318);
    float _348 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[6].x, _320);
    float _350 = _260 + (-1.0);
    int _352 = 0;
    float _354 = _344;
    float _356 = _220;
    if (_178)
    {
        float _358 = -_182;
        float _360 = _358 + 1.0;
        _352 = as_type<int>(_360);
    }
    int _362 = _352;
    float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _368 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_178)
    {
        float _370 = _194 ? as_type<float>(_362) : _182;
        _234 = _370;
    }
    float _372 = _234;
    float _374 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _376 = _340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _380 = in.m_43.x;
    float _382 = in.m_43.y;
    float _384 = _152 + _174;
    float _386 = _366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _388 = _378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _390 = _152 + _184;
    float _392 = _384 + (-1.0);
    bool _394 = _342 >= 0.0;
    bool _396 = isnan(_342);
    bool _398 = _394 || _396;
    bool _400 = isnan(0.0);
    bool _402 = _398 || _400;
    float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_51.x = _386;
    out.m_51.y = _376;
    out.m_51.z = _388;
    float _406 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _408 = _152 * 2.0;
    float _410 = _390 + (-1.0);
    float _412 = in.m_53.x;
    float _414 = in.m_53.y;
    float _416 = in.m_53.z;
    bool _418 = _342 > 0.0;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _422 = floor(_408);
    float _424 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _426 = _200 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _428 = _402 ? 0 : 1;
    bool _430 = _266 >= 0.0;
    bool _432 = isnan(_266);
    bool _434 = _430 || _432;
    bool _436 = isnan(0.0);
    bool _438 = _434 || _436;
    bool _440 = _266 > 0.0;
    float _442 = _382 * 6.283185482025146484375;
    int _444 = _438 ? 0 : 1;
    float _446 = _150 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _448 = _404 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _450 = fma(_380, 8.0, _442);
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _454 = fma(_252, _448, -0.5);
    bool _456 = _422 >= 0.0;
    bool _458 = isnan(_422);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    float _466 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.3300000131130218505859375, _450);
    float _468 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].w, _452);
    float _470 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _334);
    int _472 = _464 ? 0 : 1;
    float _474 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[4].z, _344);
    bool _476 = _422 > 0.0;
    float _478 = fma(_446, _214, -0.5);
    float _480 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _468);
    float _482 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[6].z, _348);
    float _484 = _478;
    if (!_272)
    {
        _354 = _152;
    }
    float _486 = _354;
    float _488 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[5].z, _346);
    float _490 = -_470;
    float _492 = fma(_480, _478, _490);
    float _494 = _414 * 0.20000000298023223876953125;
    float _496 = _466 * 0.15915493667125701904296875;
    float _498 = _486;
    if (_272)
    {
        _498 = _184;
    }
    float _500 = _498;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _504 = _494 * _494;
    if (_272)
    {
        _356 = _184;
    }
    float _506 = _356;
    float _508 = _180 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _510 = fma(_412, _412, _504);
    float _512 = _506;
    if (!_272)
    {
        _512 = _174;
    }
    float _514 = _512;
    float _516 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[83].z, _502);
    float _518 = _500 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _520 = fma(_416, _416, _510);
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _524 = _496 * 6.283185482025146484375;
    float _526 = sin(_524);
    float _528 = _514 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_272)
    {
        _484 = _174;
    }
    float _530 = _484;
    float _532 = -_202;
    float _534 = fma(_518, 2.0, _532);
    float _536 = _530;
    if (_272)
    {
        _536 = _152;
    }
    float _538 = _536;
    float _540 = -_522;
    float _542 = fma(_528, 2.0, _540);
    int _544 = ~_428;
    int _546 = _544 + 1;
    int _548 = _546 + 1;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _552 = rsqrt(_520);
    int _554 = _548;
    if (!_418)
    {
        int _556 = ~_428;
        int _558 = _556 + 1;
        _554 = _558;
    }
    int _560 = _554;
    float _562 = _364 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _564 = _186 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _566 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[83].w, _550);
    int _568 = ~_444;
    int _570 = _568 + 1;
    int _572 = _570 + 1;
    float _574 = fma(_562, _296, -0.5);
    bool _576 = !_310;
    int _578 = _576 ? 0 : 1;
    float _580 = fma(_564, _300, -0.5);
    bool _582 = !_306;
    float _584 = _582 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _586 = fma(_508, _258, -0.5);
    float _588 = _564;
    int _590 = _572;
    float _592 = _584;
    float _594 = _574;
    if (!_272)
    {
        _588 = _174;
    }
    float _596 = _588;
    float _598 = -_126;
    float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[76].x, _290);
    float _602 = _596;
    if (_272)
    {
        _602 = _152;
    }
    float _604 = _602;
    float _606 = -_126;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[81].x, _534);
    if (!_440)
    {
        int _610 = ~_444;
        int _612 = _610 + 1;
        _590 = _612;
    }
    int _614 = _590;
    float _616 = _552 * _526;
    int _618 = abs(_578);
    float _620 = _604 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _622 = abs(as_type<int>(_584));
    float _624 = _206 * _126;
    if (_272)
    {
        _592 = _152;
    }
    float _626 = _592;
    float _628 = fma(_620, -2.0, _420);
    float _630 = _626;
    if (!_272)
    {
        _630 = _184;
    }
    float _632 = _630;
    float _634 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _566);
    float _636 = float(_618);
    float _638 = exp2(_624);
    float _640 = float(_614);
    float _642 = _632 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _644 = _174 + (-0.5);
    float _646 = float(_622);
    float _648 = _636 * _640;
    float _650 = float(_560);
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _654 = in.m_55.x;
    float _656 = in.m_55.y;
    float _658 = in.m_55.z;
    int _660 = ~_472;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    float _666 = _474 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _668 = fma(_642, -2.0, _652);
    float _670 = _646 * _650;
    int _672 = _664;
    if (!_476)
    {
        int _674 = ~_472;
        int _676 = _674 + 1;
        _672 = _676;
    }
    int _678 = _672;
    float _680 = -_638;
    float _682 = _680 + 1.0;
    float _684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _688 = 1.0 + _686;
    float _690 = _488 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _694 = 1.0 / _688;
    bool _696 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _698 = isnan(1.0);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _704 = _700 || _702;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _708 = !_314;
    int _710 = _708 ? 0 : 1;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _714 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _716 = isnan(0.0);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _722 = _718 || _720;
    float _724 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[78].z, _692);
    int _726 = abs(_710);
    float _728 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _516);
    float _730 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _628);
    float _732 = _648 * (-2.0);
    float _734 = _152 + (-0.5);
    float _736 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[88].z, _706);
    float _738 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[88].w, _712);
    float _740 = fma(_732, _656, _656);
    float _742 = _722 ? _682 : 0.0;
    float _744 = fma(_406, _732, _406);
    float _746 = -_126;
    float _748 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[86].x, _542);
    float _750 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[196].y, _740);
    float _752 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _724);
    float _754 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _736);
    float _756 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _738);
    float _758 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _668);
    float _760 = float(_726);
    float _762 = _748;
    float _764 = _756;
    if (_704)
    {
        float _766 = _742 * _694;
        _128 = _766;
    }
    float _768 = _128;
    float _770 = float(_678);
    float _772 = _684 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _774 = _670 * (-2.0);
    float _776 = fma(_744, _768, _750);
    float _778 = fma(_772, _372, -0.5);
    float _780 = _760 * _770;
    float _782 = fma(_774, _654, _654);
    float _784 = _184 + (-0.5);
    float _786 = fma(_424, _774, _424);
    float _788 = _780 * (-2.0);
    float _790 = fma(_380, 0.5, 0.5);
    float _792 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[196].x, _782);
    float _794 = _616 * 0.01200000010430812835693359375;
    float _796 = fma(_788, _658, _658);
    float _798 = fma(_786, _768, _792);
    float _800 = _790 * _794;
    float _802 = fma(_368, _788, _368);
    float _804 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[196].z, _796);
    float _806 = _798 * 0.15915493667125701904296875;
    float _808 = fma(_494, _800, _414);
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _812 = fma(_412, _800, _412);
    float _814 = fma(_802, _768, _804);
    float _816 = fma(_416, _800, _416);
    float _818 = _810 * _808;
    float _820 = in.m_57.x;
    float _822 = in.m_57.y;
    float _824 = in.m_57.z;
    float _826 = _810 * _812;
    float _828 = fma(_728, _580, _608);
    float _830 = _810 * _816;
    bool _832 = _818 != 0.0;
    bool _834 = isnan(_818);
    bool _836 = _832 || _834;
    bool _838 = isnan(0.0);
    bool _840 = _836 || _838;
    float _842 = _268 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _826);
    float _846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _818);
    bool _848 = _826 == 0.0;
    bool _850 = !_840;
    bool _852 = _848 && _850;
    float _854 = _776 * 0.15915493667125701904296875;
    float _856 = _814 * 0.15915493667125701904296875;
    float _858 = -_730;
    float _860 = fma(_634, _454, _858);
    bool _862 = _830 == 0.0;
    bool _864 = _862 && _852;
    float _866 = _844 * _374;
    float _868 = _846 * _842;
    float _870 = _854 * 6.283185482025146484375;
    float _872 = sin(_870);
    float _874 = in.m_59.x;
    float _876 = in.m_59.y;
    float _878 = in.m_59.z;
    float _880 = in.m_59.w;
    float _882 = _426 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _884 = fma(_752, _574, _600);
    float _886 = fma(_754, _778, _748);
    float _888 = -_758;
    float _890 = fma(_756, _586, _888);
    float _892 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _830);
    float _894 = _854 * 6.283185482025146484375;
    float _896 = cos(_894);
    float _898 = _806;
    float _900 = _820;
    if (_864)
    {
        _594 = _820;
    }
    float _902 = _594;
    float _904 = _892 * _882;
    float _906 = _902;
    if (_864)
    {
        _762 = _824;
    }
    float _908 = _762;
    float _910 = _806 * 6.283185482025146484375;
    float _912 = cos(_910);
    float _914 = _856 * 6.283185482025146484375;
    float _916 = cos(_914);
    float _918 = _806 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = _912 * _896;
    float _924 = _912 * _872;
    float _926 = _856 * 6.283185482025146484375;
    float _928 = sin(_926);
    float _930 = _912;
    float _932 = _908;
    if (_864)
    {
        _898 = _822;
    }
    float _934 = _898;
    float _936 = _912 * _916;
    float _938 = _934;
    if (_864)
    {
        _930 = _902;
    }
    float _940 = _930;
    float _942 = _896 * _916;
    float _944 = _940;
    if (_864)
    {
        _764 = _934;
    }
    float _946 = _764;
    float _948 = _946;
    if (!_864)
    {
        _938 = _822;
    }
    float _950 = _938;
    float _952 = _920 * _872;
    if (!_864)
    {
        _906 = _820;
    }
    float _954 = _906;
    float _956 = _920 * _896;
    if (_864)
    {
        _900 = _908;
    }
    float _958 = _900;
    float _960 = _920 * _916;
    float _962 = _958;
    if (!_864)
    {
        _932 = _824;
    }
    float _964 = _932;
    float _966 = _872 * _916;
    if (!_864)
    {
        float _968 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[17].y, _950);
        _948 = _968;
    }
    float _970 = _948;
    float _972 = fma(_928, _922, _952);
    float _974 = fma(_928, _952, _922);
    float _976 = _936 * _868;
    float _978 = _936 * _876;
    if (!_864)
    {
        float _980 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[17].y, _964);
        _962 = _980;
    }
    float _982 = _962;
    float _984 = -_924;
    float _986 = fma(_928, _956, _984);
    if (!_864)
    {
        float _988 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[17].y, _954);
        _944 = _988;
    }
    float _990 = _944;
    float _992 = -_868;
    float _994 = _928 * _992;
    float _996 = _960 * _868;
    float _998 = -_956;
    float _1000 = fma(_928, _924, _998);
    float _1002 = -_876;
    float _1004 = _928 * _1002;
    float _1006 = fma(_972, _866, _976);
    float _1008 = _878 * _954;
    float _1010 = fma(_972, _874, _978);
    float _1012 = _960 * _876;
    float _1014 = _874 * _950;
    float _1016 = fma(_942, _866, _994);
    float _1018 = fma(_986, _866, _996);
    float _1020 = fma(_942, _874, _1004);
    float _1022 = fma(_1000, _904, _1006);
    float _1024 = -_1008;
    float _1026 = fma(_874, _964, _1024);
    float _1028 = fma(_986, _874, _1012);
    float _1030 = _876 * _964;
    float _1032 = -_1014;
    float _1034 = fma(_876, _954, _1032);
    float _1036 = fma(_966, _904, _1016);
    float _1038 = fma(_974, _904, _1018);
    float _1040 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1042 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1044 = -_1030;
    float _1046 = fma(_878, _950, _1044);
    float _1048 = -_970;
    float _1050 = _928 * _1048;
    float _1052 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1040);
    float _1054 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1042);
    float _1056 = _482 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1058 = fma(_966, _878, _1020);
    float _1060 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1052);
    float _1062 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1054);
    float _1064 = fma(_942, _990, _1050);
    float _1066 = fma(_1000, _878, _1010);
    float _1068 = _666 + _1060;
    float _1070 = _1056 + _1062;
    float _1072 = fma(_974, _878, _1028);
    float _1074 = _936 * _970;
    float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1078 = _1068 + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1082 = _1070 + _1080;
    float _1084 = _960 * _970;
    float _1086 = fma(_972, _990, _1074);
    float _1088 = _1078 * _1078;
    float _1090 = _1082 * _1082;
    float _1092 = fma(_986, _990, _1084);
    float _1094 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1096 = _1026 * _880;
    float _1098 = _1088 + _1090;
    float _1100 = _1046 * _880;
    float _1102 = fma(_1000, _982, _1086);
    float _1104 = -_1096;
    float _1106 = _928 * _1104;
    float _1108 = sqrt(_1098);
    float _1110 = _936 * _1096;
    float _1112 = _960 * _1096;
    float _1114 = _1034 * _880;
    float _1116 = fma(_966, _982, _1064);
    float _1118 = fma(_974, _982, _1092);
    float _1120 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1094);
    float _1122 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1124 = fma(_942, _1100, _1106);
    float _1126 = fma(_972, _1100, _1110);
    float _1128 = fma(_986, _1100, _1112);
    float _1130 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1132 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1134 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1136 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1120);
    float _1138 = fma(_1058, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1122);
    bool _1140 = _1108 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1142 = fma(_966, _1114, _1124);
    float _1144 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1130);
    float _1146 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1132);
    float _1148 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1134);
    float _1150 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1152 = _690 + _1136;
    float _1154 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1156 = fma(_1000, _1114, _1126);
    float _1158 = fma(_1058, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1150);
    float _1160 = fma(_974, _1114, _1128);
    float _1162 = fma(_1058, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1154);
    float _1164 = _1132;
    float _1166 = _1088;
    float _1168 = _1090;
    float _1170 = _1068;
    float _1172 = _1070;
    float _1174 = _1118;
    if (!_1140)
    {
        _1164 = _1152;
    }
    float _1176 = _1164;
    bool _1178 = !_1140;
    float _1180 = _1176;
    if (!_1178)
    {
        float _1182 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1186 = _1108 + _1184;
        float _1188 = rsqrt(_1098);
        float _1190 = _1186 * _1182;
        float _1192 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1194 = _1190 * 0.15915493667125701904296875;
        float _1196 = _1194 * 6.283185482025146484375;
        float _1198 = sin(_1196);
        float _1200 = _1194 * 6.283185482025146484375;
        float _1202 = cos(_1200);
        float _1204 = fma(_1198, _1192, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1206 = _1188 * _1204;
        float _1208 = _1202 + (-1.0);
        float _1210 = fma(_1078, _1206, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1212 = fma(_1082, _1206, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1214 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1218 = _1210 + _1216;
        float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1222 = _1212 + _1220;
        float _1224 = fma(_1152, _1202, _1214);
        float _1226 = _1218 * _1218;
        float _1228 = _1222 * _1222;
        _1180 = _1224;
        _1166 = _1226;
        _1168 = _1228;
        _1170 = _1210;
        _1172 = _1212;
    }
    float _1230 = _1180;
    float _1232 = _1166;
    float _1234 = _1168;
    float _1236 = _1170;
    float _1238 = _1172;
    float _1240 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1242 = _1230 + _1240;
    float _1244 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1246 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1248 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1250 = fma(_1242, _1242, _1232);
    float _1252 = fma(_1142, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1244);
    float _1254 = fma(_1142, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1246);
    float _1256 = fma(_1142, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1248);
    float _1258 = _1250 + _1234;
    float _1260 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1146);
    float _1262 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1138);
    float _1264 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1158);
    float _1266 = _828 + 0.5;
    float _1268 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1162);
    float _1270 = sqrt(_1258);
    float _1272 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1144);
    float _1274 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1148);
    float _1276 = _492 + 0.5;
    float _1278 = _886 + 0.5;
    float _1280 = _884 + 0.5;
    float _1282 = _860 + 0.5;
    float _1284 = _890 + 0.5;
    float _1286 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1252);
    float _1288 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1254);
    float _1290 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1256);
    out.m_61.x = _1280;
    out.m_61.y = _1276;
    out.m_61.z = _1266;
    out.m_61.w = _1282;
    out.m_63.x = _1278;
    out.m_63.y = _1284;
    bool _1292 = _1270 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1294 = isnan(_1270);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1300 = _1296 || _1298;
    out.m_65.x = _1262;
    out.m_65.y = _1264;
    out.m_65.z = _1268;
    out.m_67.x = _1272;
    out.m_67.y = _1260;
    out.m_67.z = _1274;
    out.m_69.x = _1286;
    out.m_69.y = _1288;
    out.m_69.z = _1290;
    if (!_1300)
    {
        _1174 = 1.0;
    }
    float _1302 = _1174;
    bool _1304 = !_1300;
    float _1306 = _1302;
    if (!_1304)
    {
        bool _1308 = _1270 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1310 = isnan(_1270);
        bool _1312 = _1308 || _1310;
        bool _1314 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1316 = _1312 || _1314;
        if (!_1316)
        {
            float _1318 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1320 = _1270 + _1318;
            float _1322 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1324 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1322;
            float _1326 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1328 = _1326 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1330 = 1.0 / _1324;
            float _1332 = _1320 * _1330;
            float _1334 = fma(_1332, _1328, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1306 = _1334;
            _1336 = true;
        }
        else
        {
            bool _1338 = _1270 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1340 = isnan(_1270);
            bool _1342 = _1338 || _1340;
            bool _1344 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1346 = _1342 || _1344;
            if (!_1346)
            {
                float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1350 = _1270 + _1348;
                float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1354 = _1352 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1358 = _1356 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1360 = 1.0 / _1354;
                float _1362 = _1350 * _1360;
                float _1364 = fma(_1362, _1358, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1306 = _1364;
                _1336 = true;
            }
            else
            {
                _1306 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1336 = false;
    float _1366 = _1306;
    float _1368 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1370 = _1230 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1374 = _1236 + _1372;
    out.m_35.x = 1.0;
    float _1376 = fma(_1370, _1366, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1380 = _1238 + _1378;
    float _1382 = fma(_1374, _1366, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1384 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1386 = fma(_1380, _1366, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1390 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1392 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1384);
    float _1394 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1396 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1388);
    float _1398 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1390);
    float _1400 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1392);
    float _1402 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1394);
    float _1404 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1396);
    float _1406 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1398);
    float _1408 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1410 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1414 = _1406 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1416 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1418 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1420 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1422 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1424 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1416);
    float _1426 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1418);
    float _1428 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1420);
    float _1430 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1422);
    float _1432 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1434 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1424);
    float _1436 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1426);
    float _1438 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1428);
    float _1440 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1430);
    float _1442 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1434);
    float _1444 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1436);
    float _1446 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1438);
    float _1448 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1440);
    out.m_71.x = _1382;
    out.m_71.y = _1376;
    out.m_71.z = _1386;
    out.m_73.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1444;
    out.gl_Position.y = _1442;
    out.gl_Position.z = _1446;
    out.gl_Position.w = _1448;
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
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1336 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_32.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    float _100 = as_type<float>(_92);
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    if (!_96)
    {
        out.m_35.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1506 = as_type<float>(_108);
        out.gl_Position.z = _1506;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_37.w;
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
        float _130 = float(_92);
        _100 = _130;
    }
    float _132 = _100;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_35.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1576 = as_type<float>(_146);
        out.gl_Position.z = _1576;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_39.y;
    float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _152 = in.m_41.y;
    int _154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _156 = _154 != 0;
    int _158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _160 = _158 != 0;
    float _162 = in.m_41.w;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _166 = _164 != 0;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _172 = _170 != 0;
    float _174 = in.m_41.z;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _178 = _176 != 0;
    float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _182 = in.m_39.x;
    float _184 = in.m_41.x;
    float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _188 = in.m_43.z;
    float _190 = -_148;
    float _192 = _190 + 1.0;
    bool _194 = _152 > 0.5;
    float _196 = in.m_45.x;
    float _198 = in.m_45.y;
    float _200 = in.m_45.z;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _206 = log2(_204);
    int _208 = _194 ? as_type<int>(_192) : as_type<int>(_148);
    float _210 = in.m_43.w;
    bool _212 = _162 > 0.5;
    float _214 = _166 ? as_type<float>(_208) : _148;
    float _216 = in.m_32.x;
    float _218 = in.m_32.y;
    float _220 = in.m_32.z;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _224 = _222 != 0;
    int _226 = _212 ? as_type<int>(_192) : as_type<int>(_148);
    int _228 = as_type<int>(_162);
    float _230 = _148;
    bool _232 = _224;
    float _234 = _182;
    if (_160)
    {
        float _236 = -_182;
        float _238 = _236 + 1.0;
        _228 = as_type<int>(_238);
    }
    int _240 = _228;
    bool _242 = _174 > 0.5;
    int _244 = 0;
    if (_172)
    {
        float _246 = -_182;
        float _248 = _246 + 1.0;
        _244 = as_type<int>(_248);
    }
    int _250 = _244;
    float _252 = _224 ? as_type<float>(_226) : _148;
    float _254 = _184 * 2.0;
    if (_156)
    {
        float _256 = _242 ? _192 : _148;
        _230 = _256;
    }
    float _258 = _230;
    float _260 = _184 + _174;
    out.m_47.z = _188;
    if (_160)
    {
        bool _262 = _184 > 0.5;
        _232 = _262;
    }
    bool _264 = _232;
    float _266 = floor(_254);
    float _268 = _198 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _272 = _270 != 0;
    float _274 = _184 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _276 = 0.0;
    if (!_160)
    {
        _276 = _182;
    }
    float _278 = _276;
    float _280 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _282 = 0.0;
    float _284 = _278;
    if (!_172)
    {
        _282 = _182;
    }
    float _286 = _282;
    float _288 = -_168;
    float _290 = fma(_274, 2.0, _288);
    float _292 = _286;
    if (_160)
    {
        float _294 = _264 ? as_type<float>(_240) : _182;
        _284 = _294;
    }
    float _296 = _284;
    out.m_47.w = _210;
    if (_172)
    {
        float _298 = _242 ? as_type<float>(_250) : _182;
        _292 = _298;
    }
    float _300 = _292;
    float _302 = _218 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _306 = _304 != 0;
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _310 = _308 != 0;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _314 = _312 != 0;
    float _316 = _196 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = _218 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _320 = _218 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _328 = _322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _332 = _324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _334 = fma(_280, -2.0, _326);
    float _336 = _174 * 2.0;
    float _338 = _330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _342 = floor(_336);
    float _344 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[4].x, _302);
    out.m_49.x = _338;
    out.m_49.y = _328;
    out.m_49.z = _332;
    float _346 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[5].x, _318);
    float _348 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[6].x, _320);
    float _350 = _260 + (-1.0);
    int _352 = 0;
    float _354 = _344;
    float _356 = _220;
    if (_178)
    {
        float _358 = -_182;
        float _360 = _358 + 1.0;
        _352 = as_type<int>(_360);
    }
    int _362 = _352;
    float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _368 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_178)
    {
        float _370 = _194 ? as_type<float>(_362) : _182;
        _234 = _370;
    }
    float _372 = _234;
    float _374 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _376 = _340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _380 = in.m_43.x;
    float _382 = in.m_43.y;
    float _384 = _152 + _174;
    float _386 = _366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _388 = _378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _390 = _152 + _184;
    float _392 = _384 + (-1.0);
    bool _394 = _342 >= 0.0;
    bool _396 = isnan(_342);
    bool _398 = _394 || _396;
    bool _400 = isnan(0.0);
    bool _402 = _398 || _400;
    float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_51.x = _386;
    out.m_51.y = _376;
    out.m_51.z = _388;
    float _406 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _408 = _152 * 2.0;
    float _410 = _390 + (-1.0);
    float _412 = in.m_53.x;
    float _414 = in.m_53.y;
    float _416 = in.m_53.z;
    bool _418 = _342 > 0.0;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _422 = floor(_408);
    float _424 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _426 = _200 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _428 = _402 ? 0 : 1;
    bool _430 = _266 >= 0.0;
    bool _432 = isnan(_266);
    bool _434 = _430 || _432;
    bool _436 = isnan(0.0);
    bool _438 = _434 || _436;
    bool _440 = _266 > 0.0;
    float _442 = _382 * 6.283185482025146484375;
    int _444 = _438 ? 0 : 1;
    float _446 = _150 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _448 = _404 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _450 = fma(_380, 8.0, _442);
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _454 = fma(_252, _448, -0.5);
    bool _456 = _422 >= 0.0;
    bool _458 = isnan(_422);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    float _466 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.3300000131130218505859375, _450);
    float _468 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].w, _452);
    float _470 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _334);
    int _472 = _464 ? 0 : 1;
    float _474 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[4].z, _344);
    bool _476 = _422 > 0.0;
    float _478 = fma(_446, _214, -0.5);
    float _480 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _468);
    float _482 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[6].z, _348);
    float _484 = _478;
    if (!_272)
    {
        _354 = _152;
    }
    float _486 = _354;
    float _488 = fma(_220, (*spvDescriptorSet0.vp_c10)._m0[5].z, _346);
    float _490 = -_470;
    float _492 = fma(_480, _478, _490);
    float _494 = _414 * 0.20000000298023223876953125;
    float _496 = _466 * 0.15915493667125701904296875;
    float _498 = _486;
    if (_272)
    {
        _498 = _184;
    }
    float _500 = _498;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _504 = _494 * _494;
    if (_272)
    {
        _356 = _184;
    }
    float _506 = _356;
    float _508 = _180 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _510 = fma(_412, _412, _504);
    float _512 = _506;
    if (!_272)
    {
        _512 = _174;
    }
    float _514 = _512;
    float _516 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[83].z, _502);
    float _518 = _500 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _520 = fma(_416, _416, _510);
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _524 = _496 * 6.283185482025146484375;
    float _526 = sin(_524);
    float _528 = _514 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_272)
    {
        _484 = _174;
    }
    float _530 = _484;
    float _532 = -_202;
    float _534 = fma(_518, 2.0, _532);
    float _536 = _530;
    if (_272)
    {
        _536 = _152;
    }
    float _538 = _536;
    float _540 = -_522;
    float _542 = fma(_528, 2.0, _540);
    int _544 = ~_428;
    int _546 = _544 + 1;
    int _548 = _546 + 1;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _552 = rsqrt(_520);
    int _554 = _548;
    if (!_418)
    {
        int _556 = ~_428;
        int _558 = _556 + 1;
        _554 = _558;
    }
    int _560 = _554;
    float _562 = _364 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _564 = _186 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _566 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[83].w, _550);
    int _568 = ~_444;
    int _570 = _568 + 1;
    int _572 = _570 + 1;
    float _574 = fma(_562, _296, -0.5);
    bool _576 = !_310;
    int _578 = _576 ? 0 : 1;
    float _580 = fma(_564, _300, -0.5);
    bool _582 = !_306;
    float _584 = _582 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _586 = fma(_508, _258, -0.5);
    float _588 = _564;
    int _590 = _572;
    float _592 = _584;
    float _594 = _574;
    if (!_272)
    {
        _588 = _174;
    }
    float _596 = _588;
    float _598 = -_126;
    float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[76].x, _290);
    float _602 = _596;
    if (_272)
    {
        _602 = _152;
    }
    float _604 = _602;
    float _606 = -_126;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[81].x, _534);
    if (!_440)
    {
        int _610 = ~_444;
        int _612 = _610 + 1;
        _590 = _612;
    }
    int _614 = _590;
    float _616 = _552 * _526;
    int _618 = abs(_578);
    float _620 = _604 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _622 = abs(as_type<int>(_584));
    float _624 = _206 * _126;
    if (_272)
    {
        _592 = _152;
    }
    float _626 = _592;
    float _628 = fma(_620, -2.0, _420);
    float _630 = _626;
    if (!_272)
    {
        _630 = _184;
    }
    float _632 = _630;
    float _634 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _566);
    float _636 = float(_618);
    float _638 = exp2(_624);
    float _640 = float(_614);
    float _642 = _632 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _644 = _174 + (-0.5);
    float _646 = float(_622);
    float _648 = _636 * _640;
    float _650 = float(_560);
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _654 = in.m_55.x;
    float _656 = in.m_55.y;
    float _658 = in.m_55.z;
    int _660 = ~_472;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    float _666 = _474 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _668 = fma(_642, -2.0, _652);
    float _670 = _646 * _650;
    int _672 = _664;
    if (!_476)
    {
        int _674 = ~_472;
        int _676 = _674 + 1;
        _672 = _676;
    }
    int _678 = _672;
    float _680 = -_638;
    float _682 = _680 + 1.0;
    float _684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _688 = 1.0 + _686;
    float _690 = _488 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _694 = 1.0 / _688;
    bool _696 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _698 = isnan(1.0);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _704 = _700 || _702;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _708 = !_314;
    int _710 = _708 ? 0 : 1;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _714 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _716 = isnan(0.0);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _722 = _718 || _720;
    float _724 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[78].z, _692);
    int _726 = abs(_710);
    float _728 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _516);
    float _730 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _628);
    float _732 = _648 * (-2.0);
    float _734 = _152 + (-0.5);
    float _736 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[88].z, _706);
    float _738 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[88].w, _712);
    float _740 = fma(_732, _656, _656);
    float _742 = _722 ? _682 : 0.0;
    float _744 = fma(_406, _732, _406);
    float _746 = -_126;
    float _748 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[86].x, _542);
    float _750 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[196].y, _740);
    float _752 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _724);
    float _754 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _736);
    float _756 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _738);
    float _758 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _668);
    float _760 = float(_726);
    float _762 = _748;
    float _764 = _756;
    if (_704)
    {
        float _766 = _742 * _694;
        _128 = _766;
    }
    float _768 = _128;
    float _770 = float(_678);
    float _772 = _684 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _774 = _670 * (-2.0);
    float _776 = fma(_744, _768, _750);
    float _778 = fma(_772, _372, -0.5);
    float _780 = _760 * _770;
    float _782 = fma(_774, _654, _654);
    float _784 = _184 + (-0.5);
    float _786 = fma(_424, _774, _424);
    float _788 = _780 * (-2.0);
    float _790 = fma(_380, 0.5, 0.5);
    float _792 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[196].x, _782);
    float _794 = _616 * 0.01200000010430812835693359375;
    float _796 = fma(_788, _658, _658);
    float _798 = fma(_786, _768, _792);
    float _800 = _790 * _794;
    float _802 = fma(_368, _788, _368);
    float _804 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[196].z, _796);
    float _806 = _798 * 0.15915493667125701904296875;
    float _808 = fma(_494, _800, _414);
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _812 = fma(_412, _800, _412);
    float _814 = fma(_802, _768, _804);
    float _816 = fma(_416, _800, _416);
    float _818 = _810 * _808;
    float _820 = in.m_57.x;
    float _822 = in.m_57.y;
    float _824 = in.m_57.z;
    float _826 = _810 * _812;
    float _828 = fma(_728, _580, _608);
    float _830 = _810 * _816;
    bool _832 = _818 != 0.0;
    bool _834 = isnan(_818);
    bool _836 = _832 || _834;
    bool _838 = isnan(0.0);
    bool _840 = _836 || _838;
    float _842 = _268 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _826);
    float _846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _818);
    bool _848 = _826 == 0.0;
    bool _850 = !_840;
    bool _852 = _848 && _850;
    float _854 = _776 * 0.15915493667125701904296875;
    float _856 = _814 * 0.15915493667125701904296875;
    float _858 = -_730;
    float _860 = fma(_634, _454, _858);
    bool _862 = _830 == 0.0;
    bool _864 = _862 && _852;
    float _866 = _844 * _374;
    float _868 = _846 * _842;
    float _870 = _854 * 6.283185482025146484375;
    float _872 = sin(_870);
    float _874 = in.m_59.x;
    float _876 = in.m_59.y;
    float _878 = in.m_59.z;
    float _880 = in.m_59.w;
    float _882 = _426 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _884 = fma(_752, _574, _600);
    float _886 = fma(_754, _778, _748);
    float _888 = -_758;
    float _890 = fma(_756, _586, _888);
    float _892 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _830);
    float _894 = _854 * 6.283185482025146484375;
    float _896 = cos(_894);
    float _898 = _806;
    float _900 = _820;
    if (_864)
    {
        _594 = _820;
    }
    float _902 = _594;
    float _904 = _892 * _882;
    float _906 = _902;
    if (_864)
    {
        _762 = _824;
    }
    float _908 = _762;
    float _910 = _806 * 6.283185482025146484375;
    float _912 = cos(_910);
    float _914 = _856 * 6.283185482025146484375;
    float _916 = cos(_914);
    float _918 = _806 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = _912 * _896;
    float _924 = _912 * _872;
    float _926 = _856 * 6.283185482025146484375;
    float _928 = sin(_926);
    float _930 = _912;
    float _932 = _908;
    if (_864)
    {
        _898 = _822;
    }
    float _934 = _898;
    float _936 = _912 * _916;
    float _938 = _934;
    if (_864)
    {
        _930 = _902;
    }
    float _940 = _930;
    float _942 = _896 * _916;
    float _944 = _940;
    if (_864)
    {
        _764 = _934;
    }
    float _946 = _764;
    float _948 = _946;
    if (!_864)
    {
        _938 = _822;
    }
    float _950 = _938;
    float _952 = _920 * _872;
    if (!_864)
    {
        _906 = _820;
    }
    float _954 = _906;
    float _956 = _920 * _896;
    if (_864)
    {
        _900 = _908;
    }
    float _958 = _900;
    float _960 = _920 * _916;
    float _962 = _958;
    if (!_864)
    {
        _932 = _824;
    }
    float _964 = _932;
    float _966 = _872 * _916;
    if (!_864)
    {
        float _968 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[17].y, _950);
        _948 = _968;
    }
    float _970 = _948;
    float _972 = fma(_928, _922, _952);
    float _974 = fma(_928, _952, _922);
    float _976 = _936 * _868;
    float _978 = _936 * _876;
    if (!_864)
    {
        float _980 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[17].y, _964);
        _962 = _980;
    }
    float _982 = _962;
    float _984 = -_924;
    float _986 = fma(_928, _956, _984);
    if (!_864)
    {
        float _988 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[17].y, _954);
        _944 = _988;
    }
    float _990 = _944;
    float _992 = -_868;
    float _994 = _928 * _992;
    float _996 = _960 * _868;
    float _998 = -_956;
    float _1000 = fma(_928, _924, _998);
    float _1002 = -_876;
    float _1004 = _928 * _1002;
    float _1006 = fma(_972, _866, _976);
    float _1008 = _878 * _954;
    float _1010 = fma(_972, _874, _978);
    float _1012 = _960 * _876;
    float _1014 = _874 * _950;
    float _1016 = fma(_942, _866, _994);
    float _1018 = fma(_986, _866, _996);
    float _1020 = fma(_942, _874, _1004);
    float _1022 = fma(_1000, _904, _1006);
    float _1024 = -_1008;
    float _1026 = fma(_874, _964, _1024);
    float _1028 = fma(_986, _874, _1012);
    float _1030 = _876 * _964;
    float _1032 = -_1014;
    float _1034 = fma(_876, _954, _1032);
    float _1036 = fma(_966, _904, _1016);
    float _1038 = fma(_974, _904, _1018);
    float _1040 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1042 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1044 = -_1030;
    float _1046 = fma(_878, _950, _1044);
    float _1048 = -_970;
    float _1050 = _928 * _1048;
    float _1052 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1040);
    float _1054 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1042);
    float _1056 = _482 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1058 = fma(_966, _878, _1020);
    float _1060 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1052);
    float _1062 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1054);
    float _1064 = fma(_942, _990, _1050);
    float _1066 = fma(_1000, _878, _1010);
    float _1068 = _666 + _1060;
    float _1070 = _1056 + _1062;
    float _1072 = fma(_974, _878, _1028);
    float _1074 = _936 * _970;
    float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1078 = _1068 + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1082 = _1070 + _1080;
    float _1084 = _960 * _970;
    float _1086 = fma(_972, _990, _1074);
    float _1088 = _1078 * _1078;
    float _1090 = _1082 * _1082;
    float _1092 = fma(_986, _990, _1084);
    float _1094 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1096 = _1026 * _880;
    float _1098 = _1088 + _1090;
    float _1100 = _1046 * _880;
    float _1102 = fma(_1000, _982, _1086);
    float _1104 = -_1096;
    float _1106 = _928 * _1104;
    float _1108 = sqrt(_1098);
    float _1110 = _936 * _1096;
    float _1112 = _960 * _1096;
    float _1114 = _1034 * _880;
    float _1116 = fma(_966, _982, _1064);
    float _1118 = fma(_974, _982, _1092);
    float _1120 = fma(_1036, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1094);
    float _1122 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1124 = fma(_942, _1100, _1106);
    float _1126 = fma(_972, _1100, _1110);
    float _1128 = fma(_986, _1100, _1112);
    float _1130 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1132 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1134 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1136 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1120);
    float _1138 = fma(_1058, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1122);
    bool _1140 = _1108 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1142 = fma(_966, _1114, _1124);
    float _1144 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1130);
    float _1146 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1132);
    float _1148 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1134);
    float _1150 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1152 = _690 + _1136;
    float _1154 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1156 = fma(_1000, _1114, _1126);
    float _1158 = fma(_1058, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1150);
    float _1160 = fma(_974, _1114, _1128);
    float _1162 = fma(_1058, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1154);
    float _1164 = _1132;
    float _1166 = _1088;
    float _1168 = _1090;
    float _1170 = _1068;
    float _1172 = _1070;
    float _1174 = _1118;
    if (!_1140)
    {
        _1164 = _1152;
    }
    float _1176 = _1164;
    bool _1178 = !_1140;
    float _1180 = _1176;
    if (!_1178)
    {
        float _1182 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1186 = _1108 + _1184;
        float _1188 = rsqrt(_1098);
        float _1190 = _1186 * _1182;
        float _1192 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1194 = _1190 * 0.15915493667125701904296875;
        float _1196 = _1194 * 6.283185482025146484375;
        float _1198 = sin(_1196);
        float _1200 = _1194 * 6.283185482025146484375;
        float _1202 = cos(_1200);
        float _1204 = fma(_1198, _1192, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1206 = _1188 * _1204;
        float _1208 = _1202 + (-1.0);
        float _1210 = fma(_1078, _1206, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1212 = fma(_1082, _1206, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1214 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1218 = _1210 + _1216;
        float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1222 = _1212 + _1220;
        float _1224 = fma(_1152, _1202, _1214);
        float _1226 = _1218 * _1218;
        float _1228 = _1222 * _1222;
        _1180 = _1224;
        _1166 = _1226;
        _1168 = _1228;
        _1170 = _1210;
        _1172 = _1212;
    }
    float _1230 = _1180;
    float _1232 = _1166;
    float _1234 = _1168;
    float _1236 = _1170;
    float _1238 = _1172;
    float _1240 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1242 = _1230 + _1240;
    float _1244 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1246 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1248 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1250 = fma(_1242, _1242, _1232);
    float _1252 = fma(_1142, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1244);
    float _1254 = fma(_1142, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1246);
    float _1256 = fma(_1142, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1248);
    float _1258 = _1250 + _1234;
    float _1260 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1146);
    float _1262 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1138);
    float _1264 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1158);
    float _1266 = _828 + 0.5;
    float _1268 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1162);
    float _1270 = sqrt(_1258);
    float _1272 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1144);
    float _1274 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1148);
    float _1276 = _492 + 0.5;
    float _1278 = _886 + 0.5;
    float _1280 = _884 + 0.5;
    float _1282 = _860 + 0.5;
    float _1284 = _890 + 0.5;
    float _1286 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1252);
    float _1288 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1254);
    float _1290 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1256);
    out.m_61.x = _1280;
    out.m_61.y = _1276;
    out.m_61.z = _1266;
    out.m_61.w = _1282;
    out.m_63.x = _1278;
    out.m_63.y = _1284;
    bool _1292 = _1270 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1294 = isnan(_1270);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1300 = _1296 || _1298;
    out.m_65.x = _1262;
    out.m_65.y = _1264;
    out.m_65.z = _1268;
    out.m_67.x = _1272;
    out.m_67.y = _1260;
    out.m_67.z = _1274;
    out.m_69.x = _1286;
    out.m_69.y = _1288;
    out.m_69.z = _1290;
    if (!_1300)
    {
        _1174 = 1.0;
    }
    float _1302 = _1174;
    bool _1304 = !_1300;
    float _1306 = _1302;
    if (!_1304)
    {
        bool _1308 = _1270 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1310 = isnan(_1270);
        bool _1312 = _1308 || _1310;
        bool _1314 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1316 = _1312 || _1314;
        if (!_1316)
        {
            float _1318 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1320 = _1270 + _1318;
            float _1322 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1324 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1322;
            float _1326 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1328 = _1326 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1330 = 1.0 / _1324;
            float _1332 = _1320 * _1330;
            float _1334 = fma(_1332, _1328, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1306 = _1334;
            _1336 = true;
        }
        else
        {
            bool _1338 = _1270 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1340 = isnan(_1270);
            bool _1342 = _1338 || _1340;
            bool _1344 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1346 = _1342 || _1344;
            if (!_1346)
            {
                float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1350 = _1270 + _1348;
                float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1354 = _1352 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1358 = _1356 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1360 = 1.0 / _1354;
                float _1362 = _1350 * _1360;
                float _1364 = fma(_1362, _1358, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1306 = _1364;
                _1336 = true;
            }
            else
            {
                _1306 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1336 = false;
    float _1366 = _1306;
    float _1368 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1370 = _1230 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1374 = _1236 + _1372;
    out.m_35.x = 1.0;
    float _1376 = fma(_1370, _1366, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1380 = _1238 + _1378;
    float _1382 = fma(_1374, _1366, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1384 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1386 = fma(_1380, _1366, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1390 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1392 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1384);
    float _1394 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1396 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1388);
    float _1398 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1390);
    float _1400 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1392);
    float _1402 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1394);
    float _1404 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1396);
    float _1406 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1398);
    float _1408 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1410 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1414 = _1406 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1416 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1418 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1420 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1422 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1424 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1416);
    float _1426 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1418);
    float _1428 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1420);
    float _1430 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1422);
    float _1432 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1434 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1424);
    float _1436 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1426);
    float _1438 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1428);
    float _1440 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1430);
    float _1442 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1434);
    float _1444 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1436);
    float _1446 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1438);
    float _1448 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1440);
    out.m_71.x = _1382;
    out.m_71.y = _1376;
    out.m_71.z = _1386;
    out.m_73.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1444;
    out.gl_Position.y = _1442;
    out.gl_Position.z = _1446;
    out.gl_Position.w = _1448;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

