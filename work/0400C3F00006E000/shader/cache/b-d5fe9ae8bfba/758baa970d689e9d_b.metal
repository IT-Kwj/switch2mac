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
    float4 m_37 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_45 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_35 [[attribute(7)]];
    float4 m_33 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _538 = false;
    bool _434 = false;
    bool _266 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_26.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    float _78 = _76;
    if (!_72)
    {
        out.m_29.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _76 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1189 = as_type<float>(_84);
        out.gl_Position.z = _1189;
    }
    if (!_72)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _88 = in.m_31.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_98)
    {
        float _104 = float(_68);
        _78 = _104;
    }
    float _106 = _78;
    bool _108 = _102 >= _106;
    bool _110 = !_98;
    bool _112 = _108 || _110;
    float _114 = _106;
    if (_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (_112)
    {
        out.m_29.x = 0.0;
    }
    if (_112)
    {
        float _118 = _116 * 5.0;
        _86 = as_type<int>(_118);
    }
    int _120 = _86;
    if (_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1258 = as_type<float>(_120);
        out.gl_Position.z = _1258;
    }
    if (_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_33.w;
    float _124 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _126 = in.m_35.w;
    bool _128 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _130 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _132 = _128 || _130;
    bool _134 = isnan(1.0);
    bool _136 = _132 || _134;
    float _138 = in.m_31.x;
    float _140 = in.m_31.y;
    float _142 = in.m_31.z;
    float _144 = in.m_26.x;
    float _146 = in.m_26.y;
    float _148 = in.m_26.z;
    float _150 = 0.0;
    float _152 = _124;
    if (!_136)
    {
        float _154 = _124 * _124;
        float _156 = _154 * 0.5;
        _150 = _156;
    }
    float _158 = _150;
    float _160 = _158;
    if (!_136)
    {
        float _162 = _158 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _160 = _162;
    }
    float _164 = _160;
    out.m_37.w = _122;
    bool _166 = !_136;
    float _168 = _164;
    if (!_166)
    {
        float _170 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _172 = log2(_170);
        float _174 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _176 = _174 + 1.0;
        float _178 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _180 = _124 * _172;
        float _182 = 1.0 / _176;
        float _184 = _178 * 0.693147182464599609375;
        float _186 = exp2(_180);
        float _188 = 1.0 / _184;
        float _190 = _186 + (-1.0);
        float _192 = -_190;
        float _194 = fma(_192, _188, _124);
        float _196 = _194 * _182;
        float _198 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _198;
    }
    float _200 = _168;
    bool _202 = !_136;
    if (!_202)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = 1.0 / _210;
        float _214 = _124 * _206;
        float _216 = exp2(_214);
        float _218 = -_216;
        float _220 = _218 + 1.0;
        float _222 = _220 * _212;
        _152 = _222;
    }
    float _224 = _152;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _230 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _232 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _234 = fma(_224, _138, _228);
    float _236 = fma(_224, _140, _230);
    float _238 = fma(_224, _142, _232);
    float _240 = fma(_234, _126, _144);
    float _242 = fma(_236, _126, _146);
    float _244 = fma(_238, _126, _148);
    bool _246 = !_226;
    float _264;
    if (!_246)
    {
        float _248 = in.m_39.x;
        float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _252 = _248 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _254 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _256 = _254 * _250;
        float _258 = floor(_256);
        float _260 = -_258;
        float _262 = _256 + _260;
        _264 = _262;
        _266 = true;
    }
    else
    {
        float _268 = float(_68);
        float _270 = 1.0 / _268;
        float _272 = _102 * _270;
        _264 = _272;
    }
    _266 = false;
    float _274 = _264;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _278 = _274 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _282 = _280 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _284 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _286 = isnan(_274);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _304 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _306 = isnan(_274);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = 1.0 / _282;
    float _318 = -_294;
    float _320 = _318 + 1.0;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _322;
    bool _326 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _328 = isnan(_274);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = _314 * _320;
    float _340 = -_314;
    float _342 = _340 + 1.0;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _346 = 1.0 / _298;
    float _348 = _336 * _342;
    float _350 = -_336;
    float _352 = _350 + 1.0;
    float _354 = 1.0 / _302;
    float _356 = _324 * _316;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _362 = fma(_356, _278, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _364 = _360 * _346;
    bool _366 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _368 = isnan(_274);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _384 = _274 + _382;
    float _386 = _362 * _348;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _390 = _274 + _388;
    float _392 = -_376;
    float _394 = _392 + 1.0;
    float _396 = fma(_364, _384, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _398 = _380 * _354;
    float _400 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[115].x, _386);
    float _402 = _294 * _394;
    float _404 = fma(_398, _390, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _406 = fma(_396, _338, _400);
    float _408 = fma(_404, _402, _406);
    float _410 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[118].x, _408);
    float _412 = _410 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.w = _412;
    bool _414 = !_344;
    float _432;
    if (!_414)
    {
        float _416 = in.m_39.x;
        float _418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _420 = _416 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _422 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _424 = _422 * _418;
        float _426 = floor(_424);
        float _428 = -_426;
        float _430 = _424 + _428;
        _432 = _430;
        _434 = true;
    }
    else
    {
        float _436 = float(_68);
        float _438 = 1.0 / _436;
        float _440 = _102 * _438;
        _432 = _440;
    }
    _434 = false;
    float _442 = _432;
    bool _444 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _446 = isnan(_442);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _460 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _462 = isnan(_442);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _478 = _442 + _476;
    float _480 = -_454;
    float _482 = _480 + 1.0;
    float _484 = 1.0 / _458;
    bool _486 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _488 = _470 * _482;
    float _490 = -_470;
    float _492 = _490 + 1.0;
    float _494 = _474 * _484;
    float _496 = fma(_494, _478, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _498 = _496 * _488;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _504 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[131].x, _498);
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _508 = _500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _510 = _502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _512 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[132].x, _504);
    float _514 = _506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = _512 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_43.x = _508;
    out.m_43.y = _510;
    out.m_43.z = _514;
    out.m_43.w = _516;
    bool _518 = !_486;
    float _536;
    if (!_518)
    {
        float _520 = in.m_39.x;
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _524 = _520 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[14].y, _102);
        float _528 = _526 * _522;
        float _530 = floor(_528);
        float _532 = -_530;
        float _534 = _528 + _532;
        _536 = _534;
        _538 = true;
    }
    else
    {
        float _540 = float(_68);
        float _542 = 1.0 / _540;
        float _544 = _102 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = in.m_39.w;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _552 = _546 + _550;
    float _554 = in.m_45.x;
    float _556 = in.m_45.y;
    float _558 = in.m_45.z;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _562 = _560 != 0;
    float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _566 = in.m_33.y;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _572 = in.m_35.x;
    float _574 = in.m_35.y;
    float _576 = in.m_35.z;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _582 = 1.0 / _570;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _586 = _584 != 0;
    float _588 = in.m_33.x;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _592 = _590 != 0;
    float _594 = _242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _596 = 1.0 / _580;
    bool _598 = _548 > 0.5;
    float _600 = _242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _602 = _242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _608 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _594);
    float _610 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _600);
    float _612 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _602);
    float _614 = 1.0 / _606;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _554);
    float _622 = _574 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _628 = -_566;
    float _630 = _628 + 1.0;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _636 = 1.0 / _626;
    float _638 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].z, _610);
    float _640 = _566;
    if (_592)
    {
        float _642 = _598 ? _630 : _566;
        _640 = _642;
    }
    float _644 = _640;
    float _646 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].z, _608);
    float _648 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].z, _612);
    float _650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _556);
    float _652 = 1.0 / _618;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _558);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _664;
    float _668 = 0.0;
    if (_586)
    {
        float _670 = in.m_39.z;
        _668 = _670;
    }
    float _672 = _668;
    float _674 = _660 * _596;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _680 = 1.0 / _634;
    float _682 = _572 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _692 = _678 * _614;
    float _694 = _622 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _696 = _656 * _582;
    float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _700 = _686 * _652;
    float _702 = _694 * _650;
    float _704 = _666 * _636;
    float _706 = _694;
    if (!_562)
    {
        float _708 = in.m_39.z;
        _706 = _708;
    }
    float _710 = _706;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _716 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _718 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _720 = isnan(_546);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = _576 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _732 = 1.0 / _714;
    float _734 = _716 * _620;
    bool _736 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _738 = isnan(_546);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _750 = _672 > 0.5;
    bool _752 = _750 && _586;
    float _754 = _690 * _680;
    float _756 = _698 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _758 = -_746;
    float _760 = _758 + 1.0;
    float _762 = _748 * _662;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _764;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _770 = _546 + _768;
    float _772 = fma(_756, _644, -0.5);
    bool _774 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _776 = isnan(_546);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _788 = _546 + _786;
    float _790 = fma(_696, _770, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _792 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _794 = isnan(_546);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _806 = _546 + _804;
    float _808 = _766 * _732;
    float _810 = -_784;
    float _812 = _810 + 1.0;
    bool _814 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _816 = isnan(_546);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = -_802;
    float _828 = _826 + 1.0;
    float _830 = fma(_674, _806, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    bool _832 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _834 = isnan(_546);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = _802 * _812;
    float _846 = _728 * _828;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _850 = _546 + _848;
    float _852 = -_728;
    float _854 = _852 + 1.0;
    float _856 = -_842;
    float _858 = _856 + 1.0;
    float _860 = _802;
    if (!_562)
    {
        float _862 = in.m_39.y;
        _860 = _862;
    }
    float _864 = _860;
    float _866 = fma(_700, _850, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _868 = _842 * _760;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _872 = _546 + _870;
    float _874 = _746 * _854;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _878 = _546 + _876;
    bool _880 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _882 = isnan(_546);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = fma(_704, _872, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _894 = _872;
    float _896 = _890;
    float _898 = _710;
    if (!_562)
    {
        _894 = _710;
    }
    float _900 = _894;
    float _902 = fma(_692, _878, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _904 = _824 * _858;
    bool _906 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _908 = isnan(_546);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = -_890;
    float _920 = _918 + 1.0;
    float _922 = 0.0;
    if (_586)
    {
        _922 = _588;
    }
    float _924 = _922;
    float _926 = _864;
    float _928 = _900;
    float _930 = _924;
    if (_562)
    {
        float _932 = in.m_39.x;
        float _934 = in.m_39.y;
        _926 = _932;
        _928 = _934;
    }
    float _936 = _926;
    float _938 = _928;
    float _940 = -_824;
    float _942 = _940 + 1.0;
    float _944 = _916 * _920;
    float _946 = fma(_754, _788, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    if (_752)
    {
        float _948 = -_924;
        float _950 = _948 + 1.0;
        _930 = _950;
    }
    float _952 = _930;
    float _954 = _890 * _942;
    if (!_586)
    {
        _896 = _588;
    }
    float _956 = _896;
    float _958 = fma(_808, _552, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _960 = _790 * _944;
    float _962 = _702 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _964 = _702 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _966 = _702 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _968 = _956;
    if (_586)
    {
        _968 = _952;
    }
    float _970 = _968;
    float _972 = -_916;
    float _974 = _972 + 1.0;
    float _976 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[24].x, _962);
    float _978 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[25].x, _964);
    float _980 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[26].x, _966);
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[167].x, _960);
    float _986 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[25].z, _978);
    float _988 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[83].z, _982);
    float _990 = _936 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_562)
    {
        _898 = _938;
    }
    float _994 = _898;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _998 = _938 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1002 = _564 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1004 = fma(_830, _954, _984);
    float _1006 = fma(_998, -2.0, _996);
    float _1008 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1000);
    float _1010 = fma(_1002, _970, -0.5);
    float _1012 = fma(_866, _904, _1004);
    float _1014 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1006);
    float _1016 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1008);
    float _1018 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[24].z, _976);
    float _1020 = _646 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1022 = _986 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1024 = -_1014;
    float _1026 = fma(_1016, _772, _1024);
    float _1028 = fma(_902, _868, _1012);
    float _1030 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[26].z, _980);
    float _1032 = _638 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1034 = _1018 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1036 = _1020 + _1022;
    float _1038 = fma(_892, _874, _1028);
    float _1040 = _648 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1042 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1044 = _1032 + _1034;
    float _1046 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1048 = -_992;
    float _1050 = fma(_990, 2.0, _1048);
    float _1052 = fma(_946, _846, _1038);
    float _1054 = _1040 + _1042;
    float _1056 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1058 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1046);
    float _1060 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1062 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _988);
    float _1064 = -_102;
    float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1050);
    float _1068 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1070 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1056);
    float _1072 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1058);
    float _1074 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1060);
    float _1076 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1068);
    float _1078 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1070);
    float _1080 = _1072 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1082 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1074);
    float _1084 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1076);
    float _1086 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1088 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1090 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1092 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1094 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1096 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1098 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1088);
    float _1100 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1090);
    float _1102 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1092);
    float _1104 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1094);
    float _1106 = fma(_1062, _1010, _1066);
    float _1108 = fma(_958, _844, _1052);
    float _1110 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1098);
    float _1112 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1100);
    float _1114 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1102);
    float _1116 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1104);
    float _1118 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1120 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1108);
    float _1122 = _1106 + 0.5;
    float _1124 = _1026 + 0.5;
    float _1126 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1110);
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1112);
    float _1130 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1114);
    float _1132 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1116);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.z = _1122;
    out.m_47.w = _1124;
    out.m_49.x = _1120;
    out.gl_Position.x = _1126;
    out.gl_Position.y = _1128;
    out.gl_Position.z = _1130;
    out.gl_Position.w = _1132;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _538 = false;
    bool _434 = false;
    bool _266 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_26.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    float _78 = _76;
    if (!_72)
    {
        out.m_29.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _76 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1189 = as_type<float>(_84);
        out.gl_Position.z = _1189;
    }
    if (!_72)
    {
        return out;
    }
    float _88 = in.m_31.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_98)
    {
        float _104 = float(_68);
        _78 = _104;
    }
    float _106 = _78;
    bool _108 = _102 >= _106;
    bool _110 = !_98;
    bool _112 = _108 || _110;
    float _114 = _106;
    if (_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (_112)
    {
        out.m_29.x = 0.0;
    }
    if (_112)
    {
        float _118 = _116 * 5.0;
        _86 = as_type<int>(_118);
    }
    int _120 = _86;
    if (_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1258 = as_type<float>(_120);
        out.gl_Position.z = _1258;
    }
    if (_112)
    {
        return out;
    }
    float _122 = in.m_33.w;
    float _124 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _126 = in.m_35.w;
    bool _128 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _130 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _132 = _128 || _130;
    bool _134 = isnan(1.0);
    bool _136 = _132 || _134;
    float _138 = in.m_31.x;
    float _140 = in.m_31.y;
    float _142 = in.m_31.z;
    float _144 = in.m_26.x;
    float _146 = in.m_26.y;
    float _148 = in.m_26.z;
    float _150 = 0.0;
    float _152 = _124;
    if (!_136)
    {
        float _154 = _124 * _124;
        float _156 = _154 * 0.5;
        _150 = _156;
    }
    float _158 = _150;
    float _160 = _158;
    if (!_136)
    {
        float _162 = _158 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _160 = _162;
    }
    float _164 = _160;
    out.m_37.w = _122;
    bool _166 = !_136;
    float _168 = _164;
    if (!_166)
    {
        float _170 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _172 = log2(_170);
        float _174 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _176 = _174 + 1.0;
        float _178 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _180 = _124 * _172;
        float _182 = 1.0 / _176;
        float _184 = _178 * 0.693147182464599609375;
        float _186 = exp2(_180);
        float _188 = 1.0 / _184;
        float _190 = _186 + (-1.0);
        float _192 = -_190;
        float _194 = fma(_192, _188, _124);
        float _196 = _194 * _182;
        float _198 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _198;
    }
    float _200 = _168;
    bool _202 = !_136;
    if (!_202)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = 1.0 / _210;
        float _214 = _124 * _206;
        float _216 = exp2(_214);
        float _218 = -_216;
        float _220 = _218 + 1.0;
        float _222 = _220 * _212;
        _152 = _222;
    }
    float _224 = _152;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _230 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _232 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _234 = fma(_224, _138, _228);
    float _236 = fma(_224, _140, _230);
    float _238 = fma(_224, _142, _232);
    float _240 = fma(_234, _126, _144);
    float _242 = fma(_236, _126, _146);
    float _244 = fma(_238, _126, _148);
    bool _246 = !_226;
    float _264;
    if (!_246)
    {
        float _248 = in.m_39.x;
        float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _252 = _248 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _254 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _256 = _254 * _250;
        float _258 = floor(_256);
        float _260 = -_258;
        float _262 = _256 + _260;
        _264 = _262;
        _266 = true;
    }
    else
    {
        float _268 = float(_68);
        float _270 = 1.0 / _268;
        float _272 = _102 * _270;
        _264 = _272;
    }
    _266 = false;
    float _274 = _264;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _278 = _274 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _282 = _280 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _284 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _286 = isnan(_274);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _304 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _306 = isnan(_274);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = 1.0 / _282;
    float _318 = -_294;
    float _320 = _318 + 1.0;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _322;
    bool _326 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _328 = isnan(_274);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = _314 * _320;
    float _340 = -_314;
    float _342 = _340 + 1.0;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _346 = 1.0 / _298;
    float _348 = _336 * _342;
    float _350 = -_336;
    float _352 = _350 + 1.0;
    float _354 = 1.0 / _302;
    float _356 = _324 * _316;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _362 = fma(_356, _278, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _364 = _360 * _346;
    bool _366 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _368 = isnan(_274);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _384 = _274 + _382;
    float _386 = _362 * _348;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _390 = _274 + _388;
    float _392 = -_376;
    float _394 = _392 + 1.0;
    float _396 = fma(_364, _384, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _398 = _380 * _354;
    float _400 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[115].x, _386);
    float _402 = _294 * _394;
    float _404 = fma(_398, _390, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _406 = fma(_396, _338, _400);
    float _408 = fma(_404, _402, _406);
    float _410 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[118].x, _408);
    float _412 = _410 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.w = _412;
    bool _414 = !_344;
    float _432;
    if (!_414)
    {
        float _416 = in.m_39.x;
        float _418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _420 = _416 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _422 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _424 = _422 * _418;
        float _426 = floor(_424);
        float _428 = -_426;
        float _430 = _424 + _428;
        _432 = _430;
        _434 = true;
    }
    else
    {
        float _436 = float(_68);
        float _438 = 1.0 / _436;
        float _440 = _102 * _438;
        _432 = _440;
    }
    _434 = false;
    float _442 = _432;
    bool _444 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _446 = isnan(_442);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _460 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _462 = isnan(_442);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _478 = _442 + _476;
    float _480 = -_454;
    float _482 = _480 + 1.0;
    float _484 = 1.0 / _458;
    bool _486 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _488 = _470 * _482;
    float _490 = -_470;
    float _492 = _490 + 1.0;
    float _494 = _474 * _484;
    float _496 = fma(_494, _478, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _498 = _496 * _488;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _504 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[131].x, _498);
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _508 = _500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _510 = _502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _512 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[132].x, _504);
    float _514 = _506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = _512 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_43.x = _508;
    out.m_43.y = _510;
    out.m_43.z = _514;
    out.m_43.w = _516;
    bool _518 = !_486;
    float _536;
    if (!_518)
    {
        float _520 = in.m_39.x;
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _524 = _520 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[14].y, _102);
        float _528 = _526 * _522;
        float _530 = floor(_528);
        float _532 = -_530;
        float _534 = _528 + _532;
        _536 = _534;
        _538 = true;
    }
    else
    {
        float _540 = float(_68);
        float _542 = 1.0 / _540;
        float _544 = _102 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = in.m_39.w;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _552 = _546 + _550;
    float _554 = in.m_45.x;
    float _556 = in.m_45.y;
    float _558 = in.m_45.z;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _562 = _560 != 0;
    float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _566 = in.m_33.y;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _572 = in.m_35.x;
    float _574 = in.m_35.y;
    float _576 = in.m_35.z;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _582 = 1.0 / _570;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _586 = _584 != 0;
    float _588 = in.m_33.x;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _592 = _590 != 0;
    float _594 = _242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _596 = 1.0 / _580;
    bool _598 = _548 > 0.5;
    float _600 = _242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _602 = _242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _608 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _594);
    float _610 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _600);
    float _612 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _602);
    float _614 = 1.0 / _606;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _554);
    float _622 = _574 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _628 = -_566;
    float _630 = _628 + 1.0;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _636 = 1.0 / _626;
    float _638 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].z, _610);
    float _640 = _566;
    if (_592)
    {
        float _642 = _598 ? _630 : _566;
        _640 = _642;
    }
    float _644 = _640;
    float _646 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].z, _608);
    float _648 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].z, _612);
    float _650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _556);
    float _652 = 1.0 / _618;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _558);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _664;
    float _668 = 0.0;
    if (_586)
    {
        float _670 = in.m_39.z;
        _668 = _670;
    }
    float _672 = _668;
    float _674 = _660 * _596;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _680 = 1.0 / _634;
    float _682 = _572 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _692 = _678 * _614;
    float _694 = _622 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _696 = _656 * _582;
    float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _700 = _686 * _652;
    float _702 = _694 * _650;
    float _704 = _666 * _636;
    float _706 = _694;
    if (!_562)
    {
        float _708 = in.m_39.z;
        _706 = _708;
    }
    float _710 = _706;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _716 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _718 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _720 = isnan(_546);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = _576 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _732 = 1.0 / _714;
    float _734 = _716 * _620;
    bool _736 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _738 = isnan(_546);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _750 = _672 > 0.5;
    bool _752 = _750 && _586;
    float _754 = _690 * _680;
    float _756 = _698 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _758 = -_746;
    float _760 = _758 + 1.0;
    float _762 = _748 * _662;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _764;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _770 = _546 + _768;
    float _772 = fma(_756, _644, -0.5);
    bool _774 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _776 = isnan(_546);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _788 = _546 + _786;
    float _790 = fma(_696, _770, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _792 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _794 = isnan(_546);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _806 = _546 + _804;
    float _808 = _766 * _732;
    float _810 = -_784;
    float _812 = _810 + 1.0;
    bool _814 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _816 = isnan(_546);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = -_802;
    float _828 = _826 + 1.0;
    float _830 = fma(_674, _806, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    bool _832 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _834 = isnan(_546);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = _802 * _812;
    float _846 = _728 * _828;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _850 = _546 + _848;
    float _852 = -_728;
    float _854 = _852 + 1.0;
    float _856 = -_842;
    float _858 = _856 + 1.0;
    float _860 = _802;
    if (!_562)
    {
        float _862 = in.m_39.y;
        _860 = _862;
    }
    float _864 = _860;
    float _866 = fma(_700, _850, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _868 = _842 * _760;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _872 = _546 + _870;
    float _874 = _746 * _854;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _878 = _546 + _876;
    bool _880 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _882 = isnan(_546);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = fma(_704, _872, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _894 = _872;
    float _896 = _890;
    float _898 = _710;
    if (!_562)
    {
        _894 = _710;
    }
    float _900 = _894;
    float _902 = fma(_692, _878, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _904 = _824 * _858;
    bool _906 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _908 = isnan(_546);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = -_890;
    float _920 = _918 + 1.0;
    float _922 = 0.0;
    if (_586)
    {
        _922 = _588;
    }
    float _924 = _922;
    float _926 = _864;
    float _928 = _900;
    float _930 = _924;
    if (_562)
    {
        float _932 = in.m_39.x;
        float _934 = in.m_39.y;
        _926 = _932;
        _928 = _934;
    }
    float _936 = _926;
    float _938 = _928;
    float _940 = -_824;
    float _942 = _940 + 1.0;
    float _944 = _916 * _920;
    float _946 = fma(_754, _788, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    if (_752)
    {
        float _948 = -_924;
        float _950 = _948 + 1.0;
        _930 = _950;
    }
    float _952 = _930;
    float _954 = _890 * _942;
    if (!_586)
    {
        _896 = _588;
    }
    float _956 = _896;
    float _958 = fma(_808, _552, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _960 = _790 * _944;
    float _962 = _702 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _964 = _702 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _966 = _702 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _968 = _956;
    if (_586)
    {
        _968 = _952;
    }
    float _970 = _968;
    float _972 = -_916;
    float _974 = _972 + 1.0;
    float _976 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[24].x, _962);
    float _978 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[25].x, _964);
    float _980 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[26].x, _966);
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[167].x, _960);
    float _986 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[25].z, _978);
    float _988 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[83].z, _982);
    float _990 = _936 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_562)
    {
        _898 = _938;
    }
    float _994 = _898;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _998 = _938 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1002 = _564 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1004 = fma(_830, _954, _984);
    float _1006 = fma(_998, -2.0, _996);
    float _1008 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1000);
    float _1010 = fma(_1002, _970, -0.5);
    float _1012 = fma(_866, _904, _1004);
    float _1014 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1006);
    float _1016 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1008);
    float _1018 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[24].z, _976);
    float _1020 = _646 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1022 = _986 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1024 = -_1014;
    float _1026 = fma(_1016, _772, _1024);
    float _1028 = fma(_902, _868, _1012);
    float _1030 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[26].z, _980);
    float _1032 = _638 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1034 = _1018 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1036 = _1020 + _1022;
    float _1038 = fma(_892, _874, _1028);
    float _1040 = _648 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1042 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1044 = _1032 + _1034;
    float _1046 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1048 = -_992;
    float _1050 = fma(_990, 2.0, _1048);
    float _1052 = fma(_946, _846, _1038);
    float _1054 = _1040 + _1042;
    float _1056 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1058 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1046);
    float _1060 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1062 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _988);
    float _1064 = -_102;
    float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1050);
    float _1068 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1070 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1056);
    float _1072 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1058);
    float _1074 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1060);
    float _1076 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1068);
    float _1078 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1070);
    float _1080 = _1072 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1082 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1074);
    float _1084 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1076);
    float _1086 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1088 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1090 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1092 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1094 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1096 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1098 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1088);
    float _1100 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1090);
    float _1102 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1092);
    float _1104 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1094);
    float _1106 = fma(_1062, _1010, _1066);
    float _1108 = fma(_958, _844, _1052);
    float _1110 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1098);
    float _1112 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1100);
    float _1114 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1102);
    float _1116 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1104);
    float _1118 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1120 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1108);
    float _1122 = _1106 + 0.5;
    float _1124 = _1026 + 0.5;
    float _1126 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1110);
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1112);
    float _1130 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1114);
    float _1132 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1116);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.z = _1122;
    out.m_47.w = _1124;
    out.m_49.x = _1120;
    out.gl_Position.x = _1126;
    out.gl_Position.y = _1128;
    out.gl_Position.z = _1130;
    out.gl_Position.w = _1132;
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
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _538 = false;
    bool _434 = false;
    bool _266 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _63 = in.m_26.w;
    float _65 = trunc(_63);
    int _68 = int(_65);
    bool _72 = _68 >= 1;
    float _74 = 0.0;
    if (!_72)
    {
        _74 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _74;
    float _78 = _76;
    if (!_72)
    {
        out.m_29.x = 0.0;
    }
    int _80 = 0;
    if (!_72)
    {
        float _82 = _76 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_72)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1189 = as_type<float>(_84);
        out.gl_Position.z = _1189;
    }
    if (!_72)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _88 = in.m_31.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_98)
    {
        float _104 = float(_68);
        _78 = _104;
    }
    float _106 = _78;
    bool _108 = _102 >= _106;
    bool _110 = !_98;
    bool _112 = _108 || _110;
    float _114 = _106;
    if (_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (_112)
    {
        out.m_29.x = 0.0;
    }
    if (_112)
    {
        float _118 = _116 * 5.0;
        _86 = as_type<int>(_118);
    }
    int _120 = _86;
    if (_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1258 = as_type<float>(_120);
        out.gl_Position.z = _1258;
    }
    if (_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_33.w;
    float _124 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _126 = in.m_35.w;
    bool _128 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _130 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _132 = _128 || _130;
    bool _134 = isnan(1.0);
    bool _136 = _132 || _134;
    float _138 = in.m_31.x;
    float _140 = in.m_31.y;
    float _142 = in.m_31.z;
    float _144 = in.m_26.x;
    float _146 = in.m_26.y;
    float _148 = in.m_26.z;
    float _150 = 0.0;
    float _152 = _124;
    if (!_136)
    {
        float _154 = _124 * _124;
        float _156 = _154 * 0.5;
        _150 = _156;
    }
    float _158 = _150;
    float _160 = _158;
    if (!_136)
    {
        float _162 = _158 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _160 = _162;
    }
    float _164 = _160;
    out.m_37.w = _122;
    bool _166 = !_136;
    float _168 = _164;
    if (!_166)
    {
        float _170 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _172 = log2(_170);
        float _174 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _176 = _174 + 1.0;
        float _178 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _180 = _124 * _172;
        float _182 = 1.0 / _176;
        float _184 = _178 * 0.693147182464599609375;
        float _186 = exp2(_180);
        float _188 = 1.0 / _184;
        float _190 = _186 + (-1.0);
        float _192 = -_190;
        float _194 = fma(_192, _188, _124);
        float _196 = _194 * _182;
        float _198 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _198;
    }
    float _200 = _168;
    bool _202 = !_136;
    if (!_202)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = 1.0 / _210;
        float _214 = _124 * _206;
        float _216 = exp2(_214);
        float _218 = -_216;
        float _220 = _218 + 1.0;
        float _222 = _220 * _212;
        _152 = _222;
    }
    float _224 = _152;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _230 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _232 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _234 = fma(_224, _138, _228);
    float _236 = fma(_224, _140, _230);
    float _238 = fma(_224, _142, _232);
    float _240 = fma(_234, _126, _144);
    float _242 = fma(_236, _126, _146);
    float _244 = fma(_238, _126, _148);
    bool _246 = !_226;
    float _264;
    if (!_246)
    {
        float _248 = in.m_39.x;
        float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _252 = _248 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _254 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _256 = _254 * _250;
        float _258 = floor(_256);
        float _260 = -_258;
        float _262 = _256 + _260;
        _264 = _262;
        _266 = true;
    }
    else
    {
        float _268 = float(_68);
        float _270 = 1.0 / _268;
        float _272 = _102 * _270;
        _264 = _272;
    }
    _266 = false;
    float _274 = _264;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _278 = _274 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _282 = _280 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _284 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _286 = isnan(_274);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _304 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _306 = isnan(_274);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = 1.0 / _282;
    float _318 = -_294;
    float _320 = _318 + 1.0;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _322;
    bool _326 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _328 = isnan(_274);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = _314 * _320;
    float _340 = -_314;
    float _342 = _340 + 1.0;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _346 = 1.0 / _298;
    float _348 = _336 * _342;
    float _350 = -_336;
    float _352 = _350 + 1.0;
    float _354 = 1.0 / _302;
    float _356 = _324 * _316;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _362 = fma(_356, _278, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _364 = _360 * _346;
    bool _366 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _368 = isnan(_274);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _384 = _274 + _382;
    float _386 = _362 * _348;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _390 = _274 + _388;
    float _392 = -_376;
    float _394 = _392 + 1.0;
    float _396 = fma(_364, _384, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _398 = _380 * _354;
    float _400 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[115].x, _386);
    float _402 = _294 * _394;
    float _404 = fma(_398, _390, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _406 = fma(_396, _338, _400);
    float _408 = fma(_404, _402, _406);
    float _410 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[118].x, _408);
    float _412 = _410 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.w = _412;
    bool _414 = !_344;
    float _432;
    if (!_414)
    {
        float _416 = in.m_39.x;
        float _418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _420 = _416 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _422 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _424 = _422 * _418;
        float _426 = floor(_424);
        float _428 = -_426;
        float _430 = _424 + _428;
        _432 = _430;
        _434 = true;
    }
    else
    {
        float _436 = float(_68);
        float _438 = 1.0 / _436;
        float _440 = _102 * _438;
        _432 = _440;
    }
    _434 = false;
    float _442 = _432;
    bool _444 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _446 = isnan(_442);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _460 = _442 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _462 = isnan(_442);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _478 = _442 + _476;
    float _480 = -_454;
    float _482 = _480 + 1.0;
    float _484 = 1.0 / _458;
    bool _486 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _488 = _470 * _482;
    float _490 = -_470;
    float _492 = _490 + 1.0;
    float _494 = _474 * _484;
    float _496 = fma(_494, _478, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _498 = _496 * _488;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _504 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[131].x, _498);
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _508 = _500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _510 = _502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _512 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[132].x, _504);
    float _514 = _506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = _512 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_43.x = _508;
    out.m_43.y = _510;
    out.m_43.z = _514;
    out.m_43.w = _516;
    bool _518 = !_486;
    float _536;
    if (!_518)
    {
        float _520 = in.m_39.x;
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _524 = _520 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[14].y, _102);
        float _528 = _526 * _522;
        float _530 = floor(_528);
        float _532 = -_530;
        float _534 = _528 + _532;
        _536 = _534;
        _538 = true;
    }
    else
    {
        float _540 = float(_68);
        float _542 = 1.0 / _540;
        float _544 = _102 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = in.m_39.w;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _552 = _546 + _550;
    float _554 = in.m_45.x;
    float _556 = in.m_45.y;
    float _558 = in.m_45.z;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _562 = _560 != 0;
    float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _566 = in.m_33.y;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _572 = in.m_35.x;
    float _574 = in.m_35.y;
    float _576 = in.m_35.z;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _582 = 1.0 / _570;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _586 = _584 != 0;
    float _588 = in.m_33.x;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _592 = _590 != 0;
    float _594 = _242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _596 = 1.0 / _580;
    bool _598 = _548 > 0.5;
    float _600 = _242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _602 = _242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _608 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _594);
    float _610 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _600);
    float _612 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _602);
    float _614 = 1.0 / _606;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _554);
    float _622 = _574 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _628 = -_566;
    float _630 = _628 + 1.0;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _636 = 1.0 / _626;
    float _638 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].z, _610);
    float _640 = _566;
    if (_592)
    {
        float _642 = _598 ? _630 : _566;
        _640 = _642;
    }
    float _644 = _640;
    float _646 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].z, _608);
    float _648 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].z, _612);
    float _650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _556);
    float _652 = 1.0 / _618;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _558);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _664;
    float _668 = 0.0;
    if (_586)
    {
        float _670 = in.m_39.z;
        _668 = _670;
    }
    float _672 = _668;
    float _674 = _660 * _596;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _680 = 1.0 / _634;
    float _682 = _572 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _692 = _678 * _614;
    float _694 = _622 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _696 = _656 * _582;
    float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _700 = _686 * _652;
    float _702 = _694 * _650;
    float _704 = _666 * _636;
    float _706 = _694;
    if (!_562)
    {
        float _708 = in.m_39.z;
        _706 = _708;
    }
    float _710 = _706;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _716 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _718 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _720 = isnan(_546);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = _576 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _732 = 1.0 / _714;
    float _734 = _716 * _620;
    bool _736 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _738 = isnan(_546);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _750 = _672 > 0.5;
    bool _752 = _750 && _586;
    float _754 = _690 * _680;
    float _756 = _698 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _758 = -_746;
    float _760 = _758 + 1.0;
    float _762 = _748 * _662;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _764;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _770 = _546 + _768;
    float _772 = fma(_756, _644, -0.5);
    bool _774 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _776 = isnan(_546);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _788 = _546 + _786;
    float _790 = fma(_696, _770, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _792 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _794 = isnan(_546);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _806 = _546 + _804;
    float _808 = _766 * _732;
    float _810 = -_784;
    float _812 = _810 + 1.0;
    bool _814 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _816 = isnan(_546);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = -_802;
    float _828 = _826 + 1.0;
    float _830 = fma(_674, _806, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    bool _832 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _834 = isnan(_546);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = _802 * _812;
    float _846 = _728 * _828;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _850 = _546 + _848;
    float _852 = -_728;
    float _854 = _852 + 1.0;
    float _856 = -_842;
    float _858 = _856 + 1.0;
    float _860 = _802;
    if (!_562)
    {
        float _862 = in.m_39.y;
        _860 = _862;
    }
    float _864 = _860;
    float _866 = fma(_700, _850, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _868 = _842 * _760;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _872 = _546 + _870;
    float _874 = _746 * _854;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _878 = _546 + _876;
    bool _880 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _882 = isnan(_546);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = fma(_704, _872, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _894 = _872;
    float _896 = _890;
    float _898 = _710;
    if (!_562)
    {
        _894 = _710;
    }
    float _900 = _894;
    float _902 = fma(_692, _878, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _904 = _824 * _858;
    bool _906 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _908 = isnan(_546);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = -_890;
    float _920 = _918 + 1.0;
    float _922 = 0.0;
    if (_586)
    {
        _922 = _588;
    }
    float _924 = _922;
    float _926 = _864;
    float _928 = _900;
    float _930 = _924;
    if (_562)
    {
        float _932 = in.m_39.x;
        float _934 = in.m_39.y;
        _926 = _932;
        _928 = _934;
    }
    float _936 = _926;
    float _938 = _928;
    float _940 = -_824;
    float _942 = _940 + 1.0;
    float _944 = _916 * _920;
    float _946 = fma(_754, _788, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    if (_752)
    {
        float _948 = -_924;
        float _950 = _948 + 1.0;
        _930 = _950;
    }
    float _952 = _930;
    float _954 = _890 * _942;
    if (!_586)
    {
        _896 = _588;
    }
    float _956 = _896;
    float _958 = fma(_808, _552, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _960 = _790 * _944;
    float _962 = _702 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _964 = _702 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _966 = _702 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _968 = _956;
    if (_586)
    {
        _968 = _952;
    }
    float _970 = _968;
    float _972 = -_916;
    float _974 = _972 + 1.0;
    float _976 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[24].x, _962);
    float _978 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[25].x, _964);
    float _980 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[26].x, _966);
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[167].x, _960);
    float _986 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[25].z, _978);
    float _988 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[83].z, _982);
    float _990 = _936 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_562)
    {
        _898 = _938;
    }
    float _994 = _898;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _998 = _938 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1002 = _564 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1004 = fma(_830, _954, _984);
    float _1006 = fma(_998, -2.0, _996);
    float _1008 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1000);
    float _1010 = fma(_1002, _970, -0.5);
    float _1012 = fma(_866, _904, _1004);
    float _1014 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1006);
    float _1016 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1008);
    float _1018 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[24].z, _976);
    float _1020 = _646 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1022 = _986 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1024 = -_1014;
    float _1026 = fma(_1016, _772, _1024);
    float _1028 = fma(_902, _868, _1012);
    float _1030 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[26].z, _980);
    float _1032 = _638 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1034 = _1018 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1036 = _1020 + _1022;
    float _1038 = fma(_892, _874, _1028);
    float _1040 = _648 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1042 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1044 = _1032 + _1034;
    float _1046 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1048 = -_992;
    float _1050 = fma(_990, 2.0, _1048);
    float _1052 = fma(_946, _846, _1038);
    float _1054 = _1040 + _1042;
    float _1056 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1058 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1046);
    float _1060 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1062 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _988);
    float _1064 = -_102;
    float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1050);
    float _1068 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1070 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1056);
    float _1072 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1058);
    float _1074 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1060);
    float _1076 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1068);
    float _1078 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1070);
    float _1080 = _1072 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1082 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1074);
    float _1084 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1076);
    float _1086 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1088 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1090 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1092 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1094 = _1080 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1096 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1098 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1088);
    float _1100 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1090);
    float _1102 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1092);
    float _1104 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1094);
    float _1106 = fma(_1062, _1010, _1066);
    float _1108 = fma(_958, _844, _1052);
    float _1110 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1098);
    float _1112 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1100);
    float _1114 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1102);
    float _1116 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1104);
    float _1118 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1120 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1108);
    float _1122 = _1106 + 0.5;
    float _1124 = _1026 + 0.5;
    float _1126 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1110);
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1112);
    float _1130 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1114);
    float _1132 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1116);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.z = _1122;
    out.m_47.w = _1124;
    out.m_49.x = _1120;
    out.gl_Position.x = _1126;
    out.gl_Position.y = _1128;
    out.gl_Position.z = _1130;
    out.gl_Position.w = _1132;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

