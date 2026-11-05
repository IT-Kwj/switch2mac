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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_39 [[attribute(1)]];
    float4 m_37 [[attribute(2)]];
    float4 m_41 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_45 [[attribute(8)]];
    float4 m_43 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
    float4 m_47 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _920 = false;
    bool _578 = false;
    bool _464 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_30.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_86)
    {
        out.m_33.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _90 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2069 = as_type<float>(_98);
        out.gl_Position.z = _2069;
    }
    if (!_86)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _102 = in.m_35.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _118 = 0.0;
    float _120 = _116;
    if (_112)
    {
        float _122 = float(_82);
        _118 = _122;
    }
    float _124 = _118;
    bool _126 = _116 >= _124;
    bool _128 = !_112;
    bool _130 = _126 || _128;
    if (_130)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _92;
    if (_130)
    {
        out.m_33.x = 0.0;
    }
    if (_130)
    {
        float _134 = _132 * 5.0;
        _100 = as_type<int>(_134);
    }
    int _136 = _100;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2138 = as_type<float>(_136);
        out.gl_Position.z = _2138;
    }
    if (_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_37.x;
    float _140 = in.m_37.y;
    float _142 = in.m_37.z;
    float _144 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _146 = in.m_39.x;
    float _148 = in.m_39.y;
    float _150 = in.m_39.z;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_41.x;
    float _164 = in.m_41.y;
    float _166 = in.m_41.z;
    float _168 = 0.0;
    float _170 = _144;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_160)
    {
        float _174 = _144 * _144;
        float _176 = _174 * 0.5;
        _168 = _176;
    }
    float _178 = _168;
    float _180 = _178;
    if (!_160)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    float _186 = _138 * _138;
    float _188 = _140 * _140;
    float _190 = _142 * _142;
    float _192 = fma(_146, _146, _186);
    float _194 = fma(_148, _148, _188);
    float _196 = fma(_150, _150, _190);
    float _198 = fma(_162, _162, _192);
    float _200 = fma(_164, _164, _194);
    float _202 = fma(_166, _166, _196);
    float _204 = sqrt(_198);
    float _206 = sqrt(_200);
    bool _208 = _204 > 0.0;
    float _210 = sqrt(_202);
    float _212 = in.m_35.x;
    float _214 = in.m_35.y;
    float _216 = in.m_35.z;
    bool _218 = _206 > 0.0;
    float _220 = 0.0;
    float _222 = _184;
    float _224 = _206;
    float _226 = _198;
    float _228 = _200;
    float _230 = _202;
    if (_208)
    {
        float _232 = rsqrt(_198);
        _220 = _232;
    }
    float _234 = _220;
    bool _236 = _210 > 0.0;
    float _238 = 0.0;
    float _240 = _210;
    if (_218)
    {
        float _242 = rsqrt(_200);
        _238 = _242;
    }
    float _244 = _238;
    bool _246 = !_160;
    float _248 = 0.0;
    float _250 = _234;
    if (!_246)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = _144 * _254;
        float _264 = 1.0 / _258;
        float _266 = _260 * 0.693147182464599609375;
        float _268 = exp2(_262);
        float _270 = 1.0 / _266;
        float _272 = _268 + (-1.0);
        float _274 = -_272;
        float _276 = fma(_274, _270, _144);
        float _278 = _276 * _264;
        float _280 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _248 = _264;
        _222 = _280;
        _224 = _258;
        _226 = _266;
        _240 = _278;
        _228 = _268;
    }
    float _282 = _248;
    float _284 = _222;
    float _286 = _224;
    float _288 = _226;
    float _290 = _240;
    float _292 = _228;
    bool _294 = !_160;
    float _296 = _282;
    float _298 = _290;
    float _300 = _286;
    float _302 = _292;
    float _304 = _288;
    float _306 = _284;
    if (!_294)
    {
        float _308 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _310 = log2(_308);
        float _312 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _314 = _312 + 1.0;
        float _316 = 1.0 / _314;
        float _318 = _144 * _310;
        float _320 = exp2(_318);
        float _322 = -_320;
        float _324 = _322 + 1.0;
        float _326 = _324 * _316;
        _170 = _326;
        _172 = _314;
        _296 = _320;
    }
    float _328 = _170;
    float _330 = _172;
    float _332 = _296;
    float _334 = in.m_43.w;
    float _336 = _330;
    float _338 = _332;
    if (!_208)
    {
        _336 = 0.0;
        _338 = 0.0;
    }
    float _340 = _336;
    float _342 = _338;
    float _344 = _340;
    float _346 = _342;
    if (!_208)
    {
        _298 = 0.0;
    }
    float _348 = _298;
    float _350 = _348;
    if (_208)
    {
        float _352 = _234 * _146;
        _344 = _352;
    }
    float _354 = _344;
    float _356 = in.m_30.x;
    float _358 = in.m_30.y;
    float _360 = in.m_30.z;
    if (_208)
    {
        float _362 = _234 * _138;
        _346 = _362;
    }
    float _364 = _346;
    if (_208)
    {
        float _366 = _234 * _162;
        _350 = _366;
    }
    float _368 = _350;
    float _370 = 0.0;
    if (_236)
    {
        float _372 = rsqrt(_202);
        _370 = _372;
    }
    float _374 = _370;
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _378 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _380 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (!_218)
    {
        _300 = 0.0;
    }
    float _382 = _300;
    float _384 = _382;
    if (_218)
    {
        float _386 = _244 * _148;
        _384 = _386;
    }
    float _388 = _384;
    float _390 = fma(_328, _212, _378);
    float _392 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _394 = fma(_328, _214, _380);
    if (!_236)
    {
        _230 = 0.0;
        _250 = 0.0;
    }
    float _396 = _230;
    float _398 = _250;
    float _400 = _398;
    float _402 = _396;
    if (!_218)
    {
        _302 = 0.0;
    }
    float _404 = _302;
    float _406 = fma(_328, _216, _392);
    float _408 = _404;
    if (!_218)
    {
        _304 = 0.0;
    }
    float _410 = _304;
    float _412 = _410;
    if (_218)
    {
        float _414 = _244 * _140;
        _408 = _414;
    }
    float _416 = _408;
    if (!_236)
    {
        _306 = 0.0;
    }
    float _418 = _306;
    float _420 = _418;
    if (_218)
    {
        float _422 = _244 * _164;
        _412 = _422;
    }
    float _424 = _412;
    if (_236)
    {
        float _426 = _374 * _150;
        _420 = _426;
    }
    float _428 = _420;
    if (_236)
    {
        float _430 = _374 * _142;
        _400 = _430;
    }
    float _432 = _400;
    if (_236)
    {
        float _434 = _374 * _166;
        _402 = _434;
    }
    float _436 = _402;
    float _438 = fma(_390, _334, _356);
    float _440 = fma(_394, _334, _358);
    float _442 = fma(_406, _334, _360);
    bool _444 = !_376;
    float _462;
    if (!_444)
    {
        float _446 = in.m_45.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_82);
        float _468 = 1.0 / _466;
        float _470 = _116 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _476 = _472 + _474;
    bool _478 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _480 = isnan(_472);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _490;
    bool _494 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _496 = isnan(_472);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -_488;
    float _508 = _506 + 1.0;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _510;
    float _514 = 1.0 / _492;
    bool _516 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _518 = _504 * _508;
    float _520 = -_504;
    float _522 = _520 + 1.0;
    float _524 = _476 * _514;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _526;
    float _530 = fma(_512, _524, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _532;
    float _536 = fma(_528, _524, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _538 = fma(_534, _524, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _540 = _530 * _518;
    float _542 = _538 * _518;
    float _544 = _536 * _518;
    float _546 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].x, _540);
    float _548 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].y, _542);
    float _550 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].z, _544);
    float _552 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[144].x, _546);
    float _554 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[144].y, _548);
    float _556 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[144].z, _550);
    bool _558 = !_516;
    float _576;
    if (!_558)
    {
        float _560 = in.m_45.x;
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _564 = _560 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _566 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _568 = _566 * _562;
        float _570 = floor(_568);
        float _572 = -_570;
        float _574 = _568 + _572;
        _576 = _574;
        _578 = true;
    }
    else
    {
        float _580 = float(_82);
        float _582 = 1.0 / _580;
        float _584 = _116 * _582;
        _576 = _584;
    }
    _578 = false;
    float _586 = _576;
    float _588 = in.m_43.x;
    float _590 = in.m_43.y;
    float _592 = in.m_43.z;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _596 = _586 + _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _606;
    float _610 = 1.0 / _600;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _620 = 1.0 / _608;
    bool _622 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _624 = _556 * _592;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _628 = _586 + _626;
    float _630 = 1.0 / _604;
    float _632 = _554 * _590;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _636 = _586 + _634;
    float _638 = _596 * _610;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _642 = _586 + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _644;
    bool _648 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _650 = isnan(_586);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _664 = 1.0 / _614;
    bool _666 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _668 = isnan(_586);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = _628 * _620;
    bool _680 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _682 = isnan(_586);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = fma(_646, _638, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _694 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _696 = isnan(_586);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -_676;
    float _708 = _706 + 1.0;
    float _710 = 1.0 / _618;
    float _712 = _636 * _630;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _714;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _720 = _586 + _718;
    float _722 = -_690;
    float _724 = _722 + 1.0;
    float _726 = _658 * _708;
    float _728 = fma(_716, _638, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _730 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _732 = isnan(_586);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    float _742 = _642 * _664;
    bool _744 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _746 = isnan(_586);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -_658;
    float _758 = _756 + 1.0;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _764 = _754 * _724;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _770 = _720 * _710;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _772;
    float _776 = -_704;
    float _778 = _776 + 1.0;
    float _780 = _690 * _758;
    float _782 = fma(_774, _638, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _784 = -_754;
    float _786 = _784 + 1.0;
    float _788 = _740 * _778;
    float _790 = fma(_768, _712, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _792 = _704 * _786;
    float _794 = _728 * _788;
    float _796 = fma(_662, _712, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _798 = _782 * _788;
    float _800 = _692 * _788;
    float _802 = -_740;
    float _804 = _802 + 1.0;
    float _806 = fma(_762, _712, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _808;
    float _812 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[107].x, _798);
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[107].y, _800);
    float _816 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[107].z, _794);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _834;
    float _838 = fma(_810, _742, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _840 = fma(_790, _792, _812);
    float _842 = fma(_824, _742, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _844 = fma(_820, _770, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _846 = fma(_828, _770, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _848 = fma(_832, _770, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _850 = fma(_796, _792, _814);
    float _852 = fma(_806, _792, _816);
    float _854 = fma(_836, _742, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _856 = fma(_838, _764, _840);
    float _858 = fma(_842, _764, _850);
    float _860 = fma(_854, _764, _852);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _862;
    float _866 = fma(_844, _780, _856);
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _868;
    float _872 = fma(_846, _780, _858);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _874;
    float _878 = fma(_864, _678, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _880 = fma(_870, _678, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _882 = fma(_848, _780, _860);
    float _884 = fma(_876, _678, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _886 = fma(_878, _726, _866);
    float _888 = fma(_880, _726, _872);
    float _890 = _552 * _588;
    float _892 = fma(_884, _726, _882);
    float _894 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[112].x, _886);
    float _896 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[112].y, _888);
    float _898 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[112].z, _892);
    bool _900 = !_622;
    float _918;
    if (!_900)
    {
        float _902 = in.m_45.x;
        float _904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _906 = _902 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _910 = _908 * _904;
        float _912 = floor(_910);
        float _914 = -_912;
        float _916 = _910 + _914;
        _918 = _916;
        _920 = true;
    }
    else
    {
        float _922 = float(_82);
        float _924 = 1.0 / _922;
        float _926 = _116 * _924;
        _918 = _926;
    }
    _920 = false;
    float _928 = _918;
    float _930 = in.m_45.z;
    float _932 = _440 * _148;
    float _934 = _440 * _140;
    float _936 = in.m_45.x;
    float _938 = _440 * _164;
    float _940 = fma(_438, _138, _934);
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _944 = _942 != 0;
    float _946 = in.m_45.y;
    float _948 = fma(_438, _146, _932);
    float _950 = fma(_438, _162, _938);
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _954 = _952 != 0;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _958 = _956 != 0;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _962 = _960 != 0;
    float _964 = in.m_45.w;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _968 = in.m_47.x;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _974 = _930 * 2.0;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _980 = _936 * 2.0;
    float _982 = _936 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _984 = floor(_974);
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _988 = _946 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _990 = -_966;
    float _992 = fma(_982, 2.0, _990);
    float _994 = _982;
    float _996 = _988;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    bool _1000 = _958;
    if (!_944)
    {
        _994 = _930;
    }
    float _1002 = _994;
    float _1004 = _946 * 2.0;
    float _1006 = fma(_988, -2.0, _970);
    float _1008 = _1002;
    if (!_944)
    {
        _996 = _930;
    }
    float _1010 = _996;
    float _1012 = floor(_980);
    float _1014 = _1010;
    if (_944)
    {
        _1008 = _946;
    }
    float _1016 = _1008;
    float _1018 = fma(_442, _142, _940);
    if (_944)
    {
        _1014 = _946;
    }
    float _1020 = _1014;
    float _1022 = fma(_442, _150, _948);
    if (!_944)
    {
        _998 = _946;
    }
    float _1024 = _998;
    float _1026 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[83].w, _972);
    float _1028 = _1024;
    if (_944)
    {
        _1028 = _936;
    }
    float _1030 = _1028;
    float _1032 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1034 = _984 > 0.0;
    float _1036 = floor(_1004);
    bool _1038 = _984 >= 0.0;
    bool _1040 = isnan(_984);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan(0.0);
    bool _1046 = _1042 || _1044;
    float _1048 = fma(_1032, -2.0, _976);
    float _1050 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[83].z, _978);
    int _1052 = _1046 ? 0 : 1;
    float _1054 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1056 = _1012 > 0.0;
    float _1058 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1060 = log2(_1058);
    bool _1062 = _1012 >= 0.0;
    bool _1064 = isnan(_1012);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan(0.0);
    bool _1070 = _1066 || _1068;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1074 = ~_1052;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    float _1080 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1082 = _1070 ? 0 : 1;
    float _1084 = fma(_442, _166, _950);
    int _1086 = _1078;
    if (!_1034)
    {
        int _1088 = ~_1052;
        int _1090 = _1088 + 1;
        _1086 = _1090;
    }
    int _1092 = _1086;
    float _1094 = -_986;
    float _1096 = fma(_1080, 2.0, _1094);
    bool _1098 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1100 = isnan(1.0);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1106 = _1102 || _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1110 = 1.0 + _1108;
    int _1112 = ~_1082;
    int _1114 = _1112 + 1;
    int _1116 = _1114 + 1;
    float _1118 = _1022 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1120 = _1116;
    if (!_1056)
    {
        int _1122 = ~_1082;
        int _1124 = _1122 + 1;
        _1120 = _1124;
    }
    int _1126 = _1120;
    float _1128 = 1.0 / _1110;
    bool _1130 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1132 = isnan(0.0);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1138 = _1134 || _1136;
    float _1140 = _1060 * _116;
    bool _1142 = _1036 > 0.0;
    float _1144 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1072);
    float _1146 = in.m_47.z;
    bool _1148 = _1036 >= 0.0;
    bool _1150 = isnan(_1036);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan(0.0);
    bool _1156 = _1152 || _1154;
    float _1158 = exp2(_1140);
    float _1160 = _1084 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1162 = in.m_49.x;
    float _1164 = in.m_49.y;
    float _1166 = in.m_49.z;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1170 = _1156 ? 0 : 1;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1174 = _1118 + _1172;
    float _1176 = in.m_47.y;
    float _1178 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1168);
    int _1180 = ~_1170;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    float _1186 = -_116;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[76].x, _992);
    int _1190 = _1184;
    if (!_1142)
    {
        int _1192 = ~_1170;
        int _1194 = _1192 + 1;
        _1190 = _1194;
    }
    int _1196 = _1190;
    float _1198 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1144);
    float _1200 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1178);
    float _1202 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1006);
    float _1204 = -_116;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1096);
    float _1208 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1048);
    float _1210 = -_1158;
    float _1212 = _1210 + 1.0;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1216 = _1160 + _1214;
    out.m_51.x = _968;
    float _1218 = _936 + _946;
    float _1220 = _1138 ? _1212 : 0.0;
    float _1222 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1050);
    float _1224 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1026);
    bool _1226 = !_954;
    int _1228 = _1226 ? 0 : 1;
    out.m_51.z = _1146;
    bool _1230 = _964 > 0.5;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1234 = _1054 + _1232;
    bool _1236 = _1230;
    if (_1106)
    {
        float _1238 = _1220 * _1128;
        _120 = _1238;
    }
    float _1240 = _120;
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1162);
    float _1244 = in.m_47.w;
    float _1246 = _1234 * _1234;
    float _1248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1164);
    float _1250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1166);
    float _1252 = fma(_1174, _1174, _1246);
    out.m_51.y = _1176;
    float _1254 = fma(_1216, _1216, _1252);
    float _1256 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1258 = in.m_53.x;
    float _1260 = in.m_53.y;
    float _1262 = in.m_53.z;
    float _1264 = _1218 + (-1.0);
    int _1266 = abs(_1228);
    float _1268 = rsqrt(_1254);
    float _1270 = _946 + _930;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1274 = _1272 != 0;
    out.m_33.x = _1256;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1278 = _1276 != 0;
    float _1280 = _1270 + (-1.0);
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1284 = _1282 != 0;
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1288 = _1286 != 0;
    float _1290 = _890 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1292 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    out.m_51.w = _1244;
    float _1294 = float(_1266);
    float _1296 = float(_1092);
    float _1298 = _1234 * _1268;
    float _1300 = float(_1126);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1306 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1308 = _1294 * _1296;
    float _1310 = _1174 * _1268;
    float _1312 = -_1298;
    float _1314 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1234);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1320 = _1308 * (-2.0);
    float _1322 = -_1310;
    float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1174);
    float _1326 = _1314 * _1314;
    float _1328 = _936 + (-0.5);
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1332 = _1330 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1334 = fma(_1320, _1258, _1258);
    float _1336 = fma(_1324, _1324, _1326);
    bool _1338 = !_958;
    int _1340 = _1338 ? 0 : 1;
    float _1342 = fma(_1292, _1320, _1292);
    bool _1344 = !_962;
    int _1346 = _1344 ? 0 : 1;
    float _1348 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1334);
    int _1350 = abs(_1340);
    float _1352 = 1.0 / _1304;
    int _1354 = abs(_1346);
    float _1356 = _1216 * _1268;
    float _1358 = in.m_55.y;
    float _1360 = float(_1350);
    float _1362 = -_1356;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1216);
    float _1366 = float(_1354);
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1370 = _1368 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1372 = float(_1196);
    float _1374 = _1360 * _1300;
    if (_1274)
    {
        bool _1376 = _936 > 0.5;
        _1000 = _1376;
    }
    bool _1378 = _1000;
    float _1380 = _936 + _930;
    float _1382 = 1.0 / _1370;
    float _1384 = _1366 * _1372;
    float _1386 = fma(_1364, _1364, _1336);
    float _1388 = fma(_1342, _1240, _1348);
    float _1390 = _1374 * (-2.0);
    float _1392 = _1384 * (-2.0);
    float _1394 = 1.0 / _1318;
    float _1396 = _1380 + (-1.0);
    float _1398 = fma(_1390, _1260, _1260);
    float _1400 = fma(_1306, _1390, _1306);
    float _1402 = _946 + (-0.5);
    float _1404 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1406 = fma(_1392, _1262, _1262);
    float _1408 = _930 + (-0.5);
    float _1410 = 1.0 / _1332;
    float _1412 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1398);
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1418 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1406);
    float _1420 = fma(_1400, _1240, _1412);
    float _1422 = -_1358;
    float _1424 = _1422 + 1.0;
    float _1426 = sqrt(_1386);
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1434 = _1432 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1436 = _1388 * 0.15915493667125701904296875;
    float _1438 = _1420 * 0.15915493667125701904296875;
    float _1440 = _1430 * _1352;
    float _1442 = _1230 ? _1424 : _1358;
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1446 = _928 + _1444;
    float _1448 = 1.0 / _1416;
    float _1450 = fma(_1404, _1392, _1404);
    float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1452;
    bool _1456 = _946 > 0.5;
    float _1458 = _1434 * _1394;
    float _1460 = fma(_1450, _1240, _1418);
    float _1462 = _1454 * _1410;
    float _1464 = _1442;
    float _1466 = _1358;
    float _1468 = _1424;
    if (_1278)
    {
        bool _1470 = _930 > 0.5;
        _1236 = _1470;
    }
    bool _1472 = _1236;
    float _1474 = _1460 * 0.15915493667125701904296875;
    float _1476 = _1436 * 6.283185482025146484375;
    float _1478 = sin(_1476);
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1486 = _1484 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1490 = _928 + _1488;
    float _1492 = _1482 * _1382;
    float _1494 = fma(_1440, _1446, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1496 = _632 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1498 = _1436 * 6.283185482025146484375;
    float _1500 = cos(_1498);
    float _1502 = _1486 * _1448;
    float _1504 = fma(_1458, _1490, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1506 = _1438 * 6.283185482025146484375;
    float _1508 = sin(_1506);
    float _1510 = _1438 * 6.283185482025146484375;
    float _1512 = cos(_1510);
    float _1514 = _1474 * 6.283185482025146484375;
    float _1516 = cos(_1514);
    float _1518 = _1268 * _1426;
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1522 = _928 + _1520;
    float _1524 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1526 = _1496 * _1518;
    float _1528 = fma(_1462, _1522, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1530 = _1290 * _1518;
    float _1532 = _1474 * 6.283185482025146484375;
    float _1534 = sin(_1532);
    float _1536 = _1526 * _1248;
    float _1538 = _1478 * _1508;
    float _1540 = _1500 * _1512;
    float _1542 = _1500 * _1508;
    float _1544 = _1478 * _1512;
    float _1546 = _1524 * _1518;
    float _1548 = _1530 * _1242;
    float _1550 = _1516 * _1536;
    float _1552 = _1508 * _1516;
    float _1554 = _1512 * _1516;
    float _1556 = _1500 * _1550;
    float _1558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1560 = fma(_1534, _1540, _1538);
    float _1562 = -_1542;
    float _1564 = fma(_1534, _1544, _1562);
    float _1566 = -_1544;
    float _1568 = fma(_1534, _1542, _1566);
    float _1570 = _1546 * _1250;
    float _1572 = -_1536;
    float _1574 = _1534 * _1572;
    float _1576 = fma(_1560, _1548, _1556);
    float _1578 = _1478 * _1550;
    float _1580 = fma(_1534, _1538, _1540);
    float _1582 = fma(_1554, _1548, _1574);
    float _1584 = fma(_1568, _1570, _1576);
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1588 = _928 + _1586;
    float _1590 = fma(_1564, _1548, _1578);
    float _1592 = fma(_1552, _1570, _1582);
    float _1594 = _1584 * _388;
    float _1596 = _1584 * _424;
    float _1598 = fma(_1502, _1588, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1600 = fma(_1580, _1570, _1590);
    float _1602 = fma(_1592, _354, _1594);
    float _1604 = fma(_1592, _368, _1596);
    bool _1606 = _928 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1608 = isnan(_928);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1614 = _1610 || _1612;
    float _1616 = float(_1614);
    float _1618 = in.m_55.x;
    float _1620 = fma(_1600, _428, _1602);
    bool _1622 = _928 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1624 = isnan(_928);
    bool _1626 = _1622 || _1624;
    bool _1628 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1630 = _1626 || _1628;
    float _1632 = float(_1630);
    float _1634 = fma(_1600, _436, _1604);
    float _1636 = -_1616;
    float _1638 = _1636 + 1.0;
    float _1640 = _1118 + _1620;
    bool _1642 = _928 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1644 = isnan(_928);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1650 = _1646 || _1648;
    float _1652 = float(_1650);
    float _1654 = -_1632;
    float _1656 = _1654 + 1.0;
    float _1658 = _1160 + _1634;
    float _1660 = _1632 * _1638;
    bool _1662 = _928 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1664 = isnan(_928);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1670 = _1666 || _1668;
    float _1672 = float(_1670);
    float _1674 = _1652 * _1656;
    float _1676 = -_1652;
    float _1678 = _1676 + 1.0;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1682 = _1658 + _1680;
    bool _1684 = _928 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1686 = isnan(_928);
    bool _1688 = _1684 || _1686;
    bool _1690 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1692 = _1688 || _1690;
    float _1694 = float(_1692);
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1698 = _928 + _1696;
    float _1700 = _1672 * _1678;
    float _1702 = -_1672;
    float _1704 = _1702 + 1.0;
    float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1708 = _1640 + _1706;
    float _1710 = _1682 * _1682;
    float _1712 = fma(_1492, _1698, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1714 = _1694 * _1704;
    bool _1716 = _928 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1718 = isnan(_928);
    bool _1720 = _1716 || _1718;
    bool _1722 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1724 = _1720 || _1722;
    float _1726 = float(_1724);
    float _1728 = fma(_1708, _1708, _1710);
    float _1730 = -_1694;
    float _1732 = _1730 + 1.0;
    float _1734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1736 = _1548;
    int _1738 = as_type<int>(_1618);
    float _1740 = _1640;
    float _1742 = _1658;
    if (!_1274)
    {
        _1736 = _1618;
    }
    float _1744 = _1736;
    float _1746 = _1584 * _416;
    float _1748 = _1726 * _1732;
    float _1750 = _1284 ? _1442 : _1358;
    float _1752 = -_1726;
    float _1754 = _1752 + 1.0;
    float _1756 = _1744;
    if (!_1274)
    {
        _1464 = _1744;
    }
    float _1758 = _1464;
    float _1760 = _1494 * _1748;
    float _1762 = sqrt(_1728);
    float _1764 = _1758;
    if (_1274)
    {
        _1756 = _1618;
    }
    float _1766 = _1756;
    float _1768 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1770 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1760);
    int _1772 = as_type<int>(_1558);
    if (_1288)
    {
        float _1774 = _1456 ? _1424 : _1358;
        _1466 = _1774;
    }
    float _1776 = _1466;
    float _1778 = fma(_1592, _364, _1746);
    if (_1274)
    {
        float _1780 = -_1766;
        float _1782 = _1780 + 1.0;
        _1738 = as_type<int>(_1782);
    }
    int _1784 = _1738;
    float _1786 = fma(_1504, _1714, _1770);
    float _1788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1278)
    {
        float _1790 = -_1766;
        float _1792 = _1790 + 1.0;
        _1772 = as_type<int>(_1792);
    }
    int _1794 = _1772;
    float _1796 = fma(_1768, _1776, -0.5);
    if (_1274)
    {
        float _1798 = _1378 ? as_type<float>(_1784) : _1766;
        _1764 = _1798;
    }
    float _1800 = _1764;
    float _1802 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1804 = fma(_1600, _432, _1778);
    float _1806 = fma(_1528, _1700, _1786);
    if (!_1278)
    {
        _1468 = _1766;
    }
    float _1808 = _1468;
    float _1810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1812 = _1762 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1814 = fma(_1802, _1800, -0.5);
    float _1816 = _1808;
    float _1818 = _1814;
    if (_1278)
    {
        float _1820 = _1472 ? as_type<float>(_1794) : _1766;
        _1816 = _1820;
    }
    float _1822 = _1816;
    float _1824 = _1054 + _1804;
    float _1826 = fma(_1598, _1674, _1806);
    float _1828 = fma(_1198, _1814, _1188);
    float _1830 = -_1202;
    float _1832 = fma(_1200, _1796, _1830);
    float _1834 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1836 = fma(_1712, _1660, _1826);
    float _1838 = fma(_1750, _1834, -0.5);
    if (!_1812)
    {
        _1818 = _1824;
    }
    float _1840 = _1818;
    float _1842 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1844 = -_1208;
    float _1846 = fma(_1224, _1838, _1844);
    float _1848 = fma(_1842, _1822, -0.5);
    bool _1850 = !_1812;
    float _1852 = _1840;
    if (!_1850)
    {
        float _1854 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1858 = _1762 + _1856;
        float _1860 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1862 = rsqrt(_1728);
        float _1864 = _1858 * _1854;
        float _1866 = _1864 * 0.15915493667125701904296875;
        float _1868 = _1866 * 6.283185482025146484375;
        float _1870 = cos(_1868);
        float _1872 = _1866 * 6.283185482025146484375;
        float _1874 = sin(_1872);
        float _1876 = _1870 + (-1.0);
        float _1878 = fma(_1874, _1860, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1880 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1882 = _1862 * _1878;
        float _1884 = fma(_1824, _1870, _1880);
        float _1886 = fma(_1708, _1882, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1888 = fma(_1682, _1882, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1852 = _1884;
        _1740 = _1886;
        _1742 = _1888;
    }
    float _1890 = _1852;
    float _1892 = _1740;
    float _1894 = _1742;
    float _1896 = -_1298;
    float _1898 = fma(_1896, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1890);
    float _1900 = fma(_1222, _1848, _1206);
    float _1902 = -_1310;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1892);
    float _1906 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[120].x, _1836);
    float _1908 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1910 = -_1356;
    float _1912 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1894);
    float _1914 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1916 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1918 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1908);
    float _1920 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1922 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1914);
    float _1924 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1916);
    float _1926 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1918);
    float _1928 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1920);
    float _1930 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1922);
    float _1932 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1924);
    float _1934 = _1926 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1936 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1928);
    float _1938 = _1930 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1940 = _1932 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1942 = _1934 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1944 = _1934 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1946 = _1934 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1948 = _1934 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1950 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1942);
    float _1952 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1944);
    float _1954 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1946);
    float _1956 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1958 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1950);
    float _1960 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1948);
    float _1962 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1952);
    float _1964 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1954);
    float _1966 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1958);
    float _1968 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1960);
    float _1970 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1962);
    float _1972 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1964);
    float _1974 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1968);
    float _1976 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1978 = _1832 + 0.5;
    float _1980 = _894 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1982 = _896 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1984 = _898 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1990 = _1972 + _1966;
    float _1992 = _1846 + 0.5;
    float _1994 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1996 = _1900 + 0.5;
    float _1998 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2000 = _1982 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2002 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2004 = _1986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2006 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2008 = _1828 + 0.5;
    float _2010 = _1906 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2012 = _1990 * 0.5;
    out.m_57.x = _1994;
    out.m_57.y = _2004;
    out.m_57.z = _2006;
    out.m_59.x = _2008;
    out.m_59.y = _1978;
    out.m_59.z = _1996;
    out.m_59.w = _1992;
    out.m_61.x = _1998;
    out.m_61.y = _2000;
    out.m_61.z = _2002;
    out.m_61.w = _2010;
    out.gl_Position.x = _1970;
    out.gl_Position.y = _1974;
    out.gl_Position.z = _1972;
    out.gl_Position.w = _1966;
    out.m_63.z = _2012;
    out.m_63.w = _1966;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _920 = false;
    bool _578 = false;
    bool _464 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_30.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_86)
    {
        out.m_33.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _90 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2069 = as_type<float>(_98);
        out.gl_Position.z = _2069;
    }
    if (!_86)
    {
        return out;
    }
    float _102 = in.m_35.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _118 = 0.0;
    float _120 = _116;
    if (_112)
    {
        float _122 = float(_82);
        _118 = _122;
    }
    float _124 = _118;
    bool _126 = _116 >= _124;
    bool _128 = !_112;
    bool _130 = _126 || _128;
    if (_130)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _92;
    if (_130)
    {
        out.m_33.x = 0.0;
    }
    if (_130)
    {
        float _134 = _132 * 5.0;
        _100 = as_type<int>(_134);
    }
    int _136 = _100;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2138 = as_type<float>(_136);
        out.gl_Position.z = _2138;
    }
    if (_130)
    {
        return out;
    }
    float _138 = in.m_37.x;
    float _140 = in.m_37.y;
    float _142 = in.m_37.z;
    float _144 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _146 = in.m_39.x;
    float _148 = in.m_39.y;
    float _150 = in.m_39.z;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_41.x;
    float _164 = in.m_41.y;
    float _166 = in.m_41.z;
    float _168 = 0.0;
    float _170 = _144;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_160)
    {
        float _174 = _144 * _144;
        float _176 = _174 * 0.5;
        _168 = _176;
    }
    float _178 = _168;
    float _180 = _178;
    if (!_160)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    float _186 = _138 * _138;
    float _188 = _140 * _140;
    float _190 = _142 * _142;
    float _192 = fma(_146, _146, _186);
    float _194 = fma(_148, _148, _188);
    float _196 = fma(_150, _150, _190);
    float _198 = fma(_162, _162, _192);
    float _200 = fma(_164, _164, _194);
    float _202 = fma(_166, _166, _196);
    float _204 = sqrt(_198);
    float _206 = sqrt(_200);
    bool _208 = _204 > 0.0;
    float _210 = sqrt(_202);
    float _212 = in.m_35.x;
    float _214 = in.m_35.y;
    float _216 = in.m_35.z;
    bool _218 = _206 > 0.0;
    float _220 = 0.0;
    float _222 = _184;
    float _224 = _206;
    float _226 = _198;
    float _228 = _200;
    float _230 = _202;
    if (_208)
    {
        float _232 = rsqrt(_198);
        _220 = _232;
    }
    float _234 = _220;
    bool _236 = _210 > 0.0;
    float _238 = 0.0;
    float _240 = _210;
    if (_218)
    {
        float _242 = rsqrt(_200);
        _238 = _242;
    }
    float _244 = _238;
    bool _246 = !_160;
    float _248 = 0.0;
    float _250 = _234;
    if (!_246)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = _144 * _254;
        float _264 = 1.0 / _258;
        float _266 = _260 * 0.693147182464599609375;
        float _268 = exp2(_262);
        float _270 = 1.0 / _266;
        float _272 = _268 + (-1.0);
        float _274 = -_272;
        float _276 = fma(_274, _270, _144);
        float _278 = _276 * _264;
        float _280 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _248 = _264;
        _222 = _280;
        _224 = _258;
        _226 = _266;
        _240 = _278;
        _228 = _268;
    }
    float _282 = _248;
    float _284 = _222;
    float _286 = _224;
    float _288 = _226;
    float _290 = _240;
    float _292 = _228;
    bool _294 = !_160;
    float _296 = _282;
    float _298 = _290;
    float _300 = _286;
    float _302 = _292;
    float _304 = _288;
    float _306 = _284;
    if (!_294)
    {
        float _308 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _310 = log2(_308);
        float _312 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _314 = _312 + 1.0;
        float _316 = 1.0 / _314;
        float _318 = _144 * _310;
        float _320 = exp2(_318);
        float _322 = -_320;
        float _324 = _322 + 1.0;
        float _326 = _324 * _316;
        _170 = _326;
        _172 = _314;
        _296 = _320;
    }
    float _328 = _170;
    float _330 = _172;
    float _332 = _296;
    float _334 = in.m_43.w;
    float _336 = _330;
    float _338 = _332;
    if (!_208)
    {
        _336 = 0.0;
        _338 = 0.0;
    }
    float _340 = _336;
    float _342 = _338;
    float _344 = _340;
    float _346 = _342;
    if (!_208)
    {
        _298 = 0.0;
    }
    float _348 = _298;
    float _350 = _348;
    if (_208)
    {
        float _352 = _234 * _146;
        _344 = _352;
    }
    float _354 = _344;
    float _356 = in.m_30.x;
    float _358 = in.m_30.y;
    float _360 = in.m_30.z;
    if (_208)
    {
        float _362 = _234 * _138;
        _346 = _362;
    }
    float _364 = _346;
    if (_208)
    {
        float _366 = _234 * _162;
        _350 = _366;
    }
    float _368 = _350;
    float _370 = 0.0;
    if (_236)
    {
        float _372 = rsqrt(_202);
        _370 = _372;
    }
    float _374 = _370;
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _378 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _380 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (!_218)
    {
        _300 = 0.0;
    }
    float _382 = _300;
    float _384 = _382;
    if (_218)
    {
        float _386 = _244 * _148;
        _384 = _386;
    }
    float _388 = _384;
    float _390 = fma(_328, _212, _378);
    float _392 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _394 = fma(_328, _214, _380);
    if (!_236)
    {
        _230 = 0.0;
        _250 = 0.0;
    }
    float _396 = _230;
    float _398 = _250;
    float _400 = _398;
    float _402 = _396;
    if (!_218)
    {
        _302 = 0.0;
    }
    float _404 = _302;
    float _406 = fma(_328, _216, _392);
    float _408 = _404;
    if (!_218)
    {
        _304 = 0.0;
    }
    float _410 = _304;
    float _412 = _410;
    if (_218)
    {
        float _414 = _244 * _140;
        _408 = _414;
    }
    float _416 = _408;
    if (!_236)
    {
        _306 = 0.0;
    }
    float _418 = _306;
    float _420 = _418;
    if (_218)
    {
        float _422 = _244 * _164;
        _412 = _422;
    }
    float _424 = _412;
    if (_236)
    {
        float _426 = _374 * _150;
        _420 = _426;
    }
    float _428 = _420;
    if (_236)
    {
        float _430 = _374 * _142;
        _400 = _430;
    }
    float _432 = _400;
    if (_236)
    {
        float _434 = _374 * _166;
        _402 = _434;
    }
    float _436 = _402;
    float _438 = fma(_390, _334, _356);
    float _440 = fma(_394, _334, _358);
    float _442 = fma(_406, _334, _360);
    bool _444 = !_376;
    float _462;
    if (!_444)
    {
        float _446 = in.m_45.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_82);
        float _468 = 1.0 / _466;
        float _470 = _116 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _476 = _472 + _474;
    bool _478 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _480 = isnan(_472);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _490;
    bool _494 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _496 = isnan(_472);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -_488;
    float _508 = _506 + 1.0;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _510;
    float _514 = 1.0 / _492;
    bool _516 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _518 = _504 * _508;
    float _520 = -_504;
    float _522 = _520 + 1.0;
    float _524 = _476 * _514;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _526;
    float _530 = fma(_512, _524, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _532;
    float _536 = fma(_528, _524, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _538 = fma(_534, _524, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _540 = _530 * _518;
    float _542 = _538 * _518;
    float _544 = _536 * _518;
    float _546 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].x, _540);
    float _548 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].y, _542);
    float _550 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].z, _544);
    float _552 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[144].x, _546);
    float _554 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[144].y, _548);
    float _556 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[144].z, _550);
    bool _558 = !_516;
    float _576;
    if (!_558)
    {
        float _560 = in.m_45.x;
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _564 = _560 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _566 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _568 = _566 * _562;
        float _570 = floor(_568);
        float _572 = -_570;
        float _574 = _568 + _572;
        _576 = _574;
        _578 = true;
    }
    else
    {
        float _580 = float(_82);
        float _582 = 1.0 / _580;
        float _584 = _116 * _582;
        _576 = _584;
    }
    _578 = false;
    float _586 = _576;
    float _588 = in.m_43.x;
    float _590 = in.m_43.y;
    float _592 = in.m_43.z;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _596 = _586 + _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _606;
    float _610 = 1.0 / _600;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _620 = 1.0 / _608;
    bool _622 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _624 = _556 * _592;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _628 = _586 + _626;
    float _630 = 1.0 / _604;
    float _632 = _554 * _590;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _636 = _586 + _634;
    float _638 = _596 * _610;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _642 = _586 + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _644;
    bool _648 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _650 = isnan(_586);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _664 = 1.0 / _614;
    bool _666 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _668 = isnan(_586);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = _628 * _620;
    bool _680 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _682 = isnan(_586);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = fma(_646, _638, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _694 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _696 = isnan(_586);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -_676;
    float _708 = _706 + 1.0;
    float _710 = 1.0 / _618;
    float _712 = _636 * _630;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _714;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _720 = _586 + _718;
    float _722 = -_690;
    float _724 = _722 + 1.0;
    float _726 = _658 * _708;
    float _728 = fma(_716, _638, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _730 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _732 = isnan(_586);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    float _742 = _642 * _664;
    bool _744 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _746 = isnan(_586);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -_658;
    float _758 = _756 + 1.0;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _764 = _754 * _724;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _770 = _720 * _710;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _772;
    float _776 = -_704;
    float _778 = _776 + 1.0;
    float _780 = _690 * _758;
    float _782 = fma(_774, _638, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _784 = -_754;
    float _786 = _784 + 1.0;
    float _788 = _740 * _778;
    float _790 = fma(_768, _712, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _792 = _704 * _786;
    float _794 = _728 * _788;
    float _796 = fma(_662, _712, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _798 = _782 * _788;
    float _800 = _692 * _788;
    float _802 = -_740;
    float _804 = _802 + 1.0;
    float _806 = fma(_762, _712, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _808;
    float _812 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[107].x, _798);
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[107].y, _800);
    float _816 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[107].z, _794);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _834;
    float _838 = fma(_810, _742, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _840 = fma(_790, _792, _812);
    float _842 = fma(_824, _742, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _844 = fma(_820, _770, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _846 = fma(_828, _770, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _848 = fma(_832, _770, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _850 = fma(_796, _792, _814);
    float _852 = fma(_806, _792, _816);
    float _854 = fma(_836, _742, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _856 = fma(_838, _764, _840);
    float _858 = fma(_842, _764, _850);
    float _860 = fma(_854, _764, _852);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _862;
    float _866 = fma(_844, _780, _856);
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _868;
    float _872 = fma(_846, _780, _858);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _874;
    float _878 = fma(_864, _678, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _880 = fma(_870, _678, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _882 = fma(_848, _780, _860);
    float _884 = fma(_876, _678, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _886 = fma(_878, _726, _866);
    float _888 = fma(_880, _726, _872);
    float _890 = _552 * _588;
    float _892 = fma(_884, _726, _882);
    float _894 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[112].x, _886);
    float _896 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[112].y, _888);
    float _898 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[112].z, _892);
    bool _900 = !_622;
    float _918;
    if (!_900)
    {
        float _902 = in.m_45.x;
        float _904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _906 = _902 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _910 = _908 * _904;
        float _912 = floor(_910);
        float _914 = -_912;
        float _916 = _910 + _914;
        _918 = _916;
        _920 = true;
    }
    else
    {
        float _922 = float(_82);
        float _924 = 1.0 / _922;
        float _926 = _116 * _924;
        _918 = _926;
    }
    _920 = false;
    float _928 = _918;
    float _930 = in.m_45.z;
    float _932 = _440 * _148;
    float _934 = _440 * _140;
    float _936 = in.m_45.x;
    float _938 = _440 * _164;
    float _940 = fma(_438, _138, _934);
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _944 = _942 != 0;
    float _946 = in.m_45.y;
    float _948 = fma(_438, _146, _932);
    float _950 = fma(_438, _162, _938);
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _954 = _952 != 0;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _958 = _956 != 0;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _962 = _960 != 0;
    float _964 = in.m_45.w;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _968 = in.m_47.x;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _974 = _930 * 2.0;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _980 = _936 * 2.0;
    float _982 = _936 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _984 = floor(_974);
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _988 = _946 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _990 = -_966;
    float _992 = fma(_982, 2.0, _990);
    float _994 = _982;
    float _996 = _988;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    bool _1000 = _958;
    if (!_944)
    {
        _994 = _930;
    }
    float _1002 = _994;
    float _1004 = _946 * 2.0;
    float _1006 = fma(_988, -2.0, _970);
    float _1008 = _1002;
    if (!_944)
    {
        _996 = _930;
    }
    float _1010 = _996;
    float _1012 = floor(_980);
    float _1014 = _1010;
    if (_944)
    {
        _1008 = _946;
    }
    float _1016 = _1008;
    float _1018 = fma(_442, _142, _940);
    if (_944)
    {
        _1014 = _946;
    }
    float _1020 = _1014;
    float _1022 = fma(_442, _150, _948);
    if (!_944)
    {
        _998 = _946;
    }
    float _1024 = _998;
    float _1026 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[83].w, _972);
    float _1028 = _1024;
    if (_944)
    {
        _1028 = _936;
    }
    float _1030 = _1028;
    float _1032 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1034 = _984 > 0.0;
    float _1036 = floor(_1004);
    bool _1038 = _984 >= 0.0;
    bool _1040 = isnan(_984);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan(0.0);
    bool _1046 = _1042 || _1044;
    float _1048 = fma(_1032, -2.0, _976);
    float _1050 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[83].z, _978);
    int _1052 = _1046 ? 0 : 1;
    float _1054 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1056 = _1012 > 0.0;
    float _1058 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1060 = log2(_1058);
    bool _1062 = _1012 >= 0.0;
    bool _1064 = isnan(_1012);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan(0.0);
    bool _1070 = _1066 || _1068;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1074 = ~_1052;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    float _1080 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1082 = _1070 ? 0 : 1;
    float _1084 = fma(_442, _166, _950);
    int _1086 = _1078;
    if (!_1034)
    {
        int _1088 = ~_1052;
        int _1090 = _1088 + 1;
        _1086 = _1090;
    }
    int _1092 = _1086;
    float _1094 = -_986;
    float _1096 = fma(_1080, 2.0, _1094);
    bool _1098 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1100 = isnan(1.0);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1106 = _1102 || _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1110 = 1.0 + _1108;
    int _1112 = ~_1082;
    int _1114 = _1112 + 1;
    int _1116 = _1114 + 1;
    float _1118 = _1022 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1120 = _1116;
    if (!_1056)
    {
        int _1122 = ~_1082;
        int _1124 = _1122 + 1;
        _1120 = _1124;
    }
    int _1126 = _1120;
    float _1128 = 1.0 / _1110;
    bool _1130 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1132 = isnan(0.0);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1138 = _1134 || _1136;
    float _1140 = _1060 * _116;
    bool _1142 = _1036 > 0.0;
    float _1144 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1072);
    float _1146 = in.m_47.z;
    bool _1148 = _1036 >= 0.0;
    bool _1150 = isnan(_1036);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan(0.0);
    bool _1156 = _1152 || _1154;
    float _1158 = exp2(_1140);
    float _1160 = _1084 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1162 = in.m_49.x;
    float _1164 = in.m_49.y;
    float _1166 = in.m_49.z;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1170 = _1156 ? 0 : 1;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1174 = _1118 + _1172;
    float _1176 = in.m_47.y;
    float _1178 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1168);
    int _1180 = ~_1170;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    float _1186 = -_116;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[76].x, _992);
    int _1190 = _1184;
    if (!_1142)
    {
        int _1192 = ~_1170;
        int _1194 = _1192 + 1;
        _1190 = _1194;
    }
    int _1196 = _1190;
    float _1198 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1144);
    float _1200 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1178);
    float _1202 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1006);
    float _1204 = -_116;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1096);
    float _1208 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1048);
    float _1210 = -_1158;
    float _1212 = _1210 + 1.0;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1216 = _1160 + _1214;
    out.m_51.x = _968;
    float _1218 = _936 + _946;
    float _1220 = _1138 ? _1212 : 0.0;
    float _1222 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1050);
    float _1224 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1026);
    bool _1226 = !_954;
    int _1228 = _1226 ? 0 : 1;
    out.m_51.z = _1146;
    bool _1230 = _964 > 0.5;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1234 = _1054 + _1232;
    bool _1236 = _1230;
    if (_1106)
    {
        float _1238 = _1220 * _1128;
        _120 = _1238;
    }
    float _1240 = _120;
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1162);
    float _1244 = in.m_47.w;
    float _1246 = _1234 * _1234;
    float _1248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1164);
    float _1250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1166);
    float _1252 = fma(_1174, _1174, _1246);
    out.m_51.y = _1176;
    float _1254 = fma(_1216, _1216, _1252);
    float _1256 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1258 = in.m_53.x;
    float _1260 = in.m_53.y;
    float _1262 = in.m_53.z;
    float _1264 = _1218 + (-1.0);
    int _1266 = abs(_1228);
    float _1268 = rsqrt(_1254);
    float _1270 = _946 + _930;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1274 = _1272 != 0;
    out.m_33.x = _1256;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1278 = _1276 != 0;
    float _1280 = _1270 + (-1.0);
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1284 = _1282 != 0;
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1288 = _1286 != 0;
    float _1290 = _890 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1292 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    out.m_51.w = _1244;
    float _1294 = float(_1266);
    float _1296 = float(_1092);
    float _1298 = _1234 * _1268;
    float _1300 = float(_1126);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1306 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1308 = _1294 * _1296;
    float _1310 = _1174 * _1268;
    float _1312 = -_1298;
    float _1314 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1234);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1320 = _1308 * (-2.0);
    float _1322 = -_1310;
    float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1174);
    float _1326 = _1314 * _1314;
    float _1328 = _936 + (-0.5);
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1332 = _1330 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1334 = fma(_1320, _1258, _1258);
    float _1336 = fma(_1324, _1324, _1326);
    bool _1338 = !_958;
    int _1340 = _1338 ? 0 : 1;
    float _1342 = fma(_1292, _1320, _1292);
    bool _1344 = !_962;
    int _1346 = _1344 ? 0 : 1;
    float _1348 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1334);
    int _1350 = abs(_1340);
    float _1352 = 1.0 / _1304;
    int _1354 = abs(_1346);
    float _1356 = _1216 * _1268;
    float _1358 = in.m_55.y;
    float _1360 = float(_1350);
    float _1362 = -_1356;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1216);
    float _1366 = float(_1354);
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1370 = _1368 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1372 = float(_1196);
    float _1374 = _1360 * _1300;
    if (_1274)
    {
        bool _1376 = _936 > 0.5;
        _1000 = _1376;
    }
    bool _1378 = _1000;
    float _1380 = _936 + _930;
    float _1382 = 1.0 / _1370;
    float _1384 = _1366 * _1372;
    float _1386 = fma(_1364, _1364, _1336);
    float _1388 = fma(_1342, _1240, _1348);
    float _1390 = _1374 * (-2.0);
    float _1392 = _1384 * (-2.0);
    float _1394 = 1.0 / _1318;
    float _1396 = _1380 + (-1.0);
    float _1398 = fma(_1390, _1260, _1260);
    float _1400 = fma(_1306, _1390, _1306);
    float _1402 = _946 + (-0.5);
    float _1404 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1406 = fma(_1392, _1262, _1262);
    float _1408 = _930 + (-0.5);
    float _1410 = 1.0 / _1332;
    float _1412 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1398);
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1418 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1406);
    float _1420 = fma(_1400, _1240, _1412);
    float _1422 = -_1358;
    float _1424 = _1422 + 1.0;
    float _1426 = sqrt(_1386);
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1434 = _1432 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1436 = _1388 * 0.15915493667125701904296875;
    float _1438 = _1420 * 0.15915493667125701904296875;
    float _1440 = _1430 * _1352;
    float _1442 = _1230 ? _1424 : _1358;
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1446 = _928 + _1444;
    float _1448 = 1.0 / _1416;
    float _1450 = fma(_1404, _1392, _1404);
    float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1452;
    bool _1456 = _946 > 0.5;
    float _1458 = _1434 * _1394;
    float _1460 = fma(_1450, _1240, _1418);
    float _1462 = _1454 * _1410;
    float _1464 = _1442;
    float _1466 = _1358;
    float _1468 = _1424;
    if (_1278)
    {
        bool _1470 = _930 > 0.5;
        _1236 = _1470;
    }
    bool _1472 = _1236;
    float _1474 = _1460 * 0.15915493667125701904296875;
    float _1476 = _1436 * 6.283185482025146484375;
    float _1478 = sin(_1476);
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1486 = _1484 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1490 = _928 + _1488;
    float _1492 = _1482 * _1382;
    float _1494 = fma(_1440, _1446, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1496 = _632 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1498 = _1436 * 6.283185482025146484375;
    float _1500 = cos(_1498);
    float _1502 = _1486 * _1448;
    float _1504 = fma(_1458, _1490, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1506 = _1438 * 6.283185482025146484375;
    float _1508 = sin(_1506);
    float _1510 = _1438 * 6.283185482025146484375;
    float _1512 = cos(_1510);
    float _1514 = _1474 * 6.283185482025146484375;
    float _1516 = cos(_1514);
    float _1518 = _1268 * _1426;
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1522 = _928 + _1520;
    float _1524 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1526 = _1496 * _1518;
    float _1528 = fma(_1462, _1522, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1530 = _1290 * _1518;
    float _1532 = _1474 * 6.283185482025146484375;
    float _1534 = sin(_1532);
    float _1536 = _1526 * _1248;
    float _1538 = _1478 * _1508;
    float _1540 = _1500 * _1512;
    float _1542 = _1500 * _1508;
    float _1544 = _1478 * _1512;
    float _1546 = _1524 * _1518;
    float _1548 = _1530 * _1242;
    float _1550 = _1516 * _1536;
    float _1552 = _1508 * _1516;
    float _1554 = _1512 * _1516;
    float _1556 = _1500 * _1550;
    float _1558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1560 = fma(_1534, _1540, _1538);
    float _1562 = -_1542;
    float _1564 = fma(_1534, _1544, _1562);
    float _1566 = -_1544;
    float _1568 = fma(_1534, _1542, _1566);
    float _1570 = _1546 * _1250;
    float _1572 = -_1536;
    float _1574 = _1534 * _1572;
    float _1576 = fma(_1560, _1548, _1556);
    float _1578 = _1478 * _1550;
    float _1580 = fma(_1534, _1538, _1540);
    float _1582 = fma(_1554, _1548, _1574);
    float _1584 = fma(_1568, _1570, _1576);
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1588 = _928 + _1586;
    float _1590 = fma(_1564, _1548, _1578);
    float _1592 = fma(_1552, _1570, _1582);
    float _1594 = _1584 * _388;
    float _1596 = _1584 * _424;
    float _1598 = fma(_1502, _1588, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1600 = fma(_1580, _1570, _1590);
    float _1602 = fma(_1592, _354, _1594);
    float _1604 = fma(_1592, _368, _1596);
    bool _1606 = _928 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1608 = isnan(_928);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1614 = _1610 || _1612;
    float _1616 = float(_1614);
    float _1618 = in.m_55.x;
    float _1620 = fma(_1600, _428, _1602);
    bool _1622 = _928 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1624 = isnan(_928);
    bool _1626 = _1622 || _1624;
    bool _1628 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1630 = _1626 || _1628;
    float _1632 = float(_1630);
    float _1634 = fma(_1600, _436, _1604);
    float _1636 = -_1616;
    float _1638 = _1636 + 1.0;
    float _1640 = _1118 + _1620;
    bool _1642 = _928 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1644 = isnan(_928);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1650 = _1646 || _1648;
    float _1652 = float(_1650);
    float _1654 = -_1632;
    float _1656 = _1654 + 1.0;
    float _1658 = _1160 + _1634;
    float _1660 = _1632 * _1638;
    bool _1662 = _928 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1664 = isnan(_928);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1670 = _1666 || _1668;
    float _1672 = float(_1670);
    float _1674 = _1652 * _1656;
    float _1676 = -_1652;
    float _1678 = _1676 + 1.0;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1682 = _1658 + _1680;
    bool _1684 = _928 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1686 = isnan(_928);
    bool _1688 = _1684 || _1686;
    bool _1690 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1692 = _1688 || _1690;
    float _1694 = float(_1692);
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1698 = _928 + _1696;
    float _1700 = _1672 * _1678;
    float _1702 = -_1672;
    float _1704 = _1702 + 1.0;
    float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1708 = _1640 + _1706;
    float _1710 = _1682 * _1682;
    float _1712 = fma(_1492, _1698, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1714 = _1694 * _1704;
    bool _1716 = _928 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1718 = isnan(_928);
    bool _1720 = _1716 || _1718;
    bool _1722 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1724 = _1720 || _1722;
    float _1726 = float(_1724);
    float _1728 = fma(_1708, _1708, _1710);
    float _1730 = -_1694;
    float _1732 = _1730 + 1.0;
    float _1734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1736 = _1548;
    int _1738 = as_type<int>(_1618);
    float _1740 = _1640;
    float _1742 = _1658;
    if (!_1274)
    {
        _1736 = _1618;
    }
    float _1744 = _1736;
    float _1746 = _1584 * _416;
    float _1748 = _1726 * _1732;
    float _1750 = _1284 ? _1442 : _1358;
    float _1752 = -_1726;
    float _1754 = _1752 + 1.0;
    float _1756 = _1744;
    if (!_1274)
    {
        _1464 = _1744;
    }
    float _1758 = _1464;
    float _1760 = _1494 * _1748;
    float _1762 = sqrt(_1728);
    float _1764 = _1758;
    if (_1274)
    {
        _1756 = _1618;
    }
    float _1766 = _1756;
    float _1768 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1770 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1760);
    int _1772 = as_type<int>(_1558);
    if (_1288)
    {
        float _1774 = _1456 ? _1424 : _1358;
        _1466 = _1774;
    }
    float _1776 = _1466;
    float _1778 = fma(_1592, _364, _1746);
    if (_1274)
    {
        float _1780 = -_1766;
        float _1782 = _1780 + 1.0;
        _1738 = as_type<int>(_1782);
    }
    int _1784 = _1738;
    float _1786 = fma(_1504, _1714, _1770);
    float _1788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1278)
    {
        float _1790 = -_1766;
        float _1792 = _1790 + 1.0;
        _1772 = as_type<int>(_1792);
    }
    int _1794 = _1772;
    float _1796 = fma(_1768, _1776, -0.5);
    if (_1274)
    {
        float _1798 = _1378 ? as_type<float>(_1784) : _1766;
        _1764 = _1798;
    }
    float _1800 = _1764;
    float _1802 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1804 = fma(_1600, _432, _1778);
    float _1806 = fma(_1528, _1700, _1786);
    if (!_1278)
    {
        _1468 = _1766;
    }
    float _1808 = _1468;
    float _1810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1812 = _1762 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1814 = fma(_1802, _1800, -0.5);
    float _1816 = _1808;
    float _1818 = _1814;
    if (_1278)
    {
        float _1820 = _1472 ? as_type<float>(_1794) : _1766;
        _1816 = _1820;
    }
    float _1822 = _1816;
    float _1824 = _1054 + _1804;
    float _1826 = fma(_1598, _1674, _1806);
    float _1828 = fma(_1198, _1814, _1188);
    float _1830 = -_1202;
    float _1832 = fma(_1200, _1796, _1830);
    float _1834 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1836 = fma(_1712, _1660, _1826);
    float _1838 = fma(_1750, _1834, -0.5);
    if (!_1812)
    {
        _1818 = _1824;
    }
    float _1840 = _1818;
    float _1842 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1844 = -_1208;
    float _1846 = fma(_1224, _1838, _1844);
    float _1848 = fma(_1842, _1822, -0.5);
    bool _1850 = !_1812;
    float _1852 = _1840;
    if (!_1850)
    {
        float _1854 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1858 = _1762 + _1856;
        float _1860 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1862 = rsqrt(_1728);
        float _1864 = _1858 * _1854;
        float _1866 = _1864 * 0.15915493667125701904296875;
        float _1868 = _1866 * 6.283185482025146484375;
        float _1870 = cos(_1868);
        float _1872 = _1866 * 6.283185482025146484375;
        float _1874 = sin(_1872);
        float _1876 = _1870 + (-1.0);
        float _1878 = fma(_1874, _1860, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1880 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1882 = _1862 * _1878;
        float _1884 = fma(_1824, _1870, _1880);
        float _1886 = fma(_1708, _1882, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1888 = fma(_1682, _1882, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1852 = _1884;
        _1740 = _1886;
        _1742 = _1888;
    }
    float _1890 = _1852;
    float _1892 = _1740;
    float _1894 = _1742;
    float _1896 = -_1298;
    float _1898 = fma(_1896, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1890);
    float _1900 = fma(_1222, _1848, _1206);
    float _1902 = -_1310;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1892);
    float _1906 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[120].x, _1836);
    float _1908 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1910 = -_1356;
    float _1912 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1894);
    float _1914 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1916 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1918 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1908);
    float _1920 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1922 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1914);
    float _1924 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1916);
    float _1926 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1918);
    float _1928 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1920);
    float _1930 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1922);
    float _1932 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1924);
    float _1934 = _1926 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1936 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1928);
    float _1938 = _1930 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1940 = _1932 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1942 = _1934 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1944 = _1934 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1946 = _1934 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1948 = _1934 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1950 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1942);
    float _1952 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1944);
    float _1954 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1946);
    float _1956 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1958 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1950);
    float _1960 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1948);
    float _1962 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1952);
    float _1964 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1954);
    float _1966 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1958);
    float _1968 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1960);
    float _1970 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1962);
    float _1972 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1964);
    float _1974 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1968);
    float _1976 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1978 = _1832 + 0.5;
    float _1980 = _894 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1982 = _896 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1984 = _898 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1990 = _1972 + _1966;
    float _1992 = _1846 + 0.5;
    float _1994 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1996 = _1900 + 0.5;
    float _1998 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2000 = _1982 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2002 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2004 = _1986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2006 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2008 = _1828 + 0.5;
    float _2010 = _1906 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2012 = _1990 * 0.5;
    out.m_57.x = _1994;
    out.m_57.y = _2004;
    out.m_57.z = _2006;
    out.m_59.x = _2008;
    out.m_59.y = _1978;
    out.m_59.z = _1996;
    out.m_59.w = _1992;
    out.m_61.x = _1998;
    out.m_61.y = _2000;
    out.m_61.z = _2002;
    out.m_61.w = _2010;
    out.gl_Position.x = _1970;
    out.gl_Position.y = _1974;
    out.gl_Position.z = _1972;
    out.gl_Position.w = _1966;
    out.m_63.z = _2012;
    out.m_63.w = _1966;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _920 = false;
    bool _578 = false;
    bool _464 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_30.w;
    float _79 = trunc(_77);
    int _82 = int(_79);
    bool _86 = _82 >= 1;
    float _88 = 0.0;
    if (!_86)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_86)
    {
        out.m_33.x = 0.0;
    }
    int _94 = 0;
    if (!_86)
    {
        float _96 = _90 * 5.0;
        _94 = as_type<int>(_96);
    }
    int _98 = _94;
    int _100 = _98;
    if (!_86)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2069 = as_type<float>(_98);
        out.gl_Position.z = _2069;
    }
    if (!_86)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _102 = in.m_35.w;
    bool _104 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = -_102;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _118 = 0.0;
    float _120 = _116;
    if (_112)
    {
        float _122 = float(_82);
        _118 = _122;
    }
    float _124 = _118;
    bool _126 = _116 >= _124;
    bool _128 = !_112;
    bool _130 = _126 || _128;
    if (_130)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _92;
    if (_130)
    {
        out.m_33.x = 0.0;
    }
    if (_130)
    {
        float _134 = _132 * 5.0;
        _100 = as_type<int>(_134);
    }
    int _136 = _100;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2138 = as_type<float>(_136);
        out.gl_Position.z = _2138;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_37.x;
    float _140 = in.m_37.y;
    float _142 = in.m_37.z;
    float _144 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _146 = in.m_39.x;
    float _148 = in.m_39.y;
    float _150 = in.m_39.z;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_41.x;
    float _164 = in.m_41.y;
    float _166 = in.m_41.z;
    float _168 = 0.0;
    float _170 = _144;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_160)
    {
        float _174 = _144 * _144;
        float _176 = _174 * 0.5;
        _168 = _176;
    }
    float _178 = _168;
    float _180 = _178;
    if (!_160)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    float _186 = _138 * _138;
    float _188 = _140 * _140;
    float _190 = _142 * _142;
    float _192 = fma(_146, _146, _186);
    float _194 = fma(_148, _148, _188);
    float _196 = fma(_150, _150, _190);
    float _198 = fma(_162, _162, _192);
    float _200 = fma(_164, _164, _194);
    float _202 = fma(_166, _166, _196);
    float _204 = sqrt(_198);
    float _206 = sqrt(_200);
    bool _208 = _204 > 0.0;
    float _210 = sqrt(_202);
    float _212 = in.m_35.x;
    float _214 = in.m_35.y;
    float _216 = in.m_35.z;
    bool _218 = _206 > 0.0;
    float _220 = 0.0;
    float _222 = _184;
    float _224 = _206;
    float _226 = _198;
    float _228 = _200;
    float _230 = _202;
    if (_208)
    {
        float _232 = rsqrt(_198);
        _220 = _232;
    }
    float _234 = _220;
    bool _236 = _210 > 0.0;
    float _238 = 0.0;
    float _240 = _210;
    if (_218)
    {
        float _242 = rsqrt(_200);
        _238 = _242;
    }
    float _244 = _238;
    bool _246 = !_160;
    float _248 = 0.0;
    float _250 = _234;
    if (!_246)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = _144 * _254;
        float _264 = 1.0 / _258;
        float _266 = _260 * 0.693147182464599609375;
        float _268 = exp2(_262);
        float _270 = 1.0 / _266;
        float _272 = _268 + (-1.0);
        float _274 = -_272;
        float _276 = fma(_274, _270, _144);
        float _278 = _276 * _264;
        float _280 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _248 = _264;
        _222 = _280;
        _224 = _258;
        _226 = _266;
        _240 = _278;
        _228 = _268;
    }
    float _282 = _248;
    float _284 = _222;
    float _286 = _224;
    float _288 = _226;
    float _290 = _240;
    float _292 = _228;
    bool _294 = !_160;
    float _296 = _282;
    float _298 = _290;
    float _300 = _286;
    float _302 = _292;
    float _304 = _288;
    float _306 = _284;
    if (!_294)
    {
        float _308 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _310 = log2(_308);
        float _312 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _314 = _312 + 1.0;
        float _316 = 1.0 / _314;
        float _318 = _144 * _310;
        float _320 = exp2(_318);
        float _322 = -_320;
        float _324 = _322 + 1.0;
        float _326 = _324 * _316;
        _170 = _326;
        _172 = _314;
        _296 = _320;
    }
    float _328 = _170;
    float _330 = _172;
    float _332 = _296;
    float _334 = in.m_43.w;
    float _336 = _330;
    float _338 = _332;
    if (!_208)
    {
        _336 = 0.0;
        _338 = 0.0;
    }
    float _340 = _336;
    float _342 = _338;
    float _344 = _340;
    float _346 = _342;
    if (!_208)
    {
        _298 = 0.0;
    }
    float _348 = _298;
    float _350 = _348;
    if (_208)
    {
        float _352 = _234 * _146;
        _344 = _352;
    }
    float _354 = _344;
    float _356 = in.m_30.x;
    float _358 = in.m_30.y;
    float _360 = in.m_30.z;
    if (_208)
    {
        float _362 = _234 * _138;
        _346 = _362;
    }
    float _364 = _346;
    if (_208)
    {
        float _366 = _234 * _162;
        _350 = _366;
    }
    float _368 = _350;
    float _370 = 0.0;
    if (_236)
    {
        float _372 = rsqrt(_202);
        _370 = _372;
    }
    float _374 = _370;
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _378 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _380 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (!_218)
    {
        _300 = 0.0;
    }
    float _382 = _300;
    float _384 = _382;
    if (_218)
    {
        float _386 = _244 * _148;
        _384 = _386;
    }
    float _388 = _384;
    float _390 = fma(_328, _212, _378);
    float _392 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _394 = fma(_328, _214, _380);
    if (!_236)
    {
        _230 = 0.0;
        _250 = 0.0;
    }
    float _396 = _230;
    float _398 = _250;
    float _400 = _398;
    float _402 = _396;
    if (!_218)
    {
        _302 = 0.0;
    }
    float _404 = _302;
    float _406 = fma(_328, _216, _392);
    float _408 = _404;
    if (!_218)
    {
        _304 = 0.0;
    }
    float _410 = _304;
    float _412 = _410;
    if (_218)
    {
        float _414 = _244 * _140;
        _408 = _414;
    }
    float _416 = _408;
    if (!_236)
    {
        _306 = 0.0;
    }
    float _418 = _306;
    float _420 = _418;
    if (_218)
    {
        float _422 = _244 * _164;
        _412 = _422;
    }
    float _424 = _412;
    if (_236)
    {
        float _426 = _374 * _150;
        _420 = _426;
    }
    float _428 = _420;
    if (_236)
    {
        float _430 = _374 * _142;
        _400 = _430;
    }
    float _432 = _400;
    if (_236)
    {
        float _434 = _374 * _166;
        _402 = _434;
    }
    float _436 = _402;
    float _438 = fma(_390, _334, _356);
    float _440 = fma(_394, _334, _358);
    float _442 = fma(_406, _334, _360);
    bool _444 = !_376;
    float _462;
    if (!_444)
    {
        float _446 = in.m_45.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_82);
        float _468 = 1.0 / _466;
        float _470 = _116 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _476 = _472 + _474;
    bool _478 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _480 = isnan(_472);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _490;
    bool _494 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _496 = isnan(_472);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -_488;
    float _508 = _506 + 1.0;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _510;
    float _514 = 1.0 / _492;
    bool _516 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _518 = _504 * _508;
    float _520 = -_504;
    float _522 = _520 + 1.0;
    float _524 = _476 * _514;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _526;
    float _530 = fma(_512, _524, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _532;
    float _536 = fma(_528, _524, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _538 = fma(_534, _524, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _540 = _530 * _518;
    float _542 = _538 * _518;
    float _544 = _536 * _518;
    float _546 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].x, _540);
    float _548 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].y, _542);
    float _550 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[143].z, _544);
    float _552 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[144].x, _546);
    float _554 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[144].y, _548);
    float _556 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[144].z, _550);
    bool _558 = !_516;
    float _576;
    if (!_558)
    {
        float _560 = in.m_45.x;
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _564 = _560 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _566 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _568 = _566 * _562;
        float _570 = floor(_568);
        float _572 = -_570;
        float _574 = _568 + _572;
        _576 = _574;
        _578 = true;
    }
    else
    {
        float _580 = float(_82);
        float _582 = 1.0 / _580;
        float _584 = _116 * _582;
        _576 = _584;
    }
    _578 = false;
    float _586 = _576;
    float _588 = in.m_43.x;
    float _590 = in.m_43.y;
    float _592 = in.m_43.z;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _596 = _586 + _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _606;
    float _610 = 1.0 / _600;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _620 = 1.0 / _608;
    bool _622 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _624 = _556 * _592;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _628 = _586 + _626;
    float _630 = 1.0 / _604;
    float _632 = _554 * _590;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _636 = _586 + _634;
    float _638 = _596 * _610;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _642 = _586 + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _644;
    bool _648 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _650 = isnan(_586);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _664 = 1.0 / _614;
    bool _666 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _668 = isnan(_586);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = _628 * _620;
    bool _680 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _682 = isnan(_586);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = fma(_646, _638, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _694 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _696 = isnan(_586);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -_676;
    float _708 = _706 + 1.0;
    float _710 = 1.0 / _618;
    float _712 = _636 * _630;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _714;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _720 = _586 + _718;
    float _722 = -_690;
    float _724 = _722 + 1.0;
    float _726 = _658 * _708;
    float _728 = fma(_716, _638, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _730 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _732 = isnan(_586);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    float _742 = _642 * _664;
    bool _744 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _746 = isnan(_586);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -_658;
    float _758 = _756 + 1.0;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _764 = _754 * _724;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _770 = _720 * _710;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _772;
    float _776 = -_704;
    float _778 = _776 + 1.0;
    float _780 = _690 * _758;
    float _782 = fma(_774, _638, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _784 = -_754;
    float _786 = _784 + 1.0;
    float _788 = _740 * _778;
    float _790 = fma(_768, _712, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _792 = _704 * _786;
    float _794 = _728 * _788;
    float _796 = fma(_662, _712, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _798 = _782 * _788;
    float _800 = _692 * _788;
    float _802 = -_740;
    float _804 = _802 + 1.0;
    float _806 = fma(_762, _712, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _808;
    float _812 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[107].x, _798);
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[107].y, _800);
    float _816 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[107].z, _794);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _834;
    float _838 = fma(_810, _742, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _840 = fma(_790, _792, _812);
    float _842 = fma(_824, _742, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _844 = fma(_820, _770, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _846 = fma(_828, _770, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _848 = fma(_832, _770, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _850 = fma(_796, _792, _814);
    float _852 = fma(_806, _792, _816);
    float _854 = fma(_836, _742, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _856 = fma(_838, _764, _840);
    float _858 = fma(_842, _764, _850);
    float _860 = fma(_854, _764, _852);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _862;
    float _866 = fma(_844, _780, _856);
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _868;
    float _872 = fma(_846, _780, _858);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _874;
    float _878 = fma(_864, _678, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _880 = fma(_870, _678, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _882 = fma(_848, _780, _860);
    float _884 = fma(_876, _678, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _886 = fma(_878, _726, _866);
    float _888 = fma(_880, _726, _872);
    float _890 = _552 * _588;
    float _892 = fma(_884, _726, _882);
    float _894 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[112].x, _886);
    float _896 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[112].y, _888);
    float _898 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[112].z, _892);
    bool _900 = !_622;
    float _918;
    if (!_900)
    {
        float _902 = in.m_45.x;
        float _904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _906 = _902 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _910 = _908 * _904;
        float _912 = floor(_910);
        float _914 = -_912;
        float _916 = _910 + _914;
        _918 = _916;
        _920 = true;
    }
    else
    {
        float _922 = float(_82);
        float _924 = 1.0 / _922;
        float _926 = _116 * _924;
        _918 = _926;
    }
    _920 = false;
    float _928 = _918;
    float _930 = in.m_45.z;
    float _932 = _440 * _148;
    float _934 = _440 * _140;
    float _936 = in.m_45.x;
    float _938 = _440 * _164;
    float _940 = fma(_438, _138, _934);
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _944 = _942 != 0;
    float _946 = in.m_45.y;
    float _948 = fma(_438, _146, _932);
    float _950 = fma(_438, _162, _938);
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _954 = _952 != 0;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _958 = _956 != 0;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _962 = _960 != 0;
    float _964 = in.m_45.w;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _968 = in.m_47.x;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _974 = _930 * 2.0;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _980 = _936 * 2.0;
    float _982 = _936 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _984 = floor(_974);
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _988 = _946 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _990 = -_966;
    float _992 = fma(_982, 2.0, _990);
    float _994 = _982;
    float _996 = _988;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    bool _1000 = _958;
    if (!_944)
    {
        _994 = _930;
    }
    float _1002 = _994;
    float _1004 = _946 * 2.0;
    float _1006 = fma(_988, -2.0, _970);
    float _1008 = _1002;
    if (!_944)
    {
        _996 = _930;
    }
    float _1010 = _996;
    float _1012 = floor(_980);
    float _1014 = _1010;
    if (_944)
    {
        _1008 = _946;
    }
    float _1016 = _1008;
    float _1018 = fma(_442, _142, _940);
    if (_944)
    {
        _1014 = _946;
    }
    float _1020 = _1014;
    float _1022 = fma(_442, _150, _948);
    if (!_944)
    {
        _998 = _946;
    }
    float _1024 = _998;
    float _1026 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[83].w, _972);
    float _1028 = _1024;
    if (_944)
    {
        _1028 = _936;
    }
    float _1030 = _1028;
    float _1032 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1034 = _984 > 0.0;
    float _1036 = floor(_1004);
    bool _1038 = _984 >= 0.0;
    bool _1040 = isnan(_984);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan(0.0);
    bool _1046 = _1042 || _1044;
    float _1048 = fma(_1032, -2.0, _976);
    float _1050 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[83].z, _978);
    int _1052 = _1046 ? 0 : 1;
    float _1054 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1056 = _1012 > 0.0;
    float _1058 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1060 = log2(_1058);
    bool _1062 = _1012 >= 0.0;
    bool _1064 = isnan(_1012);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan(0.0);
    bool _1070 = _1066 || _1068;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1074 = ~_1052;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    float _1080 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1082 = _1070 ? 0 : 1;
    float _1084 = fma(_442, _166, _950);
    int _1086 = _1078;
    if (!_1034)
    {
        int _1088 = ~_1052;
        int _1090 = _1088 + 1;
        _1086 = _1090;
    }
    int _1092 = _1086;
    float _1094 = -_986;
    float _1096 = fma(_1080, 2.0, _1094);
    bool _1098 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1100 = isnan(1.0);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1106 = _1102 || _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1110 = 1.0 + _1108;
    int _1112 = ~_1082;
    int _1114 = _1112 + 1;
    int _1116 = _1114 + 1;
    float _1118 = _1022 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1120 = _1116;
    if (!_1056)
    {
        int _1122 = ~_1082;
        int _1124 = _1122 + 1;
        _1120 = _1124;
    }
    int _1126 = _1120;
    float _1128 = 1.0 / _1110;
    bool _1130 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1132 = isnan(0.0);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1138 = _1134 || _1136;
    float _1140 = _1060 * _116;
    bool _1142 = _1036 > 0.0;
    float _1144 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1072);
    float _1146 = in.m_47.z;
    bool _1148 = _1036 >= 0.0;
    bool _1150 = isnan(_1036);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan(0.0);
    bool _1156 = _1152 || _1154;
    float _1158 = exp2(_1140);
    float _1160 = _1084 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1162 = in.m_49.x;
    float _1164 = in.m_49.y;
    float _1166 = in.m_49.z;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1170 = _1156 ? 0 : 1;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1174 = _1118 + _1172;
    float _1176 = in.m_47.y;
    float _1178 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1168);
    int _1180 = ~_1170;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    float _1186 = -_116;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[76].x, _992);
    int _1190 = _1184;
    if (!_1142)
    {
        int _1192 = ~_1170;
        int _1194 = _1192 + 1;
        _1190 = _1194;
    }
    int _1196 = _1190;
    float _1198 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1144);
    float _1200 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1178);
    float _1202 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1006);
    float _1204 = -_116;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1096);
    float _1208 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1048);
    float _1210 = -_1158;
    float _1212 = _1210 + 1.0;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1216 = _1160 + _1214;
    out.m_51.x = _968;
    float _1218 = _936 + _946;
    float _1220 = _1138 ? _1212 : 0.0;
    float _1222 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1050);
    float _1224 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1026);
    bool _1226 = !_954;
    int _1228 = _1226 ? 0 : 1;
    out.m_51.z = _1146;
    bool _1230 = _964 > 0.5;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1234 = _1054 + _1232;
    bool _1236 = _1230;
    if (_1106)
    {
        float _1238 = _1220 * _1128;
        _120 = _1238;
    }
    float _1240 = _120;
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1162);
    float _1244 = in.m_47.w;
    float _1246 = _1234 * _1234;
    float _1248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1164);
    float _1250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1166);
    float _1252 = fma(_1174, _1174, _1246);
    out.m_51.y = _1176;
    float _1254 = fma(_1216, _1216, _1252);
    float _1256 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1258 = in.m_53.x;
    float _1260 = in.m_53.y;
    float _1262 = in.m_53.z;
    float _1264 = _1218 + (-1.0);
    int _1266 = abs(_1228);
    float _1268 = rsqrt(_1254);
    float _1270 = _946 + _930;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1274 = _1272 != 0;
    out.m_33.x = _1256;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1278 = _1276 != 0;
    float _1280 = _1270 + (-1.0);
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1284 = _1282 != 0;
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1288 = _1286 != 0;
    float _1290 = _890 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1292 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    out.m_51.w = _1244;
    float _1294 = float(_1266);
    float _1296 = float(_1092);
    float _1298 = _1234 * _1268;
    float _1300 = float(_1126);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1306 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1308 = _1294 * _1296;
    float _1310 = _1174 * _1268;
    float _1312 = -_1298;
    float _1314 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1234);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1320 = _1308 * (-2.0);
    float _1322 = -_1310;
    float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1174);
    float _1326 = _1314 * _1314;
    float _1328 = _936 + (-0.5);
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1332 = _1330 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1334 = fma(_1320, _1258, _1258);
    float _1336 = fma(_1324, _1324, _1326);
    bool _1338 = !_958;
    int _1340 = _1338 ? 0 : 1;
    float _1342 = fma(_1292, _1320, _1292);
    bool _1344 = !_962;
    int _1346 = _1344 ? 0 : 1;
    float _1348 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1334);
    int _1350 = abs(_1340);
    float _1352 = 1.0 / _1304;
    int _1354 = abs(_1346);
    float _1356 = _1216 * _1268;
    float _1358 = in.m_55.y;
    float _1360 = float(_1350);
    float _1362 = -_1356;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1216);
    float _1366 = float(_1354);
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1370 = _1368 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _1372 = float(_1196);
    float _1374 = _1360 * _1300;
    if (_1274)
    {
        bool _1376 = _936 > 0.5;
        _1000 = _1376;
    }
    bool _1378 = _1000;
    float _1380 = _936 + _930;
    float _1382 = 1.0 / _1370;
    float _1384 = _1366 * _1372;
    float _1386 = fma(_1364, _1364, _1336);
    float _1388 = fma(_1342, _1240, _1348);
    float _1390 = _1374 * (-2.0);
    float _1392 = _1384 * (-2.0);
    float _1394 = 1.0 / _1318;
    float _1396 = _1380 + (-1.0);
    float _1398 = fma(_1390, _1260, _1260);
    float _1400 = fma(_1306, _1390, _1306);
    float _1402 = _946 + (-0.5);
    float _1404 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1406 = fma(_1392, _1262, _1262);
    float _1408 = _930 + (-0.5);
    float _1410 = 1.0 / _1332;
    float _1412 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1398);
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1418 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1406);
    float _1420 = fma(_1400, _1240, _1412);
    float _1422 = -_1358;
    float _1424 = _1422 + 1.0;
    float _1426 = sqrt(_1386);
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1434 = _1432 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1436 = _1388 * 0.15915493667125701904296875;
    float _1438 = _1420 * 0.15915493667125701904296875;
    float _1440 = _1430 * _1352;
    float _1442 = _1230 ? _1424 : _1358;
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1446 = _928 + _1444;
    float _1448 = 1.0 / _1416;
    float _1450 = fma(_1404, _1392, _1404);
    float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1452;
    bool _1456 = _946 > 0.5;
    float _1458 = _1434 * _1394;
    float _1460 = fma(_1450, _1240, _1418);
    float _1462 = _1454 * _1410;
    float _1464 = _1442;
    float _1466 = _1358;
    float _1468 = _1424;
    if (_1278)
    {
        bool _1470 = _930 > 0.5;
        _1236 = _1470;
    }
    bool _1472 = _1236;
    float _1474 = _1460 * 0.15915493667125701904296875;
    float _1476 = _1436 * 6.283185482025146484375;
    float _1478 = sin(_1476);
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1486 = _1484 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1490 = _928 + _1488;
    float _1492 = _1482 * _1382;
    float _1494 = fma(_1440, _1446, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1496 = _632 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1498 = _1436 * 6.283185482025146484375;
    float _1500 = cos(_1498);
    float _1502 = _1486 * _1448;
    float _1504 = fma(_1458, _1490, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1506 = _1438 * 6.283185482025146484375;
    float _1508 = sin(_1506);
    float _1510 = _1438 * 6.283185482025146484375;
    float _1512 = cos(_1510);
    float _1514 = _1474 * 6.283185482025146484375;
    float _1516 = cos(_1514);
    float _1518 = _1268 * _1426;
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1522 = _928 + _1520;
    float _1524 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1526 = _1496 * _1518;
    float _1528 = fma(_1462, _1522, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1530 = _1290 * _1518;
    float _1532 = _1474 * 6.283185482025146484375;
    float _1534 = sin(_1532);
    float _1536 = _1526 * _1248;
    float _1538 = _1478 * _1508;
    float _1540 = _1500 * _1512;
    float _1542 = _1500 * _1508;
    float _1544 = _1478 * _1512;
    float _1546 = _1524 * _1518;
    float _1548 = _1530 * _1242;
    float _1550 = _1516 * _1536;
    float _1552 = _1508 * _1516;
    float _1554 = _1512 * _1516;
    float _1556 = _1500 * _1550;
    float _1558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1560 = fma(_1534, _1540, _1538);
    float _1562 = -_1542;
    float _1564 = fma(_1534, _1544, _1562);
    float _1566 = -_1544;
    float _1568 = fma(_1534, _1542, _1566);
    float _1570 = _1546 * _1250;
    float _1572 = -_1536;
    float _1574 = _1534 * _1572;
    float _1576 = fma(_1560, _1548, _1556);
    float _1578 = _1478 * _1550;
    float _1580 = fma(_1534, _1538, _1540);
    float _1582 = fma(_1554, _1548, _1574);
    float _1584 = fma(_1568, _1570, _1576);
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1588 = _928 + _1586;
    float _1590 = fma(_1564, _1548, _1578);
    float _1592 = fma(_1552, _1570, _1582);
    float _1594 = _1584 * _388;
    float _1596 = _1584 * _424;
    float _1598 = fma(_1502, _1588, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1600 = fma(_1580, _1570, _1590);
    float _1602 = fma(_1592, _354, _1594);
    float _1604 = fma(_1592, _368, _1596);
    bool _1606 = _928 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1608 = isnan(_928);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1614 = _1610 || _1612;
    float _1616 = float(_1614);
    float _1618 = in.m_55.x;
    float _1620 = fma(_1600, _428, _1602);
    bool _1622 = _928 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1624 = isnan(_928);
    bool _1626 = _1622 || _1624;
    bool _1628 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1630 = _1626 || _1628;
    float _1632 = float(_1630);
    float _1634 = fma(_1600, _436, _1604);
    float _1636 = -_1616;
    float _1638 = _1636 + 1.0;
    float _1640 = _1118 + _1620;
    bool _1642 = _928 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1644 = isnan(_928);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1650 = _1646 || _1648;
    float _1652 = float(_1650);
    float _1654 = -_1632;
    float _1656 = _1654 + 1.0;
    float _1658 = _1160 + _1634;
    float _1660 = _1632 * _1638;
    bool _1662 = _928 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1664 = isnan(_928);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1670 = _1666 || _1668;
    float _1672 = float(_1670);
    float _1674 = _1652 * _1656;
    float _1676 = -_1652;
    float _1678 = _1676 + 1.0;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1682 = _1658 + _1680;
    bool _1684 = _928 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1686 = isnan(_928);
    bool _1688 = _1684 || _1686;
    bool _1690 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1692 = _1688 || _1690;
    float _1694 = float(_1692);
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1698 = _928 + _1696;
    float _1700 = _1672 * _1678;
    float _1702 = -_1672;
    float _1704 = _1702 + 1.0;
    float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1708 = _1640 + _1706;
    float _1710 = _1682 * _1682;
    float _1712 = fma(_1492, _1698, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1714 = _1694 * _1704;
    bool _1716 = _928 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1718 = isnan(_928);
    bool _1720 = _1716 || _1718;
    bool _1722 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1724 = _1720 || _1722;
    float _1726 = float(_1724);
    float _1728 = fma(_1708, _1708, _1710);
    float _1730 = -_1694;
    float _1732 = _1730 + 1.0;
    float _1734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1736 = _1548;
    int _1738 = as_type<int>(_1618);
    float _1740 = _1640;
    float _1742 = _1658;
    if (!_1274)
    {
        _1736 = _1618;
    }
    float _1744 = _1736;
    float _1746 = _1584 * _416;
    float _1748 = _1726 * _1732;
    float _1750 = _1284 ? _1442 : _1358;
    float _1752 = -_1726;
    float _1754 = _1752 + 1.0;
    float _1756 = _1744;
    if (!_1274)
    {
        _1464 = _1744;
    }
    float _1758 = _1464;
    float _1760 = _1494 * _1748;
    float _1762 = sqrt(_1728);
    float _1764 = _1758;
    if (_1274)
    {
        _1756 = _1618;
    }
    float _1766 = _1756;
    float _1768 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1770 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1760);
    int _1772 = as_type<int>(_1558);
    if (_1288)
    {
        float _1774 = _1456 ? _1424 : _1358;
        _1466 = _1774;
    }
    float _1776 = _1466;
    float _1778 = fma(_1592, _364, _1746);
    if (_1274)
    {
        float _1780 = -_1766;
        float _1782 = _1780 + 1.0;
        _1738 = as_type<int>(_1782);
    }
    int _1784 = _1738;
    float _1786 = fma(_1504, _1714, _1770);
    float _1788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1278)
    {
        float _1790 = -_1766;
        float _1792 = _1790 + 1.0;
        _1772 = as_type<int>(_1792);
    }
    int _1794 = _1772;
    float _1796 = fma(_1768, _1776, -0.5);
    if (_1274)
    {
        float _1798 = _1378 ? as_type<float>(_1784) : _1766;
        _1764 = _1798;
    }
    float _1800 = _1764;
    float _1802 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1804 = fma(_1600, _432, _1778);
    float _1806 = fma(_1528, _1700, _1786);
    if (!_1278)
    {
        _1468 = _1766;
    }
    float _1808 = _1468;
    float _1810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1812 = _1762 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1814 = fma(_1802, _1800, -0.5);
    float _1816 = _1808;
    float _1818 = _1814;
    if (_1278)
    {
        float _1820 = _1472 ? as_type<float>(_1794) : _1766;
        _1816 = _1820;
    }
    float _1822 = _1816;
    float _1824 = _1054 + _1804;
    float _1826 = fma(_1598, _1674, _1806);
    float _1828 = fma(_1198, _1814, _1188);
    float _1830 = -_1202;
    float _1832 = fma(_1200, _1796, _1830);
    float _1834 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1836 = fma(_1712, _1660, _1826);
    float _1838 = fma(_1750, _1834, -0.5);
    if (!_1812)
    {
        _1818 = _1824;
    }
    float _1840 = _1818;
    float _1842 = _1810 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1844 = -_1208;
    float _1846 = fma(_1224, _1838, _1844);
    float _1848 = fma(_1842, _1822, -0.5);
    bool _1850 = !_1812;
    float _1852 = _1840;
    if (!_1850)
    {
        float _1854 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1858 = _1762 + _1856;
        float _1860 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1862 = rsqrt(_1728);
        float _1864 = _1858 * _1854;
        float _1866 = _1864 * 0.15915493667125701904296875;
        float _1868 = _1866 * 6.283185482025146484375;
        float _1870 = cos(_1868);
        float _1872 = _1866 * 6.283185482025146484375;
        float _1874 = sin(_1872);
        float _1876 = _1870 + (-1.0);
        float _1878 = fma(_1874, _1860, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1880 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1882 = _1862 * _1878;
        float _1884 = fma(_1824, _1870, _1880);
        float _1886 = fma(_1708, _1882, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1888 = fma(_1682, _1882, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1852 = _1884;
        _1740 = _1886;
        _1742 = _1888;
    }
    float _1890 = _1852;
    float _1892 = _1740;
    float _1894 = _1742;
    float _1896 = -_1298;
    float _1898 = fma(_1896, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1890);
    float _1900 = fma(_1222, _1848, _1206);
    float _1902 = -_1310;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1892);
    float _1906 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[120].x, _1836);
    float _1908 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1910 = -_1356;
    float _1912 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1894);
    float _1914 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1916 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1918 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1908);
    float _1920 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1922 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1914);
    float _1924 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1916);
    float _1926 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1918);
    float _1928 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1920);
    float _1930 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1922);
    float _1932 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1924);
    float _1934 = _1926 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1936 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1928);
    float _1938 = _1930 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1940 = _1932 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1942 = _1934 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1944 = _1934 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1946 = _1934 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1948 = _1934 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1950 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1942);
    float _1952 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1944);
    float _1954 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1946);
    float _1956 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1958 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1950);
    float _1960 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1948);
    float _1962 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1952);
    float _1964 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1954);
    float _1966 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1958);
    float _1968 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1960);
    float _1970 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1962);
    float _1972 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1964);
    float _1974 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1968);
    float _1976 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1978 = _1832 + 0.5;
    float _1980 = _894 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1982 = _896 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1984 = _898 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1990 = _1972 + _1966;
    float _1992 = _1846 + 0.5;
    float _1994 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1996 = _1900 + 0.5;
    float _1998 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2000 = _1982 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2002 = _1984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2004 = _1986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2006 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2008 = _1828 + 0.5;
    float _2010 = _1906 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2012 = _1990 * 0.5;
    out.m_57.x = _1994;
    out.m_57.y = _2004;
    out.m_57.z = _2006;
    out.m_59.x = _2008;
    out.m_59.y = _1978;
    out.m_59.z = _1996;
    out.m_59.w = _1992;
    out.m_61.x = _1998;
    out.m_61.y = _2000;
    out.m_61.z = _2002;
    out.m_61.w = _2010;
    out.gl_Position.x = _1970;
    out.gl_Position.y = _1974;
    out.gl_Position.z = _1972;
    out.gl_Position.w = _1966;
    out.m_63.z = _2012;
    out.m_63.w = _1966;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

