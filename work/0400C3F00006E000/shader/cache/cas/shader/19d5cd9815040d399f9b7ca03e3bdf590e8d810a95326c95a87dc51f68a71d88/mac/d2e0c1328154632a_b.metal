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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_47 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_43 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_32 [[attribute(3)]];
    float4 m_59 [[attribute(5)]];
    float4 m_45 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
    float4 m_39 [[attribute(9)]];
    float4 m_49 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _732 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_30.w;
    float _77 = in.m_32.w;
    float _79 = trunc(_75);
    int _82 = int(_79);
    float _84 = -_77;
    float _86 = _84 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _86;
    bool _90 = _82 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_82);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    if (!_90)
    {
        out.m_37.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1852 = as_type<float>(_102);
        out.gl_Position.z = _1852;
    }
    if (!_90)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _106 = _77 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_77);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = float(_82);
    bool _118 = _86 >= _116;
    bool _120 = !_114;
    bool _122 = _118 || _120;
    if (_122)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _94;
    if (_122)
    {
        out.m_37.x = 0.0;
    }
    if (_122)
    {
        float _126 = _124 * 5.0;
        _104 = as_type<int>(_126);
    }
    int _128 = _104;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1907 = as_type<float>(_128);
        out.gl_Position.z = _1907;
    }
    if (_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_39.x;
    float _132 = 1.0 / _116;
    float _134 = _86 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _136 = in.m_39.y;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    float _148 = in.m_41.w;
    float _150 = in.m_32.x;
    float _152 = in.m_32.y;
    float _154 = in.m_32.z;
    float _156 = in.m_30.x;
    float _158 = in.m_30.y;
    float _160 = in.m_30.z;
    float _162 = 0.0;
    float _164 = _134;
    if (!_146)
    {
        float _166 = _134 * _134;
        float _168 = _166 * 0.5;
        _162 = _168;
    }
    float _170 = _162;
    float _172 = _170;
    if (!_146)
    {
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    out.m_43.x = _130;
    out.m_43.y = _136;
    bool _178 = !_146;
    float _180 = _176;
    float _182 = _136;
    float _184 = _130;
    if (!_178)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _134 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _134);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _214;
    }
    float _216 = _180;
    bool _218 = !_146;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _134 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _164 = _238;
    }
    float _240 = _164;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _150, _244);
    float _252 = fma(_240, _152, _246);
    float _254 = fma(_240, _154, _248);
    float _256 = _86 * _132;
    float _258 = fma(_250, _148, _156);
    float _260 = fma(_252, _148, _158);
    float _262 = fma(_254, _148, _160);
    bool _264 = !_242;
    float _266 = _256;
    float _284;
    if (!_264)
    {
        float _268 = in.m_45.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _86);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        _284 = _256;
    }
    _286 = false;
    float _288 = _284;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _292 = _288 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _296 = _288 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _314 = 1.0 / _300;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = 1.0 / _318;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _334 = 1.0 / _308;
    bool _336 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = isnan(_288);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _348;
    bool _352 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _354 = isnan(_288);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    float _368 = -_346;
    float _370 = _368 + 1.0;
    float _372 = 1.0 / _304;
    float _374 = _292 * _324;
    float _376 = _362 * _370;
    float _378 = -_362;
    float _380 = _378 + 1.0;
    bool _382 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    float _388 = 1.0 / _322;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _396 = _288 + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = _396 * _314;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _406 = _288 + _404;
    float _408 = 1.0 / _312;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _412 = _288 + _410;
    float _414 = fma(_328, _402, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _416 = _406 * _334;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _420 = _288 + _418;
    float _422 = _412 * _372;
    bool _424 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _426 = isnan(_288);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = fma(_386, _402, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _438 = 1.0 / _392;
    float _440 = _296 * _388;
    bool _442 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _444 = isnan(_288);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = fma(_332, _422, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _456 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _458 = isnan(_288);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = fma(_400, _422, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _470 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _472 = isnan(_288);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = _420 * _408;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _486 = _288 + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _496 = fma(_490, _402, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _498 = -_452;
    float _500 = _498 + 1.0;
    float _502 = _486 * _438;
    float _504 = -_434;
    float _506 = _504 + 1.0;
    float _508 = fma(_494, _422, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = -_466;
    float _512 = _510 + 1.0;
    float _514 = _452 * _506;
    float _516 = _466 * _500;
    bool _518 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _520 = isnan(_288);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _480 * _512;
    float _532 = -_480;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _536;
    float _540 = _528 * _534;
    float _542 = -_528;
    float _544 = _542 + 1.0;
    float _546 = fma(_538, _374, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _552 = _346 * _544;
    float _554 = fma(_350, _374, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _556 = fma(_366, _374, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _558 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _560 = isnan(_288);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _578 = fma(_550, _440, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _580 = _568 * _380;
    float _582 = fma(_572, _440, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _584 = fma(_576, _440, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _586 = -_568;
    float _588 = _586 + 1.0;
    float _590 = _496 * _580;
    float _592 = _414 * _580;
    float _594 = _436 * _580;
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[143].x, _590);
    float _598 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[143].y, _592);
    float _600 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[143].z, _594);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _602;
    float _606 = fma(_508, _376, _596);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _612;
    float _616 = fma(_454, _376, _598);
    float _618 = fma(_468, _376, _600);
    float _620 = fma(_604, _416, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _622 = fma(_610, _416, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _624 = fma(_614, _416, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _630 = fma(_546, _552, _606);
    float _632 = fma(_554, _552, _616);
    float _634 = fma(_556, _552, _618);
    float _636 = fma(_628, _482, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _638 = fma(_582, _540, _630);
    float _640 = fma(_578, _540, _632);
    float _642 = fma(_584, _540, _634);
    float _644 = in.m_41.x;
    float _646 = in.m_41.y;
    float _648 = in.m_41.z;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _658 = fma(_620, _530, _638);
    float _660 = fma(_652, _482, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _666;
    float _670 = fma(_656, _482, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _672 = fma(_622, _530, _640);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _674;
    float _678 = fma(_624, _530, _642);
    float _680 = fma(_664, _502, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _682 = fma(_668, _502, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _684 = fma(_636, _516, _658);
    float _686 = fma(_676, _502, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _688 = fma(_660, _516, _672);
    float _690 = fma(_670, _516, _678);
    float _692 = fma(_680, _514, _684);
    float _694 = fma(_682, _514, _688);
    float _696 = fma(_686, _514, _690);
    float _698 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[150].x, _692);
    float _700 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[150].y, _694);
    float _702 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[150].z, _696);
    float _704 = _698 * _644;
    float _706 = _700 * _646;
    float _708 = _702 * _648;
    bool _710 = !_382;
    int _712 = as_type<int>(_638);
    float _730;
    if (!_710)
    {
        float _714 = in.m_45.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[11].y, _86);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        _730 = _256;
    }
    _732 = false;
    float _734 = _730;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _738 = _734 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _744 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _746 = isnan(_734);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _760 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _762 = isnan(_734);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _772;
    bool _776 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _778 = isnan(_734);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = 1.0 / _742;
    float _790 = -_754;
    float _792 = _790 + 1.0;
    bool _794 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _796 = _770 * _792;
    float _798 = -_770;
    float _800 = _798 + 1.0;
    float _802 = 1.0 / _758;
    float _804 = _774 * _788;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _810 = fma(_804, _738, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _812 = _808 * _802;
    float _814 = _810 * _796;
    float _816 = -_786;
    float _818 = _816 + 1.0;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _822 = _734 + _820;
    float _824 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[115].x, _814);
    float _826 = _754 * _818;
    float _828 = fma(_812, _822, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _832 = fma(_828, _826, _824);
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _838 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[117].x, _832);
    float _840 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _842 = _834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _844 = _836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _846 = _838 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_47.x = _840;
    out.m_47.y = _842;
    out.m_47.z = _844;
    out.m_47.w = _846;
    bool _848 = !_794;
    if (!_848)
    {
        float _850 = in.m_45.x;
        float _852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _854 = _850 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _856 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[11].z, _86);
        float _858 = _856 * _852;
        float _860 = floor(_858);
        float _862 = -_860;
        float _864 = _858 + _862;
        _266 = _864;
    }
    float _866 = _266;
    float _868 = in.m_45.z;
    float _870 = in.m_45.w;
    float _872 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _874 = in.m_45.x;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _878 = _876 != 0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _880;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _886 = _884 != 0;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _888;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _894 = _892 != 0;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _902 = _900 != 0;
    float _904 = 1.0 / _882;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _910 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _872);
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _912;
    float _916 = _840;
    if (_878)
    {
        float _918 = in.m_45.z;
        _916 = _918;
    }
    float _920 = _916;
    float _922 = 1.0 / _908;
    float _924 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _928 = _926 != 0;
    float _930 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _932 = _870 > 0.5;
    float _934 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _924);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _938 = _866 + _936;
    float _940 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _930);
    float _942 = 1.0 / _890;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _946 = _866 + _944;
    float _948 = _938 * _904;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _952 = _866 + _950;
    float _954 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _910);
    float _956 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _934);
    float _958 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _940);
    float _960 = 1.0 / _898;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _964 = _866 + _962;
    float _966 = _946 * _922;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _970 = _866 + _968;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _972;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _980 = 1.0 / _914;
    float _982 = _964 * _942;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _984;
    bool _988 = false;
    float _990 = _966;
    if (_878)
    {
        bool _992 = _920 > 0.5;
        _988 = _992;
    }
    bool _994 = _988;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1000;
    float _1004 = _952 * _960;
    if (_878)
    {
        float _1006 = -_130;
        float _1008 = _1006 + 1.0;
        _712 = as_type<int>(_1008);
    }
    int _1010 = _712;
    float _1012 = in.m_45.y;
    float _1014 = fma(_978, _966, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1024 = _970 * _980;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1034;
    float _1038 = fma(_1018, _982, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1044 = fma(_1032, _982, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1046 = fma(_1036, _982, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1052 = fma(_1028, _966, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1054 = fma(_998, _966, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1064;
    float _1068 = fma(_1022, _1004, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1070 = fma(_1042, _1004, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1072 = fma(_1050, _1004, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    if (!_878)
    {
        _990 = _130;
    }
    float _1074 = _990;
    float _1076 = -_136;
    float _1078 = _1076 + 1.0;
    float _1080 = _1074;
    if (_878)
    {
        float _1082 = _994 ? as_type<float>(_1010) : _130;
        _1080 = _1082;
    }
    float _1084 = _1080;
    float _1086 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1088 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1090 = isnan(_866);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = fma(_1058, _1024, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    bool _1102 = _868 > 0.5;
    float _1104 = fma(_1062, _1024, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1106 = fma(_1066, _1024, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    bool _1108 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1110 = isnan(_866);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = -_1098;
    float _1122 = _1120 + 1.0;
    int _1124 = _1102 ? as_type<int>(_1078) : as_type<int>(_136);
    float _1126 = fma(_1002, _948, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1128 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1130 = isnan(_866);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = fma(_974, _948, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1142 = fma(_986, _948, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1144 = -_1118;
    float _1146 = _1144 + 1.0;
    float _1148 = _1118 * _1122;
    float _1150 = _894 ? as_type<float>(_1124) : _136;
    float _1152 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1154 = _1122;
    float _1156 = _1126;
    if (_928)
    {
        _1154 = _874;
    }
    float _1158 = _1154;
    float _1160 = _954 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1162 = _1158;
    if (_902)
    {
        float _1164 = _932 ? _1078 : _136;
        _182 = _1164;
    }
    float _1166 = _182;
    float _1168 = -_1138;
    float _1170 = _1168 + 1.0;
    bool _1172 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1174 = isnan(_866);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = _956 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (!_928)
    {
        _1162 = _868;
    }
    float _1186 = _1162;
    float _1188 = _1138 * _1146;
    bool _1190 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1192 = isnan(_866);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1198 = _1194 || _1196;
    float _1200 = float(_1198);
    float _1202 = _958 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1204 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1206 = isnan(_866);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1212 = _1208 || _1210;
    float _1214 = float(_1212);
    float _1216 = _1182 * _1170;
    float _1218 = -_1182;
    float _1220 = _1218 + 1.0;
    float _1222 = -_1200;
    float _1224 = _1222 + 1.0;
    bool _1226 = _1012 > 0.5;
    bool _1228 = _1226 && _886;
    float _1230 = _1200 * _1220;
    float _1232 = fma(_1150, _1152, -0.5);
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1236 = _1214 * _1224;
    float _1238 = -_1214;
    float _1240 = _1238 + 1.0;
    float _1242 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1244 = _1142 * _1236;
    float _1246 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1234);
    float _1248 = _1126 * _1236;
    float _1250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1252 = _1140 * _1236;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (!_886)
    {
        _1156 = _130;
    }
    float _1256 = _1156;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1260 = _1256;
    if (_1228)
    {
        float _1262 = -_130;
        float _1264 = _1262 + 1.0;
        _184 = _1264;
    }
    float _1266 = _184;
    float _1268 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1248);
    float _1270 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1252);
    if (_928)
    {
        _1254 = _1012;
    }
    float _1272 = _1254;
    float _1274 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1244);
    float _1276 = _1272;
    if (!_928)
    {
        _1276 = _874;
    }
    float _1278 = _1276;
    float _1280 = fma(_1052, _1230, _1268);
    float _1282 = fma(_1054, _1230, _1274);
    if (_886)
    {
        _1260 = _1266;
    }
    float _1284 = _1260;
    float _1286 = fma(_1014, _1230, _1270);
    float _1288 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1292 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1294 = fma(_1038, _1216, _1280);
    float _1296 = fma(_1288, -2.0, _1290);
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1300 = _1160 + _1298;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1304 = fma(_1292, _1284, -0.5);
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1308 = _1184 + _1306;
    float _1310 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1312 = -_1302;
    float _1314 = fma(_1242, 2.0, _1312);
    float _1316 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1258);
    float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1320 = _1202 + _1318;
    float _1322 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1310);
    float _1324 = fma(_1044, _1216, _1286);
    float _1326 = fma(_86, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1246);
    float _1328 = -_86;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1314);
    float _1332 = fma(_1046, _1216, _1282);
    float _1334 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1322);
    float _1336 = fma(_86, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1316);
    float _1338 = fma(_86, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1296);
    float _1340 = _1300 * _1300;
    float _1342 = fma(_1326, _1304, _1330);
    bool _1344 = _1334 >= 0.0;
    float _1346 = in.m_49.w;
    float _1348 = fma(_1070, _1188, _1324);
    float _1350 = fma(_1308, _1308, _1340);
    float _1352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1354 = fma(_1068, _1188, _1294);
    float _1356 = fma(_1072, _1188, _1332);
    float _1358 = -_1338;
    float _1360 = fma(_1336, _1232, _1358);
    float _1362 = fma(_1320, _1320, _1350);
    float _1364 = fma(_1100, _1148, _1354);
    float _1366 = fma(_1104, _1148, _1348);
    float _1368 = fma(_1106, _1148, _1356);
    float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1372 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1364);
    float _1374 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1366);
    float _1376 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1368);
    float _1378 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1380 = _1348;
    if (_1344)
    {
        _1380 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1382 = _1380;
    float _1384 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1386 = _1372 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1388 = rsqrt(_1362);
    float _1390 = _1374 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1392 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1394 = _1378 * _1352;
    float _1396 = _1342 + 0.5;
    float _1398 = _1360 + 0.5;
    int _1400 = as_type<int>(_1382);
    if (_1344)
    {
        float _1402 = _1382 * 5.0;
        _1400 = as_type<int>(_1402);
    }
    int _1404 = _1400;
    float _1406 = _1384 * _1370;
    float _1408 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1410 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1412 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_51.w = _1346;
    out.m_53.z = _1406;
    out.m_53.w = _1394;
    float _1414 = _1300 * _1388;
    float _1416 = _1308 * _1388;
    int _1418 = as_type<int>(_1412);
    if (_1344)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4078 = as_type<float>(_1404);
        out.gl_Position.z = _4078;
    }
    out.m_55.x = _1396;
    out.m_55.y = _1398;
    out.m_57.x = _1408;
    out.m_57.y = _1410;
    out.m_57.z = _1412;
    if (_1344)
    {
        out.m_37.x = 0.0;
    }
    if (_1344)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1420 = -_1414;
    float _1422 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1160);
    float _1424 = _1320 * _1388;
    float _1426 = -_1416;
    float _1428 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1184);
    float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1432 = _1422 + _1430;
    float _1434 = -_1424;
    float _1436 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1202);
    float _1438 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1440 = _1428 + _1438;
    float _1442 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1446 = _1436 + _1444;
    float _1448 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1442);
    float _1450 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1448);
    bool _1452 = _1450 >= 0.0;
    float _1454 = _1440;
    if (_1452)
    {
        _1454 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1456 = _1454;
    if (_1452)
    {
        out.m_37.x = 0.0;
    }
    if (_1452)
    {
        float _1458 = _1456 * 5.0;
        _1418 = as_type<int>(_1458);
    }
    int _1460 = _1418;
    if (_1452)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4181 = as_type<float>(_1460);
        out.gl_Position.z = _4181;
    }
    if (_1452)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1462 = -_1160;
    float _1464 = _1462 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1466 = -_1184;
    float _1468 = _1466 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1470 = -_1202;
    float _1472 = _1470 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1474 = -_1414;
    float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1300);
    float _1478 = _1464 * _1464;
    float _1480 = -_1416;
    float _1482 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1308);
    float _1484 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1486 = fma(_1468, _1468, _1478);
    float _1488 = _1476 * _1476;
    float _1490 = _704 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1492 = fma(_1472, _1472, _1486);
    float _1494 = fma(_1482, _1482, _1488);
    float _1496 = rsqrt(_1492);
    float _1498 = _1468 * _1496;
    float _1500 = _1472 * _1496;
    float _1502 = -_1424;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1320);
    float _1506 = _1464 * _1496;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1510 = _1498 * _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1514 = _1500 * _1512;
    float _1516 = fma(_1504, _1504, _1494);
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1520 = _1506 * _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1524 = -_1510;
    float _1526 = fma(_1500, _1522, _1524);
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1530 = -_1514;
    float _1532 = fma(_1506, _1528, _1530);
    float _1534 = in.m_59.x;
    float _1536 = in.m_59.y;
    float _1538 = in.m_59.z;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1542 = -_1520;
    float _1544 = fma(_1498, _1540, _1542);
    float _1546 = _1526 * _1526;
    float _1548 = sqrt(_1516);
    float _1550 = fma(_1532, _1532, _1546);
    float _1552 = fma(_1544, _1544, _1550);
    float _1554 = rsqrt(_1552);
    float _1556 = _1388 * _1548;
    float _1558 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1560 = _1556 * _1484;
    float _1562 = _1556 * _1558;
    float _1564 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1536);
    float _1566 = _1556 * _1490;
    float _1568 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1534);
    float _1570 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1538);
    float _1572 = _1562 * _1564;
    float _1574 = _1566 * _1568;
    float _1576 = _1532 * _1554;
    float _1578 = _1526 * _1554;
    float _1580 = _1544 * _1554;
    float _1582 = _1506 * _1576;
    float _1584 = _1500 * _1578;
    float _1586 = -_1582;
    float _1588 = fma(_1498, _1578, _1586);
    float _1590 = -_1584;
    float _1592 = fma(_1506, _1580, _1590);
    float _1594 = _1560 * _1570;
    float _1596 = _1572 * _1588;
    float _1598 = _1572 * _1592;
    float _1600 = fma(_1574, _1580, _1596);
    float _1602 = fma(_1574, _1576, _1598);
    float _1604 = fma(_1594, _1500, _1600);
    float _1606 = fma(_1594, _1498, _1602);
    float _1608 = _1498 * _1580;
    float _1610 = _1202 + _1604;
    float _1612 = _1184 + _1606;
    float _1614 = -_1608;
    float _1616 = fma(_1500, _1576, _1614);
    float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1620 = _1610 + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1624 = _1612 + _1622;
    float _1626 = _1572 * _1616;
    float _1628 = _1620 * _1620;
    float _1630 = fma(_1574, _1578, _1626);
    float _1632 = fma(_1624, _1624, _1628);
    float _1634 = fma(_1594, _1506, _1630);
    float _1636 = sqrt(_1632);
    float _1638 = _1160 + _1634;
    bool _1640 = _1636 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1642 = _1626;
    float _1644 = _1630;
    float _1646 = _1628;
    if (!_1640)
    {
        _1642 = _1612;
    }
    float _1648 = _1642;
    float _1650 = _1648;
    if (!_1640)
    {
        _1644 = _1610;
    }
    float _1652 = _1644;
    float _1654 = _1652;
    if (!_1640)
    {
        _1646 = _1638;
    }
    float _1656 = _1646;
    bool _1658 = !_1640;
    float _1660 = _1656;
    if (!_1658)
    {
        float _1662 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1666 = _1636 + _1664;
        float _1668 = rsqrt(_1632);
        float _1670 = _1666 * _1662;
        float _1672 = _1638 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1674 = _1670 * 0.15915493667125701904296875;
        float _1676 = _1674 * 6.283185482025146484375;
        float _1678 = cos(_1676);
        float _1680 = _1674 * 6.283185482025146484375;
        float _1682 = sin(_1680);
        float _1684 = _1678 + (-1.0);
        float _1686 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1688 = fma(_1682, _1672, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1690 = fma(_1638, _1678, _1686);
        float _1692 = _1668 * _1688;
        float _1694 = fma(_1624, _1692, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1696 = fma(_1620, _1692, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1660 = _1690;
        _1650 = _1694;
        _1654 = _1696;
    }
    float _1698 = _1660;
    float _1700 = _1650;
    float _1702 = _1654;
    float _1704 = -_1414;
    float _1706 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1698);
    float _1708 = -_1416;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1700);
    float _1712 = -_1424;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1702);
    float _1716 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1718 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1720 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1722 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1724 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1716);
    float _1726 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1718);
    float _1728 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1720);
    float _1730 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1722);
    float _1732 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1724);
    float _1734 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1726);
    float _1736 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1728);
    float _1738 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1730);
    float _1740 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1742 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1744 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1746 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1748 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1750 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1752 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1754 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1756 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1748);
    float _1758 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1750);
    float _1760 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1752);
    float _1762 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1754);
    float _1764 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1756);
    float _1766 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1758);
    float _1768 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1760);
    float _1770 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1762);
    float _1772 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1764);
    float _1774 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1766);
    float _1776 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1768);
    float _1778 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1770);
    float _1780 = _1772 + _1774;
    float _1782 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1784 = _1780 * 0.5;
    out.m_37.x = _1782;
    out.gl_Position.x = _1776;
    out.gl_Position.y = _1778;
    out.gl_Position.z = _1772;
    out.gl_Position.w = _1774;
    out.m_61.z = _1784;
    out.m_61.w = _1774;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _732 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_30.w;
    float _77 = in.m_32.w;
    float _79 = trunc(_75);
    int _82 = int(_79);
    float _84 = -_77;
    float _86 = _84 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _86;
    bool _90 = _82 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_82);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    if (!_90)
    {
        out.m_37.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1852 = as_type<float>(_102);
        out.gl_Position.z = _1852;
    }
    if (!_90)
    {
        return out;
    }
    bool _106 = _77 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_77);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = float(_82);
    bool _118 = _86 >= _116;
    bool _120 = !_114;
    bool _122 = _118 || _120;
    if (_122)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _94;
    if (_122)
    {
        out.m_37.x = 0.0;
    }
    if (_122)
    {
        float _126 = _124 * 5.0;
        _104 = as_type<int>(_126);
    }
    int _128 = _104;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1907 = as_type<float>(_128);
        out.gl_Position.z = _1907;
    }
    if (_122)
    {
        return out;
    }
    float _130 = in.m_39.x;
    float _132 = 1.0 / _116;
    float _134 = _86 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _136 = in.m_39.y;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    float _148 = in.m_41.w;
    float _150 = in.m_32.x;
    float _152 = in.m_32.y;
    float _154 = in.m_32.z;
    float _156 = in.m_30.x;
    float _158 = in.m_30.y;
    float _160 = in.m_30.z;
    float _162 = 0.0;
    float _164 = _134;
    if (!_146)
    {
        float _166 = _134 * _134;
        float _168 = _166 * 0.5;
        _162 = _168;
    }
    float _170 = _162;
    float _172 = _170;
    if (!_146)
    {
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    out.m_43.x = _130;
    out.m_43.y = _136;
    bool _178 = !_146;
    float _180 = _176;
    float _182 = _136;
    float _184 = _130;
    if (!_178)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _134 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _134);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _214;
    }
    float _216 = _180;
    bool _218 = !_146;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _134 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _164 = _238;
    }
    float _240 = _164;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _150, _244);
    float _252 = fma(_240, _152, _246);
    float _254 = fma(_240, _154, _248);
    float _256 = _86 * _132;
    float _258 = fma(_250, _148, _156);
    float _260 = fma(_252, _148, _158);
    float _262 = fma(_254, _148, _160);
    bool _264 = !_242;
    float _266 = _256;
    float _284;
    if (!_264)
    {
        float _268 = in.m_45.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _86);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        _284 = _256;
    }
    _286 = false;
    float _288 = _284;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _292 = _288 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _296 = _288 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _314 = 1.0 / _300;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = 1.0 / _318;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _334 = 1.0 / _308;
    bool _336 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = isnan(_288);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _348;
    bool _352 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _354 = isnan(_288);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    float _368 = -_346;
    float _370 = _368 + 1.0;
    float _372 = 1.0 / _304;
    float _374 = _292 * _324;
    float _376 = _362 * _370;
    float _378 = -_362;
    float _380 = _378 + 1.0;
    bool _382 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    float _388 = 1.0 / _322;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _396 = _288 + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = _396 * _314;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _406 = _288 + _404;
    float _408 = 1.0 / _312;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _412 = _288 + _410;
    float _414 = fma(_328, _402, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _416 = _406 * _334;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _420 = _288 + _418;
    float _422 = _412 * _372;
    bool _424 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _426 = isnan(_288);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = fma(_386, _402, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _438 = 1.0 / _392;
    float _440 = _296 * _388;
    bool _442 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _444 = isnan(_288);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = fma(_332, _422, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _456 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _458 = isnan(_288);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = fma(_400, _422, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _470 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _472 = isnan(_288);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = _420 * _408;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _486 = _288 + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _496 = fma(_490, _402, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _498 = -_452;
    float _500 = _498 + 1.0;
    float _502 = _486 * _438;
    float _504 = -_434;
    float _506 = _504 + 1.0;
    float _508 = fma(_494, _422, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = -_466;
    float _512 = _510 + 1.0;
    float _514 = _452 * _506;
    float _516 = _466 * _500;
    bool _518 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _520 = isnan(_288);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _480 * _512;
    float _532 = -_480;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _536;
    float _540 = _528 * _534;
    float _542 = -_528;
    float _544 = _542 + 1.0;
    float _546 = fma(_538, _374, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _552 = _346 * _544;
    float _554 = fma(_350, _374, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _556 = fma(_366, _374, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _558 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _560 = isnan(_288);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _578 = fma(_550, _440, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _580 = _568 * _380;
    float _582 = fma(_572, _440, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _584 = fma(_576, _440, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _586 = -_568;
    float _588 = _586 + 1.0;
    float _590 = _496 * _580;
    float _592 = _414 * _580;
    float _594 = _436 * _580;
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[143].x, _590);
    float _598 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[143].y, _592);
    float _600 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[143].z, _594);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _602;
    float _606 = fma(_508, _376, _596);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _612;
    float _616 = fma(_454, _376, _598);
    float _618 = fma(_468, _376, _600);
    float _620 = fma(_604, _416, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _622 = fma(_610, _416, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _624 = fma(_614, _416, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _630 = fma(_546, _552, _606);
    float _632 = fma(_554, _552, _616);
    float _634 = fma(_556, _552, _618);
    float _636 = fma(_628, _482, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _638 = fma(_582, _540, _630);
    float _640 = fma(_578, _540, _632);
    float _642 = fma(_584, _540, _634);
    float _644 = in.m_41.x;
    float _646 = in.m_41.y;
    float _648 = in.m_41.z;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _658 = fma(_620, _530, _638);
    float _660 = fma(_652, _482, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _666;
    float _670 = fma(_656, _482, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _672 = fma(_622, _530, _640);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _674;
    float _678 = fma(_624, _530, _642);
    float _680 = fma(_664, _502, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _682 = fma(_668, _502, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _684 = fma(_636, _516, _658);
    float _686 = fma(_676, _502, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _688 = fma(_660, _516, _672);
    float _690 = fma(_670, _516, _678);
    float _692 = fma(_680, _514, _684);
    float _694 = fma(_682, _514, _688);
    float _696 = fma(_686, _514, _690);
    float _698 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[150].x, _692);
    float _700 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[150].y, _694);
    float _702 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[150].z, _696);
    float _704 = _698 * _644;
    float _706 = _700 * _646;
    float _708 = _702 * _648;
    bool _710 = !_382;
    int _712 = as_type<int>(_638);
    float _730;
    if (!_710)
    {
        float _714 = in.m_45.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[11].y, _86);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        _730 = _256;
    }
    _732 = false;
    float _734 = _730;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _738 = _734 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _744 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _746 = isnan(_734);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _760 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _762 = isnan(_734);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _772;
    bool _776 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _778 = isnan(_734);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = 1.0 / _742;
    float _790 = -_754;
    float _792 = _790 + 1.0;
    bool _794 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _796 = _770 * _792;
    float _798 = -_770;
    float _800 = _798 + 1.0;
    float _802 = 1.0 / _758;
    float _804 = _774 * _788;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _810 = fma(_804, _738, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _812 = _808 * _802;
    float _814 = _810 * _796;
    float _816 = -_786;
    float _818 = _816 + 1.0;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _822 = _734 + _820;
    float _824 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[115].x, _814);
    float _826 = _754 * _818;
    float _828 = fma(_812, _822, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _832 = fma(_828, _826, _824);
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _838 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[117].x, _832);
    float _840 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _842 = _834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _844 = _836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _846 = _838 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_47.x = _840;
    out.m_47.y = _842;
    out.m_47.z = _844;
    out.m_47.w = _846;
    bool _848 = !_794;
    if (!_848)
    {
        float _850 = in.m_45.x;
        float _852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _854 = _850 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _856 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[11].z, _86);
        float _858 = _856 * _852;
        float _860 = floor(_858);
        float _862 = -_860;
        float _864 = _858 + _862;
        _266 = _864;
    }
    float _866 = _266;
    float _868 = in.m_45.z;
    float _870 = in.m_45.w;
    float _872 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _874 = in.m_45.x;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _878 = _876 != 0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _880;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _886 = _884 != 0;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _888;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _894 = _892 != 0;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _902 = _900 != 0;
    float _904 = 1.0 / _882;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _910 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _872);
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _912;
    float _916 = _840;
    if (_878)
    {
        float _918 = in.m_45.z;
        _916 = _918;
    }
    float _920 = _916;
    float _922 = 1.0 / _908;
    float _924 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _928 = _926 != 0;
    float _930 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _932 = _870 > 0.5;
    float _934 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _924);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _938 = _866 + _936;
    float _940 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _930);
    float _942 = 1.0 / _890;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _946 = _866 + _944;
    float _948 = _938 * _904;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _952 = _866 + _950;
    float _954 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _910);
    float _956 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _934);
    float _958 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _940);
    float _960 = 1.0 / _898;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _964 = _866 + _962;
    float _966 = _946 * _922;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _970 = _866 + _968;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _972;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _980 = 1.0 / _914;
    float _982 = _964 * _942;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _984;
    bool _988 = false;
    float _990 = _966;
    if (_878)
    {
        bool _992 = _920 > 0.5;
        _988 = _992;
    }
    bool _994 = _988;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1000;
    float _1004 = _952 * _960;
    if (_878)
    {
        float _1006 = -_130;
        float _1008 = _1006 + 1.0;
        _712 = as_type<int>(_1008);
    }
    int _1010 = _712;
    float _1012 = in.m_45.y;
    float _1014 = fma(_978, _966, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1024 = _970 * _980;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1034;
    float _1038 = fma(_1018, _982, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1044 = fma(_1032, _982, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1046 = fma(_1036, _982, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1052 = fma(_1028, _966, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1054 = fma(_998, _966, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1064;
    float _1068 = fma(_1022, _1004, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1070 = fma(_1042, _1004, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1072 = fma(_1050, _1004, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    if (!_878)
    {
        _990 = _130;
    }
    float _1074 = _990;
    float _1076 = -_136;
    float _1078 = _1076 + 1.0;
    float _1080 = _1074;
    if (_878)
    {
        float _1082 = _994 ? as_type<float>(_1010) : _130;
        _1080 = _1082;
    }
    float _1084 = _1080;
    float _1086 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1088 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1090 = isnan(_866);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = fma(_1058, _1024, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    bool _1102 = _868 > 0.5;
    float _1104 = fma(_1062, _1024, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1106 = fma(_1066, _1024, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    bool _1108 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1110 = isnan(_866);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = -_1098;
    float _1122 = _1120 + 1.0;
    int _1124 = _1102 ? as_type<int>(_1078) : as_type<int>(_136);
    float _1126 = fma(_1002, _948, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1128 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1130 = isnan(_866);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = fma(_974, _948, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1142 = fma(_986, _948, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1144 = -_1118;
    float _1146 = _1144 + 1.0;
    float _1148 = _1118 * _1122;
    float _1150 = _894 ? as_type<float>(_1124) : _136;
    float _1152 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1154 = _1122;
    float _1156 = _1126;
    if (_928)
    {
        _1154 = _874;
    }
    float _1158 = _1154;
    float _1160 = _954 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1162 = _1158;
    if (_902)
    {
        float _1164 = _932 ? _1078 : _136;
        _182 = _1164;
    }
    float _1166 = _182;
    float _1168 = -_1138;
    float _1170 = _1168 + 1.0;
    bool _1172 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1174 = isnan(_866);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = _956 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (!_928)
    {
        _1162 = _868;
    }
    float _1186 = _1162;
    float _1188 = _1138 * _1146;
    bool _1190 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1192 = isnan(_866);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1198 = _1194 || _1196;
    float _1200 = float(_1198);
    float _1202 = _958 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1204 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1206 = isnan(_866);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1212 = _1208 || _1210;
    float _1214 = float(_1212);
    float _1216 = _1182 * _1170;
    float _1218 = -_1182;
    float _1220 = _1218 + 1.0;
    float _1222 = -_1200;
    float _1224 = _1222 + 1.0;
    bool _1226 = _1012 > 0.5;
    bool _1228 = _1226 && _886;
    float _1230 = _1200 * _1220;
    float _1232 = fma(_1150, _1152, -0.5);
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1236 = _1214 * _1224;
    float _1238 = -_1214;
    float _1240 = _1238 + 1.0;
    float _1242 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1244 = _1142 * _1236;
    float _1246 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1234);
    float _1248 = _1126 * _1236;
    float _1250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1252 = _1140 * _1236;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (!_886)
    {
        _1156 = _130;
    }
    float _1256 = _1156;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1260 = _1256;
    if (_1228)
    {
        float _1262 = -_130;
        float _1264 = _1262 + 1.0;
        _184 = _1264;
    }
    float _1266 = _184;
    float _1268 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1248);
    float _1270 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1252);
    if (_928)
    {
        _1254 = _1012;
    }
    float _1272 = _1254;
    float _1274 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1244);
    float _1276 = _1272;
    if (!_928)
    {
        _1276 = _874;
    }
    float _1278 = _1276;
    float _1280 = fma(_1052, _1230, _1268);
    float _1282 = fma(_1054, _1230, _1274);
    if (_886)
    {
        _1260 = _1266;
    }
    float _1284 = _1260;
    float _1286 = fma(_1014, _1230, _1270);
    float _1288 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1292 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1294 = fma(_1038, _1216, _1280);
    float _1296 = fma(_1288, -2.0, _1290);
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1300 = _1160 + _1298;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1304 = fma(_1292, _1284, -0.5);
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1308 = _1184 + _1306;
    float _1310 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1312 = -_1302;
    float _1314 = fma(_1242, 2.0, _1312);
    float _1316 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1258);
    float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1320 = _1202 + _1318;
    float _1322 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1310);
    float _1324 = fma(_1044, _1216, _1286);
    float _1326 = fma(_86, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1246);
    float _1328 = -_86;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1314);
    float _1332 = fma(_1046, _1216, _1282);
    float _1334 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1322);
    float _1336 = fma(_86, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1316);
    float _1338 = fma(_86, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1296);
    float _1340 = _1300 * _1300;
    float _1342 = fma(_1326, _1304, _1330);
    bool _1344 = _1334 >= 0.0;
    float _1346 = in.m_49.w;
    float _1348 = fma(_1070, _1188, _1324);
    float _1350 = fma(_1308, _1308, _1340);
    float _1352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1354 = fma(_1068, _1188, _1294);
    float _1356 = fma(_1072, _1188, _1332);
    float _1358 = -_1338;
    float _1360 = fma(_1336, _1232, _1358);
    float _1362 = fma(_1320, _1320, _1350);
    float _1364 = fma(_1100, _1148, _1354);
    float _1366 = fma(_1104, _1148, _1348);
    float _1368 = fma(_1106, _1148, _1356);
    float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1372 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1364);
    float _1374 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1366);
    float _1376 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1368);
    float _1378 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1380 = _1348;
    if (_1344)
    {
        _1380 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1382 = _1380;
    float _1384 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1386 = _1372 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1388 = rsqrt(_1362);
    float _1390 = _1374 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1392 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1394 = _1378 * _1352;
    float _1396 = _1342 + 0.5;
    float _1398 = _1360 + 0.5;
    int _1400 = as_type<int>(_1382);
    if (_1344)
    {
        float _1402 = _1382 * 5.0;
        _1400 = as_type<int>(_1402);
    }
    int _1404 = _1400;
    float _1406 = _1384 * _1370;
    float _1408 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1410 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1412 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_51.w = _1346;
    out.m_53.z = _1406;
    out.m_53.w = _1394;
    float _1414 = _1300 * _1388;
    float _1416 = _1308 * _1388;
    int _1418 = as_type<int>(_1412);
    if (_1344)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4078 = as_type<float>(_1404);
        out.gl_Position.z = _4078;
    }
    out.m_55.x = _1396;
    out.m_55.y = _1398;
    out.m_57.x = _1408;
    out.m_57.y = _1410;
    out.m_57.z = _1412;
    if (_1344)
    {
        out.m_37.x = 0.0;
    }
    if (_1344)
    {
        return out;
    }
    float _1420 = -_1414;
    float _1422 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1160);
    float _1424 = _1320 * _1388;
    float _1426 = -_1416;
    float _1428 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1184);
    float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1432 = _1422 + _1430;
    float _1434 = -_1424;
    float _1436 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1202);
    float _1438 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1440 = _1428 + _1438;
    float _1442 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1446 = _1436 + _1444;
    float _1448 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1442);
    float _1450 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1448);
    bool _1452 = _1450 >= 0.0;
    float _1454 = _1440;
    if (_1452)
    {
        _1454 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1456 = _1454;
    if (_1452)
    {
        out.m_37.x = 0.0;
    }
    if (_1452)
    {
        float _1458 = _1456 * 5.0;
        _1418 = as_type<int>(_1458);
    }
    int _1460 = _1418;
    if (_1452)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4181 = as_type<float>(_1460);
        out.gl_Position.z = _4181;
    }
    if (_1452)
    {
        return out;
    }
    float _1462 = -_1160;
    float _1464 = _1462 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1466 = -_1184;
    float _1468 = _1466 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1470 = -_1202;
    float _1472 = _1470 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1474 = -_1414;
    float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1300);
    float _1478 = _1464 * _1464;
    float _1480 = -_1416;
    float _1482 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1308);
    float _1484 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1486 = fma(_1468, _1468, _1478);
    float _1488 = _1476 * _1476;
    float _1490 = _704 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1492 = fma(_1472, _1472, _1486);
    float _1494 = fma(_1482, _1482, _1488);
    float _1496 = rsqrt(_1492);
    float _1498 = _1468 * _1496;
    float _1500 = _1472 * _1496;
    float _1502 = -_1424;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1320);
    float _1506 = _1464 * _1496;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1510 = _1498 * _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1514 = _1500 * _1512;
    float _1516 = fma(_1504, _1504, _1494);
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1520 = _1506 * _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1524 = -_1510;
    float _1526 = fma(_1500, _1522, _1524);
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1530 = -_1514;
    float _1532 = fma(_1506, _1528, _1530);
    float _1534 = in.m_59.x;
    float _1536 = in.m_59.y;
    float _1538 = in.m_59.z;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1542 = -_1520;
    float _1544 = fma(_1498, _1540, _1542);
    float _1546 = _1526 * _1526;
    float _1548 = sqrt(_1516);
    float _1550 = fma(_1532, _1532, _1546);
    float _1552 = fma(_1544, _1544, _1550);
    float _1554 = rsqrt(_1552);
    float _1556 = _1388 * _1548;
    float _1558 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1560 = _1556 * _1484;
    float _1562 = _1556 * _1558;
    float _1564 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1536);
    float _1566 = _1556 * _1490;
    float _1568 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1534);
    float _1570 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1538);
    float _1572 = _1562 * _1564;
    float _1574 = _1566 * _1568;
    float _1576 = _1532 * _1554;
    float _1578 = _1526 * _1554;
    float _1580 = _1544 * _1554;
    float _1582 = _1506 * _1576;
    float _1584 = _1500 * _1578;
    float _1586 = -_1582;
    float _1588 = fma(_1498, _1578, _1586);
    float _1590 = -_1584;
    float _1592 = fma(_1506, _1580, _1590);
    float _1594 = _1560 * _1570;
    float _1596 = _1572 * _1588;
    float _1598 = _1572 * _1592;
    float _1600 = fma(_1574, _1580, _1596);
    float _1602 = fma(_1574, _1576, _1598);
    float _1604 = fma(_1594, _1500, _1600);
    float _1606 = fma(_1594, _1498, _1602);
    float _1608 = _1498 * _1580;
    float _1610 = _1202 + _1604;
    float _1612 = _1184 + _1606;
    float _1614 = -_1608;
    float _1616 = fma(_1500, _1576, _1614);
    float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1620 = _1610 + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1624 = _1612 + _1622;
    float _1626 = _1572 * _1616;
    float _1628 = _1620 * _1620;
    float _1630 = fma(_1574, _1578, _1626);
    float _1632 = fma(_1624, _1624, _1628);
    float _1634 = fma(_1594, _1506, _1630);
    float _1636 = sqrt(_1632);
    float _1638 = _1160 + _1634;
    bool _1640 = _1636 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1642 = _1626;
    float _1644 = _1630;
    float _1646 = _1628;
    if (!_1640)
    {
        _1642 = _1612;
    }
    float _1648 = _1642;
    float _1650 = _1648;
    if (!_1640)
    {
        _1644 = _1610;
    }
    float _1652 = _1644;
    float _1654 = _1652;
    if (!_1640)
    {
        _1646 = _1638;
    }
    float _1656 = _1646;
    bool _1658 = !_1640;
    float _1660 = _1656;
    if (!_1658)
    {
        float _1662 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1666 = _1636 + _1664;
        float _1668 = rsqrt(_1632);
        float _1670 = _1666 * _1662;
        float _1672 = _1638 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1674 = _1670 * 0.15915493667125701904296875;
        float _1676 = _1674 * 6.283185482025146484375;
        float _1678 = cos(_1676);
        float _1680 = _1674 * 6.283185482025146484375;
        float _1682 = sin(_1680);
        float _1684 = _1678 + (-1.0);
        float _1686 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1688 = fma(_1682, _1672, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1690 = fma(_1638, _1678, _1686);
        float _1692 = _1668 * _1688;
        float _1694 = fma(_1624, _1692, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1696 = fma(_1620, _1692, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1660 = _1690;
        _1650 = _1694;
        _1654 = _1696;
    }
    float _1698 = _1660;
    float _1700 = _1650;
    float _1702 = _1654;
    float _1704 = -_1414;
    float _1706 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1698);
    float _1708 = -_1416;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1700);
    float _1712 = -_1424;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1702);
    float _1716 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1718 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1720 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1722 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1724 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1716);
    float _1726 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1718);
    float _1728 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1720);
    float _1730 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1722);
    float _1732 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1724);
    float _1734 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1726);
    float _1736 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1728);
    float _1738 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1730);
    float _1740 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1742 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1744 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1746 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1748 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1750 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1752 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1754 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1756 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1748);
    float _1758 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1750);
    float _1760 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1752);
    float _1762 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1754);
    float _1764 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1756);
    float _1766 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1758);
    float _1768 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1760);
    float _1770 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1762);
    float _1772 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1764);
    float _1774 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1766);
    float _1776 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1768);
    float _1778 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1770);
    float _1780 = _1772 + _1774;
    float _1782 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1784 = _1780 * 0.5;
    out.m_37.x = _1782;
    out.gl_Position.x = _1776;
    out.gl_Position.y = _1778;
    out.gl_Position.z = _1772;
    out.gl_Position.w = _1774;
    out.m_61.z = _1784;
    out.m_61.w = _1774;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    bool _732 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_30.w;
    float _77 = in.m_32.w;
    float _79 = trunc(_75);
    int _82 = int(_79);
    float _84 = -_77;
    float _86 = _84 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _86;
    bool _90 = _82 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_82);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    if (!_90)
    {
        out.m_37.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1852 = as_type<float>(_102);
        out.gl_Position.z = _1852;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _106 = _77 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_77);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = float(_82);
    bool _118 = _86 >= _116;
    bool _120 = !_114;
    bool _122 = _118 || _120;
    if (_122)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _94;
    if (_122)
    {
        out.m_37.x = 0.0;
    }
    if (_122)
    {
        float _126 = _124 * 5.0;
        _104 = as_type<int>(_126);
    }
    int _128 = _104;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1907 = as_type<float>(_128);
        out.gl_Position.z = _1907;
    }
    if (_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_39.x;
    float _132 = 1.0 / _116;
    float _134 = _86 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _136 = in.m_39.y;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    float _148 = in.m_41.w;
    float _150 = in.m_32.x;
    float _152 = in.m_32.y;
    float _154 = in.m_32.z;
    float _156 = in.m_30.x;
    float _158 = in.m_30.y;
    float _160 = in.m_30.z;
    float _162 = 0.0;
    float _164 = _134;
    if (!_146)
    {
        float _166 = _134 * _134;
        float _168 = _166 * 0.5;
        _162 = _168;
    }
    float _170 = _162;
    float _172 = _170;
    if (!_146)
    {
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    out.m_43.x = _130;
    out.m_43.y = _136;
    bool _178 = !_146;
    float _180 = _176;
    float _182 = _136;
    float _184 = _130;
    if (!_178)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _134 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _134);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _214;
    }
    float _216 = _180;
    bool _218 = !_146;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _134 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _164 = _238;
    }
    float _240 = _164;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _150, _244);
    float _252 = fma(_240, _152, _246);
    float _254 = fma(_240, _154, _248);
    float _256 = _86 * _132;
    float _258 = fma(_250, _148, _156);
    float _260 = fma(_252, _148, _158);
    float _262 = fma(_254, _148, _160);
    bool _264 = !_242;
    float _266 = _256;
    float _284;
    if (!_264)
    {
        float _268 = in.m_45.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _86);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        _284 = _256;
    }
    _286 = false;
    float _288 = _284;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _292 = _288 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _296 = _288 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _314 = 1.0 / _300;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = 1.0 / _318;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _334 = 1.0 / _308;
    bool _336 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = isnan(_288);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _348;
    bool _352 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _354 = isnan(_288);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    float _368 = -_346;
    float _370 = _368 + 1.0;
    float _372 = 1.0 / _304;
    float _374 = _292 * _324;
    float _376 = _362 * _370;
    float _378 = -_362;
    float _380 = _378 + 1.0;
    bool _382 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    float _388 = 1.0 / _322;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _396 = _288 + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = _396 * _314;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _406 = _288 + _404;
    float _408 = 1.0 / _312;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _412 = _288 + _410;
    float _414 = fma(_328, _402, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _416 = _406 * _334;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _420 = _288 + _418;
    float _422 = _412 * _372;
    bool _424 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _426 = isnan(_288);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = fma(_386, _402, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _438 = 1.0 / _392;
    float _440 = _296 * _388;
    bool _442 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _444 = isnan(_288);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = fma(_332, _422, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _456 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _458 = isnan(_288);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = fma(_400, _422, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _470 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _472 = isnan(_288);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = _420 * _408;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _486 = _288 + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _496 = fma(_490, _402, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _498 = -_452;
    float _500 = _498 + 1.0;
    float _502 = _486 * _438;
    float _504 = -_434;
    float _506 = _504 + 1.0;
    float _508 = fma(_494, _422, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = -_466;
    float _512 = _510 + 1.0;
    float _514 = _452 * _506;
    float _516 = _466 * _500;
    bool _518 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _520 = isnan(_288);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _480 * _512;
    float _532 = -_480;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _536;
    float _540 = _528 * _534;
    float _542 = -_528;
    float _544 = _542 + 1.0;
    float _546 = fma(_538, _374, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _552 = _346 * _544;
    float _554 = fma(_350, _374, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _556 = fma(_366, _374, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _558 = _288 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _560 = isnan(_288);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _578 = fma(_550, _440, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _580 = _568 * _380;
    float _582 = fma(_572, _440, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _584 = fma(_576, _440, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _586 = -_568;
    float _588 = _586 + 1.0;
    float _590 = _496 * _580;
    float _592 = _414 * _580;
    float _594 = _436 * _580;
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[143].x, _590);
    float _598 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[143].y, _592);
    float _600 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[143].z, _594);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _602;
    float _606 = fma(_508, _376, _596);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _612;
    float _616 = fma(_454, _376, _598);
    float _618 = fma(_468, _376, _600);
    float _620 = fma(_604, _416, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _622 = fma(_610, _416, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _624 = fma(_614, _416, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _630 = fma(_546, _552, _606);
    float _632 = fma(_554, _552, _616);
    float _634 = fma(_556, _552, _618);
    float _636 = fma(_628, _482, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _638 = fma(_582, _540, _630);
    float _640 = fma(_578, _540, _632);
    float _642 = fma(_584, _540, _634);
    float _644 = in.m_41.x;
    float _646 = in.m_41.y;
    float _648 = in.m_41.z;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _658 = fma(_620, _530, _638);
    float _660 = fma(_652, _482, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _666;
    float _670 = fma(_656, _482, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _672 = fma(_622, _530, _640);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _674;
    float _678 = fma(_624, _530, _642);
    float _680 = fma(_664, _502, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _682 = fma(_668, _502, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _684 = fma(_636, _516, _658);
    float _686 = fma(_676, _502, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _688 = fma(_660, _516, _672);
    float _690 = fma(_670, _516, _678);
    float _692 = fma(_680, _514, _684);
    float _694 = fma(_682, _514, _688);
    float _696 = fma(_686, _514, _690);
    float _698 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[150].x, _692);
    float _700 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[150].y, _694);
    float _702 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[150].z, _696);
    float _704 = _698 * _644;
    float _706 = _700 * _646;
    float _708 = _702 * _648;
    bool _710 = !_382;
    int _712 = as_type<int>(_638);
    float _730;
    if (!_710)
    {
        float _714 = in.m_45.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[11].y, _86);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        _730 = _256;
    }
    _732 = false;
    float _734 = _730;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _738 = _734 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _744 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _746 = isnan(_734);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _760 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _762 = isnan(_734);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _772;
    bool _776 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _778 = isnan(_734);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = 1.0 / _742;
    float _790 = -_754;
    float _792 = _790 + 1.0;
    bool _794 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _796 = _770 * _792;
    float _798 = -_770;
    float _800 = _798 + 1.0;
    float _802 = 1.0 / _758;
    float _804 = _774 * _788;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _810 = fma(_804, _738, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _812 = _808 * _802;
    float _814 = _810 * _796;
    float _816 = -_786;
    float _818 = _816 + 1.0;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _822 = _734 + _820;
    float _824 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[115].x, _814);
    float _826 = _754 * _818;
    float _828 = fma(_812, _822, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _832 = fma(_828, _826, _824);
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _838 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[117].x, _832);
    float _840 = _830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _842 = _834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _844 = _836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _846 = _838 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_47.x = _840;
    out.m_47.y = _842;
    out.m_47.z = _844;
    out.m_47.w = _846;
    bool _848 = !_794;
    if (!_848)
    {
        float _850 = in.m_45.x;
        float _852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _854 = _850 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _856 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[11].z, _86);
        float _858 = _856 * _852;
        float _860 = floor(_858);
        float _862 = -_860;
        float _864 = _858 + _862;
        _266 = _864;
    }
    float _866 = _266;
    float _868 = in.m_45.z;
    float _870 = in.m_45.w;
    float _872 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _874 = in.m_45.x;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _878 = _876 != 0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _880;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _886 = _884 != 0;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _888;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _894 = _892 != 0;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _902 = _900 != 0;
    float _904 = 1.0 / _882;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _910 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _872);
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _912;
    float _916 = _840;
    if (_878)
    {
        float _918 = in.m_45.z;
        _916 = _918;
    }
    float _920 = _916;
    float _922 = 1.0 / _908;
    float _924 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _928 = _926 != 0;
    float _930 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _932 = _870 > 0.5;
    float _934 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _924);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _938 = _866 + _936;
    float _940 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _930);
    float _942 = 1.0 / _890;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _946 = _866 + _944;
    float _948 = _938 * _904;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _952 = _866 + _950;
    float _954 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _910);
    float _956 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _934);
    float _958 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _940);
    float _960 = 1.0 / _898;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _964 = _866 + _962;
    float _966 = _946 * _922;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _970 = _866 + _968;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _972;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _980 = 1.0 / _914;
    float _982 = _964 * _942;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _984;
    bool _988 = false;
    float _990 = _966;
    if (_878)
    {
        bool _992 = _920 > 0.5;
        _988 = _992;
    }
    bool _994 = _988;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1000;
    float _1004 = _952 * _960;
    if (_878)
    {
        float _1006 = -_130;
        float _1008 = _1006 + 1.0;
        _712 = as_type<int>(_1008);
    }
    int _1010 = _712;
    float _1012 = in.m_45.y;
    float _1014 = fma(_978, _966, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1024 = _970 * _980;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1034;
    float _1038 = fma(_1018, _982, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1044 = fma(_1032, _982, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1046 = fma(_1036, _982, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1052 = fma(_1028, _966, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1054 = fma(_998, _966, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1064;
    float _1068 = fma(_1022, _1004, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1070 = fma(_1042, _1004, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1072 = fma(_1050, _1004, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    if (!_878)
    {
        _990 = _130;
    }
    float _1074 = _990;
    float _1076 = -_136;
    float _1078 = _1076 + 1.0;
    float _1080 = _1074;
    if (_878)
    {
        float _1082 = _994 ? as_type<float>(_1010) : _130;
        _1080 = _1082;
    }
    float _1084 = _1080;
    float _1086 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1088 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1090 = isnan(_866);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = fma(_1058, _1024, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    bool _1102 = _868 > 0.5;
    float _1104 = fma(_1062, _1024, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1106 = fma(_1066, _1024, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    bool _1108 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1110 = isnan(_866);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = -_1098;
    float _1122 = _1120 + 1.0;
    int _1124 = _1102 ? as_type<int>(_1078) : as_type<int>(_136);
    float _1126 = fma(_1002, _948, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1128 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1130 = isnan(_866);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = fma(_974, _948, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1142 = fma(_986, _948, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1144 = -_1118;
    float _1146 = _1144 + 1.0;
    float _1148 = _1118 * _1122;
    float _1150 = _894 ? as_type<float>(_1124) : _136;
    float _1152 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1154 = _1122;
    float _1156 = _1126;
    if (_928)
    {
        _1154 = _874;
    }
    float _1158 = _1154;
    float _1160 = _954 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1162 = _1158;
    if (_902)
    {
        float _1164 = _932 ? _1078 : _136;
        _182 = _1164;
    }
    float _1166 = _182;
    float _1168 = -_1138;
    float _1170 = _1168 + 1.0;
    bool _1172 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1174 = isnan(_866);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = _956 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (!_928)
    {
        _1162 = _868;
    }
    float _1186 = _1162;
    float _1188 = _1138 * _1146;
    bool _1190 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1192 = isnan(_866);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1198 = _1194 || _1196;
    float _1200 = float(_1198);
    float _1202 = _958 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1204 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1206 = isnan(_866);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1212 = _1208 || _1210;
    float _1214 = float(_1212);
    float _1216 = _1182 * _1170;
    float _1218 = -_1182;
    float _1220 = _1218 + 1.0;
    float _1222 = -_1200;
    float _1224 = _1222 + 1.0;
    bool _1226 = _1012 > 0.5;
    bool _1228 = _1226 && _886;
    float _1230 = _1200 * _1220;
    float _1232 = fma(_1150, _1152, -0.5);
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1236 = _1214 * _1224;
    float _1238 = -_1214;
    float _1240 = _1238 + 1.0;
    float _1242 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1244 = _1142 * _1236;
    float _1246 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1234);
    float _1248 = _1126 * _1236;
    float _1250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1252 = _1140 * _1236;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (!_886)
    {
        _1156 = _130;
    }
    float _1256 = _1156;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1260 = _1256;
    if (_1228)
    {
        float _1262 = -_130;
        float _1264 = _1262 + 1.0;
        _184 = _1264;
    }
    float _1266 = _184;
    float _1268 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1248);
    float _1270 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1252);
    if (_928)
    {
        _1254 = _1012;
    }
    float _1272 = _1254;
    float _1274 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1244);
    float _1276 = _1272;
    if (!_928)
    {
        _1276 = _874;
    }
    float _1278 = _1276;
    float _1280 = fma(_1052, _1230, _1268);
    float _1282 = fma(_1054, _1230, _1274);
    if (_886)
    {
        _1260 = _1266;
    }
    float _1284 = _1260;
    float _1286 = fma(_1014, _1230, _1270);
    float _1288 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1292 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1294 = fma(_1038, _1216, _1280);
    float _1296 = fma(_1288, -2.0, _1290);
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1300 = _1160 + _1298;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1304 = fma(_1292, _1284, -0.5);
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1308 = _1184 + _1306;
    float _1310 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1312 = -_1302;
    float _1314 = fma(_1242, 2.0, _1312);
    float _1316 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1258);
    float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1320 = _1202 + _1318;
    float _1322 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1310);
    float _1324 = fma(_1044, _1216, _1286);
    float _1326 = fma(_86, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1246);
    float _1328 = -_86;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1314);
    float _1332 = fma(_1046, _1216, _1282);
    float _1334 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1322);
    float _1336 = fma(_86, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1316);
    float _1338 = fma(_86, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1296);
    float _1340 = _1300 * _1300;
    float _1342 = fma(_1326, _1304, _1330);
    bool _1344 = _1334 >= 0.0;
    float _1346 = in.m_49.w;
    float _1348 = fma(_1070, _1188, _1324);
    float _1350 = fma(_1308, _1308, _1340);
    float _1352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1354 = fma(_1068, _1188, _1294);
    float _1356 = fma(_1072, _1188, _1332);
    float _1358 = -_1338;
    float _1360 = fma(_1336, _1232, _1358);
    float _1362 = fma(_1320, _1320, _1350);
    float _1364 = fma(_1100, _1148, _1354);
    float _1366 = fma(_1104, _1148, _1348);
    float _1368 = fma(_1106, _1148, _1356);
    float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1372 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1364);
    float _1374 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1366);
    float _1376 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1368);
    float _1378 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1380 = _1348;
    if (_1344)
    {
        _1380 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1382 = _1380;
    float _1384 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1386 = _1372 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1388 = rsqrt(_1362);
    float _1390 = _1374 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1392 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1394 = _1378 * _1352;
    float _1396 = _1342 + 0.5;
    float _1398 = _1360 + 0.5;
    int _1400 = as_type<int>(_1382);
    if (_1344)
    {
        float _1402 = _1382 * 5.0;
        _1400 = as_type<int>(_1402);
    }
    int _1404 = _1400;
    float _1406 = _1384 * _1370;
    float _1408 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1410 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1412 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_51.w = _1346;
    out.m_53.z = _1406;
    out.m_53.w = _1394;
    float _1414 = _1300 * _1388;
    float _1416 = _1308 * _1388;
    int _1418 = as_type<int>(_1412);
    if (_1344)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4078 = as_type<float>(_1404);
        out.gl_Position.z = _4078;
    }
    out.m_55.x = _1396;
    out.m_55.y = _1398;
    out.m_57.x = _1408;
    out.m_57.y = _1410;
    out.m_57.z = _1412;
    if (_1344)
    {
        out.m_37.x = 0.0;
    }
    if (_1344)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1420 = -_1414;
    float _1422 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1160);
    float _1424 = _1320 * _1388;
    float _1426 = -_1416;
    float _1428 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1184);
    float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1432 = _1422 + _1430;
    float _1434 = -_1424;
    float _1436 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1202);
    float _1438 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1440 = _1428 + _1438;
    float _1442 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1446 = _1436 + _1444;
    float _1448 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1442);
    float _1450 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1448);
    bool _1452 = _1450 >= 0.0;
    float _1454 = _1440;
    if (_1452)
    {
        _1454 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1456 = _1454;
    if (_1452)
    {
        out.m_37.x = 0.0;
    }
    if (_1452)
    {
        float _1458 = _1456 * 5.0;
        _1418 = as_type<int>(_1458);
    }
    int _1460 = _1418;
    if (_1452)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4181 = as_type<float>(_1460);
        out.gl_Position.z = _4181;
    }
    if (_1452)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1462 = -_1160;
    float _1464 = _1462 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1466 = -_1184;
    float _1468 = _1466 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1470 = -_1202;
    float _1472 = _1470 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1474 = -_1414;
    float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1300);
    float _1478 = _1464 * _1464;
    float _1480 = -_1416;
    float _1482 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1308);
    float _1484 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1486 = fma(_1468, _1468, _1478);
    float _1488 = _1476 * _1476;
    float _1490 = _704 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1492 = fma(_1472, _1472, _1486);
    float _1494 = fma(_1482, _1482, _1488);
    float _1496 = rsqrt(_1492);
    float _1498 = _1468 * _1496;
    float _1500 = _1472 * _1496;
    float _1502 = -_1424;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1320);
    float _1506 = _1464 * _1496;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1510 = _1498 * _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1514 = _1500 * _1512;
    float _1516 = fma(_1504, _1504, _1494);
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1520 = _1506 * _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1524 = -_1510;
    float _1526 = fma(_1500, _1522, _1524);
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1530 = -_1514;
    float _1532 = fma(_1506, _1528, _1530);
    float _1534 = in.m_59.x;
    float _1536 = in.m_59.y;
    float _1538 = in.m_59.z;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1542 = -_1520;
    float _1544 = fma(_1498, _1540, _1542);
    float _1546 = _1526 * _1526;
    float _1548 = sqrt(_1516);
    float _1550 = fma(_1532, _1532, _1546);
    float _1552 = fma(_1544, _1544, _1550);
    float _1554 = rsqrt(_1552);
    float _1556 = _1388 * _1548;
    float _1558 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1560 = _1556 * _1484;
    float _1562 = _1556 * _1558;
    float _1564 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1536);
    float _1566 = _1556 * _1490;
    float _1568 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1534);
    float _1570 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1538);
    float _1572 = _1562 * _1564;
    float _1574 = _1566 * _1568;
    float _1576 = _1532 * _1554;
    float _1578 = _1526 * _1554;
    float _1580 = _1544 * _1554;
    float _1582 = _1506 * _1576;
    float _1584 = _1500 * _1578;
    float _1586 = -_1582;
    float _1588 = fma(_1498, _1578, _1586);
    float _1590 = -_1584;
    float _1592 = fma(_1506, _1580, _1590);
    float _1594 = _1560 * _1570;
    float _1596 = _1572 * _1588;
    float _1598 = _1572 * _1592;
    float _1600 = fma(_1574, _1580, _1596);
    float _1602 = fma(_1574, _1576, _1598);
    float _1604 = fma(_1594, _1500, _1600);
    float _1606 = fma(_1594, _1498, _1602);
    float _1608 = _1498 * _1580;
    float _1610 = _1202 + _1604;
    float _1612 = _1184 + _1606;
    float _1614 = -_1608;
    float _1616 = fma(_1500, _1576, _1614);
    float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1620 = _1610 + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1624 = _1612 + _1622;
    float _1626 = _1572 * _1616;
    float _1628 = _1620 * _1620;
    float _1630 = fma(_1574, _1578, _1626);
    float _1632 = fma(_1624, _1624, _1628);
    float _1634 = fma(_1594, _1506, _1630);
    float _1636 = sqrt(_1632);
    float _1638 = _1160 + _1634;
    bool _1640 = _1636 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1642 = _1626;
    float _1644 = _1630;
    float _1646 = _1628;
    if (!_1640)
    {
        _1642 = _1612;
    }
    float _1648 = _1642;
    float _1650 = _1648;
    if (!_1640)
    {
        _1644 = _1610;
    }
    float _1652 = _1644;
    float _1654 = _1652;
    if (!_1640)
    {
        _1646 = _1638;
    }
    float _1656 = _1646;
    bool _1658 = !_1640;
    float _1660 = _1656;
    if (!_1658)
    {
        float _1662 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1666 = _1636 + _1664;
        float _1668 = rsqrt(_1632);
        float _1670 = _1666 * _1662;
        float _1672 = _1638 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1674 = _1670 * 0.15915493667125701904296875;
        float _1676 = _1674 * 6.283185482025146484375;
        float _1678 = cos(_1676);
        float _1680 = _1674 * 6.283185482025146484375;
        float _1682 = sin(_1680);
        float _1684 = _1678 + (-1.0);
        float _1686 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1688 = fma(_1682, _1672, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1690 = fma(_1638, _1678, _1686);
        float _1692 = _1668 * _1688;
        float _1694 = fma(_1624, _1692, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1696 = fma(_1620, _1692, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1660 = _1690;
        _1650 = _1694;
        _1654 = _1696;
    }
    float _1698 = _1660;
    float _1700 = _1650;
    float _1702 = _1654;
    float _1704 = -_1414;
    float _1706 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1698);
    float _1708 = -_1416;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1700);
    float _1712 = -_1424;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1702);
    float _1716 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1718 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1720 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1722 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1724 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1716);
    float _1726 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1718);
    float _1728 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1720);
    float _1730 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1722);
    float _1732 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1724);
    float _1734 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1726);
    float _1736 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1728);
    float _1738 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1730);
    float _1740 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1742 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1744 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1746 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1748 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1750 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1752 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1754 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1756 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1748);
    float _1758 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1750);
    float _1760 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1752);
    float _1762 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1754);
    float _1764 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1756);
    float _1766 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1758);
    float _1768 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1760);
    float _1770 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1762);
    float _1772 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1764);
    float _1774 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1766);
    float _1776 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1768);
    float _1778 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1770);
    float _1780 = _1772 + _1774;
    float _1782 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1784 = _1780 * 0.5;
    out.m_37.x = _1782;
    out.gl_Position.x = _1776;
    out.gl_Position.y = _1778;
    out.gl_Position.z = _1772;
    out.gl_Position.w = _1774;
    out.m_61.z = _1784;
    out.m_61.w = _1774;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

