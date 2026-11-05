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
    float4 m_49 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
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
    float4 m_57 [[attribute(4)]];
    float4 m_45 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_37 [[attribute(9)]];
    float4 m_43 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_94)
    {
        out.m_33.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1509 = as_type<float>(_106);
        out.gl_Position.z = _1509;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_35.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = 0.0;
    float _130 = _124;
    if (_120)
    {
        float _132 = float(_90);
        _98 = _132;
    }
    float _134 = _98;
    bool _136 = _124 >= _134;
    bool _138 = !_120;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    int _146 = as_type<int>(_144);
    if (_140)
    {
        out.m_33.x = 0.0;
    }
    if (_140)
    {
        float _148 = _144 * 5.0;
        _108 = as_type<int>(_148);
    }
    int _150 = _108;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1581 = as_type<float>(_150);
        out.gl_Position.z = _1581;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_37.x;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _156 = in.m_39.x;
    int _158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _160 = _158 != 0;
    float _162 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _166 = _164 != 0;
    float _168 = in.m_39.z;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _172 = _170 != 0;
    float _174 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _178 = _176 != 0;
    float _180 = in.m_39.w;
    float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _184 = in.m_39.y;
    float _186 = in.m_37.y;
    float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _190 = _152;
    float _192 = _186;
    if (_160)
    {
        float _194 = -_152;
        float _196 = _194 + 1.0;
        _146 = as_type<int>(_196);
    }
    int _198 = _146;
    int _200 = 0;
    int _202 = _198;
    if (_166)
    {
        float _204 = -_152;
        float _206 = _204 + 1.0;
        _200 = as_type<int>(_206);
    }
    int _208 = _200;
    if (!_160)
    {
        _126 = _152;
    }
    float _210 = _126;
    float _212 = in.m_41.x;
    float _214 = in.m_41.y;
    float _216 = in.m_41.z;
    bool _218 = false;
    float _220 = _210;
    if (_160)
    {
        bool _222 = _156 > 0.5;
        _218 = _222;
    }
    bool _224 = _218;
    float _226 = _156 * 2.0;
    if (!_166)
    {
        _128 = _152;
    }
    float _228 = _128;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _232 = _168 > 0.5;
    float _234 = floor(_226);
    float _236 = _228;
    if (_160)
    {
        float _238 = _224 ? as_type<float>(_198) : _152;
        _220 = _238;
    }
    float _240 = _220;
    if (_172)
    {
        float _242 = -_152;
        float _244 = _242 + 1.0;
        _202 = as_type<int>(_244);
    }
    int _246 = _202;
    if (_166)
    {
        float _248 = _232 ? as_type<float>(_208) : _152;
        _236 = _248;
    }
    float _250 = _236;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _254 = _180 > 0.5;
    float _256 = _182 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _258 = _184 > 0.5;
    float _260 = _184 + _168;
    float _262 = _184 * 2.0;
    if (_172)
    {
        float _264 = _258 ? as_type<float>(_246) : _152;
        _190 = _264;
    }
    float _266 = _190;
    float _268 = _260 + (-1.0);
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _272 = _270 != 0;
    float _274 = _156 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _276 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _280 = _278 != 0;
    float _282 = -_174;
    float _284 = fma(_274, 2.0, _282);
    float _286 = _184 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _292 = _290 != 0;
    float _294 = _168 * 2.0;
    float _296 = _212 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = fma(_286, -2.0, _288);
    float _300 = _156 + _168;
    float _302 = floor(_294);
    float _304 = _184 + _156;
    float _306 = _214 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _308 = _300 + (-1.0);
    float _310 = in.m_43.x;
    float _312 = in.m_43.y;
    float _314 = _304 + (-1.0);
    float _316 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _298);
    float _318 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _320 = floor(_262);
    float _322 = -_186;
    float _324 = _322 + 1.0;
    float _326 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _328 = _216 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _330 = _188 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _332 = _258 ? as_type<int>(_324) : as_type<int>(_186);
    int _334 = _254 ? as_type<int>(_324) : as_type<int>(_186);
    float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _338 = _178 ? as_type<float>(_332) : _186;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _342 = _280 ? as_type<float>(_334) : _186;
    float _344 = in.m_45.x;
    float _346 = in.m_45.y;
    float _348 = in.m_45.z;
    bool _350 = _302 > 0.0;
    bool _352 = _302 >= 0.0;
    bool _354 = isnan(_302);
    bool _356 = _352 || _354;
    bool _358 = isnan(0.0);
    bool _360 = _356 || _358;
    float _362 = _312 * 6.283185482025146484375;
    float _364 = _318;
    float _366 = _328;
    if (_292)
    {
        float _368 = _232 ? _324 : _186;
        _192 = _368;
    }
    float _370 = _192;
    float _372 = _154 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _374 = _320 > 0.0;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _378 = _320 >= 0.0;
    bool _380 = isnan(_320);
    bool _382 = _378 || _380;
    bool _384 = isnan(0.0);
    bool _386 = _382 || _384;
    float _388 = fma(_372, _338, -0.5);
    float _390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _392 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[78].w, _376);
    float _394 = fma(_310, 8.0, _362);
    bool _396 = _234 > 0.0;
    float _398 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _392);
    bool _400 = _234 >= 0.0;
    bool _402 = isnan(_234);
    bool _404 = _400 || _402;
    bool _406 = isnan(0.0);
    bool _408 = _404 || _406;
    float _410 = _336 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _412 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.3300000131130218505859375, _394);
    float _414 = -_316;
    float _416 = fma(_398, _388, _414);
    float _418 = _392;
    float _420 = _398;
    if (_272)
    {
        _418 = _156;
    }
    float _422 = _418;
    float _424 = _346 * 0.20000000298023223876953125;
    float _426 = fma(_342, _410, -0.5);
    float _428 = _412 * 0.15915493667125701904296875;
    float _430 = _422;
    if (!_272)
    {
        _430 = _168;
    }
    float _432 = _430;
    float _434 = _424 * _424;
    float _436 = _390 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _438 = _428 * 6.283185482025146484375;
    float _440 = sin(_438);
    float _442 = _432;
    float _444 = _440;
    if (!_272)
    {
        _420 = _184;
    }
    float _446 = _420;
    float _448 = fma(_344, _344, _434);
    float _450 = fma(_436, _370, -0.5);
    int _452 = _360 ? 0 : 1;
    float _454 = fma(_348, _348, _448);
    bool _456 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _460 = _456 || _458;
    bool _462 = isnan(1.0);
    bool _464 = _460 || _462;
    float _466 = _432 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _468 = _446;
    float _470 = as_type<float>(_452);
    if (_272)
    {
        _468 = _156;
    }
    float _472 = _468;
    float _474 = _408 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _476 = rsqrt(_454);
    float _478 = -_230;
    float _480 = fma(_466, 2.0, _478);
    float _482 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[83].z, _252);
    int _484 = _386 ? 0 : 1;
    float _486 = _472 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _488 = _474;
    if (!_272)
    {
        _442 = _168;
    }
    float _490 = _442;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _494 = ~as_type<int>(_474);
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    float _500 = -_340;
    float _502 = fma(_486, 2.0, _500);
    float _504 = _490;
    int _506 = _498;
    if (_272)
    {
        _504 = _184;
    }
    float _508 = _504;
    if (!_396)
    {
        int _510 = ~as_type<int>(_474);
        int _512 = _510 + 1;
        _506 = _512;
    }
    int _514 = _506;
    if (!_464)
    {
        float _516 = _162 * _162;
        float _518 = _516 * 0.5;
        _488 = _518;
    }
    float _520 = _488;
    int _522 = ~_484;
    int _524 = _522 + 1;
    int _526 = _524 + 1;
    float _528 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[83].w, _492);
    int _530 = _526;
    float _532 = _520;
    if (!_374)
    {
        int _534 = ~_484;
        int _536 = _534 + 1;
        _530 = _536;
    }
    int _538 = _530;
    float _540 = _476 * _440;
    int _542 = ~_452;
    int _544 = _542 + 1;
    int _546 = _544 + 1;
    int _548 = _546;
    if (!_464)
    {
        float _550 = _520 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _532 = _550;
    }
    float _552 = _532;
    float _554 = _552;
    if (!_350)
    {
        int _556 = ~_452;
        int _558 = _556 + 1;
        _548 = _558;
    }
    int _560 = _548;
    if (!_464)
    {
        _444 = _162;
    }
    float _562 = _444;
    bool _564 = !_464;
    float _566 = _562;
    if (!_564)
    {
        float _568 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _570 = log2(_568);
        float _572 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _574 = _572 + 1.0;
        float _576 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _578 = _162 * _570;
        float _580 = 1.0 / _574;
        float _582 = _576 * 0.693147182464599609375;
        float _584 = exp2(_578);
        float _586 = 1.0 / _582;
        float _588 = _584 + (-1.0);
        float _590 = -_588;
        float _592 = fma(_590, _586, _162);
        float _594 = _592 * _580;
        float _596 = _594 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _470 = _584;
        _554 = _596;
    }
    float _598 = _470;
    float _600 = _554;
    bool _602 = !_464;
    float _604 = _598;
    if (!_602)
    {
        float _606 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _608 = log2(_606);
        float _610 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _612 = _610 + 1.0;
        float _614 = 1.0 / _612;
        float _616 = _162 * _608;
        float _618 = exp2(_616);
        float _620 = -_618;
        float _622 = _620 + 1.0;
        float _624 = _622 * _614;
        _604 = _614;
        _566 = _624;
    }
    float _626 = _604;
    float _628 = _566;
    float _630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _632 = fma(_256, _240, -0.5);
    float _634 = fma(_330, _250, -0.5);
    float _636 = -_124;
    float _638 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[76].x, _284);
    float _640 = -_124;
    float _642 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[81].x, _502);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _654 = _626;
    if (!_272)
    {
        _654 = _168;
    }
    float _656 = _654;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _660 = _656;
    if (_272)
    {
        _660 = _184;
    }
    float _662 = _660;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _666 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _668 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _670 = _648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _672 = _630 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _674 = _662 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _676 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _678 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[78].z, _652);
    float _680 = _658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _682 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _684 = fma(_672, _266, -0.5);
    out.m_47.x = _666;
    out.m_47.y = _668;
    out.m_47.z = _670;
    float _686 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _678);
    float _688 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _482);
    float _690 = in.m_35.x;
    float _692 = in.m_35.y;
    float _694 = in.m_35.z;
    float _696 = fma(_686, _632, _638);
    float _698 = fma(_688, _634, _642);
    float _700 = in.m_43.w;
    float _702 = _540 * 0.01200000010430812835693359375;
    out.m_49.x = _676;
    out.m_49.y = _680;
    out.m_49.z = _682;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _706 = fma(_310, 0.5, 0.5);
    float _708 = -_124;
    float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[86].x, _480);
    float _712 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _714 = log2(_712);
    float _716 = fma(_674, -2.0, _704);
    float _718 = _706 * _702;
    float _720 = in.m_43.z;
    float _722 = _600 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _724 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _716);
    float _726 = float(_538);
    float _728 = _296 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _732 = _676;
    float _734 = 0.5;
    if (_272)
    {
        _732 = _184;
    }
    float _736 = _732;
    float _738 = _600 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _740 = _736;
    if (!_272)
    {
        _740 = _156;
    }
    float _742 = _740;
    float _744 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[88].z, _730);
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _748 = fma(_628, _692, _738);
    float _750 = _156 + (-0.5);
    float _752 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _744);
    float _754 = _742 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    out.m_51.w = _700;
    float _756 = fma(_752, _684, _710);
    float _758 = fma(_754, -2.0, _746);
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _770 = _768 != 0;
    float _772 = in.m_41.w;
    float _774 = fma(_628, _690, _722);
    float _776 = _600 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _778 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _528);
    float _780 = in.m_30.x;
    float _782 = in.m_30.y;
    float _784 = in.m_30.z;
    float _786 = fma(_424, _718, _346);
    float _788 = fma(_628, _694, _776);
    float _790 = -_724;
    float _792 = fma(_778, _426, _790);
    float _794 = fma(_344, _718, _344);
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _798 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _758);
    out.m_51.z = _720;
    float _800 = _714 * _124;
    float _802 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[88].w, _796);
    bool _804 = !_762;
    int _806 = _804 ? 0 : 1;
    float _808 = _184 + (-0.5);
    float _810 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _802);
    float _812 = exp2(_800);
    float _814 = fma(_348, _718, _348);
    float _816 = -_798;
    float _818 = fma(_810, _450, _816);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _822 = 1.0 + _820;
    float _824 = in.m_53.x;
    float _826 = in.m_53.y;
    float _828 = in.m_53.z;
    bool _830 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _832 = isnan(1.0);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _838 = _834 || _836;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _842 = 1.0 / _822;
    float _844 = fma(_774, _772, _780);
    float _846 = fma(_748, _772, _782);
    float _848 = fma(_788, _772, _784);
    float _850 = float(_560);
    float _852 = _416 + 0.5;
    bool _854 = !_766;
    int _856 = _854 ? 0 : 1;
    float _858 = _840 * _794;
    int _860 = abs(_806);
    float _862 = _818 + 0.5;
    int _864 = abs(_856);
    float _866 = _792 + 0.5;
    float _868 = float(_514);
    float _870 = _696 + 0.5;
    float _872 = float(_860);
    float _874 = _698 + 0.5;
    float _876 = float(_864);
    float _878 = -_812;
    float _880 = _878 + 1.0;
    bool _882 = !_770;
    int _884 = _882 ? 0 : 1;
    float _886 = _872 * _850;
    bool _888 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _890 = isnan(0.0);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _896 = _892 || _894;
    float _898 = _876 * _868;
    int _900 = abs(_884);
    float _902 = _886 * (-2.0);
    out.m_55.x = _870;
    out.m_55.y = _852;
    out.m_55.z = _874;
    out.m_55.w = _866;
    float _904 = _896 ? _880 : 0.0;
    float _906 = _840 * _786;
    float _908 = _846 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _910 = _846 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _912 = _846 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (_838)
    {
        float _914 = _904 * _842;
        _130 = _914;
    }
    float _916 = _130;
    bool _918 = _906 != 0.0;
    bool _920 = isnan(_906);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = _840 * _814;
    float _930 = fma(_844, (*spvDescriptorSet0.vp_c10)._m0[5].x, _908);
    float _932 = _168 + (-0.5);
    bool _934 = _858 == 0.0;
    bool _936 = !_926;
    bool _938 = _934 && _936;
    float _940 = _756 + 0.5;
    float _942 = fma(_848, (*spvDescriptorSet0.vp_c10)._m0[5].z, _930);
    float _944 = fma(_902, _824, _824);
    float _946 = float(_900);
    float _948 = _898 * (-2.0);
    float _950 = fma(_326, _902, _326);
    float _952 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[196].x, _944);
    float _954 = _306 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _956 = fma(_276, _948, _276);
    float _958 = _946 * _726;
    float _960 = fma(_948, _826, _826);
    float _962 = fma(_950, _916, _952);
    float _964 = in.m_57.x;
    float _966 = in.m_57.y;
    float _968 = in.m_57.z;
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _906);
    float _972 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[196].y, _960);
    float _974 = _962 * 0.15915493667125701904296875;
    float _976 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _858);
    bool _978 = _928 == 0.0;
    bool _980 = _978 && _938;
    float _982 = _958 * (-2.0);
    float _984 = _970 * _954;
    float _986 = _976 * _728;
    float _988 = fma(_956, _916, _972);
    float _990 = fma(_844, (*spvDescriptorSet0.vp_c10)._m0[4].x, _910);
    float _992 = in.m_59.x;
    float _994 = in.m_59.y;
    float _996 = in.m_59.z;
    float _998 = in.m_59.w;
    float _1000 = fma(_982, _828, _828);
    float _1002 = _988 * 0.15915493667125701904296875;
    float _1004 = fma(_318, _982, _318);
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _928);
    float _1008 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1000);
    out.m_61.x = _940;
    out.m_61.y = _862;
    float _1010 = _328 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1012 = _974 * 6.283185482025146484375;
    float _1014 = sin(_1012);
    float _1016 = fma(_1004, _916, _1008);
    float _1018 = fma(_844, (*spvDescriptorSet0.vp_c10)._m0[6].x, _912);
    float _1020 = _1006 * _1010;
    float _1022 = _942 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1024 = _916;
    float _1026 = _1004;
    float _1028 = _964;
    if (_980)
    {
        _364 = _966;
    }
    float _1030 = _364;
    float _1032 = fma(_848, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1018);
    float _1034 = _1030;
    if (_980)
    {
        _734 = _964;
    }
    float _1036 = _734;
    float _1038 = _974 * 6.283185482025146484375;
    float _1040 = cos(_1038);
    float _1042 = _1036;
    if (_980)
    {
        _1024 = _968;
    }
    float _1044 = _1024;
    float _1046 = _1044;
    if (_980)
    {
        _1026 = _1030;
    }
    float _1048 = _1026;
    float _1050 = _1048;
    if (_980)
    {
        _366 = _1036;
    }
    float _1052 = _366;
    float _1054 = _1052;
    if (!_980)
    {
        _1034 = _966;
    }
    float _1056 = _1034;
    float _1058 = _1002 * 6.283185482025146484375;
    float _1060 = sin(_1058);
    if (!_980)
    {
        _1042 = _964;
    }
    float _1062 = _1042;
    float _1064 = _1016 * 0.15915493667125701904296875;
    if (_980)
    {
        _1028 = _1044;
    }
    float _1066 = _1028;
    float _1068 = _1066;
    if (!_980)
    {
        float _1070 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1056);
        _1050 = _1070;
    }
    float _1072 = _1050;
    if (!_980)
    {
        _1046 = _968;
    }
    float _1074 = _1046;
    float _1076 = fma(_848, (*spvDescriptorSet0.vp_c10)._m0[4].z, _990);
    float _1078 = _996 * _1062;
    float _1080 = _1002 * 6.283185482025146484375;
    float _1082 = cos(_1080);
    float _1084 = _992 * _1056;
    float _1086 = _994 * _1074;
    if (!_980)
    {
        float _1088 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1062);
        _1054 = _1088;
    }
    float _1090 = _1054;
    float _1092 = -_1078;
    float _1094 = fma(_992, _1074, _1092);
    float _1096 = -_1084;
    float _1098 = fma(_994, _1062, _1096);
    float _1100 = -_1086;
    float _1102 = fma(_996, _1056, _1100);
    if (!_980)
    {
        float _1104 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1074);
        _1068 = _1104;
    }
    float _1106 = _1068;
    float _1108 = _1064 * 6.283185482025146484375;
    float _1110 = cos(_1108);
    float _1112 = _1094 * _998;
    float _1114 = _1102 * _998;
    float _1116 = _1098 * _998;
    float _1118 = _1040 * _1060;
    float _1120 = _1014 * _1060;
    float _1122 = _1076 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1124 = _1064 * 6.283185482025146484375;
    float _1126 = sin(_1124);
    float _1128 = _1040 * _1082;
    float _1130 = _1014 * _1082;
    float _1132 = _1082 * _1110;
    float _1134 = _1014 * _1110;
    float _1136 = _1040 * _1110;
    float _1138 = _1060 * _1110;
    float _1140 = _1134 * _994;
    float _1142 = _1134 * _984;
    float _1144 = _1136 * _1112;
    float _1146 = fma(_1126, _1128, _1120);
    float _1148 = -_1118;
    float _1150 = fma(_1126, _1130, _1148);
    float _1152 = -_1072;
    float _1154 = _1126 * _1152;
    float _1156 = fma(_1126, _1120, _1128);
    float _1158 = -_1130;
    float _1160 = fma(_1126, _1118, _1158);
    float _1162 = -_984;
    float _1164 = _1126 * _1162;
    float _1166 = -_994;
    float _1168 = _1126 * _1166;
    float _1170 = -_1112;
    float _1172 = _1126 * _1170;
    float _1174 = fma(_1132, _1090, _1154);
    float _1176 = _1136 * _984;
    float _1178 = fma(_1132, _986, _1164);
    float _1180 = fma(_1132, _992, _1168);
    float _1182 = fma(_1132, _1114, _1172);
    float _1184 = _1136 * _994;
    float _1186 = _1136 * _1072;
    float _1188 = _1134 * _1072;
    float _1190 = fma(_1146, _986, _1176);
    float _1192 = fma(_1146, _992, _1184);
    float _1194 = fma(_1150, _992, _1140);
    float _1196 = fma(_1138, _1020, _1178);
    float _1198 = fma(_1160, _1020, _1190);
    float _1200 = _1134 * _1112;
    float _1202 = fma(_1150, _986, _1142);
    float _1204 = fma(_1150, _1090, _1188);
    float _1206 = _1198 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1208 = fma(_1146, _1090, _1186);
    float _1210 = fma(_1156, _1020, _1202);
    float _1212 = _1198 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1214 = fma(_1196, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1206);
    float _1216 = fma(_1160, _1106, _1208);
    float _1218 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1220 = fma(_1196, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1212);
    float _1222 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1214);
    float _1224 = fma(_1138, _1106, _1174);
    float _1226 = fma(_1138, _996, _1180);
    float _1228 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1220);
    float _1230 = _1218 + _1222;
    float _1232 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1234 = fma(_1160, _996, _1192);
    float _1236 = _1122 + _1228;
    float _1238 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1240 = _1230 + _1238;
    float _1242 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1244 = fma(_1156, _996, _1194);
    float _1246 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1250 = _1236 + _1248;
    float _1252 = _1240 * _1240;
    float _1254 = fma(_1224, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1242);
    float _1256 = fma(_1224, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1232);
    float _1258 = fma(_1224, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1246);
    float _1260 = fma(_1250, _1250, _1252);
    float _1262 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1264 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1266 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1268 = fma(_1146, _1114, _1144);
    float _1270 = sqrt(_1260);
    float _1272 = fma(_1226, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1262);
    float _1274 = _1198 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1276 = fma(_1156, _1106, _1204);
    float _1278 = fma(_1150, _1114, _1200);
    float _1280 = fma(_1160, _1116, _1268);
    float _1282 = fma(_1196, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1274);
    float _1284 = fma(_1276, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1254);
    float _1286 = fma(_1226, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1264);
    float _1288 = fma(_1226, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1266);
    float _1290 = fma(_1276, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1256);
    float _1292 = fma(_1276, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1258);
    float _1294 = fma(_1138, _1116, _1182);
    float _1296 = fma(_1156, _1116, _1278);
    float _1298 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1282);
    float _1300 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1302 = _1270 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1304 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1306 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1308 = fma(_1244, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1272);
    float _1310 = fma(_1244, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1286);
    float _1312 = fma(_1244, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1288);
    out.m_63.x = _1284;
    out.m_63.y = _1290;
    out.m_63.z = _1292;
    float _1314 = _1022 + _1298;
    float _1316 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1300);
    float _1318 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1306);
    out.m_65.x = _1308;
    out.m_65.y = _1310;
    out.m_65.z = _1312;
    float _1320 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1304);
    float _1322 = fma(_1296, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1316);
    float _1324 = fma(_1296, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1318);
    float _1326 = fma(_1296, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1320);
    float _1328 = _1308;
    float _1330 = _1312;
    float _1332 = _1310;
    if (!_1302)
    {
        _1328 = _1236;
    }
    float _1334 = _1328;
    float _1336 = _1334;
    if (!_1302)
    {
        _1330 = _1230;
    }
    float _1338 = _1330;
    float _1340 = _1338;
    if (!_1302)
    {
        _1332 = _1314;
    }
    float _1342 = _1332;
    bool _1344 = !_1302;
    float _1346 = _1342;
    if (!_1344)
    {
        float _1348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1350 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1352 = _1270 + _1350;
        float _1354 = _1314 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1356 = rsqrt(_1260);
        float _1358 = _1352 * _1348;
        float _1360 = _1358 * 0.15915493667125701904296875;
        float _1362 = _1360 * 6.283185482025146484375;
        float _1364 = cos(_1362);
        float _1366 = _1360 * 6.283185482025146484375;
        float _1368 = sin(_1366);
        float _1370 = _1364 + (-1.0);
        float _1372 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = fma(_1368, _1354, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1376 = fma(_1314, _1364, _1372);
        float _1378 = _1356 * _1374;
        float _1380 = fma(_1250, _1378, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1382 = fma(_1240, _1378, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1346 = _1376;
        _1336 = _1380;
        _1340 = _1382;
    }
    float _1384 = _1346;
    float _1386 = _1336;
    float _1388 = _1340;
    float _1390 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1392 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1394 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1396 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1398 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1390);
    float _1400 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1392);
    float _1402 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1394);
    out.m_67.x = _1322;
    out.m_67.y = _1326;
    out.m_67.z = _1324;
    float _1404 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1398);
    float _1406 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1400);
    float _1408 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1396);
    float _1410 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1414 = _1406 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1416 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1408);
    float _1418 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1420 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1422 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1424 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1426 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1428 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1430 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1420);
    float _1432 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1422);
    float _1434 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1426);
    float _1436 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1428);
    float _1438 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1430);
    float _1440 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1432);
    float _1442 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1434);
    float _1444 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1436);
    float _1446 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1440);
    float _1448 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1442);
    float _1450 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1444);
    float _1452 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1438);
    out.m_69.x = _1386;
    out.m_69.y = _1384;
    out.m_69.z = _1388;
    out.m_33.x = 1.0;
    out.m_71.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1450;
    out.gl_Position.y = _1448;
    out.gl_Position.z = _1452;
    out.gl_Position.w = _1446;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_94)
    {
        out.m_33.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1509 = as_type<float>(_106);
        out.gl_Position.z = _1509;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_35.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = 0.0;
    float _130 = _124;
    if (_120)
    {
        float _132 = float(_90);
        _98 = _132;
    }
    float _134 = _98;
    bool _136 = _124 >= _134;
    bool _138 = !_120;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    int _146 = as_type<int>(_144);
    if (_140)
    {
        out.m_33.x = 0.0;
    }
    if (_140)
    {
        float _148 = _144 * 5.0;
        _108 = as_type<int>(_148);
    }
    int _150 = _108;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1581 = as_type<float>(_150);
        out.gl_Position.z = _1581;
    }
    if (_140)
    {
        return out;
    }
    float _152 = in.m_37.x;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _156 = in.m_39.x;
    int _158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _160 = _158 != 0;
    float _162 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _166 = _164 != 0;
    float _168 = in.m_39.z;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _172 = _170 != 0;
    float _174 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _178 = _176 != 0;
    float _180 = in.m_39.w;
    float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _184 = in.m_39.y;
    float _186 = in.m_37.y;
    float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _190 = _152;
    float _192 = _186;
    if (_160)
    {
        float _194 = -_152;
        float _196 = _194 + 1.0;
        _146 = as_type<int>(_196);
    }
    int _198 = _146;
    int _200 = 0;
    int _202 = _198;
    if (_166)
    {
        float _204 = -_152;
        float _206 = _204 + 1.0;
        _200 = as_type<int>(_206);
    }
    int _208 = _200;
    if (!_160)
    {
        _126 = _152;
    }
    float _210 = _126;
    float _212 = in.m_41.x;
    float _214 = in.m_41.y;
    float _216 = in.m_41.z;
    bool _218 = false;
    float _220 = _210;
    if (_160)
    {
        bool _222 = _156 > 0.5;
        _218 = _222;
    }
    bool _224 = _218;
    float _226 = _156 * 2.0;
    if (!_166)
    {
        _128 = _152;
    }
    float _228 = _128;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _232 = _168 > 0.5;
    float _234 = floor(_226);
    float _236 = _228;
    if (_160)
    {
        float _238 = _224 ? as_type<float>(_198) : _152;
        _220 = _238;
    }
    float _240 = _220;
    if (_172)
    {
        float _242 = -_152;
        float _244 = _242 + 1.0;
        _202 = as_type<int>(_244);
    }
    int _246 = _202;
    if (_166)
    {
        float _248 = _232 ? as_type<float>(_208) : _152;
        _236 = _248;
    }
    float _250 = _236;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _254 = _180 > 0.5;
    float _256 = _182 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _258 = _184 > 0.5;
    float _260 = _184 + _168;
    float _262 = _184 * 2.0;
    if (_172)
    {
        float _264 = _258 ? as_type<float>(_246) : _152;
        _190 = _264;
    }
    float _266 = _190;
    float _268 = _260 + (-1.0);
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _272 = _270 != 0;
    float _274 = _156 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _276 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _280 = _278 != 0;
    float _282 = -_174;
    float _284 = fma(_274, 2.0, _282);
    float _286 = _184 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _292 = _290 != 0;
    float _294 = _168 * 2.0;
    float _296 = _212 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = fma(_286, -2.0, _288);
    float _300 = _156 + _168;
    float _302 = floor(_294);
    float _304 = _184 + _156;
    float _306 = _214 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _308 = _300 + (-1.0);
    float _310 = in.m_43.x;
    float _312 = in.m_43.y;
    float _314 = _304 + (-1.0);
    float _316 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _298);
    float _318 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _320 = floor(_262);
    float _322 = -_186;
    float _324 = _322 + 1.0;
    float _326 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _328 = _216 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _330 = _188 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _332 = _258 ? as_type<int>(_324) : as_type<int>(_186);
    int _334 = _254 ? as_type<int>(_324) : as_type<int>(_186);
    float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _338 = _178 ? as_type<float>(_332) : _186;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _342 = _280 ? as_type<float>(_334) : _186;
    float _344 = in.m_45.x;
    float _346 = in.m_45.y;
    float _348 = in.m_45.z;
    bool _350 = _302 > 0.0;
    bool _352 = _302 >= 0.0;
    bool _354 = isnan(_302);
    bool _356 = _352 || _354;
    bool _358 = isnan(0.0);
    bool _360 = _356 || _358;
    float _362 = _312 * 6.283185482025146484375;
    float _364 = _318;
    float _366 = _328;
    if (_292)
    {
        float _368 = _232 ? _324 : _186;
        _192 = _368;
    }
    float _370 = _192;
    float _372 = _154 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _374 = _320 > 0.0;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _378 = _320 >= 0.0;
    bool _380 = isnan(_320);
    bool _382 = _378 || _380;
    bool _384 = isnan(0.0);
    bool _386 = _382 || _384;
    float _388 = fma(_372, _338, -0.5);
    float _390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _392 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[78].w, _376);
    float _394 = fma(_310, 8.0, _362);
    bool _396 = _234 > 0.0;
    float _398 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _392);
    bool _400 = _234 >= 0.0;
    bool _402 = isnan(_234);
    bool _404 = _400 || _402;
    bool _406 = isnan(0.0);
    bool _408 = _404 || _406;
    float _410 = _336 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _412 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.3300000131130218505859375, _394);
    float _414 = -_316;
    float _416 = fma(_398, _388, _414);
    float _418 = _392;
    float _420 = _398;
    if (_272)
    {
        _418 = _156;
    }
    float _422 = _418;
    float _424 = _346 * 0.20000000298023223876953125;
    float _426 = fma(_342, _410, -0.5);
    float _428 = _412 * 0.15915493667125701904296875;
    float _430 = _422;
    if (!_272)
    {
        _430 = _168;
    }
    float _432 = _430;
    float _434 = _424 * _424;
    float _436 = _390 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _438 = _428 * 6.283185482025146484375;
    float _440 = sin(_438);
    float _442 = _432;
    float _444 = _440;
    if (!_272)
    {
        _420 = _184;
    }
    float _446 = _420;
    float _448 = fma(_344, _344, _434);
    float _450 = fma(_436, _370, -0.5);
    int _452 = _360 ? 0 : 1;
    float _454 = fma(_348, _348, _448);
    bool _456 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _460 = _456 || _458;
    bool _462 = isnan(1.0);
    bool _464 = _460 || _462;
    float _466 = _432 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _468 = _446;
    float _470 = as_type<float>(_452);
    if (_272)
    {
        _468 = _156;
    }
    float _472 = _468;
    float _474 = _408 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _476 = rsqrt(_454);
    float _478 = -_230;
    float _480 = fma(_466, 2.0, _478);
    float _482 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[83].z, _252);
    int _484 = _386 ? 0 : 1;
    float _486 = _472 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _488 = _474;
    if (!_272)
    {
        _442 = _168;
    }
    float _490 = _442;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _494 = ~as_type<int>(_474);
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    float _500 = -_340;
    float _502 = fma(_486, 2.0, _500);
    float _504 = _490;
    int _506 = _498;
    if (_272)
    {
        _504 = _184;
    }
    float _508 = _504;
    if (!_396)
    {
        int _510 = ~as_type<int>(_474);
        int _512 = _510 + 1;
        _506 = _512;
    }
    int _514 = _506;
    if (!_464)
    {
        float _516 = _162 * _162;
        float _518 = _516 * 0.5;
        _488 = _518;
    }
    float _520 = _488;
    int _522 = ~_484;
    int _524 = _522 + 1;
    int _526 = _524 + 1;
    float _528 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[83].w, _492);
    int _530 = _526;
    float _532 = _520;
    if (!_374)
    {
        int _534 = ~_484;
        int _536 = _534 + 1;
        _530 = _536;
    }
    int _538 = _530;
    float _540 = _476 * _440;
    int _542 = ~_452;
    int _544 = _542 + 1;
    int _546 = _544 + 1;
    int _548 = _546;
    if (!_464)
    {
        float _550 = _520 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _532 = _550;
    }
    float _552 = _532;
    float _554 = _552;
    if (!_350)
    {
        int _556 = ~_452;
        int _558 = _556 + 1;
        _548 = _558;
    }
    int _560 = _548;
    if (!_464)
    {
        _444 = _162;
    }
    float _562 = _444;
    bool _564 = !_464;
    float _566 = _562;
    if (!_564)
    {
        float _568 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _570 = log2(_568);
        float _572 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _574 = _572 + 1.0;
        float _576 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _578 = _162 * _570;
        float _580 = 1.0 / _574;
        float _582 = _576 * 0.693147182464599609375;
        float _584 = exp2(_578);
        float _586 = 1.0 / _582;
        float _588 = _584 + (-1.0);
        float _590 = -_588;
        float _592 = fma(_590, _586, _162);
        float _594 = _592 * _580;
        float _596 = _594 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _470 = _584;
        _554 = _596;
    }
    float _598 = _470;
    float _600 = _554;
    bool _602 = !_464;
    float _604 = _598;
    if (!_602)
    {
        float _606 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _608 = log2(_606);
        float _610 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _612 = _610 + 1.0;
        float _614 = 1.0 / _612;
        float _616 = _162 * _608;
        float _618 = exp2(_616);
        float _620 = -_618;
        float _622 = _620 + 1.0;
        float _624 = _622 * _614;
        _604 = _614;
        _566 = _624;
    }
    float _626 = _604;
    float _628 = _566;
    float _630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _632 = fma(_256, _240, -0.5);
    float _634 = fma(_330, _250, -0.5);
    float _636 = -_124;
    float _638 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[76].x, _284);
    float _640 = -_124;
    float _642 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[81].x, _502);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _654 = _626;
    if (!_272)
    {
        _654 = _168;
    }
    float _656 = _654;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _660 = _656;
    if (_272)
    {
        _660 = _184;
    }
    float _662 = _660;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _666 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _668 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _670 = _648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _672 = _630 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _674 = _662 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _676 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _678 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[78].z, _652);
    float _680 = _658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _682 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _684 = fma(_672, _266, -0.5);
    out.m_47.x = _666;
    out.m_47.y = _668;
    out.m_47.z = _670;
    float _686 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _678);
    float _688 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _482);
    float _690 = in.m_35.x;
    float _692 = in.m_35.y;
    float _694 = in.m_35.z;
    float _696 = fma(_686, _632, _638);
    float _698 = fma(_688, _634, _642);
    float _700 = in.m_43.w;
    float _702 = _540 * 0.01200000010430812835693359375;
    out.m_49.x = _676;
    out.m_49.y = _680;
    out.m_49.z = _682;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _706 = fma(_310, 0.5, 0.5);
    float _708 = -_124;
    float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[86].x, _480);
    float _712 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _714 = log2(_712);
    float _716 = fma(_674, -2.0, _704);
    float _718 = _706 * _702;
    float _720 = in.m_43.z;
    float _722 = _600 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _724 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _716);
    float _726 = float(_538);
    float _728 = _296 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _732 = _676;
    float _734 = 0.5;
    if (_272)
    {
        _732 = _184;
    }
    float _736 = _732;
    float _738 = _600 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _740 = _736;
    if (!_272)
    {
        _740 = _156;
    }
    float _742 = _740;
    float _744 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[88].z, _730);
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _748 = fma(_628, _692, _738);
    float _750 = _156 + (-0.5);
    float _752 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _744);
    float _754 = _742 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    out.m_51.w = _700;
    float _756 = fma(_752, _684, _710);
    float _758 = fma(_754, -2.0, _746);
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _770 = _768 != 0;
    float _772 = in.m_41.w;
    float _774 = fma(_628, _690, _722);
    float _776 = _600 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _778 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _528);
    float _780 = in.m_30.x;
    float _782 = in.m_30.y;
    float _784 = in.m_30.z;
    float _786 = fma(_424, _718, _346);
    float _788 = fma(_628, _694, _776);
    float _790 = -_724;
    float _792 = fma(_778, _426, _790);
    float _794 = fma(_344, _718, _344);
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _798 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _758);
    out.m_51.z = _720;
    float _800 = _714 * _124;
    float _802 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[88].w, _796);
    bool _804 = !_762;
    int _806 = _804 ? 0 : 1;
    float _808 = _184 + (-0.5);
    float _810 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _802);
    float _812 = exp2(_800);
    float _814 = fma(_348, _718, _348);
    float _816 = -_798;
    float _818 = fma(_810, _450, _816);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _822 = 1.0 + _820;
    float _824 = in.m_53.x;
    float _826 = in.m_53.y;
    float _828 = in.m_53.z;
    bool _830 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _832 = isnan(1.0);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _838 = _834 || _836;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _842 = 1.0 / _822;
    float _844 = fma(_774, _772, _780);
    float _846 = fma(_748, _772, _782);
    float _848 = fma(_788, _772, _784);
    float _850 = float(_560);
    float _852 = _416 + 0.5;
    bool _854 = !_766;
    int _856 = _854 ? 0 : 1;
    float _858 = _840 * _794;
    int _860 = abs(_806);
    float _862 = _818 + 0.5;
    int _864 = abs(_856);
    float _866 = _792 + 0.5;
    float _868 = float(_514);
    float _870 = _696 + 0.5;
    float _872 = float(_860);
    float _874 = _698 + 0.5;
    float _876 = float(_864);
    float _878 = -_812;
    float _880 = _878 + 1.0;
    bool _882 = !_770;
    int _884 = _882 ? 0 : 1;
    float _886 = _872 * _850;
    bool _888 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _890 = isnan(0.0);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _896 = _892 || _894;
    float _898 = _876 * _868;
    int _900 = abs(_884);
    float _902 = _886 * (-2.0);
    out.m_55.x = _870;
    out.m_55.y = _852;
    out.m_55.z = _874;
    out.m_55.w = _866;
    float _904 = _896 ? _880 : 0.0;
    float _906 = _840 * _786;
    float _908 = _846 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _910 = _846 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _912 = _846 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (_838)
    {
        float _914 = _904 * _842;
        _130 = _914;
    }
    float _916 = _130;
    bool _918 = _906 != 0.0;
    bool _920 = isnan(_906);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = _840 * _814;
    float _930 = fma(_844, (*spvDescriptorSet0.vp_c10)._m0[5].x, _908);
    float _932 = _168 + (-0.5);
    bool _934 = _858 == 0.0;
    bool _936 = !_926;
    bool _938 = _934 && _936;
    float _940 = _756 + 0.5;
    float _942 = fma(_848, (*spvDescriptorSet0.vp_c10)._m0[5].z, _930);
    float _944 = fma(_902, _824, _824);
    float _946 = float(_900);
    float _948 = _898 * (-2.0);
    float _950 = fma(_326, _902, _326);
    float _952 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[196].x, _944);
    float _954 = _306 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _956 = fma(_276, _948, _276);
    float _958 = _946 * _726;
    float _960 = fma(_948, _826, _826);
    float _962 = fma(_950, _916, _952);
    float _964 = in.m_57.x;
    float _966 = in.m_57.y;
    float _968 = in.m_57.z;
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _906);
    float _972 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[196].y, _960);
    float _974 = _962 * 0.15915493667125701904296875;
    float _976 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _858);
    bool _978 = _928 == 0.0;
    bool _980 = _978 && _938;
    float _982 = _958 * (-2.0);
    float _984 = _970 * _954;
    float _986 = _976 * _728;
    float _988 = fma(_956, _916, _972);
    float _990 = fma(_844, (*spvDescriptorSet0.vp_c10)._m0[4].x, _910);
    float _992 = in.m_59.x;
    float _994 = in.m_59.y;
    float _996 = in.m_59.z;
    float _998 = in.m_59.w;
    float _1000 = fma(_982, _828, _828);
    float _1002 = _988 * 0.15915493667125701904296875;
    float _1004 = fma(_318, _982, _318);
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _928);
    float _1008 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1000);
    out.m_61.x = _940;
    out.m_61.y = _862;
    float _1010 = _328 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1012 = _974 * 6.283185482025146484375;
    float _1014 = sin(_1012);
    float _1016 = fma(_1004, _916, _1008);
    float _1018 = fma(_844, (*spvDescriptorSet0.vp_c10)._m0[6].x, _912);
    float _1020 = _1006 * _1010;
    float _1022 = _942 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1024 = _916;
    float _1026 = _1004;
    float _1028 = _964;
    if (_980)
    {
        _364 = _966;
    }
    float _1030 = _364;
    float _1032 = fma(_848, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1018);
    float _1034 = _1030;
    if (_980)
    {
        _734 = _964;
    }
    float _1036 = _734;
    float _1038 = _974 * 6.283185482025146484375;
    float _1040 = cos(_1038);
    float _1042 = _1036;
    if (_980)
    {
        _1024 = _968;
    }
    float _1044 = _1024;
    float _1046 = _1044;
    if (_980)
    {
        _1026 = _1030;
    }
    float _1048 = _1026;
    float _1050 = _1048;
    if (_980)
    {
        _366 = _1036;
    }
    float _1052 = _366;
    float _1054 = _1052;
    if (!_980)
    {
        _1034 = _966;
    }
    float _1056 = _1034;
    float _1058 = _1002 * 6.283185482025146484375;
    float _1060 = sin(_1058);
    if (!_980)
    {
        _1042 = _964;
    }
    float _1062 = _1042;
    float _1064 = _1016 * 0.15915493667125701904296875;
    if (_980)
    {
        _1028 = _1044;
    }
    float _1066 = _1028;
    float _1068 = _1066;
    if (!_980)
    {
        float _1070 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1056);
        _1050 = _1070;
    }
    float _1072 = _1050;
    if (!_980)
    {
        _1046 = _968;
    }
    float _1074 = _1046;
    float _1076 = fma(_848, (*spvDescriptorSet0.vp_c10)._m0[4].z, _990);
    float _1078 = _996 * _1062;
    float _1080 = _1002 * 6.283185482025146484375;
    float _1082 = cos(_1080);
    float _1084 = _992 * _1056;
    float _1086 = _994 * _1074;
    if (!_980)
    {
        float _1088 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1062);
        _1054 = _1088;
    }
    float _1090 = _1054;
    float _1092 = -_1078;
    float _1094 = fma(_992, _1074, _1092);
    float _1096 = -_1084;
    float _1098 = fma(_994, _1062, _1096);
    float _1100 = -_1086;
    float _1102 = fma(_996, _1056, _1100);
    if (!_980)
    {
        float _1104 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1074);
        _1068 = _1104;
    }
    float _1106 = _1068;
    float _1108 = _1064 * 6.283185482025146484375;
    float _1110 = cos(_1108);
    float _1112 = _1094 * _998;
    float _1114 = _1102 * _998;
    float _1116 = _1098 * _998;
    float _1118 = _1040 * _1060;
    float _1120 = _1014 * _1060;
    float _1122 = _1076 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1124 = _1064 * 6.283185482025146484375;
    float _1126 = sin(_1124);
    float _1128 = _1040 * _1082;
    float _1130 = _1014 * _1082;
    float _1132 = _1082 * _1110;
    float _1134 = _1014 * _1110;
    float _1136 = _1040 * _1110;
    float _1138 = _1060 * _1110;
    float _1140 = _1134 * _994;
    float _1142 = _1134 * _984;
    float _1144 = _1136 * _1112;
    float _1146 = fma(_1126, _1128, _1120);
    float _1148 = -_1118;
    float _1150 = fma(_1126, _1130, _1148);
    float _1152 = -_1072;
    float _1154 = _1126 * _1152;
    float _1156 = fma(_1126, _1120, _1128);
    float _1158 = -_1130;
    float _1160 = fma(_1126, _1118, _1158);
    float _1162 = -_984;
    float _1164 = _1126 * _1162;
    float _1166 = -_994;
    float _1168 = _1126 * _1166;
    float _1170 = -_1112;
    float _1172 = _1126 * _1170;
    float _1174 = fma(_1132, _1090, _1154);
    float _1176 = _1136 * _984;
    float _1178 = fma(_1132, _986, _1164);
    float _1180 = fma(_1132, _992, _1168);
    float _1182 = fma(_1132, _1114, _1172);
    float _1184 = _1136 * _994;
    float _1186 = _1136 * _1072;
    float _1188 = _1134 * _1072;
    float _1190 = fma(_1146, _986, _1176);
    float _1192 = fma(_1146, _992, _1184);
    float _1194 = fma(_1150, _992, _1140);
    float _1196 = fma(_1138, _1020, _1178);
    float _1198 = fma(_1160, _1020, _1190);
    float _1200 = _1134 * _1112;
    float _1202 = fma(_1150, _986, _1142);
    float _1204 = fma(_1150, _1090, _1188);
    float _1206 = _1198 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1208 = fma(_1146, _1090, _1186);
    float _1210 = fma(_1156, _1020, _1202);
    float _1212 = _1198 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1214 = fma(_1196, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1206);
    float _1216 = fma(_1160, _1106, _1208);
    float _1218 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1220 = fma(_1196, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1212);
    float _1222 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1214);
    float _1224 = fma(_1138, _1106, _1174);
    float _1226 = fma(_1138, _996, _1180);
    float _1228 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1220);
    float _1230 = _1218 + _1222;
    float _1232 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1234 = fma(_1160, _996, _1192);
    float _1236 = _1122 + _1228;
    float _1238 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1240 = _1230 + _1238;
    float _1242 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1244 = fma(_1156, _996, _1194);
    float _1246 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1250 = _1236 + _1248;
    float _1252 = _1240 * _1240;
    float _1254 = fma(_1224, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1242);
    float _1256 = fma(_1224, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1232);
    float _1258 = fma(_1224, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1246);
    float _1260 = fma(_1250, _1250, _1252);
    float _1262 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1264 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1266 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1268 = fma(_1146, _1114, _1144);
    float _1270 = sqrt(_1260);
    float _1272 = fma(_1226, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1262);
    float _1274 = _1198 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1276 = fma(_1156, _1106, _1204);
    float _1278 = fma(_1150, _1114, _1200);
    float _1280 = fma(_1160, _1116, _1268);
    float _1282 = fma(_1196, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1274);
    float _1284 = fma(_1276, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1254);
    float _1286 = fma(_1226, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1264);
    float _1288 = fma(_1226, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1266);
    float _1290 = fma(_1276, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1256);
    float _1292 = fma(_1276, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1258);
    float _1294 = fma(_1138, _1116, _1182);
    float _1296 = fma(_1156, _1116, _1278);
    float _1298 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1282);
    float _1300 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1302 = _1270 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1304 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1306 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1308 = fma(_1244, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1272);
    float _1310 = fma(_1244, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1286);
    float _1312 = fma(_1244, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1288);
    out.m_63.x = _1284;
    out.m_63.y = _1290;
    out.m_63.z = _1292;
    float _1314 = _1022 + _1298;
    float _1316 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1300);
    float _1318 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1306);
    out.m_65.x = _1308;
    out.m_65.y = _1310;
    out.m_65.z = _1312;
    float _1320 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1304);
    float _1322 = fma(_1296, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1316);
    float _1324 = fma(_1296, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1318);
    float _1326 = fma(_1296, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1320);
    float _1328 = _1308;
    float _1330 = _1312;
    float _1332 = _1310;
    if (!_1302)
    {
        _1328 = _1236;
    }
    float _1334 = _1328;
    float _1336 = _1334;
    if (!_1302)
    {
        _1330 = _1230;
    }
    float _1338 = _1330;
    float _1340 = _1338;
    if (!_1302)
    {
        _1332 = _1314;
    }
    float _1342 = _1332;
    bool _1344 = !_1302;
    float _1346 = _1342;
    if (!_1344)
    {
        float _1348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1350 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1352 = _1270 + _1350;
        float _1354 = _1314 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1356 = rsqrt(_1260);
        float _1358 = _1352 * _1348;
        float _1360 = _1358 * 0.15915493667125701904296875;
        float _1362 = _1360 * 6.283185482025146484375;
        float _1364 = cos(_1362);
        float _1366 = _1360 * 6.283185482025146484375;
        float _1368 = sin(_1366);
        float _1370 = _1364 + (-1.0);
        float _1372 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = fma(_1368, _1354, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1376 = fma(_1314, _1364, _1372);
        float _1378 = _1356 * _1374;
        float _1380 = fma(_1250, _1378, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1382 = fma(_1240, _1378, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1346 = _1376;
        _1336 = _1380;
        _1340 = _1382;
    }
    float _1384 = _1346;
    float _1386 = _1336;
    float _1388 = _1340;
    float _1390 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1392 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1394 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1396 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1398 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1390);
    float _1400 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1392);
    float _1402 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1394);
    out.m_67.x = _1322;
    out.m_67.y = _1326;
    out.m_67.z = _1324;
    float _1404 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1398);
    float _1406 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1400);
    float _1408 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1396);
    float _1410 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1414 = _1406 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1416 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1408);
    float _1418 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1420 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1422 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1424 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1426 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1428 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1430 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1420);
    float _1432 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1422);
    float _1434 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1426);
    float _1436 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1428);
    float _1438 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1430);
    float _1440 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1432);
    float _1442 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1434);
    float _1444 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1436);
    float _1446 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1440);
    float _1448 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1442);
    float _1450 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1444);
    float _1452 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1438);
    out.m_69.x = _1386;
    out.m_69.y = _1384;
    out.m_69.z = _1388;
    out.m_33.x = 1.0;
    out.m_71.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1450;
    out.gl_Position.y = _1448;
    out.gl_Position.z = _1452;
    out.gl_Position.w = _1446;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_94)
    {
        out.m_33.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1509 = as_type<float>(_106);
        out.gl_Position.z = _1509;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_35.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = 0.0;
    float _130 = _124;
    if (_120)
    {
        float _132 = float(_90);
        _98 = _132;
    }
    float _134 = _98;
    bool _136 = _124 >= _134;
    bool _138 = !_120;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    int _146 = as_type<int>(_144);
    if (_140)
    {
        out.m_33.x = 0.0;
    }
    if (_140)
    {
        float _148 = _144 * 5.0;
        _108 = as_type<int>(_148);
    }
    int _150 = _108;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1581 = as_type<float>(_150);
        out.gl_Position.z = _1581;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_37.x;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _156 = in.m_39.x;
    int _158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _160 = _158 != 0;
    float _162 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _166 = _164 != 0;
    float _168 = in.m_39.z;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _172 = _170 != 0;
    float _174 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _178 = _176 != 0;
    float _180 = in.m_39.w;
    float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _184 = in.m_39.y;
    float _186 = in.m_37.y;
    float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _190 = _152;
    float _192 = _186;
    if (_160)
    {
        float _194 = -_152;
        float _196 = _194 + 1.0;
        _146 = as_type<int>(_196);
    }
    int _198 = _146;
    int _200 = 0;
    int _202 = _198;
    if (_166)
    {
        float _204 = -_152;
        float _206 = _204 + 1.0;
        _200 = as_type<int>(_206);
    }
    int _208 = _200;
    if (!_160)
    {
        _126 = _152;
    }
    float _210 = _126;
    float _212 = in.m_41.x;
    float _214 = in.m_41.y;
    float _216 = in.m_41.z;
    bool _218 = false;
    float _220 = _210;
    if (_160)
    {
        bool _222 = _156 > 0.5;
        _218 = _222;
    }
    bool _224 = _218;
    float _226 = _156 * 2.0;
    if (!_166)
    {
        _128 = _152;
    }
    float _228 = _128;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _232 = _168 > 0.5;
    float _234 = floor(_226);
    float _236 = _228;
    if (_160)
    {
        float _238 = _224 ? as_type<float>(_198) : _152;
        _220 = _238;
    }
    float _240 = _220;
    if (_172)
    {
        float _242 = -_152;
        float _244 = _242 + 1.0;
        _202 = as_type<int>(_244);
    }
    int _246 = _202;
    if (_166)
    {
        float _248 = _232 ? as_type<float>(_208) : _152;
        _236 = _248;
    }
    float _250 = _236;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _254 = _180 > 0.5;
    float _256 = _182 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _258 = _184 > 0.5;
    float _260 = _184 + _168;
    float _262 = _184 * 2.0;
    if (_172)
    {
        float _264 = _258 ? as_type<float>(_246) : _152;
        _190 = _264;
    }
    float _266 = _190;
    float _268 = _260 + (-1.0);
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _272 = _270 != 0;
    float _274 = _156 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _276 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _280 = _278 != 0;
    float _282 = -_174;
    float _284 = fma(_274, 2.0, _282);
    float _286 = _184 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _292 = _290 != 0;
    float _294 = _168 * 2.0;
    float _296 = _212 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = fma(_286, -2.0, _288);
    float _300 = _156 + _168;
    float _302 = floor(_294);
    float _304 = _184 + _156;
    float _306 = _214 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _308 = _300 + (-1.0);
    float _310 = in.m_43.x;
    float _312 = in.m_43.y;
    float _314 = _304 + (-1.0);
    float _316 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _298);
    float _318 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _320 = floor(_262);
    float _322 = -_186;
    float _324 = _322 + 1.0;
    float _326 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _328 = _216 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _330 = _188 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _332 = _258 ? as_type<int>(_324) : as_type<int>(_186);
    int _334 = _254 ? as_type<int>(_324) : as_type<int>(_186);
    float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _338 = _178 ? as_type<float>(_332) : _186;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _342 = _280 ? as_type<float>(_334) : _186;
    float _344 = in.m_45.x;
    float _346 = in.m_45.y;
    float _348 = in.m_45.z;
    bool _350 = _302 > 0.0;
    bool _352 = _302 >= 0.0;
    bool _354 = isnan(_302);
    bool _356 = _352 || _354;
    bool _358 = isnan(0.0);
    bool _360 = _356 || _358;
    float _362 = _312 * 6.283185482025146484375;
    float _364 = _318;
    float _366 = _328;
    if (_292)
    {
        float _368 = _232 ? _324 : _186;
        _192 = _368;
    }
    float _370 = _192;
    float _372 = _154 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _374 = _320 > 0.0;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _378 = _320 >= 0.0;
    bool _380 = isnan(_320);
    bool _382 = _378 || _380;
    bool _384 = isnan(0.0);
    bool _386 = _382 || _384;
    float _388 = fma(_372, _338, -0.5);
    float _390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _392 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[78].w, _376);
    float _394 = fma(_310, 8.0, _362);
    bool _396 = _234 > 0.0;
    float _398 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _392);
    bool _400 = _234 >= 0.0;
    bool _402 = isnan(_234);
    bool _404 = _400 || _402;
    bool _406 = isnan(0.0);
    bool _408 = _404 || _406;
    float _410 = _336 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _412 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.3300000131130218505859375, _394);
    float _414 = -_316;
    float _416 = fma(_398, _388, _414);
    float _418 = _392;
    float _420 = _398;
    if (_272)
    {
        _418 = _156;
    }
    float _422 = _418;
    float _424 = _346 * 0.20000000298023223876953125;
    float _426 = fma(_342, _410, -0.5);
    float _428 = _412 * 0.15915493667125701904296875;
    float _430 = _422;
    if (!_272)
    {
        _430 = _168;
    }
    float _432 = _430;
    float _434 = _424 * _424;
    float _436 = _390 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _438 = _428 * 6.283185482025146484375;
    float _440 = sin(_438);
    float _442 = _432;
    float _444 = _440;
    if (!_272)
    {
        _420 = _184;
    }
    float _446 = _420;
    float _448 = fma(_344, _344, _434);
    float _450 = fma(_436, _370, -0.5);
    int _452 = _360 ? 0 : 1;
    float _454 = fma(_348, _348, _448);
    bool _456 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _460 = _456 || _458;
    bool _462 = isnan(1.0);
    bool _464 = _460 || _462;
    float _466 = _432 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _468 = _446;
    float _470 = as_type<float>(_452);
    if (_272)
    {
        _468 = _156;
    }
    float _472 = _468;
    float _474 = _408 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _476 = rsqrt(_454);
    float _478 = -_230;
    float _480 = fma(_466, 2.0, _478);
    float _482 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[83].z, _252);
    int _484 = _386 ? 0 : 1;
    float _486 = _472 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _488 = _474;
    if (!_272)
    {
        _442 = _168;
    }
    float _490 = _442;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _494 = ~as_type<int>(_474);
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    float _500 = -_340;
    float _502 = fma(_486, 2.0, _500);
    float _504 = _490;
    int _506 = _498;
    if (_272)
    {
        _504 = _184;
    }
    float _508 = _504;
    if (!_396)
    {
        int _510 = ~as_type<int>(_474);
        int _512 = _510 + 1;
        _506 = _512;
    }
    int _514 = _506;
    if (!_464)
    {
        float _516 = _162 * _162;
        float _518 = _516 * 0.5;
        _488 = _518;
    }
    float _520 = _488;
    int _522 = ~_484;
    int _524 = _522 + 1;
    int _526 = _524 + 1;
    float _528 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[83].w, _492);
    int _530 = _526;
    float _532 = _520;
    if (!_374)
    {
        int _534 = ~_484;
        int _536 = _534 + 1;
        _530 = _536;
    }
    int _538 = _530;
    float _540 = _476 * _440;
    int _542 = ~_452;
    int _544 = _542 + 1;
    int _546 = _544 + 1;
    int _548 = _546;
    if (!_464)
    {
        float _550 = _520 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _532 = _550;
    }
    float _552 = _532;
    float _554 = _552;
    if (!_350)
    {
        int _556 = ~_452;
        int _558 = _556 + 1;
        _548 = _558;
    }
    int _560 = _548;
    if (!_464)
    {
        _444 = _162;
    }
    float _562 = _444;
    bool _564 = !_464;
    float _566 = _562;
    if (!_564)
    {
        float _568 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _570 = log2(_568);
        float _572 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _574 = _572 + 1.0;
        float _576 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _578 = _162 * _570;
        float _580 = 1.0 / _574;
        float _582 = _576 * 0.693147182464599609375;
        float _584 = exp2(_578);
        float _586 = 1.0 / _582;
        float _588 = _584 + (-1.0);
        float _590 = -_588;
        float _592 = fma(_590, _586, _162);
        float _594 = _592 * _580;
        float _596 = _594 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _470 = _584;
        _554 = _596;
    }
    float _598 = _470;
    float _600 = _554;
    bool _602 = !_464;
    float _604 = _598;
    if (!_602)
    {
        float _606 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _608 = log2(_606);
        float _610 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _612 = _610 + 1.0;
        float _614 = 1.0 / _612;
        float _616 = _162 * _608;
        float _618 = exp2(_616);
        float _620 = -_618;
        float _622 = _620 + 1.0;
        float _624 = _622 * _614;
        _604 = _614;
        _566 = _624;
    }
    float _626 = _604;
    float _628 = _566;
    float _630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _632 = fma(_256, _240, -0.5);
    float _634 = fma(_330, _250, -0.5);
    float _636 = -_124;
    float _638 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[76].x, _284);
    float _640 = -_124;
    float _642 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[81].x, _502);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _654 = _626;
    if (!_272)
    {
        _654 = _168;
    }
    float _656 = _654;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _660 = _656;
    if (_272)
    {
        _660 = _184;
    }
    float _662 = _660;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _666 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _668 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _670 = _648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _672 = _630 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _674 = _662 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _676 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _678 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[78].z, _652);
    float _680 = _658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _682 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _684 = fma(_672, _266, -0.5);
    out.m_47.x = _666;
    out.m_47.y = _668;
    out.m_47.z = _670;
    float _686 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _678);
    float _688 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _482);
    float _690 = in.m_35.x;
    float _692 = in.m_35.y;
    float _694 = in.m_35.z;
    float _696 = fma(_686, _632, _638);
    float _698 = fma(_688, _634, _642);
    float _700 = in.m_43.w;
    float _702 = _540 * 0.01200000010430812835693359375;
    out.m_49.x = _676;
    out.m_49.y = _680;
    out.m_49.z = _682;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _706 = fma(_310, 0.5, 0.5);
    float _708 = -_124;
    float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[86].x, _480);
    float _712 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _714 = log2(_712);
    float _716 = fma(_674, -2.0, _704);
    float _718 = _706 * _702;
    float _720 = in.m_43.z;
    float _722 = _600 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _724 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _716);
    float _726 = float(_538);
    float _728 = _296 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _732 = _676;
    float _734 = 0.5;
    if (_272)
    {
        _732 = _184;
    }
    float _736 = _732;
    float _738 = _600 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _740 = _736;
    if (!_272)
    {
        _740 = _156;
    }
    float _742 = _740;
    float _744 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[88].z, _730);
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _748 = fma(_628, _692, _738);
    float _750 = _156 + (-0.5);
    float _752 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _744);
    float _754 = _742 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    out.m_51.w = _700;
    float _756 = fma(_752, _684, _710);
    float _758 = fma(_754, -2.0, _746);
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _770 = _768 != 0;
    float _772 = in.m_41.w;
    float _774 = fma(_628, _690, _722);
    float _776 = _600 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _778 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _528);
    float _780 = in.m_30.x;
    float _782 = in.m_30.y;
    float _784 = in.m_30.z;
    float _786 = fma(_424, _718, _346);
    float _788 = fma(_628, _694, _776);
    float _790 = -_724;
    float _792 = fma(_778, _426, _790);
    float _794 = fma(_344, _718, _344);
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _798 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _758);
    out.m_51.z = _720;
    float _800 = _714 * _124;
    float _802 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[88].w, _796);
    bool _804 = !_762;
    int _806 = _804 ? 0 : 1;
    float _808 = _184 + (-0.5);
    float _810 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _802);
    float _812 = exp2(_800);
    float _814 = fma(_348, _718, _348);
    float _816 = -_798;
    float _818 = fma(_810, _450, _816);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _822 = 1.0 + _820;
    float _824 = in.m_53.x;
    float _826 = in.m_53.y;
    float _828 = in.m_53.z;
    bool _830 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _832 = isnan(1.0);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _838 = _834 || _836;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _842 = 1.0 / _822;
    float _844 = fma(_774, _772, _780);
    float _846 = fma(_748, _772, _782);
    float _848 = fma(_788, _772, _784);
    float _850 = float(_560);
    float _852 = _416 + 0.5;
    bool _854 = !_766;
    int _856 = _854 ? 0 : 1;
    float _858 = _840 * _794;
    int _860 = abs(_806);
    float _862 = _818 + 0.5;
    int _864 = abs(_856);
    float _866 = _792 + 0.5;
    float _868 = float(_514);
    float _870 = _696 + 0.5;
    float _872 = float(_860);
    float _874 = _698 + 0.5;
    float _876 = float(_864);
    float _878 = -_812;
    float _880 = _878 + 1.0;
    bool _882 = !_770;
    int _884 = _882 ? 0 : 1;
    float _886 = _872 * _850;
    bool _888 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _890 = isnan(0.0);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _896 = _892 || _894;
    float _898 = _876 * _868;
    int _900 = abs(_884);
    float _902 = _886 * (-2.0);
    out.m_55.x = _870;
    out.m_55.y = _852;
    out.m_55.z = _874;
    out.m_55.w = _866;
    float _904 = _896 ? _880 : 0.0;
    float _906 = _840 * _786;
    float _908 = _846 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _910 = _846 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _912 = _846 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (_838)
    {
        float _914 = _904 * _842;
        _130 = _914;
    }
    float _916 = _130;
    bool _918 = _906 != 0.0;
    bool _920 = isnan(_906);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = _840 * _814;
    float _930 = fma(_844, (*spvDescriptorSet0.vp_c10)._m0[5].x, _908);
    float _932 = _168 + (-0.5);
    bool _934 = _858 == 0.0;
    bool _936 = !_926;
    bool _938 = _934 && _936;
    float _940 = _756 + 0.5;
    float _942 = fma(_848, (*spvDescriptorSet0.vp_c10)._m0[5].z, _930);
    float _944 = fma(_902, _824, _824);
    float _946 = float(_900);
    float _948 = _898 * (-2.0);
    float _950 = fma(_326, _902, _326);
    float _952 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[196].x, _944);
    float _954 = _306 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _956 = fma(_276, _948, _276);
    float _958 = _946 * _726;
    float _960 = fma(_948, _826, _826);
    float _962 = fma(_950, _916, _952);
    float _964 = in.m_57.x;
    float _966 = in.m_57.y;
    float _968 = in.m_57.z;
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _906);
    float _972 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[196].y, _960);
    float _974 = _962 * 0.15915493667125701904296875;
    float _976 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _858);
    bool _978 = _928 == 0.0;
    bool _980 = _978 && _938;
    float _982 = _958 * (-2.0);
    float _984 = _970 * _954;
    float _986 = _976 * _728;
    float _988 = fma(_956, _916, _972);
    float _990 = fma(_844, (*spvDescriptorSet0.vp_c10)._m0[4].x, _910);
    float _992 = in.m_59.x;
    float _994 = in.m_59.y;
    float _996 = in.m_59.z;
    float _998 = in.m_59.w;
    float _1000 = fma(_982, _828, _828);
    float _1002 = _988 * 0.15915493667125701904296875;
    float _1004 = fma(_318, _982, _318);
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _928);
    float _1008 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1000);
    out.m_61.x = _940;
    out.m_61.y = _862;
    float _1010 = _328 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1012 = _974 * 6.283185482025146484375;
    float _1014 = sin(_1012);
    float _1016 = fma(_1004, _916, _1008);
    float _1018 = fma(_844, (*spvDescriptorSet0.vp_c10)._m0[6].x, _912);
    float _1020 = _1006 * _1010;
    float _1022 = _942 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1024 = _916;
    float _1026 = _1004;
    float _1028 = _964;
    if (_980)
    {
        _364 = _966;
    }
    float _1030 = _364;
    float _1032 = fma(_848, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1018);
    float _1034 = _1030;
    if (_980)
    {
        _734 = _964;
    }
    float _1036 = _734;
    float _1038 = _974 * 6.283185482025146484375;
    float _1040 = cos(_1038);
    float _1042 = _1036;
    if (_980)
    {
        _1024 = _968;
    }
    float _1044 = _1024;
    float _1046 = _1044;
    if (_980)
    {
        _1026 = _1030;
    }
    float _1048 = _1026;
    float _1050 = _1048;
    if (_980)
    {
        _366 = _1036;
    }
    float _1052 = _366;
    float _1054 = _1052;
    if (!_980)
    {
        _1034 = _966;
    }
    float _1056 = _1034;
    float _1058 = _1002 * 6.283185482025146484375;
    float _1060 = sin(_1058);
    if (!_980)
    {
        _1042 = _964;
    }
    float _1062 = _1042;
    float _1064 = _1016 * 0.15915493667125701904296875;
    if (_980)
    {
        _1028 = _1044;
    }
    float _1066 = _1028;
    float _1068 = _1066;
    if (!_980)
    {
        float _1070 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1056);
        _1050 = _1070;
    }
    float _1072 = _1050;
    if (!_980)
    {
        _1046 = _968;
    }
    float _1074 = _1046;
    float _1076 = fma(_848, (*spvDescriptorSet0.vp_c10)._m0[4].z, _990);
    float _1078 = _996 * _1062;
    float _1080 = _1002 * 6.283185482025146484375;
    float _1082 = cos(_1080);
    float _1084 = _992 * _1056;
    float _1086 = _994 * _1074;
    if (!_980)
    {
        float _1088 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1062);
        _1054 = _1088;
    }
    float _1090 = _1054;
    float _1092 = -_1078;
    float _1094 = fma(_992, _1074, _1092);
    float _1096 = -_1084;
    float _1098 = fma(_994, _1062, _1096);
    float _1100 = -_1086;
    float _1102 = fma(_996, _1056, _1100);
    if (!_980)
    {
        float _1104 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1074);
        _1068 = _1104;
    }
    float _1106 = _1068;
    float _1108 = _1064 * 6.283185482025146484375;
    float _1110 = cos(_1108);
    float _1112 = _1094 * _998;
    float _1114 = _1102 * _998;
    float _1116 = _1098 * _998;
    float _1118 = _1040 * _1060;
    float _1120 = _1014 * _1060;
    float _1122 = _1076 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1124 = _1064 * 6.283185482025146484375;
    float _1126 = sin(_1124);
    float _1128 = _1040 * _1082;
    float _1130 = _1014 * _1082;
    float _1132 = _1082 * _1110;
    float _1134 = _1014 * _1110;
    float _1136 = _1040 * _1110;
    float _1138 = _1060 * _1110;
    float _1140 = _1134 * _994;
    float _1142 = _1134 * _984;
    float _1144 = _1136 * _1112;
    float _1146 = fma(_1126, _1128, _1120);
    float _1148 = -_1118;
    float _1150 = fma(_1126, _1130, _1148);
    float _1152 = -_1072;
    float _1154 = _1126 * _1152;
    float _1156 = fma(_1126, _1120, _1128);
    float _1158 = -_1130;
    float _1160 = fma(_1126, _1118, _1158);
    float _1162 = -_984;
    float _1164 = _1126 * _1162;
    float _1166 = -_994;
    float _1168 = _1126 * _1166;
    float _1170 = -_1112;
    float _1172 = _1126 * _1170;
    float _1174 = fma(_1132, _1090, _1154);
    float _1176 = _1136 * _984;
    float _1178 = fma(_1132, _986, _1164);
    float _1180 = fma(_1132, _992, _1168);
    float _1182 = fma(_1132, _1114, _1172);
    float _1184 = _1136 * _994;
    float _1186 = _1136 * _1072;
    float _1188 = _1134 * _1072;
    float _1190 = fma(_1146, _986, _1176);
    float _1192 = fma(_1146, _992, _1184);
    float _1194 = fma(_1150, _992, _1140);
    float _1196 = fma(_1138, _1020, _1178);
    float _1198 = fma(_1160, _1020, _1190);
    float _1200 = _1134 * _1112;
    float _1202 = fma(_1150, _986, _1142);
    float _1204 = fma(_1150, _1090, _1188);
    float _1206 = _1198 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1208 = fma(_1146, _1090, _1186);
    float _1210 = fma(_1156, _1020, _1202);
    float _1212 = _1198 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1214 = fma(_1196, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1206);
    float _1216 = fma(_1160, _1106, _1208);
    float _1218 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1220 = fma(_1196, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1212);
    float _1222 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1214);
    float _1224 = fma(_1138, _1106, _1174);
    float _1226 = fma(_1138, _996, _1180);
    float _1228 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1220);
    float _1230 = _1218 + _1222;
    float _1232 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1234 = fma(_1160, _996, _1192);
    float _1236 = _1122 + _1228;
    float _1238 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1240 = _1230 + _1238;
    float _1242 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1244 = fma(_1156, _996, _1194);
    float _1246 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1250 = _1236 + _1248;
    float _1252 = _1240 * _1240;
    float _1254 = fma(_1224, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1242);
    float _1256 = fma(_1224, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1232);
    float _1258 = fma(_1224, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1246);
    float _1260 = fma(_1250, _1250, _1252);
    float _1262 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1264 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1266 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1268 = fma(_1146, _1114, _1144);
    float _1270 = sqrt(_1260);
    float _1272 = fma(_1226, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1262);
    float _1274 = _1198 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1276 = fma(_1156, _1106, _1204);
    float _1278 = fma(_1150, _1114, _1200);
    float _1280 = fma(_1160, _1116, _1268);
    float _1282 = fma(_1196, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1274);
    float _1284 = fma(_1276, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1254);
    float _1286 = fma(_1226, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1264);
    float _1288 = fma(_1226, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1266);
    float _1290 = fma(_1276, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1256);
    float _1292 = fma(_1276, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1258);
    float _1294 = fma(_1138, _1116, _1182);
    float _1296 = fma(_1156, _1116, _1278);
    float _1298 = fma(_1210, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1282);
    float _1300 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1302 = _1270 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1304 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1306 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1308 = fma(_1244, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1272);
    float _1310 = fma(_1244, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1286);
    float _1312 = fma(_1244, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1288);
    out.m_63.x = _1284;
    out.m_63.y = _1290;
    out.m_63.z = _1292;
    float _1314 = _1022 + _1298;
    float _1316 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1300);
    float _1318 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1306);
    out.m_65.x = _1308;
    out.m_65.y = _1310;
    out.m_65.z = _1312;
    float _1320 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1304);
    float _1322 = fma(_1296, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1316);
    float _1324 = fma(_1296, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1318);
    float _1326 = fma(_1296, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1320);
    float _1328 = _1308;
    float _1330 = _1312;
    float _1332 = _1310;
    if (!_1302)
    {
        _1328 = _1236;
    }
    float _1334 = _1328;
    float _1336 = _1334;
    if (!_1302)
    {
        _1330 = _1230;
    }
    float _1338 = _1330;
    float _1340 = _1338;
    if (!_1302)
    {
        _1332 = _1314;
    }
    float _1342 = _1332;
    bool _1344 = !_1302;
    float _1346 = _1342;
    if (!_1344)
    {
        float _1348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1350 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1352 = _1270 + _1350;
        float _1354 = _1314 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1356 = rsqrt(_1260);
        float _1358 = _1352 * _1348;
        float _1360 = _1358 * 0.15915493667125701904296875;
        float _1362 = _1360 * 6.283185482025146484375;
        float _1364 = cos(_1362);
        float _1366 = _1360 * 6.283185482025146484375;
        float _1368 = sin(_1366);
        float _1370 = _1364 + (-1.0);
        float _1372 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = fma(_1368, _1354, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1376 = fma(_1314, _1364, _1372);
        float _1378 = _1356 * _1374;
        float _1380 = fma(_1250, _1378, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1382 = fma(_1240, _1378, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1346 = _1376;
        _1336 = _1380;
        _1340 = _1382;
    }
    float _1384 = _1346;
    float _1386 = _1336;
    float _1388 = _1340;
    float _1390 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1392 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1394 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1396 = _1384 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1398 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1390);
    float _1400 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1392);
    float _1402 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1394);
    out.m_67.x = _1322;
    out.m_67.y = _1326;
    out.m_67.z = _1324;
    float _1404 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1398);
    float _1406 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1400);
    float _1408 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1396);
    float _1410 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1414 = _1406 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1416 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1408);
    float _1418 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1420 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1422 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1424 = _1416 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1426 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1428 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1430 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1420);
    float _1432 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1422);
    float _1434 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1426);
    float _1436 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1428);
    float _1438 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1430);
    float _1440 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1432);
    float _1442 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1434);
    float _1444 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1436);
    float _1446 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1440);
    float _1448 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1442);
    float _1450 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1444);
    float _1452 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1438);
    out.m_69.x = _1386;
    out.m_69.y = _1384;
    out.m_69.z = _1388;
    out.m_33.x = 1.0;
    out.m_71.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1450;
    out.gl_Position.y = _1448;
    out.gl_Position.z = _1452;
    out.gl_Position.w = _1446;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

