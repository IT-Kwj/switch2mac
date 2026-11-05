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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
};

struct main0_out
{
    float4 m_37 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_55 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_43 [[attribute(1)]];
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_33 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
    float4 m_39 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _722 = false;
    bool _606 = false;
    bool _276 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_26.w;
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
        out.m_29.x = 0.0;
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
        float _4154 = as_type<float>(_94);
        out.gl_Position.z = _4154;
    }
    if (!_82)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _98 = in.m_31.w;
    bool _100 = _98 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_98);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    float _110 = -_98;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _114 = 0.0;
    float _116 = _112;
    if (_108)
    {
        float _118 = float(_78);
        _114 = _118;
    }
    float _120 = _114;
    bool _122 = _112 >= _120;
    bool _124 = !_108;
    bool _126 = _122 || _124;
    if (_126)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _88;
    if (_126)
    {
        out.m_29.x = 0.0;
    }
    if (_126)
    {
        float _130 = _128 * 5.0;
        _96 = as_type<int>(_130);
    }
    int _132 = _96;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4223 = as_type<float>(_132);
        out.gl_Position.z = _4223;
    }
    if (_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_33.w;
    float _136 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    float _148 = in.m_31.x;
    float _150 = in.m_31.y;
    float _152 = in.m_31.z;
    float _154 = in.m_26.x;
    float _156 = in.m_26.y;
    float _158 = in.m_26.z;
    float _160 = 0.0;
    float _162 = _136;
    if (!_146)
    {
        float _164 = _136 * _136;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = _168;
    if (!_146)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    bool _176 = !_146;
    float _178 = _174;
    if (!_176)
    {
        float _180 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = log2(_180);
        float _184 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _186 = _184 + 1.0;
        float _188 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = _136 * _182;
        float _192 = 1.0 / _186;
        float _194 = _188 * 0.693147182464599609375;
        float _196 = exp2(_190);
        float _198 = 1.0 / _194;
        float _200 = _196 + (-1.0);
        float _202 = -_200;
        float _204 = fma(_202, _198, _136);
        float _206 = _204 * _192;
        float _208 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _208;
    }
    float _210 = _178;
    bool _212 = !_146;
    if (!_212)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = 1.0 / _220;
        float _224 = _136 * _216;
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
    float _250 = fma(_244, _134, _154);
    float _252 = fma(_246, _134, _156);
    float _254 = fma(_248, _134, _158);
    bool _256 = !_236;
    float _274;
    if (!_256)
    {
        float _258 = in.m_35.x;
        float _260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _262 = _258 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[12].x, _112);
        float _266 = _264 * _260;
        float _268 = floor(_266);
        float _270 = -_268;
        float _272 = _266 + _270;
        _274 = _272;
        _276 = true;
    }
    else
    {
        float _278 = float(_78);
        float _280 = 1.0 / _278;
        float _282 = _112 * _280;
        _274 = _282;
    }
    _276 = false;
    float _284 = _274;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _284 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _306 = 1.0 / _292;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _308;
    bool _312 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _314 = isnan(_284);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -_322;
    float _326 = _324 + 1.0;
    float _328 = 1.0 / _300;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = _284 + _330;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _336 = 1.0 / _296;
    float _338 = _332 * _306;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _342 = _284 + _340;
    bool _344 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _346 = isnan(_284);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    bool _356 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _358 = isnan(_284);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = 1.0 / _304;
    float _370 = _342 * _328;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _374 = _284 + _372;
    bool _376 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _378 = isnan(_284);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -_354;
    float _390 = _388 + 1.0;
    float _392 = 1.0 / _310;
    float _394 = _288 * _336;
    bool _396 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _398 = isnan(_284);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = _366 * _390;
    bool _410 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _412 = isnan(_284);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _424 = _284 + _422;
    float _426 = -_366;
    float _428 = _426 + 1.0;
    float _430 = _406 * _326;
    float _432 = _374 * _368;
    float _434 = -_386;
    float _436 = _434 + 1.0;
    float _438 = -_406;
    float _440 = _438 + 1.0;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _442;
    float _446 = _322 * _428;
    float _448 = _354 * _436;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _450;
    float _454 = _420 * _440;
    float _456 = _424 * _392;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _458;
    float _462 = fma(_452, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _476 = fma(_444, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _478 = _462 * _454;
    float _480 = -_420;
    float _482 = _480 + 1.0;
    float _484 = fma(_460, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _486 = fma(_466, _394, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _488 = fma(_470, _394, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _490 = fma(_474, _394, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _492 = _476 * _454;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _494;
    float _498 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[143].x, _478);
    float _500 = _484 * _454;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _502;
    float _506 = fma(_496, _370, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _508 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[143].y, _492);
    float _510 = fma(_486, _430, _498);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _512;
    float _516 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[143].z, _500);
    float _518 = fma(_504, _370, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _520 = fma(_488, _430, _508);
    float _522 = fma(_506, _446, _510);
    float _524 = fma(_514, _370, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _526 = fma(_490, _430, _516);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _540 = fma(_518, _446, _520);
    float _542 = fma(_524, _446, _526);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _544;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _548;
    float _552 = fma(_530, _432, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _554 = fma(_534, _432, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _556 = fma(_538, _432, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _558;
    float _562 = fma(_546, _456, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _564 = fma(_550, _456, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _566 = fma(_552, _408, _522);
    float _568 = fma(_560, _456, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _570 = fma(_554, _408, _540);
    float _572 = fma(_556, _408, _542);
    float _574 = fma(_562, _448, _566);
    float _576 = fma(_564, _448, _570);
    float _578 = fma(_568, _448, _572);
    float _580 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[148].x, _574);
    float _582 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[148].y, _576);
    float _584 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[148].z, _578);
    bool _586 = !_334;
    float _604;
    if (!_586)
    {
        float _588 = in.m_35.x;
        float _590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _592 = _588 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _594 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[11].y, _112);
        float _596 = _594 * _590;
        float _598 = floor(_596);
        float _600 = -_598;
        float _602 = _596 + _600;
        _604 = _602;
        _606 = true;
    }
    else
    {
        float _608 = float(_78);
        float _610 = 1.0 / _608;
        float _612 = _112 * _610;
        _604 = _612;
    }
    _606 = false;
    float _614 = _604;
    float _616 = in.m_33.x;
    float _618 = in.m_33.y;
    float _620 = in.m_33.z;
    bool _622 = _614 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _624 = isnan(_614);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _638 = _614 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _640 = isnan(_614);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _656 = _614 + _654;
    float _658 = -_632;
    float _660 = _658 + 1.0;
    bool _662 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _664 = 1.0 / _636;
    float _666 = _648 * _660;
    float _668 = -_648;
    float _670 = _668 + 1.0;
    float _672 = _584 * _620;
    float _674 = _582 * _618;
    float _676 = _652 * _664;
    float _678 = _580 * _616;
    float _680 = fma(_676, _656, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _682 = _680 * _666;
    float _684 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[115].x, _682);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _692 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[116].x, _684);
    float _694 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = _692 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.x = _694;
    out.m_37.y = _696;
    out.m_37.z = _698;
    out.m_37.w = _700;
    bool _702 = !_662;
    float _720;
    if (!_702)
    {
        float _704 = in.m_35.x;
        float _706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _708 = _704 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[11].w, _112);
        float _712 = _710 * _706;
        float _714 = floor(_712);
        float _716 = -_714;
        float _718 = _712 + _716;
        _720 = _718;
        _722 = true;
    }
    else
    {
        float _724 = float(_78);
        float _726 = 1.0 / _724;
        float _728 = _112 * _726;
        _720 = _728;
    }
    _722 = false;
    float _730 = _720;
    float _732 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _734 = int(_732);
    float _736 = in.m_35.x;
    float _738 = in.m_35.y;
    float _740 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _742 = int(_740);
    float _744 = in.m_35.w;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _748 = in.m_35.z;
    float _750 = float(_734);
    float _752 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _754 = int(_752);
    float _756 = in.m_39.y;
    float _758 = in.m_39.x;
    float _760 = float(_742);
    float _762 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _764 = int(_762);
    bool _766 = _738 > 0.5;
    float _768 = 1.0 / _750;
    float _770 = float(_754);
    bool _772 = _744 > 0.5;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _776 = _774 != 0;
    float _778 = 1.0 / _760;
    float _780 = float(uint(_764));
    int _782 = ~_764;
    int _784 = _782 + 1;
    bool _786 = _764 == 0;
    float _788 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _790 = int(_788);
    float _792 = _768 * _112;
    float _794 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _796 = int(_794);
    float _798 = _778 * _112;
    float _800 = _778;
    float _802 = _756;
    float _804 = _758;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_776)
    {
        _800 = 1.0;
    }
    float _808 = _800;
    float _810 = _808;
    if (!_776)
    {
        _810 = 7.345489978790283203125;
    }
    float _812 = _810;
    float _814 = 1.0 / _780;
    float _816 = float(uint(_790));
    float _818 = trunc(_792);
    int _820 = int(_818);
    float _822 = float(uint(_796));
    float _824 = 1.0 / _816;
    float _826 = trunc(_798);
    int _828 = int(_826);
    float _830 = float(uint(_820));
    float _832 = _816;
    float _834 = _824;
    float _836 = _830;
    if (_776)
    {
        _832 = 1.0;
    }
    float _838 = _832;
    float _840 = _838;
    if (!_776)
    {
        _840 = 1.2345600128173828125;
    }
    float _842 = _840;
    float _844 = 1.0 / _770;
    float _846 = 1.0 / _822;
    float _848 = float(uint(_828));
    float _850 = _844 * _112;
    float _852 = _812 * _736;
    int _854 = as_type<int>(_814) + (-2);
    int _856 = as_type<int>(_824) + (-2);
    float _858 = floor(_852);
    float _860 = _844;
    if (_776)
    {
        _860 = _736;
    }
    float _862 = _860;
    float _864 = as_type<float>(_854) * _830;
    float _866 = _862;
    if (!_776)
    {
        _866 = _738;
    }
    float _868 = _866;
    float _870 = as_type<float>(_856) * _848;
    if (_776)
    {
        _834 = 1.0;
    }
    float _872 = _834;
    float _874 = _872;
    if (_776)
    {
        _836 = _736;
    }
    float _876 = _836;
    float _878 = trunc(_864);
    float _880 = precise::max(_878, 0.0);
    uint _883 = uint(_880);
    float _885 = _842 * _868;
    float _887 = _876;
    if (!_776)
    {
        _874 = 5.839270114898681640625;
    }
    float _889 = _874;
    if (!_776)
    {
        _887 = _748;
    }
    float _891 = _887;
    float _893 = trunc(_870);
    float _895 = precise::max(_893, 0.0);
    uint _897 = uint(_895);
    int _899 = ~_790;
    int _901 = _899 + 1;
    float _903 = -_858;
    float _905 = _852 + _903;
    float _907 = _889 * _891;
    float _909 = -_756;
    float _911 = _909 + 1.0;
    int _913 = _784 * int(_883);
    int _915 = _913 + _820;
    float _917 = trunc(_850);
    int _919 = int(_917);
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _923 = _921 != 0;
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _927 = _925 != 0;
    float _929 = float(uint(_915));
    int _931 = _901 * int(_897);
    int _933 = _931 + _828;
    float _935 = floor(_885);
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _939 = _937 != 0;
    float _941 = as_type<float>(_854) * _929;
    int _943 = _766 ? as_type<int>(_911) : as_type<int>(_756);
    float _945 = float(uint(_933));
    float _947 = _923 ? as_type<float>(_943) : _756;
    float _949 = trunc(_941);
    float _951 = precise::max(_949, 0.0);
    uint _953 = uint(_951);
    int _955 = as_type<int>(_846) + (-2);
    float _957 = as_type<float>(_856) * _945;
    float _959 = float(uint(_919));
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _963 = _961 != 0;
    int _965 = 0;
    int _967 = as_type<int>(_941);
    float _969 = _945;
    float _971 = _959;
    if (_939)
    {
        float _973 = -_758;
        float _975 = _973 + 1.0;
        _965 = as_type<int>(_975);
    }
    int _977 = _965;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _981 = _979 != 0;
    float _983 = as_type<float>(_955) * _959;
    int _985 = _772 ? as_type<int>(_911) : as_type<int>(_756);
    float _987 = floor(_907);
    bool _989 = _748 > 0.5;
    float _991 = -_935;
    float _993 = _885 + _991;
    float _995 = _981 ? as_type<float>(_985) : _756;
    bool _997 = _981;
    if (_927)
    {
        float _999 = -_758;
        float _1001 = _999 + 1.0;
        _967 = as_type<int>(_1001);
    }
    int _1003 = _967;
    float _1005 = float(_78);
    if (_927)
    {
        bool _1007 = _736 > 0.5;
        _997 = _1007;
    }
    bool _1009 = _997;
    float _1011 = trunc(_983);
    float _1013 = precise::max(_1011, 0.0);
    uint _1015 = uint(_1013);
    if (_963)
    {
        float _1017 = _989 ? _911 : _756;
        _802 = _1017;
    }
    float _1019 = _802;
    int _1021 = ~_796;
    int _1023 = _1021 + 1;
    if (!_927)
    {
        _969 = _758;
    }
    float _1025 = _969;
    float _1027 = 1.0 / _1005;
    float _1029 = _1025;
    if (_927)
    {
        float _1031 = _1009 ? as_type<float>(_1003) : _758;
        _1029 = _1031;
    }
    float _1033 = _1029;
    float _1035 = float(_764);
    if (!_939)
    {
        _971 = _758;
    }
    float _1037 = _971;
    float _1039 = float(_820);
    int _1041 = _1023 * int(_1015);
    int _1043 = _1041 + _919;
    float _1045 = trunc(_957);
    float _1047 = precise::max(_1045, 0.0);
    uint _1049 = uint(_1047);
    float _1051 = _1037;
    if (_939)
    {
        float _1053 = _989 ? as_type<float>(_977) : _758;
        _1051 = _1053;
    }
    float _1055 = _1051;
    float _1057 = -_987;
    float _1059 = _907 + _1057;
    bool _1061 = _1039 >= _1035;
    bool _1063 = isnan(_1039);
    bool _1065 = _1061 || _1063;
    bool _1067 = isnan(_1035);
    bool _1069 = _1065 || _1067;
    float _1071 = float(_1069);
    float _1073 = _905 * _1035;
    float _1075 = float(uint(_1043));
    float _1077 = float(_790);
    int _1079 = int(_883) + int(_953);
    float _1081 = _1035 * _112;
    int _1083 = ~_764;
    int _1085 = _1083 + 1;
    float _1087 = as_type<float>(_955) * _1075;
    float _1089 = float(_828);
    float _1091 = _1081 * _1027;
    float _1093 = _1077 * _993;
    float _1095 = trunc(_1073);
    int _1097 = int(_1095);
    float _1099 = float(_796);
    float _1101 = _1027 * _112;
    int _1103 = _1085 * _1079;
    int _1105 = _1103 + _820;
    bool _1107 = _1089 >= _1077;
    bool _1109 = isnan(_1089);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan(_1077);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    float _1119 = float(_919);
    float _1121 = _1077 * _1101;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1125 = _1123 != 0;
    float _1127 = _1099 * _1101;
    bool _1129 = uint(_1105) >= uint(_764);
    float _1131 = trunc(_1087);
    float _1133 = precise::max(_1131, 0.0);
    uint _1135 = uint(_1133);
    int _1137 = int(_897) + int(_1049);
    bool _1139 = _1119 >= _1099;
    bool _1141 = isnan(_1119);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan(_1099);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = _1099 * _1059;
    int _1153 = ~_790;
    int _1155 = _1153 + 1;
    bool _1157 = !_1125;
    int _1159 = _1157 ? 0 : 1;
    float _1161 = trunc(_1071);
    int _1163 = int(_1161);
    bool _1165 = !_1129;
    int _1167 = _1165 ? 0 : (-1);
    int _1169 = _1155 * _1137;
    int _1171 = _1169 + _828;
    int _1173 = abs(_1159);
    int _1175 = ~_1079;
    int _1177 = _1175 + _1167;
    int _1179 = _1177 + 1;
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1183 = _1181 != 0;
    int _1185 = _1097 * _1173;
    int _1187 = _1185 + _820;
    bool _1189 = uint(_1171) >= uint(_790);
    int _1191 = _764 * _1179;
    int _1193 = _1191 + _820;
    bool _1195 = !_1183;
    int _1197 = _1195 ? 0 : 1;
    float _1199 = trunc(_1093);
    int _1201 = int(_1199);
    bool _1203 = !_1189;
    int _1205 = _1203 ? 0 : (-1);
    bool _1207 = !_786;
    int _1209 = _1207 ? _1193 : (-1);
    int _1211 = ~_1163;
    int _1213 = _1211 + 1;
    int _1215 = _1213 + 1;
    int _1217 = abs(_1197);
    float _1219 = trunc(_1091);
    int _1221 = int(_1219);
    int _1223 = ~_1137;
    int _1225 = _1223 + _1205;
    int _1227 = _1225 + 1;
    int _1229 = _1209 * _1215;
    int _1231 = int(_1015) + int(_1135);
    int _1233 = ~_796;
    int _1235 = _1233 + 1;
    int _1237 = _1201 * _1217;
    int _1239 = _1237 + _828;
    int _1241 = _764 + (-1);
    float _1243 = trunc(_1117);
    int _1245 = int(_1243);
    int _1247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1249 = _1247 != 0;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1257 = _1255 != 0;
    int _1259 = _1235 * _1231;
    int _1261 = _1259 + _919;
    int _1263 = _1163 * _1241;
    int _1265 = _1263 + _1229;
    bool _1267 = !_1253;
    int _1269 = _1267 ? 0 : 1;
    bool _1271 = uint(_1261) >= uint(_796);
    int _1273 = _790 * _1227;
    int _1275 = _1273 + _828;
    bool _1277 = !_1249;
    int _1279 = _1277 ? 0 : 1;
    float _1281 = trunc(_1121);
    int _1283 = int(_1281);
    int _1285 = abs(_1269);
    int _1287 = abs(_1279);
    int _1289 = int(_1271);
    int _1291 = _1129 ? 2 : 0;
    int _1293 = _1289 | _1291;
    int _1295 = _1189 ? 4 : 0;
    int _1297 = _1293 | _1295;
    int _1299 = _963 ? 8 : 0;
    int _1301 = _1297 | _1299;
    int _1303 = _1249 ? 16 : 0;
    int _1305 = _1301 | _1303;
    int _1307 = _1253 ? 32 : 0;
    int _1309 = _1305 | _1307;
    int _1311 = _1257 ? 64 : 0;
    int _1313 = _1309 | _1311;
    int _1315 = _1313 & 1;
    int _1317 = _1265 * _1285;
    int _1319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1321 = _1319 != 0;
    bool _1323 = !_1257;
    int _1325 = _1323 ? 0 : 1;
    int _1327 = _1221 * _1287;
    int _1329 = _1327 + _1317;
    bool _1331 = _1315 != 0;
    bool _1333 = _790 == 0;
    bool _1335 = !_1321;
    int _1337 = _1335 ? 0 : 1;
    int _1339 = abs(_1325);
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1343 = _1341 != 0;
    int _1345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1347 = _1345 != 0;
    float _1349 = trunc(_1151);
    int _1351 = int(_1349);
    int _1353 = abs(_1337);
    int _1355 = _1187 * _1339;
    int _1357 = _1355 + _1329;
    int _1359 = ~_1245;
    int _1361 = _1359 + 1;
    int _1363 = _1361 + 1;
    bool _1365 = !_1333;
    int _1367 = _1365 ? _1275 : (-1);
    int _1369 = _1097 * _1353;
    int _1371 = _1369 + _1357;
    bool _1373 = !_1343;
    int _1375 = _1373 ? 0 : 1;
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1379 = _1377 != 0;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1383 = _1381 != 0;
    int _1385 = _1363 * _1367;
    int _1387 = _790 + (-1);
    int _1389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1391 = _1389 != 0;
    bool _1393 = !_1331;
    int _1395 = _1393 ? 0 : (-1);
    int _1397 = _1245 * _1387;
    int _1399 = _1397 + _1385;
    bool _1401 = !_1347;
    float _1403 = _1401 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1405 = !_1391;
    int _1407 = _1405 ? 0 : 1;
    int _1409 = ~_1231;
    int _1411 = _1409 + _1395;
    int _1413 = _1411 + 1;
    float _1415 = float(uint(_1371));
    int _1417 = abs(as_type<int>(_1403));
    int _1419 = abs(_1375);
    float _1421 = as_type<float>(_854) * _1415;
    int _1423 = abs(_1407);
    int _1425 = _1399 * _1417;
    float _1427 = trunc(_1149);
    int _1429 = int(_1427);
    bool _1431 = !_1379;
    int _1433 = _1431 ? 0 : 1;
    int _1435 = _1351 * _1423;
    int _1437 = _1435 + _919;
    bool _1439 = _796 == 0;
    int _1441 = _1283 * _1419;
    int _1443 = _1441 + _1425;
    int _1445 = abs(_1433);
    int _1447 = _796 * _1413;
    int _1449 = _1447 + _919;
    bool _1451 = !_1383;
    int _1453 = _1451 ? 0 : 1;
    float _1455 = trunc(_1421);
    float _1457 = precise::max(_1455, 0.0);
    uint _1459 = uint(_1457);
    int _1461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1463 = _1461 != 0;
    int _1465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1467 = _1465 != 0;
    int _1469 = _1239 * _1445;
    int _1471 = _1469 + _1443;
    int _1473 = abs(_1453);
    int _1475 = ~_764;
    int _1477 = _1475 + 1;
    float _1479 = float(uint(_1187));
    int _1481 = _1201 * _1473;
    int _1483 = _1481 + _1471;
    int _1485 = ~_1429;
    int _1487 = _1485 + 1;
    int _1489 = _1487 + 1;
    float _1491 = trunc(_1127);
    int _1493 = int(_1491);
    bool _1495 = !_1439;
    int _1497 = _1495 ? _1449 : (-1);
    float _1499 = as_type<float>(_854) * _1479;
    bool _1501 = !_1467;
    int _1503 = _1501 ? 0 : 1;
    int _1505 = _1489 * _1497;
    int _1507 = _796 + (-1);
    float _1509 = trunc(_1499);
    float _1511 = precise::max(_1509, 0.0);
    uint _1513 = uint(_1511);
    int _1515 = abs(_1503);
    int _1517 = _1477 * int(_1459);
    int _1519 = _1517 + _1371;
    float _1521 = float(uint(_1483));
    int _1523 = _1429 * _1507;
    int _1525 = _1523 + _1505;
    float _1527 = float(uint(_1519));
    float _1529 = as_type<float>(_856) * _1521;
    int _1531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1533 = _1531 != 0;
    int _1535 = _1525 * _1515;
    bool _1537 = !_1463;
    int _1539 = _1537 ? 0 : 1;
    float _1541 = as_type<float>(_854) * _1527;
    bool _1543 = !_1533;
    int _1545 = _1543 ? 0 : 1;
    float _1547 = trunc(_1529);
    float _1549 = precise::max(_1547, 0.0);
    uint _1551 = uint(_1549);
    int _1553 = abs(_1539);
    int _1555 = _1477 * int(_1513);
    int _1557 = _1555 + _1187;
    int _1559 = abs(_1545);
    int _1561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1563 = _1561 != 0;
    float _1565 = trunc(_1541);
    float _1567 = precise::max(_1565, 0.0);
    uint _1569 = uint(_1567);
    float _1571 = float(uint(_1557));
    int _1573 = _1493 * _1553;
    int _1575 = _1573 + _1535;
    bool _1577 = !_1563;
    int _1579 = _1577 ? 0 : 1;
    float _1581 = as_type<float>(_854) * _1571;
    int _1583 = ~_790;
    int _1585 = _1583 + 1;
    int _1587 = _1437 * _1559;
    int _1589 = _1587 + _1575;
    int _1591 = abs(_1579);
    int _1593 = ~_764;
    int _1595 = _1593 + 1;
    int _1597 = _1585 * int(_1551);
    int _1599 = _1597 + _1483;
    int _1601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1603 = _1601 != 0;
    int _1605 = _1351 * _1591;
    int _1607 = _1605 + _1589;
    float _1609 = float(uint(_1239));
    int _1611 = int(_1459) + int(_1569);
    float _1613 = as_type<float>(_856) * _1609;
    float _1615 = float(uint(_1607));
    float _1617 = trunc(_1581);
    float _1619 = precise::max(_1617, 0.0);
    uint _1621 = uint(_1619);
    float _1623 = float(uint(_1599));
    int _1625 = _1595 * _1611;
    int _1627 = _1625 + _1371;
    bool _1629 = _738 > 0.5;
    float _1631 = as_type<float>(_955) * _1615;
    int _1633 = _1585;
    float _1635 = _1521;
    float _1637 = as_type<float>(_1419);
    float _1639 = as_type<float>(_1287);
    float _1641 = _1403;
    int _1643 = _1607;
    if (_1603)
    {
        float _1645 = -_758;
        float _1647 = _1645 + 1.0;
        _1633 = as_type<int>(_1647);
    }
    int _1649 = _1633;
    float _1651 = as_type<float>(_856) * _1623;
    bool _1653 = uint(_1627) >= uint(_764);
    float _1655 = trunc(_1613);
    float _1657 = precise::max(_1655, 0.0);
    uint _1659 = uint(_1657);
    int _1661 = ~_796;
    int _1663 = _1661 + 1;
    bool _1665 = !_1653;
    int _1667 = _1665 ? 0 : (-1);
    if (_1603)
    {
        float _1669 = _1629 ? as_type<float>(_1649) : _758;
        _804 = _1669;
    }
    float _1671 = _804;
    int _1673 = ~_1611;
    int _1675 = _1673 + _1667;
    int _1677 = _1675 + 1;
    float _1679 = trunc(_1631);
    float _1681 = precise::max(_1679, 0.0);
    uint _1683 = uint(_1681);
    int _1685 = int(_1513) + int(_1621);
    float _1687 = float(uint(_1437));
    int _1689 = _764 * _1677;
    int _1691 = _1689 + _1371;
    bool _1693 = _764 == 0;
    float _1695 = trunc(_1651);
    float _1697 = precise::max(_1695, 0.0);
    uint _1699 = uint(_1697);
    float _1701 = as_type<float>(_955) * _1687;
    int _1703 = ~_790;
    int _1705 = _1703 + 1;
    bool _1707 = !_1693;
    int _1709 = _1707 ? _1691 : (-1);
    int _1711 = ~_796;
    int _1713 = _1711 + 1;
    int _1715 = _1663 * int(_1683);
    int _1717 = _1715 + _1607;
    float _1719 = trunc(_1701);
    float _1721 = precise::max(_1719, 0.0);
    uint _1723 = uint(_1721);
    int _1725 = ~_790;
    int _1727 = _1725 + 1;
    int _1729 = _1709 & 3;
    bool _1731 = _1729 != 0;
    float _1733 = float(uint(_1717));
    int _1735 = int(_1551) + int(_1699);
    int _1737 = _1709 & 3;
    bool _1739 = _1737 != 0;
    float _1741 = as_type<float>(_955) * _1733;
    int _1743 = _1727 * int(_1659);
    int _1745 = _1743 + _1239;
    int _1747 = _1731 ? 0 : 1;
    int _1749 = _1705 * _1735;
    int _1751 = _1749 + _1483;
    bool _1753 = uint(_1737) > 1u;
    float _1755 = trunc(_1741);
    float _1757 = precise::max(_1755, 0.0);
    uint _1759 = uint(_1757);
    float _1761 = float(uint(_1745));
    int _1763 = _1713 * int(_1723);
    int _1765 = _1763 + _1437;
    bool _1767 = uint(_1751) >= uint(_790);
    int _1769 = ~_764;
    int _1771 = _1769 + 1;
    float _1773 = as_type<float>(_856) * _1761;
    bool _1775 = !_1767;
    int _1777 = _1775 ? 0 : (-1);
    bool _1779 = _1737 != 3;
    int _1781 = _1771 * _1685;
    int _1783 = _1781 + _1187;
    int _1785 = ~_1735;
    int _1787 = _1785 + _1777;
    int _1789 = _1787 + 1;
    float _1791 = trunc(_1773);
    float _1793 = precise::max(_1791, 0.0);
    uint _1795 = uint(_1793);
    int _1797 = ~_1747;
    int _1799 = _1797 + 1;
    int _1801 = _1799 + 1;
    int _1803 = _1801;
    if (!_1753)
    {
        int _1805 = ~_1747;
        int _1807 = _1805 + 1;
        _1803 = _1807;
    }
    int _1809 = _1803;
    int _1811 = _790 * _1789;
    int _1813 = _1811 + _1483;
    bool _1815 = uint(_1737) >= 2u;
    float _1817 = float(uint(_1765));
    int _1819 = _1815 ? 0 : 1;
    bool _1821 = uint(_1783) >= uint(_764);
    float _1823 = as_type<float>(_955) * _1817;
    bool _1825 = !_1333;
    int _1827 = _1825 ? _1813 : (-1);
    int _1829 = ~_796;
    int _1831 = _1829 + 1;
    float _1833 = trunc(_1823);
    float _1835 = precise::max(_1833, 0.0);
    uint _1837 = uint(_1835);
    int _1839 = int(_1683) + int(_1759);
    int _1841 = ~_1819;
    int _1843 = _1841 + 1;
    int _1845 = _1843 + 1;
    int _1847 = _1845;
    if (_1779)
    {
        int _1849 = ~_1819;
        int _1851 = _1849 + 1;
        _1847 = _1851;
    }
    int _1853 = _1847;
    int _1855 = _1831 * _1839;
    int _1857 = _1855 + _1607;
    int _1859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1861 = _1859 != 0;
    bool _1863 = !_1821;
    int _1865 = _1863 ? 0 : (-1);
    int _1867 = _1827 & 3;
    bool _1869 = _1867 != 0;
    bool _1871 = !_1861;
    int _1873 = _1871 ? 0 : 1;
    bool _1875 = uint(_1867) >= 2u;
    int _1877 = _1869 ? 0 : 1;
    bool _1879 = uint(_1857) >= uint(_796);
    int _1881 = _1875 ? 0 : 1;
    bool _1883 = _1867 != 3;
    int _1885 = int(_1659) + int(_1795);
    bool _1887 = !_1879;
    int _1889 = _1887 ? 0 : (-1);
    int _1891 = ~_790;
    int _1893 = _1891 + 1;
    bool _1895 = uint(_1867) > 1u;
    int _1897 = ~_1839;
    int _1899 = _1897 + _1889;
    int _1901 = _1899 + 1;
    int _1903 = _1893 * _1885;
    int _1905 = _1903 + _1239;
    int _1907 = ~_1881;
    int _1909 = _1907 + 1;
    int _1911 = _1909 + 1;
    float _1913 = _738 * 2.0;
    int _1915 = _1911;
    if (_1883)
    {
        int _1917 = ~_1881;
        int _1919 = _1917 + 1;
        _1915 = _1919;
    }
    int _1921 = _1915;
    int _1923 = _796 * _1901;
    int _1925 = _1923 + _1607;
    int _1927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1929 = _1927 != 0;
    float _1931 = _748 * 2.0;
    bool _1933 = uint(_1905) >= uint(_790);
    float _1935 = floor(_1913);
    bool _1937 = !_1439;
    int _1939 = _1937 ? _1925 : (-1);
    int _1941 = ~_1877;
    int _1943 = _1941 + 1;
    int _1945 = _1943 + 1;
    int _1947 = _1945;
    if (!_1895)
    {
        int _1949 = ~_1877;
        int _1951 = _1949 + 1;
        _1947 = _1951;
    }
    int _1953 = _1947;
    float _1955 = _736 * 2.0;
    bool _1957 = !_1933;
    int _1959 = _1957 ? 0 : (-1);
    float _1961 = floor(_1931);
    int _1963 = _1827 & 3;
    bool _1965 = _1963 != 0;
    int _1967 = _1939 & 3;
    bool _1969 = _1967 != 0;
    bool _1971 = !_1965;
    int _1973 = _1971 ? 0 : 1;
    bool _1975 = _1967 != 3;
    float _1977 = floor(_1955);
    if (_1929)
    {
        _806 = 0;
    }
    int _1979 = _806;
    int _1981 = _1979;
    if (!_1929)
    {
        _1981 = 1;
    }
    int _1983 = _1981;
    bool _1985 = !_1739;
    int _1987 = _1985 ? 0 : 1;
    bool _1989 = uint(_1967) >= 2u;
    bool _1991 = _1983 != 1;
    int _1993 = _1989 ? 0 : 1;
    int _1995 = int(_1723) + int(_1837);
    int _1997 = ~_1993;
    int _1999 = _1997 + 1;
    int _2001 = _1999 + 1;
    int _2003 = _2001;
    if (_1975)
    {
        int _2005 = ~_1993;
        int _2007 = _2005 + 1;
        _2003 = _2007;
    }
    int _2009 = _2003;
    int _2011 = _1939 & 3;
    bool _2013 = _2011 != 0;
    bool _2015 = _1977 > 0.0;
    int _2017 = ~_796;
    int _2019 = _2017 + 1;
    bool _2021 = !_2013;
    int _2023 = _2021 ? 0 : 1;
    bool _2025 = _1977 >= 0.0;
    bool _2027 = isnan(_1977);
    bool _2029 = _2025 || _2027;
    bool _2031 = isnan(0.0);
    bool _2033 = _2029 || _2031;
    int _2035 = _2019 * _1995;
    int _2037 = _2035 + _1437;
    int _2039 = _1969 ? 0 : 1;
    int _2041 = _2033 ? 0 : 1;
    bool _2043 = uint(_2037) >= uint(_796);
    int _2045 = ~_2041;
    int _2047 = _2045 + 1;
    int _2049 = _2047 + 1;
    int _2051 = _2049;
    if (!_2015)
    {
        int _2053 = ~_2041;
        int _2055 = _2053 + 1;
        _2051 = _2055;
    }
    int _2057 = _2051;
    bool _2059 = _1867 != 3;
    bool _2061 = uint(_1967) > 1u;
    bool _2063 = !_2043;
    int _2065 = _2063 ? 0 : (-1);
    bool _2067 = _1935 > 0.0;
    if (!_1991)
    {
        _1635 = _738;
    }
    float _2069 = _1635;
    float _2071 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2073 = _2071 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2075 = _1935 >= 0.0;
    bool _2077 = isnan(_1935);
    bool _2079 = _2075 || _2077;
    bool _2081 = isnan(0.0);
    bool _2083 = _2079 || _2081;
    float _2085 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2087 = _2069;
    if (!_1991)
    {
        _1637 = _748;
    }
    float _2089 = _1637;
    float _2091 = 1.0 / _2073;
    float _2093 = _2089;
    if (!_1991)
    {
        _1639 = _2069;
    }
    float _2095 = _1639;
    float _2097 = _2095;
    if (!_1991)
    {
        _1641 = _748;
    }
    float _2099 = _1641;
    float _2101 = _2099;
    if (_1991)
    {
        _2097 = _736;
    }
    float _2103 = _2097;
    if (_1991)
    {
        _2087 = _736;
    }
    float _2105 = _2087;
    if (_1991)
    {
        _2093 = _738;
    }
    float _2107 = _2093;
    float _2109 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2085);
    if (_1991)
    {
        _2101 = _738;
    }
    float _2111 = _2101;
    float _2113 = _736 + _738;
    bool _2115 = _1737 != 3;
    float _2117 = _2103 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2119 = _2083 ? 0 : 1;
    float _2121 = _2113 + (-1.0);
    bool _2123 = _1967 != 3;
    float _2125 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_1929)
    {
        _1643 = 0;
    }
    int _2127 = _1643;
    float _2129 = _2107 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2131 = ~_2039;
    int _2133 = _2131 + 1;
    int _2135 = _2133 + 1;
    int _2137 = _2127;
    int _2139 = _2135;
    if (!_1929)
    {
        _2137 = 2;
    }
    int _2141 = _2137;
    if (!_2061)
    {
        int _2143 = ~_2039;
        int _2145 = _2143 + 1;
        _2139 = _2145;
    }
    int _2147 = _2139;
    float _2149 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2151 = !_2115;
    int _2153 = _2151 ? 0 : (-1);
    float _2155 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2125);
    int _2157 = ~_2119;
    int _2159 = _2157 + 1;
    int _2161 = _2159 + 1;
    float _2163 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2149);
    bool _2165 = !_2123;
    int _2167 = _2165 ? 0 : (-1);
    float _2169 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2155);
    int _2171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2173 = _2171 != 0;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2177 = _2175 != 0;
    int _2179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2181 = _2179 != 0;
    float _2183 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2163);
    int _2185 = _2161;
    if (!_2067)
    {
        int _2187 = ~_2119;
        int _2189 = _2187 + 1;
        _2185 = _2189;
    }
    int _2191 = _2185;
    float _2193 = _736 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2197 = _2195 != 0;
    float _2199 = _2183 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2203 = _2201 != 0;
    float _2205 = _2169 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2207 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2209 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2207;
    bool _2211 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2213 = isnan(_730);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2219 = _2215 || _2217;
    float _2221 = float(_2219);
    float _2223 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2225 = !_2059;
    int _2227 = _2225 ? 0 : (-1);
    float _2229 = _2209 * _2091;
    float _2231 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2233 = _738 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2235 = -_2223;
    float _2237 = fma(_2193, 2.0, _2235);
    float _2239 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2241 = _730 + _2239;
    bool _2243 = _2141 != 2;
    float _2245 = fma(_2233, -2.0, _2231);
    bool _2247 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2249 = isnan(_730);
    bool _2251 = _2247 || _2249;
    bool _2253 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2255 = _2251 || _2253;
    float _2257 = float(_2255);
    float _2259 = -_2221;
    float _2261 = _2259 + 1.0;
    float _2263 = fma(_2229, _2241, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2265 = _2257 * _2261;
    float _2267 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2109);
    float _2269 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2271 = !_2173;
    int _2273 = _2271 ? 0 : 1;
    float _2275 = _736 + _748;
    bool _2277 = _1961 >= 0.0;
    bool _2279 = isnan(_1961);
    bool _2281 = _2277 || _2279;
    bool _2283 = isnan(0.0);
    bool _2285 = _2281 || _2283;
    float _2287 = _2263 * _2265;
    float _2289 = -_2257;
    float _2291 = _2289 + 1.0;
    float _2293 = _2275 + (-1.0);
    int _2295 = _2285 ? 0 : 1;
    float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2299 = _2199 + _2297;
    bool _2301 = _1961 > 0.0;
    float _2303 = fma(_2293, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2305 = _738 + _748;
    float _2307 = fma(_2291, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2287);
    int _2309 = ~_2295;
    int _2311 = _2309 + 1;
    int _2313 = _2311 + 1;
    float _2315 = _2305 + (-1.0);
    float _2317 = _2293;
    int _2319 = _2313;
    if (_2243)
    {
        _2317 = _736;
    }
    float _2321 = _2317;
    float _2323 = _2267 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2325 = fma(_2315, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2327 = fma(_2221, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2307);
    float _2329 = _2299 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2331 = _2321;
    if (!_2301)
    {
        int _2333 = ~_2295;
        int _2335 = _2333 + 1;
        _2319 = _2335;
    }
    int _2337 = _2319;
    float _2339 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2341 = _2205 + _2339;
    if (!_2243)
    {
        _2331 = _748;
    }
    float _2343 = _2331;
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2347 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2349 = _2323 + _2347;
    float _2351 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2329);
    float _2353 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2355 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2357 = _1709 >> 31;
    float _2359 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2351);
    float _2361 = -_2345;
    float _2363 = fma(_2355, 2.0, _2361);
    int _2365 = _2357 & 3;
    float _2367 = _2353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2369 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2371 = _1709 + _2365;
    float _2373 = _2327 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2375 = _1827 >> 31;
    float _2377 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2379 = _2359 >= 0.0;
    float _2381 = _2369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2383 = _2371 >> 2;
    float _2385 = _2377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2387 = _1939 >> 31;
    float _2389 = -_112;
    float _2391 = fma(_2389, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2237);
    int _2393 = _2375 & 3;
    float _2395 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2245);
    int _2397 = _2383 << 4;
    int _2399 = _2397 + 368;
    out.m_41.x = _2385;
    out.m_41.y = _2381;
    out.m_41.z = _2367;
    out.m_41.w = _2373;
    int _2401 = _2387 & 3;
    float _2403 = -_112;
    float _2405 = fma(_2403, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2363);
    int _2407 = _1827 + _2393;
    if (_2379)
    {
        out.m_29.x = 0.0;
    }
    int _2409 = _1939 + _2401;
    float _2411 = _748 + (-0.5);
    int _2413 = _2407 >> 2;
    int _2415 = _2413 << 4;
    int _2417 = _2415 + 512;
    uint _2419 = uint(int(uint(_2399) >> uint(2)));
    uint _2421 = uint(int(uint(int(_2419)) >> uint(2)));
    int _2423 = int(_2419) & 3;
    float _2425 = (*spvDescriptorSet0.vp_c9)._m0[int(_2421)][_2423];
    int _2427 = int(_2419) + 1;
    uint _2429 = uint(int(uint(_2427) >> uint(2)));
    int _2431 = _2427 & 3;
    float _2433 = (*spvDescriptorSet0.vp_c9)._m0[int(_2429)][_2431];
    int _2435 = _2409 >> 2;
    float _2437 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2439 = !_2177;
    int _2441 = _2439 ? 0 : 1;
    float _2443 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2445 = _2435 << 4;
    int _2447 = _2445 + 656;
    uint _2449 = uint(int(uint(_2417) >> uint(2)));
    uint _2451 = uint(int(uint(int(_2449)) >> uint(2)));
    int _2453 = int(_2449) & 3;
    float _2455 = (*spvDescriptorSet0.vp_c9)._m0[int(_2451)][_2453];
    int _2457 = int(_2449) + 1;
    uint _2459 = uint(int(uint(_2457) >> uint(2)));
    int _2461 = _2457 & 3;
    float _2463 = (*spvDescriptorSet0.vp_c9)._m0[int(_2459)][_2461];
    int _2465 = abs(_2441);
    float _2467 = -_2443;
    float _2469 = fma(_2117, 2.0, _2467);
    float _2471 = float(_2057);
    float _2473 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2437);
    float _2475 = fma(_2111, (*spvDescriptorSet0.vp_c9)._m0[83].w, _746);
    float _2477 = float(_2465);
    float _2479 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    uint _2481 = uint(int(uint(_2447) >> uint(2)));
    uint _2483 = uint(int(uint(int(_2481)) >> uint(2)));
    int _2485 = int(_2481) & 3;
    float _2487 = (*spvDescriptorSet0.vp_c9)._m0[int(_2483)][_2485];
    int _2489 = int(_2481) + 1;
    uint _2491 = uint(int(uint(_2489) >> uint(2)));
    int _2493 = _2489 & 3;
    float _2495 = (*spvDescriptorSet0.vp_c9)._m0[int(_2491)][_2493];
    int _2497 = abs(_2273);
    float _2499 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2501 = int(_2499);
    float _2503 = float(_2337);
    float _2505 = fma(_2129, -2.0, _2479);
    bool _2507 = !_2181;
    int _2509 = _2507 ? 0 : 1;
    float _2511 = _2477 * _2471;
    float _2513 = float(_2497);
    int _2515 = _2417 + 8;
    uint _2517 = uint(int(uint(_2515) >> uint(2)));
    uint _2519 = uint(int(uint(int(_2517)) >> uint(2)));
    int _2521 = int(_2517) & 3;
    float _2523 = (*spvDescriptorSet0.vp_c9)._m0[int(_2519)][_2521];
    int _2525 = int(_2517) + 1;
    uint _2527 = uint(int(uint(_2525) >> uint(2)));
    int _2529 = _2525 & 3;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[int(_2527)][_2529];
    int _2533 = ~_1885;
    int _2535 = _2533 + _1959;
    int _2537 = _2535 + 1;
    float _2539 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2473);
    int _2541 = abs(_2509);
    float _2543 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2475);
    float _2545 = float(_2191);
    int _2547 = _790 * _2537;
    int _2549 = _2547 + _1239;
    int _2551 = ~_1685;
    int _2553 = _2551 + _1865;
    int _2555 = _2553 + 1;
    int _2557 = _2399 + 8;
    uint _2559 = uint(int(uint(_2557) >> uint(2)));
    uint _2561 = uint(int(uint(int(_2559)) >> uint(2)));
    int _2563 = int(_2559) & 3;
    float _2565 = (*spvDescriptorSet0.vp_c9)._m0[int(_2561)][_2563];
    int _2567 = int(_2559) + 1;
    uint _2569 = uint(int(uint(_2567) >> uint(2)));
    int _2571 = _2567 & 3;
    float _2573 = (*spvDescriptorSet0.vp_c9)._m0[int(_2569)][_2571];
    float _2575 = _2513 * _2503;
    int _2577 = abs(_1953);
    float _2579 = -_112;
    float _2581 = fma(_2579, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2469);
    int _2583 = abs(_2147);
    int _2585 = _764 * _2555;
    int _2587 = _2585 + _1187;
    int _2589 = abs(_1809);
    float _2591 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2505);
    int _2593 = _2447 + 8;
    uint _2595 = uint(int(uint(_2593) >> uint(2)));
    uint _2597 = uint(int(uint(int(_2595)) >> uint(2)));
    int _2599 = int(_2595) & 3;
    float _2601 = (*spvDescriptorSet0.vp_c9)._m0[int(_2597)][_2599];
    int _2603 = int(_2595) + 1;
    uint _2605 = uint(int(uint(_2603) >> uint(2)));
    int _2607 = _2603 & 3;
    float _2609 = (*spvDescriptorSet0.vp_c9)._m0[int(_2605)][_2607];
    int _2611 = abs(_1987);
    float _2613 = _2511 * (-2.0);
    int _2615 = ~_2611;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = ~_2589;
    int _2623 = _2621 + 1;
    int _2625 = _2623 + 1;
    int _2627 = abs(_1973);
    int _2629 = _2625 * as_type<int>(_2433);
    int _2631 = ~_1995;
    int _2633 = _2631 + _2065;
    int _2635 = _2633 + 1;
    int _2637 = ~_2577;
    int _2639 = _2637 + 1;
    int _2641 = _2639 + 1;
    int _2643 = _2619 * as_type<int>(_2425);
    int _2645 = _2643 + _2629;
    int _2647 = _796 * _2635;
    int _2649 = _2647 + _1437;
    int _2651 = _2641 * as_type<int>(_2463);
    int _2653 = abs(_2023);
    float _2655 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2657 = int(_2655);
    int _2659 = abs(_1853);
    float _2661 = _2575 * (-2.0);
    int _2663 = abs(_1921);
    int _2665 = ~_2627;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    int _2671 = ~_2583;
    int _2673 = _2671 + 1;
    int _2675 = _2673 + 1;
    float _2677 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2679 = log2(_2677);
    int _2681 = _2669 * as_type<int>(_2455);
    int _2683 = _2681 + _2651;
    int _2685 = ~_2663;
    int _2687 = _2685 + 1;
    int _2689 = _2687 + 1;
    int _2691 = _2675 * as_type<int>(_2495);
    int _2693 = ~_2653;
    int _2695 = _2693 + 1;
    int _2697 = _2695 + 1;
    int _2699 = ~_2659;
    int _2701 = _2699 + 1;
    int _2703 = _2701 + 1;
    float _2705 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2707 = int(_2705);
    int _2709 = _2689 * as_type<int>(_2523);
    int _2711 = _2709 + _2683;
    int _2713 = abs(_2153);
    int _2715 = _2697 * as_type<int>(_2487);
    int _2717 = _2715 + _2691;
    int _2719 = abs(_2009);
    int _2721 = _2703 * as_type<int>(_2565);
    int _2723 = _2721 + _2645;
    int _2725 = abs(_2227);
    int _2727 = ~_2713;
    int _2729 = _2727 + 1;
    int _2731 = _2729 + 1;
    int _2733 = abs(_2167);
    int _2735 = ~_2719;
    int _2737 = _2735 + 1;
    int _2739 = _2737 + 1;
    int _2741 = _2731 * as_type<int>(_2573);
    int _2743 = _2741 + _2723;
    int _2745 = ~_2725;
    int _2747 = _2745 + 1;
    int _2749 = _2747 + 1;
    float _2751 = _2679 * _112;
    int _2753 = ~_2733;
    int _2755 = _2753 + 1;
    int _2757 = _2755 + 1;
    int _2759 = _2739 * as_type<int>(_2601);
    int _2761 = _2759 + _2717;
    float _2763 = float(uint(_2501));
    int _2765 = _2749 * as_type<int>(_2531);
    int _2767 = _2765 + _2711;
    bool _2769 = !_2197;
    int _2771 = _2769 ? 0 : 1;
    int _2773 = _2757 * as_type<int>(_2609);
    int _2775 = _2773 + _2761;
    float _2777 = float(uint(_2657));
    float _2779 = 1.0 / _2763;
    bool _2781 = !_2203;
    int _2783 = _2781 ? 0 : 1;
    float _2785 = float(uint(_2707));
    int _2787 = abs(_2501);
    int _2789 = abs(_1873);
    float _2791 = 1.0 / _2777;
    int _2793 = abs(_2771);
    int _2795 = abs(_2783);
    int _2797 = ~_2793;
    int _2799 = _2797 + 1;
    int _2801 = _2799 + 1;
    float _2803 = float(uint(_2787));
    float _2805 = 1.0 / _2785;
    bool _2807 = _790 == 0;
    int _2809 = _2801 * _2767;
    int _2811 = ~_2789;
    int _2813 = _2811 + 1;
    int _2815 = _2813 + 1;
    bool _2817 = _764 == 0;
    int _2819 = abs(_2657);
    float _2821 = 1.0 / _2803;
    int _2823 = ~_2795;
    int _2825 = _2823 + 1;
    int _2827 = _2825 + 1;
    int _2829 = _2743 * _2815;
    bool _2831 = !_2807;
    int _2833 = _2831 ? _2549 : (-1);
    bool _2835 = !_2817;
    int _2837 = _2835 ? _2587 : (-1);
    int _2839 = _2827 * _2775;
    float _2841 = float(uint(_2819));
    int _2843 = _2833 * _2793;
    int _2845 = _2843 + _2809;
    bool _2847 = !_1439;
    int _2849 = _2847 ? _2649 : (-1);
    int _2851 = _2837 * _2789;
    int _2853 = _2851 + _2829;
    int _2855 = abs(_2707);
    float _2857 = exp2(_2751);
    int _2859 = as_type<int>(_2779) + (-2);
    int _2861 = _2849 * _2795;
    int _2863 = _2861 + _2839;
    int _2865 = as_type<int>(_2791) + (-2);
    float _2867 = in.m_43.x;
    float _2869 = in.m_43.y;
    float _2871 = in.m_43.z;
    float _2873 = float(uint(_2845));
    float _2875 = 1.0 / _2841;
    float _2877 = float(uint(_2853));
    float _2879 = as_type<float>(_2865) * _2873;
    int _2881 = as_type<int>(_2805) + (-2);
    int _2883 = abs(_2853);
    float _2885 = as_type<float>(_2859) * _2877;
    float _2887 = float(uint(_2855));
    float _2889 = trunc(_2879);
    float _2891 = precise::max(_2889, 0.0);
    uint _2893 = uint(_2891);
    float _2895 = float(uint(_2863));
    int _2897 = as_type<int>(_2821) + (-2);
    float _2899 = float(uint(_2883));
    float _2901 = as_type<float>(_2881) * _2895;
    float _2903 = _2877;
    float _2905 = _2791;
    float _2907 = as_type<float>(_2855);
    if (_2243)
    {
        _2903 = _738;
    }
    float _2909 = _2903;
    float _2911 = 1.0 / _2887;
    float _2913 = _2909;
    if (!_2243)
    {
        _2913 = _736;
    }
    float _2915 = _2913;
    float _2917 = as_type<float>(_2897) * _2899;
    if (_2379)
    {
        _2905 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2919 = _2905;
    float _2921 = fma(_2269, _2661, _2269);
    int _2923 = abs(_2845);
    float _2925 = _2915 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2927 = as_type<int>(_2875) + (-2);
    float _2929 = trunc(_2885);
    float _2931 = precise::max(_2929, 0.0);
    uint _2933 = uint(_2931);
    int _2935 = as_type<int>(_2919);
    if (_2379)
    {
        float _2937 = _2919 * 5.0;
        _2935 = as_type<int>(_2937);
    }
    int _2939 = _2935;
    float _2941 = float(uint(_2923));
    float _2943 = fma(_2661, _2867, _2867);
    if (_2379)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8274 = as_type<float>(_2939);
        out.gl_Position.z = _8274;
    }
    float _2945 = as_type<float>(_2927) * _2941;
    float _2947 = trunc(_2901);
    float _2949 = precise::max(_2947, 0.0);
    uint _2951 = uint(_2949);
    int _2953 = ~_2657;
    int _2955 = _2953 + 1;
    int _2957 = as_type<int>(_2911) + (-2);
    int _2959 = _2955 * int(_2893);
    int _2961 = _2959 + _2845;
    bool _2963 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2965 = isnan(1.0);
    bool _2967 = _2963 || _2965;
    bool _2969 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2971 = _2967 || _2969;
    float _2973 = trunc(_2917);
    float _2975 = precise::max(_2973, 0.0);
    uint _2977 = uint(_2975);
    int _2979 = ~_2707;
    int _2981 = _2979 + 1;
    float _2983 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2985 = 1.0 + _2983;
    int _2987 = ~_2501;
    int _2989 = _2987 + 1;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2993 = abs(_2863);
    float _2995 = float(uint(_2961));
    int _2997 = _2989 * int(_2933);
    int _2999 = _2997 + _2853;
    int _3001 = ~_2787;
    int _3003 = _3001 + 1;
    float _3005 = trunc(_2945);
    float _3007 = precise::max(_3005, 0.0);
    uint _3009 = uint(_3007);
    float _3011 = float(uint(_2993));
    int _3013 = _2981 * int(_2951);
    int _3015 = _3013 + _2863;
    float _3017 = fma(_2925, -2.0, _2991);
    int _3019 = ~_2819;
    int _3021 = _3019 + 1;
    int _3023 = _3003 * int(_2977);
    int _3025 = _3023 + _2883;
    float _3027 = as_type<float>(_2957) * _3011;
    float _3029 = float(uint(_2999));
    float _3031 = 1.0 / _2985;
    float _3033 = float(uint(_3015));
    float _3035 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3017);
    float _3037 = float(uint(_3025));
    float _3039 = as_type<float>(_2859) * _3029;
    float _3041 = as_type<float>(_2865) * _2995;
    int _3043 = _3021 * int(_3009);
    int _3045 = _3043 + _2923;
    float _3047 = as_type<float>(_2897) * _3037;
    float _3049 = trunc(_3027);
    float _3051 = precise::max(_3049, 0.0);
    uint _3053 = uint(_3051);
    float _3055 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3057 = as_type<float>(_2881) * _3033;
    float _3059 = float(uint(_3045));
    float _3061 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3063 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3055);
    int _3065 = ~_2855;
    int _3067 = _3065 + 1;
    float _3069 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3061);
    float _3071 = trunc(_3039);
    float _3073 = precise::max(_3071, 0.0);
    uint _3075 = uint(_3073);
    float _3077 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3063);
    float _3079 = as_type<float>(_2927) * _3059;
    float _3081 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3069);
    float _3083 = -_2857;
    float _3085 = _3083 + 1.0;
    bool _3087 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3089 = isnan(0.0);
    bool _3091 = _3087 || _3089;
    bool _3093 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3095 = _3091 || _3093;
    float _3097 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3099 = trunc(_3041);
    float _3101 = precise::max(_3099, 0.0);
    uint _3103 = uint(_3101);
    float _3105 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _3107 = _3067 * int(_3053);
    int _3109 = _3107 + _2993;
    float _3111 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3097);
    float _3113 = _3095 ? _3085 : 0.0;
    float _3115 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3105);
    float _3117 = float(_2541);
    float _3119 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3111);
    float _3121 = trunc(_3079);
    float _3123 = precise::max(_3121, 0.0);
    uint _3125 = uint(_3123);
    float _3127 = float(uint(_3109));
    float _3129 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3115);
    if (_2971)
    {
        float _3131 = _3113 * _3031;
        _116 = _3131;
    }
    float _3133 = _116;
    int _3135 = ~_2501;
    int _3137 = _3135 + 1;
    float _3139 = fma(_2613, _2869, _2869);
    float _3141 = as_type<float>(_2957) * _3127;
    int _3143 = int(_2933) + int(_3075);
    float _3145 = trunc(_3057);
    float _3147 = precise::max(_3145, 0.0);
    uint _3149 = uint(_3147);
    float _3151 = _736 + (-0.5);
    float _3153 = fma(_2325, _2613, _2325);
    int _3155 = int(_2893) + int(_3103);
    float _3157 = fma(_3151, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2943);
    int _3159 = ~_2657;
    int _3161 = _3159 + 1;
    int _3163 = _3137 * _3143;
    int _3165 = _3163 + _2853;
    float _3167 = trunc(_3047);
    float _3169 = precise::max(_3167, 0.0);
    uint _3171 = uint(_3169);
    int _3173 = int(_3009) + int(_3125);
    float _3175 = fma(_2921, _3133, _3157);
    int _3177 = ~_2819;
    int _3179 = _3177 + 1;
    int _3181 = _3161 * _3155;
    int _3183 = _3181 + _2845;
    int _3185 = ~_2707;
    int _3187 = _3185 + 1;
    float _3189 = _738 + (-0.5);
    int _3191 = ~_2787;
    int _3193 = _3191 + 1;
    float _3195 = trunc(_3141);
    float _3197 = precise::max(_3195, 0.0);
    uint _3199 = uint(_3197);
    int _3201 = int(_2951) + int(_3149);
    int _3203 = _3179 * _3173;
    int _3205 = _3203 + _2923;
    bool _3207 = uint(_3183) >= uint(_2657);
    float _3209 = _3175 * 0.15915493667125701904296875;
    bool _3211 = uint(_3165) >= uint(_2501);
    int _3213 = _3187 * _3201;
    int _3215 = _3213 + _2863;
    bool _3217 = uint(_3205) >= uint(_2819);
    float _3219 = _3117 * _2545;
    int _3221 = int(_2977) + int(_3171);
    float _3223 = fma(_3189, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3139);
    bool _3225 = !_3207;
    int _3227 = _3225 ? 0 : (-1);
    int _3229 = ~_2855;
    int _3231 = _3229 + 1;
    int _3233 = _3193 * _3221;
    int _3235 = _3233 + _2883;
    bool _3237 = uint(_3215) >= uint(_2707);
    float _3239 = fma(_3153, _3133, _3223);
    int _3241 = int(_3053) + int(_3199);
    bool _3243 = uint(_3235) >= uint(_2787);
    int _3245 = ~_3155;
    int _3247 = _3245 + _3227;
    int _3249 = _3247 + 1;
    int _3251 = _3231 * _3241;
    int _3253 = _3251 + _2993;
    bool _3255 = !_3211;
    int _3257 = _3255 ? 0 : (-1);
    float _3259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3261 = !_3237;
    int _3263 = _3261 ? 0 : (-1);
    int _3265 = _2657 * _3249;
    int _3267 = _3265 + _2845;
    int _3269 = ~_3143;
    int _3271 = _3269 + _3257;
    int _3273 = _3271 + 1;
    int _3275 = ~_3201;
    int _3277 = _3275 + _3263;
    int _3279 = _3277 + 1;
    int _3281 = _2845 ^ _2657;
    float _3283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3285 = !_3217;
    int _3287 = _3285 ? 0 : (-1);
    int _3289 = _2707 * _3279;
    int _3291 = _3289 + _2863;
    bool _3293 = uint(_3253) >= uint(_2855);
    int _3295 = _2853 ^ _2501;
    int _3297 = _2501 * _3273;
    int _3299 = _3297 + _2853;
    bool _3301 = !_3243;
    int _3303 = _3301 ? 0 : (-1);
    float _3305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3307 = _2501 == 0;
    float _3309 = _3259 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3311 = !_3293;
    int _3313 = _3311 ? 0 : (-1);
    int _3315 = ~_3287;
    int _3317 = _3173 + _3315;
    int _3319 = _3317 + 1;
    float _3321 = fma(_3309, _1033, -0.5);
    bool _3323 = _2657 == 0;
    float _3325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _3327 = uint(int(uint(_3295) >> uint(31)));
    float _3329 = _3283 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3331 = _2501 == 0;
    bool _3333 = _2707 == 0;
    float _3335 = fma(_947, _3329, -0.5);
    bool _3337 = _2707 == 0;
    int _3339 = _2863 ^ _2707;
    float _3341 = _3305 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3343 = ~_3303;
    int _3345 = _3221 + _3343;
    int _3347 = _3345 + 1;
    float _3349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3351 = ~_3313;
    int _3353 = _3241 + _3351;
    int _3355 = _3353 + 1;
    float _3357 = fma(_3341, _1055, -0.5);
    bool _3359 = !_3307;
    int _3361 = _3359 ? _3299 : (-1);
    bool _3363 = !_3323;
    int _3365 = _3363 ? _3267 : (-1);
    int _3367 = ~int(_3327);
    int _3369 = _3367 + 1;
    float _3371 = float(_3361);
    int _3373 = _3347 ^ _3369;
    float _3375 = float(_3365);
    float _3377 = fma(_3309, _3371, _2391);
    uint _3379 = uint(int(uint(_3281) >> uint(31)));
    float _3381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3383 = uint(int(uint(_3339) >> uint(31)));
    float _3385 = _3325 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3387 = !_3333;
    int _3389 = _3387 ? _3291 : (-1);
    float _3391 = fma(_3341, _3375, _2581);
    int _3393 = ~_3369;
    int _3395 = _3393 + _3373;
    int _3397 = _3395 + 1;
    float _3399 = fma(_3385, _1671, -0.5);
    int _3401 = ~int(_3379);
    int _3403 = _3401 + 1;
    float _3405 = fma(_2539, _3357, _3391);
    int _3407 = ~int(_3383);
    int _3409 = _3407 + 1;
    float _3411 = _2299 * _2299;
    float _3413 = float(_3389);
    float _3415 = fma(_3081, _3321, _3377);
    bool _3417 = !_3331;
    int _3419 = _3417 ? _3397 : (-1);
    int _3421 = _3319 ^ _3403;
    float _3423 = fma(_3385, _3413, _2405);
    int _3425 = _3355 ^ _3409;
    float _3427 = _3349 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3429 = float(_3419);
    float _3431 = fma(_3119, _3399, _3423);
    bool _3433 = _2657 == 0;
    int _3435 = ~_3403;
    int _3437 = _3435 + _3421;
    int _3439 = _3437 + 1;
    float _3441 = -_2395;
    float _3443 = fma(_3329, _3429, _3441);
    int _3445 = ~_3409;
    int _3447 = _3445 + _3425;
    int _3449 = _3447 + 1;
    float _3451 = _3381 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3453 = !_3433;
    int _3455 = _3453 ? _3439 : (-1);
    float _3457 = fma(_3077, _3335, _3443);
    bool _3459 = !_3337;
    int _3461 = _3459 ? _3449 : (-1);
    float _3463 = fma(_995, _3451, -0.5);
    float _3465 = float(_3455);
    float _3467 = _3431 + 0.5;
    float _3469 = float(_3461);
    float _3471 = fma(_2341, _2341, _3411);
    float _3473 = _3457 + 0.5;
    float _3475 = -_2591;
    float _3477 = fma(_3451, _3465, _3475);
    float _3479 = fma(_3427, _1019, -0.5);
    float _3481 = fma(_2349, _2349, _3471);
    float _3483 = -_3035;
    float _3485 = fma(_3427, _3469, _3483);
    float _3487 = fma(_2543, _3463, _3477);
    float _3489 = _3415 + 0.5;
    float _3491 = rsqrt(_3481);
    float _3493 = fma(_3129, _3479, _3485);
    float _3495 = _3487 + 0.5;
    float _3497 = _3405 + 0.5;
    float _3499 = _3219 * (-2.0);
    float _3501 = _3493 + 0.5;
    float _3503 = _3209 * 6.283185482025146484375;
    float _3505 = sin(_3503);
    out.m_45.x = _3489;
    out.m_45.y = _3473;
    out.m_45.z = _3497;
    out.m_45.w = _3495;
    float _3507 = fma(_2303, _3499, _2303);
    float _3509 = fma(_3499, _2871, _2871);
    out.m_47.x = _3467;
    out.m_47.y = _3501;
    float _3511 = _3209 * 6.283185482025146484375;
    float _3513 = cos(_3511);
    float _3515 = _2299 * _3491;
    float _3517 = _2341 * _3491;
    if (_2379)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3519 = -_3515;
    float _3521 = fma(_3519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2199);
    float _3523 = -_3517;
    float _3525 = fma(_3523, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2205);
    float _3527 = _2349 * _3491;
    float _3529 = _3239 * 0.15915493667125701904296875;
    float _3531 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3533 = _3521 + _3531;
    float _3535 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3537 = _3525 + _3535;
    float _3539 = -_3515;
    float _3541 = fma(_3539, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2299);
    float _3543 = fma(_2411, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3509);
    float _3545 = _3533 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3547 = -_3527;
    float _3549 = fma(_3547, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2323);
    float _3551 = -_3517;
    float _3553 = fma(_3551, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2341);
    float _3555 = fma(_3507, _3133, _3543);
    float _3557 = fma(_3537, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3545);
    float _3559 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3561 = _3549 + _3559;
    float _3563 = _3541 * _3541;
    float _3565 = _3529 * 6.283185482025146484375;
    float _3567 = sin(_3565);
    float _3569 = _3555 * 0.15915493667125701904296875;
    float _3571 = fma(_3561, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3557);
    float _3573 = fma(_3553, _3553, _3563);
    float _3575 = -_3527;
    float _3577 = fma(_3575, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2349);
    bool _3579 = _3571 >= 0.0;
    float _3581 = _3529 * 6.283185482025146484375;
    float _3583 = cos(_3581);
    float _3585 = fma(_3577, _3577, _3573);
    float _3587 = _3569 * 6.283185482025146484375;
    float _3589 = sin(_3587);
    float _3591 = _3505 * _3567;
    float _3593 = _3555;
    if (_3579)
    {
        _3593 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3595 = _3593;
    int _3597 = as_type<int>(_3595);
    if (_3579)
    {
        out.m_29.x = 0.0;
    }
    float _3599 = sqrt(_3585);
    if (_3579)
    {
        float _3601 = _3595 * 5.0;
        _3597 = as_type<int>(_3601);
    }
    int _3603 = _3597;
    float _3605 = _3513 * _3583;
    if (_3579)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9273 = as_type<float>(_3603);
        out.gl_Position.z = _9273;
    }
    float _3607 = fma(_3589, _3605, _3591);
    float _3609 = fma(_3589, _3591, _3605);
    float _3611 = _3491 * _3599;
    if (_3579)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3613 = -_2199;
    float _3615 = _3613 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3617 = -_2205;
    float _3619 = _3617 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3621 = -_2323;
    float _3623 = _3621 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3625 = _3569 * 6.283185482025146484375;
    float _3627 = cos(_3625);
    float _3629 = _3615 * _3615;
    float _3631 = in.m_49.x;
    float _3633 = in.m_49.y;
    float _3635 = in.m_49.z;
    float _3637 = _672 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3639 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3641 = fma(_3619, _3619, _3629);
    float _3643 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3645 = _3611 * _3637;
    float _3647 = _3611 * _3639;
    float _3649 = fma(_3623, _3623, _3641);
    float _3651 = _3611 * _3643;
    float _3653 = _3513 * _3567;
    float _3655 = _3505 * _3583;
    float _3657 = rsqrt(_3649);
    float _3659 = -_3653;
    float _3661 = fma(_3589, _3655, _3659);
    float _3663 = _3505 * _3627;
    float _3665 = -_3655;
    float _3667 = fma(_3589, _3653, _3665);
    float _3669 = _3513 * _3627;
    float _3671 = in.m_51.x;
    float _3673 = in.m_51.y;
    float _3675 = in.m_51.z;
    float _3677 = _3583 * _3627;
    float _3679 = _3567 * _3627;
    bool _3681 = _3633 != 0.0;
    bool _3683 = isnan(_3633);
    bool _3685 = _3681 || _3683;
    bool _3687 = isnan(0.0);
    bool _3689 = _3685 || _3687;
    float _3691 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3631);
    float _3693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3633);
    float _3695 = _3619 * _3657;
    float _3697 = _3623 * _3657;
    float _3699 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3635);
    float _3701 = _3615 * _3657;
    float _3703 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3705 = _3695 * _3703;
    float _3707 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3709 = _3697 * _3707;
    bool _3711 = _3631 == 0.0;
    bool _3713 = !_3689;
    bool _3715 = _3711 && _3713;
    float _3717 = _3647 * _3693;
    float _3719 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3721 = -_3705;
    float _3723 = fma(_3697, _3719, _3721);
    float _3725 = _3651 * _3691;
    float _3727 = _3645 * _3699;
    float _3729 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3731 = -_3709;
    float _3733 = fma(_3701, _3729, _3731);
    float _3735 = in.m_53.x;
    float _3737 = in.m_53.y;
    float _3739 = in.m_53.z;
    float _3741 = in.m_53.w;
    bool _3743 = _3635 == 0.0;
    bool _3745 = _3743 && _3715;
    float _3747 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3749 = _3701 * _3747;
    float _3751 = _3723 * _3723;
    float _3753 = -_3717;
    float _3755 = _3589 * _3753;
    float _3757 = _3669 * _3717;
    float _3759 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3761 = -_3749;
    float _3763 = fma(_3695, _3759, _3761);
    float _3765 = fma(_3733, _3733, _3751);
    float _3767 = _3663 * _3717;
    float _3769 = fma(_3677, _3725, _3755);
    float _3771 = fma(_3607, _3725, _3757);
    float _3773 = fma(_3763, _3763, _3765);
    float _3775 = fma(_3661, _3725, _3767);
    float _3777 = _3651;
    float _3779 = _3767;
    float _3781 = _3725;
    float _3783 = _3765;
    float _3785 = _3671;
    if (_3745)
    {
        _3777 = _3671;
    }
    float _3787 = _3777;
    float _3789 = rsqrt(_3773);
    float _3791 = _3787;
    if (_3745)
    {
        _2907 = _3673;
    }
    float _3793 = _2907;
    float _3795 = fma(_3667, _3727, _3771);
    float _3797 = _3793;
    if (_3745)
    {
        _3779 = _3675;
    }
    float _3799 = _3779;
    float _3801 = _3799;
    if (_3745)
    {
        _3781 = _3787;
    }
    float _3803 = _3781;
    float _3805 = _3803;
    if (!_3745)
    {
        _3791 = _3671;
    }
    float _3807 = _3791;
    if (_3745)
    {
        _3783 = _3793;
    }
    float _3809 = _3783;
    float _3811 = _3809;
    if (!_3745)
    {
        _3797 = _3673;
    }
    float _3813 = _3797;
    float _3815 = _3739 * _3807;
    if (_3745)
    {
        _3785 = _3799;
    }
    float _3817 = _3785;
    float _3819 = fma(_3679, _3727, _3769);
    float _3821 = _3817;
    if (!_3745)
    {
        _3801 = _3675;
    }
    float _3823 = _3801;
    if (!_3745)
    {
        float _3825 = fma(_3633, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3813);
        _3811 = _3825;
    }
    float _3827 = _3811;
    float _3829 = fma(_3609, _3727, _3775);
    float _3831 = _3723 * _3789;
    float _3833 = _3763 * _3789;
    float _3835 = _3737 * _3823;
    float _3837 = -_3815;
    float _3839 = fma(_3735, _3823, _3837);
    if (!_3745)
    {
        float _3841 = fma(_3635, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3823);
        _3821 = _3841;
    }
    float _3843 = _3821;
    float _3845 = _3733 * _3789;
    float _3847 = -_3835;
    float _3849 = fma(_3739, _3813, _3847);
    float _3851 = _3839 * _3741;
    if (!_3745)
    {
        float _3853 = fma(_3631, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3807);
        _3805 = _3853;
    }
    float _3855 = _3805;
    float _3857 = _3697 * _3831;
    float _3859 = _3735 * _3813;
    float _3861 = _3695 * _3833;
    float _3863 = _3701 * _3845;
    float _3865 = -_3857;
    float _3867 = fma(_3701, _3833, _3865);
    float _3869 = -_3859;
    float _3871 = fma(_3737, _3807, _3869);
    float _3873 = -_3861;
    float _3875 = fma(_3697, _3845, _3873);
    float _3877 = _3849 * _3741;
    float _3879 = -_3863;
    float _3881 = fma(_3695, _3831, _3879);
    float _3883 = _3607 * _3867;
    float _3885 = _3871 * _3741;
    float _3887 = _3607 * _3875;
    float _3889 = _3669 * _3867;
    float _3891 = _3667 * _3867;
    float _3893 = _3607 * _3881;
    float _3895 = _3669 * _3875;
    float _3897 = _3667 * _3875;
    float _3899 = _3867 * _3795;
    float _3901 = _3669 * _3881;
    float _3903 = _3667 * _3881;
    float _3905 = _3875 * _3795;
    float _3907 = fma(_3677, _3845, _3883);
    float _3909 = _3881 * _3795;
    float _3911 = fma(_3677, _3831, _3887);
    float _3913 = -_3589;
    float _3915 = fma(_3913, _3845, _3889);
    float _3917 = fma(_3679, _3845, _3891);
    float _3919 = -_3589;
    float _3921 = fma(_3919, _3831, _3895);
    float _3923 = fma(_3679, _3831, _3897);
    float _3925 = fma(_3845, _3819, _3899);
    float _3927 = fma(_3677, _3833, _3893);
    float _3929 = -_3589;
    float _3931 = fma(_3929, _3833, _3901);
    float _3933 = fma(_3679, _3833, _3903);
    float _3935 = fma(_3831, _3819, _3905);
    float _3937 = fma(_3833, _3819, _3909);
    float _3939 = fma(_3661, _3701, _3911);
    float _3941 = fma(_3661, _3695, _3907);
    float _3943 = fma(_3663, _3695, _3915);
    float _3945 = fma(_3609, _3695, _3917);
    float _3947 = fma(_3695, _3829, _3925);
    float _3949 = fma(_3701, _3829, _3935);
    float _3951 = fma(_3661, _3697, _3927);
    float _3953 = fma(_3663, _3701, _3921);
    float _3955 = _2205 + _3947;
    float _3957 = _2199 + _3949;
    float _3959 = fma(_3609, _3701, _3923);
    float _3961 = fma(_3697, _3829, _3937);
    float _3963 = fma(_3663, _3697, _3931);
    float _3965 = -_3515;
    float _3967 = fma(_3965, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3957);
    float _3969 = -_3517;
    float _3971 = fma(_3969, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3955);
    float _3973 = _2323 + _3961;
    float _3975 = _3943 * _3737;
    float _3977 = _3953 * _3737;
    float _3979 = _3963 * _3737;
    float _3981 = _3967 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3983 = _3943 * _3827;
    float _3985 = _3953 * _3827;
    float _3987 = _3963 * _3827;
    float _3989 = _3851 * _3943;
    float _3991 = _3851 * _3953;
    float _3993 = _3851 * _3963;
    float _3995 = -_3527;
    float _3997 = fma(_3995, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3973);
    float _3999 = _3967 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4001 = fma(_3971, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3981);
    float _4003 = _3967 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4005 = fma(_3941, _3735, _3975);
    float _4007 = fma(_3971, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3999);
    float _4009 = fma(_3997, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4001);
    float _4011 = fma(_3939, _3735, _3977);
    float _4013 = fma(_3609, _3697, _3933);
    float _4015 = fma(_3951, _3735, _3979);
    float _4017 = _3967 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4019 = fma(_3971, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4003);
    float _4021 = fma(_3997, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4007);
    float _4023 = _4009 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4025 = fma(_3941, _3855, _3983);
    float _4027 = fma(_3945, _3739, _4005);
    float _4029 = fma(_3959, _3739, _4011);
    float _4031 = fma(_3877, _3941, _3989);
    float _4033 = fma(_3877, _3939, _3991);
    float _4035 = fma(_3877, _3951, _3993);
    float _4037 = fma(_4013, _3739, _4015);
    float _4039 = fma(_3971, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4017);
    float _4041 = fma(_3997, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4019);
    float _4043 = _4021 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4045 = _4023 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4047 = _4023 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4049 = _4023 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4051 = _4023 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4053 = fma(_3939, _3855, _3985);
    float _4055 = fma(_3951, _3855, _3987);
    float _4057 = fma(_3997, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4039);
    float _4059 = _4041 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4061 = fma(_4043, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4045);
    float _4063 = fma(_4043, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4047);
    float _4065 = fma(_4043, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4049);
    float _4067 = fma(_4043, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4051);
    float _4069 = fma(_4059, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4061);
    float _4071 = _4057 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4073 = fma(_4059, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4063);
    float _4075 = fma(_4059, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4065);
    float _4077 = fma(_4059, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4067);
    float _4079 = fma(_3945, _3843, _4025);
    float _4081 = fma(_3959, _3843, _4053);
    float _4083 = fma(_4071, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4069);
    float _4085 = fma(_3885, _3945, _4031);
    float _4087 = fma(_4013, _3843, _4055);
    float _4089 = fma(_3885, _3959, _4033);
    float _4091 = fma(_3885, _4013, _4035);
    float _4093 = fma(_4071, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4073);
    float _4095 = fma(_4071, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4075);
    float _4097 = fma(_4071, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4077);
    out.m_55.x = _4027;
    out.m_55.y = _4029;
    out.m_55.z = _4037;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_57.x = _4079;
    out.m_57.y = _4081;
    out.m_57.z = _4087;
    out.m_59.x = _4085;
    out.m_59.y = _4089;
    out.m_59.z = _4091;
    out.gl_Position.x = _4093;
    out.gl_Position.y = _4083;
    out.gl_Position.z = _4095;
    out.gl_Position.w = _4097;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _722 = false;
    bool _606 = false;
    bool _276 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_26.w;
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
        out.m_29.x = 0.0;
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
        float _4154 = as_type<float>(_94);
        out.gl_Position.z = _4154;
    }
    if (!_82)
    {
        return out;
    }
    float _98 = in.m_31.w;
    bool _100 = _98 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_98);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    float _110 = -_98;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _114 = 0.0;
    float _116 = _112;
    if (_108)
    {
        float _118 = float(_78);
        _114 = _118;
    }
    float _120 = _114;
    bool _122 = _112 >= _120;
    bool _124 = !_108;
    bool _126 = _122 || _124;
    if (_126)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _88;
    if (_126)
    {
        out.m_29.x = 0.0;
    }
    if (_126)
    {
        float _130 = _128 * 5.0;
        _96 = as_type<int>(_130);
    }
    int _132 = _96;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4223 = as_type<float>(_132);
        out.gl_Position.z = _4223;
    }
    if (_126)
    {
        return out;
    }
    float _134 = in.m_33.w;
    float _136 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    float _148 = in.m_31.x;
    float _150 = in.m_31.y;
    float _152 = in.m_31.z;
    float _154 = in.m_26.x;
    float _156 = in.m_26.y;
    float _158 = in.m_26.z;
    float _160 = 0.0;
    float _162 = _136;
    if (!_146)
    {
        float _164 = _136 * _136;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = _168;
    if (!_146)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    bool _176 = !_146;
    float _178 = _174;
    if (!_176)
    {
        float _180 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = log2(_180);
        float _184 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _186 = _184 + 1.0;
        float _188 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = _136 * _182;
        float _192 = 1.0 / _186;
        float _194 = _188 * 0.693147182464599609375;
        float _196 = exp2(_190);
        float _198 = 1.0 / _194;
        float _200 = _196 + (-1.0);
        float _202 = -_200;
        float _204 = fma(_202, _198, _136);
        float _206 = _204 * _192;
        float _208 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _208;
    }
    float _210 = _178;
    bool _212 = !_146;
    if (!_212)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = 1.0 / _220;
        float _224 = _136 * _216;
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
    float _250 = fma(_244, _134, _154);
    float _252 = fma(_246, _134, _156);
    float _254 = fma(_248, _134, _158);
    bool _256 = !_236;
    float _274;
    if (!_256)
    {
        float _258 = in.m_35.x;
        float _260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _262 = _258 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[12].x, _112);
        float _266 = _264 * _260;
        float _268 = floor(_266);
        float _270 = -_268;
        float _272 = _266 + _270;
        _274 = _272;
        _276 = true;
    }
    else
    {
        float _278 = float(_78);
        float _280 = 1.0 / _278;
        float _282 = _112 * _280;
        _274 = _282;
    }
    _276 = false;
    float _284 = _274;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _284 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _306 = 1.0 / _292;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _308;
    bool _312 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _314 = isnan(_284);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -_322;
    float _326 = _324 + 1.0;
    float _328 = 1.0 / _300;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = _284 + _330;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _336 = 1.0 / _296;
    float _338 = _332 * _306;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _342 = _284 + _340;
    bool _344 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _346 = isnan(_284);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    bool _356 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _358 = isnan(_284);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = 1.0 / _304;
    float _370 = _342 * _328;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _374 = _284 + _372;
    bool _376 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _378 = isnan(_284);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -_354;
    float _390 = _388 + 1.0;
    float _392 = 1.0 / _310;
    float _394 = _288 * _336;
    bool _396 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _398 = isnan(_284);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = _366 * _390;
    bool _410 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _412 = isnan(_284);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _424 = _284 + _422;
    float _426 = -_366;
    float _428 = _426 + 1.0;
    float _430 = _406 * _326;
    float _432 = _374 * _368;
    float _434 = -_386;
    float _436 = _434 + 1.0;
    float _438 = -_406;
    float _440 = _438 + 1.0;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _442;
    float _446 = _322 * _428;
    float _448 = _354 * _436;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _450;
    float _454 = _420 * _440;
    float _456 = _424 * _392;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _458;
    float _462 = fma(_452, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _476 = fma(_444, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _478 = _462 * _454;
    float _480 = -_420;
    float _482 = _480 + 1.0;
    float _484 = fma(_460, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _486 = fma(_466, _394, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _488 = fma(_470, _394, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _490 = fma(_474, _394, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _492 = _476 * _454;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _494;
    float _498 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[143].x, _478);
    float _500 = _484 * _454;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _502;
    float _506 = fma(_496, _370, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _508 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[143].y, _492);
    float _510 = fma(_486, _430, _498);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _512;
    float _516 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[143].z, _500);
    float _518 = fma(_504, _370, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _520 = fma(_488, _430, _508);
    float _522 = fma(_506, _446, _510);
    float _524 = fma(_514, _370, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _526 = fma(_490, _430, _516);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _540 = fma(_518, _446, _520);
    float _542 = fma(_524, _446, _526);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _544;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _548;
    float _552 = fma(_530, _432, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _554 = fma(_534, _432, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _556 = fma(_538, _432, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _558;
    float _562 = fma(_546, _456, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _564 = fma(_550, _456, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _566 = fma(_552, _408, _522);
    float _568 = fma(_560, _456, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _570 = fma(_554, _408, _540);
    float _572 = fma(_556, _408, _542);
    float _574 = fma(_562, _448, _566);
    float _576 = fma(_564, _448, _570);
    float _578 = fma(_568, _448, _572);
    float _580 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[148].x, _574);
    float _582 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[148].y, _576);
    float _584 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[148].z, _578);
    bool _586 = !_334;
    float _604;
    if (!_586)
    {
        float _588 = in.m_35.x;
        float _590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _592 = _588 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _594 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[11].y, _112);
        float _596 = _594 * _590;
        float _598 = floor(_596);
        float _600 = -_598;
        float _602 = _596 + _600;
        _604 = _602;
        _606 = true;
    }
    else
    {
        float _608 = float(_78);
        float _610 = 1.0 / _608;
        float _612 = _112 * _610;
        _604 = _612;
    }
    _606 = false;
    float _614 = _604;
    float _616 = in.m_33.x;
    float _618 = in.m_33.y;
    float _620 = in.m_33.z;
    bool _622 = _614 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _624 = isnan(_614);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _638 = _614 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _640 = isnan(_614);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _656 = _614 + _654;
    float _658 = -_632;
    float _660 = _658 + 1.0;
    bool _662 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _664 = 1.0 / _636;
    float _666 = _648 * _660;
    float _668 = -_648;
    float _670 = _668 + 1.0;
    float _672 = _584 * _620;
    float _674 = _582 * _618;
    float _676 = _652 * _664;
    float _678 = _580 * _616;
    float _680 = fma(_676, _656, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _682 = _680 * _666;
    float _684 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[115].x, _682);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _692 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[116].x, _684);
    float _694 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = _692 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.x = _694;
    out.m_37.y = _696;
    out.m_37.z = _698;
    out.m_37.w = _700;
    bool _702 = !_662;
    float _720;
    if (!_702)
    {
        float _704 = in.m_35.x;
        float _706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _708 = _704 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[11].w, _112);
        float _712 = _710 * _706;
        float _714 = floor(_712);
        float _716 = -_714;
        float _718 = _712 + _716;
        _720 = _718;
        _722 = true;
    }
    else
    {
        float _724 = float(_78);
        float _726 = 1.0 / _724;
        float _728 = _112 * _726;
        _720 = _728;
    }
    _722 = false;
    float _730 = _720;
    float _732 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _734 = int(_732);
    float _736 = in.m_35.x;
    float _738 = in.m_35.y;
    float _740 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _742 = int(_740);
    float _744 = in.m_35.w;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _748 = in.m_35.z;
    float _750 = float(_734);
    float _752 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _754 = int(_752);
    float _756 = in.m_39.y;
    float _758 = in.m_39.x;
    float _760 = float(_742);
    float _762 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _764 = int(_762);
    bool _766 = _738 > 0.5;
    float _768 = 1.0 / _750;
    float _770 = float(_754);
    bool _772 = _744 > 0.5;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _776 = _774 != 0;
    float _778 = 1.0 / _760;
    float _780 = float(uint(_764));
    int _782 = ~_764;
    int _784 = _782 + 1;
    bool _786 = _764 == 0;
    float _788 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _790 = int(_788);
    float _792 = _768 * _112;
    float _794 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _796 = int(_794);
    float _798 = _778 * _112;
    float _800 = _778;
    float _802 = _756;
    float _804 = _758;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_776)
    {
        _800 = 1.0;
    }
    float _808 = _800;
    float _810 = _808;
    if (!_776)
    {
        _810 = 7.345489978790283203125;
    }
    float _812 = _810;
    float _814 = 1.0 / _780;
    float _816 = float(uint(_790));
    float _818 = trunc(_792);
    int _820 = int(_818);
    float _822 = float(uint(_796));
    float _824 = 1.0 / _816;
    float _826 = trunc(_798);
    int _828 = int(_826);
    float _830 = float(uint(_820));
    float _832 = _816;
    float _834 = _824;
    float _836 = _830;
    if (_776)
    {
        _832 = 1.0;
    }
    float _838 = _832;
    float _840 = _838;
    if (!_776)
    {
        _840 = 1.2345600128173828125;
    }
    float _842 = _840;
    float _844 = 1.0 / _770;
    float _846 = 1.0 / _822;
    float _848 = float(uint(_828));
    float _850 = _844 * _112;
    float _852 = _812 * _736;
    int _854 = as_type<int>(_814) + (-2);
    int _856 = as_type<int>(_824) + (-2);
    float _858 = floor(_852);
    float _860 = _844;
    if (_776)
    {
        _860 = _736;
    }
    float _862 = _860;
    float _864 = as_type<float>(_854) * _830;
    float _866 = _862;
    if (!_776)
    {
        _866 = _738;
    }
    float _868 = _866;
    float _870 = as_type<float>(_856) * _848;
    if (_776)
    {
        _834 = 1.0;
    }
    float _872 = _834;
    float _874 = _872;
    if (_776)
    {
        _836 = _736;
    }
    float _876 = _836;
    float _878 = trunc(_864);
    float _880 = precise::max(_878, 0.0);
    uint _883 = uint(_880);
    float _885 = _842 * _868;
    float _887 = _876;
    if (!_776)
    {
        _874 = 5.839270114898681640625;
    }
    float _889 = _874;
    if (!_776)
    {
        _887 = _748;
    }
    float _891 = _887;
    float _893 = trunc(_870);
    float _895 = precise::max(_893, 0.0);
    uint _897 = uint(_895);
    int _899 = ~_790;
    int _901 = _899 + 1;
    float _903 = -_858;
    float _905 = _852 + _903;
    float _907 = _889 * _891;
    float _909 = -_756;
    float _911 = _909 + 1.0;
    int _913 = _784 * int(_883);
    int _915 = _913 + _820;
    float _917 = trunc(_850);
    int _919 = int(_917);
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _923 = _921 != 0;
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _927 = _925 != 0;
    float _929 = float(uint(_915));
    int _931 = _901 * int(_897);
    int _933 = _931 + _828;
    float _935 = floor(_885);
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _939 = _937 != 0;
    float _941 = as_type<float>(_854) * _929;
    int _943 = _766 ? as_type<int>(_911) : as_type<int>(_756);
    float _945 = float(uint(_933));
    float _947 = _923 ? as_type<float>(_943) : _756;
    float _949 = trunc(_941);
    float _951 = precise::max(_949, 0.0);
    uint _953 = uint(_951);
    int _955 = as_type<int>(_846) + (-2);
    float _957 = as_type<float>(_856) * _945;
    float _959 = float(uint(_919));
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _963 = _961 != 0;
    int _965 = 0;
    int _967 = as_type<int>(_941);
    float _969 = _945;
    float _971 = _959;
    if (_939)
    {
        float _973 = -_758;
        float _975 = _973 + 1.0;
        _965 = as_type<int>(_975);
    }
    int _977 = _965;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _981 = _979 != 0;
    float _983 = as_type<float>(_955) * _959;
    int _985 = _772 ? as_type<int>(_911) : as_type<int>(_756);
    float _987 = floor(_907);
    bool _989 = _748 > 0.5;
    float _991 = -_935;
    float _993 = _885 + _991;
    float _995 = _981 ? as_type<float>(_985) : _756;
    bool _997 = _981;
    if (_927)
    {
        float _999 = -_758;
        float _1001 = _999 + 1.0;
        _967 = as_type<int>(_1001);
    }
    int _1003 = _967;
    float _1005 = float(_78);
    if (_927)
    {
        bool _1007 = _736 > 0.5;
        _997 = _1007;
    }
    bool _1009 = _997;
    float _1011 = trunc(_983);
    float _1013 = precise::max(_1011, 0.0);
    uint _1015 = uint(_1013);
    if (_963)
    {
        float _1017 = _989 ? _911 : _756;
        _802 = _1017;
    }
    float _1019 = _802;
    int _1021 = ~_796;
    int _1023 = _1021 + 1;
    if (!_927)
    {
        _969 = _758;
    }
    float _1025 = _969;
    float _1027 = 1.0 / _1005;
    float _1029 = _1025;
    if (_927)
    {
        float _1031 = _1009 ? as_type<float>(_1003) : _758;
        _1029 = _1031;
    }
    float _1033 = _1029;
    float _1035 = float(_764);
    if (!_939)
    {
        _971 = _758;
    }
    float _1037 = _971;
    float _1039 = float(_820);
    int _1041 = _1023 * int(_1015);
    int _1043 = _1041 + _919;
    float _1045 = trunc(_957);
    float _1047 = precise::max(_1045, 0.0);
    uint _1049 = uint(_1047);
    float _1051 = _1037;
    if (_939)
    {
        float _1053 = _989 ? as_type<float>(_977) : _758;
        _1051 = _1053;
    }
    float _1055 = _1051;
    float _1057 = -_987;
    float _1059 = _907 + _1057;
    bool _1061 = _1039 >= _1035;
    bool _1063 = isnan(_1039);
    bool _1065 = _1061 || _1063;
    bool _1067 = isnan(_1035);
    bool _1069 = _1065 || _1067;
    float _1071 = float(_1069);
    float _1073 = _905 * _1035;
    float _1075 = float(uint(_1043));
    float _1077 = float(_790);
    int _1079 = int(_883) + int(_953);
    float _1081 = _1035 * _112;
    int _1083 = ~_764;
    int _1085 = _1083 + 1;
    float _1087 = as_type<float>(_955) * _1075;
    float _1089 = float(_828);
    float _1091 = _1081 * _1027;
    float _1093 = _1077 * _993;
    float _1095 = trunc(_1073);
    int _1097 = int(_1095);
    float _1099 = float(_796);
    float _1101 = _1027 * _112;
    int _1103 = _1085 * _1079;
    int _1105 = _1103 + _820;
    bool _1107 = _1089 >= _1077;
    bool _1109 = isnan(_1089);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan(_1077);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    float _1119 = float(_919);
    float _1121 = _1077 * _1101;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1125 = _1123 != 0;
    float _1127 = _1099 * _1101;
    bool _1129 = uint(_1105) >= uint(_764);
    float _1131 = trunc(_1087);
    float _1133 = precise::max(_1131, 0.0);
    uint _1135 = uint(_1133);
    int _1137 = int(_897) + int(_1049);
    bool _1139 = _1119 >= _1099;
    bool _1141 = isnan(_1119);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan(_1099);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = _1099 * _1059;
    int _1153 = ~_790;
    int _1155 = _1153 + 1;
    bool _1157 = !_1125;
    int _1159 = _1157 ? 0 : 1;
    float _1161 = trunc(_1071);
    int _1163 = int(_1161);
    bool _1165 = !_1129;
    int _1167 = _1165 ? 0 : (-1);
    int _1169 = _1155 * _1137;
    int _1171 = _1169 + _828;
    int _1173 = abs(_1159);
    int _1175 = ~_1079;
    int _1177 = _1175 + _1167;
    int _1179 = _1177 + 1;
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1183 = _1181 != 0;
    int _1185 = _1097 * _1173;
    int _1187 = _1185 + _820;
    bool _1189 = uint(_1171) >= uint(_790);
    int _1191 = _764 * _1179;
    int _1193 = _1191 + _820;
    bool _1195 = !_1183;
    int _1197 = _1195 ? 0 : 1;
    float _1199 = trunc(_1093);
    int _1201 = int(_1199);
    bool _1203 = !_1189;
    int _1205 = _1203 ? 0 : (-1);
    bool _1207 = !_786;
    int _1209 = _1207 ? _1193 : (-1);
    int _1211 = ~_1163;
    int _1213 = _1211 + 1;
    int _1215 = _1213 + 1;
    int _1217 = abs(_1197);
    float _1219 = trunc(_1091);
    int _1221 = int(_1219);
    int _1223 = ~_1137;
    int _1225 = _1223 + _1205;
    int _1227 = _1225 + 1;
    int _1229 = _1209 * _1215;
    int _1231 = int(_1015) + int(_1135);
    int _1233 = ~_796;
    int _1235 = _1233 + 1;
    int _1237 = _1201 * _1217;
    int _1239 = _1237 + _828;
    int _1241 = _764 + (-1);
    float _1243 = trunc(_1117);
    int _1245 = int(_1243);
    int _1247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1249 = _1247 != 0;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1257 = _1255 != 0;
    int _1259 = _1235 * _1231;
    int _1261 = _1259 + _919;
    int _1263 = _1163 * _1241;
    int _1265 = _1263 + _1229;
    bool _1267 = !_1253;
    int _1269 = _1267 ? 0 : 1;
    bool _1271 = uint(_1261) >= uint(_796);
    int _1273 = _790 * _1227;
    int _1275 = _1273 + _828;
    bool _1277 = !_1249;
    int _1279 = _1277 ? 0 : 1;
    float _1281 = trunc(_1121);
    int _1283 = int(_1281);
    int _1285 = abs(_1269);
    int _1287 = abs(_1279);
    int _1289 = int(_1271);
    int _1291 = _1129 ? 2 : 0;
    int _1293 = _1289 | _1291;
    int _1295 = _1189 ? 4 : 0;
    int _1297 = _1293 | _1295;
    int _1299 = _963 ? 8 : 0;
    int _1301 = _1297 | _1299;
    int _1303 = _1249 ? 16 : 0;
    int _1305 = _1301 | _1303;
    int _1307 = _1253 ? 32 : 0;
    int _1309 = _1305 | _1307;
    int _1311 = _1257 ? 64 : 0;
    int _1313 = _1309 | _1311;
    int _1315 = _1313 & 1;
    int _1317 = _1265 * _1285;
    int _1319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1321 = _1319 != 0;
    bool _1323 = !_1257;
    int _1325 = _1323 ? 0 : 1;
    int _1327 = _1221 * _1287;
    int _1329 = _1327 + _1317;
    bool _1331 = _1315 != 0;
    bool _1333 = _790 == 0;
    bool _1335 = !_1321;
    int _1337 = _1335 ? 0 : 1;
    int _1339 = abs(_1325);
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1343 = _1341 != 0;
    int _1345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1347 = _1345 != 0;
    float _1349 = trunc(_1151);
    int _1351 = int(_1349);
    int _1353 = abs(_1337);
    int _1355 = _1187 * _1339;
    int _1357 = _1355 + _1329;
    int _1359 = ~_1245;
    int _1361 = _1359 + 1;
    int _1363 = _1361 + 1;
    bool _1365 = !_1333;
    int _1367 = _1365 ? _1275 : (-1);
    int _1369 = _1097 * _1353;
    int _1371 = _1369 + _1357;
    bool _1373 = !_1343;
    int _1375 = _1373 ? 0 : 1;
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1379 = _1377 != 0;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1383 = _1381 != 0;
    int _1385 = _1363 * _1367;
    int _1387 = _790 + (-1);
    int _1389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1391 = _1389 != 0;
    bool _1393 = !_1331;
    int _1395 = _1393 ? 0 : (-1);
    int _1397 = _1245 * _1387;
    int _1399 = _1397 + _1385;
    bool _1401 = !_1347;
    float _1403 = _1401 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1405 = !_1391;
    int _1407 = _1405 ? 0 : 1;
    int _1409 = ~_1231;
    int _1411 = _1409 + _1395;
    int _1413 = _1411 + 1;
    float _1415 = float(uint(_1371));
    int _1417 = abs(as_type<int>(_1403));
    int _1419 = abs(_1375);
    float _1421 = as_type<float>(_854) * _1415;
    int _1423 = abs(_1407);
    int _1425 = _1399 * _1417;
    float _1427 = trunc(_1149);
    int _1429 = int(_1427);
    bool _1431 = !_1379;
    int _1433 = _1431 ? 0 : 1;
    int _1435 = _1351 * _1423;
    int _1437 = _1435 + _919;
    bool _1439 = _796 == 0;
    int _1441 = _1283 * _1419;
    int _1443 = _1441 + _1425;
    int _1445 = abs(_1433);
    int _1447 = _796 * _1413;
    int _1449 = _1447 + _919;
    bool _1451 = !_1383;
    int _1453 = _1451 ? 0 : 1;
    float _1455 = trunc(_1421);
    float _1457 = precise::max(_1455, 0.0);
    uint _1459 = uint(_1457);
    int _1461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1463 = _1461 != 0;
    int _1465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1467 = _1465 != 0;
    int _1469 = _1239 * _1445;
    int _1471 = _1469 + _1443;
    int _1473 = abs(_1453);
    int _1475 = ~_764;
    int _1477 = _1475 + 1;
    float _1479 = float(uint(_1187));
    int _1481 = _1201 * _1473;
    int _1483 = _1481 + _1471;
    int _1485 = ~_1429;
    int _1487 = _1485 + 1;
    int _1489 = _1487 + 1;
    float _1491 = trunc(_1127);
    int _1493 = int(_1491);
    bool _1495 = !_1439;
    int _1497 = _1495 ? _1449 : (-1);
    float _1499 = as_type<float>(_854) * _1479;
    bool _1501 = !_1467;
    int _1503 = _1501 ? 0 : 1;
    int _1505 = _1489 * _1497;
    int _1507 = _796 + (-1);
    float _1509 = trunc(_1499);
    float _1511 = precise::max(_1509, 0.0);
    uint _1513 = uint(_1511);
    int _1515 = abs(_1503);
    int _1517 = _1477 * int(_1459);
    int _1519 = _1517 + _1371;
    float _1521 = float(uint(_1483));
    int _1523 = _1429 * _1507;
    int _1525 = _1523 + _1505;
    float _1527 = float(uint(_1519));
    float _1529 = as_type<float>(_856) * _1521;
    int _1531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1533 = _1531 != 0;
    int _1535 = _1525 * _1515;
    bool _1537 = !_1463;
    int _1539 = _1537 ? 0 : 1;
    float _1541 = as_type<float>(_854) * _1527;
    bool _1543 = !_1533;
    int _1545 = _1543 ? 0 : 1;
    float _1547 = trunc(_1529);
    float _1549 = precise::max(_1547, 0.0);
    uint _1551 = uint(_1549);
    int _1553 = abs(_1539);
    int _1555 = _1477 * int(_1513);
    int _1557 = _1555 + _1187;
    int _1559 = abs(_1545);
    int _1561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1563 = _1561 != 0;
    float _1565 = trunc(_1541);
    float _1567 = precise::max(_1565, 0.0);
    uint _1569 = uint(_1567);
    float _1571 = float(uint(_1557));
    int _1573 = _1493 * _1553;
    int _1575 = _1573 + _1535;
    bool _1577 = !_1563;
    int _1579 = _1577 ? 0 : 1;
    float _1581 = as_type<float>(_854) * _1571;
    int _1583 = ~_790;
    int _1585 = _1583 + 1;
    int _1587 = _1437 * _1559;
    int _1589 = _1587 + _1575;
    int _1591 = abs(_1579);
    int _1593 = ~_764;
    int _1595 = _1593 + 1;
    int _1597 = _1585 * int(_1551);
    int _1599 = _1597 + _1483;
    int _1601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1603 = _1601 != 0;
    int _1605 = _1351 * _1591;
    int _1607 = _1605 + _1589;
    float _1609 = float(uint(_1239));
    int _1611 = int(_1459) + int(_1569);
    float _1613 = as_type<float>(_856) * _1609;
    float _1615 = float(uint(_1607));
    float _1617 = trunc(_1581);
    float _1619 = precise::max(_1617, 0.0);
    uint _1621 = uint(_1619);
    float _1623 = float(uint(_1599));
    int _1625 = _1595 * _1611;
    int _1627 = _1625 + _1371;
    bool _1629 = _738 > 0.5;
    float _1631 = as_type<float>(_955) * _1615;
    int _1633 = _1585;
    float _1635 = _1521;
    float _1637 = as_type<float>(_1419);
    float _1639 = as_type<float>(_1287);
    float _1641 = _1403;
    int _1643 = _1607;
    if (_1603)
    {
        float _1645 = -_758;
        float _1647 = _1645 + 1.0;
        _1633 = as_type<int>(_1647);
    }
    int _1649 = _1633;
    float _1651 = as_type<float>(_856) * _1623;
    bool _1653 = uint(_1627) >= uint(_764);
    float _1655 = trunc(_1613);
    float _1657 = precise::max(_1655, 0.0);
    uint _1659 = uint(_1657);
    int _1661 = ~_796;
    int _1663 = _1661 + 1;
    bool _1665 = !_1653;
    int _1667 = _1665 ? 0 : (-1);
    if (_1603)
    {
        float _1669 = _1629 ? as_type<float>(_1649) : _758;
        _804 = _1669;
    }
    float _1671 = _804;
    int _1673 = ~_1611;
    int _1675 = _1673 + _1667;
    int _1677 = _1675 + 1;
    float _1679 = trunc(_1631);
    float _1681 = precise::max(_1679, 0.0);
    uint _1683 = uint(_1681);
    int _1685 = int(_1513) + int(_1621);
    float _1687 = float(uint(_1437));
    int _1689 = _764 * _1677;
    int _1691 = _1689 + _1371;
    bool _1693 = _764 == 0;
    float _1695 = trunc(_1651);
    float _1697 = precise::max(_1695, 0.0);
    uint _1699 = uint(_1697);
    float _1701 = as_type<float>(_955) * _1687;
    int _1703 = ~_790;
    int _1705 = _1703 + 1;
    bool _1707 = !_1693;
    int _1709 = _1707 ? _1691 : (-1);
    int _1711 = ~_796;
    int _1713 = _1711 + 1;
    int _1715 = _1663 * int(_1683);
    int _1717 = _1715 + _1607;
    float _1719 = trunc(_1701);
    float _1721 = precise::max(_1719, 0.0);
    uint _1723 = uint(_1721);
    int _1725 = ~_790;
    int _1727 = _1725 + 1;
    int _1729 = _1709 & 3;
    bool _1731 = _1729 != 0;
    float _1733 = float(uint(_1717));
    int _1735 = int(_1551) + int(_1699);
    int _1737 = _1709 & 3;
    bool _1739 = _1737 != 0;
    float _1741 = as_type<float>(_955) * _1733;
    int _1743 = _1727 * int(_1659);
    int _1745 = _1743 + _1239;
    int _1747 = _1731 ? 0 : 1;
    int _1749 = _1705 * _1735;
    int _1751 = _1749 + _1483;
    bool _1753 = uint(_1737) > 1u;
    float _1755 = trunc(_1741);
    float _1757 = precise::max(_1755, 0.0);
    uint _1759 = uint(_1757);
    float _1761 = float(uint(_1745));
    int _1763 = _1713 * int(_1723);
    int _1765 = _1763 + _1437;
    bool _1767 = uint(_1751) >= uint(_790);
    int _1769 = ~_764;
    int _1771 = _1769 + 1;
    float _1773 = as_type<float>(_856) * _1761;
    bool _1775 = !_1767;
    int _1777 = _1775 ? 0 : (-1);
    bool _1779 = _1737 != 3;
    int _1781 = _1771 * _1685;
    int _1783 = _1781 + _1187;
    int _1785 = ~_1735;
    int _1787 = _1785 + _1777;
    int _1789 = _1787 + 1;
    float _1791 = trunc(_1773);
    float _1793 = precise::max(_1791, 0.0);
    uint _1795 = uint(_1793);
    int _1797 = ~_1747;
    int _1799 = _1797 + 1;
    int _1801 = _1799 + 1;
    int _1803 = _1801;
    if (!_1753)
    {
        int _1805 = ~_1747;
        int _1807 = _1805 + 1;
        _1803 = _1807;
    }
    int _1809 = _1803;
    int _1811 = _790 * _1789;
    int _1813 = _1811 + _1483;
    bool _1815 = uint(_1737) >= 2u;
    float _1817 = float(uint(_1765));
    int _1819 = _1815 ? 0 : 1;
    bool _1821 = uint(_1783) >= uint(_764);
    float _1823 = as_type<float>(_955) * _1817;
    bool _1825 = !_1333;
    int _1827 = _1825 ? _1813 : (-1);
    int _1829 = ~_796;
    int _1831 = _1829 + 1;
    float _1833 = trunc(_1823);
    float _1835 = precise::max(_1833, 0.0);
    uint _1837 = uint(_1835);
    int _1839 = int(_1683) + int(_1759);
    int _1841 = ~_1819;
    int _1843 = _1841 + 1;
    int _1845 = _1843 + 1;
    int _1847 = _1845;
    if (_1779)
    {
        int _1849 = ~_1819;
        int _1851 = _1849 + 1;
        _1847 = _1851;
    }
    int _1853 = _1847;
    int _1855 = _1831 * _1839;
    int _1857 = _1855 + _1607;
    int _1859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1861 = _1859 != 0;
    bool _1863 = !_1821;
    int _1865 = _1863 ? 0 : (-1);
    int _1867 = _1827 & 3;
    bool _1869 = _1867 != 0;
    bool _1871 = !_1861;
    int _1873 = _1871 ? 0 : 1;
    bool _1875 = uint(_1867) >= 2u;
    int _1877 = _1869 ? 0 : 1;
    bool _1879 = uint(_1857) >= uint(_796);
    int _1881 = _1875 ? 0 : 1;
    bool _1883 = _1867 != 3;
    int _1885 = int(_1659) + int(_1795);
    bool _1887 = !_1879;
    int _1889 = _1887 ? 0 : (-1);
    int _1891 = ~_790;
    int _1893 = _1891 + 1;
    bool _1895 = uint(_1867) > 1u;
    int _1897 = ~_1839;
    int _1899 = _1897 + _1889;
    int _1901 = _1899 + 1;
    int _1903 = _1893 * _1885;
    int _1905 = _1903 + _1239;
    int _1907 = ~_1881;
    int _1909 = _1907 + 1;
    int _1911 = _1909 + 1;
    float _1913 = _738 * 2.0;
    int _1915 = _1911;
    if (_1883)
    {
        int _1917 = ~_1881;
        int _1919 = _1917 + 1;
        _1915 = _1919;
    }
    int _1921 = _1915;
    int _1923 = _796 * _1901;
    int _1925 = _1923 + _1607;
    int _1927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1929 = _1927 != 0;
    float _1931 = _748 * 2.0;
    bool _1933 = uint(_1905) >= uint(_790);
    float _1935 = floor(_1913);
    bool _1937 = !_1439;
    int _1939 = _1937 ? _1925 : (-1);
    int _1941 = ~_1877;
    int _1943 = _1941 + 1;
    int _1945 = _1943 + 1;
    int _1947 = _1945;
    if (!_1895)
    {
        int _1949 = ~_1877;
        int _1951 = _1949 + 1;
        _1947 = _1951;
    }
    int _1953 = _1947;
    float _1955 = _736 * 2.0;
    bool _1957 = !_1933;
    int _1959 = _1957 ? 0 : (-1);
    float _1961 = floor(_1931);
    int _1963 = _1827 & 3;
    bool _1965 = _1963 != 0;
    int _1967 = _1939 & 3;
    bool _1969 = _1967 != 0;
    bool _1971 = !_1965;
    int _1973 = _1971 ? 0 : 1;
    bool _1975 = _1967 != 3;
    float _1977 = floor(_1955);
    if (_1929)
    {
        _806 = 0;
    }
    int _1979 = _806;
    int _1981 = _1979;
    if (!_1929)
    {
        _1981 = 1;
    }
    int _1983 = _1981;
    bool _1985 = !_1739;
    int _1987 = _1985 ? 0 : 1;
    bool _1989 = uint(_1967) >= 2u;
    bool _1991 = _1983 != 1;
    int _1993 = _1989 ? 0 : 1;
    int _1995 = int(_1723) + int(_1837);
    int _1997 = ~_1993;
    int _1999 = _1997 + 1;
    int _2001 = _1999 + 1;
    int _2003 = _2001;
    if (_1975)
    {
        int _2005 = ~_1993;
        int _2007 = _2005 + 1;
        _2003 = _2007;
    }
    int _2009 = _2003;
    int _2011 = _1939 & 3;
    bool _2013 = _2011 != 0;
    bool _2015 = _1977 > 0.0;
    int _2017 = ~_796;
    int _2019 = _2017 + 1;
    bool _2021 = !_2013;
    int _2023 = _2021 ? 0 : 1;
    bool _2025 = _1977 >= 0.0;
    bool _2027 = isnan(_1977);
    bool _2029 = _2025 || _2027;
    bool _2031 = isnan(0.0);
    bool _2033 = _2029 || _2031;
    int _2035 = _2019 * _1995;
    int _2037 = _2035 + _1437;
    int _2039 = _1969 ? 0 : 1;
    int _2041 = _2033 ? 0 : 1;
    bool _2043 = uint(_2037) >= uint(_796);
    int _2045 = ~_2041;
    int _2047 = _2045 + 1;
    int _2049 = _2047 + 1;
    int _2051 = _2049;
    if (!_2015)
    {
        int _2053 = ~_2041;
        int _2055 = _2053 + 1;
        _2051 = _2055;
    }
    int _2057 = _2051;
    bool _2059 = _1867 != 3;
    bool _2061 = uint(_1967) > 1u;
    bool _2063 = !_2043;
    int _2065 = _2063 ? 0 : (-1);
    bool _2067 = _1935 > 0.0;
    if (!_1991)
    {
        _1635 = _738;
    }
    float _2069 = _1635;
    float _2071 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2073 = _2071 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2075 = _1935 >= 0.0;
    bool _2077 = isnan(_1935);
    bool _2079 = _2075 || _2077;
    bool _2081 = isnan(0.0);
    bool _2083 = _2079 || _2081;
    float _2085 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2087 = _2069;
    if (!_1991)
    {
        _1637 = _748;
    }
    float _2089 = _1637;
    float _2091 = 1.0 / _2073;
    float _2093 = _2089;
    if (!_1991)
    {
        _1639 = _2069;
    }
    float _2095 = _1639;
    float _2097 = _2095;
    if (!_1991)
    {
        _1641 = _748;
    }
    float _2099 = _1641;
    float _2101 = _2099;
    if (_1991)
    {
        _2097 = _736;
    }
    float _2103 = _2097;
    if (_1991)
    {
        _2087 = _736;
    }
    float _2105 = _2087;
    if (_1991)
    {
        _2093 = _738;
    }
    float _2107 = _2093;
    float _2109 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2085);
    if (_1991)
    {
        _2101 = _738;
    }
    float _2111 = _2101;
    float _2113 = _736 + _738;
    bool _2115 = _1737 != 3;
    float _2117 = _2103 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2119 = _2083 ? 0 : 1;
    float _2121 = _2113 + (-1.0);
    bool _2123 = _1967 != 3;
    float _2125 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_1929)
    {
        _1643 = 0;
    }
    int _2127 = _1643;
    float _2129 = _2107 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2131 = ~_2039;
    int _2133 = _2131 + 1;
    int _2135 = _2133 + 1;
    int _2137 = _2127;
    int _2139 = _2135;
    if (!_1929)
    {
        _2137 = 2;
    }
    int _2141 = _2137;
    if (!_2061)
    {
        int _2143 = ~_2039;
        int _2145 = _2143 + 1;
        _2139 = _2145;
    }
    int _2147 = _2139;
    float _2149 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2151 = !_2115;
    int _2153 = _2151 ? 0 : (-1);
    float _2155 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2125);
    int _2157 = ~_2119;
    int _2159 = _2157 + 1;
    int _2161 = _2159 + 1;
    float _2163 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2149);
    bool _2165 = !_2123;
    int _2167 = _2165 ? 0 : (-1);
    float _2169 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2155);
    int _2171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2173 = _2171 != 0;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2177 = _2175 != 0;
    int _2179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2181 = _2179 != 0;
    float _2183 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2163);
    int _2185 = _2161;
    if (!_2067)
    {
        int _2187 = ~_2119;
        int _2189 = _2187 + 1;
        _2185 = _2189;
    }
    int _2191 = _2185;
    float _2193 = _736 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2197 = _2195 != 0;
    float _2199 = _2183 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2203 = _2201 != 0;
    float _2205 = _2169 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2207 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2209 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2207;
    bool _2211 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2213 = isnan(_730);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2219 = _2215 || _2217;
    float _2221 = float(_2219);
    float _2223 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2225 = !_2059;
    int _2227 = _2225 ? 0 : (-1);
    float _2229 = _2209 * _2091;
    float _2231 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2233 = _738 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2235 = -_2223;
    float _2237 = fma(_2193, 2.0, _2235);
    float _2239 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2241 = _730 + _2239;
    bool _2243 = _2141 != 2;
    float _2245 = fma(_2233, -2.0, _2231);
    bool _2247 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2249 = isnan(_730);
    bool _2251 = _2247 || _2249;
    bool _2253 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2255 = _2251 || _2253;
    float _2257 = float(_2255);
    float _2259 = -_2221;
    float _2261 = _2259 + 1.0;
    float _2263 = fma(_2229, _2241, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2265 = _2257 * _2261;
    float _2267 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2109);
    float _2269 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2271 = !_2173;
    int _2273 = _2271 ? 0 : 1;
    float _2275 = _736 + _748;
    bool _2277 = _1961 >= 0.0;
    bool _2279 = isnan(_1961);
    bool _2281 = _2277 || _2279;
    bool _2283 = isnan(0.0);
    bool _2285 = _2281 || _2283;
    float _2287 = _2263 * _2265;
    float _2289 = -_2257;
    float _2291 = _2289 + 1.0;
    float _2293 = _2275 + (-1.0);
    int _2295 = _2285 ? 0 : 1;
    float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2299 = _2199 + _2297;
    bool _2301 = _1961 > 0.0;
    float _2303 = fma(_2293, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2305 = _738 + _748;
    float _2307 = fma(_2291, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2287);
    int _2309 = ~_2295;
    int _2311 = _2309 + 1;
    int _2313 = _2311 + 1;
    float _2315 = _2305 + (-1.0);
    float _2317 = _2293;
    int _2319 = _2313;
    if (_2243)
    {
        _2317 = _736;
    }
    float _2321 = _2317;
    float _2323 = _2267 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2325 = fma(_2315, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2327 = fma(_2221, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2307);
    float _2329 = _2299 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2331 = _2321;
    if (!_2301)
    {
        int _2333 = ~_2295;
        int _2335 = _2333 + 1;
        _2319 = _2335;
    }
    int _2337 = _2319;
    float _2339 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2341 = _2205 + _2339;
    if (!_2243)
    {
        _2331 = _748;
    }
    float _2343 = _2331;
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2347 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2349 = _2323 + _2347;
    float _2351 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2329);
    float _2353 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2355 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2357 = _1709 >> 31;
    float _2359 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2351);
    float _2361 = -_2345;
    float _2363 = fma(_2355, 2.0, _2361);
    int _2365 = _2357 & 3;
    float _2367 = _2353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2369 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2371 = _1709 + _2365;
    float _2373 = _2327 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2375 = _1827 >> 31;
    float _2377 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2379 = _2359 >= 0.0;
    float _2381 = _2369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2383 = _2371 >> 2;
    float _2385 = _2377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2387 = _1939 >> 31;
    float _2389 = -_112;
    float _2391 = fma(_2389, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2237);
    int _2393 = _2375 & 3;
    float _2395 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2245);
    int _2397 = _2383 << 4;
    int _2399 = _2397 + 368;
    out.m_41.x = _2385;
    out.m_41.y = _2381;
    out.m_41.z = _2367;
    out.m_41.w = _2373;
    int _2401 = _2387 & 3;
    float _2403 = -_112;
    float _2405 = fma(_2403, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2363);
    int _2407 = _1827 + _2393;
    if (_2379)
    {
        out.m_29.x = 0.0;
    }
    int _2409 = _1939 + _2401;
    float _2411 = _748 + (-0.5);
    int _2413 = _2407 >> 2;
    int _2415 = _2413 << 4;
    int _2417 = _2415 + 512;
    uint _2419 = uint(int(uint(_2399) >> uint(2)));
    uint _2421 = uint(int(uint(int(_2419)) >> uint(2)));
    int _2423 = int(_2419) & 3;
    float _2425 = (*spvDescriptorSet0.vp_c9)._m0[int(_2421)][_2423];
    int _2427 = int(_2419) + 1;
    uint _2429 = uint(int(uint(_2427) >> uint(2)));
    int _2431 = _2427 & 3;
    float _2433 = (*spvDescriptorSet0.vp_c9)._m0[int(_2429)][_2431];
    int _2435 = _2409 >> 2;
    float _2437 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2439 = !_2177;
    int _2441 = _2439 ? 0 : 1;
    float _2443 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2445 = _2435 << 4;
    int _2447 = _2445 + 656;
    uint _2449 = uint(int(uint(_2417) >> uint(2)));
    uint _2451 = uint(int(uint(int(_2449)) >> uint(2)));
    int _2453 = int(_2449) & 3;
    float _2455 = (*spvDescriptorSet0.vp_c9)._m0[int(_2451)][_2453];
    int _2457 = int(_2449) + 1;
    uint _2459 = uint(int(uint(_2457) >> uint(2)));
    int _2461 = _2457 & 3;
    float _2463 = (*spvDescriptorSet0.vp_c9)._m0[int(_2459)][_2461];
    int _2465 = abs(_2441);
    float _2467 = -_2443;
    float _2469 = fma(_2117, 2.0, _2467);
    float _2471 = float(_2057);
    float _2473 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2437);
    float _2475 = fma(_2111, (*spvDescriptorSet0.vp_c9)._m0[83].w, _746);
    float _2477 = float(_2465);
    float _2479 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    uint _2481 = uint(int(uint(_2447) >> uint(2)));
    uint _2483 = uint(int(uint(int(_2481)) >> uint(2)));
    int _2485 = int(_2481) & 3;
    float _2487 = (*spvDescriptorSet0.vp_c9)._m0[int(_2483)][_2485];
    int _2489 = int(_2481) + 1;
    uint _2491 = uint(int(uint(_2489) >> uint(2)));
    int _2493 = _2489 & 3;
    float _2495 = (*spvDescriptorSet0.vp_c9)._m0[int(_2491)][_2493];
    int _2497 = abs(_2273);
    float _2499 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2501 = int(_2499);
    float _2503 = float(_2337);
    float _2505 = fma(_2129, -2.0, _2479);
    bool _2507 = !_2181;
    int _2509 = _2507 ? 0 : 1;
    float _2511 = _2477 * _2471;
    float _2513 = float(_2497);
    int _2515 = _2417 + 8;
    uint _2517 = uint(int(uint(_2515) >> uint(2)));
    uint _2519 = uint(int(uint(int(_2517)) >> uint(2)));
    int _2521 = int(_2517) & 3;
    float _2523 = (*spvDescriptorSet0.vp_c9)._m0[int(_2519)][_2521];
    int _2525 = int(_2517) + 1;
    uint _2527 = uint(int(uint(_2525) >> uint(2)));
    int _2529 = _2525 & 3;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[int(_2527)][_2529];
    int _2533 = ~_1885;
    int _2535 = _2533 + _1959;
    int _2537 = _2535 + 1;
    float _2539 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2473);
    int _2541 = abs(_2509);
    float _2543 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2475);
    float _2545 = float(_2191);
    int _2547 = _790 * _2537;
    int _2549 = _2547 + _1239;
    int _2551 = ~_1685;
    int _2553 = _2551 + _1865;
    int _2555 = _2553 + 1;
    int _2557 = _2399 + 8;
    uint _2559 = uint(int(uint(_2557) >> uint(2)));
    uint _2561 = uint(int(uint(int(_2559)) >> uint(2)));
    int _2563 = int(_2559) & 3;
    float _2565 = (*spvDescriptorSet0.vp_c9)._m0[int(_2561)][_2563];
    int _2567 = int(_2559) + 1;
    uint _2569 = uint(int(uint(_2567) >> uint(2)));
    int _2571 = _2567 & 3;
    float _2573 = (*spvDescriptorSet0.vp_c9)._m0[int(_2569)][_2571];
    float _2575 = _2513 * _2503;
    int _2577 = abs(_1953);
    float _2579 = -_112;
    float _2581 = fma(_2579, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2469);
    int _2583 = abs(_2147);
    int _2585 = _764 * _2555;
    int _2587 = _2585 + _1187;
    int _2589 = abs(_1809);
    float _2591 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2505);
    int _2593 = _2447 + 8;
    uint _2595 = uint(int(uint(_2593) >> uint(2)));
    uint _2597 = uint(int(uint(int(_2595)) >> uint(2)));
    int _2599 = int(_2595) & 3;
    float _2601 = (*spvDescriptorSet0.vp_c9)._m0[int(_2597)][_2599];
    int _2603 = int(_2595) + 1;
    uint _2605 = uint(int(uint(_2603) >> uint(2)));
    int _2607 = _2603 & 3;
    float _2609 = (*spvDescriptorSet0.vp_c9)._m0[int(_2605)][_2607];
    int _2611 = abs(_1987);
    float _2613 = _2511 * (-2.0);
    int _2615 = ~_2611;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = ~_2589;
    int _2623 = _2621 + 1;
    int _2625 = _2623 + 1;
    int _2627 = abs(_1973);
    int _2629 = _2625 * as_type<int>(_2433);
    int _2631 = ~_1995;
    int _2633 = _2631 + _2065;
    int _2635 = _2633 + 1;
    int _2637 = ~_2577;
    int _2639 = _2637 + 1;
    int _2641 = _2639 + 1;
    int _2643 = _2619 * as_type<int>(_2425);
    int _2645 = _2643 + _2629;
    int _2647 = _796 * _2635;
    int _2649 = _2647 + _1437;
    int _2651 = _2641 * as_type<int>(_2463);
    int _2653 = abs(_2023);
    float _2655 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2657 = int(_2655);
    int _2659 = abs(_1853);
    float _2661 = _2575 * (-2.0);
    int _2663 = abs(_1921);
    int _2665 = ~_2627;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    int _2671 = ~_2583;
    int _2673 = _2671 + 1;
    int _2675 = _2673 + 1;
    float _2677 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2679 = log2(_2677);
    int _2681 = _2669 * as_type<int>(_2455);
    int _2683 = _2681 + _2651;
    int _2685 = ~_2663;
    int _2687 = _2685 + 1;
    int _2689 = _2687 + 1;
    int _2691 = _2675 * as_type<int>(_2495);
    int _2693 = ~_2653;
    int _2695 = _2693 + 1;
    int _2697 = _2695 + 1;
    int _2699 = ~_2659;
    int _2701 = _2699 + 1;
    int _2703 = _2701 + 1;
    float _2705 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2707 = int(_2705);
    int _2709 = _2689 * as_type<int>(_2523);
    int _2711 = _2709 + _2683;
    int _2713 = abs(_2153);
    int _2715 = _2697 * as_type<int>(_2487);
    int _2717 = _2715 + _2691;
    int _2719 = abs(_2009);
    int _2721 = _2703 * as_type<int>(_2565);
    int _2723 = _2721 + _2645;
    int _2725 = abs(_2227);
    int _2727 = ~_2713;
    int _2729 = _2727 + 1;
    int _2731 = _2729 + 1;
    int _2733 = abs(_2167);
    int _2735 = ~_2719;
    int _2737 = _2735 + 1;
    int _2739 = _2737 + 1;
    int _2741 = _2731 * as_type<int>(_2573);
    int _2743 = _2741 + _2723;
    int _2745 = ~_2725;
    int _2747 = _2745 + 1;
    int _2749 = _2747 + 1;
    float _2751 = _2679 * _112;
    int _2753 = ~_2733;
    int _2755 = _2753 + 1;
    int _2757 = _2755 + 1;
    int _2759 = _2739 * as_type<int>(_2601);
    int _2761 = _2759 + _2717;
    float _2763 = float(uint(_2501));
    int _2765 = _2749 * as_type<int>(_2531);
    int _2767 = _2765 + _2711;
    bool _2769 = !_2197;
    int _2771 = _2769 ? 0 : 1;
    int _2773 = _2757 * as_type<int>(_2609);
    int _2775 = _2773 + _2761;
    float _2777 = float(uint(_2657));
    float _2779 = 1.0 / _2763;
    bool _2781 = !_2203;
    int _2783 = _2781 ? 0 : 1;
    float _2785 = float(uint(_2707));
    int _2787 = abs(_2501);
    int _2789 = abs(_1873);
    float _2791 = 1.0 / _2777;
    int _2793 = abs(_2771);
    int _2795 = abs(_2783);
    int _2797 = ~_2793;
    int _2799 = _2797 + 1;
    int _2801 = _2799 + 1;
    float _2803 = float(uint(_2787));
    float _2805 = 1.0 / _2785;
    bool _2807 = _790 == 0;
    int _2809 = _2801 * _2767;
    int _2811 = ~_2789;
    int _2813 = _2811 + 1;
    int _2815 = _2813 + 1;
    bool _2817 = _764 == 0;
    int _2819 = abs(_2657);
    float _2821 = 1.0 / _2803;
    int _2823 = ~_2795;
    int _2825 = _2823 + 1;
    int _2827 = _2825 + 1;
    int _2829 = _2743 * _2815;
    bool _2831 = !_2807;
    int _2833 = _2831 ? _2549 : (-1);
    bool _2835 = !_2817;
    int _2837 = _2835 ? _2587 : (-1);
    int _2839 = _2827 * _2775;
    float _2841 = float(uint(_2819));
    int _2843 = _2833 * _2793;
    int _2845 = _2843 + _2809;
    bool _2847 = !_1439;
    int _2849 = _2847 ? _2649 : (-1);
    int _2851 = _2837 * _2789;
    int _2853 = _2851 + _2829;
    int _2855 = abs(_2707);
    float _2857 = exp2(_2751);
    int _2859 = as_type<int>(_2779) + (-2);
    int _2861 = _2849 * _2795;
    int _2863 = _2861 + _2839;
    int _2865 = as_type<int>(_2791) + (-2);
    float _2867 = in.m_43.x;
    float _2869 = in.m_43.y;
    float _2871 = in.m_43.z;
    float _2873 = float(uint(_2845));
    float _2875 = 1.0 / _2841;
    float _2877 = float(uint(_2853));
    float _2879 = as_type<float>(_2865) * _2873;
    int _2881 = as_type<int>(_2805) + (-2);
    int _2883 = abs(_2853);
    float _2885 = as_type<float>(_2859) * _2877;
    float _2887 = float(uint(_2855));
    float _2889 = trunc(_2879);
    float _2891 = precise::max(_2889, 0.0);
    uint _2893 = uint(_2891);
    float _2895 = float(uint(_2863));
    int _2897 = as_type<int>(_2821) + (-2);
    float _2899 = float(uint(_2883));
    float _2901 = as_type<float>(_2881) * _2895;
    float _2903 = _2877;
    float _2905 = _2791;
    float _2907 = as_type<float>(_2855);
    if (_2243)
    {
        _2903 = _738;
    }
    float _2909 = _2903;
    float _2911 = 1.0 / _2887;
    float _2913 = _2909;
    if (!_2243)
    {
        _2913 = _736;
    }
    float _2915 = _2913;
    float _2917 = as_type<float>(_2897) * _2899;
    if (_2379)
    {
        _2905 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2919 = _2905;
    float _2921 = fma(_2269, _2661, _2269);
    int _2923 = abs(_2845);
    float _2925 = _2915 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2927 = as_type<int>(_2875) + (-2);
    float _2929 = trunc(_2885);
    float _2931 = precise::max(_2929, 0.0);
    uint _2933 = uint(_2931);
    int _2935 = as_type<int>(_2919);
    if (_2379)
    {
        float _2937 = _2919 * 5.0;
        _2935 = as_type<int>(_2937);
    }
    int _2939 = _2935;
    float _2941 = float(uint(_2923));
    float _2943 = fma(_2661, _2867, _2867);
    if (_2379)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8274 = as_type<float>(_2939);
        out.gl_Position.z = _8274;
    }
    float _2945 = as_type<float>(_2927) * _2941;
    float _2947 = trunc(_2901);
    float _2949 = precise::max(_2947, 0.0);
    uint _2951 = uint(_2949);
    int _2953 = ~_2657;
    int _2955 = _2953 + 1;
    int _2957 = as_type<int>(_2911) + (-2);
    int _2959 = _2955 * int(_2893);
    int _2961 = _2959 + _2845;
    bool _2963 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2965 = isnan(1.0);
    bool _2967 = _2963 || _2965;
    bool _2969 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2971 = _2967 || _2969;
    float _2973 = trunc(_2917);
    float _2975 = precise::max(_2973, 0.0);
    uint _2977 = uint(_2975);
    int _2979 = ~_2707;
    int _2981 = _2979 + 1;
    float _2983 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2985 = 1.0 + _2983;
    int _2987 = ~_2501;
    int _2989 = _2987 + 1;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2993 = abs(_2863);
    float _2995 = float(uint(_2961));
    int _2997 = _2989 * int(_2933);
    int _2999 = _2997 + _2853;
    int _3001 = ~_2787;
    int _3003 = _3001 + 1;
    float _3005 = trunc(_2945);
    float _3007 = precise::max(_3005, 0.0);
    uint _3009 = uint(_3007);
    float _3011 = float(uint(_2993));
    int _3013 = _2981 * int(_2951);
    int _3015 = _3013 + _2863;
    float _3017 = fma(_2925, -2.0, _2991);
    int _3019 = ~_2819;
    int _3021 = _3019 + 1;
    int _3023 = _3003 * int(_2977);
    int _3025 = _3023 + _2883;
    float _3027 = as_type<float>(_2957) * _3011;
    float _3029 = float(uint(_2999));
    float _3031 = 1.0 / _2985;
    float _3033 = float(uint(_3015));
    float _3035 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3017);
    float _3037 = float(uint(_3025));
    float _3039 = as_type<float>(_2859) * _3029;
    float _3041 = as_type<float>(_2865) * _2995;
    int _3043 = _3021 * int(_3009);
    int _3045 = _3043 + _2923;
    float _3047 = as_type<float>(_2897) * _3037;
    float _3049 = trunc(_3027);
    float _3051 = precise::max(_3049, 0.0);
    uint _3053 = uint(_3051);
    float _3055 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3057 = as_type<float>(_2881) * _3033;
    float _3059 = float(uint(_3045));
    float _3061 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3063 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3055);
    int _3065 = ~_2855;
    int _3067 = _3065 + 1;
    float _3069 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3061);
    float _3071 = trunc(_3039);
    float _3073 = precise::max(_3071, 0.0);
    uint _3075 = uint(_3073);
    float _3077 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3063);
    float _3079 = as_type<float>(_2927) * _3059;
    float _3081 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3069);
    float _3083 = -_2857;
    float _3085 = _3083 + 1.0;
    bool _3087 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3089 = isnan(0.0);
    bool _3091 = _3087 || _3089;
    bool _3093 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3095 = _3091 || _3093;
    float _3097 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3099 = trunc(_3041);
    float _3101 = precise::max(_3099, 0.0);
    uint _3103 = uint(_3101);
    float _3105 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _3107 = _3067 * int(_3053);
    int _3109 = _3107 + _2993;
    float _3111 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3097);
    float _3113 = _3095 ? _3085 : 0.0;
    float _3115 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3105);
    float _3117 = float(_2541);
    float _3119 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3111);
    float _3121 = trunc(_3079);
    float _3123 = precise::max(_3121, 0.0);
    uint _3125 = uint(_3123);
    float _3127 = float(uint(_3109));
    float _3129 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3115);
    if (_2971)
    {
        float _3131 = _3113 * _3031;
        _116 = _3131;
    }
    float _3133 = _116;
    int _3135 = ~_2501;
    int _3137 = _3135 + 1;
    float _3139 = fma(_2613, _2869, _2869);
    float _3141 = as_type<float>(_2957) * _3127;
    int _3143 = int(_2933) + int(_3075);
    float _3145 = trunc(_3057);
    float _3147 = precise::max(_3145, 0.0);
    uint _3149 = uint(_3147);
    float _3151 = _736 + (-0.5);
    float _3153 = fma(_2325, _2613, _2325);
    int _3155 = int(_2893) + int(_3103);
    float _3157 = fma(_3151, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2943);
    int _3159 = ~_2657;
    int _3161 = _3159 + 1;
    int _3163 = _3137 * _3143;
    int _3165 = _3163 + _2853;
    float _3167 = trunc(_3047);
    float _3169 = precise::max(_3167, 0.0);
    uint _3171 = uint(_3169);
    int _3173 = int(_3009) + int(_3125);
    float _3175 = fma(_2921, _3133, _3157);
    int _3177 = ~_2819;
    int _3179 = _3177 + 1;
    int _3181 = _3161 * _3155;
    int _3183 = _3181 + _2845;
    int _3185 = ~_2707;
    int _3187 = _3185 + 1;
    float _3189 = _738 + (-0.5);
    int _3191 = ~_2787;
    int _3193 = _3191 + 1;
    float _3195 = trunc(_3141);
    float _3197 = precise::max(_3195, 0.0);
    uint _3199 = uint(_3197);
    int _3201 = int(_2951) + int(_3149);
    int _3203 = _3179 * _3173;
    int _3205 = _3203 + _2923;
    bool _3207 = uint(_3183) >= uint(_2657);
    float _3209 = _3175 * 0.15915493667125701904296875;
    bool _3211 = uint(_3165) >= uint(_2501);
    int _3213 = _3187 * _3201;
    int _3215 = _3213 + _2863;
    bool _3217 = uint(_3205) >= uint(_2819);
    float _3219 = _3117 * _2545;
    int _3221 = int(_2977) + int(_3171);
    float _3223 = fma(_3189, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3139);
    bool _3225 = !_3207;
    int _3227 = _3225 ? 0 : (-1);
    int _3229 = ~_2855;
    int _3231 = _3229 + 1;
    int _3233 = _3193 * _3221;
    int _3235 = _3233 + _2883;
    bool _3237 = uint(_3215) >= uint(_2707);
    float _3239 = fma(_3153, _3133, _3223);
    int _3241 = int(_3053) + int(_3199);
    bool _3243 = uint(_3235) >= uint(_2787);
    int _3245 = ~_3155;
    int _3247 = _3245 + _3227;
    int _3249 = _3247 + 1;
    int _3251 = _3231 * _3241;
    int _3253 = _3251 + _2993;
    bool _3255 = !_3211;
    int _3257 = _3255 ? 0 : (-1);
    float _3259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3261 = !_3237;
    int _3263 = _3261 ? 0 : (-1);
    int _3265 = _2657 * _3249;
    int _3267 = _3265 + _2845;
    int _3269 = ~_3143;
    int _3271 = _3269 + _3257;
    int _3273 = _3271 + 1;
    int _3275 = ~_3201;
    int _3277 = _3275 + _3263;
    int _3279 = _3277 + 1;
    int _3281 = _2845 ^ _2657;
    float _3283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3285 = !_3217;
    int _3287 = _3285 ? 0 : (-1);
    int _3289 = _2707 * _3279;
    int _3291 = _3289 + _2863;
    bool _3293 = uint(_3253) >= uint(_2855);
    int _3295 = _2853 ^ _2501;
    int _3297 = _2501 * _3273;
    int _3299 = _3297 + _2853;
    bool _3301 = !_3243;
    int _3303 = _3301 ? 0 : (-1);
    float _3305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3307 = _2501 == 0;
    float _3309 = _3259 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3311 = !_3293;
    int _3313 = _3311 ? 0 : (-1);
    int _3315 = ~_3287;
    int _3317 = _3173 + _3315;
    int _3319 = _3317 + 1;
    float _3321 = fma(_3309, _1033, -0.5);
    bool _3323 = _2657 == 0;
    float _3325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _3327 = uint(int(uint(_3295) >> uint(31)));
    float _3329 = _3283 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3331 = _2501 == 0;
    bool _3333 = _2707 == 0;
    float _3335 = fma(_947, _3329, -0.5);
    bool _3337 = _2707 == 0;
    int _3339 = _2863 ^ _2707;
    float _3341 = _3305 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3343 = ~_3303;
    int _3345 = _3221 + _3343;
    int _3347 = _3345 + 1;
    float _3349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3351 = ~_3313;
    int _3353 = _3241 + _3351;
    int _3355 = _3353 + 1;
    float _3357 = fma(_3341, _1055, -0.5);
    bool _3359 = !_3307;
    int _3361 = _3359 ? _3299 : (-1);
    bool _3363 = !_3323;
    int _3365 = _3363 ? _3267 : (-1);
    int _3367 = ~int(_3327);
    int _3369 = _3367 + 1;
    float _3371 = float(_3361);
    int _3373 = _3347 ^ _3369;
    float _3375 = float(_3365);
    float _3377 = fma(_3309, _3371, _2391);
    uint _3379 = uint(int(uint(_3281) >> uint(31)));
    float _3381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3383 = uint(int(uint(_3339) >> uint(31)));
    float _3385 = _3325 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3387 = !_3333;
    int _3389 = _3387 ? _3291 : (-1);
    float _3391 = fma(_3341, _3375, _2581);
    int _3393 = ~_3369;
    int _3395 = _3393 + _3373;
    int _3397 = _3395 + 1;
    float _3399 = fma(_3385, _1671, -0.5);
    int _3401 = ~int(_3379);
    int _3403 = _3401 + 1;
    float _3405 = fma(_2539, _3357, _3391);
    int _3407 = ~int(_3383);
    int _3409 = _3407 + 1;
    float _3411 = _2299 * _2299;
    float _3413 = float(_3389);
    float _3415 = fma(_3081, _3321, _3377);
    bool _3417 = !_3331;
    int _3419 = _3417 ? _3397 : (-1);
    int _3421 = _3319 ^ _3403;
    float _3423 = fma(_3385, _3413, _2405);
    int _3425 = _3355 ^ _3409;
    float _3427 = _3349 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3429 = float(_3419);
    float _3431 = fma(_3119, _3399, _3423);
    bool _3433 = _2657 == 0;
    int _3435 = ~_3403;
    int _3437 = _3435 + _3421;
    int _3439 = _3437 + 1;
    float _3441 = -_2395;
    float _3443 = fma(_3329, _3429, _3441);
    int _3445 = ~_3409;
    int _3447 = _3445 + _3425;
    int _3449 = _3447 + 1;
    float _3451 = _3381 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3453 = !_3433;
    int _3455 = _3453 ? _3439 : (-1);
    float _3457 = fma(_3077, _3335, _3443);
    bool _3459 = !_3337;
    int _3461 = _3459 ? _3449 : (-1);
    float _3463 = fma(_995, _3451, -0.5);
    float _3465 = float(_3455);
    float _3467 = _3431 + 0.5;
    float _3469 = float(_3461);
    float _3471 = fma(_2341, _2341, _3411);
    float _3473 = _3457 + 0.5;
    float _3475 = -_2591;
    float _3477 = fma(_3451, _3465, _3475);
    float _3479 = fma(_3427, _1019, -0.5);
    float _3481 = fma(_2349, _2349, _3471);
    float _3483 = -_3035;
    float _3485 = fma(_3427, _3469, _3483);
    float _3487 = fma(_2543, _3463, _3477);
    float _3489 = _3415 + 0.5;
    float _3491 = rsqrt(_3481);
    float _3493 = fma(_3129, _3479, _3485);
    float _3495 = _3487 + 0.5;
    float _3497 = _3405 + 0.5;
    float _3499 = _3219 * (-2.0);
    float _3501 = _3493 + 0.5;
    float _3503 = _3209 * 6.283185482025146484375;
    float _3505 = sin(_3503);
    out.m_45.x = _3489;
    out.m_45.y = _3473;
    out.m_45.z = _3497;
    out.m_45.w = _3495;
    float _3507 = fma(_2303, _3499, _2303);
    float _3509 = fma(_3499, _2871, _2871);
    out.m_47.x = _3467;
    out.m_47.y = _3501;
    float _3511 = _3209 * 6.283185482025146484375;
    float _3513 = cos(_3511);
    float _3515 = _2299 * _3491;
    float _3517 = _2341 * _3491;
    if (_2379)
    {
        return out;
    }
    float _3519 = -_3515;
    float _3521 = fma(_3519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2199);
    float _3523 = -_3517;
    float _3525 = fma(_3523, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2205);
    float _3527 = _2349 * _3491;
    float _3529 = _3239 * 0.15915493667125701904296875;
    float _3531 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3533 = _3521 + _3531;
    float _3535 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3537 = _3525 + _3535;
    float _3539 = -_3515;
    float _3541 = fma(_3539, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2299);
    float _3543 = fma(_2411, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3509);
    float _3545 = _3533 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3547 = -_3527;
    float _3549 = fma(_3547, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2323);
    float _3551 = -_3517;
    float _3553 = fma(_3551, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2341);
    float _3555 = fma(_3507, _3133, _3543);
    float _3557 = fma(_3537, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3545);
    float _3559 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3561 = _3549 + _3559;
    float _3563 = _3541 * _3541;
    float _3565 = _3529 * 6.283185482025146484375;
    float _3567 = sin(_3565);
    float _3569 = _3555 * 0.15915493667125701904296875;
    float _3571 = fma(_3561, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3557);
    float _3573 = fma(_3553, _3553, _3563);
    float _3575 = -_3527;
    float _3577 = fma(_3575, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2349);
    bool _3579 = _3571 >= 0.0;
    float _3581 = _3529 * 6.283185482025146484375;
    float _3583 = cos(_3581);
    float _3585 = fma(_3577, _3577, _3573);
    float _3587 = _3569 * 6.283185482025146484375;
    float _3589 = sin(_3587);
    float _3591 = _3505 * _3567;
    float _3593 = _3555;
    if (_3579)
    {
        _3593 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3595 = _3593;
    int _3597 = as_type<int>(_3595);
    if (_3579)
    {
        out.m_29.x = 0.0;
    }
    float _3599 = sqrt(_3585);
    if (_3579)
    {
        float _3601 = _3595 * 5.0;
        _3597 = as_type<int>(_3601);
    }
    int _3603 = _3597;
    float _3605 = _3513 * _3583;
    if (_3579)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9273 = as_type<float>(_3603);
        out.gl_Position.z = _9273;
    }
    float _3607 = fma(_3589, _3605, _3591);
    float _3609 = fma(_3589, _3591, _3605);
    float _3611 = _3491 * _3599;
    if (_3579)
    {
        return out;
    }
    float _3613 = -_2199;
    float _3615 = _3613 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3617 = -_2205;
    float _3619 = _3617 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3621 = -_2323;
    float _3623 = _3621 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3625 = _3569 * 6.283185482025146484375;
    float _3627 = cos(_3625);
    float _3629 = _3615 * _3615;
    float _3631 = in.m_49.x;
    float _3633 = in.m_49.y;
    float _3635 = in.m_49.z;
    float _3637 = _672 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3639 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3641 = fma(_3619, _3619, _3629);
    float _3643 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3645 = _3611 * _3637;
    float _3647 = _3611 * _3639;
    float _3649 = fma(_3623, _3623, _3641);
    float _3651 = _3611 * _3643;
    float _3653 = _3513 * _3567;
    float _3655 = _3505 * _3583;
    float _3657 = rsqrt(_3649);
    float _3659 = -_3653;
    float _3661 = fma(_3589, _3655, _3659);
    float _3663 = _3505 * _3627;
    float _3665 = -_3655;
    float _3667 = fma(_3589, _3653, _3665);
    float _3669 = _3513 * _3627;
    float _3671 = in.m_51.x;
    float _3673 = in.m_51.y;
    float _3675 = in.m_51.z;
    float _3677 = _3583 * _3627;
    float _3679 = _3567 * _3627;
    bool _3681 = _3633 != 0.0;
    bool _3683 = isnan(_3633);
    bool _3685 = _3681 || _3683;
    bool _3687 = isnan(0.0);
    bool _3689 = _3685 || _3687;
    float _3691 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3631);
    float _3693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3633);
    float _3695 = _3619 * _3657;
    float _3697 = _3623 * _3657;
    float _3699 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3635);
    float _3701 = _3615 * _3657;
    float _3703 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3705 = _3695 * _3703;
    float _3707 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3709 = _3697 * _3707;
    bool _3711 = _3631 == 0.0;
    bool _3713 = !_3689;
    bool _3715 = _3711 && _3713;
    float _3717 = _3647 * _3693;
    float _3719 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3721 = -_3705;
    float _3723 = fma(_3697, _3719, _3721);
    float _3725 = _3651 * _3691;
    float _3727 = _3645 * _3699;
    float _3729 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3731 = -_3709;
    float _3733 = fma(_3701, _3729, _3731);
    float _3735 = in.m_53.x;
    float _3737 = in.m_53.y;
    float _3739 = in.m_53.z;
    float _3741 = in.m_53.w;
    bool _3743 = _3635 == 0.0;
    bool _3745 = _3743 && _3715;
    float _3747 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3749 = _3701 * _3747;
    float _3751 = _3723 * _3723;
    float _3753 = -_3717;
    float _3755 = _3589 * _3753;
    float _3757 = _3669 * _3717;
    float _3759 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3761 = -_3749;
    float _3763 = fma(_3695, _3759, _3761);
    float _3765 = fma(_3733, _3733, _3751);
    float _3767 = _3663 * _3717;
    float _3769 = fma(_3677, _3725, _3755);
    float _3771 = fma(_3607, _3725, _3757);
    float _3773 = fma(_3763, _3763, _3765);
    float _3775 = fma(_3661, _3725, _3767);
    float _3777 = _3651;
    float _3779 = _3767;
    float _3781 = _3725;
    float _3783 = _3765;
    float _3785 = _3671;
    if (_3745)
    {
        _3777 = _3671;
    }
    float _3787 = _3777;
    float _3789 = rsqrt(_3773);
    float _3791 = _3787;
    if (_3745)
    {
        _2907 = _3673;
    }
    float _3793 = _2907;
    float _3795 = fma(_3667, _3727, _3771);
    float _3797 = _3793;
    if (_3745)
    {
        _3779 = _3675;
    }
    float _3799 = _3779;
    float _3801 = _3799;
    if (_3745)
    {
        _3781 = _3787;
    }
    float _3803 = _3781;
    float _3805 = _3803;
    if (!_3745)
    {
        _3791 = _3671;
    }
    float _3807 = _3791;
    if (_3745)
    {
        _3783 = _3793;
    }
    float _3809 = _3783;
    float _3811 = _3809;
    if (!_3745)
    {
        _3797 = _3673;
    }
    float _3813 = _3797;
    float _3815 = _3739 * _3807;
    if (_3745)
    {
        _3785 = _3799;
    }
    float _3817 = _3785;
    float _3819 = fma(_3679, _3727, _3769);
    float _3821 = _3817;
    if (!_3745)
    {
        _3801 = _3675;
    }
    float _3823 = _3801;
    if (!_3745)
    {
        float _3825 = fma(_3633, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3813);
        _3811 = _3825;
    }
    float _3827 = _3811;
    float _3829 = fma(_3609, _3727, _3775);
    float _3831 = _3723 * _3789;
    float _3833 = _3763 * _3789;
    float _3835 = _3737 * _3823;
    float _3837 = -_3815;
    float _3839 = fma(_3735, _3823, _3837);
    if (!_3745)
    {
        float _3841 = fma(_3635, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3823);
        _3821 = _3841;
    }
    float _3843 = _3821;
    float _3845 = _3733 * _3789;
    float _3847 = -_3835;
    float _3849 = fma(_3739, _3813, _3847);
    float _3851 = _3839 * _3741;
    if (!_3745)
    {
        float _3853 = fma(_3631, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3807);
        _3805 = _3853;
    }
    float _3855 = _3805;
    float _3857 = _3697 * _3831;
    float _3859 = _3735 * _3813;
    float _3861 = _3695 * _3833;
    float _3863 = _3701 * _3845;
    float _3865 = -_3857;
    float _3867 = fma(_3701, _3833, _3865);
    float _3869 = -_3859;
    float _3871 = fma(_3737, _3807, _3869);
    float _3873 = -_3861;
    float _3875 = fma(_3697, _3845, _3873);
    float _3877 = _3849 * _3741;
    float _3879 = -_3863;
    float _3881 = fma(_3695, _3831, _3879);
    float _3883 = _3607 * _3867;
    float _3885 = _3871 * _3741;
    float _3887 = _3607 * _3875;
    float _3889 = _3669 * _3867;
    float _3891 = _3667 * _3867;
    float _3893 = _3607 * _3881;
    float _3895 = _3669 * _3875;
    float _3897 = _3667 * _3875;
    float _3899 = _3867 * _3795;
    float _3901 = _3669 * _3881;
    float _3903 = _3667 * _3881;
    float _3905 = _3875 * _3795;
    float _3907 = fma(_3677, _3845, _3883);
    float _3909 = _3881 * _3795;
    float _3911 = fma(_3677, _3831, _3887);
    float _3913 = -_3589;
    float _3915 = fma(_3913, _3845, _3889);
    float _3917 = fma(_3679, _3845, _3891);
    float _3919 = -_3589;
    float _3921 = fma(_3919, _3831, _3895);
    float _3923 = fma(_3679, _3831, _3897);
    float _3925 = fma(_3845, _3819, _3899);
    float _3927 = fma(_3677, _3833, _3893);
    float _3929 = -_3589;
    float _3931 = fma(_3929, _3833, _3901);
    float _3933 = fma(_3679, _3833, _3903);
    float _3935 = fma(_3831, _3819, _3905);
    float _3937 = fma(_3833, _3819, _3909);
    float _3939 = fma(_3661, _3701, _3911);
    float _3941 = fma(_3661, _3695, _3907);
    float _3943 = fma(_3663, _3695, _3915);
    float _3945 = fma(_3609, _3695, _3917);
    float _3947 = fma(_3695, _3829, _3925);
    float _3949 = fma(_3701, _3829, _3935);
    float _3951 = fma(_3661, _3697, _3927);
    float _3953 = fma(_3663, _3701, _3921);
    float _3955 = _2205 + _3947;
    float _3957 = _2199 + _3949;
    float _3959 = fma(_3609, _3701, _3923);
    float _3961 = fma(_3697, _3829, _3937);
    float _3963 = fma(_3663, _3697, _3931);
    float _3965 = -_3515;
    float _3967 = fma(_3965, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3957);
    float _3969 = -_3517;
    float _3971 = fma(_3969, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3955);
    float _3973 = _2323 + _3961;
    float _3975 = _3943 * _3737;
    float _3977 = _3953 * _3737;
    float _3979 = _3963 * _3737;
    float _3981 = _3967 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3983 = _3943 * _3827;
    float _3985 = _3953 * _3827;
    float _3987 = _3963 * _3827;
    float _3989 = _3851 * _3943;
    float _3991 = _3851 * _3953;
    float _3993 = _3851 * _3963;
    float _3995 = -_3527;
    float _3997 = fma(_3995, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3973);
    float _3999 = _3967 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4001 = fma(_3971, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3981);
    float _4003 = _3967 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4005 = fma(_3941, _3735, _3975);
    float _4007 = fma(_3971, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3999);
    float _4009 = fma(_3997, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4001);
    float _4011 = fma(_3939, _3735, _3977);
    float _4013 = fma(_3609, _3697, _3933);
    float _4015 = fma(_3951, _3735, _3979);
    float _4017 = _3967 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4019 = fma(_3971, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4003);
    float _4021 = fma(_3997, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4007);
    float _4023 = _4009 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4025 = fma(_3941, _3855, _3983);
    float _4027 = fma(_3945, _3739, _4005);
    float _4029 = fma(_3959, _3739, _4011);
    float _4031 = fma(_3877, _3941, _3989);
    float _4033 = fma(_3877, _3939, _3991);
    float _4035 = fma(_3877, _3951, _3993);
    float _4037 = fma(_4013, _3739, _4015);
    float _4039 = fma(_3971, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4017);
    float _4041 = fma(_3997, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4019);
    float _4043 = _4021 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4045 = _4023 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4047 = _4023 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4049 = _4023 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4051 = _4023 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4053 = fma(_3939, _3855, _3985);
    float _4055 = fma(_3951, _3855, _3987);
    float _4057 = fma(_3997, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4039);
    float _4059 = _4041 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4061 = fma(_4043, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4045);
    float _4063 = fma(_4043, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4047);
    float _4065 = fma(_4043, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4049);
    float _4067 = fma(_4043, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4051);
    float _4069 = fma(_4059, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4061);
    float _4071 = _4057 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4073 = fma(_4059, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4063);
    float _4075 = fma(_4059, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4065);
    float _4077 = fma(_4059, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4067);
    float _4079 = fma(_3945, _3843, _4025);
    float _4081 = fma(_3959, _3843, _4053);
    float _4083 = fma(_4071, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4069);
    float _4085 = fma(_3885, _3945, _4031);
    float _4087 = fma(_4013, _3843, _4055);
    float _4089 = fma(_3885, _3959, _4033);
    float _4091 = fma(_3885, _4013, _4035);
    float _4093 = fma(_4071, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4073);
    float _4095 = fma(_4071, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4075);
    float _4097 = fma(_4071, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4077);
    out.m_55.x = _4027;
    out.m_55.y = _4029;
    out.m_55.z = _4037;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_57.x = _4079;
    out.m_57.y = _4081;
    out.m_57.z = _4087;
    out.m_59.x = _4085;
    out.m_59.y = _4089;
    out.m_59.z = _4091;
    out.gl_Position.x = _4093;
    out.gl_Position.y = _4083;
    out.gl_Position.z = _4095;
    out.gl_Position.w = _4097;
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
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _722 = false;
    bool _606 = false;
    bool _276 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_26.w;
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
        out.m_29.x = 0.0;
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
        float _4154 = as_type<float>(_94);
        out.gl_Position.z = _4154;
    }
    if (!_82)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _98 = in.m_31.w;
    bool _100 = _98 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_98);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    float _110 = -_98;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _114 = 0.0;
    float _116 = _112;
    if (_108)
    {
        float _118 = float(_78);
        _114 = _118;
    }
    float _120 = _114;
    bool _122 = _112 >= _120;
    bool _124 = !_108;
    bool _126 = _122 || _124;
    if (_126)
    {
        _88 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _88;
    if (_126)
    {
        out.m_29.x = 0.0;
    }
    if (_126)
    {
        float _130 = _128 * 5.0;
        _96 = as_type<int>(_130);
    }
    int _132 = _96;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4223 = as_type<float>(_132);
        out.gl_Position.z = _4223;
    }
    if (_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_33.w;
    float _136 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    float _148 = in.m_31.x;
    float _150 = in.m_31.y;
    float _152 = in.m_31.z;
    float _154 = in.m_26.x;
    float _156 = in.m_26.y;
    float _158 = in.m_26.z;
    float _160 = 0.0;
    float _162 = _136;
    if (!_146)
    {
        float _164 = _136 * _136;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = _168;
    if (!_146)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    bool _176 = !_146;
    float _178 = _174;
    if (!_176)
    {
        float _180 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = log2(_180);
        float _184 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _186 = _184 + 1.0;
        float _188 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = _136 * _182;
        float _192 = 1.0 / _186;
        float _194 = _188 * 0.693147182464599609375;
        float _196 = exp2(_190);
        float _198 = 1.0 / _194;
        float _200 = _196 + (-1.0);
        float _202 = -_200;
        float _204 = fma(_202, _198, _136);
        float _206 = _204 * _192;
        float _208 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _208;
    }
    float _210 = _178;
    bool _212 = !_146;
    if (!_212)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = 1.0 / _220;
        float _224 = _136 * _216;
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
    float _250 = fma(_244, _134, _154);
    float _252 = fma(_246, _134, _156);
    float _254 = fma(_248, _134, _158);
    bool _256 = !_236;
    float _274;
    if (!_256)
    {
        float _258 = in.m_35.x;
        float _260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _262 = _258 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[12].x, _112);
        float _266 = _264 * _260;
        float _268 = floor(_266);
        float _270 = -_268;
        float _272 = _266 + _270;
        _274 = _272;
        _276 = true;
    }
    else
    {
        float _278 = float(_78);
        float _280 = 1.0 / _278;
        float _282 = _112 * _280;
        _274 = _282;
    }
    _276 = false;
    float _284 = _274;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _284 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _306 = 1.0 / _292;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _308;
    bool _312 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _314 = isnan(_284);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -_322;
    float _326 = _324 + 1.0;
    float _328 = 1.0 / _300;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = _284 + _330;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _336 = 1.0 / _296;
    float _338 = _332 * _306;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _342 = _284 + _340;
    bool _344 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _346 = isnan(_284);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    bool _356 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _358 = isnan(_284);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = 1.0 / _304;
    float _370 = _342 * _328;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _374 = _284 + _372;
    bool _376 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _378 = isnan(_284);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -_354;
    float _390 = _388 + 1.0;
    float _392 = 1.0 / _310;
    float _394 = _288 * _336;
    bool _396 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _398 = isnan(_284);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = _366 * _390;
    bool _410 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _412 = isnan(_284);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _424 = _284 + _422;
    float _426 = -_366;
    float _428 = _426 + 1.0;
    float _430 = _406 * _326;
    float _432 = _374 * _368;
    float _434 = -_386;
    float _436 = _434 + 1.0;
    float _438 = -_406;
    float _440 = _438 + 1.0;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _442;
    float _446 = _322 * _428;
    float _448 = _354 * _436;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _450;
    float _454 = _420 * _440;
    float _456 = _424 * _392;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _458;
    float _462 = fma(_452, _338, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _476 = fma(_444, _338, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _478 = _462 * _454;
    float _480 = -_420;
    float _482 = _480 + 1.0;
    float _484 = fma(_460, _338, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _486 = fma(_466, _394, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _488 = fma(_470, _394, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _490 = fma(_474, _394, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _492 = _476 * _454;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _494;
    float _498 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[143].x, _478);
    float _500 = _484 * _454;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _502;
    float _506 = fma(_496, _370, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _508 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[143].y, _492);
    float _510 = fma(_486, _430, _498);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _512;
    float _516 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[143].z, _500);
    float _518 = fma(_504, _370, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _520 = fma(_488, _430, _508);
    float _522 = fma(_506, _446, _510);
    float _524 = fma(_514, _370, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _526 = fma(_490, _430, _516);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _540 = fma(_518, _446, _520);
    float _542 = fma(_524, _446, _526);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _544;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _548;
    float _552 = fma(_530, _432, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _554 = fma(_534, _432, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _556 = fma(_538, _432, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _558;
    float _562 = fma(_546, _456, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _564 = fma(_550, _456, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _566 = fma(_552, _408, _522);
    float _568 = fma(_560, _456, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _570 = fma(_554, _408, _540);
    float _572 = fma(_556, _408, _542);
    float _574 = fma(_562, _448, _566);
    float _576 = fma(_564, _448, _570);
    float _578 = fma(_568, _448, _572);
    float _580 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[148].x, _574);
    float _582 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[148].y, _576);
    float _584 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[148].z, _578);
    bool _586 = !_334;
    float _604;
    if (!_586)
    {
        float _588 = in.m_35.x;
        float _590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _592 = _588 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _594 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[11].y, _112);
        float _596 = _594 * _590;
        float _598 = floor(_596);
        float _600 = -_598;
        float _602 = _596 + _600;
        _604 = _602;
        _606 = true;
    }
    else
    {
        float _608 = float(_78);
        float _610 = 1.0 / _608;
        float _612 = _112 * _610;
        _604 = _612;
    }
    _606 = false;
    float _614 = _604;
    float _616 = in.m_33.x;
    float _618 = in.m_33.y;
    float _620 = in.m_33.z;
    bool _622 = _614 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _624 = isnan(_614);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _638 = _614 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _640 = isnan(_614);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _656 = _614 + _654;
    float _658 = -_632;
    float _660 = _658 + 1.0;
    bool _662 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _664 = 1.0 / _636;
    float _666 = _648 * _660;
    float _668 = -_648;
    float _670 = _668 + 1.0;
    float _672 = _584 * _620;
    float _674 = _582 * _618;
    float _676 = _652 * _664;
    float _678 = _580 * _616;
    float _680 = fma(_676, _656, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _682 = _680 * _666;
    float _684 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[115].x, _682);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _692 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[116].x, _684);
    float _694 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = _692 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.x = _694;
    out.m_37.y = _696;
    out.m_37.z = _698;
    out.m_37.w = _700;
    bool _702 = !_662;
    float _720;
    if (!_702)
    {
        float _704 = in.m_35.x;
        float _706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _708 = _704 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[11].w, _112);
        float _712 = _710 * _706;
        float _714 = floor(_712);
        float _716 = -_714;
        float _718 = _712 + _716;
        _720 = _718;
        _722 = true;
    }
    else
    {
        float _724 = float(_78);
        float _726 = 1.0 / _724;
        float _728 = _112 * _726;
        _720 = _728;
    }
    _722 = false;
    float _730 = _720;
    float _732 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _734 = int(_732);
    float _736 = in.m_35.x;
    float _738 = in.m_35.y;
    float _740 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _742 = int(_740);
    float _744 = in.m_35.w;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _748 = in.m_35.z;
    float _750 = float(_734);
    float _752 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _754 = int(_752);
    float _756 = in.m_39.y;
    float _758 = in.m_39.x;
    float _760 = float(_742);
    float _762 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _764 = int(_762);
    bool _766 = _738 > 0.5;
    float _768 = 1.0 / _750;
    float _770 = float(_754);
    bool _772 = _744 > 0.5;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _776 = _774 != 0;
    float _778 = 1.0 / _760;
    float _780 = float(uint(_764));
    int _782 = ~_764;
    int _784 = _782 + 1;
    bool _786 = _764 == 0;
    float _788 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _790 = int(_788);
    float _792 = _768 * _112;
    float _794 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _796 = int(_794);
    float _798 = _778 * _112;
    float _800 = _778;
    float _802 = _756;
    float _804 = _758;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_776)
    {
        _800 = 1.0;
    }
    float _808 = _800;
    float _810 = _808;
    if (!_776)
    {
        _810 = 7.345489978790283203125;
    }
    float _812 = _810;
    float _814 = 1.0 / _780;
    float _816 = float(uint(_790));
    float _818 = trunc(_792);
    int _820 = int(_818);
    float _822 = float(uint(_796));
    float _824 = 1.0 / _816;
    float _826 = trunc(_798);
    int _828 = int(_826);
    float _830 = float(uint(_820));
    float _832 = _816;
    float _834 = _824;
    float _836 = _830;
    if (_776)
    {
        _832 = 1.0;
    }
    float _838 = _832;
    float _840 = _838;
    if (!_776)
    {
        _840 = 1.2345600128173828125;
    }
    float _842 = _840;
    float _844 = 1.0 / _770;
    float _846 = 1.0 / _822;
    float _848 = float(uint(_828));
    float _850 = _844 * _112;
    float _852 = _812 * _736;
    int _854 = as_type<int>(_814) + (-2);
    int _856 = as_type<int>(_824) + (-2);
    float _858 = floor(_852);
    float _860 = _844;
    if (_776)
    {
        _860 = _736;
    }
    float _862 = _860;
    float _864 = as_type<float>(_854) * _830;
    float _866 = _862;
    if (!_776)
    {
        _866 = _738;
    }
    float _868 = _866;
    float _870 = as_type<float>(_856) * _848;
    if (_776)
    {
        _834 = 1.0;
    }
    float _872 = _834;
    float _874 = _872;
    if (_776)
    {
        _836 = _736;
    }
    float _876 = _836;
    float _878 = trunc(_864);
    float _880 = precise::max(_878, 0.0);
    uint _883 = uint(_880);
    float _885 = _842 * _868;
    float _887 = _876;
    if (!_776)
    {
        _874 = 5.839270114898681640625;
    }
    float _889 = _874;
    if (!_776)
    {
        _887 = _748;
    }
    float _891 = _887;
    float _893 = trunc(_870);
    float _895 = precise::max(_893, 0.0);
    uint _897 = uint(_895);
    int _899 = ~_790;
    int _901 = _899 + 1;
    float _903 = -_858;
    float _905 = _852 + _903;
    float _907 = _889 * _891;
    float _909 = -_756;
    float _911 = _909 + 1.0;
    int _913 = _784 * int(_883);
    int _915 = _913 + _820;
    float _917 = trunc(_850);
    int _919 = int(_917);
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _923 = _921 != 0;
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _927 = _925 != 0;
    float _929 = float(uint(_915));
    int _931 = _901 * int(_897);
    int _933 = _931 + _828;
    float _935 = floor(_885);
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _939 = _937 != 0;
    float _941 = as_type<float>(_854) * _929;
    int _943 = _766 ? as_type<int>(_911) : as_type<int>(_756);
    float _945 = float(uint(_933));
    float _947 = _923 ? as_type<float>(_943) : _756;
    float _949 = trunc(_941);
    float _951 = precise::max(_949, 0.0);
    uint _953 = uint(_951);
    int _955 = as_type<int>(_846) + (-2);
    float _957 = as_type<float>(_856) * _945;
    float _959 = float(uint(_919));
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _963 = _961 != 0;
    int _965 = 0;
    int _967 = as_type<int>(_941);
    float _969 = _945;
    float _971 = _959;
    if (_939)
    {
        float _973 = -_758;
        float _975 = _973 + 1.0;
        _965 = as_type<int>(_975);
    }
    int _977 = _965;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _981 = _979 != 0;
    float _983 = as_type<float>(_955) * _959;
    int _985 = _772 ? as_type<int>(_911) : as_type<int>(_756);
    float _987 = floor(_907);
    bool _989 = _748 > 0.5;
    float _991 = -_935;
    float _993 = _885 + _991;
    float _995 = _981 ? as_type<float>(_985) : _756;
    bool _997 = _981;
    if (_927)
    {
        float _999 = -_758;
        float _1001 = _999 + 1.0;
        _967 = as_type<int>(_1001);
    }
    int _1003 = _967;
    float _1005 = float(_78);
    if (_927)
    {
        bool _1007 = _736 > 0.5;
        _997 = _1007;
    }
    bool _1009 = _997;
    float _1011 = trunc(_983);
    float _1013 = precise::max(_1011, 0.0);
    uint _1015 = uint(_1013);
    if (_963)
    {
        float _1017 = _989 ? _911 : _756;
        _802 = _1017;
    }
    float _1019 = _802;
    int _1021 = ~_796;
    int _1023 = _1021 + 1;
    if (!_927)
    {
        _969 = _758;
    }
    float _1025 = _969;
    float _1027 = 1.0 / _1005;
    float _1029 = _1025;
    if (_927)
    {
        float _1031 = _1009 ? as_type<float>(_1003) : _758;
        _1029 = _1031;
    }
    float _1033 = _1029;
    float _1035 = float(_764);
    if (!_939)
    {
        _971 = _758;
    }
    float _1037 = _971;
    float _1039 = float(_820);
    int _1041 = _1023 * int(_1015);
    int _1043 = _1041 + _919;
    float _1045 = trunc(_957);
    float _1047 = precise::max(_1045, 0.0);
    uint _1049 = uint(_1047);
    float _1051 = _1037;
    if (_939)
    {
        float _1053 = _989 ? as_type<float>(_977) : _758;
        _1051 = _1053;
    }
    float _1055 = _1051;
    float _1057 = -_987;
    float _1059 = _907 + _1057;
    bool _1061 = _1039 >= _1035;
    bool _1063 = isnan(_1039);
    bool _1065 = _1061 || _1063;
    bool _1067 = isnan(_1035);
    bool _1069 = _1065 || _1067;
    float _1071 = float(_1069);
    float _1073 = _905 * _1035;
    float _1075 = float(uint(_1043));
    float _1077 = float(_790);
    int _1079 = int(_883) + int(_953);
    float _1081 = _1035 * _112;
    int _1083 = ~_764;
    int _1085 = _1083 + 1;
    float _1087 = as_type<float>(_955) * _1075;
    float _1089 = float(_828);
    float _1091 = _1081 * _1027;
    float _1093 = _1077 * _993;
    float _1095 = trunc(_1073);
    int _1097 = int(_1095);
    float _1099 = float(_796);
    float _1101 = _1027 * _112;
    int _1103 = _1085 * _1079;
    int _1105 = _1103 + _820;
    bool _1107 = _1089 >= _1077;
    bool _1109 = isnan(_1089);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan(_1077);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    float _1119 = float(_919);
    float _1121 = _1077 * _1101;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1125 = _1123 != 0;
    float _1127 = _1099 * _1101;
    bool _1129 = uint(_1105) >= uint(_764);
    float _1131 = trunc(_1087);
    float _1133 = precise::max(_1131, 0.0);
    uint _1135 = uint(_1133);
    int _1137 = int(_897) + int(_1049);
    bool _1139 = _1119 >= _1099;
    bool _1141 = isnan(_1119);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan(_1099);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = _1099 * _1059;
    int _1153 = ~_790;
    int _1155 = _1153 + 1;
    bool _1157 = !_1125;
    int _1159 = _1157 ? 0 : 1;
    float _1161 = trunc(_1071);
    int _1163 = int(_1161);
    bool _1165 = !_1129;
    int _1167 = _1165 ? 0 : (-1);
    int _1169 = _1155 * _1137;
    int _1171 = _1169 + _828;
    int _1173 = abs(_1159);
    int _1175 = ~_1079;
    int _1177 = _1175 + _1167;
    int _1179 = _1177 + 1;
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1183 = _1181 != 0;
    int _1185 = _1097 * _1173;
    int _1187 = _1185 + _820;
    bool _1189 = uint(_1171) >= uint(_790);
    int _1191 = _764 * _1179;
    int _1193 = _1191 + _820;
    bool _1195 = !_1183;
    int _1197 = _1195 ? 0 : 1;
    float _1199 = trunc(_1093);
    int _1201 = int(_1199);
    bool _1203 = !_1189;
    int _1205 = _1203 ? 0 : (-1);
    bool _1207 = !_786;
    int _1209 = _1207 ? _1193 : (-1);
    int _1211 = ~_1163;
    int _1213 = _1211 + 1;
    int _1215 = _1213 + 1;
    int _1217 = abs(_1197);
    float _1219 = trunc(_1091);
    int _1221 = int(_1219);
    int _1223 = ~_1137;
    int _1225 = _1223 + _1205;
    int _1227 = _1225 + 1;
    int _1229 = _1209 * _1215;
    int _1231 = int(_1015) + int(_1135);
    int _1233 = ~_796;
    int _1235 = _1233 + 1;
    int _1237 = _1201 * _1217;
    int _1239 = _1237 + _828;
    int _1241 = _764 + (-1);
    float _1243 = trunc(_1117);
    int _1245 = int(_1243);
    int _1247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1249 = _1247 != 0;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1257 = _1255 != 0;
    int _1259 = _1235 * _1231;
    int _1261 = _1259 + _919;
    int _1263 = _1163 * _1241;
    int _1265 = _1263 + _1229;
    bool _1267 = !_1253;
    int _1269 = _1267 ? 0 : 1;
    bool _1271 = uint(_1261) >= uint(_796);
    int _1273 = _790 * _1227;
    int _1275 = _1273 + _828;
    bool _1277 = !_1249;
    int _1279 = _1277 ? 0 : 1;
    float _1281 = trunc(_1121);
    int _1283 = int(_1281);
    int _1285 = abs(_1269);
    int _1287 = abs(_1279);
    int _1289 = int(_1271);
    int _1291 = _1129 ? 2 : 0;
    int _1293 = _1289 | _1291;
    int _1295 = _1189 ? 4 : 0;
    int _1297 = _1293 | _1295;
    int _1299 = _963 ? 8 : 0;
    int _1301 = _1297 | _1299;
    int _1303 = _1249 ? 16 : 0;
    int _1305 = _1301 | _1303;
    int _1307 = _1253 ? 32 : 0;
    int _1309 = _1305 | _1307;
    int _1311 = _1257 ? 64 : 0;
    int _1313 = _1309 | _1311;
    int _1315 = _1313 & 1;
    int _1317 = _1265 * _1285;
    int _1319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1321 = _1319 != 0;
    bool _1323 = !_1257;
    int _1325 = _1323 ? 0 : 1;
    int _1327 = _1221 * _1287;
    int _1329 = _1327 + _1317;
    bool _1331 = _1315 != 0;
    bool _1333 = _790 == 0;
    bool _1335 = !_1321;
    int _1337 = _1335 ? 0 : 1;
    int _1339 = abs(_1325);
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1343 = _1341 != 0;
    int _1345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1347 = _1345 != 0;
    float _1349 = trunc(_1151);
    int _1351 = int(_1349);
    int _1353 = abs(_1337);
    int _1355 = _1187 * _1339;
    int _1357 = _1355 + _1329;
    int _1359 = ~_1245;
    int _1361 = _1359 + 1;
    int _1363 = _1361 + 1;
    bool _1365 = !_1333;
    int _1367 = _1365 ? _1275 : (-1);
    int _1369 = _1097 * _1353;
    int _1371 = _1369 + _1357;
    bool _1373 = !_1343;
    int _1375 = _1373 ? 0 : 1;
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1379 = _1377 != 0;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1383 = _1381 != 0;
    int _1385 = _1363 * _1367;
    int _1387 = _790 + (-1);
    int _1389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1391 = _1389 != 0;
    bool _1393 = !_1331;
    int _1395 = _1393 ? 0 : (-1);
    int _1397 = _1245 * _1387;
    int _1399 = _1397 + _1385;
    bool _1401 = !_1347;
    float _1403 = _1401 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1405 = !_1391;
    int _1407 = _1405 ? 0 : 1;
    int _1409 = ~_1231;
    int _1411 = _1409 + _1395;
    int _1413 = _1411 + 1;
    float _1415 = float(uint(_1371));
    int _1417 = abs(as_type<int>(_1403));
    int _1419 = abs(_1375);
    float _1421 = as_type<float>(_854) * _1415;
    int _1423 = abs(_1407);
    int _1425 = _1399 * _1417;
    float _1427 = trunc(_1149);
    int _1429 = int(_1427);
    bool _1431 = !_1379;
    int _1433 = _1431 ? 0 : 1;
    int _1435 = _1351 * _1423;
    int _1437 = _1435 + _919;
    bool _1439 = _796 == 0;
    int _1441 = _1283 * _1419;
    int _1443 = _1441 + _1425;
    int _1445 = abs(_1433);
    int _1447 = _796 * _1413;
    int _1449 = _1447 + _919;
    bool _1451 = !_1383;
    int _1453 = _1451 ? 0 : 1;
    float _1455 = trunc(_1421);
    float _1457 = precise::max(_1455, 0.0);
    uint _1459 = uint(_1457);
    int _1461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1463 = _1461 != 0;
    int _1465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1467 = _1465 != 0;
    int _1469 = _1239 * _1445;
    int _1471 = _1469 + _1443;
    int _1473 = abs(_1453);
    int _1475 = ~_764;
    int _1477 = _1475 + 1;
    float _1479 = float(uint(_1187));
    int _1481 = _1201 * _1473;
    int _1483 = _1481 + _1471;
    int _1485 = ~_1429;
    int _1487 = _1485 + 1;
    int _1489 = _1487 + 1;
    float _1491 = trunc(_1127);
    int _1493 = int(_1491);
    bool _1495 = !_1439;
    int _1497 = _1495 ? _1449 : (-1);
    float _1499 = as_type<float>(_854) * _1479;
    bool _1501 = !_1467;
    int _1503 = _1501 ? 0 : 1;
    int _1505 = _1489 * _1497;
    int _1507 = _796 + (-1);
    float _1509 = trunc(_1499);
    float _1511 = precise::max(_1509, 0.0);
    uint _1513 = uint(_1511);
    int _1515 = abs(_1503);
    int _1517 = _1477 * int(_1459);
    int _1519 = _1517 + _1371;
    float _1521 = float(uint(_1483));
    int _1523 = _1429 * _1507;
    int _1525 = _1523 + _1505;
    float _1527 = float(uint(_1519));
    float _1529 = as_type<float>(_856) * _1521;
    int _1531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1533 = _1531 != 0;
    int _1535 = _1525 * _1515;
    bool _1537 = !_1463;
    int _1539 = _1537 ? 0 : 1;
    float _1541 = as_type<float>(_854) * _1527;
    bool _1543 = !_1533;
    int _1545 = _1543 ? 0 : 1;
    float _1547 = trunc(_1529);
    float _1549 = precise::max(_1547, 0.0);
    uint _1551 = uint(_1549);
    int _1553 = abs(_1539);
    int _1555 = _1477 * int(_1513);
    int _1557 = _1555 + _1187;
    int _1559 = abs(_1545);
    int _1561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1563 = _1561 != 0;
    float _1565 = trunc(_1541);
    float _1567 = precise::max(_1565, 0.0);
    uint _1569 = uint(_1567);
    float _1571 = float(uint(_1557));
    int _1573 = _1493 * _1553;
    int _1575 = _1573 + _1535;
    bool _1577 = !_1563;
    int _1579 = _1577 ? 0 : 1;
    float _1581 = as_type<float>(_854) * _1571;
    int _1583 = ~_790;
    int _1585 = _1583 + 1;
    int _1587 = _1437 * _1559;
    int _1589 = _1587 + _1575;
    int _1591 = abs(_1579);
    int _1593 = ~_764;
    int _1595 = _1593 + 1;
    int _1597 = _1585 * int(_1551);
    int _1599 = _1597 + _1483;
    int _1601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1603 = _1601 != 0;
    int _1605 = _1351 * _1591;
    int _1607 = _1605 + _1589;
    float _1609 = float(uint(_1239));
    int _1611 = int(_1459) + int(_1569);
    float _1613 = as_type<float>(_856) * _1609;
    float _1615 = float(uint(_1607));
    float _1617 = trunc(_1581);
    float _1619 = precise::max(_1617, 0.0);
    uint _1621 = uint(_1619);
    float _1623 = float(uint(_1599));
    int _1625 = _1595 * _1611;
    int _1627 = _1625 + _1371;
    bool _1629 = _738 > 0.5;
    float _1631 = as_type<float>(_955) * _1615;
    int _1633 = _1585;
    float _1635 = _1521;
    float _1637 = as_type<float>(_1419);
    float _1639 = as_type<float>(_1287);
    float _1641 = _1403;
    int _1643 = _1607;
    if (_1603)
    {
        float _1645 = -_758;
        float _1647 = _1645 + 1.0;
        _1633 = as_type<int>(_1647);
    }
    int _1649 = _1633;
    float _1651 = as_type<float>(_856) * _1623;
    bool _1653 = uint(_1627) >= uint(_764);
    float _1655 = trunc(_1613);
    float _1657 = precise::max(_1655, 0.0);
    uint _1659 = uint(_1657);
    int _1661 = ~_796;
    int _1663 = _1661 + 1;
    bool _1665 = !_1653;
    int _1667 = _1665 ? 0 : (-1);
    if (_1603)
    {
        float _1669 = _1629 ? as_type<float>(_1649) : _758;
        _804 = _1669;
    }
    float _1671 = _804;
    int _1673 = ~_1611;
    int _1675 = _1673 + _1667;
    int _1677 = _1675 + 1;
    float _1679 = trunc(_1631);
    float _1681 = precise::max(_1679, 0.0);
    uint _1683 = uint(_1681);
    int _1685 = int(_1513) + int(_1621);
    float _1687 = float(uint(_1437));
    int _1689 = _764 * _1677;
    int _1691 = _1689 + _1371;
    bool _1693 = _764 == 0;
    float _1695 = trunc(_1651);
    float _1697 = precise::max(_1695, 0.0);
    uint _1699 = uint(_1697);
    float _1701 = as_type<float>(_955) * _1687;
    int _1703 = ~_790;
    int _1705 = _1703 + 1;
    bool _1707 = !_1693;
    int _1709 = _1707 ? _1691 : (-1);
    int _1711 = ~_796;
    int _1713 = _1711 + 1;
    int _1715 = _1663 * int(_1683);
    int _1717 = _1715 + _1607;
    float _1719 = trunc(_1701);
    float _1721 = precise::max(_1719, 0.0);
    uint _1723 = uint(_1721);
    int _1725 = ~_790;
    int _1727 = _1725 + 1;
    int _1729 = _1709 & 3;
    bool _1731 = _1729 != 0;
    float _1733 = float(uint(_1717));
    int _1735 = int(_1551) + int(_1699);
    int _1737 = _1709 & 3;
    bool _1739 = _1737 != 0;
    float _1741 = as_type<float>(_955) * _1733;
    int _1743 = _1727 * int(_1659);
    int _1745 = _1743 + _1239;
    int _1747 = _1731 ? 0 : 1;
    int _1749 = _1705 * _1735;
    int _1751 = _1749 + _1483;
    bool _1753 = uint(_1737) > 1u;
    float _1755 = trunc(_1741);
    float _1757 = precise::max(_1755, 0.0);
    uint _1759 = uint(_1757);
    float _1761 = float(uint(_1745));
    int _1763 = _1713 * int(_1723);
    int _1765 = _1763 + _1437;
    bool _1767 = uint(_1751) >= uint(_790);
    int _1769 = ~_764;
    int _1771 = _1769 + 1;
    float _1773 = as_type<float>(_856) * _1761;
    bool _1775 = !_1767;
    int _1777 = _1775 ? 0 : (-1);
    bool _1779 = _1737 != 3;
    int _1781 = _1771 * _1685;
    int _1783 = _1781 + _1187;
    int _1785 = ~_1735;
    int _1787 = _1785 + _1777;
    int _1789 = _1787 + 1;
    float _1791 = trunc(_1773);
    float _1793 = precise::max(_1791, 0.0);
    uint _1795 = uint(_1793);
    int _1797 = ~_1747;
    int _1799 = _1797 + 1;
    int _1801 = _1799 + 1;
    int _1803 = _1801;
    if (!_1753)
    {
        int _1805 = ~_1747;
        int _1807 = _1805 + 1;
        _1803 = _1807;
    }
    int _1809 = _1803;
    int _1811 = _790 * _1789;
    int _1813 = _1811 + _1483;
    bool _1815 = uint(_1737) >= 2u;
    float _1817 = float(uint(_1765));
    int _1819 = _1815 ? 0 : 1;
    bool _1821 = uint(_1783) >= uint(_764);
    float _1823 = as_type<float>(_955) * _1817;
    bool _1825 = !_1333;
    int _1827 = _1825 ? _1813 : (-1);
    int _1829 = ~_796;
    int _1831 = _1829 + 1;
    float _1833 = trunc(_1823);
    float _1835 = precise::max(_1833, 0.0);
    uint _1837 = uint(_1835);
    int _1839 = int(_1683) + int(_1759);
    int _1841 = ~_1819;
    int _1843 = _1841 + 1;
    int _1845 = _1843 + 1;
    int _1847 = _1845;
    if (_1779)
    {
        int _1849 = ~_1819;
        int _1851 = _1849 + 1;
        _1847 = _1851;
    }
    int _1853 = _1847;
    int _1855 = _1831 * _1839;
    int _1857 = _1855 + _1607;
    int _1859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1861 = _1859 != 0;
    bool _1863 = !_1821;
    int _1865 = _1863 ? 0 : (-1);
    int _1867 = _1827 & 3;
    bool _1869 = _1867 != 0;
    bool _1871 = !_1861;
    int _1873 = _1871 ? 0 : 1;
    bool _1875 = uint(_1867) >= 2u;
    int _1877 = _1869 ? 0 : 1;
    bool _1879 = uint(_1857) >= uint(_796);
    int _1881 = _1875 ? 0 : 1;
    bool _1883 = _1867 != 3;
    int _1885 = int(_1659) + int(_1795);
    bool _1887 = !_1879;
    int _1889 = _1887 ? 0 : (-1);
    int _1891 = ~_790;
    int _1893 = _1891 + 1;
    bool _1895 = uint(_1867) > 1u;
    int _1897 = ~_1839;
    int _1899 = _1897 + _1889;
    int _1901 = _1899 + 1;
    int _1903 = _1893 * _1885;
    int _1905 = _1903 + _1239;
    int _1907 = ~_1881;
    int _1909 = _1907 + 1;
    int _1911 = _1909 + 1;
    float _1913 = _738 * 2.0;
    int _1915 = _1911;
    if (_1883)
    {
        int _1917 = ~_1881;
        int _1919 = _1917 + 1;
        _1915 = _1919;
    }
    int _1921 = _1915;
    int _1923 = _796 * _1901;
    int _1925 = _1923 + _1607;
    int _1927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1929 = _1927 != 0;
    float _1931 = _748 * 2.0;
    bool _1933 = uint(_1905) >= uint(_790);
    float _1935 = floor(_1913);
    bool _1937 = !_1439;
    int _1939 = _1937 ? _1925 : (-1);
    int _1941 = ~_1877;
    int _1943 = _1941 + 1;
    int _1945 = _1943 + 1;
    int _1947 = _1945;
    if (!_1895)
    {
        int _1949 = ~_1877;
        int _1951 = _1949 + 1;
        _1947 = _1951;
    }
    int _1953 = _1947;
    float _1955 = _736 * 2.0;
    bool _1957 = !_1933;
    int _1959 = _1957 ? 0 : (-1);
    float _1961 = floor(_1931);
    int _1963 = _1827 & 3;
    bool _1965 = _1963 != 0;
    int _1967 = _1939 & 3;
    bool _1969 = _1967 != 0;
    bool _1971 = !_1965;
    int _1973 = _1971 ? 0 : 1;
    bool _1975 = _1967 != 3;
    float _1977 = floor(_1955);
    if (_1929)
    {
        _806 = 0;
    }
    int _1979 = _806;
    int _1981 = _1979;
    if (!_1929)
    {
        _1981 = 1;
    }
    int _1983 = _1981;
    bool _1985 = !_1739;
    int _1987 = _1985 ? 0 : 1;
    bool _1989 = uint(_1967) >= 2u;
    bool _1991 = _1983 != 1;
    int _1993 = _1989 ? 0 : 1;
    int _1995 = int(_1723) + int(_1837);
    int _1997 = ~_1993;
    int _1999 = _1997 + 1;
    int _2001 = _1999 + 1;
    int _2003 = _2001;
    if (_1975)
    {
        int _2005 = ~_1993;
        int _2007 = _2005 + 1;
        _2003 = _2007;
    }
    int _2009 = _2003;
    int _2011 = _1939 & 3;
    bool _2013 = _2011 != 0;
    bool _2015 = _1977 > 0.0;
    int _2017 = ~_796;
    int _2019 = _2017 + 1;
    bool _2021 = !_2013;
    int _2023 = _2021 ? 0 : 1;
    bool _2025 = _1977 >= 0.0;
    bool _2027 = isnan(_1977);
    bool _2029 = _2025 || _2027;
    bool _2031 = isnan(0.0);
    bool _2033 = _2029 || _2031;
    int _2035 = _2019 * _1995;
    int _2037 = _2035 + _1437;
    int _2039 = _1969 ? 0 : 1;
    int _2041 = _2033 ? 0 : 1;
    bool _2043 = uint(_2037) >= uint(_796);
    int _2045 = ~_2041;
    int _2047 = _2045 + 1;
    int _2049 = _2047 + 1;
    int _2051 = _2049;
    if (!_2015)
    {
        int _2053 = ~_2041;
        int _2055 = _2053 + 1;
        _2051 = _2055;
    }
    int _2057 = _2051;
    bool _2059 = _1867 != 3;
    bool _2061 = uint(_1967) > 1u;
    bool _2063 = !_2043;
    int _2065 = _2063 ? 0 : (-1);
    bool _2067 = _1935 > 0.0;
    if (!_1991)
    {
        _1635 = _738;
    }
    float _2069 = _1635;
    float _2071 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2073 = _2071 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2075 = _1935 >= 0.0;
    bool _2077 = isnan(_1935);
    bool _2079 = _2075 || _2077;
    bool _2081 = isnan(0.0);
    bool _2083 = _2079 || _2081;
    float _2085 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2087 = _2069;
    if (!_1991)
    {
        _1637 = _748;
    }
    float _2089 = _1637;
    float _2091 = 1.0 / _2073;
    float _2093 = _2089;
    if (!_1991)
    {
        _1639 = _2069;
    }
    float _2095 = _1639;
    float _2097 = _2095;
    if (!_1991)
    {
        _1641 = _748;
    }
    float _2099 = _1641;
    float _2101 = _2099;
    if (_1991)
    {
        _2097 = _736;
    }
    float _2103 = _2097;
    if (_1991)
    {
        _2087 = _736;
    }
    float _2105 = _2087;
    if (_1991)
    {
        _2093 = _738;
    }
    float _2107 = _2093;
    float _2109 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2085);
    if (_1991)
    {
        _2101 = _738;
    }
    float _2111 = _2101;
    float _2113 = _736 + _738;
    bool _2115 = _1737 != 3;
    float _2117 = _2103 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2119 = _2083 ? 0 : 1;
    float _2121 = _2113 + (-1.0);
    bool _2123 = _1967 != 3;
    float _2125 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_1929)
    {
        _1643 = 0;
    }
    int _2127 = _1643;
    float _2129 = _2107 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2131 = ~_2039;
    int _2133 = _2131 + 1;
    int _2135 = _2133 + 1;
    int _2137 = _2127;
    int _2139 = _2135;
    if (!_1929)
    {
        _2137 = 2;
    }
    int _2141 = _2137;
    if (!_2061)
    {
        int _2143 = ~_2039;
        int _2145 = _2143 + 1;
        _2139 = _2145;
    }
    int _2147 = _2139;
    float _2149 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2151 = !_2115;
    int _2153 = _2151 ? 0 : (-1);
    float _2155 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2125);
    int _2157 = ~_2119;
    int _2159 = _2157 + 1;
    int _2161 = _2159 + 1;
    float _2163 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2149);
    bool _2165 = !_2123;
    int _2167 = _2165 ? 0 : (-1);
    float _2169 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2155);
    int _2171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2173 = _2171 != 0;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2177 = _2175 != 0;
    int _2179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2181 = _2179 != 0;
    float _2183 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2163);
    int _2185 = _2161;
    if (!_2067)
    {
        int _2187 = ~_2119;
        int _2189 = _2187 + 1;
        _2185 = _2189;
    }
    int _2191 = _2185;
    float _2193 = _736 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2197 = _2195 != 0;
    float _2199 = _2183 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2203 = _2201 != 0;
    float _2205 = _2169 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2207 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2209 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2207;
    bool _2211 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2213 = isnan(_730);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2219 = _2215 || _2217;
    float _2221 = float(_2219);
    float _2223 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2225 = !_2059;
    int _2227 = _2225 ? 0 : (-1);
    float _2229 = _2209 * _2091;
    float _2231 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2233 = _738 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2235 = -_2223;
    float _2237 = fma(_2193, 2.0, _2235);
    float _2239 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2241 = _730 + _2239;
    bool _2243 = _2141 != 2;
    float _2245 = fma(_2233, -2.0, _2231);
    bool _2247 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2249 = isnan(_730);
    bool _2251 = _2247 || _2249;
    bool _2253 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2255 = _2251 || _2253;
    float _2257 = float(_2255);
    float _2259 = -_2221;
    float _2261 = _2259 + 1.0;
    float _2263 = fma(_2229, _2241, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2265 = _2257 * _2261;
    float _2267 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2109);
    float _2269 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2271 = !_2173;
    int _2273 = _2271 ? 0 : 1;
    float _2275 = _736 + _748;
    bool _2277 = _1961 >= 0.0;
    bool _2279 = isnan(_1961);
    bool _2281 = _2277 || _2279;
    bool _2283 = isnan(0.0);
    bool _2285 = _2281 || _2283;
    float _2287 = _2263 * _2265;
    float _2289 = -_2257;
    float _2291 = _2289 + 1.0;
    float _2293 = _2275 + (-1.0);
    int _2295 = _2285 ? 0 : 1;
    float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2299 = _2199 + _2297;
    bool _2301 = _1961 > 0.0;
    float _2303 = fma(_2293, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2305 = _738 + _748;
    float _2307 = fma(_2291, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2287);
    int _2309 = ~_2295;
    int _2311 = _2309 + 1;
    int _2313 = _2311 + 1;
    float _2315 = _2305 + (-1.0);
    float _2317 = _2293;
    int _2319 = _2313;
    if (_2243)
    {
        _2317 = _736;
    }
    float _2321 = _2317;
    float _2323 = _2267 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2325 = fma(_2315, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2327 = fma(_2221, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2307);
    float _2329 = _2299 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2331 = _2321;
    if (!_2301)
    {
        int _2333 = ~_2295;
        int _2335 = _2333 + 1;
        _2319 = _2335;
    }
    int _2337 = _2319;
    float _2339 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2341 = _2205 + _2339;
    if (!_2243)
    {
        _2331 = _748;
    }
    float _2343 = _2331;
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2347 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2349 = _2323 + _2347;
    float _2351 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2329);
    float _2353 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2355 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2357 = _1709 >> 31;
    float _2359 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2351);
    float _2361 = -_2345;
    float _2363 = fma(_2355, 2.0, _2361);
    int _2365 = _2357 & 3;
    float _2367 = _2353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2369 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2371 = _1709 + _2365;
    float _2373 = _2327 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2375 = _1827 >> 31;
    float _2377 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2379 = _2359 >= 0.0;
    float _2381 = _2369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2383 = _2371 >> 2;
    float _2385 = _2377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2387 = _1939 >> 31;
    float _2389 = -_112;
    float _2391 = fma(_2389, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2237);
    int _2393 = _2375 & 3;
    float _2395 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2245);
    int _2397 = _2383 << 4;
    int _2399 = _2397 + 368;
    out.m_41.x = _2385;
    out.m_41.y = _2381;
    out.m_41.z = _2367;
    out.m_41.w = _2373;
    int _2401 = _2387 & 3;
    float _2403 = -_112;
    float _2405 = fma(_2403, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2363);
    int _2407 = _1827 + _2393;
    if (_2379)
    {
        out.m_29.x = 0.0;
    }
    int _2409 = _1939 + _2401;
    float _2411 = _748 + (-0.5);
    int _2413 = _2407 >> 2;
    int _2415 = _2413 << 4;
    int _2417 = _2415 + 512;
    uint _2419 = uint(int(uint(_2399) >> uint(2)));
    uint _2421 = uint(int(uint(int(_2419)) >> uint(2)));
    int _2423 = int(_2419) & 3;
    float _2425 = (*spvDescriptorSet0.vp_c9)._m0[int(_2421)][_2423];
    int _2427 = int(_2419) + 1;
    uint _2429 = uint(int(uint(_2427) >> uint(2)));
    int _2431 = _2427 & 3;
    float _2433 = (*spvDescriptorSet0.vp_c9)._m0[int(_2429)][_2431];
    int _2435 = _2409 >> 2;
    float _2437 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2439 = !_2177;
    int _2441 = _2439 ? 0 : 1;
    float _2443 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2445 = _2435 << 4;
    int _2447 = _2445 + 656;
    uint _2449 = uint(int(uint(_2417) >> uint(2)));
    uint _2451 = uint(int(uint(int(_2449)) >> uint(2)));
    int _2453 = int(_2449) & 3;
    float _2455 = (*spvDescriptorSet0.vp_c9)._m0[int(_2451)][_2453];
    int _2457 = int(_2449) + 1;
    uint _2459 = uint(int(uint(_2457) >> uint(2)));
    int _2461 = _2457 & 3;
    float _2463 = (*spvDescriptorSet0.vp_c9)._m0[int(_2459)][_2461];
    int _2465 = abs(_2441);
    float _2467 = -_2443;
    float _2469 = fma(_2117, 2.0, _2467);
    float _2471 = float(_2057);
    float _2473 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2437);
    float _2475 = fma(_2111, (*spvDescriptorSet0.vp_c9)._m0[83].w, _746);
    float _2477 = float(_2465);
    float _2479 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    uint _2481 = uint(int(uint(_2447) >> uint(2)));
    uint _2483 = uint(int(uint(int(_2481)) >> uint(2)));
    int _2485 = int(_2481) & 3;
    float _2487 = (*spvDescriptorSet0.vp_c9)._m0[int(_2483)][_2485];
    int _2489 = int(_2481) + 1;
    uint _2491 = uint(int(uint(_2489) >> uint(2)));
    int _2493 = _2489 & 3;
    float _2495 = (*spvDescriptorSet0.vp_c9)._m0[int(_2491)][_2493];
    int _2497 = abs(_2273);
    float _2499 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2501 = int(_2499);
    float _2503 = float(_2337);
    float _2505 = fma(_2129, -2.0, _2479);
    bool _2507 = !_2181;
    int _2509 = _2507 ? 0 : 1;
    float _2511 = _2477 * _2471;
    float _2513 = float(_2497);
    int _2515 = _2417 + 8;
    uint _2517 = uint(int(uint(_2515) >> uint(2)));
    uint _2519 = uint(int(uint(int(_2517)) >> uint(2)));
    int _2521 = int(_2517) & 3;
    float _2523 = (*spvDescriptorSet0.vp_c9)._m0[int(_2519)][_2521];
    int _2525 = int(_2517) + 1;
    uint _2527 = uint(int(uint(_2525) >> uint(2)));
    int _2529 = _2525 & 3;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[int(_2527)][_2529];
    int _2533 = ~_1885;
    int _2535 = _2533 + _1959;
    int _2537 = _2535 + 1;
    float _2539 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2473);
    int _2541 = abs(_2509);
    float _2543 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2475);
    float _2545 = float(_2191);
    int _2547 = _790 * _2537;
    int _2549 = _2547 + _1239;
    int _2551 = ~_1685;
    int _2553 = _2551 + _1865;
    int _2555 = _2553 + 1;
    int _2557 = _2399 + 8;
    uint _2559 = uint(int(uint(_2557) >> uint(2)));
    uint _2561 = uint(int(uint(int(_2559)) >> uint(2)));
    int _2563 = int(_2559) & 3;
    float _2565 = (*spvDescriptorSet0.vp_c9)._m0[int(_2561)][_2563];
    int _2567 = int(_2559) + 1;
    uint _2569 = uint(int(uint(_2567) >> uint(2)));
    int _2571 = _2567 & 3;
    float _2573 = (*spvDescriptorSet0.vp_c9)._m0[int(_2569)][_2571];
    float _2575 = _2513 * _2503;
    int _2577 = abs(_1953);
    float _2579 = -_112;
    float _2581 = fma(_2579, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2469);
    int _2583 = abs(_2147);
    int _2585 = _764 * _2555;
    int _2587 = _2585 + _1187;
    int _2589 = abs(_1809);
    float _2591 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2505);
    int _2593 = _2447 + 8;
    uint _2595 = uint(int(uint(_2593) >> uint(2)));
    uint _2597 = uint(int(uint(int(_2595)) >> uint(2)));
    int _2599 = int(_2595) & 3;
    float _2601 = (*spvDescriptorSet0.vp_c9)._m0[int(_2597)][_2599];
    int _2603 = int(_2595) + 1;
    uint _2605 = uint(int(uint(_2603) >> uint(2)));
    int _2607 = _2603 & 3;
    float _2609 = (*spvDescriptorSet0.vp_c9)._m0[int(_2605)][_2607];
    int _2611 = abs(_1987);
    float _2613 = _2511 * (-2.0);
    int _2615 = ~_2611;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = ~_2589;
    int _2623 = _2621 + 1;
    int _2625 = _2623 + 1;
    int _2627 = abs(_1973);
    int _2629 = _2625 * as_type<int>(_2433);
    int _2631 = ~_1995;
    int _2633 = _2631 + _2065;
    int _2635 = _2633 + 1;
    int _2637 = ~_2577;
    int _2639 = _2637 + 1;
    int _2641 = _2639 + 1;
    int _2643 = _2619 * as_type<int>(_2425);
    int _2645 = _2643 + _2629;
    int _2647 = _796 * _2635;
    int _2649 = _2647 + _1437;
    int _2651 = _2641 * as_type<int>(_2463);
    int _2653 = abs(_2023);
    float _2655 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2657 = int(_2655);
    int _2659 = abs(_1853);
    float _2661 = _2575 * (-2.0);
    int _2663 = abs(_1921);
    int _2665 = ~_2627;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    int _2671 = ~_2583;
    int _2673 = _2671 + 1;
    int _2675 = _2673 + 1;
    float _2677 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2679 = log2(_2677);
    int _2681 = _2669 * as_type<int>(_2455);
    int _2683 = _2681 + _2651;
    int _2685 = ~_2663;
    int _2687 = _2685 + 1;
    int _2689 = _2687 + 1;
    int _2691 = _2675 * as_type<int>(_2495);
    int _2693 = ~_2653;
    int _2695 = _2693 + 1;
    int _2697 = _2695 + 1;
    int _2699 = ~_2659;
    int _2701 = _2699 + 1;
    int _2703 = _2701 + 1;
    float _2705 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2707 = int(_2705);
    int _2709 = _2689 * as_type<int>(_2523);
    int _2711 = _2709 + _2683;
    int _2713 = abs(_2153);
    int _2715 = _2697 * as_type<int>(_2487);
    int _2717 = _2715 + _2691;
    int _2719 = abs(_2009);
    int _2721 = _2703 * as_type<int>(_2565);
    int _2723 = _2721 + _2645;
    int _2725 = abs(_2227);
    int _2727 = ~_2713;
    int _2729 = _2727 + 1;
    int _2731 = _2729 + 1;
    int _2733 = abs(_2167);
    int _2735 = ~_2719;
    int _2737 = _2735 + 1;
    int _2739 = _2737 + 1;
    int _2741 = _2731 * as_type<int>(_2573);
    int _2743 = _2741 + _2723;
    int _2745 = ~_2725;
    int _2747 = _2745 + 1;
    int _2749 = _2747 + 1;
    float _2751 = _2679 * _112;
    int _2753 = ~_2733;
    int _2755 = _2753 + 1;
    int _2757 = _2755 + 1;
    int _2759 = _2739 * as_type<int>(_2601);
    int _2761 = _2759 + _2717;
    float _2763 = float(uint(_2501));
    int _2765 = _2749 * as_type<int>(_2531);
    int _2767 = _2765 + _2711;
    bool _2769 = !_2197;
    int _2771 = _2769 ? 0 : 1;
    int _2773 = _2757 * as_type<int>(_2609);
    int _2775 = _2773 + _2761;
    float _2777 = float(uint(_2657));
    float _2779 = 1.0 / _2763;
    bool _2781 = !_2203;
    int _2783 = _2781 ? 0 : 1;
    float _2785 = float(uint(_2707));
    int _2787 = abs(_2501);
    int _2789 = abs(_1873);
    float _2791 = 1.0 / _2777;
    int _2793 = abs(_2771);
    int _2795 = abs(_2783);
    int _2797 = ~_2793;
    int _2799 = _2797 + 1;
    int _2801 = _2799 + 1;
    float _2803 = float(uint(_2787));
    float _2805 = 1.0 / _2785;
    bool _2807 = _790 == 0;
    int _2809 = _2801 * _2767;
    int _2811 = ~_2789;
    int _2813 = _2811 + 1;
    int _2815 = _2813 + 1;
    bool _2817 = _764 == 0;
    int _2819 = abs(_2657);
    float _2821 = 1.0 / _2803;
    int _2823 = ~_2795;
    int _2825 = _2823 + 1;
    int _2827 = _2825 + 1;
    int _2829 = _2743 * _2815;
    bool _2831 = !_2807;
    int _2833 = _2831 ? _2549 : (-1);
    bool _2835 = !_2817;
    int _2837 = _2835 ? _2587 : (-1);
    int _2839 = _2827 * _2775;
    float _2841 = float(uint(_2819));
    int _2843 = _2833 * _2793;
    int _2845 = _2843 + _2809;
    bool _2847 = !_1439;
    int _2849 = _2847 ? _2649 : (-1);
    int _2851 = _2837 * _2789;
    int _2853 = _2851 + _2829;
    int _2855 = abs(_2707);
    float _2857 = exp2(_2751);
    int _2859 = as_type<int>(_2779) + (-2);
    int _2861 = _2849 * _2795;
    int _2863 = _2861 + _2839;
    int _2865 = as_type<int>(_2791) + (-2);
    float _2867 = in.m_43.x;
    float _2869 = in.m_43.y;
    float _2871 = in.m_43.z;
    float _2873 = float(uint(_2845));
    float _2875 = 1.0 / _2841;
    float _2877 = float(uint(_2853));
    float _2879 = as_type<float>(_2865) * _2873;
    int _2881 = as_type<int>(_2805) + (-2);
    int _2883 = abs(_2853);
    float _2885 = as_type<float>(_2859) * _2877;
    float _2887 = float(uint(_2855));
    float _2889 = trunc(_2879);
    float _2891 = precise::max(_2889, 0.0);
    uint _2893 = uint(_2891);
    float _2895 = float(uint(_2863));
    int _2897 = as_type<int>(_2821) + (-2);
    float _2899 = float(uint(_2883));
    float _2901 = as_type<float>(_2881) * _2895;
    float _2903 = _2877;
    float _2905 = _2791;
    float _2907 = as_type<float>(_2855);
    if (_2243)
    {
        _2903 = _738;
    }
    float _2909 = _2903;
    float _2911 = 1.0 / _2887;
    float _2913 = _2909;
    if (!_2243)
    {
        _2913 = _736;
    }
    float _2915 = _2913;
    float _2917 = as_type<float>(_2897) * _2899;
    if (_2379)
    {
        _2905 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2919 = _2905;
    float _2921 = fma(_2269, _2661, _2269);
    int _2923 = abs(_2845);
    float _2925 = _2915 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2927 = as_type<int>(_2875) + (-2);
    float _2929 = trunc(_2885);
    float _2931 = precise::max(_2929, 0.0);
    uint _2933 = uint(_2931);
    int _2935 = as_type<int>(_2919);
    if (_2379)
    {
        float _2937 = _2919 * 5.0;
        _2935 = as_type<int>(_2937);
    }
    int _2939 = _2935;
    float _2941 = float(uint(_2923));
    float _2943 = fma(_2661, _2867, _2867);
    if (_2379)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8274 = as_type<float>(_2939);
        out.gl_Position.z = _8274;
    }
    float _2945 = as_type<float>(_2927) * _2941;
    float _2947 = trunc(_2901);
    float _2949 = precise::max(_2947, 0.0);
    uint _2951 = uint(_2949);
    int _2953 = ~_2657;
    int _2955 = _2953 + 1;
    int _2957 = as_type<int>(_2911) + (-2);
    int _2959 = _2955 * int(_2893);
    int _2961 = _2959 + _2845;
    bool _2963 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2965 = isnan(1.0);
    bool _2967 = _2963 || _2965;
    bool _2969 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2971 = _2967 || _2969;
    float _2973 = trunc(_2917);
    float _2975 = precise::max(_2973, 0.0);
    uint _2977 = uint(_2975);
    int _2979 = ~_2707;
    int _2981 = _2979 + 1;
    float _2983 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2985 = 1.0 + _2983;
    int _2987 = ~_2501;
    int _2989 = _2987 + 1;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2993 = abs(_2863);
    float _2995 = float(uint(_2961));
    int _2997 = _2989 * int(_2933);
    int _2999 = _2997 + _2853;
    int _3001 = ~_2787;
    int _3003 = _3001 + 1;
    float _3005 = trunc(_2945);
    float _3007 = precise::max(_3005, 0.0);
    uint _3009 = uint(_3007);
    float _3011 = float(uint(_2993));
    int _3013 = _2981 * int(_2951);
    int _3015 = _3013 + _2863;
    float _3017 = fma(_2925, -2.0, _2991);
    int _3019 = ~_2819;
    int _3021 = _3019 + 1;
    int _3023 = _3003 * int(_2977);
    int _3025 = _3023 + _2883;
    float _3027 = as_type<float>(_2957) * _3011;
    float _3029 = float(uint(_2999));
    float _3031 = 1.0 / _2985;
    float _3033 = float(uint(_3015));
    float _3035 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3017);
    float _3037 = float(uint(_3025));
    float _3039 = as_type<float>(_2859) * _3029;
    float _3041 = as_type<float>(_2865) * _2995;
    int _3043 = _3021 * int(_3009);
    int _3045 = _3043 + _2923;
    float _3047 = as_type<float>(_2897) * _3037;
    float _3049 = trunc(_3027);
    float _3051 = precise::max(_3049, 0.0);
    uint _3053 = uint(_3051);
    float _3055 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3057 = as_type<float>(_2881) * _3033;
    float _3059 = float(uint(_3045));
    float _3061 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3063 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3055);
    int _3065 = ~_2855;
    int _3067 = _3065 + 1;
    float _3069 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3061);
    float _3071 = trunc(_3039);
    float _3073 = precise::max(_3071, 0.0);
    uint _3075 = uint(_3073);
    float _3077 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3063);
    float _3079 = as_type<float>(_2927) * _3059;
    float _3081 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3069);
    float _3083 = -_2857;
    float _3085 = _3083 + 1.0;
    bool _3087 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3089 = isnan(0.0);
    bool _3091 = _3087 || _3089;
    bool _3093 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3095 = _3091 || _3093;
    float _3097 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3099 = trunc(_3041);
    float _3101 = precise::max(_3099, 0.0);
    uint _3103 = uint(_3101);
    float _3105 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _3107 = _3067 * int(_3053);
    int _3109 = _3107 + _2993;
    float _3111 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3097);
    float _3113 = _3095 ? _3085 : 0.0;
    float _3115 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3105);
    float _3117 = float(_2541);
    float _3119 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3111);
    float _3121 = trunc(_3079);
    float _3123 = precise::max(_3121, 0.0);
    uint _3125 = uint(_3123);
    float _3127 = float(uint(_3109));
    float _3129 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3115);
    if (_2971)
    {
        float _3131 = _3113 * _3031;
        _116 = _3131;
    }
    float _3133 = _116;
    int _3135 = ~_2501;
    int _3137 = _3135 + 1;
    float _3139 = fma(_2613, _2869, _2869);
    float _3141 = as_type<float>(_2957) * _3127;
    int _3143 = int(_2933) + int(_3075);
    float _3145 = trunc(_3057);
    float _3147 = precise::max(_3145, 0.0);
    uint _3149 = uint(_3147);
    float _3151 = _736 + (-0.5);
    float _3153 = fma(_2325, _2613, _2325);
    int _3155 = int(_2893) + int(_3103);
    float _3157 = fma(_3151, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2943);
    int _3159 = ~_2657;
    int _3161 = _3159 + 1;
    int _3163 = _3137 * _3143;
    int _3165 = _3163 + _2853;
    float _3167 = trunc(_3047);
    float _3169 = precise::max(_3167, 0.0);
    uint _3171 = uint(_3169);
    int _3173 = int(_3009) + int(_3125);
    float _3175 = fma(_2921, _3133, _3157);
    int _3177 = ~_2819;
    int _3179 = _3177 + 1;
    int _3181 = _3161 * _3155;
    int _3183 = _3181 + _2845;
    int _3185 = ~_2707;
    int _3187 = _3185 + 1;
    float _3189 = _738 + (-0.5);
    int _3191 = ~_2787;
    int _3193 = _3191 + 1;
    float _3195 = trunc(_3141);
    float _3197 = precise::max(_3195, 0.0);
    uint _3199 = uint(_3197);
    int _3201 = int(_2951) + int(_3149);
    int _3203 = _3179 * _3173;
    int _3205 = _3203 + _2923;
    bool _3207 = uint(_3183) >= uint(_2657);
    float _3209 = _3175 * 0.15915493667125701904296875;
    bool _3211 = uint(_3165) >= uint(_2501);
    int _3213 = _3187 * _3201;
    int _3215 = _3213 + _2863;
    bool _3217 = uint(_3205) >= uint(_2819);
    float _3219 = _3117 * _2545;
    int _3221 = int(_2977) + int(_3171);
    float _3223 = fma(_3189, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3139);
    bool _3225 = !_3207;
    int _3227 = _3225 ? 0 : (-1);
    int _3229 = ~_2855;
    int _3231 = _3229 + 1;
    int _3233 = _3193 * _3221;
    int _3235 = _3233 + _2883;
    bool _3237 = uint(_3215) >= uint(_2707);
    float _3239 = fma(_3153, _3133, _3223);
    int _3241 = int(_3053) + int(_3199);
    bool _3243 = uint(_3235) >= uint(_2787);
    int _3245 = ~_3155;
    int _3247 = _3245 + _3227;
    int _3249 = _3247 + 1;
    int _3251 = _3231 * _3241;
    int _3253 = _3251 + _2993;
    bool _3255 = !_3211;
    int _3257 = _3255 ? 0 : (-1);
    float _3259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3261 = !_3237;
    int _3263 = _3261 ? 0 : (-1);
    int _3265 = _2657 * _3249;
    int _3267 = _3265 + _2845;
    int _3269 = ~_3143;
    int _3271 = _3269 + _3257;
    int _3273 = _3271 + 1;
    int _3275 = ~_3201;
    int _3277 = _3275 + _3263;
    int _3279 = _3277 + 1;
    int _3281 = _2845 ^ _2657;
    float _3283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3285 = !_3217;
    int _3287 = _3285 ? 0 : (-1);
    int _3289 = _2707 * _3279;
    int _3291 = _3289 + _2863;
    bool _3293 = uint(_3253) >= uint(_2855);
    int _3295 = _2853 ^ _2501;
    int _3297 = _2501 * _3273;
    int _3299 = _3297 + _2853;
    bool _3301 = !_3243;
    int _3303 = _3301 ? 0 : (-1);
    float _3305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3307 = _2501 == 0;
    float _3309 = _3259 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3311 = !_3293;
    int _3313 = _3311 ? 0 : (-1);
    int _3315 = ~_3287;
    int _3317 = _3173 + _3315;
    int _3319 = _3317 + 1;
    float _3321 = fma(_3309, _1033, -0.5);
    bool _3323 = _2657 == 0;
    float _3325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _3327 = uint(int(uint(_3295) >> uint(31)));
    float _3329 = _3283 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3331 = _2501 == 0;
    bool _3333 = _2707 == 0;
    float _3335 = fma(_947, _3329, -0.5);
    bool _3337 = _2707 == 0;
    int _3339 = _2863 ^ _2707;
    float _3341 = _3305 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3343 = ~_3303;
    int _3345 = _3221 + _3343;
    int _3347 = _3345 + 1;
    float _3349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3351 = ~_3313;
    int _3353 = _3241 + _3351;
    int _3355 = _3353 + 1;
    float _3357 = fma(_3341, _1055, -0.5);
    bool _3359 = !_3307;
    int _3361 = _3359 ? _3299 : (-1);
    bool _3363 = !_3323;
    int _3365 = _3363 ? _3267 : (-1);
    int _3367 = ~int(_3327);
    int _3369 = _3367 + 1;
    float _3371 = float(_3361);
    int _3373 = _3347 ^ _3369;
    float _3375 = float(_3365);
    float _3377 = fma(_3309, _3371, _2391);
    uint _3379 = uint(int(uint(_3281) >> uint(31)));
    float _3381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3383 = uint(int(uint(_3339) >> uint(31)));
    float _3385 = _3325 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3387 = !_3333;
    int _3389 = _3387 ? _3291 : (-1);
    float _3391 = fma(_3341, _3375, _2581);
    int _3393 = ~_3369;
    int _3395 = _3393 + _3373;
    int _3397 = _3395 + 1;
    float _3399 = fma(_3385, _1671, -0.5);
    int _3401 = ~int(_3379);
    int _3403 = _3401 + 1;
    float _3405 = fma(_2539, _3357, _3391);
    int _3407 = ~int(_3383);
    int _3409 = _3407 + 1;
    float _3411 = _2299 * _2299;
    float _3413 = float(_3389);
    float _3415 = fma(_3081, _3321, _3377);
    bool _3417 = !_3331;
    int _3419 = _3417 ? _3397 : (-1);
    int _3421 = _3319 ^ _3403;
    float _3423 = fma(_3385, _3413, _2405);
    int _3425 = _3355 ^ _3409;
    float _3427 = _3349 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3429 = float(_3419);
    float _3431 = fma(_3119, _3399, _3423);
    bool _3433 = _2657 == 0;
    int _3435 = ~_3403;
    int _3437 = _3435 + _3421;
    int _3439 = _3437 + 1;
    float _3441 = -_2395;
    float _3443 = fma(_3329, _3429, _3441);
    int _3445 = ~_3409;
    int _3447 = _3445 + _3425;
    int _3449 = _3447 + 1;
    float _3451 = _3381 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3453 = !_3433;
    int _3455 = _3453 ? _3439 : (-1);
    float _3457 = fma(_3077, _3335, _3443);
    bool _3459 = !_3337;
    int _3461 = _3459 ? _3449 : (-1);
    float _3463 = fma(_995, _3451, -0.5);
    float _3465 = float(_3455);
    float _3467 = _3431 + 0.5;
    float _3469 = float(_3461);
    float _3471 = fma(_2341, _2341, _3411);
    float _3473 = _3457 + 0.5;
    float _3475 = -_2591;
    float _3477 = fma(_3451, _3465, _3475);
    float _3479 = fma(_3427, _1019, -0.5);
    float _3481 = fma(_2349, _2349, _3471);
    float _3483 = -_3035;
    float _3485 = fma(_3427, _3469, _3483);
    float _3487 = fma(_2543, _3463, _3477);
    float _3489 = _3415 + 0.5;
    float _3491 = rsqrt(_3481);
    float _3493 = fma(_3129, _3479, _3485);
    float _3495 = _3487 + 0.5;
    float _3497 = _3405 + 0.5;
    float _3499 = _3219 * (-2.0);
    float _3501 = _3493 + 0.5;
    float _3503 = _3209 * 6.283185482025146484375;
    float _3505 = sin(_3503);
    out.m_45.x = _3489;
    out.m_45.y = _3473;
    out.m_45.z = _3497;
    out.m_45.w = _3495;
    float _3507 = fma(_2303, _3499, _2303);
    float _3509 = fma(_3499, _2871, _2871);
    out.m_47.x = _3467;
    out.m_47.y = _3501;
    float _3511 = _3209 * 6.283185482025146484375;
    float _3513 = cos(_3511);
    float _3515 = _2299 * _3491;
    float _3517 = _2341 * _3491;
    if (_2379)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3519 = -_3515;
    float _3521 = fma(_3519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2199);
    float _3523 = -_3517;
    float _3525 = fma(_3523, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2205);
    float _3527 = _2349 * _3491;
    float _3529 = _3239 * 0.15915493667125701904296875;
    float _3531 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3533 = _3521 + _3531;
    float _3535 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3537 = _3525 + _3535;
    float _3539 = -_3515;
    float _3541 = fma(_3539, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2299);
    float _3543 = fma(_2411, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3509);
    float _3545 = _3533 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3547 = -_3527;
    float _3549 = fma(_3547, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2323);
    float _3551 = -_3517;
    float _3553 = fma(_3551, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2341);
    float _3555 = fma(_3507, _3133, _3543);
    float _3557 = fma(_3537, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3545);
    float _3559 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3561 = _3549 + _3559;
    float _3563 = _3541 * _3541;
    float _3565 = _3529 * 6.283185482025146484375;
    float _3567 = sin(_3565);
    float _3569 = _3555 * 0.15915493667125701904296875;
    float _3571 = fma(_3561, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3557);
    float _3573 = fma(_3553, _3553, _3563);
    float _3575 = -_3527;
    float _3577 = fma(_3575, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2349);
    bool _3579 = _3571 >= 0.0;
    float _3581 = _3529 * 6.283185482025146484375;
    float _3583 = cos(_3581);
    float _3585 = fma(_3577, _3577, _3573);
    float _3587 = _3569 * 6.283185482025146484375;
    float _3589 = sin(_3587);
    float _3591 = _3505 * _3567;
    float _3593 = _3555;
    if (_3579)
    {
        _3593 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3595 = _3593;
    int _3597 = as_type<int>(_3595);
    if (_3579)
    {
        out.m_29.x = 0.0;
    }
    float _3599 = sqrt(_3585);
    if (_3579)
    {
        float _3601 = _3595 * 5.0;
        _3597 = as_type<int>(_3601);
    }
    int _3603 = _3597;
    float _3605 = _3513 * _3583;
    if (_3579)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9273 = as_type<float>(_3603);
        out.gl_Position.z = _9273;
    }
    float _3607 = fma(_3589, _3605, _3591);
    float _3609 = fma(_3589, _3591, _3605);
    float _3611 = _3491 * _3599;
    if (_3579)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3613 = -_2199;
    float _3615 = _3613 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3617 = -_2205;
    float _3619 = _3617 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3621 = -_2323;
    float _3623 = _3621 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3625 = _3569 * 6.283185482025146484375;
    float _3627 = cos(_3625);
    float _3629 = _3615 * _3615;
    float _3631 = in.m_49.x;
    float _3633 = in.m_49.y;
    float _3635 = in.m_49.z;
    float _3637 = _672 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3639 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3641 = fma(_3619, _3619, _3629);
    float _3643 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3645 = _3611 * _3637;
    float _3647 = _3611 * _3639;
    float _3649 = fma(_3623, _3623, _3641);
    float _3651 = _3611 * _3643;
    float _3653 = _3513 * _3567;
    float _3655 = _3505 * _3583;
    float _3657 = rsqrt(_3649);
    float _3659 = -_3653;
    float _3661 = fma(_3589, _3655, _3659);
    float _3663 = _3505 * _3627;
    float _3665 = -_3655;
    float _3667 = fma(_3589, _3653, _3665);
    float _3669 = _3513 * _3627;
    float _3671 = in.m_51.x;
    float _3673 = in.m_51.y;
    float _3675 = in.m_51.z;
    float _3677 = _3583 * _3627;
    float _3679 = _3567 * _3627;
    bool _3681 = _3633 != 0.0;
    bool _3683 = isnan(_3633);
    bool _3685 = _3681 || _3683;
    bool _3687 = isnan(0.0);
    bool _3689 = _3685 || _3687;
    float _3691 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3631);
    float _3693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3633);
    float _3695 = _3619 * _3657;
    float _3697 = _3623 * _3657;
    float _3699 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3635);
    float _3701 = _3615 * _3657;
    float _3703 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3705 = _3695 * _3703;
    float _3707 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3709 = _3697 * _3707;
    bool _3711 = _3631 == 0.0;
    bool _3713 = !_3689;
    bool _3715 = _3711 && _3713;
    float _3717 = _3647 * _3693;
    float _3719 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3721 = -_3705;
    float _3723 = fma(_3697, _3719, _3721);
    float _3725 = _3651 * _3691;
    float _3727 = _3645 * _3699;
    float _3729 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3731 = -_3709;
    float _3733 = fma(_3701, _3729, _3731);
    float _3735 = in.m_53.x;
    float _3737 = in.m_53.y;
    float _3739 = in.m_53.z;
    float _3741 = in.m_53.w;
    bool _3743 = _3635 == 0.0;
    bool _3745 = _3743 && _3715;
    float _3747 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3749 = _3701 * _3747;
    float _3751 = _3723 * _3723;
    float _3753 = -_3717;
    float _3755 = _3589 * _3753;
    float _3757 = _3669 * _3717;
    float _3759 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3761 = -_3749;
    float _3763 = fma(_3695, _3759, _3761);
    float _3765 = fma(_3733, _3733, _3751);
    float _3767 = _3663 * _3717;
    float _3769 = fma(_3677, _3725, _3755);
    float _3771 = fma(_3607, _3725, _3757);
    float _3773 = fma(_3763, _3763, _3765);
    float _3775 = fma(_3661, _3725, _3767);
    float _3777 = _3651;
    float _3779 = _3767;
    float _3781 = _3725;
    float _3783 = _3765;
    float _3785 = _3671;
    if (_3745)
    {
        _3777 = _3671;
    }
    float _3787 = _3777;
    float _3789 = rsqrt(_3773);
    float _3791 = _3787;
    if (_3745)
    {
        _2907 = _3673;
    }
    float _3793 = _2907;
    float _3795 = fma(_3667, _3727, _3771);
    float _3797 = _3793;
    if (_3745)
    {
        _3779 = _3675;
    }
    float _3799 = _3779;
    float _3801 = _3799;
    if (_3745)
    {
        _3781 = _3787;
    }
    float _3803 = _3781;
    float _3805 = _3803;
    if (!_3745)
    {
        _3791 = _3671;
    }
    float _3807 = _3791;
    if (_3745)
    {
        _3783 = _3793;
    }
    float _3809 = _3783;
    float _3811 = _3809;
    if (!_3745)
    {
        _3797 = _3673;
    }
    float _3813 = _3797;
    float _3815 = _3739 * _3807;
    if (_3745)
    {
        _3785 = _3799;
    }
    float _3817 = _3785;
    float _3819 = fma(_3679, _3727, _3769);
    float _3821 = _3817;
    if (!_3745)
    {
        _3801 = _3675;
    }
    float _3823 = _3801;
    if (!_3745)
    {
        float _3825 = fma(_3633, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3813);
        _3811 = _3825;
    }
    float _3827 = _3811;
    float _3829 = fma(_3609, _3727, _3775);
    float _3831 = _3723 * _3789;
    float _3833 = _3763 * _3789;
    float _3835 = _3737 * _3823;
    float _3837 = -_3815;
    float _3839 = fma(_3735, _3823, _3837);
    if (!_3745)
    {
        float _3841 = fma(_3635, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3823);
        _3821 = _3841;
    }
    float _3843 = _3821;
    float _3845 = _3733 * _3789;
    float _3847 = -_3835;
    float _3849 = fma(_3739, _3813, _3847);
    float _3851 = _3839 * _3741;
    if (!_3745)
    {
        float _3853 = fma(_3631, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3807);
        _3805 = _3853;
    }
    float _3855 = _3805;
    float _3857 = _3697 * _3831;
    float _3859 = _3735 * _3813;
    float _3861 = _3695 * _3833;
    float _3863 = _3701 * _3845;
    float _3865 = -_3857;
    float _3867 = fma(_3701, _3833, _3865);
    float _3869 = -_3859;
    float _3871 = fma(_3737, _3807, _3869);
    float _3873 = -_3861;
    float _3875 = fma(_3697, _3845, _3873);
    float _3877 = _3849 * _3741;
    float _3879 = -_3863;
    float _3881 = fma(_3695, _3831, _3879);
    float _3883 = _3607 * _3867;
    float _3885 = _3871 * _3741;
    float _3887 = _3607 * _3875;
    float _3889 = _3669 * _3867;
    float _3891 = _3667 * _3867;
    float _3893 = _3607 * _3881;
    float _3895 = _3669 * _3875;
    float _3897 = _3667 * _3875;
    float _3899 = _3867 * _3795;
    float _3901 = _3669 * _3881;
    float _3903 = _3667 * _3881;
    float _3905 = _3875 * _3795;
    float _3907 = fma(_3677, _3845, _3883);
    float _3909 = _3881 * _3795;
    float _3911 = fma(_3677, _3831, _3887);
    float _3913 = -_3589;
    float _3915 = fma(_3913, _3845, _3889);
    float _3917 = fma(_3679, _3845, _3891);
    float _3919 = -_3589;
    float _3921 = fma(_3919, _3831, _3895);
    float _3923 = fma(_3679, _3831, _3897);
    float _3925 = fma(_3845, _3819, _3899);
    float _3927 = fma(_3677, _3833, _3893);
    float _3929 = -_3589;
    float _3931 = fma(_3929, _3833, _3901);
    float _3933 = fma(_3679, _3833, _3903);
    float _3935 = fma(_3831, _3819, _3905);
    float _3937 = fma(_3833, _3819, _3909);
    float _3939 = fma(_3661, _3701, _3911);
    float _3941 = fma(_3661, _3695, _3907);
    float _3943 = fma(_3663, _3695, _3915);
    float _3945 = fma(_3609, _3695, _3917);
    float _3947 = fma(_3695, _3829, _3925);
    float _3949 = fma(_3701, _3829, _3935);
    float _3951 = fma(_3661, _3697, _3927);
    float _3953 = fma(_3663, _3701, _3921);
    float _3955 = _2205 + _3947;
    float _3957 = _2199 + _3949;
    float _3959 = fma(_3609, _3701, _3923);
    float _3961 = fma(_3697, _3829, _3937);
    float _3963 = fma(_3663, _3697, _3931);
    float _3965 = -_3515;
    float _3967 = fma(_3965, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3957);
    float _3969 = -_3517;
    float _3971 = fma(_3969, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3955);
    float _3973 = _2323 + _3961;
    float _3975 = _3943 * _3737;
    float _3977 = _3953 * _3737;
    float _3979 = _3963 * _3737;
    float _3981 = _3967 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3983 = _3943 * _3827;
    float _3985 = _3953 * _3827;
    float _3987 = _3963 * _3827;
    float _3989 = _3851 * _3943;
    float _3991 = _3851 * _3953;
    float _3993 = _3851 * _3963;
    float _3995 = -_3527;
    float _3997 = fma(_3995, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3973);
    float _3999 = _3967 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4001 = fma(_3971, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3981);
    float _4003 = _3967 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4005 = fma(_3941, _3735, _3975);
    float _4007 = fma(_3971, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3999);
    float _4009 = fma(_3997, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4001);
    float _4011 = fma(_3939, _3735, _3977);
    float _4013 = fma(_3609, _3697, _3933);
    float _4015 = fma(_3951, _3735, _3979);
    float _4017 = _3967 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4019 = fma(_3971, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4003);
    float _4021 = fma(_3997, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4007);
    float _4023 = _4009 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4025 = fma(_3941, _3855, _3983);
    float _4027 = fma(_3945, _3739, _4005);
    float _4029 = fma(_3959, _3739, _4011);
    float _4031 = fma(_3877, _3941, _3989);
    float _4033 = fma(_3877, _3939, _3991);
    float _4035 = fma(_3877, _3951, _3993);
    float _4037 = fma(_4013, _3739, _4015);
    float _4039 = fma(_3971, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4017);
    float _4041 = fma(_3997, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4019);
    float _4043 = _4021 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4045 = _4023 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4047 = _4023 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4049 = _4023 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4051 = _4023 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4053 = fma(_3939, _3855, _3985);
    float _4055 = fma(_3951, _3855, _3987);
    float _4057 = fma(_3997, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4039);
    float _4059 = _4041 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4061 = fma(_4043, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4045);
    float _4063 = fma(_4043, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4047);
    float _4065 = fma(_4043, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4049);
    float _4067 = fma(_4043, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4051);
    float _4069 = fma(_4059, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4061);
    float _4071 = _4057 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4073 = fma(_4059, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4063);
    float _4075 = fma(_4059, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4065);
    float _4077 = fma(_4059, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4067);
    float _4079 = fma(_3945, _3843, _4025);
    float _4081 = fma(_3959, _3843, _4053);
    float _4083 = fma(_4071, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4069);
    float _4085 = fma(_3885, _3945, _4031);
    float _4087 = fma(_4013, _3843, _4055);
    float _4089 = fma(_3885, _3959, _4033);
    float _4091 = fma(_3885, _4013, _4035);
    float _4093 = fma(_4071, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4073);
    float _4095 = fma(_4071, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4075);
    float _4097 = fma(_4071, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4077);
    out.m_55.x = _4027;
    out.m_55.y = _4029;
    out.m_55.z = _4037;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_57.x = _4079;
    out.m_57.y = _4081;
    out.m_57.z = _4087;
    out.m_59.x = _4085;
    out.m_59.y = _4089;
    out.m_59.z = _4091;
    out.gl_Position.x = _4093;
    out.gl_Position.y = _4083;
    out.gl_Position.z = _4095;
    out.gl_Position.w = _4097;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

