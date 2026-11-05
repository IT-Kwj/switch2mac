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
    float4 m_53 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_33 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_49 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_43 [[attribute(7)]];
    float4 m_45 [[attribute(8)]];
    float4 m_47 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _756 = false;
    bool _648 = false;
    bool _412 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _84;
    if (!_82)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_82)
    {
        float _90 = _86 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1828 = as_type<float>(_92);
        out.gl_Position.z = _1828;
    }
    if (!_82)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _96 = in.m_35.w;
    float _98 = float(_78);
    float _100 = in.m_37.z;
    float _102 = in.m_37.w;
    float _104 = -_96;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_96);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    out.m_39.z = _100;
    bool _118 = _106 >= _98;
    bool _120 = !_116;
    bool _122 = _118 || _120;
    float _124 = 1.0 / _98;
    out.m_39.w = _102;
    float _126 = _96;
    if (_122)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _130 = _128 * 5.0;
        _94 = as_type<int>(_130);
    }
    int _132 = _94;
    float _134 = _106 * _124;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1905 = as_type<float>(_132);
        out.gl_Position.z = _1905;
    }
    out.m_41.x = _134;
    if (_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_43.w;
    float _138 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = in.m_35.x;
    float _152 = in.m_35.y;
    float _154 = in.m_35.z;
    float _156 = in.m_30.x;
    float _158 = in.m_30.y;
    float _160 = in.m_30.z;
    float _162 = 0.0;
    float _164 = _138;
    if (!_148)
    {
        float _166 = _138 * _138;
        float _168 = _166 * 0.5;
        _162 = _168;
    }
    float _170 = _162;
    float _172 = _170;
    if (!_148)
    {
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    bool _178 = !_148;
    float _180 = 0.0;
    float _182 = _176;
    float _184 = 0.0;
    if (!_178)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _138 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _138);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _204;
        _182 = _214;
        _184 = _198;
    }
    float _216 = _180;
    float _218 = _182;
    float _220 = _184;
    bool _222 = !_148;
    float _224 = _216;
    float _226 = _220;
    if (!_222)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _138 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _224 = _240;
        _164 = _246;
    }
    float _248 = _224;
    float _250 = _164;
    float _252 = _248;
    if (!_148)
    {
        float _254 = _106 * _106;
        float _256 = _254 * 0.5;
        _252 = _256;
    }
    float _258 = _252;
    float _260 = _258;
    if (!_148)
    {
        _226 = _106;
    }
    float _262 = _226;
    float _264 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _266 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _262;
    if (!_148)
    {
        float _270 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _260 = _270;
    }
    float _272 = _260;
    bool _274 = !_148;
    float _276 = _272;
    if (!_274)
    {
        float _278 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = log2(_278);
        float _282 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _284 = _282 + 1.0;
        float _286 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = _106 * _280;
        float _290 = 1.0 / _284;
        float _292 = _286 * 0.693147182464599609375;
        float _294 = exp2(_288);
        float _296 = 1.0 / _292;
        float _298 = _294 + (-1.0);
        float _300 = -_298;
        float _302 = fma(_300, _296, _106);
        float _304 = _302 * _290;
        float _306 = _304 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _276 = _306;
    }
    float _308 = _276;
    bool _310 = !_148;
    if (!_310)
    {
        float _312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _314 = log2(_312);
        float _316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _318 = _316 + 1.0;
        float _320 = 1.0 / _318;
        float _322 = _106 * _314;
        float _324 = exp2(_322);
        float _326 = -_324;
        float _328 = _326 + 1.0;
        float _330 = _328 * _320;
        _268 = _330;
    }
    float _332 = _268;
    float _334 = fma(_250, _150, _264);
    float _336 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _338 = fma(_250, _152, _266);
    float _340 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _344 = fma(_332, _152, _336);
    float _346 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_332, _150, _340);
    float _352 = -_344;
    float _354 = _338 + _352;
    float _356 = fma(_250, _154, _346);
    float _358 = fma(_332, _154, _348);
    float _360 = fma(_334, _136, _156);
    float _362 = -_350;
    float _364 = _334 + _362;
    float _366 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _368 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _370 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _372 = fma(_338, _136, _158);
    float _374 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _366);
    float _376 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _368);
    float _378 = -_358;
    float _380 = _356 + _378;
    float _382 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _370);
    float _384 = fma(_356, _136, _160);
    float _386 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[4].z, _374);
    float _388 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[5].z, _376);
    float _390 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[6].z, _382);
    bool _392 = !_342;
    float _410;
    if (!_392)
    {
        float _394 = in.m_37.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _398 = _394 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[12].x, _106);
        float _402 = _400 * _396;
        float _404 = floor(_402);
        float _406 = -_404;
        float _408 = _402 + _406;
        _410 = _408;
        _412 = true;
    }
    else
    {
        _410 = _134;
    }
    _412 = false;
    float _414 = _410;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _418 = _414 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _422 = _414 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = _414 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _436;
    float _440 = 1.0 / _430;
    bool _442 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _444 = isnan(_414);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    bool _454 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _456 = 1.0 / _434;
    float _458 = 1.0 / _438;
    float _460 = _422 * _440;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _466;
    float _470 = fma(_464, _460, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _472 = fma(_468, _460, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _474 = _418 * _456;
    bool _476 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _478 = isnan(_414);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _488;
    bool _492 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _494 = isnan(_414);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = fma(_490, _460, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _506 = _426 * _458;
    bool _508 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _510 = isnan(_414);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -_486;
    float _522 = _520 + 1.0;
    float _524 = -_502;
    float _526 = _524 + 1.0;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _532 = _518 * _522;
    float _534 = -_518;
    float _536 = _534 + 1.0;
    float _538 = _452 * _526;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = -_452;
    float _546 = _544 + 1.0;
    float _548 = _502 * _536;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _554 = fma(_530, _474, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _556 = _470 * _538;
    float _558 = _472 * _538;
    float _560 = fma(_552, _474, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _562 = in.m_43.x;
    float _564 = in.m_43.y;
    float _566 = in.m_43.z;
    float _568 = fma(_542, _474, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _570 = _504 * _538;
    float _572 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[143].x, _556);
    float _574 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[143].y, _558);
    float _576 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[143].z, _570);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _586;
    float _590 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _592 = fma(_580, _506, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _594 = fma(_560, _548, _574);
    float _596 = fma(_588, _506, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _598 = fma(_584, _506, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _600 = fma(_554, _548, _572);
    float _602 = fma(_568, _548, _576);
    float _604 = fma(_592, _532, _594);
    float _606 = fma(_596, _532, _600);
    float _608 = fma(_598, _532, _602);
    float _610 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[146].y, _604);
    float _612 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[146].x, _606);
    float _614 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[146].z, _608);
    float _616 = _610 * _564;
    float _618 = _386 * _590;
    float _620 = _388 * _590;
    float _622 = _390 * _590;
    float _624 = _612 * _562;
    float _626 = _614 * _566;
    bool _628 = !_454;
    float _646;
    if (!_628)
    {
        float _630 = in.m_37.x;
        float _632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _634 = _630 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _636 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[11].x, _106);
        float _638 = _636 * _632;
        float _640 = floor(_638);
        float _642 = -_640;
        float _644 = _638 + _642;
        _646 = _644;
        _648 = true;
    }
    else
    {
        _646 = _134;
    }
    _648 = false;
    float _650 = _646;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _654 = _650 + _652;
    bool _656 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _658 = isnan(_650);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _668;
    bool _672 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _674 = isnan(_650);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -_666;
    float _686 = _684 + 1.0;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _688;
    float _692 = 1.0 / _670;
    bool _694 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _696 = _682 * _686;
    float _698 = -_682;
    float _700 = _698 + 1.0;
    float _702 = _654 * _692;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _704;
    float _708 = fma(_690, _702, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _710;
    float _714 = fma(_706, _702, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _716 = fma(_712, _702, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _718 = _708 * _696;
    float _720 = _716 * _696;
    float _722 = _714 * _696;
    float _724 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[107].x, _718);
    float _726 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[107].y, _720);
    float _728 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[107].z, _722);
    float _730 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[108].x, _724);
    float _732 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[108].y, _726);
    float _734 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[108].z, _728);
    bool _736 = !_694;
    float _754;
    if (!_736)
    {
        float _738 = in.m_37.x;
        float _740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _742 = _738 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _744 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _746 = _744 * _740;
        float _748 = floor(_746);
        float _750 = -_748;
        float _752 = _746 + _750;
        _754 = _752;
        _756 = true;
    }
    else
    {
        _754 = _134;
    }
    _756 = false;
    float _758 = _754;
    float _760 = in.m_45.y;
    float _762 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _764 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _768 = _766 != 0;
    float _770 = in.m_37.x;
    float _772 = in.m_37.y;
    float _774 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _776 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].x, _762);
    float _778 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].x, _764);
    float _780 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].x, _774);
    float _782 = fma(_106, 0.300000011920928955078125, -1.0);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _788 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[4].z, _776);
    float _790 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[5].z, _778);
    float _792 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[6].z, _780);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _796 = _792;
    if (_768)
    {
        float _798 = in.m_37.x;
        _794 = _798;
    }
    float _800 = _794;
    float _802 = 1.0 / _786;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _806 = _804 != 0;
    float _808 = _790 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _810 = _788 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _812 = -_808;
    float _814 = _812 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _816 = -_760;
    float _818 = _816 + 1.0;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _820;
    float _824 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _826 = _772 > 0.5;
    float _828 = _782 * 0.15915493667125701904296875;
    float _830 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _824);
    float _832 = _760;
    if (_806)
    {
        float _834 = _826 ? _818 : _760;
        _832 = _834;
    }
    float _836 = _832;
    float _838 = _822 * _802;
    bool _840 = _758 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _842 = isnan(_758);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _848 = _844 || _846;
    float _850 = float(_848);
    float _852 = in.m_45.x;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _856 = _758 + _854;
    float _858 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _860 = _758 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _862 = isnan(_758);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = -_850;
    float _874 = _872 + 1.0;
    bool _876 = _800 > 0.5;
    bool _878 = _876 && _768;
    float _880 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _882 = _808 + _880;
    float _884 = fma(_838, _856, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _886 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _858);
    float _888 = _870 * _874;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _892 = _810 + _890;
    float _894 = _882 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _896 = _792 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _900 = _898 != 0;
    float _902 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[28].x, _894);
    float _904 = -_810;
    float _906 = _904 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _908 = _814 * _814;
    float _910 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _912 = -_896;
    float _914 = _912 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _916 = fma(_906, _906, _908);
    float _918 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _910);
    float _920 = _884 * _888;
    float _922 = fma(_914, _914, _916);
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _926 = _896 + _924;
    float _928 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _918);
    float _930 = (*spvDescriptorSet0.vp_c10)._m0[6].x;
    float _932 = _852;
    float _934 = _902;
    if (_768)
    {
        _930 = _852;
    }
    float _936 = _930;
    float _938 = _916;
    float _940 = _936;
    if (_900)
    {
        float _942 = rsqrt(_922);
        _938 = _942;
    }
    float _944 = _938;
    float _946 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[28].z, _902);
    float _948 = -_870;
    float _950 = _948 + 1.0;
    float _952 = in.m_47.z;
    float _954 = _946;
    if (_878)
    {
        float _956 = -_936;
        float _958 = _956 + 1.0;
        _940 = _958;
    }
    float _960 = _940;
    float _962 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[115].x, _920);
    float _964 = in.m_47.x;
    float _966 = _828 * 6.283185482025146484375;
    float _968 = sin(_966);
    float _970 = _962;
    if (_768)
    {
        _932 = _960;
    }
    float _972 = _932;
    float _974 = _836 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _976 = in.m_47.y;
    bool _978 = _946 >= 0.0;
    if (!_900)
    {
        _934 = 0.0;
        _796 = 0.0;
    }
    float _980 = _934;
    float _982 = _796;
    float _984 = _972 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _988 = _944;
    float _990 = _980;
    float _992 = _982;
    if (_900)
    {
        float _994 = _944 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _988 = _994;
    }
    float _996 = _988;
    if (!_900)
    {
        _954 = 0.0;
    }
    float _998 = _954;
    float _1000 = _730 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1002 = _732 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1004 = _998;
    if (_900)
    {
        float _1006 = _906 * _996;
        _990 = _1006;
    }
    float _1008 = _990;
    if (_900)
    {
        float _1010 = _814 * _996;
        _1004 = _1010;
    }
    float _1012 = _1004;
    if (_900)
    {
        float _1014 = _914 * _996;
        _992 = _1014;
    }
    float _1016 = _992;
    float _1018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1020 = fma(_968, -0.02999999932944774627685546875, 1.0);
    float _1022 = fma(_968, -0.100000001490116119384765625, 0.5);
    float _1024 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[116].x, _962);
    float _1026 = _770 * 0.550000011920928955078125;
    if (_978)
    {
        _970 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1028 = _970;
    float _1030 = _734 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1032 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1034 = _974 * _986;
    float _1036 = sqrt(_922);
    int _1038 = as_type<int>(_1028);
    if (_978)
    {
        float _1040 = _1028 * 5.0;
        _1038 = as_type<int>(_1040);
    }
    int _1042 = _1038;
    float _1044 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_49.z = _952;
    float _1046 = _984 * _1018;
    float _1048 = rint(_1026);
    out.m_49.x = _964;
    out.m_51.x = _1046;
    out.m_51.y = _1034;
    if (_978)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3385 = as_type<float>(_1042);
        out.gl_Position.z = _3385;
    }
    out.m_49.y = _976;
    float _1050 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1052 = _1024 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1054 = _1052;
    if (_978)
    {
        out.m_33.x = 0.0;
    }
    out.m_53.x = _1032;
    out.m_53.y = _1044;
    out.m_53.z = _1050;
    out.m_53.w = _1052;
    if (_978)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1056 = _808 + _1012;
    float _1058 = _810 + _1008;
    float _1060 = fma(_1036, 0.0333333350718021392822265625, -0.3333333432674407958984375);
    float _1062 = precise::clamp(_1060, 0.0, 1.0);
    float _1064 = in.m_55.x;
    float _1066 = in.m_55.y;
    float _1068 = in.m_55.z;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1072 = _1056 + _1070;
    float _1074 = _896 + _1016;
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1078 = _1058 + _1076;
    float _1080 = fma(_1062, -2.0, 3.0);
    float _1082 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1084 = _1062 * _1062;
    float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1088 = _1074 + _1086;
    float _1090 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _830);
    float _1092 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1082);
    float _1094 = _1080 * _1084;
    float _1096 = -_1020;
    float _1098 = _1096 + _1022;
    float _1100 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _886);
    float _1102 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1092);
    float _1104 = _134 * _134;
    float _1106 = fma(_1094, _1098, _1020);
    float _1108 = -_1094;
    float _1110 = _1108 + 0.5;
    float _1112 = rsqrt(_928);
    bool _1114 = _1102 >= 0.0;
    float _1116 = abs(_134);
    float _1118 = _1116 * _1104;
    float _1120 = -_952;
    float _1122 = _1120 + _964;
    float _1124 = -_1094;
    float _1126 = _1124 + 1.0;
    float _1128 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1130 = fma(_1118, _1110, 1.0);
    float _1132 = _1094 * _1122;
    float _1134 = rsqrt(_1090);
    float _1136 = _1106 * _1064;
    float _1138 = _1106 * _1066;
    float _1140 = _1106 * _1068;
    float _1142 = fma(_1128, _1126, 1.0);
    float _1144 = _1068;
    if (_1114)
    {
        _1144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1146 = _1144;
    int _1148 = as_type<int>(_1146);
    if (_1114)
    {
        out.m_33.x = 0.0;
    }
    float _1150 = rsqrt(_1100);
    float _1152 = _1130 * _1142;
    float _1154 = _1132 * 0.0599999986588954925537109375;
    if (_1114)
    {
        float _1156 = _1146 * 5.0;
        _1148 = as_type<int>(_1156);
    }
    int _1158 = _1148;
    float _1160 = _1136 * _1112;
    float _1162 = _1154 * _1112;
    if (_1114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3588 = as_type<float>(_1158);
        out.gl_Position.z = _3588;
    }
    float _1164 = _1138 * _1134;
    float _1166 = _1140 * _1150;
    if (_1114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1168 = _102 * 78.233001708984375;
    float _1170 = _1164 * _1152;
    float _1172 = fma(_1160, _1152, _1162);
    float _1174 = _1166 * _1152;
    float _1176 = _616 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1178 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1170);
    float _1180 = fma(_952, 12.98980045318603515625, _1168);
    float _1182 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1172);
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1174);
    float _1188 = _1178 * _1176;
    float _1190 = fma(_964, 12.98980045318603515625, _1168);
    float _1192 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1194 = _1180 * 0.15915493667125701904296875;
    float _1196 = _1184 * _1182;
    float _1198 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1200 = _1190 * 0.15915493667125701904296875;
    float _1202 = abs(_134);
    float _1204 = log2(_1202);
    float _1206 = _1186 * _1192;
    float _1208 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1210 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1198);
    float _1212 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1214 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1208);
    float _1216 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1210);
    float _1218 = _1194 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1212);
    float _1224 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1214);
    float _1226 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_53.x = _1032;
    out.m_53.y = _1044;
    out.m_53.z = _1050;
    out.m_53.w = _1052;
    float _1228 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1222);
    float _1230 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1232 = _808 + _1226;
    float _1234 = _1200 * 6.283185482025146484375;
    float _1236 = sin(_1234);
    float _1238 = _1204 * 0.800000011920928955078125;
    float _1240 = _810 + _1230;
    float _1242 = -_1232;
    float _1244 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1246 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1248 = _1204 * 0.5;
    float _1250 = -_1240;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _1254 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1256 = isnan(0.5);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1262 = _1258 || _1260;
    float _1264 = exp2(_1238);
    float _1266 = _896 + _1246;
    float _1268 = _1220 * 43758.546875;
    float _1270 = floor(_1268);
    float _1272 = _1244 * _1244;
    float _1274 = _1236 * 43758.546875;
    float _1276 = fma(_1252, _1252, _1272);
    float _1278 = -_1266;
    float _1280 = _1278 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1282 = fma(12.0, _770, 24.0);
    float _1284 = floor(_1274);
    float _1286 = fma(_1280, _1280, _1276);
    float _1288 = fma(_772, 6.0, 12.0);
    float _1290 = _1264 * _1282;
    float _1292 = _1264 * _1288;
    float _1294 = _1290 * _964;
    float _1296 = sqrt(_1286);
    float _1298 = -_1270;
    float _1300 = _1268 + _1298;
    float _1302 = _1292 * _976;
    float _1304 = fma(_976, 12.98980045318603515625, _1168);
    float _1306 = _618 * _1302;
    float _1308 = _1304 * 0.15915493667125701904296875;
    float _1310 = exp2(_1248);
    float _1312 = fma(_618, _1294, _1306);
    float _1314 = _622 * _1302;
    float _1316 = -_1284;
    float _1318 = _1274 + _1316;
    float _1320 = fma(_1300, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1322 = fma(_622, _1294, _1314);
    float _1324 = fma(_1296, 0.0333333350718021392822265625, -0.3333333432674407958984375);
    float _1326 = precise::clamp(_1324, 0.0, 1.0);
    float _1328 = 1.0 / _1100;
    float _1330 = fma(_1318, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1332 = fma(_1326, -2.0, 3.0);
    float _1334 = _1326 * _1326;
    float _1336 = fma(_1310, _1320, _1322);
    float _1338 = _1308 * 6.283185482025146484375;
    float _1340 = sin(_1338);
    float _1342 = fma(_1310, _1330, _1312);
    float _1344 = -_1334;
    float _1346 = fma(_1332, _1344, 1.0);
    float _1348 = _1192 * _1336;
    float _1350 = _1182 * _1342;
    float _1352 = _1348 * _1346;
    float _1354 = 1.0 / _928;
    float _1356 = _1350 * _1346;
    float _1358 = fma(_1352, _1328, _1266);
    float _1360 = _620 * _1302;
    float _1362 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1364 = _1340 * 43758.546875;
    float _1366 = 1.0 / _1090;
    float _1368 = fma(_620, _1294, _1360);
    float _1370 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1362);
    float _1372 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1370);
    float _1374 = fma(_1356, _1354, _1240);
    float _1376 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1378 = _1358 + _1376;
    float _1380 = floor(_1364);
    float _1382 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1384 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1386 = _1374 + _1384;
    float _1388 = _1378 * _1378;
    float _1390 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1392 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1382);
    float _1394 = fma(_1386, _1386, _1388);
    float _1396 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1392);
    float _1398 = sqrt(_1394);
    float _1400 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1402 = -_1380;
    float _1404 = _1364 + _1402;
    float _1406 = _1390 + _1400;
    float _1408 = 1.0 / _1400;
    float _1410 = fma(_1404, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1412 = fma(_1310, _1410, _1368);
    bool _1414 = _1398 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1416 = _1176 * _1412;
    float _1418 = _1416 * _1346;
    float _1420 = _1406 * _1408;
    float _1422 = _1420 * 0.5;
    float _1424 = fma(_1418, _1366, _1232);
    float _1426 = 0.60000002384185791015625;
    float _1428 = _1232;
    if (!_1414)
    {
        _1426 = _1374;
    }
    float _1430 = _1426;
    float _1432 = _1430;
    if (!_1414)
    {
        _1054 = _1358;
    }
    float _1434 = _1054;
    float _1436 = _1434;
    if (!_1414)
    {
        _1428 = _1424;
    }
    float _1438 = _1428;
    bool _1440 = !_1414;
    float _1442 = _1438;
    if (!_1440)
    {
        float _1444 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1446 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1448 = _1398 + _1446;
        float _1450 = _1424 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1452 = rsqrt(_1394);
        float _1454 = _1448 * _1444;
        float _1456 = _1454 * 0.15915493667125701904296875;
        float _1458 = _1456 * 6.283185482025146484375;
        float _1460 = sin(_1458);
        float _1462 = _1456 * 6.283185482025146484375;
        float _1464 = cos(_1462);
        float _1466 = fma(_1460, _1450, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1468 = _1452 * _1466;
        float _1470 = _1464 + (-1.0);
        float _1472 = fma(_1386, _1468, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1474 = fma(_1378, _1468, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1476 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1478 = fma(_1424, _1464, _1476);
        _1436 = _1474;
        _1432 = _1472;
        _1442 = _1478;
    }
    float _1480 = _1436;
    float _1482 = _1432;
    float _1484 = _1442;
    float _1486 = _1016 + _1480;
    float _1488 = _1008 + _1482;
    float _1490 = _1012 + _1484;
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1494 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1492);
    float _1496 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1498 = _1490;
    float _1500 = _1488;
    if (_1262)
    {
        _1496 = _1486;
    }
    float _1502 = _1496;
    float _1504 = _1502;
    if (!_1262)
    {
        float _1506 = _1072 * _1072;
        float _1508 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1510 = -_810;
        float _1512 = _1510 + _1482;
        float _1514 = -_808;
        float _1516 = _1514 + _1484;
        float _1518 = fma(_1078, _1078, _1506);
        float _1520 = -_896;
        float _1522 = _1520 + _1480;
        float _1524 = fma(_1088, _1088, _1518);
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1528 = sqrt(_1524);
        float _1530 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1532 = precise::min(_1528, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1534 = _1532 * _1526;
        float _1536 = _1530 * _1534;
        float _1538 = fma(_1512, _1536, _1058);
        float _1540 = fma(_1516, _1536, _1056);
        float _1542 = fma(_1522, _1536, _1074);
        _1498 = _1540;
        _1500 = _1538;
        _1504 = _1542;
    }
    float _1544 = _1498;
    float _1546 = _1500;
    float _1548 = _1504;
    float _1550 = 1.0 / _1494;
    bool _1552 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1554 = isnan(0.5);
    bool _1556 = _1552 || _1554;
    bool _1558 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1560 = _1556 || _1558;
    float _1562 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1564 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1566 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1568 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1570 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1562);
    float _1572 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1564);
    float _1574 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1566);
    float _1576 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1568);
    float _1578 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1570);
    float _1580 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1572);
    float _1582 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1574);
    float _1584 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1576);
    float _1586 = _1576;
    float _1588 = _1548;
    if (_1560)
    {
        _1586 = 1.0;
    }
    float _1590 = _1586;
    float _1592 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1594 = _1590;
    if (_1560)
    {
        _1588 = 1.0;
    }
    float _1596 = _1588;
    float _1598 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1600 = _1550 * _1598;
    float _1602 = _1596;
    if (!_1560)
    {
        float _1604 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1606 = _1604 * 0.15915493667125701904296875;
        float _1608 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1610 = _1606 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        float _1614 = _1608 * 0.15915493667125701904296875;
        float _1616 = _1606 * 6.283185482025146484375;
        float _1618 = sin(_1616);
        float _1620 = 1.0 / _1612;
        float _1622 = _1614 * 6.283185482025146484375;
        float _1624 = cos(_1622);
        float _1626 = _1618 * _1620;
        float _1628 = _1614 * 6.283185482025146484375;
        float _1630 = sin(_1628);
        float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1634 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1632;
        float _1636 = _1624 * _1626;
        float _1638 = 1.0 / _1634;
        float _1640 = 1.0 / _1636;
        float _1642 = _1630 * _1640;
        float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1646 = fma(_1600, _1642, _1644);
        float _1648 = _1646 * _1638;
        float _1650 = precise::clamp(_1648, 0.0, 1.0);
        _1594 = _1650;
    }
    float _1652 = _1594;
    if (!_1560)
    {
        float _1654 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1656 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1658 = _1654 * 0.15915493667125701904296875;
        float _1660 = _1656 * 0.15915493667125701904296875;
        float _1662 = _1658 * 6.283185482025146484375;
        float _1664 = cos(_1662);
        float _1666 = _1658 * 6.283185482025146484375;
        float _1668 = sin(_1666);
        float _1670 = 1.0 / _1664;
        float _1672 = _1660 * 6.283185482025146484375;
        float _1674 = cos(_1672);
        float _1676 = _1668 * _1670;
        float _1678 = _1660 * 6.283185482025146484375;
        float _1680 = sin(_1678);
        float _1682 = _1674 * _1676;
        float _1684 = 1.0 / _1682;
        float _1686 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1688 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1686;
        float _1690 = 1.0 / _1688;
        float _1692 = _1680 * _1684;
        float _1694 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1696 = fma(_1600, _1692, _1694);
        float _1698 = _1696 * _1690;
        float _1700 = precise::clamp(_1698, 0.0, 1.0);
        float _1702 = -_1700;
        float _1704 = _1702 + 1.0;
        _1602 = _1704;
    }
    float _1706 = _1602;
    float _1708 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1710 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1712 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1714 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1716 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1718 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1710);
    float _1720 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1712);
    float _1722 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1724 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1714);
    float _1726 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1716);
    float _1728 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1730 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1718);
    float _1732 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1720);
    bool _1734 = _1652 > 0.0;
    bool _1736 = isnan(_1652);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan(0.0);
    bool _1742 = _1738 || _1740;
    float _1744 = _1652 * _1706;
    float _1746 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1724);
    float _1748 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1730);
    float _1750 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1732);
    bool _1752 = _1706 <= 0.0;
    bool _1754 = !_1742;
    bool _1756 = _1752 || _1754;
    float _1758 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1726);
    float _1760 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1746);
    float _1762 = _1744 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1764 = _1748 + _1750;
    float _1766 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1758);
    float _1768 = _1762 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1770 = _1764 * 0.5;
    out.m_57.x = _1058;
    out.m_57.y = _1056;
    out.m_57.z = _1074;
    out.m_33.x = _1768;
    out.gl_Position.x = _1760;
    out.gl_Position.y = _1766;
    out.gl_Position.z = _1748;
    out.gl_Position.w = _1750;
    out.m_59.z = _1770;
    out.m_59.w = _1750;
    if (!_1756)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1772 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1772;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _756 = false;
    bool _648 = false;
    bool _412 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _84;
    if (!_82)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_82)
    {
        float _90 = _86 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1828 = as_type<float>(_92);
        out.gl_Position.z = _1828;
    }
    if (!_82)
    {
        return out;
    }
    float _96 = in.m_35.w;
    float _98 = float(_78);
    float _100 = in.m_37.z;
    float _102 = in.m_37.w;
    float _104 = -_96;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_96);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    out.m_39.z = _100;
    bool _118 = _106 >= _98;
    bool _120 = !_116;
    bool _122 = _118 || _120;
    float _124 = 1.0 / _98;
    out.m_39.w = _102;
    float _126 = _96;
    if (_122)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _130 = _128 * 5.0;
        _94 = as_type<int>(_130);
    }
    int _132 = _94;
    float _134 = _106 * _124;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1905 = as_type<float>(_132);
        out.gl_Position.z = _1905;
    }
    out.m_41.x = _134;
    if (_122)
    {
        return out;
    }
    float _136 = in.m_43.w;
    float _138 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = in.m_35.x;
    float _152 = in.m_35.y;
    float _154 = in.m_35.z;
    float _156 = in.m_30.x;
    float _158 = in.m_30.y;
    float _160 = in.m_30.z;
    float _162 = 0.0;
    float _164 = _138;
    if (!_148)
    {
        float _166 = _138 * _138;
        float _168 = _166 * 0.5;
        _162 = _168;
    }
    float _170 = _162;
    float _172 = _170;
    if (!_148)
    {
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    bool _178 = !_148;
    float _180 = 0.0;
    float _182 = _176;
    float _184 = 0.0;
    if (!_178)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _138 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _138);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _204;
        _182 = _214;
        _184 = _198;
    }
    float _216 = _180;
    float _218 = _182;
    float _220 = _184;
    bool _222 = !_148;
    float _224 = _216;
    float _226 = _220;
    if (!_222)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _138 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _224 = _240;
        _164 = _246;
    }
    float _248 = _224;
    float _250 = _164;
    float _252 = _248;
    if (!_148)
    {
        float _254 = _106 * _106;
        float _256 = _254 * 0.5;
        _252 = _256;
    }
    float _258 = _252;
    float _260 = _258;
    if (!_148)
    {
        _226 = _106;
    }
    float _262 = _226;
    float _264 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _266 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _262;
    if (!_148)
    {
        float _270 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _260 = _270;
    }
    float _272 = _260;
    bool _274 = !_148;
    float _276 = _272;
    if (!_274)
    {
        float _278 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = log2(_278);
        float _282 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _284 = _282 + 1.0;
        float _286 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = _106 * _280;
        float _290 = 1.0 / _284;
        float _292 = _286 * 0.693147182464599609375;
        float _294 = exp2(_288);
        float _296 = 1.0 / _292;
        float _298 = _294 + (-1.0);
        float _300 = -_298;
        float _302 = fma(_300, _296, _106);
        float _304 = _302 * _290;
        float _306 = _304 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _276 = _306;
    }
    float _308 = _276;
    bool _310 = !_148;
    if (!_310)
    {
        float _312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _314 = log2(_312);
        float _316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _318 = _316 + 1.0;
        float _320 = 1.0 / _318;
        float _322 = _106 * _314;
        float _324 = exp2(_322);
        float _326 = -_324;
        float _328 = _326 + 1.0;
        float _330 = _328 * _320;
        _268 = _330;
    }
    float _332 = _268;
    float _334 = fma(_250, _150, _264);
    float _336 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _338 = fma(_250, _152, _266);
    float _340 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _344 = fma(_332, _152, _336);
    float _346 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_332, _150, _340);
    float _352 = -_344;
    float _354 = _338 + _352;
    float _356 = fma(_250, _154, _346);
    float _358 = fma(_332, _154, _348);
    float _360 = fma(_334, _136, _156);
    float _362 = -_350;
    float _364 = _334 + _362;
    float _366 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _368 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _370 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _372 = fma(_338, _136, _158);
    float _374 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _366);
    float _376 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _368);
    float _378 = -_358;
    float _380 = _356 + _378;
    float _382 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _370);
    float _384 = fma(_356, _136, _160);
    float _386 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[4].z, _374);
    float _388 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[5].z, _376);
    float _390 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[6].z, _382);
    bool _392 = !_342;
    float _410;
    if (!_392)
    {
        float _394 = in.m_37.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _398 = _394 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[12].x, _106);
        float _402 = _400 * _396;
        float _404 = floor(_402);
        float _406 = -_404;
        float _408 = _402 + _406;
        _410 = _408;
        _412 = true;
    }
    else
    {
        _410 = _134;
    }
    _412 = false;
    float _414 = _410;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _418 = _414 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _422 = _414 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = _414 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _436;
    float _440 = 1.0 / _430;
    bool _442 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _444 = isnan(_414);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    bool _454 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _456 = 1.0 / _434;
    float _458 = 1.0 / _438;
    float _460 = _422 * _440;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _466;
    float _470 = fma(_464, _460, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _472 = fma(_468, _460, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _474 = _418 * _456;
    bool _476 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _478 = isnan(_414);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _488;
    bool _492 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _494 = isnan(_414);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = fma(_490, _460, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _506 = _426 * _458;
    bool _508 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _510 = isnan(_414);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -_486;
    float _522 = _520 + 1.0;
    float _524 = -_502;
    float _526 = _524 + 1.0;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _532 = _518 * _522;
    float _534 = -_518;
    float _536 = _534 + 1.0;
    float _538 = _452 * _526;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = -_452;
    float _546 = _544 + 1.0;
    float _548 = _502 * _536;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _554 = fma(_530, _474, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _556 = _470 * _538;
    float _558 = _472 * _538;
    float _560 = fma(_552, _474, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _562 = in.m_43.x;
    float _564 = in.m_43.y;
    float _566 = in.m_43.z;
    float _568 = fma(_542, _474, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _570 = _504 * _538;
    float _572 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[143].x, _556);
    float _574 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[143].y, _558);
    float _576 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[143].z, _570);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _586;
    float _590 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _592 = fma(_580, _506, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _594 = fma(_560, _548, _574);
    float _596 = fma(_588, _506, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _598 = fma(_584, _506, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _600 = fma(_554, _548, _572);
    float _602 = fma(_568, _548, _576);
    float _604 = fma(_592, _532, _594);
    float _606 = fma(_596, _532, _600);
    float _608 = fma(_598, _532, _602);
    float _610 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[146].y, _604);
    float _612 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[146].x, _606);
    float _614 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[146].z, _608);
    float _616 = _610 * _564;
    float _618 = _386 * _590;
    float _620 = _388 * _590;
    float _622 = _390 * _590;
    float _624 = _612 * _562;
    float _626 = _614 * _566;
    bool _628 = !_454;
    float _646;
    if (!_628)
    {
        float _630 = in.m_37.x;
        float _632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _634 = _630 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _636 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[11].x, _106);
        float _638 = _636 * _632;
        float _640 = floor(_638);
        float _642 = -_640;
        float _644 = _638 + _642;
        _646 = _644;
        _648 = true;
    }
    else
    {
        _646 = _134;
    }
    _648 = false;
    float _650 = _646;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _654 = _650 + _652;
    bool _656 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _658 = isnan(_650);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _668;
    bool _672 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _674 = isnan(_650);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -_666;
    float _686 = _684 + 1.0;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _688;
    float _692 = 1.0 / _670;
    bool _694 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _696 = _682 * _686;
    float _698 = -_682;
    float _700 = _698 + 1.0;
    float _702 = _654 * _692;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _704;
    float _708 = fma(_690, _702, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _710;
    float _714 = fma(_706, _702, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _716 = fma(_712, _702, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _718 = _708 * _696;
    float _720 = _716 * _696;
    float _722 = _714 * _696;
    float _724 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[107].x, _718);
    float _726 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[107].y, _720);
    float _728 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[107].z, _722);
    float _730 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[108].x, _724);
    float _732 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[108].y, _726);
    float _734 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[108].z, _728);
    bool _736 = !_694;
    float _754;
    if (!_736)
    {
        float _738 = in.m_37.x;
        float _740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _742 = _738 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _744 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _746 = _744 * _740;
        float _748 = floor(_746);
        float _750 = -_748;
        float _752 = _746 + _750;
        _754 = _752;
        _756 = true;
    }
    else
    {
        _754 = _134;
    }
    _756 = false;
    float _758 = _754;
    float _760 = in.m_45.y;
    float _762 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _764 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _768 = _766 != 0;
    float _770 = in.m_37.x;
    float _772 = in.m_37.y;
    float _774 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _776 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].x, _762);
    float _778 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].x, _764);
    float _780 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].x, _774);
    float _782 = fma(_106, 0.300000011920928955078125, -1.0);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _788 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[4].z, _776);
    float _790 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[5].z, _778);
    float _792 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[6].z, _780);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _796 = _792;
    if (_768)
    {
        float _798 = in.m_37.x;
        _794 = _798;
    }
    float _800 = _794;
    float _802 = 1.0 / _786;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _806 = _804 != 0;
    float _808 = _790 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _810 = _788 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _812 = -_808;
    float _814 = _812 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _816 = -_760;
    float _818 = _816 + 1.0;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _820;
    float _824 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _826 = _772 > 0.5;
    float _828 = _782 * 0.15915493667125701904296875;
    float _830 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _824);
    float _832 = _760;
    if (_806)
    {
        float _834 = _826 ? _818 : _760;
        _832 = _834;
    }
    float _836 = _832;
    float _838 = _822 * _802;
    bool _840 = _758 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _842 = isnan(_758);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _848 = _844 || _846;
    float _850 = float(_848);
    float _852 = in.m_45.x;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _856 = _758 + _854;
    float _858 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _860 = _758 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _862 = isnan(_758);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = -_850;
    float _874 = _872 + 1.0;
    bool _876 = _800 > 0.5;
    bool _878 = _876 && _768;
    float _880 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _882 = _808 + _880;
    float _884 = fma(_838, _856, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _886 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _858);
    float _888 = _870 * _874;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _892 = _810 + _890;
    float _894 = _882 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _896 = _792 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _900 = _898 != 0;
    float _902 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[28].x, _894);
    float _904 = -_810;
    float _906 = _904 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _908 = _814 * _814;
    float _910 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _912 = -_896;
    float _914 = _912 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _916 = fma(_906, _906, _908);
    float _918 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _910);
    float _920 = _884 * _888;
    float _922 = fma(_914, _914, _916);
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _926 = _896 + _924;
    float _928 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _918);
    float _930 = (*spvDescriptorSet0.vp_c10)._m0[6].x;
    float _932 = _852;
    float _934 = _902;
    if (_768)
    {
        _930 = _852;
    }
    float _936 = _930;
    float _938 = _916;
    float _940 = _936;
    if (_900)
    {
        float _942 = rsqrt(_922);
        _938 = _942;
    }
    float _944 = _938;
    float _946 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[28].z, _902);
    float _948 = -_870;
    float _950 = _948 + 1.0;
    float _952 = in.m_47.z;
    float _954 = _946;
    if (_878)
    {
        float _956 = -_936;
        float _958 = _956 + 1.0;
        _940 = _958;
    }
    float _960 = _940;
    float _962 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[115].x, _920);
    float _964 = in.m_47.x;
    float _966 = _828 * 6.283185482025146484375;
    float _968 = sin(_966);
    float _970 = _962;
    if (_768)
    {
        _932 = _960;
    }
    float _972 = _932;
    float _974 = _836 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _976 = in.m_47.y;
    bool _978 = _946 >= 0.0;
    if (!_900)
    {
        _934 = 0.0;
        _796 = 0.0;
    }
    float _980 = _934;
    float _982 = _796;
    float _984 = _972 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _988 = _944;
    float _990 = _980;
    float _992 = _982;
    if (_900)
    {
        float _994 = _944 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _988 = _994;
    }
    float _996 = _988;
    if (!_900)
    {
        _954 = 0.0;
    }
    float _998 = _954;
    float _1000 = _730 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1002 = _732 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1004 = _998;
    if (_900)
    {
        float _1006 = _906 * _996;
        _990 = _1006;
    }
    float _1008 = _990;
    if (_900)
    {
        float _1010 = _814 * _996;
        _1004 = _1010;
    }
    float _1012 = _1004;
    if (_900)
    {
        float _1014 = _914 * _996;
        _992 = _1014;
    }
    float _1016 = _992;
    float _1018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1020 = fma(_968, -0.02999999932944774627685546875, 1.0);
    float _1022 = fma(_968, -0.100000001490116119384765625, 0.5);
    float _1024 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[116].x, _962);
    float _1026 = _770 * 0.550000011920928955078125;
    if (_978)
    {
        _970 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1028 = _970;
    float _1030 = _734 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1032 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1034 = _974 * _986;
    float _1036 = sqrt(_922);
    int _1038 = as_type<int>(_1028);
    if (_978)
    {
        float _1040 = _1028 * 5.0;
        _1038 = as_type<int>(_1040);
    }
    int _1042 = _1038;
    float _1044 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_49.z = _952;
    float _1046 = _984 * _1018;
    float _1048 = rint(_1026);
    out.m_49.x = _964;
    out.m_51.x = _1046;
    out.m_51.y = _1034;
    if (_978)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3385 = as_type<float>(_1042);
        out.gl_Position.z = _3385;
    }
    out.m_49.y = _976;
    float _1050 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1052 = _1024 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1054 = _1052;
    if (_978)
    {
        out.m_33.x = 0.0;
    }
    out.m_53.x = _1032;
    out.m_53.y = _1044;
    out.m_53.z = _1050;
    out.m_53.w = _1052;
    if (_978)
    {
        return out;
    }
    float _1056 = _808 + _1012;
    float _1058 = _810 + _1008;
    float _1060 = fma(_1036, 0.0333333350718021392822265625, -0.3333333432674407958984375);
    float _1062 = precise::clamp(_1060, 0.0, 1.0);
    float _1064 = in.m_55.x;
    float _1066 = in.m_55.y;
    float _1068 = in.m_55.z;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1072 = _1056 + _1070;
    float _1074 = _896 + _1016;
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1078 = _1058 + _1076;
    float _1080 = fma(_1062, -2.0, 3.0);
    float _1082 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1084 = _1062 * _1062;
    float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1088 = _1074 + _1086;
    float _1090 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _830);
    float _1092 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1082);
    float _1094 = _1080 * _1084;
    float _1096 = -_1020;
    float _1098 = _1096 + _1022;
    float _1100 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _886);
    float _1102 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1092);
    float _1104 = _134 * _134;
    float _1106 = fma(_1094, _1098, _1020);
    float _1108 = -_1094;
    float _1110 = _1108 + 0.5;
    float _1112 = rsqrt(_928);
    bool _1114 = _1102 >= 0.0;
    float _1116 = abs(_134);
    float _1118 = _1116 * _1104;
    float _1120 = -_952;
    float _1122 = _1120 + _964;
    float _1124 = -_1094;
    float _1126 = _1124 + 1.0;
    float _1128 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1130 = fma(_1118, _1110, 1.0);
    float _1132 = _1094 * _1122;
    float _1134 = rsqrt(_1090);
    float _1136 = _1106 * _1064;
    float _1138 = _1106 * _1066;
    float _1140 = _1106 * _1068;
    float _1142 = fma(_1128, _1126, 1.0);
    float _1144 = _1068;
    if (_1114)
    {
        _1144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1146 = _1144;
    int _1148 = as_type<int>(_1146);
    if (_1114)
    {
        out.m_33.x = 0.0;
    }
    float _1150 = rsqrt(_1100);
    float _1152 = _1130 * _1142;
    float _1154 = _1132 * 0.0599999986588954925537109375;
    if (_1114)
    {
        float _1156 = _1146 * 5.0;
        _1148 = as_type<int>(_1156);
    }
    int _1158 = _1148;
    float _1160 = _1136 * _1112;
    float _1162 = _1154 * _1112;
    if (_1114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3588 = as_type<float>(_1158);
        out.gl_Position.z = _3588;
    }
    float _1164 = _1138 * _1134;
    float _1166 = _1140 * _1150;
    if (_1114)
    {
        return out;
    }
    float _1168 = _102 * 78.233001708984375;
    float _1170 = _1164 * _1152;
    float _1172 = fma(_1160, _1152, _1162);
    float _1174 = _1166 * _1152;
    float _1176 = _616 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1178 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1170);
    float _1180 = fma(_952, 12.98980045318603515625, _1168);
    float _1182 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1172);
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1174);
    float _1188 = _1178 * _1176;
    float _1190 = fma(_964, 12.98980045318603515625, _1168);
    float _1192 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1194 = _1180 * 0.15915493667125701904296875;
    float _1196 = _1184 * _1182;
    float _1198 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1200 = _1190 * 0.15915493667125701904296875;
    float _1202 = abs(_134);
    float _1204 = log2(_1202);
    float _1206 = _1186 * _1192;
    float _1208 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1210 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1198);
    float _1212 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1214 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1208);
    float _1216 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1210);
    float _1218 = _1194 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1212);
    float _1224 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1214);
    float _1226 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_53.x = _1032;
    out.m_53.y = _1044;
    out.m_53.z = _1050;
    out.m_53.w = _1052;
    float _1228 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1222);
    float _1230 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1232 = _808 + _1226;
    float _1234 = _1200 * 6.283185482025146484375;
    float _1236 = sin(_1234);
    float _1238 = _1204 * 0.800000011920928955078125;
    float _1240 = _810 + _1230;
    float _1242 = -_1232;
    float _1244 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1246 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1248 = _1204 * 0.5;
    float _1250 = -_1240;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _1254 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1256 = isnan(0.5);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1262 = _1258 || _1260;
    float _1264 = exp2(_1238);
    float _1266 = _896 + _1246;
    float _1268 = _1220 * 43758.546875;
    float _1270 = floor(_1268);
    float _1272 = _1244 * _1244;
    float _1274 = _1236 * 43758.546875;
    float _1276 = fma(_1252, _1252, _1272);
    float _1278 = -_1266;
    float _1280 = _1278 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1282 = fma(12.0, _770, 24.0);
    float _1284 = floor(_1274);
    float _1286 = fma(_1280, _1280, _1276);
    float _1288 = fma(_772, 6.0, 12.0);
    float _1290 = _1264 * _1282;
    float _1292 = _1264 * _1288;
    float _1294 = _1290 * _964;
    float _1296 = sqrt(_1286);
    float _1298 = -_1270;
    float _1300 = _1268 + _1298;
    float _1302 = _1292 * _976;
    float _1304 = fma(_976, 12.98980045318603515625, _1168);
    float _1306 = _618 * _1302;
    float _1308 = _1304 * 0.15915493667125701904296875;
    float _1310 = exp2(_1248);
    float _1312 = fma(_618, _1294, _1306);
    float _1314 = _622 * _1302;
    float _1316 = -_1284;
    float _1318 = _1274 + _1316;
    float _1320 = fma(_1300, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1322 = fma(_622, _1294, _1314);
    float _1324 = fma(_1296, 0.0333333350718021392822265625, -0.3333333432674407958984375);
    float _1326 = precise::clamp(_1324, 0.0, 1.0);
    float _1328 = 1.0 / _1100;
    float _1330 = fma(_1318, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1332 = fma(_1326, -2.0, 3.0);
    float _1334 = _1326 * _1326;
    float _1336 = fma(_1310, _1320, _1322);
    float _1338 = _1308 * 6.283185482025146484375;
    float _1340 = sin(_1338);
    float _1342 = fma(_1310, _1330, _1312);
    float _1344 = -_1334;
    float _1346 = fma(_1332, _1344, 1.0);
    float _1348 = _1192 * _1336;
    float _1350 = _1182 * _1342;
    float _1352 = _1348 * _1346;
    float _1354 = 1.0 / _928;
    float _1356 = _1350 * _1346;
    float _1358 = fma(_1352, _1328, _1266);
    float _1360 = _620 * _1302;
    float _1362 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1364 = _1340 * 43758.546875;
    float _1366 = 1.0 / _1090;
    float _1368 = fma(_620, _1294, _1360);
    float _1370 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1362);
    float _1372 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1370);
    float _1374 = fma(_1356, _1354, _1240);
    float _1376 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1378 = _1358 + _1376;
    float _1380 = floor(_1364);
    float _1382 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1384 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1386 = _1374 + _1384;
    float _1388 = _1378 * _1378;
    float _1390 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1392 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1382);
    float _1394 = fma(_1386, _1386, _1388);
    float _1396 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1392);
    float _1398 = sqrt(_1394);
    float _1400 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1402 = -_1380;
    float _1404 = _1364 + _1402;
    float _1406 = _1390 + _1400;
    float _1408 = 1.0 / _1400;
    float _1410 = fma(_1404, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1412 = fma(_1310, _1410, _1368);
    bool _1414 = _1398 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1416 = _1176 * _1412;
    float _1418 = _1416 * _1346;
    float _1420 = _1406 * _1408;
    float _1422 = _1420 * 0.5;
    float _1424 = fma(_1418, _1366, _1232);
    float _1426 = 0.60000002384185791015625;
    float _1428 = _1232;
    if (!_1414)
    {
        _1426 = _1374;
    }
    float _1430 = _1426;
    float _1432 = _1430;
    if (!_1414)
    {
        _1054 = _1358;
    }
    float _1434 = _1054;
    float _1436 = _1434;
    if (!_1414)
    {
        _1428 = _1424;
    }
    float _1438 = _1428;
    bool _1440 = !_1414;
    float _1442 = _1438;
    if (!_1440)
    {
        float _1444 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1446 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1448 = _1398 + _1446;
        float _1450 = _1424 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1452 = rsqrt(_1394);
        float _1454 = _1448 * _1444;
        float _1456 = _1454 * 0.15915493667125701904296875;
        float _1458 = _1456 * 6.283185482025146484375;
        float _1460 = sin(_1458);
        float _1462 = _1456 * 6.283185482025146484375;
        float _1464 = cos(_1462);
        float _1466 = fma(_1460, _1450, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1468 = _1452 * _1466;
        float _1470 = _1464 + (-1.0);
        float _1472 = fma(_1386, _1468, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1474 = fma(_1378, _1468, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1476 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1478 = fma(_1424, _1464, _1476);
        _1436 = _1474;
        _1432 = _1472;
        _1442 = _1478;
    }
    float _1480 = _1436;
    float _1482 = _1432;
    float _1484 = _1442;
    float _1486 = _1016 + _1480;
    float _1488 = _1008 + _1482;
    float _1490 = _1012 + _1484;
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1494 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1492);
    float _1496 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1498 = _1490;
    float _1500 = _1488;
    if (_1262)
    {
        _1496 = _1486;
    }
    float _1502 = _1496;
    float _1504 = _1502;
    if (!_1262)
    {
        float _1506 = _1072 * _1072;
        float _1508 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1510 = -_810;
        float _1512 = _1510 + _1482;
        float _1514 = -_808;
        float _1516 = _1514 + _1484;
        float _1518 = fma(_1078, _1078, _1506);
        float _1520 = -_896;
        float _1522 = _1520 + _1480;
        float _1524 = fma(_1088, _1088, _1518);
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1528 = sqrt(_1524);
        float _1530 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1532 = precise::min(_1528, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1534 = _1532 * _1526;
        float _1536 = _1530 * _1534;
        float _1538 = fma(_1512, _1536, _1058);
        float _1540 = fma(_1516, _1536, _1056);
        float _1542 = fma(_1522, _1536, _1074);
        _1498 = _1540;
        _1500 = _1538;
        _1504 = _1542;
    }
    float _1544 = _1498;
    float _1546 = _1500;
    float _1548 = _1504;
    float _1550 = 1.0 / _1494;
    bool _1552 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1554 = isnan(0.5);
    bool _1556 = _1552 || _1554;
    bool _1558 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1560 = _1556 || _1558;
    float _1562 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1564 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1566 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1568 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1570 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1562);
    float _1572 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1564);
    float _1574 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1566);
    float _1576 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1568);
    float _1578 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1570);
    float _1580 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1572);
    float _1582 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1574);
    float _1584 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1576);
    float _1586 = _1576;
    float _1588 = _1548;
    if (_1560)
    {
        _1586 = 1.0;
    }
    float _1590 = _1586;
    float _1592 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1594 = _1590;
    if (_1560)
    {
        _1588 = 1.0;
    }
    float _1596 = _1588;
    float _1598 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1600 = _1550 * _1598;
    float _1602 = _1596;
    if (!_1560)
    {
        float _1604 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1606 = _1604 * 0.15915493667125701904296875;
        float _1608 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1610 = _1606 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        float _1614 = _1608 * 0.15915493667125701904296875;
        float _1616 = _1606 * 6.283185482025146484375;
        float _1618 = sin(_1616);
        float _1620 = 1.0 / _1612;
        float _1622 = _1614 * 6.283185482025146484375;
        float _1624 = cos(_1622);
        float _1626 = _1618 * _1620;
        float _1628 = _1614 * 6.283185482025146484375;
        float _1630 = sin(_1628);
        float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1634 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1632;
        float _1636 = _1624 * _1626;
        float _1638 = 1.0 / _1634;
        float _1640 = 1.0 / _1636;
        float _1642 = _1630 * _1640;
        float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1646 = fma(_1600, _1642, _1644);
        float _1648 = _1646 * _1638;
        float _1650 = precise::clamp(_1648, 0.0, 1.0);
        _1594 = _1650;
    }
    float _1652 = _1594;
    if (!_1560)
    {
        float _1654 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1656 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1658 = _1654 * 0.15915493667125701904296875;
        float _1660 = _1656 * 0.15915493667125701904296875;
        float _1662 = _1658 * 6.283185482025146484375;
        float _1664 = cos(_1662);
        float _1666 = _1658 * 6.283185482025146484375;
        float _1668 = sin(_1666);
        float _1670 = 1.0 / _1664;
        float _1672 = _1660 * 6.283185482025146484375;
        float _1674 = cos(_1672);
        float _1676 = _1668 * _1670;
        float _1678 = _1660 * 6.283185482025146484375;
        float _1680 = sin(_1678);
        float _1682 = _1674 * _1676;
        float _1684 = 1.0 / _1682;
        float _1686 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1688 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1686;
        float _1690 = 1.0 / _1688;
        float _1692 = _1680 * _1684;
        float _1694 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1696 = fma(_1600, _1692, _1694);
        float _1698 = _1696 * _1690;
        float _1700 = precise::clamp(_1698, 0.0, 1.0);
        float _1702 = -_1700;
        float _1704 = _1702 + 1.0;
        _1602 = _1704;
    }
    float _1706 = _1602;
    float _1708 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1710 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1712 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1714 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1716 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1718 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1710);
    float _1720 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1712);
    float _1722 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1724 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1714);
    float _1726 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1716);
    float _1728 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1730 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1718);
    float _1732 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1720);
    bool _1734 = _1652 > 0.0;
    bool _1736 = isnan(_1652);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan(0.0);
    bool _1742 = _1738 || _1740;
    float _1744 = _1652 * _1706;
    float _1746 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1724);
    float _1748 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1730);
    float _1750 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1732);
    bool _1752 = _1706 <= 0.0;
    bool _1754 = !_1742;
    bool _1756 = _1752 || _1754;
    float _1758 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1726);
    float _1760 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1746);
    float _1762 = _1744 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1764 = _1748 + _1750;
    float _1766 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1758);
    float _1768 = _1762 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1770 = _1764 * 0.5;
    out.m_57.x = _1058;
    out.m_57.y = _1056;
    out.m_57.z = _1074;
    out.m_33.x = _1768;
    out.gl_Position.x = _1760;
    out.gl_Position.y = _1766;
    out.gl_Position.z = _1748;
    out.gl_Position.w = _1750;
    out.m_59.z = _1770;
    out.m_59.w = _1750;
    if (!_1756)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1772 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1772;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _756 = false;
    bool _648 = false;
    bool _412 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _84;
    if (!_82)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_82)
    {
        float _90 = _86 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1828 = as_type<float>(_92);
        out.gl_Position.z = _1828;
    }
    if (!_82)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _96 = in.m_35.w;
    float _98 = float(_78);
    float _100 = in.m_37.z;
    float _102 = in.m_37.w;
    float _104 = -_96;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_96);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    out.m_39.z = _100;
    bool _118 = _106 >= _98;
    bool _120 = !_116;
    bool _122 = _118 || _120;
    float _124 = 1.0 / _98;
    out.m_39.w = _102;
    float _126 = _96;
    if (_122)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _130 = _128 * 5.0;
        _94 = as_type<int>(_130);
    }
    int _132 = _94;
    float _134 = _106 * _124;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1905 = as_type<float>(_132);
        out.gl_Position.z = _1905;
    }
    out.m_41.x = _134;
    if (_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_43.w;
    float _138 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = in.m_35.x;
    float _152 = in.m_35.y;
    float _154 = in.m_35.z;
    float _156 = in.m_30.x;
    float _158 = in.m_30.y;
    float _160 = in.m_30.z;
    float _162 = 0.0;
    float _164 = _138;
    if (!_148)
    {
        float _166 = _138 * _138;
        float _168 = _166 * 0.5;
        _162 = _168;
    }
    float _170 = _162;
    float _172 = _170;
    if (!_148)
    {
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    bool _178 = !_148;
    float _180 = 0.0;
    float _182 = _176;
    float _184 = 0.0;
    if (!_178)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _138 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _138);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _204;
        _182 = _214;
        _184 = _198;
    }
    float _216 = _180;
    float _218 = _182;
    float _220 = _184;
    bool _222 = !_148;
    float _224 = _216;
    float _226 = _220;
    if (!_222)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _138 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _224 = _240;
        _164 = _246;
    }
    float _248 = _224;
    float _250 = _164;
    float _252 = _248;
    if (!_148)
    {
        float _254 = _106 * _106;
        float _256 = _254 * 0.5;
        _252 = _256;
    }
    float _258 = _252;
    float _260 = _258;
    if (!_148)
    {
        _226 = _106;
    }
    float _262 = _226;
    float _264 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _266 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _262;
    if (!_148)
    {
        float _270 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _260 = _270;
    }
    float _272 = _260;
    bool _274 = !_148;
    float _276 = _272;
    if (!_274)
    {
        float _278 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _280 = log2(_278);
        float _282 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _284 = _282 + 1.0;
        float _286 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = _106 * _280;
        float _290 = 1.0 / _284;
        float _292 = _286 * 0.693147182464599609375;
        float _294 = exp2(_288);
        float _296 = 1.0 / _292;
        float _298 = _294 + (-1.0);
        float _300 = -_298;
        float _302 = fma(_300, _296, _106);
        float _304 = _302 * _290;
        float _306 = _304 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _276 = _306;
    }
    float _308 = _276;
    bool _310 = !_148;
    if (!_310)
    {
        float _312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _314 = log2(_312);
        float _316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _318 = _316 + 1.0;
        float _320 = 1.0 / _318;
        float _322 = _106 * _314;
        float _324 = exp2(_322);
        float _326 = -_324;
        float _328 = _326 + 1.0;
        float _330 = _328 * _320;
        _268 = _330;
    }
    float _332 = _268;
    float _334 = fma(_250, _150, _264);
    float _336 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _338 = fma(_250, _152, _266);
    float _340 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _344 = fma(_332, _152, _336);
    float _346 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _348 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_332, _150, _340);
    float _352 = -_344;
    float _354 = _338 + _352;
    float _356 = fma(_250, _154, _346);
    float _358 = fma(_332, _154, _348);
    float _360 = fma(_334, _136, _156);
    float _362 = -_350;
    float _364 = _334 + _362;
    float _366 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _368 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _370 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _372 = fma(_338, _136, _158);
    float _374 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _366);
    float _376 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _368);
    float _378 = -_358;
    float _380 = _356 + _378;
    float _382 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _370);
    float _384 = fma(_356, _136, _160);
    float _386 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[4].z, _374);
    float _388 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[5].z, _376);
    float _390 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[6].z, _382);
    bool _392 = !_342;
    float _410;
    if (!_392)
    {
        float _394 = in.m_37.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _398 = _394 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[12].x, _106);
        float _402 = _400 * _396;
        float _404 = floor(_402);
        float _406 = -_404;
        float _408 = _402 + _406;
        _410 = _408;
        _412 = true;
    }
    else
    {
        _410 = _134;
    }
    _412 = false;
    float _414 = _410;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _418 = _414 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _422 = _414 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = _414 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _436;
    float _440 = 1.0 / _430;
    bool _442 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _444 = isnan(_414);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    bool _454 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _456 = 1.0 / _434;
    float _458 = 1.0 / _438;
    float _460 = _422 * _440;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _466;
    float _470 = fma(_464, _460, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _472 = fma(_468, _460, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _474 = _418 * _456;
    bool _476 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _478 = isnan(_414);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _488;
    bool _492 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _494 = isnan(_414);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = fma(_490, _460, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _506 = _426 * _458;
    bool _508 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _510 = isnan(_414);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -_486;
    float _522 = _520 + 1.0;
    float _524 = -_502;
    float _526 = _524 + 1.0;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _532 = _518 * _522;
    float _534 = -_518;
    float _536 = _534 + 1.0;
    float _538 = _452 * _526;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = -_452;
    float _546 = _544 + 1.0;
    float _548 = _502 * _536;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _554 = fma(_530, _474, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _556 = _470 * _538;
    float _558 = _472 * _538;
    float _560 = fma(_552, _474, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _562 = in.m_43.x;
    float _564 = in.m_43.y;
    float _566 = in.m_43.z;
    float _568 = fma(_542, _474, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _570 = _504 * _538;
    float _572 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[143].x, _556);
    float _574 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[143].y, _558);
    float _576 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[143].z, _570);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _586;
    float _590 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _592 = fma(_580, _506, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _594 = fma(_560, _548, _574);
    float _596 = fma(_588, _506, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _598 = fma(_584, _506, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _600 = fma(_554, _548, _572);
    float _602 = fma(_568, _548, _576);
    float _604 = fma(_592, _532, _594);
    float _606 = fma(_596, _532, _600);
    float _608 = fma(_598, _532, _602);
    float _610 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[146].y, _604);
    float _612 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[146].x, _606);
    float _614 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[146].z, _608);
    float _616 = _610 * _564;
    float _618 = _386 * _590;
    float _620 = _388 * _590;
    float _622 = _390 * _590;
    float _624 = _612 * _562;
    float _626 = _614 * _566;
    bool _628 = !_454;
    float _646;
    if (!_628)
    {
        float _630 = in.m_37.x;
        float _632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _634 = _630 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _636 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[11].x, _106);
        float _638 = _636 * _632;
        float _640 = floor(_638);
        float _642 = -_640;
        float _644 = _638 + _642;
        _646 = _644;
        _648 = true;
    }
    else
    {
        _646 = _134;
    }
    _648 = false;
    float _650 = _646;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _654 = _650 + _652;
    bool _656 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _658 = isnan(_650);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _668;
    bool _672 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _674 = isnan(_650);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -_666;
    float _686 = _684 + 1.0;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _688;
    float _692 = 1.0 / _670;
    bool _694 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _696 = _682 * _686;
    float _698 = -_682;
    float _700 = _698 + 1.0;
    float _702 = _654 * _692;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _704;
    float _708 = fma(_690, _702, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _710;
    float _714 = fma(_706, _702, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _716 = fma(_712, _702, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _718 = _708 * _696;
    float _720 = _716 * _696;
    float _722 = _714 * _696;
    float _724 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[107].x, _718);
    float _726 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[107].y, _720);
    float _728 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[107].z, _722);
    float _730 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[108].x, _724);
    float _732 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[108].y, _726);
    float _734 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[108].z, _728);
    bool _736 = !_694;
    float _754;
    if (!_736)
    {
        float _738 = in.m_37.x;
        float _740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _742 = _738 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _744 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _746 = _744 * _740;
        float _748 = floor(_746);
        float _750 = -_748;
        float _752 = _746 + _750;
        _754 = _752;
        _756 = true;
    }
    else
    {
        _754 = _134;
    }
    _756 = false;
    float _758 = _754;
    float _760 = in.m_45.y;
    float _762 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _764 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _768 = _766 != 0;
    float _770 = in.m_37.x;
    float _772 = in.m_37.y;
    float _774 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _776 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].x, _762);
    float _778 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].x, _764);
    float _780 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].x, _774);
    float _782 = fma(_106, 0.300000011920928955078125, -1.0);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _788 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[4].z, _776);
    float _790 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[5].z, _778);
    float _792 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[6].z, _780);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _796 = _792;
    if (_768)
    {
        float _798 = in.m_37.x;
        _794 = _798;
    }
    float _800 = _794;
    float _802 = 1.0 / _786;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _806 = _804 != 0;
    float _808 = _790 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _810 = _788 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _812 = -_808;
    float _814 = _812 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _816 = -_760;
    float _818 = _816 + 1.0;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _820;
    float _824 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _826 = _772 > 0.5;
    float _828 = _782 * 0.15915493667125701904296875;
    float _830 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _824);
    float _832 = _760;
    if (_806)
    {
        float _834 = _826 ? _818 : _760;
        _832 = _834;
    }
    float _836 = _832;
    float _838 = _822 * _802;
    bool _840 = _758 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _842 = isnan(_758);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _848 = _844 || _846;
    float _850 = float(_848);
    float _852 = in.m_45.x;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _856 = _758 + _854;
    float _858 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _860 = _758 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _862 = isnan(_758);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = -_850;
    float _874 = _872 + 1.0;
    bool _876 = _800 > 0.5;
    bool _878 = _876 && _768;
    float _880 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _882 = _808 + _880;
    float _884 = fma(_838, _856, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _886 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _858);
    float _888 = _870 * _874;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _892 = _810 + _890;
    float _894 = _882 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _896 = _792 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _900 = _898 != 0;
    float _902 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[28].x, _894);
    float _904 = -_810;
    float _906 = _904 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _908 = _814 * _814;
    float _910 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _912 = -_896;
    float _914 = _912 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _916 = fma(_906, _906, _908);
    float _918 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _910);
    float _920 = _884 * _888;
    float _922 = fma(_914, _914, _916);
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _926 = _896 + _924;
    float _928 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _918);
    float _930 = (*spvDescriptorSet0.vp_c10)._m0[6].x;
    float _932 = _852;
    float _934 = _902;
    if (_768)
    {
        _930 = _852;
    }
    float _936 = _930;
    float _938 = _916;
    float _940 = _936;
    if (_900)
    {
        float _942 = rsqrt(_922);
        _938 = _942;
    }
    float _944 = _938;
    float _946 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[28].z, _902);
    float _948 = -_870;
    float _950 = _948 + 1.0;
    float _952 = in.m_47.z;
    float _954 = _946;
    if (_878)
    {
        float _956 = -_936;
        float _958 = _956 + 1.0;
        _940 = _958;
    }
    float _960 = _940;
    float _962 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[115].x, _920);
    float _964 = in.m_47.x;
    float _966 = _828 * 6.283185482025146484375;
    float _968 = sin(_966);
    float _970 = _962;
    if (_768)
    {
        _932 = _960;
    }
    float _972 = _932;
    float _974 = _836 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _976 = in.m_47.y;
    bool _978 = _946 >= 0.0;
    if (!_900)
    {
        _934 = 0.0;
        _796 = 0.0;
    }
    float _980 = _934;
    float _982 = _796;
    float _984 = _972 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _988 = _944;
    float _990 = _980;
    float _992 = _982;
    if (_900)
    {
        float _994 = _944 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        _988 = _994;
    }
    float _996 = _988;
    if (!_900)
    {
        _954 = 0.0;
    }
    float _998 = _954;
    float _1000 = _730 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1002 = _732 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1004 = _998;
    if (_900)
    {
        float _1006 = _906 * _996;
        _990 = _1006;
    }
    float _1008 = _990;
    if (_900)
    {
        float _1010 = _814 * _996;
        _1004 = _1010;
    }
    float _1012 = _1004;
    if (_900)
    {
        float _1014 = _914 * _996;
        _992 = _1014;
    }
    float _1016 = _992;
    float _1018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1020 = fma(_968, -0.02999999932944774627685546875, 1.0);
    float _1022 = fma(_968, -0.100000001490116119384765625, 0.5);
    float _1024 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[116].x, _962);
    float _1026 = _770 * 0.550000011920928955078125;
    if (_978)
    {
        _970 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1028 = _970;
    float _1030 = _734 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1032 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1034 = _974 * _986;
    float _1036 = sqrt(_922);
    int _1038 = as_type<int>(_1028);
    if (_978)
    {
        float _1040 = _1028 * 5.0;
        _1038 = as_type<int>(_1040);
    }
    int _1042 = _1038;
    float _1044 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_49.z = _952;
    float _1046 = _984 * _1018;
    float _1048 = rint(_1026);
    out.m_49.x = _964;
    out.m_51.x = _1046;
    out.m_51.y = _1034;
    if (_978)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3385 = as_type<float>(_1042);
        out.gl_Position.z = _3385;
    }
    out.m_49.y = _976;
    float _1050 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1052 = _1024 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1054 = _1052;
    if (_978)
    {
        out.m_33.x = 0.0;
    }
    out.m_53.x = _1032;
    out.m_53.y = _1044;
    out.m_53.z = _1050;
    out.m_53.w = _1052;
    if (_978)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1056 = _808 + _1012;
    float _1058 = _810 + _1008;
    float _1060 = fma(_1036, 0.0333333350718021392822265625, -0.3333333432674407958984375);
    float _1062 = precise::clamp(_1060, 0.0, 1.0);
    float _1064 = in.m_55.x;
    float _1066 = in.m_55.y;
    float _1068 = in.m_55.z;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1072 = _1056 + _1070;
    float _1074 = _896 + _1016;
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1078 = _1058 + _1076;
    float _1080 = fma(_1062, -2.0, 3.0);
    float _1082 = _1072 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1084 = _1062 * _1062;
    float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1088 = _1074 + _1086;
    float _1090 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _830);
    float _1092 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1082);
    float _1094 = _1080 * _1084;
    float _1096 = -_1020;
    float _1098 = _1096 + _1022;
    float _1100 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _886);
    float _1102 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1092);
    float _1104 = _134 * _134;
    float _1106 = fma(_1094, _1098, _1020);
    float _1108 = -_1094;
    float _1110 = _1108 + 0.5;
    float _1112 = rsqrt(_928);
    bool _1114 = _1102 >= 0.0;
    float _1116 = abs(_134);
    float _1118 = _1116 * _1104;
    float _1120 = -_952;
    float _1122 = _1120 + _964;
    float _1124 = -_1094;
    float _1126 = _1124 + 1.0;
    float _1128 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1130 = fma(_1118, _1110, 1.0);
    float _1132 = _1094 * _1122;
    float _1134 = rsqrt(_1090);
    float _1136 = _1106 * _1064;
    float _1138 = _1106 * _1066;
    float _1140 = _1106 * _1068;
    float _1142 = fma(_1128, _1126, 1.0);
    float _1144 = _1068;
    if (_1114)
    {
        _1144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1146 = _1144;
    int _1148 = as_type<int>(_1146);
    if (_1114)
    {
        out.m_33.x = 0.0;
    }
    float _1150 = rsqrt(_1100);
    float _1152 = _1130 * _1142;
    float _1154 = _1132 * 0.0599999986588954925537109375;
    if (_1114)
    {
        float _1156 = _1146 * 5.0;
        _1148 = as_type<int>(_1156);
    }
    int _1158 = _1148;
    float _1160 = _1136 * _1112;
    float _1162 = _1154 * _1112;
    if (_1114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3588 = as_type<float>(_1158);
        out.gl_Position.z = _3588;
    }
    float _1164 = _1138 * _1134;
    float _1166 = _1140 * _1150;
    if (_1114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1168 = _102 * 78.233001708984375;
    float _1170 = _1164 * _1152;
    float _1172 = fma(_1160, _1152, _1162);
    float _1174 = _1166 * _1152;
    float _1176 = _616 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1178 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1170);
    float _1180 = fma(_952, 12.98980045318603515625, _1168);
    float _1182 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1172);
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1174);
    float _1188 = _1178 * _1176;
    float _1190 = fma(_964, 12.98980045318603515625, _1168);
    float _1192 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1194 = _1180 * 0.15915493667125701904296875;
    float _1196 = _1184 * _1182;
    float _1198 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1200 = _1190 * 0.15915493667125701904296875;
    float _1202 = abs(_134);
    float _1204 = log2(_1202);
    float _1206 = _1186 * _1192;
    float _1208 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1210 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1198);
    float _1212 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1214 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1208);
    float _1216 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1210);
    float _1218 = _1194 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1212);
    float _1224 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1214);
    float _1226 = _1216 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_53.x = _1032;
    out.m_53.y = _1044;
    out.m_53.z = _1050;
    out.m_53.w = _1052;
    float _1228 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1222);
    float _1230 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1232 = _808 + _1226;
    float _1234 = _1200 * 6.283185482025146484375;
    float _1236 = sin(_1234);
    float _1238 = _1204 * 0.800000011920928955078125;
    float _1240 = _810 + _1230;
    float _1242 = -_1232;
    float _1244 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1246 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1248 = _1204 * 0.5;
    float _1250 = -_1240;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _1254 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1256 = isnan(0.5);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1262 = _1258 || _1260;
    float _1264 = exp2(_1238);
    float _1266 = _896 + _1246;
    float _1268 = _1220 * 43758.546875;
    float _1270 = floor(_1268);
    float _1272 = _1244 * _1244;
    float _1274 = _1236 * 43758.546875;
    float _1276 = fma(_1252, _1252, _1272);
    float _1278 = -_1266;
    float _1280 = _1278 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1282 = fma(12.0, _770, 24.0);
    float _1284 = floor(_1274);
    float _1286 = fma(_1280, _1280, _1276);
    float _1288 = fma(_772, 6.0, 12.0);
    float _1290 = _1264 * _1282;
    float _1292 = _1264 * _1288;
    float _1294 = _1290 * _964;
    float _1296 = sqrt(_1286);
    float _1298 = -_1270;
    float _1300 = _1268 + _1298;
    float _1302 = _1292 * _976;
    float _1304 = fma(_976, 12.98980045318603515625, _1168);
    float _1306 = _618 * _1302;
    float _1308 = _1304 * 0.15915493667125701904296875;
    float _1310 = exp2(_1248);
    float _1312 = fma(_618, _1294, _1306);
    float _1314 = _622 * _1302;
    float _1316 = -_1284;
    float _1318 = _1274 + _1316;
    float _1320 = fma(_1300, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1322 = fma(_622, _1294, _1314);
    float _1324 = fma(_1296, 0.0333333350718021392822265625, -0.3333333432674407958984375);
    float _1326 = precise::clamp(_1324, 0.0, 1.0);
    float _1328 = 1.0 / _1100;
    float _1330 = fma(_1318, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1332 = fma(_1326, -2.0, 3.0);
    float _1334 = _1326 * _1326;
    float _1336 = fma(_1310, _1320, _1322);
    float _1338 = _1308 * 6.283185482025146484375;
    float _1340 = sin(_1338);
    float _1342 = fma(_1310, _1330, _1312);
    float _1344 = -_1334;
    float _1346 = fma(_1332, _1344, 1.0);
    float _1348 = _1192 * _1336;
    float _1350 = _1182 * _1342;
    float _1352 = _1348 * _1346;
    float _1354 = 1.0 / _928;
    float _1356 = _1350 * _1346;
    float _1358 = fma(_1352, _1328, _1266);
    float _1360 = _620 * _1302;
    float _1362 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1364 = _1340 * 43758.546875;
    float _1366 = 1.0 / _1090;
    float _1368 = fma(_620, _1294, _1360);
    float _1370 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1362);
    float _1372 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1370);
    float _1374 = fma(_1356, _1354, _1240);
    float _1376 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1378 = _1358 + _1376;
    float _1380 = floor(_1364);
    float _1382 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1384 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1386 = _1374 + _1384;
    float _1388 = _1378 * _1378;
    float _1390 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1392 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1382);
    float _1394 = fma(_1386, _1386, _1388);
    float _1396 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1392);
    float _1398 = sqrt(_1394);
    float _1400 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1402 = -_1380;
    float _1404 = _1364 + _1402;
    float _1406 = _1390 + _1400;
    float _1408 = 1.0 / _1400;
    float _1410 = fma(_1404, 0.60000002384185791015625, -0.300000011920928955078125);
    float _1412 = fma(_1310, _1410, _1368);
    bool _1414 = _1398 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1416 = _1176 * _1412;
    float _1418 = _1416 * _1346;
    float _1420 = _1406 * _1408;
    float _1422 = _1420 * 0.5;
    float _1424 = fma(_1418, _1366, _1232);
    float _1426 = 0.60000002384185791015625;
    float _1428 = _1232;
    if (!_1414)
    {
        _1426 = _1374;
    }
    float _1430 = _1426;
    float _1432 = _1430;
    if (!_1414)
    {
        _1054 = _1358;
    }
    float _1434 = _1054;
    float _1436 = _1434;
    if (!_1414)
    {
        _1428 = _1424;
    }
    float _1438 = _1428;
    bool _1440 = !_1414;
    float _1442 = _1438;
    if (!_1440)
    {
        float _1444 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1446 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1448 = _1398 + _1446;
        float _1450 = _1424 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1452 = rsqrt(_1394);
        float _1454 = _1448 * _1444;
        float _1456 = _1454 * 0.15915493667125701904296875;
        float _1458 = _1456 * 6.283185482025146484375;
        float _1460 = sin(_1458);
        float _1462 = _1456 * 6.283185482025146484375;
        float _1464 = cos(_1462);
        float _1466 = fma(_1460, _1450, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1468 = _1452 * _1466;
        float _1470 = _1464 + (-1.0);
        float _1472 = fma(_1386, _1468, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1474 = fma(_1378, _1468, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1476 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1478 = fma(_1424, _1464, _1476);
        _1436 = _1474;
        _1432 = _1472;
        _1442 = _1478;
    }
    float _1480 = _1436;
    float _1482 = _1432;
    float _1484 = _1442;
    float _1486 = _1016 + _1480;
    float _1488 = _1008 + _1482;
    float _1490 = _1012 + _1484;
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1494 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1492);
    float _1496 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1498 = _1490;
    float _1500 = _1488;
    if (_1262)
    {
        _1496 = _1486;
    }
    float _1502 = _1496;
    float _1504 = _1502;
    if (!_1262)
    {
        float _1506 = _1072 * _1072;
        float _1508 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1510 = -_810;
        float _1512 = _1510 + _1482;
        float _1514 = -_808;
        float _1516 = _1514 + _1484;
        float _1518 = fma(_1078, _1078, _1506);
        float _1520 = -_896;
        float _1522 = _1520 + _1480;
        float _1524 = fma(_1088, _1088, _1518);
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1528 = sqrt(_1524);
        float _1530 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1532 = precise::min(_1528, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1534 = _1532 * _1526;
        float _1536 = _1530 * _1534;
        float _1538 = fma(_1512, _1536, _1058);
        float _1540 = fma(_1516, _1536, _1056);
        float _1542 = fma(_1522, _1536, _1074);
        _1498 = _1540;
        _1500 = _1538;
        _1504 = _1542;
    }
    float _1544 = _1498;
    float _1546 = _1500;
    float _1548 = _1504;
    float _1550 = 1.0 / _1494;
    bool _1552 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1554 = isnan(0.5);
    bool _1556 = _1552 || _1554;
    bool _1558 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1560 = _1556 || _1558;
    float _1562 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1564 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1566 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1568 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1570 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1562);
    float _1572 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1564);
    float _1574 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1566);
    float _1576 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1568);
    float _1578 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1570);
    float _1580 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1572);
    float _1582 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1574);
    float _1584 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1576);
    float _1586 = _1576;
    float _1588 = _1548;
    if (_1560)
    {
        _1586 = 1.0;
    }
    float _1590 = _1586;
    float _1592 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1594 = _1590;
    if (_1560)
    {
        _1588 = 1.0;
    }
    float _1596 = _1588;
    float _1598 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1600 = _1550 * _1598;
    float _1602 = _1596;
    if (!_1560)
    {
        float _1604 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1606 = _1604 * 0.15915493667125701904296875;
        float _1608 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1610 = _1606 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        float _1614 = _1608 * 0.15915493667125701904296875;
        float _1616 = _1606 * 6.283185482025146484375;
        float _1618 = sin(_1616);
        float _1620 = 1.0 / _1612;
        float _1622 = _1614 * 6.283185482025146484375;
        float _1624 = cos(_1622);
        float _1626 = _1618 * _1620;
        float _1628 = _1614 * 6.283185482025146484375;
        float _1630 = sin(_1628);
        float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1634 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1632;
        float _1636 = _1624 * _1626;
        float _1638 = 1.0 / _1634;
        float _1640 = 1.0 / _1636;
        float _1642 = _1630 * _1640;
        float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1646 = fma(_1600, _1642, _1644);
        float _1648 = _1646 * _1638;
        float _1650 = precise::clamp(_1648, 0.0, 1.0);
        _1594 = _1650;
    }
    float _1652 = _1594;
    if (!_1560)
    {
        float _1654 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1656 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1658 = _1654 * 0.15915493667125701904296875;
        float _1660 = _1656 * 0.15915493667125701904296875;
        float _1662 = _1658 * 6.283185482025146484375;
        float _1664 = cos(_1662);
        float _1666 = _1658 * 6.283185482025146484375;
        float _1668 = sin(_1666);
        float _1670 = 1.0 / _1664;
        float _1672 = _1660 * 6.283185482025146484375;
        float _1674 = cos(_1672);
        float _1676 = _1668 * _1670;
        float _1678 = _1660 * 6.283185482025146484375;
        float _1680 = sin(_1678);
        float _1682 = _1674 * _1676;
        float _1684 = 1.0 / _1682;
        float _1686 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1688 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1686;
        float _1690 = 1.0 / _1688;
        float _1692 = _1680 * _1684;
        float _1694 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1696 = fma(_1600, _1692, _1694);
        float _1698 = _1696 * _1690;
        float _1700 = precise::clamp(_1698, 0.0, 1.0);
        float _1702 = -_1700;
        float _1704 = _1702 + 1.0;
        _1602 = _1704;
    }
    float _1706 = _1602;
    float _1708 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1710 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1712 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1714 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1716 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1718 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1710);
    float _1720 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1712);
    float _1722 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1724 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1714);
    float _1726 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1716);
    float _1728 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1730 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1718);
    float _1732 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1720);
    bool _1734 = _1652 > 0.0;
    bool _1736 = isnan(_1652);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan(0.0);
    bool _1742 = _1738 || _1740;
    float _1744 = _1652 * _1706;
    float _1746 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1724);
    float _1748 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1730);
    float _1750 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1732);
    bool _1752 = _1706 <= 0.0;
    bool _1754 = !_1742;
    bool _1756 = _1752 || _1754;
    float _1758 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1726);
    float _1760 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1746);
    float _1762 = _1744 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1764 = _1748 + _1750;
    float _1766 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1758);
    float _1768 = _1762 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1770 = _1764 * 0.5;
    out.m_57.x = _1058;
    out.m_57.y = _1056;
    out.m_57.z = _1074;
    out.m_33.x = _1768;
    out.gl_Position.x = _1760;
    out.gl_Position.y = _1766;
    out.gl_Position.z = _1748;
    out.gl_Position.w = _1750;
    out.m_59.z = _1770;
    out.m_59.w = _1750;
    if (!_1756)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1772 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1772;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

