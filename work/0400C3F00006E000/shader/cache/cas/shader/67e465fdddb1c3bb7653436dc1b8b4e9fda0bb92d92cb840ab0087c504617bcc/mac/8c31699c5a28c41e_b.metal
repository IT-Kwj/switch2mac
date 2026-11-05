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
};

struct main0_out
{
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_29 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_51 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_49 [[attribute(5)]];
    float4 m_41 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_35 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1170 = false;
    bool _858 = false;
    bool _630 = false;
    bool _506 = false;
    bool _278 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_26.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    float _82 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _80;
    if (!_78)
    {
        out.m_29.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _84 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1945 = as_type<float>(_90);
        out.gl_Position.z = _1945;
    }
    if (!_78)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _92 = in.m_31.w;
    float _94 = float(_74);
    float _96 = 1.0 / _94;
    float _98 = -_92;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_92);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = _100 * _96;
    bool _114 = _100 >= _94;
    bool _116 = !_110;
    bool _118 = _114 || _116;
    out.m_33.x = _112;
    if (_118)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _82;
    if (_118)
    {
        out.m_29.x = 0.0;
    }
    int _122 = 0;
    if (_118)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2015 = as_type<float>(_126);
        out.gl_Position.z = _2015;
    }
    if (_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_35.x;
    float _130 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _132 = in.m_35.y;
    bool _134 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _136 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _138 = _134 || _136;
    bool _140 = isnan(1.0);
    bool _142 = _138 || _140;
    float _144 = in.m_37.w;
    float _146 = in.m_31.x;
    float _148 = in.m_31.y;
    float _150 = in.m_31.z;
    float _152 = in.m_26.x;
    float _154 = in.m_26.y;
    float _156 = in.m_26.z;
    float _158 = 0.0;
    float _160 = _130;
    if (!_142)
    {
        float _162 = _130 * _130;
        float _164 = _162 * 0.5;
        _158 = _164;
    }
    float _166 = _158;
    float _168 = _166;
    if (!_142)
    {
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _170;
    }
    float _172 = _168;
    out.m_39.x = _128;
    out.m_39.y = _132;
    bool _174 = !_142;
    float _176 = _172;
    float _178 = _132;
    float _180 = _128;
    if (!_174)
    {
        float _182 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = log2(_182);
        float _186 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _188 = _186 + 1.0;
        float _190 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = _130 * _184;
        float _194 = exp2(_192);
        float _196 = _190 * 0.693147182464599609375;
        float _198 = 1.0 / _196;
        float _200 = 1.0 / _188;
        float _202 = _194 + (-1.0);
        float _204 = -_202;
        float _206 = fma(_204, _198, _130);
        float _208 = _206 * _200;
        float _210 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _210;
    }
    float _212 = _176;
    bool _214 = !_142;
    if (!_214)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = 1.0 / _222;
        float _226 = _130 * _218;
        float _228 = exp2(_226);
        float _230 = -_228;
        float _232 = _230 + 1.0;
        float _234 = _232 * _224;
        _160 = _234;
    }
    float _236 = _160;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _240 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _242 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _244 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _246 = fma(_236, _146, _240);
    float _248 = fma(_236, _148, _242);
    float _250 = fma(_236, _150, _244);
    float _252 = fma(_246, _144, _152);
    float _254 = fma(_248, _144, _154);
    float _256 = fma(_250, _144, _156);
    bool _258 = !_238;
    float _276;
    if (!_258)
    {
        float _260 = in.m_41.x;
        float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _264 = _260 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _268 = _266 * _262;
        float _270 = floor(_268);
        float _272 = -_270;
        float _274 = _268 + _272;
        _276 = _274;
        _278 = true;
    }
    else
    {
        _276 = _112;
    }
    _278 = false;
    float _280 = _276;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _280 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = _280 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = _280 + _302;
    float _306 = 1.0 / _292;
    bool _308 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_280);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    bool _320 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _322 = isnan(_280);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _334 = 1.0 / _296;
    float _336 = 1.0 / _300;
    float _338 = _288 * _306;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _344;
    float _348 = _284 * _334;
    bool _350 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _352 = isnan(_280);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _362;
    float _366 = -_360;
    float _368 = _366 + 1.0;
    float _370 = fma(_364, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = _304 * _336;
    float _374 = fma(_342, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = fma(_346, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _378 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _380 = isnan(_280);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = _318 * _368;
    float _392 = -_318;
    float _394 = _392 + 1.0;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _408 = -_388;
    float _410 = _408 + 1.0;
    float _412 = _388 * _394;
    float _414 = fma(_398, _348, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = fma(_402, _348, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_406, _348, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _420 = _330 * _410;
    float _422 = in.m_37.x;
    float _424 = in.m_37.y;
    float _426 = in.m_37.z;
    float _428 = -_330;
    float _430 = _428 + 1.0;
    float _432 = _374 * _420;
    float _434 = _376 * _420;
    float _436 = _370 * _420;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _438;
    float _442 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _432);
    float _444 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _434);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _450;
    float _454 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].z, _436);
    float _456 = fma(_416, _412, _444);
    float _458 = fma(_448, _372, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _460 = fma(_452, _372, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _462 = fma(_418, _412, _454);
    float _464 = fma(_440, _372, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_414, _412, _442);
    float _468 = fma(_458, _390, _456);
    float _470 = fma(_460, _390, _462);
    float _472 = fma(_464, _390, _466);
    float _474 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[146].y, _468);
    float _476 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[146].z, _470);
    float _478 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[146].x, _472);
    float _480 = _474 * _424;
    float _482 = _476 * _426;
    float _484 = _478 * _422;
    bool _486 = !_332;
    float _504;
    if (!_486)
    {
        float _488 = in.m_41.x;
        float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _492 = _488 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _494 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _496 = _494 * _490;
        float _498 = floor(_496);
        float _500 = -_498;
        float _502 = _496 + _500;
        _504 = _502;
        _506 = true;
    }
    else
    {
        _504 = _112;
    }
    _506 = false;
    float _508 = _504;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _512 = _508 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _518 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _520 = isnan(_508);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _534 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _536 = isnan(_508);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _546;
    bool _550 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _552 = isnan(_508);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = 1.0 / _516;
    float _564 = -_528;
    float _566 = _564 + 1.0;
    bool _568 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _570 = _544 * _566;
    float _572 = -_544;
    float _574 = _572 + 1.0;
    float _576 = 1.0 / _532;
    float _578 = _548 * _562;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _584 = fma(_578, _512, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _586 = _582 * _576;
    float _588 = _584 * _570;
    float _590 = -_560;
    float _592 = _590 + 1.0;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _596 = _508 + _594;
    float _598 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[115].x, _588);
    float _600 = _528 * _592;
    float _602 = fma(_586, _596, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _604 = fma(_602, _600, _598);
    float _606 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[117].x, _604);
    float _608 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.w = _608;
    bool _610 = !_568;
    float _628;
    if (!_610)
    {
        float _612 = in.m_41.x;
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _616 = _612 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _620 = _618 * _614;
        float _622 = floor(_620);
        float _624 = -_622;
        float _626 = _620 + _624;
        _628 = _626;
        _630 = true;
    }
    else
    {
        _628 = _112;
    }
    _630 = false;
    float _632 = _628;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _636 = _632 + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _640 = _632 + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _644 = _632 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _658 = 1.0 / _648;
    bool _660 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _662 = isnan(_632);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = 1.0 / _652;
    bool _674 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _676 = 1.0 / _656;
    bool _678 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _680 = isnan(_632);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = _636 * _658;
    bool _692 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _694 = isnan(_632);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = -_688;
    float _706 = _704 + 1.0;
    float _708 = _640 * _672;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _710;
    float _714 = -_702;
    float _716 = _714 + 1.0;
    float _718 = _702 * _706;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _724 = fma(_712, _708, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _730 = _644 * _676;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _732;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _736;
    float _740 = _670 * _716;
    float _742 = -_670;
    float _744 = _742 + 1.0;
    float _746 = fma(_734, _708, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _748 = fma(_738, _708, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _750 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _752 = isnan(_632);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _766 = fma(_722, _730, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _768 = fma(_728, _730, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _770 = _760 * _744;
    float _772 = fma(_764, _730, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _774 = -_760;
    float _776 = _774 + 1.0;
    float _778 = _724 * _770;
    float _780 = _746 * _770;
    float _782 = _748 * _770;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _784;
    float _788 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[123].x, _778);
    float _790 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[123].y, _780);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _796;
    float _800 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[123].z, _782);
    float _802 = fma(_786, _690, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _804 = fma(_772, _740, _788);
    float _806 = fma(_794, _690, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _808 = fma(_798, _690, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _810 = fma(_766, _740, _790);
    float _812 = fma(_768, _740, _800);
    float _814 = fma(_802, _718, _804);
    float _816 = fma(_806, _718, _810);
    float _818 = fma(_808, _718, _812);
    float _820 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[126].x, _814);
    float _822 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[126].y, _816);
    float _824 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[126].z, _818);
    float _826 = _820 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _828 = _822 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _830 = _824 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _832 = _826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _834 = _828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _836 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _832;
    out.m_45.y = _834;
    out.m_45.z = _836;
    bool _838 = !_674;
    float _856;
    if (!_838)
    {
        float _840 = in.m_41.x;
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _844 = _840 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[14].x, _100);
        float _848 = _846 * _842;
        float _850 = floor(_848);
        float _852 = -_850;
        float _854 = _848 + _852;
        _856 = _854;
        _858 = true;
    }
    else
    {
        _856 = _112;
    }
    _858 = false;
    float _860 = _856;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _864 = _860 + _862;
    bool _866 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _868 = isnan(_860);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _874 = _870 || _872;
    float _876 = float(_874);
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _882 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _884 = isnan(_860);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _894;
    float _898 = 1.0 / _880;
    bool _900 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _902 = isnan(_860);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    bool _912 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _914 = isnan(_860);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _928 = 1.0 / _926;
    float _930 = -_876;
    float _932 = _930 + 1.0;
    bool _934 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _936 = _896 * _898;
    bool _938 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _940 = isnan(_860);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = -_892;
    float _952 = _950 + 1.0;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _958 = fma(_936, _864, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _960 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _962 = isnan(_860);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = -_948;
    float _974 = _972 + 1.0;
    float _976 = _948 * _932;
    float _978 = _876 * _952;
    float _980 = _910 * _974;
    float _982 = -_910;
    float _984 = _982 + 1.0;
    float _986 = 1.0 / _956;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _992 = _922 * _984;
    float _994 = -_922;
    float _996 = _994 + 1.0;
    bool _998 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1000 = isnan(_860);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = _970 * _996;
    float _1012 = -_970;
    float _1014 = _1012 + 1.0;
    float _1016 = 1.0 / _990;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1022;
    float _1026 = _1008 * _1014;
    float _1028 = _1020 * _928;
    float _1030 = -_1008;
    float _1032 = _1030 + 1.0;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1038 = _958 * _1026;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1046 = _860 + _1044;
    float _1048 = 1.0 / _1036;
    float _1050 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1038);
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1056 = fma(_1028, _1046, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1058 = _1024 * _1016;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1062 = _860 + _1060;
    float _1064 = fma(_1056, _1010, _1050);
    float _1066 = 1.0 / _1042;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1072 = fma(_1058, _1062, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1080 = _860 + _1078;
    float _1082 = _1070 * _986;
    float _1084 = fma(_1072, _992, _1064);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1088 = _860 + _1086;
    float _1090 = 1.0 / _1054;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1094 = _1092 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1096 = _1076 * _1048;
    float _1098 = fma(_1082, _1080, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1102 = _860 + _1100;
    float _1104 = fma(_1096, _1088, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1106 = _1094 * _1066;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1108;
    bool _1112 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1114 = isnan(_860);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = fma(_1098, _980, _1084);
    float _1126 = fma(_1106, _1102, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1130 = _860 + _1128;
    float _1132 = -_1122;
    float _1134 = _1132 + 1.0;
    float _1136 = _1110 * _1090;
    float _1138 = fma(_1104, _976, _1124);
    float _1140 = _892 * _1134;
    float _1142 = fma(_1136, _1130, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1144 = fma(_1126, _978, _1138);
    float _1146 = fma(_1142, _1140, _1144);
    float _1148 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1146);
    out.m_47.x = _1148;
    bool _1150 = !_934;
    float _1168;
    if (!_1150)
    {
        float _1152 = in.m_41.x;
        float _1154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1156 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[14].y, _100);
        float _1160 = _1158 * _1154;
        float _1162 = floor(_1160);
        float _1164 = -_1162;
        float _1166 = _1160 + _1164;
        _1168 = _1166;
        _1170 = true;
    }
    else
    {
        _1168 = _112;
    }
    _1170 = false;
    float _1172 = _1168;
    float _1174 = in.m_41.w;
    float _1176 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1178 = in.m_49.x;
    float _1180 = in.m_49.y;
    float _1182 = in.m_49.z;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1186 = _1184 != 0;
    float _1188 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1176);
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1192 = _1190 != 0;
    float _1194 = in.m_41.x;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1198 = _1196 != 0;
    float _1200 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1204 = _1202 != 0;
    float _1206 = in.m_35.w;
    float _1208 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1200);
    float _1210 = in.m_41.y;
    float _1212 = -_132;
    float _1214 = _1212 + 1.0;
    float _1216 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1220 = _1172 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1230 = in.m_35.z;
    bool _1232 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1234 = isnan(_1172);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1246 = _1174 > 0.5;
    float _1248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1180);
    float _1250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1178);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1254 = _1252 != 0;
    float _1256 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1258 = 1.0 / _1224;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1262 = _1230;
    if (_1186)
    {
        float _1264 = _1246 ? _1214 : _132;
        _178 = _1264;
    }
    float _1266 = _178;
    float _1268 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1256);
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1276 = _1274 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1278 = -_1206;
    float _1280 = _1278 + 1.0;
    float _1282 = 1.0 / _1272;
    bool _1284 = _1210 > 0.5;
    float _1286 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1290 = _1206;
    if (_1204)
    {
        float _1292 = _1284 ? _1280 : _1206;
        _1290 = _1292;
    }
    float _1294 = _1290;
    float _1296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1182);
    float _1298 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1300 = 1.0 / _1228;
    float _1302 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1304 = fma(_1286, -2.0, _1288);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1306;
    float _1310 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1208);
    float _1312 = -_1260;
    float _1314 = fma(_1302, 2.0, _1312);
    float _1316 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1268);
    float _1318 = _1208;
    if (_1198)
    {
        float _1320 = in.m_41.z;
        _1318 = _1320;
    }
    float _1322 = _1318;
    float _1324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1326 = _1216 * _1250;
    float _1328 = _1298 * _1248;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1332 = _1172 + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1338 = _1194 > 0.5;
    bool _1340 = _1338 && _1192;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1344 = _1172 + _1342;
    float _1346 = _1332 * _1258;
    float _1348 = 1.0 / _1276;
    bool _1350 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1352 = isnan(_1172);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1358 = _1354 || _1356;
    float _1360 = float(_1358);
    float _1362 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1364 = -_100;
    float _1366 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1314);
    float _1368 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1362);
    float _1370 = 1.0 / _1308;
    float _1372 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1188);
    float _1374 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1378 = _1172 + _1376;
    float _1380 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1382 = _1374 * _1296;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1386 = _1172 + _1384;
    float _1388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1392 = _1172 + _1390;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1396 = _1386 * _1348;
    bool _1398 = _1322 > 0.5;
    bool _1400 = _1398 && _1198;
    float _1402 = _1392 * _1300;
    float _1404 = _1378 * _1282;
    float _1406 = 1.0 / _1336;
    float _1408 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1394);
    float _1410 = _1344 * _1370;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1414;
    float _1418 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1408);
    float _1420 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1422 = fma(_1380, _1294, -0.5);
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_1254)
    {
        _1426 = _1210;
    }
    float _1428 = _1426;
    float _1430 = 1.0 / _1416;
    float _1432 = _1428;
    if (_1254)
    {
        _1432 = _1194;
    }
    float _1434 = _1432;
    float _1436 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1424);
    float _1438 = fma(_1420, _1266, -0.5);
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1442 = _1172 + _1440;
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1444;
    float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1448;
    float _1452 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1304);
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1460 = _1458 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1462 = fma(_1450, _1346, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1464 = -_1452;
    float _1466 = fma(_1418, _1422, _1464);
    float _1468 = fma(_1456, _1346, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1472 = _1470 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1474 = _1442 * _1430;
    float _1476 = fma(_1460, _1402, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1478;
    float _1482 = fma(_1472, _1402, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1484;
    float _1488 = fma(_1480, _1404, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1494 = fma(_1486, _1404, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1498 = _1496 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1500;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[170].y;
    if (!_1254)
    {
        float _1506 = in.m_41.z;
        _1504 = _1506;
    }
    float _1508 = _1504;
    bool _1510 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1512 = isnan(_1172);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = fma(_1492, _1396, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1524 = _1220 * _1406;
    float _1526 = fma(_1498, _1396, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1528 = fma(_1502, _1410, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _1530 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1532 = isnan(_1172);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1538 = _1534 || _1536;
    float _1540 = float(_1538);
    float _1542 = fma(_1446, _1410, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1544 = -_1520;
    float _1546 = _1544 + 1.0;
    float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1550 = _1548 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    bool _1552 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1554 = isnan(_1172);
    bool _1556 = _1552 || _1554;
    bool _1558 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1560 = _1556 || _1558;
    float _1562 = float(_1560);
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1568 = -_1540;
    float _1570 = _1568 + 1.0;
    float _1572 = _1540 * _1546;
    float _1574 = _1546;
    if (_1192)
    {
        _1574 = _1230;
    }
    float _1576 = _1574;
    float _1578 = fma(_1550, _1524, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1580 = fma(_1566, _1524, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    bool _1582 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1584 = isnan(_1172);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = _1562 * _1570;
    bool _1596 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1598 = isnan(_1172);
    bool _1600 = _1596 || _1598;
    bool _1602 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1604 = _1600 || _1602;
    float _1606 = float(_1604);
    float _1608 = -_1562;
    float _1610 = _1608 + 1.0;
    float _1612 = _1576;
    if (_1340)
    {
        float _1614 = -_1576;
        float _1616 = _1614 + 1.0;
        _1612 = _1616;
    }
    float _1618 = _1612;
    float _1620 = -_1592;
    float _1622 = _1620 + 1.0;
    float _1624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1626 = -_1606;
    float _1628 = _1626 + 1.0;
    float _1630 = _1592 * _1610;
    float _1632 = _1618;
    if (_1192)
    {
        _1262 = _1618;
    }
    float _1634 = _1262;
    float _1636 = _1606 * _1622;
    float _1638 = _1508;
    if (!_1254)
    {
        _1632 = _1508;
    }
    float _1640 = _1632;
    float _1642 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1644 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1646 = isnan(_1172);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1652 = _1648 || _1650;
    float _1654 = float(_1652);
    float _1656 = _1242 * _1628;
    float _1658 = _1640;
    if (_1254)
    {
        _1658 = _1210;
    }
    float _1660 = _1658;
    float _1662 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_1254)
    {
        _1638 = _1210;
    }
    float _1664 = _1638;
    float _1666 = -_1242;
    float _1668 = _1666 + 1.0;
    float _1670 = -_1360;
    float _1672 = _1670 + 1.0;
    float _1674 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1662);
    float _1676 = _1360 * _1668;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1678;
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1682;
    float _1686 = _1654 * _1672;
    float _1688 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1642);
    float _1690 = fma(_1684, _1474, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1692 = _1462 * _1686;
    float _1694 = _1468 * _1686;
    float _1696 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1698 = _1686;
    if (!_1198)
    {
        _1698 = _128;
    }
    float _1700 = _1698;
    float _1702 = _1700;
    if (_1400)
    {
        float _1704 = -_128;
        float _1706 = _1704 + 1.0;
        _180 = _1706;
    }
    float _1708 = _180;
    float _1710 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1712 = fma(_1696, _1634, -0.5);
    float _1714 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1412);
    float _1716 = -_1654;
    float _1718 = _1716 + 1.0;
    if (_1198)
    {
        _1702 = _1708;
    }
    float _1720 = _1702;
    float _1722 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1436);
    float _1724 = _1624 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1726 = fma(_1680, _1474, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1728 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1692);
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1732 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1710);
    float _1734 = _1434 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1736 = fma(_1724, _1720, -0.5);
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1740 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1742 = fma(_1476, _1676, _1728);
    float _1744 = -_1730;
    float _1746 = fma(_1734, 2.0, _1744);
    float _1748 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1732);
    float _1750 = fma(_1740, -2.0, _1738);
    float _1752 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1368);
    float _1754 = -_100;
    float _1756 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1746);
    float _1758 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1714);
    float _1760 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1750);
    float _1762 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1688);
    float _1764 = _1310 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1766 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1768 = -_1760;
    float _1770 = fma(_1758, _1438, _1768);
    float _1772 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1674);
    float _1774 = _1316 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1776 = _1762 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1778 = _1764 + _1766;
    float _1780 = _1372 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1782 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1694);
    float _1784 = _1772 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1786 = _1774 + _1776;
    float _1788 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1790 = fma(_1482, _1676, _1782);
    float _1792 = _1780 + _1784;
    float _1794 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1796 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1788);
    float _1798 = fma(_1488, _1656, _1742);
    float _1800 = fma(_1494, _1656, _1790);
    float _1802 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1804 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1794);
    float _1806 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1796);
    float _1808 = fma(_1526, _1636, _1800);
    float _1810 = fma(_1522, _1636, _1798);
    float _1812 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1802);
    float _1814 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1804);
    float _1816 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1818 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1820 = fma(_1542, _1630, _1808);
    float _1822 = fma(_1528, _1630, _1810);
    float _1824 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1812);
    float _1826 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1828 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1830 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1832 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1834 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1836 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1818);
    float _1838 = fma(_1580, _1594, _1820);
    float _1840 = fma(_1578, _1594, _1822);
    float _1842 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1844 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1828);
    float _1846 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1830);
    float _1848 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1832);
    float _1850 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1834);
    float _1852 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1836);
    float _1854 = fma(_1722, _1712, _1366);
    float _1856 = fma(_1726, _1572, _1838);
    float _1858 = fma(_1748, _1736, _1756);
    float _1860 = fma(_1690, _1572, _1840);
    float _1862 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1844);
    float _1864 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1846);
    float _1866 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1848);
    float _1868 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1850);
    float _1870 = _1852 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1872 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[174].y, _1856);
    float _1874 = _1466 + 0.5;
    float _1876 = _1854 + 0.5;
    float _1878 = _1770 + 0.5;
    float _1880 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1860);
    float _1882 = _1858 + 0.5;
    float _1884 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1862);
    float _1886 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1864);
    float _1888 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1866);
    float _1890 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1868);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_51.x = _1786;
    out.m_51.y = _1778;
    out.m_51.z = _1792;
    out.m_53.x = _1876;
    out.m_53.y = _1874;
    out.m_53.z = _1882;
    out.m_53.w = _1878;
    out.m_55.x = _1880;
    out.m_55.y = _1872;
    out.gl_Position.x = _1884;
    out.gl_Position.y = _1886;
    out.gl_Position.z = _1888;
    out.gl_Position.w = _1890;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1170 = false;
    bool _858 = false;
    bool _630 = false;
    bool _506 = false;
    bool _278 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_26.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    float _82 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _80;
    if (!_78)
    {
        out.m_29.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _84 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1945 = as_type<float>(_90);
        out.gl_Position.z = _1945;
    }
    if (!_78)
    {
        return out;
    }
    float _92 = in.m_31.w;
    float _94 = float(_74);
    float _96 = 1.0 / _94;
    float _98 = -_92;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_92);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = _100 * _96;
    bool _114 = _100 >= _94;
    bool _116 = !_110;
    bool _118 = _114 || _116;
    out.m_33.x = _112;
    if (_118)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _82;
    if (_118)
    {
        out.m_29.x = 0.0;
    }
    int _122 = 0;
    if (_118)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2015 = as_type<float>(_126);
        out.gl_Position.z = _2015;
    }
    if (_118)
    {
        return out;
    }
    float _128 = in.m_35.x;
    float _130 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _132 = in.m_35.y;
    bool _134 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _136 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _138 = _134 || _136;
    bool _140 = isnan(1.0);
    bool _142 = _138 || _140;
    float _144 = in.m_37.w;
    float _146 = in.m_31.x;
    float _148 = in.m_31.y;
    float _150 = in.m_31.z;
    float _152 = in.m_26.x;
    float _154 = in.m_26.y;
    float _156 = in.m_26.z;
    float _158 = 0.0;
    float _160 = _130;
    if (!_142)
    {
        float _162 = _130 * _130;
        float _164 = _162 * 0.5;
        _158 = _164;
    }
    float _166 = _158;
    float _168 = _166;
    if (!_142)
    {
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _170;
    }
    float _172 = _168;
    out.m_39.x = _128;
    out.m_39.y = _132;
    bool _174 = !_142;
    float _176 = _172;
    float _178 = _132;
    float _180 = _128;
    if (!_174)
    {
        float _182 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = log2(_182);
        float _186 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _188 = _186 + 1.0;
        float _190 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = _130 * _184;
        float _194 = exp2(_192);
        float _196 = _190 * 0.693147182464599609375;
        float _198 = 1.0 / _196;
        float _200 = 1.0 / _188;
        float _202 = _194 + (-1.0);
        float _204 = -_202;
        float _206 = fma(_204, _198, _130);
        float _208 = _206 * _200;
        float _210 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _210;
    }
    float _212 = _176;
    bool _214 = !_142;
    if (!_214)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = 1.0 / _222;
        float _226 = _130 * _218;
        float _228 = exp2(_226);
        float _230 = -_228;
        float _232 = _230 + 1.0;
        float _234 = _232 * _224;
        _160 = _234;
    }
    float _236 = _160;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _240 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _242 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _244 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _246 = fma(_236, _146, _240);
    float _248 = fma(_236, _148, _242);
    float _250 = fma(_236, _150, _244);
    float _252 = fma(_246, _144, _152);
    float _254 = fma(_248, _144, _154);
    float _256 = fma(_250, _144, _156);
    bool _258 = !_238;
    float _276;
    if (!_258)
    {
        float _260 = in.m_41.x;
        float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _264 = _260 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _268 = _266 * _262;
        float _270 = floor(_268);
        float _272 = -_270;
        float _274 = _268 + _272;
        _276 = _274;
        _278 = true;
    }
    else
    {
        _276 = _112;
    }
    _278 = false;
    float _280 = _276;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _280 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = _280 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = _280 + _302;
    float _306 = 1.0 / _292;
    bool _308 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_280);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    bool _320 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _322 = isnan(_280);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _334 = 1.0 / _296;
    float _336 = 1.0 / _300;
    float _338 = _288 * _306;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _344;
    float _348 = _284 * _334;
    bool _350 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _352 = isnan(_280);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _362;
    float _366 = -_360;
    float _368 = _366 + 1.0;
    float _370 = fma(_364, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = _304 * _336;
    float _374 = fma(_342, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = fma(_346, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _378 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _380 = isnan(_280);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = _318 * _368;
    float _392 = -_318;
    float _394 = _392 + 1.0;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _408 = -_388;
    float _410 = _408 + 1.0;
    float _412 = _388 * _394;
    float _414 = fma(_398, _348, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = fma(_402, _348, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_406, _348, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _420 = _330 * _410;
    float _422 = in.m_37.x;
    float _424 = in.m_37.y;
    float _426 = in.m_37.z;
    float _428 = -_330;
    float _430 = _428 + 1.0;
    float _432 = _374 * _420;
    float _434 = _376 * _420;
    float _436 = _370 * _420;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _438;
    float _442 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _432);
    float _444 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _434);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _450;
    float _454 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].z, _436);
    float _456 = fma(_416, _412, _444);
    float _458 = fma(_448, _372, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _460 = fma(_452, _372, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _462 = fma(_418, _412, _454);
    float _464 = fma(_440, _372, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_414, _412, _442);
    float _468 = fma(_458, _390, _456);
    float _470 = fma(_460, _390, _462);
    float _472 = fma(_464, _390, _466);
    float _474 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[146].y, _468);
    float _476 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[146].z, _470);
    float _478 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[146].x, _472);
    float _480 = _474 * _424;
    float _482 = _476 * _426;
    float _484 = _478 * _422;
    bool _486 = !_332;
    float _504;
    if (!_486)
    {
        float _488 = in.m_41.x;
        float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _492 = _488 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _494 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _496 = _494 * _490;
        float _498 = floor(_496);
        float _500 = -_498;
        float _502 = _496 + _500;
        _504 = _502;
        _506 = true;
    }
    else
    {
        _504 = _112;
    }
    _506 = false;
    float _508 = _504;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _512 = _508 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _518 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _520 = isnan(_508);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _534 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _536 = isnan(_508);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _546;
    bool _550 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _552 = isnan(_508);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = 1.0 / _516;
    float _564 = -_528;
    float _566 = _564 + 1.0;
    bool _568 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _570 = _544 * _566;
    float _572 = -_544;
    float _574 = _572 + 1.0;
    float _576 = 1.0 / _532;
    float _578 = _548 * _562;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _584 = fma(_578, _512, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _586 = _582 * _576;
    float _588 = _584 * _570;
    float _590 = -_560;
    float _592 = _590 + 1.0;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _596 = _508 + _594;
    float _598 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[115].x, _588);
    float _600 = _528 * _592;
    float _602 = fma(_586, _596, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _604 = fma(_602, _600, _598);
    float _606 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[117].x, _604);
    float _608 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.w = _608;
    bool _610 = !_568;
    float _628;
    if (!_610)
    {
        float _612 = in.m_41.x;
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _616 = _612 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _620 = _618 * _614;
        float _622 = floor(_620);
        float _624 = -_622;
        float _626 = _620 + _624;
        _628 = _626;
        _630 = true;
    }
    else
    {
        _628 = _112;
    }
    _630 = false;
    float _632 = _628;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _636 = _632 + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _640 = _632 + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _644 = _632 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _658 = 1.0 / _648;
    bool _660 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _662 = isnan(_632);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = 1.0 / _652;
    bool _674 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _676 = 1.0 / _656;
    bool _678 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _680 = isnan(_632);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = _636 * _658;
    bool _692 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _694 = isnan(_632);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = -_688;
    float _706 = _704 + 1.0;
    float _708 = _640 * _672;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _710;
    float _714 = -_702;
    float _716 = _714 + 1.0;
    float _718 = _702 * _706;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _724 = fma(_712, _708, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _730 = _644 * _676;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _732;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _736;
    float _740 = _670 * _716;
    float _742 = -_670;
    float _744 = _742 + 1.0;
    float _746 = fma(_734, _708, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _748 = fma(_738, _708, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _750 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _752 = isnan(_632);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _766 = fma(_722, _730, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _768 = fma(_728, _730, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _770 = _760 * _744;
    float _772 = fma(_764, _730, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _774 = -_760;
    float _776 = _774 + 1.0;
    float _778 = _724 * _770;
    float _780 = _746 * _770;
    float _782 = _748 * _770;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _784;
    float _788 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[123].x, _778);
    float _790 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[123].y, _780);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _796;
    float _800 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[123].z, _782);
    float _802 = fma(_786, _690, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _804 = fma(_772, _740, _788);
    float _806 = fma(_794, _690, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _808 = fma(_798, _690, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _810 = fma(_766, _740, _790);
    float _812 = fma(_768, _740, _800);
    float _814 = fma(_802, _718, _804);
    float _816 = fma(_806, _718, _810);
    float _818 = fma(_808, _718, _812);
    float _820 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[126].x, _814);
    float _822 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[126].y, _816);
    float _824 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[126].z, _818);
    float _826 = _820 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _828 = _822 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _830 = _824 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _832 = _826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _834 = _828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _836 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _832;
    out.m_45.y = _834;
    out.m_45.z = _836;
    bool _838 = !_674;
    float _856;
    if (!_838)
    {
        float _840 = in.m_41.x;
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _844 = _840 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[14].x, _100);
        float _848 = _846 * _842;
        float _850 = floor(_848);
        float _852 = -_850;
        float _854 = _848 + _852;
        _856 = _854;
        _858 = true;
    }
    else
    {
        _856 = _112;
    }
    _858 = false;
    float _860 = _856;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _864 = _860 + _862;
    bool _866 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _868 = isnan(_860);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _874 = _870 || _872;
    float _876 = float(_874);
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _882 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _884 = isnan(_860);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _894;
    float _898 = 1.0 / _880;
    bool _900 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _902 = isnan(_860);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    bool _912 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _914 = isnan(_860);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _928 = 1.0 / _926;
    float _930 = -_876;
    float _932 = _930 + 1.0;
    bool _934 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _936 = _896 * _898;
    bool _938 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _940 = isnan(_860);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = -_892;
    float _952 = _950 + 1.0;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _958 = fma(_936, _864, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _960 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _962 = isnan(_860);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = -_948;
    float _974 = _972 + 1.0;
    float _976 = _948 * _932;
    float _978 = _876 * _952;
    float _980 = _910 * _974;
    float _982 = -_910;
    float _984 = _982 + 1.0;
    float _986 = 1.0 / _956;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _992 = _922 * _984;
    float _994 = -_922;
    float _996 = _994 + 1.0;
    bool _998 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1000 = isnan(_860);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = _970 * _996;
    float _1012 = -_970;
    float _1014 = _1012 + 1.0;
    float _1016 = 1.0 / _990;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1022;
    float _1026 = _1008 * _1014;
    float _1028 = _1020 * _928;
    float _1030 = -_1008;
    float _1032 = _1030 + 1.0;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1038 = _958 * _1026;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1046 = _860 + _1044;
    float _1048 = 1.0 / _1036;
    float _1050 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1038);
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1056 = fma(_1028, _1046, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1058 = _1024 * _1016;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1062 = _860 + _1060;
    float _1064 = fma(_1056, _1010, _1050);
    float _1066 = 1.0 / _1042;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1072 = fma(_1058, _1062, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1080 = _860 + _1078;
    float _1082 = _1070 * _986;
    float _1084 = fma(_1072, _992, _1064);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1088 = _860 + _1086;
    float _1090 = 1.0 / _1054;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1094 = _1092 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1096 = _1076 * _1048;
    float _1098 = fma(_1082, _1080, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1102 = _860 + _1100;
    float _1104 = fma(_1096, _1088, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1106 = _1094 * _1066;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1108;
    bool _1112 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1114 = isnan(_860);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = fma(_1098, _980, _1084);
    float _1126 = fma(_1106, _1102, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1130 = _860 + _1128;
    float _1132 = -_1122;
    float _1134 = _1132 + 1.0;
    float _1136 = _1110 * _1090;
    float _1138 = fma(_1104, _976, _1124);
    float _1140 = _892 * _1134;
    float _1142 = fma(_1136, _1130, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1144 = fma(_1126, _978, _1138);
    float _1146 = fma(_1142, _1140, _1144);
    float _1148 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1146);
    out.m_47.x = _1148;
    bool _1150 = !_934;
    float _1168;
    if (!_1150)
    {
        float _1152 = in.m_41.x;
        float _1154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1156 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[14].y, _100);
        float _1160 = _1158 * _1154;
        float _1162 = floor(_1160);
        float _1164 = -_1162;
        float _1166 = _1160 + _1164;
        _1168 = _1166;
        _1170 = true;
    }
    else
    {
        _1168 = _112;
    }
    _1170 = false;
    float _1172 = _1168;
    float _1174 = in.m_41.w;
    float _1176 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1178 = in.m_49.x;
    float _1180 = in.m_49.y;
    float _1182 = in.m_49.z;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1186 = _1184 != 0;
    float _1188 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1176);
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1192 = _1190 != 0;
    float _1194 = in.m_41.x;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1198 = _1196 != 0;
    float _1200 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1204 = _1202 != 0;
    float _1206 = in.m_35.w;
    float _1208 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1200);
    float _1210 = in.m_41.y;
    float _1212 = -_132;
    float _1214 = _1212 + 1.0;
    float _1216 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1220 = _1172 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1230 = in.m_35.z;
    bool _1232 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1234 = isnan(_1172);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1246 = _1174 > 0.5;
    float _1248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1180);
    float _1250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1178);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1254 = _1252 != 0;
    float _1256 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1258 = 1.0 / _1224;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1262 = _1230;
    if (_1186)
    {
        float _1264 = _1246 ? _1214 : _132;
        _178 = _1264;
    }
    float _1266 = _178;
    float _1268 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1256);
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1276 = _1274 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1278 = -_1206;
    float _1280 = _1278 + 1.0;
    float _1282 = 1.0 / _1272;
    bool _1284 = _1210 > 0.5;
    float _1286 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1290 = _1206;
    if (_1204)
    {
        float _1292 = _1284 ? _1280 : _1206;
        _1290 = _1292;
    }
    float _1294 = _1290;
    float _1296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1182);
    float _1298 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1300 = 1.0 / _1228;
    float _1302 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1304 = fma(_1286, -2.0, _1288);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1306;
    float _1310 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1208);
    float _1312 = -_1260;
    float _1314 = fma(_1302, 2.0, _1312);
    float _1316 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1268);
    float _1318 = _1208;
    if (_1198)
    {
        float _1320 = in.m_41.z;
        _1318 = _1320;
    }
    float _1322 = _1318;
    float _1324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1326 = _1216 * _1250;
    float _1328 = _1298 * _1248;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1332 = _1172 + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1338 = _1194 > 0.5;
    bool _1340 = _1338 && _1192;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1344 = _1172 + _1342;
    float _1346 = _1332 * _1258;
    float _1348 = 1.0 / _1276;
    bool _1350 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1352 = isnan(_1172);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1358 = _1354 || _1356;
    float _1360 = float(_1358);
    float _1362 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1364 = -_100;
    float _1366 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1314);
    float _1368 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1362);
    float _1370 = 1.0 / _1308;
    float _1372 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1188);
    float _1374 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1378 = _1172 + _1376;
    float _1380 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1382 = _1374 * _1296;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1386 = _1172 + _1384;
    float _1388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1392 = _1172 + _1390;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1396 = _1386 * _1348;
    bool _1398 = _1322 > 0.5;
    bool _1400 = _1398 && _1198;
    float _1402 = _1392 * _1300;
    float _1404 = _1378 * _1282;
    float _1406 = 1.0 / _1336;
    float _1408 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1394);
    float _1410 = _1344 * _1370;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1414;
    float _1418 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1408);
    float _1420 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1422 = fma(_1380, _1294, -0.5);
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_1254)
    {
        _1426 = _1210;
    }
    float _1428 = _1426;
    float _1430 = 1.0 / _1416;
    float _1432 = _1428;
    if (_1254)
    {
        _1432 = _1194;
    }
    float _1434 = _1432;
    float _1436 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1424);
    float _1438 = fma(_1420, _1266, -0.5);
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1442 = _1172 + _1440;
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1444;
    float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1448;
    float _1452 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1304);
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1460 = _1458 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1462 = fma(_1450, _1346, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1464 = -_1452;
    float _1466 = fma(_1418, _1422, _1464);
    float _1468 = fma(_1456, _1346, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1472 = _1470 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1474 = _1442 * _1430;
    float _1476 = fma(_1460, _1402, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1478;
    float _1482 = fma(_1472, _1402, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1484;
    float _1488 = fma(_1480, _1404, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1494 = fma(_1486, _1404, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1498 = _1496 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1500;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[170].y;
    if (!_1254)
    {
        float _1506 = in.m_41.z;
        _1504 = _1506;
    }
    float _1508 = _1504;
    bool _1510 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1512 = isnan(_1172);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = fma(_1492, _1396, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1524 = _1220 * _1406;
    float _1526 = fma(_1498, _1396, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1528 = fma(_1502, _1410, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _1530 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1532 = isnan(_1172);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1538 = _1534 || _1536;
    float _1540 = float(_1538);
    float _1542 = fma(_1446, _1410, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1544 = -_1520;
    float _1546 = _1544 + 1.0;
    float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1550 = _1548 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    bool _1552 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1554 = isnan(_1172);
    bool _1556 = _1552 || _1554;
    bool _1558 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1560 = _1556 || _1558;
    float _1562 = float(_1560);
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1568 = -_1540;
    float _1570 = _1568 + 1.0;
    float _1572 = _1540 * _1546;
    float _1574 = _1546;
    if (_1192)
    {
        _1574 = _1230;
    }
    float _1576 = _1574;
    float _1578 = fma(_1550, _1524, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1580 = fma(_1566, _1524, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    bool _1582 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1584 = isnan(_1172);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = _1562 * _1570;
    bool _1596 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1598 = isnan(_1172);
    bool _1600 = _1596 || _1598;
    bool _1602 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1604 = _1600 || _1602;
    float _1606 = float(_1604);
    float _1608 = -_1562;
    float _1610 = _1608 + 1.0;
    float _1612 = _1576;
    if (_1340)
    {
        float _1614 = -_1576;
        float _1616 = _1614 + 1.0;
        _1612 = _1616;
    }
    float _1618 = _1612;
    float _1620 = -_1592;
    float _1622 = _1620 + 1.0;
    float _1624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1626 = -_1606;
    float _1628 = _1626 + 1.0;
    float _1630 = _1592 * _1610;
    float _1632 = _1618;
    if (_1192)
    {
        _1262 = _1618;
    }
    float _1634 = _1262;
    float _1636 = _1606 * _1622;
    float _1638 = _1508;
    if (!_1254)
    {
        _1632 = _1508;
    }
    float _1640 = _1632;
    float _1642 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1644 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1646 = isnan(_1172);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1652 = _1648 || _1650;
    float _1654 = float(_1652);
    float _1656 = _1242 * _1628;
    float _1658 = _1640;
    if (_1254)
    {
        _1658 = _1210;
    }
    float _1660 = _1658;
    float _1662 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_1254)
    {
        _1638 = _1210;
    }
    float _1664 = _1638;
    float _1666 = -_1242;
    float _1668 = _1666 + 1.0;
    float _1670 = -_1360;
    float _1672 = _1670 + 1.0;
    float _1674 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1662);
    float _1676 = _1360 * _1668;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1678;
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1682;
    float _1686 = _1654 * _1672;
    float _1688 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1642);
    float _1690 = fma(_1684, _1474, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1692 = _1462 * _1686;
    float _1694 = _1468 * _1686;
    float _1696 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1698 = _1686;
    if (!_1198)
    {
        _1698 = _128;
    }
    float _1700 = _1698;
    float _1702 = _1700;
    if (_1400)
    {
        float _1704 = -_128;
        float _1706 = _1704 + 1.0;
        _180 = _1706;
    }
    float _1708 = _180;
    float _1710 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1712 = fma(_1696, _1634, -0.5);
    float _1714 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1412);
    float _1716 = -_1654;
    float _1718 = _1716 + 1.0;
    if (_1198)
    {
        _1702 = _1708;
    }
    float _1720 = _1702;
    float _1722 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1436);
    float _1724 = _1624 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1726 = fma(_1680, _1474, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1728 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1692);
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1732 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1710);
    float _1734 = _1434 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1736 = fma(_1724, _1720, -0.5);
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1740 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1742 = fma(_1476, _1676, _1728);
    float _1744 = -_1730;
    float _1746 = fma(_1734, 2.0, _1744);
    float _1748 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1732);
    float _1750 = fma(_1740, -2.0, _1738);
    float _1752 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1368);
    float _1754 = -_100;
    float _1756 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1746);
    float _1758 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1714);
    float _1760 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1750);
    float _1762 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1688);
    float _1764 = _1310 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1766 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1768 = -_1760;
    float _1770 = fma(_1758, _1438, _1768);
    float _1772 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1674);
    float _1774 = _1316 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1776 = _1762 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1778 = _1764 + _1766;
    float _1780 = _1372 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1782 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1694);
    float _1784 = _1772 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1786 = _1774 + _1776;
    float _1788 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1790 = fma(_1482, _1676, _1782);
    float _1792 = _1780 + _1784;
    float _1794 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1796 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1788);
    float _1798 = fma(_1488, _1656, _1742);
    float _1800 = fma(_1494, _1656, _1790);
    float _1802 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1804 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1794);
    float _1806 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1796);
    float _1808 = fma(_1526, _1636, _1800);
    float _1810 = fma(_1522, _1636, _1798);
    float _1812 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1802);
    float _1814 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1804);
    float _1816 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1818 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1820 = fma(_1542, _1630, _1808);
    float _1822 = fma(_1528, _1630, _1810);
    float _1824 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1812);
    float _1826 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1828 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1830 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1832 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1834 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1836 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1818);
    float _1838 = fma(_1580, _1594, _1820);
    float _1840 = fma(_1578, _1594, _1822);
    float _1842 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1844 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1828);
    float _1846 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1830);
    float _1848 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1832);
    float _1850 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1834);
    float _1852 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1836);
    float _1854 = fma(_1722, _1712, _1366);
    float _1856 = fma(_1726, _1572, _1838);
    float _1858 = fma(_1748, _1736, _1756);
    float _1860 = fma(_1690, _1572, _1840);
    float _1862 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1844);
    float _1864 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1846);
    float _1866 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1848);
    float _1868 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1850);
    float _1870 = _1852 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1872 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[174].y, _1856);
    float _1874 = _1466 + 0.5;
    float _1876 = _1854 + 0.5;
    float _1878 = _1770 + 0.5;
    float _1880 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1860);
    float _1882 = _1858 + 0.5;
    float _1884 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1862);
    float _1886 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1864);
    float _1888 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1866);
    float _1890 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1868);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_51.x = _1786;
    out.m_51.y = _1778;
    out.m_51.z = _1792;
    out.m_53.x = _1876;
    out.m_53.y = _1874;
    out.m_53.z = _1882;
    out.m_53.w = _1878;
    out.m_55.x = _1880;
    out.m_55.y = _1872;
    out.gl_Position.x = _1884;
    out.gl_Position.y = _1886;
    out.gl_Position.z = _1888;
    out.gl_Position.w = _1890;
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
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1170 = false;
    bool _858 = false;
    bool _630 = false;
    bool _506 = false;
    bool _278 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_26.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    float _82 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _80;
    if (!_78)
    {
        out.m_29.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _84 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1945 = as_type<float>(_90);
        out.gl_Position.z = _1945;
    }
    if (!_78)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _92 = in.m_31.w;
    float _94 = float(_74);
    float _96 = 1.0 / _94;
    float _98 = -_92;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_92);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = _100 * _96;
    bool _114 = _100 >= _94;
    bool _116 = !_110;
    bool _118 = _114 || _116;
    out.m_33.x = _112;
    if (_118)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _82;
    if (_118)
    {
        out.m_29.x = 0.0;
    }
    int _122 = 0;
    if (_118)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2015 = as_type<float>(_126);
        out.gl_Position.z = _2015;
    }
    if (_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_35.x;
    float _130 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _132 = in.m_35.y;
    bool _134 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _136 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _138 = _134 || _136;
    bool _140 = isnan(1.0);
    bool _142 = _138 || _140;
    float _144 = in.m_37.w;
    float _146 = in.m_31.x;
    float _148 = in.m_31.y;
    float _150 = in.m_31.z;
    float _152 = in.m_26.x;
    float _154 = in.m_26.y;
    float _156 = in.m_26.z;
    float _158 = 0.0;
    float _160 = _130;
    if (!_142)
    {
        float _162 = _130 * _130;
        float _164 = _162 * 0.5;
        _158 = _164;
    }
    float _166 = _158;
    float _168 = _166;
    if (!_142)
    {
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _170;
    }
    float _172 = _168;
    out.m_39.x = _128;
    out.m_39.y = _132;
    bool _174 = !_142;
    float _176 = _172;
    float _178 = _132;
    float _180 = _128;
    if (!_174)
    {
        float _182 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = log2(_182);
        float _186 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _188 = _186 + 1.0;
        float _190 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = _130 * _184;
        float _194 = exp2(_192);
        float _196 = _190 * 0.693147182464599609375;
        float _198 = 1.0 / _196;
        float _200 = 1.0 / _188;
        float _202 = _194 + (-1.0);
        float _204 = -_202;
        float _206 = fma(_204, _198, _130);
        float _208 = _206 * _200;
        float _210 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _210;
    }
    float _212 = _176;
    bool _214 = !_142;
    if (!_214)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = 1.0 / _222;
        float _226 = _130 * _218;
        float _228 = exp2(_226);
        float _230 = -_228;
        float _232 = _230 + 1.0;
        float _234 = _232 * _224;
        _160 = _234;
    }
    float _236 = _160;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _240 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _242 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _244 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _246 = fma(_236, _146, _240);
    float _248 = fma(_236, _148, _242);
    float _250 = fma(_236, _150, _244);
    float _252 = fma(_246, _144, _152);
    float _254 = fma(_248, _144, _154);
    float _256 = fma(_250, _144, _156);
    bool _258 = !_238;
    float _276;
    if (!_258)
    {
        float _260 = in.m_41.x;
        float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _264 = _260 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _268 = _266 * _262;
        float _270 = floor(_268);
        float _272 = -_270;
        float _274 = _268 + _272;
        _276 = _274;
        _278 = true;
    }
    else
    {
        _276 = _112;
    }
    _278 = false;
    float _280 = _276;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _280 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = _280 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = _280 + _302;
    float _306 = 1.0 / _292;
    bool _308 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_280);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    bool _320 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _322 = isnan(_280);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _334 = 1.0 / _296;
    float _336 = 1.0 / _300;
    float _338 = _288 * _306;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _344;
    float _348 = _284 * _334;
    bool _350 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _352 = isnan(_280);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _362;
    float _366 = -_360;
    float _368 = _366 + 1.0;
    float _370 = fma(_364, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = _304 * _336;
    float _374 = fma(_342, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = fma(_346, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _378 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _380 = isnan(_280);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = _318 * _368;
    float _392 = -_318;
    float _394 = _392 + 1.0;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _408 = -_388;
    float _410 = _408 + 1.0;
    float _412 = _388 * _394;
    float _414 = fma(_398, _348, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = fma(_402, _348, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_406, _348, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _420 = _330 * _410;
    float _422 = in.m_37.x;
    float _424 = in.m_37.y;
    float _426 = in.m_37.z;
    float _428 = -_330;
    float _430 = _428 + 1.0;
    float _432 = _374 * _420;
    float _434 = _376 * _420;
    float _436 = _370 * _420;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _438;
    float _442 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _432);
    float _444 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _434);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _450;
    float _454 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].z, _436);
    float _456 = fma(_416, _412, _444);
    float _458 = fma(_448, _372, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _460 = fma(_452, _372, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _462 = fma(_418, _412, _454);
    float _464 = fma(_440, _372, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_414, _412, _442);
    float _468 = fma(_458, _390, _456);
    float _470 = fma(_460, _390, _462);
    float _472 = fma(_464, _390, _466);
    float _474 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[146].y, _468);
    float _476 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[146].z, _470);
    float _478 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[146].x, _472);
    float _480 = _474 * _424;
    float _482 = _476 * _426;
    float _484 = _478 * _422;
    bool _486 = !_332;
    float _504;
    if (!_486)
    {
        float _488 = in.m_41.x;
        float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _492 = _488 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _494 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _496 = _494 * _490;
        float _498 = floor(_496);
        float _500 = -_498;
        float _502 = _496 + _500;
        _504 = _502;
        _506 = true;
    }
    else
    {
        _504 = _112;
    }
    _506 = false;
    float _508 = _504;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _512 = _508 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _518 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _520 = isnan(_508);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _534 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _536 = isnan(_508);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _546;
    bool _550 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _552 = isnan(_508);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = 1.0 / _516;
    float _564 = -_528;
    float _566 = _564 + 1.0;
    bool _568 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _570 = _544 * _566;
    float _572 = -_544;
    float _574 = _572 + 1.0;
    float _576 = 1.0 / _532;
    float _578 = _548 * _562;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _584 = fma(_578, _512, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _586 = _582 * _576;
    float _588 = _584 * _570;
    float _590 = -_560;
    float _592 = _590 + 1.0;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _596 = _508 + _594;
    float _598 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[115].x, _588);
    float _600 = _528 * _592;
    float _602 = fma(_586, _596, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _604 = fma(_602, _600, _598);
    float _606 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[117].x, _604);
    float _608 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.w = _608;
    bool _610 = !_568;
    float _628;
    if (!_610)
    {
        float _612 = in.m_41.x;
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _616 = _612 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _620 = _618 * _614;
        float _622 = floor(_620);
        float _624 = -_622;
        float _626 = _620 + _624;
        _628 = _626;
        _630 = true;
    }
    else
    {
        _628 = _112;
    }
    _630 = false;
    float _632 = _628;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _636 = _632 + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _640 = _632 + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _644 = _632 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _658 = 1.0 / _648;
    bool _660 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _662 = isnan(_632);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = 1.0 / _652;
    bool _674 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _676 = 1.0 / _656;
    bool _678 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _680 = isnan(_632);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = _636 * _658;
    bool _692 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _694 = isnan(_632);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = -_688;
    float _706 = _704 + 1.0;
    float _708 = _640 * _672;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _710;
    float _714 = -_702;
    float _716 = _714 + 1.0;
    float _718 = _702 * _706;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _724 = fma(_712, _708, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _730 = _644 * _676;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _732;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _736;
    float _740 = _670 * _716;
    float _742 = -_670;
    float _744 = _742 + 1.0;
    float _746 = fma(_734, _708, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _748 = fma(_738, _708, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _750 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _752 = isnan(_632);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _766 = fma(_722, _730, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _768 = fma(_728, _730, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _770 = _760 * _744;
    float _772 = fma(_764, _730, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _774 = -_760;
    float _776 = _774 + 1.0;
    float _778 = _724 * _770;
    float _780 = _746 * _770;
    float _782 = _748 * _770;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _784;
    float _788 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[123].x, _778);
    float _790 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[123].y, _780);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _796;
    float _800 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[123].z, _782);
    float _802 = fma(_786, _690, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _804 = fma(_772, _740, _788);
    float _806 = fma(_794, _690, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _808 = fma(_798, _690, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _810 = fma(_766, _740, _790);
    float _812 = fma(_768, _740, _800);
    float _814 = fma(_802, _718, _804);
    float _816 = fma(_806, _718, _810);
    float _818 = fma(_808, _718, _812);
    float _820 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[126].x, _814);
    float _822 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[126].y, _816);
    float _824 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[126].z, _818);
    float _826 = _820 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _828 = _822 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _830 = _824 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _832 = _826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _834 = _828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _836 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _832;
    out.m_45.y = _834;
    out.m_45.z = _836;
    bool _838 = !_674;
    float _856;
    if (!_838)
    {
        float _840 = in.m_41.x;
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _844 = _840 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[14].x, _100);
        float _848 = _846 * _842;
        float _850 = floor(_848);
        float _852 = -_850;
        float _854 = _848 + _852;
        _856 = _854;
        _858 = true;
    }
    else
    {
        _856 = _112;
    }
    _858 = false;
    float _860 = _856;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _864 = _860 + _862;
    bool _866 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _868 = isnan(_860);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _874 = _870 || _872;
    float _876 = float(_874);
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _882 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _884 = isnan(_860);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _894;
    float _898 = 1.0 / _880;
    bool _900 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _902 = isnan(_860);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    bool _912 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _914 = isnan(_860);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _928 = 1.0 / _926;
    float _930 = -_876;
    float _932 = _930 + 1.0;
    bool _934 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _936 = _896 * _898;
    bool _938 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _940 = isnan(_860);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = -_892;
    float _952 = _950 + 1.0;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _958 = fma(_936, _864, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _960 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _962 = isnan(_860);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = -_948;
    float _974 = _972 + 1.0;
    float _976 = _948 * _932;
    float _978 = _876 * _952;
    float _980 = _910 * _974;
    float _982 = -_910;
    float _984 = _982 + 1.0;
    float _986 = 1.0 / _956;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _992 = _922 * _984;
    float _994 = -_922;
    float _996 = _994 + 1.0;
    bool _998 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1000 = isnan(_860);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = _970 * _996;
    float _1012 = -_970;
    float _1014 = _1012 + 1.0;
    float _1016 = 1.0 / _990;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1022;
    float _1026 = _1008 * _1014;
    float _1028 = _1020 * _928;
    float _1030 = -_1008;
    float _1032 = _1030 + 1.0;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1038 = _958 * _1026;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1046 = _860 + _1044;
    float _1048 = 1.0 / _1036;
    float _1050 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1038);
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1056 = fma(_1028, _1046, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1058 = _1024 * _1016;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1062 = _860 + _1060;
    float _1064 = fma(_1056, _1010, _1050);
    float _1066 = 1.0 / _1042;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1072 = fma(_1058, _1062, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1080 = _860 + _1078;
    float _1082 = _1070 * _986;
    float _1084 = fma(_1072, _992, _1064);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1088 = _860 + _1086;
    float _1090 = 1.0 / _1054;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1094 = _1092 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1096 = _1076 * _1048;
    float _1098 = fma(_1082, _1080, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1102 = _860 + _1100;
    float _1104 = fma(_1096, _1088, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1106 = _1094 * _1066;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1108;
    bool _1112 = _860 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1114 = isnan(_860);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = fma(_1098, _980, _1084);
    float _1126 = fma(_1106, _1102, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1130 = _860 + _1128;
    float _1132 = -_1122;
    float _1134 = _1132 + 1.0;
    float _1136 = _1110 * _1090;
    float _1138 = fma(_1104, _976, _1124);
    float _1140 = _892 * _1134;
    float _1142 = fma(_1136, _1130, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1144 = fma(_1126, _978, _1138);
    float _1146 = fma(_1142, _1140, _1144);
    float _1148 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1146);
    out.m_47.x = _1148;
    bool _1150 = !_934;
    float _1168;
    if (!_1150)
    {
        float _1152 = in.m_41.x;
        float _1154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1156 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[14].y, _100);
        float _1160 = _1158 * _1154;
        float _1162 = floor(_1160);
        float _1164 = -_1162;
        float _1166 = _1160 + _1164;
        _1168 = _1166;
        _1170 = true;
    }
    else
    {
        _1168 = _112;
    }
    _1170 = false;
    float _1172 = _1168;
    float _1174 = in.m_41.w;
    float _1176 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1178 = in.m_49.x;
    float _1180 = in.m_49.y;
    float _1182 = in.m_49.z;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1186 = _1184 != 0;
    float _1188 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1176);
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1192 = _1190 != 0;
    float _1194 = in.m_41.x;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1198 = _1196 != 0;
    float _1200 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1204 = _1202 != 0;
    float _1206 = in.m_35.w;
    float _1208 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1200);
    float _1210 = in.m_41.y;
    float _1212 = -_132;
    float _1214 = _1212 + 1.0;
    float _1216 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1220 = _1172 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1230 = in.m_35.z;
    bool _1232 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1234 = isnan(_1172);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1246 = _1174 > 0.5;
    float _1248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1180);
    float _1250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1178);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1254 = _1252 != 0;
    float _1256 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1258 = 1.0 / _1224;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1262 = _1230;
    if (_1186)
    {
        float _1264 = _1246 ? _1214 : _132;
        _178 = _1264;
    }
    float _1266 = _178;
    float _1268 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1256);
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1276 = _1274 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1278 = -_1206;
    float _1280 = _1278 + 1.0;
    float _1282 = 1.0 / _1272;
    bool _1284 = _1210 > 0.5;
    float _1286 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1290 = _1206;
    if (_1204)
    {
        float _1292 = _1284 ? _1280 : _1206;
        _1290 = _1292;
    }
    float _1294 = _1290;
    float _1296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1182);
    float _1298 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1300 = 1.0 / _1228;
    float _1302 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1304 = fma(_1286, -2.0, _1288);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1306;
    float _1310 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1208);
    float _1312 = -_1260;
    float _1314 = fma(_1302, 2.0, _1312);
    float _1316 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1268);
    float _1318 = _1208;
    if (_1198)
    {
        float _1320 = in.m_41.z;
        _1318 = _1320;
    }
    float _1322 = _1318;
    float _1324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1326 = _1216 * _1250;
    float _1328 = _1298 * _1248;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1332 = _1172 + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1338 = _1194 > 0.5;
    bool _1340 = _1338 && _1192;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1344 = _1172 + _1342;
    float _1346 = _1332 * _1258;
    float _1348 = 1.0 / _1276;
    bool _1350 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1352 = isnan(_1172);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1358 = _1354 || _1356;
    float _1360 = float(_1358);
    float _1362 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1364 = -_100;
    float _1366 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1314);
    float _1368 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1362);
    float _1370 = 1.0 / _1308;
    float _1372 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1188);
    float _1374 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1378 = _1172 + _1376;
    float _1380 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1382 = _1374 * _1296;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1386 = _1172 + _1384;
    float _1388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1392 = _1172 + _1390;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1396 = _1386 * _1348;
    bool _1398 = _1322 > 0.5;
    bool _1400 = _1398 && _1198;
    float _1402 = _1392 * _1300;
    float _1404 = _1378 * _1282;
    float _1406 = 1.0 / _1336;
    float _1408 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1394);
    float _1410 = _1344 * _1370;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1414;
    float _1418 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1408);
    float _1420 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1422 = fma(_1380, _1294, -0.5);
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_1254)
    {
        _1426 = _1210;
    }
    float _1428 = _1426;
    float _1430 = 1.0 / _1416;
    float _1432 = _1428;
    if (_1254)
    {
        _1432 = _1194;
    }
    float _1434 = _1432;
    float _1436 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1424);
    float _1438 = fma(_1420, _1266, -0.5);
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1442 = _1172 + _1440;
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1444;
    float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1448;
    float _1452 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1304);
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1460 = _1458 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1462 = fma(_1450, _1346, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1464 = -_1452;
    float _1466 = fma(_1418, _1422, _1464);
    float _1468 = fma(_1456, _1346, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1472 = _1470 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1474 = _1442 * _1430;
    float _1476 = fma(_1460, _1402, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1478;
    float _1482 = fma(_1472, _1402, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1484;
    float _1488 = fma(_1480, _1404, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1494 = fma(_1486, _1404, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1498 = _1496 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1500;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[170].y;
    if (!_1254)
    {
        float _1506 = in.m_41.z;
        _1504 = _1506;
    }
    float _1508 = _1504;
    bool _1510 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1512 = isnan(_1172);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = fma(_1492, _1396, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1524 = _1220 * _1406;
    float _1526 = fma(_1498, _1396, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1528 = fma(_1502, _1410, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _1530 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1532 = isnan(_1172);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1538 = _1534 || _1536;
    float _1540 = float(_1538);
    float _1542 = fma(_1446, _1410, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1544 = -_1520;
    float _1546 = _1544 + 1.0;
    float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1550 = _1548 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    bool _1552 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1554 = isnan(_1172);
    bool _1556 = _1552 || _1554;
    bool _1558 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1560 = _1556 || _1558;
    float _1562 = float(_1560);
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1568 = -_1540;
    float _1570 = _1568 + 1.0;
    float _1572 = _1540 * _1546;
    float _1574 = _1546;
    if (_1192)
    {
        _1574 = _1230;
    }
    float _1576 = _1574;
    float _1578 = fma(_1550, _1524, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1580 = fma(_1566, _1524, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    bool _1582 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1584 = isnan(_1172);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = _1562 * _1570;
    bool _1596 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1598 = isnan(_1172);
    bool _1600 = _1596 || _1598;
    bool _1602 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1604 = _1600 || _1602;
    float _1606 = float(_1604);
    float _1608 = -_1562;
    float _1610 = _1608 + 1.0;
    float _1612 = _1576;
    if (_1340)
    {
        float _1614 = -_1576;
        float _1616 = _1614 + 1.0;
        _1612 = _1616;
    }
    float _1618 = _1612;
    float _1620 = -_1592;
    float _1622 = _1620 + 1.0;
    float _1624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1626 = -_1606;
    float _1628 = _1626 + 1.0;
    float _1630 = _1592 * _1610;
    float _1632 = _1618;
    if (_1192)
    {
        _1262 = _1618;
    }
    float _1634 = _1262;
    float _1636 = _1606 * _1622;
    float _1638 = _1508;
    if (!_1254)
    {
        _1632 = _1508;
    }
    float _1640 = _1632;
    float _1642 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1644 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1646 = isnan(_1172);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1652 = _1648 || _1650;
    float _1654 = float(_1652);
    float _1656 = _1242 * _1628;
    float _1658 = _1640;
    if (_1254)
    {
        _1658 = _1210;
    }
    float _1660 = _1658;
    float _1662 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_1254)
    {
        _1638 = _1210;
    }
    float _1664 = _1638;
    float _1666 = -_1242;
    float _1668 = _1666 + 1.0;
    float _1670 = -_1360;
    float _1672 = _1670 + 1.0;
    float _1674 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1662);
    float _1676 = _1360 * _1668;
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1678;
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1682;
    float _1686 = _1654 * _1672;
    float _1688 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1642);
    float _1690 = fma(_1684, _1474, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1692 = _1462 * _1686;
    float _1694 = _1468 * _1686;
    float _1696 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1698 = _1686;
    if (!_1198)
    {
        _1698 = _128;
    }
    float _1700 = _1698;
    float _1702 = _1700;
    if (_1400)
    {
        float _1704 = -_128;
        float _1706 = _1704 + 1.0;
        _180 = _1706;
    }
    float _1708 = _180;
    float _1710 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1712 = fma(_1696, _1634, -0.5);
    float _1714 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1412);
    float _1716 = -_1654;
    float _1718 = _1716 + 1.0;
    if (_1198)
    {
        _1702 = _1708;
    }
    float _1720 = _1702;
    float _1722 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1436);
    float _1724 = _1624 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1726 = fma(_1680, _1474, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1728 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1692);
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1732 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1710);
    float _1734 = _1434 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1736 = fma(_1724, _1720, -0.5);
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1740 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1742 = fma(_1476, _1676, _1728);
    float _1744 = -_1730;
    float _1746 = fma(_1734, 2.0, _1744);
    float _1748 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1732);
    float _1750 = fma(_1740, -2.0, _1738);
    float _1752 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1368);
    float _1754 = -_100;
    float _1756 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1746);
    float _1758 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1714);
    float _1760 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1750);
    float _1762 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1688);
    float _1764 = _1310 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1766 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1768 = -_1760;
    float _1770 = fma(_1758, _1438, _1768);
    float _1772 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1674);
    float _1774 = _1316 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1776 = _1762 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1778 = _1764 + _1766;
    float _1780 = _1372 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1782 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1694);
    float _1784 = _1772 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1786 = _1774 + _1776;
    float _1788 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1790 = fma(_1482, _1676, _1782);
    float _1792 = _1780 + _1784;
    float _1794 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1796 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1788);
    float _1798 = fma(_1488, _1656, _1742);
    float _1800 = fma(_1494, _1656, _1790);
    float _1802 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1804 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1794);
    float _1806 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1796);
    float _1808 = fma(_1526, _1636, _1800);
    float _1810 = fma(_1522, _1636, _1798);
    float _1812 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1802);
    float _1814 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1804);
    float _1816 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1818 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1820 = fma(_1542, _1630, _1808);
    float _1822 = fma(_1528, _1630, _1810);
    float _1824 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1812);
    float _1826 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1828 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1830 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1832 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1834 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1836 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1818);
    float _1838 = fma(_1580, _1594, _1820);
    float _1840 = fma(_1578, _1594, _1822);
    float _1842 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1844 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1828);
    float _1846 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1830);
    float _1848 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1832);
    float _1850 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1834);
    float _1852 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1836);
    float _1854 = fma(_1722, _1712, _1366);
    float _1856 = fma(_1726, _1572, _1838);
    float _1858 = fma(_1748, _1736, _1756);
    float _1860 = fma(_1690, _1572, _1840);
    float _1862 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1844);
    float _1864 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1846);
    float _1866 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1848);
    float _1868 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1850);
    float _1870 = _1852 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1872 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[174].y, _1856);
    float _1874 = _1466 + 0.5;
    float _1876 = _1854 + 0.5;
    float _1878 = _1770 + 0.5;
    float _1880 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1860);
    float _1882 = _1858 + 0.5;
    float _1884 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1862);
    float _1886 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1864);
    float _1888 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1866);
    float _1890 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1868);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_51.x = _1786;
    out.m_51.y = _1778;
    out.m_51.z = _1792;
    out.m_53.x = _1876;
    out.m_53.y = _1874;
    out.m_53.z = _1882;
    out.m_53.w = _1878;
    out.m_55.x = _1880;
    out.m_55.y = _1872;
    out.gl_Position.x = _1884;
    out.gl_Position.y = _1886;
    out.gl_Position.z = _1888;
    out.gl_Position.w = _1890;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

