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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
};

struct main0_out
{
    float4 m_45 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_53 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_51 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_34 [[attribute(2)]];
    float4 m_39 [[attribute(3)]];
    float4 m_49 [[attribute(5)]];
    float4 m_43 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
    float4 m_47 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1858 = false;
    bool _1116 = false;
    bool _898 = false;
    bool _514 = false;
    bool _280 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_34.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_88)
    {
        out.m_37.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _92 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2307 = as_type<float>(_100);
        out.gl_Position.z = _2307;
    }
    if (!_88)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _104 = in.m_39.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_114)
    {
        float _120 = float(_84);
        _94 = _120;
    }
    float _122 = _94;
    bool _124 = _118 >= _122;
    bool _126 = !_114;
    bool _128 = _124 || _126;
    float _130 = _122;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_37.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _102 = as_type<int>(_134);
    }
    int _136 = _102;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2376 = as_type<float>(_136);
        out.gl_Position.z = _2376;
    }
    if (_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_41.w;
    float _140 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = in.m_39.x;
    float _154 = in.m_39.y;
    float _156 = in.m_39.z;
    float _158 = in.m_34.x;
    float _160 = in.m_34.y;
    float _162 = in.m_34.z;
    float _164 = 0.0;
    float _166 = _140;
    if (!_150)
    {
        float _168 = _140 * _140;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = _172;
    if (!_150)
    {
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _176;
    }
    float _178 = _174;
    bool _180 = !_150;
    float _182 = _178;
    if (!_180)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _140 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _140);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _212;
    }
    float _214 = _182;
    bool _216 = !_150;
    if (!_216)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _140 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _166 = _236;
    }
    float _238 = _166;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _242 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _244 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _248 = fma(_238, _152, _242);
    float _250 = fma(_238, _154, _244);
    float _252 = fma(_238, _156, _246);
    float _254 = fma(_248, _138, _158);
    float _256 = fma(_250, _138, _160);
    float _258 = fma(_252, _138, _162);
    bool _260 = !_240;
    float _278;
    if (!_260)
    {
        float _262 = in.m_43.x;
        float _264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _266 = _262 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _270 = _268 * _264;
        float _272 = floor(_270);
        float _274 = -_272;
        float _276 = _270 + _274;
        _278 = _276;
        _280 = true;
    }
    else
    {
        float _282 = float(_84);
        float _284 = 1.0 / _282;
        float _286 = _118 * _284;
        _278 = _286;
    }
    _280 = false;
    float _288 = _278;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = _288 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = _288 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _288 + _310;
    bool _314 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _316 = isnan(_288);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = 1.0 / _300;
    bool _328 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _330 = isnan(_288);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_324;
    float _342 = _340 + 1.0;
    bool _344 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _346 = isnan(_288);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = 1.0 / _308;
    float _358 = _338 * _342;
    float _360 = -_338;
    float _362 = _360 + 1.0;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _366 = 1.0 / _304;
    float _368 = _292 * _326;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _374;
    float _378 = _296 * _356;
    bool _380 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _382 = isnan(_288);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = fma(_376, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = _312 * _366;
    float _404 = fma(_372, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = -_390;
    float _412 = _410 + 1.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _414;
    float _418 = _390 * _362;
    float _420 = fma(_396, _402, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_408, _402, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = fma(_400, _402, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = _354 * _412;
    float _428 = in.m_41.x;
    float _430 = in.m_41.y;
    float _432 = in.m_41.z;
    float _434 = fma(_416, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _436 = -_354;
    float _438 = _436 + 1.0;
    float _440 = _404 * _426;
    float _442 = _392 * _426;
    float _444 = _434 * _426;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _450;
    float _454 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].x, _440);
    float _456 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].y, _442);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].z, _444);
    float _464 = fma(_448, _378, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_452, _378, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_420, _418, _454);
    float _470 = fma(_422, _418, _456);
    float _472 = fma(_460, _378, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _474 = fma(_424, _418, _462);
    float _476 = fma(_464, _358, _468);
    float _478 = fma(_466, _358, _470);
    float _480 = fma(_472, _358, _474);
    float _482 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].x, _476);
    float _484 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].y, _478);
    float _486 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].z, _480);
    float _488 = _482 * _428;
    float _490 = _484 * _430;
    float _492 = _486 * _432;
    bool _494 = !_364;
    float _512;
    if (!_494)
    {
        float _496 = in.m_43.x;
        float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[11].x, _118);
        float _504 = _502 * _498;
        float _506 = floor(_504);
        float _508 = -_506;
        float _510 = _504 + _508;
        _512 = _510;
        _514 = true;
    }
    else
    {
        float _516 = float(_84);
        float _518 = 1.0 / _516;
        float _520 = _118 * _518;
        _512 = _520;
    }
    _514 = false;
    float _522 = _512;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _526 = _522 + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _544 = 1.0 / _530;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _554 = 1.0 / _538;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _558 = _522 + _556;
    bool _560 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _562 = isnan(_522);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    bool _572 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _574 = isnan(_522);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    bool _584 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _586 = isnan(_522);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    float _596 = 1.0 / _534;
    float _598 = _558 * _544;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _602 = _522 + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _604;
    float _608 = -_582;
    float _610 = _608 + 1.0;
    bool _612 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _614 = isnan(_522);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = fma(_606, _598, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _626 = 1.0 / _552;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _630 = _522 + _628;
    float _632 = _602 * _554;
    bool _634 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _636 = isnan(_522);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = -_570;
    float _648 = _646 + 1.0;
    float _650 = 1.0 / _542;
    float _652 = _630 * _596;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _656 = _522 + _654;
    float _658 = -_644;
    float _660 = _658 + 1.0;
    bool _662 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _664 = _570 * _660;
    float _666 = 1.0 / _548;
    float _668 = _656 * _626;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _670;
    float _674 = fma(_672, _598, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _676 = _582 * _648;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _684 = _522 + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _694 = fma(_680, _652, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _696 = _684 * _650;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _698;
    float _702 = -_594;
    float _704 = _702 + 1.0;
    float _706 = _526 * _666;
    float _708 = fma(_688, _652, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _710 = fma(_700, _598, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _712 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _714 = isnan(_522);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = _594 * _610;
    bool _726 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _728 = isnan(_522);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _734 = _730 || _732;
    float _736 = float(_734);
    float _738 = fma(_692, _652, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _740;
    float _744 = _722 * _704;
    float _746 = -_722;
    float _748 = _746 + 1.0;
    float _750 = -_736;
    float _752 = _750 + 1.0;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _754;
    float _758 = _736 * _748;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _760;
    float _764 = _622 * _752;
    float _766 = fma(_756, _706, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _768 = -_622;
    float _770 = _768 + 1.0;
    float _772 = fma(_762, _706, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _774 = _624 * _764;
    float _776 = fma(_742, _706, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _778 = _674 * _764;
    float _780 = _710 * _764;
    float _782 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[107].z, _774);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _788 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[107].x, _778);
    float _790 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[107].y, _780);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _796 = fma(_738, _758, _782);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _802 = fma(_708, _758, _788);
    float _804 = fma(_694, _758, _790);
    float _806 = fma(_786, _668, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _808 = fma(_794, _668, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _810 = fma(_800, _668, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _812 = fma(_772, _744, _802);
    float _814 = fma(_766, _744, _804);
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _816;
    float _820 = fma(_776, _744, _796);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _826;
    float _830 = fma(_818, _632, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _832 = fma(_806, _724, _812);
    float _834 = fma(_808, _724, _814);
    float _836 = fma(_810, _724, _820);
    float _838 = fma(_824, _632, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _848 = fma(_828, _632, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _854 = fma(_830, _676, _832);
    float _856 = fma(_842, _696, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _858 = fma(_846, _696, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _860 = fma(_838, _676, _834);
    float _862 = fma(_852, _696, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _864 = fma(_848, _676, _836);
    float _866 = fma(_856, _664, _854);
    float _868 = fma(_858, _664, _860);
    float _870 = fma(_862, _664, _864);
    float _872 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[113].x, _866);
    float _874 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[113].y, _868);
    float _876 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[113].z, _870);
    bool _878 = !_662;
    float _896;
    if (!_878)
    {
        float _880 = in.m_43.x;
        float _882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _884 = _880 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _888 = _886 * _882;
        float _890 = floor(_888);
        float _892 = -_890;
        float _894 = _888 + _892;
        _896 = _894;
        _898 = true;
    }
    else
    {
        float _900 = float(_84);
        float _902 = 1.0 / _900;
        float _904 = _118 * _902;
        _896 = _904;
    }
    _898 = false;
    float _906 = _896;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _910 = _906 + _908;
    float _912 = _872 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _926 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _928 = isnan(_906);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = 1.0 / _916;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _944 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _946 = isnan(_906);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _952 = _948 || _950;
    float _954 = float(_952);
    float _956 = _874 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _958 = _876 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _960 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _962 = 1.0 / _924;
    float _964 = _920 * _938;
    bool _966 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _968 = isnan(_906);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = 1.0 / _942;
    float _980 = -_936;
    float _982 = _980 + 1.0;
    float _984 = fma(_964, _910, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _990 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _992 = isnan(_906);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = -_976;
    float _1004 = _1002 + 1.0;
    float _1006 = _976 * _982;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1012 = 1.0 / _988;
    float _1014 = -_1000;
    float _1016 = _1014 + 1.0;
    float _1018 = _954 * _1004;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1020;
    float _1024 = _1010 * _962;
    float _1026 = _936 * _1016;
    float _1028 = _984 * _1018;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1032 = _906 + _1030;
    float _1034 = -_954;
    float _1036 = _1034 + 1.0;
    bool _1038 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1040 = isnan(_906);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1046 = _1042 || _1044;
    float _1048 = float(_1046);
    float _1050 = _1022 * _978;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1058 = _906 + _1056;
    float _1060 = fma(_1024, _1032, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1062 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1028);
    float _1064 = -_1048;
    float _1066 = _1064 + 1.0;
    float _1068 = _1054 * _1012;
    float _1070 = fma(_1050, _1058, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1074 = _906 + _1072;
    float _1076 = fma(_1060, _1006, _1062);
    float _1078 = _1000 * _1066;
    float _1080 = fma(_1068, _1074, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1082 = fma(_1070, _1026, _1076);
    float _1084 = _912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1086 = fma(_1080, _1078, _1082);
    float _1088 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1090 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1086);
    float _1092 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1094 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_45.x = _1084;
    out.m_45.y = _1092;
    out.m_45.z = _1088;
    out.m_45.w = _1094;
    bool _1096 = !_960;
    float _1114;
    if (!_1096)
    {
        float _1098 = in.m_43.x;
        float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1102 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[11].z, _118);
        float _1106 = _1104 * _1100;
        float _1108 = floor(_1106);
        float _1110 = -_1108;
        float _1112 = _1106 + _1110;
        _1114 = _1112;
        _1116 = true;
    }
    else
    {
        float _1118 = float(_84);
        float _1120 = 1.0 / _1118;
        float _1122 = _118 * _1120;
        _1114 = _1122;
    }
    _1116 = false;
    float _1124 = _1114;
    float _1126 = _256 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1128 = _256 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1130 = _256 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1132 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1126);
    float _1134 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1128);
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1136;
    float _1140 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1132);
    float _1142 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1134);
    float _1144 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1130);
    float _1146 = 1.0 / _1138;
    float _1148 = _1140 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1150 = _1142 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1154 = _1152 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1162 = _1148 + _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1166 = _1150 + _1164;
    float _1168 = in.m_47.y;
    float _1170 = 1.0 / _1154;
    float _1172 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1144);
    float _1174 = _1166 * _1166;
    float _1176 = in.m_49.x;
    float _1178 = in.m_49.y;
    float _1180 = in.m_49.z;
    float _1182 = _1172 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1184 = fma(_1162, _1162, _1174);
    float _1186 = in.m_43.y;
    float _1188 = 1.0 / _1158;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1192 = _1190 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1196 = _1182 + _1194;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1200 = _1198 != 0;
    float _1202 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1204 = fma(_1196, _1196, _1184);
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1208 = _1206 != 0;
    float _1210 = 1.0 / _1192;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1214 = _1124 + _1212;
    float _1216 = in.m_47.x;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1218;
    float _1222 = sqrt(_1204);
    float _1224 = _1006;
    float _1226 = _1168;
    float _1228 = _1216;
    float _1230 = _1182;
    if (_1200)
    {
        float _1232 = in.m_43.x;
        _1224 = _1232;
    }
    float _1234 = _1224;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1238 = _1124 + _1236;
    float _1240 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1180);
    float _1242 = _1202 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1176);
    float _1246 = -_1168;
    float _1248 = _1246 + 1.0;
    bool _1250 = _1186 > 0.5;
    float _1252 = rsqrt(_1204);
    float _1254 = _1238 * _1146;
    float _1256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1178);
    if (_1208)
    {
        float _1258 = _1250 ? _1248 : _1168;
        _1226 = _1258;
    }
    float _1260 = _1226;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1264 = _1124 + _1262;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1272 = _1124 + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1276 = _1124 + _1274;
    float _1278 = _1222 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1280 = _1264 * _1170;
    float _1282 = 1.0 / _1268;
    float _1284 = _1272 * _1188;
    float _1286 = _1214 * _1210;
    float _1288 = precise::min(_1242, _1278);
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1292 = _1124 + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1294;
    float _1298 = 1.0 / _1220;
    float _1300 = _1252 * _1288;
    bool _1302 = _1234 > 0.5;
    bool _1304 = _1302 && _1200;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1308 = _1306 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1310 = 0.0;
    if (_1200)
    {
        _1310 = _1216;
    }
    float _1312 = _1310;
    float _1314 = _1166 * _1300;
    float _1316 = _1162 * _1300;
    float _1318 = _1196 * _1300;
    float _1320 = _1292 * _1282;
    float _1322 = -_1314;
    float _1324 = _1166 + _1322;
    float _1326 = -_1316;
    float _1328 = _1162 + _1326;
    float _1330 = -_1318;
    float _1332 = _1196 + _1330;
    float _1334 = _1324 * _1324;
    float _1336 = _1312;
    if (_1304)
    {
        float _1338 = -_1312;
        float _1340 = _1338 + 1.0;
        _1336 = _1340;
    }
    float _1342 = _1336;
    float _1344 = _1276 * _1298;
    float _1346 = fma(_1328, _1328, _1334);
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1348;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1356;
    float _1360 = fma(_1332, _1332, _1346);
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1364 = _1362 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1370;
    float _1374 = sqrt(_1360);
    float _1376 = fma(_1350, _1254, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1378;
    float _1382 = fma(_1354, _1254, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1388 = fma(_1372, _1284, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1390 = fma(_1380, _1284, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1394 = _1392 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1396 = fma(_1358, _1254, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1398 = fma(_1386, _1280, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1400 = fma(_1364, _1280, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1402 = fma(_1368, _1280, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1406 = _1404 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1408 = fma(_1296, _1284, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1410 = fma(_1394, _1286, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1412 = fma(_1406, _1286, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1414 = _1252 * _1374;
    float _1416 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1420;
    float _1424 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1426;
    float _1430 = fma(_1418, _1344, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1432 = fma(_1422, _1344, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1434 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1436 = fma(_1428, _1344, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1438 = _1424 * _1414;
    bool _1440 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1442 = isnan(_1124);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = fma(_1308, _1286, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1454 = _1202 * _1414;
    float _1456 = _1434 * _1414;
    bool _1458 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1460 = isnan(_1124);
    bool _1462 = _1458 || _1460;
    bool _1464 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1466 = _1462 || _1464;
    float _1468 = float(_1466);
    float _1470 = -_1450;
    float _1472 = _1470 + 1.0;
    float _1474 = _1438 * _1256;
    bool _1476 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1478 = isnan(_1124);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1484 = _1480 || _1482;
    float _1486 = float(_1484);
    float _1488 = _1456 * _1240;
    float _1490 = _1468 * _1472;
    float _1492 = -_1468;
    float _1494 = _1492 + 1.0;
    float _1496 = _1454 * _1244;
    float _1498 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1500 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1502 = isnan(_1124);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1508 = _1504 || _1506;
    float _1510 = float(_1508);
    float _1512 = _1486 * _1494;
    float _1514 = -_1486;
    float _1516 = _1514 + 1.0;
    float _1518 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1520 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1498);
    bool _1522 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1524 = isnan(_1124);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1530 = _1526 || _1528;
    float _1532 = float(_1530);
    float _1534 = _1510 * _1516;
    float _1536 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1518);
    float _1538 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1520);
    float _1540 = -_1510;
    float _1542 = _1540 + 1.0;
    float _1544 = -_1532;
    float _1546 = _1544 + 1.0;
    float _1548 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1536);
    float _1550 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1552 = _1532 * _1542;
    bool _1554 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1556 = isnan(_1124);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1562 = _1558 || _1560;
    float _1564 = float(_1562);
    float _1566 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1568 = _1182 + _1550;
    bool _1570 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1572 = isnan(_1124);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1578 = _1574 || _1576;
    float _1580 = float(_1578);
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1584 = _1582 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1586 = _1148 + _1566;
    float _1588 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1590 = _1568 + _1588;
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1594 = _1592 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1596 = -_1564;
    float _1598 = _1596 + 1.0;
    float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1602 = _1586 + _1600;
    float _1604 = _1590 * _1590;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1610 = _1580 * _1598;
    float _1612 = fma(_1584, _1320, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1614 = fma(_1602, _1602, _1604);
    float _1616 = -_1580;
    float _1618 = _1616 + 1.0;
    float _1620 = _1396 * _1610;
    float _1622 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1624 = sqrt(_1614);
    float _1626 = _1376 * _1610;
    float _1628 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1620);
    float _1630 = _1564 * _1546;
    float _1632 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1622);
    float _1634 = _1382 * _1610;
    float _1636 = _1586;
    float _1638 = _1568;
    if (_1200)
    {
        _1228 = _1342;
    }
    float _1640 = _1228;
    float _1642 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1626);
    float _1644 = fma(_1398, _1630, _1628);
    float _1646 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1632);
    float _1648 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1634);
    float _1650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1652 = fma(_1400, _1630, _1642);
    float _1654 = fma(_1388, _1552, _1644);
    float _1656 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1658 = fma(_1402, _1630, _1648);
    bool _1660 = _1624 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = fma(_1390, _1552, _1652);
    float _1664 = fma(_1410, _1534, _1654);
    float _1666 = _1150 + _1656;
    float _1668 = fma(_1408, _1552, _1658);
    float _1670 = fma(_1594, _1320, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1672 = fma(_1430, _1512, _1664);
    float _1674 = fma(_1608, _1320, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1676 = fma(_1412, _1534, _1662);
    float _1678 = fma(_1452, _1534, _1668);
    float _1680 = _1664;
    if (!_1660)
    {
        _1680 = _1666;
    }
    float _1682 = _1680;
    bool _1684 = !_1660;
    float _1686 = _1682;
    if (!_1684)
    {
        float _1688 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1692 = _1624 + _1690;
        float _1694 = _1666 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1696 = rsqrt(_1614);
        float _1698 = _1692 * _1688;
        float _1700 = _1698 * 0.15915493667125701904296875;
        float _1702 = _1700 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = _1700 * 6.283185482025146484375;
        float _1708 = cos(_1706);
        float _1710 = fma(_1704, _1694, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1712 = _1696 * _1710;
        float _1714 = _1708 + (-1.0);
        float _1716 = fma(_1602, _1712, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1718 = fma(_1590, _1712, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1720 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1722 = fma(_1666, _1708, _1720);
        _1686 = _1722;
        _1636 = _1716;
        _1638 = _1718;
    }
    float _1724 = _1686;
    float _1726 = _1636;
    float _1728 = _1638;
    float _1730 = -_1314;
    float _1732 = _1730 + _1724;
    float _1734 = fma(_1432, _1512, _1676);
    float _1736 = -_1316;
    float _1738 = _1736 + _1726;
    float _1740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1742 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1744 = _1732 + _1742;
    float _1746 = -_1318;
    float _1748 = _1746 + _1728;
    float _1750 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1752 = _1738 + _1750;
    float _1754 = fma(_1436, _1512, _1678);
    float _1756 = _1744 * _1744;
    float _1758 = fma(_1612, _1490, _1672);
    float _1760 = fma(_1670, _1490, _1734);
    float _1762 = fma(_1674, _1490, _1754);
    float _1764 = fma(_1752, _1752, _1756);
    float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1768 = _1748 + _1766;
    float _1770 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1772 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1774 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1758);
    float _1776 = fma(_1768, _1768, _1764);
    float _1778 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1760);
    float _1780 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1762);
    float _1782 = _1770 * _1650;
    float _1784 = _1772 * _1740;
    float _1786 = sqrt(_1776);
    float _1788 = _1774 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1790 = _1778 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1792 = _1780 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1796 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1798 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1800 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_51.x = _1784;
    out.m_51.y = _1782;
    float _1802 = -_1318;
    float _1804 = _1182 + _1802;
    float _1806 = -_1316;
    float _1808 = _1148 + _1806;
    out.m_53.x = 1.0;
    out.m_53.y = 1.0;
    out.m_53.z = 1.0;
    bool _1810 = _1786 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1812 = isnan(_1786);
    bool _1814 = _1810 || _1812;
    bool _1816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1818 = _1814 || _1816;
    float _1820 = -_1314;
    float _1822 = _1150 + _1820;
    out.m_55.w = _1288;
    out.m_57.x = _1796;
    out.m_57.y = _1798;
    out.m_57.z = _1800;
    out.m_57.w = _1794;
    out.m_59.x = _1454;
    if (!_1818)
    {
        _1230 = 1.0;
    }
    float _1824 = _1230;
    bool _1826 = !_1818;
    float _1828 = _1824;
    if (!_1826)
    {
        bool _1830 = _1786 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1832 = isnan(_1786);
        bool _1834 = _1830 || _1832;
        bool _1836 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1838 = _1834 || _1836;
        if (!_1838)
        {
            float _1840 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1842 = _1786 + _1840;
            float _1844 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1846 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1844;
            float _1848 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1850 = _1848 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1852 = 1.0 / _1846;
            float _1854 = _1842 * _1852;
            float _1856 = fma(_1854, _1850, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1828 = _1856;
            _1858 = true;
        }
        else
        {
            bool _1860 = _1786 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1862 = isnan(_1786);
            bool _1864 = _1860 || _1862;
            bool _1866 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1868 = _1864 || _1866;
            if (!_1868)
            {
                float _1870 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1872 = _1786 + _1870;
                float _1874 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1876 = _1874 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1878 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1880 = _1878 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1882 = 1.0 / _1876;
                float _1884 = _1872 * _1882;
                float _1886 = fma(_1884, _1880, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1828 = _1886;
                _1858 = true;
            }
            else
            {
                _1828 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1858 = false;
    float _1888 = _1828;
    float _1890 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_61.x = _1808;
    out.m_61.y = _1822;
    out.m_61.z = _1804;
    float _1892 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1894 = _1738 + _1892;
    float _1896 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1890);
    float _1898 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1900 = _1732 + _1898;
    bool _1902 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1904 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1906 = _1902 || _1904;
    bool _1908 = isnan(0.5);
    bool _1910 = _1906 || _1908;
    float _1912 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1914 = _1748 + _1912;
    float _1916 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1896);
    float _1918 = fma(_1894, _1888, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1920 = fma(_1900, _1888, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1922 = fma(_1914, _1888, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1924 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1926 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1928 = 1.0 / _1924;
    float _1930 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1926);
    float _1932 = _1888;
    float _1934 = _1930;
    if (_1910)
    {
        _1932 = _1918;
    }
    float _1936 = _1932;
    float _1938 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1930);
    float _1940 = _1938;
    float _1942 = _1936;
    if (_1910)
    {
        _1934 = _1920;
    }
    float _1944 = _1934;
    float _1946 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1948 = _1944;
    if (_1910)
    {
        _1940 = _1922;
    }
    float _1950 = _1940;
    float _1952 = _1950;
    if (!_1910)
    {
        float _1954 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1956 = _1822 + _1954;
        float _1958 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1960 = _1808 + _1958;
        float _1962 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1964 = _1956 * _1956;
        float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1968 = _1804 + _1966;
        float _1970 = fma(_1960, _1960, _1964);
        float _1972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1974 = fma(_1968, _1968, _1970);
        float _1976 = sqrt(_1974);
        float _1978 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1980 = -_1822;
        float _1982 = _1980 + _1920;
        float _1984 = precise::min(_1976, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1986 = _1984 * _1972;
        float _1988 = -_1808;
        float _1990 = _1988 + _1918;
        float _1992 = _1978 * _1986;
        float _1994 = -_1804;
        float _1996 = _1994 + _1922;
        float _1998 = fma(_1990, _1992, _1808);
        float _2000 = fma(_1982, _1992, _1822);
        float _2002 = fma(_1996, _1992, _1804);
        _1948 = _2000;
        _1942 = _1998;
        _1952 = _2002;
    }
    float _2004 = _1948;
    float _2006 = _1942;
    float _2008 = _1952;
    float _2010 = _1946 + _1924;
    float _2012 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2014 = _2010 * _1928;
    float _2016 = _2014 * 0.5;
    float _2018 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2020 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2012);
    bool _2022 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2024 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan(0.5);
    bool _2030 = _2026 || _2028;
    float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2034 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2032);
    float _2036 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2018);
    float _2038 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2020);
    float _2040 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2042 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2044 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2036);
    float _2046 = 1.0 / _2034;
    float _2048 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2050 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2040);
    float _2052 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2054 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2042);
    float _2056 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2058 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2060 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2062 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2064 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2050);
    float _2066 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2056);
    float _2068 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2058);
    float _2070 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2060);
    float _2072 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2062);
    float _2074 = _2056;
    float _2076 = _2052;
    if (_2030)
    {
        _2074 = 1.0;
    }
    float _2078 = _2074;
    float _2080 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2054);
    float _2082 = _2078;
    if (_2030)
    {
        _2076 = 1.0;
    }
    float _2084 = _2076;
    float _2086 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2090 = _2046 * _2088;
    float _2092 = _2084;
    if (!_2030)
    {
        float _2094 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2096 = _2094 * 0.15915493667125701904296875;
        float _2098 = _2096 * 6.283185482025146484375;
        float _2100 = cos(_2098);
        float _2102 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2104 = _2102 * 0.15915493667125701904296875;
        float _2106 = _2096 * 6.283185482025146484375;
        float _2108 = sin(_2106);
        float _2110 = 1.0 / _2100;
        float _2112 = _2104 * 6.283185482025146484375;
        float _2114 = cos(_2112);
        float _2116 = _2108 * _2110;
        float _2118 = _2104 * 6.283185482025146484375;
        float _2120 = sin(_2118);
        float _2122 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2124 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2122;
        float _2126 = _2114 * _2116;
        float _2128 = 1.0 / _2124;
        float _2130 = 1.0 / _2126;
        float _2132 = _2120 * _2130;
        float _2134 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2136 = fma(_2090, _2132, _2134);
        float _2138 = _2136 * _2128;
        float _2140 = precise::clamp(_2138, 0.0, 1.0);
        _2082 = _2140;
    }
    float _2142 = _2082;
    if (!_2030)
    {
        float _2144 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2146 = _2144 * 0.15915493667125701904296875;
        float _2148 = _2146 * 6.283185482025146484375;
        float _2150 = cos(_2148);
        float _2152 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2154 = _2152 * 0.15915493667125701904296875;
        float _2156 = _2146 * 6.283185482025146484375;
        float _2158 = sin(_2156);
        float _2160 = 1.0 / _2150;
        float _2162 = _2154 * 6.283185482025146484375;
        float _2164 = cos(_2162);
        float _2166 = _2158 * _2160;
        float _2168 = _2154 * 6.283185482025146484375;
        float _2170 = sin(_2168);
        float _2172 = _2164 * _2166;
        float _2174 = 1.0 / _2172;
        float _2176 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2178 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2176;
        float _2180 = 1.0 / _2178;
        float _2182 = _2170 * _2174;
        float _2184 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2186 = fma(_2090, _2182, _2184);
        float _2188 = _2186 * _2180;
        float _2190 = precise::clamp(_2188, 0.0, 1.0);
        float _2192 = -_2190;
        float _2194 = _2192 + 1.0;
        _2092 = _2194;
    }
    float _2196 = _2092;
    float _2198 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2200 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2066);
    float _2202 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2070);
    float _2204 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2072);
    bool _2206 = _2142 > 0.0;
    bool _2208 = isnan(_2142);
    bool _2210 = _2206 || _2208;
    bool _2212 = isnan(0.0);
    bool _2214 = _2210 || _2212;
    float _2216 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2068);
    float _2218 = _2142 * _2196;
    float _2220 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2200);
    float _2222 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2204);
    float _2224 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2202);
    bool _2226 = _2196 <= 0.0;
    bool _2228 = !_2214;
    bool _2230 = _2226 || _2228;
    float _2232 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2216);
    float _2234 = _2220 + _2222;
    float _2236 = _2224 + _2222;
    float _2238 = _2222 * 0.5;
    float _2240 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2242 = _2234 * 0.5;
    float _2244 = _2236 * 0.5;
    float _2246 = fma(_2232, -0.5, _2238);
    float _2248 = _2240 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _2006;
    out.m_63.y = _2004;
    out.m_63.z = _2008;
    out.gl_Position.x = _2220;
    out.gl_Position.y = _2232;
    out.gl_Position.z = _2224;
    out.gl_Position.w = _2222;
    out.m_65.x = _2242;
    out.m_65.y = _2246;
    out.m_65.z = _2244;
    out.m_65.w = _2222;
    out.m_37.x = _2248;
    if (!_2230)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_37.x = 0.0;
    float _2250 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2250;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1858 = false;
    bool _1116 = false;
    bool _898 = false;
    bool _514 = false;
    bool _280 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_34.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_88)
    {
        out.m_37.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _92 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2307 = as_type<float>(_100);
        out.gl_Position.z = _2307;
    }
    if (!_88)
    {
        return out;
    }
    float _104 = in.m_39.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_114)
    {
        float _120 = float(_84);
        _94 = _120;
    }
    float _122 = _94;
    bool _124 = _118 >= _122;
    bool _126 = !_114;
    bool _128 = _124 || _126;
    float _130 = _122;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_37.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _102 = as_type<int>(_134);
    }
    int _136 = _102;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2376 = as_type<float>(_136);
        out.gl_Position.z = _2376;
    }
    if (_128)
    {
        return out;
    }
    float _138 = in.m_41.w;
    float _140 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = in.m_39.x;
    float _154 = in.m_39.y;
    float _156 = in.m_39.z;
    float _158 = in.m_34.x;
    float _160 = in.m_34.y;
    float _162 = in.m_34.z;
    float _164 = 0.0;
    float _166 = _140;
    if (!_150)
    {
        float _168 = _140 * _140;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = _172;
    if (!_150)
    {
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _176;
    }
    float _178 = _174;
    bool _180 = !_150;
    float _182 = _178;
    if (!_180)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _140 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _140);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _212;
    }
    float _214 = _182;
    bool _216 = !_150;
    if (!_216)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _140 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _166 = _236;
    }
    float _238 = _166;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _242 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _244 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _248 = fma(_238, _152, _242);
    float _250 = fma(_238, _154, _244);
    float _252 = fma(_238, _156, _246);
    float _254 = fma(_248, _138, _158);
    float _256 = fma(_250, _138, _160);
    float _258 = fma(_252, _138, _162);
    bool _260 = !_240;
    float _278;
    if (!_260)
    {
        float _262 = in.m_43.x;
        float _264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _266 = _262 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _270 = _268 * _264;
        float _272 = floor(_270);
        float _274 = -_272;
        float _276 = _270 + _274;
        _278 = _276;
        _280 = true;
    }
    else
    {
        float _282 = float(_84);
        float _284 = 1.0 / _282;
        float _286 = _118 * _284;
        _278 = _286;
    }
    _280 = false;
    float _288 = _278;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = _288 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = _288 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _288 + _310;
    bool _314 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _316 = isnan(_288);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = 1.0 / _300;
    bool _328 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _330 = isnan(_288);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_324;
    float _342 = _340 + 1.0;
    bool _344 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _346 = isnan(_288);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = 1.0 / _308;
    float _358 = _338 * _342;
    float _360 = -_338;
    float _362 = _360 + 1.0;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _366 = 1.0 / _304;
    float _368 = _292 * _326;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _374;
    float _378 = _296 * _356;
    bool _380 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _382 = isnan(_288);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = fma(_376, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = _312 * _366;
    float _404 = fma(_372, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = -_390;
    float _412 = _410 + 1.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _414;
    float _418 = _390 * _362;
    float _420 = fma(_396, _402, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_408, _402, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = fma(_400, _402, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = _354 * _412;
    float _428 = in.m_41.x;
    float _430 = in.m_41.y;
    float _432 = in.m_41.z;
    float _434 = fma(_416, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _436 = -_354;
    float _438 = _436 + 1.0;
    float _440 = _404 * _426;
    float _442 = _392 * _426;
    float _444 = _434 * _426;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _450;
    float _454 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].x, _440);
    float _456 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].y, _442);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].z, _444);
    float _464 = fma(_448, _378, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_452, _378, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_420, _418, _454);
    float _470 = fma(_422, _418, _456);
    float _472 = fma(_460, _378, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _474 = fma(_424, _418, _462);
    float _476 = fma(_464, _358, _468);
    float _478 = fma(_466, _358, _470);
    float _480 = fma(_472, _358, _474);
    float _482 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].x, _476);
    float _484 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].y, _478);
    float _486 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].z, _480);
    float _488 = _482 * _428;
    float _490 = _484 * _430;
    float _492 = _486 * _432;
    bool _494 = !_364;
    float _512;
    if (!_494)
    {
        float _496 = in.m_43.x;
        float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[11].x, _118);
        float _504 = _502 * _498;
        float _506 = floor(_504);
        float _508 = -_506;
        float _510 = _504 + _508;
        _512 = _510;
        _514 = true;
    }
    else
    {
        float _516 = float(_84);
        float _518 = 1.0 / _516;
        float _520 = _118 * _518;
        _512 = _520;
    }
    _514 = false;
    float _522 = _512;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _526 = _522 + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _544 = 1.0 / _530;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _554 = 1.0 / _538;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _558 = _522 + _556;
    bool _560 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _562 = isnan(_522);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    bool _572 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _574 = isnan(_522);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    bool _584 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _586 = isnan(_522);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    float _596 = 1.0 / _534;
    float _598 = _558 * _544;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _602 = _522 + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _604;
    float _608 = -_582;
    float _610 = _608 + 1.0;
    bool _612 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _614 = isnan(_522);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = fma(_606, _598, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _626 = 1.0 / _552;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _630 = _522 + _628;
    float _632 = _602 * _554;
    bool _634 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _636 = isnan(_522);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = -_570;
    float _648 = _646 + 1.0;
    float _650 = 1.0 / _542;
    float _652 = _630 * _596;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _656 = _522 + _654;
    float _658 = -_644;
    float _660 = _658 + 1.0;
    bool _662 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _664 = _570 * _660;
    float _666 = 1.0 / _548;
    float _668 = _656 * _626;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _670;
    float _674 = fma(_672, _598, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _676 = _582 * _648;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _684 = _522 + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _694 = fma(_680, _652, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _696 = _684 * _650;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _698;
    float _702 = -_594;
    float _704 = _702 + 1.0;
    float _706 = _526 * _666;
    float _708 = fma(_688, _652, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _710 = fma(_700, _598, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _712 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _714 = isnan(_522);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = _594 * _610;
    bool _726 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _728 = isnan(_522);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _734 = _730 || _732;
    float _736 = float(_734);
    float _738 = fma(_692, _652, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _740;
    float _744 = _722 * _704;
    float _746 = -_722;
    float _748 = _746 + 1.0;
    float _750 = -_736;
    float _752 = _750 + 1.0;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _754;
    float _758 = _736 * _748;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _760;
    float _764 = _622 * _752;
    float _766 = fma(_756, _706, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _768 = -_622;
    float _770 = _768 + 1.0;
    float _772 = fma(_762, _706, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _774 = _624 * _764;
    float _776 = fma(_742, _706, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _778 = _674 * _764;
    float _780 = _710 * _764;
    float _782 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[107].z, _774);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _788 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[107].x, _778);
    float _790 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[107].y, _780);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _796 = fma(_738, _758, _782);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _802 = fma(_708, _758, _788);
    float _804 = fma(_694, _758, _790);
    float _806 = fma(_786, _668, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _808 = fma(_794, _668, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _810 = fma(_800, _668, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _812 = fma(_772, _744, _802);
    float _814 = fma(_766, _744, _804);
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _816;
    float _820 = fma(_776, _744, _796);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _826;
    float _830 = fma(_818, _632, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _832 = fma(_806, _724, _812);
    float _834 = fma(_808, _724, _814);
    float _836 = fma(_810, _724, _820);
    float _838 = fma(_824, _632, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _848 = fma(_828, _632, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _854 = fma(_830, _676, _832);
    float _856 = fma(_842, _696, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _858 = fma(_846, _696, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _860 = fma(_838, _676, _834);
    float _862 = fma(_852, _696, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _864 = fma(_848, _676, _836);
    float _866 = fma(_856, _664, _854);
    float _868 = fma(_858, _664, _860);
    float _870 = fma(_862, _664, _864);
    float _872 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[113].x, _866);
    float _874 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[113].y, _868);
    float _876 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[113].z, _870);
    bool _878 = !_662;
    float _896;
    if (!_878)
    {
        float _880 = in.m_43.x;
        float _882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _884 = _880 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _888 = _886 * _882;
        float _890 = floor(_888);
        float _892 = -_890;
        float _894 = _888 + _892;
        _896 = _894;
        _898 = true;
    }
    else
    {
        float _900 = float(_84);
        float _902 = 1.0 / _900;
        float _904 = _118 * _902;
        _896 = _904;
    }
    _898 = false;
    float _906 = _896;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _910 = _906 + _908;
    float _912 = _872 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _926 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _928 = isnan(_906);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = 1.0 / _916;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _944 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _946 = isnan(_906);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _952 = _948 || _950;
    float _954 = float(_952);
    float _956 = _874 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _958 = _876 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _960 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _962 = 1.0 / _924;
    float _964 = _920 * _938;
    bool _966 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _968 = isnan(_906);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = 1.0 / _942;
    float _980 = -_936;
    float _982 = _980 + 1.0;
    float _984 = fma(_964, _910, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _990 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _992 = isnan(_906);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = -_976;
    float _1004 = _1002 + 1.0;
    float _1006 = _976 * _982;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1012 = 1.0 / _988;
    float _1014 = -_1000;
    float _1016 = _1014 + 1.0;
    float _1018 = _954 * _1004;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1020;
    float _1024 = _1010 * _962;
    float _1026 = _936 * _1016;
    float _1028 = _984 * _1018;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1032 = _906 + _1030;
    float _1034 = -_954;
    float _1036 = _1034 + 1.0;
    bool _1038 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1040 = isnan(_906);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1046 = _1042 || _1044;
    float _1048 = float(_1046);
    float _1050 = _1022 * _978;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1058 = _906 + _1056;
    float _1060 = fma(_1024, _1032, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1062 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1028);
    float _1064 = -_1048;
    float _1066 = _1064 + 1.0;
    float _1068 = _1054 * _1012;
    float _1070 = fma(_1050, _1058, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1074 = _906 + _1072;
    float _1076 = fma(_1060, _1006, _1062);
    float _1078 = _1000 * _1066;
    float _1080 = fma(_1068, _1074, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1082 = fma(_1070, _1026, _1076);
    float _1084 = _912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1086 = fma(_1080, _1078, _1082);
    float _1088 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1090 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1086);
    float _1092 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1094 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_45.x = _1084;
    out.m_45.y = _1092;
    out.m_45.z = _1088;
    out.m_45.w = _1094;
    bool _1096 = !_960;
    float _1114;
    if (!_1096)
    {
        float _1098 = in.m_43.x;
        float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1102 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[11].z, _118);
        float _1106 = _1104 * _1100;
        float _1108 = floor(_1106);
        float _1110 = -_1108;
        float _1112 = _1106 + _1110;
        _1114 = _1112;
        _1116 = true;
    }
    else
    {
        float _1118 = float(_84);
        float _1120 = 1.0 / _1118;
        float _1122 = _118 * _1120;
        _1114 = _1122;
    }
    _1116 = false;
    float _1124 = _1114;
    float _1126 = _256 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1128 = _256 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1130 = _256 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1132 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1126);
    float _1134 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1128);
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1136;
    float _1140 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1132);
    float _1142 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1134);
    float _1144 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1130);
    float _1146 = 1.0 / _1138;
    float _1148 = _1140 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1150 = _1142 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1154 = _1152 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1162 = _1148 + _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1166 = _1150 + _1164;
    float _1168 = in.m_47.y;
    float _1170 = 1.0 / _1154;
    float _1172 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1144);
    float _1174 = _1166 * _1166;
    float _1176 = in.m_49.x;
    float _1178 = in.m_49.y;
    float _1180 = in.m_49.z;
    float _1182 = _1172 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1184 = fma(_1162, _1162, _1174);
    float _1186 = in.m_43.y;
    float _1188 = 1.0 / _1158;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1192 = _1190 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1196 = _1182 + _1194;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1200 = _1198 != 0;
    float _1202 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1204 = fma(_1196, _1196, _1184);
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1208 = _1206 != 0;
    float _1210 = 1.0 / _1192;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1214 = _1124 + _1212;
    float _1216 = in.m_47.x;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1218;
    float _1222 = sqrt(_1204);
    float _1224 = _1006;
    float _1226 = _1168;
    float _1228 = _1216;
    float _1230 = _1182;
    if (_1200)
    {
        float _1232 = in.m_43.x;
        _1224 = _1232;
    }
    float _1234 = _1224;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1238 = _1124 + _1236;
    float _1240 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1180);
    float _1242 = _1202 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1176);
    float _1246 = -_1168;
    float _1248 = _1246 + 1.0;
    bool _1250 = _1186 > 0.5;
    float _1252 = rsqrt(_1204);
    float _1254 = _1238 * _1146;
    float _1256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1178);
    if (_1208)
    {
        float _1258 = _1250 ? _1248 : _1168;
        _1226 = _1258;
    }
    float _1260 = _1226;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1264 = _1124 + _1262;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1272 = _1124 + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1276 = _1124 + _1274;
    float _1278 = _1222 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1280 = _1264 * _1170;
    float _1282 = 1.0 / _1268;
    float _1284 = _1272 * _1188;
    float _1286 = _1214 * _1210;
    float _1288 = precise::min(_1242, _1278);
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1292 = _1124 + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1294;
    float _1298 = 1.0 / _1220;
    float _1300 = _1252 * _1288;
    bool _1302 = _1234 > 0.5;
    bool _1304 = _1302 && _1200;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1308 = _1306 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1310 = 0.0;
    if (_1200)
    {
        _1310 = _1216;
    }
    float _1312 = _1310;
    float _1314 = _1166 * _1300;
    float _1316 = _1162 * _1300;
    float _1318 = _1196 * _1300;
    float _1320 = _1292 * _1282;
    float _1322 = -_1314;
    float _1324 = _1166 + _1322;
    float _1326 = -_1316;
    float _1328 = _1162 + _1326;
    float _1330 = -_1318;
    float _1332 = _1196 + _1330;
    float _1334 = _1324 * _1324;
    float _1336 = _1312;
    if (_1304)
    {
        float _1338 = -_1312;
        float _1340 = _1338 + 1.0;
        _1336 = _1340;
    }
    float _1342 = _1336;
    float _1344 = _1276 * _1298;
    float _1346 = fma(_1328, _1328, _1334);
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1348;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1356;
    float _1360 = fma(_1332, _1332, _1346);
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1364 = _1362 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1370;
    float _1374 = sqrt(_1360);
    float _1376 = fma(_1350, _1254, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1378;
    float _1382 = fma(_1354, _1254, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1388 = fma(_1372, _1284, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1390 = fma(_1380, _1284, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1394 = _1392 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1396 = fma(_1358, _1254, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1398 = fma(_1386, _1280, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1400 = fma(_1364, _1280, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1402 = fma(_1368, _1280, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1406 = _1404 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1408 = fma(_1296, _1284, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1410 = fma(_1394, _1286, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1412 = fma(_1406, _1286, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1414 = _1252 * _1374;
    float _1416 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1420;
    float _1424 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1426;
    float _1430 = fma(_1418, _1344, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1432 = fma(_1422, _1344, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1434 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1436 = fma(_1428, _1344, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1438 = _1424 * _1414;
    bool _1440 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1442 = isnan(_1124);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = fma(_1308, _1286, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1454 = _1202 * _1414;
    float _1456 = _1434 * _1414;
    bool _1458 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1460 = isnan(_1124);
    bool _1462 = _1458 || _1460;
    bool _1464 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1466 = _1462 || _1464;
    float _1468 = float(_1466);
    float _1470 = -_1450;
    float _1472 = _1470 + 1.0;
    float _1474 = _1438 * _1256;
    bool _1476 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1478 = isnan(_1124);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1484 = _1480 || _1482;
    float _1486 = float(_1484);
    float _1488 = _1456 * _1240;
    float _1490 = _1468 * _1472;
    float _1492 = -_1468;
    float _1494 = _1492 + 1.0;
    float _1496 = _1454 * _1244;
    float _1498 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1500 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1502 = isnan(_1124);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1508 = _1504 || _1506;
    float _1510 = float(_1508);
    float _1512 = _1486 * _1494;
    float _1514 = -_1486;
    float _1516 = _1514 + 1.0;
    float _1518 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1520 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1498);
    bool _1522 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1524 = isnan(_1124);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1530 = _1526 || _1528;
    float _1532 = float(_1530);
    float _1534 = _1510 * _1516;
    float _1536 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1518);
    float _1538 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1520);
    float _1540 = -_1510;
    float _1542 = _1540 + 1.0;
    float _1544 = -_1532;
    float _1546 = _1544 + 1.0;
    float _1548 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1536);
    float _1550 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1552 = _1532 * _1542;
    bool _1554 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1556 = isnan(_1124);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1562 = _1558 || _1560;
    float _1564 = float(_1562);
    float _1566 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1568 = _1182 + _1550;
    bool _1570 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1572 = isnan(_1124);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1578 = _1574 || _1576;
    float _1580 = float(_1578);
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1584 = _1582 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1586 = _1148 + _1566;
    float _1588 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1590 = _1568 + _1588;
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1594 = _1592 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1596 = -_1564;
    float _1598 = _1596 + 1.0;
    float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1602 = _1586 + _1600;
    float _1604 = _1590 * _1590;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1610 = _1580 * _1598;
    float _1612 = fma(_1584, _1320, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1614 = fma(_1602, _1602, _1604);
    float _1616 = -_1580;
    float _1618 = _1616 + 1.0;
    float _1620 = _1396 * _1610;
    float _1622 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1624 = sqrt(_1614);
    float _1626 = _1376 * _1610;
    float _1628 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1620);
    float _1630 = _1564 * _1546;
    float _1632 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1622);
    float _1634 = _1382 * _1610;
    float _1636 = _1586;
    float _1638 = _1568;
    if (_1200)
    {
        _1228 = _1342;
    }
    float _1640 = _1228;
    float _1642 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1626);
    float _1644 = fma(_1398, _1630, _1628);
    float _1646 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1632);
    float _1648 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1634);
    float _1650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1652 = fma(_1400, _1630, _1642);
    float _1654 = fma(_1388, _1552, _1644);
    float _1656 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1658 = fma(_1402, _1630, _1648);
    bool _1660 = _1624 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = fma(_1390, _1552, _1652);
    float _1664 = fma(_1410, _1534, _1654);
    float _1666 = _1150 + _1656;
    float _1668 = fma(_1408, _1552, _1658);
    float _1670 = fma(_1594, _1320, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1672 = fma(_1430, _1512, _1664);
    float _1674 = fma(_1608, _1320, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1676 = fma(_1412, _1534, _1662);
    float _1678 = fma(_1452, _1534, _1668);
    float _1680 = _1664;
    if (!_1660)
    {
        _1680 = _1666;
    }
    float _1682 = _1680;
    bool _1684 = !_1660;
    float _1686 = _1682;
    if (!_1684)
    {
        float _1688 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1692 = _1624 + _1690;
        float _1694 = _1666 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1696 = rsqrt(_1614);
        float _1698 = _1692 * _1688;
        float _1700 = _1698 * 0.15915493667125701904296875;
        float _1702 = _1700 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = _1700 * 6.283185482025146484375;
        float _1708 = cos(_1706);
        float _1710 = fma(_1704, _1694, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1712 = _1696 * _1710;
        float _1714 = _1708 + (-1.0);
        float _1716 = fma(_1602, _1712, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1718 = fma(_1590, _1712, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1720 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1722 = fma(_1666, _1708, _1720);
        _1686 = _1722;
        _1636 = _1716;
        _1638 = _1718;
    }
    float _1724 = _1686;
    float _1726 = _1636;
    float _1728 = _1638;
    float _1730 = -_1314;
    float _1732 = _1730 + _1724;
    float _1734 = fma(_1432, _1512, _1676);
    float _1736 = -_1316;
    float _1738 = _1736 + _1726;
    float _1740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1742 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1744 = _1732 + _1742;
    float _1746 = -_1318;
    float _1748 = _1746 + _1728;
    float _1750 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1752 = _1738 + _1750;
    float _1754 = fma(_1436, _1512, _1678);
    float _1756 = _1744 * _1744;
    float _1758 = fma(_1612, _1490, _1672);
    float _1760 = fma(_1670, _1490, _1734);
    float _1762 = fma(_1674, _1490, _1754);
    float _1764 = fma(_1752, _1752, _1756);
    float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1768 = _1748 + _1766;
    float _1770 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1772 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1774 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1758);
    float _1776 = fma(_1768, _1768, _1764);
    float _1778 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1760);
    float _1780 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1762);
    float _1782 = _1770 * _1650;
    float _1784 = _1772 * _1740;
    float _1786 = sqrt(_1776);
    float _1788 = _1774 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1790 = _1778 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1792 = _1780 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1796 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1798 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1800 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_51.x = _1784;
    out.m_51.y = _1782;
    float _1802 = -_1318;
    float _1804 = _1182 + _1802;
    float _1806 = -_1316;
    float _1808 = _1148 + _1806;
    out.m_53.x = 1.0;
    out.m_53.y = 1.0;
    out.m_53.z = 1.0;
    bool _1810 = _1786 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1812 = isnan(_1786);
    bool _1814 = _1810 || _1812;
    bool _1816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1818 = _1814 || _1816;
    float _1820 = -_1314;
    float _1822 = _1150 + _1820;
    out.m_55.w = _1288;
    out.m_57.x = _1796;
    out.m_57.y = _1798;
    out.m_57.z = _1800;
    out.m_57.w = _1794;
    out.m_59.x = _1454;
    if (!_1818)
    {
        _1230 = 1.0;
    }
    float _1824 = _1230;
    bool _1826 = !_1818;
    float _1828 = _1824;
    if (!_1826)
    {
        bool _1830 = _1786 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1832 = isnan(_1786);
        bool _1834 = _1830 || _1832;
        bool _1836 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1838 = _1834 || _1836;
        if (!_1838)
        {
            float _1840 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1842 = _1786 + _1840;
            float _1844 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1846 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1844;
            float _1848 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1850 = _1848 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1852 = 1.0 / _1846;
            float _1854 = _1842 * _1852;
            float _1856 = fma(_1854, _1850, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1828 = _1856;
            _1858 = true;
        }
        else
        {
            bool _1860 = _1786 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1862 = isnan(_1786);
            bool _1864 = _1860 || _1862;
            bool _1866 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1868 = _1864 || _1866;
            if (!_1868)
            {
                float _1870 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1872 = _1786 + _1870;
                float _1874 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1876 = _1874 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1878 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1880 = _1878 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1882 = 1.0 / _1876;
                float _1884 = _1872 * _1882;
                float _1886 = fma(_1884, _1880, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1828 = _1886;
                _1858 = true;
            }
            else
            {
                _1828 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1858 = false;
    float _1888 = _1828;
    float _1890 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_61.x = _1808;
    out.m_61.y = _1822;
    out.m_61.z = _1804;
    float _1892 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1894 = _1738 + _1892;
    float _1896 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1890);
    float _1898 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1900 = _1732 + _1898;
    bool _1902 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1904 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1906 = _1902 || _1904;
    bool _1908 = isnan(0.5);
    bool _1910 = _1906 || _1908;
    float _1912 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1914 = _1748 + _1912;
    float _1916 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1896);
    float _1918 = fma(_1894, _1888, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1920 = fma(_1900, _1888, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1922 = fma(_1914, _1888, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1924 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1926 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1928 = 1.0 / _1924;
    float _1930 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1926);
    float _1932 = _1888;
    float _1934 = _1930;
    if (_1910)
    {
        _1932 = _1918;
    }
    float _1936 = _1932;
    float _1938 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1930);
    float _1940 = _1938;
    float _1942 = _1936;
    if (_1910)
    {
        _1934 = _1920;
    }
    float _1944 = _1934;
    float _1946 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1948 = _1944;
    if (_1910)
    {
        _1940 = _1922;
    }
    float _1950 = _1940;
    float _1952 = _1950;
    if (!_1910)
    {
        float _1954 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1956 = _1822 + _1954;
        float _1958 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1960 = _1808 + _1958;
        float _1962 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1964 = _1956 * _1956;
        float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1968 = _1804 + _1966;
        float _1970 = fma(_1960, _1960, _1964);
        float _1972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1974 = fma(_1968, _1968, _1970);
        float _1976 = sqrt(_1974);
        float _1978 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1980 = -_1822;
        float _1982 = _1980 + _1920;
        float _1984 = precise::min(_1976, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1986 = _1984 * _1972;
        float _1988 = -_1808;
        float _1990 = _1988 + _1918;
        float _1992 = _1978 * _1986;
        float _1994 = -_1804;
        float _1996 = _1994 + _1922;
        float _1998 = fma(_1990, _1992, _1808);
        float _2000 = fma(_1982, _1992, _1822);
        float _2002 = fma(_1996, _1992, _1804);
        _1948 = _2000;
        _1942 = _1998;
        _1952 = _2002;
    }
    float _2004 = _1948;
    float _2006 = _1942;
    float _2008 = _1952;
    float _2010 = _1946 + _1924;
    float _2012 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2014 = _2010 * _1928;
    float _2016 = _2014 * 0.5;
    float _2018 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2020 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2012);
    bool _2022 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2024 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan(0.5);
    bool _2030 = _2026 || _2028;
    float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2034 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2032);
    float _2036 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2018);
    float _2038 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2020);
    float _2040 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2042 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2044 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2036);
    float _2046 = 1.0 / _2034;
    float _2048 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2050 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2040);
    float _2052 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2054 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2042);
    float _2056 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2058 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2060 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2062 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2064 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2050);
    float _2066 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2056);
    float _2068 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2058);
    float _2070 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2060);
    float _2072 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2062);
    float _2074 = _2056;
    float _2076 = _2052;
    if (_2030)
    {
        _2074 = 1.0;
    }
    float _2078 = _2074;
    float _2080 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2054);
    float _2082 = _2078;
    if (_2030)
    {
        _2076 = 1.0;
    }
    float _2084 = _2076;
    float _2086 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2090 = _2046 * _2088;
    float _2092 = _2084;
    if (!_2030)
    {
        float _2094 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2096 = _2094 * 0.15915493667125701904296875;
        float _2098 = _2096 * 6.283185482025146484375;
        float _2100 = cos(_2098);
        float _2102 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2104 = _2102 * 0.15915493667125701904296875;
        float _2106 = _2096 * 6.283185482025146484375;
        float _2108 = sin(_2106);
        float _2110 = 1.0 / _2100;
        float _2112 = _2104 * 6.283185482025146484375;
        float _2114 = cos(_2112);
        float _2116 = _2108 * _2110;
        float _2118 = _2104 * 6.283185482025146484375;
        float _2120 = sin(_2118);
        float _2122 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2124 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2122;
        float _2126 = _2114 * _2116;
        float _2128 = 1.0 / _2124;
        float _2130 = 1.0 / _2126;
        float _2132 = _2120 * _2130;
        float _2134 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2136 = fma(_2090, _2132, _2134);
        float _2138 = _2136 * _2128;
        float _2140 = precise::clamp(_2138, 0.0, 1.0);
        _2082 = _2140;
    }
    float _2142 = _2082;
    if (!_2030)
    {
        float _2144 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2146 = _2144 * 0.15915493667125701904296875;
        float _2148 = _2146 * 6.283185482025146484375;
        float _2150 = cos(_2148);
        float _2152 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2154 = _2152 * 0.15915493667125701904296875;
        float _2156 = _2146 * 6.283185482025146484375;
        float _2158 = sin(_2156);
        float _2160 = 1.0 / _2150;
        float _2162 = _2154 * 6.283185482025146484375;
        float _2164 = cos(_2162);
        float _2166 = _2158 * _2160;
        float _2168 = _2154 * 6.283185482025146484375;
        float _2170 = sin(_2168);
        float _2172 = _2164 * _2166;
        float _2174 = 1.0 / _2172;
        float _2176 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2178 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2176;
        float _2180 = 1.0 / _2178;
        float _2182 = _2170 * _2174;
        float _2184 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2186 = fma(_2090, _2182, _2184);
        float _2188 = _2186 * _2180;
        float _2190 = precise::clamp(_2188, 0.0, 1.0);
        float _2192 = -_2190;
        float _2194 = _2192 + 1.0;
        _2092 = _2194;
    }
    float _2196 = _2092;
    float _2198 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2200 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2066);
    float _2202 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2070);
    float _2204 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2072);
    bool _2206 = _2142 > 0.0;
    bool _2208 = isnan(_2142);
    bool _2210 = _2206 || _2208;
    bool _2212 = isnan(0.0);
    bool _2214 = _2210 || _2212;
    float _2216 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2068);
    float _2218 = _2142 * _2196;
    float _2220 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2200);
    float _2222 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2204);
    float _2224 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2202);
    bool _2226 = _2196 <= 0.0;
    bool _2228 = !_2214;
    bool _2230 = _2226 || _2228;
    float _2232 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2216);
    float _2234 = _2220 + _2222;
    float _2236 = _2224 + _2222;
    float _2238 = _2222 * 0.5;
    float _2240 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2242 = _2234 * 0.5;
    float _2244 = _2236 * 0.5;
    float _2246 = fma(_2232, -0.5, _2238);
    float _2248 = _2240 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _2006;
    out.m_63.y = _2004;
    out.m_63.z = _2008;
    out.gl_Position.x = _2220;
    out.gl_Position.y = _2232;
    out.gl_Position.z = _2224;
    out.gl_Position.w = _2222;
    out.m_65.x = _2242;
    out.m_65.y = _2246;
    out.m_65.z = _2244;
    out.m_65.w = _2222;
    out.m_37.x = _2248;
    if (!_2230)
    {
        return out;
    }
    out.m_37.x = 0.0;
    float _2250 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2250;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1858 = false;
    bool _1116 = false;
    bool _898 = false;
    bool _514 = false;
    bool _280 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_34.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_88)
    {
        out.m_37.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _92 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2307 = as_type<float>(_100);
        out.gl_Position.z = _2307;
    }
    if (!_88)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _104 = in.m_39.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_114)
    {
        float _120 = float(_84);
        _94 = _120;
    }
    float _122 = _94;
    bool _124 = _118 >= _122;
    bool _126 = !_114;
    bool _128 = _124 || _126;
    float _130 = _122;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_37.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _102 = as_type<int>(_134);
    }
    int _136 = _102;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2376 = as_type<float>(_136);
        out.gl_Position.z = _2376;
    }
    if (_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_41.w;
    float _140 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = in.m_39.x;
    float _154 = in.m_39.y;
    float _156 = in.m_39.z;
    float _158 = in.m_34.x;
    float _160 = in.m_34.y;
    float _162 = in.m_34.z;
    float _164 = 0.0;
    float _166 = _140;
    if (!_150)
    {
        float _168 = _140 * _140;
        float _170 = _168 * 0.5;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = _172;
    if (!_150)
    {
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _176;
    }
    float _178 = _174;
    bool _180 = !_150;
    float _182 = _178;
    if (!_180)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _140 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _140);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _212;
    }
    float _214 = _182;
    bool _216 = !_150;
    if (!_216)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _140 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _166 = _236;
    }
    float _238 = _166;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _242 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _244 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _248 = fma(_238, _152, _242);
    float _250 = fma(_238, _154, _244);
    float _252 = fma(_238, _156, _246);
    float _254 = fma(_248, _138, _158);
    float _256 = fma(_250, _138, _160);
    float _258 = fma(_252, _138, _162);
    bool _260 = !_240;
    float _278;
    if (!_260)
    {
        float _262 = in.m_43.x;
        float _264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _266 = _262 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _270 = _268 * _264;
        float _272 = floor(_270);
        float _274 = -_272;
        float _276 = _270 + _274;
        _278 = _276;
        _280 = true;
    }
    else
    {
        float _282 = float(_84);
        float _284 = 1.0 / _282;
        float _286 = _118 * _284;
        _278 = _286;
    }
    _280 = false;
    float _288 = _278;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = _288 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = _288 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _288 + _310;
    bool _314 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _316 = isnan(_288);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = 1.0 / _300;
    bool _328 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _330 = isnan(_288);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_324;
    float _342 = _340 + 1.0;
    bool _344 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _346 = isnan(_288);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = 1.0 / _308;
    float _358 = _338 * _342;
    float _360 = -_338;
    float _362 = _360 + 1.0;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _366 = 1.0 / _304;
    float _368 = _292 * _326;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _374;
    float _378 = _296 * _356;
    bool _380 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _382 = isnan(_288);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = fma(_376, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = _312 * _366;
    float _404 = fma(_372, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = -_390;
    float _412 = _410 + 1.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _414;
    float _418 = _390 * _362;
    float _420 = fma(_396, _402, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_408, _402, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = fma(_400, _402, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = _354 * _412;
    float _428 = in.m_41.x;
    float _430 = in.m_41.y;
    float _432 = in.m_41.z;
    float _434 = fma(_416, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _436 = -_354;
    float _438 = _436 + 1.0;
    float _440 = _404 * _426;
    float _442 = _392 * _426;
    float _444 = _434 * _426;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _450;
    float _454 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].x, _440);
    float _456 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].y, _442);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].z, _444);
    float _464 = fma(_448, _378, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_452, _378, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_420, _418, _454);
    float _470 = fma(_422, _418, _456);
    float _472 = fma(_460, _378, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _474 = fma(_424, _418, _462);
    float _476 = fma(_464, _358, _468);
    float _478 = fma(_466, _358, _470);
    float _480 = fma(_472, _358, _474);
    float _482 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].x, _476);
    float _484 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].y, _478);
    float _486 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].z, _480);
    float _488 = _482 * _428;
    float _490 = _484 * _430;
    float _492 = _486 * _432;
    bool _494 = !_364;
    float _512;
    if (!_494)
    {
        float _496 = in.m_43.x;
        float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[11].x, _118);
        float _504 = _502 * _498;
        float _506 = floor(_504);
        float _508 = -_506;
        float _510 = _504 + _508;
        _512 = _510;
        _514 = true;
    }
    else
    {
        float _516 = float(_84);
        float _518 = 1.0 / _516;
        float _520 = _118 * _518;
        _512 = _520;
    }
    _514 = false;
    float _522 = _512;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _526 = _522 + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _544 = 1.0 / _530;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _554 = 1.0 / _538;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _558 = _522 + _556;
    bool _560 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _562 = isnan(_522);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    bool _572 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _574 = isnan(_522);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    bool _584 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _586 = isnan(_522);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    float _596 = 1.0 / _534;
    float _598 = _558 * _544;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _602 = _522 + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _604;
    float _608 = -_582;
    float _610 = _608 + 1.0;
    bool _612 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _614 = isnan(_522);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = fma(_606, _598, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _626 = 1.0 / _552;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _630 = _522 + _628;
    float _632 = _602 * _554;
    bool _634 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _636 = isnan(_522);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = -_570;
    float _648 = _646 + 1.0;
    float _650 = 1.0 / _542;
    float _652 = _630 * _596;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _656 = _522 + _654;
    float _658 = -_644;
    float _660 = _658 + 1.0;
    bool _662 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _664 = _570 * _660;
    float _666 = 1.0 / _548;
    float _668 = _656 * _626;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _670;
    float _674 = fma(_672, _598, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _676 = _582 * _648;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _684 = _522 + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _694 = fma(_680, _652, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _696 = _684 * _650;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _698;
    float _702 = -_594;
    float _704 = _702 + 1.0;
    float _706 = _526 * _666;
    float _708 = fma(_688, _652, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _710 = fma(_700, _598, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _712 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _714 = isnan(_522);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = _594 * _610;
    bool _726 = _522 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _728 = isnan(_522);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _734 = _730 || _732;
    float _736 = float(_734);
    float _738 = fma(_692, _652, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _740;
    float _744 = _722 * _704;
    float _746 = -_722;
    float _748 = _746 + 1.0;
    float _750 = -_736;
    float _752 = _750 + 1.0;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _754;
    float _758 = _736 * _748;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _760;
    float _764 = _622 * _752;
    float _766 = fma(_756, _706, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _768 = -_622;
    float _770 = _768 + 1.0;
    float _772 = fma(_762, _706, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _774 = _624 * _764;
    float _776 = fma(_742, _706, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _778 = _674 * _764;
    float _780 = _710 * _764;
    float _782 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[107].z, _774);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _788 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[107].x, _778);
    float _790 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[107].y, _780);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _796 = fma(_738, _758, _782);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _802 = fma(_708, _758, _788);
    float _804 = fma(_694, _758, _790);
    float _806 = fma(_786, _668, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _808 = fma(_794, _668, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _810 = fma(_800, _668, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _812 = fma(_772, _744, _802);
    float _814 = fma(_766, _744, _804);
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _816;
    float _820 = fma(_776, _744, _796);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _826;
    float _830 = fma(_818, _632, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _832 = fma(_806, _724, _812);
    float _834 = fma(_808, _724, _814);
    float _836 = fma(_810, _724, _820);
    float _838 = fma(_824, _632, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _848 = fma(_828, _632, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _854 = fma(_830, _676, _832);
    float _856 = fma(_842, _696, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _858 = fma(_846, _696, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _860 = fma(_838, _676, _834);
    float _862 = fma(_852, _696, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _864 = fma(_848, _676, _836);
    float _866 = fma(_856, _664, _854);
    float _868 = fma(_858, _664, _860);
    float _870 = fma(_862, _664, _864);
    float _872 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[113].x, _866);
    float _874 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[113].y, _868);
    float _876 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[113].z, _870);
    bool _878 = !_662;
    float _896;
    if (!_878)
    {
        float _880 = in.m_43.x;
        float _882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _884 = _880 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _888 = _886 * _882;
        float _890 = floor(_888);
        float _892 = -_890;
        float _894 = _888 + _892;
        _896 = _894;
        _898 = true;
    }
    else
    {
        float _900 = float(_84);
        float _902 = 1.0 / _900;
        float _904 = _118 * _902;
        _896 = _904;
    }
    _898 = false;
    float _906 = _896;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _910 = _906 + _908;
    float _912 = _872 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _926 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _928 = isnan(_906);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = 1.0 / _916;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _944 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _946 = isnan(_906);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _952 = _948 || _950;
    float _954 = float(_952);
    float _956 = _874 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _958 = _876 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _960 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _962 = 1.0 / _924;
    float _964 = _920 * _938;
    bool _966 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _968 = isnan(_906);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = 1.0 / _942;
    float _980 = -_936;
    float _982 = _980 + 1.0;
    float _984 = fma(_964, _910, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _990 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _992 = isnan(_906);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = -_976;
    float _1004 = _1002 + 1.0;
    float _1006 = _976 * _982;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1012 = 1.0 / _988;
    float _1014 = -_1000;
    float _1016 = _1014 + 1.0;
    float _1018 = _954 * _1004;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1020;
    float _1024 = _1010 * _962;
    float _1026 = _936 * _1016;
    float _1028 = _984 * _1018;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1032 = _906 + _1030;
    float _1034 = -_954;
    float _1036 = _1034 + 1.0;
    bool _1038 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1040 = isnan(_906);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1046 = _1042 || _1044;
    float _1048 = float(_1046);
    float _1050 = _1022 * _978;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1058 = _906 + _1056;
    float _1060 = fma(_1024, _1032, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1062 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1028);
    float _1064 = -_1048;
    float _1066 = _1064 + 1.0;
    float _1068 = _1054 * _1012;
    float _1070 = fma(_1050, _1058, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1074 = _906 + _1072;
    float _1076 = fma(_1060, _1006, _1062);
    float _1078 = _1000 * _1066;
    float _1080 = fma(_1068, _1074, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1082 = fma(_1070, _1026, _1076);
    float _1084 = _912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1086 = fma(_1080, _1078, _1082);
    float _1088 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1090 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1086);
    float _1092 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1094 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_45.x = _1084;
    out.m_45.y = _1092;
    out.m_45.z = _1088;
    out.m_45.w = _1094;
    bool _1096 = !_960;
    float _1114;
    if (!_1096)
    {
        float _1098 = in.m_43.x;
        float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1102 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[11].z, _118);
        float _1106 = _1104 * _1100;
        float _1108 = floor(_1106);
        float _1110 = -_1108;
        float _1112 = _1106 + _1110;
        _1114 = _1112;
        _1116 = true;
    }
    else
    {
        float _1118 = float(_84);
        float _1120 = 1.0 / _1118;
        float _1122 = _118 * _1120;
        _1114 = _1122;
    }
    _1116 = false;
    float _1124 = _1114;
    float _1126 = _256 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1128 = _256 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1130 = _256 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1132 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1126);
    float _1134 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1128);
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1136;
    float _1140 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1132);
    float _1142 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1134);
    float _1144 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1130);
    float _1146 = 1.0 / _1138;
    float _1148 = _1140 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1150 = _1142 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1154 = _1152 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1162 = _1148 + _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1166 = _1150 + _1164;
    float _1168 = in.m_47.y;
    float _1170 = 1.0 / _1154;
    float _1172 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1144);
    float _1174 = _1166 * _1166;
    float _1176 = in.m_49.x;
    float _1178 = in.m_49.y;
    float _1180 = in.m_49.z;
    float _1182 = _1172 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1184 = fma(_1162, _1162, _1174);
    float _1186 = in.m_43.y;
    float _1188 = 1.0 / _1158;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1192 = _1190 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1196 = _1182 + _1194;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1200 = _1198 != 0;
    float _1202 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1204 = fma(_1196, _1196, _1184);
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1208 = _1206 != 0;
    float _1210 = 1.0 / _1192;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1214 = _1124 + _1212;
    float _1216 = in.m_47.x;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1218;
    float _1222 = sqrt(_1204);
    float _1224 = _1006;
    float _1226 = _1168;
    float _1228 = _1216;
    float _1230 = _1182;
    if (_1200)
    {
        float _1232 = in.m_43.x;
        _1224 = _1232;
    }
    float _1234 = _1224;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1238 = _1124 + _1236;
    float _1240 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1180);
    float _1242 = _1202 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1176);
    float _1246 = -_1168;
    float _1248 = _1246 + 1.0;
    bool _1250 = _1186 > 0.5;
    float _1252 = rsqrt(_1204);
    float _1254 = _1238 * _1146;
    float _1256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1178);
    if (_1208)
    {
        float _1258 = _1250 ? _1248 : _1168;
        _1226 = _1258;
    }
    float _1260 = _1226;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1264 = _1124 + _1262;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1272 = _1124 + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1276 = _1124 + _1274;
    float _1278 = _1222 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1280 = _1264 * _1170;
    float _1282 = 1.0 / _1268;
    float _1284 = _1272 * _1188;
    float _1286 = _1214 * _1210;
    float _1288 = precise::min(_1242, _1278);
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1292 = _1124 + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1294;
    float _1298 = 1.0 / _1220;
    float _1300 = _1252 * _1288;
    bool _1302 = _1234 > 0.5;
    bool _1304 = _1302 && _1200;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1308 = _1306 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1310 = 0.0;
    if (_1200)
    {
        _1310 = _1216;
    }
    float _1312 = _1310;
    float _1314 = _1166 * _1300;
    float _1316 = _1162 * _1300;
    float _1318 = _1196 * _1300;
    float _1320 = _1292 * _1282;
    float _1322 = -_1314;
    float _1324 = _1166 + _1322;
    float _1326 = -_1316;
    float _1328 = _1162 + _1326;
    float _1330 = -_1318;
    float _1332 = _1196 + _1330;
    float _1334 = _1324 * _1324;
    float _1336 = _1312;
    if (_1304)
    {
        float _1338 = -_1312;
        float _1340 = _1338 + 1.0;
        _1336 = _1340;
    }
    float _1342 = _1336;
    float _1344 = _1276 * _1298;
    float _1346 = fma(_1328, _1328, _1334);
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1348;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1356;
    float _1360 = fma(_1332, _1332, _1346);
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1364 = _1362 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1370;
    float _1374 = sqrt(_1360);
    float _1376 = fma(_1350, _1254, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1378;
    float _1382 = fma(_1354, _1254, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1388 = fma(_1372, _1284, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1390 = fma(_1380, _1284, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1394 = _1392 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1396 = fma(_1358, _1254, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1398 = fma(_1386, _1280, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1400 = fma(_1364, _1280, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1402 = fma(_1368, _1280, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1406 = _1404 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1408 = fma(_1296, _1284, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1410 = fma(_1394, _1286, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1412 = fma(_1406, _1286, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1414 = _1252 * _1374;
    float _1416 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1420;
    float _1424 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1426;
    float _1430 = fma(_1418, _1344, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1432 = fma(_1422, _1344, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1434 = _492 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1436 = fma(_1428, _1344, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1438 = _1424 * _1414;
    bool _1440 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1442 = isnan(_1124);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = fma(_1308, _1286, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1454 = _1202 * _1414;
    float _1456 = _1434 * _1414;
    bool _1458 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1460 = isnan(_1124);
    bool _1462 = _1458 || _1460;
    bool _1464 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1466 = _1462 || _1464;
    float _1468 = float(_1466);
    float _1470 = -_1450;
    float _1472 = _1470 + 1.0;
    float _1474 = _1438 * _1256;
    bool _1476 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1478 = isnan(_1124);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1484 = _1480 || _1482;
    float _1486 = float(_1484);
    float _1488 = _1456 * _1240;
    float _1490 = _1468 * _1472;
    float _1492 = -_1468;
    float _1494 = _1492 + 1.0;
    float _1496 = _1454 * _1244;
    float _1498 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1500 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1502 = isnan(_1124);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1508 = _1504 || _1506;
    float _1510 = float(_1508);
    float _1512 = _1486 * _1494;
    float _1514 = -_1486;
    float _1516 = _1514 + 1.0;
    float _1518 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1520 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1498);
    bool _1522 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1524 = isnan(_1124);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1530 = _1526 || _1528;
    float _1532 = float(_1530);
    float _1534 = _1510 * _1516;
    float _1536 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1518);
    float _1538 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1520);
    float _1540 = -_1510;
    float _1542 = _1540 + 1.0;
    float _1544 = -_1532;
    float _1546 = _1544 + 1.0;
    float _1548 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1536);
    float _1550 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1552 = _1532 * _1542;
    bool _1554 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1556 = isnan(_1124);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1562 = _1558 || _1560;
    float _1564 = float(_1562);
    float _1566 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1568 = _1182 + _1550;
    bool _1570 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1572 = isnan(_1124);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1578 = _1574 || _1576;
    float _1580 = float(_1578);
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1584 = _1582 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1586 = _1148 + _1566;
    float _1588 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1590 = _1568 + _1588;
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1594 = _1592 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1596 = -_1564;
    float _1598 = _1596 + 1.0;
    float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1602 = _1586 + _1600;
    float _1604 = _1590 * _1590;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1610 = _1580 * _1598;
    float _1612 = fma(_1584, _1320, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1614 = fma(_1602, _1602, _1604);
    float _1616 = -_1580;
    float _1618 = _1616 + 1.0;
    float _1620 = _1396 * _1610;
    float _1622 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1624 = sqrt(_1614);
    float _1626 = _1376 * _1610;
    float _1628 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1620);
    float _1630 = _1564 * _1546;
    float _1632 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1622);
    float _1634 = _1382 * _1610;
    float _1636 = _1586;
    float _1638 = _1568;
    if (_1200)
    {
        _1228 = _1342;
    }
    float _1640 = _1228;
    float _1642 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1626);
    float _1644 = fma(_1398, _1630, _1628);
    float _1646 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1632);
    float _1648 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1634);
    float _1650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1652 = fma(_1400, _1630, _1642);
    float _1654 = fma(_1388, _1552, _1644);
    float _1656 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1658 = fma(_1402, _1630, _1648);
    bool _1660 = _1624 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = fma(_1390, _1552, _1652);
    float _1664 = fma(_1410, _1534, _1654);
    float _1666 = _1150 + _1656;
    float _1668 = fma(_1408, _1552, _1658);
    float _1670 = fma(_1594, _1320, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1672 = fma(_1430, _1512, _1664);
    float _1674 = fma(_1608, _1320, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1676 = fma(_1412, _1534, _1662);
    float _1678 = fma(_1452, _1534, _1668);
    float _1680 = _1664;
    if (!_1660)
    {
        _1680 = _1666;
    }
    float _1682 = _1680;
    bool _1684 = !_1660;
    float _1686 = _1682;
    if (!_1684)
    {
        float _1688 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1692 = _1624 + _1690;
        float _1694 = _1666 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1696 = rsqrt(_1614);
        float _1698 = _1692 * _1688;
        float _1700 = _1698 * 0.15915493667125701904296875;
        float _1702 = _1700 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = _1700 * 6.283185482025146484375;
        float _1708 = cos(_1706);
        float _1710 = fma(_1704, _1694, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1712 = _1696 * _1710;
        float _1714 = _1708 + (-1.0);
        float _1716 = fma(_1602, _1712, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1718 = fma(_1590, _1712, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1720 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1722 = fma(_1666, _1708, _1720);
        _1686 = _1722;
        _1636 = _1716;
        _1638 = _1718;
    }
    float _1724 = _1686;
    float _1726 = _1636;
    float _1728 = _1638;
    float _1730 = -_1314;
    float _1732 = _1730 + _1724;
    float _1734 = fma(_1432, _1512, _1676);
    float _1736 = -_1316;
    float _1738 = _1736 + _1726;
    float _1740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1742 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1744 = _1732 + _1742;
    float _1746 = -_1318;
    float _1748 = _1746 + _1728;
    float _1750 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1752 = _1738 + _1750;
    float _1754 = fma(_1436, _1512, _1678);
    float _1756 = _1744 * _1744;
    float _1758 = fma(_1612, _1490, _1672);
    float _1760 = fma(_1670, _1490, _1734);
    float _1762 = fma(_1674, _1490, _1754);
    float _1764 = fma(_1752, _1752, _1756);
    float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1768 = _1748 + _1766;
    float _1770 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1772 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1774 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1758);
    float _1776 = fma(_1768, _1768, _1764);
    float _1778 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1760);
    float _1780 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1762);
    float _1782 = _1770 * _1650;
    float _1784 = _1772 * _1740;
    float _1786 = sqrt(_1776);
    float _1788 = _1774 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1790 = _1778 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1792 = _1780 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1796 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1798 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1800 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_51.x = _1784;
    out.m_51.y = _1782;
    float _1802 = -_1318;
    float _1804 = _1182 + _1802;
    float _1806 = -_1316;
    float _1808 = _1148 + _1806;
    out.m_53.x = 1.0;
    out.m_53.y = 1.0;
    out.m_53.z = 1.0;
    bool _1810 = _1786 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1812 = isnan(_1786);
    bool _1814 = _1810 || _1812;
    bool _1816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1818 = _1814 || _1816;
    float _1820 = -_1314;
    float _1822 = _1150 + _1820;
    out.m_55.w = _1288;
    out.m_57.x = _1796;
    out.m_57.y = _1798;
    out.m_57.z = _1800;
    out.m_57.w = _1794;
    out.m_59.x = _1454;
    if (!_1818)
    {
        _1230 = 1.0;
    }
    float _1824 = _1230;
    bool _1826 = !_1818;
    float _1828 = _1824;
    if (!_1826)
    {
        bool _1830 = _1786 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1832 = isnan(_1786);
        bool _1834 = _1830 || _1832;
        bool _1836 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1838 = _1834 || _1836;
        if (!_1838)
        {
            float _1840 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1842 = _1786 + _1840;
            float _1844 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1846 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1844;
            float _1848 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1850 = _1848 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1852 = 1.0 / _1846;
            float _1854 = _1842 * _1852;
            float _1856 = fma(_1854, _1850, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1828 = _1856;
            _1858 = true;
        }
        else
        {
            bool _1860 = _1786 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1862 = isnan(_1786);
            bool _1864 = _1860 || _1862;
            bool _1866 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1868 = _1864 || _1866;
            if (!_1868)
            {
                float _1870 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1872 = _1786 + _1870;
                float _1874 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1876 = _1874 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1878 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1880 = _1878 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1882 = 1.0 / _1876;
                float _1884 = _1872 * _1882;
                float _1886 = fma(_1884, _1880, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1828 = _1886;
                _1858 = true;
            }
            else
            {
                _1828 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1858 = false;
    float _1888 = _1828;
    float _1890 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_61.x = _1808;
    out.m_61.y = _1822;
    out.m_61.z = _1804;
    float _1892 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1894 = _1738 + _1892;
    float _1896 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1890);
    float _1898 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1900 = _1732 + _1898;
    bool _1902 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1904 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1906 = _1902 || _1904;
    bool _1908 = isnan(0.5);
    bool _1910 = _1906 || _1908;
    float _1912 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1914 = _1748 + _1912;
    float _1916 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1896);
    float _1918 = fma(_1894, _1888, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1920 = fma(_1900, _1888, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1922 = fma(_1914, _1888, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1924 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1926 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1928 = 1.0 / _1924;
    float _1930 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1926);
    float _1932 = _1888;
    float _1934 = _1930;
    if (_1910)
    {
        _1932 = _1918;
    }
    float _1936 = _1932;
    float _1938 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1930);
    float _1940 = _1938;
    float _1942 = _1936;
    if (_1910)
    {
        _1934 = _1920;
    }
    float _1944 = _1934;
    float _1946 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1948 = _1944;
    if (_1910)
    {
        _1940 = _1922;
    }
    float _1950 = _1940;
    float _1952 = _1950;
    if (!_1910)
    {
        float _1954 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1956 = _1822 + _1954;
        float _1958 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1960 = _1808 + _1958;
        float _1962 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1964 = _1956 * _1956;
        float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1968 = _1804 + _1966;
        float _1970 = fma(_1960, _1960, _1964);
        float _1972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1974 = fma(_1968, _1968, _1970);
        float _1976 = sqrt(_1974);
        float _1978 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1980 = -_1822;
        float _1982 = _1980 + _1920;
        float _1984 = precise::min(_1976, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1986 = _1984 * _1972;
        float _1988 = -_1808;
        float _1990 = _1988 + _1918;
        float _1992 = _1978 * _1986;
        float _1994 = -_1804;
        float _1996 = _1994 + _1922;
        float _1998 = fma(_1990, _1992, _1808);
        float _2000 = fma(_1982, _1992, _1822);
        float _2002 = fma(_1996, _1992, _1804);
        _1948 = _2000;
        _1942 = _1998;
        _1952 = _2002;
    }
    float _2004 = _1948;
    float _2006 = _1942;
    float _2008 = _1952;
    float _2010 = _1946 + _1924;
    float _2012 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2014 = _2010 * _1928;
    float _2016 = _2014 * 0.5;
    float _2018 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2020 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2012);
    bool _2022 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2024 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan(0.5);
    bool _2030 = _2026 || _2028;
    float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2034 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2032);
    float _2036 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2018);
    float _2038 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2020);
    float _2040 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2042 = _2004 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2044 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2036);
    float _2046 = 1.0 / _2034;
    float _2048 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2050 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2040);
    float _2052 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2054 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2042);
    float _2056 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2058 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2060 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2062 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2064 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2050);
    float _2066 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2056);
    float _2068 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2058);
    float _2070 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2060);
    float _2072 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2062);
    float _2074 = _2056;
    float _2076 = _2052;
    if (_2030)
    {
        _2074 = 1.0;
    }
    float _2078 = _2074;
    float _2080 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2054);
    float _2082 = _2078;
    if (_2030)
    {
        _2076 = 1.0;
    }
    float _2084 = _2076;
    float _2086 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2090 = _2046 * _2088;
    float _2092 = _2084;
    if (!_2030)
    {
        float _2094 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2096 = _2094 * 0.15915493667125701904296875;
        float _2098 = _2096 * 6.283185482025146484375;
        float _2100 = cos(_2098);
        float _2102 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2104 = _2102 * 0.15915493667125701904296875;
        float _2106 = _2096 * 6.283185482025146484375;
        float _2108 = sin(_2106);
        float _2110 = 1.0 / _2100;
        float _2112 = _2104 * 6.283185482025146484375;
        float _2114 = cos(_2112);
        float _2116 = _2108 * _2110;
        float _2118 = _2104 * 6.283185482025146484375;
        float _2120 = sin(_2118);
        float _2122 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2124 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2122;
        float _2126 = _2114 * _2116;
        float _2128 = 1.0 / _2124;
        float _2130 = 1.0 / _2126;
        float _2132 = _2120 * _2130;
        float _2134 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2136 = fma(_2090, _2132, _2134);
        float _2138 = _2136 * _2128;
        float _2140 = precise::clamp(_2138, 0.0, 1.0);
        _2082 = _2140;
    }
    float _2142 = _2082;
    if (!_2030)
    {
        float _2144 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2146 = _2144 * 0.15915493667125701904296875;
        float _2148 = _2146 * 6.283185482025146484375;
        float _2150 = cos(_2148);
        float _2152 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2154 = _2152 * 0.15915493667125701904296875;
        float _2156 = _2146 * 6.283185482025146484375;
        float _2158 = sin(_2156);
        float _2160 = 1.0 / _2150;
        float _2162 = _2154 * 6.283185482025146484375;
        float _2164 = cos(_2162);
        float _2166 = _2158 * _2160;
        float _2168 = _2154 * 6.283185482025146484375;
        float _2170 = sin(_2168);
        float _2172 = _2164 * _2166;
        float _2174 = 1.0 / _2172;
        float _2176 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2178 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2176;
        float _2180 = 1.0 / _2178;
        float _2182 = _2170 * _2174;
        float _2184 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2186 = fma(_2090, _2182, _2184);
        float _2188 = _2186 * _2180;
        float _2190 = precise::clamp(_2188, 0.0, 1.0);
        float _2192 = -_2190;
        float _2194 = _2192 + 1.0;
        _2092 = _2194;
    }
    float _2196 = _2092;
    float _2198 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2200 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2066);
    float _2202 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2070);
    float _2204 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2072);
    bool _2206 = _2142 > 0.0;
    bool _2208 = isnan(_2142);
    bool _2210 = _2206 || _2208;
    bool _2212 = isnan(0.0);
    bool _2214 = _2210 || _2212;
    float _2216 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2068);
    float _2218 = _2142 * _2196;
    float _2220 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2200);
    float _2222 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2204);
    float _2224 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2202);
    bool _2226 = _2196 <= 0.0;
    bool _2228 = !_2214;
    bool _2230 = _2226 || _2228;
    float _2232 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2216);
    float _2234 = _2220 + _2222;
    float _2236 = _2224 + _2222;
    float _2238 = _2222 * 0.5;
    float _2240 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2242 = _2234 * 0.5;
    float _2244 = _2236 * 0.5;
    float _2246 = fma(_2232, -0.5, _2238);
    float _2248 = _2240 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _2006;
    out.m_63.y = _2004;
    out.m_63.z = _2008;
    out.gl_Position.x = _2220;
    out.gl_Position.y = _2232;
    out.gl_Position.z = _2224;
    out.gl_Position.w = _2222;
    out.m_65.x = _2242;
    out.m_65.y = _2246;
    out.m_65.z = _2244;
    out.m_65.w = _2222;
    out.m_37.x = _2248;
    if (!_2230)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_37.x = 0.0;
    float _2250 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2250;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

