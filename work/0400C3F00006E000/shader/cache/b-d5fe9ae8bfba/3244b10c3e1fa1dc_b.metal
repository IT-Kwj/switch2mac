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
    float4 m_55 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_34 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_47 [[attribute(5)]];
    float4 m_43 [[attribute(6)]];
    float4 m_45 [[attribute(7)]];
    float4 m_51 [[attribute(8)]];
    float4 m_41 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_32.w;
    float _81 = in.m_34.w;
    float _83 = trunc(_79);
    int _86 = int(_83);
    float _88 = -_81;
    float _90 = _88 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_37.y = _90;
    bool _94 = _86 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    if (!_94)
    {
        out.m_39.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1440 = as_type<float>(_104);
        out.gl_Position.z = _1440;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _108 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_81);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = float(_86);
    bool _120 = _90 >= _118;
    bool _122 = !_116;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_39.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _106 = as_type<int>(_130);
    }
    int _132 = _106;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1496 = as_type<float>(_132);
        out.gl_Position.z = _1496;
    }
    if (_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_41.x;
    float _136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _138 = _90 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _140 = in.m_43.x;
    float _142 = _90 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _144 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _146 = _144 != 0;
    float _148 = in.m_41.y;
    int _150 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _152 = _150 != 0;
    float _154 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _156 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _158 = _156 != 0;
    float _160 = in.m_43.w;
    float _162 = in.m_45.x;
    float _164 = in.m_45.y;
    float _166 = in.m_45.z;
    float _168 = _138 * _136;
    float _170 = in.m_43.y;
    float _172 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _174 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _172;
    float _176 = in.m_47.x;
    float _178 = in.m_47.y;
    float _180 = in.m_47.z;
    int _182 = 0;
    float _184 = _134;
    float _186 = _174;
    float _188 = 0.5;
    float _190 = _142;
    if (_146)
    {
        float _192 = -_134;
        float _194 = _192 + 1.0;
        _182 = as_type<int>(_194);
    }
    int _196 = _182;
    float _198 = 0.0;
    if (!_146)
    {
        _198 = _134;
    }
    float _200 = _198;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _204 = in.m_49.x;
    float _206 = in.m_49.y;
    float _208 = in.m_49.z;
    bool _210 = false;
    float _212 = _200;
    float _214 = _202;
    if (_146)
    {
        bool _216 = _140 > 0.5;
        _210 = _216;
    }
    bool _218 = _210;
    float _220 = 0.0;
    if (!_158)
    {
        _220 = _140;
    }
    float _222 = _220;
    float _224 = in.m_51.x;
    float _226 = in.m_51.y;
    float _228 = in.m_51.z;
    float _230 = in.m_51.w;
    float _232 = -_148;
    float _234 = _232 + 1.0;
    float _236 = _222;
    float _238 = _148;
    float _240 = _234;
    if (_146)
    {
        float _242 = _218 ? as_type<float>(_196) : _134;
        _212 = _242;
    }
    float _244 = _212;
    bool _246 = _160 > 0.5;
    float _248 = in.m_43.z;
    int _250 = _246 ? as_type<int>(_234) : as_type<int>(_148);
    float _252 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _256 = _254 != 0;
    float _258 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _262 = _260 != 0;
    float _264 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _268 = _266 != 0;
    float _270 = _166 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _274 = _272 != 0;
    float _276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _180);
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _280 = _278 != 0;
    float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _284 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _176);
    float _286 = _262 ? as_type<float>(_250) : _148;
    float _288 = in.m_45.w;
    float _290 = _204 * _228;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _294 = _140 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _296 = _170 > 0.5;
    float _298 = -_290;
    float _300 = fma(_208, _224, _298);
    float _302 = fma(_264, -2.0, _292);
    float _304 = -_154;
    float _306 = fma(_294, 2.0, _304);
    float _308 = _208 * _226;
    float _310 = _206 * _224;
    float _312 = _300 * _230;
    float _314 = -_308;
    float _316 = fma(_228, _206, _314);
    float _318 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _320 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _318;
    float _322 = -_310;
    float _324 = fma(_226, _204, _322);
    float _326 = _316 * _230;
    float _328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _330 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _332 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _330;
    float _334 = _320 * _320;
    float _336 = _324 * _230;
    int _338 = _296 ? as_type<int>(_234) : as_type<int>(_148);
    float _340 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[76].y, _302);
    float _342 = fma(_332, _332, _334);
    float _344 = _282 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _346 = _274 ? as_type<float>(_338) : _148;
    float _348 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _178);
    float _350 = fma(_286, _344, -0.5);
    float _352 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    float _354 = fma(_174, _174, _342);
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _358 = _328 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _360 = floor(_352);
    float _362 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[88].z, _356);
    float _364 = fma(_358, _346, -0.5);
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _368 = _332;
    bool _370 = _274;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _374 = _170;
    float _376 = _364;
    float _378 = _226;
    if (!_158)
    {
        _368 = _248;
    }
    float _380 = _368;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _384 = _380;
    if (_256)
    {
        bool _386 = _248 > 0.5;
        _370 = _386;
    }
    bool _388 = _370;
    float _390 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].w, _366);
    float _392 = 0.0;
    if (!_158)
    {
        _392 = _170;
    }
    float _394 = _392;
    float _396 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[88].w, _382);
    float _398 = 0.0;
    float _400 = _394;
    if (!_256)
    {
        _398 = _134;
    }
    float _402 = _398;
    float _404 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[77].w, _390);
    float _406 = 0.0;
    float _408 = _402;
    if (!_158)
    {
        _406 = _380;
    }
    float _410 = _406;
    float _412 = _410;
    if (_158)
    {
        _384 = _248;
    }
    float _414 = _384;
    float _416 = -_360;
    float _418 = _352 + _416;
    int _420 = as_type<int>(_360);
    if (_256)
    {
        float _422 = -_134;
        float _424 = _422 + 1.0;
        _420 = as_type<int>(_424);
    }
    int _426 = _420;
    float _428 = _352 * 6.283185482025146484375;
    int _430 = _426;
    if (!_158)
    {
        _372 = _394;
    }
    float _432 = _372;
    float _434 = -_340;
    float _436 = fma(_404, _364, _434);
    float _438 = _432;
    if (_158)
    {
        _400 = _170;
    }
    float _440 = _400;
    float _442 = _428 * 0.15915493667125701904296875;
    if (_256)
    {
        float _444 = _388 ? as_type<float>(_426) : _134;
        _408 = _444;
    }
    float _446 = _408;
    if (_268)
    {
        float _448 = -_134;
        float _450 = _448 + 1.0;
        _430 = as_type<int>(_450);
    }
    int _452 = _430;
    if (!_158)
    {
        _374 = _410;
    }
    float _454 = _374;
    float _456 = in.m_32.x;
    float _458 = in.m_32.y;
    float _460 = in.m_32.z;
    float _462 = _454;
    if (_158)
    {
        _412 = _414;
    }
    float _464 = _412;
    float _466 = _442 * 6.283185482025146484375;
    float _468 = cos(_466);
    bool _470 = _414 > 0.5;
    if (_268)
    {
        float _472 = _296 ? as_type<float>(_452) : _134;
        _184 = _472;
    }
    float _474 = _184;
    float _476 = in.m_34.x;
    float _478 = in.m_34.y;
    float _480 = in.m_34.z;
    bool _482 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _486 = _482 || _484;
    bool _488 = isnan(1.0);
    bool _490 = _486 || _488;
    if (_158)
    {
        _376 = _140;
    }
    float _492 = _376;
    float _494 = _492;
    if (_158)
    {
        _236 = _464;
    }
    float _496 = _236;
    if (!_158)
    {
        _494 = _464;
    }
    float _498 = _494;
    float _500 = sqrt(_354);
    float _502 = fma(_468, 0.5, 0.5);
    if (!_158)
    {
        _186 = _432;
    }
    float _504 = _186;
    float _506 = _504;
    if (_158)
    {
        _438 = _140;
    }
    float _508 = _438;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_280)
    {
        float _512 = _470 ? _234 : _148;
        _238 = _512;
    }
    float _514 = _238;
    if (!_490)
    {
        float _516 = _142 * _142;
        float _518 = _516 * 0.5;
        _240 = _518;
    }
    float _520 = _240;
    float _522 = _520;
    if (_158)
    {
        _188 = _440;
    }
    float _524 = _188;
    float _526 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[83].z, _202);
    float _528 = _524;
    if (!_158)
    {
        _214 = _454;
    }
    float _530 = _214;
    float _532 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[78].z, _510);
    float _534 = _530;
    if (_158)
    {
        _462 = _440;
    }
    float _536 = _462;
    if (!_490)
    {
        float _538 = _520 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _522 = _538;
    }
    float _540 = _522;
    float _542 = _540;
    if (_158)
    {
        _534 = _440;
    }
    float _544 = _534;
    if (_158)
    {
        _506 = _140;
    }
    float _546 = _506;
    if (!_158)
    {
        _528 = _140;
    }
    float _548 = _528;
    bool _550 = !_490;
    if (!_550)
    {
        float _552 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _554 = log2(_552);
        float _556 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _558 = _556 + 1.0;
        float _560 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _562 = _142 * _554;
        float _564 = 1.0 / _558;
        float _566 = _560 * 0.693147182464599609375;
        float _568 = exp2(_562);
        float _570 = 1.0 / _566;
        float _572 = _568 + (-1.0);
        float _574 = -_572;
        float _576 = fma(_574, _570, _142);
        float _578 = _576 * _564;
        float _580 = _578 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _542 = _580;
    }
    float _582 = _542;
    bool _584 = !_490;
    if (!_584)
    {
        float _586 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _588 = log2(_586);
        float _590 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _592 = _590 + 1.0;
        float _594 = 1.0 / _592;
        float _596 = _142 * _588;
        float _598 = exp2(_596);
        float _600 = -_598;
        float _602 = _600 + 1.0;
        float _604 = _602 * _594;
        _190 = _604;
    }
    float _606 = _190;
    float _608 = _582 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _610 = _582 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _612 = _582 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _616 = fma(_606, _478, _608);
    float _618 = fma(_606, _480, _610);
    float _620 = fma(_606, _476, _612);
    float _622 = fma(_616, _288, _458);
    float _624 = fma(_618, _288, _460);
    float _626 = fma(_620, _288, _456);
    float _628 = _622 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _630 = _622 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _632 = _622 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _636 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[5].x, _628);
    bool _638 = _418 < 0.5;
    float _640 = float(_638);
    float _642 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[4].x, _630);
    float _644 = -_418;
    float _646 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _648 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[5].z, _636);
    float _650 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[6].x, _632);
    float _652 = -_640;
    float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _656 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[4].z, _642);
    float _658 = _648 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _660 = -_502;
    float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _664 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[6].z, _650);
    float _666 = _656 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _668 = -_658;
    float _670 = _668 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _672 = _614 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _674 = _664 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _676 = -_666;
    float _678 = _676 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _680 = _670 * _670;
    float _682 = _634 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _684 = -_674;
    float _686 = _684 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _690 = fma(_678, _678, _680);
    float _692 = fma(_672, _244, -0.5);
    float _694 = fma(_682, _446, -0.5);
    float _696 = fma(_686, _686, _690);
    float _698 = fma(_500, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _702 = rsqrt(_696);
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _706 = _546 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _710 = _708 != 0;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _714 = _712 != 0;
    float _716 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[84].z, _700);
    bool _718 = !_152;
    int _720 = _718 ? 0 : 1;
    float _722 = -_704;
    float _724 = fma(_706, 2.0, _722);
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _728 = !_710;
    int _730 = _728 ? 0 : 1;
    float _732 = _688 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _734 = abs(_720);
    float _736 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[83].w, _726);
    float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _740 = abs(_730);
    float _742 = fma(_732, _474, -0.5);
    bool _744 = !_714;
    int _746 = _744 ? 0 : 1;
    float _748 = _678 * _702;
    float _750 = _686 * _702;
    float _752 = _670 * _702;
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _756 = _748 * _754;
    float _758 = float(_740);
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _762 = _750 * _760;
    int _764 = abs(_746);
    float _766 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _768 = -_756;
    float _770 = fma(_750, _766, _768);
    float _772 = float(_734);
    float _774 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _776 = _752 * _774;
    float _778 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _780 = -_762;
    float _782 = fma(_752, _778, _780);
    float _784 = _770 * _770;
    float _786 = abs(_646);
    float _788 = _758 * _786;
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _792 = -_776;
    float _794 = fma(_748, _790, _792);
    float _796 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[77].z, _532);
    float _798 = fma(_782, _782, _784);
    float _800 = fma(_772, _662, _788);
    float _802 = _738 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _804 = float(_764);
    float _806 = fma(_794, _794, _798);
    float _808 = fma(_802, _514, -0.5);
    float _810 = -_90;
    float _812 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[76].x, _306);
    float _814 = rsqrt(_806);
    float _816 = abs(_654);
    float _818 = fma(_804, _816, _800);
    float _820 = _544 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _822 = fma(_796, _692, _812);
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _826 = _818 * _252;
    float _828 = _498 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _830 = _818 * _258;
    float _832 = _826 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _834 = -_824;
    float _836 = fma(_828, 2.0, _834);
    float _838 = _818 * _270;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _842 = _284 * _832;
    float _844 = _830 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _846 = precise::max(_698, 1.0);
    float _848 = _782 * _814;
    float _850 = _770 * _814;
    float _852 = _794 * _814;
    float _854 = fma(_820, -2.0, _840);
    float _856 = _752 * _848;
    float _858 = _750 * _850;
    float _860 = _838 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _862 = _348 * _844;
    float _864 = -_856;
    float _866 = fma(_748, _850, _864);
    float _868 = -_858;
    float _870 = fma(_752, _852, _868);
    float _872 = _276 * _860;
    float _874 = _862 * _866;
    float _876 = _862 * _870;
    float _878 = precise::min(_846, 1.89999997615814208984375);
    float _880 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[84].x, _716);
    float _882 = fma(_842, _852, _874);
    float _884 = fma(_842, _848, _876);
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _888 = _548 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _890 = fma(_872, _750, _882);
    float _892 = fma(_872, _748, _884);
    float _894 = _880 * (-0.15915493667125701904296875);
    float _896 = fma(_888, -2.0, _886);
    float _898 = fma(_890, _878, _674);
    float _900 = fma(_892, _878, _666);
    float _902 = _894 * 6.283185482025146484375;
    float _904 = sin(_902);
    float _906 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[87].w, _396);
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _910 = _898 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _914 = _900 + _912;
    float _916 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[82].z, _526);
    float _918 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[86].y, _896);
    float _920 = _910 * _910;
    float _922 = _914 * _914;
    float _924 = _894 * 6.283185482025146484375;
    float _926 = cos(_924);
    float _928 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[87].z, _362);
    float _930 = -_90;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[86].x, _836);
    float _934 = _922 + _920;
    float _936 = -_918;
    float _938 = fma(_906, _808, _936);
    float _940 = -_90;
    float _942 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[81].x, _724);
    float _944 = _748 * _852;
    float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _948 = _658 + _946;
    float _950 = sqrt(_934);
    float _952 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[82].w, _736);
    float _954 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[81].y, _854);
    float _956 = fma(_928, _742, _932);
    float _958 = _904 * _350;
    float _960 = -_944;
    float _962 = fma(_750, _848, _960);
    float _964 = _948 * _948;
    float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _968 = _674 + _966;
    float _970 = _926 * _350;
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _974 = _666 + _972;
    float _976 = -_958;
    float _978 = fma(_926, _694, _976);
    float _980 = _862 * _962;
    float _982 = fma(_904, _694, _970);
    float _984 = fma(_974, _974, _964);
    float _986 = fma(_916, _978, _942);
    float _988 = fma(_842, _850, _980);
    bool _990 = _950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _992 = fma(_968, _968, _984);
    float _994 = fma(_872, _752, _988);
    float _996 = -_954;
    float _998 = fma(_952, _982, _996);
    float _1000 = rsqrt(_992);
    float _1002 = _312 * _870;
    float _1004 = fma(_994, _878, _658);
    float _1006 = _312 * _866;
    float _1008 = _870 * _226;
    float _1010 = _962 * _226;
    float _1012 = _866 * _226;
    float _1014 = _312 * _962;
    float _1016 = _866;
    float _1018 = _878;
    float _1020 = _922;
    float _1022 = _920;
    if (!_990)
    {
        _378 = _900;
    }
    float _1024 = _378;
    float _1026 = _1024;
    if (!_990)
    {
        _1016 = _898;
    }
    float _1028 = _1016;
    float _1030 = _1028;
    if (!_990)
    {
        _1018 = _1004;
    }
    float _1032 = _1018;
    bool _1034 = !_990;
    float _1036 = _1032;
    if (!_1034)
    {
        float _1038 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1040 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1042 = _950 + _1040;
        float _1044 = _1004 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = rsqrt(_934);
        float _1048 = _1042 * _1038;
        float _1050 = _1048 * 0.15915493667125701904296875;
        float _1052 = _1050 * 6.283185482025146484375;
        float _1054 = sin(_1052);
        float _1056 = _1050 * 6.283185482025146484375;
        float _1058 = cos(_1056);
        float _1060 = fma(_1054, _1044, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1062 = _1046 * _1060;
        float _1064 = fma(_914, _1062, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1066 = _1058 + (-1.0);
        float _1068 = fma(_910, _1062, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1072 = _1064 + _1070;
        float _1074 = _1066 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1078 = _1068 + _1076;
        float _1080 = _1072 * _1072;
        float _1082 = fma(_1004, _1058, _1074);
        float _1084 = _1078 * _1078;
        _1036 = _1082;
        _1020 = _1080;
        _1022 = _1084;
        _1026 = _1064;
        _1030 = _1068;
    }
    float _1086 = _1036;
    float _1088 = _1020;
    float _1090 = _1022;
    float _1092 = _1026;
    float _1094 = _1030;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1098 = _1086 + _1096;
    float _1100 = fma(_326, _848, _1002);
    float _1102 = fma(_326, _852, _1006);
    float _1104 = fma(_848, _224, _1008);
    float _1106 = fma(_1098, _1098, _1088);
    float _1108 = fma(_850, _224, _1010);
    float _1110 = fma(_852, _224, _1012);
    float _1112 = fma(_326, _850, _1014);
    float _1114 = _1106 + _1090;
    float _1116 = fma(_336, _750, _1102);
    float _1118 = _974 * _1000;
    float _1120 = _968 * _1000;
    float _1122 = sqrt(_1114);
    float _1124 = fma(_336, _752, _1112);
    float _1126 = _986 + 0.5;
    float _1128 = _948 * _1000;
    float _1130 = fma(_336, _748, _1100);
    float _1132 = _436 + 0.5;
    float _1134 = _822 + 0.5;
    float _1136 = _956 + 0.5;
    float _1138 = _938 + 0.5;
    float _1140 = _998 + 0.5;
    float _1142 = fma(_748, _228, _1104);
    float _1144 = fma(_752, _228, _1108);
    float _1146 = fma(_750, _228, _1110);
    out.m_53.x = _1136;
    out.m_53.y = _1138;
    bool _1148 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1150 = isnan(_1122);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1156 = _1152 || _1154;
    out.m_55.x = _1134;
    out.m_55.y = _1132;
    out.m_55.z = _1126;
    out.m_55.w = _1140;
    out.m_57.x = _1118;
    out.m_57.y = _1128;
    out.m_57.z = _1120;
    out.m_59.x = _1130;
    out.m_59.y = _1124;
    out.m_59.z = _1116;
    out.m_61.x = _1142;
    out.m_61.y = _1144;
    out.m_61.z = _1146;
    float _1158 = _1114;
    if (!_1156)
    {
        _1158 = 1.0;
    }
    float _1160 = _1158;
    bool _1162 = !_1156;
    float _1164 = _1160;
    if (!_1162)
    {
        bool _1166 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1168 = isnan(_1122);
        bool _1170 = _1166 || _1168;
        bool _1172 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1174 = _1170 || _1172;
        if (!_1174)
        {
            float _1176 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1178 = _1122 + _1176;
            float _1180 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1182 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1180;
            float _1184 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1186 = _1184 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1188 = 1.0 / _1182;
            float _1190 = _1178 * _1188;
            float _1192 = fma(_1190, _1186, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1164 = _1192;
            _1194 = true;
        }
        else
        {
            bool _1196 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1198 = isnan(_1122);
            bool _1200 = _1196 || _1198;
            bool _1202 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1204 = _1200 || _1202;
            if (!_1204)
            {
                float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1208 = _1122 + _1206;
                float _1210 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1212 = _1210 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1214 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1216 = _1214 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1218 = 1.0 / _1212;
                float _1220 = _1208 * _1218;
                float _1222 = fma(_1220, _1216, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1164 = _1222;
                _1194 = true;
            }
            else
            {
                _1164 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1194 = false;
    float _1224 = _1164;
    float _1226 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1228 = _1092 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1232 = _1086 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1236 = _1094 + _1234;
    bool _1238 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan(0.5);
    bool _1246 = _1242 || _1244;
    float _1248 = fma(_1228, _1224, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1250 = fma(_1232, _1224, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1252 = fma(_1236, _1224, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1254 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1256 = _1228;
    float _1258 = _1224;
    if (_1246)
    {
        _1254 = _1248;
    }
    float _1260 = _1254;
    float _1262 = _1260;
    if (_1246)
    {
        _1256 = _1250;
    }
    float _1264 = _1256;
    float _1266 = _1264;
    if (_1246)
    {
        _1258 = _1252;
    }
    float _1268 = _1258;
    float _1270 = _1268;
    if (!_1246)
    {
        float _1272 = sqrt(_992);
        float _1274 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1278 = precise::min(_1272, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1280 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1282 = _1278 * _1276;
        float _1284 = -_666;
        float _1286 = _1284 + _1248;
        float _1288 = _1280 * _1282;
        float _1290 = -_658;
        float _1292 = _1290 + _1250;
        float _1294 = -_674;
        float _1296 = _1294 + _1252;
        float _1298 = fma(_1286, _1288, _666);
        float _1300 = fma(_1292, _1288, _658);
        float _1302 = fma(_1296, _1288, _674);
        _1266 = _1300;
        _1262 = _1298;
        _1270 = _1302;
    }
    float _1304 = _1266;
    float _1306 = _1262;
    float _1308 = _1270;
    float _1310 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1312 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1314 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1316 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1318 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1310);
    float _1320 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1312);
    float _1322 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1314);
    float _1324 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1316);
    float _1326 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1318);
    float _1328 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1320);
    float _1330 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1322);
    float _1332 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1324);
    float _1334 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1336 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1338 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1340 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1342 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1344 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1346 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1348 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1350 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1342);
    float _1352 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1344);
    float _1354 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1346);
    float _1356 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1348);
    float _1358 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1350);
    float _1360 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1352);
    float _1362 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1354);
    float _1364 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1356);
    float _1366 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1368 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1358);
    float _1370 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1360);
    float _1372 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1362);
    float _1374 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1364);
    out.m_63.x = _666;
    out.m_63.y = _658;
    out.m_63.z = _674;
    out.m_39.x = 1.0;
    out.m_65.w = _1366;
    out.gl_Position.x = _1368;
    out.gl_Position.y = _1370;
    out.gl_Position.z = _1372;
    out.gl_Position.w = _1374;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_32.w;
    float _81 = in.m_34.w;
    float _83 = trunc(_79);
    int _86 = int(_83);
    float _88 = -_81;
    float _90 = _88 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_37.y = _90;
    bool _94 = _86 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    if (!_94)
    {
        out.m_39.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1440 = as_type<float>(_104);
        out.gl_Position.z = _1440;
    }
    if (!_94)
    {
        return out;
    }
    bool _108 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_81);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = float(_86);
    bool _120 = _90 >= _118;
    bool _122 = !_116;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_39.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _106 = as_type<int>(_130);
    }
    int _132 = _106;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1496 = as_type<float>(_132);
        out.gl_Position.z = _1496;
    }
    if (_124)
    {
        return out;
    }
    float _134 = in.m_41.x;
    float _136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _138 = _90 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _140 = in.m_43.x;
    float _142 = _90 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _144 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _146 = _144 != 0;
    float _148 = in.m_41.y;
    int _150 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _152 = _150 != 0;
    float _154 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _156 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _158 = _156 != 0;
    float _160 = in.m_43.w;
    float _162 = in.m_45.x;
    float _164 = in.m_45.y;
    float _166 = in.m_45.z;
    float _168 = _138 * _136;
    float _170 = in.m_43.y;
    float _172 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _174 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _172;
    float _176 = in.m_47.x;
    float _178 = in.m_47.y;
    float _180 = in.m_47.z;
    int _182 = 0;
    float _184 = _134;
    float _186 = _174;
    float _188 = 0.5;
    float _190 = _142;
    if (_146)
    {
        float _192 = -_134;
        float _194 = _192 + 1.0;
        _182 = as_type<int>(_194);
    }
    int _196 = _182;
    float _198 = 0.0;
    if (!_146)
    {
        _198 = _134;
    }
    float _200 = _198;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _204 = in.m_49.x;
    float _206 = in.m_49.y;
    float _208 = in.m_49.z;
    bool _210 = false;
    float _212 = _200;
    float _214 = _202;
    if (_146)
    {
        bool _216 = _140 > 0.5;
        _210 = _216;
    }
    bool _218 = _210;
    float _220 = 0.0;
    if (!_158)
    {
        _220 = _140;
    }
    float _222 = _220;
    float _224 = in.m_51.x;
    float _226 = in.m_51.y;
    float _228 = in.m_51.z;
    float _230 = in.m_51.w;
    float _232 = -_148;
    float _234 = _232 + 1.0;
    float _236 = _222;
    float _238 = _148;
    float _240 = _234;
    if (_146)
    {
        float _242 = _218 ? as_type<float>(_196) : _134;
        _212 = _242;
    }
    float _244 = _212;
    bool _246 = _160 > 0.5;
    float _248 = in.m_43.z;
    int _250 = _246 ? as_type<int>(_234) : as_type<int>(_148);
    float _252 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _256 = _254 != 0;
    float _258 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _262 = _260 != 0;
    float _264 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _268 = _266 != 0;
    float _270 = _166 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _274 = _272 != 0;
    float _276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _180);
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _280 = _278 != 0;
    float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _284 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _176);
    float _286 = _262 ? as_type<float>(_250) : _148;
    float _288 = in.m_45.w;
    float _290 = _204 * _228;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _294 = _140 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _296 = _170 > 0.5;
    float _298 = -_290;
    float _300 = fma(_208, _224, _298);
    float _302 = fma(_264, -2.0, _292);
    float _304 = -_154;
    float _306 = fma(_294, 2.0, _304);
    float _308 = _208 * _226;
    float _310 = _206 * _224;
    float _312 = _300 * _230;
    float _314 = -_308;
    float _316 = fma(_228, _206, _314);
    float _318 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _320 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _318;
    float _322 = -_310;
    float _324 = fma(_226, _204, _322);
    float _326 = _316 * _230;
    float _328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _330 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _332 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _330;
    float _334 = _320 * _320;
    float _336 = _324 * _230;
    int _338 = _296 ? as_type<int>(_234) : as_type<int>(_148);
    float _340 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[76].y, _302);
    float _342 = fma(_332, _332, _334);
    float _344 = _282 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _346 = _274 ? as_type<float>(_338) : _148;
    float _348 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _178);
    float _350 = fma(_286, _344, -0.5);
    float _352 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    float _354 = fma(_174, _174, _342);
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _358 = _328 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _360 = floor(_352);
    float _362 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[88].z, _356);
    float _364 = fma(_358, _346, -0.5);
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _368 = _332;
    bool _370 = _274;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _374 = _170;
    float _376 = _364;
    float _378 = _226;
    if (!_158)
    {
        _368 = _248;
    }
    float _380 = _368;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _384 = _380;
    if (_256)
    {
        bool _386 = _248 > 0.5;
        _370 = _386;
    }
    bool _388 = _370;
    float _390 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].w, _366);
    float _392 = 0.0;
    if (!_158)
    {
        _392 = _170;
    }
    float _394 = _392;
    float _396 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[88].w, _382);
    float _398 = 0.0;
    float _400 = _394;
    if (!_256)
    {
        _398 = _134;
    }
    float _402 = _398;
    float _404 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[77].w, _390);
    float _406 = 0.0;
    float _408 = _402;
    if (!_158)
    {
        _406 = _380;
    }
    float _410 = _406;
    float _412 = _410;
    if (_158)
    {
        _384 = _248;
    }
    float _414 = _384;
    float _416 = -_360;
    float _418 = _352 + _416;
    int _420 = as_type<int>(_360);
    if (_256)
    {
        float _422 = -_134;
        float _424 = _422 + 1.0;
        _420 = as_type<int>(_424);
    }
    int _426 = _420;
    float _428 = _352 * 6.283185482025146484375;
    int _430 = _426;
    if (!_158)
    {
        _372 = _394;
    }
    float _432 = _372;
    float _434 = -_340;
    float _436 = fma(_404, _364, _434);
    float _438 = _432;
    if (_158)
    {
        _400 = _170;
    }
    float _440 = _400;
    float _442 = _428 * 0.15915493667125701904296875;
    if (_256)
    {
        float _444 = _388 ? as_type<float>(_426) : _134;
        _408 = _444;
    }
    float _446 = _408;
    if (_268)
    {
        float _448 = -_134;
        float _450 = _448 + 1.0;
        _430 = as_type<int>(_450);
    }
    int _452 = _430;
    if (!_158)
    {
        _374 = _410;
    }
    float _454 = _374;
    float _456 = in.m_32.x;
    float _458 = in.m_32.y;
    float _460 = in.m_32.z;
    float _462 = _454;
    if (_158)
    {
        _412 = _414;
    }
    float _464 = _412;
    float _466 = _442 * 6.283185482025146484375;
    float _468 = cos(_466);
    bool _470 = _414 > 0.5;
    if (_268)
    {
        float _472 = _296 ? as_type<float>(_452) : _134;
        _184 = _472;
    }
    float _474 = _184;
    float _476 = in.m_34.x;
    float _478 = in.m_34.y;
    float _480 = in.m_34.z;
    bool _482 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _486 = _482 || _484;
    bool _488 = isnan(1.0);
    bool _490 = _486 || _488;
    if (_158)
    {
        _376 = _140;
    }
    float _492 = _376;
    float _494 = _492;
    if (_158)
    {
        _236 = _464;
    }
    float _496 = _236;
    if (!_158)
    {
        _494 = _464;
    }
    float _498 = _494;
    float _500 = sqrt(_354);
    float _502 = fma(_468, 0.5, 0.5);
    if (!_158)
    {
        _186 = _432;
    }
    float _504 = _186;
    float _506 = _504;
    if (_158)
    {
        _438 = _140;
    }
    float _508 = _438;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_280)
    {
        float _512 = _470 ? _234 : _148;
        _238 = _512;
    }
    float _514 = _238;
    if (!_490)
    {
        float _516 = _142 * _142;
        float _518 = _516 * 0.5;
        _240 = _518;
    }
    float _520 = _240;
    float _522 = _520;
    if (_158)
    {
        _188 = _440;
    }
    float _524 = _188;
    float _526 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[83].z, _202);
    float _528 = _524;
    if (!_158)
    {
        _214 = _454;
    }
    float _530 = _214;
    float _532 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[78].z, _510);
    float _534 = _530;
    if (_158)
    {
        _462 = _440;
    }
    float _536 = _462;
    if (!_490)
    {
        float _538 = _520 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _522 = _538;
    }
    float _540 = _522;
    float _542 = _540;
    if (_158)
    {
        _534 = _440;
    }
    float _544 = _534;
    if (_158)
    {
        _506 = _140;
    }
    float _546 = _506;
    if (!_158)
    {
        _528 = _140;
    }
    float _548 = _528;
    bool _550 = !_490;
    if (!_550)
    {
        float _552 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _554 = log2(_552);
        float _556 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _558 = _556 + 1.0;
        float _560 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _562 = _142 * _554;
        float _564 = 1.0 / _558;
        float _566 = _560 * 0.693147182464599609375;
        float _568 = exp2(_562);
        float _570 = 1.0 / _566;
        float _572 = _568 + (-1.0);
        float _574 = -_572;
        float _576 = fma(_574, _570, _142);
        float _578 = _576 * _564;
        float _580 = _578 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _542 = _580;
    }
    float _582 = _542;
    bool _584 = !_490;
    if (!_584)
    {
        float _586 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _588 = log2(_586);
        float _590 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _592 = _590 + 1.0;
        float _594 = 1.0 / _592;
        float _596 = _142 * _588;
        float _598 = exp2(_596);
        float _600 = -_598;
        float _602 = _600 + 1.0;
        float _604 = _602 * _594;
        _190 = _604;
    }
    float _606 = _190;
    float _608 = _582 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _610 = _582 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _612 = _582 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _616 = fma(_606, _478, _608);
    float _618 = fma(_606, _480, _610);
    float _620 = fma(_606, _476, _612);
    float _622 = fma(_616, _288, _458);
    float _624 = fma(_618, _288, _460);
    float _626 = fma(_620, _288, _456);
    float _628 = _622 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _630 = _622 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _632 = _622 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _636 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[5].x, _628);
    bool _638 = _418 < 0.5;
    float _640 = float(_638);
    float _642 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[4].x, _630);
    float _644 = -_418;
    float _646 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _648 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[5].z, _636);
    float _650 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[6].x, _632);
    float _652 = -_640;
    float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _656 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[4].z, _642);
    float _658 = _648 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _660 = -_502;
    float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _664 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[6].z, _650);
    float _666 = _656 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _668 = -_658;
    float _670 = _668 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _672 = _614 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _674 = _664 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _676 = -_666;
    float _678 = _676 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _680 = _670 * _670;
    float _682 = _634 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _684 = -_674;
    float _686 = _684 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _690 = fma(_678, _678, _680);
    float _692 = fma(_672, _244, -0.5);
    float _694 = fma(_682, _446, -0.5);
    float _696 = fma(_686, _686, _690);
    float _698 = fma(_500, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _702 = rsqrt(_696);
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _706 = _546 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _710 = _708 != 0;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _714 = _712 != 0;
    float _716 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[84].z, _700);
    bool _718 = !_152;
    int _720 = _718 ? 0 : 1;
    float _722 = -_704;
    float _724 = fma(_706, 2.0, _722);
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _728 = !_710;
    int _730 = _728 ? 0 : 1;
    float _732 = _688 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _734 = abs(_720);
    float _736 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[83].w, _726);
    float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _740 = abs(_730);
    float _742 = fma(_732, _474, -0.5);
    bool _744 = !_714;
    int _746 = _744 ? 0 : 1;
    float _748 = _678 * _702;
    float _750 = _686 * _702;
    float _752 = _670 * _702;
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _756 = _748 * _754;
    float _758 = float(_740);
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _762 = _750 * _760;
    int _764 = abs(_746);
    float _766 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _768 = -_756;
    float _770 = fma(_750, _766, _768);
    float _772 = float(_734);
    float _774 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _776 = _752 * _774;
    float _778 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _780 = -_762;
    float _782 = fma(_752, _778, _780);
    float _784 = _770 * _770;
    float _786 = abs(_646);
    float _788 = _758 * _786;
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _792 = -_776;
    float _794 = fma(_748, _790, _792);
    float _796 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[77].z, _532);
    float _798 = fma(_782, _782, _784);
    float _800 = fma(_772, _662, _788);
    float _802 = _738 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _804 = float(_764);
    float _806 = fma(_794, _794, _798);
    float _808 = fma(_802, _514, -0.5);
    float _810 = -_90;
    float _812 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[76].x, _306);
    float _814 = rsqrt(_806);
    float _816 = abs(_654);
    float _818 = fma(_804, _816, _800);
    float _820 = _544 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _822 = fma(_796, _692, _812);
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _826 = _818 * _252;
    float _828 = _498 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _830 = _818 * _258;
    float _832 = _826 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _834 = -_824;
    float _836 = fma(_828, 2.0, _834);
    float _838 = _818 * _270;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _842 = _284 * _832;
    float _844 = _830 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _846 = precise::max(_698, 1.0);
    float _848 = _782 * _814;
    float _850 = _770 * _814;
    float _852 = _794 * _814;
    float _854 = fma(_820, -2.0, _840);
    float _856 = _752 * _848;
    float _858 = _750 * _850;
    float _860 = _838 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _862 = _348 * _844;
    float _864 = -_856;
    float _866 = fma(_748, _850, _864);
    float _868 = -_858;
    float _870 = fma(_752, _852, _868);
    float _872 = _276 * _860;
    float _874 = _862 * _866;
    float _876 = _862 * _870;
    float _878 = precise::min(_846, 1.89999997615814208984375);
    float _880 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[84].x, _716);
    float _882 = fma(_842, _852, _874);
    float _884 = fma(_842, _848, _876);
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _888 = _548 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _890 = fma(_872, _750, _882);
    float _892 = fma(_872, _748, _884);
    float _894 = _880 * (-0.15915493667125701904296875);
    float _896 = fma(_888, -2.0, _886);
    float _898 = fma(_890, _878, _674);
    float _900 = fma(_892, _878, _666);
    float _902 = _894 * 6.283185482025146484375;
    float _904 = sin(_902);
    float _906 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[87].w, _396);
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _910 = _898 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _914 = _900 + _912;
    float _916 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[82].z, _526);
    float _918 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[86].y, _896);
    float _920 = _910 * _910;
    float _922 = _914 * _914;
    float _924 = _894 * 6.283185482025146484375;
    float _926 = cos(_924);
    float _928 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[87].z, _362);
    float _930 = -_90;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[86].x, _836);
    float _934 = _922 + _920;
    float _936 = -_918;
    float _938 = fma(_906, _808, _936);
    float _940 = -_90;
    float _942 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[81].x, _724);
    float _944 = _748 * _852;
    float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _948 = _658 + _946;
    float _950 = sqrt(_934);
    float _952 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[82].w, _736);
    float _954 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[81].y, _854);
    float _956 = fma(_928, _742, _932);
    float _958 = _904 * _350;
    float _960 = -_944;
    float _962 = fma(_750, _848, _960);
    float _964 = _948 * _948;
    float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _968 = _674 + _966;
    float _970 = _926 * _350;
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _974 = _666 + _972;
    float _976 = -_958;
    float _978 = fma(_926, _694, _976);
    float _980 = _862 * _962;
    float _982 = fma(_904, _694, _970);
    float _984 = fma(_974, _974, _964);
    float _986 = fma(_916, _978, _942);
    float _988 = fma(_842, _850, _980);
    bool _990 = _950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _992 = fma(_968, _968, _984);
    float _994 = fma(_872, _752, _988);
    float _996 = -_954;
    float _998 = fma(_952, _982, _996);
    float _1000 = rsqrt(_992);
    float _1002 = _312 * _870;
    float _1004 = fma(_994, _878, _658);
    float _1006 = _312 * _866;
    float _1008 = _870 * _226;
    float _1010 = _962 * _226;
    float _1012 = _866 * _226;
    float _1014 = _312 * _962;
    float _1016 = _866;
    float _1018 = _878;
    float _1020 = _922;
    float _1022 = _920;
    if (!_990)
    {
        _378 = _900;
    }
    float _1024 = _378;
    float _1026 = _1024;
    if (!_990)
    {
        _1016 = _898;
    }
    float _1028 = _1016;
    float _1030 = _1028;
    if (!_990)
    {
        _1018 = _1004;
    }
    float _1032 = _1018;
    bool _1034 = !_990;
    float _1036 = _1032;
    if (!_1034)
    {
        float _1038 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1040 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1042 = _950 + _1040;
        float _1044 = _1004 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = rsqrt(_934);
        float _1048 = _1042 * _1038;
        float _1050 = _1048 * 0.15915493667125701904296875;
        float _1052 = _1050 * 6.283185482025146484375;
        float _1054 = sin(_1052);
        float _1056 = _1050 * 6.283185482025146484375;
        float _1058 = cos(_1056);
        float _1060 = fma(_1054, _1044, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1062 = _1046 * _1060;
        float _1064 = fma(_914, _1062, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1066 = _1058 + (-1.0);
        float _1068 = fma(_910, _1062, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1072 = _1064 + _1070;
        float _1074 = _1066 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1078 = _1068 + _1076;
        float _1080 = _1072 * _1072;
        float _1082 = fma(_1004, _1058, _1074);
        float _1084 = _1078 * _1078;
        _1036 = _1082;
        _1020 = _1080;
        _1022 = _1084;
        _1026 = _1064;
        _1030 = _1068;
    }
    float _1086 = _1036;
    float _1088 = _1020;
    float _1090 = _1022;
    float _1092 = _1026;
    float _1094 = _1030;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1098 = _1086 + _1096;
    float _1100 = fma(_326, _848, _1002);
    float _1102 = fma(_326, _852, _1006);
    float _1104 = fma(_848, _224, _1008);
    float _1106 = fma(_1098, _1098, _1088);
    float _1108 = fma(_850, _224, _1010);
    float _1110 = fma(_852, _224, _1012);
    float _1112 = fma(_326, _850, _1014);
    float _1114 = _1106 + _1090;
    float _1116 = fma(_336, _750, _1102);
    float _1118 = _974 * _1000;
    float _1120 = _968 * _1000;
    float _1122 = sqrt(_1114);
    float _1124 = fma(_336, _752, _1112);
    float _1126 = _986 + 0.5;
    float _1128 = _948 * _1000;
    float _1130 = fma(_336, _748, _1100);
    float _1132 = _436 + 0.5;
    float _1134 = _822 + 0.5;
    float _1136 = _956 + 0.5;
    float _1138 = _938 + 0.5;
    float _1140 = _998 + 0.5;
    float _1142 = fma(_748, _228, _1104);
    float _1144 = fma(_752, _228, _1108);
    float _1146 = fma(_750, _228, _1110);
    out.m_53.x = _1136;
    out.m_53.y = _1138;
    bool _1148 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1150 = isnan(_1122);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1156 = _1152 || _1154;
    out.m_55.x = _1134;
    out.m_55.y = _1132;
    out.m_55.z = _1126;
    out.m_55.w = _1140;
    out.m_57.x = _1118;
    out.m_57.y = _1128;
    out.m_57.z = _1120;
    out.m_59.x = _1130;
    out.m_59.y = _1124;
    out.m_59.z = _1116;
    out.m_61.x = _1142;
    out.m_61.y = _1144;
    out.m_61.z = _1146;
    float _1158 = _1114;
    if (!_1156)
    {
        _1158 = 1.0;
    }
    float _1160 = _1158;
    bool _1162 = !_1156;
    float _1164 = _1160;
    if (!_1162)
    {
        bool _1166 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1168 = isnan(_1122);
        bool _1170 = _1166 || _1168;
        bool _1172 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1174 = _1170 || _1172;
        if (!_1174)
        {
            float _1176 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1178 = _1122 + _1176;
            float _1180 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1182 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1180;
            float _1184 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1186 = _1184 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1188 = 1.0 / _1182;
            float _1190 = _1178 * _1188;
            float _1192 = fma(_1190, _1186, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1164 = _1192;
            _1194 = true;
        }
        else
        {
            bool _1196 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1198 = isnan(_1122);
            bool _1200 = _1196 || _1198;
            bool _1202 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1204 = _1200 || _1202;
            if (!_1204)
            {
                float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1208 = _1122 + _1206;
                float _1210 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1212 = _1210 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1214 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1216 = _1214 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1218 = 1.0 / _1212;
                float _1220 = _1208 * _1218;
                float _1222 = fma(_1220, _1216, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1164 = _1222;
                _1194 = true;
            }
            else
            {
                _1164 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1194 = false;
    float _1224 = _1164;
    float _1226 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1228 = _1092 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1232 = _1086 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1236 = _1094 + _1234;
    bool _1238 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan(0.5);
    bool _1246 = _1242 || _1244;
    float _1248 = fma(_1228, _1224, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1250 = fma(_1232, _1224, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1252 = fma(_1236, _1224, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1254 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1256 = _1228;
    float _1258 = _1224;
    if (_1246)
    {
        _1254 = _1248;
    }
    float _1260 = _1254;
    float _1262 = _1260;
    if (_1246)
    {
        _1256 = _1250;
    }
    float _1264 = _1256;
    float _1266 = _1264;
    if (_1246)
    {
        _1258 = _1252;
    }
    float _1268 = _1258;
    float _1270 = _1268;
    if (!_1246)
    {
        float _1272 = sqrt(_992);
        float _1274 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1278 = precise::min(_1272, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1280 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1282 = _1278 * _1276;
        float _1284 = -_666;
        float _1286 = _1284 + _1248;
        float _1288 = _1280 * _1282;
        float _1290 = -_658;
        float _1292 = _1290 + _1250;
        float _1294 = -_674;
        float _1296 = _1294 + _1252;
        float _1298 = fma(_1286, _1288, _666);
        float _1300 = fma(_1292, _1288, _658);
        float _1302 = fma(_1296, _1288, _674);
        _1266 = _1300;
        _1262 = _1298;
        _1270 = _1302;
    }
    float _1304 = _1266;
    float _1306 = _1262;
    float _1308 = _1270;
    float _1310 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1312 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1314 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1316 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1318 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1310);
    float _1320 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1312);
    float _1322 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1314);
    float _1324 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1316);
    float _1326 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1318);
    float _1328 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1320);
    float _1330 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1322);
    float _1332 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1324);
    float _1334 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1336 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1338 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1340 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1342 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1344 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1346 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1348 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1350 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1342);
    float _1352 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1344);
    float _1354 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1346);
    float _1356 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1348);
    float _1358 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1350);
    float _1360 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1352);
    float _1362 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1354);
    float _1364 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1356);
    float _1366 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1368 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1358);
    float _1370 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1360);
    float _1372 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1362);
    float _1374 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1364);
    out.m_63.x = _666;
    out.m_63.y = _658;
    out.m_63.z = _674;
    out.m_39.x = 1.0;
    out.m_65.w = _1366;
    out.gl_Position.x = _1368;
    out.gl_Position.y = _1370;
    out.gl_Position.z = _1372;
    out.gl_Position.w = _1374;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_32.w;
    float _81 = in.m_34.w;
    float _83 = trunc(_79);
    int _86 = int(_83);
    float _88 = -_81;
    float _90 = _88 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_37.y = _90;
    bool _94 = _86 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    if (!_94)
    {
        out.m_39.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1440 = as_type<float>(_104);
        out.gl_Position.z = _1440;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _108 = _81 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_81);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = float(_86);
    bool _120 = _90 >= _118;
    bool _122 = !_116;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_39.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _106 = as_type<int>(_130);
    }
    int _132 = _106;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1496 = as_type<float>(_132);
        out.gl_Position.z = _1496;
    }
    if (_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_41.x;
    float _136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _138 = _90 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _140 = in.m_43.x;
    float _142 = _90 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _144 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _146 = _144 != 0;
    float _148 = in.m_41.y;
    int _150 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _152 = _150 != 0;
    float _154 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _156 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _158 = _156 != 0;
    float _160 = in.m_43.w;
    float _162 = in.m_45.x;
    float _164 = in.m_45.y;
    float _166 = in.m_45.z;
    float _168 = _138 * _136;
    float _170 = in.m_43.y;
    float _172 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _174 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _172;
    float _176 = in.m_47.x;
    float _178 = in.m_47.y;
    float _180 = in.m_47.z;
    int _182 = 0;
    float _184 = _134;
    float _186 = _174;
    float _188 = 0.5;
    float _190 = _142;
    if (_146)
    {
        float _192 = -_134;
        float _194 = _192 + 1.0;
        _182 = as_type<int>(_194);
    }
    int _196 = _182;
    float _198 = 0.0;
    if (!_146)
    {
        _198 = _134;
    }
    float _200 = _198;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _204 = in.m_49.x;
    float _206 = in.m_49.y;
    float _208 = in.m_49.z;
    bool _210 = false;
    float _212 = _200;
    float _214 = _202;
    if (_146)
    {
        bool _216 = _140 > 0.5;
        _210 = _216;
    }
    bool _218 = _210;
    float _220 = 0.0;
    if (!_158)
    {
        _220 = _140;
    }
    float _222 = _220;
    float _224 = in.m_51.x;
    float _226 = in.m_51.y;
    float _228 = in.m_51.z;
    float _230 = in.m_51.w;
    float _232 = -_148;
    float _234 = _232 + 1.0;
    float _236 = _222;
    float _238 = _148;
    float _240 = _234;
    if (_146)
    {
        float _242 = _218 ? as_type<float>(_196) : _134;
        _212 = _242;
    }
    float _244 = _212;
    bool _246 = _160 > 0.5;
    float _248 = in.m_43.z;
    int _250 = _246 ? as_type<int>(_234) : as_type<int>(_148);
    float _252 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _256 = _254 != 0;
    float _258 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _262 = _260 != 0;
    float _264 = _170 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _268 = _266 != 0;
    float _270 = _166 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _274 = _272 != 0;
    float _276 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _180);
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _280 = _278 != 0;
    float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _284 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _176);
    float _286 = _262 ? as_type<float>(_250) : _148;
    float _288 = in.m_45.w;
    float _290 = _204 * _228;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _294 = _140 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _296 = _170 > 0.5;
    float _298 = -_290;
    float _300 = fma(_208, _224, _298);
    float _302 = fma(_264, -2.0, _292);
    float _304 = -_154;
    float _306 = fma(_294, 2.0, _304);
    float _308 = _208 * _226;
    float _310 = _206 * _224;
    float _312 = _300 * _230;
    float _314 = -_308;
    float _316 = fma(_228, _206, _314);
    float _318 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _320 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _318;
    float _322 = -_310;
    float _324 = fma(_226, _204, _322);
    float _326 = _316 * _230;
    float _328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _330 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _332 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _330;
    float _334 = _320 * _320;
    float _336 = _324 * _230;
    int _338 = _296 ? as_type<int>(_234) : as_type<int>(_148);
    float _340 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[76].y, _302);
    float _342 = fma(_332, _332, _334);
    float _344 = _282 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _346 = _274 ? as_type<float>(_338) : _148;
    float _348 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _178);
    float _350 = fma(_286, _344, -0.5);
    float _352 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    float _354 = fma(_174, _174, _342);
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _358 = _328 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _360 = floor(_352);
    float _362 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[88].z, _356);
    float _364 = fma(_358, _346, -0.5);
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _368 = _332;
    bool _370 = _274;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _374 = _170;
    float _376 = _364;
    float _378 = _226;
    if (!_158)
    {
        _368 = _248;
    }
    float _380 = _368;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _384 = _380;
    if (_256)
    {
        bool _386 = _248 > 0.5;
        _370 = _386;
    }
    bool _388 = _370;
    float _390 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[78].w, _366);
    float _392 = 0.0;
    if (!_158)
    {
        _392 = _170;
    }
    float _394 = _392;
    float _396 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[88].w, _382);
    float _398 = 0.0;
    float _400 = _394;
    if (!_256)
    {
        _398 = _134;
    }
    float _402 = _398;
    float _404 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[77].w, _390);
    float _406 = 0.0;
    float _408 = _402;
    if (!_158)
    {
        _406 = _380;
    }
    float _410 = _406;
    float _412 = _410;
    if (_158)
    {
        _384 = _248;
    }
    float _414 = _384;
    float _416 = -_360;
    float _418 = _352 + _416;
    int _420 = as_type<int>(_360);
    if (_256)
    {
        float _422 = -_134;
        float _424 = _422 + 1.0;
        _420 = as_type<int>(_424);
    }
    int _426 = _420;
    float _428 = _352 * 6.283185482025146484375;
    int _430 = _426;
    if (!_158)
    {
        _372 = _394;
    }
    float _432 = _372;
    float _434 = -_340;
    float _436 = fma(_404, _364, _434);
    float _438 = _432;
    if (_158)
    {
        _400 = _170;
    }
    float _440 = _400;
    float _442 = _428 * 0.15915493667125701904296875;
    if (_256)
    {
        float _444 = _388 ? as_type<float>(_426) : _134;
        _408 = _444;
    }
    float _446 = _408;
    if (_268)
    {
        float _448 = -_134;
        float _450 = _448 + 1.0;
        _430 = as_type<int>(_450);
    }
    int _452 = _430;
    if (!_158)
    {
        _374 = _410;
    }
    float _454 = _374;
    float _456 = in.m_32.x;
    float _458 = in.m_32.y;
    float _460 = in.m_32.z;
    float _462 = _454;
    if (_158)
    {
        _412 = _414;
    }
    float _464 = _412;
    float _466 = _442 * 6.283185482025146484375;
    float _468 = cos(_466);
    bool _470 = _414 > 0.5;
    if (_268)
    {
        float _472 = _296 ? as_type<float>(_452) : _134;
        _184 = _472;
    }
    float _474 = _184;
    float _476 = in.m_34.x;
    float _478 = in.m_34.y;
    float _480 = in.m_34.z;
    bool _482 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _486 = _482 || _484;
    bool _488 = isnan(1.0);
    bool _490 = _486 || _488;
    if (_158)
    {
        _376 = _140;
    }
    float _492 = _376;
    float _494 = _492;
    if (_158)
    {
        _236 = _464;
    }
    float _496 = _236;
    if (!_158)
    {
        _494 = _464;
    }
    float _498 = _494;
    float _500 = sqrt(_354);
    float _502 = fma(_468, 0.5, 0.5);
    if (!_158)
    {
        _186 = _432;
    }
    float _504 = _186;
    float _506 = _504;
    if (_158)
    {
        _438 = _140;
    }
    float _508 = _438;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_280)
    {
        float _512 = _470 ? _234 : _148;
        _238 = _512;
    }
    float _514 = _238;
    if (!_490)
    {
        float _516 = _142 * _142;
        float _518 = _516 * 0.5;
        _240 = _518;
    }
    float _520 = _240;
    float _522 = _520;
    if (_158)
    {
        _188 = _440;
    }
    float _524 = _188;
    float _526 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[83].z, _202);
    float _528 = _524;
    if (!_158)
    {
        _214 = _454;
    }
    float _530 = _214;
    float _532 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[78].z, _510);
    float _534 = _530;
    if (_158)
    {
        _462 = _440;
    }
    float _536 = _462;
    if (!_490)
    {
        float _538 = _520 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _522 = _538;
    }
    float _540 = _522;
    float _542 = _540;
    if (_158)
    {
        _534 = _440;
    }
    float _544 = _534;
    if (_158)
    {
        _506 = _140;
    }
    float _546 = _506;
    if (!_158)
    {
        _528 = _140;
    }
    float _548 = _528;
    bool _550 = !_490;
    if (!_550)
    {
        float _552 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _554 = log2(_552);
        float _556 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _558 = _556 + 1.0;
        float _560 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _562 = _142 * _554;
        float _564 = 1.0 / _558;
        float _566 = _560 * 0.693147182464599609375;
        float _568 = exp2(_562);
        float _570 = 1.0 / _566;
        float _572 = _568 + (-1.0);
        float _574 = -_572;
        float _576 = fma(_574, _570, _142);
        float _578 = _576 * _564;
        float _580 = _578 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _542 = _580;
    }
    float _582 = _542;
    bool _584 = !_490;
    if (!_584)
    {
        float _586 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _588 = log2(_586);
        float _590 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _592 = _590 + 1.0;
        float _594 = 1.0 / _592;
        float _596 = _142 * _588;
        float _598 = exp2(_596);
        float _600 = -_598;
        float _602 = _600 + 1.0;
        float _604 = _602 * _594;
        _190 = _604;
    }
    float _606 = _190;
    float _608 = _582 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _610 = _582 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _612 = _582 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _616 = fma(_606, _478, _608);
    float _618 = fma(_606, _480, _610);
    float _620 = fma(_606, _476, _612);
    float _622 = fma(_616, _288, _458);
    float _624 = fma(_618, _288, _460);
    float _626 = fma(_620, _288, _456);
    float _628 = _622 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _630 = _622 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _632 = _622 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _636 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[5].x, _628);
    bool _638 = _418 < 0.5;
    float _640 = float(_638);
    float _642 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[4].x, _630);
    float _644 = -_418;
    float _646 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _648 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[5].z, _636);
    float _650 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[6].x, _632);
    float _652 = -_640;
    float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _656 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[4].z, _642);
    float _658 = _648 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _660 = -_502;
    float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _664 = fma(_624, (*spvDescriptorSet0.vp_c10)._m0[6].z, _650);
    float _666 = _656 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _668 = -_658;
    float _670 = _668 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _672 = _614 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _674 = _664 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _676 = -_666;
    float _678 = _676 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _680 = _670 * _670;
    float _682 = _634 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _684 = -_674;
    float _686 = _684 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _690 = fma(_678, _678, _680);
    float _692 = fma(_672, _244, -0.5);
    float _694 = fma(_682, _446, -0.5);
    float _696 = fma(_686, _686, _690);
    float _698 = fma(_500, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _702 = rsqrt(_696);
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _706 = _546 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _710 = _708 != 0;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _714 = _712 != 0;
    float _716 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[84].z, _700);
    bool _718 = !_152;
    int _720 = _718 ? 0 : 1;
    float _722 = -_704;
    float _724 = fma(_706, 2.0, _722);
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _728 = !_710;
    int _730 = _728 ? 0 : 1;
    float _732 = _688 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _734 = abs(_720);
    float _736 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[83].w, _726);
    float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _740 = abs(_730);
    float _742 = fma(_732, _474, -0.5);
    bool _744 = !_714;
    int _746 = _744 ? 0 : 1;
    float _748 = _678 * _702;
    float _750 = _686 * _702;
    float _752 = _670 * _702;
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _756 = _748 * _754;
    float _758 = float(_740);
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _762 = _750 * _760;
    int _764 = abs(_746);
    float _766 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _768 = -_756;
    float _770 = fma(_750, _766, _768);
    float _772 = float(_734);
    float _774 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _776 = _752 * _774;
    float _778 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _780 = -_762;
    float _782 = fma(_752, _778, _780);
    float _784 = _770 * _770;
    float _786 = abs(_646);
    float _788 = _758 * _786;
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _792 = -_776;
    float _794 = fma(_748, _790, _792);
    float _796 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[77].z, _532);
    float _798 = fma(_782, _782, _784);
    float _800 = fma(_772, _662, _788);
    float _802 = _738 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _804 = float(_764);
    float _806 = fma(_794, _794, _798);
    float _808 = fma(_802, _514, -0.5);
    float _810 = -_90;
    float _812 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[76].x, _306);
    float _814 = rsqrt(_806);
    float _816 = abs(_654);
    float _818 = fma(_804, _816, _800);
    float _820 = _544 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _822 = fma(_796, _692, _812);
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _826 = _818 * _252;
    float _828 = _498 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _830 = _818 * _258;
    float _832 = _826 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _834 = -_824;
    float _836 = fma(_828, 2.0, _834);
    float _838 = _818 * _270;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _842 = _284 * _832;
    float _844 = _830 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _846 = precise::max(_698, 1.0);
    float _848 = _782 * _814;
    float _850 = _770 * _814;
    float _852 = _794 * _814;
    float _854 = fma(_820, -2.0, _840);
    float _856 = _752 * _848;
    float _858 = _750 * _850;
    float _860 = _838 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _862 = _348 * _844;
    float _864 = -_856;
    float _866 = fma(_748, _850, _864);
    float _868 = -_858;
    float _870 = fma(_752, _852, _868);
    float _872 = _276 * _860;
    float _874 = _862 * _866;
    float _876 = _862 * _870;
    float _878 = precise::min(_846, 1.89999997615814208984375);
    float _880 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[84].x, _716);
    float _882 = fma(_842, _852, _874);
    float _884 = fma(_842, _848, _876);
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _888 = _548 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _890 = fma(_872, _750, _882);
    float _892 = fma(_872, _748, _884);
    float _894 = _880 * (-0.15915493667125701904296875);
    float _896 = fma(_888, -2.0, _886);
    float _898 = fma(_890, _878, _674);
    float _900 = fma(_892, _878, _666);
    float _902 = _894 * 6.283185482025146484375;
    float _904 = sin(_902);
    float _906 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[87].w, _396);
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _910 = _898 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _914 = _900 + _912;
    float _916 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[82].z, _526);
    float _918 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[86].y, _896);
    float _920 = _910 * _910;
    float _922 = _914 * _914;
    float _924 = _894 * 6.283185482025146484375;
    float _926 = cos(_924);
    float _928 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[87].z, _362);
    float _930 = -_90;
    float _932 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[86].x, _836);
    float _934 = _922 + _920;
    float _936 = -_918;
    float _938 = fma(_906, _808, _936);
    float _940 = -_90;
    float _942 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[81].x, _724);
    float _944 = _748 * _852;
    float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _948 = _658 + _946;
    float _950 = sqrt(_934);
    float _952 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[82].w, _736);
    float _954 = fma(_90, (*spvDescriptorSet0.vp_c9)._m0[81].y, _854);
    float _956 = fma(_928, _742, _932);
    float _958 = _904 * _350;
    float _960 = -_944;
    float _962 = fma(_750, _848, _960);
    float _964 = _948 * _948;
    float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _968 = _674 + _966;
    float _970 = _926 * _350;
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _974 = _666 + _972;
    float _976 = -_958;
    float _978 = fma(_926, _694, _976);
    float _980 = _862 * _962;
    float _982 = fma(_904, _694, _970);
    float _984 = fma(_974, _974, _964);
    float _986 = fma(_916, _978, _942);
    float _988 = fma(_842, _850, _980);
    bool _990 = _950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _992 = fma(_968, _968, _984);
    float _994 = fma(_872, _752, _988);
    float _996 = -_954;
    float _998 = fma(_952, _982, _996);
    float _1000 = rsqrt(_992);
    float _1002 = _312 * _870;
    float _1004 = fma(_994, _878, _658);
    float _1006 = _312 * _866;
    float _1008 = _870 * _226;
    float _1010 = _962 * _226;
    float _1012 = _866 * _226;
    float _1014 = _312 * _962;
    float _1016 = _866;
    float _1018 = _878;
    float _1020 = _922;
    float _1022 = _920;
    if (!_990)
    {
        _378 = _900;
    }
    float _1024 = _378;
    float _1026 = _1024;
    if (!_990)
    {
        _1016 = _898;
    }
    float _1028 = _1016;
    float _1030 = _1028;
    if (!_990)
    {
        _1018 = _1004;
    }
    float _1032 = _1018;
    bool _1034 = !_990;
    float _1036 = _1032;
    if (!_1034)
    {
        float _1038 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1040 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1042 = _950 + _1040;
        float _1044 = _1004 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = rsqrt(_934);
        float _1048 = _1042 * _1038;
        float _1050 = _1048 * 0.15915493667125701904296875;
        float _1052 = _1050 * 6.283185482025146484375;
        float _1054 = sin(_1052);
        float _1056 = _1050 * 6.283185482025146484375;
        float _1058 = cos(_1056);
        float _1060 = fma(_1054, _1044, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1062 = _1046 * _1060;
        float _1064 = fma(_914, _1062, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1066 = _1058 + (-1.0);
        float _1068 = fma(_910, _1062, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1072 = _1064 + _1070;
        float _1074 = _1066 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1078 = _1068 + _1076;
        float _1080 = _1072 * _1072;
        float _1082 = fma(_1004, _1058, _1074);
        float _1084 = _1078 * _1078;
        _1036 = _1082;
        _1020 = _1080;
        _1022 = _1084;
        _1026 = _1064;
        _1030 = _1068;
    }
    float _1086 = _1036;
    float _1088 = _1020;
    float _1090 = _1022;
    float _1092 = _1026;
    float _1094 = _1030;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1098 = _1086 + _1096;
    float _1100 = fma(_326, _848, _1002);
    float _1102 = fma(_326, _852, _1006);
    float _1104 = fma(_848, _224, _1008);
    float _1106 = fma(_1098, _1098, _1088);
    float _1108 = fma(_850, _224, _1010);
    float _1110 = fma(_852, _224, _1012);
    float _1112 = fma(_326, _850, _1014);
    float _1114 = _1106 + _1090;
    float _1116 = fma(_336, _750, _1102);
    float _1118 = _974 * _1000;
    float _1120 = _968 * _1000;
    float _1122 = sqrt(_1114);
    float _1124 = fma(_336, _752, _1112);
    float _1126 = _986 + 0.5;
    float _1128 = _948 * _1000;
    float _1130 = fma(_336, _748, _1100);
    float _1132 = _436 + 0.5;
    float _1134 = _822 + 0.5;
    float _1136 = _956 + 0.5;
    float _1138 = _938 + 0.5;
    float _1140 = _998 + 0.5;
    float _1142 = fma(_748, _228, _1104);
    float _1144 = fma(_752, _228, _1108);
    float _1146 = fma(_750, _228, _1110);
    out.m_53.x = _1136;
    out.m_53.y = _1138;
    bool _1148 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1150 = isnan(_1122);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1156 = _1152 || _1154;
    out.m_55.x = _1134;
    out.m_55.y = _1132;
    out.m_55.z = _1126;
    out.m_55.w = _1140;
    out.m_57.x = _1118;
    out.m_57.y = _1128;
    out.m_57.z = _1120;
    out.m_59.x = _1130;
    out.m_59.y = _1124;
    out.m_59.z = _1116;
    out.m_61.x = _1142;
    out.m_61.y = _1144;
    out.m_61.z = _1146;
    float _1158 = _1114;
    if (!_1156)
    {
        _1158 = 1.0;
    }
    float _1160 = _1158;
    bool _1162 = !_1156;
    float _1164 = _1160;
    if (!_1162)
    {
        bool _1166 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1168 = isnan(_1122);
        bool _1170 = _1166 || _1168;
        bool _1172 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1174 = _1170 || _1172;
        if (!_1174)
        {
            float _1176 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1178 = _1122 + _1176;
            float _1180 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1182 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1180;
            float _1184 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1186 = _1184 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1188 = 1.0 / _1182;
            float _1190 = _1178 * _1188;
            float _1192 = fma(_1190, _1186, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1164 = _1192;
            _1194 = true;
        }
        else
        {
            bool _1196 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1198 = isnan(_1122);
            bool _1200 = _1196 || _1198;
            bool _1202 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1204 = _1200 || _1202;
            if (!_1204)
            {
                float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1208 = _1122 + _1206;
                float _1210 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1212 = _1210 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1214 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1216 = _1214 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1218 = 1.0 / _1212;
                float _1220 = _1208 * _1218;
                float _1222 = fma(_1220, _1216, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1164 = _1222;
                _1194 = true;
            }
            else
            {
                _1164 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1194 = false;
    float _1224 = _1164;
    float _1226 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1228 = _1092 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1232 = _1086 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1236 = _1094 + _1234;
    bool _1238 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan(0.5);
    bool _1246 = _1242 || _1244;
    float _1248 = fma(_1228, _1224, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1250 = fma(_1232, _1224, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1252 = fma(_1236, _1224, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1254 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1256 = _1228;
    float _1258 = _1224;
    if (_1246)
    {
        _1254 = _1248;
    }
    float _1260 = _1254;
    float _1262 = _1260;
    if (_1246)
    {
        _1256 = _1250;
    }
    float _1264 = _1256;
    float _1266 = _1264;
    if (_1246)
    {
        _1258 = _1252;
    }
    float _1268 = _1258;
    float _1270 = _1268;
    if (!_1246)
    {
        float _1272 = sqrt(_992);
        float _1274 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1278 = precise::min(_1272, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1280 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1282 = _1278 * _1276;
        float _1284 = -_666;
        float _1286 = _1284 + _1248;
        float _1288 = _1280 * _1282;
        float _1290 = -_658;
        float _1292 = _1290 + _1250;
        float _1294 = -_674;
        float _1296 = _1294 + _1252;
        float _1298 = fma(_1286, _1288, _666);
        float _1300 = fma(_1292, _1288, _658);
        float _1302 = fma(_1296, _1288, _674);
        _1266 = _1300;
        _1262 = _1298;
        _1270 = _1302;
    }
    float _1304 = _1266;
    float _1306 = _1262;
    float _1308 = _1270;
    float _1310 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1312 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1314 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1316 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1318 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1310);
    float _1320 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1312);
    float _1322 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1314);
    float _1324 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1316);
    float _1326 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1318);
    float _1328 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1320);
    float _1330 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1322);
    float _1332 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1324);
    float _1334 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1336 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1338 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1340 = _1332 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1342 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1344 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1346 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1348 = _1334 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1350 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1342);
    float _1352 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1344);
    float _1354 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1346);
    float _1356 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1348);
    float _1358 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1350);
    float _1360 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1352);
    float _1362 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1354);
    float _1364 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1356);
    float _1366 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1368 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1358);
    float _1370 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1360);
    float _1372 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1362);
    float _1374 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1364);
    out.m_63.x = _666;
    out.m_63.y = _658;
    out.m_63.z = _674;
    out.m_39.x = 1.0;
    out.m_65.w = _1366;
    out.gl_Position.x = _1368;
    out.gl_Position.y = _1370;
    out.gl_Position.z = _1372;
    out.gl_Position.w = _1374;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

