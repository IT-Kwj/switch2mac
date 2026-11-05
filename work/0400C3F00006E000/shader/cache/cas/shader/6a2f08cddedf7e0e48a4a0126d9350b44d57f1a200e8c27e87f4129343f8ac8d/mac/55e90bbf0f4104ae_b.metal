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
    float4 m_49 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_45 [[attribute(1)]];
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_43 [[attribute(4)]];
    float4 m_41 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_33 [[attribute(7)]];
    float4 m_47 [[attribute(8)]];
    float4 m_39 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _4008 = as_type<float>(_94);
        out.gl_Position.z = _4008;
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
        out.m_29.x = 0.0;
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
        float _4078 = as_type<float>(_132);
        out.gl_Position.z = _4078;
    }
    if (_124)
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
    bool _312 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _314 = isnan(_284);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = 1.0 / _296;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = _284 + _326;
    bool _330 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _332 = 1.0 / _300;
    float _334 = _328 * _306;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _338 = _284 + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _342 = _284 + _340;
    float _344 = 1.0 / _310;
    float _346 = _288 * _324;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _350 = _284 + _348;
    bool _352 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _354 = isnan(_284);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = 1.0 / _304;
    float _366 = _338 * _332;
    bool _368 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _370 = isnan(_284);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    bool _380 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _382 = isnan(_284);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = -_378;
    float _394 = _392 + 1.0;
    float _396 = _350 * _344;
    float _398 = -_322;
    float _400 = _398 + 1.0;
    float _402 = _378 * _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _404;
    float _408 = _342 * _364;
    bool _410 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _412 = isnan(_284);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _426;
    float _430 = fma(_406, _334, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _432 = _420 * _394;
    float _434 = fma(_424, _334, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _436 = fma(_428, _334, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _438 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _440 = isnan(_284);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -_362;
    float _452 = _450 + 1.0;
    float _454 = -_420;
    float _456 = _454 + 1.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _462 = _448 * _452;
    float _464 = -_448;
    float _466 = _464 + 1.0;
    float _468 = _362 * _456;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _478 = _390 * _466;
    float _480 = -_390;
    float _482 = _480 + 1.0;
    float _484 = fma(_460, _346, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _486 = fma(_472, _346, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _488 = _430 * _478;
    float _490 = fma(_476, _346, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _492 = _434 * _478;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _494;
    float _498 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[143].x, _488);
    float _500 = _436 * _478;
    float _502 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[143].y, _492);
    float _504 = fma(_496, _366, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _506 = fma(_484, _462, _498);
    float _508 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[143].z, _500);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _514;
    float _518 = fma(_486, _462, _502);
    float _520 = fma(_504, _468, _506);
    float _522 = fma(_490, _462, _508);
    float _524 = fma(_512, _366, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _534 = fma(_516, _366, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _540 = fma(_528, _408, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _542 = fma(_532, _408, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _544 = fma(_524, _468, _518);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _550;
    float _554 = fma(_538, _408, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _556 = fma(_534, _468, _522);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _558;
    float _562 = fma(_540, _432, _520);
    float _564 = fma(_548, _396, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _566 = fma(_552, _396, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _568 = fma(_542, _432, _544);
    float _570 = fma(_560, _396, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _572 = fma(_554, _432, _556);
    float _574 = fma(_564, _402, _562);
    float _576 = fma(_566, _402, _568);
    float _578 = fma(_570, _402, _572);
    float _580 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[148].x, _574);
    float _582 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[148].y, _576);
    float _584 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[148].z, _578);
    bool _586 = !_330;
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
    float _658 = 1.0 / _636;
    float _660 = -_632;
    float _662 = _660 + 1.0;
    bool _664 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _666 = _648 * _662;
    float _668 = -_648;
    float _670 = _668 + 1.0;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _674 = _652 * _658;
    float _676 = _672 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _678 = fma(_674, _656, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _680 = _678 * _666;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _684 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[115].x, _680);
    float _686 = _580 * _616;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _690 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[116].x, _684);
    float _694 = _584 * _620;
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _582 * _618;
    float _700 = _692 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.x = _696;
    out.m_37.y = _690;
    out.m_37.z = _676;
    out.m_37.w = _700;
    bool _702 = !_664;
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
    float _738 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _740 = in.m_35.z;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _744 = _742 != 0;
    float _746 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _748 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _750 = int(_748);
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _754 = _752 != 0;
    float _756 = _694 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _760 = _758 != 0;
    float _762 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _764 = int(_762);
    float _766 = float(_734);
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _772 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _774 = isnan(_730);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _780 = _776 || _778;
    float _782 = float(_780);
    float _784 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _786 = int(_784);
    float _788 = float(_750);
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _792 = _740 > 0.5;
    float _794 = 1.0 / _766;
    float _796 = float(_764);
    float _798 = float(uint(_786));
    float _800 = 1.0 / _796;
    float _802 = in.m_35.y;
    int _804 = ~_786;
    int _806 = _804 + 1;
    float _808 = _794 * _112;
    float _810 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _812 = int(_810);
    float _814 = 1.0 / _788;
    float _816 = _800 * _112;
    float _818 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _820 = int(_818);
    float _822 = float(uint(_812));
    float _824 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[88].w, _790);
    int _826 = ~_812;
    int _828 = _826 + 1;
    float _830 = 1.0 / _798;
    float _832 = _814 * _112;
    float _834 = trunc(_808);
    int _836 = int(_834);
    float _838 = float(uint(_820));
    int _840 = ~_820;
    int _842 = _840 + 1;
    int _844 = ~_820;
    int _846 = _844 + 1;
    int _848 = ~_820;
    int _850 = _848 + 1;
    float _852 = 1.0 / _822;
    int _854 = as_type<int>(_830) + (-2);
    float _856 = float(uint(_836));
    float _858 = trunc(_816);
    int _860 = int(_858);
    float _862 = as_type<float>(_854) * _856;
    float _864 = _856;
    float _866 = _838;
    bool _868 = _744;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_744)
    {
        _864 = _736;
    }
    float _872 = _864;
    int _874 = as_type<int>(_852) + (-2);
    float _876 = 1.0 / _838;
    float _878 = _872;
    if (!_744)
    {
        _878 = _802;
    }
    float _880 = _878;
    float _882 = trunc(_832);
    int _884 = int(_882);
    float _886 = _880;
    if (_744)
    {
        _866 = 1.0;
    }
    float _888 = _866;
    float _890 = _888;
    if (!_744)
    {
        _890 = 7.345489978790283203125;
    }
    float _892 = _890;
    float _894 = float(uint(_860));
    float _896 = trunc(_862);
    float _898 = precise::max(_896, 0.0);
    uint _901 = uint(_898);
    float _903 = _892 * _736;
    int _905 = as_type<int>(_876) + (-2);
    float _907 = as_type<float>(_874) * _894;
    float _909 = _892;
    if (_744)
    {
        _909 = 1.0;
    }
    float _911 = _909;
    float _913 = _911;
    if (!_744)
    {
        _913 = 1.2345600128173828125;
    }
    float _915 = _913;
    float _917 = float(uint(_884));
    float _919 = trunc(_907);
    float _921 = precise::max(_919, 0.0);
    uint _923 = uint(_921);
    int _925 = ~_786;
    int _927 = _925 + 1;
    float _929 = _915 * _880;
    float _931 = _915;
    if (_744)
    {
        _931 = 1.0;
    }
    float _933 = _931;
    float _935 = as_type<float>(_905) * _917;
    float _937 = _933;
    if (_744)
    {
        _886 = _736;
    }
    float _939 = _886;
    int _941 = _927 * int(_901);
    int _943 = _941 + _836;
    float _945 = _939;
    if (!_744)
    {
        _937 = 5.839270114898681640625;
    }
    float _947 = _937;
    float _949 = trunc(_935);
    float _951 = precise::max(_949, 0.0);
    uint _953 = uint(_951);
    if (!_744)
    {
        _945 = _740;
    }
    float _955 = _945;
    float _957 = float(uint(_943));
    float _959 = _957;
    if (_754)
    {
        bool _961 = _736 > 0.5;
        _868 = _961;
    }
    bool _963 = _868;
    float _965 = _947 * _955;
    float _967 = as_type<float>(_854) * _957;
    float _969 = in.m_39.x;
    float _971 = floor(_903);
    int _973 = _828 * int(_923);
    int _975 = _973 + _860;
    int _977 = _842 * int(_953);
    int _979 = _977 + _884;
    float _981 = float(uint(_975));
    float _983 = trunc(_967);
    float _985 = precise::max(_983, 0.0);
    uint _987 = uint(_985);
    float _989 = float(uint(_979));
    float _991 = as_type<float>(_874) * _981;
    float _993 = floor(_929);
    float _995 = as_type<float>(_905) * _989;
    float _997 = -_971;
    float _999 = _903 + _997;
    int _1001 = ~_786;
    int _1003 = _1001 + 1;
    int _1005 = _979;
    float _1007 = _967;
    float _1009 = _969;
    if (_754)
    {
        float _1011 = -_969;
        float _1013 = _1011 + 1.0;
        _1005 = as_type<int>(_1013);
    }
    int _1015 = _1005;
    int _1017 = int(_901) + int(_987);
    float _1019 = floor(_965);
    float _1021 = float(_78);
    int _1023 = _1015;
    if (!_754)
    {
        _959 = _969;
    }
    float _1025 = _959;
    float _1027 = _1025;
    if (_754)
    {
        float _1029 = _963 ? as_type<float>(_1015) : _969;
        _1027 = _1029;
    }
    float _1031 = _1027;
    if (_760)
    {
        float _1033 = -_969;
        float _1035 = _1033 + 1.0;
        _1023 = as_type<int>(_1035);
    }
    int _1037 = _1023;
    float _1039 = -_993;
    float _1041 = _929 + _1039;
    float _1043 = trunc(_991);
    float _1045 = precise::max(_1043, 0.0);
    uint _1047 = uint(_1045);
    if (!_760)
    {
        _1007 = _969;
    }
    float _1049 = _1007;
    float _1051 = _1049;
    if (_760)
    {
        float _1053 = _792 ? as_type<float>(_1037) : _969;
        _1051 = _1053;
    }
    float _1055 = _1051;
    int _1057 = _1003 * _1017;
    int _1059 = _1057 + _836;
    float _1061 = float(_786);
    float _1063 = trunc(_995);
    float _1065 = precise::max(_1063, 0.0);
    uint _1067 = uint(_1065);
    float _1069 = float(_836);
    bool _1071 = uint(_1059) >= uint(_786);
    float _1073 = _999 * _1061;
    bool _1075 = _1069 >= _1061;
    bool _1077 = isnan(_1069);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan(_1061);
    bool _1083 = _1079 || _1081;
    float _1085 = float(_1083);
    float _1087 = _1061 * _112;
    float _1089 = float(_820);
    float _1091 = 1.0 / _1021;
    float _1093 = -_1019;
    float _1095 = _965 + _1093;
    int _1097 = ~_812;
    int _1099 = _1097 + 1;
    int _1101 = int(_923) + int(_1047);
    float _1103 = float(_884);
    int _1105 = int(_953) + int(_1067);
    float _1107 = _1089 * _1041;
    float _1109 = float(_812);
    float _1111 = trunc(_1073);
    int _1113 = int(_1111);
    float _1115 = float(_860);
    int _1117 = _846 * _1105;
    int _1119 = _1117 + _884;
    int _1121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1123 = _1121 != 0;
    float _1125 = _1091 * _112;
    float _1127 = _1087 * _1091;
    float _1129 = trunc(_1085);
    int _1131 = int(_1129);
    bool _1133 = _1103 >= _1089;
    bool _1135 = isnan(_1103);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan(_1089);
    bool _1141 = _1137 || _1139;
    float _1143 = float(_1141);
    float _1145 = _1089 * _1125;
    float _1147 = _1109 * _1125;
    bool _1149 = _1115 >= _1109;
    bool _1151 = isnan(_1115);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(_1109);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = _1109 * _1095;
    bool _1163 = !_1071;
    int _1165 = _1163 ? 0 : (-1);
    int _1167 = _1099 * _1101;
    int _1169 = _1167 + _860;
    bool _1171 = uint(_1119) >= uint(_820);
    float _1173 = trunc(_1107);
    int _1175 = int(_1173);
    bool _1177 = !_1123;
    int _1179 = _1177 ? 0 : 1;
    int _1181 = ~_1017;
    int _1183 = _1181 + _1165;
    int _1185 = _1183 + 1;
    bool _1187 = !_1171;
    int _1189 = _1187 ? 0 : (-1);
    int _1191 = abs(_1179);
    float _1193 = trunc(_1143);
    int _1195 = int(_1193);
    bool _1197 = uint(_1169) >= uint(_812);
    int _1199 = _1113 * _1191;
    int _1201 = _1199 + _836;
    int _1203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1205 = _1203 != 0;
    int _1207 = _786 * _1185;
    int _1209 = _1207 + _836;
    int _1211 = ~_1105;
    int _1213 = _1211 + _1189;
    int _1215 = _1213 + 1;
    float _1217 = trunc(_1159);
    int _1219 = int(_1217);
    int _1221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1223 = _1221 != 0;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1227 = _1225 != 0;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1231 = _1229 != 0;
    bool _1233 = !_1205;
    int _1235 = _1233 ? 0 : 1;
    int _1237 = _820 * _1215;
    int _1239 = _1237 + _884;
    bool _1241 = _786 == 0;
    bool _1243 = _820 == 0;
    float _1245 = trunc(_1127);
    int _1247 = int(_1245);
    int _1249 = abs(_1235);
    bool _1251 = !_1197;
    int _1253 = _1251 ? 0 : (-1);
    int _1255 = ~_1131;
    int _1257 = _1255 + 1;
    int _1259 = _1257 + 1;
    int _1261 = _1175 * _1249;
    int _1263 = _1261 + _884;
    bool _1265 = !_1241;
    int _1267 = _1265 ? _1209 : (-1);
    float _1269 = trunc(_1145);
    int _1271 = int(_1269);
    int _1273 = ~_1195;
    int _1275 = _1273 + 1;
    int _1277 = _1275 + 1;
    bool _1279 = !_1243;
    int _1281 = _1279 ? _1239 : (-1);
    int _1283 = _1267 * _1259;
    int _1285 = ~_1101;
    int _1287 = _1285 + _1253;
    int _1289 = _1287 + 1;
    int _1291 = _786 + (-1);
    int _1293 = _1277 * _1281;
    bool _1295 = !_1227;
    int _1297 = _1295 ? 0 : 1;
    int _1299 = _812 * _1289;
    int _1301 = _1299 + _860;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1305 = _1303 != 0;
    int _1307 = _1131 * _1291;
    int _1309 = _1307 + _1283;
    bool _1311 = _812 == 0;
    bool _1313 = !_1223;
    int _1315 = _1313 ? 0 : 1;
    int _1317 = abs(_1297);
    bool _1319 = !_1305;
    int _1321 = _1319 ? 0 : 1;
    int _1323 = ~_1219;
    int _1325 = _1323 + 1;
    int _1327 = _1325 + 1;
    int _1329 = _1309 * _1317;
    bool _1331 = !_1311;
    int _1333 = _1331 ? _1301 : (-1);
    int _1335 = abs(_1315);
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1339 = _1337 != 0;
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1343 = _1341 != 0;
    int _1345 = _1327 * _1333;
    int _1347 = _820 + (-1);
    int _1349 = _1247 * _1335;
    int _1351 = _1349 + _1329;
    bool _1353 = !_1231;
    int _1355 = _1353 ? 0 : 1;
    bool _1357 = !_1343;
    int _1359 = _1357 ? 0 : 1;
    int _1361 = _1195 * _1347;
    int _1363 = _1361 + _1293;
    int _1365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1367 = _1365 != 0;
    float _1369 = trunc(_1161);
    int _1371 = int(_1369);
    int _1373 = abs(_1355);
    int _1375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1377 = _1375 != 0;
    int _1379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1381 = _1379 != 0;
    int _1383 = abs(_1359);
    int _1385 = _1201 * _1373;
    int _1387 = _1385 + _1351;
    bool _1389 = !_1367;
    int _1391 = _1389 ? 0 : 1;
    int _1393 = abs(_1321);
    int _1395 = _1363 * _1383;
    int _1397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1399 = _1397 != 0;
    int _1401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1403 = _1401 != 0;
    bool _1405 = !_1339;
    int _1407 = _1405 ? 0 : 1;
    int _1409 = _1113 * _1393;
    int _1411 = _1409 + _1387;
    int _1413 = abs(_1391);
    int _1415 = abs(_1407);
    bool _1417 = !_1403;
    int _1419 = _1417 ? 0 : 1;
    int _1421 = _1371 * _1413;
    int _1423 = _1421 + _860;
    int _1425 = _812 + (-1);
    int _1427 = _1271 * _1415;
    int _1429 = _1427 + _1395;
    int _1431 = abs(_1419);
    float _1433 = trunc(_1147);
    int _1435 = int(_1433);
    bool _1437 = !_1399;
    int _1439 = _1437 ? 0 : 1;
    int _1441 = _1219 * _1425;
    int _1443 = _1441 + _1345;
    float _1445 = float(uint(_1411));
    float _1447 = in.m_39.y;
    bool _1449 = !_1377;
    int _1451 = _1449 ? 0 : 1;
    int _1453 = _1443 * _1431;
    int _1455 = abs(_1439);
    float _1457 = as_type<float>(_854) * _1445;
    int _1459 = abs(_1451);
    bool _1461 = !_1381;
    int _1463 = _1461 ? 0 : 1;
    float _1465 = trunc(_1457);
    float _1467 = precise::max(_1465, 0.0);
    uint _1469 = uint(_1467);
    int _1471 = abs(_1463);
    int _1473 = _1263 * _1459;
    int _1475 = _1473 + _1429;
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1479 = _1477 != 0;
    int _1481 = ~_786;
    int _1483 = _1481 + 1;
    int _1485 = _1435 * _1455;
    int _1487 = _1485 + _1453;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1491 = _1489 != 0;
    float _1493 = in.m_35.w;
    int _1495 = _1175 * _1471;
    int _1497 = _1495 + _1475;
    bool _1499 = !_1479;
    int _1501 = _1499 ? 0 : 1;
    int _1503 = _1483 * int(_1469);
    int _1505 = _1503 + _1411;
    bool _1507 = !_1491;
    int _1509 = _1507 ? 0 : 1;
    float _1511 = float(uint(_1497));
    int _1513 = abs(_1501);
    float _1515 = -_1447;
    float _1517 = _1515 + 1.0;
    int _1519 = abs(_1509);
    float _1521 = as_type<float>(_905) * _1511;
    float _1523 = float(uint(_1505));
    bool _1525 = _802 > 0.5;
    float _1527 = trunc(_1521);
    float _1529 = precise::max(_1527, 0.0);
    uint _1531 = uint(_1529);
    int _1533 = _1423 * _1513;
    int _1535 = _1533 + _1487;
    float _1537 = as_type<float>(_854) * _1523;
    int _1539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1541 = _1539 != 0;
    int _1543 = _1525 ? as_type<int>(_1517) : as_type<int>(_1447);
    float _1545 = trunc(_1537);
    float _1547 = precise::max(_1545, 0.0);
    uint _1549 = uint(_1547);
    int _1551 = _1371 * _1519;
    int _1553 = _1551 + _1535;
    int _1555 = ~_786;
    int _1557 = _1555 + 1;
    float _1559 = _1541 ? as_type<float>(_1543) : _1447;
    bool _1561 = _1493 > 0.5;
    int _1563 = ~_820;
    int _1565 = _1563 + 1;
    int _1567 = _1561 ? as_type<int>(_1517) : as_type<int>(_1447);
    float _1569 = float(uint(_1553));
    int _1571 = _1565 * int(_1531);
    int _1573 = _1571 + _1497;
    int _1575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1577 = _1575 != 0;
    int _1579 = int(_1469) + int(_1549);
    float _1581 = as_type<float>(_874) * _1569;
    float _1583 = _1577 ? as_type<float>(_1567) : _1447;
    int _1585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1587 = _1585 != 0;
    float _1589 = trunc(_1581);
    float _1591 = precise::max(_1589, 0.0);
    uint _1593 = uint(_1591);
    float _1595 = float(uint(_1573));
    bool _1597 = _740 > 0.5;
    float _1599 = as_type<float>(_905) * _1595;
    int _1601 = ~_812;
    int _1603 = _1601 + 1;
    int _1605 = _1557 * _1579;
    int _1607 = _1605 + _1411;
    bool _1609 = _812 == 0;
    float _1611 = trunc(_1599);
    float _1613 = precise::max(_1611, 0.0);
    uint _1615 = uint(_1613);
    float _1617 = _1447;
    int _1619 = _1411;
    if (_1587)
    {
        float _1621 = _1597 ? _1517 : _1447;
        _1617 = _1621;
    }
    float _1623 = _1617;
    bool _1625 = uint(_1607) >= uint(_786);
    int _1627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1629 = _1627 != 0;
    int _1631 = _1603 * int(_1593);
    int _1633 = _1631 + _1553;
    bool _1635 = !_1625;
    int _1637 = _1635 ? 0 : (-1);
    int _1639 = ~_820;
    int _1641 = _1639 + 1;
    int _1643 = ~_1579;
    int _1645 = _1643 + _1637;
    int _1647 = _1645 + 1;
    float _1649 = float(uint(_1633));
    bool _1651 = _786 == 0;
    int _1653 = _786 * _1647;
    int _1655 = _1653 + _1411;
    int _1657 = int(_1531) + int(_1615);
    float _1659 = as_type<float>(_874) * _1649;
    float _1661 = as_type<float>(_1657);
    if (_1629)
    {
        float _1663 = -_969;
        float _1665 = _1663 + 1.0;
        _1619 = as_type<int>(_1665);
    }
    int _1667 = _1619;
    bool _1669 = !_1651;
    int _1671 = _1669 ? _1655 : (-1);
    float _1673 = trunc(_1659);
    float _1675 = precise::max(_1673, 0.0);
    uint _1677 = uint(_1675);
    if (_1629)
    {
        float _1679 = _1525 ? as_type<float>(_1667) : _969;
        _1009 = _1679;
    }
    float _1681 = _1009;
    int _1683 = _1641 * _1657;
    int _1685 = _1683 + _1497;
    int _1687 = _1671 & 3;
    bool _1689 = _1687 != 0;
    int _1691 = _1671 & 3;
    bool _1693 = _1691 != 0;
    bool _1695 = uint(_1687) >= 2u;
    int _1697 = _1693 ? 0 : 1;
    bool _1699 = uint(_1685) >= uint(_820);
    int _1701 = _1695 ? 0 : 1;
    bool _1703 = uint(_1687) > 1u;
    bool _1705 = !_1699;
    int _1707 = _1705 ? 0 : (-1);
    int _1709 = ~_812;
    int _1711 = _1709 + 1;
    bool _1713 = _1687 != 3;
    int _1715 = int(_1593) + int(_1677);
    int _1717 = ~_1657;
    int _1719 = _1717 + _1707;
    int _1721 = _1719 + 1;
    bool _1723 = _820 == 0;
    int _1725 = _820 * _1721;
    int _1727 = _1725 + _1497;
    int _1729 = ~_1697;
    int _1731 = _1729 + 1;
    int _1733 = _1731 + 1;
    int _1735 = _1711 * _1715;
    int _1737 = _1735 + _1553;
    int _1739 = _1733;
    if (!_1703)
    {
        int _1741 = ~_1697;
        int _1743 = _1741 + 1;
        _1739 = _1743;
    }
    int _1745 = _1739;
    int _1747 = ~_1701;
    int _1749 = _1747 + 1;
    int _1751 = _1749 + 1;
    int _1753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1755 = _1753 != 0;
    bool _1757 = !_1723;
    int _1759 = _1757 ? _1727 : (-1);
    int _1761 = _1751;
    if (_1713)
    {
        int _1763 = ~_1701;
        int _1765 = _1763 + 1;
        _1761 = _1765;
    }
    int _1767 = _1761;
    bool _1769 = uint(_1737) >= uint(_812);
    float _1771 = _736 * 2.0;
    bool _1773 = !_1755;
    int _1775 = _1773 ? 0 : 1;
    int _1777 = _1759 & 3;
    bool _1779 = _1777 != 0;
    float _1781 = floor(_1771);
    bool _1783 = !_1769;
    int _1785 = _1783 ? 0 : (-1);
    int _1787 = _1779 ? 0 : 1;
    bool _1789 = _1777 != 3;
    int _1791 = ~_1715;
    int _1793 = _1791 + _1785;
    int _1795 = _1793 + 1;
    bool _1797 = uint(_1777) >= 2u;
    float _1799 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1801 = log2(_1799);
    int _1803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1805 = _1803 != 0;
    int _1807 = _812 * _1795;
    int _1809 = _1807 + _1553;
    int _1811 = _1797 ? 0 : 1;
    bool _1813 = uint(_1777) > 1u;
    bool _1815 = !_1609;
    int _1817 = _1815 ? _1809 : (-1);
    int _1819 = ~_1811;
    int _1821 = _1819 + 1;
    int _1823 = _1821 + 1;
    int _1825 = _1823;
    int _1827 = _1811;
    float _1829 = _1771;
    if (_1789)
    {
        int _1831 = ~_1811;
        int _1833 = _1831 + 1;
        _1825 = _1833;
    }
    int _1835 = _1825;
    int _1837 = _1817 & 3;
    bool _1839 = _1837 != 0;
    int _1841 = ~_1787;
    int _1843 = _1841 + 1;
    int _1845 = _1843 + 1;
    bool _1847 = _1837 != 3;
    int _1849 = _1845;
    if (!_1813)
    {
        int _1851 = ~_1787;
        int _1853 = _1851 + 1;
        _1849 = _1853;
    }
    int _1855 = _1849;
    bool _1857 = uint(_1837) >= 2u;
    if (_1805)
    {
        _1827 = 0;
    }
    int _1859 = _1827;
    int _1861 = _1857 ? 0 : 1;
    int _1863 = _1859;
    if (_1805)
    {
        _870 = 0;
    }
    int _1865 = _870;
    int _1867 = _1865;
    if (!_1805)
    {
        _1863 = 1;
    }
    int _1869 = _1863;
    if (!_1805)
    {
        _1867 = 2;
    }
    int _1871 = _1867;
    int _1873 = ~_1861;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    int _1879 = _1877;
    if (_1847)
    {
        int _1881 = ~_1861;
        int _1883 = _1881 + 1;
        _1879 = _1883;
    }
    int _1885 = _1879;
    float _1887 = _802 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1889 = _1869 != 1;
    bool _1891 = _1871 != 2;
    float _1893 = _736 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1895 = _1839 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1897 = uint(_1837) > 1u;
    float _1899 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1901 = _1893;
    float _1903 = _1895;
    float _1905 = _1887;
    if (!_1889)
    {
        _1829 = _802;
    }
    float _1907 = _1829;
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1911 = -_1899;
    float _1913 = fma(_1893, 2.0, _1911);
    float _1915 = _1907;
    if (_1891)
    {
        _1901 = _736;
    }
    float _1917 = _1901;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1921 = _1917;
    if (!_1891)
    {
        _1921 = _740;
    }
    float _1923 = _1921;
    float _1925 = fma(_1887, -2.0, _1909);
    int _1927 = ~as_type<int>(_1895);
    int _1929 = _1927 + 1;
    int _1931 = _1929 + 1;
    int _1933 = _1931;
    if (!_1897)
    {
        int _1935 = ~as_type<int>(_1895);
        int _1937 = _1935 + 1;
        _1933 = _1937;
    }
    int _1939 = _1933;
    float _1941 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_1889)
    {
        _1903 = _740;
    }
    float _1943 = _1903;
    float _1945 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1925);
    float _1947 = _1943;
    if (!_1889)
    {
        _1661 = _1907;
    }
    float _1949 = _1661;
    float _1951 = -_1919;
    float _1953 = fma(_1941, 2.0, _1951);
    float _1955 = _1949;
    if (!_1889)
    {
        _1905 = _740;
    }
    float _1957 = _1905;
    float _1959 = _1801 * _112;
    float _1961 = _1957;
    float _1963 = _1959;
    if (_1889)
    {
        _1955 = _736;
    }
    float _1965 = _1955;
    float _1967 = -_112;
    float _1969 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1953);
    if (_1889)
    {
        _1915 = _736;
    }
    float _1971 = _1915;
    if (_1889)
    {
        _1947 = _802;
    }
    float _1973 = _1947;
    float _1975 = _1965 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1889)
    {
        _1961 = _802;
    }
    float _1977 = _1961;
    bool _1979 = _1781 > 0.0;
    float _1981 = -_770;
    float _1983 = fma(_1975, 2.0, _1981);
    bool _1985 = _1781 >= 0.0;
    bool _1987 = isnan(_1781);
    bool _1989 = _1985 || _1987;
    bool _1991 = isnan(0.0);
    bool _1993 = _1989 || _1991;
    float _1995 = float(uint(_1201));
    float _1997 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1999 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2001 = as_type<float>(_854) * _1995;
    float _2003 = exp2(_1959);
    float _2005 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1997);
    float _2007 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1999);
    float _2009 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2011 = float(uint(_1263));
    float _2013 = fma(_2009, -2.0, _768);
    float _2015 = float(uint(_1423));
    float _2017 = trunc(_2001);
    float _2019 = precise::max(_2017, 0.0);
    uint _2021 = uint(_2019);
    float _2023 = as_type<float>(_905) * _2011;
    if (_1891)
    {
        _1963 = _802;
    }
    float _2025 = _1963;
    float _2027 = _2025;
    if (!_1891)
    {
        _2027 = _736;
    }
    float _2029 = _2027;
    bool _2031 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2033 = isnan(0.0);
    bool _2035 = _2031 || _2033;
    bool _2037 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2039 = _2035 || _2037;
    float _2041 = -_2003;
    float _2043 = _2041 + 1.0;
    float _2045 = trunc(_2023);
    float _2047 = precise::max(_2045, 0.0);
    uint _2049 = uint(_2047);
    float _2051 = as_type<float>(_874) * _2015;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2055 = _2029 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2057 = _2039 ? _2043 : 0.0;
    int _2059 = ~_812;
    int _2061 = _2059 + 1;
    float _2063 = trunc(_2051);
    float _2065 = precise::max(_2063, 0.0);
    uint _2067 = uint(_2065);
    int _2069 = _806 * int(_2021);
    int _2071 = _2069 + _1201;
    float _2073 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2075 = 1.0 + _2073;
    bool _2077 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2079 = isnan(1.0);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2085 = _2081 || _2083;
    float _2087 = fma(_2055, -2.0, _2053);
    float _2089 = _802 * 2.0;
    float _2091 = float(uint(_2071));
    int _2093 = _850 * int(_2049);
    int _2095 = _2093 + _1263;
    float _2097 = 1.0 / _2075;
    int _2099 = abs(_1767);
    float _2101 = as_type<float>(_854) * _2091;
    float _2103 = float(uint(_2095));
    int _2105 = _2061 * int(_2067);
    int _2107 = _2105 + _1423;
    float _2109 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2111 = as_type<float>(_905) * _2103;
    float _2113 = trunc(_2101);
    float _2115 = precise::max(_2113, 0.0);
    uint _2117 = uint(_2115);
    float _2119 = float(uint(_2107));
    float _2121 = -_112;
    float _2123 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1983);
    int _2125 = abs(_1835);
    float _2127 = as_type<float>(_874) * _2119;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2131 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2109);
    float _2133 = floor(_2089);
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2137 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2129);
    float _2139 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2131);
    float _2141 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2005);
    float _2143 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2135);
    float _2145 = -_112;
    float _2147 = fma(_2145, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1913);
    float _2149 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2007);
    float _2151 = trunc(_2111);
    float _2153 = precise::max(_2151, 0.0);
    uint _2155 = uint(_2153);
    float _2157 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2143);
    float _2159 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2137);
    float _2161 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[87].w, _824);
    float _2163 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2013);
    int _2165 = _1993 ? 0 : 1;
    int _2167 = int(_2021) + int(_2117);
    float _2169 = trunc(_2127);
    float _2171 = precise::max(_2169, 0.0);
    uint _2173 = uint(_2171);
    float _2175 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2087);
    if (_2085)
    {
        float _2177 = _2057 * _2097;
        _114 = _2177;
    }
    float _2179 = _114;
    int _2181 = ~_786;
    int _2183 = _2181 + 1;
    float _2185 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _2187 = _2133 > 0.0;
    bool _2189 = _2133 >= 0.0;
    bool _2191 = isnan(_2133);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan(0.0);
    bool _2197 = _2193 || _2195;
    int _2199 = ~_820;
    int _2201 = _2199 + 1;
    int _2203 = int(_2049) + int(_2155);
    int _2205 = _2183 * _2167;
    int _2207 = _2205 + _1201;
    int _2209 = ~_812;
    int _2211 = _2209 + 1;
    int _2213 = ~_2165;
    int _2215 = _2213 + 1;
    int _2217 = _2215 + 1;
    int _2219 = int(_2067) + int(_2173);
    int _2221 = _2217;
    if (!_1979)
    {
        int _2223 = ~_2165;
        int _2225 = _2223 + 1;
        _2221 = _2225;
    }
    int _2227 = _2221;
    int _2229 = _2211 * _2219;
    int _2231 = _2229 + _1423;
    bool _2233 = uint(_2207) >= uint(_786);
    int _2235 = _2201 * _2203;
    int _2237 = _2235 + _1263;
    int _2239 = _2197 ? 0 : 1;
    float _2241 = _740 * 2.0;
    bool _2243 = !_2233;
    int _2245 = _2243 ? 0 : (-1);
    bool _2247 = uint(_2237) >= uint(_820);
    bool _2249 = uint(_2231) >= uint(_812);
    float _2251 = floor(_2241);
    int _2253 = ~_2239;
    int _2255 = _2253 + 1;
    int _2257 = _2255 + 1;
    int _2259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2261 = _2259 != 0;
    int _2263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2265 = _2263 != 0;
    int _2267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2269 = _2267 != 0;
    float _2271 = in.m_41.x;
    float _2273 = in.m_41.y;
    float _2275 = in.m_41.z;
    int _2277 = _2257;
    if (!_2187)
    {
        int _2279 = ~_2239;
        int _2281 = _2279 + 1;
        _2277 = _2281;
    }
    int _2283 = _2277;
    float _2285 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _2287 = !_2247;
    int _2289 = _2287 ? 0 : (-1);
    bool _2291 = !_2249;
    int _2293 = _2291 ? 0 : (-1);
    float _2295 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2285);
    int _2297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2299 = _2297 != 0;
    int _2301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2303 = _2301 != 0;
    float _2305 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _738);
    float _2307 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _746);
    bool _2309 = _2251 >= 0.0;
    bool _2311 = isnan(_2251);
    bool _2313 = _2309 || _2311;
    bool _2315 = isnan(0.0);
    bool _2317 = _2313 || _2315;
    float _2319 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2321 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2305);
    float _2323 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2307);
    float _2325 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2295);
    float _2327 = _2321 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2329 = _2317 ? 0 : 1;
    float _2331 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2333 = _2331 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2335 = _2251 > 0.0;
    float _2337 = _2325 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2339 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2273);
    float _2341 = 1.0 / _2333;
    float _2343 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2275);
    float _2345 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2271);
    float _2347 = _2319 * _2339;
    float _2349 = _756 * _2343;
    float _2351 = _736 + _740;
    float _2353 = _736 + _802;
    float _2355 = _2185 * _2345;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2357 = _2351 + (-1.0);
    int _2359 = ~_2329;
    int _2361 = _2359 + 1;
    int _2363 = _2361 + 1;
    float _2365 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2367 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2365;
    float _2369 = _2353 + (-1.0);
    int _2371 = _2363;
    if (!_2335)
    {
        int _2373 = ~_2329;
        int _2375 = _2373 + 1;
        _2371 = _2375;
    }
    int _2377 = _2371;
    float _2379 = -_2327;
    float _2381 = _2379 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2383 = fma(_2357, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2385 = _802 + _740;
    float _2387 = _2367 * _2341;
    float _2389 = _2323 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2391 = -_2337;
    float _2393 = _2391 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2395 = fma(_2369, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2397 = _2381 * _2381;
    float _2399 = in.m_43.x;
    float _2401 = in.m_43.y;
    float _2403 = in.m_43.z;
    float _2405 = _2385 + (-1.0);
    bool _2407 = _2273 != 0.0;
    bool _2409 = isnan(_2273);
    bool _2411 = _2407 || _2409;
    bool _2413 = isnan(0.0);
    bool _2415 = _2411 || _2413;
    float _2417 = -_2389;
    float _2419 = _2417 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2421 = fma(_2393, _2393, _2397);
    float _2423 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2425 = _730 + _2423;
    bool _2427 = _2271 == 0.0;
    bool _2429 = !_2415;
    bool _2431 = _2427 && _2429;
    float _2433 = fma(_2405, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2435 = fma(_2419, _2419, _2421);
    bool _2437 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2439 = isnan(_730);
    bool _2441 = _2437 || _2439;
    bool _2443 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2445 = _2441 || _2443;
    float _2447 = float(_2445);
    float _2449 = -_782;
    float _2451 = _2449 + 1.0;
    bool _2453 = !_2261;
    int _2455 = _2453 ? 0 : 1;
    float _2457 = fma(_2387, _2425, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2459 = _2275 == 0.0;
    bool _2461 = _2459 && _2431;
    float _2463 = rsqrt(_2435);
    float _2465 = _2447 * _2451;
    int _2467 = abs(_2455);
    float _2469 = _736 + (-0.5);
    float _2471 = in.m_45.x;
    float _2473 = in.m_45.y;
    float _2475 = in.m_45.z;
    float _2477 = _2457 * _2465;
    bool _2479 = !_2265;
    int _2481 = _2479 ? 0 : 1;
    float _2483 = -_2447;
    float _2485 = _2483 + 1.0;
    float _2487 = _802 + (-0.5);
    int _2489 = abs(_2481);
    float _2491 = fma(_2485, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2477);
    float _2493 = _2457;
    float _2495 = as_type<float>(_2377);
    if (_2461)
    {
        _2493 = _2399;
    }
    float _2497 = _2493;
    float _2499 = _740 + (-0.5);
    float _2501 = float(_2377);
    float _2503 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2491);
    float _2505 = float(_2467);
    float _2507 = _2393 * _2463;
    float _2509 = _2497;
    if (_2461)
    {
        _2495 = _2497;
    }
    float _2511 = _2495;
    float _2513 = _2511;
    if (!_2461)
    {
        _2509 = _2399;
    }
    float _2515 = _2509;
    float _2517 = _2505 * _2501;
    float _2519 = _2381 * _2463;
    float _2521 = float(_2227);
    float _2523 = _2419 * _2463;
    float _2525 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2527 = _2507 * _2525;
    float _2529 = float(_2489);
    float _2531 = _2517 * (-2.0);
    float _2533 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2535 = _2523 * _2533;
    float _2537 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2539 = -_2527;
    float _2541 = fma(_2523, _2537, _2539);
    float _2543 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2545 = _2519 * _2543;
    float _2547 = _2529 * _2521;
    float _2549 = fma(_2395, _2531, _2395);
    float _2551 = fma(_2531, _2471, _2471);
    float _2553 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2555 = -_2535;
    float _2557 = fma(_2519, _2553, _2555);
    float _2559 = _2541 * _2541;
    float _2561 = _2535;
    float _2563 = _2559;
    if (_2461)
    {
        _2561 = _2401;
    }
    float _2565 = _2561;
    float _2567 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2569 = -_2545;
    float _2571 = fma(_2507, _2567, _2569);
    bool _2573 = !_2269;
    int _2575 = _2573 ? 0 : 1;
    float _2577 = fma(_2557, _2557, _2559);
    float _2579 = _2565;
    if (_2461)
    {
        _2563 = _2565;
    }
    float _2581 = _2563;
    float _2583 = _2547 * (-2.0);
    float _2585 = _2581;
    if (!_2461)
    {
        _2579 = _2401;
    }
    float _2587 = _2579;
    float _2589 = fma(_2469, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2551);
    int _2591 = abs(_2575);
    float _2593 = fma(_2433, _2583, _2433);
    float _2595 = fma(_2583, _2473, _2473);
    float _2597 = fma(_2549, _2179, _2589);
    float _2599 = fma(_2571, _2571, _2577);
    float _2601 = float(_2283);
    float _2603 = _2597 * 0.15915493667125701904296875;
    float _2605 = float(_2591);
    float _2607 = fma(_2487, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2595);
    float _2609 = _2597;
    float _2611 = _2595;
    if (_2461)
    {
        _2609 = _2403;
    }
    float _2613 = _2609;
    float _2615 = rsqrt(_2599);
    float _2617 = _2613;
    if (!_2461)
    {
        float _2619 = fma(_2273, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2587);
        _2585 = _2619;
    }
    float _2621 = _2585;
    float _2623 = _2605 * _2601;
    if (_2461)
    {
        _2611 = _2613;
    }
    float _2625 = _2611;
    float _2627 = fma(_2593, _2179, _2607);
    float _2629 = _2625;
    if (!_2461)
    {
        _2617 = _2403;
    }
    float _2631 = _2617;
    if (!_2461)
    {
        float _2633 = fma(_2271, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2515);
        _2513 = _2633;
    }
    float _2635 = _2513;
    float _2637 = in.m_47.x;
    float _2639 = in.m_47.y;
    float _2641 = in.m_47.z;
    float _2643 = in.m_47.w;
    float _2645 = _2603 * 6.283185482025146484375;
    float _2647 = sin(_2645);
    float _2649 = _2623 * (-2.0);
    float _2651 = _2627 * 0.15915493667125701904296875;
    if (!_2461)
    {
        float _2653 = fma(_2275, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2631);
        _2629 = _2653;
    }
    float _2655 = _2629;
    float _2657 = fma(_2649, _2475, _2475);
    float _2659 = fma(_2383, _2649, _2383);
    float _2661 = _2603 * 6.283185482025146484375;
    float _2663 = cos(_2661);
    float _2665 = fma(_2499, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2657);
    float _2667 = _2541 * _2615;
    float _2669 = _2557 * _2615;
    float _2671 = fma(_2659, _2179, _2665);
    float _2673 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2675 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2677 = _2651 * 6.283185482025146484375;
    float _2679 = sin(_2677);
    float _2681 = _2671 * 0.15915493667125701904296875;
    float _2683 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2685 = _2503 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2687 = _2673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2689 = _2675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2691 = _2683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2693 = _2641 * _2515;
    float _2695 = _2651 * 6.283185482025146484375;
    float _2697 = cos(_2695);
    float _2699 = _2639 * _2631;
    float _2701 = _2637 * _2587;
    float _2703 = -_2693;
    float _2705 = fma(_2637, _2631, _2703);
    out.m_49.x = _2691;
    out.m_49.y = _2687;
    out.m_49.z = _2689;
    out.m_49.w = _2685;
    float _2707 = -_2699;
    float _2709 = fma(_2641, _2587, _2707);
    float _2711 = -_2701;
    float _2713 = fma(_2639, _2515, _2711);
    float _2715 = _2705 * _2643;
    float _2717 = _2681 * 6.283185482025146484375;
    float _2719 = cos(_2717);
    float _2721 = _2709 * _2643;
    float _2723 = _2713 * _2643;
    float _2725 = _2571 * _2615;
    float _2727 = _2647 * _2679;
    int _2729 = ~_2203;
    int _2731 = _2729 + _2289;
    int _2733 = _2731 + 1;
    int _2735 = ~_2219;
    int _2737 = _2735 + _2293;
    int _2739 = _2737 + 1;
    float _2741 = _2681 * 6.283185482025146484375;
    float _2743 = sin(_2741);
    float _2745 = _2663 * _2697;
    float _2747 = _2647 * _2697;
    float _2749 = _2663 * _2679;
    float _2751 = _2523 * _2667;
    float _2753 = _2507 * _2725;
    int _2755 = _812 * _2739;
    int _2757 = _2755 + _1423;
    bool _2759 = _786 == 0;
    float _2761 = _2697 * _2719;
    float _2763 = _2663 * _2719;
    float _2765 = _2647 * _2719;
    float _2767 = _2679 * _2719;
    int _2769 = _820 * _2733;
    int _2771 = _2769 + _1263;
    float _2773 = _2763 * _2347;
    float _2775 = fma(_2743, _2745, _2727);
    float _2777 = fma(_2743, _2727, _2745);
    float _2779 = -_2749;
    float _2781 = fma(_2743, _2747, _2779);
    float _2783 = _2519 * _2669;
    float _2785 = -_2747;
    float _2787 = fma(_2743, _2749, _2785);
    float _2789 = -_2751;
    float _2791 = fma(_2519, _2725, _2789);
    float _2793 = -_2753;
    float _2795 = fma(_2523, _2669, _2793);
    float _2797 = _2765 * _2347;
    float _2799 = -_2783;
    float _2801 = fma(_2507, _2667, _2799);
    float _2803 = -_2347;
    float _2805 = _2743 * _2803;
    float _2807 = fma(_2775, _2355, _2773);
    float _2809 = _2775 * _2791;
    float _2811 = fma(_2781, _2355, _2797);
    float _2813 = _2775 * _2801;
    float _2815 = _2763 * _2791;
    float _2817 = _2763 * _2795;
    float _2819 = _2763 * _2801;
    float _2821 = fma(_2761, _2355, _2805);
    float _2823 = fma(_2761, _2669, _2809);
    float _2825 = _2775 * _2795;
    float _2827 = fma(_2761, _2725, _2813);
    float _2829 = -_2743;
    float _2831 = fma(_2829, _2669, _2815);
    float _2833 = -_2743;
    float _2835 = fma(_2833, _2667, _2817);
    float _2837 = -_2743;
    float _2839 = fma(_2837, _2725, _2819);
    float _2841 = _2787 * _2791;
    float _2843 = _2787 * _2795;
    float _2845 = _2787 * _2801;
    float _2847 = fma(_2787, _2349, _2807);
    float _2849 = fma(_2761, _2667, _2825);
    float _2851 = fma(_2767, _2669, _2841);
    float _2853 = fma(_2767, _2349, _2821);
    float _2855 = fma(_2767, _2667, _2843);
    float _2857 = fma(_2767, _2725, _2845);
    int _2859 = ~_2167;
    int _2861 = _2859 + _2245;
    int _2863 = _2861 + 1;
    float _2865 = _2791 * _2847;
    int _2867 = _1671 >> 31;
    float _2869 = fma(_2777, _2507, _2851);
    float _2871 = fma(_2777, _2519, _2855);
    float _2873 = _2795 * _2847;
    float _2875 = _2801 * _2847;
    int _2877 = _2867 & 3;
    float _2879 = fma(_2669, _2853, _2865);
    float _2881 = fma(_2667, _2853, _2873);
    float _2883 = fma(_2725, _2853, _2875);
    int _2885 = _1671 + _2877;
    float _2887 = fma(_2777, _2349, _2811);
    int _2889 = _1759 >> 31;
    float _2891 = fma(_2781, _2507, _2823);
    float _2893 = fma(_2781, _2519, _2849);
    float _2895 = fma(_2781, _2523, _2827);
    int _2897 = _2885 >> 2;
    float _2899 = fma(_2765, _2507, _2831);
    float _2901 = fma(_2765, _2519, _2835);
    float _2903 = fma(_2765, _2523, _2839);
    int _2905 = _2889 & 3;
    float _2907 = fma(_2777, _2523, _2857);
    int _2909 = _1817 >> 31;
    float _2911 = _2899 * _2639;
    int _2913 = _2897 << 4;
    int _2915 = _2913 + 368;
    float _2917 = _2901 * _2621;
    int _2919 = _1759 + _2905;
    float _2921 = _2903 * _2621;
    int _2923 = _2909 & 3;
    uint _2925 = uint(int(uint(_2915) >> uint(2)));
    uint _2927 = uint(int(uint(int(_2925)) >> uint(2)));
    int _2929 = int(_2925) & 3;
    float _2931 = (*spvDescriptorSet0.vp_c9)._m0[int(_2927)][_2929];
    int _2933 = int(_2925) + 1;
    uint _2935 = uint(int(uint(_2933) >> uint(2)));
    int _2937 = _2933 & 3;
    float _2939 = (*spvDescriptorSet0.vp_c9)._m0[int(_2935)][_2937];
    int _2941 = _2919 >> 2;
    float _2943 = _2899 * _2621;
    int _2945 = _1817 + _2923;
    float _2947 = _2715 * _2899;
    int _2949 = _2941 << 4;
    int _2951 = _2949 + 512;
    float _2953 = _2901 * _2639;
    int _2955 = _2945 >> 2;
    float _2957 = _2715 * _2901;
    uint _2959 = uint(int(uint(_2951) >> uint(2)));
    uint _2961 = uint(int(uint(int(_2959)) >> uint(2)));
    int _2963 = int(_2959) & 3;
    float _2965 = (*spvDescriptorSet0.vp_c9)._m0[int(_2961)][_2963];
    int _2967 = int(_2959) + 1;
    uint _2969 = uint(int(uint(_2967) >> uint(2)));
    int _2971 = _2967 & 3;
    float _2973 = (*spvDescriptorSet0.vp_c9)._m0[int(_2969)][_2971];
    float _2975 = _2715 * _2903;
    int _2977 = _2955 << 4;
    int _2979 = _2977 + 656;
    float _2981 = fma(_2891, _2635, _2943);
    float _2983 = fma(_2891, _2637, _2911);
    float _2985 = fma(_2721, _2891, _2947);
    bool _2987 = !_1689;
    int _2989 = _2987 ? 0 : 1;
    int _2991 = _786 * _2863;
    int _2993 = _2991 + _1201;
    int _2995 = _1759 & 3;
    bool _2997 = _2995 != 0;
    uint _2999 = uint(int(uint(_2979) >> uint(2)));
    uint _3001 = uint(int(uint(int(_2999)) >> uint(2)));
    int _3003 = int(_2999) & 3;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[int(_3001)][_3003];
    int _3007 = int(_2999) + 1;
    uint _3009 = uint(int(uint(_3007) >> uint(2)));
    int _3011 = _3007 & 3;
    float _3013 = (*spvDescriptorSet0.vp_c9)._m0[int(_3009)][_3011];
    float _3015 = fma(_2893, _2637, _2953);
    float _3017 = fma(_2893, _2635, _2917);
    float _3019 = fma(_2895, _2635, _2921);
    float _3021 = fma(_2721, _2893, _2957);
    float _3023 = fma(_2721, _2895, _2975);
    float _3025 = fma(_2507, _2887, _2879);
    float _3027 = fma(_2519, _2887, _2881);
    int _3029 = _2915 + 8;
    uint _3031 = uint(int(uint(_3029) >> uint(2)));
    uint _3033 = uint(int(uint(int(_3031)) >> uint(2)));
    int _3035 = int(_3031) & 3;
    float _3037 = (*spvDescriptorSet0.vp_c9)._m0[int(_3033)][_3035];
    int _3039 = int(_3031) + 1;
    uint _3041 = uint(int(uint(_3039) >> uint(2)));
    int _3043 = _3039 & 3;
    float _3045 = (*spvDescriptorSet0.vp_c9)._m0[int(_3041)][_3043];
    float _3047 = fma(_2523, _2887, _2883);
    bool _3049 = !_2997;
    int _3051 = _3049 ? 0 : 1;
    float _3053 = _2337 + _3025;
    int _3055 = _1817 & 3;
    bool _3057 = _3055 != 0;
    float _3059 = _2327 + _3027;
    int _3061 = abs(_1745);
    float _3063 = _2389 + _3047;
    bool _3065 = !_3057;
    int _3067 = _3065 ? 0 : 1;
    float _3069 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _3071 = _1687 != 3;
    float _3073 = _2903 * _2639;
    int _3075 = _2951 + 8;
    uint _3077 = uint(int(uint(_3075) >> uint(2)));
    uint _3079 = uint(int(uint(int(_3077)) >> uint(2)));
    int _3081 = int(_3077) & 3;
    float _3083 = (*spvDescriptorSet0.vp_c9)._m0[int(_3079)][_3081];
    int _3085 = int(_3077) + 1;
    uint _3087 = uint(int(uint(_3085) >> uint(2)));
    int _3089 = _3085 & 3;
    float _3091 = (*spvDescriptorSet0.vp_c9)._m0[int(_3087)][_3089];
    int _3093 = ~_3061;
    int _3095 = _3093 + 1;
    int _3097 = _3095 + 1;
    float _3099 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3069);
    int _3101 = abs(_2989);
    float _3103 = fma(_2895, _2637, _3073);
    int _3105 = abs(_1855);
    float _3107 = fma(_3063, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3099);
    int _3109 = abs(_3051);
    float _3111 = fma(_2869, _2641, _2983);
    int _3113 = ~_3105;
    int _3115 = _3113 + 1;
    int _3117 = _3115 + 1;
    int _3119 = _3097 * as_type<int>(_2939);
    int _3121 = ~_3101;
    int _3123 = _3121 + 1;
    int _3125 = _3123 + 1;
    float _3127 = _3107 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    int _3129 = abs(_1939);
    float _3131 = fma(_2871, _2641, _3015);
    int _3133 = _2979 + 8;
    uint _3135 = uint(int(uint(_3133) >> uint(2)));
    uint _3137 = uint(int(uint(int(_3135)) >> uint(2)));
    int _3139 = int(_3135) & 3;
    float _3141 = (*spvDescriptorSet0.vp_c9)._m0[int(_3137)][_3139];
    int _3143 = int(_3135) + 1;
    uint _3145 = uint(int(uint(_3143) >> uint(2)));
    int _3147 = _3143 & 3;
    float _3149 = (*spvDescriptorSet0.vp_c9)._m0[int(_3145)][_3147];
    int _3151 = _3125 * as_type<int>(_2931);
    int _3153 = _3151 + _3119;
    float _3155 = fma(_2907, _2641, _3103);
    int _3157 = ~_3109;
    int _3159 = _3157 + 1;
    int _3161 = _3159 + 1;
    int _3163 = _3117 * as_type<int>(_2973);
    int _3165 = ~_3129;
    int _3167 = _3165 + 1;
    int _3169 = _3167 + 1;
    float _3171 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3173 = int(_3171);
    int _3175 = ~_2099;
    int _3177 = _3175 + 1;
    int _3179 = _3177 + 1;
    int _3181 = _3161 * as_type<int>(_2965);
    int _3183 = _3181 + _3163;
    bool _3185 = !_3071;
    int _3187 = _3185 ? 0 : (-1);
    out.m_51.x = _3111;
    out.m_51.y = _3131;
    out.m_51.z = _3155;
    bool _3189 = _1777 != 3;
    int _3191 = _3169 * as_type<int>(_3013);
    int _3193 = abs(_1885);
    float _3195 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3197 = int(_3195);
    bool _3199 = !_3189;
    int _3201 = _3199 ? 0 : (-1);
    int _3203 = ~_2125;
    int _3205 = _3203 + 1;
    int _3207 = _3205 + 1;
    int _3209 = _3179 * as_type<int>(_3037);
    int _3211 = _3209 + _3153;
    int _3213 = abs(_3187);
    int _3215 = abs(_3067);
    int _3217 = abs(_3201);
    int _3219 = ~_3213;
    int _3221 = _3219 + 1;
    int _3223 = _3221 + 1;
    float _3225 = float(uint(_3197));
    int _3227 = _3207 * as_type<int>(_3083);
    int _3229 = _3227 + _3183;
    int _3231 = ~_3217;
    int _3233 = _3231 + 1;
    int _3235 = _3233 + 1;
    int _3237 = _3223 * as_type<int>(_3045);
    int _3239 = _3237 + _3211;
    bool _3241 = !_2299;
    int _3243 = _3241 ? 0 : 1;
    float _3245 = 1.0 / _3225;
    int _3247 = ~_3215;
    int _3249 = _3247 + 1;
    int _3251 = _3249 + 1;
    int _3253 = _3235 * as_type<int>(_3091);
    int _3255 = _3253 + _3229;
    int _3257 = abs(_1775);
    int _3259 = abs(_3243);
    int _3261 = _3251 * as_type<int>(_3005);
    int _3263 = _3261 + _3191;
    int _3265 = ~_3257;
    int _3267 = _3265 + 1;
    int _3269 = _3267 + 1;
    float _3271 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3273 = int(_3271);
    bool _3275 = !_2759;
    int _3277 = _3275 ? _2993 : (-1);
    bool _3279 = _1837 != 3;
    int _3281 = _3239 * _3269;
    float _3283 = float(uint(_3173));
    bool _3285 = !_2303;
    int _3287 = _3285 ? 0 : 1;
    int _3289 = _3277 * _3257;
    int _3291 = _3289 + _3281;
    bool _3293 = !_3279;
    int _3295 = _3293 ? 0 : (-1);
    float _3297 = 1.0 / _3283;
    int _3299 = abs(_3295);
    int _3301 = abs(_3287);
    int _3303 = ~_3193;
    int _3305 = _3303 + 1;
    int _3307 = _3305 + 1;
    float _3309 = float(uint(_3273));
    int _3311 = _3307 * as_type<int>(_3141);
    int _3313 = _3311 + _3263;
    int _3315 = ~_3259;
    int _3317 = _3315 + 1;
    int _3319 = _3317 + 1;
    bool _3321 = _820 == 0;
    float _3323 = 1.0 / _3309;
    int _3325 = ~_3299;
    int _3327 = _3325 + 1;
    int _3329 = _3327 + 1;
    int _3331 = _3319 * _3255;
    bool _3333 = !_3321;
    int _3335 = _3333 ? _2771 : (-1);
    int _3337 = abs(_3173);
    int _3339 = _3329 * as_type<int>(_3149);
    int _3341 = _3339 + _3313;
    bool _3343 = _812 == 0;
    int _3345 = _3335 * _3259;
    int _3347 = _3345 + _3331;
    int _3349 = ~_3301;
    int _3351 = _3349 + 1;
    int _3353 = _3351 + 1;
    float _3355 = float(uint(_3337));
    bool _3357 = !_3343;
    int _3359 = _3357 ? _2757 : (-1);
    int _3361 = _3353 * _3341;
    int _3363 = abs(_3197);
    float _3365 = 1.0 / _3355;
    int _3367 = as_type<int>(_3245) + (-2);
    int _3369 = _3359 * _3301;
    int _3371 = _3369 + _3361;
    float _3373 = float(uint(_3347));
    int _3375 = as_type<int>(_3297) + (-2);
    float _3377 = float(uint(_3363));
    float _3379 = as_type<float>(_3367) * _3373;
    float _3381 = float(uint(_3291));
    int _3383 = abs(_3273);
    int _3385 = as_type<int>(_3323) + (-2);
    float _3387 = as_type<float>(_3375) * _3381;
    float _3389 = float(uint(_3371));
    float _3391 = 1.0 / _3377;
    float _3393 = float(uint(_3383));
    int _3395 = abs(_3291);
    float _3397 = as_type<float>(_3385) * _3389;
    int _3399 = as_type<int>(_3365) + (-2);
    float _3401 = float(uint(_3395));
    float _3403 = trunc(_3387);
    float _3405 = precise::max(_3403, 0.0);
    uint _3407 = uint(_3405);
    int _3409 = ~_3173;
    int _3411 = _3409 + 1;
    int _3413 = ~_3197;
    int _3415 = _3413 + 1;
    float _3417 = as_type<float>(_3399) * _3401;
    int _3419 = abs(_3371);
    float _3421 = fma(_2869, _2655, _2981);
    int _3423 = ~_3273;
    int _3425 = _3423 + 1;
    float _3427 = trunc(_3379);
    float _3429 = precise::max(_3427, 0.0);
    uint _3431 = uint(_3429);
    int _3433 = as_type<int>(_3391) + (-2);
    float _3435 = float(uint(_3419));
    bool _3437 = _3197 == 0;
    bool _3439 = _3197 == 0;
    float _3441 = 1.0 / _3393;
    int _3443 = _3411 * int(_3407);
    int _3445 = _3443 + _3291;
    float _3447 = float(uint(_3445));
    float _3449 = trunc(_3397);
    float _3451 = precise::max(_3449, 0.0);
    uint _3453 = uint(_3451);
    int _3455 = abs(_3347);
    int _3457 = _3415 * int(_3431);
    int _3459 = _3457 + _3347;
    float _3461 = as_type<float>(_3375) * _3447;
    float _3463 = float(uint(_3455));
    float _3465 = float(uint(_3459));
    float _3467 = trunc(_3417);
    float _3469 = precise::max(_3467, 0.0);
    uint _3471 = uint(_3469);
    int _3473 = as_type<int>(_3441) + (-2);
    float _3475 = as_type<float>(_3433) * _3463;
    float _3477 = fma(_2871, _2655, _3017);
    float _3479 = as_type<float>(_3367) * _3465;
    int _3481 = ~_3337;
    int _3483 = _3481 + 1;
    int _3485 = _3425 * int(_3453);
    int _3487 = _3485 + _3371;
    float _3489 = fma(_2907, _2655, _3019);
    float _3491 = trunc(_3475);
    float _3493 = precise::max(_3491, 0.0);
    uint _3495 = uint(_3493);
    float _3497 = as_type<float>(_3473) * _3435;
    int _3499 = ~_3363;
    int _3501 = _3499 + 1;
    float _3503 = float(uint(_3487));
    out.m_53.x = _3421;
    out.m_53.y = _3477;
    out.m_53.z = _3489;
    float _3505 = trunc(_3497);
    float _3507 = precise::max(_3505, 0.0);
    uint _3509 = uint(_3507);
    float _3511 = as_type<float>(_3385) * _3503;
    int _3513 = ~_3383;
    int _3515 = _3513 + 1;
    float _3517 = trunc(_3461);
    float _3519 = precise::max(_3517, 0.0);
    uint _3521 = uint(_3519);
    float _3523 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3525 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3527 = _3483 * int(_3471);
    int _3529 = _3527 + _3395;
    float _3531 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3533 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3523);
    float _3535 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3525);
    float _3537 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3531);
    float _3539 = float(uint(_3529));
    int _3541 = _3501 * int(_3495);
    int _3543 = _3541 + _3455;
    float _3545 = fma(_3063, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3533);
    int _3547 = _3515 * int(_3509);
    int _3549 = _3547 + _3419;
    float _3551 = trunc(_3479);
    float _3553 = precise::max(_3551, 0.0);
    uint _3555 = uint(_3553);
    float _3557 = as_type<float>(_3399) * _3539;
    float _3559 = float(uint(_3543));
    float _3561 = _3545 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3563 = float(uint(_3549));
    float _3565 = fma(_3063, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3535);
    float _3567 = fma(_3063, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3537);
    float _3569 = as_type<float>(_3433) * _3559;
    float _3571 = trunc(_3557);
    float _3573 = precise::max(_3571, 0.0);
    uint _3575 = uint(_3573);
    float _3577 = _3561 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3579 = as_type<float>(_3473) * _3563;
    float _3581 = _3561 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3583 = _3561 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3585 = int(_3407) + int(_3521);
    float _3587 = _3561 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3589 = _3565 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3591 = trunc(_3511);
    float _3593 = precise::max(_3591, 0.0);
    uint _3595 = uint(_3593);
    float _3597 = fma(_3127, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3577);
    float _3599 = fma(_3127, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3587);
    float _3601 = fma(_3127, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3581);
    int _3603 = int(_3431) + int(_3555);
    float _3605 = fma(_3589, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3597);
    int _3607 = ~_3337;
    int _3609 = _3607 + 1;
    float _3611 = trunc(_3569);
    float _3613 = precise::max(_3611, 0.0);
    uint _3615 = uint(_3613);
    int _3617 = ~_3173;
    int _3619 = _3617 + 1;
    int _3621 = int(_3471) + int(_3575);
    int _3623 = ~_3273;
    int _3625 = _3623 + 1;
    int _3627 = _3619 * _3585;
    int _3629 = _3627 + _3291;
    float _3631 = trunc(_3579);
    float _3633 = precise::max(_3631, 0.0);
    uint _3635 = uint(_3633);
    float _3637 = fma(_3127, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3583);
    float _3639 = fma(_3589, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3601);
    bool _3641 = uint(_3629) >= uint(_3173);
    int _3643 = _3609 * _3621;
    int _3645 = _3643 + _3395;
    float _3647 = fma(_3589, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3637);
    int _3649 = int(_3453) + int(_3595);
    float _3651 = fma(_3589, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3599);
    int _3653 = int(_3495) + int(_3615);
    float _3655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3657 = ~_3363;
    int _3659 = _3657 + 1;
    int _3661 = _3625 * _3649;
    int _3663 = _3661 + _3371;
    int _3665 = ~_3197;
    int _3667 = _3665 + 1;
    int _3669 = ~_3383;
    int _3671 = _3669 + 1;
    int _3673 = _3659 * _3653;
    int _3675 = _3673 + _3455;
    bool _3677 = uint(_3663) >= uint(_3273);
    int _3679 = _3667 * _3603;
    int _3681 = _3679 + _3347;
    int _3683 = int(_3509) + int(_3635);
    bool _3685 = uint(_3675) >= uint(_3363);
    bool _3687 = uint(_3681) >= uint(_3197);
    int _3689 = _3671 * _3683;
    int _3691 = _3689 + _3419;
    bool _3693 = !_3641;
    int _3695 = _3693 ? 0 : (-1);
    bool _3697 = !_3677;
    int _3699 = _3697 ? 0 : (-1);
    bool _3701 = !_3687;
    int _3703 = _3701 ? 0 : (-1);
    int _3705 = ~_3585;
    int _3707 = _3705 + _3695;
    int _3709 = _3707 + 1;
    int _3711 = ~_3603;
    int _3713 = _3711 + _3703;
    int _3715 = _3713 + 1;
    int _3717 = ~_3649;
    int _3719 = _3717 + _3699;
    int _3721 = _3719 + 1;
    bool _3723 = _3173 == 0;
    float _3725 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3727 = _3173 == 0;
    int _3729 = _3197 * _3715;
    int _3731 = _3729 + _3347;
    int _3733 = _3291 ^ _3173;
    int _3735 = _3173 * _3709;
    int _3737 = _3735 + _3291;
    bool _3739 = uint(_3691) >= uint(_3383);
    int _3741 = _3273 * _3721;
    int _3743 = _3741 + _3371;
    int _3745 = _3347 ^ _3197;
    float _3747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3749 = !_3685;
    int _3751 = _3749 ? 0 : (-1);
    bool _3753 = !_3723;
    int _3755 = _3753 ? _3737 : (-1);
    bool _3757 = uint(_3645) >= uint(_3337);
    int _3759 = ~_3751;
    int _3761 = _3653 + _3759;
    int _3763 = _3761 + 1;
    float _3765 = _3655 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3767 = float(_3755);
    float _3769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3771 = !_3757;
    int _3773 = _3771 ? 0 : (-1);
    float _3775 = fma(_3765, _1031, -0.5);
    bool _3777 = _3273 == 0;
    float _3779 = fma(_3765, _3767, _2147);
    bool _3781 = _3273 == 0;
    float _3783 = _3747 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3785 = _3371 ^ _3273;
    float _3787 = fma(_2139, _3775, _3779);
    bool _3789 = !_3437;
    int _3791 = _3789 ? _3731 : (-1);
    float _3793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3795 = uint(int(uint(_3733) >> uint(31)));
    int _3797 = ~_3773;
    int _3799 = _3621 + _3797;
    int _3801 = _3799 + 1;
    float _3803 = _3725 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _3805 = uint(int(uint(_3745) >> uint(31)));
    bool _3807 = !_3777;
    int _3809 = _3807 ? _3743 : (-1);
    float _3811 = fma(_3803, _1055, -0.5);
    float _3813 = float(_3791);
    bool _3815 = !_3739;
    int _3817 = _3815 ? 0 : (-1);
    uint _3819 = uint(int(uint(_3785) >> uint(31)));
    float _3821 = fma(_3803, _3813, _2123);
    int _3823 = ~int(_3795);
    int _3825 = _3823 + 1;
    float _3827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3829 = ~int(_3805);
    int _3831 = _3829 + 1;
    float _3833 = fma(_3783, _1681, -0.5);
    float _3835 = float(_3809);
    float _3837 = fma(_2141, _3811, _3821);
    int _3839 = ~_3817;
    int _3841 = _3683 + _3839;
    int _3843 = _3841 + 1;
    float _3845 = _3793 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3847 = ~int(_3819);
    int _3849 = _3847 + 1;
    float _3851 = fma(_3783, _3835, _1969);
    int _3853 = _3801 ^ _3825;
    float _3855 = _3769 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3857 = _3763 ^ _3831;
    float _3859 = fma(_2159, _3833, _3851);
    int _3861 = _3843 ^ _3849;
    float _3863 = fma(_2723, _2907, _3023);
    int _3865 = ~_3825;
    int _3867 = _3865 + _3853;
    int _3869 = _3867 + 1;
    float _3871 = _3827 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3873 = ~_3831;
    int _3875 = _3873 + _3857;
    int _3877 = _3875 + 1;
    int _3879 = ~_3849;
    int _3881 = _3879 + _3861;
    int _3883 = _3881 + 1;
    float _3885 = fma(_3871, _1623, -0.5);
    bool _3887 = !_3727;
    int _3889 = _3887 ? _3869 : (-1);
    bool _3891 = !_3439;
    int _3893 = _3891 ? _3877 : (-1);
    bool _3895 = !_3781;
    int _3897 = _3895 ? _3883 : (-1);
    float _3899 = float(_3889);
    float _3901 = float(_3893);
    float _3903 = fma(_1559, _3855, -0.5);
    float _3905 = float(_3897);
    float _3907 = -_1945;
    float _3909 = fma(_3855, _3899, _3907);
    float _3911 = fma(_1583, _3845, -0.5);
    float _3913 = -_2163;
    float _3915 = fma(_3845, _3901, _3913);
    float _3917 = _3837 + 0.5;
    float _3919 = -_2175;
    float _3921 = fma(_3871, _3905, _3919);
    float _3923 = fma(_2157, _3903, _3909);
    float _3925 = fma(_2149, _3911, _3915);
    float _3927 = _3567 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3929 = fma(_2161, _3885, _3921);
    float _3931 = fma(_2723, _2869, _2985);
    float _3933 = fma(_2723, _2871, _3021);
    float _3935 = fma(_3927, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3605);
    float _3937 = fma(_3927, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3639);
    float _3939 = fma(_3927, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3647);
    float _3941 = fma(_3927, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3651);
    float _3943 = _3859 + 0.5;
    float _3945 = _3787 + 0.5;
    float _3947 = _3923 + 0.5;
    float _3949 = _3925 + 0.5;
    float _3951 = _3929 + 0.5;
    out.m_55.x = _3931;
    out.m_55.y = _3933;
    out.m_55.z = _3863;
    out.gl_Position.x = _3937;
    out.gl_Position.y = _3935;
    out.gl_Position.z = _3939;
    out.gl_Position.w = _3941;
    out.m_57.x = _3945;
    out.m_57.y = _3947;
    out.m_57.z = _3917;
    out.m_57.w = _3949;
    out.m_59.x = _3943;
    out.m_59.y = _3951;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _4008 = as_type<float>(_94);
        out.gl_Position.z = _4008;
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
        out.m_29.x = 0.0;
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
        float _4078 = as_type<float>(_132);
        out.gl_Position.z = _4078;
    }
    if (_124)
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
    bool _312 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _314 = isnan(_284);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = 1.0 / _296;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = _284 + _326;
    bool _330 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _332 = 1.0 / _300;
    float _334 = _328 * _306;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _338 = _284 + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _342 = _284 + _340;
    float _344 = 1.0 / _310;
    float _346 = _288 * _324;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _350 = _284 + _348;
    bool _352 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _354 = isnan(_284);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = 1.0 / _304;
    float _366 = _338 * _332;
    bool _368 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _370 = isnan(_284);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    bool _380 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _382 = isnan(_284);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = -_378;
    float _394 = _392 + 1.0;
    float _396 = _350 * _344;
    float _398 = -_322;
    float _400 = _398 + 1.0;
    float _402 = _378 * _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _404;
    float _408 = _342 * _364;
    bool _410 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _412 = isnan(_284);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _426;
    float _430 = fma(_406, _334, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _432 = _420 * _394;
    float _434 = fma(_424, _334, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _436 = fma(_428, _334, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _438 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _440 = isnan(_284);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -_362;
    float _452 = _450 + 1.0;
    float _454 = -_420;
    float _456 = _454 + 1.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _462 = _448 * _452;
    float _464 = -_448;
    float _466 = _464 + 1.0;
    float _468 = _362 * _456;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _478 = _390 * _466;
    float _480 = -_390;
    float _482 = _480 + 1.0;
    float _484 = fma(_460, _346, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _486 = fma(_472, _346, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _488 = _430 * _478;
    float _490 = fma(_476, _346, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _492 = _434 * _478;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _494;
    float _498 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[143].x, _488);
    float _500 = _436 * _478;
    float _502 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[143].y, _492);
    float _504 = fma(_496, _366, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _506 = fma(_484, _462, _498);
    float _508 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[143].z, _500);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _514;
    float _518 = fma(_486, _462, _502);
    float _520 = fma(_504, _468, _506);
    float _522 = fma(_490, _462, _508);
    float _524 = fma(_512, _366, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _534 = fma(_516, _366, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _540 = fma(_528, _408, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _542 = fma(_532, _408, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _544 = fma(_524, _468, _518);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _550;
    float _554 = fma(_538, _408, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _556 = fma(_534, _468, _522);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _558;
    float _562 = fma(_540, _432, _520);
    float _564 = fma(_548, _396, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _566 = fma(_552, _396, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _568 = fma(_542, _432, _544);
    float _570 = fma(_560, _396, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _572 = fma(_554, _432, _556);
    float _574 = fma(_564, _402, _562);
    float _576 = fma(_566, _402, _568);
    float _578 = fma(_570, _402, _572);
    float _580 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[148].x, _574);
    float _582 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[148].y, _576);
    float _584 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[148].z, _578);
    bool _586 = !_330;
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
    float _658 = 1.0 / _636;
    float _660 = -_632;
    float _662 = _660 + 1.0;
    bool _664 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _666 = _648 * _662;
    float _668 = -_648;
    float _670 = _668 + 1.0;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _674 = _652 * _658;
    float _676 = _672 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _678 = fma(_674, _656, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _680 = _678 * _666;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _684 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[115].x, _680);
    float _686 = _580 * _616;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _690 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[116].x, _684);
    float _694 = _584 * _620;
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _582 * _618;
    float _700 = _692 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.x = _696;
    out.m_37.y = _690;
    out.m_37.z = _676;
    out.m_37.w = _700;
    bool _702 = !_664;
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
    float _738 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _740 = in.m_35.z;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _744 = _742 != 0;
    float _746 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _748 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _750 = int(_748);
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _754 = _752 != 0;
    float _756 = _694 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _760 = _758 != 0;
    float _762 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _764 = int(_762);
    float _766 = float(_734);
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _772 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _774 = isnan(_730);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _780 = _776 || _778;
    float _782 = float(_780);
    float _784 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _786 = int(_784);
    float _788 = float(_750);
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _792 = _740 > 0.5;
    float _794 = 1.0 / _766;
    float _796 = float(_764);
    float _798 = float(uint(_786));
    float _800 = 1.0 / _796;
    float _802 = in.m_35.y;
    int _804 = ~_786;
    int _806 = _804 + 1;
    float _808 = _794 * _112;
    float _810 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _812 = int(_810);
    float _814 = 1.0 / _788;
    float _816 = _800 * _112;
    float _818 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _820 = int(_818);
    float _822 = float(uint(_812));
    float _824 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[88].w, _790);
    int _826 = ~_812;
    int _828 = _826 + 1;
    float _830 = 1.0 / _798;
    float _832 = _814 * _112;
    float _834 = trunc(_808);
    int _836 = int(_834);
    float _838 = float(uint(_820));
    int _840 = ~_820;
    int _842 = _840 + 1;
    int _844 = ~_820;
    int _846 = _844 + 1;
    int _848 = ~_820;
    int _850 = _848 + 1;
    float _852 = 1.0 / _822;
    int _854 = as_type<int>(_830) + (-2);
    float _856 = float(uint(_836));
    float _858 = trunc(_816);
    int _860 = int(_858);
    float _862 = as_type<float>(_854) * _856;
    float _864 = _856;
    float _866 = _838;
    bool _868 = _744;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_744)
    {
        _864 = _736;
    }
    float _872 = _864;
    int _874 = as_type<int>(_852) + (-2);
    float _876 = 1.0 / _838;
    float _878 = _872;
    if (!_744)
    {
        _878 = _802;
    }
    float _880 = _878;
    float _882 = trunc(_832);
    int _884 = int(_882);
    float _886 = _880;
    if (_744)
    {
        _866 = 1.0;
    }
    float _888 = _866;
    float _890 = _888;
    if (!_744)
    {
        _890 = 7.345489978790283203125;
    }
    float _892 = _890;
    float _894 = float(uint(_860));
    float _896 = trunc(_862);
    float _898 = precise::max(_896, 0.0);
    uint _901 = uint(_898);
    float _903 = _892 * _736;
    int _905 = as_type<int>(_876) + (-2);
    float _907 = as_type<float>(_874) * _894;
    float _909 = _892;
    if (_744)
    {
        _909 = 1.0;
    }
    float _911 = _909;
    float _913 = _911;
    if (!_744)
    {
        _913 = 1.2345600128173828125;
    }
    float _915 = _913;
    float _917 = float(uint(_884));
    float _919 = trunc(_907);
    float _921 = precise::max(_919, 0.0);
    uint _923 = uint(_921);
    int _925 = ~_786;
    int _927 = _925 + 1;
    float _929 = _915 * _880;
    float _931 = _915;
    if (_744)
    {
        _931 = 1.0;
    }
    float _933 = _931;
    float _935 = as_type<float>(_905) * _917;
    float _937 = _933;
    if (_744)
    {
        _886 = _736;
    }
    float _939 = _886;
    int _941 = _927 * int(_901);
    int _943 = _941 + _836;
    float _945 = _939;
    if (!_744)
    {
        _937 = 5.839270114898681640625;
    }
    float _947 = _937;
    float _949 = trunc(_935);
    float _951 = precise::max(_949, 0.0);
    uint _953 = uint(_951);
    if (!_744)
    {
        _945 = _740;
    }
    float _955 = _945;
    float _957 = float(uint(_943));
    float _959 = _957;
    if (_754)
    {
        bool _961 = _736 > 0.5;
        _868 = _961;
    }
    bool _963 = _868;
    float _965 = _947 * _955;
    float _967 = as_type<float>(_854) * _957;
    float _969 = in.m_39.x;
    float _971 = floor(_903);
    int _973 = _828 * int(_923);
    int _975 = _973 + _860;
    int _977 = _842 * int(_953);
    int _979 = _977 + _884;
    float _981 = float(uint(_975));
    float _983 = trunc(_967);
    float _985 = precise::max(_983, 0.0);
    uint _987 = uint(_985);
    float _989 = float(uint(_979));
    float _991 = as_type<float>(_874) * _981;
    float _993 = floor(_929);
    float _995 = as_type<float>(_905) * _989;
    float _997 = -_971;
    float _999 = _903 + _997;
    int _1001 = ~_786;
    int _1003 = _1001 + 1;
    int _1005 = _979;
    float _1007 = _967;
    float _1009 = _969;
    if (_754)
    {
        float _1011 = -_969;
        float _1013 = _1011 + 1.0;
        _1005 = as_type<int>(_1013);
    }
    int _1015 = _1005;
    int _1017 = int(_901) + int(_987);
    float _1019 = floor(_965);
    float _1021 = float(_78);
    int _1023 = _1015;
    if (!_754)
    {
        _959 = _969;
    }
    float _1025 = _959;
    float _1027 = _1025;
    if (_754)
    {
        float _1029 = _963 ? as_type<float>(_1015) : _969;
        _1027 = _1029;
    }
    float _1031 = _1027;
    if (_760)
    {
        float _1033 = -_969;
        float _1035 = _1033 + 1.0;
        _1023 = as_type<int>(_1035);
    }
    int _1037 = _1023;
    float _1039 = -_993;
    float _1041 = _929 + _1039;
    float _1043 = trunc(_991);
    float _1045 = precise::max(_1043, 0.0);
    uint _1047 = uint(_1045);
    if (!_760)
    {
        _1007 = _969;
    }
    float _1049 = _1007;
    float _1051 = _1049;
    if (_760)
    {
        float _1053 = _792 ? as_type<float>(_1037) : _969;
        _1051 = _1053;
    }
    float _1055 = _1051;
    int _1057 = _1003 * _1017;
    int _1059 = _1057 + _836;
    float _1061 = float(_786);
    float _1063 = trunc(_995);
    float _1065 = precise::max(_1063, 0.0);
    uint _1067 = uint(_1065);
    float _1069 = float(_836);
    bool _1071 = uint(_1059) >= uint(_786);
    float _1073 = _999 * _1061;
    bool _1075 = _1069 >= _1061;
    bool _1077 = isnan(_1069);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan(_1061);
    bool _1083 = _1079 || _1081;
    float _1085 = float(_1083);
    float _1087 = _1061 * _112;
    float _1089 = float(_820);
    float _1091 = 1.0 / _1021;
    float _1093 = -_1019;
    float _1095 = _965 + _1093;
    int _1097 = ~_812;
    int _1099 = _1097 + 1;
    int _1101 = int(_923) + int(_1047);
    float _1103 = float(_884);
    int _1105 = int(_953) + int(_1067);
    float _1107 = _1089 * _1041;
    float _1109 = float(_812);
    float _1111 = trunc(_1073);
    int _1113 = int(_1111);
    float _1115 = float(_860);
    int _1117 = _846 * _1105;
    int _1119 = _1117 + _884;
    int _1121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1123 = _1121 != 0;
    float _1125 = _1091 * _112;
    float _1127 = _1087 * _1091;
    float _1129 = trunc(_1085);
    int _1131 = int(_1129);
    bool _1133 = _1103 >= _1089;
    bool _1135 = isnan(_1103);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan(_1089);
    bool _1141 = _1137 || _1139;
    float _1143 = float(_1141);
    float _1145 = _1089 * _1125;
    float _1147 = _1109 * _1125;
    bool _1149 = _1115 >= _1109;
    bool _1151 = isnan(_1115);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(_1109);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = _1109 * _1095;
    bool _1163 = !_1071;
    int _1165 = _1163 ? 0 : (-1);
    int _1167 = _1099 * _1101;
    int _1169 = _1167 + _860;
    bool _1171 = uint(_1119) >= uint(_820);
    float _1173 = trunc(_1107);
    int _1175 = int(_1173);
    bool _1177 = !_1123;
    int _1179 = _1177 ? 0 : 1;
    int _1181 = ~_1017;
    int _1183 = _1181 + _1165;
    int _1185 = _1183 + 1;
    bool _1187 = !_1171;
    int _1189 = _1187 ? 0 : (-1);
    int _1191 = abs(_1179);
    float _1193 = trunc(_1143);
    int _1195 = int(_1193);
    bool _1197 = uint(_1169) >= uint(_812);
    int _1199 = _1113 * _1191;
    int _1201 = _1199 + _836;
    int _1203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1205 = _1203 != 0;
    int _1207 = _786 * _1185;
    int _1209 = _1207 + _836;
    int _1211 = ~_1105;
    int _1213 = _1211 + _1189;
    int _1215 = _1213 + 1;
    float _1217 = trunc(_1159);
    int _1219 = int(_1217);
    int _1221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1223 = _1221 != 0;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1227 = _1225 != 0;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1231 = _1229 != 0;
    bool _1233 = !_1205;
    int _1235 = _1233 ? 0 : 1;
    int _1237 = _820 * _1215;
    int _1239 = _1237 + _884;
    bool _1241 = _786 == 0;
    bool _1243 = _820 == 0;
    float _1245 = trunc(_1127);
    int _1247 = int(_1245);
    int _1249 = abs(_1235);
    bool _1251 = !_1197;
    int _1253 = _1251 ? 0 : (-1);
    int _1255 = ~_1131;
    int _1257 = _1255 + 1;
    int _1259 = _1257 + 1;
    int _1261 = _1175 * _1249;
    int _1263 = _1261 + _884;
    bool _1265 = !_1241;
    int _1267 = _1265 ? _1209 : (-1);
    float _1269 = trunc(_1145);
    int _1271 = int(_1269);
    int _1273 = ~_1195;
    int _1275 = _1273 + 1;
    int _1277 = _1275 + 1;
    bool _1279 = !_1243;
    int _1281 = _1279 ? _1239 : (-1);
    int _1283 = _1267 * _1259;
    int _1285 = ~_1101;
    int _1287 = _1285 + _1253;
    int _1289 = _1287 + 1;
    int _1291 = _786 + (-1);
    int _1293 = _1277 * _1281;
    bool _1295 = !_1227;
    int _1297 = _1295 ? 0 : 1;
    int _1299 = _812 * _1289;
    int _1301 = _1299 + _860;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1305 = _1303 != 0;
    int _1307 = _1131 * _1291;
    int _1309 = _1307 + _1283;
    bool _1311 = _812 == 0;
    bool _1313 = !_1223;
    int _1315 = _1313 ? 0 : 1;
    int _1317 = abs(_1297);
    bool _1319 = !_1305;
    int _1321 = _1319 ? 0 : 1;
    int _1323 = ~_1219;
    int _1325 = _1323 + 1;
    int _1327 = _1325 + 1;
    int _1329 = _1309 * _1317;
    bool _1331 = !_1311;
    int _1333 = _1331 ? _1301 : (-1);
    int _1335 = abs(_1315);
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1339 = _1337 != 0;
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1343 = _1341 != 0;
    int _1345 = _1327 * _1333;
    int _1347 = _820 + (-1);
    int _1349 = _1247 * _1335;
    int _1351 = _1349 + _1329;
    bool _1353 = !_1231;
    int _1355 = _1353 ? 0 : 1;
    bool _1357 = !_1343;
    int _1359 = _1357 ? 0 : 1;
    int _1361 = _1195 * _1347;
    int _1363 = _1361 + _1293;
    int _1365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1367 = _1365 != 0;
    float _1369 = trunc(_1161);
    int _1371 = int(_1369);
    int _1373 = abs(_1355);
    int _1375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1377 = _1375 != 0;
    int _1379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1381 = _1379 != 0;
    int _1383 = abs(_1359);
    int _1385 = _1201 * _1373;
    int _1387 = _1385 + _1351;
    bool _1389 = !_1367;
    int _1391 = _1389 ? 0 : 1;
    int _1393 = abs(_1321);
    int _1395 = _1363 * _1383;
    int _1397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1399 = _1397 != 0;
    int _1401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1403 = _1401 != 0;
    bool _1405 = !_1339;
    int _1407 = _1405 ? 0 : 1;
    int _1409 = _1113 * _1393;
    int _1411 = _1409 + _1387;
    int _1413 = abs(_1391);
    int _1415 = abs(_1407);
    bool _1417 = !_1403;
    int _1419 = _1417 ? 0 : 1;
    int _1421 = _1371 * _1413;
    int _1423 = _1421 + _860;
    int _1425 = _812 + (-1);
    int _1427 = _1271 * _1415;
    int _1429 = _1427 + _1395;
    int _1431 = abs(_1419);
    float _1433 = trunc(_1147);
    int _1435 = int(_1433);
    bool _1437 = !_1399;
    int _1439 = _1437 ? 0 : 1;
    int _1441 = _1219 * _1425;
    int _1443 = _1441 + _1345;
    float _1445 = float(uint(_1411));
    float _1447 = in.m_39.y;
    bool _1449 = !_1377;
    int _1451 = _1449 ? 0 : 1;
    int _1453 = _1443 * _1431;
    int _1455 = abs(_1439);
    float _1457 = as_type<float>(_854) * _1445;
    int _1459 = abs(_1451);
    bool _1461 = !_1381;
    int _1463 = _1461 ? 0 : 1;
    float _1465 = trunc(_1457);
    float _1467 = precise::max(_1465, 0.0);
    uint _1469 = uint(_1467);
    int _1471 = abs(_1463);
    int _1473 = _1263 * _1459;
    int _1475 = _1473 + _1429;
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1479 = _1477 != 0;
    int _1481 = ~_786;
    int _1483 = _1481 + 1;
    int _1485 = _1435 * _1455;
    int _1487 = _1485 + _1453;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1491 = _1489 != 0;
    float _1493 = in.m_35.w;
    int _1495 = _1175 * _1471;
    int _1497 = _1495 + _1475;
    bool _1499 = !_1479;
    int _1501 = _1499 ? 0 : 1;
    int _1503 = _1483 * int(_1469);
    int _1505 = _1503 + _1411;
    bool _1507 = !_1491;
    int _1509 = _1507 ? 0 : 1;
    float _1511 = float(uint(_1497));
    int _1513 = abs(_1501);
    float _1515 = -_1447;
    float _1517 = _1515 + 1.0;
    int _1519 = abs(_1509);
    float _1521 = as_type<float>(_905) * _1511;
    float _1523 = float(uint(_1505));
    bool _1525 = _802 > 0.5;
    float _1527 = trunc(_1521);
    float _1529 = precise::max(_1527, 0.0);
    uint _1531 = uint(_1529);
    int _1533 = _1423 * _1513;
    int _1535 = _1533 + _1487;
    float _1537 = as_type<float>(_854) * _1523;
    int _1539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1541 = _1539 != 0;
    int _1543 = _1525 ? as_type<int>(_1517) : as_type<int>(_1447);
    float _1545 = trunc(_1537);
    float _1547 = precise::max(_1545, 0.0);
    uint _1549 = uint(_1547);
    int _1551 = _1371 * _1519;
    int _1553 = _1551 + _1535;
    int _1555 = ~_786;
    int _1557 = _1555 + 1;
    float _1559 = _1541 ? as_type<float>(_1543) : _1447;
    bool _1561 = _1493 > 0.5;
    int _1563 = ~_820;
    int _1565 = _1563 + 1;
    int _1567 = _1561 ? as_type<int>(_1517) : as_type<int>(_1447);
    float _1569 = float(uint(_1553));
    int _1571 = _1565 * int(_1531);
    int _1573 = _1571 + _1497;
    int _1575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1577 = _1575 != 0;
    int _1579 = int(_1469) + int(_1549);
    float _1581 = as_type<float>(_874) * _1569;
    float _1583 = _1577 ? as_type<float>(_1567) : _1447;
    int _1585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1587 = _1585 != 0;
    float _1589 = trunc(_1581);
    float _1591 = precise::max(_1589, 0.0);
    uint _1593 = uint(_1591);
    float _1595 = float(uint(_1573));
    bool _1597 = _740 > 0.5;
    float _1599 = as_type<float>(_905) * _1595;
    int _1601 = ~_812;
    int _1603 = _1601 + 1;
    int _1605 = _1557 * _1579;
    int _1607 = _1605 + _1411;
    bool _1609 = _812 == 0;
    float _1611 = trunc(_1599);
    float _1613 = precise::max(_1611, 0.0);
    uint _1615 = uint(_1613);
    float _1617 = _1447;
    int _1619 = _1411;
    if (_1587)
    {
        float _1621 = _1597 ? _1517 : _1447;
        _1617 = _1621;
    }
    float _1623 = _1617;
    bool _1625 = uint(_1607) >= uint(_786);
    int _1627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1629 = _1627 != 0;
    int _1631 = _1603 * int(_1593);
    int _1633 = _1631 + _1553;
    bool _1635 = !_1625;
    int _1637 = _1635 ? 0 : (-1);
    int _1639 = ~_820;
    int _1641 = _1639 + 1;
    int _1643 = ~_1579;
    int _1645 = _1643 + _1637;
    int _1647 = _1645 + 1;
    float _1649 = float(uint(_1633));
    bool _1651 = _786 == 0;
    int _1653 = _786 * _1647;
    int _1655 = _1653 + _1411;
    int _1657 = int(_1531) + int(_1615);
    float _1659 = as_type<float>(_874) * _1649;
    float _1661 = as_type<float>(_1657);
    if (_1629)
    {
        float _1663 = -_969;
        float _1665 = _1663 + 1.0;
        _1619 = as_type<int>(_1665);
    }
    int _1667 = _1619;
    bool _1669 = !_1651;
    int _1671 = _1669 ? _1655 : (-1);
    float _1673 = trunc(_1659);
    float _1675 = precise::max(_1673, 0.0);
    uint _1677 = uint(_1675);
    if (_1629)
    {
        float _1679 = _1525 ? as_type<float>(_1667) : _969;
        _1009 = _1679;
    }
    float _1681 = _1009;
    int _1683 = _1641 * _1657;
    int _1685 = _1683 + _1497;
    int _1687 = _1671 & 3;
    bool _1689 = _1687 != 0;
    int _1691 = _1671 & 3;
    bool _1693 = _1691 != 0;
    bool _1695 = uint(_1687) >= 2u;
    int _1697 = _1693 ? 0 : 1;
    bool _1699 = uint(_1685) >= uint(_820);
    int _1701 = _1695 ? 0 : 1;
    bool _1703 = uint(_1687) > 1u;
    bool _1705 = !_1699;
    int _1707 = _1705 ? 0 : (-1);
    int _1709 = ~_812;
    int _1711 = _1709 + 1;
    bool _1713 = _1687 != 3;
    int _1715 = int(_1593) + int(_1677);
    int _1717 = ~_1657;
    int _1719 = _1717 + _1707;
    int _1721 = _1719 + 1;
    bool _1723 = _820 == 0;
    int _1725 = _820 * _1721;
    int _1727 = _1725 + _1497;
    int _1729 = ~_1697;
    int _1731 = _1729 + 1;
    int _1733 = _1731 + 1;
    int _1735 = _1711 * _1715;
    int _1737 = _1735 + _1553;
    int _1739 = _1733;
    if (!_1703)
    {
        int _1741 = ~_1697;
        int _1743 = _1741 + 1;
        _1739 = _1743;
    }
    int _1745 = _1739;
    int _1747 = ~_1701;
    int _1749 = _1747 + 1;
    int _1751 = _1749 + 1;
    int _1753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1755 = _1753 != 0;
    bool _1757 = !_1723;
    int _1759 = _1757 ? _1727 : (-1);
    int _1761 = _1751;
    if (_1713)
    {
        int _1763 = ~_1701;
        int _1765 = _1763 + 1;
        _1761 = _1765;
    }
    int _1767 = _1761;
    bool _1769 = uint(_1737) >= uint(_812);
    float _1771 = _736 * 2.0;
    bool _1773 = !_1755;
    int _1775 = _1773 ? 0 : 1;
    int _1777 = _1759 & 3;
    bool _1779 = _1777 != 0;
    float _1781 = floor(_1771);
    bool _1783 = !_1769;
    int _1785 = _1783 ? 0 : (-1);
    int _1787 = _1779 ? 0 : 1;
    bool _1789 = _1777 != 3;
    int _1791 = ~_1715;
    int _1793 = _1791 + _1785;
    int _1795 = _1793 + 1;
    bool _1797 = uint(_1777) >= 2u;
    float _1799 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1801 = log2(_1799);
    int _1803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1805 = _1803 != 0;
    int _1807 = _812 * _1795;
    int _1809 = _1807 + _1553;
    int _1811 = _1797 ? 0 : 1;
    bool _1813 = uint(_1777) > 1u;
    bool _1815 = !_1609;
    int _1817 = _1815 ? _1809 : (-1);
    int _1819 = ~_1811;
    int _1821 = _1819 + 1;
    int _1823 = _1821 + 1;
    int _1825 = _1823;
    int _1827 = _1811;
    float _1829 = _1771;
    if (_1789)
    {
        int _1831 = ~_1811;
        int _1833 = _1831 + 1;
        _1825 = _1833;
    }
    int _1835 = _1825;
    int _1837 = _1817 & 3;
    bool _1839 = _1837 != 0;
    int _1841 = ~_1787;
    int _1843 = _1841 + 1;
    int _1845 = _1843 + 1;
    bool _1847 = _1837 != 3;
    int _1849 = _1845;
    if (!_1813)
    {
        int _1851 = ~_1787;
        int _1853 = _1851 + 1;
        _1849 = _1853;
    }
    int _1855 = _1849;
    bool _1857 = uint(_1837) >= 2u;
    if (_1805)
    {
        _1827 = 0;
    }
    int _1859 = _1827;
    int _1861 = _1857 ? 0 : 1;
    int _1863 = _1859;
    if (_1805)
    {
        _870 = 0;
    }
    int _1865 = _870;
    int _1867 = _1865;
    if (!_1805)
    {
        _1863 = 1;
    }
    int _1869 = _1863;
    if (!_1805)
    {
        _1867 = 2;
    }
    int _1871 = _1867;
    int _1873 = ~_1861;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    int _1879 = _1877;
    if (_1847)
    {
        int _1881 = ~_1861;
        int _1883 = _1881 + 1;
        _1879 = _1883;
    }
    int _1885 = _1879;
    float _1887 = _802 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1889 = _1869 != 1;
    bool _1891 = _1871 != 2;
    float _1893 = _736 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1895 = _1839 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1897 = uint(_1837) > 1u;
    float _1899 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1901 = _1893;
    float _1903 = _1895;
    float _1905 = _1887;
    if (!_1889)
    {
        _1829 = _802;
    }
    float _1907 = _1829;
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1911 = -_1899;
    float _1913 = fma(_1893, 2.0, _1911);
    float _1915 = _1907;
    if (_1891)
    {
        _1901 = _736;
    }
    float _1917 = _1901;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1921 = _1917;
    if (!_1891)
    {
        _1921 = _740;
    }
    float _1923 = _1921;
    float _1925 = fma(_1887, -2.0, _1909);
    int _1927 = ~as_type<int>(_1895);
    int _1929 = _1927 + 1;
    int _1931 = _1929 + 1;
    int _1933 = _1931;
    if (!_1897)
    {
        int _1935 = ~as_type<int>(_1895);
        int _1937 = _1935 + 1;
        _1933 = _1937;
    }
    int _1939 = _1933;
    float _1941 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_1889)
    {
        _1903 = _740;
    }
    float _1943 = _1903;
    float _1945 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1925);
    float _1947 = _1943;
    if (!_1889)
    {
        _1661 = _1907;
    }
    float _1949 = _1661;
    float _1951 = -_1919;
    float _1953 = fma(_1941, 2.0, _1951);
    float _1955 = _1949;
    if (!_1889)
    {
        _1905 = _740;
    }
    float _1957 = _1905;
    float _1959 = _1801 * _112;
    float _1961 = _1957;
    float _1963 = _1959;
    if (_1889)
    {
        _1955 = _736;
    }
    float _1965 = _1955;
    float _1967 = -_112;
    float _1969 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1953);
    if (_1889)
    {
        _1915 = _736;
    }
    float _1971 = _1915;
    if (_1889)
    {
        _1947 = _802;
    }
    float _1973 = _1947;
    float _1975 = _1965 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1889)
    {
        _1961 = _802;
    }
    float _1977 = _1961;
    bool _1979 = _1781 > 0.0;
    float _1981 = -_770;
    float _1983 = fma(_1975, 2.0, _1981);
    bool _1985 = _1781 >= 0.0;
    bool _1987 = isnan(_1781);
    bool _1989 = _1985 || _1987;
    bool _1991 = isnan(0.0);
    bool _1993 = _1989 || _1991;
    float _1995 = float(uint(_1201));
    float _1997 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1999 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2001 = as_type<float>(_854) * _1995;
    float _2003 = exp2(_1959);
    float _2005 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1997);
    float _2007 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1999);
    float _2009 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2011 = float(uint(_1263));
    float _2013 = fma(_2009, -2.0, _768);
    float _2015 = float(uint(_1423));
    float _2017 = trunc(_2001);
    float _2019 = precise::max(_2017, 0.0);
    uint _2021 = uint(_2019);
    float _2023 = as_type<float>(_905) * _2011;
    if (_1891)
    {
        _1963 = _802;
    }
    float _2025 = _1963;
    float _2027 = _2025;
    if (!_1891)
    {
        _2027 = _736;
    }
    float _2029 = _2027;
    bool _2031 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2033 = isnan(0.0);
    bool _2035 = _2031 || _2033;
    bool _2037 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2039 = _2035 || _2037;
    float _2041 = -_2003;
    float _2043 = _2041 + 1.0;
    float _2045 = trunc(_2023);
    float _2047 = precise::max(_2045, 0.0);
    uint _2049 = uint(_2047);
    float _2051 = as_type<float>(_874) * _2015;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2055 = _2029 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2057 = _2039 ? _2043 : 0.0;
    int _2059 = ~_812;
    int _2061 = _2059 + 1;
    float _2063 = trunc(_2051);
    float _2065 = precise::max(_2063, 0.0);
    uint _2067 = uint(_2065);
    int _2069 = _806 * int(_2021);
    int _2071 = _2069 + _1201;
    float _2073 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2075 = 1.0 + _2073;
    bool _2077 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2079 = isnan(1.0);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2085 = _2081 || _2083;
    float _2087 = fma(_2055, -2.0, _2053);
    float _2089 = _802 * 2.0;
    float _2091 = float(uint(_2071));
    int _2093 = _850 * int(_2049);
    int _2095 = _2093 + _1263;
    float _2097 = 1.0 / _2075;
    int _2099 = abs(_1767);
    float _2101 = as_type<float>(_854) * _2091;
    float _2103 = float(uint(_2095));
    int _2105 = _2061 * int(_2067);
    int _2107 = _2105 + _1423;
    float _2109 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2111 = as_type<float>(_905) * _2103;
    float _2113 = trunc(_2101);
    float _2115 = precise::max(_2113, 0.0);
    uint _2117 = uint(_2115);
    float _2119 = float(uint(_2107));
    float _2121 = -_112;
    float _2123 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1983);
    int _2125 = abs(_1835);
    float _2127 = as_type<float>(_874) * _2119;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2131 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2109);
    float _2133 = floor(_2089);
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2137 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2129);
    float _2139 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2131);
    float _2141 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2005);
    float _2143 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2135);
    float _2145 = -_112;
    float _2147 = fma(_2145, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1913);
    float _2149 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2007);
    float _2151 = trunc(_2111);
    float _2153 = precise::max(_2151, 0.0);
    uint _2155 = uint(_2153);
    float _2157 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2143);
    float _2159 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2137);
    float _2161 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[87].w, _824);
    float _2163 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2013);
    int _2165 = _1993 ? 0 : 1;
    int _2167 = int(_2021) + int(_2117);
    float _2169 = trunc(_2127);
    float _2171 = precise::max(_2169, 0.0);
    uint _2173 = uint(_2171);
    float _2175 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2087);
    if (_2085)
    {
        float _2177 = _2057 * _2097;
        _114 = _2177;
    }
    float _2179 = _114;
    int _2181 = ~_786;
    int _2183 = _2181 + 1;
    float _2185 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _2187 = _2133 > 0.0;
    bool _2189 = _2133 >= 0.0;
    bool _2191 = isnan(_2133);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan(0.0);
    bool _2197 = _2193 || _2195;
    int _2199 = ~_820;
    int _2201 = _2199 + 1;
    int _2203 = int(_2049) + int(_2155);
    int _2205 = _2183 * _2167;
    int _2207 = _2205 + _1201;
    int _2209 = ~_812;
    int _2211 = _2209 + 1;
    int _2213 = ~_2165;
    int _2215 = _2213 + 1;
    int _2217 = _2215 + 1;
    int _2219 = int(_2067) + int(_2173);
    int _2221 = _2217;
    if (!_1979)
    {
        int _2223 = ~_2165;
        int _2225 = _2223 + 1;
        _2221 = _2225;
    }
    int _2227 = _2221;
    int _2229 = _2211 * _2219;
    int _2231 = _2229 + _1423;
    bool _2233 = uint(_2207) >= uint(_786);
    int _2235 = _2201 * _2203;
    int _2237 = _2235 + _1263;
    int _2239 = _2197 ? 0 : 1;
    float _2241 = _740 * 2.0;
    bool _2243 = !_2233;
    int _2245 = _2243 ? 0 : (-1);
    bool _2247 = uint(_2237) >= uint(_820);
    bool _2249 = uint(_2231) >= uint(_812);
    float _2251 = floor(_2241);
    int _2253 = ~_2239;
    int _2255 = _2253 + 1;
    int _2257 = _2255 + 1;
    int _2259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2261 = _2259 != 0;
    int _2263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2265 = _2263 != 0;
    int _2267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2269 = _2267 != 0;
    float _2271 = in.m_41.x;
    float _2273 = in.m_41.y;
    float _2275 = in.m_41.z;
    int _2277 = _2257;
    if (!_2187)
    {
        int _2279 = ~_2239;
        int _2281 = _2279 + 1;
        _2277 = _2281;
    }
    int _2283 = _2277;
    float _2285 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _2287 = !_2247;
    int _2289 = _2287 ? 0 : (-1);
    bool _2291 = !_2249;
    int _2293 = _2291 ? 0 : (-1);
    float _2295 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2285);
    int _2297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2299 = _2297 != 0;
    int _2301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2303 = _2301 != 0;
    float _2305 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _738);
    float _2307 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _746);
    bool _2309 = _2251 >= 0.0;
    bool _2311 = isnan(_2251);
    bool _2313 = _2309 || _2311;
    bool _2315 = isnan(0.0);
    bool _2317 = _2313 || _2315;
    float _2319 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2321 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2305);
    float _2323 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2307);
    float _2325 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2295);
    float _2327 = _2321 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2329 = _2317 ? 0 : 1;
    float _2331 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2333 = _2331 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2335 = _2251 > 0.0;
    float _2337 = _2325 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2339 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2273);
    float _2341 = 1.0 / _2333;
    float _2343 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2275);
    float _2345 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2271);
    float _2347 = _2319 * _2339;
    float _2349 = _756 * _2343;
    float _2351 = _736 + _740;
    float _2353 = _736 + _802;
    float _2355 = _2185 * _2345;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2357 = _2351 + (-1.0);
    int _2359 = ~_2329;
    int _2361 = _2359 + 1;
    int _2363 = _2361 + 1;
    float _2365 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2367 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2365;
    float _2369 = _2353 + (-1.0);
    int _2371 = _2363;
    if (!_2335)
    {
        int _2373 = ~_2329;
        int _2375 = _2373 + 1;
        _2371 = _2375;
    }
    int _2377 = _2371;
    float _2379 = -_2327;
    float _2381 = _2379 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2383 = fma(_2357, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2385 = _802 + _740;
    float _2387 = _2367 * _2341;
    float _2389 = _2323 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2391 = -_2337;
    float _2393 = _2391 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2395 = fma(_2369, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2397 = _2381 * _2381;
    float _2399 = in.m_43.x;
    float _2401 = in.m_43.y;
    float _2403 = in.m_43.z;
    float _2405 = _2385 + (-1.0);
    bool _2407 = _2273 != 0.0;
    bool _2409 = isnan(_2273);
    bool _2411 = _2407 || _2409;
    bool _2413 = isnan(0.0);
    bool _2415 = _2411 || _2413;
    float _2417 = -_2389;
    float _2419 = _2417 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2421 = fma(_2393, _2393, _2397);
    float _2423 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2425 = _730 + _2423;
    bool _2427 = _2271 == 0.0;
    bool _2429 = !_2415;
    bool _2431 = _2427 && _2429;
    float _2433 = fma(_2405, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2435 = fma(_2419, _2419, _2421);
    bool _2437 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2439 = isnan(_730);
    bool _2441 = _2437 || _2439;
    bool _2443 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2445 = _2441 || _2443;
    float _2447 = float(_2445);
    float _2449 = -_782;
    float _2451 = _2449 + 1.0;
    bool _2453 = !_2261;
    int _2455 = _2453 ? 0 : 1;
    float _2457 = fma(_2387, _2425, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2459 = _2275 == 0.0;
    bool _2461 = _2459 && _2431;
    float _2463 = rsqrt(_2435);
    float _2465 = _2447 * _2451;
    int _2467 = abs(_2455);
    float _2469 = _736 + (-0.5);
    float _2471 = in.m_45.x;
    float _2473 = in.m_45.y;
    float _2475 = in.m_45.z;
    float _2477 = _2457 * _2465;
    bool _2479 = !_2265;
    int _2481 = _2479 ? 0 : 1;
    float _2483 = -_2447;
    float _2485 = _2483 + 1.0;
    float _2487 = _802 + (-0.5);
    int _2489 = abs(_2481);
    float _2491 = fma(_2485, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2477);
    float _2493 = _2457;
    float _2495 = as_type<float>(_2377);
    if (_2461)
    {
        _2493 = _2399;
    }
    float _2497 = _2493;
    float _2499 = _740 + (-0.5);
    float _2501 = float(_2377);
    float _2503 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2491);
    float _2505 = float(_2467);
    float _2507 = _2393 * _2463;
    float _2509 = _2497;
    if (_2461)
    {
        _2495 = _2497;
    }
    float _2511 = _2495;
    float _2513 = _2511;
    if (!_2461)
    {
        _2509 = _2399;
    }
    float _2515 = _2509;
    float _2517 = _2505 * _2501;
    float _2519 = _2381 * _2463;
    float _2521 = float(_2227);
    float _2523 = _2419 * _2463;
    float _2525 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2527 = _2507 * _2525;
    float _2529 = float(_2489);
    float _2531 = _2517 * (-2.0);
    float _2533 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2535 = _2523 * _2533;
    float _2537 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2539 = -_2527;
    float _2541 = fma(_2523, _2537, _2539);
    float _2543 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2545 = _2519 * _2543;
    float _2547 = _2529 * _2521;
    float _2549 = fma(_2395, _2531, _2395);
    float _2551 = fma(_2531, _2471, _2471);
    float _2553 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2555 = -_2535;
    float _2557 = fma(_2519, _2553, _2555);
    float _2559 = _2541 * _2541;
    float _2561 = _2535;
    float _2563 = _2559;
    if (_2461)
    {
        _2561 = _2401;
    }
    float _2565 = _2561;
    float _2567 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2569 = -_2545;
    float _2571 = fma(_2507, _2567, _2569);
    bool _2573 = !_2269;
    int _2575 = _2573 ? 0 : 1;
    float _2577 = fma(_2557, _2557, _2559);
    float _2579 = _2565;
    if (_2461)
    {
        _2563 = _2565;
    }
    float _2581 = _2563;
    float _2583 = _2547 * (-2.0);
    float _2585 = _2581;
    if (!_2461)
    {
        _2579 = _2401;
    }
    float _2587 = _2579;
    float _2589 = fma(_2469, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2551);
    int _2591 = abs(_2575);
    float _2593 = fma(_2433, _2583, _2433);
    float _2595 = fma(_2583, _2473, _2473);
    float _2597 = fma(_2549, _2179, _2589);
    float _2599 = fma(_2571, _2571, _2577);
    float _2601 = float(_2283);
    float _2603 = _2597 * 0.15915493667125701904296875;
    float _2605 = float(_2591);
    float _2607 = fma(_2487, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2595);
    float _2609 = _2597;
    float _2611 = _2595;
    if (_2461)
    {
        _2609 = _2403;
    }
    float _2613 = _2609;
    float _2615 = rsqrt(_2599);
    float _2617 = _2613;
    if (!_2461)
    {
        float _2619 = fma(_2273, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2587);
        _2585 = _2619;
    }
    float _2621 = _2585;
    float _2623 = _2605 * _2601;
    if (_2461)
    {
        _2611 = _2613;
    }
    float _2625 = _2611;
    float _2627 = fma(_2593, _2179, _2607);
    float _2629 = _2625;
    if (!_2461)
    {
        _2617 = _2403;
    }
    float _2631 = _2617;
    if (!_2461)
    {
        float _2633 = fma(_2271, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2515);
        _2513 = _2633;
    }
    float _2635 = _2513;
    float _2637 = in.m_47.x;
    float _2639 = in.m_47.y;
    float _2641 = in.m_47.z;
    float _2643 = in.m_47.w;
    float _2645 = _2603 * 6.283185482025146484375;
    float _2647 = sin(_2645);
    float _2649 = _2623 * (-2.0);
    float _2651 = _2627 * 0.15915493667125701904296875;
    if (!_2461)
    {
        float _2653 = fma(_2275, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2631);
        _2629 = _2653;
    }
    float _2655 = _2629;
    float _2657 = fma(_2649, _2475, _2475);
    float _2659 = fma(_2383, _2649, _2383);
    float _2661 = _2603 * 6.283185482025146484375;
    float _2663 = cos(_2661);
    float _2665 = fma(_2499, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2657);
    float _2667 = _2541 * _2615;
    float _2669 = _2557 * _2615;
    float _2671 = fma(_2659, _2179, _2665);
    float _2673 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2675 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2677 = _2651 * 6.283185482025146484375;
    float _2679 = sin(_2677);
    float _2681 = _2671 * 0.15915493667125701904296875;
    float _2683 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2685 = _2503 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2687 = _2673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2689 = _2675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2691 = _2683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2693 = _2641 * _2515;
    float _2695 = _2651 * 6.283185482025146484375;
    float _2697 = cos(_2695);
    float _2699 = _2639 * _2631;
    float _2701 = _2637 * _2587;
    float _2703 = -_2693;
    float _2705 = fma(_2637, _2631, _2703);
    out.m_49.x = _2691;
    out.m_49.y = _2687;
    out.m_49.z = _2689;
    out.m_49.w = _2685;
    float _2707 = -_2699;
    float _2709 = fma(_2641, _2587, _2707);
    float _2711 = -_2701;
    float _2713 = fma(_2639, _2515, _2711);
    float _2715 = _2705 * _2643;
    float _2717 = _2681 * 6.283185482025146484375;
    float _2719 = cos(_2717);
    float _2721 = _2709 * _2643;
    float _2723 = _2713 * _2643;
    float _2725 = _2571 * _2615;
    float _2727 = _2647 * _2679;
    int _2729 = ~_2203;
    int _2731 = _2729 + _2289;
    int _2733 = _2731 + 1;
    int _2735 = ~_2219;
    int _2737 = _2735 + _2293;
    int _2739 = _2737 + 1;
    float _2741 = _2681 * 6.283185482025146484375;
    float _2743 = sin(_2741);
    float _2745 = _2663 * _2697;
    float _2747 = _2647 * _2697;
    float _2749 = _2663 * _2679;
    float _2751 = _2523 * _2667;
    float _2753 = _2507 * _2725;
    int _2755 = _812 * _2739;
    int _2757 = _2755 + _1423;
    bool _2759 = _786 == 0;
    float _2761 = _2697 * _2719;
    float _2763 = _2663 * _2719;
    float _2765 = _2647 * _2719;
    float _2767 = _2679 * _2719;
    int _2769 = _820 * _2733;
    int _2771 = _2769 + _1263;
    float _2773 = _2763 * _2347;
    float _2775 = fma(_2743, _2745, _2727);
    float _2777 = fma(_2743, _2727, _2745);
    float _2779 = -_2749;
    float _2781 = fma(_2743, _2747, _2779);
    float _2783 = _2519 * _2669;
    float _2785 = -_2747;
    float _2787 = fma(_2743, _2749, _2785);
    float _2789 = -_2751;
    float _2791 = fma(_2519, _2725, _2789);
    float _2793 = -_2753;
    float _2795 = fma(_2523, _2669, _2793);
    float _2797 = _2765 * _2347;
    float _2799 = -_2783;
    float _2801 = fma(_2507, _2667, _2799);
    float _2803 = -_2347;
    float _2805 = _2743 * _2803;
    float _2807 = fma(_2775, _2355, _2773);
    float _2809 = _2775 * _2791;
    float _2811 = fma(_2781, _2355, _2797);
    float _2813 = _2775 * _2801;
    float _2815 = _2763 * _2791;
    float _2817 = _2763 * _2795;
    float _2819 = _2763 * _2801;
    float _2821 = fma(_2761, _2355, _2805);
    float _2823 = fma(_2761, _2669, _2809);
    float _2825 = _2775 * _2795;
    float _2827 = fma(_2761, _2725, _2813);
    float _2829 = -_2743;
    float _2831 = fma(_2829, _2669, _2815);
    float _2833 = -_2743;
    float _2835 = fma(_2833, _2667, _2817);
    float _2837 = -_2743;
    float _2839 = fma(_2837, _2725, _2819);
    float _2841 = _2787 * _2791;
    float _2843 = _2787 * _2795;
    float _2845 = _2787 * _2801;
    float _2847 = fma(_2787, _2349, _2807);
    float _2849 = fma(_2761, _2667, _2825);
    float _2851 = fma(_2767, _2669, _2841);
    float _2853 = fma(_2767, _2349, _2821);
    float _2855 = fma(_2767, _2667, _2843);
    float _2857 = fma(_2767, _2725, _2845);
    int _2859 = ~_2167;
    int _2861 = _2859 + _2245;
    int _2863 = _2861 + 1;
    float _2865 = _2791 * _2847;
    int _2867 = _1671 >> 31;
    float _2869 = fma(_2777, _2507, _2851);
    float _2871 = fma(_2777, _2519, _2855);
    float _2873 = _2795 * _2847;
    float _2875 = _2801 * _2847;
    int _2877 = _2867 & 3;
    float _2879 = fma(_2669, _2853, _2865);
    float _2881 = fma(_2667, _2853, _2873);
    float _2883 = fma(_2725, _2853, _2875);
    int _2885 = _1671 + _2877;
    float _2887 = fma(_2777, _2349, _2811);
    int _2889 = _1759 >> 31;
    float _2891 = fma(_2781, _2507, _2823);
    float _2893 = fma(_2781, _2519, _2849);
    float _2895 = fma(_2781, _2523, _2827);
    int _2897 = _2885 >> 2;
    float _2899 = fma(_2765, _2507, _2831);
    float _2901 = fma(_2765, _2519, _2835);
    float _2903 = fma(_2765, _2523, _2839);
    int _2905 = _2889 & 3;
    float _2907 = fma(_2777, _2523, _2857);
    int _2909 = _1817 >> 31;
    float _2911 = _2899 * _2639;
    int _2913 = _2897 << 4;
    int _2915 = _2913 + 368;
    float _2917 = _2901 * _2621;
    int _2919 = _1759 + _2905;
    float _2921 = _2903 * _2621;
    int _2923 = _2909 & 3;
    uint _2925 = uint(int(uint(_2915) >> uint(2)));
    uint _2927 = uint(int(uint(int(_2925)) >> uint(2)));
    int _2929 = int(_2925) & 3;
    float _2931 = (*spvDescriptorSet0.vp_c9)._m0[int(_2927)][_2929];
    int _2933 = int(_2925) + 1;
    uint _2935 = uint(int(uint(_2933) >> uint(2)));
    int _2937 = _2933 & 3;
    float _2939 = (*spvDescriptorSet0.vp_c9)._m0[int(_2935)][_2937];
    int _2941 = _2919 >> 2;
    float _2943 = _2899 * _2621;
    int _2945 = _1817 + _2923;
    float _2947 = _2715 * _2899;
    int _2949 = _2941 << 4;
    int _2951 = _2949 + 512;
    float _2953 = _2901 * _2639;
    int _2955 = _2945 >> 2;
    float _2957 = _2715 * _2901;
    uint _2959 = uint(int(uint(_2951) >> uint(2)));
    uint _2961 = uint(int(uint(int(_2959)) >> uint(2)));
    int _2963 = int(_2959) & 3;
    float _2965 = (*spvDescriptorSet0.vp_c9)._m0[int(_2961)][_2963];
    int _2967 = int(_2959) + 1;
    uint _2969 = uint(int(uint(_2967) >> uint(2)));
    int _2971 = _2967 & 3;
    float _2973 = (*spvDescriptorSet0.vp_c9)._m0[int(_2969)][_2971];
    float _2975 = _2715 * _2903;
    int _2977 = _2955 << 4;
    int _2979 = _2977 + 656;
    float _2981 = fma(_2891, _2635, _2943);
    float _2983 = fma(_2891, _2637, _2911);
    float _2985 = fma(_2721, _2891, _2947);
    bool _2987 = !_1689;
    int _2989 = _2987 ? 0 : 1;
    int _2991 = _786 * _2863;
    int _2993 = _2991 + _1201;
    int _2995 = _1759 & 3;
    bool _2997 = _2995 != 0;
    uint _2999 = uint(int(uint(_2979) >> uint(2)));
    uint _3001 = uint(int(uint(int(_2999)) >> uint(2)));
    int _3003 = int(_2999) & 3;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[int(_3001)][_3003];
    int _3007 = int(_2999) + 1;
    uint _3009 = uint(int(uint(_3007) >> uint(2)));
    int _3011 = _3007 & 3;
    float _3013 = (*spvDescriptorSet0.vp_c9)._m0[int(_3009)][_3011];
    float _3015 = fma(_2893, _2637, _2953);
    float _3017 = fma(_2893, _2635, _2917);
    float _3019 = fma(_2895, _2635, _2921);
    float _3021 = fma(_2721, _2893, _2957);
    float _3023 = fma(_2721, _2895, _2975);
    float _3025 = fma(_2507, _2887, _2879);
    float _3027 = fma(_2519, _2887, _2881);
    int _3029 = _2915 + 8;
    uint _3031 = uint(int(uint(_3029) >> uint(2)));
    uint _3033 = uint(int(uint(int(_3031)) >> uint(2)));
    int _3035 = int(_3031) & 3;
    float _3037 = (*spvDescriptorSet0.vp_c9)._m0[int(_3033)][_3035];
    int _3039 = int(_3031) + 1;
    uint _3041 = uint(int(uint(_3039) >> uint(2)));
    int _3043 = _3039 & 3;
    float _3045 = (*spvDescriptorSet0.vp_c9)._m0[int(_3041)][_3043];
    float _3047 = fma(_2523, _2887, _2883);
    bool _3049 = !_2997;
    int _3051 = _3049 ? 0 : 1;
    float _3053 = _2337 + _3025;
    int _3055 = _1817 & 3;
    bool _3057 = _3055 != 0;
    float _3059 = _2327 + _3027;
    int _3061 = abs(_1745);
    float _3063 = _2389 + _3047;
    bool _3065 = !_3057;
    int _3067 = _3065 ? 0 : 1;
    float _3069 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _3071 = _1687 != 3;
    float _3073 = _2903 * _2639;
    int _3075 = _2951 + 8;
    uint _3077 = uint(int(uint(_3075) >> uint(2)));
    uint _3079 = uint(int(uint(int(_3077)) >> uint(2)));
    int _3081 = int(_3077) & 3;
    float _3083 = (*spvDescriptorSet0.vp_c9)._m0[int(_3079)][_3081];
    int _3085 = int(_3077) + 1;
    uint _3087 = uint(int(uint(_3085) >> uint(2)));
    int _3089 = _3085 & 3;
    float _3091 = (*spvDescriptorSet0.vp_c9)._m0[int(_3087)][_3089];
    int _3093 = ~_3061;
    int _3095 = _3093 + 1;
    int _3097 = _3095 + 1;
    float _3099 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3069);
    int _3101 = abs(_2989);
    float _3103 = fma(_2895, _2637, _3073);
    int _3105 = abs(_1855);
    float _3107 = fma(_3063, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3099);
    int _3109 = abs(_3051);
    float _3111 = fma(_2869, _2641, _2983);
    int _3113 = ~_3105;
    int _3115 = _3113 + 1;
    int _3117 = _3115 + 1;
    int _3119 = _3097 * as_type<int>(_2939);
    int _3121 = ~_3101;
    int _3123 = _3121 + 1;
    int _3125 = _3123 + 1;
    float _3127 = _3107 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    int _3129 = abs(_1939);
    float _3131 = fma(_2871, _2641, _3015);
    int _3133 = _2979 + 8;
    uint _3135 = uint(int(uint(_3133) >> uint(2)));
    uint _3137 = uint(int(uint(int(_3135)) >> uint(2)));
    int _3139 = int(_3135) & 3;
    float _3141 = (*spvDescriptorSet0.vp_c9)._m0[int(_3137)][_3139];
    int _3143 = int(_3135) + 1;
    uint _3145 = uint(int(uint(_3143) >> uint(2)));
    int _3147 = _3143 & 3;
    float _3149 = (*spvDescriptorSet0.vp_c9)._m0[int(_3145)][_3147];
    int _3151 = _3125 * as_type<int>(_2931);
    int _3153 = _3151 + _3119;
    float _3155 = fma(_2907, _2641, _3103);
    int _3157 = ~_3109;
    int _3159 = _3157 + 1;
    int _3161 = _3159 + 1;
    int _3163 = _3117 * as_type<int>(_2973);
    int _3165 = ~_3129;
    int _3167 = _3165 + 1;
    int _3169 = _3167 + 1;
    float _3171 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3173 = int(_3171);
    int _3175 = ~_2099;
    int _3177 = _3175 + 1;
    int _3179 = _3177 + 1;
    int _3181 = _3161 * as_type<int>(_2965);
    int _3183 = _3181 + _3163;
    bool _3185 = !_3071;
    int _3187 = _3185 ? 0 : (-1);
    out.m_51.x = _3111;
    out.m_51.y = _3131;
    out.m_51.z = _3155;
    bool _3189 = _1777 != 3;
    int _3191 = _3169 * as_type<int>(_3013);
    int _3193 = abs(_1885);
    float _3195 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3197 = int(_3195);
    bool _3199 = !_3189;
    int _3201 = _3199 ? 0 : (-1);
    int _3203 = ~_2125;
    int _3205 = _3203 + 1;
    int _3207 = _3205 + 1;
    int _3209 = _3179 * as_type<int>(_3037);
    int _3211 = _3209 + _3153;
    int _3213 = abs(_3187);
    int _3215 = abs(_3067);
    int _3217 = abs(_3201);
    int _3219 = ~_3213;
    int _3221 = _3219 + 1;
    int _3223 = _3221 + 1;
    float _3225 = float(uint(_3197));
    int _3227 = _3207 * as_type<int>(_3083);
    int _3229 = _3227 + _3183;
    int _3231 = ~_3217;
    int _3233 = _3231 + 1;
    int _3235 = _3233 + 1;
    int _3237 = _3223 * as_type<int>(_3045);
    int _3239 = _3237 + _3211;
    bool _3241 = !_2299;
    int _3243 = _3241 ? 0 : 1;
    float _3245 = 1.0 / _3225;
    int _3247 = ~_3215;
    int _3249 = _3247 + 1;
    int _3251 = _3249 + 1;
    int _3253 = _3235 * as_type<int>(_3091);
    int _3255 = _3253 + _3229;
    int _3257 = abs(_1775);
    int _3259 = abs(_3243);
    int _3261 = _3251 * as_type<int>(_3005);
    int _3263 = _3261 + _3191;
    int _3265 = ~_3257;
    int _3267 = _3265 + 1;
    int _3269 = _3267 + 1;
    float _3271 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3273 = int(_3271);
    bool _3275 = !_2759;
    int _3277 = _3275 ? _2993 : (-1);
    bool _3279 = _1837 != 3;
    int _3281 = _3239 * _3269;
    float _3283 = float(uint(_3173));
    bool _3285 = !_2303;
    int _3287 = _3285 ? 0 : 1;
    int _3289 = _3277 * _3257;
    int _3291 = _3289 + _3281;
    bool _3293 = !_3279;
    int _3295 = _3293 ? 0 : (-1);
    float _3297 = 1.0 / _3283;
    int _3299 = abs(_3295);
    int _3301 = abs(_3287);
    int _3303 = ~_3193;
    int _3305 = _3303 + 1;
    int _3307 = _3305 + 1;
    float _3309 = float(uint(_3273));
    int _3311 = _3307 * as_type<int>(_3141);
    int _3313 = _3311 + _3263;
    int _3315 = ~_3259;
    int _3317 = _3315 + 1;
    int _3319 = _3317 + 1;
    bool _3321 = _820 == 0;
    float _3323 = 1.0 / _3309;
    int _3325 = ~_3299;
    int _3327 = _3325 + 1;
    int _3329 = _3327 + 1;
    int _3331 = _3319 * _3255;
    bool _3333 = !_3321;
    int _3335 = _3333 ? _2771 : (-1);
    int _3337 = abs(_3173);
    int _3339 = _3329 * as_type<int>(_3149);
    int _3341 = _3339 + _3313;
    bool _3343 = _812 == 0;
    int _3345 = _3335 * _3259;
    int _3347 = _3345 + _3331;
    int _3349 = ~_3301;
    int _3351 = _3349 + 1;
    int _3353 = _3351 + 1;
    float _3355 = float(uint(_3337));
    bool _3357 = !_3343;
    int _3359 = _3357 ? _2757 : (-1);
    int _3361 = _3353 * _3341;
    int _3363 = abs(_3197);
    float _3365 = 1.0 / _3355;
    int _3367 = as_type<int>(_3245) + (-2);
    int _3369 = _3359 * _3301;
    int _3371 = _3369 + _3361;
    float _3373 = float(uint(_3347));
    int _3375 = as_type<int>(_3297) + (-2);
    float _3377 = float(uint(_3363));
    float _3379 = as_type<float>(_3367) * _3373;
    float _3381 = float(uint(_3291));
    int _3383 = abs(_3273);
    int _3385 = as_type<int>(_3323) + (-2);
    float _3387 = as_type<float>(_3375) * _3381;
    float _3389 = float(uint(_3371));
    float _3391 = 1.0 / _3377;
    float _3393 = float(uint(_3383));
    int _3395 = abs(_3291);
    float _3397 = as_type<float>(_3385) * _3389;
    int _3399 = as_type<int>(_3365) + (-2);
    float _3401 = float(uint(_3395));
    float _3403 = trunc(_3387);
    float _3405 = precise::max(_3403, 0.0);
    uint _3407 = uint(_3405);
    int _3409 = ~_3173;
    int _3411 = _3409 + 1;
    int _3413 = ~_3197;
    int _3415 = _3413 + 1;
    float _3417 = as_type<float>(_3399) * _3401;
    int _3419 = abs(_3371);
    float _3421 = fma(_2869, _2655, _2981);
    int _3423 = ~_3273;
    int _3425 = _3423 + 1;
    float _3427 = trunc(_3379);
    float _3429 = precise::max(_3427, 0.0);
    uint _3431 = uint(_3429);
    int _3433 = as_type<int>(_3391) + (-2);
    float _3435 = float(uint(_3419));
    bool _3437 = _3197 == 0;
    bool _3439 = _3197 == 0;
    float _3441 = 1.0 / _3393;
    int _3443 = _3411 * int(_3407);
    int _3445 = _3443 + _3291;
    float _3447 = float(uint(_3445));
    float _3449 = trunc(_3397);
    float _3451 = precise::max(_3449, 0.0);
    uint _3453 = uint(_3451);
    int _3455 = abs(_3347);
    int _3457 = _3415 * int(_3431);
    int _3459 = _3457 + _3347;
    float _3461 = as_type<float>(_3375) * _3447;
    float _3463 = float(uint(_3455));
    float _3465 = float(uint(_3459));
    float _3467 = trunc(_3417);
    float _3469 = precise::max(_3467, 0.0);
    uint _3471 = uint(_3469);
    int _3473 = as_type<int>(_3441) + (-2);
    float _3475 = as_type<float>(_3433) * _3463;
    float _3477 = fma(_2871, _2655, _3017);
    float _3479 = as_type<float>(_3367) * _3465;
    int _3481 = ~_3337;
    int _3483 = _3481 + 1;
    int _3485 = _3425 * int(_3453);
    int _3487 = _3485 + _3371;
    float _3489 = fma(_2907, _2655, _3019);
    float _3491 = trunc(_3475);
    float _3493 = precise::max(_3491, 0.0);
    uint _3495 = uint(_3493);
    float _3497 = as_type<float>(_3473) * _3435;
    int _3499 = ~_3363;
    int _3501 = _3499 + 1;
    float _3503 = float(uint(_3487));
    out.m_53.x = _3421;
    out.m_53.y = _3477;
    out.m_53.z = _3489;
    float _3505 = trunc(_3497);
    float _3507 = precise::max(_3505, 0.0);
    uint _3509 = uint(_3507);
    float _3511 = as_type<float>(_3385) * _3503;
    int _3513 = ~_3383;
    int _3515 = _3513 + 1;
    float _3517 = trunc(_3461);
    float _3519 = precise::max(_3517, 0.0);
    uint _3521 = uint(_3519);
    float _3523 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3525 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3527 = _3483 * int(_3471);
    int _3529 = _3527 + _3395;
    float _3531 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3533 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3523);
    float _3535 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3525);
    float _3537 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3531);
    float _3539 = float(uint(_3529));
    int _3541 = _3501 * int(_3495);
    int _3543 = _3541 + _3455;
    float _3545 = fma(_3063, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3533);
    int _3547 = _3515 * int(_3509);
    int _3549 = _3547 + _3419;
    float _3551 = trunc(_3479);
    float _3553 = precise::max(_3551, 0.0);
    uint _3555 = uint(_3553);
    float _3557 = as_type<float>(_3399) * _3539;
    float _3559 = float(uint(_3543));
    float _3561 = _3545 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3563 = float(uint(_3549));
    float _3565 = fma(_3063, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3535);
    float _3567 = fma(_3063, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3537);
    float _3569 = as_type<float>(_3433) * _3559;
    float _3571 = trunc(_3557);
    float _3573 = precise::max(_3571, 0.0);
    uint _3575 = uint(_3573);
    float _3577 = _3561 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3579 = as_type<float>(_3473) * _3563;
    float _3581 = _3561 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3583 = _3561 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3585 = int(_3407) + int(_3521);
    float _3587 = _3561 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3589 = _3565 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3591 = trunc(_3511);
    float _3593 = precise::max(_3591, 0.0);
    uint _3595 = uint(_3593);
    float _3597 = fma(_3127, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3577);
    float _3599 = fma(_3127, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3587);
    float _3601 = fma(_3127, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3581);
    int _3603 = int(_3431) + int(_3555);
    float _3605 = fma(_3589, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3597);
    int _3607 = ~_3337;
    int _3609 = _3607 + 1;
    float _3611 = trunc(_3569);
    float _3613 = precise::max(_3611, 0.0);
    uint _3615 = uint(_3613);
    int _3617 = ~_3173;
    int _3619 = _3617 + 1;
    int _3621 = int(_3471) + int(_3575);
    int _3623 = ~_3273;
    int _3625 = _3623 + 1;
    int _3627 = _3619 * _3585;
    int _3629 = _3627 + _3291;
    float _3631 = trunc(_3579);
    float _3633 = precise::max(_3631, 0.0);
    uint _3635 = uint(_3633);
    float _3637 = fma(_3127, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3583);
    float _3639 = fma(_3589, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3601);
    bool _3641 = uint(_3629) >= uint(_3173);
    int _3643 = _3609 * _3621;
    int _3645 = _3643 + _3395;
    float _3647 = fma(_3589, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3637);
    int _3649 = int(_3453) + int(_3595);
    float _3651 = fma(_3589, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3599);
    int _3653 = int(_3495) + int(_3615);
    float _3655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3657 = ~_3363;
    int _3659 = _3657 + 1;
    int _3661 = _3625 * _3649;
    int _3663 = _3661 + _3371;
    int _3665 = ~_3197;
    int _3667 = _3665 + 1;
    int _3669 = ~_3383;
    int _3671 = _3669 + 1;
    int _3673 = _3659 * _3653;
    int _3675 = _3673 + _3455;
    bool _3677 = uint(_3663) >= uint(_3273);
    int _3679 = _3667 * _3603;
    int _3681 = _3679 + _3347;
    int _3683 = int(_3509) + int(_3635);
    bool _3685 = uint(_3675) >= uint(_3363);
    bool _3687 = uint(_3681) >= uint(_3197);
    int _3689 = _3671 * _3683;
    int _3691 = _3689 + _3419;
    bool _3693 = !_3641;
    int _3695 = _3693 ? 0 : (-1);
    bool _3697 = !_3677;
    int _3699 = _3697 ? 0 : (-1);
    bool _3701 = !_3687;
    int _3703 = _3701 ? 0 : (-1);
    int _3705 = ~_3585;
    int _3707 = _3705 + _3695;
    int _3709 = _3707 + 1;
    int _3711 = ~_3603;
    int _3713 = _3711 + _3703;
    int _3715 = _3713 + 1;
    int _3717 = ~_3649;
    int _3719 = _3717 + _3699;
    int _3721 = _3719 + 1;
    bool _3723 = _3173 == 0;
    float _3725 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3727 = _3173 == 0;
    int _3729 = _3197 * _3715;
    int _3731 = _3729 + _3347;
    int _3733 = _3291 ^ _3173;
    int _3735 = _3173 * _3709;
    int _3737 = _3735 + _3291;
    bool _3739 = uint(_3691) >= uint(_3383);
    int _3741 = _3273 * _3721;
    int _3743 = _3741 + _3371;
    int _3745 = _3347 ^ _3197;
    float _3747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3749 = !_3685;
    int _3751 = _3749 ? 0 : (-1);
    bool _3753 = !_3723;
    int _3755 = _3753 ? _3737 : (-1);
    bool _3757 = uint(_3645) >= uint(_3337);
    int _3759 = ~_3751;
    int _3761 = _3653 + _3759;
    int _3763 = _3761 + 1;
    float _3765 = _3655 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3767 = float(_3755);
    float _3769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3771 = !_3757;
    int _3773 = _3771 ? 0 : (-1);
    float _3775 = fma(_3765, _1031, -0.5);
    bool _3777 = _3273 == 0;
    float _3779 = fma(_3765, _3767, _2147);
    bool _3781 = _3273 == 0;
    float _3783 = _3747 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3785 = _3371 ^ _3273;
    float _3787 = fma(_2139, _3775, _3779);
    bool _3789 = !_3437;
    int _3791 = _3789 ? _3731 : (-1);
    float _3793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3795 = uint(int(uint(_3733) >> uint(31)));
    int _3797 = ~_3773;
    int _3799 = _3621 + _3797;
    int _3801 = _3799 + 1;
    float _3803 = _3725 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _3805 = uint(int(uint(_3745) >> uint(31)));
    bool _3807 = !_3777;
    int _3809 = _3807 ? _3743 : (-1);
    float _3811 = fma(_3803, _1055, -0.5);
    float _3813 = float(_3791);
    bool _3815 = !_3739;
    int _3817 = _3815 ? 0 : (-1);
    uint _3819 = uint(int(uint(_3785) >> uint(31)));
    float _3821 = fma(_3803, _3813, _2123);
    int _3823 = ~int(_3795);
    int _3825 = _3823 + 1;
    float _3827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3829 = ~int(_3805);
    int _3831 = _3829 + 1;
    float _3833 = fma(_3783, _1681, -0.5);
    float _3835 = float(_3809);
    float _3837 = fma(_2141, _3811, _3821);
    int _3839 = ~_3817;
    int _3841 = _3683 + _3839;
    int _3843 = _3841 + 1;
    float _3845 = _3793 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3847 = ~int(_3819);
    int _3849 = _3847 + 1;
    float _3851 = fma(_3783, _3835, _1969);
    int _3853 = _3801 ^ _3825;
    float _3855 = _3769 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3857 = _3763 ^ _3831;
    float _3859 = fma(_2159, _3833, _3851);
    int _3861 = _3843 ^ _3849;
    float _3863 = fma(_2723, _2907, _3023);
    int _3865 = ~_3825;
    int _3867 = _3865 + _3853;
    int _3869 = _3867 + 1;
    float _3871 = _3827 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3873 = ~_3831;
    int _3875 = _3873 + _3857;
    int _3877 = _3875 + 1;
    int _3879 = ~_3849;
    int _3881 = _3879 + _3861;
    int _3883 = _3881 + 1;
    float _3885 = fma(_3871, _1623, -0.5);
    bool _3887 = !_3727;
    int _3889 = _3887 ? _3869 : (-1);
    bool _3891 = !_3439;
    int _3893 = _3891 ? _3877 : (-1);
    bool _3895 = !_3781;
    int _3897 = _3895 ? _3883 : (-1);
    float _3899 = float(_3889);
    float _3901 = float(_3893);
    float _3903 = fma(_1559, _3855, -0.5);
    float _3905 = float(_3897);
    float _3907 = -_1945;
    float _3909 = fma(_3855, _3899, _3907);
    float _3911 = fma(_1583, _3845, -0.5);
    float _3913 = -_2163;
    float _3915 = fma(_3845, _3901, _3913);
    float _3917 = _3837 + 0.5;
    float _3919 = -_2175;
    float _3921 = fma(_3871, _3905, _3919);
    float _3923 = fma(_2157, _3903, _3909);
    float _3925 = fma(_2149, _3911, _3915);
    float _3927 = _3567 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3929 = fma(_2161, _3885, _3921);
    float _3931 = fma(_2723, _2869, _2985);
    float _3933 = fma(_2723, _2871, _3021);
    float _3935 = fma(_3927, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3605);
    float _3937 = fma(_3927, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3639);
    float _3939 = fma(_3927, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3647);
    float _3941 = fma(_3927, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3651);
    float _3943 = _3859 + 0.5;
    float _3945 = _3787 + 0.5;
    float _3947 = _3923 + 0.5;
    float _3949 = _3925 + 0.5;
    float _3951 = _3929 + 0.5;
    out.m_55.x = _3931;
    out.m_55.y = _3933;
    out.m_55.z = _3863;
    out.gl_Position.x = _3937;
    out.gl_Position.y = _3935;
    out.gl_Position.z = _3939;
    out.gl_Position.w = _3941;
    out.m_57.x = _3945;
    out.m_57.y = _3947;
    out.m_57.z = _3917;
    out.m_57.w = _3949;
    out.m_59.x = _3943;
    out.m_59.y = _3951;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _4008 = as_type<float>(_94);
        out.gl_Position.z = _4008;
    }
    if (!_82)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _98 = in.m_31.w;
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
        out.m_29.x = 0.0;
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
        float _4078 = as_type<float>(_132);
        out.gl_Position.z = _4078;
    }
    if (_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _312 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _314 = isnan(_284);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = 1.0 / _296;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = _284 + _326;
    bool _330 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _332 = 1.0 / _300;
    float _334 = _328 * _306;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _338 = _284 + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _342 = _284 + _340;
    float _344 = 1.0 / _310;
    float _346 = _288 * _324;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _350 = _284 + _348;
    bool _352 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _354 = isnan(_284);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = 1.0 / _304;
    float _366 = _338 * _332;
    bool _368 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _370 = isnan(_284);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    bool _380 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _382 = isnan(_284);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = -_378;
    float _394 = _392 + 1.0;
    float _396 = _350 * _344;
    float _398 = -_322;
    float _400 = _398 + 1.0;
    float _402 = _378 * _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _404;
    float _408 = _342 * _364;
    bool _410 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _412 = isnan(_284);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _426;
    float _430 = fma(_406, _334, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _432 = _420 * _394;
    float _434 = fma(_424, _334, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _436 = fma(_428, _334, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _438 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _440 = isnan(_284);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -_362;
    float _452 = _450 + 1.0;
    float _454 = -_420;
    float _456 = _454 + 1.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _462 = _448 * _452;
    float _464 = -_448;
    float _466 = _464 + 1.0;
    float _468 = _362 * _456;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _478 = _390 * _466;
    float _480 = -_390;
    float _482 = _480 + 1.0;
    float _484 = fma(_460, _346, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _486 = fma(_472, _346, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _488 = _430 * _478;
    float _490 = fma(_476, _346, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _492 = _434 * _478;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _494;
    float _498 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[143].x, _488);
    float _500 = _436 * _478;
    float _502 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[143].y, _492);
    float _504 = fma(_496, _366, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _506 = fma(_484, _462, _498);
    float _508 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[143].z, _500);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _514;
    float _518 = fma(_486, _462, _502);
    float _520 = fma(_504, _468, _506);
    float _522 = fma(_490, _462, _508);
    float _524 = fma(_512, _366, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _534 = fma(_516, _366, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _540 = fma(_528, _408, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _542 = fma(_532, _408, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _544 = fma(_524, _468, _518);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _550;
    float _554 = fma(_538, _408, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _556 = fma(_534, _468, _522);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _558;
    float _562 = fma(_540, _432, _520);
    float _564 = fma(_548, _396, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _566 = fma(_552, _396, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _568 = fma(_542, _432, _544);
    float _570 = fma(_560, _396, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _572 = fma(_554, _432, _556);
    float _574 = fma(_564, _402, _562);
    float _576 = fma(_566, _402, _568);
    float _578 = fma(_570, _402, _572);
    float _580 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[148].x, _574);
    float _582 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[148].y, _576);
    float _584 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[148].z, _578);
    bool _586 = !_330;
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
    float _658 = 1.0 / _636;
    float _660 = -_632;
    float _662 = _660 + 1.0;
    bool _664 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _666 = _648 * _662;
    float _668 = -_648;
    float _670 = _668 + 1.0;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _674 = _652 * _658;
    float _676 = _672 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _678 = fma(_674, _656, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _680 = _678 * _666;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _684 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[115].x, _680);
    float _686 = _580 * _616;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _690 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[116].x, _684);
    float _694 = _584 * _620;
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _582 * _618;
    float _700 = _692 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.x = _696;
    out.m_37.y = _690;
    out.m_37.z = _676;
    out.m_37.w = _700;
    bool _702 = !_664;
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
    float _738 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _740 = in.m_35.z;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _744 = _742 != 0;
    float _746 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _748 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _750 = int(_748);
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _754 = _752 != 0;
    float _756 = _694 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _760 = _758 != 0;
    float _762 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _764 = int(_762);
    float _766 = float(_734);
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _772 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _774 = isnan(_730);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _780 = _776 || _778;
    float _782 = float(_780);
    float _784 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _786 = int(_784);
    float _788 = float(_750);
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _792 = _740 > 0.5;
    float _794 = 1.0 / _766;
    float _796 = float(_764);
    float _798 = float(uint(_786));
    float _800 = 1.0 / _796;
    float _802 = in.m_35.y;
    int _804 = ~_786;
    int _806 = _804 + 1;
    float _808 = _794 * _112;
    float _810 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _812 = int(_810);
    float _814 = 1.0 / _788;
    float _816 = _800 * _112;
    float _818 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _820 = int(_818);
    float _822 = float(uint(_812));
    float _824 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[88].w, _790);
    int _826 = ~_812;
    int _828 = _826 + 1;
    float _830 = 1.0 / _798;
    float _832 = _814 * _112;
    float _834 = trunc(_808);
    int _836 = int(_834);
    float _838 = float(uint(_820));
    int _840 = ~_820;
    int _842 = _840 + 1;
    int _844 = ~_820;
    int _846 = _844 + 1;
    int _848 = ~_820;
    int _850 = _848 + 1;
    float _852 = 1.0 / _822;
    int _854 = as_type<int>(_830) + (-2);
    float _856 = float(uint(_836));
    float _858 = trunc(_816);
    int _860 = int(_858);
    float _862 = as_type<float>(_854) * _856;
    float _864 = _856;
    float _866 = _838;
    bool _868 = _744;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_744)
    {
        _864 = _736;
    }
    float _872 = _864;
    int _874 = as_type<int>(_852) + (-2);
    float _876 = 1.0 / _838;
    float _878 = _872;
    if (!_744)
    {
        _878 = _802;
    }
    float _880 = _878;
    float _882 = trunc(_832);
    int _884 = int(_882);
    float _886 = _880;
    if (_744)
    {
        _866 = 1.0;
    }
    float _888 = _866;
    float _890 = _888;
    if (!_744)
    {
        _890 = 7.345489978790283203125;
    }
    float _892 = _890;
    float _894 = float(uint(_860));
    float _896 = trunc(_862);
    float _898 = precise::max(_896, 0.0);
    uint _901 = uint(_898);
    float _903 = _892 * _736;
    int _905 = as_type<int>(_876) + (-2);
    float _907 = as_type<float>(_874) * _894;
    float _909 = _892;
    if (_744)
    {
        _909 = 1.0;
    }
    float _911 = _909;
    float _913 = _911;
    if (!_744)
    {
        _913 = 1.2345600128173828125;
    }
    float _915 = _913;
    float _917 = float(uint(_884));
    float _919 = trunc(_907);
    float _921 = precise::max(_919, 0.0);
    uint _923 = uint(_921);
    int _925 = ~_786;
    int _927 = _925 + 1;
    float _929 = _915 * _880;
    float _931 = _915;
    if (_744)
    {
        _931 = 1.0;
    }
    float _933 = _931;
    float _935 = as_type<float>(_905) * _917;
    float _937 = _933;
    if (_744)
    {
        _886 = _736;
    }
    float _939 = _886;
    int _941 = _927 * int(_901);
    int _943 = _941 + _836;
    float _945 = _939;
    if (!_744)
    {
        _937 = 5.839270114898681640625;
    }
    float _947 = _937;
    float _949 = trunc(_935);
    float _951 = precise::max(_949, 0.0);
    uint _953 = uint(_951);
    if (!_744)
    {
        _945 = _740;
    }
    float _955 = _945;
    float _957 = float(uint(_943));
    float _959 = _957;
    if (_754)
    {
        bool _961 = _736 > 0.5;
        _868 = _961;
    }
    bool _963 = _868;
    float _965 = _947 * _955;
    float _967 = as_type<float>(_854) * _957;
    float _969 = in.m_39.x;
    float _971 = floor(_903);
    int _973 = _828 * int(_923);
    int _975 = _973 + _860;
    int _977 = _842 * int(_953);
    int _979 = _977 + _884;
    float _981 = float(uint(_975));
    float _983 = trunc(_967);
    float _985 = precise::max(_983, 0.0);
    uint _987 = uint(_985);
    float _989 = float(uint(_979));
    float _991 = as_type<float>(_874) * _981;
    float _993 = floor(_929);
    float _995 = as_type<float>(_905) * _989;
    float _997 = -_971;
    float _999 = _903 + _997;
    int _1001 = ~_786;
    int _1003 = _1001 + 1;
    int _1005 = _979;
    float _1007 = _967;
    float _1009 = _969;
    if (_754)
    {
        float _1011 = -_969;
        float _1013 = _1011 + 1.0;
        _1005 = as_type<int>(_1013);
    }
    int _1015 = _1005;
    int _1017 = int(_901) + int(_987);
    float _1019 = floor(_965);
    float _1021 = float(_78);
    int _1023 = _1015;
    if (!_754)
    {
        _959 = _969;
    }
    float _1025 = _959;
    float _1027 = _1025;
    if (_754)
    {
        float _1029 = _963 ? as_type<float>(_1015) : _969;
        _1027 = _1029;
    }
    float _1031 = _1027;
    if (_760)
    {
        float _1033 = -_969;
        float _1035 = _1033 + 1.0;
        _1023 = as_type<int>(_1035);
    }
    int _1037 = _1023;
    float _1039 = -_993;
    float _1041 = _929 + _1039;
    float _1043 = trunc(_991);
    float _1045 = precise::max(_1043, 0.0);
    uint _1047 = uint(_1045);
    if (!_760)
    {
        _1007 = _969;
    }
    float _1049 = _1007;
    float _1051 = _1049;
    if (_760)
    {
        float _1053 = _792 ? as_type<float>(_1037) : _969;
        _1051 = _1053;
    }
    float _1055 = _1051;
    int _1057 = _1003 * _1017;
    int _1059 = _1057 + _836;
    float _1061 = float(_786);
    float _1063 = trunc(_995);
    float _1065 = precise::max(_1063, 0.0);
    uint _1067 = uint(_1065);
    float _1069 = float(_836);
    bool _1071 = uint(_1059) >= uint(_786);
    float _1073 = _999 * _1061;
    bool _1075 = _1069 >= _1061;
    bool _1077 = isnan(_1069);
    bool _1079 = _1075 || _1077;
    bool _1081 = isnan(_1061);
    bool _1083 = _1079 || _1081;
    float _1085 = float(_1083);
    float _1087 = _1061 * _112;
    float _1089 = float(_820);
    float _1091 = 1.0 / _1021;
    float _1093 = -_1019;
    float _1095 = _965 + _1093;
    int _1097 = ~_812;
    int _1099 = _1097 + 1;
    int _1101 = int(_923) + int(_1047);
    float _1103 = float(_884);
    int _1105 = int(_953) + int(_1067);
    float _1107 = _1089 * _1041;
    float _1109 = float(_812);
    float _1111 = trunc(_1073);
    int _1113 = int(_1111);
    float _1115 = float(_860);
    int _1117 = _846 * _1105;
    int _1119 = _1117 + _884;
    int _1121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1123 = _1121 != 0;
    float _1125 = _1091 * _112;
    float _1127 = _1087 * _1091;
    float _1129 = trunc(_1085);
    int _1131 = int(_1129);
    bool _1133 = _1103 >= _1089;
    bool _1135 = isnan(_1103);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan(_1089);
    bool _1141 = _1137 || _1139;
    float _1143 = float(_1141);
    float _1145 = _1089 * _1125;
    float _1147 = _1109 * _1125;
    bool _1149 = _1115 >= _1109;
    bool _1151 = isnan(_1115);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(_1109);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = _1109 * _1095;
    bool _1163 = !_1071;
    int _1165 = _1163 ? 0 : (-1);
    int _1167 = _1099 * _1101;
    int _1169 = _1167 + _860;
    bool _1171 = uint(_1119) >= uint(_820);
    float _1173 = trunc(_1107);
    int _1175 = int(_1173);
    bool _1177 = !_1123;
    int _1179 = _1177 ? 0 : 1;
    int _1181 = ~_1017;
    int _1183 = _1181 + _1165;
    int _1185 = _1183 + 1;
    bool _1187 = !_1171;
    int _1189 = _1187 ? 0 : (-1);
    int _1191 = abs(_1179);
    float _1193 = trunc(_1143);
    int _1195 = int(_1193);
    bool _1197 = uint(_1169) >= uint(_812);
    int _1199 = _1113 * _1191;
    int _1201 = _1199 + _836;
    int _1203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1205 = _1203 != 0;
    int _1207 = _786 * _1185;
    int _1209 = _1207 + _836;
    int _1211 = ~_1105;
    int _1213 = _1211 + _1189;
    int _1215 = _1213 + 1;
    float _1217 = trunc(_1159);
    int _1219 = int(_1217);
    int _1221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1223 = _1221 != 0;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1227 = _1225 != 0;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1231 = _1229 != 0;
    bool _1233 = !_1205;
    int _1235 = _1233 ? 0 : 1;
    int _1237 = _820 * _1215;
    int _1239 = _1237 + _884;
    bool _1241 = _786 == 0;
    bool _1243 = _820 == 0;
    float _1245 = trunc(_1127);
    int _1247 = int(_1245);
    int _1249 = abs(_1235);
    bool _1251 = !_1197;
    int _1253 = _1251 ? 0 : (-1);
    int _1255 = ~_1131;
    int _1257 = _1255 + 1;
    int _1259 = _1257 + 1;
    int _1261 = _1175 * _1249;
    int _1263 = _1261 + _884;
    bool _1265 = !_1241;
    int _1267 = _1265 ? _1209 : (-1);
    float _1269 = trunc(_1145);
    int _1271 = int(_1269);
    int _1273 = ~_1195;
    int _1275 = _1273 + 1;
    int _1277 = _1275 + 1;
    bool _1279 = !_1243;
    int _1281 = _1279 ? _1239 : (-1);
    int _1283 = _1267 * _1259;
    int _1285 = ~_1101;
    int _1287 = _1285 + _1253;
    int _1289 = _1287 + 1;
    int _1291 = _786 + (-1);
    int _1293 = _1277 * _1281;
    bool _1295 = !_1227;
    int _1297 = _1295 ? 0 : 1;
    int _1299 = _812 * _1289;
    int _1301 = _1299 + _860;
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1305 = _1303 != 0;
    int _1307 = _1131 * _1291;
    int _1309 = _1307 + _1283;
    bool _1311 = _812 == 0;
    bool _1313 = !_1223;
    int _1315 = _1313 ? 0 : 1;
    int _1317 = abs(_1297);
    bool _1319 = !_1305;
    int _1321 = _1319 ? 0 : 1;
    int _1323 = ~_1219;
    int _1325 = _1323 + 1;
    int _1327 = _1325 + 1;
    int _1329 = _1309 * _1317;
    bool _1331 = !_1311;
    int _1333 = _1331 ? _1301 : (-1);
    int _1335 = abs(_1315);
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1339 = _1337 != 0;
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1343 = _1341 != 0;
    int _1345 = _1327 * _1333;
    int _1347 = _820 + (-1);
    int _1349 = _1247 * _1335;
    int _1351 = _1349 + _1329;
    bool _1353 = !_1231;
    int _1355 = _1353 ? 0 : 1;
    bool _1357 = !_1343;
    int _1359 = _1357 ? 0 : 1;
    int _1361 = _1195 * _1347;
    int _1363 = _1361 + _1293;
    int _1365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1367 = _1365 != 0;
    float _1369 = trunc(_1161);
    int _1371 = int(_1369);
    int _1373 = abs(_1355);
    int _1375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1377 = _1375 != 0;
    int _1379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1381 = _1379 != 0;
    int _1383 = abs(_1359);
    int _1385 = _1201 * _1373;
    int _1387 = _1385 + _1351;
    bool _1389 = !_1367;
    int _1391 = _1389 ? 0 : 1;
    int _1393 = abs(_1321);
    int _1395 = _1363 * _1383;
    int _1397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1399 = _1397 != 0;
    int _1401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1403 = _1401 != 0;
    bool _1405 = !_1339;
    int _1407 = _1405 ? 0 : 1;
    int _1409 = _1113 * _1393;
    int _1411 = _1409 + _1387;
    int _1413 = abs(_1391);
    int _1415 = abs(_1407);
    bool _1417 = !_1403;
    int _1419 = _1417 ? 0 : 1;
    int _1421 = _1371 * _1413;
    int _1423 = _1421 + _860;
    int _1425 = _812 + (-1);
    int _1427 = _1271 * _1415;
    int _1429 = _1427 + _1395;
    int _1431 = abs(_1419);
    float _1433 = trunc(_1147);
    int _1435 = int(_1433);
    bool _1437 = !_1399;
    int _1439 = _1437 ? 0 : 1;
    int _1441 = _1219 * _1425;
    int _1443 = _1441 + _1345;
    float _1445 = float(uint(_1411));
    float _1447 = in.m_39.y;
    bool _1449 = !_1377;
    int _1451 = _1449 ? 0 : 1;
    int _1453 = _1443 * _1431;
    int _1455 = abs(_1439);
    float _1457 = as_type<float>(_854) * _1445;
    int _1459 = abs(_1451);
    bool _1461 = !_1381;
    int _1463 = _1461 ? 0 : 1;
    float _1465 = trunc(_1457);
    float _1467 = precise::max(_1465, 0.0);
    uint _1469 = uint(_1467);
    int _1471 = abs(_1463);
    int _1473 = _1263 * _1459;
    int _1475 = _1473 + _1429;
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1479 = _1477 != 0;
    int _1481 = ~_786;
    int _1483 = _1481 + 1;
    int _1485 = _1435 * _1455;
    int _1487 = _1485 + _1453;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1491 = _1489 != 0;
    float _1493 = in.m_35.w;
    int _1495 = _1175 * _1471;
    int _1497 = _1495 + _1475;
    bool _1499 = !_1479;
    int _1501 = _1499 ? 0 : 1;
    int _1503 = _1483 * int(_1469);
    int _1505 = _1503 + _1411;
    bool _1507 = !_1491;
    int _1509 = _1507 ? 0 : 1;
    float _1511 = float(uint(_1497));
    int _1513 = abs(_1501);
    float _1515 = -_1447;
    float _1517 = _1515 + 1.0;
    int _1519 = abs(_1509);
    float _1521 = as_type<float>(_905) * _1511;
    float _1523 = float(uint(_1505));
    bool _1525 = _802 > 0.5;
    float _1527 = trunc(_1521);
    float _1529 = precise::max(_1527, 0.0);
    uint _1531 = uint(_1529);
    int _1533 = _1423 * _1513;
    int _1535 = _1533 + _1487;
    float _1537 = as_type<float>(_854) * _1523;
    int _1539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1541 = _1539 != 0;
    int _1543 = _1525 ? as_type<int>(_1517) : as_type<int>(_1447);
    float _1545 = trunc(_1537);
    float _1547 = precise::max(_1545, 0.0);
    uint _1549 = uint(_1547);
    int _1551 = _1371 * _1519;
    int _1553 = _1551 + _1535;
    int _1555 = ~_786;
    int _1557 = _1555 + 1;
    float _1559 = _1541 ? as_type<float>(_1543) : _1447;
    bool _1561 = _1493 > 0.5;
    int _1563 = ~_820;
    int _1565 = _1563 + 1;
    int _1567 = _1561 ? as_type<int>(_1517) : as_type<int>(_1447);
    float _1569 = float(uint(_1553));
    int _1571 = _1565 * int(_1531);
    int _1573 = _1571 + _1497;
    int _1575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1577 = _1575 != 0;
    int _1579 = int(_1469) + int(_1549);
    float _1581 = as_type<float>(_874) * _1569;
    float _1583 = _1577 ? as_type<float>(_1567) : _1447;
    int _1585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1587 = _1585 != 0;
    float _1589 = trunc(_1581);
    float _1591 = precise::max(_1589, 0.0);
    uint _1593 = uint(_1591);
    float _1595 = float(uint(_1573));
    bool _1597 = _740 > 0.5;
    float _1599 = as_type<float>(_905) * _1595;
    int _1601 = ~_812;
    int _1603 = _1601 + 1;
    int _1605 = _1557 * _1579;
    int _1607 = _1605 + _1411;
    bool _1609 = _812 == 0;
    float _1611 = trunc(_1599);
    float _1613 = precise::max(_1611, 0.0);
    uint _1615 = uint(_1613);
    float _1617 = _1447;
    int _1619 = _1411;
    if (_1587)
    {
        float _1621 = _1597 ? _1517 : _1447;
        _1617 = _1621;
    }
    float _1623 = _1617;
    bool _1625 = uint(_1607) >= uint(_786);
    int _1627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1629 = _1627 != 0;
    int _1631 = _1603 * int(_1593);
    int _1633 = _1631 + _1553;
    bool _1635 = !_1625;
    int _1637 = _1635 ? 0 : (-1);
    int _1639 = ~_820;
    int _1641 = _1639 + 1;
    int _1643 = ~_1579;
    int _1645 = _1643 + _1637;
    int _1647 = _1645 + 1;
    float _1649 = float(uint(_1633));
    bool _1651 = _786 == 0;
    int _1653 = _786 * _1647;
    int _1655 = _1653 + _1411;
    int _1657 = int(_1531) + int(_1615);
    float _1659 = as_type<float>(_874) * _1649;
    float _1661 = as_type<float>(_1657);
    if (_1629)
    {
        float _1663 = -_969;
        float _1665 = _1663 + 1.0;
        _1619 = as_type<int>(_1665);
    }
    int _1667 = _1619;
    bool _1669 = !_1651;
    int _1671 = _1669 ? _1655 : (-1);
    float _1673 = trunc(_1659);
    float _1675 = precise::max(_1673, 0.0);
    uint _1677 = uint(_1675);
    if (_1629)
    {
        float _1679 = _1525 ? as_type<float>(_1667) : _969;
        _1009 = _1679;
    }
    float _1681 = _1009;
    int _1683 = _1641 * _1657;
    int _1685 = _1683 + _1497;
    int _1687 = _1671 & 3;
    bool _1689 = _1687 != 0;
    int _1691 = _1671 & 3;
    bool _1693 = _1691 != 0;
    bool _1695 = uint(_1687) >= 2u;
    int _1697 = _1693 ? 0 : 1;
    bool _1699 = uint(_1685) >= uint(_820);
    int _1701 = _1695 ? 0 : 1;
    bool _1703 = uint(_1687) > 1u;
    bool _1705 = !_1699;
    int _1707 = _1705 ? 0 : (-1);
    int _1709 = ~_812;
    int _1711 = _1709 + 1;
    bool _1713 = _1687 != 3;
    int _1715 = int(_1593) + int(_1677);
    int _1717 = ~_1657;
    int _1719 = _1717 + _1707;
    int _1721 = _1719 + 1;
    bool _1723 = _820 == 0;
    int _1725 = _820 * _1721;
    int _1727 = _1725 + _1497;
    int _1729 = ~_1697;
    int _1731 = _1729 + 1;
    int _1733 = _1731 + 1;
    int _1735 = _1711 * _1715;
    int _1737 = _1735 + _1553;
    int _1739 = _1733;
    if (!_1703)
    {
        int _1741 = ~_1697;
        int _1743 = _1741 + 1;
        _1739 = _1743;
    }
    int _1745 = _1739;
    int _1747 = ~_1701;
    int _1749 = _1747 + 1;
    int _1751 = _1749 + 1;
    int _1753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1755 = _1753 != 0;
    bool _1757 = !_1723;
    int _1759 = _1757 ? _1727 : (-1);
    int _1761 = _1751;
    if (_1713)
    {
        int _1763 = ~_1701;
        int _1765 = _1763 + 1;
        _1761 = _1765;
    }
    int _1767 = _1761;
    bool _1769 = uint(_1737) >= uint(_812);
    float _1771 = _736 * 2.0;
    bool _1773 = !_1755;
    int _1775 = _1773 ? 0 : 1;
    int _1777 = _1759 & 3;
    bool _1779 = _1777 != 0;
    float _1781 = floor(_1771);
    bool _1783 = !_1769;
    int _1785 = _1783 ? 0 : (-1);
    int _1787 = _1779 ? 0 : 1;
    bool _1789 = _1777 != 3;
    int _1791 = ~_1715;
    int _1793 = _1791 + _1785;
    int _1795 = _1793 + 1;
    bool _1797 = uint(_1777) >= 2u;
    float _1799 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1801 = log2(_1799);
    int _1803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1805 = _1803 != 0;
    int _1807 = _812 * _1795;
    int _1809 = _1807 + _1553;
    int _1811 = _1797 ? 0 : 1;
    bool _1813 = uint(_1777) > 1u;
    bool _1815 = !_1609;
    int _1817 = _1815 ? _1809 : (-1);
    int _1819 = ~_1811;
    int _1821 = _1819 + 1;
    int _1823 = _1821 + 1;
    int _1825 = _1823;
    int _1827 = _1811;
    float _1829 = _1771;
    if (_1789)
    {
        int _1831 = ~_1811;
        int _1833 = _1831 + 1;
        _1825 = _1833;
    }
    int _1835 = _1825;
    int _1837 = _1817 & 3;
    bool _1839 = _1837 != 0;
    int _1841 = ~_1787;
    int _1843 = _1841 + 1;
    int _1845 = _1843 + 1;
    bool _1847 = _1837 != 3;
    int _1849 = _1845;
    if (!_1813)
    {
        int _1851 = ~_1787;
        int _1853 = _1851 + 1;
        _1849 = _1853;
    }
    int _1855 = _1849;
    bool _1857 = uint(_1837) >= 2u;
    if (_1805)
    {
        _1827 = 0;
    }
    int _1859 = _1827;
    int _1861 = _1857 ? 0 : 1;
    int _1863 = _1859;
    if (_1805)
    {
        _870 = 0;
    }
    int _1865 = _870;
    int _1867 = _1865;
    if (!_1805)
    {
        _1863 = 1;
    }
    int _1869 = _1863;
    if (!_1805)
    {
        _1867 = 2;
    }
    int _1871 = _1867;
    int _1873 = ~_1861;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    int _1879 = _1877;
    if (_1847)
    {
        int _1881 = ~_1861;
        int _1883 = _1881 + 1;
        _1879 = _1883;
    }
    int _1885 = _1879;
    float _1887 = _802 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1889 = _1869 != 1;
    bool _1891 = _1871 != 2;
    float _1893 = _736 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1895 = _1839 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1897 = uint(_1837) > 1u;
    float _1899 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1901 = _1893;
    float _1903 = _1895;
    float _1905 = _1887;
    if (!_1889)
    {
        _1829 = _802;
    }
    float _1907 = _1829;
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1911 = -_1899;
    float _1913 = fma(_1893, 2.0, _1911);
    float _1915 = _1907;
    if (_1891)
    {
        _1901 = _736;
    }
    float _1917 = _1901;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1921 = _1917;
    if (!_1891)
    {
        _1921 = _740;
    }
    float _1923 = _1921;
    float _1925 = fma(_1887, -2.0, _1909);
    int _1927 = ~as_type<int>(_1895);
    int _1929 = _1927 + 1;
    int _1931 = _1929 + 1;
    int _1933 = _1931;
    if (!_1897)
    {
        int _1935 = ~as_type<int>(_1895);
        int _1937 = _1935 + 1;
        _1933 = _1937;
    }
    int _1939 = _1933;
    float _1941 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_1889)
    {
        _1903 = _740;
    }
    float _1943 = _1903;
    float _1945 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1925);
    float _1947 = _1943;
    if (!_1889)
    {
        _1661 = _1907;
    }
    float _1949 = _1661;
    float _1951 = -_1919;
    float _1953 = fma(_1941, 2.0, _1951);
    float _1955 = _1949;
    if (!_1889)
    {
        _1905 = _740;
    }
    float _1957 = _1905;
    float _1959 = _1801 * _112;
    float _1961 = _1957;
    float _1963 = _1959;
    if (_1889)
    {
        _1955 = _736;
    }
    float _1965 = _1955;
    float _1967 = -_112;
    float _1969 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1953);
    if (_1889)
    {
        _1915 = _736;
    }
    float _1971 = _1915;
    if (_1889)
    {
        _1947 = _802;
    }
    float _1973 = _1947;
    float _1975 = _1965 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1889)
    {
        _1961 = _802;
    }
    float _1977 = _1961;
    bool _1979 = _1781 > 0.0;
    float _1981 = -_770;
    float _1983 = fma(_1975, 2.0, _1981);
    bool _1985 = _1781 >= 0.0;
    bool _1987 = isnan(_1781);
    bool _1989 = _1985 || _1987;
    bool _1991 = isnan(0.0);
    bool _1993 = _1989 || _1991;
    float _1995 = float(uint(_1201));
    float _1997 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1999 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2001 = as_type<float>(_854) * _1995;
    float _2003 = exp2(_1959);
    float _2005 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1997);
    float _2007 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1999);
    float _2009 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2011 = float(uint(_1263));
    float _2013 = fma(_2009, -2.0, _768);
    float _2015 = float(uint(_1423));
    float _2017 = trunc(_2001);
    float _2019 = precise::max(_2017, 0.0);
    uint _2021 = uint(_2019);
    float _2023 = as_type<float>(_905) * _2011;
    if (_1891)
    {
        _1963 = _802;
    }
    float _2025 = _1963;
    float _2027 = _2025;
    if (!_1891)
    {
        _2027 = _736;
    }
    float _2029 = _2027;
    bool _2031 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2033 = isnan(0.0);
    bool _2035 = _2031 || _2033;
    bool _2037 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2039 = _2035 || _2037;
    float _2041 = -_2003;
    float _2043 = _2041 + 1.0;
    float _2045 = trunc(_2023);
    float _2047 = precise::max(_2045, 0.0);
    uint _2049 = uint(_2047);
    float _2051 = as_type<float>(_874) * _2015;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2055 = _2029 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2057 = _2039 ? _2043 : 0.0;
    int _2059 = ~_812;
    int _2061 = _2059 + 1;
    float _2063 = trunc(_2051);
    float _2065 = precise::max(_2063, 0.0);
    uint _2067 = uint(_2065);
    int _2069 = _806 * int(_2021);
    int _2071 = _2069 + _1201;
    float _2073 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2075 = 1.0 + _2073;
    bool _2077 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2079 = isnan(1.0);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2085 = _2081 || _2083;
    float _2087 = fma(_2055, -2.0, _2053);
    float _2089 = _802 * 2.0;
    float _2091 = float(uint(_2071));
    int _2093 = _850 * int(_2049);
    int _2095 = _2093 + _1263;
    float _2097 = 1.0 / _2075;
    int _2099 = abs(_1767);
    float _2101 = as_type<float>(_854) * _2091;
    float _2103 = float(uint(_2095));
    int _2105 = _2061 * int(_2067);
    int _2107 = _2105 + _1423;
    float _2109 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2111 = as_type<float>(_905) * _2103;
    float _2113 = trunc(_2101);
    float _2115 = precise::max(_2113, 0.0);
    uint _2117 = uint(_2115);
    float _2119 = float(uint(_2107));
    float _2121 = -_112;
    float _2123 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1983);
    int _2125 = abs(_1835);
    float _2127 = as_type<float>(_874) * _2119;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2131 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2109);
    float _2133 = floor(_2089);
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2137 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2129);
    float _2139 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2131);
    float _2141 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2005);
    float _2143 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2135);
    float _2145 = -_112;
    float _2147 = fma(_2145, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1913);
    float _2149 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2007);
    float _2151 = trunc(_2111);
    float _2153 = precise::max(_2151, 0.0);
    uint _2155 = uint(_2153);
    float _2157 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2143);
    float _2159 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2137);
    float _2161 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[87].w, _824);
    float _2163 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2013);
    int _2165 = _1993 ? 0 : 1;
    int _2167 = int(_2021) + int(_2117);
    float _2169 = trunc(_2127);
    float _2171 = precise::max(_2169, 0.0);
    uint _2173 = uint(_2171);
    float _2175 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2087);
    if (_2085)
    {
        float _2177 = _2057 * _2097;
        _114 = _2177;
    }
    float _2179 = _114;
    int _2181 = ~_786;
    int _2183 = _2181 + 1;
    float _2185 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _2187 = _2133 > 0.0;
    bool _2189 = _2133 >= 0.0;
    bool _2191 = isnan(_2133);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan(0.0);
    bool _2197 = _2193 || _2195;
    int _2199 = ~_820;
    int _2201 = _2199 + 1;
    int _2203 = int(_2049) + int(_2155);
    int _2205 = _2183 * _2167;
    int _2207 = _2205 + _1201;
    int _2209 = ~_812;
    int _2211 = _2209 + 1;
    int _2213 = ~_2165;
    int _2215 = _2213 + 1;
    int _2217 = _2215 + 1;
    int _2219 = int(_2067) + int(_2173);
    int _2221 = _2217;
    if (!_1979)
    {
        int _2223 = ~_2165;
        int _2225 = _2223 + 1;
        _2221 = _2225;
    }
    int _2227 = _2221;
    int _2229 = _2211 * _2219;
    int _2231 = _2229 + _1423;
    bool _2233 = uint(_2207) >= uint(_786);
    int _2235 = _2201 * _2203;
    int _2237 = _2235 + _1263;
    int _2239 = _2197 ? 0 : 1;
    float _2241 = _740 * 2.0;
    bool _2243 = !_2233;
    int _2245 = _2243 ? 0 : (-1);
    bool _2247 = uint(_2237) >= uint(_820);
    bool _2249 = uint(_2231) >= uint(_812);
    float _2251 = floor(_2241);
    int _2253 = ~_2239;
    int _2255 = _2253 + 1;
    int _2257 = _2255 + 1;
    int _2259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2261 = _2259 != 0;
    int _2263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2265 = _2263 != 0;
    int _2267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2269 = _2267 != 0;
    float _2271 = in.m_41.x;
    float _2273 = in.m_41.y;
    float _2275 = in.m_41.z;
    int _2277 = _2257;
    if (!_2187)
    {
        int _2279 = ~_2239;
        int _2281 = _2279 + 1;
        _2277 = _2281;
    }
    int _2283 = _2277;
    float _2285 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _2287 = !_2247;
    int _2289 = _2287 ? 0 : (-1);
    bool _2291 = !_2249;
    int _2293 = _2291 ? 0 : (-1);
    float _2295 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2285);
    int _2297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2299 = _2297 != 0;
    int _2301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2303 = _2301 != 0;
    float _2305 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _738);
    float _2307 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _746);
    bool _2309 = _2251 >= 0.0;
    bool _2311 = isnan(_2251);
    bool _2313 = _2309 || _2311;
    bool _2315 = isnan(0.0);
    bool _2317 = _2313 || _2315;
    float _2319 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2321 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2305);
    float _2323 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2307);
    float _2325 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2295);
    float _2327 = _2321 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2329 = _2317 ? 0 : 1;
    float _2331 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2333 = _2331 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2335 = _2251 > 0.0;
    float _2337 = _2325 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2339 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2273);
    float _2341 = 1.0 / _2333;
    float _2343 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2275);
    float _2345 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2271);
    float _2347 = _2319 * _2339;
    float _2349 = _756 * _2343;
    float _2351 = _736 + _740;
    float _2353 = _736 + _802;
    float _2355 = _2185 * _2345;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2357 = _2351 + (-1.0);
    int _2359 = ~_2329;
    int _2361 = _2359 + 1;
    int _2363 = _2361 + 1;
    float _2365 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2367 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2365;
    float _2369 = _2353 + (-1.0);
    int _2371 = _2363;
    if (!_2335)
    {
        int _2373 = ~_2329;
        int _2375 = _2373 + 1;
        _2371 = _2375;
    }
    int _2377 = _2371;
    float _2379 = -_2327;
    float _2381 = _2379 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2383 = fma(_2357, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2385 = _802 + _740;
    float _2387 = _2367 * _2341;
    float _2389 = _2323 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2391 = -_2337;
    float _2393 = _2391 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2395 = fma(_2369, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2397 = _2381 * _2381;
    float _2399 = in.m_43.x;
    float _2401 = in.m_43.y;
    float _2403 = in.m_43.z;
    float _2405 = _2385 + (-1.0);
    bool _2407 = _2273 != 0.0;
    bool _2409 = isnan(_2273);
    bool _2411 = _2407 || _2409;
    bool _2413 = isnan(0.0);
    bool _2415 = _2411 || _2413;
    float _2417 = -_2389;
    float _2419 = _2417 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2421 = fma(_2393, _2393, _2397);
    float _2423 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2425 = _730 + _2423;
    bool _2427 = _2271 == 0.0;
    bool _2429 = !_2415;
    bool _2431 = _2427 && _2429;
    float _2433 = fma(_2405, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2435 = fma(_2419, _2419, _2421);
    bool _2437 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2439 = isnan(_730);
    bool _2441 = _2437 || _2439;
    bool _2443 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2445 = _2441 || _2443;
    float _2447 = float(_2445);
    float _2449 = -_782;
    float _2451 = _2449 + 1.0;
    bool _2453 = !_2261;
    int _2455 = _2453 ? 0 : 1;
    float _2457 = fma(_2387, _2425, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2459 = _2275 == 0.0;
    bool _2461 = _2459 && _2431;
    float _2463 = rsqrt(_2435);
    float _2465 = _2447 * _2451;
    int _2467 = abs(_2455);
    float _2469 = _736 + (-0.5);
    float _2471 = in.m_45.x;
    float _2473 = in.m_45.y;
    float _2475 = in.m_45.z;
    float _2477 = _2457 * _2465;
    bool _2479 = !_2265;
    int _2481 = _2479 ? 0 : 1;
    float _2483 = -_2447;
    float _2485 = _2483 + 1.0;
    float _2487 = _802 + (-0.5);
    int _2489 = abs(_2481);
    float _2491 = fma(_2485, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2477);
    float _2493 = _2457;
    float _2495 = as_type<float>(_2377);
    if (_2461)
    {
        _2493 = _2399;
    }
    float _2497 = _2493;
    float _2499 = _740 + (-0.5);
    float _2501 = float(_2377);
    float _2503 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2491);
    float _2505 = float(_2467);
    float _2507 = _2393 * _2463;
    float _2509 = _2497;
    if (_2461)
    {
        _2495 = _2497;
    }
    float _2511 = _2495;
    float _2513 = _2511;
    if (!_2461)
    {
        _2509 = _2399;
    }
    float _2515 = _2509;
    float _2517 = _2505 * _2501;
    float _2519 = _2381 * _2463;
    float _2521 = float(_2227);
    float _2523 = _2419 * _2463;
    float _2525 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2527 = _2507 * _2525;
    float _2529 = float(_2489);
    float _2531 = _2517 * (-2.0);
    float _2533 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2535 = _2523 * _2533;
    float _2537 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2539 = -_2527;
    float _2541 = fma(_2523, _2537, _2539);
    float _2543 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2545 = _2519 * _2543;
    float _2547 = _2529 * _2521;
    float _2549 = fma(_2395, _2531, _2395);
    float _2551 = fma(_2531, _2471, _2471);
    float _2553 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2555 = -_2535;
    float _2557 = fma(_2519, _2553, _2555);
    float _2559 = _2541 * _2541;
    float _2561 = _2535;
    float _2563 = _2559;
    if (_2461)
    {
        _2561 = _2401;
    }
    float _2565 = _2561;
    float _2567 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2569 = -_2545;
    float _2571 = fma(_2507, _2567, _2569);
    bool _2573 = !_2269;
    int _2575 = _2573 ? 0 : 1;
    float _2577 = fma(_2557, _2557, _2559);
    float _2579 = _2565;
    if (_2461)
    {
        _2563 = _2565;
    }
    float _2581 = _2563;
    float _2583 = _2547 * (-2.0);
    float _2585 = _2581;
    if (!_2461)
    {
        _2579 = _2401;
    }
    float _2587 = _2579;
    float _2589 = fma(_2469, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2551);
    int _2591 = abs(_2575);
    float _2593 = fma(_2433, _2583, _2433);
    float _2595 = fma(_2583, _2473, _2473);
    float _2597 = fma(_2549, _2179, _2589);
    float _2599 = fma(_2571, _2571, _2577);
    float _2601 = float(_2283);
    float _2603 = _2597 * 0.15915493667125701904296875;
    float _2605 = float(_2591);
    float _2607 = fma(_2487, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2595);
    float _2609 = _2597;
    float _2611 = _2595;
    if (_2461)
    {
        _2609 = _2403;
    }
    float _2613 = _2609;
    float _2615 = rsqrt(_2599);
    float _2617 = _2613;
    if (!_2461)
    {
        float _2619 = fma(_2273, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2587);
        _2585 = _2619;
    }
    float _2621 = _2585;
    float _2623 = _2605 * _2601;
    if (_2461)
    {
        _2611 = _2613;
    }
    float _2625 = _2611;
    float _2627 = fma(_2593, _2179, _2607);
    float _2629 = _2625;
    if (!_2461)
    {
        _2617 = _2403;
    }
    float _2631 = _2617;
    if (!_2461)
    {
        float _2633 = fma(_2271, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2515);
        _2513 = _2633;
    }
    float _2635 = _2513;
    float _2637 = in.m_47.x;
    float _2639 = in.m_47.y;
    float _2641 = in.m_47.z;
    float _2643 = in.m_47.w;
    float _2645 = _2603 * 6.283185482025146484375;
    float _2647 = sin(_2645);
    float _2649 = _2623 * (-2.0);
    float _2651 = _2627 * 0.15915493667125701904296875;
    if (!_2461)
    {
        float _2653 = fma(_2275, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2631);
        _2629 = _2653;
    }
    float _2655 = _2629;
    float _2657 = fma(_2649, _2475, _2475);
    float _2659 = fma(_2383, _2649, _2383);
    float _2661 = _2603 * 6.283185482025146484375;
    float _2663 = cos(_2661);
    float _2665 = fma(_2499, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2657);
    float _2667 = _2541 * _2615;
    float _2669 = _2557 * _2615;
    float _2671 = fma(_2659, _2179, _2665);
    float _2673 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2675 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2677 = _2651 * 6.283185482025146484375;
    float _2679 = sin(_2677);
    float _2681 = _2671 * 0.15915493667125701904296875;
    float _2683 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2685 = _2503 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2687 = _2673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2689 = _2675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2691 = _2683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2693 = _2641 * _2515;
    float _2695 = _2651 * 6.283185482025146484375;
    float _2697 = cos(_2695);
    float _2699 = _2639 * _2631;
    float _2701 = _2637 * _2587;
    float _2703 = -_2693;
    float _2705 = fma(_2637, _2631, _2703);
    out.m_49.x = _2691;
    out.m_49.y = _2687;
    out.m_49.z = _2689;
    out.m_49.w = _2685;
    float _2707 = -_2699;
    float _2709 = fma(_2641, _2587, _2707);
    float _2711 = -_2701;
    float _2713 = fma(_2639, _2515, _2711);
    float _2715 = _2705 * _2643;
    float _2717 = _2681 * 6.283185482025146484375;
    float _2719 = cos(_2717);
    float _2721 = _2709 * _2643;
    float _2723 = _2713 * _2643;
    float _2725 = _2571 * _2615;
    float _2727 = _2647 * _2679;
    int _2729 = ~_2203;
    int _2731 = _2729 + _2289;
    int _2733 = _2731 + 1;
    int _2735 = ~_2219;
    int _2737 = _2735 + _2293;
    int _2739 = _2737 + 1;
    float _2741 = _2681 * 6.283185482025146484375;
    float _2743 = sin(_2741);
    float _2745 = _2663 * _2697;
    float _2747 = _2647 * _2697;
    float _2749 = _2663 * _2679;
    float _2751 = _2523 * _2667;
    float _2753 = _2507 * _2725;
    int _2755 = _812 * _2739;
    int _2757 = _2755 + _1423;
    bool _2759 = _786 == 0;
    float _2761 = _2697 * _2719;
    float _2763 = _2663 * _2719;
    float _2765 = _2647 * _2719;
    float _2767 = _2679 * _2719;
    int _2769 = _820 * _2733;
    int _2771 = _2769 + _1263;
    float _2773 = _2763 * _2347;
    float _2775 = fma(_2743, _2745, _2727);
    float _2777 = fma(_2743, _2727, _2745);
    float _2779 = -_2749;
    float _2781 = fma(_2743, _2747, _2779);
    float _2783 = _2519 * _2669;
    float _2785 = -_2747;
    float _2787 = fma(_2743, _2749, _2785);
    float _2789 = -_2751;
    float _2791 = fma(_2519, _2725, _2789);
    float _2793 = -_2753;
    float _2795 = fma(_2523, _2669, _2793);
    float _2797 = _2765 * _2347;
    float _2799 = -_2783;
    float _2801 = fma(_2507, _2667, _2799);
    float _2803 = -_2347;
    float _2805 = _2743 * _2803;
    float _2807 = fma(_2775, _2355, _2773);
    float _2809 = _2775 * _2791;
    float _2811 = fma(_2781, _2355, _2797);
    float _2813 = _2775 * _2801;
    float _2815 = _2763 * _2791;
    float _2817 = _2763 * _2795;
    float _2819 = _2763 * _2801;
    float _2821 = fma(_2761, _2355, _2805);
    float _2823 = fma(_2761, _2669, _2809);
    float _2825 = _2775 * _2795;
    float _2827 = fma(_2761, _2725, _2813);
    float _2829 = -_2743;
    float _2831 = fma(_2829, _2669, _2815);
    float _2833 = -_2743;
    float _2835 = fma(_2833, _2667, _2817);
    float _2837 = -_2743;
    float _2839 = fma(_2837, _2725, _2819);
    float _2841 = _2787 * _2791;
    float _2843 = _2787 * _2795;
    float _2845 = _2787 * _2801;
    float _2847 = fma(_2787, _2349, _2807);
    float _2849 = fma(_2761, _2667, _2825);
    float _2851 = fma(_2767, _2669, _2841);
    float _2853 = fma(_2767, _2349, _2821);
    float _2855 = fma(_2767, _2667, _2843);
    float _2857 = fma(_2767, _2725, _2845);
    int _2859 = ~_2167;
    int _2861 = _2859 + _2245;
    int _2863 = _2861 + 1;
    float _2865 = _2791 * _2847;
    int _2867 = _1671 >> 31;
    float _2869 = fma(_2777, _2507, _2851);
    float _2871 = fma(_2777, _2519, _2855);
    float _2873 = _2795 * _2847;
    float _2875 = _2801 * _2847;
    int _2877 = _2867 & 3;
    float _2879 = fma(_2669, _2853, _2865);
    float _2881 = fma(_2667, _2853, _2873);
    float _2883 = fma(_2725, _2853, _2875);
    int _2885 = _1671 + _2877;
    float _2887 = fma(_2777, _2349, _2811);
    int _2889 = _1759 >> 31;
    float _2891 = fma(_2781, _2507, _2823);
    float _2893 = fma(_2781, _2519, _2849);
    float _2895 = fma(_2781, _2523, _2827);
    int _2897 = _2885 >> 2;
    float _2899 = fma(_2765, _2507, _2831);
    float _2901 = fma(_2765, _2519, _2835);
    float _2903 = fma(_2765, _2523, _2839);
    int _2905 = _2889 & 3;
    float _2907 = fma(_2777, _2523, _2857);
    int _2909 = _1817 >> 31;
    float _2911 = _2899 * _2639;
    int _2913 = _2897 << 4;
    int _2915 = _2913 + 368;
    float _2917 = _2901 * _2621;
    int _2919 = _1759 + _2905;
    float _2921 = _2903 * _2621;
    int _2923 = _2909 & 3;
    uint _2925 = uint(int(uint(_2915) >> uint(2)));
    uint _2927 = uint(int(uint(int(_2925)) >> uint(2)));
    int _2929 = int(_2925) & 3;
    float _2931 = (*spvDescriptorSet0.vp_c9)._m0[int(_2927)][_2929];
    int _2933 = int(_2925) + 1;
    uint _2935 = uint(int(uint(_2933) >> uint(2)));
    int _2937 = _2933 & 3;
    float _2939 = (*spvDescriptorSet0.vp_c9)._m0[int(_2935)][_2937];
    int _2941 = _2919 >> 2;
    float _2943 = _2899 * _2621;
    int _2945 = _1817 + _2923;
    float _2947 = _2715 * _2899;
    int _2949 = _2941 << 4;
    int _2951 = _2949 + 512;
    float _2953 = _2901 * _2639;
    int _2955 = _2945 >> 2;
    float _2957 = _2715 * _2901;
    uint _2959 = uint(int(uint(_2951) >> uint(2)));
    uint _2961 = uint(int(uint(int(_2959)) >> uint(2)));
    int _2963 = int(_2959) & 3;
    float _2965 = (*spvDescriptorSet0.vp_c9)._m0[int(_2961)][_2963];
    int _2967 = int(_2959) + 1;
    uint _2969 = uint(int(uint(_2967) >> uint(2)));
    int _2971 = _2967 & 3;
    float _2973 = (*spvDescriptorSet0.vp_c9)._m0[int(_2969)][_2971];
    float _2975 = _2715 * _2903;
    int _2977 = _2955 << 4;
    int _2979 = _2977 + 656;
    float _2981 = fma(_2891, _2635, _2943);
    float _2983 = fma(_2891, _2637, _2911);
    float _2985 = fma(_2721, _2891, _2947);
    bool _2987 = !_1689;
    int _2989 = _2987 ? 0 : 1;
    int _2991 = _786 * _2863;
    int _2993 = _2991 + _1201;
    int _2995 = _1759 & 3;
    bool _2997 = _2995 != 0;
    uint _2999 = uint(int(uint(_2979) >> uint(2)));
    uint _3001 = uint(int(uint(int(_2999)) >> uint(2)));
    int _3003 = int(_2999) & 3;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[int(_3001)][_3003];
    int _3007 = int(_2999) + 1;
    uint _3009 = uint(int(uint(_3007) >> uint(2)));
    int _3011 = _3007 & 3;
    float _3013 = (*spvDescriptorSet0.vp_c9)._m0[int(_3009)][_3011];
    float _3015 = fma(_2893, _2637, _2953);
    float _3017 = fma(_2893, _2635, _2917);
    float _3019 = fma(_2895, _2635, _2921);
    float _3021 = fma(_2721, _2893, _2957);
    float _3023 = fma(_2721, _2895, _2975);
    float _3025 = fma(_2507, _2887, _2879);
    float _3027 = fma(_2519, _2887, _2881);
    int _3029 = _2915 + 8;
    uint _3031 = uint(int(uint(_3029) >> uint(2)));
    uint _3033 = uint(int(uint(int(_3031)) >> uint(2)));
    int _3035 = int(_3031) & 3;
    float _3037 = (*spvDescriptorSet0.vp_c9)._m0[int(_3033)][_3035];
    int _3039 = int(_3031) + 1;
    uint _3041 = uint(int(uint(_3039) >> uint(2)));
    int _3043 = _3039 & 3;
    float _3045 = (*spvDescriptorSet0.vp_c9)._m0[int(_3041)][_3043];
    float _3047 = fma(_2523, _2887, _2883);
    bool _3049 = !_2997;
    int _3051 = _3049 ? 0 : 1;
    float _3053 = _2337 + _3025;
    int _3055 = _1817 & 3;
    bool _3057 = _3055 != 0;
    float _3059 = _2327 + _3027;
    int _3061 = abs(_1745);
    float _3063 = _2389 + _3047;
    bool _3065 = !_3057;
    int _3067 = _3065 ? 0 : 1;
    float _3069 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _3071 = _1687 != 3;
    float _3073 = _2903 * _2639;
    int _3075 = _2951 + 8;
    uint _3077 = uint(int(uint(_3075) >> uint(2)));
    uint _3079 = uint(int(uint(int(_3077)) >> uint(2)));
    int _3081 = int(_3077) & 3;
    float _3083 = (*spvDescriptorSet0.vp_c9)._m0[int(_3079)][_3081];
    int _3085 = int(_3077) + 1;
    uint _3087 = uint(int(uint(_3085) >> uint(2)));
    int _3089 = _3085 & 3;
    float _3091 = (*spvDescriptorSet0.vp_c9)._m0[int(_3087)][_3089];
    int _3093 = ~_3061;
    int _3095 = _3093 + 1;
    int _3097 = _3095 + 1;
    float _3099 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3069);
    int _3101 = abs(_2989);
    float _3103 = fma(_2895, _2637, _3073);
    int _3105 = abs(_1855);
    float _3107 = fma(_3063, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3099);
    int _3109 = abs(_3051);
    float _3111 = fma(_2869, _2641, _2983);
    int _3113 = ~_3105;
    int _3115 = _3113 + 1;
    int _3117 = _3115 + 1;
    int _3119 = _3097 * as_type<int>(_2939);
    int _3121 = ~_3101;
    int _3123 = _3121 + 1;
    int _3125 = _3123 + 1;
    float _3127 = _3107 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    int _3129 = abs(_1939);
    float _3131 = fma(_2871, _2641, _3015);
    int _3133 = _2979 + 8;
    uint _3135 = uint(int(uint(_3133) >> uint(2)));
    uint _3137 = uint(int(uint(int(_3135)) >> uint(2)));
    int _3139 = int(_3135) & 3;
    float _3141 = (*spvDescriptorSet0.vp_c9)._m0[int(_3137)][_3139];
    int _3143 = int(_3135) + 1;
    uint _3145 = uint(int(uint(_3143) >> uint(2)));
    int _3147 = _3143 & 3;
    float _3149 = (*spvDescriptorSet0.vp_c9)._m0[int(_3145)][_3147];
    int _3151 = _3125 * as_type<int>(_2931);
    int _3153 = _3151 + _3119;
    float _3155 = fma(_2907, _2641, _3103);
    int _3157 = ~_3109;
    int _3159 = _3157 + 1;
    int _3161 = _3159 + 1;
    int _3163 = _3117 * as_type<int>(_2973);
    int _3165 = ~_3129;
    int _3167 = _3165 + 1;
    int _3169 = _3167 + 1;
    float _3171 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3173 = int(_3171);
    int _3175 = ~_2099;
    int _3177 = _3175 + 1;
    int _3179 = _3177 + 1;
    int _3181 = _3161 * as_type<int>(_2965);
    int _3183 = _3181 + _3163;
    bool _3185 = !_3071;
    int _3187 = _3185 ? 0 : (-1);
    out.m_51.x = _3111;
    out.m_51.y = _3131;
    out.m_51.z = _3155;
    bool _3189 = _1777 != 3;
    int _3191 = _3169 * as_type<int>(_3013);
    int _3193 = abs(_1885);
    float _3195 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3197 = int(_3195);
    bool _3199 = !_3189;
    int _3201 = _3199 ? 0 : (-1);
    int _3203 = ~_2125;
    int _3205 = _3203 + 1;
    int _3207 = _3205 + 1;
    int _3209 = _3179 * as_type<int>(_3037);
    int _3211 = _3209 + _3153;
    int _3213 = abs(_3187);
    int _3215 = abs(_3067);
    int _3217 = abs(_3201);
    int _3219 = ~_3213;
    int _3221 = _3219 + 1;
    int _3223 = _3221 + 1;
    float _3225 = float(uint(_3197));
    int _3227 = _3207 * as_type<int>(_3083);
    int _3229 = _3227 + _3183;
    int _3231 = ~_3217;
    int _3233 = _3231 + 1;
    int _3235 = _3233 + 1;
    int _3237 = _3223 * as_type<int>(_3045);
    int _3239 = _3237 + _3211;
    bool _3241 = !_2299;
    int _3243 = _3241 ? 0 : 1;
    float _3245 = 1.0 / _3225;
    int _3247 = ~_3215;
    int _3249 = _3247 + 1;
    int _3251 = _3249 + 1;
    int _3253 = _3235 * as_type<int>(_3091);
    int _3255 = _3253 + _3229;
    int _3257 = abs(_1775);
    int _3259 = abs(_3243);
    int _3261 = _3251 * as_type<int>(_3005);
    int _3263 = _3261 + _3191;
    int _3265 = ~_3257;
    int _3267 = _3265 + 1;
    int _3269 = _3267 + 1;
    float _3271 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3273 = int(_3271);
    bool _3275 = !_2759;
    int _3277 = _3275 ? _2993 : (-1);
    bool _3279 = _1837 != 3;
    int _3281 = _3239 * _3269;
    float _3283 = float(uint(_3173));
    bool _3285 = !_2303;
    int _3287 = _3285 ? 0 : 1;
    int _3289 = _3277 * _3257;
    int _3291 = _3289 + _3281;
    bool _3293 = !_3279;
    int _3295 = _3293 ? 0 : (-1);
    float _3297 = 1.0 / _3283;
    int _3299 = abs(_3295);
    int _3301 = abs(_3287);
    int _3303 = ~_3193;
    int _3305 = _3303 + 1;
    int _3307 = _3305 + 1;
    float _3309 = float(uint(_3273));
    int _3311 = _3307 * as_type<int>(_3141);
    int _3313 = _3311 + _3263;
    int _3315 = ~_3259;
    int _3317 = _3315 + 1;
    int _3319 = _3317 + 1;
    bool _3321 = _820 == 0;
    float _3323 = 1.0 / _3309;
    int _3325 = ~_3299;
    int _3327 = _3325 + 1;
    int _3329 = _3327 + 1;
    int _3331 = _3319 * _3255;
    bool _3333 = !_3321;
    int _3335 = _3333 ? _2771 : (-1);
    int _3337 = abs(_3173);
    int _3339 = _3329 * as_type<int>(_3149);
    int _3341 = _3339 + _3313;
    bool _3343 = _812 == 0;
    int _3345 = _3335 * _3259;
    int _3347 = _3345 + _3331;
    int _3349 = ~_3301;
    int _3351 = _3349 + 1;
    int _3353 = _3351 + 1;
    float _3355 = float(uint(_3337));
    bool _3357 = !_3343;
    int _3359 = _3357 ? _2757 : (-1);
    int _3361 = _3353 * _3341;
    int _3363 = abs(_3197);
    float _3365 = 1.0 / _3355;
    int _3367 = as_type<int>(_3245) + (-2);
    int _3369 = _3359 * _3301;
    int _3371 = _3369 + _3361;
    float _3373 = float(uint(_3347));
    int _3375 = as_type<int>(_3297) + (-2);
    float _3377 = float(uint(_3363));
    float _3379 = as_type<float>(_3367) * _3373;
    float _3381 = float(uint(_3291));
    int _3383 = abs(_3273);
    int _3385 = as_type<int>(_3323) + (-2);
    float _3387 = as_type<float>(_3375) * _3381;
    float _3389 = float(uint(_3371));
    float _3391 = 1.0 / _3377;
    float _3393 = float(uint(_3383));
    int _3395 = abs(_3291);
    float _3397 = as_type<float>(_3385) * _3389;
    int _3399 = as_type<int>(_3365) + (-2);
    float _3401 = float(uint(_3395));
    float _3403 = trunc(_3387);
    float _3405 = precise::max(_3403, 0.0);
    uint _3407 = uint(_3405);
    int _3409 = ~_3173;
    int _3411 = _3409 + 1;
    int _3413 = ~_3197;
    int _3415 = _3413 + 1;
    float _3417 = as_type<float>(_3399) * _3401;
    int _3419 = abs(_3371);
    float _3421 = fma(_2869, _2655, _2981);
    int _3423 = ~_3273;
    int _3425 = _3423 + 1;
    float _3427 = trunc(_3379);
    float _3429 = precise::max(_3427, 0.0);
    uint _3431 = uint(_3429);
    int _3433 = as_type<int>(_3391) + (-2);
    float _3435 = float(uint(_3419));
    bool _3437 = _3197 == 0;
    bool _3439 = _3197 == 0;
    float _3441 = 1.0 / _3393;
    int _3443 = _3411 * int(_3407);
    int _3445 = _3443 + _3291;
    float _3447 = float(uint(_3445));
    float _3449 = trunc(_3397);
    float _3451 = precise::max(_3449, 0.0);
    uint _3453 = uint(_3451);
    int _3455 = abs(_3347);
    int _3457 = _3415 * int(_3431);
    int _3459 = _3457 + _3347;
    float _3461 = as_type<float>(_3375) * _3447;
    float _3463 = float(uint(_3455));
    float _3465 = float(uint(_3459));
    float _3467 = trunc(_3417);
    float _3469 = precise::max(_3467, 0.0);
    uint _3471 = uint(_3469);
    int _3473 = as_type<int>(_3441) + (-2);
    float _3475 = as_type<float>(_3433) * _3463;
    float _3477 = fma(_2871, _2655, _3017);
    float _3479 = as_type<float>(_3367) * _3465;
    int _3481 = ~_3337;
    int _3483 = _3481 + 1;
    int _3485 = _3425 * int(_3453);
    int _3487 = _3485 + _3371;
    float _3489 = fma(_2907, _2655, _3019);
    float _3491 = trunc(_3475);
    float _3493 = precise::max(_3491, 0.0);
    uint _3495 = uint(_3493);
    float _3497 = as_type<float>(_3473) * _3435;
    int _3499 = ~_3363;
    int _3501 = _3499 + 1;
    float _3503 = float(uint(_3487));
    out.m_53.x = _3421;
    out.m_53.y = _3477;
    out.m_53.z = _3489;
    float _3505 = trunc(_3497);
    float _3507 = precise::max(_3505, 0.0);
    uint _3509 = uint(_3507);
    float _3511 = as_type<float>(_3385) * _3503;
    int _3513 = ~_3383;
    int _3515 = _3513 + 1;
    float _3517 = trunc(_3461);
    float _3519 = precise::max(_3517, 0.0);
    uint _3521 = uint(_3519);
    float _3523 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3525 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3527 = _3483 * int(_3471);
    int _3529 = _3527 + _3395;
    float _3531 = _3059 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3533 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3523);
    float _3535 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3525);
    float _3537 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3531);
    float _3539 = float(uint(_3529));
    int _3541 = _3501 * int(_3495);
    int _3543 = _3541 + _3455;
    float _3545 = fma(_3063, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3533);
    int _3547 = _3515 * int(_3509);
    int _3549 = _3547 + _3419;
    float _3551 = trunc(_3479);
    float _3553 = precise::max(_3551, 0.0);
    uint _3555 = uint(_3553);
    float _3557 = as_type<float>(_3399) * _3539;
    float _3559 = float(uint(_3543));
    float _3561 = _3545 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3563 = float(uint(_3549));
    float _3565 = fma(_3063, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3535);
    float _3567 = fma(_3063, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3537);
    float _3569 = as_type<float>(_3433) * _3559;
    float _3571 = trunc(_3557);
    float _3573 = precise::max(_3571, 0.0);
    uint _3575 = uint(_3573);
    float _3577 = _3561 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3579 = as_type<float>(_3473) * _3563;
    float _3581 = _3561 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3583 = _3561 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3585 = int(_3407) + int(_3521);
    float _3587 = _3561 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3589 = _3565 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3591 = trunc(_3511);
    float _3593 = precise::max(_3591, 0.0);
    uint _3595 = uint(_3593);
    float _3597 = fma(_3127, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3577);
    float _3599 = fma(_3127, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3587);
    float _3601 = fma(_3127, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3581);
    int _3603 = int(_3431) + int(_3555);
    float _3605 = fma(_3589, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3597);
    int _3607 = ~_3337;
    int _3609 = _3607 + 1;
    float _3611 = trunc(_3569);
    float _3613 = precise::max(_3611, 0.0);
    uint _3615 = uint(_3613);
    int _3617 = ~_3173;
    int _3619 = _3617 + 1;
    int _3621 = int(_3471) + int(_3575);
    int _3623 = ~_3273;
    int _3625 = _3623 + 1;
    int _3627 = _3619 * _3585;
    int _3629 = _3627 + _3291;
    float _3631 = trunc(_3579);
    float _3633 = precise::max(_3631, 0.0);
    uint _3635 = uint(_3633);
    float _3637 = fma(_3127, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3583);
    float _3639 = fma(_3589, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3601);
    bool _3641 = uint(_3629) >= uint(_3173);
    int _3643 = _3609 * _3621;
    int _3645 = _3643 + _3395;
    float _3647 = fma(_3589, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3637);
    int _3649 = int(_3453) + int(_3595);
    float _3651 = fma(_3589, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3599);
    int _3653 = int(_3495) + int(_3615);
    float _3655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3657 = ~_3363;
    int _3659 = _3657 + 1;
    int _3661 = _3625 * _3649;
    int _3663 = _3661 + _3371;
    int _3665 = ~_3197;
    int _3667 = _3665 + 1;
    int _3669 = ~_3383;
    int _3671 = _3669 + 1;
    int _3673 = _3659 * _3653;
    int _3675 = _3673 + _3455;
    bool _3677 = uint(_3663) >= uint(_3273);
    int _3679 = _3667 * _3603;
    int _3681 = _3679 + _3347;
    int _3683 = int(_3509) + int(_3635);
    bool _3685 = uint(_3675) >= uint(_3363);
    bool _3687 = uint(_3681) >= uint(_3197);
    int _3689 = _3671 * _3683;
    int _3691 = _3689 + _3419;
    bool _3693 = !_3641;
    int _3695 = _3693 ? 0 : (-1);
    bool _3697 = !_3677;
    int _3699 = _3697 ? 0 : (-1);
    bool _3701 = !_3687;
    int _3703 = _3701 ? 0 : (-1);
    int _3705 = ~_3585;
    int _3707 = _3705 + _3695;
    int _3709 = _3707 + 1;
    int _3711 = ~_3603;
    int _3713 = _3711 + _3703;
    int _3715 = _3713 + 1;
    int _3717 = ~_3649;
    int _3719 = _3717 + _3699;
    int _3721 = _3719 + 1;
    bool _3723 = _3173 == 0;
    float _3725 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3727 = _3173 == 0;
    int _3729 = _3197 * _3715;
    int _3731 = _3729 + _3347;
    int _3733 = _3291 ^ _3173;
    int _3735 = _3173 * _3709;
    int _3737 = _3735 + _3291;
    bool _3739 = uint(_3691) >= uint(_3383);
    int _3741 = _3273 * _3721;
    int _3743 = _3741 + _3371;
    int _3745 = _3347 ^ _3197;
    float _3747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3749 = !_3685;
    int _3751 = _3749 ? 0 : (-1);
    bool _3753 = !_3723;
    int _3755 = _3753 ? _3737 : (-1);
    bool _3757 = uint(_3645) >= uint(_3337);
    int _3759 = ~_3751;
    int _3761 = _3653 + _3759;
    int _3763 = _3761 + 1;
    float _3765 = _3655 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3767 = float(_3755);
    float _3769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3771 = !_3757;
    int _3773 = _3771 ? 0 : (-1);
    float _3775 = fma(_3765, _1031, -0.5);
    bool _3777 = _3273 == 0;
    float _3779 = fma(_3765, _3767, _2147);
    bool _3781 = _3273 == 0;
    float _3783 = _3747 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3785 = _3371 ^ _3273;
    float _3787 = fma(_2139, _3775, _3779);
    bool _3789 = !_3437;
    int _3791 = _3789 ? _3731 : (-1);
    float _3793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3795 = uint(int(uint(_3733) >> uint(31)));
    int _3797 = ~_3773;
    int _3799 = _3621 + _3797;
    int _3801 = _3799 + 1;
    float _3803 = _3725 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _3805 = uint(int(uint(_3745) >> uint(31)));
    bool _3807 = !_3777;
    int _3809 = _3807 ? _3743 : (-1);
    float _3811 = fma(_3803, _1055, -0.5);
    float _3813 = float(_3791);
    bool _3815 = !_3739;
    int _3817 = _3815 ? 0 : (-1);
    uint _3819 = uint(int(uint(_3785) >> uint(31)));
    float _3821 = fma(_3803, _3813, _2123);
    int _3823 = ~int(_3795);
    int _3825 = _3823 + 1;
    float _3827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3829 = ~int(_3805);
    int _3831 = _3829 + 1;
    float _3833 = fma(_3783, _1681, -0.5);
    float _3835 = float(_3809);
    float _3837 = fma(_2141, _3811, _3821);
    int _3839 = ~_3817;
    int _3841 = _3683 + _3839;
    int _3843 = _3841 + 1;
    float _3845 = _3793 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3847 = ~int(_3819);
    int _3849 = _3847 + 1;
    float _3851 = fma(_3783, _3835, _1969);
    int _3853 = _3801 ^ _3825;
    float _3855 = _3769 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3857 = _3763 ^ _3831;
    float _3859 = fma(_2159, _3833, _3851);
    int _3861 = _3843 ^ _3849;
    float _3863 = fma(_2723, _2907, _3023);
    int _3865 = ~_3825;
    int _3867 = _3865 + _3853;
    int _3869 = _3867 + 1;
    float _3871 = _3827 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3873 = ~_3831;
    int _3875 = _3873 + _3857;
    int _3877 = _3875 + 1;
    int _3879 = ~_3849;
    int _3881 = _3879 + _3861;
    int _3883 = _3881 + 1;
    float _3885 = fma(_3871, _1623, -0.5);
    bool _3887 = !_3727;
    int _3889 = _3887 ? _3869 : (-1);
    bool _3891 = !_3439;
    int _3893 = _3891 ? _3877 : (-1);
    bool _3895 = !_3781;
    int _3897 = _3895 ? _3883 : (-1);
    float _3899 = float(_3889);
    float _3901 = float(_3893);
    float _3903 = fma(_1559, _3855, -0.5);
    float _3905 = float(_3897);
    float _3907 = -_1945;
    float _3909 = fma(_3855, _3899, _3907);
    float _3911 = fma(_1583, _3845, -0.5);
    float _3913 = -_2163;
    float _3915 = fma(_3845, _3901, _3913);
    float _3917 = _3837 + 0.5;
    float _3919 = -_2175;
    float _3921 = fma(_3871, _3905, _3919);
    float _3923 = fma(_2157, _3903, _3909);
    float _3925 = fma(_2149, _3911, _3915);
    float _3927 = _3567 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3929 = fma(_2161, _3885, _3921);
    float _3931 = fma(_2723, _2869, _2985);
    float _3933 = fma(_2723, _2871, _3021);
    float _3935 = fma(_3927, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3605);
    float _3937 = fma(_3927, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3639);
    float _3939 = fma(_3927, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3647);
    float _3941 = fma(_3927, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3651);
    float _3943 = _3859 + 0.5;
    float _3945 = _3787 + 0.5;
    float _3947 = _3923 + 0.5;
    float _3949 = _3925 + 0.5;
    float _3951 = _3929 + 0.5;
    out.m_55.x = _3931;
    out.m_55.y = _3933;
    out.m_55.z = _3863;
    out.gl_Position.x = _3937;
    out.gl_Position.y = _3935;
    out.gl_Position.z = _3939;
    out.gl_Position.w = _3941;
    out.m_57.x = _3945;
    out.m_57.y = _3947;
    out.m_57.z = _3917;
    out.m_57.w = _3949;
    out.m_59.x = _3943;
    out.m_59.y = _3951;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

