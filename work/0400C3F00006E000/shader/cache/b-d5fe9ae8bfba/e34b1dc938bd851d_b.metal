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
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_37 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_33 [[attribute(7)]];
    float4 m_39 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _538 = false;
    bool _262 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_26.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _74 = _72;
    float _76 = _74;
    if (!_70)
    {
        out.m_29.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _74 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1127 = as_type<float>(_82);
        out.gl_Position.z = _1127;
    }
    if (!_70)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _86 = in.m_31.w;
    bool _88 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _90 = isnan(_86);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _96 = _92 || _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_96)
    {
        float _102 = float(_66);
        _76 = _102;
    }
    float _104 = _76;
    bool _106 = _100 >= _104;
    bool _108 = !_96;
    bool _110 = _106 || _108;
    float _112 = _104;
    if (_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (_110)
    {
        out.m_29.x = 0.0;
    }
    if (_110)
    {
        float _116 = _114 * 5.0;
        _84 = as_type<int>(_116);
    }
    int _118 = _84;
    if (_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1196 = as_type<float>(_118);
        out.gl_Position.z = _1196;
    }
    if (_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_33.w;
    float _122 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _124 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _126 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _128 = _124 || _126;
    bool _130 = isnan(1.0);
    bool _132 = _128 || _130;
    float _134 = in.m_31.x;
    float _136 = in.m_31.y;
    float _138 = in.m_31.z;
    float _140 = in.m_26.x;
    float _142 = in.m_26.y;
    float _144 = in.m_26.z;
    float _146 = 0.0;
    float _148 = _122;
    if (!_132)
    {
        float _150 = _122 * _122;
        float _152 = _150 * 0.5;
        _146 = _152;
    }
    float _154 = _146;
    float _156 = _154;
    if (!_132)
    {
        float _158 = _154 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _156 = _158;
    }
    float _160 = _156;
    bool _162 = !_132;
    float _164 = _160;
    if (!_162)
    {
        float _166 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _168 = log2(_166);
        float _170 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _172 = _170 + 1.0;
        float _174 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = _122 * _168;
        float _178 = 1.0 / _172;
        float _180 = _174 * 0.693147182464599609375;
        float _182 = exp2(_176);
        float _184 = 1.0 / _180;
        float _186 = _182 + (-1.0);
        float _188 = -_186;
        float _190 = fma(_188, _184, _122);
        float _192 = _190 * _178;
        float _194 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _194;
    }
    float _196 = _164;
    bool _198 = !_132;
    if (!_198)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = 1.0 / _206;
        float _210 = _122 * _202;
        float _212 = exp2(_210);
        float _214 = -_212;
        float _216 = _214 + 1.0;
        float _218 = _216 * _208;
        _148 = _218;
    }
    float _220 = _148;
    bool _222 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _224 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _226 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _228 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _230 = fma(_220, _134, _224);
    float _232 = fma(_220, _136, _226);
    float _234 = fma(_220, _138, _228);
    float _236 = fma(_230, _120, _140);
    float _238 = fma(_232, _120, _142);
    float _240 = fma(_234, _120, _144);
    bool _242 = !_222;
    float _260;
    if (!_242)
    {
        float _244 = in.m_35.x;
        float _246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _248 = _244 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _250 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _252 = _250 * _246;
        float _254 = floor(_252);
        float _256 = -_254;
        float _258 = _252 + _256;
        _260 = _258;
        _262 = true;
    }
    else
    {
        float _264 = float(_66);
        float _266 = 1.0 / _264;
        float _268 = _100 * _266;
        _260 = _268;
    }
    _262 = false;
    float _270 = _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _270 + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = _270 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = _270 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _290 = _288 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _300 = 1.0 / _286;
    bool _302 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_270);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = 1.0 / _290;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _318 = _270 + _316;
    bool _320 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _322 = 1.0 / _298;
    float _324 = _278 * _300;
    float _326 = 1.0 / _294;
    float _328 = _274 * _314;
    bool _330 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _332 = isnan(_270);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _342;
    float _346 = fma(_344, _324, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _348 = _318 * _322;
    bool _350 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _352 = isnan(_270);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    bool _362 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _364 = isnan(_270);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = -_360;
    float _376 = _374 + 1.0;
    float _378 = _282 * _326;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    float _388 = _372 * _376;
    float _390 = -_372;
    float _392 = _390 + 1.0;
    float _394 = fma(_382, _324, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = fma(_386, _324, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = -_340;
    float _400 = _398 + 1.0;
    float _402 = _340 * _392;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _408 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _410 = isnan(_270);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = _312 * _400;
    float _422 = -_312;
    float _424 = _422 + 1.0;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _434 = fma(_406, _328, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _436 = _418 * _424;
    float _438 = fma(_428, _328, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _440 = fma(_432, _328, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _442 = _346 * _436;
    float _444 = _394 * _436;
    float _446 = -_418;
    float _448 = _446 + 1.0;
    float _450 = _396 * _436;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _442);
    float _462 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _444);
    float _464 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _450);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _466;
    float _470 = fma(_454, _378, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _472 = fma(_438, _420, _460);
    float _474 = fma(_440, _420, _464);
    float _476 = fma(_434, _420, _462);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _486 = fma(_458, _378, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _488 = fma(_468, _378, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _494 = fma(_470, _402, _472);
    float _496 = fma(_480, _348, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _498 = fma(_484, _348, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _500 = fma(_492, _348, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _502 = fma(_486, _402, _476);
    float _504 = fma(_488, _402, _474);
    float _506 = fma(_496, _388, _494);
    float _508 = fma(_498, _388, _502);
    float _510 = fma(_500, _388, _504);
    float _512 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[147].x, _506);
    float _514 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[147].y, _508);
    float _516 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[147].z, _510);
    bool _518 = !_320;
    float _536;
    if (!_518)
    {
        float _520 = in.m_35.x;
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _524 = _520 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _528 = _526 * _522;
        float _530 = floor(_528);
        float _532 = -_530;
        float _534 = _528 + _532;
        _536 = _534;
        _538 = true;
    }
    else
    {
        float _540 = float(_66);
        float _542 = 1.0 / _540;
        float _544 = _100 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = in.m_33.x;
    float _550 = in.m_33.y;
    float _552 = in.m_33.z;
    float _554 = _238 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _556 = _238 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _560 = _558 != 0;
    float _562 = _238 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _566 = _564 != 0;
    float _568 = in.m_35.x;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _572 = _570 != 0;
    float _574 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[6].x, _562);
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _578 = _576 != 0;
    float _580 = in.m_35.y;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _584 = _582 != 0;
    float _586 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[4].x, _554);
    float _588 = in.m_37.x;
    float _590 = in.m_37.y;
    float _592 = in.m_37.z;
    float _594 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[5].x, _556);
    float _596 = in.m_39.y;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _606 = in.m_35.z;
    float _608 = _512 * _548;
    float _610 = _516 * _552;
    float _612 = 1.0 / _600;
    float _614 = _514 * _550;
    float _616 = in.m_39.x;
    bool _618 = false;
    float _620 = _586;
    if (_560)
    {
        bool _622 = _568 > 0.5;
        _618 = _622;
    }
    bool _624 = _618;
    float _626 = _614 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _628 = 1.0 / _604;
    float _630 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].z, _586);
    if (_584)
    {
        _620 = _580;
    }
    float _632 = _620;
    float _634 = _632;
    if (!_584)
    {
        _634 = _568;
    }
    float _636 = _634;
    float _638 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _588);
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _590);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _646 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].z, _594);
    float _648 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].z, _574);
    float _650 = _568 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _652 = _580 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _654 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _592);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _660 = -_640;
    float _662 = fma(_650, 2.0, _660);
    float _664 = fma(_652, -2.0, _644);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _666;
    float _670 = _658 * _612;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _676 = _668 * _628;
    float _678 = -_596;
    float _680 = _678 + 1.0;
    float _682 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[88].z, _672);
    bool _684 = _606 > 0.5;
    float _686 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[78].z, _674);
    float _688 = _672;
    float _690 = _606;
    float _692 = _638;
    float _694 = _596;
    int _696 = as_type<int>(_636);
    if (_584)
    {
        _688 = _568;
    }
    float _698 = _688;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _704 = _684 ? as_type<int>(_680) : as_type<int>(_596);
    float _706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _708 = _698;
    if (!_584)
    {
        _708 = _606;
    }
    float _710 = _708;
    float _712 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[78].w, _700);
    bool _714 = _580 > 0.5;
    float _716 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[88].w, _702);
    if (!_584)
    {
        _690 = _580;
    }
    float _718 = _690;
    float _720 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _724 = _546 + _722;
    float _726 = _626 * _642;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _728 = _720 * _654;
    float _730 = fma(_676, _724, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _734 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _736 = isnan(_546);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _748 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _750 = isnan(_546);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = _706 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _764 = _546 + _762;
    bool _766 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _768 = isnan(_546);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = _746 * _638;
    float _780 = fma(_670, _764, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _782 = -_744;
    float _784 = _782 + 1.0;
    float _786 = _720;
    if (!_560)
    {
        _692 = _616;
    }
    float _788 = _692;
    float _790 = _710 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _792 = _572 ? as_type<float>(_704) : _596;
    float _794 = _776 * _784;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _798 = -_776;
    float _800 = _798 + 1.0;
    float _802 = _788;
    if (!_560)
    {
        _786 = _788;
    }
    float _804 = _786;
    float _806 = fma(_792, _760, -0.5);
    float _808 = _804;
    if (_560)
    {
        _802 = _616;
    }
    float _810 = _802;
    float _812 = _758 * _800;
    float _814 = _810;
    if (_578)
    {
        float _816 = _714 ? _680 : _596;
        _694 = _816;
    }
    float _818 = _694;
    float _820 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[89].z, _796);
    float _822 = _732 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _824 = _730 * _812;
    float _826 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[89].x, _820);
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _830 = fma(_822, _818, -0.5);
    float _832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _834 = as_type<int>(_818);
    if (_560)
    {
        float _836 = -_810;
        float _838 = _836 + 1.0;
        _834 = as_type<int>(_838);
    }
    int _840 = _834;
    float _842 = -_828;
    float _844 = fma(_790, 2.0, _842);
    float _846 = _726 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _848 = _726 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _850 = _726 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _854 = _826 * (-0.15915493667125701904296875);
    float _856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_560)
    {
        float _858 = _624 ? as_type<float>(_840) : _810;
        _808 = _858;
    }
    float _860 = _808;
    float _862 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[24].x, _846);
    float _864 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[25].x, _848);
    float _866 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[26].x, _850);
    float _868 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _664);
    float _870 = _636 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _872 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].z, _682);
    float _874 = _854 * 6.283185482025146484375;
    float _876 = sin(_874);
    if (_566)
    {
        float _878 = -_810;
        float _880 = _878 + 1.0;
        _696 = as_type<int>(_880);
    }
    int _882 = _696;
    float _884 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[24].z, _862);
    float _886 = fma(_870, -2.0, _852);
    float _888 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[25].z, _864);
    float _890 = _630 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (_566)
    {
        float _892 = _714 ? as_type<float>(_882) : _810;
        _814 = _892;
    }
    float _894 = _814;
    float _896 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _686);
    float _898 = _854 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = -_100;
    float _904 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[76].x, _662);
    float _906 = _832 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _908 = _884 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _910 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _712);
    float _912 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].w, _716);
    float _914 = -_100;
    float _916 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[86].x, _844);
    float _918 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[86].y, _886);
    float _920 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[26].z, _866);
    float _922 = -_758;
    float _924 = _922 + 1.0;
    float _926 = _856 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _928 = fma(_906, _860, -0.5);
    float _930 = _646 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _932 = _888 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _934 = _890 + _908;
    float _936 = _876 * _806;
    float _938 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[115].x, _824);
    float _940 = fma(_926, _894, -0.5);
    float _942 = _900 * _806;
    float _944 = _930 + _932;
    float _946 = fma(_780, _794, _938);
    float _948 = -_936;
    float _950 = fma(_900, _940, _948);
    float _952 = fma(_876, _940, _942);
    float _954 = _648 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _956 = _920 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _958 = _944 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _960 = fma(_872, _950, _916);
    float _962 = _944 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _964 = _954 + _956;
    float _966 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[1].x, _958);
    float _968 = _944 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _970 = _944 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _972 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[0].x, _962);
    float _974 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[1].z, _966);
    float _976 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[2].x, _968);
    float _978 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[3].x, _970);
    float _980 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[0].z, _972);
    float _982 = _974 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _984 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[2].z, _976);
    float _986 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[3].z, _978);
    float _988 = _980 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _990 = _982 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _992 = _982 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _994 = _982 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _996 = fma(_896, _928, _904);
    float _998 = _984 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1000 = _982 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1002 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[4].x, _990);
    float _1004 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[5].x, _992);
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[7].x, _994);
    float _1008 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[117].x, _946);
    float _1010 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1000);
    float _1012 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1002);
    float _1014 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1004);
    float _1016 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1006);
    float _1018 = -_918;
    float _1020 = fma(_912, _952, _1018);
    float _1022 = -_868;
    float _1024 = fma(_910, _830, _1022);
    float _1026 = _986 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1028 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1010);
    float _1030 = _996 + 0.5;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1044 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1046 = _1020 + 0.5;
    float _1048 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1014);
    float _1050 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1012);
    float _1052 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1028);
    float _1054 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1056 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1058 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1060 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1062 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1064 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1066 = _1024 + 0.5;
    float _1068 = _960 + 0.5;
    float _1070 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1016);
    out.m_41.x = _1054;
    out.m_41.y = _1056;
    out.m_41.z = _1058;
    out.m_41.w = _1044;
    out.m_43.x = _1060;
    out.m_43.y = _1062;
    out.m_43.z = _1064;
    out.m_45.x = _1030;
    out.m_45.y = _1066;
    out.m_47.x = _1068;
    out.m_47.y = _1046;
    out.gl_Position.x = _1050;
    out.gl_Position.y = _1048;
    out.gl_Position.z = _1052;
    out.gl_Position.w = _1070;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _538 = false;
    bool _262 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_26.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _74 = _72;
    float _76 = _74;
    if (!_70)
    {
        out.m_29.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _74 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1127 = as_type<float>(_82);
        out.gl_Position.z = _1127;
    }
    if (!_70)
    {
        return out;
    }
    float _86 = in.m_31.w;
    bool _88 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _90 = isnan(_86);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _96 = _92 || _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_96)
    {
        float _102 = float(_66);
        _76 = _102;
    }
    float _104 = _76;
    bool _106 = _100 >= _104;
    bool _108 = !_96;
    bool _110 = _106 || _108;
    float _112 = _104;
    if (_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (_110)
    {
        out.m_29.x = 0.0;
    }
    if (_110)
    {
        float _116 = _114 * 5.0;
        _84 = as_type<int>(_116);
    }
    int _118 = _84;
    if (_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1196 = as_type<float>(_118);
        out.gl_Position.z = _1196;
    }
    if (_110)
    {
        return out;
    }
    float _120 = in.m_33.w;
    float _122 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _124 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _126 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _128 = _124 || _126;
    bool _130 = isnan(1.0);
    bool _132 = _128 || _130;
    float _134 = in.m_31.x;
    float _136 = in.m_31.y;
    float _138 = in.m_31.z;
    float _140 = in.m_26.x;
    float _142 = in.m_26.y;
    float _144 = in.m_26.z;
    float _146 = 0.0;
    float _148 = _122;
    if (!_132)
    {
        float _150 = _122 * _122;
        float _152 = _150 * 0.5;
        _146 = _152;
    }
    float _154 = _146;
    float _156 = _154;
    if (!_132)
    {
        float _158 = _154 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _156 = _158;
    }
    float _160 = _156;
    bool _162 = !_132;
    float _164 = _160;
    if (!_162)
    {
        float _166 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _168 = log2(_166);
        float _170 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _172 = _170 + 1.0;
        float _174 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = _122 * _168;
        float _178 = 1.0 / _172;
        float _180 = _174 * 0.693147182464599609375;
        float _182 = exp2(_176);
        float _184 = 1.0 / _180;
        float _186 = _182 + (-1.0);
        float _188 = -_186;
        float _190 = fma(_188, _184, _122);
        float _192 = _190 * _178;
        float _194 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _194;
    }
    float _196 = _164;
    bool _198 = !_132;
    if (!_198)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = 1.0 / _206;
        float _210 = _122 * _202;
        float _212 = exp2(_210);
        float _214 = -_212;
        float _216 = _214 + 1.0;
        float _218 = _216 * _208;
        _148 = _218;
    }
    float _220 = _148;
    bool _222 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _224 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _226 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _228 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _230 = fma(_220, _134, _224);
    float _232 = fma(_220, _136, _226);
    float _234 = fma(_220, _138, _228);
    float _236 = fma(_230, _120, _140);
    float _238 = fma(_232, _120, _142);
    float _240 = fma(_234, _120, _144);
    bool _242 = !_222;
    float _260;
    if (!_242)
    {
        float _244 = in.m_35.x;
        float _246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _248 = _244 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _250 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _252 = _250 * _246;
        float _254 = floor(_252);
        float _256 = -_254;
        float _258 = _252 + _256;
        _260 = _258;
        _262 = true;
    }
    else
    {
        float _264 = float(_66);
        float _266 = 1.0 / _264;
        float _268 = _100 * _266;
        _260 = _268;
    }
    _262 = false;
    float _270 = _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _270 + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = _270 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = _270 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _290 = _288 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _300 = 1.0 / _286;
    bool _302 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_270);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = 1.0 / _290;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _318 = _270 + _316;
    bool _320 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _322 = 1.0 / _298;
    float _324 = _278 * _300;
    float _326 = 1.0 / _294;
    float _328 = _274 * _314;
    bool _330 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _332 = isnan(_270);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _342;
    float _346 = fma(_344, _324, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _348 = _318 * _322;
    bool _350 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _352 = isnan(_270);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    bool _362 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _364 = isnan(_270);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = -_360;
    float _376 = _374 + 1.0;
    float _378 = _282 * _326;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    float _388 = _372 * _376;
    float _390 = -_372;
    float _392 = _390 + 1.0;
    float _394 = fma(_382, _324, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = fma(_386, _324, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = -_340;
    float _400 = _398 + 1.0;
    float _402 = _340 * _392;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _408 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _410 = isnan(_270);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = _312 * _400;
    float _422 = -_312;
    float _424 = _422 + 1.0;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _434 = fma(_406, _328, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _436 = _418 * _424;
    float _438 = fma(_428, _328, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _440 = fma(_432, _328, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _442 = _346 * _436;
    float _444 = _394 * _436;
    float _446 = -_418;
    float _448 = _446 + 1.0;
    float _450 = _396 * _436;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _442);
    float _462 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _444);
    float _464 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _450);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _466;
    float _470 = fma(_454, _378, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _472 = fma(_438, _420, _460);
    float _474 = fma(_440, _420, _464);
    float _476 = fma(_434, _420, _462);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _486 = fma(_458, _378, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _488 = fma(_468, _378, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _494 = fma(_470, _402, _472);
    float _496 = fma(_480, _348, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _498 = fma(_484, _348, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _500 = fma(_492, _348, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _502 = fma(_486, _402, _476);
    float _504 = fma(_488, _402, _474);
    float _506 = fma(_496, _388, _494);
    float _508 = fma(_498, _388, _502);
    float _510 = fma(_500, _388, _504);
    float _512 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[147].x, _506);
    float _514 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[147].y, _508);
    float _516 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[147].z, _510);
    bool _518 = !_320;
    float _536;
    if (!_518)
    {
        float _520 = in.m_35.x;
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _524 = _520 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _528 = _526 * _522;
        float _530 = floor(_528);
        float _532 = -_530;
        float _534 = _528 + _532;
        _536 = _534;
        _538 = true;
    }
    else
    {
        float _540 = float(_66);
        float _542 = 1.0 / _540;
        float _544 = _100 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = in.m_33.x;
    float _550 = in.m_33.y;
    float _552 = in.m_33.z;
    float _554 = _238 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _556 = _238 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _560 = _558 != 0;
    float _562 = _238 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _566 = _564 != 0;
    float _568 = in.m_35.x;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _572 = _570 != 0;
    float _574 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[6].x, _562);
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _578 = _576 != 0;
    float _580 = in.m_35.y;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _584 = _582 != 0;
    float _586 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[4].x, _554);
    float _588 = in.m_37.x;
    float _590 = in.m_37.y;
    float _592 = in.m_37.z;
    float _594 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[5].x, _556);
    float _596 = in.m_39.y;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _606 = in.m_35.z;
    float _608 = _512 * _548;
    float _610 = _516 * _552;
    float _612 = 1.0 / _600;
    float _614 = _514 * _550;
    float _616 = in.m_39.x;
    bool _618 = false;
    float _620 = _586;
    if (_560)
    {
        bool _622 = _568 > 0.5;
        _618 = _622;
    }
    bool _624 = _618;
    float _626 = _614 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _628 = 1.0 / _604;
    float _630 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].z, _586);
    if (_584)
    {
        _620 = _580;
    }
    float _632 = _620;
    float _634 = _632;
    if (!_584)
    {
        _634 = _568;
    }
    float _636 = _634;
    float _638 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _588);
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _590);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _646 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].z, _594);
    float _648 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].z, _574);
    float _650 = _568 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _652 = _580 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _654 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _592);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _660 = -_640;
    float _662 = fma(_650, 2.0, _660);
    float _664 = fma(_652, -2.0, _644);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _666;
    float _670 = _658 * _612;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _676 = _668 * _628;
    float _678 = -_596;
    float _680 = _678 + 1.0;
    float _682 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[88].z, _672);
    bool _684 = _606 > 0.5;
    float _686 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[78].z, _674);
    float _688 = _672;
    float _690 = _606;
    float _692 = _638;
    float _694 = _596;
    int _696 = as_type<int>(_636);
    if (_584)
    {
        _688 = _568;
    }
    float _698 = _688;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _704 = _684 ? as_type<int>(_680) : as_type<int>(_596);
    float _706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _708 = _698;
    if (!_584)
    {
        _708 = _606;
    }
    float _710 = _708;
    float _712 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[78].w, _700);
    bool _714 = _580 > 0.5;
    float _716 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[88].w, _702);
    if (!_584)
    {
        _690 = _580;
    }
    float _718 = _690;
    float _720 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _724 = _546 + _722;
    float _726 = _626 * _642;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _728 = _720 * _654;
    float _730 = fma(_676, _724, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _734 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _736 = isnan(_546);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _748 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _750 = isnan(_546);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = _706 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _764 = _546 + _762;
    bool _766 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _768 = isnan(_546);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = _746 * _638;
    float _780 = fma(_670, _764, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _782 = -_744;
    float _784 = _782 + 1.0;
    float _786 = _720;
    if (!_560)
    {
        _692 = _616;
    }
    float _788 = _692;
    float _790 = _710 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _792 = _572 ? as_type<float>(_704) : _596;
    float _794 = _776 * _784;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _798 = -_776;
    float _800 = _798 + 1.0;
    float _802 = _788;
    if (!_560)
    {
        _786 = _788;
    }
    float _804 = _786;
    float _806 = fma(_792, _760, -0.5);
    float _808 = _804;
    if (_560)
    {
        _802 = _616;
    }
    float _810 = _802;
    float _812 = _758 * _800;
    float _814 = _810;
    if (_578)
    {
        float _816 = _714 ? _680 : _596;
        _694 = _816;
    }
    float _818 = _694;
    float _820 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[89].z, _796);
    float _822 = _732 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _824 = _730 * _812;
    float _826 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[89].x, _820);
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _830 = fma(_822, _818, -0.5);
    float _832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _834 = as_type<int>(_818);
    if (_560)
    {
        float _836 = -_810;
        float _838 = _836 + 1.0;
        _834 = as_type<int>(_838);
    }
    int _840 = _834;
    float _842 = -_828;
    float _844 = fma(_790, 2.0, _842);
    float _846 = _726 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _848 = _726 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _850 = _726 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _854 = _826 * (-0.15915493667125701904296875);
    float _856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_560)
    {
        float _858 = _624 ? as_type<float>(_840) : _810;
        _808 = _858;
    }
    float _860 = _808;
    float _862 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[24].x, _846);
    float _864 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[25].x, _848);
    float _866 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[26].x, _850);
    float _868 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _664);
    float _870 = _636 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _872 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].z, _682);
    float _874 = _854 * 6.283185482025146484375;
    float _876 = sin(_874);
    if (_566)
    {
        float _878 = -_810;
        float _880 = _878 + 1.0;
        _696 = as_type<int>(_880);
    }
    int _882 = _696;
    float _884 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[24].z, _862);
    float _886 = fma(_870, -2.0, _852);
    float _888 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[25].z, _864);
    float _890 = _630 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (_566)
    {
        float _892 = _714 ? as_type<float>(_882) : _810;
        _814 = _892;
    }
    float _894 = _814;
    float _896 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _686);
    float _898 = _854 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = -_100;
    float _904 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[76].x, _662);
    float _906 = _832 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _908 = _884 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _910 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _712);
    float _912 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].w, _716);
    float _914 = -_100;
    float _916 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[86].x, _844);
    float _918 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[86].y, _886);
    float _920 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[26].z, _866);
    float _922 = -_758;
    float _924 = _922 + 1.0;
    float _926 = _856 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _928 = fma(_906, _860, -0.5);
    float _930 = _646 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _932 = _888 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _934 = _890 + _908;
    float _936 = _876 * _806;
    float _938 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[115].x, _824);
    float _940 = fma(_926, _894, -0.5);
    float _942 = _900 * _806;
    float _944 = _930 + _932;
    float _946 = fma(_780, _794, _938);
    float _948 = -_936;
    float _950 = fma(_900, _940, _948);
    float _952 = fma(_876, _940, _942);
    float _954 = _648 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _956 = _920 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _958 = _944 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _960 = fma(_872, _950, _916);
    float _962 = _944 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _964 = _954 + _956;
    float _966 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[1].x, _958);
    float _968 = _944 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _970 = _944 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _972 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[0].x, _962);
    float _974 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[1].z, _966);
    float _976 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[2].x, _968);
    float _978 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[3].x, _970);
    float _980 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[0].z, _972);
    float _982 = _974 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _984 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[2].z, _976);
    float _986 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[3].z, _978);
    float _988 = _980 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _990 = _982 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _992 = _982 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _994 = _982 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _996 = fma(_896, _928, _904);
    float _998 = _984 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1000 = _982 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1002 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[4].x, _990);
    float _1004 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[5].x, _992);
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[7].x, _994);
    float _1008 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[117].x, _946);
    float _1010 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1000);
    float _1012 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1002);
    float _1014 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1004);
    float _1016 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1006);
    float _1018 = -_918;
    float _1020 = fma(_912, _952, _1018);
    float _1022 = -_868;
    float _1024 = fma(_910, _830, _1022);
    float _1026 = _986 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1028 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1010);
    float _1030 = _996 + 0.5;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1044 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1046 = _1020 + 0.5;
    float _1048 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1014);
    float _1050 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1012);
    float _1052 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1028);
    float _1054 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1056 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1058 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1060 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1062 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1064 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1066 = _1024 + 0.5;
    float _1068 = _960 + 0.5;
    float _1070 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1016);
    out.m_41.x = _1054;
    out.m_41.y = _1056;
    out.m_41.z = _1058;
    out.m_41.w = _1044;
    out.m_43.x = _1060;
    out.m_43.y = _1062;
    out.m_43.z = _1064;
    out.m_45.x = _1030;
    out.m_45.y = _1066;
    out.m_47.x = _1068;
    out.m_47.y = _1046;
    out.gl_Position.x = _1050;
    out.gl_Position.y = _1048;
    out.gl_Position.z = _1052;
    out.gl_Position.w = _1070;
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
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _538 = false;
    bool _262 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_26.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _74 = _72;
    float _76 = _74;
    if (!_70)
    {
        out.m_29.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _74 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1127 = as_type<float>(_82);
        out.gl_Position.z = _1127;
    }
    if (!_70)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _86 = in.m_31.w;
    bool _88 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _90 = isnan(_86);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _96 = _92 || _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_96)
    {
        float _102 = float(_66);
        _76 = _102;
    }
    float _104 = _76;
    bool _106 = _100 >= _104;
    bool _108 = !_96;
    bool _110 = _106 || _108;
    float _112 = _104;
    if (_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (_110)
    {
        out.m_29.x = 0.0;
    }
    if (_110)
    {
        float _116 = _114 * 5.0;
        _84 = as_type<int>(_116);
    }
    int _118 = _84;
    if (_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1196 = as_type<float>(_118);
        out.gl_Position.z = _1196;
    }
    if (_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_33.w;
    float _122 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _124 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _126 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _128 = _124 || _126;
    bool _130 = isnan(1.0);
    bool _132 = _128 || _130;
    float _134 = in.m_31.x;
    float _136 = in.m_31.y;
    float _138 = in.m_31.z;
    float _140 = in.m_26.x;
    float _142 = in.m_26.y;
    float _144 = in.m_26.z;
    float _146 = 0.0;
    float _148 = _122;
    if (!_132)
    {
        float _150 = _122 * _122;
        float _152 = _150 * 0.5;
        _146 = _152;
    }
    float _154 = _146;
    float _156 = _154;
    if (!_132)
    {
        float _158 = _154 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _156 = _158;
    }
    float _160 = _156;
    bool _162 = !_132;
    float _164 = _160;
    if (!_162)
    {
        float _166 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _168 = log2(_166);
        float _170 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _172 = _170 + 1.0;
        float _174 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = _122 * _168;
        float _178 = 1.0 / _172;
        float _180 = _174 * 0.693147182464599609375;
        float _182 = exp2(_176);
        float _184 = 1.0 / _180;
        float _186 = _182 + (-1.0);
        float _188 = -_186;
        float _190 = fma(_188, _184, _122);
        float _192 = _190 * _178;
        float _194 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _194;
    }
    float _196 = _164;
    bool _198 = !_132;
    if (!_198)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = 1.0 / _206;
        float _210 = _122 * _202;
        float _212 = exp2(_210);
        float _214 = -_212;
        float _216 = _214 + 1.0;
        float _218 = _216 * _208;
        _148 = _218;
    }
    float _220 = _148;
    bool _222 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _224 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _226 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _228 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _230 = fma(_220, _134, _224);
    float _232 = fma(_220, _136, _226);
    float _234 = fma(_220, _138, _228);
    float _236 = fma(_230, _120, _140);
    float _238 = fma(_232, _120, _142);
    float _240 = fma(_234, _120, _144);
    bool _242 = !_222;
    float _260;
    if (!_242)
    {
        float _244 = in.m_35.x;
        float _246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _248 = _244 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _250 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _252 = _250 * _246;
        float _254 = floor(_252);
        float _256 = -_254;
        float _258 = _252 + _256;
        _260 = _258;
        _262 = true;
    }
    else
    {
        float _264 = float(_66);
        float _266 = 1.0 / _264;
        float _268 = _100 * _266;
        _260 = _268;
    }
    _262 = false;
    float _270 = _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _270 + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = _270 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = _270 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _290 = _288 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _300 = 1.0 / _286;
    bool _302 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_270);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = 1.0 / _290;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _318 = _270 + _316;
    bool _320 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _322 = 1.0 / _298;
    float _324 = _278 * _300;
    float _326 = 1.0 / _294;
    float _328 = _274 * _314;
    bool _330 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _332 = isnan(_270);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _342;
    float _346 = fma(_344, _324, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _348 = _318 * _322;
    bool _350 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _352 = isnan(_270);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    bool _362 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _364 = isnan(_270);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = -_360;
    float _376 = _374 + 1.0;
    float _378 = _282 * _326;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    float _388 = _372 * _376;
    float _390 = -_372;
    float _392 = _390 + 1.0;
    float _394 = fma(_382, _324, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = fma(_386, _324, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = -_340;
    float _400 = _398 + 1.0;
    float _402 = _340 * _392;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _408 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _410 = isnan(_270);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = _312 * _400;
    float _422 = -_312;
    float _424 = _422 + 1.0;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _434 = fma(_406, _328, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _436 = _418 * _424;
    float _438 = fma(_428, _328, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _440 = fma(_432, _328, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _442 = _346 * _436;
    float _444 = _394 * _436;
    float _446 = -_418;
    float _448 = _446 + 1.0;
    float _450 = _396 * _436;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _442);
    float _462 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _444);
    float _464 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _450);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _466;
    float _470 = fma(_454, _378, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _472 = fma(_438, _420, _460);
    float _474 = fma(_440, _420, _464);
    float _476 = fma(_434, _420, _462);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _486 = fma(_458, _378, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _488 = fma(_468, _378, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _494 = fma(_470, _402, _472);
    float _496 = fma(_480, _348, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _498 = fma(_484, _348, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _500 = fma(_492, _348, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _502 = fma(_486, _402, _476);
    float _504 = fma(_488, _402, _474);
    float _506 = fma(_496, _388, _494);
    float _508 = fma(_498, _388, _502);
    float _510 = fma(_500, _388, _504);
    float _512 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[147].x, _506);
    float _514 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[147].y, _508);
    float _516 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[147].z, _510);
    bool _518 = !_320;
    float _536;
    if (!_518)
    {
        float _520 = in.m_35.x;
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _524 = _520 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _528 = _526 * _522;
        float _530 = floor(_528);
        float _532 = -_530;
        float _534 = _528 + _532;
        _536 = _534;
        _538 = true;
    }
    else
    {
        float _540 = float(_66);
        float _542 = 1.0 / _540;
        float _544 = _100 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = in.m_33.x;
    float _550 = in.m_33.y;
    float _552 = in.m_33.z;
    float _554 = _238 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _556 = _238 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _560 = _558 != 0;
    float _562 = _238 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _566 = _564 != 0;
    float _568 = in.m_35.x;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _572 = _570 != 0;
    float _574 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[6].x, _562);
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _578 = _576 != 0;
    float _580 = in.m_35.y;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _584 = _582 != 0;
    float _586 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[4].x, _554);
    float _588 = in.m_37.x;
    float _590 = in.m_37.y;
    float _592 = in.m_37.z;
    float _594 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[5].x, _556);
    float _596 = in.m_39.y;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _606 = in.m_35.z;
    float _608 = _512 * _548;
    float _610 = _516 * _552;
    float _612 = 1.0 / _600;
    float _614 = _514 * _550;
    float _616 = in.m_39.x;
    bool _618 = false;
    float _620 = _586;
    if (_560)
    {
        bool _622 = _568 > 0.5;
        _618 = _622;
    }
    bool _624 = _618;
    float _626 = _614 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _628 = 1.0 / _604;
    float _630 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].z, _586);
    if (_584)
    {
        _620 = _580;
    }
    float _632 = _620;
    float _634 = _632;
    if (!_584)
    {
        _634 = _568;
    }
    float _636 = _634;
    float _638 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _588);
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _590);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _646 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].z, _594);
    float _648 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].z, _574);
    float _650 = _568 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _652 = _580 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _654 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _592);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _660 = -_640;
    float _662 = fma(_650, 2.0, _660);
    float _664 = fma(_652, -2.0, _644);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _666;
    float _670 = _658 * _612;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _676 = _668 * _628;
    float _678 = -_596;
    float _680 = _678 + 1.0;
    float _682 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[88].z, _672);
    bool _684 = _606 > 0.5;
    float _686 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[78].z, _674);
    float _688 = _672;
    float _690 = _606;
    float _692 = _638;
    float _694 = _596;
    int _696 = as_type<int>(_636);
    if (_584)
    {
        _688 = _568;
    }
    float _698 = _688;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _704 = _684 ? as_type<int>(_680) : as_type<int>(_596);
    float _706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _708 = _698;
    if (!_584)
    {
        _708 = _606;
    }
    float _710 = _708;
    float _712 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[78].w, _700);
    bool _714 = _580 > 0.5;
    float _716 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[88].w, _702);
    if (!_584)
    {
        _690 = _580;
    }
    float _718 = _690;
    float _720 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _724 = _546 + _722;
    float _726 = _626 * _642;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _728 = _720 * _654;
    float _730 = fma(_676, _724, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _734 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _736 = isnan(_546);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _748 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _750 = isnan(_546);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = _706 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _764 = _546 + _762;
    bool _766 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _768 = isnan(_546);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = _746 * _638;
    float _780 = fma(_670, _764, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _782 = -_744;
    float _784 = _782 + 1.0;
    float _786 = _720;
    if (!_560)
    {
        _692 = _616;
    }
    float _788 = _692;
    float _790 = _710 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _792 = _572 ? as_type<float>(_704) : _596;
    float _794 = _776 * _784;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _798 = -_776;
    float _800 = _798 + 1.0;
    float _802 = _788;
    if (!_560)
    {
        _786 = _788;
    }
    float _804 = _786;
    float _806 = fma(_792, _760, -0.5);
    float _808 = _804;
    if (_560)
    {
        _802 = _616;
    }
    float _810 = _802;
    float _812 = _758 * _800;
    float _814 = _810;
    if (_578)
    {
        float _816 = _714 ? _680 : _596;
        _694 = _816;
    }
    float _818 = _694;
    float _820 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[89].z, _796);
    float _822 = _732 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _824 = _730 * _812;
    float _826 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[89].x, _820);
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _830 = fma(_822, _818, -0.5);
    float _832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _834 = as_type<int>(_818);
    if (_560)
    {
        float _836 = -_810;
        float _838 = _836 + 1.0;
        _834 = as_type<int>(_838);
    }
    int _840 = _834;
    float _842 = -_828;
    float _844 = fma(_790, 2.0, _842);
    float _846 = _726 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _848 = _726 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _850 = _726 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _854 = _826 * (-0.15915493667125701904296875);
    float _856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_560)
    {
        float _858 = _624 ? as_type<float>(_840) : _810;
        _808 = _858;
    }
    float _860 = _808;
    float _862 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[24].x, _846);
    float _864 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[25].x, _848);
    float _866 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[26].x, _850);
    float _868 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _664);
    float _870 = _636 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _872 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].z, _682);
    float _874 = _854 * 6.283185482025146484375;
    float _876 = sin(_874);
    if (_566)
    {
        float _878 = -_810;
        float _880 = _878 + 1.0;
        _696 = as_type<int>(_880);
    }
    int _882 = _696;
    float _884 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[24].z, _862);
    float _886 = fma(_870, -2.0, _852);
    float _888 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[25].z, _864);
    float _890 = _630 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (_566)
    {
        float _892 = _714 ? as_type<float>(_882) : _810;
        _814 = _892;
    }
    float _894 = _814;
    float _896 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _686);
    float _898 = _854 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = -_100;
    float _904 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[76].x, _662);
    float _906 = _832 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _908 = _884 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _910 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _712);
    float _912 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].w, _716);
    float _914 = -_100;
    float _916 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[86].x, _844);
    float _918 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[86].y, _886);
    float _920 = fma(_728, (*spvDescriptorSet0.vp_c8)._m0[26].z, _866);
    float _922 = -_758;
    float _924 = _922 + 1.0;
    float _926 = _856 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _928 = fma(_906, _860, -0.5);
    float _930 = _646 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _932 = _888 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _934 = _890 + _908;
    float _936 = _876 * _806;
    float _938 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[115].x, _824);
    float _940 = fma(_926, _894, -0.5);
    float _942 = _900 * _806;
    float _944 = _930 + _932;
    float _946 = fma(_780, _794, _938);
    float _948 = -_936;
    float _950 = fma(_900, _940, _948);
    float _952 = fma(_876, _940, _942);
    float _954 = _648 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _956 = _920 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _958 = _944 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _960 = fma(_872, _950, _916);
    float _962 = _944 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _964 = _954 + _956;
    float _966 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[1].x, _958);
    float _968 = _944 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _970 = _944 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _972 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[0].x, _962);
    float _974 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[1].z, _966);
    float _976 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[2].x, _968);
    float _978 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[3].x, _970);
    float _980 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[0].z, _972);
    float _982 = _974 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _984 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[2].z, _976);
    float _986 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[3].z, _978);
    float _988 = _980 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _990 = _982 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _992 = _982 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _994 = _982 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _996 = fma(_896, _928, _904);
    float _998 = _984 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1000 = _982 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1002 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[4].x, _990);
    float _1004 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[5].x, _992);
    float _1006 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[7].x, _994);
    float _1008 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[117].x, _946);
    float _1010 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1000);
    float _1012 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1002);
    float _1014 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1004);
    float _1016 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1006);
    float _1018 = -_918;
    float _1020 = fma(_912, _952, _1018);
    float _1022 = -_868;
    float _1024 = fma(_910, _830, _1022);
    float _1026 = _986 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1028 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1010);
    float _1030 = _996 + 0.5;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1044 = _1008 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1046 = _1020 + 0.5;
    float _1048 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1014);
    float _1050 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1012);
    float _1052 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1028);
    float _1054 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1056 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1058 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1060 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1062 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1064 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1066 = _1024 + 0.5;
    float _1068 = _960 + 0.5;
    float _1070 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1016);
    out.m_41.x = _1054;
    out.m_41.y = _1056;
    out.m_41.z = _1058;
    out.m_41.w = _1044;
    out.m_43.x = _1060;
    out.m_43.y = _1062;
    out.m_43.z = _1064;
    out.m_45.x = _1030;
    out.m_45.y = _1066;
    out.m_47.x = _1068;
    out.m_47.y = _1046;
    out.gl_Position.x = _1050;
    out.gl_Position.y = _1048;
    out.gl_Position.z = _1052;
    out.gl_Position.w = _1070;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

