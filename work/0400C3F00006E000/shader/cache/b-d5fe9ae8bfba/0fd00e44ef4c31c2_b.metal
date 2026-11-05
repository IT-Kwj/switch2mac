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
    float4 m_57 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_55 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad4 [[user(locn4)]];
};

struct main0_in
{
    float4 m_39 [[attribute(1)]];
    float4 m_37 [[attribute(2)]];
    float4 m_41 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_45 [[attribute(8)]];
    float4 m_43 [[attribute(9)]];
    float4 m_49 [[attribute(10)]];
    float4 m_51 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _314 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _84;
    float _88 = _86;
    if (!_82)
    {
        out.m_33.x = 0.0;
    }
    int _90 = 0;
    if (!_82)
    {
        float _92 = _86 * 5.0;
        _90 = as_type<int>(_92);
    }
    int _94 = _90;
    int _96 = _94;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1315 = as_type<float>(_94);
        out.gl_Position.z = _1315;
    }
    if (!_82)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _98 = in.m_35.w;
    bool _100 = _98 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_98);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    float _110 = -_98;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _114 = _112;
    if (_108)
    {
        float _116 = float(_78);
        _88 = _116;
    }
    float _118 = _88;
    bool _120 = _112 >= _118;
    bool _122 = !_108;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_33.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _96 = as_type<int>(_130);
    }
    int _132 = _96;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1385 = as_type<float>(_132);
        out.gl_Position.z = _1385;
    }
    if (_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_37.x;
    float _136 = in.m_37.y;
    float _138 = in.m_37.z;
    float _140 = in.m_39.x;
    float _142 = in.m_39.y;
    float _144 = in.m_39.z;
    float _146 = in.m_41.x;
    float _148 = in.m_41.y;
    float _150 = in.m_41.z;
    float _152 = _134 * _134;
    float _154 = _136 * _136;
    float _156 = _138 * _138;
    float _158 = fma(_140, _140, _152);
    float _160 = fma(_142, _142, _154);
    float _162 = fma(_144, _144, _156);
    float _164 = fma(_146, _146, _158);
    float _166 = fma(_148, _148, _160);
    float _168 = fma(_150, _150, _162);
    float _170 = sqrt(_164);
    float _172 = sqrt(_166);
    float _174 = sqrt(_168);
    bool _176 = _170 > 0.0;
    bool _178 = _172 > 0.0;
    float _180 = _172;
    float _182 = _164;
    float _184 = _170;
    float _186 = _134;
    if (_176)
    {
        float _188 = rsqrt(_164);
        _180 = _188;
    }
    float _190 = _180;
    float _192 = 0.0;
    if (!_176)
    {
        _192 = 0.0;
    }
    float _194 = _192;
    bool _196 = _174 > 0.0;
    float _198 = 0.0;
    float _200 = _174;
    float _202 = _194;
    if (!_176)
    {
        _198 = 0.0;
    }
    float _204 = _198;
    float _206 = 0.0;
    float _208 = _204;
    if (!_176)
    {
        _206 = 0.0;
    }
    float _210 = _206;
    float _212 = 0.0;
    float _214 = _210;
    if (_178)
    {
        float _216 = rsqrt(_166);
        _212 = _216;
    }
    float _218 = _212;
    if (!_178)
    {
        _200 = 0.0;
    }
    float _220 = _200;
    float _222 = _220;
    if (!_178)
    {
        _182 = 0.0;
    }
    float _224 = _182;
    float _226 = 0.0;
    float _228 = _224;
    if (!_178)
    {
        _226 = 0.0;
    }
    float _230 = _226;
    float _232 = 0.0;
    float _234 = _230;
    if (_196)
    {
        float _236 = rsqrt(_168);
        _232 = _236;
    }
    float _238 = _232;
    float _240 = _190;
    if (_176)
    {
        float _242 = _190 * _140;
        _202 = _242;
    }
    float _244 = _202;
    if (_176)
    {
        float _246 = _190 * _134;
        _208 = _246;
    }
    float _248 = _208;
    if (_176)
    {
        float _250 = _190 * _146;
        _214 = _250;
    }
    float _252 = _214;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_196)
    {
        _240 = 0.0;
    }
    float _256 = _240;
    float _258 = _256;
    if (!_196)
    {
        _184 = 0.0;
    }
    float _260 = _184;
    float _262 = _260;
    if (_178)
    {
        float _264 = _218 * _142;
        _222 = _264;
    }
    float _266 = _222;
    float _268 = 0.0;
    if (!_196)
    {
        _268 = 0.0;
    }
    float _270 = _268;
    float _272 = _270;
    if (_178)
    {
        float _274 = _218 * _136;
        _228 = _274;
    }
    float _276 = _228;
    if (_178)
    {
        float _278 = _218 * _148;
        _234 = _278;
    }
    float _280 = _234;
    if (_196)
    {
        float _282 = _238 * _144;
        _258 = _282;
    }
    float _284 = _258;
    if (_196)
    {
        float _286 = _238 * _138;
        _262 = _286;
    }
    float _288 = _262;
    if (_196)
    {
        float _290 = _238 * _150;
        _272 = _290;
    }
    float _292 = _272;
    bool _294 = !_254;
    float _312;
    if (!_294)
    {
        float _296 = in.m_43.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[12].x, _112);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _312 = _310;
        _314 = true;
    }
    else
    {
        float _316 = float(_78);
        float _318 = 1.0 / _316;
        float _320 = _112 * _318;
        _312 = _320;
    }
    _314 = false;
    float _322 = _312;
    float _324 = in.m_43.x;
    float _326 = in.m_43.y;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _330 = _322 + _328;
    float _332 = in.m_45.x;
    float _334 = in.m_45.y;
    float _336 = in.m_45.z;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _346 = in.m_43.z;
    float _348 = 1.0 / _340;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _350;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _360 = _358 != 0;
    int _362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _364 = _362 != 0;
    int _366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _368 = _366 != 0;
    float _370 = 1.0 / _344;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _378 = _322 + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _382 = _322 + _380;
    float _384 = _326 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _386 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _388 = isnan(_322);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = 1.0 / _374;
    float _400 = _324 * 2.0;
    float _402 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _336);
    float _404 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _334);
    float _406 = _324 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _332);
    float _410 = _346 * 2.0;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _414 = _322 + _412;
    float _416 = floor(_400);
    float _418 = _326 + _346;
    float _420 = -_354;
    float _422 = fma(_406, 2.0, _420);
    float _424 = fma(_384, -2.0, _356);
    float _426 = _346 + _324;
    float _428 = _414 * _370;
    float _430 = _418 + (-1.0);
    float _432 = floor(_410);
    float _434 = _426 + (-1.0);
    float _436 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _438 = _326 + _324;
    float _440 = _330 * _398;
    float _442 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _444 = _326 * 2.0;
    bool _446 = _416 > 0.0;
    float _448 = 1.0 / _352;
    bool _450 = _416 >= 0.0;
    bool _452 = isnan(_416);
    bool _454 = _450 || _452;
    bool _456 = isnan(0.0);
    bool _458 = _454 || _456;
    float _460 = _438 + (-1.0);
    float _462 = _378 * _348;
    int _464 = _458 ? 0 : 1;
    float _466 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _468 = _432 > 0.0;
    float _470 = floor(_444);
    bool _472 = _432 >= 0.0;
    bool _474 = isnan(_432);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    int _482 = ~_464;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    float _488 = _382 * _448;
    int _490 = _486;
    if (!_446)
    {
        int _492 = ~_464;
        int _494 = _492 + 1;
        _490 = _494;
    }
    int _496 = _490;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _518;
    float _522 = fma(_508, _428, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _524 = fma(_512, _428, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _526 = fma(_516, _428, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _528 = _470 > 0.0;
    float _530 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _532 = log2(_530);
    bool _534 = _470 >= 0.0;
    bool _536 = isnan(_470);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = fma(_504, _462, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _554 = fma(_500, _462, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _556 = fma(_520, _462, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _566 = fma(_552, _440, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _568;
    bool _572 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _574 = isnan(_322);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = fma(_560, _488, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _586 = fma(_548, _488, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _588 = fma(_564, _440, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _590 = _532 * _112;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _596 = fma(_570, _488, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _598 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _600 = isnan(_322);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = -_582;
    float _612 = _610 + 1.0;
    float _614 = exp2(_590);
    float _616 = fma(_594, _440, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _620 = 1.0 + _618;
    float _622 = _608 * _612;
    bool _624 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _626 = isnan(_322);
    bool _628 = _624 || _626;
    bool _630 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _632 = _628 || _630;
    float _634 = float(_632);
    float _636 = -_608;
    float _638 = _636 + 1.0;
    bool _640 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _642 = isnan(_322);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    out.m_33.x = 1.0;
    float _652 = 1.0 / _620;
    float _654 = _650 * _638;
    float _656 = -_650;
    float _658 = _656 + 1.0;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _662 = in.m_47.x;
    float _664 = in.m_47.y;
    float _666 = in.m_47.z;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _670 = !_364;
    int _672 = _670 ? 0 : 1;
    float _674 = -_614;
    float _676 = _674 + 1.0;
    bool _678 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _680 = isnan(1.0);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _686 = _682 || _684;
    float _688 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[78].z, _668);
    int _690 = _542 ? 0 : 1;
    float _692 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[78].w, _660);
    bool _694 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _696 = isnan(0.0);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _702 = _698 || _700;
    float _704 = _396 * _658;
    int _706 = abs(_672);
    float _708 = -_112;
    float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[76].x, _422);
    float _712 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _692);
    float _714 = _702 ? _676 : 0.0;
    float _716 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _424);
    float _718 = -_396;
    float _720 = _718 + 1.0;
    float _722 = float(_706);
    float _724 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _688);
    float _726 = float(_496);
    if (_686)
    {
        float _728 = _714 * _652;
        _114 = _728;
    }
    float _730 = _114;
    bool _732 = !_368;
    int _734 = _732 ? 0 : 1;
    float _736 = _634 * _720;
    int _738 = ~_690;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    float _744 = _722 * _726;
    int _746 = abs(_734);
    float _748 = _554 * _736;
    int _750 = _742;
    if (!_528)
    {
        int _752 = ~_690;
        int _754 = _752 + 1;
        _750 = _754;
    }
    int _756 = _750;
    float _758 = _744 * (-2.0);
    float _760 = float(_746);
    float _762 = _544 * _736;
    float _764 = float(_756);
    float _766 = _326 + (-0.5);
    float _768 = fma(_758, _664, _664);
    float _770 = fma(_436, _758, _436);
    int _772 = _480 ? 0 : 1;
    float _774 = _760 * _764;
    float _776 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[196].y, _768);
    bool _778 = !_360;
    int _780 = _778 ? 0 : 1;
    float _782 = _556 * _736;
    float _784 = _774 * (-2.0);
    float _786 = fma(_770, _730, _776);
    float _788 = _346 + (-0.5);
    int _790 = ~_772;
    int _792 = _790 + 1;
    int _794 = _792 + 1;
    float _796 = fma(_784, _666, _666);
    float _798 = -_634;
    float _800 = _798 + 1.0;
    int _802 = _794;
    if (!_468)
    {
        int _804 = ~_772;
        int _806 = _804 + 1;
        _802 = _806;
    }
    int _808 = _802;
    float _810 = fma(_442, _784, _442);
    int _812 = abs(_780);
    float _814 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[196].z, _796);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].x, _748);
    float _818 = float(_808);
    float _820 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].y, _762);
    float _822 = float(_812);
    float _824 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].z, _782);
    float _826 = fma(_810, _730, _814);
    float _828 = fma(_522, _704, _816);
    float _830 = in.m_30.x;
    float _832 = in.m_30.y;
    float _834 = in.m_30.z;
    float _836 = _822 * _818;
    float _838 = _324 + (-0.5);
    float _840 = fma(_524, _704, _820);
    float _842 = in.m_49.x;
    float _844 = in.m_49.y;
    float _846 = in.m_49.z;
    float _848 = _836 * (-2.0);
    float _850 = fma(_526, _704, _824);
    float _852 = fma(_584, _654, _828);
    float _854 = fma(_586, _654, _840);
    float _856 = fma(_848, _662, _662);
    float _858 = fma(_466, _848, _466);
    float _860 = fma(_596, _654, _850);
    float _862 = fma(_588, _622, _852);
    float _864 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[196].x, _856);
    float _866 = fma(_566, _622, _854);
    float _868 = fma(_616, _622, _860);
    float _870 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[147].x, _862);
    float _872 = fma(_858, _730, _864);
    float _874 = _826 * 0.15915493667125701904296875;
    float _876 = _786 * 0.15915493667125701904296875;
    float _878 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[147].z, _868);
    float _880 = _872 * 0.15915493667125701904296875;
    float _882 = _874 * 6.283185482025146484375;
    float _884 = cos(_882);
    float _886 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[147].y, _866);
    float _888 = _142 * _832;
    float _890 = _148 * _832;
    float _892 = in.m_39.w;
    float _894 = _136 * _832;
    float _896 = _870 * _842;
    float _898 = _886 * _844;
    float _900 = _880 * 6.283185482025146484375;
    float _902 = cos(_900);
    float _904 = _878 * _846;
    float _906 = _896 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _908 = fma(_140, _830, _888);
    float _910 = _898 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _912 = _904 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _914 = _906 * _408;
    float _916 = fma(_146, _830, _890);
    float _918 = _876 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = _910 * _404;
    float _924 = _912 * _402;
    float _926 = in.m_41.w;
    float _928 = fma(_144, _834, _908);
    float _930 = fma(_150, _834, _916);
    float _932 = fma(_134, _830, _894);
    float _934 = _876 * 6.283185482025146484375;
    float _936 = cos(_934);
    float _938 = _902 * _884;
    bool _940 = _326 > 0.5;
    float _942 = _928 + _892;
    float _944 = _938 * _922;
    float _946 = fma(_138, _834, _932);
    float _948 = _874 * 6.283185482025146484375;
    float _950 = sin(_948);
    float _952 = _920 * _884;
    float _954 = _880 * 6.283185482025146484375;
    float _956 = sin(_954);
    float _958 = _936 * _884;
    float _960 = _930 + _926;
    float _962 = _920 * _950;
    float _964 = _936 * _950;
    float _966 = _902 * _950;
    float _968 = _902 * _924;
    float _970 = fma(_966, _914, _944);
    float _972 = fma(_956, _962, _958);
    float _974 = -_964;
    float _976 = fma(_956, _952, _974);
    float _978 = fma(_956, _958, _962);
    float _980 = -_952;
    float _982 = fma(_956, _964, _980);
    float _984 = -_956;
    float _986 = fma(_984, _924, _970);
    float _988 = _976 * _922;
    float _990 = _978 * _922;
    float _992 = _986 * _280;
    float _994 = fma(_972, _914, _988);
    float _996 = fma(_982, _914, _990);
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1000 = _998 != 0;
    float _1002 = _986 * _266;
    float _1004 = fma(_920, _968, _994);
    float _1006 = fma(_936, _968, _996);
    float _1008 = in.m_51.x;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1012 = _1010 != 0;
    float _1014 = fma(_1004, _252, _992);
    float _1016 = fma(_1004, _244, _1002);
    float _1018 = in.m_37.w;
    float _1020 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1022 = fma(_1006, _292, _1014);
    float _1024 = fma(_1006, _284, _1016);
    float _1026 = in.m_51.y;
    float _1028 = _960 + _1022;
    float _1030 = _942 + _1024;
    float _1032 = _968;
    float _1034 = _986;
    if (_1000)
    {
        float _1036 = in.m_43.x;
        _1032 = _1036;
    }
    float _1038 = _1032;
    float _1040 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1042 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1044 = _1028 + _1042;
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1048 = _1030 + _1046;
    float _1050 = _1044 * _1044;
    float _1052 = fma(_1048, _1048, _1050);
    if (_1000)
    {
        _186 = _1008;
    }
    float _1054 = _186;
    float _1056 = sqrt(_1052);
    float _1058 = _946 + _1018;
    float _1060 = -_1026;
    float _1062 = _1060 + 1.0;
    bool _1064 = _1038 > 0.5;
    bool _1066 = _1064 && _1000;
    float _1068 = _986 * _276;
    float _1070 = _1026;
    float _1072 = _1054;
    if (_1012)
    {
        float _1074 = _940 ? _1062 : _1026;
        _1070 = _1074;
    }
    float _1076 = _1070;
    float _1078 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_1000)
    {
        _1034 = _1008;
    }
    float _1080 = _1034;
    float _1082 = fma(_1004, _248, _1068);
    bool _1084 = _1056 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1086 = fma(_1078, _1076, -0.5);
    float _1088 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1090 = fma(_1006, _288, _1082);
    float _1092 = -_716;
    float _1094 = fma(_712, _1086, _1092);
    float _1096 = _1080;
    float _1098 = _1086;
    float _1100 = _1088;
    if (_1066)
    {
        float _1102 = -_1054;
        float _1104 = _1102 + 1.0;
        _1072 = _1104;
    }
    float _1106 = _1072;
    float _1108 = _1058 + _1090;
    if (_1000)
    {
        _1096 = _1106;
    }
    float _1110 = _1096;
    float _1112 = _1110;
    if (!_1084)
    {
        _1098 = _1030;
    }
    float _1114 = _1098;
    float _1116 = fma(_1088, _1110, -0.5);
    float _1118 = _1114;
    if (!_1084)
    {
        _1112 = _1028;
    }
    float _1120 = _1112;
    float _1122 = _1120;
    if (!_1084)
    {
        _1100 = _1108;
    }
    float _1124 = _1100;
    bool _1126 = !_1084;
    float _1128 = _1124;
    if (!_1126)
    {
        float _1130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1132 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1134 = _1056 + _1132;
        float _1136 = rsqrt(_1052);
        float _1138 = _1134 * _1130;
        float _1140 = _1108 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = _1138 * 0.15915493667125701904296875;
        float _1144 = _1142 * 6.283185482025146484375;
        float _1146 = cos(_1144);
        float _1148 = _1142 * 6.283185482025146484375;
        float _1150 = sin(_1148);
        float _1152 = _1146 + (-1.0);
        float _1154 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1156 = fma(_1150, _1140, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1158 = fma(_1108, _1146, _1154);
        float _1160 = _1136 * _1156;
        float _1162 = fma(_1048, _1160, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1164 = fma(_1044, _1160, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1128 = _1158;
        _1118 = _1162;
        _1122 = _1164;
    }
    float _1166 = _1128;
    float _1168 = _1118;
    float _1170 = _1122;
    float _1172 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1176 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1178 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1180 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1172);
    float _1182 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1174);
    float _1184 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1176);
    float _1186 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1178);
    float _1188 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1180);
    float _1190 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1182);
    float _1192 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1184);
    float _1194 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1186);
    float _1196 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1198 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1200 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1202 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1204 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1206 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1208 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1210 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1202);
    float _1212 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1204);
    float _1214 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1206);
    float _1216 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1208);
    float _1218 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1210);
    float _1220 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1212);
    float _1222 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1214);
    float _1224 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1216);
    float _1226 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1228 = fma(_724, _1116, _710);
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1236 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1222);
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1240 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1244 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1246 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1248 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1250 = _1094 + 0.5;
    float _1252 = _1228 + 0.5;
    float _1254 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1218);
    float _1256 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1220);
    float _1258 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1224);
    out.m_53.w = _1238;
    out.m_55.w = _1240;
    out.m_57.x = _1244;
    out.m_57.y = _1246;
    out.m_57.z = _1248;
    out.m_57.w = _1242;
    out.m_59.x = _1252;
    out.m_59.y = _1250;
    out.gl_Position.x = _1254;
    out.gl_Position.y = _1256;
    out.gl_Position.z = _1236;
    out.gl_Position.w = _1258;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _314 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _84;
    float _88 = _86;
    if (!_82)
    {
        out.m_33.x = 0.0;
    }
    int _90 = 0;
    if (!_82)
    {
        float _92 = _86 * 5.0;
        _90 = as_type<int>(_92);
    }
    int _94 = _90;
    int _96 = _94;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1315 = as_type<float>(_94);
        out.gl_Position.z = _1315;
    }
    if (!_82)
    {
        return out;
    }
    float _98 = in.m_35.w;
    bool _100 = _98 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_98);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    float _110 = -_98;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _114 = _112;
    if (_108)
    {
        float _116 = float(_78);
        _88 = _116;
    }
    float _118 = _88;
    bool _120 = _112 >= _118;
    bool _122 = !_108;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_33.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _96 = as_type<int>(_130);
    }
    int _132 = _96;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1385 = as_type<float>(_132);
        out.gl_Position.z = _1385;
    }
    if (_124)
    {
        return out;
    }
    float _134 = in.m_37.x;
    float _136 = in.m_37.y;
    float _138 = in.m_37.z;
    float _140 = in.m_39.x;
    float _142 = in.m_39.y;
    float _144 = in.m_39.z;
    float _146 = in.m_41.x;
    float _148 = in.m_41.y;
    float _150 = in.m_41.z;
    float _152 = _134 * _134;
    float _154 = _136 * _136;
    float _156 = _138 * _138;
    float _158 = fma(_140, _140, _152);
    float _160 = fma(_142, _142, _154);
    float _162 = fma(_144, _144, _156);
    float _164 = fma(_146, _146, _158);
    float _166 = fma(_148, _148, _160);
    float _168 = fma(_150, _150, _162);
    float _170 = sqrt(_164);
    float _172 = sqrt(_166);
    float _174 = sqrt(_168);
    bool _176 = _170 > 0.0;
    bool _178 = _172 > 0.0;
    float _180 = _172;
    float _182 = _164;
    float _184 = _170;
    float _186 = _134;
    if (_176)
    {
        float _188 = rsqrt(_164);
        _180 = _188;
    }
    float _190 = _180;
    float _192 = 0.0;
    if (!_176)
    {
        _192 = 0.0;
    }
    float _194 = _192;
    bool _196 = _174 > 0.0;
    float _198 = 0.0;
    float _200 = _174;
    float _202 = _194;
    if (!_176)
    {
        _198 = 0.0;
    }
    float _204 = _198;
    float _206 = 0.0;
    float _208 = _204;
    if (!_176)
    {
        _206 = 0.0;
    }
    float _210 = _206;
    float _212 = 0.0;
    float _214 = _210;
    if (_178)
    {
        float _216 = rsqrt(_166);
        _212 = _216;
    }
    float _218 = _212;
    if (!_178)
    {
        _200 = 0.0;
    }
    float _220 = _200;
    float _222 = _220;
    if (!_178)
    {
        _182 = 0.0;
    }
    float _224 = _182;
    float _226 = 0.0;
    float _228 = _224;
    if (!_178)
    {
        _226 = 0.0;
    }
    float _230 = _226;
    float _232 = 0.0;
    float _234 = _230;
    if (_196)
    {
        float _236 = rsqrt(_168);
        _232 = _236;
    }
    float _238 = _232;
    float _240 = _190;
    if (_176)
    {
        float _242 = _190 * _140;
        _202 = _242;
    }
    float _244 = _202;
    if (_176)
    {
        float _246 = _190 * _134;
        _208 = _246;
    }
    float _248 = _208;
    if (_176)
    {
        float _250 = _190 * _146;
        _214 = _250;
    }
    float _252 = _214;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_196)
    {
        _240 = 0.0;
    }
    float _256 = _240;
    float _258 = _256;
    if (!_196)
    {
        _184 = 0.0;
    }
    float _260 = _184;
    float _262 = _260;
    if (_178)
    {
        float _264 = _218 * _142;
        _222 = _264;
    }
    float _266 = _222;
    float _268 = 0.0;
    if (!_196)
    {
        _268 = 0.0;
    }
    float _270 = _268;
    float _272 = _270;
    if (_178)
    {
        float _274 = _218 * _136;
        _228 = _274;
    }
    float _276 = _228;
    if (_178)
    {
        float _278 = _218 * _148;
        _234 = _278;
    }
    float _280 = _234;
    if (_196)
    {
        float _282 = _238 * _144;
        _258 = _282;
    }
    float _284 = _258;
    if (_196)
    {
        float _286 = _238 * _138;
        _262 = _286;
    }
    float _288 = _262;
    if (_196)
    {
        float _290 = _238 * _150;
        _272 = _290;
    }
    float _292 = _272;
    bool _294 = !_254;
    float _312;
    if (!_294)
    {
        float _296 = in.m_43.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[12].x, _112);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _312 = _310;
        _314 = true;
    }
    else
    {
        float _316 = float(_78);
        float _318 = 1.0 / _316;
        float _320 = _112 * _318;
        _312 = _320;
    }
    _314 = false;
    float _322 = _312;
    float _324 = in.m_43.x;
    float _326 = in.m_43.y;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _330 = _322 + _328;
    float _332 = in.m_45.x;
    float _334 = in.m_45.y;
    float _336 = in.m_45.z;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _346 = in.m_43.z;
    float _348 = 1.0 / _340;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _350;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _360 = _358 != 0;
    int _362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _364 = _362 != 0;
    int _366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _368 = _366 != 0;
    float _370 = 1.0 / _344;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _378 = _322 + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _382 = _322 + _380;
    float _384 = _326 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _386 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _388 = isnan(_322);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = 1.0 / _374;
    float _400 = _324 * 2.0;
    float _402 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _336);
    float _404 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _334);
    float _406 = _324 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _332);
    float _410 = _346 * 2.0;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _414 = _322 + _412;
    float _416 = floor(_400);
    float _418 = _326 + _346;
    float _420 = -_354;
    float _422 = fma(_406, 2.0, _420);
    float _424 = fma(_384, -2.0, _356);
    float _426 = _346 + _324;
    float _428 = _414 * _370;
    float _430 = _418 + (-1.0);
    float _432 = floor(_410);
    float _434 = _426 + (-1.0);
    float _436 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _438 = _326 + _324;
    float _440 = _330 * _398;
    float _442 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _444 = _326 * 2.0;
    bool _446 = _416 > 0.0;
    float _448 = 1.0 / _352;
    bool _450 = _416 >= 0.0;
    bool _452 = isnan(_416);
    bool _454 = _450 || _452;
    bool _456 = isnan(0.0);
    bool _458 = _454 || _456;
    float _460 = _438 + (-1.0);
    float _462 = _378 * _348;
    int _464 = _458 ? 0 : 1;
    float _466 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _468 = _432 > 0.0;
    float _470 = floor(_444);
    bool _472 = _432 >= 0.0;
    bool _474 = isnan(_432);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    int _482 = ~_464;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    float _488 = _382 * _448;
    int _490 = _486;
    if (!_446)
    {
        int _492 = ~_464;
        int _494 = _492 + 1;
        _490 = _494;
    }
    int _496 = _490;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _518;
    float _522 = fma(_508, _428, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _524 = fma(_512, _428, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _526 = fma(_516, _428, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _528 = _470 > 0.0;
    float _530 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _532 = log2(_530);
    bool _534 = _470 >= 0.0;
    bool _536 = isnan(_470);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = fma(_504, _462, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _554 = fma(_500, _462, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _556 = fma(_520, _462, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _566 = fma(_552, _440, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _568;
    bool _572 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _574 = isnan(_322);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = fma(_560, _488, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _586 = fma(_548, _488, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _588 = fma(_564, _440, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _590 = _532 * _112;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _596 = fma(_570, _488, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _598 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _600 = isnan(_322);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = -_582;
    float _612 = _610 + 1.0;
    float _614 = exp2(_590);
    float _616 = fma(_594, _440, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _620 = 1.0 + _618;
    float _622 = _608 * _612;
    bool _624 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _626 = isnan(_322);
    bool _628 = _624 || _626;
    bool _630 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _632 = _628 || _630;
    float _634 = float(_632);
    float _636 = -_608;
    float _638 = _636 + 1.0;
    bool _640 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _642 = isnan(_322);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    out.m_33.x = 1.0;
    float _652 = 1.0 / _620;
    float _654 = _650 * _638;
    float _656 = -_650;
    float _658 = _656 + 1.0;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _662 = in.m_47.x;
    float _664 = in.m_47.y;
    float _666 = in.m_47.z;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _670 = !_364;
    int _672 = _670 ? 0 : 1;
    float _674 = -_614;
    float _676 = _674 + 1.0;
    bool _678 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _680 = isnan(1.0);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _686 = _682 || _684;
    float _688 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[78].z, _668);
    int _690 = _542 ? 0 : 1;
    float _692 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[78].w, _660);
    bool _694 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _696 = isnan(0.0);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _702 = _698 || _700;
    float _704 = _396 * _658;
    int _706 = abs(_672);
    float _708 = -_112;
    float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[76].x, _422);
    float _712 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _692);
    float _714 = _702 ? _676 : 0.0;
    float _716 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _424);
    float _718 = -_396;
    float _720 = _718 + 1.0;
    float _722 = float(_706);
    float _724 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _688);
    float _726 = float(_496);
    if (_686)
    {
        float _728 = _714 * _652;
        _114 = _728;
    }
    float _730 = _114;
    bool _732 = !_368;
    int _734 = _732 ? 0 : 1;
    float _736 = _634 * _720;
    int _738 = ~_690;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    float _744 = _722 * _726;
    int _746 = abs(_734);
    float _748 = _554 * _736;
    int _750 = _742;
    if (!_528)
    {
        int _752 = ~_690;
        int _754 = _752 + 1;
        _750 = _754;
    }
    int _756 = _750;
    float _758 = _744 * (-2.0);
    float _760 = float(_746);
    float _762 = _544 * _736;
    float _764 = float(_756);
    float _766 = _326 + (-0.5);
    float _768 = fma(_758, _664, _664);
    float _770 = fma(_436, _758, _436);
    int _772 = _480 ? 0 : 1;
    float _774 = _760 * _764;
    float _776 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[196].y, _768);
    bool _778 = !_360;
    int _780 = _778 ? 0 : 1;
    float _782 = _556 * _736;
    float _784 = _774 * (-2.0);
    float _786 = fma(_770, _730, _776);
    float _788 = _346 + (-0.5);
    int _790 = ~_772;
    int _792 = _790 + 1;
    int _794 = _792 + 1;
    float _796 = fma(_784, _666, _666);
    float _798 = -_634;
    float _800 = _798 + 1.0;
    int _802 = _794;
    if (!_468)
    {
        int _804 = ~_772;
        int _806 = _804 + 1;
        _802 = _806;
    }
    int _808 = _802;
    float _810 = fma(_442, _784, _442);
    int _812 = abs(_780);
    float _814 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[196].z, _796);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].x, _748);
    float _818 = float(_808);
    float _820 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].y, _762);
    float _822 = float(_812);
    float _824 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].z, _782);
    float _826 = fma(_810, _730, _814);
    float _828 = fma(_522, _704, _816);
    float _830 = in.m_30.x;
    float _832 = in.m_30.y;
    float _834 = in.m_30.z;
    float _836 = _822 * _818;
    float _838 = _324 + (-0.5);
    float _840 = fma(_524, _704, _820);
    float _842 = in.m_49.x;
    float _844 = in.m_49.y;
    float _846 = in.m_49.z;
    float _848 = _836 * (-2.0);
    float _850 = fma(_526, _704, _824);
    float _852 = fma(_584, _654, _828);
    float _854 = fma(_586, _654, _840);
    float _856 = fma(_848, _662, _662);
    float _858 = fma(_466, _848, _466);
    float _860 = fma(_596, _654, _850);
    float _862 = fma(_588, _622, _852);
    float _864 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[196].x, _856);
    float _866 = fma(_566, _622, _854);
    float _868 = fma(_616, _622, _860);
    float _870 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[147].x, _862);
    float _872 = fma(_858, _730, _864);
    float _874 = _826 * 0.15915493667125701904296875;
    float _876 = _786 * 0.15915493667125701904296875;
    float _878 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[147].z, _868);
    float _880 = _872 * 0.15915493667125701904296875;
    float _882 = _874 * 6.283185482025146484375;
    float _884 = cos(_882);
    float _886 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[147].y, _866);
    float _888 = _142 * _832;
    float _890 = _148 * _832;
    float _892 = in.m_39.w;
    float _894 = _136 * _832;
    float _896 = _870 * _842;
    float _898 = _886 * _844;
    float _900 = _880 * 6.283185482025146484375;
    float _902 = cos(_900);
    float _904 = _878 * _846;
    float _906 = _896 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _908 = fma(_140, _830, _888);
    float _910 = _898 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _912 = _904 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _914 = _906 * _408;
    float _916 = fma(_146, _830, _890);
    float _918 = _876 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = _910 * _404;
    float _924 = _912 * _402;
    float _926 = in.m_41.w;
    float _928 = fma(_144, _834, _908);
    float _930 = fma(_150, _834, _916);
    float _932 = fma(_134, _830, _894);
    float _934 = _876 * 6.283185482025146484375;
    float _936 = cos(_934);
    float _938 = _902 * _884;
    bool _940 = _326 > 0.5;
    float _942 = _928 + _892;
    float _944 = _938 * _922;
    float _946 = fma(_138, _834, _932);
    float _948 = _874 * 6.283185482025146484375;
    float _950 = sin(_948);
    float _952 = _920 * _884;
    float _954 = _880 * 6.283185482025146484375;
    float _956 = sin(_954);
    float _958 = _936 * _884;
    float _960 = _930 + _926;
    float _962 = _920 * _950;
    float _964 = _936 * _950;
    float _966 = _902 * _950;
    float _968 = _902 * _924;
    float _970 = fma(_966, _914, _944);
    float _972 = fma(_956, _962, _958);
    float _974 = -_964;
    float _976 = fma(_956, _952, _974);
    float _978 = fma(_956, _958, _962);
    float _980 = -_952;
    float _982 = fma(_956, _964, _980);
    float _984 = -_956;
    float _986 = fma(_984, _924, _970);
    float _988 = _976 * _922;
    float _990 = _978 * _922;
    float _992 = _986 * _280;
    float _994 = fma(_972, _914, _988);
    float _996 = fma(_982, _914, _990);
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1000 = _998 != 0;
    float _1002 = _986 * _266;
    float _1004 = fma(_920, _968, _994);
    float _1006 = fma(_936, _968, _996);
    float _1008 = in.m_51.x;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1012 = _1010 != 0;
    float _1014 = fma(_1004, _252, _992);
    float _1016 = fma(_1004, _244, _1002);
    float _1018 = in.m_37.w;
    float _1020 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1022 = fma(_1006, _292, _1014);
    float _1024 = fma(_1006, _284, _1016);
    float _1026 = in.m_51.y;
    float _1028 = _960 + _1022;
    float _1030 = _942 + _1024;
    float _1032 = _968;
    float _1034 = _986;
    if (_1000)
    {
        float _1036 = in.m_43.x;
        _1032 = _1036;
    }
    float _1038 = _1032;
    float _1040 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1042 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1044 = _1028 + _1042;
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1048 = _1030 + _1046;
    float _1050 = _1044 * _1044;
    float _1052 = fma(_1048, _1048, _1050);
    if (_1000)
    {
        _186 = _1008;
    }
    float _1054 = _186;
    float _1056 = sqrt(_1052);
    float _1058 = _946 + _1018;
    float _1060 = -_1026;
    float _1062 = _1060 + 1.0;
    bool _1064 = _1038 > 0.5;
    bool _1066 = _1064 && _1000;
    float _1068 = _986 * _276;
    float _1070 = _1026;
    float _1072 = _1054;
    if (_1012)
    {
        float _1074 = _940 ? _1062 : _1026;
        _1070 = _1074;
    }
    float _1076 = _1070;
    float _1078 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_1000)
    {
        _1034 = _1008;
    }
    float _1080 = _1034;
    float _1082 = fma(_1004, _248, _1068);
    bool _1084 = _1056 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1086 = fma(_1078, _1076, -0.5);
    float _1088 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1090 = fma(_1006, _288, _1082);
    float _1092 = -_716;
    float _1094 = fma(_712, _1086, _1092);
    float _1096 = _1080;
    float _1098 = _1086;
    float _1100 = _1088;
    if (_1066)
    {
        float _1102 = -_1054;
        float _1104 = _1102 + 1.0;
        _1072 = _1104;
    }
    float _1106 = _1072;
    float _1108 = _1058 + _1090;
    if (_1000)
    {
        _1096 = _1106;
    }
    float _1110 = _1096;
    float _1112 = _1110;
    if (!_1084)
    {
        _1098 = _1030;
    }
    float _1114 = _1098;
    float _1116 = fma(_1088, _1110, -0.5);
    float _1118 = _1114;
    if (!_1084)
    {
        _1112 = _1028;
    }
    float _1120 = _1112;
    float _1122 = _1120;
    if (!_1084)
    {
        _1100 = _1108;
    }
    float _1124 = _1100;
    bool _1126 = !_1084;
    float _1128 = _1124;
    if (!_1126)
    {
        float _1130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1132 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1134 = _1056 + _1132;
        float _1136 = rsqrt(_1052);
        float _1138 = _1134 * _1130;
        float _1140 = _1108 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = _1138 * 0.15915493667125701904296875;
        float _1144 = _1142 * 6.283185482025146484375;
        float _1146 = cos(_1144);
        float _1148 = _1142 * 6.283185482025146484375;
        float _1150 = sin(_1148);
        float _1152 = _1146 + (-1.0);
        float _1154 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1156 = fma(_1150, _1140, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1158 = fma(_1108, _1146, _1154);
        float _1160 = _1136 * _1156;
        float _1162 = fma(_1048, _1160, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1164 = fma(_1044, _1160, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1128 = _1158;
        _1118 = _1162;
        _1122 = _1164;
    }
    float _1166 = _1128;
    float _1168 = _1118;
    float _1170 = _1122;
    float _1172 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1176 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1178 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1180 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1172);
    float _1182 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1174);
    float _1184 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1176);
    float _1186 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1178);
    float _1188 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1180);
    float _1190 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1182);
    float _1192 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1184);
    float _1194 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1186);
    float _1196 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1198 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1200 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1202 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1204 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1206 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1208 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1210 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1202);
    float _1212 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1204);
    float _1214 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1206);
    float _1216 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1208);
    float _1218 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1210);
    float _1220 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1212);
    float _1222 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1214);
    float _1224 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1216);
    float _1226 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1228 = fma(_724, _1116, _710);
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1236 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1222);
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1240 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1244 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1246 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1248 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1250 = _1094 + 0.5;
    float _1252 = _1228 + 0.5;
    float _1254 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1218);
    float _1256 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1220);
    float _1258 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1224);
    out.m_53.w = _1238;
    out.m_55.w = _1240;
    out.m_57.x = _1244;
    out.m_57.y = _1246;
    out.m_57.z = _1248;
    out.m_57.w = _1242;
    out.m_59.x = _1252;
    out.m_59.y = _1250;
    out.gl_Position.x = _1254;
    out.gl_Position.y = _1256;
    out.gl_Position.z = _1236;
    out.gl_Position.w = _1258;
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
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _314 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _84;
    float _88 = _86;
    if (!_82)
    {
        out.m_33.x = 0.0;
    }
    int _90 = 0;
    if (!_82)
    {
        float _92 = _86 * 5.0;
        _90 = as_type<int>(_92);
    }
    int _94 = _90;
    int _96 = _94;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1315 = as_type<float>(_94);
        out.gl_Position.z = _1315;
    }
    if (!_82)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _98 = in.m_35.w;
    bool _100 = _98 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_98);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    float _110 = -_98;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _114 = _112;
    if (_108)
    {
        float _116 = float(_78);
        _88 = _116;
    }
    float _118 = _88;
    bool _120 = _112 >= _118;
    bool _122 = !_108;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_33.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _96 = as_type<int>(_130);
    }
    int _132 = _96;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1385 = as_type<float>(_132);
        out.gl_Position.z = _1385;
    }
    if (_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_37.x;
    float _136 = in.m_37.y;
    float _138 = in.m_37.z;
    float _140 = in.m_39.x;
    float _142 = in.m_39.y;
    float _144 = in.m_39.z;
    float _146 = in.m_41.x;
    float _148 = in.m_41.y;
    float _150 = in.m_41.z;
    float _152 = _134 * _134;
    float _154 = _136 * _136;
    float _156 = _138 * _138;
    float _158 = fma(_140, _140, _152);
    float _160 = fma(_142, _142, _154);
    float _162 = fma(_144, _144, _156);
    float _164 = fma(_146, _146, _158);
    float _166 = fma(_148, _148, _160);
    float _168 = fma(_150, _150, _162);
    float _170 = sqrt(_164);
    float _172 = sqrt(_166);
    float _174 = sqrt(_168);
    bool _176 = _170 > 0.0;
    bool _178 = _172 > 0.0;
    float _180 = _172;
    float _182 = _164;
    float _184 = _170;
    float _186 = _134;
    if (_176)
    {
        float _188 = rsqrt(_164);
        _180 = _188;
    }
    float _190 = _180;
    float _192 = 0.0;
    if (!_176)
    {
        _192 = 0.0;
    }
    float _194 = _192;
    bool _196 = _174 > 0.0;
    float _198 = 0.0;
    float _200 = _174;
    float _202 = _194;
    if (!_176)
    {
        _198 = 0.0;
    }
    float _204 = _198;
    float _206 = 0.0;
    float _208 = _204;
    if (!_176)
    {
        _206 = 0.0;
    }
    float _210 = _206;
    float _212 = 0.0;
    float _214 = _210;
    if (_178)
    {
        float _216 = rsqrt(_166);
        _212 = _216;
    }
    float _218 = _212;
    if (!_178)
    {
        _200 = 0.0;
    }
    float _220 = _200;
    float _222 = _220;
    if (!_178)
    {
        _182 = 0.0;
    }
    float _224 = _182;
    float _226 = 0.0;
    float _228 = _224;
    if (!_178)
    {
        _226 = 0.0;
    }
    float _230 = _226;
    float _232 = 0.0;
    float _234 = _230;
    if (_196)
    {
        float _236 = rsqrt(_168);
        _232 = _236;
    }
    float _238 = _232;
    float _240 = _190;
    if (_176)
    {
        float _242 = _190 * _140;
        _202 = _242;
    }
    float _244 = _202;
    if (_176)
    {
        float _246 = _190 * _134;
        _208 = _246;
    }
    float _248 = _208;
    if (_176)
    {
        float _250 = _190 * _146;
        _214 = _250;
    }
    float _252 = _214;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_196)
    {
        _240 = 0.0;
    }
    float _256 = _240;
    float _258 = _256;
    if (!_196)
    {
        _184 = 0.0;
    }
    float _260 = _184;
    float _262 = _260;
    if (_178)
    {
        float _264 = _218 * _142;
        _222 = _264;
    }
    float _266 = _222;
    float _268 = 0.0;
    if (!_196)
    {
        _268 = 0.0;
    }
    float _270 = _268;
    float _272 = _270;
    if (_178)
    {
        float _274 = _218 * _136;
        _228 = _274;
    }
    float _276 = _228;
    if (_178)
    {
        float _278 = _218 * _148;
        _234 = _278;
    }
    float _280 = _234;
    if (_196)
    {
        float _282 = _238 * _144;
        _258 = _282;
    }
    float _284 = _258;
    if (_196)
    {
        float _286 = _238 * _138;
        _262 = _286;
    }
    float _288 = _262;
    if (_196)
    {
        float _290 = _238 * _150;
        _272 = _290;
    }
    float _292 = _272;
    bool _294 = !_254;
    float _312;
    if (!_294)
    {
        float _296 = in.m_43.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[12].x, _112);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _312 = _310;
        _314 = true;
    }
    else
    {
        float _316 = float(_78);
        float _318 = 1.0 / _316;
        float _320 = _112 * _318;
        _312 = _320;
    }
    _314 = false;
    float _322 = _312;
    float _324 = in.m_43.x;
    float _326 = in.m_43.y;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _330 = _322 + _328;
    float _332 = in.m_45.x;
    float _334 = in.m_45.y;
    float _336 = in.m_45.z;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _346 = in.m_43.z;
    float _348 = 1.0 / _340;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _350;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _360 = _358 != 0;
    int _362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _364 = _362 != 0;
    int _366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _368 = _366 != 0;
    float _370 = 1.0 / _344;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _378 = _322 + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _382 = _322 + _380;
    float _384 = _326 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _386 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _388 = isnan(_322);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = 1.0 / _374;
    float _400 = _324 * 2.0;
    float _402 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _336);
    float _404 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _334);
    float _406 = _324 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _332);
    float _410 = _346 * 2.0;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _414 = _322 + _412;
    float _416 = floor(_400);
    float _418 = _326 + _346;
    float _420 = -_354;
    float _422 = fma(_406, 2.0, _420);
    float _424 = fma(_384, -2.0, _356);
    float _426 = _346 + _324;
    float _428 = _414 * _370;
    float _430 = _418 + (-1.0);
    float _432 = floor(_410);
    float _434 = _426 + (-1.0);
    float _436 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _438 = _326 + _324;
    float _440 = _330 * _398;
    float _442 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _444 = _326 * 2.0;
    bool _446 = _416 > 0.0;
    float _448 = 1.0 / _352;
    bool _450 = _416 >= 0.0;
    bool _452 = isnan(_416);
    bool _454 = _450 || _452;
    bool _456 = isnan(0.0);
    bool _458 = _454 || _456;
    float _460 = _438 + (-1.0);
    float _462 = _378 * _348;
    int _464 = _458 ? 0 : 1;
    float _466 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _468 = _432 > 0.0;
    float _470 = floor(_444);
    bool _472 = _432 >= 0.0;
    bool _474 = isnan(_432);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    int _482 = ~_464;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    float _488 = _382 * _448;
    int _490 = _486;
    if (!_446)
    {
        int _492 = ~_464;
        int _494 = _492 + 1;
        _490 = _494;
    }
    int _496 = _490;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _518;
    float _522 = fma(_508, _428, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _524 = fma(_512, _428, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _526 = fma(_516, _428, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _528 = _470 > 0.0;
    float _530 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _532 = log2(_530);
    bool _534 = _470 >= 0.0;
    bool _536 = isnan(_470);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = fma(_504, _462, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _554 = fma(_500, _462, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _556 = fma(_520, _462, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _566 = fma(_552, _440, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _568;
    bool _572 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _574 = isnan(_322);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = fma(_560, _488, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _586 = fma(_548, _488, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _588 = fma(_564, _440, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _590 = _532 * _112;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _596 = fma(_570, _488, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _598 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _600 = isnan(_322);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = -_582;
    float _612 = _610 + 1.0;
    float _614 = exp2(_590);
    float _616 = fma(_594, _440, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _620 = 1.0 + _618;
    float _622 = _608 * _612;
    bool _624 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _626 = isnan(_322);
    bool _628 = _624 || _626;
    bool _630 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _632 = _628 || _630;
    float _634 = float(_632);
    float _636 = -_608;
    float _638 = _636 + 1.0;
    bool _640 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _642 = isnan(_322);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    out.m_33.x = 1.0;
    float _652 = 1.0 / _620;
    float _654 = _650 * _638;
    float _656 = -_650;
    float _658 = _656 + 1.0;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _662 = in.m_47.x;
    float _664 = in.m_47.y;
    float _666 = in.m_47.z;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _670 = !_364;
    int _672 = _670 ? 0 : 1;
    float _674 = -_614;
    float _676 = _674 + 1.0;
    bool _678 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _680 = isnan(1.0);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _686 = _682 || _684;
    float _688 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[78].z, _668);
    int _690 = _542 ? 0 : 1;
    float _692 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[78].w, _660);
    bool _694 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _696 = isnan(0.0);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _702 = _698 || _700;
    float _704 = _396 * _658;
    int _706 = abs(_672);
    float _708 = -_112;
    float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[76].x, _422);
    float _712 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _692);
    float _714 = _702 ? _676 : 0.0;
    float _716 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _424);
    float _718 = -_396;
    float _720 = _718 + 1.0;
    float _722 = float(_706);
    float _724 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _688);
    float _726 = float(_496);
    if (_686)
    {
        float _728 = _714 * _652;
        _114 = _728;
    }
    float _730 = _114;
    bool _732 = !_368;
    int _734 = _732 ? 0 : 1;
    float _736 = _634 * _720;
    int _738 = ~_690;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    float _744 = _722 * _726;
    int _746 = abs(_734);
    float _748 = _554 * _736;
    int _750 = _742;
    if (!_528)
    {
        int _752 = ~_690;
        int _754 = _752 + 1;
        _750 = _754;
    }
    int _756 = _750;
    float _758 = _744 * (-2.0);
    float _760 = float(_746);
    float _762 = _544 * _736;
    float _764 = float(_756);
    float _766 = _326 + (-0.5);
    float _768 = fma(_758, _664, _664);
    float _770 = fma(_436, _758, _436);
    int _772 = _480 ? 0 : 1;
    float _774 = _760 * _764;
    float _776 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[196].y, _768);
    bool _778 = !_360;
    int _780 = _778 ? 0 : 1;
    float _782 = _556 * _736;
    float _784 = _774 * (-2.0);
    float _786 = fma(_770, _730, _776);
    float _788 = _346 + (-0.5);
    int _790 = ~_772;
    int _792 = _790 + 1;
    int _794 = _792 + 1;
    float _796 = fma(_784, _666, _666);
    float _798 = -_634;
    float _800 = _798 + 1.0;
    int _802 = _794;
    if (!_468)
    {
        int _804 = ~_772;
        int _806 = _804 + 1;
        _802 = _806;
    }
    int _808 = _802;
    float _810 = fma(_442, _784, _442);
    int _812 = abs(_780);
    float _814 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[196].z, _796);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].x, _748);
    float _818 = float(_808);
    float _820 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].y, _762);
    float _822 = float(_812);
    float _824 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[143].z, _782);
    float _826 = fma(_810, _730, _814);
    float _828 = fma(_522, _704, _816);
    float _830 = in.m_30.x;
    float _832 = in.m_30.y;
    float _834 = in.m_30.z;
    float _836 = _822 * _818;
    float _838 = _324 + (-0.5);
    float _840 = fma(_524, _704, _820);
    float _842 = in.m_49.x;
    float _844 = in.m_49.y;
    float _846 = in.m_49.z;
    float _848 = _836 * (-2.0);
    float _850 = fma(_526, _704, _824);
    float _852 = fma(_584, _654, _828);
    float _854 = fma(_586, _654, _840);
    float _856 = fma(_848, _662, _662);
    float _858 = fma(_466, _848, _466);
    float _860 = fma(_596, _654, _850);
    float _862 = fma(_588, _622, _852);
    float _864 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[196].x, _856);
    float _866 = fma(_566, _622, _854);
    float _868 = fma(_616, _622, _860);
    float _870 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[147].x, _862);
    float _872 = fma(_858, _730, _864);
    float _874 = _826 * 0.15915493667125701904296875;
    float _876 = _786 * 0.15915493667125701904296875;
    float _878 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[147].z, _868);
    float _880 = _872 * 0.15915493667125701904296875;
    float _882 = _874 * 6.283185482025146484375;
    float _884 = cos(_882);
    float _886 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[147].y, _866);
    float _888 = _142 * _832;
    float _890 = _148 * _832;
    float _892 = in.m_39.w;
    float _894 = _136 * _832;
    float _896 = _870 * _842;
    float _898 = _886 * _844;
    float _900 = _880 * 6.283185482025146484375;
    float _902 = cos(_900);
    float _904 = _878 * _846;
    float _906 = _896 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _908 = fma(_140, _830, _888);
    float _910 = _898 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _912 = _904 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _914 = _906 * _408;
    float _916 = fma(_146, _830, _890);
    float _918 = _876 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = _910 * _404;
    float _924 = _912 * _402;
    float _926 = in.m_41.w;
    float _928 = fma(_144, _834, _908);
    float _930 = fma(_150, _834, _916);
    float _932 = fma(_134, _830, _894);
    float _934 = _876 * 6.283185482025146484375;
    float _936 = cos(_934);
    float _938 = _902 * _884;
    bool _940 = _326 > 0.5;
    float _942 = _928 + _892;
    float _944 = _938 * _922;
    float _946 = fma(_138, _834, _932);
    float _948 = _874 * 6.283185482025146484375;
    float _950 = sin(_948);
    float _952 = _920 * _884;
    float _954 = _880 * 6.283185482025146484375;
    float _956 = sin(_954);
    float _958 = _936 * _884;
    float _960 = _930 + _926;
    float _962 = _920 * _950;
    float _964 = _936 * _950;
    float _966 = _902 * _950;
    float _968 = _902 * _924;
    float _970 = fma(_966, _914, _944);
    float _972 = fma(_956, _962, _958);
    float _974 = -_964;
    float _976 = fma(_956, _952, _974);
    float _978 = fma(_956, _958, _962);
    float _980 = -_952;
    float _982 = fma(_956, _964, _980);
    float _984 = -_956;
    float _986 = fma(_984, _924, _970);
    float _988 = _976 * _922;
    float _990 = _978 * _922;
    float _992 = _986 * _280;
    float _994 = fma(_972, _914, _988);
    float _996 = fma(_982, _914, _990);
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1000 = _998 != 0;
    float _1002 = _986 * _266;
    float _1004 = fma(_920, _968, _994);
    float _1006 = fma(_936, _968, _996);
    float _1008 = in.m_51.x;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1012 = _1010 != 0;
    float _1014 = fma(_1004, _252, _992);
    float _1016 = fma(_1004, _244, _1002);
    float _1018 = in.m_37.w;
    float _1020 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1022 = fma(_1006, _292, _1014);
    float _1024 = fma(_1006, _284, _1016);
    float _1026 = in.m_51.y;
    float _1028 = _960 + _1022;
    float _1030 = _942 + _1024;
    float _1032 = _968;
    float _1034 = _986;
    if (_1000)
    {
        float _1036 = in.m_43.x;
        _1032 = _1036;
    }
    float _1038 = _1032;
    float _1040 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1042 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1044 = _1028 + _1042;
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1048 = _1030 + _1046;
    float _1050 = _1044 * _1044;
    float _1052 = fma(_1048, _1048, _1050);
    if (_1000)
    {
        _186 = _1008;
    }
    float _1054 = _186;
    float _1056 = sqrt(_1052);
    float _1058 = _946 + _1018;
    float _1060 = -_1026;
    float _1062 = _1060 + 1.0;
    bool _1064 = _1038 > 0.5;
    bool _1066 = _1064 && _1000;
    float _1068 = _986 * _276;
    float _1070 = _1026;
    float _1072 = _1054;
    if (_1012)
    {
        float _1074 = _940 ? _1062 : _1026;
        _1070 = _1074;
    }
    float _1076 = _1070;
    float _1078 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_1000)
    {
        _1034 = _1008;
    }
    float _1080 = _1034;
    float _1082 = fma(_1004, _248, _1068);
    bool _1084 = _1056 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1086 = fma(_1078, _1076, -0.5);
    float _1088 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1090 = fma(_1006, _288, _1082);
    float _1092 = -_716;
    float _1094 = fma(_712, _1086, _1092);
    float _1096 = _1080;
    float _1098 = _1086;
    float _1100 = _1088;
    if (_1066)
    {
        float _1102 = -_1054;
        float _1104 = _1102 + 1.0;
        _1072 = _1104;
    }
    float _1106 = _1072;
    float _1108 = _1058 + _1090;
    if (_1000)
    {
        _1096 = _1106;
    }
    float _1110 = _1096;
    float _1112 = _1110;
    if (!_1084)
    {
        _1098 = _1030;
    }
    float _1114 = _1098;
    float _1116 = fma(_1088, _1110, -0.5);
    float _1118 = _1114;
    if (!_1084)
    {
        _1112 = _1028;
    }
    float _1120 = _1112;
    float _1122 = _1120;
    if (!_1084)
    {
        _1100 = _1108;
    }
    float _1124 = _1100;
    bool _1126 = !_1084;
    float _1128 = _1124;
    if (!_1126)
    {
        float _1130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1132 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1134 = _1056 + _1132;
        float _1136 = rsqrt(_1052);
        float _1138 = _1134 * _1130;
        float _1140 = _1108 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = _1138 * 0.15915493667125701904296875;
        float _1144 = _1142 * 6.283185482025146484375;
        float _1146 = cos(_1144);
        float _1148 = _1142 * 6.283185482025146484375;
        float _1150 = sin(_1148);
        float _1152 = _1146 + (-1.0);
        float _1154 = _1152 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1156 = fma(_1150, _1140, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1158 = fma(_1108, _1146, _1154);
        float _1160 = _1136 * _1156;
        float _1162 = fma(_1048, _1160, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1164 = fma(_1044, _1160, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1128 = _1158;
        _1118 = _1162;
        _1122 = _1164;
    }
    float _1166 = _1128;
    float _1168 = _1118;
    float _1170 = _1122;
    float _1172 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1176 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1178 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1180 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1172);
    float _1182 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1174);
    float _1184 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1176);
    float _1186 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1178);
    float _1188 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1180);
    float _1190 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1182);
    float _1192 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1184);
    float _1194 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1186);
    float _1196 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1198 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1200 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1202 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1204 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1206 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1208 = _1196 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1210 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1202);
    float _1212 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1204);
    float _1214 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1206);
    float _1216 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1208);
    float _1218 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1210);
    float _1220 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1212);
    float _1222 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1214);
    float _1224 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1216);
    float _1226 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1228 = fma(_724, _1116, _710);
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1236 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1222);
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1240 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1244 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1246 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1248 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1250 = _1094 + 0.5;
    float _1252 = _1228 + 0.5;
    float _1254 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1218);
    float _1256 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1220);
    float _1258 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1224);
    out.m_53.w = _1238;
    out.m_55.w = _1240;
    out.m_57.x = _1244;
    out.m_57.y = _1246;
    out.m_57.z = _1248;
    out.m_57.w = _1242;
    out.m_59.x = _1252;
    out.m_59.y = _1250;
    out.gl_Position.x = _1254;
    out.gl_Position.y = _1256;
    out.gl_Position.z = _1236;
    out.gl_Position.w = _1258;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

