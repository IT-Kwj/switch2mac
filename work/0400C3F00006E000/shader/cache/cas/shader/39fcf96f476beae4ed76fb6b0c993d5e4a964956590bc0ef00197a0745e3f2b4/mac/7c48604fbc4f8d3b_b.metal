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
    float4 m_49 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_51 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_41 [[attribute(4)]];
    float4 m_39 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_43 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_30.w;
    float _69 = trunc(_67);
    int _72 = int(_69);
    bool _76 = _72 >= 1;
    float _78 = 0.0;
    float _80 = as_type<float>(_72);
    if (!_76)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _78;
    if (!_76)
    {
        out.m_33.x = 0.0;
    }
    int _84 = 0;
    if (!_76)
    {
        float _86 = _82 * 5.0;
        _84 = as_type<int>(_86);
    }
    int _88 = _84;
    int _90 = _88;
    if (!_76)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _800 = as_type<float>(_88);
        out.gl_Position.z = _800;
    }
    if (!_76)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _92 = in.m_35.w;
    float _94 = float(_72);
    float _96 = -_92;
    float _98 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_92);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    bool _110 = _98 >= _94;
    bool _112 = !_108;
    bool _114 = _110 || _112;
    if (_114)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _80;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _90 = as_type<int>(_118);
    }
    int _120 = _90;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _863 = as_type<float>(_120);
        out.gl_Position.z = _863;
    }
    if (_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_37.w;
    float _124 = 1.0 / _94;
    float _126 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _128 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _130 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _132 = _128 || _130;
    bool _134 = isnan(1.0);
    bool _136 = _132 || _134;
    float _138 = in.m_35.x;
    float _140 = in.m_35.y;
    float _142 = in.m_35.z;
    float _144 = in.m_30.x;
    float _146 = in.m_30.y;
    float _148 = in.m_30.z;
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
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _230 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _232 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _234 = fma(_224, _138, _228);
    float _236 = fma(_224, _140, _230);
    float _238 = fma(_224, _142, _232);
    float _240 = fma(_234, _122, _144);
    float _242 = fma(_236, _122, _146);
    float _244 = fma(_238, _122, _148);
    float _246 = _98 * _124;
    bool _248 = !_226;
    float _266;
    if (!_248)
    {
        float _250 = in.m_39.x;
        float _252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _254 = _250 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[11].y, _98);
        float _258 = _256 * _252;
        float _260 = floor(_258);
        float _262 = -_260;
        float _264 = _258 + _262;
        _266 = _264;
        _268 = true;
    }
    else
    {
        _266 = _246;
    }
    _268 = false;
    float _270 = _266;
    float _272 = in.m_41.x;
    float _274 = in.m_41.y;
    float _276 = in.m_41.z;
    float _278 = _242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _280 = _242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _282 = in.m_37.x;
    float _284 = in.m_37.y;
    float _286 = in.m_37.z;
    float _288 = _242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _290 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _278);
    float _292 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _280);
    float _294 = in.m_43.x;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _300 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _288);
    float _302 = 1.0 / _298;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _306 = fma((*spvDescriptorSet0.vp_c9)._m0[191].z, (*spvDescriptorSet0.vp_c9)._m0[191].w, _304);
    float _308 = in.m_43.w;
    float _310 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].z, _300);
    float _312 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].z, _290);
    float _314 = _310 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _316 = _272 * 6.283185482025146484375;
    float _318 = _312 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _320 = _316 * 0.15915493667125701904296875;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _326 = fma(_246, _306, (*spvDescriptorSet0.vp_c9)._m0[191].z);
    float _328 = _282 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _330 = _320 * 6.283185482025146484375;
    float _332 = cos(_330);
    float _334 = fma(_246, _324, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _338 = _336 + 1.0;
    float _340 = _284 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _342 = _328 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _344 = fma(_334, _274, _326);
    float _346 = fma(_338, _294, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _348;
    float _352 = _320 * 6.283185482025146484375;
    float _354 = sin(_352);
    float _356 = _340 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _358 = _346 * _276;
    float _360 = _350 * _302;
    float _362 = _286 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_45.w = _308;
    float _366 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].z, _292);
    float _368 = _344 * _346;
    float _370 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _358);
    float _372 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _374 = _332 * _368;
    out.m_47.w = _364;
    float _376 = _366 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _378 = _354 * _368;
    float _380 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _374);
    float _382 = _372 * _370;
    float _384 = -_378;
    float _386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _384);
    float _388 = _356 * _380;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _394 = _342 * _386;
    float _396 = _388 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _398 = _388 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _400 = 1.0 / _392;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _406 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[26].x, _396);
    float _408 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[24].x, _398);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _414 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _416 = isnan(_270);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[26].z, _406);
    float _428 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[24].z, _408);
    float _430 = 1.0 / _404;
    float _432 = _388 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _434 = _426 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _436 = _428 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _438 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[25].x, _432);
    float _440 = _314 + _434;
    float _442 = _318 + _436;
    float _444 = _412 * _400;
    float _446 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _448 = _440 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _452 = _442 + _450;
    bool _454 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _456 = isnan(_270);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[25].z, _438);
    float _468 = _448 * _448;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _474 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _476 = isnan(_270);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _486;
    float _490 = fma(_452, _452, _468);
    float _492 = -_464;
    float _494 = _492 + 1.0;
    float _496 = 1.0 / _472;
    float _498 = _488 * _430;
    float _500 = -_484;
    float _502 = _500 + 1.0;
    float _504 = _484 * _494;
    bool _506 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _508 = isnan(_270);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _520 = _270 + _518;
    float _522 = _424 * _502;
    float _524 = -_424;
    float _526 = _524 + 1.0;
    float _528 = sqrt(_490);
    float _530 = fma(_360, _520, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _534 = _270 + _532;
    float _536 = _516 * _526;
    float _538 = -_516;
    float _540 = _538 + 1.0;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _546 = fma(_444, _534, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _548 = _530 * _536;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _552 = _270 + _550;
    bool _554 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _556 = isnan(_270);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = _466 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _568 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[115].x, _548);
    float _570 = _544 * _496;
    float _572 = fma(_498, _552, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _576 = _270 + _574;
    float _578 = fma(_546, _522, _568);
    bool _580 = _528 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _582 = _376 + _566;
    float _584 = -_564;
    float _586 = _584 + 1.0;
    float _588 = fma(_570, _576, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _590 = fma(_572, _504, _578);
    float _592 = _464 * _586;
    float _594 = _376;
    float _596 = _570;
    float _598 = _572;
    if (!_580)
    {
        _594 = _442;
    }
    float _600 = _594;
    float _602 = _600;
    if (!_580)
    {
        _596 = _440;
    }
    float _604 = _596;
    float _606 = _604;
    if (!_580)
    {
        _598 = _582;
    }
    float _608 = _598;
    bool _610 = !_580;
    float _612 = _608;
    if (!_610)
    {
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _618 = _528 + _616;
        float _620 = _582 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _622 = rsqrt(_490);
        float _624 = _618 * _614;
        float _626 = _624 * 0.15915493667125701904296875;
        float _628 = _626 * 6.283185482025146484375;
        float _630 = cos(_628);
        float _632 = _626 * 6.283185482025146484375;
        float _634 = sin(_632);
        float _636 = _630 + (-1.0);
        float _638 = _636 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _640 = fma(_634, _620, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _642 = fma(_582, _630, _638);
        float _644 = _622 * _640;
        float _646 = fma(_452, _644, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _648 = fma(_448, _644, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _612 = _642;
        _602 = _646;
        _606 = _648;
    }
    float _650 = _612;
    float _652 = _602;
    float _654 = _606;
    float _656 = _650 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _658 = _650 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _660 = fma(_588, _592, _590);
    float _662 = _650 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _664 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[1].x, _656);
    float _666 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[0].x, _658);
    float _668 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[119].x, _660);
    float _670 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[2].x, _662);
    float _672 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[1].z, _664);
    float _674 = _650 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _676 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[0].z, _666);
    float _678 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[2].z, _670);
    float _680 = _672 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _682 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[3].x, _674);
    float _684 = _676 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _686 = _678 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _688 = _680 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _690 = _680 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _692 = _680 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _694 = _680 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _696 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[4].x, _688);
    float _698 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[5].x, _690);
    float _700 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[6].x, _692);
    float _702 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[7].x, _694);
    float _704 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[3].z, _682);
    float _706 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[4].z, _696);
    float _708 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[5].z, _698);
    float _710 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[6].z, _700);
    float _712 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[7].z, _702);
    float _714 = _704 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _716 = _668 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _718 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[5].w, _708);
    float _720 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[6].w, _710);
    float _722 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[4].w, _706);
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _726 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[7].w, _712);
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _732 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _734 = _720 + _726;
    float _736 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _738 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = _734 * 0.5;
    out.m_33.x = _736;
    out.m_49.x = _738;
    out.m_49.y = _732;
    out.m_49.z = _740;
    out.m_49.w = _716;
    out.m_51.x = _652;
    out.m_51.y = _650;
    out.m_51.z = _654;
    out.gl_Position.x = _722;
    out.gl_Position.y = _718;
    out.gl_Position.z = _720;
    out.gl_Position.w = _726;
    out.m_53.z = _742;
    out.m_53.w = _726;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_30.w;
    float _69 = trunc(_67);
    int _72 = int(_69);
    bool _76 = _72 >= 1;
    float _78 = 0.0;
    float _80 = as_type<float>(_72);
    if (!_76)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _78;
    if (!_76)
    {
        out.m_33.x = 0.0;
    }
    int _84 = 0;
    if (!_76)
    {
        float _86 = _82 * 5.0;
        _84 = as_type<int>(_86);
    }
    int _88 = _84;
    int _90 = _88;
    if (!_76)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _800 = as_type<float>(_88);
        out.gl_Position.z = _800;
    }
    if (!_76)
    {
        return out;
    }
    float _92 = in.m_35.w;
    float _94 = float(_72);
    float _96 = -_92;
    float _98 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_92);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    bool _110 = _98 >= _94;
    bool _112 = !_108;
    bool _114 = _110 || _112;
    if (_114)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _80;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _90 = as_type<int>(_118);
    }
    int _120 = _90;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _863 = as_type<float>(_120);
        out.gl_Position.z = _863;
    }
    if (_114)
    {
        return out;
    }
    float _122 = in.m_37.w;
    float _124 = 1.0 / _94;
    float _126 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _128 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _130 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _132 = _128 || _130;
    bool _134 = isnan(1.0);
    bool _136 = _132 || _134;
    float _138 = in.m_35.x;
    float _140 = in.m_35.y;
    float _142 = in.m_35.z;
    float _144 = in.m_30.x;
    float _146 = in.m_30.y;
    float _148 = in.m_30.z;
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
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _230 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _232 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _234 = fma(_224, _138, _228);
    float _236 = fma(_224, _140, _230);
    float _238 = fma(_224, _142, _232);
    float _240 = fma(_234, _122, _144);
    float _242 = fma(_236, _122, _146);
    float _244 = fma(_238, _122, _148);
    float _246 = _98 * _124;
    bool _248 = !_226;
    float _266;
    if (!_248)
    {
        float _250 = in.m_39.x;
        float _252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _254 = _250 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[11].y, _98);
        float _258 = _256 * _252;
        float _260 = floor(_258);
        float _262 = -_260;
        float _264 = _258 + _262;
        _266 = _264;
        _268 = true;
    }
    else
    {
        _266 = _246;
    }
    _268 = false;
    float _270 = _266;
    float _272 = in.m_41.x;
    float _274 = in.m_41.y;
    float _276 = in.m_41.z;
    float _278 = _242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _280 = _242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _282 = in.m_37.x;
    float _284 = in.m_37.y;
    float _286 = in.m_37.z;
    float _288 = _242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _290 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _278);
    float _292 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _280);
    float _294 = in.m_43.x;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _300 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _288);
    float _302 = 1.0 / _298;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _306 = fma((*spvDescriptorSet0.vp_c9)._m0[191].z, (*spvDescriptorSet0.vp_c9)._m0[191].w, _304);
    float _308 = in.m_43.w;
    float _310 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].z, _300);
    float _312 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].z, _290);
    float _314 = _310 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _316 = _272 * 6.283185482025146484375;
    float _318 = _312 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _320 = _316 * 0.15915493667125701904296875;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _326 = fma(_246, _306, (*spvDescriptorSet0.vp_c9)._m0[191].z);
    float _328 = _282 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _330 = _320 * 6.283185482025146484375;
    float _332 = cos(_330);
    float _334 = fma(_246, _324, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _338 = _336 + 1.0;
    float _340 = _284 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _342 = _328 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _344 = fma(_334, _274, _326);
    float _346 = fma(_338, _294, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _348;
    float _352 = _320 * 6.283185482025146484375;
    float _354 = sin(_352);
    float _356 = _340 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _358 = _346 * _276;
    float _360 = _350 * _302;
    float _362 = _286 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_45.w = _308;
    float _366 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].z, _292);
    float _368 = _344 * _346;
    float _370 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _358);
    float _372 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _374 = _332 * _368;
    out.m_47.w = _364;
    float _376 = _366 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _378 = _354 * _368;
    float _380 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _374);
    float _382 = _372 * _370;
    float _384 = -_378;
    float _386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _384);
    float _388 = _356 * _380;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _394 = _342 * _386;
    float _396 = _388 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _398 = _388 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _400 = 1.0 / _392;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _406 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[26].x, _396);
    float _408 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[24].x, _398);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _414 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _416 = isnan(_270);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[26].z, _406);
    float _428 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[24].z, _408);
    float _430 = 1.0 / _404;
    float _432 = _388 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _434 = _426 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _436 = _428 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _438 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[25].x, _432);
    float _440 = _314 + _434;
    float _442 = _318 + _436;
    float _444 = _412 * _400;
    float _446 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _448 = _440 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _452 = _442 + _450;
    bool _454 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _456 = isnan(_270);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[25].z, _438);
    float _468 = _448 * _448;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _474 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _476 = isnan(_270);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _486;
    float _490 = fma(_452, _452, _468);
    float _492 = -_464;
    float _494 = _492 + 1.0;
    float _496 = 1.0 / _472;
    float _498 = _488 * _430;
    float _500 = -_484;
    float _502 = _500 + 1.0;
    float _504 = _484 * _494;
    bool _506 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _508 = isnan(_270);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _520 = _270 + _518;
    float _522 = _424 * _502;
    float _524 = -_424;
    float _526 = _524 + 1.0;
    float _528 = sqrt(_490);
    float _530 = fma(_360, _520, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _534 = _270 + _532;
    float _536 = _516 * _526;
    float _538 = -_516;
    float _540 = _538 + 1.0;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _546 = fma(_444, _534, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _548 = _530 * _536;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _552 = _270 + _550;
    bool _554 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _556 = isnan(_270);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = _466 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _568 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[115].x, _548);
    float _570 = _544 * _496;
    float _572 = fma(_498, _552, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _576 = _270 + _574;
    float _578 = fma(_546, _522, _568);
    bool _580 = _528 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _582 = _376 + _566;
    float _584 = -_564;
    float _586 = _584 + 1.0;
    float _588 = fma(_570, _576, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _590 = fma(_572, _504, _578);
    float _592 = _464 * _586;
    float _594 = _376;
    float _596 = _570;
    float _598 = _572;
    if (!_580)
    {
        _594 = _442;
    }
    float _600 = _594;
    float _602 = _600;
    if (!_580)
    {
        _596 = _440;
    }
    float _604 = _596;
    float _606 = _604;
    if (!_580)
    {
        _598 = _582;
    }
    float _608 = _598;
    bool _610 = !_580;
    float _612 = _608;
    if (!_610)
    {
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _618 = _528 + _616;
        float _620 = _582 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _622 = rsqrt(_490);
        float _624 = _618 * _614;
        float _626 = _624 * 0.15915493667125701904296875;
        float _628 = _626 * 6.283185482025146484375;
        float _630 = cos(_628);
        float _632 = _626 * 6.283185482025146484375;
        float _634 = sin(_632);
        float _636 = _630 + (-1.0);
        float _638 = _636 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _640 = fma(_634, _620, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _642 = fma(_582, _630, _638);
        float _644 = _622 * _640;
        float _646 = fma(_452, _644, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _648 = fma(_448, _644, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _612 = _642;
        _602 = _646;
        _606 = _648;
    }
    float _650 = _612;
    float _652 = _602;
    float _654 = _606;
    float _656 = _650 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _658 = _650 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _660 = fma(_588, _592, _590);
    float _662 = _650 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _664 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[1].x, _656);
    float _666 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[0].x, _658);
    float _668 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[119].x, _660);
    float _670 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[2].x, _662);
    float _672 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[1].z, _664);
    float _674 = _650 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _676 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[0].z, _666);
    float _678 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[2].z, _670);
    float _680 = _672 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _682 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[3].x, _674);
    float _684 = _676 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _686 = _678 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _688 = _680 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _690 = _680 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _692 = _680 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _694 = _680 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _696 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[4].x, _688);
    float _698 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[5].x, _690);
    float _700 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[6].x, _692);
    float _702 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[7].x, _694);
    float _704 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[3].z, _682);
    float _706 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[4].z, _696);
    float _708 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[5].z, _698);
    float _710 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[6].z, _700);
    float _712 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[7].z, _702);
    float _714 = _704 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _716 = _668 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _718 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[5].w, _708);
    float _720 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[6].w, _710);
    float _722 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[4].w, _706);
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _726 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[7].w, _712);
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _732 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _734 = _720 + _726;
    float _736 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _738 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = _734 * 0.5;
    out.m_33.x = _736;
    out.m_49.x = _738;
    out.m_49.y = _732;
    out.m_49.z = _740;
    out.m_49.w = _716;
    out.m_51.x = _652;
    out.m_51.y = _650;
    out.m_51.z = _654;
    out.gl_Position.x = _722;
    out.gl_Position.y = _718;
    out.gl_Position.z = _720;
    out.gl_Position.w = _726;
    out.m_53.z = _742;
    out.m_53.w = _726;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_30.w;
    float _69 = trunc(_67);
    int _72 = int(_69);
    bool _76 = _72 >= 1;
    float _78 = 0.0;
    float _80 = as_type<float>(_72);
    if (!_76)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _78;
    if (!_76)
    {
        out.m_33.x = 0.0;
    }
    int _84 = 0;
    if (!_76)
    {
        float _86 = _82 * 5.0;
        _84 = as_type<int>(_86);
    }
    int _88 = _84;
    int _90 = _88;
    if (!_76)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _800 = as_type<float>(_88);
        out.gl_Position.z = _800;
    }
    if (!_76)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _92 = in.m_35.w;
    float _94 = float(_72);
    float _96 = -_92;
    float _98 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_92);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    bool _110 = _98 >= _94;
    bool _112 = !_108;
    bool _114 = _110 || _112;
    if (_114)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _80;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _90 = as_type<int>(_118);
    }
    int _120 = _90;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _863 = as_type<float>(_120);
        out.gl_Position.z = _863;
    }
    if (_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_37.w;
    float _124 = 1.0 / _94;
    float _126 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _128 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _130 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _132 = _128 || _130;
    bool _134 = isnan(1.0);
    bool _136 = _132 || _134;
    float _138 = in.m_35.x;
    float _140 = in.m_35.y;
    float _142 = in.m_35.z;
    float _144 = in.m_30.x;
    float _146 = in.m_30.y;
    float _148 = in.m_30.z;
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
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _230 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _232 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _234 = fma(_224, _138, _228);
    float _236 = fma(_224, _140, _230);
    float _238 = fma(_224, _142, _232);
    float _240 = fma(_234, _122, _144);
    float _242 = fma(_236, _122, _146);
    float _244 = fma(_238, _122, _148);
    float _246 = _98 * _124;
    bool _248 = !_226;
    float _266;
    if (!_248)
    {
        float _250 = in.m_39.x;
        float _252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _254 = _250 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[11].y, _98);
        float _258 = _256 * _252;
        float _260 = floor(_258);
        float _262 = -_260;
        float _264 = _258 + _262;
        _266 = _264;
        _268 = true;
    }
    else
    {
        _266 = _246;
    }
    _268 = false;
    float _270 = _266;
    float _272 = in.m_41.x;
    float _274 = in.m_41.y;
    float _276 = in.m_41.z;
    float _278 = _242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _280 = _242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _282 = in.m_37.x;
    float _284 = in.m_37.y;
    float _286 = in.m_37.z;
    float _288 = _242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _290 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _278);
    float _292 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _280);
    float _294 = in.m_43.x;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _300 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _288);
    float _302 = 1.0 / _298;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _306 = fma((*spvDescriptorSet0.vp_c9)._m0[191].z, (*spvDescriptorSet0.vp_c9)._m0[191].w, _304);
    float _308 = in.m_43.w;
    float _310 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].z, _300);
    float _312 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].z, _290);
    float _314 = _310 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _316 = _272 * 6.283185482025146484375;
    float _318 = _312 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _320 = _316 * 0.15915493667125701904296875;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _326 = fma(_246, _306, (*spvDescriptorSet0.vp_c9)._m0[191].z);
    float _328 = _282 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _330 = _320 * 6.283185482025146484375;
    float _332 = cos(_330);
    float _334 = fma(_246, _324, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[192].x;
    float _338 = _336 + 1.0;
    float _340 = _284 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _342 = _328 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _344 = fma(_334, _274, _326);
    float _346 = fma(_338, _294, (*spvDescriptorSet0.vp_c9)._m0[192].x);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _348;
    float _352 = _320 * 6.283185482025146484375;
    float _354 = sin(_352);
    float _356 = _340 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _358 = _346 * _276;
    float _360 = _350 * _302;
    float _362 = _286 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_45.w = _308;
    float _366 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].z, _292);
    float _368 = _344 * _346;
    float _370 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _358);
    float _372 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _374 = _332 * _368;
    out.m_47.w = _364;
    float _376 = _366 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _378 = _354 * _368;
    float _380 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _374);
    float _382 = _372 * _370;
    float _384 = -_378;
    float _386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _384);
    float _388 = _356 * _380;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _394 = _342 * _386;
    float _396 = _388 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _398 = _388 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _400 = 1.0 / _392;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _406 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[26].x, _396);
    float _408 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[24].x, _398);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _414 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _416 = isnan(_270);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[26].z, _406);
    float _428 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[24].z, _408);
    float _430 = 1.0 / _404;
    float _432 = _388 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _434 = _426 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _436 = _428 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _438 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[25].x, _432);
    float _440 = _314 + _434;
    float _442 = _318 + _436;
    float _444 = _412 * _400;
    float _446 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _448 = _440 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _452 = _442 + _450;
    bool _454 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _456 = isnan(_270);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[25].z, _438);
    float _468 = _448 * _448;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _474 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _476 = isnan(_270);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _486;
    float _490 = fma(_452, _452, _468);
    float _492 = -_464;
    float _494 = _492 + 1.0;
    float _496 = 1.0 / _472;
    float _498 = _488 * _430;
    float _500 = -_484;
    float _502 = _500 + 1.0;
    float _504 = _484 * _494;
    bool _506 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _508 = isnan(_270);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _520 = _270 + _518;
    float _522 = _424 * _502;
    float _524 = -_424;
    float _526 = _524 + 1.0;
    float _528 = sqrt(_490);
    float _530 = fma(_360, _520, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _534 = _270 + _532;
    float _536 = _516 * _526;
    float _538 = -_516;
    float _540 = _538 + 1.0;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _546 = fma(_444, _534, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _548 = _530 * _536;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _552 = _270 + _550;
    bool _554 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _556 = isnan(_270);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = _466 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _568 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[115].x, _548);
    float _570 = _544 * _496;
    float _572 = fma(_498, _552, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _576 = _270 + _574;
    float _578 = fma(_546, _522, _568);
    bool _580 = _528 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _582 = _376 + _566;
    float _584 = -_564;
    float _586 = _584 + 1.0;
    float _588 = fma(_570, _576, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _590 = fma(_572, _504, _578);
    float _592 = _464 * _586;
    float _594 = _376;
    float _596 = _570;
    float _598 = _572;
    if (!_580)
    {
        _594 = _442;
    }
    float _600 = _594;
    float _602 = _600;
    if (!_580)
    {
        _596 = _440;
    }
    float _604 = _596;
    float _606 = _604;
    if (!_580)
    {
        _598 = _582;
    }
    float _608 = _598;
    bool _610 = !_580;
    float _612 = _608;
    if (!_610)
    {
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _618 = _528 + _616;
        float _620 = _582 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _622 = rsqrt(_490);
        float _624 = _618 * _614;
        float _626 = _624 * 0.15915493667125701904296875;
        float _628 = _626 * 6.283185482025146484375;
        float _630 = cos(_628);
        float _632 = _626 * 6.283185482025146484375;
        float _634 = sin(_632);
        float _636 = _630 + (-1.0);
        float _638 = _636 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _640 = fma(_634, _620, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _642 = fma(_582, _630, _638);
        float _644 = _622 * _640;
        float _646 = fma(_452, _644, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _648 = fma(_448, _644, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _612 = _642;
        _602 = _646;
        _606 = _648;
    }
    float _650 = _612;
    float _652 = _602;
    float _654 = _606;
    float _656 = _650 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _658 = _650 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _660 = fma(_588, _592, _590);
    float _662 = _650 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _664 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[1].x, _656);
    float _666 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[0].x, _658);
    float _668 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[119].x, _660);
    float _670 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[2].x, _662);
    float _672 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[1].z, _664);
    float _674 = _650 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _676 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[0].z, _666);
    float _678 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[2].z, _670);
    float _680 = _672 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _682 = fma(_652, (*spvDescriptorSet0.vp_c8)._m0[3].x, _674);
    float _684 = _676 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _686 = _678 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _688 = _680 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _690 = _680 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _692 = _680 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _694 = _680 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _696 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[4].x, _688);
    float _698 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[5].x, _690);
    float _700 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[6].x, _692);
    float _702 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[7].x, _694);
    float _704 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[3].z, _682);
    float _706 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[4].z, _696);
    float _708 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[5].z, _698);
    float _710 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[6].z, _700);
    float _712 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[7].z, _702);
    float _714 = _704 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _716 = _668 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _718 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[5].w, _708);
    float _720 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[6].w, _710);
    float _722 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[4].w, _706);
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _726 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[7].w, _712);
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _732 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _734 = _720 + _726;
    float _736 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _738 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = _734 * 0.5;
    out.m_33.x = _736;
    out.m_49.x = _738;
    out.m_49.y = _732;
    out.m_49.z = _740;
    out.m_49.w = _716;
    out.m_51.x = _652;
    out.m_51.y = _650;
    out.m_51.z = _654;
    out.gl_Position.x = _722;
    out.gl_Position.y = _718;
    out.gl_Position.z = _720;
    out.gl_Position.w = _726;
    out.m_53.z = _742;
    out.m_53.w = _726;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

