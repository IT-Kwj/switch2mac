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
    float4 m_45 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_29 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_47 [[attribute(5)]];
    float4 m_33 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
    float4 m_39 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _714 = false;
    bool _554 = false;
    bool _274 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_26.w;
    float _69 = trunc(_67);
    int _72 = int(_69);
    bool _76 = _72 >= 1;
    float _78 = 0.0;
    if (!_76)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _80 = _78;
    if (!_76)
    {
        out.m_29.x = 0.0;
    }
    int _82 = 0;
    if (!_76)
    {
        float _84 = _80 * 5.0;
        _82 = as_type<int>(_84);
    }
    int _86 = _82;
    int _88 = _86;
    if (!_76)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1050 = as_type<float>(_86);
        out.gl_Position.z = _1050;
    }
    if (!_76)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _90 = in.m_31.w;
    float _92 = float(_72);
    float _94 = in.m_33.y;
    float _96 = 1.0 / _92;
    float _98 = in.m_33.x;
    float _100 = -_90;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = _90 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_90);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = _102 * _96;
    bool _116 = _102 >= _92;
    bool _118 = !_112;
    bool _120 = _116 || _118;
    out.m_35.y = _94;
    out.m_35.x = _98;
    out.m_37.x = _114;
    float _122 = _90;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_29.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _88 = as_type<int>(_126);
    }
    int _128 = _88;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1129 = as_type<float>(_128);
        out.gl_Position.z = _1129;
    }
    if (_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_39.x;
    float _132 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _134 = in.m_39.y;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_41.w;
    float _148 = in.m_31.x;
    float _150 = in.m_31.y;
    float _152 = in.m_31.z;
    float _154 = in.m_26.x;
    float _156 = in.m_26.y;
    float _158 = in.m_26.z;
    float _160 = 0.0;
    float _162 = _132;
    if (!_144)
    {
        float _164 = _132 * _132;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = _168;
    if (!_144)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    out.m_43.x = _130;
    out.m_43.y = _134;
    bool _176 = !_144;
    float _178 = _174;
    if (!_176)
    {
        float _180 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = log2(_180);
        float _184 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _186 = _184 + 1.0;
        float _188 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = _132 * _182;
        float _192 = 1.0 / _186;
        float _194 = _188 * 0.693147182464599609375;
        float _196 = exp2(_190);
        float _198 = 1.0 / _194;
        float _200 = _196 + (-1.0);
        float _202 = -_200;
        float _204 = fma(_202, _198, _132);
        float _206 = _204 * _192;
        float _208 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _208;
    }
    float _210 = _178;
    bool _212 = !_144;
    if (!_212)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = 1.0 / _220;
        float _224 = _132 * _216;
        float _226 = exp2(_224);
        float _228 = -_226;
        float _230 = _228 + 1.0;
        float _232 = _230 * _222;
        _162 = _232;
    }
    float _234 = _162;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _238 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _240 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _242 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _244 = fma(_234, _148, _238);
    float _246 = fma(_234, _150, _240);
    float _248 = fma(_234, _152, _242);
    float _250 = fma(_244, _146, _154);
    float _252 = fma(_246, _146, _156);
    float _254 = fma(_248, _146, _158);
    bool _256 = !_236;
    float _272;
    if (!_256)
    {
        float _258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _260 = _98 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _264 = _262 * _258;
        float _266 = floor(_264);
        float _268 = -_266;
        float _270 = _264 + _268;
        _272 = _270;
        _274 = true;
    }
    else
    {
        _272 = _114;
    }
    _274 = false;
    float _276 = _272;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _276 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _276 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = _276 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _306 = 1.0 / _292;
    bool _308 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_276);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = 1.0 / _296;
    bool _322 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _324 = 1.0 / _300;
    float _326 = _280 * _306;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _330 = _276 + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = fma(_334, _326, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _338 = 1.0 / _304;
    float _340 = _284 * _320;
    bool _342 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _344 = isnan(_276);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_352;
    float _356 = _354 + 1.0;
    float _358 = _288 * _324;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _360;
    float _364 = fma(_362, _326, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _366 = _330 * _338;
    bool _368 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _370 = isnan(_276);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    bool _380 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _382 = isnan(_276);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = _378 * _356;
    float _394 = -_378;
    float _396 = _394 + 1.0;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _398;
    float _402 = -_390;
    float _404 = _402 + 1.0;
    float _406 = _318 * _396;
    float _408 = -_318;
    float _410 = _408 + 1.0;
    float _412 = fma(_400, _326, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _414 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _416 = isnan(_276);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = _390 * _410;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = _424 * _404;
    float _442 = fma(_428, _340, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _444 = fma(_434, _340, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _446 = fma(_438, _340, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _448 = _412 * _440;
    float _450 = _336 * _440;
    float _452 = _364 * _440;
    float _454 = -_424;
    float _456 = _454 + 1.0;
    float _458 = in.m_41.x;
    float _460 = in.m_41.y;
    float _462 = in.m_41.z;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _472;
    float _476 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].x, _448);
    float _478 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].y, _450);
    float _480 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].z, _452);
    float _482 = fma(_466, _358, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _484 = fma(_470, _358, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _486 = fma(_474, _358, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _488 = fma(_442, _430, _476);
    float _490 = fma(_444, _430, _478);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _504 = fma(_446, _430, _480);
    float _506 = fma(_494, _366, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _508 = fma(_498, _366, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _510 = fma(_482, _406, _488);
    float _512 = fma(_484, _406, _490);
    float _514 = fma(_502, _366, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _516 = fma(_486, _406, _504);
    float _518 = fma(_506, _392, _510);
    float _520 = fma(_508, _392, _512);
    float _522 = fma(_514, _392, _516);
    float _524 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[147].x, _518);
    float _526 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[147].y, _520);
    float _528 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[147].z, _522);
    float _530 = _524 * _458;
    float _532 = _526 * _460;
    float _534 = _528 * _462;
    bool _536 = !_322;
    float _552;
    if (!_536)
    {
        float _538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _540 = _98 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _544 = _542 * _538;
        float _546 = floor(_544);
        float _548 = -_546;
        float _550 = _544 + _548;
        _552 = _550;
        _554 = true;
    }
    else
    {
        _552 = _114;
    }
    _554 = false;
    float _556 = _552;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _560 = _556 + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _570 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _572 = isnan(_556);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _586 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _588 = isnan(_556);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = 1.0 / _564;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _600;
    float _604 = -_580;
    float _606 = _604 + 1.0;
    bool _608 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _610 = isnan(_556);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    bool _620 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _622 = 1.0 / _568;
    float _624 = 1.0 / _584;
    float _626 = _602 * _598;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _632 = _596 * _606;
    float _634 = -_596;
    float _636 = _634 + 1.0;
    float _638 = fma(_626, _560, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _640;
    float _644 = _618 * _636;
    float _646 = _630 * _622;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _650 = _556 + _648;
    bool _652 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _654 = isnan(_556);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _638 * _644;
    float _666 = -_618;
    float _668 = _666 + 1.0;
    float _670 = fma(_646, _650, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _674 = _556 + _672;
    float _676 = _642 * _624;
    float _678 = -_662;
    float _680 = _678 + 1.0;
    float _682 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[115].x, _664);
    float _684 = fma(_676, _674, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _686 = _580 * _680;
    float _688 = fma(_670, _632, _682);
    float _690 = fma(_684, _686, _688);
    float _692 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[118].x, _690);
    float _694 = _692 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_45.w = _694;
    bool _696 = !_620;
    float _712;
    if (!_696)
    {
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _700 = _98 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        _712 = _114;
    }
    _714 = false;
    float _716 = _712;
    float _718 = in.m_47.x;
    float _720 = in.m_47.y;
    float _722 = in.m_47.z;
    float _724 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _726 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _728 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _730 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _724);
    float _732 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _738 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _726);
    float _740 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _728);
    float _742 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _730);
    float _744 = 1.0 / _736;
    float _746 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _738);
    float _748 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _740);
    float _750 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _752 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _754 = isnan(_716);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _718);
    float _766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _720);
    float _768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _722);
    float _770 = _732 * _766;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _776;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _784 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _786 = isnan(_716);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = _750 * _768;
    float _798 = _778 * _744;
    float _800 = 1.0 / _782;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _804 = _716 + _802;
    float _806 = -_794;
    float _808 = _806 + 1.0;
    bool _810 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _812 = isnan(_716);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = fma(_798, _804, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _824 = _762 * _808;
    float _826 = -_762;
    float _828 = _826 + 1.0;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _834 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _836 = isnan(_716);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = 1.0 / _774;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _850 = _716 + _848;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _854 = _716 + _852;
    float _856 = _844 * _828;
    float _858 = -_844;
    float _860 = _858 + 1.0;
    float _862 = _832 * _800;
    float _864 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _866 = _820 * _860;
    float _868 = -_820;
    float _870 = _868 + 1.0;
    float _872 = fma(_862, _850, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _874 = _864 * _764;
    float _876 = _822 * _866;
    float _878 = _770 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _880 = _770 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _882;
    float _886 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[131].x, _876);
    float _888 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[25].x, _878);
    float _890 = _770 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _892 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[24].x, _880);
    float _894 = _884 * _846;
    float _896 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[25].z, _888);
    float _898 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[26].x, _890);
    float _900 = _746 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _902 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[24].z, _892);
    float _904 = _896 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _906 = fma(_894, _854, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _908 = fma(_872, _856, _886);
    float _910 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[26].z, _898);
    float _912 = _900 + _904;
    float _914 = _742 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _916 = _902 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _918 = fma(_906, _824, _908);
    float _920 = _748 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _922 = _910 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _924 = _914 + _916;
    float _926 = _912 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _928 = _912 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _930 = _920 + _922;
    float _932 = _912 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _934 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[1].x, _926);
    float _936 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[0].x, _928);
    float _938 = _912 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _940 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[2].x, _932);
    float _942 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _934);
    float _944 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _936);
    float _946 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[134].x, _918);
    float _948 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[3].x, _938);
    float _950 = _942 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _952 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _940);
    float _954 = _944 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _956 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _948);
    float _958 = _950 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _960 = _950 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _962 = _950 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _964 = _950 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _966 = _952 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _968 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[4].x, _958);
    float _970 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[5].x, _960);
    float _972 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[6].x, _962);
    float _974 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[7].x, _964);
    float _976 = _956 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _978 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[4].z, _968);
    float _980 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[5].z, _970);
    float _982 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[6].z, _972);
    float _984 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[7].z, _974);
    float _986 = _946 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[4].w, _978);
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[5].w, _980);
    float _992 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[6].w, _982);
    float _994 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[7].w, _984);
    out.m_49.x = _864;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_51.x = _924;
    out.m_51.y = _912;
    out.m_51.z = _930;
    out.m_53.w = _986;
    out.gl_Position.x = _988;
    out.gl_Position.y = _990;
    out.gl_Position.z = _992;
    out.gl_Position.w = _994;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _714 = false;
    bool _554 = false;
    bool _274 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_26.w;
    float _69 = trunc(_67);
    int _72 = int(_69);
    bool _76 = _72 >= 1;
    float _78 = 0.0;
    if (!_76)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _80 = _78;
    if (!_76)
    {
        out.m_29.x = 0.0;
    }
    int _82 = 0;
    if (!_76)
    {
        float _84 = _80 * 5.0;
        _82 = as_type<int>(_84);
    }
    int _86 = _82;
    int _88 = _86;
    if (!_76)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1050 = as_type<float>(_86);
        out.gl_Position.z = _1050;
    }
    if (!_76)
    {
        return out;
    }
    float _90 = in.m_31.w;
    float _92 = float(_72);
    float _94 = in.m_33.y;
    float _96 = 1.0 / _92;
    float _98 = in.m_33.x;
    float _100 = -_90;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = _90 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_90);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = _102 * _96;
    bool _116 = _102 >= _92;
    bool _118 = !_112;
    bool _120 = _116 || _118;
    out.m_35.y = _94;
    out.m_35.x = _98;
    out.m_37.x = _114;
    float _122 = _90;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_29.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _88 = as_type<int>(_126);
    }
    int _128 = _88;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1129 = as_type<float>(_128);
        out.gl_Position.z = _1129;
    }
    if (_120)
    {
        return out;
    }
    float _130 = in.m_39.x;
    float _132 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _134 = in.m_39.y;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_41.w;
    float _148 = in.m_31.x;
    float _150 = in.m_31.y;
    float _152 = in.m_31.z;
    float _154 = in.m_26.x;
    float _156 = in.m_26.y;
    float _158 = in.m_26.z;
    float _160 = 0.0;
    float _162 = _132;
    if (!_144)
    {
        float _164 = _132 * _132;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = _168;
    if (!_144)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    out.m_43.x = _130;
    out.m_43.y = _134;
    bool _176 = !_144;
    float _178 = _174;
    if (!_176)
    {
        float _180 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = log2(_180);
        float _184 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _186 = _184 + 1.0;
        float _188 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = _132 * _182;
        float _192 = 1.0 / _186;
        float _194 = _188 * 0.693147182464599609375;
        float _196 = exp2(_190);
        float _198 = 1.0 / _194;
        float _200 = _196 + (-1.0);
        float _202 = -_200;
        float _204 = fma(_202, _198, _132);
        float _206 = _204 * _192;
        float _208 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _208;
    }
    float _210 = _178;
    bool _212 = !_144;
    if (!_212)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = 1.0 / _220;
        float _224 = _132 * _216;
        float _226 = exp2(_224);
        float _228 = -_226;
        float _230 = _228 + 1.0;
        float _232 = _230 * _222;
        _162 = _232;
    }
    float _234 = _162;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _238 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _240 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _242 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _244 = fma(_234, _148, _238);
    float _246 = fma(_234, _150, _240);
    float _248 = fma(_234, _152, _242);
    float _250 = fma(_244, _146, _154);
    float _252 = fma(_246, _146, _156);
    float _254 = fma(_248, _146, _158);
    bool _256 = !_236;
    float _272;
    if (!_256)
    {
        float _258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _260 = _98 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _264 = _262 * _258;
        float _266 = floor(_264);
        float _268 = -_266;
        float _270 = _264 + _268;
        _272 = _270;
        _274 = true;
    }
    else
    {
        _272 = _114;
    }
    _274 = false;
    float _276 = _272;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _276 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _276 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = _276 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _306 = 1.0 / _292;
    bool _308 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_276);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = 1.0 / _296;
    bool _322 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _324 = 1.0 / _300;
    float _326 = _280 * _306;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _330 = _276 + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = fma(_334, _326, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _338 = 1.0 / _304;
    float _340 = _284 * _320;
    bool _342 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _344 = isnan(_276);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_352;
    float _356 = _354 + 1.0;
    float _358 = _288 * _324;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _360;
    float _364 = fma(_362, _326, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _366 = _330 * _338;
    bool _368 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _370 = isnan(_276);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    bool _380 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _382 = isnan(_276);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = _378 * _356;
    float _394 = -_378;
    float _396 = _394 + 1.0;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _398;
    float _402 = -_390;
    float _404 = _402 + 1.0;
    float _406 = _318 * _396;
    float _408 = -_318;
    float _410 = _408 + 1.0;
    float _412 = fma(_400, _326, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _414 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _416 = isnan(_276);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = _390 * _410;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = _424 * _404;
    float _442 = fma(_428, _340, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _444 = fma(_434, _340, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _446 = fma(_438, _340, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _448 = _412 * _440;
    float _450 = _336 * _440;
    float _452 = _364 * _440;
    float _454 = -_424;
    float _456 = _454 + 1.0;
    float _458 = in.m_41.x;
    float _460 = in.m_41.y;
    float _462 = in.m_41.z;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _472;
    float _476 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].x, _448);
    float _478 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].y, _450);
    float _480 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].z, _452);
    float _482 = fma(_466, _358, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _484 = fma(_470, _358, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _486 = fma(_474, _358, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _488 = fma(_442, _430, _476);
    float _490 = fma(_444, _430, _478);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _504 = fma(_446, _430, _480);
    float _506 = fma(_494, _366, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _508 = fma(_498, _366, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _510 = fma(_482, _406, _488);
    float _512 = fma(_484, _406, _490);
    float _514 = fma(_502, _366, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _516 = fma(_486, _406, _504);
    float _518 = fma(_506, _392, _510);
    float _520 = fma(_508, _392, _512);
    float _522 = fma(_514, _392, _516);
    float _524 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[147].x, _518);
    float _526 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[147].y, _520);
    float _528 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[147].z, _522);
    float _530 = _524 * _458;
    float _532 = _526 * _460;
    float _534 = _528 * _462;
    bool _536 = !_322;
    float _552;
    if (!_536)
    {
        float _538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _540 = _98 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _544 = _542 * _538;
        float _546 = floor(_544);
        float _548 = -_546;
        float _550 = _544 + _548;
        _552 = _550;
        _554 = true;
    }
    else
    {
        _552 = _114;
    }
    _554 = false;
    float _556 = _552;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _560 = _556 + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _570 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _572 = isnan(_556);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _586 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _588 = isnan(_556);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = 1.0 / _564;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _600;
    float _604 = -_580;
    float _606 = _604 + 1.0;
    bool _608 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _610 = isnan(_556);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    bool _620 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _622 = 1.0 / _568;
    float _624 = 1.0 / _584;
    float _626 = _602 * _598;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _632 = _596 * _606;
    float _634 = -_596;
    float _636 = _634 + 1.0;
    float _638 = fma(_626, _560, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _640;
    float _644 = _618 * _636;
    float _646 = _630 * _622;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _650 = _556 + _648;
    bool _652 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _654 = isnan(_556);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _638 * _644;
    float _666 = -_618;
    float _668 = _666 + 1.0;
    float _670 = fma(_646, _650, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _674 = _556 + _672;
    float _676 = _642 * _624;
    float _678 = -_662;
    float _680 = _678 + 1.0;
    float _682 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[115].x, _664);
    float _684 = fma(_676, _674, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _686 = _580 * _680;
    float _688 = fma(_670, _632, _682);
    float _690 = fma(_684, _686, _688);
    float _692 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[118].x, _690);
    float _694 = _692 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_45.w = _694;
    bool _696 = !_620;
    float _712;
    if (!_696)
    {
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _700 = _98 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        _712 = _114;
    }
    _714 = false;
    float _716 = _712;
    float _718 = in.m_47.x;
    float _720 = in.m_47.y;
    float _722 = in.m_47.z;
    float _724 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _726 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _728 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _730 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _724);
    float _732 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _738 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _726);
    float _740 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _728);
    float _742 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _730);
    float _744 = 1.0 / _736;
    float _746 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _738);
    float _748 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _740);
    float _750 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _752 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _754 = isnan(_716);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _718);
    float _766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _720);
    float _768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _722);
    float _770 = _732 * _766;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _776;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _784 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _786 = isnan(_716);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = _750 * _768;
    float _798 = _778 * _744;
    float _800 = 1.0 / _782;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _804 = _716 + _802;
    float _806 = -_794;
    float _808 = _806 + 1.0;
    bool _810 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _812 = isnan(_716);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = fma(_798, _804, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _824 = _762 * _808;
    float _826 = -_762;
    float _828 = _826 + 1.0;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _834 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _836 = isnan(_716);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = 1.0 / _774;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _850 = _716 + _848;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _854 = _716 + _852;
    float _856 = _844 * _828;
    float _858 = -_844;
    float _860 = _858 + 1.0;
    float _862 = _832 * _800;
    float _864 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _866 = _820 * _860;
    float _868 = -_820;
    float _870 = _868 + 1.0;
    float _872 = fma(_862, _850, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _874 = _864 * _764;
    float _876 = _822 * _866;
    float _878 = _770 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _880 = _770 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _882;
    float _886 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[131].x, _876);
    float _888 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[25].x, _878);
    float _890 = _770 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _892 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[24].x, _880);
    float _894 = _884 * _846;
    float _896 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[25].z, _888);
    float _898 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[26].x, _890);
    float _900 = _746 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _902 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[24].z, _892);
    float _904 = _896 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _906 = fma(_894, _854, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _908 = fma(_872, _856, _886);
    float _910 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[26].z, _898);
    float _912 = _900 + _904;
    float _914 = _742 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _916 = _902 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _918 = fma(_906, _824, _908);
    float _920 = _748 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _922 = _910 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _924 = _914 + _916;
    float _926 = _912 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _928 = _912 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _930 = _920 + _922;
    float _932 = _912 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _934 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[1].x, _926);
    float _936 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[0].x, _928);
    float _938 = _912 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _940 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[2].x, _932);
    float _942 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _934);
    float _944 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _936);
    float _946 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[134].x, _918);
    float _948 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[3].x, _938);
    float _950 = _942 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _952 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _940);
    float _954 = _944 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _956 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _948);
    float _958 = _950 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _960 = _950 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _962 = _950 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _964 = _950 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _966 = _952 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _968 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[4].x, _958);
    float _970 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[5].x, _960);
    float _972 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[6].x, _962);
    float _974 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[7].x, _964);
    float _976 = _956 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _978 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[4].z, _968);
    float _980 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[5].z, _970);
    float _982 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[6].z, _972);
    float _984 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[7].z, _974);
    float _986 = _946 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[4].w, _978);
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[5].w, _980);
    float _992 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[6].w, _982);
    float _994 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[7].w, _984);
    out.m_49.x = _864;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_51.x = _924;
    out.m_51.y = _912;
    out.m_51.z = _930;
    out.m_53.w = _986;
    out.gl_Position.x = _988;
    out.gl_Position.y = _990;
    out.gl_Position.z = _992;
    out.gl_Position.w = _994;
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _714 = false;
    bool _554 = false;
    bool _274 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_26.w;
    float _69 = trunc(_67);
    int _72 = int(_69);
    bool _76 = _72 >= 1;
    float _78 = 0.0;
    if (!_76)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _80 = _78;
    if (!_76)
    {
        out.m_29.x = 0.0;
    }
    int _82 = 0;
    if (!_76)
    {
        float _84 = _80 * 5.0;
        _82 = as_type<int>(_84);
    }
    int _86 = _82;
    int _88 = _86;
    if (!_76)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1050 = as_type<float>(_86);
        out.gl_Position.z = _1050;
    }
    if (!_76)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _90 = in.m_31.w;
    float _92 = float(_72);
    float _94 = in.m_33.y;
    float _96 = 1.0 / _92;
    float _98 = in.m_33.x;
    float _100 = -_90;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = _90 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_90);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = _102 * _96;
    bool _116 = _102 >= _92;
    bool _118 = !_112;
    bool _120 = _116 || _118;
    out.m_35.y = _94;
    out.m_35.x = _98;
    out.m_37.x = _114;
    float _122 = _90;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_29.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _88 = as_type<int>(_126);
    }
    int _128 = _88;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1129 = as_type<float>(_128);
        out.gl_Position.z = _1129;
    }
    if (_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_39.x;
    float _132 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _134 = in.m_39.y;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_41.w;
    float _148 = in.m_31.x;
    float _150 = in.m_31.y;
    float _152 = in.m_31.z;
    float _154 = in.m_26.x;
    float _156 = in.m_26.y;
    float _158 = in.m_26.z;
    float _160 = 0.0;
    float _162 = _132;
    if (!_144)
    {
        float _164 = _132 * _132;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = _168;
    if (!_144)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    out.m_43.x = _130;
    out.m_43.y = _134;
    bool _176 = !_144;
    float _178 = _174;
    if (!_176)
    {
        float _180 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = log2(_180);
        float _184 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _186 = _184 + 1.0;
        float _188 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = _132 * _182;
        float _192 = 1.0 / _186;
        float _194 = _188 * 0.693147182464599609375;
        float _196 = exp2(_190);
        float _198 = 1.0 / _194;
        float _200 = _196 + (-1.0);
        float _202 = -_200;
        float _204 = fma(_202, _198, _132);
        float _206 = _204 * _192;
        float _208 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _208;
    }
    float _210 = _178;
    bool _212 = !_144;
    if (!_212)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = 1.0 / _220;
        float _224 = _132 * _216;
        float _226 = exp2(_224);
        float _228 = -_226;
        float _230 = _228 + 1.0;
        float _232 = _230 * _222;
        _162 = _232;
    }
    float _234 = _162;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _238 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _240 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _242 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _244 = fma(_234, _148, _238);
    float _246 = fma(_234, _150, _240);
    float _248 = fma(_234, _152, _242);
    float _250 = fma(_244, _146, _154);
    float _252 = fma(_246, _146, _156);
    float _254 = fma(_248, _146, _158);
    bool _256 = !_236;
    float _272;
    if (!_256)
    {
        float _258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _260 = _98 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _264 = _262 * _258;
        float _266 = floor(_264);
        float _268 = -_266;
        float _270 = _264 + _268;
        _272 = _270;
        _274 = true;
    }
    else
    {
        _272 = _114;
    }
    _274 = false;
    float _276 = _272;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _276 + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _276 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = _276 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _306 = 1.0 / _292;
    bool _308 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_276);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = 1.0 / _296;
    bool _322 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _324 = 1.0 / _300;
    float _326 = _280 * _306;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _330 = _276 + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = fma(_334, _326, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _338 = 1.0 / _304;
    float _340 = _284 * _320;
    bool _342 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _344 = isnan(_276);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_352;
    float _356 = _354 + 1.0;
    float _358 = _288 * _324;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _360;
    float _364 = fma(_362, _326, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _366 = _330 * _338;
    bool _368 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _370 = isnan(_276);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    bool _380 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _382 = isnan(_276);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = _378 * _356;
    float _394 = -_378;
    float _396 = _394 + 1.0;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _398;
    float _402 = -_390;
    float _404 = _402 + 1.0;
    float _406 = _318 * _396;
    float _408 = -_318;
    float _410 = _408 + 1.0;
    float _412 = fma(_400, _326, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _414 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _416 = isnan(_276);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = _390 * _410;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = _424 * _404;
    float _442 = fma(_428, _340, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _444 = fma(_434, _340, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _446 = fma(_438, _340, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _448 = _412 * _440;
    float _450 = _336 * _440;
    float _452 = _364 * _440;
    float _454 = -_424;
    float _456 = _454 + 1.0;
    float _458 = in.m_41.x;
    float _460 = in.m_41.y;
    float _462 = in.m_41.z;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _472;
    float _476 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].x, _448);
    float _478 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].y, _450);
    float _480 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].z, _452);
    float _482 = fma(_466, _358, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _484 = fma(_470, _358, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _486 = fma(_474, _358, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _488 = fma(_442, _430, _476);
    float _490 = fma(_444, _430, _478);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _504 = fma(_446, _430, _480);
    float _506 = fma(_494, _366, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _508 = fma(_498, _366, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _510 = fma(_482, _406, _488);
    float _512 = fma(_484, _406, _490);
    float _514 = fma(_502, _366, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _516 = fma(_486, _406, _504);
    float _518 = fma(_506, _392, _510);
    float _520 = fma(_508, _392, _512);
    float _522 = fma(_514, _392, _516);
    float _524 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[147].x, _518);
    float _526 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[147].y, _520);
    float _528 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[147].z, _522);
    float _530 = _524 * _458;
    float _532 = _526 * _460;
    float _534 = _528 * _462;
    bool _536 = !_322;
    float _552;
    if (!_536)
    {
        float _538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _540 = _98 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _544 = _542 * _538;
        float _546 = floor(_544);
        float _548 = -_546;
        float _550 = _544 + _548;
        _552 = _550;
        _554 = true;
    }
    else
    {
        _552 = _114;
    }
    _554 = false;
    float _556 = _552;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _560 = _556 + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _570 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _572 = isnan(_556);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _586 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _588 = isnan(_556);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = 1.0 / _564;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _600;
    float _604 = -_580;
    float _606 = _604 + 1.0;
    bool _608 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _610 = isnan(_556);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    bool _620 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _622 = 1.0 / _568;
    float _624 = 1.0 / _584;
    float _626 = _602 * _598;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _632 = _596 * _606;
    float _634 = -_596;
    float _636 = _634 + 1.0;
    float _638 = fma(_626, _560, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _640;
    float _644 = _618 * _636;
    float _646 = _630 * _622;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _650 = _556 + _648;
    bool _652 = _556 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _654 = isnan(_556);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _638 * _644;
    float _666 = -_618;
    float _668 = _666 + 1.0;
    float _670 = fma(_646, _650, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _674 = _556 + _672;
    float _676 = _642 * _624;
    float _678 = -_662;
    float _680 = _678 + 1.0;
    float _682 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[115].x, _664);
    float _684 = fma(_676, _674, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _686 = _580 * _680;
    float _688 = fma(_670, _632, _682);
    float _690 = fma(_684, _686, _688);
    float _692 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[118].x, _690);
    float _694 = _692 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_45.w = _694;
    bool _696 = !_620;
    float _712;
    if (!_696)
    {
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _700 = _98 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        _712 = _114;
    }
    _714 = false;
    float _716 = _712;
    float _718 = in.m_47.x;
    float _720 = in.m_47.y;
    float _722 = in.m_47.z;
    float _724 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _726 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _728 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _730 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _724);
    float _732 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _738 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _726);
    float _740 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _728);
    float _742 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _730);
    float _744 = 1.0 / _736;
    float _746 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _738);
    float _748 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _740);
    float _750 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _752 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _754 = isnan(_716);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _718);
    float _766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _720);
    float _768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _722);
    float _770 = _732 * _766;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _776;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _784 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _786 = isnan(_716);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = _750 * _768;
    float _798 = _778 * _744;
    float _800 = 1.0 / _782;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _804 = _716 + _802;
    float _806 = -_794;
    float _808 = _806 + 1.0;
    bool _810 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _812 = isnan(_716);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = fma(_798, _804, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _824 = _762 * _808;
    float _826 = -_762;
    float _828 = _826 + 1.0;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _834 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _836 = isnan(_716);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = 1.0 / _774;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _850 = _716 + _848;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _854 = _716 + _852;
    float _856 = _844 * _828;
    float _858 = -_844;
    float _860 = _858 + 1.0;
    float _862 = _832 * _800;
    float _864 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _866 = _820 * _860;
    float _868 = -_820;
    float _870 = _868 + 1.0;
    float _872 = fma(_862, _850, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _874 = _864 * _764;
    float _876 = _822 * _866;
    float _878 = _770 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _880 = _770 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _882;
    float _886 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[131].x, _876);
    float _888 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[25].x, _878);
    float _890 = _770 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _892 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[24].x, _880);
    float _894 = _884 * _846;
    float _896 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[25].z, _888);
    float _898 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[26].x, _890);
    float _900 = _746 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _902 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[24].z, _892);
    float _904 = _896 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _906 = fma(_894, _854, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _908 = fma(_872, _856, _886);
    float _910 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[26].z, _898);
    float _912 = _900 + _904;
    float _914 = _742 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _916 = _902 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _918 = fma(_906, _824, _908);
    float _920 = _748 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _922 = _910 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _924 = _914 + _916;
    float _926 = _912 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _928 = _912 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _930 = _920 + _922;
    float _932 = _912 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _934 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[1].x, _926);
    float _936 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[0].x, _928);
    float _938 = _912 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _940 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[2].x, _932);
    float _942 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _934);
    float _944 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _936);
    float _946 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[134].x, _918);
    float _948 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[3].x, _938);
    float _950 = _942 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _952 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _940);
    float _954 = _944 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _956 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _948);
    float _958 = _950 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _960 = _950 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _962 = _950 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _964 = _950 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _966 = _952 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _968 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[4].x, _958);
    float _970 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[5].x, _960);
    float _972 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[6].x, _962);
    float _974 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[7].x, _964);
    float _976 = _956 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _978 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[4].z, _968);
    float _980 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[5].z, _970);
    float _982 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[6].z, _972);
    float _984 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[7].z, _974);
    float _986 = _946 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[4].w, _978);
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[5].w, _980);
    float _992 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[6].w, _982);
    float _994 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[7].w, _984);
    out.m_49.x = _864;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_51.x = _924;
    out.m_51.y = _912;
    out.m_51.z = _930;
    out.m_53.w = _986;
    out.gl_Position.x = _988;
    out.gl_Position.y = _990;
    out.gl_Position.z = _992;
    out.gl_Position.w = _994;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

