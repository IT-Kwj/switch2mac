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
    float4 m_41 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_70)
    {
        out.m_29.x = 0.0;
    }
    int _76 = 0;
    if (!_70)
    {
        float _78 = _74 * 5.0;
        _76 = as_type<int>(_78);
    }
    int _80 = _76;
    int _82 = _80;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1160 = as_type<float>(_80);
        out.gl_Position.z = _1160;
    }
    if (!_70)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _84 = in.m_31.w;
    bool _86 = _84 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _88 = isnan(_84);
    bool _90 = _86 || _88;
    bool _92 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _94 = _90 || _92;
    float _96 = -_84;
    float _98 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _100 = 0.0;
    if (_94)
    {
        float _102 = float(_66);
        _100 = _102;
    }
    float _104 = _100;
    bool _106 = _98 >= _104;
    bool _108 = !_94;
    bool _110 = _106 || _108;
    float _112 = 0.0;
    if (_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (_110)
    {
        out.m_29.x = 0.0;
    }
    if (_110)
    {
        float _118 = _114 * 5.0;
        _82 = as_type<int>(_118);
    }
    int _120 = _82;
    if (_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1229 = as_type<float>(_120);
        out.gl_Position.z = _1229;
    }
    if (_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_33.w;
    float _124 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _126 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _128 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    float _136 = in.m_31.x;
    float _138 = in.m_31.y;
    float _140 = in.m_31.z;
    float _142 = in.m_26.x;
    float _144 = in.m_26.y;
    float _146 = in.m_26.z;
    float _148 = _124;
    if (!_134)
    {
        float _150 = _124 * _124;
        float _152 = _150 * 0.5;
        _116 = _152;
    }
    float _154 = _116;
    float _156 = _154;
    if (!_134)
    {
        float _158 = _154 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _156 = _158;
    }
    float _160 = _156;
    bool _162 = !_134;
    float _164 = _160;
    if (!_162)
    {
        float _166 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _168 = log2(_166);
        float _170 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _172 = _170 + 1.0;
        float _174 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = _124 * _168;
        float _178 = 1.0 / _172;
        float _180 = _174 * 0.693147182464599609375;
        float _182 = exp2(_176);
        float _184 = 1.0 / _180;
        float _186 = _182 + (-1.0);
        float _188 = -_186;
        float _190 = fma(_188, _184, _124);
        float _192 = _190 * _178;
        float _194 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _194;
    }
    float _196 = _164;
    bool _198 = !_134;
    if (!_198)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = 1.0 / _206;
        float _210 = _124 * _202;
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
    float _230 = fma(_220, _136, _224);
    float _232 = fma(_220, _138, _226);
    float _234 = fma(_220, _140, _228);
    float _236 = fma(_230, _122, _142);
    float _238 = fma(_232, _122, _144);
    float _240 = fma(_234, _122, _146);
    bool _242 = !_222;
    float _260;
    if (!_242)
    {
        float _244 = in.m_35.x;
        float _246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _248 = _244 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _250 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[12].x, _98);
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
        float _268 = _98 * _266;
        _260 = _268;
    }
    _262 = false;
    float _270 = _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = _270 + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _278 = _270 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = _270 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _290 = _288 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = 1.0 / _290;
    bool _302 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_270);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = 1.0 / _294;
    bool _316 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _318 = isnan(_270);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _330 = 1.0 / _298;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _334 = _270 + _332;
    float _336 = 1.0 / _286;
    float _338 = _334 * _300;
    bool _340 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _342 = isnan(_270);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = _274 * _314;
    bool _354 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _356 = isnan(_270);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_350;
    float _368 = _366 + 1.0;
    float _370 = _278 * _330;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _372;
    float _376 = -_326;
    float _378 = _376 + 1.0;
    float _380 = _364 * _368;
    float _382 = -_364;
    float _384 = _382 + 1.0;
    float _386 = fma(_374, _352, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _388 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _390 = isnan(_270);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = _282 * _336;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _410;
    float _414 = fma(_402, _370, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = fma(_408, _352, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _418 = fma(_412, _352, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _420 = _326 * _384;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _426 = _312 * _378;
    float _428 = -_312;
    float _430 = _428 + 1.0;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = fma(_424, _370, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _438 = _398 * _430;
    float _440 = fma(_434, _370, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _442 = -_398;
    float _444 = _442 + 1.0;
    float _446 = _386 * _438;
    float _448 = _416 * _438;
    float _450 = _418 * _438;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _452;
    float _456 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[143].x, _446);
    float _458 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[143].y, _448);
    float _460 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[143].z, _450);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _466;
    float _470 = fma(_414, _426, _456);
    float _472 = fma(_436, _426, _458);
    float _474 = fma(_440, _426, _460);
    float _476 = fma(_464, _404, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _478 = fma(_454, _404, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _480 = fma(_468, _404, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _494 = fma(_476, _420, _470);
    float _496 = fma(_484, _338, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _498 = fma(_488, _338, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _500 = fma(_492, _338, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _502 = fma(_478, _420, _472);
    float _504 = fma(_480, _420, _474);
    float _506 = fma(_496, _380, _494);
    float _508 = fma(_498, _380, _502);
    float _510 = fma(_500, _380, _504);
    float _512 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[147].x, _506);
    float _514 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[147].y, _508);
    float _516 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[147].z, _510);
    bool _518 = !_328;
    float _536;
    if (!_518)
    {
        float _520 = in.m_35.x;
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _524 = _520 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[11].y, _98);
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
        float _544 = _98 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = in.m_33.x;
    float _550 = in.m_33.y;
    float _552 = in.m_33.z;
    float _554 = _238 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _556 = in.m_37.x;
    float _558 = in.m_37.y;
    float _560 = in.m_37.z;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _564 = _562 != 0;
    float _566 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[5].x, _554);
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _570 = _568 != 0;
    float _572 = in.m_35.x;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _576 = _574 != 0;
    float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _582 = _580 != 0;
    float _584 = _238 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _588 = _586 != 0;
    float _590 = _238 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _592 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[4].x, _584);
    float _594 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[6].x, _590);
    float _596 = in.m_35.z;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _604 = in.m_39.y;
    float _606 = _516 * _552;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _612 = in.m_35.y;
    float _614 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _556);
    float _616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _558);
    float _618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _560);
    float _620 = 1.0 / _600;
    float _622 = in.m_39.x;
    float _624 = _514 * _550;
    float _626 = _512 * _548;
    float _628 = _572 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _630 = 1.0 / _610;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _648 = 1.0 / _634;
    float _650 = _642 * _620;
    float _652 = -_636;
    float _654 = fma(_628, 2.0, _652);
    float _656 = _612 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _658;
    float _662 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _664 = fma(_656, -2.0, _638);
    float _666 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].z, _592);
    float _668 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].z, _566);
    float _670 = _646 * _630;
    float _672 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].z, _594);
    float _674 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _676 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _682 = -_604;
    float _684 = _682 + 1.0;
    float _686 = _674 * _614;
    float _688 = _662 * _616;
    bool _690 = _596 > 0.5;
    float _692 = _676 * _618;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _696 = _546 + _694;
    float _698 = _660 * _648;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _706 = _546 + _704;
    float _708 = _660;
    float _710 = _572;
    float _712 = _596;
    float _714 = _676;
    float _716 = _606;
    float _718 = _604;
    if (_588)
    {
        _708 = _612;
    }
    float _720 = _708;
    float _722 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[78].z, _678);
    bool _724 = false;
    float _726 = _720;
    if (_564)
    {
        bool _728 = _572 > 0.5;
        _724 = _728;
    }
    bool _730 = _724;
    float _732 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[88].z, _680);
    if (!_588)
    {
        _726 = _572;
    }
    float _734 = _726;
    float _736 = fma(_650, _696, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _738 = _690 ? as_type<int>(_684) : as_type<int>(_604);
    float _740 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[78].w, _700);
    if (!_588)
    {
        _710 = _596;
    }
    float _742 = _710;
    float _744 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[88].w, _702);
    bool _746 = _612 > 0.5;
    float _748 = fma(_670, _706, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    if (!_588)
    {
        _712 = _612;
    }
    float _750 = _712;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _754 = _546 + _752;
    if (!_564)
    {
        _714 = _622;
    }
    float _756 = _714;
    float _758 = _578 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _760 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _762 = isnan(_546);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = fma(_698, _754, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _774 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[77].w, _740);
    bool _776 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _778 = isnan(_546);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = -_770;
    float _790 = _788 + 1.0;
    float _792 = _756;
    if (!_564)
    {
        _716 = _756;
    }
    float _794 = _716;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    bool _798 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _800 = isnan(_546);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _806 = _802 || _804;
    float _808 = float(_806);
    float _810 = _666 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _812 = _794;
    if (_564)
    {
        _792 = _622;
    }
    float _814 = _792;
    float _816 = -_786;
    float _818 = _816 + 1.0;
    float _820 = _576 ? as_type<float>(_738) : _604;
    float _822 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[89].z, _796);
    bool _824 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _826 = isnan(_546);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = _808 * _790;
    float _838 = _814;
    if (_582)
    {
        float _840 = _746 ? _684 : _604;
        _718 = _840;
    }
    float _842 = _718;
    float _844 = -_808;
    float _846 = _844 + 1.0;
    float _848 = _834 * _818;
    float _850 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[89].x, _822);
    float _852 = _786 * _846;
    float _854 = _602 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _858 = _742 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _860 = _736 * _848;
    float _862 = _734 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _864 = _688 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _866 = -_856;
    float _868 = fma(_858, 2.0, _866);
    float _870 = _688 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _872 = fma(_820, _758, -0.5);
    float _874 = fma(_854, _842, -0.5);
    int _876 = as_type<int>(_842);
    int _878 = as_type<int>(_864);
    if (_564)
    {
        float _880 = -_814;
        float _882 = _880 + 1.0;
        _876 = as_type<int>(_882);
    }
    int _884 = _876;
    float _886 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[24].x, _864);
    if (_570)
    {
        float _888 = -_814;
        float _890 = _888 + 1.0;
        _878 = as_type<int>(_890);
    }
    int _892 = _878;
    float _894 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[25].x, _870);
    float _896 = _850 * (-0.15915493667125701904296875);
    float _898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_564)
    {
        float _900 = _730 ? as_type<float>(_884) : _814;
        _812 = _900;
    }
    float _902 = _812;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_570)
    {
        float _906 = _746 ? as_type<float>(_892) : _814;
        _838 = _906;
    }
    float _908 = _838;
    float _910 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[77].z, _722);
    float _912 = _688 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _914 = fma(_862, -2.0, _904);
    float _916 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[87].z, _732);
    float _918 = _896 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[24].z, _886);
    float _924 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[26].x, _912);
    float _926 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[76].y, _664);
    float _928 = -_98;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[76].x, _654);
    float _932 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[87].w, _744);
    float _934 = -_98;
    float _936 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[86].x, _868);
    float _938 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[86].y, _914);
    float _940 = _896 * 6.283185482025146484375;
    float _942 = cos(_940);
    float _944 = _922 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _946 = _898 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _948 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[25].z, _894);
    float _950 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[26].z, _924);
    float _952 = _810 + _944;
    float _954 = fma(_946, _908, -0.5);
    float _956 = _668 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _960 = _920 * _872;
    float _962 = _948 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _964 = -_834;
    float _966 = _964 + 1.0;
    float _968 = _672 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _970 = _950 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _972 = _956 + _962;
    float _974 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[115].x, _860);
    float _976 = -_960;
    float _978 = fma(_942, _954, _976);
    float _980 = _942 * _872;
    float _982 = _968 + _970;
    float _984 = _972 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _986 = fma(_916, _978, _936);
    float _988 = _972 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _990 = fma(_920, _954, _980);
    float _992 = _972 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _994 = _958 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _996 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[1].x, _988);
    float _998 = fma(_748, _852, _974);
    float _1000 = _972 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1002 = fma(_994, _902, -0.5);
    float _1004 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[0].x, _992);
    float _1006 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[1].z, _996);
    float _1008 = fma(_772, _836, _998);
    float _1010 = fma(_910, _1002, _930);
    float _1012 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[2].x, _984);
    float _1014 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1000);
    float _1016 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1004);
    float _1018 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1020 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1008);
    float _1022 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1012);
    float _1024 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1014);
    float _1026 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1028 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1030 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1032 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1034 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1036 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1038 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1028);
    float _1040 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1030);
    float _1042 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1032);
    float _1044 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1034);
    float _1046 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1038);
    float _1048 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1040);
    float _1050 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1042);
    float _1052 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1044);
    float _1054 = -_926;
    float _1056 = fma(_774, _874, _1054);
    float _1058 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1060 = -_938;
    float _1062 = fma(_932, _990, _1060);
    float _1064 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1074 = _1056 + 0.5;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1078 = _1010 + 0.5;
    float _1080 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1046);
    float _1082 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1048);
    float _1084 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1050);
    float _1086 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1088 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1090 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1092 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1094 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1096 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1098 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1100 = _986 + 0.5;
    float _1102 = _1062 + 0.5;
    float _1104 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1052);
    out.m_41.x = _1092;
    out.m_41.y = _1094;
    out.m_41.z = _1096;
    out.m_43.x = _1078;
    out.m_43.y = _1074;
    out.m_45.x = _1086;
    out.m_45.y = _1088;
    out.m_45.z = _1090;
    out.m_45.w = _1098;
    out.m_47.x = _1100;
    out.m_47.y = _1102;
    out.gl_Position.x = _1080;
    out.gl_Position.y = _1082;
    out.gl_Position.z = _1084;
    out.gl_Position.w = _1104;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_70)
    {
        out.m_29.x = 0.0;
    }
    int _76 = 0;
    if (!_70)
    {
        float _78 = _74 * 5.0;
        _76 = as_type<int>(_78);
    }
    int _80 = _76;
    int _82 = _80;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1160 = as_type<float>(_80);
        out.gl_Position.z = _1160;
    }
    if (!_70)
    {
        return out;
    }
    float _84 = in.m_31.w;
    bool _86 = _84 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _88 = isnan(_84);
    bool _90 = _86 || _88;
    bool _92 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _94 = _90 || _92;
    float _96 = -_84;
    float _98 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _100 = 0.0;
    if (_94)
    {
        float _102 = float(_66);
        _100 = _102;
    }
    float _104 = _100;
    bool _106 = _98 >= _104;
    bool _108 = !_94;
    bool _110 = _106 || _108;
    float _112 = 0.0;
    if (_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (_110)
    {
        out.m_29.x = 0.0;
    }
    if (_110)
    {
        float _118 = _114 * 5.0;
        _82 = as_type<int>(_118);
    }
    int _120 = _82;
    if (_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1229 = as_type<float>(_120);
        out.gl_Position.z = _1229;
    }
    if (_110)
    {
        return out;
    }
    float _122 = in.m_33.w;
    float _124 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _126 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _128 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    float _136 = in.m_31.x;
    float _138 = in.m_31.y;
    float _140 = in.m_31.z;
    float _142 = in.m_26.x;
    float _144 = in.m_26.y;
    float _146 = in.m_26.z;
    float _148 = _124;
    if (!_134)
    {
        float _150 = _124 * _124;
        float _152 = _150 * 0.5;
        _116 = _152;
    }
    float _154 = _116;
    float _156 = _154;
    if (!_134)
    {
        float _158 = _154 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _156 = _158;
    }
    float _160 = _156;
    bool _162 = !_134;
    float _164 = _160;
    if (!_162)
    {
        float _166 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _168 = log2(_166);
        float _170 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _172 = _170 + 1.0;
        float _174 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = _124 * _168;
        float _178 = 1.0 / _172;
        float _180 = _174 * 0.693147182464599609375;
        float _182 = exp2(_176);
        float _184 = 1.0 / _180;
        float _186 = _182 + (-1.0);
        float _188 = -_186;
        float _190 = fma(_188, _184, _124);
        float _192 = _190 * _178;
        float _194 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _194;
    }
    float _196 = _164;
    bool _198 = !_134;
    if (!_198)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = 1.0 / _206;
        float _210 = _124 * _202;
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
    float _230 = fma(_220, _136, _224);
    float _232 = fma(_220, _138, _226);
    float _234 = fma(_220, _140, _228);
    float _236 = fma(_230, _122, _142);
    float _238 = fma(_232, _122, _144);
    float _240 = fma(_234, _122, _146);
    bool _242 = !_222;
    float _260;
    if (!_242)
    {
        float _244 = in.m_35.x;
        float _246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _248 = _244 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _250 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[12].x, _98);
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
        float _268 = _98 * _266;
        _260 = _268;
    }
    _262 = false;
    float _270 = _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = _270 + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _278 = _270 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = _270 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _290 = _288 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = 1.0 / _290;
    bool _302 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_270);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = 1.0 / _294;
    bool _316 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _318 = isnan(_270);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _330 = 1.0 / _298;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _334 = _270 + _332;
    float _336 = 1.0 / _286;
    float _338 = _334 * _300;
    bool _340 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _342 = isnan(_270);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = _274 * _314;
    bool _354 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _356 = isnan(_270);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_350;
    float _368 = _366 + 1.0;
    float _370 = _278 * _330;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _372;
    float _376 = -_326;
    float _378 = _376 + 1.0;
    float _380 = _364 * _368;
    float _382 = -_364;
    float _384 = _382 + 1.0;
    float _386 = fma(_374, _352, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _388 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _390 = isnan(_270);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = _282 * _336;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _410;
    float _414 = fma(_402, _370, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = fma(_408, _352, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _418 = fma(_412, _352, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _420 = _326 * _384;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _426 = _312 * _378;
    float _428 = -_312;
    float _430 = _428 + 1.0;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = fma(_424, _370, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _438 = _398 * _430;
    float _440 = fma(_434, _370, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _442 = -_398;
    float _444 = _442 + 1.0;
    float _446 = _386 * _438;
    float _448 = _416 * _438;
    float _450 = _418 * _438;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _452;
    float _456 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[143].x, _446);
    float _458 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[143].y, _448);
    float _460 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[143].z, _450);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _466;
    float _470 = fma(_414, _426, _456);
    float _472 = fma(_436, _426, _458);
    float _474 = fma(_440, _426, _460);
    float _476 = fma(_464, _404, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _478 = fma(_454, _404, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _480 = fma(_468, _404, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _494 = fma(_476, _420, _470);
    float _496 = fma(_484, _338, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _498 = fma(_488, _338, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _500 = fma(_492, _338, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _502 = fma(_478, _420, _472);
    float _504 = fma(_480, _420, _474);
    float _506 = fma(_496, _380, _494);
    float _508 = fma(_498, _380, _502);
    float _510 = fma(_500, _380, _504);
    float _512 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[147].x, _506);
    float _514 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[147].y, _508);
    float _516 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[147].z, _510);
    bool _518 = !_328;
    float _536;
    if (!_518)
    {
        float _520 = in.m_35.x;
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _524 = _520 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[11].y, _98);
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
        float _544 = _98 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = in.m_33.x;
    float _550 = in.m_33.y;
    float _552 = in.m_33.z;
    float _554 = _238 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _556 = in.m_37.x;
    float _558 = in.m_37.y;
    float _560 = in.m_37.z;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _564 = _562 != 0;
    float _566 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[5].x, _554);
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _570 = _568 != 0;
    float _572 = in.m_35.x;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _576 = _574 != 0;
    float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _582 = _580 != 0;
    float _584 = _238 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _588 = _586 != 0;
    float _590 = _238 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _592 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[4].x, _584);
    float _594 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[6].x, _590);
    float _596 = in.m_35.z;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _604 = in.m_39.y;
    float _606 = _516 * _552;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _612 = in.m_35.y;
    float _614 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _556);
    float _616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _558);
    float _618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _560);
    float _620 = 1.0 / _600;
    float _622 = in.m_39.x;
    float _624 = _514 * _550;
    float _626 = _512 * _548;
    float _628 = _572 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _630 = 1.0 / _610;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _648 = 1.0 / _634;
    float _650 = _642 * _620;
    float _652 = -_636;
    float _654 = fma(_628, 2.0, _652);
    float _656 = _612 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _658;
    float _662 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _664 = fma(_656, -2.0, _638);
    float _666 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].z, _592);
    float _668 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].z, _566);
    float _670 = _646 * _630;
    float _672 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].z, _594);
    float _674 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _676 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _682 = -_604;
    float _684 = _682 + 1.0;
    float _686 = _674 * _614;
    float _688 = _662 * _616;
    bool _690 = _596 > 0.5;
    float _692 = _676 * _618;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _696 = _546 + _694;
    float _698 = _660 * _648;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _706 = _546 + _704;
    float _708 = _660;
    float _710 = _572;
    float _712 = _596;
    float _714 = _676;
    float _716 = _606;
    float _718 = _604;
    if (_588)
    {
        _708 = _612;
    }
    float _720 = _708;
    float _722 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[78].z, _678);
    bool _724 = false;
    float _726 = _720;
    if (_564)
    {
        bool _728 = _572 > 0.5;
        _724 = _728;
    }
    bool _730 = _724;
    float _732 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[88].z, _680);
    if (!_588)
    {
        _726 = _572;
    }
    float _734 = _726;
    float _736 = fma(_650, _696, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _738 = _690 ? as_type<int>(_684) : as_type<int>(_604);
    float _740 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[78].w, _700);
    if (!_588)
    {
        _710 = _596;
    }
    float _742 = _710;
    float _744 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[88].w, _702);
    bool _746 = _612 > 0.5;
    float _748 = fma(_670, _706, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    if (!_588)
    {
        _712 = _612;
    }
    float _750 = _712;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _754 = _546 + _752;
    if (!_564)
    {
        _714 = _622;
    }
    float _756 = _714;
    float _758 = _578 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _760 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _762 = isnan(_546);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = fma(_698, _754, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _774 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[77].w, _740);
    bool _776 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _778 = isnan(_546);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = -_770;
    float _790 = _788 + 1.0;
    float _792 = _756;
    if (!_564)
    {
        _716 = _756;
    }
    float _794 = _716;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    bool _798 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _800 = isnan(_546);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _806 = _802 || _804;
    float _808 = float(_806);
    float _810 = _666 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _812 = _794;
    if (_564)
    {
        _792 = _622;
    }
    float _814 = _792;
    float _816 = -_786;
    float _818 = _816 + 1.0;
    float _820 = _576 ? as_type<float>(_738) : _604;
    float _822 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[89].z, _796);
    bool _824 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _826 = isnan(_546);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = _808 * _790;
    float _838 = _814;
    if (_582)
    {
        float _840 = _746 ? _684 : _604;
        _718 = _840;
    }
    float _842 = _718;
    float _844 = -_808;
    float _846 = _844 + 1.0;
    float _848 = _834 * _818;
    float _850 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[89].x, _822);
    float _852 = _786 * _846;
    float _854 = _602 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _858 = _742 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _860 = _736 * _848;
    float _862 = _734 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _864 = _688 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _866 = -_856;
    float _868 = fma(_858, 2.0, _866);
    float _870 = _688 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _872 = fma(_820, _758, -0.5);
    float _874 = fma(_854, _842, -0.5);
    int _876 = as_type<int>(_842);
    int _878 = as_type<int>(_864);
    if (_564)
    {
        float _880 = -_814;
        float _882 = _880 + 1.0;
        _876 = as_type<int>(_882);
    }
    int _884 = _876;
    float _886 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[24].x, _864);
    if (_570)
    {
        float _888 = -_814;
        float _890 = _888 + 1.0;
        _878 = as_type<int>(_890);
    }
    int _892 = _878;
    float _894 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[25].x, _870);
    float _896 = _850 * (-0.15915493667125701904296875);
    float _898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_564)
    {
        float _900 = _730 ? as_type<float>(_884) : _814;
        _812 = _900;
    }
    float _902 = _812;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_570)
    {
        float _906 = _746 ? as_type<float>(_892) : _814;
        _838 = _906;
    }
    float _908 = _838;
    float _910 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[77].z, _722);
    float _912 = _688 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _914 = fma(_862, -2.0, _904);
    float _916 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[87].z, _732);
    float _918 = _896 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[24].z, _886);
    float _924 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[26].x, _912);
    float _926 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[76].y, _664);
    float _928 = -_98;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[76].x, _654);
    float _932 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[87].w, _744);
    float _934 = -_98;
    float _936 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[86].x, _868);
    float _938 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[86].y, _914);
    float _940 = _896 * 6.283185482025146484375;
    float _942 = cos(_940);
    float _944 = _922 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _946 = _898 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _948 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[25].z, _894);
    float _950 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[26].z, _924);
    float _952 = _810 + _944;
    float _954 = fma(_946, _908, -0.5);
    float _956 = _668 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _960 = _920 * _872;
    float _962 = _948 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _964 = -_834;
    float _966 = _964 + 1.0;
    float _968 = _672 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _970 = _950 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _972 = _956 + _962;
    float _974 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[115].x, _860);
    float _976 = -_960;
    float _978 = fma(_942, _954, _976);
    float _980 = _942 * _872;
    float _982 = _968 + _970;
    float _984 = _972 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _986 = fma(_916, _978, _936);
    float _988 = _972 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _990 = fma(_920, _954, _980);
    float _992 = _972 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _994 = _958 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _996 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[1].x, _988);
    float _998 = fma(_748, _852, _974);
    float _1000 = _972 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1002 = fma(_994, _902, -0.5);
    float _1004 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[0].x, _992);
    float _1006 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[1].z, _996);
    float _1008 = fma(_772, _836, _998);
    float _1010 = fma(_910, _1002, _930);
    float _1012 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[2].x, _984);
    float _1014 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1000);
    float _1016 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1004);
    float _1018 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1020 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1008);
    float _1022 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1012);
    float _1024 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1014);
    float _1026 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1028 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1030 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1032 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1034 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1036 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1038 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1028);
    float _1040 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1030);
    float _1042 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1032);
    float _1044 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1034);
    float _1046 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1038);
    float _1048 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1040);
    float _1050 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1042);
    float _1052 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1044);
    float _1054 = -_926;
    float _1056 = fma(_774, _874, _1054);
    float _1058 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1060 = -_938;
    float _1062 = fma(_932, _990, _1060);
    float _1064 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1074 = _1056 + 0.5;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1078 = _1010 + 0.5;
    float _1080 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1046);
    float _1082 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1048);
    float _1084 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1050);
    float _1086 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1088 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1090 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1092 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1094 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1096 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1098 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1100 = _986 + 0.5;
    float _1102 = _1062 + 0.5;
    float _1104 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1052);
    out.m_41.x = _1092;
    out.m_41.y = _1094;
    out.m_41.z = _1096;
    out.m_43.x = _1078;
    out.m_43.y = _1074;
    out.m_45.x = _1086;
    out.m_45.y = _1088;
    out.m_45.z = _1090;
    out.m_45.w = _1098;
    out.m_47.x = _1100;
    out.m_47.y = _1102;
    out.gl_Position.x = _1080;
    out.gl_Position.y = _1082;
    out.gl_Position.z = _1084;
    out.gl_Position.w = _1104;
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
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_70)
    {
        out.m_29.x = 0.0;
    }
    int _76 = 0;
    if (!_70)
    {
        float _78 = _74 * 5.0;
        _76 = as_type<int>(_78);
    }
    int _80 = _76;
    int _82 = _80;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1160 = as_type<float>(_80);
        out.gl_Position.z = _1160;
    }
    if (!_70)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _84 = in.m_31.w;
    bool _86 = _84 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _88 = isnan(_84);
    bool _90 = _86 || _88;
    bool _92 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _94 = _90 || _92;
    float _96 = -_84;
    float _98 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _100 = 0.0;
    if (_94)
    {
        float _102 = float(_66);
        _100 = _102;
    }
    float _104 = _100;
    bool _106 = _98 >= _104;
    bool _108 = !_94;
    bool _110 = _106 || _108;
    float _112 = 0.0;
    if (_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (_110)
    {
        out.m_29.x = 0.0;
    }
    if (_110)
    {
        float _118 = _114 * 5.0;
        _82 = as_type<int>(_118);
    }
    int _120 = _82;
    if (_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1229 = as_type<float>(_120);
        out.gl_Position.z = _1229;
    }
    if (_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_33.w;
    float _124 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _126 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _128 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _130 = _126 || _128;
    bool _132 = isnan(1.0);
    bool _134 = _130 || _132;
    float _136 = in.m_31.x;
    float _138 = in.m_31.y;
    float _140 = in.m_31.z;
    float _142 = in.m_26.x;
    float _144 = in.m_26.y;
    float _146 = in.m_26.z;
    float _148 = _124;
    if (!_134)
    {
        float _150 = _124 * _124;
        float _152 = _150 * 0.5;
        _116 = _152;
    }
    float _154 = _116;
    float _156 = _154;
    if (!_134)
    {
        float _158 = _154 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _156 = _158;
    }
    float _160 = _156;
    bool _162 = !_134;
    float _164 = _160;
    if (!_162)
    {
        float _166 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _168 = log2(_166);
        float _170 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _172 = _170 + 1.0;
        float _174 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = _124 * _168;
        float _178 = 1.0 / _172;
        float _180 = _174 * 0.693147182464599609375;
        float _182 = exp2(_176);
        float _184 = 1.0 / _180;
        float _186 = _182 + (-1.0);
        float _188 = -_186;
        float _190 = fma(_188, _184, _124);
        float _192 = _190 * _178;
        float _194 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _194;
    }
    float _196 = _164;
    bool _198 = !_134;
    if (!_198)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = 1.0 / _206;
        float _210 = _124 * _202;
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
    float _230 = fma(_220, _136, _224);
    float _232 = fma(_220, _138, _226);
    float _234 = fma(_220, _140, _228);
    float _236 = fma(_230, _122, _142);
    float _238 = fma(_232, _122, _144);
    float _240 = fma(_234, _122, _146);
    bool _242 = !_222;
    float _260;
    if (!_242)
    {
        float _244 = in.m_35.x;
        float _246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _248 = _244 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _250 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[12].x, _98);
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
        float _268 = _98 * _266;
        _260 = _268;
    }
    _262 = false;
    float _270 = _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = _270 + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _278 = _270 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = _270 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _290 = _288 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = 1.0 / _290;
    bool _302 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_270);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = 1.0 / _294;
    bool _316 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _318 = isnan(_270);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _330 = 1.0 / _298;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _334 = _270 + _332;
    float _336 = 1.0 / _286;
    float _338 = _334 * _300;
    bool _340 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _342 = isnan(_270);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = _274 * _314;
    bool _354 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _356 = isnan(_270);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_350;
    float _368 = _366 + 1.0;
    float _370 = _278 * _330;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _372;
    float _376 = -_326;
    float _378 = _376 + 1.0;
    float _380 = _364 * _368;
    float _382 = -_364;
    float _384 = _382 + 1.0;
    float _386 = fma(_374, _352, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _388 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _390 = isnan(_270);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = _282 * _336;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _410;
    float _414 = fma(_402, _370, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = fma(_408, _352, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _418 = fma(_412, _352, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _420 = _326 * _384;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _426 = _312 * _378;
    float _428 = -_312;
    float _430 = _428 + 1.0;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = fma(_424, _370, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _438 = _398 * _430;
    float _440 = fma(_434, _370, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _442 = -_398;
    float _444 = _442 + 1.0;
    float _446 = _386 * _438;
    float _448 = _416 * _438;
    float _450 = _418 * _438;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _452;
    float _456 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[143].x, _446);
    float _458 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[143].y, _448);
    float _460 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[143].z, _450);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _466;
    float _470 = fma(_414, _426, _456);
    float _472 = fma(_436, _426, _458);
    float _474 = fma(_440, _426, _460);
    float _476 = fma(_464, _404, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _478 = fma(_454, _404, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _480 = fma(_468, _404, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _494 = fma(_476, _420, _470);
    float _496 = fma(_484, _338, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _498 = fma(_488, _338, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _500 = fma(_492, _338, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _502 = fma(_478, _420, _472);
    float _504 = fma(_480, _420, _474);
    float _506 = fma(_496, _380, _494);
    float _508 = fma(_498, _380, _502);
    float _510 = fma(_500, _380, _504);
    float _512 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[147].x, _506);
    float _514 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[147].y, _508);
    float _516 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[147].z, _510);
    bool _518 = !_328;
    float _536;
    if (!_518)
    {
        float _520 = in.m_35.x;
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _524 = _520 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[11].y, _98);
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
        float _544 = _98 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = in.m_33.x;
    float _550 = in.m_33.y;
    float _552 = in.m_33.z;
    float _554 = _238 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _556 = in.m_37.x;
    float _558 = in.m_37.y;
    float _560 = in.m_37.z;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _564 = _562 != 0;
    float _566 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[5].x, _554);
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _570 = _568 != 0;
    float _572 = in.m_35.x;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _576 = _574 != 0;
    float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _582 = _580 != 0;
    float _584 = _238 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _588 = _586 != 0;
    float _590 = _238 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _592 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[4].x, _584);
    float _594 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[6].x, _590);
    float _596 = in.m_35.z;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _604 = in.m_39.y;
    float _606 = _516 * _552;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _612 = in.m_35.y;
    float _614 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _556);
    float _616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _558);
    float _618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _560);
    float _620 = 1.0 / _600;
    float _622 = in.m_39.x;
    float _624 = _514 * _550;
    float _626 = _512 * _548;
    float _628 = _572 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _630 = 1.0 / _610;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _648 = 1.0 / _634;
    float _650 = _642 * _620;
    float _652 = -_636;
    float _654 = fma(_628, 2.0, _652);
    float _656 = _612 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _658;
    float _662 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _664 = fma(_656, -2.0, _638);
    float _666 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].z, _592);
    float _668 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].z, _566);
    float _670 = _646 * _630;
    float _672 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].z, _594);
    float _674 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _676 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _682 = -_604;
    float _684 = _682 + 1.0;
    float _686 = _674 * _614;
    float _688 = _662 * _616;
    bool _690 = _596 > 0.5;
    float _692 = _676 * _618;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _696 = _546 + _694;
    float _698 = _660 * _648;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _706 = _546 + _704;
    float _708 = _660;
    float _710 = _572;
    float _712 = _596;
    float _714 = _676;
    float _716 = _606;
    float _718 = _604;
    if (_588)
    {
        _708 = _612;
    }
    float _720 = _708;
    float _722 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[78].z, _678);
    bool _724 = false;
    float _726 = _720;
    if (_564)
    {
        bool _728 = _572 > 0.5;
        _724 = _728;
    }
    bool _730 = _724;
    float _732 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[88].z, _680);
    if (!_588)
    {
        _726 = _572;
    }
    float _734 = _726;
    float _736 = fma(_650, _696, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _738 = _690 ? as_type<int>(_684) : as_type<int>(_604);
    float _740 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[78].w, _700);
    if (!_588)
    {
        _710 = _596;
    }
    float _742 = _710;
    float _744 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[88].w, _702);
    bool _746 = _612 > 0.5;
    float _748 = fma(_670, _706, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    if (!_588)
    {
        _712 = _612;
    }
    float _750 = _712;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _754 = _546 + _752;
    if (!_564)
    {
        _714 = _622;
    }
    float _756 = _714;
    float _758 = _578 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _760 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _762 = isnan(_546);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = fma(_698, _754, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _774 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[77].w, _740);
    bool _776 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _778 = isnan(_546);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = -_770;
    float _790 = _788 + 1.0;
    float _792 = _756;
    if (!_564)
    {
        _716 = _756;
    }
    float _794 = _716;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    bool _798 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _800 = isnan(_546);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _806 = _802 || _804;
    float _808 = float(_806);
    float _810 = _666 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _812 = _794;
    if (_564)
    {
        _792 = _622;
    }
    float _814 = _792;
    float _816 = -_786;
    float _818 = _816 + 1.0;
    float _820 = _576 ? as_type<float>(_738) : _604;
    float _822 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[89].z, _796);
    bool _824 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _826 = isnan(_546);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = _808 * _790;
    float _838 = _814;
    if (_582)
    {
        float _840 = _746 ? _684 : _604;
        _718 = _840;
    }
    float _842 = _718;
    float _844 = -_808;
    float _846 = _844 + 1.0;
    float _848 = _834 * _818;
    float _850 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[89].x, _822);
    float _852 = _786 * _846;
    float _854 = _602 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _858 = _742 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _860 = _736 * _848;
    float _862 = _734 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _864 = _688 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _866 = -_856;
    float _868 = fma(_858, 2.0, _866);
    float _870 = _688 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _872 = fma(_820, _758, -0.5);
    float _874 = fma(_854, _842, -0.5);
    int _876 = as_type<int>(_842);
    int _878 = as_type<int>(_864);
    if (_564)
    {
        float _880 = -_814;
        float _882 = _880 + 1.0;
        _876 = as_type<int>(_882);
    }
    int _884 = _876;
    float _886 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[24].x, _864);
    if (_570)
    {
        float _888 = -_814;
        float _890 = _888 + 1.0;
        _878 = as_type<int>(_890);
    }
    int _892 = _878;
    float _894 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[25].x, _870);
    float _896 = _850 * (-0.15915493667125701904296875);
    float _898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_564)
    {
        float _900 = _730 ? as_type<float>(_884) : _814;
        _812 = _900;
    }
    float _902 = _812;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_570)
    {
        float _906 = _746 ? as_type<float>(_892) : _814;
        _838 = _906;
    }
    float _908 = _838;
    float _910 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[77].z, _722);
    float _912 = _688 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _914 = fma(_862, -2.0, _904);
    float _916 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[87].z, _732);
    float _918 = _896 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[24].z, _886);
    float _924 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[26].x, _912);
    float _926 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[76].y, _664);
    float _928 = -_98;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[76].x, _654);
    float _932 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[87].w, _744);
    float _934 = -_98;
    float _936 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[86].x, _868);
    float _938 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[86].y, _914);
    float _940 = _896 * 6.283185482025146484375;
    float _942 = cos(_940);
    float _944 = _922 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _946 = _898 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _948 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[25].z, _894);
    float _950 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[26].z, _924);
    float _952 = _810 + _944;
    float _954 = fma(_946, _908, -0.5);
    float _956 = _668 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _960 = _920 * _872;
    float _962 = _948 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _964 = -_834;
    float _966 = _964 + 1.0;
    float _968 = _672 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _970 = _950 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _972 = _956 + _962;
    float _974 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[115].x, _860);
    float _976 = -_960;
    float _978 = fma(_942, _954, _976);
    float _980 = _942 * _872;
    float _982 = _968 + _970;
    float _984 = _972 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _986 = fma(_916, _978, _936);
    float _988 = _972 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _990 = fma(_920, _954, _980);
    float _992 = _972 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _994 = _958 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _996 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[1].x, _988);
    float _998 = fma(_748, _852, _974);
    float _1000 = _972 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1002 = fma(_994, _902, -0.5);
    float _1004 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[0].x, _992);
    float _1006 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[1].z, _996);
    float _1008 = fma(_772, _836, _998);
    float _1010 = fma(_910, _1002, _930);
    float _1012 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[2].x, _984);
    float _1014 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1000);
    float _1016 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1004);
    float _1018 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1020 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1008);
    float _1022 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1012);
    float _1024 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1014);
    float _1026 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1028 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1030 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1032 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1034 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1036 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1038 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1028);
    float _1040 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1030);
    float _1042 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1032);
    float _1044 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1034);
    float _1046 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1038);
    float _1048 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1040);
    float _1050 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1042);
    float _1052 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1044);
    float _1054 = -_926;
    float _1056 = fma(_774, _874, _1054);
    float _1058 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1060 = -_938;
    float _1062 = fma(_932, _990, _1060);
    float _1064 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1074 = _1056 + 0.5;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1078 = _1010 + 0.5;
    float _1080 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1046);
    float _1082 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1048);
    float _1084 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1050);
    float _1086 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1088 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1090 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1092 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1094 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1096 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1098 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1100 = _986 + 0.5;
    float _1102 = _1062 + 0.5;
    float _1104 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1052);
    out.m_41.x = _1092;
    out.m_41.y = _1094;
    out.m_41.z = _1096;
    out.m_43.x = _1078;
    out.m_43.y = _1074;
    out.m_45.x = _1086;
    out.m_45.y = _1088;
    out.m_45.z = _1090;
    out.m_45.w = _1098;
    out.m_47.x = _1100;
    out.m_47.y = _1102;
    out.gl_Position.x = _1080;
    out.gl_Position.y = _1082;
    out.gl_Position.z = _1084;
    out.gl_Position.w = _1104;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

