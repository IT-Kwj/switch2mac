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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_47 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_49 [[attribute(5)]];
    float4 m_41 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
    float4 m_43 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1082 = false;
    bool _556 = false;
    bool _266 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_32.w;
    float _67 = trunc(_65);
    int _70 = int(_67);
    bool _74 = _70 >= 1;
    float _76 = 0.0;
    if (!_74)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _76;
    float _80 = _78;
    if (!_74)
    {
        out.m_35.x = 0.0;
    }
    int _82 = 0;
    if (!_74)
    {
        float _84 = _78 * 5.0;
        _82 = as_type<int>(_84);
    }
    int _86 = _82;
    int _88 = _86;
    if (!_74)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1515 = as_type<float>(_86);
        out.gl_Position.z = _1515;
    }
    if (!_74)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _90 = in.m_37.w;
    bool _92 = _90 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _94 = isnan(_90);
    bool _96 = _92 || _94;
    bool _98 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _100 = _96 || _98;
    float _102 = -_90;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_100)
    {
        float _106 = float(_70);
        _80 = _106;
    }
    float _108 = _80;
    bool _110 = _104 >= _108;
    bool _112 = !_100;
    bool _114 = _110 || _112;
    float _116 = _108;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (_114)
    {
        out.m_35.x = 0.0;
    }
    if (_114)
    {
        float _120 = _118 * 5.0;
        _88 = as_type<int>(_120);
    }
    int _122 = _88;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1584 = as_type<float>(_122);
        out.gl_Position.z = _1584;
    }
    if (_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_39.w;
    float _126 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _128 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _130 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _132 = _128 || _130;
    bool _134 = isnan(1.0);
    bool _136 = _132 || _134;
    float _138 = in.m_37.x;
    float _140 = in.m_37.y;
    float _142 = in.m_37.z;
    float _144 = in.m_32.x;
    float _146 = in.m_32.y;
    float _148 = in.m_32.z;
    float _150 = 0.0;
    float _152 = _126;
    if (!_136)
    {
        float _154 = _126 * _126;
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
    bool _166 = !_136;
    float _168 = _164;
    if (!_166)
    {
        float _170 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _172 = log2(_170);
        float _174 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _176 = _174 + 1.0;
        float _178 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _180 = _126 * _172;
        float _182 = 1.0 / _176;
        float _184 = _178 * 0.693147182464599609375;
        float _186 = exp2(_180);
        float _188 = 1.0 / _184;
        float _190 = _186 + (-1.0);
        float _192 = -_190;
        float _194 = fma(_192, _188, _126);
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
        float _214 = _126 * _206;
        float _216 = exp2(_214);
        float _218 = -_216;
        float _220 = _218 + 1.0;
        float _222 = _220 * _212;
        _152 = _222;
    }
    float _224 = _152;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _228 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _230 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _232 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _234 = fma(_224, _138, _228);
    float _236 = fma(_224, _140, _230);
    float _238 = fma(_224, _142, _232);
    float _240 = fma(_234, _124, _144);
    float _242 = fma(_236, _124, _146);
    float _244 = fma(_238, _124, _148);
    bool _246 = !_226;
    float _264;
    if (!_246)
    {
        float _248 = in.m_41.x;
        float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _252 = _248 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _254 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[12].x, _104);
        float _256 = _254 * _250;
        float _258 = floor(_256);
        float _260 = -_258;
        float _262 = _256 + _260;
        _264 = _262;
        _266 = true;
    }
    else
    {
        float _268 = float(_70);
        float _270 = 1.0 / _268;
        float _272 = _104 * _270;
        _264 = _272;
    }
    _266 = false;
    float _274 = _264;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = _274 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _282 = _274 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = _274 + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _304 = 1.0 / _290;
    bool _306 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _308 = isnan(_274);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    bool _318 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_274);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = 1.0 / _294;
    float _332 = -_328;
    float _334 = _332 + 1.0;
    bool _336 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _338 = 1.0 / _298;
    float _340 = _278 * _304;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _344 = _274 + _342;
    float _346 = 1.0 / _302;
    float _348 = _282 * _330;
    bool _350 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _352 = isnan(_274);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -_360;
    float _364 = _362 + 1.0;
    float _366 = _286 * _338;
    float _368 = _344 * _346;
    bool _370 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _372 = isnan(_274);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = _380 * _364;
    float _388 = -_380;
    float _390 = _388 + 1.0;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _396;
    float _400 = fma(_384, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _402 = _316 * _390;
    float _404 = -_316;
    float _406 = _404 + 1.0;
    float _408 = fma(_394, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _410 = fma(_398, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _412 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _414 = isnan(_274);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = _328 * _406;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _438 = _422 * _334;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _440;
    float _444 = fma(_432, _348, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _446 = fma(_436, _348, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _448 = _408 * _438;
    float _450 = _410 * _438;
    float _452 = _400 * _438;
    float _454 = -_422;
    float _456 = _454 + 1.0;
    float _458 = in.m_39.x;
    float _460 = in.m_39.y;
    float _462 = in.m_39.z;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _468;
    float _472 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].x, _448);
    float _474 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].y, _450);
    float _476 = fma(_428, _348, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _478 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].z, _452);
    float _480 = fma(_466, _366, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _482 = fma(_442, _366, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _484 = fma(_470, _366, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _486 = fma(_444, _424, _472);
    float _488 = fma(_446, _424, _474);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _502 = fma(_476, _424, _478);
    float _504 = fma(_492, _368, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _506 = fma(_496, _368, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _508 = fma(_482, _402, _488);
    float _510 = fma(_500, _368, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _512 = fma(_480, _402, _486);
    float _514 = fma(_484, _402, _502);
    float _516 = fma(_506, _386, _508);
    float _518 = fma(_504, _386, _512);
    float _520 = fma(_510, _386, _514);
    float _522 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[147].y, _516);
    float _524 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[147].x, _518);
    float _526 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[147].z, _520);
    float _528 = _522 * _460;
    float _530 = _524 * _458;
    float _532 = _526 * _462;
    bool _534 = !_336;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _554;
    if (!_534)
    {
        float _538 = in.m_41.x;
        float _540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _542 = _538 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[11].y, _104);
        float _546 = _544 * _540;
        float _548 = floor(_546);
        float _550 = -_548;
        float _552 = _546 + _550;
        _554 = _552;
        _556 = true;
    }
    else
    {
        float _558 = float(_70);
        float _560 = 1.0 / _558;
        float _562 = _104 * _560;
        _554 = _562;
    }
    _556 = false;
    float _564 = _554;
    float _566 = in.m_41.w;
    float _568 = _242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _572 = _570 != 0;
    float _574 = _242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _576 = _242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _582 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _568);
    float _584 = in.m_43.y;
    float _586 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _574);
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _590 = _588 != 0;
    float _592 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _576);
    float _594 = 1.0 / _580;
    float _596 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].z, _582);
    float _598 = _480;
    float _600 = _584;
    if (_572)
    {
        float _602 = in.m_41.z;
        _598 = _602;
    }
    float _604 = _598;
    float _606 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].z, _586);
    float _608 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].z, _592);
    float _610 = _596 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _612 = in.m_43.x;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _618 = _606 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _620 = _608 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _622 = _566 > 0.5;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _624;
    float _628 = 1.0 / _616;
    float _630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _632 = _618 + _630;
    bool _634 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _636 = isnan(_564);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = _626 * _594;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _650 = _564 + _648;
    float _652 = _632 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _654 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _656 = isnan(_564);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -_644;
    float _668 = _666 + 1.0;
    float _670 = fma(_646, _650, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _674 = _610 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _678 = _620 + _676;
    float _680 = -_664;
    float _682 = _680 + 1.0;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _688 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[28].x, _652);
    bool _690 = _604 > 0.5;
    bool _692 = _690 && _572;
    float _694 = -_584;
    float _696 = _694 + 1.0;
    bool _698 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _700 = isnan(_564);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[28].z, _688);
    float _712 = _664 * _668;
    float _714 = _686 * _628;
    float _716 = _632 * _632;
    float _718 = _708 * _682;
    float _720 = _628;
    float _722 = _670;
    if (_590)
    {
        float _724 = _622 ? _696 : _584;
        _600 = _724;
    }
    float _726 = _600;
    float _728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_572)
    {
        _720 = _612;
    }
    float _730 = _720;
    float _732 = _670 * _718;
    bool _734 = _710 >= 0.0;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _738 = _564 + _736;
    float _740 = -_708;
    float _742 = _740 + 1.0;
    float _744 = fma(_674, _674, _716);
    float _746 = _730;
    float _748 = _742;
    if (_692)
    {
        float _750 = -_730;
        float _752 = _750 + 1.0;
        _746 = _752;
    }
    float _754 = _746;
    float _756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _758 = fma(_714, _738, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _760 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[115].x, _732);
    float _762 = fma(_678, _678, _744);
    if (!_572)
    {
        _722 = _612;
    }
    float _764 = _722;
    float _766 = _764;
    if (_572)
    {
        _766 = _754;
    }
    float _768 = _766;
    float _770 = fma(_758, _712, _760);
    float _772 = rsqrt(_762);
    float _774 = _726 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_734)
    {
        _748 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _776 = _748;
    float _778 = _768 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _780 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[117].x, _770);
    if (_734)
    {
        out.m_35.x = 0.0;
    }
    if (_734)
    {
        float _782 = _776 * 5.0;
        _536 = as_type<int>(_782);
    }
    int _784 = _536;
    float _786 = _774 * _756;
    float _788 = _778 * _728;
    float _790 = _780 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_734)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2670 = as_type<float>(_784);
        out.gl_Position.z = _2670;
    }
    out.m_45.z = _788;
    out.m_45.w = _786;
    float _792 = _632 * _772;
    float _794 = _674 * _772;
    out.m_47.w = _790;
    if (_734)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _796 = -_792;
    float _798 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _618);
    float _800 = _678 * _772;
    float _802 = -_794;
    float _804 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[18].w, _610);
    float _806 = -_792;
    float _808 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[18].w, _632);
    float _810 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _812 = _798 + _810;
    float _814 = -_800;
    float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[18].w, _620);
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _820 = _804 + _818;
    float _822 = -_794;
    float _824 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[18].w, _674);
    float _826 = _812 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _830 = _816 + _828;
    float _832 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[28].x, _826);
    float _834 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[28].z, _832);
    bool _836 = _834 >= 0.0;
    float _838 = _808 * _808;
    float _840 = -_800;
    float _842 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _844 = fma(_824, _824, _838);
    float _846 = fma(_842, _842, _844);
    float _848 = _826;
    if (_836)
    {
        _848 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _850 = _848;
    int _852 = as_type<int>(_850);
    if (_836)
    {
        out.m_35.x = 0.0;
    }
    if (_836)
    {
        float _854 = _850 * 5.0;
        _852 = as_type<int>(_854);
    }
    int _856 = _852;
    if (_836)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2805 = as_type<float>(_856);
        out.gl_Position.z = _2805;
    }
    if (_836)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _858 = in.m_49.x;
    float _860 = in.m_49.y;
    float _862 = in.m_49.z;
    float _864 = sqrt(_846);
    float _866 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _868 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _870 = _772 * _864;
    float _872 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _874 = _870 * _866;
    float _876 = _870 * _872;
    float _878 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _860);
    float _880 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _858);
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _862);
    float _884 = _878 * _876;
    float _886 = _880 * _874;
    float _888 = _870 * _868;
    float _890 = _884 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _892 = _884 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _894 = _882 * _888;
    float _896 = _884 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _898 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[24].x, _890);
    float _900 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[26].x, _892);
    float _902 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[25].x, _896);
    float _904 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[24].z, _898);
    float _906 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[26].z, _900);
    float _908 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[25].z, _902);
    float _910 = _904 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _912 = _906 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _914 = _908 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _916 = _610 + _910;
    float _918 = _620 + _912;
    float _920 = _618 + _914;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _924 = _916 + _922;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _928 = _918 + _926;
    float _930 = _924 * _924;
    float _932 = _928 * _928;
    float _934 = _930 + _932;
    float _936 = sqrt(_934);
    bool _938 = _936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _940 = _914;
    float _942 = _930;
    float _944 = _908;
    float _946 = _894;
    float _948 = _932;
    if (!_938)
    {
        _940 = _930;
    }
    float _950 = _940;
    float _952 = _950;
    if (!_938)
    {
        _942 = _916;
    }
    float _954 = _942;
    float _956 = _954;
    if (!_938)
    {
        _944 = _918;
    }
    float _958 = _944;
    float _960 = _958;
    if (!_938)
    {
        _946 = _920;
    }
    float _962 = _946;
    bool _964 = !_938;
    float _966 = _962;
    if (!_964)
    {
        float _968 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _972 = _936 + _970;
        float _974 = rsqrt(_934);
        float _976 = _972 * _968;
        float _978 = _920 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _980 = _976 * 0.15915493667125701904296875;
        float _982 = _980 * 6.283185482025146484375;
        float _984 = sin(_982);
        float _986 = _980 * 6.283185482025146484375;
        float _988 = cos(_986);
        float _990 = fma(_984, _978, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _992 = _974 * _990;
        float _994 = _988 + (-1.0);
        float _996 = fma(_924, _992, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _998 = fma(_928, _992, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1000 = _994 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1004 = _996 + _1002;
        float _1006 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1008 = _998 + _1006;
        float _1010 = fma(_920, _988, _1000);
        float _1012 = _1004 * _1004;
        float _1014 = _1008 * _1008;
        _966 = _1010;
        _952 = _1012;
        _948 = _1014;
        _956 = _996;
        _960 = _998;
    }
    float _1016 = _966;
    float _1018 = _952;
    float _1020 = _948;
    float _1022 = _956;
    float _1024 = _960;
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1028 = _1016 + _1026;
    float _1030 = fma(_1028, _1028, _1018);
    float _1032 = _1030 + _1020;
    float _1034 = sqrt(_1032);
    bool _1036 = _1034 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1038 = isnan(_1034);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1044 = _1040 || _1042;
    float _1046 = _1030;
    if (!_1044)
    {
        _1046 = 1.0;
    }
    float _1048 = _1046;
    bool _1050 = !_1044;
    float _1052 = _1048;
    if (!_1050)
    {
        bool _1054 = _1034 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1056 = isnan(_1034);
        bool _1058 = _1054 || _1056;
        bool _1060 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1062 = _1058 || _1060;
        if (!_1062)
        {
            float _1064 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1066 = _1034 + _1064;
            float _1068 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1070 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1068;
            float _1072 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1074 = _1072 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1076 = 1.0 / _1070;
            float _1078 = _1066 * _1076;
            float _1080 = fma(_1078, _1074, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1052 = _1080;
            _1082 = true;
        }
        else
        {
            bool _1084 = _1034 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1086 = isnan(_1034);
            bool _1088 = _1084 || _1086;
            bool _1090 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1092 = _1088 || _1090;
            if (!_1092)
            {
                float _1094 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1096 = _1034 + _1094;
                float _1098 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1100 = _1098 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1102 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1104 = _1102 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1106 = 1.0 / _1100;
                float _1108 = _1096 * _1106;
                float _1110 = fma(_1108, _1104, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1052 = _1110;
                _1082 = true;
            }
            else
            {
                _1052 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1082 = false;
    float _1112 = _1052;
    float _1114 = _798 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1116 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1118 = _1022 + _1116;
    float _1120 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1122 = _1024 + _1120;
    float _1124 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1114);
    bool _1126 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan(0.5);
    bool _1134 = _1130 || _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1138 = _1016 + _1136;
    float _1140 = _798 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1142 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1124);
    float _1144 = fma(_1118, _1112, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1146 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1140);
    float _1148 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1150 = fma(_1138, _1112, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1152 = fma(_1122, _1112, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1154 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1146);
    float _1156 = 1.0 / _1148;
    bool _1158 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan(0.5);
    bool _1166 = _1162 || _1164;
    float _1168 = -_794;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1144);
    float _1172 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1174 = -_792;
    float _1176 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1150);
    float _1178 = -_800;
    float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1152);
    float _1182 = _1172 + _1148;
    float _1184 = _1176;
    float _1186 = _1170;
    float _1188 = _1180;
    if (!_1134)
    {
        float _1190 = _812 * _812;
        float _1192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1194 = -_618;
        float _1196 = _1194 + _1150;
        float _1198 = -_620;
        float _1200 = _1198 + _1152;
        float _1202 = fma(_820, _820, _1190);
        float _1204 = -_610;
        float _1206 = _1204 + _1144;
        float _1208 = fma(_830, _830, _1202);
        float _1210 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1212 = sqrt(_1208);
        float _1214 = 1.0 / _870;
        bool _1216 = _1212 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1218 = isnan(_1212);
        bool _1220 = _1216 || _1218;
        bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1224 = _1220 || _1222;
        float _1226 = precise::min(_1212, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1228 = _1226 * _1192;
        float _1230 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1232 = _1196 * _1214;
        float _1234 = _1200 * _1214;
        float _1236 = _1206 * _1214;
        float _1238 = _812;
        float _1240 = _1210;
        float _1242 = _1228;
        float _1244 = _1230;
        if (_1224)
        {
            float _1246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1238 = _1246;
        }
        float _1248 = _1238;
        if (_1224)
        {
            float _1250 = precise::max(_1212, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1240 = _1250;
        }
        float _1252 = _1240;
        float _1254 = _1230 * _1228;
        float _1256 = fma(_1232, _1254, _798);
        float _1258 = _1254;
        if (_1224)
        {
            float _1260 = _1252 * _1248;
            _1242 = _1260;
        }
        float _1262 = _1242;
        float _1264 = fma(_1234, _1254, _816);
        float _1266 = fma(_1236, _1254, _804);
        float _1268 = _1262;
        float _1270 = _1266;
        if (_1224)
        {
            float _1272 = _1230 * _1262;
            _1258 = _1272;
        }
        float _1274 = _1258;
        if (!_1224)
        {
            _1244 = _1256;
        }
        float _1276 = _1244;
        float _1278 = _1276;
        if (!_1224)
        {
            _1268 = _1264;
        }
        float _1280 = _1268;
        _1188 = _1280;
        if (_1224)
        {
            float _1282 = fma(_1236, _1274, _804);
            _1270 = _1282;
        }
        float _1284 = _1270;
        _1186 = _1284;
        if (_1224)
        {
            float _1286 = fma(_1232, _1274, _798);
            _1278 = _1286;
        }
        float _1288 = _1278;
        _1184 = _1288;
        if (_1224)
        {
            float _1290 = fma(_1234, _1274, _816);
            _1188 = _1290;
        }
    }
    float _1292 = _1184;
    float _1294 = _1186;
    float _1296 = _1188;
    float _1298 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1300 = _1182 * _1156;
    float _1302 = _1300 * 0.5;
    float _1304 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1306 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1308 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1310 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1298);
    float _1312 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1304);
    float _1314 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1306);
    float _1316 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1308);
    float _1318 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1310);
    float _1320 = _1310;
    if (_1166)
    {
        _1320 = 1.0;
    }
    float _1322 = _1320;
    float _1324 = _1322;
    if (!_1166)
    {
        float _1326 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1330 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1328);
        float _1332 = _1326 * 0.15915493667125701904296875;
        float _1334 = _1332 * 6.283185482025146484375;
        float _1336 = cos(_1334);
        float _1338 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1340 = _1338 * 0.15915493667125701904296875;
        float _1342 = _1332 * 6.283185482025146484375;
        float _1344 = sin(_1342);
        float _1346 = 1.0 / _1336;
        float _1348 = _1340 * 6.283185482025146484375;
        float _1350 = cos(_1348);
        float _1352 = _1344 * _1346;
        float _1354 = 1.0 / _1330;
        float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1358 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1356;
        float _1360 = _1350 * _1352;
        float _1362 = _1340 * 6.283185482025146484375;
        float _1364 = sin(_1362);
        float _1366 = 1.0 / _1360;
        float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1370 = _1354 * _1368;
        float _1372 = 1.0 / _1358;
        float _1374 = _1364 * _1366;
        float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1378 = fma(_1374, _1370, _1376);
        float _1380 = _1378 * _1372;
        float _1382 = precise::clamp(_1380, 0.0, 1.0);
        _1324 = _1382;
    }
    float _1384 = _1324;
    float _1386 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1312);
    float _1388 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1390 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1314);
    float _1392 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1316);
    float _1394 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1398 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1400 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1402 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1404 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1406 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1396);
    float _1408 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1398);
    float _1410 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1400);
    float _1412 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1402);
    float _1414 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1416 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1406);
    float _1418 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1408);
    float _1420 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1410);
    float _1422 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1412);
    bool _1424 = _1384 > 0.0;
    bool _1426 = isnan(_1384);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan(0.0);
    bool _1432 = _1428 || _1430;
    float _1434 = _1384 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1436 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1416);
    float _1438 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1418);
    float _1440 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1422);
    float _1442 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1420);
    float _1444 = _1434 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1446 = _1436 + _1440;
    float _1448 = _1442 + _1440;
    float _1450 = _1440 * 0.5;
    float _1452 = _1446 * 0.5;
    float _1454 = _1448 * 0.5;
    float _1456 = fma(_1438, -0.5, _1450);
    out.m_35.x = _1444;
    out.gl_Position.x = _1436;
    out.gl_Position.y = _1438;
    out.gl_Position.z = _1442;
    out.gl_Position.w = _1440;
    out.m_51.x = _1452;
    out.m_51.y = _1456;
    out.m_51.z = _1454;
    out.m_51.w = _1440;
    if (_1432)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1458 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1458;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1082 = false;
    bool _556 = false;
    bool _266 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_32.w;
    float _67 = trunc(_65);
    int _70 = int(_67);
    bool _74 = _70 >= 1;
    float _76 = 0.0;
    if (!_74)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _76;
    float _80 = _78;
    if (!_74)
    {
        out.m_35.x = 0.0;
    }
    int _82 = 0;
    if (!_74)
    {
        float _84 = _78 * 5.0;
        _82 = as_type<int>(_84);
    }
    int _86 = _82;
    int _88 = _86;
    if (!_74)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1515 = as_type<float>(_86);
        out.gl_Position.z = _1515;
    }
    if (!_74)
    {
        return out;
    }
    float _90 = in.m_37.w;
    bool _92 = _90 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _94 = isnan(_90);
    bool _96 = _92 || _94;
    bool _98 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _100 = _96 || _98;
    float _102 = -_90;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_100)
    {
        float _106 = float(_70);
        _80 = _106;
    }
    float _108 = _80;
    bool _110 = _104 >= _108;
    bool _112 = !_100;
    bool _114 = _110 || _112;
    float _116 = _108;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (_114)
    {
        out.m_35.x = 0.0;
    }
    if (_114)
    {
        float _120 = _118 * 5.0;
        _88 = as_type<int>(_120);
    }
    int _122 = _88;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1584 = as_type<float>(_122);
        out.gl_Position.z = _1584;
    }
    if (_114)
    {
        return out;
    }
    float _124 = in.m_39.w;
    float _126 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _128 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _130 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _132 = _128 || _130;
    bool _134 = isnan(1.0);
    bool _136 = _132 || _134;
    float _138 = in.m_37.x;
    float _140 = in.m_37.y;
    float _142 = in.m_37.z;
    float _144 = in.m_32.x;
    float _146 = in.m_32.y;
    float _148 = in.m_32.z;
    float _150 = 0.0;
    float _152 = _126;
    if (!_136)
    {
        float _154 = _126 * _126;
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
    bool _166 = !_136;
    float _168 = _164;
    if (!_166)
    {
        float _170 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _172 = log2(_170);
        float _174 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _176 = _174 + 1.0;
        float _178 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _180 = _126 * _172;
        float _182 = 1.0 / _176;
        float _184 = _178 * 0.693147182464599609375;
        float _186 = exp2(_180);
        float _188 = 1.0 / _184;
        float _190 = _186 + (-1.0);
        float _192 = -_190;
        float _194 = fma(_192, _188, _126);
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
        float _214 = _126 * _206;
        float _216 = exp2(_214);
        float _218 = -_216;
        float _220 = _218 + 1.0;
        float _222 = _220 * _212;
        _152 = _222;
    }
    float _224 = _152;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _228 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _230 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _232 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _234 = fma(_224, _138, _228);
    float _236 = fma(_224, _140, _230);
    float _238 = fma(_224, _142, _232);
    float _240 = fma(_234, _124, _144);
    float _242 = fma(_236, _124, _146);
    float _244 = fma(_238, _124, _148);
    bool _246 = !_226;
    float _264;
    if (!_246)
    {
        float _248 = in.m_41.x;
        float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _252 = _248 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _254 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[12].x, _104);
        float _256 = _254 * _250;
        float _258 = floor(_256);
        float _260 = -_258;
        float _262 = _256 + _260;
        _264 = _262;
        _266 = true;
    }
    else
    {
        float _268 = float(_70);
        float _270 = 1.0 / _268;
        float _272 = _104 * _270;
        _264 = _272;
    }
    _266 = false;
    float _274 = _264;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = _274 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _282 = _274 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = _274 + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _304 = 1.0 / _290;
    bool _306 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _308 = isnan(_274);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    bool _318 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_274);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = 1.0 / _294;
    float _332 = -_328;
    float _334 = _332 + 1.0;
    bool _336 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _338 = 1.0 / _298;
    float _340 = _278 * _304;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _344 = _274 + _342;
    float _346 = 1.0 / _302;
    float _348 = _282 * _330;
    bool _350 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _352 = isnan(_274);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -_360;
    float _364 = _362 + 1.0;
    float _366 = _286 * _338;
    float _368 = _344 * _346;
    bool _370 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _372 = isnan(_274);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = _380 * _364;
    float _388 = -_380;
    float _390 = _388 + 1.0;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _396;
    float _400 = fma(_384, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _402 = _316 * _390;
    float _404 = -_316;
    float _406 = _404 + 1.0;
    float _408 = fma(_394, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _410 = fma(_398, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _412 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _414 = isnan(_274);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = _328 * _406;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _438 = _422 * _334;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _440;
    float _444 = fma(_432, _348, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _446 = fma(_436, _348, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _448 = _408 * _438;
    float _450 = _410 * _438;
    float _452 = _400 * _438;
    float _454 = -_422;
    float _456 = _454 + 1.0;
    float _458 = in.m_39.x;
    float _460 = in.m_39.y;
    float _462 = in.m_39.z;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _468;
    float _472 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].x, _448);
    float _474 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].y, _450);
    float _476 = fma(_428, _348, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _478 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].z, _452);
    float _480 = fma(_466, _366, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _482 = fma(_442, _366, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _484 = fma(_470, _366, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _486 = fma(_444, _424, _472);
    float _488 = fma(_446, _424, _474);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _502 = fma(_476, _424, _478);
    float _504 = fma(_492, _368, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _506 = fma(_496, _368, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _508 = fma(_482, _402, _488);
    float _510 = fma(_500, _368, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _512 = fma(_480, _402, _486);
    float _514 = fma(_484, _402, _502);
    float _516 = fma(_506, _386, _508);
    float _518 = fma(_504, _386, _512);
    float _520 = fma(_510, _386, _514);
    float _522 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[147].y, _516);
    float _524 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[147].x, _518);
    float _526 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[147].z, _520);
    float _528 = _522 * _460;
    float _530 = _524 * _458;
    float _532 = _526 * _462;
    bool _534 = !_336;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _554;
    if (!_534)
    {
        float _538 = in.m_41.x;
        float _540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _542 = _538 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[11].y, _104);
        float _546 = _544 * _540;
        float _548 = floor(_546);
        float _550 = -_548;
        float _552 = _546 + _550;
        _554 = _552;
        _556 = true;
    }
    else
    {
        float _558 = float(_70);
        float _560 = 1.0 / _558;
        float _562 = _104 * _560;
        _554 = _562;
    }
    _556 = false;
    float _564 = _554;
    float _566 = in.m_41.w;
    float _568 = _242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _572 = _570 != 0;
    float _574 = _242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _576 = _242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _582 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _568);
    float _584 = in.m_43.y;
    float _586 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _574);
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _590 = _588 != 0;
    float _592 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _576);
    float _594 = 1.0 / _580;
    float _596 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].z, _582);
    float _598 = _480;
    float _600 = _584;
    if (_572)
    {
        float _602 = in.m_41.z;
        _598 = _602;
    }
    float _604 = _598;
    float _606 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].z, _586);
    float _608 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].z, _592);
    float _610 = _596 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _612 = in.m_43.x;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _618 = _606 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _620 = _608 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _622 = _566 > 0.5;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _624;
    float _628 = 1.0 / _616;
    float _630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _632 = _618 + _630;
    bool _634 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _636 = isnan(_564);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = _626 * _594;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _650 = _564 + _648;
    float _652 = _632 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _654 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _656 = isnan(_564);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -_644;
    float _668 = _666 + 1.0;
    float _670 = fma(_646, _650, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _674 = _610 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _678 = _620 + _676;
    float _680 = -_664;
    float _682 = _680 + 1.0;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _688 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[28].x, _652);
    bool _690 = _604 > 0.5;
    bool _692 = _690 && _572;
    float _694 = -_584;
    float _696 = _694 + 1.0;
    bool _698 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _700 = isnan(_564);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[28].z, _688);
    float _712 = _664 * _668;
    float _714 = _686 * _628;
    float _716 = _632 * _632;
    float _718 = _708 * _682;
    float _720 = _628;
    float _722 = _670;
    if (_590)
    {
        float _724 = _622 ? _696 : _584;
        _600 = _724;
    }
    float _726 = _600;
    float _728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_572)
    {
        _720 = _612;
    }
    float _730 = _720;
    float _732 = _670 * _718;
    bool _734 = _710 >= 0.0;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _738 = _564 + _736;
    float _740 = -_708;
    float _742 = _740 + 1.0;
    float _744 = fma(_674, _674, _716);
    float _746 = _730;
    float _748 = _742;
    if (_692)
    {
        float _750 = -_730;
        float _752 = _750 + 1.0;
        _746 = _752;
    }
    float _754 = _746;
    float _756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _758 = fma(_714, _738, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _760 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[115].x, _732);
    float _762 = fma(_678, _678, _744);
    if (!_572)
    {
        _722 = _612;
    }
    float _764 = _722;
    float _766 = _764;
    if (_572)
    {
        _766 = _754;
    }
    float _768 = _766;
    float _770 = fma(_758, _712, _760);
    float _772 = rsqrt(_762);
    float _774 = _726 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_734)
    {
        _748 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _776 = _748;
    float _778 = _768 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _780 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[117].x, _770);
    if (_734)
    {
        out.m_35.x = 0.0;
    }
    if (_734)
    {
        float _782 = _776 * 5.0;
        _536 = as_type<int>(_782);
    }
    int _784 = _536;
    float _786 = _774 * _756;
    float _788 = _778 * _728;
    float _790 = _780 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_734)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2670 = as_type<float>(_784);
        out.gl_Position.z = _2670;
    }
    out.m_45.z = _788;
    out.m_45.w = _786;
    float _792 = _632 * _772;
    float _794 = _674 * _772;
    out.m_47.w = _790;
    if (_734)
    {
        return out;
    }
    float _796 = -_792;
    float _798 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _618);
    float _800 = _678 * _772;
    float _802 = -_794;
    float _804 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[18].w, _610);
    float _806 = -_792;
    float _808 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[18].w, _632);
    float _810 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _812 = _798 + _810;
    float _814 = -_800;
    float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[18].w, _620);
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _820 = _804 + _818;
    float _822 = -_794;
    float _824 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[18].w, _674);
    float _826 = _812 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _830 = _816 + _828;
    float _832 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[28].x, _826);
    float _834 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[28].z, _832);
    bool _836 = _834 >= 0.0;
    float _838 = _808 * _808;
    float _840 = -_800;
    float _842 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _844 = fma(_824, _824, _838);
    float _846 = fma(_842, _842, _844);
    float _848 = _826;
    if (_836)
    {
        _848 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _850 = _848;
    int _852 = as_type<int>(_850);
    if (_836)
    {
        out.m_35.x = 0.0;
    }
    if (_836)
    {
        float _854 = _850 * 5.0;
        _852 = as_type<int>(_854);
    }
    int _856 = _852;
    if (_836)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2805 = as_type<float>(_856);
        out.gl_Position.z = _2805;
    }
    if (_836)
    {
        return out;
    }
    float _858 = in.m_49.x;
    float _860 = in.m_49.y;
    float _862 = in.m_49.z;
    float _864 = sqrt(_846);
    float _866 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _868 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _870 = _772 * _864;
    float _872 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _874 = _870 * _866;
    float _876 = _870 * _872;
    float _878 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _860);
    float _880 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _858);
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _862);
    float _884 = _878 * _876;
    float _886 = _880 * _874;
    float _888 = _870 * _868;
    float _890 = _884 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _892 = _884 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _894 = _882 * _888;
    float _896 = _884 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _898 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[24].x, _890);
    float _900 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[26].x, _892);
    float _902 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[25].x, _896);
    float _904 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[24].z, _898);
    float _906 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[26].z, _900);
    float _908 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[25].z, _902);
    float _910 = _904 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _912 = _906 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _914 = _908 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _916 = _610 + _910;
    float _918 = _620 + _912;
    float _920 = _618 + _914;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _924 = _916 + _922;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _928 = _918 + _926;
    float _930 = _924 * _924;
    float _932 = _928 * _928;
    float _934 = _930 + _932;
    float _936 = sqrt(_934);
    bool _938 = _936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _940 = _914;
    float _942 = _930;
    float _944 = _908;
    float _946 = _894;
    float _948 = _932;
    if (!_938)
    {
        _940 = _930;
    }
    float _950 = _940;
    float _952 = _950;
    if (!_938)
    {
        _942 = _916;
    }
    float _954 = _942;
    float _956 = _954;
    if (!_938)
    {
        _944 = _918;
    }
    float _958 = _944;
    float _960 = _958;
    if (!_938)
    {
        _946 = _920;
    }
    float _962 = _946;
    bool _964 = !_938;
    float _966 = _962;
    if (!_964)
    {
        float _968 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _972 = _936 + _970;
        float _974 = rsqrt(_934);
        float _976 = _972 * _968;
        float _978 = _920 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _980 = _976 * 0.15915493667125701904296875;
        float _982 = _980 * 6.283185482025146484375;
        float _984 = sin(_982);
        float _986 = _980 * 6.283185482025146484375;
        float _988 = cos(_986);
        float _990 = fma(_984, _978, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _992 = _974 * _990;
        float _994 = _988 + (-1.0);
        float _996 = fma(_924, _992, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _998 = fma(_928, _992, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1000 = _994 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1004 = _996 + _1002;
        float _1006 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1008 = _998 + _1006;
        float _1010 = fma(_920, _988, _1000);
        float _1012 = _1004 * _1004;
        float _1014 = _1008 * _1008;
        _966 = _1010;
        _952 = _1012;
        _948 = _1014;
        _956 = _996;
        _960 = _998;
    }
    float _1016 = _966;
    float _1018 = _952;
    float _1020 = _948;
    float _1022 = _956;
    float _1024 = _960;
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1028 = _1016 + _1026;
    float _1030 = fma(_1028, _1028, _1018);
    float _1032 = _1030 + _1020;
    float _1034 = sqrt(_1032);
    bool _1036 = _1034 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1038 = isnan(_1034);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1044 = _1040 || _1042;
    float _1046 = _1030;
    if (!_1044)
    {
        _1046 = 1.0;
    }
    float _1048 = _1046;
    bool _1050 = !_1044;
    float _1052 = _1048;
    if (!_1050)
    {
        bool _1054 = _1034 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1056 = isnan(_1034);
        bool _1058 = _1054 || _1056;
        bool _1060 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1062 = _1058 || _1060;
        if (!_1062)
        {
            float _1064 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1066 = _1034 + _1064;
            float _1068 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1070 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1068;
            float _1072 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1074 = _1072 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1076 = 1.0 / _1070;
            float _1078 = _1066 * _1076;
            float _1080 = fma(_1078, _1074, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1052 = _1080;
            _1082 = true;
        }
        else
        {
            bool _1084 = _1034 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1086 = isnan(_1034);
            bool _1088 = _1084 || _1086;
            bool _1090 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1092 = _1088 || _1090;
            if (!_1092)
            {
                float _1094 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1096 = _1034 + _1094;
                float _1098 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1100 = _1098 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1102 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1104 = _1102 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1106 = 1.0 / _1100;
                float _1108 = _1096 * _1106;
                float _1110 = fma(_1108, _1104, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1052 = _1110;
                _1082 = true;
            }
            else
            {
                _1052 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1082 = false;
    float _1112 = _1052;
    float _1114 = _798 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1116 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1118 = _1022 + _1116;
    float _1120 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1122 = _1024 + _1120;
    float _1124 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1114);
    bool _1126 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan(0.5);
    bool _1134 = _1130 || _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1138 = _1016 + _1136;
    float _1140 = _798 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1142 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1124);
    float _1144 = fma(_1118, _1112, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1146 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1140);
    float _1148 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1150 = fma(_1138, _1112, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1152 = fma(_1122, _1112, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1154 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1146);
    float _1156 = 1.0 / _1148;
    bool _1158 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan(0.5);
    bool _1166 = _1162 || _1164;
    float _1168 = -_794;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1144);
    float _1172 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1174 = -_792;
    float _1176 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1150);
    float _1178 = -_800;
    float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1152);
    float _1182 = _1172 + _1148;
    float _1184 = _1176;
    float _1186 = _1170;
    float _1188 = _1180;
    if (!_1134)
    {
        float _1190 = _812 * _812;
        float _1192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1194 = -_618;
        float _1196 = _1194 + _1150;
        float _1198 = -_620;
        float _1200 = _1198 + _1152;
        float _1202 = fma(_820, _820, _1190);
        float _1204 = -_610;
        float _1206 = _1204 + _1144;
        float _1208 = fma(_830, _830, _1202);
        float _1210 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1212 = sqrt(_1208);
        float _1214 = 1.0 / _870;
        bool _1216 = _1212 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1218 = isnan(_1212);
        bool _1220 = _1216 || _1218;
        bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1224 = _1220 || _1222;
        float _1226 = precise::min(_1212, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1228 = _1226 * _1192;
        float _1230 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1232 = _1196 * _1214;
        float _1234 = _1200 * _1214;
        float _1236 = _1206 * _1214;
        float _1238 = _812;
        float _1240 = _1210;
        float _1242 = _1228;
        float _1244 = _1230;
        if (_1224)
        {
            float _1246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1238 = _1246;
        }
        float _1248 = _1238;
        if (_1224)
        {
            float _1250 = precise::max(_1212, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1240 = _1250;
        }
        float _1252 = _1240;
        float _1254 = _1230 * _1228;
        float _1256 = fma(_1232, _1254, _798);
        float _1258 = _1254;
        if (_1224)
        {
            float _1260 = _1252 * _1248;
            _1242 = _1260;
        }
        float _1262 = _1242;
        float _1264 = fma(_1234, _1254, _816);
        float _1266 = fma(_1236, _1254, _804);
        float _1268 = _1262;
        float _1270 = _1266;
        if (_1224)
        {
            float _1272 = _1230 * _1262;
            _1258 = _1272;
        }
        float _1274 = _1258;
        if (!_1224)
        {
            _1244 = _1256;
        }
        float _1276 = _1244;
        float _1278 = _1276;
        if (!_1224)
        {
            _1268 = _1264;
        }
        float _1280 = _1268;
        _1188 = _1280;
        if (_1224)
        {
            float _1282 = fma(_1236, _1274, _804);
            _1270 = _1282;
        }
        float _1284 = _1270;
        _1186 = _1284;
        if (_1224)
        {
            float _1286 = fma(_1232, _1274, _798);
            _1278 = _1286;
        }
        float _1288 = _1278;
        _1184 = _1288;
        if (_1224)
        {
            float _1290 = fma(_1234, _1274, _816);
            _1188 = _1290;
        }
    }
    float _1292 = _1184;
    float _1294 = _1186;
    float _1296 = _1188;
    float _1298 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1300 = _1182 * _1156;
    float _1302 = _1300 * 0.5;
    float _1304 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1306 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1308 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1310 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1298);
    float _1312 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1304);
    float _1314 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1306);
    float _1316 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1308);
    float _1318 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1310);
    float _1320 = _1310;
    if (_1166)
    {
        _1320 = 1.0;
    }
    float _1322 = _1320;
    float _1324 = _1322;
    if (!_1166)
    {
        float _1326 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1330 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1328);
        float _1332 = _1326 * 0.15915493667125701904296875;
        float _1334 = _1332 * 6.283185482025146484375;
        float _1336 = cos(_1334);
        float _1338 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1340 = _1338 * 0.15915493667125701904296875;
        float _1342 = _1332 * 6.283185482025146484375;
        float _1344 = sin(_1342);
        float _1346 = 1.0 / _1336;
        float _1348 = _1340 * 6.283185482025146484375;
        float _1350 = cos(_1348);
        float _1352 = _1344 * _1346;
        float _1354 = 1.0 / _1330;
        float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1358 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1356;
        float _1360 = _1350 * _1352;
        float _1362 = _1340 * 6.283185482025146484375;
        float _1364 = sin(_1362);
        float _1366 = 1.0 / _1360;
        float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1370 = _1354 * _1368;
        float _1372 = 1.0 / _1358;
        float _1374 = _1364 * _1366;
        float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1378 = fma(_1374, _1370, _1376);
        float _1380 = _1378 * _1372;
        float _1382 = precise::clamp(_1380, 0.0, 1.0);
        _1324 = _1382;
    }
    float _1384 = _1324;
    float _1386 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1312);
    float _1388 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1390 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1314);
    float _1392 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1316);
    float _1394 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1398 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1400 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1402 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1404 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1406 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1396);
    float _1408 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1398);
    float _1410 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1400);
    float _1412 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1402);
    float _1414 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1416 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1406);
    float _1418 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1408);
    float _1420 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1410);
    float _1422 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1412);
    bool _1424 = _1384 > 0.0;
    bool _1426 = isnan(_1384);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan(0.0);
    bool _1432 = _1428 || _1430;
    float _1434 = _1384 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1436 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1416);
    float _1438 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1418);
    float _1440 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1422);
    float _1442 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1420);
    float _1444 = _1434 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1446 = _1436 + _1440;
    float _1448 = _1442 + _1440;
    float _1450 = _1440 * 0.5;
    float _1452 = _1446 * 0.5;
    float _1454 = _1448 * 0.5;
    float _1456 = fma(_1438, -0.5, _1450);
    out.m_35.x = _1444;
    out.gl_Position.x = _1436;
    out.gl_Position.y = _1438;
    out.gl_Position.z = _1442;
    out.gl_Position.w = _1440;
    out.m_51.x = _1452;
    out.m_51.y = _1456;
    out.m_51.z = _1454;
    out.m_51.w = _1440;
    if (_1432)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1458 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1458;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1082 = false;
    bool _556 = false;
    bool _266 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_32.w;
    float _67 = trunc(_65);
    int _70 = int(_67);
    bool _74 = _70 >= 1;
    float _76 = 0.0;
    if (!_74)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _76;
    float _80 = _78;
    if (!_74)
    {
        out.m_35.x = 0.0;
    }
    int _82 = 0;
    if (!_74)
    {
        float _84 = _78 * 5.0;
        _82 = as_type<int>(_84);
    }
    int _86 = _82;
    int _88 = _86;
    if (!_74)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1515 = as_type<float>(_86);
        out.gl_Position.z = _1515;
    }
    if (!_74)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _90 = in.m_37.w;
    bool _92 = _90 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _94 = isnan(_90);
    bool _96 = _92 || _94;
    bool _98 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _100 = _96 || _98;
    float _102 = -_90;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_100)
    {
        float _106 = float(_70);
        _80 = _106;
    }
    float _108 = _80;
    bool _110 = _104 >= _108;
    bool _112 = !_100;
    bool _114 = _110 || _112;
    float _116 = _108;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (_114)
    {
        out.m_35.x = 0.0;
    }
    if (_114)
    {
        float _120 = _118 * 5.0;
        _88 = as_type<int>(_120);
    }
    int _122 = _88;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1584 = as_type<float>(_122);
        out.gl_Position.z = _1584;
    }
    if (_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_39.w;
    float _126 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _128 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _130 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _132 = _128 || _130;
    bool _134 = isnan(1.0);
    bool _136 = _132 || _134;
    float _138 = in.m_37.x;
    float _140 = in.m_37.y;
    float _142 = in.m_37.z;
    float _144 = in.m_32.x;
    float _146 = in.m_32.y;
    float _148 = in.m_32.z;
    float _150 = 0.0;
    float _152 = _126;
    if (!_136)
    {
        float _154 = _126 * _126;
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
    bool _166 = !_136;
    float _168 = _164;
    if (!_166)
    {
        float _170 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _172 = log2(_170);
        float _174 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _176 = _174 + 1.0;
        float _178 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _180 = _126 * _172;
        float _182 = 1.0 / _176;
        float _184 = _178 * 0.693147182464599609375;
        float _186 = exp2(_180);
        float _188 = 1.0 / _184;
        float _190 = _186 + (-1.0);
        float _192 = -_190;
        float _194 = fma(_192, _188, _126);
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
        float _214 = _126 * _206;
        float _216 = exp2(_214);
        float _218 = -_216;
        float _220 = _218 + 1.0;
        float _222 = _220 * _212;
        _152 = _222;
    }
    float _224 = _152;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _228 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _230 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _232 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _234 = fma(_224, _138, _228);
    float _236 = fma(_224, _140, _230);
    float _238 = fma(_224, _142, _232);
    float _240 = fma(_234, _124, _144);
    float _242 = fma(_236, _124, _146);
    float _244 = fma(_238, _124, _148);
    bool _246 = !_226;
    float _264;
    if (!_246)
    {
        float _248 = in.m_41.x;
        float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _252 = _248 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _254 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[12].x, _104);
        float _256 = _254 * _250;
        float _258 = floor(_256);
        float _260 = -_258;
        float _262 = _256 + _260;
        _264 = _262;
        _266 = true;
    }
    else
    {
        float _268 = float(_70);
        float _270 = 1.0 / _268;
        float _272 = _104 * _270;
        _264 = _272;
    }
    _266 = false;
    float _274 = _264;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = _274 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _282 = _274 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = _274 + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _304 = 1.0 / _290;
    bool _306 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _308 = isnan(_274);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    bool _318 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_274);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = 1.0 / _294;
    float _332 = -_328;
    float _334 = _332 + 1.0;
    bool _336 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _338 = 1.0 / _298;
    float _340 = _278 * _304;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _344 = _274 + _342;
    float _346 = 1.0 / _302;
    float _348 = _282 * _330;
    bool _350 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _352 = isnan(_274);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -_360;
    float _364 = _362 + 1.0;
    float _366 = _286 * _338;
    float _368 = _344 * _346;
    bool _370 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _372 = isnan(_274);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = _380 * _364;
    float _388 = -_380;
    float _390 = _388 + 1.0;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _396;
    float _400 = fma(_384, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _402 = _316 * _390;
    float _404 = -_316;
    float _406 = _404 + 1.0;
    float _408 = fma(_394, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _410 = fma(_398, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _412 = _274 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _414 = isnan(_274);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = _328 * _406;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _438 = _422 * _334;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _440;
    float _444 = fma(_432, _348, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _446 = fma(_436, _348, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _448 = _408 * _438;
    float _450 = _410 * _438;
    float _452 = _400 * _438;
    float _454 = -_422;
    float _456 = _454 + 1.0;
    float _458 = in.m_39.x;
    float _460 = in.m_39.y;
    float _462 = in.m_39.z;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _468;
    float _472 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].x, _448);
    float _474 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].y, _450);
    float _476 = fma(_428, _348, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _478 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[143].z, _452);
    float _480 = fma(_466, _366, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _482 = fma(_442, _366, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _484 = fma(_470, _366, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _486 = fma(_444, _424, _472);
    float _488 = fma(_446, _424, _474);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _502 = fma(_476, _424, _478);
    float _504 = fma(_492, _368, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _506 = fma(_496, _368, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _508 = fma(_482, _402, _488);
    float _510 = fma(_500, _368, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _512 = fma(_480, _402, _486);
    float _514 = fma(_484, _402, _502);
    float _516 = fma(_506, _386, _508);
    float _518 = fma(_504, _386, _512);
    float _520 = fma(_510, _386, _514);
    float _522 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[147].y, _516);
    float _524 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[147].x, _518);
    float _526 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[147].z, _520);
    float _528 = _522 * _460;
    float _530 = _524 * _458;
    float _532 = _526 * _462;
    bool _534 = !_336;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _554;
    if (!_534)
    {
        float _538 = in.m_41.x;
        float _540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _542 = _538 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _544 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[11].y, _104);
        float _546 = _544 * _540;
        float _548 = floor(_546);
        float _550 = -_548;
        float _552 = _546 + _550;
        _554 = _552;
        _556 = true;
    }
    else
    {
        float _558 = float(_70);
        float _560 = 1.0 / _558;
        float _562 = _104 * _560;
        _554 = _562;
    }
    _556 = false;
    float _564 = _554;
    float _566 = in.m_41.w;
    float _568 = _242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _572 = _570 != 0;
    float _574 = _242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _576 = _242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _582 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _568);
    float _584 = in.m_43.y;
    float _586 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _574);
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _590 = _588 != 0;
    float _592 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _576);
    float _594 = 1.0 / _580;
    float _596 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].z, _582);
    float _598 = _480;
    float _600 = _584;
    if (_572)
    {
        float _602 = in.m_41.z;
        _598 = _602;
    }
    float _604 = _598;
    float _606 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].z, _586);
    float _608 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].z, _592);
    float _610 = _596 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _612 = in.m_43.x;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _618 = _606 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _620 = _608 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _622 = _566 > 0.5;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _624;
    float _628 = 1.0 / _616;
    float _630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _632 = _618 + _630;
    bool _634 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _636 = isnan(_564);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = _626 * _594;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _650 = _564 + _648;
    float _652 = _632 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _654 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _656 = isnan(_564);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -_644;
    float _668 = _666 + 1.0;
    float _670 = fma(_646, _650, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _674 = _610 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _678 = _620 + _676;
    float _680 = -_664;
    float _682 = _680 + 1.0;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _688 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[28].x, _652);
    bool _690 = _604 > 0.5;
    bool _692 = _690 && _572;
    float _694 = -_584;
    float _696 = _694 + 1.0;
    bool _698 = _564 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _700 = isnan(_564);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[28].z, _688);
    float _712 = _664 * _668;
    float _714 = _686 * _628;
    float _716 = _632 * _632;
    float _718 = _708 * _682;
    float _720 = _628;
    float _722 = _670;
    if (_590)
    {
        float _724 = _622 ? _696 : _584;
        _600 = _724;
    }
    float _726 = _600;
    float _728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_572)
    {
        _720 = _612;
    }
    float _730 = _720;
    float _732 = _670 * _718;
    bool _734 = _710 >= 0.0;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _738 = _564 + _736;
    float _740 = -_708;
    float _742 = _740 + 1.0;
    float _744 = fma(_674, _674, _716);
    float _746 = _730;
    float _748 = _742;
    if (_692)
    {
        float _750 = -_730;
        float _752 = _750 + 1.0;
        _746 = _752;
    }
    float _754 = _746;
    float _756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _758 = fma(_714, _738, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _760 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[115].x, _732);
    float _762 = fma(_678, _678, _744);
    if (!_572)
    {
        _722 = _612;
    }
    float _764 = _722;
    float _766 = _764;
    if (_572)
    {
        _766 = _754;
    }
    float _768 = _766;
    float _770 = fma(_758, _712, _760);
    float _772 = rsqrt(_762);
    float _774 = _726 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_734)
    {
        _748 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _776 = _748;
    float _778 = _768 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _780 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[117].x, _770);
    if (_734)
    {
        out.m_35.x = 0.0;
    }
    if (_734)
    {
        float _782 = _776 * 5.0;
        _536 = as_type<int>(_782);
    }
    int _784 = _536;
    float _786 = _774 * _756;
    float _788 = _778 * _728;
    float _790 = _780 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_734)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2670 = as_type<float>(_784);
        out.gl_Position.z = _2670;
    }
    out.m_45.z = _788;
    out.m_45.w = _786;
    float _792 = _632 * _772;
    float _794 = _674 * _772;
    out.m_47.w = _790;
    if (_734)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _796 = -_792;
    float _798 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _618);
    float _800 = _678 * _772;
    float _802 = -_794;
    float _804 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[18].w, _610);
    float _806 = -_792;
    float _808 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[18].w, _632);
    float _810 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _812 = _798 + _810;
    float _814 = -_800;
    float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[18].w, _620);
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _820 = _804 + _818;
    float _822 = -_794;
    float _824 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[18].w, _674);
    float _826 = _812 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _830 = _816 + _828;
    float _832 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[28].x, _826);
    float _834 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[28].z, _832);
    bool _836 = _834 >= 0.0;
    float _838 = _808 * _808;
    float _840 = -_800;
    float _842 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _844 = fma(_824, _824, _838);
    float _846 = fma(_842, _842, _844);
    float _848 = _826;
    if (_836)
    {
        _848 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _850 = _848;
    int _852 = as_type<int>(_850);
    if (_836)
    {
        out.m_35.x = 0.0;
    }
    if (_836)
    {
        float _854 = _850 * 5.0;
        _852 = as_type<int>(_854);
    }
    int _856 = _852;
    if (_836)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2805 = as_type<float>(_856);
        out.gl_Position.z = _2805;
    }
    if (_836)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _858 = in.m_49.x;
    float _860 = in.m_49.y;
    float _862 = in.m_49.z;
    float _864 = sqrt(_846);
    float _866 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _868 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _870 = _772 * _864;
    float _872 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _874 = _870 * _866;
    float _876 = _870 * _872;
    float _878 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _860);
    float _880 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _858);
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _862);
    float _884 = _878 * _876;
    float _886 = _880 * _874;
    float _888 = _870 * _868;
    float _890 = _884 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _892 = _884 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _894 = _882 * _888;
    float _896 = _884 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _898 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[24].x, _890);
    float _900 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[26].x, _892);
    float _902 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[25].x, _896);
    float _904 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[24].z, _898);
    float _906 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[26].z, _900);
    float _908 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[25].z, _902);
    float _910 = _904 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _912 = _906 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _914 = _908 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _916 = _610 + _910;
    float _918 = _620 + _912;
    float _920 = _618 + _914;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _924 = _916 + _922;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _928 = _918 + _926;
    float _930 = _924 * _924;
    float _932 = _928 * _928;
    float _934 = _930 + _932;
    float _936 = sqrt(_934);
    bool _938 = _936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _940 = _914;
    float _942 = _930;
    float _944 = _908;
    float _946 = _894;
    float _948 = _932;
    if (!_938)
    {
        _940 = _930;
    }
    float _950 = _940;
    float _952 = _950;
    if (!_938)
    {
        _942 = _916;
    }
    float _954 = _942;
    float _956 = _954;
    if (!_938)
    {
        _944 = _918;
    }
    float _958 = _944;
    float _960 = _958;
    if (!_938)
    {
        _946 = _920;
    }
    float _962 = _946;
    bool _964 = !_938;
    float _966 = _962;
    if (!_964)
    {
        float _968 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _972 = _936 + _970;
        float _974 = rsqrt(_934);
        float _976 = _972 * _968;
        float _978 = _920 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _980 = _976 * 0.15915493667125701904296875;
        float _982 = _980 * 6.283185482025146484375;
        float _984 = sin(_982);
        float _986 = _980 * 6.283185482025146484375;
        float _988 = cos(_986);
        float _990 = fma(_984, _978, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _992 = _974 * _990;
        float _994 = _988 + (-1.0);
        float _996 = fma(_924, _992, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _998 = fma(_928, _992, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1000 = _994 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1004 = _996 + _1002;
        float _1006 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1008 = _998 + _1006;
        float _1010 = fma(_920, _988, _1000);
        float _1012 = _1004 * _1004;
        float _1014 = _1008 * _1008;
        _966 = _1010;
        _952 = _1012;
        _948 = _1014;
        _956 = _996;
        _960 = _998;
    }
    float _1016 = _966;
    float _1018 = _952;
    float _1020 = _948;
    float _1022 = _956;
    float _1024 = _960;
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1028 = _1016 + _1026;
    float _1030 = fma(_1028, _1028, _1018);
    float _1032 = _1030 + _1020;
    float _1034 = sqrt(_1032);
    bool _1036 = _1034 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1038 = isnan(_1034);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1044 = _1040 || _1042;
    float _1046 = _1030;
    if (!_1044)
    {
        _1046 = 1.0;
    }
    float _1048 = _1046;
    bool _1050 = !_1044;
    float _1052 = _1048;
    if (!_1050)
    {
        bool _1054 = _1034 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1056 = isnan(_1034);
        bool _1058 = _1054 || _1056;
        bool _1060 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1062 = _1058 || _1060;
        if (!_1062)
        {
            float _1064 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1066 = _1034 + _1064;
            float _1068 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1070 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1068;
            float _1072 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1074 = _1072 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1076 = 1.0 / _1070;
            float _1078 = _1066 * _1076;
            float _1080 = fma(_1078, _1074, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1052 = _1080;
            _1082 = true;
        }
        else
        {
            bool _1084 = _1034 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1086 = isnan(_1034);
            bool _1088 = _1084 || _1086;
            bool _1090 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1092 = _1088 || _1090;
            if (!_1092)
            {
                float _1094 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1096 = _1034 + _1094;
                float _1098 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1100 = _1098 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1102 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1104 = _1102 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1106 = 1.0 / _1100;
                float _1108 = _1096 * _1106;
                float _1110 = fma(_1108, _1104, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1052 = _1110;
                _1082 = true;
            }
            else
            {
                _1052 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1082 = false;
    float _1112 = _1052;
    float _1114 = _798 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1116 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1118 = _1022 + _1116;
    float _1120 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1122 = _1024 + _1120;
    float _1124 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1114);
    bool _1126 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan(0.5);
    bool _1134 = _1130 || _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1138 = _1016 + _1136;
    float _1140 = _798 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1142 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1124);
    float _1144 = fma(_1118, _1112, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1146 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1140);
    float _1148 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1150 = fma(_1138, _1112, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1152 = fma(_1122, _1112, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1154 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1146);
    float _1156 = 1.0 / _1148;
    bool _1158 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan(0.5);
    bool _1166 = _1162 || _1164;
    float _1168 = -_794;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1144);
    float _1172 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1174 = -_792;
    float _1176 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1150);
    float _1178 = -_800;
    float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1152);
    float _1182 = _1172 + _1148;
    float _1184 = _1176;
    float _1186 = _1170;
    float _1188 = _1180;
    if (!_1134)
    {
        float _1190 = _812 * _812;
        float _1192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1194 = -_618;
        float _1196 = _1194 + _1150;
        float _1198 = -_620;
        float _1200 = _1198 + _1152;
        float _1202 = fma(_820, _820, _1190);
        float _1204 = -_610;
        float _1206 = _1204 + _1144;
        float _1208 = fma(_830, _830, _1202);
        float _1210 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1212 = sqrt(_1208);
        float _1214 = 1.0 / _870;
        bool _1216 = _1212 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1218 = isnan(_1212);
        bool _1220 = _1216 || _1218;
        bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1224 = _1220 || _1222;
        float _1226 = precise::min(_1212, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1228 = _1226 * _1192;
        float _1230 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1232 = _1196 * _1214;
        float _1234 = _1200 * _1214;
        float _1236 = _1206 * _1214;
        float _1238 = _812;
        float _1240 = _1210;
        float _1242 = _1228;
        float _1244 = _1230;
        if (_1224)
        {
            float _1246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1238 = _1246;
        }
        float _1248 = _1238;
        if (_1224)
        {
            float _1250 = precise::max(_1212, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1240 = _1250;
        }
        float _1252 = _1240;
        float _1254 = _1230 * _1228;
        float _1256 = fma(_1232, _1254, _798);
        float _1258 = _1254;
        if (_1224)
        {
            float _1260 = _1252 * _1248;
            _1242 = _1260;
        }
        float _1262 = _1242;
        float _1264 = fma(_1234, _1254, _816);
        float _1266 = fma(_1236, _1254, _804);
        float _1268 = _1262;
        float _1270 = _1266;
        if (_1224)
        {
            float _1272 = _1230 * _1262;
            _1258 = _1272;
        }
        float _1274 = _1258;
        if (!_1224)
        {
            _1244 = _1256;
        }
        float _1276 = _1244;
        float _1278 = _1276;
        if (!_1224)
        {
            _1268 = _1264;
        }
        float _1280 = _1268;
        _1188 = _1280;
        if (_1224)
        {
            float _1282 = fma(_1236, _1274, _804);
            _1270 = _1282;
        }
        float _1284 = _1270;
        _1186 = _1284;
        if (_1224)
        {
            float _1286 = fma(_1232, _1274, _798);
            _1278 = _1286;
        }
        float _1288 = _1278;
        _1184 = _1288;
        if (_1224)
        {
            float _1290 = fma(_1234, _1274, _816);
            _1188 = _1290;
        }
    }
    float _1292 = _1184;
    float _1294 = _1186;
    float _1296 = _1188;
    float _1298 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1300 = _1182 * _1156;
    float _1302 = _1300 * 0.5;
    float _1304 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1306 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1308 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1310 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1298);
    float _1312 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1304);
    float _1314 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1306);
    float _1316 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1308);
    float _1318 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1310);
    float _1320 = _1310;
    if (_1166)
    {
        _1320 = 1.0;
    }
    float _1322 = _1320;
    float _1324 = _1322;
    if (!_1166)
    {
        float _1326 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1330 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1328);
        float _1332 = _1326 * 0.15915493667125701904296875;
        float _1334 = _1332 * 6.283185482025146484375;
        float _1336 = cos(_1334);
        float _1338 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1340 = _1338 * 0.15915493667125701904296875;
        float _1342 = _1332 * 6.283185482025146484375;
        float _1344 = sin(_1342);
        float _1346 = 1.0 / _1336;
        float _1348 = _1340 * 6.283185482025146484375;
        float _1350 = cos(_1348);
        float _1352 = _1344 * _1346;
        float _1354 = 1.0 / _1330;
        float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1358 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1356;
        float _1360 = _1350 * _1352;
        float _1362 = _1340 * 6.283185482025146484375;
        float _1364 = sin(_1362);
        float _1366 = 1.0 / _1360;
        float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1370 = _1354 * _1368;
        float _1372 = 1.0 / _1358;
        float _1374 = _1364 * _1366;
        float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1378 = fma(_1374, _1370, _1376);
        float _1380 = _1378 * _1372;
        float _1382 = precise::clamp(_1380, 0.0, 1.0);
        _1324 = _1382;
    }
    float _1384 = _1324;
    float _1386 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1312);
    float _1388 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1390 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1314);
    float _1392 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1316);
    float _1394 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1398 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1400 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1402 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1404 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1406 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1396);
    float _1408 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1398);
    float _1410 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1400);
    float _1412 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1402);
    float _1414 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1416 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1406);
    float _1418 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1408);
    float _1420 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1410);
    float _1422 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1412);
    bool _1424 = _1384 > 0.0;
    bool _1426 = isnan(_1384);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan(0.0);
    bool _1432 = _1428 || _1430;
    float _1434 = _1384 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1436 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1416);
    float _1438 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1418);
    float _1440 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1422);
    float _1442 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1420);
    float _1444 = _1434 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1446 = _1436 + _1440;
    float _1448 = _1442 + _1440;
    float _1450 = _1440 * 0.5;
    float _1452 = _1446 * 0.5;
    float _1454 = _1448 * 0.5;
    float _1456 = fma(_1438, -0.5, _1450);
    out.m_35.x = _1444;
    out.gl_Position.x = _1436;
    out.gl_Position.y = _1438;
    out.gl_Position.z = _1442;
    out.gl_Position.w = _1440;
    out.m_51.x = _1452;
    out.m_51.y = _1456;
    out.m_51.z = _1454;
    out.m_51.w = _1440;
    if (_1432)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1458 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1458;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

