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
    float4 m_47 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_49 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_39 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_43 [[attribute(7)]];
    float4 m_41 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _732 = false;
    bool _390 = false;
    bool _276 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_30.w;
    float _73 = trunc(_71);
    int _76 = int(_73);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    float _84 = as_type<float>(_76);
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _82;
    float _88 = _86;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _90 = 0;
    if (!_80)
    {
        float _92 = _86 * 5.0;
        _90 = as_type<int>(_92);
    }
    int _94 = _90;
    int _96 = _94;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2025 = as_type<float>(_94);
        out.gl_Position.z = _2025;
    }
    if (!_80)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _98 = in.m_35.w;
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
        float _116 = float(_76);
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
        out.m_33.x = 0.0;
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
        float _2095 = as_type<float>(_132);
        out.gl_Position.z = _2095;
    }
    if (_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_37.w;
    float _136 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    float _148 = in.m_35.x;
    float _150 = in.m_35.y;
    float _152 = in.m_35.z;
    float _154 = in.m_30.x;
    float _156 = in.m_30.y;
    float _158 = in.m_30.z;
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
        float _258 = in.m_39.x;
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
        float _278 = float(_76);
        float _280 = 1.0 / _278;
        float _282 = _112 * _280;
        _274 = _282;
    }
    _276 = false;
    float _284 = _274;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = _284 + _286;
    bool _290 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _292 = isnan(_284);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    bool _306 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _308 = isnan(_284);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -_300;
    float _320 = _318 + 1.0;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _322;
    float _326 = 1.0 / _304;
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _330 = _316 * _320;
    float _332 = -_316;
    float _334 = _332 + 1.0;
    float _336 = _288 * _326;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _338;
    float _342 = fma(_324, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _344;
    float _348 = fma(_340, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _350 = fma(_346, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _352 = _342 * _330;
    float _354 = _350 * _330;
    float _356 = _348 * _330;
    float _358 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].x, _352);
    float _360 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].y, _354);
    float _362 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].z, _356);
    float _364 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[144].x, _358);
    float _366 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[144].y, _360);
    float _368 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[144].z, _362);
    bool _370 = !_328;
    float _388;
    if (!_370)
    {
        float _372 = in.m_39.x;
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _376 = _372 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _378 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[11].x, _112);
        float _380 = _378 * _374;
        float _382 = floor(_380);
        float _384 = -_382;
        float _386 = _380 + _384;
        _388 = _386;
        _390 = true;
    }
    else
    {
        float _392 = float(_76);
        float _394 = 1.0 / _392;
        float _396 = _112 * _394;
        _388 = _396;
    }
    _390 = false;
    float _398 = _388;
    float _400 = in.m_37.x;
    float _402 = in.m_37.y;
    float _404 = in.m_37.z;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _408 = _398 + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _418;
    float _422 = 1.0 / _412;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _432 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _434 = isnan(_398);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = 1.0 / _416;
    bool _446 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _448 = _368 * _404;
    float _450 = _366 * _402;
    float _452 = 1.0 / _426;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _456 = _398 + _454;
    float _458 = _408 * _422;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _462 = _398 + _460;
    bool _464 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _466 = isnan(_398);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _478 = _398 + _476;
    float _480 = 1.0 / _420;
    float _482 = _456 * _444;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _486 = _398 + _484;
    bool _488 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _490 = isnan(_398);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _500;
    bool _504 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _506 = isnan(_398);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = 1.0 / _430;
    float _518 = _462 * _452;
    float _520 = -_498;
    float _522 = _520 + 1.0;
    bool _524 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _526 = isnan(_398);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = fma(_502, _458, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _538 = _442 * _522;
    float _540 = -_442;
    float _542 = _540 + 1.0;
    float _544 = _486 * _480;
    float _546 = -_474;
    float _548 = _546 + 1.0;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _550;
    float _554 = _514 * _548;
    float _556 = -_514;
    float _558 = _556 + 1.0;
    float _560 = fma(_552, _458, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _562 = _478 * _516;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _564;
    float _568 = _534 * _558;
    float _570 = -_534;
    float _572 = _570 + 1.0;
    float _574 = fma(_566, _458, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _576 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _578 = isnan(_398);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = _498 * _572;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _602 = _586 * _542;
    float _604 = -_586;
    float _606 = _604 + 1.0;
    float _608 = fma(_596, _482, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _610 = fma(_592, _482, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _612 = _536 * _602;
    float _614 = _574 * _602;
    float _616 = _560 * _602;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _622;
    float _626 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[107].x, _612);
    float _628 = fma(_600, _482, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _630 = fma(_620, _518, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _632 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[107].y, _614);
    float _634 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[107].z, _616);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _648;
    float _652 = fma(_624, _518, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _654 = fma(_608, _538, _626);
    float _656 = fma(_638, _562, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _658 = fma(_642, _562, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _660 = fma(_646, _562, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _662 = fma(_650, _518, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _664 = fma(_610, _538, _632);
    float _666 = fma(_628, _538, _634);
    float _668 = fma(_652, _588, _654);
    float _670 = fma(_630, _588, _664);
    float _672 = fma(_662, _588, _666);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _674;
    float _678 = fma(_656, _568, _668);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _680;
    float _684 = fma(_658, _568, _670);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _686;
    float _690 = fma(_676, _544, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _692 = fma(_682, _544, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _694 = fma(_660, _568, _672);
    float _696 = fma(_688, _544, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _698 = fma(_690, _554, _678);
    float _700 = fma(_692, _554, _684);
    float _702 = _364 * _400;
    float _704 = fma(_696, _554, _694);
    float _706 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[112].x, _698);
    float _708 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[112].y, _700);
    float _710 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[112].z, _704);
    bool _712 = !_446;
    float _730;
    if (!_712)
    {
        float _714 = in.m_39.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[11].y, _112);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        float _734 = float(_76);
        float _736 = 1.0 / _734;
        float _738 = _112 * _736;
        _730 = _738;
        _84 = _734;
    }
    _732 = false;
    float _740 = _730;
    float _742 = _84;
    float _744 = in.m_39.w;
    float _746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _748 = in.m_41.x;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _752 = _750 != 0;
    float _754 = _706 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _756 = in.m_39.y;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _762 = _760 != 0;
    float _764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _766 = in.m_43.x;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _770 = _768 != 0;
    float _772 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _776 = _774 != 0;
    float _778 = in.m_43.y;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _782 = _780 != 0;
    float _784 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _772);
    float _786 = in.m_39.x;
    float _788 = in.m_41.y;
    bool _790 = _744 > 0.5;
    float _792 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _794 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _796 = in.m_41.w;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _802 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _792);
    float _804 = in.m_41.z;
    float _806 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _794);
    out.m_45.x = _748;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    float _814 = _742;
    if (_752)
    {
        float _816 = -_766;
        float _818 = _816 + 1.0;
        _812 = as_type<int>(_818);
    }
    int _820 = _812;
    if (!_752)
    {
        _814 = _766;
    }
    float _822 = _814;
    float _824 = -_778;
    float _826 = _824 + 1.0;
    float _828 = 1.0 / _810;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _832 = _756 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _834 = false;
    float _836 = _822;
    float _838 = _778;
    if (_752)
    {
        bool _840 = _786 > 0.5;
        _834 = _840;
    }
    bool _842 = _834;
    float _844 = _786 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _846 = _790 ? as_type<int>(_826) : as_type<int>(_778);
    float _848 = fma(_832, -2.0, _758);
    if (_752)
    {
        float _850 = _842 ? as_type<float>(_820) : _766;
        _836 = _850;
    }
    float _852 = _836;
    float _854 = in.m_39.z;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _858 = _856 != 0;
    int _860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _862 = _860 != 0;
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _866 = _864 != 0;
    float _868 = -_830;
    float _870 = fma(_844, 2.0, _868);
    out.m_45.y = _788;
    float _872 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _848);
    out.m_45.w = _796;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    out.m_45.z = _804;
    float _882 = 1.0 / _876;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _888 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _890 = isnan(_740);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _900;
    float _904 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = 1.0 / _880;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _912 = _886 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _914 = _902 * _828;
    float _916 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _784);
    float _918 = _776 ? as_type<float>(_846) : _778;
    float _920 = _854 * 2.0;
    bool _922 = _756 > 0.5;
    float _924 = 1.0 / _910;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _928 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _802);
    float _930 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _806);
    bool _932 = _782;
    float _934 = _912;
    if (_782)
    {
        float _936 = _922 ? _826 : _778;
        _838 = _936;
    }
    float _938 = _838;
    float _940 = _786 * 2.0;
    float _942 = _926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_762)
    {
        bool _944 = _854 > 0.5;
        _932 = _944;
    }
    bool _946 = _932;
    float _948 = 1.0 / _800;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _954;
    out.m_47.x = _904;
    out.m_47.y = _942;
    out.m_47.z = _912;
    float _958 = _916 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _960 = _956 * _882;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _962;
    float _966 = floor(_920);
    float _968 = _756 * 2.0;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _972 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _974 = isnan(_740);
    bool _976 = _972 || _974;
    bool _978 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _980 = _976 || _978;
    float _982 = float(_980);
    float _984 = -_112;
    float _986 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[76].x, _870);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _992 = floor(_940);
    float _994 = _952 * _906;
    float _996 = _964 * _948;
    int _998 = as_type<int>(_906);
    float _1000 = _952;
    if (_762)
    {
        float _1002 = -_766;
        float _1004 = _1002 + 1.0;
        _998 = as_type<int>(_1004);
    }
    int _1006 = _998;
    float _1008 = _990 * _924;
    float _1010 = _786 + _756;
    float _1012 = as_type<float>(_1006);
    if (!_762)
    {
        _934 = _766;
    }
    float _1014 = _934;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1018 = _740 + _1016;
    float _1020 = floor(_968);
    float _1022 = _1014;
    if (_762)
    {
        float _1024 = _946 ? as_type<float>(_1006) : _766;
        _1022 = _1024;
    }
    float _1026 = _1022;
    float _1028 = _1010 + (-1.0);
    bool _1030 = _966 > 0.0;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1034 = _966 >= 0.0;
    bool _1036 = isnan(_966);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan(0.0);
    bool _1042 = _1038 || _1040;
    float _1044 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1046 = _966;
    if (!_770)
    {
        _1000 = _756;
    }
    float _1048 = _1000;
    float _1050 = _1048;
    if (!_770)
    {
        _1046 = _854;
    }
    float _1052 = _1046;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1056 = _740 + _1054;
    float _1058 = _1052;
    if (!_770)
    {
        _1012 = _854;
    }
    float _1060 = _1012;
    float _1062 = _1060;
    if (_770)
    {
        _1050 = _786;
    }
    float _1064 = _1050;
    float _1066 = fma(_914, _1056, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    if (_770)
    {
        _1058 = _756;
    }
    float _1068 = _1058;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1072 = _740 + _1070;
    if (_770)
    {
        _1062 = _756;
    }
    float _1074 = _1062;
    bool _1076 = _992 > 0.0;
    float _1078 = fma(_960, _1072, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1080 = _992 >= 0.0;
    bool _1082 = isnan(_992);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan(0.0);
    bool _1088 = _1084 || _1086;
    float _1090 = fma(_994, _1018, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1092 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1094 = isnan(_740);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1100 = _1096 || _1098;
    float _1102 = float(_1100);
    float _1104 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1106 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1108 = isnan(_740);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    int _1118 = _1042 ? 0 : 1;
    float _1120 = -_1102;
    float _1122 = _1120 + 1.0;
    int _1124 = _1088 ? 0 : 1;
    float _1126 = -_1116;
    float _1128 = _1126 + 1.0;
    bool _1130 = _1020 > 0.0;
    float _1132 = _1116 * _1122;
    bool _1134 = _1020 >= 0.0;
    bool _1136 = isnan(_1020);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan(0.0);
    bool _1142 = _1138 || _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1146 = _740 + _1144;
    bool _1148 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1150 = isnan(_740);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1156 = _1152 || _1154;
    float _1158 = float(_1156);
    float _1160 = _982 * _1128;
    float _1162 = -_982;
    float _1164 = _1162 + 1.0;
    float _1166 = fma(_1008, _1146, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1170 = _740 + _1168;
    float _1172 = -_1158;
    float _1174 = _1172 + 1.0;
    float _1176 = _1158 * _1164;
    bool _1178 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1180 = isnan(_740);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = fma(_996, _1170, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1192 = _898 * _1174;
    float _1194 = -_898;
    float _1196 = _1194 + 1.0;
    float _1198 = _746 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1202 = _1188 * _1196;
    float _1204 = fma(_918, _1198, -0.5);
    float _1206 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[83].w, _970);
    float _1208 = _1066 * _1202;
    float _1210 = _764 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1216 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1218 = -_1188;
    float _1220 = _1218 + 1.0;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1226 = -_1214;
    float _1228 = fma(_1216, 2.0, _1226);
    float _1230 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1208);
    float _1232 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1032);
    float _1234 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1222);
    float _1236 = fma(_1210, _938, -0.5);
    float _1238 = fma(_1104, -2.0, _1224);
    float _1240 = fma(_1090, _1192, _1230);
    int _1242 = ~_1118;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1250 = _1246;
    if (!_1030)
    {
        int _1252 = ~_1118;
        int _1254 = _1252 + 1;
        _1250 = _1254;
    }
    int _1256 = _1250;
    float _1258 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1234);
    float _1260 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1262 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1264 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1206);
    float _1266 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1238);
    float _1268 = fma(_1078, _1176, _1240);
    float _1270 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1248);
    float _1272 = -_872;
    float _1274 = fma(_1258, _1236, _1272);
    float _1276 = fma(_1260, _852, -0.5);
    float _1278 = fma(_1262, _1026, -0.5);
    float _1280 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1232);
    float _1282 = -_112;
    float _1284 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1228);
    float _1286 = -_1266;
    float _1288 = fma(_1264, _1204, _1286);
    float _1290 = fma(_1166, _1160, _1268);
    float _1292 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1270);
    float _1294 = _928 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1298 = _958 + _1296;
    float _1300 = fma(_1280, _1278, _1284);
    float _1302 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1304 = log2(_1302);
    float _1306 = _930 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1308 = fma(_1292, _1276, _986);
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1312 = _1294 + _1310;
    float _1314 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1316 = !_858;
    int _1318 = _1316 ? 0 : 1;
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1322 = _1306 + _1320;
    float _1324 = fma(_1190, _1132, _1290);
    float _1326 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1314);
    int _1328 = abs(_1318);
    float _1330 = _1274 + 0.5;
    int _1332 = _1142 ? 0 : 1;
    float _1334 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1326);
    float _1336 = float(_1328);
    float _1338 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[120].x, _1324);
    float _1340 = float(_1256);
    float _1342 = _1298 * _1298;
    int _1344 = ~_1124;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    float _1350 = _1308 + 0.5;
    int _1352 = _1348;
    float _1354 = _1350;
    if (!_1076)
    {
        int _1356 = ~_1124;
        int _1358 = _1356 + 1;
        _1352 = _1358;
    }
    int _1360 = _1352;
    float _1362 = fma(_1312, _1312, _1342);
    int _1364 = ~_1332;
    int _1366 = _1364 + 1;
    int _1368 = _1366 + 1;
    float _1370 = _1300 + 0.5;
    int _1372 = _1368;
    if (!_1130)
    {
        int _1374 = ~_1332;
        int _1376 = _1374 + 1;
        _1372 = _1376;
    }
    int _1378 = _1372;
    float _1380 = _1336 * _1340;
    bool _1382 = _1334 >= 0.0;
    float _1384 = _1304 * _112;
    float _1386 = fma(_1322, _1322, _1362);
    float _1388 = _1288 + 0.5;
    float _1390 = exp2(_1384);
    float _1392 = in.m_49.x;
    float _1394 = in.m_49.y;
    float _1396 = in.m_49.z;
    bool _1398 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1400 = isnan(1.0);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1406 = _1402 || _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1410 = 1.0 + _1408;
    float _1412 = _708 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_51.x = _1350;
    out.m_51.y = _1330;
    out.m_51.z = _1370;
    out.m_51.w = _1388;
    float _1414 = _710 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1416 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1418 = isnan(0.0);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1424 = _1420 || _1422;
    float _1426 = rsqrt(_1386);
    int _1428 = as_type<int>(_1384);
    if (_1382)
    {
        out.m_33.x = 0.0;
    }
    float _1430 = 1.0 / _1410;
    float _1432 = -_1390;
    float _1434 = _1432 + 1.0;
    if (_1382)
    {
        _1354 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1436 = _1354;
    float _1438 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1440 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1442 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1444 = !_866;
    int _1446 = _1444 ? 0 : 1;
    if (_1382)
    {
        float _1448 = _1436 * 5.0;
        _1428 = as_type<int>(_1448);
    }
    int _1450 = _1428;
    float _1452 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1454 = !_862;
    int _1456 = _1454 ? 0 : 1;
    float _1458 = _1298 * _1426;
    float _1460 = _1424 ? _1434 : 0.0;
    if (_1382)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4244 = as_type<float>(_1450);
        out.gl_Position.z = _4244;
    }
    float _1462 = _1312 * _1426;
    out.m_53.x = _1452;
    out.m_53.y = _1438;
    out.m_53.z = _1440;
    out.m_53.w = _1442;
    if (_1382)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1464 = -_1458;
    float _1466 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[18].w, _958);
    float _1468 = _1380 * (-2.0);
    float _1470 = -_1462;
    float _1472 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1294);
    float _1474 = float(_1360);
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1478 = _1466 + _1476;
    float _1480 = _786 + (-0.5);
    float _1482 = fma(_1468, _1392, _1392);
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1486 = _1472 + _1484;
    float _1488 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_1406)
    {
        float _1490 = _1460 * _1430;
        _114 = _1490;
    }
    float _1492 = _114;
    float _1494 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1482);
    int _1496 = abs(_1456);
    float _1498 = _1322 * _1426;
    float _1500 = fma(_1044, _1468, _1044);
    float _1502 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1488);
    float _1504 = float(_1496);
    float _1506 = -_1498;
    float _1508 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1306);
    int _1510 = abs(_1446);
    float _1512 = _756 + _854;
    float _1514 = fma(_1500, _1492, _1494);
    float _1516 = _1504 * _1474;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1520 = _1508 + _1518;
    float _1522 = float(_1510);
    float _1524 = _1512 + (-1.0);
    float _1526 = _1516 * (-2.0);
    float _1528 = float(_1378);
    float _1530 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1502);
    float _1532 = _756 + (-0.5);
    float _1534 = fma(_1526, _1394, _1394);
    float _1536 = _1522 * _1528;
    float _1538 = _786 + _854;
    float _1540 = fma(_1524, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1542 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1534);
    bool _1544 = _1530 >= 0.0;
    float _1546 = _1538 + (-1.0);
    float _1548 = _1536 * (-2.0);
    float _1550 = fma(_1540, _1526, _1540);
    float _1552 = _854 + (-0.5);
    float _1554 = _1514 * 0.15915493667125701904296875;
    float _1556 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1558 = fma(_1548, _1396, _1396);
    float _1560 = fma(_1550, _1492, _1542);
    float _1562 = _1554 * 6.283185482025146484375;
    float _1564 = sin(_1562);
    float _1566 = fma(_1556, _1548, _1556);
    float _1568 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1558);
    float _1570 = _1560 * 0.15915493667125701904296875;
    float _1572 = _1556;
    int _1574 = as_type<int>(_1558);
    if (_1544)
    {
        _1572 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1576 = _1572;
    float _1578 = fma(_1566, _1492, _1568);
    if (_1544)
    {
        out.m_33.x = 0.0;
    }
    float _1580 = _1554 * 6.283185482025146484375;
    float _1582 = cos(_1580);
    if (_1544)
    {
        float _1584 = _1576 * 5.0;
        _1574 = as_type<int>(_1584);
    }
    int _1586 = _1574;
    float _1588 = -_1458;
    float _1590 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1298);
    if (_1544)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4479 = as_type<float>(_1586);
        out.gl_Position.z = _4479;
    }
    float _1592 = _1570 * 6.283185482025146484375;
    float _1594 = sin(_1592);
    float _1596 = _1570 * 6.283185482025146484375;
    float _1598 = cos(_1596);
    if (_1544)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1600 = -_958;
    float _1602 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1604 = -_1294;
    float _1606 = _1604 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1608 = -_1306;
    float _1610 = _1608 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1612 = -_1462;
    float _1614 = fma(_1612, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1312);
    float _1616 = _1602 * _1602;
    float _1618 = _1590 * _1590;
    float _1620 = _1578 * 0.15915493667125701904296875;
    float _1622 = -_1498;
    float _1624 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1322);
    float _1626 = fma(_1606, _1606, _1616);
    float _1628 = fma(_1614, _1614, _1618);
    float _1630 = _1620 * 6.283185482025146484375;
    float _1632 = sin(_1630);
    float _1634 = _1564 * _1594;
    float _1636 = fma(_1610, _1610, _1626);
    float _1638 = fma(_1624, _1624, _1628);
    float _1640 = _1582 * _1598;
    float _1642 = in.m_55.x;
    float _1644 = in.m_55.y;
    float _1646 = in.m_55.z;
    float _1648 = _702 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1650 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1652 = rsqrt(_1636);
    float _1654 = sqrt(_1638);
    float _1656 = fma(_1632, _1640, _1634);
    float _1658 = fma(_1632, _1634, _1640);
    float _1660 = _1606 * _1652;
    float _1662 = _1610 * _1652;
    float _1664 = _1602 * _1652;
    float _1666 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1668 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1670 = _1660 * _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1674 = _1662 * _1672;
    float _1676 = _1620 * 6.283185482025146484375;
    float _1678 = cos(_1676);
    float _1680 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1682 = -_1670;
    float _1684 = fma(_1662, _1680, _1682);
    float _1686 = _1426 * _1654;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1690 = _1664 * _1688;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1694 = -_1674;
    float _1696 = fma(_1664, _1692, _1694);
    float _1698 = _1684 * _1684;
    float _1700 = _1686 * _1666;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1704 = -_1690;
    float _1706 = fma(_1660, _1702, _1704);
    float _1708 = _1686 * _1648;
    float _1710 = fma(_1696, _1696, _1698);
    float _1712 = _1686 * _1650;
    float _1714 = _1582 * _1594;
    float _1716 = fma(_1706, _1706, _1710);
    float _1718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1644);
    float _1720 = _1564 * _1598;
    float _1722 = rsqrt(_1716);
    float _1724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1642);
    float _1726 = _1700 * _1718;
    float _1728 = -_1714;
    float _1730 = fma(_1632, _1720, _1728);
    float _1732 = -_1720;
    float _1734 = fma(_1632, _1714, _1732);
    float _1736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1646);
    float _1738 = _1678 * _1726;
    float _1740 = -_1726;
    float _1742 = _1632 * _1740;
    float _1744 = _1708 * _1724;
    float _1746 = _1712 * _1736;
    float _1748 = _1582 * _1738;
    float _1750 = _1598 * _1678;
    float _1752 = _1564 * _1738;
    float _1754 = _1594 * _1678;
    float _1756 = fma(_1656, _1744, _1748);
    float _1758 = fma(_1750, _1744, _1742);
    float _1760 = _1696 * _1722;
    float _1762 = _1684 * _1722;
    float _1764 = fma(_1734, _1746, _1756);
    float _1766 = _1706 * _1722;
    float _1768 = _1664 * _1760;
    float _1770 = _1662 * _1762;
    float _1772 = fma(_1730, _1744, _1752);
    float _1774 = fma(_1754, _1746, _1758);
    float _1776 = -_1768;
    float _1778 = fma(_1660, _1762, _1776);
    float _1780 = -_1770;
    float _1782 = fma(_1664, _1766, _1780);
    float _1784 = fma(_1658, _1746, _1772);
    float _1786 = _1778 * _1764;
    float _1788 = _1782 * _1764;
    float _1790 = fma(_1766, _1774, _1786);
    float _1792 = fma(_1760, _1774, _1788);
    float _1794 = fma(_1662, _1784, _1790);
    float _1796 = fma(_1660, _1784, _1792);
    float _1798 = _1660 * _1766;
    float _1800 = _1306 + _1794;
    float _1802 = _1294 + _1796;
    float _1804 = -_1798;
    float _1806 = fma(_1662, _1760, _1804);
    float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1810 = _1800 + _1808;
    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1814 = _1802 + _1812;
    float _1816 = _1806 * _1764;
    float _1818 = _1810 * _1810;
    float _1820 = fma(_1762, _1774, _1816);
    float _1822 = fma(_1814, _1814, _1818);
    float _1824 = fma(_1664, _1784, _1820);
    float _1826 = sqrt(_1822);
    float _1828 = _958 + _1824;
    bool _1830 = _1826 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1832 = _1794;
    float _1834 = _1802;
    float _1836 = _1800;
    if (!_1830)
    {
        _1832 = _1828;
    }
    float _1838 = _1832;
    bool _1840 = !_1830;
    float _1842 = _1838;
    if (!_1840)
    {
        float _1844 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1848 = _1826 + _1846;
        float _1850 = rsqrt(_1822);
        float _1852 = _1848 * _1844;
        float _1854 = _1828 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1856 = _1852 * 0.15915493667125701904296875;
        float _1858 = _1856 * 6.283185482025146484375;
        float _1860 = cos(_1858);
        float _1862 = _1856 * 6.283185482025146484375;
        float _1864 = sin(_1862);
        float _1866 = _1860 + (-1.0);
        float _1868 = _1866 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1870 = fma(_1864, _1854, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1872 = fma(_1828, _1860, _1868);
        float _1874 = _1850 * _1870;
        float _1876 = fma(_1814, _1874, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1878 = fma(_1810, _1874, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1842 = _1872;
        _1834 = _1876;
        _1836 = _1878;
    }
    float _1880 = _1842;
    float _1882 = _1834;
    float _1884 = _1836;
    float _1886 = -_1458;
    float _1888 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1880);
    float _1890 = -_1462;
    float _1892 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1882);
    float _1894 = -_1498;
    float _1896 = fma(_1894, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1884);
    float _1898 = _1888 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1900 = _1888 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1902 = _1888 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1904 = _1888 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1906 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1898);
    float _1908 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1900);
    float _1910 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1902);
    float _1912 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1904);
    float _1914 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1906);
    float _1916 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1908);
    float _1918 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1910);
    float _1920 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1912);
    float _1922 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1924 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1926 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1928 = _1920 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1930 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1932 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1934 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1936 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1938 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1930);
    float _1940 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1932);
    float _1942 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1934);
    float _1944 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1936);
    float _1946 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1938);
    float _1948 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1940);
    float _1950 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1942);
    float _1952 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1944);
    float _1954 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1946);
    float _1956 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1948);
    float _1958 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1950);
    float _1960 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1952);
    float _1962 = _1954 + _1956;
    float _1964 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1966 = _1962 * 0.5;
    out.m_33.x = _1964;
    out.gl_Position.x = _1958;
    out.gl_Position.y = _1960;
    out.gl_Position.z = _1954;
    out.gl_Position.w = _1956;
    out.m_57.z = _1966;
    out.m_57.w = _1956;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _732 = false;
    bool _390 = false;
    bool _276 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_30.w;
    float _73 = trunc(_71);
    int _76 = int(_73);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    float _84 = as_type<float>(_76);
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _82;
    float _88 = _86;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _90 = 0;
    if (!_80)
    {
        float _92 = _86 * 5.0;
        _90 = as_type<int>(_92);
    }
    int _94 = _90;
    int _96 = _94;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2025 = as_type<float>(_94);
        out.gl_Position.z = _2025;
    }
    if (!_80)
    {
        return out;
    }
    float _98 = in.m_35.w;
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
        float _116 = float(_76);
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
        out.m_33.x = 0.0;
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
        float _2095 = as_type<float>(_132);
        out.gl_Position.z = _2095;
    }
    if (_124)
    {
        return out;
    }
    float _134 = in.m_37.w;
    float _136 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    float _148 = in.m_35.x;
    float _150 = in.m_35.y;
    float _152 = in.m_35.z;
    float _154 = in.m_30.x;
    float _156 = in.m_30.y;
    float _158 = in.m_30.z;
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
        float _258 = in.m_39.x;
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
        float _278 = float(_76);
        float _280 = 1.0 / _278;
        float _282 = _112 * _280;
        _274 = _282;
    }
    _276 = false;
    float _284 = _274;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = _284 + _286;
    bool _290 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _292 = isnan(_284);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    bool _306 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _308 = isnan(_284);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -_300;
    float _320 = _318 + 1.0;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _322;
    float _326 = 1.0 / _304;
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _330 = _316 * _320;
    float _332 = -_316;
    float _334 = _332 + 1.0;
    float _336 = _288 * _326;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _338;
    float _342 = fma(_324, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _344;
    float _348 = fma(_340, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _350 = fma(_346, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _352 = _342 * _330;
    float _354 = _350 * _330;
    float _356 = _348 * _330;
    float _358 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].x, _352);
    float _360 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].y, _354);
    float _362 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].z, _356);
    float _364 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[144].x, _358);
    float _366 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[144].y, _360);
    float _368 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[144].z, _362);
    bool _370 = !_328;
    float _388;
    if (!_370)
    {
        float _372 = in.m_39.x;
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _376 = _372 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _378 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[11].x, _112);
        float _380 = _378 * _374;
        float _382 = floor(_380);
        float _384 = -_382;
        float _386 = _380 + _384;
        _388 = _386;
        _390 = true;
    }
    else
    {
        float _392 = float(_76);
        float _394 = 1.0 / _392;
        float _396 = _112 * _394;
        _388 = _396;
    }
    _390 = false;
    float _398 = _388;
    float _400 = in.m_37.x;
    float _402 = in.m_37.y;
    float _404 = in.m_37.z;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _408 = _398 + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _418;
    float _422 = 1.0 / _412;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _432 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _434 = isnan(_398);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = 1.0 / _416;
    bool _446 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _448 = _368 * _404;
    float _450 = _366 * _402;
    float _452 = 1.0 / _426;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _456 = _398 + _454;
    float _458 = _408 * _422;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _462 = _398 + _460;
    bool _464 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _466 = isnan(_398);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _478 = _398 + _476;
    float _480 = 1.0 / _420;
    float _482 = _456 * _444;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _486 = _398 + _484;
    bool _488 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _490 = isnan(_398);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _500;
    bool _504 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _506 = isnan(_398);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = 1.0 / _430;
    float _518 = _462 * _452;
    float _520 = -_498;
    float _522 = _520 + 1.0;
    bool _524 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _526 = isnan(_398);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = fma(_502, _458, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _538 = _442 * _522;
    float _540 = -_442;
    float _542 = _540 + 1.0;
    float _544 = _486 * _480;
    float _546 = -_474;
    float _548 = _546 + 1.0;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _550;
    float _554 = _514 * _548;
    float _556 = -_514;
    float _558 = _556 + 1.0;
    float _560 = fma(_552, _458, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _562 = _478 * _516;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _564;
    float _568 = _534 * _558;
    float _570 = -_534;
    float _572 = _570 + 1.0;
    float _574 = fma(_566, _458, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _576 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _578 = isnan(_398);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = _498 * _572;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _602 = _586 * _542;
    float _604 = -_586;
    float _606 = _604 + 1.0;
    float _608 = fma(_596, _482, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _610 = fma(_592, _482, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _612 = _536 * _602;
    float _614 = _574 * _602;
    float _616 = _560 * _602;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _622;
    float _626 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[107].x, _612);
    float _628 = fma(_600, _482, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _630 = fma(_620, _518, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _632 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[107].y, _614);
    float _634 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[107].z, _616);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _648;
    float _652 = fma(_624, _518, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _654 = fma(_608, _538, _626);
    float _656 = fma(_638, _562, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _658 = fma(_642, _562, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _660 = fma(_646, _562, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _662 = fma(_650, _518, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _664 = fma(_610, _538, _632);
    float _666 = fma(_628, _538, _634);
    float _668 = fma(_652, _588, _654);
    float _670 = fma(_630, _588, _664);
    float _672 = fma(_662, _588, _666);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _674;
    float _678 = fma(_656, _568, _668);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _680;
    float _684 = fma(_658, _568, _670);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _686;
    float _690 = fma(_676, _544, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _692 = fma(_682, _544, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _694 = fma(_660, _568, _672);
    float _696 = fma(_688, _544, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _698 = fma(_690, _554, _678);
    float _700 = fma(_692, _554, _684);
    float _702 = _364 * _400;
    float _704 = fma(_696, _554, _694);
    float _706 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[112].x, _698);
    float _708 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[112].y, _700);
    float _710 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[112].z, _704);
    bool _712 = !_446;
    float _730;
    if (!_712)
    {
        float _714 = in.m_39.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[11].y, _112);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        float _734 = float(_76);
        float _736 = 1.0 / _734;
        float _738 = _112 * _736;
        _730 = _738;
        _84 = _734;
    }
    _732 = false;
    float _740 = _730;
    float _742 = _84;
    float _744 = in.m_39.w;
    float _746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _748 = in.m_41.x;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _752 = _750 != 0;
    float _754 = _706 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _756 = in.m_39.y;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _762 = _760 != 0;
    float _764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _766 = in.m_43.x;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _770 = _768 != 0;
    float _772 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _776 = _774 != 0;
    float _778 = in.m_43.y;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _782 = _780 != 0;
    float _784 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _772);
    float _786 = in.m_39.x;
    float _788 = in.m_41.y;
    bool _790 = _744 > 0.5;
    float _792 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _794 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _796 = in.m_41.w;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _802 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _792);
    float _804 = in.m_41.z;
    float _806 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _794);
    out.m_45.x = _748;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    float _814 = _742;
    if (_752)
    {
        float _816 = -_766;
        float _818 = _816 + 1.0;
        _812 = as_type<int>(_818);
    }
    int _820 = _812;
    if (!_752)
    {
        _814 = _766;
    }
    float _822 = _814;
    float _824 = -_778;
    float _826 = _824 + 1.0;
    float _828 = 1.0 / _810;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _832 = _756 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _834 = false;
    float _836 = _822;
    float _838 = _778;
    if (_752)
    {
        bool _840 = _786 > 0.5;
        _834 = _840;
    }
    bool _842 = _834;
    float _844 = _786 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _846 = _790 ? as_type<int>(_826) : as_type<int>(_778);
    float _848 = fma(_832, -2.0, _758);
    if (_752)
    {
        float _850 = _842 ? as_type<float>(_820) : _766;
        _836 = _850;
    }
    float _852 = _836;
    float _854 = in.m_39.z;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _858 = _856 != 0;
    int _860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _862 = _860 != 0;
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _866 = _864 != 0;
    float _868 = -_830;
    float _870 = fma(_844, 2.0, _868);
    out.m_45.y = _788;
    float _872 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _848);
    out.m_45.w = _796;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    out.m_45.z = _804;
    float _882 = 1.0 / _876;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _888 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _890 = isnan(_740);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _900;
    float _904 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = 1.0 / _880;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _912 = _886 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _914 = _902 * _828;
    float _916 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _784);
    float _918 = _776 ? as_type<float>(_846) : _778;
    float _920 = _854 * 2.0;
    bool _922 = _756 > 0.5;
    float _924 = 1.0 / _910;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _928 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _802);
    float _930 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _806);
    bool _932 = _782;
    float _934 = _912;
    if (_782)
    {
        float _936 = _922 ? _826 : _778;
        _838 = _936;
    }
    float _938 = _838;
    float _940 = _786 * 2.0;
    float _942 = _926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_762)
    {
        bool _944 = _854 > 0.5;
        _932 = _944;
    }
    bool _946 = _932;
    float _948 = 1.0 / _800;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _954;
    out.m_47.x = _904;
    out.m_47.y = _942;
    out.m_47.z = _912;
    float _958 = _916 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _960 = _956 * _882;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _962;
    float _966 = floor(_920);
    float _968 = _756 * 2.0;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _972 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _974 = isnan(_740);
    bool _976 = _972 || _974;
    bool _978 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _980 = _976 || _978;
    float _982 = float(_980);
    float _984 = -_112;
    float _986 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[76].x, _870);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _992 = floor(_940);
    float _994 = _952 * _906;
    float _996 = _964 * _948;
    int _998 = as_type<int>(_906);
    float _1000 = _952;
    if (_762)
    {
        float _1002 = -_766;
        float _1004 = _1002 + 1.0;
        _998 = as_type<int>(_1004);
    }
    int _1006 = _998;
    float _1008 = _990 * _924;
    float _1010 = _786 + _756;
    float _1012 = as_type<float>(_1006);
    if (!_762)
    {
        _934 = _766;
    }
    float _1014 = _934;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1018 = _740 + _1016;
    float _1020 = floor(_968);
    float _1022 = _1014;
    if (_762)
    {
        float _1024 = _946 ? as_type<float>(_1006) : _766;
        _1022 = _1024;
    }
    float _1026 = _1022;
    float _1028 = _1010 + (-1.0);
    bool _1030 = _966 > 0.0;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1034 = _966 >= 0.0;
    bool _1036 = isnan(_966);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan(0.0);
    bool _1042 = _1038 || _1040;
    float _1044 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1046 = _966;
    if (!_770)
    {
        _1000 = _756;
    }
    float _1048 = _1000;
    float _1050 = _1048;
    if (!_770)
    {
        _1046 = _854;
    }
    float _1052 = _1046;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1056 = _740 + _1054;
    float _1058 = _1052;
    if (!_770)
    {
        _1012 = _854;
    }
    float _1060 = _1012;
    float _1062 = _1060;
    if (_770)
    {
        _1050 = _786;
    }
    float _1064 = _1050;
    float _1066 = fma(_914, _1056, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    if (_770)
    {
        _1058 = _756;
    }
    float _1068 = _1058;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1072 = _740 + _1070;
    if (_770)
    {
        _1062 = _756;
    }
    float _1074 = _1062;
    bool _1076 = _992 > 0.0;
    float _1078 = fma(_960, _1072, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1080 = _992 >= 0.0;
    bool _1082 = isnan(_992);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan(0.0);
    bool _1088 = _1084 || _1086;
    float _1090 = fma(_994, _1018, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1092 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1094 = isnan(_740);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1100 = _1096 || _1098;
    float _1102 = float(_1100);
    float _1104 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1106 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1108 = isnan(_740);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    int _1118 = _1042 ? 0 : 1;
    float _1120 = -_1102;
    float _1122 = _1120 + 1.0;
    int _1124 = _1088 ? 0 : 1;
    float _1126 = -_1116;
    float _1128 = _1126 + 1.0;
    bool _1130 = _1020 > 0.0;
    float _1132 = _1116 * _1122;
    bool _1134 = _1020 >= 0.0;
    bool _1136 = isnan(_1020);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan(0.0);
    bool _1142 = _1138 || _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1146 = _740 + _1144;
    bool _1148 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1150 = isnan(_740);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1156 = _1152 || _1154;
    float _1158 = float(_1156);
    float _1160 = _982 * _1128;
    float _1162 = -_982;
    float _1164 = _1162 + 1.0;
    float _1166 = fma(_1008, _1146, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1170 = _740 + _1168;
    float _1172 = -_1158;
    float _1174 = _1172 + 1.0;
    float _1176 = _1158 * _1164;
    bool _1178 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1180 = isnan(_740);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = fma(_996, _1170, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1192 = _898 * _1174;
    float _1194 = -_898;
    float _1196 = _1194 + 1.0;
    float _1198 = _746 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1202 = _1188 * _1196;
    float _1204 = fma(_918, _1198, -0.5);
    float _1206 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[83].w, _970);
    float _1208 = _1066 * _1202;
    float _1210 = _764 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1216 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1218 = -_1188;
    float _1220 = _1218 + 1.0;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1226 = -_1214;
    float _1228 = fma(_1216, 2.0, _1226);
    float _1230 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1208);
    float _1232 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1032);
    float _1234 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1222);
    float _1236 = fma(_1210, _938, -0.5);
    float _1238 = fma(_1104, -2.0, _1224);
    float _1240 = fma(_1090, _1192, _1230);
    int _1242 = ~_1118;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1250 = _1246;
    if (!_1030)
    {
        int _1252 = ~_1118;
        int _1254 = _1252 + 1;
        _1250 = _1254;
    }
    int _1256 = _1250;
    float _1258 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1234);
    float _1260 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1262 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1264 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1206);
    float _1266 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1238);
    float _1268 = fma(_1078, _1176, _1240);
    float _1270 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1248);
    float _1272 = -_872;
    float _1274 = fma(_1258, _1236, _1272);
    float _1276 = fma(_1260, _852, -0.5);
    float _1278 = fma(_1262, _1026, -0.5);
    float _1280 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1232);
    float _1282 = -_112;
    float _1284 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1228);
    float _1286 = -_1266;
    float _1288 = fma(_1264, _1204, _1286);
    float _1290 = fma(_1166, _1160, _1268);
    float _1292 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1270);
    float _1294 = _928 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1298 = _958 + _1296;
    float _1300 = fma(_1280, _1278, _1284);
    float _1302 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1304 = log2(_1302);
    float _1306 = _930 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1308 = fma(_1292, _1276, _986);
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1312 = _1294 + _1310;
    float _1314 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1316 = !_858;
    int _1318 = _1316 ? 0 : 1;
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1322 = _1306 + _1320;
    float _1324 = fma(_1190, _1132, _1290);
    float _1326 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1314);
    int _1328 = abs(_1318);
    float _1330 = _1274 + 0.5;
    int _1332 = _1142 ? 0 : 1;
    float _1334 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1326);
    float _1336 = float(_1328);
    float _1338 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[120].x, _1324);
    float _1340 = float(_1256);
    float _1342 = _1298 * _1298;
    int _1344 = ~_1124;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    float _1350 = _1308 + 0.5;
    int _1352 = _1348;
    float _1354 = _1350;
    if (!_1076)
    {
        int _1356 = ~_1124;
        int _1358 = _1356 + 1;
        _1352 = _1358;
    }
    int _1360 = _1352;
    float _1362 = fma(_1312, _1312, _1342);
    int _1364 = ~_1332;
    int _1366 = _1364 + 1;
    int _1368 = _1366 + 1;
    float _1370 = _1300 + 0.5;
    int _1372 = _1368;
    if (!_1130)
    {
        int _1374 = ~_1332;
        int _1376 = _1374 + 1;
        _1372 = _1376;
    }
    int _1378 = _1372;
    float _1380 = _1336 * _1340;
    bool _1382 = _1334 >= 0.0;
    float _1384 = _1304 * _112;
    float _1386 = fma(_1322, _1322, _1362);
    float _1388 = _1288 + 0.5;
    float _1390 = exp2(_1384);
    float _1392 = in.m_49.x;
    float _1394 = in.m_49.y;
    float _1396 = in.m_49.z;
    bool _1398 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1400 = isnan(1.0);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1406 = _1402 || _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1410 = 1.0 + _1408;
    float _1412 = _708 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_51.x = _1350;
    out.m_51.y = _1330;
    out.m_51.z = _1370;
    out.m_51.w = _1388;
    float _1414 = _710 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1416 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1418 = isnan(0.0);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1424 = _1420 || _1422;
    float _1426 = rsqrt(_1386);
    int _1428 = as_type<int>(_1384);
    if (_1382)
    {
        out.m_33.x = 0.0;
    }
    float _1430 = 1.0 / _1410;
    float _1432 = -_1390;
    float _1434 = _1432 + 1.0;
    if (_1382)
    {
        _1354 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1436 = _1354;
    float _1438 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1440 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1442 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1444 = !_866;
    int _1446 = _1444 ? 0 : 1;
    if (_1382)
    {
        float _1448 = _1436 * 5.0;
        _1428 = as_type<int>(_1448);
    }
    int _1450 = _1428;
    float _1452 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1454 = !_862;
    int _1456 = _1454 ? 0 : 1;
    float _1458 = _1298 * _1426;
    float _1460 = _1424 ? _1434 : 0.0;
    if (_1382)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4244 = as_type<float>(_1450);
        out.gl_Position.z = _4244;
    }
    float _1462 = _1312 * _1426;
    out.m_53.x = _1452;
    out.m_53.y = _1438;
    out.m_53.z = _1440;
    out.m_53.w = _1442;
    if (_1382)
    {
        return out;
    }
    float _1464 = -_1458;
    float _1466 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[18].w, _958);
    float _1468 = _1380 * (-2.0);
    float _1470 = -_1462;
    float _1472 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1294);
    float _1474 = float(_1360);
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1478 = _1466 + _1476;
    float _1480 = _786 + (-0.5);
    float _1482 = fma(_1468, _1392, _1392);
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1486 = _1472 + _1484;
    float _1488 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_1406)
    {
        float _1490 = _1460 * _1430;
        _114 = _1490;
    }
    float _1492 = _114;
    float _1494 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1482);
    int _1496 = abs(_1456);
    float _1498 = _1322 * _1426;
    float _1500 = fma(_1044, _1468, _1044);
    float _1502 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1488);
    float _1504 = float(_1496);
    float _1506 = -_1498;
    float _1508 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1306);
    int _1510 = abs(_1446);
    float _1512 = _756 + _854;
    float _1514 = fma(_1500, _1492, _1494);
    float _1516 = _1504 * _1474;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1520 = _1508 + _1518;
    float _1522 = float(_1510);
    float _1524 = _1512 + (-1.0);
    float _1526 = _1516 * (-2.0);
    float _1528 = float(_1378);
    float _1530 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1502);
    float _1532 = _756 + (-0.5);
    float _1534 = fma(_1526, _1394, _1394);
    float _1536 = _1522 * _1528;
    float _1538 = _786 + _854;
    float _1540 = fma(_1524, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1542 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1534);
    bool _1544 = _1530 >= 0.0;
    float _1546 = _1538 + (-1.0);
    float _1548 = _1536 * (-2.0);
    float _1550 = fma(_1540, _1526, _1540);
    float _1552 = _854 + (-0.5);
    float _1554 = _1514 * 0.15915493667125701904296875;
    float _1556 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1558 = fma(_1548, _1396, _1396);
    float _1560 = fma(_1550, _1492, _1542);
    float _1562 = _1554 * 6.283185482025146484375;
    float _1564 = sin(_1562);
    float _1566 = fma(_1556, _1548, _1556);
    float _1568 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1558);
    float _1570 = _1560 * 0.15915493667125701904296875;
    float _1572 = _1556;
    int _1574 = as_type<int>(_1558);
    if (_1544)
    {
        _1572 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1576 = _1572;
    float _1578 = fma(_1566, _1492, _1568);
    if (_1544)
    {
        out.m_33.x = 0.0;
    }
    float _1580 = _1554 * 6.283185482025146484375;
    float _1582 = cos(_1580);
    if (_1544)
    {
        float _1584 = _1576 * 5.0;
        _1574 = as_type<int>(_1584);
    }
    int _1586 = _1574;
    float _1588 = -_1458;
    float _1590 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1298);
    if (_1544)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4479 = as_type<float>(_1586);
        out.gl_Position.z = _4479;
    }
    float _1592 = _1570 * 6.283185482025146484375;
    float _1594 = sin(_1592);
    float _1596 = _1570 * 6.283185482025146484375;
    float _1598 = cos(_1596);
    if (_1544)
    {
        return out;
    }
    float _1600 = -_958;
    float _1602 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1604 = -_1294;
    float _1606 = _1604 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1608 = -_1306;
    float _1610 = _1608 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1612 = -_1462;
    float _1614 = fma(_1612, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1312);
    float _1616 = _1602 * _1602;
    float _1618 = _1590 * _1590;
    float _1620 = _1578 * 0.15915493667125701904296875;
    float _1622 = -_1498;
    float _1624 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1322);
    float _1626 = fma(_1606, _1606, _1616);
    float _1628 = fma(_1614, _1614, _1618);
    float _1630 = _1620 * 6.283185482025146484375;
    float _1632 = sin(_1630);
    float _1634 = _1564 * _1594;
    float _1636 = fma(_1610, _1610, _1626);
    float _1638 = fma(_1624, _1624, _1628);
    float _1640 = _1582 * _1598;
    float _1642 = in.m_55.x;
    float _1644 = in.m_55.y;
    float _1646 = in.m_55.z;
    float _1648 = _702 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1650 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1652 = rsqrt(_1636);
    float _1654 = sqrt(_1638);
    float _1656 = fma(_1632, _1640, _1634);
    float _1658 = fma(_1632, _1634, _1640);
    float _1660 = _1606 * _1652;
    float _1662 = _1610 * _1652;
    float _1664 = _1602 * _1652;
    float _1666 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1668 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1670 = _1660 * _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1674 = _1662 * _1672;
    float _1676 = _1620 * 6.283185482025146484375;
    float _1678 = cos(_1676);
    float _1680 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1682 = -_1670;
    float _1684 = fma(_1662, _1680, _1682);
    float _1686 = _1426 * _1654;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1690 = _1664 * _1688;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1694 = -_1674;
    float _1696 = fma(_1664, _1692, _1694);
    float _1698 = _1684 * _1684;
    float _1700 = _1686 * _1666;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1704 = -_1690;
    float _1706 = fma(_1660, _1702, _1704);
    float _1708 = _1686 * _1648;
    float _1710 = fma(_1696, _1696, _1698);
    float _1712 = _1686 * _1650;
    float _1714 = _1582 * _1594;
    float _1716 = fma(_1706, _1706, _1710);
    float _1718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1644);
    float _1720 = _1564 * _1598;
    float _1722 = rsqrt(_1716);
    float _1724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1642);
    float _1726 = _1700 * _1718;
    float _1728 = -_1714;
    float _1730 = fma(_1632, _1720, _1728);
    float _1732 = -_1720;
    float _1734 = fma(_1632, _1714, _1732);
    float _1736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1646);
    float _1738 = _1678 * _1726;
    float _1740 = -_1726;
    float _1742 = _1632 * _1740;
    float _1744 = _1708 * _1724;
    float _1746 = _1712 * _1736;
    float _1748 = _1582 * _1738;
    float _1750 = _1598 * _1678;
    float _1752 = _1564 * _1738;
    float _1754 = _1594 * _1678;
    float _1756 = fma(_1656, _1744, _1748);
    float _1758 = fma(_1750, _1744, _1742);
    float _1760 = _1696 * _1722;
    float _1762 = _1684 * _1722;
    float _1764 = fma(_1734, _1746, _1756);
    float _1766 = _1706 * _1722;
    float _1768 = _1664 * _1760;
    float _1770 = _1662 * _1762;
    float _1772 = fma(_1730, _1744, _1752);
    float _1774 = fma(_1754, _1746, _1758);
    float _1776 = -_1768;
    float _1778 = fma(_1660, _1762, _1776);
    float _1780 = -_1770;
    float _1782 = fma(_1664, _1766, _1780);
    float _1784 = fma(_1658, _1746, _1772);
    float _1786 = _1778 * _1764;
    float _1788 = _1782 * _1764;
    float _1790 = fma(_1766, _1774, _1786);
    float _1792 = fma(_1760, _1774, _1788);
    float _1794 = fma(_1662, _1784, _1790);
    float _1796 = fma(_1660, _1784, _1792);
    float _1798 = _1660 * _1766;
    float _1800 = _1306 + _1794;
    float _1802 = _1294 + _1796;
    float _1804 = -_1798;
    float _1806 = fma(_1662, _1760, _1804);
    float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1810 = _1800 + _1808;
    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1814 = _1802 + _1812;
    float _1816 = _1806 * _1764;
    float _1818 = _1810 * _1810;
    float _1820 = fma(_1762, _1774, _1816);
    float _1822 = fma(_1814, _1814, _1818);
    float _1824 = fma(_1664, _1784, _1820);
    float _1826 = sqrt(_1822);
    float _1828 = _958 + _1824;
    bool _1830 = _1826 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1832 = _1794;
    float _1834 = _1802;
    float _1836 = _1800;
    if (!_1830)
    {
        _1832 = _1828;
    }
    float _1838 = _1832;
    bool _1840 = !_1830;
    float _1842 = _1838;
    if (!_1840)
    {
        float _1844 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1848 = _1826 + _1846;
        float _1850 = rsqrt(_1822);
        float _1852 = _1848 * _1844;
        float _1854 = _1828 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1856 = _1852 * 0.15915493667125701904296875;
        float _1858 = _1856 * 6.283185482025146484375;
        float _1860 = cos(_1858);
        float _1862 = _1856 * 6.283185482025146484375;
        float _1864 = sin(_1862);
        float _1866 = _1860 + (-1.0);
        float _1868 = _1866 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1870 = fma(_1864, _1854, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1872 = fma(_1828, _1860, _1868);
        float _1874 = _1850 * _1870;
        float _1876 = fma(_1814, _1874, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1878 = fma(_1810, _1874, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1842 = _1872;
        _1834 = _1876;
        _1836 = _1878;
    }
    float _1880 = _1842;
    float _1882 = _1834;
    float _1884 = _1836;
    float _1886 = -_1458;
    float _1888 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1880);
    float _1890 = -_1462;
    float _1892 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1882);
    float _1894 = -_1498;
    float _1896 = fma(_1894, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1884);
    float _1898 = _1888 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1900 = _1888 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1902 = _1888 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1904 = _1888 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1906 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1898);
    float _1908 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1900);
    float _1910 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1902);
    float _1912 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1904);
    float _1914 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1906);
    float _1916 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1908);
    float _1918 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1910);
    float _1920 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1912);
    float _1922 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1924 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1926 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1928 = _1920 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1930 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1932 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1934 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1936 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1938 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1930);
    float _1940 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1932);
    float _1942 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1934);
    float _1944 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1936);
    float _1946 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1938);
    float _1948 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1940);
    float _1950 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1942);
    float _1952 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1944);
    float _1954 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1946);
    float _1956 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1948);
    float _1958 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1950);
    float _1960 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1952);
    float _1962 = _1954 + _1956;
    float _1964 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1966 = _1962 * 0.5;
    out.m_33.x = _1964;
    out.gl_Position.x = _1958;
    out.gl_Position.y = _1960;
    out.gl_Position.z = _1954;
    out.gl_Position.w = _1956;
    out.m_57.z = _1966;
    out.m_57.w = _1956;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    bool _732 = false;
    bool _390 = false;
    bool _276 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_30.w;
    float _73 = trunc(_71);
    int _76 = int(_73);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    float _84 = as_type<float>(_76);
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _82;
    float _88 = _86;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _90 = 0;
    if (!_80)
    {
        float _92 = _86 * 5.0;
        _90 = as_type<int>(_92);
    }
    int _94 = _90;
    int _96 = _94;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2025 = as_type<float>(_94);
        out.gl_Position.z = _2025;
    }
    if (!_80)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _98 = in.m_35.w;
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
        float _116 = float(_76);
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
        out.m_33.x = 0.0;
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
        float _2095 = as_type<float>(_132);
        out.gl_Position.z = _2095;
    }
    if (_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_37.w;
    float _136 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    float _148 = in.m_35.x;
    float _150 = in.m_35.y;
    float _152 = in.m_35.z;
    float _154 = in.m_30.x;
    float _156 = in.m_30.y;
    float _158 = in.m_30.z;
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
        float _258 = in.m_39.x;
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
        float _278 = float(_76);
        float _280 = 1.0 / _278;
        float _282 = _112 * _280;
        _274 = _282;
    }
    _276 = false;
    float _284 = _274;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = _284 + _286;
    bool _290 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _292 = isnan(_284);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    bool _306 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _308 = isnan(_284);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -_300;
    float _320 = _318 + 1.0;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _322;
    float _326 = 1.0 / _304;
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _330 = _316 * _320;
    float _332 = -_316;
    float _334 = _332 + 1.0;
    float _336 = _288 * _326;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _338;
    float _342 = fma(_324, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _344;
    float _348 = fma(_340, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _350 = fma(_346, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _352 = _342 * _330;
    float _354 = _350 * _330;
    float _356 = _348 * _330;
    float _358 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].x, _352);
    float _360 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].y, _354);
    float _362 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].z, _356);
    float _364 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[144].x, _358);
    float _366 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[144].y, _360);
    float _368 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[144].z, _362);
    bool _370 = !_328;
    float _388;
    if (!_370)
    {
        float _372 = in.m_39.x;
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _376 = _372 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _378 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[11].x, _112);
        float _380 = _378 * _374;
        float _382 = floor(_380);
        float _384 = -_382;
        float _386 = _380 + _384;
        _388 = _386;
        _390 = true;
    }
    else
    {
        float _392 = float(_76);
        float _394 = 1.0 / _392;
        float _396 = _112 * _394;
        _388 = _396;
    }
    _390 = false;
    float _398 = _388;
    float _400 = in.m_37.x;
    float _402 = in.m_37.y;
    float _404 = in.m_37.z;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _408 = _398 + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _418;
    float _422 = 1.0 / _412;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _432 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _434 = isnan(_398);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = 1.0 / _416;
    bool _446 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _448 = _368 * _404;
    float _450 = _366 * _402;
    float _452 = 1.0 / _426;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _456 = _398 + _454;
    float _458 = _408 * _422;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _462 = _398 + _460;
    bool _464 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _466 = isnan(_398);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _478 = _398 + _476;
    float _480 = 1.0 / _420;
    float _482 = _456 * _444;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _486 = _398 + _484;
    bool _488 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _490 = isnan(_398);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _500;
    bool _504 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _506 = isnan(_398);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = 1.0 / _430;
    float _518 = _462 * _452;
    float _520 = -_498;
    float _522 = _520 + 1.0;
    bool _524 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _526 = isnan(_398);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = fma(_502, _458, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _538 = _442 * _522;
    float _540 = -_442;
    float _542 = _540 + 1.0;
    float _544 = _486 * _480;
    float _546 = -_474;
    float _548 = _546 + 1.0;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _550;
    float _554 = _514 * _548;
    float _556 = -_514;
    float _558 = _556 + 1.0;
    float _560 = fma(_552, _458, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _562 = _478 * _516;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _564;
    float _568 = _534 * _558;
    float _570 = -_534;
    float _572 = _570 + 1.0;
    float _574 = fma(_566, _458, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _576 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _578 = isnan(_398);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = _498 * _572;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _602 = _586 * _542;
    float _604 = -_586;
    float _606 = _604 + 1.0;
    float _608 = fma(_596, _482, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _610 = fma(_592, _482, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _612 = _536 * _602;
    float _614 = _574 * _602;
    float _616 = _560 * _602;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _622;
    float _626 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[107].x, _612);
    float _628 = fma(_600, _482, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _630 = fma(_620, _518, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _632 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[107].y, _614);
    float _634 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[107].z, _616);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _648;
    float _652 = fma(_624, _518, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _654 = fma(_608, _538, _626);
    float _656 = fma(_638, _562, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _658 = fma(_642, _562, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _660 = fma(_646, _562, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _662 = fma(_650, _518, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _664 = fma(_610, _538, _632);
    float _666 = fma(_628, _538, _634);
    float _668 = fma(_652, _588, _654);
    float _670 = fma(_630, _588, _664);
    float _672 = fma(_662, _588, _666);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _674;
    float _678 = fma(_656, _568, _668);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _680;
    float _684 = fma(_658, _568, _670);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _686;
    float _690 = fma(_676, _544, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _692 = fma(_682, _544, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _694 = fma(_660, _568, _672);
    float _696 = fma(_688, _544, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _698 = fma(_690, _554, _678);
    float _700 = fma(_692, _554, _684);
    float _702 = _364 * _400;
    float _704 = fma(_696, _554, _694);
    float _706 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[112].x, _698);
    float _708 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[112].y, _700);
    float _710 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[112].z, _704);
    bool _712 = !_446;
    float _730;
    if (!_712)
    {
        float _714 = in.m_39.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[11].y, _112);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        float _734 = float(_76);
        float _736 = 1.0 / _734;
        float _738 = _112 * _736;
        _730 = _738;
        _84 = _734;
    }
    _732 = false;
    float _740 = _730;
    float _742 = _84;
    float _744 = in.m_39.w;
    float _746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _748 = in.m_41.x;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _752 = _750 != 0;
    float _754 = _706 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _756 = in.m_39.y;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _762 = _760 != 0;
    float _764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _766 = in.m_43.x;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _770 = _768 != 0;
    float _772 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _776 = _774 != 0;
    float _778 = in.m_43.y;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _782 = _780 != 0;
    float _784 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _772);
    float _786 = in.m_39.x;
    float _788 = in.m_41.y;
    bool _790 = _744 > 0.5;
    float _792 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _794 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _796 = in.m_41.w;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _802 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _792);
    float _804 = in.m_41.z;
    float _806 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _794);
    out.m_45.x = _748;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    float _814 = _742;
    if (_752)
    {
        float _816 = -_766;
        float _818 = _816 + 1.0;
        _812 = as_type<int>(_818);
    }
    int _820 = _812;
    if (!_752)
    {
        _814 = _766;
    }
    float _822 = _814;
    float _824 = -_778;
    float _826 = _824 + 1.0;
    float _828 = 1.0 / _810;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _832 = _756 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _834 = false;
    float _836 = _822;
    float _838 = _778;
    if (_752)
    {
        bool _840 = _786 > 0.5;
        _834 = _840;
    }
    bool _842 = _834;
    float _844 = _786 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _846 = _790 ? as_type<int>(_826) : as_type<int>(_778);
    float _848 = fma(_832, -2.0, _758);
    if (_752)
    {
        float _850 = _842 ? as_type<float>(_820) : _766;
        _836 = _850;
    }
    float _852 = _836;
    float _854 = in.m_39.z;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _858 = _856 != 0;
    int _860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _862 = _860 != 0;
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _866 = _864 != 0;
    float _868 = -_830;
    float _870 = fma(_844, 2.0, _868);
    out.m_45.y = _788;
    float _872 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _848);
    out.m_45.w = _796;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    out.m_45.z = _804;
    float _882 = 1.0 / _876;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _888 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _890 = isnan(_740);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _900;
    float _904 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _906 = 1.0 / _880;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _912 = _886 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _914 = _902 * _828;
    float _916 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _784);
    float _918 = _776 ? as_type<float>(_846) : _778;
    float _920 = _854 * 2.0;
    bool _922 = _756 > 0.5;
    float _924 = 1.0 / _910;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _928 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _802);
    float _930 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _806);
    bool _932 = _782;
    float _934 = _912;
    if (_782)
    {
        float _936 = _922 ? _826 : _778;
        _838 = _936;
    }
    float _938 = _838;
    float _940 = _786 * 2.0;
    float _942 = _926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_762)
    {
        bool _944 = _854 > 0.5;
        _932 = _944;
    }
    bool _946 = _932;
    float _948 = 1.0 / _800;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _954;
    out.m_47.x = _904;
    out.m_47.y = _942;
    out.m_47.z = _912;
    float _958 = _916 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _960 = _956 * _882;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _962;
    float _966 = floor(_920);
    float _968 = _756 * 2.0;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _972 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _974 = isnan(_740);
    bool _976 = _972 || _974;
    bool _978 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _980 = _976 || _978;
    float _982 = float(_980);
    float _984 = -_112;
    float _986 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[76].x, _870);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _992 = floor(_940);
    float _994 = _952 * _906;
    float _996 = _964 * _948;
    int _998 = as_type<int>(_906);
    float _1000 = _952;
    if (_762)
    {
        float _1002 = -_766;
        float _1004 = _1002 + 1.0;
        _998 = as_type<int>(_1004);
    }
    int _1006 = _998;
    float _1008 = _990 * _924;
    float _1010 = _786 + _756;
    float _1012 = as_type<float>(_1006);
    if (!_762)
    {
        _934 = _766;
    }
    float _1014 = _934;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1018 = _740 + _1016;
    float _1020 = floor(_968);
    float _1022 = _1014;
    if (_762)
    {
        float _1024 = _946 ? as_type<float>(_1006) : _766;
        _1022 = _1024;
    }
    float _1026 = _1022;
    float _1028 = _1010 + (-1.0);
    bool _1030 = _966 > 0.0;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1034 = _966 >= 0.0;
    bool _1036 = isnan(_966);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan(0.0);
    bool _1042 = _1038 || _1040;
    float _1044 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1046 = _966;
    if (!_770)
    {
        _1000 = _756;
    }
    float _1048 = _1000;
    float _1050 = _1048;
    if (!_770)
    {
        _1046 = _854;
    }
    float _1052 = _1046;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1056 = _740 + _1054;
    float _1058 = _1052;
    if (!_770)
    {
        _1012 = _854;
    }
    float _1060 = _1012;
    float _1062 = _1060;
    if (_770)
    {
        _1050 = _786;
    }
    float _1064 = _1050;
    float _1066 = fma(_914, _1056, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    if (_770)
    {
        _1058 = _756;
    }
    float _1068 = _1058;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1072 = _740 + _1070;
    if (_770)
    {
        _1062 = _756;
    }
    float _1074 = _1062;
    bool _1076 = _992 > 0.0;
    float _1078 = fma(_960, _1072, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1080 = _992 >= 0.0;
    bool _1082 = isnan(_992);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan(0.0);
    bool _1088 = _1084 || _1086;
    float _1090 = fma(_994, _1018, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1092 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _1094 = isnan(_740);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _1100 = _1096 || _1098;
    float _1102 = float(_1100);
    float _1104 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1106 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1108 = isnan(_740);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    int _1118 = _1042 ? 0 : 1;
    float _1120 = -_1102;
    float _1122 = _1120 + 1.0;
    int _1124 = _1088 ? 0 : 1;
    float _1126 = -_1116;
    float _1128 = _1126 + 1.0;
    bool _1130 = _1020 > 0.0;
    float _1132 = _1116 * _1122;
    bool _1134 = _1020 >= 0.0;
    bool _1136 = isnan(_1020);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan(0.0);
    bool _1142 = _1138 || _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1146 = _740 + _1144;
    bool _1148 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1150 = isnan(_740);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1156 = _1152 || _1154;
    float _1158 = float(_1156);
    float _1160 = _982 * _1128;
    float _1162 = -_982;
    float _1164 = _1162 + 1.0;
    float _1166 = fma(_1008, _1146, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1170 = _740 + _1168;
    float _1172 = -_1158;
    float _1174 = _1172 + 1.0;
    float _1176 = _1158 * _1164;
    bool _1178 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1180 = isnan(_740);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = fma(_996, _1170, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _1192 = _898 * _1174;
    float _1194 = -_898;
    float _1196 = _1194 + 1.0;
    float _1198 = _746 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1202 = _1188 * _1196;
    float _1204 = fma(_918, _1198, -0.5);
    float _1206 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[83].w, _970);
    float _1208 = _1066 * _1202;
    float _1210 = _764 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1216 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1218 = -_1188;
    float _1220 = _1218 + 1.0;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1226 = -_1214;
    float _1228 = fma(_1216, 2.0, _1226);
    float _1230 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1208);
    float _1232 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1032);
    float _1234 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1222);
    float _1236 = fma(_1210, _938, -0.5);
    float _1238 = fma(_1104, -2.0, _1224);
    float _1240 = fma(_1090, _1192, _1230);
    int _1242 = ~_1118;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1250 = _1246;
    if (!_1030)
    {
        int _1252 = ~_1118;
        int _1254 = _1252 + 1;
        _1250 = _1254;
    }
    int _1256 = _1250;
    float _1258 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1234);
    float _1260 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1262 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1264 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1206);
    float _1266 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1238);
    float _1268 = fma(_1078, _1176, _1240);
    float _1270 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1248);
    float _1272 = -_872;
    float _1274 = fma(_1258, _1236, _1272);
    float _1276 = fma(_1260, _852, -0.5);
    float _1278 = fma(_1262, _1026, -0.5);
    float _1280 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1232);
    float _1282 = -_112;
    float _1284 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1228);
    float _1286 = -_1266;
    float _1288 = fma(_1264, _1204, _1286);
    float _1290 = fma(_1166, _1160, _1268);
    float _1292 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1270);
    float _1294 = _928 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1298 = _958 + _1296;
    float _1300 = fma(_1280, _1278, _1284);
    float _1302 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1304 = log2(_1302);
    float _1306 = _930 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1308 = fma(_1292, _1276, _986);
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1312 = _1294 + _1310;
    float _1314 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1316 = !_858;
    int _1318 = _1316 ? 0 : 1;
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1322 = _1306 + _1320;
    float _1324 = fma(_1190, _1132, _1290);
    float _1326 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1314);
    int _1328 = abs(_1318);
    float _1330 = _1274 + 0.5;
    int _1332 = _1142 ? 0 : 1;
    float _1334 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1326);
    float _1336 = float(_1328);
    float _1338 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[120].x, _1324);
    float _1340 = float(_1256);
    float _1342 = _1298 * _1298;
    int _1344 = ~_1124;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    float _1350 = _1308 + 0.5;
    int _1352 = _1348;
    float _1354 = _1350;
    if (!_1076)
    {
        int _1356 = ~_1124;
        int _1358 = _1356 + 1;
        _1352 = _1358;
    }
    int _1360 = _1352;
    float _1362 = fma(_1312, _1312, _1342);
    int _1364 = ~_1332;
    int _1366 = _1364 + 1;
    int _1368 = _1366 + 1;
    float _1370 = _1300 + 0.5;
    int _1372 = _1368;
    if (!_1130)
    {
        int _1374 = ~_1332;
        int _1376 = _1374 + 1;
        _1372 = _1376;
    }
    int _1378 = _1372;
    float _1380 = _1336 * _1340;
    bool _1382 = _1334 >= 0.0;
    float _1384 = _1304 * _112;
    float _1386 = fma(_1322, _1322, _1362);
    float _1388 = _1288 + 0.5;
    float _1390 = exp2(_1384);
    float _1392 = in.m_49.x;
    float _1394 = in.m_49.y;
    float _1396 = in.m_49.z;
    bool _1398 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1400 = isnan(1.0);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1406 = _1402 || _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1410 = 1.0 + _1408;
    float _1412 = _708 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_51.x = _1350;
    out.m_51.y = _1330;
    out.m_51.z = _1370;
    out.m_51.w = _1388;
    float _1414 = _710 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1416 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1418 = isnan(0.0);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1424 = _1420 || _1422;
    float _1426 = rsqrt(_1386);
    int _1428 = as_type<int>(_1384);
    if (_1382)
    {
        out.m_33.x = 0.0;
    }
    float _1430 = 1.0 / _1410;
    float _1432 = -_1390;
    float _1434 = _1432 + 1.0;
    if (_1382)
    {
        _1354 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1436 = _1354;
    float _1438 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1440 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1442 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1444 = !_866;
    int _1446 = _1444 ? 0 : 1;
    if (_1382)
    {
        float _1448 = _1436 * 5.0;
        _1428 = as_type<int>(_1448);
    }
    int _1450 = _1428;
    float _1452 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1454 = !_862;
    int _1456 = _1454 ? 0 : 1;
    float _1458 = _1298 * _1426;
    float _1460 = _1424 ? _1434 : 0.0;
    if (_1382)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4244 = as_type<float>(_1450);
        out.gl_Position.z = _4244;
    }
    float _1462 = _1312 * _1426;
    out.m_53.x = _1452;
    out.m_53.y = _1438;
    out.m_53.z = _1440;
    out.m_53.w = _1442;
    if (_1382)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1464 = -_1458;
    float _1466 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[18].w, _958);
    float _1468 = _1380 * (-2.0);
    float _1470 = -_1462;
    float _1472 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1294);
    float _1474 = float(_1360);
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1478 = _1466 + _1476;
    float _1480 = _786 + (-0.5);
    float _1482 = fma(_1468, _1392, _1392);
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1486 = _1472 + _1484;
    float _1488 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_1406)
    {
        float _1490 = _1460 * _1430;
        _114 = _1490;
    }
    float _1492 = _114;
    float _1494 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1482);
    int _1496 = abs(_1456);
    float _1498 = _1322 * _1426;
    float _1500 = fma(_1044, _1468, _1044);
    float _1502 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1488);
    float _1504 = float(_1496);
    float _1506 = -_1498;
    float _1508 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1306);
    int _1510 = abs(_1446);
    float _1512 = _756 + _854;
    float _1514 = fma(_1500, _1492, _1494);
    float _1516 = _1504 * _1474;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1520 = _1508 + _1518;
    float _1522 = float(_1510);
    float _1524 = _1512 + (-1.0);
    float _1526 = _1516 * (-2.0);
    float _1528 = float(_1378);
    float _1530 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1502);
    float _1532 = _756 + (-0.5);
    float _1534 = fma(_1526, _1394, _1394);
    float _1536 = _1522 * _1528;
    float _1538 = _786 + _854;
    float _1540 = fma(_1524, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1542 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1534);
    bool _1544 = _1530 >= 0.0;
    float _1546 = _1538 + (-1.0);
    float _1548 = _1536 * (-2.0);
    float _1550 = fma(_1540, _1526, _1540);
    float _1552 = _854 + (-0.5);
    float _1554 = _1514 * 0.15915493667125701904296875;
    float _1556 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1558 = fma(_1548, _1396, _1396);
    float _1560 = fma(_1550, _1492, _1542);
    float _1562 = _1554 * 6.283185482025146484375;
    float _1564 = sin(_1562);
    float _1566 = fma(_1556, _1548, _1556);
    float _1568 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1558);
    float _1570 = _1560 * 0.15915493667125701904296875;
    float _1572 = _1556;
    int _1574 = as_type<int>(_1558);
    if (_1544)
    {
        _1572 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1576 = _1572;
    float _1578 = fma(_1566, _1492, _1568);
    if (_1544)
    {
        out.m_33.x = 0.0;
    }
    float _1580 = _1554 * 6.283185482025146484375;
    float _1582 = cos(_1580);
    if (_1544)
    {
        float _1584 = _1576 * 5.0;
        _1574 = as_type<int>(_1584);
    }
    int _1586 = _1574;
    float _1588 = -_1458;
    float _1590 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1298);
    if (_1544)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4479 = as_type<float>(_1586);
        out.gl_Position.z = _4479;
    }
    float _1592 = _1570 * 6.283185482025146484375;
    float _1594 = sin(_1592);
    float _1596 = _1570 * 6.283185482025146484375;
    float _1598 = cos(_1596);
    if (_1544)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1600 = -_958;
    float _1602 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1604 = -_1294;
    float _1606 = _1604 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1608 = -_1306;
    float _1610 = _1608 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1612 = -_1462;
    float _1614 = fma(_1612, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1312);
    float _1616 = _1602 * _1602;
    float _1618 = _1590 * _1590;
    float _1620 = _1578 * 0.15915493667125701904296875;
    float _1622 = -_1498;
    float _1624 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1322);
    float _1626 = fma(_1606, _1606, _1616);
    float _1628 = fma(_1614, _1614, _1618);
    float _1630 = _1620 * 6.283185482025146484375;
    float _1632 = sin(_1630);
    float _1634 = _1564 * _1594;
    float _1636 = fma(_1610, _1610, _1626);
    float _1638 = fma(_1624, _1624, _1628);
    float _1640 = _1582 * _1598;
    float _1642 = in.m_55.x;
    float _1644 = in.m_55.y;
    float _1646 = in.m_55.z;
    float _1648 = _702 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1650 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1652 = rsqrt(_1636);
    float _1654 = sqrt(_1638);
    float _1656 = fma(_1632, _1640, _1634);
    float _1658 = fma(_1632, _1634, _1640);
    float _1660 = _1606 * _1652;
    float _1662 = _1610 * _1652;
    float _1664 = _1602 * _1652;
    float _1666 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1668 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1670 = _1660 * _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1674 = _1662 * _1672;
    float _1676 = _1620 * 6.283185482025146484375;
    float _1678 = cos(_1676);
    float _1680 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1682 = -_1670;
    float _1684 = fma(_1662, _1680, _1682);
    float _1686 = _1426 * _1654;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1690 = _1664 * _1688;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1694 = -_1674;
    float _1696 = fma(_1664, _1692, _1694);
    float _1698 = _1684 * _1684;
    float _1700 = _1686 * _1666;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1704 = -_1690;
    float _1706 = fma(_1660, _1702, _1704);
    float _1708 = _1686 * _1648;
    float _1710 = fma(_1696, _1696, _1698);
    float _1712 = _1686 * _1650;
    float _1714 = _1582 * _1594;
    float _1716 = fma(_1706, _1706, _1710);
    float _1718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1644);
    float _1720 = _1564 * _1598;
    float _1722 = rsqrt(_1716);
    float _1724 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1642);
    float _1726 = _1700 * _1718;
    float _1728 = -_1714;
    float _1730 = fma(_1632, _1720, _1728);
    float _1732 = -_1720;
    float _1734 = fma(_1632, _1714, _1732);
    float _1736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1646);
    float _1738 = _1678 * _1726;
    float _1740 = -_1726;
    float _1742 = _1632 * _1740;
    float _1744 = _1708 * _1724;
    float _1746 = _1712 * _1736;
    float _1748 = _1582 * _1738;
    float _1750 = _1598 * _1678;
    float _1752 = _1564 * _1738;
    float _1754 = _1594 * _1678;
    float _1756 = fma(_1656, _1744, _1748);
    float _1758 = fma(_1750, _1744, _1742);
    float _1760 = _1696 * _1722;
    float _1762 = _1684 * _1722;
    float _1764 = fma(_1734, _1746, _1756);
    float _1766 = _1706 * _1722;
    float _1768 = _1664 * _1760;
    float _1770 = _1662 * _1762;
    float _1772 = fma(_1730, _1744, _1752);
    float _1774 = fma(_1754, _1746, _1758);
    float _1776 = -_1768;
    float _1778 = fma(_1660, _1762, _1776);
    float _1780 = -_1770;
    float _1782 = fma(_1664, _1766, _1780);
    float _1784 = fma(_1658, _1746, _1772);
    float _1786 = _1778 * _1764;
    float _1788 = _1782 * _1764;
    float _1790 = fma(_1766, _1774, _1786);
    float _1792 = fma(_1760, _1774, _1788);
    float _1794 = fma(_1662, _1784, _1790);
    float _1796 = fma(_1660, _1784, _1792);
    float _1798 = _1660 * _1766;
    float _1800 = _1306 + _1794;
    float _1802 = _1294 + _1796;
    float _1804 = -_1798;
    float _1806 = fma(_1662, _1760, _1804);
    float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1810 = _1800 + _1808;
    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1814 = _1802 + _1812;
    float _1816 = _1806 * _1764;
    float _1818 = _1810 * _1810;
    float _1820 = fma(_1762, _1774, _1816);
    float _1822 = fma(_1814, _1814, _1818);
    float _1824 = fma(_1664, _1784, _1820);
    float _1826 = sqrt(_1822);
    float _1828 = _958 + _1824;
    bool _1830 = _1826 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1832 = _1794;
    float _1834 = _1802;
    float _1836 = _1800;
    if (!_1830)
    {
        _1832 = _1828;
    }
    float _1838 = _1832;
    bool _1840 = !_1830;
    float _1842 = _1838;
    if (!_1840)
    {
        float _1844 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1848 = _1826 + _1846;
        float _1850 = rsqrt(_1822);
        float _1852 = _1848 * _1844;
        float _1854 = _1828 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1856 = _1852 * 0.15915493667125701904296875;
        float _1858 = _1856 * 6.283185482025146484375;
        float _1860 = cos(_1858);
        float _1862 = _1856 * 6.283185482025146484375;
        float _1864 = sin(_1862);
        float _1866 = _1860 + (-1.0);
        float _1868 = _1866 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1870 = fma(_1864, _1854, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1872 = fma(_1828, _1860, _1868);
        float _1874 = _1850 * _1870;
        float _1876 = fma(_1814, _1874, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1878 = fma(_1810, _1874, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1842 = _1872;
        _1834 = _1876;
        _1836 = _1878;
    }
    float _1880 = _1842;
    float _1882 = _1834;
    float _1884 = _1836;
    float _1886 = -_1458;
    float _1888 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1880);
    float _1890 = -_1462;
    float _1892 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1882);
    float _1894 = -_1498;
    float _1896 = fma(_1894, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1884);
    float _1898 = _1888 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1900 = _1888 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1902 = _1888 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1904 = _1888 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1906 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1898);
    float _1908 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1900);
    float _1910 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1902);
    float _1912 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1904);
    float _1914 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1906);
    float _1916 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1908);
    float _1918 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1910);
    float _1920 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1912);
    float _1922 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1924 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1926 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1928 = _1920 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1930 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1932 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1934 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1936 = _1922 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1938 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1930);
    float _1940 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1932);
    float _1942 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1934);
    float _1944 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1936);
    float _1946 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1938);
    float _1948 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1940);
    float _1950 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1942);
    float _1952 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1944);
    float _1954 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1946);
    float _1956 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1948);
    float _1958 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1950);
    float _1960 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1952);
    float _1962 = _1954 + _1956;
    float _1964 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1966 = _1962 * 0.5;
    out.m_33.x = _1964;
    out.gl_Position.x = _1958;
    out.gl_Position.y = _1960;
    out.gl_Position.z = _1954;
    out.gl_Position.w = _1956;
    out.m_57.z = _1966;
    out.m_57.w = _1956;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

