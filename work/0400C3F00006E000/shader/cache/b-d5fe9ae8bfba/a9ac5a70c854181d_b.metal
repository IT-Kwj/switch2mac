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
    float4 m_55 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_49 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_45 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
    float4 m_47 [[attribute(8)]];
    float4 m_39 [[attribute(9)]];
    float4 m_51 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_30.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_33.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1619 = as_type<float>(_104);
        out.gl_Position.z = _1619;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_35.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _96 = _126;
    }
    float _128 = _96;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_33.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1689 = as_type<float>(_142);
        out.gl_Position.z = _1689;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_37.w;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _148 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _150 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _148;
    float _152 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _154 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _152;
    float _156 = _150 * _150;
    float _158 = in.m_37.y;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _172 = fma(_154, _154, _156);
    float _174 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _176 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _174;
    float _178 = in.m_39.y;
    float _180 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[192].w + _180;
    float _184 = fma(_176, _176, _172);
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _188 = (*spvDescriptorSet0.vp_c9)._m0[193].z + _186;
    float _190 = 1.0 / _182;
    float _192 = 0.0;
    float _194 = _170;
    if (!_168)
    {
        float _196 = _170 * _170;
        float _198 = _196 * 0.5;
        _192 = _198;
    }
    float _200 = _192;
    bool _202 = _144 > 0.5;
    float _204 = _200;
    if (!_168)
    {
        float _206 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    float _210 = sqrt(_184);
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _214 = _212 != 0;
    float _216 = 1.0 / _188;
    float _218 = precise::max(_210, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _220 = precise::max(_210, (*spvDescriptorSet0.vp_c9)._m0[192].z);
    float _222 = precise::min(_218, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _224 = precise::min(_220, (*spvDescriptorSet0.vp_c9)._m0[192].w);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _228 = _222 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _232 = _224 + _230;
    bool _234 = !_168;
    float _236 = _208;
    if (!_234)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = _170 * _240;
        float _250 = 1.0 / _244;
        float _252 = _246 * 0.693147182464599609375;
        float _254 = exp2(_248);
        float _256 = 1.0 / _252;
        float _258 = _254 + (-1.0);
        float _260 = -_258;
        float _262 = fma(_260, _256, _170);
        float _264 = _262 * _250;
        float _266 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _266;
    }
    float _268 = _236;
    bool _270 = !_168;
    if (!_270)
    {
        float _272 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _274 = log2(_272);
        float _276 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _278 = _276 + 1.0;
        float _280 = 1.0 / _278;
        float _282 = _170 * _274;
        float _284 = exp2(_282);
        float _286 = -_284;
        float _288 = _286 + 1.0;
        float _290 = _288 * _280;
        _194 = _290;
    }
    float _292 = _194;
    float _294 = in.m_37.z;
    float _296 = -_178;
    float _298 = _296 + 1.0;
    float _300 = _228 * _216;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _304 = _302 != 0;
    float _306 = 0.0;
    if (_214)
    {
        float _308 = in.m_37.x;
        _306 = _308;
    }
    float _310 = _306;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _314 = _312 != 0;
    float _316 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _318 = _202 ? as_type<int>(_298) : as_type<int>(_178);
    float _320 = in.m_39.x;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _324 = _322 != 0;
    float _326 = -_232;
    float _328 = fma(_326, _190, 1.0);
    float _330 = in.m_41.x;
    float _332 = in.m_41.y;
    float _334 = in.m_41.z;
    float _336 = _324 ? as_type<float>(_318) : _178;
    float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _340 = 0.0;
    if (_304)
    {
        float _342 = in.m_37.x;
        _340 = _342;
    }
    float _344 = _340;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _348 = _158 > 0.5;
    float _350 = 0.0;
    if (_314)
    {
        float _352 = in.m_37.z;
        _350 = _352;
    }
    float _354 = _350;
    int _356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _358 = _356 != 0;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _362 = _348 ? as_type<int>(_298) : as_type<int>(_178);
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _366 = _294 > 0.5;
    int _368 = 0;
    int _370 = 0;
    if (_214)
    {
        _368 = 0;
        _370 = 0;
    }
    int _372 = _368;
    int _374 = _370;
    float _376 = _358 ? as_type<float>(_362) : _178;
    float _378 = _360 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _380 = _366 ? _298 : _178;
    float _382 = _364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _384 = _346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _388 = _386 != 0;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _392 = _390 != 0;
    float _394 = 0.0;
    int _396 = _372;
    int _398 = _374;
    float _400 = _380;
    if (_214)
    {
        _394 = _158;
    }
    float _402 = _394;
    float _404 = 0.0;
    float _406 = _310;
    float _408 = _402;
    if (_214)
    {
        _404 = _310;
    }
    float _410 = _404;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _414 = _412 != 0;
    float _416 = _410;
    float _418 = _330;
    bool _420 = _414;
    if (!_214)
    {
        float _422 = in.m_37.x;
        float _424 = _158 * 3.1415927410125732421875;
        float _426 = _424 * 0.15915493667125701904296875;
        float _428 = _426 * 6.283185482025146484375;
        float _430 = sin(_428);
        float _432 = _422 * 3.1415927410125732421875;
        float _434 = _432 * 0.15915493667125701904296875;
        float _436 = _434 * 6.283185482025146484375;
        float _438 = sin(_436);
        _396 = 1;
        _398 = 2;
        _406 = _422;
        _416 = _438;
        _408 = _430;
    }
    int _440 = _396;
    int _442 = _398;
    float _444 = _406;
    float _446 = _416;
    float _448 = _408;
    float _450 = _332 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _452 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _456 = _334 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _458 = _294 * 2.0;
    out.m_43.x = _378;
    out.m_43.y = _382;
    out.m_43.z = _384;
    float _460 = fma(_452, -2.0, _454);
    float _462 = _330 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    if (!_304)
    {
        _418 = _320;
    }
    float _464 = _418;
    float _466 = in.m_45.y;
    float _468 = floor(_458);
    float _470 = _158 + _294;
    float _472 = 0.0;
    float _474 = _464;
    int _476 = as_type<int>(_470);
    if (!_304)
    {
        _472 = _464;
    }
    float _478 = _472;
    float _480 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _482 = _478;
    if (_304)
    {
        _474 = _320;
    }
    float _484 = _474;
    float _486 = _470 + (-1.0);
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _490 = _488 != 0;
    float _492 = _158 * 2.0;
    float _494 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _460);
    bool _496 = _490;
    if (_304)
    {
        float _498 = -_484;
        float _500 = _498 + 1.0;
        _476 = as_type<int>(_500);
    }
    int _502 = _476;
    float _504 = _490 ? _380 : _178;
    float _506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _508 = _502;
    if (_304)
    {
        bool _510 = _344 > 0.5;
        _496 = _510;
    }
    bool _512 = _496;
    float _514 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _516 = in.m_41.w;
    if (_304)
    {
        float _518 = _512 ? as_type<float>(_502) : _484;
        _482 = _518;
    }
    float _520 = _482;
    if (_314)
    {
        float _522 = -_484;
        float _524 = _522 + 1.0;
        _508 = as_type<int>(_524);
    }
    int _526 = _508;
    int _528 = _414 ? as_type<int>(_380) : as_type<int>(_178);
    float _530 = floor(_492);
    int _532 = _528;
    if (_314)
    {
        bool _534 = _354 > 0.5;
        _420 = _534;
    }
    bool _536 = _420;
    float _538 = in.m_45.x;
    bool _540 = _468 > 0.0;
    float _542 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _466);
    bool _544 = _468 >= 0.0;
    bool _546 = isnan(_468);
    bool _548 = _544 || _546;
    bool _550 = isnan(0.0);
    bool _552 = _548 || _550;
    float _554 = in.m_47.x;
    if (!_314)
    {
        _400 = _484;
    }
    float _556 = _400;
    float _558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _560 = in.m_45.z;
    float _562 = _556;
    if (_314)
    {
        float _564 = _536 ? as_type<float>(_526) : _484;
        _562 = _564;
    }
    float _566 = _562;
    float _568 = _316 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _570 = 0.0;
    if (!_388)
    {
        _570 = _484;
    }
    float _572 = _570;
    float _574 = _146 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _576 = 0.0;
    float _578 = _572;
    if (!_392)
    {
        _576 = _484;
    }
    float _580 = _576;
    float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _584 = _530 > 0.0;
    float _586 = fma(_568, _376, -0.5);
    bool _588 = _530 >= 0.0;
    bool _590 = isnan(_530);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = _338 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _600 = _480 * _542;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _604 = _506 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _606 = fma(_598, _336, -0.5);
    float _608 = _558 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _610 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].w, _602);
    float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _614 = fma(_608, _504, -0.5);
    float _616 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _610);
    float _618 = in.m_47.z;
    float _620 = _582 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _622 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _624 = -_494;
    float _626 = fma(_616, _586, _624);
    int _628 = _552 ? 0 : 1;
    float _630 = fma(_620, as_type<float>(_528), -0.5);
    float _632 = _622 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c10)._m0[2].x);
    float _636 = _580;
    if (_388)
    {
        float _638 = -_484;
        float _640 = _638 + 1.0;
        _634 = as_type<int>(_640);
    }
    int _642 = _634;
    if (_392)
    {
        float _644 = -_484;
        float _646 = _644 + 1.0;
        _532 = as_type<int>(_646);
    }
    int _648 = _532;
    int _650 = ~_628;
    int _652 = _650 + 1;
    int _654 = _652 + 1;
    float _656 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[191].x, _632);
    int _658 = _654;
    if (!_540)
    {
        int _660 = ~_628;
        int _662 = _660 + 1;
        _658 = _662;
    }
    int _664 = _658;
    float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _668 = as_type<float>(_664);
    if (_388)
    {
        float _670 = _348 ? as_type<float>(_642) : _484;
        _578 = _670;
    }
    float _672 = _578;
    float _674 = _612 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_392)
    {
        float _676 = _348 ? as_type<float>(_648) : _484;
        _636 = _676;
    }
    float _678 = _636;
    float _680 = _656 * 6.283185482025146484375;
    float _682 = in.m_35.x;
    float _684 = in.m_35.y;
    float _686 = in.m_35.z;
    int _688 = _596 ? 0 : 1;
    float _690 = fma(_674, _566, -0.5);
    float _692 = _680 * 0.15915493667125701904296875;
    float _694 = in.m_30.x;
    float _696 = in.m_30.y;
    float _698 = in.m_30.z;
    float _700 = fma(_604, _672, -0.5);
    int _702 = ~_688;
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    float _708 = fma(_574, _520, -0.5);
    int _710 = _706;
    if (!_584)
    {
        int _712 = ~_688;
        int _714 = _712 + 1;
        _710 = _714;
    }
    int _716 = _710;
    float _718 = _692 * 6.283185482025146484375;
    float _720 = sin(_718);
    float _722 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _724 = _666 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    bool _726 = _440 != 1;
    float _728 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _730 = _442 != 2;
    float _732 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _734 = fma(_724, _678, -0.5);
    float _736 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _738 = log2(_736);
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _742 = float(_716);
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _746 = fma(_292, _682, _722);
    float _748 = fma(_292, _684, _728);
    float _750 = _444 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _754 = _720 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _756 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[93].z, _744);
    float _758 = -_740;
    float _760 = fma(_750, 2.0, _758);
    float _762 = _446 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _764 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[93].w, _752);
    float _766 = _158 + _444;
    float _768 = fma(_292, _686, _732);
    float _770 = fma(_748, _516, _696);
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _774 = _448 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _776 = fma(_618, _754, _538);
    float _778 = -_754;
    float _780 = fma(_554, _778, _560);
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _784 = _782 != 0;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _788 = _786 != 0;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _792 = _790 != 0;
    float _794 = _444 * 2.0;
    float _796 = _766 + (-1.0);
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (_730)
    {
        _798 = _444;
    }
    float _800 = _798;
    float _802 = -_772;
    float _804 = fma(_762, 2.0, _802);
    float _806 = floor(_794);
    float _808 = _800;
    if (!_730)
    {
        _808 = _294;
    }
    float _810 = _808;
    float _812 = _444 + _294;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _816 = fma(_746, _516, _694);
    float _818 = fma(_768, _516, _698);
    float _820 = _812 + (-1.0);
    float _822 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _824 = _810 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _828 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _830 = !_792;
    int _832 = _830 ? 0 : 1;
    float _834 = -_814;
    float _836 = fma(_824, 2.0, _834);
    bool _838 = !_784;
    float _840 = _838 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _842 = fma(_774, -2.0, _826);
    float _844 = _444 + (-0.5);
    int _846 = abs(as_type<int>(_840));
    float _848 = -_122;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[91].x, _804);
    int _852 = abs(_832);
    float _854 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[91].y, _842);
    float _856 = _840;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_726)
    {
        _856 = _158;
    }
    float _860 = _856;
    float _862 = -_122;
    float _864 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[86].x, _836);
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _776);
    bool _868 = _806 > 0.0;
    float _870 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _780);
    bool _872 = _806 >= 0.0;
    bool _874 = isnan(_806);
    bool _876 = _872 || _874;
    bool _878 = isnan(0.0);
    bool _880 = _876 || _878;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _886 = float(_664);
    float _888 = _860;
    float _890 = _886;
    if (!_726)
    {
        _858 = _294;
    }
    float _892 = _858;
    float _894 = _892;
    if (!_726)
    {
        _668 = _860;
    }
    float _896 = _668;
    float _898 = _896;
    if (_726)
    {
        _894 = _158;
    }
    float _900 = _894;
    if (_726)
    {
        _888 = _444;
    }
    float _902 = _888;
    float _904 = float(_846);
    float _906 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[83].w, _882);
    int _908 = _880 ? 0 : 1;
    float _910 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[83].z, _884);
    float _912 = float(_852);
    float _914 = _904 * _886;
    int _916 = ~_908;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    float _922 = in.m_49.x;
    float _924 = in.m_49.y;
    float _926 = in.m_49.z;
    int _928 = _920;
    if (!_868)
    {
        int _930 = ~_908;
        int _932 = _930 + 1;
        _928 = _932;
    }
    int _934 = _928;
    float _936 = _912 * _742;
    bool _938 = !_788;
    float _940 = _938 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _942 = _914 * (-2.0);
    float _944 = _940;
    if (_726)
    {
        _898 = _444;
    }
    float _946 = _898;
    float _948 = _936 * (-2.0);
    int _950 = abs(as_type<int>(_940));
    float _952 = _946 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _954 = float(_950);
    float _956 = float(_934);
    float _958 = _738 * _122;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_730)
    {
        _944 = _158;
    }
    float _962 = _944;
    float _964 = fma(_822, _942, _822);
    float _966 = _954 * _956;
    float _968 = -_960;
    float _970 = fma(_952, 2.0, _968);
    float _972 = exp2(_958);
    float _974 = _962;
    if (!_726)
    {
        _890 = _294;
    }
    float _976 = _890;
    float _978 = fma(_942, _922, _922);
    float _980 = _976;
    if (!_730)
    {
        _974 = _444;
    }
    float _982 = _974;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _988 = _982 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_726)
    {
        _980 = _158;
    }
    float _990 = _980;
    float _992 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[78].z, _984);
    bool _994 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _996 = isnan(1.0);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1002 = _998 || _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1006 = 1.0 + _1004;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1010 = _990 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1012 = fma(_988, -2.0, _986);
    float _1014 = 1.0 / _1006;
    float _1016 = fma(_1010, -2.0, _1008);
    float _1018 = -_972;
    float _1020 = _1018 + 1.0;
    bool _1022 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1024 = isnan(0.0);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1030 = _1026 || _1028;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1034 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[92].z, _756);
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1038 = _1030 ? _1020 : 0.0;
    float _1040 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1032);
    float _1042 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _992);
    float _1044 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1036);
    float _1046 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[92].w, _764);
    float _1048 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1040);
    float _1050 = -_122;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[76].x, _760);
    float _1054 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1044);
    float _1056 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _910);
    float _1058 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _906);
    float _1060 = -_122;
    float _1062 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[81].x, _970);
    float _1064 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1016);
    float _1066 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1012);
    if (_1002)
    {
        float _1068 = _1038 * _1014;
        _124 = _1068;
    }
    float _1070 = _124;
    float _1072 = _966 * (-2.0);
    float _1074 = _158 + (-0.5);
    float _1076 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[196].x, _978);
    float _1078 = fma(_948, _926, _926);
    float _1080 = fma(_1072, _924, _924);
    float _1082 = _294 + (-0.5);
    float _1084 = fma(_964, _1070, _1076);
    float _1086 = fma(_828, _948, _828);
    float _1088 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1080);
    float _1090 = fma(_514, _1072, _514);
    float _1092 = in.m_51.z;
    float _1094 = _1084 * 0.15915493667125701904296875;
    float _1096 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1078);
    float _1098 = in.m_51.w;
    float _1100 = fma(_1090, _1070, _1088);
    float _1102 = fma(_1086, _1070, _1096);
    float _1104 = in.m_51.y;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1108 = _1106 + 1.0;
    float _1110 = _1102 * 0.15915493667125701904296875;
    float _1112 = _1100 * 0.15915493667125701904296875;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1116 = fma(_300, _1108, (*spvDescriptorSet0.vp_c9)._m0[193].x);
    float _1118 = _1094 * 6.283185482025146484375;
    float _1120 = sin(_1118);
    float _1122 = _1114 * _328;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1126 = _770 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1130 = fma(_1034, _734, _850);
    float _1132 = _1094 * 6.283185482025146484375;
    float _1134 = cos(_1132);
    out.m_53.z = _1092;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1138 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1140 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1142 = _456 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1144 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1146 = _770 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1148 = _1110 * 6.283185482025146484375;
    float _1150 = cos(_1148);
    float _1152 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1154 = _770 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    out.m_55.x = _1138;
    out.m_55.y = _1140;
    out.m_55.z = _1144;
    out.m_55.w = _1122;
    float _1156 = fma(_1042, _708, _1052);
    float _1158 = _1152 * _866;
    float _1160 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1154);
    out.m_53.w = _1098;
    float _1162 = _1112 * 6.283185482025146484375;
    float _1164 = sin(_1162);
    float _1166 = _1142 * _870;
    float _1168 = -_854;
    float _1170 = fma(_1046, _630, _1168);
    out.m_53.y = _1104;
    bool _1172 = _466 != 0.0;
    bool _1174 = isnan(_466);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan(0.0);
    bool _1180 = _1176 || _1178;
    float _1182 = fma(_1048, _700, _864);
    float _1184 = -_1066;
    float _1186 = fma(_1054, _614, _1184);
    float _1188 = in.m_51.x;
    float _1190 = _1112 * 6.283185482025146484375;
    float _1192 = cos(_1190);
    float _1194 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1146);
    float _1196 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1126);
    float _1198 = _1134 * _1150;
    float _1200 = _1120 * _1150;
    bool _1202 = _776 == 0.0;
    bool _1204 = !_1180;
    bool _1206 = _1202 && _1204;
    float _1208 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1196);
    float _1210 = -_1064;
    float _1212 = fma(_1058, _606, _1210);
    float _1214 = _1110 * 6.283185482025146484375;
    float _1216 = sin(_1214);
    float _1218 = _1120 * _1164;
    float _1220 = _1134 * _1164;
    bool _1222 = _780 == 0.0;
    bool _1224 = _1222 && _1206;
    float _1226 = _1182 + 0.5;
    float _1228 = _1186 + 0.5;
    float _1230 = _1134 * _1192;
    float _1232 = _1120 * _1192;
    float _1234 = _1164 * _1150;
    float _1236 = _1198 * _600;
    float _1238 = _1192 * _1150;
    out.m_57.x = _1226;
    out.m_57.y = _1228;
    float _1240 = fma(_1216, _1230, _1218);
    float _1242 = fma(_1216, _1218, _1230);
    float _1244 = -_1220;
    float _1246 = fma(_1216, _1232, _1244);
    float _1248 = -_600;
    float _1250 = _1216 * _1248;
    float _1252 = -_1232;
    float _1254 = fma(_1216, _1220, _1252);
    float _1256 = fma(_1240, _1158, _1236);
    float _1258 = _1200 * _600;
    float _1260 = fma(_1238, _1158, _1250);
    float _1262 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1160);
    float _1264 = fma(_1254, _1166, _1256);
    float _1266 = fma(_1246, _1158, _1258);
    float _1268 = fma(_1234, _1166, _1260);
    float _1270 = _1208 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1272 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1274 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1276 = fma(_1242, _1166, _1266);
    float _1278 = _1170 + 0.5;
    float _1280 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1272);
    float _1282 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1274);
    float _1284 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1194);
    float _1286 = _1262 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1288 = fma(_1276, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1280);
    float _1290 = fma(_1276, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1282);
    float _1292 = _1130 + 0.5;
    float _1294 = fma(_1056, _690, _1062);
    float _1296 = _1270 + _1288;
    float _1298 = _1286 + _1290;
    float _1300 = in.m_59.x;
    float _1302 = in.m_59.y;
    float _1304 = in.m_59.z;
    float _1306 = _626 + 0.5;
    float _1308 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1310 = _1296 + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1314 = _1298 + _1312;
    out.m_61.x = _1292;
    out.m_61.y = _1278;
    float _1316 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1318 = _1298 + _1316;
    float _1320 = _1310 * _1310;
    float _1322 = _1294 + 0.5;
    out.m_53.x = _1188;
    float _1324 = fma(_1314, _1314, _1320);
    float _1326 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1328 = _1296 + _1326;
    float _1330 = _1156 + 0.5;
    float _1332 = _1212 + 0.5;
    float _1334 = _1328 * _1328;
    float _1336 = sqrt(_1324);
    out.m_63.x = _1330;
    out.m_63.y = _1306;
    out.m_63.z = _1322;
    out.m_63.w = _1332;
    float _1338 = _1302;
    float _1340 = _1300;
    float _1342 = _1304;
    float _1344 = _1298;
    float _1346 = _1296;
    if (!_1224)
    {
        float _1348 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1302);
        _1338 = _1348;
    }
    float _1350 = _1338;
    float _1352 = fma(_1318, _1318, _1334);
    if (!_1224)
    {
        float _1354 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1300);
        _1340 = _1354;
    }
    float _1356 = _1340;
    float _1358 = _1200 * _1350;
    float _1360 = sqrt(_1352);
    float _1362 = -_1350;
    float _1364 = _1216 * _1362;
    float _1366 = _1198 * _1350;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[194].x + _1368;
    float _1372 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (!_1224)
    {
        float _1374 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1304);
        _1342 = _1374;
    }
    float _1376 = _1342;
    float _1378 = fma(_1240, _1356, _1366);
    float _1380 = precise::max(_1336, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _1382 = 1.0 / _1370;
    float _1384 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1372);
    float _1386 = fma(_1238, _1356, _1364);
    float _1388 = precise::min(_1380, (*spvDescriptorSet0.vp_c9)._m0[194].x);
    float _1390 = fma(_1246, _1356, _1358);
    float _1392 = fma(_1276, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1384);
    float _1394 = _1284 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1396 = fma(_1254, _1376, _1378);
    bool _1398 = _1360 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _1402 = _1388 + _1400;
    float _1404 = _1394 + _1392;
    float _1406 = fma(_1234, _1376, _1386);
    float _1408 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1410 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1412 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1414 = fma(_1242, _1376, _1390);
    float _1416 = _1402 * _1382;
    float _1418 = fma(_1406, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1408);
    float _1420 = fma(_1406, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1410);
    float _1422 = fma(_1406, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1412);
    float _1424 = fma(_1116, _1416, _1404);
    float _1426 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1418);
    float _1428 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1420);
    float _1430 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1422);
    float _1432 = _1420;
    if (!_1398)
    {
        _1432 = _1424;
    }
    float _1434 = _1432;
    bool _1436 = !_1398;
    float _1438 = _1434;
    if (!_1436)
    {
        float _1440 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1444 = _1360 + _1442;
        float _1446 = _1424 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1448 = rsqrt(_1352);
        float _1450 = _1444 * _1440;
        float _1452 = _1450 * 0.15915493667125701904296875;
        float _1454 = _1452 * 6.283185482025146484375;
        float _1456 = cos(_1454);
        float _1458 = _1452 * 6.283185482025146484375;
        float _1460 = sin(_1458);
        float _1462 = _1456 + (-1.0);
        float _1464 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1466 = fma(_1460, _1446, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1468 = fma(_1424, _1456, _1464);
        float _1470 = _1448 * _1466;
        float _1472 = fma(_1318, _1470, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1474 = fma(_1328, _1470, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1438 = _1468;
        _1344 = _1472;
        _1346 = _1474;
    }
    float _1476 = _1438;
    float _1478 = _1344;
    float _1480 = _1346;
    float _1482 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1484 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1486 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    out.m_65.x = _1426;
    out.m_65.y = _1428;
    out.m_65.z = _1430;
    float _1488 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1482);
    float _1490 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1484);
    float _1492 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1494 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1486);
    float _1496 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1488);
    float _1498 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1490);
    float _1500 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1492);
    float _1502 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1494);
    float _1504 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1506 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1508 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1500);
    float _1510 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1512 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1514 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1516 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1518 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1520 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1512);
    float _1522 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1514);
    float _1524 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1516);
    float _1526 = _1508 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1528 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1520);
    float _1530 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1522);
    float _1532 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1518);
    float _1534 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1524);
    float _1536 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1528);
    float _1538 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1530);
    float _1540 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1532);
    float _1542 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1534);
    float _1544 = _1536 + _1538;
    float _1546 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1540);
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1550 = _1476 + _1548;
    float _1552 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1556 = _1478 + _1554;
    float _1558 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1560 = _1480 + _1558;
    float _1562 = _1544 * 0.5;
    out.m_33.x = _1552;
    out.m_67.x = _1556;
    out.m_67.y = _1550;
    out.m_67.z = _1560;
    out.gl_Position.x = _1542;
    out.gl_Position.y = _1546;
    out.gl_Position.z = _1536;
    out.gl_Position.w = _1538;
    out.m_69.z = _1562;
    out.m_69.w = _1538;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_30.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_33.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1619 = as_type<float>(_104);
        out.gl_Position.z = _1619;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_35.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _96 = _126;
    }
    float _128 = _96;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_33.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1689 = as_type<float>(_142);
        out.gl_Position.z = _1689;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_37.w;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _148 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _150 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _148;
    float _152 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _154 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _152;
    float _156 = _150 * _150;
    float _158 = in.m_37.y;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _172 = fma(_154, _154, _156);
    float _174 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _176 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _174;
    float _178 = in.m_39.y;
    float _180 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[192].w + _180;
    float _184 = fma(_176, _176, _172);
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _188 = (*spvDescriptorSet0.vp_c9)._m0[193].z + _186;
    float _190 = 1.0 / _182;
    float _192 = 0.0;
    float _194 = _170;
    if (!_168)
    {
        float _196 = _170 * _170;
        float _198 = _196 * 0.5;
        _192 = _198;
    }
    float _200 = _192;
    bool _202 = _144 > 0.5;
    float _204 = _200;
    if (!_168)
    {
        float _206 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    float _210 = sqrt(_184);
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _214 = _212 != 0;
    float _216 = 1.0 / _188;
    float _218 = precise::max(_210, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _220 = precise::max(_210, (*spvDescriptorSet0.vp_c9)._m0[192].z);
    float _222 = precise::min(_218, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _224 = precise::min(_220, (*spvDescriptorSet0.vp_c9)._m0[192].w);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _228 = _222 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _232 = _224 + _230;
    bool _234 = !_168;
    float _236 = _208;
    if (!_234)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = _170 * _240;
        float _250 = 1.0 / _244;
        float _252 = _246 * 0.693147182464599609375;
        float _254 = exp2(_248);
        float _256 = 1.0 / _252;
        float _258 = _254 + (-1.0);
        float _260 = -_258;
        float _262 = fma(_260, _256, _170);
        float _264 = _262 * _250;
        float _266 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _266;
    }
    float _268 = _236;
    bool _270 = !_168;
    if (!_270)
    {
        float _272 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _274 = log2(_272);
        float _276 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _278 = _276 + 1.0;
        float _280 = 1.0 / _278;
        float _282 = _170 * _274;
        float _284 = exp2(_282);
        float _286 = -_284;
        float _288 = _286 + 1.0;
        float _290 = _288 * _280;
        _194 = _290;
    }
    float _292 = _194;
    float _294 = in.m_37.z;
    float _296 = -_178;
    float _298 = _296 + 1.0;
    float _300 = _228 * _216;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _304 = _302 != 0;
    float _306 = 0.0;
    if (_214)
    {
        float _308 = in.m_37.x;
        _306 = _308;
    }
    float _310 = _306;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _314 = _312 != 0;
    float _316 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _318 = _202 ? as_type<int>(_298) : as_type<int>(_178);
    float _320 = in.m_39.x;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _324 = _322 != 0;
    float _326 = -_232;
    float _328 = fma(_326, _190, 1.0);
    float _330 = in.m_41.x;
    float _332 = in.m_41.y;
    float _334 = in.m_41.z;
    float _336 = _324 ? as_type<float>(_318) : _178;
    float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _340 = 0.0;
    if (_304)
    {
        float _342 = in.m_37.x;
        _340 = _342;
    }
    float _344 = _340;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _348 = _158 > 0.5;
    float _350 = 0.0;
    if (_314)
    {
        float _352 = in.m_37.z;
        _350 = _352;
    }
    float _354 = _350;
    int _356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _358 = _356 != 0;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _362 = _348 ? as_type<int>(_298) : as_type<int>(_178);
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _366 = _294 > 0.5;
    int _368 = 0;
    int _370 = 0;
    if (_214)
    {
        _368 = 0;
        _370 = 0;
    }
    int _372 = _368;
    int _374 = _370;
    float _376 = _358 ? as_type<float>(_362) : _178;
    float _378 = _360 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _380 = _366 ? _298 : _178;
    float _382 = _364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _384 = _346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _388 = _386 != 0;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _392 = _390 != 0;
    float _394 = 0.0;
    int _396 = _372;
    int _398 = _374;
    float _400 = _380;
    if (_214)
    {
        _394 = _158;
    }
    float _402 = _394;
    float _404 = 0.0;
    float _406 = _310;
    float _408 = _402;
    if (_214)
    {
        _404 = _310;
    }
    float _410 = _404;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _414 = _412 != 0;
    float _416 = _410;
    float _418 = _330;
    bool _420 = _414;
    if (!_214)
    {
        float _422 = in.m_37.x;
        float _424 = _158 * 3.1415927410125732421875;
        float _426 = _424 * 0.15915493667125701904296875;
        float _428 = _426 * 6.283185482025146484375;
        float _430 = sin(_428);
        float _432 = _422 * 3.1415927410125732421875;
        float _434 = _432 * 0.15915493667125701904296875;
        float _436 = _434 * 6.283185482025146484375;
        float _438 = sin(_436);
        _396 = 1;
        _398 = 2;
        _406 = _422;
        _416 = _438;
        _408 = _430;
    }
    int _440 = _396;
    int _442 = _398;
    float _444 = _406;
    float _446 = _416;
    float _448 = _408;
    float _450 = _332 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _452 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _456 = _334 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _458 = _294 * 2.0;
    out.m_43.x = _378;
    out.m_43.y = _382;
    out.m_43.z = _384;
    float _460 = fma(_452, -2.0, _454);
    float _462 = _330 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    if (!_304)
    {
        _418 = _320;
    }
    float _464 = _418;
    float _466 = in.m_45.y;
    float _468 = floor(_458);
    float _470 = _158 + _294;
    float _472 = 0.0;
    float _474 = _464;
    int _476 = as_type<int>(_470);
    if (!_304)
    {
        _472 = _464;
    }
    float _478 = _472;
    float _480 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _482 = _478;
    if (_304)
    {
        _474 = _320;
    }
    float _484 = _474;
    float _486 = _470 + (-1.0);
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _490 = _488 != 0;
    float _492 = _158 * 2.0;
    float _494 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _460);
    bool _496 = _490;
    if (_304)
    {
        float _498 = -_484;
        float _500 = _498 + 1.0;
        _476 = as_type<int>(_500);
    }
    int _502 = _476;
    float _504 = _490 ? _380 : _178;
    float _506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _508 = _502;
    if (_304)
    {
        bool _510 = _344 > 0.5;
        _496 = _510;
    }
    bool _512 = _496;
    float _514 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _516 = in.m_41.w;
    if (_304)
    {
        float _518 = _512 ? as_type<float>(_502) : _484;
        _482 = _518;
    }
    float _520 = _482;
    if (_314)
    {
        float _522 = -_484;
        float _524 = _522 + 1.0;
        _508 = as_type<int>(_524);
    }
    int _526 = _508;
    int _528 = _414 ? as_type<int>(_380) : as_type<int>(_178);
    float _530 = floor(_492);
    int _532 = _528;
    if (_314)
    {
        bool _534 = _354 > 0.5;
        _420 = _534;
    }
    bool _536 = _420;
    float _538 = in.m_45.x;
    bool _540 = _468 > 0.0;
    float _542 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _466);
    bool _544 = _468 >= 0.0;
    bool _546 = isnan(_468);
    bool _548 = _544 || _546;
    bool _550 = isnan(0.0);
    bool _552 = _548 || _550;
    float _554 = in.m_47.x;
    if (!_314)
    {
        _400 = _484;
    }
    float _556 = _400;
    float _558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _560 = in.m_45.z;
    float _562 = _556;
    if (_314)
    {
        float _564 = _536 ? as_type<float>(_526) : _484;
        _562 = _564;
    }
    float _566 = _562;
    float _568 = _316 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _570 = 0.0;
    if (!_388)
    {
        _570 = _484;
    }
    float _572 = _570;
    float _574 = _146 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _576 = 0.0;
    float _578 = _572;
    if (!_392)
    {
        _576 = _484;
    }
    float _580 = _576;
    float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _584 = _530 > 0.0;
    float _586 = fma(_568, _376, -0.5);
    bool _588 = _530 >= 0.0;
    bool _590 = isnan(_530);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = _338 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _600 = _480 * _542;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _604 = _506 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _606 = fma(_598, _336, -0.5);
    float _608 = _558 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _610 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].w, _602);
    float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _614 = fma(_608, _504, -0.5);
    float _616 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _610);
    float _618 = in.m_47.z;
    float _620 = _582 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _622 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _624 = -_494;
    float _626 = fma(_616, _586, _624);
    int _628 = _552 ? 0 : 1;
    float _630 = fma(_620, as_type<float>(_528), -0.5);
    float _632 = _622 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c10)._m0[2].x);
    float _636 = _580;
    if (_388)
    {
        float _638 = -_484;
        float _640 = _638 + 1.0;
        _634 = as_type<int>(_640);
    }
    int _642 = _634;
    if (_392)
    {
        float _644 = -_484;
        float _646 = _644 + 1.0;
        _532 = as_type<int>(_646);
    }
    int _648 = _532;
    int _650 = ~_628;
    int _652 = _650 + 1;
    int _654 = _652 + 1;
    float _656 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[191].x, _632);
    int _658 = _654;
    if (!_540)
    {
        int _660 = ~_628;
        int _662 = _660 + 1;
        _658 = _662;
    }
    int _664 = _658;
    float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _668 = as_type<float>(_664);
    if (_388)
    {
        float _670 = _348 ? as_type<float>(_642) : _484;
        _578 = _670;
    }
    float _672 = _578;
    float _674 = _612 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_392)
    {
        float _676 = _348 ? as_type<float>(_648) : _484;
        _636 = _676;
    }
    float _678 = _636;
    float _680 = _656 * 6.283185482025146484375;
    float _682 = in.m_35.x;
    float _684 = in.m_35.y;
    float _686 = in.m_35.z;
    int _688 = _596 ? 0 : 1;
    float _690 = fma(_674, _566, -0.5);
    float _692 = _680 * 0.15915493667125701904296875;
    float _694 = in.m_30.x;
    float _696 = in.m_30.y;
    float _698 = in.m_30.z;
    float _700 = fma(_604, _672, -0.5);
    int _702 = ~_688;
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    float _708 = fma(_574, _520, -0.5);
    int _710 = _706;
    if (!_584)
    {
        int _712 = ~_688;
        int _714 = _712 + 1;
        _710 = _714;
    }
    int _716 = _710;
    float _718 = _692 * 6.283185482025146484375;
    float _720 = sin(_718);
    float _722 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _724 = _666 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    bool _726 = _440 != 1;
    float _728 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _730 = _442 != 2;
    float _732 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _734 = fma(_724, _678, -0.5);
    float _736 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _738 = log2(_736);
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _742 = float(_716);
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _746 = fma(_292, _682, _722);
    float _748 = fma(_292, _684, _728);
    float _750 = _444 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _754 = _720 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _756 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[93].z, _744);
    float _758 = -_740;
    float _760 = fma(_750, 2.0, _758);
    float _762 = _446 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _764 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[93].w, _752);
    float _766 = _158 + _444;
    float _768 = fma(_292, _686, _732);
    float _770 = fma(_748, _516, _696);
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _774 = _448 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _776 = fma(_618, _754, _538);
    float _778 = -_754;
    float _780 = fma(_554, _778, _560);
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _784 = _782 != 0;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _788 = _786 != 0;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _792 = _790 != 0;
    float _794 = _444 * 2.0;
    float _796 = _766 + (-1.0);
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (_730)
    {
        _798 = _444;
    }
    float _800 = _798;
    float _802 = -_772;
    float _804 = fma(_762, 2.0, _802);
    float _806 = floor(_794);
    float _808 = _800;
    if (!_730)
    {
        _808 = _294;
    }
    float _810 = _808;
    float _812 = _444 + _294;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _816 = fma(_746, _516, _694);
    float _818 = fma(_768, _516, _698);
    float _820 = _812 + (-1.0);
    float _822 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _824 = _810 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _828 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _830 = !_792;
    int _832 = _830 ? 0 : 1;
    float _834 = -_814;
    float _836 = fma(_824, 2.0, _834);
    bool _838 = !_784;
    float _840 = _838 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _842 = fma(_774, -2.0, _826);
    float _844 = _444 + (-0.5);
    int _846 = abs(as_type<int>(_840));
    float _848 = -_122;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[91].x, _804);
    int _852 = abs(_832);
    float _854 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[91].y, _842);
    float _856 = _840;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_726)
    {
        _856 = _158;
    }
    float _860 = _856;
    float _862 = -_122;
    float _864 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[86].x, _836);
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _776);
    bool _868 = _806 > 0.0;
    float _870 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _780);
    bool _872 = _806 >= 0.0;
    bool _874 = isnan(_806);
    bool _876 = _872 || _874;
    bool _878 = isnan(0.0);
    bool _880 = _876 || _878;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _886 = float(_664);
    float _888 = _860;
    float _890 = _886;
    if (!_726)
    {
        _858 = _294;
    }
    float _892 = _858;
    float _894 = _892;
    if (!_726)
    {
        _668 = _860;
    }
    float _896 = _668;
    float _898 = _896;
    if (_726)
    {
        _894 = _158;
    }
    float _900 = _894;
    if (_726)
    {
        _888 = _444;
    }
    float _902 = _888;
    float _904 = float(_846);
    float _906 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[83].w, _882);
    int _908 = _880 ? 0 : 1;
    float _910 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[83].z, _884);
    float _912 = float(_852);
    float _914 = _904 * _886;
    int _916 = ~_908;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    float _922 = in.m_49.x;
    float _924 = in.m_49.y;
    float _926 = in.m_49.z;
    int _928 = _920;
    if (!_868)
    {
        int _930 = ~_908;
        int _932 = _930 + 1;
        _928 = _932;
    }
    int _934 = _928;
    float _936 = _912 * _742;
    bool _938 = !_788;
    float _940 = _938 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _942 = _914 * (-2.0);
    float _944 = _940;
    if (_726)
    {
        _898 = _444;
    }
    float _946 = _898;
    float _948 = _936 * (-2.0);
    int _950 = abs(as_type<int>(_940));
    float _952 = _946 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _954 = float(_950);
    float _956 = float(_934);
    float _958 = _738 * _122;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_730)
    {
        _944 = _158;
    }
    float _962 = _944;
    float _964 = fma(_822, _942, _822);
    float _966 = _954 * _956;
    float _968 = -_960;
    float _970 = fma(_952, 2.0, _968);
    float _972 = exp2(_958);
    float _974 = _962;
    if (!_726)
    {
        _890 = _294;
    }
    float _976 = _890;
    float _978 = fma(_942, _922, _922);
    float _980 = _976;
    if (!_730)
    {
        _974 = _444;
    }
    float _982 = _974;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _988 = _982 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_726)
    {
        _980 = _158;
    }
    float _990 = _980;
    float _992 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[78].z, _984);
    bool _994 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _996 = isnan(1.0);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1002 = _998 || _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1006 = 1.0 + _1004;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1010 = _990 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1012 = fma(_988, -2.0, _986);
    float _1014 = 1.0 / _1006;
    float _1016 = fma(_1010, -2.0, _1008);
    float _1018 = -_972;
    float _1020 = _1018 + 1.0;
    bool _1022 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1024 = isnan(0.0);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1030 = _1026 || _1028;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1034 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[92].z, _756);
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1038 = _1030 ? _1020 : 0.0;
    float _1040 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1032);
    float _1042 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _992);
    float _1044 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1036);
    float _1046 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[92].w, _764);
    float _1048 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1040);
    float _1050 = -_122;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[76].x, _760);
    float _1054 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1044);
    float _1056 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _910);
    float _1058 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _906);
    float _1060 = -_122;
    float _1062 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[81].x, _970);
    float _1064 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1016);
    float _1066 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1012);
    if (_1002)
    {
        float _1068 = _1038 * _1014;
        _124 = _1068;
    }
    float _1070 = _124;
    float _1072 = _966 * (-2.0);
    float _1074 = _158 + (-0.5);
    float _1076 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[196].x, _978);
    float _1078 = fma(_948, _926, _926);
    float _1080 = fma(_1072, _924, _924);
    float _1082 = _294 + (-0.5);
    float _1084 = fma(_964, _1070, _1076);
    float _1086 = fma(_828, _948, _828);
    float _1088 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1080);
    float _1090 = fma(_514, _1072, _514);
    float _1092 = in.m_51.z;
    float _1094 = _1084 * 0.15915493667125701904296875;
    float _1096 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1078);
    float _1098 = in.m_51.w;
    float _1100 = fma(_1090, _1070, _1088);
    float _1102 = fma(_1086, _1070, _1096);
    float _1104 = in.m_51.y;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1108 = _1106 + 1.0;
    float _1110 = _1102 * 0.15915493667125701904296875;
    float _1112 = _1100 * 0.15915493667125701904296875;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1116 = fma(_300, _1108, (*spvDescriptorSet0.vp_c9)._m0[193].x);
    float _1118 = _1094 * 6.283185482025146484375;
    float _1120 = sin(_1118);
    float _1122 = _1114 * _328;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1126 = _770 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1130 = fma(_1034, _734, _850);
    float _1132 = _1094 * 6.283185482025146484375;
    float _1134 = cos(_1132);
    out.m_53.z = _1092;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1138 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1140 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1142 = _456 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1144 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1146 = _770 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1148 = _1110 * 6.283185482025146484375;
    float _1150 = cos(_1148);
    float _1152 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1154 = _770 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    out.m_55.x = _1138;
    out.m_55.y = _1140;
    out.m_55.z = _1144;
    out.m_55.w = _1122;
    float _1156 = fma(_1042, _708, _1052);
    float _1158 = _1152 * _866;
    float _1160 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1154);
    out.m_53.w = _1098;
    float _1162 = _1112 * 6.283185482025146484375;
    float _1164 = sin(_1162);
    float _1166 = _1142 * _870;
    float _1168 = -_854;
    float _1170 = fma(_1046, _630, _1168);
    out.m_53.y = _1104;
    bool _1172 = _466 != 0.0;
    bool _1174 = isnan(_466);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan(0.0);
    bool _1180 = _1176 || _1178;
    float _1182 = fma(_1048, _700, _864);
    float _1184 = -_1066;
    float _1186 = fma(_1054, _614, _1184);
    float _1188 = in.m_51.x;
    float _1190 = _1112 * 6.283185482025146484375;
    float _1192 = cos(_1190);
    float _1194 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1146);
    float _1196 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1126);
    float _1198 = _1134 * _1150;
    float _1200 = _1120 * _1150;
    bool _1202 = _776 == 0.0;
    bool _1204 = !_1180;
    bool _1206 = _1202 && _1204;
    float _1208 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1196);
    float _1210 = -_1064;
    float _1212 = fma(_1058, _606, _1210);
    float _1214 = _1110 * 6.283185482025146484375;
    float _1216 = sin(_1214);
    float _1218 = _1120 * _1164;
    float _1220 = _1134 * _1164;
    bool _1222 = _780 == 0.0;
    bool _1224 = _1222 && _1206;
    float _1226 = _1182 + 0.5;
    float _1228 = _1186 + 0.5;
    float _1230 = _1134 * _1192;
    float _1232 = _1120 * _1192;
    float _1234 = _1164 * _1150;
    float _1236 = _1198 * _600;
    float _1238 = _1192 * _1150;
    out.m_57.x = _1226;
    out.m_57.y = _1228;
    float _1240 = fma(_1216, _1230, _1218);
    float _1242 = fma(_1216, _1218, _1230);
    float _1244 = -_1220;
    float _1246 = fma(_1216, _1232, _1244);
    float _1248 = -_600;
    float _1250 = _1216 * _1248;
    float _1252 = -_1232;
    float _1254 = fma(_1216, _1220, _1252);
    float _1256 = fma(_1240, _1158, _1236);
    float _1258 = _1200 * _600;
    float _1260 = fma(_1238, _1158, _1250);
    float _1262 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1160);
    float _1264 = fma(_1254, _1166, _1256);
    float _1266 = fma(_1246, _1158, _1258);
    float _1268 = fma(_1234, _1166, _1260);
    float _1270 = _1208 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1272 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1274 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1276 = fma(_1242, _1166, _1266);
    float _1278 = _1170 + 0.5;
    float _1280 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1272);
    float _1282 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1274);
    float _1284 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1194);
    float _1286 = _1262 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1288 = fma(_1276, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1280);
    float _1290 = fma(_1276, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1282);
    float _1292 = _1130 + 0.5;
    float _1294 = fma(_1056, _690, _1062);
    float _1296 = _1270 + _1288;
    float _1298 = _1286 + _1290;
    float _1300 = in.m_59.x;
    float _1302 = in.m_59.y;
    float _1304 = in.m_59.z;
    float _1306 = _626 + 0.5;
    float _1308 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1310 = _1296 + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1314 = _1298 + _1312;
    out.m_61.x = _1292;
    out.m_61.y = _1278;
    float _1316 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1318 = _1298 + _1316;
    float _1320 = _1310 * _1310;
    float _1322 = _1294 + 0.5;
    out.m_53.x = _1188;
    float _1324 = fma(_1314, _1314, _1320);
    float _1326 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1328 = _1296 + _1326;
    float _1330 = _1156 + 0.5;
    float _1332 = _1212 + 0.5;
    float _1334 = _1328 * _1328;
    float _1336 = sqrt(_1324);
    out.m_63.x = _1330;
    out.m_63.y = _1306;
    out.m_63.z = _1322;
    out.m_63.w = _1332;
    float _1338 = _1302;
    float _1340 = _1300;
    float _1342 = _1304;
    float _1344 = _1298;
    float _1346 = _1296;
    if (!_1224)
    {
        float _1348 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1302);
        _1338 = _1348;
    }
    float _1350 = _1338;
    float _1352 = fma(_1318, _1318, _1334);
    if (!_1224)
    {
        float _1354 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1300);
        _1340 = _1354;
    }
    float _1356 = _1340;
    float _1358 = _1200 * _1350;
    float _1360 = sqrt(_1352);
    float _1362 = -_1350;
    float _1364 = _1216 * _1362;
    float _1366 = _1198 * _1350;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[194].x + _1368;
    float _1372 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (!_1224)
    {
        float _1374 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1304);
        _1342 = _1374;
    }
    float _1376 = _1342;
    float _1378 = fma(_1240, _1356, _1366);
    float _1380 = precise::max(_1336, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _1382 = 1.0 / _1370;
    float _1384 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1372);
    float _1386 = fma(_1238, _1356, _1364);
    float _1388 = precise::min(_1380, (*spvDescriptorSet0.vp_c9)._m0[194].x);
    float _1390 = fma(_1246, _1356, _1358);
    float _1392 = fma(_1276, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1384);
    float _1394 = _1284 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1396 = fma(_1254, _1376, _1378);
    bool _1398 = _1360 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _1402 = _1388 + _1400;
    float _1404 = _1394 + _1392;
    float _1406 = fma(_1234, _1376, _1386);
    float _1408 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1410 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1412 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1414 = fma(_1242, _1376, _1390);
    float _1416 = _1402 * _1382;
    float _1418 = fma(_1406, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1408);
    float _1420 = fma(_1406, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1410);
    float _1422 = fma(_1406, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1412);
    float _1424 = fma(_1116, _1416, _1404);
    float _1426 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1418);
    float _1428 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1420);
    float _1430 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1422);
    float _1432 = _1420;
    if (!_1398)
    {
        _1432 = _1424;
    }
    float _1434 = _1432;
    bool _1436 = !_1398;
    float _1438 = _1434;
    if (!_1436)
    {
        float _1440 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1444 = _1360 + _1442;
        float _1446 = _1424 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1448 = rsqrt(_1352);
        float _1450 = _1444 * _1440;
        float _1452 = _1450 * 0.15915493667125701904296875;
        float _1454 = _1452 * 6.283185482025146484375;
        float _1456 = cos(_1454);
        float _1458 = _1452 * 6.283185482025146484375;
        float _1460 = sin(_1458);
        float _1462 = _1456 + (-1.0);
        float _1464 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1466 = fma(_1460, _1446, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1468 = fma(_1424, _1456, _1464);
        float _1470 = _1448 * _1466;
        float _1472 = fma(_1318, _1470, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1474 = fma(_1328, _1470, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1438 = _1468;
        _1344 = _1472;
        _1346 = _1474;
    }
    float _1476 = _1438;
    float _1478 = _1344;
    float _1480 = _1346;
    float _1482 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1484 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1486 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    out.m_65.x = _1426;
    out.m_65.y = _1428;
    out.m_65.z = _1430;
    float _1488 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1482);
    float _1490 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1484);
    float _1492 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1494 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1486);
    float _1496 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1488);
    float _1498 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1490);
    float _1500 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1492);
    float _1502 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1494);
    float _1504 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1506 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1508 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1500);
    float _1510 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1512 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1514 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1516 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1518 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1520 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1512);
    float _1522 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1514);
    float _1524 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1516);
    float _1526 = _1508 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1528 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1520);
    float _1530 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1522);
    float _1532 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1518);
    float _1534 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1524);
    float _1536 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1528);
    float _1538 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1530);
    float _1540 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1532);
    float _1542 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1534);
    float _1544 = _1536 + _1538;
    float _1546 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1540);
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1550 = _1476 + _1548;
    float _1552 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1556 = _1478 + _1554;
    float _1558 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1560 = _1480 + _1558;
    float _1562 = _1544 * 0.5;
    out.m_33.x = _1552;
    out.m_67.x = _1556;
    out.m_67.y = _1550;
    out.m_67.z = _1560;
    out.gl_Position.x = _1542;
    out.gl_Position.y = _1546;
    out.gl_Position.z = _1536;
    out.gl_Position.w = _1538;
    out.m_69.z = _1562;
    out.m_69.w = _1538;
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
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_30.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_33.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1619 = as_type<float>(_104);
        out.gl_Position.z = _1619;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_35.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _96 = _126;
    }
    float _128 = _96;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_33.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1689 = as_type<float>(_142);
        out.gl_Position.z = _1689;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_37.w;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _148 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _150 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _148;
    float _152 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _154 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _152;
    float _156 = _150 * _150;
    float _158 = in.m_37.y;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _172 = fma(_154, _154, _156);
    float _174 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _176 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _174;
    float _178 = in.m_39.y;
    float _180 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[192].w + _180;
    float _184 = fma(_176, _176, _172);
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _188 = (*spvDescriptorSet0.vp_c9)._m0[193].z + _186;
    float _190 = 1.0 / _182;
    float _192 = 0.0;
    float _194 = _170;
    if (!_168)
    {
        float _196 = _170 * _170;
        float _198 = _196 * 0.5;
        _192 = _198;
    }
    float _200 = _192;
    bool _202 = _144 > 0.5;
    float _204 = _200;
    if (!_168)
    {
        float _206 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    float _210 = sqrt(_184);
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _214 = _212 != 0;
    float _216 = 1.0 / _188;
    float _218 = precise::max(_210, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _220 = precise::max(_210, (*spvDescriptorSet0.vp_c9)._m0[192].z);
    float _222 = precise::min(_218, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _224 = precise::min(_220, (*spvDescriptorSet0.vp_c9)._m0[192].w);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _228 = _222 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _232 = _224 + _230;
    bool _234 = !_168;
    float _236 = _208;
    if (!_234)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = _170 * _240;
        float _250 = 1.0 / _244;
        float _252 = _246 * 0.693147182464599609375;
        float _254 = exp2(_248);
        float _256 = 1.0 / _252;
        float _258 = _254 + (-1.0);
        float _260 = -_258;
        float _262 = fma(_260, _256, _170);
        float _264 = _262 * _250;
        float _266 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _266;
    }
    float _268 = _236;
    bool _270 = !_168;
    if (!_270)
    {
        float _272 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _274 = log2(_272);
        float _276 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _278 = _276 + 1.0;
        float _280 = 1.0 / _278;
        float _282 = _170 * _274;
        float _284 = exp2(_282);
        float _286 = -_284;
        float _288 = _286 + 1.0;
        float _290 = _288 * _280;
        _194 = _290;
    }
    float _292 = _194;
    float _294 = in.m_37.z;
    float _296 = -_178;
    float _298 = _296 + 1.0;
    float _300 = _228 * _216;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _304 = _302 != 0;
    float _306 = 0.0;
    if (_214)
    {
        float _308 = in.m_37.x;
        _306 = _308;
    }
    float _310 = _306;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _314 = _312 != 0;
    float _316 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _318 = _202 ? as_type<int>(_298) : as_type<int>(_178);
    float _320 = in.m_39.x;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _324 = _322 != 0;
    float _326 = -_232;
    float _328 = fma(_326, _190, 1.0);
    float _330 = in.m_41.x;
    float _332 = in.m_41.y;
    float _334 = in.m_41.z;
    float _336 = _324 ? as_type<float>(_318) : _178;
    float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _340 = 0.0;
    if (_304)
    {
        float _342 = in.m_37.x;
        _340 = _342;
    }
    float _344 = _340;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _348 = _158 > 0.5;
    float _350 = 0.0;
    if (_314)
    {
        float _352 = in.m_37.z;
        _350 = _352;
    }
    float _354 = _350;
    int _356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _358 = _356 != 0;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _362 = _348 ? as_type<int>(_298) : as_type<int>(_178);
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _366 = _294 > 0.5;
    int _368 = 0;
    int _370 = 0;
    if (_214)
    {
        _368 = 0;
        _370 = 0;
    }
    int _372 = _368;
    int _374 = _370;
    float _376 = _358 ? as_type<float>(_362) : _178;
    float _378 = _360 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _380 = _366 ? _298 : _178;
    float _382 = _364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _384 = _346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _388 = _386 != 0;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _392 = _390 != 0;
    float _394 = 0.0;
    int _396 = _372;
    int _398 = _374;
    float _400 = _380;
    if (_214)
    {
        _394 = _158;
    }
    float _402 = _394;
    float _404 = 0.0;
    float _406 = _310;
    float _408 = _402;
    if (_214)
    {
        _404 = _310;
    }
    float _410 = _404;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _414 = _412 != 0;
    float _416 = _410;
    float _418 = _330;
    bool _420 = _414;
    if (!_214)
    {
        float _422 = in.m_37.x;
        float _424 = _158 * 3.1415927410125732421875;
        float _426 = _424 * 0.15915493667125701904296875;
        float _428 = _426 * 6.283185482025146484375;
        float _430 = sin(_428);
        float _432 = _422 * 3.1415927410125732421875;
        float _434 = _432 * 0.15915493667125701904296875;
        float _436 = _434 * 6.283185482025146484375;
        float _438 = sin(_436);
        _396 = 1;
        _398 = 2;
        _406 = _422;
        _416 = _438;
        _408 = _430;
    }
    int _440 = _396;
    int _442 = _398;
    float _444 = _406;
    float _446 = _416;
    float _448 = _408;
    float _450 = _332 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _452 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _456 = _334 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _458 = _294 * 2.0;
    out.m_43.x = _378;
    out.m_43.y = _382;
    out.m_43.z = _384;
    float _460 = fma(_452, -2.0, _454);
    float _462 = _330 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    if (!_304)
    {
        _418 = _320;
    }
    float _464 = _418;
    float _466 = in.m_45.y;
    float _468 = floor(_458);
    float _470 = _158 + _294;
    float _472 = 0.0;
    float _474 = _464;
    int _476 = as_type<int>(_470);
    if (!_304)
    {
        _472 = _464;
    }
    float _478 = _472;
    float _480 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _482 = _478;
    if (_304)
    {
        _474 = _320;
    }
    float _484 = _474;
    float _486 = _470 + (-1.0);
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _490 = _488 != 0;
    float _492 = _158 * 2.0;
    float _494 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _460);
    bool _496 = _490;
    if (_304)
    {
        float _498 = -_484;
        float _500 = _498 + 1.0;
        _476 = as_type<int>(_500);
    }
    int _502 = _476;
    float _504 = _490 ? _380 : _178;
    float _506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _508 = _502;
    if (_304)
    {
        bool _510 = _344 > 0.5;
        _496 = _510;
    }
    bool _512 = _496;
    float _514 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _516 = in.m_41.w;
    if (_304)
    {
        float _518 = _512 ? as_type<float>(_502) : _484;
        _482 = _518;
    }
    float _520 = _482;
    if (_314)
    {
        float _522 = -_484;
        float _524 = _522 + 1.0;
        _508 = as_type<int>(_524);
    }
    int _526 = _508;
    int _528 = _414 ? as_type<int>(_380) : as_type<int>(_178);
    float _530 = floor(_492);
    int _532 = _528;
    if (_314)
    {
        bool _534 = _354 > 0.5;
        _420 = _534;
    }
    bool _536 = _420;
    float _538 = in.m_45.x;
    bool _540 = _468 > 0.0;
    float _542 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _466);
    bool _544 = _468 >= 0.0;
    bool _546 = isnan(_468);
    bool _548 = _544 || _546;
    bool _550 = isnan(0.0);
    bool _552 = _548 || _550;
    float _554 = in.m_47.x;
    if (!_314)
    {
        _400 = _484;
    }
    float _556 = _400;
    float _558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _560 = in.m_45.z;
    float _562 = _556;
    if (_314)
    {
        float _564 = _536 ? as_type<float>(_526) : _484;
        _562 = _564;
    }
    float _566 = _562;
    float _568 = _316 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _570 = 0.0;
    if (!_388)
    {
        _570 = _484;
    }
    float _572 = _570;
    float _574 = _146 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _576 = 0.0;
    float _578 = _572;
    if (!_392)
    {
        _576 = _484;
    }
    float _580 = _576;
    float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _584 = _530 > 0.0;
    float _586 = fma(_568, _376, -0.5);
    bool _588 = _530 >= 0.0;
    bool _590 = isnan(_530);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = _338 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _600 = _480 * _542;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _604 = _506 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _606 = fma(_598, _336, -0.5);
    float _608 = _558 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _610 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].w, _602);
    float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _614 = fma(_608, _504, -0.5);
    float _616 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _610);
    float _618 = in.m_47.z;
    float _620 = _582 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _622 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _624 = -_494;
    float _626 = fma(_616, _586, _624);
    int _628 = _552 ? 0 : 1;
    float _630 = fma(_620, as_type<float>(_528), -0.5);
    float _632 = _622 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c10)._m0[2].x);
    float _636 = _580;
    if (_388)
    {
        float _638 = -_484;
        float _640 = _638 + 1.0;
        _634 = as_type<int>(_640);
    }
    int _642 = _634;
    if (_392)
    {
        float _644 = -_484;
        float _646 = _644 + 1.0;
        _532 = as_type<int>(_646);
    }
    int _648 = _532;
    int _650 = ~_628;
    int _652 = _650 + 1;
    int _654 = _652 + 1;
    float _656 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[191].x, _632);
    int _658 = _654;
    if (!_540)
    {
        int _660 = ~_628;
        int _662 = _660 + 1;
        _658 = _662;
    }
    int _664 = _658;
    float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _668 = as_type<float>(_664);
    if (_388)
    {
        float _670 = _348 ? as_type<float>(_642) : _484;
        _578 = _670;
    }
    float _672 = _578;
    float _674 = _612 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_392)
    {
        float _676 = _348 ? as_type<float>(_648) : _484;
        _636 = _676;
    }
    float _678 = _636;
    float _680 = _656 * 6.283185482025146484375;
    float _682 = in.m_35.x;
    float _684 = in.m_35.y;
    float _686 = in.m_35.z;
    int _688 = _596 ? 0 : 1;
    float _690 = fma(_674, _566, -0.5);
    float _692 = _680 * 0.15915493667125701904296875;
    float _694 = in.m_30.x;
    float _696 = in.m_30.y;
    float _698 = in.m_30.z;
    float _700 = fma(_604, _672, -0.5);
    int _702 = ~_688;
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    float _708 = fma(_574, _520, -0.5);
    int _710 = _706;
    if (!_584)
    {
        int _712 = ~_688;
        int _714 = _712 + 1;
        _710 = _714;
    }
    int _716 = _710;
    float _718 = _692 * 6.283185482025146484375;
    float _720 = sin(_718);
    float _722 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _724 = _666 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    bool _726 = _440 != 1;
    float _728 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _730 = _442 != 2;
    float _732 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _734 = fma(_724, _678, -0.5);
    float _736 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _738 = log2(_736);
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _742 = float(_716);
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _746 = fma(_292, _682, _722);
    float _748 = fma(_292, _684, _728);
    float _750 = _444 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _754 = _720 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _756 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[93].z, _744);
    float _758 = -_740;
    float _760 = fma(_750, 2.0, _758);
    float _762 = _446 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _764 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[93].w, _752);
    float _766 = _158 + _444;
    float _768 = fma(_292, _686, _732);
    float _770 = fma(_748, _516, _696);
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _774 = _448 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _776 = fma(_618, _754, _538);
    float _778 = -_754;
    float _780 = fma(_554, _778, _560);
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _784 = _782 != 0;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _788 = _786 != 0;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _792 = _790 != 0;
    float _794 = _444 * 2.0;
    float _796 = _766 + (-1.0);
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (_730)
    {
        _798 = _444;
    }
    float _800 = _798;
    float _802 = -_772;
    float _804 = fma(_762, 2.0, _802);
    float _806 = floor(_794);
    float _808 = _800;
    if (!_730)
    {
        _808 = _294;
    }
    float _810 = _808;
    float _812 = _444 + _294;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _816 = fma(_746, _516, _694);
    float _818 = fma(_768, _516, _698);
    float _820 = _812 + (-1.0);
    float _822 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _824 = _810 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _828 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _830 = !_792;
    int _832 = _830 ? 0 : 1;
    float _834 = -_814;
    float _836 = fma(_824, 2.0, _834);
    bool _838 = !_784;
    float _840 = _838 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _842 = fma(_774, -2.0, _826);
    float _844 = _444 + (-0.5);
    int _846 = abs(as_type<int>(_840));
    float _848 = -_122;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[91].x, _804);
    int _852 = abs(_832);
    float _854 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[91].y, _842);
    float _856 = _840;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_726)
    {
        _856 = _158;
    }
    float _860 = _856;
    float _862 = -_122;
    float _864 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[86].x, _836);
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _776);
    bool _868 = _806 > 0.0;
    float _870 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _780);
    bool _872 = _806 >= 0.0;
    bool _874 = isnan(_806);
    bool _876 = _872 || _874;
    bool _878 = isnan(0.0);
    bool _880 = _876 || _878;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _886 = float(_664);
    float _888 = _860;
    float _890 = _886;
    if (!_726)
    {
        _858 = _294;
    }
    float _892 = _858;
    float _894 = _892;
    if (!_726)
    {
        _668 = _860;
    }
    float _896 = _668;
    float _898 = _896;
    if (_726)
    {
        _894 = _158;
    }
    float _900 = _894;
    if (_726)
    {
        _888 = _444;
    }
    float _902 = _888;
    float _904 = float(_846);
    float _906 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[83].w, _882);
    int _908 = _880 ? 0 : 1;
    float _910 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[83].z, _884);
    float _912 = float(_852);
    float _914 = _904 * _886;
    int _916 = ~_908;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    float _922 = in.m_49.x;
    float _924 = in.m_49.y;
    float _926 = in.m_49.z;
    int _928 = _920;
    if (!_868)
    {
        int _930 = ~_908;
        int _932 = _930 + 1;
        _928 = _932;
    }
    int _934 = _928;
    float _936 = _912 * _742;
    bool _938 = !_788;
    float _940 = _938 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _942 = _914 * (-2.0);
    float _944 = _940;
    if (_726)
    {
        _898 = _444;
    }
    float _946 = _898;
    float _948 = _936 * (-2.0);
    int _950 = abs(as_type<int>(_940));
    float _952 = _946 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _954 = float(_950);
    float _956 = float(_934);
    float _958 = _738 * _122;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_730)
    {
        _944 = _158;
    }
    float _962 = _944;
    float _964 = fma(_822, _942, _822);
    float _966 = _954 * _956;
    float _968 = -_960;
    float _970 = fma(_952, 2.0, _968);
    float _972 = exp2(_958);
    float _974 = _962;
    if (!_726)
    {
        _890 = _294;
    }
    float _976 = _890;
    float _978 = fma(_942, _922, _922);
    float _980 = _976;
    if (!_730)
    {
        _974 = _444;
    }
    float _982 = _974;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _988 = _982 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_726)
    {
        _980 = _158;
    }
    float _990 = _980;
    float _992 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[78].z, _984);
    bool _994 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _996 = isnan(1.0);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1002 = _998 || _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1006 = 1.0 + _1004;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1010 = _990 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1012 = fma(_988, -2.0, _986);
    float _1014 = 1.0 / _1006;
    float _1016 = fma(_1010, -2.0, _1008);
    float _1018 = -_972;
    float _1020 = _1018 + 1.0;
    bool _1022 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1024 = isnan(0.0);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1030 = _1026 || _1028;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1034 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[92].z, _756);
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1038 = _1030 ? _1020 : 0.0;
    float _1040 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1032);
    float _1042 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _992);
    float _1044 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1036);
    float _1046 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[92].w, _764);
    float _1048 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1040);
    float _1050 = -_122;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[76].x, _760);
    float _1054 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1044);
    float _1056 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _910);
    float _1058 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _906);
    float _1060 = -_122;
    float _1062 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[81].x, _970);
    float _1064 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1016);
    float _1066 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1012);
    if (_1002)
    {
        float _1068 = _1038 * _1014;
        _124 = _1068;
    }
    float _1070 = _124;
    float _1072 = _966 * (-2.0);
    float _1074 = _158 + (-0.5);
    float _1076 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[196].x, _978);
    float _1078 = fma(_948, _926, _926);
    float _1080 = fma(_1072, _924, _924);
    float _1082 = _294 + (-0.5);
    float _1084 = fma(_964, _1070, _1076);
    float _1086 = fma(_828, _948, _828);
    float _1088 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1080);
    float _1090 = fma(_514, _1072, _514);
    float _1092 = in.m_51.z;
    float _1094 = _1084 * 0.15915493667125701904296875;
    float _1096 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1078);
    float _1098 = in.m_51.w;
    float _1100 = fma(_1090, _1070, _1088);
    float _1102 = fma(_1086, _1070, _1096);
    float _1104 = in.m_51.y;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1108 = _1106 + 1.0;
    float _1110 = _1102 * 0.15915493667125701904296875;
    float _1112 = _1100 * 0.15915493667125701904296875;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1116 = fma(_300, _1108, (*spvDescriptorSet0.vp_c9)._m0[193].x);
    float _1118 = _1094 * 6.283185482025146484375;
    float _1120 = sin(_1118);
    float _1122 = _1114 * _328;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1126 = _770 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1130 = fma(_1034, _734, _850);
    float _1132 = _1094 * 6.283185482025146484375;
    float _1134 = cos(_1132);
    out.m_53.z = _1092;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1138 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1140 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1142 = _456 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1144 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1146 = _770 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1148 = _1110 * 6.283185482025146484375;
    float _1150 = cos(_1148);
    float _1152 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1154 = _770 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    out.m_55.x = _1138;
    out.m_55.y = _1140;
    out.m_55.z = _1144;
    out.m_55.w = _1122;
    float _1156 = fma(_1042, _708, _1052);
    float _1158 = _1152 * _866;
    float _1160 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1154);
    out.m_53.w = _1098;
    float _1162 = _1112 * 6.283185482025146484375;
    float _1164 = sin(_1162);
    float _1166 = _1142 * _870;
    float _1168 = -_854;
    float _1170 = fma(_1046, _630, _1168);
    out.m_53.y = _1104;
    bool _1172 = _466 != 0.0;
    bool _1174 = isnan(_466);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan(0.0);
    bool _1180 = _1176 || _1178;
    float _1182 = fma(_1048, _700, _864);
    float _1184 = -_1066;
    float _1186 = fma(_1054, _614, _1184);
    float _1188 = in.m_51.x;
    float _1190 = _1112 * 6.283185482025146484375;
    float _1192 = cos(_1190);
    float _1194 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1146);
    float _1196 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1126);
    float _1198 = _1134 * _1150;
    float _1200 = _1120 * _1150;
    bool _1202 = _776 == 0.0;
    bool _1204 = !_1180;
    bool _1206 = _1202 && _1204;
    float _1208 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1196);
    float _1210 = -_1064;
    float _1212 = fma(_1058, _606, _1210);
    float _1214 = _1110 * 6.283185482025146484375;
    float _1216 = sin(_1214);
    float _1218 = _1120 * _1164;
    float _1220 = _1134 * _1164;
    bool _1222 = _780 == 0.0;
    bool _1224 = _1222 && _1206;
    float _1226 = _1182 + 0.5;
    float _1228 = _1186 + 0.5;
    float _1230 = _1134 * _1192;
    float _1232 = _1120 * _1192;
    float _1234 = _1164 * _1150;
    float _1236 = _1198 * _600;
    float _1238 = _1192 * _1150;
    out.m_57.x = _1226;
    out.m_57.y = _1228;
    float _1240 = fma(_1216, _1230, _1218);
    float _1242 = fma(_1216, _1218, _1230);
    float _1244 = -_1220;
    float _1246 = fma(_1216, _1232, _1244);
    float _1248 = -_600;
    float _1250 = _1216 * _1248;
    float _1252 = -_1232;
    float _1254 = fma(_1216, _1220, _1252);
    float _1256 = fma(_1240, _1158, _1236);
    float _1258 = _1200 * _600;
    float _1260 = fma(_1238, _1158, _1250);
    float _1262 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1160);
    float _1264 = fma(_1254, _1166, _1256);
    float _1266 = fma(_1246, _1158, _1258);
    float _1268 = fma(_1234, _1166, _1260);
    float _1270 = _1208 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1272 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1274 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1276 = fma(_1242, _1166, _1266);
    float _1278 = _1170 + 0.5;
    float _1280 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1272);
    float _1282 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1274);
    float _1284 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1194);
    float _1286 = _1262 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1288 = fma(_1276, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1280);
    float _1290 = fma(_1276, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1282);
    float _1292 = _1130 + 0.5;
    float _1294 = fma(_1056, _690, _1062);
    float _1296 = _1270 + _1288;
    float _1298 = _1286 + _1290;
    float _1300 = in.m_59.x;
    float _1302 = in.m_59.y;
    float _1304 = in.m_59.z;
    float _1306 = _626 + 0.5;
    float _1308 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1310 = _1296 + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1314 = _1298 + _1312;
    out.m_61.x = _1292;
    out.m_61.y = _1278;
    float _1316 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1318 = _1298 + _1316;
    float _1320 = _1310 * _1310;
    float _1322 = _1294 + 0.5;
    out.m_53.x = _1188;
    float _1324 = fma(_1314, _1314, _1320);
    float _1326 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1328 = _1296 + _1326;
    float _1330 = _1156 + 0.5;
    float _1332 = _1212 + 0.5;
    float _1334 = _1328 * _1328;
    float _1336 = sqrt(_1324);
    out.m_63.x = _1330;
    out.m_63.y = _1306;
    out.m_63.z = _1322;
    out.m_63.w = _1332;
    float _1338 = _1302;
    float _1340 = _1300;
    float _1342 = _1304;
    float _1344 = _1298;
    float _1346 = _1296;
    if (!_1224)
    {
        float _1348 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1302);
        _1338 = _1348;
    }
    float _1350 = _1338;
    float _1352 = fma(_1318, _1318, _1334);
    if (!_1224)
    {
        float _1354 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1300);
        _1340 = _1354;
    }
    float _1356 = _1340;
    float _1358 = _1200 * _1350;
    float _1360 = sqrt(_1352);
    float _1362 = -_1350;
    float _1364 = _1216 * _1362;
    float _1366 = _1198 * _1350;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[194].x + _1368;
    float _1372 = _1264 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (!_1224)
    {
        float _1374 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1304);
        _1342 = _1374;
    }
    float _1376 = _1342;
    float _1378 = fma(_1240, _1356, _1366);
    float _1380 = precise::max(_1336, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _1382 = 1.0 / _1370;
    float _1384 = fma(_1268, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1372);
    float _1386 = fma(_1238, _1356, _1364);
    float _1388 = precise::min(_1380, (*spvDescriptorSet0.vp_c9)._m0[194].x);
    float _1390 = fma(_1246, _1356, _1358);
    float _1392 = fma(_1276, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1384);
    float _1394 = _1284 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1396 = fma(_1254, _1376, _1378);
    bool _1398 = _1360 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _1402 = _1388 + _1400;
    float _1404 = _1394 + _1392;
    float _1406 = fma(_1234, _1376, _1386);
    float _1408 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1410 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1412 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1414 = fma(_1242, _1376, _1390);
    float _1416 = _1402 * _1382;
    float _1418 = fma(_1406, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1408);
    float _1420 = fma(_1406, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1410);
    float _1422 = fma(_1406, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1412);
    float _1424 = fma(_1116, _1416, _1404);
    float _1426 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1418);
    float _1428 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1420);
    float _1430 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1422);
    float _1432 = _1420;
    if (!_1398)
    {
        _1432 = _1424;
    }
    float _1434 = _1432;
    bool _1436 = !_1398;
    float _1438 = _1434;
    if (!_1436)
    {
        float _1440 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1444 = _1360 + _1442;
        float _1446 = _1424 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1448 = rsqrt(_1352);
        float _1450 = _1444 * _1440;
        float _1452 = _1450 * 0.15915493667125701904296875;
        float _1454 = _1452 * 6.283185482025146484375;
        float _1456 = cos(_1454);
        float _1458 = _1452 * 6.283185482025146484375;
        float _1460 = sin(_1458);
        float _1462 = _1456 + (-1.0);
        float _1464 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1466 = fma(_1460, _1446, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1468 = fma(_1424, _1456, _1464);
        float _1470 = _1448 * _1466;
        float _1472 = fma(_1318, _1470, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1474 = fma(_1328, _1470, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1438 = _1468;
        _1344 = _1472;
        _1346 = _1474;
    }
    float _1476 = _1438;
    float _1478 = _1344;
    float _1480 = _1346;
    float _1482 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1484 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1486 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    out.m_65.x = _1426;
    out.m_65.y = _1428;
    out.m_65.z = _1430;
    float _1488 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1482);
    float _1490 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1484);
    float _1492 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1494 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1486);
    float _1496 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1488);
    float _1498 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1490);
    float _1500 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1492);
    float _1502 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1494);
    float _1504 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1506 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1508 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1500);
    float _1510 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1512 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1514 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1516 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1518 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1520 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1512);
    float _1522 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1514);
    float _1524 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1516);
    float _1526 = _1508 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1528 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1520);
    float _1530 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1522);
    float _1532 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1518);
    float _1534 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1524);
    float _1536 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1528);
    float _1538 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1530);
    float _1540 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1532);
    float _1542 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1534);
    float _1544 = _1536 + _1538;
    float _1546 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1540);
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1550 = _1476 + _1548;
    float _1552 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1556 = _1478 + _1554;
    float _1558 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1560 = _1480 + _1558;
    float _1562 = _1544 * 0.5;
    out.m_33.x = _1552;
    out.m_67.x = _1556;
    out.m_67.y = _1550;
    out.m_67.z = _1560;
    out.gl_Position.x = _1542;
    out.gl_Position.y = _1546;
    out.gl_Position.z = _1536;
    out.gl_Position.w = _1538;
    out.m_69.z = _1562;
    out.m_69.w = _1538;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

