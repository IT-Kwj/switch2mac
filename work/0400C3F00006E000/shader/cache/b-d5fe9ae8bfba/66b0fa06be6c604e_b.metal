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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
};

struct main0_out
{
    float4 m_43 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_45 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
    float4 m_37 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _754 = false;
    bool _436 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_30.w;
    float _77 = trunc(_75);
    int _80 = int(_77);
    bool _84 = _80 >= 1;
    float _86 = 0.0;
    if (!_84)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _88 = _86;
    float _90 = _88;
    if (!_84)
    {
        out.m_33.x = 0.0;
    }
    int _92 = 0;
    if (!_84)
    {
        float _94 = _88 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_84)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1473 = as_type<float>(_96);
        out.gl_Position.z = _1473;
    }
    if (!_84)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _100 = in.m_35.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_110)
    {
        float _116 = float(_80);
        _90 = _116;
    }
    float _118 = _90;
    bool _120 = _114 >= _118;
    bool _122 = !_110;
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
        _98 = as_type<int>(_130);
    }
    int _132 = _98;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1542 = as_type<float>(_132);
        out.gl_Position.z = _1542;
    }
    if (_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_37.x;
    float _136 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _138 = in.m_37.y;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = in.m_39.w;
    float _152 = in.m_35.x;
    float _154 = in.m_35.y;
    float _156 = in.m_35.z;
    float _158 = in.m_30.x;
    float _160 = in.m_30.y;
    float _162 = in.m_30.z;
    out.m_41.x = _134;
    out.m_41.y = _138;
    float _164 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _170 = _136;
    if (!_148)
    {
        float _172 = _136 * _136;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _182 = _164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _184 = _166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _186 = _178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _188 = _176;
    if (!_148)
    {
        float _190 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_148;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _136 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _136);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_148;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _136 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _170 = _250;
    }
    float _252 = _170;
    out.m_43.x = _182;
    out.m_43.y = _186;
    out.m_43.z = _184;
    out.m_43.w = _180;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _152, _256);
    float _264 = fma(_252, _154, _258);
    float _266 = fma(_252, _156, _260);
    float _268 = fma(_262, _150, _158);
    float _270 = fma(_264, _150, _160);
    float _272 = fma(_266, _150, _162);
    bool _274 = !_254;
    float _292;
    if (!_274)
    {
        float _276 = in.m_45.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[11].w, _114);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_80);
        float _298 = 1.0 / _296;
        float _300 = _114 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _306 = _302 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _312 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _314 = isnan(_302);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _328 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _330 = isnan(_302);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _340;
    bool _344 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _346 = isnan(_302);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = 1.0 / _310;
    float _358 = -_322;
    float _360 = _358 + 1.0;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _364 = 1.0 / _326;
    float _366 = _342 * _356;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _372 = -_354;
    float _374 = _372 + 1.0;
    float _376 = fma(_366, _306, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _378 = _338 * _360;
    float _380 = -_338;
    float _382 = _380 + 1.0;
    float _384 = _322 * _374;
    float _386 = _370 * _364;
    float _388 = _376 * _378;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _392 = _302 + _390;
    float _394 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[131].x, _388);
    float _396 = fma(_386, _392, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _400 = fma(_396, _384, _394);
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _406 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[133].x, _400);
    float _408 = _398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _410 = _402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _412 = _404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _414 = _406 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_47.x = _408;
    out.m_47.y = _410;
    out.m_47.z = _412;
    out.m_47.w = _414;
    bool _416 = !_362;
    float _434;
    if (!_416)
    {
        float _418 = in.m_45.x;
        float _420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _422 = _418 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _424 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[14].x, _114);
        float _426 = _424 * _420;
        float _428 = floor(_426);
        float _430 = -_428;
        float _432 = _426 + _430;
        _434 = _432;
        _436 = true;
    }
    else
    {
        float _438 = float(_80);
        float _440 = 1.0 / _438;
        float _442 = _114 * _440;
        _434 = _442;
    }
    _436 = false;
    float _444 = _434;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _448 = _444 + _446;
    bool _450 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _452 = isnan(_444);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _466 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _468 = isnan(_444);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _478;
    bool _482 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _484 = isnan(_444);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -_460;
    float _496 = _494 + 1.0;
    float _498 = 1.0 / _464;
    bool _500 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _502 = isnan(_444);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = -_492;
    float _514 = _512 + 1.0;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _520 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _522 = 1.0 / _518;
    float _524 = _480 * _498;
    float _526 = -_476;
    float _528 = _526 + 1.0;
    float _530 = _476 * _496;
    bool _532 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _534 = isnan(_444);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = fma(_524, _448, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _546 = _492 * _528;
    float _548 = _510 * _514;
    float _550 = -_510;
    float _552 = _550 + 1.0;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _558 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _560 = isnan(_444);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = _542 * _552;
    float _572 = -_542;
    float _574 = _572 + 1.0;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _580 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _582 = isnan(_444);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = 1.0 / _556;
    float _594 = _568 * _574;
    float _596 = -_568;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _604 = _590 * _598;
    float _606 = 1.0 / _578;
    float _608 = _602 * _522;
    float _610 = -_590;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _618;
    float _622 = 1.0 / _616;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _628 = _544 * _604;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _632 = _444 + _630;
    float _634 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[159].x, _628);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _640 = 1.0 / _626;
    float _642 = fma(_608, _632, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _644 = _620 * _606;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _648 = _444 + _646;
    float _650 = fma(_642, _594, _634);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _654 = _444 + _652;
    float _656 = fma(_644, _648, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _658 = 1.0 / _638;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _672 = _662 * _592;
    float _674 = fma(_656, _570, _650);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _678 = _444 + _676;
    float _680 = _666 * _640;
    float _682 = fma(_672, _654, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _684;
    bool _688 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _690 = isnan(_444);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = _670 * _622;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _704 = _444 + _702;
    float _706 = fma(_680, _678, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _708 = fma(_682, _548, _674);
    float _710 = _686 * _658;
    float _712 = fma(_700, _704, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _714 = -_698;
    float _716 = _714 + 1.0;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _720 = _444 + _718;
    float _722 = fma(_706, _546, _708);
    float _724 = _460 * _716;
    float _726 = fma(_710, _720, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _728 = fma(_712, _530, _722);
    float _730 = fma(_726, _724, _728);
    float _732 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[166].x, _730);
    out.m_49.x = _732;
    bool _734 = !_520;
    float _752;
    if (!_734)
    {
        float _736 = in.m_45.x;
        float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _740 = _736 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _742 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[14].y, _114);
        float _744 = _742 * _738;
        float _746 = floor(_744);
        float _748 = -_746;
        float _750 = _744 + _748;
        _752 = _750;
        _754 = true;
    }
    else
    {
        float _756 = float(_80);
        float _758 = 1.0 / _756;
        float _760 = _114 * _758;
        _752 = _760;
    }
    _754 = false;
    float _762 = _752;
    float _764 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _766 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _768 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _770 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _764);
    float _772 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _766);
    float _774 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _768);
    float _776 = in.m_39.x;
    float _778 = in.m_39.y;
    float _780 = in.m_39.z;
    float _782 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _770);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _788 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _772);
    float _790 = _782 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _792 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _774);
    float _794 = _788 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _796 = 1.0 / _786;
    float _798 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _800 = _790 + _798;
    float _802 = _792 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _806 = _794 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _812 = _800 * _800;
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _816 = _802 + _814;
    float _818 = 1.0 / _810;
    float _820 = fma(_806, _806, _812);
    float _822 = fma(_816, _816, _820);
    float _824 = _780 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _826 = _776 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _828 = rsqrt(_822);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _834 = _778 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _840 = _826 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _842 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _844 = 1.0 / _832;
    float _846 = _840 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _848;
    out.m_33.x = _842;
    bool _852 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _854 = isnan(_762);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = _850 * _796;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _870 = 1.0 / _838;
    float _872 = _846 * _828;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _882;
    float _886 = _800 * _872;
    float _888 = _806 * _872;
    float _890 = _868 * _818;
    float _892 = _884 * _844;
    float _894 = -_886;
    float _896 = _800 + _894;
    float _898 = -_888;
    float _900 = _806 + _898;
    bool _902 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _904 = isnan(_762);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = 1.0 / _880;
    float _916 = _896 * _896;
    float _918 = -_862;
    float _920 = _918 + 1.0;
    float _922 = _876 * _870;
    float _924 = _816 * _872;
    bool _926 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _928 = isnan(_762);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _938;
    bool _942 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _944 = isnan(_762);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = fma(_900, _900, _916);
    float _956 = -_924;
    float _958 = _816 + _956;
    bool _960 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _962 = isnan(_762);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = -_912;
    float _974 = _972 + 1.0;
    float _976 = -_936;
    float _978 = _976 + 1.0;
    float _980 = fma(_958, _958, _954);
    float _982 = _970 * _974;
    float _984 = -_970;
    float _986 = _984 + 1.0;
    float _988 = _940 * _914;
    float _990 = in.m_51.x;
    float _992 = in.m_51.y;
    float _994 = in.m_51.z;
    float _996 = sqrt(_980);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1000 = _762 + _998;
    float _1002 = _862 * _986;
    bool _1004 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1006 = isnan(_762);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1012 = _1008 || _1010;
    float _1014 = float(_1012);
    float _1016 = _834 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1018 = fma(_864, _1000, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1020 = _936 * _920;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1024 = _762 + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1028 = _762 + _1026;
    float _1030 = _1014 * _978;
    float _1032 = -_1014;
    float _1034 = _1032 + 1.0;
    float _1036 = fma(_892, _1024, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    bool _1038 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1040 = isnan(_762);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1046 = _1042 || _1044;
    float _1048 = float(_1046);
    float _1050 = fma(_890, _1028, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1052 = -_952;
    float _1054 = _1052 + 1.0;
    float _1056 = _952 * _1034;
    float _1058 = _828 * _996;
    bool _1060 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1062 = isnan(_762);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1068 = _1064 || _1066;
    float _1070 = float(_1068);
    float _1072 = _1048 * _1054;
    float _1074 = -_1048;
    float _1076 = _1074 + 1.0;
    float _1078 = _1016 * _1058;
    float _1080 = _824 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1082 = _840 * _1058;
    float _1084 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _992);
    float _1086 = _1070 * _1076;
    float _1088 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _990);
    float _1090 = _1080 * _1058;
    float _1092 = _1078 * _1084;
    float _1094 = _1018 * _1086;
    float _1096 = _1082 * _1088;
    float _1098 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _994);
    float _1100 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1102 = -_1070;
    float _1104 = _1102 + 1.0;
    float _1106 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1108 = _1090 * _1098;
    float _1110 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1100);
    float _1112 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1094);
    float _1114 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1106);
    float _1116 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1110);
    float _1118 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1114);
    bool _1120 = _992 != 0.0;
    bool _1122 = isnan(_992);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = _802 + _1116;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1136 = fma(_1050, _1072, _1112);
    float _1138 = _794 + _1118;
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1142 = _1130 + _1140;
    float _1144 = 1.0 / _1134;
    float _1146 = in.m_53.x;
    float _1148 = in.m_53.y;
    float _1150 = in.m_53.z;
    float _1152 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1154 = _1138 + _1152;
    float _1156 = _1142 * _1142;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1160 = _1158 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1164 = _762 + _1162;
    bool _1166 = _990 == 0.0;
    bool _1168 = !_1128;
    bool _1170 = _1166 && _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1174 = _762 + _1172;
    float _1176 = 1.0 / _1160;
    float _1178 = fma(_1154, _1154, _1156);
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1182 = _1180 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1184 = fma(_922, _1164, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1186 = fma(_1036, _1056, _1136);
    bool _1188 = _994 == 0.0;
    bool _1190 = _1188 && _1170;
    float _1192 = fma(_988, _1174, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1194 = sqrt(_1178);
    float _1196 = fma(_1184, _1030, _1186);
    float _1198 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1200 = _1182 * _1144;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1204 = _762 + _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1206;
    float _1210 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1198);
    float _1212 = fma(_1192, _1020, _1196);
    float _1214 = fma(_1200, _1204, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1216 = _1208 * _1176;
    float _1218 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1210);
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1222 = _762 + _1220;
    float _1224 = _1148;
    float _1226 = _1146;
    float _1228 = _1150;
    float _1230 = _990;
    float _1232 = _1138;
    float _1234 = _1130;
    if (!_1190)
    {
        float _1236 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1148);
        _1224 = _1236;
    }
    float _1238 = _1224;
    float _1240 = fma(_1214, _1002, _1212);
    float _1242 = _790 + _1218;
    if (!_1190)
    {
        float _1244 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1146);
        _1226 = _1244;
    }
    float _1246 = _1226;
    bool _1248 = _1194 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1250 = fma(_1216, _1222, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1252 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1254 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1256 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (!_1190)
    {
        float _1258 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1150);
        _1228 = _1258;
    }
    float _1260 = _1228;
    float _1262 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1252);
    float _1264 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1254);
    float _1266 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1256);
    float _1268 = fma(_1250, _982, _1240);
    if (!_1248)
    {
        _1230 = _1242;
    }
    float _1270 = _1230;
    bool _1272 = !_1248;
    float _1274 = _1270;
    if (!_1272)
    {
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1280 = _1194 + _1278;
        float _1282 = _1242 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1284 = rsqrt(_1178);
        float _1286 = _1280 * _1276;
        float _1288 = _1286 * 0.15915493667125701904296875;
        float _1290 = _1288 * 6.283185482025146484375;
        float _1292 = cos(_1290);
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        float _1298 = _1292 + (-1.0);
        float _1300 = fma(_1296, _1282, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1302 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1304 = _1284 * _1300;
        float _1306 = fma(_1242, _1292, _1302);
        float _1308 = fma(_1154, _1304, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1310 = fma(_1142, _1304, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1274 = _1306;
        _1232 = _1308;
        _1234 = _1310;
    }
    float _1312 = _1274;
    float _1314 = _1232;
    float _1316 = _1234;
    float _1318 = -_886;
    float _1320 = _1318 + _1312;
    float _1322 = -_888;
    float _1324 = _1322 + _1314;
    float _1326 = fma(_1260, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1262);
    float _1328 = -_924;
    float _1330 = _1328 + _1316;
    float _1332 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1334 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1338 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1340 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1332);
    float _1342 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1334);
    float _1344 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1336);
    float _1346 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1338);
    float _1348 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1340);
    float _1350 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1342);
    float _1352 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1344);
    float _1354 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1346);
    float _1356 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1358 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1360 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1362 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1364 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1366 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1368 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1370 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1372 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1364);
    float _1374 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1366);
    float _1376 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1368);
    float _1378 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1268);
    float _1380 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1372);
    float _1382 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1374);
    float _1384 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1370);
    float _1386 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1376);
    float _1388 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1380);
    float _1390 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1382);
    float _1392 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1384);
    float _1394 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1386);
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1398 = _1320 + _1396;
    float _1400 = _1388 + _1390;
    float _1402 = fma(_1260, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1264);
    float _1404 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1392);
    float _1406 = fma(_1260, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1266);
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1410 = _1324 + _1408;
    float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1414 = _1330 + _1412;
    float _1416 = _1400 * 0.5;
    out.m_55.x = _1326;
    out.m_55.y = _1402;
    out.m_55.z = _1406;
    out.m_57.x = _1378;
    out.m_59.x = _1410;
    out.m_59.y = _1398;
    out.m_59.z = _1414;
    out.gl_Position.x = _1394;
    out.gl_Position.y = _1404;
    out.gl_Position.z = _1388;
    out.gl_Position.w = _1390;
    out.m_61.z = _1416;
    out.m_61.w = _1390;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _754 = false;
    bool _436 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_30.w;
    float _77 = trunc(_75);
    int _80 = int(_77);
    bool _84 = _80 >= 1;
    float _86 = 0.0;
    if (!_84)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _88 = _86;
    float _90 = _88;
    if (!_84)
    {
        out.m_33.x = 0.0;
    }
    int _92 = 0;
    if (!_84)
    {
        float _94 = _88 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_84)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1473 = as_type<float>(_96);
        out.gl_Position.z = _1473;
    }
    if (!_84)
    {
        return out;
    }
    float _100 = in.m_35.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_110)
    {
        float _116 = float(_80);
        _90 = _116;
    }
    float _118 = _90;
    bool _120 = _114 >= _118;
    bool _122 = !_110;
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
        _98 = as_type<int>(_130);
    }
    int _132 = _98;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1542 = as_type<float>(_132);
        out.gl_Position.z = _1542;
    }
    if (_124)
    {
        return out;
    }
    float _134 = in.m_37.x;
    float _136 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _138 = in.m_37.y;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = in.m_39.w;
    float _152 = in.m_35.x;
    float _154 = in.m_35.y;
    float _156 = in.m_35.z;
    float _158 = in.m_30.x;
    float _160 = in.m_30.y;
    float _162 = in.m_30.z;
    out.m_41.x = _134;
    out.m_41.y = _138;
    float _164 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _170 = _136;
    if (!_148)
    {
        float _172 = _136 * _136;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _182 = _164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _184 = _166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _186 = _178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _188 = _176;
    if (!_148)
    {
        float _190 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_148;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _136 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _136);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_148;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _136 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _170 = _250;
    }
    float _252 = _170;
    out.m_43.x = _182;
    out.m_43.y = _186;
    out.m_43.z = _184;
    out.m_43.w = _180;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _152, _256);
    float _264 = fma(_252, _154, _258);
    float _266 = fma(_252, _156, _260);
    float _268 = fma(_262, _150, _158);
    float _270 = fma(_264, _150, _160);
    float _272 = fma(_266, _150, _162);
    bool _274 = !_254;
    float _292;
    if (!_274)
    {
        float _276 = in.m_45.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[11].w, _114);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_80);
        float _298 = 1.0 / _296;
        float _300 = _114 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _306 = _302 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _312 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _314 = isnan(_302);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _328 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _330 = isnan(_302);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _340;
    bool _344 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _346 = isnan(_302);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = 1.0 / _310;
    float _358 = -_322;
    float _360 = _358 + 1.0;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _364 = 1.0 / _326;
    float _366 = _342 * _356;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _372 = -_354;
    float _374 = _372 + 1.0;
    float _376 = fma(_366, _306, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _378 = _338 * _360;
    float _380 = -_338;
    float _382 = _380 + 1.0;
    float _384 = _322 * _374;
    float _386 = _370 * _364;
    float _388 = _376 * _378;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _392 = _302 + _390;
    float _394 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[131].x, _388);
    float _396 = fma(_386, _392, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _400 = fma(_396, _384, _394);
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _406 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[133].x, _400);
    float _408 = _398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _410 = _402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _412 = _404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _414 = _406 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_47.x = _408;
    out.m_47.y = _410;
    out.m_47.z = _412;
    out.m_47.w = _414;
    bool _416 = !_362;
    float _434;
    if (!_416)
    {
        float _418 = in.m_45.x;
        float _420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _422 = _418 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _424 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[14].x, _114);
        float _426 = _424 * _420;
        float _428 = floor(_426);
        float _430 = -_428;
        float _432 = _426 + _430;
        _434 = _432;
        _436 = true;
    }
    else
    {
        float _438 = float(_80);
        float _440 = 1.0 / _438;
        float _442 = _114 * _440;
        _434 = _442;
    }
    _436 = false;
    float _444 = _434;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _448 = _444 + _446;
    bool _450 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _452 = isnan(_444);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _466 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _468 = isnan(_444);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _478;
    bool _482 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _484 = isnan(_444);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -_460;
    float _496 = _494 + 1.0;
    float _498 = 1.0 / _464;
    bool _500 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _502 = isnan(_444);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = -_492;
    float _514 = _512 + 1.0;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _520 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _522 = 1.0 / _518;
    float _524 = _480 * _498;
    float _526 = -_476;
    float _528 = _526 + 1.0;
    float _530 = _476 * _496;
    bool _532 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _534 = isnan(_444);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = fma(_524, _448, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _546 = _492 * _528;
    float _548 = _510 * _514;
    float _550 = -_510;
    float _552 = _550 + 1.0;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _558 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _560 = isnan(_444);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = _542 * _552;
    float _572 = -_542;
    float _574 = _572 + 1.0;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _580 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _582 = isnan(_444);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = 1.0 / _556;
    float _594 = _568 * _574;
    float _596 = -_568;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _604 = _590 * _598;
    float _606 = 1.0 / _578;
    float _608 = _602 * _522;
    float _610 = -_590;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _618;
    float _622 = 1.0 / _616;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _628 = _544 * _604;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _632 = _444 + _630;
    float _634 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[159].x, _628);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _640 = 1.0 / _626;
    float _642 = fma(_608, _632, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _644 = _620 * _606;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _648 = _444 + _646;
    float _650 = fma(_642, _594, _634);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _654 = _444 + _652;
    float _656 = fma(_644, _648, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _658 = 1.0 / _638;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _672 = _662 * _592;
    float _674 = fma(_656, _570, _650);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _678 = _444 + _676;
    float _680 = _666 * _640;
    float _682 = fma(_672, _654, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _684;
    bool _688 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _690 = isnan(_444);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = _670 * _622;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _704 = _444 + _702;
    float _706 = fma(_680, _678, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _708 = fma(_682, _548, _674);
    float _710 = _686 * _658;
    float _712 = fma(_700, _704, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _714 = -_698;
    float _716 = _714 + 1.0;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _720 = _444 + _718;
    float _722 = fma(_706, _546, _708);
    float _724 = _460 * _716;
    float _726 = fma(_710, _720, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _728 = fma(_712, _530, _722);
    float _730 = fma(_726, _724, _728);
    float _732 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[166].x, _730);
    out.m_49.x = _732;
    bool _734 = !_520;
    float _752;
    if (!_734)
    {
        float _736 = in.m_45.x;
        float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _740 = _736 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _742 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[14].y, _114);
        float _744 = _742 * _738;
        float _746 = floor(_744);
        float _748 = -_746;
        float _750 = _744 + _748;
        _752 = _750;
        _754 = true;
    }
    else
    {
        float _756 = float(_80);
        float _758 = 1.0 / _756;
        float _760 = _114 * _758;
        _752 = _760;
    }
    _754 = false;
    float _762 = _752;
    float _764 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _766 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _768 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _770 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _764);
    float _772 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _766);
    float _774 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _768);
    float _776 = in.m_39.x;
    float _778 = in.m_39.y;
    float _780 = in.m_39.z;
    float _782 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _770);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _788 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _772);
    float _790 = _782 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _792 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _774);
    float _794 = _788 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _796 = 1.0 / _786;
    float _798 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _800 = _790 + _798;
    float _802 = _792 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _806 = _794 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _812 = _800 * _800;
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _816 = _802 + _814;
    float _818 = 1.0 / _810;
    float _820 = fma(_806, _806, _812);
    float _822 = fma(_816, _816, _820);
    float _824 = _780 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _826 = _776 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _828 = rsqrt(_822);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _834 = _778 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _840 = _826 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _842 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _844 = 1.0 / _832;
    float _846 = _840 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _848;
    out.m_33.x = _842;
    bool _852 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _854 = isnan(_762);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = _850 * _796;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _870 = 1.0 / _838;
    float _872 = _846 * _828;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _882;
    float _886 = _800 * _872;
    float _888 = _806 * _872;
    float _890 = _868 * _818;
    float _892 = _884 * _844;
    float _894 = -_886;
    float _896 = _800 + _894;
    float _898 = -_888;
    float _900 = _806 + _898;
    bool _902 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _904 = isnan(_762);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = 1.0 / _880;
    float _916 = _896 * _896;
    float _918 = -_862;
    float _920 = _918 + 1.0;
    float _922 = _876 * _870;
    float _924 = _816 * _872;
    bool _926 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _928 = isnan(_762);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _938;
    bool _942 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _944 = isnan(_762);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = fma(_900, _900, _916);
    float _956 = -_924;
    float _958 = _816 + _956;
    bool _960 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _962 = isnan(_762);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = -_912;
    float _974 = _972 + 1.0;
    float _976 = -_936;
    float _978 = _976 + 1.0;
    float _980 = fma(_958, _958, _954);
    float _982 = _970 * _974;
    float _984 = -_970;
    float _986 = _984 + 1.0;
    float _988 = _940 * _914;
    float _990 = in.m_51.x;
    float _992 = in.m_51.y;
    float _994 = in.m_51.z;
    float _996 = sqrt(_980);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1000 = _762 + _998;
    float _1002 = _862 * _986;
    bool _1004 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1006 = isnan(_762);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1012 = _1008 || _1010;
    float _1014 = float(_1012);
    float _1016 = _834 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1018 = fma(_864, _1000, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1020 = _936 * _920;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1024 = _762 + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1028 = _762 + _1026;
    float _1030 = _1014 * _978;
    float _1032 = -_1014;
    float _1034 = _1032 + 1.0;
    float _1036 = fma(_892, _1024, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    bool _1038 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1040 = isnan(_762);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1046 = _1042 || _1044;
    float _1048 = float(_1046);
    float _1050 = fma(_890, _1028, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1052 = -_952;
    float _1054 = _1052 + 1.0;
    float _1056 = _952 * _1034;
    float _1058 = _828 * _996;
    bool _1060 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1062 = isnan(_762);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1068 = _1064 || _1066;
    float _1070 = float(_1068);
    float _1072 = _1048 * _1054;
    float _1074 = -_1048;
    float _1076 = _1074 + 1.0;
    float _1078 = _1016 * _1058;
    float _1080 = _824 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1082 = _840 * _1058;
    float _1084 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _992);
    float _1086 = _1070 * _1076;
    float _1088 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _990);
    float _1090 = _1080 * _1058;
    float _1092 = _1078 * _1084;
    float _1094 = _1018 * _1086;
    float _1096 = _1082 * _1088;
    float _1098 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _994);
    float _1100 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1102 = -_1070;
    float _1104 = _1102 + 1.0;
    float _1106 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1108 = _1090 * _1098;
    float _1110 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1100);
    float _1112 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1094);
    float _1114 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1106);
    float _1116 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1110);
    float _1118 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1114);
    bool _1120 = _992 != 0.0;
    bool _1122 = isnan(_992);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = _802 + _1116;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1136 = fma(_1050, _1072, _1112);
    float _1138 = _794 + _1118;
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1142 = _1130 + _1140;
    float _1144 = 1.0 / _1134;
    float _1146 = in.m_53.x;
    float _1148 = in.m_53.y;
    float _1150 = in.m_53.z;
    float _1152 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1154 = _1138 + _1152;
    float _1156 = _1142 * _1142;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1160 = _1158 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1164 = _762 + _1162;
    bool _1166 = _990 == 0.0;
    bool _1168 = !_1128;
    bool _1170 = _1166 && _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1174 = _762 + _1172;
    float _1176 = 1.0 / _1160;
    float _1178 = fma(_1154, _1154, _1156);
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1182 = _1180 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1184 = fma(_922, _1164, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1186 = fma(_1036, _1056, _1136);
    bool _1188 = _994 == 0.0;
    bool _1190 = _1188 && _1170;
    float _1192 = fma(_988, _1174, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1194 = sqrt(_1178);
    float _1196 = fma(_1184, _1030, _1186);
    float _1198 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1200 = _1182 * _1144;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1204 = _762 + _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1206;
    float _1210 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1198);
    float _1212 = fma(_1192, _1020, _1196);
    float _1214 = fma(_1200, _1204, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1216 = _1208 * _1176;
    float _1218 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1210);
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1222 = _762 + _1220;
    float _1224 = _1148;
    float _1226 = _1146;
    float _1228 = _1150;
    float _1230 = _990;
    float _1232 = _1138;
    float _1234 = _1130;
    if (!_1190)
    {
        float _1236 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1148);
        _1224 = _1236;
    }
    float _1238 = _1224;
    float _1240 = fma(_1214, _1002, _1212);
    float _1242 = _790 + _1218;
    if (!_1190)
    {
        float _1244 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1146);
        _1226 = _1244;
    }
    float _1246 = _1226;
    bool _1248 = _1194 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1250 = fma(_1216, _1222, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1252 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1254 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1256 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (!_1190)
    {
        float _1258 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1150);
        _1228 = _1258;
    }
    float _1260 = _1228;
    float _1262 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1252);
    float _1264 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1254);
    float _1266 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1256);
    float _1268 = fma(_1250, _982, _1240);
    if (!_1248)
    {
        _1230 = _1242;
    }
    float _1270 = _1230;
    bool _1272 = !_1248;
    float _1274 = _1270;
    if (!_1272)
    {
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1280 = _1194 + _1278;
        float _1282 = _1242 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1284 = rsqrt(_1178);
        float _1286 = _1280 * _1276;
        float _1288 = _1286 * 0.15915493667125701904296875;
        float _1290 = _1288 * 6.283185482025146484375;
        float _1292 = cos(_1290);
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        float _1298 = _1292 + (-1.0);
        float _1300 = fma(_1296, _1282, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1302 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1304 = _1284 * _1300;
        float _1306 = fma(_1242, _1292, _1302);
        float _1308 = fma(_1154, _1304, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1310 = fma(_1142, _1304, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1274 = _1306;
        _1232 = _1308;
        _1234 = _1310;
    }
    float _1312 = _1274;
    float _1314 = _1232;
    float _1316 = _1234;
    float _1318 = -_886;
    float _1320 = _1318 + _1312;
    float _1322 = -_888;
    float _1324 = _1322 + _1314;
    float _1326 = fma(_1260, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1262);
    float _1328 = -_924;
    float _1330 = _1328 + _1316;
    float _1332 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1334 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1338 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1340 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1332);
    float _1342 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1334);
    float _1344 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1336);
    float _1346 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1338);
    float _1348 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1340);
    float _1350 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1342);
    float _1352 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1344);
    float _1354 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1346);
    float _1356 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1358 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1360 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1362 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1364 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1366 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1368 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1370 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1372 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1364);
    float _1374 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1366);
    float _1376 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1368);
    float _1378 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1268);
    float _1380 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1372);
    float _1382 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1374);
    float _1384 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1370);
    float _1386 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1376);
    float _1388 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1380);
    float _1390 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1382);
    float _1392 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1384);
    float _1394 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1386);
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1398 = _1320 + _1396;
    float _1400 = _1388 + _1390;
    float _1402 = fma(_1260, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1264);
    float _1404 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1392);
    float _1406 = fma(_1260, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1266);
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1410 = _1324 + _1408;
    float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1414 = _1330 + _1412;
    float _1416 = _1400 * 0.5;
    out.m_55.x = _1326;
    out.m_55.y = _1402;
    out.m_55.z = _1406;
    out.m_57.x = _1378;
    out.m_59.x = _1410;
    out.m_59.y = _1398;
    out.m_59.z = _1414;
    out.gl_Position.x = _1394;
    out.gl_Position.y = _1404;
    out.gl_Position.z = _1388;
    out.gl_Position.w = _1390;
    out.m_61.z = _1416;
    out.m_61.w = _1390;
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
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _754 = false;
    bool _436 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_30.w;
    float _77 = trunc(_75);
    int _80 = int(_77);
    bool _84 = _80 >= 1;
    float _86 = 0.0;
    if (!_84)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _88 = _86;
    float _90 = _88;
    if (!_84)
    {
        out.m_33.x = 0.0;
    }
    int _92 = 0;
    if (!_84)
    {
        float _94 = _88 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_84)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1473 = as_type<float>(_96);
        out.gl_Position.z = _1473;
    }
    if (!_84)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _100 = in.m_35.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_110)
    {
        float _116 = float(_80);
        _90 = _116;
    }
    float _118 = _90;
    bool _120 = _114 >= _118;
    bool _122 = !_110;
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
        _98 = as_type<int>(_130);
    }
    int _132 = _98;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1542 = as_type<float>(_132);
        out.gl_Position.z = _1542;
    }
    if (_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_37.x;
    float _136 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _138 = in.m_37.y;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = in.m_39.w;
    float _152 = in.m_35.x;
    float _154 = in.m_35.y;
    float _156 = in.m_35.z;
    float _158 = in.m_30.x;
    float _160 = in.m_30.y;
    float _162 = in.m_30.z;
    out.m_41.x = _134;
    out.m_41.y = _138;
    float _164 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _170 = _136;
    if (!_148)
    {
        float _172 = _136 * _136;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _182 = _164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _184 = _166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _186 = _178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _188 = _176;
    if (!_148)
    {
        float _190 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_148;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _136 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _136);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_148;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _136 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _170 = _250;
    }
    float _252 = _170;
    out.m_43.x = _182;
    out.m_43.y = _186;
    out.m_43.z = _184;
    out.m_43.w = _180;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _152, _256);
    float _264 = fma(_252, _154, _258);
    float _266 = fma(_252, _156, _260);
    float _268 = fma(_262, _150, _158);
    float _270 = fma(_264, _150, _160);
    float _272 = fma(_266, _150, _162);
    bool _274 = !_254;
    float _292;
    if (!_274)
    {
        float _276 = in.m_45.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[11].w, _114);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_80);
        float _298 = 1.0 / _296;
        float _300 = _114 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _306 = _302 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _312 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _314 = isnan(_302);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _328 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _330 = isnan(_302);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _340;
    bool _344 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _346 = isnan(_302);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = 1.0 / _310;
    float _358 = -_322;
    float _360 = _358 + 1.0;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _364 = 1.0 / _326;
    float _366 = _342 * _356;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _372 = -_354;
    float _374 = _372 + 1.0;
    float _376 = fma(_366, _306, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _378 = _338 * _360;
    float _380 = -_338;
    float _382 = _380 + 1.0;
    float _384 = _322 * _374;
    float _386 = _370 * _364;
    float _388 = _376 * _378;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _392 = _302 + _390;
    float _394 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[131].x, _388);
    float _396 = fma(_386, _392, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _400 = fma(_396, _384, _394);
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _406 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[133].x, _400);
    float _408 = _398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _410 = _402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _412 = _404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _414 = _406 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_47.x = _408;
    out.m_47.y = _410;
    out.m_47.z = _412;
    out.m_47.w = _414;
    bool _416 = !_362;
    float _434;
    if (!_416)
    {
        float _418 = in.m_45.x;
        float _420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _422 = _418 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _424 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[14].x, _114);
        float _426 = _424 * _420;
        float _428 = floor(_426);
        float _430 = -_428;
        float _432 = _426 + _430;
        _434 = _432;
        _436 = true;
    }
    else
    {
        float _438 = float(_80);
        float _440 = 1.0 / _438;
        float _442 = _114 * _440;
        _434 = _442;
    }
    _436 = false;
    float _444 = _434;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _448 = _444 + _446;
    bool _450 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _452 = isnan(_444);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _466 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _468 = isnan(_444);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _478;
    bool _482 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _484 = isnan(_444);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -_460;
    float _496 = _494 + 1.0;
    float _498 = 1.0 / _464;
    bool _500 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _502 = isnan(_444);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = -_492;
    float _514 = _512 + 1.0;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _520 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _522 = 1.0 / _518;
    float _524 = _480 * _498;
    float _526 = -_476;
    float _528 = _526 + 1.0;
    float _530 = _476 * _496;
    bool _532 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _534 = isnan(_444);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = fma(_524, _448, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _546 = _492 * _528;
    float _548 = _510 * _514;
    float _550 = -_510;
    float _552 = _550 + 1.0;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _558 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _560 = isnan(_444);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = _542 * _552;
    float _572 = -_542;
    float _574 = _572 + 1.0;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _580 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _582 = isnan(_444);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = 1.0 / _556;
    float _594 = _568 * _574;
    float _596 = -_568;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _604 = _590 * _598;
    float _606 = 1.0 / _578;
    float _608 = _602 * _522;
    float _610 = -_590;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _618;
    float _622 = 1.0 / _616;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _628 = _544 * _604;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _632 = _444 + _630;
    float _634 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[159].x, _628);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _640 = 1.0 / _626;
    float _642 = fma(_608, _632, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _644 = _620 * _606;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _648 = _444 + _646;
    float _650 = fma(_642, _594, _634);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _654 = _444 + _652;
    float _656 = fma(_644, _648, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _658 = 1.0 / _638;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _670 = _668 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _672 = _662 * _592;
    float _674 = fma(_656, _570, _650);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _678 = _444 + _676;
    float _680 = _666 * _640;
    float _682 = fma(_672, _654, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _684;
    bool _688 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _690 = isnan(_444);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = _670 * _622;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _704 = _444 + _702;
    float _706 = fma(_680, _678, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _708 = fma(_682, _548, _674);
    float _710 = _686 * _658;
    float _712 = fma(_700, _704, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _714 = -_698;
    float _716 = _714 + 1.0;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _720 = _444 + _718;
    float _722 = fma(_706, _546, _708);
    float _724 = _460 * _716;
    float _726 = fma(_710, _720, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _728 = fma(_712, _530, _722);
    float _730 = fma(_726, _724, _728);
    float _732 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[166].x, _730);
    out.m_49.x = _732;
    bool _734 = !_520;
    float _752;
    if (!_734)
    {
        float _736 = in.m_45.x;
        float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _740 = _736 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _742 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[14].y, _114);
        float _744 = _742 * _738;
        float _746 = floor(_744);
        float _748 = -_746;
        float _750 = _744 + _748;
        _752 = _750;
        _754 = true;
    }
    else
    {
        float _756 = float(_80);
        float _758 = 1.0 / _756;
        float _760 = _114 * _758;
        _752 = _760;
    }
    _754 = false;
    float _762 = _752;
    float _764 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _766 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _768 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _770 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _764);
    float _772 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _766);
    float _774 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _768);
    float _776 = in.m_39.x;
    float _778 = in.m_39.y;
    float _780 = in.m_39.z;
    float _782 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _770);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _788 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _772);
    float _790 = _782 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _792 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _774);
    float _794 = _788 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _796 = 1.0 / _786;
    float _798 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _800 = _790 + _798;
    float _802 = _792 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _806 = _794 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _812 = _800 * _800;
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _816 = _802 + _814;
    float _818 = 1.0 / _810;
    float _820 = fma(_806, _806, _812);
    float _822 = fma(_816, _816, _820);
    float _824 = _780 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _826 = _776 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _828 = rsqrt(_822);
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _834 = _778 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _840 = _826 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _842 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _844 = 1.0 / _832;
    float _846 = _840 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _848;
    out.m_33.x = _842;
    bool _852 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _854 = isnan(_762);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = _850 * _796;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _870 = 1.0 / _838;
    float _872 = _846 * _828;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _882;
    float _886 = _800 * _872;
    float _888 = _806 * _872;
    float _890 = _868 * _818;
    float _892 = _884 * _844;
    float _894 = -_886;
    float _896 = _800 + _894;
    float _898 = -_888;
    float _900 = _806 + _898;
    bool _902 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _904 = isnan(_762);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = 1.0 / _880;
    float _916 = _896 * _896;
    float _918 = -_862;
    float _920 = _918 + 1.0;
    float _922 = _876 * _870;
    float _924 = _816 * _872;
    bool _926 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _928 = isnan(_762);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _938;
    bool _942 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _944 = isnan(_762);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = fma(_900, _900, _916);
    float _956 = -_924;
    float _958 = _816 + _956;
    bool _960 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _962 = isnan(_762);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = -_912;
    float _974 = _972 + 1.0;
    float _976 = -_936;
    float _978 = _976 + 1.0;
    float _980 = fma(_958, _958, _954);
    float _982 = _970 * _974;
    float _984 = -_970;
    float _986 = _984 + 1.0;
    float _988 = _940 * _914;
    float _990 = in.m_51.x;
    float _992 = in.m_51.y;
    float _994 = in.m_51.z;
    float _996 = sqrt(_980);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1000 = _762 + _998;
    float _1002 = _862 * _986;
    bool _1004 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1006 = isnan(_762);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1012 = _1008 || _1010;
    float _1014 = float(_1012);
    float _1016 = _834 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1018 = fma(_864, _1000, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1020 = _936 * _920;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1024 = _762 + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1028 = _762 + _1026;
    float _1030 = _1014 * _978;
    float _1032 = -_1014;
    float _1034 = _1032 + 1.0;
    float _1036 = fma(_892, _1024, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    bool _1038 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1040 = isnan(_762);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1046 = _1042 || _1044;
    float _1048 = float(_1046);
    float _1050 = fma(_890, _1028, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1052 = -_952;
    float _1054 = _1052 + 1.0;
    float _1056 = _952 * _1034;
    float _1058 = _828 * _996;
    bool _1060 = _762 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1062 = isnan(_762);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1068 = _1064 || _1066;
    float _1070 = float(_1068);
    float _1072 = _1048 * _1054;
    float _1074 = -_1048;
    float _1076 = _1074 + 1.0;
    float _1078 = _1016 * _1058;
    float _1080 = _824 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1082 = _840 * _1058;
    float _1084 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _992);
    float _1086 = _1070 * _1076;
    float _1088 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _990);
    float _1090 = _1080 * _1058;
    float _1092 = _1078 * _1084;
    float _1094 = _1018 * _1086;
    float _1096 = _1082 * _1088;
    float _1098 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _994);
    float _1100 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1102 = -_1070;
    float _1104 = _1102 + 1.0;
    float _1106 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1108 = _1090 * _1098;
    float _1110 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1100);
    float _1112 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1094);
    float _1114 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1106);
    float _1116 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1110);
    float _1118 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1114);
    bool _1120 = _992 != 0.0;
    bool _1122 = isnan(_992);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = _802 + _1116;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1136 = fma(_1050, _1072, _1112);
    float _1138 = _794 + _1118;
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1142 = _1130 + _1140;
    float _1144 = 1.0 / _1134;
    float _1146 = in.m_53.x;
    float _1148 = in.m_53.y;
    float _1150 = in.m_53.z;
    float _1152 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1154 = _1138 + _1152;
    float _1156 = _1142 * _1142;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1160 = _1158 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1164 = _762 + _1162;
    bool _1166 = _990 == 0.0;
    bool _1168 = !_1128;
    bool _1170 = _1166 && _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1174 = _762 + _1172;
    float _1176 = 1.0 / _1160;
    float _1178 = fma(_1154, _1154, _1156);
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1182 = _1180 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1184 = fma(_922, _1164, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1186 = fma(_1036, _1056, _1136);
    bool _1188 = _994 == 0.0;
    bool _1190 = _1188 && _1170;
    float _1192 = fma(_988, _1174, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1194 = sqrt(_1178);
    float _1196 = fma(_1184, _1030, _1186);
    float _1198 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1200 = _1182 * _1144;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1204 = _762 + _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1206;
    float _1210 = fma(_1096, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1198);
    float _1212 = fma(_1192, _1020, _1196);
    float _1214 = fma(_1200, _1204, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1216 = _1208 * _1176;
    float _1218 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1210);
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1222 = _762 + _1220;
    float _1224 = _1148;
    float _1226 = _1146;
    float _1228 = _1150;
    float _1230 = _990;
    float _1232 = _1138;
    float _1234 = _1130;
    if (!_1190)
    {
        float _1236 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1148);
        _1224 = _1236;
    }
    float _1238 = _1224;
    float _1240 = fma(_1214, _1002, _1212);
    float _1242 = _790 + _1218;
    if (!_1190)
    {
        float _1244 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1146);
        _1226 = _1244;
    }
    float _1246 = _1226;
    bool _1248 = _1194 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1250 = fma(_1216, _1222, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1252 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1254 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1256 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (!_1190)
    {
        float _1258 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1150);
        _1228 = _1258;
    }
    float _1260 = _1228;
    float _1262 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1252);
    float _1264 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1254);
    float _1266 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1256);
    float _1268 = fma(_1250, _982, _1240);
    if (!_1248)
    {
        _1230 = _1242;
    }
    float _1270 = _1230;
    bool _1272 = !_1248;
    float _1274 = _1270;
    if (!_1272)
    {
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1280 = _1194 + _1278;
        float _1282 = _1242 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1284 = rsqrt(_1178);
        float _1286 = _1280 * _1276;
        float _1288 = _1286 * 0.15915493667125701904296875;
        float _1290 = _1288 * 6.283185482025146484375;
        float _1292 = cos(_1290);
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        float _1298 = _1292 + (-1.0);
        float _1300 = fma(_1296, _1282, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1302 = _1298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1304 = _1284 * _1300;
        float _1306 = fma(_1242, _1292, _1302);
        float _1308 = fma(_1154, _1304, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1310 = fma(_1142, _1304, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1274 = _1306;
        _1232 = _1308;
        _1234 = _1310;
    }
    float _1312 = _1274;
    float _1314 = _1232;
    float _1316 = _1234;
    float _1318 = -_886;
    float _1320 = _1318 + _1312;
    float _1322 = -_888;
    float _1324 = _1322 + _1314;
    float _1326 = fma(_1260, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1262);
    float _1328 = -_924;
    float _1330 = _1328 + _1316;
    float _1332 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1334 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1338 = _1320 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1340 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1332);
    float _1342 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1334);
    float _1344 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1336);
    float _1346 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1338);
    float _1348 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1340);
    float _1350 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1342);
    float _1352 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1344);
    float _1354 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1346);
    float _1356 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1358 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1360 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1362 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1364 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1366 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1368 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1370 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1372 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1364);
    float _1374 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1366);
    float _1376 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1368);
    float _1378 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1268);
    float _1380 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1372);
    float _1382 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1374);
    float _1384 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1370);
    float _1386 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1376);
    float _1388 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1380);
    float _1390 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1382);
    float _1392 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1384);
    float _1394 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1386);
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1398 = _1320 + _1396;
    float _1400 = _1388 + _1390;
    float _1402 = fma(_1260, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1264);
    float _1404 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1392);
    float _1406 = fma(_1260, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1266);
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1410 = _1324 + _1408;
    float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1414 = _1330 + _1412;
    float _1416 = _1400 * 0.5;
    out.m_55.x = _1326;
    out.m_55.y = _1402;
    out.m_55.z = _1406;
    out.m_57.x = _1378;
    out.m_59.x = _1410;
    out.m_59.y = _1398;
    out.m_59.z = _1414;
    out.gl_Position.x = _1394;
    out.gl_Position.y = _1404;
    out.gl_Position.z = _1388;
    out.gl_Position.w = _1390;
    out.m_61.z = _1416;
    out.m_61.w = _1390;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

