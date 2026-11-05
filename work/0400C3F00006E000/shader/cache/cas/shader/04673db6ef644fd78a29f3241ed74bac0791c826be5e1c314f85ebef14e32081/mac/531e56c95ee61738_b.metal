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
    float4 m_47 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_39 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_33 [[attribute(7)]];
    float4 m_41 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _594 = false;
    bool _264 = false;
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
        float _1645 = as_type<float>(_82);
        out.gl_Position.z = _1645;
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
    float _102 = _100;
    if (_96)
    {
        float _104 = float(_66);
        _76 = _104;
    }
    float _106 = _76;
    bool _108 = _100 >= _106;
    bool _110 = !_96;
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
        _84 = as_type<int>(_118);
    }
    int _120 = _84;
    if (_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1715 = as_type<float>(_120);
        out.gl_Position.z = _1715;
    }
    if (_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_33.w;
    float _124 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _148 = 0.0;
    float _150 = _124;
    if (!_134)
    {
        float _152 = _124 * _124;
        float _154 = _152 * 0.5;
        _148 = _154;
    }
    float _156 = _148;
    float _158 = _156;
    if (!_134)
    {
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = !_134;
    float _166 = _162;
    if (!_164)
    {
        float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _170 = log2(_168);
        float _172 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _174 = _172 + 1.0;
        float _176 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = _124 * _170;
        float _180 = 1.0 / _174;
        float _182 = _176 * 0.693147182464599609375;
        float _184 = exp2(_178);
        float _186 = 1.0 / _182;
        float _188 = _184 + (-1.0);
        float _190 = -_188;
        float _192 = fma(_190, _186, _124);
        float _194 = _192 * _180;
        float _196 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _196;
    }
    float _198 = _166;
    bool _200 = !_134;
    if (!_200)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = 1.0 / _208;
        float _212 = _124 * _204;
        float _214 = exp2(_212);
        float _216 = -_214;
        float _218 = _216 + 1.0;
        float _220 = _218 * _210;
        _150 = _220;
    }
    float _222 = _150;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _226 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _228 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _230 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _232 = fma(_222, _136, _226);
    float _234 = fma(_222, _138, _228);
    float _236 = fma(_222, _140, _230);
    float _238 = fma(_232, _122, _142);
    float _240 = fma(_234, _122, _144);
    float _242 = fma(_236, _122, _146);
    bool _244 = !_224;
    float _262;
    if (!_244)
    {
        float _246 = in.m_35.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_66);
        float _268 = 1.0 / _266;
        float _270 = _100 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _272 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _294 = 1.0 / _280;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _296;
    float _300 = 1.0 / _288;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _272 + _302;
    bool _306 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _308 = isnan(_272);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -_316;
    float _320 = _318 + 1.0;
    float _322 = 1.0 / _284;
    float _324 = _304 * _294;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _328 = _272 + _326;
    bool _330 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _332 = isnan(_272);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _342;
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _348 = 1.0 / _292;
    float _350 = _328 * _300;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _354 = _272 + _352;
    bool _356 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _358 = isnan(_272);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = fma(_344, _324, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _370 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _372 = isnan(_272);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = 1.0 / _298;
    float _384 = _276 * _322;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _388 = _272 + _386;
    bool _390 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _392 = isnan(_272);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = _380 * _320;
    float _404 = -_380;
    float _406 = _404 + 1.0;
    float _408 = _354 * _348;
    float _410 = -_366;
    float _412 = _410 + 1.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _414;
    float _418 = _340 * _412;
    float _420 = -_340;
    float _422 = _420 + 1.0;
    float _424 = fma(_416, _324, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _426 = _388 * _382;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _428;
    float _432 = _400 * _422;
    float _434 = -_400;
    float _436 = _434 + 1.0;
    float _438 = fma(_430, _324, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _440 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _442 = isnan(_272);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = _316 * _436;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _462 = _450 * _406;
    float _464 = -_450;
    float _466 = _464 + 1.0;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _472 = fma(_460, _384, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _474 = _438 * _462;
    float _476 = _424 * _462;
    float _478 = _368 * _462;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].x, _474);
    float _494 = fma(_456, _384, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _496 = fma(_470, _384, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _498 = fma(_482, _350, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _500 = fma(_486, _350, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _502 = fma(_490, _350, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _504 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].y, _476);
    float _506 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].z, _478);
    float _508 = fma(_472, _402, _492);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _518 = fma(_496, _402, _506);
    float _520 = fma(_498, _452, _508);
    float _522 = fma(_512, _408, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _528 = fma(_494, _402, _504);
    float _530 = fma(_502, _452, _518);
    float _532 = fma(_516, _408, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _538;
    float _542 = fma(_526, _408, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _544 = fma(_500, _452, _528);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _546;
    float _550 = fma(_522, _432, _520);
    float _552 = fma(_536, _426, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _554 = fma(_540, _426, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _556 = fma(_548, _426, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _558 = fma(_532, _432, _544);
    float _560 = fma(_542, _432, _530);
    float _562 = fma(_552, _418, _550);
    float _564 = fma(_554, _418, _558);
    float _566 = fma(_556, _418, _560);
    float _568 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[148].x, _562);
    float _570 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[148].y, _564);
    float _572 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[148].z, _566);
    bool _574 = !_346;
    float _592;
    if (!_574)
    {
        float _576 = in.m_35.x;
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _580 = _576 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _584 = _582 * _578;
        float _586 = floor(_584);
        float _588 = -_586;
        float _590 = _584 + _588;
        _592 = _590;
        _594 = true;
    }
    else
    {
        float _596 = float(_66);
        float _598 = 1.0 / _596;
        float _600 = _100 * _598;
        _592 = _600;
    }
    _594 = false;
    float _602 = _592;
    float _604 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _606 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _608 = in.m_35.y;
    float _610 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _604);
    float _612 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _606);
    float _614 = in.m_35.x;
    float _616 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _610);
    float _618 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _612);
    float _620 = in.m_35.z;
    float _622 = _616 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _624 = _618 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _630 = in.m_35.w;
    float _632 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _634 = _622 + _632;
    float _636 = -_624;
    float _638 = _636 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _640 = 1.0 / _628;
    float _642 = abs(_634);
    float _644 = abs(_638);
    float _646 = precise::max(_642, _644);
    out.m_37.x = 1.0;
    out.m_37.y = 1.0;
    out.m_37.z = 1.0;
    bool _648 = _646 >= 16.0;
    float _650 = _608 * 2.0;
    float _652 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _654 = log2(_652);
    float _656 = floor(_650);
    float _658 = _634;
    float _660 = _638;
    float _662 = 1.0;
    int _664 = as_type<int>(_650);
    int _666 = as_type<int>(_602);
    if (_648)
    {
        float _668 = _634 * 0.0625;
        _658 = _668;
    }
    float _670 = _658;
    if (_648)
    {
        float _672 = _638 * 0.0625;
        _660 = _672;
    }
    float _674 = _660;
    float _676 = abs(_670);
    bool _678 = _676 != 0.0;
    bool _680 = isnan(_676);
    bool _682 = _678 || _680;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    float _688 = _654 * _100;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _692 = _690 != 0;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _696 = _694 != 0;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _700 = _698 != 0;
    float _702 = abs(_674);
    bool _704 = _702 == 0.0;
    bool _706 = !_686;
    bool _708 = _704 && _706;
    float _710 = in.m_33.x;
    float _712 = in.m_33.y;
    float _714 = in.m_33.z;
    float _716 = exp2(_688);
    bool _718 = !_696;
    int _720 = _718 ? 0 : 1;
    float _722 = abs(_674);
    bool _724 = _722 == 0.0;
    bool _726 = !_692;
    int _728 = _726 ? 0 : 1;
    bool _730 = !_700;
    int _732 = _730 ? 0 : 1;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _736 = _734 != 0;
    bool _738 = _692;
    int _740 = _724 ? (-1) : 0;
    if (_708)
    {
        bool _742 = as_type<int>(_674) >= 0;
        _738 = _742;
    }
    bool _744 = _738;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _748 = _746 != 0;
    int _750 = 0;
    if (_708)
    {
        int _752 = _744 ? 0 : 1078530011;
        _750 = _752;
    }
    int _754 = _750;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _758 = _756 != 0;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _762 = _760 != 0;
    if (_708)
    {
        int _764 = int(0x80000000) & as_type<int>(_670);
        int _766 = _754 | _764;
        _662 = as_type<float>(_766);
    }
    float _768 = _662;
    bool _770 = !_686;
    bool _772 = _770 && _724;
    float _774 = _768;
    float _776 = _768;
    if (!_772)
    {
        float _778 = abs(_670);
        bool _780 = _778 != as_type<float>(0x7f800000u /* inf */);
        bool _782 = isnan(_778);
        bool _784 = _780 || _782;
        bool _786 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _788 = _784 || _786;
        float _790 = abs(_674);
        bool _792 = _790 == as_type<float>(0x7f800000u /* inf */);
        bool _794 = !_788;
        bool _796 = _792 && _794;
        if (_796)
        {
            bool _798 = as_type<int>(_674) >= 0;
            _740 = _798 ? (-1) : 0;
        }
        int _800 = _740;
        if (_796)
        {
            _664 = 1075235812;
        }
        int _802 = _664;
        int _804 = _802;
        if (_796)
        {
            int _806 = ~_800;
            int _808 = (_806 != 0) ? _802 : 1061752795;
            _804 = _808;
        }
        int _810 = _804;
        float _812 = abs(_674);
        bool _814 = _812 == as_type<float>(0x7f800000u /* inf */);
        if (_796)
        {
            int _816 = int(0x80000000) & as_type<int>(_670);
            int _818 = _810 | _816;
            _774 = as_type<float>(_818);
        }
        float _820 = _774;
        bool _822 = !_788;
        bool _824 = _822 && _814;
        _776 = _820;
        if (!_824)
        {
            float _826 = abs(_670);
            float _828 = abs(_674);
            float _830 = precise::max(_826, _828);
            float _832 = abs(_670);
            float _834 = abs(_674);
            float _836 = precise::min(_832, _834);
            float _838 = 1.0 / _830;
            float _840 = abs(_670);
            float _842 = abs(_674);
            bool _844 = _840 > _842;
            bool _846 = as_type<int>(_674) >= 0;
            float _848 = _836 * _838;
            float _850 = abs(_670);
            float _852 = abs(_674);
            float _854 = _850 + _852;
            int _856 = as_type<int>(_670) & int(0x80000000);
            float _858 = _848 * _848;
            bool _860 = _854 > as_type<float>(0x7f800000u /* inf */);
            bool _862 = isnan(_854);
            bool _864 = _860 || _862;
            bool _866 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _868 = _864 || _866;
            float _870 = _858 + 11.33538818359375;
            float _872 = fma(_858, _870, 28.84246826171875);
            float _874 = fma(_858, _872, 19.6966705322265625);
            float _876 = fma(_858, -0.82336294651031494140625, -5.674867153167724609375);
            float _878 = fma(_858, _876, -6.565555095672607421875);
            float _880 = 1.0 / _874;
            float _882 = _858 * _878;
            float _884 = _848 * _882;
            float _886 = fma(_884, _880, _848);
            float _888 = _886;
            _776 = _854;
            if (_844)
            {
                float _890 = -_886;
                float _892 = _890 + 1.57079637050628662109375;
                _888 = _892;
            }
            float _894 = _888;
            int _896 = as_type<int>(_894);
            if (!_846)
            {
                float _898 = -_894;
                float _900 = _898 + 3.1415927410125732421875;
                _896 = as_type<int>(_900);
            }
            int _902 = _896;
            if (!_868)
            {
                int _904 = _856 | _902;
                _776 = as_type<float>(_904);
            }
        }
    }
    float _906 = _776;
    float _908 = in.m_39.x;
    float _910 = in.m_39.y;
    float _912 = in.m_39.z;
    float _914 = _620 * 2.0;
    bool _916 = _656 > 0.0;
    float _918 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _920 = _656 >= 0.0;
    bool _922 = isnan(_656);
    bool _924 = _920 || _922;
    bool _926 = isnan(0.0);
    bool _928 = _924 || _926;
    float _930 = _570 * _712;
    float _932 = floor(_914);
    int _934 = _928 ? 0 : 1;
    float _936 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _918);
    float _938 = -_716;
    float _940 = _938 + 1.0;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _946 = ~_934;
    int _948 = _946 + 1;
    int _950 = _948 + 1;
    float _952 = _568 * _710;
    float _954 = _572 * _714;
    int _956 = _950;
    if (!_916)
    {
        int _958 = ~_934;
        int _960 = _958 + 1;
        _956 = _960;
    }
    int _962 = _956;
    float _964 = 1.0 / _944;
    bool _966 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _968 = isnan(0.0);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _974 = _970 || _972;
    float _976 = _614 * 2.0;
    bool _978 = _630 > 0.5;
    float _980 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _936);
    bool _982 = _932 > 0.0;
    float _984 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _908);
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _990 = _974 ? _940 : 0.0;
    float _992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _910);
    bool _994 = _932 >= 0.0;
    bool _996 = isnan(_932);
    bool _998 = _994 || _996;
    bool _1000 = isnan(0.0);
    bool _1002 = _998 || _1000;
    float _1004 = floor(_976);
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _912);
    int _1008 = _1002 ? 0 : 1;
    float _1010 = _952 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1012 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1014 = isnan(1.0);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1020 = _1016 || _1018;
    int _1022 = ~_1008;
    int _1024 = _1022 + 1;
    int _1026 = _1024 + 1;
    float _1028 = 1.0 / _988;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1032 = 1.0 + _1030;
    float _1034 = _984 * _1010;
    int _1036 = _1026;
    bool _1038 = _1020;
    bool _1040 = _978;
    if (!_982)
    {
        int _1042 = ~_1008;
        int _1044 = _1042 + 1;
        _1036 = _1044;
    }
    int _1046 = _1036;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1060;
    float _1064 = _1054 * _964;
    float _1066 = 1.0 / _1058;
    float _1068 = _614 + _608;
    float _1070 = _1062 * _1028;
    float _1072 = _614 + _620;
    float _1074 = _1068 + (-1.0);
    float _1076 = _1050 * _640;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    bool _1082 = _1004 >= 0.0;
    bool _1084 = isnan(_1004);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(0.0);
    bool _1090 = _1086 || _1088;
    float _1092 = _608 + _620;
    float _1094 = _1072 + (-1.0);
    float _1096 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1098 = _1090 ? 0 : 1;
    float _1100 = _1092 + (-1.0);
    bool _1102 = _1004 > 0.0;
    float _1104 = _954 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1106 = 1.0 / _1032;
    float _1108 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1110 = _930 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1112 = abs(_720);
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1116 = _602 + _1114;
    int _1118 = ~_1098;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = _992 * _1110;
    int _1126 = abs(_732);
    float _1128 = _1006 * _1104;
    int _1130 = abs(_728);
    float _1132 = _1080 * _1066;
    float _1134 = in.m_41.y;
    float _1136 = float(_1046);
    float _1138 = fma(_1076, _1116, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1140 = float(_1130);
    int _1142 = _1122;
    float _1144 = _1132;
    if (!_1102)
    {
        int _1146 = ~_1098;
        int _1148 = _1146 + 1;
        _1142 = _1148;
    }
    int _1150 = _1142;
    if (_1020)
    {
        float _1152 = _990 * _1106;
        _102 = _1152;
    }
    float _1154 = _102;
    float _1156 = float(_1126);
    float _1158 = _1140 * _1136;
    float _1160 = float(_962);
    float _1162 = in.m_41.x;
    if (_736)
    {
        bool _1164 = _614 > 0.5;
        _1038 = _1164;
    }
    bool _1166 = _1038;
    float _1168 = _1158 * (-2.0);
    float _1170 = _614 + (-0.5);
    float _1172 = _1156 * _1160;
    float _1174 = float(_1112);
    float _1176 = fma(_1096, _1168, _1096);
    float _1178 = float(_1150);
    float _1180 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1182 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1184 = _1172 * (-2.0);
    bool _1186 = _608 > 0.5;
    float _1188 = _1174 * _1178;
    float _1190 = -_1134;
    float _1192 = _1190 + 1.0;
    float _1194 = fma(_1176, _1154, _1180);
    float _1196 = fma(_1182, _1184, _1182);
    float _1198 = _1188 * (-2.0);
    float _1200 = _608 + (-0.5);
    int _1202 = _978 ? as_type<int>(_1192) : as_type<int>(_1134);
    float _1204 = _1194 * 0.15915493667125701904296875;
    float _1206 = _1134;
    if (_748)
    {
        bool _1208 = _620 > 0.5;
        _1040 = _1208;
    }
    bool _1210 = _1040;
    float _1212 = _620 + (-0.5);
    bool _1214 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1216 = isnan(_602);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = fma(_1108, _1198, _1108);
    float _1228 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1230 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _1232 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1234 = isnan(_602);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = -_1224;
    float _1246 = _1244 + 1.0;
    float _1248 = fma(_1226, _1154, _1228);
    float _1250 = fma(_1196, _1154, _1230);
    bool _1252 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1254 = isnan(_602);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1260 = _1256 || _1258;
    float _1262 = float(_1260);
    float _1264 = _1242 * _1246;
    bool _1266 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1268 = isnan(_602);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1274 = _1270 || _1272;
    float _1276 = float(_1274);
    float _1278 = -_1242;
    float _1280 = _1278 + 1.0;
    float _1282 = -_906;
    float _1284 = _1248 + _1282;
    float _1286 = -_1262;
    float _1288 = _1286 + 1.0;
    bool _1290 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1292 = isnan(_602);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = _1250 * 0.15915493667125701904296875;
    float _1304 = _1262 * _1280;
    float _1306 = _1276 * _1288;
    float _1308 = -_1276;
    float _1310 = _1308 + 1.0;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1314 = _602 + _1312;
    float _1316 = _1302 * 6.283185482025146484375;
    float _1318 = cos(_1316);
    float _1320 = _1284 * 0.15915493667125701904296875;
    float _1322 = _1300 * _1310;
    float _1324 = fma(_1064, _1314, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1326 = -_1300;
    float _1328 = _1326 + 1.0;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1332 = _602 + _1330;
    float _1334 = _1138 * _1322;
    float _1336 = _1310;
    float _1338 = _1332;
    int _1340 = as_type<int>(_1306);
    if (!_736)
    {
        _1336 = _1162;
    }
    float _1342 = _1336;
    float _1344 = _1204 * 6.283185482025146484375;
    float _1346 = sin(_1344);
    float _1348 = fma(_1070, _1332, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1350 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1334);
    float _1352 = _758 ? as_type<float>(_1202) : _1134;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1356 = _602 + _1354;
    float _1358 = _1342;
    if (_762)
    {
        float _1360 = _1186 ? _1192 : _1134;
        _1206 = _1360;
    }
    float _1362 = _1206;
    float _1364 = fma(_1324, _1306, _1350);
    if (!_736)
    {
        _1338 = _1342;
    }
    float _1366 = _1338;
    float _1368 = _1204 * 6.283185482025146484375;
    float _1370 = cos(_1368);
    float _1372 = _1366;
    if (_736)
    {
        _1358 = _1162;
    }
    float _1374 = _1358;
    float _1376 = fma(_1132, _1356, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1378 = fma(_1348, _1304, _1364);
    float _1380 = _1318 * _1124;
    if (!_748)
    {
        _1144 = _1374;
    }
    float _1382 = _1144;
    float _1384 = _1382;
    if (_736)
    {
        float _1386 = -_1374;
        float _1388 = _1386 + 1.0;
        _666 = as_type<int>(_1388);
    }
    int _1390 = _666;
    if (_748)
    {
        float _1392 = -_1374;
        float _1394 = _1392 + 1.0;
        _1340 = as_type<int>(_1394);
    }
    int _1396 = _1340;
    float _1398 = _1320 * 6.283185482025146484375;
    float _1400 = cos(_1398);
    float _1402 = fma(_1376, _1264, _1378);
    float _1404 = _1346 * _1380;
    if (_736)
    {
        float _1406 = _1166 ? as_type<float>(_1390) : _1374;
        _1372 = _1406;
    }
    float _1408 = _1372;
    float _1410 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_748)
    {
        float _1412 = _1210 ? as_type<float>(_1396) : _1374;
        _1384 = _1412;
    }
    float _1414 = _1384;
    float _1416 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1402);
    float _1418 = _1320 * 6.283185482025146484375;
    float _1420 = sin(_1418);
    float _1422 = _1370 * _1380;
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1426 = _1302 * 6.283185482025146484375;
    float _1428 = sin(_1426);
    float _1430 = _1346 * _1400;
    float _1432 = _1370 * _1400;
    float _1434 = _1400 * _1318;
    float _1436 = _1346 * _1420;
    float _1438 = _1370 * _1420;
    float _1440 = _1420 * _1318;
    float _1442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1444 = fma(_1428, _1432, _1436);
    float _1446 = _1428 * _1124;
    float _1448 = -_1438;
    float _1450 = fma(_1428, _1430, _1448);
    float _1452 = -_1430;
    float _1454 = fma(_1428, _1438, _1452);
    float _1456 = fma(_1444, _1034, _1422);
    float _1458 = -_1446;
    float _1460 = fma(_1434, _1034, _1458);
    float _1462 = fma(_1450, _1034, _1404);
    float _1464 = _980 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1466 = fma(_1454, _1128, _1456);
    float _1468 = fma(_1428, _1436, _1432);
    float _1470 = fma(_1440, _1128, _1460);
    float _1472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1474 = _1466 + _1464;
    float _1476 = fma(_1468, _1128, _1462);
    float _1478 = _622 + _1470;
    float _1480 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1482 = _624 + _1476;
    float _1484 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1486 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1488 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1480);
    float _1490 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1492 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1484);
    float _1494 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1486);
    float _1496 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1488);
    float _1498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1500 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1492);
    float _1502 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1490);
    float _1504 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1506 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1494);
    float _1508 = _1500 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1510 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1502);
    float _1512 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1514 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1516 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1518 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1520 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1512);
    float _1522 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1526 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1516);
    float _1528 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1520);
    float _1530 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1532 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1518);
    float _1534 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1522);
    float _1536 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1538 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1526);
    float _1540 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1542 = _1530 * _1472;
    float _1544 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1532);
    float _1546 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1534);
    float _1548 = _1410 * _1498;
    float _1550 = _1536 * _1442;
    float _1552 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1554 = _1540 * _1524;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1566 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1538);
    float _1568 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1572 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1574 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1576 = _1560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1578 = _1562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1580 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1582 = _1568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1584 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1528);
    float _1586 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1544);
    float _1588 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1546);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_43.x = _1572;
    out.m_43.y = _1574;
    out.m_43.z = _1576;
    out.m_43.w = _1570;
    out.m_45.x = _1550;
    out.m_45.y = _1548;
    out.m_45.z = _1554;
    out.m_45.w = _1542;
    out.m_47.x = _1578;
    out.m_47.y = _1580;
    out.m_47.z = _1582;
    out.m_47.w = _1424;
    out.gl_Position.x = _1584;
    out.gl_Position.y = _1566;
    out.gl_Position.z = _1586;
    out.gl_Position.w = _1588;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _594 = false;
    bool _264 = false;
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
        float _1645 = as_type<float>(_82);
        out.gl_Position.z = _1645;
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
    float _102 = _100;
    if (_96)
    {
        float _104 = float(_66);
        _76 = _104;
    }
    float _106 = _76;
    bool _108 = _100 >= _106;
    bool _110 = !_96;
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
        _84 = as_type<int>(_118);
    }
    int _120 = _84;
    if (_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1715 = as_type<float>(_120);
        out.gl_Position.z = _1715;
    }
    if (_112)
    {
        return out;
    }
    float _122 = in.m_33.w;
    float _124 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _148 = 0.0;
    float _150 = _124;
    if (!_134)
    {
        float _152 = _124 * _124;
        float _154 = _152 * 0.5;
        _148 = _154;
    }
    float _156 = _148;
    float _158 = _156;
    if (!_134)
    {
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = !_134;
    float _166 = _162;
    if (!_164)
    {
        float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _170 = log2(_168);
        float _172 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _174 = _172 + 1.0;
        float _176 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = _124 * _170;
        float _180 = 1.0 / _174;
        float _182 = _176 * 0.693147182464599609375;
        float _184 = exp2(_178);
        float _186 = 1.0 / _182;
        float _188 = _184 + (-1.0);
        float _190 = -_188;
        float _192 = fma(_190, _186, _124);
        float _194 = _192 * _180;
        float _196 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _196;
    }
    float _198 = _166;
    bool _200 = !_134;
    if (!_200)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = 1.0 / _208;
        float _212 = _124 * _204;
        float _214 = exp2(_212);
        float _216 = -_214;
        float _218 = _216 + 1.0;
        float _220 = _218 * _210;
        _150 = _220;
    }
    float _222 = _150;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _226 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _228 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _230 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _232 = fma(_222, _136, _226);
    float _234 = fma(_222, _138, _228);
    float _236 = fma(_222, _140, _230);
    float _238 = fma(_232, _122, _142);
    float _240 = fma(_234, _122, _144);
    float _242 = fma(_236, _122, _146);
    bool _244 = !_224;
    float _262;
    if (!_244)
    {
        float _246 = in.m_35.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_66);
        float _268 = 1.0 / _266;
        float _270 = _100 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _272 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _294 = 1.0 / _280;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _296;
    float _300 = 1.0 / _288;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _272 + _302;
    bool _306 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _308 = isnan(_272);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -_316;
    float _320 = _318 + 1.0;
    float _322 = 1.0 / _284;
    float _324 = _304 * _294;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _328 = _272 + _326;
    bool _330 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _332 = isnan(_272);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _342;
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _348 = 1.0 / _292;
    float _350 = _328 * _300;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _354 = _272 + _352;
    bool _356 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _358 = isnan(_272);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = fma(_344, _324, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _370 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _372 = isnan(_272);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = 1.0 / _298;
    float _384 = _276 * _322;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _388 = _272 + _386;
    bool _390 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _392 = isnan(_272);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = _380 * _320;
    float _404 = -_380;
    float _406 = _404 + 1.0;
    float _408 = _354 * _348;
    float _410 = -_366;
    float _412 = _410 + 1.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _414;
    float _418 = _340 * _412;
    float _420 = -_340;
    float _422 = _420 + 1.0;
    float _424 = fma(_416, _324, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _426 = _388 * _382;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _428;
    float _432 = _400 * _422;
    float _434 = -_400;
    float _436 = _434 + 1.0;
    float _438 = fma(_430, _324, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _440 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _442 = isnan(_272);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = _316 * _436;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _462 = _450 * _406;
    float _464 = -_450;
    float _466 = _464 + 1.0;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _472 = fma(_460, _384, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _474 = _438 * _462;
    float _476 = _424 * _462;
    float _478 = _368 * _462;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].x, _474);
    float _494 = fma(_456, _384, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _496 = fma(_470, _384, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _498 = fma(_482, _350, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _500 = fma(_486, _350, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _502 = fma(_490, _350, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _504 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].y, _476);
    float _506 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].z, _478);
    float _508 = fma(_472, _402, _492);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _518 = fma(_496, _402, _506);
    float _520 = fma(_498, _452, _508);
    float _522 = fma(_512, _408, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _528 = fma(_494, _402, _504);
    float _530 = fma(_502, _452, _518);
    float _532 = fma(_516, _408, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _538;
    float _542 = fma(_526, _408, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _544 = fma(_500, _452, _528);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _546;
    float _550 = fma(_522, _432, _520);
    float _552 = fma(_536, _426, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _554 = fma(_540, _426, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _556 = fma(_548, _426, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _558 = fma(_532, _432, _544);
    float _560 = fma(_542, _432, _530);
    float _562 = fma(_552, _418, _550);
    float _564 = fma(_554, _418, _558);
    float _566 = fma(_556, _418, _560);
    float _568 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[148].x, _562);
    float _570 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[148].y, _564);
    float _572 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[148].z, _566);
    bool _574 = !_346;
    float _592;
    if (!_574)
    {
        float _576 = in.m_35.x;
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _580 = _576 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _584 = _582 * _578;
        float _586 = floor(_584);
        float _588 = -_586;
        float _590 = _584 + _588;
        _592 = _590;
        _594 = true;
    }
    else
    {
        float _596 = float(_66);
        float _598 = 1.0 / _596;
        float _600 = _100 * _598;
        _592 = _600;
    }
    _594 = false;
    float _602 = _592;
    float _604 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _606 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _608 = in.m_35.y;
    float _610 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _604);
    float _612 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _606);
    float _614 = in.m_35.x;
    float _616 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _610);
    float _618 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _612);
    float _620 = in.m_35.z;
    float _622 = _616 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _624 = _618 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _630 = in.m_35.w;
    float _632 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _634 = _622 + _632;
    float _636 = -_624;
    float _638 = _636 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _640 = 1.0 / _628;
    float _642 = abs(_634);
    float _644 = abs(_638);
    float _646 = precise::max(_642, _644);
    out.m_37.x = 1.0;
    out.m_37.y = 1.0;
    out.m_37.z = 1.0;
    bool _648 = _646 >= 16.0;
    float _650 = _608 * 2.0;
    float _652 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _654 = log2(_652);
    float _656 = floor(_650);
    float _658 = _634;
    float _660 = _638;
    float _662 = 1.0;
    int _664 = as_type<int>(_650);
    int _666 = as_type<int>(_602);
    if (_648)
    {
        float _668 = _634 * 0.0625;
        _658 = _668;
    }
    float _670 = _658;
    if (_648)
    {
        float _672 = _638 * 0.0625;
        _660 = _672;
    }
    float _674 = _660;
    float _676 = abs(_670);
    bool _678 = _676 != 0.0;
    bool _680 = isnan(_676);
    bool _682 = _678 || _680;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    float _688 = _654 * _100;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _692 = _690 != 0;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _696 = _694 != 0;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _700 = _698 != 0;
    float _702 = abs(_674);
    bool _704 = _702 == 0.0;
    bool _706 = !_686;
    bool _708 = _704 && _706;
    float _710 = in.m_33.x;
    float _712 = in.m_33.y;
    float _714 = in.m_33.z;
    float _716 = exp2(_688);
    bool _718 = !_696;
    int _720 = _718 ? 0 : 1;
    float _722 = abs(_674);
    bool _724 = _722 == 0.0;
    bool _726 = !_692;
    int _728 = _726 ? 0 : 1;
    bool _730 = !_700;
    int _732 = _730 ? 0 : 1;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _736 = _734 != 0;
    bool _738 = _692;
    int _740 = _724 ? (-1) : 0;
    if (_708)
    {
        bool _742 = as_type<int>(_674) >= 0;
        _738 = _742;
    }
    bool _744 = _738;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _748 = _746 != 0;
    int _750 = 0;
    if (_708)
    {
        int _752 = _744 ? 0 : 1078530011;
        _750 = _752;
    }
    int _754 = _750;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _758 = _756 != 0;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _762 = _760 != 0;
    if (_708)
    {
        int _764 = int(0x80000000) & as_type<int>(_670);
        int _766 = _754 | _764;
        _662 = as_type<float>(_766);
    }
    float _768 = _662;
    bool _770 = !_686;
    bool _772 = _770 && _724;
    float _774 = _768;
    float _776 = _768;
    if (!_772)
    {
        float _778 = abs(_670);
        bool _780 = _778 != as_type<float>(0x7f800000u /* inf */);
        bool _782 = isnan(_778);
        bool _784 = _780 || _782;
        bool _786 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _788 = _784 || _786;
        float _790 = abs(_674);
        bool _792 = _790 == as_type<float>(0x7f800000u /* inf */);
        bool _794 = !_788;
        bool _796 = _792 && _794;
        if (_796)
        {
            bool _798 = as_type<int>(_674) >= 0;
            _740 = _798 ? (-1) : 0;
        }
        int _800 = _740;
        if (_796)
        {
            _664 = 1075235812;
        }
        int _802 = _664;
        int _804 = _802;
        if (_796)
        {
            int _806 = ~_800;
            int _808 = (_806 != 0) ? _802 : 1061752795;
            _804 = _808;
        }
        int _810 = _804;
        float _812 = abs(_674);
        bool _814 = _812 == as_type<float>(0x7f800000u /* inf */);
        if (_796)
        {
            int _816 = int(0x80000000) & as_type<int>(_670);
            int _818 = _810 | _816;
            _774 = as_type<float>(_818);
        }
        float _820 = _774;
        bool _822 = !_788;
        bool _824 = _822 && _814;
        _776 = _820;
        if (!_824)
        {
            float _826 = abs(_670);
            float _828 = abs(_674);
            float _830 = precise::max(_826, _828);
            float _832 = abs(_670);
            float _834 = abs(_674);
            float _836 = precise::min(_832, _834);
            float _838 = 1.0 / _830;
            float _840 = abs(_670);
            float _842 = abs(_674);
            bool _844 = _840 > _842;
            bool _846 = as_type<int>(_674) >= 0;
            float _848 = _836 * _838;
            float _850 = abs(_670);
            float _852 = abs(_674);
            float _854 = _850 + _852;
            int _856 = as_type<int>(_670) & int(0x80000000);
            float _858 = _848 * _848;
            bool _860 = _854 > as_type<float>(0x7f800000u /* inf */);
            bool _862 = isnan(_854);
            bool _864 = _860 || _862;
            bool _866 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _868 = _864 || _866;
            float _870 = _858 + 11.33538818359375;
            float _872 = fma(_858, _870, 28.84246826171875);
            float _874 = fma(_858, _872, 19.6966705322265625);
            float _876 = fma(_858, -0.82336294651031494140625, -5.674867153167724609375);
            float _878 = fma(_858, _876, -6.565555095672607421875);
            float _880 = 1.0 / _874;
            float _882 = _858 * _878;
            float _884 = _848 * _882;
            float _886 = fma(_884, _880, _848);
            float _888 = _886;
            _776 = _854;
            if (_844)
            {
                float _890 = -_886;
                float _892 = _890 + 1.57079637050628662109375;
                _888 = _892;
            }
            float _894 = _888;
            int _896 = as_type<int>(_894);
            if (!_846)
            {
                float _898 = -_894;
                float _900 = _898 + 3.1415927410125732421875;
                _896 = as_type<int>(_900);
            }
            int _902 = _896;
            if (!_868)
            {
                int _904 = _856 | _902;
                _776 = as_type<float>(_904);
            }
        }
    }
    float _906 = _776;
    float _908 = in.m_39.x;
    float _910 = in.m_39.y;
    float _912 = in.m_39.z;
    float _914 = _620 * 2.0;
    bool _916 = _656 > 0.0;
    float _918 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _920 = _656 >= 0.0;
    bool _922 = isnan(_656);
    bool _924 = _920 || _922;
    bool _926 = isnan(0.0);
    bool _928 = _924 || _926;
    float _930 = _570 * _712;
    float _932 = floor(_914);
    int _934 = _928 ? 0 : 1;
    float _936 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _918);
    float _938 = -_716;
    float _940 = _938 + 1.0;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _946 = ~_934;
    int _948 = _946 + 1;
    int _950 = _948 + 1;
    float _952 = _568 * _710;
    float _954 = _572 * _714;
    int _956 = _950;
    if (!_916)
    {
        int _958 = ~_934;
        int _960 = _958 + 1;
        _956 = _960;
    }
    int _962 = _956;
    float _964 = 1.0 / _944;
    bool _966 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _968 = isnan(0.0);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _974 = _970 || _972;
    float _976 = _614 * 2.0;
    bool _978 = _630 > 0.5;
    float _980 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _936);
    bool _982 = _932 > 0.0;
    float _984 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _908);
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _990 = _974 ? _940 : 0.0;
    float _992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _910);
    bool _994 = _932 >= 0.0;
    bool _996 = isnan(_932);
    bool _998 = _994 || _996;
    bool _1000 = isnan(0.0);
    bool _1002 = _998 || _1000;
    float _1004 = floor(_976);
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _912);
    int _1008 = _1002 ? 0 : 1;
    float _1010 = _952 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1012 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1014 = isnan(1.0);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1020 = _1016 || _1018;
    int _1022 = ~_1008;
    int _1024 = _1022 + 1;
    int _1026 = _1024 + 1;
    float _1028 = 1.0 / _988;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1032 = 1.0 + _1030;
    float _1034 = _984 * _1010;
    int _1036 = _1026;
    bool _1038 = _1020;
    bool _1040 = _978;
    if (!_982)
    {
        int _1042 = ~_1008;
        int _1044 = _1042 + 1;
        _1036 = _1044;
    }
    int _1046 = _1036;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1060;
    float _1064 = _1054 * _964;
    float _1066 = 1.0 / _1058;
    float _1068 = _614 + _608;
    float _1070 = _1062 * _1028;
    float _1072 = _614 + _620;
    float _1074 = _1068 + (-1.0);
    float _1076 = _1050 * _640;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    bool _1082 = _1004 >= 0.0;
    bool _1084 = isnan(_1004);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(0.0);
    bool _1090 = _1086 || _1088;
    float _1092 = _608 + _620;
    float _1094 = _1072 + (-1.0);
    float _1096 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1098 = _1090 ? 0 : 1;
    float _1100 = _1092 + (-1.0);
    bool _1102 = _1004 > 0.0;
    float _1104 = _954 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1106 = 1.0 / _1032;
    float _1108 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1110 = _930 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1112 = abs(_720);
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1116 = _602 + _1114;
    int _1118 = ~_1098;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = _992 * _1110;
    int _1126 = abs(_732);
    float _1128 = _1006 * _1104;
    int _1130 = abs(_728);
    float _1132 = _1080 * _1066;
    float _1134 = in.m_41.y;
    float _1136 = float(_1046);
    float _1138 = fma(_1076, _1116, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1140 = float(_1130);
    int _1142 = _1122;
    float _1144 = _1132;
    if (!_1102)
    {
        int _1146 = ~_1098;
        int _1148 = _1146 + 1;
        _1142 = _1148;
    }
    int _1150 = _1142;
    if (_1020)
    {
        float _1152 = _990 * _1106;
        _102 = _1152;
    }
    float _1154 = _102;
    float _1156 = float(_1126);
    float _1158 = _1140 * _1136;
    float _1160 = float(_962);
    float _1162 = in.m_41.x;
    if (_736)
    {
        bool _1164 = _614 > 0.5;
        _1038 = _1164;
    }
    bool _1166 = _1038;
    float _1168 = _1158 * (-2.0);
    float _1170 = _614 + (-0.5);
    float _1172 = _1156 * _1160;
    float _1174 = float(_1112);
    float _1176 = fma(_1096, _1168, _1096);
    float _1178 = float(_1150);
    float _1180 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1182 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1184 = _1172 * (-2.0);
    bool _1186 = _608 > 0.5;
    float _1188 = _1174 * _1178;
    float _1190 = -_1134;
    float _1192 = _1190 + 1.0;
    float _1194 = fma(_1176, _1154, _1180);
    float _1196 = fma(_1182, _1184, _1182);
    float _1198 = _1188 * (-2.0);
    float _1200 = _608 + (-0.5);
    int _1202 = _978 ? as_type<int>(_1192) : as_type<int>(_1134);
    float _1204 = _1194 * 0.15915493667125701904296875;
    float _1206 = _1134;
    if (_748)
    {
        bool _1208 = _620 > 0.5;
        _1040 = _1208;
    }
    bool _1210 = _1040;
    float _1212 = _620 + (-0.5);
    bool _1214 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1216 = isnan(_602);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = fma(_1108, _1198, _1108);
    float _1228 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1230 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _1232 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1234 = isnan(_602);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = -_1224;
    float _1246 = _1244 + 1.0;
    float _1248 = fma(_1226, _1154, _1228);
    float _1250 = fma(_1196, _1154, _1230);
    bool _1252 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1254 = isnan(_602);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1260 = _1256 || _1258;
    float _1262 = float(_1260);
    float _1264 = _1242 * _1246;
    bool _1266 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1268 = isnan(_602);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1274 = _1270 || _1272;
    float _1276 = float(_1274);
    float _1278 = -_1242;
    float _1280 = _1278 + 1.0;
    float _1282 = -_906;
    float _1284 = _1248 + _1282;
    float _1286 = -_1262;
    float _1288 = _1286 + 1.0;
    bool _1290 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1292 = isnan(_602);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = _1250 * 0.15915493667125701904296875;
    float _1304 = _1262 * _1280;
    float _1306 = _1276 * _1288;
    float _1308 = -_1276;
    float _1310 = _1308 + 1.0;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1314 = _602 + _1312;
    float _1316 = _1302 * 6.283185482025146484375;
    float _1318 = cos(_1316);
    float _1320 = _1284 * 0.15915493667125701904296875;
    float _1322 = _1300 * _1310;
    float _1324 = fma(_1064, _1314, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1326 = -_1300;
    float _1328 = _1326 + 1.0;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1332 = _602 + _1330;
    float _1334 = _1138 * _1322;
    float _1336 = _1310;
    float _1338 = _1332;
    int _1340 = as_type<int>(_1306);
    if (!_736)
    {
        _1336 = _1162;
    }
    float _1342 = _1336;
    float _1344 = _1204 * 6.283185482025146484375;
    float _1346 = sin(_1344);
    float _1348 = fma(_1070, _1332, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1350 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1334);
    float _1352 = _758 ? as_type<float>(_1202) : _1134;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1356 = _602 + _1354;
    float _1358 = _1342;
    if (_762)
    {
        float _1360 = _1186 ? _1192 : _1134;
        _1206 = _1360;
    }
    float _1362 = _1206;
    float _1364 = fma(_1324, _1306, _1350);
    if (!_736)
    {
        _1338 = _1342;
    }
    float _1366 = _1338;
    float _1368 = _1204 * 6.283185482025146484375;
    float _1370 = cos(_1368);
    float _1372 = _1366;
    if (_736)
    {
        _1358 = _1162;
    }
    float _1374 = _1358;
    float _1376 = fma(_1132, _1356, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1378 = fma(_1348, _1304, _1364);
    float _1380 = _1318 * _1124;
    if (!_748)
    {
        _1144 = _1374;
    }
    float _1382 = _1144;
    float _1384 = _1382;
    if (_736)
    {
        float _1386 = -_1374;
        float _1388 = _1386 + 1.0;
        _666 = as_type<int>(_1388);
    }
    int _1390 = _666;
    if (_748)
    {
        float _1392 = -_1374;
        float _1394 = _1392 + 1.0;
        _1340 = as_type<int>(_1394);
    }
    int _1396 = _1340;
    float _1398 = _1320 * 6.283185482025146484375;
    float _1400 = cos(_1398);
    float _1402 = fma(_1376, _1264, _1378);
    float _1404 = _1346 * _1380;
    if (_736)
    {
        float _1406 = _1166 ? as_type<float>(_1390) : _1374;
        _1372 = _1406;
    }
    float _1408 = _1372;
    float _1410 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_748)
    {
        float _1412 = _1210 ? as_type<float>(_1396) : _1374;
        _1384 = _1412;
    }
    float _1414 = _1384;
    float _1416 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1402);
    float _1418 = _1320 * 6.283185482025146484375;
    float _1420 = sin(_1418);
    float _1422 = _1370 * _1380;
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1426 = _1302 * 6.283185482025146484375;
    float _1428 = sin(_1426);
    float _1430 = _1346 * _1400;
    float _1432 = _1370 * _1400;
    float _1434 = _1400 * _1318;
    float _1436 = _1346 * _1420;
    float _1438 = _1370 * _1420;
    float _1440 = _1420 * _1318;
    float _1442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1444 = fma(_1428, _1432, _1436);
    float _1446 = _1428 * _1124;
    float _1448 = -_1438;
    float _1450 = fma(_1428, _1430, _1448);
    float _1452 = -_1430;
    float _1454 = fma(_1428, _1438, _1452);
    float _1456 = fma(_1444, _1034, _1422);
    float _1458 = -_1446;
    float _1460 = fma(_1434, _1034, _1458);
    float _1462 = fma(_1450, _1034, _1404);
    float _1464 = _980 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1466 = fma(_1454, _1128, _1456);
    float _1468 = fma(_1428, _1436, _1432);
    float _1470 = fma(_1440, _1128, _1460);
    float _1472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1474 = _1466 + _1464;
    float _1476 = fma(_1468, _1128, _1462);
    float _1478 = _622 + _1470;
    float _1480 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1482 = _624 + _1476;
    float _1484 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1486 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1488 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1480);
    float _1490 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1492 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1484);
    float _1494 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1486);
    float _1496 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1488);
    float _1498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1500 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1492);
    float _1502 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1490);
    float _1504 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1506 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1494);
    float _1508 = _1500 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1510 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1502);
    float _1512 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1514 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1516 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1518 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1520 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1512);
    float _1522 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1526 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1516);
    float _1528 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1520);
    float _1530 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1532 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1518);
    float _1534 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1522);
    float _1536 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1538 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1526);
    float _1540 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1542 = _1530 * _1472;
    float _1544 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1532);
    float _1546 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1534);
    float _1548 = _1410 * _1498;
    float _1550 = _1536 * _1442;
    float _1552 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1554 = _1540 * _1524;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1566 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1538);
    float _1568 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1572 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1574 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1576 = _1560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1578 = _1562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1580 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1582 = _1568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1584 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1528);
    float _1586 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1544);
    float _1588 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1546);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_43.x = _1572;
    out.m_43.y = _1574;
    out.m_43.z = _1576;
    out.m_43.w = _1570;
    out.m_45.x = _1550;
    out.m_45.y = _1548;
    out.m_45.z = _1554;
    out.m_45.w = _1542;
    out.m_47.x = _1578;
    out.m_47.y = _1580;
    out.m_47.z = _1582;
    out.m_47.w = _1424;
    out.gl_Position.x = _1584;
    out.gl_Position.y = _1566;
    out.gl_Position.z = _1586;
    out.gl_Position.w = _1588;
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
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _594 = false;
    bool _264 = false;
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
        float _1645 = as_type<float>(_82);
        out.gl_Position.z = _1645;
    }
    if (!_70)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _86 = in.m_31.w;
    bool _88 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _90 = isnan(_86);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _96 = _92 || _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _102 = _100;
    if (_96)
    {
        float _104 = float(_66);
        _76 = _104;
    }
    float _106 = _76;
    bool _108 = _100 >= _106;
    bool _110 = !_96;
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
        _84 = as_type<int>(_118);
    }
    int _120 = _84;
    if (_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1715 = as_type<float>(_120);
        out.gl_Position.z = _1715;
    }
    if (_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_33.w;
    float _124 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _148 = 0.0;
    float _150 = _124;
    if (!_134)
    {
        float _152 = _124 * _124;
        float _154 = _152 * 0.5;
        _148 = _154;
    }
    float _156 = _148;
    float _158 = _156;
    if (!_134)
    {
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = !_134;
    float _166 = _162;
    if (!_164)
    {
        float _168 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _170 = log2(_168);
        float _172 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _174 = _172 + 1.0;
        float _176 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = _124 * _170;
        float _180 = 1.0 / _174;
        float _182 = _176 * 0.693147182464599609375;
        float _184 = exp2(_178);
        float _186 = 1.0 / _182;
        float _188 = _184 + (-1.0);
        float _190 = -_188;
        float _192 = fma(_190, _186, _124);
        float _194 = _192 * _180;
        float _196 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _196;
    }
    float _198 = _166;
    bool _200 = !_134;
    if (!_200)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = 1.0 / _208;
        float _212 = _124 * _204;
        float _214 = exp2(_212);
        float _216 = -_214;
        float _218 = _216 + 1.0;
        float _220 = _218 * _210;
        _150 = _220;
    }
    float _222 = _150;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _226 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _228 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _230 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _232 = fma(_222, _136, _226);
    float _234 = fma(_222, _138, _228);
    float _236 = fma(_222, _140, _230);
    float _238 = fma(_232, _122, _142);
    float _240 = fma(_234, _122, _144);
    float _242 = fma(_236, _122, _146);
    bool _244 = !_224;
    float _262;
    if (!_244)
    {
        float _246 = in.m_35.x;
        float _248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _250 = _246 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _252 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _254 = _252 * _248;
        float _256 = floor(_254);
        float _258 = -_256;
        float _260 = _254 + _258;
        _262 = _260;
        _264 = true;
    }
    else
    {
        float _266 = float(_66);
        float _268 = 1.0 / _266;
        float _270 = _100 * _268;
        _262 = _270;
    }
    _264 = false;
    float _272 = _262;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _272 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _294 = 1.0 / _280;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _296;
    float _300 = 1.0 / _288;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _272 + _302;
    bool _306 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _308 = isnan(_272);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -_316;
    float _320 = _318 + 1.0;
    float _322 = 1.0 / _284;
    float _324 = _304 * _294;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _328 = _272 + _326;
    bool _330 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _332 = isnan(_272);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _342;
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _348 = 1.0 / _292;
    float _350 = _328 * _300;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _354 = _272 + _352;
    bool _356 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _358 = isnan(_272);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = fma(_344, _324, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _370 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _372 = isnan(_272);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = 1.0 / _298;
    float _384 = _276 * _322;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _388 = _272 + _386;
    bool _390 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _392 = isnan(_272);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = _380 * _320;
    float _404 = -_380;
    float _406 = _404 + 1.0;
    float _408 = _354 * _348;
    float _410 = -_366;
    float _412 = _410 + 1.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _414;
    float _418 = _340 * _412;
    float _420 = -_340;
    float _422 = _420 + 1.0;
    float _424 = fma(_416, _324, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _426 = _388 * _382;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _428;
    float _432 = _400 * _422;
    float _434 = -_400;
    float _436 = _434 + 1.0;
    float _438 = fma(_430, _324, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _440 = _272 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _442 = isnan(_272);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = _316 * _436;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _462 = _450 * _406;
    float _464 = -_450;
    float _466 = _464 + 1.0;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _472 = fma(_460, _384, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _474 = _438 * _462;
    float _476 = _424 * _462;
    float _478 = _368 * _462;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].x, _474);
    float _494 = fma(_456, _384, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _496 = fma(_470, _384, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _498 = fma(_482, _350, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _500 = fma(_486, _350, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _502 = fma(_490, _350, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _504 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].y, _476);
    float _506 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[143].z, _478);
    float _508 = fma(_472, _402, _492);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _518 = fma(_496, _402, _506);
    float _520 = fma(_498, _452, _508);
    float _522 = fma(_512, _408, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _528 = fma(_494, _402, _504);
    float _530 = fma(_502, _452, _518);
    float _532 = fma(_516, _408, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _538;
    float _542 = fma(_526, _408, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _544 = fma(_500, _452, _528);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _546;
    float _550 = fma(_522, _432, _520);
    float _552 = fma(_536, _426, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _554 = fma(_540, _426, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _556 = fma(_548, _426, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _558 = fma(_532, _432, _544);
    float _560 = fma(_542, _432, _530);
    float _562 = fma(_552, _418, _550);
    float _564 = fma(_554, _418, _558);
    float _566 = fma(_556, _418, _560);
    float _568 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[148].x, _562);
    float _570 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[148].y, _564);
    float _572 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[148].z, _566);
    bool _574 = !_346;
    float _592;
    if (!_574)
    {
        float _576 = in.m_35.x;
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _580 = _576 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _584 = _582 * _578;
        float _586 = floor(_584);
        float _588 = -_586;
        float _590 = _584 + _588;
        _592 = _590;
        _594 = true;
    }
    else
    {
        float _596 = float(_66);
        float _598 = 1.0 / _596;
        float _600 = _100 * _598;
        _592 = _600;
    }
    _594 = false;
    float _602 = _592;
    float _604 = _240 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _606 = _240 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _608 = in.m_35.y;
    float _610 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].x, _604);
    float _612 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].x, _606);
    float _614 = in.m_35.x;
    float _616 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].z, _610);
    float _618 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].z, _612);
    float _620 = in.m_35.z;
    float _622 = _616 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _624 = _618 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _630 = in.m_35.w;
    float _632 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _634 = _622 + _632;
    float _636 = -_624;
    float _638 = _636 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _640 = 1.0 / _628;
    float _642 = abs(_634);
    float _644 = abs(_638);
    float _646 = precise::max(_642, _644);
    out.m_37.x = 1.0;
    out.m_37.y = 1.0;
    out.m_37.z = 1.0;
    bool _648 = _646 >= 16.0;
    float _650 = _608 * 2.0;
    float _652 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _654 = log2(_652);
    float _656 = floor(_650);
    float _658 = _634;
    float _660 = _638;
    float _662 = 1.0;
    int _664 = as_type<int>(_650);
    int _666 = as_type<int>(_602);
    if (_648)
    {
        float _668 = _634 * 0.0625;
        _658 = _668;
    }
    float _670 = _658;
    if (_648)
    {
        float _672 = _638 * 0.0625;
        _660 = _672;
    }
    float _674 = _660;
    float _676 = abs(_670);
    bool _678 = _676 != 0.0;
    bool _680 = isnan(_676);
    bool _682 = _678 || _680;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    float _688 = _654 * _100;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _692 = _690 != 0;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _696 = _694 != 0;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _700 = _698 != 0;
    float _702 = abs(_674);
    bool _704 = _702 == 0.0;
    bool _706 = !_686;
    bool _708 = _704 && _706;
    float _710 = in.m_33.x;
    float _712 = in.m_33.y;
    float _714 = in.m_33.z;
    float _716 = exp2(_688);
    bool _718 = !_696;
    int _720 = _718 ? 0 : 1;
    float _722 = abs(_674);
    bool _724 = _722 == 0.0;
    bool _726 = !_692;
    int _728 = _726 ? 0 : 1;
    bool _730 = !_700;
    int _732 = _730 ? 0 : 1;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _736 = _734 != 0;
    bool _738 = _692;
    int _740 = _724 ? (-1) : 0;
    if (_708)
    {
        bool _742 = as_type<int>(_674) >= 0;
        _738 = _742;
    }
    bool _744 = _738;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _748 = _746 != 0;
    int _750 = 0;
    if (_708)
    {
        int _752 = _744 ? 0 : 1078530011;
        _750 = _752;
    }
    int _754 = _750;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _758 = _756 != 0;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _762 = _760 != 0;
    if (_708)
    {
        int _764 = int(0x80000000) & as_type<int>(_670);
        int _766 = _754 | _764;
        _662 = as_type<float>(_766);
    }
    float _768 = _662;
    bool _770 = !_686;
    bool _772 = _770 && _724;
    float _774 = _768;
    float _776 = _768;
    if (!_772)
    {
        float _778 = abs(_670);
        bool _780 = _778 != as_type<float>(0x7f800000u /* inf */);
        bool _782 = isnan(_778);
        bool _784 = _780 || _782;
        bool _786 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _788 = _784 || _786;
        float _790 = abs(_674);
        bool _792 = _790 == as_type<float>(0x7f800000u /* inf */);
        bool _794 = !_788;
        bool _796 = _792 && _794;
        if (_796)
        {
            bool _798 = as_type<int>(_674) >= 0;
            _740 = _798 ? (-1) : 0;
        }
        int _800 = _740;
        if (_796)
        {
            _664 = 1075235812;
        }
        int _802 = _664;
        int _804 = _802;
        if (_796)
        {
            int _806 = ~_800;
            int _808 = (_806 != 0) ? _802 : 1061752795;
            _804 = _808;
        }
        int _810 = _804;
        float _812 = abs(_674);
        bool _814 = _812 == as_type<float>(0x7f800000u /* inf */);
        if (_796)
        {
            int _816 = int(0x80000000) & as_type<int>(_670);
            int _818 = _810 | _816;
            _774 = as_type<float>(_818);
        }
        float _820 = _774;
        bool _822 = !_788;
        bool _824 = _822 && _814;
        _776 = _820;
        if (!_824)
        {
            float _826 = abs(_670);
            float _828 = abs(_674);
            float _830 = precise::max(_826, _828);
            float _832 = abs(_670);
            float _834 = abs(_674);
            float _836 = precise::min(_832, _834);
            float _838 = 1.0 / _830;
            float _840 = abs(_670);
            float _842 = abs(_674);
            bool _844 = _840 > _842;
            bool _846 = as_type<int>(_674) >= 0;
            float _848 = _836 * _838;
            float _850 = abs(_670);
            float _852 = abs(_674);
            float _854 = _850 + _852;
            int _856 = as_type<int>(_670) & int(0x80000000);
            float _858 = _848 * _848;
            bool _860 = _854 > as_type<float>(0x7f800000u /* inf */);
            bool _862 = isnan(_854);
            bool _864 = _860 || _862;
            bool _866 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _868 = _864 || _866;
            float _870 = _858 + 11.33538818359375;
            float _872 = fma(_858, _870, 28.84246826171875);
            float _874 = fma(_858, _872, 19.6966705322265625);
            float _876 = fma(_858, -0.82336294651031494140625, -5.674867153167724609375);
            float _878 = fma(_858, _876, -6.565555095672607421875);
            float _880 = 1.0 / _874;
            float _882 = _858 * _878;
            float _884 = _848 * _882;
            float _886 = fma(_884, _880, _848);
            float _888 = _886;
            _776 = _854;
            if (_844)
            {
                float _890 = -_886;
                float _892 = _890 + 1.57079637050628662109375;
                _888 = _892;
            }
            float _894 = _888;
            int _896 = as_type<int>(_894);
            if (!_846)
            {
                float _898 = -_894;
                float _900 = _898 + 3.1415927410125732421875;
                _896 = as_type<int>(_900);
            }
            int _902 = _896;
            if (!_868)
            {
                int _904 = _856 | _902;
                _776 = as_type<float>(_904);
            }
        }
    }
    float _906 = _776;
    float _908 = in.m_39.x;
    float _910 = in.m_39.y;
    float _912 = in.m_39.z;
    float _914 = _620 * 2.0;
    bool _916 = _656 > 0.0;
    float _918 = _240 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _920 = _656 >= 0.0;
    bool _922 = isnan(_656);
    bool _924 = _920 || _922;
    bool _926 = isnan(0.0);
    bool _928 = _924 || _926;
    float _930 = _570 * _712;
    float _932 = floor(_914);
    int _934 = _928 ? 0 : 1;
    float _936 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].x, _918);
    float _938 = -_716;
    float _940 = _938 + 1.0;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _946 = ~_934;
    int _948 = _946 + 1;
    int _950 = _948 + 1;
    float _952 = _568 * _710;
    float _954 = _572 * _714;
    int _956 = _950;
    if (!_916)
    {
        int _958 = ~_934;
        int _960 = _958 + 1;
        _956 = _960;
    }
    int _962 = _956;
    float _964 = 1.0 / _944;
    bool _966 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _968 = isnan(0.0);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _974 = _970 || _972;
    float _976 = _614 * 2.0;
    bool _978 = _630 > 0.5;
    float _980 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].z, _936);
    bool _982 = _932 > 0.0;
    float _984 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _908);
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _990 = _974 ? _940 : 0.0;
    float _992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _910);
    bool _994 = _932 >= 0.0;
    bool _996 = isnan(_932);
    bool _998 = _994 || _996;
    bool _1000 = isnan(0.0);
    bool _1002 = _998 || _1000;
    float _1004 = floor(_976);
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _912);
    int _1008 = _1002 ? 0 : 1;
    float _1010 = _952 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1012 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1014 = isnan(1.0);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1020 = _1016 || _1018;
    int _1022 = ~_1008;
    int _1024 = _1022 + 1;
    int _1026 = _1024 + 1;
    float _1028 = 1.0 / _988;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1032 = 1.0 + _1030;
    float _1034 = _984 * _1010;
    int _1036 = _1026;
    bool _1038 = _1020;
    bool _1040 = _978;
    if (!_982)
    {
        int _1042 = ~_1008;
        int _1044 = _1042 + 1;
        _1036 = _1044;
    }
    int _1046 = _1036;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1060;
    float _1064 = _1054 * _964;
    float _1066 = 1.0 / _1058;
    float _1068 = _614 + _608;
    float _1070 = _1062 * _1028;
    float _1072 = _614 + _620;
    float _1074 = _1068 + (-1.0);
    float _1076 = _1050 * _640;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    bool _1082 = _1004 >= 0.0;
    bool _1084 = isnan(_1004);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(0.0);
    bool _1090 = _1086 || _1088;
    float _1092 = _608 + _620;
    float _1094 = _1072 + (-1.0);
    float _1096 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1098 = _1090 ? 0 : 1;
    float _1100 = _1092 + (-1.0);
    bool _1102 = _1004 > 0.0;
    float _1104 = _954 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1106 = 1.0 / _1032;
    float _1108 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1110 = _930 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1112 = abs(_720);
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1116 = _602 + _1114;
    int _1118 = ~_1098;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = _992 * _1110;
    int _1126 = abs(_732);
    float _1128 = _1006 * _1104;
    int _1130 = abs(_728);
    float _1132 = _1080 * _1066;
    float _1134 = in.m_41.y;
    float _1136 = float(_1046);
    float _1138 = fma(_1076, _1116, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1140 = float(_1130);
    int _1142 = _1122;
    float _1144 = _1132;
    if (!_1102)
    {
        int _1146 = ~_1098;
        int _1148 = _1146 + 1;
        _1142 = _1148;
    }
    int _1150 = _1142;
    if (_1020)
    {
        float _1152 = _990 * _1106;
        _102 = _1152;
    }
    float _1154 = _102;
    float _1156 = float(_1126);
    float _1158 = _1140 * _1136;
    float _1160 = float(_962);
    float _1162 = in.m_41.x;
    if (_736)
    {
        bool _1164 = _614 > 0.5;
        _1038 = _1164;
    }
    bool _1166 = _1038;
    float _1168 = _1158 * (-2.0);
    float _1170 = _614 + (-0.5);
    float _1172 = _1156 * _1160;
    float _1174 = float(_1112);
    float _1176 = fma(_1096, _1168, _1096);
    float _1178 = float(_1150);
    float _1180 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1182 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1184 = _1172 * (-2.0);
    bool _1186 = _608 > 0.5;
    float _1188 = _1174 * _1178;
    float _1190 = -_1134;
    float _1192 = _1190 + 1.0;
    float _1194 = fma(_1176, _1154, _1180);
    float _1196 = fma(_1182, _1184, _1182);
    float _1198 = _1188 * (-2.0);
    float _1200 = _608 + (-0.5);
    int _1202 = _978 ? as_type<int>(_1192) : as_type<int>(_1134);
    float _1204 = _1194 * 0.15915493667125701904296875;
    float _1206 = _1134;
    if (_748)
    {
        bool _1208 = _620 > 0.5;
        _1040 = _1208;
    }
    bool _1210 = _1040;
    float _1212 = _620 + (-0.5);
    bool _1214 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1216 = isnan(_602);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = fma(_1108, _1198, _1108);
    float _1228 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1230 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    bool _1232 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1234 = isnan(_602);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = -_1224;
    float _1246 = _1244 + 1.0;
    float _1248 = fma(_1226, _1154, _1228);
    float _1250 = fma(_1196, _1154, _1230);
    bool _1252 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1254 = isnan(_602);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1260 = _1256 || _1258;
    float _1262 = float(_1260);
    float _1264 = _1242 * _1246;
    bool _1266 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1268 = isnan(_602);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1274 = _1270 || _1272;
    float _1276 = float(_1274);
    float _1278 = -_1242;
    float _1280 = _1278 + 1.0;
    float _1282 = -_906;
    float _1284 = _1248 + _1282;
    float _1286 = -_1262;
    float _1288 = _1286 + 1.0;
    bool _1290 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1292 = isnan(_602);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = _1250 * 0.15915493667125701904296875;
    float _1304 = _1262 * _1280;
    float _1306 = _1276 * _1288;
    float _1308 = -_1276;
    float _1310 = _1308 + 1.0;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1314 = _602 + _1312;
    float _1316 = _1302 * 6.283185482025146484375;
    float _1318 = cos(_1316);
    float _1320 = _1284 * 0.15915493667125701904296875;
    float _1322 = _1300 * _1310;
    float _1324 = fma(_1064, _1314, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1326 = -_1300;
    float _1328 = _1326 + 1.0;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1332 = _602 + _1330;
    float _1334 = _1138 * _1322;
    float _1336 = _1310;
    float _1338 = _1332;
    int _1340 = as_type<int>(_1306);
    if (!_736)
    {
        _1336 = _1162;
    }
    float _1342 = _1336;
    float _1344 = _1204 * 6.283185482025146484375;
    float _1346 = sin(_1344);
    float _1348 = fma(_1070, _1332, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1350 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1334);
    float _1352 = _758 ? as_type<float>(_1202) : _1134;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1356 = _602 + _1354;
    float _1358 = _1342;
    if (_762)
    {
        float _1360 = _1186 ? _1192 : _1134;
        _1206 = _1360;
    }
    float _1362 = _1206;
    float _1364 = fma(_1324, _1306, _1350);
    if (!_736)
    {
        _1338 = _1342;
    }
    float _1366 = _1338;
    float _1368 = _1204 * 6.283185482025146484375;
    float _1370 = cos(_1368);
    float _1372 = _1366;
    if (_736)
    {
        _1358 = _1162;
    }
    float _1374 = _1358;
    float _1376 = fma(_1132, _1356, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1378 = fma(_1348, _1304, _1364);
    float _1380 = _1318 * _1124;
    if (!_748)
    {
        _1144 = _1374;
    }
    float _1382 = _1144;
    float _1384 = _1382;
    if (_736)
    {
        float _1386 = -_1374;
        float _1388 = _1386 + 1.0;
        _666 = as_type<int>(_1388);
    }
    int _1390 = _666;
    if (_748)
    {
        float _1392 = -_1374;
        float _1394 = _1392 + 1.0;
        _1340 = as_type<int>(_1394);
    }
    int _1396 = _1340;
    float _1398 = _1320 * 6.283185482025146484375;
    float _1400 = cos(_1398);
    float _1402 = fma(_1376, _1264, _1378);
    float _1404 = _1346 * _1380;
    if (_736)
    {
        float _1406 = _1166 ? as_type<float>(_1390) : _1374;
        _1372 = _1406;
    }
    float _1408 = _1372;
    float _1410 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_748)
    {
        float _1412 = _1210 ? as_type<float>(_1396) : _1374;
        _1384 = _1412;
    }
    float _1414 = _1384;
    float _1416 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1402);
    float _1418 = _1320 * 6.283185482025146484375;
    float _1420 = sin(_1418);
    float _1422 = _1370 * _1380;
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1426 = _1302 * 6.283185482025146484375;
    float _1428 = sin(_1426);
    float _1430 = _1346 * _1400;
    float _1432 = _1370 * _1400;
    float _1434 = _1400 * _1318;
    float _1436 = _1346 * _1420;
    float _1438 = _1370 * _1420;
    float _1440 = _1420 * _1318;
    float _1442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1444 = fma(_1428, _1432, _1436);
    float _1446 = _1428 * _1124;
    float _1448 = -_1438;
    float _1450 = fma(_1428, _1430, _1448);
    float _1452 = -_1430;
    float _1454 = fma(_1428, _1438, _1452);
    float _1456 = fma(_1444, _1034, _1422);
    float _1458 = -_1446;
    float _1460 = fma(_1434, _1034, _1458);
    float _1462 = fma(_1450, _1034, _1404);
    float _1464 = _980 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1466 = fma(_1454, _1128, _1456);
    float _1468 = fma(_1428, _1436, _1432);
    float _1470 = fma(_1440, _1128, _1460);
    float _1472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1474 = _1466 + _1464;
    float _1476 = fma(_1468, _1128, _1462);
    float _1478 = _622 + _1470;
    float _1480 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1482 = _624 + _1476;
    float _1484 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1486 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1488 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1480);
    float _1490 = _1474 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1492 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1484);
    float _1494 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1486);
    float _1496 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1488);
    float _1498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1500 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1492);
    float _1502 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1490);
    float _1504 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1506 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1494);
    float _1508 = _1500 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1510 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1502);
    float _1512 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1514 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1516 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1518 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1520 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1512);
    float _1522 = _1504 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1526 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1516);
    float _1528 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1520);
    float _1530 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1532 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1518);
    float _1534 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1522);
    float _1536 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1538 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1526);
    float _1540 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1542 = _1530 * _1472;
    float _1544 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1532);
    float _1546 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1534);
    float _1548 = _1410 * _1498;
    float _1550 = _1536 * _1442;
    float _1552 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1554 = _1540 * _1524;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1566 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1538);
    float _1568 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1572 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1574 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1576 = _1560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1578 = _1562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1580 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1582 = _1568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1584 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1528);
    float _1586 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1544);
    float _1588 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1546);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_43.x = _1572;
    out.m_43.y = _1574;
    out.m_43.z = _1576;
    out.m_43.w = _1570;
    out.m_45.x = _1550;
    out.m_45.y = _1548;
    out.m_45.z = _1554;
    out.m_45.w = _1542;
    out.m_47.x = _1578;
    out.m_47.y = _1580;
    out.m_47.z = _1582;
    out.m_47.w = _1424;
    out.gl_Position.x = _1584;
    out.gl_Position.y = _1566;
    out.gl_Position.z = _1586;
    out.gl_Position.w = _1588;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

